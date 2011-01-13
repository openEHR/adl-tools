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
	ANY_VALIDATOR
		rename
			reset as validator_reset
		end

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
--|#line 68 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 68")
end
-- Ignore separators
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 69 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 69")
end
in_lineno := in_lineno + text_count
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 74 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 74")
end
-- Ignore comments
end
else
if yy_act = 4 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 75 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 75")
end
in_lineno := in_lineno + 1
else
	yy_position := yy_position + 1
--|#line 79 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 79")
end
last_token := Minus_code
end
end
else
if yy_act <= 8 then
if yy_act <= 7 then
if yy_act = 6 then
	yy_position := yy_position + 1
--|#line 80 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 80")
end
last_token := Plus_code
else
	yy_position := yy_position + 1
--|#line 81 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 81")
end
last_token := Star_code
end
else
	yy_position := yy_position + 1
--|#line 82 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 82")
end
last_token := Slash_code
end
else
if yy_act = 9 then
	yy_position := yy_position + 1
--|#line 83 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 83")
end
last_token := Caret_code
else
	yy_position := yy_position + 1
--|#line 84 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 84")
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
--|#line 85 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 85")
end
last_token := Semicolon_code
else
	yy_position := yy_position + 1
--|#line 86 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 86")
end
last_token := Comma_code
end
else
	yy_position := yy_position + 1
--|#line 87 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 87")
end
last_token := Colon_code
end
else
if yy_act = 14 then
	yy_position := yy_position + 1
--|#line 88 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 88")
end
last_token := Exclamation_code
else
	yy_position := yy_position + 1
--|#line 89 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 89")
end
last_token := Left_parenthesis_code
end
end
else
if yy_act <= 17 then
if yy_act = 16 then
	yy_position := yy_position + 1
--|#line 90 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 90")
end
last_token := Right_parenthesis_code
else
	yy_position := yy_position + 1
--|#line 91 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 91")
end
last_token := Dollar_code
end
else
if yy_act = 18 then
	yy_position := yy_position + 2
--|#line 92 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 92")
end
last_token := SYM_DT_UNKNOWN
else
	yy_position := yy_position + 1
--|#line 93 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 93")
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
--|#line 95 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 95")
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
--|#line 105 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 105")
end
last_token := Left_bracket_code
end
else
	yy_position := yy_position + 1
--|#line 106 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 106")
end
last_token := Right_bracket_code
end
else
if yy_act = 23 then
	yy_position := yy_position + 1
--|#line 108 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 108")
end
last_token := SYM_EQ
else
	yy_position := yy_position + 2
--|#line 110 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 110")
end
last_token := SYM_GE
end
end
else
if yy_act <= 27 then
if yy_act <= 26 then
if yy_act = 25 then
	yy_position := yy_position + 2
--|#line 111 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 111")
end
last_token := SYM_LE
else
	yy_position := yy_position + 1
--|#line 113 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 113")
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
--|#line 124 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 124")
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
--|#line 133 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 133")
end
last_token := SYM_ELLIPSIS
else
	yy_position := yy_position + 3
--|#line 134 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 134")
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
--|#line 138 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 138")
end
last_token := SYM_TRUE
else
	yy_position := yy_position + 5
--|#line 140 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 140")
end
last_token := SYM_FALSE
end
else
	yy_position := yy_position + 8
--|#line 142 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 142")
end
last_token := SYM_INFINITY
end
else
if yy_act = 33 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 145 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 145")
end

	last_token := V_URI
	last_string_value := text

else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 151 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 151")
end

					last_token := V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
end
else
if yy_act <= 36 then
if yy_act = 35 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 156 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 156")
end

					last_token := ERR_V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 161 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 161")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 37 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 166 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 166")
end

					last_token := ERR_V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 172 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 172")
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
--|#line 179 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 179")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 180 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 180")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 181 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 181")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
if yy_act = 42 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 188 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 188")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 189 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 189")
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
--|#line 196 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 196")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
	yy_position := yy_position + 7
--|#line 197 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 197")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 207 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 207")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
else
if yy_act = 47 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 208 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 208")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 214 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 214")
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
--|#line 219 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 219")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 224 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 224")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 231 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 231")
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
--|#line 242 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 242")
end
		-- got an open brace
				in_buffer.append_string (text)
				cadl_depth := cadl_depth + 1
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 246 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 246")
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
--|#line 263 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 263")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 264 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 264")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
else
if yy_act = 56 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 271 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 271")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 272 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 272")
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
--|#line 279 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 279")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 284 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 284")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
end
else
	yy_position := yy_position + 2
