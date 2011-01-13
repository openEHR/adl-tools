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
	ANY_VALIDATOR
		rename
			reset as validator_reset
		end

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
if yy_act <= 27 then
if yy_act <= 14 then
if yy_act <= 7 then
if yy_act <= 4 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 65 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 65")
end
-- Ignore separators
else
--|#line 66 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 66")
end
in_lineno := in_lineno + text_count
end
else
if yy_act = 3 then
--|#line 71 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 71")
end
-- Ignore comments
else
--|#line 72 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 72")
end
in_lineno := in_lineno + 1
end
end
else
if yy_act <= 6 then
if yy_act = 5 then
--|#line 76 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 76")
end
last_token := Minus_code
else
--|#line 77 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 77")
end
last_token := Plus_code
end
else
--|#line 78 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 78")
end
last_token := Star_code
end
end
else
if yy_act <= 11 then
if yy_act <= 9 then
if yy_act = 8 then
--|#line 79 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 79")
end
last_token := Slash_code
else
--|#line 80 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 80")
end
last_token := Caret_code
end
else
if yy_act = 10 then
--|#line 81 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 81")
end
last_token := Equal_code
else
--|#line 82 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 82")
end
last_token := Dot_code
end
end
else
if yy_act <= 13 then
if yy_act = 12 then
--|#line 83 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 83")
end
last_token := Semicolon_code
else
--|#line 84 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 84")
end
last_token := Comma_code
end
else
--|#line 85 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 85")
end
last_token := Colon_code
end
end
end
else
if yy_act <= 21 then
if yy_act <= 18 then
if yy_act <= 16 then
if yy_act = 15 then
--|#line 86 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 86")
end
last_token := Exclamation_code
else
--|#line 87 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 87")
end
last_token := Left_parenthesis_code
end
else
if yy_act = 17 then
--|#line 88 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 88")
end
last_token := Right_parenthesis_code
else
--|#line 89 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 89")
end
last_token := Dollar_code
end
end
else
if yy_act <= 20 then
if yy_act = 19 then
--|#line 90 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 90")
end
last_token := Question_mark_code
else
--|#line 92 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 92")
end
last_token := Left_bracket_code
end
else
--|#line 93 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 93")
end
last_token := Right_bracket_code
end
end
else
if yy_act <= 24 then
if yy_act <= 23 then
if yy_act = 22 then
--|#line 97 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 97")
end

				last_token := SYM_ARCHETYPE
			
else
--|#line 101 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 101")
end

				last_token := SYM_TEMPLATE_COMPONENT
			
end
else
--|#line 105 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 105")
end

				last_token := SYM_TEMPLATE
			
end
else
if yy_act <= 26 then
if yy_act = 25 then
--|#line 109 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 109")
end

				last_token := SYM_OPERATIONAL_TEMPLATE
			
else
--|#line 113 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 113")
end

				last_token := SYM_ADL_VERSION
			
end
else
--|#line 117 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 117")
end

				last_token := SYM_IS_CONTROLLED
			
end
end
end
end
else
if yy_act <= 40 then
if yy_act <= 34 then
if yy_act <= 31 then
if yy_act <= 29 then
if yy_act = 28 then
--|#line 121 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 121")
end

				last_token := SYM_IS_GENERATED
			
else
--|#line 125 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 125")
end

				last_token := SYM_SPECIALIZE
				in_lineno := in_lineno + 1
			
end
else
if yy_act = 30 then
--|#line 131 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 131")
end

				last_token := SYM_CONCEPT
				in_lineno := in_lineno + 1
			
else
--|#line 136 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 136")
end

				last_token := SYM_LANGUAGE
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				language_text_start_line := in_lineno
			
end
end
else
if yy_act <= 33 then
if yy_act = 32 then
--|#line 143 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 143")
end

				last_token := SYM_DESCRIPTION
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				description_text_start_line := in_lineno
			
