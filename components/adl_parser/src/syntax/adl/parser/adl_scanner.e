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
if yy_act <= 23 then
if yy_act <= 12 then
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
if yy_act <= 11 then
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
else
--|#line 72 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 72")
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
--|#line 73 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 73")
end
last_token := Comma_code
else
--|#line 74 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 74")
end
last_token := Colon_code
end
else
--|#line 75 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 75")
end
last_token := Exclamation_code
end
else
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
end
else
if yy_act <= 21 then
if yy_act <= 20 then
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
else
--|#line 82 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 82")
end
last_token := Right_bracket_code
end
else
if yy_act = 22 then
--|#line 86 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 86")
end

				last_token := SYM_ARCHETYPE
			
else
--|#line 90 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 90")
end

				last_token := SYM_ADL_VERSION
			
end
end
end
end
else
if yy_act <= 34 then
if yy_act <= 29 then
if yy_act <= 26 then
if yy_act <= 25 then
if yy_act = 24 then
--|#line 94 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 94")
end

				last_token := SYM_IS_CONTROLLED
			
else
--|#line 98 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 98")
end

				last_token := SYM_SPECIALIZE
				in_lineno := in_lineno + 1
			
end
else
--|#line 104 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 104")
end

				last_token := SYM_CONCEPT
				in_lineno := in_lineno + 1
			
end
else
if yy_act <= 28 then
if yy_act = 27 then
--|#line 109 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 109")
end

				last_token := SYM_DEFINITION
				set_start_condition(IN_CADL_SECTION)
				in_lineno := in_lineno + 1
				definition_text_start_line := in_lineno
			
else
--|#line 116 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 116")
end

				last_token := SYM_DESCRIPTION
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				description_text_start_line := in_lineno
			
end
else
--|#line 124 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 124")
end

				last_token := SYM_INVARIANT
				set_start_condition(IN_ASSERTION_SECTION)
				in_lineno := in_lineno + 1
				invariant_text_start_line := in_lineno
			
end
end
else
if yy_act <= 32 then
if yy_act <= 31 then
if yy_act = 30 then
--|#line 131 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 131")
end

				last_token := SYM_ONTOLOGY
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				ontology_text_start_line := in_lineno
			
else
--|#line 139 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 139")
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
--|#line 156 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 156")
end
 -- any text on line with a LF
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
			
end
else
if yy_act = 33 then
--|#line 160 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 160")
end
 -- any text on line with no LF
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
			
else
--|#line 173 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 173")
end

		-- ignore unmatched chars
	
end
end
end
else
if yy_act <= 40 then
if yy_act <= 37 then
if yy_act <= 36 then
if yy_act = 35 then
--|#line 179 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 179")
end

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
else
--|#line 183 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 183")
end
in_lineno := in_lineno + text_count
end
else
--|#line 185 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 185")
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
if yy_act <= 39 then
if yy_act = 38 then
--|#line 197 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 197")
end

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
else
--|#line 201 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 201")
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
else
--|#line 213 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 213")
end

					last_token := V_VERSION_STRING
					last_string_value := text_substring (1, text_count)
			
end
end
else
if yy_act <= 43 then
if yy_act <= 42 then
if yy_act = 41 then
--|#line 219 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 219")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 225 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 225")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
end
else
--|#line 231 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 231")
end

					last_token := V_IDENTIFIER
					last_string_value := text
			
