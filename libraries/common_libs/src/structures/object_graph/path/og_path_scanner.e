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
if yy_act <= 10 then
if yy_act <= 5 then
if yy_act <= 3 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 63 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 63")
end
last_token := Dot_code
else
--|#line 64 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 64")
end
last_token := Slash_code
end
else
--|#line 66 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 66")
end
last_token := Left_bracket_code
end
else
if yy_act = 4 then
--|#line 67 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 67")
end
last_token := Right_bracket_code
else
--|#line 69 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 69")
end
last_token := Left_parenthesis_code
end
end
else
if yy_act <= 8 then
if yy_act <= 7 then
if yy_act = 6 then
--|#line 70 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 70")
end
last_token := Right_parenthesis_code
else
--|#line 72 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 72")
end
last_token := SYM_MOVABLE_LEADER
end
else
--|#line 75 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 75")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 9 then
--|#line 81 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 81")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
else
--|#line 87 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 87")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
end
end
end
else
if yy_act <= 15 then
if yy_act <= 13 then
if yy_act <= 12 then
if yy_act = 11 then
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
--|#line 100 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 100")
end
in_buffer.append_character ('\')
end
else
--|#line 102 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 102")
end
in_buffer.append_character ('"')
end
else
if yy_act = 14 then
--|#line 104 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 104")
end

				in_buffer.append_string (text)
	
else
--|#line 108 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 108")
end
in_buffer.append_string (text)
end
end
else
if yy_act <= 18 then
if yy_act <= 17 then
if yy_act = 16 then
--|#line 110 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 110")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
else
--|#line 115 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 115")
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
--|#line 126 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 126")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
else
if yy_act = 19 then
--|#line 136 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 136")
end
;
else
--|#line 0 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 0")
end
default_action
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
			    0,   48,   48,    7,    8,    9,   10,   28,   11,   12,
			   25,   13,   25,   14,   32,   15,    7,    8,    9,   10,
			   28,   11,   12,   31,   13,   28,   14,   29,   15,   17,
			   18,   29,   29,   33,    6,    6,    6,   36,   19,   31,
			   31,   34,   31,   40,   31,   20,   21,   22,   23,   24,
			   17,   18,   38,   38,   36,   26,   29,   38,   38,   19,
			   29,   29,   16,   16,   16,   32,   20,   21,   22,   23,
			   24,   31,   30,   31,   30,   27,   26,   48,   48,   48,
			   48,   48,   48,   35,   35,   35,   31,   48,   48,   48,
			   48,   48,   48,   48,   48,   48,   48,   48,   37,   37,

			   37,   31,   48,   48,   48,   48,   48,   48,   48,   48,
			   48,   48,   48,   39,   39,   39,   31,   48,   48,   48,
			   48,   48,   48,   48,   48,   48,   48,   48,   48,   48,
			   48,   41,   42,   43,   44,   45,   31,   48,   48,   48,
			   48,   48,   48,   48,   48,   48,   48,   48,   35,   35,
			   35,   31,   48,   48,   48,   48,   48,   48,   48,   48,
			   48,   48,   48,   35,   35,   35,   31,   48,   48,   48,
			   48,   48,   48,   48,   48,   48,   48,   48,   46,   46,
			   46,   31,   48,   48,   48,   48,   48,   48,   48,   48,
			   48,   48,   48,   47,   47,   47,   31,   48,   48,   48,

			   48,   48,   48,   48,   48,   48,   48,   48,   35,   35,
			   35,   31,   48,   48,   48,   48,   48,   48,   48,   48,
			   48,   48,   48,   37,   37,   37,   31,   48,   48,   48,
			   48,   48,   48,   48,   48,   48,   48,   48,   39,   39,
			   39,   31,   48,   48,   48,   48,   48,   48,   48,   48,
			   48,   48,   48,   35,   35,   35,   31,   48,   48,   48,
			   48,   48,   48,   48,   48,   48,   48,   48,   35,   35,
			   35,    5,   48,   48,   48,   48,   48,   48,   48,   48,
			   48,   48,   48,   48,   48,   48,   48,   48,   48,   48,
			   48,   48,   48,   48,   48, yy_Dummy>>)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    1,    1,    1,    1,   53,    1,    1,
			   51,    1,   51,    1,   32,    1,    2,    2,    2,    2,
			   13,    2,    2,   21,    2,   13,    2,   15,    2,    3,
			    3,   15,   15,   19,   49,   49,   49,   21,    3,   23,
			   42,   19,   30,   28,   44,    3,    3,    3,    3,    3,
			    4,    4,   23,   23,   42,   25,   29,   44,   44,    4,
			   29,   29,   50,   50,   50,   17,    4,    4,    4,    4,
			    4,   20,   52,   16,   52,   12,    8,    5,    0,    0,
			    0,    0,    0,   20,   20,   20,   22,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,   22,   22,

			   22,   24,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   24,   24,   24,   35,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,   35,   35,   35,   35,   35,   36,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,   36,   36,
			   36,   37,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   37,   37,   37,   38,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,   38,   38,
			   38,   39,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   39,   39,   39,   41,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,   41,   41,
			   41,   43,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   43,   43,   43,   45,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,   45,   45,
			   45,   46,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   46,   46,   46,   47,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,   47,   47,
			   47,   48,   48,   48,   48,   48,   48,   48,   48,   48,
			   48,   48,   48,   48,   48,   48,   48,   48,   48,   48,
			   48,   48,   48,   48,   48, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,   13,   26,   47,   77,  271,  271,   72,  271,
			  271,  271,   66,   10,  271,   17,   69,   63,  271,   29,
			   67,   19,   82,   35,   97,   51,  271,  271,   30,   46,
			   38,  271,   12,  271,  271,  112,  132,  147,  162,  177,
			  271,  192,   36,  207,   40,  222,  237,  252,  271,   33,
			   61,    9,   71,    4, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,   49,   49,   50,   50,   48,   48,   48,   51,   48,
			   48,   48,   48,   48,   48,   48,   52,   48,   48,   48,
			   52,   52,   52,   52,   52,   51,   48,   48,   53,   48,
			   52,   48,   48,   48,   48,   52,   52,   52,   52,   52,
			   48,   52,   52,   52,   52,   52,   52,   52,    0,   48,
			   48,   48,   48,   48, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    2,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    1,    4,    1,    1,    1,    1,    1,
			    5,    6,    1,    1,    1,    7,    8,    9,   10,   10,
			   10,   10,   10,   10,   10,   10,   10,   10,    1,    1,
			    1,    1,    1,    1,    1,   10,   10,   10,   10,   10,
			   10,   10,   10,   10,   10,   10,   10,   10,   10,   10,
			   10,   10,   10,   10,   10,   10,   10,   10,   10,   10,
			   10,   11,   12,   13,    1,   14,    1,   15,   15,   15,

			   15,   15,   15,   15,   15,   15,   15,   15,   15,   15,
			   15,   15,   15,   15,   15,   15,   15,   15,   15,   15,
			   15,   15,   15,    1,    1,    1,    1,    1,   16,   16,
			   16,   16,   16,   16,   16,   16,   16,   16,   16,   16,
			   16,   16,   16,   16,   17,   17,   17,   17,   17,   17,
			   17,   17,   17,   17,   17,   17,   17,   17,   17,   17,
			   18,   18,   18,   18,   18,   18,   18,   18,   18,   18,
			   18,   18,   18,   18,   18,   18,   18,   18,   18,   18,
			   18,   18,   18,   18,   18,   18,   18,   18,   18,   18,
			   18,   18,    1,    1,   19,   19,   19,   19,   19,   19,

			   19,   19,   19,   19,   19,   19,   19,   19,   19,   19,
			   19,   19,   19,   19,   19,   19,   19,   19,   19,   19,
			   19,   19,   19,   19,   20,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   22,   23,   23,   23,   23,   23,   23,   23,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_meta_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    2,    1,    1,    1,    3,    3,    1,
			    3,    1,    2,    3,    3,    3,    1,    1,    1,    1,
			    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,   21,   19,   20,   11,    5,
			    6,    1,    2,    3,    4,    9,   15,   16,   17,   18,
			   15,   15,   15,   15,   15,   11,   10,    7,    0,    9,
			   15,   17,   16,   13,   12,   14,   15,   15,   15,   15,
			    8,   15,   15,   15,   15,   15,   15,   15,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 271
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 48
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 49
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

	yyNb_rules: INTEGER is 20
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 21
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
