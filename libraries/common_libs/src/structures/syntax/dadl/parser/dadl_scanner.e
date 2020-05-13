note
	component:   "openEHR Archetype Project"
	description: "Scanner for dADL syntax items"
	keywords:    "ADL, dADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

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
if yy_act <= 38 then
if yy_act <= 19 then
if yy_act <= 10 then
if yy_act <= 5 then
if yy_act <= 3 then
if yy_act <= 2 then
if yy_act = 1 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 57 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 57")
end
-- Ignore separators
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 58 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 58")
end
in_lineno := in_lineno + text_count
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 63 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 63")
end
-- Ignore comments
end
else
if yy_act = 4 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 64 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 64")
end
in_lineno := in_lineno + 1
else
	yy_position := yy_position + 1
--|#line 68 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 68")
end
last_token := Minus_code
end
end
else
if yy_act <= 8 then
if yy_act <= 7 then
if yy_act = 6 then
	yy_position := yy_position + 1
--|#line 69 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 69")
end
last_token := Plus_code
else
	yy_position := yy_position + 1
--|#line 70 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 70")
end
last_token := Star_code
end
else
	yy_position := yy_position + 1
--|#line 71 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 71")
end
last_token := Slash_code
end
else
if yy_act = 9 then
	yy_position := yy_position + 1
--|#line 72 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 72")
end
last_token := Caret_code
else
	yy_position := yy_position + 1
--|#line 73 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 73")
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
--|#line 74 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 74")
end
last_token := Semicolon_code
else
	yy_position := yy_position + 1
--|#line 75 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 75")
end
last_token := Comma_code
end
else
	yy_position := yy_position + 1
--|#line 76 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 76")
end
last_token := Colon_code
end
else
if yy_act = 14 then
	yy_position := yy_position + 1
--|#line 77 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 77")
end
last_token := Exclamation_code
else
	yy_position := yy_position + 1
--|#line 78 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 78")
end
last_token := Left_parenthesis_code
end
end
else
if yy_act <= 17 then
if yy_act = 16 then
	yy_position := yy_position + 1
--|#line 79 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 79")
end
last_token := Right_parenthesis_code
else
	yy_position := yy_position + 1
--|#line 80 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 80")
end
last_token := Dollar_code
end
else
if yy_act = 18 then
	yy_position := yy_position + 2
--|#line 81 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 81")
end
last_token := SYM_DT_UNKNOWN
else
	yy_position := yy_position + 1
--|#line 82 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 82")
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
--|#line 84 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 84")
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
--|#line 94 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 94")
end
last_token := Left_bracket_code
end
else
	yy_position := yy_position + 1
--|#line 95 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 95")
end
last_token := Right_bracket_code
end
else
if yy_act = 23 then
	yy_position := yy_position + 1
--|#line 97 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 97")
end
last_token := SYM_EQ
else
	yy_position := yy_position + 2
--|#line 99 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 99")
end
last_token := SYM_GE
end
end
else
if yy_act <= 27 then
if yy_act <= 26 then
if yy_act = 25 then
	yy_position := yy_position + 2
--|#line 100 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 100")
end
last_token := SYM_LE
else
	yy_position := yy_position + 1
--|#line 102 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 102")
end

			if in_interval then
				last_token := SYM_LT
				start_block_received := False
			else
				last_token := SYM_START_DBLOCK
				start_block_received := True
				block_depth := block_depth + 1
			end
		
end
else
	yy_position := yy_position + 1
--|#line 113 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 113")
end

			if in_interval then
				last_token := SYM_GT
			else
				last_token := SYM_END_DBLOCK
				block_depth := block_depth - 1
			end
		
end
else
if yy_act = 28 then
	yy_position := yy_position + 2
--|#line 122 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 122")
end
last_token := SYM_ELLIPSIS
else
	yy_position := yy_position + 3
--|#line 123 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 123")
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
--|#line 127 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 127")
end
last_token := SYM_TRUE
else
	yy_position := yy_position + 5
--|#line 129 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 129")
end
last_token := SYM_FALSE
end
else
	yy_position := yy_position + 8
--|#line 131 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 131")
end
last_token := SYM_INFINITY
end
else
if yy_act = 33 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 134 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 134")
end

	last_token := V_URI
	last_string_value := text

else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 140 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 140")
end

					last_token := V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
end
else
if yy_act <= 36 then
if yy_act = 35 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 145 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 145")
end

					last_token := ERR_V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 150 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 150")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 37 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 155 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 155")
end

					last_token := ERR_V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 161 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 161")
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
--|#line 168 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 168")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 169 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 169")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 170 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 170")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
if yy_act = 42 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 177 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 177")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 178 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 178")
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
--|#line 185 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 185")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
	yy_position := yy_position + 7
