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
			create an_array.make_filled (0, 0, 1656)
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
			   29,   32,   29,   37,   47,   38,   39,   54,   55,   58,
			   59,   40,   41,  408,   60,   42,   60,   43,   44,   45,
			   63,   63,   60,   48,   60,   49,   50,  406,   37,   38,
			   43,   45,   64,   67,   65,   65,   65,   63,   63,   63,
			   63,   63,   63,  404,   63,   63,   63,   63,   48,   49,

			   63,   63,   63,   63,  397,   69,   63,   63,   96,   67,
			   96,   68,   70,   63,   63,  196,   75,   72,   63,   63,
			   73,  396,   74,   77,   63,   63,  348,   76,  122,   63,
			   63,   63,   63,   73,   89,   90,   93,   94,  123,   78,
			  196,   79,   97,   97,   97,   82,   89,   90,   77,   93,
			   94,   80,   81,   64,  149,   65,   65,   65,  124,  391,
			   97,   97,   97,   80,   95,   95,   96,   95,   95,   95,
			   95,   95,   95,   95,   95,   63,   63,   95,  149,   98,
			   99,   95,   95,   95,   95,  100,   98,   99,   98,   99,
			   98,   99,  100,  390,  100,  385,  100,   98,   99,   63,

			   63,  151,   63,  100,  384,  101,   95,   95,   95,  102,
			  104,  103,   98,   99,   98,   99,   98,   99,  100,  383,
			  100,  377,  100,   98,   99,  376,  107,  171,  368,  100,
			  150,  150,  150,  106,   98,   99,  108,  109,  110,  171,
			  100,   98,   99,   98,   99,   98,   99,  100,  111,  100,
			  107,  100,   98,   99,   98,   99,   63,   63,  100,  115,
			  100,  367,  112,  362,  113,   63,  223,  114,  117,   98,
			   99,  116,   98,   99,  112,  100,   98,   99,  100,  114,
			   98,   99,  100,  174,   98,   99,  100,  219,  359,  118,
			  100,   98,   99,  119,   98,   99,  174,  100,  130,  219,

			  100,  129,   98,   99,  358,  228,  119,  357,  100,  221,
			  128,  133,  349,  132,   98,   99,   98,   99,   98,   99,
			  100,  221,  100,  346,  100,  134,  135,   98,   99,  345,
			  137,   63,   63,  100,  136,  129,  229,  138,  327,   98,
			   99,   98,   99,   98,   99,  100,  326,  100,  314,  100,
			  135,   98,   99,  313,  137,  139,  311,  100,   98,   99,
			   98,   99,  138,  140,  100,  142,  100,  141,   98,   99,
			  143,   63,   99,  307,  100,   98,   99,  100,   98,   99,
			  141,  100,  290,  144,  100,   98,   99,  289,  145,   98,
			   99,  100,   98,   99,  143,  100,   98,   99,  100,   98,

			   99,  288,  100,  153,  154,  100,   98,   99,  336,  155,
			  158,  159,  100,  160,  247,  153,  154,  287,  157,   98,
			   99,  336,  155,   98,   99,  100,  247,  161,  271,  100,
			  157,   98,   99,   98,   99,  291,  292,  100,  270,  100,
			   98,   99,  268,  162,  205,  269,  100,  163,   98,   99,
			  166,  249,  165,  246,  100,  245,  162,  269,  164,  244,
			  163,   98,   99,   98,   99,   98,   99,  100,  222,  100,
			  164,  100,  220,  167,  124,  166,  150,  150,  150,  168,
			   98,   99,  169,  170,   63,   63,  100,   63,   63,   63,
			   98,   99,   63,   63,  177,  205,  100,   98,   99,   98,

			   99,  291,  292,  100,  201,  100,  199,  179,  308,  181,
			   98,   99,  309,  198,  178,  197,  100,  180,   63,   98,
			   99,  335,   98,   99,  309,  100,  173,  178,  100,   98,
			   99,  172,  179,  335,  181,  100,  182,   98,   99,  156,
			  183,  351,  352,  100,  148,  184,  147,  185,  182,  146,
			   98,   99,   98,   99,  131,  186,  100,  127,  100,   98,
			   99,   96,  188,   98,   99,  100,  351,  352,  187,  100,
			   98,   99,  191,  192,  191,   94,  100,  191,  192,  191,
			  193,  189,   98,   99,   98,   99,   91,  188,  100,  190,
			  100,   98,   99,   90,  194,   87,  121,  100,   98,   99,

			  120,  190,   98,   99,  100,  193,  105,   61,  100,   91,
			   98,   99,  195,   91,   98,   99,  100,   98,   99,  194,
			  100,   87,  202,  100,  203,   98,   99,   98,   99,   87,
			   86,  100,   85,  100,   84,  202,  204,   98,   99,  208,
			  206,   98,   99,  100,   98,   99,  207,  100,  204,   71,
			  100,   62,  206,  209,  212,   98,   99,  233,  234,  233,
			   61,  100,  412,  210,  211,  209,   98,   99,   98,   99,
			   56,  213,  100,   52,  100,  210,   47,   98,   99,  212,
			  412,  412,  214,  100,   98,   99,  215,   98,   99,  412,
			  100,   98,   99,  100,   98,   99,  216,  100,   98,   99,

			  100,   98,   99,  412,  100,   98,   99,  100,  412,  218,
			  217,  100,  227,  226,   98,   99,  225,  412,  412,  230,
			  100,  412,  217,  233,  234,  233,   98,   99,  231,  412,
			   98,   99,  100,   98,   99,  232,  100,   98,   99,  100,
			   98,   99,  412,  100,  235,  412,  100,   98,   99,   98,
			   99,   98,   99,  100,  238,  100,  236,  100,  237,   98,
			   99,   98,   99,  412,  412,  100,  412,  100,  236,  241,
			  412,  240,  412,  242,   63,   63,  239,   63,   63,   63,
			  243,   98,   99,   98,   99,   98,   99,  100,  412,  100,
			  412,  100,  412,  412,   98,   99,  412,  412,  252,  250,

			  100,  412,  251,   98,   99,   98,   99,  412,   63,  100,
			  412,  100,   98,   99,   98,   99,  253,  254,  100,  412,
			  100,   98,   99,  259,  260,  259,  412,  100,  259,  260,
			  259,  255,  257,  412,  256,  261,  262,  261,   98,   99,
			  261,  262,  261,  255,  100,   98,   99,  258,   98,   99,
			  412,  100,   98,   99,  100,  265,  265,  265,  100,  258,
			  412,   98,   99,  412,  412,   98,   99,  100,  412,  263,
			  412,  100,   98,   99,   98,   99,  412,  264,  100,  412,
			  100,  412,  264,  267,   98,   99,   98,   99,  275,  412,
			  100,  412,  100,  412,  274,  277,  277,  277,  412,  266,

			  412,  412,   98,   99,  412,   98,   99,  276,  100,   98,
			   99,  100,   98,   99,  412,  100,  412,  412,  100,   98,
			   99,  281,  282,  281,  412,  100,  412,   98,   99,  283,
			  279,   98,   99,  100,  280,  412,  278,  100,  265,  265,
			  265,  284,   98,   99,   98,   99,   98,   99,  100,  412,
			  100,  412,  100,  412,  283,   98,   99,   98,   99,  412,
			  286,  100,  412,  100,  285,  412,  412,  294,  295,  277,
			  277,  277,   98,   99,  299,  300,  299,  412,  100,  412,
			   98,   99,  296,  412,   98,   99,  100,  281,  282,  281,
			  100,  289,  310,  289,  297,  412,   98,   99,  298,  412, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  412,  301,  100,  303,  304,  303,   98,   99,  412,  412,
			  298,  412,  100,   98,   99,  302,   98,   99,  412,  100,
			   98,   99,  100,   98,   99,  412,  100,  412,  412,  100,
			  412,  315,  316,  315,  305,  412,  412,   98,   99,  412,
			  412,   98,   99,  100,  412,  306,  305,  100,   98,   99,
			  299,  300,  299,  412,  100,  319,  320,  319,  317,  303,
			  304,  303,  318,   98,   99,   98,   99,   98,   99,  100,
			  412,  100,  412,  100,  323,  324,  323,  307,  325,  307,
			  412,  322,  412,  412,   98,   99,  311,  328,  311,  412,
			  100,  329,  329,  329,  315,  316,  315,  321,   98,   99,

			  412,   98,   99,  412,  100,   98,   99,  100,  319,  320,
			  319,  100,  412,   98,   99,  323,  324,  323,  412,  100,
			   98,   99,   98,   99,  331,  332,  100,  337,  100,  338,
			  339,  333,  329,  329,  329,  412,  331,  334,  332,   98,
			   99,  344,  341,  333,  412,  100,   98,   99,  412,  412,
			  334,  412,  100,  347,  347,  347,  350,  350,  350,  342,
			  343,   98,   99,   98,   99,   98,   99,  100,  412,  100,
			  412,  100,   98,   99,  347,  347,  347,  412,  100,  412,
			  353,  354,  356,  412,  412,  355,  347,  347,  347,  348,
			  337,  412,  338,  360,  412,  350,  350,  350,   98,   99,

			   98,   99,   98,   99,  100,  412,  100,  356,  100,   98,
			   99,  369,  369,  369,  412,  100,  370,  370,  370,  412,
			  363,  364,  371,  371,  371,  365,   98,   99,   98,   99,
			   98,   99,  100,  412,  100,  412,  100,  412,  366,  369,
			  369,  369,  372,  375,  375,  375,   98,   99,  412,  374,
			  373,  412,  100,   98,   99,  337,  412,  338,  412,  100,
			  370,  370,  370,  337,  380,  378,  379,  412,  371,  371,
			  371,   98,   99,   98,   99,  412,  412,  100,  412,  100,
			  375,  375,  375,  382,  386,  386,  386,   98,   99,  412,
			  381,   98,   99,  100,   98,   99,  412,  100,  412,  412,

			  100,  387,  412,  412,  337,  412,  378,  392,  382,  386,
			  386,  386,  412,  388,  412,   98,   99,   98,   99,  412,
			  389,  100,  412,  100,   98,   99,  398,  398,  398,  412,
			  100,  412,  389,  394,  399,  400,  399,  412,  395,  412,
			  393,   98,   99,  412,   98,   99,  412,  100,  412,  412,
			  100,  402,  402,  402,  396,  403,  396,  412,  337,  401,
			  378,   98,   99,  398,  398,  398,  412,  100,  399,  400,
			  399,   98,   99,  402,  402,  402,  412,  100,   98,   99,
			  409,  410,  409,  412,  100,  405,  408,  411,  408,  412,
			   98,   99,  409,  410,  409,  412,  100,  152,  152,  152,

			  152,  412,  412,  407,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   63,   63,   63,   63,   63,   63,
			   63,   63,   66,   66,   66,   66,   66,   66,   66,   66,
			   83,  412,   83,   83,   83,   83,   83,   83,   83,   83,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,

			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			  125,  125,  125,  125,  125,  125,  125,  125,  126,  126,
			  126,  126,  126,  126,  126,  126,  175,  175,  175,  175,
			  175,  175,  175,  175,  176,  176,  176,  176,  176,  176,
			  200,  200,  200,  200,  200,  200,  200,  200,  224,  224,
			  224,  224,  224,  224,  248,  248,  248,  248,  248,  248,
			  248,  248,  272,  272,  272,  272,  272,  272,  272,  272,
			  273,  273,  273,  273,  293,  293,  293,  293,  293,  293,
			  312,  312,  312,  312,  312,  312,  312,  312,  330,  330,
			  330,  330,  340,  340,  340,  340,  340,  340,  361,  361,

			  361,  361,  361,  361,    9,  412,  412,  412,  412,  412,
			  412,  412,  412,  412,  412,  412,  412,  412,  412,  412,
			  412,  412,  412,  412,  412,  412,  412,  412,  412,  412,
			  412,  412,  412,  412,  412,  412,  412,  412,  412,  412,
			  412,  412,  412,  412,  412,  412,  412,  412,  412,  412,
			  412,  412,  412,  412,  412,  412,  412, yy_Dummy>>,
			1, 657, 1000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1656)
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
			    1,    1,    1,    2,    4,    2,    2,    6,    6,    8,
			    8,    2,    2,  406,   11,    2,   11,    2,    2,    2,
			   28,   28,   60,    4,   60,    4,    4,  404,    2,    2,
			    2,    2,   23,   28,   23,   23,   23,   29,   29,   30,
			   30,   31,   31,  397,   32,   32,   37,   37,    4,    4,

			   38,   38,   39,   39,  391,   31,   40,   40,   96,   37,
			   96,   30,   32,   41,   41,  171,   39,   37,   42,   42,
			   37,  390,   38,   41,   43,   43,  385,   40,   86,   44,
			   44,   45,   45,   37,   54,   54,   58,   58,   86,   42,
			  171,   42,   64,   64,   64,   45,   89,   89,   41,   93,
			   93,   43,   44,   65,  123,   65,   65,   65,   97,  384,
			   97,   97,   97,   43,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   98,   98,   62,  123,   66,
			   66,   62,   62,   62,   62,   66,   67,   67,   68,   68,
			   69,   69,   67,  383,   68,  378,   69,   70,   70,   99,

			   99,  125,  125,   70,  377,   67,   62,   62,   62,   68,
			   70,   69,   72,   72,   73,   73,   74,   74,   72,  376,
			   73,  368,   74,   75,   75,  367,   73,  146,  358,   75,
			  124,  124,  124,   72,   76,   76,   74,   74,   75,  146,
			   76,   78,   78,   77,   77,   79,   79,   78,   75,   77,
			   73,   79,   80,   80,   81,   81,  175,  175,   80,   79,
			   81,  357,   76,  352,   77,  200,  200,   78,   81,   82,
			   82,   80,  104,  104,   76,   82,  101,  101,  104,   78,
			  102,  102,  101,  149,  103,  103,  102,  196,  349,   82,
			  103,  106,  106,   82,  107,  107,  149,  106,  103,  196,

			  107,  102,  108,  108,  346,  205,   82,  345,  108,  198,
			  101,  107,  338,  106,  109,  109,  110,  110,  111,  111,
			  109,  198,  110,  336,  111,  108,  109,  112,  112,  335,
			  111,  248,  248,  112,  110,  109,  205,  112,  309,  113,
			  113,  114,  114,  115,  115,  113,  308,  114,  293,  115,
			  109,  116,  116,  292,  111,  113,  290,  116,  117,  117,
			  118,  118,  112,  114,  117,  116,  118,  115,  119,  119,
			  117,  126,  126,  287,  119,  128,  128,  126,  129,  129,
			  115,  128,  271,  118,  129,  130,  130,  270,  119,  134,
			  134,  130,  132,  132,  117,  134,  133,  133,  132,  135,

			  135,  269,  133,  128,  129,  135,  136,  136,  327,  130,
			  133,  134,  136,  135,  222,  128,  129,  268,  132,  137,
			  137,  327,  130,  138,  138,  137,  222,  136,  247,  138,
			  132,  139,  139,  140,  140,  272,  272,  139,  246,  140,
			  141,  141,  244,  137,  228,  245,  141,  138,  142,  142,
			  141,  224,  140,  221,  142,  220,  137,  245,  139,  219,
			  138,  143,  143,  144,  144,  145,  145,  143,  199,  144,
			  139,  145,  197,  142,  150,  141,  150,  150,  150,  143,
			  153,  153,  144,  145,  151,  151,  153,  151,  151,  151,
			  154,  154,  291,  291,  153,  180,  154,  155,  155,  157,

			  157,  312,  312,  155,  176,  157,  174,  155,  288,  157,
			  158,  158,  288,  173,  154,  172,  158,  156,  151,  159,
			  159,  326,  160,  160,  288,  159,  148,  154,  160,  161,
			  161,  147,  155,  326,  157,  161,  158,  162,  162,  131,
			  159,  340,  340,  162,  122,  160,  121,  161,  158,  120,
			  163,  163,  164,  164,  105,  162,  163,  100,  164,  165,
			  165,   95,  164,  166,  166,  165,  361,  361,  163,  166,
			  168,  168,  167,  167,  167,   92,  168,  191,  191,  191,
			  168,  165,  167,  167,  169,  169,   91,  164,  167,  166,
			  169,  170,  170,   88,  169,   87,   85,  170,  177,  177,

			   84,  166,  178,  178,  177,  168,   71,   61,  178,   59,
			  179,  179,  170,   56,  181,  181,  179,  182,  182,  169,
			  181,   55,  177,  182,  178,  183,  183,  184,  184,   52,
			   50,  183,   49,  184,   48,  177,  179,  185,  185,  183,
			  181,  186,  186,  185,  187,  187,  182,  186,  179,   33,
			  187,   20,  181,  184,  187,  188,  188,  233,  233,  233,
			   12,  188,    9,  185,  186,  184,  189,  189,  190,  190,
			    7,  188,  189,    5,  190,  185,    3,  193,  193,  187,
			    0,    0,  189,  193,  194,  194,  190,  195,  195,    0,
			  194,  202,  202,  195,  203,  203,  193,  202,  204,  204,

			  203,  206,  206,    0,  204,  207,  207,  206,    0,  195,
			  194,  207,  204,  203,  208,  208,  202,    0,    0,  206,
			  208,    0,  194,  209,  209,  209,  210,  210,  207,    0,
			  211,  211,  210,  209,  209,  208,  211,  212,  212,  209,
			  213,  213,    0,  212,  210,    0,  213,  214,  214,  215,
			  215,  216,  216,  214,  213,  215,  211,  216,  212,  217,
			  217,  218,  218,    0,    0,  217,    0,  218,  211,  216,
			    0,  215,    0,  217,  223,  223,  214,  223,  223,  223,
			  218,  225,  225,  226,  226,  227,  227,  225,    0,  226,
			    0,  227,    0,    0,  230,  230,    0,    0,  227,  225,

			  230,    0,  226,  231,  231,  232,  232,    0,  223,  231,
			    0,  232,  235,  235,  236,  236,  230,  231,  235,    0,
			  236,  237,  237,  259,  259,  259,    0,  237,  238,  238,
			  238,  232,  236,    0,  235,  239,  239,  239,  238,  238,
			  261,  261,  261,  232,  238,  239,  239,  237,  240,  240,
			    0,  239,  241,  241,  240,  242,  242,  242,  241,  237,
			    0,  243,  243,    0,    0,  242,  242,  243,    0,  240,
			    0,  242,  250,  250,  251,  251,    0,  241,  250,    0,
			  251,    0,  241,  243,  252,  252,  253,  253,  251,    0,
			  252,    0,  253,    0,  250,  254,  254,  254,    0,  242,

			    0,    0,  255,  255,    0,  254,  254,  253,  255,  256,
			  256,  254,  257,  257,    0,  256,    0,    0,  257,  263,
			  263,  258,  258,  258,    0,  263,    0,  264,  264,  263,
			  256,  258,  258,  264,  257,    0,  255,  258,  265,  265,
			  265,  264,  266,  266,  267,  267,  274,  274,  266,    0,
			  267,    0,  274,    0,  263,  275,  275,  276,  276,    0,
			  267,  275,    0,  276,  266,    0,    0,  274,  275,  277,
			  277,  277,  278,  278,  279,  279,  279,    0,  278,    0,
			  280,  280,  276,    0,  279,  279,  280,  281,  281,  281,
			  279,  289,  289,  289,  278,    0,  283,  283,  278,    0, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,  280,  283,  284,  284,  284,  285,  285,    0,    0,
			  278,    0,  285,  284,  284,  283,  286,  286,    0,  284,
			  294,  294,  286,  295,  295,    0,  294,    0,    0,  295,
			    0,  296,  296,  296,  285,    0,    0,  297,  297,    0,
			    0,  296,  296,  297,    0,  286,  285,  296,  298,  298,
			  299,  299,  299,    0,  298,  301,  301,  301,  297,  303,
			  303,  303,  298,  302,  302,  301,  301,  305,  305,  302,
			    0,  301,    0,  305,  306,  306,  306,  307,  307,  307,
			    0,  305,    0,    0,  306,  306,  311,  311,  311,    0,
			  306,  313,  313,  313,  315,  315,  315,  302,  317,  317,

			    0,  318,  318,    0,  317,  321,  321,  318,  319,  319,
			  319,  321,    0,  322,  322,  323,  323,  323,    0,  322,
			  331,  331,  334,  334,  317,  318,  331,  329,  334,  329,
			  329,  321,  329,  329,  329,    0,  317,  322,  318,  332,
			  332,  334,  331,  321,    0,  332,  333,  333,    0,    0,
			  322,    0,  333,  337,  337,  337,  339,  339,  339,  332,
			  333,  341,  341,  342,  342,  343,  343,  341,    0,  342,
			    0,  343,  344,  344,  347,  347,  347,    0,  344,    0,
			  341,  342,  344,    0,    0,  343,  348,  348,  348,  337,
			  350,    0,  350,  350,    0,  350,  350,  350,  353,  353,

			  354,  354,  355,  355,  353,    0,  354,  344,  355,  356,
			  356,  359,  359,  359,    0,  356,  360,  360,  360,    0,
			  353,  354,  362,  362,  362,  355,  363,  363,  364,  364,
			  365,  365,  363,    0,  364,    0,  365,    0,  356,  369,
			  369,  369,  363,  366,  366,  366,  372,  372,    0,  365,
			  364,    0,  372,  366,  366,  370,    0,  370,    0,  366,
			  370,  370,  370,  371,  372,  371,  371,    0,  371,  371,
			  371,  373,  373,  374,  374,    0,    0,  373,    0,  374,
			  375,  375,  375,  374,  379,  379,  379,  380,  380,    0,
			  373,  381,  381,  380,  382,  382,    0,  381,    0,    0,

			  382,  380,    0,    0,  386,    0,  386,  386,  374,  386,
			  386,  386,    0,  381,    0,  387,  387,  388,  388,    0,
			  382,  387,    0,  388,  389,  389,  392,  392,  392,    0,
			  389,    0,  382,  388,  393,  393,  393,    0,  389,    0,
			  387,  394,  394,    0,  393,  393,    0,  394,    0,    0,
			  393,  395,  395,  395,  396,  396,  396,    0,  398,  394,
			  398,  395,  395,  398,  398,  398,    0,  395,  399,  399,
			  399,  401,  401,  402,  402,  402,    0,  401,  405,  405,
			  407,  407,  407,    0,  405,  401,  408,  408,  408,    0,
			  407,  407,  409,  409,  409,    0,  407,  426,  426,  426,

			  426,    0,    0,  405,  413,  413,  413,  413,  413,  413,
			  413,  413,  413,  413,  414,  414,  414,  414,  414,  414,
			  414,  414,  414,  414,  415,  415,  415,  415,  415,  415,
			  415,  415,  415,  415,  416,  416,  416,  416,  416,  416,
			  416,  416,  416,  416,  417,  417,  417,  417,  417,  417,
			  417,  417,  418,  418,  418,  418,  418,  418,  418,  418,
			  419,    0,  419,  419,  419,  419,  419,  419,  419,  419,
			  420,  420,  420,  420,  420,  420,  420,  420,  420,  420,
			  421,  421,  421,  421,  421,  421,  421,  421,  421,  421,
			  422,  422,  422,  422,  422,  422,  422,  422,  422,  422,

			  423,  423,  423,  423,  423,  423,  423,  423,  423,  423,
			  424,  424,  424,  424,  424,  424,  424,  424,  425,  425,
			  425,  425,  425,  425,  425,  425,  427,  427,  427,  427,
			  427,  427,  427,  427,  428,  428,  428,  428,  428,  428,
			  429,  429,  429,  429,  429,  429,  429,  429,  430,  430,
			  430,  430,  430,  430,  431,  431,  431,  431,  431,  431,
			  431,  431,  432,  432,  432,  432,  432,  432,  432,  432,
			  433,  433,  433,  433,  434,  434,  434,  434,  434,  434,
			  435,  435,  435,  435,  435,  435,  435,  435,  436,  436,
			  436,  436,  437,  437,  437,  437,  437,  437,  438,  438,

			  438,  438,  438,  438,  412,  412,  412,  412,  412,  412,
			  412,  412,  412,  412,  412,  412,  412,  412,  412,  412,
			  412,  412,  412,  412,  412,  412,  412,  412,  412,  412,
			  412,  412,  412,  412,  412,  412,  412,  412,  412,  412,
			  412,  412,  412,  412,  412,  412,  412,  412,  412,  412,
			  412,  412,  412,  412,  412,  412,  412, yy_Dummy>>,
			1, 657, 1000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,   31,  673,   51,  670,   55,  667,   57,  662,
			 1604,   62,  657, 1604, 1604, 1604, 1604, 1604, 1604, 1604,
			  639,    0, 1604,   69, 1604, 1604, 1604, 1604,   58,   75,
			   77,   79,   82,  602, 1604, 1604,    0,   84,   88,   90,
			   94,  101,  106,  112,  117,  119,    0, 1604,  601,  598,
			  604, 1604,  626, 1604,  132,  618,  610, 1604,  134,  606,
			   70,  604,  163,    0,  127,  140,  167,  174,  176,  178,
			  185,  556,  200,  202,  204,  211,  222,  231,  229,  233,
			  240,  242,  257,    0,  567,  564,  101,  592,  590,  144,
			 1604,  583,  572,  147, 1604,  558,  106,  145,  163,  187,

			  539,  264,  268,  272,  260,  539,  279,  282,  290,  302,
			  304,  306,  315,  327,  329,  331,  339,  346,  348,  356,
			  515,  511,  514,  130,  215,  189,  359,    0,  363,  366,
			  373,  524,  380,  384,  377,  387,  394,  407,  411,  419,
			  421,  428,  436,  449,  451,  453,  189,  497,  493,  247,
			  461,  472,    0,  468,  478,  485,  502,  487,  498,  507,
			  510,  517,  525,  538,  540,  547,  551,  570,  558,  572,
			  579,   93,  482,  483,  476,  244,  492,  586,  590,  598,
			  480,  602,  605,  613,  615,  625,  629,  632,  643,  654,
			  656,  575, 1604,  665,  672,  675,  249,  446,  271,  433,

			  253,    0,  679,  682,  686,  292,  689,  693,  702,  721,
			  714,  718,  725,  728,  735,  737,  739,  747,  749,  429,
			  422,  423,  376,  762,  439,  769,  771,  773,  428, 1604,
			  782,  791,  793,  655, 1604,  800,  802,  809,  826,  833,
			  836,  840,  853,  849,  408,  407,  404,  398,  319,    0,
			  860,  862,  872,  874,  893,  890,  897,  900,  919,  821,
			 1604,  838, 1604,  907,  915,  936,  930,  932,  384,  355,
			  354,  348,  423,    0,  934,  943,  945,  967,  960,  972,
			  968,  985, 1604,  984, 1001,  994, 1004,  336,  474,  989,
			  323,  480,  301,  335, 1008, 1011, 1029, 1025, 1036, 1048,

			 1604, 1053, 1051, 1057, 1604, 1055, 1072, 1075,  313,  312,
			 1604, 1084,  489, 1076,    0, 1092, 1604, 1086, 1089, 1106,
			 1604, 1093, 1101, 1113, 1604, 1604,  483,  372, 1604, 1117,
			    0, 1108, 1127, 1134, 1110,  295,  291, 1138,  263, 1141,
			  529, 1149, 1151, 1153, 1160,  276,  274, 1159, 1171,  240,
			 1180,    0,  211, 1186, 1188, 1190, 1197,  227,  195, 1196,
			 1201,  554, 1207, 1214, 1216, 1218, 1241,  197,  187, 1224,
			 1245, 1253, 1234, 1259, 1261, 1278,  189,  173,  146, 1269,
			 1275, 1279, 1282,  167,  125,   78, 1294, 1303, 1305, 1312,
			   84,   76, 1311, 1332, 1329, 1349, 1352,   63, 1348, 1366,

			 1604, 1359, 1371, 1604,   51, 1366,   26, 1378, 1384, 1390,
			 1604, 1604, 1604, 1403, 1413, 1423, 1433, 1441, 1449, 1459,
			 1469, 1479, 1489, 1499, 1507, 1515, 1390, 1523, 1529, 1537,
			 1543, 1551, 1559, 1563, 1569, 1577, 1581, 1587, 1593, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  412,    1,  413,  413,  414,  415,  414,  416,  412,
			  412,  412,  412,  412,  412,  412,  412,  412,  412,  412,
			  417,  417,  412,  417,  412,  412,  412,  412,  418,  418,
			  418,  418,  418,  412,  412,  412,  417,  418,  418,  418,
			  418,  418,  418,  418,  418,  418,  419,  412,  419,  419,
			  419,  412,  412,  412,  420,  412,  412,  412,  421,  412,
			  412,  412,  422,  417,  417,  417,  418,  418,  418,  418,
			  418,  412,  418,  418,  418,  418,  418,  418,  418,  418,
			  418,  418,  418,  419,  419,  419,  419,  412,  420,  420,
			  412,  412,  421,  421,  412,  423,  412,  417,  424,  425,

			  412,  418,  418,  418,  418,  412,  418,  418,  418,  418,
			  418,  418,  418,  418,  418,  418,  418,  418,  418,  418,
			  419,  419,  419,  419,  417,  424,  425,  426,  418,  418,
			  418,  412,  418,  418,  418,  418,  418,  418,  418,  418,
			  418,  418,  418,  418,  418,  418,  419,  419,  419,  419,
			  417,  427,  428,  418,  418,  418,  412,  418,  418,  418,
			  418,  418,  418,  418,  418,  418,  418,  418,  418,  418,
			  418,  419,  419,  419,  419,  429,  428,  418,  418,  418,
			  412,  418,  418,  418,  418,  418,  418,  418,  418,  418,
			  418,  412,  412,  418,  418,  418,  419,  419,  419,  419,

			  429,  430,  418,  418,  418,  412,  418,  418,  418,  418,
			  418,  418,  418,  418,  418,  418,  418,  418,  418,  419,
			  419,  419,  419,  431,  430,  418,  418,  418,  412,  412,
			  418,  418,  418,  412,  412,  418,  418,  418,  418,  418,
			  418,  418,  418,  418,  419,  419,  419,  419,  432,  433,
			  418,  418,  418,  418,  418,  418,  418,  418,  418,  412,
			  412,  412,  412,  418,  418,  412,  418,  418,  419,  419,
			  419,  419,  432,  434,  418,  418,  418,  412,  418,  418,
			  418,  412,  412,  418,  418,  418,  418,  419,  419,  419,
			  419,  435,  417,  434,  418,  418,  418,  418,  418,  412,

			  412,  418,  418,  412,  412,  418,  418,  419,  419,  419,
			  412,  419,  435,  417,  436,  412,  412,  418,  418,  412,
			  412,  418,  418,  412,  412,  412,  419,  419,  412,  417,
			  437,  418,  418,  418,  418,  419,  419,  412,  417,  417,
			  437,  418,  418,  418,  418,  419,  419,  412,  412,  417,
			  417,  438,  412,  418,  418,  418,  418,  419,  419,  417,
			  417,  438,  412,  418,  418,  418,  418,  419,  419,  417,
			  417,  412,  418,  418,  418,  412,  419,  419,  412,  412,
			  418,  418,  418,  419,  419,  412,  412,  418,  418,  418,
			  419,  419,  412,  418,  418,  418,  419,  419,  412,  412,

			  412,  418,  412,  412,  419,  418,  419,  418,  419,  412,
			  412,  412,    0,  412,  412,  412,  412,  412,  412,  412,
			  412,  412,  412,  412,  412,  412,  412,  412,  412,  412,
			  412,  412,  412,  412,  412,  412,  412,  412,  412, yy_Dummy>>)
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

			   25,   26,   27,   28,   29,   30,   23,   23,   31,   32,
			   33,   34,   35,   23,   49,   37,   50,   51,   52,   23,
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
			    7,    7,    7, yy_Dummy>>)
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
			   58,    0,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   49,   49,   49,   49,   51,    0,    0,
			   50,   54,    0,    0,   53,    3,    4,   56,   59,   59,

			    0,   58,   58,   58,   29,    0,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   49,   49,   49,   49,   59,   59,   59,    0,   58,   58,
			   58,    0,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   49,   49,   49,   49,
			   56,   59,    0,   58,   58,   58,    0,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   49,   49,   49,   49,   59,    0,   58,   58,   58,
			    0,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,    0,   34,   58,   58,   58,   49,   49,   49,   49,

			   59,    0,   58,   58,   58,    0,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   49,
			   49,   49,   49,   59,    0,   58,   58,   58,    0,   42,
			   58,   58,   58,    0,   38,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   49,   49,   49,   49,   59,    0,
			   58,   58,   28,   58,   58,   58,   58,   58,   58,    0,
			   31,    0,   41,   58,   58,   24,   58,   58,   49,   49,
			   49,   49,   59,    0,   58,   58,   58,   22,   58,   58,
			   58,    0,   40,   58,   58,   58,   58,   49,   49,   49,
			   49,   59,   59,    0,   26,   27,   58,   58,   58,    0,

			   33,   58,   58,    0,   30,   58,   58,   49,   49,   49,
			   44,   49,   59,   59,    0,    0,   36,   58,   58,    0,
			   32,   58,   58,    0,   35,   45,   49,   49,   43,   57,
			    0,   58,   58,   58,   58,   49,   49,    0,   59,   59,
			    0,   58,   58,   58,   58,   49,   49,   57,    0,   59,
			   57,    0,    0,   58,   58,   58,   58,   49,   49,   59,
			   59,    0,    0,   58,   58,   58,   58,   49,   49,   57,
			   57,   57,   58,   58,   58,   23,   49,   49,    0,    0,
			   58,   58,   58,   49,   49,    0,   57,   58,   58,   58,
			   49,   49,    0,   58,   58,   58,   49,   49,   57,    0,

			   39,   58,   25,   46,   49,   58,   49,   58,   49,    0,
			   37,   47,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 1604
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 412
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 413
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
