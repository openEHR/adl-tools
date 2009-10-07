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
if yy_act <= 25 then
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
if yy_act <= 19 then
if yy_act <= 16 then
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
--|#line 82 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 82")
end
last_token := Left_parenthesis_code
end
else
if yy_act <= 18 then
if yy_act = 17 then
--|#line 83 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 83")
end
last_token := Right_parenthesis_code
else
--|#line 84 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 84")
end
last_token := Dollar_code
end
else
--|#line 85 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 85")
end
last_token := Question_mark_code
end
end
else
if yy_act <= 22 then
if yy_act <= 21 then
if yy_act = 20 then
--|#line 87 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 87")
end
last_token := Left_bracket_code
else
--|#line 88 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 88")
end
last_token := Right_bracket_code
end
else
--|#line 92 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 92")
end

				last_token := SYM_TEMPLATE
			
end
else
if yy_act <= 24 then
if yy_act = 23 then
--|#line 96 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 96")
end

				last_token := SYM_ARCHETYPE
			
else
--|#line 100 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 100")
end

				last_token := SYM_ADL_VERSION
			
end
else
--|#line 104 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 104")
end

				last_token := SYM_IS_CONTROLLED
			
end
end
end
end
else
if yy_act <= 37 then
if yy_act <= 31 then
if yy_act <= 28 then
if yy_act <= 27 then
if yy_act = 26 then
--|#line 108 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 108")
end

				last_token := SYM_IS_GENERATED
			
else
--|#line 112 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 112")
end

				last_token := SYM_SPECIALIZE
				in_lineno := in_lineno + 1
			
end
else
--|#line 118 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 118")
end

				last_token := SYM_CONCEPT
				in_lineno := in_lineno + 1
			
end
else
if yy_act <= 30 then
if yy_act = 29 then
--|#line 123 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 123")
end

				last_token := SYM_LANGUAGE
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				language_text_start_line := in_lineno
			
else
--|#line 130 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 130")
end

				last_token := SYM_DESCRIPTION
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				description_text_start_line := in_lineno
			
end
else
--|#line 137 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 137")
end

				last_token := SYM_DEFINITION
				set_start_condition(IN_CADL_SECTION)
				in_lineno := in_lineno + 1
				definition_text_start_line := in_lineno
			
end
end
else
if yy_act <= 34 then
if yy_act <= 33 then
if yy_act = 32 then
--|#line 144 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 144")
end

				last_token := SYM_INVARIANT
				set_start_condition(IN_ASSERTION_SECTION)
				in_lineno := in_lineno + 1
				invariant_text_start_line := in_lineno
			
else
--|#line 151 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 151")
end

				last_token := SYM_ONTOLOGY
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				ontology_text_start_line := in_lineno
			
end
else
--|#line 159 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 159")
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
if yy_act <= 36 then
if yy_act = 35 then
--|#line 160 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 160")
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
--|#line 177 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 177")
end
 -- LF
				in_buffer.append_character('%N')
				in_lineno := in_lineno + 1
			
end
else
--|#line 181 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 181")
end
 -- any text on line with no LF
				in_buffer.append_string(text)
			
end
end
end
else
if yy_act <= 43 then
if yy_act <= 40 then
if yy_act <= 39 then
if yy_act = 38 then
--|#line 193 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 193")
end

		-- ignore unmatched chars
	
else
--|#line 199 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 199")
end

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
end
else
--|#line 203 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 203")
end
in_lineno := in_lineno + text_count
end
else
if yy_act <= 42 then
if yy_act = 41 then
--|#line 205 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 205")
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
--|#line 217 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 217")
end

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
end
else
--|#line 221 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 221")
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
if yy_act <= 46 then
if yy_act <= 45 then
if yy_act = 44 then
--|#line 233 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 233")
end

					last_token := V_VERSION_STRING
					last_string_value := text_substring (1, text_count)
			
else
--|#line 239 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 239")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
else
--|#line 245 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 245")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
end
else
if yy_act <= 48 then
if yy_act = 47 then
--|#line 251 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 251")
end

					last_token := V_IDENTIFIER
					last_string_value := text
			
