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
			   29,   29,   32,   33,   34,   10,   28,   30,   29,   29,
			   29,   35,   44,   36,   37,   49,   50,   61,   59,   38,
			   39,   65,   53,   40,   53,   67,   41,   42,   56,   63,
			   57,   57,   68,   45,   69,   71,   35,   36,   73,   42,
			   61,   76,   77,   83,   65,   79,   80,   53,   83,   53,
			   67,   82,   82,   56,   83,   57,   57,   87,   71,   87,

			   83,   73,   83,   85,   83,   83,   84,   83,   83,   98,
			   83,   88,   83,  252,   86,   83,   76,   77,   90,   99,
			   79,   80,   89,   95,   81,   96,   81,   93,   91,   83,
			   83,   83,   92,   94,   97,   88,  100,   83,   82,   82,
			   83,   83,   83,   92,  104,   94,   95,   83,   96,  105,
			  103,  105,  105,  106,   83,   83,  111,  108,  109,   83,
			   83,   83,  102,  112,  117,  107,   83,  104,  110,  118,
			  118,  114,   83,   83,  103,   83,   83,  105,  113,  105,
			  105,   83,  109,  115,   83,   83,   83,   83,  117,  107,
			   83,  121,   83,  110,  124,  114,  122,  125,  127,  120,

			   83,  131,  129,  121,  132,  126,   83,  123,  130,  128,
			  120,  100,   83,  118,  118,   83,   83,  124,  133,  137,
			  125,   83,   83,   83,  139,   83,  131,   83,   83,   83,
			   83,   83,   83,   83,  145,  138,   83,  148,   83,  142,
			  143,  140,  137,  141,  144,  149,   83,   83,  240,  139,
			  146,   83,  236,  140,  153,  147,   83,  155,   83,  145,
			   83,  156,  148,  157,   83,  160,   83,  147,  154,  155,
			  149,  158,   83,  159,  166,  157,  164,  163,   83,  161,
			   83,  162,   83,  158,   83,   83,  166,   83,   83,   83,
			  160,  173,  174,  173,   83,  171,   83,  165,  170,   83,

			  184,   83,  169,   83,  175,   83,  172,  178,  177,  165,
			  176,   83,  184,  181,   83,   83,  182,  179,  171,   83,
			  180,   83,  176,  187,   83,   83,  188,   83,  186,  199,
			  178,  199,  189,  173,  174,  173,  190,   83,  191,  182,
			  193,  194,  193,  195,  196,  195,   83,  197,   83,  192,
			   83,   83,  199,   83,  199,  189,   83,  206,  204,  206,
			   83,  192,   83,   83,  205,   83,   83,   83,  207,  211,
			  198,  209,  210,  209,   83,  198,  212,  208,  193,  194,
			  193,   83,  195,  196,  195,  213,  217,  205,   83,  206,
			   83,  206,  227,   83,  211,  200,  219,  220,  219,  212,

			  218,  209,  210,  209,   83,   83,   83,  228,  229,  213,
			  221,  222,  223,  224,  223,  214,  226,  214,  219,  220,
			  219,   83,   83,   83,   83,  225,  230,  231,  230,  223,
			  224,  223,  227,  234,  227,   83,   83,   83,  232,   83,
			  233,  230,  231,  230,  228,  229,  238,   83,  237,   83,
			  241,  240,  240,   83,   83,   83,  242,   83,  243,   83,
			  237,   83,  254,   83,  215,  214,  246,  244,  249,   83,
			  202,  245,  247,  241,  254,  255,  253,  255,  254,  255,
			  254,  255,  101,  101,  101,   83,  251,  201,  250,  185,
			  183,  248,  167,  249,  152,  152,  152,  151,  251,  253,

			   43,   43,   43,   43,   43,   43,   43,   46,   46,   46,
			   46,   46,   46,   46,   48,   48,   48,   48,   48,   48,
			   48,   51,   51,   51,   51,   51,   51,   51,   58,   58,
			   58,   58,   58,   72,  150,   72,   72,   72,   72,   72,
			   75,   75,   75,   75,   75,   75,   75,   78,   78,   78,
			   78,   78,   78,   78,   55,   55,   55,   55,   55,   55,
			   55,  119,  119,  119,  119,  119,  168,  168,  168,  168,
			  168,  203,  203,  203,  216,  216,  216,  216,  216,  235,
			  235,  235,  239,  239,  239,  239,  239,  136,  135,  134,
			  116,   80,   77,   74,   83,   81,   54,   74,   74,   70,

			   66,   64,   62,   60,   59,   55,   54,  256,   52,   47,
			   44,    9,  256,  256,  256,  256,  256,  256,  256,  256,
			  256,  256,  256,  256,  256,  256,  256,  256,  256,  256,
			  256,  256,  256,  256,  256,  256,  256,  256,  256,  256,
			  256,  256,  256,  256,  256,  256,  256,  256,  256,  256,
			  256,  256,  256,  256,  256,  256,  256,  256,  256,  256,
			  256,  256, yy_Dummy>>)
		end

	yy_chk_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    2,    4,    2,    2,    6,    6,   31,   35,    2,
			    2,   37,   11,    2,   11,   39,    2,    2,   23,   35,
			   23,   23,   40,    4,   40,   42,    2,    2,   45,    2,
			   31,   49,   49,   60,   37,   52,   52,   53,   59,   53,
			   39,   56,   56,   57,   61,   57,   57,   62,   42,   62,

			   63,   45,   64,   60,   65,   66,   59,   67,   68,   73,
			   69,   63,   70,  250,   61,   71,   76,   76,   65,   73,
			   79,   79,   64,   69,   81,   70,   81,   67,   65,   84,
			   85,   86,   66,   68,   71,   63,   82,   88,   82,   82,
			   90,   93,   94,   66,   86,   68,   69,   91,   70,   87,
			   85,   87,   87,   88,   89,   95,   93,   90,   91,   92,
			   96,   97,   84,   94,   99,   89,  103,   86,   92,  100,
			  100,   96,  102,  104,   89,  109,  111,  105,   95,  105,
			  105,  106,   91,   97,  107,  108,  110,  114,   99,   89,
			  112,  103,  113,   92,  106,   96,  104,  107,  109,  102,

			  115,  113,  111,  103,  114,  108,  120,  105,  112,  110,
			  102,  118,  121,  118,  118,  122,  124,  106,  115,  120,
			  107,  125,  126,  127,  122,  129,  113,  128,  132,  130,
			  131,  137,  139,  140,  129,  121,  133,  132,  141,  126,
			  127,  124,  120,  125,  128,  133,  142,  138,  236,  122,
			  130,  143,  229,  124,  137,  131,  144,  139,  148,  129,
			  147,  140,  132,  141,  145,  144,  146,  131,  138,  139,
			  133,  142,  149,  143,  150,  141,  148,  147,  153,  145,
			  154,  146,  155,  142,  156,  159,  150,  158,  160,  162,
			  144,  157,  157,  157,  161,  155,  164,  149,  154,  163,

			  167,  157,  153,  165,  158,  170,  156,  161,  160,  149,
			  159,  169,  167,  164,  171,  175,  165,  162,  155,  172,
			  163,  176,  159,  170,  177,  218,  171,  180,  169,  199,
			  161,  199,  172,  173,  173,  173,  175,  186,  176,  165,
			  178,  178,  178,  179,  179,  179,  181,  180,  190,  177,
			  178,  187,  182,  179,  182,  172,  191,  189,  186,  189,
			  197,  177,  182,  198,  187,  217,  204,  189,  190,  197,
			  181,  192,  192,  192,  200,  181,  198,  191,  193,  193,
			  193,  192,  195,  195,  195,  200,  204,  187,  205,  206,
			  208,  206,  215,  211,  197,  182,  207,  207,  207,  198,

			  205,  209,  209,  209,  213,  222,  207,  216,  216,  200,
			  208,  211,  212,  212,  212,  214,  214,  214,  219,  219,
			  219,  225,  212,  232,  233,  213,  221,  221,  221,  223,
			  223,  223,  227,  227,  227,  238,  221,  237,  222,  241,
			  225,  230,  230,  230,  239,  239,  233,  242,  232,  243,
			  237,  240,  240,  244,  245,  246,  238,  248,  241,  247,
			  232,  249,  252,  251,  202,  201,  244,  242,  247,  188,
			  184,  243,  245,  237,  252,  253,  251,  253,  254,  255,
			  254,  255,  266,  266,  266,  253,  249,  183,  248,  168,
			  166,  246,  151,  247,  268,  268,  268,  135,  249,  251,

			  257,  257,  257,  257,  257,  257,  257,  258,  258,  258,
			  258,  258,  258,  258,  259,  259,  259,  259,  259,  259,
			  259,  260,  260,  260,  260,  260,  260,  260,  261,  261,
			  261,  261,  261,  262,  134,  262,  262,  262,  262,  262,
			  263,  263,  263,  263,  263,  263,  263,  264,  264,  264,
			  264,  264,  264,  264,  265,  265,  265,  265,  265,  265,
			  265,  267,  267,  267,  267,  267,  269,  269,  269,  269,
			  269,  270,  270,  270,  271,  271,  271,  271,  271,  272,
			  272,  272,  273,  273,  273,  273,  273,  119,  117,  116,
			   98,   78,   75,   74,   58,   55,   54,   50,   47,   41,

			   38,   36,   32,   30,   28,   20,   12,    9,    8,    5,
			    3,  256,  256,  256,  256,  256,  256,  256,  256,  256,
			  256,  256,  256,  256,  256,  256,  256,  256,  256,  256,
			  256,  256,  256,  256,  256,  256,  256,  256,  256,  256,
			  256,  256,  256,  256,  256,  256,  256,  256,  256,  256,
			  256,  256,  256,  256,  256,  256,  256,  256,  256,  256,
			  256,  256, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,   30,  607,   49,  606,   53,    0,  606,  607,
			  611,   60,  603,  611,  611,  611,  611,  611,  611,  611,
			  593,  611,  611,   55,  611,  611,  611,  611,  580,    0,
			  570,   32,  556,  611,  611,   34,  568,   36,  568,   44,
			   40,  565,   50,    0,  611,   53,  611,  595,  611,   79,
			  594,  611,   83,   85,  593,  592,   76,   80,  582,   76,
			   71,   82,   50,   88,   90,   92,   93,   95,   96,   98,
			  100,  103,    0,   83,  590,  589,  114,  611,  588,  118,
			  611,  122,  123,    0,  117,  118,  119,  136,  125,  142,
			  128,  135,  147,  129,  130,  143,  148,  149,  561,  141,

			  154,    0,  160,  154,  161,  164,  169,  172,  173,  163,
			  174,  164,  178,  180,  175,  188,  557,  553,  198,  575,
			  194,  200,  203,  611,  204,  209,  210,  211,  215,  213,
			  217,  218,  216,  224,  505,  468,    0,  219,  235,  220,
			  221,  226,  234,  239,  244,  252,  254,  248,  246,  260,
			  237,  458,    0,  266,  268,  270,  272,  289,  275,  273,
			  276,  282,  277,  287,  284,  291,  461,  263,  476,  299,
			  293,  302,  307,  331,  611,  303,  309,  312,  338,  341,
			  315,  334,  350,  454,  441,    0,  325,  339,  457,  355,
			  336,  344,  369,  376,  611,  380,  611,  348,  351,  327,

			  362,  433,  431,    0,  354,  376,  387,  394,  378,  399,
			  611,  381,  410,  392,  413,  360,  395,  353,  313,  416,
			  611,  424,  393,  427,  611,  409,  611,  430,    0,  202,
			  439,  611,  411,  412,  611,    0,  232,  425,  423,  432,
			  436,  427,  435,  437,  441,  442,  443,  447,  445,  449,
			   81,  451,  425,  473,  476,  477,  611,  499,  506,  513,
			  520,  525,  532,  539,  546,  553,  477,  558,  489,  563,
			  566,  571,  574,  579, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,  256,    1,  257,  257,  258,  259,  258,  260,  256,
			  256,  256,  256,  256,  256,  256,  256,  256,  256,  256,
			  256,  256,  256,  256,  256,  256,  256,  256,  261,  261,
			  261,  261,  256,  256,  256,  261,  261,  261,  261,  261,
			  261,  261,  261,  262,  256,  262,  256,  256,  256,  263,
			  256,  256,  264,  256,  256,  265,  256,  256,  261,  261,
			  261,  261,  256,  261,  261,  261,  261,  261,  261,  261,
			  261,  261,  262,  262,  256,  263,  263,  256,  264,  264,
			  256,  256,  256,  266,  261,  261,  261,  256,  261,  261,
			  261,  261,  261,  261,  261,  261,  261,  261,  262,  262,

			  256,  267,  261,  261,  261,  256,  261,  261,  261,  261,
			  261,  261,  261,  261,  261,  261,  262,  262,  256,  267,
			  261,  261,  261,  256,  261,  261,  261,  261,  261,  261,
			  261,  261,  261,  261,  262,  262,  268,  261,  261,  261,
			  261,  261,  261,  261,  261,  261,  261,  261,  261,  261,
			  262,  262,  269,  261,  261,  261,  261,  261,  261,  261,
			  261,  261,  261,  261,  261,  261,  262,  262,  269,  261,
			  261,  261,  261,  256,  256,  261,  261,  261,  261,  261,
			  261,  261,  261,  262,  262,  270,  261,  261,  261,  261,
			  261,  261,  261,  256,  256,  256,  256,  261,  261,  256,

			  261,  262,  262,  271,  261,  261,  256,  261,  261,  256,
			  256,  261,  261,  261,  262,  262,  271,  261,  261,  256,
			  256,  261,  261,  256,  256,  261,  256,  262,  272,  256,
			  256,  256,  261,  261,  256,  273,  256,  261,  261,  273,
			  256,  261,  261,  261,  261,  261,  261,  261,  261,  261,
			  256,  261,  256,  261,  256,  256,    0,  256,  256,  256,
			  256,  256,  256,  256,  256,  256,  256,  256,  256,  256,
			  256,  256,  256,  256, yy_Dummy>>)
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
			   26,   27,   28,   29,   22,   22,   30,   31,   32,   33,
			   34,   22,   35,   36,   37,   38,   39,   22,   22,   40,
			   41,   42,    1,   43,   44,   45,    1,   46,   22,   47,

			   24,   48,   26,   27,   28,   29,   22,   22,   30,   31,
			   32,   33,   34,   22,   35,   36,   49,   38,   50,   22,
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

	yy_meta_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    2,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    3,    4,    1,    1,    1,
			    1,    5,    5,    5,    6,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    7,    1,    1,    1,    3,    5,    5,    5,    5,
			    5, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
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
			   49,   49,   23,   39,   39,    0,   49,   49,   28,   22,
			   49,   49,   49,    0,   31,    0,   35,   49,   49,   23,

			   49,   39,   39,    0,   49,   49,   22,   49,   49,    0,
			   34,   49,   49,   49,   39,   39,    0,   26,   27,    0,
			   33,   49,   49,    0,   29,   49,   37,   39,    0,    0,
			    0,   32,   49,   49,   36,    0,    0,   49,   49,    0,
			   48,   49,   49,   49,   49,   49,   49,   49,   49,   49,
			    0,   49,    0,   25,   24,   25,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 611
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 256
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 257
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

	yyNb_rules: INTEGER = 51
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 52
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
