note
	component:   "openEHR Archetype Project"
	description: "Scanner for dADL syntax items"
	keywords:    "ADL, dADL"
	
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
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

create
	make

feature -- Status report

	valid_start_condition (sc: INTEGER): BOOLEAN
			-- Is `sc' a valid start condition?
		do
			Result := (INITIAL <= sc and sc <= IN_CADL_BLOCK)
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
if yy_act <= 39 then
if yy_act <= 20 then
if yy_act <= 10 then
if yy_act <= 5 then
if yy_act <= 3 then
if yy_act <= 2 then
if yy_act = 1 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 63 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 63")
end
-- Ignore separators
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 64 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 64")
end
in_lineno := in_lineno + text_count
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 69 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 69")
end
-- Ignore comments
end
else
if yy_act = 4 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 70 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 70")
end
in_lineno := in_lineno + 1
else
	yy_position := yy_position + 1
--|#line 74 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 74")
end
last_token := Minus_code
end
end
else
if yy_act <= 8 then
if yy_act <= 7 then
if yy_act = 6 then
	yy_position := yy_position + 1
--|#line 75 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 75")
end
last_token := Plus_code
else
	yy_position := yy_position + 1
--|#line 76 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 76")
end
last_token := Star_code
end
else
	yy_position := yy_position + 1
--|#line 77 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 77")
end
last_token := Slash_code
end
else
if yy_act = 9 then
	yy_position := yy_position + 1
--|#line 78 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 78")
end
last_token := Caret_code
else
	yy_position := yy_position + 1
--|#line 79 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 79")
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
--|#line 80 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 80")
end
last_token := Semicolon_code
else
	yy_position := yy_position + 1
--|#line 81 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 81")
end
last_token := Comma_code
end
else
	yy_position := yy_position + 1
--|#line 82 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 82")
end
last_token := Colon_code
end
else
if yy_act = 14 then
	yy_position := yy_position + 1
--|#line 83 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 83")
end
last_token := Exclamation_code
else
	yy_position := yy_position + 1
--|#line 84 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 84")
end
last_token := Left_parenthesis_code
end
end
else
if yy_act <= 18 then
if yy_act <= 17 then
if yy_act = 16 then
	yy_position := yy_position + 1
--|#line 85 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 85")
end
last_token := Right_parenthesis_code
else
	yy_position := yy_position + 1
--|#line 86 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 86")
end
last_token := Dollar_code
end
else
	yy_position := yy_position + 2
--|#line 87 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 87")
end
last_token := SYM_DT_UNKNOWN
end
else
if yy_act = 19 then
	yy_position := yy_position + 1
--|#line 88 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 88")
end
last_token := Question_mark_code
else
	yy_position := yy_position + 1
--|#line 90 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 90")
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
--|#line 100 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 100")
end
last_token := Left_bracket_code
else
	yy_position := yy_position + 1
--|#line 101 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 101")
end
last_token := Right_bracket_code
end
else
	yy_position := yy_position + 1
--|#line 103 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 103")
end
last_token := SYM_EQ
end
else
if yy_act = 24 then
	yy_position := yy_position + 2
--|#line 105 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 105")
end
last_token := SYM_GE
else
	yy_position := yy_position + 2
--|#line 106 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 106")
end
last_token := SYM_LE
end
end
else
if yy_act <= 28 then
if yy_act <= 27 then
if yy_act = 26 then
	yy_position := yy_position + 1
--|#line 108 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 108")
end

			if in_interval then
				last_token := SYM_LT
				start_block_received := False
			else
				last_token := SYM_START_DBLOCK
				start_block_received := True
				block_depth := block_depth + 1
			end
		
else
	yy_position := yy_position + 1
--|#line 119 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 119")
end

			if in_interval then
				last_token := SYM_GT
			else
				last_token := SYM_END_DBLOCK
				block_depth := block_depth - 1
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
				if block_depth = 1 then
					in_buffer.append_string (text)
					set_start_condition (IN_CADL_BLOCK)
					cadl_depth := 1
				else
					last_token := ERR_CADL_MISPLACED
				end
			
end
else
if yy_act = 53 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 240 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 240")
end
		-- got an open brace
				in_buffer.append_string (text)
				cadl_depth := cadl_depth + 1
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 244 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 244")
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
--|#line 261 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 261")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 262 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 262")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
else
if yy_act = 57 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 269 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 269")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 270 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 270")
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
--|#line 277 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 277")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 282 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 282")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
end
else
	yy_position := yy_position + 2
--|#line 290 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 290")
end
in_buffer.append_character ('\')
end
else
if yy_act = 62 then
	yy_position := yy_position + 2
--|#line 292 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 292")
end
in_buffer.append_character ('"')
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 294 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 294")
end

				in_buffer.append_string (text)
	
end
end
else
if yy_act <= 66 then
if yy_act <= 65 then
if yy_act = 64 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 298 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 298")
end
in_buffer.append_string (text)
else
	yy_position := yy_position + 1
--|#line 300 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 300")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 305 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 305")
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
			
end
else
if yy_act = 67 then
	yy_position := yy_position + 1
--|#line 318 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 318")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
else
	yy_position := yy_position + 3
--|#line 328 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 328")
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
--|#line 330 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 330")
end
last_token := V_CHARACTER; last_character_value := '%N'
else
	yy_position := yy_position + 4
--|#line 331 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 331")
end
last_token := V_CHARACTER; last_character_value := '%R'
end
else
	yy_position := yy_position + 4
--|#line 332 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 332")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 72 then
	yy_position := yy_position + 4
--|#line 333 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 333")
end
last_token := V_CHARACTER; last_character_value := '%''
else
	yy_position := yy_position + 4
--|#line 334 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 334")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 75 then
if yy_act = 74 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 336 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 336")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 337 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 337")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 76 then
	yy_position := yy_position + 1
--|#line 341 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 341")
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

	yy_execute_eof_action (yy_sc: INTEGER)
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

	yy_nxt_template: SPECIAL [INTEGER]
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 1732)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
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
			    8,    8,   49,   65,   58,   50,   59,   49,   77,   58,
			   50,   59,   60,   69,   60,   70,   70,   70,   70,   70,

			   69,   79,   72,   72,   72,   72,   72,   77,  101,   71,
			   77,   78,   77,   89,  249,  145,   71,   80,   80,   80,
			   80,   80,   95,   66,   77,   89,   79,   51,   83,   82,
			  102,   77,   51,   89,   71,   78,  141,  235,   84,   84,
			  145,   71,   81,   84,   84,   89,   96,   60,  141,   60,
			   91,   77,   83,   82,  226,   77,   52,   53,   54,   55,
			   56,   52,   53,   54,   55,   56,  128,  147,  225,   81,
			  101,   77,  103,  101,   92,  101,   89,   89,  105,  101,
			   84,   86,   87,   87,   87,   87,   87,   88,   89,   89,
			  136,  128,  147,   87,   87,   87,   87,   87,   87,   87,

			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,  151,  120,  136,  120,   87,   89,   89,   90,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   90,   89,   89,   89,   93,  151,   97,  104,  104,
			  104,  106,  106,  106,  107,  107,  114,  108,  108,  108,
			   89,   89,   89,  224,  149,  115,  115,  115,  115,  115,
			   94,   98,   89,   89,   89,  122,  122,  122,  122,  122,
			  223,   69,   77,  123,  123,  123,  123,  123,  124,  149,
			  129,  101,  187,  125,  184,  125,  116,   71,  126,  126,
			  126,  126,  126,   69,   77,  123,  123,  123,  123,  123,

			  117,  135,  118,  101,  119,  129,  187,  147,  149,   71,
			   77,  183,   71,  134,  134,  134,  134,  134,   77,  143,
			   77,  144,  144,  144,  144,  144,  135,  189,  145,   89,
			   77,   89,  148,  150,   71,   80,   80,   80,   80,   80,
			  172,   89,   77,   89,  151,  191,  193,   89,  130,  104,
			  104,  104,  189,  146,  131,   89,  251,  251,   89,   89,
			   89,  217,  132,  133,   77,  172,  101,   89,  152,  191,
			   89,  193,   89,  130,  153,  154,  155,  156,  157,  131,
			  161,  162,  162,  162,  162,  162,  132,  133,  138,  138,
			  138,  138,  138,  138,  138,  138,  139,  139,  138,  138,

			  138,  139,  139,  138,  139,  139,  139,  139,  139,  140,
			  138,  138,  138,  138,  138,  139,  139,  139,  139,  139,
			  139,  139,  139,  139,  139,  139,  139,  139,  139,  139,
			  139,  139,  139,  139,  138,  138,  105,  138,  139,  139,
			  139,  139,  139,  139,  139,  139,  139,  139,  139,  139,
			  139,  139,  139,  139,  139,  139,  139,  138,  138,  138,
			  138,  138,  138,  138,  138,  138,  138,  138,  138,  277,
			  101,   77,  170,  101,  215,  186,  101,  183,  122,  122,
			  122,  122,  122,  169,  169,  169,  169,  126,  126,  126,
			  126,  126,  167,  126,  126,  126,  126,  126,  215,   87,

			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,  167,   69,   77,
			  168,  168,  168,  168,  168,  173,  173,  173,  173,  173,
			  183,   77,   77,  182,   71,  101,  171,  170,  104,  104,
			  104,  158,  158,  158,  159,  159,  159,  180,  211,   77,
			   81,  174,  174,  174,  174,  174,  181,   89,   77,   71,
			  171,  175,  175,  175,  175,  175,  233,  166,   77,   89,
			  165,  180,  101,  211,  164,  101,   81,  231,  231,  231,
			  231,  181,  191,  241,  241,  241,   81,  176,  101,  176,
			  233,  134,  134,  134,  134,  134,   89,  185,   77,  185,

			  185,  185,  185,  185,  107,  107,  192,  177,   89,  187,
			  178,  101,  213,  163,  143,  179,  143,  143,  143,  143,
			  143,  143,   89,  144,  144,  144,  144,  144,  189,  193,
			  101,  183,  177,  188,   89,  178,  227,  213,   77,  179,
			  104,  104,  104,  106,  106,  106,  160,  110,   89,  101,
			   89,  201,   89,  190,  194,  142,  108,  108,  108,  239,
			   89,  227,   89,  137,   89,  161,  162,  162,  162,  162,
			  162,  199,  199,  199,  199,  199,  201,   77,   77,  104,
			  104,  104,  195,  239,  195,  200,  121,  196,  196,  196,
			  196,  196,  173,  173,  173,  173,  173,  120,  104,  104,

			  104,  197,   69,  113,  198,  198,  198,  198,  198,   63,
			  200,   76,  174,  174,  174,  174,  174,   61,   71,  110,
			   76,  175,  175,  175,  175,  175,  202,  202,  202,  202,
			  202,  203,  203,  203,  203,  203,   76,   77,   77,   76,
			  131,  211,  213,   71,   76,  204,  204,  204,  204,  204,
			  233,  215,   77,  196,  196,  196,  196,  196,  205,   89,
			   89,  101,   89,   76,   89,  131,  212,  214,   77,   75,
			   74,   89,   89,   73,  234,  216,   89,  196,  196,  196,
			  196,  196,  205,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  207,  207,  206,  207,

			  207,  207,  207,  207,  206,  206,  206,  206,  206,  206,
			  207,  207,  207,  207,  207,  207,  207,  207,  207,  207,
			  207,  207,  207,  207,  207,  207,  207,  207,  207,  206,
			  206,   68,  206,  207,  207,  207,  207,  207,  207,  207,
			  207,  207,  207,  207,  207,  207,  207,  207,  207,  207,
			  207,  207,  206,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  209,  209,  208,
			  209,  209,  209,  209,  209,  208,  208,  208,  208,  208,
			  208,  209,  209,  209,  209,  209,  209,  209,  209,  209,

			  209,  209,  209,  209,  209,  209,  209,  209,  209,  209,
			  208,  208,  183,  208,  209,  209,  209,  209,  209,  209,
			  209,  209,  209,  209,  209,  209,  209,  209,  209,  209,
			  209,  209,  209,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  185,   77,  185,  185,  185,
			  185,  185,   69,   77,  198,  198,  198,  198,  198,   67,
			  218,   63,  218,  221,   61,  277,  277,  238,   71,   77,
			  219,  202,  202,  202,  202,  202,  277,  277,  277,  210,
			  203,  203,  203,  203,  203,  227,  277,  232,  221,  277,
			  277,  238,  277,   71,  220,  222,   76,  204,  204,  204, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  204,  204,  277,  277,  277,   89,  243,  244,  243,  244,
			  228,  232,  277,   76,  277,  277,   76,   89,  277,  222,
			  277,   76,  229,  229,  229,  229,  229,  230,  230,  230,
			  230,  230,  236,  236,  236,  236,  236,  277,   76,  239,
			  245,   76,  237,  237,  237,  237,  237,  277,   89,  242,
			  242,  242,  242,  242,  246,  246,  246,  246,  246,  277,
			   89,  277,  277,  240,  220,  220,  220,  220,  220,  247,
			  247,  247,  247,  247,  248,  248,  248,  248,  248,  250,
			  250,  250,  250,  250,  243,  277,  243,  277,  277,  248,
			  248,  248,  248,  248,  252,  252,  252,  252,  252,  253,

			  253,  253,  253,  253,  245,  245,  245,  245,  245,  254,
			  277,  254,  257,  257,  257,  257,  257,  277,  245,  255,
			  258,  258,  258,  258,  259,  259,  259,  259,  259,  260,
			  260,  260,  260,  260,  261,  261,  261,  261,  261,  262,
			  277,  262,  277,  256,  256,  256,  256,  256,  256,  263,
			  265,  265,  265,  265,  265,  266,  266,  266,  266,  267,
			  267,  267,  267,  267,  268,  268,  268,  268,  268,  270,
			  271,  270,  271,  264,  269,  269,  269,  269,  269,  264,
			  264,  264,  264,  264,  273,  273,  273,  273,  273,  274,
			  274,  274,  274,  274,  275,  275,  275,  275,  275,  270,

			  277,  270,  277,  272,  274,  274,  274,  274,  274,  276,
			  276,  276,  276,  276,  272,  272,  272,  272,  272,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  272,   48,   48,   48,   48,   48,   48,
			   48,   48,   48,   48,   48,   48,   48,   48,   48,   48,
			   48,   48,   48,   48,   48,   48,   48,   48,   48,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   62,  277,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,  277,   62,

			   62,   62,   62,   62,   62,   62,   62,   62,   62,   64,
			  277,   64,   64,   64,   64,   64,   64,   64,   64,   64,
			   64,   64,   64,   64,   64,   64,   64,   64,   64,   64,
			   64,   64,   64,   64,   76,   76,  277,   76,  277,   76,
			  277,   76,   76,   76,   76,   76,   76,   76,   76,   85,
			   85,  277,   85,   85,   85,   85,  277,  277,  277,   85,
			  277,   85,   85,   85,   85,   85,   85,   85,   85,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,  100,  277,  100,  100,  100,  100,  100,  100,

			  100,  100,  100,  100,  100,  100,  277,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  109,  109,  109,
			  109,  109,  109,  109,  109,  109,  109,  109,  109,  109,
			  109,  109,  109,  109,  109,  109,  109,  109,  109,  109,
			  277,  109,  111,  111,  111,  111,  111,  111,  111,  111,
			  111,  111,  111,  111,  111,  111,  111,  111,  111,  111,
			  111,  111,  111,  111,  111,  112,  277,  112,  112,  112,
			  112,  112,  112,  112,  112,  112,  112,  112,  112,  112,
			  112,  112,  112,  112,  112,  112,  112,  112,  112,  112,
			   67,   67,   67,   67,   67,   67,   67,   67,   67,   67,

			   67,   67,   67,   67,   67,   67,   67,   67,   67,   67,
			   67,   67,   67,   67,   67,  127,  277,  277,  127,  127,
			  277,  127,  127,  127,  277,  127,  127,  127,  127,  127,
			  127,  127,  127,   84,   84,  277,   84,   84,   84,   84,
			   84,  277,  277,   84,  277,   84,   84,   84,   84,   84,
			   84,   84,   84,  138,  138,  138,  138,  138,  138,  138,
			  138,  138,  138,  138,  138,  138,  138,  138,  138,  138,
			  138,  138,  138,  138,  138,  138,  138,  138,  186,  186,
			  277,  186,  186,  186,  186,  186,  186,  186,  186,  277,
			  277,  186,  277,  186,  186,  186,  186,  186,  186,  186,

			  186,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,    7,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,

			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277, yy_Dummy>>,
			1, 733, 1000)
		end

	yy_chk_template: SPECIAL [INTEGER]
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 1732)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
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
			    1,    1,    3,   14,    5,    3,    5,    4,   33,    6,
			    4,    6,    9,   23,    9,   23,   23,   23,   23,   23,

			   24,   33,   24,   24,   24,   24,   24,   32,   53,   23,
			   35,   32,   36,   41,  246,   91,   24,   34,   34,   34,
			   34,   34,   44,   14,   34,   41,   33,    3,   36,   35,
			   51,  238,    4,   44,   23,   32,   86,  229,   37,   37,
			   91,   24,   34,   37,   37,   44,   44,   60,   86,   60,
			   42,  130,   36,   35,  209,   78,    3,    3,    3,    3,
			    3,    4,    4,    4,    4,    4,   78,   93,  208,  130,
			   52,   83,   51,   54,   42,   55,   42,   89,   53,   56,
			   37,   37,   40,   40,   40,   40,   40,   40,   42,   89,
			   83,   78,   93,   40,   40,   40,   40,   40,   40,   40,

			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   97,  120,   83,  120,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   43,   97,   45,   52,   52,
			   52,   54,   54,   54,   55,   55,   66,   56,   56,   56,
			  194,   45,   43,  207,   95,   66,   66,   66,   66,   66,
			   43,   45,  194,   45,   43,   69,   69,   69,   69,   69,
			  206,   70,   79,   70,   70,   70,   70,   70,   70,   95,
			   79,  105,  145,   71,  140,   71,   66,   70,   71,   71,
			   71,   71,   71,   72,   82,   72,   72,   72,   72,   72,

			   66,   82,   66,  104,   66,   79,  145,   94,   96,   72,
			  205,  140,   70,   81,   81,   81,   81,   81,  200,   90,
			   81,   90,   90,   90,   90,   90,   82,  147,   92,   94,
			  129,   96,   94,   96,   72,   80,   80,   80,   80,   80,
			  129,   94,   80,   96,   98,  149,  151,   92,   80,  105,
			  105,  105,  147,   92,   80,   98,  249,  249,   90,   92,
			  212,  197,   80,   80,  181,  129,  154,   98,   98,  149,
			   90,  151,  212,   80,  104,  104,  104,  104,  104,   80,
			  115,  115,  115,  115,  115,  115,   80,   80,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,

			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,  154,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   87,
			  106,  179,  170,  107,  191,  142,  108,  139,  122,  122,
			  122,  122,  122,  124,  124,  124,  124,  125,  125,  125,
			  125,  125,  122,  126,  126,  126,  126,  126,  191,   87,

			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,  122,  123,  128,
			  123,  123,  123,  123,  123,  131,  131,  131,  131,  131,
			  138,  135,  131,  137,  123,  156,  128,  127,  106,  106,
			  106,  107,  107,  107,  108,  108,  108,  135,  187,  136,
			  131,  132,  132,  132,  132,  132,  136,  216,  132,  123,
			  128,  133,  133,  133,  133,  133,  227,  119,  133,  216,
			  118,  135,  153,  187,  117,  155,  132,  219,  219,  219,
			  219,  136,  150,  235,  235,  235,  133,  134,  157,  134,
			  227,  134,  134,  134,  134,  134,  150,  141,  134,  141,

			  141,  141,  141,  141,  156,  156,  150,  134,  150,  146,
			  134,  158,  189,  116,  143,  134,  143,  143,  143,  143,
			  143,  144,  146,  144,  144,  144,  144,  144,  148,  152,
			  159,  141,  134,  146,  146,  134,  213,  189,  172,  134,
			  153,  153,  153,  155,  155,  155,  114,  109,  148,  100,
			  240,  172,  152,  148,  152,   88,  157,  157,  157,  233,
			  148,  213,  240,   84,  152,  162,  162,  162,  162,  162,
			  162,  169,  169,  169,  169,  169,  172,   76,  171,  158,
			  158,  158,  167,  233,  167,  171,   68,  167,  167,  167,
			  167,  167,  173,  173,  173,  173,  173,   67,  159,  159,

			  159,  168,  168,   64,  168,  168,  168,  168,  168,   62,
			  171,  173,  174,  174,  174,  174,  174,   61,  168,   57,
			  173,  175,  175,  175,  175,  175,  176,  176,  176,  176,
			  176,  177,  177,  177,  177,  177,  173,  180,  177,  174,
			  175,  188,  190,  168,  173,  178,  178,  178,  178,  178,
			  228,  192,  178,  195,  195,  195,  195,  195,  180,  190,
			  192,   48,  228,  174,  188,  175,  188,  190,   31,   30,
			   29,  190,  192,   27,  228,  192,  188,  196,  196,  196,
			  196,  196,  180,  182,  182,  182,  182,  182,  182,  182,
			  182,  182,  182,  182,  182,  182,  182,  182,  182,  182,

			  182,  182,  182,  182,  182,  182,  182,  182,  182,  182,
			  182,  182,  182,  182,  182,  182,  182,  182,  182,  182,
			  182,  182,  182,  182,  182,  182,  182,  182,  182,  182,
			  182,   21,  182,  182,  182,  182,  182,  182,  182,  182,
			  182,  182,  182,  182,  182,  182,  182,  182,  182,  182,
			  182,  182,  182,  182,  182,  182,  182,  182,  182,  182,
			  182,  182,  182,  182,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,  184,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,  184,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,  184,  184,  184,  184,  184,  184,  184,

			  184,  184,  184,  184,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,  184,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,  184,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,  184,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,  184,  184,  185,  232,  185,  185,  185,
			  185,  185,  198,  201,  198,  198,  198,  198,  198,   20,
			  199,   12,  199,  201,   10,    7,    0,  232,  198,  221,
			  199,  202,  202,  202,  202,  202,    0,    0,    0,  185,
			  203,  203,  203,  203,  203,  214,    0,  221,  201,    0,
			    0,  232,    0,  198,  199,  202,  203,  204,  204,  204, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  204,  204,    0,    0,    0,  214,  237,  237,  237,  237,
			  214,  221,    0,  204,    0,    0,  204,  214,    0,  202,
			    0,  203,  217,  217,  217,  217,  217,  218,  218,  218,
			  218,  218,  230,  230,  230,  230,  230,    0,  204,  234,
			  237,  204,  231,  231,  231,  231,  231,    0,  234,  236,
			  236,  236,  236,  236,  241,  241,  241,  241,  241,    0,
			  234,    0,    0,  234,  242,  242,  242,  242,  242,  243,
			  243,  243,  243,  243,  244,  244,  244,  244,  244,  247,
			  247,  247,  247,  247,  248,    0,  248,    0,    0,  248,
			  248,  248,  248,  248,  250,  250,  250,  250,  250,  251,

			  251,  251,  251,  251,  252,  252,  252,  252,  252,  253,
			    0,  253,  254,  254,  254,  254,  254,    0,  248,  253,
			  255,  255,  255,  255,  257,  257,  257,  257,  257,  258,
			  258,  258,  258,  258,  259,  259,  259,  259,  259,  260,
			    0,  260,    0,  253,  261,  261,  261,  261,  261,  260,
			  262,  262,  262,  262,  262,  263,  263,  263,  263,  265,
			  265,  265,  265,  265,  266,  266,  266,  266,  266,  268,
			  268,  268,  268,  260,  267,  267,  267,  267,  267,  269,
			  269,  269,  269,  269,  270,  270,  270,  270,  270,  271,
			  271,  271,  271,  271,  273,  273,  273,  273,  273,  274,

			    0,  274,    0,  268,  274,  274,  274,  274,  274,  275,
			  275,  275,  275,  275,  276,  276,  276,  276,  276,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  274,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  279,
			  279,  279,  279,  279,  279,  279,  279,  279,  279,  279,
			  279,  279,  279,  279,  279,  279,  279,  279,  279,  279,
			  279,  279,  279,  279,  280,    0,  280,  280,  280,  280,
			  280,  280,  280,  280,  280,  280,  280,  280,    0,  280,

			  280,  280,  280,  280,  280,  280,  280,  280,  280,  281,
			    0,  281,  281,  281,  281,  281,  281,  281,  281,  281,
			  281,  281,  281,  281,  281,  281,  281,  281,  281,  281,
			  281,  281,  281,  281,  282,  282,    0,  282,    0,  282,
			    0,  282,  282,  282,  282,  282,  282,  282,  282,  283,
			  283,    0,  283,  283,  283,  283,    0,    0,    0,  283,
			    0,  283,  283,  283,  283,  283,  283,  283,  283,  284,
			  284,  284,  284,  284,  284,  284,  284,  284,  284,  284,
			  284,  284,  284,  284,  284,  284,  284,  284,  284,  284,
			  284,  284,  285,    0,  285,  285,  285,  285,  285,  285,

			  285,  285,  285,  285,  285,  285,    0,  285,  285,  285,
			  285,  285,  285,  285,  285,  285,  285,  286,  286,  286,
			  286,  286,  286,  286,  286,  286,  286,  286,  286,  286,
			  286,  286,  286,  286,  286,  286,  286,  286,  286,  286,
			    0,  286,  287,  287,  287,  287,  287,  287,  287,  287,
			  287,  287,  287,  287,  287,  287,  287,  287,  287,  287,
			  287,  287,  287,  287,  287,  288,    0,  288,  288,  288,
			  288,  288,  288,  288,  288,  288,  288,  288,  288,  288,
			  288,  288,  288,  288,  288,  288,  288,  288,  288,  288,
			  289,  289,  289,  289,  289,  289,  289,  289,  289,  289,

			  289,  289,  289,  289,  289,  289,  289,  289,  289,  289,
			  289,  289,  289,  289,  289,  290,    0,    0,  290,  290,
			    0,  290,  290,  290,    0,  290,  290,  290,  290,  290,
			  290,  290,  290,  291,  291,    0,  291,  291,  291,  291,
			  291,    0,    0,  291,    0,  291,  291,  291,  291,  291,
			  291,  291,  291,  292,  292,  292,  292,  292,  292,  292,
			  292,  292,  292,  292,  292,  292,  292,  292,  292,  292,
			  292,  292,  292,  292,  292,  292,  292,  292,  293,  293,
			    0,  293,  293,  293,  293,  293,  293,  293,  293,    0,
			    0,  293,    0,  293,  293,  293,  293,  293,  293,  293,

			  293,  294,  294,  294,  294,  294,  294,  294,  294,  294,
			  294,  294,  294,  294,  294,  294,  294,  294,  294,  294,
			  294,  294,  294,  294,  294,  294,  295,  295,  295,  295,
			  295,  295,  295,  295,  295,  295,  295,  295,  295,  295,
			  295,  295,  295,  295,  295,  295,  295,  295,  295,  295,
			  295,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,

			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277, yy_Dummy>>,
			1, 733, 1000)
		end

	yy_base_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   79,   84,   14,   19,  965, 1651,   90,
			  961, 1651,  955, 1651,   75, 1651, 1651, 1651, 1651, 1651,
			  945,  816, 1651,   78,   85, 1651, 1651,  748, 1651,  745,
			  742,  744,   83,   64,  100,   86,   88,  129, 1651, 1651,
			  165,   59,  122,  198,   79,  197,    0, 1651,  755, 1651,
			 1651,  124,  164,  102,  167,  169,  173,  647,    0, 1651,
			  145,  714,  703, 1651,  695,    0,  238,  694,  671,  248,
			  256,  271,  278, 1651, 1651, 1651,  653,    0,  131,  248,
			  318,  296,  270,  147,  641,  387,   82,  447,  639,  123,
			  304,   80,  293,  135,  275,  223,  277,  169,  301,    0,

			  643, 1651, 1651, 1651,  297,  275,  464,  467,  470,  575,
			 1651,    0, 1651, 1651,  638,  364,  605,  566,  562,  559,
			  211, 1651,  461,  503,  466,  470,  476,  511,  495,  306,
			  127,  508,  534,  544,  574,  507,  525,  511,  481,  428,
			  262,  582,  459,  599,  606,  241,  568,  293,  594,  305,
			  542,  315,  598,  566,  360,  569,  529,  582,  605,  624,
			 1651, 1651,  649, 1651, 1651, 1651, 1651,  670,  687,  654,
			  446,  654,  614,  675,  695,  704,  709,  714,  728,  447,
			  713,  340,  782, 1651,  863,  930,    0,  517,  710,  575,
			  705,  429,  706,    0,  196,  736,  760,  344,  937,  948,

			  294,  929,  954,  963,  980,  286,  221,  204,  119,  105,
			 1651,    0,  306,  602,  951,    0,  503, 1005, 1010,  560,
			 1651,  945, 1651, 1651, 1651, 1651, 1651,  524,  708,  123,
			 1015, 1025,  922,  614,  994,  566, 1032,  994,  107,    0,
			  596, 1037, 1047, 1052, 1057, 1651,   72, 1062, 1072,  339,
			 1077, 1082, 1087, 1097, 1095, 1103, 1651, 1107, 1112, 1117,
			 1127, 1127, 1133, 1138, 1651, 1142, 1147, 1157, 1157, 1162,
			 1167, 1172, 1651, 1177, 1187, 1192, 1197, 1651, 1233, 1258,
			 1283, 1308, 1325, 1345, 1368, 1391, 1416, 1441, 1464, 1489,
			 1509, 1529, 1552, 1577, 1600, 1625, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,  277,    1,  278,  278,  279,  279,  277,  277,  277,
			  277,  277,  280,  277,  281,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  282,  282,  282,  282,  282,  282,  283,  277,  277,
			  277,   40,   40,   40,   40,   40,  284,  277,  285,  277,
			  277,  277,  285,  285,  285,  285,  285,  286,  287,  277,
			  277,  277,  280,  277,  288,  288,  288,  289,  277,  277,
			  277,  277,  277,  277,  277,  277,  282,  290,  282,  282,
			  282,  282,  282,  282,  291,  277,   85,   40,  277,   40,
			   40,   87,   40,   87,   40,   87,   40,   87,   40,  284,

			  285,  277,  277,  277,  285,  285,  285,  285,  285,  286,
			  277,  287,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  290,  282,  282,
			  282,  282,  282,  282,  282,  282,  282,  277,  292,   85,
			  292,   85,  277,  277,   87,   87,   40,   87,   40,   87,
			   40,   87,   40,  285,  285,  285,  285,  285,  285,  285,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  290,  282,  282,   80,  173,  173,  277,  282,  282,  282,
			  282,  282,  277,  277,  277,   85,  293,   87,   40,   87,
			   40,   87,   40,   87,   40,  277,  277,  277,  277,  277,

			  282,  282,  277,  134,  134,  282,  294,  182,  295,  184,
			  277,   87,   40,   87,   40,   87,   40,  277,  277,  277,
			  277,  282,  277,  277,  277,  277,  277,   87,   40,  277,
			  277,  277,  282,   87,   40,  277,  277,  277,  282,   87,
			   40,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,    0,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER]
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
			   53,   69,   53,   70,   71,   72,   73,    1,   74,   74,
			   74,   74,   74,   74,   74,   74,   74,   74,   74,   74,
			   74,   74,   74,   74,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   76,   76,   76,   76,   76,   76,   76,   76,   76,   76,
			   76,   76,   76,   76,   76,   76,   76,   76,   76,   76,
			   76,   76,   76,   76,   76,   76,   76,   76,   76,   76,
			   76,   76,    1,    1,   77,   77,   77,   77,   77,   77,

			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   78,   79,   79,   79,   79,   79,
			   79,   79,   79,   79,   79,   79,   79,   79,   79,   79,
			   80,   81,   81,   81,   81,   81,   81,   81,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_meta_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    2,    3,    1,    3,    1,    1,    4,
			    5,    1,    1,    6,    7,    8,    1,    9,    9,    9,
			    9,   10,   11,    1,   12,    1,   13,    1,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,   14,    3,   15,    3,
			    3,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,   16,   17,   18,   19,   20,   21,   22,   23,
			   24,    3,   25,    3,    1,    1,    1,    1,    1,    1,
			    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
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
			   49,   47,   49,   49,    0,    0,    0,   51,    0,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   52,

			   64,   66,   62,   61,   63,   64,   64,   64,   64,    0,
			   54,   53,   74,   68,   74,   74,   74,   74,   74,   74,
			    4,   29,   57,   55,    0,    0,   56,    0,   49,   49,
			   48,   48,   48,   48,   49,   49,   49,    0,    0,    0,
			    0,    0,    0,   39,   39,   51,   51,   51,   51,   51,
			   51,   51,   51,   64,   64,   64,   64,   64,   64,   64,
			   72,   75,   75,   73,   69,   70,   71,    0,   55,    0,
			   50,   49,   49,   49,   49,   49,    0,   47,   47,   47,
			   49,   30,    0,   38,    0,    0,   34,   51,   51,   51,
			   51,   51,   51,   30,   30,    0,   58,    0,   55,   44,

			   31,   49,    0,   49,   49,   33,    0,    0,    0,    0,
			   37,   31,   31,   51,   51,   33,   33,    0,    0,    0,
			   44,   49,   47,   36,   35,   36,   35,   51,   51,   46,
			    0,    0,   49,   51,   51,    0,    0,   43,   32,   32,
			   32,    0,    0,    0,    0,   43,   45,    0,   43,    0,
			    0,    0,    0,   42,    0,    0,   42,    0,    0,    0,
			   41,    0,    0,    0,   41,    0,    0,    0,   40,    0,
			    0,    0,   40,    0,   40,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 1651
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 277
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 278
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

	yyNb_rules: INTEGER = 77
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 78
			-- End of buffer rule code

	yyLine_used: BOOLEAN = false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN = true
			-- Is `position' used?

	INITIAL: INTEGER = 0
	IN_STR: INTEGER = 1
	IN_CADL_BLOCK: INTEGER = 2
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

	block_depth: INTEGER

feature {NONE} -- Initialization

	make
			-- Create a new scanner.
		do
			make_compressed_scanner_skeleton
			create in_buffer.make (Init_buffer_size)
			in_lineno := 1
		end

feature -- Initialization

	reset
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

	Init_buffer_size: INTEGER = 256
				-- Initial size for `in_buffer'

invariant
	in_buffer_not_void: in_buffer /= Void

end
