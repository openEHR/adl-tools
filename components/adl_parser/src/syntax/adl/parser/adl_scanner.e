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
if yy_act <= 26 then
if yy_act <= 13 then
if yy_act <= 7 then
if yy_act <= 4 then
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
if yy_act = 3 then
--|#line 66 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 66")
end
-- Ignore comments
else
--|#line 67 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 67")
end
in_lineno := in_lineno + 1
end
end
else
if yy_act <= 6 then
if yy_act = 5 then
--|#line 71 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 71")
end
last_token := Minus_code
else
--|#line 72 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 72")
end
last_token := Plus_code
end
else
--|#line 73 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 73")
end
last_token := Star_code
end
end
else
if yy_act <= 10 then
if yy_act <= 9 then
if yy_act = 8 then
--|#line 74 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 74")
end
last_token := Slash_code
else
--|#line 75 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 75")
end
last_token := Caret_code
end
else
--|#line 76 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 76")
end
last_token := Equal_code
end
else
if yy_act <= 12 then
if yy_act = 11 then
--|#line 77 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 77")
end
last_token := Dot_code
else
--|#line 78 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 78")
end
last_token := Semicolon_code
end
else
--|#line 79 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 79")
end
last_token := Comma_code
end
end
end
else
if yy_act <= 20 then
if yy_act <= 17 then
if yy_act <= 15 then
if yy_act = 14 then
--|#line 80 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 80")
end
last_token := Colon_code
else
--|#line 81 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 81")
end
last_token := Exclamation_code
end
else
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
end
else
if yy_act <= 19 then
if yy_act = 18 then
--|#line 84 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 84")
end
last_token := Dollar_code
else
--|#line 85 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 85")
end
last_token := Question_mark_code
end
else
--|#line 87 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 87")
end
last_token := Left_bracket_code
end
end
else
if yy_act <= 23 then
if yy_act <= 22 then
if yy_act = 21 then
--|#line 88 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 88")
end
last_token := Right_bracket_code
else
--|#line 92 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 92")
end

				last_token := SYM_ARCHETYPE
			
end
else
--|#line 96 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 96")
end

				last_token := SYM_TEMPLATE
			
end
else
if yy_act <= 25 then
if yy_act = 24 then
--|#line 100 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 100")
end

				last_token := SYM_TEMPLATE_COMPONENT
			
else
--|#line 104 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 104")
end

				last_token := SYM_OPERATIONAL_TEMPLATE
			
end
else
--|#line 108 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 108")
end

				last_token := SYM_ADL_VERSION
			
end
end
end
end
else
if yy_act <= 39 then
if yy_act <= 33 then
if yy_act <= 30 then
if yy_act <= 28 then
if yy_act = 27 then
--|#line 112 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 112")
end

				last_token := SYM_IS_CONTROLLED
			
else
--|#line 116 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 116")
end

				last_token := SYM_IS_GENERATED
			
end
else
if yy_act = 29 then
--|#line 120 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 120")
end

				last_token := SYM_SPECIALIZE
				in_lineno := in_lineno + 1
			
else
--|#line 126 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 126")
end

				last_token := SYM_CONCEPT
				in_lineno := in_lineno + 1
			
end
end
else
if yy_act <= 32 then
if yy_act = 31 then
--|#line 131 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 131")
end

				last_token := SYM_LANGUAGE
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				language_text_start_line := in_lineno
			
else
--|#line 138 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 138")
end

				last_token := SYM_DESCRIPTION
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				description_text_start_line := in_lineno
			
end
else
--|#line 145 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 145")
end

				last_token := SYM_DEFINITION
				set_start_condition(IN_CADL_SECTION)
				in_lineno := in_lineno + 1
				definition_text_start_line := in_lineno
			
end
end
else
if yy_act <= 36 then
if yy_act <= 35 then
if yy_act = 34 then
--|#line 152 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 152")
end

				last_token := SYM_INVARIANT
				set_start_condition(IN_ASSERTION_SECTION)
				in_lineno := in_lineno + 1
				invariant_text_start_line := in_lineno
			
else
--|#line 159 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 159")
end

				last_token := SYM_ONTOLOGY
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				ontology_text_start_line := in_lineno
			
end
else
--|#line 167 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 167")
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
if yy_act <= 38 then
if yy_act = 37 then
--|#line 168 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 168")
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
--|#line 185 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 185")
end
 -- LF
				in_buffer.append_character('%N')
				in_lineno := in_lineno + 1
			
