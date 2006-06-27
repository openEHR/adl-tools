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
--|#line 187 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 187")
end
 -- special use of 'T' to differentiate from integer
				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text_substring(2, text_count)
		
end
else
	yy_position := yy_position + 10
--|#line 194 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 194")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
else
if yy_act <= 47 then
if yy_act = 46 then
	yy_position := yy_position + 7
--|#line 195 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 195")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
	yy_position := yy_position + 5
--|#line 200 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 200")
end
 -- special use of 'D' to differentiate from integer
				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text_substring(2, text_count)
		
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 210 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 210")
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
--|#line 211 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 211")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 217 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 217")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
end
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
if yy_act = 52 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 229 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 229")
end
				-- beginning of CADL block
				in_buffer.append_string (text)
				set_start_condition (IN_CADL_BLOCK)
				cadl_depth := 1
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 236 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 236")
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
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 257 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 257")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
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
else
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
end
end
else
if yy_act <= 74 then
if yy_act <= 69 then
if yy_act <= 66 then
if yy_act <= 65 then
if yy_act = 64 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 294 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 294")
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
--|#line 309 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 309")
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
--|#line 324 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 324")
end
in_buffer.append_string (text)
end
else
if yy_act <= 68 then
if yy_act = 67 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 326 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 326")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 331 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 331")
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
--|#line 342 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 342")
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
--|#line 352 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 352")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
	yy_position := yy_position + 4
--|#line 353 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 353")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
else
	yy_position := yy_position + 4
--|#line 354 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 354")
end
last_token := V_CHARACTER; last_character_value := '%R'
end
else
if yy_act = 73 then
	yy_position := yy_position + 4
--|#line 355 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 355")
end
last_token := V_CHARACTER; last_character_value := '%T'
else
	yy_position := yy_position + 4
--|#line 356 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 356")
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
--|#line 357 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 357")
end
last_token := V_CHARACTER; last_character_value := '%''
else
	yy_position := yy_position + 4
--|#line 358 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 358")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
else
	yy_position := yy_position + 4
--|#line 359 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 359")
end
last_token := V_CHARACTER; last_character_value := '"'
end
else
if yy_act = 78 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 360 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 360")
end

						code_ := text_substring (4, text_count - 1).to_integer
						last_token := V_CHARACTER
						last_character_value := code_.to_character
				
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 365 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 365")
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
--|#line 375 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 375")
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
--|#line 386 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 386")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 387 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 387")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 83 then
	yy_position := yy_position + 1
