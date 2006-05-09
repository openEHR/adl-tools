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
if yy_act <= 31 then
if yy_act <= 26 then
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
end
else
if yy_act <= 29 then
if yy_act <= 28 then
if yy_act = 27 then
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
		
else
	yy_position := yy_position + 2
--|#line 118 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 118")
end
last_token := SYM_ELLIPSIS
end
else
	yy_position := yy_position + 3
--|#line 119 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 119")
end
last_token := SYM_LIST_CONTINUE
end
else
if yy_act = 30 then
	yy_position := yy_position + 4
--|#line 123 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 123")
end
last_token := SYM_TRUE
else
	yy_position := yy_position + 5
--|#line 125 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 125")
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
--|#line 127 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 127")
end
last_token := SYM_INFINITY
else
	yy_position := yy_position + 5
--|#line 130 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 130")
end
last_token := SYM_QUERY_FUNC
end
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
if yy_act = 35 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 139 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 139")
end

					last_token := V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 144 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 144")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
end
else
if yy_act <= 39 then
if yy_act <= 38 then
if yy_act = 37 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 150 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 150")
end

					last_token := V_LOCAL_CODE
					last_string_value := text
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 157 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 157")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 158 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 158")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
if yy_act = 40 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 159 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 159")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 166 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 166")
end

				last_token := V_ISO8601_EXTENDED_TIME
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
--|#line 167 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 167")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 168 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 168")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
else
	yy_position := yy_position + 10
--|#line 175 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 175")
end

-- [0-9]{4} { -- can't handle year only, since it will be confused with plain integer
				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
else
if yy_act <= 46 then
if yy_act = 45 then
	yy_position := yy_position + 7
--|#line 176 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 176")
end

-- [0-9]{4} { -- can't handle year only, since it will be confused with plain integer
				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 184 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 184")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 185 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 185")
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
--|#line 186 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 186")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 192 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 192")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 197 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 197")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
end
else
if yy_act = 51 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 204 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 204")
end
				-- beginning of CADL block
				in_buffer.append_string (text)
				set_start_condition (IN_CADL_BLOCK)
				cadl_depth := 1
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 209 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 209")
end
		-- got an open brace
				in_buffer.append_string (text)
				cadl_depth := cadl_depth + 1
			
end
end
end
else
if yy_act <= 57 then
if yy_act <= 55 then
if yy_act <= 54 then
if yy_act = 53 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 213 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 213")
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
--|#line 229 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 229")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 230 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 230")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
else
if yy_act = 56 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 237 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 237")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 238 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 238")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
end
else
if yy_act <= 60 then
if yy_act <= 59 then
if yy_act = 58 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 245 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 245")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 250 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 250")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
end
else
	yy_position := yy_position + 2