end
else
--|#line 189 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 189")
end
 -- any text on line with no LF
				in_buffer.append_string(text)
			
end
end
end
else
if yy_act <= 45 then
if yy_act <= 42 then
if yy_act <= 41 then
if yy_act = 40 then
--|#line 201 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 201")
end

		-- ignore unmatched chars
	
else
--|#line 207 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 207")
end

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
end
else
--|#line 211 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 211")
end
in_lineno := in_lineno + text_count
end
else
if yy_act <= 44 then
if yy_act = 43 then
--|#line 213 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 213")
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
--|#line 225 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 225")
end

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
end
else
--|#line 229 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 229")
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
if yy_act <= 48 then
if yy_act <= 47 then
if yy_act = 46 then
--|#line 241 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 241")
end

					last_token := V_VERSION_STRING
					last_string_value := text_substring (1, text_count)
			
else
--|#line 247 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 247")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
else
--|#line 253 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 253")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
end
else
if yy_act <= 50 then
if yy_act = 49 then
--|#line 259 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 259")
end

					last_token := V_IDENTIFIER
					last_string_value := text
			
else
--|#line 266 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 266")
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

	yy_nxt_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,   10,   11,   12,   11,   13,   14,   15,   16,   17,
			   18,   19,   20,   21,   22,   23,   23,   24,   25,   26,
			   27,   28,   29,   30,   29,   29,   29,   31,   29,   29,
			   29,   29,   29,   29,   29,   29,   29,   29,   29,   29,
			   29,   29,   32,   33,   34,   10,   29,   29,   35,   44,
			   36,   37,   49,   50,   61,   59,   38,   39,   65,   53,
			   40,   53,   71,   41,   42,   56,   63,   57,   57,   68,
			   45,   69,   73,   76,   77,   61,   79,   80,   53,   65,
			   53,   82,   82,   71,   56,   83,   57,   57,   83,   83,
			   62,   62,   83,   73,   83,   83,   83,   83,   83,   83,

			   83,   76,   77,   84,   98,   88,   83,   83,   85,   86,
			   90,   95,   89,   96,   99,   79,   80,   93,   83,  252,
			   91,   87,   92,   62,   94,   97,   81,   83,   81,   83,
			   92,   83,   95,  100,   96,   82,   82,   83,  103,   83,
			  102,   83,  104,  105,   83,   83,  110,   83,  106,   83,
			   83,   83,  108,  109,  117,  117,  107,  103,   83,   83,
			  113,   83,   83,  104,   83,   83,  111,   83,   83,   83,
			  112,   83,  114,   83,  122,  123,   83,   83,  119,   83,
			  129,   83,  121,  120,  124,   83,  119,  128,  125,   83,
			  126,  131,  135,  130,  127,  122,  123,  100,  137,  117,

			  117,   83,  138,   83,  136,   83,   83,  139,   83,   83,
			   83,   83,   83,  135,   83,  143,   83,   83,  140,  146,
			  141,  147,  142,   83,   83,   83,   83,   83,   83,  144,
			   83,   83,  152,   83,  145,  158,   83,  151,   83,   83,
			   83,  153,  159,  160,  169,  154,   83,  157,  155,  156,
			  161,  171,  172,  171,  162,  163,   83,  168,   83,   83,
			  175,   83,  167,   83,   83,  169,   83,   83,  170,   83,
			   83,   83,  176,  173,   83,   83,   83,   83,   83,  180,
			  171,  172,  171,  174,  179,  178,  184,  186,  185,  187,
			   83,  177,  188,  176,  189,  191,  192,  191,  195,  190,

			  180,  193,  194,  193,   83,   83,  197,   83,  197,   83,
			  187,   83,   83,  204,  196,  204,   83,  226,  227,  196,
			  203,  250,   83,   83,   83,  202,  207,  208,  207,  205,
			  191,  192,  191,  206,   83,  210,   83,  193,  194,  193,
			  197,  203,  197,  209,   83,   83,   83,   83,  204,  198,
			  204,  217,  218,  217,   83,  211,  210,  230,  216,   83,
			   83,   83,  207,  208,  207,  215,  238,  219,  221,  222,
			  221,   83,  220,  212,  224,  212,   83,  234,   83,  231,
			  223,  217,  218,  217,  228,  229,  228,  221,  222,  221,
			  225,  232,  225,  236,   83,  228,  229,  228,   83,   83,

			   83,  235,  226,  227,  238,  238,   83,   83,   83,   83,
			   83,  239,   83,   83,   83,   83,  252,   83,  252,  241,
			  240,  244,  247,  253,   83,  253,  242,  245,  251,  243,
			  101,  101,  239,   83,  253,  225,  253,  150,  150,  249,
			  201,  201,  213,  248,  246,   62,   62,   62,   62,  251,
			   43,   43,   43,   43,   43,   43,   43,   46,   46,   46,
			   46,   46,   46,   46,   48,   48,   48,   48,   48,   48,
			   48,   51,   51,   51,   51,   51,   51,   51,   58,   58,
			   58,   58,   58,   72,  212,   72,   72,   72,   72,   72,
			   75,   75,   75,   75,   75,   75,   75,   78,   78,   78,

			   78,   78,   78,   78,   55,   55,   55,   55,   55,   55,
			   55,  118,  118,  118,  118,  118,  166,  166,  166,  166,
			  166,  214,  214,  214,  214,  214,  233,  233,  237,  237,
			  237,  237,  237,   83,  200,  199,  183,  182,  181,  165,
			  164,  149,  148,  134,  133,  132,  116,  115,   80,   77,
			   74,   83,   81,   54,   74,   74,   70,   67,   66,   64,
			   60,   59,   55,   54,  254,   52,   47,   44,    9,  254,
			  254,  254,  254,  254,  254,  254,  254,  254,  254,  254,
			  254,  254,  254,  254,  254,  254,  254,  254,  254,  254,
			  254,  254,  254,  254,  254,  254,  254,  254,  254,  254,

			  254,  254,  254,  254,  254,  254,  254,  254,  254,  254,
			  254,  254,  254,  254,  254,  254, yy_Dummy>>)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    2,    4,
			    2,    2,    6,    6,   31,   35,    2,    2,   37,   11,
			    2,   11,   42,    2,    2,   23,   35,   23,   23,   40,
			    4,   40,   45,   49,   49,   31,   52,   52,   53,   37,
			   53,   56,   56,   42,   57,   59,   57,   57,   60,   61,
			   62,   62,   64,   45,   63,   66,   65,   67,   69,   68,

			   70,   76,   76,   59,   73,   63,   71,   84,   60,   61,
			   65,   69,   64,   70,   73,   79,   79,   67,   85,  250,
			   65,   62,   66,   62,   68,   71,   81,   88,   81,   86,
			   66,   93,   69,   82,   70,   82,   82,   89,   85,   90,
			   84,   91,   86,   88,   92,   94,   93,   95,   89,   96,
			   97,  102,   91,   92,  100,  100,   90,   89,  103,  104,
			   96,  105,  106,   86,  107,  108,   94,  109,  110,  111,
			   95,  112,   97,  114,  105,  106,  113,  122,  102,  119,
			  112,  120,  104,  103,  107,  123,  102,  111,  108,  121,
			  109,  114,  119,  113,  110,  105,  106,  117,  121,  117,

			  117,  124,  122,  125,  120,  126,  127,  123,  128,  129,
			  130,  136,  131,  119,  135,  127,  137,  138,  124,  130,
			  125,  131,  126,  139,  140,  141,  142,  143,  144,  128,
			  147,  153,  136,  145,  129,  142,  146,  135,  151,  152,
			  158,  137,  143,  144,  153,  138,  154,  141,  139,  140,
			  145,  155,  155,  155,  146,  147,  156,  152,  157,  159,
			  158,  155,  151,  160,  161,  153,  163,  162,  154,  167,
			  168,  173,  159,  156,  175,  169,  170,  174,  178,  163,
			  171,  171,  171,  157,  162,  161,  167,  169,  168,  170,
			  179,  160,  173,  159,  174,  176,  176,  176,  178,  175,

			  163,  177,  177,  177,  184,  176,  180,  185,  180,  188,
			  170,  177,  189,  187,  179,  187,  180,  214,  214,  179,
			  185,  248,  196,  187,  220,  184,  190,  190,  190,  188,
			  191,  191,  191,  189,  195,  196,  190,  193,  193,  193,
			  197,  185,  197,  195,  198,  202,  203,  206,  204,  180,
			  204,  205,  205,  205,  209,  198,  196,  220,  203,  211,
			  223,  205,  207,  207,  207,  202,  234,  206,  210,  210,
			  210,  231,  209,  212,  212,  212,  230,  227,  210,  223,
			  211,  217,  217,  217,  219,  219,  219,  221,  221,  221,
			  225,  225,  225,  231,  219,  228,  228,  228,  235,  236,

			  239,  230,  237,  237,  238,  238,  240,  241,  242,  243,
			  244,  235,  246,  245,  247,  249,  252,  216,  252,  239,
			  236,  242,  245,  251,  215,  251,  240,  243,  249,  241,
			  265,  265,  235,  251,  253,  213,  253,  267,  267,  247,
			  269,  269,  200,  246,  244,  260,  260,  260,  260,  249,
			  255,  255,  255,  255,  255,  255,  255,  256,  256,  256,
			  256,  256,  256,  256,  257,  257,  257,  257,  257,  257,
			  257,  258,  258,  258,  258,  258,  258,  258,  259,  259,
			  259,  259,  259,  261,  199,  261,  261,  261,  261,  261,
			  262,  262,  262,  262,  262,  262,  262,  263,  263,  263,

			  263,  263,  263,  263,  264,  264,  264,  264,  264,  264,
			  264,  266,  266,  266,  266,  266,  268,  268,  268,  268,
			  268,  270,  270,  270,  270,  270,  271,  271,  272,  272,
			  272,  272,  272,  186,  182,  181,  166,  165,  164,  149,
			  148,  133,  132,  118,  116,  115,   99,   98,   78,   75,
			   74,   58,   55,   54,   50,   47,   41,   39,   38,   36,
			   30,   28,   20,   12,    9,    8,    5,    3,  254,  254,
			  254,  254,  254,  254,  254,  254,  254,  254,  254,  254,
			  254,  254,  254,  254,  254,  254,  254,  254,  254,  254,
			  254,  254,  254,  254,  254,  254,  254,  254,  254,  254,

			  254,  254,  254,  254,  254,  254,  254,  254,  254,  254,
			  254,  254,  254,  254,  254,  254, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,   27,  564,   46,  563,   50,    0,  563,  564,
			  568,   57,  560,  568,  568,  568,  568,  568,  568,  568,
			  550,  568,  568,   52,  568,  568,  568,  568,  537,    0,
			  527,   29,    0,  568,  568,   31,  526,   33,  526,  536,
			   37,  522,   37,    0,  568,   47,  568,  552,  568,   71,
			  551,  568,   74,   76,  550,  549,   66,   71,  539,   73,
			   76,   77,   78,   82,   80,   84,   83,   85,   87,   86,
			   88,   94,    0,   78,  547,  546,   99,  568,  545,  113,
			  568,  124,  120,    0,   95,  106,  117,  568,  115,  125,
			  127,  129,  132,  119,  133,  135,  137,  138,  518,  523,

			  139,    0,  139,  146,  147,  149,  150,  152,  153,  155,
			  156,  157,  159,  164,  161,  513,  509,  184,  531,  167,
			  169,  177,  165,  173,  189,  191,  193,  194,  196,  197,
			  198,  200,  513,  512,    0,  202,  199,  204,  205,  211,
			  212,  213,  214,  215,  216,  221,  224,  218,  503,  505,
			    0,  226,  227,  219,  234,  249,  244,  246,  228,  247,
			  251,  252,  255,  254,  509,  500,  523,  257,  258,  263,
			  264,  278,  568,  259,  265,  262,  293,  299,  266,  278,
			  304,  502,  505,    0,  292,  295,  521,  311,  297,  300,
			  324,  328,  568,  335,  568,  322,  310,  338,  332,  452,

			  409,    0,  333,  334,  346,  349,  335,  360,  568,  342,
			  366,  347,  371,  403,  305,  412,  405,  379,  568,  382,
			  312,  385,  568,  348,  568,  388,    0,  330,  393,  568,
			  364,  359,  568,    0,  350,  386,  387,  390,  389,  388,
			  394,  395,  396,  397,  398,  401,  400,  402,  289,  403,
			   82,  421,  414,  432,  568,  449,  456,  463,  470,  475,
			  442,  482,  489,  496,  503,  425,  508,  432,  513,  435,
			  518,  521,  525, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  254,    1,  255,  255,  256,  257,  256,  258,  254,
			  254,  254,  254,  254,  254,  254,  254,  254,  254,  254,
			  254,  254,  254,  254,  254,  254,  254,  254,  259,  259,
			  259,  259,  260,  254,  254,  259,  259,  259,  259,  259,
			  259,  259,  259,  261,  254,  261,  254,  254,  254,  262,
			  254,  254,  263,  254,  254,  264,  254,  254,  259,  259,
			  259,  259,  260,  259,  259,  259,  259,  259,  259,  259,
			  259,  259,  261,  261,  254,  262,  262,  254,  263,  263,
			  254,  254,  254,  265,  259,  259,  259,  254,  259,  259,
			  259,  259,  259,  259,  259,  259,  259,  259,  261,  261,

			  254,  266,  259,  259,  259,  259,  259,  259,  259,  259,
			  259,  259,  259,  259,  259,  261,  261,  254,  266,  259,
			  259,  259,  259,  259,  259,  259,  259,  259,  259,  259,
			  259,  259,  261,  261,  267,  259,  259,  259,  259,  259,
			  259,  259,  259,  259,  259,  259,  259,  259,  261,  261,
			  268,  259,  259,  259,  259,  259,  259,  259,  259,  259,
			  259,  259,  259,  259,  261,  261,  268,  259,  259,  259,
			  259,  254,  254,  259,  259,  259,  259,  259,  259,  259,
			  259,  261,  261,  269,  259,  259,  259,  259,  259,  259,
			  259,  254,  254,  254,  254,  259,  259,  254,  259,  261,

			  261,  270,  259,  259,  254,  259,  259,  254,  254,  259,
			  259,  259,  261,  261,  270,  259,  259,  254,  254,  259,
			  259,  254,  254,  259,  254,  261,  271,  254,  254,  254,
			  259,  259,  254,  272,  254,  259,  259,  272,  254,  259,
			  259,  259,  259,  259,  259,  259,  259,  259,  254,  259,
			  254,  259,  254,  254,    0,  254,  254,  254,  254,  254,
			  254,  254,  254,  254,  254,  254,  254,  254,  254,  254,
			  254,  254,  254, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    5,    1,    1,    6,    1,    1,    1,
			    7,    8,    9,   10,   11,   12,   13,   14,   15,   16,
			   16,   16,   16,   16,   16,   16,   16,   16,   17,   18,
			    1,   19,    1,   20,    1,   21,   22,   23,   24,   25,
			   26,   27,   28,   29,   22,   22,   30,   31,   32,   33,
			   34,   22,   35,   36,   37,   38,   39,   22,   22,   40,
			   41,   42,    1,   43,   44,   45,    1,   21,   22,   23,

			   24,   46,   26,   27,   28,   29,   22,   22,   30,   31,
			   32,   33,   34,   22,   35,   36,   37,   38,   47,   22,
			   22,   40,   41,    1,    1,    1,    1,    1,    1,    1,
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
			    0,    1,    1,    2,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    3,    4,    1,    1,    1,
			    1,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    6,    1,    1,    1,    7,    5,    5, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   52,
			   50,    1,    2,   15,   18,   16,   17,    7,    6,   13,
			    5,   11,    8,   50,   14,   12,   10,   19,   49,   49,
			   49,   49,   20,   21,    9,   49,   49,   49,   49,   49,
			   49,   49,   49,   39,   38,   39,   51,   42,   43,   51,
			   42,   45,   51,    1,    2,    3,    0,    0,   49,   49,
			   49,   49,    0,   49,   49,   49,   49,   49,   49,   49,
			   49,   49,   39,   39,   42,    0,    0,   41,    0,    0,
			   44,    4,   46,    0,   49,   49,   49,   47,   49,   49,
			   49,   49,   49,   49,   49,   49,   49,   49,   39,   39,

			    0,    0,   49,   49,   49,   49,   49,   49,   49,   49,
			   49,   49,   49,   49,   49,   39,   39,   46,    0,   49,
			   49,   49,   49,   49,   49,   49,   49,   49,   49,   49,
			   49,   49,   39,   39,    0,   49,   49,   49,   49,   49,
			   49,   49,   49,   49,   49,   49,   49,   49,   39,   39,
			    0,   49,   49,   49,   49,   49,   49,   49,   49,   49,
			   49,   49,   49,   49,   39,   39,    0,   49,   49,   49,
			   49,    0,   30,   49,   49,   49,   49,   49,   49,   49,
			   23,   39,   39,    0,   49,   49,   28,   22,   49,   49,
			   49,    0,   31,    0,   35,   49,   49,   23,   49,   39,

			   39,    0,   49,   49,   22,   49,   49,    0,   34,   49,
			   49,   49,   39,   39,    0,   26,   27,    0,   33,   49,
			   49,    0,   29,   49,   37,   39,    0,    0,    0,   32,
			   49,   49,   36,    0,    0,   49,   49,    0,   48,   49,
			   49,   49,   49,   49,   49,   49,   49,   49,    0,   49,
			    0,   25,   24,   25,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 568
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 254
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 255
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

	yyNb_rules: INTEGER is 51
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 52
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
