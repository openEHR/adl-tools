indexing
	component:   "openEHR Archetype Project"
	description: "Scanner for ADL syntax items"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas@deepthought.com.au>"
	support:     "Deep Thought Informatics <support@deepthought.com.au>"
	copyright:   "Copyright (c) 2003-2005 Ocean Informatics Pty Ltd"
	license:     "Mozilla tri-license"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ADL_SCANNER

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton,
			output as print_out
		end

	ADL_TOKENS
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
			Result := (INITIAL <= sc and sc <= IN_ASSERTION_SECTION)
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
if yy_act <= 21 then
if yy_act <= 11 then
if yy_act <= 6 then
if yy_act <= 3 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 54 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 54")
end
-- Ignore separators
else
--|#line 55 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 55")
end
in_lineno := in_lineno + text_count
end
else
--|#line 60 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 60")
end
-- Ignore comments
end
else
if yy_act <= 5 then
if yy_act = 4 then
--|#line 61 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 61")
end
in_lineno := in_lineno + 1
else
--|#line 65 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 65")
end
last_token := Minus_code
end
else
--|#line 66 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 66")
end
last_token := Plus_code
end
end
else
if yy_act <= 9 then
if yy_act <= 8 then
if yy_act = 7 then
--|#line 67 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 67")
end
last_token := Star_code
else
--|#line 68 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 68")
end
last_token := Slash_code
end
else
--|#line 69 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 69")
end
last_token := Caret_code
end
else
if yy_act = 10 then
--|#line 70 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 70")
end
last_token := Equal_code
else
--|#line 71 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 71")
end
last_token := Dot_code
end
end
end
else
if yy_act <= 16 then
if yy_act <= 14 then
if yy_act <= 13 then
if yy_act = 12 then
--|#line 72 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 72")
end
last_token := Semicolon_code
else
--|#line 73 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 73")
end
last_token := Comma_code
end
else
--|#line 74 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 74")
end
last_token := Colon_code
end
else
if yy_act = 15 then
--|#line 75 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 75")
end
last_token := Exclamation_code
else
--|#line 76 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 76")
end
last_token := Left_parenthesis_code
end
end
else
if yy_act <= 19 then
if yy_act <= 18 then
if yy_act = 17 then
--|#line 77 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 77")
end
last_token := Right_parenthesis_code
else
--|#line 78 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 78")
end
last_token := Dollar_code
end
else
--|#line 79 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 79")
end
last_token := Question_mark_code
end
else
if yy_act = 20 then
--|#line 81 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 81")
end
last_token := Left_bracket_code
else
--|#line 82 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 82")
end
last_token := Right_bracket_code
end
end
end
end
else
if yy_act <= 31 then
if yy_act <= 26 then
if yy_act <= 24 then
if yy_act <= 23 then
if yy_act = 22 then
--|#line 86 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 86")
end

				last_token := SYM_ARCHETYPE
				in_lineno := in_lineno + 1
			
else
--|#line 91 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 91")
end

				last_token := SYM_SPECIALIZE
				in_lineno := in_lineno + 1
			
end
else
--|#line 97 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 97")
end

				last_token := SYM_CONCEPT
				in_lineno := in_lineno + 1
			
end
else
if yy_act = 25 then
--|#line 102 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 102")
end

				last_token := SYM_DEFINITION
				set_start_condition(IN_CADL_SECTION)
				in_lineno := in_lineno + 1
				definition_text_start_line := in_lineno
			
else
--|#line 109 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 109")
end

				last_token := SYM_DESCRIPTION
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				description_text_start_line := in_lineno
			
end
end
else
if yy_act <= 29 then
if yy_act <= 28 then
if yy_act = 27 then
--|#line 117 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 117")
end

				last_token := SYM_INVARIANT
				set_start_condition(IN_ASSERTION_SECTION)
				in_lineno := in_lineno + 1
				invariant_text_start_line := in_lineno
			
else
--|#line 124 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 124")
end

				last_token := SYM_ONTOLOGY
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				ontology_text_start_line := in_lineno
			
end
else
--|#line 131 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 131")
end
 -- line starting with "definition"
				-- unread the pattern just matched
				a_text := text
				from i := text_count until i < 1 loop
					unread_character (a_text.item (i))
					i := i - 1
				end

				-- get the dADL section sorted out
				last_token := V_DADL_TEXT
				str_ := STRING_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_

				set_start_condition(INITIAL)
			
end
else
if yy_act = 30 then
--|#line 149 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 149")
end
 -- any text on line with a LF
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
			
else
--|#line 154 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 154")
end
 -- any text on line with no LF
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
			
