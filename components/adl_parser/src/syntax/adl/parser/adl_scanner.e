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
--|#line 54 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 54")
end
-- Ignore separators
else
--|#line 55 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 55")
end
in_lineno := in_lineno + text_count
end
else
--|#line 60 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 60")
end
-- Ignore comments
end
else
if yy_act <= 5 then
if yy_act = 4 then
--|#line 61 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 61")
end
in_lineno := in_lineno + 1
else
--|#line 65 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 65")
end
last_token := Minus_code
end
else
--|#line 66 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 66")
end
last_token := Plus_code
end
end
else
if yy_act <= 9 then
if yy_act <= 8 then
if yy_act = 7 then
--|#line 67 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 67")
end
last_token := Star_code
else
--|#line 68 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 68")
end
last_token := Slash_code
end
else
--|#line 69 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 69")
end
last_token := Caret_code
end
else
if yy_act <= 11 then
if yy_act = 10 then
--|#line 70 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 70")
end
last_token := Equal_code
else
--|#line 71 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 71")
end
last_token := Dot_code
end
else
--|#line 72 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 72")
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
--|#line 73 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 73")
end
last_token := Comma_code
else
--|#line 74 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 74")
end
last_token := Colon_code
end
else
--|#line 75 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 75")
end
last_token := Exclamation_code
end
else
if yy_act <= 17 then
if yy_act = 16 then
--|#line 76 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 76")
end
last_token := Left_parenthesis_code
else
--|#line 77 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 77")
end
last_token := Right_parenthesis_code
end
else
--|#line 78 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 78")
end
last_token := Dollar_code
end
end
else
if yy_act <= 21 then
if yy_act <= 20 then
if yy_act = 19 then
--|#line 79 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 79")
end
last_token := Question_mark_code
else
--|#line 81 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 81")
end
last_token := Left_bracket_code
end
else
--|#line 82 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 82")
end
last_token := Right_bracket_code
end
else
if yy_act <= 23 then
if yy_act = 22 then
--|#line 86 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 86")
end

				last_token := SYM_ARCHETYPE
			
else
--|#line 90 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 90")
end

				last_token := SYM_ADL_VERSION
			
end
else
--|#line 94 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 94")
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
--|#line 98 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 98")
end

				last_token := SYM_SPECIALIZE
				in_lineno := in_lineno + 1
			
else
--|#line 104 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 104")
end

				last_token := SYM_CONCEPT
				in_lineno := in_lineno + 1
			
end
else
--|#line 109 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 109")
end

				last_token := SYM_LANGUAGE
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				language_text_start_line := in_lineno
			
end
else
if yy_act <= 29 then
if yy_act = 28 then
--|#line 116 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 116")
end

				last_token := SYM_DESCRIPTION
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				description_text_start_line := in_lineno
			
else
--|#line 123 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 123")
end

				last_token := SYM_DEFINITION
				set_start_condition(IN_CADL_SECTION)
				in_lineno := in_lineno + 1
				definition_text_start_line := in_lineno
			
end
else
--|#line 130 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 130")
end

				last_token := SYM_INVARIANT
				set_start_condition(IN_ASSERTION_SECTION)
				in_lineno := in_lineno + 1
				invariant_text_start_line := in_lineno
			
end
end
else
if yy_act <= 33 then
if yy_act <= 32 then
if yy_act = 31 then
--|#line 137 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 137")
end

				last_token := SYM_ONTOLOGY
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				ontology_text_start_line := in_lineno
			
else
--|#line 145 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 145")
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
--|#line 146 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 146")
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
--|#line 163 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 163")
end
 -- any text on line with a LF
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
			
else
--|#line 167 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 167")
end
 -- any text on line with no LF
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
			
end
else
--|#line 180 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 180")
end

		-- ignore unmatched chars
	
end
end
end
else
if yy_act <= 42 then
if yy_act <= 39 then
if yy_act <= 38 then
if yy_act = 37 then
--|#line 186 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 186")
end

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
else
--|#line 190 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 190")
end
in_lineno := in_lineno + text_count
end
else
--|#line 192 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 192")
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
--|#line 204 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 204")
end

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
else
--|#line 208 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 208")
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
--|#line 220 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 220")
end

					last_token := V_VERSION_STRING
					last_string_value := text_substring (1, text_count)
			