else
--|#line 258 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 258")
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
			   29,   29,   32,   33,   34,   10,   29,   35,   44,   36,
			   37,   49,   50,  221,   59,   38,   39,   82,   53,   40,
			   53,  219,   41,   42,   56,   63,   57,   57,   82,   45,
			   75,   76,   78,   79,   53,   83,   53,   81,   81,   56,
			   82,   57,   57,   62,   62,   82,   82,   82,   84,   82,
			   82,   82,   96,   82,   82,   82,   87,   75,   76,   82,

			   85,   89,   97,   80,   94,   80,   88,   78,   79,   92,
			   82,   90,  102,   95,   86,   82,   62,   91,   93,   98,
			   82,   81,   81,   82,   91,   82,   82,   82,  100,   82,
			  101,  103,   82,   82,  104,  107,  106,  105,  114,  114,
			   82,   82,  108,  101,  110,   82,   82,   82,   82,   82,
			  109,   82,   82,   82,  111,   82,   82,   82,   82,  119,
			  120,   98,   82,  114,  114,   82,  117,  116,  118,  121,
			  126,  122,   82,  125,  116,  123,  127,  124,  131,  132,
			   82,  133,  134,   82,  135,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,  139,   82,  136,  141,  142,

			  137,   82,  138,   82,   82,   82,   82,   82,  140,   82,
			   82,  146,  147,  153,   82,   82,   82,  148,  152,  150,
			  154,  149,  155,  163,  156,   82,  151,   82,  157,  165,
			  166,  165,  162,  161,   82,   82,   82,  164,   82,   82,
			   82,  168,  167,   82,   82,   82,   82,  169,  170,   82,
			   82,  173,  189,  172,  189,   82,  179,  177,  180,  213,
			  214,  178,  171,  165,  166,  165,  182,  181,  184,  185,
			  184,  186,  187,  186,   82,  183,   82,   82,   82,  188,
			  189,   82,  189,  195,  188,  195,   82,  213,  214,  194,
			   82,   82,  195,   82,  195,  193,   82,  196,  198,  199,

			  198,  184,  185,  184,  186,  187,  186,  197,   82,  200,
			   82,  204,   82,  206,  207,  206,  198,  199,  198,  209,
			  210,  209,  205,   82,  201,  211,  201,  221,  221,   82,
			   99,   99,  208,  206,  207,  206,  215,  216,  215,  209,
			  210,  209,  212,  217,  212,   82,   82,  215,  216,  215,
			   43,   43,   43,   43,   43,   43,   43,   46,   46,   46,
			   46,   46,   46,   46,   48,   48,   48,   48,   48,   48,
			   48,   51,   51,   51,   51,   51,   51,   51,   58,   58,
			   58,   58,   58,   62,   62,   62,   62,   71,   82,   71,
			   71,   71,   71,   71,   74,   74,   74,   74,   74,   74,

			   74,   77,   77,   77,   77,   77,   77,   77,   55,   55,
			   55,   55,   55,   55,   55,  115,  115,  115,  115,  115,
			  145,  145,  160,  160,  160,  160,  160,  192,  192,  203,
			  203,  203,  203,  203,  218,  218,  220,  220,  220,  220,
			  220,  212,  202,  201,   82,  191,  190,  176,  175,  174,
			  159,  158,  144,  143,  130,  129,  128,  113,  112,   79,
			   76,   73,   82,   80,   54,   73,   73,   72,   70,   69,
			   68,   67,   66,   65,   64,   61,   60,   59,   55,   54,
			  222,   52,   47,   44,    9,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,

			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222, yy_Dummy>>)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    2,    4,    2,
			    2,    6,    6,  219,   35,    2,    2,   59,   11,    2,
			   11,  214,    2,    2,   23,   35,   23,   23,   60,    4,
			   49,   49,   52,   52,   53,   59,   53,   56,   56,   57,
			   61,   57,   57,   62,   62,   63,   64,   65,   60,   67,
			   66,   69,   72,   68,   70,   83,   63,   75,   75,   85,

			   61,   65,   72,   80,   69,   80,   64,   78,   78,   67,
			   84,   65,   85,   70,   62,   87,   62,   66,   68,   81,
			   89,   81,   81,   88,   66,   90,   91,   92,   83,   93,
			   84,   87,   95,   94,   88,   91,   90,   89,   98,   98,
			  100,  101,   92,   88,   94,  102,  103,  104,  106,  105,
			   93,  108,  107,  110,   95,  109,  117,  119,  111,  103,
			  104,  114,  120,  114,  114,  116,  101,  100,  102,  105,
			  110,  106,  118,  109,  100,  107,  111,  108,  116,  117,
			  121,  118,  119,  122,  120,  123,  124,  125,  131,  126,
			  127,  132,  133,  134,  135,  124,  137,  121,  126,  127,

			  122,  136,  123,  142,  138,  139,  141,  140,  125,  146,
			  148,  131,  132,  138,  147,  149,  152,  133,  137,  135,
			  139,  134,  140,  148,  141,  151,  136,  153,  142,  150,
			  150,  150,  147,  146,  155,  154,  156,  149,  157,  150,
			  161,  152,  151,  162,  163,  164,  167,  153,  154,  168,
			  169,  157,  189,  156,  189,  172,  163,  161,  164,  203,
			  203,  162,  155,  165,  165,  165,  168,  167,  170,  170,
			  170,  171,  171,  171,  177,  169,  178,  181,  170,  172,
			  173,  171,  173,  180,  172,  180,  182,  220,  220,  178,
			  173,  193,  195,  180,  195,  177,  188,  181,  183,  183,

			  183,  184,  184,  184,  186,  186,  186,  182,  183,  188,
			  194,  193,  197,  196,  196,  196,  198,  198,  198,  200,
			  200,  200,  194,  196,  201,  201,  201,  221,  221,  200,
			  233,  233,  197,  206,  206,  206,  208,  208,  208,  209,
			  209,  209,  212,  212,  212,  205,  208,  215,  215,  215,
			  223,  223,  223,  223,  223,  223,  223,  224,  224,  224,
			  224,  224,  224,  224,  225,  225,  225,  225,  225,  225,
			  225,  226,  226,  226,  226,  226,  226,  226,  227,  227,
			  227,  227,  227,  228,  228,  228,  228,  229,  204,  229,
			  229,  229,  229,  229,  230,  230,  230,  230,  230,  230,

			  230,  231,  231,  231,  231,  231,  231,  231,  232,  232,
			  232,  232,  232,  232,  232,  234,  234,  234,  234,  234,
			  235,  235,  236,  236,  236,  236,  236,  237,  237,  238,
			  238,  238,  238,  238,  239,  239,  240,  240,  240,  240,
			  240,  202,  191,  190,  179,  175,  174,  160,  159,  158,
			  144,  143,  129,  128,  115,  113,  112,   97,   96,   77,
			   74,   73,   58,   55,   54,   50,   47,   45,   42,   41,
			   40,   39,   38,   37,   36,   31,   30,   28,   20,   12,
			    9,    8,    5,    3,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,

			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,   26,  480,   45,  479,   49,    0,  479,  480,
			  484,   56,  476,  484,  484,  484,  484,  484,  484,  484,
			  466,  484,  484,   51,  484,  484,  484,  484,  453,    0,
			  443,  450,    0,  484,  484,   30,  441,  448,  440,  450,
			  438,  435,  443,    0,  484,  442,  484,  463,  484,   68,
			  462,  484,   70,   72,  461,  460,   62,   66,  450,   45,
			   56,   68,   71,   73,   74,   75,   78,   77,   81,   79,
			   82,    0,   66,  458,  457,   95,  484,  456,  105,  484,
			  101,  106,    0,   83,   98,   87,  484,  103,  111,  108,
			  113,  114,  115,  117,  121,  120,  429,  434,  123,    0,

			  128,  129,  133,  134,  135,  137,  136,  140,  139,  143,
			  141,  146,  424,  420,  148,  442,  153,  144,  160,  145,
			  150,  168,  171,  173,  174,  175,  177,  178,  424,  423,
			    0,  176,  179,  180,  181,  182,  189,  184,  192,  193,
			  195,  194,  191,  414,  416,    0,  197,  202,  198,  203,
			  227,  213,  204,  215,  223,  222,  224,  226,  420,  411,
			  434,  228,  231,  232,  233,  261,  484,  234,  237,  238,
			  266,  269,  243,  278,  413,  416,    0,  262,  264,  432,
			  281,  265,  274,  296,  299,  484,  302,  484,  284,  250,
			  411,  409,    0,  279,  298,  290,  311,  300,  314,  484,

			  317,  322,  409,  247,  376,  333,  331,  484,  334,  337,
			  484,  484,  340,    0,   15,  345,  484,  484,    0,   37,
			  275,  312,  484,  349,  356,  363,  370,  375,  380,  386,
			  393,  400,  407,  325,  412,  415,  419,  422,  426,  429,
			  433, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  222,    1,  223,  223,  224,  225,  224,  226,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  227,  227,
			  227,  227,  228,  222,  222,  227,  227,  227,  227,  227,
			  227,  227,  227,  229,  222,  229,  222,  222,  222,  230,
			  222,  222,  231,  222,  222,  232,  222,  222,  227,  227,
			  227,  227,  228,  227,  227,  227,  227,  227,  227,  227,
			  227,  229,  229,  222,  230,  230,  222,  231,  231,  222,
			  222,  222,  233,  227,  227,  227,  222,  227,  227,  227,
			  227,  227,  227,  227,  227,  227,  229,  229,  222,  234,

			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  229,  229,  222,  234,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  229,  229,
			  235,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  229,  229,  236,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  229,  229,
			  236,  227,  227,  227,  227,  222,  222,  227,  227,  227,
			  227,  227,  227,  227,  229,  229,  237,  227,  227,  227,
			  227,  227,  227,  227,  222,  222,  222,  222,  227,  222,
			  229,  229,  238,  227,  227,  222,  227,  227,  222,  222,

			  227,  229,  229,  238,  227,  227,  222,  222,  227,  222,
			  222,  222,  229,  239,  222,  222,  222,  222,  240,  222,
			  240,  222,    0,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222, yy_Dummy>>)
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

			   24,   25,   26,   27,   28,   29,   22,   22,   30,   31,
			   32,   33,   34,   22,   35,   36,   37,   38,   46,   22,
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
			    5,    6,    1,    1,    1,    7,    5, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   50,
			   48,    1,    2,   15,   18,   16,   17,    7,    6,   13,
			    5,   11,    8,   48,   14,   12,   10,   19,   47,   47,
			   47,   47,   20,   21,    9,   47,   47,   47,   47,   47,
			   47,   47,   47,   37,   36,   37,   49,   40,   41,   49,
			   40,   43,   49,    1,    2,    3,    0,    0,   47,   47,
			   47,   47,    0,   47,   47,   47,   47,   47,   47,   47,
			   47,   37,   37,   40,    0,    0,   39,    0,    0,   42,
			    4,   44,    0,   47,   47,   47,   45,   47,   47,   47,
			   47,   47,   47,   47,   47,   47,   37,   37,    0,    0,

			   47,   47,   47,   47,   47,   47,   47,   47,   47,   47,
			   47,   47,   37,   37,   44,    0,   47,   47,   47,   47,
			   47,   47,   47,   47,   47,   47,   47,   47,   37,   37,
			    0,   47,   47,   47,   47,   47,   47,   47,   47,   47,
			   47,   47,   47,   37,   37,    0,   47,   47,   47,   47,
			   47,   47,   47,   47,   47,   47,   47,   47,   37,   37,
			    0,   47,   47,   47,   47,    0,   28,   47,   47,   47,
			   47,   47,   47,   22,   37,   37,    0,   47,   47,   26,
			   23,   47,   47,   47,    0,   29,    0,   33,   47,   22,
			   37,   37,    0,   47,   47,   23,   47,   47,    0,   32,

			   47,   37,   37,    0,   24,   25,    0,   31,   47,    0,
			   27,   35,   37,    0,    0,    0,   30,   34,    0,    0,
			    0,   46,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 484
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 222
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 223
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

	yyNb_rules: INTEGER is 49
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 50
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
