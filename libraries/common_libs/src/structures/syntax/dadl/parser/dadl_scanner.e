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
if yy_act <= 36 then
if yy_act <= 18 then
if yy_act <= 9 then
if yy_act <= 5 then
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
end
else
if yy_act <= 7 then
if yy_act = 6 then
	yy_position := yy_position + 1
--|#line 67 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 67")
end
last_token := Plus_code
else
	yy_position := yy_position + 1
--|#line 68 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 68")
end
last_token := Star_code
end
else
if yy_act = 8 then
	yy_position := yy_position + 1
--|#line 69 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 69")
end
last_token := Slash_code
else
	yy_position := yy_position + 1
--|#line 70 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 70")
end
last_token := Caret_code
end
end
end
else
if yy_act <= 14 then
if yy_act <= 12 then
if yy_act <= 11 then
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
else
	yy_position := yy_position + 1
--|#line 73 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 73")
end
last_token := Comma_code
end
else
if yy_act = 13 then
	yy_position := yy_position + 1
--|#line 74 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 74")
end
last_token := Colon_code
else
	yy_position := yy_position + 1
--|#line 75 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 75")
end
last_token := Exclamation_code
end
end
else
if yy_act <= 16 then
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
else
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
end
end
end
else
if yy_act <= 27 then
if yy_act <= 23 then
if yy_act <= 21 then
if yy_act <= 20 then
if yy_act = 19 then
	yy_position := yy_position + 1
--|#line 80 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 80")
end
last_token := Question_mark_code
else
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
		
end
else
	yy_position := yy_position + 1
--|#line 92 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 92")
end
last_token := Left_bracket_code
end
else
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
end
else
if yy_act <= 25 then
if yy_act = 24 then
	yy_position := yy_position + 2
--|#line 97 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 97")
end
last_token := SYM_GE
else
	yy_position := yy_position + 2
--|#line 98 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 98")
end
last_token := SYM_LE
end
else
if yy_act = 26 then
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
end
else
if yy_act <= 32 then
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
else
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
end
end
end
else
if yy_act <= 54 then
if yy_act <= 45 then
if yy_act <= 41 then
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

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 163 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 163")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
end
else
if yy_act = 40 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 168 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 168")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 175 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 175")
end
				-- beginning of CADL block
				in_buffer.append_string (text)
				set_start_condition (IN_CADL_BLOCK)
				cadl_depth := 1
			
end
end
else
if yy_act <= 43 then
if yy_act = 42 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 180 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 180")
end
		-- got an open brace
				in_buffer.append_string (text)
				cadl_depth := cadl_depth + 1
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 184 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 184")
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
else
if yy_act = 44 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 200 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 200")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 201 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 201")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
end
end
else
if yy_act <= 50 then
if yy_act <= 48 then
if yy_act <= 47 then
if yy_act = 46 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 208 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 208")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 209 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 209")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 216 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 216")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 49 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 221 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 221")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
else
	yy_position := yy_position + 2
--|#line 227 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 227")
end
in_buffer.append_character ('\')
end
end
else
if yy_act <= 52 then
if yy_act = 51 then
	yy_position := yy_position + 2
--|#line 229 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 229")
end
in_buffer.append_character ('"')
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 231 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 231")
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
else
if yy_act = 53 then
	yy_position := yy_position + 8
--|#line 246 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 246")
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
--|#line 261 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 261")
end
in_buffer.append_string (text)
end
end
end
end
else
if yy_act <= 63 then
if yy_act <= 59 then
if yy_act <= 57 then
if yy_act <= 56 then
if yy_act = 55 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 263 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 263")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_string (text)
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 268 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 268")
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
--|#line 279 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 279")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
else
if yy_act = 58 then
	yy_position := yy_position + 3
--|#line 287 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 287")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
	yy_position := yy_position + 4
--|#line 288 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 288")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
end
else
if yy_act <= 61 then
if yy_act = 60 then
	yy_position := yy_position + 4
--|#line 289 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 289")
end
last_token := V_CHARACTER; last_character_value := '%R'
else
	yy_position := yy_position + 4
--|#line 290 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 290")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 62 then
	yy_position := yy_position + 4
--|#line 291 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 291")
end
last_token := V_CHARACTER; last_character_value := '%F'
else
	yy_position := yy_position + 4
--|#line 292 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 292")
end
last_token := V_CHARACTER; last_character_value := '%''
end
end
end
else
if yy_act <= 68 then
if yy_act <= 66 then
if yy_act <= 65 then
if yy_act = 64 then
	yy_position := yy_position + 4
--|#line 293 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 293")
end
last_token := V_CHARACTER; last_character_value := '%H'
else
	yy_position := yy_position + 4
--|#line 294 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 294")
end
last_token := V_CHARACTER; last_character_value := '"'
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 295 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 295")
end

						code_ := text_substring (4, text_count - 1).to_integer
						last_token := V_CHARACTER
						last_character_value := code_.to_character
				
end
else
if yy_act = 67 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 300 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 300")
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
			
else
	yy_position := yy_position + 10
--|#line 310 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 310")
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
			
end
end
else
if yy_act <= 70 then
if yy_act = 69 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 321 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 321")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 322 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 322")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 71 then
	yy_position := yy_position + 1
