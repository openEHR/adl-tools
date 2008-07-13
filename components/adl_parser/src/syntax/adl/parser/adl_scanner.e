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
if yy_act <= 24 then
if yy_act <= 12 then
if yy_act <= 6 then
if yy_act <= 3 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 52 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 52")
end
-- Ignore separators
else
--|#line 53 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 53")
end
in_lineno := in_lineno + text_count
end
else
--|#line 58 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 58")
end
-- Ignore comments
end
else
if yy_act <= 5 then
if yy_act = 4 then
--|#line 59 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 59")
end
in_lineno := in_lineno + 1
else
--|#line 63 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 63")
end
last_token := Minus_code
end
else
--|#line 64 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 64")
end
last_token := Plus_code
end
end
else
if yy_act <= 9 then
if yy_act <= 8 then
if yy_act = 7 then
--|#line 65 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 65")
end
last_token := Star_code
else
--|#line 66 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 66")
end
last_token := Slash_code
end
else
--|#line 67 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 67")
end
last_token := Caret_code
end
else
if yy_act <= 11 then
if yy_act = 10 then
--|#line 68 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 68")
end
last_token := Equal_code
else
--|#line 69 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 69")
end
last_token := Dot_code
end
else
--|#line 70 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 70")
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
--|#line 71 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 71")
end
last_token := Comma_code
else
--|#line 72 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 72")
end
last_token := Colon_code
end
else
--|#line 73 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 73")
end
last_token := Exclamation_code
end
else
if yy_act <= 17 then
if yy_act = 16 then
--|#line 74 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 74")
end
last_token := Left_parenthesis_code
else
--|#line 75 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 75")
end
last_token := Right_parenthesis_code
end
else
--|#line 76 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 76")
end
last_token := Dollar_code
end
end
else
if yy_act <= 21 then
if yy_act <= 20 then
if yy_act = 19 then
--|#line 77 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 77")
end
last_token := Question_mark_code
else
--|#line 79 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 79")
end
last_token := Left_bracket_code
end
else
--|#line 80 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 80")
end
last_token := Right_bracket_code
end
else
if yy_act <= 23 then
if yy_act = 22 then
--|#line 84 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 84")
end

				last_token := SYM_ARCHETYPE
			
else
--|#line 88 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 88")
end

				last_token := SYM_ADL_VERSION
			
end
else
--|#line 92 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 92")
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
--|#line 96 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 96")
end

				last_token := SYM_IS_GENERATED
			
else
--|#line 100 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 100")
end

				last_token := SYM_SPECIALIZE
				in_lineno := in_lineno + 1
			
end
else
--|#line 106 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 106")
end

				last_token := SYM_CONCEPT
				in_lineno := in_lineno + 1
			
end
else
if yy_act <= 29 then
if yy_act = 28 then
--|#line 111 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 111")
end

				last_token := SYM_LANGUAGE
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				language_text_start_line := in_lineno
			
else
--|#line 118 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 118")
end

				last_token := SYM_DESCRIPTION
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				description_text_start_line := in_lineno
			
end
else
--|#line 125 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 125")
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
--|#line 132 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 132")
end

				last_token := SYM_INVARIANT
				set_start_condition(IN_ASSERTION_SECTION)
				in_lineno := in_lineno + 1
				invariant_text_start_line := in_lineno
			
else
--|#line 139 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 139")
end

				last_token := SYM_ONTOLOGY
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				ontology_text_start_line := in_lineno
			
end
else
--|#line 147 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 147")
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
--|#line 148 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 148")
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
--|#line 165 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 165")
end
 -- any text on line with a LF
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
			
end
else
--|#line 169 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 169")
end
 -- any text on line with no LF
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
			
end
end
end
else
if yy_act <= 42 then
if yy_act <= 39 then
if yy_act <= 38 then
if yy_act = 37 then
--|#line 182 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 182")
end

		-- ignore unmatched chars
	
else
--|#line 188 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 188")
end

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
end
else
--|#line 192 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 192")
end
in_lineno := in_lineno + text_count
end
else
if yy_act <= 41 then
if yy_act = 40 then
--|#line 194 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 194")
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
--|#line 206 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 206")
end

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
end
else
--|#line 210 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 210")
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
--|#line 222 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 222")
end

					last_token := V_VERSION_STRING
					last_string_value := text_substring (1, text_count)
			
else
--|#line 228 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 228")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
else
--|#line 234 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 234")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
end
else
if yy_act <= 47 then
if yy_act = 46 then
--|#line 240 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 240")
end

					last_token := V_IDENTIFIER
					last_string_value := text
			
