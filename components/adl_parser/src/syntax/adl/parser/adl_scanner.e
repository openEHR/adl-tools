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
if yy_act <= 24 then
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
if yy_act <= 23 then
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
else
--|#line 94 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 94")
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
--|#line 98 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 98")
end

				last_token := SYM_SPECIALIZE
				in_lineno := in_lineno + 1
			
else
--|#line 104 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 104")
end

				last_token := SYM_CONCEPT
				in_lineno := in_lineno + 1
			
end
else
--|#line 109 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 109")
end

				last_token := SYM_LANGUAGE
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				language_text_start_line := in_lineno
			
end
else
if yy_act <= 29 then
if yy_act = 28 then
--|#line 116 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 116")
end

				last_token := SYM_DESCRIPTION
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				description_text_start_line := in_lineno
			
else
--|#line 123 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 123")
end

				last_token := SYM_DEFINITION
				set_start_condition(IN_CADL_SECTION)
				in_lineno := in_lineno + 1
				definition_text_start_line := in_lineno
			
end
else
--|#line 130 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 130")
end

				last_token := SYM_INVARIANT
				set_start_condition(IN_ASSERTION_SECTION)
				in_lineno := in_lineno + 1
				invariant_text_start_line := in_lineno
			
end
end
else
if yy_act <= 33 then
if yy_act <= 32 then
if yy_act = 31 then
--|#line 137 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 137")
end

				last_token := SYM_ONTOLOGY
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				ontology_text_start_line := in_lineno
			
else
--|#line 145 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 145")
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
				str_ := STRING_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_

				set_start_condition(INITIAL)
			
end
else
--|#line 146 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 146")
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
				str_ := STRING_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_

				set_start_condition(INITIAL)
			
end
else
if yy_act <= 35 then
if yy_act = 34 then
--|#line 163 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 163")
end
 -- any text on line with a LF
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
			
else
--|#line 167 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 167")
end
 -- any text on line with no LF
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
			
end
else
--|#line 180 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 180")
end

		-- ignore unmatched chars
	
end
end
end
else
if yy_act <= 42 then
if yy_act <= 39 then
if yy_act <= 38 then
if yy_act = 37 then
--|#line 186 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 186")
end

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
else
--|#line 190 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 190")
end
in_lineno := in_lineno + text_count
end
else
--|#line 192 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 192")
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
if yy_act <= 41 then
if yy_act = 40 then
--|#line 204 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 204")
end

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
else
--|#line 208 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 208")
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
--|#line 220 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 220")
end

					last_token := V_VERSION_STRING
					last_string_value := text_substring (1, text_count)
			
end
end
else
if yy_act <= 45 then
if yy_act <= 44 then
if yy_act = 43 then
--|#line 226 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 226")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 232 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 232")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
end
else
--|#line 238 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 238")
end

					last_token := V_IDENTIFIER
					last_string_value := text
			
