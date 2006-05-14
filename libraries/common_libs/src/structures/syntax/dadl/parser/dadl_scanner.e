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
--|#line 55 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 55")
end
-- Ignore separators
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 56 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 56")
end
in_lineno := in_lineno + text_count
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 61 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 61")
end
-- Ignore comments
end
else
if yy_act <= 5 then
if yy_act = 4 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 62 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 62")
end
in_lineno := in_lineno + 1
else
	yy_position := yy_position + 1
--|#line 66 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 66")
end
last_token := Minus_code
end
else
	yy_position := yy_position + 1
--|#line 67 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 67")
end
last_token := Plus_code
end
end
else
if yy_act <= 9 then
if yy_act <= 8 then
if yy_act = 7 then
	yy_position := yy_position + 1
--|#line 68 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 68")
end
last_token := Star_code
else
	yy_position := yy_position + 1
--|#line 69 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 69")
end
last_token := Slash_code
end
else
	yy_position := yy_position + 1
--|#line 70 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 70")
end
last_token := Caret_code
end
else
if yy_act = 10 then
	yy_position := yy_position + 1
--|#line 71 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 71")
end
last_token := Dot_code
else
	yy_position := yy_position + 1
--|#line 72 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 72")
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
--|#line 73 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 73")
end
last_token := Comma_code
else
	yy_position := yy_position + 1
--|#line 74 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 74")
end
last_token := Colon_code
end
else
	yy_position := yy_position + 1
--|#line 75 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 75")
end
last_token := Exclamation_code
end
else
if yy_act = 15 then
	yy_position := yy_position + 1
--|#line 76 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 76")
end
last_token := Left_parenthesis_code
else
	yy_position := yy_position + 1
--|#line 77 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 77")
end
last_token := Right_parenthesis_code
end
end
else
if yy_act <= 19 then
if yy_act <= 18 then
if yy_act = 17 then
	yy_position := yy_position + 1
--|#line 78 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 78")
end
last_token := Dollar_code
else
	yy_position := yy_position + 2
--|#line 79 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 79")
end
last_token := SYM_DT_UNKNOWN
end
else
	yy_position := yy_position + 1
--|#line 80 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 80")
end
last_token := Question_mark_code
end
else
if yy_act = 20 then
	yy_position := yy_position + 1
--|#line 82 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 82")
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
--|#line 92 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 92")
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
--|#line 93 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 93")
end
last_token := Right_bracket_code
else
	yy_position := yy_position + 1
--|#line 95 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 95")
end
last_token := SYM_EQ
end
else
	yy_position := yy_position + 2
--|#line 97 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 97")
end
last_token := SYM_GE
end
else
if yy_act <= 26 then
if yy_act = 25 then
	yy_position := yy_position + 2
--|#line 98 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 98")
end
last_token := SYM_LE
else
	yy_position := yy_position + 1
--|#line 100 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 100")
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
--|#line 110 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 110")
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
--|#line 118 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 118")
end
last_token := SYM_ELLIPSIS
else
	yy_position := yy_position + 3
--|#line 119 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 119")
end
last_token := SYM_LIST_CONTINUE
end
else
	yy_position := yy_position + 4
--|#line 123 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 123")
end
last_token := SYM_TRUE
end
else
if yy_act = 31 then
	yy_position := yy_position + 5
--|#line 125 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 125")
end
last_token := SYM_FALSE
else
	yy_position := yy_position + 8
--|#line 127 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 127")
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
--|#line 130 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 130")
end
last_token := SYM_QUERY_FUNC
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 133 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 133")
end

	last_token := V_URI
	last_string_value := text

end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 139 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 139")
end

					last_token := V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 36 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 144 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 144")
end

					last_token := ERR_V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 149 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 149")
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
--|#line 155 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 155")
end

					last_token := V_LOCAL_CODE
					last_string_value := text
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 162 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 162")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 163 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 163")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
if yy_act = 41 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 164 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 164")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 171 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 171")
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
--|#line 172 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 172")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 173 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 173")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
else
	yy_position := yy_position + 10
--|#line 180 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 180")
end

