note
	component:   "openEHR ADL Tools"
	description: "Scanner for ADL syntax items"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ADL_2_SCANNER

inherit
	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton,
			output as print_out
		end

	ADL_2_TOKENS
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
--|#line 70 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 70")
end
-- Ignore separators
else
--|#line 71 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 71")
end
in_lineno := in_lineno + text_count
end
else
if yy_act = 3 then
--|#line 76 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 76")
end
-- Ignore comments
else
--|#line 77 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 77")
end
in_lineno := in_lineno + 1
end
end
else
if yy_act <= 6 then
if yy_act = 5 then
--|#line 81 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 81")
end
last_token := Minus_code
else
--|#line 82 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 82")
end
last_token := Plus_code
end
else
if yy_act = 7 then
--|#line 83 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 83")
end
last_token := Star_code
else
--|#line 84 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 84")
end
last_token := Slash_code
end
end
end
else
if yy_act <= 12 then
if yy_act <= 10 then
if yy_act = 9 then
--|#line 85 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 85")
end
last_token := Caret_code
else
--|#line 86 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 86")
end
last_token := Equal_code
end
else
if yy_act = 11 then
--|#line 87 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 87")
end
last_token := Dot_code
else
--|#line 88 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 88")
end
last_token := Semicolon_code
end
end
else
if yy_act <= 14 then
if yy_act = 13 then
--|#line 89 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 89")
end
last_token := Comma_code
else
--|#line 90 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 90")
end
last_token := Colon_code
end
else
if yy_act = 15 then
--|#line 91 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 91")
end
last_token := Exclamation_code
else
--|#line 92 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 92")
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
--|#line 93 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 93")
end
last_token := Right_parenthesis_code
else
--|#line 94 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 94")
end
last_token := Dollar_code
end
else
if yy_act = 19 then
--|#line 95 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 95")
end
last_token := Question_mark_code
else
--|#line 97 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 97")
end
last_token := Left_bracket_code
end
end
else
if yy_act <= 22 then
if yy_act = 21 then
--|#line 98 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 98")
end
last_token := Right_bracket_code
else
--|#line 102 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 102")
end

				last_token := SYM_ARCHETYPE
			
end
else
if yy_act = 23 then
--|#line 106 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 106")
end

				last_token := SYM_TEMPLATE_OVERLAY
			
else
--|#line 110 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 110")
end

				last_token := SYM_TEMPLATE
			
end
end
end
else
if yy_act <= 28 then
if yy_act <= 26 then
if yy_act = 25 then
--|#line 114 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 114")
end

				last_token := SYM_OPERATIONAL_TEMPLATE
			
else
--|#line 118 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 118")
end

				last_token := SYM_ADL_VERSION
			
end
else
if yy_act = 27 then
--|#line 122 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 122")
end

				last_token := SYM_RM_RELEASE
			
else
--|#line 126 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 126")
end

				last_token := SYM_IS_CONTROLLED
			
end
end
else
if yy_act <= 30 then
if yy_act = 29 then
--|#line 130 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 130")
end

				last_token := SYM_IS_GENERATED
			
else
--|#line 134 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 134")
end

				last_token := SYM_UID
			
end
else
--|#line 138 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 138")
end

				last_token := SYM_SPECIALIZE
				in_lineno := in_lineno + 1
			
end
end
end
end
else
if yy_act <= 47 then
if yy_act <= 39 then
if yy_act <= 35 then
if yy_act <= 33 then
if yy_act = 32 then
--|#line 144 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 144")
end

				last_token := SYM_LANGUAGE
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				language_text_start_line := in_lineno
			
else
--|#line 151 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 151")
end

				last_token := SYM_DESCRIPTION
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				description_text_start_line := in_lineno
			
end
else
if yy_act = 34 then
--|#line 158 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 158")
end

				last_token := SYM_DEFINITION
				set_start_condition (IN_CADL_SECTION)
				in_lineno := in_lineno + 1
				definition_text_start_line := in_lineno
			
else
--|#line 165 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 165")
end

				last_token := SYM_RULES
				set_start_condition (IN_RULES_SECTION)
				in_lineno := in_lineno + 1
				rules_text_start_line := in_lineno
			
end
end
else
if yy_act <= 37 then
if yy_act = 36 then
--|#line 172 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 172")
end

				last_token := SYM_TERMINOLOGY
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				terminology_text_start_line := in_lineno
			
else
--|#line 179 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 179")
end

				last_token := SYM_ANNOTATIONS
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				annotations_text_start_line := in_lineno
			
end
else
if yy_act = 38 then
--|#line 186 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 186")
end

				last_token := SYM_COMPONENT_TERMINOLOGIES
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				component_terminologies_text_start_line := in_lineno
			
else
--|#line 196 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 196")
end

				last_token := SYM_CONCEPT
				in_lineno := in_lineno + 1
			
end
end
end
else
if yy_act <= 43 then
if yy_act <= 41 then
if yy_act = 40 then
--|#line 201 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 201")
end

				last_token := SYM_COMPONENT_TERMINOLOGIES
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				component_terminologies_text_start_line := in_lineno
			
else
--|#line 208 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 208")
end

				last_token := SYM_RULES
				set_start_condition (IN_RULES_SECTION)
				in_lineno := in_lineno + 1
				rules_text_start_line := in_lineno
			
end
else
if yy_act = 42 then
--|#line 215 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 215")
end

				last_token := SYM_TERMINOLOGY
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				terminology_text_start_line := in_lineno
			
else
--|#line 221 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 221")
end

				last_token := V_CONCEPT_CODE
				last_string_value := text_substring (2, text_count - 1)
			
