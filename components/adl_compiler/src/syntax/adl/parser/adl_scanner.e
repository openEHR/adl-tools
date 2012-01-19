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
if yy_act <= 28 then
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
if yy_act <= 25 then
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

				last_token := SYM_TEMPLATE_OVERLAY
			
end
else
if yy_act = 24 then
--|#line 105 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 105")
end

				last_token := SYM_TEMPLATE
			
else
--|#line 109 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 109")
end

				last_token := SYM_OPERATIONAL_TEMPLATE
			
end
end
else
if yy_act <= 27 then
if yy_act = 26 then
--|#line 113 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 113")
end

				last_token := SYM_ADL_VERSION
			
else
--|#line 117 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 117")
end

				last_token := SYM_IS_CONTROLLED
			
end
else
--|#line 121 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 121")
end

				last_token := SYM_IS_GENERATED
			
end
end
end
end
else
if yy_act <= 42 then
if yy_act <= 35 then
if yy_act <= 32 then
if yy_act <= 30 then
if yy_act = 29 then
--|#line 125 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 125")
end

				last_token := SYM_SPECIALIZE
				in_lineno := in_lineno + 1
			
else
--|#line 131 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 131")
end

				last_token := SYM_CONCEPT
				in_lineno := in_lineno + 1
			
end
else
if yy_act = 31 then
--|#line 136 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 136")
end

				last_token := SYM_LANGUAGE
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				language_text_start_line := in_lineno
			
else
--|#line 143 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 143")
end

				last_token := SYM_DESCRIPTION
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				description_text_start_line := in_lineno
			
end
end
else
if yy_act <= 34 then
if yy_act = 33 then
--|#line 150 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 150")
end

				last_token := SYM_DEFINITION
				set_start_condition(IN_CADL_SECTION)
				in_lineno := in_lineno + 1
				definition_text_start_line := in_lineno
			
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
else
--|#line 164 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 164")
end

				last_token := SYM_ONTOLOGY
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				ontology_text_start_line := in_lineno
			
end
end
else
if yy_act <= 39 then
if yy_act <= 37 then
if yy_act = 36 then
--|#line 171 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 171")
end

				last_token := SYM_ANNOTATIONS
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				annotations_text_start_line := in_lineno
			
else
--|#line 178 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 178")
end

				last_token := SYM_COMPONENT_ONTOLOGIES
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				comp_onts_text_start_line := in_lineno
			
end
else
if yy_act = 38 then
--|#line 186 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 186")
end
 -- line starting with "definition" or "description" or "annotations"
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
--|#line 187 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 187")
end
 -- line starting with "definition" or "description" or "annotations"
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
end
else
if yy_act <= 41 then
if yy_act = 40 then
--|#line 188 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 188")
end
 -- line starting with "definition" or "description" or "annotations"
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
--|#line 189 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 189")
end
 -- line starting with "definition" or "description" or "annotations"
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
--|#line 206 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 206")
end
 -- LF
				in_buffer.append_character('%N')
				in_lineno := in_lineno + 1
			
end
end
end
else
if yy_act <= 49 then
if yy_act <= 46 then
if yy_act <= 44 then
if yy_act = 43 then
--|#line 210 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 210")
end
 -- any text on line with no LF
				in_buffer.append_string(text)
			
else
--|#line 222 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 222")
end

		-- ignore unmatched chars
	
end
else
if yy_act = 45 then
--|#line 228 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 228")
end

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
else
--|#line 232 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 232")
end
in_lineno := in_lineno + text_count
end
end
else
if yy_act <= 48 then
if yy_act = 47 then
--|#line 234 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 234")
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
--|#line 246 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 246")
end

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
end
else
--|#line 250 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 250")
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
if yy_act <= 52 then
if yy_act <= 51 then
if yy_act = 50 then
--|#line 262 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 262")
end

					last_token := V_VERSION_STRING
					last_string_value := text_substring (1, text_count)
			
