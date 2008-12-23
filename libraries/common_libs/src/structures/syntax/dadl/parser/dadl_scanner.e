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
			create an_array.make (0, 1797)
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
			   77,   78,   77,   88,  248,  145,   71,   80,   80,   80,
			   80,   80,   94,   66,   77,   88,   79,   51,   83,   82,
			  147,   77,   51,   88,   71,   78,   77,  234,   84,   84,
			  145,   71,   81,   84,   84,   88,   95,  127,   77,   90,
			  102,  225,   83,   82,  151,  147,   52,   53,   54,   55,
			   56,   52,   53,   54,   55,   56,   60,  135,   60,  100,
			  100,  100,  127,   91,  100,   88,  100,   88,  151,  100,
			   84,   86,   86,   86,   86,   86,   87,   88,  149,   88,
			  224,  135,   86,   86,   86,   86,   86,   86,   86,   86,

			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,  187,  119,  149,  119,   86,   88,   88,   89,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   89,   88,   88,   88,   92,  187,   96,  103,  103,  103,
			  104,  104,  105,  105,  105,  106,  106,  107,  107,  107,
			   88,   88,  223,   77,  222,  113,  185,  250,  250,   93,
			   97,  128,   88,   88,  114,  114,  114,  114,  114,  121,
			  121,  121,  121,  121,   69,   77,  122,  122,  122,  122,
			  122,  123,   77,  183,   77,  172,  128,   77,   77,  134,
			   71,  124,  216,  124,   77,  115,  125,  125,  125,  125,

			  125,   69,   81,  122,  122,  122,  122,  122,  100,  116,
			  172,  117,  151,  118,  134,   71,  149,   71,  133,  133,
			  133,  133,  133,   88,  143,   77,  144,  144,  144,  144,
			  144,   77,  147,  145,  189,   88,  152,  191,   77,   88,
			  193,  150,   71,   80,   80,   80,   80,   80,  171,  210,
			   77,   88,   88,  170,   88,  187,  129,  148,  146,  189,
			  186,  191,  130,   88,   88,  193,   88,  184,   88,  183,
			  131,  132,  171,  182,  210,   88,  103,  103,  103,  188,
			   88,  129,  169,  169,  169,  169,  170,  130,  161,  162,
			  162,  162,  162,  162,  131,  132,  137,  137,  137,  137,

			  137,  137,  137,  137,  138,  138,  137,  137,  137,  139,
			  139,  137,  139,  139,  139,  139,  139,  140,  137,  137,
			  137,  137,  137,  139,  139,  139,  139,  139,  139,  139,
			  139,  139,  139,  139,  139,  139,  139,  139,  139,  139,
			  139,  139,  137,  137,  141,  137,  139,  139,  139,  139,
			  139,  139,  139,  139,  139,  139,  139,  139,  139,  139,
			  139,  139,  139,  139,  139,  137,  137,  137,  137,  137,
			  137,  137,  137,  137,  137,  137,  137,  276,  100,  125,
			  125,  125,  125,  125,  166,  165,  100,  164,  163,  100,
			  160,  109,  100,  125,  125,  125,  125,  125,  143,   77,

			  143,  143,  143,  143,  143,  100,  181,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,  121,  121,  121,  121,  121,
			   69,  181,  168,  168,  168,  168,  168,  142,  100,  167,
			  173,  173,  173,  173,  173,  136,   71,   77,   77,  153,
			  154,  155,  156,  157,  103,  103,  103,  158,  158,  158,
			  159,  159,  159,  100,  167,   81,  174,  174,  174,  174,
			  174,   71,   77,   77,  175,  175,  175,  175,  175,  100,
			  143,   77,  144,  144,  144,  144,  144,  191,  180,  212,
			  189,   81,  120,  119,  193,   77,  214,  112,  226,   81,

			  176,   88,  133,  133,  133,  133,  133,  106,  106,   77,
			   88,  192,  180,   88,  212,  190,  205,   88,  177,  194,
			  214,  178,   88,  226,   63,   61,  179,  109,  100,   88,
			   88,  103,  103,  103,  161,  162,  162,  162,  162,  162,
			  205,   77,   88,  177,   75,   74,  178,  105,  105,  105,
			  179,  137,  137,  137,  137,  137,  137,  137,  137,  138,
			  138,  137,  137,  137,  138,  138,  137,  138,  138,  138,
			  138,  138,  140,  137,  137,  137,  137,  137,  138,  138,
			  138,  138,  138,  138,  138,  138,  138,  138,  138,  138,
			  138,  138,  138,  138,  138,  138,  138,  137,  137,  183,

			  137,  138,  138,  138,  138,  138,  138,  138,  138,  138,
			  138,  138,  138,  138,  138,  138,  138,  138,  138,  138,
			  137,  137,  137,  137,  137,  137,  137,  137,  137,  137,
			  137,  137,  100,   77,  195,  100,  195,   73,  100,  196,
			  196,  196,  196,  196,  197,   69,  201,  198,  198,  198,
			  198,  198,  199,  199,  199,  199,  199,   77,   88,   68,
			  210,   71,  226,   67,  200,  173,  173,  173,  173,  173,
			   88,  201,  174,  174,  174,  174,  174,  175,  175,  175,
			  175,  175,   88,   88,   76,  211,   71,  227,  217,  200,
			  217,  232,  238,   76,   88,   88,  130,   63,  218,   76,

			  107,  107,  107,  103,  103,  103,  103,  103,  103,   76,
			  202,  202,  202,  202,  202,  232,  238,   76,   88,   61,
			  276,  130,  219,   76,  203,  203,  203,  203,  203,  276,
			   88,   77,  204,  204,  204,  204,  204,  276,  276,   77,
			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  207,  207,  206,  207,  207,  207,  207,
			  207,  206,  206,  206,  206,  206,  206,  207,  207,  207,
			  207,  207,  207,  207,  207,  207,  207,  207,  207,  207,
			  207,  207,  207,  207,  207,  207,  206,  206,  276,  206,
			  207,  207,  207,  207,  207,  207,  207,  207,  207,  207,

			  207,  207,  207,  207,  207,  207,  207,  207,  207,  206,
			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  206,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  209,  209,  208,  209,  209,  209,
			  209,  209,  208,  208,  208,  208,  208,  208,  209,  209,
			  209,  209,  209,  209,  209,  209,  209,  209,  209,  209,
			  209,  209,  209,  209,  209,  209,  209,  208,  208,  183,
			  208,  209,  209,  209,  209,  209,  209,  209,  209,  209,
			  209,  209,  209,  209,  209,  209,  209,  209,  209,  209,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  208,  208,  212,  276,  214,  196,  196,  196,  196,  196,
			   77,  276,  276,   88,  196,  196,  196,  196,  196,   88,
			  220,  230,  230,  230,  230,   88,  276,  213,  215,  276,
			   69,   88,  198,  198,  198,  198,  198,  202,  202,  202,
			  202,  202,   77,  276,  276,  220,   71,  203,  203,  203,
			  203,  203,  276,  204,  204,  204,  204,  204,  232,   77,
			  231,  221,  276,   76,  228,  228,  228,  228,  228,   76,
			   88,   71,   76,  229,  229,  229,  229,  229,  276,  276,
			  237,  276,  233,  276,  231,  221,  238,  276,   76,  235,
			  235,  235,  235,  235,   76,   88,   88,   76,  236,  236,

			  236,  236,  236,  276,  237,  276,  276,   88,   88,  276,
			  239,  240,  240,  240,  241,  241,  241,  241,  241,  242,
			  243,  242,  245,  245,  245,  245,  245,  219,  219,  219,
			  219,  219,  246,  246,  246,  246,  246,  247,  247,  247,
			  247,  247,  249,  249,  249,  249,  249,  276,  276,  242,
			  276,  242,  276,  244,  247,  247,  247,  247,  247,  251,
			  251,  251,  251,  251,  252,  252,  252,  252,  252,  244,
			  244,  244,  244,  244,  253,  276,  253,  256,  256,  256,
			  256,  256,  276,  244,  254,  257,  257,  257,  257,  258,
			  258,  258,  258,  258,  259,  259,  259,  259,  259,  260,

			  260,  260,  260,  260,  261,  276,  261,  276,  255,  255,
			  255,  255,  255,  255,  262,  264,  264,  264,  264,  264,
			  265,  265,  265,  265,  266,  266,  266,  266,  266,  267,
			  267,  267,  267,  267,  269,  270,  269,  276,  263,  268,
			  268,  268,  268,  268,  263,  263,  263,  263,  263,  272,
			  272,  272,  272,  272,  273,  273,  273,  273,  273,  274,
			  274,  274,  274,  274,  269,  276,  269,  276,  271,  273,
			  273,  273,  273,  273,  275,  275,  275,  275,  275,  271,
			  271,  271,  271,  271,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  271,   48,

			   48,   48,   48,   48,   48,   48,   48,   48,   48,   48,
			   48,   48,   48,   48,   48,   48,   48,   48,   48,   48,
			   48,   48,   48,   48,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   62,
			  276,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,  276,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   64,  276,   64,   64,   64,   64,
			   64,   64,   64,   64,   64,   64,   64,   64,   64,   64,
			   64,   64,   64,   64,   64,   64,   64,   64,   64,   76,

			   76,  276,   76,  276,   76,  276,   76,   76,   76,   76,
			   76,   76,   76,   76,   85,   85,  276,   85,   85,   85,
			   85,  276,  276,  276,   85,  276,   85,   85,   85,   85,
			   85,   85,   85,   85,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   99,  276,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,  276,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,  108,  108,  108,  108,  108,  108,  108,  108,
			  108,  108,  108,  108,  108,  108,  108,  108,  108,  108,

			  108,  108,  108,  108,  108,  276,  108,  110,  110,  110,
			  110,  110,  110,  110,  110,  110,  110,  110,  110,  110,
			  110,  110,  110,  110,  110,  110,  110,  110,  110,  110,
			  111,  276,  111,  111,  111,  111,  111,  111,  111,  111,
			  111,  111,  111,  111,  111,  111,  111,  111,  111,  111,
			  111,  111,  111,  111,  111,   67,   67,   67,   67,   67,
			   67,   67,   67,   67,   67,   67,   67,   67,   67,   67,
			   67,   67,   67,   67,   67,   67,   67,   67,   67,   67,
			  126,  276,  276,  126,  126,  276,  126,  126,  126,  276,
			  126,  126,  126,  126,  126,  126,  126,  126,   84,   84,

			  276,   84,   84,   84,   84,   84,  276,  276,   84,  276,
			   84,   84,   84,   84,   84,   84,   84,   84,  137,  137,
			  137,  137,  137,  137,  137,  137,  137,  137,  137,  137,
			  137,  137,  137,  137,  137,  137,  137,  137,  137,  137,
			  137,  137,  137,  186,  186,  276,  186,  186,  186,  186,
			  186,  186,  186,  186,  276,  276,  186,  276,  186,  186,
			  186,  186,  186,  186,  186,  186,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  206,  208,  208,  208,  208,  208,  208,  208,  208,  208,

			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,    7,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276, yy_Dummy>>,
			1, 798, 1000)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 1797)
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
			   35,   32,   36,   41,  245,   90,   24,   34,   34,   34,
			   34,   34,   44,   14,   34,   41,   33,    3,   36,   35,
			   92,  237,    4,   44,   23,   32,   78,  228,   37,   37,
			   90,   24,   34,   37,   37,   44,   44,   78,   83,   42,
			   51,  209,   36,   35,   96,   92,    3,    3,    3,    3,
			    3,    4,    4,    4,    4,    4,   60,   83,   60,   52,
			   53,  154,   78,   42,   54,   42,   55,   88,   96,   56,
			   37,   40,   40,   40,   40,   40,   40,   42,   94,   88,
			  208,   83,   40,   40,   40,   40,   40,   40,   40,   40,

			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,  145,  119,   94,  119,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   43,  145,   45,   52,   52,   52,
			   53,  154,   54,   54,   54,   55,   55,   56,   56,   56,
			   45,   43,  207,   79,  206,   66,  140,  248,  248,   43,
			   45,   79,   45,   43,   66,   66,   66,   66,   66,   69,
			   69,   69,   69,   69,   70,  128,   70,   70,   70,   70,
			   70,   70,   82,  140,  129,  128,   79,  205,  200,   82,
			   70,   71,  197,   71,  181,   66,   71,   71,   71,   71,

			   71,   72,  129,   72,   72,   72,   72,   72,  104,   66,
			  128,   66,   97,   66,   82,   70,   95,   72,   81,   81,
			   81,   81,   81,   97,   89,   81,   89,   89,   89,   89,
			   89,  127,   93,   91,  147,   97,   97,  149,  179,   95,
			  151,   95,   72,   80,   80,   80,   80,   80,  127,  187,
			   80,   95,   91,  170,   93,  146,   80,   93,   91,  147,
			  142,  149,   80,   89,   91,  151,   93,  139,  146,  137,
			   80,   80,  127,  136,  187,   89,  104,  104,  104,  146,
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
			  130,  130,  130,  130,  130,   84,  122,  130,   76,  103,
			  103,  103,  103,  103,  105,  105,  105,  106,  106,  106,
			  107,  107,  107,  153,  121,  130,  131,  131,  131,  131,
			  131,  122,  134,  131,  132,  132,  132,  132,  132,  155,
			  144,  132,  144,  144,  144,  144,  144,  150,  134,  189,
			  148,  131,   68,   67,  152,  180,  191,   64,  212,  132,

			  133,  150,  133,  133,  133,  133,  133,  156,  156,  133,
			  148,  150,  134,  150,  189,  148,  180,  152,  133,  152,
			  191,  133,  148,  212,   62,   61,  133,   57,   48,  152,
			  194,  153,  153,  153,  162,  162,  162,  162,  162,  162,
			  180,   31,  194,  133,   30,   29,  133,  155,  155,  155,
			  133,  138,  138,  138,  138,  138,  138,  138,  138,  138,
			  138,  138,  138,  138,  138,  138,  138,  138,  138,  138,
			  138,  138,  138,  138,  138,  138,  138,  138,  138,  138,
			  138,  138,  138,  138,  138,  138,  138,  138,  138,  138,
			  138,  138,  138,  138,  138,  138,  138,  138,  138,  138,

			  138,  138,  138,  138,  138,  138,  138,  138,  138,  138,
			  138,  138,  138,  138,  138,  138,  138,  138,  138,  138,
			  138,  138,  138,  138,  138,  138,  138,  138,  138,  138,
			  138,  138,  157,  172,  167,  158,  167,   27,  159,  167,
			  167,  167,  167,  167,  168,  168,  172,  168,  168,  168,
			  168,  168,  169,  169,  169,  169,  169,  171,  211,   21,
			  188,  168,  213,   20,  171,  173,  173,  173,  173,  173,
			  211,  172,  174,  174,  174,  174,  174,  175,  175,  175,
			  175,  175,  213,  188,  173,  188,  168,  213,  199,  171,
			  199,  226,  232,  173,  213,  188,  175,   12,  199,  174,

			  157,  157,  157,  158,  158,  158,  159,  159,  159,  173,
			  176,  176,  176,  176,  176,  226,  232,  173,  215,   10,
			    7,  175,  199,  174,  177,  177,  177,  177,  177,    0,
			  215,  177,  178,  178,  178,  178,  178,    0,    0,  178,
			  182,  182,  182,  182,  182,  182,  182,  182,  182,  182,
			  182,  182,  182,  182,  182,  182,  182,  182,  182,  182,
			  182,  182,  182,  182,  182,  182,  182,  182,  182,  182,
			  182,  182,  182,  182,  182,  182,  182,  182,  182,  182,
			  182,  182,  182,  182,  182,  182,  182,  182,    0,  182,
			  182,  182,  182,  182,  182,  182,  182,  182,  182,  182,

			  182,  182,  182,  182,  182,  182,  182,  182,  182,  182,
			  182,  182,  182,  182,  182,  182,  182,  182,  182,  182,
			  182,  185,  185,  185,  185,  185,  185,  185,  185,  185,
			  185,  185,  185,  185,  185,  185,  185,  185,  185,  185,
			  185,  185,  185,  185,  185,  185,  185,  185,  185,  185,
			  185,  185,  185,  185,  185,  185,  185,  185,  185,  185,
			  185,  185,  185,  185,  185,  185,  185,  185,  185,  185,
			  185,  185,  185,  185,  185,  185,  185,  185,  185,  185,
			  185,  185,  185,  185,  185,  185,  185,  185,  185,  185,
			  185,  185,  185,  185,  185,  185,  185,  185,  185,  185, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  185,  185,  190,    0,  192,  195,  195,  195,  195,  195,
			  201,    0,    0,  192,  196,  196,  196,  196,  196,  190,
			  201,  218,  218,  218,  218,  192,    0,  190,  192,    0,
			  198,  190,  198,  198,  198,  198,  198,  202,  202,  202,
			  202,  202,  220,    0,    0,  201,  198,  203,  203,  203,
			  203,  203,    0,  204,  204,  204,  204,  204,  227,  231,
			  220,  202,    0,  203,  216,  216,  216,  216,  216,  204,
			  227,  198,  204,  217,  217,  217,  217,  217,    0,    0,
			  231,    0,  227,    0,  220,  202,  233,    0,  203,  229,
			  229,  229,  229,  229,  204,  233,  239,  204,  230,  230,

			  230,  230,  230,    0,  231,    0,    0,  233,  239,    0,
			  233,  234,  234,  234,  235,  235,  235,  235,  235,  236,
			  236,  236,  240,  240,  240,  240,  240,  241,  241,  241,
			  241,  241,  242,  242,  242,  242,  242,  243,  243,  243,
			  243,  243,  246,  246,  246,  246,  246,    0,    0,  247,
			    0,  247,    0,  236,  247,  247,  247,  247,  247,  249,
			  249,  249,  249,  249,  250,  250,  250,  250,  250,  251,
			  251,  251,  251,  251,  252,    0,  252,  253,  253,  253,
			  253,  253,    0,  247,  252,  254,  254,  254,  254,  256,
			  256,  256,  256,  256,  257,  257,  257,  257,  257,  258,

			  258,  258,  258,  258,  259,    0,  259,    0,  252,  260,
			  260,  260,  260,  260,  259,  261,  261,  261,  261,  261,
			  262,  262,  262,  262,  264,  264,  264,  264,  264,  265,
			  265,  265,  265,  265,  267,  267,  267,    0,  259,  266,
			  266,  266,  266,  266,  268,  268,  268,  268,  268,  269,
			  269,  269,  269,  269,  270,  270,  270,  270,  270,  272,
			  272,  272,  272,  272,  273,    0,  273,    0,  267,  273,
			  273,  273,  273,  273,  274,  274,  274,  274,  274,  275,
			  275,  275,  275,  275,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  273,  277,

			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  279,
			    0,  279,  279,  279,  279,  279,  279,  279,  279,  279,
			  279,  279,  279,    0,  279,  279,  279,  279,  279,  279,
			  279,  279,  279,  279,  280,    0,  280,  280,  280,  280,
			  280,  280,  280,  280,  280,  280,  280,  280,  280,  280,
			  280,  280,  280,  280,  280,  280,  280,  280,  280,  281,

			  281,    0,  281,    0,  281,    0,  281,  281,  281,  281,
			  281,  281,  281,  281,  282,  282,    0,  282,  282,  282,
			  282,    0,    0,    0,  282,    0,  282,  282,  282,  282,
			  282,  282,  282,  282,  283,  283,  283,  283,  283,  283,
			  283,  283,  283,  283,  283,  283,  283,  283,  283,  283,
			  283,  283,  283,  283,  283,  283,  283,  284,    0,  284,
			  284,  284,  284,  284,  284,  284,  284,  284,  284,  284,
			  284,    0,  284,  284,  284,  284,  284,  284,  284,  284,
			  284,  284,  285,  285,  285,  285,  285,  285,  285,  285,
			  285,  285,  285,  285,  285,  285,  285,  285,  285,  285,

			  285,  285,  285,  285,  285,    0,  285,  286,  286,  286,
			  286,  286,  286,  286,  286,  286,  286,  286,  286,  286,
			  286,  286,  286,  286,  286,  286,  286,  286,  286,  286,
			  287,    0,  287,  287,  287,  287,  287,  287,  287,  287,
			  287,  287,  287,  287,  287,  287,  287,  287,  287,  287,
			  287,  287,  287,  287,  287,  288,  288,  288,  288,  288,
			  288,  288,  288,  288,  288,  288,  288,  288,  288,  288,
			  288,  288,  288,  288,  288,  288,  288,  288,  288,  288,
			  289,    0,    0,  289,  289,    0,  289,  289,  289,    0,
			  289,  289,  289,  289,  289,  289,  289,  289,  290,  290,

			    0,  290,  290,  290,  290,  290,    0,    0,  290,    0,
			  290,  290,  290,  290,  290,  290,  290,  290,  291,  291,
			  291,  291,  291,  291,  291,  291,  291,  291,  291,  291,
			  291,  291,  291,  291,  291,  291,  291,  291,  291,  291,
			  291,  291,  291,  292,  292,    0,  292,  292,  292,  292,
			  292,  292,  292,  292,    0,    0,  292,    0,  292,  292,
			  292,  292,  292,  292,  292,  292,  293,  293,  293,  293,
			  293,  293,  293,  293,  293,  293,  293,  293,  293,  293,
			  293,  293,  293,  293,  293,  293,  293,  293,  293,  293,
			  293,  294,  294,  294,  294,  294,  294,  294,  294,  294,

			  294,  294,  294,  294,  294,  294,  294,  294,  294,  294,
			  294,  294,  294,  294,  294,  294,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276, yy_Dummy>>,
			1, 798, 1000)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   79,   84,   14,   19,  820, 1716,   90,
			  816, 1716,  791, 1716,   75, 1716, 1716, 1716, 1716, 1716,
			  749,  744, 1716,   78,   85, 1716, 1716,  712, 1716,  620,
			  617,  617,   83,   64,  100,   86,   88,  129, 1716, 1716,
			  164,   59,  121,  197,   79,  196,    0, 1716,  622, 1716,
			 1716,  102,  163,  164,  168,  170,  173,  555,    0, 1716,
			  164,  622,  618, 1716,  589,    0,  247,  590,  577,  252,
			  259,  279,  286, 1716, 1716, 1716,  524,    0,  112,  229,
			  326,  301,  258,  124,  523,  395,  455,  521,  123,  309,
			   80,  298,   98,  300,  157,  285,  111,  269,    0,  499,

			 1716, 1716, 1716,  472,  302,  480,  483,  486,  419, 1716,
			    0, 1716, 1716,  482,  372,  480,  479,  477,  476,  210,
			 1716,  508,  515,  365,  462,  476,  360,  307,  251,  260,
			  523,  549,  557,  585,  548,  475,  351,  320,  650,  318,
			  234, 1716,  344,  483,  565,  170,  314,  300,  556,  297,
			  547,  309,  563,  557,  165,  573,  532,  726,  729,  732,
			 1716, 1716,  618, 1716, 1716, 1716, 1716,  722,  730,  735,
			  327,  733,  709,  748,  755,  760,  793,  807,  815,  314,
			  571,  270,  839, 1716, 1716,  920,    0,  318,  729,  552,
			  965,  551,  959,    0,  576,  988,  997,  275, 1015,  776,

			  264,  986, 1020, 1030, 1036,  263,  205,  203,  141,  102,
			    0,  704,  564,  728,    0,  764, 1047, 1056, 1004, 1716,
			 1018, 1716, 1716, 1716, 1716, 1716,  749, 1016,  123, 1072,
			 1081, 1035,  747, 1041, 1094, 1097, 1107,  107,    0, 1042,
			 1105, 1110, 1115, 1120, 1716,   72, 1125, 1137,  240, 1142,
			 1147, 1152, 1162, 1160, 1168, 1716, 1172, 1177, 1182, 1192,
			 1192, 1198, 1203, 1716, 1207, 1212, 1222, 1222, 1227, 1232,
			 1237, 1716, 1242, 1252, 1257, 1262, 1716, 1298, 1323, 1348,
			 1373, 1390, 1410, 1433, 1456, 1481, 1506, 1529, 1554, 1574,
			 1594, 1617, 1642, 1665, 1690, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  276,    1,  277,  277,  278,  278,  276,  276,  276,
			  276,  276,  279,  276,  280,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  281,  281,  281,  281,  281,  281,  282,  276,  276,
			  276,   40,   40,   40,   40,   40,  283,  276,  284,  276,
			  276,  276,  284,  284,  284,  284,  284,  285,  286,  276,
			  276,  276,  279,  276,  287,  287,  287,  288,  276,  276,
			  276,  276,  276,  276,  276,  276,  281,  289,  281,  281,
			  281,  281,  281,  281,  290,  276,   40,  276,   40,   40,
			   86,   40,   86,   40,   86,   40,   86,   40,  283,  284,

			  276,  276,  276,  284,  284,  284,  284,  284,  285,  276,
			  286,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  289,  281,  281,  281,
			  281,  281,  281,  281,  281,  281,  276,  291,  276,   85,
			  291,  276,  276,  276,   86,   86,   40,   86,   40,   86,
			   40,   86,   40,  284,  284,  284,  284,  284,  284,  284,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  289,  281,  281,   80,  173,  173,  276,  281,  281,  281,
			  281,  281,  276,  276,  276,  276,  292,   86,   40,   86,
			   40,   86,   40,   86,   40,  276,  276,  276,  276,  276,

			  281,  281,  276,  133,  133,  281,  293,  182,  294,  185,
			   86,   40,   86,   40,   86,   40,  276,  276,  276,  276,
			  281,  276,  276,  276,  276,  276,   86,   40,  276,  276,
			  276,  281,   86,   40,  276,  276,  276,  281,   86,   40,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,    0,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276, yy_Dummy>>)
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
			   50,   49,   49,   49,   49,   49,    0,   47,   47,   47,
			   49,   30,    0,   38,   37,    0,   34,   51,   51,   51,
			   51,   51,   51,   30,   30,    0,   58,    0,   55,   44,

			   31,   49,    0,   49,   49,   33,    0,    0,    0,    0,
			   31,   31,   51,   51,   33,   33,    0,    0,    0,   44,
			   49,   47,   36,   35,   36,   35,   51,   51,   46,    0,
			    0,   49,   51,   51,    0,    0,   43,   32,   32,   32,
			    0,    0,    0,    0,   43,   45,    0,   43,    0,    0,
			    0,    0,   42,    0,    0,   42,    0,    0,    0,   41,
			    0,    0,    0,   41,    0,    0,    0,   40,    0,    0,
			    0,   40,    0,   40,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 1716
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
