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
if yy_act <= 26 then
if yy_act <= 13 then
if yy_act <= 7 then
if yy_act <= 4 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 53 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 53")
end
-- Ignore separators
else
--|#line 54 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 54")
end
in_lineno := in_lineno + text_count
end
else
if yy_act = 3 then
--|#line 59 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 59")
end
-- Ignore comments
else
--|#line 60 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 60")
end
in_lineno := in_lineno + 1
end
end
else
if yy_act <= 6 then
if yy_act = 5 then
--|#line 64 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 64")
end
last_token := Minus_code
else
--|#line 65 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 65")
end
last_token := Plus_code
end
else
--|#line 66 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 66")
end
last_token := Star_code
end
end
else
if yy_act <= 10 then
if yy_act <= 9 then
if yy_act = 8 then
--|#line 67 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 67")
end
last_token := Slash_code
else
--|#line 68 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 68")
end
last_token := Caret_code
end
else
--|#line 69 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 69")
end
last_token := Equal_code
end
else
if yy_act <= 12 then
if yy_act = 11 then
--|#line 70 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 70")
end
last_token := Dot_code
else
--|#line 71 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 71")
end
last_token := Semicolon_code
end
else
--|#line 72 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 72")
end
last_token := Comma_code
end
end
end
else
if yy_act <= 20 then
if yy_act <= 17 then
if yy_act <= 15 then
if yy_act = 14 then
--|#line 73 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 73")
end
last_token := Colon_code
else
--|#line 74 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 74")
end
last_token := Exclamation_code
end
else
if yy_act = 16 then
--|#line 75 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 75")
end
last_token := Left_parenthesis_code
else
--|#line 76 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 76")
end
last_token := Right_parenthesis_code
end
end
else
if yy_act <= 19 then
if yy_act = 18 then
--|#line 77 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 77")
end
last_token := Dollar_code
else
--|#line 78 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 78")
end
last_token := Question_mark_code
end
else
--|#line 80 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 80")
end
last_token := Left_bracket_code
end
end
else
if yy_act <= 23 then
if yy_act <= 22 then
if yy_act = 21 then
--|#line 81 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 81")
end
last_token := Right_bracket_code
else
--|#line 85 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 85")
end

				last_token := SYM_ARCHETYPE
			
end
else
--|#line 89 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 89")
end

				last_token := SYM_ADL_VERSION
			
end
else
if yy_act <= 25 then
if yy_act = 24 then
--|#line 93 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 93")
end

				last_token := SYM_IS_CONTROLLED
			
else
--|#line 97 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 97")
end

				last_token := SYM_IS_GENERATED
			
end
else
--|#line 101 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 101")
end

				last_token := SYM_UID
			
end
end
end
end
else
if yy_act <= 39 then
if yy_act <= 33 then
if yy_act <= 30 then
if yy_act <= 28 then
if yy_act = 27 then
--|#line 105 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 105")
end

				last_token := SYM_SPECIALIZE
				in_lineno := in_lineno + 1
			
else
--|#line 111 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 111")
end

				last_token := SYM_CONCEPT
				in_lineno := in_lineno + 1
			