--|#line 292 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 292")
end
in_buffer.append_character ('\')
end
else
if yy_act = 61 then
	yy_position := yy_position + 2
--|#line 294 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 294")
end
in_buffer.append_character ('"')
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 296 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 296")
end

				in_buffer.append_string (text)
	
end
end
else
if yy_act <= 65 then
if yy_act <= 64 then
if yy_act = 63 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 300 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 300")
end
in_buffer.append_string (text)
else
	yy_position := yy_position + 1
--|#line 302 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 302")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 307 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 307")
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
--|#line 320 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 320")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
else
	yy_position := yy_position + 3
--|#line 330 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 330")
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
--|#line 332 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 332")
end
last_token := V_CHARACTER; last_character_value := '%N'
else
	yy_position := yy_position + 4
--|#line 333 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 333")
end
last_token := V_CHARACTER; last_character_value := '%R'
end
else
	yy_position := yy_position + 4
--|#line 334 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 334")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 71 then
	yy_position := yy_position + 4
--|#line 335 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 335")
end
last_token := V_CHARACTER; last_character_value := '%''
else
	yy_position := yy_position + 4
--|#line 336 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 336")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 74 then
if yy_act = 73 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 338 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 338")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 339 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 339")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 75 then
	yy_position := yy_position + 1
