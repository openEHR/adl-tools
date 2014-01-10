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
if yy_act <= 31 then
if yy_act <= 16 then
if yy_act <= 8 then
if yy_act <= 4 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 71 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 71")
end
-- Ignore separators
else
--|#line 72 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 72")
end
in_lineno := in_lineno + text_count
end
else
if yy_act = 3 then
--|#line 77 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 77")
end
-- Ignore comments
else
--|#line 78 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 78")
end
in_lineno := in_lineno + 1
end
end
else
if yy_act <= 6 then
if yy_act = 5 then
--|#line 82 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 82")
end
last_token := Minus_code
else
--|#line 83 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 83")
end
last_token := Plus_code
end
else
if yy_act = 7 then
--|#line 84 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 84")
end
last_token := Star_code
else
--|#line 85 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 85")
end
last_token := Slash_code
end
end
end
else
if yy_act <= 12 then
if yy_act <= 10 then
if yy_act = 9 then
--|#line 86 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 86")
end
last_token := Caret_code
else
--|#line 87 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 87")
end
last_token := Equal_code
end
else
if yy_act = 11 then
--|#line 88 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 88")
end
last_token := Dot_code
else
--|#line 89 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 89")
end
last_token := Semicolon_code
end
end
else
if yy_act <= 14 then
if yy_act = 13 then
--|#line 90 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 90")
end
last_token := Comma_code
else
--|#line 91 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 91")
end
last_token := Colon_code
end
else
if yy_act = 15 then
--|#line 92 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 92")
end
last_token := Exclamation_code
else
--|#line 93 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 93")
end
last_token := Left_parenthesis_code
end
end
end
end
else
if yy_act <= 24 then
if yy_act <= 20 then
if yy_act <= 18 then
if yy_act = 17 then
--|#line 94 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 94")
end
last_token := Right_parenthesis_code
else
--|#line 95 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 95")
end
last_token := Dollar_code
end
else
if yy_act = 19 then
--|#line 96 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 96")
end
last_token := Question_mark_code
else
--|#line 98 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 98")
end
last_token := Left_bracket_code
end
end
else
if yy_act <= 22 then
if yy_act = 21 then
--|#line 99 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 99")
end
last_token := Right_bracket_code
else
--|#line 103 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 103")
end

				last_token := SYM_ARCHETYPE
			
end
else
if yy_act = 23 then
--|#line 107 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 107")
end

				last_token := SYM_TEMPLATE_OVERLAY
			
else
--|#line 111 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 111")
end

				last_token := SYM_TEMPLATE
			
end
end
end
else
if yy_act <= 28 then
if yy_act <= 26 then
if yy_act = 25 then
--|#line 115 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 115")
end

				last_token := SYM_OPERATIONAL_TEMPLATE
			
else
--|#line 119 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 119")
end

				last_token := SYM_ADL_VERSION
			
end
else
if yy_act = 27 then
--|#line 123 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 123")
end

				last_token := SYM_IS_CONTROLLED
			
else
--|#line 127 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 127")
end

				last_token := SYM_IS_GENERATED
			
end
end
else
if yy_act <= 30 then
if yy_act = 29 then
--|#line 131 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 131")
end

				last_token := SYM_UID
			
else
--|#line 135 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 135")
end

				last_token := SYM_SPECIALIZE
				in_lineno := in_lineno + 1
			
end
else
--|#line 141 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 141")
end

				last_token := SYM_LANGUAGE
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				language_text_start_line := in_lineno
			
end
end
end
end
else
if yy_act <= 46 then
if yy_act <= 39 then
if yy_act <= 35 then
if yy_act <= 33 then
if yy_act = 32 then
--|#line 148 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 148")
end

				last_token := SYM_DESCRIPTION
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				description_text_start_line := in_lineno
			
else
--|#line 155 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 155")
end

				last_token := SYM_DEFINITION
				set_start_condition (IN_CADL_SECTION)
				in_lineno := in_lineno + 1
				definition_text_start_line := in_lineno
			
end
else
if yy_act = 34 then
--|#line 162 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 162")
end

				last_token := SYM_RULES
				set_start_condition (IN_RULES_SECTION)
				in_lineno := in_lineno + 1
				rules_text_start_line := in_lineno
			
else
--|#line 169 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 169")
end

				last_token := SYM_TERMINOLOGY
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				terminology_text_start_line := in_lineno
			
end
end
else
if yy_act <= 37 then
if yy_act = 36 then
--|#line 176 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 176")
end

				last_token := SYM_ANNOTATIONS
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				annotations_text_start_line := in_lineno
			
else
--|#line 183 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 183")
end

				last_token := SYM_COMPONENT_TERMINOLOGIES
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				component_terminologies_text_start_line := in_lineno
			
end
else
if yy_act = 38 then
--|#line 193 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 193")
end

				last_token := SYM_CONCEPT
				in_lineno := in_lineno + 1
			
else
--|#line 198 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 198")
end

				last_token := SYM_COMPONENT_TERMINOLOGIES
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				component_terminologies_text_start_line := in_lineno
			
end
end
end
else
if yy_act <= 43 then
if yy_act <= 41 then
if yy_act = 40 then
--|#line 205 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 205")
end

				last_token := SYM_RULES
				set_start_condition (IN_RULES_SECTION)
				in_lineno := in_lineno + 1
				rules_text_start_line := in_lineno
			
else
--|#line 212 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 212")
end

				last_token := SYM_TERMINOLOGY
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				terminology_text_start_line := in_lineno
			
end
else
if yy_act = 42 then
--|#line 219 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 219")
end

				last_token := V_CONCEPT_CODE
				last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 230 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 230")
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

				set_start_condition (INITIAL)
			
