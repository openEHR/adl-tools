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
if yy_act <= 41 then
if yy_act <= 21 then
if yy_act <= 11 then
if yy_act <= 6 then
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
if yy_act <= 5 then
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
else
	yy_position := yy_position + 1
--|#line 77 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 77")
end
last_token := Plus_code
end
end
else
if yy_act <= 9 then
if yy_act <= 8 then
if yy_act = 7 then
	yy_position := yy_position + 1
--|#line 78 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 78")
end
last_token := Star_code
else
	yy_position := yy_position + 1
--|#line 79 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 79")
end
last_token := Slash_code
end
else
	yy_position := yy_position + 1
--|#line 80 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 80")
end
last_token := Caret_code
end
else
if yy_act = 10 then
	yy_position := yy_position + 1
--|#line 81 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 81")
end
last_token := Dot_code
else
	yy_position := yy_position + 1
--|#line 82 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 82")
end
last_token := Semicolon_code
end
end
end
else
if yy_act <= 16 then
if yy_act <= 14 then
if yy_act <= 13 then
if yy_act = 12 then
	yy_position := yy_position + 1
--|#line 83 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 83")
end
last_token := Comma_code
else
	yy_position := yy_position + 1
--|#line 84 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 84")
end
last_token := Colon_code
end
else
	yy_position := yy_position + 1
--|#line 85 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 85")
end
last_token := Exclamation_code
end
else
if yy_act = 15 then
	yy_position := yy_position + 1
--|#line 86 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 86")
end
last_token := Left_parenthesis_code
else
	yy_position := yy_position + 1
--|#line 87 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 87")
end
last_token := Right_parenthesis_code
end
end
else
if yy_act <= 19 then
if yy_act <= 18 then
if yy_act = 17 then
	yy_position := yy_position + 1
--|#line 88 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 88")
end
last_token := Dollar_code
else
	yy_position := yy_position + 2
--|#line 89 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 89")
end
last_token := SYM_DT_UNKNOWN
end
else
	yy_position := yy_position + 1
--|#line 90 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 90")
end
last_token := Question_mark_code
end
else
if yy_act = 20 then
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
		
else
	yy_position := yy_position + 1
--|#line 102 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 102")
end
last_token := Left_bracket_code
end
end
end
end
else
if yy_act <= 31 then
if yy_act <= 26 then
if yy_act <= 24 then
if yy_act <= 23 then
if yy_act = 22 then
	yy_position := yy_position + 1
--|#line 103 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 103")
end
last_token := Right_bracket_code
else
	yy_position := yy_position + 1
--|#line 105 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 105")
end
last_token := SYM_EQ
end
else
	yy_position := yy_position + 2
--|#line 107 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 107")
end
last_token := SYM_GE
end
else
if yy_act = 25 then
	yy_position := yy_position + 2
--|#line 108 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 108")
end
last_token := SYM_LE
else
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
		
end
end
else
if yy_act <= 29 then
if yy_act <= 28 then
if yy_act = 27 then
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
		
else
	yy_position := yy_position + 2
--|#line 128 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 128")
end
last_token := SYM_ELLIPSIS
end
else
	yy_position := yy_position + 3
--|#line 129 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 129")
end
last_token := SYM_LIST_CONTINUE
end
else
if yy_act = 30 then
	yy_position := yy_position + 4
--|#line 133 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 133")
end
last_token := SYM_TRUE
else
	yy_position := yy_position + 5
--|#line 135 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 135")
end
last_token := SYM_FALSE
end
end
end
else
if yy_act <= 36 then
if yy_act <= 34 then
if yy_act <= 33 then
if yy_act = 32 then
	yy_position := yy_position + 8
--|#line 137 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 137")
end
last_token := SYM_INFINITY
else
	yy_position := yy_position + 5
--|#line 140 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 140")
end
last_token := SYM_QUERY_FUNC
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 143 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 143")
end

	last_token := V_URI
	last_string_value := text

end
else
if yy_act = 35 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 149 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 149")
end

					last_token := V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 154 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 154")
end

					last_token := ERR_V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
end
else
if yy_act <= 39 then
if yy_act <= 38 then
if yy_act = 37 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 159 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 159")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 165 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 165")
end

					last_token := V_LOCAL_CODE
					last_string_value := text
			
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 172 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 172")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
if yy_act = 40 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 173 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 173")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 174 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 174")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
end
end
end
end
else
if yy_act <= 62 then
if yy_act <= 52 then
if yy_act <= 47 then
if yy_act <= 44 then
if yy_act <= 43 then
if yy_act = 42 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 181 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 181")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 182 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 182")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
else
	yy_position := yy_position + 10
--|#line 189 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 189")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
else
if yy_act <= 46 then
if yy_act = 45 then
	yy_position := yy_position + 7
--|#line 190 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 190")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 200 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 200")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 201 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 201")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
end
else
if yy_act <= 50 then
if yy_act <= 49 then
if yy_act = 48 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 207 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 207")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 212 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 212")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 219 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 219")
end
				-- beginning of CADL block
				in_buffer.append_string (text)
				set_start_condition (IN_CADL_BLOCK)
				cadl_depth := 1
			