end
end
else
if yy_act <= 45 then
if yy_act = 44 then
--|#line 232 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 232")
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
--|#line 233 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 233")
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
if yy_act = 46 then
--|#line 234 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 234")
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
--|#line 235 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 235")
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
end
else
if yy_act <= 55 then
if yy_act <= 51 then
if yy_act <= 49 then
if yy_act = 48 then
--|#line 236 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 236")
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
--|#line 253 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 253")
end
 -- LF
				in_buffer.append_character('%N')
				in_lineno := in_lineno + 1
			
end
else
if yy_act = 50 then
--|#line 257 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 257")
end
 -- any text on line with no LF
				in_buffer.append_string(text)
			
else
--|#line 272 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 272")
end
			-- match ^whitespace <anything> \n
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
end
end
else
if yy_act <= 53 then
if yy_act = 52 then
--|#line 277 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 277")
end
in_lineno := in_lineno + text_count
else
--|#line 279 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 279")
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
if yy_act = 54 then
--|#line 291 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 291")
end
			-- match ^whitespace <anything> \n
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
else
--|#line 296 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 296")
end
in_lineno := in_lineno + text_count
end
end
end
else
if yy_act <= 59 then
if yy_act <= 57 then
if yy_act = 56 then
--|#line 298 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 298")
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
--|#line 311 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 311")
end

					last_token := V_DOTTED_NUMERIC
					last_string_value := text_substring (1, text_count)
			
end
else
if yy_act = 58 then
--|#line 317 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 317")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
else
--|#line 323 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 323")
end

					last_token := V_IDENTIFIER
					last_string_value := text
			
end
end
else
if yy_act <= 61 then
if yy_act = 60 then
--|#line 329 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 329")
end

					last_token := V_VALUE
					last_string_value := text
			
