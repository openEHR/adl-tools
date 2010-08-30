note
	component:   "openEHR Archetype Project"
	description: "Scanner for dADL syntax items"
	keywords:    "ADL, dADL"
	
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
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
--|#line 63 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 63")
end
-- Ignore separators
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 64 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 64")
end
in_lineno := in_lineno + text_count
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 69 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 69")
end
-- Ignore comments
end
else
if yy_act = 4 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 70 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 70")
end
in_lineno := in_lineno + 1
else
	yy_position := yy_position + 1
--|#line 74 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 74")
end
last_token := Minus_code
end
end
else
if yy_act <= 8 then
if yy_act <= 7 then
if yy_act = 6 then
	yy_position := yy_position + 1
--|#line 75 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 75")
end
last_token := Plus_code
else
	yy_position := yy_position + 1
--|#line 76 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 76")
end
last_token := Star_code
end
else
	yy_position := yy_position + 1
--|#line 77 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 77")
end
last_token := Slash_code
end
else
if yy_act = 9 then
	yy_position := yy_position + 1
--|#line 78 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 78")
end
last_token := Caret_code
else
	yy_position := yy_position + 1
--|#line 79 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 79")
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
--|#line 80 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 80")
end
last_token := Semicolon_code
else
	yy_position := yy_position + 1
--|#line 81 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 81")
end
last_token := Comma_code
end
else
	yy_position := yy_position + 1
--|#line 82 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 82")
end
last_token := Colon_code
end
else
if yy_act = 14 then
	yy_position := yy_position + 1
--|#line 83 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 83")
end
last_token := Exclamation_code
else
	yy_position := yy_position + 1
--|#line 84 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 84")
end
last_token := Left_parenthesis_code
end
end
else
if yy_act <= 17 then
if yy_act = 16 then
	yy_position := yy_position + 1
--|#line 85 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 85")
end
last_token := Right_parenthesis_code
else
	yy_position := yy_position + 1
--|#line 86 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 86")
end
last_token := Dollar_code
end
else
if yy_act = 18 then
	yy_position := yy_position + 2
--|#line 87 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 87")
end
last_token := SYM_DT_UNKNOWN
else
	yy_position := yy_position + 1
--|#line 88 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 88")
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
--|#line 90 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 90")
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
--|#line 100 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 100")
end
last_token := Left_bracket_code
end
else
	yy_position := yy_position + 1
--|#line 101 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 101")
end
last_token := Right_bracket_code
end
else
if yy_act = 23 then
	yy_position := yy_position + 1
--|#line 103 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 103")
end
last_token := SYM_EQ
else
	yy_position := yy_position + 2
--|#line 105 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 105")
end
last_token := SYM_GE
end
end
else
if yy_act <= 27 then
if yy_act <= 26 then
if yy_act = 25 then
	yy_position := yy_position + 2
--|#line 106 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 106")
end
last_token := SYM_LE
else
	yy_position := yy_position + 1
--|#line 108 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 108")
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
--|#line 119 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 119")
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
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 140 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 140")
end

	last_token := V_URI
	last_string_value := text

else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 146 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 146")
end

					last_token := V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
end
else
if yy_act <= 36 then
if yy_act = 35 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 151 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 151")
end

					last_token := ERR_V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 156 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 156")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 37 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 161 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 161")
end

					last_token := ERR_V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 167 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 167")
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
--|#line 174 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 174")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 175 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 175")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 176 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 176")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
if yy_act = 42 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 183 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 183")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 184 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 184")
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
--|#line 191 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 191")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
	yy_position := yy_position + 7
--|#line 192 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 192")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 202 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 202")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
else
if yy_act = 47 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 203 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 203")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 209 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 209")
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
--|#line 214 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 214")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 219 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 219")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 226 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 226")
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
--|#line 237 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 237")
end
		-- got an open brace
				in_buffer.append_string (text)
				cadl_depth := cadl_depth + 1
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 241 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 241")
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
--|#line 258 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 258")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 259 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 259")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
else
if yy_act = 56 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 266 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 266")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 267 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 267")
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
--|#line 274 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 274")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 279 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 279")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
end
else
	yy_position := yy_position + 2