end
else
if yy_act = 29 then
--|#line 116 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 116")
end

				last_token := SYM_LANGUAGE
				set_start_condition(IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				language_text_start_line := in_lineno
			
else
--|#line 123 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 123")
end

				last_token := SYM_DESCRIPTION
				set_start_condition(IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				description_text_start_line := in_lineno
			
end
end
else
if yy_act <= 32 then
if yy_act = 31 then
--|#line 130 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 130")
end

				last_token := SYM_DEFINITION
				set_start_condition(IN_CADL_SECTION)
				in_lineno := in_lineno + 1
				definition_text_start_line := in_lineno
			
else
--|#line 137 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 137")
end

				last_token := SYM_INVARIANT
				set_start_condition(IN_ASSERTION_SECTION)
				in_lineno := in_lineno + 1
				invariant_text_start_line := in_lineno
			
end
else
--|#line 144 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 144")
end

				last_token := SYM_ONTOLOGY
				set_start_condition(IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				terminology_text_start_line := in_lineno
			
end
end
else
if yy_act <= 36 then
if yy_act <= 35 then
if yy_act = 34 then
--|#line 151 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 151")
end

				last_token := SYM_ANNOTATIONS
				set_start_condition(IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				annotations_text_start_line := in_lineno
			
else
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
			
end
else
--|#line 160 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 160")
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
			
end
else
if yy_act <= 38 then
if yy_act = 37 then
--|#line 161 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 161")
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
			
else
--|#line 178 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 178")
end
 -- LF
				in_buffer.append_character('%N')
				in_lineno := in_lineno + 1
			
end
else
--|#line 182 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 182")
end
 -- any text on line with no LF
				in_buffer.append_string(text)
			
end
end
end
else
if yy_act <= 46 then
if yy_act <= 43 then
if yy_act <= 41 then
if yy_act = 40 then
--|#line 197 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 197")
end

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
else
--|#line 202 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 202")
end
in_lineno := in_lineno + text_count
end
else
if yy_act = 42 then
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
	
else
--|#line 216 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 216")
end
			-- match ^whitespace <anything> \n
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
end
end
else
if yy_act <= 45 then
if yy_act = 44 then
--|#line 221 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 221")
end
in_lineno := in_lineno + text_count
else
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
	
end
else
--|#line 235 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 235")
end

					last_token := V_DOTTED_NUMERIC
					last_string_value := text_substring (1, text_count)
			
end
end
else
if yy_act <= 49 then
if yy_act <= 48 then
if yy_act = 47 then
--|#line 241 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 241")
end

					last_token := V_CONCEPT_CODE
					last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 247 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 247")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
end
else
--|#line 253 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 253")
end

					last_token := V_IDENTIFIER
					last_string_value := text
			
end
else
if yy_act <= 51 then
if yy_act = 50 then
--|#line 259 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 259")
end

					last_token := V_VALUE
					last_string_value := text
			
else
--|#line 266 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 266")
end
-- ignore unmatched chars
end
else
--|#line 0 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 0")
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
			create an_array.make_filled (0, 0, 1103)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,   10,   11,   12,   11,   13,   14,   15,   16,   17,
			   18,   19,   20,   21,   22,   23,   23,   24,   25,   26,
			   27,   28,   29,   30,   29,   29,   29,   31,   29,   29,
			   29,   29,   29,   29,   29,   29,   29,   32,   29,   29,
			   29,   33,   34,   35,   36,   30,   29,   29,   29,   32,
			   29,   37,   45,   38,   39,   51,   52,   55,   56,   40,
			   41,   57,   42,   57,   61,   43,   62,   62,   60,   60,
			   46,   60,   60,   47,  265,   38,   39,   40,   60,   60,
			   64,   60,   60,   60,   60,   60,   60,  109,   60,   60,
			   60,   60,   60,   60,   66,   47,  110,   64,   65,   57,

			   67,   57,   64,   72,   69,   60,   60,   70,   71,   60,
			   60,   73,   60,   60,   74,   82,   83,  279,   67,   64,
			  273,   70,   86,   87,   90,   90,  270,   61,   75,   62,
			   62,   82,   83,   76,   88,   88,   89,   88,   88,   88,
			   88,   88,   88,   88,   88,   86,   87,   88,   60,   60,
			   88,   88,   88,   88,   91,   92,   89,  266,   89,   93,
			   91,   92,   91,   92,  129,   93,  251,   93,   91,   92,
			   60,   60,  130,   93,   88,   88,   88,  250,   94,   91,
			   92,   95,  129,  166,   93,   91,   92,   96,   91,   92,
			   93,   97,  248,   93,  130,   91,   92,   91,   92,  100,

			   93,  166,   93,  246,   99,   91,   92,   91,   92,  137,
			   93,  102,   93,   97,  101,  131,  131,   91,   92,  234,
			  103,  100,   93,   91,   92,  233,  105,  111,   93,   90,
			   90,  104,   91,   92,   91,   92,  107,   93,  138,   93,
			  167,  106,  150,  104,   91,   92,   91,   92,  200,   93,
			  232,   93,  219,  116,   91,   92,  150,  117,  167,   93,
			   91,   92,   91,   92,  115,   93,  200,   93,  132,   60,
			   91,   92,  201,  121,  119,   93,  120,   91,   92,   60,
			   60,  116,   93,  220,   91,   92,  218,  122,  123,   93,
			  201,   91,   92,  124,  204,  121,   93,   91,   92,   60,

			  185,  220,   93,   91,   92,  122,  125,  202,   93,  184,
			  123,   60,   92,  183,  127,  182,   93,  126,   91,   92,
			  169,   91,   92,   93,   91,   92,   93,   91,   92,   93,
			   91,   92,   93,   60,   60,   93,  127,   91,   92,  192,
			  193,  192,   93,  140,  134,  135,  136,   91,   92,  165,
			  141,  139,   93,   91,   92,  118,  134,  149,   93,  148,
			  136,  128,   91,   92,  235,  236,  142,   93,   91,   92,
			  213,  214,  213,   93,  118,  143,   91,   92,   91,   92,
			  114,   93,   89,   93,  144,  111,   87,  131,  131,  143,
			  215,  216,  215,  145,  146,  147,   60,   60,  144,   60,

			   60,   91,   92,   91,   92,  145,   93,   84,   93,   83,
			   91,   92,   80,  147,  153,   93,  108,   91,   92,  155,
			   60,   60,   93,  235,  236,  154,  156,   98,   60,   91,
			   92,   91,   92,   58,   93,   84,   93,   91,   92,  154,
			   91,   92,   93,   91,   92,   93,   91,   92,   93,  258,
			  258,   93,  158,  157,  159,  162,   84,  160,   91,   92,
			  161,   91,   92,   93,   91,   92,   93,  164,  260,   93,
			  261,  262,  159,  258,  258,  160,  267,  267,  161,   91,
			   92,  163,   91,   92,   93,   80,  170,   93,   91,   92,
			   91,   92,   80,   93,   79,   93,   91,   92,   78,  171,

			  170,   93,   91,   92,   91,   92,  172,   93,   68,   93,
			   91,   92,  173,   91,   92,   93,   59,  174,   93,  178,
			  175,   58,   91,   92,  283,  177,  176,   93,  179,   91,
			   92,   91,   92,   53,   93,   49,   93,  180,   91,   92,
			   91,   92,   45,   93,  283,   93,  283,  181,  268,  269,
			   91,   92,  283,  189,  187,   93,  188,   91,   92,  192,
			  193,  192,   93,   91,   92,  264,  264,  190,   93,   91,
			   92,   91,   92,  283,   93,  283,   93,  283,  191,  283,
			  194,   91,   92,   91,   92,  190,   93,  283,   93,   91,
			   92,  283,   91,   92,   93,  195,  197,   93,  194,  265,

			  196,   60,   60,  283,   60,   60,   91,   92,  283,  199,
			  283,   93,   91,   92,   91,   92,  198,   93,  283,   93,
			   91,   92,  283,  205,  283,   93,  207,  199,  264,  264,
			  206,   91,   92,   60,   91,   92,   93,  264,  264,   93,
			  208,  205,   91,   92,  209,   91,   92,   93,  207,  283,
			   93,  213,  214,  213,  210,   91,   92,  274,  274,  211,
			   93,   91,   92,  215,  216,  215,   93,   91,   92,  212,
			  275,  275,   93,   91,   92,  223,  283,  211,   93,   91,
			   92,   91,   92,  283,   93,  283,   93,  283,   91,   92,
			  217,  283,  224,   93,  283,  217,   91,   92,  226,  226,

			  226,   93,  226,  226,  226,   91,   92,  225,   91,   92,
			   93,  268,  269,   93,  283,  227,  229,  230,  229,   91,
			   92,  229,  230,  229,   93,  228,   91,   92,   91,   92,
			  283,   93,  231,   93,   91,   92,   91,   92,  283,   93,
			  283,   93,  241,  242,  241,  283,  239,  238,  276,  276,
			   91,   92,   91,   92,  283,   93,  283,   93,  283,  240,
			  244,  245,  244,  233,  247,  233,  274,  274,  239,  243,
			   91,   92,   91,   92,  283,   93,  283,   93,   91,   92,
			  252,  253,  252,   93,  241,  242,  241,  254,  255,  254,
			   91,   92,  244,  245,  244,   93,  283,   91,   92,  246,

			  256,  246,   93,  248,  257,  248,  252,  253,  252,  254,
			  255,  254,  260,  283,  261,  271,  283,  267,  267,  260,
			  283,  261,  280,  280,  275,  275,  260,  283,  277,  278,
			  283,  276,  276,  260,  283,  277,  281,  283,  280,  280,
			  282,  282,  260,  283,  277,  283,  283,  282,  282,   44,
			   44,   44,   44,   44,   44,   44,   44,   44,   44,   48,
			   48,   48,   48,   48,   48,   48,   48,   48,   48,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   60,
			   60,   60,   60,   60,   60,   60,   60,   63,   63,   63,

			   63,   63,   63,   63,   63,   77,  283,   77,   77,   77,
			   77,   77,   77,   77,   77,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   59,   59,   59,   59,   59,
			   59,   59,   59,   59,   59,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,  112,  112,  112,  112,  112,
			  112,  112,  112,  113,  113,  113,  113,  113,  113,  113,
			  113,  133,  133,  133,  133,  151,  151,  151,  151,  151,
			  151,  151,  151,  152,  152,  152,  152,  152,  152,  168,
			  168,  168,  168,  168,  168,  168,  168,  186,  186,  186, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  186,  186,  186,  203,  203,  203,  203,  203,  203,  203,
			  203,  221,  221,  221,  221,  221,  221,  221,  221,  222,
			  222,  222,  222,  237,  237,  237,  237,  237,  237,  249,
			  249,  249,  249,  249,  249,  249,  249,  259,  259,  259,
			  259,  263,  263,  263,  263,  263,  263,  272,  272,  272,
			  272,  272,  272,    9,  283,  283,  283,  283,  283,  283,
			  283,  283,  283,  283,  283,  283,  283,  283,  283,  283,
			  283,  283,  283,  283,  283,  283,  283,  283,  283,  283,
			  283,  283,  283,  283,  283,  283,  283,  283,  283,  283,
			  283,  283,  283,  283,  283,  283,  283,  283,  283,  283,

			  283,  283,  283,  283, yy_Dummy>>,
			1, 104, 1000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1103)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    2,    4,    2,    2,    6,    6,    8,    8,    2,
			    2,   11,    2,   11,   23,    2,   23,   23,   28,   28,
			    4,   29,   29,    4,  279,    2,    2,    2,   30,   30,
			   28,   31,   31,   32,   32,   37,   37,   79,   38,   38,
			   39,   39,   40,   40,   31,    4,   79,   37,   30,   57,

			   32,   57,   28,   39,   37,   41,   41,   37,   38,   42,
			   42,   40,   43,   43,   41,   51,   51,  277,   32,   37,
			  269,   37,   55,   55,   61,   61,  266,   62,   42,   62,
			   62,   82,   82,   43,   59,   59,   59,   59,   59,   59,
			   59,   59,   59,   59,   59,   86,   86,   59,   91,   91,
			   59,   59,   59,   59,   63,   63,   89,  261,   89,   63,
			   64,   64,   65,   65,  109,   64,  237,   65,   66,   66,
			   92,   92,  110,   66,   59,   59,   59,  236,   64,   67,
			   67,   65,  109,  149,   67,   69,   69,   66,   70,   70,
			   69,   67,  234,   70,  110,   71,   71,   72,   72,   70,

			   71,  149,   72,  232,   69,   73,   73,   74,   74,  118,
			   73,   72,   74,   67,   71,  111,  111,   75,   75,  220,
			   72,   70,   75,   76,   76,  219,   74,   90,   76,   90,
			   90,   73,   94,   94,   95,   95,   76,   94,  118,   95,
			  150,   75,  130,   73,   96,   96,   97,   97,  182,   96,
			  218,   97,  201,   95,   99,   99,  130,   96,  150,   99,
			  100,  100,  101,  101,   94,  100,  182,  101,  112,  112,
			  102,  102,  183,  101,   99,  102,  100,  103,  103,  151,
			  151,  101,  103,  202,  104,  104,  200,  102,  103,  104,
			  183,  105,  105,  104,  186,  101,  105,  106,  106,  168,

			  168,  202,  106,  107,  107,  102,  105,  184,  107,  167,
			  103,  113,  113,  166,  107,  165,  113,  106,  115,  115,
			  152,  116,  116,  115,  117,  117,  116,  119,  119,  117,
			  120,  120,  119,  203,  203,  120,  107,  121,  121,  192,
			  192,  192,  121,  120,  115,  116,  117,  122,  122,  148,
			  121,  119,  122,  123,  123,  137,  115,  129,  123,  128,
			  117,  108,  124,  124,  221,  221,  122,  124,  125,  125,
			  213,  213,  213,  125,   98,  123,  126,  126,  127,  127,
			   93,  126,   88,  127,  124,  131,   85,  131,  131,  123,
			  215,  215,  215,  125,  126,  127,  132,  132,  124,  132,

			  132,  134,  134,  135,  135,  125,  134,   84,  135,   81,
			  136,  136,   80,  127,  134,  136,   78,  139,  139,  136,
			  235,  235,  139,  249,  249,  135,  139,   68,  132,  140,
			  140,  141,  141,   58,  140,   56,  141,  142,  142,  135,
			  143,  143,  142,  144,  144,  143,  145,  145,  144,  250,
			  250,  145,  141,  140,  142,  145,   53,  143,  147,  147,
			  144,  146,  146,  147,  153,  153,  146,  147,  258,  153,
			  258,  258,  142,  258,  258,  143,  262,  262,  144,  154,
			  154,  146,  155,  155,  154,   52,  153,  155,  156,  156,
			  157,  157,   49,  156,   47,  157,  158,  158,   46,  154,

			  153,  158,  159,  159,  160,  160,  155,  159,   33,  160,
			  161,  161,  156,  162,  162,  161,   20,  157,  162,  161,
			  158,   12,  163,  163,    9,  160,  159,  163,  162,  164,
			  164,  170,  170,    7,  164,    5,  170,  163,  171,  171,
			  172,  172,    3,  171,    0,  172,    0,  164,  263,  263,
			  173,  173,    0,  172,  170,  173,  171,  174,  174,  175,
			  175,  175,  174,  176,  176,  260,  260,  173,  176,  175,
			  175,  177,  177,    0,  175,    0,  177,    0,  174,    0,
			  176,  178,  178,  179,  179,  173,  178,    0,  179,  180,
			  180,    0,  181,  181,  180,  177,  179,  181,  176,  260,

			  178,  185,  185,    0,  185,  185,  187,  187,    0,  181,
			    0,  187,  188,  188,  189,  189,  180,  188,    0,  189,
			  190,  190,    0,  187,    0,  190,  189,  181,  264,  264,
			  188,  191,  191,  185,  194,  194,  191,  265,  265,  194,
			  190,  187,  195,  195,  191,  196,  196,  195,  189,    0,
			  196,  197,  197,  197,  194,  205,  205,  270,  270,  195,
			  205,  197,  197,  198,  198,  198,  197,  199,  199,  196,
			  271,  271,  199,  198,  198,  205,    0,  195,  198,  206,
			  206,  207,  207,    0,  206,    0,  207,    0,  208,  208,
			  199,    0,  206,  208,    0,  199,  210,  210,  209,  209,

			  209,  210,  226,  226,  226,  211,  211,  208,  209,  209,
			  211,  272,  272,  209,    0,  210,  212,  212,  212,  217,
			  217,  229,  229,  229,  217,  211,  212,  212,  223,  223,
			    0,  212,  217,  223,  224,  224,  225,  225,    0,  224,
			    0,  225,  227,  227,  227,    0,  224,  223,  273,  273,
			  228,  228,  227,  227,    0,  228,    0,  227,    0,  225,
			  231,  231,  231,  233,  233,  233,  274,  274,  224,  228,
			  231,  231,  238,  238,    0,  231,    0,  238,  239,  239,
			  240,  240,  240,  239,  241,  241,  241,  243,  243,  243,
			  240,  240,  244,  244,  244,  240,    0,  243,  243,  246,

			  246,  246,  243,  248,  248,  248,  252,  252,  252,  254,
			  254,  254,  267,    0,  267,  267,    0,  267,  267,  275,
			    0,  275,  278,  278,  275,  275,  276,    0,  276,  276,
			    0,  276,  276,  280,    0,  280,  280,    0,  280,  280,
			  281,  281,  282,    0,  282,    0,    0,  282,  282,  284,
			  284,  284,  284,  284,  284,  284,  284,  284,  284,  285,
			  285,  285,  285,  285,  285,  285,  285,  285,  285,  286,
			  286,  286,  286,  286,  286,  286,  286,  286,  286,  287,
			  287,  287,  287,  287,  287,  287,  287,  287,  287,  288,
			  288,  288,  288,  288,  288,  288,  288,  289,  289,  289,

			  289,  289,  289,  289,  289,  290,    0,  290,  290,  290,
			  290,  290,  290,  290,  290,  291,  291,  291,  291,  291,
			  291,  291,  291,  291,  291,  292,  292,  292,  292,  292,
			  292,  292,  292,  292,  292,  293,  293,  293,  293,  293,
			  293,  293,  293,  293,  293,  294,  294,  294,  294,  294,
			  294,  294,  294,  294,  294,  295,  295,  295,  295,  295,
			  295,  295,  295,  296,  296,  296,  296,  296,  296,  296,
			  296,  297,  297,  297,  297,  298,  298,  298,  298,  298,
			  298,  298,  298,  299,  299,  299,  299,  299,  299,  300,
			  300,  300,  300,  300,  300,  300,  300,  301,  301,  301, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  301,  301,  301,  302,  302,  302,  302,  302,  302,  302,
			  302,  303,  303,  303,  303,  303,  303,  303,  303,  304,
			  304,  304,  304,  305,  305,  305,  305,  305,  305,  306,
			  306,  306,  306,  306,  306,  306,  306,  307,  307,  307,
			  307,  308,  308,  308,  308,  308,  308,  309,  309,  309,
			  309,  309,  309,  283,  283,  283,  283,  283,  283,  283,
			  283,  283,  283,  283,  283,  283,  283,  283,  283,  283,
			  283,  283,  283,  283,  283,  283,  283,  283,  283,  283,
			  283,  283,  283,  283,  283,  283,  283,  283,  283,  283,
			  283,  283,  283,  283,  283,  283,  283,  283,  283,  283,

			  283,  283,  283,  283, yy_Dummy>>,
			1, 104, 1000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,   30,  539,   49,  532,   53,  530,   55,  524,
			 1053,   59,  518, 1053, 1053, 1053, 1053, 1053, 1053, 1053,
			  504,    0, 1053,   51, 1053, 1053, 1053, 1053,   56,   59,
			   66,   69,   71,  461, 1053, 1053,    0,   73,   76,   78,
			   80,   93,   97,  100,    0, 1053,  467,  469, 1053,  489,
			 1053,  113,  482,  453, 1053,  120,  432,   97,  430,  133,
			    0,  109,  114,  142,  148,  150,  156,  167,  381,  173,
			  176,  183,  185,  193,  195,  205,  211,    0,  385,   61,
			  409,  406,  129, 1053,  404,  383,  143, 1053,  379,  154,
			  214,  136,  158,  363,  220,  222,  232,  234,  358,  242,

			  248,  250,  258,  265,  272,  279,  285,  291,  329,  135,
			  149,  200,  256,  299,    0,  306,  309,  312,  196,  315,
			  318,  325,  335,  341,  350,  356,  364,  366,  323,  326,
			  208,  372,  384,    0,  389,  391,  398,  339, 1053,  405,
			  417,  419,  425,  428,  431,  434,  449,  446,  328,  154,
			  211,  267,  308,  452,  467,  470,  476,  478,  484,  490,
			  492,  498,  501,  510,  517,  279,  277,  276,  287,    0,
			  519,  526,  528,  538,  545,  557,  551,  559,  569,  571,
			  577,  580,  219,  243,  271,  589,  282,  594,  600,  602,
			  608,  619,  337, 1053,  622,  630,  633,  649,  661,  655,

			  254,  220,  254,  321,    0,  643,  667,  669,  676,  696,
			  684,  693,  714,  368, 1053,  388, 1053,  707,  219,  194,
			  187,  352,    0,  716,  722,  724,  700,  740,  738,  719,
			 1053,  758,  168,  761,  161,  408,  127,  153,  760,  766,
			  778,  782, 1053,  785,  790, 1053,  797, 1053,  801,  411,
			  434,    0,  804, 1053,  807, 1053, 1053, 1053,  458,    0,
			  550,  109,  461,  536,  613,  622,   81,  802,    0,   70,
			  642,  655,  699,  733,  751,  809,  816,   69,  807,   29,
			  823,  825,  832, 1053,  848,  858,  868,  878,  886,  894,
			  904,  914,  924,  934,  944,  952,  960,  964,  972,  978,

			  986,  992, 1000, 1008, 1012, 1018, 1026, 1030, 1036, 1042, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
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
			  289,  289,  283,  283,  289,  289,  289,  289,  289,  289,

			  290,  290,  290,  303,  304,  289,  289,  289,  289,  289,
			  289,  289,  289,  283,  283,  283,  283,  289,  290,  290,
			  290,  303,  305,  289,  289,  289,  283,  289,  289,  283,
			  283,  289,  290,  290,  290,  306,  288,  305,  289,  289,
			  289,  283,  283,  289,  283,  283,  290,  283,  290,  306,
			  288,  307,  283,  283,  283,  283,  283,  283,  288,  308,
			  283,  288,  288,  308,  283,  283,  288,  288,  309,  283,
			  288,  288,  309,  283,  288,  288,  283,  283,  283,  283,
			  283,  283,  283,    0,  283,  283,  283,  283,  283,  283,
			  283,  283,  283,  283,  283,  283,  283,  283,  283,  283,

			  283,  283,  283,  283,  283,  283,  283,  283,  283,  283, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    5,    1,    1,    6,    1,    1,    1,
			    7,    8,    9,   10,   11,   12,   13,   14,   15,   16,
			   15,   15,   15,   15,   15,   15,   15,   15,   17,   18,
			    1,   19,    1,   20,    1,   21,   22,   23,   24,   25,
			   26,   27,   28,   29,   22,   22,   30,   22,   31,   32,
			   33,   22,   34,   35,   36,   37,   38,   22,   22,   39,
			   40,   41,    1,   42,   43,   44,    1,   21,   22,   45,

			   46,   25,   26,   27,   28,   47,   22,   22,   30,   22,
			   31,   32,   33,   22,   48,   35,   36,   49,   50,   22,
			   22,   39,   40,    1,    1,    1,    1,    1,    1,    1,
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
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    2,    1,    1,    1,    1,    1,    1,
			    1,    1,    3,    4,    1,    5,    6,    1,    1,    1,
			    1,    7,    7,    8,    7,    9,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			   10,    1,    1,    1,    5,    7,    7,    7,    7,    7,
			    7, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		once
			Result := yy_fixed_array (<<
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
			   49,   49,    0,   28,   49,   49,   49,   49,   49,   49,

			   39,   39,   39,   50,    0,   49,   49,   25,   49,   49,
			   49,   49,   49,    0,   29,    0,   33,   49,   39,   39,
			   39,   50,    0,   49,   49,   49,   22,   49,   49,    0,
			   32,   49,   39,   39,   39,   50,   50,    0,   23,   24,
			   49,    0,   31,   49,    0,   27,   39,   36,   39,   50,
			   50,    0,    0,   34,    0,   30,   37,   35,   48,    0,
			    0,   50,   50,    0,   48,    0,   50,   48,    0,    0,
			   50,   50,    0,    0,   48,   48,   48,    0,    0,    0,
			   48,    0,   48,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 1053
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 283
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 284
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
