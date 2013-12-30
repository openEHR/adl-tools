note
	component:   "openEHR ADL Tools"
	description: "Scanner for ADL syntax items"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ADL_15_SCANNER

inherit
	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton,
			output as print_out
		end

	ADL_15_TOKENS
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
			Result := (INITIAL <= sc and sc <= IN_RULES_SECTION)
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
if yy_act <= 30 then
if yy_act <= 15 then
if yy_act <= 8 then
if yy_act <= 4 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 58 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 58")
end
-- Ignore separators
else
--|#line 59 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 59")
end
in_lineno := in_lineno + text_count
end
else
if yy_act = 3 then
--|#line 64 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 64")
end
-- Ignore comments
else
--|#line 65 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 65")
end
in_lineno := in_lineno + 1
end
end
else
if yy_act <= 6 then
if yy_act = 5 then
--|#line 69 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 69")
end
last_token := Minus_code
else
--|#line 70 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 70")
end
last_token := Plus_code
end
else
if yy_act = 7 then
--|#line 71 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 71")
end
last_token := Star_code
else
--|#line 72 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 72")
end
last_token := Slash_code
end
end
end
else
if yy_act <= 12 then
if yy_act <= 10 then
if yy_act = 9 then
--|#line 73 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 73")
end
last_token := Caret_code
else
--|#line 74 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 74")
end
last_token := Equal_code
end
else
if yy_act = 11 then
--|#line 75 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 75")
end
last_token := Dot_code
else
--|#line 76 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 76")
end
last_token := Semicolon_code
end
end
else
if yy_act <= 14 then
if yy_act = 13 then
--|#line 77 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 77")
end
last_token := Comma_code
else
--|#line 78 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 78")
end
last_token := Colon_code
end
else
--|#line 79 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 79")
end
last_token := Exclamation_code
end
end
end
else
if yy_act <= 23 then
if yy_act <= 19 then
if yy_act <= 17 then
if yy_act = 16 then
--|#line 80 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 80")
end
last_token := Left_parenthesis_code
else
--|#line 81 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 81")
end
last_token := Right_parenthesis_code
end
else
if yy_act = 18 then
--|#line 82 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 82")
end
last_token := Dollar_code
else
--|#line 83 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 83")
end
last_token := Question_mark_code
end
end
else
if yy_act <= 21 then
if yy_act = 20 then
--|#line 85 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 85")
end
last_token := Left_bracket_code
else
--|#line 86 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 86")
end
last_token := Right_bracket_code
end
else
if yy_act = 22 then
--|#line 90 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 90")
end

				last_token := SYM_ARCHETYPE
			
else
--|#line 94 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 94")
end

				last_token := SYM_TEMPLATE_OVERLAY
			
end
end
end
else
if yy_act <= 27 then
if yy_act <= 25 then
if yy_act = 24 then
--|#line 98 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 98")
end

				last_token := SYM_TEMPLATE
			
else
--|#line 102 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 102")
end

				last_token := SYM_OPERATIONAL_TEMPLATE
			
end
else
if yy_act = 26 then
--|#line 106 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 106")
end

				last_token := SYM_ADL_VERSION
			
else
--|#line 110 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 110")
end

				last_token := SYM_IS_CONTROLLED
			
end
end
else
if yy_act <= 29 then
if yy_act = 28 then
--|#line 114 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 114")
end

				last_token := SYM_IS_GENERATED
			
else
--|#line 118 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 118")
end

				last_token := SYM_UID
			
end
else
--|#line 122 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 122")
end

				last_token := SYM_SPECIALIZE
				in_lineno := in_lineno + 1
			
