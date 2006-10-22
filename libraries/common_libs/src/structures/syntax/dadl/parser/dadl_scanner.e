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
if yy_act <= 42 then
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
if yy_act <= 32 then
if yy_act <= 27 then
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
if yy_act <= 26 then
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
end
else
if yy_act <= 30 then
if yy_act <= 29 then
if yy_act = 28 then
	yy_position := yy_position + 2
--|#line 128 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 128")
end
last_token := SYM_ELLIPSIS
else
	yy_position := yy_position + 3
--|#line 129 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 129")
end
last_token := SYM_LIST_CONTINUE
end
else
	yy_position := yy_position + 4
--|#line 133 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 133")
end
last_token := SYM_TRUE
end
else
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
end
end
else
if yy_act <= 37 then
if yy_act <= 35 then
if yy_act <= 34 then
if yy_act = 33 then
	yy_position := yy_position + 5
--|#line 140 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 140")
end
last_token := SYM_QUERY_FUNC
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
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 149 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 149")
end

					last_token := V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
else
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
end
else
if yy_act <= 40 then
if yy_act <= 39 then
if yy_act = 38 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 165 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 165")
end

					last_token := V_LOCAL_CODE
					last_string_value := text
			
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
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 173 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 173")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
if yy_act = 41 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 174 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 174")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 181 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 181")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
end
end
end
end
else
if yy_act <= 63 then
if yy_act <= 53 then
if yy_act <= 48 then
if yy_act <= 45 then
if yy_act <= 44 then
if yy_act = 43 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 182 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 182")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
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
	yy_position := yy_position + 7
--|#line 190 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 190")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
else
if yy_act <= 47 then
if yy_act = 46 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 200 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 200")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 201 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 201")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 207 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 207")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
end
end
else
if yy_act <= 51 then
if yy_act <= 50 then
if yy_act = 49 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 212 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 212")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 217 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 217")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 224 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 224")
end
				-- beginning of CADL block
				in_buffer.append_string (text)
				set_start_condition (IN_CADL_BLOCK)
				cadl_depth := 1
			
end
else
if yy_act = 52 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 231 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 231")
end
		-- got an open brace
				in_buffer.append_string (text)
				cadl_depth := cadl_depth + 1
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 235 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 235")
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
if yy_act <= 58 then
if yy_act <= 56 then
if yy_act <= 55 then
if yy_act = 54 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 252 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 252")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 253 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 253")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 260 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 260")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
else
if yy_act = 57 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 261 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 261")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 268 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 268")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
end
end
else
if yy_act <= 61 then
if yy_act <= 60 then
if yy_act = 59 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 273 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 273")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
else
	yy_position := yy_position + 2