--|#line 287 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 287")
end
in_buffer.append_character ('\')
end
else
if yy_act = 61 then
	yy_position := yy_position + 2
--|#line 289 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 289")
end
in_buffer.append_character ('"')
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 291 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 291")
end

				in_buffer.append_string (text)
	
end
end
else
if yy_act <= 65 then
if yy_act <= 64 then
if yy_act = 63 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 295 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 295")
end
in_buffer.append_string (text)
else
	yy_position := yy_position + 1
--|#line 297 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 297")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
else
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

				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_
				set_start_condition (INITIAL)
			
end
else
if yy_act = 66 then
	yy_position := yy_position + 1
--|#line 315 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 315")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
else
	yy_position := yy_position + 3
--|#line 325 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 325")
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
--|#line 327 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 327")
end
last_token := V_CHARACTER; last_character_value := '%N'
else
	yy_position := yy_position + 4
--|#line 328 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 328")
end
last_token := V_CHARACTER; last_character_value := '%R'
end
else
	yy_position := yy_position + 4
--|#line 329 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 329")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 71 then
	yy_position := yy_position + 4
--|#line 330 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 330")
end
last_token := V_CHARACTER; last_character_value := '%''
else
	yy_position := yy_position + 4
--|#line 331 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 331")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 74 then
if yy_act = 73 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 333 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 333")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 334 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 334")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 75 then
	yy_position := yy_position + 1