end
end
end
end
else
if yy_act <= 45 then
if yy_act <= 38 then
if yy_act <= 34 then
if yy_act <= 32 then
if yy_act = 31 then
--|#line 128 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 128")
end

				last_token := SYM_LANGUAGE
				set_start_condition(IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				language_text_start_line := in_lineno
			
else
--|#line 135 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 135")
end

				last_token := SYM_DESCRIPTION
				set_start_condition(IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				description_text_start_line := in_lineno
			
end
else
if yy_act = 33 then
--|#line 142 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 142")
end

				last_token := SYM_DEFINITION
				set_start_condition(IN_CADL_SECTION)
				in_lineno := in_lineno + 1
				definition_text_start_line := in_lineno
			
else
--|#line 149 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 149")
end

				last_token := SYM_RULES
				set_start_condition(IN_RULES_SECTION)
				in_lineno := in_lineno + 1
				rules_text_start_line := in_lineno
			
end
end
else
if yy_act <= 36 then
if yy_act = 35 then
--|#line 156 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 156")
end

				last_token := SYM_TERMINOLOGY
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				terminology_text_start_line := in_lineno
			
else
--|#line 163 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 163")
end

				last_token := SYM_ANNOTATIONS
				set_start_condition(IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				annotations_text_start_line := in_lineno
			
end
else
if yy_act = 37 then
--|#line 170 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 170")
end

				last_token := SYM_COMPONENT_TERMINOLOGIES
				set_start_condition(IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				component_terminologies_text_start_line := in_lineno
			
else
--|#line 180 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 180")
end

				last_token := SYM_COMPONENT_TERMINOLOGIES
				set_start_condition(IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				component_terminologies_text_start_line := in_lineno
			
end
end
end
else
if yy_act <= 42 then
if yy_act <= 40 then
if yy_act = 39 then
--|#line 187 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 187")
end

				last_token := SYM_RULES
				set_start_condition(IN_RULES_SECTION)
				in_lineno := in_lineno + 1
				rules_text_start_line := in_lineno
			
else
--|#line 194 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 194")
end

				last_token := SYM_TERMINOLOGY
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				terminology_text_start_line := in_lineno
			
end
else
if yy_act = 41 then
--|#line 206 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 206")
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
--|#line 207 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 207")
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
end
else
if yy_act <= 44 then
if yy_act = 43 then
--|#line 208 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 208")
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
--|#line 209 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 209")
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
--|#line 226 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 226")
end
 -- LF
				in_buffer.append_character('%N')
				in_lineno := in_lineno + 1
			
end
end
end
else
if yy_act <= 52 then
if yy_act <= 49 then
if yy_act <= 47 then
if yy_act = 46 then
--|#line 230 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 230")
end
 -- any text on line with no LF
				in_buffer.append_string(text)
			
else
--|#line 245 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 245")
end

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
end
else
if yy_act = 48 then
--|#line 250 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 250")
end
in_lineno := in_lineno + text_count
else
--|#line 252 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 252")
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
if yy_act <= 51 then
if yy_act = 50 then
--|#line 264 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 264")
end
			-- match ^whitespace <anything> \n
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
else
--|#line 269 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 269")
end
in_lineno := in_lineno + text_count
end
else
--|#line 271 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 271")
end
 -- non-white space at start
				unread_character(text.item(1))
				last_token := V_RULES_TEXT
				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_
				set_start_condition(INITIAL)
	
end
end
else
if yy_act <= 56 then
if yy_act <= 54 then
if yy_act = 53 then
--|#line 283 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 283")
end

					last_token := V_DOTTED_NUMERIC
					last_string_value := text_substring (1, text_count)
			
else
--|#line 289 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 289")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 55 then
--|#line 295 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 295")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
else
--|#line 301 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 301")
end

					last_token := V_IDENTIFIER
					last_string_value := text
			
end
end
else
if yy_act <= 58 then
if yy_act = 57 then
--|#line 307 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 307")
end

					last_token := V_VALUE
					last_string_value := text
			
else
--|#line 314 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 314")
end
-- ignore unmatched chars
end
else
--|#line 0 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 0")
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
--|#line 0 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 0")
end
terminate
when 1 then
--|#line 0 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 0")
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
			create an_array.make_filled (0, 0, 1489)
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
			   29,   29,   29,   29,   29,   29,   29,   32,   29,   29,
			   29,   33,   34,   35,   36,   28,   30,   29,   29,   32,
			   29,   37,   47,   38,   39,   54,   55,   58,   59,   40,
			   41,  377,   60,   42,   60,   43,   44,   45,   64,   48,
			   65,   49,   50,   63,   63,  376,   37,   38,   43,   45,
			   63,   63,   63,   63,   67,   63,   63,   63,   63,   63,
			   63,  121,   63,   63,   48,   49,  171,   69,   63,   63,

			   67,  122,   68,   70,   63,   63,   63,   63,   72,  171,
			   75,   73,   74,  333,   77,   63,   63,   63,   63,   63,
			   63,   63,   63,   76,   73,   89,   90,   93,   94,   60,
			   64,   60,   65,   82,   78,  371,   79,   98,   99,   77,
			   81,  100,   80,  105,  367,  105,   89,   90,  366,   98,
			   99,   93,   94,  100,   80,   95,   95,   96,   95,   95,
			   95,   95,   95,   95,   95,   95,  101,   96,   95,   96,
			   95,   95,   95,   95,   98,   99,   63,   63,  100,   98,
			   99,   98,   99,  100,  147,  100,   98,   99,  365,  123,
			  100,   97,  104,  102,  352,   95,   95,   95,  103,   98,

			   99,   63,   63,  100,  191,  106,   98,   99,  147,  107,
			  100,   98,   99,   98,   99,  100,  130,  100,  130,   98,
			   99,  149,   63,  100,  108,  102,  109,   98,   99,  191,
			  123,  100,  148,  107,  359,  168,  110,  111,  112,  354,
			   98,   99,   98,   99,  100,  353,  100,  168,  352,  111,
			  212,  113,  114,   98,   99,   63,   63,  100,  351,  115,
			   98,   99,  212,  113,  100,  116,   98,   99,   98,   99,
			  100,  214,  100,   98,   99,   98,   99,  100,  117,  100,
			   98,   99,  118,  214,  100,  129,  346,  128,   98,   99,
			   98,   99,  100,  343,  100,  118,   63,  216,  127,  332,

			  131,   98,   99,  132,  332,  100,   98,   99,   98,   99,
			  100,  133,  100,  236,   98,   99,  135,  134,  100,   98,
			   99,  342,  136,  100,  335,  236,   98,   99,  138,  334,
			  100,   98,   99,  137,  258,  100,  130,  331,  130,  316,
			  135,   98,   99,  140,  314,  100,  258,  136,  139,   98,
			   99,  141,  322,  100,   98,   99,   63,   99,  100,  302,
			  100,  139,   98,   99,  322,  154,  100,   98,   99,  301,
			  142,  100,  143,   98,   99,  141,  299,  100,   98,   99,
			   98,   99,  100,  297,  100,   98,   99,  296,  151,  100,
			  279,  152,  156,   98,   99,  153,  278,  100,   63,   63,

			  151,  332,  155,  152,  277,  157,   98,   99,  153,  276,
			  100,  260,  158,  259,  155,   98,   99,   98,   99,  100,
			  257,  100,   98,   99,  280,  281,  100,  238,  159,  235,
			   98,   99,   98,   99,  100,  333,  100,  160,  163,  162,
			  234,  159,  161,   98,   99,   98,   99,  100,  233,  100,
			  160,  215,   98,   99,  161,  164,  100,   63,   63,  165,
			   63,  213,  166,  163,  196,   98,   99,  194,  167,  100,
			   98,   99,   63,   63,  100,   98,   99,  174,  193,  100,
			   98,   99,  192,  176,  100,  170,   98,   99,  177,   63,
			  100,  169,  175,   98,   99,   98,   99,  100,  148,  100,

			   98,   99,   98,   99,  100,  175,  100,  146,  176,  145,
			  178,  180,  179,  177,  280,  281,  181,  144,  182,   98,
			   99,  126,  178,  100,   98,   99,   96,  183,  100,   98,
			   99,   63,   63,  100,   63,  186,  187,  186,   94,   98,
			   99,  336,  337,  100,  184,   98,   99,  188,   91,  100,
			   98,   99,  183,  185,  100,   98,   99,   90,  189,  100,
			   98,   99,   87,   63,  100,  185,   98,   99,  336,  337,
			  100,  120,  188,  119,  190,   98,   99,   98,   99,  100,
			   97,  100,  197,  189,   61,   91,  198,   98,   99,   91,
			   87,  100,   98,   99,   87,  197,  100,   86,   85,  199,

			   84,  200,   98,   99,  202,  323,  100,  324,   98,   99,
			  353,  199,  100,  200,  201,   98,   99,   98,   99,  100,
			   71,  100,   62,  205,   98,   99,  203,   61,  100,  204,
			  387,  206,   98,   99,   56,   52,  100,   47,  203,  387,
			  208,  186,  187,  186,  387,  387,  207,  387,  205,   98,
			   99,   98,   99,  100,  387,  100,   98,   99,   98,   99,
			  100,  387,  100,   98,   99,  387,  209,  100,   98,   99,
			   98,   99,  100,  387,  100,  210,  211,  266,  266,  266,
			  219,  218,  220,  387,  221,   98,   99,  210,  387,  100,
			   98,   99,   98,   99,  100,  387,  100,   98,   99,   98,

			   99,  100,  323,  100,  324,  325,  222,  316,  224,  223,
			   98,   99,   98,   99,  100,  323,  100,  360,  226,   66,
			  377,  225,  227,   98,   99,   98,   99,  100,  387,  100,
			   98,   99,  387,  225,  100,  387,   98,   99,  387,  228,
			  100,  230,  231,  229,   98,   99,   98,   99,  100,  387,
			  100,   98,   99,  232,  387,  100,  387,   98,   99,  387,
			  239,  100,  241,  240,   98,   99,   98,   99,  100,  387,
			  100,   98,   99,  387,  387,  100,  243,  242,   98,   99,
			   98,   99,  100,  387,  100,  248,  249,  248,   98,   99,
			  244,  245,  100,  387,  246,   98,   99,   98,   99,  100,

			  264,  100,  244,  387,  247,  387,  387,  250,  251,  250,
			   98,   99,  387,  387,  100,  387,  247,   98,   99,  387,
			  253,  100,  254,  254,  254,  253,   98,   99,  387,  252,
			  100,  387,   98,   99,   98,   99,  100,  387,  100,   98,
			   99,   98,   99,  100,  387,  100,  256,  387,  387,  387,
			  387,   98,   99,  387,  263,  100,  387,   98,   99,  387,
			  265,  100,  387,  387,  255,  270,  271,  270,  387,  387,
			  268,  248,  249,  248,  250,  251,  250,  269,   98,   99,
			   98,   99,  100,  387,  100,  387,  272,   98,   99,  267,
			  387,  100,  273,  254,  254,  254,   98,   99,   98,   99,

			  100,  275,  100,  387,   98,   99,  387,   66,  100,   98,
			   99,  272,  387,  100,  387,  284,  274,  283,  266,  266,
			  266,   98,   99,  387,  387,  100,  288,  289,  288,   98,
			   99,  387,  285,  100,  270,  271,  270,  387,   98,   99,
			  387,  286,  100,   98,   99,  287,  387,  100,  290,  292,
			  293,  292,   98,   99,  387,  291,  100,  287,  278,  298,
			  278,   98,   99,   98,   99,  100,  387,  100,   66,  294,
			  303,  304,  303,   98,   99,  387,  387,  100,  387,  295,
			  387,  294,   98,   99,  387,  387,  100,  288,  289,  288,
			  387,   66,  305,  387,  306,  307,  308,  307,  387,  387, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  387,  292,  293,  292,   98,   99,  387,  387,  100,  311,
			  312,  311,   66,  296,  313,  296,  310,  299,  315,  299,
			  303,  304,  303,   98,   99,  387,  387,  100,   98,   99,
			  387,  387,  100,  307,  308,  307,  387,   66,   98,   99,
			  309,  387,  100,  387,   98,   99,  387,  318,  100,  387,
			  319,   66,  311,  312,  311,  387,   98,   99,  387,  318,
			  100,  387,  320,  319,   98,   99,  321,  387,  100,   98,
			   99,   98,   99,  100,  320,  100,  327,  387,  387,  321,
			  387,  329,  328,   98,   99,   98,   99,  100,  330,  100,
			   98,   99,  387,  387,  100,   98,   99,  387,  387,  100,

			  338,  339,  323,  341,  324,  344,  387,  335,  340,   98,
			   99,   98,   99,  100,  387,  100,   98,   99,   98,   99,
			  100,  387,  100,   98,   99,  387,  387,  100,  341,  347,
			  348,  387,   98,   99,   98,   99,  100,  349,  100,  358,
			  358,  358,  387,  356,  387,  350,  355,  323,  387,  360,
			  361,  357,  354,   98,   99,   98,   99,  100,  387,  100,
			   98,   99,  387,  387,  100,  358,  358,  358,  364,  362,
			   98,   99,  363,  387,  100,   98,   99,  387,  387,  100,
			  387,   66,  368,   98,   99,  387,  323,  100,  360,  372,
			  387,  367,  387,  364,  387,  369,  387,   98,   99,   98,

			   99,  100,  387,  100,   98,   99,  387,  370,  100,  378,
			  379,  378,  387,  374,   98,   99,  375,  387,  100,  370,
			  373,  381,  381,  381,  376,  382,  376,  378,  379,  378,
			  380,   98,   99,  387,  387,  100,  381,  381,  381,  387,
			  387,   98,   99,  383,  387,  100,  385,  386,  385,  387,
			  387,   66,  385,  386,  385,   63,   63,   63,   63,   63,
			   63,   63,  387,   66,  384,   66,   66,   66,   66,   66,
			   66,   66,  124,  124,  124,  124,  124,  124,  124,  125,
			  125,  125,  125,  125,  125,  125,  387,  387,   66,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   51,   51,

			   51,   51,   51,   51,   51,   51,   51,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   83,  387,   83,   83,   83,
			   83,   83,   83,   83,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			  150,  150,  150,  172,  172,  172,  172,  172,  172,  172,
			  173,  173,  173,  173,  173,  195,  195,  195,  195,  195,
			  195,  195,  217,  217,  217,  217,  217,  237,  237,  237,

			  237,  237,  237,  237,  261,  261,  261,  261,  261,  261,
			  261,  262,  262,  262,  282,  282,  282,  282,  282,  300,
			  300,  300,  300,  300,  300,  300,  317,  317,  317,  326,
			  326,  326,  326,  326,  345,  345,  345,  345,  345,    9,
			  387,  387,  387,  387,  387,  387,  387,  387,  387,  387,
			  387,  387,  387,  387,  387,  387,  387,  387,  387,  387,
			  387,  387,  387,  387,  387,  387,  387,  387,  387,  387,
			  387,  387,  387,  387,  387,  387,  387,  387,  387,  387,
			  387,  387,  387,  387,  387,  387,  387,  387,  387,  387, yy_Dummy>>,
			1, 490, 1000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1489)
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
			    2,  372,   11,    2,   11,    2,    2,    2,   23,    4,
			   23,    4,    4,   28,   28,  371,    2,    2,    2,    2,
			   29,   29,   30,   30,   28,   31,   31,   32,   32,   37,
			   37,   86,   38,   38,    4,    4,  147,   31,   39,   39,

			   37,   86,   30,   32,   40,   40,   41,   41,   37,  147,
			   39,   37,   38,  366,   41,   42,   42,   43,   43,   44,
			   44,   45,   45,   40,   37,   54,   54,   58,   58,   60,
			   65,   60,   65,   45,   42,  365,   42,   66,   66,   41,
			   44,   66,   43,   71,  361,   71,   89,   89,  360,   67,
			   67,   93,   93,   67,   43,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   67,   96,   62,   96,
			   62,   62,   62,   62,   68,   68,   98,   98,   68,   69,
			   69,   70,   70,   69,  122,   70,   72,   72,  359,   97,
			   72,   97,   70,   68,  352,   62,   62,   62,   69,   73,

			   73,   99,   99,   73,  168,   72,   74,   74,  122,   73,
			   74,   76,   76,   75,   75,   76,  105,   75,  105,   77,
			   77,  124,  124,   77,   74,   74,   75,   78,   78,  168,
			  148,   78,  148,   73,  351,  144,   75,   76,   77,  346,
			   79,   79,   80,   80,   79,  344,   80,  144,  343,   76,
			  191,   78,   79,   81,   81,  172,  172,   81,  342,   80,
			   82,   82,  191,   78,   82,   81,  101,  101,  102,  102,
			  101,  193,  102,  103,  103,  104,  104,  103,   82,  104,
			  106,  106,   82,  193,  106,  103,  337,  102,  107,  107,
			  108,  108,  107,  334,  108,   82,  195,  195,  101,  333,

			  106,  109,  109,  107,  332,  109,  110,  110,  113,  113,
			  110,  108,  113,  215,  111,  111,  110,  109,  111,  112,
			  112,  331,  111,  112,  325,  215,  114,  114,  113,  324,
			  114,  115,  115,  112,  234,  115,  130,  322,  130,  301,
			  110,  116,  116,  115,  297,  116,  234,  111,  114,  117,
			  117,  116,  314,  117,  118,  118,  125,  125,  118,  282,
			  125,  114,  127,  127,  314,  130,  127,  128,  128,  281,
			  117,  128,  118,  129,  129,  116,  279,  129,  131,  131,
			  132,  132,  131,  277,  132,  133,  133,  276,  127,  133,
			  260,  128,  132,  134,  134,  129,  259,  134,  237,  237,

			  127,  323,  131,  128,  258,  133,  135,  135,  129,  257,
			  135,  236,  134,  235,  131,  136,  136,  137,  137,  136,
			  233,  137,  138,  138,  261,  261,  138,  217,  135,  214,
			  139,  139,  140,  140,  139,  323,  140,  136,  139,  138,
			  213,  135,  137,  141,  141,  142,  142,  141,  212,  142,
			  136,  194,  143,  143,  137,  140,  143,  149,  149,  141,
			  149,  192,  142,  139,  173,  151,  151,  171,  143,  151,
			  152,  152,  280,  280,  152,  153,  153,  151,  170,  153,
			  155,  155,  169,  153,  155,  146,  156,  156,  155,  149,
			  156,  145,  152,  157,  157,  158,  158,  157,  123,  158,

			  159,  159,  160,  160,  159,  152,  160,  121,  153,  120,
			  156,  158,  157,  155,  300,  300,  159,  119,  160,  161,
			  161,  100,  156,  161,  162,  162,   95,  161,  162,  163,
			  163,  216,  216,  163,  216,  164,  164,  164,   92,  165,
			  165,  326,  326,  165,  162,  164,  164,  165,   91,  164,
			  166,  166,  161,  163,  166,  167,  167,   88,  166,  167,
			  174,  174,   87,  216,  174,  163,  175,  175,  345,  345,
			  175,   85,  165,   84,  167,  176,  176,  177,  177,  176,
			   64,  177,  174,  166,   61,   59,  175,  178,  178,   56,
			   55,  178,  179,  179,   52,  174,  179,   50,   49,  176,

			   48,  177,  180,  180,  179,  353,  180,  353,  181,  181,
			  353,  176,  181,  177,  178,  182,  182,  183,  183,  182,
			   33,  183,   20,  182,  185,  185,  180,   12,  185,  181,
			    9,  183,  184,  184,    7,    5,  184,    3,  180,    0,
			  185,  186,  186,  186,    0,    0,  184,    0,  182,  188,
			  188,  189,  189,  188,    0,  189,  190,  190,  197,  197,
			  190,    0,  197,  198,  198,    0,  188,  198,  200,  200,
			  199,  199,  200,    0,  199,  189,  190,  243,  243,  243,
			  198,  197,  199,    0,  200,  201,  201,  189,    0,  201,
			  202,  202,  203,  203,  202,    0,  203,  204,  204,  205,

			  205,  204,  316,  205,  316,  316,  201,  316,  203,  202,
			  206,  206,  207,  207,  206,  377,  207,  377,  205,  243,
			  377,  204,  206,  208,  208,  209,  209,  208,    0,  209,
			  210,  210,    0,  204,  210,    0,  211,  211,    0,  207,
			  211,  209,  210,  208,  218,  218,  219,  219,  218,    0,
			  219,  220,  220,  211,    0,  220,    0,  221,  221,    0,
			  218,  221,  220,  219,  222,  222,  223,  223,  222,    0,
			  223,  224,  224,    0,    0,  224,  222,  221,  225,  225,
			  226,  226,  225,    0,  226,  227,  227,  227,  240,  240,
			  223,  224,  240,    0,  225,  227,  227,  230,  230,  227,

			  240,  230,  223,    0,  226,    0,    0,  228,  228,  228,
			  229,  229,    0,    0,  229,    0,  226,  228,  228,    0,
			  230,  228,  231,  231,  231,  230,  232,  232,    0,  229,
			  232,    0,  231,  231,  239,  239,  231,    0,  239,  241,
			  241,  242,  242,  241,    0,  242,  232,  244,  244,  244,
			    0,  245,  245,    0,  239,  245,    0,  246,  246,    0,
			  242,  246,    0,    0,  231,  247,  247,  247,    0,    0,
			  245,  248,  248,  248,  250,  250,  250,  246,  252,  252,
			  253,  253,  252,    0,  253,    0,  252,  256,  256,  244,
			    0,  256,  253,  254,  254,  254,  255,  255,  263,  263,

			  255,  256,  263,    0,  264,  264,    0,  247,  264,  265,
			  265,  252,    0,  265,    0,  264,  255,  263,  266,  266,
			  266,  267,  267,    0,    0,  267,  268,  268,  268,  269,
			  269,    0,  265,  269,  270,  270,  270,    0,  272,  272,
			    0,  267,  272,  274,  274,  267,    0,  274,  269,  273,
			  273,  273,  275,  275,    0,  272,  275,  267,  278,  278,
			  278,  283,  283,  284,  284,  283,    0,  284,  268,  274,
			  285,  285,  285,  286,  286,    0,    0,  286,    0,  275,
			    0,  274,  287,  287,    0,    0,  287,  288,  288,  288,
			    0,  273,  286,    0,  287,  290,  290,  290,  291,  291, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  291,  292,  292,  292,  294,  294,    0,    0,  294,  295,
			  295,  295,  285,  296,  296,  296,  294,  299,  299,  299,
			  303,  303,  303,  305,  305,    0,    0,  305,  306,  306,
			    0,    0,  306,  307,  307,  307,    0,  290,  309,  309,
			  291,    0,  309,    0,  310,  310,    0,  305,  310,    0,
			  306,  295,  311,  311,  311,    0,  318,  318,    0,  305,
			  318,    0,  309,  306,  319,  319,  310,    0,  319,  320,
			  320,  321,  321,  320,  309,  321,  318,    0,    0,  310,
			    0,  320,  319,  327,  327,  328,  328,  327,  321,  328,
			  329,  329,    0,    0,  329,  330,  330,    0,    0,  330,

			  327,  328,  335,  330,  335,  335,    0,  335,  329,  338,
			  338,  339,  339,  338,    0,  339,  340,  340,  341,  341,
			  340,    0,  341,  348,  348,    0,    0,  348,  330,  338,
			  339,    0,  347,  347,  349,  349,  347,  340,  349,  350,
			  350,  350,    0,  348,    0,  341,  347,  354,    0,  354,
			  354,  349,  354,  355,  355,  356,  356,  355,    0,  356,
			  357,  357,    0,    0,  357,  358,  358,  358,  357,  355,
			  362,  362,  356,    0,  362,  363,  363,    0,    0,  363,
			    0,  350,  362,  364,  364,    0,  367,  364,  367,  367,
			    0,  367,    0,  357,    0,  363,    0,  368,  368,  369,

			  369,  368,    0,  369,  370,  370,    0,  364,  370,  373,
			  373,  373,    0,  369,  374,  374,  370,    0,  374,  364,
			  368,  375,  375,  375,  376,  376,  376,  378,  378,  378,
			  374,  380,  380,    0,    0,  380,  381,  381,  381,    0,
			    0,  383,  383,  380,    0,  383,  384,  384,  384,    0,
			    0,  373,  385,  385,  385,  392,  392,  392,  392,  392,
			  392,  392,    0,  375,  383,  393,  393,  393,  393,  393,
			  393,  393,  399,  399,  399,  399,  399,  399,  399,  400,
			  400,  400,  400,  400,  400,  400,    0,    0,  384,  388,
			  388,  388,  388,  388,  388,  388,  388,  388,  389,  389,

			  389,  389,  389,  389,  389,  389,  389,  390,  390,  390,
			  390,  390,  390,  390,  390,  390,  391,  391,  391,  391,
			  391,  391,  391,  391,  391,  394,    0,  394,  394,  394,
			  394,  394,  394,  394,  395,  395,  395,  395,  395,  395,
			  395,  395,  395,  396,  396,  396,  396,  396,  396,  396,
			  396,  396,  397,  397,  397,  397,  397,  397,  397,  397,
			  397,  398,  398,  398,  398,  398,  398,  398,  398,  398,
			  401,  401,  401,  402,  402,  402,  402,  402,  402,  402,
			  403,  403,  403,  403,  403,  404,  404,  404,  404,  404,
			  404,  404,  405,  405,  405,  405,  405,  406,  406,  406,

			  406,  406,  406,  406,  407,  407,  407,  407,  407,  407,
			  407,  408,  408,  408,  409,  409,  409,  409,  409,  410,
			  410,  410,  410,  410,  410,  410,  411,  411,  411,  412,
			  412,  412,  412,  412,  413,  413,  413,  413,  413,  387,
			  387,  387,  387,  387,  387,  387,  387,  387,  387,  387,
			  387,  387,  387,  387,  387,  387,  387,  387,  387,  387,
			  387,  387,  387,  387,  387,  387,  387,  387,  387,  387,
			  387,  387,  387,  387,  387,  387,  387,  387,  387,  387,
			  387,  387,  387,  387,  387,  387,  387,  387,  387,  387, yy_Dummy>>,
			1, 490, 1000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,   31,  634,   49,  632,   53,  631,   55,  630,
			 1439,   60,  624, 1439, 1439, 1439, 1439, 1439, 1439, 1439,
			  610,    0, 1439,   55, 1439, 1439, 1439, 1439,   61,   68,
			   70,   73,   75,  575, 1439, 1439,    0,   77,   80,   86,
			   92,   94,  103,  105,  107,  109,    0, 1439,  569,  566,
			  573, 1439,  591, 1439,  123,  587,  586, 1439,  125,  582,
			  127,  581,  154,    0,  565,  117,  125,  137,  162,  167,
			  169,   97,  174,  187,  194,  201,  199,  207,  215,  228,
			  230,  241,  248,    0,  542,  541,   66,  559,  554,  144,
			 1439,  545,  535,  149, 1439,  523,  165,  176,  164,  189,

			  505,  254,  256,  261,  263,  203,  268,  276,  278,  289,
			  294,  302,  307,  296,  314,  319,  329,  337,  342,  485,
			  476,  479,  162,  483,  209,  344,    0,  350,  355,  361,
			  323,  366,  368,  373,  381,  394,  403,  405,  410,  418,
			  420,  431,  433,  440,  199,  459,  454,   62,  217,  445,
			    0,  453,  458,  463, 1439,  468,  474,  481,  483,  488,
			  490,  507,  512,  517,  533,  527,  538,  543,  184,  451,
			  450,  439,  243,  452,  548,  554,  563,  565,  575,  580,
			  590,  596,  603,  605,  620,  612,  639, 1439,  637,  639,
			  644,  214,  437,  235,  418,  284,    0,  646,  651,  658,

			  656,  673,  678,  680,  685,  687,  698,  700,  711,  713,
			  718,  724,  420,  409,  401,  277,  519,  415,  732,  734,
			  739,  745,  752,  754,  759,  766,  768,  783,  805,  798,
			  785,  820,  814,  388,  298,  381,  383,  386,    0,  822,
			  776,  827,  829,  675,  845,  839,  845,  863,  869, 1439,
			  872, 1439,  866,  868,  891,  884,  875,  378,  360,  365,
			  358,  412,    0,  886,  892,  897,  916,  909,  924,  917,
			  932, 1439,  926,  947,  931,  940,  352,  351,  956,  345,
			  460,  319,  346,  949,  951,  968,  961,  970,  985, 1439,
			  993,  996,  999, 1439,  992, 1007, 1011,  313, 1439, 1015,

			  502,  324,    0, 1018, 1439, 1011, 1016, 1031, 1439, 1026,
			 1032, 1050, 1439, 1439,  316, 1439,  692,    0, 1044, 1052,
			 1057, 1059,  305,  386,  282,  309,  529, 1071, 1073, 1078,
			 1083,  292,  289,  284,  247, 1092,    0,  236, 1097, 1099,
			 1104, 1106,  226,  233,  230,  556,  224, 1120, 1111, 1122,
			 1137,  208,  179,  595, 1137, 1141, 1143, 1148, 1163,  160,
			  101,  129, 1158, 1163, 1171,  111,   67, 1176, 1185, 1187,
			 1192,   40,   46, 1207, 1202, 1219, 1222,  705, 1225, 1439,
			 1219, 1234, 1439, 1229, 1244, 1250, 1439, 1439, 1288, 1297,
			 1306, 1315, 1252, 1262, 1324, 1333, 1342, 1351, 1360, 1269,

			 1276, 1364, 1370, 1375, 1382, 1387, 1394, 1401, 1405, 1409,
			 1416, 1420, 1424, 1429, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  387,    1,  388,  388,  389,  390,  389,  391,  387,
			  387,  387,  387,  387,  387,  387,  387,  387,  387,  387,
			  392,  392,  387,  392,  387,  387,  387,  387,  393,  393,
			  393,  393,  393,  387,  387,  387,  392,  393,  393,  393,
			  393,  393,  393,  393,  393,  393,  394,  387,  394,  394,
			  394,  387,  387,  387,  395,  387,  387,  387,  396,  387,
			  387,  387,  397,  392,  392,  392,  393,  393,  393,  393,
			  393,  387,  393,  393,  393,  393,  393,  393,  393,  393,
			  393,  393,  393,  394,  394,  394,  394,  387,  395,  395,
			  387,  387,  396,  396,  387,  398,  387,  392,  399,  400,

			  387,  393,  393,  393,  393,  387,  393,  393,  393,  393,
			  393,  393,  393,  393,  393,  393,  393,  393,  393,  394,
			  394,  394,  394,  392,  399,  400,  401,  393,  393,  393,
			  387,  393,  393,  393,  393,  393,  393,  393,  393,  393,
			  393,  393,  393,  393,  394,  394,  394,  394,  392,  402,
			  403,  393,  393,  393,  387,  393,  393,  393,  393,  393,
			  393,  393,  393,  393,  393,  393,  393,  393,  394,  394,
			  394,  394,  404,  403,  393,  393,  393,  393,  393,  393,
			  393,  393,  393,  393,  393,  393,  387,  387,  393,  393,
			  393,  394,  394,  394,  394,  404,  405,  393,  393,  393,

			  393,  393,  393,  393,  393,  393,  393,  393,  393,  393,
			  393,  393,  394,  394,  394,  394,  406,  405,  393,  393,
			  393,  393,  393,  393,  393,  393,  393,  393,  393,  393,
			  393,  393,  393,  394,  394,  394,  394,  407,  408,  393,
			  393,  393,  393,  231,  231,  393,  393,  231,  387,  387,
			  387,  387,  393,  393,  387,  393,  393,  394,  394,  394,
			  394,  407,  409,  393,  393,  393,  387,  393,  231,  393,
			  387,  387,  393,  231,  393,  393,  394,  394,  394,  394,
			  410,  392,  409,  393,  393,  231,  393,  393,  387,  387,
			  231,  231,  387,  387,  393,  231,  394,  394,  387,  394,

			  410,  392,  411,  387,  387,  393,  393,  387,  387,  393,
			  393,  387,  387,  387,  394,  387,  392,  412,  393,  393,
			  393,  393,  394,  387,  392,  392,  412,  393,  393,  393,
			  393,  394,  387,  387,  392,  392,  413,  387,  393,  393,
			  393,  393,  394,  392,  392,  413,  387,  393,  393,  393,
			  231,  394,  392,  392,  387,  393,  393,  393,  387,  394,
			  387,  387,  393,  393,  393,  394,  387,  387,  393,  393,
			  393,  394,  387,  231,  393,  231,  394,  387,  387,  387,
			  393,  387,  387,  393,  231,  387,  387,    0,  387,  387,
			  387,  387,  387,  387,  387,  387,  387,  387,  387,  387,

			  387,  387,  387,  387,  387,  387,  387,  387,  387,  387,
			  387,  387,  387,  387, yy_Dummy>>)
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
			   25,   26,   27,   28,   21,   21,   29,   30,   31,   32,
			   33,   21,   34,   35,   36,   37,   38,   21,   21,   39,
			   40,   41,    1,   42,   43,   44,    1,   45,   21,   46,

			   23,   24,   25,   26,   27,   28,   21,   21,   29,   30,
			   31,   32,   33,   21,   47,   35,   48,   49,   50,   21,
			   21,   39,   40,    1,    1,    1,    1,    1,    1,    1,
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
			    6,    6,    6,    6,    6,    7,    6,    6,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,    6,    6,
			    8,    1,    1,    1,    9,    6,    6,    6,    6,    6,
			    6, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   60,
			   58,    1,    2,   15,   18,   16,   17,    7,    6,   13,
			    5,   11,    8,   57,   14,   12,   10,   19,   57,   57,
			   57,   57,   57,   20,   21,    9,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   46,   45,   46,   46,
			   46,   59,   48,   49,   59,   48,   51,   52,   59,   51,
			    1,    2,    3,   57,   57,   57,   56,   56,   56,   56,
			   56,    0,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   46,   46,   46,   46,   48,    0,    0,
			   47,   51,    0,    0,   50,    3,    4,   53,   57,   57,

			    0,   56,   56,   56,   29,    0,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   46,
			   46,   46,   46,   57,   57,   57,    0,   56,   56,   56,
			    0,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   46,   46,   46,   46,   53,   57,
			    0,   56,   56,   56,   54,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   46,   46,
			   46,   46,   57,    0,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,    0,   34,   56,   56,
			   56,   46,   46,   46,   46,   57,    0,   56,   56,   56,

			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   46,   46,   46,   46,   57,    0,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   46,   46,   46,   46,   57,    0,   56,
			   56,   28,   56,   56,   56,   56,   56,   56,    0,   31,
			    0,   40,   56,   56,   24,   56,   56,   46,   46,   46,
			   46,   57,    0,   56,   56,   56,   22,   56,   56,   56,
			    0,   39,   56,   56,   56,   56,   46,   46,   46,   46,
			   57,   57,    0,   26,   27,   56,   56,   56,    0,   33,
			   56,   56,    0,   30,   56,   56,   46,   46,   42,   46,

			   57,   57,    0,    0,   36,   56,   56,    0,   32,   56,
			   56,    0,   35,   43,   46,   41,   55,    0,   56,   56,
			   56,   56,   46,    0,   57,   57,    0,   56,   56,   56,
			   56,   46,   55,    0,   57,   55,    0,    0,   56,   56,
			   56,   56,   46,   57,   57,    0,    0,   56,   56,   56,
			   56,   46,   55,   55,   55,   56,   56,   56,   23,   46,
			    0,    0,   56,   56,   56,   46,    0,   55,   56,   56,
			   56,   46,    0,   56,   56,   56,   46,   55,    0,   38,
			   56,   25,   44,   56,   56,    0,   37,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 1439
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 387
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 388
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

	yyNb_rules: INTEGER = 59
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 60
			-- End of buffer rule code

	yyLine_used: BOOLEAN = false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN = false
			-- Is `position' used?

	INITIAL: INTEGER = 0
	IN_ODIN_SECTION: INTEGER = 1
	IN_CADL_SECTION: INTEGER = 2
	IN_RULES_SECTION: INTEGER = 3
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

	rules_text_start_line: INTEGER

	terminology_text_start_line: INTEGER

	annotations_text_start_line: INTEGER

	component_terminologies_text_start_line: INTEGER

feature {NONE} -- Constants

	Init_buffer_size: INTEGER = 8192
				-- Initial size for `in_buffer'

end