--|#line 281 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 281")
end
in_buffer.append_character ('\')
end
else
	yy_position := yy_position + 2
--|#line 283 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 283")
end
in_buffer.append_character ('"')
end
else
if yy_act = 62 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 285 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 285")
end

				in_buffer.append_string (text)
	
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 289 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 289")
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
if yy_act <= 73 then
if yy_act <= 68 then
if yy_act <= 66 then
if yy_act <= 65 then
if yy_act = 64 then
	yy_position := yy_position + 8
--|#line 304 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 304")
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
--|#line 319 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 319")
end
in_buffer.append_string (text)
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 321 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 321")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
else
if yy_act = 67 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 326 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 326")
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
--|#line 337 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 337")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
end
else
if yy_act <= 71 then
if yy_act <= 70 then
if yy_act = 69 then
	yy_position := yy_position + 3
--|#line 347 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 347")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
	yy_position := yy_position + 4
--|#line 348 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 348")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
else
	yy_position := yy_position + 4
--|#line 349 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 349")
end
last_token := V_CHARACTER; last_character_value := '%R'
end
else
if yy_act = 72 then
	yy_position := yy_position + 4
--|#line 350 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 350")
end
last_token := V_CHARACTER; last_character_value := '%T'
else
	yy_position := yy_position + 4
--|#line 351 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 351")
end
last_token := V_CHARACTER; last_character_value := '%F'
end
end
end
else
if yy_act <= 78 then
if yy_act <= 76 then
if yy_act <= 75 then
if yy_act = 74 then
	yy_position := yy_position + 4
--|#line 352 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 352")
end
last_token := V_CHARACTER; last_character_value := '%''
else
	yy_position := yy_position + 4
--|#line 353 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 353")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
else
	yy_position := yy_position + 4
--|#line 354 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 354")
end
last_token := V_CHARACTER; last_character_value := '"'
end
else
if yy_act = 77 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 355 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 355")
end

						code_ := text_substring (4, text_count - 1).to_integer
						last_token := V_CHARACTER
						last_character_value := code_.to_character
				
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 360 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 360")
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
if yy_act <= 81 then
if yy_act <= 80 then
if yy_act = 79 then
	yy_position := yy_position + 10
--|#line 370 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 370")
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
--|#line 381 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 381")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 382 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 382")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 82 then
	yy_position := yy_position + 1
--|#line 386 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 386")
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
			    8,    8,    8,    8,    8,    8,    8,   49,  102,   59,
			   50,   60,   49,   51,   59,   50,   60,   61,   51,   61,

			   66,   67,   71,   79,   72,   72,   72,   72,   72,   71,
			   90,   74,   74,   74,   74,   74,   79,   81,   73,   79,
			   80,   79,  103,   90,  103,   73,   82,   82,   82,   82,
			   82,  156,   98,   79,  106,   52,  150,  264,   85,   84,
			   52,  260,   68,   81,   73,   80,   90,  102,   86,   86,
			  102,   73,   83,   86,   86,  158,  156,   99,   92,   90,
			   94,   79,  150,   85,   84,  254,   53,   54,   55,   56,
			   57,   53,   54,   55,   56,   57,   96,   90,  102,  107,
			   61,  102,   61,   93,  102,   90,   95,   90,  102,   90,
			   90,   86,   88,   88,   88,   88,   88,   89,   90,  247,

			   90,   97,   90,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,  108,  108,  108,  152,   88,   90,   90,
			   91,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   91,   90,   90,   90,   90,  102,  104,
			  233,   79,  152,  109,  110,  110,  110,   79,  111,  111,
			   79,  112,  112,  112,  130,  130,  130,  130,  130,  136,
			   79,  144,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  103,  154,  103,  136,  144,  105,  105,  105,

			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  116,  116,  154,
			  116,  116,  116,  118,  116,  116,  117,  116,  116,  116,
			  116,  116,  116,  116,  116,  119,  119,  119,  119,  119,
			  116,  116,  116,  116,  116,  116,  119,  119,  119,  119,
			  119,  119,  119,  119,  119,  119,  119,  119,  119,  119,
			  119,  119,  119,  119,  119,  119,  116,  116,  116,  116,
			  119,  119,  119,  119,  119,  119,  119,  119,  119,  119,
			  119,  119,  119,  119,  119,  119,  119,  119,  119,  119,
			  119,  116,  116,  116,  116,  116,  116,  116,  116,  116,

			  116,  116,  116,  120,  128,  228,  128,  121,   71,   90,
			  131,  131,  131,  131,  131,  132,  122,  122,  122,  122,
			  122,  133,   90,  133,   73,   90,  134,  134,  134,  134,
			  134,   71,   79,  131,  131,  131,  131,  131,   90,   90,
			  137,  102,  142,  142,  142,  142,  142,   73,  123,   79,
			   73,   79,   90,  150,  102,   86,   86,  124,  143,  102,
			   79,  218,  102,  125,  102,  126,  137,  127,  145,  154,
			  102,  185,   90,   73,   82,   82,   82,   82,   82,  151,
			  102,   79,  152,  218,  143,   90,  148,  138,  149,  149,
			  149,  149,  149,   90,  139,  155,  146,  185,  156,  196,

			   79,   79,  140,  141,   90,   90,   90,   79,  153,   90,
			  255,  255,  255,  138,  108,  108,  108,   90,   90,   83,
			  139,  183,   90,  157,  196,  207,   90,  140,  169,  141,
			  292,  234,  108,  108,  108,  165,  165,  165,  172,   90,
			  160,  161,  162,  163,  164,  109,  173,  174,  174,  174,
			  174,  174,  205,  166,  166,  166,  182,  182,  182,  182,
			  195,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,  101,  101,  194,  101,  101,  102,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  159,

			  159,  159,  159,  159,  101,  101,  101,  101,  101,  101,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159,
			  101,  183,  101,  101,  159,  159,  159,  159,  159,  159,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159,
			  159,  159,  159,  159,  159,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  130,  130,  130,
			  130,  130,   71,   79,  181,  181,  181,  181,  181,   79,
			  193,  180,  134,  134,  134,  134,  134,  179,   73,  134,
			  134,  134,  134,  134,  178,  198,   79,  184,  186,  186,

			  186,  186,  186,  102,  177,   79,  193,  180,  187,  187,
			  187,  187,  187,  192,   73,   79,  188,  188,  188,  188,
			  188,  198,  184,   79,   83,  176,  142,  142,  142,  142,
			  142,  102,  175,   79,   83,  102,  266,  266,  192,  200,
			  202,  102,   83,  189,  102,  196,  190,  198,  102,  102,
			  148,  191,  148,  148,  148,  148,  148,  148,   90,  149,
			  149,  149,  149,  149,  200,  200,  202,   90,  253,  189,
			  197,   90,  190,  199,  202,  172,  191,  111,  111,   90,
			   90,  220,  171,  173,  174,  174,  174,  174,  174,  229,
			  201,  229,   90,  212,  212,  212,  212,  212,   90,  230,

			  203,  206,  206,  170,  108,  108,  108,  220,  110,  110,
			  110,   90,  102,  169,  112,  112,  112,  108,  108,  108,
			  167,  108,  108,  108,  231,  204,  204,  204,  204,  204,
			   79,  227,  227,  222,  238,  238,  204,  204,  204,  204,
			  204,  208,  114,  208,  214,   79,  209,  209,  209,  209,
			  209,  210,   71,   79,  211,  211,  211,  211,  211,  222,
			  213,  204,  204,  204,  204,  204,  204,  217,   73,  102,
			  214,  186,  186,  186,  186,  186,  187,  187,  187,  187,
			  187,  224,  147,   79,  246,  246,  213,  145,   79,  138,
			  129,   78,  235,  217,   73,  188,  188,  188,  188,  188,

			   78,  215,  215,  215,  215,  215,  220,  224,   79,  216,
			  216,  216,  216,  216,  222,  138,   79,   78,  235,  224,
			  241,  241,  241,  241,   78,  128,   78,  117,   90,   64,
			   90,   90,  221,  209,  209,  209,  209,  209,   79,   62,
			  223,   90,   79,   90,   90,  225,  114,  102,  235,  232,
			   78,  226,  226,  226,  226,  226,  209,  209,  209,  209,
			  209,  242,  226,  226,  226,  226,  226,   71,   90,  211,
			  211,  211,  211,  211,  236,  232,  215,  215,  215,  215,
			  215,   90,  251,   73,   79,   77,  242,  226,  226,  226,
			  226,  226,  226,   78,   79,  216,  216,  216,  216,  216,

			  243,   76,   79,  239,  239,  239,  239,  239,  251,   73,
			  240,  240,  240,  240,  240,  243,  250,  251,   75,   78,
			  191,  257,  258,  257,   70,  243,   90,   90,  248,  248,
			  248,  248,  248,  249,  249,  249,  249,  249,   69,   90,
			  244,   64,  250,  252,   62,  191,  237,  237,  237,  237,
			  237,  256,  256,  256,  256,  256,  259,  237,  237,  237,
			  237,  237,  261,  261,  261,  261,  261,  231,  231,  231,
			  231,  231,  262,  262,  262,  262,  262,  263,  263,  263,
			  263,  263,  237,  237,  237,  237,  237,  237,  245,  245,
			  245,  245,  245,  265,  265,  265,  265,  265,  292,  245,

			  245,  245,  245,  245,  257,  292,  257,  292,  292,  263,
			  263,  263,  263,  263,  267,  267,  267,  267,  267,  268,
			  268,  268,  268,  268,  245,  245,  245,  245,  245,  245,
			  259,  259,  259,  259,  259,  269,  292,  269,  292,  259,
			  272,  272,  272,  272,  272,  270,  273,  273,  273,  273,
			  274,  274,  274,  274,  274,  275,  275,  275,  275,  275,
			  276,  276,  276,  276,  276,  277,  292,  277,  292,  292,
			  271,  281,  281,  281,  281,  278,  271,  271,  271,  271,
			  271,  280,  280,  280,  280,  280,  282,  282,  282,  282,
			  282,  283,  283,  283,  283,  283,  285,  286,  285,  292,

			  279,  284,  284,  284,  284,  284,  279,  279,  279,  279,
			  279,  288,  288,  288,  288,  288,  289,  289,  289,  289,
			  289,  290,  290,  290,  290,  290,  292,  285,  292,  285,
			  292,  287,  289,  289,  289,  289,  289,  291,  291,  291,
			  291,  291,  287,  287,  287,  287,  287,  292,  292,  292,
			  292,  292,  292,  292,  292,  292,  292,  292,  292,  292,
			  292,  292,  287,   48,   48,   48,   48,   48,   48,   48,
			   48,   48,   48,   48,   48,   48,   48,   48,   48,   48,
			   48,   48,   48,   48,   48,   48,   48,   48,   48,   48,
			   48,   48,   48,   48,   48,   58,   58,   58,   58,   58,

			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   63,  292,   63,
			   63,   63,   63,   63,   63,   63,   63,   63,   63,   63,
			   63,   63,   63,   63,   63,   63,   63,  292,   63,   63,
			   63,   63,   63,   63,   63,   63,   63,   63,   63,   65,
			  292,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   78,   78,  292,  292,   78,  292,   78,   78,   78,

			   78,   78,  292,  292,   78,   78,   78,   78,   78,   78,
			   78,   78,   87,   87,  292,   87,   87,   87,   87,  292,
			  292,  292,  292,   87,   87,   87,   87,   87,  292,  292,
			   87,   87,   87,   87,   87,   87,   87,   87,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  101,  292,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  292,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,

			  113,  113,  113,  113,  113,  113,  113,  113,  113,  113,
			  113,  113,  113,  113,  113,  113,  113,  113,  113,  113,
			  113,  113,  113,  113,  113,  113,  113,  113,  113,  113,
			  292,  113,  115,  115,  115,  115,  115,  115,  115,  115,
			  115,  115,  115,  115,  115,  115,  115,  115,  115,  115,
			  115,  115,  115,  115,  115,  115,  115,  115,  115,  115,
			  115,  115,  116,  292,  116,  116,  116,  116,  116,  116,
			  116,  116,  116,  116,  116,  116,  116,  116,  116,  116,
			  116,  116,  116,  116,  116,  116,  116,  116,  116,  116,
			  116,  116,  116,  116,   69,   69,   69,   69,   69,   69,

			   69,   69,   69,   69,   69,   69,   69,   69,   69,   69,
			   69,   69,   69,   69,   69,   69,   69,   69,   69,   69,
			   69,   69,   69,   69,   69,   69,  135,  292,  292,  135,
			  135,  292,  292,  135,  135,  135,  135,  135,  135,  135,
			  292,  292,  135,  135,  135,  135,  135,  135,  135,  135,
			   86,   86,  292,   86,   86,   86,   86,   86,  292,  292,
			  292,   86,   86,   86,   86,   86,  292,  292,   86,   86,
			   86,   86,   86,   86,   86,   86,  168,  168,  292,  168,
			  292,  292,  168,  168,  168,  168,  168,  292,  292,  168,
			  168,  168,  168,  168,  168,  168,  168,  219,  292,  292,

			  292,  292,  219,  219,  219,  219,  292,  292,  292,  292,
			  219,  219,  219,  219,  219,  292,  292,  219,  219,  219,
			  219,  219,  219,  219,  219,  195,  195,  292,  292,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  292,  292,
			  195,  195,  195,  195,  195,  292,  292,  195,  195,  195,
			  195,  195,  195,  195,  195,  218,  292,  292,  292,  292,
			  218,  218,  218,  218,  292,  292,  292,  292,  218,  218,
			  218,  218,  218,  292,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,    7,  292,  292,  292,  292,  292,  292,
			  292,  292,  292,  292,  292,  292,  292,  292,  292,  292,

			  292,  292,  292,  292,  292,  292,  292,  292,  292,  292,
			  292,  292,  292,  292,  292,  292,  292,  292,  292,  292,
			  292,  292,  292,  292,  292,  292,  292,  292,  292,  292,
			  292,  292,  292,  292,  292,  292,  292,  292,  292,  292,
			  292,  292,  292,  292,  292,  292,  292,  292,  292,  292,
			  292,  292,  292,  292,  292,  292,  292,  292,  292,  292,
			  292,  292,  292,  292,  292,  292,  292,  292,  292,  292, yy_Dummy>>)
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
			    1,    1,    1,    1,    1,    1,    1,    3,  104,    5,
			    3,    5,    4,    3,    6,    4,    6,    9,    4,    9,

			   14,   14,   23,   33,   23,   23,   23,   23,   23,   24,
			   41,   24,   24,   24,   24,   24,   32,   33,   23,   35,
			   32,   36,   49,   41,   49,   24,   34,   34,   34,   34,
			   34,   98,   45,   34,   52,    3,   92,  261,   36,   35,
			    4,  254,   14,   33,   23,   32,   45,  253,   37,   37,
			   53,   24,   34,   37,   37,  104,   98,   45,   42,   45,
			   43,  250,   92,   36,   35,  246,    3,    3,    3,    3,
			    3,    4,    4,    4,    4,    4,   44,   43,   54,   52,
			   61,   55,   61,   42,   56,   42,   43,   44,   57,   90,
			   43,   37,   40,   40,   40,   40,   40,   40,   42,  239,

			   44,   44,   90,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   53,   53,   53,   94,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   51,   51,
			  218,   85,   94,   54,   55,   55,   55,   80,   56,   56,
			  217,   57,   57,   57,   71,   71,   71,   71,   71,   80,
			  213,   85,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,  103,   96,  103,   80,   85,   51,   51,   51,

			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   66,   66,   96,
			   66,   66,   66,   66,   66,   66,   66,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,   66,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,   66,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,   66,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,   66,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,   66,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,   66,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,   66,   66,   66,   66,

			   66,   66,   66,   68,  128,  210,  128,   68,   72,  203,
			   72,   72,   72,   72,   72,   72,   68,   68,   68,   68,
			   68,   73,  203,   73,   72,  221,   73,   73,   73,   73,
			   73,   74,   81,   74,   74,   74,   74,   74,  221,  225,
			   81,  109,   83,   83,   83,   83,   83,   74,   68,   83,
			   72,   84,  225,   93,  205,   87,   87,   68,   84,  110,
			  137,  194,  111,   68,  108,   68,   81,   68,   87,   97,
			  161,  137,   93,   74,   82,   82,   82,   82,   82,   93,
			  112,   82,   95,  219,   84,   93,   91,   82,   91,   91,
			   91,   91,   91,   97,   82,   97,   87,  137,   99,  150,

			  138,  193,   82,   82,  252,   95,   97,  191,   95,   99,
			  247,  247,  247,   82,  109,  109,  109,  252,   95,  138,
			   82,  183,   99,   99,  150,  169,   91,   82,  168,   82,
			   88,  219,  110,  110,  110,  111,  111,  111,  122,   91,
			  108,  108,  108,  108,  108,  161,  122,  122,  122,  122,
			  122,  122,  159,  112,  112,  112,  132,  132,  132,  132,
			  147,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,  105,  105,  145,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,

			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  135,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  130,  130,  130,
			  130,  130,  131,  144,  131,  131,  131,  131,  131,  136,
			  144,  130,  133,  133,  133,  133,  133,  127,  131,  134,
			  134,  134,  134,  134,  126,  152,  143,  136,  139,  139,

			  139,  139,  139,  163,  125,  139,  144,  130,  140,  140,
			  140,  140,  140,  143,  131,  140,  141,  141,  141,  141,
			  141,  152,  136,  141,  139,  124,  142,  142,  142,  142,
			  142,  160,  123,  142,  140,  162,  264,  264,  143,  154,
			  156,  164,  141,  142,  165,  151,  142,  153,  166,  245,
			  148,  142,  148,  148,  148,  148,  148,  149,  151,  149,
			  149,  149,  149,  149,  154,  155,  156,  153,  245,  142,
			  151,  151,  142,  153,  157,  174,  142,  163,  163,  155,
			  153,  196,  121,  174,  174,  174,  174,  174,  174,  212,
			  155,  212,  155,  182,  182,  182,  182,  182,  157,  212,

			  157,  308,  308,  120,  160,  160,  160,  196,  162,  162,
			  162,  157,  158,  119,  164,  164,  164,  165,  165,  165,
			  118,  166,  166,  166,  212,  158,  158,  158,  158,  158,
			  185,  311,  311,  198,  313,  313,  158,  158,  158,  158,
			  158,  180,  113,  180,  185,  192,  180,  180,  180,  180,
			  180,  181,  181,  184,  181,  181,  181,  181,  181,  198,
			  184,  158,  158,  158,  158,  158,  158,  192,  181,  101,
			  185,  186,  186,  186,  186,  186,  187,  187,  187,  187,
			  187,  200,   89,  187,  314,  314,  184,   86,   78,  187,
			   70,  186,  222,  192,  181,  188,  188,  188,  188,  188,

			  186,  189,  189,  189,  189,  189,  197,  200,  189,  190,
			  190,  190,  190,  190,  199,  187,  190,  186,  222,  201,
			  230,  230,  230,  230,  188,   69,  186,   65,  201,   63,
			  197,  199,  197,  208,  208,  208,  208,  208,  214,   62,
			  199,  201,  232,  197,  199,  201,   58,   48,  223,  214,
			  188,  204,  204,  204,  204,  204,  209,  209,  209,  209,
			  209,  232,  204,  204,  204,  204,  204,  211,  223,  211,
			  211,  211,  211,  211,  223,  214,  215,  215,  215,  215,
			  215,  223,  243,  211,   31,   30,  232,  204,  204,  204,
			  204,  204,  204,  215,  242,  216,  216,  216,  216,  216,

			  235,   29,  216,  228,  228,  228,  228,  228,  243,  211,
			  229,  229,  229,  229,  229,  236,  242,  244,   27,  215,
			  216,  249,  249,  249,   21,  235,  244,  236,  240,  240,
			  240,  240,  240,  241,  241,  241,  241,  241,   20,  244,
			  236,   12,  242,  244,   10,  216,  226,  226,  226,  226,
			  226,  248,  248,  248,  248,  248,  249,  226,  226,  226,
			  226,  226,  255,  255,  255,  255,  255,  256,  256,  256,
			  256,  256,  257,  257,  257,  257,  257,  258,  258,  258,
			  258,  258,  226,  226,  226,  226,  226,  226,  237,  237,
			  237,  237,  237,  262,  262,  262,  262,  262,    7,  237,

			  237,  237,  237,  237,  263,    0,  263,    0,    0,  263,
			  263,  263,  263,  263,  265,  265,  265,  265,  265,  266,
			  266,  266,  266,  266,  237,  237,  237,  237,  237,  237,
			  267,  267,  267,  267,  267,  268,    0,  268,    0,  263,
			  269,  269,  269,  269,  269,  268,  270,  270,  270,  270,
			  272,  272,  272,  272,  272,  273,  273,  273,  273,  273,
			  274,  274,  274,  274,  274,  275,    0,  275,    0,    0,
			  268,  278,  278,  278,  278,  275,  276,  276,  276,  276,
			  276,  277,  277,  277,  277,  277,  280,  280,  280,  280,
			  280,  281,  281,  281,  281,  281,  283,  283,  283,    0,

			  275,  282,  282,  282,  282,  282,  284,  284,  284,  284,
			  284,  285,  285,  285,  285,  285,  286,  286,  286,  286,
			  286,  288,  288,  288,  288,  288,    0,  289,    0,  289,
			    0,  283,  289,  289,  289,  289,  289,  290,  290,  290,
			  290,  290,  291,  291,  291,  291,  291,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  289,  293,  293,  293,  293,  293,  293,  293,
			  293,  293,  293,  293,  293,  293,  293,  293,  293,  293,
			  293,  293,  293,  293,  293,  293,  293,  293,  293,  293,
			  293,  293,  293,  293,  293,  294,  294,  294,  294,  294,

			  294,  294,  294,  294,  294,  294,  294,  294,  294,  294,
			  294,  294,  294,  294,  294,  294,  294,  294,  294,  294,
			  294,  294,  294,  294,  294,  294,  294,  295,    0,  295,
			  295,  295,  295,  295,  295,  295,  295,  295,  295,  295,
			  295,  295,  295,  295,  295,  295,  295,    0,  295,  295,
			  295,  295,  295,  295,  295,  295,  295,  295,  295,  296,
			    0,  296,  296,  296,  296,  296,  296,  296,  296,  296,
			  296,  296,  296,  296,  296,  296,  296,  296,  296,  296,
			  296,  296,  296,  296,  296,  296,  296,  296,  296,  296,
			  296,  297,  297,    0,    0,  297,    0,  297,  297,  297,

			  297,  297,    0,    0,  297,  297,  297,  297,  297,  297,
			  297,  297,  298,  298,    0,  298,  298,  298,  298,    0,
			    0,    0,    0,  298,  298,  298,  298,  298,    0,    0,
			  298,  298,  298,  298,  298,  298,  298,  298,  299,  299,
			  299,  299,  299,  299,  299,  299,  299,  299,  299,  299,
			  299,  299,  299,  299,  299,  299,  299,  299,  299,  299,
			  299,  299,  299,  299,  299,  299,  299,  299,  300,    0,
			  300,  300,  300,  300,  300,  300,  300,  300,  300,  300,
			  300,  300,  300,  300,  300,  300,  300,  300,    0,  300,
			  300,  300,  300,  300,  300,  300,  300,  300,  300,  300,

			  301,  301,  301,  301,  301,  301,  301,  301,  301,  301,
			  301,  301,  301,  301,  301,  301,  301,  301,  301,  301,
			  301,  301,  301,  301,  301,  301,  301,  301,  301,  301,
			    0,  301,  302,  302,  302,  302,  302,  302,  302,  302,
			  302,  302,  302,  302,  302,  302,  302,  302,  302,  302,
			  302,  302,  302,  302,  302,  302,  302,  302,  302,  302,
			  302,  302,  303,    0,  303,  303,  303,  303,  303,  303,
			  303,  303,  303,  303,  303,  303,  303,  303,  303,  303,
			  303,  303,  303,  303,  303,  303,  303,  303,  303,  303,
			  303,  303,  303,  303,  304,  304,  304,  304,  304,  304,

			  304,  304,  304,  304,  304,  304,  304,  304,  304,  304,
			  304,  304,  304,  304,  304,  304,  304,  304,  304,  304,
			  304,  304,  304,  304,  304,  304,  305,    0,    0,  305,
			  305,    0,    0,  305,  305,  305,  305,  305,  305,  305,
			    0,    0,  305,  305,  305,  305,  305,  305,  305,  305,
			  306,  306,    0,  306,  306,  306,  306,  306,    0,    0,
			    0,  306,  306,  306,  306,  306,    0,    0,  306,  306,
			  306,  306,  306,  306,  306,  306,  307,  307,    0,  307,
			    0,    0,  307,  307,  307,  307,  307,    0,    0,  307,
			  307,  307,  307,  307,  307,  307,  307,  309,    0,    0,

			    0,    0,  309,  309,  309,  309,    0,    0,    0,    0,
			  309,  309,  309,  309,  309,    0,    0,  309,  309,  309,
			  309,  309,  309,  309,  309,  310,  310,    0,    0,  310,
			  310,  310,  310,  310,  310,  310,  310,  310,    0,    0,
			  310,  310,  310,  310,  310,    0,    0,  310,  310,  310,
			  310,  310,  310,  310,  310,  312,    0,    0,    0,    0,
			  312,  312,  312,  312,    0,    0,    0,    0,  312,  312,
			  312,  312,  312,    0,  312,  312,  312,  312,  312,  312,
			  312,  312,  312,  292,  292,  292,  292,  292,  292,  292,
			  292,  292,  292,  292,  292,  292,  292,  292,  292,  292,

			  292,  292,  292,  292,  292,  292,  292,  292,  292,  292,
			  292,  292,  292,  292,  292,  292,  292,  292,  292,  292,
			  292,  292,  292,  292,  292,  292,  292,  292,  292,  292,
			  292,  292,  292,  292,  292,  292,  292,  292,  292,  292,
			  292,  292,  292,  292,  292,  292,  292,  292,  292,  292,
			  292,  292,  292,  292,  292,  292,  292,  292,  292,  292,
			  292,  292,  292,  292,  292,  292,  292,  292,  292,  292, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   84,   89,   14,   19, 1098, 1783,   95,
			 1041, 1783, 1035, 1783,   91, 1783, 1783, 1783, 1783, 1783,
			 1022, 1007, 1783,   85,   92, 1783, 1783,  991, 1783,  974,
			  956,  958,   90,   77,  107,   93,   95,  137, 1783, 1783,
			  173,   53,  128,  120,  130,   89,    0, 1783,  941,  120,
			 1783,  242,  128,  144,  172,  175,  178,  182,  869,    0,
			 1783,  178,  936,  923, 1783,  917,  316,    0,  397,  922,
			  873,  245,  391,  407,  414, 1783, 1783, 1783,  862,    0,
			  231,  406,  455,  423,  425,  225,  863,  444,  506,  864,
			  132,  469,   98,  415,  192,  448,  260,  436,   85,  452,

			    0,  863, 1783,  290,   82,  580, 1783, 1783,  458,  435,
			  453,  456,  474,  765, 1783,    0, 1783, 1783,  747,  788,
			  793,  772,  528,  722,  715,  694,  684,  677,  402, 1783,
			  648,  655,  537,  663,  670,  603,  653,  434,  474,  679,
			  689,  697,  707,  670,  647,  559, 1783,  542,  733,  740,
			  455,  701,  658,  710,  696,  722,  707,  741,  806,  527,
			  725,  464,  729,  697,  735,  738,  742,    0,  503,  515,
			 1783, 1783, 1783, 1783,  765, 1783, 1783, 1783, 1783, 1783,
			  827,  835,  774,  493,  827,  804,  852,  857,  876,  882,
			  890,  481,  819,  475,  457,    0,  748,  873,  793,  874,

			  833,  871,    0,  352,  932,  448,    0, 1783,  914,  937,
			  386,  950,  775,  244,  912,  957,  976,  234,  198,  479,
			    0,  368,  855,  911,    0,  382, 1027,    0,  984,  991,
			  901, 1783,  916, 1783, 1783,  955,  970, 1069,    0,  183,
			 1009, 1014,  968,  934,  969,  743,  140,  491, 1032, 1007,
			  135,    0,  447,  141,  131, 1043, 1048, 1053, 1058, 1783,
			 1783,   92, 1074, 1090,  717, 1095, 1100, 1111, 1121, 1121,
			 1127, 1783, 1131, 1136, 1141, 1151, 1157, 1162, 1152, 1783,
			 1167, 1172, 1182, 1182, 1187, 1192, 1197, 1783, 1202, 1213,
			 1218, 1223, 1783, 1262, 1294, 1326, 1358, 1381, 1407, 1437,

			 1467, 1499, 1531, 1561, 1593, 1619, 1645, 1666,  791, 1694,
			 1724,  821, 1752,  824,  874, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  292,    1,  293,  293,  294,  294,  292,  292,  292,
			  292,  292,  295,  292,  296,  292,  292,  292,  292,  292,
			  292,  292,  292,  292,  292,  292,  292,  292,  292,  292,
			  292,  297,  297,  297,  297,  297,  297,  298,  292,  292,
			  292,   40,   40,   40,   40,   40,  299,  292,  300,  292,
			  292,  300,  292,  300,  300,  300,  300,  300,  301,  302,
			  292,  292,  292,  295,  292,  303,  292,  303,  303,  304,
			  292,  292,  292,  292,  292,  292,  292,  292,  297,  305,
			  297,  297,  297,  297,  297,  297,  306,  298,   40,  292,
			   40,   40,   88,   40,   88,   40,   88,   40,   88,   40,

			  299,  300,  292,  292,  300,  292,  292,  292,  300,  300,
			  300,  300,  300,  301,  292,  302,  292,  292,  292,  307,
			  292,  292,  292,  292,  292,  292,  292,  292,  292,  292,
			  292,  292,  292,  292,  292,  305,  297,  297,  297,  297,
			  297,  297,  297,  297,  297,  292,  292,  292,  292,   88,
			   88,   40,   88,   40,   88,   40,   88,   40,  300,  105,
			  300,  300,  300,  300,  300,  300,  300,  308,  307,  292,
			  292,  292,  292,  292,  292,  292,  292,  292,  292,  292,
			  292,  292,  292,  305,  297,  297,   82,  297,   82,  297,
			  297,  297,  297,  297,  309,  310,   88,   40,   88,   40,

			   88,   40,   88,   40,  158,  300,  311,  292,  292,  292,
			  292,  292,  292,  297,  297,  142,  297,  297,  312,  309,
			   88,   40,   88,   40,   88,   40,  158,  313,  292,  292,
			  292,  292,  297,  292,  292,   88,   40,  158,  314,  292,
			  292,  292,  297,   88,   40,  300,  292,  292,  292,  292,
			  297,   88,   40,  300,  292,  292,  292,  292,  292,  292,
			  292,  292,  292,  292,  292,  292,  292,  292,  292,  292,
			  292,  292,  292,  292,  292,  292,  292,  292,  292,  292,
			  292,  292,  292,  292,  292,  292,  292,  292,  292,  292,
			  292,  292,    0,  292,  292,  292,  292,  292,  292,  292,

			  292,  292,  292,  292,  292,  292,  292,  292,  292,  292,
			  292,  292,  292,  292,  292, yy_Dummy>>)
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
			    1,    5,    6,    1,    1,    7,    8,    9,    1,   10,
			   10,   10,   10,   11,   12,   13,   14,    1,   15,    1,
			   10,   10,   10,   10,   10,   16,   17,   16,   16,   16,
			   16,   16,   16,   16,   16,   16,   16,   18,   19,   20,
			    4,   21,   22,    4,   16,   10,   10,   10,   10,   10,
			   10,   16,   16,   16,   16,   16,   16,   23,   24,   25,
			   26,   27,   28,   29,   30,   31,    4,   32,    4,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,   84,   82,    1,
			    2,   14,   59,   17,   82,   15,   16,    7,    6,   12,
			    5,   10,    8,   54,   54,   13,   11,   26,   23,   27,
			   19,   48,   48,   48,   47,   48,   48,   21,   22,    9,
			   50,   50,   50,   50,   50,   50,   51,   20,   65,   66,
			   67,   65,   68,   65,   65,   65,   65,   65,   83,   52,
			   53,    1,    2,   59,   58,   80,   80,   80,   80,    3,
			   28,    0,   54,    0,   54,   25,   24,   18,   48,    0,
			   48,   48,   48,   46,   48,   48,    0,    0,   50,    0,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,

			   51,   65,   67,   66,   65,   65,   61,   60,   62,   65,
			   65,   65,   65,    0,   53,   52,   80,   69,   80,   80,
			   80,   80,   80,   80,   80,   80,   80,   80,    4,   29,
			   56,   54,    0,    0,   55,    0,   48,   48,   47,   47,
			   47,   47,   48,   48,   48,    0,   37,    0,   38,   38,
			   50,   50,   50,   50,   50,   50,   50,   50,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,    0,    0,    0,
			   76,   74,   77,   81,   81,   75,   73,   70,   71,   72,
			    0,   54,    0,   49,   48,   48,   48,   48,   48,   46,
			   46,   46,   48,   30,    0,   34,   50,   50,   50,   50,

			   50,   50,   30,   30,   65,   63,    0,   78,    0,   57,
			    0,   54,   43,   31,   48,   48,   48,   33,    0,    0,
			   31,   31,   50,   50,   33,   33,   65,    0,    0,    0,
			    0,   43,   48,   36,   35,   50,   50,   65,    0,   45,
			    0,    0,   48,   50,   50,   65,    0,    0,    0,   42,
			   32,   32,   32,   64,    0,    0,    0,    0,    0,   42,
			   79,   44,    0,   42,    0,    0,    0,    0,   41,    0,
			    0,   41,    0,    0,    0,   40,    0,    0,    0,   40,
			    0,    0,    0,   39,    0,    0,    0,   39,    0,   39,
			    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 1783
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 292
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 293
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

	yyNb_rules: INTEGER is 83
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 84
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