else
--|#line 336 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 336")
end
-- ignore unmatched chars
end
else
--|#line 0 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 0")
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
--|#line 335 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 335")
end
terminate
when 1 then
--|#line 260 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 260")
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
			create an_array.make_filled (0, 0, 1667)
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
			   29,   29,   29,   29,   29,   32,   29,   29,   33,   29,
			   29,   29,   34,   35,   36,   37,   28,   30,   29,   29,
			   29,   29,   29,   32,   29,   38,   48,   39,   40,   55,
			   56,   59,   60,   41,   42,  125,   61,   43,   61,   44,
			   45,   46,   64,   64,   49,  126,   50,   51,   64,   64,
			   38,   39,   40,  153,   41,   42,   65,   44,   66,   66,
			   68,   64,   64,   64,   64,  151,   64,   64,  422,   49,

			   50,   51,   64,   64,   64,   64,   70,  153,   64,   64,
			   64,   64,   69,  151,   68,   71,   64,   64,  152,   72,
			   68,   64,   64,   77,  161,   76,   64,   64,   74,  180,
			   79,   75,   64,   64,   64,   64,   78,   64,   64,  152,
			   72,   91,   92,   61,   68,   61,   80,  180,   81,   75,
			   84,   71,   95,   96,  162,   79,   83,  420,   82,   99,
			   99,   65,  396,   66,   66,  411,   81,  100,  101,   91,
			   92,   98,  102,   98,   83,   97,   97,   98,   97,   97,
			   97,   97,   97,   97,   97,   97,   95,   96,   97,   64,
			   64,   97,   97,   97,   97,  100,  101,   64,   64,  410,

			  102,  100,  101,  100,  101,  409,  102,  404,  102,  100,
			  101,  154,  154,  103,  102,  228,   97,   97,   97,  100,
			  101,  104,  204,  105,  102,  100,  101,  100,  101,  202,
			  102,  107,  102,  228,  103,  403,  100,  101,  110,  100,
			  101,  102,  106,  204,  102,  109,  100,  101,  100,  101,
			  113,  102,  344,  102,  202,  107,  100,  101,  111,  112,
			  114,  102,  110,  402,  100,  101,  100,  101,  116,  102,
			  344,  102,  401,  115,  100,  101,  205,  118,  396,  102,
			  127,  117,   99,   99,  119,  100,  101,  120,  115,  395,
			  102,  100,  101,  100,  101,  357,  102,  205,  102,  155,

			   64,  100,  101,  316,  121,  119,  102,  317,  122,  386,
			  100,  101,  385,  132,  133,  102,  100,  101,  100,  101,
			  377,  102,  376,  102,  131,  249,  122,  100,  101,  251,
			  100,  101,  102,  134,  375,  102,  100,  101,  368,  136,
			  367,  102,  277,  137,  100,  101,  249,  139,  360,  102,
			  251,  134,  138,  345,  100,  101,  132,  100,  101,  102,
			  346,  140,  102,  277,  137,  141,  142,  357,  100,  101,
			  138,  139,  356,  102,  100,  101,  100,  101,  355,  102,
			  354,  102,  140,  143,  343,  100,  101,   64,   64,  141,
			  102,  142,  100,  101,  334,  144,  333,  102,  146,  145,

			  100,  101,  321,  147,  319,  102,  100,  101,   64,  101,
			  315,  102,  365,  102,  100,  101,  300,  145,  127,  102,
			  154,  154,  148,  100,  101,  149,  366,  147,  102,  100,
			  101,  100,  101,  365,  102,  298,  102,  100,  101,  297,
			  148,  157,  102,  296,  160,  100,  101,  366,  158,  295,
			  102,  393,  159,  394,  100,  101,  157,  418,  164,  102,
			  100,  101,  163,  100,  101,  102,  100,  101,  102,  276,
			  159,  102,  393,  166,  394,  165,  100,  101,  418,  100,
			  101,  102,  275,  167,  102,  100,  101,  100,  101,  168,
			  102,  274,  102,  100,  101,  254,  172,  387,  102,  169,

			  252,  100,  101,  171,  388,  170,  102,  168,  100,  101,
			  174,  100,  101,  102,   64,  229,  102,  169,  250,   64,
			   64,  172,   64,   64,  171,  173,  175,  227,  176,  100,
			  101,  174,  100,  101,  102,  100,  101,  102,  100,  101,
			  102,  226,  183,  102,  185,  100,  101,  175,  225,  176,
			  102,  207,   64,  203,  187,  184,  186,  100,  101,  135,
			  100,  101,  102,  100,  101,  102,  100,  101,  102,  185,
			  179,  102,  178,  184,  197,  198,  197,  186,  177,  187,
			  189,  150,  188,  191,  135,  190,   64,   64,  100,  101,
			  100,  101,  130,  102,   98,  102,   96,  100,  101,  238,

			  239,  238,  102,  190,  191,  192,  194,  193,  100,  101,
			  100,  101,   93,  102,   92,  102,  100,  101,  278,  279,
			   89,  102,  197,  198,  197,  199,  192,  124,  193,  195,
			  123,  194,  100,  101,  108,  196,   62,  102,  100,  101,
			  100,  101,   93,  102,   93,  102,   89,  200,  100,  101,
			  199,  100,  101,  102,  100,  101,  102,  100,  101,  102,
			  201,   89,  102,  100,  101,  265,  266,  265,  102,   88,
			  211,  208,  200,  100,  101,  209,  210,   87,  102,  100,
			  101,  100,  101,   86,  102,   73,  102,   63,  212,  208,
			  100,  101,  214,   64,   64,  102,   62,  100,  101,  100,

			  101,  213,  102,  426,  102,   57,  215,   53,  218,  100,
			  101,  100,  101,   48,  102,  216,  102,  100,  101,  217,
			  100,  101,  102,  426,  219,  102,  220,  100,  101,  426,
			  100,  101,  102,  218,  221,  102,  426,  217,  222,  100,
			  101,  426,  100,  101,  102,  100,  101,  102,  100,  101,
			  102,  224,  223,  102,  426,  221,  426,  234,  233,  222,
			  232,  100,  101,  231,  100,  101,  102,  100,  101,  102,
			  278,  279,  102,  238,  239,  238,  320,  320,  235,  347,
			  347,  232,  234,  100,  101,  426,  236,  237,  102,  100,
			  101,  100,  101,  426,  102,  426,  102,  100,  101,  235,

			  100,  101,  102,  426,  236,  102,  240,  100,  101,  100,
			  101,  426,  102,  243,  102,  426,  241,  242,  426,  100,
			  101,  100,  101,  426,  102,  426,  102,  240,  100,  101,
			  245,  348,  349,  102,  247,  244,  246,  100,  101,  426,
			  100,  101,  102,  369,  369,  102,  248,  100,  101,  426,
			  100,  101,  102,  426,  255,  102,  426,  246,  256,  257,
			  100,  101,  426,  100,  101,  102,  426,  248,  102,  267,
			  268,  267,  100,  101,  258,  255,  260,  102,  426,  256,
			  426,  259,  426,  257,  100,  101,  100,  101,  426,  102,
			  426,  102,  426,  100,  101,  348,  349,  261,  102,  265,

			  266,  265,  426,  263,  426,  262,  267,  268,  267,  100,
			  101,  271,  271,  271,  102,  426,  100,  101,  264,  370,
			  370,  102,  100,  101,  263,  100,  101,  102,  378,  378,
			  102,  100,  101,  271,  271,  271,  102,  285,  285,  285,
			  100,  101,  269,  100,  101,  102,  100,  101,  102,  270,
			  426,  102,  273,  426,  270,  100,  101,  100,  101,  282,
			  102,  281,  102,  100,  101,  289,  290,  289,  102,  426,
			  283,  285,  285,  285,  100,  101,  272,  378,  378,  102,
			  426,  100,  101,  284,  100,  101,  102,  100,  101,  102,
			  389,  389,  102,  100,  101,  289,  290,  289,  102,  297, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  318,  297,  291,  426,  287,  100,  101,  286,  288,  426,
			  102,  100,  101,  100,  101,  426,  102,  426,  102,  336,
			  100,  101,  369,  369,  292,  102,  426,  291,  100,  101,
			  426,  100,  101,  102,  293,  294,  102,  100,  101,  100,
			  101,  426,  102,  303,  102,  100,  101,  426,  302,  426,
			  102,  426,  100,  101,  307,  308,  307,  102,  307,  308,
			  307,  405,  405,  304,  100,  101,  305,  303,  426,  102,
			  306,  426,  309,  100,  101,  311,  312,  311,  102,  100,
			  101,  426,  100,  101,  102,  100,  101,  102,  100,  101,
			  102,  310,  426,  102,  100,  101,  100,  101,  426,  102,

			  426,  102,  426,  322,  323,  322,  313,  311,  312,  311,
			  314,  426,  310,  100,  101,  426,  324,  426,  102,  100,
			  101,  313,  412,  412,  102,  326,  327,  326,  100,  101,
			  412,  412,  325,  102,  426,  100,  101,  100,  101,  426,
			  102,  426,  102,  330,  331,  330,  315,  332,  315,  426,
			  329,  426,  426,  100,  101,  319,  335,  319,  102,  336,
			  337,  328,  320,  320,  322,  323,  322,  100,  101,  426,
			  100,  101,  102,  426,  426,  102,  326,  327,  326,  100,
			  101,  426,  100,  101,  102,  426,  426,  102,  330,  331,
			  330,  426,  339,  340,  100,  101,  426,  100,  101,  102,

			  426,  426,  102,  426,  341,  342,  426,  100,  101,  100,
			  101,  340,  102,  426,  102,  350,  351,  426,  336,  358,
			  352,  347,  347,  342,  100,  101,  426,  353,  426,  102,
			  100,  101,  100,  101,  426,  102,  426,  102,  100,  101,
			  100,  101,  361,  102,  426,  102,  426,  362,  353,  364,
			  426,  363,  100,  101,  426,  100,  101,  102,  426,  371,
			  102,  100,  101,  361,  100,  101,  102,  379,  362,  102,
			  405,  405,  372,  426,  364,  379,  380,  373,  370,  370,
			  426,  100,  101,  100,  101,  382,  102,  426,  102,  374,
			  426,  426,  384,  384,  384,  373,  381,  426,  426,  100,

			  101,  383,  100,  101,  102,  100,  101,  102,  100,  101,
			  102,  379,  397,  102,  389,  389,  390,  392,  384,  384,
			  384,  426,  383,  391,  426,  100,  101,  100,  101,  426,
			  102,  426,  102,  426,  100,  101,  426,  390,  398,  102,
			  100,  101,  392,  426,  391,  102,  100,  101,  399,  100,
			  101,  102,  426,  426,  102,  413,  414,  413,  426,  400,
			  426,  407,  408,  426,  406,  100,  101,  100,  101,  426,
			  102,  426,  102,  426,  426,  416,  416,  416,  409,  417,
			  409,  413,  414,  413,  415,  100,  101,  100,  101,  426,
			  102,  426,  102,  416,  416,  416,  100,  101,  426,  426,

			  419,  102,  423,  424,  423,  415,  422,  425,  422,  423,
			  424,  423,  100,  101,  426,  426,  426,  102,  426,  426,
			  421,   47,   47,   47,   47,   47,   47,   47,   47,   47,
			   47,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   64,   64,   64,   64,   64,   64,   64,   64,   67,
			   67,   67,   67,   67,   67,   67,   67,   85,  426,   85,
			   85,   85,   85,   85,   85,   85,   85,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   94,   94,   94,

			   94,   94,   94,   94,   94,   94,   94,   63,   63,   63,
			   63,   63,   63,   63,   63,   63,   63,   97,   97,   97,
			   97,   97,   97,   97,   97,   97,   97,  128,  128,  128,
			  128,  128,  128,  128,  128,  129,  129,  129,  129,  129,
			  129,  129,  129,  156,  156,  156,  156,  181,  181,  181,
			  181,  181,  181,  181,  181,  182,  182,  182,  182,  182,
			  182,  206,  206,  206,  206,  206,  206,  206,  206,  230,
			  230,  230,  230,  230,  230,  253,  253,  253,  253,  253,
			  253,  253,  253,  280,  280,  280,  280,  299,  299,  299,
			  299,  299,  299,  299,  299,  301,  301,  301,  301,  301,

			  301,  338,  338,  338,  338,  338,  338,  359,  359,  359,
			  359,  359,  359,    9,  426,  426,  426,  426,  426,  426,
			  426,  426,  426,  426,  426,  426,  426,  426,  426,  426,
			  426,  426,  426,  426,  426,  426,  426,  426,  426,  426,
			  426,  426,  426,  426,  426,  426,  426,  426,  426,  426,
			  426,  426,  426,  426,  426,  426,  426,  426,  426,  426,
			  426,  426,  426,  426,  426,  426,  426,  426, yy_Dummy>>,
			1, 668, 1000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1667)
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
			    6,    8,    8,    2,    2,   88,   11,    2,   11,    2,
			    2,    2,   29,   29,    4,   88,    4,    4,   28,   28,
			    2,    2,    2,  126,    2,    2,   23,    2,   23,   23,
			   28,   30,   30,   31,   31,  124,   32,   32,  420,    4,

			    4,    4,   33,   33,   39,   39,   31,  126,   38,   38,
			   40,   40,   30,  124,   28,   32,   41,   41,  125,   33,
			   38,   42,   42,   40,  135,   39,   43,   43,   38,  153,
			   42,   38,   44,   44,   45,   45,   41,   46,   46,  125,
			   33,   55,   55,   61,   38,   61,   43,  153,   43,   38,
			   46,   44,   59,   59,  135,   42,   45,  418,   44,   65,
			   65,   66,  411,   66,   66,  403,   43,   67,   67,   91,
			   91,   98,   67,   98,   45,   63,   63,   63,   63,   63,
			   63,   63,   63,   63,   63,   63,   95,   95,   63,  100,
			  100,   63,   63,   63,   63,   68,   68,  101,  101,  402,

			   68,   69,   69,   70,   70,  401,   69,  396,   70,   71,
			   71,  127,  127,   68,   71,  205,   63,   63,   63,   72,
			   72,   69,  179,   70,   72,   74,   74,   75,   75,  177,
			   74,   72,   75,  205,   68,  395,   77,   77,   75,   76,
			   76,   77,   71,  179,   76,   74,   78,   78,   79,   79,
			   77,   78,  334,   79,  177,   72,   80,   80,   76,   76,
			   77,   80,   75,  394,   81,   81,   82,   82,   79,   81,
			  334,   82,  393,   78,   83,   83,  180,   81,  388,   83,
			   99,   80,   99,   99,   82,   84,   84,   83,   78,  387,
			   84,  103,  103,  104,  104,  377,  103,  180,  104,  128,

			  128,  105,  105,  296,   84,   82,  105,  296,   84,  376,
			  106,  106,  375,  104,  105,  106,  107,  107,  109,  109,
			  367,  107,  366,  109,  103,  225,   84,  110,  110,  227,
			  111,  111,  110,  106,  365,  111,  112,  112,  357,  109,
			  356,  112,  252,  110,  113,  113,  225,  112,  349,  113,
			  227,  106,  111,  336,  114,  114,  112,  115,  115,  114,
			  336,  113,  115,  252,  110,  114,  115,  346,  116,  116,
			  111,  112,  345,  116,  117,  117,  118,  118,  344,  117,
			  343,  118,  113,  116,  333,  119,  119,  181,  181,  114,
			  119,  115,  120,  120,  317,  117,  316,  120,  119,  118,

			  121,  121,  301,  120,  298,  121,  122,  122,  129,  129,
			  295,  122,  354,  129,  131,  131,  279,  118,  154,  131,
			  154,  154,  121,  132,  132,  122,  355,  120,  132,  133,
			  133,  134,  134,  354,  133,  277,  134,  136,  136,  276,
			  121,  131,  136,  275,  134,  137,  137,  355,  132,  274,
			  137,  385,  133,  386,  138,  138,  131,  410,  137,  138,
			  139,  139,  136,  140,  140,  139,  141,  141,  140,  251,
			  133,  141,  385,  139,  386,  138,  142,  142,  410,  143,
			  143,  142,  250,  140,  143,  144,  144,  145,  145,  141,
			  144,  249,  145,  147,  147,  230,  145,  379,  147,  142,

			  228,  146,  146,  144,  379,  143,  146,  141,  148,  148,
			  147,  149,  149,  148,  206,  206,  149,  142,  226,  155,
			  155,  145,  155,  155,  144,  146,  148,  204,  149,  157,
			  157,  147,  158,  158,  157,  159,  159,  158,  160,  160,
			  159,  203,  157,  160,  159,  163,  163,  148,  202,  149,
			  163,  182,  155,  178,  163,  158,  160,  164,  164,  161,
			  165,  165,  164,  166,  166,  165,  167,  167,  166,  159,
			  152,  167,  151,  158,  197,  197,  197,  160,  150,  163,
			  165,  123,  164,  167,  108,  166,  229,  229,  168,  168,
			  169,  169,  102,  168,   97,  169,   94,  170,  170,  238,

			  238,  238,  170,  166,  167,  168,  170,  169,  171,  171,
			  172,  172,   93,  171,   90,  172,  174,  174,  253,  253,
			   89,  174,  173,  173,  173,  174,  168,   87,  169,  171,
			   86,  170,  173,  173,   73,  172,   62,  173,  175,  175,
			  176,  176,   60,  175,   57,  176,   56,  175,  183,  183,
			  174,  185,  185,  183,  184,  184,  185,  186,  186,  184,
			  176,   53,  186,  187,  187,  265,  265,  265,  187,   51,
			  186,  183,  175,  188,  188,  184,  185,   50,  188,  189,
			  189,  190,  190,   49,  189,   34,  190,   20,  187,  183,
			  191,  191,  189,  278,  278,  191,   12,  192,  192,  193,

			  193,  188,  192,    9,  193,    7,  190,    5,  193,  194,
			  194,  195,  195,    3,  194,  191,  195,  196,  196,  192,
			  199,  199,  196,    0,  194,  199,  195,  200,  200,    0,
			  201,  201,  200,  193,  196,  201,    0,  192,  199,  208,
			  208,    0,  209,  209,  208,  210,  210,  209,  211,  211,
			  210,  201,  200,  211,    0,  196,    0,  211,  210,  199,
			  209,  212,  212,  208,  213,  213,  212,  214,  214,  213,
			  299,  299,  214,  215,  215,  215,  300,  300,  212,  337,
			  337,  209,  211,  215,  215,    0,  213,  214,  215,  216,
			  216,  217,  217,    0,  216,    0,  217,  218,  218,  212,

			  219,  219,  218,    0,  213,  219,  216,  220,  220,  221,
			  221,    0,  220,  219,  221,    0,  217,  218,    0,  222,
			  222,  223,  223,    0,  222,    0,  223,  216,  224,  224,
			  221,  338,  338,  224,  223,  220,  222,  231,  231,    0,
			  232,  232,  231,  358,  358,  232,  224,  233,  233,    0,
			  234,  234,  233,    0,  231,  234,    0,  222,  232,  233,
			  235,  235,    0,  236,  236,  235,    0,  224,  236,  267,
			  267,  267,  237,  237,  234,  231,  236,  237,    0,  232,
			    0,  235,    0,  233,  240,  240,  241,  241,    0,  240,
			    0,  241,    0,  242,  242,  359,  359,  237,  242,  243,

			  243,  243,    0,  241,    0,  240,  244,  244,  244,  243,
			  243,  271,  271,  271,  243,    0,  244,  244,  242,  360,
			  360,  244,  245,  245,  241,  246,  246,  245,  368,  368,
			  246,  248,  248,  247,  247,  247,  248,  285,  285,  285,
			  255,  255,  245,  247,  247,  255,  256,  256,  247,  246,
			    0,  256,  248,    0,  246,  257,  257,  258,  258,  256,
			  257,  255,  258,  259,  259,  289,  289,  289,  259,    0,
			  258,  260,  260,  260,  261,  261,  247,  378,  378,  261,
			    0,  260,  260,  259,  262,  262,  260,  263,  263,  262,
			  380,  380,  263,  269,  269,  264,  264,  264,  269,  297, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  297,  297,  269,    0,  262,  264,  264,  261,  263,    0,
			  264,  270,  270,  272,  272,    0,  270,    0,  272,  369,
			  273,  273,  369,  369,  270,  273,    0,  269,  281,  281,
			    0,  282,  282,  281,  272,  273,  282,  283,  283,  284,
			  284,    0,  283,  282,  284,  286,  286,    0,  281,    0,
			  286,    0,  288,  288,  287,  287,  287,  288,  307,  307,
			  307,  397,  397,  284,  287,  287,  286,  282,    0,  287,
			  286,    0,  288,  291,  291,  292,  292,  292,  291,  293,
			  293,    0,  294,  294,  293,  292,  292,  294,  302,  302,
			  292,  291,    0,  302,  303,  303,  305,  305,    0,  303,

			    0,  305,    0,  304,  304,  304,  293,  311,  311,  311,
			  294,    0,  291,  304,  304,    0,  305,    0,  304,  306,
			  306,  293,  404,  404,  306,  309,  309,  309,  310,  310,
			  412,  412,  306,  310,    0,  309,  309,  313,  313,    0,
			  309,    0,  313,  314,  314,  314,  315,  315,  315,    0,
			  313,    0,    0,  314,  314,  319,  319,  319,  314,  320,
			  320,  310,  320,  320,  322,  322,  322,  324,  324,    0,
			  325,  325,  324,    0,    0,  325,  326,  326,  326,  328,
			  328,    0,  329,  329,  328,    0,    0,  329,  330,  330,
			  330,    0,  324,  325,  339,  339,    0,  340,  340,  339,

			    0,    0,  340,    0,  328,  329,    0,  341,  341,  342,
			  342,  325,  341,    0,  342,  339,  340,    0,  347,  347,
			  341,  347,  347,  329,  350,  350,    0,  342,    0,  350,
			  351,  351,  352,  352,    0,  351,    0,  352,  361,  361,
			  353,  353,  350,  361,    0,  353,    0,  351,  342,  353,
			    0,  352,  362,  362,    0,  363,  363,  362,    0,  361,
			  363,  364,  364,  350,  372,  372,  364,  405,  351,  372,
			  405,  405,  362,    0,  353,  370,  370,  363,  370,  370,
			    0,  371,  371,  373,  373,  372,  371,    0,  373,  364,
			    0,    0,  374,  374,  374,  363,  371,    0,    0,  381,

			  381,  373,  374,  374,  381,  382,  382,  374,  383,  383,
			  382,  389,  389,  383,  389,  389,  381,  383,  384,  384,
			  384,    0,  373,  382,    0,  390,  390,  391,  391,    0,
			  390,    0,  391,    0,  392,  392,    0,  381,  390,  392,
			  398,  398,  383,    0,  382,  398,  399,  399,  391,  400,
			  400,  399,    0,    0,  400,  406,  406,  406,    0,  392,
			    0,  399,  400,    0,  398,  406,  406,  407,  407,    0,
			  406,    0,  407,    0,    0,  408,  408,  408,  409,  409,
			  409,  413,  413,  413,  407,  408,  408,  415,  415,    0,
			  408,    0,  415,  416,  416,  416,  419,  419,    0,    0,

			  415,  419,  421,  421,  421,  407,  422,  422,  422,  423,
			  423,  423,  421,  421,    0,    0,    0,  421,    0,    0,
			  419,  427,  427,  427,  427,  427,  427,  427,  427,  427,
			  427,  428,  428,  428,  428,  428,  428,  428,  428,  428,
			  428,  429,  429,  429,  429,  429,  429,  429,  429,  429,
			  429,  430,  430,  430,  430,  430,  430,  430,  430,  430,
			  430,  431,  431,  431,  431,  431,  431,  431,  431,  432,
			  432,  432,  432,  432,  432,  432,  432,  433,    0,  433,
			  433,  433,  433,  433,  433,  433,  433,  434,  434,  434,
			  434,  434,  434,  434,  434,  434,  434,  435,  435,  435,

			  435,  435,  435,  435,  435,  435,  435,  436,  436,  436,
			  436,  436,  436,  436,  436,  436,  436,  437,  437,  437,
			  437,  437,  437,  437,  437,  437,  437,  438,  438,  438,
			  438,  438,  438,  438,  438,  439,  439,  439,  439,  439,
			  439,  439,  439,  440,  440,  440,  440,  441,  441,  441,
			  441,  441,  441,  441,  441,  442,  442,  442,  442,  442,
			  442,  443,  443,  443,  443,  443,  443,  443,  443,  444,
			  444,  444,  444,  444,  444,  445,  445,  445,  445,  445,
			  445,  445,  445,  446,  446,  446,  446,  447,  447,  447,
			  447,  447,  447,  447,  447,  448,  448,  448,  448,  448,

			  448,  449,  449,  449,  449,  449,  449,  450,  450,  450,
			  450,  450,  450,  426,  426,  426,  426,  426,  426,  426,
			  426,  426,  426,  426,  426,  426,  426,  426,  426,  426,
			  426,  426,  426,  426,  426,  426,  426,  426,  426,  426,
			  426,  426,  426,  426,  426,  426,  426,  426,  426,  426,
			  426,  426,  426,  426,  426,  426,  426,  426,  426,  426,
			  426,  426,  426,  426,  426,  426,  426,  426, yy_Dummy>>,
			1, 668, 1000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,   34,  710,   53,  704,   57,  702,   59,  703,
			 1613,   64,  693, 1613, 1613, 1613, 1613, 1613, 1613, 1613,
			  675,    0, 1613,   73, 1613, 1613, 1613, 1613,   66,   60,
			   79,   81,   84,   90,  635, 1613, 1613,    0,   96,   92,
			   98,  104,  109,  114,  120,  122,  125,    0, 1613,  651,
			  644,  644, 1613,  658, 1613,  139,  643,  641, 1613,  150,
			  639,  141,  633,  174,    0,  144,  148,  155,  183,  189,
			  191,  197,  207,  586,  213,  215,  227,  224,  234,  236,
			  244,  252,  254,  262,  273,    0,  598,  596,   39,  617,
			  611,  167, 1613,  609,  593,  184, 1613,  591,  169,  267,

			  177,  185,  575,  279,  281,  289,  298,  304,  568,  306,
			  315,  318,  324,  332,  342,  345,  356,  362,  364,  373,
			  380,  388,  394,  548,   61,   89,   60,  196,  287,  396,
			    0,  402,  411,  417,  419,  111,  425,  433,  442,  448,
			  451,  454,  464,  467,  473,  475,  489,  481,  496,  499,
			  541,  539,  538,   94,  405,  507,    0,  517,  520,  523,
			  526,  543, 1613,  533,  545,  548,  551,  554,  576,  578,
			  585,  596,  598,  620,  604,  626,  628,  208,  521,  193,
			  247,  375,  539,  636,  642,  639,  645,  651,  661,  667,
			  669,  678,  685,  687,  697,  699,  705,  572, 1613,  708,

			  715,  718,  511,  516,  490,  181,  502,    0,  727,  730,
			  733,  736,  749,  752,  755,  771,  777,  779,  785,  788,
			  795,  797,  807,  809,  816,  296,  486,  300,  463,  574,
			  483,  825,  828,  835,  838,  848,  851,  860,  597, 1613,
			  872,  874,  881,  897,  904,  910,  913,  931,  919,  458,
			  445,  436,  313,  606,    0,  928,  934,  943,  945,  951,
			  969,  962,  972,  975,  993,  663, 1613,  867, 1613,  981,
			  999,  909, 1001, 1008,  417,  398,  407,  402,  681,  362,
			    0, 1016, 1019, 1025, 1027,  935, 1033, 1052, 1040,  963,
			 1613, 1061, 1073, 1067, 1070,  374,  270,  997,  372,  758,

			  761,  389, 1076, 1082, 1101, 1084, 1107, 1056, 1613, 1123,
			 1116, 1105, 1613, 1125, 1141, 1144,  364,  369, 1613, 1153,
			 1147,    0, 1162, 1613, 1155, 1158, 1174, 1613, 1167, 1170,
			 1186, 1613, 1613,  347,  217, 1613,  307,  764,  819, 1182,
			 1185, 1195, 1197,  347,  347,  321,  320, 1206,    0,  294,
			 1212, 1218, 1220, 1228,  382,  397,  288,  325,  828,  883,
			  904, 1226, 1240, 1243, 1249,  301,  290,  271,  913, 1007,
			 1263, 1269, 1252, 1271, 1290,  285,  276,  249,  962,  451,
			  975, 1287, 1293, 1296, 1316,  422,  423,  238,  231, 1299,
			 1313, 1315, 1322,  247,  230,  183,  194, 1046, 1328, 1334,

			 1337,  169,  172,  116, 1107, 1255, 1353, 1355, 1373, 1376,
			  428,  116, 1115, 1379, 1613, 1375, 1391, 1613,  132, 1384,
			   62, 1400, 1404, 1407, 1613, 1613, 1613, 1420, 1430, 1440,
			 1450, 1458, 1466, 1476, 1486, 1496, 1506, 1516, 1524, 1532,
			 1536, 1544, 1550, 1558, 1564, 1572, 1576, 1584, 1590, 1596,
			 1602, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  426,    1,  427,  427,  428,  429,  428,  430,  426,
			  426,  426,  426,  426,  426,  426,  426,  426,  426,  426,
			  431,  431,  426,  431,  426,  426,  426,  426,  432,  432,
			  432,  432,  432,  432,  426,  426,  426,  431,  432,  432,
			  432,  432,  432,  432,  432,  432,  432,  433,  426,  433,
			  433,  433,  426,  426,  426,  434,  426,  426,  426,  435,
			  426,  426,  426,  436,  431,  431,  431,  432,  432,  432,
			  432,  432,  432,  426,  432,  432,  432,  432,  432,  432,
			  432,  432,  432,  432,  432,  433,  433,  433,  433,  426,
			  434,  434,  426,  426,  435,  435,  426,  437,  426,  431,

			  438,  439,  426,  432,  432,  432,  432,  432,  426,  432,
			  432,  432,  432,  432,  432,  432,  432,  432,  432,  432,
			  432,  432,  432,  433,  433,  433,  433,  431,  438,  439,
			  440,  432,  432,  432,  432,  426,  432,  432,  432,  432,
			  432,  432,  432,  432,  432,  432,  432,  432,  432,  432,
			  433,  433,  433,  433,  431,  441,  442,  432,  432,  432,
			  432,  426,  426,  432,  432,  432,  432,  432,  432,  432,
			  432,  432,  432,  432,  432,  432,  432,  433,  433,  433,
			  433,  443,  442,  432,  432,  432,  432,  432,  432,  432,
			  432,  432,  432,  432,  432,  432,  432,  426,  426,  432,

			  432,  432,  433,  433,  433,  433,  443,  444,  432,  432,
			  432,  432,  432,  432,  432,  432,  432,  432,  432,  432,
			  432,  432,  432,  432,  432,  433,  433,  433,  433,  445,
			  444,  432,  432,  432,  432,  432,  432,  432,  426,  426,
			  432,  432,  432,  432,  432,  432,  432,  432,  432,  433,
			  433,  433,  433,  445,  446,  432,  432,  432,  432,  432,
			  432,  432,  432,  432,  432,  426,  426,  426,  426,  432,
			  432,  426,  432,  432,  433,  433,  433,  433,  447,  431,
			  448,  432,  432,  432,  432,  426,  432,  432,  432,  426,
			  426,  432,  432,  432,  432,  433,  433,  433,  433,  447,

			  431,  448,  432,  432,  432,  432,  432,  426,  426,  432,
			  432,  426,  426,  432,  432,  433,  433,  433,  426,  433,
			  431,  449,  426,  426,  432,  432,  426,  426,  432,  432,
			  426,  426,  426,  433,  433,  426,  431,  431,  449,  432,
			  432,  432,  432,  433,  433,  431,  431,  431,  450,  426,
			  432,  432,  432,  432,  433,  433,  431,  431,  431,  450,
			  426,  432,  432,  432,  432,  433,  433,  431,  431,  431,
			  426,  432,  432,  432,  432,  433,  433,  431,  431,  426,
			  426,  432,  432,  432,  426,  433,  433,  426,  426,  426,
			  432,  432,  432,  433,  433,  426,  426,  426,  432,  432,

			  432,  433,  433,  426,  426,  426,  432,  432,  432,  433,
			  433,  426,  426,  426,  426,  432,  426,  426,  433,  432,
			  433,  432,  433,  426,  426,  426,    0,  426,  426,  426,
			  426,  426,  426,  426,  426,  426,  426,  426,  426,  426,
			  426,  426,  426,  426,  426,  426,  426,  426,  426,  426,
			  426, yy_Dummy>>)
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
			   26,   27,   28,   29,   22,   22,   30,   31,   32,   33,
			   34,   22,   35,   36,   37,   38,   39,   22,   22,   40,
			   41,   42,    1,   43,   44,   45,    1,   46,   22,   47,

			   48,   25,   26,   27,   49,   50,   22,   22,   51,   31,
			   32,   33,   52,   22,   53,   36,   37,   38,   54,   22,
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
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    2,    1,    1,    1,    1,    1,    1,
			    1,    1,    3,    4,    1,    5,    6,    1,    1,    1,
			    1,    7,    7,    7,    8,    7,    9,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,   10,    1,    1,    1,    5,    7,    7,    7,    7,
			    7,    7,    7,    7,    7, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   63,
			   61,    1,    2,   15,   18,   16,   17,    7,    6,   13,
			    5,   11,    8,   60,   14,   12,   10,   19,   60,   60,
			   60,   60,   60,   60,   20,   21,    9,   60,   60,   60,
			   60,   60,   60,   60,   60,   60,   60,   50,   49,   50,
			   50,   50,   62,   52,   53,   62,   52,   55,   56,   62,
			   55,    1,    2,    3,   60,   60,   60,   59,   59,   59,
			   59,   59,   59,    0,   59,   59,   59,   59,   59,   59,
			   59,   59,   59,   59,   59,   50,   50,   50,   50,   52,
			    0,    0,   51,   55,    0,    0,   54,    3,    4,   57,

			   60,   60,    0,   59,   59,   59,   59,   30,    0,   59,
			   59,   59,   59,   59,   59,   59,   59,   59,   59,   59,
			   59,   59,   59,   50,   50,   50,   50,   60,   60,   60,
			    0,   59,   59,   59,   59,    0,   59,   59,   59,   59,
			   59,   59,   59,   59,   59,   59,   59,   59,   59,   59,
			   50,   50,   50,   50,   57,   60,    0,   59,   59,   59,
			   59,    0,   43,   59,   59,   59,   59,   59,   59,   59,
			   59,   59,   59,   59,   59,   59,   59,   50,   50,   50,
			   50,   60,    0,   59,   59,   59,   59,   59,   59,   59,
			   59,   59,   59,   59,   59,   59,   59,    0,   35,   59,

			   59,   59,   50,   50,   50,   50,   60,    0,   59,   59,
			   59,   59,   59,   59,   59,   59,   59,   59,   59,   59,
			   59,   59,   59,   59,   59,   50,   50,   50,   50,   60,
			    0,   59,   59,   59,   59,   59,   59,   59,    0,   39,
			   59,   59,   59,   59,   59,   59,   59,   59,   59,   50,
			   50,   50,   50,   60,    0,   59,   59,   29,   59,   59,
			   59,   59,   59,   59,   59,    0,   32,    0,   42,   59,
			   59,   24,   59,   59,   50,   50,   50,   50,   60,   60,
			    0,   59,   59,   27,   59,   22,   59,   59,   59,    0,
			   41,   59,   59,   59,   59,   50,   50,   50,   50,   60,

			   60,    0,   26,   28,   59,   59,   59,    0,   34,   59,
			   59,    0,   31,   59,   59,   50,   50,   50,   45,   50,
			   58,    0,    0,   37,   59,   59,    0,   33,   59,   59,
			    0,   36,   46,   50,   50,   44,   60,   60,    0,   59,
			   59,   59,   59,   50,   50,   60,   60,   58,    0,    0,
			   59,   59,   59,   59,   50,   50,   60,   60,   60,    0,
			    0,   59,   59,   59,   59,   50,   50,   60,   60,   58,
			   58,   59,   59,   59,   59,   50,   50,   60,   58,    0,
			    0,   59,   59,   59,   23,   50,   50,    0,    0,   58,
			   59,   59,   59,   50,   50,    0,    0,    0,   59,   59,

			   59,   50,   50,    0,    0,   58,   59,   59,   59,   50,
			   50,    0,   58,    0,   40,   59,   25,   47,   50,   59,
			   50,   59,   50,    0,   38,   48,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 1613
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 426
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 427
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

	yyNb_rules: INTEGER = 62
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 63
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