--|#line 343 "dadl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'dadl_scanner.l' at line 343")
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
			create an_array.make (0, 1691)
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
			   63,   56,   48,   57,   47,   75,   56,   48,   57,   58,
			   67,   58,   68,   68,   68,   68,   68,   67,   77,   70,

			   70,   70,   70,   70,   75,   75,   69,   96,   76,   58,
			  115,   58,  115,   69,   78,   78,   78,   78,   78,   64,
			   80,   75,   77,   49,   88,   86,   97,  233,   49,   75,
			   69,   76,  219,  135,   81,   81,   86,   69,   79,   81,
			   81,   96,  138,   80,  135,   90,  140,   89,   92,   86,
			   50,   51,   52,   53,   54,   50,   51,   52,   53,   54,
			   86,   86,   86,   96,  210,   96,  138,   98,   96,   91,
			  140,   93,   86,   86,  100,   81,   83,   84,   84,   84,
			   84,   84,   85,  117,  117,  117,  117,  117,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,

			   84,   84,   84,   84,   84,   84,   99,   99,   99,  209,
			   84,   86,   86,   87,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   87,   86,   86,   86,  101,  101,
			  101,  102,  102,  103,  103,  103,  109,   67,  208,  118,
			  118,  118,  118,  118,  119,  110,  110,  110,  110,  110,
			  120,  142,  120,   69,   75,  121,  121,  121,  121,  121,
			   67,   75,  118,  118,  118,  118,  118,   75,  174,  138,
			   75,   79,  123,   86,  142,  111,   69,   69,  124,  129,
			  129,  129,  129,  129,   86,  130,   75,   86,  140,  112,
			  113,  176,  114,  139,  173,   75,  123,  178,   86,  180,

			   69,  207,  124,   78,   78,   78,   78,   78,  130,   86,
			   75,  162,  141,  142,  176,  197,  125,  225,  225,  225,
			   86,  178,  126,  180,   86,  160,  160,  160,  160,  127,
			  128,  235,  235,   75,  162,   86,  143,  201,   75,  197,
			  125,  121,  121,  121,  121,  121,  126,  121,  121,  121,
			  121,  121,  127,  128,  132,  132,  132,  132,  132,  132,
			  132,  132,  133,  133,  132,  132,  132,  133,  133,  132,
			  133,  133,  133,  133,  133,  134,  132,  132,  132,  132,
			  132,  133,  133,  133,  133,  133,  133,  133,  133,  133,
			  133,  133,  133,  133,  133,  133,  133,  133,  133,  132,

			  132,   75,  132,  133,  133,  133,  133,  133,  133,  133,
			  133,  133,  133,  133,  133,  133,  133,  133,  133,  133,
			  133,  132,  132,  132,  132,  132,  132,  132,  132,  132,
			  132,  132,  261,   96,  152,  153,  153,  153,  153,  153,
			  136,   96,  137,  137,  137,  137,  137,   96,   75,   75,
			   96,  161,  173,   96,  173,  199,  171,  211,  163,  172,
			  161,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   86,  199,
			  171,  211,  163,  117,  117,  117,  117,  117,   86,   86,
			  175,  157,  175,  175,  175,  175,  175,  158,   75,   86,

			  156,  144,  145,  146,  147,  148,   99,   99,   99,  155,
			  154,  188,   99,   99,   99,  149,  149,  149,  150,  150,
			  150,  158,   67,  173,  159,  159,  159,  159,  159,  164,
			  164,  164,  164,  164,   96,  188,   75,   96,   69,  165,
			  165,  165,  165,  165,  151,   86,   75,  166,  166,  166,
			  166,  166,  105,   79,   75,  136,   86,  136,  136,  136,
			  136,  136,   69,   79,  136,  180,  137,  137,  137,  137,
			  137,   79,  167,  176,  167,   96,  129,  129,  129,  129,
			  129,  178,   96,   75,   75,   96,   86,   86,   96,  181,
			   96,   96,  168,  131,  205,  169,  177,   86,   86,  170,

			   86,  100,   99,   99,   99,  179,  186,  186,  186,  186,
			  186,   86,   75,   75,  116,  115,  168,  108,  205,  169,
			  187,   86,  170,  152,  153,  153,  153,  153,  153,  182,
			   61,  182,   86,   59,  183,  183,  183,  183,  183,  105,
			  101,  101,  101,   96,  187,   75,   73,   72,  102,  102,
			  103,  103,  103,   99,   99,   99,   99,   99,   99,  184,
			   67,  217,  185,  185,  185,  185,  185,  164,  164,  164,
			  164,  164,  215,  215,  215,  215,   69,  165,  165,  165,
			  165,  165,   71,  197,  217,   75,   74,  166,  166,  166,
			  166,  166,   66,   65,   74,  189,  189,  189,  189,  189,

			   69,   61,  216,   74,   59,   86,  126,  198,  261,  261,
			   74,  190,  190,  190,  190,  190,   86,   74,   75,  261,
			  191,  191,  191,  191,  191,  216,   74,   75,  261,  261,
			  126,  192,  192,  192,  192,  192,  192,  192,  192,  192,
			  192,  192,  192,  192,  193,  193,  192,  193,  193,  193,
			  193,  193,  192,  192,  192,  192,  192,  192,  193,  193,
			  193,  193,  193,  193,  193,  193,  193,  193,  193,  193,
			  193,  193,  193,  193,  193,  193,  192,  192,  261,  192,
			  193,  193,  193,  193,  193,  193,  193,  193,  193,  193,
			  193,  193,  193,  193,  193,  193,  193,  193,  192,  192,

			  192,  192,  192,  192,  192,  192,  192,  192,  192,  194,
			  194,  194,  194,  194,  194,  194,  194,  194,  194,  194,
			  194,  194,  195,  195,  194,  195,  195,  195,  195,  195,
			  194,  194,  194,  194,  194,  194,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  194,  194,  173,  194,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  194,  194,  194,  194,
			  194,  194,  194,  194,  194,  194,  194,  175,  199,  175,
			  175,  175,  175,  175,  183,  183,  183,  183,  183,  183,

			  183,  183,  183,  183,   86,   67,  261,  185,  185,  185,
			  185,  185,  200,  261,  202,   86,  202,  261,  223,  261,
			  196,   69,  261,  261,  203,  189,  189,  189,  189,  189,
			  190,  190,  190,  190,  190,  191,  191,  191,  191,  191,
			  217,  223,  211,  261,  261,   69,   74,  204,  206,  261,
			  261,   74,   86,   75,   74,  213,  213,  213,  213,  213,
			  261,   86,  261,  218,  261,  261,  212,  261,  261,  261,
			   74,  206,   86,  222,  261,   74,  261,  261,   74,  214,
			  214,  214,  214,  214,  220,  220,  220,  220,  220,  221,
			  221,  221,  221,  221,  223,  261,  222,  226,  226,  226, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  226,  226,  261,   86,  227,  228,  227,  228,  230,  230,
			  230,  230,  230,  261,   86,  261,  261,  224,  204,  204,
			  204,  204,  204,  231,  231,  231,  231,  231,  232,  232,
			  232,  232,  232,  242,  242,  242,  242,  229,  234,  234,
			  234,  234,  234,  227,  261,  227,  261,  261,  232,  232,
			  232,  232,  232,  236,  236,  236,  236,  236,  237,  237,
			  237,  237,  237,  229,  229,  229,  229,  229,  238,  261,
			  238,  241,  241,  241,  241,  241,  229,  261,  239,  243,
			  243,  243,  243,  243,  244,  244,  244,  244,  244,  245,
			  245,  245,  245,  245,  246,  261,  246,  250,  250,  250,

			  250,  240,  261,  261,  247,  240,  240,  240,  240,  240,
			  249,  249,  249,  249,  249,  251,  251,  251,  251,  251,
			  252,  252,  252,  252,  252,  261,  261,  248,  253,  253,
			  253,  253,  253,  254,  255,  254,  255,  248,  248,  248,
			  248,  248,  257,  257,  257,  257,  257,  258,  258,  258,
			  258,  258,  259,  259,  259,  259,  259,  260,  260,  260,
			  260,  260,  254,  261,  254,  261,  256,  258,  258,  258,
			  258,  258,  256,  256,  256,  256,  256,  261,  261,  261,
			  261,  261,  261,  261,  261,  261,  261,  261,  261,  261,
			  261,  261,  261,  261,  261,  256,   46,   46,   46,   46,

			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   60,  261,   60,   60,
			   60,   60,   60,   60,   60,   60,   60,   60,   60,   60,
			   60,   60,  261,   60,   60,   60,   60,   60,   60,   60,
			   60,   62,  261,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   74,   74,  261,   74,

			  261,   74,   74,   74,  261,   74,   74,   74,   74,   74,
			   74,   82,   82,  261,   82,   82,   82,   82,  261,  261,
			  261,   82,   82,   82,  261,   82,   82,   82,   82,   82,
			   82,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   95,  261,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			  261,   95,   95,   95,   95,   95,   95,   95,   95,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,

			  104,  104,  261,  104,  106,  106,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  106,  107,  261,  107,
			  107,  107,  107,  107,  107,  107,  107,  107,  107,  107,
			  107,  107,  107,  107,  107,  107,  107,  107,  107,  107,
			  107,  107,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,  122,  261,  261,
			  122,  122,  261,  122,  122,  122,  122,  122,  261,  122,
			  122,  122,  122,  122,  122,   81,   81,  261,   81,   81,

			   81,   81,   81,  261,  261,   81,   81,   81,  261,   81,
			   81,   81,   81,   81,   81,   85,   85,  261,   85,   85,
			   85,   85,   85,   85,   85,   85,  261,  261,   85,   85,
			   85,  261,   85,   85,   85,   85,   85,   85,  132,  132,
			  132,  132,  132,  132,  132,  132,  132,  132,  132,  132,
			  132,  132,  132,  132,  132,  132,  132,  132,  132,  132,
			  132,  132,  132,  192,  192,  192,  192,  192,  192,  192,
			  192,  192,  192,  192,  192,  192,  192,  192,  192,  192,
			  192,  192,  192,  192,  192,  192,  192,  192,  194,  194,
			  194,  194,  194,  194,  194,  194,  194,  194,  194,  194,

			  194,  194,  194,  194,  194,  194,  194,  194,  194,  194,
			  194,  194,  194,    7,  261,  261,  261,  261,  261,  261,
			  261,  261,  261,  261,  261,  261,  261,  261,  261,  261,
			  261,  261,  261,  261,  261,  261,  261,  261,  261,  261,
			  261,  261,  261,  261,  261,  261,  261,  261,  261,  261,
			  261,  261,  261,  261,  261,  261,  261,  261,  261,  261,
			  261,  261,  261,  261,  261,  261,  261,  261,  261,  261,
			  261,  261,  261,  261,  261,  261,  261,  261,  261,  261,
			  261,  261,  261,  261,  261,  261,  261,  261,  261,  261,
			  261,  261, yy_Dummy>>,
			1, 692, 1000)
		end

	yy_chk_template: SPECIAL [INTEGER]
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 1691)
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
			   14,    5,    3,    5,    4,   33,    6,    4,    6,    9,
			   23,    9,   23,   23,   23,   23,   23,   24,   33,   24,

			   24,   24,   24,   24,   32,   35,   23,   51,   32,   58,
			  115,   58,  115,   24,   34,   34,   34,   34,   34,   14,
			   35,   34,   33,    3,   41,   40,   49,  230,    4,  222,
			   23,   32,  213,   83,   36,   36,   40,   24,   34,   36,
			   36,   50,   88,   35,   83,   42,   90,   41,   43,   41,
			    3,    3,    3,    3,    3,    4,    4,    4,    4,    4,
			   41,   42,   43,   52,  195,   53,   88,   49,   54,   42,
			   90,   43,   42,   43,   51,   36,   36,   39,   39,   39,
			   39,   39,   39,   67,   67,   67,   67,   67,   39,   39,
			   39,   39,   39,   39,   39,   39,   39,   39,   39,   39,

			   39,   39,   39,   39,   39,   39,   50,   50,   50,  194,
			   39,   39,   39,   39,   39,   39,   39,   39,   39,   39,
			   39,   39,   39,   39,   39,   39,   39,   39,   52,   52,
			   52,   53,   53,   54,   54,   54,   64,   68,  193,   68,
			   68,   68,   68,   68,   68,   64,   64,   64,   64,   64,
			   69,   92,   69,   68,  125,   69,   69,   69,   69,   69,
			   70,   76,   70,   70,   70,   70,   70,   80,  134,   89,
			   77,  125,   76,   86,   92,   64,   70,   68,   77,   79,
			   79,   79,   79,   79,   86,   80,   79,   89,   91,   64,
			   64,  138,   64,   89,  134,  123,   76,  140,   89,  142,

			   70,  192,   77,   78,   78,   78,   78,   78,   80,   91,
			   78,  123,   91,   93,  138,  176,   78,  219,  219,  219,
			   91,  140,   78,  142,   93,  119,  119,  119,  119,   78,
			   78,  233,  233,  187,  123,   93,   93,  184,  171,  176,
			   78,  120,  120,  120,  120,  120,   78,  121,  121,  121,
			  121,  121,   78,   78,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,

			   82,  170,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   84,   99,  110,  110,  110,  110,  110,  110,
			   87,  100,   87,   87,   87,   87,   87,  101,  124,  130,
			  102,  161,  133,  103,  132,  178,  130,  199,  124,  131,
			  122,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   87,  178,
			  130,  199,  124,  117,  117,  117,  117,  117,  181,   87,
			  135,  114,  135,  135,  135,  135,  135,  117,  163,  181,

			  113,   99,   99,   99,   99,   99,  100,  100,  100,  112,
			  111,  163,  101,  101,  101,  102,  102,  102,  103,  103,
			  103,  117,  118,  135,  118,  118,  118,  118,  118,  126,
			  126,  126,  126,  126,  145,  163,  126,  144,  118,  127,
			  127,  127,  127,  127,  109,  198,  127,  128,  128,  128,
			  128,  128,  104,  126,  128,  136,  198,  136,  136,  136,
			  136,  136,  118,  127,  137,  143,  137,  137,  137,  137,
			  137,  128,  129,  139,  129,  146,  129,  129,  129,  129,
			  129,  141,  147,  129,  188,  148,  139,  143,  149,  143,
			   95,  150,  129,   81,  188,  129,  139,  139,  143,  129,

			  141,  145,  144,  144,  144,  141,  160,  160,  160,  160,
			  160,  141,   74,  162,   66,   65,  129,   62,  188,  129,
			  162,  224,  129,  153,  153,  153,  153,  153,  153,  158,
			   60,  158,  224,   59,  158,  158,  158,  158,  158,   55,
			  146,  146,  146,   46,  162,   31,   30,   29,  147,  147,
			  148,  148,  148,  149,  149,  149,  150,  150,  150,  159,
			  159,  211,  159,  159,  159,  159,  159,  164,  164,  164,
			  164,  164,  203,  203,  203,  203,  159,  165,  165,  165,
			  165,  165,   27,  177,  211,  205,  164,  166,  166,  166,
			  166,  166,   21,   20,  164,  167,  167,  167,  167,  167,

			  159,   12,  205,  165,   10,  177,  166,  177,    7,    0,
			  164,  168,  168,  168,  168,  168,  177,  164,  168,    0,
			  169,  169,  169,  169,  169,  205,  165,  169,    0,    0,
			  166,  172,  172,  172,  172,  172,  172,  172,  172,  172,
			  172,  172,  172,  172,  172,  172,  172,  172,  172,  172,
			  172,  172,  172,  172,  172,  172,  172,  172,  172,  172,
			  172,  172,  172,  172,  172,  172,  172,  172,  172,  172,
			  172,  172,  172,  172,  172,  172,  172,  172,    0,  172,
			  172,  172,  172,  172,  172,  172,  172,  172,  172,  172,
			  172,  172,  172,  172,  172,  172,  172,  172,  172,  172,

			  172,  172,  172,  172,  172,  172,  172,  172,  172,  174,
			  174,  174,  174,  174,  174,  174,  174,  174,  174,  174,
			  174,  174,  174,  174,  174,  174,  174,  174,  174,  174,
			  174,  174,  174,  174,  174,  174,  174,  174,  174,  174,
			  174,  174,  174,  174,  174,  174,  174,  174,  174,  174,
			  174,  174,  174,  174,  174,  174,  174,  174,  174,  174,
			  174,  174,  174,  174,  174,  174,  174,  174,  174,  174,
			  174,  174,  174,  174,  174,  174,  174,  174,  174,  174,
			  174,  174,  174,  174,  174,  174,  174,  175,  179,  175,
			  175,  175,  175,  175,  182,  182,  182,  182,  182,  183,

			  183,  183,  183,  183,  179,  185,    0,  185,  185,  185,
			  185,  185,  179,    0,  186,  179,  186,    0,  217,    0,
			  175,  185,    0,    0,  186,  189,  189,  189,  189,  189,
			  190,  190,  190,  190,  190,  191,  191,  191,  191,  191,
			  212,  217,  200,    0,    0,  185,  190,  186,  189,    0,
			    0,  191,  212,  216,  191,  201,  201,  201,  201,  201,
			    0,  200,    0,  212,    0,    0,  200,    0,    0,    0,
			  190,  189,  200,  216,    0,  191,    0,    0,  191,  202,
			  202,  202,  202,  202,  214,  214,  214,  214,  214,  215,
			  215,  215,  215,  215,  218,    0,  216,  220,  220,  220, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  220,  220,    0,  218,  221,  221,  221,  221,  225,  225,
			  225,  225,  225,    0,  218,    0,    0,  218,  226,  226,
			  226,  226,  226,  227,  227,  227,  227,  227,  228,  228,
			  228,  228,  228,  239,  239,  239,  239,  221,  231,  231,
			  231,  231,  231,  232,    0,  232,    0,    0,  232,  232,
			  232,  232,  232,  234,  234,  234,  234,  234,  235,  235,
			  235,  235,  235,  236,  236,  236,  236,  236,  237,    0,
			  237,  238,  238,  238,  238,  238,  232,    0,  237,  241,
			  241,  241,  241,  241,  242,  242,  242,  242,  242,  243,
			  243,  243,  243,  243,  244,    0,  244,  247,  247,  247,

			  247,  237,    0,    0,  244,  245,  245,  245,  245,  245,
			  246,  246,  246,  246,  246,  249,  249,  249,  249,  249,
			  250,  250,  250,  250,  250,    0,    0,  244,  251,  251,
			  251,  251,  251,  252,  252,  252,  252,  253,  253,  253,
			  253,  253,  254,  254,  254,  254,  254,  255,  255,  255,
			  255,  255,  257,  257,  257,  257,  257,  259,  259,  259,
			  259,  259,  258,    0,  258,    0,  252,  258,  258,  258,
			  258,  258,  260,  260,  260,  260,  260,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  258,  262,  262,  262,  262,

			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  264,    0,  264,  264,
			  264,  264,  264,  264,  264,  264,  264,  264,  264,  264,
			  264,  264,    0,  264,  264,  264,  264,  264,  264,  264,
			  264,  265,    0,  265,  265,  265,  265,  265,  265,  265,
			  265,  265,  265,  265,  265,  265,  265,  265,  265,  265,
			  265,  265,  265,  265,  265,  265,  266,  266,    0,  266,

			    0,  266,  266,  266,    0,  266,  266,  266,  266,  266,
			  266,  267,  267,    0,  267,  267,  267,  267,    0,    0,
			    0,  267,  267,  267,    0,  267,  267,  267,  267,  267,
			  267,  268,  268,  268,  268,  268,  268,  268,  268,  268,
			  268,  268,  268,  268,  268,  268,  268,  268,  268,  268,
			  268,  268,  268,  268,  269,    0,  269,  269,  269,  269,
			  269,  269,  269,  269,  269,  269,  269,  269,  269,  269,
			    0,  269,  269,  269,  269,  269,  269,  269,  269,  270,
			  270,  270,  270,  270,  270,  270,  270,  270,  270,  270,
			  270,  270,  270,  270,  270,  270,  270,  270,  270,  270,

			  270,  270,    0,  270,  271,  271,  271,  271,  271,  271,
			  271,  271,  271,  271,  271,  271,  271,  271,  271,  271,
			  271,  271,  271,  271,  271,  271,  271,  272,    0,  272,
			  272,  272,  272,  272,  272,  272,  272,  272,  272,  272,
			  272,  272,  272,  272,  272,  272,  272,  272,  272,  272,
			  272,  272,  273,  273,  273,  273,  273,  273,  273,  273,
			  273,  273,  273,  273,  273,  273,  273,  273,  273,  273,
			  273,  273,  273,  273,  273,  273,  273,  274,    0,    0,
			  274,  274,    0,  274,  274,  274,  274,  274,    0,  274,
			  274,  274,  274,  274,  274,  275,  275,    0,  275,  275,

			  275,  275,  275,    0,    0,  275,  275,  275,    0,  275,
			  275,  275,  275,  275,  275,  276,  276,    0,  276,  276,
			  276,  276,  276,  276,  276,  276,    0,    0,  276,  276,
			  276,    0,  276,  276,  276,  276,  276,  276,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  277,  277,  277,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  279,  279,
			  279,  279,  279,  279,  279,  279,  279,  279,  279,  279,

			  279,  279,  279,  279,  279,  279,  279,  279,  279,  279,
			  279,  279,  279,  261,  261,  261,  261,  261,  261,  261,
			  261,  261,  261,  261,  261,  261,  261,  261,  261,  261,
			  261,  261,  261,  261,  261,  261,  261,  261,  261,  261,
			  261,  261,  261,  261,  261,  261,  261,  261,  261,  261,
			  261,  261,  261,  261,  261,  261,  261,  261,  261,  261,
			  261,  261,  261,  261,  261,  261,  261,  261,  261,  261,
			  261,  261,  261,  261,  261,  261,  261,  261,  261,  261,
			  261,  261,  261,  261,  261,  261,  261,  261,  261,  261,
			  261,  261, yy_Dummy>>,
			1, 692, 1000)
		end

	yy_base_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   76,   81,   13,   18,  708, 1613,   87,
			  701, 1613,  695, 1613,   72, 1613, 1613, 1613, 1613, 1613,
			  679,  677, 1613,   75,   82, 1613, 1613,  657, 1613,  622,
			  619,  621,   80,   61,   97,   81,  125, 1613, 1613,  160,
			   72,   96,  108,  109,    0, 1613,  637, 1613, 1613,  120,
			  135,  101,  157,  159,  162,  569,    0, 1613,  107,  630,
			  624, 1613,  609,    0,  228,  612,  599,  166,  222,  238,
			  245, 1613, 1613, 1613,  588,    0,  237,  246,  286,  262,
			  243,  571,  353,   80,  410,    0,  220,  425,  107,  234,
			  114,  256,  209,  271,    0,  584, 1613, 1613, 1613,  427,

			  435,  441,  444,  447,  482, 1613,    0, 1613, 1613,  536,
			  418,  502,  501,  492,  483,  108, 1613,  466,  507,  308,
			  324,  330,  434,  271,  424,  230,  512,  522,  530,  559,
			  425,  437,  406,  404,  246,  475,  540,  549,  251,  533,
			  263,  547,  268,  534,  531,  528,  569,  576,  579,  582,
			  585, 1613, 1613,  607, 1613, 1613, 1613, 1613,  617,  645,
			  589,  425,  589,  474,  650,  660,  670,  678,  694,  703,
			  377,  314,  730, 1613,  808,  872,  284,  652,  418,  851,
			    0,  435,  877,  882,  320,  890,  902,  309,  560,  908,
			  913,  918,  253,  190,  161,  116, 1613,    0,  492,  423,

			  908,  938,  962,  655, 1613,  661, 1613, 1613, 1613, 1613,
			 1613,  620,  899,  118,  967,  972,  929,  874,  950,  300,
			  980,  992,  105,    0,  568,  991, 1001, 1006, 1011, 1613,
			   86, 1021, 1031,  314, 1036, 1041, 1046, 1056, 1054, 1016,
			 1613, 1062, 1067, 1072, 1082, 1088, 1093, 1080, 1613, 1098,
			 1103, 1111, 1121, 1120, 1125, 1130, 1613, 1135, 1150, 1140,
			 1155, 1613, 1195, 1220, 1245, 1270, 1287, 1307, 1330, 1353,
			 1378, 1403, 1426, 1451, 1471, 1491, 1514, 1537, 1562, 1587, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,  261,    1,  262,  262,  263,  263,  261,  261,  261,
			  261,  261,  264,  261,  265,  261,  261,  261,  261,  261,
			  261,  261,  261,  261,  261,  261,  261,  261,  261,  261,
			  261,  266,  266,  266,  266,  266,  267,  261,  261,  261,
			   39,   39,   39,   39,  268,  261,  269,  261,  261,  261,
			  269,  269,  269,  269,  269,  270,  271,  261,  261,  261,
			  264,  261,  272,  272,  272,  273,  261,  261,  261,  261,
			  261,  261,  261,  261,  266,  274,  266,  266,  266,  266,
			  266,  275,  261,   82,   39,  276,   39,   39,   84,   39,
			   84,   39,   84,   39,  268,  269,  261,  261,  261,  269,

			  269,  269,  269,  269,  270,  261,  271,  261,  261,  261,
			  261,  261,  261,  261,  261,  261,  261,  261,  261,  261,
			  261,  261,  274,  266,  266,  266,  266,  266,  266,  266,
			  266,  261,  277,   82,  277,   82,  261,   84,   84,   39,
			   84,   39,   84,   39,  269,  269,  269,  269,  269,  269,
			  269,  261,  261,  261,  261,  261,  261,  261,  261,  261,
			  261,  274,  266,  266,   78,  164,  164,  261,  266,  266,
			  266,  266,  261,  261,  261,   82,   84,   39,   84,   39,
			   84,   39,  261,  261,  261,  261,  261,  266,  266,  261,
			  129,  129,  278,  172,  279,  174,  261,   84,   39,   84,

			   39,  261,  261,  261,  261,  266,  261,  261,  261,  261,
			  261,   84,   39,  261,  261,  261,  266,   84,   39,  261,
			  261,  261,  266,   84,   39,  261,  261,  261,  261,  261,
			  261,  261,  261,  261,  261,  261,  261,  261,  261,  261,
			  261,  261,  261,  261,  261,  261,  261,  261,  261,  261,
			  261,  261,  261,  261,  261,  261,  261,  261,  261,  261,
			  261,    0,  261,  261,  261,  261,  261,  261,  261,  261,
			  261,  261,  261,  261,  261,  261,  261,  261,  261,  261, yy_Dummy>>)
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
			    0,    1,    1,    2,    3,    1,    3,    1,    1,    4,
			    5,    1,    1,    6,    7,    8,    1,    9,    9,    9,
			    9,   10,   11,    1,   12,    1,   13,    1,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,   14,   15,    9,   16,    1,   17,    1,    3,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,   18,   19,   20,   21,   22,   23,   24,    3,
			   25,    1,    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
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
			   48,    0,    0,    0,   50,   33,   50,   50,   50,   50,
			   50,   50,   50,   50,   51,   63,   65,   61,   60,   62,

			   63,   63,   63,   63,    0,   53,   52,   73,   67,   73,
			   73,   73,   73,   73,   73,    4,   29,   56,   54,    0,
			    0,   55,    0,   48,   48,   47,   47,   47,   47,   48,
			   48,    0,    0,    0,    0,    0,   38,   38,   50,   50,
			   50,   50,   50,   50,   63,   63,   63,   63,   63,   63,
			   63,   71,   74,   74,   72,   68,   69,   70,    0,   54,
			    0,   49,   48,   48,   48,   48,   48,    0,   46,   46,
			   46,   30,    0,   37,    0,    0,   50,   50,   50,   50,
			   30,   30,    0,   57,    0,   54,   43,   31,   48,    0,
			   48,   48,    0,    0,    0,    0,   36,   31,   31,   50,

			   50,    0,    0,    0,   43,   48,   46,   35,   34,   35,
			   34,   50,   50,   45,    0,    0,   48,   50,   50,    0,
			    0,   42,   32,   32,   32,    0,    0,    0,    0,   42,
			   44,    0,   42,    0,    0,    0,    0,   41,    0,    0,
			   41,    0,    0,    0,   40,    0,    0,    0,   40,    0,
			    0,    0,   39,    0,    0,    0,   39,    0,   39,    0,
			    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 1613
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 261
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 262
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
			validator_reset
		end

	validate
		do
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