else
--|#line 268 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 268")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
else
--|#line 274 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 274")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
end
else
if yy_act <= 54 then
if yy_act = 53 then
--|#line 280 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 280")
end

					last_token := V_IDENTIFIER
					last_string_value := text
			
else
--|#line 287 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 287")
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
			   35,   44,   36,   37,   51,   52,   61,   70,   38,   39,
			  313,   55,   40,   55,   65,   41,   42,   66,   71,   45,
			   72,   46,   47,   81,   82,   35,   36,   42,   58,   88,
			   59,   59,   70,   84,   85,   55,   88,   55,   87,   87,
			   58,   88,   59,   59,   45,   46,   88,   89,   92,   92,

			   88,   88,   88,   88,   88,   88,   90,   88,   88,   88,
			  310,   91,   94,  107,   81,   82,   93,   97,   88,   95,
			   96,  102,  103,  108,  100,   88,  104,   98,   88,   99,
			  101,   84,   85,   86,   88,   86,   94,   88,   88,   99,
			  109,  101,   87,   87,  116,  112,  114,  113,  114,  114,
			   88,  111,   88,   88,   88,   88,   88,   88,  115,   88,
			  117,  118,   88,  130,  120,  121,  131,  131,   88,  119,
			  112,   88,  122,  125,   88,  123,   88,   88,  124,   88,
			  114,  126,  114,  114,   88,  118,   88,  130,  120,   88,
			  121,   88,  138,   88,  141,  133,  134,  125,   88,  135,

			   88,  147,  137,  149,   88,  133,  140,  134,   88,  142,
			  136,   88,  139,  137,  149,  144,   88,  146,  145,   88,
			   88,  143,  148,  109,  154,  131,  131,   88,  156,  157,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,  155,
			   88,  169,  146,  307,  164,   88,   88,  167,  161,  162,
			  159,  163,  158,  156,  157,  160,   88,  165,   88,   88,
			   88,  175,  166,  158,   88,  168,  169,   88,  174,  164,
			   88,  176,  167,  166,   88,   88,   88,  179,   88,  183,
			   88,   88,  176,  177,   88,  180,  304,  178,  189,  184,
			  168,  185,  181,   88,  177,  186,  180,  182,  187,  189,

			  191,   88,   88,  181,  183,   88,  188,   88,  194,   88,
			  197,  191,  200,  201,  200,  196,   88,  188,   88,  195,
			   88,   88,   88,   88,  202,   88,   88,  198,   88,  199,
			   88,  300,  213,  205,   88,   88,   88,   88,  204,  209,
			   88,  203,  208,  213,  207,  215,  217,   88,  216,  206,
			  219,   88,  203,  200,  201,  200,  218,  222,   88,   88,
			  296,  220,   88,  224,  225,  224,  233,   88,  221,  226,
			  227,  226,  220,   88,   88,  238,  223,  233,  228,   88,
			  230,  230,  230,  229,   88,   88,   88,  223,  229,   88,
			   88,  240,  240,  240,   88,  237,  244,  245,  244,   88,

			  241,   88,  247,  246,  239,  242,   88,  243,  224,  225,
			  224,  226,  227,  226,  230,  230,  230,   88,   88,   88,
			  248,   88,   88,  231,  240,  240,  240,   88,  246,   88,
			  255,  258,  259,  258,  244,  245,  244,  254,  269,  270,
			  261,   88,  257,  256,  262,  263,  262,  260,  251,  267,
			  251,  271,  272,  271,   88,   88,  264,  258,  259,  258,
			   88,   88,  274,  275,  274,   88,  264,  262,  263,  262,
			   88,   88,   88,   88,   88,  273,  269,  270,  277,  265,
			  278,  265,  268,  280,  268,  271,  272,  271,  274,  275,
			  274,  286,   88,  276,  289,  283,  284,  285,   88,  288,

			  288,   88,  286,   88,   88,  290,  283,  284,   88,   88,
			   88,   88,   88,  295,   88,   88,  291,   88,  292,  293,
			   88,  288,  294,  306,   88,  301,  303,  303,  303,  297,
			  302,  298,  305,  303,  303,  303,   88,  308,  295,  299,
			  282,   88,  309,  279,  311,  314,  315,  314,  306,  316,
			  316,  316,   88,  309,  312,   88,  313,  317,  313,   88,
			  314,  315,  314,  316,  316,  316,   43,   43,   43,   43,
			   43,   43,   43,   48,   48,   48,   48,   48,   48,   48,
			   50,   50,   50,   50,   50,   50,   50,   53,   53,   53,
			   53,   53,   53,   53,   60,   60,   60,   60,   60,   75,

			   88,   75,   75,   75,   75,   75,   80,   80,   80,   80,
			   80,   80,   80,   83,   83,   83,   83,   83,   83,   83,
			   57,   57,   57,   57,   57,   57,   57,  110,  110,  110,
			  132,  132,  132,  132,  132,  173,  173,  173,  193,  193,
			  193,  193,  193,  236,  236,  236,  253,  253,  253,  253,
			  253,  281,  281,  281,  287,  287,  287,  287,  287,  268,
			  266,  265,  252,  251,  250,  249,   88,  235,  234,  232,
			  214,  212,  211,  210,  192,  190,  172,  171,  170,  153,
			  152,  151,  150,  129,  128,  127,   85,   82,   79,  106,
			  105,   88,   86,   56,   79,   79,   78,   77,   76,   74,

			   73,   69,   68,   67,   64,   63,   62,   61,   57,   56,
			  318,   54,   49,   44,    9,  318,  318,  318,  318,  318,
			  318,  318,  318,  318,  318,  318,  318,  318,  318,  318,
			  318,  318,  318,  318,  318,  318,  318,  318,  318,  318,
			  318,  318,  318,  318,  318,  318,  318,  318,  318,  318,
			  318,  318,  318,  318,  318,  318,  318,  318,  318,  318,
			  318,  318,  318,  318, yy_Dummy>>)
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
			  310,   11,    2,   11,   35,    2,    2,   35,   40,    4,
			   40,    4,    4,   51,   51,    2,    2,    2,   23,   61,
			   23,   23,   39,   54,   54,   55,   62,   55,   58,   58,
			   59,   63,   59,   59,    4,    4,   65,   61,   64,   64,

			   67,   66,   69,   68,   70,   71,   62,   74,   72,   73,
			  307,   63,   66,   78,   81,   81,   65,   68,   89,   67,
			   67,   72,   73,   78,   70,   90,   74,   68,   94,   69,
			   71,   84,   84,   86,   91,   86,   66,   93,   95,   69,
			   87,   71,   87,   87,   94,   90,   92,   91,   92,   92,
			   96,   89,   97,   98,  101,  102,   99,  100,   93,  104,
			   95,   96,  103,  108,   98,   99,  109,  109,  111,   97,
			   96,  112,  100,  103,  119,  101,  113,  115,  102,  116,
			  114,  104,  114,  114,  125,   96,  120,  108,   98,  122,
			   99,  117,  116,  118,  119,  111,  112,  103,  121,  113,

			  123,  125,  115,  127,  126,  111,  118,  112,  124,  120,
			  114,  133,  117,  115,  127,  122,  134,  124,  123,  135,
			  137,  121,  126,  131,  133,  131,  131,  138,  135,  137,
			  139,  141,  142,  140,  143,  144,  145,  146,  147,  134,
			  155,  149,  124,  304,  144,  154,  156,  147,  141,  142,
			  139,  143,  138,  135,  137,  140,  148,  145,  157,  158,
			  160,  155,  146,  138,  159,  148,  149,  161,  154,  144,
			  163,  156,  147,  146,  164,  162,  165,  159,  166,  163,
			  167,  168,  156,  157,  174,  160,  300,  158,  169,  164,
			  148,  165,  161,  177,  157,  166,  160,  162,  167,  169,

			  171,  175,  176,  161,  163,  178,  168,  181,  174,  179,
			  177,  171,  180,  180,  180,  176,  182,  168,  183,  175,
			  184,  185,  180,  186,  181,  187,  188,  178,  194,  179,
			  195,  296,  192,  184,  196,  197,  199,  198,  183,  188,
			  203,  182,  187,  192,  186,  194,  196,  202,  195,  185,
			  198,  204,  182,  200,  200,  200,  197,  203,  207,  208,
			  292,  199,  216,  205,  205,  205,  211,  220,  202,  206,
			  206,  206,  199,  205,  215,  216,  204,  211,  207,  206,
			  209,  209,  209,  208,  218,  221,  222,  204,  208,  229,
			  209,  219,  219,  219,  228,  215,  223,  223,  223,  231,

			  220,  219,  229,  228,  218,  221,  223,  222,  224,  224,
			  224,  226,  226,  226,  230,  230,  230,  237,  238,  239,
			  231,  241,  246,  209,  240,  240,  240,  243,  228,  248,
			  238,  242,  242,  242,  244,  244,  244,  237,  253,  253,
			  246,  242,  241,  239,  247,  247,  247,  243,  251,  251,
			  251,  256,  256,  256,  247,  257,  248,  258,  258,  258,
			  261,  256,  260,  260,  260,  264,  248,  262,  262,  262,
			  273,  276,  260,  283,  277,  257,  287,  287,  264,  265,
			  265,  265,  268,  268,  268,  271,  271,  271,  274,  274,
			  274,  279,  284,  261,  283,  273,  276,  277,  285,  288,

			  288,  289,  279,  290,  291,  284,  273,  276,  293,  294,
			  297,  295,  298,  291,  302,  301,  285,  306,  286,  289,
			  308,  282,  290,  302,  305,  297,  299,  299,  299,  293,
			  298,  294,  301,  303,  303,  303,  299,  305,  291,  295,
			  270,  309,  306,  266,  308,  311,  311,  311,  302,  312,
			  312,  312,  255,  306,  309,  311,  313,  313,  313,  312,
			  314,  314,  314,  316,  316,  316,  319,  319,  319,  319,
			  319,  319,  319,  320,  320,  320,  320,  320,  320,  320,
			  321,  321,  321,  321,  321,  321,  321,  322,  322,  322,
			  322,  322,  322,  322,  323,  323,  323,  323,  323,  324,

			  254,  324,  324,  324,  324,  324,  325,  325,  325,  325,
			  325,  325,  325,  326,  326,  326,  326,  326,  326,  326,
			  327,  327,  327,  327,  327,  327,  327,  328,  328,  328,
			  329,  329,  329,  329,  329,  330,  330,  330,  331,  331,
			  331,  331,  331,  332,  332,  332,  333,  333,  333,  333,
			  333,  334,  334,  334,  335,  335,  335,  335,  335,  252,
			  250,  249,  235,  234,  233,  232,  217,  213,  212,  210,
			  193,  191,  190,  189,  172,  170,  152,  151,  150,  132,
			  130,  129,  128,  107,  106,  105,   83,   80,   79,   77,
			   76,   60,   57,   56,   52,   49,   47,   46,   45,   42,

			   41,   38,   37,   36,   32,   31,   30,   28,   20,   12,
			    9,    8,    5,    3,  318,  318,  318,  318,  318,  318,
			  318,  318,  318,  318,  318,  318,  318,  318,  318,  318,
			  318,  318,  318,  318,  318,  318,  318,  318,  318,  318,
			  318,  318,  318,  318,  318,  318,  318,  318,  318,  318,
			  318,  318,  318,  318,  318,  318,  318,  318,  318,  318,
			  318,  318,  318,  318, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,   29,  710,   48,  709,   52,    0,  709,  710,
			  714,   59,  706,  714,  714,  714,  714,  714,  714,  714,
			  696,  714,  714,   65,  714,  714,  714,  714,  683,    0,
			  673,  680,  658,  714,  714,   32,  670,  677,  669,   36,
			   36,  666,  674,    0,  714,  666,  664,  671,  714,  692,
			  714,   71,  691,  714,   81,   83,  690,  689,   73,   77,
			  679,   67,   74,   79,   51,   84,   89,   88,   91,   90,
			   92,   93,   96,   97,   95,    0,  658,  658,   87,  685,
			  684,  112,  714,  683,  129,  714,  131,  127,    0,  106,
			  113,  122,  133,  125,  116,  126,  138,  140,  141,  144,

			  145,  142,  143,  150,  147,  652,  650,  654,  140,  151,
			    0,  156,  159,  164,  167,  165,  167,  179,  181,  162,
			  174,  186,  177,  188,  196,  172,  192,  166,  649,  649,
			  645,  210,  667,  199,  204,  207,  714,  208,  215,  218,
			  221,  219,  220,  222,  223,  224,  225,  226,  244,  220,
			  646,  648,  647,    0,  233,  228,  234,  246,  247,  252,
			  248,  255,  263,  258,  262,  264,  266,  268,  269,  251,
			  650,  263,  640,    0,  272,  289,  290,  281,  293,  297,
			  310,  295,  304,  306,  308,  309,  311,  313,  314,  644,
			  640,  642,  295,  657,  316,  318,  322,  323,  325,  324,

			  351,  714,  335,  328,  339,  361,  367,  346,  347,  378,
			  636,  329,  635,  638,    0,  362,  350,  654,  372,  389,
			  355,  373,  374,  394,  406,  714,  409,  714,  382,  377,
			  412,  387,  633,  619,  631,  629,    0,  405,  406,  407,
			  422,  409,  429,  415,  432,  714,  410,  442,  417,  625,
			  627,  446,  627,  426,  588,  540,  449,  443,  455,  714,
			  460,  448,  465,  714,  453,  477,  511,  714,  480,    0,
			  491,  483,  714,  458,  486,  714,  459,  462,  714,  454,
			  714,    0,  505,  461,  480,  486,  485,  464,  484,  489,
			  491,  492,  330,  496,  497,  499,  298,  498,  500,  524,

			  259,  503,  502,  531,  214,  512,  505,   85,  508,  529,
			   24,  543,  547,  554,  558,  714,  561,  714,  714,  565,
			  572,  579,  586,  591,  598,  605,  612,  619,  622,  627,
			  630,  635,  638,  643,  646,  651, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,  318,    1,  319,  319,  320,  321,  320,  322,  318,
			  318,  318,  318,  318,  318,  318,  318,  318,  318,  318,
			  318,  318,  318,  318,  318,  318,  318,  318,  323,  323,
			  323,  323,  318,  318,  318,  323,  323,  323,  323,  323,
			  323,  323,  323,  324,  318,  324,  324,  324,  318,  318,
			  318,  325,  318,  318,  326,  318,  318,  327,  318,  318,
			  323,  323,  323,  323,  318,  323,  323,  323,  323,  323,
			  323,  323,  323,  323,  323,  324,  324,  324,  324,  318,
			  325,  325,  318,  326,  326,  318,  318,  318,  328,  323,
			  323,  323,  318,  323,  323,  323,  323,  323,  323,  323,

			  323,  323,  323,  323,  323,  324,  324,  324,  324,  318,
			  329,  323,  323,  323,  318,  323,  323,  323,  323,  323,
			  323,  323,  323,  323,  323,  323,  323,  324,  324,  324,
			  324,  318,  329,  323,  323,  323,  318,  323,  323,  323,
			  323,  323,  323,  323,  323,  323,  323,  323,  323,  324,
			  324,  324,  324,  330,  323,  323,  323,  323,  323,  323,
			  323,  323,  323,  323,  323,  323,  323,  323,  323,  324,
			  324,  324,  324,  331,  323,  323,  323,  323,  323,  323,
			  323,  323,  323,  323,  323,  323,  323,  323,  323,  324,
			  324,  324,  324,  331,  323,  323,  323,  323,  323,  323,

			  318,  318,  323,  323,  323,  323,  323,  323,  323,  323,
			  324,  324,  324,  324,  332,  323,  323,  323,  323,  323,
			  323,  323,  323,  323,  318,  318,  318,  318,  323,  323,
			  318,  323,  324,  324,  324,  324,  333,  323,  323,  323,
			  318,  323,  323,  323,  318,  318,  323,  323,  323,  324,
			  324,  324,  324,  333,  323,  323,  323,  323,  318,  318,
			  323,  323,  318,  318,  323,  324,  324,  318,  324,  334,
			  318,  318,  318,  323,  318,  318,  323,  323,  318,  324,
			  318,  335,  318,  323,  323,  323,  324,  335,  318,  323,
			  323,  323,  324,  323,  323,  323,  324,  323,  323,  323,

			  324,  323,  323,  318,  324,  323,  323,  324,  323,  323,
			  324,  323,  323,  324,  318,  318,  318,  318,    0,  318,
			  318,  318,  318,  318,  318,  318,  318,  318,  318,  318,
			  318,  318,  318,  318,  318,  318, yy_Dummy>>)
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
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   56,
			   54,    1,    2,   15,   18,   16,   17,    7,    6,   13,
			    5,   11,    8,   54,   14,   12,   10,   19,   53,   53,
			   53,   53,   20,   21,    9,   53,   53,   53,   53,   53,
			   53,   53,   53,   43,   42,   43,   43,   43,   55,   46,
			   47,   55,   46,   49,   55,    1,    2,    3,    0,    0,
			   53,   53,   53,   53,    0,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   43,   43,   43,   43,   46,
			    0,    0,   45,    0,    0,   48,    4,   50,    0,   53,
			   53,   53,    0,   53,   53,   53,   53,   53,   53,   53,

			   53,   53,   53,   53,   53,   43,   43,   43,   43,    0,
			    0,   53,   53,   53,    0,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   43,   43,   43,
			   43,   50,    0,   53,   53,   53,   51,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   43,
			   43,   43,   43,    0,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   43,
			   43,   43,   43,    0,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   43,
			   43,   43,   43,    0,   53,   53,   53,   53,   53,   53,

			    0,   30,   53,   53,   53,   53,   53,   53,   53,   53,
			   43,   43,   43,   43,    0,   53,   53,   28,   53,   53,
			   53,   53,   53,   53,    0,   31,    0,   35,   53,   53,
			   24,   53,   43,   43,   43,   43,    0,   53,   53,   53,
			   22,   53,   53,   53,    0,   34,   53,   53,   53,   43,
			   43,   43,   43,    0,   26,   27,   53,   53,    0,   33,
			   53,   53,    0,   29,   53,   43,   43,   39,   43,    0,
			    0,    0,   36,   53,    0,   32,   53,   53,   40,   43,
			   38,    0,    0,   53,   53,   53,   43,    0,   52,   53,
			   53,   53,   43,   53,   53,   53,   43,   53,   53,   53,

			   43,   53,   53,   23,   43,   53,   53,   43,   53,   53,
			   43,   53,   53,   43,    0,   37,   25,   41,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 714
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 318
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 319
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

	yyNb_rules: INTEGER = 55
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 56
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

	comp_onts_text_start_line: INTEGER

feature {NONE} -- Constants

	Init_buffer_size: INTEGER = 256
				-- Initial size for `in_buffer'

invariant
	in_buffer_not_void: in_buffer /= Void

end
