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

				last_token := SYM_TEMPLATE_COMPONENT
			
end
else
if yy_act <= 25 then
if yy_act = 24 then
--|#line 100 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 100")
end

				last_token := SYM_TEMPLATE
			
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
			   29,   29,   32,   33,   34,   10,   28,   30,   29,   29,
			   35,   44,   36,   37,   49,   50,   67,   59,   38,   39,
			  240,   53,   40,   53,  236,   41,   42,   56,   63,   57,
			   57,   68,   45,   69,   83,   35,   36,   42,   76,   77,
			   83,   67,   79,   80,   53,   83,   53,   82,   82,   56,
			   83,   57,   57,   83,   85,   87,   87,   83,   84,   83,

			   83,   88,   83,   83,   83,   86,   76,   77,   98,   83,
			   81,   90,   81,   89,   79,   80,   95,   96,   99,   83,
			   93,   91,   83,   83,   83,   88,   92,   94,   97,  100,
			   83,   82,   82,   83,   83,   83,   92,  104,   94,  106,
			   83,  105,  103,  105,  105,  107,  109,  108,  111,  110,
			   83,   83,  102,   83,  103,   83,  117,  118,  118,   83,
			   83,  105,  114,  105,  105,   83,   83,   83,   83,  107,
			  109,  112,   83,   83,  110,   83,  113,  115,   83,  124,
			  117,  125,   83,   83,  121,   83,  114,  120,  122,   83,
			  127,  123,  126,   83,  131,  121,  128,  120,   83,   83,

			  130,  129,  100,  140,  118,  118,  132,   83,   83,   83,
			   83,  133,  137,   83,  140,   83,  139,   83,   83,  131,
			   83,  138,  145,   83,   83,   83,  142,  143,   83,   83,
			  141,   83,  144,  148,  149,   83,   83,   83,  146,   83,
			   83,  139,   83,  147,   83,  155,  153,  145,  160,  154,
			   83,   83,  161,  159,  147,  162,  155,  156,  148,  149,
			  157,  158,  164,  166,   83,   83,  169,  163,   83,   83,
			   83,  157,  158,  160,  166,   83,  165,   83,  171,  173,
			  174,  173,  170,   83,   83,   83,  175,  165,  178,   83,
			  172,   83,  184,   83,   83,  176,   83,  177,   83,   83,

			   83,   83,  181,  184,  182,  180,  176,   83,  188,   83,
			  186,  179,  187,  189,  173,  174,  173,   83,  191,  190,
			  193,  194,  193,   83,  192,   83,  195,  196,  195,  197,
			   83,   83,  199,  199,  199,  192,   83,   83,  205,   83,
			  232,  198,   83,   83,  204,   83,  198,  206,  206,  206,
			  213,  207,  209,  210,  209,   83,  212,   83,  208,  193,
			  194,  193,   83,  195,  196,  195,   83,   83,  199,  199,
			  199,   83,   83,  222,  213,  200,  211,  206,  206,  206,
			  219,  220,  219,  218,   83,   83,  217,  209,  210,  209,
			   83,  227,  221,  223,  224,  223,  214,  226,  214,  228,

			  229,  211,   83,   83,  233,  225,  219,  220,  219,  230,
			  231,  230,  223,  224,  223,  227,  234,  227,   83,   83,
			  230,  231,  230,   83,   83,  228,  229,  237,  240,  240,
			   83,   83,   83,   83,   83,   83,  241,   83,  237,   83,
			  238,   83,   83,  215,  214,  242,  246,   83,  249,  243,
			  253,  244,  247,  202,  245,  248,  201,  185,  252,  252,
			  252,  252,  252,  252,  183,  167,  250,  251,   83,  254,
			  254,  254,  151,  249,  254,  254,  254,  250,  251,   83,
			   43,   43,   43,   43,   43,   43,   43,   46,   46,   46,
			   46,   46,   46,   46,   48,   48,   48,   48,   48,   48,

			   48,   51,   51,   51,   51,   51,   51,   51,   58,   58,
			   58,   58,   58,   72,  150,   72,   72,   72,   72,   72,
			   75,   75,   75,   75,   75,   75,   75,   78,   78,   78,
			   78,   78,   78,   78,   55,   55,   55,   55,   55,   55,
			   55,  101,  101,  101,  119,  119,  119,  119,  119,  152,
			  152,  152,  168,  168,  168,  168,  168,  203,  203,  203,
			  216,  216,  216,  216,  216,  235,  235,  235,  239,  239,
			  239,  239,  239,  136,  135,  134,  116,   80,   77,   74,
			   83,   81,   54,   74,   74,   73,   71,   70,   66,   65,
			   64,   62,   61,   60,   59,   55,   54,  255,   52,   47,

			   44,    9,  255,  255,  255,  255,  255,  255,  255,  255,
			  255,  255,  255,  255,  255,  255,  255,  255,  255,  255,
			  255,  255,  255,  255,  255,  255,  255,  255,  255,  255,
			  255,  255,  255,  255,  255,  255,  255,  255,  255,  255,
			  255,  255,  255,  255,  255,  255,  255,  255,  255,  255,
			  255, yy_Dummy>>)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    2,    4,    2,    2,    6,    6,   39,   35,    2,    2,
			  236,   11,    2,   11,  229,    2,    2,   23,   35,   23,
			   23,   40,    4,   40,   60,    2,    2,    2,   49,   49,
			   59,   39,   52,   52,   53,   61,   53,   56,   56,   57,
			   63,   57,   57,   64,   60,   62,   62,   65,   59,   66,

			   67,   63,   68,   69,   70,   61,   76,   76,   73,   71,
			   81,   65,   81,   64,   79,   79,   69,   70,   73,   84,
			   67,   65,   85,   88,   86,   63,   66,   68,   71,   82,
			   90,   82,   82,   93,   89,   91,   66,   86,   68,   88,
			   92,   87,   85,   87,   87,   89,   91,   90,   93,   92,
			   94,   96,   84,   95,   89,   97,   99,  100,  100,  103,
			  102,  105,   96,  105,  105,  104,  106,  109,  107,   89,
			   91,   94,  108,  110,   92,  111,   95,   97,  124,  106,
			   99,  107,  112,  218,  103,  113,   96,  102,  104,  114,
			  109,  105,  108,  115,  113,  103,  110,  102,  121,  120,

			  112,  111,  118,  124,  118,  118,  114,  122,  125,  126,
			  127,  115,  120,  129,  124,  128,  122,  130,  131,  113,
			  139,  121,  129,  137,  132,  133,  126,  127,  138,  140,
			  125,  143,  128,  132,  133,  141,  142,  145,  130,  144,
			  146,  122,  153,  131,  148,  139,  137,  129,  144,  138,
			  147,  149,  145,  143,  131,  146,  139,  140,  132,  133,
			  141,  142,  148,  150,  154,  155,  153,  147,  156,  158,
			  159,  141,  142,  144,  150,  161,  149,  160,  155,  157,
			  157,  157,  154,  162,  163,  164,  158,  149,  161,  157,
			  156,  165,  167,  169,  170,  159,  171,  160,  175,  177,

			  172,  176,  164,  167,  165,  163,  159,  222,  171,  180,
			  169,  162,  170,  172,  173,  173,  173,  181,  176,  175,
			  178,  178,  178,  186,  177,  187,  179,  179,  179,  180,
			  178,  190,  182,  182,  182,  177,  179,  191,  187,  200,
			  222,  181,  182,  198,  186,  217,  181,  189,  189,  189,
			  200,  190,  192,  192,  192,  211,  198,  189,  191,  193,
			  193,  193,  192,  195,  195,  195,  204,  197,  199,  199,
			  199,  205,  208,  211,  200,  182,  197,  206,  206,  206,
			  207,  207,  207,  205,  213,  225,  204,  209,  209,  209,
			  207,  215,  208,  212,  212,  212,  214,  214,  214,  216,

			  216,  197,  232,  212,  225,  213,  219,  219,  219,  221,
			  221,  221,  223,  223,  223,  227,  227,  227,  233,  221,
			  230,  230,  230,  237,  238,  239,  239,  232,  240,  240,
			  241,  242,  243,  244,  245,  246,  237,  251,  232,  247,
			  233,  248,  249,  202,  201,  238,  244,  188,  247,  241,
			  251,  242,  245,  184,  243,  246,  183,  168,  250,  250,
			  250,  252,  252,  252,  166,  151,  248,  249,  250,  253,
			  253,  253,  135,  247,  254,  254,  254,  248,  249,  253,
			  256,  256,  256,  256,  256,  256,  256,  257,  257,  257,
			  257,  257,  257,  257,  258,  258,  258,  258,  258,  258,

			  258,  259,  259,  259,  259,  259,  259,  259,  260,  260,
			  260,  260,  260,  261,  134,  261,  261,  261,  261,  261,
			  262,  262,  262,  262,  262,  262,  262,  263,  263,  263,
			  263,  263,  263,  263,  264,  264,  264,  264,  264,  264,
			  264,  265,  265,  265,  266,  266,  266,  266,  266,  267,
			  267,  267,  268,  268,  268,  268,  268,  269,  269,  269,
			  270,  270,  270,  270,  270,  271,  271,  271,  272,  272,
			  272,  272,  272,  119,  117,  116,   98,   78,   75,   74,
			   58,   55,   54,   50,   47,   45,   42,   41,   38,   37,
			   36,   32,   31,   30,   28,   20,   12,    9,    8,    5,

			    3,  255,  255,  255,  255,  255,  255,  255,  255,  255,
			  255,  255,  255,  255,  255,  255,  255,  255,  255,  255,
			  255,  255,  255,  255,  255,  255,  255,  255,  255,  255,
			  255,  255,  255,  255,  255,  255,  255,  255,  255,  255,
			  255,  255,  255,  255,  255,  255,  255,  255,  255,  255,
			  255, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,   29,  597,   48,  596,   52,    0,  596,  597,
			  601,   59,  593,  601,  601,  601,  601,  601,  601,  601,
			  583,  601,  601,   54,  601,  601,  601,  601,  570,    0,
			  560,  567,  545,  601,  601,   33,  557,  564,  556,   35,
			   39,  553,  561,    0,  601,  560,  601,  581,  601,   76,
			  580,  601,   80,   82,  579,  578,   72,   76,  568,   68,
			   62,   73,   48,   78,   81,   85,   87,   88,   90,   91,
			   92,   97,    0,   82,  576,  575,  104,  601,  574,  112,
			  601,  108,  116,    0,  107,  110,  112,  128,  111,  122,
			  118,  123,  128,  121,  138,  141,  139,  143,  547,  133,

			  142,    0,  148,  147,  153,  148,  154,  156,  160,  155,
			  161,  163,  170,  173,  177,  181,  543,  539,  189,  561,
			  187,  186,  195,  601,  166,  196,  197,  198,  203,  201,
			  205,  206,  212,  213,  485,  443,    0,  211,  216,  208,
			  217,  223,  224,  219,  227,  225,  228,  238,  232,  239,
			  226,  431,    0,  230,  252,  253,  256,  277,  257,  258,
			  265,  263,  271,  272,  273,  279,  435,  255,  444,  281,
			  282,  284,  288,  312,  601,  286,  289,  287,  318,  324,
			  297,  305,  330,  423,  424,    0,  311,  313,  435,  345,
			  319,  325,  350,  357,  601,  361,  601,  355,  331,  366,

			  327,  412,  410,    0,  354,  359,  375,  378,  360,  385,
			  601,  343,  391,  372,  394,  359,  387,  333,  171,  404,
			  601,  407,  295,  410,  601,  373,  601,  413,    0,   15,
			  418,  601,  390,  406,  601,    0,   44,  411,  412,  413,
			  413,  418,  419,  420,  421,  422,  423,  427,  429,  430,
			  456,  425,  459,  467,  472,  601,  479,  486,  493,  500,
			  505,  512,  519,  526,  533,  536,  541,  544,  549,  552,
			  557,  560,  565, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  255,    1,  256,  256,  257,  258,  257,  259,  255,
			  255,  255,  255,  255,  255,  255,  255,  255,  255,  255,
			  255,  255,  255,  255,  255,  255,  255,  255,  260,  260,
			  260,  260,  255,  255,  255,  260,  260,  260,  260,  260,
			  260,  260,  260,  261,  255,  261,  255,  255,  255,  262,
			  255,  255,  263,  255,  255,  264,  255,  255,  260,  260,
			  260,  260,  255,  260,  260,  260,  260,  260,  260,  260,
			  260,  260,  261,  261,  255,  262,  262,  255,  263,  263,
			  255,  255,  255,  265,  260,  260,  260,  255,  260,  260,
			  260,  260,  260,  260,  260,  260,  260,  260,  261,  261,

			  255,  266,  260,  260,  260,  255,  260,  260,  260,  260,
			  260,  260,  260,  260,  260,  260,  261,  261,  255,  266,
			  260,  260,  260,  255,  260,  260,  260,  260,  260,  260,
			  260,  260,  260,  260,  261,  261,  267,  260,  260,  260,
			  260,  260,  260,  260,  260,  260,  260,  260,  260,  260,
			  261,  261,  268,  260,  260,  260,  260,  260,  260,  260,
			  260,  260,  260,  260,  260,  260,  261,  261,  268,  260,
			  260,  260,  260,  255,  255,  260,  260,  260,  260,  260,
			  260,  260,  260,  261,  261,  269,  260,  260,  260,  260,
			  260,  260,  260,  255,  255,  255,  255,  260,  260,  255,

			  260,  261,  261,  270,  260,  260,  255,  260,  260,  255,
			  255,  260,  260,  260,  261,  261,  270,  260,  260,  255,
			  255,  260,  260,  255,  255,  260,  255,  261,  271,  255,
			  255,  255,  260,  260,  255,  272,  255,  260,  260,  272,
			  255,  260,  260,  260,  260,  260,  260,  260,  260,  260,
			  260,  260,  255,  260,  255,    0,  255,  255,  255,  255,
			  255,  255,  255,  255,  255,  255,  255,  255,  255,  255,
			  255,  255,  255, yy_Dummy>>)
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
			   41,   42,    1,   43,   44,   45,    1,   46,   22,   47,

			   24,   25,   26,   27,   28,   29,   22,   22,   30,   31,
			   32,   33,   34,   22,   35,   36,   48,   38,   49,   22,
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
			    1,    5,    5,    5,    6,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    7,    1,    1,    1,    3,    5,    5,    5,    5, yy_Dummy>>)
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
			   44,    4,   46,    0,   49,   49,   49,    0,   49,   49,
			   49,   49,   49,   49,   49,   49,   49,   49,   39,   39,

			    0,    0,   49,   49,   49,    0,   49,   49,   49,   49,
			   49,   49,   49,   49,   49,   49,   39,   39,   46,    0,
			   49,   49,   49,   47,   49,   49,   49,   49,   49,   49,
			   49,   49,   49,   49,   39,   39,    0,   49,   49,   49,
			   49,   49,   49,   49,   49,   49,   49,   49,   49,   49,
			   39,   39,    0,   49,   49,   49,   49,   49,   49,   49,
			   49,   49,   49,   49,   49,   49,   39,   39,    0,   49,
			   49,   49,   49,    0,   30,   49,   49,   49,   49,   49,
			   49,   49,   49,   39,   39,    0,   49,   49,   28,   49,
			   49,   49,   49,    0,   31,    0,   35,   49,   49,   24,

			   49,   39,   39,    0,   49,   49,   22,   49,   49,    0,
			   34,   49,   49,   49,   39,   39,    0,   26,   27,    0,
			   33,   49,   49,    0,   29,   49,   37,   39,    0,    0,
			    0,   32,   49,   49,   36,    0,    0,   49,   49,    0,
			   48,   49,   49,   49,   49,   49,   49,   49,   49,   49,
			   49,   49,   23,   49,   25,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 601
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 255
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 256
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