else
--|#line 150 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 150")
end

				last_token := SYM_DEFINITION
				set_start_condition(IN_CADL_SECTION)
				in_lineno := in_lineno + 1
				definition_text_start_line := in_lineno
			
end
else
--|#line 157 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 157")
end

				last_token := SYM_INVARIANT
				set_start_condition(IN_ASSERTION_SECTION)
				in_lineno := in_lineno + 1
				invariant_text_start_line := in_lineno
			
end
end
else
if yy_act <= 37 then
if yy_act <= 36 then
if yy_act = 35 then
--|#line 164 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 164")
end

				last_token := SYM_ONTOLOGY
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				ontology_text_start_line := in_lineno
			
else
--|#line 171 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 171")
end

				last_token := SYM_ANNOTATIONS
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				annotations_text_start_line := in_lineno
			
end
else
--|#line 179 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 179")
end
 -- line starting with "definition" or "description" or "annotation"
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
if yy_act <= 39 then
if yy_act = 38 then
--|#line 180 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 180")
end
 -- line starting with "definition" or "description" or "annotation"
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
--|#line 181 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 181")
end
 -- line starting with "definition" or "description" or "annotation"
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
--|#line 198 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 198")
end
 -- LF
				in_buffer.append_character('%N')
				in_lineno := in_lineno + 1
			
end
end
end
else
if yy_act <= 47 then
if yy_act <= 44 then
if yy_act <= 42 then
if yy_act = 41 then
--|#line 202 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 202")
end
 -- any text on line with no LF
				in_buffer.append_string(text)
			
else
--|#line 214 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 214")
end

		-- ignore unmatched chars
	
end
else
if yy_act = 43 then
--|#line 220 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 220")
end

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
else
--|#line 224 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 224")
end
in_lineno := in_lineno + text_count
end
end
else
if yy_act <= 46 then
if yy_act = 45 then
--|#line 226 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 226")
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
--|#line 238 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 238")
end

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
end
else
--|#line 242 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 242")
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
if yy_act <= 50 then
if yy_act <= 49 then
if yy_act = 48 then
--|#line 254 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 254")
end

					last_token := V_VERSION_STRING
					last_string_value := text_substring (1, text_count)
			
else
--|#line 260 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 260")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
else
--|#line 266 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 266")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
end
else
if yy_act <= 52 then
if yy_act = 51 then
--|#line 272 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 272")
end

					last_token := V_IDENTIFIER
					last_string_value := text
			
