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
if yy_act <= 32 then
if yy_act <= 16 then
if yy_act <= 8 then
if yy_act <= 4 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 73 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 73")
end
-- Ignore separators
else
--|#line 74 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 74")
end
in_lineno := in_lineno + text_count
end
else
if yy_act = 3 then
--|#line 79 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 79")
end
-- Ignore comments
else
--|#line 80 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 80")
end
in_lineno := in_lineno + 1
end
end
else
if yy_act <= 6 then
if yy_act = 5 then
--|#line 84 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 84")
end
last_token := Minus_code
else
--|#line 85 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 85")
end
last_token := Plus_code
end
else
if yy_act = 7 then
--|#line 86 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 86")
end
last_token := Star_code
else
--|#line 87 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 87")
end
last_token := Slash_code
end
end
end
else
if yy_act <= 12 then
if yy_act <= 10 then
if yy_act = 9 then
--|#line 88 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 88")
end
last_token := Caret_code
else
--|#line 89 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 89")
end
last_token := Equal_code
end
else
if yy_act = 11 then
--|#line 90 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 90")
end
last_token := Dot_code
else
--|#line 91 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 91")
end
last_token := Semicolon_code
end
end
else
if yy_act <= 14 then
if yy_act = 13 then
--|#line 92 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 92")
end
last_token := Comma_code
else
--|#line 93 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 93")
end
last_token := Colon_code
end
else
if yy_act = 15 then
--|#line 94 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 94")
end
last_token := Exclamation_code
else
--|#line 95 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 95")
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
--|#line 96 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 96")
end
last_token := Right_parenthesis_code
else
--|#line 97 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 97")
end
last_token := Dollar_code
end
else
if yy_act = 19 then
--|#line 98 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 98")
end
last_token := Question_mark_code
else
--|#line 100 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 100")
end
last_token := Left_bracket_code
end
end
else
if yy_act <= 22 then
if yy_act = 21 then
--|#line 101 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 101")
end
last_token := Right_bracket_code
else
--|#line 105 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 105")
end

				last_token := SYM_ARCHETYPE
			
end
else
if yy_act = 23 then
--|#line 109 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 109")
end

				last_token := SYM_TEMPLATE_OVERLAY
			
else
--|#line 113 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 113")
end

				last_token := SYM_TEMPLATE
			
end
end
end
else
if yy_act <= 28 then
if yy_act <= 26 then
if yy_act = 25 then
--|#line 117 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 117")
end

				last_token := SYM_OPERATIONAL_TEMPLATE
			
else
--|#line 121 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 121")
end

				last_token := SYM_ADL_VERSION
			
end
else
if yy_act = 27 then
--|#line 125 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 125")
end

				last_token := SYM_RM_RELEASE
			
else
--|#line 129 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 129")
end

				last_token := SYM_IS_CONTROLLED
			
end
end
else
if yy_act <= 30 then
if yy_act = 29 then
--|#line 133 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 133")
end

				last_token := SYM_IS_GENERATED
			
else
--|#line 137 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 137")
end

				last_token := SYM_UID
			
end
else
if yy_act = 31 then
--|#line 141 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 141")
end

				last_token := SYM_SPECIALIZE
				in_lineno := in_lineno + 1
			
else
--|#line 147 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 147")
end

				last_token := SYM_LANGUAGE
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				language_text_start_line := in_lineno
			
end
end
end
end
end
else
if yy_act <= 48 then
if yy_act <= 40 then
if yy_act <= 36 then
if yy_act <= 34 then
if yy_act = 33 then
--|#line 154 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 154")
end

				last_token := SYM_DESCRIPTION
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				description_text_start_line := in_lineno
			
else
--|#line 161 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 161")
end

				last_token := SYM_DEFINITION
				set_start_condition (IN_CADL_SECTION)
				in_lineno := in_lineno + 1
				definition_text_start_line := in_lineno
			
end
else
if yy_act = 35 then
--|#line 168 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 168")
end

				last_token := SYM_RULES
				set_start_condition (IN_RULES_SECTION)
				in_lineno := in_lineno + 1
				rules_text_start_line := in_lineno
			
else
--|#line 175 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 175")
end

				last_token := SYM_TERMINOLOGY
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				terminology_text_start_line := in_lineno
			
end
end
else
if yy_act <= 38 then
if yy_act = 37 then
--|#line 182 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 182")
end

				last_token := SYM_ANNOTATIONS
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				annotations_text_start_line := in_lineno
			
else
--|#line 189 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 189")
end

				last_token := SYM_COMPONENT_TERMINOLOGIES
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				component_terminologies_text_start_line := in_lineno
			
end
else
if yy_act = 39 then
--|#line 199 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 199")
end

				last_token := SYM_CONCEPT
				in_lineno := in_lineno + 1
			
else
--|#line 204 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 204")
end

				last_token := SYM_COMPONENT_TERMINOLOGIES
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				component_terminologies_text_start_line := in_lineno
			
end
end
end
else
if yy_act <= 44 then
if yy_act <= 42 then
if yy_act = 41 then
--|#line 211 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 211")
end

				last_token := SYM_RULES
				set_start_condition (IN_RULES_SECTION)
				in_lineno := in_lineno + 1
				rules_text_start_line := in_lineno
			
else
--|#line 218 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 218")
end

				last_token := SYM_TERMINOLOGY
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				terminology_text_start_line := in_lineno
			
