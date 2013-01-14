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
--|#line 66 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 66")
end
-- Ignore separators
else
--|#line 67 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 67")
end
in_lineno := in_lineno + text_count
end
else
if yy_act = 3 then
--|#line 72 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 72")
end
-- Ignore comments
else
--|#line 73 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 73")
end
in_lineno := in_lineno + 1
end
end
else
if yy_act <= 6 then
if yy_act = 5 then
--|#line 77 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 77")
end
last_token := Minus_code
else
--|#line 78 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 78")
end
last_token := Plus_code
end
else
--|#line 79 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 79")
end
last_token := Star_code
end
end
else
if yy_act <= 11 then
if yy_act <= 9 then
if yy_act = 8 then
--|#line 80 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 80")
end
last_token := Slash_code
else
--|#line 81 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 81")
end
last_token := Caret_code
end
else
if yy_act = 10 then
--|#line 82 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 82")
end
last_token := Equal_code
else
--|#line 83 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 83")
end
last_token := Dot_code
end
end
else
if yy_act <= 13 then
if yy_act = 12 then
--|#line 84 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 84")
end
last_token := Semicolon_code
else
--|#line 85 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 85")
end
last_token := Comma_code
end
else
--|#line 86 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 86")
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
--|#line 87 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 87")
end
last_token := Exclamation_code
else
--|#line 88 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 88")
end
last_token := Left_parenthesis_code
end
else
if yy_act = 17 then
--|#line 89 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 89")
end
last_token := Right_parenthesis_code
else
--|#line 90 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 90")
end
last_token := Dollar_code
end
end
else
if yy_act <= 20 then
if yy_act = 19 then
--|#line 91 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 91")
end
last_token := Question_mark_code
else
--|#line 93 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 93")
end
last_token := Left_bracket_code
end
else
--|#line 94 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 94")
end
last_token := Right_bracket_code
end
end
else
if yy_act <= 25 then
if yy_act <= 23 then
if yy_act = 22 then
--|#line 98 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 98")
end

				last_token := SYM_ARCHETYPE
			
else
--|#line 102 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 102")
end

				last_token := SYM_TEMPLATE_OVERLAY
			
end
else
if yy_act = 24 then
--|#line 106 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 106")
end

				last_token := SYM_TEMPLATE
			
else
--|#line 110 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 110")
end

				last_token := SYM_OPERATIONAL_TEMPLATE
			
end
end
else
if yy_act <= 27 then
if yy_act = 26 then
--|#line 114 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 114")
end

				last_token := SYM_ADL_VERSION
			
else
--|#line 118 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 118")
end

				last_token := SYM_IS_CONTROLLED
			
end
else
--|#line 122 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 122")
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
--|#line 126 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 126")
end

				last_token := SYM_SPECIALIZE
				in_lineno := in_lineno + 1
			
else
--|#line 132 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 132")
end

				last_token := SYM_CONCEPT
				in_lineno := in_lineno + 1
			
end
else
if yy_act = 31 then
--|#line 137 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 137")
end

				last_token := SYM_LANGUAGE
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				language_text_start_line := in_lineno
			
else
--|#line 144 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 144")
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
--|#line 151 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 151")
end

				last_token := SYM_DEFINITION
				set_start_condition(IN_CADL_SECTION)
				in_lineno := in_lineno + 1
				definition_text_start_line := in_lineno
			
else
--|#line 158 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 158")
end

				last_token := SYM_INVARIANT
				set_start_condition(IN_ASSERTION_SECTION)
				in_lineno := in_lineno + 1
				invariant_text_start_line := in_lineno
			
end
else
--|#line 165 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 165")
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
--|#line 172 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 172")
end

				last_token := SYM_ANNOTATIONS
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				annotations_text_start_line := in_lineno
			
else
--|#line 179 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 179")
end

				last_token := SYM_COMPONENT_ONTOLOGIES
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				comp_onts_text_start_line := in_lineno
			
end
else
if yy_act = 38 then
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
			
else
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
			
end
end
else
if yy_act <= 41 then
if yy_act = 40 then
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
			
