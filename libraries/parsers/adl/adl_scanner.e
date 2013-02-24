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
if yy_act <= 29 then
if yy_act <= 15 then
if yy_act <= 8 then
if yy_act <= 4 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 67 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 67")
end
-- Ignore separators
else
--|#line 68 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 68")
end
in_lineno := in_lineno + text_count
end
else
if yy_act = 3 then
--|#line 73 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 73")
end
-- Ignore comments
else
--|#line 74 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 74")
end
in_lineno := in_lineno + 1
end
end
else
if yy_act <= 6 then
if yy_act = 5 then
--|#line 78 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 78")
end
last_token := Minus_code
else
--|#line 79 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 79")
end
last_token := Plus_code
end
else
if yy_act = 7 then
--|#line 80 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 80")
end
last_token := Star_code
else
--|#line 81 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 81")
end
last_token := Slash_code
end
end
end
else
if yy_act <= 12 then
if yy_act <= 10 then
if yy_act = 9 then
--|#line 82 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 82")
end
last_token := Caret_code
else
--|#line 83 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 83")
end
last_token := Equal_code
end
else
if yy_act = 11 then
--|#line 84 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 84")
end
last_token := Dot_code
else
--|#line 85 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 85")
end
last_token := Semicolon_code
end
end
else
if yy_act <= 14 then
if yy_act = 13 then
--|#line 86 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 86")
end
last_token := Comma_code
else
--|#line 87 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 87")
end
last_token := Colon_code
end
else
--|#line 88 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 88")
end
last_token := Exclamation_code
end
end
end
else
if yy_act <= 22 then
if yy_act <= 19 then
if yy_act <= 17 then
if yy_act = 16 then
--|#line 89 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 89")
end
last_token := Left_parenthesis_code
else
--|#line 90 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 90")
end
last_token := Right_parenthesis_code
end
else
if yy_act = 18 then
--|#line 91 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 91")
end
last_token := Dollar_code
else
--|#line 92 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 92")
end
last_token := Question_mark_code
end
end
else
if yy_act <= 21 then
if yy_act = 20 then
--|#line 94 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 94")
end
last_token := Left_bracket_code
else
--|#line 95 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 95")
end
last_token := Right_bracket_code
end
else
--|#line 99 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 99")
end

				last_token := SYM_ARCHETYPE
			
end
end
else
if yy_act <= 26 then
if yy_act <= 24 then
if yy_act = 23 then
--|#line 103 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 103")
end

				last_token := SYM_TEMPLATE_OVERLAY
			
else
--|#line 107 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 107")
end

				last_token := SYM_TEMPLATE
			
end
else
if yy_act = 25 then
--|#line 111 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 111")
end

				last_token := SYM_OPERATIONAL_TEMPLATE
			
else
--|#line 115 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 115")
end

				last_token := SYM_ADL_VERSION
			
end
end
else
if yy_act <= 28 then
if yy_act = 27 then
--|#line 119 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 119")
end

				last_token := SYM_IS_CONTROLLED
			
else
--|#line 123 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 123")
end

				last_token := SYM_IS_GENERATED
			
end
else
--|#line 127 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 127")
end

				last_token := SYM_UID
			
end
end
end
end
else
if yy_act <= 43 then
if yy_act <= 36 then
if yy_act <= 33 then
if yy_act <= 31 then
if yy_act = 30 then
--|#line 131 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 131")
end

				last_token := SYM_SPECIALIZE
				in_lineno := in_lineno + 1
			
else
--|#line 137 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 137")
end

				last_token := SYM_CONCEPT
				in_lineno := in_lineno + 1
			
end
else
if yy_act = 32 then
--|#line 142 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 142")
end

				last_token := SYM_LANGUAGE
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				language_text_start_line := in_lineno
			
else
--|#line 149 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 149")
end

				last_token := SYM_DESCRIPTION
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				description_text_start_line := in_lineno
			
