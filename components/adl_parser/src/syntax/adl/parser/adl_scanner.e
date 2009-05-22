note
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

create
	make

feature -- Status report

	valid_start_condition (sc: INTEGER): BOOLEAN
			-- Is `sc' a valid start condition?
		do
			Result := (INITIAL <= sc and sc <= IN_ASSERTION_SECTION)
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
if yy_act <= 24 then
if yy_act <= 12 then
if yy_act <= 6 then
if yy_act <= 3 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 60 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 60")
end
-- Ignore separators
else
--|#line 61 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 61")
end
in_lineno := in_lineno + text_count
end
else
--|#line 66 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 66")
end
-- Ignore comments
end
else
if yy_act <= 5 then
if yy_act = 4 then
--|#line 67 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 67")
end
in_lineno := in_lineno + 1
else
--|#line 71 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 71")
end
last_token := Minus_code
end
else
--|#line 72 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 72")
end
last_token := Plus_code
end
end
else
if yy_act <= 9 then
if yy_act <= 8 then
if yy_act = 7 then
--|#line 73 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 73")
end
last_token := Star_code
else
--|#line 74 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 74")
end
last_token := Slash_code
end
else
--|#line 75 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 75")
end
last_token := Caret_code
end
else
if yy_act <= 11 then
if yy_act = 10 then
--|#line 76 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 76")
end
last_token := Equal_code
else
--|#line 77 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 77")
end
last_token := Dot_code
end
else
--|#line 78 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 78")
end
last_token := Semicolon_code
end
end
end
else
if yy_act <= 18 then
if yy_act <= 15 then
if yy_act <= 14 then
if yy_act = 13 then
--|#line 79 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 79")
end
last_token := Comma_code
else
--|#line 80 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 80")
end
last_token := Colon_code
end
else
--|#line 81 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 81")
end
last_token := Exclamation_code
end
else
if yy_act <= 17 then
if yy_act = 16 then
--|#line 82 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 82")
end
last_token := Left_parenthesis_code
else
--|#line 83 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 83")
end
last_token := Right_parenthesis_code
end
else
--|#line 84 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 84")
end
last_token := Dollar_code
end
end
else
if yy_act <= 21 then
if yy_act <= 20 then
if yy_act = 19 then
--|#line 85 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 85")
end
last_token := Question_mark_code
else
--|#line 87 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 87")
end
last_token := Left_bracket_code
end
else
--|#line 88 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 88")
end
last_token := Right_bracket_code
end
else
if yy_act <= 23 then
if yy_act = 22 then
--|#line 92 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 92")
end

				last_token := SYM_ARCHETYPE
			
else
--|#line 96 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 96")
end

				last_token := SYM_ADL_VERSION
			
end
else
--|#line 100 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 100")
end

				last_token := SYM_IS_CONTROLLED
			
end
end
end
end
else
if yy_act <= 36 then
if yy_act <= 30 then
if yy_act <= 27 then
if yy_act <= 26 then
if yy_act = 25 then
--|#line 104 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 104")
end

				last_token := SYM_IS_GENERATED
			
else
--|#line 108 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 108")
end

				last_token := SYM_SPECIALIZE
				in_lineno := in_lineno + 1
			
end
else
--|#line 114 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 114")
end

				last_token := SYM_CONCEPT
				in_lineno := in_lineno + 1
			
end
else
if yy_act <= 29 then
if yy_act = 28 then
--|#line 119 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 119")
end

				last_token := SYM_LANGUAGE
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				language_text_start_line := in_lineno
			
else
--|#line 126 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 126")
end

				last_token := SYM_DESCRIPTION
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				description_text_start_line := in_lineno
			
end
else
--|#line 133 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 133")
end

				last_token := SYM_DEFINITION
				set_start_condition(IN_CADL_SECTION)
				in_lineno := in_lineno + 1
				definition_text_start_line := in_lineno
			
end
end
else
if yy_act <= 33 then
if yy_act <= 32 then
if yy_act = 31 then
--|#line 140 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 140")
end

				last_token := SYM_INVARIANT
				set_start_condition(IN_ASSERTION_SECTION)
				in_lineno := in_lineno + 1
				invariant_text_start_line := in_lineno
			
else
--|#line 147 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 147")
end

				last_token := SYM_ONTOLOGY
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				ontology_text_start_line := in_lineno
			
end
else
--|#line 155 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 155")
end
 -- line starting with "definition" or "description"
				-- unread the pattern just matched
				a_text := text
				from i := text_count until i < 1 loop
					unread_character (a_text.item (i))
					i := i - 1
				end

				-- get the dADL section sorted out
				last_token := V_DADL_TEXT
				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_

				set_start_condition(INITIAL)
			
end
else
if yy_act <= 35 then
if yy_act = 34 then
--|#line 156 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 156")
end
 -- line starting with "definition" or "description"
				-- unread the pattern just matched
				a_text := text
				from i := text_count until i < 1 loop
					unread_character (a_text.item (i))
					i := i - 1
				end

				-- get the dADL section sorted out
				last_token := V_DADL_TEXT
				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_

				set_start_condition(INITIAL)
			
else
--|#line 173 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 173")
end
 -- LF
				in_buffer.append_character('%N')
				in_lineno := in_lineno + 1
			
end
else
--|#line 177 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 177")
end
 -- any text on line with no LF
				in_buffer.append_string(text)
			
end
end
end
else
if yy_act <= 42 then
if yy_act <= 39 then
if yy_act <= 38 then
if yy_act = 37 then
--|#line 189 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 189")
end

		-- ignore unmatched chars
	
else
--|#line 195 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 195")
end

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
end
else
--|#line 199 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 199")
end
in_lineno := in_lineno + text_count
end
else
if yy_act <= 41 then
if yy_act = 40 then
--|#line 201 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 201")
end
 -- non-white space at start
				unread_character(text.item(1))
				last_token := V_CADL_TEXT
				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_
				set_start_condition(INITIAL)
	
else
--|#line 213 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 213")
end

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
end
else
--|#line 217 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 217")
end
 -- non-white space at start
				unread_character(text.item(1))
				last_token := V_ASSERTION_TEXT
				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_
				set_start_condition(INITIAL)
	
end
end
else
if yy_act <= 45 then
if yy_act <= 44 then
if yy_act = 43 then
--|#line 229 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 229")
end

					last_token := V_VERSION_STRING
					last_string_value := text_substring (1, text_count)
			
else
--|#line 235 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 235")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
else
--|#line 241 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 241")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
end
else
if yy_act <= 47 then
if yy_act = 46 then
--|#line 247 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 247")
end

					last_token := V_IDENTIFIER
					last_string_value := text
			
else
--|#line 254 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 254")
end
-- ignore unmatched chars
end
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

	yy_execute_eof_action (yy_sc: INTEGER)
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
				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_
				set_start_condition(INITIAL)
			
			else
				terminate
			end
		end

feature {NONE} -- Table templates

	yy_nxt_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,   10,   11,   12,   11,   13,   14,   15,   16,   17,
			   18,   19,   20,   21,   22,   23,   23,   24,   25,   26,
			   27,   28,   29,   30,   29,   29,   29,   31,   29,   29,
			   29,   29,   29,   29,   29,   29,   29,   29,   29,   29,
			   29,   32,   33,   34,   10,   29,   35,   43,   36,   37,
			   48,   49,   80,   58,   38,   39,   52,   40,   52,   55,
			   41,   56,   56,   62,   73,   74,   76,   77,   44,   52,
			   81,   52,   79,   79,   55,   80,   56,   56,   80,   61,
			   61,   80,   80,   80,   80,  212,   80,   80,   80,   80,
			   93,   78,   85,   78,   82,   73,   74,   83,   87,   94,

			   92,   86,   90,   76,   77,   80,   80,   88,   80,   84,
			   80,   61,   89,   91,   95,   80,   79,   79,   80,   89,
			   97,   99,  100,   80,   98,   80,  101,  102,   80,  103,
			   80,   80,  104,   80,   98,  110,  110,   80,   80,   80,
			  105,  107,   80,   80,   80,   80,   80,   95,  106,  110,
			  110,  115,  116,   80,   80,  114,   80,  112,   80,   80,
			  121,  113,  117,   80,  112,   80,  118,  119,  128,  126,
			  122,  120,   80,   80,   80,   80,  127,   80,   80,   80,
			   80,   80,  129,   80,  130,  135,  134,  136,   80,  131,
			  132,  133,   80,   80,   80,   80,   80,  140,   80,  141,

			   80,   80,  147,   80,  142,   80,   80,  144,  143,  148,
			  149,   80,  145,  146,  150,   80,  156,   80,  155,  163,
			   80,  154,  157,  158,  159,  158,   80,   80,  160,  161,
			   80,   80,   80,   80,  162,   80,   80,  165,  158,  159,
			  158,   80,  171,  169,  164,  170,   80,   80,  172,  174,
			   80,  173,  176,  177,  176,  178,  179,  178,   80,  210,
			  175,   80,   80,  185,  180,   80,  184,  188,  186,  180,
			  186,  189,  190,  189,  176,  177,  176,  187,   80,   80,
			  195,   80,  178,  179,  178,   80,  186,   80,  186,  197,
			  198,  197,  191,  189,  190,  189,   80,  196,   80,   80,

			  200,  201,  200,  192,  202,  192,  199,  204,  205,  203,
			   80,  197,  198,  197,  206,  207,  206,  200,  201,  200,
			  203,  208,  203,  193,   80,  206,  207,  206,  204,  205,
			  212,  212,   42,   42,   42,   42,   42,   42,   42,   45,
			   45,   45,   45,   45,   45,   45,   47,   47,   47,   47,
			   47,   47,   47,   50,   50,   50,   50,   50,   50,   50,
			   57,   57,   57,   57,   57,   61,   61,   61,   61,   69,
			  192,   69,   69,   69,   69,   69,   72,   72,   72,   72,
			   72,   72,   72,   75,   75,   75,   75,   75,   75,   75,
			   54,   54,   54,   54,   54,   54,   54,   96,   96,  111,

			  111,  111,  111,  111,  139,  139,  153,  153,  153,  153,
			  153,  183,  183,  194,  194,  194,  194,  194,  209,  209,
			  211,  211,  211,  211,  211,   80,  182,  181,  168,  167,
			  166,  152,  151,  138,  137,  125,  124,  123,  109,  108,
			   77,   74,   71,   80,   78,   53,   71,   71,   70,   68,
			   67,   66,   65,   64,   63,   60,   59,   58,   54,   53,
			  213,   51,   46,   43,    9,  213,  213,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,

			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213, yy_Dummy>>)
		end

	yy_chk_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    2,    4,    2,    2,
			    6,    6,   58,   35,    2,    2,   11,    2,   11,   23,
			    2,   23,   23,   35,   48,   48,   51,   51,    4,   52,
			   58,   52,   55,   55,   56,   59,   56,   56,   60,   61,
			   61,   62,   63,   66,   64,  210,   65,   68,   81,   67,
			   70,   78,   62,   78,   59,   73,   73,   60,   64,   70,

			   68,   63,   66,   76,   76,   82,   85,   64,   83,   61,
			   87,   61,   65,   67,   79,   86,   79,   79,   88,   65,
			   81,   83,   85,   89,   82,   90,   86,   87,   91,   88,
			   92,   97,   89,   99,   86,   95,   95,   98,  100,  101,
			   90,   92,  106,  102,  103,  104,  105,  110,   91,  110,
			  110,  100,  101,  107,  113,   99,  112,   97,  115,  114,
			  106,   98,  102,  116,   97,  121,  103,  104,  114,  112,
			  107,  105,  117,  118,  119,  126,  113,  120,  122,  127,
			  128,  129,  115,  130,  116,  121,  120,  122,  131,  117,
			  118,  119,  132,  133,  134,  135,  136,  126,  140,  127,

			  141,  143,  133,  142,  128,  146,  148,  130,  129,  134,
			  135,  145,  131,  132,  136,  147,  142,  149,  141,  148,
			  150,  140,  143,  144,  144,  144,  154,  155,  145,  146,
			  156,  160,  161,  144,  147,  157,  162,  150,  158,  158,
			  158,  165,  156,  154,  149,  155,  169,  174,  157,  161,
			  170,  160,  163,  163,  163,  164,  164,  164,  173,  205,
			  162,  184,  163,  170,  165,  164,  169,  174,  172,  165,
			  172,  175,  175,  175,  176,  176,  176,  173,  172,  180,
			  184,  175,  178,  178,  178,  185,  186,  188,  186,  187,
			  187,  187,  180,  189,  189,  189,  196,  185,  195,  187,

			  191,  191,  191,  192,  192,  192,  188,  194,  194,  193,
			  191,  197,  197,  197,  199,  199,  199,  200,  200,  200,
			  203,  203,  203,  182,  199,  206,  206,  206,  211,  211,
			  212,  212,  214,  214,  214,  214,  214,  214,  214,  215,
			  215,  215,  215,  215,  215,  215,  216,  216,  216,  216,
			  216,  216,  216,  217,  217,  217,  217,  217,  217,  217,
			  218,  218,  218,  218,  218,  219,  219,  219,  219,  220,
			  181,  220,  220,  220,  220,  220,  221,  221,  221,  221,
			  221,  221,  221,  222,  222,  222,  222,  222,  222,  222,
			  223,  223,  223,  223,  223,  223,  223,  224,  224,  225,

			  225,  225,  225,  225,  226,  226,  227,  227,  227,  227,
			  227,  228,  228,  229,  229,  229,  229,  229,  230,  230,
			  231,  231,  231,  231,  231,  171,  167,  166,  153,  152,
			  151,  138,  137,  124,  123,  111,  109,  108,   94,   93,
			   75,   72,   71,   57,   54,   53,   49,   46,   44,   41,
			   40,   39,   38,   37,   36,   31,   30,   28,   20,   12,
			    9,    8,    5,    3,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,

			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,   25,  460,   44,  459,   48,    0,  459,  460,
			  464,   54,  456,  464,  464,  464,  464,  464,  464,  464,
			  446,  464,  464,   46,  464,  464,  464,  464,  433,    0,
			  424,  430,    0,  464,  464,   29,  422,  428,  421,  430,
			  419,  416,    0,  464,  423,  464,  444,  464,   62,  443,
			  464,   64,   67,  442,  441,   57,   61,  431,   40,   63,
			   66,   67,   69,   70,   72,   74,   71,   77,   75,    0,
			   64,  439,  438,   93,  464,  437,  101,  464,   89,  101,
			    0,   76,   93,   96,  464,   94,  103,   98,  106,  111,
			  113,  116,  118,  410,  415,  120,    0,  119,  125,  121,

			  126,  127,  131,  132,  133,  134,  130,  141,  406,  402,
			  134,  423,  144,  142,  147,  146,  151,  160,  161,  162,
			  165,  153,  166,  405,  404,    0,  163,  167,  168,  169,
			  171,  176,  180,  181,  182,  183,  184,  396,  398,    0,
			  186,  188,  191,  189,  221,  199,  193,  203,  194,  205,
			  208,  401,  393,  415,  214,  215,  218,  223,  236,  464,
			  219,  220,  224,  250,  253,  229,  395,  397,    0,  234,
			  238,  413,  266,  246,  235,  269,  272,  464,  280,  464,
			  267,  339,  291,    0,  249,  273,  284,  287,  275,  291,
			  464,  298,  301,  278,  295,  286,  284,  309,  464,  312,

			  315,  464,  464,  318,    0,  214,  323,  464,  464,    0,
			   69,  316,  315,  464,  331,  338,  345,  352,  357,  362,
			  368,  375,  382,  389,  392,  396,  399,  403,  406,  410,
			  413,  417, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,  213,    1,  214,  214,  215,  216,  215,  217,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  218,  218,
			  218,  218,  219,  213,  213,  218,  218,  218,  218,  218,
			  218,  218,  220,  213,  220,  213,  213,  213,  221,  213,
			  213,  222,  213,  213,  223,  213,  213,  218,  218,  218,
			  218,  219,  218,  218,  218,  218,  218,  218,  218,  220,
			  220,  213,  221,  221,  213,  222,  222,  213,  213,  213,
			  224,  218,  218,  218,  213,  218,  218,  218,  218,  218,
			  218,  218,  218,  220,  220,  213,  225,  218,  218,  218,

			  218,  218,  218,  218,  218,  218,  218,  218,  220,  220,
			  213,  225,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  220,  220,  226,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  220,  220,  227,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  220,  220,  227,  218,  218,  218,  218,  213,  213,
			  218,  218,  218,  218,  218,  218,  220,  220,  228,  218,
			  218,  218,  218,  218,  218,  218,  213,  213,  213,  213,
			  218,  220,  220,  229,  218,  218,  213,  218,  218,  213,
			  213,  218,  220,  220,  229,  218,  218,  213,  213,  218,

			  213,  213,  213,  220,  230,  213,  213,  213,  213,  231,
			  213,  231,  213,    0,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,
			  213,  213, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    5,    1,    1,    6,    1,    1,    1,
			    7,    8,    9,   10,   11,   12,   13,   14,   15,   16,
			   16,   16,   16,   16,   16,   16,   16,   16,   17,   18,
			    1,   19,    1,   20,    1,   21,   22,   23,   24,   25,
			   26,   27,   28,   29,   22,   22,   30,   22,   31,   32,
			   33,   22,   34,   35,   36,   37,   38,   22,   22,   39,
			   40,   41,    1,   42,   43,   44,    1,   21,   22,   23,

			   24,   25,   26,   27,   28,   29,   22,   22,   30,   22,
			   31,   32,   33,   22,   34,   35,   36,   37,   45,   22,
			   22,   39,   40,    1,    1,    1,    1,    1,    1,    1,
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

	yy_meta_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    2,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    3,    4,    1,    1,    1,
			    1,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    6,    1,    1,    1,    7,    5, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   49,
			   47,    1,    2,   15,   18,   16,   17,    7,    6,   13,
			    5,   11,    8,   47,   14,   12,   10,   19,   46,   46,
			   46,   46,   20,   21,    9,   46,   46,   46,   46,   46,
			   46,   46,   36,   35,   36,   48,   39,   40,   48,   39,
			   42,   48,    1,    2,    3,    0,    0,   46,   46,   46,
			   46,    0,   46,   46,   46,   46,   46,   46,   46,   36,
			   36,   39,    0,    0,   38,    0,    0,   41,    4,   43,
			    0,   46,   46,   46,   44,   46,   46,   46,   46,   46,
			   46,   46,   46,   36,   36,    0,    0,   46,   46,   46,

			   46,   46,   46,   46,   46,   46,   46,   46,   36,   36,
			   43,    0,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   36,   36,    0,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   36,   36,    0,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   36,   36,    0,   46,   46,   46,   46,    0,   27,
			   46,   46,   46,   46,   46,   46,   36,   36,    0,   46,
			   46,   25,   22,   46,   46,   46,    0,   28,    0,   32,
			   46,   36,   36,    0,   46,   46,   22,   46,   46,    0,
			   31,   46,   36,   36,    0,   23,   24,    0,   30,   46,

			    0,   26,   34,   36,    0,    0,    0,   29,   33,    0,
			    0,    0,   45,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 464
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 213
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 214
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

	yyNb_rules: INTEGER = 48
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 49
			-- End of buffer rule code

	yyLine_used: BOOLEAN = false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN = false
			-- Is `position' used?

	INITIAL: INTEGER = 0
	IN_DADL_SECTION: INTEGER = 1
	IN_CADL_SECTION: INTEGER = 2
	IN_ASSERTION_SECTION: INTEGER = 3
			-- Start condition codes

feature -- User-defined features



feature {NONE} -- Local variables

	i_, i, nb_: INTEGER
	char_: CHARACTER
	a_text, str_: STRING
	code_: INTEGER

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
		end

feature -- Access

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

	language_text_start_line: INTEGER

	description_text_start_line: INTEGER

	definition_text_start_line: INTEGER

	invariant_text_start_line: INTEGER

	ontology_text_start_line: INTEGER

feature {NONE} -- Constants

	Init_buffer_size: INTEGER = 256
				-- Initial size for `in_buffer'

invariant

	in_buffer_not_void: in_buffer /= Void

end
