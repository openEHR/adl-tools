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

create
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
if yy_act <= 39 then
if yy_act <= 20 then
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
if yy_act <= 18 then
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
	yy_position := yy_position + 2
--|#line 87 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 87")
end
last_token := SYM_DT_UNKNOWN
end
else
if yy_act = 19 then
	yy_position := yy_position + 1
--|#line 88 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 88")
end
last_token := Question_mark_code
else
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
--|#line 100 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 100")
end
last_token := Left_bracket_code
else
	yy_position := yy_position + 1
--|#line 101 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 101")
end
last_token := Right_bracket_code
end
else
	yy_position := yy_position + 1
--|#line 103 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 103")
end
last_token := SYM_EQ
end
else
if yy_act = 24 then
	yy_position := yy_position + 2
--|#line 105 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 105")
end
last_token := SYM_GE
else
	yy_position := yy_position + 2
--|#line 106 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 106")
end
last_token := SYM_LE
end
end
else
if yy_act <= 28 then
if yy_act <= 27 then
if yy_act = 26 then
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
			end
		
else
	yy_position := yy_position + 1
--|#line 118 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 118")
end

			if in_interval then
				last_token := SYM_GT
			else
				last_token := SYM_END_DBLOCK
			end
		
end
else
	yy_position := yy_position + 2
--|#line 126 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 126")
end
last_token := SYM_ELLIPSIS
end
else
if yy_act = 29 then
	yy_position := yy_position + 3
--|#line 127 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 127")
end
last_token := SYM_LIST_CONTINUE
else
	yy_position := yy_position + 4
--|#line 131 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 131")
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
--|#line 133 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 133")
end
last_token := SYM_FALSE
else
	yy_position := yy_position + 8
--|#line 135 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 135")
end
last_token := SYM_INFINITY
end
else
	yy_position := yy_position + 5
--|#line 138 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 138")
end
last_token := SYM_QUERY_FUNC
end
else
if yy_act = 34 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 141 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 141")
end

	last_token := V_URI
	last_string_value := text

else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 147 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 147")
end

					last_token := V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
end
else
if yy_act <= 37 then
if yy_act = 36 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 152 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 152")
end

					last_token := ERR_V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 157 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 157")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 38 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 162 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 162")
end

					last_token := ERR_V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 168 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 168")
end

					last_token := V_LOCAL_CODE
					last_string_value := text
			
end
end
end
end
end
else
if yy_act <= 58 then
if yy_act <= 49 then
if yy_act <= 44 then
if yy_act <= 42 then
if yy_act <= 41 then
if yy_act = 40 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 175 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 175")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
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
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 177 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 177")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
if yy_act = 43 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 184 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 184")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 185 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 185")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
end
else
if yy_act <= 47 then
if yy_act <= 46 then
if yy_act = 45 then
	yy_position := yy_position + 10
--|#line 192 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 192")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
	yy_position := yy_position + 7
--|#line 193 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 193")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 203 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 203")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
else
if yy_act = 48 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 204 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 204")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 210 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 210")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
end
end
end
else
if yy_act <= 54 then
if yy_act <= 52 then
if yy_act <= 51 then
if yy_act = 50 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 215 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 215")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 220 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 220")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 227 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 227")
end
				-- beginning of CADL block
				in_buffer.append_string (text)
				set_start_condition (IN_CADL_BLOCK)
				cadl_depth := 1
			
end
else
if yy_act = 53 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 234 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 234")
end
		-- got an open brace
				in_buffer.append_string (text)
				cadl_depth := cadl_depth + 1
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 238 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 238")
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
if yy_act <= 56 then
if yy_act = 55 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 255 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 255")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 256 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 256")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
else
if yy_act = 57 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 263 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 263")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 264 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 264")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
end
end
end
else
if yy_act <= 68 then
if yy_act <= 63 then
if yy_act <= 61 then
if yy_act <= 60 then
if yy_act = 59 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 271 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 271")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 276 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 276")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
end
else
	yy_position := yy_position + 2