end
else
if yy_act = 51 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 226 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 226")
end
		-- got an open brace
				in_buffer.append_string (text)
				cadl_depth := cadl_depth + 1
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 230 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 230")
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
end
else
if yy_act <= 57 then
if yy_act <= 55 then
if yy_act <= 54 then
if yy_act = 53 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 247 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 247")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 248 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 248")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 255 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 255")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
else
if yy_act = 56 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 256 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 256")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 263 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 263")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
end
end
else
if yy_act <= 60 then
if yy_act <= 59 then
if yy_act = 58 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 268 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 268")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
else
	yy_position := yy_position + 2
--|#line 276 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 276")
end
in_buffer.append_character ('\')
end
else
	yy_position := yy_position + 2
--|#line 278 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 278")
end
in_buffer.append_character ('"')
end
else
if yy_act = 61 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 280 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 280")
end

				in_buffer.append_string (text)
	
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 284 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 284")
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
	
end
end
end
end
else
if yy_act <= 72 then
if yy_act <= 67 then
if yy_act <= 65 then
if yy_act <= 64 then
if yy_act = 63 then
	yy_position := yy_position + 8
--|#line 299 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 299")
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
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 314 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 314")
end
in_buffer.append_string (text)
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 316 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 316")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
else
if yy_act = 66 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 321 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 321")
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
	yy_position := yy_position + 1
--|#line 332 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 332")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
end
else
if yy_act <= 70 then
if yy_act <= 69 then
if yy_act = 68 then
	yy_position := yy_position + 3
--|#line 342 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 342")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
	yy_position := yy_position + 4
--|#line 343 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 343")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
else
	yy_position := yy_position + 4
--|#line 344 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 344")
end
last_token := V_CHARACTER; last_character_value := '%R'
end
else
if yy_act = 71 then
	yy_position := yy_position + 4
--|#line 345 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 345")
end
last_token := V_CHARACTER; last_character_value := '%T'
else
	yy_position := yy_position + 4
--|#line 346 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 346")
end
last_token := V_CHARACTER; last_character_value := '%F'
end
end
end
else
if yy_act <= 77 then
if yy_act <= 75 then
if yy_act <= 74 then
if yy_act = 73 then
	yy_position := yy_position + 4
--|#line 347 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 347")
end
last_token := V_CHARACTER; last_character_value := '%''
else
	yy_position := yy_position + 4
--|#line 348 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 348")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
else
	yy_position := yy_position + 4
--|#line 349 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 349")
end
last_token := V_CHARACTER; last_character_value := '"'
end
else
if yy_act = 76 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 350 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 350")
end

						code_ := text_substring (4, text_count - 1).to_integer
						last_token := V_CHARACTER
						last_character_value := code_.to_character
				
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 355 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 355")
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
end
else
if yy_act <= 80 then
if yy_act <= 79 then
if yy_act = 78 then
	yy_position := yy_position + 10
--|#line 365 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 365")
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
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 376 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 376")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 377 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 377")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 81 then
	yy_position := yy_position + 1