end
else
if yy_act = 43 then
--|#line 224 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 224")
end

				last_token := V_CONCEPT_CODE
				last_string_value := text_substring (2, text_count - 1)
			
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
else
if yy_act <= 46 then
if yy_act = 45 then
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
--|#line 237 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 237")
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
if yy_act = 47 then
--|#line 238 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 238")
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
--|#line 239 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 239")
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
if yy_act <= 56 then
if yy_act <= 52 then
if yy_act <= 50 then
if yy_act = 49 then
--|#line 240 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 240")
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
--|#line 257 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 257")
end
 -- LF
				in_buffer.append_character('%N')
				in_lineno := in_lineno + 1
			
end
else
if yy_act = 51 then
--|#line 261 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 261")
end
 -- any text on line with no LF
				in_buffer.append_string(text)
			
else
--|#line 276 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 276")
end
			-- match ^whitespace <anything> \n
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
end
end
else
if yy_act <= 54 then
if yy_act = 53 then
--|#line 281 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 281")
end
in_lineno := in_lineno + text_count
else
--|#line 283 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 283")
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
if yy_act = 55 then
--|#line 295 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 295")
end
			-- match ^whitespace <anything> \n
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
else
--|#line 300 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 300")
end
in_lineno := in_lineno + text_count
end
end
end
else
if yy_act <= 60 then
if yy_act <= 58 then
if yy_act = 57 then
--|#line 302 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 302")
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
--|#line 315 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 315")
end

					last_token := V_DOTTED_NUMERIC
					last_string_value := text_substring (1, text_count)
			
end
else
if yy_act = 59 then
--|#line 321 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 321")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
else
--|#line 327 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 327")
end

					last_token := V_IDENTIFIER
					last_string_value := text
			
end
end
else
if yy_act <= 62 then
if yy_act = 61 then
--|#line 333 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 333")
end

					last_token := V_VALUE
					last_string_value := text
			
