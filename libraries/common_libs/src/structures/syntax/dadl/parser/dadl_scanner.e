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
if yy_act <= 40 then
if yy_act <= 20 then
if yy_act <= 10 then
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
if yy_act <= 8 then
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
	yy_position := yy_position + 1
--|#line 69 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 69")
end
last_token := Slash_code
end
else
if yy_act = 9 then
	yy_position := yy_position + 1
--|#line 70 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 70")
end
last_token := Caret_code
else
	yy_position := yy_position + 1
--|#line 71 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 71")
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
--|#line 72 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 72")
end
last_token := Semicolon_code
else
	yy_position := yy_position + 1
--|#line 73 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 73")
end
last_token := Comma_code
end
else
	yy_position := yy_position + 1
--|#line 74 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 74")
end
last_token := Colon_code
end
else
if yy_act = 14 then
	yy_position := yy_position + 1
--|#line 75 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 75")
end
last_token := Exclamation_code
else
	yy_position := yy_position + 1
--|#line 76 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 76")
end
last_token := Left_parenthesis_code
end
end
else
if yy_act <= 18 then
if yy_act <= 17 then
if yy_act = 16 then
	yy_position := yy_position + 1
--|#line 77 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 77")
end
last_token := Right_parenthesis_code
else
	yy_position := yy_position + 1
--|#line 78 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 78")
end
last_token := Dollar_code
end
else
	yy_position := yy_position + 2
--|#line 79 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 79")
end
last_token := SYM_DT_UNKNOWN
end
else
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
--|#line 92 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 92")
end
last_token := Left_bracket_code
else
	yy_position := yy_position + 1
--|#line 93 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 93")
end
last_token := Right_bracket_code
end
else
	yy_position := yy_position + 1
--|#line 95 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 95")
end
last_token := SYM_EQ
end
else
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
end
else
if yy_act <= 28 then
if yy_act <= 27 then
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
else
	yy_position := yy_position + 2
--|#line 118 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 118")
end
last_token := SYM_ELLIPSIS
end
else
if yy_act = 29 then
	yy_position := yy_position + 3
--|#line 119 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 119")
end
last_token := SYM_LIST_CONTINUE
else
	yy_position := yy_position + 4
--|#line 123 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 123")
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
else
	yy_position := yy_position + 5
--|#line 130 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 130")
end
last_token := SYM_QUERY_FUNC
end
else
if yy_act = 34 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 133 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 133")
end

	last_token := V_URI
	last_string_value := text

else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 139 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 139")
end

					last_token := V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
end
else
if yy_act <= 38 then
if yy_act <= 37 then
if yy_act = 36 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 144 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 144")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 150 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 150")
end

					last_token := V_LOCAL_CODE
					last_string_value := text
			
end
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
if yy_act = 39 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 158 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 158")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 159 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 159")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
end
end
end
end
else
if yy_act <= 60 then
if yy_act <= 50 then
if yy_act <= 45 then
if yy_act <= 43 then
if yy_act <= 42 then
if yy_act = 41 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 166 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 166")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 167 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 167")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
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
if yy_act = 44 then
	yy_position := yy_position + 10
--|#line 175 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 175")
end

-- [0-9]{4} { -- can't handle year only, since it will be confused with plain integer
				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
	yy_position := yy_position + 7
--|#line 176 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 176")
end

-- [0-9]{4} { -- can't handle year only, since it will be confused with plain integer
				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
end
else
if yy_act <= 48 then
if yy_act <= 47 then
if yy_act = 46 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 184 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 184")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 190 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 190")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 195 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 195")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
end
else
if yy_act = 49 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 202 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 202")
end
				-- beginning of CADL block
				in_buffer.append_string (text)
				set_start_condition (IN_CADL_BLOCK)
				cadl_depth := 1
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 207 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 207")
end
		-- got an open brace
				in_buffer.append_string (text)
				cadl_depth := cadl_depth + 1
			
end
end
end
else
if yy_act <= 55 then
if yy_act <= 53 then
if yy_act <= 52 then
if yy_act = 51 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 211 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 211")
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
--|#line 227 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 227")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 228 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 228")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
else
if yy_act = 54 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 235 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 235")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 236 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 236")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
end
else
if yy_act <= 58 then
if yy_act <= 57 then
if yy_act = 56 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 243 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 243")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 248 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 248")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
end
else
	yy_position := yy_position + 2
