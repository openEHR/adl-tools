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
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 183 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 183")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
else
	yy_position := yy_position + 10
--|#line 190 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 190")
end

-- [0-9]{4} { -- can't handle year only, since it will be confused with plain integer
				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
else
if yy_act <= 47 then
if yy_act = 46 then
	yy_position := yy_position + 7
--|#line 191 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 191")
end

-- [0-9]{4} { -- can't handle year only, since it will be confused with plain integer
				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 199 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 199")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 200 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 200")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
end
else
if yy_act <= 51 then
if yy_act <= 50 then
if yy_act = 49 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 201 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 201")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 207 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 207")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
end
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
if yy_act = 52 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 219 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 219")
end
				-- beginning of CADL block
				in_buffer.append_string (text)
				set_start_condition (IN_CADL_BLOCK)
				cadl_depth := 1
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 226 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 226")
end
		-- got an open brace
				in_buffer.append_string (text)
				cadl_depth := cadl_depth + 1
			
end
end
end
else
if yy_act <= 58 then
if yy_act <= 56 then
if yy_act <= 55 then
if yy_act = 54 then
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
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 247 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 247")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
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
if yy_act = 57 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 255 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 255")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 256 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 256")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
end
else
if yy_act <= 61 then
if yy_act <= 60 then
if yy_act = 59 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 263 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 263")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
else
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
			
end
else
	yy_position := yy_position + 2
