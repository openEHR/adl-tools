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
if yy_act <= 20 then
if yy_act <= 10 then
if yy_act <= 5 then
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
end
else
if yy_act <= 8 then
if yy_act <= 7 then
if yy_act = 6 then
--|#line 66 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 66")
end
last_token := Plus_code
else
--|#line 67 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 67")
end
last_token := Star_code
end
else
--|#line 68 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 68")
end
last_token := Slash_code
end
else
if yy_act = 9 then
--|#line 69 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 69")
end
last_token := Caret_code
else
--|#line 70 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 70")
end
last_token := Equal_code
end
end
end
else
if yy_act <= 15 then
if yy_act <= 13 then
if yy_act <= 12 then
if yy_act = 11 then
--|#line 71 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 71")
end
last_token := Dot_code
else
--|#line 72 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 72")
end
last_token := Semicolon_code
end
else
--|#line 73 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 73")
end
last_token := Comma_code
end
else
if yy_act = 14 then
--|#line 74 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 74")
end
last_token := Colon_code
else
--|#line 75 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 75")
end
last_token := Exclamation_code
end
end
else
if yy_act <= 18 then
if yy_act <= 17 then
if yy_act = 16 then
--|#line 76 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 76")
end
last_token := Left_parenthesis_code
else
--|#line 77 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 77")
end
last_token := Right_parenthesis_code
end
else
--|#line 78 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 78")
end
last_token := Dollar_code
end
else
if yy_act = 19 then
--|#line 79 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 79")
end
last_token := Question_mark_code
else
--|#line 81 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 81")
end
last_token := Left_bracket_code
end
end
end
end
else
if yy_act <= 30 then
if yy_act <= 25 then
if yy_act <= 23 then
if yy_act <= 22 then
if yy_act = 21 then
--|#line 82 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 82")
end
last_token := Right_bracket_code
else
--|#line 86 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 86")
end

				last_token := SYM_ARCHETYPE
				in_lineno := in_lineno + 1
			
end
else
--|#line 91 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 91")
end

				last_token := SYM_SPECIALIZE
				in_lineno := in_lineno + 1
			
end
else
if yy_act = 24 then
--|#line 97 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 97")
end

				last_token := SYM_CONCEPT
				in_lineno := in_lineno + 1
			
else
--|#line 102 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 102")
end

				last_token := SYM_DEFINITION
				set_start_condition(IN_CADL_SECTION)
				in_lineno := in_lineno + 1
				definition_text_start_line := in_lineno
			
end
end
else
if yy_act <= 28 then
if yy_act <= 27 then
if yy_act = 26 then
--|#line 109 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 109")
end

				last_token := SYM_DESCRIPTION
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				description_text_start_line := in_lineno
			
else
--|#line 117 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 117")
end

				last_token := SYM_INVARIANT
				set_start_condition(IN_ASSERTION_SECTION)
				in_lineno := in_lineno + 1
				invariant_text_start_line := in_lineno
			
end
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
if yy_act = 29 then
--|#line 131 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 131")
end

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
			
else
--|#line 136 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 136")
end
 -- non-white space at start
				unread_character(text.item(1))
				last_token := V_DADL_TEXT
				str_ := STRING_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_
				set_start_condition(INITIAL)
			
end
end
end
else
if yy_act <= 35 then
if yy_act <= 33 then
if yy_act <= 32 then
if yy_act = 31 then
--|#line 146 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 146")
end

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
			
else
--|#line 151 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 151")
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
--|#line 161 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 161")
end

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
			
end
else
if yy_act = 34 then
--|#line 166 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 166")
end
 -- non-white space at start
				unread_character(text.item(1))
				last_token := V_ASSERTION_TEXT
				str_ := STRING_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_
				set_start_condition(INITIAL)
			
else
--|#line 177 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 177")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
end
else
if yy_act <= 37 then
if yy_act = 36 then
--|#line 183 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 183")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
else
--|#line 189 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 189")
end

					last_token := V_IDENTIFIER
					last_string_value := text
			