--|#line 326 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 326")
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
			   24,   25,   26,   27,   28,   29,   30,   30,   30,   30,
			   31,   30,   30,   32,   30,   30,   30,   33,   34,   30,
			   30,   35,   30,   30,   36,    8,   37,   38,    8,   39,
			   40,   40,   40,   40,   41,   40,   40,   42,   40,   40,
			   40,   43,   40,   40,   44,   40,   40,   40,   45,   46,
			    8,   48,   48,   72,   49,   49,   75,   50,   50,   53,
			   53,   54,   54,   55,   73,   55,   60,   61,   65,   76,
			   66,   81,   77,   77,   83,  126,   72,   77,   77,   75,

			   67,  119,  201,   89,   81,   94,  196,   94,   73,  190,
			  175,   87,   76,   51,   51,   81,   97,   84,  126,   81,
			   81,   55,   62,   55,   67,  119,   90,  207,   81,   77,
			   79,   80,   81,   81,   88,  138,   93,   79,   79,   79,
			   79,   79,   79,   79,   79,   79,   79,   79,   79,   79,
			   79,   79,   79,   79,   79,   98,  206,  120,  138,   79,
			   81,   81,   82,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   82,   81,   81,   81,   85,
			  117,  120,  117,   81,  192,  118,  125,   94,   81,   94,
			  147,  114,   93,  114,   81,  130,   81,  130,  148,  149,

			  130,   81,  131,   86,  178,  178,   93,   81,   92,   92,
			  125,   92,   92,   93,   95,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   92,  140,   92,   92,   92,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   92,   92,   92,  102,  102,
			  176,  102,  102,  102,  104,  102,  102,  103,  102,  102,
			  102,  102,  102,  102,  102,  102,  105,  102,  102,  102,

			  102,  102,  102,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  102,  102,  102,  102,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  102,  102,  102,  106,  132,
			  134,   74,  107,   65,  136,   66,  156,   77,   77,  134,
			  121,  108,  157,   81,  122,   67,  127,  123,   81,  130,
			  144,  131,  124,  132,  134,  136,   81,  132,  136,  156,
			   81,   81,  161,  135,  121,  165,  157,  109,  122,   67,
			  162,  123,  128,   81,   81,  124,  110,   81,  169,  137,

			  138,  133,  111,   81,  112,  161,  113,   81,  165,   81,
			   81,  147,  174,  177,  162,  177,   81,  164,  178,  148,
			  149,  169,   81,  139,   92,   92,  163,   92,   92,   93,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,  141,   92,   92,   92,   92,   92,   92,  141,
			  141,  141,  141,  141,  141,  141,  141,  141,  141,  141,
			  141,  141,  141,  141,  141,  141,  141,   92,  160,   92,
			   92,  141,  141,  141,  141,  141,  141,  141,  141,  141,
			  141,  141,  141,  141,  141,  141,  141,  141,  141,  141,
			  141,   92,   92,   92,  116,  165,  167,  171,  167,  158,

			  169,   81,  171,  179,  155,  159,   81,  180,   71,  181,
			  158,  183,   81,  160,   81,  118,   81,  185,  166,   81,
			  167,  171,  168,  170,   81,   81,  172,  179,  155,   81,
			  159,  180,   71,  181,  124,  183,  118,   81,   93,   71,
			   93,  185,  183,   71,  187,  154,  191,  193,  187,  153,
			  185,  173,  197,  198,  152,  205,   81,  124,  173,  173,
			  173,  173,  173,   71,   81,   81,  184,   71,  187,   81,
			  191,  193,  188,  193,  186,  197,  198,   81,   81,  198,
			  151,  173,  173,  173,  173,  173,  173,   93,  202,   81,
			  203,   81,  150,  146,  145,  203,  144,  194,  142,  100,

			  189,   93,  199,   81,   81,  129,  127,  189,  189,  189,
			  189,  189,  202,  116,  203,  115,   81,   71,  114,  204,
			   71,   71,   71,  103,   71,   71,   58,   56,  100,   93,
			  189,  189,  189,  189,  189,  189,   93,   74,   70,   78,
			   78,   78,   78,   78,   69,   68,   78,   78,   78,  195,
			   78,   78,   64,   63,   58,   56,  195,  195,  195,  195,
			  195,   79,  208,  208,   79,   79,   79,  208,   79,   79,
			  143,  208,  143,  143,  143,  143,  208,  143,  143,  195,
			  195,  195,  195,  195,  195,   93,  182,  182,  182,  208,
			  208,  182,  182,  182,  208,  182,  182,  208,  200,  208,

			  208,  208,  208,  208,  208,  200,  200,  200,  200,  200,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  200,  200,
			  200,  200,  200,  200,   47,   47,   47,   47,   47,   47,
			   47,   47,   47,   47,   47,   47,   47,   47,   47,   47,
			   47,   47,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   57,  208,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,  208,   57,   57,   57,   57,   59,  208,
			   59,   59,   59,   59,   59,   59,   59,   59,   59,   59,

			   59,   59,   59,   59,   59,   59,   91,   91,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,   91,   91,   91,
			   91,   91,   92,  208,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,  208,   92,   92,   92,   92,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,  208,   99,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  102,  208,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,   63,   63,   63,   63,   63,   63,   63,   63,

			   63,   63,   63,   63,   63,   63,   63,   63,   63,   63,
			   77,   77,   77,   77,   77,   77,  208,   77,   77,   77,
			  208,   77,   77,  164,  164,  208,  164,  164,  164,  164,
			  164,  164,  164,  164,  164,  164,  164,  164,  164,  164,
			  164,    7,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,

			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208, yy_Dummy>>)
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
			    1,    3,    4,   31,    3,    4,   34,    3,    4,    5,
			    6,    5,    6,    9,   32,    9,   14,   14,   23,   35,
			   23,   40,   36,   36,   41,   76,   31,   36,   36,   34,

			   23,   72,  229,   44,   40,   48,  228,   48,   32,  227,
			  224,   43,   35,    3,    4,   44,   51,   41,   76,   41,
			   43,   55,   14,   55,   23,   72,   44,  206,   44,   36,
			   39,   39,   41,   43,   43,   89,  205,   39,   39,   39,
			   39,   39,   39,   39,   39,   39,   39,   39,   39,   39,
			   39,   39,   39,   39,   39,   51,  201,   73,   89,   39,
			   39,   39,   39,   39,   39,   39,   39,   39,   39,   39,
			   39,   39,   39,   39,   39,   39,   39,   39,   39,   42,
			   67,   73,   67,   81,  182,   67,   75,   94,  172,   94,
			  108,  114,   95,  114,   42,  130,   81,  130,  108,  108,

			  131,  172,  131,   42,  178,  177,  174,   42,   50,   50,
			   75,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   95,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   60,   60,
			  144,   60,   60,   60,   60,   60,   60,   60,   60,   60,
			   60,   60,   60,   60,   60,   60,   60,   60,   60,   60,

			   60,   60,   60,   60,   60,   60,   60,   60,   60,   60,
			   60,   60,   60,   60,   60,   60,   60,   60,   60,   60,
			   60,   60,   60,   60,   60,   60,   60,   60,   60,   60,
			   60,   60,   60,   60,   60,   60,   60,   60,   60,   60,
			   60,   60,   60,   60,   60,   60,   60,   60,   62,   83,
			   85,   74,   62,   66,   87,   66,  119,   78,   78,   86,
			   74,   62,  120,  184,   74,   66,   78,   74,  188,   82,
			  143,   82,   74,   83,   85,   88,  184,   84,   87,  119,
			   86,  188,  125,   86,   74,  132,  120,   62,   74,   66,
			  126,   74,   78,   86,   84,   74,   62,   88,  136,   88,

			   90,   84,   62,   82,   62,  125,   62,   84,  132,   90,
			   88,  149,  141,  155,  126,  155,   82,  129,  155,  149,
			  149,  136,   90,   90,   96,   96,  127,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,  123,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,  116,  133,  134,  138,  135,  158,

			  137,  204,  139,  156,  116,  122,  133,  157,  158,  161,
			  121,  165,  137,  160,  204,  118,  135,  167,  133,  133,
			  134,  138,  135,  137,  139,  137,  139,  156,  116,  135,
			  159,  157,  158,  161,  160,  165,  117,  139,  140,  159,
			  200,  167,  166,  159,  169,  113,  180,  185,  170,  112,
			  168,  140,  191,  193,  111,  200,  170,  160,  140,  140,
			  140,  140,  140,  159,  166,  168,  166,  159,  169,  170,
			  180,  185,  170,  186,  168,  191,  193,  166,  168,  194,
			  110,  140,  140,  140,  140,  140,  140,  173,  197,  194,
			  198,  186,  109,  107,  106,  199,  105,  186,  104,   99,

			  173,   92,  194,  199,  186,   80,   77,  173,  173,  173,
			  173,  173,  197,   65,  198,   64,  199,  213,   63,  199,
			  213,  213,  213,   59,  213,  213,   57,   56,   52,   47,
			  173,  173,  173,  173,  173,  173,  189,   33,   29,  214,
			  214,  214,  214,  214,   28,   26,  214,  214,  214,  189,
			  214,  214,   21,   20,   12,   10,  189,  189,  189,  189,
			  189,  222,    7,    0,  222,  222,  222,    0,  222,  222,
			  223,    0,  223,  223,  223,  223,    0,  223,  223,  189,
			  189,  189,  189,  189,  189,  195,  225,  225,  225,    0,
			    0,  225,  225,  225,    0,  225,  225,    0,  195,    0,

			    0,    0,    0,    0,    0,  195,  195,  195,  195,  195,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  195,  195,
			  195,  195,  195,  195,  209,  209,  209,  209,  209,  209,
			  209,  209,  209,  209,  209,  209,  209,  209,  209,  209,
			  209,  209,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  211,    0,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,    0,  211,  211,  211,  211,  212,    0,
			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,

			  212,  212,  212,  212,  212,  212,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  216,    0,  216,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,    0,  216,  216,  216,  216,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,    0,  217,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  219,    0,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  220,  220,  220,  220,  220,  220,  220,  220,

			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  221,  221,  221,  221,  221,  221,    0,  221,  221,  221,
			    0,  221,  221,  226,  226,    0,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,

			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   68,   69,   11,   12,  662,  941,   81,
			  652,  941,  648,  941,   77,  941,  941,  941,  941,  941,
			  637,  635,  941,   71,  941,  941,  622,  941,  621,  613,
			    0,   47,   48,  618,   34,   50,   81,  941,  941,  111,
			   40,   68,  143,   69,   64,    0,  941,  623,  103,  941,
			  207,  110,  558,    0,  941,  119,  624,  620,  941,  613,
			  277,    0,  342,  615,  598,  594,  336,  166,  941,  941,
			  941,    0,   67,  127,  332,  157,   53,  586,  346,    0,
			  587,  132,  352,  315,  343,  320,  329,  325,  346,   93,
			  358,    0,  595,  941,  185,  186,  423,  941,  941,  529,

			  941,    0,  941,  941,  532,  575,  584,  583,  180,  582,
			  570,  544,  539,  535,  189,  941,  475,  517,  496,  316,
			  329,  491,  486,  449,    0,  343,  361,  406,  941,  399,
			  178,  183,  345,  455,  463,  465,  359,  461,  468,  473,
			  532,  391,    0,  349,  270,  941,  941,  941,  941,  401,
			  941,  941,  941,  941,  941,  399,  474,  471,  480,  511,
			  494,  466,    0,    0,    0,  482,  513,  481,  514,  501,
			  505,    0,  137,  581,  200,    0,  941,  186,  185,    0,
			  513,    0,  138,    0,  312,  514,  540,    0,  317,  630,
			    0,  511,  941,  512,  538,  679,    0,  545,  547,  552,

			  534,  135,    0,    0,  450,  130,  117,  941,  941,  733,
			  751,  769,  787,  609,  635,  805,  821,  839,  857,  873,
			  891,  906,  653,  662,  102,  680,  922,  101,   98,   94, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  208,    1,  209,  209,  210,  210,  208,  208,  208,
			  208,  208,  211,  208,  212,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  213,  213,  213,  213,  213,  213,  214,  208,  208,  208,
			   39,   39,   39,   39,   39,  215,  208,  216,  208,  208,
			  208,  208,  217,  218,  208,  208,  208,  211,  208,  219,
			  208,  219,  219,  220,  208,  208,  208,  208,  208,  208,
			  208,  213,  213,  213,  213,  213,  213,  221,  214,  222,
			  208,   39,   39,  222,   39,  222,   39,  222,   39,  222,
			   39,  215,  216,  208,  208,  216,  208,  208,  208,  217,

			  208,  218,  208,  208,  208,  223,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  213,
			  213,  213,  213,  213,  213,  213,  213,  208,  208,  208,
			  208,  222,  222,   39,  222,   39,  222,   39,  222,   39,
			  216,   96,  224,  223,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  213,  213,   74,   74,
			  213,  213,  213,  225,  226,  222,   39,  222,   39,  222,
			   39,  222,   39,  216,  216,  227,  208,  208,  208,  213,
			  213,  213,  225,  222,   39,  222,   39,  222,   39,  216,
			  228,  213,  208,  222,   39,  216,  229,  213,  222,   39,

			  216,  208,  213,  222,   39,  216,  208,  208,    0,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    2,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    4,    5,    6,    7,    8,    1,    9,   10,
			   11,   12,   13,   14,   15,   16,   17,   18,   19,   19,
			   19,   19,   19,   19,   19,   19,   19,   19,   20,   21,
			   22,   23,   24,   25,    1,   26,   27,   27,   28,   29,
			   30,   31,   32,   33,   31,   31,   34,   35,   36,   31,
			   37,   38,   39,   40,   41,   42,   31,   31,   31,   43,
			   31,   44,   45,   46,   47,   48,    1,   49,   50,   51,

			   52,   53,   54,   55,   56,   57,   55,   55,   58,   59,
			   60,   55,   55,   61,   62,   63,   64,   65,   55,   55,
			   66,   67,   55,   68,   69,   70,    1,    1,    1,    1,
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
			    9,   10,    1,    1,    3,    1,    8,    8,    8,    8,
			    8,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   12,   13,    1,   14,    1,    1,   15,    8,
			    8,    8,    8,    8,    8,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   16,   17,    1,
			   18, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,   73,   71,    1,
			    2,   14,   49,   17,   71,   15,   16,    7,    6,   12,
			    5,   10,    8,   44,   13,   11,   26,   23,   27,   19,
			   39,   39,   39,   38,   39,   39,   21,   22,    9,   40,
			   40,   40,   40,   40,   40,   41,   20,   54,   55,   56,
			   54,   57,   72,   42,   43,    1,    2,   49,   48,   69,
			   69,   69,   69,    3,   28,    0,   44,    0,   25,   24,
			   18,   39,   39,   39,   39,   39,   39,    0,    0,   40,
			    0,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   41,   54,   56,   55,   54,   54,   51,   50,    0,

			   43,   42,   69,   58,   69,   69,   69,   69,   69,   69,
			   69,   69,   69,   69,    4,   29,   46,    0,   45,   39,
			   39,   38,   38,   38,   38,   39,   39,    0,   36,    0,
			   37,   37,   40,   40,   40,   40,   40,   40,   40,   40,
			   54,   54,    0,    0,    0,   65,   63,   66,   70,   70,
			   64,   62,   59,   60,   61,    0,   39,   39,   39,   39,
			   39,   39,   30,    0,   34,   40,   40,   40,   40,   40,
			   40,   30,   30,   54,   52,    0,   67,    0,   47,   31,
			   39,   33,    0,   31,   31,   40,   40,   33,   33,   54,
			    0,   39,   35,   40,   40,   54,    0,   39,   40,   40,

			   54,    0,   32,   32,   32,   53,    0,   68,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 941
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 208
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 209
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

	yyNb_rules: INTEGER is 72
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 73
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