--|#line 276 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 276")
end
in_buffer.append_character ('\')
end
else
if yy_act = 62 then
	yy_position := yy_position + 2
--|#line 278 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 278")
end
in_buffer.append_character ('"')
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 280 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 280")
end

				in_buffer.append_string (text)
	
end
end
end
end
else
if yy_act <= 74 then
if yy_act <= 69 then
if yy_act <= 66 then
if yy_act <= 65 then
if yy_act = 64 then
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
	
else
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
			
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 314 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 314")
end
in_buffer.append_string (text)
end
else
if yy_act <= 68 then
if yy_act = 67 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 316 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 316")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
else
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
			
end
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
if yy_act <= 72 then
if yy_act <= 71 then
if yy_act = 70 then
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
if yy_act = 73 then
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
if yy_act <= 79 then
if yy_act <= 77 then
if yy_act <= 76 then
if yy_act = 75 then
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
if yy_act = 78 then
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
if yy_act <= 82 then
if yy_act <= 81 then
if yy_act = 80 then
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
if yy_act = 83 then
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
			   23,   23,   23,   23,   24,   25,   26,   27,   28,   29,
			   30,   30,   30,   30,   31,   30,   30,   32,   30,   30,
			   30,   33,   34,   30,   30,   35,   30,   30,   30,   30,
			   36,    8,   37,   38,    8,   39,   40,   40,   40,   40,
			   41,   40,   40,   42,   40,   40,   40,   43,   40,   40,
			   44,   40,   40,   40,   40,   45,   46,    8,    8,    8,
			    8,    8,    8,    8,    8,    8,   48,   77,   58,   49,
			   59,   48,   50,   58,   49,   59,   60,   50,   60,   65,

			   66,   70,   78,   71,   71,   71,   71,   71,   81,  104,
			   84,   84,   77,   82,   82,   84,   84,   72,   79,   79,
			   79,   79,   79,   88,   94,   92,  132,  101,   78,  101,
			  264,   96,  100,   81,   51,   88,   88,   83,   60,   51,
			   60,   67,   88,   72,   80,   88,   88,   88,   88,   95,
			  258,   93,  132,   84,  105,   88,   97,  100,   88,   88,
			   88,  100,   83,  100,   52,   53,   54,   55,   56,   52,
			   53,   54,   55,   56,   86,   86,   86,   86,   86,   87,
			  128,  128,  128,  128,  128,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,

			   86,   86,   86,   86,   86,   90,  107,  267,  267,   86,
			   88,   88,   89,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   89,   88,   88,   88,   88,
			   91,  107,   88,  106,  106,  106,  109,  109,  138,  138,
			  138,  138,  138,  203,  203,   88,   99,   99,  100,   99,
			   99,  100,  102,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,   99,  100,   99,   99,   99,

			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,  100,  118,  100,  133,  139,  119,   70,  254,  129,
			  129,  129,  129,  129,  246,  120,  120,  120,  120,  120,
			  130,  141,  130,   72,  147,  131,  131,  131,  131,  131,
			  133,  139,  140,  140,  140,  140,  140,  149,  108,  108,
			  108,  151,  149,  101,  153,  101,  141,  121,  230,   72,
			  147,  126,  100,  126,  225,  225,  122,  131,  131,  131,
			  131,  131,  123,  149,  124,   88,  125,  151,  150,  153,

			  155,  253,  226,  110,  110,  110,  114,  114,   88,  114,
			  114,  114,  116,  114,  114,  115,  114,  114,  114,  114,
			  114,  114,  114,  114,  117,  117,  117,  117,  117,  114,
			  114,  114,  114,  114,  114,  117,  117,  117,  117,  117,
			  117,  117,  117,  117,  117,  117,  117,  117,  117,  117,
			  117,  117,  117,  117,  117,  114,  114,  114,  114,  117,
			  117,  117,  117,  117,  117,  117,  117,  117,  117,  117,
			  117,  117,  117,  117,  117,  117,  117,  117,  117,  117,
			  114,  114,  114,  114,  114,  114,  114,  114,  114,  114,
			  114,   79,   79,   79,   79,   79,  147,   84,   84,  151,

			  100,  100,  153,  145,  134,  146,  146,  146,  146,  146,
			  142,  135,  216,   88,  179,   88,  180,  235,  235,  136,
			  137,  216,  148,   88,  204,  152,   88,  154,   88,  186,
			  134,  128,  128,  128,  128,  128,   88,  135,  143,  179,
			  169,  193,  180,   88,  136,  177,  137,  294,  170,  171,
			  171,  171,  171,  171,  186,   88,   88,  131,  131,  131,
			  131,  131,  166,   88,   88,  187,  193,  187,   88,  231,
			  202,  177,  106,  106,  106,  188,   88,   88,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   99,   99,

			  189,   99,   99,  100,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,  156,  156,  156,  156,
			  156,   99,   99,   99,   99,   99,   99,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,   99,  100,   99,
			   99,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,  100,  190,  192,  100,  197,   70,  100,
			  178,  178,  178,  178,  178,  181,  181,  181,  181,  181,

			  191,  100,  195,  199,   72,  182,  182,  182,  182,  182,
			  190,  145,  197,  145,  145,  145,  145,  145,  237,   80,
			  193,   80,  176,  157,  158,  159,  160,  161,  195,  199,
			   72,   80,  145,   88,  146,  146,  146,  146,  146,  175,
			  209,  245,  245,  237,  199,  194,   88,  138,  138,  138,
			  138,  138,  210,  195,  213,  106,  106,  106,  162,  162,
			  162,  163,  163,  163,  183,  100,  209,  184,   88,  197,
			  200,  100,  185,   88,  109,  109,  174,  173,  210,  196,
			  213,   88,  100,   88,  218,  100,   88,  172,  100,  168,
			  183,  169,  167,  184,  198,  220,   88,  185,  100,  170,

			  171,  171,  171,  171,  171,  211,  211,  211,  211,  211,
			  218,  201,  201,  201,  201,  201,  212,  212,  212,  212,
			  212,  220,  201,  201,  201,  201,  201,  205,  242,  205,
			  166,  164,  206,  206,  206,  206,  206,  106,  106,  106,
			  255,  255,  255,  108,  108,  108,  112,  201,  201,  201,
			  201,  201,  201,  242,  110,  110,  110,  106,  106,  106,
			  106,  106,  106,  207,   70,  100,  208,  208,  208,  208,
			  208,  181,  181,  181,  181,  181,  215,  215,  215,  215,
			   72,  144,  220,  218,  134,  182,  182,  182,  182,  182,
			  214,  214,  214,  214,  214,  222,  227,  232,  134,   88,

			  142,  247,  251,  127,  222,  135,   72,   88,  221,  219,
			  134,  126,   88,   88,  206,  206,  206,  206,  206,  115,
			   88,  222,  227,  232,  134,   63,   88,  247,  251,  232,
			  223,  135,  224,  224,  224,  224,  224,  206,  206,  206,
			  206,  206,   61,  224,  224,  224,  224,  224,   70,   88,
			  208,  208,  208,  208,  208,  233,  112,  211,  211,  211,
			  211,  211,   88,  100,   72,   75,   74,   73,  224,  224,
			  224,  224,  224,  224,   76,   69,  212,  212,  212,  212,
			  212,  228,  228,  228,  228,  228,  239,  242,  239,   68,
			   72,  229,  229,  229,  229,  229,  240,   63,   61,   88,

			   76,  185,  236,  236,  236,  236,  236,  238,  238,  238,
			  238,  238,  243,  248,  248,  248,  248,  248,  294,  294,
			  294,  241,  250,  250,  250,  250,  185,  234,  234,  234,
			  234,  234,  249,  249,  249,  249,  249,  294,  234,  234,
			  234,  234,  234,  256,  256,  256,  256,  256,  275,  275,
			  275,  275,  251,  257,  257,  257,  257,  257,  294,  294,
			  294,   88,  294,  234,  234,  234,  234,  234,  234,  244,
			  244,  244,  244,  244,   88,  294,  294,  294,  252,  294,
			  244,  244,  244,  244,  244,  259,  259,  259,  259,  259,
			  260,  260,  260,  260,  260,  261,  262,  261,  241,  241,

			  241,  241,  241,  294,  294,  244,  244,  244,  244,  244,
			  244,  265,  265,  265,  265,  265,  266,  266,  266,  266,
			  266,  268,  268,  268,  268,  268,  261,  294,  261,  294,
			  263,  266,  266,  266,  266,  266,  269,  269,  269,  269,
			  269,  270,  270,  270,  270,  270,  271,  294,  271,  263,
			  263,  263,  263,  263,  294,  294,  272,  283,  283,  283,
			  283,  263,  274,  274,  274,  274,  274,  276,  276,  276,
			  276,  276,  277,  277,  277,  277,  277,  279,  294,  279,
			  294,  273,  278,  278,  278,  278,  278,  280,  273,  273,
			  273,  273,  273,  282,  282,  282,  282,  282,  284,  284,

			  284,  284,  284,  285,  285,  285,  285,  285,  287,  288,
			  287,  294,  281,  286,  286,  286,  286,  286,  281,  281,
			  281,  281,  281,  290,  290,  290,  290,  290,  291,  291,
			  291,  291,  291,  292,  292,  292,  292,  292,  294,  287,
			  294,  287,  294,  289,  291,  291,  291,  291,  291,  293,
			  293,  293,  293,  293,  289,  289,  289,  289,  289,   76,
			   76,  294,  294,  294,   76,   76,   76,   76,  294,  294,
			   76,   76,  294,  294,  289,   47,   47,   47,   47,   47,
			   47,   47,   47,   47,   47,   47,   47,   47,   47,   47,
			   47,   47,   47,   47,   47,   47,   47,   57,   57,   57,

			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   62,
			  294,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,  294,   62,   62,   62,   62,
			   62,   64,  294,   64,   64,   64,   64,   64,   64,   64,
			   64,   64,   64,   64,   64,   64,   64,   64,   64,   64,
			   64,   64,   64,   85,   85,   85,   85,   85,   85,  294,
			  294,  294,   85,   85,   85,   85,  294,  294,   85,   85,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,

			   99,  294,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,  294,   99,   99,   99,
			   99,   99,  111,  111,  111,  111,  111,  111,  111,  111,
			  111,  111,  111,  111,  111,  111,  111,  111,  111,  111,
			  111,  111,  294,  111,  113,  113,  113,  113,  113,  113,
			  113,  113,  113,  113,  113,  113,  113,  113,  113,  113,
			  113,  113,  113,  113,  114,  294,  114,  114,  114,  114,
			  114,  114,  114,  114,  114,  114,  114,  114,  114,  114,
			  114,  114,  114,  114,  114,  114,   68,   68,   68,   68,
			   68,   68,   68,   68,   68,   68,   68,   68,   68,   68,

			   68,   68,   68,   68,   68,   68,   68,   68,   84,   84,
			   84,   84,   84,   84,   84,  294,  294,   84,   84,   84,
			   84,  294,  294,   84,   84,  165,  165,  294,  165,  294,
			  165,  165,  165,  165,  294,  217,  165,  165,  217,  217,
			  217,  217,  294,  294,  294,  217,  217,  217,  217,  294,
			  294,  217,  217,  192,  192,  294,  192,  192,  192,  192,
			  192,  192,  192,  192,  294,  192,  192,  192,  192,  192,
			  192,  192,  192,  192,  192,  216,  294,  294,  216,  216,
			  216,  216,  294,  294,  294,  216,  216,  216,  216,  294,
			  216,  216,  216,    7,  294,  294,  294,  294,  294,  294,

			  294,  294,  294,  294,  294,  294,  294,  294,  294,  294,
			  294,  294,  294,  294,  294,  294,  294,  294,  294,  294,
			  294,  294,  294,  294,  294,  294,  294,  294,  294,  294,
			  294,  294,  294,  294,  294,  294,  294,  294,  294,  294,
			  294,  294,  294,  294,  294,  294,  294,  294,  294,  294,
			  294,  294,  294,  294,  294,  294,  294,  294,  294,  294,
			  294,  294,  294,  294,  294,  294,  294,  294,  294,  294,
			  294,  294,  294,  294,  294,  294,  294,  294,  294, yy_Dummy>>)
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
			    1,    1,    1,    1,    1,    1,    3,   31,    5,    3,
			    5,    4,    3,    6,    4,    6,    9,    4,    9,   14,

			   14,   23,   32,   23,   23,   23,   23,   23,   34,   51,
			   36,   36,   31,   35,   35,   36,   36,   23,   33,   33,
			   33,   33,   33,   40,   43,   42,   77,   48,   32,   48,
			  259,   44,   53,   34,    3,   43,   40,   35,   60,    4,
			   60,   14,   42,   23,   33,   44,   88,  200,   43,   43,
			  254,   42,   77,   36,   51,   42,   44,  158,   44,   88,
			  200,   52,   35,   55,    3,    3,    3,    3,    3,    4,
			    4,    4,    4,    4,   39,   39,   39,   39,   39,   39,
			   70,   70,   70,   70,   70,   39,   39,   39,   39,   39,
			   39,   39,   39,   39,   39,   39,   39,   39,   39,   39,

			   39,   39,   39,   39,   39,   41,   53,  264,  264,   39,
			   39,   39,   39,   39,   39,   39,   39,   39,   39,   39,
			   39,   39,   39,   39,   39,   39,   39,   39,   39,   39,
			   41,  158,   41,   52,   52,   52,   55,   55,   80,   80,
			   80,   80,   80,  309,  309,   41,   50,   50,  253,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   54,   50,   50,   50,

			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   56,   67,  102,   78,   81,   67,   71,  245,   71,
			   71,   71,   71,   71,  236,   67,   67,   67,   67,   67,
			   72,   83,   72,   71,   90,   72,   72,   72,   72,   72,
			   78,   81,   82,   82,   82,   82,   82,   92,   54,   54,
			   54,   94,   93,  101,   96,  101,   83,   67,  216,   71,
			   90,  126,  244,  126,  312,  312,   67,  130,  130,  130,
			  130,  130,   67,   92,   67,   93,   67,   94,   93,   96,

			  102,  244,  207,   56,   56,   56,   65,   65,   93,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   79,   79,   79,   79,   79,   91,   85,   85,   95,

			  107,  202,   97,   89,   79,   89,   89,   89,   89,   89,
			   85,   79,  191,   97,  132,   91,  133,  314,  314,   79,
			   79,  217,   91,   95,  166,   95,   97,   97,   91,  139,
			   79,  128,  128,  128,  128,  128,   95,   79,   85,  132,
			  120,  147,  133,   89,   79,  128,   79,   86,  120,  120,
			  120,  120,  120,  120,  139,  219,   89,  131,  131,  131,
			  131,  131,  165,  223,  252,  140,  147,  140,  219,  217,
			  156,  128,  107,  107,  107,  140,  223,  252,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,  103,  103,

			  140,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  106,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  108,  141,  144,  109,  151,  129,  110,
			  129,  129,  129,  129,  129,  135,  135,  135,  135,  135,

			  142,  160,  149,  153,  129,  137,  137,  137,  137,  137,
			  141,  145,  151,  145,  145,  145,  145,  145,  227,  134,
			  148,  135,  125,  106,  106,  106,  106,  106,  149,  153,
			  129,  137,  146,  148,  146,  146,  146,  146,  146,  124,
			  179,  315,  315,  227,  154,  148,  148,  138,  138,  138,
			  138,  138,  180,  150,  186,  108,  108,  108,  109,  109,
			  109,  110,  110,  110,  138,  157,  179,  138,  154,  152,
			  154,  159,  138,  150,  160,  160,  123,  122,  180,  150,
			  186,  154,  161,  152,  193,  162,  150,  121,  163,  119,
			  138,  171,  118,  138,  152,  195,  152,  138,  155,  171,

			  171,  171,  171,  171,  171,  183,  183,  183,  183,  183,
			  193,  155,  155,  155,  155,  155,  184,  184,  184,  184,
			  184,  195,  155,  155,  155,  155,  155,  177,  232,  177,
			  117,  116,  177,  177,  177,  177,  177,  157,  157,  157,
			  246,  246,  246,  159,  159,  159,  111,  155,  155,  155,
			  155,  155,  155,  232,  161,  161,  161,  162,  162,  162,
			  163,  163,  163,  178,  178,   99,  178,  178,  178,  178,
			  178,  181,  181,  181,  181,  181,  188,  188,  188,  188,
			  178,   87,  196,  194,  181,  182,  182,  182,  182,  182,
			  187,  187,  187,  187,  187,  197,  210,  220,  182,  196,

			   84,  237,  242,   69,  198,  182,  178,  194,  196,  194,
			  181,   68,  196,  198,  205,  205,  205,  205,  205,   64,
			  194,  197,  210,  220,  182,   62,  198,  237,  242,  221,
			  198,  182,  201,  201,  201,  201,  201,  206,  206,  206,
			  206,  206,   61,  201,  201,  201,  201,  201,  208,  221,
			  208,  208,  208,  208,  208,  221,   57,  211,  211,  211,
			  211,  211,  221,   47,  208,   29,   28,   26,  201,  201,
			  201,  201,  201,  201,  211,   21,  212,  212,  212,  212,
			  212,  214,  214,  214,  214,  214,  229,  233,  229,   20,
			  208,  215,  215,  215,  215,  215,  229,   12,   10,  233,

			  211,  212,  226,  226,  226,  226,  226,  228,  228,  228,
			  228,  228,  233,  238,  238,  238,  238,  238,    7,    0,
			    0,  229,  240,  240,  240,  240,  212,  224,  224,  224,
			  224,  224,  239,  239,  239,  239,  239,    0,  224,  224,
			  224,  224,  224,  249,  249,  249,  249,  249,  272,  272,
			  272,  272,  243,  250,  250,  250,  250,  250,    0,    0,
			    0,  243,    0,  224,  224,  224,  224,  224,  224,  234,
			  234,  234,  234,  234,  243,    0,    0,    0,  243,    0,
			  234,  234,  234,  234,  234,  255,  255,  255,  255,  255,
			  256,  256,  256,  256,  256,  257,  257,  257,  260,  260,

			  260,  260,  260,    0,    0,  234,  234,  234,  234,  234,
			  234,  261,  261,  261,  261,  261,  262,  262,  262,  262,
			  262,  265,  265,  265,  265,  265,  266,    0,  266,    0,
			  257,  266,  266,  266,  266,  266,  267,  267,  267,  267,
			  267,  268,  268,  268,  268,  268,  269,    0,  269,  270,
			  270,  270,  270,  270,    0,    0,  269,  280,  280,  280,
			  280,  266,  271,  271,  271,  271,  271,  274,  274,  274,
			  274,  274,  275,  275,  275,  275,  275,  277,    0,  277,
			    0,  269,  276,  276,  276,  276,  276,  277,  278,  278,
			  278,  278,  278,  279,  279,  279,  279,  279,  282,  282,

			  282,  282,  282,  283,  283,  283,  283,  283,  285,  285,
			  285,    0,  277,  284,  284,  284,  284,  284,  286,  286,
			  286,  286,  286,  287,  287,  287,  287,  287,  288,  288,
			  288,  288,  288,  290,  290,  290,  290,  290,    0,  291,
			    0,  291,    0,  285,  291,  291,  291,  291,  291,  292,
			  292,  292,  292,  292,  293,  293,  293,  293,  293,  299,
			  299,    0,    0,    0,  299,  299,  299,  299,    0,    0,
			  299,  299,    0,    0,  291,  295,  295,  295,  295,  295,
			  295,  295,  295,  295,  295,  295,  295,  295,  295,  295,
			  295,  295,  295,  295,  295,  295,  295,  296,  296,  296,

			  296,  296,  296,  296,  296,  296,  296,  296,  296,  296,
			  296,  296,  296,  296,  296,  296,  296,  296,  296,  297,
			    0,  297,  297,  297,  297,  297,  297,  297,  297,  297,
			  297,  297,  297,  297,  297,    0,  297,  297,  297,  297,
			  297,  298,    0,  298,  298,  298,  298,  298,  298,  298,
			  298,  298,  298,  298,  298,  298,  298,  298,  298,  298,
			  298,  298,  298,  300,  300,  300,  300,  300,  300,    0,
			    0,    0,  300,  300,  300,  300,    0,    0,  300,  300,
			  301,  301,  301,  301,  301,  301,  301,  301,  301,  301,
			  301,  301,  301,  301,  301,  301,  301,  301,  301,  301,

			  302,    0,  302,  302,  302,  302,  302,  302,  302,  302,
			  302,  302,  302,  302,  302,  302,    0,  302,  302,  302,
			  302,  302,  303,  303,  303,  303,  303,  303,  303,  303,
			  303,  303,  303,  303,  303,  303,  303,  303,  303,  303,
			  303,  303,    0,  303,  304,  304,  304,  304,  304,  304,
			  304,  304,  304,  304,  304,  304,  304,  304,  304,  304,
			  304,  304,  304,  304,  305,    0,  305,  305,  305,  305,
			  305,  305,  305,  305,  305,  305,  305,  305,  305,  305,
			  305,  305,  305,  305,  305,  305,  306,  306,  306,  306,
			  306,  306,  306,  306,  306,  306,  306,  306,  306,  306,

			  306,  306,  306,  306,  306,  306,  306,  306,  307,  307,
			  307,  307,  307,  307,  307,    0,    0,  307,  307,  307,
			  307,    0,    0,  307,  307,  308,  308,    0,  308,    0,
			  308,  308,  308,  308,    0,  310,  308,  308,  310,  310,
			  310,  310,    0,    0,    0,  310,  310,  310,  310,    0,
			    0,  310,  310,  311,  311,    0,  311,  311,  311,  311,
			  311,  311,  311,  311,    0,  311,  311,  311,  311,  311,
			  311,  311,  311,  311,  311,  313,    0,    0,  313,  313,
			  313,  313,    0,    0,    0,  313,  313,  313,  313,    0,
			  313,  313,  313,  294,  294,  294,  294,  294,  294,  294,

			  294,  294,  294,  294,  294,  294,  294,  294,  294,  294,
			  294,  294,  294,  294,  294,  294,  294,  294,  294,  294,
			  294,  294,  294,  294,  294,  294,  294,  294,  294,  294,
			  294,  294,  294,  294,  294,  294,  294,  294,  294,  294,
			  294,  294,  294,  294,  294,  294,  294,  294,  294,  294,
			  294,  294,  294,  294,  294,  294,  294,  294,  294,  294,
			  294,  294,  294,  294,  294,  294,  294,  294,  294,  294,
			  294,  294,  294,  294,  294,  294,  294,  294,  294, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   83,   88,   13,   18, 1018, 1593,   94,
			  995, 1593,  991, 1593,   90, 1593, 1593, 1593, 1593, 1593,
			  973,  958, 1593,   84, 1593, 1593,  940, 1593,  939,  936,
			    0,   57,   62,   99,   62,   94,   99, 1593, 1593,  155,
			   66,  175,   85,   78,   88,    0, 1593,  957,  125, 1593,
			  245,  103,  155,  126,  290,  157,  325,  879,    0, 1593,
			  136,  939,  919, 1593,  909,  405,    0,  326,  908,  886,
			  161,  320,  336, 1593, 1593, 1593,    0,   88,  300,  472,
			  219,  302,  343,  305,  876,  486,  523,  863,   89,  486,
			  316,  458,  333,  338,  338,  466,  328,  456,    0,  859,

			 1593,  371,  327,  597, 1593, 1593,  642,  494,  677,  680,
			  683,  769, 1593,    0, 1593, 1593,  758,  805,  782,  779,
			  530,  777,  767,  766,  729,  712,  379, 1593,  512,  671,
			  368,  538,  470,  479,  674,  676,    0,  686,  728,  486,
			  551,  651,  676, 1593,  667,  694,  715,  497,  676,  665,
			  716,  644,  726,  670,  711,  792,  545,  759,  151,  765,
			  695,  776,  779,  782,    0,  537,  514, 1593, 1593, 1593,
			 1593,  781, 1593, 1593, 1593, 1593, 1593,  813,  847,  707,
			  712,  852,  866,  786,  797,    0,  706,  871,  857,    0,
			    0,  508,    0,  751,  850,  755,  842,  847,  856,    0,

			   90,  913,  495,    0, 1593,  895,  918,  383,  931,    0,
			  859,  938,  957,    0,  962,  972,  326,  517,    0,  498,
			  860,  892,    0,  506, 1008,    0,  983,  673,  988,  972,
			 1593, 1593,  783,  942, 1050,    0,  328,  853,  994, 1013,
			 1003, 1593,  854, 1004,  376,  313,  821,    0, 1593, 1024,
			 1034,    0,  507,  242,  140, 1066, 1071, 1081, 1593,   85,
			 1079, 1092, 1097, 1593,  188, 1102, 1112, 1117, 1122, 1132,
			 1130, 1143, 1029, 1593, 1148, 1153, 1163, 1163, 1169, 1174,
			 1138, 1593, 1179, 1184, 1194, 1194, 1199, 1204, 1209, 1593,
			 1214, 1225, 1230, 1235, 1593, 1274, 1296, 1318, 1340, 1251,

			 1359, 1379, 1399, 1421, 1443, 1463, 1485, 1504, 1517,  235,
			 1532, 1552,  376, 1572,  509,  733, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  294,    1,  295,  295,  296,  296,  294,  294,  294,
			  294,  294,  297,  294,  298,  294,  294,  294,  294,  294,
			  294,  294,  294,  294,  294,  294,  294,  294,  294,  294,
			  299,  299,  299,  299,  299,  299,  300,  294,  294,  294,
			   39,   39,   39,   39,   39,  301,  294,  302,  294,  294,
			  294,  294,  302,  302,  302,  302,  302,  303,  304,  294,
			  294,  294,  297,  294,  305,  294,  305,  305,  306,  294,
			  294,  294,  294,  294,  294,  294,  299,  299,  299,  299,
			  299,  299,  299,  299,  307,  300,   39,  294,   39,   39,
			   86,   39,   86,   39,   86,   39,   86,   39,  301,  302,

			  294,  294,  302,  294,  294,  294,  302,  302,  302,  302,
			  302,  303,  294,  304,  294,  294,  294,  308,  294,  294,
			  294,  294,  294,  294,  294,  294,  294,  294,  294,  294,
			  294,  294,  299,  299,  299,  299,  299,  299,  299,  299,
			  299,  299,  294,  294,  294,  294,   86,   86,   39,   86,
			   39,   86,   39,   86,   39,  302,  103,  302,  302,  302,
			  302,  302,  302,  302,  309,  308,  294,  294,  294,  294,
			  294,  294,  294,  294,  294,  294,  294,  294,  294,  299,
			  299,  299,  299,  299,  299,  299,  299,  294,  294,  299,
			  299,  310,  311,   86,   39,   86,   39,   86,   39,   86,

			   39,  155,  302,  312,  294,  294,  294,  294,  294,  299,
			  299,  138,  299,  299,  294,  294,  313,  310,   86,   39,
			   86,   39,   86,   39,  155,  314,  294,  299,  294,  294,
			  294,  294,   86,   39,  155,  315,  294,  299,  294,  294,
			  294,  294,   86,   39,  302,  294,  294,  299,  294,  294,
			  294,   86,   39,  302,  294,  294,  294,  294,  294,  294,
			  294,  294,  294,  294,  294,  294,  294,  294,  294,  294,
			  294,  294,  294,  294,  294,  294,  294,  294,  294,  294,
			  294,  294,  294,  294,  294,  294,  294,  294,  294,  294,
			  294,  294,  294,  294,    0,  294,  294,  294,  294,  294,

			  294,  294,  294,  294,  294,  294,  294,  294,  294,  294,
			  294,  294,  294,  294,  294,  294, yy_Dummy>>)
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
			   73,   74,   61,   75,   76,   77,    1,    1,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   79,   79,   79,   79,   79,   79,
			   79,   79,   79,   79,   79,   79,   79,   79,   79,   79,
			   80,   80,   80,   80,   80,   80,   80,   80,   80,   80,
			   80,   80,   80,   80,   80,   80,   80,   80,   80,   80,
			   80,   80,   80,   80,   80,   80,   80,   80,   80,   80,
			   80,   80,    1,    1,   81,   81,   81,   81,   81,   81,

			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   82,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83,
			   84,   85,   85,   85,   85,   85,   85,   85,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_meta_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    2,    3,    1,    1,    1,    1,    1,
			    1,    4,    5,    1,    1,    1,    6,    7,    1,    8,
			    8,    8,    8,    9,   10,   11,    1,    1,   12,    1,
			    8,    8,    8,    8,    8,   13,   14,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   13,   15,   16,
			    1,   17,   18,    1,   19,    8,    8,    8,    8,    8,
			    8,   13,   13,   13,   13,   13,   13,   13,   13,   13,
			   13,   13,   13,   13,   20,   21,    1,   22,    1,    1,
			    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,   85,   83,    1,
			    2,   14,   60,   17,   83,   15,   16,    7,    6,   12,
			    5,   10,    8,   55,   13,   11,   26,   23,   27,   19,
			   50,   50,   50,   49,   50,   50,   21,   22,    9,   51,
			   51,   51,   51,   51,   51,   52,   20,   66,   67,   68,
			   66,   69,   66,   66,   66,   66,   66,   84,   53,   54,
			    1,    2,   60,   59,   81,   81,   81,   81,    3,   28,
			    0,   55,    0,   25,   24,   18,   50,   50,   50,   50,
			   48,   50,   50,   50,    0,    0,   51,    0,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   52,   66,

			   68,   67,   66,   66,   62,   61,   63,   66,   66,   66,
			   66,    0,   54,   53,   81,   70,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,    4,   29,   57,   55,
			    0,   56,   50,   50,   49,   49,   47,   49,   50,   50,
			   44,   50,    0,   37,    0,   38,   38,   51,   51,   51,
			   51,   51,   51,   51,   51,   66,   66,   66,   66,   66,
			   66,   66,   66,   66,    0,    0,    0,   77,   75,   78,
			   82,   82,   76,   74,   71,   72,   73,    0,   55,   50,
			   50,   50,   50,   48,   48,   48,   50,    0,    0,   44,
			   30,    0,   34,   51,   51,   51,   51,   51,   51,   30,

			   30,   66,   64,    0,   79,    0,   58,    0,   55,   31,
			   50,   50,   50,   33,    0,    0,    0,    0,   31,   31,
			   51,   51,   33,   33,   66,    0,    0,   50,    0,   43,
			   36,   35,   51,   51,   66,    0,   46,   50,    0,    0,
			    0,   43,   51,   51,   66,    0,    0,   32,   44,    0,
			    0,   32,   32,   65,    0,    0,    0,   42,   80,   45,
			    0,    0,    0,   42,    0,    0,   42,    0,    0,   41,
			    0,    0,    0,   41,    0,    0,    0,   40,    0,    0,
			    0,   40,    0,    0,    0,   39,    0,    0,    0,   39,
			    0,   39,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 1593
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 294
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 295
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

	yyNb_rules: INTEGER is 84
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 85
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