--|#line 381 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 381")
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
		once
			Result := yy_fixed_array (<<
			    0,    8,    9,   10,    9,   11,   12,    8,   13,    8,
			   14,   15,   16,   17,   18,   19,   20,   21,   22,   23,
			   23,   24,   24,   24,   25,   26,   27,   28,   29,   30,
			   31,   31,   31,   31,   32,   31,   31,   33,   31,   31,
			   31,   34,   35,   31,   31,   36,   31,   31,   31,   31,
			   37,    8,   38,   39,    8,   40,   41,   41,   41,   41,
			   42,   41,   41,   43,   41,   41,   41,   44,   41,   41,
			   45,   41,   41,   41,   41,   46,   47,    8,    8,    8,
			    8,    8,    8,    8,    8,    8,    8,   49,  261,   59,
			   50,   60,   49,   51,   59,   50,   60,   61,   51,   61,

			   66,   67,   71,   79,   72,   72,   72,   72,   72,   71,
			   80,   74,   74,   74,   74,   74,   83,   89,   73,   81,
			   81,   81,   81,   81,   84,   73,   93,  102,   79,  102,
			   89,  101,   97,   85,   85,   52,   80,   95,   85,   85,
			   52,   83,   68,   89,   73,   82,   89,  257,   89,   84,
			  250,   73,   94,   61,  101,   61,   89,   98,  134,   89,
			  135,   89,   96,  101,  105,  101,   53,   54,   55,   56,
			   57,   53,   54,   55,   56,   57,   85,   87,   87,   87,
			   87,   87,   88,  101,  134,  101,  135,  101,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,

			   87,   87,   87,   87,   87,   87,   87,   87,   91,  106,
			  263,  263,   87,   89,   89,   90,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,   89,   89,   90,   89,
			   89,   89,   89,   92,   89,   89,  107,  107,  107,  141,
			  108,  102,  127,  102,  127,  101,  142,   89,   89,  101,
			  103,  129,  129,  129,  129,  129,  109,  109,  109,  110,
			  110,  132,  108,  132,  251,  141,  133,  133,  133,  133,
			  133,  142,  244,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  140,  140,  140,  140,  140,  104,  104,

			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  111,  111,
			  111,  115,  115,  230,  115,  115,  115,  117,  115,  115,
			  116,  115,  115,  115,  115,  115,  115,  115,  115,  118,
			  118,  118,  118,  118,  115,  115,  115,  115,  115,  115,
			  118,  118,  118,  118,  118,  118,  118,  118,  118,  118,
			  118,  118,  118,  118,  118,  118,  118,  118,  118,  118,
			  115,  115,  115,  115,  118,  118,  118,  118,  118,  118,
			  118,  118,  118,  118,  118,  118,  118,  118,  118,  118,
			  118,  118,  118,  118,  118,  115,  115,  115,  115,  115,

			  115,  115,  115,  115,  115,  115,  115,  119,  252,  252,
			  252,  120,   71,  101,  130,  130,  130,  130,  130,  131,
			  121,  121,  121,  121,  121,   85,   85,  148,   73,  150,
			   71,  148,  130,  130,  130,  130,  130,  154,  143,  146,
			  154,  147,  147,  147,  147,  147,   73,  101,  225,  215,
			   89,   89,  122,  148,   73,  150,  152,  149,  150,  152,
			  101,  123,  154,   89,   89,  155,  144,  124,  101,  125,
			  101,  126,   73,   81,   81,   81,   81,   81,  101,   89,
			  156,   89,  152,   89,  151,  153,  136,  180,  180,  180,
			  180,  215,   89,  137,   89,  170,   89,  231,  181,  182,

			  204,  138,  139,  171,  172,  172,  172,  172,  172,  167,
			  189,  202,  136,  133,  133,  133,  133,  133,  190,  137,
			  107,  107,  107,  181,  193,  182,  138,  192,  139,  289,
			  133,  133,  133,  133,  133,  189,  158,  159,  160,  161,
			  162,  107,  107,  107,  190,   89,   89,  203,  203,  193,
			  191,  163,  163,  163,  224,  224,  195,   82,   89,   89,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			  100,  100,  195,  100,  100,  101,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  157,  157,

			  157,  157,  157,  100,  100,  100,  100,  100,  100,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  100,
			  101,  100,  100,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  129,  129,  129,  129,
			  129,   71,  177,  179,  179,  179,  179,  179,  235,  235,
			  178,  183,  183,  183,  183,  183,  197,   73,  184,  184,
			  184,  184,  184,  185,  185,  185,  185,  185,  140,  140,

			  140,  140,  140,  164,  164,  164,  178,   82,  176,  101,
			  175,  197,  199,   73,   82,  186,  174,  193,  187,   82,
			  195,  199,  146,  188,  146,  146,  146,  146,  146,  146,
			   89,  147,  147,  147,  147,  147,  197,  101,  199,  173,
			   89,  186,  194,   89,  187,   89,  196,  200,  188,  101,
			   89,  239,  101,   89,  169,  101,  168,  170,   89,  101,
			  210,  198,  240,   89,  101,  171,  172,  172,  172,  172,
			  172,  209,  209,  209,  209,  209,  239,  201,  201,  201,
			  201,  201,  107,  107,  107,  167,  210,  240,  201,  201,
			  201,  201,  201,  205,  211,  205,  214,  165,  206,  206,

			  206,  206,  206,  212,  212,  212,  212,  212,   89,  113,
			  109,  109,  109,  201,  201,  201,  201,  201,  201,  101,
			  211,   89,  214,  110,  110,  111,  111,  111,  107,  107,
			  107,  217,  107,  107,  107,  207,   71,  145,  208,  208,
			  208,  208,  208,  183,  183,  183,  183,  183,  238,  238,
			  238,  238,   73,  143,  219,  217,  136,  217,  221,  184,
			  184,  184,  184,  184,  185,  185,  185,  185,  185,  219,
			  128,  138,  136,  213,  213,  213,  213,  213,   73,   89,
			  219,  218,  136,  229,  221,  221,   89,  206,  206,  206,
			  206,  206,   89,   78,   89,  220,  138,  127,  136,   89,

			  206,  206,  206,  206,  206,  240,  116,   89,   64,  229,
			   71,  222,  208,  208,  208,  208,  208,   89,   62,   78,
			  223,  223,  223,  223,  223,  232,   73,  226,  247,  226,
			  241,  223,  223,  223,  223,  223,  113,  227,  212,  212,
			  212,  212,  212,  213,  213,  213,  213,  213,  101,  232,
			   77,  232,   73,   76,  247,   78,  223,  223,  223,  223,
			  223,  223,  228,  236,  236,  236,  236,  236,  188,   89,
			  237,  237,  237,  237,  237,  233,  245,  245,  245,  245,
			  245,   78,   89,  246,  246,  246,  246,  246,  248,   75,
			  248,  243,  243,  188,  234,  234,  234,  234,  234,   89,

			  253,  253,  253,  253,  253,  234,  234,  234,  234,  234,
			   89,  266,   89,  266,  248,   70,  249,  254,  255,  254,
			   69,  267,   64,   89,  258,  258,  258,  258,  258,   62,
			  234,  234,  234,  234,  234,  234,  242,  242,  242,  242,
			  242,  228,  228,  228,  228,  228,  268,  242,  242,  242,
			  242,  242,  256,  259,  259,  259,  259,  259,  260,  260,
			  260,  260,  260,  262,  262,  262,  262,  262,  270,  270,
			  270,  270,  242,  242,  242,  242,  242,  242,  254,  289,
			  254,  289,  289,  260,  260,  260,  260,  260,  264,  264,
			  264,  264,  264,  265,  265,  265,  265,  265,  256,  256,

			  256,  256,  256,  269,  269,  269,  269,  269,  271,  271,
			  271,  271,  271,  256,  272,  272,  272,  272,  272,  273,
			  273,  273,  273,  273,  274,  289,  274,  268,  268,  268,
			  268,  268,  289,  289,  275,  277,  277,  277,  277,  277,
			  278,  278,  278,  278,  279,  279,  279,  279,  279,  280,
			  280,  280,  280,  280,  281,  281,  281,  281,  281,  276,
			  282,  283,  282,  276,  276,  276,  276,  276,  285,  285,
			  285,  285,  285,  286,  286,  286,  286,  286,  287,  287,
			  287,  287,  287,  282,  289,  282,  289,  289,  286,  286,
			  286,  286,  286,  289,  289,  284,  288,  288,  288,  288,

			  288,  284,  284,  284,  284,  284,  289,  289,  289,  289,
			  289,  289,  289,  289,  289,  289,  289,  289,  284,   48,
			   48,   48,   48,   48,   48,   48,   48,   48,   48,   48,
			   48,   48,   48,   48,   48,   48,   48,   48,   48,   48,
			   48,   48,   48,   48,   48,   48,   48,   48,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   63,  289,   63,
			   63,   63,   63,   63,   63,   63,   63,   63,   63,   63,
			   63,   63,   63,   63,  289,   63,   63,   63,   63,   63,

			   63,   63,   63,   63,   63,   63,   65,  289,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   78,   78,  289,  289,   78,
			   78,   78,   78,   78,  289,  289,   78,   78,   78,   78,
			   78,   78,   78,   78,   86,   86,   86,   86,   86,   86,
			  289,  289,   86,   86,   86,   86,   86,  289,  289,   86,
			   86,   86,   86,   86,   86,   86,   86,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,

			   99,   99,   99,   99,  100,  289,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  289,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  112,  112,  112,  112,  112,  112,  112,
			  112,  112,  112,  112,  112,  112,  112,  112,  112,  112,
			  112,  112,  112,  112,  112,  112,  112,  112,  112,  112,
			  289,  112,  114,  114,  114,  114,  114,  114,  114,  114,
			  114,  114,  114,  114,  114,  114,  114,  114,  114,  114,
			  114,  114,  114,  114,  114,  114,  114,  114,  114,  115,
			  289,  115,  115,  115,  115,  115,  115,  115,  115,  115,

			  115,  115,  115,  115,  115,  115,  115,  115,  115,  115,
			  115,  115,  115,  115,  115,  115,  115,  115,   69,   69,
			   69,   69,   69,   69,   69,   69,   69,   69,   69,   69,
			   69,   69,   69,   69,   69,   69,   69,   69,   69,   69,
			   69,   69,   69,   69,   69,   69,   69,   85,   85,   85,
			   85,   85,   85,   85,  289,   85,   85,   85,   85,   85,
			  289,  289,   85,   85,   85,   85,   85,   85,   85,   85,
			  166,  166,  289,  166,  166,  166,  166,  166,  166,  289,
			  289,  166,  166,  166,  166,  166,  166,  166,  166,  216,
			  289,  289,  289,  216,  216,  216,  216,  289,  289,  216,

			  216,  216,  216,  216,  289,  289,  216,  216,  216,  216,
			  216,  216,  216,  216,  192,  192,  289,  289,  192,  192,
			  192,  192,  192,  192,  192,  192,  192,  192,  192,  192,
			  192,  289,  289,  192,  192,  192,  192,  192,  192,  192,
			  192,  215,  289,  289,  289,  215,  215,  215,  215,  289,
			  289,  215,  215,  215,  215,  215,  289,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,    7,  289,  289,  289,
			  289,  289,  289,  289,  289,  289,  289,  289,  289,  289,
			  289,  289,  289,  289,  289,  289,  289,  289,  289,  289,
			  289,  289,  289,  289,  289,  289,  289,  289,  289,  289,

			  289,  289,  289,  289,  289,  289,  289,  289,  289,  289,
			  289,  289,  289,  289,  289,  289,  289,  289,  289,  289,
			  289,  289,  289,  289,  289,  289,  289,  289,  289,  289,
			  289,  289,  289,  289,  289,  289,  289,  289,  289,  289,
			  289,  289,  289,  289,  289,  289,  289,  289,  289,  289,
			  289,  289,  289, yy_Dummy>>)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    3,  258,    5,
			    3,    5,    4,    3,    6,    4,    6,    9,    4,    9,

			   14,   14,   23,   32,   23,   23,   23,   23,   23,   24,
			   33,   24,   24,   24,   24,   24,   35,   41,   23,   34,
			   34,   34,   34,   34,   36,   24,   43,   49,   32,   49,
			   41,  242,   45,   37,   37,    3,   33,   44,   37,   37,
			    4,   35,   14,   43,   23,   34,   45,  251,   44,   36,
			  242,   24,   43,   61,  250,   61,   43,   45,   79,   45,
			   80,   44,   44,   53,   52,   54,    3,    3,    3,    3,
			    3,    4,    4,    4,    4,    4,   37,   40,   40,   40,
			   40,   40,   40,   55,   79,   56,   80,  159,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,

			   40,   40,   40,   40,   40,   40,   40,   40,   42,   52,
			  261,  261,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   42,   89,   42,   53,   53,   53,   83,
			   54,  102,  127,  102,  127,   57,   84,   89,   42,   51,
			   51,   71,   71,   71,   71,   71,   55,   55,   55,   56,
			   56,   73,  159,   73,  243,   83,   73,   73,   73,   73,
			   73,   84,  236,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   82,   82,   82,   82,   82,   51,   51,

			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   57,   57,
			   57,   66,   66,  215,   66,   66,   66,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,   66,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,   66,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,   66,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,   66,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,   66,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,   66,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,   66,   66,   66,   66,

			   66,   66,   66,   66,   66,   66,   66,   68,  244,  244,
			  244,   68,   72,  103,   72,   72,   72,   72,   72,   72,
			   68,   68,   68,   68,   68,   86,   86,   91,   72,   93,
			   74,   92,   74,   74,   74,   74,   74,   97,   86,   90,
			   98,   90,   90,   90,   90,   90,   74,  108,  207,  216,
			   92,   98,   68,   91,   72,   93,   95,   92,   94,   96,
			  107,   68,   97,   92,   98,   98,   86,   68,  109,   68,
			  202,   68,   74,   81,   81,   81,   81,   81,  110,   90,
			  103,   94,   95,   96,   94,   96,   81,  131,  131,  131,
			  131,  191,   90,   81,   94,  121,   96,  216,  134,  135,

			  167,   81,   81,  121,  121,  121,  121,  121,  121,  166,
			  141,  157,   81,  132,  132,  132,  132,  132,  142,   81,
			  108,  108,  108,  134,  148,  135,   81,  145,   81,   87,
			  133,  133,  133,  133,  133,  141,  107,  107,  107,  107,
			  107,  109,  109,  109,  142,  200,  218,  304,  304,  148,
			  143,  110,  110,  110,  307,  307,  150,  136,  200,  218,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			  104,  104,  150,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,

			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  111,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  129,  129,  129,  129,
			  129,  130,  126,  130,  130,  130,  130,  130,  309,  309,
			  129,  137,  137,  137,  137,  137,  152,  130,  138,  138,
			  138,  138,  138,  139,  139,  139,  139,  139,  140,  140,

			  140,  140,  140,  111,  111,  111,  129,  137,  125,  158,
			  124,  152,  154,  130,  138,  140,  123,  149,  140,  139,
			  151,  155,  146,  140,  146,  146,  146,  146,  146,  147,
			  149,  147,  147,  147,  147,  147,  153,  160,  154,  122,
			  151,  140,  149,  149,  140,  155,  151,  155,  140,  161,
			  153,  229,  162,  151,  120,  163,  119,  172,  155,  164,
			  181,  153,  232,  153,  156,  172,  172,  172,  172,  172,
			  172,  180,  180,  180,  180,  180,  229,  156,  156,  156,
			  156,  156,  158,  158,  158,  118,  181,  232,  156,  156,
			  156,  156,  156,  178,  182,  178,  189,  117,  178,  178,

			  178,  178,  178,  186,  186,  186,  186,  186,  222,  112,
			  160,  160,  160,  156,  156,  156,  156,  156,  156,  100,
			  182,  222,  189,  161,  161,  162,  162,  162,  163,  163,
			  163,  193,  164,  164,  164,  179,  179,   88,  179,  179,
			  179,  179,  179,  183,  183,  183,  183,  183,  227,  227,
			  227,  227,  179,   85,  195,  194,  183,  193,  197,  184,
			  184,  184,  184,  184,  185,  185,  185,  185,  185,  196,
			   70,  183,  184,  187,  187,  187,  187,  187,  179,  194,
			  195,  194,  183,  211,  197,  198,  196,  205,  205,  205,
			  205,  205,  194,  185,  198,  196,  183,   69,  184,  196,

			  206,  206,  206,  206,  206,  233,   65,  198,   63,  211,
			  208,  198,  208,  208,  208,  208,  208,  233,   62,  185,
			  201,  201,  201,  201,  201,  219,  208,  209,  239,  209,
			  233,  201,  201,  201,  201,  201,   58,  209,  212,  212,
			  212,  212,  212,  213,  213,  213,  213,  213,   48,  220,
			   30,  219,  208,   29,  239,  212,  201,  201,  201,  201,
			  201,  201,  209,  225,  225,  225,  225,  225,  213,  220,
			  226,  226,  226,  226,  226,  220,  237,  237,  237,  237,
			  237,  212,  220,  238,  238,  238,  238,  238,  240,   27,
			  241,  310,  310,  213,  223,  223,  223,  223,  223,  241,

			  245,  245,  245,  245,  245,  223,  223,  223,  223,  223,
			  249,  265,  241,  265,  240,   21,  241,  246,  246,  246,
			   20,  265,   12,  249,  252,  252,  252,  252,  252,   10,
			  223,  223,  223,  223,  223,  223,  234,  234,  234,  234,
			  234,  253,  253,  253,  253,  253,  265,  234,  234,  234,
			  234,  234,  246,  254,  254,  254,  254,  254,  255,  255,
			  255,  255,  255,  259,  259,  259,  259,  259,  267,  267,
			  267,  267,  234,  234,  234,  234,  234,  234,  260,    7,
			  260,    0,    0,  260,  260,  260,  260,  260,  262,  262,
			  262,  262,  262,  263,  263,  263,  263,  263,  264,  264,

			  264,  264,  264,  266,  266,  266,  266,  266,  269,  269,
			  269,  269,  269,  260,  270,  270,  270,  270,  270,  271,
			  271,  271,  271,  271,  272,    0,  272,  273,  273,  273,
			  273,  273,    0,    0,  272,  274,  274,  274,  274,  274,
			  275,  275,  275,  275,  277,  277,  277,  277,  277,  278,
			  278,  278,  278,  278,  279,  279,  279,  279,  279,  272,
			  280,  280,  280,  281,  281,  281,  281,  281,  282,  282,
			  282,  282,  282,  283,  283,  283,  283,  283,  285,  285,
			  285,  285,  285,  286,    0,  286,    0,    0,  286,  286,
			  286,  286,  286,    0,    0,  280,  287,  287,  287,  287,

			  287,  288,  288,  288,  288,  288,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  286,  290,
			  290,  290,  290,  290,  290,  290,  290,  290,  290,  290,
			  290,  290,  290,  290,  290,  290,  290,  290,  290,  290,
			  290,  290,  290,  290,  290,  290,  290,  290,  291,  291,
			  291,  291,  291,  291,  291,  291,  291,  291,  291,  291,
			  291,  291,  291,  291,  291,  291,  291,  291,  291,  291,
			  291,  291,  291,  291,  291,  291,  291,  292,    0,  292,
			  292,  292,  292,  292,  292,  292,  292,  292,  292,  292,
			  292,  292,  292,  292,    0,  292,  292,  292,  292,  292,

			  292,  292,  292,  292,  292,  292,  293,    0,  293,  293,
			  293,  293,  293,  293,  293,  293,  293,  293,  293,  293,
			  293,  293,  293,  293,  293,  293,  293,  293,  293,  293,
			  293,  293,  293,  293,  293,  294,  294,    0,    0,  294,
			  294,  294,  294,  294,    0,    0,  294,  294,  294,  294,
			  294,  294,  294,  294,  295,  295,  295,  295,  295,  295,
			    0,    0,  295,  295,  295,  295,  295,    0,    0,  295,
			  295,  295,  295,  295,  295,  295,  295,  296,  296,  296,
			  296,  296,  296,  296,  296,  296,  296,  296,  296,  296,
			  296,  296,  296,  296,  296,  296,  296,  296,  296,  296,

			  296,  296,  296,  296,  297,    0,  297,  297,  297,  297,
			  297,  297,  297,  297,  297,  297,  297,  297,  297,  297,
			  297,    0,  297,  297,  297,  297,  297,  297,  297,  297,
			  297,  297,  297,  298,  298,  298,  298,  298,  298,  298,
			  298,  298,  298,  298,  298,  298,  298,  298,  298,  298,
			  298,  298,  298,  298,  298,  298,  298,  298,  298,  298,
			    0,  298,  299,  299,  299,  299,  299,  299,  299,  299,
			  299,  299,  299,  299,  299,  299,  299,  299,  299,  299,
			  299,  299,  299,  299,  299,  299,  299,  299,  299,  300,
			    0,  300,  300,  300,  300,  300,  300,  300,  300,  300,

			  300,  300,  300,  300,  300,  300,  300,  300,  300,  300,
			  300,  300,  300,  300,  300,  300,  300,  300,  301,  301,
			  301,  301,  301,  301,  301,  301,  301,  301,  301,  301,
			  301,  301,  301,  301,  301,  301,  301,  301,  301,  301,
			  301,  301,  301,  301,  301,  301,  301,  302,  302,  302,
			  302,  302,  302,  302,    0,  302,  302,  302,  302,  302,
			    0,    0,  302,  302,  302,  302,  302,  302,  302,  302,
			  303,  303,    0,  303,  303,  303,  303,  303,  303,    0,
			    0,  303,  303,  303,  303,  303,  303,  303,  303,  305,
			    0,    0,    0,  305,  305,  305,  305,    0,    0,  305,

			  305,  305,  305,  305,    0,    0,  305,  305,  305,  305,
			  305,  305,  305,  305,  306,  306,    0,    0,  306,  306,
			  306,  306,  306,  306,  306,  306,  306,  306,  306,  306,
			  306,    0,    0,  306,  306,  306,  306,  306,  306,  306,
			  306,  308,    0,    0,    0,  308,  308,  308,  308,    0,
			    0,  308,  308,  308,  308,  308,    0,  308,  308,  308,
			  308,  308,  308,  308,  308,  308,  289,  289,  289,  289,
			  289,  289,  289,  289,  289,  289,  289,  289,  289,  289,
			  289,  289,  289,  289,  289,  289,  289,  289,  289,  289,
			  289,  289,  289,  289,  289,  289,  289,  289,  289,  289,

			  289,  289,  289,  289,  289,  289,  289,  289,  289,  289,
			  289,  289,  289,  289,  289,  289,  289,  289,  289,  289,
			  289,  289,  289,  289,  289,  289,  289,  289,  289,  289,
			  289,  289,  289,  289,  289,  289,  289,  289,  289,  289,
			  289,  289,  289,  289,  289,  289,  289,  289,  289,  289,
			  289,  289,  289, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   84,   89,   14,   19, 1079, 1666,   95,
			 1026, 1666, 1016, 1666,   91, 1666, 1666, 1666, 1666, 1666,
			 1004,  998, 1666,   85,   92, 1666, 1666,  962, 1666,  926,
			  921,    0,   73,   70,  100,   70,   81,  122, 1666, 1666,
			  158,   60,  178,   86,   91,   89,    0, 1666,  942,  125,
			 1666,  243,  158,  157,  159,  177,  179,  239,  859,    0,
			 1666,  151,  915,  902, 1666,  896,  320,    0,  401,  894,
			  853,  232,  395,  247,  413, 1666, 1666, 1666,    0,  120,
			  126,  454,  274,  206,  200,  829,  414,  505,  819,  177,
			  422,  389,  393,  395,  424,  423,  426,  391,  394,    0,

			  813, 1666,  239,  407,  579, 1666, 1666,  454,  441,  462,
			  472,  624,  732, 1666,    0, 1666, 1666,  724,  760,  746,
			  744,  485,  729,  706,  700,  698,  662,  240, 1666,  647,
			  654,  468,  494,  511,  454,  462,  512,  662,  669,  674,
			  679,  467,  485,  526, 1666,  509,  705,  712,  480,  673,
			  519,  683,  643,  693,  679,  688,  758,  486,  703,  181,
			  731,  743,  746,  749,  753,    0,  484,  490, 1666, 1666,
			 1666, 1666,  747, 1666, 1666, 1666, 1666, 1666,  779,  819,
			  752,  727,  754,  824,  840,  845,  784,  854,    0,  748,
			    0,  487,    0,  798,  822,  814,  829,  810,  837,    0,

			  488,  901,  464,    0, 1666,  868,  881,  429,  893,  913,
			    0,  846,  919,  924,    0,  271,  445,    0,  489,  888,
			  912,    0,  751,  975,    0,  944,  951,  829, 1666,  706,
			 1666, 1666,  717,  860, 1017,    0,  256,  957,  964,  880,
			  940,  942,  125,  239,  389,  981, 1003,    0,    0,  953,
			  148,  137, 1005, 1022, 1034, 1039, 1666, 1666,   43, 1044,
			 1064,  191, 1069, 1074, 1079,  997, 1084, 1049, 1666, 1089,
			 1095, 1100, 1110, 1108, 1116, 1121, 1666, 1125, 1130, 1135,
			 1146, 1144, 1149, 1154, 1666, 1159, 1169, 1177, 1182, 1666,
			 1218, 1247, 1276, 1305, 1326, 1349, 1376, 1403, 1432, 1461,

			 1488, 1517, 1542, 1561,  538, 1586, 1613,  545, 1638,  669,
			  982, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  289,    1,  290,  290,  291,  291,  289,  289,  289,
			  289,  289,  292,  289,  293,  289,  289,  289,  289,  289,
			  289,  289,  289,  289,  289,  289,  289,  289,  289,  289,
			  289,  294,  294,  294,  294,  294,  294,  295,  289,  289,
			  289,   40,   40,   40,   40,   40,  296,  289,  297,  289,
			  289,  297,  289,  297,  297,  297,  297,  297,  298,  299,
			  289,  289,  289,  292,  289,  300,  289,  300,  300,  301,
			  289,  289,  289,  289,  289,  289,  289,  289,  294,  294,
			  294,  294,  294,  294,  294,  302,  295,   40,  289,   40,
			   40,   87,   40,   87,   40,   87,   40,   87,   40,  296,

			  297,  289,  289,  297,  289,  289,  289,  297,  297,  297,
			  297,  297,  298,  289,  299,  289,  289,  289,  303,  289,
			  289,  289,  289,  289,  289,  289,  289,  289,  289,  289,
			  289,  289,  289,  289,  294,  294,  294,  294,  294,  294,
			  294,  294,  294,  289,  289,  289,  289,   87,   87,   40,
			   87,   40,   87,   40,   87,   40,  297,  104,  297,  297,
			  297,  297,  297,  297,  297,  304,  303,  289,  289,  289,
			  289,  289,  289,  289,  289,  289,  289,  289,  289,  289,
			  289,  294,  294,  294,  294,   81,  294,  294,  294,  294,
			  294,  305,  306,   87,   40,   87,   40,   87,   40,   87,

			   40,  156,  297,  307,  289,  289,  289,  289,  289,  289,
			  294,  294,  140,  294,  294,  308,  305,   87,   40,   87,
			   40,   87,   40,  156,  309,  289,  289,  289,  289,  294,
			  289,  289,   87,   40,  156,  310,  289,  289,  289,  294,
			   87,   40,  297,  289,  289,  289,  289,  294,   87,   40,
			  297,  289,  289,  289,  289,  289,  289,  289,  289,  289,
			  289,  289,  289,  289,  289,  289,  289,  289,  289,  289,
			  289,  289,  289,  289,  289,  289,  289,  289,  289,  289,
			  289,  289,  289,  289,  289,  289,  289,  289,  289,    0,
			  289,  289,  289,  289,  289,  289,  289,  289,  289,  289,

			  289,  289,  289,  289,  289,  289,  289,  289,  289,  289,
			  289, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    2,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    4,    5,    6,    7,    8,    1,    9,   10,
			   11,   12,   13,   14,   15,   16,   17,   18,   19,   19,
			   20,   21,   22,   22,   22,   23,   23,   23,   24,   25,
			   26,   27,   28,   29,    1,   30,   31,   31,   32,   33,
			   34,   35,   36,   37,   35,   35,   38,   39,   40,   35,
			   41,   42,   43,   44,   45,   46,   35,   47,   35,   48,
			   49,   50,   51,   52,   53,   54,    1,   55,   56,   57,

			   58,   59,   60,   61,   62,   63,   61,   61,   64,   65,
			   66,   61,   61,   67,   68,   69,   70,   71,   61,   72,
			   73,   74,   61,   75,   76,   77,   78,    1,   79,   79,
			   79,   79,   79,   79,   79,   79,   79,   79,   79,   79,
			   79,   79,   79,   79,   80,   80,   80,   80,   80,   80,
			   80,   80,   80,   80,   80,   80,   80,   80,   80,   80,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,    1,    1,   82,   82,   82,   82,   82,   82,

			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   83,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   85,   86,   86,   86,   86,   86,   86,   86,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_meta_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    2,    3,    1,    4,    1,    1,    1,
			    1,    5,    6,    1,    1,    1,    7,    8,    1,    9,
			    9,    9,    9,   10,   11,   12,    4,    1,    4,    1,
			    9,    9,    9,    9,    9,   13,   14,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   15,   16,   17,
			    4,   18,   19,    4,   13,    9,    9,    9,    9,    9,
			    9,   13,   13,   13,   13,   13,   13,   20,   21,   22,
			   23,   24,   25,   26,   27,   28,    4,   29,    4,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,   83,   81,    1,
			    2,   14,   58,   17,   81,   15,   16,    7,    6,   12,
			    5,   10,    8,   53,   53,   13,   11,   26,   23,   27,
			   19,   48,   48,   48,   47,   48,   48,   21,   22,    9,
			   49,   49,   49,   49,   49,   49,   50,   20,   64,   65,
			   66,   64,   67,   64,   64,   64,   64,   64,   82,   51,
			   52,    1,    2,   58,   57,   79,   79,   79,   79,    3,
			   28,    0,   53,    0,   53,   25,   24,   18,   48,   48,
			   48,   48,   46,   48,   48,    0,    0,   49,    0,   49,
			   49,   49,   49,   49,   49,   49,   49,   49,   49,   50,

			   64,   66,   65,   64,   64,   60,   59,   61,   64,   64,
			   64,   64,    0,   52,   51,   79,   68,   79,   79,   79,
			   79,   79,   79,   79,   79,   79,   79,    4,   29,   55,
			   53,    0,    0,   54,   48,   48,   47,   47,   47,   47,
			   48,   48,   48,    0,   37,    0,   38,   38,   49,   49,
			   49,   49,   49,   49,   49,   49,   64,   64,   64,   64,
			   64,   64,   64,   64,   64,    0,    0,    0,   75,   73,
			   76,   80,   80,   74,   72,   69,   70,   71,    0,   53,
			    0,   48,   48,   48,   48,   48,   46,   46,   46,   48,
			   30,    0,   34,   49,   49,   49,   49,   49,   49,   30,

			   30,   64,   62,    0,   77,    0,   56,    0,   53,   43,
			   31,   48,   48,   48,   33,    0,    0,   31,   31,   49,
			   49,   33,   33,   64,    0,    0,    0,    0,   43,   48,
			   36,   35,   49,   49,   64,    0,   45,    0,    0,   48,
			   49,   49,   64,    0,    0,    0,   42,   32,   32,   32,
			   63,    0,    0,    0,    0,    0,   42,   78,   44,    0,
			   42,    0,    0,    0,    0,   41,    0,    0,   41,    0,
			    0,    0,   40,    0,    0,    0,   40,    0,    0,    0,
			   39,    0,    0,    0,   39,    0,   39,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 1666
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 289
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 290
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

	yyNb_rules: INTEGER is 82
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 83
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