else
--|#line 279 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 279")
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
			   35,   44,   36,   37,   50,   51,   60,   69,   38,   39,
			  264,   54,   40,   54,   64,   41,   42,   65,   57,   45,
			   58,   58,   46,   79,   80,   35,   36,   42,   70,   54,
			   71,   54,   69,   82,   83,   85,   85,   57,   86,   58,
			   58,   86,   86,   86,   45,   90,   90,   86,   86,   86,

			   86,   86,   86,   86,   86,  103,   87,  260,   92,   86,
			   86,   88,   89,   91,   94,  104,   99,  100,   93,   79,
			   80,   97,   82,   83,   95,   86,   96,   98,  101,   84,
			   86,   84,   92,   86,   86,   86,   96,  105,   98,   85,
			   85,   86,   86,  107,   86,  108,  109,  110,   86,  110,
			  110,  111,  114,  113,   86,  115,   86,  112,   86,   86,
			   86,  124,  108,  116,  125,  125,   86,   86,   86,  118,
			  120,  117,   86,   86,   86,   86,   86,  113,   86,  115,
			  203,  119,  121,   86,  110,  124,  110,  110,  116,  132,
			  129,  133,   86,  127,  120,  134,   86,  128,  131,   86,

			  137,   86,   86,  127,   86,  139,  135,   86,  128,  131,
			  142,   86,   86,   86,  130,  136,  148,  138,  140,   86,
			  141,  142,  105,   86,  125,  125,  146,  147,  149,   86,
			  139,   86,   86,   86,  151,   86,  150,  160,   86,   86,
			  152,  148,  155,   86,   86,   86,  153,  150,  154,   86,
			   86,   86,  158,  149,  159,   86,  156,  157,   86,   86,
			  165,  164,  160,   86,  172,   86,   86,  155,  157,  166,
			   86,   86,   86,   86,  167,   86,  169,  158,  168,  159,
			  166,  171,  175,  170,  176,  167,  173,  169,  174,  172,
			  178,  179,   86,  183,  170,  177,  182,   86,   86,   86,

			   86,  178,  179,   86,   86,  184,  177,  187,  188,  187,
			   86,   86,   86,   86,  185,   86,  189,   86,   86,  199,
			  186,   86,   86,  191,  192,  190,  196,   86,   86,  195,
			  199,  194,  193,  202,   86,  201,  190,  187,  188,  187,
			  205,   86,  204,  206,   86,  207,  209,  210,  209,   86,
			  211,  212,  211,  215,  215,  215,   86,   86,   86,  208,
			   86,  213,  222,   86,   86,  224,  224,  224,  214,   86,
			  208,  249,  250,  214,   86,   86,  249,  250,  221,  226,
			  227,  228,  227,  229,  223,  209,  210,  209,   86,  225,
			   86,  211,  212,  211,   86,   86,  216,  215,  215,  215,

			   86,  230,   86,   86,   86,  231,   86,  248,  229,  224,
			  224,  224,  237,  264,  264,  236,  246,  239,  240,  239,
			  227,  228,  227,  241,  242,  245,  238,   86,   86,  231,
			  243,  244,  243,  233,  247,  233,  251,  252,  251,   86,
			   86,  239,  240,  239,  234,  233,   86,  253,  254,  253,
			  243,  244,  243,  246,  257,  246,   86,   86,  256,   86,
			   86,  255,  248,  258,  248,  251,  252,  251,  253,  254,
			  253,   86,  265,   86,   86,   86,   86,   86,   86,   86,
			   86,  261,  262,   86,  232,   86,  273,  219,  218,  270,
			  267,   86,  261,  217,  266,  268,  269,  271,  272,  276,

			  276,  276,  200,  198,  277,  274,  197,  180,  275,   86,
			  162,  273,  276,  276,  276,  161,  274,  145,  144,  275,
			  278,  278,  278,  278,  278,  278,  106,  106,  106,  143,
			   86,   43,   43,   43,   43,   43,   43,   43,   47,   47,
			   47,   47,   47,   47,   47,   49,   49,   49,   49,   49,
			   49,   49,   52,   52,   52,   52,   52,   52,   52,   59,
			   59,   59,   59,   59,   74,  123,   74,   74,   74,   74,
			   74,   78,   78,   78,   78,   78,   78,   78,   81,   81,
			   81,   81,   81,   81,   81,   56,   56,   56,   56,   56,
			   56,   56,  126,  126,  126,  126,  126,  163,  163,  163,

			  181,  181,  181,  181,  181,  220,  220,  220,  235,  235,
			  235,  235,  235,  259,  259,  259,  263,  263,  263,  263,
			  263,  122,   83,   80,   77,  102,   86,   84,   55,   77,
			   77,   76,   75,   73,   72,   68,   67,   66,   63,   62,
			   61,   60,   56,   55,  279,   53,   48,   44,    9,  279,
			  279,  279,  279,  279,  279,  279,  279,  279,  279,  279,
			  279,  279,  279,  279,  279,  279,  279,  279,  279,  279,
			  279,  279,  279,  279,  279,  279,  279,  279,  279,  279,
			  279,  279,  279,  279,  279,  279,  279,  279,  279,  279,
			  279,  279,  279,  279,  279,  279,  279,  279, yy_Dummy>>)
		end

	yy_chk_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    2,    4,    2,    2,    6,    6,   35,   39,    2,    2,
			  260,   11,    2,   11,   35,    2,    2,   35,   23,    4,
			   23,   23,    4,   50,   50,    2,    2,    2,   40,   54,
			   40,   54,   39,   53,   53,   57,   57,   58,   60,   58,
			   58,   61,   62,   64,    4,   63,   63,   65,   66,   68,

			   67,   69,   70,   71,   72,   76,   60,  250,   65,   73,
			   87,   61,   62,   64,   67,   76,   71,   72,   66,   79,
			   79,   69,   82,   82,   67,   88,   68,   70,   73,   84,
			   91,   84,   65,   89,  237,   94,   68,   85,   70,   85,
			   85,   92,   93,   87,   95,   88,   89,   90,   98,   90,
			   90,   91,   94,   93,   96,   95,   97,   92,   99,  100,
			  101,  104,   93,   96,  105,  105,  107,  109,  184,   98,
			  100,   97,  108,  111,  117,  114,  112,   93,  113,   95,
			  184,   99,  101,  115,  110,  104,  110,  110,   96,  112,
			  109,  113,  116,  107,  100,  114,  119,  108,  111,  118,

			  117,  120,  121,  107,  128,  119,  115,  129,  108,  111,
			  122,  132,  133,  127,  110,  116,  129,  118,  120,  131,
			  121,  122,  125,  134,  125,  125,  127,  128,  131,  135,
			  119,  136,  139,  137,  133,  138,  132,  142,  146,  147,
			  134,  129,  137,  140,  148,  141,  135,  132,  136,  149,
			  150,  151,  140,  131,  141,  154,  138,  139,  152,  153,
			  147,  146,  142,  236,  154,  157,  158,  137,  139,  148,
			  159,  155,  164,  156,  149,  165,  151,  140,  150,  141,
			  148,  153,  157,  152,  158,  149,  155,  151,  156,  154,
			  160,  161,  166,  165,  152,  159,  164,  167,  168,  170,

			  171,  160,  161,  172,  174,  166,  159,  169,  169,  169,
			  175,  173,  176,  177,  167,  183,  170,  169,  182,  180,
			  168,  185,  189,  172,  173,  171,  177,  186,  190,  176,
			  180,  175,  174,  183,  191,  182,  171,  187,  187,  187,
			  186,  194,  185,  189,  195,  190,  192,  192,  192,  202,
			  193,  193,  193,  196,  196,  196,  192,  201,  207,  191,
			  193,  194,  202,  196,  204,  205,  205,  205,  195,  206,
			  191,  235,  235,  195,  213,  205,  263,  263,  201,  207,
			  208,  208,  208,  213,  204,  209,  209,  209,  214,  206,
			  208,  211,  211,  211,  216,  221,  196,  215,  215,  215,

			  222,  214,  223,  226,  231,  216,  229,  234,  213,  224,
			  224,  224,  222,  264,  264,  221,  232,  225,  225,  225,
			  227,  227,  227,  226,  229,  231,  223,  225,  242,  216,
			  230,  230,  230,  233,  233,  233,  238,  238,  238,  245,
			  230,  239,  239,  239,  219,  218,  238,  241,  241,  241,
			  243,  243,  243,  246,  246,  246,  255,  241,  245,  261,
			  256,  242,  248,  248,  248,  251,  251,  251,  253,  253,
			  253,  265,  261,  262,  267,  266,  268,  271,  270,  269,
			  272,  255,  256,  273,  217,  203,  271,  199,  198,  268,
			  265,  275,  255,  197,  262,  266,  267,  269,  270,  274,

			  274,  274,  181,  179,  275,  272,  178,  162,  273,  274,
			  144,  271,  276,  276,  276,  143,  272,  126,  124,  273,
			  277,  277,  277,  278,  278,  278,  289,  289,  289,  123,
			  277,  280,  280,  280,  280,  280,  280,  280,  281,  281,
			  281,  281,  281,  281,  281,  282,  282,  282,  282,  282,
			  282,  282,  283,  283,  283,  283,  283,  283,  283,  284,
			  284,  284,  284,  284,  285,  103,  285,  285,  285,  285,
			  285,  286,  286,  286,  286,  286,  286,  286,  287,  287,
			  287,  287,  287,  287,  287,  288,  288,  288,  288,  288,
			  288,  288,  290,  290,  290,  290,  290,  291,  291,  291,

			  292,  292,  292,  292,  292,  293,  293,  293,  294,  294,
			  294,  294,  294,  295,  295,  295,  296,  296,  296,  296,
			  296,  102,   81,   78,   77,   75,   59,   56,   55,   51,
			   48,   46,   45,   42,   41,   38,   37,   36,   32,   31,
			   30,   28,   20,   12,    9,    8,    5,    3,  279,  279,
			  279,  279,  279,  279,  279,  279,  279,  279,  279,  279,
			  279,  279,  279,  279,  279,  279,  279,  279,  279,  279,
			  279,  279,  279,  279,  279,  279,  279,  279,  279,  279,
			  279,  279,  279,  279,  279,  279,  279,  279,  279,  279,
			  279,  279,  279,  279,  279,  279,  279,  279, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,   29,  644,   48,  643,   52,    0,  643,  644,
			  648,   59,  640,  648,  648,  648,  648,  648,  648,  648,
			  630,  648,  648,   55,  648,  648,  648,  648,  617,    0,
			  607,  614,  592,  648,  648,   32,  604,  611,  603,   36,
			   46,  600,  608,    0,  648,  600,  606,  648,  627,  648,
			   71,  626,  648,   81,   77,  625,  624,   70,   74,  614,
			   76,   79,   80,   48,   81,   85,   86,   88,   87,   89,
			   90,   91,   92,   97,    0,  593,   79,  621,  620,  117,
			  648,  619,  120,  648,  127,  124,    0,   98,  113,  121,
			  134,  118,  129,  130,  123,  132,  142,  144,  136,  146,

			  147,  148,  588,  536,  138,  149,    0,  154,  160,  155,
			  171,  161,  164,  166,  163,  171,  180,  162,  187,  184,
			  189,  190,  173,  497,  483,  209,  505,  201,  192,  195,
			  648,  207,  199,  200,  211,  217,  219,  221,  223,  220,
			  231,  233,  216,  486,  481,    0,  226,  227,  232,  237,
			  238,  239,  246,  247,  243,  259,  261,  253,  254,  258,
			  253,  254,  473,    0,  260,  263,  280,  285,  286,  305,
			  287,  288,  291,  299,  292,  298,  300,  301,  477,  474,
			  282,  489,  306,  303,  156,  309,  315,  335,  648,  310,
			  316,  322,  344,  348,  329,  332,  351,  460,  455,  458,

			    0,  345,  337,  473,  352,  363,  357,  346,  378,  383,
			  648,  389,  648,  362,  376,  395,  382,  452,  413,  411,
			    0,  383,  388,  390,  407,  415,  391,  418,  648,  394,
			  428,  392,  380,  431,  375,  359,  251,  122,  434,  439,
			  648,  445,  416,  448,  648,  427,  451,  648,  460,    0,
			   58,  463,  648,  466,  648,  444,  448,  648,  648,    0,
			   44,  447,  461,  364,  398,  459,  463,  462,  464,  467,
			  466,  465,  468,  471,  497,  479,  510,  518,  521,  648,
			  530,  537,  544,  551,  556,  563,  570,  577,  584,  521,
			  589,  592,  597,  600,  605,  608,  613, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,  279,    1,  280,  280,  281,  282,  281,  283,  279,
			  279,  279,  279,  279,  279,  279,  279,  279,  279,  279,
			  279,  279,  279,  279,  279,  279,  279,  279,  284,  284,
			  284,  284,  279,  279,  279,  284,  284,  284,  284,  284,
			  284,  284,  284,  285,  279,  285,  285,  279,  279,  279,
			  286,  279,  279,  287,  279,  279,  288,  279,  279,  284,
			  284,  284,  284,  279,  284,  284,  284,  284,  284,  284,
			  284,  284,  284,  284,  285,  285,  285,  279,  286,  286,
			  279,  287,  287,  279,  279,  279,  289,  284,  284,  284,
			  279,  284,  284,  284,  284,  284,  284,  284,  284,  284,

			  284,  284,  285,  285,  285,  279,  290,  284,  284,  284,
			  279,  284,  284,  284,  284,  284,  284,  284,  284,  284,
			  284,  284,  285,  285,  285,  279,  290,  284,  284,  284,
			  279,  284,  284,  284,  284,  284,  284,  284,  284,  284,
			  284,  284,  285,  285,  285,  291,  284,  284,  284,  284,
			  284,  284,  284,  284,  284,  284,  284,  284,  284,  284,
			  285,  285,  285,  292,  284,  284,  284,  284,  284,  284,
			  284,  284,  284,  284,  284,  284,  284,  284,  285,  285,
			  285,  292,  284,  284,  284,  284,  284,  279,  279,  284,
			  284,  284,  284,  284,  284,  284,  284,  285,  285,  285,

			  293,  284,  284,  284,  284,  284,  284,  284,  284,  279,
			  279,  279,  279,  284,  284,  279,  284,  285,  285,  285,
			  294,  284,  284,  284,  279,  284,  284,  279,  279,  284,
			  284,  284,  285,  285,  285,  294,  284,  284,  284,  279,
			  279,  284,  284,  279,  279,  284,  285,  279,  285,  295,
			  279,  279,  279,  279,  279,  284,  284,  279,  279,  296,
			  279,  284,  284,  296,  279,  284,  284,  284,  284,  284,
			  284,  284,  284,  284,  284,  284,  279,  284,  279,    0,
			  279,  279,  279,  279,  279,  279,  279,  279,  279,  279,
			  279,  279,  279,  279,  279,  279,  279, yy_Dummy>>)
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

	yy_meta_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    2,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    3,    4,    1,    1,    1,
			    1,    5,    5,    5,    6,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    7,    1,    1,    1,    3,    5,    5,    5,    5, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   54,
			   52,    1,    2,   15,   18,   16,   17,    7,    6,   13,
			    5,   11,    8,   52,   14,   12,   10,   19,   51,   51,
			   51,   51,   20,   21,    9,   51,   51,   51,   51,   51,
			   51,   51,   51,   41,   40,   41,   41,   53,   44,   45,
			   53,   44,   47,   53,    1,    2,    3,    0,    0,   51,
			   51,   51,   51,    0,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   41,   41,   41,   44,    0,    0,
			   43,    0,    0,   46,    4,   48,    0,   51,   51,   51,
			    0,   51,   51,   51,   51,   51,   51,   51,   51,   51,

			   51,   51,   41,   41,   41,    0,    0,   51,   51,   51,
			    0,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   41,   41,   41,   48,    0,   51,   51,   51,
			   49,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   41,   41,   41,    0,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   41,   41,   41,    0,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   41,   41,
			   41,    0,   51,   51,   51,   51,   51,    0,   30,   51,
			   51,   51,   51,   51,   51,   51,   51,   41,   41,   41,

			    0,   51,   51,   28,   51,   51,   51,   51,   51,    0,
			   31,    0,   35,   51,   51,   24,   51,   41,   41,   41,
			    0,   51,   51,   51,   22,   51,   51,    0,   34,   51,
			   51,   51,   41,   41,   41,    0,   26,   27,   51,    0,
			   33,   51,   51,    0,   29,   51,   41,   38,   41,    0,
			    0,    0,   36,    0,   32,   51,   51,   39,   37,    0,
			    0,   51,   51,    0,   50,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   23,   51,   25,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 648
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 279
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 280
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

	yyNb_rules: INTEGER = 53
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 54
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
			validator_reset
		end

	validate
		do
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

	annotations_text_start_line: INTEGER

feature {NONE} -- Constants

	Init_buffer_size: INTEGER = 256
				-- Initial size for `in_buffer'

invariant
	in_buffer_not_void: in_buffer /= Void

end
