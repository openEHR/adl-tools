indexing
	component:   "openEHR Archetype Project"
	description: "Scanner for Object Graph PathS"
	keywords:    "OG_PATH scanner"
	author:      "Thomas Beale <thomas@deepthought.com.au>"
	support:     "Deep Thought Informatics <support@deepthought.com.au>"
	copyright:   "Copyright (c) 2003, 2004 Deep Thought Informatics Pty Ltd"
	license:     "The Eiffel Forum Open Source License version 1"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class OG_PATH_SCANNER

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton,
			output as print_out
		end

	OG_PATH_TOKENS
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
			Result := (INITIAL <= sc and sc <= IN_STR)
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
if yy_act <= 12 then
if yy_act <= 6 then
if yy_act <= 3 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 53 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 53")
end
last_token := Dot_code
else
--|#line 54 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 54")
end
last_token := Slash_code
end
else
--|#line 56 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 56")
end
last_token := Left_bracket_code
end
else
if yy_act <= 5 then
if yy_act = 4 then
--|#line 57 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 57")
end
last_token := Right_bracket_code
else
--|#line 59 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 59")
end
last_token := Left_parenthesis_code
end
else
--|#line 60 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 60")
end
last_token := Right_parenthesis_code
end
end
else
if yy_act <= 9 then
if yy_act <= 8 then
if yy_act = 7 then
--|#line 62 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 62")
end
last_token := SYM_MOVABLE_LEADER
else
--|#line 65 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 65")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
else
--|#line 71 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 71")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
end
else
if yy_act <= 11 then
if yy_act = 10 then
--|#line 76 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 76")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
else
--|#line 82 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 82")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
end
else
--|#line 88 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 88")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
end
end
end
else
if yy_act <= 18 then
if yy_act <= 15 then
if yy_act <= 14 then
if yy_act = 13 then
--|#line 92 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 92")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
else
--|#line 98 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 98")
end
in_buffer.append_character ('\')
end
else
--|#line 99 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 99")
end
in_buffer.append_character ('"')
end
else
if yy_act <= 17 then
if yy_act = 16 then
--|#line 100 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 100")
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
			
else
--|#line 114 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 114")
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
			
end
else
--|#line 128 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 128")
end
in_buffer.append_string (text)
end
end
else
if yy_act <= 21 then
if yy_act <= 20 then
if yy_act = 19 then
--|#line 129 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 129")
end
in_lineno := in_lineno + 1	-- match LF in line
else
--|#line 130 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 130")
end
						-- match final end of string
				last_token := V_STRING
				if text_count > 1 then
					in_buffer.append_string (text_substring (1, text_count - 1))
				end
				str_ := STRING_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_any_value := str_
				set_start_condition (INITIAL)
			
end
else
--|#line 141 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 141")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
else
if yy_act = 22 then
--|#line 150 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 150")
end
;
else
--|#line 0 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 0")
end
last_token := yyError_token
fatal_error ("scanner jammed")
end
end
end
end
		end

	yy_execute_eof_action (yy_sc: INTEGER) is
			-- Execute EOF semantic action.
		do
			inspect yy_sc
when 0 then
--|#line 0 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 0")
end
terminate
when 1 then
--|#line 0 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 0")
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
			    0,    6,    6,    7,    6,    8,    6,    6,    9,   10,
			    6,   11,   12,    6,    6,   13,   13,   14,    6,   15,
			    6,   16,   16,   16,   18,   27,   19,   27,   20,   27,
			   31,   28,   35,   28,   36,   28,   31,   26,   26,   21,
			   18,   31,   19,   32,   20,   31,   47,   37,   31,   32,
			   35,   47,   35,   31,   32,   21,   31,   33,   32,   40,
			   25,   25,   39,   25,   23,   31,   34,   34,   31,   32,
			   24,   23,   34,   34,   34,   26,   26,   46,   32,   47,
			   47,   32,   47,   47,   38,   26,   30,   47,   47,   47,
			   47,   47,   47,   34,   41,   47,   47,   47,   47,   47,

			   34,   31,   47,   47,   47,   47,   47,   47,   47,   42,
			   47,   42,   47,   47,   32,   47,   42,   42,   43,   47,
			   43,   47,   47,   47,   47,   43,   43,   44,   47,   44,
			   47,   47,   47,   47,   44,   44,   45,   47,   45,   47,
			   47,   47,   47,   45,   45,   17,   17,   17,   17,   17,
			   17,   17,   17,   22,   22,   47,   22,   22,   22,   47,
			   22,   29,   47,   29,   29,   29,   47,   29,   30,   30,
			   47,   30,   30,   30,   30,   30,   32,   32,   32,   32,
			   32,   32,   32,   32,    5,   47,   47,   47,   47,   47,
			   47,   47,   47,   47,   47,   47,   47,   47,   47,   47,

			   47,   47,   47,   47,   47,   47,   47,   47, yy_Dummy>>)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    3,   16,    3,   27,    3,   29,
			   17,   16,   21,   27,   21,   29,   30,   51,   51,    3,
			    4,   33,    4,   17,    4,   41,   32,   21,   32,   30,
			   35,   37,   35,   37,   33,    4,   20,   20,   41,   33,
			   50,   50,   28,   50,   22,   46,   20,   20,   45,   20,
			   12,    8,   20,   20,   20,   26,   26,   45,   46,    5,
			    0,   45,    0,    0,   26,   26,   34,    0,    0,    0,
			    0,    0,    0,   34,   34,    0,    0,    0,    0,    0,

			   34,   40,    0,    0,    0,    0,    0,    0,    0,   40,
			    0,   40,    0,    0,   40,    0,   40,   40,   42,    0,
			   42,    0,    0,    0,    0,   42,   42,   43,    0,   43,
			    0,    0,    0,    0,   43,   43,   44,    0,   44,    0,
			    0,    0,    0,   44,   44,   48,   48,   48,   48,   48,
			   48,   48,   48,   49,   49,    0,   49,   49,   49,    0,
			   49,   52,    0,   52,   52,   52,    0,   52,   53,   53,
			    0,   53,   53,   53,   53,   53,   54,   54,   54,   54,
			   54,   54,   54,   54,   47,   47,   47,   47,   47,   47,
			   47,   47,   47,   47,   47,   47,   47,   47,   47,   47,

			   47,   47,   47,   47,   47,   47,   47,   47, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   21,   37,   79,  184,  184,   66,  184,
			  184,  184,   58,    0,    0,  184,   23,   25,  184,  184,
			   51,   29,   59,  184,  184,    0,   65,   25,   53,   27,
			   31,  184,   43,   36,   80,   48,  184,   48,  184,  184,
			   96,   40,  105,  114,  123,   63,   60,  184,  144,  152,
			   55,   32,  159,  167,  175, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,   47,    1,   48,   48,   47,   47,   47,   49,   47,
			   47,   47,   47,   50,   51,   47,   52,   53,   47,   47,
			   53,   54,   49,   47,   47,   50,   51,   47,   47,   52,
			   53,   47,   54,   53,   20,   47,   47,   54,   47,   47,
			   53,   53,   40,   40,   40,   53,   53,    0,   47,   47,
			   47,   47,   47,   47,   47, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    1,    5,    6,    1,    1,    7,    1,
			    8,    9,    1,    1,    1,   10,   11,   12,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   13,    1,   14,
			    1,    1,    1,    1,    1,   15,   15,   15,   15,   15,
			   15,   16,   16,   16,   16,   16,   16,   16,   16,   16,
			   16,   16,   16,   16,   16,   16,   16,   16,   16,   16,
			   16,   17,   18,   19,    1,   20,    1,   21,   21,   21,

			   21,   21,   21,   22,   22,   22,   22,   22,   22,   22,
			   22,   22,   22,   22,   22,   22,   22,   22,   22,   22,
			   23,   22,   22,    1,    1,    1,    1,    1,    1,    1,
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
			    0,    1,    2,    3,    1,    1,    1,    1,    4,    1,
			    1,    1,    1,    5,    1,    5,    6,    1,    7,    1,
			    8,    5,    5,    5, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,   24,   22,   23,   13,    5,
			    6,    1,    2,    9,    3,    4,   11,   18,   21,   20,
			   18,   21,   13,   12,    7,    9,    0,    0,    0,   11,
			   18,   20,    0,   18,   18,   19,   15,   14,    8,   10,
			   18,   16,   18,   18,   18,   18,   17,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 184
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 47
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 48
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

	yyNb_rules: INTEGER is 23
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 24
			-- End of buffer rule code

	yyLine_used: BOOLEAN is false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN is false
			-- Is `position' used?

	INITIAL: INTEGER is 0
	IN_STR: INTEGER is 1
			-- Start condition codes

feature -- User-defined features



feature {NONE} -- Local variables

	i_, nb_: INTEGER
	char_: CHARACTER
	str_: STRING
	code_: INTEGER

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
