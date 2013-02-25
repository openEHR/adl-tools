note
	component:   "openEHR Archetype Project"
	description: "Scanner for Object Graph PathS"
	keywords:    "OG_PATH scanner"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

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

create
	make

feature -- Status report

	valid_start_condition (sc: INTEGER): BOOLEAN
			-- Is `sc' a valid start condition?
		do
			Result := (INITIAL <= sc and sc <= IN_STR)
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
if yy_act <= 11 then
if yy_act <= 6 then
if yy_act <= 3 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 57 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 57")
end
last_token := Dot_code
else
--|#line 58 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 58")
end
last_token := Slash_code
end
else
--|#line 60 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 60")
end
last_token := Left_bracket_code
end
else
if yy_act <= 5 then
if yy_act = 4 then
--|#line 61 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 61")
end
last_token := Right_bracket_code
else
--|#line 63 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 63")
end
last_token := Left_parenthesis_code
end
else
--|#line 64 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 64")
end
last_token := Right_parenthesis_code
end
end
else
if yy_act <= 9 then
if yy_act <= 8 then
if yy_act = 7 then
--|#line 66 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 66")
end
last_token := SYM_MOVABLE_LEADER
else
--|#line 69 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 69")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
else
--|#line 75 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 75")
end

					last_token := V_ANY_PREDICATE
					last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 10 then
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
if yy_act <= 16 then
if yy_act <= 14 then
if yy_act <= 13 then
if yy_act = 12 then
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
if yy_act = 15 then
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
if yy_act <= 19 then
if yy_act <= 18 then
if yy_act = 17 then
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

				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_
				set_start_condition (INITIAL)
			
end
else
--|#line 128 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 128")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
else
if yy_act = 20 then
--|#line 138 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 138")
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

	yy_execute_eof_action (yy_sc: INTEGER)
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

	yy_nxt_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,   28,   28,    7,    8,    9,   10,   33,   11,   12,
			   25,   13,   25,   14,   25,   15,    7,    8,    9,   10,
			   29,   11,   12,   32,   13,   29,   14,   30,   15,   17,
			   18,   30,   30,   34,   32,   41,   26,   37,   19,   32,
			   32,   35,   33,   32,   32,   20,   21,   22,   23,   24,
			   17,   18,   39,   39,   37,   27,   30,   39,   39,   19,
			   30,   30,   26,   50,   50,   50,   20,   21,   22,   23,
			   24,   32,   31,   50,   31,   50,   31,   50,   50,   50,
			   50,   50,   50,   36,   36,   36,   32,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   38,   38,

			   38,   32,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   40,   40,   40,   29,   29,   50,   29,
			   50,   50,   42,   29,   29,   32,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   43,   44,   45,   46,   47,   32,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   36,   36,   36,
			   32,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   36,   36,   36,   32,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   48,   48,   48,
			   32,   50,   50,   50,   50,   50,   50,   50,   50,   50,

			   50,   50,   49,   49,   49,   32,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   36,   36,   36,
			   32,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   38,   38,   38,   32,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   40,   40,   40,
			   32,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   36,   36,   36,   32,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   36,   36,   36,
			    6,    6,    6,    6,    6,   16,   16,   16,   16,   16,
			    5,   50,   50,   50,   50,   50,   50,   50,   50,   50,

			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50, yy_Dummy>>)
		end

	yy_chk_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,   54,   54,    1,    1,    1,    1,   33,    1,    1,
			   53,    1,   53,    1,   53,    1,    2,    2,    2,    2,
			   13,    2,    2,   21,    2,   13,    2,   15,    2,    3,
			    3,   15,   15,   19,   31,   28,   25,   21,    3,   23,
			   44,   19,   17,   16,   46,    3,    3,    3,    3,    3,
			    4,    4,   23,   23,   44,   12,   30,   46,   46,    4,
			   30,   30,    8,    5,    0,    0,    4,    4,    4,    4,
			    4,   20,   55,    0,   55,    0,   55,    0,    0,    0,
			    0,    0,    0,   20,   20,   20,   22,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,   22,   22,

			   22,   24,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   24,   24,   24,   29,   29,    0,   29,
			    0,    0,   29,   29,   29,   36,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			   36,   36,   36,   36,   36,   37,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,   37,   37,   37,
			   38,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,   38,   38,   38,   39,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,   39,   39,   39,
			   40,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,   40,   40,   40,   43,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,   43,   43,   43,
			   45,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,   45,   45,   45,   47,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,   47,   47,   47,
			   48,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,   48,   48,   48,   49,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,   49,   49,   49,
			   51,   51,   51,   51,   51,   52,   52,   52,   52,   52,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,

			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,   13,   26,   47,   63,  290,  290,   58,  290,
			  290,  290,   46,   10,  290,   17,   39,   40,  290,   29,
			   67,   19,   82,   35,   97,   32,  290,  290,   22,  109,
			   46,   30,  290,    5,  290,  290,  121,  141,  156,  171,
			  186,  290,  290,  201,   36,  216,   40,  231,  246,  261,
			  290,  279,  284,    9,    0,   71, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,   51,   51,   52,   52,   50,   50,   50,   53,   50,
			   50,   50,   50,   54,   50,   50,   55,   50,   50,   50,
			   55,   55,   55,   55,   55,   53,   50,   50,   54,   54,
			   50,   55,   50,   50,   50,   50,   55,   55,   55,   55,
			   55,   50,   50,   55,   55,   55,   55,   55,   55,   55,
			    0,   50,   50,   50,   50,   50, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER]
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

	yy_meta_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    2,    1,    1,    1,    1,    1,    1,
			    1,    3,    4,    5,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,   22,   20,   21,   12,    5,
			    6,    1,    2,    3,    4,   10,   16,   17,   18,   19,
			   16,   16,   16,   16,   16,   12,   11,    7,    0,    0,
			   10,   16,   18,   17,   14,   13,   15,   16,   16,   16,
			   16,    9,    8,   16,   16,   16,   16,   16,   16,   16,
			    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 290
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 50
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 51
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

	yyNb_rules: INTEGER = 21
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 22
			-- End of buffer rule code

	yyLine_used: BOOLEAN = false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN = false
			-- Is `position' used?

	INITIAL: INTEGER = 0
	IN_STR: INTEGER = 1
			-- Start condition codes

feature -- User-defined features



feature {NONE} -- Local variables

	i_, nb_: INTEGER
	char_: CHARACTER
	str_: STRING
	code_: INTEGER

feature {NONE} -- Initialization

	make
			-- Create a new scanner.
		do
			make_compressed_scanner_skeleton
			create in_buffer.make (Init_buffer_size)
			in_lineno := 1
			create str_.make_empty
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
