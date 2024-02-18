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
in_lineno := in_lineno + 1
when 109 then
--|#line 525 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 525")
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
--|#line 548 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 548")
end
	-- Catch-all rules (no backing up)
			last_token := ERR_VALUE_SET_DEF
			set_start_condition (INITIAL)
	
when 111 then
--|#line 558 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 558")
end

		last_token := ERR_VALUE_SET_MISSING_CODES
		err_str := text
	
when 112 then
--|#line 574 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 574")
end

		set_start_condition (IN_EXTERNAL_VALUE_SET_DEF)
		create last_term_constraint_parse_structure_value.make
		str_ := text_substring (2, text_count)
		last_term_constraint_parse_structure_value.set_terminology_id (str_.substring (1, str_.index_of (':', 1)-1))
		is_assumed_code := False
	
when 113 then
--|#line 583 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 583")
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
--|#line 598 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 598")
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
--|#line 613 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 613")
end
in_lineno := in_lineno + text_count
when 116 then
--|#line 616 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 616")
end
in_lineno := in_lineno + 1
when 117 then
--|#line 618 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 618")
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
--|#line 641 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 641")
end
	-- Catch-all rules (no backing up)
			last_token := ERR_VALUE_SET_DEF
			set_start_condition (INITIAL)
	
when 119 then
--|#line 653 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 653")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
when 120 then
--|#line 658 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 658")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
when 121 then
--|#line 666 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 666")
end
in_buffer.append_character ('\')
when 122 then
--|#line 668 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 668")
end
in_buffer.append_character ('"')
when 123 then
--|#line 670 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 670")
end

				in_buffer.append_string (text)
	
when 124 then
--|#line 674 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 674")
end
in_buffer.append_string (text)
when 125 then
--|#line 676 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 676")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
when 126 then
--|#line 681 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 681")
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
--|#line 692 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 692")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
when 128 then
--|#line 700 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 700")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
when 129 then
--|#line 702 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 702")
end
last_token := V_CHARACTER; last_character_value := '%N'
when 130 then
--|#line 703 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 703")
end
last_token := V_CHARACTER; last_character_value := '%R'
when 131 then
--|#line 704 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 704")
end
last_token := V_CHARACTER; last_character_value := '%T'
when 132 then
--|#line 705 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 705")
end
last_token := V_CHARACTER; last_character_value := '%''
when 133 then
--|#line 706 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 706")
end
last_token := V_CHARACTER; last_character_value := '%H'
when 134, 135 then
--|#line 708 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 708")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
when 136 then
--|#line 713 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 713")
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
--|#line 712 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 712")
end
terminate
when 1 then
--|#line 693 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 693")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
when 3 then
--|#line 549 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 549")
end
	-- Catch-all rules (no backing up)
			last_token := ERR_VALUE_SET_DEF
			set_start_condition (INITIAL)
	
when 4 then
--|#line 642 "cadl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_2_scanner.l' at line 642")
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
			create an_array.make_filled (0, 0, 3823)
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
			an_array.area.fill_with (977, 3732, 3823)
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
			   12,   12,   12,   74,   83,  102,   83,   75,   74,  117,

			   87,   88,   75,   87,   87,   88,   96,   87,   96,   96,
			  128,  117,  117,   89,  215,  122,  105,   89,  106,  106,
			  106,  106,  106,  106,  123,  117,  117,  117,  117,  132,
			   84,   85,   84,   85,  178,  118,  121,  148,  128,  119,
			  103,  120,  145,  122,   76,  150,  179,  146,  182,   76,
			  136,  117,  123,  151,  152,  236,   90,  132,  236,  117,
			   90,  216,  180,  118,  121,  236,  148,  119,  236,  120,
			  145,  277,  424,  117,  181,  146,  183,  309,   77,   78,
			   79,   80,   81,   77,   78,   79,   80,   81,   92,   93,
			   91,   92,   91,   91,   91,   91,   91,   91,   91,   91, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   91,   94,   95,   91,   95,   95,   95,   95,   95,   95,
			   91,   91,   91,   91,   91,   91,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   91,
			   91,   91,   91,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   91,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,   91,   91,   91,
			  109,  947,  110,  303,  111,  111,  111,  111,  111,  111,
			  109,  117,  110,  117,  113,  113,  113,  113,  113,  113,

			  117,  117,  117,  117,  124,  117,  126,  129,  130,  134,
			  191,  143,  193,  131,  207,  125,  946,  133,  127,  144,
			  306,  147,  135,  112,  214,  213,  214,  214,   96,  213,
			   96,   96,  124,  112,  126,  129,  130,  134,  192,  143,
			  194,  131,  208,  938,  125,  133,  127,  144,  209,  147,
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
			  198,  156,  141,  117,  142,  155,  224,  225,  155,  117,
			  213,  228,  229,  156,  258,  213,  224,  225,  213,  817,
			  157,  158,  158,  158,  158,  158,  158,  159,  117,  272,
			  217,  217,  217,  158,  158,  158,  158,  158,  160,  158,
			  158,  158,  161,  158,  162,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  163,  272,  818,  280,
			  158,  164,  164,  164,  164,  164,  165,  164,  164,  164,
			  166,  164,  167,  164,  164,  164,  164,  164,  164,  164,
			  164,  164,  164,  164,  155,  929,  117,  155,  219,  219,

			  219,  117,  156,  221,  221,  221,  117,  913,  218,  157,
			  158,  158,  158,  158,  158,  158,  159,  213,  297,  267,
			  270,  912,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  163,  297,  267,  270,  158,
			  164,  164,  164,  164,  164,  164,  164,  164,  164,  164,
			  164,  164,  164,  164,  164,  164,  164,  164,  164,  164,
			  164,  164,  164,  184,  185,  231,  117,  239,  231,  186,
			  239,  239,  907,  303,  239,  214,  311,  214,  214,  240,
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
			  260,  904,  117,  269,  248,  264,  264,  264,  264,  264,
			  264,  261,  117,  890,  891,  256,  117,  302,  271,  249,
			  255,  117,  109,  250,  110,  251,  262,  262,  262,  262,
			  262,  262,  263,  266,  275,  276,  109,  117,  110,  261,
			  262,  262,  262,  262,  262,  262,  271,  117,  117,  117,
			  117,  117,  900,  273,  278,  279,  117,  283,  561,  274,

			  117,  266,  275,  276,  136,  112,  562,  284,  977,  281,
			  117,  282,  363,  117,  303,  301,  117,  136,  300,  112,
			  136,  273,  278,  279,  286,  283,  117,  274,  298,  117,
			  312,  287,  299,  138,  290,  284,  138,  281,  116,  282,
			  288,  363,  289,  301,  313,  311,  300,  290,  312,  141,
			  290,  240,  286,  303,  240,  117,  298,  646,  312,  287,
			  299,  138,  313,  295,  138,  888,  296,  319,  319,  288,
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
			  293,  336,  337,  331,  326,  343,  294,  343,  141,  977,
			  327,  329,  332,  345,  333,  334,  336,  330,  560,  561,
			  337,  339,  340,  340,  340,  340,  340,  562,  775,  341,
			  342,  372,  213,  343,  252,  344,  252,  252,  345,  347,
			  348,  345,  347,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  346,  347,  348,  348,

			  349,  351,  352,  351,  352,  355,  357,  355,  357,  356,
			  361,  356,  361,  363,  213,  230,  227,  213,  374,  231,
			  213,  450,  231,  381,  380,  496,  381,  350,  496,  351,
			  352,  353,  354,  355,  357,  358,  360,  356,  361,  359,
			  362,  117,  364,  365,  366,  367,  368,  369,  617,  450,
			  117,  224,  225,  228,  229,  228,  229,  376,  377,  377,
			  377,  377,  377,  413,  239,  239,  117,  239,  239,  391,
			  391,  391,  391,  391,  391,  232,  240,  240,  385,  386,
			  386,  386,  386,  386,  386,  255,  411,  242,  242,  112,
			  117,  413,  217,  217,  217,  370,  370,  370,  371,  371, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  371,  394,  394,  394,  394,  394,  394,  603,  256,  382,
			  380,  719,  382,  255,  411,  604,  862,  243,  243,  379,
			  380,  378,  379,  378,  378,  378,  378,  378,  378,  378,
			  378,  381,  241,  241,  378,  241,  241,  241,  241,  241,
			  241,  378,  382,  378,  378,  378,  378,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  378,  378,  383,  378,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  378,  378,

			  378,  378,  378,  378,  378,  378,  378,  378,  378,  378,
			  378,  392,  117,  392,  893,  894,  393,  393,  393,  393,
			  393,  393,  397,  397,  397,  397,  397,  397,  398,  398,
			  398,  398,  398,  398,  404,  404,  404,  404,  404,  117,
			  401,  861,  401,  416,  399,  402,  402,  402,  402,  402,
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
			  721,  492,  117,  409,  855,  419,  421,  437,  417,  117,
			  618,  294,  432,  414,  420,  415,  850,  423,  117,  447,
			  435,  451,  868,  422,  425,  425,  425,  425,  425,  425,
			  492,  157,  117,  426,  426,  426,  426,  426,  426,  294,
			  432,  117,  427,  427,  427,  427,  427,  427,  435,  428,
			  117,  428,  977,  424,  116,  116,  116,  116,  116,  116,
			  136,  117,  424,  117,  869,  117,  117,  448,  609,  117,
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
			  377,  377,  377,  377,  602,  498,  382,  385,  386,  386,
			  386,  386,  386,  386,  255,  529,  517,  560,  518,  157,
			  499,  393,  393,  393,  393,  393,  393,  915,  916,  219,
			  219,  219,  220,  220,  822,  499,  383,  256,  821,  221,
			  221,  221,  255,  217,  217,  217,  217,  217,  217,  500,
			  500,  500,  500,  500,  500,  502,  502,  502,  502,  502,

			  502,  505,  505,  505,  505,  505,  505,  506,  506,  506,
			  506,  506,  506,  509,  509,  509,  509,  509,  509,  559,
			  108,  558,  567,  399,  507,  117,  507,  108,  501,  508,
			  508,  508,  508,  508,  508,  402,  402,  402,  402,  402,
			  402,  117,  550,  781,  439,  550,  400,  439,  559,  565,
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
			  117,  559,  778,  522,  523,  526,  538,  530,  772,  567,
			  569,  570,  531,  771,  569,  521,  528,  525,  524,  532,
			  520,  549,  117,  526,  549,  536,  527,  570,  890,  891,
			  566,  522,  523,  550,  538,  530,  536,  568,  569,  570,
			  531,  117,  571,  117,  528,  117,  536,  532,  291,  291,
			  291,  291,  291,  291,  117,  572,  117,  425,  425,  425,
			  425,  425,  425,  537,  536,  117,  426,  426,  426,  426,
			  426,  426,  286,  427,  427,  427,  427,  427,  427,  533,
			  533,  533,  533,  533,  533,  117,  547,  117,  288,  602,
			  603,  537,  117,  573,  303,  287,  539,  116,  604,  574,

			  286,  534,  534,  534,  534,  534,  534,  540,  573,  117,
			  535,  535,  535,  535,  535,  535,  543,  288,  117,  543,
			  758,  573,  257,  287,  539,  548,  116,  574,  543,  750,
			  544,  543,  560,  653,  574,  540,  575,  577,  303,  545,
			  543,  562,  544,  543,  441,  441,  441,  441,  441,  441,
			  303,  545,  547,  157,  443,  443,  443,  443,  443,  443,
			  303,  549,  576,  545,  549,  577,  578,  314,  549,  546,
			  314,  549,  654,  550,  577,  551,  580,  581,  725,  582,
			  550,  546,  553,  303,  446,  446,  446,  446,  446,  446,
			  303,  548,  560,  561,  578,  563,  564,  564,  564,  564, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_nxt_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  564,  562,  579,  718,  580,  581,  549,  582,  580,  549,
			  581,  587,  587,  589,  552,  590,  589,  590,  550,  593,
			  551,  554,  446,  446,  446,  446,  446,  446,  303,  583,
			  584,  584,  584,  584,  584,  594,  585,  595,  586,  587,
			  588,  589,  593,  590,  591,  592,  594,  593,  596,  495,
			  117,  117,  495,  376,  599,  599,  599,  599,  599,  552,
			  614,  496,  614,  594,  716,  595,  117,  637,  655,  630,
			  597,  615,  498,  710,  598,  117,  596,  600,  600,  600,
			  600,  600,  600,  601,  601,  601,  601,  601,  601,  391,
			  391,  391,  391,  391,  391,  637,  655,  630,  117,  616,

			  602,  603,  499,  605,  606,  606,  606,  606,  606,  604,
			  607,  607,  607,  607,  607,  607,  501,  508,  508,  508,
			  508,  508,  508,  117,  655,  511,  399,  608,  608,  608,
			  608,  608,  608,  610,  610,  610,  610,  610,  610,  611,
			  611,  611,  611,  611,  611,  687,  657,  117,  545,  400,
			  117,  545,  656,  117,  399,  612,  612,  612,  612,  612,
			  612,  619,  620,  625,  501,  117,  609,  607,  607,  607,
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
			  533,  533,  533,  533,  915,  916,  658,  633,  474,  636,
			  621,  622,  778,  623,  117,  778,  395,  659,  633,  395,
			  629,  628,  635,  631,  634,  624,  632,  428,  633,  428,
			  649,  534,  534,  534,  534,  534,  534,  636,  658,  117,
			  535,  535,  535,  535,  535,  535,  633,  638,  661,  662,
			  635,  661,  667,  430,  632,  668,  669,  668,  638,  431,
			  669,  663,  116,  652,  556,  542,  660,  556,  639,  440,
			  640,  640,  640,  640,  640,  303,  661,  662,  649,  664,
			  667,  430,  648,  668,  669,  670,  638,  431,  671,  663,

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
			  599,  599,  690,  498,  602,  688,  117,  606,  606,  606,
			  606,  606,  606,  604,  691,  691,  691,  691,  691,  691,
			  881,  881,  881,  703,  689,  697,  697,  697,  697,  697,
			  690,  626,  117,  499,  693,  693,  693,  693,  693,  693,
			  117,  117,  109,  117,  689,  694,  694,  694,  694,  694,
			  694,  701,  705,  609,  695,  695,  695,  695,  695,  695,
			  696,  696,  696,  696,  696,  696,  698,  698,  698,  698,
			  698,  698,  117,  117,  117,  704,  699,  700,  117,  701,
			  705,  117,  261,  117,  117,  724,  706,  117,  117,  702,
			  541,  708,  704,  117,  709,  713,  704,  714,  729,  712,

			  715,  707,  541,  711,  699,  700,  719,  720,  714,  729,
			  261,  715,  731,  724,  706,  721,  653,  702,  715,  708,
			  704,  715,  709,  713,  562,  726,  729,  712,  726,  707,
			  543,  711,  557,  543,  117,  732,  714,  730,  731,  715,
			  731,  925,  926,  117,  544,  117,  640,  640,  640,  640,
			  640,  640,  303,  545,  547,  654,  642,  642,  642,  642,
			  642,  642,  303,  732,  732,  117,  733,  406,  549,  719,
			  720,  549,  722,  723,  723,  723,  723,  723,  721,  504,
			  550,  927,  551,  546,  644,  644,  644,  644,  644,  644,
			  303,  549,  734,  548,  549,  727,  728,  728,  728,  728, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_nxt_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  728,  735,  736,  550,  737,  553,  736,  644,  644,  644,
			  644,  644,  644,  303,  737,  740,  380,  740,  742,  743,
			  742,  552,  743,  746,  747,  748,  746,  380,  751,  735,
			  736,  751,  737,  373,  738,  600,  600,  600,  600,  600,
			  600,  489,  739,  740,  554,  741,  742,  743,  744,  489,
			  745,  746,  747,  748,  749,  752,  753,  753,  753,  753,
			  753,  754,  757,  754,  474,  469,  755,  755,  755,  755,
			  755,  755,  755,  755,  755,  755,  755,  755,  756,  756,
			  756,  756,  756,  756,  469,  400,  802,  802,  802,  802,
			  757,  611,  611,  611,  611,  611,  611,  759,  759,  759,

			  759,  759,  759,  760,  760,  760,  760,  760,  760,  117,
			  117,  609,  761,  761,  761,  761,  761,  761,  117,  765,
			  117,  767,  763,  117,  764,  117,  117,  784,  757,  762,
			  787,  768,  787,  770,  453,  766,  765,  769,  767,  449,
			  765,  789,  767,  773,  774,  774,  774,  774,  774,  439,
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
			  792,  793,  117,  604,  117,  810,  117,  783,  406,  804,
			  805,  804,  805,  794,  783,  755,  755,  755,  755,  755,
			  755,  795,  796,  654,  688,  876,  753,  753,  753,  753,
			  753,  753,  604,  810,  689,  755,  755,  755,  755,  755,
			  755,  799,  799,  799,  799,  799,  799,  800,  806,  800,
			  117,  826,  801,  801,  801,  801,  801,  801,  967,  968,
			  967,  968,  809,  689,  803,  803,  803,  803,  803,  803,
			  807,  807,  807,  807,  807,  807,  117,  117,  812,  826,
			  117,  117,  808,  811,  815,  396,  757,  813,  815,  814,
			  809,  828,  816,  828,  830,  812,  816,  969,  830,  812,

			  921,  921,  921,  921,  921,  815,  977,  925,  926,  400,
			  808,  811,  832,  816,  757,  813,  815,  814,  832,  828,
			  834,  829,  830,  812,  816,  817,  831,  774,  774,  774,
			  774,  774,  774,  824,  825,  825,  825,  825,  825,  835,
			  832,  834,  785,  390,  389,  785,  833,  927,  834,  801,
			  801,  801,  801,  801,  801,  838,  838,  838,  838,  838,
			  838,  388,  116,  116,  818,  116,  387,  835,  116,  836,
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
			  782,  384,  238,  844,  846,  847,  856,  848,  721,  858,
			  858,  375,  860,  233,  400,  854,  847,  856,  848,  757,
			  843,  845,  782,  235,  825,  825,  825,  825,  825,  825,
			  721,  844,  846,  117,  857,  117,  372,  858,  859,  783,
			  860,  799,  799,  799,  799,  799,  799,  863,  863,  863,
			  863,  863,  863,  117,  373,  866,  873,  804,  865,  804,
			  117,  783,  841,  841,  841,  841,  841,  841,  842,  842,
			  842,  842,  842,  842,  117,  877,  877,  879,  867,  372,

			  609,  883,  864,  866,  873,  902,  817,  865,  849,  849,
			  849,  849,  849,  849,  117,  889,  806,  882,  882,  882,
			  882,  882,  882,  877,  878,  885,  879,  867,  886,  883,
			  864,  884,  892,  885,  902,  905,  886,  895,  895,  895,
			  895,  895,  895,  889,  117,  818,  885,  917,  117,  886,
			  806,  806,  806,  806,  806,  806,  897,  898,  899,  884,
			  892,  885,  213,  905,  886,  898,  899,  930,  117,  896,
			  908,  338,  908,  797,  117,  917,  797,  452,  898,  899,
			  452,  909,  922,  452,  897,  911,  918,  918,  918,  918,
			  918,  918,  338,  898,  899,  930,  335,  277,  896,  919, yy_Dummy>>,
			1, 200, 2800)
		end

	yy_nxt_template_16 (an_array: ARRAY [INTEGER])
			-- Fill chunk #16 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  919,  919,  919,  919,  919,  823,  315,  310,  823,  910,
			  922,  923,  924,  911,  920,  920,  920,  920,  920,  920,
			  308,  154,  923,  924,  931,  303,  918,  918,  918,  918,
			  918,  918,  923,  924,  932,  285,  919,  919,  919,  919,
			  919,  919,  933,  933,  933,  933,  933,  933,  935,  936,
			  923,  924,  934,  934,  934,  934,  934,  934,  851,  935,
			  936,  851,  117,  654,  953,  953,  953,  953,  953,  935,
			  936,  253,  252,  689,  939,  939,  939,  939,  939,  939,
			  940,  940,  940,  940,  940,  940,  245,  935,  936,  941,
			  941,  941,  941,  941,  941,  942,  942,  942,  942,  942,

			  942,  943,  100,  943,  948,  948,  948,  948,  948,  948,
			   97,  949,  944,  939,  939,  939,  939,  939,  939,  950,
			  238,  940,  940,  940,  940,  940,  940,  951,  235,  941,
			  941,  941,  941,  941,  941,  852,  870,  234,  852,  870,
			  945,  910,  910,  910,  910,  910,  910,  954,  955,  233,
			  783,  952,  952,  952,  952,  952,  952,  503,  654,  213,
			  503,  211,  154,  503,  954,  955,  689,  117,  954,  955,
			  956,  115,  948,  948,  948,  948,  948,  948,  957,  957,
			  957,  957,  957,  957,  958,  958,  958,  958,  958,  958,
			  114,  107,  954,  955,  959,  959,  959,  959,  959,  959, yy_Dummy>>,
			1, 200, 3000)
		end

	yy_nxt_template_17 (an_array: ARRAY [INTEGER])
			-- Fill chunk #17 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  960,  960,  960,  960,  960,  960,  962,  963,  104,  927,
			  961,  961,  961,  961,  961,  961,  964,  964,  964,  964,
			  964,  964,  100,  962,  963,   98,   97,  962,  963,  965,
			  977,  957,  957,  957,  957,  957,  957,  958,  958,  958,
			  958,  958,  958,  959,  959,  959,  959,  959,  959,  977,
			  977,  962,  963,  966,  966,  966,  966,  966,  966,  970,
			  977,  964,  964,  964,  964,  964,  964,  977,  783,  149,
			  977,  149,  647,  149,  654,  647,  149,  977,  647,  149,
			  689,  971,  971,  971,  971,  971,  971,  945,  945,  945,
			  945,  945,  945,  977,  977,  977,  977,  977,  927,  972,

			  972,  972,  972,  972,  972,  973,  973,  973,  973,  973,
			  973,  974,  974,  974,  974,  974,  974,  971,  971,  971,
			  971,  971,  971,  975,  975,  975,  975,  975,  975,  967,
			  977,  967,  977,  977,  973,  973,  973,  973,  973,  973,
			  974,  974,  974,  974,  974,  974,  976,  976,  976,  976,
			  976,  976,  977,  977,  783,  969,  969,  969,  969,  969,
			  969,  237,  643,  237,  643,  977,  977,  237,  969,  237,
			  977,  977,  237,  643,  977,  237,  643,  927,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   82,   82,   82,   82,   82,   82, yy_Dummy>>,
			1, 200, 3200)
		end

	yy_nxt_template_18 (an_array: ARRAY [INTEGER])
			-- Fill chunk #18 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   99,  977,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,  977,
			   99,   99,  101,  977,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  153,  977,
			  153,  153,  153,  153,  153,  153,  153,  153,  153,  153,
			  153,  153,  153,  153,  212,  977,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  977,  212,  212,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,

			  222,  222,  222,  222,  222,  222,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  244,  977,  244,  244,  244,  244,  244,  244,
			  244,  244,  244,  244,  244,  244,  244,  244,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  108,  108,  977,  977,  108,  108,
			  265,  108,  977,  265,  265,  265,  265,  977,  977,  265,
			  224,  224,  224,  224,  224,  224,  224,  977,  224,  224,
			  224,  224,  224,  224,  224,  224,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227, yy_Dummy>>,
			1, 200, 3400)
		end

	yy_nxt_template_19 (an_array: ARRAY [INTEGER])
			-- Fill chunk #19 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  227,  227,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  309,  309,
			  977,  977,  309,  309,  977,  309,  378,  378,  378,  378,
			  378,  378,  378,  378,  378,  378,  378,  378,  378,  378,
			  378,  378,  449,  449,  977,  977,  449,  449,  449,  449,
			  449,  977,  650,  449,  977,  650,  449,  449,  650,  651,
			  685,  686,  651,  685,  686,  651,  685,  686,  717,  779,
			  780,  717,  779,  780,  717,  779,  780,  786,  798,  819,
			  786,  798,  819,  786,  798,  819,  820,  827,  837,  820,
			  827,  837,  820,  827,  837,  853,  871,  872,  853,  871,

			  872,  853,  871,  872,  874,  880,  887,  874,  880,  887,
			  874,  880,  887,  901,  903,  906,  901,  903,  906,  901,
			  903,  906,  914,  928,  937,  914,  928,  937,  914,  928,
			  937,   11, yy_Dummy>>,
			1, 132, 3600)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 3823)
			an_array.put (0, 0)
			an_array.area.fill_with (1, 1, 92)
			yy_chk_template_1 (an_array)
			an_array.area.fill_with (9, 188, 279)
			yy_chk_template_2 (an_array)
			yy_chk_template_3 (an_array)
			yy_chk_template_4 (an_array)
			yy_chk_template_5 (an_array)
			an_array.area.fill_with (241, 1019, 1110)
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
			an_array.area.fill_with (977, 3731, 3823)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    3,    5,   18,    6,    3,    4,   41,    7,    7,    4,
			    7,    8,    8,   13,    8,   13,   13,   41,   37,   50,
			    7,   76,   37,   25,    8,   25,   25,   25,   25,   25,
			   25,   37,   43,   35,   48,   36,   43,    5,    5,    6,
			    6,   60,   35,   36,   50,   41,   35,   18,   35,   48,
			   37,    3,   51,   60,   48,   61,    4,  294,  286,   37,
			   51,   51,   92,    7,   43,   92,  294,    8,   76,   60,
			   35,   36,  236,   50,   35,  236,   35,   48,  128,  286,
			  128,   60,   48,   61,  995,    3,    3,    3,    3,    3,
			    4,    4,    4,    4,    4, yy_Dummy>>,
			1, 95, 93)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   27,  936,   27,  151,   27,   27,   27,   27,   27,   27,
			   28,   39,   28,   42,   28,   28,   28,   28,   28,   28,
			   47,   44,   40,   45,   39,   49,   40,   42,   42,   45,
			   63,   47,   64,   42,   68,   39,  935,   44,   40,   47,
			  151,   49,   45,   27,   74,   78,   74,   74,   96,   80,
			   96,   96,   39,   28,   40,   42,   42,   45,   63,   47,
			   64,   42,   68,  926,   39,   44,   40,   47,   69,   49,
			   45,   46,   46,   46,   46,   46,   46,   46,   56,   56,
			   46,   57,   77,   56,   59,   56,   57,   46,   67,   65,
			   57,   66,   57,   67,   46,   59,  296,   69,  296,   66,

			   82,   46,   65,   46,   84,   46,   56,   56,  108,   57,
			   85,   56,   59,   56,   57,   46,   67,   65,   57,   66,
			   57,   67,   46,  155,   59,   78,  155,   66,   80,   80,
			   65,  155,   46,  922,   46,   55,   82,   82,   55,  124,
			   79,   84,   84,   55,  108,   81,   85,   85,  366,  773,
			   55,   55,   55,   55,   55,   55,   55,   55,  131,  124,
			   77,   77,   77,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,  124,  773,  131,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55, yy_Dummy>>,
			1, 200, 280)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   58,  916,  144,   58,   79,   79,
			   79,  122,   58,   81,   81,   81,  119,  899,  366,   58,
			   58,   58,   58,   58,   58,   58,   58,  218,  144,  119,
			  122,  898,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,  144,  119,  122,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   62,   62,   87,  897,   94,   87,   62,

			   94,   95,  894,  152,   95,  214,  160,  214,  214,   94,
			   94,  512,  512,   95,   62,  218,  218,  218,  120,  103,
			   94,   62,   62,  148,   95,  120,  121,   62,  103,  103,
			  103,  103,  103,  103,  160,  121,  106,  106,  106,  106,
			  106,  106,  109,  109,  109,  109,  109,  109,  148,  152,
			   94,   87,  106,  120,   95,  110,  110,  110,  110,  110,
			  110,  891,  123,  121,  103,  112,  112,  112,  112,  112,
			  112,  110,  118,  874,  874,  106,  127,  148,  123,  103,
			  106,  126,  111,  103,  111,  103,  111,  111,  111,  111,
			  111,  111,  111,  118,  126,  127,  113,  129,  113,  110, yy_Dummy>>,
			1, 200, 480)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  113,  113,  113,  113,  113,  113,  123,  125,  132,  130,
			  133,  134,  887,  125,  129,  130,  147,  134,  651,  125,
			  135,  118,  126,  127,  138,  111,  651,  135,  137,  132,
			  146,  133,  209,  138,  555,  147,  145,  139,  146,  113,
			  141,  125,  129,  130,  137,  134,  139,  125,  145,  141,
			  161,  137,  145,  139,  138,  135,  141,  132,  137,  133,
			  137,  209,  137,  147,  162,  165,  146,  139,  166,  139,
			  141,  240,  137,  150,  240,  143,  145,  555,  161,  137,
			  145,  139,  167,  143,  141,  872,  143,  168,  169,  137,
			  170,  137,  162,  165,  222,  171,  166,  142,  139,  140,

			  140,  140,  140,  140,  140,  140,  142,  172,  140,  150,
			  167,  143,  173,  142,  143,  168,  169,  174,  170,  140,
			  142,  176,  140,  171,  150,  178,  175,  142,  140,  142,
			  222,  222,  175,  177,  179,  172,  180,  181,  184,  177,
			  173,  142,  185,  242,  372,  174,  242,  140,  142,  176,
			  140,  188,  189,  178,  175,  191,  140,  192,  142,  158,
			  175,  177,  179,  193,  180,  181,  184,  177,  452,  452,
			  185,  187,  187,  187,  187,  187,  187,  452,  871,  188,
			  189,  372,  217,  191,  252,  192,  252,  252,  194,  195,
			  196,  193,  197,  158,  158,  158,  158,  158,  158,  158, yy_Dummy>>,
			1, 200, 680)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  194,  195,  196,  198,
			  197,  199,  200,  201,  202,  203,  204,  205,  206,  203,
			  207,  205,  208,  210,  219,  225,  226,  220,  228,  231,
			  221,  311,  231,  381,  381,  496,  381,  198,  496,  199,
			  200,  201,  202,  203,  204,  205,  206,  203,  207,  205,
			  208,  866,  210,  217,  217,  217,  217,  217,  516,  311,
			  273,  225,  225,  226,  226,  228,  228,  235,  235,  235,
			  235,  235,  235,  273,  237,  239,  271,  237,  239,  254,
			  254,  254,  254,  254,  254,  231,  237,  239,  247,  247,

			  247,  247,  247,  247,  247,  254,  271,  237,  239,  516,
			  865,  273,  219,  219,  219,  220,  220,  220,  221,  221,
			  221,  256,  256,  256,  256,  256,  256,  686,  254,  382,
			  382,  853,  382,  254,  271,  686,  839,  237,  239, yy_Dummy>>,
			1, 139, 880)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  255,  276,  255,  880,  880,  255,  255,  255,  255,  255,
			  255,  259,  259,  259,  259,  259,  259,  260,  260,  260,
			  260,  260,  260,  263,  263,  263,  263,  263,  278,  261,
			  837,  261,  276,  260,  261,  261,  261,  261,  261,  261,
			  262,  278,  262,  267,  262,  262,  262,  262,  262,  262,
			  264,  264,  264,  264,  264,  264,  260,  266,  269,  267,
			  270,  260,  272,  279,  274,  266,  275,  270,  277,  278,
			  272,  281,  283,  280,  269,  300,  279,  281,  518,  277,
			  284,  293,  307,  262,  274,  280,  275,  267,  284,  277,
			  293,  780,  312,  266,  283,  270,  295,  438,  272,  780,

			  363,  298,  269,  827,  279,  281,  300,  277,  438,  518,
			  293,  295,  274,  280,  275,  819,  284,  813,  307,  298,
			  312,  847,  283,  287,  287,  287,  287,  287,  287,  363,
			  309,  287,  288,  288,  288,  288,  288,  288,  293,  295,
			  288,  289,  289,  289,  289,  289,  289,  298,  291,  289,
			  291,  291,  287,  290,  290,  290,  290,  290,  290,  292,
			  299,  288,  810,  847,  297,  302,  309,  799,  292,  364,
			  289,  291,  297,  316,  291,  317,  319,  320,  321,  299,
			  291,  322,  292,  323,  324,  325,  326,  327,  292,  328,
			  302,  304,  304,  304,  304,  304,  304,  304,  364,  291, yy_Dummy>>,
			1, 200, 1111)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  297,  316,  291,  317,  319,  320,  321,  299,  291,  322,
			  292,  323,  324,  325,  326,  327,  292,  328,  329,  302,
			  305,  305,  305,  305,  305,  305,  305,  306,  306,  306,
			  306,  306,  306,  306,  330,  331,  333,  335,  336,  337,
			  338,  341,  365,  342,  343,  344,  329,  347,  340,  335,
			  340,  340,  340,  340,  340,  340,  348,  349,  350,  351,
			  335,  352,  330,  331,  333,  353,  336,  337,  338,  341,
			  335,  342,  343,  344,  354,  347,  355,  356,  358,  359,
			  367,  450,  368,  820,  348,  349,  350,  351,  335,  352,
			  369,  820,  447,  353,  370,  408,  376,  371,  407,  376,

			  498,  420,  354,  498,  355,  356,  358,  359,  376,  450,
			  376,  377,  379,  379,  377,  379,  420,  407,  408,  376,
			  365,  365,  365,  377,  379,  377,  447,  377,  377,  377,
			  377,  377,  377,  798,  377,  379,  386,  386,  386,  386,
			  386,  386,  386,  391,  420,  407,  786,  408,  783,  376,
			  392,  392,  392,  392,  392,  392,  901,  901,  367,  367,
			  367,  368,  368,  779,  377,  379,  391,  777,  369,  369,
			  369,  391,  370,  370,  370,  371,  371,  371,  393,  393,
			  393,  393,  393,  393,  394,  394,  394,  394,  394,  394,
			  397,  397,  397,  397,  397,  397,  398,  398,  398,  398, yy_Dummy>>,
			1, 200, 1311)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  398,  398,  400,  400,  400,  400,  400,  400,  451,  983,
			  454,  456,  398,  399,  770,  399,  983,  393,  399,  399,
			  399,  399,  399,  399,  401,  401,  401,  401,  401,  401,
			  409,  550,  721,  439,  550,  398,  439,  451,  454,  456,
			  398,  402,  402,  402,  402,  402,  402,  403,  403,  409,
			  403,  403,  403,  403,  403,  403,  404,  404,  404,  404,
			  404,  404,  405,  405,  405,  405,  405,  405,  411,  410,
			  413,  415,  414,  417,  416,  418,  411,  409,  416,  415,
			  402,  410,  422,  419,  417,  421,  439,  418,  436,  423,
			  455,  718,  413,  414,  417,  436,  421,  715,  457,  458,

			  459,  422,  714,  460,  411,  419,  416,  415,  423,  410,
			  549,  709,  417,  549,  433,  418,  461,  903,  903,  455,
			  413,  414,  549,  436,  421,  433,  457,  458,  459,  422,
			  435,  460,  707,  419,  706,  433,  423,  424,  424,  424,
			  424,  424,  424,  705,  461,  424,  425,  425,  425,  425,
			  425,  425,  435,  433,  425,  426,  426,  426,  426,  426,
			  426,  425,  427,  427,  427,  427,  427,  427,  428,  428,
			  428,  428,  428,  428,  703,  442,  701,  425,  503,  503,
			  435,  437,  463,  442,  427,  437,  426,  503,  464,  425,
			  429,  429,  429,  429,  429,  429,  437,  466,  429,  430, yy_Dummy>>,
			1, 200, 1511)
		end

	yy_chk_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  430,  430,  430,  430,  430,  440,  425,  430,  440,  695,
			  463,  689,  427,  437,  442,  426,  464,  441,  685,  440,
			  441,  563,  563,  467,  437,  466,  468,  440,  440,  543,
			  563,  441,  543,  441,  441,  441,  441,  441,  441,  441,
			  441,  443,  654,  443,  443,  443,  443,  443,  443,  443,
			  444,  467,  543,  444,  468,  469,  996,  445,  440,  996,
			  445,  563,  444,  470,  444,  471,  472,  650,  473,  445,
			  441,  445,  444,  445,  445,  445,  445,  445,  445,  445,
			  443,  453,  453,  469,  453,  453,  453,  453,  453,  453,
			  453,  470,  646,  471,  472,  446,  473,  475,  446,  476,

			  477,  478,  479,  444,  480,  481,  482,  446,  487,  446,
			  445,  446,  446,  446,  446,  446,  446,  446,  474,  474,
			  474,  474,  474,  474,  488,  475,  489,  476,  477,  478,
			  479,  490,  480,  481,  482,  491,  487,  489,  495,  531,
			  540,  495,  497,  497,  497,  497,  497,  497,  446,  515,
			  495,  515,  488,  641,  489,  634,  540,  567,  531,  490,
			  515,  495,  633,  491,  624,  489,  500,  500,  500,  500,
			  500,  500,  501,  501,  501,  501,  501,  501,  502,  502,
			  502,  502,  502,  502,  540,  567,  531,  621,  515,  504,
			  504,  495,  504,  504,  504,  504,  504,  504,  504,  506, yy_Dummy>>,
			1, 200, 1711)
		end

	yy_chk_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  506,  506,  506,  506,  506,  500,  507,  507,  507,  507,
			  507,  507,  619,  568,  611,  506,  508,  508,  508,  508,
			  508,  508,  509,  509,  509,  509,  509,  509,  510,  510,
			  510,  510,  510,  510,  604,  569,  520,  545,  506,  525,
			  545,  568,  519,  506,  511,  511,  511,  511,  511,  511,
			  519,  520,  525,  600,  527,  508,  513,  513,  513,  513,
			  513,  513,  527,  569,  906,  906,  514,  510,  514,  514,
			  514,  514,  514,  514,  521,  522,  523,  570,  519,  520,
			  525,  521,  522,  530,  523,  528,  532,  537,  571,  539,
			  527,  530,  528,  545,  532,  537,  523,  533,  533,  533,

			  533,  533,  533,  928,  928,  570,  536,  583,  539,  521,
			  522,  778,  523,  538,  778, 1000,  571,  536, 1000,  530,
			  528,  538,  532,  537,  523,  533,  534,  536,  534,  566,
			  534,  534,  534,  534,  534,  534,  539,  572,  534,  535,
			  535,  535,  535,  535,  535,  536,  541,  573,  574,  538,
			  575,  578,  534,  533,  580,  581,  585,  541,  534,  586,
			  574,  535,  562, 1005,  778,  572, 1005,  541,  544,  544,
			  544,  544,  544,  544,  544,  573,  574,  559,  575,  578,
			  534,  557,  580,  581,  585,  541,  534,  586,  574,  535,
			  547,  547,  547,  547,  547,  547,  547,  551,  551,  551, yy_Dummy>>,
			1, 200, 1911)
		end

	yy_chk_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  551,  551,  551,  551,  553,  553,  553,  553,  553,  553,
			  553,  564,  564,  576,  564,  564,  564,  564,  564,  564,
			  564,  587,  588,  856,  584,  576,  584,  584,  584,  584,
			  584,  584,  589,  590,  591,  592,  593,  594,  595,  596,
			  597,  576,  598,  601,  601,  601,  601,  601,  601,  587,
			  588,  564,  856,  576,  609,  609,  609,  609,  609,  609,
			  589,  590,  591,  592,  593,  594,  595,  596,  597,  599,
			  598,  625,  599,  605,  605,  607,  607,  607,  607,  607,
			  607,  599,  605,  599,  625,  599,  599,  599,  599,  599,
			  599,  607,  599,  606,  606,  529,  606,  606,  606,  606,

			  606,  606,  606,  608,  608,  608,  608,  608,  608,  862,
			  862,  862,  625,  605,  615,  615,  615,  615,  615,  607,
			  526,  627,  599,  610,  610,  610,  610,  610,  610,  524,
			  517,  505,  622,  606,  612,  612,  612,  612,  612,  612,
			  622,  627,  608,  613,  613,  613,  613,  613,  613,  614,
			  614,  614,  614,  614,  614,  617,  617,  617,  617,  617,
			  617,  618,  620,  623,  626,  618,  620,  628,  622,  627,
			  629,  617,  630,  635,  649,  628,  631,  637,  623,  493,
			  630,  626,  636,  631,  637,  626,  638,  657,  636,  639,
			  629,  492,  635,  618,  620,  647,  647,  638,  659,  617, yy_Dummy>>,
			1, 200, 2111)
		end

	yy_chk_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  639,  661,  649,  628,  647,  727,  623,  638,  630,  626,
			  639,  631,  637,  727, 1014,  657,  636, 1014,  629,  640,
			  635,  448,  640,  434,  662,  638,  659,  664,  639,  661,
			  914,  914,  432,  640,  431,  640,  640,  640,  640,  640,
			  640,  640,  640,  642,  727,  642,  642,  642,  642,  642,
			  642,  642,  662,  665,  412,  664,  406,  644,  648,  648,
			  644,  648,  648,  648,  648,  648,  648,  648,  396,  644,
			  914,  644,  640,  644,  644,  644,  644,  644,  644,  644,
			  645,  665,  642,  645,  653,  653,  653,  653,  653,  653,
			  667,  668,  645,  669,  645,  670,  645,  645,  645,  645,

			  645,  645,  645,  671,  672,  383,  673,  674,  675,  676,
			  644,  677,  679,  680,  681,  683,  378, 1015,  667,  668,
			 1015,  669,  374,  670,  684,  684,  684,  684,  684,  684,
			  360,  671,  672,  645,  673,  674,  675,  676,  357,  677,
			  679,  680,  681,  683,  688,  688,  688,  688,  688,  688,
			  690,  693,  690,  339,  334,  690,  690,  690,  690,  690,
			  690,  691,  691,  691,  691,  691,  691,  692,  692,  692,
			  692,  692,  692,  332,  693,  758,  758,  758,  758,  693,
			  694,  694,  694,  694,  694,  694,  696,  696,  696,  696,
			  696,  696,  697,  697,  697,  697,  697,  697,  700,  699, yy_Dummy>>,
			1, 200, 2311)
		end

	yy_chk_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  691,  698,  698,  698,  698,  698,  698,  702,  704,  708,
			  710,  700,  711,  702,  713,  712,  724,  698,  699,  729,
			  711,  730,  713,  315,  708,  704,  712,  710,  310,  704,
			  732,  710,  716,  716,  716,  716,  716,  716,  303,  700,
			  698,  702,  717,  717,  724,  698,  699,  729,  711,  730,
			  713,  717,  708,  704,  712,  710,  722,  722,  732,  734,
			  742,  744,  746,  723,  723,  722,  723,  723,  723,  723,
			  723,  723,  723,  728,  747,  728,  728,  728,  728,  728,
			  728,  728,  748,  749,  752,  857,  764,  734,  742,  744,
			  746,  301,  752,  282,  764,  268,  722,  265,  760,  760,

			  760,  760,  747,  723,  754,  754,  754,  754,  754,  754,
			  748,  749,  728,  753,  857,  753,  753,  753,  753,  753,
			  753,  753,  764,  752,  755,  755,  755,  755,  755,  755,
			  756,  756,  756,  756,  756,  756,  757,  760,  757,  763,
			  784,  757,  757,  757,  757,  757,  757,  961,  961,  961,
			  961,  763,  753,  759,  759,  759,  759,  759,  759,  761,
			  761,  761,  761,  761,  761,  762,  766,  767,  784,  768,
			  769,  762,  766,  771,  258,  761,  768,  771,  769,  763,
			  787,  772,  788,  789,  767,  772,  961,  790,  767,  909,
			  909,  909,  909,  909,  771,  257,  937,  937,  761,  762, yy_Dummy>>,
			1, 200, 2511)
		end

	yy_chk_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  766,  791,  772,  761,  768,  771,  769,  792,  787,  793,
			  788,  789,  767,  772,  774,  790,  774,  774,  774,  774,
			  774,  774,  782,  782,  782,  782,  782,  782,  794,  791,
			  796, 1018,  251,  250, 1018,  792,  937,  793,  800,  800,
			  800,  800,  800,  800,  801,  801,  801,  801,  801,  801,
			  249,  984,  984,  774,  984,  248,  794,  984,  796,  802,
			  802,  802,  802,  802,  802,  803,  803,  803,  803,  803,
			  803,  804,  804,  804,  804,  804,  804,  805,  805,  805,
			  805,  805,  805,  801,  807,  807,  807,  807,  807,  807,
			  808,  809,  814,  815,  811,  816,  826,  815,  828,  816,

			  807,  808,  811,  817,  817,  817,  817,  817,  817,  824,
			  246,  238,  809,  814,  815,  829,  816,  824,  832,  833,
			  234,  835,  233,  807,  826,  815,  828,  816,  807,  808,
			  811,  825,  232,  825,  825,  825,  825,  825,  825,  825,
			  809,  814,  844,  829,  845,  229,  832,  833,  824,  835,
			  838,  838,  838,  838,  838,  838,  840,  840,  840,  840,
			  840,  840,  846,  227,  845,  854,  841,  844,  841,  864,
			  825,  841,  841,  841,  841,  841,  841,  842,  842,  842,
			  842,  842,  842,  843,  858,  859,  860,  846,  224,  838,
			  864,  843,  845,  854,  889,  849,  844,  849,  849,  849, yy_Dummy>>,
			1, 200, 2711)
		end

	yy_chk_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  849,  849,  849,  867,  873,  841,  863,  863,  863,  863,
			  863,  863,  858,  859,  868,  860,  846,  869,  864,  843,
			  867,  879,  868,  889,  892,  869,  881,  881,  881,  881,
			  881,  881,  873,  883,  849,  868,  902,  884,  869,  882,
			  882,  882,  882,  882,  882,  884,  885,  886,  867,  879,
			  868,  212,  892,  869,  885,  886,  917,  896,  883,  895,
			  190,  895, 1020,  911,  902, 1020, 1002,  885,  886, 1002,
			  895,  911, 1002,  884,  896,  904,  904,  904,  904,  904,
			  904,  186,  885,  886,  917,  183,  182,  883,  907,  907,
			  907,  907,  907,  907, 1024,  163,  159, 1024,  895,  911,

			  912,  913,  896,  908,  908,  908,  908,  908,  908,  156,
			  153,  912,  913,  918,  149,  918,  918,  918,  918,  918,
			  918,  912,  913,  919,  136,  919,  919,  919,  919,  919,
			  919,  920,  920,  920,  920,  920,  920,  923,  924,  912,
			  913,  921,  921,  921,  921,  921,  921, 1027,  923,  924,
			 1027,  116,  918,  944,  944,  944,  944,  944,  923,  924,
			  105,  104,  919,  929,  929,  929,  929,  929,  929,  931,
			  931,  931,  931,  931,  931,  101,  923,  924,  932,  932,
			  932,  932,  932,  932,  933,  933,  933,  933,  933,  933,
			  934,   99,  934,  938,  938,  938,  938,  938,  938,   97, yy_Dummy>>,
			1, 200, 2911)
		end

	yy_chk_template_16 (an_array: ARRAY [INTEGER])
			-- Fill chunk #16 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  939,  934,  939,  939,  939,  939,  939,  939,  940,   93,
			  940,  940,  940,  940,  940,  940,  941,   90,  941,  941,
			  941,  941,  941,  941, 1028, 1030,   89, 1028, 1030,  934,
			  942,  942,  942,  942,  942,  942,  946,  947,   88,  939,
			  943,  943,  943,  943,  943,  943, 1004,  940,   73, 1004,
			   70,   54, 1004,  946,  947,  941,   38,  946,  947,  948,
			   33,  948,  948,  948,  948,  948,  948,  949,  949,  949,
			  949,  949,  949,  950,  950,  950,  950,  950,  950,   31,
			   26,  946,  947,  951,  951,  951,  951,  951,  951,  952,
			  952,  952,  952,  952,  952,  954,  955,   24,  948,  953,

			  953,  953,  953,  953,  953,  956,  956,  956,  956,  956,
			  956,   16,  954,  955,   15,   14,  954,  955,  957,   11,
			  957,  957,  957,  957,  957,  957,  958,  958,  958,  958,
			  958,  958,  959,  959,  959,  959,  959,  959,    0,    0,
			  954,  955,  960,  960,  960,  960,  960,  960,  964,    0,
			  964,  964,  964,  964,  964,  964,    0,  957,  985,    0,
			  985, 1008,  985,  958, 1008,  985,    0, 1008,  985,  959,
			  965,  965,  965,  965,  965,  965,  966,  966,  966,  966,
			  966,  966,    0,    0,    0,    0,    0,  964,  967,  967,
			  967,  967,  967,  967,  968,  968,  968,  968,  968,  968, yy_Dummy>>,
			1, 200, 3111)
		end

	yy_chk_template_17 (an_array: ARRAY [INTEGER])
			-- Fill chunk #17 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  970,  970,  970,  970,  970,  970,  971,  971,  971,  971,
			  971,  971,  972,  972,  972,  972,  972,  972,  973,    0,
			  973,    0,    0,  973,  973,  973,  973,  973,  973,  974,
			  974,  974,  974,  974,  974,  975,  975,  975,  975,  975,
			  975,    0,    0,  971,  976,  976,  976,  976,  976,  976,
			  990, 1007,  990, 1007,    0,    0,  990,  973,  990,    0,
			    0,  990, 1007,    0,  990, 1007,  974,  978,  978,  978,
			  978,  978,  978,  978,  978,  978,  978,  978,  978,  978,
			  978,  978,  978,  979,  979,  979,  979,  979,  979,  979,
			  979,  979,  979,  979,  979,  979,  979,  979,  979,  980,

			  980,  980,  980,  980,  980,  980,  980,  980,  980,  980,
			  980,  980,  980,  980,  980,  981,    0,  981,  981,  981,
			  981,  981,  981,  981,  981,  981,  981,  981,    0,  981,
			  981,  982,    0,  982,  982,  982,  982,  982,  982,  982,
			  982,  982,  982,  982,  982,  982,  982,  986,    0,  986,
			  986,  986,  986,  986,  986,  986,  986,  986,  986,  986,
			  986,  986,  986,  987,    0,  987,  987,  987,  987,  987,
			  987,  987,  987,  987,  987,  987,    0,  987,  987,  988,
			  988,  988,  988,  988,  988,  988,  988,  988,  988,  988,
			  988,  988,  988,  988,  988,  989,  989,  989,  989,  989, yy_Dummy>>,
			1, 200, 3311)
		end

	yy_chk_template_18 (an_array: ARRAY [INTEGER])
			-- Fill chunk #18 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  989,  989,  989,  989,  989,  989,  989,  989,  989,  989,
			  989,  991,    0,  991,  991,  991,  991,  991,  991,  991,
			  991,  991,  991,  991,  991,  991,  991,  992,  992,  992,
			  992,  992,  992,  992,  992,  992,  992,  992,  992,  992,
			  992,  992,  992,  993,  993,    0,    0,  993,  993,  994,
			  993,    0,  994,  994,  994,  994,    0,    0,  994,  997,
			  997,  997,  997,  997,  997,  997,    0,  997,  997,  997,
			  997,  997,  997,  997,  997,  998,  998,  998,  998,  998,
			  998,  998,  998,  998,  998,  998,  998,  998,  998,  998,
			  998,  999,  999,  999,  999,  999,  999,  999,  999,  999,

			  999,  999,  999,  999,  999,  999,  999, 1001, 1001,    0,
			    0, 1001, 1001,    0, 1001, 1003, 1003, 1003, 1003, 1003,
			 1003, 1003, 1003, 1003, 1003, 1003, 1003, 1003, 1003, 1003,
			 1003, 1006, 1006,    0,    0, 1006, 1006, 1006, 1006, 1006,
			    0, 1009, 1006,    0, 1009, 1006, 1006, 1009, 1010, 1011,
			 1012, 1010, 1011, 1012, 1010, 1011, 1012, 1013, 1016, 1017,
			 1013, 1016, 1017, 1013, 1016, 1017, 1019, 1021, 1022, 1019,
			 1021, 1022, 1019, 1021, 1022, 1023, 1025, 1026, 1023, 1025,
			 1026, 1023, 1025, 1026, 1029, 1031, 1032, 1029, 1031, 1032,
			 1029, 1031, 1032, 1033, 1034, 1035, 1033, 1034, 1035, 1033, yy_Dummy>>,
			1, 200, 3511)
		end

	yy_chk_template_19 (an_array: ARRAY [INTEGER])
			-- Fill chunk #19 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1034, 1035, 1036, 1037, 1038, 1036, 1037, 1038, 1036, 1037,
			 1038, 1039, 1040, 1041, 1039, 1040, 1041, 1039, 1040, 1041, yy_Dummy>>,
			1, 20, 3711)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1041)
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
			    0,    0,    0,   91,   96,   78,   80,   99,  103,  187,
			    0, 3230, 3731,  105, 3224, 3199, 3216, 3731,   87, 3731,
			 3731, 3731, 3731, 3731, 3194,  101, 3175,  267,  277, 3731,
			 3731, 3164, 3731, 3145, 3731,  101,  103,   86, 3142,  266,
			  277,   74,  268,  100,  276,  278,  335,  275,  102,  280,
			   87,   88, 3731, 3731, 3107,  414,  325,  332,  493,  326,
			  105,  112,  534,  281,  271,  338,  335,  328,  273,  298,
			 3145, 3731, 3731, 3153,  323, 3731,  108,  356,  319,  414,
			  323,  419,  364, 3731,  368,  374, 3731,  574, 3147, 3123,
			 3054, 3731,  154, 3118,  576,  580,  327, 3108, 3731, 3096,

			 3731, 3078,    0,  591, 3070, 3056,  599, 3731,  372,  605,
			  618,  649,  628,  663, 3731, 3731, 3037,    0,  627,  481,
			  573,  581,  476,  617,  394,  662,  636,  631,  148,  652,
			  664,  413,  663,  665,  666,  675, 2953,  692,  688,  701,
			  763,  704,  761,  730,  471,  691,  685,  671,  578, 3002,
			  730,  260,  560, 2966, 3731,  402, 3010,    0,  816, 2991,
			  540,  692,  712, 2941,    0,  699,  710,  730,  733,  734,
			  726,  734,  743,  751,  752,  775,  756,  782,  767,  770,
			  778,  773, 2974, 2973,  776,  791, 2936,  834,  789,  801,
			 2915,  789,  791,  797,  822,  838,  838,  841,  867,  868, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  855,  870,  857,  868,  873,  870,  875,  866,  868,  662,
			  863, 3731, 2956, 3731,  584, 3731, 3731,  856,  511,  908,
			  911,  914,  758, 3731, 2846,  899,  900, 2820,  902, 2803,
			 3731,  918, 2769, 2831, 2829,  940,  164,  963, 2820,  964,
			  750, 1018,  822, 3731, 3731, 3731, 2813,  962, 2758, 2753,
			 2736, 2735,  863, 3731,  952, 1099,  984, 2690, 2620, 1105,
			 1111, 1128, 1138, 1117, 1144, 2581, 1143, 1129, 2581, 1144,
			 1146,  941, 1148,  925, 1150, 1152, 1087, 1151, 1114, 1149,
			 1159, 1157, 2579, 1158, 1166, 3731,  126, 1217, 1226, 1235,
			 1247, 1246, 1254, 1176,  134, 1182,  353, 1250, 1187, 1246,

			 1161, 2577, 1251, 2526, 1285, 1314, 1321, 1170, 3731, 1225,
			 2523,  888, 1162,    0,    0, 2474, 1251, 1245,    0, 1246,
			 1247, 1257, 1247, 1262, 1250, 1263, 1259, 1253, 1267, 1291,
			 1300, 1301, 2428, 1302, 2409, 1332, 1311, 1312, 1314, 2449,
			 1344, 1314, 1316, 1324, 1325,    0,    0, 1311, 1334, 1321,
			 1336, 1330, 1339, 1336, 1352, 1344, 1344, 2393, 1346, 1346,
			 2385,    0,    0, 1161, 1230, 1347,  422, 1385, 1387, 1395,
			 1399, 1402,  808, 3731, 2379, 3731, 1406, 1421, 2425, 1422,
			 3731,  922, 1008, 2414, 3731, 3731, 1431, 3731, 3731, 3731,
			 3731, 1421, 1444, 1472, 1478,    0, 2319, 1484, 1490, 1512, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1496, 1518, 1535, 1544, 1550, 1556, 2340, 1384, 1381, 1516,
			 1555, 1554, 2340, 1556, 1558, 1557, 1560, 1556, 1561, 1569,
			 1387, 1571, 1568, 1575, 1631, 1640, 1649, 1656, 1662, 1684,
			 1693, 2320, 2318, 1597, 2309, 1616, 1574, 1667, 1194, 1543,
			 1715, 1727, 1671, 1737, 1760, 1767, 1805, 1380, 2267,    0,
			 1348, 1471,  834, 1778, 1477, 1553, 1478, 1565, 1573, 1578,
			 1577, 1594,    0, 1646, 1653,    0, 1661, 1688, 1704, 1737,
			 1741, 1739, 1730, 1739, 1812, 1771, 1763, 1775, 1776, 1769,
			 1771, 1772, 1773,    0,    0,    0,    0, 1772, 1803, 1808,
			 1795, 1814, 2288, 2276, 3731, 1848,  924, 1836, 1410, 3731,

			 1860, 1866, 1872, 1675, 1886, 2229, 1893, 1900, 1910, 1916,
			 1922, 1938,  574, 1950, 1962, 1848,  933, 2216, 1164, 1928,
			 1922, 1960, 1961, 1962, 2215, 1925, 2208, 1940, 1971, 2181,
			 1969, 1825, 1972, 1991, 2024, 2033, 1989, 1973, 1999, 1975,
			 1826, 2029, 3731, 1739, 2062, 1947, 3731, 2084, 3731, 1620,
			 1541, 2091, 3731, 2098, 3731,  691,    0, 2032,    0, 2032,
			    0,    0, 2050, 1718, 2108,    0, 1984, 1835, 1891, 1906,
			 1956, 1959, 2016, 2026, 2026, 2029, 2091,    0, 2024,    0,
			 2032, 2034,    0, 2003, 2120, 2034, 2038, 2099, 2100, 2099,
			 2111, 2101, 2113, 2114, 2115, 2105, 2109, 2118, 2120, 2179, yy_Dummy>>,
			1, 200, 400)
		end

	yy_base_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1908, 2137,    0,    0, 1922, 2170, 2190, 2169, 2197, 2148,
			 2217, 1869, 2228, 2237, 2243, 2208, 3731, 2249, 2247, 1898,
			 2248, 1873, 2218, 2249, 1850, 2157, 2247, 2207, 2253, 2256,
			 2258, 2262, 3731, 1850, 1841, 2259, 2268, 2263, 2269, 2272,
			 2329, 1790, 2339,    0, 2367, 2390, 1780, 2292, 2355, 2256,
			 1764,  683,    0, 2378, 1737,    0,    0, 2269,    0, 2280,
			    0, 2279, 2295,    0, 2305, 2324,    0, 2363, 2357, 2371,
			 2361, 2381, 2370, 2372, 2385, 2387, 2387, 2390,    0, 2379,
			 2393, 2393,    0, 2382, 2418, 1715,  992,    0, 2438, 1706,
			 2449, 2455, 2461, 2429, 2474, 1706, 2480, 2486, 2495, 2485,

			 2484, 1662, 2493, 1660, 2491, 1629, 1620, 1618, 2495, 1597,
			 2493, 2498, 2501, 2500, 1599, 1594, 2526, 2539, 1579,    0,
			    0, 1520, 2553, 2560, 2483,    0,    0, 2301, 2569, 2492,
			 2494,    0, 2510,    0, 2539,    0,    0,    0,    0,    0,
			    0,    0, 2531,    0, 2532,    0, 2540, 2549, 2560, 2561,
			    0,    0, 2580, 2609, 2598, 2618, 2624, 2635, 2469, 2647,
			 2597, 2653, 2651, 2625, 2572, 3731, 2652, 2650, 2655, 2656,
			 1500, 2656, 2664,  414, 2710,    0,    0, 1455, 2021, 1460,
			 1187,    0, 2716, 1443, 2620,    0, 1443, 2654, 2656, 2661,
			 2665, 2681, 2687, 2688, 2706,    0, 2709,    0, 1430, 1222, yy_Dummy>>,
			1, 200, 600)
		end

	yy_base_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 2732, 2738, 2753, 2759, 2765, 2771, 3731, 2778, 2776, 2777,
			 1248, 2780, 3731, 1203, 2778, 2776, 2778, 2797, 3731, 1212,
			 1379,    0,    0,    0, 2805, 2827, 2771, 1199, 2763, 2780,
			    0,    0, 2796, 2797,    0, 2786,    0, 1126, 2844,  970,
			 2850, 2865, 2871, 2869, 2828, 2830, 2848, 1228, 3731, 2891,
			    0,    0,    0,  997, 2843,    0, 2084, 2546, 2850, 2851,
			 2847,    0, 2203, 2900, 2855,  965,  916, 2889, 2897, 2900,
			    0,  844,  750, 2869,  639,    0,    0,    0,    0, 2890,
			 1100, 2920, 2933, 2919, 2923, 2929, 2930,  677,    0, 2855,
			    0,  565, 2902,    0,  506, 2958, 2943,  551,  498,  484,

			    0, 1453, 2905, 1614, 2969,    0, 1961, 2982, 2997, 2683,
			 3731, 2949, 2983, 2984, 2327,    0,  419, 2934, 3009, 3019,
			 3025, 3035,  388, 3020, 3021,    0,  267, 3731, 2000, 3057,
			    0, 3063, 3072, 3078, 3089,  293,  258, 2693, 3087, 3096,
			 3104, 3112, 3124, 3134, 3047, 3731, 3119, 3120, 3155, 3161,
			 3167, 3177, 3183, 3193, 3178, 3179, 3199, 3214, 3220, 3226,
			 3236, 2646, 3731, 3731, 3244, 3264, 3270, 3282, 3288, 3731,
			 3294, 3300, 3306, 3317, 3323, 3329, 3338, 3731, 3377, 3393,
			 3409, 3425, 3441, 1512, 2753, 3264, 3457, 3473, 3489, 3505,
			 3360, 3521, 3537, 3546, 3554,  162, 1755, 3569, 3585, 3601, yy_Dummy>>,
			1, 200, 800)
		end

	yy_base_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 2014, 3610, 2968, 3625, 3148, 2062, 3641, 3361, 3263, 3643,
			 3650, 3651, 3652, 3659, 2313, 2416, 3660, 3661, 2730, 3668,
			 2961, 3669, 3670, 3677, 2993, 3678, 3679, 3046, 3123, 3686,
			 3124, 3687, 3688, 3695, 3696, 3697, 3704, 3705, 3706, 3713,
			 3714, 3715, yy_Dummy>>,
			1, 42, 1000)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1041)
			yy_def_template_1 (an_array)
			yy_def_template_2 (an_array)
			yy_def_template_3 (an_array)
			yy_def_template_4 (an_array)
			yy_def_template_5 (an_array)
			an_array.area.fill_with (977, 938, 976)
			an_array.put (0, 977)
			an_array.area.fill_with (977, 978, 1041)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			    0,  977,    1,  978,  978,  979,  979,  980,  980,  977,
			    9,  977,  977,  977,  977,  977,  981,  977,  982,  977,
			  977,  977,  977,  977,  977,  977,  983,  977,  977,  977,
			  977,  977,  977,  977,  977,  984,  984,  984,  984,  984,
			  984,  984,  984,  984,  984,  984,  984,  984,  984,  984,
			  984,  985,  977,  977,  986,  977,   55,   55,  977,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			  977,  977,  977,  987,  977,  977,  977,  987,  987,  987,
			  987,  987,  988,  977,  989,  988,  977,  977,  977,  977,
			  977,  977,  990,  977,  990,  990,  977,  977,  977,  981,

			  977,  991,  991,  991,  992,  977,  977,  977,  993,  977,
			  977,  977,  977,  977,  977,  977,  984,  994,  984,  984,
			  984,  984,  984,  984,  984,  984,  984,  984,  984,  984,
			  984,  984,  984,  984,  984,  984,  977,   46,  984,  984,
			  984,  984,  984,  984,  984,  984,  984,  984,  984,  985,
			  985,  985,  985,  986,  977,  977,  977,  995,   58,  977,
			  158,  158,  158,  996,   58,   58,   58,   58,  158,   58,
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
			   58,  977,  987,  977,  977,  977,  977,  987,  987,  987,
			  987,  987,  988,  977,  997,  988,  989,  998,  989,  997,
			  977,  977,  977,  977,  999,  977,  990,  990,  977,  977,
			  977,  977,  977,  977,  977,  977,  977,  977,  977,  977,
			  977,  977,  977,  977,  977,  977,  977,  983, 1000,  977,
			  977,  977,  977,  977,  977,  994,  984,  984,  984,  984,
			  984,  984,  984,  984,  984,  984,  984,  977,  984,  984,
			  984,  984,  984,  984,  984,  977,  984,  984,  984,  984,
			  140,  140,  984,  984,  984,  984,  984,  984,  984,  984,

			  984,  984,  984,  977,  985,  985,  985,  985,  977, 1001,
			  977,  158,  158,  158, 1002, 1002,   58,   58,   58,  158,
			   58,  158,  158,   58,   58,  158,  158,  158,   58,   58,
			   58,  158,  158,   58,   58,  977,  158,  158,  158,  158,
			  158,   58,   58,  158,   58,  158,   58,  158,  158,   58,
			   58,  158,  158,   58,   58,  158,  158,  158,   58,   58,
			   58,  158,   58,  158,   58,  987,  987,  987,  987,  987,
			  987,  987,  997,  977,  998,  977,  977,  977, 1003, 1003,
			  977, 1003, 1003, 1003,  977,  977,  977,  977,  977,  977,
			  977,  977,  977,  977,  977, 1004, 1004,  977,  977,  977, yy_Dummy>>,
			1, 200, 200)
		end

	yy_def_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  977,  977,  977,  977,  977,  977,  994,  984,  984,  984,
			  984,  984,  984,  984,  984,  984,  984,  977,  984,  984,
			  984,  984,  984,  984,  984,  984,  425,  425,  977,  984,
			  984,  984,  984,  977,  984,  984,  984,  984,  984,  977,
			  985,  985,  985,  985,  985,  985,  985,  985, 1005, 1006,
			  158,  158, 1002, 1002,   58,   58,  158,   58,  158,  158,
			   58,   58,  158,  158,  158,   58,   58,   58,  158,  158,
			   58,  158,  158,  158,  977,   58,   58,  158,   58,  158,
			  158,   58,   58,  158,  158,   58,   58,  158,  158,  158,
			   58,   58,  158,   58,  977,  977,  977,  977,  977,  977,

			  977,  977,  977, 1004, 1004,  977,  977,  977,  977,  977,
			  977,  977,  977,  977,  977,  977,  977,  984,  984,  984,
			  984,  984,  984,  984,  984,  984,  977,  984,  984,  984,
			  984,  984,  984,  977,  984,  534,  977,  984,  984,  984,
			  984,  977,  977,  977,  985,  977,  977,  985,  977,  977,
			 1007,  985,  977,  985,  977,  985, 1008, 1008,  158,  158,
			 1009, 1010,  977, 1002, 1002,   58,   58,  158,   58,  158,
			  158,   58,   58,  158,  158,   58,   58,  158,  158,   58,
			  158,  158,  158,  977,  977,   58,   58,  158,   58,  158,
			  158,   58,   58,  158,  158,  158,  158,   58,   58,  977, yy_Dummy>>,
			1, 200, 400)
		end

	yy_def_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  977,  977, 1011, 1012,  977, 1004, 1004,  977,  977,  977,
			  977,  977,  977,  977,  977,  977,  977,  977,  984,  984,
			  984,  984,  984,  984,  984,  984,  977,  984,  984,  984,
			  984,  984,  977,  977,  984,  984,  984,  984,  977,  977,
			  985,  977,  985, 1013,  985,  985,  985, 1008, 1008,  158,
			 1009, 1010, 1014, 1010,  977,  158,   58,  158,  158,   58,
			   58,  158,  158,  158,   58,   58,   58,  158,  158,  158,
			   58,   58,  158,   58,  158,  158,   58,   58,  158,  158,
			  158,  158,   58,   58,  977, 1011, 1012, 1015, 1012,  977,
			  977,  977,  977,  977,  977,  977,  977,  977,  977,  984,

			  984,  984,  984,  984,  977,  984,  984,  984,  984,  984,
			  977,  984,  984,  984,  977,  977,  977, 1013,  977, 1016,
			 1017,  977, 1008, 1008,  158, 1018, 1019, 1010, 1010,  158,
			   58,  158,  158,   58,   58,  158,  158,  158,   58,   58,
			  158,   58,  158,  158,   58,   58,  158,  158,  158,   58,
			 1020, 1021, 1012, 1012,  977,  977,  977,  977,  977,  977,
			  977,  977,  984,  984,  984,  977,  984,  977,  984,  984,
			  984,  977,  977,  977,  977, 1022, 1023,  977,  977, 1016,
			 1017, 1024, 1017,  977,  158, 1025, 1019,  158,   58,  158,
			   58,  158,   58,  158,  158,  158,   58, 1026, 1021,  977, yy_Dummy>>,
			1, 200, 600)
		end

	yy_def_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  977,  977,  977,  977,  977,  977,  977,  977,  984,  984,
			  984,  984,  977,  984,  984,  977,  977,  977,  977, 1022,
			 1023, 1027, 1028, 1029, 1017, 1017,  158, 1025,  158,   58,
			  158,   58,  158,   58,  158,  158,   58, 1026,  977,  977,
			  977,  977,  977,  984,  984,  984,  984,  977,  977,  977,
			 1030, 1031, 1032, 1029,  158, 1033,  158,   58,  158,   58,
			  158, 1034,  977,  977,  984,  984,  984,  984,  977,  977,
			 1035, 1031, 1032,  158, 1033,  158,   58,  158,   58,  158,
			 1034,  977,  977,  984,  984,  977,  977, 1035, 1036,  158,
			 1037,  977,  158, 1038,  977,  977,  984,  984,  977,  977,

			 1039, 1036,  158, 1037,  977,  158, 1038,  977,  977,  977,
			  977,  984,  977,  977, 1039, 1040,  977,  158,  977,  977,
			  977,  977,  984,  977,  977, 1041,  977,  977, 1040,  977,
			  158,  977,  977,  977,  977,  977,  977, 1041, yy_Dummy>>,
			1, 138, 800)
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
			create an_array.make_filled (0, 0, 977)
			yy_accept_template_1 (an_array)
			an_array.area.fill_with (87, 164, 195)
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
			   87,   87,   87,    0, yy_Dummy>>,
			1, 164, 0)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			   39,   87,   39,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   91,  124,  126,  125,  122,
			  121,  123,  124,  124,  124,  124,   92,   95,    0,   92,
			    0,    0,    0,   93,   94,    0,    0,  107,    0,    0,
			    0,    0,  115,    0,  114,    0,  113,  117,  134,  128,
			  134,  134,  134,  134,  134,  134,    4,   33,  103,    0,
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
			   87,   87,   87,   87,   87,   40,   40,   87,   87,  124,
			  124,  124,  124,  124,  124,  124,    0,   93,   94,  108,
			    0,    0,    0,    0,  116,  114,  113,  117,  132,  135,
			  135,  133,  129,  130,  131,  103,    0,  103,    0,    0, yy_Dummy>>,
			1, 200, 196)
		end

	yy_accept_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,   99,    0,    0,    0,  102,   97,    0,    0,
			   85,   84,   84,   84,   84,   84,   37,   84,   84,   84,
			   84,    0,   84,   84,   84,   84,   84,   84,   75,   84,
			   84,   84,    0,   75,   75,   75,   36,    0,   43,   84,
			   84,   84,   84,  112,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   90,   87,   87,    0,    0,   87,   87,
			   87,   87,   87,   87,   87,   87,   37,   87,   87,   37,
			   87,   87,   87,   87,   87,   87,   87,   87,    0,   87,
			   87,   87,   87,   87,   87,   87,   87,   36,   43,   36,
			   43,   87,   87,   87,   87,   87,   87,   87,   94,    0,

			  106,    0,  105,  109,  103,    0,    0,    0,    0,   98,
			   99,    0,  100,    0,  102,    0,    0,    0,   97,   72,
			    0,   58,   84,   84,   84,   84,   84,   84,   44,   84,
			    0,   84,   84,   35,   84,   84,   84,    0,   84,   84,
			    0,   84,   84,   84,   84,    0,  111,    0,    0,    0,
			   64,    0,   65,    0,    0,    0,   62,    0,   61,    0,
			    0,    0,   58,   87,    0,    0,    0,    0,    0,   58,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   44,   87,   44,   87,   87,   35,   63,   63,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87, yy_Dummy>>,
			1, 200, 396)
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
			1, 200, 596)
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
			1, 182, 796)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 3731
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 977
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 978
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