--|#line 254 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 254")
end
in_buffer.append_character ('\')
end
else
if yy_act = 59 then
	yy_position := yy_position + 2
--|#line 256 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 256")
end
in_buffer.append_character ('"')
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 258 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 258")
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
if yy_act <= 70 then
if yy_act <= 65 then
if yy_act <= 63 then
if yy_act <= 62 then
if yy_act = 61 then
	yy_position := yy_position + 8
--|#line 273 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 273")
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
--|#line 288 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 288")
end
in_buffer.append_string (text)
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 290 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 290")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
else
if yy_act = 64 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 295 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 295")
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
--|#line 306 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 306")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
end
else
if yy_act <= 68 then
if yy_act <= 67 then
if yy_act = 66 then
	yy_position := yy_position + 3
--|#line 314 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 314")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
	yy_position := yy_position + 4
--|#line 315 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 315")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
else
	yy_position := yy_position + 4
--|#line 316 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 316")
end
last_token := V_CHARACTER; last_character_value := '%R'
end
else
if yy_act = 69 then
	yy_position := yy_position + 4
--|#line 317 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 317")
end
last_token := V_CHARACTER; last_character_value := '%T'
else
	yy_position := yy_position + 4
--|#line 318 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 318")
end
last_token := V_CHARACTER; last_character_value := '%F'
end
end
end
else
if yy_act <= 75 then
if yy_act <= 73 then
if yy_act <= 72 then
if yy_act = 71 then
	yy_position := yy_position + 4
--|#line 319 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 319")
end
last_token := V_CHARACTER; last_character_value := '%''
else
	yy_position := yy_position + 4
--|#line 320 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 320")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
else
	yy_position := yy_position + 4
--|#line 321 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 321")
end
last_token := V_CHARACTER; last_character_value := '"'
end
else
if yy_act = 74 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 322 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 322")
end

						code_ := text_substring (4, text_count - 1).to_integer
						last_token := V_CHARACTER
						last_character_value := code_.to_character
				
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 327 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 327")
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
if yy_act <= 78 then
if yy_act <= 77 then
if yy_act = 76 then
	yy_position := yy_position + 10
--|#line 337 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 337")
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
--|#line 348 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 348")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 349 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 349")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 79 then
	yy_position := yy_position + 1
--|#line 353 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 353")
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
			   83,   76,   79,   79,  246,   89,   51,   51,  122,   88,
			   78,   91,   55,   83,   55,   62,   83,   67,   75,  118,
			  118,  118,  118,  118,   86,   83,   83,  100,  240,   83,
			   90,   96,   95,   96,  122,   78,   92,   95,   83,   83,
			   79,   81,   81,   81,   81,   81,   82,  123,  129,  116,
			  131,  116,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,  236,  123,  129,  131,   81,   83,   83,   84,

			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83,
			   83,   83,   84,   83,   83,   83,   83,   94,   94,  145,
			   94,   94,   95,   97,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   94,  228,   94,   94,
			   94,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   94,   94,   94,  104,  104,  213,  104,  104,  104,

			  106,  104,  104,  105,  104,  104,  104,  104,  104,  104,
			  104,  104,  128,  128,  128,  128,  128,  104,  104,  104,
			  104,  104,  104,   65,   83,  119,  119,  119,  119,  119,
			  130,  130,  130,  130,  130,   79,   79,   83,  137,   67,
			  139,  249,  249,  104,  104,  104,  104,  120,  132,  120,
			  209,  141,  121,  121,  121,  121,  121,  135,  143,  136,
			  136,  136,  136,  136,  137,   67,  139,  139,  104,  104,
			  104,  108,  137,   95,  162,  109,  133,  141,  187,  187,
			  163,  141,  174,  143,  110,  110,  110,  110,  110,  143,
			   83,   83,  170,  140,  237,  237,  237,   83,  138,  162,

			   83,  188,   83,   83,   83,   83,  163,  142,  174,  177,
			   83,  152,  149,   83,  144,   83,  111,  170,   83,  153,
			  154,  154,  154,  154,  154,  112,  121,  121,  121,  121,
			  121,  113,  179,  114,  177,  115,   74,   74,   74,   74,
			   74,  118,  118,  118,  118,  118,  176,  181,  183,  124,
			  121,  121,  121,  121,  121,  160,  125,   65,  179,  161,
			  161,  161,  161,  161,  126,  127,  175,  164,  164,  164,
			  164,  164,  181,   67,  183,  124,  165,  165,  165,  165,
			  165,  160,  125,  166,  166,  166,  166,  166,   75,  126,
			  159,  127,  276,   75,  181,  158,  193,  208,  208,   67,

			  157,  135,   75,  135,  135,  135,  135,  135,   83,   75,
			  171,  135,  171,  136,  136,  136,  136,  136,  156,  182,
			  172,   83,  193,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   94,   94,  173,   94,   94,   95,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,  128,  128,  128,  128,  128,   94,   94,   94,   94,
			   94,   94,  177,  179,  155,  194,  183,  197,  167,  201,
			  151,  168,  189,  203,  189,   83,  169,  190,  190,  190,
			  190,  190,   94,   83,   94,   94,   95,  178,   83,  180,

			   83,  194,  184,  197,  167,  201,   83,  168,   83,  203,
			  150,  169,  205,   83,  152,  235,  149,   94,   94,   94,
			   95,   83,  153,  154,  154,  154,  154,  154,  195,  195,
			  195,  195,  195,  185,  185,  185,  185,  185,  205,  166,
			  166,  166,  166,  166,  185,  185,  185,  185,  185,  147,
			  191,   65,  219,  192,  192,  192,  192,  192,  196,  196,
			  196,  196,  196,  199,  199,  199,  199,   67,   71,  185,
			  185,  185,  185,  185,  185,   94,   94,  219,   94,   94,
			   95,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   67,   71,  210,  102,  214,   94,  186,

			   94,   94,   94,   94,  164,  164,  164,  164,  164,  165,
			  165,  165,  165,  165,  203,  201,  205,  124,  221,  229,
			  221,  210,  124,  214,   94,   83,   94,   94,  222,  224,
			  233,   83,  126,  198,  198,  198,  198,  198,   83,   83,
			  204,  202,  206,  124,   83,  229,  217,  217,  124,   94,
			   94,   94,   83,  223,  224,   83,  233,  126,  207,  207,
			  207,  207,  207,  190,  190,  190,  190,  190,   83,  207,
			  207,  207,  207,  207,  190,  190,  190,  190,  190,  211,
			  211,  211,  211,  211,   65,   95,  192,  192,  192,  192,
			  192,  227,  227,  134,  207,  207,  207,  207,  207,  207,

			   67,  195,  195,  195,  195,  195,  196,  196,  196,  196,
			  196,  212,  212,  212,  212,  212,  214,  132,   71,  218,
			  218,  218,  218,  218,  117,  116,   67,  232,  232,  232,
			  232,  169,   83,  105,   58,   56,   83,  220,  220,  220,
			  220,  220,  215,  102,   71,   83,  243,  244,  243,   83,
			  224,  230,  230,  230,  230,  230,  169,  216,  216,  216,
			  216,  216,   83,  231,  231,  231,  231,  231,  216,  216,
			  216,  216,  216,   95,   70,  225,  238,  238,  238,  238,
			  238,  245,  233,  239,  239,  239,  239,  239,   69,   68,
			   64,   83,   63,  216,  216,  216,  216,  216,  216,  226,

			  226,  226,  226,  226,   83,   58,   56,  276,  234,  276,
			  226,  226,  226,  226,  226,  241,  241,  241,  241,  241,
			  242,  242,  242,  242,  242,  223,  223,  223,  223,  223,
			  247,  247,  247,  247,  247,  226,  226,  226,  226,  226,
			  226,  248,  248,  248,  248,  248,  250,  250,  250,  250,
			  250,  243,  276,  243,  276,  276,  248,  248,  248,  248,
			  248,  251,  251,  251,  251,  251,  252,  252,  252,  252,
			  252,  253,  276,  253,  245,  245,  245,  245,  245,  276,
			  276,  254,  257,  257,  257,  257,  245,  256,  256,  256,
			  256,  256,  258,  258,  258,  258,  258,  259,  259,  259,

			  259,  259,  261,  276,  261,  276,  255,  260,  260,  260,
			  260,  260,  262,  255,  255,  255,  255,  255,  264,  264,
			  264,  264,  264,  265,  265,  265,  265,  266,  266,  266,
			  266,  266,  267,  267,  267,  267,  267,  263,  268,  268,
			  268,  268,  268,  269,  270,  269,  263,  263,  263,  263,
			  263,  272,  272,  272,  272,  272,  273,  273,  273,  273,
			  273,  274,  274,  274,  274,  274,  269,  276,  269,  276,
			  276,  273,  273,  273,  273,  273,  276,  276,  271,  275,
			  275,  275,  275,  275,  271,  271,  271,  271,  271,   71,
			   71,  276,  276,   71,   71,   71,  276,   71,   71,  276,

			  276,  271,   47,   47,   47,   47,   47,   47,   47,   47,
			   47,   47,   47,   47,   47,   47,   47,   47,   47,   47,
			   47,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   57,  276,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,  276,   57,   57,   57,   57,   59,
			  276,   59,   59,   59,   59,   59,   59,   59,   59,   59,
			   59,   59,   59,   59,   59,   59,   59,   59,   80,   80,
			   80,   80,   80,   80,  276,  276,   80,   80,   80,  276,
			   80,   80,   93,   93,   93,   93,   93,   93,   93,   93,

			   93,   93,   93,   93,   93,   93,   93,   93,   93,   94,
			  276,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,  276,   94,   94,   94,   94,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  276,  101,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  104,  276,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  107,  276,  107,  107,  107,  107,  107,
			  107,  107,  107,  107,  107,  107,  107,  107,  107,  107,

			  107,  107,   63,   63,   63,   63,   63,   63,   63,   63,
			   63,   63,   63,   63,   63,   63,   63,   63,   63,   63,
			   63,   79,   79,   79,   79,   79,   79,   79,  276,   79,
			   79,   79,  276,   79,   79,  146,  276,  146,  146,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  146,  276,
			  146,  146,  146,  146,  148,  148,  276,  148,  148,  148,
			  148,  276,  148,  148,  200,  200,  200,  200,  276,  276,
			  200,  200,  200,  276,  200,  200,  176,  176,  276,  176,
			  176,  176,  176,  176,  176,  176,  176,  176,  176,  176,
			  176,  176,  176,  176,  176,    7,  276,  276,  276,  276,

			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276, yy_Dummy>>)
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
			   42,   34,   36,   36,  241,   43,    3,    4,   72,   42,
			   35,   44,   55,   42,   55,   14,   43,   23,   33,   65,
			   65,   65,   65,   65,   41,   44,   41,   51,  236,   43,
			   43,   96,   97,   96,   72,   35,   44,  235,   44,   41,
			   36,   39,   39,   39,   39,   39,   39,   73,   76,  116,
			   78,  116,   39,   39,   39,   39,   39,   39,   39,   39,
			   39,   39,   39,   39,   39,   39,   39,   39,   39,   39,
			   39,   39,  227,   73,   76,   78,   39,   39,   39,   39,

			   39,   39,   39,   39,   39,   39,   39,   39,   39,   39,
			   39,   39,   39,   39,   39,   39,   39,   50,   50,   97,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,  218,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   60,   60,  200,   60,   60,   60,

			   60,   60,   60,   60,   60,   60,   60,   60,   60,   60,
			   60,   60,   75,   75,   75,   75,   75,   60,   60,   60,
			   60,   60,   60,   66,   83,   66,   66,   66,   66,   66,
			   77,   77,   77,   77,   77,   80,   80,   83,   85,   66,
			   87,  246,  246,   60,   60,   60,   60,   67,   80,   67,
			  191,   89,   67,   67,   67,   67,   67,   84,   91,   84,
			   84,   84,   84,   84,   85,   66,   87,   88,   60,   60,
			   60,   62,   86,  186,  122,   62,   80,   89,  293,  293,
			  123,   90,  131,   91,   62,   62,   62,   62,   62,   92,
			   88,   86,  129,   88,  228,  228,  228,   84,   86,  122,

			   92,  149,  184,   88,   86,   90,  123,   90,  131,  137,
			   84,  110,  148,   92,   92,  184,   62,  129,   90,  110,
			  110,  110,  110,  110,  110,   62,  120,  120,  120,  120,
			  120,   62,  139,   62,  137,   62,   74,   74,   74,   74,
			   74,  118,  118,  118,  118,  118,  134,  141,  143,   74,
			  121,  121,  121,  121,  121,  118,   74,  119,  139,  119,
			  119,  119,  119,  119,   74,   74,  132,  125,  125,  125,
			  125,  125,  141,  119,  143,   74,  126,  126,  126,  126,
			  126,  118,   74,  127,  127,  127,  127,  127,  124,   74,
			  115,   74,   81,  125,  142,  114,  162,  296,  296,  119,

			  113,  135,  126,  135,  135,  135,  135,  135,  142,  127,
			  130,  136,  130,  136,  136,  136,  136,  136,  112,  142,
			  130,  142,  162,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   98,   98,  130,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,  128,  128,  128,  128,  128,   98,   98,   98,   98,
			   98,   98,  138,  140,  111,  163,  144,  170,  128,  177,
			  109,  128,  160,  179,  160,  138,  128,  160,  160,  160,
			  160,  160,   98,  140,   98,   98,  226,  138,  138,  140,

			  144,  163,  144,  170,  128,  177,  140,  128,  202,  179,
			  108,  128,  181,  144,  154,  226,  107,   98,   98,   98,
			  145,  202,  154,  154,  154,  154,  154,  154,  167,  167,
			  167,  167,  167,  145,  145,  145,  145,  145,  181,  166,
			  166,  166,  166,  166,  145,  145,  145,  145,  145,  106,
			  161,  161,  210,  161,  161,  161,  161,  161,  168,  168,
			  168,  168,  168,  172,  172,  172,  172,  161,  166,  145,
			  145,  145,  145,  145,  145,  146,  146,  210,  146,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  146,  146,
			  146,  146,  146,  161,  166,  194,  101,  203,  146,  146,

			  146,  146,  146,  146,  164,  164,  164,  164,  164,  165,
			  165,  165,  165,  165,  180,  178,  182,  164,  212,  219,
			  212,  194,  165,  203,  146,  182,  146,  146,  212,  214,
			  224,  180,  164,  171,  171,  171,  171,  171,  182,  178,
			  180,  178,  182,  164,  180,  219,  297,  297,  165,  146,
			  146,  146,  178,  212,  214,  206,  224,  164,  185,  185,
			  185,  185,  185,  189,  189,  189,  189,  189,  206,  185,
			  185,  185,  185,  185,  190,  190,  190,  190,  190,  198,
			  198,  198,  198,  198,  192,   94,  192,  192,  192,  192,
			  192,  298,  298,   82,  185,  185,  185,  185,  185,  185,

			  192,  195,  195,  195,  195,  195,  196,  196,  196,  196,
			  196,  199,  199,  199,  199,  199,  204,   79,  195,  209,
			  209,  209,  209,  209,   64,   63,  192,  222,  222,  222,
			  222,  196,  234,   59,   57,   56,  204,  211,  211,  211,
			  211,  211,  204,   52,  195,  234,  239,  239,  239,  204,
			  215,  220,  220,  220,  220,  220,  196,  207,  207,  207,
			  207,  207,  215,  221,  221,  221,  221,  221,  207,  207,
			  207,  207,  207,   47,   29,  215,  231,  231,  231,  231,
			  231,  239,  225,  232,  232,  232,  232,  232,   28,   26,
			   21,  225,   20,  207,  207,  207,  207,  207,  207,  216,

			  216,  216,  216,  216,  225,   12,   10,    7,  225,    0,
			  216,  216,  216,  216,  216,  237,  237,  237,  237,  237,
			  238,  238,  238,  238,  238,  242,  242,  242,  242,  242,
			  243,  243,  243,  243,  243,  216,  216,  216,  216,  216,
			  216,  244,  244,  244,  244,  244,  247,  247,  247,  247,
			  247,  248,    0,  248,    0,    0,  248,  248,  248,  248,
			  248,  249,  249,  249,  249,  249,  250,  250,  250,  250,
			  250,  251,    0,  251,  252,  252,  252,  252,  252,    0,
			    0,  251,  254,  254,  254,  254,  248,  253,  253,  253,
			  253,  253,  256,  256,  256,  256,  256,  257,  257,  257,

			  257,  257,  259,    0,  259,    0,  251,  258,  258,  258,
			  258,  258,  259,  260,  260,  260,  260,  260,  261,  261,
			  261,  261,  261,  262,  262,  262,  262,  264,  264,  264,
			  264,  264,  265,  265,  265,  265,  265,  259,  266,  266,
			  266,  266,  266,  267,  267,  267,  268,  268,  268,  268,
			  268,  269,  269,  269,  269,  269,  270,  270,  270,  270,
			  270,  272,  272,  272,  272,  272,  273,    0,  273,    0,
			    0,  273,  273,  273,  273,  273,    0,    0,  267,  274,
			  274,  274,  274,  274,  275,  275,  275,  275,  275,  281,
			  281,    0,    0,  281,  281,  281,    0,  281,  281,    0,

			    0,  273,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  279,    0,  279,  279,  279,  279,  279,  279,  279,  279,
			  279,  279,  279,  279,    0,  279,  279,  279,  279,  280,
			    0,  280,  280,  280,  280,  280,  280,  280,  280,  280,
			  280,  280,  280,  280,  280,  280,  280,  280,  282,  282,
			  282,  282,  282,  282,    0,    0,  282,  282,  282,    0,
			  282,  282,  283,  283,  283,  283,  283,  283,  283,  283,

			  283,  283,  283,  283,  283,  283,  283,  283,  283,  284,
			    0,  284,  284,  284,  284,  284,  284,  284,  284,  284,
			  284,  284,  284,    0,  284,  284,  284,  284,  285,  285,
			  285,  285,  285,  285,  285,  285,  285,  285,  285,  285,
			  285,  285,  285,  285,  285,    0,  285,  286,  286,  286,
			  286,  286,  286,  286,  286,  286,  286,  286,  286,  286,
			  286,  286,  286,  286,  287,    0,  287,  287,  287,  287,
			  287,  287,  287,  287,  287,  287,  287,  287,  287,  287,
			  287,  287,  287,  288,    0,  288,  288,  288,  288,  288,
			  288,  288,  288,  288,  288,  288,  288,  288,  288,  288,

			  288,  288,  289,  289,  289,  289,  289,  289,  289,  289,
			  289,  289,  289,  289,  289,  289,  289,  289,  289,  289,
			  289,  290,  290,  290,  290,  290,  290,  290,    0,  290,
			  290,  290,    0,  290,  290,  291,    0,  291,  291,  291,
			  291,  291,  291,  291,  291,  291,  291,  291,  291,    0,
			  291,  291,  291,  291,  292,  292,    0,  292,  292,  292,
			  292,    0,  292,  292,  294,  294,  294,  294,    0,    0,
			  294,  294,  294,    0,  294,  294,  295,  295,    0,  295,
			  295,  295,  295,  295,  295,  295,  295,  295,  295,  295,
			  295,  295,  295,  295,  295,  276,  276,  276,  276,  276,

			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   75,   76,   11,   12,  907, 1395,   88,
			  903, 1395,  899, 1395,   84, 1395, 1395, 1395, 1395, 1395,
			  876,  873, 1395,   78, 1395, 1395,  862, 1395,  861,  845,
			    0,   50,   43,   93,   50,   87,  106, 1395, 1395,  142,
			   34,   89,   63,   79,   88,    0, 1395,  867,  106, 1395,
			  216,   96,  766,    0, 1395,  130,  832,  828, 1395,  823,
			  293,    0,  365,  822,  807,  120,  306,  333, 1395, 1395,
			 1395,    0,   90,  133,  417,  293,  135,  311,  124,  793,
			  324,  468,  775,  267,  340,  300,  334,  306,  333,  318,
			  348,  312,  343,    0,  779, 1395,  149,  146,  542, 1395,

			 1395,  619, 1395,    0, 1395, 1395,  576,  591,  600,  570,
			  401,  564,  508,  490,  485,  480,  167, 1395,  422,  440,
			  407,  431,  330,  343,  443,  448,  457,  464,  542,  349,
			  496,  349,  442, 1395,  428,  484,  494,  365,  528,  395,
			  536,  404,  451,  415,  543,  614,  674,    0,  387,  391,
			 1395, 1395, 1395, 1395,  604, 1395, 1395, 1395, 1395, 1395,
			  568,  634,  463,  535,  685,  690,  620,  609,  639,    0,
			  529,  714,  644,    0,    0,    0,    0,  546,  682,  543,
			  674,  564,  668,    0,  345,  739,  367,    0, 1395,  744,
			  755,  331,  767,    0,  658,  782,  787,    0,  760,  792,

			  244,    0,  551,  660,  779,    0,  698,  838,    0,  800,
			  607,  818,  704, 1395,  684,  805,  880,    0,  251,  671,
			  832,  844,  808, 1395,  682,  834,  590,  167,  375,    0,
			 1395,  857,  864,    0,  775,  151,  138,  896,  901,  832,
			 1395,   79,  906,  911,  922, 1395,  322,  927,  937,  942,
			  947,  957,  955,  968,  963, 1395,  973,  978,  988,  988,
			  994,  999, 1004, 1395, 1008, 1013, 1019, 1029, 1027, 1032,
			 1037, 1395, 1042, 1052, 1060, 1065, 1395, 1101, 1120, 1139,
			 1158, 1081, 1174, 1191, 1208, 1227, 1246, 1263, 1282, 1301,
			 1317, 1334, 1346,  370, 1358, 1375,  489,  738,  783, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  276,    1,  277,  277,  278,  278,  276,  276,  276,
			  276,  276,  279,  276,  280,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  281,  281,  281,  281,  281,  281,  282,  276,  276,  276,
			   39,   39,   39,   39,   39,  283,  276,  284,  276,  276,
			  276,  276,  285,  286,  276,  276,  276,  279,  276,  287,
			  288,  287,  287,  289,  276,  276,  276,  276,  276,  276,
			  276,  281,  281,  281,  281,  281,  281,  281,  281,  290,
			  282,   39,  276,   39,   39,   81,   39,   81,   39,   81,
			   39,   81,   39,  283,  284,  276,  276,  284,  291,  276,

			  276,  285,  276,  286,  276,  276,  276,  292,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  281,  281,  281,  281,  281,  281,  281,  281,
			  281,  281,  276,  276,  276,  276,   81,   81,   39,   81,
			   39,   81,   39,   81,   39,  284,  291,  293,  292,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  281,  281,  281,  281,   74,  281,  281,  281,
			  281,  276,  276,  281,  281,  294,  295,   81,   39,   81,
			   39,   81,   39,   81,   39,  145,  284,  296,  276,  276,
			  276,  276,  276,  281,  281,  128,  281,  281,  276,  276,

			  294,   81,   39,   81,   39,   81,   39,  185,  297,  276,
			  281,  276,  276,  276,   81,   39,  207,  298,  276,  281,
			  276,  276,  276,  276,   81,   39,  284,  276,  276,  281,
			  276,  276,  276,   81,   39,  284,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,    0,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276, yy_Dummy>>)
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
			    0,    0,    0,    0,    0,    0,    0,   81,   79,    1,
			    2,   14,   57,   17,   79,   15,   16,    7,    6,   12,
			    5,   10,    8,   52,   13,   11,   26,   23,   27,   19,
			   47,   47,   47,   47,   47,   47,   21,   22,    9,   48,
			   48,   48,   48,   48,   48,   49,   20,   62,   63,   64,
			   62,   65,   80,   50,   51,    1,    2,   57,   56,   77,
			   77,   77,   77,    3,   28,    0,   52,    0,   25,   24,
			   18,   47,   47,   47,   47,   46,   47,   47,   47,    0,
			    0,   48,    0,   48,   48,   48,   48,   48,   48,   48,
			   48,   48,   48,   49,   62,   64,   63,   62,   62,   59,

			   58,    0,   51,   50,   77,   66,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,    4,   29,   54,   52,
			    0,   53,   47,   47,   47,   47,   47,   47,   47,   47,
			   43,   47,    0,   36,    0,   37,   37,   48,   48,   48,
			   48,   48,   48,   48,   48,   62,   62,    0,    0,    0,
			   73,   71,   74,   78,   78,   72,   70,   67,   68,   69,
			    0,   52,   47,   47,   47,   47,   47,   46,   46,   46,
			   47,    0,    0,   43,   30,    0,   34,   48,   48,   48,
			   48,   48,   48,   30,   30,   62,   60,    0,   75,    0,
			   55,    0,   52,   31,   47,   47,   47,   33,    0,    0,

			    0,   31,   31,   48,   48,   33,   33,   62,    0,    0,
			   47,    0,   42,   35,   48,   48,   62,    0,   45,   47,
			    0,    0,    0,   42,   48,   48,   62,    0,    0,   32,
			   43,    0,    0,   32,   32,   61,    0,    0,    0,   41,
			   76,   44,    0,    0,    0,   41,    0,    0,   41,    0,
			    0,   40,    0,    0,    0,   40,    0,    0,    0,   39,
			    0,    0,    0,   39,    0,    0,    0,   38,    0,    0,
			    0,   38,    0,   38,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 1395
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 276
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 277
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

	yyNb_rules: INTEGER is 80
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 81
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