else
--|#line 247 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 247")
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
			    0,   10,   11,   12,   11,   13,   10,   14,   10,   15,
			   16,   17,   18,   19,   20,   21,   22,   23,   24,   25,
			   26,   27,   28,   29,   30,   29,   29,   29,   31,   29,
			   29,   29,   29,   29,   29,   29,   29,   29,   29,   29,
			   29,   29,   32,   33,   34,   10,   29,   35,   43,   36,
			   37,   48,   49,   75,   76,   38,   39,   52,   40,   52,
			   55,   41,   56,   57,   71,   57,   57,   57,   57,   57,
			   44,   57,   71,   57,   57,   57,   57,   57,   78,   79,
			   57,   71,   59,   57,   57,   57,  170,   57,   57,   57,
			   57,   57,   57,   61,  183,   57,   57,   57,   60,   59,

			   57,   57,   57,  154,   72,   57,   57,   65,   52,   63,
			   52,   57,   64,   67,   57,   57,   71,   55,   66,   56,
			   80,   57,   80,   57,   57,   57,   57,   57,   68,   82,
			   57,   82,   57,   57,   57,   57,   57,  111,   82,   69,
			   82,   62,   62,   57,   71,   58,   57,   57,   83,   57,
			   92,   82,   57,   57,   58,   71,   84,   82,   85,   57,
			  185,   87,   57,   57,   58,   75,   76,   82,   58,   97,
			   86,   81,   62,   58,  195,   88,   91,   58,   93,   95,
			   89,   94,   58,   91,   78,   79,   58,   58,   96,   90,
			  141,   58,  100,  101,   58,   58,   58,   58,   58,  102,

			   71,  104,  103,   58,   99,   58,   58,   58,  105,  113,
			  100,   58,  106,   58,   58,   58,  107,   58,  109,  108,
			   58,   58,   58,   58,   58,   58,   58,  110,   58,   97,
			   58,  112,   58,  116,   58,  114,   58,   58,  115,  117,
			   58,  119,  114,  118,   58,   58,   58,   71,   58,   58,
			   58,   71,  112,   58,  120,   58,  121,   58,   58,   58,
			   58,  122,  123,  124,  128,   58,  130,   58,   58,   58,
			   58,   58,   58,   71,   58,  132,  125,   58,  129,   58,
			   58,   58,  131,  126,   58,   58,   58,  133,  134,  135,
			   71,  136,   58,   58,   58,   58,   58,  138,  137,   58,

			  139,   58,   58,   58,   58,   58,   58,  142,   58,  143,
			   79,   58,   58,   58,  144,   58,   58,  140,   58,  145,
			   71,   76,   58,   58,  150,   58,  146,   58,  147,  148,
			  149,   58,   58,   58,  151,   58,   58,   58,   58,   58,
			  152,  162,   58,  157,   58,   58,  156,   58,   58,  158,
			   58,   58,   58,   71,  153,  160,  161,  160,  159,   58,
			   58,   58,  163,   58,  165,   58,   58,   58,  164,   71,
			  167,   73,   58,   58,   58,   58,   58,  172,   71,  166,
			   58,   58,   58,  173,  171,   58,  188,  169,  188,   58,
			   58,  174,   58,   71,   58,   71,  168,  160,  161,  160,

			   58,   58,   58,   58,   82,  176,  175,  194,  185,   58,
			  206,   58,   58,  177,  178,  179,  178,  180,  181,  180,
			   58,   58,  184,  187,   58,   81,   58,  186,   80,  182,
			   58,  185,   58,   58,  182,   58,  188,  189,  188,   58,
			   58,   58,   58,  191,  192,  191,  190,   71,   58,   58,
			   53,   58,  178,  179,  178,  180,  181,  180,   58,  193,
			   58,   58,  196,  197,  198,   73,   58,   58,   58,   58,
			   58,  199,  200,  199,   58,   58,  205,   58,   73,  201,
			  191,  192,  191,   58,  202,  203,  202,  194,  204,  194,
			   58,   58,  199,  200,  199,   71,   58,   54,   53,   58,

			   58,  207,  208,  207,  211,   58,  202,  203,  202,   58,
			  205,  209,  205,  207,  208,  207,   51,   46,   58,   43,
			  211,  211,  211,  211,  211,  211,   58,  211,  211,  211,
			  211,  211,  211,  211,  211,   58,  170,  170,  170,  170,
			  170,  170,  170,  170,  170,  185,  170,  206,  170,  170,
			  170,  170,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  170,  170,  170,  170,  210,   42,   42,   42,
			   42,   42,   42,   42,   42,   42,   42,   42,   42,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,

			   45,   47,   47,   47,   47,   47,   47,   47,   47,   47,
			   47,   47,   47,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   58,  211,  211,   58,   58,
			   58,   58,   58,   58,   58,   58,   62,   62,   62,   62,
			   62,   62,   62,   62,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   74,   74,   74,   74,
			   74,   74,   74,   74,   74,   74,   74,   74,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   57,  211,   57,   57,   57,   57,   57,   57,

			   57,   57,   57,   98,  211,  211,   98,   98,   98,   98,
			   98,   98,   98,   98,  127,  211,  211,  127,  127,  127,
			  127,  127,  127,  127,  127,  155,  155,  155,  155,  155,
			  155,  155,  170,  170,  170,  170,  170,  170,  170,  170,
			  170,  170,  170,    9,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211, yy_Dummy>>)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    2,    4,    2,
			    2,    6,    6,   48,   48,    2,    2,   11,    2,   11,
			   23,    2,   23,   28,  168,   29,   28,   28,   29,   29,
			    4,   30,  140,   31,   30,   30,   31,   31,   51,   51,
			   35,   44,   28,   35,   35,   36,  210,   37,   36,   36,
			   37,   37,   38,   31,  168,   38,   38,   39,   30,   35,

			   39,   39,   40,  140,   44,   40,   40,   37,   52,   35,
			   52,   41,   36,   39,   41,   41,   96,   56,   38,   56,
			   80,   58,   80,   59,   58,   58,   59,   59,   40,   58,
			   60,   59,   61,   60,   60,   61,   61,   96,   60,   41,
			   61,   62,   62,   63,  184,   67,   63,   63,   59,   64,
			   67,   63,   64,   64,   67,   72,   60,   64,   61,   65,
			  170,   63,   65,   65,   66,   75,   75,   65,   68,   81,
			   62,   81,   62,   66,  184,   64,   66,   68,   68,   72,
			   65,   69,   69,   66,   78,   78,   83,   84,   72,   65,
			  127,   69,   84,   85,   85,   83,   84,   87,   89,   87,

			   95,   89,   88,   85,   83,   88,   87,   89,   90,   98,
			   88,   90,   91,   93,   88,   92,   92,   91,   94,   93,
			   90,   94,   93,   99,   92,  101,   91,   95,  100,  112,
			   94,  112,   99,  101,  101,   99,  104,  100,  100,  102,
			  102,  104,   99,  103,  103,  104,  105,  110,  106,  102,
			  107,  111,   97,  103,  105,  105,  106,  106,  108,  107,
			  109,  107,  108,  109,  114,  114,  116,  108,  118,  109,
			  115,  116,  117,  125,  114,  118,  110,  118,  115,  115,
			  116,  117,  117,  111,  119,  120,  121,  119,  120,  121,
			  126,  122,  123,  119,  120,  121,  122,  124,  123,  128,

			  125,  123,  124,  129,  130,  122,  131,  128,  128,  129,
			   77,  124,  129,  130,  130,  131,  132,  126,  133,  131,
			  139,   74,  134,  136,  136,  132,  132,  133,  133,  134,
			  135,  134,  136,  137,  137,  135,  138,  142,  147,  143,
			  138,  147,  137,  143,  135,  138,  142,  147,  143,  144,
			  144,  145,  148,  154,  139,  146,  146,  146,  145,  144,
			  145,  148,  148,  149,  150,  150,  151,  152,  149,  153,
			  152,   73,  149,  157,  150,  151,  152,  157,  183,  151,
			  146,  156,  157,  158,  156,  158,  188,  154,  188,  146,
			  156,  159,  159,   70,  158,  169,  153,  160,  160,  160,

			  162,  159,  163,  164,   57,  163,  162,  183,  196,  162,
			  196,  163,  164,  164,  165,  165,  165,  166,  166,  166,
			  167,  171,  169,  172,  172,   55,  173,  171,   54,  167,
			  171,  185,  175,  172,  167,  173,  174,  175,  174,  165,
			  176,  175,  166,  177,  177,  177,  176,  195,  165,  176,
			   53,  166,  178,  178,  178,  180,  180,  180,  186,  182,
			  182,  174,  185,  186,  187,   49,  187,  186,  177,  182,
			  174,  189,  189,  189,  190,  187,  195,  177,   46,  190,
			  191,  191,  191,  190,  193,  193,  193,  194,  194,  194,
			  197,  198,  199,  199,  199,   42,  189,   20,   12,  197,

			  198,  201,  201,  201,    9,  189,  202,  202,  202,  193,
			  205,  205,  205,  207,  207,  207,    8,    5,  193,    3,
			    0,    0,    0,    0,    0,    0,  201,    0,    0,    0,
			    0,    0,    0,    0,    0,  201,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  212,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  212,  212,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,

			  213,  214,  214,  214,  214,  214,  214,  214,  214,  214,
			  214,  214,  214,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  216,    0,    0,  216,  216,
			  216,  216,  216,  216,  216,  216,  217,  217,  217,  217,
			  217,  217,  217,  217,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  222,    0,  222,  222,  222,  222,  222,  222,

			  222,  222,  222,  223,    0,    0,  223,  223,  223,  223,
			  223,  223,  223,  223,  224,    0,    0,  224,  224,  224,
			  224,  224,  224,  224,  224,  225,  225,  225,  225,  225,
			  225,  225,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,   25,  516,   45,  514,   49,    0,  514,  504,
			  743,   55,  495,  743,  743,  743,  743,  743,  743,  743,
			  483,  743,  743,   45,  743,  743,  743,  743,   57,   59,
			   65,   67,    0,  743,  743,   74,   79,   81,   86,   91,
			   96,  105,  492,  743,   78,  743,  475,  743,   51,  462,
			  743,   76,  106,  447,  425,  408,  102,  390,  115,  117,
			  124,  126,  127,  137,  143,  153,  137,  118,  141,  155,
			  390,  743,  152,  368,  318,  163,  743,  307,  182,  743,
			  118,  154,    0,  159,  160,  167,  743,  170,  178,  171,
			  184,  190,  188,  186,  194,  197,  113,  235,  195,  196,

			  201,  198,  213,  217,  209,  219,  221,  223,  231,  233,
			  244,  248,  214,    0,  238,  243,  244,  245,  241,  257,
			  258,  259,  269,  265,  275,  270,  287,  175,  272,  276,
			  277,  279,  289,  291,  295,  308,  296,  306,  309,  317,
			   69,    0,  310,  312,  323,  324,  353,  311,  325,  336,
			  338,  339,  340,  366,  350,    0,  354,  346,  358,  365,
			  395,  743,  373,  375,  376,  412,  415,  393,   61,  392,
			  145,  394,  397,  399,  434,  405,  413,  441,  450,  743,
			  453,  743,  433,  375,  141,  416,  431,  439,  384,  469,
			  447,  478,  743,  482,  485,  444,  393,  463,  464,  490,

			  743,  499,  504,  743,  743,  508,  530,  511,  743,  743,
			   69,  743,  576,  588,  600,  612,  623,  631,  643,  655,
			  667,  679,  690,  701,  712,  719,  730, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  211,    1,  212,  212,  213,  214,  213,  215,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  216,  216,
			  216,  216,  217,  211,  211,  216,  216,  216,  216,  216,
			  216,  216,  218,  211,  218,  211,  211,  211,  219,  211,
			  211,  220,  211,  211,  221,  211,  211,  222,  216,  216,
			  216,  216,  217,  216,  216,  216,   65,   65,   65,   65,
			  218,  211,  218,  211,  219,  219,  211,  220,  220,  211,
			  211,  211,  223,   65,   65,   65,  211,   65,   65,   65,
			   65,   65,   65,   65,   65,  218,  218,  211,  223,   65,

			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			  218,  218,  211,  224,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,  218,  218,  224,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,  218,
			  218,  225,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,  218,  218,  226,   65,   65,   65,   65,
			  211,  211,   65,   65,   65,   65,   65,   65,  218,  218,
			  226,   65,   65,   65,   65,   65,   65,   65,  211,  211,
			  211,  211,   65,  218,  218,  226,   65,   65,  211,   65,
			   65,  211,  211,   65,  218,  218,  226,   65,   65,  211,

			  211,   65,  211,  211,  211,  218,  211,  211,  211,  211,
			  206,    0,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211, yy_Dummy>>)
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
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   49,
			   47,    1,    2,   15,   18,   16,   17,    7,    6,   13,
			    5,   11,    8,   47,   14,   12,   10,   19,   46,   46,
			   46,   46,   20,   21,    9,   46,   46,   46,   46,   46,
			   46,   46,   36,   37,   36,   48,   39,   40,   48,   39,
			   42,   48,    1,    2,    3,    0,    0,    0,   46,   46,
			   46,   46,    0,   46,   46,   46,   46,   46,   46,   46,
			   36,   35,   36,   39,    0,    0,   38,    0,    0,   41,
			    4,   43,    0,   46,   46,   46,   44,   46,   46,   46,
			   46,   46,   46,   46,   46,   36,   36,    0,    0,   46,

			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   36,   36,   43,    0,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   36,   36,    0,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   36,
			   36,    0,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   36,   36,    0,   46,   46,   46,   46,
			    0,   27,   46,   46,   46,   46,   46,   46,   36,   36,
			    0,   46,   46,   25,   22,   46,   46,   46,    0,   28,
			    0,   32,   46,   36,   36,    0,   46,   46,   22,   46,
			   46,    0,   31,   46,   36,   36,    0,   23,   24,    0,

			   30,   46,    0,   26,   34,   36,   45,    0,   29,   33,
			   45,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 743
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 211
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 212
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

	yyNb_rules: INTEGER is 48
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 49
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
			create in_buffer.make (Init_buffer_size)
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