end
else
if yy_act = 44 then
--|#line 238 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 238")
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
			   18,   19,   20,   21,   22,   23,   24,   25,   26,   27,
			   28,   29,   30,   29,   29,   29,   29,   29,   29,   29,
			   29,   29,   29,   29,   29,   29,   29,   29,   29,   31,
			   32,   33,   10,   34,   41,   35,   36,   46,   47,   55,
			   50,   37,   50,   53,   38,   54,   55,   39,   55,   55,
			   57,   55,   55,   55,   42,   55,   67,   71,   72,   57,
			   74,   75,   50,   62,   50,   58,   55,   78,   61,   60,
			   63,   64,   53,  114,   54,   65,   67,   68,   55,   78,
			   55,   78,   59,   59,   55,   78,   55,   78,   67,   55,

			   78,   55,   78,  102,   82,   79,   55,   78,   80,   67,
			   71,   72,   84,  113,   83,   55,   78,   74,   75,   75,
			   81,   85,   59,  101,   76,   86,   76,   88,   90,   87,
			   77,   89,   55,   78,   55,   78,   55,   78,   55,   78,
			   67,   55,   78,   55,   78,   72,   55,   78,   95,   55,
			   78,   94,   93,   97,   98,   69,   93,   96,   67,   55,
			   78,   67,   92,   55,   78,   55,   78,  165,   99,  100,
			   55,   78,   55,   78,   55,   78,   55,   78,   55,   78,
			   55,   78,  106,  124,  107,   55,   78,  104,  105,   90,
			   67,  102,  108,   55,   78,   67,  112,  109,   78,  110,

			   55,   78,  111,   55,   78,  115,   67,   55,   78,   55,
			   78,   77,   55,   78,   55,   78,   55,   78,   55,   78,
			  146,  116,  135,   55,   78,  119,  117,  118,  120,   76,
			  121,  123,   55,   78,  156,  122,   55,   78,   51,  126,
			   55,   78,   55,   78,   55,   78,   55,   78,   55,   78,
			   69,  127,   55,   78,  132,   55,   78,   55,   78,   55,
			   78,  128,  133,  129,  131,  130,   55,   78,   69,  134,
			  139,  140,  139,   67,  137,   55,   78,  136,   55,  138,
			   55,   78,  141,   55,   78,   55,   78,   55,   78,   55,
			   78,   55,   78,   52,   55,   78,   55,   78,  142,   55,

			   78,  143,  159,  145,  159,  147,  149,   51,  148,  176,
			  144,  139,  140,  139,   49,  150,   55,   78,  153,  154,
			  153,   44,  152,   55,   78,   55,   78,   41,   55,   78,
			   55,   78,  151,   55,   78,  176,  159,  176,  159,   55,
			   78,  176,  158,  176,  157,  155,   55,   78,  176,  155,
			  176,  160,  162,  163,  162,  153,  154,  153,  161,   55,
			   78,  176,   55,   78,   55,   78,   55,   78,  168,  169,
			  168,  164,   55,   78,  162,  163,  162,  167,   55,   78,
			   55,   78,  166,  171,  172,  171,  165,  173,  165,  176,
			  170,   55,   78,   55,   78,  168,  169,  168,  174,  175,

			  174,  171,  172,  171,  174,  175,  174,  176,   55,   78,
			   40,   40,   40,   40,   40,   40,   40,   43,   43,   43,
			   43,   43,   43,   43,   45,   45,   45,   45,   45,   45,
			   45,   48,   48,   48,   48,   48,   48,   48,   56,  176,
			   56,   56,   56,   56,   59,   59,   59,   59,   66,   66,
			   66,   66,   66,   66,   66,   70,   70,   70,   70,   70,
			   70,   70,   73,   73,   73,   73,   73,   73,   73,   52,
			   52,   52,   52,   52,   52,   52,   55,   55,   55,   55,
			   55,   55,   91,   91,   91,  103,  176,  103,  103,  103,
			  103,  125,  125,  125,  125,    9,  176,  176,  176,  176,

			  176,  176,  176,  176,  176,  176,  176,  176,  176,  176,
			  176,  176,  176,  176,  176,  176,  176,  176,  176,  176,
			  176,  176,  176,  176,  176,  176,  176,  176,  176,  176,
			  176,  176,  176,  176,  176,  176,  176,  176, yy_Dummy>>)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    2,    4,    2,    2,    6,    6,   28,
			   11,    2,   11,   23,    2,   23,   30,    2,   34,   35,
			   28,   36,   37,   38,    4,   39,   42,   46,   46,   34,
			   49,   49,   50,   36,   50,   30,   56,   56,   35,   34,
			   37,   38,   54,  103,   54,   39,  101,   42,   57,   57,
			   58,   58,   59,   59,   60,   60,   61,   61,   89,   62,

			   62,   63,   63,   90,   60,   57,   64,   64,   58,   68,
			   71,   71,   62,  101,   61,   65,   65,   74,   74,   73,
			   59,   62,   59,   89,   76,   63,   76,   65,   77,   64,
			   77,   68,   79,   79,   80,   80,   82,   82,   83,   83,
			  156,   84,   84,   85,   85,   70,   86,   86,   83,   87,
			   87,   82,   80,   85,   86,   69,   83,   84,  113,   88,
			   88,   66,   79,   92,   92,   93,   93,  156,   87,   88,
			   94,   94,   95,   95,   96,   96,   97,   97,   98,   98,
			  100,  100,   94,  113,   95,   99,   99,   92,   93,  102,
			  124,  102,   96,  104,  104,  135,  100,   97,   55,   98,

			  105,  105,   99,  106,  106,  104,  146,  107,  107,  108,
			  108,   53,  109,  109,  110,  110,  111,  111,  115,  115,
			  135,  105,  124,  112,  112,  108,  106,  107,  109,   52,
			  110,  112,  116,  116,  146,  111,  117,  117,   51,  115,
			  118,  118,  119,  119,  120,  120,  121,  121,  122,  122,
			   47,  116,  123,  123,  121,  126,  126,  127,  127,  128,
			  128,  117,  122,  118,  120,  119,  130,  130,   44,  123,
			  129,  129,  129,   40,  127,  131,  131,  126,   29,  128,
			  129,  129,  130,  132,  132,  133,  133,  134,  134,  136,
			  136,  137,  137,   20,  138,  138,  141,  141,  131,  143,

			  143,  132,  159,  134,  159,  136,  138,   12,  137,    9,
			  133,  139,  139,  139,    8,  141,  142,  142,  144,  144,
			  144,    5,  143,  145,  145,  147,  147,    3,  144,  144,
			  148,  148,  142,  150,  150,    0,  149,    0,  149,  151,
			  151,    0,  148,    0,  147,  145,  149,  149,    0,  145,
			    0,  150,  152,  152,  152,  153,  153,  153,  151,  155,
			  155,    0,  152,  152,  157,  157,  158,  158,  160,  160,
			  160,  155,  161,  161,  162,  162,  162,  158,  160,  160,
			  166,  166,  157,  164,  164,  164,  165,  165,  165,    0,
			  161,  167,  167,  164,  164,  168,  168,  168,  170,  170,

			  170,  171,  171,  171,  174,  174,  174,    0,  170,  170,
			  177,  177,  177,  177,  177,  177,  177,  178,  178,  178,
			  178,  178,  178,  178,  179,  179,  179,  179,  179,  179,
			  179,  180,  180,  180,  180,  180,  180,  180,  181,    0,
			  181,  181,  181,  181,  182,  182,  182,  182,  183,  183,
			  183,  183,  183,  183,  183,  184,  184,  184,  184,  184,
			  184,  184,  185,  185,  185,  185,  185,  185,  185,  186,
			  186,  186,  186,  186,  186,  186,  187,  187,  187,  187,
			  187,  187,  188,  188,  188,  189,    0,  189,  189,  189,
			  189,  190,  190,  190,  190,  176,  176,  176,  176,  176,

			  176,  176,  176,  176,  176,  176,  176,  176,  176,  176,
			  176,  176,  176,  176,  176,  176,  176,  176,  176,  176,
			  176,  176,  176,  176,  176,  176,  176,  176,  176,  176,
			  176,  176,  176,  176,  176,  176,  176,  176, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,   23,  324,   41,  318,   45,    0,  312,  309,
			  495,   48,  304,  495,  495,  495,  495,  495,  495,  495,
			  281,  495,  495,   40,  495,  495,  495,  495,   37,  266,
			   44,    0,  495,  495,   46,   47,   49,   50,   51,   53,
			  270,  495,   63,  495,  265,  495,   65,  247,  495,   68,
			   70,  235,  226,  196,   69,  185,   64,   76,   78,   80,
			   82,   84,   87,   89,   94,  103,  158,  495,  106,  152,
			  142,  108,  495,  116,  115,  495,  122,  115,    0,  120,
			  122,  495,  124,  126,  129,  131,  134,  137,  147,   95,
			   88,    0,  151,  153,  158,  160,  162,  164,  166,  173,

			  168,   83,  176,   70,  181,  188,  191,  195,  197,  200,
			  202,  204,  211,  155,    0,  206,  220,  224,  228,  230,
			  232,  234,  236,  240,  187,    0,  243,  245,  247,  268,
			  254,  263,  271,  273,  275,  192,  277,  279,  282,  309,
			  495,  284,  304,  287,  316,  311,  203,  313,  318,  334,
			  321,  327,  350,  353,  495,  347,  137,  352,  354,  300,
			  366,  360,  372,  495,  381,  384,  368,  379,  393,  495,
			  396,  399,  495,  495,  402,  495,  495,  409,  416,  423,
			  430,  436,  440,  447,  454,  461,  468,  474,  477,  483,
			  487, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  176,    1,  177,  177,  178,  179,  178,  180,  176,
			  176,  176,  176,  176,  176,  176,  176,  176,  176,  176,
			  176,  176,  176,  176,  176,  176,  176,  176,  181,  181,
			  181,  182,  176,  176,  181,  181,  181,  181,  181,  181,
			  183,  176,  183,  176,  176,  176,  184,  176,  176,  185,
			  176,  176,  186,  176,  176,  187,  181,  181,  181,  182,
			  181,  181,  181,  181,  181,  181,  183,  176,  183,  176,
			  184,  184,  176,  185,  185,  176,  176,  176,  188,  181,
			  181,  176,  181,  181,  181,  181,  181,  181,  181,  183,
			  176,  189,  181,  181,  181,  181,  181,  181,  181,  181,

			  181,  183,  176,  189,  181,  181,  181,  181,  181,  181,
			  181,  181,  181,  183,  190,  181,  181,  181,  181,  181,
			  181,  181,  181,  181,  183,  190,  181,  181,  181,  181,
			  181,  181,  181,  181,  181,  183,  181,  181,  181,  176,
			  176,  181,  181,  181,  181,  181,  183,  181,  181,  181,
			  181,  181,  181,  176,  176,  181,  183,  181,  181,  176,
			  181,  181,  176,  176,  181,  183,  181,  181,  176,  176,
			  181,  176,  176,  176,  176,  176,    0,  176,  176,  176,
			  176,  176,  176,  176,  176,  176,  176,  176,  176,  176,
			  176, yy_Dummy>>)
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
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   46,
			   44,    1,    2,   15,   18,   16,   17,    7,    6,   13,
			    5,   11,    8,   44,   14,   12,   10,   19,   43,   43,
			   43,   20,   21,    9,   43,   43,   43,   43,   43,   43,
			   33,   34,   33,   45,   36,   37,   45,   36,   39,   45,
			    1,    2,    3,    0,    0,    0,   43,   43,   43,    0,
			   43,   43,   43,   43,   43,   43,   33,   32,   33,   36,
			    0,    0,   35,    0,    0,   38,    4,   40,    0,   43,
			   43,   41,   43,   43,   43,   43,   43,   43,   43,   33,
			    0,    0,   43,   43,   43,   43,   43,   43,   43,   43,

			   43,   33,   40,    0,   43,   43,   43,   43,   43,   43,
			   43,   43,   43,   33,    0,   43,   43,   43,   43,   43,
			   43,   43,   43,   43,   33,   42,   43,   43,   43,   43,
			   43,   43,   43,   43,   43,   33,   43,   43,   43,    0,
			   26,   43,   43,   43,   43,   43,   33,   43,   43,   22,
			   43,   43,   43,    0,   30,   43,   33,   43,   43,   22,
			   43,   43,    0,   29,   43,   33,   23,   24,    0,   27,
			   43,    0,   25,   31,    0,   28,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 495
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 176
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 177
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

	yyNb_rules: INTEGER is 45
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 46
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