--|#line 284 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 284")
end
in_buffer.append_character ('\')
end
else
if yy_act = 62 then
	yy_position := yy_position + 2
--|#line 286 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 286")
end
in_buffer.append_character ('"')
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 288 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 288")
end

				in_buffer.append_string (text)
	
end
end
else
if yy_act <= 66 then
if yy_act <= 65 then
if yy_act = 64 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 292 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 292")
end
in_buffer.append_string (text)
else
	yy_position := yy_position + 1
--|#line 294 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 294")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 299 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 299")
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
if yy_act = 67 then
	yy_position := yy_position + 1
--|#line 312 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 312")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
else
	yy_position := yy_position + 3
--|#line 322 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 322")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
end
end
end
else
if yy_act <= 73 then
if yy_act <= 71 then
if yy_act <= 70 then
if yy_act = 69 then
	yy_position := yy_position + 4
--|#line 324 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 324")
end
last_token := V_CHARACTER; last_character_value := '%N'
else
	yy_position := yy_position + 4
--|#line 325 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 325")
end
last_token := V_CHARACTER; last_character_value := '%R'
end
else
	yy_position := yy_position + 4
--|#line 326 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 326")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 72 then
	yy_position := yy_position + 4
--|#line 327 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 327")
end
last_token := V_CHARACTER; last_character_value := '%''
else
	yy_position := yy_position + 4
--|#line 328 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 328")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 75 then
if yy_act = 74 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 330 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 330")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 331 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 331")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 76 then
	yy_position := yy_position + 1