end
else
if yy_act = 46 then
--|#line 245 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 245")
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
			    0,   10,   11,   12,   11,   13,   10,   14,   10,   15,
			   16,   17,   18,   19,   20,   21,   22,   23,   24,   25,
			   26,   27,   28,   29,   30,   29,   29,   29,   29,   29,
			   29,   29,   29,   29,   29,   29,   29,   29,   29,   29,
			   29,   29,   31,   32,   33,   10,   29,   34,   42,   35,
			   36,   47,   48,   73,   74,   37,   38,   51,   39,   51,
			   54,   40,   55,   56,   69,   56,   56,   56,   56,   56,
			   43,   56,   69,   56,   56,   56,   56,   56,   76,   77,
			   56,   69,   58,   56,   56,   56,  162,   56,   56,   56,
			   56,   56,   58,   56,  174,   70,   56,   56,   59,   51,

			   56,   51,   61,   56,   56,   63,   69,   62,   56,   65,
			  120,   56,   56,   64,   54,   56,   55,   56,   56,   56,
			   56,   56,  176,   80,   56,   80,   66,   56,   56,   60,
			   60,   56,   80,  106,   56,   56,   67,   56,  135,   80,
			   56,   56,   81,   56,  109,   80,   56,   56,  108,   84,
			   82,   80,   57,   57,   69,   73,   74,   89,   83,   57,
			   60,   57,   57,   85,   86,   88,   91,   57,   57,   90,
			   76,   77,   88,   87,   57,   78,   57,   78,   92,   94,
			   57,   79,   57,   57,   98,   97,   77,   93,   69,   57,
			   99,   57,   96,   57,   57,  102,  101,  100,   97,   57,

			   57,   57,   57,   57,   57,  103,   69,  104,   57,   57,
			   57,  105,   57,   57,   57,   94,   57,  108,  112,   57,
			  121,   57,   74,   57,  110,   57,  111,  107,   57,  113,
			   57,  110,   57,   69,   57,   71,   57,  114,   57,   57,
			   69,   57,  115,   57,  116,   57,   57,   57,   57,  117,
			  118,  119,  123,   57,   57,   57,   57,   57,   57,   80,
			  133,  126,   57,   57,  124,   57,   57,   57,  125,  127,
			   57,   57,  130,  128,  129,   57,   57,   57,  132,   57,
			   57,   69,  131,   57,   57,   57,   57,   57,   57,   57,
			  137,   69,   57,   57,   57,  136,   57,   57,   57,  139,

			   57,  138,   69,   57,  140,  142,   57,  141,  134,   57,
			   57,   57,  143,   57,  144,  149,  179,   57,  179,   57,
			   57,  145,   57,   57,   69,  146,   57,  150,   57,  152,
			  153,  152,   57,  147,   57,  151,   57,   57,   69,  154,
			   57,   57,   69,   57,  155,   57,  156,  157,   57,   57,
			   57,  160,   57,  158,   57,  159,   57,   57,   57,  163,
			   79,   57,  164,   57,   78,   57,   69,   57,  165,   57,
			   57,  185,  161,  152,  153,  152,  166,   57,   57,   57,
			  167,   57,  169,  170,  169,   57,   57,  171,  172,  171,
			   57,  168,   57,  175,  173,  178,   57,   57,  177,  173,

			  179,   57,  179,  181,   57,   57,   57,   57,   69,  180,
			  184,   57,   57,   57,  176,   69,   57,  182,  183,  182,
			   57,   57,  169,  170,  169,   57,  171,  172,  171,  189,
			   57,   57,   57,   52,   57,  188,   71,  192,  186,   57,
			   57,   57,   57,   71,  196,  187,  190,  191,  190,   69,
			   53,   57,  182,  183,  182,   52,  193,  194,  193,  185,
			  195,  185,  176,   57,  197,   57,  190,  191,  190,  202,
			   50,   57,   57,   45,   57,  198,  199,  198,   42,  202,
			   57,   57,  193,  194,  193,  196,  200,  196,  202,  202,
			   57,  198,  199,  198,  202,  202,  202,  202,  202,  202,

			   57,  202,  202,  202,  202,  202,  202,  202,  202,   57,
			  162,  162,  162,  162,  162,  162,  162,  162,  162,  176,
			  162,  197,  162,  162,  162,  162,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  201,  162,  162,  162,  162,
			  201,   41,   41,   41,   41,   41,   41,   41,   41,   41,
			   41,   41,   41,   44,   44,   44,   44,   44,   44,   44,
			   44,   44,   44,   44,   44,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   49,   49,   49,
			   49,   49,   49,   49,   49,   49,   49,   49,   49,   57,

			  202,  202,   57,   57,   57,   57,   57,   57,   57,   57,
			   60,   60,   60,   60,   60,   60,   60,   60,   68,   68,
			   68,   68,   68,   68,   68,   68,   68,   68,   68,   68,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   56,  202,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   95,  202,  202,
			   95,   95,   95,   95,   95,   95,   95,   95,  122,  202,
			  202,  122,  122,  122,  122,  122,  122,  122,  122,  148,

			  148,  148,  148,  148,  148,  148,  162,  162,  162,  162,
			  162,  162,  162,  162,  162,  162,  162,    9,  202,  202,
			  202,  202,  202,  202,  202,  202,  202,  202,  202,  202,
			  202,  202,  202,  202,  202,  202,  202,  202,  202,  202,
			  202,  202,  202,  202,  202,  202,  202,  202,  202,  202,
			  202,  202,  202,  202,  202,  202,  202,  202,  202,  202,
			  202,  202,  202,  202, yy_Dummy>>)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    2,    4,    2,
			    2,    6,    6,   47,   47,    2,    2,   11,    2,   11,
			   23,    2,   23,   28,  160,   29,   28,   28,   29,   29,
			    4,   30,   43,   34,   30,   30,   34,   34,   50,   50,
			   35,  106,   28,   35,   35,   36,  201,   37,   36,   36,
			   37,   37,   34,   38,  160,   43,   38,   38,   30,   51,

			   39,   51,   34,   39,   39,   36,   92,   35,   40,   38,
			  106,   40,   40,   37,   55,   57,   55,   58,   57,   57,
			   58,   58,  162,   57,   59,   58,   39,   59,   59,   60,
			   60,   61,   59,   92,   61,   61,   40,   62,  122,   61,
			   62,   62,   58,   63,   95,   62,   63,   63,   94,   61,
			   59,   63,   65,   64,   70,   73,   73,   65,   60,   66,
			   60,   65,   64,   62,   63,   64,   67,   67,   66,   66,
			   76,   76,   64,   63,   81,   78,   67,   78,   70,   79,
			   82,   79,   84,   81,   84,   82,   75,   70,  107,   82,
			   85,   84,   81,   85,   86,   88,   87,   86,   85,   87,

			   88,   90,   85,   86,   89,   89,   93,   90,   87,   88,
			   90,   91,   96,   89,   91,  108,   97,  108,   98,   98,
			  107,   96,   72,   91,   96,   97,   97,   93,   98,   99,
			   99,   96,  100,  120,  101,   71,  102,  100,  103,   99,
			   68,  100,  101,  101,  102,  102,  104,  103,  105,  103,
			  104,  105,  110,  110,  113,  104,  111,  105,  112,   56,
			  120,  113,  110,  113,  111,  111,  114,  112,  112,  114,
			  115,  116,  117,  115,  116,  114,  118,  117,  119,  115,
			  116,  121,  118,  119,  124,  118,  117,  123,  125,  126,
			  124,  133,  119,  124,  127,  123,  123,  125,  126,  126,

			  128,  125,  134,  127,  127,  129,  136,  128,  121,  128,
			  129,  130,  130,  131,  131,  136,  179,  132,  179,  129,
			  130,  132,  131,  137,  146,  133,  132,  137,  138,  139,
			  139,  139,  137,  134,  141,  138,  140,  138,  147,  140,
			  144,  142,  174,  141,  141,  140,  142,  143,  143,  144,
			  142,  146,  145,  144,  139,  145,  149,  143,  150,  149,
			   54,  145,  150,  139,   53,  149,  161,  150,  151,  151,
			  154,  174,  147,  152,  152,  152,  154,  155,  151,  154,
			  155,  156,  157,  157,  157,  159,  155,  158,  158,  158,
			  156,  156,  163,  161,  159,  164,  164,  167,  163,  159,

			  165,  163,  165,  167,  166,  164,  167,  157,  175,  166,
			  173,  173,  158,  166,  176,  186,  157,  168,  168,  168,
			  173,  158,  169,  169,  169,  165,  171,  171,  171,  178,
			  177,  178,  181,   52,  165,  177,   48,  181,  175,  177,
			  178,  181,  168,   45,  186,  176,  180,  180,  180,   41,
			   20,  168,  182,  182,  182,   12,  184,  184,  184,  185,
			  185,  185,  187,  188,  187,  189,  190,  190,  190,    9,
			    8,  180,  188,    5,  189,  192,  192,  192,    3,    0,
			  180,  184,  193,  193,  193,  196,  196,  196,    0,    0,
			  184,  198,  198,  198,    0,    0,    0,    0,    0,    0,

			  192,    0,    0,    0,    0,    0,    0,    0,    0,  192,
			  197,  197,  197,  197,  197,  197,  197,  197,  197,  197,
			  197,  197,  197,  197,  197,  197,  197,  197,  197,  197,
			  197,  197,  197,  197,  197,  197,  197,  197,  197,  197,
			  197,  197,  197,  197,  197,  197,  197,  197,  197,  197,
			  197,  203,  203,  203,  203,  203,  203,  203,  203,  203,
			  203,  203,  203,  204,  204,  204,  204,  204,  204,  204,
			  204,  204,  204,  204,  204,  205,  205,  205,  205,  205,
			  205,  205,  205,  205,  205,  205,  205,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  206,  206,  207,

			    0,    0,  207,  207,  207,  207,  207,  207,  207,  207,
			  208,  208,  208,  208,  208,  208,  208,  208,  209,  209,
			  209,  209,  209,  209,  209,  209,  209,  209,  209,  209,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  212,  212,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  212,  213,    0,  213,  213,
			  213,  213,  213,  213,  213,  213,  213,  214,    0,    0,
			  214,  214,  214,  214,  214,  214,  214,  214,  215,    0,
			    0,  215,  215,  215,  215,  215,  215,  215,  215,  216,

			  216,  216,  216,  216,  216,  216,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  202,  202,  202,
			  202,  202,  202,  202,  202,  202,  202,  202,  202,  202,
			  202,  202,  202,  202,  202,  202,  202,  202,  202,  202,
			  202,  202,  202,  202,  202,  202,  202,  202,  202,  202,
			  202,  202,  202,  202,  202,  202,  202,  202,  202,  202,
			  202,  202,  202,  202, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,   25,  475,   45,  470,   49,    0,  468,  469,
			  717,   55,  452,  717,  717,  717,  717,  717,  717,  717,
			  436,  717,  717,   45,  717,  717,  717,  717,   57,   59,
			   65,    0,  717,  717,   67,   74,   79,   81,   87,   94,
			  102,  446,  717,   69,  717,  440,  717,   51,  433,  717,
			   76,   97,  430,  361,  343,   99,  245,  109,  111,  118,
			  115,  125,  131,  137,  126,  125,  132,  140,  237,  717,
			  151,  232,  219,  153,  717,  183,  168,  717,  173,  164,
			    0,  147,  153,  717,  155,  166,  167,  172,  173,  177,
			  174,  187,  103,  203,  131,  130,  185,  189,  192,  203,

			  205,  207,  209,  211,  219,  221,   78,  185,  200,    0,
			  226,  229,  231,  227,  239,  243,  244,  250,  249,  256,
			  230,  278,  123,  260,  257,  261,  262,  267,  273,  283,
			  284,  286,  290,  288,  299,    0,  279,  296,  301,  327,
			  309,  307,  314,  321,  313,  325,  321,  335,    0,  329,
			  331,  342,  371,  717,  343,  350,  354,  380,  385,  358,
			   61,  363,  107,  365,  369,  398,  377,  370,  415,  420,
			  717,  424,  717,  384,  339,  405,  399,  403,  404,  314,
			  444,  405,  450,  717,  454,  457,  412,  447,  436,  438,
			  464,  717,  473,  480,  717,  717,  483,  504,  489,  717,

			  717,   69,  717,  550,  562,  574,  586,  597,  605,  617,
			  629,  641,  653,  664,  675,  686,  693,  704, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  202,    1,  203,  203,  204,  205,  204,  206,  202,
			  202,  202,  202,  202,  202,  202,  202,  202,  202,  202,
			  202,  202,  202,  202,  202,  202,  202,  202,  207,  207,
			  207,  208,  202,  202,  207,  207,  207,  207,  207,  207,
			  207,  209,  202,  209,  202,  202,  202,  210,  202,  202,
			  211,  202,  202,  212,  202,  202,  213,  207,  207,  207,
			  208,  207,  207,  207,   63,   63,   63,   63,  209,  202,
			  209,  202,  210,  210,  202,  211,  211,  202,  202,  202,
			  214,   63,   63,  202,   63,   63,   63,   63,   63,   63,
			   63,   63,  209,  209,  202,  214,   63,   63,   63,   63,

			   63,   63,   63,   63,   63,   63,  209,  209,  202,  215,
			   63,   63,   63,   63,   63,   63,   63,   63,   63,   63,
			  209,  209,  215,   63,   63,   63,   63,   63,   63,   63,
			   63,   63,   63,  209,  209,  216,   63,   63,   63,   63,
			   63,   63,   63,   63,   63,   63,  209,  209,  217,   63,
			   63,   63,  202,  202,   63,   63,   63,   63,   63,   63,
			  209,  209,  217,   63,   63,   63,   63,   63,   63,  202,
			  202,  202,  202,   63,  209,  209,  217,   63,   63,  202,
			   63,   63,  202,  202,   63,  209,  209,  217,   63,   63,
			  202,  202,   63,  202,  202,  202,  209,  202,  202,  202,

			  202,  197,    0,  202,  202,  202,  202,  202,  202,  202,
			  202,  202,  202,  202,  202,  202,  202,  202, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    5,    1,    6,    7,    8,    8,    8,
			    9,   10,   11,   12,   13,   14,   15,   16,   17,   17,
			   17,   17,   17,   17,   17,   17,   17,   17,   18,   19,
			    8,   20,    8,   21,    8,   22,   23,   24,   25,   26,
			   27,   28,   29,   30,   23,   23,   31,   23,   32,   33,
			   34,   23,   35,   36,   37,   38,   39,   23,   23,   40,
			   41,   42,    8,   43,   44,   45,    1,   22,   23,   24,

			   25,   26,   27,   28,   29,   30,   23,   23,   31,   23,
			   32,   33,   34,   23,   35,   36,   37,   38,   46,   23,
			   23,   40,   41,    1,    1,    1,    1,    1,    1,    1,
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
			    0,    1,    1,    1,    1,    1,    2,    3,    3,    2,
			    2,    3,    3,    3,    4,    3,    3,    5,    3,    3,
			    3,    3,    6,    6,    6,    7,    8,    6,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    9,   10,   11,
			   12,    6,    3,    3,    3,    2,    6, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   48,
			   46,    1,    2,   15,   18,   16,   17,    7,    6,   13,
			    5,   11,    8,   46,   14,   12,   10,   19,   45,   45,
			   45,   20,   21,    9,   45,   45,   45,   45,   45,   45,
			   45,   35,   36,   35,   47,   38,   39,   47,   38,   41,
			   47,    1,    2,    3,    0,    0,    0,   45,   45,   45,
			    0,   45,   45,   45,   45,   45,   45,   45,   35,   34,
			   35,   38,    0,    0,   37,    0,    0,   40,    4,   42,
			    0,   45,   45,   43,   45,   45,   45,   45,   45,   45,
			   45,   45,   35,   35,    0,    0,   45,   45,   45,   45,

			   45,   45,   45,   45,   45,   45,   35,   35,   42,    0,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   35,   35,    0,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   35,   35,    0,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   35,   35,    0,   45,
			   45,   45,    0,   26,   45,   45,   45,   45,   45,   45,
			   35,   35,    0,   45,   45,   22,   45,   45,   45,    0,
			   27,    0,   31,   45,   35,   35,    0,   45,   45,   22,
			   45,   45,    0,   30,   45,   35,   35,    0,   23,   24,
			    0,   29,   45,    0,   25,   33,   35,   44,    0,   28,

			   32,   44,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 717
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 202
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 203
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

	yyNb_rules: INTEGER is 47
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 48
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

	Init_buffer_size: INTEGER is 256
				-- Initial size for `in_buffer'

invariant

	in_buffer_not_void: in_buffer /= Void

end
