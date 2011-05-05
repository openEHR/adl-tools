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
			create an_array.make (0, 1752)
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
			   67,   58,   68,   68,   68,   68,   68,   67,   74,   70,

			   70,   70,   70,   70,   74,   76,   69,   74,   89,   87,
			   58,   93,   58,   69,   97,   74,  236,  236,   76,   64,
			   87,  136,   77,   49,   76,   87,   98,   76,   49,   97,
			   69,   90,  136,   87,   94,   76,   87,   69,   97,   81,
			   78,   82,   82,  143,   87,   77,   82,   82,  234,  220,
			   50,   51,   52,   53,   54,   50,   51,   52,   53,   54,
			   74,   97,   81,   91,   78,   74,  143,   99,  118,  118,
			  118,  118,  118,   79,   79,   79,   79,   79,   87,   87,
			   76,  101,   82,   84,   97,   76,  211,   92,   97,   87,
			   87,  116,  210,  116,  100,  100,  100,   80,   85,   85,

			   85,   85,   85,   86,  103,  103,  139,   74,  209,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   76,  101,  208,
			  139,   85,   87,   87,   88,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   88,   87,   87,   87,  102,
			  102,  102,  110,  104,  104,  104,  141,   74,   74,  202,
			  162,  111,  111,  111,  111,  111,  179,   67,  174,  119,
			  119,  119,  119,  119,  120,   97,  181,   76,   76,  121,
			  141,  121,   74,   69,  122,  122,  122,  122,  122,  124,
			  179,  112,   74,   67,   80,  119,  119,  119,  119,  119,

			  181,   74,   76,  175,  198,  113,  114,   69,  115,   69,
			  125,   97,   76,  124,  130,  130,  130,  130,  130,  174,
			  137,   76,  138,  138,  138,  138,  138,   97,  198,  174,
			  131,  173,  200,   69,  125,   74,  139,  162,  141,  161,
			  161,  161,  161,  145,  146,  147,  148,  149,   79,   79,
			   79,   79,   79,  131,   87,   76,  200,  143,   87,   87,
			  140,  126,  142,   74,   74,   87,  158,  127,   87,   87,
			   87,   87,  177,  218,  128,  129,  100,  100,  100,   87,
			  144,  157,   87,   76,   76,  126,  122,  122,  122,  122,
			  122,  127,  100,  100,  100,  177,  218,  128,  129,  133,

			  133,  133,  133,  133,  133,  133,  133,  134,  134,  133,
			  133,  133,  134,  134,  133,  134,  134,  134,  134,  134,
			  135,  133,  133,  133,  133,  133,  134,  134,  134,  134,
			  134,  134,  134,  134,  134,  134,  134,  134,  134,  134,
			  134,  134,  134,  134,  133,  133,  156,  133,  134,  134,
			  134,  134,  134,  134,  134,  134,  134,  134,  134,  134,
			  134,  134,  134,  134,  134,  134,  133,  133,  133,  133,
			  133,  133,  133,  133,  133,  133,  133,  262,   97,  155,
			  152,   97,  153,  154,  154,  154,  154,  154,  118,  118,
			  118,  118,  118,  122,  122,  122,  122,  122,  216,  216,

			  216,  216,  159,   74,   74,  106,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   76,   76,   67,  159,  160,  160,  160,
			  160,  160,   97,   97,  164,  212,   74,   74,  132,  163,
			   74,   69,  179,  150,  150,  150,  151,  151,  151,  165,
			  165,  165,  165,  165,   74,  117,   76,   76,  164,  212,
			   76,   87,  163,   74,  172,   69,  180,  166,  166,  166,
			  166,  166,   87,   80,   76,   87,  167,  167,  167,  167,
			  167,   97,  116,   76,   97,  109,   87,  181,  172,   61,
			  176,   80,  176,  176,  176,  176,  176,  100,  100,  100,

			   80,   74,  137,   97,  137,  137,  137,  137,  137,   87,
			  168,  182,  168,   97,  130,  130,  130,  130,  130,  177,
			   87,   76,  137,  174,  138,  138,  138,  138,  138,   97,
			  169,   59,   87,  170,  198,  106,   97,  171,   87,   74,
			   73,   72,  178,   87,   71,   66,  102,  102,  102,   87,
			  103,  103,   65,   61,  169,   59,   87,  170,  199,   76,
			  171,  153,  154,  154,  154,  154,  154,   87,  104,  104,
			  104,  187,  187,  187,  187,  187,  217,  262,  100,  100,
			  100,  183,  262,  183,  262,   74,  184,  184,  184,  184,
			  184,   74,  262,  262,  100,  100,  100,  185,   67,  217,

			  186,  186,  186,  186,  186,   76,  165,  165,  165,  165,
			  165,   76,  188,  262,   69,  166,  166,  166,  166,  166,
			  224,  226,  226,  226,  189,   75,  167,  167,  167,  167,
			  167,  200,  203,   75,  203,  262,  188,  262,   69,  262,
			  262,   75,  204,  224,  262,  127,   74,   87,  189,   75,
			  190,  190,  190,  190,  190,  201,   75,   74,   87,  191,
			  191,  191,  191,  191,   75,  205,   76,  262,  262,  127,
			  192,  192,  192,  192,  192,  262,  262,   76,  193,  193,
			  193,  193,  193,  193,  193,  193,  193,  193,  193,  193,
			  193,  194,  194,  193,  194,  194,  194,  194,  194,  193,

			  193,  193,  193,  193,  193,  194,  194,  194,  194,  194,
			  194,  194,  194,  194,  194,  194,  194,  194,  194,  194,
			  194,  194,  194,  193,  193,  262,  193,  194,  194,  194,
			  194,  194,  194,  194,  194,  194,  194,  194,  194,  194,
			  194,  194,  194,  194,  194,  193,  193,  193,  193,  193,
			  193,  193,  193,  193,  193,  193,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  196,
			  196,  195,  196,  196,  196,  196,  196,  195,  195,  195,
			  195,  195,  195,  196,  196,  196,  196,  196,  196,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,

			  196,  195,  195,  174,  195,  196,  196,  196,  196,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,
			  196,  196,  196,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  176,  262,  176,  176,  176,  176,
			  176,  184,  184,  184,  184,  184,  184,  184,  184,  184,
			  184,   74,   67,  262,  186,  186,  186,  186,  186,  262,
			  190,  190,  190,  190,  190,  262,  218,  197,   69,  262,
			  224,   76,  191,  191,  191,  191,  191,  262,   87,   87,
			  262,  206,  262,  207,  212,  262,  262,  262,   75,  219,
			   87,   74,   69,  225,  192,  192,  192,  192,  192,  228, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  229,  228,  229,   87,  262,  206,  207,  262,  213,  262,
			   75,   76,   75,   75,   87,  214,  214,  214,  214,  214,
			  215,  215,  215,  215,  215,  221,  221,  221,  221,  221,
			  262,  223,  230,  262,   75,  262,  262,   75,  222,  222,
			  222,  222,  222,  227,  227,  227,  227,  227,  231,  231,
			  231,  231,  231,  262,  223,  205,  205,  205,  205,  205,
			  232,  232,  232,  232,  232,  233,  233,  233,  233,  233,
			  235,  235,  235,  235,  235,  228,  262,  228,  262,  262,
			  233,  233,  233,  233,  233,  237,  237,  237,  237,  237,
			  238,  238,  238,  238,  238,  230,  230,  230,  230,  230,

			  239,  262,  239,  242,  242,  242,  242,  242,  230,  262,
			  240,  243,  243,  243,  243,  244,  244,  244,  244,  244,
			  245,  245,  245,  245,  245,  246,  246,  246,  246,  246,
			  247,  262,  247,  241,  241,  241,  241,  241,  241,  262,
			  248,  250,  250,  250,  250,  250,  251,  251,  251,  251,
			  252,  252,  252,  252,  252,  253,  253,  253,  253,  253,
			  262,  262,  262,  249,  254,  254,  254,  254,  254,  255,
			  256,  255,  256,  249,  249,  249,  249,  249,  258,  258,
			  258,  258,  258,  259,  259,  259,  259,  259,  260,  260,
			  260,  260,  260,  261,  261,  261,  261,  261,  255,  262,

			  255,  262,  257,  259,  259,  259,  259,  259,  257,  257,
			  257,  257,  257,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  257,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   60,  262,   60,   60,   60,   60,
			   60,   60,   60,   60,   60,   60,   60,   60,   60,   60,

			   60,  262,   60,   60,   60,   60,   60,   60,   60,   60,
			   62,  262,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   75,  262,  262,  262,
			  262,  262,  262,   75,   75,  262,   75,  262,   75,   75,
			   75,  262,   75,   75,   75,   75,   75,   75,   83,   83,
			  262,   83,   83,   83,   83,  262,  262,  262,   83,   83,
			   83,  262,   83,   83,   83,   83,   83,   83,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,

			   95,   95,   96,  262,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,  262,
			   96,   96,   96,   96,   96,   96,   96,   96,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  262,  105,  107,  107,  107,  107,  107,  107,
			  107,  107,  107,  107,  107,  107,  107,  107,  107,  107,
			  107,  107,  107,  107,  107,  107,  107,  107,  108,  262,
			  108,  108,  108,  108,  108,  108,  108,  108,  108,  108,
			  108,  108,  108,  108,  108,  108,  108,  108,  108,  108,

			  108,  108,  108,  108,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			  123,  262,  262,  262,  123,  262,  262,  123,  123,  262,
			  123,  123,  123,  123,  123,  262,  123,  123,  123,  123,
			  123,  123,   82,   82,  262,   82,   82,   82,   82,   82,
			  262,  262,   82,   82,   82,  262,   82,   82,   82,   82,
			   82,   82,   86,   86,  262,  262,   86,   86,   86,   86,
			   86,   86,   86,   86,  262,  262,   86,   86,   86,  262,
			   86,   86,   86,   86,   86,   86,  133,  133,  133,  133,

			  133,  133,  133,  133,  133,  133,  133,  133,  133,  133,
			  133,  133,  133,  133,  133,  133,  133,  133,  133,  133,
			  133,  133,  193,  193,  193,  193,  193,  193,  193,  193,
			  193,  193,  193,  193,  193,  193,  193,  193,  193,  193,
			  193,  193,  193,  193,  193,  193,  193,  193,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,    7,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,

			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262, yy_Dummy>>,
			1, 753, 1000)
		end

	yy_chk_template: SPECIAL [INTEGER]
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 1752)
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
			   14,    5,    3,    5,    4,   31,    6,    4,    6,    9,
			   23,    9,   23,   23,   23,   23,   23,   24,   32,   24,

			   24,   24,   24,   24,   35,   31,   23,   33,   41,   40,
			   58,   43,   58,   24,   51,   74,  234,  234,   32,   14,
			   40,   84,   32,    3,   35,   43,   49,   33,    4,   50,
			   23,   41,   84,   41,   43,   74,   43,   24,   53,   35,
			   33,   36,   36,   93,   41,   32,   36,   36,  231,  214,
			    3,    3,    3,    3,    3,    4,    4,    4,    4,    4,
			   34,  146,   35,   42,   33,   75,   93,   49,   67,   67,
			   67,   67,   67,   34,   34,   34,   34,   34,   87,   42,
			   34,   51,   36,   36,   52,   75,  196,   42,   54,   87,
			   42,  116,  195,  116,   50,   50,   50,   34,   39,   39,

			   39,   39,   39,   39,   53,   53,   89,  171,  194,   39,
			   39,   39,   39,   39,   39,   39,   39,   39,   39,   39,
			   39,   39,   39,   39,   39,   39,   39,  171,  146,  193,
			   89,   39,   39,   39,   39,   39,   39,   39,   39,   39,
			   39,   39,   39,   39,   39,   39,   39,   39,   39,   52,
			   52,   52,   64,   54,   54,   54,   91,  126,   77,  185,
			  162,   64,   64,   64,   64,   64,  141,   68,  134,   68,
			   68,   68,   68,   68,   68,  100,  143,  126,   77,   69,
			   91,   69,   78,   68,   69,   69,   69,   69,   69,   77,
			  141,   64,   81,   70,  126,   70,   70,   70,   70,   70,

			  143,   80,   78,  135,  177,   64,   64,   68,   64,   70,
			   78,  101,   81,   77,   80,   80,   80,   80,   80,  133,
			   88,   80,   88,   88,   88,   88,   88,  102,  177,  135,
			   81,  132,  179,   70,   78,   79,   90,  123,   92,  120,
			  120,  120,  120,  100,  100,  100,  100,  100,   79,   79,
			   79,   79,   79,   81,   90,   79,  179,   94,   88,   92,
			   90,   79,   92,  172,  188,   90,  115,   79,   94,   88,
			   92,  182,  139,  212,   79,   79,  101,  101,  101,   94,
			   94,  114,  182,  172,  188,   79,  121,  121,  121,  121,
			  121,   79,  102,  102,  102,  139,  212,   79,   79,   83,

			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,  113,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   85,  103,  112,
			  110,  104,  111,  111,  111,  111,  111,  111,  118,  118,
			  118,  118,  118,  122,  122,  122,  122,  122,  204,  204,

			  204,  204,  118,  124,  125,  105,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,  124,  125,  119,  118,  119,  119,  119,
			  119,  119,  145,   96,  125,  200,  127,  131,   82,  124,
			  223,  119,  142,  103,  103,  103,  104,  104,  104,  127,
			  127,  127,  127,  127,  128,   66,  127,  131,  125,  200,
			  223,  142,  124,  129,  131,  119,  142,  128,  128,  128,
			  128,  128,  142,  127,  128,  199,  129,  129,  129,  129,
			  129,  147,   65,  129,  148,   62,  199,  144,  131,   60,
			  136,  128,  136,  136,  136,  136,  136,  145,  145,  145,

			  129,  130,  137,  149,  137,  137,  137,  137,  137,  144,
			  130,  144,  130,  150,  130,  130,  130,  130,  130,  140,
			  144,  130,  138,  136,  138,  138,  138,  138,  138,  151,
			  130,   59,  140,  130,  178,   55,   46,  130,  225,  206,
			   30,   29,  140,  140,   27,   21,  147,  147,  147,  225,
			  148,  148,   20,   12,  130,   10,  178,  130,  178,  206,
			  130,  154,  154,  154,  154,  154,  154,  178,  149,  149,
			  149,  161,  161,  161,  161,  161,  206,    7,  150,  150,
			  150,  159,    0,  159,    0,  163,  159,  159,  159,  159,
			  159,  164,    0,    0,  151,  151,  151,  160,  160,  206,

			  160,  160,  160,  160,  160,  163,  165,  165,  165,  165,
			  165,  164,  163,    0,  160,  166,  166,  166,  166,  166,
			  218,  220,  220,  220,  164,  165,  167,  167,  167,  167,
			  167,  180,  187,  165,  187,    0,  163,    0,  160,    0,
			    0,  166,  187,  218,    0,  167,  169,  180,  164,  165,
			  168,  168,  168,  168,  168,  180,  165,  170,  180,  169,
			  169,  169,  169,  169,  166,  187,  169,    0,    0,  167,
			  170,  170,  170,  170,  170,    0,    0,  170,  173,  173,
			  173,  173,  173,  173,  173,  173,  173,  173,  173,  173,
			  173,  173,  173,  173,  173,  173,  173,  173,  173,  173,

			  173,  173,  173,  173,  173,  173,  173,  173,  173,  173,
			  173,  173,  173,  173,  173,  173,  173,  173,  173,  173,
			  173,  173,  173,  173,  173,    0,  173,  173,  173,  173,
			  173,  173,  173,  173,  173,  173,  173,  173,  173,  173,
			  173,  173,  173,  173,  173,  173,  173,  173,  173,  173,
			  173,  173,  173,  173,  173,  173,  175,  175,  175,  175,
			  175,  175,  175,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,  175,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,  175,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,  175,  175,  175,  175,  175,  175,  175,  175,

			  175,  175,  175,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,  175,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,  175,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,  175,  175,  176,    0,  176,  176,  176,  176,
			  176,  183,  183,  183,  183,  183,  184,  184,  184,  184,
			  184,  189,  186,    0,  186,  186,  186,  186,  186,    0,
			  190,  190,  190,  190,  190,    0,  213,  176,  186,    0,
			  219,  189,  191,  191,  191,  191,  191,    0,  213,  219,
			    0,  189,    0,  190,  201,    0,    0,    0,  191,  213,
			  219,  217,  186,  219,  192,  192,  192,  192,  192,  222, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  222,  222,  222,  201,    0,  189,  190,    0,  201,    0,
			  192,  217,  191,  192,  201,  202,  202,  202,  202,  202,
			  203,  203,  203,  203,  203,  215,  215,  215,  215,  215,
			    0,  217,  222,    0,  192,    0,    0,  192,  216,  216,
			  216,  216,  216,  221,  221,  221,  221,  221,  226,  226,
			  226,  226,  226,    0,  217,  227,  227,  227,  227,  227,
			  228,  228,  228,  228,  228,  229,  229,  229,  229,  229,
			  232,  232,  232,  232,  232,  233,    0,  233,    0,    0,
			  233,  233,  233,  233,  233,  235,  235,  235,  235,  235,
			  236,  236,  236,  236,  236,  237,  237,  237,  237,  237,

			  238,    0,  238,  239,  239,  239,  239,  239,  233,    0,
			  238,  240,  240,  240,  240,  242,  242,  242,  242,  242,
			  243,  243,  243,  243,  243,  244,  244,  244,  244,  244,
			  245,    0,  245,  238,  246,  246,  246,  246,  246,    0,
			  245,  247,  247,  247,  247,  247,  248,  248,  248,  248,
			  250,  250,  250,  250,  250,  251,  251,  251,  251,  251,
			    0,    0,    0,  245,  252,  252,  252,  252,  252,  253,
			  253,  253,  253,  254,  254,  254,  254,  254,  255,  255,
			  255,  255,  255,  256,  256,  256,  256,  256,  258,  258,
			  258,  258,  258,  260,  260,  260,  260,  260,  259,    0,

			  259,    0,  253,  259,  259,  259,  259,  259,  261,  261,
			  261,  261,  261,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  259,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  264,  264,
			  264,  264,  264,  264,  264,  264,  264,  264,  264,  264,
			  264,  264,  264,  264,  264,  264,  264,  264,  264,  264,
			  264,  264,  264,  264,  265,    0,  265,  265,  265,  265,
			  265,  265,  265,  265,  265,  265,  265,  265,  265,  265,

			  265,    0,  265,  265,  265,  265,  265,  265,  265,  265,
			  266,    0,  266,  266,  266,  266,  266,  266,  266,  266,
			  266,  266,  266,  266,  266,  266,  266,  266,  266,  266,
			  266,  266,  266,  266,  266,  266,  267,    0,    0,    0,
			    0,    0,    0,  267,  267,    0,  267,    0,  267,  267,
			  267,    0,  267,  267,  267,  267,  267,  267,  268,  268,
			    0,  268,  268,  268,  268,    0,    0,    0,  268,  268,
			  268,    0,  268,  268,  268,  268,  268,  268,  269,  269,
			  269,  269,  269,  269,  269,  269,  269,  269,  269,  269,
			  269,  269,  269,  269,  269,  269,  269,  269,  269,  269,

			  269,  269,  270,    0,  270,  270,  270,  270,  270,  270,
			  270,  270,  270,  270,  270,  270,  270,  270,  270,    0,
			  270,  270,  270,  270,  270,  270,  270,  270,  271,  271,
			  271,  271,  271,  271,  271,  271,  271,  271,  271,  271,
			  271,  271,  271,  271,  271,  271,  271,  271,  271,  271,
			  271,  271,    0,  271,  272,  272,  272,  272,  272,  272,
			  272,  272,  272,  272,  272,  272,  272,  272,  272,  272,
			  272,  272,  272,  272,  272,  272,  272,  272,  273,    0,
			  273,  273,  273,  273,  273,  273,  273,  273,  273,  273,
			  273,  273,  273,  273,  273,  273,  273,  273,  273,  273,

			  273,  273,  273,  273,  274,  274,  274,  274,  274,  274,
			  274,  274,  274,  274,  274,  274,  274,  274,  274,  274,
			  274,  274,  274,  274,  274,  274,  274,  274,  274,  274,
			  275,    0,    0,    0,  275,    0,    0,  275,  275,    0,
			  275,  275,  275,  275,  275,    0,  275,  275,  275,  275,
			  275,  275,  276,  276,    0,  276,  276,  276,  276,  276,
			    0,    0,  276,  276,  276,    0,  276,  276,  276,  276,
			  276,  276,  277,  277,    0,    0,  277,  277,  277,  277,
			  277,  277,  277,  277,    0,    0,  277,  277,  277,    0,
			  277,  277,  277,  277,  277,  277,  278,  278,  278,  278,

			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  279,  279,  279,  279,  279,  279,  279,  279,
			  279,  279,  279,  279,  279,  279,  279,  279,  279,  279,
			  279,  279,  279,  279,  279,  279,  279,  279,  280,  280,
			  280,  280,  280,  280,  280,  280,  280,  280,  280,  280,
			  280,  280,  280,  280,  280,  280,  280,  280,  280,  280,
			  280,  280,  280,  280,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,

			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262, yy_Dummy>>,
			1, 753, 1000)
		end

	yy_base_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   76,   81,   13,   18,  677, 1674,   87,
			  652, 1674,  647, 1674,   72, 1674, 1674, 1674, 1674, 1674,
			  638,  630, 1674,   75,   82, 1674, 1674,  619, 1674,  616,
			  613,   81,   94,  103,  156,  100,  132, 1674, 1674,  181,
			   56,   80,  126,   72,    0, 1674,  630, 1674, 1674,  120,
			  123,  108,  178,  132,  182,  565,    0, 1674,  108,  628,
			  583, 1674,  577,    0,  244,  579,  540,  151,  252,  267,
			  278, 1674, 1674, 1674,  111,  161,    0,  254,  278,  331,
			  297,  288,  516,  398,   68,  455,    0,  125,  305,  171,
			  301,  224,  306,  101,  315,    0,  527, 1674, 1674, 1674,

			  269,  305,  321,  472,  475,  435, 1674,    0, 1674, 1674,
			  472,  466,  471,  438,  373,  358,  189, 1674,  471,  510,
			  322,  369,  476,  311,  499,  500,  253,  532,  550,  559,
			  597,  533,  309,  271,  220,  281,  575,  587,  607,  332,
			  579,  232,  508,  245,  556,  526,  155,  575,  578,  597,
			  607,  623, 1674, 1674,  645, 1674, 1674, 1674, 1674,  669,
			  683,  654,  234,  681,  687,  689,  698,  709,  733,  742,
			  753,  203,  359,  777, 1674,  855,  919,  273,  603,  295,
			  694,    0,  318,  924,  929,  242,  937,  720,  360,  947,
			  943,  955,  977,  181,  160,  144,  138, 1674,    0,  522,

			  501,  950,  998, 1003,  481, 1674,  635, 1674, 1674, 1674,
			 1674, 1674,  332,  925,  135, 1008, 1021,  987,  676,  926,
			  704, 1026,  987,  536,    0,  585, 1031, 1038, 1043, 1048,
			 1674,  107, 1053, 1063,   99, 1068, 1073, 1078, 1088, 1086,
			 1094, 1674, 1098, 1103, 1108, 1118, 1117, 1124, 1129, 1674,
			 1133, 1138, 1147, 1157, 1156, 1161, 1166, 1674, 1171, 1186,
			 1176, 1191, 1674, 1231, 1257, 1283, 1309, 1333, 1353, 1377,
			 1401, 1427, 1453, 1477, 1503, 1527, 1547, 1571, 1595, 1621,
			 1647, yy_Dummy>>)
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
			  262,  262,  262,  262,  262,  267,  275,  267,  267,  267,
			  267,  267,  276,  262,   83,   39,  277,   39,   39,   85,
			   39,   85,   39,   85,   39,  269,  270,  262,  262,  262,

			  270,  270,  270,  270,  270,  271,  262,  272,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  275,  267,  267,  267,  267,  267,  267,
			  267,  267,  262,  278,   83,  278,   83,  262,   85,   85,
			   39,   85,   39,   85,   39,  270,  270,  270,  270,  270,
			  270,  270,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  275,  267,  267,   79,  165,  165,  262,  267,
			  267,  267,  267,  262,  262,  262,   83,   85,   39,   85,
			   39,   85,   39,  262,  262,  262,  262,  262,  267,  267,
			  262,  130,  130,  279,  173,  280,  175,  262,   85,   39,

			   85,   39,  262,  262,  262,  262,  267,  262,  262,  262,
			  262,  262,   85,   39,  262,  262,  262,  267,   85,   39,
			  262,  262,  262,  267,   85,   39,  262,  262,  262,  262,
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
			   54,   25,   24,   18,    0,   48,    0,   48,   48,   48,
			   46,   48,    0,    0,    0,   50,   33,   50,   50,   50,
			   50,   50,   50,   50,   50,   51,   63,   65,   61,   60,

			   62,   63,   63,   63,   63,    0,   53,   52,   73,   67,
			   73,   73,   73,   73,   73,   73,    4,   29,   56,   54,
			    0,    0,   55,    0,   48,   48,   47,   47,   47,   47,
			   48,   48,    0,    0,    0,    0,    0,   38,   38,   50,
			   50,   50,   50,   50,   50,   63,   63,   63,   63,   63,
			   63,   63,   71,   74,   74,   72,   68,   69,   70,    0,
			   54,    0,   49,   48,   48,   48,   48,   48,    0,   46,
			   46,   46,   30,    0,   37,    0,    0,   50,   50,   50,
			   50,   30,   30,    0,   57,    0,   54,   43,   31,   48,
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

	yyJam_base: INTEGER = 1674
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
