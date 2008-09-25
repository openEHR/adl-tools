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
 -- LF
				in_buffer.append_character('%N')
				in_lineno := in_lineno + 1
			
end
else
--|#line 169 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 169")
end
 -- any text on line with no LF
				in_buffer.append_string(text)
			
end
end
end
else
if yy_act <= 42 then
if yy_act <= 39 then
if yy_act <= 38 then
if yy_act = 37 then
--|#line 181 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 181")
end

		-- ignore unmatched chars
	
else
--|#line 187 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 187")
end

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
end
else
--|#line 191 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 191")
end
in_lineno := in_lineno + text_count
end
else
if yy_act <= 41 then
if yy_act = 40 then
--|#line 193 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 193")
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
--|#line 205 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 205")
end

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
end
else
--|#line 209 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 209")
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
--|#line 221 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 221")
end

					last_token := V_VERSION_STRING
					last_string_value := text_substring (1, text_count)
			
else
--|#line 227 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 227")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
else
--|#line 233 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 233")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
end
else
if yy_act <= 47 then
if yy_act = 46 then
--|#line 239 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 239")
end

					last_token := V_IDENTIFIER
					last_string_value := text
			
else
--|#line 246 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 246")
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
			   37,   48,   49,   74,   75,   38,   39,   52,   40,   52,
			   55,   41,   56,   57,  169,   57,   57,   57,   57,   57,
			   44,   57,   94,   57,   57,   57,   57,   57,   77,   78,
			   57,   95,   59,   57,   57,   57,  204,   57,   57,   57,
			   57,   57,   57,   61,   58,   57,   57,   57,   60,   59,

			   57,   57,   57,   58,   92,   57,   57,   65,   52,   63,
			   52,   57,   64,   67,   57,   57,  194,   55,   66,   56,
			   79,   57,   79,   57,   57,   57,   57,   57,   68,   81,
			   57,   81,   57,   57,   57,   57,   57,  193,   81,   69,
			   81,   62,   62,   57,  184,   58,   57,   57,   82,   57,
			   91,   81,   57,   57,   58,  183,   83,   81,   84,   57,
			  184,   86,   57,   57,   58,   74,   75,   81,   93,   58,
			   85,  182,   62,   58,  168,   87,   90,   96,   58,   80,
			   88,   77,   78,   90,   58,   58,  100,   58,  167,   89,
			   99,  195,  153,   58,   58,   58,   58,  101,  102,  152,

			   58,   58,   98,  103,   58,  104,   99,  105,   58,   58,
			   58,   58,   58,   58,  106,  140,  108,   58,   58,   58,
			   58,   58,   58,  113,  107,   58,  139,   58,   58,   58,
			  113,  116,   58,  138,   58,  114,   58,  115,   58,  117,
			   58,   58,   58,  125,  119,   58,   58,  118,   58,   58,
			  124,   58,   58,  129,  120,   58,  122,   58,   58,  121,
			   58,   58,   96,  123,  111,  127,   58,   58,   58,   58,
			   58,  159,  160,  159,   58,   58,  128,   58,  112,   58,
			  130,  131,   58,   58,   58,  132,   58,  133,  111,  134,
			   58,   58,  135,   58,  110,   58,  136,   58,  137,   58,

			   58,   58,   58,   58,   58,  109,   58,  142,  141,   58,
			   58,   58,   58,   58,  143,  144,   58,   78,   58,  148,
			   75,   58,   58,   72,   58,   58,  145,   58,  146,  147,
			  155,   58,   58,   58,   58,  149,   58,  150,   58,  158,
			   58,   58,  151,   58,  156,   58,   81,   58,   58,   58,
			  157,   58,  159,  160,  159,   58,   58,   58,  161,   80,
			   58,  165,   58,   79,   58,   58,  162,  163,  164,   58,
			   58,   58,   58,  166,   53,  170,   58,   58,   58,   58,
			  171,   58,  172,   58,   58,   58,   58,  173,   58,  174,
			   58,   58,   58,   58,  175,   58,  185,   58,   72,   58,

			   58,  177,  178,  177,   58,  176,  179,  180,  179,   58,
			  186,   58,   58,  187,   72,  187,   58,   71,  181,   58,
			   58,   58,  189,  181,  188,   58,   58,   58,   58,  192,
			   58,   58,  190,  191,  190,   58,   58,   54,   58,   58,
			   58,  177,  178,  177,  179,  180,  179,   58,  197,   58,
			   58,  187,   53,  187,  196,   58,  210,   58,   58,   58,
			  198,  199,  198,   58,   58,  184,   58,  205,  200,  190,
			  191,  190,   58,  201,  202,  201,  193,  203,  193,  198,
			  199,  198,  201,  202,  201,   58,  206,  207,  206,  204,
			  208,  204,   51,   46,   58,  206,  207,  206,   58,   43,

			  210,  210,  210,  210,  210,  210,  210,   58,  210,  210,
			  210,   58,  210,  210,  210,  210,  210,  210,  210,  210,
			   58,  169,  169,  169,  169,  169,  169,  169,  169,  169,
			  184,  169,  205,  169,  169,  169,  169,  209,  209,  209,
			  209,  209,  209,  209,  209,  209,  209,  209,  209,  209,
			  209,  209,  209,  209,  209,  209,  209,  169,  169,  169,
			  169,  209,   42,   42,   42,   42,   42,   42,   42,   42,
			   42,   42,   42,   42,   42,   42,   42,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   47,   47,   47,   47,   47,   47,   47,   47,

			   47,   47,   47,   47,   47,   47,   47,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   58,  210,   58,  210,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   70,  210,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   76,   76,   76,   76,   76,   76,
			   76,   76,   76,   76,   76,   76,   76,   76,   76,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,

			   54,   54,   54,   54,   57,  210,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   97,  210,   97,
			  210,   97,   97,   97,   97,   97,   97,   97,   97,   97,
			  126,  210,  126,  210,  126,  126,  126,  126,  126,  126,
			  126,  126,  126,  154,  154,  154,  154,  154,  154,  154,
			  154,  169,  169,  169,  169,  169,  169,  169,  169,  169,
			  169,  169,  169,  169,    9,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,

			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210, yy_Dummy>>)
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
			   23,    2,   23,   28,  209,   29,   28,   28,   29,   29,
			    4,   30,   71,   31,   30,   30,   31,   31,   51,   51,
			   35,   71,   28,   35,   35,   36,  194,   37,   36,   36,
			   37,   37,   38,   31,   68,   38,   38,   39,   30,   35,

			   39,   39,   40,   68,   68,   40,   40,   37,   52,   35,
			   52,   41,   36,   39,   41,   41,  183,   56,   38,   56,
			   79,   58,   79,   59,   58,   58,   59,   59,   40,   58,
			   60,   59,   61,   60,   60,   61,   61,  182,   60,   41,
			   61,   62,   62,   63,  169,   67,   63,   63,   59,   64,
			   67,   63,   64,   64,   67,  168,   60,   64,   61,   65,
			  184,   63,   65,   65,   66,   74,   74,   65,   69,   69,
			   62,  167,   62,   66,  153,   64,   66,   80,   69,   80,
			   65,   77,   77,   66,   82,   83,   84,   84,  152,   65,
			   83,  184,  139,   82,   83,   86,   84,   86,   87,  138,

			   88,   87,   82,   88,   86,   89,   87,   90,   89,   88,
			   87,   98,   90,   91,   91,  126,   93,   89,   92,   93,
			   98,   90,   91,   98,   92,   99,  125,   92,   93,  100,
			   98,  101,  101,  124,   99,   99,  104,  100,  100,  102,
			  102,  101,  103,  110,  104,  104,  105,  103,  106,  102,
			  109,  103,  107,  115,  105,  105,  107,  106,  115,  106,
			  108,  107,  111,  108,  111,  113,  113,  115,  114,  108,
			  116,  159,  159,  159,  117,  113,  114,  114,   97,  116,
			  116,  117,  118,  117,  119,  118,  120,  119,   96,  120,
			  122,  118,  121,  119,   95,  120,  122,  121,  123,  122,

			  127,  128,  130,  123,  129,   94,  121,  128,  127,  127,
			  128,  130,  123,  129,  129,  130,  131,   76,  132,  134,
			   73,  141,  133,   72,  134,  131,  131,  132,  132,  133,
			  141,  133,  144,  134,  135,  135,  136,  136,  137,  144,
			  142,  144,  137,  135,  142,  136,   57,  137,  150,  142,
			  143,  143,  145,  145,  145,  146,  147,  150,  146,   55,
			  143,  150,  148,   54,  146,  147,  147,  148,  149,  149,
			  151,  148,  155,  151,   53,  155,  156,  145,  149,  151,
			  156,  155,  157,  161,  157,  156,  145,  158,  158,  161,
			  170,  162,  161,  157,  162,  163,  170,  158,   49,  170,

			  162,  164,  164,  164,  163,  163,  165,  165,  165,  166,
			  171,  171,  172,  173,   46,  173,  175,   44,  166,  174,
			  171,  172,  175,  166,  174,  175,  164,  196,  174,  181,
			  181,  165,  176,  176,  176,  164,  196,   20,  173,  181,
			  165,  177,  177,  177,  179,  179,  179,  173,  186,  185,
			  186,  187,   12,  187,  185,  197,    9,  176,  185,  186,
			  188,  188,  188,  189,  197,  195,  176,  195,  189,  190,
			  190,  190,  189,  192,  192,  192,  193,  193,  193,  198,
			  198,  198,  201,  201,  201,  188,  200,  200,  200,  204,
			  204,  204,    8,    5,  188,  206,  206,  206,  192,    3,

			    0,    0,    0,    0,    0,    0,    0,  192,    0,    0,
			    0,  200,    0,    0,    0,    0,    0,    0,    0,    0,
			  200,  205,  205,  205,  205,  205,  205,  205,  205,  205,
			  205,  205,  205,  205,  205,  205,  205,  205,  205,  205,
			  205,  205,  205,  205,  205,  205,  205,  205,  205,  205,
			  205,  205,  205,  205,  205,  205,  205,  205,  205,  205,
			  205,  205,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  212,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,
			  212,  212,  213,  213,  213,  213,  213,  213,  213,  213,

			  213,  213,  213,  213,  213,  213,  213,  214,  214,  214,
			  214,  214,  214,  214,  214,  214,  214,  214,  214,  214,
			  214,  214,  215,    0,  215,    0,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  217,    0,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,

			  220,  220,  220,  220,  221,    0,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  222,    0,  222,
			    0,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  223,    0,  223,    0,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  224,  224,  224,  224,  224,  224,  224,
			  224,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  225,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,

			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,   25,  496,   45,  490,   49,    0,  490,  456,
			  764,   55,  449,  764,  764,  764,  764,  764,  764,  764,
			  423,  764,  764,   45,  764,  764,  764,  764,   57,   59,
			   65,   67,    0,  764,  764,   74,   79,   81,   86,   91,
			   96,  105,    0,  764,  391,  764,  411,  764,   51,  395,
			  764,   76,  106,  371,  360,  342,  102,  332,  115,  117,
			  124,  126,  127,  137,  143,  153,  137,  118,   67,  142,
			    0,   45,  320,  317,  163,  764,  314,  179,  764,  118,
			  162,    0,  157,  158,  160,  764,  168,  174,  173,  181,
			  185,  186,  191,  192,  275,  270,  271,  264,  184,  198,

			  202,  205,  213,  215,  209,  219,  221,  225,  233,  218,
			  208,  247,    0,  239,  241,  231,  243,  247,  255,  257,
			  259,  270,  263,  276,  203,  196,  200,  273,  274,  277,
			  275,  289,  291,  295,  297,  307,  309,  311,  162,  158,
			    0,  294,  313,  324,  305,  350,  328,  329,  335,  342,
			  321,  343,  158,  137,    0,  345,  349,  357,  361,  269,
			  764,  356,  364,  368,  399,  404,  382,  138,  125,  129,
			  363,  384,  385,  411,  392,  389,  430,  439,  764,  442,
			  764,  403,  105,   83,  145,  422,  423,  449,  458,  436,
			  467,  764,  471,  474,   54,  450,  400,  428,  477,  764,

			  484,  480,  764,  764,  487,  515,  493,  764,  764,   47,
			  764,  561,  576,  591,  606,  619,  628,  643,  658,  673,
			  688,  701,  714,  727,  735,  748, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  210,    1,  211,  211,  212,  213,  212,  214,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  215,  215,
			  215,  215,  216,  210,  210,  215,  215,  215,  215,  215,
			  215,  215,  217,  210,  217,  210,  210,  210,  218,  210,
			  210,  219,  210,  210,  220,  210,  210,  221,  215,  215,
			  215,  215,  216,  215,  215,  215,   65,   65,   65,   65,
			  217,  217,  210,  218,  218,  210,  219,  219,  210,  210,
			  210,  222,   65,   65,   65,  210,   65,   65,   65,   65,
			   65,   65,   65,   65,  217,  217,  210,  222,   65,   65,

			   65,   65,   65,   65,   65,   65,   65,   65,   65,  217,
			  217,  210,  223,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,  217,  217,  223,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,  217,  217,
			  224,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,  217,  217,  225,   65,   65,   65,   65,  210,
			  210,   65,   65,   65,   65,   65,   65,  217,  217,  225,
			   65,   65,   65,   65,   65,   65,   65,  210,  210,  210,
			  210,   65,  217,  217,  225,   65,   65,  210,   65,   65,
			  210,  210,   65,  217,  217,  225,   65,   65,  210,  210,

			   65,  210,  210,  210,  217,  210,  210,  210,  210,  205,
			    0,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210, yy_Dummy>>)
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
			    0,    1,    1,    2,    1,    1,    3,    4,    4,    3,
			    5,    4,    4,    4,    6,    4,    4,    7,    4,    4,
			    4,    4,    8,    8,    8,    9,   10,    8,    8,    8,
			    8,    8,    8,    8,    8,    8,    8,   11,   12,   13,
			   14,   15,    4,    4,    4,    3,    8, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   49,
			   47,    1,    2,   15,   18,   16,   17,    7,    6,   13,
			    5,   11,    8,   47,   14,   12,   10,   19,   46,   46,
			   46,   46,   20,   21,    9,   46,   46,   46,   46,   46,
			   46,   46,   36,   35,   36,   48,   39,   40,   48,   39,
			   42,   48,    1,    2,    3,    0,    0,    0,   46,   46,
			   46,   46,    0,   46,   46,   46,   46,   46,   46,   46,
			   36,   36,   39,    0,    0,   38,    0,    0,   41,    4,
			   43,    0,   46,   46,   46,   44,   46,   46,   46,   46,
			   46,   46,   46,   46,   36,   36,    0,    0,   46,   46,

			   46,   46,   46,   46,   46,   46,   46,   46,   46,   36,
			   36,   43,    0,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   36,   36,    0,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   36,   36,
			    0,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   36,   36,    0,   46,   46,   46,   46,    0,
			   27,   46,   46,   46,   46,   46,   46,   36,   36,    0,
			   46,   46,   25,   22,   46,   46,   46,    0,   28,    0,
			   32,   46,   36,   36,    0,   46,   46,   22,   46,   46,
			    0,   31,   46,   36,   36,    0,   23,   24,    0,   30,

			   46,    0,   26,   34,   36,   45,    0,   29,   33,   45,
			    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 764
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 210
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 211
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