--|#line 256 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 256")
end
in_buffer.append_character ('\')
end
else
if yy_act = 61 then
	yy_position := yy_position + 2
--|#line 258 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 258")
end
in_buffer.append_character ('"')
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 260 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 260")
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
--|#line 275 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 275")
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
--|#line 290 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 290")
end
in_buffer.append_string (text)
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 292 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 292")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
else
if yy_act = 66 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 297 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 297")
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
--|#line 308 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 308")
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
--|#line 316 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 316")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
	yy_position := yy_position + 4
--|#line 317 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 317")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
else
	yy_position := yy_position + 4
--|#line 318 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 318")
end
last_token := V_CHARACTER; last_character_value := '%R'
end
else
if yy_act = 71 then
	yy_position := yy_position + 4
--|#line 319 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 319")
end
last_token := V_CHARACTER; last_character_value := '%T'
else
	yy_position := yy_position + 4
--|#line 320 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 320")
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
--|#line 321 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 321")
end
last_token := V_CHARACTER; last_character_value := '%''
else
	yy_position := yy_position + 4
--|#line 322 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 322")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
else
	yy_position := yy_position + 4
--|#line 323 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 323")
end
last_token := V_CHARACTER; last_character_value := '"'
end
else
if yy_act = 76 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 324 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 324")
end

						code_ := text_substring (4, text_count - 1).to_integer
						last_token := V_CHARACTER
						last_character_value := code_.to_character
				
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 329 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 329")
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
--|#line 339 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 339")
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
--|#line 350 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 350")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 351 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 351")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 81 then
	yy_position := yy_position + 1
--|#line 355 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 355")
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
			   83,   76,   79,   79,  245,   89,   51,   51,  122,   88,
			   78,   91,   55,   83,   55,   62,   83,   67,   75,  118,
			  118,  118,  118,  118,   86,   83,   83,  100,  239,   83,
			   90,   96,   95,   96,  122,   78,   92,   95,   83,   83,
			   79,   81,   81,   81,   81,   81,   82,  123,  129,  116,
			  131,  116,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,  235,  123,  129,  131,   81,   83,   83,   84,

			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83,
			   83,   83,   84,   83,   83,   83,   83,   94,   94,  145,
			   94,   94,   95,   97,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   94,  227,   94,   94,
			   94,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   94,   94,   94,  104,  104,  212,  104,  104,  104,

			  106,  104,  104,  105,  104,  104,  104,  104,  104,  104,
			  104,  104,  128,  128,  128,  128,  128,  104,  104,  104,
			  104,  104,  104,   65,   83,  119,  119,  119,  119,  119,
			  130,  130,  130,  130,  130,   79,   79,   83,  137,   67,
			  139,  248,  248,  104,  104,  104,  104,  120,  132,  120,
			  208,  141,  121,  121,  121,  121,  121,  135,  143,  136,
			  136,  136,  136,  136,  137,   67,  139,  139,  104,  104,
			  104,  108,  137,   95,  162,  109,  133,  141,  186,  186,
			  163,  141,  173,  143,  110,  110,  110,  110,  110,  143,
			   83,   83,  169,  140,  236,  236,  236,   83,  138,  162,

			   83,  187,   83,   83,   83,   83,  163,  142,  173,  176,
			   83,  152,  149,   83,  144,   83,  111,  169,   83,  153,
			  154,  154,  154,  154,  154,  112,  121,  121,  121,  121,
			  121,  113,  178,  114,  176,  115,   74,   74,   74,   74,
			   74,  118,  118,  118,  118,  118,  175,   95,  182,  124,
			  121,  121,  121,  121,  121,  160,  125,   65,  178,  161,
			  161,  161,  161,  161,  126,  127,  234,  164,  164,  164,
			  164,  164,  176,   67,  182,  124,  165,  165,  165,  165,
			  165,  160,  125,   83,  170,   83,  170,   83,  174,  126,
			  180,  127,  275,   75,  171,  180,   83,  177,   83,   67,

			   83,  135,   75,  135,  135,  135,  135,  135,  135,   83,
			  136,  136,  136,  136,  136,  180,  207,  207,   75,  172,
			  181,  159,   83,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   94,   94,  158,   94,   94,   95,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,  128,  128,  128,  128,  128,   94,   94,   94,   94,
			   94,   94,  182,  178,  192,  193,  196,  200,  166,  202,
			  157,  167,  188,  218,  188,  223,  168,  189,  189,  189,
			  189,  189,   94,   83,   94,   94,   83,  156,  183,  179,

			  192,  193,  196,  200,  166,  202,   83,  167,  218,   83,
			  223,  168,  204,  152,  155,  200,  209,   94,   94,   94,
			   95,  153,  154,  154,  154,  154,  154,  164,  164,  164,
			  164,  164,  151,  184,  184,  184,  184,  184,  204,   83,
			  124,  201,  209,  150,  184,  184,  184,  184,  184,  149,
			  190,   65,   83,  191,  191,  191,  191,  191,  194,  194,
			  194,  194,  194,  147,   83,  102,  124,   67,   95,  184,
			  184,  184,  184,  184,  184,   94,   94,   83,   94,   94,
			   95,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   67,  198,  198,  198,  198,   94,  185,

			   94,   94,   94,   94,  231,  231,  231,  231,  165,  165,
			  165,  165,  165,  195,  195,  195,  195,  195,  202,  213,
			  228,  124,  216,  216,   94,  134,   94,   94,  125,  197,
			  197,  197,  197,  197,  204,   83,  189,  189,  189,  189,
			  189,  226,  226,   83,  203,  213,  228,  124,   83,   94,
			   94,   94,  132,  117,  125,  116,   83,  105,  213,  232,
			  205,  206,  206,  206,  206,  206,  189,  189,  189,  189,
			  189,   58,  206,  206,  206,  206,  206,   65,   83,  191,
			  191,  191,  191,  191,  214,  232,  194,  194,  194,  194,
			  194,   83,   56,   67,  102,   95,   70,  206,  206,  206,

			  206,  206,  206,   71,   69,  195,  195,  195,  195,  195,
			  210,  210,  210,  210,  210,  220,  223,  220,   68,   67,
			  211,  211,  211,  211,  211,  221,   64,   63,   83,   71,
			  168,  217,  217,  217,  217,  217,  219,  219,  219,  219,
			  219,  224,  229,  229,  229,  229,  229,   58,   56,  275,
			  222,  275,  242,  243,  242,  168,  215,  215,  215,  215,
			  215,  230,  230,  230,  230,  230,  275,  215,  215,  215,
			  215,  215,  237,  237,  237,  237,  237,  256,  256,  256,
			  256,  232,  238,  238,  238,  238,  238,  244,  275,  275,
			   83,  275,  215,  215,  215,  215,  215,  215,  225,  225,

			  225,  225,  225,   83,  275,  275,  275,  233,  275,  225,
			  225,  225,  225,  225,  240,  240,  240,  240,  240,  241,
			  241,  241,  241,  241,  222,  222,  222,  222,  222,  246,
			  246,  246,  246,  246,  225,  225,  225,  225,  225,  225,
			  247,  247,  247,  247,  247,  249,  249,  249,  249,  249,
			  242,  275,  242,  275,  275,  247,  247,  247,  247,  247,
			  250,  250,  250,  250,  250,  251,  251,  251,  251,  251,
			  252,  275,  252,  244,  244,  244,  244,  244,  275,  275,
			  253,  264,  264,  264,  264,  244,  255,  255,  255,  255,
			  255,  257,  257,  257,  257,  257,  258,  258,  258,  258,

			  258,  260,  275,  260,  275,  254,  259,  259,  259,  259,
			  259,  261,  254,  254,  254,  254,  254,  263,  263,  263,
			  263,  263,  265,  265,  265,  265,  265,  266,  266,  266,
			  266,  266,  268,  269,  268,  275,  262,  267,  267,  267,
			  267,  267,  262,  262,  262,  262,  262,  271,  271,  271,
			  271,  271,  272,  272,  272,  272,  272,  273,  273,  273,
			  273,  273,  275,  268,  275,  268,  275,  270,  272,  272,
			  272,  272,  272,  274,  274,  274,  274,  274,  270,  270,
			  270,  270,  270,   71,   71,  275,  275,   71,   71,   71,
			  275,   71,   71,  275,  275,  275,  275,  275,  270,   47,

			   47,   47,   47,   47,   47,   47,   47,   47,   47,   47,
			   47,   47,   47,   47,   47,   47,   47,   47,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   57,  275,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,  275,   57,   57,   57,   57,   59,  275,   59,   59,
			   59,   59,   59,   59,   59,   59,   59,   59,   59,   59,
			   59,   59,   59,   59,   59,   80,   80,   80,   80,   80,
			   80,  275,  275,   80,   80,   80,  275,   80,   80,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,

			   93,   93,   93,   93,   93,   93,   94,  275,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			  275,   94,   94,   94,   94,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  275,  101,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  104,  275,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  107,  275,  107,  107,  107,  107,  107,  107,  107,  107,
			  107,  107,  107,  107,  107,  107,  107,  107,  107,   63,

			   63,   63,   63,   63,   63,   63,   63,   63,   63,   63,
			   63,   63,   63,   63,   63,   63,   63,   63,   79,   79,
			   79,   79,   79,   79,   79,  275,   79,   79,   79,  275,
			   79,   79,  146,  275,  146,  146,  146,  146,  146,  146,
			  146,  146,  146,  146,  146,  146,  275,  146,  146,  146,
			  146,  148,  148,  275,  148,  148,  148,  148,  275,  148,
			  148,  199,  199,  199,  199,  275,  275,  199,  199,  199,
			  275,  199,  199,  175,  175,  275,  175,  175,  175,  175,
			  175,  175,  175,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,    7,  275,  275,  275,  275,  275,  275,  275,

			  275,  275,  275,  275,  275,  275,  275,  275,  275,  275,
			  275,  275,  275,  275,  275,  275,  275,  275,  275,  275,
			  275,  275,  275,  275,  275,  275,  275,  275,  275,  275,
			  275,  275,  275,  275,  275,  275,  275,  275,  275,  275,
			  275,  275,  275,  275,  275,  275,  275,  275,  275,  275,
			  275,  275,  275,  275,  275,  275,  275,  275,  275,  275,
			  275,  275,  275,  275,  275,  275,  275,  275,  275,  275, yy_Dummy>>)
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
			   42,   34,   36,   36,  240,   43,    3,    4,   72,   42,
			   35,   44,   55,   42,   55,   14,   43,   23,   33,   65,
			   65,   65,   65,   65,   41,   44,   41,   51,  235,   43,
			   43,   96,   97,   96,   72,   35,   44,  234,   44,   41,
			   36,   39,   39,   39,   39,   39,   39,   73,   76,  116,
			   78,  116,   39,   39,   39,   39,   39,   39,   39,   39,
			   39,   39,   39,   39,   39,   39,   39,   39,   39,   39,
			   39,   39,  226,   73,   76,   78,   39,   39,   39,   39,

			   39,   39,   39,   39,   39,   39,   39,   39,   39,   39,
			   39,   39,   39,   39,   39,   39,   39,   50,   50,   97,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,  217,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   60,   60,  199,   60,   60,   60,

			   60,   60,   60,   60,   60,   60,   60,   60,   60,   60,
			   60,   60,   75,   75,   75,   75,   75,   60,   60,   60,
			   60,   60,   60,   66,   83,   66,   66,   66,   66,   66,
			   77,   77,   77,   77,   77,   80,   80,   83,   85,   66,
			   87,  245,  245,   60,   60,   60,   60,   67,   80,   67,
			  190,   89,   67,   67,   67,   67,   67,   84,   91,   84,
			   84,   84,   84,   84,   85,   66,   87,   88,   60,   60,
			   60,   62,   86,  185,  122,   62,   80,   89,  292,  292,
			  123,   90,  131,   91,   62,   62,   62,   62,   62,   92,
			   88,   86,  129,   88,  227,  227,  227,   84,   86,  122,

			   92,  149,  183,   88,   86,   90,  123,   90,  131,  137,
			   84,  110,  148,   92,   92,  183,   62,  129,   90,  110,
			  110,  110,  110,  110,  110,   62,  120,  120,  120,  120,
			  120,   62,  139,   62,  137,   62,   74,   74,   74,   74,
			   74,  118,  118,  118,  118,  118,  134,  225,  143,   74,
			  121,  121,  121,  121,  121,  118,   74,  119,  139,  119,
			  119,  119,  119,  119,   74,   74,  225,  125,  125,  125,
			  125,  125,  138,  119,  143,   74,  127,  127,  127,  127,
			  127,  118,   74,  201,  130,  138,  130,  205,  132,   74,
			  141,   74,   81,  125,  130,  142,  201,  138,  138,  119,

			  205,  135,  127,  135,  135,  135,  135,  135,  136,  142,
			  136,  136,  136,  136,  136,  141,  295,  295,  124,  130,
			  142,  115,  142,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   98,   98,  114,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,  128,  128,  128,  128,  128,   98,   98,   98,   98,
			   98,   98,  144,  140,  162,  163,  169,  176,  128,  178,
			  113,  128,  160,  209,  160,  213,  128,  160,  160,  160,
			  160,  160,   98,  140,   98,   98,  144,  112,  144,  140,

			  162,  163,  169,  176,  128,  178,  140,  128,  209,  144,
			  213,  128,  180,  154,  111,  177,  193,   98,   98,   98,
			  145,  154,  154,  154,  154,  154,  154,  164,  164,  164,
			  164,  164,  109,  145,  145,  145,  145,  145,  180,  177,
			  164,  177,  193,  108,  145,  145,  145,  145,  145,  107,
			  161,  161,  177,  161,  161,  161,  161,  161,  166,  166,
			  166,  166,  166,  106,  233,  101,  164,  161,   94,  145,
			  145,  145,  145,  145,  145,  146,  146,  233,  146,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  146,  146,
			  146,  146,  146,  161,  171,  171,  171,  171,  146,  146,

			  146,  146,  146,  146,  221,  221,  221,  221,  165,  165,
			  165,  165,  165,  167,  167,  167,  167,  167,  179,  202,
			  218,  165,  296,  296,  146,   82,  146,  146,  165,  170,
			  170,  170,  170,  170,  181,  179,  188,  188,  188,  188,
			  188,  297,  297,  181,  179,  202,  218,  165,  179,  146,
			  146,  146,   79,   64,  165,   63,  181,   59,  203,  223,
			  181,  184,  184,  184,  184,  184,  189,  189,  189,  189,
			  189,   57,  184,  184,  184,  184,  184,  191,  203,  191,
			  191,  191,  191,  191,  203,  223,  194,  194,  194,  194,
			  194,  203,   56,  191,   52,   47,   29,  184,  184,  184,

			  184,  184,  184,  194,   28,  195,  195,  195,  195,  195,
			  197,  197,  197,  197,  197,  211,  214,  211,   26,  191,
			  198,  198,  198,  198,  198,  211,   21,   20,  214,  194,
			  195,  208,  208,  208,  208,  208,  210,  210,  210,  210,
			  210,  214,  219,  219,  219,  219,  219,   12,   10,    7,
			  211,    0,  238,  238,  238,  195,  206,  206,  206,  206,
			  206,  220,  220,  220,  220,  220,    0,  206,  206,  206,
			  206,  206,  230,  230,  230,  230,  230,  253,  253,  253,
			  253,  224,  231,  231,  231,  231,  231,  238,    0,    0,
			  224,    0,  206,  206,  206,  206,  206,  206,  215,  215,

			  215,  215,  215,  224,    0,    0,    0,  224,    0,  215,
			  215,  215,  215,  215,  236,  236,  236,  236,  236,  237,
			  237,  237,  237,  237,  241,  241,  241,  241,  241,  242,
			  242,  242,  242,  242,  215,  215,  215,  215,  215,  215,
			  243,  243,  243,  243,  243,  246,  246,  246,  246,  246,
			  247,    0,  247,    0,    0,  247,  247,  247,  247,  247,
			  248,  248,  248,  248,  248,  249,  249,  249,  249,  249,
			  250,    0,  250,  251,  251,  251,  251,  251,    0,    0,
			  250,  261,  261,  261,  261,  247,  252,  252,  252,  252,
			  252,  255,  255,  255,  255,  255,  256,  256,  256,  256,

			  256,  258,    0,  258,    0,  250,  257,  257,  257,  257,
			  257,  258,  259,  259,  259,  259,  259,  260,  260,  260,
			  260,  260,  263,  263,  263,  263,  263,  264,  264,  264,
			  264,  264,  266,  266,  266,    0,  258,  265,  265,  265,
			  265,  265,  267,  267,  267,  267,  267,  268,  268,  268,
			  268,  268,  269,  269,  269,  269,  269,  271,  271,  271,
			  271,  271,    0,  272,    0,  272,    0,  266,  272,  272,
			  272,  272,  272,  273,  273,  273,  273,  273,  274,  274,
			  274,  274,  274,  280,  280,    0,    0,  280,  280,  280,
			    0,  280,  280,    0,    0,    0,    0,    0,  272,  276,

			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  278,    0,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,    0,  278,  278,  278,  278,  279,    0,  279,  279,
			  279,  279,  279,  279,  279,  279,  279,  279,  279,  279,
			  279,  279,  279,  279,  279,  281,  281,  281,  281,  281,
			  281,    0,    0,  281,  281,  281,    0,  281,  281,  282,
			  282,  282,  282,  282,  282,  282,  282,  282,  282,  282,

			  282,  282,  282,  282,  282,  282,  283,    0,  283,  283,
			  283,  283,  283,  283,  283,  283,  283,  283,  283,  283,
			    0,  283,  283,  283,  283,  284,  284,  284,  284,  284,
			  284,  284,  284,  284,  284,  284,  284,  284,  284,  284,
			  284,  284,    0,  284,  285,  285,  285,  285,  285,  285,
			  285,  285,  285,  285,  285,  285,  285,  285,  285,  285,
			  285,  286,    0,  286,  286,  286,  286,  286,  286,  286,
			  286,  286,  286,  286,  286,  286,  286,  286,  286,  286,
			  287,    0,  287,  287,  287,  287,  287,  287,  287,  287,
			  287,  287,  287,  287,  287,  287,  287,  287,  287,  288,

			  288,  288,  288,  288,  288,  288,  288,  288,  288,  288,
			  288,  288,  288,  288,  288,  288,  288,  288,  289,  289,
			  289,  289,  289,  289,  289,    0,  289,  289,  289,    0,
			  289,  289,  290,    0,  290,  290,  290,  290,  290,  290,
			  290,  290,  290,  290,  290,  290,    0,  290,  290,  290,
			  290,  291,  291,    0,  291,  291,  291,  291,    0,  291,
			  291,  293,  293,  293,  293,    0,    0,  293,  293,  293,
			    0,  293,  293,  294,  294,    0,  294,  294,  294,  294,
			  294,  294,  294,  294,  294,  294,  294,  294,  294,  294,
			  294,  294,  275,  275,  275,  275,  275,  275,  275,  275,

			  275,  275,  275,  275,  275,  275,  275,  275,  275,  275,
			  275,  275,  275,  275,  275,  275,  275,  275,  275,  275,
			  275,  275,  275,  275,  275,  275,  275,  275,  275,  275,
			  275,  275,  275,  275,  275,  275,  275,  275,  275,  275,
			  275,  275,  275,  275,  275,  275,  275,  275,  275,  275,
			  275,  275,  275,  275,  275,  275,  275,  275,  275,  275,
			  275,  275,  275,  275,  275,  275,  275,  275,  275,  275, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   75,   76,   11,   12,  849, 1392,   88,
			  845, 1392,  841, 1392,   84, 1392, 1392, 1392, 1392, 1392,
			  811,  809, 1392,   78, 1392, 1392,  791, 1392,  777,  767,
			    0,   50,   43,   93,   50,   87,  106, 1392, 1392,  142,
			   34,   89,   63,   79,   88,    0, 1392,  789,  106, 1392,
			  216,   96,  717,    0, 1392,  130,  789,  765, 1392,  747,
			  293,    0,  365,  752,  736,  120,  306,  333, 1392, 1392,
			 1392,    0,   90,  133,  417,  293,  135,  311,  124,  728,
			  324,  468,  707,  267,  340,  300,  334,  306,  333,  318,
			  348,  312,  343,    0,  662, 1392,  149,  146,  542, 1392,

			 1392,  588, 1392,    0, 1392, 1392,  590,  624,  633,  622,
			  401,  604,  587,  570,  535,  511,  167, 1392,  422,  440,
			  407,  431,  330,  343,  473,  448,    0,  457,  542,  349,
			  470,  349,  464, 1392,  428,  484,  491,  365,  428,  395,
			  536,  447,  452,  415,  539,  614,  674,    0,  387,  391,
			 1392, 1392, 1392, 1392,  603, 1392, 1392, 1392, 1392, 1392,
			  568,  634,  541,  535,  608,  689,  639,  694,    0,  528,
			  710,  675,    0,    0,    0,    0,  544,  582,  539,  678,
			  564,  686,    0,  345,  742,  367,    0, 1392,  717,  747,
			  331,  760,    0,  579,  767,  786,    0,  791,  801,  244,

			    0,  426,  682,  721,    0,  430,  837,    0,  812,  538,
			  817,  801, 1392,  540,  771,  879,    0,  251,  672,  823,
			  842,  685, 1392,  711,  833,  441,  167,  375,    0, 1392,
			  853,  863,    0,  607,  151,  138,  895,  900,  838, 1392,
			   79,  905,  910,  921, 1392,  322,  926,  936,  941,  946,
			  956,  954,  967,  858, 1392,  972,  977,  987,  987,  993,
			  998,  962, 1392, 1003, 1008, 1018, 1018, 1023, 1028, 1033,
			 1392, 1038, 1049, 1054, 1059, 1392, 1098, 1117, 1136, 1155,
			 1075, 1171, 1188, 1205, 1224, 1243, 1260, 1279, 1298, 1314,
			 1331, 1343,  370, 1355, 1372,  508,  714,  733, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  275,    1,  276,  276,  277,  277,  275,  275,  275,
			  275,  275,  278,  275,  279,  275,  275,  275,  275,  275,
			  275,  275,  275,  275,  275,  275,  275,  275,  275,  275,
			  280,  280,  280,  280,  280,  280,  281,  275,  275,  275,
			   39,   39,   39,   39,   39,  282,  275,  283,  275,  275,
			  275,  275,  284,  285,  275,  275,  275,  278,  275,  286,
			  287,  286,  286,  288,  275,  275,  275,  275,  275,  275,
			  275,  280,  280,  280,  280,  280,  280,  280,  280,  289,
			  281,   39,  275,   39,   39,   81,   39,   81,   39,   81,
			   39,   81,   39,  282,  283,  275,  275,  283,  290,  275,

			  275,  284,  275,  285,  275,  275,  275,  291,  275,  275,
			  275,  275,  275,  275,  275,  275,  275,  275,  275,  275,
			  275,  275,  280,  280,  280,  280,  280,  280,  280,  280,
			  280,  280,  275,  275,  275,  275,   81,   81,   39,   81,
			   39,   81,   39,   81,   39,  283,  290,  292,  291,  275,
			  275,  275,  275,  275,  275,  275,  275,  275,  275,  275,
			  275,  275,  280,  280,  280,  280,  280,  280,  280,  280,
			  275,  275,  280,  280,  293,  294,   81,   39,   81,   39,
			   81,   39,   81,   39,  145,  283,  295,  275,  275,  275,
			  275,  275,  280,  280,  128,  280,  280,  275,  275,  293,

			   81,   39,   81,   39,   81,   39,  184,  296,  275,  280,
			  275,  275,  275,   81,   39,  206,  297,  275,  280,  275,
			  275,  275,  275,   81,   39,  283,  275,  275,  280,  275,
			  275,  275,   81,   39,  283,  275,  275,  275,  275,  275,
			  275,  275,  275,  275,  275,  275,  275,  275,  275,  275,
			  275,  275,  275,  275,  275,  275,  275,  275,  275,  275,
			  275,  275,  275,  275,  275,  275,  275,  275,  275,  275,
			  275,  275,  275,  275,  275,    0,  275,  275,  275,  275,
			  275,  275,  275,  275,  275,  275,  275,  275,  275,  275,
			  275,  275,  275,  275,  275,  275,  275,  275, yy_Dummy>>)
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
			    8,    8,    8,    9,   10,   11,    1,    1,    3,    1,
			    8,    8,    8,    8,    8,   12,   12,   12,   12,   12,
			   12,   12,   12,   12,   12,   12,   12,   12,   13,   14,
			    1,   15,    1,    1,   16,    8,    8,    8,    8,    8,
			    8,   12,   12,   12,   12,   12,   12,   12,   12,   12,
			   12,   12,   12,   12,   17,   18,    1,   19, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,   83,   81,    1,
			    2,   14,   59,   17,   81,   15,   16,    7,    6,   12,
			    5,   10,    8,   54,   13,   11,   26,   23,   27,   19,
			   49,   49,   49,   48,   49,   49,   21,   22,    9,   50,
			   50,   50,   50,   50,   50,   51,   20,   64,   65,   66,
			   64,   67,   82,   52,   53,    1,    2,   59,   58,   79,
			   79,   79,   79,    3,   28,    0,   54,    0,   25,   24,
			   18,   49,   49,   49,   49,   47,   49,   49,   49,    0,
			    0,   50,    0,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   51,   64,   66,   65,   64,   64,   61,

			   60,    0,   53,   52,   79,   68,   79,   79,   79,   79,
			   79,   79,   79,   79,   79,   79,    4,   29,   56,   54,
			    0,   55,   49,   49,   48,   48,   46,   48,   49,   49,
			   43,   49,    0,   36,    0,   37,   37,   50,   50,   50,
			   50,   50,   50,   50,   50,   64,   64,    0,    0,    0,
			   75,   73,   76,   80,   80,   74,   72,   69,   70,   71,
			    0,   54,   49,   49,   49,   49,   47,   47,   47,   49,
			    0,    0,   43,   30,    0,   34,   50,   50,   50,   50,
			   50,   50,   30,   30,   64,   62,    0,   77,    0,   57,
			    0,   54,   31,   49,   49,   49,   33,    0,    0,    0,

			   31,   31,   50,   50,   33,   33,   64,    0,    0,   49,
			    0,   42,   35,   50,   50,   64,    0,   45,   49,    0,
			    0,    0,   42,   50,   50,   64,    0,    0,   32,   43,
			    0,    0,   32,   32,   63,    0,    0,    0,   41,   78,
			   44,    0,    0,    0,   41,    0,    0,   41,    0,    0,
			   40,    0,    0,    0,   40,    0,    0,    0,   39,    0,
			    0,    0,   39,    0,    0,    0,   38,    0,    0,    0,
			   38,    0,   38,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 1392
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 275
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 276
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
