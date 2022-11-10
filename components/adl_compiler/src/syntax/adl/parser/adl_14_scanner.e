note
	component:   "openEHR ADL Tools"
	description: "Scanner for ADL 1.4 texts"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ADL_14_SCANNER

inherit
	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton,
			output as print_out
		end

	ADL_14_TOKENS
		export
			{NONE} all
		end

	UT_CHARACTER_CODES
		export
			{NONE} all
		end

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
			inspect yy_act
when 1 then
--|#line 53 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 53")
end
-- Ignore separators
when 2 then
--|#line 54 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 54")
end
in_lineno := in_lineno + text_count
when 3 then
--|#line 59 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 59")
end
-- Ignore comments
when 4 then
--|#line 60 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 60")
end
in_lineno := in_lineno + 1
when 5 then
--|#line 64 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 64")
end
last_token := Minus_code
when 6 then
--|#line 65 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 65")
end
last_token := Plus_code
when 7 then
--|#line 66 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 66")
end
last_token := Star_code
when 8 then
--|#line 67 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 67")
end
last_token := Slash_code
when 9 then
--|#line 68 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 68")
end
last_token := Caret_code
when 10 then
--|#line 69 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 69")
end
last_token := Equal_code
when 11 then
--|#line 70 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 70")
end
last_token := Dot_code
when 12 then
--|#line 71 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 71")
end
last_token := Semicolon_code
when 13 then
--|#line 72 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 72")
end
last_token := Comma_code
when 14 then
--|#line 73 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 73")
end
last_token := Colon_code
when 15 then
--|#line 74 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 74")
end
last_token := Exclamation_code
when 16 then
--|#line 75 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 75")
end
last_token := Left_parenthesis_code
when 17 then
--|#line 76 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 76")
end
last_token := Right_parenthesis_code
when 18 then
--|#line 77 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 77")
end
last_token := Dollar_code
when 19 then
--|#line 78 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 78")
end
last_token := Question_mark_code
when 20 then
--|#line 80 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 80")
end
last_token := Left_bracket_code
when 21 then
--|#line 81 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 81")
end
last_token := Right_bracket_code
when 22 then
--|#line 85 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 85")
end

				last_token := SYM_ARCHETYPE
			
when 23 then
--|#line 89 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 89")
end

				last_token := SYM_ADL_VERSION
			
when 24 then
--|#line 93 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 93")
end

				last_token := SYM_IS_CONTROLLED
			
when 25 then
--|#line 97 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 97")
end

				last_token := SYM_IS_GENERATED
			
when 26 then
--|#line 101 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 101")
end

				last_token := SYM_UID
			
when 27 then
--|#line 105 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 105")
end

				last_token := SYM_SPECIALIZE
				in_lineno := in_lineno + 1
			
when 28 then
--|#line 111 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 111")
end

				last_token := SYM_CONCEPT
				in_lineno := in_lineno + 1
			
