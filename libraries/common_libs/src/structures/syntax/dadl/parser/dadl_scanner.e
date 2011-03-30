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
			create an_array.make (0, 1644)
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
			   39,   40,   41,   41,   41,   41,   42,   41,   43,   41,
			   41,   41,   41,   41,   44,   41,   41,   41,   45,   46,
			    8,    8,    8,    8,    8,    8,    8,    8,    8,   48,
			   64,   57,   49,   58,   48,   76,   57,   49,   58,   59,
			   68,   59,   69,   69,   69,   69,   69,   68,   78,   71,

			   71,   71,   71,   71,   76,   76,   70,   97,   77,   59,
			  234,   59,   97,   70,   79,   79,   79,   79,   79,   65,
			   81,   76,   78,   50,   89,   87,   98,   97,   50,   76,
			   70,   77,   97,   76,   82,   82,   87,   70,   80,   82,
			   82,  139,  141,   81,  124,   91,   80,   90,   93,   87,
			   51,   52,   53,   54,   55,   51,   52,   53,   54,   55,
			   87,   87,   87,   97,   76,  139,  141,   99,  124,   92,
			  175,   94,   87,   87,  101,   82,   84,   86,  103,  103,
			  118,  118,  118,  118,  118,   68,   97,  119,  119,  119,
			  119,  119,  100,  100,  100,   76,  174,  102,  102,  102,

			  116,   70,  116,  125,  236,  236,   87,   87,   88,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   88,
			   87,   87,   87,  110,  143,   70,  136,  125,  104,  104,
			  104,   76,  111,  111,  111,  111,  111,  136,   68,  220,
			  119,  119,  119,  119,  119,  120,  211,  143,  210,  131,
			  121,  177,  121,  101,   70,  122,  122,  122,  122,  122,
			   87,   97,  112,  130,  130,  130,  130,  130,  139,   76,
			   76,   87,  131,  218,  177,  209,  113,  114,   70,  115,
			   79,   79,   79,   79,   79,  163,   87,   76,  141,  208,
			   76,  143,  140,  126,   76,  179,  218,   87,  177,  127,

			  164,  172,   87,   76,   87,   87,  128,  129,  163,   87,
			  202,   87,  142,   87,  144,   87,   87,  126,   76,  179,
			   87,  178,   87,  127,  164,  172,  100,  100,  100,  128,
			  129,  133,  133,  133,  133,  133,  133,  133,  133,  134,
			  134,  133,  133,  133,  134,  134,  133,  134,  134,  134,
			  134,  134,  135,  133,  133,  133,  133,  133,  134,  134,
			  134,  134,  134,  134,  134,  134,  134,  134,  134,  134,
			  134,  134,  134,  134,  134,  134,  133,  133,   97,  133,
			  134,  134,  134,  134,  134,  134,  134,  134,  134,  134,
			  134,  134,  134,  134,  134,  134,  134,  134,  133,  133,

			  133,  133,  133,  133,  133,  133,  133,  133,  133,  137,
			   97,  138,  138,  138,  138,  138,  181,   76,   97,  162,
			  174,   97,  153,  154,  154,  154,  154,  154,  118,  118,
			  118,  118,  118,   68,   76,  160,  160,  160,  160,  160,
			  181,  188,  159,  100,  100,  100,  174,   87,  198,   70,
			  161,  161,  161,  161,  216,  216,  216,  216,   87,  122,
			  122,  122,  122,  122,  173,  188,  159,  122,  122,  122,
			  122,  122,  198,   70,  226,  226,  226,  162,  145,  146,
			  147,  148,  149,  150,  150,  150,  151,  151,  151,  165,
			  165,  165,  165,  165,   97,  158,   76,  166,  166,  166,

			  166,  166,  157,  156,   76,  167,  167,  167,  167,  167,
			  224,  155,   76,   80,  176,  152,  176,  176,  176,  176,
			  176,   80,  137,   97,  137,  137,  137,  137,  137,   80,
			  168,   97,  168,  224,  130,  130,  130,  130,  130,  179,
			  137,   76,  138,  138,  138,  138,  138,  174,  181,   97,
			  169,  200,   97,  170,  212,   97,  106,  171,   87,  100,
			  100,  100,   87,  180,  187,  187,  187,  187,  187,   87,
			   87,   97,  182,   87,  169,  200,  132,  170,  212,   76,
			  171,   87,  153,  154,  154,  154,  154,  154,  102,  102,
			  102,   76,  117,  116,  183,  109,  183,  103,  103,  184,

			  184,  184,  184,  184,  189,   62,  185,   68,   60,  186,
			  186,  186,  186,  186,  104,  104,  104,  100,  100,  100,
			  100,  100,  100,   70,  228,  229,  228,  229,  189,  165,
			  165,  165,  165,  165,  166,  166,  166,  166,  166,  167,
			  167,  167,  167,  167,  106,  198,   97,   70,   75,  190,
			  190,  190,  190,  190,   76,   74,   75,  230,  127,   73,
			   75,  191,  191,  191,  191,  191,   72,   87,   76,  199,
			   67,   66,   75,  192,  192,  192,  192,  192,   87,   75,
			   76,   62,  127,   75,  193,  193,  193,  193,  193,  193,
			  193,  193,  193,  193,  193,  193,  193,  194,  194,  193,

			  194,  194,  194,  194,  194,  193,  193,  193,  193,  193,
			  193,  194,  194,  194,  194,  194,  194,  194,  194,  194,
			  194,  194,  194,  194,  194,  194,  194,  194,  194,  193,
			  193,   60,  193,  194,  194,  194,  194,  194,  194,  194,
			  194,  194,  194,  194,  194,  194,  194,  194,  194,  194,
			  194,  193,  193,  193,  193,  193,  193,  193,  193,  193,
			  193,  193,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  196,  196,  195,  196,  196,
			  196,  196,  196,  195,  195,  195,  195,  195,  195,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,

			  196,  196,  196,  196,  196,  196,  196,  195,  195,  174,
			  195,  196,  196,  196,  196,  196,  196,  196,  196,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  176,  200,  176,  176,  176,  176,  176,  184,  184,  184,
			  184,  184,  184,  184,  184,  184,  184,   87,   68,  262,
			  186,  186,  186,  186,  186,  201,  262,  203,   87,  203,
			   76,  262,  262,  197,   70,  262,  262,  204,  262,  262,
			  206,   76,  190,  190,  190,  190,  190,  191,  191,  191,
			  191,  191,  192,  192,  192,  192,  192,  218,   70,  212,

			  205,  223,   76,   75,  206,  207,  262,  262,   75,   87,
			  262,   75,  214,  214,  214,  214,  214,  262,   87,  217,
			  219,  262,  262,  213,  223,  262,  262,   75,  207,   87,
			  262,  262,   75,  262,  262,   75,  215,  215,  215,  215,
			  215,  262,  217,  221,  221,  221,  221,  221,  222,  222,
			  222,  222,  222,  224,  227,  227,  227,  227,  227,  262,
			  262,  262,   87,  231,  231,  231,  231,  231,  205,  205,
			  205,  205,  205,   87,  262,  262,  225,  232,  232,  232,
			  232,  232,  233,  233,  233,  233,  233,  235,  235,  235,
			  235,  235,  228,  262,  228,  262,  262,  233,  233,  233, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  233,  233,  237,  237,  237,  237,  237,  238,  238,  238,
			  238,  238,  230,  230,  230,  230,  230,  239,  262,  239,
			  242,  242,  242,  242,  242,  230,  262,  240,  243,  243,
			  243,  243,  244,  244,  244,  244,  244,  245,  245,  245,
			  245,  245,  246,  246,  246,  246,  246,  247,  262,  247,
			  241,  241,  241,  241,  241,  241,  262,  248,  250,  250,
			  250,  250,  250,  251,  251,  251,  251,  252,  252,  252,
			  252,  252,  253,  253,  253,  253,  253,  262,  262,  262,
			  249,  254,  254,  254,  254,  254,  255,  256,  255,  256,
			  249,  249,  249,  249,  249,  258,  258,  258,  258,  258,

			  259,  259,  259,  259,  259,  260,  260,  260,  260,  260,
			  261,  261,  261,  261,  261,  255,  262,  255,  262,  257,
			  259,  259,  259,  259,  259,  257,  257,  257,  257,  257,
			   85,   85,  262,  262,  262,   85,   85,   85,  262,   85,
			   85,   85,   85,   85,   85,  262,  262,  262,  257,   47,
			   47,   47,   47,   47,   47,   47,   47,   47,   47,   47,
			   47,   47,   47,   47,   47,   47,   47,   47,   47,   47,
			   47,   47,   47,   47,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   61,

			  262,   61,   61,   61,   61,   61,   61,   61,   61,   61,
			   61,   61,   61,   61,   61,  262,   61,   61,   61,   61,
			   61,   61,   61,   61,   63,  262,   63,   63,   63,   63,
			   63,   63,   63,   63,   63,   63,   63,   63,   63,   63,
			   63,   63,   63,   63,   63,   63,   63,   63,   63,   75,
			   75,  262,   75,  262,   75,   75,   75,  262,   75,   75,
			   75,   75,   75,   75,   83,   83,  262,   83,   83,   83,
			   83,  262,  262,  262,   83,   83,   83,  262,   83,   83,
			   83,   83,   83,   83,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,

			   95,   95,   95,   95,   95,   95,   95,   96,  262,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,  262,   96,   96,   96,   96,   96,   96,
			   96,   96,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  262,  105,  107,  107,  107,
			  107,  107,  107,  107,  107,  107,  107,  107,  107,  107,
			  107,  107,  107,  107,  107,  107,  107,  107,  107,  107,
			  108,  262,  108,  108,  108,  108,  108,  108,  108,  108,
			  108,  108,  108,  108,  108,  108,  108,  108,  108,  108,

			  108,  108,  108,  108,  108,   66,   66,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,   66,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,   66,   66,   66,   66,
			  123,  262,  262,  123,  123,  262,  123,  123,  123,  123,
			  123,  262,  123,  123,  123,  123,  123,  123,   82,   82,
			  262,   82,   82,   82,   82,   82,  262,  262,   82,   82,
			   82,  262,   82,   82,   82,   82,   82,   82,   86,   86,
			  262,   86,   86,   86,   86,   86,   86,   86,   86,  262,
			  262,   86,   86,   86,  262,   86,   86,   86,   86,   86,
			   86,  133,  133,  133,  133,  133,  133,  133,  133,  133,

			  133,  133,  133,  133,  133,  133,  133,  133,  133,  133,
			  133,  133,  133,  133,  133,  133,  193,  193,  193,  193,
			  193,  193,  193,  193,  193,  193,  193,  193,  193,  193,
			  193,  193,  193,  193,  193,  193,  193,  193,  193,  193,
			  193,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,    7,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,

			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262, yy_Dummy>>,
			1, 645, 1000)
		end

	yy_chk_template: SPECIAL [INTEGER]
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 1644)
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

			   24,   24,   24,   24,   32,   35,   23,   52,   32,   59,
			  231,   59,   54,   24,   34,   34,   34,   34,   34,   14,
			   35,   34,   33,    3,   42,   41,   50,   51,    4,  126,
			   23,   32,   53,   77,   36,   36,   41,   24,   34,   36,
			   36,   89,   91,   35,   77,   43,  126,   42,   44,   42,
			    3,    3,    3,    3,    3,    4,    4,    4,    4,    4,
			   42,   43,   44,   55,  223,   89,   91,   50,   77,   43,
			  135,   44,   43,   44,   52,   36,   36,   40,   54,   54,
			   68,   68,   68,   68,   68,   71,  146,   71,   71,   71,
			   71,   71,   51,   51,   51,   78,  135,   53,   53,   53,

			  116,   71,  116,   78,  234,  234,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   65,   93,   71,   84,   78,   55,   55,
			   55,   81,   65,   65,   65,   65,   65,   84,   69,  214,
			   69,   69,   69,   69,   69,   69,  196,   93,  195,   81,
			   70,  139,   70,  146,   69,   70,   70,   70,   70,   70,
			   87,  101,   65,   80,   80,   80,   80,   80,   90,  124,
			   80,   87,   81,  212,  139,  194,   65,   65,   69,   65,
			   79,   79,   79,   79,   79,  124,   90,   79,   92,  193,
			  125,   94,   90,   79,  131,  141,  212,   90,  140,   79,

			  125,  131,   94,  188,  182,  199,   79,   79,  124,   92,
			  185,  140,   92,   94,   94,  182,  199,   79,  172,  141,
			   92,  140,  140,   79,  125,  131,  101,  101,  101,   79,
			   79,   83,   83,   83,   83,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,  102,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83,

			   83,   83,   83,   83,   83,   83,   83,   83,   83,   88,
			  100,   88,   88,   88,   88,   88,  143,  171,  103,  162,
			  134,  104,  111,  111,  111,  111,  111,  111,  118,  118,
			  118,  118,  118,  119,  163,  119,  119,  119,  119,  119,
			  143,  163,  118,  102,  102,  102,  133,   88,  177,  119,
			  120,  120,  120,  120,  204,  204,  204,  204,   88,  121,
			  121,  121,  121,  121,  132,  163,  118,  122,  122,  122,
			  122,  122,  177,  119,  220,  220,  220,  123,  100,  100,
			  100,  100,  100,  103,  103,  103,  104,  104,  104,  127,
			  127,  127,  127,  127,  145,  115,  127,  128,  128,  128,

			  128,  128,  114,  113,  128,  129,  129,  129,  129,  129,
			  218,  112,  129,  127,  136,  110,  136,  136,  136,  136,
			  136,  128,  137,  147,  137,  137,  137,  137,  137,  129,
			  130,  148,  130,  218,  130,  130,  130,  130,  130,  142,
			  138,  130,  138,  138,  138,  138,  138,  136,  144,  149,
			  130,  179,  150,  130,  200,  151,  105,  130,  142,  145,
			  145,  145,  225,  142,  161,  161,  161,  161,  161,  142,
			  144,   96,  144,  225,  130,  179,   82,  130,  200,   75,
			  130,  144,  154,  154,  154,  154,  154,  154,  147,  147,
			  147,  164,   67,   66,  159,   63,  159,  148,  148,  159,

			  159,  159,  159,  159,  164,   61,  160,  160,   60,  160,
			  160,  160,  160,  160,  149,  149,  149,  150,  150,  150,
			  151,  151,  151,  160,  222,  222,  222,  222,  164,  165,
			  165,  165,  165,  165,  166,  166,  166,  166,  166,  167,
			  167,  167,  167,  167,   56,  178,   47,  160,  165,  168,
			  168,  168,  168,  168,   31,   30,  165,  222,  167,   29,
			  166,  169,  169,  169,  169,  169,   27,  178,  169,  178,
			   21,   20,  165,  170,  170,  170,  170,  170,  178,  165,
			  170,   12,  167,  166,  173,  173,  173,  173,  173,  173,
			  173,  173,  173,  173,  173,  173,  173,  173,  173,  173,

			  173,  173,  173,  173,  173,  173,  173,  173,  173,  173,
			  173,  173,  173,  173,  173,  173,  173,  173,  173,  173,
			  173,  173,  173,  173,  173,  173,  173,  173,  173,  173,
			  173,   10,  173,  173,  173,  173,  173,  173,  173,  173,
			  173,  173,  173,  173,  173,  173,  173,  173,  173,  173,
			  173,  173,  173,  173,  173,  173,  173,  173,  173,  173,
			  173,  173,  175,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,  175,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,  175,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,  175,  175,  175,  175,  175,  175,  175,  175,

			  175,  175,  175,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,  175,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,  175,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,  175,  175,  175,  175,  175,  175,  175,  175,
			  176,  180,  176,  176,  176,  176,  176,  183,  183,  183,
			  183,  183,  184,  184,  184,  184,  184,  180,  186,    7,
			  186,  186,  186,  186,  186,  180,    0,  187,  180,  187,
			  189,    0,    0,  176,  186,    0,    0,  187,    0,    0,
			  189,  217,  190,  190,  190,  190,  190,  191,  191,  191,
			  191,  191,  192,  192,  192,  192,  192,  213,  186,  201,

			  187,  217,  206,  191,  189,  190,    0,    0,  192,  213,
			    0,  192,  202,  202,  202,  202,  202,    0,  201,  206,
			  213,    0,    0,  201,  217,    0,    0,  191,  190,  201,
			    0,    0,  192,    0,    0,  192,  203,  203,  203,  203,
			  203,    0,  206,  215,  215,  215,  215,  215,  216,  216,
			  216,  216,  216,  219,  221,  221,  221,  221,  221,    0,
			    0,    0,  219,  226,  226,  226,  226,  226,  227,  227,
			  227,  227,  227,  219,    0,    0,  219,  228,  228,  228,
			  228,  228,  229,  229,  229,  229,  229,  232,  232,  232,
			  232,  232,  233,    0,  233,    0,    0,  233,  233,  233, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  233,  233,  235,  235,  235,  235,  235,  236,  236,  236,
			  236,  236,  237,  237,  237,  237,  237,  238,    0,  238,
			  239,  239,  239,  239,  239,  233,    0,  238,  240,  240,
			  240,  240,  242,  242,  242,  242,  242,  243,  243,  243,
			  243,  243,  244,  244,  244,  244,  244,  245,    0,  245,
			  238,  246,  246,  246,  246,  246,    0,  245,  247,  247,
			  247,  247,  247,  248,  248,  248,  248,  250,  250,  250,
			  250,  250,  251,  251,  251,  251,  251,    0,    0,    0,
			  245,  252,  252,  252,  252,  252,  253,  253,  253,  253,
			  254,  254,  254,  254,  254,  255,  255,  255,  255,  255,

			  256,  256,  256,  256,  256,  258,  258,  258,  258,  258,
			  260,  260,  260,  260,  260,  259,    0,  259,    0,  253,
			  259,  259,  259,  259,  259,  261,  261,  261,  261,  261,
			  269,  269,    0,    0,    0,  269,  269,  269,    0,  269,
			  269,  269,  269,  269,  269,    0,    0,    0,  259,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  264,  264,  264,  264,  264,  264,
			  264,  264,  264,  264,  264,  264,  264,  264,  264,  264,
			  264,  264,  264,  264,  264,  264,  264,  264,  264,  265,

			    0,  265,  265,  265,  265,  265,  265,  265,  265,  265,
			  265,  265,  265,  265,  265,    0,  265,  265,  265,  265,
			  265,  265,  265,  265,  266,    0,  266,  266,  266,  266,
			  266,  266,  266,  266,  266,  266,  266,  266,  266,  266,
			  266,  266,  266,  266,  266,  266,  266,  266,  266,  267,
			  267,    0,  267,    0,  267,  267,  267,    0,  267,  267,
			  267,  267,  267,  267,  268,  268,    0,  268,  268,  268,
			  268,    0,    0,    0,  268,  268,  268,    0,  268,  268,
			  268,  268,  268,  268,  270,  270,  270,  270,  270,  270,
			  270,  270,  270,  270,  270,  270,  270,  270,  270,  270,

			  270,  270,  270,  270,  270,  270,  270,  271,    0,  271,
			  271,  271,  271,  271,  271,  271,  271,  271,  271,  271,
			  271,  271,  271,    0,  271,  271,  271,  271,  271,  271,
			  271,  271,  272,  272,  272,  272,  272,  272,  272,  272,
			  272,  272,  272,  272,  272,  272,  272,  272,  272,  272,
			  272,  272,  272,  272,  272,    0,  272,  273,  273,  273,
			  273,  273,  273,  273,  273,  273,  273,  273,  273,  273,
			  273,  273,  273,  273,  273,  273,  273,  273,  273,  273,
			  274,    0,  274,  274,  274,  274,  274,  274,  274,  274,
			  274,  274,  274,  274,  274,  274,  274,  274,  274,  274,

			  274,  274,  274,  274,  274,  275,  275,  275,  275,  275,
			  275,  275,  275,  275,  275,  275,  275,  275,  275,  275,
			  275,  275,  275,  275,  275,  275,  275,  275,  275,  275,
			  276,    0,    0,  276,  276,    0,  276,  276,  276,  276,
			  276,    0,  276,  276,  276,  276,  276,  276,  277,  277,
			    0,  277,  277,  277,  277,  277,    0,    0,  277,  277,
			  277,    0,  277,  277,  277,  277,  277,  277,  278,  278,
			    0,  278,  278,  278,  278,  278,  278,  278,  278,    0,
			    0,  278,  278,  278,    0,  278,  278,  278,  278,  278,
			  278,  279,  279,  279,  279,  279,  279,  279,  279,  279,

			  279,  279,  279,  279,  279,  279,  279,  279,  279,  279,
			  279,  279,  279,  279,  279,  279,  280,  280,  280,  280,
			  280,  280,  280,  280,  280,  280,  280,  280,  280,  280,
			  280,  280,  280,  280,  280,  280,  280,  280,  280,  280,
			  280,  281,  281,  281,  281,  281,  281,  281,  281,  281,
			  281,  281,  281,  281,  281,  281,  281,  281,  281,  281,
			  281,  281,  281,  281,  281,  281,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,

			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262, yy_Dummy>>,
			1, 645, 1000)
		end

	yy_base_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   76,   81,   13,   18,  859, 1566,   87,
			  728, 1566,  675, 1566,   72, 1566, 1566, 1566, 1566, 1566,
			  657,  655, 1566,   75,   82, 1566, 1566,  641, 1566,  634,
			  628,  630,   80,   61,   97,   81,  125, 1566, 1566,    0,
			  155,   72,   96,  108,  109,    0, 1566,  640, 1566, 1566,
			  120,  121,  101,  126,  106,  157,  574,    0, 1566,  107,
			  605,  599, 1566,  587,    0,  215,  590,  577,  163,  223,
			  238,  170, 1566, 1566, 1566,  555,    0,  109,  171,  263,
			  246,  207,  554,  330,  173,    0,    0,  207,  394,  106,
			  233,  110,  256,  182,  249,    0,  565, 1566, 1566, 1566,

			  404,  255,  372,  412,  415,  486, 1566,    0, 1566, 1566,
			  507,  406,  503,  495,  494,  487,  198, 1566,  411,  418,
			  433,  442,  450,  451,  245,  266,  105,  472,  480,  488,
			  517,  270,  442,  398,  372,  148,  499,  507,  525,  211,
			  258,  261,  505,  385,  517,  488,  180,  517,  525,  543,
			  546,  549, 1566, 1566,  566, 1566, 1566, 1566, 1566,  582,
			  592,  547,  393,  410,  567,  612,  617,  622,  632,  644,
			  656,  393,  294,  683, 1566,  761,  825,  417,  614,  514,
			  804,    0,  251,  830,  835,  293,  843,  855,  279,  846,
			  865,  870,  875,  241,  227,  200,  198, 1566,    0,  252,

			  520,  865,  895,  919,  437, 1566,  878, 1566, 1566, 1566,
			 1566, 1566,  232,  856,  225,  926,  931,  857,  466,  909,
			  457,  937,  612,  140,    0,  509,  946,  951,  960,  965,
			 1566,   69,  970,  980,  187,  985,  990,  995, 1005, 1003,
			 1011, 1566, 1015, 1020, 1025, 1035, 1034, 1041, 1046, 1566,
			 1050, 1055, 1064, 1074, 1073, 1078, 1083, 1566, 1088, 1103,
			 1093, 1108, 1566, 1148, 1173, 1198, 1223, 1240, 1260, 1121,
			 1283, 1306, 1331, 1356, 1379, 1404, 1424, 1444, 1467, 1490,
			 1515, 1540, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,  262,    1,  263,  263,  264,  264,  262,  262,  262,
			  262,  262,  265,  262,  266,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  267,  267,  267,  267,  267,  268,  262,  262,  269,
			  269,   40,   40,   40,   40,  270,  262,  271,  262,  262,
			  262,  271,  271,  271,  271,  271,  272,  273,  262,  262,
			  262,  265,  262,  274,  274,  274,  275,  262,  262,  262,
			  262,  262,  262,  262,  262,  267,  276,  267,  267,  267,
			  267,  267,  277,  262,   83,  269,  278,   40,   40,  269,
			   40,  269,   40,  269,   40,  270,  271,  262,  262,  262,

			  271,  271,  271,  271,  271,  272,  262,  273,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  276,  267,  267,  267,  267,  267,  267,
			  267,  267,  262,  279,   83,  279,   83,  262,  269,  269,
			   40,  269,   40,  269,   40,  271,  271,  271,  271,  271,
			  271,  271,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  276,  267,  267,   79,  165,  165,  262,  267,
			  267,  267,  267,  262,  262,  262,   83,  269,   40,  269,
			   40,  269,   40,  262,  262,  262,  262,  262,  267,  267,
			  262,  130,  130,  280,  173,  281,  175,  262,  269,   40,

			  269,   40,  262,  262,  262,  262,  267,  262,  262,  262,
			  262,  262,  269,   40,  262,  262,  262,  267,  269,   40,
			  262,  262,  262,  267,  269,   40,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,    0,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262, yy_Dummy>>)
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
			   50,   50,   50,   50,   50,   51,   20,   63,   64,   65,
			   66,   63,   63,   63,   63,   63,   76,   52,   53,    1,
			    2,   59,   58,   73,   73,   73,    3,   28,    0,   54,
			    0,   54,   25,   24,   18,   48,    0,   48,   48,   48,
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

	yyJam_base: INTEGER = 1566
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
