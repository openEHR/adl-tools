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
if yy_act <= 38 then
if yy_act <= 19 then
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
if yy_act = 18 then
	yy_position := yy_position + 2
--|#line 89 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 89")
end
last_token := SYM_DT_UNKNOWN
else
	yy_position := yy_position + 1
--|#line 90 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 90")
end
last_token := Question_mark_code
end
end
end
end
else
if yy_act <= 29 then
if yy_act <= 24 then
if yy_act <= 22 then
if yy_act <= 21 then
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
else
	yy_position := yy_position + 1
--|#line 103 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 103")
end
last_token := Right_bracket_code
end
else
if yy_act = 23 then
	yy_position := yy_position + 1
--|#line 105 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 105")
end
last_token := SYM_EQ
else
	yy_position := yy_position + 2
--|#line 107 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 107")
end
last_token := SYM_GE
end
end
else
if yy_act <= 27 then
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
else
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
end
end
else
if yy_act <= 34 then
if yy_act <= 32 then
if yy_act <= 31 then
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
else
	yy_position := yy_position + 8
--|#line 137 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 137")
end
last_token := SYM_INFINITY
end
else
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
end
else
if yy_act <= 36 then
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
else
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
end
end
end
end
else
if yy_act <= 57 then
if yy_act <= 48 then
if yy_act <= 43 then
if yy_act <= 41 then
if yy_act <= 40 then
if yy_act = 39 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 172 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 172")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
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
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 174 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 174")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
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
end
else
if yy_act <= 46 then
if yy_act <= 45 then
if yy_act = 44 then
	yy_position := yy_position + 10
--|#line 189 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 189")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
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
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 200 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 200")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
else
if yy_act = 47 then
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
end
end
else
if yy_act <= 53 then
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
else
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
if yy_act = 56 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 260 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 260")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 261 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 261")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
end
end
end
else
if yy_act <= 67 then
if yy_act <= 62 then
if yy_act <= 60 then
if yy_act <= 59 then
if yy_act = 58 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 268 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 268")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
else
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
			
end
else
	yy_position := yy_position + 2
--|#line 281 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 281")
end
in_buffer.append_character ('\')
end
else
if yy_act = 61 then
	yy_position := yy_position + 2
--|#line 283 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 283")
end
in_buffer.append_character ('"')
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 285 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 285")
end

				in_buffer.append_string (text)
	
end
end
else
if yy_act <= 65 then
if yy_act <= 64 then
if yy_act = 63 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 289 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 289")
end
in_buffer.append_string (text)
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 291 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 291")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 296 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 296")
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
if yy_act = 66 then
	yy_position := yy_position + 1
--|#line 307 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 307")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
else
	yy_position := yy_position + 3
--|#line 317 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 317")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
end
end
end
else
if yy_act <= 72 then
if yy_act <= 70 then
if yy_act <= 69 then
if yy_act = 68 then
	yy_position := yy_position + 4
--|#line 319 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 319")
end
last_token := V_CHARACTER; last_character_value := '%N'
else
	yy_position := yy_position + 4
--|#line 320 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 320")
end
last_token := V_CHARACTER; last_character_value := '%R'
end
else
	yy_position := yy_position + 4
--|#line 321 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 321")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 71 then
	yy_position := yy_position + 4
--|#line 322 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 322")
end
last_token := V_CHARACTER; last_character_value := '%''
else
	yy_position := yy_position + 4
--|#line 323 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 323")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 74 then
if yy_act = 73 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 325 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 325")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 326 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 326")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 75 then
	yy_position := yy_position + 1
