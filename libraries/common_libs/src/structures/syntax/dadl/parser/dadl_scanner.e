indexing
	component:   "openEHR Archetype Project"
	description: "Scanner for dADL syntax items"
	keywords:    "ADL, dADL"
	
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class DADL_SCANNER

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton,
			output as print_out
		end

	DADL_TOKENS
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
			Result := (INITIAL <= sc and sc <= IN_CADL_BLOCK)
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
if yy_act <= 39 then
if yy_act <= 20 then
if yy_act <= 10 then
if yy_act <= 5 then
if yy_act <= 3 then
if yy_act <= 2 then
if yy_act = 1 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 65 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 65")
end
-- Ignore separators
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 66 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 66")
end
in_lineno := in_lineno + text_count
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 71 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 71")
end
-- Ignore comments
end
else
if yy_act = 4 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 72 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 72")
end
in_lineno := in_lineno + 1
else
	yy_position := yy_position + 1
--|#line 76 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 76")
end
last_token := Minus_code
end
end
else
if yy_act <= 8 then
if yy_act <= 7 then
if yy_act = 6 then
	yy_position := yy_position + 1
--|#line 77 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 77")
end
last_token := Plus_code
else
	yy_position := yy_position + 1
--|#line 78 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 78")
end
last_token := Star_code
end
else
	yy_position := yy_position + 1
--|#line 79 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 79")
end
last_token := Slash_code
end
else
if yy_act = 9 then
	yy_position := yy_position + 1
--|#line 80 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 80")
end
last_token := Caret_code
else
	yy_position := yy_position + 1
--|#line 81 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 81")
end
last_token := Dot_code
end
end
end
else
if yy_act <= 15 then
if yy_act <= 13 then
if yy_act <= 12 then
if yy_act = 11 then
	yy_position := yy_position + 1
--|#line 82 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 82")
end
last_token := Semicolon_code
else
	yy_position := yy_position + 1
--|#line 83 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 83")
end
last_token := Comma_code
end
else
	yy_position := yy_position + 1
--|#line 84 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 84")
end
last_token := Colon_code
end
else
if yy_act = 14 then
	yy_position := yy_position + 1
--|#line 85 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 85")
end
last_token := Exclamation_code
else
	yy_position := yy_position + 1
--|#line 86 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 86")
end
last_token := Left_parenthesis_code
end
end
else
if yy_act <= 18 then
if yy_act <= 17 then
if yy_act = 16 then
	yy_position := yy_position + 1
--|#line 87 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 87")
end
last_token := Right_parenthesis_code
else
	yy_position := yy_position + 1
--|#line 88 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 88")
end
last_token := Dollar_code
end
else
	yy_position := yy_position + 2
--|#line 89 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 89")
end
last_token := SYM_DT_UNKNOWN
end
else
if yy_act = 19 then
	yy_position := yy_position + 1
--|#line 90 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 90")
end
last_token := Question_mark_code
else
	yy_position := yy_position + 1
--|#line 92 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 92")
end

			if in_interval then
				in_interval := False
			elseif start_block_received then
				in_interval := True
				start_block_received := False
			end
			last_token := SYM_INTERVAL_DELIM
		
end
end
end
end
else
if yy_act <= 30 then
if yy_act <= 25 then
if yy_act <= 23 then
if yy_act <= 22 then
if yy_act = 21 then
	yy_position := yy_position + 1
--|#line 102 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 102")
end
last_token := Left_bracket_code
else
	yy_position := yy_position + 1
--|#line 103 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 103")
end
last_token := Right_bracket_code
end
else
	yy_position := yy_position + 1
--|#line 105 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 105")
end
last_token := SYM_EQ
end
else
if yy_act = 24 then
	yy_position := yy_position + 2
--|#line 107 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 107")
end
last_token := SYM_GE
else
	yy_position := yy_position + 2
--|#line 108 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 108")
end
last_token := SYM_LE
end
end
else
if yy_act <= 28 then
if yy_act <= 27 then
if yy_act = 26 then
	yy_position := yy_position + 1
--|#line 110 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 110")
end

			if in_interval then
				last_token := SYM_LT
				start_block_received := False
			else
				last_token := SYM_START_DBLOCK
				start_block_received := True
			end
		
else
	yy_position := yy_position + 1
--|#line 120 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 120")
end

			if in_interval then
				last_token := SYM_GT
			else
				last_token := SYM_END_DBLOCK
			end
		
end
else
	yy_position := yy_position + 2
--|#line 128 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 128")
end
last_token := SYM_ELLIPSIS
end
else
if yy_act = 29 then
	yy_position := yy_position + 3
--|#line 129 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 129")
end
last_token := SYM_LIST_CONTINUE
else
	yy_position := yy_position + 4
--|#line 133 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 133")
end
last_token := SYM_TRUE
end
end
end
else
if yy_act <= 35 then
if yy_act <= 33 then
if yy_act <= 32 then
if yy_act = 31 then
	yy_position := yy_position + 5
--|#line 135 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 135")
end
last_token := SYM_FALSE
else
	yy_position := yy_position + 8
--|#line 137 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 137")
end
last_token := SYM_INFINITY
end
else
	yy_position := yy_position + 5
--|#line 140 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 140")
end
last_token := SYM_QUERY_FUNC
end
else
if yy_act = 34 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 143 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 143")
end

	last_token := V_URI
	last_string_value := text

else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 149 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 149")
end

					last_token := V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
end
else
if yy_act <= 37 then
if yy_act = 36 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 154 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 154")
end

					last_token := ERR_V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 159 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 159")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 38 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 164 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 164")
