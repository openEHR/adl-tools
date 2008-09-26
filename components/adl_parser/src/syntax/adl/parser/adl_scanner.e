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
 -- LF
				in_buffer.append_character('%N')
				in_lineno := in_lineno + 1
			
else
--|#line 167 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 167")
end
 -- any text on line with no LF
				in_buffer.append_string(text)
			
end
else
--|#line 179 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 179")
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
--|#line 185 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 185")
end

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
else
--|#line 189 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 189")
end
in_lineno := in_lineno + text_count
end
else
--|#line 191 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 191")
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
--|#line 203 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 203")
end

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
else
--|#line 207 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 207")
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
--|#line 219 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 219")
end

					last_token := V_VERSION_STRING
					last_string_value := text_substring (1, text_count)
			
end
end
else
if yy_act <= 45 then
if yy_act <= 44 then
if yy_act = 43 then
--|#line 225 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 225")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 231 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 231")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
end
else
--|#line 237 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 237")
end

					last_token := V_IDENTIFIER
					last_string_value := text
			
end
else
if yy_act = 46 then
--|#line 244 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 244")
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
			   29,   29,   29,   29,   29,   29,   29,   29,   29,   29,
			   31,   32,   33,   10,   34,   42,   35,   36,   47,   48,
			   56,   56,   37,   38,   51,   39,   51,   54,   40,   55,
			   56,   58,   56,   56,   56,   43,   56,   56,   56,  191,
			   59,   58,   65,  182,   63,   72,   73,   75,   76,   56,
			   79,   61,   62,  181,   64,   66,  172,   51,   67,   51,
			   54,  171,   55,   56,   79,   56,   79,   60,   60,   56,

			   79,   56,   79,   56,   79,   56,   79,  159,   91,   83,
			   80,   56,   79,   81,   56,   79,   85,   92,  158,   84,
			   56,   79,   72,   73,  146,   86,   82,  145,   60,   88,
			   87,  133,   90,   75,   76,  132,   77,   89,   77,   93,
			  121,   78,   56,   79,   56,   79,   56,   79,   56,   79,
			  120,   56,   79,   56,   79,  119,   56,   79,   98,   56,
			   79,   97,   96,  100,  101,  107,   96,   99,   56,   79,
			   56,   79,  106,   95,   56,   79,   56,   79,  103,   93,
			  104,  107,  102,   56,   79,   56,   79,  105,  111,   56,
			   79,   56,   79,   56,   79,   56,   79,  112,   76,  109,

			   56,   79,   56,   79,   56,   79,  110,  113,   56,   79,
			   56,   79,  114,  175,  115,  175,  122,  117,  118,  116,
			   56,   79,   56,   79,   73,   56,   79,   56,   79,  123,
			   70,   56,   79,  124,   56,   79,   56,   79,  126,  129,
			  125,  127,   79,  128,  131,   56,   79,   78,   56,   79,
			   56,   79,   77,  130,   56,   79,   56,   79,   56,   79,
			   56,   79,   52,   56,   79,   70,  135,  136,  141,   56,
			   79,   56,   79,   56,   79,   70,  137,  138,  140,  139,
			  144,   56,   79,  142,   69,  143,   56,   79,   56,  150,
			  151,  150,   56,   79,   53,  147,   56,   79,  148,   56,

			   79,   52,   56,   79,   56,   79,  149,  195,  152,   56,
			   79,   56,   79,   56,   79,   50,  155,   56,   79,  153,
			  154,   56,   79,  150,  151,  150,   45,  157,   42,  160,
			   56,   79,  195,  162,  161,  156,   56,   79,   56,   79,
			  166,  167,  166,  168,  169,  168,   56,   79,  195,  163,
			   56,   79,  164,   56,   79,   56,   79,   56,   79,  195,
			  175,  165,  175,   56,   79,   56,   79,  195,  170,  174,
			   56,   79,  195,  170,  173,  178,  179,  178,  166,  167,
			  166,  176,   56,   79,  177,   56,   79,  168,  169,  168,
			   56,   79,   56,   79,  180,  185,  186,  185,   56,   79,

			  178,  179,  178,  184,  195,   56,   79,  195,  183,  188,
			  189,  188,  181,  190,  181,  195,  187,   56,   79,   56,
			   79,   56,   79,  185,  186,  185,  192,  193,  192,  188,
			  189,  188,  191,  194,  191,  195,   56,   79,  192,  193,
			  192,   41,   41,   41,   41,   41,   41,   41,   41,   41,
			   44,   44,   44,   44,   44,   44,   44,   44,   44,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   49,   49,
			   49,   49,   49,   49,   49,   49,   49,   57,  195,   57,
			   57,   57,   57,   57,   60,   60,   60,   60,   60,   68,
			  195,   68,   68,   68,   68,   68,   68,   68,   71,   71,

			   71,   71,   71,   71,   71,   71,   71,   74,   74,   74,
			   74,   74,   74,   74,   74,   74,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   56,   56,   56,   56,   56,
			   56,   56,   94,   94,   94,   94,  108,  195,  108,  108,
			  108,  108,  108,  134,  134,  134,  134,  134,    9,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195, yy_Dummy>>)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    2,    4,    2,    2,    6,    6,
			   28,   30,    2,    2,   11,    2,   11,   23,    2,   23,
			   34,   28,   36,   35,   38,    4,   37,   39,   40,  182,
			   30,   34,   38,  172,   36,   47,   47,   50,   50,   57,
			   57,   34,   35,  171,   37,   39,  159,   51,   40,   51,
			   55,  158,   55,   58,   58,   59,   59,   60,   60,   61,

			   61,   62,   62,   63,   63,   64,   64,  146,   69,   61,
			   58,   65,   65,   59,   66,   66,   63,   69,  145,   62,
			   67,   67,   72,   72,  133,   63,   60,  132,   60,   65,
			   64,  120,   67,   75,   75,  119,   77,   66,   77,   78,
			  108,   78,   80,   80,   81,   81,   83,   83,   84,   84,
			  106,   85,   85,   86,   86,  105,   87,   87,   84,   89,
			   89,   83,   81,   86,   87,   93,   84,   85,   88,   88,
			   90,   90,   92,   80,   95,   95,   97,   97,   89,  107,
			   90,  107,   88,   96,   96,   98,   98,   91,   97,   99,
			   99,  100,  100,  101,  101,  102,  102,   98,   74,   95,

			  103,  103,  104,  104,  109,  109,   96,   99,  110,  110,
			  111,  111,  100,  175,  101,  175,  109,  103,  104,  102,
			  112,  112,  113,  113,   71,  114,  114,  115,  115,  110,
			   70,  116,  116,  111,  117,  117,  118,  118,  113,  116,
			  112,  114,   56,  115,  118,  122,  122,   54,  123,  123,
			  124,  124,   53,  117,  125,  125,  126,  126,  127,  127,
			  128,  128,   52,  131,  131,   48,  122,  123,  128,  129,
			  129,  130,  130,  135,  135,   45,  124,  125,  127,  126,
			  131,  136,  136,  129,   43,  130,  137,  137,   29,  138,
			  138,  138,  139,  139,   20,  135,  140,  140,  136,  138,

			  138,   12,  141,  141,  142,  142,  137,    9,  139,  143,
			  143,  144,  144,  147,  147,    8,  142,  148,  148,  140,
			  141,  149,  149,  150,  150,  150,    5,  144,    3,  147,
			  152,  152,    0,  149,  148,  143,  153,  153,  154,  154,
			  155,  155,  155,  156,  156,  156,  157,  157,    0,  152,
			  155,  155,  153,  156,  156,  160,  160,  161,  161,    0,
			  162,  154,  162,  163,  163,  164,  164,    0,  157,  161,
			  162,  162,    0,  157,  160,  165,  165,  165,  166,  166,
			  166,  163,  170,  170,  164,  165,  165,  168,  168,  168,
			  173,  173,  174,  174,  170,  176,  176,  176,  177,  177,

			  178,  178,  178,  174,    0,  176,  176,    0,  173,  180,
			  180,  180,  181,  181,  181,    0,  177,  183,  183,  180,
			  180,  184,  184,  185,  185,  185,  187,  187,  187,  188,
			  188,  188,  191,  191,  191,    0,  187,  187,  192,  192,
			  192,  196,  196,  196,  196,  196,  196,  196,  196,  196,
			  197,  197,  197,  197,  197,  197,  197,  197,  197,  198,
			  198,  198,  198,  198,  198,  198,  198,  198,  199,  199,
			  199,  199,  199,  199,  199,  199,  199,  200,    0,  200,
			  200,  200,  200,  200,  201,  201,  201,  201,  201,  202,
			    0,  202,  202,  202,  202,  202,  202,  202,  203,  203,

			  203,  203,  203,  203,  203,  203,  203,  204,  204,  204,
			  204,  204,  204,  204,  204,  204,  205,  205,  205,  205,
			  205,  205,  205,  205,  205,  206,  206,  206,  206,  206,
			  206,  206,  207,  207,  207,  207,  208,    0,  208,  208,
			  208,  208,  208,  209,  209,  209,  209,  209,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,   24,  325,   42,  323,   46,    0,  313,  307,
			  548,   52,  298,  548,  548,  548,  548,  548,  548,  548,
			  282,  548,  548,   44,  548,  548,  548,  548,   38,  276,
			   39,    0,  548,  548,   48,   51,   50,   54,   52,   55,
			   56,    0,  548,  260,  548,  272,  548,   73,  262,  548,
			   75,   85,  259,  249,  232,   77,  229,   67,   81,   83,
			   85,   87,   89,   91,   93,   99,  102,  108,    0,   83,
			  227,  221,  120,  548,  195,  131,  548,  134,  126,    0,
			  130,  132,  548,  134,  136,  139,  141,  144,  156,  147,
			  158,  159,  150,  150,    0,  162,  171,  164,  173,  177,

			  179,  181,  183,  188,  190,  125,  117,  166,  127,  192,
			  196,  198,  208,  210,  213,  215,  219,  222,  224,  107,
			  103,    0,  233,  236,  238,  242,  244,  246,  248,  257,
			  259,  251,   92,   92,    0,  261,  269,  274,  287,  280,
			  284,  290,  292,  297,  299,   90,   72,  301,  305,  309,
			  321,  548,  318,  324,  326,  338,  341,  334,   60,   58,
			  343,  345,  358,  351,  353,  373,  376,  548,  385,  548,
			  370,   53,   42,  378,  380,  211,  393,  386,  398,  548,
			  407,  410,   39,  405,  409,  421,  548,  424,  427,  548,
			  548,  430,  436,  548,  548,  548,  440,  449,  458,  467,

			  474,  479,  488,  497,  506,  515,  522,  526,  533,  538, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  195,    1,  196,  196,  197,  198,  197,  199,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  200,  200,
			  200,  201,  195,  195,  200,  200,  200,  200,  200,  200,
			  200,  202,  195,  202,  195,  195,  195,  203,  195,  195,
			  204,  195,  195,  205,  195,  195,  206,  200,  200,  200,
			  201,  200,  200,  200,  200,  200,  200,  200,  202,  202,
			  195,  203,  203,  195,  204,  204,  195,  195,  195,  207,
			  200,  200,  195,  200,  200,  200,  200,  200,  200,  200,
			  200,  202,  202,  195,  208,  200,  200,  200,  200,  200,

			  200,  200,  200,  200,  200,  202,  202,  195,  208,  200,
			  200,  200,  200,  200,  200,  200,  200,  200,  200,  202,
			  202,  209,  200,  200,  200,  200,  200,  200,  200,  200,
			  200,  200,  202,  202,  209,  200,  200,  200,  200,  200,
			  200,  200,  200,  200,  200,  202,  202,  200,  200,  200,
			  195,  195,  200,  200,  200,  200,  200,  200,  202,  202,
			  200,  200,  200,  200,  200,  200,  195,  195,  195,  195,
			  200,  202,  202,  200,  200,  195,  200,  200,  195,  195,
			  200,  202,  202,  200,  200,  195,  195,  200,  195,  195,
			  195,  202,  195,  195,  195,    0,  195,  195,  195,  195,

			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195, yy_Dummy>>)
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
			   32,   21,   33,   34,   35,   36,   37,   21,   21,   38,
			   39,   40,    1,   41,   42,   43,    1,   20,   21,   22,

			   23,   24,   25,   26,   27,   28,   21,   21,   29,   21,
			   30,   31,   32,   21,   33,   34,   35,   36,   37,   21,
			   21,   38,   39,    1,    1,    1,    1,    1,    1,    1,
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
			    1,    1,    3,    4,    1,    5,    1,    1,    1,    1,
			    6,    6,    6,    7,    8,    6,    6,    6,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,    6,    9,
			    1,    1,    1,    3, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   48,
			   46,    1,    2,   15,   18,   16,   17,    7,    6,   13,
			    5,   11,    8,   46,   14,   12,   10,   19,   45,   45,
			   45,   20,   21,    9,   45,   45,   45,   45,   45,   45,
			   45,   35,   34,   35,   47,   38,   39,   47,   38,   41,
			   47,    1,    2,    3,    0,    0,    0,   45,   45,   45,
			    0,   45,   45,   45,   45,   45,   45,   45,   35,   35,
			   38,    0,    0,   37,    0,    0,   40,    4,   42,    0,
			   45,   45,   43,   45,   45,   45,   45,   45,   45,   45,
			   45,   35,   35,    0,    0,   45,   45,   45,   45,   45,

			   45,   45,   45,   45,   45,   35,   35,   42,    0,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   35,
			   35,    0,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   35,   35,   44,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   35,   35,   45,   45,   45,
			    0,   26,   45,   45,   45,   45,   45,   45,   35,   35,
			   45,   45,   22,   45,   45,   45,    0,   27,    0,   31,
			   45,   35,   35,   45,   45,   22,   45,   45,    0,   30,
			   45,   35,   35,   23,   24,    0,   29,   45,    0,   25,
			   33,   35,    0,   28,   32,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 548
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 195
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 196
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