else
--|#line 190 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 190")
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
--|#line 207 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 207")
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
--|#line 211 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 211")
end
 -- any text on line with no LF
				in_buffer.append_string(text)
			
else
--|#line 223 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 223")
end

		-- ignore unmatched chars
	
end
else
if yy_act = 45 then
--|#line 229 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 229")
end

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
else
--|#line 233 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 233")
end
in_lineno := in_lineno + text_count
end
end
else
if yy_act <= 48 then
if yy_act = 47 then
--|#line 235 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 235")
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
--|#line 247 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 247")
end
			-- match TAB whitsepace <anything> \n
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
end
else
--|#line 252 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 252")
end
in_lineno := in_lineno + text_count
end
end
else
if yy_act <= 53 then
if yy_act <= 51 then
if yy_act = 50 then
--|#line 254 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 254")
end
 -- non-white space at start
				unread_character(text.item(1))
				last_token := V_ASSERTION_TEXT
				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_
				set_start_condition(INITIAL)
	
else
--|#line 266 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 266")
end

					last_token := V_VERSION_STRING
					last_string_value := text_substring (1, text_count)
			
end
else
if yy_act = 52 then
--|#line 272 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 272")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 278 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 278")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
end
end
else
if yy_act <= 55 then
if yy_act = 54 then
--|#line 284 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 284")
end

					last_token := V_IDENTIFIER
					last_string_value := text
			