--|#line 391 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 391")
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
			   31,   31,   32,   31,   33,   31,   31,   34,   31,   31,
			   31,   35,   36,   31,   31,   37,   31,   31,   31,   31,
			   38,    8,   39,   40,    8,   41,   42,   42,   42,   42,
			   43,   42,   42,   44,   42,   42,   42,   45,   42,   42,
			   46,   42,   42,   42,   42,   47,   48,    8,    8,    8,
			    8,    8,    8,    8,    8,    8,   50,  274,   60,   51,
			   61,   50,   52,   60,   51,   61,   62,   52,   62,   67,

			   68,   72,   81,   73,   73,   73,   73,   73,   72,   82,
			   75,   75,   75,   75,   75,   85,  270,   74,   80,   80,
			   80,   80,   80,   92,   74,   86,   86,   81,   83,   83,
			   83,   83,   83,  108,   53,   82,   92,   98,  147,   53,
			   85,   69,  105,   74,  105,  104,   88,   88,   92,   87,
			   74,   88,   88,   62,   84,   62,   94,  105,   96,  105,
			  138,   92,   99,  147,   54,   55,   56,   57,   58,   54,
			   55,   56,   57,   58,   87,   92,  104,  104,  109,  264,
			  104,   95,  104,   92,   97,  104,  138,   92,   92,   88,
			   90,   90,   90,   90,   90,   91,   92,  139,  145,  256,

			   92,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,  153,  241,  139,  145,   90,   92,   92,   93,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   93,   92,   92,   92,   92,  100,  153,  110,  110,
			  110,  111,  112,  112,  112,  113,  113,  114,  114,  114,
			   92,  132,  132,  132,  132,  132,  137,  137,  137,  137,
			  137,  101,  235,   92,  103,  103,  225,  103,  103,  104,
			  106,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,

			  103,  103,  103,  107,  107,  107,  107,  107,  107,  107,
			  107,  107,  107,  107,  107,  107,  107,  107,  107,  107,
			  107,  107,  107,  103,  242,  103,  103,  103,  107,  107,
			  107,  107,  107,  107,  107,  107,  107,  107,  107,  107,
			  107,  107,  107,  107,  107,  107,  107,  107,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  118,
			  118,  104,  118,  118,  118,  120,  118,  118,  119,  118,
			  118,  118,  118,  118,  118,  118,  118,  121,  121,  121,
			  121,  121,  118,  118,  118,  118,  118,  118,  121,  121,
			  121,  121,  121,  121,  121,  121,  121,  121,  121,  121,

			  121,  121,  121,  121,  121,  121,  121,  121,  118,  118,
			  118,  118,  121,  121,  121,  121,  121,  121,  121,  121,
			  121,  121,  121,  121,  121,  121,  121,  121,  121,  121,
			  121,  121,  121,  118,  118,  118,  118,  118,  118,  118,
			  118,  118,  118,  118,  122,  276,  276,  155,  123,   72,
			  225,  133,  133,  133,  133,  133,  134,  124,  124,  124,
			  124,  124,  135,  104,  135,   74,  104,  136,  136,  136,
			  136,  136,   72,  155,  133,  133,  133,  133,  133,  144,
			  144,  144,  144,  144,   88,   88,  212,  104,   74,  125,
			  172,   74,  146,  146,  146,  146,  146,  148,  126,  159,

			  155,  153,  104,  157,  127,  104,  128,  151,  129,  152,
			  152,  152,  152,  152,   74,   83,   83,   83,   83,   83,
			   92,  104,  157,   92,  159,  149,  156,  154,  140,  157,
			  161,  159,  130,   92,  130,  141,   92,  210,  110,  110,
			  110,  200,   92,  142,  143,   92,   92,   92,  158,  185,
			  185,  185,  185,  199,  140,   92,  160,   84,   92,   92,
			   92,  141,  163,  164,  165,  166,  167,  187,  142,  182,
			  143,  302,  175,  181,  110,  110,  110,  168,  168,  168,
			  176,  177,  177,  177,  177,  177,  136,  136,  136,  136,
			  136,  180,  187,  169,  169,  169,  136,  136,  136,  136,

			  136,  179,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,  103,  103,  178,  103,  103,  104,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  162,  162,  162,  162,  162,  103,  103,  103,  103,  103,
			  103,  162,  162,  162,  162,  162,  162,  162,  162,  162,
			  162,  162,  162,  162,  162,  162,  162,  162,  162,  162,
			  162,  103,  174,  103,  103,  162,  162,  162,  162,  162,
			  162,  162,  162,  162,  162,  162,  162,  162,  162,  162,
			  162,  162,  162,  162,  162,  162,  103,  103,  103,  103,

			  103,  103,  103,  103,  103,  103,  103,  132,  132,  132,
			  132,  132,   72,  188,  184,  184,  184,  184,  184,  173,
			  195,  183,  186,  186,  186,  186,  186,  198,   74,  189,
			  189,  189,  189,  189,  190,  190,  190,  190,  190,  188,
			  191,  191,  191,  191,  191,  195,  201,  183,  144,  144,
			  144,  144,  144,  198,   74,   84,  104,  196,  104,  196,
			   84,  203,  104,  205,  207,  192,   84,  104,  193,  203,
			  104,  201,  151,  194,  151,  151,  151,  151,  151,  151,
			  201,  152,  152,  152,  152,  152,  205,  203,  205,   92,
			  207,  192,  197,   92,  193,  204,  207,  104,  194,  172,

			   92,  104,   92,  211,  211,  202,   92,  170,   92,  116,
			  213,  206,  213,   92,  104,  214,  214,  214,  214,  214,
			   92,   92,  208,  217,  217,  217,  217,  217,  110,  110,
			  110,  219,  111,   92,  104,  113,  113,  234,  234,  112,
			  112,  112,  114,  114,  114,  150,  220,  209,  209,  209,
			  209,  209,  265,  265,  265,  175,  223,  219,  209,  209,
			  209,  209,  209,  176,  177,  177,  177,  177,  177,  110,
			  110,  110,  220,  110,  110,  110,  218,  218,  218,  218,
			  218,  227,  223,  209,  209,  209,  209,  209,  209,  215,
			   72,   92,  216,  216,  216,  216,  216,  189,  189,  189,

			  189,  189,  246,  246,   92,  104,   74,  227,  229,  231,
			  140,  255,  255,  190,  190,  190,  190,  190,  191,  191,
			  191,  191,  191,  148,  263,  142,  140,  221,  221,  221,
			  221,  221,   74,  227,  229,  231,  140,  222,  222,  222,
			  222,  222,  224,  224,  224,  224,  224,   79,  229,  231,
			  142,  250,  140,  249,  249,  249,  249,   92,   92,  228,
			  214,  214,  214,  214,  214,   92,  131,  236,  130,  236,
			   92,   92,  119,   79,  230,  232,  250,  237,   92,  233,
			  233,  233,  233,  233,  214,  214,  214,  214,  214,  252,
			  233,  233,  233,  233,  233,   72,  239,  216,  216,  216,

			  216,  216,  238,   65,  221,  221,  221,  221,  221,  243,
			  259,   74,  261,  243,  252,  233,  233,  233,  233,  233,
			  233,   79,  239,  222,  222,  222,  222,  222,  240,  240,
			  240,  240,  240,   92,   63,  243,  259,   74,  261,  244,
			  247,  247,  247,  247,  247,  116,   92,   79,  194,  248,
			  248,  248,  248,  248,  251,  251,  251,  251,  251,  252,
			  257,  257,  257,  257,  257,  258,  258,  258,  258,  258,
			  104,   92,   78,  194,  245,  245,  245,  245,  245,  260,
			  260,  260,  260,  260,  253,  245,  245,  245,  245,  245,
			  266,  266,  266,  266,  266,   77,   92,   76,   71,  261,

			  267,  268,  267,  271,  271,  271,  271,  271,   92,   92,
			  245,  245,  245,  245,  245,  245,  254,  254,  254,  254,
			  254,   92,   70,   65,   63,  262,  302,  254,  254,  254,
			  254,  254,  295,  296,  295,  269,  238,  238,  238,  238,
			  238,  272,  272,  272,  272,  272,  273,  273,  273,  273,
			  273,  302,  254,  254,  254,  254,  254,  254,  275,  275,
			  275,  275,  275,  267,  302,  267,  302,  297,  273,  273,
			  273,  273,  273,  277,  277,  277,  277,  277,  278,  278,
			  278,  278,  278,  269,  269,  269,  269,  269,  302,  279,
			  302,  279,  282,  282,  282,  282,  282,  302,  269,  280,

			  283,  283,  283,  283,  284,  284,  284,  284,  284,  285,
			  285,  285,  285,  285,  286,  286,  286,  286,  286,  287,
			  302,  287,  302,  302,  281,  291,  291,  291,  291,  288,
			  281,  281,  281,  281,  281,  290,  290,  290,  290,  290,
			  292,  292,  292,  292,  292,  293,  293,  293,  293,  293,
			  302,  302,  302,  302,  289,  294,  294,  294,  294,  294,
			  289,  289,  289,  289,  289,  298,  298,  298,  298,  298,
			  299,  299,  299,  299,  299,  300,  300,  300,  300,  300,
			  295,  302,  295,  302,  302,  299,  299,  299,  299,  299,
			  301,  301,  301,  301,  301,  297,  297,  297,  297,  297,

			   79,   79,  302,  302,  302,   79,   79,   79,   79,  302,
			  302,   79,   79,  302,  302,  297,   49,   49,   49,   49,
			   49,   49,   49,   49,   49,   49,   49,   49,   49,   49,
			   49,   49,   49,   49,   49,   49,   49,   49,   59,   59,
			   59,   59,   59,   59,   59,   59,   59,   59,   59,   59,
			   59,   59,   59,   59,   59,   59,   59,   59,   59,   59,
			   64,  302,   64,   64,   64,   64,   64,   64,   64,   64,
			   64,   64,   64,   64,   64,   64,  302,   64,   64,   64,
			   64,   64,   66,  302,   66,   66,   66,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,   66,   66,   66,   66,

			   66,   66,   66,   66,   89,   89,   89,   89,   89,   89,
			  302,  302,  302,   89,   89,   89,   89,  302,  302,   89,
			   89,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  103,  302,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  302,  103,  103,
			  103,  103,  103,  115,  115,  115,  115,  115,  115,  115,
			  115,  115,  115,  115,  115,  115,  115,  115,  115,  115,
			  115,  115,  115,  302,  115,  117,  117,  117,  117,  117,
			  117,  117,  117,  117,  117,  117,  117,  117,  117,  117,

			  117,  117,  117,  117,  117,  118,  302,  118,  118,  118,
			  118,  118,  118,  118,  118,  118,  118,  118,  118,  118,
			  118,  118,  118,  118,  118,  118,  118,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   88,
			   88,   88,   88,   88,   88,   88,  302,  302,   88,   88,
			   88,   88,  302,  302,   88,   88,  171,  171,  302,  171,
			  302,  171,  171,  171,  171,  302,  226,  171,  171,  226,
			  226,  226,  226,  302,  302,  302,  226,  226,  226,  226,
			  302,  302,  226,  226,  200,  200,  302,  200,  200,  200,

			  200,  200,  200,  200,  200,  302,  200,  200,  200,  200,
			  200,  200,  200,  200,  200,  200,  225,  302,  302,  225,
			  225,  225,  225,  302,  302,  302,  225,  225,  225,  225,
			  302,  225,  225,  225,    7,  302,  302,  302,  302,  302,
			  302,  302,  302,  302,  302,  302,  302,  302,  302,  302,
			  302,  302,  302,  302,  302,  302,  302,  302,  302,  302,
			  302,  302,  302,  302,  302,  302,  302,  302,  302,  302,
			  302,  302,  302,  302,  302,  302,  302,  302,  302,  302,
			  302,  302,  302,  302,  302,  302,  302,  302,  302,  302,
			  302,  302,  302,  302,  302,  302,  302,  302,  302,  302,

			  302,  302,  302,  302,  302,  302,  302,  302,  302,  302,
			  302,  302,  302,  302,  302,  302,  302,  302,  302,  302, yy_Dummy>>)
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
			    1,    1,    1,    1,    1,    1,    3,  271,    5,    3,
			    5,    4,    3,    6,    4,    6,    9,    4,    9,   14,

			   14,   23,   33,   23,   23,   23,   23,   23,   24,   34,
			   24,   24,   24,   24,   24,   36,  264,   23,   32,   32,
			   32,   32,   32,   42,   24,   37,   37,   33,   35,   35,
			   35,   35,   35,   53,    3,   34,   42,   45,   87,    4,
			   36,   14,   50,   23,   50,  263,   38,   38,   45,   37,
			   24,   38,   38,   62,   35,   62,   43,  105,   44,  105,
			   81,   45,   45,   87,    3,    3,    3,    3,    3,    4,
			    4,    4,    4,    4,   37,   44,   54,   55,   53,  255,
			   56,   43,   57,   43,   44,   58,   81,   92,   44,   38,
			   41,   41,   41,   41,   41,   41,   43,   82,   85,  247,

			   92,   41,   41,   41,   41,   41,   41,   41,   41,   41,
			   41,   41,   41,   41,   41,   41,   41,   41,   41,   41,
			   41,   94,  225,   82,   85,   41,   41,   41,   41,   41,
			   41,   41,   41,   41,   41,   41,   41,   41,   41,   41,
			   41,   41,   41,   41,   41,   41,   46,   94,   54,   54,
			   54,   55,   56,   56,   56,   57,   57,   58,   58,   58,
			   46,   72,   72,   72,   72,   72,   80,   80,   80,   80,
			   80,   46,  215,   46,   52,   52,  226,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,

			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,  226,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   67,
			   67,  210,   67,   67,   67,   67,   67,   67,   67,   67,
			   67,   67,   67,   67,   67,   67,   67,   67,   67,   67,
			   67,   67,   67,   67,   67,   67,   67,   67,   67,   67,
			   67,   67,   67,   67,   67,   67,   67,   67,   67,   67,

			   67,   67,   67,   67,   67,   67,   67,   67,   67,   67,
			   67,   67,   67,   67,   67,   67,   67,   67,   67,   67,
			   67,   67,   67,   67,   67,   67,   67,   67,   67,   67,
			   67,   67,   67,   67,   67,   67,   67,   67,   67,   67,
			   67,   67,   67,   67,   69,  274,  274,   96,   69,   73,
			  199,   73,   73,   73,   73,   73,   73,   69,   69,   69,
			   69,   69,   74,  106,   74,   73,  111,   74,   74,   74,
			   74,   74,   75,   96,   75,   75,   75,   75,   75,   84,
			   84,   84,   84,   84,   89,   89,  172,  110,   75,   69,
			  171,   73,   86,   86,   86,   86,   86,   89,   69,  100,

			   97,   95,  112,   98,   69,  113,   69,   93,   69,   93,
			   93,   93,   93,   93,   75,   83,   83,   83,   83,   83,
			   95,  114,   99,   97,  100,   89,   97,   95,   83,   98,
			  106,  101,  130,   95,  130,   83,   97,  162,  111,  111,
			  111,  150,  101,   83,   83,  208,   99,   93,   99,  134,
			  134,  134,  134,  148,   83,  101,  101,  140,  208,   99,
			   93,   83,  110,  110,  110,  110,  110,  138,   83,  129,
			   83,   90,  124,  128,  112,  112,  112,  113,  113,  113,
			  124,  124,  124,  124,  124,  124,  135,  135,  135,  135,
			  135,  127,  138,  114,  114,  114,  136,  136,  136,  136,

			  136,  126,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,  107,  107,  125,  107,  107,  107,  107,  107,
			  107,  107,  107,  107,  107,  107,  107,  107,  107,  107,
			  107,  107,  107,  107,  107,  107,  107,  107,  107,  107,
			  107,  107,  107,  107,  107,  107,  107,  107,  107,  107,
			  107,  107,  107,  107,  107,  107,  107,  107,  107,  107,
			  107,  107,  123,  107,  107,  107,  107,  107,  107,  107,
			  107,  107,  107,  107,  107,  107,  107,  107,  107,  107,
			  107,  107,  107,  107,  107,  107,  107,  107,  107,  107,

			  107,  107,  107,  107,  107,  107,  107,  132,  132,  132,
			  132,  132,  133,  139,  133,  133,  133,  133,  133,  122,
			  145,  132,  137,  137,  137,  137,  137,  147,  133,  141,
			  141,  141,  141,  141,  142,  142,  142,  142,  142,  139,
			  143,  143,  143,  143,  143,  145,  153,  132,  144,  144,
			  144,  144,  144,  147,  133,  141,  163,  146,  164,  146,
			  142,  155,  166,  157,  159,  144,  143,  165,  144,  156,
			  167,  153,  151,  144,  151,  151,  151,  151,  151,  152,
			  154,  152,  152,  152,  152,  152,  158,  155,  157,  156,
			  159,  144,  146,  154,  144,  156,  160,  168,  144,  121,

			  158,  169,  156,  317,  317,  154,  154,  120,  228,  115,
			  183,  158,  183,  158,  103,  183,  183,  183,  183,  183,
			  160,  228,  160,  185,  185,  185,  185,  185,  163,  163,
			  163,  187,  164,  160,  161,  166,  166,  320,  320,  165,
			  165,  165,  167,  167,  167,   91,  188,  161,  161,  161,
			  161,  161,  256,  256,  256,  177,  195,  187,  161,  161,
			  161,  161,  161,  177,  177,  177,  177,  177,  177,  168,
			  168,  168,  188,  169,  169,  169,  186,  186,  186,  186,
			  186,  201,  195,  161,  161,  161,  161,  161,  161,  184,
			  184,  232,  184,  184,  184,  184,  184,  189,  189,  189,

			  189,  189,  322,  322,  232,  254,  184,  201,  203,  205,
			  189,  323,  323,  190,  190,  190,  190,  190,  191,  191,
			  191,  191,  191,   88,  254,  189,  190,  192,  192,  192,
			  192,  192,  184,  202,  203,  205,  189,  193,  193,  193,
			  193,  193,  196,  196,  196,  196,  196,  191,  204,  206,
			  189,  239,  190,  237,  237,  237,  237,  202,  206,  202,
			  213,  213,  213,  213,  213,  204,   71,  217,   70,  217,
			  202,  206,   66,  191,  204,  206,  239,  217,  204,  209,
			  209,  209,  209,  209,  214,  214,  214,  214,  214,  243,
			  209,  209,  209,  209,  209,  216,  220,  216,  216,  216,

			  216,  216,  217,   64,  221,  221,  221,  221,  221,  229,
			  250,  216,  252,  230,  243,  209,  209,  209,  209,  209,
			  209,  221,  220,  222,  222,  222,  222,  222,  224,  224,
			  224,  224,  224,  230,   63,  229,  250,  216,  252,  230,
			  235,  235,  235,  235,  235,   59,  230,  221,  222,  236,
			  236,  236,  236,  236,  240,  240,  240,  240,  240,  244,
			  248,  248,  248,  248,  248,  249,  249,  249,  249,  249,
			   49,  244,   30,  222,  233,  233,  233,  233,  233,  251,
			  251,  251,  251,  251,  244,  233,  233,  233,  233,  233,
			  257,  257,  257,  257,  257,   29,  262,   27,   21,  253,

			  258,  258,  258,  265,  265,  265,  265,  265,  253,  262,
			  233,  233,  233,  233,  233,  233,  245,  245,  245,  245,
			  245,  253,   20,   12,   10,  253,    7,  245,  245,  245,
			  245,  245,  293,  293,  293,  258,  266,  266,  266,  266,
			  266,  267,  267,  267,  267,  267,  268,  268,  268,  268,
			  268,    0,  245,  245,  245,  245,  245,  245,  272,  272,
			  272,  272,  272,  273,    0,  273,    0,  293,  273,  273,
			  273,  273,  273,  275,  275,  275,  275,  275,  276,  276,
			  276,  276,  276,  277,  277,  277,  277,  277,    0,  278,
			    0,  278,  279,  279,  279,  279,  279,    0,  273,  278,

			  280,  280,  280,  280,  282,  282,  282,  282,  282,  283,
			  283,  283,  283,  283,  284,  284,  284,  284,  284,  285,
			    0,  285,    0,    0,  278,  288,  288,  288,  288,  285,
			  286,  286,  286,  286,  286,  287,  287,  287,  287,  287,
			  290,  290,  290,  290,  290,  291,  291,  291,  291,  291,
			    0,    0,    0,    0,  285,  292,  292,  292,  292,  292,
			  294,  294,  294,  294,  294,  295,  295,  295,  295,  295,
			  296,  296,  296,  296,  296,  298,  298,  298,  298,  298,
			  299,    0,  299,    0,    0,  299,  299,  299,  299,  299,
			  300,  300,  300,  300,  300,  301,  301,  301,  301,  301,

			  307,  307,    0,    0,    0,  307,  307,  307,  307,    0,
			    0,  307,  307,    0,    0,  299,  303,  303,  303,  303,
			  303,  303,  303,  303,  303,  303,  303,  303,  303,  303,
			  303,  303,  303,  303,  303,  303,  303,  303,  304,  304,
			  304,  304,  304,  304,  304,  304,  304,  304,  304,  304,
			  304,  304,  304,  304,  304,  304,  304,  304,  304,  304,
			  305,    0,  305,  305,  305,  305,  305,  305,  305,  305,
			  305,  305,  305,  305,  305,  305,    0,  305,  305,  305,
			  305,  305,  306,    0,  306,  306,  306,  306,  306,  306,
			  306,  306,  306,  306,  306,  306,  306,  306,  306,  306,

			  306,  306,  306,  306,  308,  308,  308,  308,  308,  308,
			    0,    0,    0,  308,  308,  308,  308,    0,    0,  308,
			  308,  309,  309,  309,  309,  309,  309,  309,  309,  309,
			  309,  309,  309,  309,  309,  309,  309,  309,  309,  309,
			  309,  310,    0,  310,  310,  310,  310,  310,  310,  310,
			  310,  310,  310,  310,  310,  310,  310,    0,  310,  310,
			  310,  310,  310,  311,  311,  311,  311,  311,  311,  311,
			  311,  311,  311,  311,  311,  311,  311,  311,  311,  311,
			  311,  311,  311,    0,  311,  312,  312,  312,  312,  312,
			  312,  312,  312,  312,  312,  312,  312,  312,  312,  312,

			  312,  312,  312,  312,  312,  313,    0,  313,  313,  313,
			  313,  313,  313,  313,  313,  313,  313,  313,  313,  313,
			  313,  313,  313,  313,  313,  313,  313,  314,  314,  314,
			  314,  314,  314,  314,  314,  314,  314,  314,  314,  314,
			  314,  314,  314,  314,  314,  314,  314,  314,  314,  315,
			  315,  315,  315,  315,  315,  315,    0,    0,  315,  315,
			  315,  315,    0,    0,  315,  315,  316,  316,    0,  316,
			    0,  316,  316,  316,  316,    0,  318,  316,  316,  318,
			  318,  318,  318,    0,    0,    0,  318,  318,  318,  318,
			    0,    0,  318,  318,  319,  319,    0,  319,  319,  319,

			  319,  319,  319,  319,  319,    0,  319,  319,  319,  319,
			  319,  319,  319,  319,  319,  319,  321,    0,    0,  321,
			  321,  321,  321,    0,    0,    0,  321,  321,  321,  321,
			    0,  321,  321,  321,  302,  302,  302,  302,  302,  302,
			  302,  302,  302,  302,  302,  302,  302,  302,  302,  302,
			  302,  302,  302,  302,  302,  302,  302,  302,  302,  302,
			  302,  302,  302,  302,  302,  302,  302,  302,  302,  302,
			  302,  302,  302,  302,  302,  302,  302,  302,  302,  302,
			  302,  302,  302,  302,  302,  302,  302,  302,  302,  302,
			  302,  302,  302,  302,  302,  302,  302,  302,  302,  302,

			  302,  302,  302,  302,  302,  302,  302,  302,  302,  302,
			  302,  302,  302,  302,  302,  302,  302,  302,  302,  302, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   83,   88,   13,   18, 1126, 1634,   94,
			 1121, 1634, 1117, 1634,   90, 1634, 1634, 1634, 1634, 1634,
			 1106, 1081, 1634,   84,   91, 1634, 1634, 1070, 1634, 1068,
			 1043,    0,   99,   72,   69,  109,   69,  106,  135, 1634,
			 1634,  171,   66,  126,  118,   91,  203,    0, 1634, 1064,
			  140, 1634,  273,  127,  170,  171,  174,  176,  179,  968,
			    0, 1634,  151, 1031,  997, 1634,  962,  358,    0,  438,
			  965,  949,  242,  432,  448,  455, 1634, 1634, 1634,    0,
			  247,  122,  163,  496,  460,  165,  473,   92,  899,  473,
			  547,  827,  130,  490,  183,  463,  413,  466,  470,  489,

			  453,  485,    0,  808, 1634,  155,  457,  621, 1634, 1634,
			  481,  460,  496,  499,  515,  732, 1634,    0, 1634, 1634,
			  734,  774,  709,  662,  562,  614,  591,  581,  563,  559,
			  530, 1634,  688,  695,  530,  567,  577,  703,  523,  676,
			  512,  710,  715,  721,  729,  677,  743,  694,  529, 1634,
			  523,  755,  762,  702,  736,  724,  732,  720,  743,  731,
			  763,  828,  512,  750,  752,  761,  756,  764,  791,  795,
			    0,  465,  476, 1634, 1634, 1634, 1634,  845, 1634, 1634,
			 1634, 1634, 1634,  796,  873,  804,  857,  798,  806,  878,
			  894,  899,  908,  918,    0,  808,  923,    0,    0,  446,

			    0,  848,  900,  868,  908,  861,  901,    0,  488,  960,
			  355,    0, 1634,  941,  965,  253,  978,  953,    0,    0,
			  959,  985, 1004,    0, 1009,  170,  272,    0,  751,  972,
			  976,    0,  834, 1055,    0, 1021, 1030,  934, 1634,  906,
			 1035, 1634, 1634,  944, 1014, 1097,    0,  183, 1041, 1046,
			  962, 1060,  964, 1051,  899,  154,  833, 1071, 1086,    0,
			 1634,    0, 1039,  139,  106, 1084, 1117, 1122, 1127, 1634,
			 1634,   42, 1139, 1149,  426, 1154, 1159, 1164, 1175, 1173,
			 1181, 1634, 1185, 1190, 1195, 1205, 1211, 1216, 1206, 1634,
			 1221, 1226, 1236, 1118, 1241, 1246, 1251, 1634, 1256, 1266,

			 1271, 1276, 1634, 1315, 1337, 1359, 1381, 1292, 1400, 1420,
			 1440, 1462, 1484, 1504, 1526, 1545, 1558,  795, 1573, 1593,
			  829, 1613,  894,  903, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  302,    1,  303,  303,  304,  304,  302,  302,  302,
			  302,  302,  305,  302,  306,  302,  302,  302,  302,  302,
			  302,  302,  302,  302,  302,  302,  302,  302,  302,  302,
			  302,  307,  307,  307,  307,  307,  307,  307,  308,  302,
			  302,  302,   41,   41,   41,   41,   41,  309,  302,  310,
			  302,  302,  302,  302,  310,  310,  310,  310,  310,  311,
			  312,  302,  302,  302,  305,  302,  313,  302,  313,  313,
			  314,  302,  302,  302,  302,  302,  302,  302,  302,  307,
			  307,  307,  307,  307,  307,  307,  307,  307,  315,  308,
			   41,  302,   41,   41,   90,   41,   90,   41,   90,   41,

			   90,   41,  309,  310,  302,  302,  310,  302,  302,  302,
			  310,  310,  310,  310,  310,  311,  302,  312,  302,  302,
			  302,  316,  302,  302,  302,  302,  302,  302,  302,  302,
			  302,  302,  302,  302,  302,  302,  302,  307,  307,  307,
			  307,  307,  307,  307,  307,  307,  307,  307,  302,  302,
			  302,  302,   90,   90,   41,   90,   41,   90,   41,   90,
			   41,  310,  107,  310,  310,  310,  310,  310,  310,  310,
			  317,  316,  302,  302,  302,  302,  302,  302,  302,  302,
			  302,  302,  302,  302,  302,  302,  307,  307,  307,  307,
			  307,   83,  307,  307,  307,  307,  302,  307,  307,  318,

			  319,   90,   41,   90,   41,   90,   41,   90,   41,  161,
			  310,  320,  302,  302,  302,  302,  302,  302,  307,  307,
			  307,  144,  307,  307,  302,  321,  318,   90,   41,   90,
			   41,   90,   41,  161,  322,  302,  302,  302,  302,  307,
			  302,  302,  302,   90,   41,  161,  323,  302,  302,  302,
			  307,  302,   90,   41,  310,  302,  302,  302,  302,  307,
			  302,   90,   41,  310,  302,  302,  302,  302,  302,  302,
			  302,  302,  302,  302,  302,  302,  302,  302,  302,  302,
			  302,  302,  302,  302,  302,  302,  302,  302,  302,  302,
			  302,  302,  302,  302,  302,  302,  302,  302,  302,  302,

			  302,  302,    0,  302,  302,  302,  302,  302,  302,  302,
			  302,  302,  302,  302,  302,  302,  302,  302,  302,  302,
			  302,  302,  302,  302, yy_Dummy>>)
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
			    5,   10,    8,   55,   55,   13,   11,   26,   23,   27,
			   19,   50,   50,   50,   50,   49,   50,   50,   21,   22,
			    9,   51,   51,   51,   51,   51,   51,   52,   20,   66,
			   67,   68,   66,   69,   66,   66,   66,   66,   66,   84,
			   53,   54,    1,    2,   60,   59,   81,   81,   81,   81,
			    3,   28,    0,   55,    0,   55,   25,   24,   18,   50,
			   50,   50,   50,   50,   48,   50,   50,   50,    0,    0,
			   51,    0,   51,   51,   51,   51,   51,   51,   51,   51,

			   51,   51,   52,   66,   68,   67,   66,   66,   62,   61,
			   63,   66,   66,   66,   66,    0,   54,   53,   81,   70,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			    4,   29,   57,   55,    0,    0,   56,   50,   50,   50,
			   49,   49,   49,   49,   50,   50,   44,   50,    0,   37,
			    0,   38,   38,   51,   51,   51,   51,   51,   51,   51,
			   51,   66,   66,   66,   66,   66,   66,   66,   66,   66,
			    0,    0,    0,   77,   75,   78,   82,   82,   76,   74,
			   71,   72,   73,    0,   55,    0,   50,   50,   50,   50,
			   50,   50,   48,   48,   48,   50,    0,   44,   30,    0,

			   34,   51,   51,   51,   51,   51,   51,   30,   30,   66,
			   64,    0,   79,    0,   58,    0,   55,   43,   47,   31,
			   50,   50,   50,   33,    0,    0,    0,   31,   31,   51,
			   51,   33,   33,   66,    0,    0,    0,    0,   43,   50,
			    0,   36,   35,   51,   51,   66,    0,   46,    0,    0,
			   50,    0,   51,   51,   66,    0,    0,    0,   42,   32,
			   44,   32,   32,   65,    0,    0,    0,    0,    0,   42,
			   80,   45,    0,   42,    0,    0,    0,    0,   41,    0,
			    0,   41,    0,    0,    0,   40,    0,    0,    0,   40,
			    0,    0,    0,   39,    0,    0,    0,   39,    0,   39,

			    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 1634
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 302
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 303
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