else
--|#line 340 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 340")
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
--|#line 339 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 339")
end
terminate
when 1 then
--|#line 264 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 264")
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
			create an_array.make_filled (0, 0, 1648)
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
			   29,   29,   29,   32,   29,   38,   48,   39,   40,   56,
			   57,   60,   61,   41,   42,  127,   62,   43,   62,   44,
			   45,   46,   65,   65,   49,  128,   50,   51,   65,   65,
			   38,   39,   40,  330,   41,   42,   66,   44,   67,   67,
			   52,   65,   65,   65,   65,   65,   65,   72,  330,   49,

			   50,   51,  154,   69,   65,   65,   65,   65,   71,  440,
			   65,   65,   65,   65,   70,   65,   65,   65,   65,   78,
			  154,   73,   69,   65,   65,   65,   65,   69,   65,   65,
			   75,  326,   79,   76,   80,  327,   77,   81,  156,   82,
			   65,   65,   73,   93,   94,   84,   69,   72,   97,   98,
			   62,   76,   62,   85,   83,  101,  101,   82,   66,   80,
			   67,   67,  156,   84,   99,   99,  100,   99,   99,   99,
			   99,   99,   99,   99,   99,   93,   94,   99,   97,   98,
			   99,   99,   99,   99,  102,  103,  102,  103,  100,  104,
			  100,  104,  102,  103,  102,  103,  165,  104,  130,  104,

			  101,  101,   65,   65,  105,   99,   99,   99,  102,  103,
			  102,  103,  106,  104,  107,  104,  102,  103,  102,  103,
			  438,  104,  109,  104,  155,  105,  166,  102,  103,  112,
			  102,  103,  104,  102,  103,  104,  111,  157,  104,  102,
			  103,  108,   65,   65,  104,  155,  109,  115,  184,  113,
			  114,  102,  103,  112,  117,  157,  104,  116,  185,  118,
			  102,  103,  102,  103,  414,  104,  184,  104,  429,  117,
			  102,  103,  428,  120,  427,  104,  119,  102,  103,  185,
			  121,  209,  104,  122,  102,  103,  102,  103,  207,  104,
			  210,  104,  102,  103,  158,  158,  123,  104,  102,  103,

			  124,  121,  209,  104,  422,  136,  135,  102,  103,  102,
			  103,  210,  104,  207,  104,  102,  103,  134,  124,  421,
			  104,  137,  102,  103,  159,   65,  211,  104,  102,  103,
			  139,  140,  256,  104,  358,  102,  103,  102,  103,  137,
			  104,  359,  104,  420,  141,  143,  142,  234,  144,  102,
			  103,  211,  140,  256,  104,  135,  102,  103,  145,  102,
			  103,  104,  141,  419,  104,  234,  143,  414,  102,  103,
			  142,  146,  144,  104,  102,  103,  413,  102,  103,  104,
			  147,  258,  104,  145,  102,  103,  285,  149,  150,  104,
			  381,  148,  102,  103,   65,  103,  371,  104,  369,  104,

			  102,  103,  258,  102,  103,  104,  151,  285,  104,  148,
			  403,  152,  150,  102,  103,  381,  102,  103,  104,  369,
			  130,  104,  158,  158,  151,  102,  103,  161,  162,  164,
			  104,  356,  102,  103,  102,  103,  163,  104,  402,  104,
			   65,   65,  161,  102,  103,  168,  102,  103,  104,  356,
			  167,  104,  102,  103,  163,  169,  170,  104,  102,  103,
			  102,  103,  393,  104,  357,  104,  171,  102,  103,  102,
			  103,  392,  104,  391,  104,  172,   65,   65,  176,   65,
			   65,  173,  357,  102,  103,  175,  174,  390,  104,  102,
			  103,  102,  103,  172,  104,  383,  104,  102,  103,  173,

			  102,  103,  104,  176,  379,  104,  175,  177,  178,   65,
			  380,  102,  103,  405,  193,  179,  104,  180,  102,  103,
			  406,  102,  103,  104,  188,  379,  104,  102,  103,  178,
			  190,  380,  104,  382,  102,  103,  179,  411,  180,  104,
			  374,  189,  371,  192,  370,  191,  368,  102,  103,  102,
			  103,  412,  104,  367,  104,  190,  102,  103,  411,  189,
			  355,  104,   65,  236,  102,  103,  191,  194,  192,  104,
			  347,  195,  412,  196,  102,  103,  345,  102,  103,  104,
			  436,  197,  104,  102,  103,  344,  199,  332,  104,  195,
			  329,  198,  102,  103,  196,   65,   65,  104,  202,  203,

			  202,  436,  197,  325,  200,  102,  103,  310,  102,  103,
			  104,  199,  198,  104,  204,  102,  103,  201,  102,  103,
			  104,  102,  103,  104,  205,  308,  104,  102,  103,  102,
			  103,  307,  104,  306,  104,  202,  203,  202,  206,  204,
			  102,  103,  102,  103,  214,  104,  305,  104,  215,  205,
			  102,  103,  304,  217,  216,  104,  102,  103,  102,  103,
			  286,  104,  214,  104,  284,  102,  103,  218,  283,  220,
			  104,  102,  103,  245,  246,  245,  104,  282,  219,  102,
			  103,  102,  103,  221,  104,  262,  104,  260,  224,  259,
			  222,  287,  288,  223,  102,  103,  225,  102,  103,  104,

			  102,  103,  104,  102,  103,  104,   65,   65,  104,  226,
			  257,  223,  235,  224,  227,  102,  103,  233,  228,  232,
			  104,  102,  103,  231,  102,  103,  104,  213,  229,  104,
			  273,  274,  273,  102,  103,  227,  230,  208,  104,  228,
			  287,  288,  239,  102,  103,  238,  240,  138,  104,  102,
			  103,  183,  241,  182,  104,  181,  102,  103,  153,  102,
			  103,  104,  138,  239,  104,  133,  242,  100,  102,  103,
			  245,  246,  245,  104,  275,  276,  275,  241,  243,  244,
			  102,  103,   98,  102,  103,  104,   95,  242,  104,  102,
			  103,  331,  331,  248,  104,   94,  243,  102,  103,   91,

			  247,  129,  104,  102,  103,  126,  102,  103,  104,  249,
			  250,  104,  102,  103,  125,  102,  103,  104,  102,  103,
			  104,  247,  110,  104,   63,  102,  103,  252,  254,  253,
			  104,  251,   95,  102,  103,   95,  255,   91,  104,   91,
			  102,  103,  263,  102,  103,  104,  360,  360,  104,   90,
			  253,  264,  265,  102,  103,  102,  103,  255,  104,   89,
			  104,  102,  103,  263,  102,  103,  104,  266,  268,  104,
			  102,  103,  264,   88,  267,  104,  265,  102,  103,  273,
			  274,  273,  104,  102,  103,  270,  269,  271,  104,  102,
			  103,  279,  279,  279,  104,  275,  276,  275,   87,  102,

			  103,   74,  272,  277,  104,  102,  103,   64,  271,   63,
			  104,  279,  279,  279,  102,  103,  294,  294,  294,  104,
			  444,  102,  103,  278,  102,  103,  104,   58,  278,  104,
			   54,  102,  103,  102,  103,  281,  104,   48,  104,  298,
			  299,  298,  102,  103,  291,  290,  444,  104,  102,  103,
			  294,  294,  294,  104,  280,  292,  444,  102,  103,  444,
			  102,  103,  104,  361,  362,  104,  102,  103,  293,  384,
			  384,  104,  102,  103,  298,  299,  298,  104,  102,  103,
			  306,  328,  306,  104,  102,  103,  296,  300,  444,  104,
			  295,  102,  103,  297,  102,  103,  104,  361,  362,  104, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  444,  102,  103,  444,  301,  444,  104,  444,  102,  103,
			  385,  385,  300,  104,  444,  302,  303,  102,  103,  102,
			  103,  444,  104,  444,  104,  102,  103,  444,  312,  313,
			  104,  102,  103,  317,  318,  317,  104,  102,  103,  444,
			  102,  103,  104,  102,  103,  104,  102,  103,  104,  314,
			  444,  104,  315,  313,  394,  394,  316,  319,  320,  321,
			  322,  321,  102,  103,  317,  318,  317,  104,  444,  102,
			  103,  102,  103,  323,  104,  444,  104,  102,  103,  320,
			  394,  394,  104,  333,  334,  333,  102,  103,  323,  444,
			  324,  104,  444,  102,  103,  102,  103,  444,  104,  444,

			  104,  337,  338,  337,  102,  103,  335,  444,  336,  104,
			  444,  102,  103,  321,  322,  321,  104,  102,  103,  325,
			  343,  325,  104,  341,  342,  341,  329,  346,  329,  444,
			  340,  102,  103,  102,  103,  444,  104,  339,  104,  348,
			  349,  444,  331,  331,  333,  334,  333,  102,  103,  337,
			  338,  337,  104,  102,  103,  444,  351,  444,  104,  102,
			  103,  341,  342,  341,  104,  348,  102,  103,  384,  384,
			  352,  104,  102,  103,  392,  404,  392,  104,  353,  102,
			  103,  444,  354,  444,  104,  102,  103,  363,  352,  444,
			  104,  364,  365,  348,  372,  444,  360,  360,  407,  407,

			  354,  102,  103,  366,  102,  103,  104,  102,  103,  104,
			  102,  103,  104,  102,  103,  104,  423,  423,  104,  375,
			  444,  376,  378,  444,  366,  444,  377,  444,  102,  103,
			  444,  386,  444,  104,  102,  103,  102,  103,  444,  104,
			  375,  104,  376,  400,  401,  400,  444,  378,  387,  395,
			  396,  444,  385,  385,  102,  103,  388,  102,  103,  104,
			  430,  430,  104,  444,  389,  102,  103,  430,  430,  397,
			  104,  400,  401,  400,  388,  102,  103,  444,  398,  444,
			  104,  102,  103,  399,  102,  103,  104,  444,  444,  104,
			  102,  103,  408,  395,  415,  104,  407,  407,  444,  410,

			  444,  444,  409,  444,  399,  102,  103,  102,  103,  444,
			  104,  444,  104,  408,  102,  103,  102,  103,  416,  104,
			  444,  104,  444,  409,  410,  444,  102,  103,  417,  102,
			  103,  104,  395,  444,  104,  423,  423,  444,  444,  418,
			  424,  425,  426,  431,  432,  431,  102,  103,  427,  435,
			  427,  104,  444,  102,  103,  434,  434,  434,  104,  431,
			  432,  431,  444,  433,  444,  102,  103,  102,  103,  444,
			  104,  444,  104,  434,  434,  434,  102,  103,  444,  444,
			  437,  104,  444,  444,  433,  444,  441,  442,  441,  440,
			  443,  440,  441,  442,  441,  444,  102,  103,  444,  444,

			  439,  104,   47,   47,   47,   47,   47,   47,   47,   47,
			   47,   47,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   59,   59,   59,   59,   59,   59,   59,   59,
			   59,   59,   65,   65,   65,   65,   65,   65,   65,   65,
			   68,   68,   68,   68,   68,   68,   68,   68,   86,  444,
			   86,   86,   86,   86,   86,   86,   86,   86,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   64,   64,
			   64,   64,   64,   64,   64,   64,   64,   64,   99,   99,

			   99,   99,   99,   99,   99,   99,   99,   99,  131,  131,
			  131,  131,  131,  131,  131,  131,  132,  132,  132,  132,
			  132,  132,  132,  132,  160,  160,  160,  160,  186,  186,
			  186,  186,  186,  186,  186,  186,  187,  187,  187,  187,
			  187,  187,  212,  212,  212,  212,  212,  212,  212,  212,
			  237,  237,  237,  237,  237,  237,  261,  261,  261,  261,
			  261,  261,  261,  261,  289,  289,  289,  289,  309,  309,
			  309,  309,  309,  309,  309,  309,  311,  311,  311,  311,
			  311,  311,  350,  350,  350,  350,  350,  350,  373,  373,
			  373,  373,  373,  373,    9,  444,  444,  444,  444,  444,

			  444,  444,  444,  444,  444,  444,  444,  444,  444,  444,
			  444,  444,  444,  444,  444,  444,  444,  444,  444,  444,
			  444,  444,  444,  444,  444,  444,  444,  444,  444,  444,
			  444,  444,  444,  444,  444,  444,  444,  444,  444,  444,
			  444,  444,  444,  444,  444,  444,  444,  444,  444, yy_Dummy>>,
			1, 649, 1000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1648)
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
			    6,    8,    8,    2,    2,   89,   11,    2,   11,    2,
			    2,    2,   29,   29,    4,   89,    4,    4,   32,   32,
			    2,    2,    2,  308,    2,    2,   23,    2,   23,   23,
			    4,   28,   28,   30,   30,   31,   31,   32,  308,    4,

			    4,    4,  126,   28,   33,   33,   40,   40,   31,  438,
			   38,   38,   41,   41,   30,   39,   39,   43,   43,   40,
			  126,   33,   38,   45,   45,   42,   42,   28,   44,   44,
			   38,  305,   41,   38,   42,  305,   39,   43,  128,   43,
			   46,   46,   33,   56,   56,   45,   38,   44,   60,   60,
			   62,   38,   62,   46,   44,   66,   66,   43,   67,   42,
			   67,   67,  128,   45,   64,   64,   64,   64,   64,   64,
			   64,   64,   64,   64,   64,   93,   93,   64,   97,   97,
			   64,   64,   64,   64,   68,   68,   69,   69,  100,   68,
			  100,   69,   70,   70,   71,   71,  138,   70,  101,   71,

			  101,  101,  102,  102,   69,   64,   64,   64,   72,   72,
			   73,   73,   70,   72,   71,   73,   75,   75,   76,   76,
			  436,   75,   73,   76,  127,   69,  138,   79,   79,   76,
			   77,   77,   79,   78,   78,   77,   75,  129,   78,   80,
			   80,   72,  103,  103,   80,  127,   73,   78,  156,   77,
			   77,   81,   81,   76,   79,  129,   81,   78,  157,   80,
			   82,   82,   83,   83,  429,   82,  156,   83,  421,   79,
			   84,   84,  420,   82,  419,   84,   81,   85,   85,  157,
			   83,  183,   85,   84,  105,  105,  106,  106,  181,  105,
			  184,  106,  107,  107,  130,  130,   85,  107,  108,  108,

			   85,   83,  183,  108,  414,  107,  106,  109,  109,  111,
			  111,  184,  109,  181,  111,  112,  112,  105,   85,  413,
			  112,  108,  113,  113,  131,  131,  185,  113,  115,  115,
			  111,  112,  231,  115,  348,  114,  114,  116,  116,  108,
			  114,  348,  116,  412,  113,  115,  114,  210,  116,  117,
			  117,  185,  112,  231,  117,  114,  118,  118,  117,  119,
			  119,  118,  113,  411,  119,  210,  115,  406,  120,  120,
			  114,  118,  116,  120,  121,  121,  405,  122,  122,  121,
			  119,  233,  122,  117,  123,  123,  259,  121,  122,  123,
			  369,  120,  124,  124,  132,  132,  393,  124,  357,  132,

			  134,  134,  233,  135,  135,  134,  123,  259,  135,  120,
			  391,  124,  122,  136,  136,  369,  137,  137,  136,  357,
			  158,  137,  158,  158,  123,  139,  139,  134,  135,  137,
			  139,  345,  140,  140,  141,  141,  136,  140,  390,  141,
			  186,  186,  134,  142,  142,  140,  143,  143,  142,  345,
			  139,  143,  144,  144,  136,  141,  142,  144,  145,  145,
			  146,  146,  382,  145,  347,  146,  143,  147,  147,  148,
			  148,  381,  147,  380,  148,  144,  159,  159,  148,  159,
			  159,  145,  347,  149,  149,  147,  146,  379,  149,  168,
			  168,  150,  150,  144,  168,  371,  150,  151,  151,  145,

			  152,  152,  151,  148,  367,  152,  147,  149,  150,  159,
			  368,  161,  161,  395,  168,  151,  161,  152,  162,  162,
			  395,  163,  163,  162,  161,  367,  163,  164,  164,  150,
			  163,  368,  164,  370,  167,  167,  151,  402,  152,  167,
			  362,  162,  359,  167,  358,  164,  356,  169,  169,  170,
			  170,  403,  169,  355,  170,  163,  171,  171,  402,  162,
			  344,  171,  212,  212,  172,  172,  164,  169,  167,  172,
			  330,  170,  403,  171,  173,  173,  327,  174,  174,  173,
			  428,  172,  174,  175,  175,  326,  174,  311,  175,  170,
			  307,  173,  176,  176,  171,  236,  236,  176,  177,  177,

			  177,  428,  172,  304,  175,  178,  178,  288,  177,  177,
			  178,  174,  173,  177,  178,  179,  179,  176,  180,  180,
			  179,  188,  188,  180,  179,  286,  188,  189,  189,  190,
			  190,  285,  189,  284,  190,  202,  202,  202,  180,  178,
			  191,  191,  192,  192,  188,  191,  283,  192,  189,  179,
			  193,  193,  282,  191,  190,  193,  194,  194,  195,  195,
			  260,  194,  188,  195,  258,  196,  196,  192,  257,  194,
			  196,  197,  197,  245,  245,  245,  197,  256,  193,  198,
			  198,  199,  199,  195,  198,  237,  199,  235,  198,  234,
			  196,  261,  261,  197,  200,  200,  199,  201,  201,  200,

			  204,  204,  201,  205,  205,  204,  287,  287,  205,  200,
			  232,  197,  211,  198,  201,  206,  206,  209,  204,  208,
			  206,  214,  214,  207,  215,  215,  214,  187,  205,  215,
			  273,  273,  273,  216,  216,  201,  206,  182,  216,  204,
			  309,  309,  215,  217,  217,  214,  216,  165,  217,  218,
			  218,  155,  217,  154,  218,  153,  219,  219,  125,  220,
			  220,  219,  110,  215,  220,  104,  218,   99,  223,  223,
			  221,  221,  221,  223,  275,  275,  275,  217,  219,  220,
			  221,  221,   96,  222,  222,  221,   95,  218,  222,  224,
			  224,  310,  310,  223,  224,   92,  219,  225,  225,   91,

			  222,   90,  225,  226,  226,   88,  227,  227,  226,  224,
			  225,  227,  228,  228,   87,  229,  229,  228,  230,  230,
			  229,  222,   74,  230,   63,  238,  238,  227,  229,  228,
			  238,  226,   61,  239,  239,   58,  230,   57,  239,   54,
			  240,  240,  238,  241,  241,  240,  349,  349,  241,   52,
			  228,  239,  240,  242,  242,  243,  243,  230,  242,   51,
			  243,  244,  244,  238,  247,  247,  244,  241,  243,  247,
			  248,  248,  239,   50,  242,  248,  240,  249,  249,  250,
			  250,  250,  249,  252,  252,  247,  244,  248,  252,  250,
			  250,  279,  279,  279,  250,  251,  251,  251,   49,  253,

			  253,   34,  249,  252,  253,  251,  251,   20,  248,   12,
			  251,  254,  254,  254,  255,  255,  294,  294,  294,  255,
			    9,  254,  254,  253,  263,  263,  254,    7,  253,  263,
			    5,  264,  264,  265,  265,  255,  264,    3,  265,  298,
			  298,  298,  266,  266,  264,  263,    0,  266,  267,  267,
			  268,  268,  268,  267,  254,  266,    0,  269,  269,    0,
			  268,  268,  269,  350,  350,  268,  270,  270,  267,  372,
			  372,  270,  271,  271,  272,  272,  272,  271,  277,  277,
			  306,  306,  306,  277,  272,  272,  270,  277,    0,  272,
			  269,  278,  278,  271,  280,  280,  278,  373,  373,  280, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,  281,  281,    0,  278,    0,  281,    0,  290,  290,
			  374,  374,  277,  290,    0,  280,  281,  291,  291,  292,
			  292,    0,  291,    0,  292,  293,  293,    0,  290,  291,
			  293,  295,  295,  296,  296,  296,  295,  297,  297,    0,
			  300,  300,  297,  296,  296,  300,  302,  302,  296,  293,
			    0,  302,  295,  291,  383,  383,  295,  297,  300,  301,
			  301,  301,  303,  303,  317,  317,  317,  303,    0,  301,
			  301,  312,  312,  302,  301,    0,  312,  313,  313,  300,
			  394,  394,  313,  314,  314,  314,  315,  315,  302,    0,
			  303,  315,    0,  314,  314,  316,  316,    0,  314,    0,

			  316,  319,  319,  319,  320,  320,  315,    0,  316,  320,
			    0,  319,  319,  321,  321,  321,  319,  323,  323,  325,
			  325,  325,  323,  324,  324,  324,  329,  329,  329,    0,
			  323,  335,  335,  324,  324,    0,  335,  320,  324,  331,
			  331,    0,  331,  331,  333,  333,  333,  336,  336,  337,
			  337,  337,  336,  339,  339,    0,  335,    0,  339,  340,
			  340,  341,  341,  341,  340,  384,  351,  351,  384,  384,
			  336,  351,  352,  352,  392,  392,  392,  352,  339,  353,
			  353,    0,  340,    0,  353,  354,  354,  351,  336,    0,
			  354,  352,  353,  360,  360,    0,  360,  360,  396,  396,

			  340,  363,  363,  354,  364,  364,  363,  365,  365,  364,
			  375,  375,  365,  366,  366,  375,  415,  415,  366,  363,
			    0,  364,  366,    0,  354,    0,  365,    0,  376,  376,
			    0,  375,    0,  376,  377,  377,  378,  378,    0,  377,
			  363,  378,  364,  400,  400,  400,    0,  366,  376,  385,
			  385,    0,  385,  385,  386,  386,  377,  387,  387,  386,
			  422,  422,  387,    0,  378,  388,  388,  430,  430,  386,
			  388,  389,  389,  389,  377,  397,  397,    0,  387,    0,
			  397,  389,  389,  388,  398,  398,  389,    0,    0,  398,
			  399,  399,  397,  407,  407,  399,  407,  407,    0,  399,

			    0,    0,  398,    0,  388,  408,  408,  409,  409,    0,
			  408,    0,  409,  397,  410,  410,  416,  416,  408,  410,
			    0,  416,    0,  398,  399,    0,  417,  417,  409,  418,
			  418,  417,  423,    0,  418,  423,  423,    0,    0,  410,
			  416,  417,  418,  424,  424,  424,  425,  425,  427,  427,
			  427,  425,    0,  424,  424,  426,  426,  426,  424,  431,
			  431,  431,    0,  425,    0,  426,  426,  433,  433,    0,
			  426,    0,  433,  434,  434,  434,  437,  437,    0,    0,
			  433,  437,    0,    0,  425,    0,  439,  439,  439,  440,
			  440,  440,  441,  441,  441,    0,  439,  439,    0,    0,

			  437,  439,  445,  445,  445,  445,  445,  445,  445,  445,
			  445,  445,  446,  446,  446,  446,  446,  446,  446,  446,
			  446,  446,  447,  447,  447,  447,  447,  447,  447,  447,
			  447,  447,  448,  448,  448,  448,  448,  448,  448,  448,
			  448,  448,  449,  449,  449,  449,  449,  449,  449,  449,
			  450,  450,  450,  450,  450,  450,  450,  450,  451,    0,
			  451,  451,  451,  451,  451,  451,  451,  451,  452,  452,
			  452,  452,  452,  452,  452,  452,  452,  452,  453,  453,
			  453,  453,  453,  453,  453,  453,  453,  453,  454,  454,
			  454,  454,  454,  454,  454,  454,  454,  454,  455,  455,

			  455,  455,  455,  455,  455,  455,  455,  455,  456,  456,
			  456,  456,  456,  456,  456,  456,  457,  457,  457,  457,
			  457,  457,  457,  457,  458,  458,  458,  458,  459,  459,
			  459,  459,  459,  459,  459,  459,  460,  460,  460,  460,
			  460,  460,  461,  461,  461,  461,  461,  461,  461,  461,
			  462,  462,  462,  462,  462,  462,  463,  463,  463,  463,
			  463,  463,  463,  463,  464,  464,  464,  464,  465,  465,
			  465,  465,  465,  465,  465,  465,  466,  466,  466,  466,
			  466,  466,  467,  467,  467,  467,  467,  467,  468,  468,
			  468,  468,  468,  468,  444,  444,  444,  444,  444,  444,

			  444,  444,  444,  444,  444,  444,  444,  444,  444,  444,
			  444,  444,  444,  444,  444,  444,  444,  444,  444,  444,
			  444,  444,  444,  444,  444,  444,  444,  444,  444,  444,
			  444,  444,  444,  444,  444,  444,  444,  444,  444,  444,
			  444,  444,  444,  444,  444,  444,  444,  444,  444, yy_Dummy>>,
			1, 649, 1000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,   34,  934,   53,  927,   57,  924,   59,  920,
			 1594,   64,  906, 1594, 1594, 1594, 1594, 1594, 1594, 1594,
			  895,    0, 1594,   73, 1594, 1594, 1594, 1594,   79,   60,
			   81,   83,   66,   92,  851, 1594, 1594,    0,   98,  103,
			   94,  100,  113,  105,  116,  111,  128,    0, 1594,  866,
			  840,  834,  824, 1594,  836, 1594,  141,  834,  832, 1594,
			  146,  829,  148,  821,  163,    0,  140,  145,  172,  174,
			  180,  182,  196,  198,  774,  204,  206,  218,  221,  215,
			  227,  239,  248,  250,  258,  265,    0,  782,  774,   39,
			  770,  796,  792,  173, 1594,  783,  779,  176, 1594,  764,

			  186,  185,  190,  230,  748,  272,  274,  280,  286,  295,
			  746,  297,  303,  310,  323,  316,  325,  337,  344,  347,
			  356,  362,  365,  372,  380,  725,   68,  195,  115,  203,
			  279,  312,  382,    0,  388,  391,  401,  404,  183,  413,
			  420,  422,  431,  434,  440,  446,  448,  455,  457,  471,
			  479,  485,  488,  718,  720,  719,  213,  228,  407,  464,
			    0,  499,  506,  509,  515,  731, 1594,  522,  477,  535,
			  537,  544,  552,  562,  565,  571,  580,  596,  593,  603,
			  606,  267,  705,  252,  261,  305,  428,  715,  609,  615,
			  617,  628,  630,  638,  644,  646,  653,  659,  667,  669,

			  682,  685,  633, 1594,  688,  691,  703,  686,  694,  680,
			  313,  675,  550,    0,  709,  712,  721,  731,  737,  744,
			  747,  768,  771,  756,  777,  785,  791,  794,  800,  803,
			  806,  303,  678,  352,  652,  662,  583,  673,  813,  821,
			  828,  831,  841,  843,  849,  671, 1594,  852,  858,  865,
			  877,  893,  871,  887,  909,  902,  644,  631,  631,  357,
			  615,  679,    0,  912,  919,  921,  930,  936,  948,  945,
			  954,  960,  972,  728, 1594,  772, 1594,  966,  979,  889,
			  982,  989,  620,  601,  601,  598,  592,  694,  553,    0,
			  996, 1005, 1007, 1013,  914, 1019, 1031, 1025,  937, 1594,

			 1028, 1057, 1034, 1050,  567,   98,  978,  558,   44,  728,
			  776,  574, 1059, 1065, 1081, 1074, 1083, 1062, 1594, 1099,
			 1092, 1111, 1594, 1105, 1121, 1117,  553,  551, 1594, 1124,
			  545, 1127,    0, 1142, 1594, 1119, 1135, 1147, 1594, 1141,
			 1147, 1159, 1594, 1594,  523,  396, 1594,  429,  288,  831,
			  951, 1154, 1160, 1167, 1173,  520,  515,  368,  493,  495,
			 1181,    0,  486, 1189, 1192, 1195, 1201,  474,  481,  369,
			  481,  482,  954,  985,  995, 1198, 1216, 1222, 1224,  454,
			  441,  431,  413, 1039, 1153, 1237, 1242, 1245, 1253, 1269,
			  411,  377, 1172,  350, 1065,  467, 1183, 1263, 1272, 1278,

			 1241, 1594,  508,  521, 1594,  325,  320, 1281, 1293, 1295,
			 1302,  338,  310,  267,  291, 1201, 1304, 1314, 1317,  238,
			  245,  219, 1245, 1320, 1341, 1334, 1353, 1346,  551,  218,
			 1252, 1357, 1594, 1355, 1371, 1594,  195, 1364,   73, 1384,
			 1387, 1390, 1594, 1594, 1594, 1401, 1411, 1421, 1431, 1439,
			 1447, 1457, 1467, 1477, 1487, 1497, 1505, 1513, 1517, 1525,
			 1531, 1539, 1545, 1553, 1557, 1565, 1571, 1577, 1583, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  444,    1,  445,  445,  446,  447,  446,  448,  444,
			  444,  444,  444,  444,  444,  444,  444,  444,  444,  444,
			  449,  449,  444,  449,  444,  444,  444,  444,  450,  450,
			  450,  450,  450,  450,  444,  444,  444,  449,  450,  450,
			  450,  450,  450,  450,  450,  450,  450,  451,  444,  451,
			  451,  451,  451,  444,  444,  444,  452,  444,  444,  444,
			  453,  444,  444,  444,  454,  449,  449,  449,  450,  450,
			  450,  450,  450,  450,  444,  450,  450,  450,  450,  450,
			  450,  450,  450,  450,  450,  450,  451,  451,  451,  451,
			  451,  444,  452,  452,  444,  444,  453,  453,  444,  455,

			  444,  449,  456,  457,  444,  450,  450,  450,  450,  450,
			  444,  450,  450,  450,  450,  450,  450,  450,  450,  450,
			  450,  450,  450,  450,  450,  451,  451,  451,  451,  451,
			  449,  456,  457,  458,  450,  450,  450,  450,  444,  450,
			  450,  450,  450,  450,  450,  450,  450,  450,  450,  450,
			  450,  450,  450,  451,  451,  451,  451,  451,  449,  459,
			  460,  450,  450,  450,  450,  444,  444,  450,  450,  450,
			  450,  450,  450,  450,  450,  450,  450,  450,  450,  450,
			  450,  451,  451,  451,  451,  451,  461,  460,  450,  450,
			  450,  450,  450,  450,  450,  450,  450,  450,  450,  450,

			  450,  450,  444,  444,  450,  450,  450,  451,  451,  451,
			  451,  451,  461,  462,  450,  450,  450,  450,  450,  450,
			  450,  450,  450,  450,  450,  450,  450,  450,  450,  450,
			  450,  451,  451,  451,  451,  451,  463,  462,  450,  450,
			  450,  450,  450,  450,  450,  444,  444,  450,  450,  450,
			  450,  450,  450,  450,  450,  450,  451,  451,  451,  451,
			  451,  463,  464,  450,  450,  450,  450,  450,  450,  450,
			  450,  450,  450,  444,  444,  444,  444,  450,  450,  444,
			  450,  450,  451,  451,  451,  451,  451,  465,  449,  466,
			  450,  450,  450,  450,  444,  450,  450,  450,  444,  444,

			  450,  450,  450,  450,  451,  451,  451,  451,  451,  465,
			  449,  466,  450,  450,  450,  450,  450,  444,  444,  450,
			  450,  444,  444,  450,  450,  451,  451,  451,  444,  451,
			  451,  449,  467,  444,  444,  450,  450,  444,  444,  450,
			  450,  444,  444,  444,  451,  451,  444,  451,  449,  449,
			  467,  450,  450,  450,  450,  451,  451,  451,  449,  449,
			  449,  468,  444,  450,  450,  450,  450,  451,  451,  451,
			  449,  449,  449,  468,  444,  450,  450,  450,  450,  451,
			  451,  451,  449,  449,  449,  444,  450,  450,  450,  450,
			  451,  451,  451,  449,  449,  444,  444,  450,  450,  450,

			  444,  444,  451,  451,  444,  444,  444,  444,  450,  450,
			  450,  451,  451,  444,  444,  444,  450,  450,  450,  451,
			  451,  444,  444,  444,  450,  450,  450,  451,  451,  444,
			  444,  444,  444,  450,  444,  444,  451,  450,  451,  450,
			  451,  444,  444,  444,    0,  444,  444,  444,  444,  444,
			  444,  444,  444,  444,  444,  444,  444,  444,  444,  444,
			  444,  444,  444,  444,  444,  444,  444,  444,  444, yy_Dummy>>)
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
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   64,
			   62,    1,    2,   15,   18,   16,   17,    7,    6,   13,
			    5,   11,    8,   61,   14,   12,   10,   19,   61,   61,
			   61,   61,   61,   61,   20,   21,    9,   61,   61,   61,
			   61,   61,   61,   61,   61,   61,   61,   51,   50,   51,
			   51,   51,   51,   63,   53,   54,   63,   53,   56,   57,
			   63,   56,    1,    2,    3,   61,   61,   61,   60,   60,
			   60,   60,   60,   60,    0,   60,   60,   60,   60,   60,
			   60,   60,   60,   60,   60,   60,   51,   51,   51,   51,
			   51,   53,    0,    0,   52,   56,    0,    0,   55,    3,

			    4,   58,   61,   61,    0,   60,   60,   60,   60,   30,
			    0,   60,   60,   60,   60,   60,   60,   60,   60,   60,
			   60,   60,   60,   60,   60,   51,   51,   51,   51,   51,
			   61,   61,   61,    0,   60,   60,   60,   60,    0,   60,
			   60,   60,   60,   60,   60,   60,   60,   60,   60,   60,
			   60,   60,   60,   51,   51,   51,   51,   51,   58,   61,
			    0,   60,   60,   60,   60,    0,   43,   60,   60,   60,
			   60,   60,   60,   60,   60,   60,   60,   60,   60,   60,
			   60,   51,   51,   51,   51,   51,   61,    0,   60,   60,
			   60,   60,   60,   60,   60,   60,   60,   60,   60,   60,

			   60,   60,    0,   35,   60,   60,   60,   51,   51,   51,
			   51,   51,   61,    0,   60,   60,   60,   60,   60,   60,
			   60,   60,   60,   60,   60,   60,   60,   60,   60,   60,
			   60,   51,   51,   51,   51,   51,   61,    0,   60,   60,
			   60,   60,   60,   60,   60,    0,   39,   60,   60,   60,
			   60,   60,   60,   60,   60,   60,   51,   51,   51,   51,
			   51,   61,    0,   60,   60,   29,   60,   60,   60,   60,
			   60,   60,   60,    0,   32,    0,   42,   60,   60,   24,
			   60,   60,   51,   51,   51,   51,   51,   61,   61,    0,
			   60,   60,   27,   60,   22,   60,   60,   60,    0,   41,

			   60,   60,   60,   60,   51,   51,   51,   51,   51,   61,
			   61,    0,   26,   28,   60,   60,   60,    0,   34,   60,
			   60,    0,   31,   60,   60,   51,   51,   51,   46,   51,
			   51,   59,    0,    0,   37,   60,   60,    0,   33,   60,
			   60,    0,   36,   47,   51,   51,   45,   51,   61,   61,
			    0,   60,   60,   60,   60,   51,   51,   51,   61,   61,
			   59,    0,    0,   60,   60,   60,   60,   51,   51,   51,
			   61,   59,   61,    0,    0,   60,   60,   60,   60,   51,
			   51,   51,   61,   61,   59,   59,   60,   60,   60,   60,
			   51,   51,   51,   61,   59,    0,    0,   60,   60,   60,

			    0,   23,   51,   51,   44,    0,    0,   59,   60,   60,
			   60,   51,   51,    0,   59,    0,   60,   60,   60,   51,
			   51,    0,    0,   59,   60,   60,   60,   51,   51,    0,
			   59,    0,   40,   60,   25,   48,   51,   60,   51,   60,
			   51,    0,   38,   49,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 1594
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 444
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 445
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

	yyNb_rules: INTEGER = 63
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 64
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
