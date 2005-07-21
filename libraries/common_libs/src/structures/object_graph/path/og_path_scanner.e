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
			yy_nxt ?= yy_nxt_template
			yy_chk ?= yy_chk_template
			yy_base ?= yy_base_template
			yy_def ?= yy_def_template
			yy_ec ?= yy_ec_template
			yy_meta ?= yy_meta_template
			yy_accept ?= yy_accept_template
		end

	yy_execute_action (yy_act: INTEGER) is
			-- Execute semantic action.
		do
if yy_act <= 10 then
if yy_act <= 5 then
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
last_token := SYM_MOVABLE_LEADER
end
end
else
if yy_act <= 8 then
if yy_act <= 7 then
if yy_act = 6 then
--|#line 62 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 62")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 68 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 68")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
end
else
--|#line 73 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 73")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
end
else
if yy_act = 9 then
--|#line 79 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 79")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 83 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 83")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
end
end
end
else
if yy_act <= 15 then
if yy_act <= 13 then
if yy_act <= 12 then
if yy_act = 11 then
--|#line 89 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 89")
end
in_buffer.append_character ('\')
else
--|#line 90 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 90")
end
in_buffer.append_character ('"')
end
else
--|#line 91 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 91")
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
			
end
else
if yy_act = 14 then
--|#line 105 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 105")
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
			
else
--|#line 119 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 119")
end
in_buffer.append_string (text)
end
end
else
if yy_act <= 18 then
if yy_act <= 17 then
if yy_act = 16 then
--|#line 120 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 120")
end
in_lineno := in_lineno + 1	-- match LF in line
else
--|#line 121 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 121")
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
--|#line 132 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 132")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
else
if yy_act = 19 then
--|#line 141 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 141")
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

	yy_nxt_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    6,    6,    7,    8,    6,    6,    6,    9,   10,
			    6,    6,   11,   11,   12,    6,   13,    6,   14,   14,
			   14,   16,   17,   31,   18,   27,   31,   32,   27,   42,
			   27,   42,   27,   19,   16,   17,   28,   18,   33,   28,
			   27,   27,   27,   27,   24,   24,   19,   27,   29,   41,
			   21,   28,   28,   28,   28,   30,   30,   35,   28,   22,
			   21,   30,   30,   30,   24,   24,   23,   23,   42,   23,
			   42,   42,   42,   34,   24,   26,   25,   25,   42,   25,
			   30,   36,   42,   42,   42,   42,   42,   30,   27,   42,
			   42,   42,   42,   42,   37,   42,   37,   42,   42,   28,

			   42,   37,   37,   38,   42,   38,   42,   42,   42,   42,
			   38,   38,   39,   42,   39,   42,   42,   42,   42,   39,
			   39,   40,   42,   40,   42,   42,   42,   42,   40,   40,
			   15,   15,   15,   15,   15,   15,   20,   42,   20,   20,
			   42,   20,   26,   42,   26,   26,   26,   26,   28,   28,
			   28,   28,   28,   28,    5,   42,   42,   42,   42,   42,
			   42,   42,   42,   42,   42,   42,   42,   42,   42,   42,
			   42,   42,   42,   42,   42>>)
		end

	yy_chk_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    3,    3,   31,    3,   15,   19,   19,   26,   28,
			   28,   33,   33,    3,    4,    4,   15,    4,   19,   26,
			   36,   29,   40,   41,   46,   46,    4,   18,   18,   40,
			   20,   36,   29,   40,   41,   18,   18,   29,   18,   10,
			    8,   18,   18,   18,   24,   24,   45,   45,    5,   45,
			    0,    0,    0,   24,   24,   30,   47,   47,    0,   47,
			   30,   30,    0,    0,    0,    0,    0,   30,   35,    0,
			    0,    0,    0,    0,   35,    0,   35,    0,    0,   35,

			    0,   35,   35,   37,    0,   37,    0,    0,    0,    0,
			   37,   37,   38,    0,   38,    0,    0,    0,    0,   38,
			   38,   39,    0,   39,    0,    0,    0,    0,   39,   39,
			   43,   43,   43,   43,   43,   43,   44,    0,   44,   44,
			    0,   44,   48,    0,   48,   48,   48,   48,   49,   49,
			   49,   49,   49,   49,   42,   42,   42,   42,   42,   42,
			   42,   42,   42,   42,   42,   42,   42,   42,   42,   42,
			   42,   42,   42,   42,   42>>)
		end

	yy_base_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   18,   31,   68,  154,  154,   56,  154,
			   50,    0,    0,  154,    0,   21,  154,  154,   43,   23,
			   46,  154,  154,    0,   57,    0,   24,  154,   26,   37,
			   70,   21,  154,   28,  154,   84,   36,   93,  102,  111,
			   38,   39,  154,  129,  135,   63,   41,   73,  141,  147>>)
		end

	yy_def_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,   42,    1,   43,   43,   42,   42,   42,   44,   42,
			   42,   45,   46,   42,   47,   48,   42,   42,   48,   49,
			   44,   42,   42,   45,   46,   47,   48,   42,   49,   48,
			   18,   42,   42,   49,   42,   48,   48,   35,   37,   38,
			   48,   48,    0,   42,   42,   42,   42,   42,   42,   42>>)
		end

	yy_ec_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    2,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    1,    4,    5,    1,    1,    6,    1,
			    1,    1,    1,    1,    1,    7,    8,    9,   10,   10,
			   10,   10,   10,   10,   10,   10,   10,   10,    1,   11,
			    1,    1,    1,    1,    1,   12,   12,   12,   12,   12,
			   12,   13,   13,   13,   13,   13,   13,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
			   13,   14,   15,   16,    1,   17,    1,   18,   18,   18,

			   18,   18,   18,   19,   19,   19,   19,   19,   19,   19,
			   19,   19,   19,   19,   19,   19,   19,   19,   19,   19,
			   20,   19,   19,    1,    1,    1,    1,    1,    1,    1,
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
			    1,    1,    1,    1,    1,    1,    1>>)
		end

	yy_meta_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    2,    1,    1,    1,    1,    1,    1,
			    3,    1,    3,    4,    1,    5,    1,    6,    3,    3,
			    3>>)
		end

	yy_accept_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,   21,   19,   20,   10,    1,
			    2,    7,    3,    4,    8,   15,   18,   17,   15,   18,
			   10,    9,    5,    7,    0,    8,   15,   17,    0,   15,
			   15,   16,   12,   11,    6,   15,   13,   15,   15,   15,
			   15,   14,    0>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 154
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 42
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 43
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