-- [0-9]{4} { -- can't handle year only, since it will be confused with plain integer
				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
else
if yy_act <= 47 then
if yy_act = 46 then
	yy_position := yy_position + 7
--|#line 181 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 181")
end

-- [0-9]{4} { -- can't handle year only, since it will be confused with plain integer
				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 189 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 189")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 190 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 190")
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
--|#line 191 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 191")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 197 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 197")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 202 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 202")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
end
else
if yy_act = 52 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 209 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 209")
end
				-- beginning of CADL block
				in_buffer.append_string (text)
				set_start_condition (IN_CADL_BLOCK)
				cadl_depth := 1
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 214 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 214")
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
--|#line 218 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 218")
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
--|#line 234 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 234")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 235 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 235")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
else
if yy_act = 57 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 242 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 242")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 243 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 243")
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
--|#line 250 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 250")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 255 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 255")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
end
else
	yy_position := yy_position + 2
--|#line 261 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 261")
end
in_buffer.append_character ('\')
end
else
if yy_act = 62 then
	yy_position := yy_position + 2
--|#line 263 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 263")
end
in_buffer.append_character ('"')
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 265 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 265")
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
--|#line 280 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 280")
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
--|#line 295 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 295")
end
in_buffer.append_string (text)
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 297 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 297")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
else
if yy_act = 67 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 302 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 302")
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
--|#line 313 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 313")
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
--|#line 321 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 321")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
	yy_position := yy_position + 4
--|#line 322 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 322")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
else
	yy_position := yy_position + 4
--|#line 323 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 323")
end
last_token := V_CHARACTER; last_character_value := '%R'
end
else
if yy_act = 72 then
	yy_position := yy_position + 4
--|#line 324 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 324")
end
last_token := V_CHARACTER; last_character_value := '%T'
else
	yy_position := yy_position + 4
--|#line 325 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 325")
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
--|#line 326 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 326")
end
last_token := V_CHARACTER; last_character_value := '%''
else
	yy_position := yy_position + 4
--|#line 327 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 327")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
else
	yy_position := yy_position + 4
--|#line 328 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 328")
end
last_token := V_CHARACTER; last_character_value := '"'
end
else
if yy_act = 77 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 329 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 329")
end

						code_ := text_substring (4, text_count - 1).to_integer
						last_token := V_CHARACTER
						last_character_value := code_.to_character
				
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 334 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 334")
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
--|#line 344 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 344")
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
--|#line 355 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 355")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 356 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 356")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 82 then
	yy_position := yy_position + 1
--|#line 360 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 360")
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
			   44,   40,   40,   40,   40,   45,   46,    8,   48,   48,
			   72,   49,   49,   73,   50,   50,   53,   53,   54,   54,
			   55,   83,   55,   60,   61,   65,   76,   66,   66,   66,

			   66,   66,   99,   87,   83,   72,   77,   77,   96,   73,
			   96,   67,   74,   74,   74,   74,   74,   79,   79,   85,
			   83,   76,   79,   79,  247,   89,   51,   51,  122,   88,
			   78,   91,   55,   83,   55,   62,   83,   67,   75,  118,
			  118,  118,  118,  118,   86,   83,   83,  100,  241,   83,
			   90,   96,   95,   96,  122,   78,   92,   95,   83,   83,
			   79,   81,   81,   81,   81,   81,   82,  123,  129,  116,
			  131,  116,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,  237,  123,  129,  131,   81,   83,   83,   84,

			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83,
			   83,   83,   84,   83,   83,   83,   83,   94,   94,  145,
			   94,   94,   95,   97,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   94,  229,   94,   94,
			   94,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   94,   94,   94,  104,  104,  213,  104,  104,  104,

			  106,  104,  104,  105,  104,  104,  104,  104,  104,  104,
			  104,  104,  128,  128,  128,  128,  128,  104,  104,  104,
			  104,  104,  104,   65,   83,  119,  119,  119,  119,  119,
			  130,  130,  130,  130,  130,   79,   79,   83,  137,   67,
			  139,  250,  250,  104,  104,  104,  104,  120,  132,  120,
			  209,  141,  121,  121,  121,  121,  121,  135,  143,  136,
			  136,  136,  136,  136,  137,   67,  139,  139,  104,  104,
			  104,  108,  137,   95,  162,  109,  133,  141,  186,  186,
			  163,  141,  173,  143,  110,  110,  110,  110,  110,  143,
			   83,   83,  169,  140,  238,  238,  238,   83,  138,  162,

			   83,  199,   83,   83,   83,   83,  163,  142,  173,  176,
			   83,  152,  187,   83,  144,   83,  111,  169,   83,  153,
			  154,  154,  154,  154,  154,  112,  121,  121,  121,  121,
			  121,  113,  178,  114,  176,  115,   74,   74,   74,   74,
			   74,  118,  118,  118,  118,  118,  149,   95,  182,  124,
			  121,  121,  121,  121,  121,  160,  125,   65,  178,  161,
			  161,  161,  161,  161,  126,  127,  236,  164,  164,  164,
			  164,  164,  176,   67,  182,  124,  165,  165,  165,  165,
			  165,  160,  125,   83,  170,   83,  170,   83,  175,  126,
			  180,  127,  277,   75,  171,  180,   83,  177,   83,   67,

			   83,  135,   75,  135,  135,  135,  135,  135,  135,   83,
			  136,  136,  136,  136,  136,  180,  208,  208,  174,  172,
			  181,   75,   83,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   94,   94,  159,   94,   94,   95,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,  128,  128,  128,  128,  128,   94,   94,   94,   94,
			   94,   94,  182,  178,  192,  193,  196,  201,  166,  203,
			  158,  167,  188,  220,  188,  225,  168,  189,  189,  189,
			  189,  189,   94,   83,   94,   94,   83,  157,  183,  179,

			  192,  193,  196,  201,  166,  203,   83,  167,  220,   83,
			  225,  168,  205,  152,  156,  201,  210,   94,   94,   94,
			   95,  153,  154,  154,  154,  154,  154,  164,  164,  164,
			  164,  164,  155,  184,  184,  184,  184,  184,  205,   83,
			  124,  202,  210,  151,  184,  184,  184,  184,  184,  150,
			  190,   65,   83,  191,  191,  191,  191,  191,  194,  194,
			  194,  194,  194,  218,  218,  149,  124,   67,  147,  184,
			  184,  184,  184,  184,  184,   94,   94,  199,   94,   94,
			   95,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   67,  198,  198,  198,  198,   94,  185,

			   94,   94,   94,   94,  233,  233,  233,  233,  165,  165,
			  165,  165,  165,  195,  195,  195,  195,  195,  203,  215,
			  230,  124,  228,  228,   94,  214,   94,   94,  125,  197,
			  197,  197,  197,  197,  205,   83,  189,  189,  189,  189,
			  189,  102,   83,   83,  204,  215,  230,  124,   83,   94,
			   94,   94,   95,  134,  125,   83,   83,  132,  215,  234,
			  206,  207,  207,  207,  207,  207,  189,  189,  189,  189,
			  189,  117,  207,  207,  207,  207,  207,   65,   83,  191,
			  191,  191,  191,  191,  216,  234,  194,  194,  194,  194,
			  194,   83,  116,   67,  105,   58,   56,  207,  207,  207,

			  207,  207,  207,   71,  102,  195,  195,  195,  195,  195,
			  211,  211,  211,  211,  211,  222,  225,  222,   95,   67,
			  212,  212,  212,  212,  212,  223,   70,   69,   83,   71,
			  168,  219,  219,  219,  219,  219,  221,  221,  221,  221,
			  221,  226,  231,  231,  231,  231,  231,   68,   64,   63,
			  224,   58,  244,  245,  244,  168,  217,  217,  217,  217,
			  217,  232,  232,  232,  232,  232,   56,  217,  217,  217,
			  217,  217,  239,  239,  239,  239,  239,  258,  258,  258,
			  258,  234,  240,  240,  240,  240,  240,  246,  277,  277,
			   83,  277,  217,  217,  217,  217,  217,  217,  227,  227,

			  227,  227,  227,   83,  277,  277,  277,  235,  277,  227,
			  227,  227,  227,  227,  242,  242,  242,  242,  242,  243,
			  243,  243,  243,  243,  224,  224,  224,  224,  224,  248,
			  248,  248,  248,  248,  227,  227,  227,  227,  227,  227,
			  249,  249,  249,  249,  249,  251,  251,  251,  251,  251,
			  244,  277,  244,  277,  277,  249,  249,  249,  249,  249,
			  252,  252,  252,  252,  252,  253,  253,  253,  253,  253,
			  254,  277,  254,  246,  246,  246,  246,  246,  277,  277,
			  255,  266,  266,  266,  266,  246,  257,  257,  257,  257,
			  257,  259,  259,  259,  259,  259,  260,  260,  260,  260,

			  260,  262,  277,  262,  277,  256,  261,  261,  261,  261,
			  261,  263,  256,  256,  256,  256,  256,  265,  265,  265,
			  265,  265,  267,  267,  267,  267,  267,  268,  268,  268,
			  268,  268,  270,  271,  270,  277,  264,  269,  269,  269,
			  269,  269,  264,  264,  264,  264,  264,  273,  273,  273,
			  273,  273,  274,  274,  274,  274,  274,  275,  275,  275,
			  275,  275,  277,  270,  277,  270,  277,  272,  274,  274,
			  274,  274,  274,  276,  276,  276,  276,  276,  272,  272,
			  272,  272,  272,   71,   71,  277,  277,  277,   71,   71,
			   71,   71,  277,  277,   71,   71,  277,  277,  272,   47,

			   47,   47,   47,   47,   47,   47,   47,   47,   47,   47,
			   47,   47,   47,   47,   47,   47,   47,   47,   47,   47,
			   47,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   57,  277,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,  277,
			   57,   57,   57,   57,   57,   59,  277,   59,   59,   59,
			   59,   59,   59,   59,   59,   59,   59,   59,   59,   59,
			   59,   59,   59,   59,   59,   59,   59,   80,   80,   80,
			   80,   80,   80,  277,  277,  277,   80,   80,   80,   80,

			  277,  277,   80,   80,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   94,  277,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			  277,   94,   94,   94,   94,   94,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  277,  101,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  104,  277,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,

			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  107,  277,  107,  107,  107,  107,  107,  107,  107,  107,
			  107,  107,  107,  107,  107,  107,  107,  107,  107,  107,
			  107,  107,   63,   63,   63,   63,   63,   63,   63,   63,
			   63,   63,   63,   63,   63,   63,   63,   63,   63,   63,
			   63,   63,   63,   63,   79,   79,   79,   79,   79,   79,
			   79,  277,  277,   79,   79,   79,   79,  277,  277,   79,
			   79,  146,  277,  146,  146,  146,  146,  146,  146,  146,
			  146,  146,  146,  146,  146,  146,  146,  277,  146,  146,
			  146,  146,  146,  148,  148,  277,  148,  277,  148,  148,

			  148,  148,  277,  200,  148,  148,  200,  200,  200,  200,
			  277,  277,  277,  200,  200,  200,  200,  277,  277,  200,
			  200,  175,  175,  277,  175,  175,  175,  175,  175,  175,
			  175,  175,  277,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,  175,  199,  277,  277,  199,  199,  199,  199,
			  277,  277,  277,  199,  199,  199,  199,  277,  199,  199,
			  199,    7,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,

			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277, yy_Dummy>>)
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
			    1,    1,    1,    1,    1,    1,    1,    1,    3,    4,
			   31,    3,    4,   32,    3,    4,    5,    6,    5,    6,
			    9,   40,    9,   14,   14,   23,   34,   23,   23,   23,

			   23,   23,   51,   42,   40,   31,   35,   35,   48,   32,
			   48,   23,   33,   33,   33,   33,   33,   36,   36,   41,
			   42,   34,   36,   36,  242,   43,    3,    4,   72,   42,
			   35,   44,   55,   42,   55,   14,   43,   23,   33,   65,
			   65,   65,   65,   65,   41,   44,   41,   51,  237,   43,
			   43,   96,   97,   96,   72,   35,   44,  236,   44,   41,
			   36,   39,   39,   39,   39,   39,   39,   73,   76,  116,
			   78,  116,   39,   39,   39,   39,   39,   39,   39,   39,
			   39,   39,   39,   39,   39,   39,   39,   39,   39,   39,
			   39,   39,  228,   73,   76,   78,   39,   39,   39,   39,

			   39,   39,   39,   39,   39,   39,   39,   39,   39,   39,
			   39,   39,   39,   39,   39,   39,   39,   50,   50,   97,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,  219,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   60,   60,  199,   60,   60,   60,

			   60,   60,   60,   60,   60,   60,   60,   60,   60,   60,
			   60,   60,   75,   75,   75,   75,   75,   60,   60,   60,
			   60,   60,   60,   66,   83,   66,   66,   66,   66,   66,
			   77,   77,   77,   77,   77,   80,   80,   83,   85,   66,
			   87,  247,  247,   60,   60,   60,   60,   67,   80,   67,
			  190,   89,   67,   67,   67,   67,   67,   84,   91,   84,
			   84,   84,   84,   84,   85,   66,   87,   88,   60,   60,
			   60,   62,   86,  185,  122,   62,   80,   89,  294,  294,
			  123,   90,  131,   91,   62,   62,   62,   62,   62,   92,
			   88,   86,  129,   88,  229,  229,  229,   84,   86,  122,

			   92,  174,  183,   88,   86,   90,  123,   90,  131,  137,
			   84,  110,  149,   92,   92,  183,   62,  129,   90,  110,
			  110,  110,  110,  110,  110,   62,  120,  120,  120,  120,
			  120,   62,  139,   62,  137,   62,   74,   74,   74,   74,
			   74,  118,  118,  118,  118,  118,  148,  227,  143,   74,
			  121,  121,  121,  121,  121,  118,   74,  119,  139,  119,
			  119,  119,  119,  119,   74,   74,  227,  125,  125,  125,
			  125,  125,  138,  119,  143,   74,  127,  127,  127,  127,
			  127,  118,   74,  202,  130,  138,  130,  206,  134,   74,
			  141,   74,   81,  125,  130,  142,  202,  138,  138,  119,

			  206,  135,  127,  135,  135,  135,  135,  135,  136,  142,
			  136,  136,  136,  136,  136,  141,  297,  297,  132,  130,
			  142,  124,  142,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   98,   98,  115,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,  128,  128,  128,  128,  128,   98,   98,   98,   98,
			   98,   98,  144,  140,  162,  163,  169,  176,  128,  178,
			  114,  128,  160,  210,  160,  215,  128,  160,  160,  160,
			  160,  160,   98,  140,   98,   98,  144,  113,  144,  140,

			  162,  163,  169,  176,  128,  178,  140,  128,  210,  144,
			  215,  128,  180,  154,  112,  177,  193,   98,   98,   98,
			  145,  154,  154,  154,  154,  154,  154,  164,  164,  164,
			  164,  164,  111,  145,  145,  145,  145,  145,  180,  177,
			  164,  177,  193,  109,  145,  145,  145,  145,  145,  108,
			  161,  161,  177,  161,  161,  161,  161,  161,  166,  166,
			  166,  166,  166,  299,  299,  107,  164,  161,  106,  145,
			  145,  145,  145,  145,  145,  146,  146,  200,  146,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  146,  146,
			  146,  146,  146,  161,  171,  171,  171,  171,  146,  146,

			  146,  146,  146,  146,  223,  223,  223,  223,  165,  165,
			  165,  165,  165,  167,  167,  167,  167,  167,  179,  203,
			  220,  165,  300,  300,  146,  200,  146,  146,  165,  170,
			  170,  170,  170,  170,  181,  179,  188,  188,  188,  188,
			  188,  101,  235,  181,  179,  203,  220,  165,  179,  146,
			  146,  146,   94,   82,  165,  235,  181,   79,  204,  225,
			  181,  184,  184,  184,  184,  184,  189,  189,  189,  189,
			  189,   64,  184,  184,  184,  184,  184,  191,  204,  191,
			  191,  191,  191,  191,  204,  225,  194,  194,  194,  194,
			  194,  204,   63,  191,   59,   57,   56,  184,  184,  184,

			  184,  184,  184,  194,   52,  195,  195,  195,  195,  195,
			  197,  197,  197,  197,  197,  212,  216,  212,   47,  191,
			  198,  198,  198,  198,  198,  212,   29,   28,  216,  194,
			  195,  209,  209,  209,  209,  209,  211,  211,  211,  211,
			  211,  216,  221,  221,  221,  221,  221,   26,   21,   20,
			  212,   12,  240,  240,  240,  195,  207,  207,  207,  207,
			  207,  222,  222,  222,  222,  222,   10,  207,  207,  207,
			  207,  207,  232,  232,  232,  232,  232,  255,  255,  255,
			  255,  226,  233,  233,  233,  233,  233,  240,    7,    0,
			  226,    0,  207,  207,  207,  207,  207,  207,  217,  217,

			  217,  217,  217,  226,    0,    0,    0,  226,    0,  217,
			  217,  217,  217,  217,  238,  238,  238,  238,  238,  239,
			  239,  239,  239,  239,  243,  243,  243,  243,  243,  244,
			  244,  244,  244,  244,  217,  217,  217,  217,  217,  217,
			  245,  245,  245,  245,  245,  248,  248,  248,  248,  248,
			  249,    0,  249,    0,    0,  249,  249,  249,  249,  249,
			  250,  250,  250,  250,  250,  251,  251,  251,  251,  251,
			  252,    0,  252,  253,  253,  253,  253,  253,    0,    0,
			  252,  263,  263,  263,  263,  249,  254,  254,  254,  254,
			  254,  257,  257,  257,  257,  257,  258,  258,  258,  258,

			  258,  260,    0,  260,    0,  252,  259,  259,  259,  259,
			  259,  260,  261,  261,  261,  261,  261,  262,  262,  262,
			  262,  262,  265,  265,  265,  265,  265,  266,  266,  266,
			  266,  266,  268,  268,  268,    0,  260,  267,  267,  267,
			  267,  267,  269,  269,  269,  269,  269,  270,  270,  270,
			  270,  270,  271,  271,  271,  271,  271,  273,  273,  273,
			  273,  273,    0,  274,    0,  274,    0,  268,  274,  274,
			  274,  274,  274,  275,  275,  275,  275,  275,  276,  276,
			  276,  276,  276,  282,  282,    0,    0,    0,  282,  282,
			  282,  282,    0,    0,  282,  282,    0,    0,  274,  278,

			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  279,  279,  279,  279,  279,  279,  279,  279,  279,
			  279,  279,  279,  279,  279,  279,  279,  279,  279,  279,
			  279,  279,  279,  280,    0,  280,  280,  280,  280,  280,
			  280,  280,  280,  280,  280,  280,  280,  280,  280,    0,
			  280,  280,  280,  280,  280,  281,    0,  281,  281,  281,
			  281,  281,  281,  281,  281,  281,  281,  281,  281,  281,
			  281,  281,  281,  281,  281,  281,  281,  283,  283,  283,
			  283,  283,  283,    0,    0,    0,  283,  283,  283,  283,

			    0,    0,  283,  283,  284,  284,  284,  284,  284,  284,
			  284,  284,  284,  284,  284,  284,  284,  284,  284,  284,
			  284,  284,  284,  284,  285,    0,  285,  285,  285,  285,
			  285,  285,  285,  285,  285,  285,  285,  285,  285,  285,
			    0,  285,  285,  285,  285,  285,  286,  286,  286,  286,
			  286,  286,  286,  286,  286,  286,  286,  286,  286,  286,
			  286,  286,  286,  286,  286,  286,    0,  286,  287,  287,
			  287,  287,  287,  287,  287,  287,  287,  287,  287,  287,
			  287,  287,  287,  287,  287,  287,  287,  287,  288,    0,
			  288,  288,  288,  288,  288,  288,  288,  288,  288,  288,

			  288,  288,  288,  288,  288,  288,  288,  288,  288,  288,
			  289,    0,  289,  289,  289,  289,  289,  289,  289,  289,
			  289,  289,  289,  289,  289,  289,  289,  289,  289,  289,
			  289,  289,  290,  290,  290,  290,  290,  290,  290,  290,
			  290,  290,  290,  290,  290,  290,  290,  290,  290,  290,
			  290,  290,  290,  290,  291,  291,  291,  291,  291,  291,
			  291,    0,    0,  291,  291,  291,  291,    0,    0,  291,
			  291,  292,    0,  292,  292,  292,  292,  292,  292,  292,
			  292,  292,  292,  292,  292,  292,  292,    0,  292,  292,
			  292,  292,  292,  293,  293,    0,  293,    0,  293,  293,

			  293,  293,    0,  295,  293,  293,  295,  295,  295,  295,
			    0,    0,    0,  295,  295,  295,  295,    0,    0,  295,
			  295,  296,  296,    0,  296,  296,  296,  296,  296,  296,
			  296,  296,    0,  296,  296,  296,  296,  296,  296,  296,
			  296,  296,  296,  298,    0,    0,  298,  298,  298,  298,
			    0,    0,    0,  298,  298,  298,  298,    0,  298,  298,
			  298,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,

			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   75,   76,   11,   12,  888, 1461,   88,
			  863, 1461,  845, 1461,   84, 1461, 1461, 1461, 1461, 1461,
			  833,  831, 1461,   78, 1461, 1461,  820, 1461,  800,  797,
			    0,   50,   43,   93,   50,   87,  106, 1461, 1461,  142,
			   34,   89,   63,   79,   88,    0, 1461,  812,  106, 1461,
			  216,   96,  727,    0, 1461,  130,  793,  789, 1461,  784,
			  293,    0,  365,  789,  754,  120,  306,  333, 1461, 1461,
			 1461,    0,   90,  133,  417,  293,  135,  311,  124,  733,
			  324,  468,  735,  267,  340,  300,  334,  306,  333,  318,
			  348,  312,  343,    0,  746, 1461,  149,  146,  542, 1461,

			 1461,  664, 1461,    0, 1461, 1461,  595,  640,  639,  633,
			  401,  622,  604,  587,  570,  535,  167, 1461,  422,  440,
			  407,  431,  330,  343,  476,  448,    0,  457,  542,  349,
			  470,  349,  494, 1461,  470,  484,  491,  365,  428,  395,
			  536,  447,  452,  415,  539,  614,  674,    0,  421,  402,
			 1461, 1461, 1461, 1461,  603, 1461, 1461, 1461, 1461, 1461,
			  568,  634,  541,  535,  608,  689,  639,  694,    0,  528,
			  710,  675,    0,    0,  397,    0,  544,  582,  539,  678,
			  564,  686,    0,  345,  742,  367,    0, 1461,  717,  747,
			  331,  760,    0,  579,  767,  786,    0,  791,  801,  244,

			  673,    0,  426,  682,  721,    0,  430,  837,    0,  812,
			  538,  817,  801, 1461, 1461,  540,  771,  879,    0,  251,
			  672,  823,  842,  685, 1461,  711,  833,  441,  167,  375,
			    0, 1461,  853,  863,    0,  685,  151,  138,  895,  900,
			  838, 1461,   79,  905,  910,  921, 1461,  322,  926,  936,
			  941,  946,  956,  954,  967,  858, 1461,  972,  977,  987,
			  987,  993,  998,  962, 1461, 1003, 1008, 1018, 1018, 1023,
			 1028, 1033, 1461, 1038, 1049, 1054, 1059, 1461, 1098, 1120,
			 1142, 1164, 1075, 1183, 1203, 1223, 1245, 1267, 1287, 1309,
			 1331, 1350, 1370, 1385,  370, 1400, 1420,  508, 1440,  655,

			  714, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  277,    1,  278,  278,  279,  279,  277,  277,  277,
			  277,  277,  280,  277,  281,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  282,  282,  282,  282,  282,  282,  283,  277,  277,  277,
			   39,   39,   39,   39,   39,  284,  277,  285,  277,  277,
			  277,  277,  286,  287,  277,  277,  277,  280,  277,  288,
			  289,  288,  288,  290,  277,  277,  277,  277,  277,  277,
			  277,  282,  282,  282,  282,  282,  282,  282,  282,  291,
			  283,   39,  277,   39,   39,   81,   39,   81,   39,   81,
			   39,   81,   39,  284,  285,  277,  277,  285,  292,  277,

			  277,  286,  277,  287,  277,  277,  277,  293,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  282,  282,  282,  282,  282,  282,  282,  282,
			  282,  282,  277,  277,  277,  277,   81,   81,   39,   81,
			   39,   81,   39,   81,   39,  285,  292,  294,  293,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  282,  282,  282,  282,  282,  282,  282,  282,
			  277,  277,  282,  282,  295,  296,   81,   39,   81,   39,
			   81,   39,   81,   39,  145,  285,  297,  277,  277,  277,
			  277,  277,  282,  282,  128,  282,  282,  277,  277,  298,

			  295,   81,   39,   81,   39,   81,   39,  184,  299,  277,
			  282,  277,  277,  277,  277,   81,   39,  207,  300,  277,
			  282,  277,  277,  277,  277,   81,   39,  285,  277,  277,
			  282,  277,  277,  277,   81,   39,  285,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,    0,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,

			  277, yy_Dummy>>)
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
			   73,   74,   61,   75,   76,   77,    1,    1,    1,    1,
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
			    0,    1,    1,    2,    3,    1,    1,    1,    1,    1,
			    1,    4,    5,    1,    1,    1,    6,    7,    1,    8,
			    8,    8,    8,    9,   10,   11,    1,    1,   12,    1,
			    8,    8,    8,    8,    8,   13,   14,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   13,   15,   16,
			    1,   17,   18,    1,   19,    8,    8,    8,    8,    8,
			    8,   13,   13,   13,   13,   13,   13,   13,   13,   13,
			   13,   13,   13,   13,   20,   21,    1,   22, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,   84,   82,    1,
			    2,   14,   60,   17,   82,   15,   16,    7,    6,   12,
			    5,   10,    8,   55,   13,   11,   26,   23,   27,   19,
			   50,   50,   50,   49,   50,   50,   21,   22,    9,   51,
			   51,   51,   51,   51,   51,   52,   20,   65,   66,   67,
			   65,   68,   83,   53,   54,    1,    2,   60,   59,   80,
			   80,   80,   80,    3,   28,    0,   55,    0,   25,   24,
			   18,   50,   50,   50,   50,   48,   50,   50,   50,    0,
			    0,   51,    0,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   52,   65,   67,   66,   65,   65,   62,

			   61,    0,   54,   53,   80,   69,   80,   80,   80,   80,
			   80,   80,   80,   80,   80,   80,    4,   29,   57,   55,
			    0,   56,   50,   50,   49,   49,   47,   49,   50,   50,
			   44,   50,    0,   37,    0,   38,   38,   51,   51,   51,
			   51,   51,   51,   51,   51,   65,   65,    0,    0,    0,
			   76,   74,   77,   81,   81,   75,   73,   70,   71,   72,
			    0,   55,   50,   50,   50,   50,   48,   48,   48,   50,
			    0,    0,   44,   30,    0,   34,   51,   51,   51,   51,
			   51,   51,   30,   30,   65,   63,    0,   78,    0,   58,
			    0,   55,   31,   50,   50,   50,   33,    0,    0,    0,

			    0,   31,   31,   51,   51,   33,   33,   65,    0,    0,
			   50,    0,   43,   36,   35,   51,   51,   65,    0,   46,
			   50,    0,    0,    0,   43,   51,   51,   65,    0,    0,
			   32,   44,    0,    0,   32,   32,   64,    0,    0,    0,
			   42,   79,   45,    0,    0,    0,   42,    0,    0,   42,
			    0,    0,   41,    0,    0,    0,   41,    0,    0,    0,
			   40,    0,    0,    0,   40,    0,    0,    0,   39,    0,
			    0,    0,   39,    0,   39,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 1461
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 277
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 278
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