end
end
else
if yy_act <= 45 then
if yy_act = 44 then
--|#line 231 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 231")
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

				set_start_condition (INITIAL)
			
else
--|#line 232 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 232")
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

				set_start_condition (INITIAL)
			
end
else
--|#line 233 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 233")
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

				set_start_condition (INITIAL)
			
end
end
end
else
if yy_act <= 54 then
if yy_act <= 50 then
if yy_act <= 48 then
if yy_act = 47 then
--|#line 234 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 234")
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

				set_start_condition (INITIAL)
			
else
--|#line 251 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 251")
end
 -- LF
				in_buffer.append_character('%N')
				in_lineno := in_lineno + 1
			
end
else
if yy_act = 49 then
--|#line 255 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 255")
end
 -- any text on line with no LF
				in_buffer.append_string(text)
			
else
--|#line 270 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 270")
end
			-- match ^whitespace <anything> \n
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
end
end
else
if yy_act <= 52 then
if yy_act = 51 then
--|#line 275 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 275")
end
in_lineno := in_lineno + text_count
else
--|#line 277 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 277")
end
 -- non-white space at start
				unread_character(text.item(1))
				last_token := V_CADL_TEXT
				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_
				set_start_condition (INITIAL)
	
end
else
if yy_act = 53 then
--|#line 289 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 289")
end
			-- match ^whitespace <anything> \n
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
else
--|#line 294 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 294")
end
in_lineno := in_lineno + text_count
end
end
end
else
if yy_act <= 58 then
if yy_act <= 56 then
if yy_act = 55 then
--|#line 296 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 296")
end
 -- non-white space at start
				unread_character(text.item(1))
				last_token := V_RULES_TEXT
				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_
				set_start_condition (INITIAL)
	
else
--|#line 309 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 309")
end

					last_token := V_DOTTED_NUMERIC
					last_string_value := text_substring (1, text_count)
			
end
else
if yy_act = 57 then
--|#line 315 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 315")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
else
--|#line 321 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 321")
end

					last_token := V_IDENTIFIER
					last_string_value := text
			
end
end
else
if yy_act <= 60 then
if yy_act = 59 then
--|#line 327 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 327")
end

					last_token := V_VALUE
					last_string_value := text
			