--|#line 338 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 338")
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
			create an_array.make (0, 1684)
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
			    8,    8,    8,    8,    8,    8,    8,    8,    8,    8,
			   47,   63,   56,   48,   57,   47,   75,   56,   48,   57,
			   58,   67,   58,   68,   68,   68,   68,   68,   67,   77,

			   70,   70,   70,   70,   70,   75,   75,   69,  235,   76,
			   97,   58,   75,   58,   69,   78,   78,   78,   78,   78,
			   64,   80,   75,   77,   49,   75,   86,  143,  115,   49,
			  115,   69,   76,  221,   75,   81,   81,   86,   69,   79,
			   81,   81,   96,  130,   80,  123,  237,  237,   88,   92,
			  143,   98,   50,   51,   52,   53,   54,   50,   51,   52,
			   53,   54,   96,   86,  135,   96,  130,   96,  212,  123,
			   96,   89,   93,   86,   86,  135,   81,   83,   84,   84,
			   84,   84,   84,   85,   86,  161,  161,  161,  161,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,

			   84,   84,   84,   84,   84,   84,   84,  211,   99,   99,
			   99,   84,   86,   86,   87,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   87,   86,   86,   86,   90,
			  100,  101,  101,  101,  102,  102,  103,  103,  103,  109,
			  117,  117,  117,  117,  117,   86,  139,   86,  110,  110,
			  110,  110,  110,   91,   75,   86,   86,   67,   86,  118,
			  118,  118,  118,  118,  119,   96,   86,   75,  210,  209,
			  139,   79,  141,   69,  120,  124,  120,   75,  111,  121,
			  121,  121,  121,  121,   67,  203,  118,  118,  118,  118,
			  118,   96,  112,  113,   96,  114,  141,   69,  141,  124,

			   69,  129,  129,  129,  129,  129,   75,  137,   75,  138,
			  138,  138,  138,  138,   75,  180,  164,  139,   75,   86,
			  143,   75,  142,  175,   69,   78,   78,   78,   78,   78,
			   86,   86,   75,  100,  162,   86,   86,  163,  125,  180,
			  164,  140,   86,  144,  126,   86,   86,   86,  177,  174,
			   86,  127,  128,  227,  227,  227,   86,   99,   99,   99,
			  163,   86,  125,  145,  146,  147,  148,  149,  126,  121,
			  121,  121,  121,  121,  127,  128,  132,  132,  132,  132,
			  132,  132,  132,  132,  133,  133,  132,  132,  132,  133,
			  133,  132,  133,  133,  133,  133,  133,  134,  132,  132,

			  132,  132,  132,  133,  133,  133,  133,  133,  133,  133,
			  133,  133,  133,  133,  133,  133,  133,  133,  133,  133,
			  133,  132,  132,  174,  132,  133,  133,  133,  133,  133,
			  133,  133,  133,  133,  133,  133,  133,  133,  133,  133,
			  133,  133,  133,  132,  132,  132,  132,  132,  132,  132,
			  132,  132,  132,  132,  132,  263,   96,  178,  182,   96,
			  174,  173,   96,  153,  154,  154,  154,  154,  154,  117,
			  117,  117,  117,  117,  121,  121,  121,  121,  121,  219,
			  178,  182,  182,  159,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,

			   84,   75,  219,   86,  162,  183,  158,  159,  172,  165,
			  165,  165,  165,  165,   86,   67,   75,  160,  160,  160,
			  160,  160,   99,   99,   99,  150,  150,  150,  151,  151,
			  151,   69,  172,   79,  166,  166,  166,  166,  166,  157,
			  156,   75,  167,  167,  167,  167,  167,  225,  176,   75,
			  176,  176,  176,  176,  176,   69,   96,  137,   79,  137,
			  137,  137,  137,  137,   96,  155,   79,  168,   96,  168,
			  225,  129,  129,  129,  129,  129,  178,  180,   75,   96,
			  137,  174,  138,  138,  138,  138,  138,  169,   96,   86,
			  170,   96,  199,  152,  171,  105,   86,   75,   96,  179,

			   86,  181,  188,  188,  188,  188,  188,   86,  136,  201,
			  190,  169,   75,  131,  170,   75,  199,  171,  116,  189,
			  213,  115,   99,   99,   99,  191,  191,  191,  191,  191,
			  101,  101,  101,  201,  190,  102,  102,  153,  154,  154,
			  154,  154,  154,  189,  213,  103,  103,  103,  185,  185,
			  185,  185,  185,  108,   99,   99,   99,   99,   99,   99,
			  184,  199,  184,   61,   59,  185,  185,  185,  185,  185,
			  186,   67,  219,  187,  187,  187,  187,  187,  165,  165,
			  165,  165,  165,   86,   86,  200,   75,   69,  166,  166,
			  166,  166,  166,  105,   86,  220,  207,   74,  167,  167,

			  167,  167,  167,  201,   96,   74,  192,  192,  192,  192,
			  192,   69,   75,   75,   74,   73,   72,  126,   71,   86,
			  207,   74,  193,  193,  193,  193,  193,  202,   74,   75,
			   86,  185,  185,  185,  185,  185,   66,   74,   65,   61,
			   59,  126,  194,  194,  194,  194,  194,  194,  194,  194,
			  194,  194,  194,  194,  194,  195,  195,  194,  195,  195,
			  195,  195,  195,  194,  194,  194,  194,  194,  194,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  194,  194,  263,
			  194,  195,  195,  195,  195,  195,  195,  195,  195,  195,

			  195,  195,  195,  195,  195,  195,  195,  195,  195,  194,
			  194,  194,  194,  194,  194,  194,  194,  194,  194,  194,
			  194,  196,  196,  196,  196,  196,  196,  196,  196,  196,
			  196,  196,  196,  196,  197,  197,  196,  197,  197,  197,
			  197,  197,  196,  196,  196,  196,  196,  196,  197,  197,
			  197,  197,  197,  197,  197,  197,  197,  197,  197,  197,
			  197,  197,  197,  197,  197,  197,  196,  196,  174,  196,
			  197,  197,  197,  197,  197,  197,  197,  197,  197,  197,
			  197,  197,  197,  197,  197,  197,  197,  197,  196,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,

			  176,  263,  176,  176,  176,  176,  176,   67,  263,  187,
			  187,  187,  187,  187,   75,  204,  263,  204,  191,  191,
			  191,  191,  191,   69,  263,  205,  192,  192,  192,  192,
			  192,  218,  213,  198,  193,  193,  193,  193,  193,  263,
			  263,  208,   74,  217,  217,  217,  217,   69,  206,  263,
			   74,   86,   75,   74,  218,  263,  214,  215,  215,  215,
			  215,  215,   86,  240,  208,  240,   74,  216,  216,  216,
			  216,  216,  224,  241,   74,  263,  263,   74,  222,  222,
			  222,  222,  222,  223,  223,  223,  223,  223,  225,  228,
			  228,  228,  228,  228,  263,  224,  242,   86,  229,  230, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  229,  230,  232,  232,  232,  232,  232,  263,   86,  263,
			  263,  226,  206,  206,  206,  206,  206,  233,  233,  233,
			  233,  233,  234,  234,  234,  234,  234,  244,  244,  244,
			  244,  231,  236,  236,  236,  236,  236,  229,  263,  229,
			  263,  263,  234,  234,  234,  234,  234,  238,  238,  238,
			  238,  238,  239,  239,  239,  239,  239,  231,  231,  231,
			  231,  231,  243,  243,  243,  243,  243,  263,  263,  263,
			  231,  245,  245,  245,  245,  245,  246,  246,  246,  246,
			  246,  247,  247,  247,  247,  247,  248,  263,  248,  242,
			  242,  242,  242,  242,  263,  263,  249,  251,  251,  251,

			  251,  251,  252,  252,  252,  252,  253,  253,  253,  253,
			  253,  254,  254,  254,  254,  254,  263,  263,  263,  250,
			  255,  255,  255,  255,  255,  256,  257,  256,  257,  250,
			  250,  250,  250,  250,  259,  259,  259,  259,  259,  260,
			  260,  260,  260,  260,  261,  261,  261,  261,  261,  262,
			  262,  262,  262,  262,  256,  263,  256,  263,  258,  260,
			  260,  260,  260,  260,  258,  258,  258,  258,  258,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  258,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,

			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   60,  263,
			   60,   60,   60,   60,   60,   60,   60,   60,   60,   60,
			   60,   60,  263,   60,   60,   60,   60,   60,   60,   60,
			   60,   60,   60,   62,  263,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   74,   74,
			  263,   74,  263,   74,  263,   74,   74,   74,   74,   74,

			   74,   74,   74,   82,   82,  263,   82,   82,   82,   82,
			  263,  263,  263,   82,  263,   82,   82,   82,   82,   82,
			   82,   82,   82,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   95,  263,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			  263,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  263,  104,  106,  106,  106,  106,

			  106,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  106,  106,  106,  107,
			  263,  107,  107,  107,  107,  107,  107,  107,  107,  107,
			  107,  107,  107,  107,  107,  107,  107,  107,  107,  107,
			  107,  107,  107,  107,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,  122,
			  263,  263,  122,  122,  263,  122,  122,  122,  263,  122,
			  122,  122,  122,  122,  122,  122,  122,   81,   81,  263,
			   81,   81,   81,   81,   81,  263,  263,   81,  263,   81,

			   81,   81,   81,   81,   81,   81,   81,  132,  132,  132,
			  132,  132,  132,  132,  132,  132,  132,  132,  132,  132,
			  132,  132,  132,  132,  132,  132,  132,  132,  132,  132,
			  132,  132,  177,  177,  263,  177,  177,  177,  177,  177,
			  177,  177,  177,  263,  263,  177,  263,  177,  177,  177,
			  177,  177,  177,  177,  177,  194,  194,  194,  194,  194,
			  194,  194,  194,  194,  194,  194,  194,  194,  194,  194,
			  194,  194,  194,  194,  194,  194,  194,  194,  194,  194,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,

			  196,  196,  196,  196,  196,    7,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263, yy_Dummy>>,
			1, 685, 1000)
		end

	yy_chk_template: SPECIAL [INTEGER]
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 1684)
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
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    3,   14,    5,    3,    5,    4,   33,    6,    4,    6,
			    9,   23,    9,   23,   23,   23,   23,   23,   24,   33,

			   24,   24,   24,   24,   24,   32,   35,   23,  232,   32,
			   49,   58,  224,   58,   24,   34,   34,   34,   34,   34,
			   14,   35,   34,   33,    3,   80,   40,   92,  115,    4,
			  115,   23,   32,  215,   76,   36,   36,   40,   24,   34,
			   36,   36,   50,   80,   35,   76,  235,  235,   41,   43,
			   92,   49,    3,    3,    3,    3,    3,    4,    4,    4,
			    4,    4,   51,   43,   83,   52,   80,   53,  197,   76,
			   54,   41,   43,   41,   43,   83,   36,   36,   39,   39,
			   39,   39,   39,   39,   41,  119,  119,  119,  119,   39,
			   39,   39,   39,   39,   39,   39,   39,   39,   39,   39,

			   39,   39,   39,   39,   39,   39,   39,  196,   50,   50,
			   50,   39,   39,   39,   39,   39,   39,   39,   39,   39,
			   39,   39,   39,   39,   39,   39,   39,   39,   39,   42,
			   51,   52,   52,   52,   53,   53,   54,   54,   54,   64,
			   67,   67,   67,   67,   67,   42,   88,   86,   64,   64,
			   64,   64,   64,   42,  125,  183,   42,   68,   86,   68,
			   68,   68,   68,   68,   68,  146,  183,   77,  195,  194,
			   88,  125,   90,   68,   69,   77,   69,  189,   64,   69,
			   69,   69,   69,   69,   70,  186,   70,   70,   70,   70,
			   70,  100,   64,   64,   99,   64,   90,   68,   91,   77,

			   70,   79,   79,   79,   79,   79,  124,   87,   79,   87,
			   87,   87,   87,   87,  172,  141,  124,   89,  171,   91,
			   93,  123,   91,  134,   70,   78,   78,   78,   78,   78,
			   91,   93,   78,  146,  162,   89,  200,  123,   78,  141,
			  124,   89,   93,   93,   78,   87,   89,  200,  136,  134,
			  226,   78,   78,  221,  221,  221,   87,  100,  100,  100,
			  123,  226,   78,   99,   99,   99,   99,   99,   78,  120,
			  120,  120,  120,  120,   78,   78,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,

			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,  133,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   84,  101,  139,  143,  102,
			  132,  131,  103,  110,  110,  110,  110,  110,  110,  117,
			  117,  117,  117,  117,  121,  121,  121,  121,  121,  213,
			  139,  144,  143,  117,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,

			   84,  130,  213,  144,  122,  144,  114,  117,  130,  126,
			  126,  126,  126,  126,  144,  118,  126,  118,  118,  118,
			  118,  118,  101,  101,  101,  102,  102,  102,  103,  103,
			  103,  118,  130,  126,  127,  127,  127,  127,  127,  113,
			  112,  127,  128,  128,  128,  128,  128,  219,  135,  128,
			  135,  135,  135,  135,  135,  118,  145,  137,  127,  137,
			  137,  137,  137,  137,  147,  111,  128,  129,  148,  129,
			  219,  129,  129,  129,  129,  129,  140,  142,  129,  149,
			  138,  135,  138,  138,  138,  138,  138,  129,  150,  140,
			  129,  151,  178,  109,  129,  104,  142,  164,   95,  140,

			  140,  142,  161,  161,  161,  161,  161,  142,   85,  180,
			  164,  129,  163,   81,  129,   74,  178,  129,   66,  163,
			  201,   65,  145,  145,  145,  168,  168,  168,  168,  168,
			  147,  147,  147,  180,  164,  148,  148,  154,  154,  154,
			  154,  154,  154,  163,  201,  149,  149,  149,  184,  184,
			  184,  184,  184,   62,  150,  150,  150,  151,  151,  151,
			  159,  179,  159,   60,   59,  159,  159,  159,  159,  159,
			  160,  160,  214,  160,  160,  160,  160,  160,  165,  165,
			  165,  165,  165,  179,  214,  179,  190,  160,  166,  166,
			  166,  166,  166,   55,  179,  214,  190,  165,  167,  167,

			  167,  167,  167,  181,   46,  165,  169,  169,  169,  169,
			  169,  160,   31,  169,  166,   30,   29,  167,   27,  181,
			  190,  165,  170,  170,  170,  170,  170,  181,  165,  170,
			  181,  185,  185,  185,  185,  185,   21,  166,   20,   12,
			   10,  167,  173,  173,  173,  173,  173,  173,  173,  173,
			  173,  173,  173,  173,  173,  173,  173,  173,  173,  173,
			  173,  173,  173,  173,  173,  173,  173,  173,  173,  173,
			  173,  173,  173,  173,  173,  173,  173,  173,  173,  173,
			  173,  173,  173,  173,  173,  173,  173,  173,  173,    7,
			  173,  173,  173,  173,  173,  173,  173,  173,  173,  173,

			  173,  173,  173,  173,  173,  173,  173,  173,  173,  173,
			  173,  173,  173,  173,  173,  173,  173,  173,  173,  173,
			  173,  175,  175,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,  175,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,  175,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,  175,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,  175,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,  175,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,  175,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,  175,  175,  175,  175,  175,  175,  175,  175,

			  176,    0,  176,  176,  176,  176,  176,  187,    0,  187,
			  187,  187,  187,  187,  207,  188,    0,  188,  191,  191,
			  191,  191,  191,  187,    0,  188,  192,  192,  192,  192,
			  192,  207,  202,  176,  193,  193,  193,  193,  193,    0,
			    0,  191,  192,  205,  205,  205,  205,  187,  188,    0,
			  193,  202,  218,  193,  207,    0,  202,  203,  203,  203,
			  203,  203,  202,  239,  191,  239,  192,  204,  204,  204,
			  204,  204,  218,  239,  193,    0,    0,  193,  216,  216,
			  216,  216,  216,  217,  217,  217,  217,  217,  220,  222,
			  222,  222,  222,  222,    0,  218,  239,  220,  223,  223, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  223,  223,  227,  227,  227,  227,  227,    0,  220,    0,
			    0,  220,  228,  228,  228,  228,  228,  229,  229,  229,
			  229,  229,  230,  230,  230,  230,  230,  241,  241,  241,
			  241,  223,  233,  233,  233,  233,  233,  234,    0,  234,
			    0,    0,  234,  234,  234,  234,  234,  236,  236,  236,
			  236,  236,  237,  237,  237,  237,  237,  238,  238,  238,
			  238,  238,  240,  240,  240,  240,  240,    0,    0,    0,
			  234,  243,  243,  243,  243,  243,  244,  244,  244,  244,
			  244,  245,  245,  245,  245,  245,  246,    0,  246,  247,
			  247,  247,  247,  247,    0,    0,  246,  248,  248,  248,

			  248,  248,  249,  249,  249,  249,  251,  251,  251,  251,
			  251,  252,  252,  252,  252,  252,    0,    0,    0,  246,
			  253,  253,  253,  253,  253,  254,  254,  254,  254,  255,
			  255,  255,  255,  255,  256,  256,  256,  256,  256,  257,
			  257,  257,  257,  257,  259,  259,  259,  259,  259,  261,
			  261,  261,  261,  261,  260,    0,  260,    0,  254,  260,
			  260,  260,  260,  260,  262,  262,  262,  262,  262,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  260,  264,  264,
			  264,  264,  264,  264,  264,  264,  264,  264,  264,  264,

			  264,  264,  264,  264,  264,  264,  264,  264,  264,  264,
			  264,  264,  264,  265,  265,  265,  265,  265,  265,  265,
			  265,  265,  265,  265,  265,  265,  265,  265,  265,  265,
			  265,  265,  265,  265,  265,  265,  265,  265,  266,    0,
			  266,  266,  266,  266,  266,  266,  266,  266,  266,  266,
			  266,  266,    0,  266,  266,  266,  266,  266,  266,  266,
			  266,  266,  266,  267,    0,  267,  267,  267,  267,  267,
			  267,  267,  267,  267,  267,  267,  267,  267,  267,  267,
			  267,  267,  267,  267,  267,  267,  267,  267,  268,  268,
			    0,  268,    0,  268,    0,  268,  268,  268,  268,  268,

			  268,  268,  268,  269,  269,    0,  269,  269,  269,  269,
			    0,    0,    0,  269,    0,  269,  269,  269,  269,  269,
			  269,  269,  269,  270,  270,  270,  270,  270,  270,  270,
			  270,  270,  270,  270,  270,  270,  270,  270,  270,  270,
			  270,  270,  270,  270,  270,  270,  271,    0,  271,  271,
			  271,  271,  271,  271,  271,  271,  271,  271,  271,  271,
			    0,  271,  271,  271,  271,  271,  271,  271,  271,  271,
			  271,  272,  272,  272,  272,  272,  272,  272,  272,  272,
			  272,  272,  272,  272,  272,  272,  272,  272,  272,  272,
			  272,  272,  272,  272,    0,  272,  273,  273,  273,  273,

			  273,  273,  273,  273,  273,  273,  273,  273,  273,  273,
			  273,  273,  273,  273,  273,  273,  273,  273,  273,  274,
			    0,  274,  274,  274,  274,  274,  274,  274,  274,  274,
			  274,  274,  274,  274,  274,  274,  274,  274,  274,  274,
			  274,  274,  274,  274,  275,  275,  275,  275,  275,  275,
			  275,  275,  275,  275,  275,  275,  275,  275,  275,  275,
			  275,  275,  275,  275,  275,  275,  275,  275,  275,  276,
			    0,    0,  276,  276,    0,  276,  276,  276,    0,  276,
			  276,  276,  276,  276,  276,  276,  276,  277,  277,    0,
			  277,  277,  277,  277,  277,    0,    0,  277,    0,  277,

			  277,  277,  277,  277,  277,  277,  277,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  279,  279,    0,  279,  279,  279,  279,  279,
			  279,  279,  279,    0,    0,  279,    0,  279,  279,  279,
			  279,  279,  279,  279,  279,  280,  280,  280,  280,  280,
			  280,  280,  280,  280,  280,  280,  280,  280,  280,  280,
			  280,  280,  280,  280,  280,  280,  280,  280,  280,  280,
			  281,  281,  281,  281,  281,  281,  281,  281,  281,  281,
			  281,  281,  281,  281,  281,  281,  281,  281,  281,  281,

			  281,  281,  281,  281,  281,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263, yy_Dummy>>,
			1, 685, 1000)
		end

	yy_base_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   77,   82,   14,   19,  789, 1605,   88,
			  737, 1605,  733, 1605,   73, 1605, 1605, 1605, 1605, 1605,
			  724,  721, 1605,   76,   83, 1605, 1605,  693, 1605,  691,
			  688,  688,   81,   62,   98,   82,  126, 1605, 1605,  161,
			   73,  120,  192,  110,    0, 1605,  698, 1605, 1605,  104,
			  136,  156,  159,  161,  164,  623,    0, 1605,  109,  661,
			  657, 1605,  645,    0,  231,  618,  603,  223,  242,  262,
			  269, 1605, 1605, 1605,  591,    0,  110,  243,  308,  284,
			  101,  591,  375,  111,  433,  592,  194,  292,  211,  282,
			  240,  266,   85,  278,    0,  592, 1605, 1605, 1605,  288,

			  285,  450,  453,  456,  525, 1605,    0, 1605, 1605,  585,
			  447,  557,  532,  531,  498,  126, 1605,  452,  500,  168,
			  352,  457,  478,  297,  282,  230,  492,  517,  525,  554,
			  477,  439,  412,  375,  301,  533,  332,  542,  565,  417,
			  536,  281,  543,  427,  450,  550,  259,  558,  562,  573,
			  582,  585, 1605, 1605,  621, 1605, 1605, 1605, 1605,  648,
			  656,  585,  308,  588,  573,  661,  671,  681,  608,  689,
			  705,  294,  290,  741, 1605,  820,  885,    0,  561,  630,
			  572,  666,    0,  202,  631,  714,  268,  892,  903,  253,
			  662,  901,  909,  917,  221,  220,  159,  120, 1605,    0,

			  283,  586,  898,  940,  950,  926, 1605,  890, 1605, 1605,
			 1605, 1605, 1605,  438,  631,  119,  961,  966,  928,  503,
			  944,  336,  972,  986,   88,    0,  297,  985,  995, 1000,
			 1005, 1605,   67, 1015, 1025,  129, 1030, 1035, 1040,  951,
			 1045, 1010, 1605, 1054, 1059, 1064, 1074, 1072, 1080, 1085,
			 1605, 1089, 1094, 1103, 1113, 1112, 1117, 1122, 1605, 1127,
			 1142, 1132, 1147, 1605, 1187, 1212, 1237, 1262, 1279, 1299,
			 1322, 1345, 1370, 1395, 1418, 1443, 1463, 1483, 1506, 1531,
			 1554, 1579, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,  263,    1,  264,  264,  265,  265,  263,  263,  263,
			  263,  263,  266,  263,  267,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  268,  268,  268,  268,  268,  269,  263,  263,  263,
			   39,   39,   39,   39,  270,  263,  271,  263,  263,  263,
			  271,  271,  271,  271,  271,  272,  273,  263,  263,  263,
			  266,  263,  274,  274,  274,  275,  263,  263,  263,  263,
			  263,  263,  263,  263,  268,  276,  268,  268,  268,  268,
			  268,  277,  263,   82,   39,  263,   39,   39,   84,   39,
			   84,   39,   84,   39,  270,  271,  263,  263,  263,  271,

			  271,  271,  271,  271,  272,  263,  273,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  276,  268,  268,  268,  268,  268,  268,  268,
			  268,  263,  278,   82,  278,   82,  263,  263,   84,   84,
			   39,   84,   39,   84,   39,  271,  271,  271,  271,  271,
			  271,  271,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  276,  268,  268,   78,  165,  165,  263,  268,
			  268,  268,  268,  263,  263,  263,   82,  279,   84,   39,
			   84,   39,   84,   39,  263,  263,  263,  263,  263,  268,
			  268,  263,  129,  129,  280,  173,  281,  175,  263,   84,

			   39,   84,   39,  263,  263,  263,  263,  268,  263,  263,
			  263,  263,  263,   84,   39,  263,  263,  263,  268,   84,
			   39,  263,  263,  263,  268,   84,   39,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,    0,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263, yy_Dummy>>)
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
			   52,   67,   52,   68,   69,   70,   71,    1,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   74,   74,   74,   74,   74,   74,   74,   74,   74,   74,
			   74,   74,   74,   74,   74,   74,   74,   74,   74,   74,
			   74,   74,   74,   74,   74,   74,   74,   74,   74,   74,
			   74,   74,    1,    1,   75,   75,   75,   75,   75,   75,

			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   76,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   78,   79,   79,   79,   79,   79,   79,   79,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_meta_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    2,    3,    1,    3,    1,    1,    4,
			    5,    1,    1,    6,    7,    8,    1,    9,    9,    9,
			    9,   10,   11,    1,   12,    1,   13,    1,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,   14,    3,   15,    3,    3,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			   16,   17,   18,   19,   20,   21,   22,   23,   24,    3,
			   25,    3,    1,    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
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
			   54,   25,   24,   18,   48,    0,   48,   48,   48,   46,
			   48,    0,    0,    0,   50,    0,   50,   50,   50,   50,
			   50,   50,   50,   50,   51,   63,   65,   61,   60,   62,

			   63,   63,   63,   63,    0,   53,   52,   73,   67,   73,
			   73,   73,   73,   73,   73,    4,   29,   56,   54,    0,
			    0,   55,    0,   48,   48,   47,   47,   47,   47,   48,
			   48,    0,    0,    0,    0,    0,    0,   38,   38,   50,
			   50,   50,   50,   50,   50,   63,   63,   63,   63,   63,
			   63,   63,   71,   74,   74,   72,   68,   69,   70,    0,
			   54,    0,   49,   48,   48,   48,   48,   48,    0,   46,
			   46,   46,   30,    0,   37,    0,    0,   33,   50,   50,
			   50,   50,   30,   30,    0,   57,    0,   54,   43,   31,
			   48,    0,   48,   48,    0,    0,    0,    0,   36,   31,

			   31,   50,   50,    0,    0,    0,   43,   48,   46,   35,
			   34,   35,   34,   50,   50,   45,    0,    0,   48,   50,
			   50,    0,    0,   42,   32,   32,   32,    0,    0,    0,
			    0,   42,   44,    0,   42,    0,    0,    0,    0,   41,
			    0,    0,   41,    0,    0,    0,   40,    0,    0,    0,
			   40,    0,    0,    0,   39,    0,    0,    0,   39,    0,
			   39,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 1605
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 263
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 264
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