end
end
else
if yy_act <= 45 then
if yy_act <= 44 then
if yy_act = 43 then
--|#line 226 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 226")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 232 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 232")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
end
else
--|#line 238 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 238")
end

					last_token := V_IDENTIFIER
					last_string_value := text
			
end
else
if yy_act = 46 then
--|#line 245 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 245")
end
-- ignore unmatched chars
else
--|#line 0 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 0")
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
--|#line 0 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 0")
end
terminate
when 1 then
--|#line 0 "components\adl_parser\src\syntax\adl\parser\adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'components\adl_parser\src\syntax\adl\parser\adl_scanner.l' at line 0")
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
			   29,   29,   29,   29,   29,   29,   29,   29,   29,   29,
			   31,   32,   33,   10,   34,   42,   35,   36,   47,   48,
			   56,   56,   37,   38,   51,   39,   51,   54,   40,   55,
			   56,   58,   56,   56,   56,   43,   56,   56,   56,   69,
			   59,   58,   65,   69,   63,   73,   74,   76,   77,   56,
			   80,   61,   62,  122,   64,   66,  108,   51,   67,   51,
			   70,   54,  107,   55,   56,   80,   56,   80,   60,   60,

			   56,   80,   56,   80,   56,   80,   56,   80,   73,   74,
			   84,   81,   56,   80,   82,   56,   80,   86,   69,   77,
			   85,   56,   80,   76,   77,   74,   87,   83,   71,   60,
			   89,   88,   78,   91,   78,   94,   69,   79,   90,   69,
			   92,   56,   80,   56,   80,   56,   80,   56,   80,   93,
			   56,   80,   56,   80,   69,   56,   80,   99,   56,   80,
			   98,   97,  101,  102,  106,   97,  100,   56,   80,   56,
			   80,   80,   96,   56,   80,   56,   80,  104,   69,  105,
			   69,  103,   56,   80,   56,   80,  146,  112,   56,   80,
			   56,   80,   56,   80,   56,   80,  113,   79,  110,   56,

			   80,   56,   80,   56,   80,  111,  114,  120,  121,   78,
			   94,  115,  108,  116,   69,  123,  118,  119,  117,   56,
			   80,   56,   80,   56,   80,   56,   80,   56,   80,   56,
			   80,   56,   80,   56,   80,  130,   69,   69,   56,   80,
			  124,  127,  172,  126,  125,  128,  132,  129,   56,   80,
			   56,   80,  131,   56,   80,   56,   80,   56,   80,   56,
			   80,  133,  134,   56,   80,   56,   80,   56,   80,  136,
			   69,  142,  137,   56,   80,   69,  138,   52,  139,  141,
			  140,  143,  145,   56,   80,   56,   80,  144,   56,   80,
			  151,  152,  151,   56,   80,   56,   80,   56,   80,  147,

			   56,   80,  149,   56,   80,  148,   69,  160,  150,  153,
			   56,   80,   56,   80,   71,  155,   56,   80,  154,   56,
			   80,   71,  156,   56,   80,  151,  152,  151,  158,  157,
			   69,  159,  161,   56,   80,  163,  162,   56,   80,   56,
			   80,   56,   80,   69,  167,  168,  167,  169,  170,  169,
			   69,   56,  164,  165,   56,   80,   53,   56,   80,   56,
			   80,   52,  166,  171,   56,   80,   56,   80,  171,  176,
			  182,  176,   56,   80,   69,  173,  175,  196,  174,   56,
			   80,  167,  168,  167,  177,  179,  180,  179,  169,  170,
			  169,  178,   56,   80,   50,   56,   80,   56,   80,   56,

			   80,  176,  183,  176,  181,   45,  186,  187,  186,   69,
			  185,   56,   80,   56,   80,  184,   56,   80,  179,  180,
			  179,  189,  190,  189,  182,  191,  182,   56,   80,  188,
			   42,   56,   80,  186,  187,  186,  192,  193,  194,  193,
			  189,  190,  189,  192,  195,  192,  196,   56,   80,  193,
			  194,  193,   41,   41,   41,   41,   41,   41,   41,   44,
			   44,   44,   44,   44,   44,   44,   46,   46,   46,   46,
			   46,   46,   46,   49,   49,   49,   49,   49,   49,   49,
			   57,  196,   57,   57,   57,   57,   60,   60,   60,   60,
			   68,   68,   68,   68,   68,   68,   68,   72,   72,   72,

			   72,   72,   72,   72,   75,   75,   75,   75,   75,   75,
			   75,   53,   53,   53,   53,   53,   53,   53,   56,   56,
			   56,   56,   56,   56,   95,   95,   95,  109,  196,  109,
			  109,  109,  109,  135,  135,  135,  135,    9,  196,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,
			  196, yy_Dummy>>)
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
			   34,   28,   36,   35,   38,    4,   37,   39,   40,   43,
			   30,   34,   38,   93,   36,   47,   47,   50,   50,   57,
			   57,   34,   35,  109,   37,   39,   94,   51,   40,   51,
			   43,   55,   93,   55,   58,   58,   59,   59,   60,   60,

			   61,   61,   62,   62,   63,   63,   64,   64,   73,   73,
			   61,   58,   65,   65,   59,   66,   66,   63,   70,   75,
			   62,   67,   67,   76,   76,   72,   63,   60,   71,   60,
			   65,   64,   78,   67,   78,   79,   68,   79,   66,   92,
			   70,   81,   81,   82,   82,   84,   84,   85,   85,   70,
			   86,   86,   87,   87,  133,   88,   88,   85,   90,   90,
			   84,   82,   87,   88,   92,   85,   86,   89,   89,   91,
			   91,   56,   81,   96,   96,   98,   98,   90,  107,   91,
			  106,   89,   97,   97,   99,   99,  133,   98,  100,  100,
			  101,  101,  102,  102,  103,  103,   99,   54,   96,  104,

			  104,  105,  105,  110,  110,   97,  100,  106,  107,   53,
			  108,  101,  108,  102,  159,  110,  104,  105,  103,  111,
			  111,  112,  112,  113,  113,  114,  114,  117,  117,  115,
			  115,  116,  116,  118,  118,  117,  120,  121,  119,  119,
			  111,  114,  159,  113,  112,  115,  119,  116,  123,  123,
			  125,  125,  118,  124,  124,  126,  126,  127,  127,  128,
			  128,  120,  121,  129,  129,  132,  132,  130,  130,  123,
			  134,  129,  124,  131,  131,  147,  125,   52,  126,  128,
			  127,  130,  132,  136,  136,  137,  137,  131,  138,  138,
			  139,  139,  139,  140,  140,  141,  141,  142,  142,  134,

			  139,  139,  137,  144,  144,  136,  146,  147,  138,  140,
			  143,  143,  145,  145,   48,  142,  148,  148,  141,  149,
			  149,   45,  143,  150,  150,  151,  151,  151,  145,  144,
			   41,  146,  148,  153,  153,  150,  149,  154,  154,  155,
			  155,  158,  158,  172,  156,  156,  156,  157,  157,  157,
			  160,   29,  153,  154,  156,  156,   20,  157,  157,  161,
			  161,   12,  155,  158,  162,  162,  164,  164,  158,  163,
			  172,  163,  165,  165,  173,  160,  162,    9,  161,  163,
			  163,  167,  167,  167,  164,  166,  166,  166,  169,  169,
			  169,  165,  171,  171,    8,  166,  166,  174,  174,  175,

			  175,  176,  173,  176,  171,    5,  177,  177,  177,  183,
			  175,  178,  178,  184,  184,  174,  177,  177,  179,  179,
			  179,  181,  181,  181,  182,  182,  182,  185,  185,  178,
			    3,  181,  181,  186,  186,  186,  183,  188,  188,  188,
			  189,  189,  189,  192,  192,  192,    0,  188,  188,  193,
			  193,  193,  197,  197,  197,  197,  197,  197,  197,  198,
			  198,  198,  198,  198,  198,  198,  199,  199,  199,  199,
			  199,  199,  199,  200,  200,  200,  200,  200,  200,  200,
			  201,    0,  201,  201,  201,  201,  202,  202,  202,  202,
			  203,  203,  203,  203,  203,  203,  203,  204,  204,  204,

			  204,  204,  204,  204,  205,  205,  205,  205,  205,  205,
			  205,  206,  206,  206,  206,  206,  206,  206,  207,  207,
			  207,  207,  207,  207,  208,  208,  208,  209,    0,  209,
			  209,  209,  209,  210,  210,  210,  210,  196,  196,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,
			  196, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,   24,  427,   42,  402,   46,    0,  392,  377,
			  537,   52,  358,  537,  537,  537,  537,  537,  537,  537,
			  344,  537,  537,   44,  537,  537,  537,  537,   38,  339,
			   39,    0,  537,  537,   48,   51,   50,   54,   52,   55,
			   56,  327,  537,   66,  537,  318,  537,   73,  311,  537,
			   75,   85,  274,  206,  182,   78,  158,   67,   82,   84,
			   86,   88,   90,   92,   94,  100,  103,  109,  133,  537,
			  115,  125,  122,  106,  537,  116,  121,  537,  130,  122,
			    0,  129,  131,  537,  133,  135,  138,  140,  143,  155,
			  146,  157,  136,   70,   71,    0,  161,  170,  163,  172,

			  176,  178,  180,  182,  187,  189,  177,  175,  197,   70,
			  191,  207,  209,  211,  213,  217,  219,  215,  221,  226,
			  233,  234,    0,  236,  241,  238,  243,  245,  247,  251,
			  255,  261,  253,  151,  267,    0,  271,  273,  276,  288,
			  281,  283,  285,  298,  291,  300,  303,  272,  304,  307,
			  311,  323,  537,  321,  325,  327,  342,  345,  329,  211,
			  347,  347,  352,  367,  354,  360,  383,  379,  537,  386,
			  537,  380,  340,  371,  385,  387,  399,  404,  399,  416,
			  537,  419,  422,  406,  401,  415,  431,  537,  435,  438,
			  537,  537,  441,  447,  537,  537,  537,  451,  458,  465,

			  472,  478,  482,  489,  496,  503,  510,  516,  519,  525,
			  529, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  196,    1,  197,  197,  198,  199,  198,  200,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  201,  201,
			  201,  202,  196,  196,  201,  201,  201,  201,  201,  201,
			  201,  203,  196,  203,  196,  196,  196,  204,  196,  196,
			  205,  196,  196,  206,  196,  196,  207,  201,  201,  201,
			  202,  201,  201,  201,  201,  201,  201,  201,  203,  196,
			  203,  196,  204,  204,  196,  205,  205,  196,  196,  196,
			  208,  201,  201,  196,  201,  201,  201,  201,  201,  201,
			  201,  201,  203,  203,  196,  209,  201,  201,  201,  201,

			  201,  201,  201,  201,  201,  201,  203,  203,  196,  209,
			  201,  201,  201,  201,  201,  201,  201,  201,  201,  201,
			  203,  203,  210,  201,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,  203,  203,  210,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  201,  203,  203,  201,  201,
			  201,  196,  196,  201,  201,  201,  201,  201,  201,  203,
			  203,  201,  201,  201,  201,  201,  201,  196,  196,  196,
			  196,  201,  203,  203,  201,  201,  196,  201,  201,  196,
			  196,  201,  203,  203,  201,  201,  196,  196,  201,  196,
			  196,  196,  203,  196,  196,  196,    0,  196,  196,  196,

			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,
			  196, yy_Dummy>>)
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
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    3,    1,    4,    1,    1,    1,    1,
			    5,    5,    5,    6,    7,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    1,    1,    1,    2, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   48,
			   46,    1,    2,   15,   18,   16,   17,    7,    6,   13,
			    5,   11,    8,   46,   14,   12,   10,   19,   45,   45,
			   45,   20,   21,    9,   45,   45,   45,   45,   45,   45,
			   45,   35,   36,   35,   47,   38,   39,   47,   38,   41,
			   47,    1,    2,    3,    0,    0,    0,   45,   45,   45,
			    0,   45,   45,   45,   45,   45,   45,   45,   35,   34,
			   35,   38,    0,    0,   37,    0,    0,   40,    4,   42,
			    0,   45,   45,   43,   45,   45,   45,   45,   45,   45,
			   45,   45,   35,   35,    0,    0,   45,   45,   45,   45,

			   45,   45,   45,   45,   45,   45,   35,   35,   42,    0,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   35,   35,    0,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   35,   35,   44,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   35,   35,   45,   45,
			   45,    0,   26,   45,   45,   45,   45,   45,   45,   35,
			   35,   45,   45,   22,   45,   45,   45,    0,   27,    0,
			   31,   45,   35,   35,   45,   45,   22,   45,   45,    0,
			   30,   45,   35,   35,   23,   24,    0,   29,   45,    0,
			   25,   33,   35,    0,   28,   32,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 537
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 196
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 197
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

	yyNb_rules: INTEGER is 47
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 48
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
