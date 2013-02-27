indexing
	component:   "openEHR Archetype Project"
	description: "Scanner for ADL syntax items"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas@deepthought.com.au>"
	support:     "Deep Thought Informatics <support@deepthought.com.au>"
	copyright:   "Copyright (c) 2003-2005 Ocean Informatics Pty Ltd"
	license:     "Mozilla tri-license"

	file:        "$URL: http://www.openehr.org/svn/ref_impl_eiffel/TAGS/Aug2007/components/adl_parser/src/syntax/adl/parser/adl_scanner.l $"
	revision:    "$LastChangedRevision: 1874 $"
	last_change: "$LastChangedDate: 2013-02-27 14:02:03 +1100 (Wed, 27 Feb 2013) $"

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
--|#line 64 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 64")
end
-- Ignore separators
else
--|#line 65 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 65")
end
in_lineno := in_lineno + text_count
end
else
--|#line 70 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 70")
end
-- Ignore comments
end
else
if yy_act <= 5 then
if yy_act = 4 then
--|#line 71 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 71")
end
in_lineno := in_lineno + 1
else
--|#line 75 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 75")
end
last_token := Minus_code
end
else
--|#line 76 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 76")
end
last_token := Plus_code
end
end
else
if yy_act <= 9 then
if yy_act <= 8 then
if yy_act = 7 then
--|#line 77 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 77")
end
last_token := Star_code
else
--|#line 78 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 78")
end
last_token := Slash_code
end
else
--|#line 79 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 79")
end
last_token := Caret_code
end
else
if yy_act <= 11 then
if yy_act = 10 then
--|#line 80 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 80")
end
last_token := Equal_code
else
--|#line 81 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 81")
end
last_token := Dot_code
end
else
--|#line 82 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 82")
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
--|#line 83 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 83")
end
last_token := Comma_code
else
--|#line 84 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 84")
end
last_token := Colon_code
end
else
--|#line 85 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 85")
end
last_token := Exclamation_code
end
else
if yy_act <= 17 then
if yy_act = 16 then
--|#line 86 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 86")
end
last_token := Left_parenthesis_code
else
--|#line 87 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 87")
end
last_token := Right_parenthesis_code
end
else
--|#line 88 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 88")
end
last_token := Dollar_code
end
end
else
if yy_act <= 21 then
if yy_act <= 20 then
if yy_act = 19 then
--|#line 89 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 89")
end
last_token := Question_mark_code
else
--|#line 91 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 91")
end
last_token := Left_bracket_code
end
else
--|#line 92 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 92")
end
last_token := Right_bracket_code
end
else
if yy_act <= 23 then
if yy_act = 22 then
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
if yy_act <= 36 then
if yy_act <= 30 then
if yy_act <= 27 then
if yy_act <= 26 then
if yy_act = 25 then
--|#line 108 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 108")
end

				last_token := SYM_UID
			
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
if yy_act <= 29 then
if yy_act = 28 then
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
if yy_act <= 33 then
if yy_act <= 32 then
if yy_act = 31 then
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
				str_ := STRING_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_

				set_start_condition(INITIAL)
			
end
else
if yy_act <= 35 then
if yy_act = 34 then
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
if yy_act <= 42 then
if yy_act <= 39 then
if yy_act <= 38 then
if yy_act = 37 then
--|#line 196 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 196")
end

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
else
--|#line 200 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 200")
end
in_lineno := in_lineno + text_count
end
else
--|#line 202 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 202")
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
--|#line 214 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 214")
end

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
else
--|#line 218 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 218")
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
--|#line 230 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 230")
end

					last_token := V_DOTTED_NUMERIC
					last_string_value := text_substring (1, text_count)
			
end
end
else
if yy_act <= 45 then
if yy_act <= 44 then
if yy_act = 43 then
--|#line 236 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 236")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 242 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 242")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
end
else
--|#line 248 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 248")
end

					last_token := V_IDENTIFIER
					last_string_value := text
			
end
else
if yy_act <= 47 then
if yy_act = 46 then
--|#line 254 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 254")
end

					last_token := V_VALUE
					last_string_value := text
			