--|#line 330 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 330")
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
			create an_array.make (0, 1440)
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
			    8,    8,   49,   65,   58,   50,   59,   49,   77,   58,
			   50,   59,   60,   69,   60,   70,   70,   70,   70,   70,

			   69,   79,   72,   72,   72,   72,   72,   77,  100,   71,
			   77,   78,   77,   88,  235,  142,   71,   80,   80,   80,
			   80,   80,   94,   66,   77,   88,   79,   51,   83,   82,
			  102,  148,   51,   88,   71,   78,   77,   77,   84,   84,
			  142,   71,   81,   84,   84,   88,   95,  180,  101,   90,
			  101,  221,   83,   82,   81,  148,   52,   53,   54,   55,
			   56,   52,   53,   54,   55,   56,   60,  100,   60,   77,
			  100,  180,  103,   91,  100,   88,  104,  104,  104,  100,
			   84,   86,   86,   86,   86,   86,   87,   88,  136,  144,
			  211,  100,   86,   86,   86,   86,   86,   86,   86,   86,

			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,  101,  136,  101,  144,   86,   88,   88,   89,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   89,   88,   88,   88,   92,   77,   96,  105,  106,  106,
			  106,   88,   77,  107,  107,  114,  128,  108,  108,  108,
			   88,   88,   77,   88,  115,  115,  115,  115,  115,   93,
			   97,  105,   88,   88,  122,  122,  122,  122,  122,  206,
			   69,  128,  123,  123,  123,  123,  123,  124,  120,  198,
			  120,  146,  125,  198,  125,  116,   71,  126,  126,  126,
			  126,  126,   69,   77,  123,  123,  123,  123,  123,  117,

			  135,  118,   77,  119,   84,   84,  146,  144,   71,  100,
			  129,   71,  134,  134,  134,  134,  134,  137,  140,   77,
			  141,  141,  141,  141,  141,  135,  100,  142,  212,   88,
			   77,  146,  145,   71,  100,  129,   80,   80,   80,   80,
			   80,   88,  100,   77,  138,  100,   88,  100,  148,  130,
			  182,  186,  143,   77,   88,  131,  147,   88,   88,   88,
			   77,   88,  167,  132,  133,  179,   88,  237,  237,   88,
			  168,   88,  149,   88,  130,  182,  186,  104,  104,  104,
			  131,  158,  159,  159,  159,  159,  159,  132,  133,  263,
			  166,  166,  166,  166,  168,  178,  167,  150,  151,  152,

			  153,  154,  104,  104,  104,  126,  126,  126,  126,  126,
			  155,  155,  155,  156,  156,  156,  107,  107,  200,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,  122,  122,  122,
			  122,  122,   69,  200,  165,  165,  165,  165,  165,   77,
			   77,  164,  126,  126,  126,  126,  126,  177,   71,  169,
			  170,  170,  170,  170,  170,   77,  163,   77,  171,  171,
			  171,  171,  171,  162,   88,   77,  164,  184,  100,  161,
			  160,  176,  177,   71,  169,   81,   88,  172,  172,  172,
			  172,  172,  100,   81,   77,  134,  134,  134,  134,  134,

			  100,  184,   77,  180,  140,  176,  140,  140,  140,  140,
			  140,  173,   81,  182,  174,  100,   88,  157,  140,  175,
			  141,  141,  141,  141,  141,  100,  184,  181,   88,   77,
			  186,  202,  213,   88,   77,  204,  173,   77,  183,  174,
			   88,  193,  194,  175,  110,   88,  104,  104,  104,  100,
			  185,   88,   88,   88,  139,  187,  202,  213,  197,  204,
			  106,  106,  106,   88,  200,   88,  193,  194,  108,  108,
			  108,  158,  159,  159,  159,  159,  159,  192,  192,  192,
			  192,  192,  197,  104,  104,  104,  137,   88,   88,  201,
			   77,   77,  121,  104,  104,  104,  188,  120,  188,   88,

			   88,  189,  189,  189,  189,  189,  190,   69,  218,  191,
			  191,  191,  191,  191,  170,  170,  170,  170,  170,  113,
			  207,   77,  207,   71,  171,  171,  171,  171,  171,   63,
			  208,  210,  218,   76,  172,  172,  172,  172,  172,   61,
			  202,  110,   76,  195,  195,  195,  195,  195,   71,  100,
			   77,   76,  219,  131,  209,  225,  210,   88,   76,  204,
			  196,  196,  196,  196,  196,  203,   76,   77,   88,   88,
			  189,  189,  189,  189,  189,   76,  219,   77,  131,  225,
			   88,  213,   75,  205,  189,  189,  189,  189,  189,   69,
			   74,  191,  191,  191,  191,  191,  195,  195,  195,  195,

			  195,   88,  227,  227,  227,   71,  214,  196,  196,  196,
			  196,  196,   76,   88,   77,  215,  215,  215,  215,  215,
			  216,  216,  216,  216,  216,  217,  217,  217,  217,  219,
			   71,  175,  222,  222,  222,  222,  222,   76,   77,  225,
			   73,   88,  223,  223,  223,  223,  223,  240,   88,  240,
			  229,  230,  229,  220,   68,  175,   67,  241,   63,  224,
			   88,   61,  263,  226,  228,  228,  228,  228,  228,  232,
			  232,  232,  232,  232,  209,  209,  209,  209,  209,  263,
			  263,  242,  263,  224,  231,  233,  233,  233,  233,  233,
			  234,  234,  234,  234,  234,  236,  236,  236,  236,  236,

			  229,  263,  229,  263,  263,  234,  234,  234,  234,  234,
			  238,  238,  238,  238,  238,  239,  239,  239,  239,  239,
			  231,  231,  231,  231,  231,  243,  243,  243,  243,  243,
			  244,  244,  244,  244,  231,  245,  245,  245,  245,  245,
			  246,  246,  246,  246,  246,  247,  247,  247,  247,  247,
			  248,  263,  248,  242,  242,  242,  242,  242,  263,  263,
			  249,  251,  251,  251,  251,  251,  252,  252,  252,  252,
			  253,  253,  253,  253,  253,  254,  254,  254,  254,  254,
			  256,  257,  256,  263,  250,  255,  255,  255,  255,  255,
			  250,  250,  250,  250,  250,  259,  259,  259,  259,  259,

			  260,  260,  260,  260,  260,  261,  261,  261,  261,  261,
			  256,  263,  256,  263,  258,  260,  260,  260,  260,  260,
			  262,  262,  262,  262,  262,  258,  258,  258,  258,  258,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  258,   48,   48,   48,   48,   48,
			   48,   48,   48,   48,   48,   48,   48,   48,   48,   48,
			   48,   48,   48,   48,   48,   48,   48,   48,   48,   48,
			   48,   48,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   62, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  263,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,  263,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   64,  263,   64,   64,
			   64,   64,   64,   64,   64,   64,   64,   64,   64,   64,
			   64,   64,   64,   64,   64,   64,   64,   64,   64,   64,
			   64,   64,   64,   76,   76,  263,   76,  263,   76,  263,
			  263,   76,   76,   76,   76,   76,   76,   76,   76,   85,
			   85,  263,   85,   85,   85,   85,  263,  263,  263,   85,
			  263,  263,   85,   85,   85,   85,   85,   85,   85,   85,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,

			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   99,  263,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			  263,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,  109,  109,  109,  109,  109,  109,  109,  109,
			  109,  109,  109,  109,  109,  109,  109,  109,  109,  109,
			  109,  109,  109,  109,  109,  109,  109,  263,  109,  111,
			  111,  111,  111,  111,  111,  111,  111,  111,  111,  111,
			  111,  111,  111,  111,  111,  111,  111,  111,  111,  111,
			  111,  111,  111,  111,  112,  263,  112,  112,  112,  112,

			  112,  112,  112,  112,  112,  112,  112,  112,  112,  112,
			  112,  112,  112,  112,  112,  112,  112,  112,  112,  112,
			  112,   67,   67,   67,   67,   67,   67,   67,   67,   67,
			   67,   67,   67,   67,   67,   67,   67,   67,   67,   67,
			   67,   67,   67,   67,   67,   67,   67,   67,  127,  263,
			  263,  127,  127,  263,  127,  127,  127,  263,  263,  127,
			  127,  127,  127,  127,  127,  127,  127,   84,   84,  263,
			   84,   84,   84,   84,   84,  263,  263,   84,  263,  263,
			   84,   84,   84,   84,   84,   84,   84,   84,  199,  263,
			  263,  263,  263,  199,  199,  199,  199,  263,  263,  263,

			  199,  263,  263,  199,  199,  199,  199,  199,  199,  199,
			  199,  179,  179,  263,  263,  179,  179,  179,  179,  179,
			  179,  179,  179,  263,  263,  179,  263,  263,  179,  179,
			  179,  179,  179,  179,  179,  179,  198,  263,  263,  263,
			  263,  198,  198,  198,  198,  263,  263,  263,  198,  263,
			  198,  198,  198,  198,  198,  198,  198,  198,  198,    7,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,

			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263, yy_Dummy>>,
			1, 441, 1000)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 1440)
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
			    1,    1,    3,   14,    5,    3,    5,    4,   33,    6,
			    4,    6,    9,   23,    9,   23,   23,   23,   23,   23,

			   24,   33,   24,   24,   24,   24,   24,   32,   52,   23,
			   35,   32,   36,   41,  232,   90,   24,   34,   34,   34,
			   34,   34,   44,   14,   34,   41,   33,    3,   36,   35,
			   51,   96,    4,   44,   23,   32,  130,  224,   37,   37,
			   90,   24,   34,   37,   37,   44,   44,  142,   49,   42,
			   49,  215,   36,   35,  130,   96,    3,    3,    3,    3,
			    3,    4,    4,    4,    4,    4,   60,   53,   60,   83,
			   54,  142,   51,   42,   55,   42,   52,   52,   52,   56,
			   37,   40,   40,   40,   40,   40,   40,   42,   83,   92,
			  198,  151,   40,   40,   40,   40,   40,   40,   40,   40,

			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,  101,   83,  101,   92,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   43,   78,   45,   53,   54,   54,
			   54,   88,  197,   55,   55,   66,   78,   56,   56,   56,
			   45,   43,  193,   88,   66,   66,   66,   66,   66,   43,
			   45,  151,   45,   43,   69,   69,   69,   69,   69,  190,
			   70,   78,   70,   70,   70,   70,   70,   70,  120,  178,
			  120,   94,   71,  199,   71,   66,   70,   71,   71,   71,
			   71,   71,   72,   82,   72,   72,   72,   72,   72,   66,

			   82,   66,   79,   66,   85,   85,   94,   93,   72,  105,
			   79,   70,   81,   81,   81,   81,   81,   85,   89,   81,
			   89,   89,   89,   89,   89,   82,  104,   91,  199,   93,
			  177,   95,   93,   72,  106,   79,   80,   80,   80,   80,
			   80,   93,  107,   80,   85,  108,   91,  153,   97,   80,
			  144,  148,   91,  128,   95,   80,   95,   89,   91,   97,
			  175,  187,  167,   80,   80,  139,   95,  235,  235,   89,
			  128,   97,   97,  187,   80,  144,  148,  105,  105,  105,
			   80,  115,  115,  115,  115,  115,  115,   80,   80,   86,
			  124,  124,  124,  124,  128,  137,  127,  104,  104,  104,

			  104,  104,  106,  106,  106,  125,  125,  125,  125,  125,
			  107,  107,  107,  108,  108,  108,  153,  153,  180,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,  122,  122,  122,
			  122,  122,  123,  180,  123,  123,  123,  123,  123,  129,
			  136,  122,  126,  126,  126,  126,  126,  136,  123,  129,
			  131,  131,  131,  131,  131,  135,  119,  131,  132,  132,
			  132,  132,  132,  118,  201,  132,  122,  146,  150,  117,
			  116,  135,  136,  123,  129,  131,  201,  133,  133,  133,
			  133,  133,  152,  132,  133,  134,  134,  134,  134,  134,

			  154,  146,  134,  143,  140,  135,  140,  140,  140,  140,
			  140,  134,  133,  145,  134,  155,  143,  114,  141,  134,
			  141,  141,  141,  141,  141,  156,  147,  143,  143,  169,
			  149,  182,  202,  145,  168,  184,  134,  176,  145,  134,
			  147,  168,  169,  134,  109,  145,  150,  150,  150,   99,
			  147,  205,  147,  149,   87,  149,  182,  202,  176,  184,
			  152,  152,  152,  205,  181,  149,  168,  169,  154,  154,
			  154,  159,  159,  159,  159,  159,  159,  166,  166,  166,
			  166,  166,  176,  155,  155,  155,   84,  181,  226,  181,
			  210,   76,   68,  156,  156,  156,  164,   67,  164,  181,

			  226,  164,  164,  164,  164,  164,  165,  165,  210,  165,
			  165,  165,  165,  165,  170,  170,  170,  170,  170,   64,
			  192,  194,  192,  165,  171,  171,  171,  171,  171,   62,
			  192,  194,  210,  170,  172,  172,  172,  172,  172,   61,
			  183,   57,  170,  173,  173,  173,  173,  173,  165,   48,
			  173,  171,  213,  172,  192,  219,  194,  183,  170,  185,
			  174,  174,  174,  174,  174,  183,  170,  174,  185,  183,
			  188,  188,  188,  188,  188,  171,  213,   31,  172,  219,
			  185,  203,   30,  185,  189,  189,  189,  189,  189,  191,
			   29,  191,  191,  191,  191,  191,  195,  195,  195,  195,

			  195,  203,  221,  221,  221,  191,  203,  196,  196,  196,
			  196,  196,  195,  203,  196,  206,  206,  206,  206,  206,
			  207,  207,  207,  207,  207,  208,  208,  208,  208,  214,
			  191,  196,  216,  216,  216,  216,  216,  195,  218,  220,
			   27,  214,  217,  217,  217,  217,  217,  239,  220,  239,
			  223,  223,  223,  214,   21,  196,   20,  239,   12,  218,
			  220,   10,    7,  220,  222,  222,  222,  222,  222,  227,
			  227,  227,  227,  227,  228,  228,  228,  228,  228,    0,
			    0,  239,    0,  218,  223,  229,  229,  229,  229,  229,
			  230,  230,  230,  230,  230,  233,  233,  233,  233,  233,

			  234,    0,  234,    0,    0,  234,  234,  234,  234,  234,
			  236,  236,  236,  236,  236,  237,  237,  237,  237,  237,
			  238,  238,  238,  238,  238,  240,  240,  240,  240,  240,
			  241,  241,  241,  241,  234,  243,  243,  243,  243,  243,
			  244,  244,  244,  244,  244,  245,  245,  245,  245,  245,
			  246,    0,  246,  247,  247,  247,  247,  247,    0,    0,
			  246,  248,  248,  248,  248,  248,  249,  249,  249,  249,
			  251,  251,  251,  251,  251,  252,  252,  252,  252,  252,
			  254,  254,  254,    0,  246,  253,  253,  253,  253,  253,
			  255,  255,  255,  255,  255,  256,  256,  256,  256,  256,

			  257,  257,  257,  257,  257,  259,  259,  259,  259,  259,
			  260,    0,  260,    0,  254,  260,  260,  260,  260,  260,
			  261,  261,  261,  261,  261,  262,  262,  262,  262,  262,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  260,  264,  264,  264,  264,  264,
			  264,  264,  264,  264,  264,  264,  264,  264,  264,  264,
			  264,  264,  264,  264,  264,  264,  264,  264,  264,  264,
			  264,  264,  265,  265,  265,  265,  265,  265,  265,  265,
			  265,  265,  265,  265,  265,  265,  265,  265,  265,  265,
			  265,  265,  265,  265,  265,  265,  265,  265,  265,  266, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			    0,  266,  266,  266,  266,  266,  266,  266,  266,  266,
			  266,  266,  266,  266,    0,  266,  266,  266,  266,  266,
			  266,  266,  266,  266,  266,  266,  267,    0,  267,  267,
			  267,  267,  267,  267,  267,  267,  267,  267,  267,  267,
			  267,  267,  267,  267,  267,  267,  267,  267,  267,  267,
			  267,  267,  267,  268,  268,    0,  268,    0,  268,    0,
			    0,  268,  268,  268,  268,  268,  268,  268,  268,  269,
			  269,    0,  269,  269,  269,  269,    0,    0,    0,  269,
			    0,    0,  269,  269,  269,  269,  269,  269,  269,  269,
			  270,  270,  270,  270,  270,  270,  270,  270,  270,  270,

			  270,  270,  270,  270,  270,  270,  270,  270,  270,  270,
			  270,  270,  270,  270,  270,  271,    0,  271,  271,  271,
			  271,  271,  271,  271,  271,  271,  271,  271,  271,  271,
			    0,  271,  271,  271,  271,  271,  271,  271,  271,  271,
			  271,  271,  272,  272,  272,  272,  272,  272,  272,  272,
			  272,  272,  272,  272,  272,  272,  272,  272,  272,  272,
			  272,  272,  272,  272,  272,  272,  272,    0,  272,  273,
			  273,  273,  273,  273,  273,  273,  273,  273,  273,  273,
			  273,  273,  273,  273,  273,  273,  273,  273,  273,  273,
			  273,  273,  273,  273,  274,    0,  274,  274,  274,  274,

			  274,  274,  274,  274,  274,  274,  274,  274,  274,  274,
			  274,  274,  274,  274,  274,  274,  274,  274,  274,  274,
			  274,  275,  275,  275,  275,  275,  275,  275,  275,  275,
			  275,  275,  275,  275,  275,  275,  275,  275,  275,  275,
			  275,  275,  275,  275,  275,  275,  275,  275,  276,    0,
			    0,  276,  276,    0,  276,  276,  276,    0,    0,  276,
			  276,  276,  276,  276,  276,  276,  276,  277,  277,    0,
			  277,  277,  277,  277,  277,    0,    0,  277,    0,    0,
			  277,  277,  277,  277,  277,  277,  277,  277,  278,    0,
			    0,    0,    0,  278,  278,  278,  278,    0,    0,    0,

			  278,    0,    0,  278,  278,  278,  278,  278,  278,  278,
			  278,  279,  279,    0,    0,  279,  279,  279,  279,  279,
			  279,  279,  279,    0,    0,  279,    0,    0,  279,  279,
			  279,  279,  279,  279,  279,  279,  280,    0,    0,    0,
			    0,  280,  280,  280,  280,    0,    0,    0,  280,    0,
			  280,  280,  280,  280,  280,  280,  280,  280,  280,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,

			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263, yy_Dummy>>,
			1, 441, 1000)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   79,   84,   14,   19,  762, 1359,   90,
			  758, 1359,  752, 1359,   75, 1359, 1359, 1359, 1359, 1359,
			  742,  739, 1359,   78,   85, 1359, 1359,  715, 1359,  665,
			  655,  653,   83,   64,  100,   86,   88,  129, 1359, 1359,
			  164,   59,  121,  197,   79,  196,    0, 1359,  643,  146,
			 1359,  124,  102,  161,  164,  168,  173,  569,    0, 1359,
			  164,  636,  623, 1359,  611,    0,  237,  594,  577,  247,
			  255,  270,  277, 1359, 1359, 1359,  567,    0,  211,  278,
			  319,  295,  269,  145,  564,  295,  367,  538,  187,  303,
			   80,  292,  157,  275,  250,  300,   88,  305,    0,  543,

			 1359,  209, 1359, 1359,  320,  303,  328,  336,  339,  472,
			 1359,    0, 1359, 1359,  509,  365,  472,  471,  465,  458,
			  276, 1359,  420,  427,  373,  388,  435,  370,  329,  425,
			  112,  443,  451,  470,  478,  441,  426,  373, 1359,  349,
			  489,  503,  106,  462,  316,  479,  437,  486,  320,  499,
			  472,  185,  486,  341,  494,  509,  519, 1359, 1359,  555,
			 1359, 1359, 1359, 1359,  584,  592,  560,  336,  510,  505,
			  597,  607,  617,  626,  643,  336,  513,  306,  275,    0,
			  387,  533,  494,  603,  490,  614,    0,  307,  653,  667,
			  252,  674,  608,  228,  597,  679,  690,  218,  141,  279,

			    0,  420,  498,  647,    0,  497,  698,  703,  708, 1359,
			  566, 1359, 1359,  610,  687,  137,  715,  725,  714,  610,
			  694,  685,  747,  738,  113,    0,  534,  752,  757,  768,
			  773, 1359,   72,  778,  788,  350,  793,  798,  803,  735,
			  808,  813, 1359,  818,  823,  828,  838,  836,  844,  849,
			 1359,  853,  858,  868,  868,  873,  878,  883, 1359,  888,
			  898,  903,  908, 1359,  944,  971,  998, 1025, 1043, 1064,
			 1089, 1114, 1141, 1168, 1193, 1220, 1241, 1262, 1285, 1310,
			 1333, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  263,    1,  264,  264,  265,  265,  263,  263,  263,
			  263,  263,  266,  263,  267,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  268,  268,  268,  268,  268,  268,  269,  263,  263,
			  263,   40,   40,   40,   40,   40,  270,  263,  271,  263,
			  263,  263,  271,  271,  271,  271,  271,  272,  273,  263,
			  263,  263,  266,  263,  274,  274,  274,  275,  263,  263,
			  263,  263,  263,  263,  263,  263,  268,  276,  268,  268,
			  268,  268,  268,  268,  277,  269,   40,  263,   40,   40,
			   86,   40,   86,   40,   86,   40,   86,   40,  270,  271,

			  263,  263,  263,  263,  271,  271,  271,  271,  271,  272,
			  263,  273,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  276,  268,  268,
			  268,  268,  268,  268,  268,  268,  268,  263,  263,  263,
			  263,   86,   86,   40,   86,   40,   86,   40,   86,   40,
			  271,  271,  271,  271,  271,  271,  271,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  276,  268,  268,
			   80,  170,  170,  268,  268,  268,  268,  268,  278,  279,
			   86,   40,   86,   40,   86,   40,   86,   40,  263,  263,
			  263,  263,  263,  268,  268,  134,  268,  268,  280,  278,

			   86,   40,   86,   40,   86,   40,  263,  263,  263,  263,
			  268,  263,  263,   86,   40,  263,  263,  263,  268,   86,
			   40,  263,  263,  263,  268,   86,   40,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,    0,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263, yy_Dummy>>)
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

	yy_meta_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    2,    3,    1,    4,    1,    1,    5,
			    6,    1,    1,    7,    8,    9,    1,   10,   10,   10,
			   10,   11,   12,    1,   13,    1,   14,    1,   10,   10,
			   10,   10,   10,   10,   10,   10,   10,   10,   10,   10,
			   10,   10,   10,   10,   10,   10,   15,    4,   16,   17,
			    4,   10,   10,   10,   10,   10,   10,   10,   10,   10,
			   10,   10,   18,   19,   20,   21,   22,   23,   24,   25,
			   26,    4,   27,    4,    1,    1,    1,    1,    1,    1,
			    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,   77,   75,    1,
			    2,   14,   59,   17,   75,   15,   16,    7,    6,   12,
			    5,   10,    8,   54,   54,   13,   11,   26,   23,   27,
			   19,   48,   48,   48,   47,   48,   48,   21,   22,    9,
			   50,   50,   50,   50,   50,   50,   51,   20,   63,   64,
			   65,   66,   63,   63,   63,   63,   63,   76,   52,   53,
			    1,    2,   59,   58,   73,   73,   73,    3,   28,    0,
			   54,    0,   54,   25,   24,   18,   48,    0,   48,   48,
			   48,   46,   48,   48,    0,    0,   50,    0,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   51,   63,

			   65,   64,   61,   60,   62,   63,   63,   63,   63,    0,
			   53,   52,   73,   67,   73,   73,   73,   73,   73,   73,
			    4,   29,   56,   54,    0,    0,   55,    0,   48,   48,
			   47,   47,   47,   47,   48,   48,   48,    0,   37,    0,
			   38,   38,   50,   50,   50,   50,   50,   50,   50,   50,
			   63,   63,   63,   63,   63,   63,   63,   71,   74,   74,
			   72,   68,   69,   70,    0,   54,    0,   49,   48,   48,
			   48,   48,   48,   46,   46,   46,   48,   30,    0,   34,
			   50,   50,   50,   50,   50,   50,   30,   30,    0,   57,
			    0,   54,   43,   31,   48,   48,   48,   33,    0,    0,

			   31,   31,   50,   50,   33,   33,    0,    0,    0,   43,
			   48,   36,   35,   50,   50,   45,    0,    0,   48,   50,
			   50,    0,    0,   42,   32,   32,   32,    0,    0,    0,
			    0,   42,   44,    0,   42,    0,    0,    0,    0,   41,
			    0,    0,   41,    0,    0,    0,   40,    0,    0,    0,
			   40,    0,    0,    0,   39,    0,    0,    0,   39,    0,
			   39,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 1359
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 263
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 264
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

	yyNb_rules: INTEGER is 76
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 77
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
