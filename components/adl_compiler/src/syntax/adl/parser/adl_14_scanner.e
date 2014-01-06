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
if yy_act <= 26 then
if yy_act <= 13 then
if yy_act <= 7 then
if yy_act <= 4 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 59 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 59")
end
-- Ignore separators
else
--|#line 60 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 60")
end
in_lineno := in_lineno + text_count
end
else
if yy_act = 3 then
--|#line 65 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 65")
end
-- Ignore comments
else
--|#line 66 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 66")
end
in_lineno := in_lineno + 1
end
end
else
if yy_act <= 6 then
if yy_act = 5 then
--|#line 70 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 70")
end
last_token := Minus_code
else
--|#line 71 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 71")
end
last_token := Plus_code
end
else
--|#line 72 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 72")
end
last_token := Star_code
end
end
else
if yy_act <= 10 then
if yy_act <= 9 then
if yy_act = 8 then
--|#line 73 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 73")
end
last_token := Slash_code
else
--|#line 74 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 74")
end
last_token := Caret_code
end
else
--|#line 75 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 75")
end
last_token := Equal_code
end
else
if yy_act <= 12 then
if yy_act = 11 then
--|#line 76 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 76")
end
last_token := Dot_code
else
--|#line 77 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 77")
end
last_token := Semicolon_code
end
else
--|#line 78 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 78")
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
--|#line 79 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 79")
end
last_token := Colon_code
else
--|#line 80 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 80")
end
last_token := Exclamation_code
end
else
if yy_act = 16 then
--|#line 81 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 81")
end
last_token := Left_parenthesis_code
else
--|#line 82 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 82")
end
last_token := Right_parenthesis_code
end
end
else
if yy_act <= 19 then
if yy_act = 18 then
--|#line 83 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 83")
end
last_token := Dollar_code
else
--|#line 84 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 84")
end
last_token := Question_mark_code
end
else
--|#line 86 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 86")
end
last_token := Left_bracket_code
end
end
else
if yy_act <= 23 then
if yy_act <= 22 then
if yy_act = 21 then
--|#line 87 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 87")
end
last_token := Right_bracket_code
else
--|#line 91 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 91")
end

				last_token := SYM_ARCHETYPE
			
end
else
--|#line 95 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 95")
end

				last_token := SYM_ADL_VERSION
			
end
else
if yy_act <= 25 then
if yy_act = 24 then
--|#line 99 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 99")
end

				last_token := SYM_IS_CONTROLLED
			
else
--|#line 103 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 103")
end

				last_token := SYM_IS_GENERATED
			
end
else
--|#line 107 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 107")
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
--|#line 111 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 111")
end

				last_token := SYM_SPECIALIZE
				in_lineno := in_lineno + 1
			
else
--|#line 117 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 117")
end

				last_token := SYM_CONCEPT
				in_lineno := in_lineno + 1
			