when 29 then
--|#line 116 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 116")
end

				last_token := SYM_LANGUAGE
				set_start_condition(IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				language_text_start_line := in_lineno
			
when 30 then
--|#line 123 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 123")
end

				last_token := SYM_DESCRIPTION
				set_start_condition(IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				description_text_start_line := in_lineno
			
when 31 then
--|#line 130 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 130")
end

				last_token := SYM_DEFINITION
				set_start_condition(IN_CADL_SECTION)
				in_lineno := in_lineno + 1
				definition_text_start_line := in_lineno
			
when 32 then
--|#line 137 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 137")
end

				last_token := SYM_INVARIANT
				set_start_condition(IN_ASSERTION_SECTION)
				in_lineno := in_lineno + 1
				invariant_text_start_line := in_lineno
			
when 33 then
--|#line 144 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 144")
end

				last_token := SYM_ONTOLOGY
				set_start_condition(IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				terminology_text_start_line := in_lineno
			
when 34 then
--|#line 151 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 151")
end

				last_token := SYM_ANNOTATIONS
				set_start_condition(IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				annotations_text_start_line := in_lineno
			
when 35, 36, 37 then
--|#line 159 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 159")
end
 -- line starting with any keyword that can appear after an ODIN section
				-- unread the pattern just matched
				a_text := text
				from i := text_count until i < 1 loop
					unread_character (a_text.item (i))
					i := i - 1
				end

				-- get the ODIN section sorted out
				last_token := V_ODIN_TEXT
				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_

				set_start_condition(INITIAL)
			
when 38 then
--|#line 178 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 178")
end
 -- LF
				in_buffer.append_character('%N')
				in_lineno := in_lineno + 1
			
when 39 then
--|#line 182 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 182")
end
 -- any text on line with no LF
				in_buffer.append_string(text)
			
when 40 then
--|#line 197 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 197")
end

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
when 41 then
--|#line 202 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 202")
end
in_lineno := in_lineno + text_count
when 42 then
--|#line 204 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 204")
end
 -- non-white space at start
				unread_character(text.item(1))
				last_token := V_CADL_TEXT
				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_
				set_start_condition(INITIAL)
	
when 43 then
--|#line 216 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 216")
end
			-- match ^whitespace <anything> \n
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
when 44 then
--|#line 221 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 221")
end
in_lineno := in_lineno + text_count
when 45 then
--|#line 223 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 223")
end
 -- non-white space at start
				unread_character(text.item(1))
				last_token := V_ASSERTION_TEXT
				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_
				set_start_condition(INITIAL)
	
when 46 then
--|#line 235 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 235")
end

					last_token := V_DOTTED_NUMERIC
					last_string_value := text_substring (1, text_count)
			
when 47 then
--|#line 241 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 241")
end

					last_token := V_CONCEPT_CODE
					last_string_value := text_substring (2, text_count - 1)
			
when 48 then
--|#line 247 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 247")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
when 49 then
--|#line 253 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 253")
end

					last_token := V_IDENTIFIER
					last_string_value := text
			
when 50 then
--|#line 259 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 259")
end

					last_token := V_VALUE
					last_string_value := text
			
when 51 then
--|#line 266 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 266")
end
-- ignore unmatched chars
when 52 then
--|#line 0 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 0")
end
default_action
			else
				last_token := yyError_token
				fatal_error ("fatal scanner internal error: no action found")
			end
			yy_set_beginning_of_line
		end

	yy_execute_eof_action (yy_sc: INTEGER)
			-- Execute EOF semantic action.
		do
			inspect yy_sc
when 0, 2, 3 then
--|#line 265 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 265")
end
terminate
when 1 then
--|#line 185 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 185")
end

				-- get the ODIN section sorted out
				last_token := V_ODIN_TEXT
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
			-- Template for `yy_nxt'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 981)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			yy_nxt_template_3 (an_array)
			yy_nxt_template_4 (an_array)
			yy_nxt_template_5 (an_array)
			an_array.area.fill_with (283, 932, 981)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			    0,   11,   12,   11,   13,   14,   15,   16,   17,   18,
			   19,   20,   21,   22,   23,   23,   24,   25,   26,   27,
			   28,   29,   30,   29,   29,   29,   31,   29,   29,   29,
			   29,   29,   29,   29,   29,   29,   32,   29,   29,   29,
			   33,   34,   35,   36,   30,   29,   29,   29,   32,   29,
			   10,   37,   45,   38,   39,   51,   52,   55,   56,   40,
			   41,   57,   42,   57,   61,   43,   62,   62,   60,   60,
			   46,   60,   60,   47,  259,   38,   39,   40,   60,   60,
			   64,   60,   60,   60,   60,   60,   60,  109,   60,   60,
			   60,   60,   60,   60,   66,   47,  110,   64,   65,   57,

			   67,   57,   64,   72,   69,   60,   60,   70,   71,   60,
			   60,   73,   60,   60,   74,   82,   83,  222,   67,   64,
			  133,   70,   86,   87,   90,   90,  265,   61,   75,   62,
			   62,   82,   83,   76,   88,   89,   88,   88,   88,   88,
			   88,   88,   88,   88,   86,   87,   88,   60,   60,   88,
			   88,   88,   88,   91,   92,   89,  279,   89,   93,   91,
			   92,   91,   92,  129,   93,  273,   93,   91,   92,   60,
			   60,  270,   93,   88,   88,   88,  111,   94,   90,   90,
			   95,  129,  266,   88,   91,   92,   96,   91,   92,   93,
			   91,   92,   93,   91,   92,   93,   97,  251,   93,   91, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   92,  100,   91,   92,   93,  130,   99,   93,  131,  131,
			   91,   92,  101,  102,  250,   93,   91,   92,   97,   91,
			   92,   93,  103,  100,   93,   91,   92,  130,  104,  105,
			   93,   91,   92,  248,   91,   92,   93,  137,  107,   93,
			  104,   91,   92,  106,   91,   92,   93,  117,  115,   93,
			  116,   91,   92,  246,   91,   92,   93,   91,   92,   93,
			  132,   60,   93,  234,  119,  121,  138,  120,  233,  150,
			   91,   92,  232,  116,  122,   93,  219,   91,   92,   91,
			   92,  123,   93,  150,   93,  218,  124,  121,   91,   92,
			   91,   92,  122,   93,  125,   93,  204,   60,   92,   91,

			   92,  127,   93,  123,   93,   91,   92,  202,  126,  184,
			   93,   91,   92,  183,   91,   92,   93,   91,   92,   93,
			   60,   60,   93,  127,  182,  134,   91,   92,  169,  135,
			  140,   93,  165,  136,  118,   91,   92,  134,  139,  141,
			   93,   91,   92,   91,   92,  149,   93,  136,   93,  166,
			   91,   92,   91,   92,  142,   93,  148,   93,  128,   91,
			   92,   60,  185,  143,   93,  144,  111,  166,  131,  131,
			  146,   60,   60,   91,   92,  145,  147,  143,   93,  144,
			   60,   60,  167,   60,   60,  118,  153,  145,   91,   92,
			   91,   92,  114,   93,  147,   93,   91,   92,   89,  155, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  167,   93,   91,   92,   87,  156,   84,   93,   91,   92,
			  154,   83,   60,   93,   91,   92,   91,   92,   80,   93,
			  200,   93,   91,   92,  154,  201,  157,   93,  108,  158,
			   98,  159,  220,  160,   58,   91,   92,   84,  200,  161,
			   93,   91,   92,  201,  162,   84,   93,   91,   92,  159,
			  220,  160,   93,   91,   92,   80,  164,  161,   93,   91,
			   92,  163,   91,   92,   93,   91,   92,   93,   91,   92,
			   93,   91,   92,   93,  178,  170,   93,   91,   92,  171,
			   91,   92,   93,   91,   92,   93,  172,   80,   93,  170,
			   91,   92,  173,  235,  236,   93,  189,   79,  174,   60,

			   60,  175,   91,   92,  176,   91,   92,   93,   91,   92,
			   93,  177,   78,   93,   91,   92,   68,  179,   59,   93,
			  180,   58,   91,   92,   91,   92,  181,   93,  283,   93,
			   91,   92,  192,  193,  192,   93,   53,  187,  235,  236,
			  188,  190,   91,   92,   91,   92,   49,   93,   45,   93,
			  283,  191,   91,   92,  283,   91,   92,   93,  283,  190,
			   93,  194,   91,   92,   91,   92,  283,   93,  283,   93,
			  258,  258,   91,   92,  196,  197,  195,   93,  283,  194,
			   60,   60,  283,   60,   60,   91,   92,   91,   92,  199,
			   93,  198,   93,  283,   91,   92,   91,   92,  283,   93, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  283,   93,  205,  264,  264,  206,  207,  199,   91,   92,
			   91,   92,   60,   93,  283,   93,  208,  192,  193,  192,
			  205,  209,   91,   92,   91,   92,  283,   93,  207,   93,
			  210,  213,  214,  213,  215,  216,  215,  265,  283,  211,
			  283,   91,   92,  283,   91,   92,   93,  283,  212,   93,
			   91,   92,  283,   91,   92,   93,  283,  211,   93,   91,
			   92,  283,   91,   92,   93,  283,  224,   93,  283,   91,
			   92,  267,  267,  217,   93,  226,  226,  226,  217,  223,
			  268,  269,   91,   92,  283,   91,   92,   93,  225,  283,
			   93,   91,   92,  229,  230,  229,   93,  213,  214,  213,

			  283,  227,  283,   91,   92,  215,  216,  215,   93,   91,
			   92,  228,   91,   92,   93,   91,   92,   93,   91,   92,
			   93,  283,  231,   93,  226,  226,  226,  239,  241,  242,
			  241,  238,   91,   92,  229,  230,  229,   93,   91,   92,
			  283,  240,  283,   93,  244,  245,  244,   91,   92,  239,
			  283,  243,   93,  283,   91,   92,  233,  247,  233,   93,
			   91,   92,  252,  253,  252,   93,  241,  242,  241,  254,
			  255,  254,   91,   92,  244,  245,  244,   93,  283,   91,
			   92,  246,  256,  246,   93,  248,  257,  248,  252,  253,
			  252,  254,  255,  254,  260,  283,  261,  262,  283,  258, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  258,  264,  264,  264,  264,  260,  283,  261,  271,  283,
			  267,  267,  274,  274,  275,  275,  268,  269,  276,  276,
			  274,  274,  260,  283,  261,  280,  280,  275,  275,  260,
			  283,  277,  278,  283,  276,  276,  260,  283,  277,  281,
			  283,  280,  280,  282,  282,  260,  283,  277,  152,  152,
			  282,  282,   44,   44,   44,   44,   44,   48,   48,   48,
			   48,   48,   50,   50,   50,   50,   50,   54,   54,   54,
			   54,   54,   60,   60,   60,   63,   63,   63,   77,   77,
			   77,   77,   81,   81,   81,   81,   81,   85,   85,   85,
			   85,   85,   59,   59,   59,   59,   59,   88,   88,   88,

			   88,   88,  112,  112,  112,  113,  113,  113,  151,  151,
			  151,  168,  168,  168,  186,  186,  203,  203,  203,  221,
			  221,  221,  237,  237,  249,  249,  249,  263,  263,  272,
			  272,    9, yy_Dummy>>,
			1, 132, 800)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 981)
			an_array.put (0, 0)
			an_array.area.fill_with (1, 1, 50)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			yy_chk_template_3 (an_array)
			yy_chk_template_4 (an_array)
			yy_chk_template_5 (an_array)
			an_array.area.fill_with (283, 931, 981)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    2,    4,    2,    2,    6,    6,    8,    8,    2,    2,
			   11,    2,   11,   23,    2,   23,   23,   28,   28,    4,
			   29,   29,    4,  307,    2,    2,    2,   30,   30,   28,
			   31,   31,   32,   32,   37,   37,   79,   38,   38,   39,
			   39,   40,   40,   31,    4,   79,   37,   30,   57,   32,
			   57,   28,   39,   37,   41,   41,   37,   38,   42,   42,
			   40,   43,   43,   41,   51,   51,  304,   32,   37,  297,
			   37,   55,   55,   61,   61,  279,   62,   42,   62,   62,
			   82,   82,   43,   59,   59,   59,   59,   59,   59,   59,
			   59,   59,   59,   86,   86,   59,   91,   91,   59,   59,

			   59,   59,   63,   63,   89,  277,   89,   63,   64,   64,
			   65,   65,  109,   64,  269,   65,   66,   66,   92,   92,
			  266,   66,   59,   59,   59,   90,   64,   90,   90,   65,
			  109,  261,   59,   67,   67,   66,   69,   69,   67,   70,
			   70,   69,   71,   71,   70,   67,  237,   71,   72,   72,
			   70,   73,   73,   72,  110,   69,   73,  111,  111,   74,
			   74,   71,   72,  236,   74,   94,   94,   67,   75,   75,
			   94,   72,   70,   75,   76,   76,  110,   73,   74,   76,
			   95,   95,  234,   96,   96,   95,  118,   76,   96,   73,
			   97,   97,   75,   99,   99,   97,   96,   94,   99,   95, yy_Dummy>>,
			1, 200, 51)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  100,  100,  232,  101,  101,  100,  102,  102,  101,  112,
			  112,  102,  220,   99,  101,  118,  100,  219,  130,  103,
			  103,  218,  101,  102,  103,  201,  104,  104,  105,  105,
			  103,  104,  130,  105,  200,  104,  101,  106,  106,  107,
			  107,  102,  106,  105,  107,  186,  113,  113,  115,  115,
			  107,  113,  103,  115,  116,  116,  184,  106,  167,  116,
			  117,  117,  166,  119,  119,  117,  120,  120,  119,  151,
			  151,  120,  107,  165,  115,  121,  121,  152,  116,  120,
			  121,  148,  117,  137,  122,  122,  115,  119,  121,  122,
			  123,  123,  124,  124,  129,  123,  117,  124,  149,  125,

			  125,  126,  126,  122,  125,  128,  126,  108,  127,  127,
			  168,  168,  123,  127,  124,  131,  149,  131,  131,  126,
			  203,  203,  134,  134,  125,  127,  123,  134,  124,  132,
			  132,  150,  132,  132,   98,  134,  125,  135,  135,  136,
			  136,   93,  135,  127,  136,  139,  139,   88,  136,  150,
			  139,  140,  140,   85,  139,   84,  140,  141,  141,  135,
			   81,  132,  141,  142,  142,  143,  143,   80,  142,  182,
			  143,  144,  144,  135,  183,  140,  144,   78,  141,   68,
			  142,  202,  143,   58,  145,  145,   56,  182,  144,  145,
			  146,  146,  183,  145,   53,  146,  147,  147,  142,  202, yy_Dummy>>,
			1, 200, 251)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  143,  147,  153,  153,   52,  147,  144,  153,  154,  154,
			  146,  155,  155,  154,  161,  161,  155,  156,  156,  161,
			  157,  157,  156,  161,  153,  157,  158,  158,  154,  159,
			  159,  158,  172,  172,  159,  155,   49,  172,  153,  160,
			  160,  156,  221,  221,  160,  172,   47,  157,  235,  235,
			  158,  162,  162,  159,  163,  163,  162,  164,  164,  163,
			  160,   46,  164,  170,  170,   33,  162,   20,  170,  163,
			   12,  171,  171,  173,  173,  164,  171,    9,  173,  174,
			  174,  175,  175,  175,  174,    7,  170,  249,  249,  171,
			  173,  175,  175,  176,  176,    5,  175,    3,  176,    0,

			  174,  177,  177,    0,  178,  178,  177,    0,  173,  178,
			  176,  179,  179,  180,  180,    0,  179,    0,  180,  250,
			  250,  181,  181,  178,  179,  177,  181,    0,  176,  185,
			  185,    0,  185,  185,  187,  187,  188,  188,  181,  187,
			  180,  188,    0,  189,  189,  190,  190,    0,  189,    0,
			  190,  187,  260,  260,  188,  189,  181,  191,  191,  194,
			  194,  185,  191,    0,  194,  190,  192,  192,  192,  187,
			  191,  195,  195,  196,  196,    0,  195,  189,  196,  194,
			  197,  197,  197,  198,  198,  198,  260,    0,  195,    0,
			  197,  197,    0,  198,  198,  197,    0,  196,  198,  199, yy_Dummy>>,
			1, 200, 451)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  199,    0,  206,  206,  199,    0,  195,  206,  205,  205,
			    0,  207,  207,  205,    0,  206,  207,    0,  208,  208,
			  262,  262,  199,  208,  209,  209,  209,  199,  205,  263,
			  263,  210,  210,    0,  209,  209,  210,  208,    0,  209,
			  211,  211,  212,  212,  212,  211,  213,  213,  213,    0,
			  210,    0,  212,  212,  215,  215,  215,  212,  217,  217,
			  211,  223,  223,  217,  224,  224,  223,  225,  225,  224,
			    0,  217,  225,  226,  226,  226,  224,  227,  227,  227,
			  223,  228,  228,  229,  229,  229,  228,  227,  227,    0,
			  225,    0,  227,  231,  231,  231,  238,  238,  224,    0,

			  228,  238,    0,  231,  231,  233,  233,  233,  231,  239,
			  239,  240,  240,  240,  239,  241,  241,  241,  243,  243,
			  243,  240,  240,  244,  244,  244,  240,    0,  243,  243,
			  246,  246,  246,  243,  248,  248,  248,  252,  252,  252,
			  254,  254,  254,  258,    0,  258,  258,    0,  258,  258,
			  264,  264,  265,  265,  267,    0,  267,  267,    0,  267,
			  267,  270,  270,  271,  271,  272,  272,  273,  273,  274,
			  274,  275,    0,  275,  278,  278,  275,  275,  276,    0,
			  276,  276,    0,  276,  276,  280,    0,  280,  280,    0,
			  280,  280,  281,  281,  282,    0,  282,  299,  299,  282, yy_Dummy>>,
			1, 200, 651)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  282,  284,  284,  284,  284,  284,  285,  285,  285,  285,
			  285,  286,  286,  286,  286,  286,  287,  287,  287,  287,
			  287,  288,  288,  288,  289,  289,  289,  290,  290,  290,
			  290,  291,  291,  291,  291,  291,  292,  292,  292,  292,
			  292,  293,  293,  293,  293,  293,  294,  294,  294,  294,
			  294,  295,  295,  295,  296,  296,  296,  298,  298,  298,
			  300,  300,  300,  301,  301,  302,  302,  302,  303,  303,
			  303,  305,  305,  306,  306,  306,  308,  308,  309,  309, yy_Dummy>>,
			1, 80, 851)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 309)
			yy_base_template_1 (an_array)
			yy_base_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_base_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,   31,  546,   50,  544,   54,  534,   56,  528,
			  931,   60,  519,  931,  931,  931,  931,  931,  931,  931,
			  507,    0,  931,   52,  931,  931,  931,  931,   57,   60,
			   67,   70,   72,  470,  931,  931,    0,   74,   77,   79,
			   81,   94,   98,  101,    0,  931,  482,  473,  931,  485,
			  931,  114,  453,  443,  931,  121,  435,   98,  432,  133,
			    0,  110,  115,  142,  148,  150,  156,  173,  385,  176,
			  179,  182,  188,  191,  199,  208,  214,    0,  398,   62,
			  416,  409,  130,  931,  404,  402,  143,  931,  396,  154,
			  164,  136,  158,  376,  205,  220,  223,  230,  370,  233,

			  240,  243,  246,  259,  266,  268,  277,  279,  327,  135,
			  183,  194,  249,  286,    0,  288,  294,  300,  225,  303,
			  306,  315,  324,  330,  332,  339,  341,  348,  321,  315,
			  236,  354,  369,    0,  362,  377,  379,  319,  931,  385,
			  391,  397,  403,  405,  411,  424,  430,  436,  312,  321,
			  354,  309,  317,  442,  448,  451,  457,  460,  466,  469,
			  479,  454,  491,  494,  497,  289,  278,  277,  350,    0,
			  503,  511,  472,  513,  519,  531,  533,  541,  544,  551,
			  553,  561,  392,  397,  272,  569,  285,  574,  576,  583,
			  585,  597,  616,  931,  599,  611,  613,  630,  633,  639, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  254,  245,  404,  360,    0,  648,  642,  651,  658,  674,
			  671,  680,  692,  696,  931,  704,  931,  698,  242,  238,
			  232,  482,    0,  701,  704,  707,  723,  727,  721,  733,
			  931,  743,  219,  755,  203,  488,  165,  185,  736,  749,
			  761,  765,  931,  768,  773,  931,  780,  931,  784,  527,
			  556,    0,  787,  931,  790,  931,  931,  931,  785,    0,
			  589,  135,  657,  669,  787,  789,  127,  796,    0,  116,
			  798,  800,  805,  804,  806,  813,  820,  109,  811,   82,
			  827,  829,  836,  931,  851,  856,  861,  866,  870,  873,
			  876,  881,  886,  891,  896,  900,  903,  116,  906,  845,

			  909,  911,  914,  917,  113,  919,  922,   70,  924,  926, yy_Dummy>>,
			1, 110, 200)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 309)
			yy_def_template_1 (an_array)
			yy_def_template_2 (an_array)
			an_array.area.fill_with (283, 284, 309)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			    0,  283,    1,  284,  284,  285,  286,  285,  287,  283,
			  283,  283,  283,  283,  283,  283,  283,  283,  283,  283,
			  288,  288,  283,  288,  283,  283,  283,  283,  289,  289,
			  289,  289,  289,  283,  283,  283,  288,  289,  289,  289,
			  289,  289,  289,  289,  290,  283,  290,  290,  283,  283,
			  283,  291,  283,  283,  283,  292,  283,  283,  283,  293,
			  288,  288,  288,  289,  289,  289,  289,  289,  283,  289,
			  289,  289,  289,  289,  289,  289,  289,  290,  290,  290,
			  283,  291,  291,  283,  283,  292,  292,  283,  294,  283,
			  288,  295,  296,  283,  289,  289,  289,  289,  283,  289,

			  289,  289,  289,  289,  289,  289,  289,  289,  290,  290,
			  290,  288,  295,  296,  297,  289,  289,  289,  283,  289,
			  289,  289,  289,  289,  289,  289,  289,  289,  290,  290,
			  290,  288,  298,  299,  289,  289,  289,  283,  283,  289,
			  289,  289,  289,  289,  289,  289,  289,  289,  290,  290,
			  290,  300,  299,  289,  289,  289,  289,  289,  289,  289,
			  289,  289,  289,  289,  289,  290,  290,  290,  300,  301,
			  289,  289,  289,  289,  289,  289,  289,  289,  289,  289,
			  289,  289,  290,  290,  290,  302,  301,  289,  289,  289,
			  289,  289,  283,  283,  289,  289,  289,  289,  289,  289, yy_Dummy>>,
			1, 200, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  290,  290,  290,  303,  304,  289,  289,  289,  289,  289,
			  289,  289,  289,  283,  283,  283,  283,  289,  290,  290,
			  290,  303,  305,  289,  289,  289,  283,  289,  289,  283,
			  283,  289,  290,  290,  290,  306,  288,  305,  289,  289,
			  289,  283,  283,  289,  283,  283,  290,  283,  290,  306,
			  288,  307,  283,  283,  283,  283,  283,  283,  288,  308,
			  283,  288,  288,  308,  283,  283,  288,  288,  309,  283,
			  288,  288,  309,  283,  288,  288,  283,  283,  283,  283,
			  283,  283,  283,    0, yy_Dummy>>,
			1, 84, 200)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 257)
			yy_ec_template_1 (an_array)
			an_array.area.fill_with (50, 123, 257)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    0,   50,   50,   50,   50,   50,   50,   50,   50,    1,
			    2,   50,   50,    3,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,    1,    4,   50,   50,    5,   50,   50,   50,
			    6,    7,    8,    9,   10,   11,   12,   13,   14,   15,
			   14,   14,   14,   14,   14,   14,   14,   14,   16,   17,
			   50,   18,   50,   19,   50,   20,   21,   22,   23,   24,
			   25,   26,   27,   28,   21,   21,   29,   21,   30,   31,
			   32,   21,   33,   34,   35,   36,   37,   21,   21,   38,
			   39,   40,   50,   41,   42,   43,   50,   20,   21,   44,

			   45,   24,   25,   26,   27,   46,   21,   21,   29,   21,
			   30,   31,   32,   21,   47,   34,   35,   48,   49,   21,
			   21,   38,   39, yy_Dummy>>,
			1, 123, 0)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    5,    1,    5,    5,    5,    5,    5,    5,    5,
			    5,    2,    2,    5,    3,    3,    5,    5,    5,    5,
			    4,    4,    4,    4,    4,    4,    4,    4,    4,    4,
			    4,    4,    4,    4,    4,    4,    4,    4,    4,    4,
			    5,    5,    5,    3,    4,    4,    4,    4,    4,    4,
			    5, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 283)
			yy_accept_template_1 (an_array)
			yy_accept_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_accept_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   53,
			   51,    1,    2,   15,   18,   16,   17,    7,    6,   13,
			    5,   11,    8,   50,   14,   12,   10,   19,   50,   50,
			   50,   50,   50,   20,   21,    9,   50,   50,   50,   50,
			   50,   50,   50,   50,   39,   38,   39,   39,   52,   41,
			   42,   52,   41,   44,   45,   52,   44,    1,    2,    3,
			   50,   50,   50,   49,   49,   49,   49,   49,    0,   49,
			   49,   49,   49,   49,   49,   49,   49,   39,   39,   39,
			   41,    0,    0,   40,   44,    0,    0,   43,    3,    4,
			   46,   50,   50,    0,   49,   49,   49,   26,    0,   49,

			   49,   49,   49,   49,   49,   49,   49,   49,   39,   39,
			   39,   50,   50,   50,    0,   49,   49,   49,    0,   49,
			   49,   49,   49,   49,   49,   49,   49,   49,   39,   39,
			   39,   46,   50,    0,   49,   49,   49,    0,   47,   49,
			   49,   49,   49,   49,   49,   49,   49,   49,   39,   39,
			   39,   50,    0,   49,   49,   49,   49,   49,   49,   49,
			   49,   49,   49,   49,   49,   39,   39,   39,   50,    0,
			   49,   49,   49,   49,   49,   49,   49,   49,   49,   49,
			   49,   49,   39,   39,   39,   50,    0,   49,   49,   49,
			   49,   49,    0,   28,   49,   49,   49,   49,   49,   49, yy_Dummy>>,
			1, 200, 0)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			   39,   39,   39,   50,    0,   49,   49,   25,   49,   49,
			   49,   49,   49,    0,   29,    0,   33,   49,   39,   39,
			   39,   50,    0,   49,   49,   49,   22,   49,   49,    0,
			   32,   49,   39,   39,   39,   50,   50,    0,   23,   24,
			   49,    0,   31,   49,    0,   27,   39,   36,   39,   50,
			   50,    0,    0,   34,    0,   30,   37,   35,   48,    0,
			    0,   50,   50,    0,   48,    0,   50,   48,    0,    0,
			   50,   50,    0,    0,   48,   48,   48,    0,    0,    0,
			   48,    0,   48,    0, yy_Dummy>>,
			1, 84, 200)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 931
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 283
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 284
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 50
			-- Equivalence code for NULL character

	yyMax_symbol_equiv_class: INTEGER = 256
			-- All symbols greater than this symbol will have
			-- the same equivalence class as this symbol

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

	yyNb_rules: INTEGER = 52
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 53
			-- End of buffer rule code

	yyLine_used: BOOLEAN = false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN = false
			-- Is `position' used?

	INITIAL: INTEGER = 0
	IN_ODIN_SECTION: INTEGER = 1
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
			create str_.make_empty
			create a_text.make_empty
			create last_string_value.make_empty
		end

feature -- Initialization

	reset
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

	source_start_line: INTEGER
			-- offset of source in other document, else 0

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

	terminology_text_start_line: INTEGER

	annotations_text_start_line: INTEGER

feature {NONE} -- Constants

	Init_buffer_size: INTEGER = 8192
				-- Initial size for `in_buffer'

end
