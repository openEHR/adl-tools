note
	component:   "openEHR Archetype Project"
	description: "Scanner for dADL syntax items"
	keywords:    "ADL, dADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2004- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
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

	yy_nxt_template: SPECIAL [INTEGER]
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1716)
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
			   63,   56,   48,   57,   47,   74,   56,   48,   57,   58,
			   67,   58,   68,   68,   68,   68,   68,   67,   90,   70,

			   70,   70,   70,   70,   86,   74,   69,   97,   88,   76,
			   74,  234,   96,   69,   86,   86,   96,   74,   96,   64,
			  236,  236,   91,   49,  135,   86,   74,   96,   49,   74,
			   69,   89,   76,   86,   58,  135,   58,   69,   77,   78,
			   78,   78,   78,   78,   86,   80,   96,   74,   98,  220,
			   50,   51,   52,   53,   54,   50,   51,   52,   53,   54,
			   81,   81,   77,   79,   92,   81,   81,  130,   80,  117,
			  117,  117,  117,  117,  138,  124,  140,   86,   86,  100,
			   86,   99,   99,   99,  102,  102,  142,   93,   86,   86,
			  130,   86,  101,  101,  101,  115,  211,  115,  138,  124,

			  140,   81,   83,   84,   84,   84,   84,   84,   85,  142,
			  210,  103,  103,  103,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,  160,  160,  160,  160,   84,   86,   86,   87,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   87,   86,   86,   86,  109,   67,   74,  118,  118,  118,
			  118,  118,  119,  110,  110,  110,  110,  110,  120,  209,
			  120,   69,   74,  121,  121,  121,  121,  121,   67,  174,
			  118,  118,  118,  118,  118,   74,   96,  123,  138,   96,
			   74,  208,  142,  111,   69,   69,   96,  178,  129,  129,

			  129,  129,  129,   86,   74,  173,   86,  112,  113,   79,
			  114,  123,  139,   96,   86,  143,  140,   86,   69,   74,
			  163,  178,  136,   74,  137,  137,  137,  137,  137,  176,
			   86,   86,   78,   78,   78,   78,   78,   86,  218,  180,
			  141,   86,   86,  187,  163,  125,  198,  202,   86,  176,
			  171,  126,  176,  100,   99,   99,   99,   74,  127,  128,
			   86,  218,   86,  180,  144,  145,  146,  147,  148,  125,
			  198,   86,  177,   86,  171,  126,   74,  187,   99,   99,
			   99,  127,  128,  132,  132,  132,  132,  132,  132,  132,
			  132,  133,  133,  132,  132,  132,  133,  133,  132,  133,

			  133,  133,  133,  133,  134,  132,  132,  132,  132,  132,
			  133,  133,  133,  133,  133,  133,  133,  133,  133,  133,
			  133,  133,  133,  133,  133,  133,  133,  133,  132,  132,
			   74,  132,  133,  133,  133,  133,  133,  133,  133,  133,
			  133,  133,  133,  133,  133,  133,  133,  133,  133,  133,
			  132,  132,  132,  132,  132,  132,  132,  132,  132,  132,
			  132,  262,   96,  189,  200,   96,  152,  153,  153,  153,
			  153,  153,  117,  117,  117,  117,  117,  121,  121,  121,
			  121,  121,  173,  173,   96,   74,  158,  189,  200,  172,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,

			   84,   84,   84,   84,   84,   84,   84,   74,  157,   67,
			  158,  159,  159,  159,  159,  159,  121,  121,  121,  121,
			  121,  162,   74,  156,  212,   69,  155,  149,  149,  149,
			  150,  150,  150,  154,  188,  164,  164,  164,  164,  164,
			   74,   74,  151,  224,  162,  180,   96,   74,  212,   69,
			  102,  102,  105,  165,  165,  165,  165,  165,  188,   79,
			  166,  166,  166,  166,  166,   96,  224,   86,   96,  181,
			  175,  206,  175,  175,  175,  175,  175,   79,   86,   74,
			   96,  131,   74,   96,   79,   74,  136,   96,  136,  136,
			  136,  136,  136,  122,  167,  206,  167,  116,  129,  129,

			  129,  129,  129,  173,  136,  178,  137,  137,  137,  137,
			  137,   99,   99,   99,  168,  115,  217,  169,  198,  108,
			   61,  170,   74,   59,   86,  216,  216,  216,  216,  179,
			  101,  101,  101,  105,   96,   86,   74,   73,  168,  217,
			   86,  169,  199,   72,  170,  103,  103,  103,   99,   99,
			   99,   86,   99,   99,   99,  152,  153,  153,  153,  153,
			  153,  182,  223,  182,   71,   66,  183,  183,  183,  183,
			  183,  184,   67,   65,  185,  185,  185,  185,  185,  186,
			  186,  186,  186,  186,   61,  223,   59,  212,   69,  164,
			  164,  164,  164,  164,  165,  165,  165,  165,  165,  166,

			  166,  166,  166,  166,  262,  203,   86,  203,   75,  262,
			  262,  213,   69,   74,  262,  204,   75,   86,  126,  262,
			   75,  190,  190,  190,  190,  190,  191,  191,  191,  191,
			  191,   74,   75,  183,  183,  183,  183,  183,  205,   75,
			  262,  262,  126,   75,  192,  192,  192,  192,  192,  193,
			  193,  193,  193,  193,  193,  193,  193,  193,  193,  193,
			  193,  193,  194,  194,  193,  194,  194,  194,  194,  194,
			  193,  193,  193,  193,  193,  193,  194,  194,  194,  194,
			  194,  194,  194,  194,  194,  194,  194,  194,  194,  194,
			  194,  194,  194,  194,  193,  193,  262,  193,  194,  194,

			  194,  194,  194,  194,  194,  194,  194,  194,  194,  194,
			  194,  194,  194,  194,  194,  194,  193,  193,  193,  193,
			  193,  193,  193,  193,  193,  193,  193,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  196,  196,  195,  196,  196,  196,  196,  196,  195,  195,
			  195,  195,  195,  195,  196,  196,  196,  196,  196,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,
			  196,  196,  195,  195,  173,  195,  196,  196,  196,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,
			  196,  196,  196,  196,  195,  195,  195,  195,  195,  195,

			  195,  195,  195,  195,  195,  175,  200,  175,  175,  175,
			  175,  175,  183,  183,  183,  183,  183,  226,  226,  226,
			  262,   67,   86,  185,  185,  185,  185,  185,  262,  262,
			  201,  262,  262,   86,  262,  262,  262,   69,  197,  190,
			  190,  190,  190,  190,  191,  191,  191,  191,  191,  192,
			  192,  192,  192,  192,  214,  214,  214,  214,  214,  262,
			   75,   69,  207,  218,  262,   75,  262,  262,   75,  215,
			  215,  215,  215,  215,  262,   86,  221,  221,  221,  221,
			  221,  224,  262,  262,   75,  207,  219,  262,  262,   75,
			   86,  262,   75,  222,  222,  222,  222,  222,  262,  262, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  262,   86,  262,  262,  225,  227,  227,  227,  227,  227,
			  228,  229,  228,  229,  231,  231,  231,  231,  231,  205,
			  205,  205,  205,  205,  232,  232,  232,  232,  232,  233,
			  233,  233,  233,  233,  235,  235,  235,  235,  235,  228,
			  262,  228,  262,  230,  233,  233,  233,  233,  233,  237,
			  237,  237,  237,  237,  238,  238,  238,  238,  238,  230,
			  230,  230,  230,  230,  239,  262,  239,  242,  242,  242,
			  242,  242,  230,  262,  240,  243,  243,  243,  243,  244,
			  244,  244,  244,  244,  245,  245,  245,  245,  245,  246,
			  246,  246,  246,  246,  247,  262,  247,  241,  241,  241,

			  241,  241,  241,  262,  248,  250,  250,  250,  250,  250,
			  251,  251,  251,  251,  252,  252,  252,  252,  252,  253,
			  253,  253,  253,  253,  262,  262,  262,  249,  254,  254,
			  254,  254,  254,  255,  256,  255,  256,  249,  249,  249,
			  249,  249,  258,  258,  258,  258,  258,  259,  259,  259,
			  259,  259,  260,  260,  260,  260,  260,  261,  261,  261,
			  261,  261,  255,  262,  255,  262,  257,  259,  259,  259,
			  259,  259,  257,  257,  257,  257,  257,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  257,   46,   46,   46,   46,

			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   60,  262,
			   60,   60,   60,   60,   60,   60,   60,   60,   60,   60,
			   60,   60,   60,   60,   60,  262,   60,   60,   60,   60,
			   60,   60,   60,   60,   62,  262,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,

			   75,  262,  262,  262,  262,  262,  262,   75,   75,  262,
			  262,  262,   75,   75,   75,  262,   75,   75,   75,   75,
			   75,   75,   82,   82,  262,   82,   82,   82,   82,  262,
			  262,  262,   82,   82,   82,  262,   82,   82,   82,   82,
			   82,   82,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   95,  262,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,  262,   95,   95,   95,   95,   95,   95,
			   95,   95,  104,  104,  104,  104,  104,  104,  104,  104,

			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  262,  104,  106,  106,
			  106,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  107,  262,  107,  107,  107,  107,  107,  107,
			  107,  107,  107,  107,  107,  107,  107,  107,  107,  107,
			  107,  107,  107,  107,  107,  107,  107,  107,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   81,   81,  262,   81,   81,   81,

			   81,   81,  262,  262,   81,   81,   81,  262,   81,   81,
			   81,   81,   81,   81,   85,   85,  262,  262,   85,   85,
			   85,   85,   85,   85,   85,   85,  262,  262,   85,   85,
			   85,  262,   85,   85,   85,   85,   85,   85,  161,  262,
			  262,  262,  161,  262,  262,  161,  161,  262,  161,  161,
			  161,  161,  161,  262,  161,  161,  161,  161,  161,  161,
			  132,  132,  132,  132,  132,  132,  132,  132,  132,  132,
			  132,  132,  132,  132,  132,  132,  132,  132,  132,  132,
			  132,  132,  132,  132,  132,  132,  193,  193,  193,  193,
			  193,  193,  193,  193,  193,  193,  193,  193,  193,  193,

			  193,  193,  193,  193,  193,  193,  193,  193,  193,  193,
			  193,  193,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,    7,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,

			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262, yy_Dummy>>,
			1, 717, 1000)
		end

	yy_chk_template: SPECIAL [INTEGER]
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1716)
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
			   14,    5,    3,    5,    4,   32,    6,    4,    6,    9,
			   23,    9,   23,   23,   23,   23,   23,   24,   42,   24,

			   24,   24,   24,   24,   40,   33,   23,   49,   41,   32,
			   35,  231,   51,   24,   42,   40,   50,  223,   53,   14,
			  234,  234,   42,    3,   83,   42,   34,   52,    4,   80,
			   23,   41,   32,   41,   58,   83,   58,   24,   33,   34,
			   34,   34,   34,   34,   41,   35,   54,   77,   49,  214,
			    3,    3,    3,    3,    3,    4,    4,    4,    4,    4,
			   36,   36,   33,   34,   43,   36,   36,   80,   35,   67,
			   67,   67,   67,   67,   88,   77,   90,   86,   43,   51,
			  181,   50,   50,   50,   53,   53,   92,   43,   86,   43,
			   80,  181,   52,   52,   52,  115,  196,  115,   88,   77,

			   90,   36,   36,   39,   39,   39,   39,   39,   39,   92,
			  195,   54,   54,   54,   39,   39,   39,   39,   39,   39,
			   39,   39,   39,   39,   39,   39,   39,   39,   39,   39,
			   39,   39,  119,  119,  119,  119,   39,   39,   39,   39,
			   39,   39,   39,   39,   39,   39,   39,   39,   39,   39,
			   39,   39,   39,   39,   64,   68,   76,   68,   68,   68,
			   68,   68,   68,   64,   64,   64,   64,   64,   69,  194,
			   69,   68,  125,   69,   69,   69,   69,   69,   70,  134,
			   70,   70,   70,   70,   70,   79,  145,   76,   89,  100,
			  124,  193,   93,   64,   70,   68,   99,  140,   79,   79,

			   79,   79,   79,   93,  188,  134,   89,   64,   64,  125,
			   64,   76,   89,  101,   93,   93,   91,   89,   70,   78,
			  124,  140,   87,  130,   87,   87,   87,   87,   87,  138,
			  199,  225,   78,   78,   78,   78,   78,   91,  212,  142,
			   91,  199,  225,  187,  124,   78,  176,  184,   91,  139,
			  130,   78,  138,  145,  100,  100,  100,  171,   78,   78,
			   87,  212,  139,  142,   99,   99,   99,   99,   99,   78,
			  176,   87,  139,  139,  130,   78,  170,  161,  101,  101,
			  101,   78,   78,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,

			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			  163,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   84,  102,  163,  178,  103,  110,  110,  110,  110,
			  110,  110,  117,  117,  117,  117,  117,  120,  120,  120,
			  120,  120,  133,  132,  147,  123,  117,  163,  178,  131,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,

			   84,   84,   84,   84,   84,   84,   84,  162,  114,  118,
			  117,  118,  118,  118,  118,  118,  121,  121,  121,  121,
			  121,  123,  126,  113,  200,  118,  112,  102,  102,  102,
			  103,  103,  103,  111,  162,  126,  126,  126,  126,  126,
			  127,  189,  109,  218,  123,  143,  144,  128,  200,  118,
			  147,  147,  104,  127,  127,  127,  127,  127,  162,  126,
			  128,  128,  128,  128,  128,  146,  218,  143,   95,  143,
			  135,  189,  135,  135,  135,  135,  135,  127,  143,  206,
			  148,   81,   75,  149,  128,  129,  136,  150,  136,  136,
			  136,  136,  136,   74,  129,  189,  129,   66,  129,  129,

			  129,  129,  129,  135,  137,  141,  137,  137,  137,  137,
			  137,  144,  144,  144,  129,   65,  206,  129,  177,   62,
			   60,  129,  217,   59,  141,  204,  204,  204,  204,  141,
			  146,  146,  146,   55,   46,  141,   31,   30,  129,  206,
			  177,  129,  177,   29,  129,  148,  148,  148,  149,  149,
			  149,  177,  150,  150,  150,  153,  153,  153,  153,  153,
			  153,  158,  217,  158,   27,   21,  158,  158,  158,  158,
			  158,  159,  159,   20,  159,  159,  159,  159,  159,  160,
			  160,  160,  160,  160,   12,  217,   10,  201,  159,  164,
			  164,  164,  164,  164,  165,  165,  165,  165,  165,  166,

			  166,  166,  166,  166,    7,  186,  201,  186,  164,    0,
			    0,  201,  159,  168,    0,  186,  164,  201,  166,    0,
			  165,  167,  167,  167,  167,  167,  168,  168,  168,  168,
			  168,  169,  164,  182,  182,  182,  182,  182,  186,  164,
			    0,    0,  166,  165,  169,  169,  169,  169,  169,  172,
			  172,  172,  172,  172,  172,  172,  172,  172,  172,  172,
			  172,  172,  172,  172,  172,  172,  172,  172,  172,  172,
			  172,  172,  172,  172,  172,  172,  172,  172,  172,  172,
			  172,  172,  172,  172,  172,  172,  172,  172,  172,  172,
			  172,  172,  172,  172,  172,  172,    0,  172,  172,  172,

			  172,  172,  172,  172,  172,  172,  172,  172,  172,  172,
			  172,  172,  172,  172,  172,  172,  172,  172,  172,  172,
			  172,  172,  172,  172,  172,  172,  172,  174,  174,  174,
			  174,  174,  174,  174,  174,  174,  174,  174,  174,  174,
			  174,  174,  174,  174,  174,  174,  174,  174,  174,  174,
			  174,  174,  174,  174,  174,  174,  174,  174,  174,  174,
			  174,  174,  174,  174,  174,  174,  174,  174,  174,  174,
			  174,  174,  174,  174,  174,  174,  174,  174,  174,  174,
			  174,  174,  174,  174,  174,  174,  174,  174,  174,  174,
			  174,  174,  174,  174,  174,  174,  174,  174,  174,  174,

			  174,  174,  174,  174,  174,  175,  179,  175,  175,  175,
			  175,  175,  183,  183,  183,  183,  183,  220,  220,  220,
			    0,  185,  179,  185,  185,  185,  185,  185,    0,    0,
			  179,    0,    0,  179,    0,    0,    0,  185,  175,  190,
			  190,  190,  190,  190,  191,  191,  191,  191,  191,  192,
			  192,  192,  192,  192,  202,  202,  202,  202,  202,    0,
			  191,  185,  190,  213,    0,  192,    0,    0,  192,  203,
			  203,  203,  203,  203,    0,  213,  215,  215,  215,  215,
			  215,  219,    0,    0,  191,  190,  213,    0,    0,  192,
			  219,    0,  192,  216,  216,  216,  216,  216,    0,    0, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,  219,    0,    0,  219,  221,  221,  221,  221,  221,
			  222,  222,  222,  222,  226,  226,  226,  226,  226,  227,
			  227,  227,  227,  227,  228,  228,  228,  228,  228,  229,
			  229,  229,  229,  229,  232,  232,  232,  232,  232,  233,
			    0,  233,    0,  222,  233,  233,  233,  233,  233,  235,
			  235,  235,  235,  235,  236,  236,  236,  236,  236,  237,
			  237,  237,  237,  237,  238,    0,  238,  239,  239,  239,
			  239,  239,  233,    0,  238,  240,  240,  240,  240,  242,
			  242,  242,  242,  242,  243,  243,  243,  243,  243,  244,
			  244,  244,  244,  244,  245,    0,  245,  238,  246,  246,

			  246,  246,  246,    0,  245,  247,  247,  247,  247,  247,
			  248,  248,  248,  248,  250,  250,  250,  250,  250,  251,
			  251,  251,  251,  251,    0,    0,    0,  245,  252,  252,
			  252,  252,  252,  253,  253,  253,  253,  254,  254,  254,
			  254,  254,  255,  255,  255,  255,  255,  256,  256,  256,
			  256,  256,  258,  258,  258,  258,  258,  260,  260,  260,
			  260,  260,  259,    0,  259,    0,  253,  259,  259,  259,
			  259,  259,  261,  261,  261,  261,  261,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  259,  263,  263,  263,  263,

			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  264,  264,  264,  264,  264,  264,  264,  264,
			  264,  264,  264,  264,  264,  264,  264,  264,  264,  264,
			  264,  264,  264,  264,  264,  264,  264,  264,  265,    0,
			  265,  265,  265,  265,  265,  265,  265,  265,  265,  265,
			  265,  265,  265,  265,  265,    0,  265,  265,  265,  265,
			  265,  265,  265,  265,  266,    0,  266,  266,  266,  266,
			  266,  266,  266,  266,  266,  266,  266,  266,  266,  266,
			  266,  266,  266,  266,  266,  266,  266,  266,  266,  266,

			  267,    0,    0,    0,    0,    0,    0,  267,  267,    0,
			    0,    0,  267,  267,  267,    0,  267,  267,  267,  267,
			  267,  267,  268,  268,    0,  268,  268,  268,  268,    0,
			    0,    0,  268,  268,  268,    0,  268,  268,  268,  268,
			  268,  268,  269,  269,  269,  269,  269,  269,  269,  269,
			  269,  269,  269,  269,  269,  269,  269,  269,  269,  269,
			  269,  269,  269,  269,  269,  269,  270,    0,  270,  270,
			  270,  270,  270,  270,  270,  270,  270,  270,  270,  270,
			  270,  270,  270,    0,  270,  270,  270,  270,  270,  270,
			  270,  270,  271,  271,  271,  271,  271,  271,  271,  271,

			  271,  271,  271,  271,  271,  271,  271,  271,  271,  271,
			  271,  271,  271,  271,  271,  271,    0,  271,  272,  272,
			  272,  272,  272,  272,  272,  272,  272,  272,  272,  272,
			  272,  272,  272,  272,  272,  272,  272,  272,  272,  272,
			  272,  272,  273,    0,  273,  273,  273,  273,  273,  273,
			  273,  273,  273,  273,  273,  273,  273,  273,  273,  273,
			  273,  273,  273,  273,  273,  273,  273,  273,  274,  274,
			  274,  274,  274,  274,  274,  274,  274,  274,  274,  274,
			  274,  274,  274,  274,  274,  274,  274,  274,  274,  274,
			  274,  274,  274,  274,  275,  275,    0,  275,  275,  275,

			  275,  275,    0,    0,  275,  275,  275,    0,  275,  275,
			  275,  275,  275,  275,  276,  276,    0,    0,  276,  276,
			  276,  276,  276,  276,  276,  276,    0,    0,  276,  276,
			  276,    0,  276,  276,  276,  276,  276,  276,  277,    0,
			    0,    0,  277,    0,    0,  277,  277,    0,  277,  277,
			  277,  277,  277,    0,  277,  277,  277,  277,  277,  277,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  279,  279,  279,  279,
			  279,  279,  279,  279,  279,  279,  279,  279,  279,  279,

			  279,  279,  279,  279,  279,  279,  279,  279,  279,  279,
			  279,  279,  280,  280,  280,  280,  280,  280,  280,  280,
			  280,  280,  280,  280,  280,  280,  280,  280,  280,  280,
			  280,  280,  280,  280,  280,  280,  280,  280,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,

			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262, yy_Dummy>>,
			1, 717, 1000)
		end

	yy_base_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   76,   81,   13,   18,  704, 1638,   87,
			  683, 1638,  678, 1638,   72, 1638, 1638, 1638, 1638, 1638,
			  659,  650, 1638,   75,   82, 1638, 1638,  639, 1638,  618,
			  610,  632,   81,  101,  122,  106,  151, 1638, 1638,  186,
			   51,   80,   61,  125,    0, 1638,  628, 1638, 1638,  101,
			  110,  106,  121,  112,  140,  563,    0, 1638,  132,  620,
			  614, 1638,  611,    0,  246,  612,  582,  152,  240,  256,
			  263, 1638, 1638, 1638,  569,  578,  252,  143,  315,  281,
			  125,  559,  382,   71,  439,    0,  124,  307,  139,  253,
			  144,  284,  144,  250,    0,  562, 1638, 1638, 1638,  290,

			  283,  307,  456,  459,  482, 1638,    0, 1638, 1638,  534,
			  450,  525,  518,  515,  500,  193, 1638,  455,  494,  215,
			  460,  499,    0,  481,  286,  268,  518,  536,  543,  581,
			  319,  467,  435,  434,  257,  555,  571,  589,  289,  309,
			  263,  571,  308,  514,  540,  280,  559,  478,  574,  577,
			  581, 1638, 1638,  639, 1638, 1638, 1638, 1638,  649,  657,
			  662,  351,  503,  426,  672,  677,  682,  704,  709,  727,
			  372,  353,  748, 1638,  826,  890,  315,  587,  427,  869,
			    0,  127,  716,  895,  330,  906,  693,  317,  300,  537,
			  922,  927,  932,  243,  221,  162,  148, 1638,    0,  277,

			  490,  653,  937,  952,  608, 1638,  575, 1638, 1638, 1638,
			 1638, 1638,  297,  922,  135,  959,  976,  618,  499,  937,
			  900,  988,  998,  113,    0,  278,  997, 1002, 1007, 1012,
			 1638,   70, 1017, 1027,  103, 1032, 1037, 1042, 1052, 1050,
			 1058, 1638, 1062, 1067, 1072, 1082, 1081, 1088, 1093, 1638,
			 1097, 1102, 1111, 1121, 1120, 1125, 1130, 1638, 1135, 1150,
			 1140, 1155, 1638, 1195, 1221, 1247, 1273, 1297, 1317, 1341,
			 1365, 1391, 1417, 1441, 1467, 1489, 1513, 1535, 1559, 1585,
			 1611, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,  262,    1,  263,  263,  264,  264,  262,  262,  262,
			  262,  262,  265,  262,  266,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  267,  267,  267,  267,  267,  268,  262,  262,  262,
			   39,   39,   39,   39,  269,  262,  270,  262,  262,  262,
			  270,  270,  270,  270,  270,  271,  272,  262,  262,  262,
			  265,  262,  273,  273,  273,  274,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  267,  267,  267,  267,  267,
			  267,  275,  262,   82,   39,  276,   39,   39,   84,   39,
			   84,   39,   84,   39,  269,  270,  262,  262,  262,  270,

			  270,  270,  270,  270,  271,  262,  272,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  277,  267,  267,  267,  267,  267,  267,  267,
			  267,  262,  278,   82,  278,   82,  262,   84,   84,   39,
			   84,   39,   84,   39,  270,  270,  270,  270,  270,  270,
			  270,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  277,  267,  267,   78,  164,  164,  262,  267,  267,
			  267,  267,  262,  262,  262,   82,   84,   39,   84,   39,
			   84,   39,  262,  262,  262,  262,  262,  277,  267,  267,
			  262,  129,  129,  279,  172,  280,  174,  262,   84,   39,

			   84,   39,  262,  262,  262,  262,  267,  262,  262,  262,
			  262,  262,   84,   39,  262,  262,  262,  267,   84,   39,
			  262,  262,  262,  267,   84,   39,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,    0,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER]
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
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,   77,   75,    1,
			    2,   14,   59,   17,   75,   15,   16,    7,    6,   12,
			    5,   10,    8,   54,   54,   13,   11,   26,   23,   27,
			   19,   48,   48,   48,   47,   48,   21,   22,    9,   50,
			   50,   50,   50,   50,   51,   20,   63,   64,   65,   66,
			   63,   63,   63,   63,   63,   76,   52,   53,    1,    2,
			   59,   58,   73,   73,   73,    3,   28,    0,   54,    0,
			   54,   25,   24,   18,    0,   48,   48,   48,   48,   46,
			   48,    0,    0,    0,   50,   33,   50,   50,   50,   50,
			   50,   50,   50,   50,   51,   63,   65,   61,   60,   62,

			   63,   63,   63,   63,    0,   53,   52,   73,   67,   73,
			   73,   73,   73,   73,   73,    4,   29,   56,   54,    0,
			    0,   55,    0,   48,   48,   47,   47,   47,   47,   48,
			   48,    0,    0,    0,    0,    0,   38,   38,   50,   50,
			   50,   50,   50,   50,   63,   63,   63,   63,   63,   63,
			   63,   71,   74,   74,   72,   68,   69,   70,    0,   54,
			    0,    0,   48,   48,   48,   48,   48,    0,   46,   46,
			   46,   30,    0,   37,    0,    0,   50,   50,   50,   50,
			   30,   30,    0,   57,    0,   54,   43,   49,   31,   48,
			    0,   48,   48,    0,    0,    0,    0,   36,   31,   31,

			   50,   50,    0,    0,    0,   43,   48,   46,   35,   34,
			   35,   34,   50,   50,   45,    0,    0,   48,   50,   50,
			    0,    0,   42,   32,   32,   32,    0,    0,    0,    0,
			   42,   44,    0,   42,    0,    0,    0,    0,   41,    0,
			    0,   41,    0,    0,    0,   40,    0,    0,    0,   40,
			    0,    0,    0,   39,    0,    0,    0,   39,    0,   39,
			    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 1638
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 262
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 263
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