else
--|#line 334 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 334")
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
				set_start_condition (INITIAL)
			
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
			create an_array.make_filled (0, 0, 1722)
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
			   29,   29,   29,   29,   29,   29,   29,   29,   29,   32,
			   29,   29,   29,   33,   34,   35,   36,   28,   30,   29,
			   29,   29,   29,   32,   29,   37,   47,   38,   39,   54,
			   55,   58,   59,   40,   41,  410,   60,   42,   60,   43,
			   44,   45,   63,   63,  408,   48,   71,   49,   50,   72,
			   37,   38,   39,   40,   43,   45,   64,  123,   65,   65,
			   65,   63,   63,   63,   63,   63,   63,  124,   63,   63,

			   48,   49,   50,  151,   67,   63,   63,   63,   63,   69,
			   63,   63,   63,   63,  399,   68,   70,  398,   67,   63,
			   63,   76,   63,   63,   63,   63,   73,  151,   67,   74,
			   63,   63,   75,   77,   78,  175,   70,   63,   63,   90,
			   91,  158,   67,   79,   74,   80,   81,   94,   95,  175,
			   60,   83,   60,   82,   98,   98,   98,   90,   91,   78,
			   81,   96,   96,   97,   96,   96,   96,   96,   96,   96,
			   96,   96,  160,   64,   96,   65,   65,   65,   96,   96,
			   96,   96,   99,  100,  350,   99,  100,  150,  101,   99,
			  100,  101,   99,  100,  201,  101,   99,  100,  101,   94,

			   95,  393,  101,   96,   96,   96,  103,  150,  102,  105,
			   99,  100,  203,  104,   99,  100,  101,   99,  100,  201,
			  101,   99,  100,  101,   99,  100,  108,  101,   99,  100,
			  101,  107,  203,  105,  101,  392,  111,  109,  110,   99,
			  100,   99,  100,   63,   63,  101,  112,  101,  387,  114,
			  108,  386,  113,   99,  100,  116,   99,  100,   97,  101,
			   97,  379,  101,   99,  100,  115,  113,   63,   63,  101,
			  118,  125,  117,   98,   98,   98,   99,  100,  378,  115,
			   99,  100,  101,  119,   99,  100,  101,  120,   99,  100,
			  101,  132,  133,  133,  101,  152,  152,  152,  131,   99,

			  100,  130,  120,   99,  100,  101,   99,  100,  204,  101,
			  129,  370,  101,   99,  100,  153,   63,   99,  100,  101,
			  135,  134,  178,  101,  338,  137,   99,  100,  204,  136,
			   99,  100,  101,  369,  130,  138,  101,  178,  139,  338,
			  140,   99,  100,  364,   99,  100,  361,  101,  359,  137,
			  101,  351,   99,  100,  348,  138,  347,  141,  101,   63,
			   63,  329,  139,   99,  100,  140,  142,   99,  100,  101,
			  196,  197,  196,  101,   99,  100,  143,  144,  328,  145,
			  101,   99,  100,   63,  100,   63,  227,  101,  223,  101,
			  225,  143,   99,  100,  316,  249,  246,  146,  101,   99,

			  100,  147,  223,  145,  225,  101,   99,  100,  248,  249,
			  271,  158,  101,  159,  133,  133,  246,   63,   63,  158,
			  155,  133,  133,  133,  271,  156,   99,  100,  248,  315,
			  157,  273,  101,  313,  155,   99,  100,   99,  100,  156,
			  310,  101,  160,  101,  311,  157,  309,   99,  100,  162,
			  160,  273,  161,  101,   99,  100,   99,  100,  311,  163,
			  101,  164,  101,   99,  100,  292,  161,   99,  100,  101,
			   99,  100,  291,  101,  290,  165,  101,  289,   99,  100,
			  166,  235,  236,  235,  101,   99,  100,  167,  170,  169,
			  337,  101,  293,  294,  168,  166,  360,   99,  100,   99,

			  100,  272,  167,  101,  337,  101,   99,  100,  168,  270,
			  171,  251,  101,  170,  247,  172,  360,  125,  173,  152,
			  152,  152,   63,   63,  174,   63,   63,   63,   99,  100,
			   99,  100,   63,   63,  101,  172,  101,   99,  100,   99,
			  100,  226,  181,  101,  174,  101,  158,  183,  185,  133,
			  133,   99,  100,  385,  182,  224,   63,  101,   99,  100,
			  206,  186,   99,  100,  101,  187,  293,  294,  101,  182,
			   99,  100,  183,  385,   99,  100,  101,  160,  202,  187,
			  101,  189,  184,  188,   99,  100,  186,  177,  190,  406,
			  101,  176,  191,   99,  100,   99,  100,  353,  354,  101,

			  149,  101,  192,  193,   99,  100,  353,  354,  190,  406,
			  101,  148,  191,  196,  197,  196,  128,  194,  261,  262,
			  261,   97,  192,   99,  100,   99,  100,   95,  193,  101,
			  195,  101,   99,  100,   92,  198,   91,   88,  101,  122,
			   99,  100,  199,  121,  195,  106,  101,   99,  100,  106,
			   99,  100,   61,  101,   92,   92,  101,   99,  100,   88,
			  198,  200,  158,  101,  133,  133,  133,  199,   99,  100,
			   88,  207,  208,   87,  101,   99,  100,   86,   99,  100,
			   85,  101,   62,  209,  101,   61,  207,  414,   56,   99,
			  100,   52,  212,  160,  210,  101,   47,  209,  414,   99,

			  100,   99,  100,  414,  211,  101,  414,  101,  210,  414,
			   99,  100,   99,  100,  414,  213,  101,  414,  101,  414,
			  216,   99,  100,  414,  215,  214,  414,  101,  217,  213,
			   99,  100,   99,  100,   99,  100,  101,  218,  101,  214,
			  101,   99,  100,   99,  100,  216,  414,  101,  219,  101,
			  414,  220,   99,  100,  414,   99,  100,  414,  101,  414,
			  221,  101,  230,  222,   99,  100,   99,  100,  219,  231,
			  101,  414,  101,  414,  221,   99,  100,  229,  263,  264,
			  263,  101,  232,  235,  236,  235,   99,  100,  414,  233,
			  414,  414,  101,   99,  100,  414,  234,   99,  100,  101,

			   99,  100,  232,  101,  237,  414,  101,  414,   99,  100,
			   99,  100,   99,  100,  101,  414,  101,  414,  101,  414,
			  414,  239,  240,  238,  237,   99,  100,   99,  100,   99,
			  100,  101,  414,  101,  242,  101,  414,  238,  414,  241,
			  414,  244,  414,  243,  414,  414,   63,   63,  245,   63,
			   63,   63,   99,  100,   99,  100,   99,  100,  101,  414,
			  101,  414,  101,  243,  414,   99,  100,  414,  414,  254,
			  252,  101,  414,  253,  414,   99,  100,   99,  100,  414,
			   63,  101,  414,  101,  414,   99,  100,  255,  414,  256,
			  252,  101,  414,  254,   99,  100,   99,  100,  414,  414,

			  101,  414,  101,  257,  261,  262,  261,  258,  263,  264,
			  263,  414,  259,  414,   99,  100,  414,  257,   99,  100,
			  101,  414,  260,  414,  101,   99,  100,   99,  100,   99,
			  100,  101,  259,  101,  414,  101,  260,  267,  267,  267,
			  267,  267,  267,   99,  100,  414,  265,   99,  100,  101,
			  414,  269,  266,  101,   99,  100,  414,  266,   99,  100,
			  101,   99,  100,  414,  101,  276,  414,  101,  277,  279,
			  279,  279,   99,  100,  279,  279,  279,  414,  101,   99,
			  100,  268,  278,   99,  100,  101,   99,  100,  414,  101,
			   99,  100,  101,  283,  284,  283,  101,   99,  100,  283, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  284,  283,  414,  101,  281,  414,  280,  285,  282,   99,
			  100,   99,  100,   99,  100,  101,  414,  101,  414,  101,
			   99,  100,   99,  100,  414,  286,  101,  414,  101,  291,
			  312,  291,  285,   99,  100,  287,  288,  414,  414,  101,
			  414,   99,  100,  296,  414,  414,  297,  101,  414,   99,
			  100,  301,  302,  301,  414,  101,  414,   99,  100,   99,
			  100,   99,  100,  101,  414,  101,  298,  101,   99,  100,
			  297,  299,  414,  414,  101,  300,  414,  414,  303,  414,
			  305,  306,  305,  301,  302,  301,  414,  304,  308,  300,
			   99,  100,   99,  100,   99,  100,  101,  414,  101,  414,

			  101,  317,  318,  317,   99,  100,  414,   99,  100,  414,
			  101,   99,  100,  101,  305,  306,  305,  101,  414,  414,
			  307,  320,  321,  322,  321,  319,  309,  327,  309,   99,
			  100,  414,   99,  100,  307,  101,   99,  100,  101,  313,
			  330,  313,  101,  325,  326,  325,  331,  331,  331,  414,
			  324,  414,  414,   99,  100,  317,  318,  317,  414,  101,
			   99,  100,  414,  323,   99,  100,  101,  321,  322,  321,
			  101,   99,  100,  414,   99,  100,  414,  101,   99,  100,
			  101,  325,  326,  325,  101,  414,  333,  339,  334,  340,
			  341,  414,  331,  331,  331,   99,  100,  335,  336,  366,

			  333,  101,  414,  334,   99,  100,   99,  100,   99,  100,
			  101,  335,  101,  336,  101,  414,  414,  343,  414,  414,
			  345,  349,  349,  349,  344,   99,  100,  346,  352,  352,
			  352,  101,   99,  100,   99,  100,   99,  100,  101,  414,
			  101,  414,  101,  414,  355,  414,  358,  349,  349,  349,
			  356,  349,  349,  349,  357,  339,  414,  340,  362,  350,
			  352,  352,  352,   99,  100,  414,   99,  100,  414,  101,
			  356,  358,  101,   99,  100,  371,  371,  371,  414,  101,
			  372,  372,  372,  414,  414,  365,  373,  373,  373,  367,
			   99,  100,   99,  100,   99,  100,  101,  414,  101,  414,

			  101,  414,  368,  371,  371,  371,  374,  377,  377,  377,
			   99,  100,  414,  376,  375,  414,  101,   99,  100,  339,
			  414,  340,  414,  101,  372,  372,  372,  339,  382,  380,
			  381,  414,  373,  373,  373,   99,  100,   99,  100,  414,
			  414,  101,  414,  101,  377,  377,  377,  384,  382,  388,
			  388,  388,   99,  100,  383,   99,  100,  414,  101,   99,
			  100,  101,  414,   99,  100,  101,  389,  414,  339,  101,
			  380,  394,  384,  388,  388,  388,  414,  390,   99,  100,
			  414,   99,  100,  414,  101,  391,  414,  101,  395,  400,
			  400,  400,  414,  414,  396,  397,  401,  402,  401,  391,

			  414,  414,   99,  100,  414,  414,   99,  100,  101,  398,
			  405,  398,  101,  404,  404,  404,  401,  402,  401,  414,
			  403,  414,  414,   99,  100,  339,  414,  380,  414,  101,
			  400,  400,  400,   99,  100,  404,  404,  404,  414,  101,
			  403,  414,   99,  100,  411,  412,  411,  407,  101,  410,
			  413,  410,  414,  414,   99,  100,  411,  412,  411,  414,
			  101,  154,  154,  154,  154,  414,  414,  409,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   57,   57,

			   57,   57,   57,   57,   57,   57,   57,   57,   63,   63,
			   63,   63,   63,   63,   63,   63,   66,   66,   66,   66,
			   66,   66,   66,   66,   84,  414,   84,   84,   84,   84,
			   84,   84,   84,   84,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,  126,  126,  126,  126,  126,  126,
			  126,  126,  127,  127,  127,  127,  127,  127,  127,  127,
			  179,  179,  179,  179,  179,  179,  179,  179,  180,  180,

			  180,  180,  180,  180,  205,  205,  205,  205,  205,  205,
			  205,  205,  228,  228,  228,  228,  228,  228,  250,  250,
			  250,  250,  250,  250,  250,  250,  274,  274,  274,  274,
			  274,  274,  274,  274,  275,  275,  275,  275,  295,  295,
			  295,  295,  295,  295,  314,  314,  314,  314,  314,  314,
			  314,  314,  332,  332,  332,  332,  342,  342,  342,  342,
			  342,  342,  363,  363,  363,  363,  363,  363,    9,  414,
			  414,  414,  414,  414,  414,  414,  414,  414,  414,  414,
			  414,  414,  414,  414,  414,  414,  414,  414,  414,  414,
			  414,  414,  414,  414,  414,  414,  414,  414,  414,  414,

			  414,  414,  414,  414,  414,  414,  414,  414,  414,  414,
			  414,  414,  414,  414,  414,  414,  414,  414,  414,  414,
			  414,  414,  414, yy_Dummy>>,
			1, 723, 1000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1722)
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
			    1,    1,    1,    1,    1,    2,    4,    2,    2,    6,
			    6,    8,    8,    2,    2,  408,   11,    2,   11,    2,
			    2,    2,   29,   29,  406,    4,   33,    4,    4,   33,
			    2,    2,    2,    2,    2,    2,   23,   87,   23,   23,
			   23,   28,   28,   30,   30,   31,   31,   87,   32,   32,

			    4,    4,    4,  124,   28,   37,   37,   39,   39,   31,
			   38,   38,   40,   40,  393,   30,   32,  392,   37,   43,
			   43,   39,   42,   42,   41,   41,   37,  124,   28,   37,
			   44,   44,   38,   40,   41,  148,   32,   45,   45,   54,
			   54,  184,   37,   42,   37,   42,   43,   58,   58,  148,
			   60,   45,   60,   44,   64,   64,   64,   90,   90,   41,
			   43,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,  184,   65,   62,   65,   65,   65,   62,   62,
			   62,   62,   66,   66,  387,   68,   68,  123,   66,   67,
			   67,   68,   69,   69,  175,   67,   70,   70,   69,   94,

			   94,  386,   70,   62,   62,   62,   68,  123,   67,   70,
			   73,   73,  177,   69,   74,   74,   73,   75,   75,  175,
			   74,   76,   76,   75,   77,   77,   74,   76,   78,   78,
			   77,   73,  177,   70,   78,  385,   76,   75,   75,   79,
			   79,   80,   80,   99,   99,   79,   76,   80,  380,   78,
			   74,  379,   77,   81,   81,   80,   82,   82,   97,   81,
			   97,  370,   82,   83,   83,   79,   77,  100,  100,   83,
			   82,   98,   81,   98,   98,   98,  102,  102,  369,   79,
			  103,  103,  102,   83,  104,  104,  103,   83,  105,  105,
			  104,  106,  106,  106,  105,  125,  125,  125,  104,  107,

			  107,  103,   83,  108,  108,  107,  109,  109,  178,  108,
			  102,  360,  109,  110,  110,  126,  126,  111,  111,  110,
			  108,  107,  151,  111,  329,  110,  112,  112,  178,  109,
			  113,  113,  112,  359,  110,  111,  113,  151,  112,  329,
			  113,  114,  114,  354,  115,  115,  351,  114,  347,  110,
			  115,  340,  116,  116,  338,  111,  337,  114,  116,  179,
			  179,  311,  112,  117,  117,  113,  115,  118,  118,  117,
			  196,  196,  196,  118,  119,  119,  116,  117,  310,  118,
			  119,  120,  120,  127,  127,  205,  205,  120,  201,  127,
			  203,  116,  129,  129,  295,  226,  223,  119,  129,  130,

			  130,  120,  201,  118,  203,  130,  131,  131,  225,  226,
			  247,  132,  131,  132,  132,  132,  223,  250,  250,  133,
			  129,  133,  133,  133,  247,  130,  134,  134,  225,  294,
			  131,  249,  134,  292,  129,  135,  135,  136,  136,  130,
			  290,  135,  132,  136,  290,  131,  289,  137,  137,  135,
			  133,  249,  134,  137,  138,  138,  139,  139,  290,  136,
			  138,  137,  139,  140,  140,  273,  134,  141,  141,  140,
			  142,  142,  272,  141,  271,  138,  142,  270,  143,  143,
			  139,  235,  235,  235,  143,  144,  144,  140,  143,  142,
			  328,  144,  274,  274,  141,  139,  348,  145,  145,  146,

			  146,  248,  140,  145,  328,  146,  147,  147,  141,  246,
			  144,  228,  147,  143,  224,  145,  348,  152,  146,  152,
			  152,  152,  153,  153,  147,  153,  153,  153,  155,  155,
			  156,  156,  293,  293,  155,  145,  156,  157,  157,  162,
			  162,  204,  155,  157,  147,  162,  159,  157,  159,  159,
			  159,  161,  161,  378,  156,  202,  153,  161,  164,  164,
			  180,  161,  163,  163,  164,  162,  314,  314,  163,  156,
			  165,  165,  157,  378,  166,  166,  165,  159,  176,  162,
			  166,  164,  158,  163,  167,  167,  161,  150,  165,  399,
			  167,  149,  166,  168,  168,  169,  169,  342,  342,  168,

			  122,  169,  167,  168,  170,  170,  363,  363,  165,  399,
			  170,  121,  166,  171,  171,  171,  101,  169,  261,  261,
			  261,   96,  167,  171,  171,  172,  172,   93,  168,  171,
			  170,  172,  173,  173,   92,  172,   89,   88,  173,   86,
			  174,  174,  173,   85,  170,   72,  174,  181,  181,   71,
			  182,  182,   61,  181,   59,   56,  182,  183,  183,   55,
			  172,  174,  185,  183,  185,  185,  185,  173,  186,  186,
			   52,  181,  182,   50,  186,  187,  187,   49,  188,  188,
			   48,  187,   20,  183,  188,   12,  181,    9,    7,  189,
			  189,    5,  188,  185,  186,  189,    3,  183,    0,  190,

			  190,  191,  191,    0,  187,  190,    0,  191,  186,    0,
			  192,  192,  193,  193,    0,  189,  192,    0,  193,    0,
			  192,  194,  194,    0,  191,  190,    0,  194,  193,  189,
			  195,  195,  198,  198,  199,  199,  195,  194,  198,  190,
			  199,  200,  200,  208,  208,  192,    0,  200,  195,  208,
			    0,  198,  207,  207,    0,  209,  209,    0,  207,    0,
			  199,  209,  208,  200,  210,  210,  211,  211,  195,  209,
			  210,    0,  211,    0,  199,  212,  212,  207,  263,  263,
			  263,  212,  210,  213,  213,  213,  214,  214,    0,  211,
			    0,    0,  214,  213,  213,    0,  212,  215,  215,  213,

			  216,  216,  210,  215,  214,    0,  216,    0,  217,  217,
			  218,  218,  219,  219,  217,    0,  218,    0,  219,    0,
			    0,  216,  217,  215,  214,  220,  220,  221,  221,  222,
			  222,  220,    0,  221,  219,  222,    0,  215,    0,  218,
			    0,  221,    0,  220,    0,    0,  227,  227,  222,  227,
			  227,  227,  229,  229,  230,  230,  231,  231,  229,    0,
			  230,    0,  231,  220,    0,  232,  232,    0,    0,  231,
			  229,  232,    0,  230,    0,  233,  233,  234,  234,    0,
			  227,  233,    0,  234,    0,  237,  237,  232,    0,  233,
			  229,  237,    0,  231,  238,  238,  239,  239,    0,    0,

			  238,    0,  239,  234,  240,  240,  240,  237,  241,  241,
			  241,    0,  238,    0,  240,  240,    0,  234,  241,  241,
			  240,    0,  239,    0,  241,  242,  242,  243,  243,  245,
			  245,  242,  238,  243,    0,  245,  239,  244,  244,  244,
			  267,  267,  267,  252,  252,    0,  242,  244,  244,  252,
			    0,  245,  243,  244,  253,  253,    0,  243,  254,  254,
			  253,  255,  255,    0,  254,  252,    0,  255,  253,  256,
			  256,  256,  257,  257,  279,  279,  279,    0,  257,  256,
			  256,  244,  255,  258,  258,  256,  259,  259,    0,  258,
			  296,  296,  259,  283,  283,  283,  296,  265,  265,  260, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  260,  260,    0,  265,  258,    0,  257,  265,  259,  260,
			  260,  266,  266,  268,  268,  260,    0,  266,    0,  268,
			  269,  269,  276,  276,    0,  266,  269,    0,  276,  291,
			  291,  291,  265,  277,  277,  268,  269,    0,    0,  277,
			    0,  278,  278,  276,    0,    0,  277,  278,    0,  280,
			  280,  281,  281,  281,    0,  280,    0,  282,  282,  288,
			  288,  281,  281,  282,    0,  288,  278,  281,  285,  285,
			  277,  280,    0,    0,  285,  280,    0,    0,  282,    0,
			  286,  286,  286,  301,  301,  301,    0,  285,  288,  280,
			  286,  286,  287,  287,  297,  297,  286,    0,  287,    0,

			  297,  298,  298,  298,  299,  299,    0,  300,  300,    0,
			  299,  298,  298,  300,  305,  305,  305,  298,    0,    0,
			  287,  300,  303,  303,  303,  299,  309,  309,  309,  304,
			  304,    0,  303,  303,  287,  304,  307,  307,  303,  313,
			  313,  313,  307,  308,  308,  308,  315,  315,  315,    0,
			  307,    0,    0,  308,  308,  317,  317,  317,    0,  308,
			  319,  319,    0,  304,  320,  320,  319,  321,  321,  321,
			  320,  323,  323,    0,  324,  324,    0,  323,  356,  356,
			  324,  325,  325,  325,  356,    0,  319,  331,  320,  331,
			  331,    0,  331,  331,  331,  333,  333,  323,  324,  356,

			  319,  333,    0,  320,  334,  334,  335,  335,  336,  336,
			  334,  323,  335,  324,  336,    0,    0,  333,    0,    0,
			  335,  339,  339,  339,  334,  343,  343,  336,  341,  341,
			  341,  343,  344,  344,  345,  345,  346,  346,  344,    0,
			  345,    0,  346,    0,  343,    0,  346,  349,  349,  349,
			  344,  350,  350,  350,  345,  352,    0,  352,  352,  339,
			  352,  352,  352,  355,  355,    0,  357,  357,    0,  355,
			  344,  346,  357,  358,  358,  361,  361,  361,    0,  358,
			  362,  362,  362,    0,    0,  355,  364,  364,  364,  357,
			  365,  365,  366,  366,  367,  367,  365,    0,  366,    0,

			  367,    0,  358,  371,  371,  371,  365,  368,  368,  368,
			  374,  374,    0,  367,  366,    0,  374,  368,  368,  372,
			    0,  372,    0,  368,  372,  372,  372,  373,  374,  373,
			  373,    0,  373,  373,  373,  375,  375,  376,  376,    0,
			    0,  375,    0,  376,  377,  377,  377,  376,  374,  381,
			  381,  381,  382,  382,  375,  383,  383,    0,  382,  384,
			  384,  383,    0,  389,  389,  384,  382,    0,  388,  389,
			  388,  388,  376,  388,  388,  388,    0,  383,  390,  390,
			    0,  391,  391,    0,  390,  384,    0,  391,  389,  394,
			  394,  394,    0,    0,  390,  391,  395,  395,  395,  384,

			    0,    0,  396,  396,    0,    0,  395,  395,  396,  398,
			  398,  398,  395,  397,  397,  397,  401,  401,  401,    0,
			  396,    0,    0,  397,  397,  400,    0,  400,    0,  397,
			  400,  400,  400,  403,  403,  404,  404,  404,    0,  403,
			  396,    0,  407,  407,  409,  409,  409,  403,  407,  410,
			  410,  410,    0,    0,  409,  409,  411,  411,  411,    0,
			  409,  428,  428,  428,  428,    0,    0,  407,  415,  415,
			  415,  415,  415,  415,  415,  415,  415,  415,  416,  416,
			  416,  416,  416,  416,  416,  416,  416,  416,  417,  417,
			  417,  417,  417,  417,  417,  417,  417,  417,  418,  418,

			  418,  418,  418,  418,  418,  418,  418,  418,  419,  419,
			  419,  419,  419,  419,  419,  419,  420,  420,  420,  420,
			  420,  420,  420,  420,  421,    0,  421,  421,  421,  421,
			  421,  421,  421,  421,  422,  422,  422,  422,  422,  422,
			  422,  422,  422,  422,  423,  423,  423,  423,  423,  423,
			  423,  423,  423,  423,  424,  424,  424,  424,  424,  424,
			  424,  424,  424,  424,  425,  425,  425,  425,  425,  425,
			  425,  425,  425,  425,  426,  426,  426,  426,  426,  426,
			  426,  426,  427,  427,  427,  427,  427,  427,  427,  427,
			  429,  429,  429,  429,  429,  429,  429,  429,  430,  430,

			  430,  430,  430,  430,  431,  431,  431,  431,  431,  431,
			  431,  431,  432,  432,  432,  432,  432,  432,  433,  433,
			  433,  433,  433,  433,  433,  433,  434,  434,  434,  434,
			  434,  434,  434,  434,  435,  435,  435,  435,  436,  436,
			  436,  436,  436,  436,  437,  437,  437,  437,  437,  437,
			  437,  437,  438,  438,  438,  438,  439,  439,  439,  439,
			  439,  439,  440,  440,  440,  440,  440,  440,  414,  414,
			  414,  414,  414,  414,  414,  414,  414,  414,  414,  414,
			  414,  414,  414,  414,  414,  414,  414,  414,  414,  414,
			  414,  414,  414,  414,  414,  414,  414,  414,  414,  414,

			  414,  414,  414,  414,  414,  414,  414,  414,  414,  414,
			  414,  414,  414,  414,  414,  414,  414,  414,  414,  414,
			  414,  414,  414, yy_Dummy>>,
			1, 723, 1000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,   33,  693,   53,  688,   57,  685,   59,  687,
			 1668,   64,  682, 1668, 1668, 1668, 1668, 1668, 1668, 1668,
			  670,    0, 1668,   73, 1668, 1668, 1668, 1668,   79,   60,
			   81,   83,   86,   29, 1668, 1668,    0,   93,   98,   95,
			  100,  112,  110,  107,  118,  125,    0, 1668,  647,  643,
			  647, 1668,  667, 1668,  137,  656,  652, 1668,  145,  651,
			  148,  649,  160,    0,  139,  160,  170,  177,  173,  180,
			  184,  597,  596,  198,  202,  205,  209,  212,  216,  227,
			  229,  241,  244,  251,    0,  610,  607,   60,  634,  633,
			  155, 1668,  631,  624,  197, 1668,  618,  256,  258,  231,

			  255,  598,  264,  268,  272,  276,  276,  287,  291,  294,
			  301,  305,  314,  318,  329,  332,  340,  351,  355,  362,
			  369,  577,  565,  157,   79,  280,  303,  371,    0,  380,
			  387,  394,  398,  406,  414,  423,  425,  435,  442,  444,
			  451,  455,  458,  466,  473,  485,  487,  494,   97,  557,
			  554,  286,  504,  510,    0,  516,  518,  525,  566,  533,
			 1668,  539,  527,  550,  546,  558,  562,  572,  581,  583,
			  592,  611,  613,  620,  628,  172,  545,  182,  278,  347,
			  548,  635,  638,  645,  128,  649,  656,  663,  666,  677,
			  687,  689,  698,  700,  709,  718,  368, 1668,  720,  722,

			  729,  350,  529,  352,  506,  373,    0,  740,  731,  743,
			  752,  754,  763,  781,  774,  785,  788,  796,  798,  800,
			  813,  815,  817,  366,  481,  378,  357,  834,  499,  840,
			  842,  844,  853,  863,  865,  479, 1668,  873,  882,  884,
			  902,  906,  913,  915,  935,  917,  475,  372,  467,  401,
			  405,    0,  931,  942,  946,  949,  967,  960,  971,  974,
			  997,  616, 1668,  776, 1668,  985,  999,  938, 1001, 1008,
			  444,  428,  439,  431,  480,    0, 1010, 1021, 1029,  972,
			 1037, 1049, 1045,  991, 1668, 1056, 1078, 1080, 1047,  409,
			  406, 1027,  400,  520,  375,  381,  978, 1082, 1099, 1092,

			 1095, 1081, 1668, 1120, 1117, 1112, 1668, 1124, 1141, 1124,
			  345,  335, 1668, 1137,  554, 1131,    0, 1153, 1668, 1148,
			 1152, 1165, 1668, 1159, 1162, 1179, 1668, 1668,  452,  288,
			 1668, 1177,    0, 1183, 1192, 1194, 1196,  322,  322, 1206,
			  300, 1213,  585, 1213, 1220, 1222, 1224,  317,  466, 1232,
			 1236,  298, 1245,    0,  289, 1251, 1166, 1254, 1261,  299,
			  278, 1260, 1265,  594, 1271, 1278, 1280, 1282, 1305,  250,
			  227, 1288, 1309, 1317, 1298, 1323, 1325, 1342,  523,  220,
			  197, 1334, 1340, 1343, 1347,  209,  167,  136, 1358, 1351,
			 1366, 1369,   80,   86, 1374, 1394, 1390, 1411, 1407,  559,

			 1415, 1414, 1668, 1421, 1433, 1668,   48, 1430,   28, 1442,
			 1447, 1454, 1668, 1668, 1668, 1467, 1477, 1487, 1497, 1505,
			 1513, 1523, 1533, 1543, 1553, 1563, 1571, 1579, 1454, 1587,
			 1593, 1601, 1607, 1615, 1623, 1627, 1633, 1641, 1645, 1651,
			 1657, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  414,    1,  415,  415,  416,  417,  416,  418,  414,
			  414,  414,  414,  414,  414,  414,  414,  414,  414,  414,
			  419,  419,  414,  419,  414,  414,  414,  414,  420,  420,
			  420,  420,  420,  414,  414,  414,  419,  420,  420,  420,
			  420,  420,  420,  420,  420,  420,  421,  414,  421,  421,
			  421,  414,  414,  414,  422,  414,  414,  414,  423,  414,
			  414,  414,  424,  419,  419,  419,  420,  420,  420,  420,
			  420,  414,  414,  420,  420,  420,  420,  420,  420,  420,
			  420,  420,  420,  420,  421,  421,  421,  421,  414,  422,
			  422,  414,  414,  423,  423,  414,  425,  414,  419,  426,

			  427,  414,  420,  420,  420,  420,  414,  420,  420,  420,
			  420,  420,  420,  420,  420,  420,  420,  420,  420,  420,
			  420,  421,  421,  421,  421,  419,  426,  427,  428,  420,
			  420,  420,  414,  414,  420,  420,  420,  420,  420,  420,
			  420,  420,  420,  420,  420,  420,  420,  420,  421,  421,
			  421,  421,  419,  429,  430,  420,  420,  420,  414,  414,
			  414,  420,  420,  420,  420,  420,  420,  420,  420,  420,
			  420,  420,  420,  420,  420,  421,  421,  421,  421,  431,
			  430,  420,  420,  420,  414,  414,  420,  420,  420,  420,
			  420,  420,  420,  420,  420,  420,  414,  414,  420,  420,

			  420,  421,  421,  421,  421,  431,  432,  420,  420,  420,
			  420,  420,  420,  420,  420,  420,  420,  420,  420,  420,
			  420,  420,  420,  421,  421,  421,  421,  433,  432,  420,
			  420,  420,  420,  420,  420,  414,  414,  420,  420,  420,
			  420,  420,  420,  420,  420,  420,  421,  421,  421,  421,
			  434,  435,  420,  420,  420,  420,  420,  420,  420,  420,
			  420,  414,  414,  414,  414,  420,  420,  414,  420,  420,
			  421,  421,  421,  421,  434,  436,  420,  420,  420,  414,
			  420,  420,  420,  414,  414,  420,  420,  420,  420,  421,
			  421,  421,  421,  437,  419,  436,  420,  420,  420,  420,

			  420,  414,  414,  420,  420,  414,  414,  420,  420,  421,
			  421,  421,  414,  421,  437,  419,  438,  414,  414,  420,
			  420,  414,  414,  420,  420,  414,  414,  414,  421,  421,
			  414,  419,  439,  420,  420,  420,  420,  421,  421,  414,
			  419,  419,  439,  420,  420,  420,  420,  421,  421,  414,
			  414,  419,  419,  440,  414,  420,  420,  420,  420,  421,
			  421,  419,  419,  440,  414,  420,  420,  420,  420,  421,
			  421,  419,  419,  414,  420,  420,  420,  414,  421,  421,
			  414,  414,  420,  420,  420,  421,  421,  414,  414,  420,
			  420,  420,  421,  421,  414,  420,  420,  420,  421,  421,

			  414,  414,  414,  420,  414,  414,  421,  420,  421,  420,
			  421,  414,  414,  414,    0,  414,  414,  414,  414,  414,
			  414,  414,  414,  414,  414,  414,  414,  414,  414,  414,
			  414,  414,  414,  414,  414,  414,  414,  414,  414,  414,
			  414, yy_Dummy>>)
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
			   27,   28,   29,   30,   23,   23,   31,   32,   33,   34,
			   35,   23,   36,   37,   38,   39,   40,   23,   23,   41,
			   42,   43,    1,   44,   45,   46,    1,   47,   23,   48,

			   49,   26,   27,   28,   29,   50,   23,   23,   31,   32,
			   33,   34,   35,   23,   51,   37,   52,   53,   54,   23,
			   23,   41,   42,    1,    1,    1,    1,    1,    1,    1,
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
			    1,    1,    7,    7,    7,    8,    7,    9,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,   10,    1,    1,    1,    5,    7,    7,    7,
			    7,    7,    7,    7,    7, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   62,
			   60,    1,    2,   15,   18,   16,   17,    7,    6,   13,
			    5,   11,    8,   59,   14,   12,   10,   19,   59,   59,
			   59,   59,   59,   20,   21,    9,   59,   59,   59,   59,
			   59,   59,   59,   59,   59,   59,   49,   48,   49,   49,
			   49,   61,   51,   52,   61,   51,   54,   55,   61,   54,
			    1,    2,    3,   59,   59,   59,   58,   58,   58,   58,
			   58,    0,    0,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   49,   49,   49,   49,   51,    0,
			    0,   50,   54,    0,    0,   53,    3,    4,   56,   59,

			   59,    0,   58,   58,   58,   29,    0,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   49,   49,   49,   49,   59,   59,   59,    0,   58,
			   58,   58,    0,    0,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   49,   49,
			   49,   49,   56,   59,    0,   58,   58,   58,    0,    0,
			   42,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   49,   49,   49,   49,   59,
			    0,   58,   58,   58,    0,    0,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,    0,   34,   58,   58,

			   58,   49,   49,   49,   49,   59,    0,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   49,   49,   49,   49,   59,    0,   58,
			   58,   58,   58,   58,   58,    0,   38,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   49,   49,   49,   49,
			   59,    0,   58,   58,   28,   58,   58,   58,   58,   58,
			   58,    0,   31,    0,   41,   58,   58,   24,   58,   58,
			   49,   49,   49,   49,   59,    0,   58,   58,   58,   22,
			   58,   58,   58,    0,   40,   58,   58,   58,   58,   49,
			   49,   49,   49,   59,   59,    0,   26,   27,   58,   58,

			   58,    0,   33,   58,   58,    0,   30,   58,   58,   49,
			   49,   49,   44,   49,   59,   59,    0,    0,   36,   58,
			   58,    0,   32,   58,   58,    0,   35,   45,   49,   49,
			   43,   57,    0,   58,   58,   58,   58,   49,   49,    0,
			   59,   59,    0,   58,   58,   58,   58,   49,   49,   57,
			    0,   59,   57,    0,    0,   58,   58,   58,   58,   49,
			   49,   59,   59,    0,    0,   58,   58,   58,   58,   49,
			   49,   57,   57,   57,   58,   58,   58,   23,   49,   49,
			    0,    0,   58,   58,   58,   49,   49,    0,   57,   58,
			   58,   58,   49,   49,    0,   58,   58,   58,   49,   49,

			   57,    0,   39,   58,   25,   46,   49,   58,   49,   58,
			   49,    0,   37,   47,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 1668
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 414
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 415
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

	yyNb_rules: INTEGER = 61
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 62
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