end

					last_token := ERR_V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 170 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 170")
end

					last_token := V_LOCAL_CODE
					last_string_value := text
			
end
end
end
end
end
else
if yy_act <= 58 then
if yy_act <= 49 then
if yy_act <= 44 then
if yy_act <= 42 then
if yy_act <= 41 then
if yy_act = 40 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 177 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 177")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 178 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 178")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 179 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 179")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
if yy_act = 43 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 186 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 186")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 187 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 187")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
end
else
if yy_act <= 47 then
if yy_act <= 46 then
if yy_act = 45 then
	yy_position := yy_position + 10
--|#line 194 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 194")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
	yy_position := yy_position + 7
--|#line 195 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 195")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 205 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 205")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
else
if yy_act = 48 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 206 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 206")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 212 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 212")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
end
end
end
else
if yy_act <= 54 then
if yy_act <= 52 then
if yy_act <= 51 then
if yy_act = 50 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 217 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 217")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 222 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 222")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 229 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 229")
end
				-- beginning of CADL block
				in_buffer.append_string (text)
				set_start_condition (IN_CADL_BLOCK)
				cadl_depth := 1
			
end
else
if yy_act = 53 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 236 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 236")
end
		-- got an open brace
				in_buffer.append_string (text)
				cadl_depth := cadl_depth + 1
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 240 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 240")
end
		-- got a close brace
				in_buffer.append_string (text)
				cadl_depth := cadl_depth - 1
				if cadl_depth = 0 then
					set_start_condition (INITIAL)
					last_token := V_CADL_BLOCK
					create last_string_value.make(in_buffer.count)
					last_string_value.append(in_buffer)
					in_lineno := in_lineno + in_buffer.occurrences('%N')
					in_buffer.wipe_out
				end
			
end
end
else
if yy_act <= 56 then
if yy_act = 55 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 257 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 257")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 258 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 258")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
else
if yy_act = 57 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 265 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 265")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 266 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 266")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
end
end
end
else
if yy_act <= 68 then
if yy_act <= 63 then
if yy_act <= 61 then
if yy_act <= 60 then
if yy_act = 59 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 273 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 273")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 278 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 278")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
end
else
	yy_position := yy_position + 2
--|#line 286 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 286")
end
in_buffer.append_character ('\')
end
else
if yy_act = 62 then
	yy_position := yy_position + 2
--|#line 288 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 288")
end
in_buffer.append_character ('"')
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 290 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 290")
end

				in_buffer.append_string (text)
	
end
end
else
if yy_act <= 66 then
if yy_act <= 65 then
if yy_act = 64 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 294 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 294")
end
in_buffer.append_string (text)
else
	yy_position := yy_position + 1
--|#line 296 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 296")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 301 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 301")
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
			
end
else
if yy_act = 67 then
	yy_position := yy_position + 1
--|#line 314 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 314")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
else
	yy_position := yy_position + 3
--|#line 324 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 324")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
end
end
end
else
if yy_act <= 73 then
if yy_act <= 71 then
if yy_act <= 70 then
if yy_act = 69 then
	yy_position := yy_position + 4
--|#line 326 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 326")
end
last_token := V_CHARACTER; last_character_value := '%N'
else
	yy_position := yy_position + 4
--|#line 327 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 327")
end
last_token := V_CHARACTER; last_character_value := '%R'
end
else
	yy_position := yy_position + 4
--|#line 328 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 328")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 72 then
	yy_position := yy_position + 4
--|#line 329 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 329")
end
last_token := V_CHARACTER; last_character_value := '%''
else
	yy_position := yy_position + 4
--|#line 330 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 330")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 75 then
if yy_act = 74 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 332 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 332")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 333 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 333")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 76 then
	yy_position := yy_position + 1
--|#line 337 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 337")
end
;
else
	yy_position := yy_position + 1
