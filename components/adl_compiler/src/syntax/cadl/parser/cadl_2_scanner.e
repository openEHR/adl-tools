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
--|#line 83 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 83")
end
-- Ignore separators
when 2 then
--|#line 84 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 84")
end
in_lineno := in_lineno + text_count
when 3 then
--|#line 89 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 89")
end
-- Ignore comments
when 4 then
--|#line 90 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 90")
end
in_lineno := in_lineno + 1
when 5 then
--|#line 94 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 94")
end
last_token := Minus_code
when 6 then
--|#line 95 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 95")
end
last_token := Plus_code
when 7 then
--|#line 96 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 96")
end
last_token := Star_code
when 8 then
--|#line 97 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 97")
end
last_token := Slash_code
when 9 then
--|#line 98 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 98")
end
last_token := Caret_code
when 10 then
--|#line 99 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 99")
end
last_token := Equal_code
when 11 then
--|#line 100 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 100")
end
last_token := Dot_code
when 12 then
--|#line 101 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 101")
end
last_token := Semicolon_code
when 13 then
--|#line 102 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 102")
end
last_token := Comma_code
when 14 then
--|#line 103 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 103")
end
last_token := Colon_code
when 15 then
--|#line 104 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 104")
end
last_token := Exclamation_code
when 16 then
--|#line 105 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 105")
end
last_token := Left_parenthesis_code
when 17 then
--|#line 106 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 106")
end
last_token := Right_parenthesis_code
when 18 then
--|#line 107 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 107")
end
last_token := Dollar_code
when 19 then
--|#line 109 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 109")
end
last_token := Question_mark_code
when 20 then
--|#line 111 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 111")
end
last_token := SYM_INTERVAL_DELIM
when 21 then
--|#line 113 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 113")
end
last_token := Left_bracket_code
when 22 then
--|#line 114 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 114")
end
last_token := Right_bracket_code
when 23 then
--|#line 116 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 116")
end
last_token := SYM_START_CBLOCK
when 24 then
--|#line 117 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 117")
end
last_token := SYM_END_CBLOCK
when 25 then
--|#line 119 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 119")
end
last_token := SYM_GE
when 26 then
--|#line 120 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 120")
end
last_token := SYM_LE
when 27 then
--|#line 121 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 121")
end
last_token := SYM_NE
when 28 then
--|#line 123 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 123")
end
last_token := SYM_LT
when 29 then
--|#line 124 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 124")
end
last_token := SYM_GT
when 30 then
--|#line 126 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 126")
end
last_token := SYM_MODULO
when 31 then
--|#line 127 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 127")
end
last_token := SYM_DIV
when 32 then
--|#line 129 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 129")
end
last_token := SYM_ELLIPSIS
when 33 then
--|#line 130 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 130")
end
last_token := SYM_LIST_CONTINUE
when 34 then
--|#line 134 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 134")
end
last_token := SYM_MATCHES
when 35 then
--|#line 136 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 136")
end
last_token := SYM_MATCHES
when 36 then
--|#line 140 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 140")
end
last_token := SYM_THEN
when 37 then
--|#line 142 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 142")
end
last_token := SYM_ELSE
when 38 then
--|#line 144 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 144")
end
last_token := SYM_AND
when 39 then
--|#line 146 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 146")
end
last_token := SYM_OR
when 40 then
--|#line 148 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 148")
end
last_token := SYM_XOR
when 41 then
--|#line 150 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 150")
end
last_token := SYM_NOT
when 42 then
--|#line 152 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 152")
end
last_token := SYM_IMPLIES
when 43 then
--|#line 154 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 154")
end
last_token := SYM_TRUE
when 44 then
--|#line 156 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 156")
end
last_token := SYM_FALSE
when 45 then
--|#line 158 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 158")
end
last_token := SYM_FORALL
when 46 then
--|#line 160 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 160")
end
last_token := SYM_EXISTS
when 47 then
--|#line 164 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 164")
end
last_token := SYM_EXISTENCE
when 48 then
--|#line 166 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 166")
end
last_token := SYM_OCCURRENCES
when 49 then
--|#line 168 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 168")
end
last_token := SYM_CARDINALITY
when 50 then
--|#line 170 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 170")
end
last_token := SYM_ORDERED
when 51 then
--|#line 172 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 172")
end
last_token := SYM_UNORDERED
when 52 then
--|#line 174 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 174")
end
last_token := SYM_UNIQUE
when 53 then
--|#line 176 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 176")
end
last_token := SYM_USE_NODE
when 54 then
--|#line 178 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 178")
end
last_token := SYM_USE_ARCHETYPE
when 55 then
--|#line 180 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 180")
end
last_token := SYM_ALLOW_ARCHETYPE
when 56 then
--|#line 182 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 182")
end
last_token := SYM_INCLUDE
when 57 then
--|#line 184 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 184")
end
last_token := SYM_EXCLUDE
when 58 then
--|#line 186 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 186")
end
last_token := SYM_AFTER
when 59 then
--|#line 188 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 188")
end
last_token := SYM_BEFORE
when 60 then
--|#line 190 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 190")
end
last_token := SYM_CLOSED
when 61 then
--|#line 193 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 193")
end

		last_token := V_ROOT_ID_CODE
		last_string_value := text_substring (2, text_count - 1)
	
when 62 then
--|#line 199 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 199")
end

		last_token := V_ID_CODE
		last_string_value := text_substring (2, text_count - 1)
	
when 63 then
--|#line 205 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 205")
end

		last_token := V_ID_CODE_STR
		last_string_value := text
	
when 64 then
--|#line 211 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 211")
end

		last_token := V_VALUE_SET_REF
		last_string_value := text_substring (2, text_count - 1)
	
when 65 then
--|#line 217 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 217")
end

		last_token := V_VALUE_DEF
		last_string_value := text_substring (2, text_count - 1)
	
when 66 then
--|#line 223 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 223")
end

		last_token := V_VALUE_SET_REF_ASSUMED
		last_string_value := text_substring (2, text_count - 1)
		last_string_value.prune_all(' ')
		last_string_value.prune_all('%T')
	
when 67 then
--|#line 231 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 231")
end

		last_token := V_ARCHETYPE_OPEN_REF
		last_string_value := text_substring (2, text_count - 1)
		last_string_value.prune_all(' ')
		last_string_value.prune_all('%T')
	
when 68, 69, 70 then
--|#line 240 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 240")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
when 71, 72 then
--|#line 249 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 249")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
when 73, 74 then
--|#line 257 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 257")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
when 75, 76 then
--|#line 265 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 265")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
when 77 then
--|#line 278 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 278")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
when 78 then
--|#line 288 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 288")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text_substring(2, text_count)
			
when 79 then
--|#line 293 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 293")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
when 80 then
--|#line 303 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 303")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
				last_string_value.put('T', last_string_value.index_of(' ', 1))
			
when 81 then
--|#line 309 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 309")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
when 82 then
--|#line 320 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 320")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN_ERR
				unread_character(last_string_value.item(last_string_value.count)) -- put back the last character 
				last_string_value := text
			
when 83 then
--|#line 329 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 329")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
when 84 then
--|#line 335 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 335")
end

				last_string_value := text
				if is_primitive_type (last_string_value) then
					last_token := V_PRIMITIVE_TYPE_ID
				else
					last_token := V_TYPE_ID
				end
			
when 85 then
--|#line 345 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 345")
end

					last_token := V_GENERIC_TYPE_ID
					last_string_value := text
			
when 86 then
--|#line 351 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 351")
end

					last_token := V_FEATURE_CALL_ID
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
when 87 then
--|#line 358 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 358")
end

					last_token := V_ATTRIBUTE_ID
					last_string_value := text
			
when 88 then
--|#line 364 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 364")
end
		-- matches an absolute path string with segments of form "/attr_name" or "/attr_name[id-code]"
			last_token := V_ABS_PATH
			last_string_value := text
		
when 89 then
--|#line 370 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 370")
end
		-- matches a relative path string with segments of form "/attr_name" or "/attr_name[id-code]"
			last_token := V_REL_PATH
			last_string_value := text
		
when 90 then
--|#line 376 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 376")
end

			last_token := V_URI
			last_string_value := text
		
when 91 then
--|#line 382 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 382")
end

			last_token := SYM_START_CBLOCK
			set_start_condition (IN_REGEXP1)
			in_buffer.append_character ('/')
		
