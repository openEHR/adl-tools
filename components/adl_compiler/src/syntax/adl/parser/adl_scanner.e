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

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
end
else
--|#line 251 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 251")
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
--|#line 263 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 263")
end

					last_token := V_VERSION_STRING
					last_string_value := text_substring (1, text_count)
			
else
--|#line 269 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 269")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
else
--|#line 275 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 275")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
end
else
if yy_act <= 54 then
if yy_act = 53 then
--|#line 281 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 281")
end

					last_token := V_IDENTIFIER
					last_string_value := text
			
else
--|#line 288 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 288")
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
			  311,   55,   40,   55,   65,   41,   42,   66,   71,   45,
			   72,   46,   47,   81,   82,   35,   36,   42,   58,   88,
			   59,   59,   70,   84,   85,   55,   88,   55,   87,   87,
			   58,   88,   59,   59,   45,   46,   88,   89,   92,   92,

			   88,   88,   88,   88,   88,   88,   90,   88,   88,   88,
			  308,   91,   94,  107,   81,   82,   93,   97,   88,   95,
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
			   88,  169,  146,  305,  164,   88,   88,  167,  161,  162,
			  159,  163,  158,  156,  157,  160,   88,  165,   88,   88,
			   88,  175,  166,  158,   88,  168,  169,   88,  174,  164,
			   88,  176,  167,  166,   88,   88,   88,  179,   88,  183,
			   88,   88,  176,  177,   88,  180,  302,  178,  189,  184,
			  168,  185,  181,   88,  177,  186,  180,  182,  187,  189,

			  191,   88,   88,  181,  183,   88,  188,   88,  194,   88,
			  197,  191,  200,  201,  200,  196,   88,  188,   88,  195,
			   88,   88,   88,   88,  202,   88,   88,  198,   88,  199,
			   88,  298,  213,  205,   88,   88,   88,   88,  204,  209,
			   88,  203,  208,  213,  207,  215,  217,   88,  216,  206,
			  219,   88,  203,  200,  201,  200,  218,  222,   88,   88,
			  294,  220,   88,  224,  225,  224,  233,   88,  221,  226,
			  227,  226,  220,   88,   88,  238,  223,  233,  228,   88,
			  230,  230,  230,  229,   88,   88,   88,  223,  229,   88,
			   88,  240,  240,  240,   88,  237,  244,  245,  244,   88,

			  241,   88,  247,  246,  239,  242,   88,  243,  224,  225,
			  224,  226,  227,  226,  230,  230,  230,  253,  254,   88,
			  248,   88,   88,  231,  240,  240,  240,   88,  246,   88,
			  259,  260,  259,  256,  244,  245,  244,   88,   88,  255,
			   88,  263,  264,  263,   88,   88,  257,   88,  258,  261,
			   88,   88,  251,  268,  251,  262,  272,  273,  272,  259,
			  260,  259,  299,  278,  274,  265,   88,  275,  276,  275,
			  263,  264,  263,  253,  254,  265,   88,   88,  277,  266,
			  279,  266,  269,  281,  269,  272,  273,  272,  275,  276,
			  275,   88,   88,  286,  282,  282,   88,   88,   88,   88,

			   88,  283,   88,   88,  286,   88,   88,  293,  290,  282,
			  288,   88,  283,   88,   88,  285,  284,  287,  289,   88,
			  291,  296,  292,  301,  301,  301,  295,  284,  304,  300,
			  303,   88,  293,   88,  297,  301,  301,  301,   88,  307,
			  280,   88,   88,   88,  306,  312,  313,  312,  271,  269,
			  307,  267,  266,  304,  310,   88,  314,  314,  314,  311,
			  315,  311,  309,  312,  313,  312,   88,  314,  314,  314,
			   43,   43,   43,   43,   43,   43,   43,   48,   48,   48,
			   48,   48,   48,   48,   50,   50,   50,   50,   50,   50,
			   50,   53,   53,   53,   53,   53,   53,   53,   60,   60,

			   60,   60,   60,   75,  252,   75,   75,   75,   75,   75,
			   80,   80,   80,   80,   80,   80,   80,   83,   83,   83,
			   83,   83,   83,   83,   57,   57,   57,   57,   57,   57,
			   57,  110,  110,  110,  110,  110,  153,  153,  153,  173,
			  173,  173,  173,  173,  214,  214,  214,  236,  236,  236,
			  236,  236,  270,  270,  270,  270,  270,  251,  250,  249,
			   88,  235,  234,  232,  212,  211,  210,  193,  192,  190,
			  172,  171,  170,  152,  151,  150,  132,  129,  128,  127,
			   85,   82,   79,  106,  105,   88,   86,   56,   79,   79,
			   78,   77,   76,   74,   73,   69,   68,   67,   64,   63,

			   62,   61,   57,   56,  316,   54,   49,   44,    9,  316,
			  316,  316,  316,  316,  316,  316,  316,  316,  316,  316,
			  316,  316,  316,  316,  316,  316,  316,  316,  316,  316,
			  316,  316,  316,  316,  316,  316,  316,  316,  316,  316,
			  316,  316,  316,  316,  316,  316,  316,  316,  316,  316,
			  316,  316,  316,  316,  316,  316,  316,  316, yy_Dummy>>)
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
			  308,   11,    2,   11,   35,    2,    2,   35,   40,    4,
			   40,    4,    4,   51,   51,    2,    2,    2,   23,   61,
			   23,   23,   39,   54,   54,   55,   62,   55,   58,   58,
			   59,   63,   59,   59,    4,    4,   65,   61,   64,   64,

			   67,   66,   69,   68,   70,   71,   62,   74,   72,   73,
			  305,   63,   66,   78,   81,   81,   65,   68,   89,   67,
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
			  155,  149,  124,  302,  144,  154,  156,  147,  141,  142,
			  139,  143,  138,  135,  137,  140,  148,  145,  157,  158,
			  160,  155,  146,  138,  159,  148,  149,  161,  154,  144,
			  163,  156,  147,  146,  164,  162,  165,  159,  166,  163,
			  167,  168,  156,  157,  174,  160,  298,  158,  169,  164,
			  148,  165,  161,  177,  157,  166,  160,  162,  167,  169,

			  171,  175,  176,  161,  163,  178,  168,  181,  174,  179,
			  177,  171,  180,  180,  180,  176,  182,  168,  183,  175,
			  184,  185,  180,  186,  181,  187,  188,  178,  194,  179,
			  195,  294,  192,  184,  196,  197,  199,  198,  183,  188,
			  203,  182,  187,  192,  186,  194,  196,  202,  195,  185,
			  198,  204,  182,  200,  200,  200,  197,  203,  207,  208,
			  290,  199,  216,  205,  205,  205,  211,  220,  202,  206,
			  206,  206,  199,  205,  215,  216,  204,  211,  207,  206,
			  209,  209,  209,  208,  218,  221,  222,  204,  208,  229,
			  209,  219,  219,  219,  228,  215,  223,  223,  223,  231,

			  220,  219,  229,  228,  218,  221,  223,  222,  224,  224,
			  224,  226,  226,  226,  230,  230,  230,  236,  236,  237,
			  231,  238,  239,  209,  240,  240,  240,  241,  228,  243,
			  242,  242,  242,  238,  244,  244,  244,  246,  248,  237,
			  242,  247,  247,  247,  258,  262,  239,  295,  241,  243,
			  265,  247,  251,  251,  251,  246,  257,  257,  257,  259,
			  259,  259,  295,  265,  258,  248,  257,  261,  261,  261,
			  263,  263,  263,  270,  270,  248,  274,  261,  262,  266,
			  266,  266,  269,  269,  269,  272,  272,  272,  275,  275,
			  275,  277,  278,  280,  282,  282,  283,  284,  289,  292,

			  285,  274,  287,  288,  280,  291,  293,  289,  286,  271,
			  284,  296,  274,  299,  304,  278,  277,  283,  285,  300,
			  287,  292,  288,  297,  297,  297,  291,  277,  300,  296,
			  299,  303,  289,  297,  293,  301,  301,  301,  306,  304,
			  267,  307,  256,  255,  303,  309,  309,  309,  254,  252,
			  304,  250,  249,  300,  307,  309,  310,  310,  310,  311,
			  311,  311,  306,  312,  312,  312,  310,  314,  314,  314,
			  317,  317,  317,  317,  317,  317,  317,  318,  318,  318,
			  318,  318,  318,  318,  319,  319,  319,  319,  319,  319,
			  319,  320,  320,  320,  320,  320,  320,  320,  321,  321,

			  321,  321,  321,  322,  235,  322,  322,  322,  322,  322,
			  323,  323,  323,  323,  323,  323,  323,  324,  324,  324,
			  324,  324,  324,  324,  325,  325,  325,  325,  325,  325,
			  325,  326,  326,  326,  326,  326,  327,  327,  327,  328,
			  328,  328,  328,  328,  329,  329,  329,  330,  330,  330,
			  330,  330,  331,  331,  331,  331,  331,  234,  233,  232,
			  217,  213,  212,  210,  191,  190,  189,  173,  172,  170,
			  152,  151,  150,  130,  129,  128,  110,  107,  106,  105,
			   83,   80,   79,   77,   76,   60,   57,   56,   52,   49,
			   47,   46,   45,   42,   41,   38,   37,   36,   32,   31,

			   30,   28,   20,   12,    9,    8,    5,    3,  316,  316,
			  316,  316,  316,  316,  316,  316,  316,  316,  316,  316,
			  316,  316,  316,  316,  316,  316,  316,  316,  316,  316,
			  316,  316,  316,  316,  316,  316,  316,  316,  316,  316,
			  316,  316,  316,  316,  316,  316,  316,  316,  316,  316,
			  316,  316,  316,  316,  316,  316,  316,  316, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,   29,  704,   48,  703,   52,    0,  703,  704,
			  708,   59,  700,  708,  708,  708,  708,  708,  708,  708,
			  690,  708,  708,   65,  708,  708,  708,  708,  677,    0,
			  667,  674,  652,  708,  708,   32,  664,  671,  663,   36,
			   36,  660,  668,    0,  708,  660,  658,  665,  708,  686,
			  708,   71,  685,  708,   81,   83,  684,  683,   73,   77,
			  673,   67,   74,   79,   51,   84,   89,   88,   91,   90,
			   92,   93,   96,   97,   95,    0,  652,  652,   87,  679,
			  678,  112,  708,  677,  129,  708,  131,  127,    0,  106,
			  113,  122,  133,  125,  116,  126,  138,  140,  141,  144,

			  145,  142,  143,  150,  147,  646,  644,  648,  140,  151,
			  664,  156,  159,  164,  167,  165,  167,  179,  181,  162,
			  174,  186,  177,  188,  196,  172,  192,  166,  642,  642,
			  638,  210,    0,  199,  204,  207,  708,  208,  215,  218,
			  221,  219,  220,  222,  223,  224,  225,  226,  244,  220,
			  640,  642,  641,    0,  233,  228,  234,  246,  247,  252,
			  248,  255,  263,  258,  262,  264,  266,  268,  269,  251,
			  644,  263,  634,  654,  272,  289,  290,  281,  293,  297,
			  310,  295,  304,  306,  308,  309,  311,  313,  314,  637,
			  633,  635,  295,    0,  316,  318,  322,  323,  325,  324,

			  351,  708,  335,  328,  339,  361,  367,  346,  347,  378,
			  630,  329,  629,  632,    0,  362,  350,  648,  372,  389,
			  355,  373,  374,  394,  406,  708,  409,  708,  382,  377,
			  412,  387,  627,  613,  625,  571,  405,  407,  409,  410,
			  422,  415,  428,  417,  432,  708,  425,  439,  426,  516,
			  518,  450,  517,    0,  499,  531,  530,  454,  432,  457,
			  708,  465,  433,  468,  708,  438,  477,  508,  708,  480,
			  461,  493,  483,  708,  464,  486,  708,  479,  480,  708,
			  456,  708,  479,  484,  485,  488,  475,  490,  491,  486,
			  330,  493,  487,  494,  298,  435,  499,  521,  259,  501,

			  507,  533,  214,  519,  502,   85,  526,  529,   24,  543,
			  554,  557,  561,  708,  565,  708,  708,  569,  576,  583,
			  590,  595,  602,  609,  616,  623,  628,  631,  636,  639,
			  644,  649, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,  316,    1,  317,  317,  318,  319,  318,  320,  316,
			  316,  316,  316,  316,  316,  316,  316,  316,  316,  316,
			  316,  316,  316,  316,  316,  316,  316,  316,  321,  321,
			  321,  321,  316,  316,  316,  321,  321,  321,  321,  321,
			  321,  321,  321,  322,  316,  322,  322,  322,  316,  316,
			  316,  323,  316,  316,  324,  316,  316,  325,  316,  316,
			  321,  321,  321,  321,  316,  321,  321,  321,  321,  321,
			  321,  321,  321,  321,  321,  322,  322,  322,  322,  316,
			  323,  323,  316,  324,  324,  316,  316,  316,  326,  321,
			  321,  321,  316,  321,  321,  321,  321,  321,  321,  321,

			  321,  321,  321,  321,  321,  322,  322,  322,  322,  316,
			  326,  321,  321,  321,  316,  321,  321,  321,  321,  321,
			  321,  321,  321,  321,  321,  321,  321,  322,  322,  322,
			  322,  316,  327,  321,  321,  321,  316,  321,  321,  321,
			  321,  321,  321,  321,  321,  321,  321,  321,  321,  322,
			  322,  322,  322,  328,  321,  321,  321,  321,  321,  321,
			  321,  321,  321,  321,  321,  321,  321,  321,  321,  322,
			  322,  322,  322,  328,  321,  321,  321,  321,  321,  321,
			  321,  321,  321,  321,  321,  321,  321,  321,  321,  322,
			  322,  322,  322,  329,  321,  321,  321,  321,  321,  321,

			  316,  316,  321,  321,  321,  321,  321,  321,  321,  321,
			  322,  322,  322,  322,  330,  321,  321,  321,  321,  321,
			  321,  321,  321,  321,  316,  316,  316,  316,  321,  321,
			  316,  321,  322,  322,  322,  322,  330,  321,  321,  321,
			  316,  321,  321,  321,  316,  316,  321,  321,  321,  322,
			  322,  322,  322,  331,  316,  321,  321,  321,  321,  316,
			  316,  321,  321,  316,  316,  321,  322,  322,  316,  322,
			  331,  316,  316,  316,  321,  316,  316,  321,  321,  316,
			  322,  316,  316,  321,  321,  321,  322,  321,  321,  321,
			  322,  321,  321,  321,  322,  321,  321,  321,  322,  321,

			  321,  316,  322,  321,  321,  322,  321,  321,  322,  321,
			  321,  322,  316,  316,  316,  316,    0,  316,  316,  316,
			  316,  316,  316,  316,  316,  316,  316,  316,  316,  316,
			  316,  316, yy_Dummy>>)
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
			   43,   43,   43,    0,    0,   26,   27,   53,   53,    0,
			   33,   53,   53,    0,   29,   53,   43,   43,   39,   43,
			    0,    0,    0,   36,   53,    0,   32,   53,   53,   40,
			   43,   38,   52,   53,   53,   53,   43,   53,   53,   53,
			   43,   53,   53,   53,   43,   53,   53,   53,   43,   53,

			   53,   23,   43,   53,   53,   43,   53,   53,   43,   53,
			   53,   43,    0,   37,   25,   41,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 708
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 316
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 317
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