--|#line 0 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 0")
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
when 0, 2 then
--|#line 0 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 0")
end
terminate
when 1 then
--|#line 0 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 0")
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
			create an_array.make (0, 1805)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			    0,    8,    9,   10,    9,   11,   12,   13,   14,   15,
			   16,   17,   18,   19,   20,   21,   22,   23,   23,   24,
			   24,   24,   25,   26,   27,   28,   29,   30,   31,   31,
			   31,   31,   32,   31,   33,   31,   31,   31,   34,   35,
			   31,   31,   36,   31,   31,   31,   31,   37,    8,   38,
			   39,    8,   40,   41,   41,   41,   41,   42,   41,   43,
			   41,   41,   41,   44,   41,   41,   45,   41,   41,   41,
			   46,   47,    8,    8,    8,    8,    8,    8,    8,    8,
			    8,   49,   65,   58,   50,   59,   49,   77,   58,   50,
			   59,   60,   69,   60,   70,   70,   70,   70,   70,   69,

			   79,   72,   72,   72,   72,   72,   77,  101,   71,   77,
			   78,   77,   88,  246,  144,   71,   80,   80,   80,   80,
			   80,   94,   66,   77,   88,   79,   51,   83,   82,  150,
			   77,   51,   88,   71,   78,   88,  232,   84,   84,  144,
			   71,   81,   84,   84,   88,   95,   77,   88,   90,  102,
			  223,   83,   82,  150,   52,   53,   54,   55,   56,   52,
			   53,   54,   55,   56,   96,  135,  222,  100,  100,  248,
			  248,  100,   91,  100,   88,   60,  100,   60,   88,   84,
			   86,   86,   86,   86,   86,   87,   88,  146,   97,  135,
			   88,   86,   86,   86,   86,   86,   86,   86,   86,   86,

			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			  221,  119,  146,  119,   86,   88,   88,   89,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   89,
			   88,   88,   88,   92,  103,  103,  103,  104,  105,  105,
			  105,  106,  106,  107,  107,  107,   77,   88,   77,  148,
			   88,  238,  238,  238,  113,  220,  128,  127,   93,   88,
			   77,   77,   88,  114,  114,  114,  114,  114,  121,  121,
			  121,  121,  121,   69,  148,  122,  122,  122,  122,  122,
			  123,  128,  127,   77,  133,  133,  133,  133,  133,   71,
			  124,   77,  124,  185,  115,  125,  125,  125,  125,  125,

			   69,   81,  122,  122,  122,  122,  122,  150,  116,  144,
			  117,  100,  118,  148,   71,   77,   71,  185,   88,  214,
			  100,  142,  134,  143,  143,  143,  143,  143,   88,  146,
			   88,  151,   77,   77,  145,  184,   88,  169,  149,  183,
			   88,   71,   80,   80,   80,   80,   80,  134,   88,   77,
			  182,   88,  181,  169,  147,  129,  168,  168,  168,  168,
			   88,  130,  182,   88,  125,  125,  125,  125,  125,  131,
			  132,  165,   88,  160,  161,  161,  161,  161,  161,   88,
			  129,  152,  153,  154,  155,  156,  130,  103,  103,  103,
			  164,   88,  163,  131,  132,  137,  137,  137,  137,  137,

			  137,  137,  137,  138,  138,  137,  137,  137,  139,  139,
			  137,  139,  139,  139,  139,  139,  140,  137,  137,  137,
			  137,  137,  139,  139,  139,  139,  139,  139,  139,  139,
			  139,  139,  139,  139,  139,  139,  139,  139,  139,  139,
			  139,  137,  137,  141,  137,  139,  139,  139,  139,  139,
			  139,  139,  139,  139,  139,  139,  139,  139,  139,  139,
			  139,  139,  139,  139,  137,  137,  137,  137,  137,  137,
			  137,  137,  137,  137,  137,  274,  100,  162,  159,  100,
			  189,  109,  100,   88,  121,  121,  121,  121,  121,  125,
			  125,  125,  125,  125,  100,   88,  136,  142,  166,  142,

			  142,  142,  142,  142,  189,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,  166,   69,   77,  167,  167,  167,  167,
			  167,  172,  172,  172,  172,  172,   77,   77,   77,  120,
			   71,  119,  170,  103,  103,  103,  157,  157,  157,  158,
			  158,  158,   77,  179,  187,  100,   81,  173,  173,  173,
			  173,  173,  171,  191,   77,   71,  170,  174,  174,  174,
			  174,  174,   88,   77,   77,   77,  112,  179,  185,  187,
			  180,   63,   81,   77,   88,   61,  109,  171,  191,  100,
			  198,   88,   81,  175,  187,  175,  203,  133,  133,  133,

			  133,  133,  186,   88,   77,  180,  142,  212,  143,  143,
			  143,  143,  143,  176,   88,  198,  177,   77,  189,  188,
			  203,  178,  103,  103,  103,   75,   88,   74,  193,   73,
			  193,  212,   88,  194,  194,  194,  194,  194,  176,   68,
			   67,  177,  190,   63,   88,  178,  137,  137,  137,  137,
			  137,  137,  137,  137,  138,  138,  137,  137,  137,  138,
			  138,  137,  138,  138,  138,  138,  138,  140,  137,  137,
			  137,  137,  137,  138,  138,  138,  138,  138,  138,  138,
			  138,  138,  138,  138,  138,  138,  138,  138,  138,  138,
			  138,  138,  137,  137,  182,  137,  138,  138,  138,  138,

			  138,  138,  138,  138,  138,  138,  138,  138,  138,  138,
			  138,  138,  138,  138,  138,  137,  137,  137,  137,  137,
			  137,  137,  137,  137,  137,  137,  191,  100,   61,  208,
			  100,  274,  100,  274,  274,  100,  230,   77,  100,  274,
			  274,  100,  160,  161,  161,  161,  161,  161,  274,   88,
			  199,  192,  195,   69,  208,  196,  196,  196,  196,  196,
			  230,   88,  197,  197,  197,  197,  197,  274,  274,   71,
			  200,  200,  200,  200,  200,  199,  174,  174,  174,  174,
			  174,  201,  201,  201,  201,  201,  274,  274,   77,  173,
			  173,  173,  173,  173,   71,  130,  104,  105,  105,  105,

			  106,  106,  107,  107,  107,  103,  103,  103,  103,  103,
			  103,  172,  172,  172,  172,  172,   76,  210,  208,  210,
			  130,  202,  202,  202,  202,  202,  212,  215,   77,  215,
			   76,  228,  228,  228,  228,   88,   88,  216,  236,   76,
			   76,   88,  210,  209,  211,  274,  274,   88,   88,  274,
			  213,  274,  274,   88,  274,   76,  194,  194,  194,  194,
			  194,  217,  236,   76,  204,  204,  204,  204,  204,  204,
			  204,  204,  204,  204,  204,  204,  204,  205,  205,  204,
			  205,  205,  205,  205,  205,  204,  204,  204,  204,  204,
			  204,  205,  205,  205,  205,  205,  205,  205,  205,  205,

			  205,  205,  205,  205,  205,  205,  205,  205,  205,  205,
			  204,  204,  274,  204,  205,  205,  205,  205,  205,  205,
			  205,  205,  205,  205,  205,  205,  205,  205,  205,  205,
			  205,  205,  205,  204,  204,  204,  204,  204,  204,  204,
			  204,  204,  204,  204,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  207,  207,  206,
			  207,  207,  207,  207,  207,  206,  206,  206,  206,  206,
			  206,  207,  207,  207,  207,  207,  207,  207,  207,  207,
			  207,  207,  207,  207,  207,  207,  207,  207,  207,  207,
			  206,  206,  182,  206,  207,  207,  207,  207,  207,  207, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  207,  207,  207,  207,  207,  207,  207,  207,  207,  207,
			  207,  207,  207,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  194,  194,  194,  194,  194,   69,
			   77,  196,  196,  196,  196,  196,  274,  224,  274,  274,
			  218,  255,  255,  255,  255,   71,  274,  200,  200,  200,
			  200,  200,  201,  201,  201,  201,  201,  202,  202,  202,
			  202,  202,  224,  230,  224,  218,  274,   77,   76,  274,
			   71,  219,  274,   76,  274,   88,   76,  226,  226,  226,
			  226,  226,  274,  274,   88,  229,   77,  231,  274,  225,
			  274,  274,  274,   76,  274,  219,   88,  274,   76,  236,

			  274,   76,  227,  227,  227,  227,  227,  235,   88,  229,
			  233,  233,  233,  233,  233,  234,  234,  234,  234,  234,
			   88,  274,  274,  237,  239,  239,  239,  239,  239,  274,
			  274,  235,  240,  241,  240,  241,  243,  243,  243,  243,
			  243,  217,  217,  217,  217,  217,  244,  244,  244,  244,
			  244,  245,  245,  245,  245,  245,  247,  247,  247,  247,
			  247,  274,  240,  274,  240,  274,  242,  245,  245,  245,
			  245,  245,  249,  249,  249,  249,  249,  250,  250,  250,
			  250,  250,  242,  242,  242,  242,  242,  251,  274,  251,
			  254,  254,  254,  254,  254,  274,  242,  252,  256,  256,

			  256,  256,  256,  257,  257,  257,  257,  257,  258,  258,
			  258,  258,  258,  259,  274,  259,  253,  253,  253,  253,
			  253,  253,  274,  260,  262,  262,  262,  262,  262,  263,
			  263,  263,  263,  264,  264,  264,  264,  264,  265,  265,
			  265,  265,  265,  267,  268,  267,  268,  261,  266,  266,
			  266,  266,  266,  261,  261,  261,  261,  261,  270,  270,
			  270,  270,  270,  271,  271,  271,  271,  271,  272,  272,
			  272,  272,  272,  267,  274,  267,  274,  269,  271,  271,
			  271,  271,  271,  273,  273,  273,  273,  273,  269,  269,
			  269,  269,  269,  274,  274,  274,  274,  274,  274,  274,

			  274,  274,  274,  274,  274,  274,  274,  269,   48,   48,
			   48,   48,   48,   48,   48,   48,   48,   48,   48,   48,
			   48,   48,   48,   48,   48,   48,   48,   48,   48,   48,
			   48,   48,   48,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   62,  274,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,  274,   62,   62,   62,   62,   62,
			   62,   62,   62,   64,  274,   64,   64,   64,   64,   64,
			   64,   64,   64,   64,   64,   64,   64,   64,   64,   64,

			   64,   64,   64,   64,   64,   64,   64,   64,   76,   76,
			  274,   76,  274,   76,   76,   76,  274,   76,   76,   76,
			   76,   76,   76,   85,   85,  274,   85,   85,   85,   85,
			  274,  274,  274,   85,   85,   85,  274,   85,   85,   85,
			   85,   85,   85,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   99,  274,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,  274,   99,   99,   99,   99,   99,   99,   99,
			   99,  108,  108,  108,  108,  108,  108,  108,  108,  108,

			  108,  108,  108,  108,  108,  108,  108,  108,  108,  108,
			  108,  108,  108,  108,  274,  108,  110,  110,  110,  110,
			  110,  110,  110,  110,  110,  110,  110,  110,  110,  110,
			  110,  110,  110,  110,  110,  110,  110,  110,  110,  111,
			  274,  111,  111,  111,  111,  111,  111,  111,  111,  111,
			  111,  111,  111,  111,  111,  111,  111,  111,  111,  111,
			  111,  111,  111,  111,   67,   67,   67,   67,   67,   67,
			   67,   67,   67,   67,   67,   67,   67,   67,   67,   67,
			   67,   67,   67,   67,   67,   67,   67,   67,   67,  126,
			  274,  274,  126,  126,  274,  126,  126,  126,  126,  126,

			  274,  126,  126,  126,  126,  126,  126,   84,   84,  274,
			   84,   84,   84,   84,   84,  274,  274,   84,   84,   84,
			  274,   84,   84,   84,   84,   84,   84,   87,   87,  274,
			   87,   87,   87,   87,   87,   87,   87,   87,  274,  274,
			   87,   87,   87,  274,   87,   87,   87,   87,   87,   87,
			  137,  137,  137,  137,  137,  137,  137,  137,  137,  137,
			  137,  137,  137,  137,  137,  137,  137,  137,  137,  137,
			  137,  137,  137,  137,  137,  204,  204,  204,  204,  204,
			  204,  204,  204,  204,  204,  204,  204,  204,  204,  204,
			  204,  204,  204,  204,  204,  204,  204,  204,  204,  204,

			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,    7,  274,  274,  274,  274,
			  274,  274,  274,  274,  274,  274,  274,  274,  274,  274,
			  274,  274,  274,  274,  274,  274,  274,  274,  274,  274,
			  274,  274,  274,  274,  274,  274,  274,  274,  274,  274,
			  274,  274,  274,  274,  274,  274,  274,  274,  274,  274,
			  274,  274,  274,  274,  274,  274,  274,  274,  274,  274,
			  274,  274,  274,  274,  274,  274,  274,  274,  274,  274,
			  274,  274,  274,  274,  274,  274,  274,  274,  274,  274,

			  274,  274,  274,  274,  274,  274, yy_Dummy>>,
			1, 806, 1000)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 1805)
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
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    3,   14,    5,    3,    5,    4,   33,    6,    4,
			    6,    9,   23,    9,   23,   23,   23,   23,   23,   24,

			   33,   24,   24,   24,   24,   24,   32,   51,   23,   35,
			   32,   36,   41,  243,   90,   24,   34,   34,   34,   34,
			   34,   44,   14,   34,   41,   33,    3,   36,   35,   96,
			  235,    4,   44,   23,   32,   88,  226,   37,   37,   90,
			   24,   34,   37,   37,   44,   44,   83,   88,   42,   51,
			  207,   36,   35,   96,    3,    3,    3,    3,    3,    4,
			    4,    4,    4,    4,   45,   83,  206,   52,   53,  246,
			  246,   54,   42,   55,   42,   60,   56,   60,   45,   37,
			   40,   40,   40,   40,   40,   40,   42,   92,   45,   83,
			   45,   40,   40,   40,   40,   40,   40,   40,   40,   40,

			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			  205,  119,   92,  119,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   43,   52,   52,   52,   53,   54,   54,
			   54,   55,   55,   56,   56,   56,   78,  192,   79,   94,
			   43,  232,  232,  232,   66,  204,   79,   78,   43,  192,
			  203,  198,   43,   66,   66,   66,   66,   66,   69,   69,
			   69,   69,   69,   70,   94,   70,   70,   70,   70,   70,
			   70,   79,   78,  129,   81,   81,   81,   81,   81,   70,
			   71,   81,   71,  144,   66,   71,   71,   71,   71,   71,

			   72,  129,   72,   72,   72,   72,   72,   97,   66,   91,
			   66,  103,   66,   95,   70,   82,   72,  144,   97,  195,
			  104,   89,   82,   89,   89,   89,   89,   89,   91,   93,
			   97,   97,  180,  178,   91,  140,   95,  169,   95,  139,
			   91,   72,   80,   80,   80,   80,   80,   82,   95,   80,
			  137,   93,  136,  126,   93,   80,  123,  123,  123,  123,
			   89,   80,  140,   93,  124,  124,  124,  124,  124,   80,
			   80,  118,   89,  114,  114,  114,  114,  114,  114,  209,
			   80,  103,  103,  103,  103,  103,   80,  104,  104,  104,
			  117,  209,  116,   80,   80,   85,   85,   85,   85,   85,

			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   86,  105,  115,  113,  106,
			  148,  108,  107,  213,  121,  121,  121,  121,  121,  125,
			  125,  125,  125,  125,   99,  213,   84,  142,  121,  142,

			  142,  142,  142,  142,  148,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,  121,  122,  127,  122,  122,  122,  122,
			  122,  130,  130,  130,  130,  130,   76,  134,  130,   68,
			  122,   67,  127,  105,  105,  105,  106,  106,  106,  107,
			  107,  107,  128,  134,  146,  152,  130,  131,  131,  131,
			  131,  131,  128,  150,  131,  122,  127,  132,  132,  132,
			  132,  132,  237,  135,  132,  179,   64,  134,  145,  146,
			  135,   62,  131,  170,  237,   61,   57,  128,  150,   48,
			  170,  145,  132,  133,  147,  133,  179,  133,  133,  133,

			  133,  133,  145,  145,  133,  135,  143,  189,  143,  143,
			  143,  143,  143,  133,  147,  170,  133,   31,  149,  147,
			  179,  133,  152,  152,  152,   30,  147,   29,  166,   27,
			  166,  189,  149,  166,  166,  166,  166,  166,  133,   21,
			   20,  133,  149,   12,  149,  133,  138,  138,  138,  138,
			  138,  138,  138,  138,  138,  138,  138,  138,  138,  138,
			  138,  138,  138,  138,  138,  138,  138,  138,  138,  138,
			  138,  138,  138,  138,  138,  138,  138,  138,  138,  138,
			  138,  138,  138,  138,  138,  138,  138,  138,  138,  138,
			  138,  138,  138,  138,  138,  138,  138,  138,  138,  138,

			  138,  138,  138,  138,  138,  138,  138,  138,  138,  138,
			  138,  138,  138,  138,  138,  138,  138,  138,  138,  138,
			  138,  138,  138,  138,  138,  138,  151,  153,   10,  185,
			  154,    7,  155,    0,    0,  156,  224,  171,  157,    0,
			    0,  158,  161,  161,  161,  161,  161,  161,    0,  151,
			  171,  151,  167,  167,  185,  167,  167,  167,  167,  167,
			  224,  151,  168,  168,  168,  168,  168,    0,    0,  167,
			  175,  175,  175,  175,  175,  171,  174,  174,  174,  174,
			  174,  176,  176,  176,  176,  176,    0,    0,  176,  173,
			  173,  173,  173,  173,  167,  174,  153,  154,  154,  154,

			  155,  155,  156,  156,  156,  157,  157,  157,  158,  158,
			  158,  172,  172,  172,  172,  172,  173,  187,  186,  188,
			  174,  177,  177,  177,  177,  177,  190,  197,  177,  197,
			  172,  216,  216,  216,  216,  190,  188,  197,  230,  172,
			  173,  186,  187,  186,  188,    0,    0,  190,  188,    0,
			  190,    0,    0,  186,    0,  172,  193,  193,  193,  193,
			  193,  197,  230,  172,  181,  181,  181,  181,  181,  181,
			  181,  181,  181,  181,  181,  181,  181,  181,  181,  181,
			  181,  181,  181,  181,  181,  181,  181,  181,  181,  181,
			  181,  181,  181,  181,  181,  181,  181,  181,  181,  181,

			  181,  181,  181,  181,  181,  181,  181,  181,  181,  181,
			  181,  181,    0,  181,  181,  181,  181,  181,  181,  181,
			  181,  181,  181,  181,  181,  181,  181,  181,  181,  181,
			  181,  181,  181,  181,  181,  181,  181,  181,  181,  181,
			  181,  181,  181,  181,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,  184,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,  184,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,  184,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,  184,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,  184,  184,  184,  184,  184,  184,  184, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  184,  184,  184,  184,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,  184,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,  184,  194,  194,  194,  194,  194,  196,
			  199,  196,  196,  196,  196,  196,    0,  210,    0,    0,
			  199,  252,  252,  252,  252,  196,    0,  200,  200,  200,
			  200,  200,  201,  201,  201,  201,  201,  202,  202,  202,
			  202,  202,  210,  225,  211,  199,    0,  218,  201,    0,
			  196,  200,    0,  202,    0,  225,  202,  214,  214,  214,
			  214,  214,    0,    0,  211,  218,  229,  225,    0,  211,
			    0,    0,    0,  201,    0,  200,  211,    0,  202,  231,

			    0,  202,  215,  215,  215,  215,  215,  229,  231,  218,
			  227,  227,  227,  227,  227,  228,  228,  228,  228,  228,
			  231,    0,    0,  231,  233,  233,  233,  233,  233,    0,
			    0,  229,  234,  234,  234,  234,  238,  238,  238,  238,
			  238,  239,  239,  239,  239,  239,  240,  240,  240,  240,
			  240,  241,  241,  241,  241,  241,  244,  244,  244,  244,
			  244,    0,  245,    0,  245,    0,  234,  245,  245,  245,
			  245,  245,  247,  247,  247,  247,  247,  248,  248,  248,
			  248,  248,  249,  249,  249,  249,  249,  250,    0,  250,
			  251,  251,  251,  251,  251,    0,  245,  250,  254,  254,

			  254,  254,  254,  255,  255,  255,  255,  255,  256,  256,
			  256,  256,  256,  257,    0,  257,  258,  258,  258,  258,
			  258,  250,    0,  257,  259,  259,  259,  259,  259,  260,
			  260,  260,  260,  262,  262,  262,  262,  262,  263,  263,
			  263,  263,  263,  265,  265,  265,  265,  257,  264,  264,
			  264,  264,  264,  266,  266,  266,  266,  266,  267,  267,
			  267,  267,  267,  268,  268,  268,  268,  268,  270,  270,
			  270,  270,  270,  271,    0,  271,    0,  265,  271,  271,
			  271,  271,  271,  272,  272,  272,  272,  272,  273,  273,
			  273,  273,  273,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,  271,  275,  275,
			  275,  275,  275,  275,  275,  275,  275,  275,  275,  275,
			  275,  275,  275,  275,  275,  275,  275,  275,  275,  275,
			  275,  275,  275,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  277,    0,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,    0,  277,  277,  277,  277,  277,
			  277,  277,  277,  278,    0,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,

			  278,  278,  278,  278,  278,  278,  278,  278,  279,  279,
			    0,  279,    0,  279,  279,  279,    0,  279,  279,  279,
			  279,  279,  279,  280,  280,    0,  280,  280,  280,  280,
			    0,    0,    0,  280,  280,  280,    0,  280,  280,  280,
			  280,  280,  280,  281,  281,  281,  281,  281,  281,  281,
			  281,  281,  281,  281,  281,  281,  281,  281,  281,  281,
			  281,  281,  281,  281,  281,  281,  282,    0,  282,  282,
			  282,  282,  282,  282,  282,  282,  282,  282,  282,  282,
			  282,  282,    0,  282,  282,  282,  282,  282,  282,  282,
			  282,  283,  283,  283,  283,  283,  283,  283,  283,  283,

			  283,  283,  283,  283,  283,  283,  283,  283,  283,  283,
			  283,  283,  283,  283,    0,  283,  284,  284,  284,  284,
			  284,  284,  284,  284,  284,  284,  284,  284,  284,  284,
			  284,  284,  284,  284,  284,  284,  284,  284,  284,  285,
			    0,  285,  285,  285,  285,  285,  285,  285,  285,  285,
			  285,  285,  285,  285,  285,  285,  285,  285,  285,  285,
			  285,  285,  285,  285,  286,  286,  286,  286,  286,  286,
			  286,  286,  286,  286,  286,  286,  286,  286,  286,  286,
			  286,  286,  286,  286,  286,  286,  286,  286,  286,  287,
			    0,    0,  287,  287,    0,  287,  287,  287,  287,  287,

			    0,  287,  287,  287,  287,  287,  287,  288,  288,    0,
			  288,  288,  288,  288,  288,    0,    0,  288,  288,  288,
			    0,  288,  288,  288,  288,  288,  288,  289,  289,    0,
			  289,  289,  289,  289,  289,  289,  289,  289,    0,    0,
			  289,  289,  289,    0,  289,  289,  289,  289,  289,  289,
			  290,  290,  290,  290,  290,  290,  290,  290,  290,  290,
			  290,  290,  290,  290,  290,  290,  290,  290,  290,  290,
			  290,  290,  290,  290,  290,  291,  291,  291,  291,  291,
			  291,  291,  291,  291,  291,  291,  291,  291,  291,  291,
			  291,  291,  291,  291,  291,  291,  291,  291,  291,  291,

			  292,  292,  292,  292,  292,  292,  292,  292,  292,  292,
			  292,  292,  292,  292,  292,  292,  292,  292,  292,  292,
			  292,  292,  292,  292,  292,  274,  274,  274,  274,  274,
			  274,  274,  274,  274,  274,  274,  274,  274,  274,  274,
			  274,  274,  274,  274,  274,  274,  274,  274,  274,  274,
			  274,  274,  274,  274,  274,  274,  274,  274,  274,  274,
			  274,  274,  274,  274,  274,  274,  274,  274,  274,  274,
			  274,  274,  274,  274,  274,  274,  274,  274,  274,  274,
			  274,  274,  274,  274,  274,  274,  274,  274,  274,  274,
			  274,  274,  274,  274,  274,  274,  274,  274,  274,  274,

			  274,  274,  274,  274,  274,  274, yy_Dummy>>,
			1, 806, 1000)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   78,   83,   13,   18,  731, 1725,   89,
			  725, 1725,  637, 1725,   74, 1725, 1725, 1725, 1725, 1725,
			  626,  624, 1725,   77,   84, 1725, 1725,  604, 1725,  602,
			  598,  593,   82,   63,   99,   85,   87,  128, 1725, 1725,
			  163,   58,  120,  196,   78,  124,    0, 1725,  583, 1725,
			 1725,  101,  161,  162,  165,  167,  170,  514,    0, 1725,
			  173,  582,  575, 1725,  568,    0,  246,  538,  524,  251,
			  258,  278,  285, 1725, 1725, 1725,  512,    0,  222,  224,
			  325,  267,  291,  122,  474,  394,  453,    0,   81,  306,
			   79,  274,  155,  297,  218,  282,   86,  264,    0,  488,

			 1725, 1725, 1725,  305,  314,  470,  473,  476,  409, 1725,
			    0, 1725, 1725,  470,  357,  469,  384,  382,  363,  209,
			 1725,  467,  509,  339,  347,  472,  327,  501,  528,  259,
			  514,  540,  550,  580,  513,  549,  330,  301,  645,  290,
			  313, 1725,  482,  591,  252,  537,  520,  560,  440,  578,
			  532,  695,  549,  721,  724,  726,  729,  732,  735, 1725,
			 1725,  726, 1725, 1725, 1725, 1725,  616,  738,  745,  311,
			  559,  713,  794,  772,  759,  753,  764,  804,  309,  551,
			  308,  863, 1725, 1725,  943,  698,  787,  780,  782,  562,
			  781,    0,  193,  839, 1007,  302, 1014,  815,  237, 1006,

			 1030, 1035, 1040,  236,  206,  161,  117,  101,    0,  325,
			 1003, 1030,    0,  429, 1060, 1085,  814, 1725, 1043, 1725,
			 1725, 1725, 1725, 1725,  694, 1021,  122, 1093, 1098, 1062,
			  793, 1054,  234, 1107, 1120,  106,    0,  518, 1119, 1124,
			 1129, 1134, 1725,   71, 1139, 1150,  152, 1155, 1160, 1165,
			 1175, 1173, 1024, 1725, 1181, 1186, 1191, 1201, 1199, 1207,
			 1212, 1725, 1216, 1221, 1231, 1231, 1236, 1241, 1246, 1725,
			 1251, 1261, 1266, 1271, 1725, 1307, 1332, 1357, 1382, 1399,
			 1419, 1442, 1465, 1490, 1515, 1538, 1563, 1583, 1603, 1626,
			 1649, 1674, 1699, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  274,    1,  275,  275,  276,  276,  274,  274,  274,
			  274,  274,  277,  274,  278,  274,  274,  274,  274,  274,
			  274,  274,  274,  274,  274,  274,  274,  274,  274,  274,
			  274,  279,  279,  279,  279,  279,  279,  280,  274,  274,
			  274,   40,   40,   40,   40,   40,  281,  274,  282,  274,
			  274,  274,  282,  282,  282,  282,  282,  283,  284,  274,
			  274,  274,  277,  274,  285,  285,  285,  286,  274,  274,
			  274,  274,  274,  274,  274,  274,  279,  287,  279,  279,
			  279,  279,  279,  279,  288,  274,   40,  289,   40,   40,
			   86,   40,   86,   40,   86,   40,   86,   40,  281,  282,

			  274,  274,  274,  282,  282,  282,  282,  282,  283,  274,
			  284,  274,  274,  274,  274,  274,  274,  274,  274,  274,
			  274,  274,  274,  274,  274,  274,  287,  279,  279,  279,
			  279,  279,  279,  279,  279,  279,  274,  290,  274,   85,
			  290,  274,  274,   86,   86,   40,   86,   40,   86,   40,
			   86,   40,  282,  282,  282,  282,  282,  282,  282,  274,
			  274,  274,  274,  274,  274,  274,  274,  274,  274,  287,
			  279,  279,   80,  172,  172,  274,  279,  279,  279,  279,
			  279,  274,  274,  274,  274,   86,   40,   86,   40,   86,
			   40,   86,   40,  274,  274,  274,  274,  274,  279,  279,

			  274,  133,  133,  279,  291,  181,  292,  184,   86,   40,
			   86,   40,   86,   40,  274,  274,  274,  274,  279,  274,
			  274,  274,  274,  274,   86,   40,  274,  274,  274,  279,
			   86,   40,  274,  274,  274,  279,   86,   40,  274,  274,
			  274,  274,  274,  274,  274,  274,  274,  274,  274,  274,
			  274,  274,  274,  274,  274,  274,  274,  274,  274,  274,
			  274,  274,  274,  274,  274,  274,  274,  274,  274,  274,
			  274,  274,  274,  274,    0,  274,  274,  274,  274,  274,
			  274,  274,  274,  274,  274,  274,  274,  274,  274,  274,
			  274,  274,  274, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    2,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    4,    5,    6,    1,    7,    1,    1,    8,
			    9,   10,   11,   12,   13,   14,   15,   16,   17,   17,
			   18,   19,   20,   20,   20,   21,   21,   21,   22,   23,
			   24,   25,   26,   27,    1,   28,   29,   29,   30,   31,
			   32,   29,   33,   34,   29,   29,   35,   36,   37,   29,
			   38,   39,   40,   41,   42,   43,   29,   44,   29,   45,
			   46,   47,   48,   49,   50,   51,    1,   52,   53,   54,

			   55,   56,   57,   53,   58,   59,   53,   53,   60,   61,
			   62,   53,   53,   63,   64,   65,   66,   67,   53,   68,
			   53,   69,   53,   70,   71,   72,    1,    1,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   74,   74,   74,   74,   74,   74,
			   74,   74,   74,   74,   74,   74,   74,   74,   74,   74,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,    1,    1,   76,   76,   76,   76,   76,   76,

			   76,   76,   76,   76,   76,   76,   76,   76,   76,   76,
			   76,   76,   76,   76,   76,   76,   76,   76,   76,   76,
			   76,   76,   76,   76,   77,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   79,   80,   80,   80,   80,   80,   80,   80,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_meta_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    2,    3,    1,    3,    1,    1,    4,
			    5,    1,    1,    6,    7,    8,    1,    9,    9,    9,
			    9,   10,   11,    1,   12,    1,   13,    1,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,   14,   15,    9,   16,    1,   17,    1,
			    3,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,   18,   19,   20,   21,   22,   23,
			   24,    3,   25,    1,    1,    1,    1,    1,    1,    1,
			    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,   78,   76,    1,
			    2,   14,   60,   17,   76,   15,   16,    7,    6,   12,
			    5,   10,    8,   55,   55,   13,   11,   26,   23,   27,
			   19,   49,   49,   49,   48,   49,   49,   21,   22,    9,
			   51,   51,   51,   51,   51,   51,   52,   20,   64,   65,
			   66,   67,   64,   64,   64,   64,   64,   77,   53,   54,
			    1,    2,   60,   59,   74,   74,   74,    3,   28,    0,
			   55,    0,   55,   25,   24,   18,   49,    0,   49,   49,
			   49,   47,   49,   49,    0,    0,   51,   34,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   52,   64,

			   66,   62,   61,   63,   64,   64,   64,   64,    0,   54,
			   53,   74,   68,   74,   74,   74,   74,   74,   74,    4,
			   29,   57,   55,    0,    0,   56,    0,   49,   49,   48,
			   48,   48,   48,   49,   49,   49,    0,    0,    0,    0,
			    0,   37,   39,   39,   51,   51,   51,   51,   51,   51,
			   51,   51,   64,   64,   64,   64,   64,   64,   64,   72,
			   75,   75,   73,   69,   70,   71,    0,   55,    0,   50,
			   49,   49,   49,   49,   49,    0,   47,   47,   47,   49,
			   30,    0,   38,   37,    0,   51,   51,   51,   51,   51,
			   51,   30,   30,    0,   58,    0,   55,   44,   31,   49,

			    0,   49,   49,   33,    0,    0,    0,    0,   31,   31,
			   51,   51,   33,   33,    0,    0,    0,   44,   49,   47,
			   36,   35,   36,   35,   51,   51,   46,    0,    0,   49,
			   51,   51,    0,    0,   43,   32,   32,   32,    0,    0,
			    0,    0,   43,   45,    0,   43,    0,    0,    0,    0,
			   42,    0,    0,   42,    0,    0,    0,   41,    0,    0,
			    0,   41,    0,    0,    0,   40,    0,    0,    0,   40,
			    0,   40,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 1725
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 274
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 275
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

	yyNb_rules: INTEGER is 77
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 78
			-- End of buffer rule code

	yyLine_used: BOOLEAN is false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN is true
			-- Is `position' used?

	INITIAL: INTEGER is 0
	IN_STR: INTEGER is 1
	IN_CADL_BLOCK: INTEGER is 2
			-- Start condition codes

feature -- User-defined features



feature {NONE} -- Local variables

	i_, nb_: INTEGER
	char_: CHARACTER
	str_: STRING
	code_: INTEGER

	cadl_depth: INTEGER

	in_interval: BOOLEAN

	start_block_received: BOOLEAN

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

feature {NONE} -- Constants

	Init_buffer_size: INTEGER is 256
				-- Initial size for `in_buffer'

invariant

	in_buffer_not_void: in_buffer /= Void

end