--|#line 186 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 186")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 196 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 196")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
else
if yy_act = 47 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 197 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 197")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 203 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 203")
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
--|#line 208 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 208")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 213 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 213")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 220 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 220")
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
	yy_position := yy_position + 1
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

				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_
				set_start_condition (INITIAL)
			
end
else
if yy_act = 66 then
	yy_position := yy_position + 1
--|#line 309 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 309")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
else
	yy_position := yy_position + 3
--|#line 319 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 319")
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
--|#line 321 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 321")
end
last_token := V_CHARACTER; last_character_value := '%N'
else
	yy_position := yy_position + 4
--|#line 322 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 322")
end
last_token := V_CHARACTER; last_character_value := '%R'
end
else
	yy_position := yy_position + 4
--|#line 323 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 323")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 71 then
	yy_position := yy_position + 4
--|#line 324 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 324")
end
last_token := V_CHARACTER; last_character_value := '%''
else
	yy_position := yy_position + 4
--|#line 325 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 325")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 74 then
if yy_act = 73 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 327 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 327")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 328 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 328")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 75 then
	yy_position := yy_position + 1
--|#line 332 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 332")
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
--|#line 331 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 331")
end
terminate
when 1 then
--|#line 311 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 311")
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
			-- Template for `yy_nxt'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1854)
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
			   31,   31,   32,   31,   33,   31,   31,   31,   34,   31,
			   31,   35,   31,   31,   31,   31,   36,    8,   37,   38,
			    8,   39,   40,   40,   40,   40,   41,   40,   42,   40,
			   40,   40,   40,   40,   43,   40,   40,   40,   44,   45,
			    8,    8,    8,    8,    8,    8,    8,    8,    8,   47,
			   63,   56,   48,   57,   47,   65,   56,   48,   57,   58,
			   68,   58,   69,   69,   69,   69,   69,   68,   75,   71,

			   71,   71,   71,   71,   87,   75,   70,   97,   89,   66,
			  138,   75,   97,   70,   58,   87,   58,   97,   75,   64,
			   97,  138,   77,   49,   87,  249,   75,   98,   49,   97,
			   70,   90,   75,   87,  116,   87,  116,   70,   78,   79,
			   79,   79,   79,   79,   87,   77,   81,  141,   91,  126,
			   50,   51,   52,   53,   54,   50,   51,   52,   53,   54,
			   82,   82,   78,   80,   87,   82,   82,   93,   99,   81,
			  133,  141,   92,  126,  101,   87,  143,  100,  100,  100,
			   87,   87,  102,  102,  102,   75,  103,  103,   87,  235,
			   94,   87,   87,  133,  104,  104,  104,   75,  226,   87,

			  143,   82,   84,   85,   85,   85,   85,   85,   86,  117,
			  117,  117,  117,  117,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   75,  118,   80,  182,   85,   87,   87,   88,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   88,   87,   87,   87,  110,  120,  120,  120,  120,  120,
			  127,  181,  225,  111,  111,  111,  111,  111,  145,   68,
			   97,  121,  121,  121,  121,  121,  122,  168,  168,  168,
			  168,  123,  224,  123,  127,   70,  124,  124,  124,  124,
			  124,  145,  223,  112,   97,   68,   75,  121,  121,  121,

			  121,  121,   75,  141,  201,   97,  184,  113,  114,   70,
			  115,   70,   97,  143,  218,  132,  132,  132,  132,  132,
			  139,   87,  140,  140,  140,  140,  140,  142,   97,  184,
			  186,   75,   87,  145,   87,   70,   75,  144,  147,  148,
			  149,  150,  151,   75,   87,   87,  241,  241,  241,   79,
			   79,   79,   79,   79,  186,   87,  146,   75,   87,  100,
			  100,  100,  128,  165,  165,  165,  165,  165,  129,   87,
			  100,  100,  100,  171,  201,  130,  131,  152,  152,  152,
			  155,  156,  156,  156,  156,  156,  128,  124,  124,  124,
			  124,  124,  129,  153,  153,  153,  118,  171,  130,  131,

			  135,  135,  135,  135,  135,  135,  135,  135,  136,  136,
			  135,  135,  135,  136,  136,  135,  136,  136,  136,  136,
			  136,  137,  135,  135,  135,  135,  135,  136,  136,  136,
			  136,  136,  136,  136,  136,  136,  136,  136,  136,  136,
			  136,  136,  136,  136,  136,  135,  135,  181,  135,  136,
			  136,  136,  136,  136,  136,  136,  136,  136,  136,  136,
			  136,  136,  136,  136,  136,  136,  136,  135,  135,  135,
			  135,  135,  135,  135,  135,  135,  135,  135,  277,  124,
			  124,  124,  124,  124,  139,   97,  139,  139,  139,  139,
			  139,  120,  120,  120,  120,  120,  139,  181,  140,  140,

			  140,  140,  140,   75,  180,  166,  160,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,  117,  117,  117,  117,  117,  166,
			   68,  159,  167,  167,  167,  167,  167,  161,   87,  170,
			   75,   75,  188,  162,   97,  186,   70,  158,  212,   87,
			  163,  164,  101,  172,  172,  172,  172,  172,  251,  251,
			  157,  161,  170,   97,   87,   75,  188,  162,  179,  187,
			   70,   75,  212,  163,  164,   87,  154,   80,  173,  173,
			  173,  173,  173,  188,  174,  174,  174,  174,  174,   97,
			  184,  106,  179,   97,  183,  214,  183,  183,  183,  183,

			  183,   97,   80,   87,   97,   87,   75,  189,   80,   75,
			  103,  103,   97,  185,   87,   75,   87,  233,  175,  214,
			  175,  239,  132,  132,  132,  132,  132,  181,  100,  100,
			  100,  155,  156,  156,  156,  156,  156,  214,  176,  203,
			  233,  177,  202,  227,  239,  178,   75,  134,  190,  190,
			  190,  190,  190,   87,  102,  102,  102,   75,  104,  104,
			  104,  215,  176,  203,   87,  177,  202,  227,  178,  100,
			  100,  100,  118,  125,  119,  116,  222,  100,  100,  100,
			  191,  191,  191,  191,  191,  192,  192,  192,  192,  192,
			  196,  109,  196,   61,   59,  197,  197,  197,  197,  197,

			  222,  219,  106,  219,  118,  231,  231,  231,  231,  118,
			  175,  220,  175,   97,  165,  165,  165,  165,  165,   75,
			   75,  198,   68,   74,  199,  199,  199,  199,  199,   73,
			  193,   72,   67,  194,  221,   61,   75,  195,   70,  200,
			  200,  200,  200,  200,  172,  172,  172,  172,  172,  173,
			  173,  173,  173,  173,  193,   59,  277,  194,  233,  238,
			  195,  277,   70,   76,  174,  174,  174,  174,  174,  277,
			   87,   76,  277,  232,  277,   76,  204,  204,  204,  204,
			  204,  234,  238,  129,  277,  277,   75,   76,  216,  216,
			  216,  216,  216,  277,   76,   75,  232,  277,   76,  205,

			  205,  205,  205,  205,  277,  277,  277,  129,  206,  206,
			  206,  206,  206,  207,  207,  207,  207,  207,  207,  207,
			  207,  207,  207,  207,  207,  207,  208,  208,  207,  208,
			  208,  208,  208,  208,  207,  207,  207,  207,  207,  207,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  207,  207,
			  277,  207,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  207,  207,  207,  207,  207,  207,  207,  207,  207,  207,
			  207,  209,  209,  209,  209,  209,  209,  209,  209,  209,

			  209,  209,  209,  209,  210,  210,  209,  210,  210,  210,
			  210,  210,  209,  209,  209,  209,  209,  209,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  209,  209,  181,  209,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  209,  209,
			  209,  209,  209,  209,  209,  209,  209,  209,  209,  183,
			  212,  183,  183,  183,  183,  183,  277,  277,  190,  190,
			  190,  190,  190,  191,  191,  191,  191,  191,  277,  277,
			  277,  161,   87,  277,  213,  227,  161,  192,  192,  192, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  192,  192,  211,   87,  163,  217,  217,  217,  217,  217,
			  161,  277,  277,  277,   87,  161,  162,  277,  277,  228,
			  161,  277,  277,  163,  277,   87,  277,  163,  197,  197,
			  197,  197,  197,  277,  161,  197,  197,  197,  197,  197,
			  162,  243,  244,  243,  244,   68,  163,  199,  199,  199,
			  199,  199,  204,  204,  204,  204,  204,  258,  258,  258,
			  258,   70,  205,  205,  205,  205,  205,  206,  206,  206,
			  206,  206,  277,  277,  245,  195,  277,  277,   76,  277,
			  239,  277,  277,   76,  277,   70,   76,  277,  175,   87,
			  175,  277,  216,  216,  216,  216,  216,  277,  195,  254,

			   87,  254,   76,  240,  277,  277,  277,   76,  277,  255,
			   76,  194,  175,  277,  175,  195,  217,  217,  217,  217,
			  217,  229,  229,  229,  229,  229,  230,  230,  230,  230,
			  230,  277,  256,  277,  277,  194,  277,  277,  195,  195,
			  236,  236,  236,  236,  236,  237,  237,  237,  237,  237,
			  242,  242,  242,  242,  242,  246,  246,  246,  246,  246,
			  277,  277,  195,  221,  221,  221,  221,  221,  247,  247,
			  247,  247,  247,  248,  248,  248,  248,  248,  250,  250,
			  250,  250,  250,  243,  277,  243,  277,  277,  248,  248,
			  248,  248,  248,  252,  252,  252,  252,  252,  253,  253,

			  253,  253,  253,  245,  245,  245,  245,  245,  257,  257,
			  257,  257,  257,  277,  277,  277,  245,  259,  259,  259,
			  259,  259,  260,  260,  260,  260,  260,  261,  261,  261,
			  261,  261,  262,  277,  262,  256,  256,  256,  256,  256,
			  277,  277,  263,  265,  265,  265,  265,  265,  266,  266,
			  266,  266,  267,  267,  267,  267,  267,  268,  268,  268,
			  268,  268,  277,  277,  277,  264,  269,  269,  269,  269,
			  269,  270,  271,  270,  271,  264,  264,  264,  264,  264,
			  273,  273,  273,  273,  273,  274,  274,  274,  274,  274,
			  275,  275,  275,  275,  275,  276,  276,  276,  276,  276,

			  270,  277,  270,  277,  272,  274,  274,  274,  274,  274,
			  272,  272,  272,  272,  272,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  272,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   60,  277,   60,   60,
			   60,   60,   60,   60,   60,   60,   60,   60,   60,   60,

			   60,   60,   60,  277,   60,   60,   60,   60,   60,   60,
			   60,   60,   62,  277,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   76,  277,
			  277,  277,  277,  277,  277,   76,   76,  277,  277,  277,
			   76,   76,   76,  277,   76,   76,   76,   76,   76,   76,
			   83,   83,  277,   83,   83,   83,   83,  277,  277,  277,
			   83,   83,   83,  277,   83,   83,   83,   83,   83,   83,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,

			   95,   95,   95,   95,   96,  277,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,  277,   96,   96,   96,   96,   96,   96,   96,   96,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  277,  105,  107,  107,  107,  107,
			  107,  107,  107,  107,  107,  107,  107,  107,  107,  107,
			  107,  107,  107,  107,  107,  107,  107,  107,  107,  107,
			  108,  277,  108,  108,  108,  108,  108,  108,  108,  108,
			  108,  108,  108,  108,  108,  108,  108,  108,  108,  108,

			  108,  108,  108,  108,  108,  108,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   82,   82,  277,   82,   82,   82,   82,   82,
			  277,  277,   82,   82,   82,  277,   82,   82,   82,   82,
			   82,   82,   86,   86,  277,  277,   86,   86,   86,   86,
			   86,   86,   86,   86,  277,  277,   86,   86,   86,  277,
			   86,   86,   86,   86,   86,   86,  169,  277,  277,  277,
			  169,  277,  277,  169,  169,  277,  169,  169,  169,  169,
			  169,  277,  169,  169,  169,  169,  169,  169,  135,  135,

			  135,  135,  135,  135,  135,  135,  135,  135,  135,  135,
			  135,  135,  135,  135,  135,  135,  135,  135,  135,  135,
			  135,  135,  135,  135,  207,  207,  207,  207,  207,  207,
			  207,  207,  207,  207,  207,  207,  207,  207,  207,  207,
			  207,  207,  207,  207,  207,  207,  207,  207,  207,  207,
			  209,  209,  209,  209,  209,  209,  209,  209,  209,  209,
			  209,  209,  209,  209,  209,  209,  209,  209,  209,  209,
			  209,  209,  209,  209,  209,  209,    7,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,

			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277, yy_Dummy>>,
			1, 855, 1000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1854)
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
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    3,
			   14,    5,    3,    5,    4,   20,    6,    4,    6,    9,
			   23,    9,   23,   23,   23,   23,   23,   24,   32,   24,

			   24,   24,   24,   24,   40,   33,   23,   51,   41,   20,
			   84,   35,   50,   24,   58,   40,   58,   52,   77,   14,
			   53,   84,   32,    3,   87,  246,   34,   49,    4,   54,
			   23,   41,   81,   41,  116,   87,  116,   24,   33,   34,
			   34,   34,   34,   34,   41,   32,   35,   89,   42,   77,
			    3,    3,    3,    3,    3,    4,    4,    4,    4,    4,
			   36,   36,   33,   34,   42,   36,   36,   43,   49,   35,
			   81,   89,   42,   77,   51,   42,   91,   50,   50,   50,
			  189,   43,   52,   52,   52,  238,   53,   53,  213,  229,
			   43,  189,   43,   81,   54,   54,   54,  128,  210,  213,

			   91,   36,   36,   39,   39,   39,   39,   39,   39,   66,
			   66,   66,   66,   66,   39,   39,   39,   39,   39,   39,
			   39,   39,   39,   39,   39,   39,   39,   39,   39,   39,
			   39,   39,   78,   66,  128,  137,   39,   39,   39,   39,
			   39,   39,   39,   39,   39,   39,   39,   39,   39,   39,
			   39,   39,   39,   39,   64,   68,   68,   68,   68,   68,
			   78,  137,  209,   64,   64,   64,   64,   64,   93,   69,
			  100,   69,   69,   69,   69,   69,   69,  122,  122,  122,
			  122,   70,  208,   70,   78,   69,   70,   70,   70,   70,
			   70,   93,  207,   64,  101,   71,  202,   71,   71,   71,

			   71,   71,   80,   90,  201,  102,  141,   64,   64,   69,
			   64,   71,  103,   92,  198,   80,   80,   80,   80,   80,
			   88,   90,   88,   88,   88,   88,   88,   90,  104,  141,
			  143,  179,   90,   94,   92,   71,   79,   92,  100,  100,
			  100,  100,  100,  127,   94,   92,  235,  235,  235,   79,
			   79,   79,   79,   79,  143,   94,   94,  178,   88,  101,
			  101,  101,   79,  118,  118,  118,  118,  118,   79,   88,
			  102,  102,  102,  127,  169,   79,   79,  103,  103,  103,
			  111,  111,  111,  111,  111,  111,   79,  123,  123,  123,
			  123,  123,   79,  104,  104,  104,  161,  127,   79,   79,

			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,  136,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   85,  124,
			  124,  124,  124,  124,  139,  148,  139,  139,  139,  139,
			  139,  120,  120,  120,  120,  120,  140,  135,  140,  140,

			  140,  140,  140,  126,  134,  120,  115,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,  117,  117,  117,  117,  117,  120,
			  121,  114,  121,  121,  121,  121,  121,  117,  240,  126,
			  129,  133,  145,  117,  150,  144,  121,  113,  184,  240,
			  117,  117,  148,  129,  129,  129,  129,  129,  249,  249,
			  112,  117,  126,  147,  144,  130,  145,  117,  133,  144,
			  121,  131,  184,  117,  117,  144,  110,  129,  130,  130,
			  130,  130,  130,  146,  131,  131,  131,  131,  131,  149,
			  142,  105,  133,  151,  138,  186,  138,  138,  138,  138,

			  138,   96,  130,  142,  152,  146,  171,  146,  131,  132,
			  150,  150,  153,  142,  142,  170,  146,  227,  132,  186,
			  132,  233,  132,  132,  132,  132,  132,  138,  147,  147,
			  147,  156,  156,  156,  156,  156,  156,  187,  132,  171,
			  227,  132,  170,  214,  233,  132,  203,   82,  162,  162,
			  162,  162,  162,  187,  149,  149,  149,   76,  151,  151,
			  151,  187,  132,  171,  187,  132,  170,  214,  132,  152,
			  152,  152,  162,   75,   67,   65,  203,  153,  153,  153,
			  163,  163,  163,  163,  163,  164,  164,  164,  164,  164,
			  166,   62,  166,   60,   59,  166,  166,  166,  166,  166,

			  203,  200,   55,  200,  163,  220,  220,  220,  220,  164,
			  165,  200,  165,   46,  165,  165,  165,  165,  165,  232,
			   31,  167,  167,   30,  167,  167,  167,  167,  167,   29,
			  165,   27,   21,  165,  200,   12,  222,  165,  167,  168,
			  168,  168,  168,  168,  172,  172,  172,  172,  172,  173,
			  173,  173,  173,  173,  165,   10,    7,  165,  228,  232,
			  165,    0,  167,  172,  174,  174,  174,  174,  174,    0,
			  228,  172,    0,  222,    0,  173,  175,  175,  175,  175,
			  175,  228,  232,  174,    0,    0,  176,  172,  193,  193,
			  193,  193,  193,    0,  172,  177,  222,    0,  173,  176,

			  176,  176,  176,  176,    0,    0,    0,  174,  177,  177,
			  177,  177,  177,  180,  180,  180,  180,  180,  180,  180,
			  180,  180,  180,  180,  180,  180,  180,  180,  180,  180,
			  180,  180,  180,  180,  180,  180,  180,  180,  180,  180,
			  180,  180,  180,  180,  180,  180,  180,  180,  180,  180,
			  180,  180,  180,  180,  180,  180,  180,  180,  180,  180,
			    0,  180,  180,  180,  180,  180,  180,  180,  180,  180,
			  180,  180,  180,  180,  180,  180,  180,  180,  180,  180,
			  180,  180,  180,  180,  180,  180,  180,  180,  180,  180,
			  180,  182,  182,  182,  182,  182,  182,  182,  182,  182,

			  182,  182,  182,  182,  182,  182,  182,  182,  182,  182,
			  182,  182,  182,  182,  182,  182,  182,  182,  182,  182,
			  182,  182,  182,  182,  182,  182,  182,  182,  182,  182,
			  182,  182,  182,  182,  182,  182,  182,  182,  182,  182,
			  182,  182,  182,  182,  182,  182,  182,  182,  182,  182,
			  182,  182,  182,  182,  182,  182,  182,  182,  182,  182,
			  182,  182,  182,  182,  182,  182,  182,  182,  182,  183,
			  185,  183,  183,  183,  183,  183,    0,    0,  190,  190,
			  190,  190,  190,  191,  191,  191,  191,  191,    0,    0,
			    0,  190,  185,    0,  185,  215,  191,  192,  192,  192, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  192,  192,  183,  185,  190,  194,  194,  194,  194,  194,
			  192,    0,    0,    0,  215,  190,  192,    0,    0,  215,
			  191,    0,    0,  192,    0,  215,    0,  190,  196,  196,
			  196,  196,  196,    0,  192,  197,  197,  197,  197,  197,
			  192,  237,  237,  237,  237,  199,  192,  199,  199,  199,
			  199,  199,  204,  204,  204,  204,  204,  255,  255,  255,
			  255,  199,  205,  205,  205,  205,  205,  206,  206,  206,
			  206,  206,    0,    0,  237,  204,    0,    0,  205,    0,
			  234,    0,    0,  206,    0,  199,  206,    0,  216,  234,
			  216,    0,  216,  216,  216,  216,  216,    0,  204,  253,

			  234,  253,  205,  234,    0,    0,    0,  206,    0,  253,
			  206,  216,  217,    0,  217,  216,  217,  217,  217,  217,
			  217,  218,  218,  218,  218,  218,  219,  219,  219,  219,
			  219,    0,  253,    0,    0,  216,    0,    0,  216,  217,
			  230,  230,  230,  230,  230,  231,  231,  231,  231,  231,
			  236,  236,  236,  236,  236,  241,  241,  241,  241,  241,
			    0,    0,  217,  242,  242,  242,  242,  242,  243,  243,
			  243,  243,  243,  244,  244,  244,  244,  244,  247,  247,
			  247,  247,  247,  248,    0,  248,    0,    0,  248,  248,
			  248,  248,  248,  250,  250,  250,  250,  250,  251,  251,

			  251,  251,  251,  252,  252,  252,  252,  252,  254,  254,
			  254,  254,  254,    0,    0,    0,  248,  257,  257,  257,
			  257,  257,  258,  258,  258,  258,  258,  259,  259,  259,
			  259,  259,  260,    0,  260,  261,  261,  261,  261,  261,
			    0,    0,  260,  262,  262,  262,  262,  262,  263,  263,
			  263,  263,  265,  265,  265,  265,  265,  266,  266,  266,
			  266,  266,    0,    0,    0,  260,  267,  267,  267,  267,
			  267,  268,  268,  268,  268,  269,  269,  269,  269,  269,
			  270,  270,  270,  270,  270,  271,  271,  271,  271,  271,
			  273,  273,  273,  273,  273,  275,  275,  275,  275,  275,

			  274,    0,  274,    0,  268,  274,  274,  274,  274,  274,
			  276,  276,  276,  276,  276,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  274,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  279,  279,  279,  279,  279,  279,  279,  279,  279,  279,
			  279,  279,  279,  279,  279,  279,  279,  279,  279,  279,
			  279,  279,  279,  279,  279,  279,  280,    0,  280,  280,
			  280,  280,  280,  280,  280,  280,  280,  280,  280,  280,

			  280,  280,  280,    0,  280,  280,  280,  280,  280,  280,
			  280,  280,  281,    0,  281,  281,  281,  281,  281,  281,
			  281,  281,  281,  281,  281,  281,  281,  281,  281,  281,
			  281,  281,  281,  281,  281,  281,  281,  281,  282,    0,
			    0,    0,    0,    0,    0,  282,  282,    0,    0,    0,
			  282,  282,  282,    0,  282,  282,  282,  282,  282,  282,
			  283,  283,    0,  283,  283,  283,  283,    0,    0,    0,
			  283,  283,  283,    0,  283,  283,  283,  283,  283,  283,
			  284,  284,  284,  284,  284,  284,  284,  284,  284,  284,
			  284,  284,  284,  284,  284,  284,  284,  284,  284,  284,

			  284,  284,  284,  284,  285,    0,  285,  285,  285,  285,
			  285,  285,  285,  285,  285,  285,  285,  285,  285,  285,
			  285,    0,  285,  285,  285,  285,  285,  285,  285,  285,
			  286,  286,  286,  286,  286,  286,  286,  286,  286,  286,
			  286,  286,  286,  286,  286,  286,  286,  286,  286,  286,
			  286,  286,  286,  286,    0,  286,  287,  287,  287,  287,
			  287,  287,  287,  287,  287,  287,  287,  287,  287,  287,
			  287,  287,  287,  287,  287,  287,  287,  287,  287,  287,
			  288,    0,  288,  288,  288,  288,  288,  288,  288,  288,
			  288,  288,  288,  288,  288,  288,  288,  288,  288,  288,

			  288,  288,  288,  288,  288,  288,  289,  289,  289,  289,
			  289,  289,  289,  289,  289,  289,  289,  289,  289,  289,
			  289,  289,  289,  289,  289,  289,  289,  289,  289,  289,
			  289,  289,  290,  290,    0,  290,  290,  290,  290,  290,
			    0,    0,  290,  290,  290,    0,  290,  290,  290,  290,
			  290,  290,  291,  291,    0,    0,  291,  291,  291,  291,
			  291,  291,  291,  291,    0,    0,  291,  291,  291,    0,
			  291,  291,  291,  291,  291,  291,  292,    0,    0,    0,
			  292,    0,    0,  292,  292,    0,  292,  292,  292,  292,
			  292,    0,  292,  292,  292,  292,  292,  292,  293,  293,

			  293,  293,  293,  293,  293,  293,  293,  293,  293,  293,
			  293,  293,  293,  293,  293,  293,  293,  293,  293,  293,
			  293,  293,  293,  293,  294,  294,  294,  294,  294,  294,
			  294,  294,  294,  294,  294,  294,  294,  294,  294,  294,
			  294,  294,  294,  294,  294,  294,  294,  294,  294,  294,
			  295,  295,  295,  295,  295,  295,  295,  295,  295,  295,
			  295,  295,  295,  295,  295,  295,  295,  295,  295,  295,
			  295,  295,  295,  295,  295,  295,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,

			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277, yy_Dummy>>,
			1, 855, 1000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   76,   81,   13,   18,  756, 1776,   87,
			  752, 1776,  729, 1776,   72, 1776, 1776, 1776, 1776, 1776,
			   71,  717, 1776,   75,   82, 1776, 1776,  706, 1776,  704,
			  696,  716,   94,  101,  122,  107,  151, 1776, 1776,  186,
			   51,   80,  111,  128,    0, 1776,  707, 1776, 1776,  121,
			  106,  101,  111,  114,  123,  632,    0, 1776,  112,  691,
			  687, 1776,  683,    0,  246,  672,  192,  659,  238,  254,
			  269,  280, 1776, 1776, 1776,  649,  653,  114,  228,  332,
			  298,  128,  625,  399,   57,  456,    0,   71,  305,  112,
			  268,  144,  281,  226,  291,    0,  595, 1776, 1776, 1776,

			  264,  288,  299,  306,  322,  521, 1776,    0, 1776, 1776,
			  568,  364,  552,  539,  523,  498,  132,  507,  346, 1776,
			  474,  515,  260,  370,  462,    0,  499,  339,  193,  536,
			  561,  567,  605,  537,  482,  449,  399,  213,  579,  469,
			  481,  266,  550,  296,  511,  511,  552,  557,  479,  583,
			  538,  587,  598,  606, 1776, 1776,  615, 1776, 1776, 1776,
			 1776,  355,  631,  663,  668,  697,  678,  707,  722,  348,
			  611,  602,  727,  732,  747,  759,  782,  791,  353,  327,
			  812, 1776,  890,  954,  517,  939,  558,  600,    0,  127,
			  961,  966,  980,  771,  988, 1776, 1011, 1018,  297, 1030,

			  689,  278,  292,  642, 1035, 1045, 1050,  244,  234,  214,
			  150, 1776,    0,  135,  609,  961, 1075, 1099, 1104, 1109,
			  688, 1776,  732, 1776, 1776, 1776, 1776,  576,  717,  175,
			 1123, 1128,  715,  577, 1036,  329, 1133, 1029,  181,    0,
			  485, 1138, 1146, 1151, 1156, 1776,   84, 1161, 1171,  541,
			 1176, 1181, 1186, 1087, 1191, 1040, 1776, 1200, 1205, 1210,
			 1220, 1218, 1226, 1231, 1776, 1235, 1240, 1249, 1259, 1258,
			 1263, 1268, 1776, 1273, 1288, 1278, 1293, 1776, 1333, 1359,
			 1385, 1411, 1435, 1455, 1479, 1503, 1529, 1555, 1579, 1605,
			 1627, 1651, 1673, 1697, 1723, 1749, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  277,    1,  278,  278,  279,  279,  277,  277,  277,
			  277,  277,  280,  277,  281,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  282,  282,  282,  282,  282,  283,  277,  277,  277,
			   39,   39,   39,   39,  284,  277,  285,  277,  277,  277,
			  285,  285,  285,  285,  285,  286,  287,  277,  277,  277,
			  280,  277,  288,  288,  288,  289,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  282,  282,  282,  282,
			  282,  282,  290,  277,   83,   39,  291,   39,   39,   85,
			   39,   85,   39,   85,   39,  284,  285,  277,  277,  277,

			  285,  285,  285,  285,  285,  286,  277,  287,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  292,  282,  282,  282,  282,
			  282,  282,  282,  282,  277,  293,   83,  293,   83,  277,
			   85,   85,   39,   85,   39,   85,   39,  285,  285,  285,
			  285,  285,  285,  285,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  292,
			  282,  282,   79,  172,  172,  277,  282,  282,  282,  282,
			  277,  277,  277,   83,   85,   39,   85,   39,   85,   39,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,

			  277,  292,  282,  282,  277,  132,  132,  294,  180,  295,
			  182,  277,   85,   39,   85,   39,  277,  277,  277,  277,
			  277,  277,  282,  277,  277,  277,  277,   85,   39,  277,
			  277,  277,  282,   85,   39,  277,  277,  277,  282,   85,
			   39,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,    0,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
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
			   38,   29,   39,   40,   41,   42,   29,   43,   29,   44,
			   45,   46,   47,   48,   49,   50,    1,   51,   52,   53,

			   54,   55,   56,   52,   57,   58,   52,   52,   59,   60,
			   61,   52,   52,   52,   62,   63,   64,   65,   52,   66,
			   52,   67,   52,   68,   69,   70,    1,    1,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,    1,    1,   74,   74,   74,   74,   74,   74,

			   74,   74,   74,   74,   74,   74,   74,   74,   74,   74,
			   74,   74,   74,   74,   74,   74,   74,   74,   74,   74,
			   74,   74,   74,   74,   75,   76,   76,   76,   76,   76,
			   76,   76,   76,   76,   76,   76,   76,   76,   76,   76,
			   77,   78,   78,   78,   78,   78,   78,   78,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    2,    3,    1,    4,    1,    1,    5,
			    6,    1,    1,    7,    8,    9,    1,   10,   10,   10,
			   10,   11,   12,    1,   13,    1,   14,    1,   10,   10,
			   10,   10,   10,   10,   10,   10,   10,   10,   10,   10,
			   10,   10,   15,   16,   10,   17,    1,   18,    1,    4,
			   10,   10,   10,   10,   10,   10,   10,   10,   10,   10,
			   10,   10,   19,   20,   21,   22,   23,   24,   25,    4,
			   26,    1,    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,   77,   75,    1,
			    2,   14,   59,   17,   75,   15,   16,    7,    6,   12,
			    5,   10,    8,   54,   54,   13,   11,   26,   23,   27,
			   19,   48,   48,   48,   47,   48,   21,   22,    9,   50,
			   50,   50,   50,   50,   51,   20,   63,   64,   65,   66,
			   63,   63,   63,   63,   63,   76,   52,   53,    1,    2,
			   59,   58,   73,   73,   73,    3,   47,   28,    0,   54,
			    0,   54,   25,   24,   18,    0,   48,   48,   48,   48,
			   46,   48,    0,    0,    0,   50,   33,   50,   50,   50,
			   50,   50,   50,   50,   50,   51,   63,   65,   61,   60,

			   62,   63,   63,   63,   63,    0,   53,   52,   73,   67,
			   73,   73,   73,   73,   73,   73,    4,    0,   46,   29,
			   56,   54,    0,    0,   55,    0,   48,   48,   47,   47,
			   47,   47,   48,   48,    0,    0,    0,    0,    0,   38,
			   38,   50,   50,   50,   50,   50,   50,   63,   63,   63,
			   63,   63,   63,   63,   71,   74,   74,   72,   68,   69,
			   70,   47,   47,   47,   47,    0,    0,   54,    0,    0,
			   48,   48,   48,   48,   48,    0,   46,   46,   46,   30,
			    0,   37,    0,    0,   50,   50,   50,   50,   30,   30,
			    0,    0,    0,   46,   46,   46,    0,   57,    0,   54,

			   43,   49,   31,   48,    0,   48,   48,    0,    0,    0,
			    0,   36,   31,   31,   50,   50,    0,    0,    0,    0,
			    0,   43,   48,   35,   34,   35,   34,   50,   50,   45,
			    0,    0,   48,   50,   50,    0,    0,   42,   32,   32,
			   32,    0,    0,    0,    0,   42,   44,    0,   42,    0,
			    0,    0,    0,   41,    0,    0,   41,    0,    0,    0,
			   40,    0,    0,    0,   40,    0,    0,    0,   39,    0,
			    0,    0,   39,    0,   39,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 1776
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

	yyNb_rules: INTEGER = 76
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 77
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