end
else
if yy_act = 38 then
--|#line 196 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 196")
end
;
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
when 0, 1, 2, 3 then
--|#line 0 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 0")
end
terminate
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
			    0,   10,   11,   12,   11,   13,   14,   15,   16,   17,
			   18,   19,   20,   21,   22,   10,   23,   24,   25,   26,
			   27,   27,   27,   27,   27,   27,   27,   27,   27,   27,
			   27,   27,   27,   27,   27,   27,   27,   27,   27,   28,
			   29,   30,   10,   31,   47,   32,   33,   44,   47,   44,
			   47,   34,   47,   47,   35,   47,   91,   36,   57,   58,
			   60,   61,   52,   63,   64,   50,   44,   51,   44,   64,
			   53,   54,   47,   66,   61,   55,   49,   49,   47,   66,
			   47,   66,   58,   47,   66,   47,   66,   66,   68,   47,
			   66,   47,   66,   57,   58,   65,   70,   65,   69,   60,

			   61,   63,   64,   74,   67,   71,   49,   47,   66,   72,
			   47,   66,   73,   47,   66,   47,   66,   65,   47,   66,
			   77,   45,   76,   47,   66,   79,   80,   47,   66,   78,
			   47,   47,   66,   47,   66,   47,   66,   82,   47,   66,
			   47,   66,   81,   84,   46,   85,   47,   66,   47,   66,
			   47,   66,   45,   86,   47,   66,   47,   66,  136,   87,
			   43,   88,   41,   89,   90,   47,   66,   47,   66,   47,
			   66,   39,   94,   92,   93,  136,   47,   66,   47,   66,
			  136,   95,  136,   96,   98,   47,   66,  136,   97,   47,
			   66,   47,   66,   47,   66,   47,   66,   47,   66,   47,

			   66,  104,  136,  100,  136,  108,  109,  108,  101,  105,
			  136,  103,  102,  136,  106,   47,   66,   47,   66,  107,
			   47,   66,   47,   66,   47,   66,   47,   66,  136,   47,
			   66,   47,   66,  110,  108,  109,  108,   47,   66,  136,
			  112,  115,  114,  111,   47,   66,  119,  120,  119,  113,
			  116,   47,   66,  117,   47,   66,   47,   66,  122,  123,
			  122,   47,   66,  136,  126,  127,  126,  118,   47,   66,
			  136,  136,  124,  121,   47,   66,  136,  121,   47,   66,
			  125,  119,  120,  119,  122,  123,  122,  129,  130,  129,
			  128,   47,   66,  126,  127,  126,  136,   47,   66,  136,

			  132,  133,  132,  129,  130,  129,  134,  135,  134,  131,
			   47,   66,  132,  133,  132,  136,   47,   66,  134,  135,
			  134,   37,   37,   37,   37,   37,   37,   37,   38,   38,
			   38,   38,   38,   38,   38,   40,   40,   40,   40,   40,
			   40,   40,   42,   42,   42,   42,   42,   42,   42,   48,
			  136,   48,   48,   48,   48,   49,   49,   49,   49,   56,
			   56,   56,   56,   56,   56,   56,   59,   59,   59,   59,
			   59,   59,   59,   62,   62,   62,   62,   62,   62,   62,
			   46,   46,   46,   46,   46,   46,   46,   47,   47,   47,
			   47,   47,   47,   75,   75,   75,   83,  136,   83,   83,

			   83,   83,   99,   99,   99,   99,    9,  136,  136,  136,
			  136,  136,  136,  136,  136,  136,  136,  136,  136,  136,
			  136,  136,  136,  136,  136,  136,  136,  136,  136,  136,
			  136,  136,  136,  136,  136,  136,  136,  136,  136,  136,
			  136,  136,  136,  136,  136,  136,  136,  136,  136>>)
		end

	yy_chk_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    2,   31,    2,    2,   11,   32,   11,
			   33,    2,   34,   35,    2,   36,   83,    2,   39,   39,
			   41,   41,   33,   43,   43,   31,   44,   32,   44,   62,
			   34,   35,   48,   48,   59,   36,   49,   49,   50,   50,
			   51,   51,   56,   52,   52,   53,   53,   47,   50,   54,
			   54,   55,   55,   57,   57,   65,   52,   65,   51,   60,

			   60,   63,   63,   55,   49,   52,   49,   68,   68,   53,
			   69,   69,   54,   70,   70,   71,   71,   46,   72,   72,
			   69,   45,   68,   73,   73,   71,   72,   74,   74,   70,
			   27,   76,   76,   77,   77,   78,   78,   74,   79,   79,
			   80,   80,   73,   76,   20,   77,   81,   81,   82,   82,
			   84,   84,   12,   78,   85,   85,   86,   86,    9,   79,
			    8,   80,    6,   81,   82,   87,   87,   88,   88,   89,
			   89,    4,   86,   84,   85,    0,   90,   90,   92,   92,
			    0,   87,    0,   88,   90,   93,   93,    0,   89,   94,
			   94,   95,   95,   96,   96,   97,   97,   98,   98,  100,

			  100,   96,    0,   92,    0,  101,  101,  101,   93,   97,
			    0,   95,   94,    0,   98,  101,  101,  102,  102,  100,
			  103,  103,  104,  104,  105,  105,  106,  106,    0,  107,
			  107,  110,  110,  102,  108,  108,  108,  111,  111,    0,
			  104,  107,  106,  103,  112,  112,  113,  113,  113,  105,
			  110,  114,  114,  111,  116,  116,  113,  113,  115,  115,
			  115,  117,  117,    0,  118,  118,  118,  112,  115,  115,
			    0,    0,  116,  114,  118,  118,    0,  114,  121,  121,
			  117,  119,  119,  119,  122,  122,  122,  124,  124,  124,
			  121,  125,  125,  126,  126,  126,    0,  124,  124,    0,

			  128,  128,  128,  129,  129,  129,  131,  131,  131,  125,
			  128,  128,  132,  132,  132,    0,  131,  131,  134,  134,
			  134,  137,  137,  137,  137,  137,  137,  137,  138,  138,
			  138,  138,  138,  138,  138,  139,  139,  139,  139,  139,
			  139,  139,  140,  140,  140,  140,  140,  140,  140,  141,
			    0,  141,  141,  141,  141,  142,  142,  142,  142,  143,
			  143,  143,  143,  143,  143,  143,  144,  144,  144,  144,
			  144,  144,  144,  145,  145,  145,  145,  145,  145,  145,
			  146,  146,  146,  146,  146,  146,  146,  147,  147,  147,
			  147,  147,  147,  148,  148,  148,  149,    0,  149,  149,

			  149,  149,  150,  150,  150,  150,  136,  136,  136,  136,
			  136,  136,  136,  136,  136,  136,  136,  136,  136,  136,
			  136,  136,  136,  136,  136,  136,  136,  136,  136,  136,
			  136,  136,  136,  136,  136,  136,  136,  136,  136,  136,
			  136,  136,  136,  136,  136,  136,  136,  136,  136>>)
		end

	yy_base_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    0,   23,    0,  169,    0,  160,    0,  158,  158,
			  406,   45,  149,  406,  406,  406,  406,  406,  406,  406,
			  132,  406,  406,  406,  406,  406,  406,  118,    0,  406,
			  406,   32,   36,   38,   40,   41,   43,  406,  406,   56,
			  406,   58,  406,   61,   64,  118,  114,   74,   60,   64,
			   66,   68,   71,   73,   77,   79,   79,   91,  406,   71,
			   97,  406,   66,   99,  406,   93,    0,  406,   95,   98,
			  101,  103,  106,  111,  115,    0,  119,  121,  123,  126,
			  128,  134,  136,   43,  138,  142,  144,  153,  155,  157,
			  164,    0,  166,  173,  177,  179,  181,  183,  185,    0,

			  187,  203,  205,  208,  210,  212,  214,  217,  232,  406,
			  219,  225,  232,  244,  239,  256,  242,  249,  262,  279,
			  406,  266,  282,  406,  285,  279,  291,  406,  298,  301,
			  406,  304,  310,  406,  316,  406,  406,  320,  327,  334,
			  341,  347,  351,  358,  365,  372,  379,  385,  388,  394,
			  398>>)
		end

	yy_def_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,  136,    1,  137,  138,  137,  139,  137,  140,  136,
			  136,  136,  136,  136,  136,  136,  136,  136,  136,  136,
			  136,  136,  136,  136,  136,  136,  136,  141,  142,  136,
			  136,  141,  141,  141,  141,  141,  141,  136,  136,  143,
			  136,  144,  136,  145,  136,  136,  146,  147,  141,  142,
			  141,  141,  141,  141,  141,  141,  143,  143,  136,  144,
			  144,  136,  145,  145,  136,  136,  148,  136,  141,  141,
			  141,  141,  141,  141,  141,  149,  141,  141,  141,  141,
			  141,  141,  141,  149,  141,  141,  141,  141,  141,  141,
			  141,  150,  141,  141,  141,  141,  141,  141,  141,  150,

			  141,  141,  141,  141,  141,  141,  141,  141,  136,  136,
			  141,  141,  141,  141,  141,  141,  141,  141,  141,  136,
			  136,  141,  136,  136,  141,  141,  136,  136,  141,  136,
			  136,  141,  136,  136,  136,  136,    0,  136,  136,  136,
			  136,  136,  136,  136,  136,  136,  136,  136,  136,  136,
			  136>>)
		end

	yy_ec_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
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
			    1,    1,    1,    1,    1,    1,    1>>)
		end

	yy_meta_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    3,    1,    4,    1,    1,    1,    1,
			    5,    5,    6,    7,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    1,
			    1,    1,    2>>)
		end

	yy_accept_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   40,
			   38,    1,    2,   15,   18,   16,   17,    7,    6,   13,
			    5,   11,    8,   14,   12,   10,   19,   37,   20,   21,
			    9,   37,   37,   37,   37,   37,   37,   39,   30,   39,
			   32,   39,   34,   39,    1,    2,    3,    0,   37,    0,
			   37,   37,   37,   37,   37,   37,    0,    0,   29,    0,
			    0,   31,    0,    0,   33,    4,    0,   35,   37,   37,
			   37,   37,   37,   37,   37,    0,   37,   37,   37,   37,
			   37,   37,   37,    0,   37,   37,   37,   37,   37,   37,
			   37,    0,   37,   37,   37,   37,   37,   37,   37,   36,

			   37,   37,   37,   37,   37,   37,   37,   37,    0,   24,
			   37,   37,   37,   37,   37,   37,   37,   37,   37,    0,
			   28,   37,    0,   22,   37,   37,    0,   27,   37,    0,
			   25,   37,    0,   23,    0,   26,    0>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 406
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 136
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 137
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

	yyNb_rules: INTEGER is 39
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 40
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