end
end
else
if yy_act <= 35 then
if yy_act = 34 then
--|#line 156 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 156")
end

				last_token := SYM_DEFINITION
				set_start_condition(IN_CADL_SECTION)
				in_lineno := in_lineno + 1
				definition_text_start_line := in_lineno
			
else
--|#line 163 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 163")
end

				last_token := SYM_INVARIANT
				set_start_condition(IN_ASSERTION_SECTION)
				in_lineno := in_lineno + 1
				invariant_text_start_line := in_lineno
			
end
else
--|#line 170 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 170")
end

				last_token := SYM_ONTOLOGY
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				ontology_text_start_line := in_lineno
			
end
end
else
if yy_act <= 40 then
if yy_act <= 38 then
if yy_act = 37 then
--|#line 177 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 177")
end

				last_token := SYM_ANNOTATIONS
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				annotations_text_start_line := in_lineno
			
else
--|#line 184 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 184")
end

				last_token := SYM_COMPONENT_ONTOLOGIES
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				comp_onts_text_start_line := in_lineno
			
end
else
if yy_act = 39 then
--|#line 192 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 192")
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
--|#line 193 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 193")
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
if yy_act <= 42 then
if yy_act = 41 then
--|#line 194 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 194")
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
--|#line 195 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 195")
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
--|#line 212 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 212")
end
 -- LF
				in_buffer.append_character('%N')
				in_lineno := in_lineno + 1
			
end
end
end
else
if yy_act <= 50 then
if yy_act <= 47 then
if yy_act <= 45 then
if yy_act = 44 then
--|#line 216 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 216")
end
 -- any text on line with no LF
				in_buffer.append_string(text)
			
else
--|#line 231 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 231")
end

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
end
else
if yy_act = 46 then
--|#line 235 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 235")
end
in_lineno := in_lineno + text_count
else
--|#line 237 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 237")
end
 -- non-white space at start
				unread_character(text.item(1))
				last_token := V_CADL_TEXT
				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_
				set_start_condition(INITIAL)
	
end
end
else
if yy_act <= 49 then
if yy_act = 48 then
--|#line 249 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 249")
end
			-- match TAB whitsepace <anything> \n
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
else
--|#line 254 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 254")
end
in_lineno := in_lineno + text_count
end
else
--|#line 256 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 256")
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
if yy_act <= 54 then
if yy_act <= 52 then
if yy_act = 51 then
--|#line 268 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 268")
end

					last_token := V_VERSION_STRING
					last_string_value := text_substring (1, text_count)
			
else
--|#line 274 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 274")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 53 then
--|#line 280 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 280")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
else
--|#line 286 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 286")
end

					last_token := V_IDENTIFIER
					last_string_value := text
			
end
end
else
if yy_act <= 56 then
if yy_act = 55 then
--|#line 292 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 292")
end

					last_token := V_VALUE
					last_string_value := text
			