end
end
end
else
if yy_act <= 36 then
if yy_act <= 34 then
if yy_act <= 33 then
if yy_act = 32 then
--|#line 169 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 169")
end

		-- ignore unmatched chars
	
else
--|#line 174 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 174")
end

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
			
end
else
--|#line 179 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 179")
end
 -- non-white space at start
				unread_character(text.item(1))
				last_token := V_CADL_TEXT
				str_ := STRING_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_
				set_start_condition(INITIAL)
			
end
else
if yy_act = 35 then
--|#line 189 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 189")
end

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
			
else
--|#line 194 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 194")
end
 -- non-white space at start
				unread_character(text.item(1))
				last_token := V_ASSERTION_TEXT
				str_ := STRING_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_
				set_start_condition(INITIAL)
			
end
end
else
if yy_act <= 39 then
if yy_act <= 38 then
if yy_act = 37 then
--|#line 205 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 205")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 211 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 211")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
end
else
--|#line 217 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 217")
end

					last_token := V_IDENTIFIER
					last_string_value := text
			
end
else
if yy_act = 40 then
--|#line 224 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 224")
end
-- ignore unmatched chars
else
--|#line 0 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 0")
end
default_action
end
end
end
end
end
			yy_set_beginning_of_line
		end

	yy_execute_eof_action (yy_sc: INTEGER) is
			-- Execute EOF semantic action.
		do
			inspect yy_sc
when 0, 2, 3 then
--|#line 0 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 0")
end
terminate
when 1 then
--|#line 0 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 0")
end

				-- get the dADL section sorted out
				last_token := V_DADL_TEXT
				str_ := STRING_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_
				set_start_condition(INITIAL)
			
			else
				terminate
			end
		end