else
--|#line 291 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 291")
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
			   35,   44,   36,   37,   51,   52,   55,   56,   38,   39,
			  314,   57,   40,   57,   72,   41,   42,  311,   73,   45,
			   74,   46,   47,   91,   63,   35,   36,   42,   60,   91,
			   61,   61,   67,   83,   84,   68,   87,   88,   57,   72,
			   57,   90,   90,   93,   45,   46,   60,   92,   61,   61,

			   91,   95,   95,   91,   91,   91,   91,   91,   91,   91,
			   91,   91,  110,   91,   91,   97,   83,   84,   87,   88,
			   94,  100,  111,   96,   98,   99,  105,  106,  103,  107,
			   89,  101,   89,  102,  104,  112,   91,   90,   90,   97,
			   91,   91,   91,  102,  114,  104,  117,   91,  117,  117,
			   91,   91,   91,  116,   91,   91,  115,   91,  119,   91,
			   91,  121,  118,  123,  124,   91,   91,  133,  122,  120,
			  115,  128,  125,  134,  134,  126,   91,   91,  117,   91,
			  117,  117,  127,   91,   91,  121,   91,  123,  129,  124,
			   91,  133,  136,   91,   91,  128,  141,   91,   91,  143,

			  138,  137,  136,   91,  140,  142,   91,  149,  139,   91,
			  144,  152,  137,   91,   91,  140,  145,  146,   91,   91,
			   91,  148,  152,  147,  151,  112,  150,  134,  134,  159,
			   91,  157,  149,   91,  162,   91,  158,   91,   91,  160,
			   91,   91,   91,   91,  161,  172,  167,   91,   91,   91,
			  164,   91,  170,   91,  159,  161,  171,  163,  165,  166,
			   91,  168,   91,  169,  160,   91,   91,   91,   91,  178,
			  172,  167,  177,   91,  169,  182,  179,  170,  180,   91,
			   91,  171,  187,   91,   91,  189,  192,  179,  181,  180,
			  183,  184,  186,  194,  188,  185,   91,  192,  190,   91,

			   91,  183,  184,   91,  194,   91,   91,   91,   91,  191,
			   91,   91,  308,  199,  198,   91,  305,  186,   91,   91,
			  191,   91,  200,  197,  205,  201,  202,  203,  204,  203,
			  207,  208,  212,  206,  216,   91,  210,   91,  211,  209,
			   91,   91,   91,   91,  206,  216,   91,  203,  204,  203,
			   91,   91,  218,  220,   91,   91,  222,   91,  219,  227,
			  228,  227,  236,  221,  229,  230,  229,  225,   91,   91,
			   91,  223,  224,  236,   91,  231,   91,  301,   91,  226,
			   91,  232,  223,  233,  233,  233,  232,   91,   91,  240,
			  226,  241,   91,   91,  256,  257,  242,  243,  243,  243,

			  245,  250,   91,  244,  247,  248,  247,   91,  246,  227,
			  228,  227,   91,  251,   91,  229,  230,  229,  233,  233,
			  233,  249,  258,   91,   91,   91,  234,  243,  243,  243,
			   91,  262,  263,  262,   91,  259,  247,  248,  247,   91,
			   91,   91,  254,  271,  254,  264,  249,   91,  260,   91,
			  289,  261,  265,  266,  267,  266,  297,  275,  276,  275,
			  277,  289,  281,   91,  256,  257,  268,   91,  262,  263,
			  262,  278,  279,  278,   91,   91,  268,  266,  267,  266,
			  280,   91,  269,  282,  269,  272,  284,  272,  275,  276,
			  275,  278,  279,  278,   91,  285,  285,   91,   91,  286,

			  287,   91,   91,   91,   91,   91,   91,   91,   91,   91,
			  286,  287,   91,  296,  291,   91,  292,  288,  290,   91,
			  294,  307,  295,  302,   91,   91,  298,  303,  299,  304,
			  304,  304,  306,  293,   91,  300,  285,  309,  296,   91,
			  304,  304,  304,  283,  310,   91,  307,  313,   91,  312,
			  315,  316,  315,  274,  272,  310,  317,  317,  317,  270,
			   91,  314,  318,  314,  269,  255,   91,  315,  316,  315,
			  317,  317,  317,   43,   43,   43,   43,   43,   43,   43,
			   48,   48,   48,   48,   48,   48,   48,   50,   50,   50,
			   50,   50,   50,   50,   54,   54,   54,   54,   54,   54,

			   54,   62,   62,   62,   62,   62,   77,  254,   77,   77,
			   77,   77,   77,   82,   82,   82,   82,   82,   82,   82,
			   86,   86,   86,   86,   86,   86,   86,   59,   59,   59,
			   59,   59,   59,   59,  113,  113,  113,  113,  113,  156,
			  156,  156,  176,  176,  176,  176,  176,  217,  217,  217,
			  239,  239,  239,  239,  239,  273,  273,  273,  273,  273,
			  253,  252,   91,  238,  237,  235,  215,  214,  213,  196,
			  195,  193,  175,  174,  173,  155,  154,  153,  135,  132,
			  131,  130,   88,   85,   84,   81,  109,  108,   91,   89,
			   58,   85,   85,   81,   81,   80,   79,   78,   76,   75,

			   71,   70,   69,   66,   65,   64,   63,   59,   58,  319,
			   53,   49,   44,    9,  319,  319,  319,  319,  319,  319,
			  319,  319,  319,  319,  319,  319,  319,  319,  319,  319,
			  319,  319,  319,  319,  319,  319,  319,  319,  319,  319,
			  319,  319,  319,  319,  319,  319,  319,  319,  319,  319,
			  319,  319,  319,  319,  319,  319,  319,  319,  319,  319,
			  319,  319,  319, yy_Dummy>>)
		end

	yy_chk_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    2,    4,    2,    2,    6,    6,    8,    8,    2,    2,
			  311,   11,    2,   11,   39,    2,    2,  308,   40,    4,
			   40,    4,    4,   64,   35,    2,    2,    2,   23,   63,
			   23,   23,   35,   51,   51,   35,   55,   55,   57,   39,
			   57,   60,   60,   64,    4,    4,   61,   63,   61,   61,

			   65,   66,   66,   67,   68,   69,   71,   70,   72,   73,
			   76,   92,   80,   74,   75,   68,   83,   83,   87,   87,
			   65,   70,   80,   67,   69,   69,   74,   75,   72,   76,
			   89,   70,   89,   71,   73,   90,   93,   90,   90,   68,
			   94,   96,   97,   71,   92,   73,   95,   98,   95,   95,
			   99,  100,  101,   94,  104,  102,   93,  103,   97,  105,
			  106,   99,   96,  101,  102,  114,  107,  111,  100,   98,
			   99,  106,  103,  112,  112,  104,  115,  116,  117,  118,
			  117,  117,  105,  119,  120,   99,  121,  101,  107,  102,
			  122,  111,  114,  123,  124,  106,  119,  125,  127,  121,

			  116,  115,  114,  126,  118,  120,  129,  127,  117,  128,
			  122,  130,  115,  137,  142,  118,  123,  124,  136,  141,
			  138,  126,  130,  125,  129,  134,  128,  134,  134,  138,
			  140,  136,  127,  144,  142,  143,  137,  147,  149,  140,
			  148,  145,  146,  150,  141,  152,  147,  151,  158,  157,
			  144,  159,  150,  160,  138,  141,  151,  143,  145,  146,
			  161,  148,  162,  149,  140,  163,  164,  167,  169,  158,
			  152,  147,  157,  165,  149,  162,  159,  150,  160,  168,
			  170,  151,  167,  166,  171,  169,  172,  159,  161,  160,
			  163,  164,  166,  174,  168,  165,  178,  172,  170,  177,

			  179,  163,  164,  181,  174,  180,  182,  184,  185,  171,
			  186,  188,  305,  179,  178,  189,  301,  166,  187,  191,
			  171,  190,  180,  177,  184,  181,  182,  183,  183,  183,
			  186,  187,  191,  185,  195,  197,  189,  183,  190,  188,
			  198,  199,  200,  201,  185,  195,  202,  203,  203,  203,
			  206,  205,  197,  199,  207,  210,  201,  211,  198,  208,
			  208,  208,  214,  200,  209,  209,  209,  206,  218,  208,
			  223,  202,  205,  214,  209,  210,  221,  297,  219,  207,
			  224,  211,  202,  212,  212,  212,  211,  225,  232,  218,
			  207,  219,  234,  212,  239,  239,  221,  222,  222,  222,

			  224,  232,  240,  223,  226,  226,  226,  222,  225,  227,
			  227,  227,  231,  234,  226,  229,  229,  229,  233,  233,
			  233,  231,  240,  241,  242,  246,  212,  243,  243,  243,
			  244,  245,  245,  245,  249,  241,  247,  247,  247,  251,
			  261,  245,  254,  254,  254,  246,  231,  265,  242,  268,
			  283,  244,  249,  250,  250,  250,  293,  260,  260,  260,
			  261,  283,  268,  250,  273,  273,  251,  260,  262,  262,
			  262,  264,  264,  264,  277,  280,  251,  266,  266,  266,
			  265,  264,  269,  269,  269,  272,  272,  272,  275,  275,
			  275,  278,  278,  278,  281,  285,  285,  286,  288,  277,

			  280,  287,  290,  291,  292,  294,  295,  296,  298,  299,
			  277,  280,  303,  292,  287,  302,  288,  281,  286,  307,
			  290,  303,  291,  298,  306,  309,  294,  299,  295,  300,
			  300,  300,  302,  289,  310,  296,  274,  306,  292,  300,
			  304,  304,  304,  270,  307,  259,  303,  310,  258,  309,
			  312,  312,  312,  257,  255,  307,  313,  313,  313,  253,
			  312,  314,  314,  314,  252,  238,  313,  315,  315,  315,
			  317,  317,  317,  320,  320,  320,  320,  320,  320,  320,
			  321,  321,  321,  321,  321,  321,  321,  322,  322,  322,
			  322,  322,  322,  322,  323,  323,  323,  323,  323,  323,

			  323,  324,  324,  324,  324,  324,  325,  237,  325,  325,
			  325,  325,  325,  326,  326,  326,  326,  326,  326,  326,
			  327,  327,  327,  327,  327,  327,  327,  328,  328,  328,
			  328,  328,  328,  328,  329,  329,  329,  329,  329,  330,
			  330,  330,  331,  331,  331,  331,  331,  332,  332,  332,
			  333,  333,  333,  333,  333,  334,  334,  334,  334,  334,
			  236,  235,  220,  216,  215,  213,  194,  193,  192,  176,
			  175,  173,  155,  154,  153,  133,  132,  131,  113,  110,
			  109,  108,   86,   85,   82,   81,   79,   78,   62,   59,
			   58,   56,   53,   52,   49,   47,   46,   45,   42,   41,

			   38,   37,   36,   32,   31,   30,   28,   20,   12,    9,
			    7,    5,    3,  319,  319,  319,  319,  319,  319,  319,
			  319,  319,  319,  319,  319,  319,  319,  319,  319,  319,
			  319,  319,  319,  319,  319,  319,  319,  319,  319,  319,
			  319,  319,  319,  319,  319,  319,  319,  319,  319,  319,
			  319,  319,  319,  319,  319,  319,  319,  319,  319,  319,
			  319,  319,  319, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,   29,  709,   48,  708,   52,  707,   54,  709,
			  713,   59,  705,  713,  713,  713,  713,  713,  713,  713,
			  695,  713,  713,   65,  713,  713,  713,  713,  682,    0,
			  672,  679,  657,  713,  713,   50,  669,  676,  668,   43,
			   36,  665,  673,    0,  713,  665,  663,  670,  713,  691,
			  713,   81,  690,  689,  713,   84,  688,   86,  687,  686,
			   76,   83,  676,   67,   61,   88,   54,   91,   92,   93,
			   95,   94,   96,   97,  101,  102,   98,    0,  655,  655,
			   86,  682,  681,  114,  713,  680,  679,  116,  713,  128,
			  122,    0,   99,  124,  128,  133,  129,  130,  135,  138,

			  139,  140,  143,  145,  142,  147,  148,  154,  648,  646,
			  650,  144,  158,  666,  153,  164,  165,  165,  167,  171,
			  172,  174,  178,  181,  182,  185,  191,  186,  197,  194,
			  174,  644,  644,  640,  212,    0,  206,  201,  208,  713,
			  218,  207,  202,  223,  221,  229,  230,  225,  228,  226,
			  231,  235,  224,  642,  644,  643,    0,  237,  236,  239,
			  241,  248,  250,  253,  254,  261,  271,  255,  267,  256,
			  268,  272,  249,  646,  256,  636,  656,  287,  284,  288,
			  293,  291,  294,  325,  295,  296,  298,  306,  299,  303,
			  309,  307,  639,  635,  637,  297,    0,  323,  328,  329,

			  330,  331,  334,  345,  713,  339,  338,  342,  357,  362,
			  343,  345,  381,  632,  325,  631,  634,    0,  356,  366,
			  650,  364,  395,  358,  368,  375,  402,  407,  713,  413,
			  713,  400,  376,  416,  380,  629,  615,  575,  532,  382,
			  390,  411,  412,  425,  418,  429,  413,  434,  713,  422,
			  451,  427,  528,  526,  440,  522,    0,  504,  536,  533,
			  455,  428,  466,  713,  469,  435,  475,  713,  437,  480,
			  511,  713,  483,  452,  520,  486,  713,  462,  489,  713,
			  463,  482,  713,  413,  713,  480,  485,  489,  486,  500,
			  490,  491,  492,  426,  493,  494,  495,  344,  496,  497,

			  527,  289,  503,  500,  538,  283,  512,  507,   42,  513,
			  522,   24,  548,  554,  559,  565,  713,  568,  713,  713,
			  572,  579,  586,  593,  598,  605,  612,  619,  626,  631,
			  634,  639,  642,  647,  652, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,  319,    1,  320,  320,  321,  322,  321,  323,  319,
			  319,  319,  319,  319,  319,  319,  319,  319,  319,  319,
			  319,  319,  319,  319,  319,  319,  319,  319,  324,  324,
			  324,  324,  319,  319,  319,  324,  324,  324,  324,  324,
			  324,  324,  324,  325,  319,  325,  325,  325,  319,  319,
			  319,  326,  319,  319,  319,  327,  319,  319,  319,  328,
			  319,  319,  324,  324,  324,  324,  319,  324,  324,  324,
			  324,  324,  324,  324,  324,  324,  324,  325,  325,  325,
			  325,  319,  326,  326,  319,  319,  327,  327,  319,  319,
			  319,  329,  324,  324,  324,  319,  324,  324,  324,  324,

			  324,  324,  324,  324,  324,  324,  324,  324,  325,  325,
			  325,  325,  319,  329,  324,  324,  324,  319,  324,  324,
			  324,  324,  324,  324,  324,  324,  324,  324,  324,  324,
			  325,  325,  325,  325,  319,  330,  324,  324,  324,  319,
			  324,  324,  324,  324,  324,  324,  324,  324,  324,  324,
			  324,  324,  325,  325,  325,  325,  331,  324,  324,  324,
			  324,  324,  324,  324,  324,  324,  324,  324,  324,  324,
			  324,  324,  325,  325,  325,  325,  331,  324,  324,  324,
			  324,  324,  324,  324,  324,  324,  324,  324,  324,  324,
			  324,  324,  325,  325,  325,  325,  332,  324,  324,  324,

			  324,  324,  324,  319,  319,  324,  324,  324,  324,  324,
			  324,  324,  324,  325,  325,  325,  325,  333,  324,  324,
			  324,  324,  324,  324,  324,  324,  324,  319,  319,  319,
			  319,  324,  324,  319,  324,  325,  325,  325,  325,  333,
			  324,  324,  324,  319,  324,  324,  324,  319,  319,  324,
			  324,  324,  325,  325,  325,  325,  334,  319,  324,  324,
			  324,  324,  319,  319,  324,  324,  319,  319,  324,  325,
			  325,  319,  325,  334,  319,  319,  319,  324,  319,  319,
			  324,  324,  319,  325,  319,  319,  324,  324,  324,  325,
			  324,  324,  324,  325,  324,  324,  324,  325,  324,  324,

			  324,  325,  324,  324,  319,  325,  324,  324,  325,  324,
			  324,  325,  324,  324,  325,  319,  319,  319,  319,    0,
			  319,  319,  319,  319,  319,  319,  319,  319,  319,  319,
			  319,  319,  319,  319,  319, yy_Dummy>>)
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
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   57,
			   55,    1,    2,   15,   18,   16,   17,    7,    6,   13,
			    5,   11,    8,   55,   14,   12,   10,   19,   54,   54,
			   54,   54,   20,   21,    9,   54,   54,   54,   54,   54,
			   54,   54,   54,   43,   42,   43,   43,   43,   56,   46,
			   47,   56,   46,   49,   50,   56,   49,    1,    2,    3,
			    0,    0,   54,   54,   54,   54,    0,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   43,   43,   43,
			   43,   46,    0,    0,   45,   49,    0,    0,   48,    4,
			   51,    0,   54,   54,   54,    0,   54,   54,   54,   54,

			   54,   54,   54,   54,   54,   54,   54,   54,   43,   43,
			   43,   43,    0,    0,   54,   54,   54,    0,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   43,   43,   43,   43,   51,    0,   54,   54,   54,   52,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   43,   43,   43,   43,    0,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   43,   43,   43,   43,    0,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   43,   43,   43,   43,    0,   54,   54,   54,

			   54,   54,   54,    0,   30,   54,   54,   54,   54,   54,
			   54,   54,   54,   43,   43,   43,   43,    0,   54,   54,
			   28,   54,   54,   54,   54,   54,   54,    0,   31,    0,
			   35,   54,   54,   24,   54,   43,   43,   43,   43,    0,
			   54,   54,   54,   22,   54,   54,   54,    0,   34,   54,
			   54,   54,   43,   43,   43,   43,    0,    0,   26,   27,
			   54,   54,    0,   33,   54,   54,    0,   29,   54,   43,
			   43,   39,   43,    0,    0,    0,   36,   54,    0,   32,
			   54,   54,   40,   43,   38,   53,   54,   54,   54,   43,
			   54,   54,   54,   43,   54,   54,   54,   43,   54,   54,

			   54,   43,   54,   54,   23,   43,   54,   54,   43,   54,
			   54,   43,   54,   54,   43,    0,   37,   25,   41,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 713
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 319
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 320
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

	yyNb_rules: INTEGER = 56
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 57
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