when 92 then
--|#line 389 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 389")
end
 		-- match segment consisting of non / or [
				in_buffer.append_string (text)
	
when 93 then
--|#line 393 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 393")
end
 		-- match [] segment
				in_buffer.append_string (text)
	
when 94 then
--|#line 397 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 397")
end
 		-- match segment ending in quoted slashes '\/'
				in_buffer.append_string (text)
	
when 95 then
--|#line 401 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 401")
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
--|#line 413 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 413")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
when 97 then
--|#line 420 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 420")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
when 98 then
--|#line 425 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 425")
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
--|#line 440 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 440")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
when 101, 102, 103 then
--|#line 445 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 445")
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
--|#line 481 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 481")
end

		set_start_condition (IN_EXPANDED_VALUE_SET_DEF)
		create last_term_constraint_parse_structure_value.make
		str_ := text_substring (2, text_count)
		last_term_constraint_parse_structure_value.set_terminology_id (str_.substring (1, str_.index_of (':', 1)-1))
		is_assumed_code := False
	
when 105 then
--|#line 490 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 490")
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
--|#line 505 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 505")
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
--|#line 520 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 520")
end
in_lineno := in_lineno + text_count
when 108 then
--|#line 523 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 523")
end

when 109 then
--|#line 526 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 526")
end
in_lineno := in_lineno + 1
when 110 then
--|#line 528 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 528")
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
	
when 111 then
--|#line 551 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 551")
end
	-- Catch-all rules (no backing up)
			last_token := ERR_VALUE_SET_DEF
			set_start_condition (INITIAL)
	
when 112 then
--|#line 561 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 561")
end

		last_token := ERR_VALUE_SET_MISSING_CODES
		err_str := text
	
when 113 then
--|#line 577 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 577")
end

		set_start_condition (IN_EXTERNAL_VALUE_SET_DEF)
		create last_term_constraint_parse_structure_value.make
		str_ := text_substring (2, text_count)
		last_term_constraint_parse_structure_value.set_terminology_id (str_.substring (1, str_.index_of (':', 1)-1))
		is_assumed_code := False
	
when 114 then
--|#line 586 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 586")
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
	
when 115 then
--|#line 601 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 601")
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
	
when 116 then
--|#line 616 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 616")
end
in_lineno := in_lineno + text_count
when 117 then
--|#line 619 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 619")
end

when 118 then
--|#line 622 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 622")
end
in_lineno := in_lineno + 1
when 119 then
--|#line 624 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 624")
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
	
when 120 then
--|#line 647 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 647")
end
	-- Catch-all rules (no backing up)
			last_token := ERR_VALUE_SET_DEF
			set_start_condition (INITIAL)
	
when 121 then
--|#line 659 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 659")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
when 122 then
--|#line 664 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 664")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
when 123 then
--|#line 672 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 672")
end
in_buffer.append_character ('\')
when 124 then
--|#line 674 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 674")
end
in_buffer.append_character ('"')
when 125 then
--|#line 676 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 676")
end

				in_buffer.append_string (text)
	
when 126 then
--|#line 680 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 680")
end
in_buffer.append_string (text)
when 127 then
--|#line 682 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 682")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
when 128 then
--|#line 687 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 687")
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
			
when 129 then
--|#line 698 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 698")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
when 130 then
--|#line 706 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 706")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
when 131 then
--|#line 708 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 708")
end
last_token := V_CHARACTER; last_character_value := '%N'
when 132 then
--|#line 709 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 709")
end
last_token := V_CHARACTER; last_character_value := '%R'
when 133 then
--|#line 710 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 710")
end
last_token := V_CHARACTER; last_character_value := '%T'
when 134 then
--|#line 711 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 711")
end
last_token := V_CHARACTER; last_character_value := '%''
when 135 then
--|#line 712 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 712")
end
last_token := V_CHARACTER; last_character_value := '%H'
when 136, 137 then
--|#line 714 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 714")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
when 138 then
--|#line 719 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 719")
end
;
when 139 then
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
--|#line 718 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 718")
end
terminate
when 1 then
--|#line 699 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 699")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
when 3 then
--|#line 552 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 552")
end
	-- Catch-all rules (no backing up)
			last_token := ERR_VALUE_SET_DEF
			set_start_condition (INITIAL)
	
when 4 then
--|#line 648 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 648")
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
			create an_array.make_filled (0, 0, 3841)
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
			an_array.area.fill_with (979, 3750, 3841)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			    0,   13,   14,   13,   13,   15,   16,   17,   18,   19,
			   20,   21,   22,   23,   24,   25,   26,   27,   27,   27,
			   28,   28,   28,   29,   30,   31,   32,   33,   34,   35,
			   36,   37,   38,   39,   40,   38,   41,   42,   38,   43,
			   44,   45,   46,   38,   38,   38,   47,   48,   38,   49,
			   50,   38,   51,   52,   53,   54,   12,   55,   56,   57,
			   58,   59,   60,   58,   61,   62,   58,   63,   64,   65,
			   58,   58,   58,   58,   66,   67,   58,   58,   68,   69,
			   70,   71,   72,   12,   12,   12,   12,   12,   12,   12,
			   12,   12,   12,   74,   83,  104,   83,   75,   74,  615,

			  615,  119,   75,   87,   88,   89,   87,   87,   88,   89,
			   87,   98,  311,   98,   98,  217,   90,  135,  119,  107,
			   90,  108,  108,  108,  108,  108,  108,  119,  119,  130,
			   84,   85,   84,   85,  119,  119,  184,  120,  145,  124,
			  105,  121,  123,  122,   76,  135,  146,  152,  125,   76,
			  216,  238,  216,  216,  238,  153,  154,  130,   98,   91,
			   98,   98,  218,   91,  185,  120,  145,  124,  138,  121,
			  123,  122,  949,  279,  146,  119,  125,  119,   77,   78,
			   79,   80,   81,   77,   78,   79,   80,   81,   93,   94,
			   95,   93,   92,   92,   92,   92,   92,   92,   92,   92, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   92,   96,   97,   92,   97,   97,   97,   97,   97,   97,
			   92,   92,   92,   92,   92,   92,   97,   97,   97,   97,
			   97,   97,   97,   97,   97,   97,   97,   97,   97,   97,
			   97,   97,   97,   97,   97,   97,   97,   97,   97,   92,
			   92,   92,   92,   97,   97,   97,   97,   97,   97,   97,
			   97,   97,   97,   97,   97,   97,   97,   97,   97,   97,
			   97,   97,   97,   97,   97,   97,   97,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			  111,  305,  112,  305,  113,  113,  113,  113,  113,  113,
			  111,  119,  112,  119,  115,  115,  115,  115,  115,  115,

			  119,  193,  119,  119,  126,  119,  128,  131,  132,  134,
			  195,  119,  180,  133,  209,  127,  305,  136,  129,  149,
			  211,  948,  215,  114,  181,  150,  648,  309,  119,  194,
			  137,  870,  126,  114,  128,  131,  132,  134,  196,  215,
			  182,  133,  210,  147,  127,  136,  129,  149,  148,  212,
			  170,  160,  183,  308,  150,  160,  197,  160,  137,  138,
			  139,  139,  139,  139,  139,  139,  176,  215,  119,  198,
			  215,  147,  201,  871,  229,  140,  148,  177,  171,  166,
			  202,  205,  141,  166,  199,  166,  206,  313,  314,  142,
			  119,  143,  119,  144,  178,  119,  172,  200,  259,  270, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  203,  160,  220,  140,  271,  173,  179,  160,  204,  207,
			  141,  230,  231,  940,  208,  313,  314,  219,  219,  219,
			  143,  282,  144,  157,  174,  119,  157,  270,  215,  166,
			  110,  158,  271,  175,  260,  166,  215,  110,  159,  160,
			  160,  160,  160,  160,  160,  161,  222,  222,  221,  221,
			  221,  160,  160,  160,  160,  160,  162,  160,  160,  160,
			  163,  160,  164,  160,  160,  160,  160,  160,  160,  160,
			  160,  160,  160,  160,  165,  225,  315,  232,  160,  166,
			  166,  166,  166,  166,  167,  166,  166,  166,  168,  166,
			  169,  166,  166,  166,  166,  166,  166,  166,  166,  166,

			  166,  166,  157,  931,  315,  157,  223,  223,  223,  119,
			  158,  226,  227,  226,  227,  119,  220,  159,  160,  160,
			  160,  160,  160,  160,  161,  915,  280,  313,  269,  914,
			  160,  160,  160,  160,  160,  160,  160,  160,  160,  160,
			  160,  160,  160,  160,  160,  160,  160,  160,  160,  160,
			  160,  160,  160,  165,  280,  318,  269,  160,  166,  166,
			  166,  166,  166,  166,  166,  166,  166,  166,  166,  166,
			  166,  166,  166,  166,  166,  166,  166,  166,  166,  166,
			  166,  186,  187,  233,  138,  241,  233,  188,  241,  241,
			  892,  893,  241,  119,  119,  119,  157,  242,  243,  157, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  909,  242,  189,  119,  158,  906,  119,  248,  244,  190,
			  191,  119,  244,  272,  292,  192,  249,  249,  249,  249,
			  249,  249,  273,  274,  256,  256,  256,  256,  256,  256,
			  261,  261,  261,  261,  261,  261,  304,  365,  245,  234,
			  257,  272,  245,  262,  262,  262,  262,  262,  262,  902,
			  273,  274,  250,  266,  266,  266,  266,  266,  266,  263,
			  119,  895,  896,  258,  119,  304,  365,  251,  257,  119,
			  111,  252,  112,  253,  264,  264,  264,  264,  264,  264,
			  265,  268,  277,  278,  111,  305,  112,  263,  264,  264,
			  264,  264,  264,  264,  119,  119,  119,  119,  119,  238,

			  275,  281,  238,  979,  285,  119,  276,  119,  563,  268,
			  277,  278,  286,  114,  138,  302,  564,  283,  284,  288,
			  119,  306,  890,  119,  225,  314,  289,  114,  275,  281,
			  140,  119,  285,  118,  276,  290,  307,  291,  365,  138,
			  286,  119,  299,  302,  292,  283,  284,  288,  119,  297,
			  303,  315,  298,  319,  289,  140,  321,  305,  140,  321,
			  226,  227,  323,  324,  290,  138,  291,  366,  323,  292,
			  299,  143,  242,  119,  119,  242,  777,  297,  303,  320,
			  298,  140,  119,  140,  321,  300,  324,  322,  141,  301,
			  323,  324,  327,  449,  327,  292,  325,  143,  119,  333, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  143,  138,  293,  293,  293,  293,  293,  293,  334,  140,
			  119,  333,  328,  300,  326,  334,  141,  301,  329,  328,
			  327,  294,  330,  338,  295,  329,  143,  333,  339,  338,
			  296,  216,  244,  216,  216,  244,  334,  119,  339,  335,
			  328,  345,  345,  336,  347,  347,  329,  331,  349,  294,
			  350,  338,  295,  332,  349,  350,  339,  343,  296,  979,
			  341,  342,  342,  342,  342,  342,  344,  215,  418,  345,
			  346,  721,  347,  348,  233,  215,  349,  233,  350,  435,
			  864,  119,  351,  352,  215,  917,  918,  215,  353,  354,
			  353,  354,  215,  160,  160,  160,  160,  160,  160,  160,

			  160,  160,  160,  160,  160,  160,  160,  160,  160,  160,
			  160,  160,  160,  160,  160,  160,  353,  354,  355,  356,
			  357,  359,  357,  359,  358,  363,  358,  363,  562,  563,
			  234,  254,  232,  254,  254,  863,  229,  564,  376,  378,
			  379,  379,  379,  379,  379,  219,  219,  219,  357,  359,
			  360,  362,  358,  363,  361,  364,  367,  368,  369,  370,
			  371,  496,  219,  219,  219,  372,  372,  372,  226,  227,
			  373,  373,  373,  230,  231,  230,  231,  241,  241,  159,
			  241,  241,  387,  388,  388,  388,  388,  388,  388,  242,
			  242,  396,  396,  396,  396,  396,  396,  394,  374,  394, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  244,  244,  395,  395,  395,  395,  395,  395,  399,  399,
			  399,  399,  399,  399,  403,  450,  403,  892,  893,  404,
			  404,  404,  404,  404,  404,  406,  406,  406,  406,  406,
			  245,  245,  381,  382,  380,  381,  380,  380,  380,  380,
			  380,  380,  380,  380,  383,  243,  243,  380,  243,  243,
			  243,  243,  243,  243,  380,  384,  380,  380,  380,  380,
			  243,  243,  243,  243,  243,  243,  243,  243,  243,  243,
			  243,  243,  243,  243,  243,  243,  243,  243,  243,  243,
			  243,  243,  243,  380,  380,  385,  380,  243,  243,  243,
			  243,  243,  243,  243,  243,  243,  243,  243,  243,  243,

			  243,  243,  243,  243,  243,  243,  243,  243,  243,  243,
			  243,  380,  380,  380,  380,  380,  380,  380,  380,  380,
			  380,  380,  380,  380,  393,  393,  393,  393,  393,  393,
			  400,  400,  400,  400,  400,  400,  119,  895,  896,  498,
			  257,  119,  498,  111,  409,  112,  401,  405,  405,  405,
			  405,  405,  405,  407,  407,  407,  407,  407,  407,  119,
			  119,  413,  119,  258,  119,  119,  119,  119,  257,  402,
			  414,  412,  409,  119,  401,  410,  411,  119,  415,  419,
			  119,  119,  119,  423,  119,  452,  114,  416,  424,  413,
			  419,  119,  422,  417,  420,  421,  543,  119,  414,  412, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  419,  605,  437,  410,  411,  425,  415,  119,  857,  606,
			  119,  423,  426,  452,  500,  416,  424,  500,  419,  852,
			  422,  417,  420,  421,  427,  427,  427,  427,  427,  427,
			  437,  119,  119,  425,  428,  428,  428,  428,  428,  428,
			  138,  439,  119,  429,  429,  429,  429,  429,  429,  119,
			  438,  119,  138,  426,  118,  118,  118,  118,  118,  118,
			  119,  119,  430,  426,  430,  979,  119,  119,  436,  296,
			  453,  452,  426,  453,  458,  295,  458,  460,  438,  461,
			  460,  296,  434,  461,  464,  431,  465,  466,  432,  464,
			  465,  440,  552,  466,  433,  552,  436,  296,  453,  456,

			  119,  457,  458,  295,  459,  460,  119,  461,  462,  296,
			  434,  463,  464,  431,  465,  466,  432,  467,  468,  470,
			  440,  469,  433,  442,  443,  443,  443,  443,  443,  305,
			  444,  445,  445,  445,  445,  445,  305,  446,  447,  448,
			  448,  448,  448,  305,  470,  312,  473,  470,  474,  475,
			  215,  473,  474,  479,  479,  481,  476,  419,  342,  342,
			  342,  342,  342,  342,  482,  481,  482,  485,  419,  486,
			  485,  486,  472,  489,  473,  490,  474,  475,  419,  477,
			  478,  479,  480,  481,  489,  490,  494,  494,  215,  611,
			  215,  257,  482,  483,  484,  485,  419,  486,  487,  488, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  215,  489,  119,  490,  215,  604,  119,  215,  497,  619,
			  562,  497,  492,  493,  258,  494,  495,  119,  522,  257,
			  498,  497,  499,  119,  497,  520,  119,  119,  219,  219,
			  219,  500,  159,  498,  532,  499,  519,  379,  379,  379,
			  379,  379,  379,  119,  500,  521,  522,  527,  381,  382,
			  114,  381,  383,  382,  520,  383,  384,  382,  620,  384,
			  383,  501,  532,  824,  519,  823,  221,  221,  221,  222,
			  222,  384,  119,  521,  501,  527,  917,  918,  223,  223,
			  223,  783,  219,  219,  219,  219,  219,  219,  387,  388,
			  388,  388,  388,  388,  388,  395,  395,  395,  395,  395,

			  395,  385,  502,  502,  502,  502,  502,  502,  504,  504,
			  504,  504,  504,  504,  507,  507,  507,  507,  507,  507,
			  508,  508,  508,  508,  508,  508,  511,  511,  511,  511,
			  511,  511,  560,  561,  780,  560,  401,  509,  774,  509,
			  773,  503,  510,  510,  510,  510,  510,  510,  404,  404,
			  404,  404,  404,  404,  804,  804,  804,  804,  441,  402,
			  560,  441,  561,  567,  401,  512,  512,  512,  512,  512,
			  512,  514,  515,  119,  516,  516,  516,  516,  516,  516,
			  517,  517,  517,  517,  517,  517,  518,  518,  518,  518,
			  518,  518,  119,  119,  119,  524,  528,  119,  119,  119, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_nxt_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  523,  119,  526,  119,  513,  119,  119,  528,  538,  529,
			  541,  544,  540,  569,  525,  569,  531,  528,  533,  538,
			  530,  542,  534,  524,  604,  605,  722,  119,  523,  538,
			  526,  119,  119,  606,  723,  528,  547,  529,  541,  547,
			  540,  569,  525,  570,  531,  119,  533,  538,  530,  542,
			  534,  293,  293,  293,  293,  293,  293,  119,  549,  119,
			  427,  427,  427,  427,  427,  427,  305,  539,  119,  428,
			  428,  428,  428,  428,  428,  288,  429,  429,  429,  429,
			  429,  429,  535,  535,  535,  535,  535,  535,  119,  305,
			  780,  290,  643,  780,  119,  539,  561,  550,  289,  760,

			  118,  259,  571,  288,  536,  536,  536,  536,  536,  536,
			  752,  572,  119,  537,  537,  537,  537,  537,  537,  545,
			  290,  119,  545,  557,  551,  568,  289,  551,  571,  118,
			  571,  545,  551,  546,  545,  551,  552,  572,  553,  572,
			  575,  305,  547,  544,  552,  546,  305,  443,  443,  443,
			  443,  443,  443,  305,  547,  549,  573,  445,  445,  445,
			  445,  445,  445,  305,  159,  574,  721,  722,  575,  727,
			  316,  551,  548,  316,  551,  723,  397,  554,  576,  397,
			  575,  819,  576,  552,  548,  555,  720,  448,  448,  448,
			  448,  448,  448,  305,  550,  551,  562,  563,  551,  565, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_nxt_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  566,  566,  566,  566,  566,  564,  576,  552,  577,  553,
			  578,  448,  448,  448,  448,  448,  448,  305,  579,  580,
			  820,  579,  582,  583,  556,  584,  585,  586,  586,  586,
			  586,  586,  582,  583,  589,  589,  591,  592,  591,  592,
			  595,  596,  595,  597,  596,  119,  579,  580,  554,  581,
			  582,  583,  623,  584,  598,  545,  657,  718,  545,  119,
			  587,  588,  589,  590,  591,  592,  593,  594,  595,  596,
			  599,  597,  600,  497,  777,  778,  497,  712,  547,  119,
			  623,  119,  598,  779,  657,  498,  378,  601,  601,  601,
			  601,  601,  883,  883,  883,  119,  500,  602,  602,  602,

			  602,  602,  602,  603,  603,  603,  603,  603,  603,  393,
			  393,  393,  393,  393,  393,  604,  605,  778,  607,  608,
			  608,  608,  608,  608,  606,  779,  501,  609,  609,  609,
			  609,  609,  609,  513,  657,  659,  503,  510,  510,  510,
			  510,  510,  510,  401,  610,  610,  610,  610,  610,  610,
			  612,  612,  612,  612,  612,  612,  613,  613,  613,  613,
			  613,  613,  658,  659,  119,  558,  402,  616,  558,  616,
			  689,  401,  614,  614,  614,  614,  614,  614,  617,  622,
			  119,  503,  119,  611,  609,  609,  609,  609,  609,  609,
			  621,  119,  660,  627,  515,  513,  516,  516,  516,  516, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_nxt_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  516,  516,  119,  119,  119,  119,  618,  622,  119,  624,
			  632,  625,  629,  631,  119,  630,  728,  119,  621,  728,
			  660,  627,  633,  626,  535,  535,  535,  535,  535,  535,
			  753,  476,  787,  753,  119,  787,  638,  624,  632,  625,
			  629,  631,  636,  630,  537,  537,  537,  537,  537,  537,
			  633,  626,  634,  430,  659,  430,  635,  536,  536,  536,
			  536,  536,  536,  119,  638,  119,  118,  635,  119,  660,
			  636,  637,  640,  799,  651,  825,  799,  635,  825,  432,
			  634,  663,  661,  640,  639,  433,  442,  642,  642,  642,
			  642,  642,  305,  641,  118,  635,  654,  662,  651,  637,

			  444,  644,  644,  644,  644,  644,  305,  432,  650,  663,
			  119,  640,  639,  433,  446,  646,  646,  646,  646,  646,
			  305,  446,  647,  646,  646,  646,  646,  305,  562,  655,
			  663,  669,  670,  664,  664,  562,  655,  564,  566,  566,
			  566,  566,  566,  566,  564,  665,  665,  476,  671,  586,
			  586,  586,  586,  586,  586,  670,  671,  674,  666,  669,
			  670,  664,  667,  674,  676,  677,  676,  677,  656,  680,
			  681,  682,  683,  665,  668,  656,  671,  680,  681,  628,
			  119,  119,  119,  672,  673,  674,  701,  604,  690,  111,
			  543,  675,  676,  677,  678,  679,  606,  680,  681,  682, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_nxt_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  683,  497,  543,  559,  497,  684,  685,  686,  686,  686,
			  686,  686,  686,  498,  701,  499,  119,  601,  601,  601,
			  601,  601,  601,  877,  500,  604,  690,  691,  608,  608,
			  608,  608,  608,  608,  606,  609,  609,  609,  609,  609,
			  609,  693,  693,  693,  693,  693,  693,  118,  118,  119,
			  118,  692,  877,  118,  501,  694,  694,  694,  694,  694,
			  694,  853,  119,  119,  853,  691,  695,  695,  695,  695,
			  695,  695,  696,  696,  696,  696,  696,  696,  704,  692,
			  611,  697,  697,  697,  697,  697,  697,  698,  698,  698,
			  698,  698,  698,  699,  699,  699,  699,  699,  700,  700,

			  700,  700,  700,  700,  119,  119,  704,  119,  702,  706,
			  119,  119,  119,  703,  263,  119,  119,  119,  708,  119,
			  705,  119,  716,  710,  711,  714,  706,  119,  715,  717,
			  706,  707,  709,  716,  726,  713,  702,  731,  731,  733,
			  717,  703,  263,  717,  854,  408,  708,  854,  705,  655,
			  717,  710,  711,  714,  706,  545,  715,  564,  545,  707,
			  709,  716,  726,  713,  734,  731,  732,  733,  717,  546,
			  506,  642,  642,  642,  642,  642,  642,  305,  547,  549,
			  382,  644,  644,  644,  644,  644,  644,  305,  656,  733,
			  382,  375,  734,  551,  721,  722,  551,  724,  725,  725, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_nxt_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  725,  725,  725,  723,  491,  552,  491,  553,  548,  646,
			  646,  646,  646,  646,  646,  305,  551,  735,  550,  551,
			  729,  730,  730,  730,  730,  730,  734,  737,  552,  738,
			  555,  739,  646,  646,  646,  646,  646,  646,  305,  738,
			  739,  476,  742,  742,  744,  745,  554,  744,  745,  748,
			  749,  750,  748,  872,  736,  737,  872,  738,  471,  739,
			  602,  602,  602,  602,  602,  602,  471,  740,  741,  556,
			  742,  743,  744,  745,  455,  746,  747,  748,  749,  750,
			  751,  754,  755,  755,  755,  755,  755,  756,  759,  756,
			  451,  441,  757,  757,  757,  757,  757,  757,  757,  757,

			  757,  757,  757,  757,  758,  758,  758,  758,  758,  758,
			  119,  402,  119,  119,  408,  398,  759,  613,  613,  613,
			  613,  613,  613,  761,  761,  761,  761,  761,  761,  762,
			  762,  762,  762,  762,  762,  119,  119,  611,  763,  763,
			  763,  763,  763,  763,  119,  767,  119,  769,  765,  119,
			  766,  119,  119,  786,  759,  764,  789,  770,  789,  772,
			  979,  768,  767,  771,  769,  392,  767,  791,  769,  775,
			  776,  776,  776,  776,  776,  391,  765,  402,  766,  721,
			  784,  786,  759,  764,  789,  770,  790,  772,  723,  768,
			  767,  771,  769,  721,  784,  791,  725,  725,  725,  725, yy_Dummy>>,
			1, 200, 2400)
		end

	yy_nxt_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  725,  725,  723,  655,  791,  730,  730,  730,  730,  730,
			  730,  564,  793,  793,  690,  795,  796,  797,  795,  785,
			  390,  690,  606,  755,  755,  755,  755,  755,  755,  606,
			  389,  386,  792,  785,  757,  757,  757,  757,  757,  757,
			  793,  794,  656,  795,  796,  797,  798,  757,  757,  757,
			  757,  757,  757,  691,  801,  801,  801,  801,  801,  801,
			  691,  802,  240,  802,  377,  235,  803,  803,  803,  803,
			  803,  803,  805,  805,  805,  805,  805,  805,  806,  807,
			  806,  807,  809,  809,  809,  809,  809,  809,  119,  119,
			  119,  119,  814,  119,  810,  119,  813,  237,  759,  812,

			  815,  811,  817,  816,  818,  828,  817,  830,  818,  814,
			  374,  830,  454,  814,  375,  454,  374,  808,  454,  927,
			  928,  402,  810,  817,  813,  818,  759,  812,  815,  811,
			  832,  816,  832,  828,  817,  830,  818,  814,  819,  831,
			  776,  776,  776,  776,  776,  776,  826,  827,  827,  827,
			  827,  827,  834,  834,  836,  837,  836,  215,  832,  929,
			  833,  803,  803,  803,  803,  803,  803,  840,  840,  840,
			  840,  840,  840,  505,  340,  856,  505,  820,  340,  505,
			  834,  835,  836,  837,  838,  841,  841,  841,  841,  841,
			  841,  618,  618,  618,  618,  618,  618,  842,  842,  842, yy_Dummy>>,
			1, 200, 2600)
		end

	yy_nxt_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  842,  842,  842,  856,  119,  119,  611,  843,  843,  843,
			  843,  843,  843,  844,  844,  844,  844,  844,  844,  119,
			  119,  858,  858,  849,  337,  846,  848,  849,  847,  759,
			  845,  775,  851,  851,  851,  851,  851,  784,  850,  119,
			  279,  860,  850,  860,  849,  723,  862,  866,  317,  858,
			  859,  312,  402,  846,  848,  849,  847,  759,  845,  850,
			  784,  310,  827,  827,  827,  827,  827,  827,  723,  860,
			  850,  861,  156,  119,  862,  866,  785,  801,  801,  801,
			  801,  801,  801,  865,  865,  865,  865,  865,  865,  844,
			  844,  844,  844,  844,  844,  806,  119,  806,  867,  785,

			  843,  843,  843,  843,  843,  843,  119,  819,  875,  851,
			  851,  851,  851,  851,  851,  877,  611,  879,  119,  879,
			  881,  869,  305,  119,  891,  894,  868,  867,  884,  884,
			  884,  884,  884,  884,  808,  887,  875,  287,  119,  885,
			  886,  119,  907,  887,  878,  879,  820,  880,  255,  881,
			  869,  888,  891,  894,  868,  904,  887,  254,  247,  888,
			  897,  897,  897,  897,  897,  897,  898,  885,  886,  119,
			  907,  887,  888,  808,  808,  808,  808,  808,  808,  919,
			  119,  900,  901,  910,  904,  910,  913,  888,  899,  900,
			  901,  932,  102,   99,  911,  898,  920,  920,  920,  920, yy_Dummy>>,
			1, 200, 2800)
		end

	yy_nxt_template_16 (an_array: ARRAY [INTEGER])
			-- Fill chunk #16 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  920,  920,  900,  901,  945,  240,  945,  919,  921,  921,
			  921,  921,  921,  921,  913,  946,  899,  900,  901,  932,
			  237,  236,  912,  922,  922,  922,  922,  922,  922,  923,
			  923,  923,  923,  923,  119,  925,  926,  955,  955,  955,
			  955,  955,  924,  947,  235,  215,  925,  926,  933,  213,
			  920,  920,  920,  920,  920,  920,  925,  926,  934,  156,
			  921,  921,  921,  921,  921,  921,  649,  927,  928,  649,
			  924,  119,  649,  937,  925,  926,  935,  935,  935,  935,
			  935,  935,  117,  116,  937,  938,  109,  656,  936,  936,
			  936,  936,  936,  936,  937,  106,  938,  691,  941,  941,

			  941,  941,  941,  941,  110,  110,  938,  929,  110,  110,
			  102,  110,  937,  942,  942,  942,  942,  942,  942,  100,
			   99,  979,  979,  979,  938,  943,  943,  943,  943,  943,
			  943,  944,  944,  944,  944,  944,  944,  950,  950,  950,
			  950,  950,  950,  951,  979,  941,  941,  941,  941,  941,
			  941,  952,  979,  942,  942,  942,  942,  942,  942,  953,
			  979,  943,  943,  943,  943,  943,  943,  912,  912,  912,
			  912,  912,  912,  954,  954,  954,  954,  954,  954,  956,
			  957,  958,  785,  950,  950,  950,  950,  950,  950,  652,
			  656,  979,  652,  979,  979,  652,  956,  957,  691,  979, yy_Dummy>>,
			1, 200, 3000)
		end

	yy_nxt_template_17 (an_array: ARRAY [INTEGER])
			-- Fill chunk #17 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  956,  957,  959,  959,  959,  959,  959,  959,  960,  960,
			  960,  960,  960,  960,  961,  961,  961,  961,  961,  961,
			  929,  964,  965,  979,  956,  957,  962,  962,  962,  962,
			  962,  962,  963,  963,  963,  963,  963,  963,  964,  965,
			  979,  979,  964,  965,  966,  966,  966,  966,  966,  966,
			  967,  979,  959,  959,  959,  959,  959,  959,  960,  960,
			  960,  960,  960,  960,  979,  979,  964,  965,  961,  961,
			  961,  961,  961,  961,  968,  968,  968,  968,  968,  968,
			  969,  970,  969,  970,  979,  979,  311,  311,  979,  785,
			  311,  311,  979,  311,  972,  656,  966,  966,  966,  966,

			  966,  966,  979,  979,  979,  691,  973,  973,  973,  973,
			  973,  973,  947,  947,  947,  947,  947,  947,  979,  971,
			  974,  974,  974,  974,  974,  974,  975,  975,  975,  975,
			  975,  975,  979,  929,  976,  976,  976,  976,  976,  976,
			  973,  973,  973,  973,  973,  973,  977,  977,  977,  977,
			  977,  977,  969,  979,  969,  979,  979,  975,  975,  975,
			  975,  975,  975,  976,  976,  976,  976,  976,  976,  978,
			  978,  978,  978,  978,  978,  979,  979,  785,  971,  971,
			  971,  971,  971,  971,  979,  151,  979,  151,  979,  151,
			  653,  971,  151,  653,  979,  151,  653,  979,  979,  979, yy_Dummy>>,
			1, 200, 3200)
		end

	yy_nxt_template_18 (an_array: ARRAY [INTEGER])
			-- Fill chunk #18 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  929,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,  101,
			  979,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  979,  101,  101,  103,  979,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  155,  979,  155,  155,  155,  155,  155,  155,  155,
			  155,  155,  155,  155,  155,  155,  155,  214,  979,  214,

			  214,  214,  214,  214,  214,  214,  214,  214,  214,  214,
			  979,  214,  214,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  228,
			  228,  228,  228,  228,  228,  228,  228,  228,  228,  228,
			  228,  228,  228,  228,  228,  239,  687,  239,  979,  687,
			  979,  239,  687,  239,  979,  688,  239,  979,  688,  239,
			  246,  688,  246,  246,  246,  246,  246,  246,  246,  246,
			  246,  246,  246,  246,  246,  246,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  267,  979,  979,  267,  267,  267,  267,  979, yy_Dummy>>,
			1, 200, 3400)
		end

	yy_nxt_template_19 (an_array: ARRAY [INTEGER])
			-- Fill chunk #19 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  979,  267,  226,  226,  226,  226,  226,  226,  226,  979,
			  226,  226,  226,  226,  226,  226,  226,  226,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  236,  236,  236,  236,  236,  236,
			  236,  236,  236,  236,  236,  236,  236,  236,  236,  236,
			  380,  380,  380,  380,  380,  380,  380,  380,  380,  380,
			  380,  380,  380,  380,  380,  380,  451,  451,  979,  979,
			  451,  451,  451,  451,  451,  979,  645,  451,  645,  719,
			  451,  451,  719,  781,  979,  719,  781,  645,  782,  781,
			  645,  782,  788,  800,  782,  788,  800,  821,  788,  800,

			  821,  822,  829,  821,  822,  829,  839,  822,  829,  839,
			  855,  873,  839,  855,  873,  874,  855,  873,  874,  876,
			  882,  874,  876,  882,  889,  876,  882,  889,  903,  905,
			  889,  903,  905,  908,  903,  905,  908,  916,  930,  908,
			  916,  930,  939,  916,  930,  939,  979,  979,  939,   11, yy_Dummy>>,
			1, 150, 3600)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 3841)
			an_array.put (0, 0)
			an_array.area.fill_with (1, 1, 92)
			yy_chk_template_1 (an_array)
			an_array.area.fill_with (9, 188, 279)
			yy_chk_template_2 (an_array)
			yy_chk_template_3 (an_array)
			yy_chk_template_4 (an_array)
			yy_chk_template_5 (an_array)
			an_array.area.fill_with (243, 1032, 1123)
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
			an_array.area.fill_with (979, 3749, 3841)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    3,    5,   18,    6,    3,    4,  514,  514,   44,    4,
			    7,    7,    7,    7,    8,    8,    8,    8,   13,  997,
			   13,   13,   76,    7,   44,   41,   25,    8,   25,   25,
			   25,   25,   25,   25,   47,   35,   41,    5,    5,    6,
			    6,   36,   37,   61,   35,   47,   37,   18,   35,   36,
			   35,    3,   44,   47,   51,   37,    4,   74,   93,   74,
			   74,   93,   51,   51,   41,   98,    7,   98,   98,   76,
			    8,   61,   35,   47,   37,  296,   35,   36,   35,  938,
			  130,   47,  130,   37,  296,    3,    3,    3,    3,    3,
			    4,    4,    4,    4,    4, yy_Dummy>>,
			1, 95, 93)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   27,  154,   27,  557,   27,   27,   27,   27,   27,   27,
			   28,   39,   28,   42,   28,   28,   28,   28,   28,   28,
			   50,   63,   40,   49,   39,   43,   40,   42,   42,   43,
			   64,   45,   60,   42,   68,   39,  153,   45,   40,   49,
			   69,  937,   78,   27,   60,   50,  557,  154,   48,   63,
			   45,  849,   39,   28,   40,   42,   42,   43,   64,   77,
			   60,   42,   68,   48,   39,   45,   40,   49,   48,   69,
			   56,   56,   60,  153,   50,   56,   65,   56,   45,   46,
			   46,   46,   46,   46,   46,   46,   59,   80,   46,   65,
			   79,   48,   66,  849,   84,   46,   48,   59,   56,   56,

			   66,   67,   46,   56,   65,   56,   67,  162,  163,   46,
			  133,   46,  122,   46,   59,  123,   57,   65,  110,  122,
			   66,   57,   78,   46,  123,   57,   59,   57,   66,   67,
			   46,   84,   84,  928,   67,  162,  163,   77,   77,   77,
			   46,  133,   46,   55,   57,  924,   55,  122,   81,   57,
			  985,   55,  123,   57,  110,   57,  368,  985,   55,   55,
			   55,   55,   55,   55,   55,   55,   80,   80,   79,   79,
			   79,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   82,  164,   85,   55,   55, yy_Dummy>>,
			1, 200, 280)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   58,  918,  164,   58,   81,   81,   81,  131,
			   58,   82,   82,   85,   85,  121,  368,   58,   58,   58,
			   58,   58,   58,   58,   58,  901,  131,  167,  121,  900,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,  131,  167,  121,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,

			   58,   62,   62,   87,  140,   96,   87,   62,   96,   97,
			  876,  876,   97,  140,  124,  899,  157,   96,   96,  157,
			  896,   97,   62,  126,  157,  893,  125,  105,   96,   62,
			   62,  150,   97,  124,  140,   62,  105,  105,  105,  105,
			  105,  105,  125,  126,  108,  108,  108,  108,  108,  108,
			  111,  111,  111,  111,  111,  111,  150,  211,   96,   87,
			  108,  124,   97,  112,  112,  112,  112,  112,  112,  889,
			  125,  126,  105,  114,  114,  114,  114,  114,  114,  112,
			  120,  882,  882,  108,  129,  150,  211,  105,  108,  128,
			  113,  105,  113,  105,  113,  113,  113,  113,  113,  113, yy_Dummy>>,
			1, 200, 480)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  113,  120,  128,  129,  115,  152,  115,  112,  115,  115,
			  115,  115,  115,  115,  127,  132,  134,  135,  136,  238,
			  127,  132,  238,  139,  136,  137,  127,  148,  653,  120,
			  128,  129,  137,  113,  143,  148,  653,  134,  135,  139,
			  146,  152,  874,  143,  224,  168,  139,  115,  127,  132,
			  143,  149,  136,  139,  127,  139,  152,  139,  212,  141,
			  137,  145,  146,  148,  143,  134,  135,  139,  141,  145,
			  149,  169,  145,  168,  139,  141,  170,  309,  143,  171,
			  224,  224,  172,  173,  139,  144,  139,  212,  174,  141,
			  146,  141,  242,  147,  144,  242,  873,  145,  149,  169,

			  145,  144,  868,  141,  170,  147,  175,  171,  144,  147,
			  172,  173,  176,  309,  178,  144,  174,  144,  867,  180,
			  141,  142,  142,  142,  142,  142,  142,  142,  181,  144,
			  142,  182,  177,  147,  175,  183,  144,  147,  177,  179,
			  176,  142,  178,  186,  142,  179,  144,  180,  187,  190,
			  142,  216,  244,  216,  216,  244,  181,  278,  191,  182,
			  177,  193,  194,  183,  195,  196,  177,  179,  197,  142,
			  198,  186,  142,  179,  199,  200,  187,  190,  142,  160,
			  189,  189,  189,  189,  189,  189,  191,  220,  278,  193,
			  194,  855,  195,  196,  233,  219,  197,  233,  198,  298, yy_Dummy>>,
			1, 200, 680)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  841,  298,  199,  200,  221,  903,  903,  222,  201,  202,
			  203,  204,  223,  160,  160,  160,  160,  160,  160,  160,
			  160,  160,  160,  160,  160,  160,  160,  160,  160,  160,
			  160,  160,  160,  160,  160,  160,  201,  202,  203,  204,
			  205,  206,  207,  208,  205,  209,  207,  210,  454,  454,
			  233,  254,  227,  254,  254,  839,  228,  454,  230,  237,
			  237,  237,  237,  237,  237,  220,  220,  220,  205,  206,
			  207,  208,  205,  209,  207,  210,  219,  219,  219,  219,
			  219,  374,  221,  221,  221,  222,  222,  222,  227,  227,
			  223,  223,  223,  228,  228,  230,  230,  239,  241,  311,

			  239,  241,  249,  249,  249,  249,  249,  249,  249,  239,
			  241,  258,  258,  258,  258,  258,  258,  257,  374,  257,
			  239,  241,  257,  257,  257,  257,  257,  257,  261,  261,
			  261,  261,  261,  261,  263,  311,  263,  905,  905,  263,
			  263,  263,  263,  263,  263,  265,  265,  265,  265,  265,
			  239,  241, yy_Dummy>>,
			1, 152, 880)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  256,  256,  256,  256,  256,  256,  262,  262,  262,  262,
			  262,  262,  268,  908,  908,  498,  256,  273,  498,  264,
			  268,  264,  262,  264,  264,  264,  264,  264,  264,  266,
			  266,  266,  266,  266,  266,  269,  271,  273,  274,  256,
			  272,  275,  285,  276,  256,  262,  274,  272,  268,  277,
			  262,  269,  271,  283,  275,  279,  282,  280,  281,  283,
			  300,  313,  264,  276,  285,  273,  279,  288,  282,  277,
			  280,  281,  440,  286,  274,  272,  279,  688,  300,  269,
			  271,  286,  275,  440,  829,  688,  302,  283,  288,  313,
			  500,  276,  285,  500,  279,  821,  282,  277,  280,  281,

			  289,  289,  289,  289,  289,  289,  300,  301,  289,  286,
			  290,  290,  290,  290,  290,  290,  295,  302,  290,  291,
			  291,  291,  291,  291,  291,  295,  301,  291,  294,  289,
			  292,  292,  292,  292,  292,  292,  299,  294,  293,  290,
			  293,  293,  304,  297,  299,  295,  314,  318,  291,  319,
			  321,  294,  322,  323,  301,  324,  325,  294,  297,  326,
			  327,  293,  328,  329,  293,  330,  331,  304,  552,  332,
			  293,  552,  299,  295,  314,  318,  815,  319,  321,  294,
			  322,  323,  812,  324,  325,  294,  297,  326,  327,  293,
			  328,  329,  293,  330,  331,  333,  304,  332,  293,  306, yy_Dummy>>,
			1, 200, 1124)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  306,  306,  306,  306,  306,  306,  307,  307,  307,  307,
			  307,  307,  307,  308,  308,  308,  308,  308,  308,  308,
			  335,  337,  338,  333,  339,  340,  367,  343,  344,  345,
			  346,  349,  342,  337,  342,  342,  342,  342,  342,  342,
			  350,  351,  352,  353,  337,  354,  355,  356,  335,  357,
			  338,  358,  339,  340,  337,  343,  344,  345,  346,  349,
			  360,  361,  365,  366,  369,  801,  370,  393,  350,  351,
			  352,  353,  337,  354,  355,  356,  371,  357,  410,  358,
			  372,  800,  412,  373,  378,  518,  788,  378,  360,  361,
			  393,  365,  366,  409,  412,  393,  378,  379,  378,  423,

			  379,  410,  411,  520,  367,  367,  367,  378,  785,  379,
			  423,  379,  409,  379,  379,  379,  379,  379,  379,  418,
			  379,  411,  412,  418,  381,  381,  518,  381,  383,  383,
			  410,  383,  384,  384,  520,  384,  381,  378,  423,  781,
			  409,  779,  369,  369,  369,  370,  370,  381,  772,  411,
			  379,  418,  930,  930,  371,  371,  371,  723,  372,  372,
			  372,  373,  373,  373,  388,  388,  388,  388,  388,  388,
			  388,  394,  394,  394,  394,  394,  394,  381,  395,  395,
			  395,  395,  395,  395,  396,  396,  396,  396,  396,  396,
			  399,  399,  399,  399,  399,  399,  400,  400,  400,  400, yy_Dummy>>,
			1, 200, 1324)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  400,  400,  402,  402,  402,  402,  402,  402,  452,  453,
			  720,  456,  400,  401,  717,  401,  716,  395,  401,  401,
			  401,  401,  401,  401,  403,  403,  403,  403,  403,  403,
			  760,  760,  760,  760,  441,  400,  452,  441,  453,  456,
			  400,  404,  404,  404,  404,  404,  404,  405,  405,  415,
			  405,  405,  405,  405,  405,  405,  406,  406,  406,  406,
			  406,  406,  407,  407,  407,  407,  407,  407,  413,  416,
			  417,  415,  419,  420,  421,  424,  413,  422,  417,  425,
			  404,  438,  439,  419,  435,  420,  439,  441,  438,  458,
			  416,  459,  422,  419,  424,  435,  421,  439,  425,  415,

			  505,  505,  782,  711,  413,  435,  417,  709,  708,  505,
			  782,  419,  547,  420,  439,  547,  438,  458,  416,  459,
			  422,  437,  424,  435,  421,  439,  425,  426,  426,  426,
			  426,  426,  426,  707,  444,  426,  427,  427,  427,  427,
			  427,  427,  444,  437,  427,  428,  428,  428,  428,  428,
			  428,  427,  429,  429,  429,  429,  429,  429,  430,  430,
			  430,  430,  430,  430,  705,  449,  780,  427,  547,  780,
			  703,  437,  457,  444,  429,  697,  428,  691,  460,  427,
			  431,  431,  431,  431,  431,  431,  687,  461,  431,  432,
			  432,  432,  432,  432,  432,  442,  427,  432,  442,  449, yy_Dummy>>,
			1, 200, 1524)
		end

	yy_chk_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  446,  457,  429,  446,  462,  428,  460,  443,  551,  442,
			  443,  551,  446,  463,  446,  461,  465,  442,  442,  780,
			  551,  443,  446,  443,  443,  443,  443,  443,  443,  443,
			  443,  445,  462,  445,  445,  445,  445,  445,  445,  445,
			  656,  463,  649,  649,  465,  652,  998,  447,  442,  998,
			  447,  649, 1002,  446,  466, 1002,  468,  775,  469,  447,
			  443,  447,  648,  447,  447,  447,  447,  447,  447,  447,
			  445,  448,  455,  455,  448,  455,  455,  455,  455,  455,
			  455,  455,  466,  448,  468,  448,  469,  448,  448,  448,
			  448,  448,  448,  448,  470,  471,  775,  472,  473,  474,

			  447,  475,  476,  476,  476,  476,  476,  476,  477,  478,
			  479,  480,  481,  482,  483,  484,  489,  490,  492,  491,
			  493,  523,  470,  471,  448,  472,  473,  474,  523,  475,
			  491,  545,  569,  643,  545,  636,  477,  478,  479,  480,
			  481,  482,  483,  484,  489,  490,  492,  491,  493,  497,
			  719,  719,  497,  635,  545,  626,  523,  623,  491,  719,
			  569,  497,  499,  499,  499,  499,  499,  499,  864,  864,
			  864,  621,  497,  502,  502,  502,  502,  502,  502,  503,
			  503,  503,  503,  503,  503,  504,  504,  504,  504,  504,
			  504,  506,  506,  822,  506,  506,  506,  506,  506,  506, yy_Dummy>>,
			1, 200, 1724)
		end

	yy_chk_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  506,  822,  497,  508,  508,  508,  508,  508,  508,  613,
			  570,  571,  502,  509,  509,  509,  509,  509,  509,  508,
			  510,  510,  510,  510,  510,  510,  511,  511,  511,  511,
			  511,  511,  512,  512,  512,  512,  512,  512,  570,  571,
			  522, 1007,  508,  517, 1007,  517,  606,  508,  513,  513,
			  513,  513,  513,  513,  517,  522,  527,  602,  521,  510,
			  515,  515,  515,  515,  515,  515,  521,  533,  572,  527,
			  516,  512,  516,  516,  516,  516,  516,  516,  524,  525,
			  529,  532,  517,  522,  530,  524,  533,  525,  529,  532,
			  534,  530, 1016,  541,  521, 1016,  572,  527,  534,  525,

			  535,  535,  535,  535,  535,  535, 1017,  585, 1020, 1017,
			  539, 1020,  541,  524,  533,  525,  529,  532,  539,  530,
			  537,  537,  537,  537,  537,  537,  534,  525,  535,  536,
			  573,  536,  538,  536,  536,  536,  536,  536,  536,  540,
			  541,  536,  537,  538,  542,  574,  539,  540,  543, 1022,
			  568, 1026, 1022,  538, 1026,  536,  535,  575,  573,  543,
			  542,  536,  546,  546,  546,  546,  546,  546,  546,  543,
			  537,  538,  564,  574,  561,  540,  549,  549,  549,  549,
			  549,  549,  549,  536,  559,  575,  531,  543,  542,  536,
			  553,  553,  553,  553,  553,  553,  553,  555,  555,  555, yy_Dummy>>,
			1, 200, 1924)
		end

	yy_chk_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  555,  555,  555,  555,  565,  565,  577,  580,  582,  576,
			  578,  566,  566,  565,  566,  566,  566,  566,  566,  566,
			  566,  576,  578,  586,  583,  586,  586,  586,  586,  586,
			  586,  587,  588,  589,  577,  580,  582,  576,  578,  590,
			  591,  592,  593,  594,  565,  595,  596,  597,  598,  576,
			  578,  566,  583,  599,  600,  528,  526,  519,  620,  587,
			  588,  589,  620,  607,  607,  507,  495,  590,  591,  592,
			  593,  594,  607,  595,  596,  597,  598,  601,  494,  450,
			  601,  599,  600,  603,  603,  603,  603,  603,  603,  601,
			  620,  601,  436,  601,  601,  601,  601,  601,  601,  858,

			  601,  608,  608,  607,  608,  608,  608,  608,  608,  608,
			  608,  609,  609,  609,  609,  609,  609,  610,  610,  610,
			  610,  610,  610,  986,  986,  434,  986,  609,  858,  986,
			  601,  611,  611,  611,  611,  611,  611, 1029,  433,  625,
			 1029,  608,  612,  612,  612,  612,  612,  612,  614,  614,
			  614,  614,  614,  614,  625,  609,  610,  615,  615,  615,
			  615,  615,  615,  616,  616,  616,  616,  616,  616,  617,
			  617,  617,  617,  617,  619,  619,  619,  619,  619,  619,
			  622,  624,  625,  627,  622,  628,  630,  629,  631,  624,
			  619,  632,  637,  633,  630,  638,  627,  639,  640,  632, yy_Dummy>>,
			1, 200, 2124)
		end

	yy_chk_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  633,  638,  628,  414,  639,  641,  628,  629,  631,  640,
			  651,  637,  622,  659,  661,  663,  641,  624,  619,  640,
			 1030,  408,  630, 1030,  627,  729,  641,  632,  633,  638,
			  628,  642,  639,  729,  642,  629,  631,  640,  651,  637,
			  664,  659,  661,  663,  641,  642,  398,  642,  642,  642,
			  642,  642,  642,  642,  642,  644,  385,  644,  644,  644,
			  644,  644,  644,  644,  729,  666,  380,  376,  664,  646,
			  650,  650,  646,  650,  650,  650,  650,  650,  650,  650,
			  362,  646,  359,  646,  642,  646,  646,  646,  646,  646,
			  646,  646,  647,  666,  644,  647,  655,  655,  655,  655,

			  655,  655,  667,  669,  647,  670,  647,  671,  647,  647,
			  647,  647,  647,  647,  647,  672,  673,  341,  674,  675,
			  676,  677,  646,  678,  679,  681,  682,  683,  685, 1032,
			  667,  669, 1032,  670,  336,  671,  686,  686,  686,  686,
			  686,  686,  334,  672,  673,  647,  674,  675,  676,  677,
			  317,  678,  679,  681,  682,  683,  685,  690,  690,  690,
			  690,  690,  690,  692,  695,  692,  312,  305,  692,  692,
			  692,  692,  692,  692,  693,  693,  693,  693,  693,  693,
			  694,  694,  694,  694,  694,  694,  303,  695,  284,  270,
			  267,  260,  695,  696,  696,  696,  696,  696,  696,  698, yy_Dummy>>,
			1, 200, 2324)
		end

	yy_chk_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  698,  698,  698,  698,  698,  699,  699,  699,  699,  699,
			  699,  702,  701,  693,  700,  700,  700,  700,  700,  700,
			  704,  706,  710,  712,  702,  713,  704,  715,  714,  726,
			  700,  701,  731,  713,  732,  715,  259,  710,  706,  714,
			  712,  253,  706,  734,  712,  718,  718,  718,  718,  718,
			  718,  252,  702,  700,  704,  724,  724,  726,  700,  701,
			  731,  713,  732,  715,  724,  710,  706,  714,  712,  725,
			  725,  734,  725,  725,  725,  725,  725,  725,  725,  730,
			  736,  730,  730,  730,  730,  730,  730,  730,  744,  746,
			  754,  748,  749,  750,  751,  724,  251,  755,  754,  755,

			  755,  755,  755,  755,  755,  755,  250,  248,  736,  725,
			  756,  756,  756,  756,  756,  756,  744,  746,  730,  748,
			  749,  750,  751,  757,  757,  757,  757,  757,  757,  754,
			  758,  758,  758,  758,  758,  758,  755,  759,  240,  759,
			  236,  235,  759,  759,  759,  759,  759,  759,  761,  761,
			  761,  761,  761,  761,  762,  762,  762,  762,  763,  763,
			  763,  763,  763,  763,  764,  765,  768,  766,  769,  770,
			  764,  771,  768,  234,  763,  766,  770,  765,  773,  771,
			  774,  786,  773,  789,  774,  769,  231,  790, 1004,  769,
			  229, 1004,  226,  762, 1004,  916,  916,  763,  764,  773, yy_Dummy>>,
			1, 200, 2524)
		end

	yy_chk_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  768,  774,  763,  766,  770,  765,  791,  771,  792,  786,
			  773,  789,  774,  769,  776,  790,  776,  776,  776,  776,
			  776,  776,  784,  784,  784,  784,  784,  784,  793,  794,
			  795,  796,  798,  214,  791,  916,  792,  802,  802,  802,
			  802,  802,  802,  803,  803,  803,  803,  803,  803, 1006,
			  192,  828, 1006,  776,  188, 1006,  793,  794,  795,  796,
			  798,  804,  804,  804,  804,  804,  804,  805,  805,  805,
			  805,  805,  805,  806,  806,  806,  806,  806,  806,  828,
			  811,  816,  803,  807,  807,  807,  807,  807,  807,  809,
			  809,  809,  809,  809,  809,  810,  813,  830,  831,  817,

			  185,  811,  816,  817,  813,  809,  810,  819,  819,  819,
			  819,  819,  819,  826,  818,  845,  184,  834,  818,  835,
			  817,  826,  837,  845,  165,  830,  831,  161,  809,  811,
			  816,  817,  813,  809,  810,  818,  827,  158,  827,  827,
			  827,  827,  827,  827,  827,  834,  818,  835,  155,  846,
			  837,  845,  826,  840,  840,  840,  840,  840,  840,  842,
			  842,  842,  842,  842,  842,  844,  844,  844,  844,  844,
			  844,  843,  848,  843,  846,  827,  843,  843,  843,  843,
			  843,  843,  847,  851,  856,  851,  851,  851,  851,  851,
			  851,  859,  840,  860,  866,  861,  862,  848,  151,  869, yy_Dummy>>,
			1, 200, 2724)
		end

	yy_chk_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  875,  881,  847,  846,  865,  865,  865,  865,  865,  865,
			  843,  870,  856,  138,  118,  866,  869,  885,  894,  870,
			  859,  860,  851,  861,  107,  862,  848,  871,  875,  881,
			  847,  891,  870,  106,  103,  871,  883,  883,  883,  883,
			  883,  883,  885,  866,  869,  898,  894,  870,  871,  884,
			  884,  884,  884,  884,  884,  904,  886,  887,  888,  897,
			  891,  897,  898,  871,  886,  887,  888,  919,  101,   99,
			  897,  885,  906,  906,  906,  906,  906,  906,  887,  888,
			  936,   94,  936,  904,  909,  909,  909,  909,  909,  909,
			  898,  936,  886,  887,  888,  919,   91,   90,  897,  910,

			  910,  910,  910,  910,  910,  911,  911,  911,  911,  911,
			  913,  914,  915,  946,  946,  946,  946,  946,  913,  936,
			   88,   73,  914,  915,  920,   70,  920,  920,  920,  920,
			  920,  920,  914,  915,  921,   54,  921,  921,  921,  921,
			  921,  921, 1010,  939,  939, 1010,  913,   38, 1010,  925,
			  914,  915,  922,  922,  922,  922,  922,  922,   33,   31,
			  925,  926,   26,  920,  923,  923,  923,  923,  923,  923,
			  925,   24,  926,  921,  931,  931,  931,  931,  931,  931,
			  995,  995,  926,  939,  995,  995,   16,  995,  925,  933,
			  933,  933,  933,  933,  933,   15,   14,   11,    0,    0, yy_Dummy>>,
			1, 200, 2924)
		end

	yy_chk_template_16 (an_array: ARRAY [INTEGER])
			-- Fill chunk #16 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  926,  934,  934,  934,  934,  934,  934,  935,  935,  935,
			  935,  935,  935,  940,  940,  940,  940,  940,  940,  941,
			    0,  941,  941,  941,  941,  941,  941,  942,    0,  942,
			  942,  942,  942,  942,  942,  943,    0,  943,  943,  943,
			  943,  943,  943,  944,  944,  944,  944,  944,  944,  945,
			  945,  945,  945,  945,  945,  948,  949,  950,  941,  950,
			  950,  950,  950,  950,  950, 1011,  942,    0, 1011,    0,
			    0, 1011,  948,  949,  943,    0,  948,  949,  951,  951,
			  951,  951,  951,  951,  952,  952,  952,  952,  952,  952,
			  953,  953,  953,  953,  953,  953,  950,  956,  957,    0,

			  948,  949,  954,  954,  954,  954,  954,  954,  955,  955,
			  955,  955,  955,  955,  956,  957,    0,    0,  956,  957,
			  958,  958,  958,  958,  958,  958,  959,    0,  959,  959,
			  959,  959,  959,  959,  960,  960,  960,  960,  960,  960,
			    0,    0,  956,  957,  961,  961,  961,  961,  961,  961,
			  962,  962,  962,  962,  962,  962,  963,  963,  963,  963,
			    0,    0, 1003, 1003,    0,  959, 1003, 1003,    0, 1003,
			  966,  960,  966,  966,  966,  966,  966,  966,    0,    0,
			    0,  961,  967,  967,  967,  967,  967,  967,  968,  968,
			  968,  968,  968,  968,    0,  963,  969,  969,  969,  969, yy_Dummy>>,
			1, 200, 3124)
		end

	yy_chk_template_17 (an_array: ARRAY [INTEGER])
			-- Fill chunk #17 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  969,  969,  970,  970,  970,  970,  970,  970,    0,  966,
			  972,  972,  972,  972,  972,  972,  973,  973,  973,  973,
			  973,  973,  974,  974,  974,  974,  974,  974,  975,    0,
			  975,    0,    0,  975,  975,  975,  975,  975,  975,  976,
			  976,  976,  976,  976,  976,  977,  977,  977,  977,  977,
			  977,    0,    0,  973,  978,  978,  978,  978,  978,  978,
			    0,  987,    0,  987,    0,  987, 1012,  975,  987, 1012,
			    0,  987, 1012,    0,    0,    0,  976,  980,  980,  980,
			  980,  980,  980,  980,  980,  980,  980,  980,  980,  980,
			  980,  980,  980,  981,  981,  981,  981,  981,  981,  981,

			  981,  981,  981,  981,  981,  981,  981,  981,  981,  982,
			  982,  982,  982,  982,  982,  982,  982,  982,  982,  982,
			  982,  982,  982,  982,  982,  983,    0,  983,  983,  983,
			  983,  983,  983,  983,  983,  983,  983,  983,    0,  983,
			  983,  984,    0,  984,  984,  984,  984,  984,  984,  984,
			  984,  984,  984,  984,  984,  984,  984,  988,    0,  988,
			  988,  988,  988,  988,  988,  988,  988,  988,  988,  988,
			  988,  988,  988,  989,    0,  989,  989,  989,  989,  989,
			  989,  989,  989,  989,  989,  989,    0,  989,  989,  990,
			  990,  990,  990,  990,  990,  990,  990,  990,  990,  990, yy_Dummy>>,
			1, 200, 3324)
		end

	yy_chk_template_18 (an_array: ARRAY [INTEGER])
			-- Fill chunk #18 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  990,  990,  990,  990,  990,  991,  991,  991,  991,  991,
			  991,  991,  991,  991,  991,  991,  991,  991,  991,  991,
			  991,  992, 1013,  992,    0, 1013,    0,  992, 1013,  992,
			    0, 1014,  992,    0, 1014,  992,  993, 1014,  993,  993,
			  993,  993,  993,  993,  993,  993,  993,  993,  993,  993,
			  993,  993,  994,  994,  994,  994,  994,  994,  994,  994,
			  994,  994,  994,  994,  994,  994,  994,  994,  996,    0,
			    0,  996,  996,  996,  996,    0,    0,  996,  999,  999,
			  999,  999,  999,  999,  999,    0,  999,  999,  999,  999,
			  999,  999,  999,  999, 1000, 1000, 1000, 1000, 1000, 1000,

			 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000,
			 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001,
			 1001, 1001, 1001, 1001, 1001, 1001, 1005, 1005, 1005, 1005,
			 1005, 1005, 1005, 1005, 1005, 1005, 1005, 1005, 1005, 1005,
			 1005, 1005, 1008, 1008,    0,    0, 1008, 1008, 1008, 1008,
			 1008,    0, 1009, 1008, 1009, 1015, 1008, 1008, 1015, 1018,
			    0, 1015, 1018, 1009, 1019, 1018, 1009, 1019, 1021, 1023,
			 1019, 1021, 1023, 1024, 1021, 1023, 1024, 1025, 1027, 1024,
			 1025, 1027, 1028, 1025, 1027, 1028, 1031, 1033, 1028, 1031,
			 1033, 1034, 1031, 1033, 1034, 1035, 1036, 1034, 1035, 1036, yy_Dummy>>,
			1, 200, 3524)
		end

	yy_chk_template_19 (an_array: ARRAY [INTEGER])
			-- Fill chunk #19 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1037, 1035, 1036, 1037, 1038, 1039, 1037, 1038, 1039, 1040,
			 1038, 1039, 1040, 1041, 1042, 1040, 1041, 1042, 1043, 1041,
			 1042, 1043,    0,    0, 1043, yy_Dummy>>,
			1, 25, 3724)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1043)
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
			    0,    0,    0,   91,   96,   78,   80,  102,  106,  187,
			    0, 3121, 3749,  110, 3118, 3093, 3104, 3749,   87, 3749,
			 3749, 3749, 3749, 3749, 3081,  104, 3070,  267,  277, 3749,
			 3749, 3057, 3749, 3056, 3749,  103,  109,  110, 3046,  266,
			  277,   93,  268,  280,   76,  286,  343,  102,  303,  278,
			  275,   90, 3749, 3749, 3004,  422,  317,  367,  501,  328,
			  283,  100,  542,  272,  269,  325,  336,  341,  273,  270,
			 3033, 3749, 3749, 3039,  149, 3749,  109,  333,  316,  364,
			  361,  422,  459, 3749,  358,  461, 3749,  582, 3042, 3749,
			 3007, 2946, 3749,  150, 3003, 3749,  584,  588,  157, 2991,

			 3749, 2986, 3749, 2950,    0,  599, 2955, 2933,  607, 3749,
			  382,  613,  626,  657,  636,  671, 3749, 3749, 2913,    0,
			  635,  490,  367,  370,  569,  581,  578,  669,  644,  639,
			  150,  484,  670,  365,  671,  672,  673,  680, 2855,  687,
			  568,  723,  785,  698,  749,  716,  695,  748,  682,  706,
			  586, 2899,  662,  293,  258, 2817, 3749,  595, 2851,    0,
			  836, 2835,  341,  350,  444, 2783,    0,  481,  687,  719,
			  722,  725,  718,  722,  724,  745,  747,  781,  749,  788,
			  761,  764,  773,  771, 2817, 2801,  781,  797, 2722,  843,
			  787,  807, 2718,  795,  796,  798,  799,  817,  818,  823, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  823,  855,  842,  857,  844,  883,  888,  885,  890,  881,
			  883,  587,  688, 3749, 2751, 3749,  830, 3749, 3749,  869,
			  861,  878,  881,  886,  708, 3749, 2663,  916,  920, 2660,
			  922, 2657, 3749,  873, 2623, 2663, 2662,  922,  698,  976,
			 2660,  977,  771, 1031,  831, 3749, 3749, 3749, 2623,  966,
			 2622, 2612, 2567, 2557,  930, 3749, 1107,  985,  974, 2544,
			 2450,  991, 1113, 1002, 1130, 1008, 1136, 2487, 1111, 1134,
			 2488, 1135, 1139, 1116, 1137, 1140, 1142, 1148,  812, 1151,
			 1156, 1157, 1155, 1152, 2487, 1141, 1172, 3749, 1166, 1207,
			 1217, 1226, 1237, 1249, 1236, 1224,  152, 1242,  856, 1235,

			 1159, 1206, 1185, 2485, 1241, 2468, 1306, 1313, 1320,  734,
			 3749,  963, 2474, 1152, 1229,    0,    0, 2414, 1238, 1232,
			    0, 1233, 1235, 1245, 1234, 1248, 1238, 1251, 1248, 1242,
			 1256, 1252, 1248, 1274, 2410, 1299, 2402, 1329, 1308, 1310,
			 1312, 2426, 1341, 1313, 1314, 1322, 1323,    0,    0, 1308,
			 1331, 1318, 1333, 1327, 1336, 1330, 1338, 1330, 1331, 2350,
			 1341, 1341, 2348,    0,    0, 1336, 1337, 1344,  430, 1382,
			 1384, 1394, 1398, 1401,  945, 3749, 2337, 3749, 1407, 1420,
			 2388, 1447, 3749, 1451, 1455, 2378, 3749, 3749, 1472, 3749,
			 3749, 3749, 3749, 1358, 1478, 1485, 1491,    0, 2310, 1497, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1503, 1525, 1509, 1531, 1548, 1557, 1563, 1569, 2318, 1392,
			 1377, 1401, 1381, 1567, 2302, 1548, 1568, 1569, 1418, 1568,
			 1572, 1573, 1576, 1398, 1574, 1578, 1634, 1643, 1652, 1659,
			 1665, 1687, 1696, 2237, 2224, 1580, 2191, 1620, 1580, 1581,
			 1182, 1557, 1718, 1730, 1643, 1740, 1723, 1770, 1794, 1666,
			 2138,    0, 1488, 1485,  914, 1782, 1491, 1648, 1569, 1571,
			 1665, 1678, 1691, 1704,    0, 1693, 1732,    0, 1733, 1736,
			 1785, 1790, 1788, 1785, 1776, 1785, 1809, 1795, 1786, 1798,
			 1799, 1792, 1793, 1794, 1795,    0,    0,    0,    0, 1793,
			 1809, 1814, 1795, 1812, 2188, 2176, 3749, 1872, 1138, 1869,

			 1213, 3749, 1880, 1886, 1892, 1610, 1901, 2176, 1910, 1920,
			 1927, 1933, 1939, 1955,   82, 1967, 1979, 1955, 1394, 2156,
			 1402, 1957, 1939, 1820, 1977, 1978, 2155, 1955, 2156, 1979,
			 1983, 2085, 1980, 1966, 1989, 2007, 2040, 2027, 2028, 2009,
			 2038, 1992, 2043, 2044, 3749, 1854, 2069, 1635, 3749, 2083,
			 3749, 1731, 1291, 2097, 3749, 2104, 3749,  260,    0, 2048,
			    0, 2042,    0,    0, 2073, 2114, 2121,    0, 2018, 1823,
			 1901, 1895, 1960, 2014, 2037, 2049, 2100, 2098, 2101,    0,
			 2093,    0, 2099, 2116,    0, 2016, 2132, 2122, 2124, 2124,
			 2130, 2120, 2132, 2122, 2134, 2136, 2137, 2127, 2131, 2144, yy_Dummy>>,
			1, 200, 400)
		end

	yy_base_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 2145, 2200, 1925, 2190,    0,    0, 1947, 2173, 2211, 2218,
			 2224, 2238, 2249, 1877, 2255, 2264, 2270, 2276, 3749, 2281,
			 2157, 1870, 2279, 1856, 2280, 2238, 1854, 2282, 2281, 2286,
			 2285, 2287, 2290, 2292, 3749, 1854, 1834, 2291, 2294, 2296,
			 2294, 2301, 2354, 1783, 2364,    0, 2392, 2415, 1763, 1752,
			 2380, 2305, 1755,  693,    0, 2403, 1748,    0,    0, 2308,
			    0, 2309,    0, 2306, 2324,    0, 2356, 2386,    0, 2389,
			 2384, 2398, 2394, 2407, 2397, 2398, 2411, 2413, 2414, 2416,
			    0, 2405, 2419, 2419,    0, 2408, 2443, 1696, 1186,    0,
			 2464, 1685, 2475, 2481, 2487, 2455, 2500, 1685, 2506, 2512,

			 2521, 2511, 2510, 1669, 2519, 1663, 2517, 1632, 1607, 1606,
			 2521, 1602, 2519, 2524, 2527, 2526, 1526, 1524, 2552, 1860,
			 1511,    0,    0, 1458, 2565, 2579, 2509,    0,    0, 2334,
			 2588, 2518, 2520,    0, 2536,    0, 2573,    0,    0,    0,
			    0,    0,    0,    0, 2572,    0, 2573,    0, 2582, 2580,
			 2584, 2585,    0,    0, 2599, 2606, 2617, 2630, 2637, 2649,
			 1537, 2655, 2666, 2665, 2663, 2664, 2666, 3749, 2665, 2664,
			 2668, 2670, 1447, 2674, 2676, 1766, 2723,    0,    0, 1442,
			 1689, 1449, 1611,    0, 2729, 1416, 2674,    0, 1396, 2670,
			 2674, 2697, 2699, 2721, 2722, 2722, 2722,    0, 2724,    0, yy_Dummy>>,
			1, 200, 600)
		end

	yy_base_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1391, 1333, 2744, 2750, 2768, 2774, 2780, 2790, 3749, 2796,
			 2794, 2779, 1281, 2795, 3749, 1275, 2780, 2795, 2810, 2814,
			 3749, 1205, 1902,    0,    0,    0, 2822, 2845, 2739, 1193,
			 2775, 2776,    0,    0, 2808, 2810,    0, 2800,    0,  920,
			 2860,  834, 2866, 2883, 2872, 2814, 2848, 2881, 2871,  327,
			 3749, 2892,    0,    0,    0,  857, 2875,    0, 2173, 2865,
			 2872, 2874, 2870,    0, 1875, 2911, 2893,  773,  757, 2898,
			 2907, 2923,    0,  762,  707, 2878,  576,    0,    0,    0,
			    0, 2883,  647, 2943, 2956, 2916, 2955, 2953, 2954,  634,
			    0, 2905,    0,  529, 2909,    0,  524, 2971, 2944,  570,

			  506,  502,    0,  871, 2937, 1003, 2979,    0, 1123, 2991,
			 3006, 3012, 3749, 3009, 3007, 3008, 2705,    0,  427, 2958,
			 3033, 3043, 3059, 3071,  400, 3045, 3057,    0,  337, 3749,
			 1462, 3081,    0, 3096, 3108, 3114, 2992,  298,  149, 3053,
			 3120, 3128, 3136, 3144, 3150, 3156, 3020, 3749, 3151, 3152,
			 3166, 3185, 3191, 3197, 3209, 3215, 3193, 3194, 3227, 3235,
			 3241, 3251, 3257, 3268, 3749, 3749, 3279, 3289, 3295, 3303,
			 3309, 3749, 3317, 3323, 3329, 3340, 3346, 3352, 3361, 3749,
			 3400, 3416, 3432, 3448, 3464,  422, 2238, 3380, 3480, 3496,
			 3512, 3528, 3544, 3559, 3575, 3096, 3586,   97, 1758, 3601, yy_Dummy>>,
			1, 200, 800)
		end

	yy_base_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 3617, 3633, 1764, 3278, 2703, 3649, 2764, 1953, 3665, 3675,
			 3057, 3180, 3381, 3537, 3546, 3670, 2004, 2018, 3674, 3679,
			 2020, 3683, 2061, 3684, 3688, 3692, 2063, 3693, 3697, 2249,
			 2332, 3701, 2441, 3702, 3706, 3710, 3711, 3715, 3719, 3720,
			 3724, 3728, 3729, 3733, yy_Dummy>>,
			1, 44, 1000)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1043)
			yy_def_template_1 (an_array)
			yy_def_template_2 (an_array)
			yy_def_template_3 (an_array)
			yy_def_template_4 (an_array)
			yy_def_template_5 (an_array)
			an_array.area.fill_with (979, 940, 978)
			an_array.put (0, 979)
			an_array.area.fill_with (979, 980, 1043)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			    0,  979,    1,  980,  980,  981,  981,  982,  982,  979,
			    9,  979,  979,  979,  979,  979,  983,  979,  984,  979,
			  979,  979,  979,  979,  979,  979,  985,  979,  979,  979,
			  979,  979,  979,  979,  979,  986,  986,  986,  986,  986,
			  986,  986,  986,  986,  986,  986,  986,  986,  986,  986,
			  986,  987,  979,  979,  988,  979,   55,   55,  979,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			  979,  979,  979,  989,  979,  979,  979,  989,  989,  989,
			  989,  989,  990,  979,  991,  990,  979,  979,  979,  979,
			  979,  979,  979,  992,  979,  979,  992,  992,  979,  979,

			  979,  983,  979,  993,  993,  993,  994,  979,  979,  979,
			  995,  979,  979,  979,  979,  979,  979,  979,  986,  996,
			  986,  986,  986,  986,  986,  986,  986,  986,  986,  986,
			  986,  986,  986,  986,  986,  986,  986,  986,  979,   46,
			  986,  986,  986,  986,  986,  986,  986,  986,  986,  986,
			  986,  987,  987,  987,  987,  988,  979,  979,  979,  997,
			   58,  979,  160,  160,  160,  998,   58,   58,   58,   58,
			  160,   58,  160,  160,   58,   58,  160,  160,   58,   58,
			  160,  160,   58,   58,  160,   58,  160,  160,  160,   58,
			   58,   58,   58,  160,   58,  160,   58,  160,  160,   58, yy_Dummy>>,
			1, 200, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			   58,  160,  160,   58,   58,  160,  160,   58,   58,  160,
			   58,  160,   58,  979,  989,  979,  979,  979,  979,  989,
			  989,  989,  989,  989,  990,  979,  999,  990,  991, 1000,
			  991,  999,  979,  979,  979,  979, 1001,  979,  992,  992,
			  979,  979,  979,  979,  979,  979,  979,  979,  979,  979,
			  979,  979,  979,  979,  979,  979,  979,  979,  979,  985,
			 1002,  979,  979,  979,  979,  979,  979,  996,  986,  986,
			  986,  986,  986,  986,  986,  986,  986,  986,  986,  979,
			  986,  986,  986,  986,  986,  986,  986,  979,  986,  986,
			  986,  986,  142,  142,  986,  986,  986,  986,  986,  986,

			  986,  986,  986,  986,  986,  979,  987,  987,  987,  987,
			  979, 1003,  979,  160,  160,  160, 1004, 1004,   58,   58,
			   58,  160,   58,  160,  160,   58,   58,  160,  160,  160,
			   58,   58,   58,  160,  160,   58,   58,  979,  160,  160,
			  160,  160,  160,   58,   58,  160,   58,  160,   58,  160,
			  160,   58,   58,  160,  160,   58,   58,  160,  160,  160,
			   58,   58,   58,  160,   58,  160,   58,  989,  989,  989,
			  989,  989,  989,  989,  999,  979, 1000,  979,  979,  979,
			 1005, 1005,  979, 1005, 1005, 1005,  979,  979,  979,  979,
			  979,  979,  979,  979,  979,  979,  979, 1006, 1006,  979, yy_Dummy>>,
			1, 200, 200)
		end

	yy_def_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  979,  979,  979,  979,  979,  979,  979,  979,  996,  986,
			  986,  986,  986,  986,  986,  986,  986,  986,  986,  979,
			  986,  986,  986,  986,  986,  986,  986,  986,  427,  427,
			  979,  986,  986,  986,  986,  979,  986,  986,  986,  986,
			  986,  979,  987,  987,  987,  987,  987,  987,  987,  987,
			 1007, 1008,  160,  160, 1004, 1004,   58,   58,  160,   58,
			  160,  160,   58,   58,  160,  160,  160,   58,   58,   58,
			  160,  160,   58,  160,  160,  160,  979,   58,   58,  160,
			   58,  160,  160,   58,   58,  160,  160,   58,   58,  160,
			  160,  160,   58,   58,  160,   58,  979,  979,  979,  979,

			  979,  979,  979,  979,  979, 1006, 1006,  979,  979,  979,
			  979,  979,  979,  979,  979,  979,  979,  979,  979,  986,
			  986,  986,  986,  986,  986,  986,  986,  986,  979,  986,
			  986,  986,  986,  986,  986,  979,  986,  536,  979,  986,
			  986,  986,  986,  979,  979,  979,  987,  979,  979,  987,
			  979,  979, 1009,  987,  979,  987,  979,  987, 1010, 1010,
			  160,  160, 1011, 1012,  979, 1004, 1004,   58,   58,  160,
			   58,  160,  160,   58,   58,  160,  160,   58,   58,  160,
			  160,   58,  160,  160,  160,  979,  979,   58,   58,  160,
			   58,  160,  160,   58,   58,  160,  160,  160,  160,   58, yy_Dummy>>,
			1, 200, 400)
		end

	yy_def_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			   58,  979,  979,  979, 1013, 1014,  979, 1006, 1006,  979,
			  979,  979,  979,  979,  979,  979,  979,  979,  979,  979,
			  986,  986,  986,  986,  986,  986,  986,  986,  979,  986,
			  986,  986,  986,  986,  979,  979,  986,  986,  986,  986,
			  979,  979,  987,  979,  987, 1015,  987,  987,  987, 1010,
			 1010,  160, 1011, 1012, 1016, 1012,  979,  160,   58,  160,
			  160,   58,   58,  160,  160,  160,   58,   58,   58,  160,
			  160,  160,   58,   58,  160,   58,  160,  160,   58,   58,
			  160,  160,  160,  160,   58,   58,  979, 1013, 1014, 1017,
			 1014,  979,  979,  979,  979,  979,  979,  979,  979,  979,

			  979,  986,  986,  986,  986,  986,  979,  986,  986,  986,
			  986,  986,  979,  986,  986,  986,  979,  979,  979, 1015,
			  979, 1018, 1019,  979, 1010, 1010,  160, 1020, 1021, 1012,
			 1012,  160,   58,  160,  160,   58,   58,  160,  160,  160,
			   58,   58,  160,   58,  160,  160,   58,   58,  160,  160,
			  160,   58, 1022, 1023, 1014, 1014,  979,  979,  979,  979,
			  979,  979,  979,  979,  986,  986,  986,  979,  986,  979,
			  986,  986,  986,  979,  979,  979,  979, 1024, 1025,  979,
			  979, 1018, 1019, 1026, 1019,  979,  160, 1027, 1021,  160,
			   58,  160,   58,  160,   58,  160,  160,  160,   58, 1028, yy_Dummy>>,
			1, 200, 600)
		end

	yy_def_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			 1023,  979,  979,  979,  979,  979,  979,  979,  979,  979,
			  986,  986,  986,  986,  979,  986,  986,  979,  979,  979,
			  979, 1024, 1025, 1029, 1030, 1031, 1019, 1019,  160, 1027,
			  160,   58,  160,   58,  160,   58,  160,  160,   58, 1028,
			  979,  979,  979,  979,  979,  986,  986,  986,  986,  979,
			  979,  979, 1032, 1033, 1034, 1031,  160, 1035,  160,   58,
			  160,   58,  160, 1036,  979,  979,  986,  986,  986,  986,
			  979,  979, 1037, 1033, 1034,  160, 1035,  160,   58,  160,
			   58,  160, 1036,  979,  979,  986,  986,  979,  979, 1037,
			 1038,  160, 1039,  979,  160, 1040,  979,  979,  986,  986,

			  979,  979, 1041, 1038,  160, 1039,  979,  160, 1040,  979,
			  979,  979,  979,  986,  979,  979, 1041, 1042,  979,  160,
			  979,  979,  979,  979,  986,  979,  979, 1043,  979,  979,
			 1042,  979,  160,  979,  979,  979,  979,  979,  979, 1043, yy_Dummy>>,
			1, 140, 800)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 257)
			yy_ec_template_1 (an_array)
			an_array.area.fill_with (86, 160, 191)
			an_array.area.fill_with (92, 192, 193)
			an_array.area.fill_with (87, 194, 223)
			yy_ec_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    0,   92,   92,   92,   92,   92,   92,   92,   92,    1,
			    2,   92,   92,    3,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,    4,    5,    6,   92,    7,   92,   92,    8,
			    9,   10,   11,   12,   13,   14,   15,   16,   17,   18,
			   19,   20,   21,   21,   21,   22,   22,   22,   23,   24,
			   25,   26,   27,   28,   92,   29,   30,   31,   32,   33,
			   34,   35,   36,   37,   35,   35,   38,   39,   40,   41,
			   42,   43,   44,   45,   46,   47,   35,   48,   49,   50,
			   51,   52,   53,   54,   55,   56,   92,   57,   58,   59,

			   60,   61,   62,   63,   64,   65,   63,   63,   66,   67,
			   68,   69,   70,   71,   72,   73,   74,   75,   76,   77,
			   78,   79,   63,   80,   81,   82,   83,   92,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85, yy_Dummy>>,
			1, 160, 0)
		end

	yy_ec_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			   88,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,   90,   91,   91,   91,
			   91,   91,   91,   91,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92, yy_Dummy>>,
			1, 34, 224)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,   16,    3,   16,    4,   16,   16,    5,
			    5,   16,   16,    6,    7,    7,    8,    9,    9,    9,
			    9,    9,    9,   16,   16,   10,   16,   11,   16,   12,
			   12,   12,   12,   12,   12,   12,   12,   12,   12,   12,
			   12,   12,   12,   12,   12,   12,   12,   12,   12,   12,
			   12,   12,   13,   14,    4,    4,    9,   15,   15,   15,
			   15,   15,   15,   15,   15,   15,   15,   15,   15,   15,
			   15,   15,   15,   15,   15,   15,   15,   15,   15,   15,
			    4,    4,    4,    4,   16,   16,   16,   16,   16,   16,
			   16,   16,   16, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 979)
			yy_accept_template_1 (an_array)
			an_array.area.fill_with (87, 166, 197)
			yy_accept_template_2 (an_array)
			yy_accept_template_3 (an_array)
			yy_accept_template_4 (an_array)
			yy_accept_template_5 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_accept_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,    0,   92,   92,    0,    0,    0,
			    0,  140,  138,    1,    2,   15,  122,   18,  138,   16,
			   17,    7,    6,   13,    5,   11,    8,   97,   97,   14,
			   12,   28,   10,   29,   19,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   76,   84,   84,   84,
			   84,   21,   30,   22,    9,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   23,   20,   24,  126,  127,  128,  129,  126,  126,  126,
			  126,  126,   92,   95,  139,   92,  111,  111,  107,  108,
			  111,  111,  120,  120,  116,  117,  120,  120,    1,    2,

			   27,  122,  121,  136,  136,  136,    3,   32,  103,   31,
			   88,    0,    0,   97,    0,   97,   26,   25,   84,    0,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   39,    0,   84,
			   83,   83,   75,   83,   83,   84,   84,   84,   84,   84,
			   84,    0,    0,    0,    0,    0,   96,    0,    0,    0,
			   87,    0,   87,   87,   87,    0, yy_Dummy>>,
			1, 166, 0)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			   39,   87,   39,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   91,  126,  128,  127,  124,
			  123,  125,  126,  126,  126,  126,   92,   95,    0,   92,
			    0,    0,    0,   93,   94,    0,    0,  107,    0,    0,
			    0,    0,  116,    0,  115,    0,  114,  119,  136,  130,
			  136,  136,  136,  136,  136,  136,    4,   33,  103,    0,
			    0,    0,    0,    0,   99,    0,   97,    0,    0,    0,
			   84,   84,   38,   84,   84,   84,   84,   84,   84,   84,
			   84,    0,   84,   84,   84,   84,   41,   84,   84,   82,
			   76,   76,   76,   76,   83,   84,   83,   83,   83,   84,

			   84,   84,   84,   84,   84,   40,   84,    0,    0,    0,
			    0,    0,   86,   89,    0,   87,   87,   38,    0,    0,
			   87,   87,   38,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,    0,
			   87,   87,   87,   63,   63,   87,   87,   87,   87,   41,
			   41,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   40,   40,   87,   87,  126,
			  126,  126,  126,  126,  126,  126,    0,   93,   94,  109,
			    0,    0,    0,    0,  118,  115,  114,  119,  134,  137,
			  137,  135,  131,  132,  133,  103,    0,  103,    0,    0, yy_Dummy>>,
			1, 200, 198)
		end

	yy_accept_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,   99,    0,    0,    0,  102,   97,    0,    0,
			   85,   84,   84,   84,   84,   84,   37,   84,   84,   84,
			   84,    0,   84,   84,   84,   84,   84,   84,   75,   84,
			   84,   84,    0,   75,   75,   75,   36,    0,   43,   84,
			   84,   84,   84,  113,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   90,   87,   87,    0,    0,   87,   87,
			   87,   87,   87,   87,   87,   87,   37,   87,   87,   37,
			   87,   87,   87,   87,   87,   87,   87,   87,    0,   87,
			   87,   87,   87,   87,   87,   87,   87,   36,   43,   36,
			   43,   87,   87,   87,   87,   87,   87,   87,   94,    0,

			  106,    0,  105,  110,  103,    0,    0,    0,    0,   98,
			   99,    0,  100,    0,  102,    0,    0,    0,   97,   72,
			    0,   58,   84,   84,   84,   84,   84,   84,   44,   84,
			    0,   84,   84,   35,   84,   84,   84,    0,   84,   84,
			    0,   84,   84,   84,   84,    0,  112,    0,    0,    0,
			   64,    0,   65,    0,    0,    0,   62,    0,   61,    0,
			    0,    0,   58,   87,    0,    0,    0,    0,    0,   58,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   44,   87,   44,   87,   87,   35,   63,   63,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87, yy_Dummy>>,
			1, 200, 398)
		end

	yy_accept_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			   87,   87,   87,    0,  103,    0,    0,    0,    0,    0,
			    0,   99,  100,    0,    0,  102,    0,    0,    0,    0,
			   72,    0,   84,   59,   84,   60,   84,   84,   46,   84,
			    0,   84,   84,   84,   84,   84,   75,    0,   52,   84,
			   84,   84,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   87,    0,    0,    0,    0,    0,   59,
			   59,   87,   60,   87,   60,   87,   87,   46,   87,   87,
			   46,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   52,   87,   87,   87,   52,   87,    0,    0,
			    0,    0,    0,   88,    0,  100,    0,  103,    0,   74,

			    0,    0,  101,   84,   84,   57,   84,   45,    0,   42,
			   56,   34,   84,   50,    0,   84,   84,   84,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,   87,    0,
			    0,    0,    0,   87,   87,   57,   87,   57,   87,   45,
			   42,   56,   42,   56,   34,   34,   87,   50,   87,   50,
			   87,   87,   87,   87,    0,    0,    0,    0,    0,  100,
			    0,    0,    0,    0,   71,  101,   84,   84,   84,   79,
			   84,    0,   84,   84,   53,    0,    0,    0,    0,    0,
			    0,    0,  104,    0,    0,    0,    0,   89,   87,    0,
			    0,   87,   87,   87,   87,   87,   87,   87,   87,   53, yy_Dummy>>,
			1, 200, 598)
		end

	yy_accept_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			   87,    0,    0,  102,    0,  102,    0,    0,    0,    0,
			   71,  101,   84,   84,   47,   84,   78,   51,   84,    0,
			    0,    0,   66,    0,    0,    0,    0,    0,    0,    0,
			   87,    0,   87,   87,   47,   47,   87,   87,   51,   87,
			   51,    0,  102,   73,    0,   71,  101,   84,   84,   84,
			   84,   77,   77,    0,    0,    0,    0,    0,   87,    0,
			   87,   87,   87,   87,   87,    0,    0,    0,   84,   49,
			   48,   84,    0,    0,    0,    0,    0,   87,    0,   49,
			   49,   48,   48,   87,    0,    0,    0,   84,   84,    0,
			    0,    0,    0,   87,    0,    0,   87,    0,    0,   70,

			   84,   54,    0,    0,    0,    0,   87,    0,    0,   54,
			    0,    0,    0,    0,   70,   84,    0,    0,    0,    0,
			    0,   87,    0,    0,    0,    0,   55,    0,    0,    0,
			    0,   67,    0,    0,   55,    0,    0,    0,   69,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   69,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,   68,   80,   81,    0,    0,
			    0,    0,    0,   68,    0,    0,    0,   68,    0,    0,
			    0,    0, yy_Dummy>>,
			1, 182, 798)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 3749
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 979
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 980
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 92
			-- Equivalence code for NULL character

	yyMax_symbol_equiv_class: INTEGER = 256
			-- All symbols greater than this symbol will have
			-- the same equivalence class as this symbol

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

	yyNb_rules: INTEGER = 139
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 140
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