feature {NONE} -- Table templates

	yy_nxt_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,   10,   11,   12,   11,   13,   14,   15,   16,   17,
			   18,   19,   20,   21,   22,   10,   23,   24,   25,   26,
			   27,   27,   27,   27,   27,   27,   27,   27,   27,   27,
			   27,   27,   27,   27,   27,   27,   27,   27,   27,   28,
			   29,   30,   10,   31,   38,   32,   33,   45,   48,   45,
			   48,   34,   48,   95,   35,   48,   48,   36,   48,   58,
			   61,   62,   53,   65,   39,   64,   65,   58,   45,   51,
			   45,   52,   62,   54,   55,   48,   67,   58,   56,   58,
			   59,   50,   50,   48,   67,   48,   67,   67,   48,   67,
			   48,   67,   85,   69,   48,   67,   48,   67,   66,   76,

			   66,   71,   66,   70,   61,   62,   64,   65,   75,   68,
			   72,   50,   48,   67,   73,   48,   67,   74,   48,   67,
			   48,   67,   58,   48,   67,   79,   46,   78,   48,   67,
			   81,   82,   48,   67,   80,   58,   48,   67,   48,   67,
			   48,   67,   84,   48,   67,   48,   67,   83,   87,   94,
			   88,   48,   67,   48,   67,   48,   67,   58,   89,   48,
			   67,   48,   67,   58,   90,   58,   91,  112,   92,   93,
			   48,   67,   48,   67,   48,   67,   48,   98,   96,   97,
			   58,   48,   67,   48,   67,  129,   99,   47,  100,  102,
			  103,   48,   67,  101,   48,   67,   48,   67,   48,   67,

			   46,   48,   67,   48,   67,  121,  109,  146,  105,   48,
			   67,  114,  115,  114,  106,  110,  108,  107,   48,   67,
			  111,   48,   67,   48,   67,   48,   67,   48,   67,  113,
			   44,   48,   67,   42,  116,   58,   48,   67,  114,  115,
			  114,   48,   67,  118,   48,   67,  117,  120,  122,   48,
			   67,   38,  119,  126,  127,  126,   48,   67,   48,   67,
			  123,  146,  137,   48,   67,  124,  146,  125,  146,  130,
			  131,  130,   48,   67,   48,   67,  132,  146,  128,   48,
			   67,  146,  128,  134,  135,  134,  126,  127,  126,   48,
			   67,  133,  140,   48,   67,  130,  131,  130,  138,  139,

			  138,  136,  134,  135,  134,  141,  142,  141,   48,   67,
			  137,  143,  137,  146,  146,   48,   67,  138,  139,  138,
			  144,  145,  144,  141,  142,  141,  144,  145,  144,  146,
			   48,   67,   37,   37,   37,   37,   37,   37,   37,   40,
			   40,   40,   40,   40,   40,   40,   41,   41,   41,   41,
			   41,   41,   41,   43,   43,   43,   43,   43,   43,   43,
			   49,  146,   49,   49,   49,   49,   50,   50,   50,   50,
			   57,   57,   57,   57,   57,   57,   57,   60,   60,   60,
			   60,   60,   60,   60,   63,   63,   63,   63,   63,   63,
			   63,   47,   47,   47,   47,   47,   47,   47,   48,   48,

			   48,   48,   48,   48,   77,   77,   77,   86,  146,   86,
			   86,   86,   86,  104,  104,  104,  104,    9,  146,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  146,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  146,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  146,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  146,  146, yy_Dummy>>)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    2,    4,    2,    2,   11,   31,   11,
			   33,    2,   32,   86,    2,   34,   35,    2,   36,   39,
			   42,   42,   33,   63,    4,   44,   44,   76,   45,   31,
			   45,   32,   60,   34,   35,   49,   49,   59,   36,   57,
			   39,   50,   50,   51,   51,   52,   52,   48,   53,   53,
			   54,   54,   76,   51,   55,   55,   56,   56,   66,   59,

			   66,   53,   47,   52,   61,   61,   64,   64,   56,   50,
			   53,   50,   69,   69,   54,   70,   70,   55,   71,   71,
			   72,   72,   85,   73,   73,   70,   46,   69,   74,   74,
			   72,   73,   75,   75,   71,  103,   78,   78,   79,   79,
			   80,   80,   75,   81,   81,   82,   82,   74,   78,   85,
			   79,   83,   83,   84,   84,   87,   87,  121,   80,   88,
			   88,   89,   89,   37,   81,   94,   82,  103,   83,   84,
			   90,   90,   91,   91,   92,   92,   27,   89,   87,   88,
			  112,   93,   93,   96,   96,  121,   90,   20,   91,   93,
			   94,   97,   97,   92,   98,   98,   99,   99,  100,  100,

			   12,  101,  101,  102,  102,  112,  100,    9,   96,  105,
			  105,  106,  106,  106,   97,  101,   99,   98,  107,  107,
			  102,  106,  106,  108,  108,  109,  109,  110,  110,  105,
			    8,  111,  111,    6,  107,  129,  113,  113,  114,  114,
			  114,  116,  116,  109,  118,  118,  108,  111,  113,  117,
			  117,    3,  110,  119,  119,  119,  120,  120,  123,  123,
			  116,    0,  129,  119,  119,  117,    0,  118,    0,  122,
			  122,  122,  124,  124,  133,  133,  123,    0,  120,  122,
			  122,    0,  120,  125,  125,  125,  126,  126,  126,  128,
			  128,  124,  133,  125,  125,  130,  130,  130,  132,  132,

			  132,  128,  134,  134,  134,  136,  136,  136,  132,  132,
			  137,  137,  137,    0,    0,  136,  136,  138,  138,  138,
			  140,  140,  140,  141,  141,  141,  144,  144,  144,    0,
			  140,  140,  147,  147,  147,  147,  147,  147,  147,  148,
			  148,  148,  148,  148,  148,  148,  149,  149,  149,  149,
			  149,  149,  149,  150,  150,  150,  150,  150,  150,  150,
			  151,    0,  151,  151,  151,  151,  152,  152,  152,  152,
			  153,  153,  153,  153,  153,  153,  153,  154,  154,  154,
			  154,  154,  154,  154,  155,  155,  155,  155,  155,  155,
			  155,  156,  156,  156,  156,  156,  156,  156,  157,  157,

			  157,  157,  157,  157,  158,  158,  158,  159,    0,  159,
			  159,  159,  159,  160,  160,  160,  160,  146,  146,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  146,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  146,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  146,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  146,  146, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,   23,  248,   41,    0,  231,    0,  228,  207,
			  417,   45,  197,  417,  417,  417,  417,  417,  417,  417,
			  175,  417,  417,  417,  417,  417,  417,  164,    0,  417,
			  417,   36,   40,   38,   43,   44,   46,  160,  417,   56,
			  417,  417,   58,  417,   63,   66,  123,   99,   74,   63,
			   69,   71,   73,   76,   78,   82,   84,   76,  417,   74,
			   69,  102,  417,   60,  104,  417,   96,    0,  417,  100,
			  103,  106,  108,  111,  116,  120,   64,    0,  124,  126,
			  128,  131,  133,  139,  141,  119,   40,  143,  147,  149,
			  158,  160,  162,  169,  162,    0,  171,  179,  182,  184,

			  186,  189,  191,  132,    0,  197,  209,  206,  211,  213,
			  215,  219,  177,  224,  236,  417,  229,  237,  232,  251,
			  244,  154,  267,  246,  260,  281,  284,  417,  277,  232,
			  293,  417,  296,  262,  300,  417,  303,  308,  315,  417,
			  318,  321,  417,  417,  324,  417,  417,  331,  338,  345,
			  352,  358,  362,  369,  376,  383,  390,  396,  399,  405,
			  409, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  146,    1,  147,  147,  148,  149,  148,  150,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  146,  146,
			  146,  146,  146,  146,  146,  146,  146,  151,  152,  146,
			  146,  151,  151,  151,  151,  151,  151,  153,  146,  153,
			  146,  146,  154,  146,  155,  146,  146,  156,  157,  151,
			  152,  151,  151,  151,  151,  151,  151,  153,  146,  153,
			  154,  154,  146,  155,  155,  146,  146,  158,  146,  151,
			  151,  151,  151,  151,  151,  151,  153,  159,  151,  151,
			  151,  151,  151,  151,  151,  153,  159,  151,  151,  151,
			  151,  151,  151,  151,  153,  160,  151,  151,  151,  151,

			  151,  151,  151,  153,  160,  151,  151,  151,  151,  151,
			  151,  151,  153,  151,  146,  146,  151,  151,  151,  151,
			  151,  153,  151,  151,  151,  151,  146,  146,  151,  153,
			  146,  146,  151,  151,  146,  146,  151,  153,  146,  146,
			  151,  146,  146,  146,  146,  146,    0,  146,  146,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  146,  146,
			  146, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    5,    1,    1,    6,    1,    1,    1,
			    7,    8,    9,   10,   11,   12,   13,   14,   15,   15,
			   15,   15,   15,   15,   15,   15,   15,   15,   16,   17,
			    1,   18,    1,   19,    1,   20,   21,   22,   23,   24,
			   25,   26,   27,   28,   21,   21,   29,   21,   30,   31,
			   32,   21,   33,   34,   35,   21,   36,   21,   21,   37,
			   38,   39,    1,   40,   41,   42,    1,   20,   21,   22,

			   23,   24,   25,   26,   27,   28,   21,   21,   29,   21,
			   30,   31,   32,   21,   33,   34,   35,   21,   36,   21,
			   21,   37,   38,    1,    1,    1,    1,    1,    1,    1,
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
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    3,    1,    4,    1,    1,    1,    1,
			    5,    5,    6,    7,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    1,
			    1,    1,    2, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   42,
			   40,    1,    2,   15,   18,   16,   17,    7,    6,   13,
			    5,   11,    8,   14,   12,   10,   19,   39,   20,   21,
			    9,   39,   39,   39,   39,   39,   39,   31,   32,   31,
			   41,   34,   41,   36,   41,    1,    2,    3,    0,   39,
			    0,   39,   39,   39,   39,   39,   39,   31,   30,   31,
			    0,    0,   33,    0,    0,   35,    4,    0,   37,   39,
			   39,   39,   39,   39,   39,   39,   31,    0,   39,   39,
			   39,   39,   39,   39,   39,   31,    0,   39,   39,   39,
			   39,   39,   39,   39,   31,    0,   39,   39,   39,   39,

			   39,   39,   39,   31,   38,   39,   39,   39,   39,   39,
			   39,   39,   31,   39,    0,   24,   39,   39,   39,   39,
			   39,   31,   39,   39,   39,   39,    0,   28,   39,   31,
			    0,   22,   39,   39,    0,   27,   39,   31,    0,   25,
			   39,    0,   23,   29,    0,   26,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 417
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 146
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 147
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

	yyNb_rules: INTEGER is 41
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 42
			-- End of buffer rule code

	yyLine_used: BOOLEAN is false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN is false
			-- Is `position' used?

	INITIAL: INTEGER is 0
	IN_DADL_SECTION: INTEGER is 1
	IN_CADL_SECTION: INTEGER is 2
	IN_ASSERTION_SECTION: INTEGER is 3
			-- Start condition codes

feature -- User-defined features



feature {NONE} -- Local variables

	i_, i, nb_: INTEGER
	char_: CHARACTER
	a_text, str_: STRING
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

	-- last_string_value: STRING

	-- last_character_value: CHARACTER

	-- last_integer_value: INTEGER

	-- last_real_value: REAL


	in_buffer: STRING
			-- Buffer for lexial tokens

	in_lineno: INTEGER
			-- Current line number

	is_operator: BOOLEAN
			-- Parsing an operator declaration?

	in_constraint_block: BOOLEAN
			-- flag set by parser when inside constraint block
			-- needed so scanner can present some keywords just as
			-- identifiers

	description_text_start_line: INTEGER

	definition_text_start_line: INTEGER

	invariant_text_start_line: INTEGER

	ontology_text_start_line: INTEGER

feature {NONE} -- Constants

	Init_buffer_size: INTEGER is 256
				-- Initial size for `in_buffer'

invariant

	in_buffer_not_void: in_buffer /= Void

end
