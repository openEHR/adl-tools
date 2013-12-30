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
--|#line 58 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 58")
end
-- Ignore separators
else
--|#line 59 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 59")
end
in_lineno := in_lineno + text_count
end
else
if yy_act = 3 then
--|#line 64 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 64")
end
-- Ignore comments
else
--|#line 65 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 65")
end
in_lineno := in_lineno + 1
end
end
else
if yy_act <= 6 then
if yy_act = 5 then
--|#line 69 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 69")
end
last_token := Minus_code
else
--|#line 70 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 70")
end
last_token := Plus_code
end
else
--|#line 71 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 71")
end
last_token := Star_code
end
end
else
if yy_act <= 10 then
if yy_act <= 9 then
if yy_act = 8 then
--|#line 72 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 72")
end
last_token := Slash_code
else
--|#line 73 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 73")
end
last_token := Caret_code
end
else
--|#line 74 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 74")
end
last_token := Equal_code
end
else
if yy_act <= 12 then
if yy_act = 11 then
--|#line 75 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 75")
end
last_token := Dot_code
else
--|#line 76 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 76")
end
last_token := Semicolon_code
end
else
--|#line 77 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 77")
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
--|#line 78 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 78")
end
last_token := Colon_code
else
--|#line 79 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 79")
end
last_token := Exclamation_code
end
else
if yy_act = 16 then
--|#line 80 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 80")
end
last_token := Left_parenthesis_code
else
--|#line 81 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 81")
end
last_token := Right_parenthesis_code
end
end
else
if yy_act <= 19 then
if yy_act = 18 then
--|#line 82 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 82")
end
last_token := Dollar_code
else
--|#line 83 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 83")
end
last_token := Question_mark_code
end
else
--|#line 85 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 85")
end
last_token := Left_bracket_code
end
end
else
if yy_act <= 23 then
if yy_act <= 22 then
if yy_act = 21 then
--|#line 86 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 86")
end
last_token := Right_bracket_code
else
--|#line 90 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 90")
end

				last_token := SYM_ARCHETYPE
			
end
else
--|#line 94 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 94")
end

				last_token := SYM_ADL_VERSION
			
end
else
if yy_act <= 25 then
if yy_act = 24 then
--|#line 98 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 98")
end

				last_token := SYM_IS_CONTROLLED
			
else
--|#line 102 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 102")
end

				last_token := SYM_IS_GENERATED
			
end
else
--|#line 106 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 106")
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
--|#line 110 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 110")
end

				last_token := SYM_SPECIALIZE
				in_lineno := in_lineno + 1
			
else
--|#line 116 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 116")
end

				last_token := SYM_CONCEPT
				in_lineno := in_lineno + 1
			