else
--|#line 261 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 261")
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
			   29,   29,   29,   29,   29,   29,   31,   29,   29,   29,
			   32,   33,   34,   35,   36,   44,   37,   38,   49,   50,
			   59,   59,   39,   40,   53,   41,   53,   57,   42,   58,
			   59,   61,   59,   59,   59,   45,   59,   59,   59,   59,
			   62,  197,   69,   61,   76,   77,   63,  188,   67,   79,
			   80,  187,   66,   65,  178,   68,   70,  177,   53,   71,
			   53,   81,   81,   82,   81,   81,   81,   81,   81,   81,

			   81,   81,   55,   81,   81,   55,   81,   81,   81,   81,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   81,   81,   81,   55,   57,  165,   58,   59,   84,   59,
			   84,   59,   84,   59,   84,   64,   64,   59,   84,   59,
			   84,   59,   84,   82,   87,   82,   85,   89,  164,   86,
			   59,   84,   59,   84,   91,   59,   84,   90,   97,   59,
			   84,   76,   77,   92,   88,  152,   64,   98,   79,   80,
			   94,   96,   99,  151,   83,   93,   59,   84,   95,   59,
			   84,   59,   84,   59,   84,   59,   84,  139,   59,   84,

			   59,   84,  138,   59,   84,  104,  127,  102,  103,  126,
			  106,  107,  125,  102,  105,   59,   84,  101,   59,   84,
			   59,   84,   59,   84,  113,   59,   84,   59,   84,  108,
			  110,   59,   84,   59,   84,   59,   84,  109,  112,  117,
			   59,   84,  111,  118,   59,   84,   82,  115,  116,   59,
			   84,  119,   80,   59,   84,   99,  120,  113,   59,   84,
			   77,  121,   59,   84,   59,   84,  123,   74,  122,  124,
			  128,   59,   84,   59,   84,   84,   59,   84,   59,   84,
			   59,   84,   83,  129,   59,   84,   54,  130,  135,  132,
			   74,  131,  133,  181,  134,  181,   59,   84,   59,   84,

			   74,   59,   84,  136,  137,   59,   84,   59,   84,   59,
			   84,   59,   84,   59,   84,   59,   84,   59,   84,  141,
			  142,   59,   84,  147,   73,  148,   59,   84,   59,   84,
			  144,  143,  145,  146,  150,  149,   59,   84,   59,  156,
			  157,  156,   59,   84,   55,  154,   59,   84,  153,   59,
			   84,   54,   59,   84,   59,   84,  155,  201,  158,   59,
			   84,   59,   84,   59,   84,   52,  161,   59,   84,  159,
			  160,   59,   84,  156,  157,  156,   47,  163,   44,  166,
			   59,   84,  201,  168,  167,  162,   59,   84,   59,   84,
			  172,  173,  172,  174,  175,  174,   59,   84,  201,  169,

			   59,   84,  170,   59,   84,   59,   84,   59,   84,  201,
			  181,  171,  181,   59,   84,   59,   84,  201,  176,  180,
			   59,   84,  201,  176,  179,  184,  185,  184,  172,  173,
			  172,  182,   59,   84,  183,   59,   84,  174,  175,  174,
			   59,   84,   59,   84,  186,  191,  192,  191,   59,   84,
			  184,  185,  184,  190,  201,   59,   84,  201,  189,  194,
			  195,  194,  187,  196,  187,  201,  193,   59,   84,   59,
			   84,   59,   84,  191,  192,  191,  198,  199,  198,  194,
			  195,  194,  197,  200,  197,  201,   59,   84,  198,  199,
			  198,   43,   43,   43,   43,   43,   43,   43,   43,   43,

			   46,   46,   46,   46,   46,   46,   46,   46,   46,   48,
			   48,   48,   48,   48,   48,   48,   48,   48,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   56,  201,   56,
			   56,   56,   56,   56,   60,  201,   60,   60,   60,   60,
			   60,   64,   64,   64,   64,   64,   72,  201,   72,   72,
			   72,   72,   72,   72,   72,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   59,   59,   59,   59,   59,   59,   59,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,  100,
			  100,  100,  100,  114,  201,  114,  114,  114,  114,  114,

			  140,  140,  140,  140,  140,    9,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  201,  201,  201,  201, yy_Dummy>>)
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
			   31,   28,   36,   37,   40,    4,   38,   39,   41,   42,
			   30,  188,   40,   36,   49,   49,   31,  178,   38,   52,
			   52,  177,   37,   36,  165,   39,   41,  164,   53,   42,
			   53,   55,   55,   55,   55,   55,   55,   55,   55,   55,

			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   58,  152,   58,   60,   60,   61,
			   61,   62,   62,   63,   63,   64,   64,   65,   65,   66,
			   66,   67,   67,   82,   63,   82,   61,   65,  151,   62,
			   68,   68,   69,   69,   67,   70,   70,   66,   73,   71,
			   71,   76,   76,   67,   64,  139,   64,   73,   79,   79,
			   69,   71,   83,  138,   83,   68,   85,   85,   70,   86,
			   86,   87,   87,   89,   89,   90,   90,  126,   91,   91,

			   92,   92,  125,   93,   93,   90,  114,   86,   89,  112,
			   92,   93,  111,   90,   91,   94,   94,   85,   95,   95,
			   96,   96,  101,  101,   99,  102,  102,  103,  103,   94,
			   96,  104,  104,  105,  105,  106,  106,   95,   98,  103,
			  107,  107,   97,  104,  108,  108,   81,  101,  102,  109,
			  109,  105,   78,  110,  110,  113,  106,  113,  115,  115,
			   75,  107,  116,  116,  117,  117,  109,   74,  108,  110,
			  115,  118,  118,  119,  119,   59,  120,  120,  121,  121,
			  122,  122,   57,  116,  123,  123,   54,  117,  122,  119,
			   50,  118,  120,  181,  121,  181,  124,  124,  128,  128,

			   47,  129,  129,  123,  124,  130,  130,  131,  131,  132,
			  132,  135,  135,  133,  133,  134,  134,  137,  137,  128,
			  129,  136,  136,  134,   45,  135,  141,  141,  142,  142,
			  131,  130,  132,  133,  137,  136,  143,  143,   29,  144,
			  144,  144,  145,  145,   20,  142,  146,  146,  141,  144,
			  144,   12,  147,  147,  148,  148,  143,    9,  145,  149,
			  149,  150,  150,  153,  153,    8,  148,  154,  154,  146,
			  147,  155,  155,  156,  156,  156,    5,  150,    3,  153,
			  158,  158,    0,  155,  154,  149,  159,  159,  160,  160,
			  161,  161,  161,  162,  162,  162,  163,  163,    0,  158,

			  161,  161,  159,  162,  162,  166,  166,  167,  167,    0,
			  168,  160,  168,  169,  169,  170,  170,    0,  163,  167,
			  168,  168,    0,  163,  166,  171,  171,  171,  172,  172,
			  172,  169,  176,  176,  170,  171,  171,  174,  174,  174,
			  179,  179,  180,  180,  176,  182,  182,  182,  183,  183,
			  184,  184,  184,  180,    0,  182,  182,    0,  179,  186,
			  186,  186,  187,  187,  187,    0,  183,  189,  189,  186,
			  186,  190,  190,  191,  191,  191,  193,  193,  193,  194,
			  194,  194,  197,  197,  197,    0,  193,  193,  198,  198,
			  198,  202,  202,  202,  202,  202,  202,  202,  202,  202,

			  203,  203,  203,  203,  203,  203,  203,  203,  203,  204,
			  204,  204,  204,  204,  204,  204,  204,  204,  205,  205,
			  205,  205,  205,  205,  205,  205,  205,  206,    0,  206,
			  206,  206,  206,  206,  207,    0,  207,  207,  207,  207,
			  207,  208,  208,  208,  208,  208,  209,    0,  209,  209,
			  209,  209,  209,  209,  209,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  212,  212,  212,  212,  212,  212,  212,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  214,
			  214,  214,  214,  215,    0,  215,  215,  215,  215,  215,

			  216,  216,  216,  216,  216,  201,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  201,  201,  201,  201, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,   24,  375,   42,  373,   46,    0,  363,  357,
			  605,   52,  348,  605,  605,  605,  605,  605,  605,  605,
			  332,  605,  605,   44,  605,  605,  605,  605,   38,  326,
			   39,   48,    0,  605,  605,    0,   50,   51,   54,   55,
			   52,   56,   57,    0,  605,  300,  605,  297,  605,   72,
			  287,  605,   77,   86,  283,   90,    0,  267,  121,  262,
			  125,  127,  129,  131,  133,  135,  137,  139,  148,  150,
			  153,  157,    0,  143,  264,  257,  169,  605,  249,  176,
			  605,  243,  151,  169,    0,  174,  177,  179,  605,  181,
			  183,  186,  188,  191,  203,  206,  208,  214,  216,  209,

			    0,  210,  213,  215,  219,  221,  223,  228,  232,  237,
			  241,  182,  176,  242,  193,  246,  250,  252,  259,  261,
			  264,  266,  268,  272,  284,  174,  169,    0,  286,  289,
			  293,  295,  297,  301,  303,  299,  309,  305,  148,  143,
			    0,  314,  316,  324,  337,  330,  334,  340,  342,  347,
			  349,  130,  100,  351,  355,  359,  371,  605,  368,  374,
			  376,  388,  391,  384,   56,   56,  393,  395,  408,  401,
			  403,  423,  426,  605,  435,  605,  420,   51,   46,  428,
			  430,  291,  443,  436,  448,  605,  457,  460,   41,  455,
			  459,  471,  605,  474,  477,  605,  605,  480,  486,  605,

			  605,  605,  490,  499,  508,  517,  524,  531,  536,  545,
			  554,  563,  570,  579,  583,  590,  595, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  201,    1,  202,  202,  203,  204,  203,  205,  201,
			  201,  201,  201,  201,  201,  201,  201,  201,  201,  201,
			  206,  201,  201,  206,  201,  201,  201,  201,  207,  207,
			  207,  207,  208,  201,  201,  206,  207,  207,  207,  207,
			  207,  207,  207,  209,  201,  209,  201,  201,  201,  210,
			  201,  201,  211,  201,  201,  201,  206,  201,  206,  212,
			  207,  207,  207,  207,  208,  207,  207,  207,  207,  207,
			  207,  207,  209,  209,  201,  210,  210,  201,  211,  211,
			  201,  213,  201,  201,  214,  207,  207,  207,  201,  207,
			  207,  207,  207,  207,  207,  207,  207,  209,  209,  201,

			  215,  207,  207,  207,  207,  207,  207,  207,  207,  207,
			  207,  209,  209,  201,  215,  207,  207,  207,  207,  207,
			  207,  207,  207,  207,  207,  209,  209,  216,  207,  207,
			  207,  207,  207,  207,  207,  207,  207,  207,  209,  209,
			  216,  207,  207,  207,  207,  207,  207,  207,  207,  207,
			  207,  209,  209,  207,  207,  207,  201,  201,  207,  207,
			  207,  207,  207,  207,  209,  209,  207,  207,  207,  207,
			  207,  207,  201,  201,  201,  201,  207,  209,  209,  207,
			  207,  201,  207,  207,  201,  201,  207,  209,  209,  207,
			  207,  201,  201,  207,  201,  201,  201,  209,  201,  201,

			  201,    0,  201,  201,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  201,  201, yy_Dummy>>)
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
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   49,
			   47,    1,    2,   15,   18,   16,   17,    7,    6,   13,
			    5,   11,    8,   46,   14,   12,   10,   19,   45,   45,
			   45,   45,   20,   21,    9,   46,   45,   45,   45,   45,
			   45,   45,   45,   36,   35,   36,   48,   38,   39,   48,
			   38,   41,   48,    1,    2,    3,   46,    0,   46,   46,
			   45,   45,   45,   45,    0,   45,   45,   45,   45,   45,
			   45,   45,   36,   36,   38,    0,    0,   37,    0,    0,
			   40,    3,    4,   42,    0,   45,   45,   25,   43,   45,
			   45,   45,   45,   45,   45,   45,   45,   36,   36,    0,

			    0,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   36,   36,   42,    0,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   36,   36,    0,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   36,   36,
			   44,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   36,   36,   45,   45,   45,    0,   27,   45,   45,
			   45,   45,   45,   45,   36,   36,   45,   45,   22,   45,
			   45,   45,    0,   28,    0,   32,   45,   36,   36,   45,
			   45,   22,   45,   45,    0,   31,   45,   36,   36,   23,
			   24,    0,   30,   45,    0,   26,   34,   36,    0,   29,

			   33,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 605
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 201
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 202
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