else
--|#line 299 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 299")
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
			   29,   29,   29,   29,   29,   29,   29,   29,   32,   29,
			   29,   29,   33,   34,   35,   36,   28,   30,   29,   29,
			   37,   46,   38,   39,   53,   54,   57,   58,   40,   41,
			   62,   59,   42,   59,   62,   43,   44,   62,   62,   47,
			   62,   48,   49,   68,   62,   37,   38,   44,   63,   66,
			   64,   64,   62,   76,   62,   67,   62,   69,   62,   73,
			   62,   62,   87,   88,   47,   48,   66,   91,   92,   74,

			  320,   80,   75,   59,   71,   59,  317,   72,   76,   94,
			   77,   94,   78,   79,   93,   93,   94,   93,   93,   93,
			   93,   93,   93,   93,   93,   61,   93,   93,   61,   61,
			   93,   93,   93,   93,   61,   61,   61,   61,   61,   61,
			   61,   61,   61,   61,   61,   61,   61,   61,   61,   61,
			   61,   61,   61,   61,   61,   93,   93,   93,   61,   61,
			   61,   61,   61,   95,   95,   63,   96,   64,   64,   96,
			   96,   96,  101,  101,   96,   96,   96,   96,   96,   96,
			   96,   96,  116,  100,   97,   96,  103,   96,   96,   98,
			   99,  106,  117,  111,  102,  104,  105,  314,  112,  109,

			   96,  107,   87,   88,   96,  108,  110,  113,   91,   92,
			  103,  118,   96,   95,   95,  108,  123,  110,  123,  123,
			  120,  124,   96,   96,  121,  122,   96,   96,   96,   96,
			   96,   96,   96,   96,  139,  140,  140,  127,  125,  129,
			  130,   96,   96,   96,  128,  126,  121,  131,   96,   96,
			  132,   96,  134,  133,   96,  135,  311,  123,  139,  123,
			  123,  127,   96,  129,  147,  130,  144,   96,   96,  142,
			   96,   96,   96,  143,  146,  148,  134,   96,   96,  142,
			  149,   96,  150,  158,  143,  146,  155,  145,   96,   96,
			  154,  151,   96,  152,  158,  156,   96,  153,  118,  157,

			  140,  140,   62,   96,   96,   62,   62,   96,  168,  163,
			   96,  155,  164,  165,   96,   96,  166,  167,   96,   96,
			   96,  178,   96,   96,   96,  169,   96,  170,  167,  173,
			   96,  171,  172,  176,   96,   62,   96,   96,  165,  174,
			   96,  166,   96,  177,  175,  183,  178,  184,  185,   96,
			  307,   96,  191,  188,  173,  175,   96,   96,  176,  185,
			   96,  186,   96,   96,   96,  187,  192,  189,  177,  196,
			  198,  193,  186,  200,  190,  194,   62,  202,  189,  195,
			   96,  198,  204,   96,  200,  190,   96,   96,  197,   96,
			   96,  192,  209,  210,  209,   96,  205,   96,   96,  197,

			   96,   96,   96,  206,  203,   96,  211,   96,  222,  207,
			  208,  214,   96,   96,   96,   96,   96,  213,  218,  222,
			  212,   96,  216,   96,  217,  226,   96,  303,  215,  224,
			   96,  212,  225,   96,  228,   96,  227,  209,  210,  209,
			   96,  229,   96,  231,  230,   96,  233,  234,  233,  235,
			  236,  235,  229,  237,  242,  232,   96,   96,  247,   96,
			  239,  239,  239,  246,  238,  242,  232,   96,  250,  238,
			   96,  249,  249,  249,   96,   96,   96,  248,  253,  254,
			  253,   96,  233,  234,  233,  255,   96,  251,   96,  235,
			  236,  235,  239,  239,  239,  252,  257,  262,  263,  256,

			   96,   96,   96,  240,  249,  249,  249,   96,   96,   96,
			  255,  299,   96,  265,  268,  269,  268,  253,  254,  253,
			  264,  272,  273,  272,   96,   96,  266,   96,  267,  270,
			  271,   96,  260,  277,  260,  274,  281,  282,  281,  268,
			  269,  268,  284,  285,  284,  274,   96,  283,  272,  273,
			  272,   96,   96,  275,  288,  275,  262,  263,  286,  278,
			  290,  278,   96,   96,  287,  281,  282,  281,  284,  285,
			  284,   96,  295,  291,  291,   96,   96,   96,   96,   96,
			   96,   96,   96,  295,   96,   96,   96,  292,  293,  297,
			   96,  302,   96,  308,  294,  298,  296,  300,  292,  293,

			  301,  304,   96,   96,  309,  315,  305,  310,  310,  310,
			   96,   96,  313,  306,  291,  316,  302,   96,  289,  312,
			  310,  310,  310,   96,  319,   96,  316,  280,  321,  322,
			  321,  323,  323,  323,  318,  278,  276,  313,   96,  275,
			  261,   96,  320,  324,  320,  321,  322,  321,  323,  323,
			  323,   45,   45,   45,   45,   45,   45,   45,   45,   50,
			   50,   50,   50,   50,   50,   50,   50,   52,   52,   52,
			   52,   52,   52,   52,   52,   56,   56,   56,   56,   56,
			   56,   56,   56,   62,   62,   62,   62,   62,   62,   65,
			   65,   65,   65,   65,   65,   81,  260,   81,   81,   81,

			   81,   81,   81,   86,   86,   86,   86,   86,   86,   86,
			   86,   90,   90,   90,   90,   90,   90,   90,   90,   93,
			   93,   93,   93,   93,   93,   93,   93,  119,  119,  119,
			  119,  119,  119,  162,  162,  162,  162,  162,  162,  182,
			  182,  182,  182,  182,  182,  223,  223,  223,  245,  245,
			  245,  245,  245,  279,  279,  279,  279,  279,  259,  258,
			   96,  244,  243,  241,  221,  220,  219,  201,  199,   62,
			  181,  180,  179,  161,  160,  159,  141,  138,  137,  136,
			   96,   62,   94,   92,   89,   88,   85,  115,  114,   96,
			   60,   89,   89,   85,   85,   84,   83,   82,   70,   62,

			   61,   60,  325,   55,   51,   46,    9,  325,  325,  325,
			  325,  325,  325,  325,  325,  325,  325,  325,  325,  325,
			  325,  325,  325,  325,  325,  325,  325,  325,  325,  325,
			  325,  325,  325,  325,  325,  325,  325,  325,  325,  325,
			  325,  325,  325,  325,  325,  325,  325,  325,  325,  325,
			  325,  325,  325,  325,  325,  325, yy_Dummy>>)
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
			   31,   11,    2,   11,   30,    2,    2,   28,   38,    4,
			   32,    4,    4,   31,   41,    2,    2,    2,   23,   28,
			   23,   23,   40,   41,   37,   30,   39,   32,   44,   38,
			   42,   43,   53,   53,    4,    4,   37,   57,   57,   39,

			  317,   44,   40,   59,   37,   59,  314,   37,   41,   94,
			   42,   94,   42,   43,   61,   61,   61,   61,   61,   61,
			   61,   61,   61,   61,   61,   61,   61,   61,   61,   61,
			   61,   61,   61,   61,   61,   61,   61,   61,   61,   61,
			   61,   61,   61,   61,   61,   61,   61,   61,   61,   61,
			   61,   61,   61,   61,   61,   61,   61,   61,   61,   61,
			   61,   61,   61,   63,   63,   64,   66,   64,   64,   67,
			   68,   69,   70,   70,   71,   72,   73,   74,   75,   76,
			   78,   77,   84,   69,   66,   79,   72,   97,   80,   67,
			   68,   74,   84,   78,   71,   73,   73,  311,   79,   76,

			  102,   74,   87,   87,   98,   75,   77,   80,   91,   91,
			   72,   95,   99,   95,   95,   75,  101,   77,  101,  101,
			   97,  102,  103,  104,   98,   99,  105,  106,  107,  110,
			  111,  108,  109,  113,  117,  118,  118,  105,  103,  107,
			  108,  112,  120,  122,  106,  104,  105,  109,  121,  124,
			  110,  125,  112,  111,  126,  113,  307,  123,  117,  123,
			  123,  105,  128,  107,  125,  108,  122,  127,  129,  120,
			  130,  131,  132,  121,  124,  126,  112,  133,  134,  120,
			  127,  135,  128,  136,  121,  124,  133,  123,  148,  143,
			  132,  129,  147,  130,  136,  134,  142,  131,  140,  135,

			  140,  140,  141,  149,  144,  141,  141,  146,  148,  142,
			  150,  133,  143,  144,  151,  152,  146,  147,  154,  155,
			  153,  158,  163,  165,  156,  149,  164,  150,  147,  153,
			  171,  151,  152,  156,  157,  141,  166,  167,  144,  154,
			  168,  146,  169,  157,  155,  163,  158,  164,  165,  170,
			  303,  176,  171,  168,  153,  155,  173,  172,  156,  165,
			  174,  166,  175,  177,  184,  167,  172,  169,  157,  176,
			  178,  173,  166,  180,  170,  174,  182,  182,  169,  175,
			  183,  178,  184,  185,  180,  170,  186,  187,  177,  190,
			  188,  172,  189,  189,  189,  191,  185,  192,  193,  177,

			  194,  195,  189,  186,  183,  197,  190,  196,  201,  187,
			  188,  193,  203,  205,  204,  206,  208,  192,  197,  201,
			  191,  207,  195,  211,  196,  205,  212,  299,  194,  203,
			  213,  191,  204,  216,  207,  229,  206,  209,  209,  209,
			  217,  208,  224,  212,  211,  225,  214,  214,  214,  215,
			  215,  215,  208,  216,  220,  213,  214,  227,  225,  215,
			  218,  218,  218,  224,  217,  220,  213,  230,  229,  217,
			  218,  228,  228,  228,  231,  240,  237,  227,  232,  232,
			  232,  228,  233,  233,  233,  237,  238,  230,  232,  235,
			  235,  235,  239,  239,  239,  231,  240,  245,  245,  238,

			  246,  247,  248,  218,  249,  249,  249,  250,  257,  252,
			  237,  295,  255,  247,  251,  251,  251,  253,  253,  253,
			  246,  256,  256,  256,  251,  271,  248,  267,  250,  252,
			  255,  256,  260,  260,  260,  257,  266,  266,  266,  268,
			  268,  268,  270,  270,  270,  257,  266,  267,  272,  272,
			  272,  274,  270,  275,  275,  275,  279,  279,  271,  278,
			  278,  278,  283,  286,  274,  281,  281,  281,  284,  284,
			  284,  287,  289,  291,  291,  292,  293,  294,  304,  296,
			  300,  297,  298,  289,  301,  302,  305,  283,  286,  293,
			  313,  298,  312,  304,  287,  294,  292,  296,  283,  286,

			  297,  300,  308,  309,  305,  312,  301,  306,  306,  306,
			  315,  316,  309,  302,  280,  313,  298,  306,  276,  308,
			  310,  310,  310,  265,  316,  264,  313,  263,  318,  318,
			  318,  319,  319,  319,  315,  261,  259,  309,  318,  258,
			  244,  319,  320,  320,  320,  321,  321,  321,  323,  323,
			  323,  326,  326,  326,  326,  326,  326,  326,  326,  327,
			  327,  327,  327,  327,  327,  327,  327,  328,  328,  328,
			  328,  328,  328,  328,  328,  329,  329,  329,  329,  329,
			  329,  329,  329,  330,  330,  330,  330,  330,  330,  331,
			  331,  331,  331,  331,  331,  332,  243,  332,  332,  332,

			  332,  332,  332,  333,  333,  333,  333,  333,  333,  333,
			  333,  334,  334,  334,  334,  334,  334,  334,  334,  335,
			  335,  335,  335,  335,  335,  335,  335,  336,  336,  336,
			  336,  336,  336,  337,  337,  337,  337,  337,  337,  338,
			  338,  338,  338,  338,  338,  339,  339,  339,  340,  340,
			  340,  340,  340,  341,  341,  341,  341,  341,  242,  241,
			  226,  222,  221,  219,  200,  199,  198,  181,  179,  162,
			  161,  160,  159,  139,  138,  137,  119,  116,  115,  114,
			  100,   96,   93,   90,   89,   86,   85,   83,   82,   65,
			   60,   58,   55,   54,   51,   49,   48,   47,   33,   29,

			   20,   12,    9,    7,    5,    3,  325,  325,  325,  325,
			  325,  325,  325,  325,  325,  325,  325,  325,  325,  325,
			  325,  325,  325,  325,  325,  325,  325,  325,  325,  325,
			  325,  325,  325,  325,  325,  325,  325,  325,  325,  325,
			  325,  325,  325,  325,  325,  325,  325,  325,  325,  325,
			  325,  325,  325,  325,  325,  325, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,   29,  802,   48,  801,   52,  800,   54,  802,
			  806,   59,  798,  806,  806,  806,  806,  806,  806,  806,
			  788,  806,  806,   65,  806,  806,  806,  806,   55,  787,
			   52,   48,   58,  752,  806,  806,    0,   72,   56,   74,
			   70,   62,   78,   79,   76,    0,  806,  765,  763,  770,
			  806,  791,  806,   90,  790,  789,  806,   95,  788,  101,
			  787,  113,    0,  148,  152,  777,  154,  157,  158,  159,
			  125,  162,  163,  164,  165,  166,  167,  169,  168,  173,
			  176,    0,  756,  756,  156,  783,  782,  200,  806,  781,
			  780,  206,  806,  779,  107,  198,  769,  175,  192,  200,

			  768,  203,  188,  210,  211,  214,  215,  216,  219,  220,
			  217,  218,  229,  221,  746,  744,  748,  211,  220,  764,
			  230,  236,  231,  244,  237,  239,  242,  255,  250,  256,
			  258,  259,  260,  265,  266,  269,  246,  742,  742,  738,
			  285,  290,  284,  277,  292,  806,  295,  280,  276,  291,
			  298,  302,  303,  308,  306,  307,  312,  322,  300,  740,
			  742,  741,  757,  310,  314,  311,  324,  325,  328,  330,
			  337,  318,  345,  344,  348,  350,  339,  351,  333,  743,
			  336,  733,  364,  368,  352,  371,  374,  375,  378,  390,
			  377,  383,  385,  386,  388,  389,  395,  393,  737,  733,

			  735,  371,    0,  400,  402,  401,  403,  409,  404,  435,
			  806,  411,  414,  418,  444,  447,  421,  428,  458,  730,
			  417,  729,  732,    0,  430,  433,  748,  445,  469,  423,
			  455,  462,  476,  480,  806,  487,  806,  464,  474,  490,
			  463,  727,  713,  664,  607,  485,  488,  489,  490,  502,
			  495,  512,  497,  515,  806,  500,  519,  496,  603,  603,
			  530,  603,    0,  578,  613,  611,  534,  515,  537,  806,
			  540,  513,  546,  806,  539,  551,  586,  806,  557,  544,
			  598,  563,  806,  550,  566,  806,  551,  559,  806,  535,
			  806,  558,  563,  564,  565,  478,  567,  569,  570,  397,

			  568,  572,  573,  317,  566,  574,  605,  229,  590,  591,
			  618,  168,  580,  578,   81,  598,  599,   64,  626,  629,
			  640,  643,  806,  646,  806,  806,  650,  658,  666,  674,
			  680,  686,  694,  702,  710,  718,  724,  730,  736,  739,
			  744,  749, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,  325,    1,  326,  326,  327,  328,  327,  329,  325,
			  325,  325,  325,  325,  325,  325,  325,  325,  325,  325,
			  330,  325,  325,  330,  325,  325,  325,  325,  331,  331,
			  331,  331,  331,  325,  325,  325,  330,  331,  331,  331,
			  331,  331,  331,  331,  331,  332,  325,  332,  332,  332,
			  325,  325,  325,  333,  325,  325,  325,  334,  325,  325,
			  325,  325,  330,  325,  330,  331,  331,  331,  331,  331,
			  325,  331,  331,  331,  331,  331,  331,  331,  331,  331,
			  331,  332,  332,  332,  332,  325,  333,  333,  325,  325,
			  334,  334,  325,  335,  325,  325,  336,  331,  331,  331,

			  331,  325,  331,  331,  331,  331,  331,  331,  331,  331,
			  331,  331,  331,  331,  332,  332,  332,  332,  325,  336,
			  331,  331,  331,  325,  331,  331,  331,  331,  331,  331,
			  331,  331,  331,  331,  331,  331,  332,  332,  332,  332,
			  325,  337,  331,  331,  331,  325,  331,  331,  331,  331,
			  331,  331,  331,  331,  331,  331,  331,  331,  332,  332,
			  332,  332,  338,  331,  331,  331,  331,  331,  331,  331,
			  331,  331,  331,  331,  331,  331,  331,  331,  332,  332,
			  332,  332,  338,  331,  331,  331,  331,  331,  331,  331,
			  331,  331,  331,  331,  331,  331,  331,  331,  332,  332,

			  332,  332,  339,  331,  331,  331,  331,  331,  331,  325,
			  325,  331,  331,  331,  331,  331,  331,  331,  331,  332,
			  332,  332,  332,  340,  331,  331,  331,  331,  331,  331,
			  331,  331,  331,  325,  325,  325,  325,  331,  331,  325,
			  331,  332,  332,  332,  332,  340,  331,  331,  331,  325,
			  331,  331,  331,  325,  325,  331,  331,  331,  332,  332,
			  332,  332,  341,  325,  331,  331,  331,  331,  325,  325,
			  331,  331,  325,  325,  331,  332,  332,  325,  332,  341,
			  325,  325,  325,  331,  325,  325,  331,  331,  325,  332,
			  325,  325,  331,  331,  331,  332,  331,  331,  331,  332,

			  331,  331,  331,  332,  331,  331,  331,  332,  331,  331,
			  325,  332,  331,  331,  332,  331,  331,  332,  331,  331,
			  332,  325,  325,  325,  325,    0,  325,  325,  325,  325,
			  325,  325,  325,  325,  325,  325,  325,  325,  325,  325,
			  325,  325, yy_Dummy>>)
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
			    1,    1,    3,    1,    1,    4,    5,    1,    1,    1,
			    1,    6,    6,    6,    7,    6,    6,    6,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,    6,    6,
			    6,    8,    1,    1,    1,    4,    6,    6,    6,    6, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   58,
			   56,    1,    2,   15,   18,   16,   17,    7,    6,   13,
			    5,   11,    8,   55,   14,   12,   10,   19,   55,   55,
			   55,   55,   55,   20,   21,    9,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   44,   43,   44,   44,   44,
			   57,   46,   47,   57,   46,   49,   50,   57,   49,    1,
			    2,    3,   55,    0,   55,   54,   54,   54,   54,   54,
			    0,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   44,   44,   44,   44,   46,    0,    0,   45,   49,
			    0,    0,   48,    3,    4,   51,   55,   54,   54,   54,

			   29,    0,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   44,   44,   44,   44,    0,   55,
			   54,   54,   54,    0,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   44,   44,   44,   44,
			   51,   55,   54,   54,   54,   52,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   44,   44,
			   44,   44,   55,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   44,   44,
			   44,   44,   55,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   44,   44,

			   44,   44,    0,   54,   54,   54,   54,   54,   54,    0,
			   31,   54,   54,   54,   54,   54,   54,   54,   54,   44,
			   44,   44,   44,    0,   54,   54,   28,   54,   54,   54,
			   54,   54,   54,    0,   32,    0,   36,   54,   54,   24,
			   54,   44,   44,   44,   44,    0,   54,   54,   54,   22,
			   54,   54,   54,    0,   35,   54,   54,   54,   44,   44,
			   44,   44,    0,    0,   26,   27,   54,   54,    0,   34,
			   54,   54,    0,   30,   54,   44,   44,   40,   44,    0,
			    0,    0,   37,   54,    0,   33,   54,   54,   41,   44,
			   39,   53,   54,   54,   54,   44,   54,   54,   54,   44,

			   54,   54,   54,   44,   54,   54,   54,   44,   54,   54,
			   23,   44,   54,   54,   44,   54,   54,   44,   54,   54,
			   44,    0,   38,   25,   42,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 806
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 325
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 326
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

	yyNb_rules: INTEGER = 57
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 58
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