--|#line 335 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 335")
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
			create an_array.make (0, 1783)
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

			   69,   79,   72,   72,   72,   72,   72,   77,  101,   71,
			   77,   78,   77,   88,  245,  145,   71,   80,   80,   80,
			   80,   80,   94,   66,   77,   88,   79,   51,   83,   82,
			  147,   77,   51,   88,   71,   78,   77,  231,   84,   84,
			  145,   71,   81,   84,   84,   88,   95,  127,   77,   90,
			  102,  222,   83,   82,  151,  147,   52,   53,   54,   55,
			   56,   52,   53,   54,   55,   56,   60,  135,   60,  100,
			  100,  100,  127,   91,  100,   88,  100,   88,  151,  100,
			   84,   86,   86,   86,   86,   86,   87,   88,  149,   88,
			  221,  135,   86,   86,   86,   86,   86,   86,   86,   86,

			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,  186,  119,  149,  119,   86,   88,   88,   89,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   89,   88,   88,   88,   92,  186,   96,  103,  103,  103,
			  104,  104,  105,  105,  105,  106,  106,  107,  107,  107,
			   88,   88,  220,   77,  219,  113,  184,  247,  247,   93,
			   97,  128,   88,   88,  114,  114,  114,  114,  114,  121,
			  121,  121,  121,  121,   69,   77,  122,  122,  122,  122,
			  122,  123,   77,  182,   77,  172,  128,   77,   77,  134,
			   71,  124,  214,  124,   77,  115,  125,  125,  125,  125,

			  125,   69,   81,  122,  122,  122,  122,  122,  100,  116,
			  172,  117,  151,  118,  134,   71,  149,   71,  133,  133,
			  133,  133,  133,   88,  143,   77,  144,  144,  144,  144,
			  144,   77,  147,  145,  188,   88,  152,  190,   77,   88,
			  192,  150,   71,   80,   80,   80,   80,   80,  171,  208,
			   77,   88,   88,  170,   88,  186,  129,  148,  146,  188,
			  185,  190,  130,   88,   88,  192,   88,  183,   88,  182,
			  131,  132,  171,  181,  208,   88,  103,  103,  103,  187,
			   88,  129,  169,  169,  169,  169,  170,  130,  161,  162,
			  162,  162,  162,  162,  131,  132,  137,  137,  137,  137,

			  137,  137,  137,  137,  138,  138,  137,  137,  137,  139,
			  139,  137,  139,  139,  139,  139,  139,  140,  137,  137,
			  137,  137,  137,  139,  139,  139,  139,  139,  139,  139,
			  139,  139,  139,  139,  139,  139,  139,  139,  139,  139,
			  139,  139,  137,  137,  141,  137,  139,  139,  139,  139,
			  139,  139,  139,  139,  139,  139,  139,  139,  139,  139,
			  139,  139,  139,  139,  139,  137,  137,  137,  137,  137,
			  137,  137,  137,  137,  137,  137,  137,  273,  100,  125,
			  125,  125,  125,  125,  166,  165,  100,  164,  163,  100,
			  160,  109,  100,  125,  125,  125,  125,  125,  143,   77,

			  143,  143,  143,  143,  143,  100,  180,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,  121,  121,  121,  121,  121,
			   69,  180,  168,  168,  168,  168,  168,  142,  100,  167,
			  173,  173,  173,  173,  173,  100,   71,   77,  100,  153,
			  154,  155,  156,  157,  103,  103,  103,  158,  158,  158,
			  159,  159,  159,   77,  167,   81,  174,  174,  174,  174,
			  174,   71,  136,   77,  175,  175,  175,  175,  175,  179,
			  188,   77,  133,  133,  133,  133,  133,  212,   77,   77,
			  143,   81,  144,  144,  144,  144,  144,   77,  176,   81,

			   88,  177,  210,  179,  199,  189,  178,  106,  106,   88,
			   88,  212,   88,  103,  103,  103,  105,  105,  105,  120,
			  119,   88,   88,  176,  112,   63,  177,  210,   61,  199,
			  178,  137,  137,  137,  137,  137,  137,  137,  137,  138,
			  138,  137,  137,  137,  138,  138,  137,  138,  138,  138,
			  138,  138,  140,  137,  137,  137,  137,  137,  138,  138,
			  138,  138,  138,  138,  138,  138,  138,  138,  138,  138,
			  138,  138,  138,  138,  138,  138,  138,  137,  137,  182,
			  137,  138,  138,  138,  138,  138,  138,  138,  138,  138,
			  138,  138,  138,  138,  138,  138,  138,  138,  138,  138,

			  137,  137,  137,  137,  137,  137,  137,  137,  137,  137,
			  137,  137,  190,  100,  192,  223,  100,  229,  109,  100,
			  161,  162,  162,  162,  162,  162,   88,  196,   69,   77,
			  197,  197,  197,  197,  197,  100,  191,   88,   88,  193,
			  223,  229,  200,   77,   71,  194,  235,  194,   88,   88,
			  195,  195,  195,  195,  195,  198,  198,  198,  198,  198,
			   88,  201,  201,  201,  201,  201,   75,  200,   77,   71,
			  235,  173,  173,  173,  173,  173,  174,  174,  174,  174,
			  174,  107,  107,  107,  103,  103,  103,  103,  103,  103,
			   76,  175,  175,  175,  175,  175,   77,  208,   74,   76,

			  212,  210,   73,   76,  202,  202,  202,  202,  202,   88,
			  130,   77,  237,  237,  237,   76,   88,  203,   88,   68,
			   88,   88,  209,   76,  213,   67,  211,   76,   88,   63,
			   88,   61,   88,  273,  273,  130,  195,  195,  195,  195,
			  195,  203,  204,  204,  204,  204,  204,  204,  204,  204,
			  204,  204,  204,  204,  204,  205,  205,  204,  205,  205,
			  205,  205,  205,  204,  204,  204,  204,  204,  204,  205,
			  205,  205,  205,  205,  205,  205,  205,  205,  205,  205,
			  205,  205,  205,  205,  205,  205,  205,  205,  204,  204,
			  273,  204,  205,  205,  205,  205,  205,  205,  205,  205,

			  205,  205,  205,  205,  205,  205,  205,  205,  205,  205,
			  205,  204,  204,  204,  204,  204,  204,  204,  204,  204,
			  204,  204,  204,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  207,  207,  206,  207,
			  207,  207,  207,  207,  206,  206,  206,  206,  206,  206,
			  207,  207,  207,  207,  207,  207,  207,  207,  207,  207,
			  207,  207,  207,  207,  207,  207,  207,  207,  207,  206,
			  206,  182,  206,  207,  207,  207,  207,  207,  207,  207,
			  207,  207,  207,  207,  207,  207,  207,  207,  207,  207,
			  207,  207,  206,  206,  206,  206,  206,  206,  206,  206, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  206,  206,  206,  206,  195,  195,  195,  195,  195,   69,
			   77,  197,  197,  197,  197,  197,  273,  215,  273,  215,
			  218,  223,  273,  273,  273,   71,  273,  216,  201,  201,
			  201,  201,  201,  202,  202,  202,  202,  202,   77,  273,
			   77,   88,  273,  273,   76,  218,  224,   77,  273,  273,
			   71,  217,  273,   88,  273,  273,  228,  178,  225,  225,
			  225,  225,  225,  226,  226,  226,  226,  226,  234,   76,
			  227,  227,  227,  227,  229,  232,  232,  232,  232,  232,
			  228,  178,  273,  273,  235,  273,   88,  233,  233,  233,
			  233,  233,  234,   88,  239,  240,  239,  273,  230,  238,

			  238,  238,  238,  238,  273,   88,  273,  273,  236,  242,
			  242,  242,  242,  242,  217,  217,  217,  217,  217,  243,
			  243,  243,  243,  243,  254,  254,  254,  254,  241,  244,
			  244,  244,  244,  244,  246,  246,  246,  246,  246,  239,
			  273,  239,  273,  273,  244,  244,  244,  244,  244,  248,
			  248,  248,  248,  248,  249,  249,  249,  249,  249,  241,
			  241,  241,  241,  241,  250,  273,  250,  253,  253,  253,
			  253,  253,  273,  241,  251,  255,  255,  255,  255,  255,
			  256,  256,  256,  256,  256,  257,  257,  257,  257,  257,
			  258,  273,  258,  252,  252,  252,  252,  252,  252,  273,

			  259,  261,  261,  261,  261,  261,  262,  262,  262,  262,
			  263,  263,  263,  263,  263,  264,  264,  264,  264,  264,
			  266,  267,  266,  273,  260,  265,  265,  265,  265,  265,
			  260,  260,  260,  260,  260,  269,  269,  269,  269,  269,
			  270,  270,  270,  270,  270,  271,  271,  271,  271,  271,
			  266,  273,  266,  273,  268,  270,  270,  270,  270,  270,
			  272,  272,  272,  272,  272,  268,  268,  268,  268,  268,
			  273,  273,  273,  273,  273,  273,  273,  273,  273,  273,
			  273,  273,  273,  273,  268,   48,   48,   48,   48,   48,
			   48,   48,   48,   48,   48,   48,   48,   48,   48,   48,

			   48,   48,   48,   48,   48,   48,   48,   48,   48,   48,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   62,  273,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,  273,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   64,  273,   64,   64,   64,   64,   64,   64,   64,   64,
			   64,   64,   64,   64,   64,   64,   64,   64,   64,   64,
			   64,   64,   64,   64,   64,   76,   76,  273,   76,  273,
			   76,  273,   76,   76,   76,   76,   76,   76,   76,   76,

			   85,   85,  273,   85,   85,   85,   85,  273,  273,  273,
			   85,  273,   85,   85,   85,   85,   85,   85,   85,   85,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   99,  273,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,  273,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,  108,  108,
			  108,  108,  108,  108,  108,  108,  108,  108,  108,  108,
			  108,  108,  108,  108,  108,  108,  108,  108,  108,  108,
			  108,  273,  108,  110,  110,  110,  110,  110,  110,  110,

			  110,  110,  110,  110,  110,  110,  110,  110,  110,  110,
			  110,  110,  110,  110,  110,  110,  111,  273,  111,  111,
			  111,  111,  111,  111,  111,  111,  111,  111,  111,  111,
			  111,  111,  111,  111,  111,  111,  111,  111,  111,  111,
			  111,   67,   67,   67,   67,   67,   67,   67,   67,   67,
			   67,   67,   67,   67,   67,   67,   67,   67,   67,   67,
			   67,   67,   67,   67,   67,   67,  126,  273,  273,  126,
			  126,  273,  126,  126,  126,  273,  126,  126,  126,  126,
			  126,  126,  126,  126,   84,   84,  273,   84,   84,   84,
			   84,   84,  273,  273,   84,  273,   84,   84,   84,   84,

			   84,   84,   84,   84,  137,  137,  137,  137,  137,  137,
			  137,  137,  137,  137,  137,  137,  137,  137,  137,  137,
			  137,  137,  137,  137,  137,  137,  137,  137,  137,  185,
			  185,  273,  185,  185,  185,  185,  185,  185,  185,  185,
			  273,  273,  185,  273,  185,  185,  185,  185,  185,  185,
			  185,  185,  204,  204,  204,  204,  204,  204,  204,  204,
			  204,  204,  204,  204,  204,  204,  204,  204,  204,  204,
			  204,  204,  204,  204,  204,  204,  204,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,

			  206,  206,    7,  273,  273,  273,  273,  273,  273,  273,
			  273,  273,  273,  273,  273,  273,  273,  273,  273,  273,
			  273,  273,  273,  273,  273,  273,  273,  273,  273,  273,
			  273,  273,  273,  273,  273,  273,  273,  273,  273,  273,
			  273,  273,  273,  273,  273,  273,  273,  273,  273,  273,
			  273,  273,  273,  273,  273,  273,  273,  273,  273,  273,
			  273,  273,  273,  273,  273,  273,  273,  273,  273,  273,
			  273,  273,  273,  273,  273,  273,  273,  273,  273,  273,
			  273,  273,  273,  273, yy_Dummy>>,
			1, 784, 1000)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 1783)
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

			   24,   33,   24,   24,   24,   24,   24,   32,   51,   23,
			   35,   32,   36,   41,  242,   90,   24,   34,   34,   34,
			   34,   34,   44,   14,   34,   41,   33,    3,   36,   35,
			   92,  234,    4,   44,   23,   32,   78,  225,   37,   37,
			   90,   24,   34,   37,   37,   44,   44,   78,   83,   42,
			   51,  207,   36,   35,   96,   92,    3,    3,    3,    3,
			    3,    4,    4,    4,    4,    4,   60,   83,   60,   52,
			   53,  154,   78,   42,   54,   42,   55,   88,   96,   56,
			   37,   40,   40,   40,   40,   40,   40,   42,   94,   88,
			  206,   83,   40,   40,   40,   40,   40,   40,   40,   40,

			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,  145,  119,   94,  119,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   43,  145,   45,   52,   52,   52,
			   53,  154,   54,   54,   54,   55,   55,   56,   56,   56,
			   45,   43,  205,   79,  204,   66,  140,  245,  245,   43,
			   45,   79,   45,   43,   66,   66,   66,   66,   66,   69,
			   69,   69,   69,   69,   70,  128,   70,   70,   70,   70,
			   70,   70,   82,  140,  129,  128,   79,  203,  199,   82,
			   70,   71,  196,   71,  180,   66,   71,   71,   71,   71,

			   71,   72,  129,   72,   72,   72,   72,   72,  104,   66,
			  128,   66,   97,   66,   82,   70,   95,   72,   81,   81,
			   81,   81,   81,   97,   89,   81,   89,   89,   89,   89,
			   89,  127,   93,   91,  147,   97,   97,  149,  178,   95,
			  151,   95,   72,   80,   80,   80,   80,   80,  127,  186,
			   80,   95,   91,  170,   93,  146,   80,   93,   91,  147,
			  142,  149,   80,   89,   91,  151,   93,  139,  146,  137,
			   80,   80,  127,  136,  186,   89,  104,  104,  104,  146,
			  146,   80,  123,  123,  123,  123,  126,   80,  114,  114,
			  114,  114,  114,  114,   80,   80,   85,   85,   85,   85,

			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   86,  103,  124,
			  124,  124,  124,  124,  118,  117,  105,  116,  115,  106,
			  113,  108,  107,  125,  125,  125,  125,  125,  143,  135,

			  143,  143,  143,  143,  143,   99,  135,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,  121,  121,  121,  121,  121,
			  122,  135,  122,  122,  122,  122,  122,   87,  156,  121,
			  130,  130,  130,  130,  130,  153,  122,  130,  155,  103,
			  103,  103,  103,  103,  105,  105,  105,  106,  106,  106,
			  107,  107,  107,  134,  121,  130,  131,  131,  131,  131,
			  131,  122,   84,  131,  132,  132,  132,  132,  132,  134,
			  148,  132,  133,  133,  133,  133,  133,  190,   76,  133,
			  144,  131,  144,  144,  144,  144,  144,  171,  133,  132,

			  148,  133,  188,  134,  171,  148,  133,  156,  156,  193,
			  209,  190,  148,  153,  153,  153,  155,  155,  155,   68,
			   67,  193,  209,  133,   64,   62,  133,  188,   61,  171,
			  133,  138,  138,  138,  138,  138,  138,  138,  138,  138,
			  138,  138,  138,  138,  138,  138,  138,  138,  138,  138,
			  138,  138,  138,  138,  138,  138,  138,  138,  138,  138,
			  138,  138,  138,  138,  138,  138,  138,  138,  138,  138,
			  138,  138,  138,  138,  138,  138,  138,  138,  138,  138,
			  138,  138,  138,  138,  138,  138,  138,  138,  138,  138,
			  138,  138,  138,  138,  138,  138,  138,  138,  138,  138,

			  138,  138,  138,  138,  138,  138,  138,  138,  138,  138,
			  138,  138,  150,  157,  152,  210,  158,  223,   57,  159,
			  162,  162,  162,  162,  162,  162,  150,  168,  168,  172,
			  168,  168,  168,  168,  168,   48,  150,  152,  150,  152,
			  210,  223,  172,   31,  168,  167,  229,  167,  213,  152,
			  167,  167,  167,  167,  167,  169,  169,  169,  169,  169,
			  213,  176,  176,  176,  176,  176,   30,  172,  176,  168,
			  229,  173,  173,  173,  173,  173,  174,  174,  174,  174,
			  174,  157,  157,  157,  158,  158,  158,  159,  159,  159,
			  173,  175,  175,  175,  175,  175,  179,  187,   29,  173,

			  191,  189,   27,  174,  177,  177,  177,  177,  177,  191,
			  175,  177,  231,  231,  231,  173,  236,  179,  189,   21,
			  187,  191,  187,  173,  191,   20,  189,  174,  236,   12,
			  189,   10,  187,    7,    0,  175,  194,  194,  194,  194,
			  194,  179,  181,  181,  181,  181,  181,  181,  181,  181,
			  181,  181,  181,  181,  181,  181,  181,  181,  181,  181,
			  181,  181,  181,  181,  181,  181,  181,  181,  181,  181,
			  181,  181,  181,  181,  181,  181,  181,  181,  181,  181,
			  181,  181,  181,  181,  181,  181,  181,  181,  181,  181,
			    0,  181,  181,  181,  181,  181,  181,  181,  181,  181,

			  181,  181,  181,  181,  181,  181,  181,  181,  181,  181,
			  181,  181,  181,  181,  181,  181,  181,  181,  181,  181,
			  181,  181,  181,  184,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,  184,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,  184,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,  184,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,  184,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,  184,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,  184,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,  184,  184,  184,  184,  184,  184,  184, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  184,  184,  184,  184,  195,  195,  195,  195,  195,  197,
			  200,  197,  197,  197,  197,  197,    0,  198,    0,  198,
			  200,  211,    0,    0,    0,  197,    0,  198,  201,  201,
			  201,  201,  201,  202,  202,  202,  202,  202,  218,    0,
			  202,  211,    0,    0,  201,  200,  211,  228,    0,    0,
			  197,  198,    0,  211,    0,    0,  218,  202,  214,  214,
			  214,  214,  214,  215,  215,  215,  215,  215,  228,  201,
			  216,  216,  216,  216,  224,  226,  226,  226,  226,  226,
			  218,  202,    0,    0,  230,    0,  224,  227,  227,  227,
			  227,  227,  228,  230,  233,  233,  233,    0,  224,  232,

			  232,  232,  232,  232,    0,  230,    0,    0,  230,  237,
			  237,  237,  237,  237,  238,  238,  238,  238,  238,  239,
			  239,  239,  239,  239,  251,  251,  251,  251,  233,  240,
			  240,  240,  240,  240,  243,  243,  243,  243,  243,  244,
			    0,  244,    0,    0,  244,  244,  244,  244,  244,  246,
			  246,  246,  246,  246,  247,  247,  247,  247,  247,  248,
			  248,  248,  248,  248,  249,    0,  249,  250,  250,  250,
			  250,  250,    0,  244,  249,  253,  253,  253,  253,  253,
			  254,  254,  254,  254,  254,  255,  255,  255,  255,  255,
			  256,    0,  256,  257,  257,  257,  257,  257,  249,    0,

			  256,  258,  258,  258,  258,  258,  259,  259,  259,  259,
			  261,  261,  261,  261,  261,  262,  262,  262,  262,  262,
			  264,  264,  264,    0,  256,  263,  263,  263,  263,  263,
			  265,  265,  265,  265,  265,  266,  266,  266,  266,  266,
			  267,  267,  267,  267,  267,  269,  269,  269,  269,  269,
			  270,    0,  270,    0,  264,  270,  270,  270,  270,  270,
			  271,  271,  271,  271,  271,  272,  272,  272,  272,  272,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  270,  274,  274,  274,  274,  274,
			  274,  274,  274,  274,  274,  274,  274,  274,  274,  274,

			  274,  274,  274,  274,  274,  274,  274,  274,  274,  274,
			  275,  275,  275,  275,  275,  275,  275,  275,  275,  275,
			  275,  275,  275,  275,  275,  275,  275,  275,  275,  275,
			  275,  275,  275,  275,  275,  276,    0,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,    0,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  277,    0,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  278,  278,    0,  278,    0,
			  278,    0,  278,  278,  278,  278,  278,  278,  278,  278,

			  279,  279,    0,  279,  279,  279,  279,    0,    0,    0,
			  279,    0,  279,  279,  279,  279,  279,  279,  279,  279,
			  280,  280,  280,  280,  280,  280,  280,  280,  280,  280,
			  280,  280,  280,  280,  280,  280,  280,  280,  280,  280,
			  280,  280,  280,  281,    0,  281,  281,  281,  281,  281,
			  281,  281,  281,  281,  281,  281,  281,    0,  281,  281,
			  281,  281,  281,  281,  281,  281,  281,  281,  282,  282,
			  282,  282,  282,  282,  282,  282,  282,  282,  282,  282,
			  282,  282,  282,  282,  282,  282,  282,  282,  282,  282,
			  282,    0,  282,  283,  283,  283,  283,  283,  283,  283,

			  283,  283,  283,  283,  283,  283,  283,  283,  283,  283,
			  283,  283,  283,  283,  283,  283,  284,    0,  284,  284,
			  284,  284,  284,  284,  284,  284,  284,  284,  284,  284,
			  284,  284,  284,  284,  284,  284,  284,  284,  284,  284,
			  284,  285,  285,  285,  285,  285,  285,  285,  285,  285,
			  285,  285,  285,  285,  285,  285,  285,  285,  285,  285,
			  285,  285,  285,  285,  285,  285,  286,    0,    0,  286,
			  286,    0,  286,  286,  286,    0,  286,  286,  286,  286,
			  286,  286,  286,  286,  287,  287,    0,  287,  287,  287,
			  287,  287,    0,    0,  287,    0,  287,  287,  287,  287,

			  287,  287,  287,  287,  288,  288,  288,  288,  288,  288,
			  288,  288,  288,  288,  288,  288,  288,  288,  288,  288,
			  288,  288,  288,  288,  288,  288,  288,  288,  288,  289,
			  289,    0,  289,  289,  289,  289,  289,  289,  289,  289,
			    0,    0,  289,    0,  289,  289,  289,  289,  289,  289,
			  289,  289,  290,  290,  290,  290,  290,  290,  290,  290,
			  290,  290,  290,  290,  290,  290,  290,  290,  290,  290,
			  290,  290,  290,  290,  290,  290,  290,  291,  291,  291,
			  291,  291,  291,  291,  291,  291,  291,  291,  291,  291,
			  291,  291,  291,  291,  291,  291,  291,  291,  291,  291,

			  291,  291,  273,  273,  273,  273,  273,  273,  273,  273,
			  273,  273,  273,  273,  273,  273,  273,  273,  273,  273,
			  273,  273,  273,  273,  273,  273,  273,  273,  273,  273,
			  273,  273,  273,  273,  273,  273,  273,  273,  273,  273,
			  273,  273,  273,  273,  273,  273,  273,  273,  273,  273,
			  273,  273,  273,  273,  273,  273,  273,  273,  273,  273,
			  273,  273,  273,  273,  273,  273,  273,  273,  273,  273,
			  273,  273,  273,  273,  273,  273,  273,  273,  273,  273,
			  273,  273,  273,  273, yy_Dummy>>,
			1, 784, 1000)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   79,   84,   14,   19,  833, 1702,   90,
			  828, 1702,  823, 1702,   75, 1702, 1702, 1702, 1702, 1702,
			  811,  804, 1702,   78,   85, 1702, 1702,  777, 1702,  773,
			  739,  719,   83,   64,  100,   86,   88,  129, 1702, 1702,
			  164,   59,  121,  197,   79,  196,    0, 1702,  729, 1702,
			 1702,  102,  163,  164,  168,  170,  173,  646,    0, 1702,
			  164,  625,  619, 1702,  616,    0,  247,  617,  604,  252,
			  259,  279,  286, 1702, 1702, 1702,  564,    0,  112,  229,
			  326,  301,  258,  124,  550,  395,  455,  521,  123,  309,
			   80,  298,   98,  300,  157,  285,  111,  269,    0,  499,

			 1702, 1702, 1702,  472,  302,  480,  483,  486,  419, 1702,
			    0, 1702, 1702,  482,  372,  480,  479,  477,  476,  210,
			 1702,  508,  515,  365,  462,  476,  360,  307,  251,  260,
			  523,  549,  557,  565,  539,  475,  351,  320,  630,  318,
			  234, 1702,  344,  483,  575,  170,  314,  300,  546,  297,
			  672,  309,  683,  539,  165,  542,  532,  707,  710,  713,
			 1702, 1702,  704, 1702, 1702, 1702, 1702,  733,  713,  738,
			  327,  573,  705,  754,  759,  774,  744,  787,  314,  772,
			  270,  841, 1702, 1702,  922,    0,  318,  766,  565,  764,
			  542,  755,    0,  555,  819,  987,  275,  994, 1005,  264,

			  986, 1011, 1016,  263,  205,  203,  141,  102,    0,  556,
			  681,  987,    0,  694, 1041, 1046, 1053, 1702, 1014, 1702,
			 1702, 1702, 1702,  675, 1032,  123, 1058, 1070, 1023,  701,
			 1039,  795, 1082, 1082,  107,    0,  762, 1092, 1097, 1102,
			 1112, 1702,   72, 1117, 1127,  240, 1132, 1137, 1142, 1152,
			 1150, 1107, 1702, 1158, 1163, 1168, 1178, 1176, 1184, 1189,
			 1702, 1193, 1198, 1208, 1208, 1213, 1218, 1223, 1702, 1228,
			 1238, 1243, 1248, 1702, 1284, 1309, 1334, 1359, 1376, 1396,
			 1419, 1442, 1467, 1492, 1515, 1540, 1560, 1580, 1603, 1628,
			 1651, 1676, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  273,    1,  274,  274,  275,  275,  273,  273,  273,
			  273,  273,  276,  273,  277,  273,  273,  273,  273,  273,
			  273,  273,  273,  273,  273,  273,  273,  273,  273,  273,
			  273,  278,  278,  278,  278,  278,  278,  279,  273,  273,
			  273,   40,   40,   40,   40,   40,  280,  273,  281,  273,
			  273,  273,  281,  281,  281,  281,  281,  282,  283,  273,
			  273,  273,  276,  273,  284,  284,  284,  285,  273,  273,
			  273,  273,  273,  273,  273,  273,  278,  286,  278,  278,
			  278,  278,  278,  278,  287,  273,   40,  273,   40,   40,
			   86,   40,   86,   40,   86,   40,   86,   40,  280,  281,

			  273,  273,  273,  281,  281,  281,  281,  281,  282,  273,
			  283,  273,  273,  273,  273,  273,  273,  273,  273,  273,
			  273,  273,  273,  273,  273,  273,  286,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  273,  288,  273,   85,
			  288,  273,  273,  273,   86,   86,   40,   86,   40,   86,
			   40,   86,   40,  281,  281,  281,  281,  281,  281,  281,
			  273,  273,  273,  273,  273,  273,  273,  273,  273,  273,
			  286,  278,  278,   80,  173,  173,  278,  278,  278,  278,
			  278,  273,  273,  273,  273,  289,   86,   40,   86,   40,
			   86,   40,   86,   40,  273,  273,  273,  273,  273,  278,

			  278,  133,  278,  278,  290,  181,  291,  184,   86,   40,
			   86,   40,   86,   40,  273,  273,  273,  273,  278,  273,
			  273,  273,  273,   86,   40,  273,  273,  273,  278,   86,
			   40,  273,  273,  273,  278,   86,   40,  273,  273,  273,
			  273,  273,  273,  273,  273,  273,  273,  273,  273,  273,
			  273,  273,  273,  273,  273,  273,  273,  273,  273,  273,
			  273,  273,  273,  273,  273,  273,  273,  273,  273,  273,
			  273,  273,  273,    0,  273,  273,  273,  273,  273,  273,
			  273,  273,  273,  273,  273,  273,  273,  273,  273,  273,
			  273,  273, yy_Dummy>>)
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
			    0,    1,    1,    2,    3,    1,    3,    1,    1,    4,
			    5,    1,    1,    6,    7,    8,    1,    9,    9,    9,
			    9,   10,   11,    1,   12,    1,   13,    1,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,   14,    3,   15,    3,
			    3,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,   16,   17,   18,   19,   20,   21,   22,   23,
			   24,    3,   25,    3,    1,    1,    1,    1,    1,    1,
			    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,   78,   76,    1,
			    2,   14,   60,   17,   76,   15,   16,    7,    6,   12,
			    5,   10,    8,   55,   55,   13,   11,   26,   23,   27,
			   19,   49,   49,   49,   48,   49,   49,   21,   22,    9,
			   51,   51,   51,   51,   51,   51,   52,   20,   64,   65,
			   66,   67,   64,   64,   64,   64,   64,   77,   53,   54,
			    1,    2,   60,   59,   74,   74,   74,    3,   28,    0,
			   55,    0,   55,   25,   24,   18,   49,    0,   49,   49,
			   49,   47,   49,   49,    0,    0,   51,    0,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   52,   64,

			   66,   62,   61,   63,   64,   64,   64,   64,    0,   54,
			   53,   74,   68,   74,   74,   74,   74,   74,   74,    4,
			   29,   57,   55,    0,    0,   56,    0,   49,   49,   48,
			   48,   48,   48,   49,   49,   49,    0,    0,    0,    0,
			    0,   37,    0,   39,   39,   51,   51,   51,   51,   51,
			   51,   51,   51,   64,   64,   64,   64,   64,   64,   64,
			   72,   75,   75,   73,   69,   70,   71,    0,   55,    0,
			   50,   49,   49,   49,   49,   49,   47,   47,   47,   49,
			   30,    0,   38,   37,    0,   34,   51,   51,   51,   51,
			   51,   51,   30,   30,    0,   58,    0,   55,   44,   31,

			   49,   49,   49,   33,    0,    0,    0,    0,   31,   31,
			   51,   51,   33,   33,    0,    0,    0,   44,   49,   36,
			   35,   36,   35,   51,   51,   46,    0,    0,   49,   51,
			   51,    0,    0,   43,   32,   32,   32,    0,    0,    0,
			    0,   43,   45,    0,   43,    0,    0,    0,    0,   42,
			    0,    0,   42,    0,    0,    0,   41,    0,    0,    0,
			   41,    0,    0,    0,   40,    0,    0,    0,   40,    0,
			   40,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 1702
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 273
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 274
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

	yyNb_rules: INTEGER is 77
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 78
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
			create in_buffer.make (Init_buffer_size)
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