end
else
if yy_act = 29 then
--|#line 121 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 121")
end

				last_token := SYM_LANGUAGE
				set_start_condition(IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				language_text_start_line := in_lineno
			
else
--|#line 128 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 128")
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
--|#line 135 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 135")
end

				last_token := SYM_DEFINITION
				set_start_condition(IN_CADL_SECTION)
				in_lineno := in_lineno + 1
				definition_text_start_line := in_lineno
			
else
--|#line 142 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 142")
end

				last_token := SYM_INVARIANT
				set_start_condition(IN_ASSERTION_SECTION)
				in_lineno := in_lineno + 1
				invariant_text_start_line := in_lineno
			
end
else
--|#line 149 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 149")
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
--|#line 156 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 156")
end

				last_token := SYM_ANNOTATIONS
				set_start_condition(IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				annotations_text_start_line := in_lineno
			
else
--|#line 164 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 164")
end
 -- line starting with "definition" or "description" or "annotations"
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
--|#line 165 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 165")
end
 -- line starting with "definition" or "description" or "annotations"
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
--|#line 166 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 166")
end
 -- line starting with "definition" or "description" or "annotations"
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
--|#line 183 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 183")
end
 -- LF
				in_buffer.append_character('%N')
				in_lineno := in_lineno + 1
			
end
else
--|#line 187 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 187")
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
--|#line 202 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 202")
end

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
else
--|#line 207 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 207")
end
in_lineno := in_lineno + text_count
end
else
if yy_act = 42 then
--|#line 209 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 209")
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
--|#line 221 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 221")
end
			-- match ^whitespace <anything> \n
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
end
end
else
if yy_act <= 45 then
if yy_act = 44 then
--|#line 226 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 226")
end
in_lineno := in_lineno + text_count
else
--|#line 228 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 228")
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
--|#line 240 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 240")
end

					last_token := V_DOTTED_NUMERIC
					last_string_value := text_substring (1, text_count)
			
end
end
else
if yy_act <= 49 then
if yy_act <= 48 then
if yy_act = 47 then
--|#line 246 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 246")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 252 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 252")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
end
else
--|#line 258 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 258")
end

					last_token := V_IDENTIFIER
					last_string_value := text
			
end
else
if yy_act <= 51 then
if yy_act = 50 then
--|#line 264 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 264")
end

					last_token := V_VALUE
					last_string_value := text
			
else
--|#line 271 "adl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_scanner.l' at line 271")
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
			create an_array.make_filled (0, 0, 1055)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,   10,   11,   12,   11,   13,   14,   15,   16,   17,
			   18,   19,   20,   21,   22,   23,   24,   25,   26,   27,
			   28,   29,   30,   29,   29,   29,   31,   29,   29,   29,
			   29,   29,   29,   29,   29,   29,   32,   29,   29,   29,
			   33,   34,   35,   36,   28,   30,   29,   29,   32,   29,
			   37,   45,   38,   39,   51,   52,   55,   56,   40,   41,
			   57,   42,   57,   61,   43,   62,   60,   60,   46,   60,
			   60,   47,   60,   60,   37,   38,  149,   64,   60,   60,
			   60,   60,   60,   60,  263,   60,   60,   60,   60,  149,
			   66,   65,   46,   64,   60,   60,   67,   60,   60,   72,

			   69,   60,   60,   70,   71,   74,   60,   60,   82,   83,
			   86,   87,   73,   57,  281,   57,   70,  264,   61,   75,
			   62,   91,   92,   91,   92,   93,   76,   93,  264,   74,
			   88,   88,   89,   88,   88,   88,   88,   88,   88,   88,
			   88,   95,   98,   88,   98,   88,   88,   88,   88,   91,
			   92,   82,   83,   93,   91,   92,   91,   92,   93,  109,
			   93,   91,   92,   86,   87,   93,   94,   97,  110,   88,
			   88,   88,   96,   91,   92,  279,   89,   93,   89,   99,
			   91,   92,  278,  100,   93,  273,   91,   92,   91,   92,
			   93,  275,   93,   91,   92,   60,   60,   93,  101,  102,

			   91,   92,  274,  111,   93,   90,  100,  273,  103,   60,
			   60,  105,  147,  104,   91,   92,   91,   92,   93,  118,
			   93,  118,  164,  106,  147,  104,  107,   91,   92,   91,
			   92,   93,  111,   93,  131,  106,   91,   92,   91,   92,
			   93,  117,   93,  272,  130,  116,  164,  115,   91,   92,
			   91,   92,   93,  269,   93,   91,   92,  119,  181,   93,
			  121,  132,   60,  120,  263,   91,   92,  130,  116,   93,
			  181,  122,   91,   92,  263,  123,   93,   91,   92,  266,
			  124,   93,  265,  121,   91,   92,   91,   92,   93,  257,
			   93,  125,  250,   60,   92,  249,  127,   93,  123,   60,

			   60,   91,   92,  126,  124,   93,   91,   92,  182,  247,
			   93,   91,   92,  201,  118,   93,  118,   91,   92,  127,
			  182,   93,  245,   91,   92,  201,  134,   93,  233,  135,
			   91,   92,  136,  232,   93,  139,   60,  184,  134,  231,
			  138,  135,  137,   91,   92,  136,  219,   93,  141,   91,
			   92,  218,  138,   93,  217,  140,   91,   92,   91,   92,
			   93,  203,   93,   91,   92,   91,   92,   93,  200,   93,
			  142,   60,   60,  199,   60,   91,   92,  143,  183,   93,
			  145,  146,  144,  142,   91,   92,  168,  152,   93,  166,
			  143,   91,   92,  165,  144,   93,   91,   92,  148,  154,

			   93,  131,   60,  129,  155,  153,   91,   92,   60,   60,
			   93,   91,   92,  234,  235,   93,   91,   92,  153,  128,
			   93,   91,   92,  154,  114,   93,   91,   92,  155,  156,
			   93,  157,  158,   60,   60,   91,   92,  159,   89,   93,
			   87,  156,  160,  161,   91,   92,   91,   92,   93,   84,
			   93,   91,   92,   83,  163,   93,   91,   92,   91,   92,
			   93,   80,   93,  162,   91,   92,  108,  161,   93,   91,
			   92,   90,  169,   93,   58,  170,  234,  235,  163,   91,
			   92,  171,   84,   93,   84,  169,   80,  172,   91,   92,
			   91,   92,   93,  171,   93,  173,   91,   92,   80,  172,

			   93,   79,  174,   78,  177,   91,   92,  267,  268,   93,
			  176,  175,   91,   92,  174,   68,   93,   91,   92,  178,
			   59,   93,  259,  175,  260,  261,  179,  257,  177,   91,
			   92,   91,   92,   93,  180,   93,   58,   91,   92,   91,
			   92,   93,  282,   93,  267,  268,   91,   92,  187,  188,
			   93,  186,   91,   92,   53,  189,   93,  191,  192,  191,
			   91,   92,   60,   60,   93,   60,  190,   91,   92,   49,
			   45,   93,  282,   91,   92,  194,  193,   93,   91,   92,
			   91,   92,   93,  282,   93,   91,   92,  194,  282,   93,
			  196,  195,  282,   60,   91,   92,   91,   92,   93,  282,

			   93,  198,  282,   91,   92,  282,  197,   93,   91,   92,
			  204,  282,   93,  205,  206,  282,   91,   92,  282,  282,
			   93,  191,  192,  191,  282,   91,   92,  207,  208,   93,
			   91,   92,   91,   92,   93,  282,   93,  212,  213,  212,
			  282,   91,   92,  282,  209,   93,  210,   91,   92,  282,
			  282,   93,  214,  215,  214,  211,   91,   92,  282,  259,
			   93,  260,   91,   92,  274,  282,   93,  211,   91,   92,
			   91,   92,   93,  282,   93,   91,   92,  282,  216,   93,
			  282,  282,  223,  216,  225,  225,  225,  222,   91,   92,
			  282,  282,   93,  224,   91,   92,   91,   92,   93,  282,

			   93,  282,  228,  229,  228,  282,  226,  212,  213,  212,
			   91,   92,   91,   92,   93,  227,   93,  214,  215,  214,
			   91,   92,  230,  282,   93,   91,   92,   91,   92,   93,
			  282,   93,  225,  225,  225,  282,  238,  282,  237,  282,
			  240,  241,  240,   91,   92,  282,  282,   93,  282,  239,
			   91,   92,  282,  282,   93,  228,  229,  228,  243,  244,
			  243,  242,  232,  246,  232,  282,   91,   92,   91,   92,
			   93,  282,   93,   91,   92,  282,  282,   93,  251,  252,
			  251,  240,  241,  240,  253,  254,  253,  282,   91,   92,
			  282,  259,   93,  276,   91,   92,  281,  282,   93,  243,

			  244,  243,  245,  255,  245,  247,  256,  247,  251,  252,
			  251,  253,  254,  253,  259,  282,  260,  270,  259,  266,
			  276,  277,  259,  275,  276,  280,  282,  279,   44,   44,
			   44,   44,   44,   44,   44,   44,   44,   48,   48,   48,
			   48,   48,   48,   48,   48,   48,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   60,   60,   60,   60,   60,   60,
			   60,   63,   63,   63,   63,   63,   63,   63,   77,  282,
			   77,   77,   77,   77,   77,   77,   77,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   85,   85,   85,   85,

			   85,   85,   85,   85,   85,   59,   59,   59,   59,   59,
			   59,   59,   59,   59,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,  112,  112,  112,  112,  112,  112,  112,
			  113,  113,  113,  113,  113,  113,  113,  133,  133,  133,
			  150,  150,  150,  150,  150,  150,  150,  151,  151,  151,
			  151,  151,  167,  167,  167,  167,  167,  167,  167,  185,
			  185,  185,  185,  185,  202,  202,  202,  202,  202,  202,
			  202,  220,  220,  220,  220,  220,  220,  220,  221,  221,
			  221,  236,  236,  236,  236,  236,  248,  248,  248,  248,
			  248,  248,  248,  258,  258,  258,  262,  262,  262,  262, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  262,  271,  271,  271,  271,  271,    9,  282,  282,  282,
			  282,  282,  282,  282,  282,  282,  282,  282,  282,  282,
			  282,  282,  282,  282,  282,  282,  282,  282,  282,  282,
			  282,  282,  282,  282,  282,  282,  282,  282,  282,  282,
			  282,  282,  282,  282,  282,  282,  282,  282,  282,  282,
			  282,  282,  282,  282,  282,  282, yy_Dummy>>,
			1, 56, 1000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1055)
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
			    2,    4,    2,    2,    6,    6,    8,    8,    2,    2,
			   11,    2,   11,   23,    2,   23,   28,   28,    4,   29,
			   29,    4,   30,   30,    2,    2,  130,   28,   31,   31,
			   32,   32,   37,   37,  259,   38,   38,   39,   39,  130,
			   31,   30,    4,   37,   40,   40,   32,   41,   41,   39,

			   37,   42,   42,   37,   38,   41,   43,   43,   51,   51,
			   55,   55,   40,   57,  280,   57,   37,  259,   62,   42,
			   62,   63,   63,   65,   65,   63,   43,   65,  278,   41,
			   59,   59,   59,   59,   59,   59,   59,   59,   59,   59,
			   59,   65,   68,   59,   68,   59,   59,   59,   59,   64,
			   64,   82,   82,   64,   66,   66,   67,   67,   66,   79,
			   67,   69,   69,   86,   86,   69,   64,   67,   79,   59,
			   59,   59,   66,   70,   70,  277,   89,   70,   89,   69,
			   71,   71,  276,   70,   71,  273,   72,   72,   73,   73,
			   72,  272,   73,   74,   74,   91,   91,   74,   71,   72,

			   75,   75,  270,   90,   75,   90,   70,  269,   72,   92,
			   92,   74,  128,   73,   76,   76,   94,   94,   76,   98,
			   94,   98,  147,   75,  128,   73,   76,   95,   95,   96,
			   96,   95,  131,   96,  131,   75,   97,   97,   99,   99,
			   97,   96,   99,  268,  110,   95,  147,   94,  100,  100,
			  101,  101,  100,  265,  101,  102,  102,   99,  164,  102,
			  101,  112,  112,  100,  264,  103,  103,  110,  101,  103,
			  164,  102,  104,  104,  263,  103,  104,  105,  105,  261,
			  104,  105,  260,  101,  106,  106,  107,  107,  106,  249,
			  107,  105,  236,  113,  113,  235,  107,  113,  103,  150,

			  150,  115,  115,  106,  104,  115,  116,  116,  165,  233,
			  116,  117,  117,  183,  118,  117,  118,  119,  119,  107,
			  165,  119,  231,  120,  120,  183,  115,  120,  219,  116,
			  122,  122,  117,  218,  122,  120,  167,  167,  115,  217,
			  119,  116,  118,  121,  121,  117,  201,  121,  122,  123,
			  123,  200,  119,  123,  199,  121,  124,  124,  125,  125,
			  124,  185,  125,  126,  126,  127,  127,  126,  182,  127,
			  123,  132,  132,  181,  132,  134,  134,  124,  166,  134,
			  126,  127,  125,  123,  135,  135,  151,  134,  135,  149,
			  124,  136,  136,  148,  125,  136,  138,  138,  129,  136,

			  138,  111,  132,  109,  138,  135,  139,  139,  202,  202,
			  139,  140,  140,  220,  220,  140,  141,  141,  135,  108,
			  141,  142,  142,  136,   93,  142,  143,  143,  138,  139,
			  143,  140,  141,  234,  234,  144,  144,  142,   88,  144,
			   85,  139,  143,  144,  145,  145,  146,  146,  145,   84,
			  146,  152,  152,   81,  146,  152,  153,  153,  154,  154,
			  153,   80,  154,  145,  155,  155,   78,  144,  155,  156,
			  156,   61,  152,  156,   58,  153,  248,  248,  146,  157,
			  157,  154,   56,  157,   53,  152,   52,  155,  158,  158,
			  159,  159,  158,  154,  159,  156,  160,  160,   49,  155,

			  160,   47,  157,   46,  160,  161,  161,  262,  262,  161,
			  159,  158,  162,  162,  157,   33,  162,  163,  163,  161,
			   20,  163,  257,  158,  257,  257,  162,  257,  160,  169,
			  169,  170,  170,  169,  163,  170,   12,  171,  171,  172,
			  172,  171,    9,  172,  271,  271,  173,  173,  170,  171,
			  173,  169,  176,  176,    7,  172,  176,  174,  174,  174,
			  175,  175,  184,  184,  175,  184,  173,  174,  174,    5,
			    3,  174,    0,  177,  177,  176,  175,  177,  178,  178,
			  179,  179,  178,    0,  179,  180,  180,  176,    0,  180,
			  178,  177,    0,  184,  186,  186,  187,  187,  186,    0,

			  187,  180,    0,  188,  188,    0,  179,  188,  189,  189,
			  186,    0,  189,  187,  188,    0,  190,  190,    0,    0,
			  190,  191,  191,  191,    0,  193,  193,  189,  190,  193,
			  194,  194,  195,  195,  194,    0,  195,  196,  196,  196,
			    0,  206,  206,    0,  193,  206,  194,  196,  196,    0,
			    0,  196,  197,  197,  197,  195,  198,  198,    0,  274,
			  198,  274,  197,  197,  274,    0,  197,  195,  204,  204,
			  205,  205,  204,    0,  205,  207,  207,    0,  198,  207,
			    0,    0,  205,  198,  208,  208,  208,  204,  209,  209,
			    0,    0,  209,  207,  208,  208,  210,  210,  208,    0,

			  210,    0,  211,  211,  211,    0,  209,  212,  212,  212,
			  216,  216,  211,  211,  216,  210,  211,  214,  214,  214,
			  222,  222,  216,    0,  222,  223,  223,  224,  224,  223,
			    0,  224,  225,  225,  225,    0,  223,    0,  222,    0,
			  226,  226,  226,  227,  227,    0,    0,  227,    0,  224,
			  226,  226,    0,    0,  226,  228,  228,  228,  230,  230,
			  230,  227,  232,  232,  232,    0,  237,  237,  230,  230,
			  237,    0,  230,  238,  238,    0,    0,  238,  239,  239,
			  239,  240,  240,  240,  242,  242,  242,    0,  239,  239,
			    0,  281,  239,  281,  242,  242,  281,    0,  242,  243,

			  243,  243,  245,  245,  245,  247,  247,  247,  251,  251,
			  251,  253,  253,  253,  266,    0,  266,  266,  275,  266,
			  275,  275,  279,  275,  279,  279,    0,  279,  283,  283,
			  283,  283,  283,  283,  283,  283,  283,  284,  284,  284,
			  284,  284,  284,  284,  284,  284,  285,  285,  285,  285,
			  285,  285,  285,  285,  285,  286,  286,  286,  286,  286,
			  286,  286,  286,  286,  287,  287,  287,  287,  287,  287,
			  287,  288,  288,  288,  288,  288,  288,  288,  289,    0,
			  289,  289,  289,  289,  289,  289,  289,  290,  290,  290,
			  290,  290,  290,  290,  290,  290,  291,  291,  291,  291,

			  291,  291,  291,  291,  291,  292,  292,  292,  292,  292,
			  292,  292,  292,  292,  293,  293,  293,  293,  293,  293,
			  293,  293,  293,  294,  294,  294,  294,  294,  294,  294,
			  295,  295,  295,  295,  295,  295,  295,  296,  296,  296,
			  297,  297,  297,  297,  297,  297,  297,  298,  298,  298,
			  298,  298,  299,  299,  299,  299,  299,  299,  299,  300,
			  300,  300,  300,  300,  301,  301,  301,  301,  301,  301,
			  301,  302,  302,  302,  302,  302,  302,  302,  303,  303,
			  303,  304,  304,  304,  304,  304,  305,  305,  305,  305,
			  305,  305,  305,  306,  306,  306,  307,  307,  307,  307, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  307,  308,  308,  308,  308,  308,  282,  282,  282,  282,
			  282,  282,  282,  282,  282,  282,  282,  282,  282,  282,
			  282,  282,  282,  282,  282,  282,  282,  282,  282,  282,
			  282,  282,  282,  282,  282,  282,  282,  282,  282,  282,
			  282,  282,  282,  282,  282,  282,  282,  282,  282,  282,
			  282,  282,  282,  282,  282,  282, yy_Dummy>>,
			1, 56, 1000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,   30,  567,   48,  566,   52,  551,   54,  542,
			 1006,   58,  533, 1006, 1006, 1006, 1006, 1006, 1006, 1006,
			  508,    0, 1006,   50, 1006, 1006, 1006, 1006,   54,   57,
			   60,   66,   68,  471, 1006, 1006,    0,   70,   73,   75,
			   82,   85,   89,   94,    0, 1006,  473,  477, 1006,  495,
			 1006,  106,  483,  481, 1006,  108,  479,  111,  471,  129,
			    0,  456,  105,  109,  137,  111,  142,  144,   97,  149,
			  161,  168,  174,  176,  181,  188,  202,    0,  436,  134,
			  458,  450,  149, 1006,  446,  437,  161, 1006,  435,  174,
			  190,  183,  197,  408,  204,  215,  217,  224,  206,  226,

			  236,  238,  243,  253,  260,  265,  272,  274,  388,  375,
			  222,  386,  249,  281,    0,  289,  294,  299,  301,  305,
			  311,  331,  318,  337,  344,  346,  351,  353,  177,  368,
			   43,  219,  359,    0,  363,  372,  379, 1006,  384,  394,
			  399,  404,  409,  414,  423,  432,  434,  202,  365,  361,
			  287,  374,  439,  444,  446,  452,  457,  467,  476,  478,
			  484,  493,  500,  505,  223,  273,  346,  324,    0,  517,
			  519,  525,  527,  534,  555,  548,  540,  561,  566,  568,
			  573,  345,  340,  278,  550,  349,  582,  584,  591,  596,
			  604,  619, 1006,  613,  618,  620,  635,  650,  644,  323,

			  320,  318,  396,    0,  656,  658,  629,  663,  682,  676,
			  684,  700,  705, 1006,  715, 1006,  698,  309,  303,  297,
			  401,    0,  708,  713,  715,  730,  738,  731,  753, 1006,
			  756,  288,  760,  279,  421,  246,  279,  754,  761,  776,
			  779, 1006,  782,  797, 1006,  800, 1006,  803,  464,  274,
			    0,  806, 1006,  809, 1006, 1006, 1006,  512,    0,   69,
			  236,  264,  495,  259,  249,  208,  804,    0,  194,  192,
			  187,  532,  176,  170,  649,  808,  136,  160,   83,  812,
			   99,  781, 1006,  827,  836,  845,  854,  861,  868,  877,
			  886,  895,  904,  913,  920,  927,  931,  937,  942,  949,

			  954,  961,  968,  972,  976,  983,  987,  991,  996, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  282,    1,  283,  283,  284,  285,  284,  286,  282,
			  282,  282,  282,  282,  282,  282,  282,  282,  282,  282,
			  287,  287,  282,  287,  282,  282,  282,  282,  288,  288,
			  288,  288,  288,  282,  282,  282,  287,  288,  288,  288,
			  288,  288,  288,  288,  289,  282,  289,  289,  282,  282,
			  282,  290,  282,  282,  282,  291,  282,  282,  282,  292,
			  287,  287,  287,  288,  288,  288,  288,  288,  282,  288,
			  288,  288,  288,  288,  288,  288,  288,  289,  289,  289,
			  282,  290,  290,  282,  282,  291,  291,  282,  293,  282,
			  287,  294,  295,  282,  288,  288,  288,  288,  282,  288,

			  288,  288,  288,  288,  288,  288,  288,  288,  289,  289,
			  289,  287,  294,  295,  296,  288,  288,  288,  282,  288,
			  288,  288,  288,  288,  288,  288,  288,  288,  289,  289,
			  289,  287,  297,  298,  288,  288,  288,  282,  288,  288,
			  288,  288,  288,  288,  288,  288,  288,  289,  289,  289,
			  299,  298,  288,  288,  288,  288,  288,  288,  288,  288,
			  288,  288,  288,  288,  289,  289,  289,  299,  300,  288,
			  288,  288,  288,  288,  288,  288,  288,  288,  288,  288,
			  288,  289,  289,  289,  301,  300,  288,  288,  288,  288,
			  288,  282,  282,  288,  288,  288,  288,  288,  288,  289,

			  289,  289,  302,  303,  288,  288,  288,  288,  288,  288,
			  288,  288,  282,  282,  282,  282,  288,  289,  289,  289,
			  302,  304,  288,  288,  288,  282,  288,  288,  282,  282,
			  288,  289,  289,  289,  305,  287,  304,  288,  288,  288,
			  282,  282,  288,  282,  282,  289,  282,  289,  305,  287,
			  306,  282,  282,  282,  282,  282,  282,  287,  307,  282,
			  287,  287,  307,  282,  282,  287,  287,  308,  282,  287,
			  287,  308,  282,  287,  287,  282,  282,  282,  282,  282,
			  282,  282,    0,  282,  282,  282,  282,  282,  282,  282,
			  282,  282,  282,  282,  282,  282,  282,  282,  282,  282,

			  282,  282,  282,  282,  282,  282,  282,  282,  282, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
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
			   39,   40,    1,   41,   42,   43,    1,   44,   21,   45,

			   23,   24,   25,   26,   27,   28,   21,   21,   29,   21,
			   30,   31,   32,   21,   46,   34,   47,   48,   49,   21,
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

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    2,    1,    1,    1,    1,    1,    1,
			    1,    1,    3,    4,    1,    5,    1,    1,    1,    1,
			    6,    6,    6,    6,    7,    6,    6,    6,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,    6,    8,
			    1,    1,    1,    9,    6,    6,    6,    6,    6,    6, yy_Dummy>>)
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
			   39,   46,   50,    0,   49,   49,   49,   47,   49,   49,
			   49,   49,   49,   49,   49,   49,   49,   39,   39,   39,
			   50,    0,   49,   49,   49,   49,   49,   49,   49,   49,
			   49,   49,   49,   49,   39,   39,   39,   50,    0,   49,
			   49,   49,   49,   49,   49,   49,   49,   49,   49,   49,
			   49,   39,   39,   39,   50,    0,   49,   49,   49,   49,
			   49,    0,   28,   49,   49,   49,   49,   49,   49,   39,

			   39,   39,   50,    0,   49,   49,   25,   49,   49,   49,
			   49,   49,    0,   29,    0,   33,   49,   39,   39,   39,
			   50,    0,   49,   49,   49,   22,   49,   49,    0,   32,
			   49,   39,   39,   39,   50,   50,    0,   23,   24,   49,
			    0,   31,   49,    0,   27,   39,   36,   39,   50,   50,
			    0,    0,   34,    0,   30,   37,   35,   48,    0,    0,
			   50,   50,    0,   48,    0,   50,   48,    0,    0,   50,
			   50,    0,    0,   48,   48,   48,    0,    0,    0,   48,
			    0,   48,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 1006
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 282
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 283
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