end
else
if yy_act = 29 then
--|#line 122 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 122")
end

				last_token := SYM_LANGUAGE
				set_start_condition(IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				language_text_start_line := in_lineno
			
else
--|#line 129 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 129")
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
--|#line 136 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 136")
end

				last_token := SYM_DEFINITION
				set_start_condition(IN_CADL_SECTION)
				in_lineno := in_lineno + 1
				definition_text_start_line := in_lineno
			
else
--|#line 143 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 143")
end

				last_token := SYM_INVARIANT
				set_start_condition(IN_ASSERTION_SECTION)
				in_lineno := in_lineno + 1
				invariant_text_start_line := in_lineno
			
end
else
--|#line 150 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 150")
end

				last_token := SYM_ONTOLOGY
				set_start_condition(IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				ontology_text_start_line := in_lineno
			
end
end
else
if yy_act <= 36 then
if yy_act <= 35 then
if yy_act = 34 then
--|#line 157 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 157")
end

				last_token := SYM_ANNOTATIONS
				set_start_condition(IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				annotations_text_start_line := in_lineno
			
else
--|#line 165 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 165")
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
--|#line 166 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 166")
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
--|#line 167 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 167")
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
--|#line 184 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 184")
end
 -- LF
				in_buffer.append_character('%N')
				in_lineno := in_lineno + 1
			
end
else
--|#line 188 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 188")
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
--|#line 203 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 203")
end

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
else
--|#line 208 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 208")
end
in_lineno := in_lineno + text_count
end
else
if yy_act = 42 then
--|#line 210 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 210")
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
--|#line 222 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 222")
end
			-- match ^whitespace <anything> \n
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
end
end
else
if yy_act <= 45 then
if yy_act = 44 then
--|#line 227 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 227")
end
in_lineno := in_lineno + text_count
else
--|#line 229 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 229")
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
--|#line 241 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 241")
end

					last_token := V_DOTTED_NUMERIC
					last_string_value := text_substring (1, text_count)
			
end
end
else
if yy_act <= 49 then
if yy_act <= 48 then
if yy_act = 47 then
--|#line 247 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 247")
end

					last_token := V_CONCEPT_CODE
					last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 253 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 253")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
end
else
--|#line 259 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 259")
end

					last_token := V_IDENTIFIER
					last_string_value := text
			
end
else
if yy_act <= 51 then
if yy_act = 50 then
--|#line 265 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 265")
end

					last_token := V_VALUE
					last_string_value := text
			
else
--|#line 272 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 272")
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
--|#line 0 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 0")
end
terminate
when 1 then
--|#line 0 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 0")
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
			create an_array.make_filled (0, 0, 1179)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,   10,   11,   12,   11,   13,   14,   15,   16,   17,
			   18,   19,   20,   21,   22,   23,   23,   23,   24,   25,
			   26,   27,   28,   29,   30,   29,   29,   29,   31,   29,
			   29,   29,   29,   29,   29,   29,   29,   29,   32,   29,
			   29,   29,   33,   34,   35,   36,   28,   30,   29,   29,
			   32,   29,   37,   45,   38,   39,   51,   52,   55,   56,
			   40,   41,   57,   42,   57,   61,   43,   62,   62,   62,
			   60,   60,   46,   60,   60,   47,   37,   38,   60,   60,
			   60,   60,  130,   64,   60,   60,  109,   60,   60,  147,
			   60,   60,   60,   60,   66,  110,   46,   60,   60,   65,

			   64,  147,   67,   60,   60,  130,   72,   69,   60,   60,
			   70,   71,  268,   74,   60,   60,  282,   73,   82,   83,
			   86,   87,   57,   70,   57,   90,   90,   90,   75,   61,
			  276,   62,   62,   62,   82,   83,   76,   74,   88,   88,
			   89,   88,   88,   88,   88,   88,   88,   88,   88,   86,
			   87,   88,  273,   91,   92,   88,   88,   88,   88,   93,
			   89,  269,   89,   91,   92,   91,   92,   91,   92,   93,
			  254,   93,  111,   93,   90,   90,   90,   91,   92,   88,
			   88,   88,   94,   93,  253,   95,  251,   96,   91,   92,
			   97,   91,   92,  249,   93,   91,   92,   93,   91,   92,

			  183,   93,  184,  100,   93,   91,   92,  165,   99,   60,
			   60,   93,  183,  102,  184,  101,  149,   91,   92,   60,
			   60,  237,  103,   93,   91,   92,  100,   91,   92,  149,
			   93,  165,  104,   93,   91,   92,  236,  105,  132,   60,
			   93,  107,   91,   92,  104,   91,   92,  235,   93,  106,
			  223,   93,   91,   92,   91,   92,   60,   60,   93,  117,
			   93,  106,  116,   91,   92,   91,   92,  115,  222,   93,
			  221,   93,   91,   92,  191,  119,  173,  121,   93,  207,
			  120,   91,   92,   60,  186,  116,  204,   93,   91,   92,
			  122,   91,   92,  123,   93,   60,   92,   93,  124,  203,

			  121,   93,   91,   92,  192,   91,   92,  125,   93,   91,
			   92,   93,  131,  131,  131,   93,  123,  127,   91,   92,
			  185,  205,  124,  126,   93,  173,   91,   92,   91,   92,
			   60,   60,   93,  205,   93,  169,  134,  167,   91,   92,
			  127,   91,   92,  135,   93,   91,   92,   93,  134,  136,
			  166,   93,  139,  138,  155,  135,  148,   91,   92,  140,
			  137,  141,  136,   93,  129,  138,   91,   92,   91,   92,
			  238,  239,   93,  128,   93,  118,   91,   92,   91,   92,
			  142,  114,   93,  111,   93,  131,  131,  131,   89,  143,
			   87,   91,   92,  142,  144,  145,  146,   93,   60,   60,

			   60,   60,  143,   60,   60,   60,  144,   91,   92,   91,
			   92,  238,  239,   93,  153,   93,   91,   92,   84,  154,
			   83,  152,   93,   91,   92,   80,  156,  153,  108,   93,
			   91,   92,   98,   60,  271,  272,   93,   58,   91,   92,
			   91,   92,   84,  154,   93,   84,   93,   80,  157,   80,
			  156,   79,  158,   91,   92,   78,  159,   68,  160,   93,
			  157,   59,   91,   92,   91,   92,  271,  272,   93,   58,
			   93,  161,  162,   91,   92,   91,   92,  286,   53,   93,
			   49,   93,   45,  164,  286,  163,  286,   91,   92,   91,
			   92,   91,   92,   93,  286,   93,  162,   93,  170,   91,

			   92,  195,  196,  195,  286,   93,  286,  164,  171,   91,
			   92,  170,   91,   92,  172,   93,  174,  286,   93,   91,
			   92,  286,  286,   91,   92,   93,  172,  175,  174,   93,
			   91,   92,  286,  179,  176,  286,   93,  177,   91,   92,
			  286,  178,   91,   92,   93,  286,  176,  286,   93,  177,
			   91,   92,  194,  286,  180,  286,   93,  179,  181,   91,
			   92,   91,   92,  286,  286,   93,  286,   93,  286,  182,
			   91,   92,   91,   92,  286,  286,   93,  286,   93,  286,
			  189,  286,  286,  188,  190,  195,  196,  195,   91,   92,
			  193,   91,   92,  286,   93,   91,   92,   93,   91,   92,

			  286,   93,  286,  286,   93,  286,  197,   91,   92,   91,
			   92,   91,   92,   93,  286,   93,  198,   93,  199,   60,
			   60,  200,   60,   60,   60,   91,   92,  286,  198,  202,
			  286,   93,   91,   92,   91,   92,  286,  201,   93,  286,
			   93,  286,  286,  208,   91,   92,  286,  210,   91,   92,
			   93,  209,   60,  286,   93,   91,   92,   91,   92,  286,
			  286,   93,  212,   93,  286,  211,   91,   92,  216,  217,
			  216,  286,   93,  286,  286,  214,  213,  286,   91,   92,
			  286,  286,   91,   92,   93,  218,  219,  218,   93,  286,
			  286,  215,   91,   92,  286,   91,   92,  286,   93,  286,

			  286,   93,  286,  215,   91,   92,  220,  286,   91,   92,
			   93,  220,  286,  226,   93,   91,   92,  286,  227,   91,
			   92,   93,  229,  229,  229,   93,  286,  286,   91,   92,
			   91,   92,   91,   92,   93,  228,   93,  286,   93,  230,
			  232,  233,  232,  216,  217,  216,  218,  219,  218,  231,
			   91,   92,   91,   92,   91,   92,   93,  286,   93,  286,
			   93,  286,   91,   92,   91,   92,  234,  286,   93,  286,
			   93,  229,  229,  229,  241,  242,  244,  245,  244,   91,
			   92,  232,  233,  232,  286,   93,   91,   92,  243,  236,
			  250,  236,   93,  247,  248,  247,   91,   92,  286,  246,

			  286,  286,   93,   91,   92,  255,  256,  255,  286,   93,
			  244,  245,  244,  286,  286,   91,   92,  257,  258,  257,
			  286,   93,  247,  248,  247,  286,  286,   91,   92,  249,
			  259,  249,  286,   93,  251,  260,  251,  261,  261,  261,
			  255,  256,  255,  257,  258,  257,  263,  286,  264,  265,
			  286,  261,  261,  261,  267,  267,  267,  270,  270,  270,
			  267,  267,  267,  267,  267,  267,  263,  286,  264,  274,
			  286,  270,  270,  270,  277,  277,  277,  278,  278,  278,
			  279,  279,  279,  277,  277,  277,  263,  286,  264,  268,
			  286,  278,  278,  278,  263,  286,  280,  281,  286,  279,

			  279,  279,  283,  283,  283,  263,  286,  280,  284,  286,
			  283,  283,  283,  285,  285,  285,  263,  286,  280,  286,
			  286,  285,  285,  285,   44,   44,   44,   44,   44,   44,
			   44,   44,   44,   44,   48,   48,   48,   48,   48,   48,
			   48,   48,   48,   48,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   60,   60,   60,   60,   60,   60,
			   60,   60,   63,   63,   63,   63,   63,   63,   63,   63,
			   77,  286,   77,   77,   77,   77,   77,   77,   77,   77,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   59,   59,   59,   59,   59,   59,   59,   59,   59,   59,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			  112,  112,  112,  112,  112,  112,  112,  112,  113,  113,
			  113,  113,  113,  113,  113,  113,  133,  133,  133,  133,
			  150,  150,  150,  150,  150,  150,  150,  150,  151,  151,
			  151,  151,  151,  151,  168,  168,  168,  168,  168,  168,
			  168,  168,  187,  187,  187,  187,  187,  187,  206,  206,
			  206,  206,  206,  206,  206,  206,  224,  224,  224,  224,
			  224,  224,  224,  224,  225,  225,  225,  225,  240,  240,

			  240,  240,  240,  240,  252,  252,  252,  252,  252,  252,
			  252,  252,  262,  262,  262,  262,  266,  266,  266,  266,
			  266,  266,  275,  275,  275,  275,  275,  275,    9,  286,
			  286,  286,  286,  286,  286,  286,  286,  286,  286,  286,
			  286,  286,  286,  286,  286,  286,  286,  286,  286,  286,
			  286,  286,  286,  286,  286,  286,  286,  286,  286,  286,
			  286,  286,  286,  286,  286,  286,  286,  286,  286,  286,
			  286,  286,  286,  286,  286,  286,  286,  286,  286,  286, yy_Dummy>>,
			1, 180, 1000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1179)
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
			    1,    1,    2,    4,    2,    2,    6,    6,    8,    8,
			    2,    2,   11,    2,   11,   23,    2,   23,   23,   23,
			   28,   28,    4,   29,   29,    4,    2,    2,   30,   30,
			   31,   31,  110,   28,   32,   32,   79,   37,   37,  128,
			   38,   38,   39,   39,   31,   79,    4,   40,   40,   30,

			   37,  128,   32,   41,   41,  110,   39,   37,   42,   42,
			   37,   38,  282,   41,   43,   43,  280,   40,   51,   51,
			   55,   55,   57,   37,   57,   61,   61,   61,   42,   62,
			  272,   62,   62,   62,   82,   82,   43,   41,   59,   59,
			   59,   59,   59,   59,   59,   59,   59,   59,   59,   86,
			   86,   59,  269,   63,   63,   59,   59,   59,   59,   63,
			   89,  264,   89,   64,   64,   65,   65,   66,   66,   64,
			  240,   65,   90,   66,   90,   90,   90,   67,   67,   59,
			   59,   59,   64,   67,  239,   65,  237,   66,   69,   69,
			   67,   70,   70,  235,   69,   71,   71,   70,   72,   72,

			  165,   71,  166,   70,   72,   73,   73,  147,   69,   91,
			   91,   73,  165,   72,  166,   71,  130,   74,   74,   92,
			   92,  223,   72,   74,   75,   75,   70,   76,   76,  130,
			   75,  147,   73,   76,   94,   94,  222,   74,  112,  112,
			   94,   76,   95,   95,   73,   96,   96,  221,   95,   75,
			  205,   96,   97,   97,   99,   99,  150,  150,   97,   96,
			   99,   75,   95,  100,  100,  101,  101,   94,  204,  100,
			  203,  101,  102,  102,  173,   99,  191,  101,  102,  187,
			  100,  103,  103,  168,  168,  101,  184,  103,  104,  104,
			  102,  105,  105,  103,  104,  113,  113,  105,  104,  183,

			  101,  113,  106,  106,  173,  107,  107,  105,  106,  115,
			  115,  107,  111,  111,  111,  115,  103,  107,  116,  116,
			  167,  185,  104,  106,  116,  155,  117,  117,  119,  119,
			  206,  206,  117,  185,  119,  151,  115,  149,  120,  120,
			  107,  122,  122,  116,  120,  121,  121,  122,  115,  117,
			  148,  121,  120,  119,  137,  116,  129,  123,  123,  121,
			  118,  122,  117,  123,  109,  119,  124,  124,  125,  125,
			  224,  224,  124,  108,  125,   98,  126,  126,  127,  127,
			  123,   93,  126,  131,  127,  131,  131,  131,   88,  124,
			   85,  135,  135,  123,  125,  126,  127,  135,  238,  238,

			  132,  132,  124,  132,  132,  132,  125,  134,  134,  136,
			  136,  252,  252,  134,  135,  136,  138,  138,   84,  136,
			   81,  134,  138,  139,  139,   80,  138,  135,   78,  139,
			  140,  140,   68,  132,  266,  266,  140,   58,  141,  141,
			  142,  142,   56,  136,  141,   53,  142,   52,  139,   49,
			  138,   47,  140,  143,  143,   46,  141,   33,  142,  143,
			  139,   20,  144,  144,  145,  145,  275,  275,  144,   12,
			  145,  143,  144,  146,  146,  152,  152,    9,    7,  146,
			    5,  152,    3,  146,    0,  145,    0,  153,  153,  154,
			  154,  156,  156,  153,    0,  154,  144,  156,  152,  157,

			  157,  195,  195,  195,    0,  157,    0,  146,  153,  158,
			  158,  152,  159,  159,  154,  158,  156,    0,  159,  160,
			  160,    0,    0,  161,  161,  160,  154,  157,  156,  161,
			  175,  175,    0,  161,  158,    0,  175,  159,  162,  162,
			    0,  160,  163,  163,  162,    0,  158,    0,  163,  159,
			  164,  164,  175,    0,  162,    0,  164,  161,  163,  170,
			  170,  171,  171,    0,    0,  170,    0,  171,    0,  164,
			  172,  172,  174,  174,    0,    0,  172,    0,  174,    0,
			  171,    0,    0,  170,  172,  176,  176,  176,  177,  177,
			  174,  178,  178,    0,  177,  176,  176,  178,  179,  179,

			    0,  176,    0,    0,  179,    0,  177,  180,  180,  181,
			  181,  182,  182,  180,    0,  181,  178,  182,  179,  186,
			  186,  180,  186,  186,  186,  188,  188,    0,  178,  182,
			    0,  188,  189,  189,  190,  190,    0,  181,  189,    0,
			  190,    0,    0,  188,  193,  193,    0,  190,  194,  194,
			  193,  189,  186,    0,  194,  197,  197,  198,  198,    0,
			    0,  197,  194,  198,    0,  193,  199,  199,  200,  200,
			  200,    0,  199,    0,    0,  198,  197,    0,  200,  200,
			    0,    0,  202,  202,  200,  201,  201,  201,  202,    0,
			    0,  199,  208,  208,    0,  201,  201,    0,  208,    0,

			    0,  201,    0,  199,  209,  209,  202,    0,  210,  210,
			  209,  202,    0,  208,  210,  211,  211,    0,  209,  213,
			  213,  211,  212,  212,  212,  213,    0,    0,  214,  214,
			  241,  241,  212,  212,  214,  211,  241,    0,  212,  213,
			  215,  215,  215,  216,  216,  216,  218,  218,  218,  214,
			  215,  215,  220,  220,  226,  226,  215,    0,  220,    0,
			  226,    0,  227,  227,  228,  228,  220,    0,  227,    0,
			  228,  229,  229,  229,  226,  227,  230,  230,  230,  231,
			  231,  232,  232,  232,    0,  231,  230,  230,  228,  236,
			  236,  236,  230,  234,  234,  234,  242,  242,    0,  231,

			    0,    0,  242,  234,  234,  243,  243,  243,    0,  234,
			  244,  244,  244,    0,    0,  243,  243,  246,  246,  246,
			    0,  243,  247,  247,  247,    0,    0,  246,  246,  249,
			  249,  249,    0,  246,  251,  251,  251,  253,  253,  253,
			  255,  255,  255,  257,  257,  257,  261,    0,  261,  261,
			    0,  261,  261,  261,  263,  263,  263,  265,  265,  265,
			  267,  267,  267,  268,  268,  268,  270,    0,  270,  270,
			    0,  270,  270,  270,  273,  273,  273,  274,  274,  274,
			  276,  276,  276,  277,  277,  277,  278,    0,  278,  263,
			    0,  278,  278,  278,  279,    0,  279,  279,    0,  279,

			  279,  279,  281,  281,  281,  283,    0,  283,  283,    0,
			  283,  283,  283,  284,  284,  284,  285,    0,  285,    0,
			    0,  285,  285,  285,  287,  287,  287,  287,  287,  287,
			  287,  287,  287,  287,  288,  288,  288,  288,  288,  288,
			  288,  288,  288,  288,  289,  289,  289,  289,  289,  289,
			  289,  289,  289,  289,  290,  290,  290,  290,  290,  290,
			  290,  290,  290,  290,  291,  291,  291,  291,  291,  291,
			  291,  291,  292,  292,  292,  292,  292,  292,  292,  292,
			  293,    0,  293,  293,  293,  293,  293,  293,  293,  293,
			  294,  294,  294,  294,  294,  294,  294,  294,  294,  294, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  295,  295,  295,  295,  295,  295,  295,  295,  295,  295,
			  296,  296,  296,  296,  296,  296,  296,  296,  296,  296,
			  297,  297,  297,  297,  297,  297,  297,  297,  297,  297,
			  298,  298,  298,  298,  298,  298,  298,  298,  299,  299,
			  299,  299,  299,  299,  299,  299,  300,  300,  300,  300,
			  301,  301,  301,  301,  301,  301,  301,  301,  302,  302,
			  302,  302,  302,  302,  303,  303,  303,  303,  303,  303,
			  303,  303,  304,  304,  304,  304,  304,  304,  305,  305,
			  305,  305,  305,  305,  305,  305,  306,  306,  306,  306,
			  306,  306,  306,  306,  307,  307,  307,  307,  308,  308,

			  308,  308,  308,  308,  309,  309,  309,  309,  309,  309,
			  309,  309,  310,  310,  310,  310,  311,  311,  311,  311,
			  311,  311,  312,  312,  312,  312,  312,  312,  286,  286,
			  286,  286,  286,  286,  286,  286,  286,  286,  286,  286,
			  286,  286,  286,  286,  286,  286,  286,  286,  286,  286,
			  286,  286,  286,  286,  286,  286,  286,  286,  286,  286,
			  286,  286,  286,  286,  286,  286,  286,  286,  286,  286,
			  286,  286,  286,  286,  286,  286,  286,  286,  286,  286, yy_Dummy>>,
			1, 180, 1000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,   30,  479,   50,  477,   54,  475,   56,  477,
			 1128,   60,  466, 1128, 1128, 1128, 1128, 1128, 1128, 1128,
			  449,    0, 1128,   52, 1128, 1128, 1128, 1128,   58,   61,
			   66,   68,   72,  411, 1128, 1128,    0,   75,   78,   80,
			   85,   91,   96,  102,    0, 1128,  423,  425, 1128,  446,
			 1128,  116,  444,  442, 1128,  118,  439,  120,  434,  137,
			    0,  110,  116,  141,  151,  153,  155,  165,  383,  176,
			  179,  183,  186,  193,  205,  212,  215,    0,  396,   59,
			  422,  417,  132, 1128,  415,  387,  147, 1128,  385,  158,
			  159,  197,  207,  363,  222,  230,  233,  240,  360,  242,

			  251,  253,  260,  269,  276,  279,  290,  293,  340,  334,
			   58,  297,  226,  283,    0,  297,  306,  314,  345,  316,
			  326,  333,  329,  345,  354,  356,  364,  366,   52,  324,
			  181,  370,  388,    0,  395,  379,  397,  339,  404,  411,
			  418,  426,  428,  441,  450,  452,  461,  185,  320,  307,
			  244,  323,  463,  475,  477,  310,  479,  487,  497,  500,
			  507,  511,  526,  530,  538,  163,  165,  286,  271,    0,
			  547,  549,  558,  261,  560,  518,  583,  576,  579,  586,
			  595,  597,  599,  269,  256,  284,  607,  267,  613,  620,
			  622,  260, 1128,  632,  636,  499, 1128,  643,  645,  654,

			  666,  683,  670,  237,  235,  220,  318,    0,  680,  692,
			  696,  703,  720,  707,  716,  738,  741, 1128,  744, 1128,
			  740,  215,  204,  188,  358,    0,  742,  750,  752,  769,
			  774,  767,  779, 1128,  791,  157,  787,  154,  386,  133,
			  157,  718,  784,  803,  808, 1128,  815,  820, 1128,  827,
			 1128,  832,  399,  822,    0,  838, 1128,  841, 1128, 1128,
			 1128,  836,    0,  839,  113,  842,  422,  845,  848,  105,
			  856,    0,   79,  859,  862,  454,  865,  868,  876,  884,
			   68,  887,   65,  895,  898,  906, 1128,  923,  933,  943,
			  953,  961,  969,  979,  989,  999, 1009, 1019, 1027, 1035,

			 1039, 1047, 1053, 1061, 1067, 1075, 1083, 1087, 1093, 1101,
			 1105, 1111, 1117, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  286,    1,  287,  287,  288,  289,  288,  290,  286,
			  286,  286,  286,  286,  286,  286,  286,  286,  286,  286,
			  291,  291,  286,  291,  286,  286,  286,  286,  292,  292,
			  292,  292,  292,  286,  286,  286,  291,  292,  292,  292,
			  292,  292,  292,  292,  293,  286,  293,  293,  286,  286,
			  286,  294,  286,  286,  286,  295,  286,  286,  286,  296,
			  291,  291,  291,  292,  292,  292,  292,  292,  286,  292,
			  292,  292,  292,  292,  292,  292,  292,  293,  293,  293,
			  286,  294,  294,  286,  286,  295,  295,  286,  297,  286,
			  291,  298,  299,  286,  292,  292,  292,  292,  286,  292,

			  292,  292,  292,  292,  292,  292,  292,  292,  293,  293,
			  293,  291,  298,  299,  300,  292,  292,  292,  286,  292,
			  292,  292,  292,  292,  292,  292,  292,  292,  293,  293,
			  293,  291,  301,  302,  292,  292,  292,  286,  292,  292,
			  292,  292,  292,  292,  292,  292,  292,  293,  293,  293,
			  303,  302,  292,  292,  292,  286,  292,  292,  292,  292,
			  292,  292,  292,  292,  292,  293,  293,  293,  303,  304,
			  292,  292,  292,  286,  292,  292,  292,  292,  292,  292,
			  292,  292,  292,  293,  293,  293,  305,  304,  292,  292,
			  292,  286,  286,  292,  292,  286,  286,  292,  292,  292,

			  292,  292,  292,  293,  293,  293,  306,  307,  292,  292,
			  292,  292,  292,  292,  292,  292,  286,  286,  286,  286,
			  292,  293,  293,  293,  306,  308,  292,  292,  292,  286,
			  292,  292,  286,  286,  292,  293,  293,  293,  309,  291,
			  308,  292,  292,  292,  286,  286,  292,  286,  286,  293,
			  286,  293,  309,  291,  310,  286,  286,  286,  286,  286,
			  286,  291,  311,  286,  291,  291,  311,  286,  286,  291,
			  291,  312,  286,  291,  291,  312,  286,  291,  291,  286,
			  286,  286,  286,  286,  286,  286,    0,  286,  286,  286,
			  286,  286,  286,  286,  286,  286,  286,  286,  286,  286,

			  286,  286,  286,  286,  286,  286,  286,  286,  286,  286,
			  286,  286,  286, yy_Dummy>>)
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
			   17,   17,   17,   17,   17,   17,   17,   17,   18,   19,
			    1,   20,    1,   21,    1,   22,   23,   24,   25,   26,
			   27,   28,   29,   30,   23,   23,   31,   23,   32,   33,
			   34,   23,   35,   36,   37,   38,   39,   23,   23,   40,
			   41,   42,    1,   43,   44,   45,    1,   46,   23,   47,

			   25,   26,   27,   28,   29,   30,   23,   23,   31,   23,
			   32,   33,   34,   23,   48,   36,   49,   50,   51,   23,
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

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    2,    1,    1,    1,    1,    1,    1,
			    1,    1,    3,    4,    1,    5,    5,    6,    1,    1,
			    1,    1,    7,    7,    8,    7,    9,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,   10,    1,    1,    1,    5,    7,    7,    7,    7,
			    7,    7, yy_Dummy>>)
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
			   39,   46,   50,    0,   49,   49,   49,    0,   49,   49,
			   49,   49,   49,   49,   49,   49,   49,   39,   39,   39,
			   50,    0,   49,   49,   49,    0,   49,   49,   49,   49,
			   49,   49,   49,   49,   49,   39,   39,   39,   50,    0,
			   49,   49,   49,    0,   49,   49,   49,   49,   49,   49,
			   49,   49,   49,   39,   39,   39,   50,    0,   49,   49,
			   49,    0,   47,   49,   49,    0,   28,   49,   49,   49,

			   49,   49,   49,   39,   39,   39,   50,    0,   49,   49,
			   25,   49,   49,   49,   49,   49,    0,   29,    0,   33,
			   49,   39,   39,   39,   50,    0,   49,   49,   49,   22,
			   49,   49,    0,   32,   49,   39,   39,   39,   50,   50,
			    0,   23,   24,   49,    0,   31,   49,    0,   27,   39,
			   36,   39,   50,   50,    0,    0,   34,    0,   30,   37,
			   35,   48,    0,    0,   50,   50,    0,   48,    0,   50,
			   48,    0,    0,   50,   50,    0,    0,   48,   48,   48,
			    0,    0,    0,   48,    0,   48,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 1128
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 286
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 287
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

	ontology_text_start_line: INTEGER

	annotations_text_start_line: INTEGER

feature {NONE} -- Constants

	Init_buffer_size: INTEGER = 8192
				-- Initial size for `in_buffer'

end
