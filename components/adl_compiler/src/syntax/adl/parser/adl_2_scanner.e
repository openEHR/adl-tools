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
			Result := (INITIAL <= sc and sc <= IN_TEMPLATE_OVERLAYS_SECTION)
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
if yy_act <= 33 then
if yy_act <= 17 then
if yy_act <= 9 then
if yy_act <= 5 then
if yy_act <= 3 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 75 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 75")
end
-- Ignore separators
else
--|#line 76 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 76")
end
in_lineno := in_lineno + text_count
end
else
--|#line 81 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 81")
end
	-- Overlay split line
		in_lineno := in_lineno + 1
		set_start_condition (IN_TEMPLATE_OVERLAYS_SECTION)

end
else
if yy_act = 4 then
--|#line 88 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 88")
end
-- Ignore comments
else
--|#line 89 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 89")
end
in_lineno := in_lineno + 1
end
end
else
if yy_act <= 7 then
if yy_act = 6 then
--|#line 93 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 93")
end
last_token := Minus_code
else
--|#line 94 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 94")
end
last_token := Plus_code
end
else
if yy_act = 8 then
--|#line 95 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 95")
end
last_token := Star_code
else
--|#line 96 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 96")
end
last_token := Slash_code
end
end
end
else
if yy_act <= 13 then
if yy_act <= 11 then
if yy_act = 10 then
--|#line 97 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 97")
end
last_token := Caret_code
else
--|#line 98 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 98")
end
last_token := Equal_code
end
else
if yy_act = 12 then
--|#line 99 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 99")
end
last_token := Dot_code
else
--|#line 100 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 100")
end
last_token := Semicolon_code
end
end
else
if yy_act <= 15 then
if yy_act = 14 then
--|#line 101 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 101")
end
last_token := Comma_code
else
--|#line 102 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 102")
end
last_token := Colon_code
end
else
if yy_act = 16 then
--|#line 103 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 103")
end
last_token := Exclamation_code
else
--|#line 104 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 104")
end
last_token := Left_parenthesis_code
end
end
end
end
else
if yy_act <= 25 then
if yy_act <= 21 then
if yy_act <= 19 then
if yy_act = 18 then
--|#line 105 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 105")
end
last_token := Right_parenthesis_code
else
--|#line 106 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 106")
end
last_token := Dollar_code
end
else
if yy_act = 20 then
--|#line 107 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 107")
end
last_token := Question_mark_code
else
--|#line 109 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 109")
end
last_token := Left_bracket_code
end
end
else
if yy_act <= 23 then
if yy_act = 22 then
--|#line 110 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 110")
end
last_token := Right_bracket_code
else
--|#line 114 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 114")
end

				last_token := SYM_ARCHETYPE
			
end
else
if yy_act = 24 then
--|#line 118 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 118")
end

				last_token := SYM_TEMPLATE_OVERLAY
			
else
--|#line 122 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 122")
end

				last_token := SYM_TEMPLATE
			
end
end
end
else
if yy_act <= 29 then
if yy_act <= 27 then
if yy_act = 26 then
--|#line 126 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 126")
end

				last_token := SYM_OPERATIONAL_TEMPLATE
			
else
--|#line 130 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 130")
end

				last_token := SYM_ADL_VERSION
			
end
else
if yy_act = 28 then
--|#line 134 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 134")
end

				last_token := SYM_RM_RELEASE
			
else
--|#line 138 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 138")
end

				last_token := SYM_IS_CONTROLLED
			
end
end
else
if yy_act <= 31 then
if yy_act = 30 then
--|#line 142 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 142")
end

				last_token := SYM_IS_GENERATED
			
else
--|#line 146 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 146")
end

				last_token := SYM_UID
			
end
else
if yy_act = 32 then
--|#line 150 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 150")
end

				last_token := SYM_SPECIALIZE
				in_lineno := in_lineno + 1
			
else
--|#line 156 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 156")
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
if yy_act <= 49 then
if yy_act <= 41 then
if yy_act <= 37 then
if yy_act <= 35 then
if yy_act = 34 then
--|#line 163 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 163")
end

				last_token := SYM_DESCRIPTION
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				description_text_start_line := in_lineno
			
else
--|#line 170 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 170")
end

				last_token := SYM_DEFINITION
				set_start_condition (IN_CADL_SECTION)
				in_lineno := in_lineno + 1
				definition_text_start_line := in_lineno
			
end
else
if yy_act = 36 then
--|#line 177 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 177")
end

				last_token := SYM_RULES
				set_start_condition (IN_RULES_SECTION)
				in_lineno := in_lineno + 1
				rules_text_start_line := in_lineno
			
else
--|#line 184 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 184")
end

				last_token := SYM_TERMINOLOGY
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				terminology_text_start_line := in_lineno
			
end
end
else
if yy_act <= 39 then
if yy_act = 38 then
--|#line 191 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 191")
end

				last_token := SYM_ANNOTATIONS
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				annotations_text_start_line := in_lineno
			
else
--|#line 198 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 198")
end

				last_token := SYM_COMPONENT_TERMINOLOGIES
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				component_terminologies_text_start_line := in_lineno
			
end
else
if yy_act = 40 then
--|#line 208 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 208")
end

				last_token := SYM_COMPONENT_TERMINOLOGIES
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				component_terminologies_text_start_line := in_lineno
			
else
--|#line 215 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 215")
end

				last_token := SYM_RULES
				set_start_condition (IN_RULES_SECTION)
				in_lineno := in_lineno + 1
				rules_text_start_line := in_lineno
			
end
end
end
else
if yy_act <= 45 then
if yy_act <= 43 then
if yy_act = 42 then
--|#line 222 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 222")
end

				last_token := SYM_TERMINOLOGY
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				terminology_text_start_line := in_lineno
			
else
--|#line 228 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 228")
end

				last_token := V_CONCEPT_CODE
				last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 44 then
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
			
else
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
			
end
end
else
if yy_act <= 47 then
if yy_act = 46 then
--|#line 241 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 241")
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
--|#line 242 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 242")
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
if yy_act = 48 then
--|#line 243 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 243")
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
--|#line 244 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 244")
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
if yy_act <= 57 then
if yy_act <= 53 then
if yy_act <= 51 then
if yy_act = 50 then
--|#line 262 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 262")
end
 -- LF
				in_buffer.append_character('%N')
				in_lineno := in_lineno + 1
			
else
--|#line 267 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 267")
end
 -- any text on line with no LF
				in_buffer.append_string (text)
			
end
else
if yy_act = 52 then
--|#line 283 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 283")
end
			-- match ^whitespace <anything> \n
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
else
--|#line 288 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 288")
end
in_lineno := in_lineno + text_count
end
end
else
if yy_act <= 55 then
if yy_act = 54 then
--|#line 290 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 290")
end
 -- non-white space at start
				unread_character(text.item(1))
				last_token := V_CADL_TEXT
				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_
				set_start_condition (INITIAL)
	
else
--|#line 302 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 302")
end
			-- match ^whitespace <anything> \n
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
end
else
if yy_act = 56 then
--|#line 307 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 307")
end
in_lineno := in_lineno + text_count
else
--|#line 309 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 309")
end
 -- non-white space at start
				unread_character(text.item(1))
				last_token := V_RULES_TEXT
				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_
				set_start_condition (INITIAL)
	
end
end
end
else
if yy_act <= 61 then
if yy_act <= 59 then
if yy_act = 58 then
--|#line 321 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 321")
end
	-- Overlay split line
				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				overlay_adl_texts.extend (str_)
				in_lineno := in_lineno + 1
	
else
--|#line 329 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 329")
end
			-- match <anything> \n
				in_buffer.append_string (text)
				in_lineno := in_lineno + 1
	
end
else
if yy_act = 60 then
--|#line 345 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 345")
end

					last_token := V_DOTTED_NUMERIC
					last_string_value := text_substring (1, text_count)
			
else
--|#line 351 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 351")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
end
end
else
if yy_act <= 63 then
if yy_act = 62 then
--|#line 357 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 357")
end

					last_token := V_IDENTIFIER
					last_string_value := text
			
else
--|#line 363 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 363")
end

					last_token := V_VALUE
					last_string_value := text
			
end
else
if yy_act = 64 then
--|#line 370 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 370")
end
-- ignore unmatched chars
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
end
			yy_set_beginning_of_line
		end

	yy_execute_eof_action (yy_sc: INTEGER)
			-- Execute EOF semantic action.
		do
			inspect yy_sc
when 0, 2, 3 then
--|#line 369 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 369")
end
terminate
when 1 then
--|#line 271 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 271")
end

				-- get the ODIN section sorted out
				last_token := V_ODIN_TEXT
				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_
				set_start_condition (INITIAL)
			
when 4 then
--|#line 334 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 334")
end

				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				overlay_adl_texts.extend (str_)
				last_token := SYM_OVERLAY_TEXTS
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
			create an_array.make_filled (0, 0, 1720)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,   12,   13,   14,   13,   15,   16,   17,   18,   19,
			   20,   21,   22,   23,   24,   25,   25,   26,   27,   28,
			   29,   30,   31,   32,   31,   31,   31,   33,   31,   31,
			   31,   31,   31,   31,   31,   34,   31,   31,   35,   31,
			   31,   31,   36,   37,   38,   39,   30,   32,   31,   31,
			   31,   31,   31,   34,   31,   40,   59,   60,   63,   64,
			   66,   67,   72,   72,   41,   51,   42,   43,  108,   69,
			   68,   69,   44,   45,   52,  108,   46,  110,   47,   48,
			   49,   72,   72,   53,  142,   54,   55,   72,   72,   41,
			   42,   43,  490,   44,   45,   73,   47,   74,   74,   76,

			   72,   72,   77,   72,   72,  488,   72,   72,   53,   54,
			   55,   72,   72,   78,   72,   72,   72,   72,   76,   72,
			   72,  452,   79,   76,   72,   72,   83,  170,   80,   84,
			   72,   72,   86,   88,  169,   85,   87,   72,   72,   72,
			   72,   69,   76,   69,   72,   72,  112,   84,  112,   80,
			   89,  170,   90,  101,  102,  169,   79,   93,   88,  105,
			  106,   92,  473,   91,  109,  108,  113,  113,  108,   73,
			   90,   74,   74,  114,  115,  101,  102,  171,  116,   92,
			  111,  111,  112,  111,  111,  111,  111,  111,  111,  111,
			  111,  471,  140,  111,  105,  106,  111,  111,  111,  111,

			  114,  115,  141,  109,  108,  116,  114,  115,  114,  115,
			  470,  116,  179,  116,  114,  115,   72,   72,  117,  116,
			  385,  111,  111,  111,  114,  115,  118,  386,  119,  116,
			  114,  115,  469,  114,  115,  116,  121,  108,  116,  117,
			  114,  115,  180,  114,  115,  116,  200,  120,  116,  465,
			  124,  125,  126,  118,  463,  143,  132,  113,  113,  462,
			  121,  111,  111,  112,  111,  111,  111,  111,  111,  111,
			  111,  111,  123,  460,  111,  125,  108,  111,  111,  111,
			  111,  114,  115,  114,  115,  227,  116,  223,  116,  114,
			  115,  114,  115,  459,  116,  127,  116,   72,   72,  168,

			  172,  172,  111,  111,  111,  128,  114,  115,  458,  130,
			  129,  116,  223,  114,  115,  199,  131,  168,  116,  173,
			   72,  225,  454,  226,  133,  129,  134,  114,  115,  114,
			  115,  251,  116,  199,  116,  114,  115,  349,  114,  115,
			  116,  350,  225,  116,  226,  133,  135,  114,  115,  251,
			  136,  149,  116,  114,  115,  148,  114,  115,  116,  114,
			  115,  116,  147,  143,  116,  172,  172,  112,  136,  112,
			  150,  114,  115,   72,   72,  154,  116,  153,  114,  115,
			  114,  115,  273,  116,  275,  116,   72,  253,  150,  114,
			  115,  157,  304,  155,  116,  156,  154,  452,  158,  114,

			  115,  114,  115,  273,  116,  275,  116,  114,  115,  108,
			  451,  155,  116,  304,  159,  157,  156,  410,  252,  114,
			  115,  447,  160,  158,  116,  411,  114,  115,  114,  115,
			  161,  116,  162,  116,  114,  115,  443,  163,  410,  116,
			   72,  115,  114,  115,  400,  116,  411,  116,  161,  438,
			  164,  114,  115,  165,  114,  115,  116,  114,  115,  116,
			  437,  163,  116,  217,  218,  217,  114,  115,  164,  175,
			  178,  116,  383,  114,  115,  448,  176,  177,  116,  449,
			  114,  115,  114,  115,  175,  116,  183,  116,  114,  115,
			  383,  182,  436,  116,  430,  177,  448,  108,  114,  115,

			  449,  184,  185,  116,  114,  115,  277,  114,  115,  116,
			  484,  186,  116,  114,  115,   72,   72,  108,  116,  114,
			  115,  187,  190,  426,  116,  189,  305,  114,  115,  186,
			  188,  484,  116,  114,  115,  114,  115,  424,  116,  187,
			  116,  306,  307,  191,  192,  423,  189,  190,  291,  292,
			  291,  193,  194,   72,   72,  108,   72,   72,  114,  115,
			  422,  114,  115,  116,  329,  192,  116,   72,   72,  114,
			  115,  203,  193,  194,  116,  114,  115,  417,  205,  414,
			  116,  413,  114,  115,  204,  440,   72,  116,  293,  294,
			  293,  208,  441,  206,  114,  115,  297,  297,  297,  116,

			  114,  115,  204,  205,  409,  116,  114,  115,  114,  115,
			  404,  116,  108,  116,  206,  108,  208,  114,  115,  209,
			  210,  353,  116,  211,  372,  212,  114,  115,  114,  115,
			  403,  116,  400,  116,  213,  214,  114,  115,  114,  115,
			  399,  116,  397,  116,  211,  396,  212,  219,  395,  215,
			  306,  307,  217,  218,  217,  213,  314,  314,  314,  108,
			  214,  216,  114,  115,  114,  115,  390,  116,  384,  116,
			  114,  115,  219,  220,  382,  116,  114,  115,  381,  114,
			  115,  116,  114,  115,  116,  354,  354,  116,  114,  115,
			  221,  114,  115,  116,  387,  387,  116,  376,  220,  230,

			  231,  233,  370,  114,  115,  114,  115,  232,  116,  369,
			  116,  318,  319,  318,  114,  115,  235,  230,  237,  116,
			  114,  115,  367,  114,  115,  116,  388,  389,  116,  114,
			  115,  236,  240,  356,  116,  114,  115,  415,  415,  238,
			  116,  355,  239,  108,  241,  352,  114,  115,  114,  115,
			  242,  116,  398,  116,  114,  115,  348,  240,  347,  116,
			  239,  388,  389,  243,  114,  115,  244,  114,  115,  116,
			  114,  115,  116,  114,  115,  116,  114,  115,  116,  245,
			  335,  116,  331,  108,  243,  246,  257,  244,  256,  114,
			  115,  255,  412,  260,  116,  114,  115,  328,  258,  327,

			  116,  114,  115,  114,  115,  326,  116,  325,  116,  256,
			  324,  114,  115,  108,  260,  312,  116,  261,  416,  416,
			  263,  262,  425,  258,  114,  115,  114,  115,  303,  116,
			  302,  116,  114,  115,  301,  261,  264,  116,  300,  266,
			  284,  263,  114,  115,  265,  114,  115,  116,  114,  115,
			  116,  114,  115,  116,  114,  115,  116,  427,  427,  116,
			  267,  270,  269,  268,  279,  114,  115,  114,  115,  271,
			  116,  280,  116,  114,  115,  114,  115,  282,  116,  276,
			  116,  114,  115,  269,  274,  281,  116,  272,  114,  115,
			  271,  108,  280,  116,  286,  259,  285,  283,  114,  115,

			  439,  282,  250,  116,  114,  115,  281,  114,  115,  116,
			  427,  427,  116,  287,  291,  292,  291,  114,  115,  288,
			  249,  289,  116,  248,  114,  115,  293,  294,  293,  116,
			  114,  115,  290,  114,  115,  116,  114,  115,  116,  442,
			  442,  116,  289,  297,  297,  297,  114,  115,  464,  464,
			  295,  116,  108,  114,  115,  114,  115,  296,  116,  108,
			  116,  450,  296,  108,  114,  115,  247,  299,  461,  116,
			  114,  115,  472,  114,  115,  116,  309,  310,  116,  314,
			  314,  314,  234,  311,  474,  474,  298,  114,  115,  114,
			  115,  229,  116,  313,  116,  114,  115,  114,  115,  224, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  116,  222,  116,  207,  114,  115,  318,  319,  318,  116,
			  327,  351,  327,  320,  151,  316,  114,  115,  317,  198,
			  315,  116,  114,  115,  114,  115,  197,  116,  196,  116,
			  373,  114,  115,  415,  415,  321,  116,  195,  320,  114,
			  115,  181,  114,  115,  116,  322,  323,  116,  114,  115,
			  114,  115,  167,  116,  334,  116,  114,  115,  166,  333,
			  152,  116,  151,  114,  115,  339,  340,  339,  116,  339,
			  340,  339,  474,  474,  336,  114,  115,  337,  334,  146,
			  116,  338,  112,  341,  114,  115,  343,  344,  343,  116,
			  114,  115,  108,  114,  115,  116,  114,  115,  116,  114,

			  115,  116,  342,  106,  116,  114,  115,  114,  115,  103,
			  116,  102,  116,   99,  357,  358,  357,  345,  343,  344,
			  343,  346,  139,  342,  114,  115,  138,  359,  137,  116,
			  114,  115,  345,  122,   70,  116,  361,  362,  361,  114,
			  115,  108,  103,  360,  116,  103,  114,  115,  114,  115,
			   99,  116,   99,  116,  365,  366,  365,  348,  368,  348,
			   98,  364,   97,   96,  114,  115,  352,  371,  352,  116,
			  373,  374,  363,  354,  354,  357,  358,  357,  114,  115,
			   95,  114,  115,  116,   82,   81,  116,  361,  362,  361,
			  114,  115,   71,  114,  115,  116,   70,  494,  116,  365,

			  366,  365,   61,  377,  378,  114,  115,   57,  114,  115,
			  116,   51,  494,  116,  494,  379,  380,  494,  114,  115,
			  114,  115,  378,  116,  494,  116,  391,  392,  494,  373,
			  401,  393,  387,  387,  380,  114,  115,  494,  394,  494,
			  116,  114,  115,  114,  115,  494,  116,  494,  116,  114,
			  115,  114,  115,  405,  116,  494,  116,  494,  406,  394,
			  408,  494,  407,  114,  115,  494,  114,  115,  116,  494,
			  418,  116,  114,  115,  405,  114,  115,  116,  428,  406,
			  116,  464,  464,  419,  494,  408,  428,  429,  420,  416,
			  416,  494,  114,  115,  114,  115,  432,  116,  494,  116,

			  421,  494,  494,  434,  435,  434,  420,  431,  494,  494,
			  114,  115,  433,  114,  115,  116,  114,  115,  116,  114,
			  115,  116,  428,  453,  116,  442,  442,  444,  446,  434,
			  435,  434,  494,  433,  445,  494,  114,  115,  114,  115,
			  494,  116,  494,  116,  494,  114,  115,  494,  444,  455,
			  116,  114,  115,  446,  494,  445,  116,  114,  115,  456,
			  114,  115,  116,  494,  494,  116,  475,  476,  475,  494,
			  457,  494,  467,  468,  494,  466,  465,  477,  478,  477,
			  114,  115,  470,  483,  470,  116,  494,  114,  115,  480,
			  480,  480,  116,  481,  482,  481,  494,  479,  494,  114,

			  115,  494,  494,  469,  116,  485,  486,  485,  475,  476,
			  475,  477,  478,  477,  494,  472,  114,  115,  479,  494,
			  494,  116,  480,  480,  480,  481,  482,  481,  494,  487,
			  485,  486,  485,  114,  115,  491,  492,  491,  116,  490,
			  493,  490,  491,  492,  491,  114,  115,  494,  494,  494,
			  116,  174,  174,  174,  174,  494,  494,  489,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   65,   65,

			   65,   65,   65,   65,   65,   65,   65,   65,   72,   72,
			   72,   72,   72,   72,   72,   72,   75,   75,   75,   75,
			   75,   75,   75,   75,   94,  494,   94,   94,   94,   94,
			   94,   94,   94,   94,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  107,  107,  107,  107,  107,  107,
			  107,  107,  107,  107,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,  111,  111,  111,  111,  111,  111,
			  111,  111,  111,  111,  144,  144,  144,  144,  144,  144,
			  144,  144,  145,  145,  145,  145,  145,  145,  145,  145,

			  201,  201,  201,  201,  201,  201,  201,  201,  202,  202,
			  202,  202,  202,  202,  228,  228,  228,  228,  228,  228,
			  228,  228,  254,  254,  254,  254,  254,  254,  278,  278,
			  278,  278,  278,  278,  278,  278,  308,  308,  308,  308,
			  330,  330,  330,  330,  330,  330,  330,  330,  332,  332,
			  332,  332,  332,  332,  375,  375,  375,  375,  375,  375,
			  402,  402,  402,  402,  402,  402,   11,  494,  494,  494,
			  494,  494,  494,  494,  494,  494,  494,  494,  494,  494,
			  494,  494,  494,  494,  494,  494,  494,  494,  494,  494,
			  494,  494,  494,  494,  494,  494,  494,  494,  494,  494,

			  494,  494,  494,  494,  494,  494,  494,  494,  494,  494,
			  494,  494,  494,  494,  494,  494,  494,  494,  494,  494,
			  494, yy_Dummy>>,
			1, 721, 1000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1720)
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
			    1,    1,    1,    1,    1,    2,    6,    6,    8,    8,
			   10,   10,   31,   31,    2,    4,    2,    2,   68,   13,
			   10,   13,    2,    2,    4,  110,    2,   68,    2,    2,
			    2,   32,   32,    4,  110,    4,    4,   30,   30,    2,
			    2,    2,  488,    2,    2,   25,    2,   25,   25,   30,

			   33,   33,   32,   34,   34,  484,   41,   41,    4,    4,
			    4,   35,   35,   33,   42,   42,   44,   44,   41,   43,
			   43,  473,   34,   30,   45,   45,   41,  141,   35,   41,
			   46,   46,   43,   45,  140,   42,   44,   47,   47,   48,
			   48,   69,   41,   69,   49,   49,  112,   41,  112,   35,
			   46,  141,   46,   59,   59,  140,   47,   49,   45,   63,
			   63,   48,  462,   47,   66,   66,   73,   73,  142,   74,
			   46,   74,   74,   75,   75,  101,  101,  142,   75,   48,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,  460,   98,   71,  105,  105,   71,   71,   71,   71,

			   76,   76,   98,  109,  109,   76,   77,   77,   78,   78,
			  459,   77,  151,   78,   79,   79,  114,  114,   76,   79,
			  373,   71,   71,   71,   80,   80,   77,  373,   78,   80,
			   83,   83,  458,   85,   85,   83,   80,  171,   85,   76,
			   84,   84,  151,   90,   90,   84,  171,   79,   90,  454,
			   83,   84,   85,   85,  452,  113,   90,  113,  113,  451,
			   80,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,  449,   82,   84,  200,   82,   82,   82,
			   82,   86,   86,   87,   87,  200,   86,  196,   87,   88,
			   88,   89,   89,  448,   88,   86,   89,  115,  115,  139,

			  143,  143,   82,   82,   82,   86,   91,   91,  447,   88,
			   87,   91,  196,   92,   92,  170,   89,  139,   92,  144,
			  144,  198,  443,  199,   91,   87,   92,   93,   93,  117,
			  117,  226,   93,  170,  117,  118,  118,  326,  119,  119,
			  118,  326,  198,  119,  199,   91,   93,  120,  120,  226,
			   93,  119,  120,  121,  121,  118,  124,  124,  121,  125,
			  125,  124,  117,  172,  125,  172,  172,  476,   93,  476,
			  120,  126,  126,  201,  201,  125,  126,  124,  127,  127,
			  128,  128,  248,  127,  250,  128,  228,  228,  120,  129,
			  129,  128,  276,  126,  129,  127,  125,  441,  129,  130,

			  130,  131,  131,  248,  130,  250,  131,  132,  132,  227,
			  440,  126,  132,  276,  130,  128,  127,  396,  227,  133,
			  133,  436,  131,  129,  133,  397,  134,  134,  135,  135,
			  132,  134,  133,  135,  136,  136,  430,  134,  396,  136,
			  145,  145,  147,  147,  426,  145,  397,  147,  132,  424,
			  135,  148,  148,  136,  149,  149,  148,  150,  150,  149,
			  423,  134,  150,  217,  217,  217,  153,  153,  135,  147,
			  150,  153,  370,  154,  154,  437,  148,  149,  154,  438,
			  155,  155,  156,  156,  147,  155,  154,  156,  157,  157,
			  370,  153,  422,  157,  417,  149,  437,  252,  158,  158,

			  438,  155,  156,  158,  159,  159,  252,  160,  160,  159,
			  471,  157,  160,  161,  161,  253,  253,  277,  161,  162,
			  162,  158,  161,  413,  162,  160,  277,  163,  163,  157,
			  159,  471,  163,  164,  164,  165,  165,  411,  164,  158,
			  165,  278,  278,  162,  163,  410,  160,  161,  291,  291,
			  291,  164,  165,  173,  173,  305,  173,  173,  175,  175,
			  409,  176,  176,  175,  305,  163,  176,  306,  306,  177,
			  177,  175,  164,  165,  177,  178,  178,  404,  177,  400,
			  178,  399,  182,  182,  176,  428,  173,  182,  293,  293,
			  293,  182,  428,  178,  183,  183,  297,  297,  297,  183,

			  184,  184,  176,  177,  395,  184,  185,  185,  186,  186,
			  390,  185,  329,  186,  178,  353,  182,  187,  187,  183,
			  184,  329,  187,  185,  353,  186,  188,  188,  189,  189,
			  389,  188,  386,  189,  187,  188,  190,  190,  192,  192,
			  385,  190,  383,  192,  185,  382,  186,  192,  381,  189,
			  330,  330,  191,  191,  191,  187,  314,  314,  314,  372,
			  188,  190,  191,  191,  193,  193,  376,  191,  372,  193,
			  194,  194,  192,  193,  369,  194,  203,  203,  367,  204,
			  204,  203,  205,  205,  204,  331,  331,  205,  206,  206,
			  194,  208,  208,  206,  374,  374,  208,  356,  193,  203,

			  204,  206,  350,  209,  209,  210,  210,  205,  209,  349,
			  210,  318,  318,  318,  211,  211,  208,  203,  210,  211,
			  212,  212,  347,  213,  213,  212,  375,  375,  213,  214,
			  214,  209,  213,  335,  214,  215,  215,  401,  401,  211,
			  215,  332,  212,  384,  214,  328,  216,  216,  219,  219,
			  215,  216,  384,  219,  220,  220,  325,  213,  324,  220,
			  212,  402,  402,  216,  221,  221,  219,  230,  230,  221,
			  231,  231,  230,  232,  232,  231,  235,  235,  232,  220,
			  312,  235,  307,  398,  216,  221,  232,  219,  231,  233,
			  233,  230,  398,  235,  233,  236,  236,  304,  233,  303,

			  236,  237,  237,  238,  238,  302,  237,  301,  238,  231,
			  300,  239,  239,  412,  235,  284,  239,  236,  403,  403,
			  238,  237,  412,  233,  240,  240,  241,  241,  275,  240,
			  274,  241,  242,  242,  273,  236,  239,  242,  272,  241,
			  259,  238,  243,  243,  240,  244,  244,  243,  245,  245,
			  244,  246,  246,  245,  255,  255,  246,  414,  414,  255,
			  242,  245,  244,  243,  254,  257,  257,  256,  256,  246,
			  257,  255,  256,  258,  258,  260,  260,  257,  258,  251,
			  260,  261,  261,  244,  249,  256,  261,  247,  262,  262,
			  246,  425,  255,  262,  261,  234,  260,  258,  263,  263,

			  425,  257,  225,  263,  264,  264,  256,  265,  265,  264,
			  427,  427,  265,  262,  266,  266,  266,  282,  282,  263,
			  224,  264,  282,  223,  266,  266,  267,  267,  267,  266,
			  268,  268,  265,  269,  269,  268,  267,  267,  269,  429,
			  429,  267,  264,  270,  270,  270,  271,  271,  453,  453,
			  268,  271,  439,  270,  270,  280,  280,  269,  270,  450,
			  280,  439,  269,  461,  281,  281,  222,  271,  450,  281,
			  283,  283,  461,  285,  285,  283,  280,  281,  285,  286,
			  286,  286,  207,  283,  463,  463,  270,  287,  287,  286,
			  286,  202,  287,  285,  286,  288,  288,  289,  289,  197, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  288,  195,  289,  181,  295,  295,  290,  290,  290,  295,
			  327,  327,  327,  295,  179,  288,  290,  290,  289,  169,
			  287,  290,  296,  296,  298,  298,  168,  296,  167,  298,
			  415,  299,  299,  415,  415,  296,  299,  166,  295,  309,
			  309,  152,  310,  310,  309,  298,  299,  310,  311,  311,
			  313,  313,  138,  311,  310,  313,  315,  315,  137,  309,
			  123,  315,  122,  317,  317,  316,  316,  316,  317,  339,
			  339,  339,  474,  474,  313,  316,  316,  315,  310,  116,
			  316,  315,  111,  317,  320,  320,  321,  321,  321,  320,
			  322,  322,  107,  323,  323,  322,  321,  321,  323,  333,

			  333,  321,  320,  104,  333,  334,  334,  337,  337,  103,
			  334,  100,  337,   99,  336,  336,  336,  322,  343,  343,
			  343,  323,   97,  320,  336,  336,   96,  337,   95,  336,
			  338,  338,  322,   81,   70,  338,  341,  341,  341,  342,
			  342,   65,   64,  338,  342,   61,  341,  341,  345,  345,
			   60,  341,   57,  345,  346,  346,  346,  348,  348,  348,
			   55,  345,   54,   53,  346,  346,  352,  352,  352,  346,
			  354,  354,  342,  354,  354,  357,  357,  357,  359,  359,
			   52,  360,  360,  359,   40,   36,  360,  361,  361,  361,
			  363,  363,   22,  364,  364,  363,   14,   11,  364,  365,

			  365,  365,    7,  359,  360,  377,  377,    5,  378,  378,
			  377,    3,    0,  378,    0,  363,  364,    0,  379,  379,
			  380,  380,  360,  379,    0,  380,  377,  378,    0,  387,
			  387,  379,  387,  387,  364,  391,  391,    0,  380,    0,
			  391,  392,  392,  393,  393,    0,  392,    0,  393,  405,
			  405,  394,  394,  391,  405,    0,  394,    0,  392,  380,
			  394,    0,  393,  406,  406,    0,  407,  407,  406,    0,
			  405,  407,  408,  408,  391,  419,  419,  408,  464,  392,
			  419,  464,  464,  406,    0,  394,  416,  416,  407,  416,
			  416,    0,  418,  418,  420,  420,  419,  418,    0,  420,

			  408,    0,    0,  421,  421,  421,  407,  418,    0,    0,
			  431,  431,  420,  421,  421,  431,  432,  432,  421,  433,
			  433,  432,  442,  442,  433,  442,  442,  431,  433,  434,
			  434,  434,    0,  420,  432,    0,  444,  444,  445,  445,
			    0,  444,    0,  445,    0,  446,  446,    0,  431,  444,
			  446,  455,  455,  433,    0,  432,  455,  456,  456,  445,
			  457,  457,  456,    0,    0,  457,  465,  465,  465,    0,
			  446,    0,  456,  457,    0,  455,  465,  466,  466,  466,
			  467,  467,  470,  470,  470,  467,    0,  466,  466,  468,
			  468,  468,  466,  469,  469,  469,    0,  467,    0,  468,

			  468,    0,    0,  469,  468,  472,  472,  472,  475,  475,
			  475,  477,  477,  477,    0,  472,  479,  479,  467,    0,
			    0,  479,  480,  480,  480,  481,  481,  481,    0,  479,
			  485,  485,  485,  487,  487,  489,  489,  489,  487,  490,
			  490,  490,  491,  491,  491,  489,  489,    0,    0,    0,
			  489,  510,  510,  510,  510,    0,    0,  487,  495,  495,
			  495,  495,  495,  495,  495,  495,  495,  495,  496,  496,
			  496,  496,  496,  496,  496,  496,  496,  496,  497,  497,
			  497,  497,  497,  497,  497,  497,  497,  497,  498,  498,
			  498,  498,  498,  498,  498,  498,  498,  498,  499,  499,

			  499,  499,  499,  499,  499,  499,  499,  499,  500,  500,
			  500,  500,  500,  500,  500,  500,  501,  501,  501,  501,
			  501,  501,  501,  501,  502,    0,  502,  502,  502,  502,
			  502,  502,  502,  502,  503,  503,  503,  503,  503,  503,
			  503,  503,  503,  503,  504,  504,  504,  504,  504,  504,
			  504,  504,  504,  504,  505,  505,  505,  505,  505,  505,
			  505,  505,  505,  505,  506,  506,  506,  506,  506,  506,
			  506,  506,  506,  506,  507,  507,  507,  507,  507,  507,
			  507,  507,  507,  507,  508,  508,  508,  508,  508,  508,
			  508,  508,  509,  509,  509,  509,  509,  509,  509,  509,

			  511,  511,  511,  511,  511,  511,  511,  511,  512,  512,
			  512,  512,  512,  512,  513,  513,  513,  513,  513,  513,
			  513,  513,  514,  514,  514,  514,  514,  514,  515,  515,
			  515,  515,  515,  515,  515,  515,  516,  516,  516,  516,
			  517,  517,  517,  517,  517,  517,  517,  517,  518,  518,
			  518,  518,  518,  518,  519,  519,  519,  519,  519,  519,
			  520,  520,  520,  520,  520,  520,  494,  494,  494,  494,
			  494,  494,  494,  494,  494,  494,  494,  494,  494,  494,
			  494,  494,  494,  494,  494,  494,  494,  494,  494,  494,
			  494,  494,  494,  494,  494,  494,  494,  494,  494,  494,

			  494,  494,  494,  494,  494,  494,  494,  494,  494,  494,
			  494,  494,  494,  494,  494,  494,  494,  494,  494,  494,
			  494, yy_Dummy>>,
			1, 721, 1000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,   43, 1208,   62, 1204,   54, 1199,   56,    0,
			   58, 1197, 1666,   67, 1193, 1666, 1666, 1666, 1666, 1666,
			 1666, 1666, 1180,    0, 1666,   82, 1666, 1666, 1666, 1666,
			   75,   50,   69,   88,   91,   99, 1135, 1666, 1666,    0,
			 1172,   94,  102,  107,  104,  112,  118,  125,  127,  132,
			    0, 1666, 1168, 1131, 1129, 1135, 1666, 1149, 1666,  151,
			 1147, 1142, 1666,  157, 1139, 1138,  162, 1666,   65,  139,
			 1131,  179,    0,  151,  156,  161,  188,  194,  196,  202,
			  212, 1085,  260,  218,  228,  221,  269,  271,  277,  279,
			  231,  294,  301,  315,    0, 1116, 1094, 1091,  166, 1110,

			 1108,  173, 1666, 1106, 1100,  192, 1666, 1089, 1666,  201,
			   72, 1079,  144,  242,  204,  285, 1062,  317,  323,  326,
			  335,  341, 1046, 1048,  344,  347,  359,  366,  368,  377,
			  387,  389,  395,  407,  414,  416,  422, 1046, 1019,  265,
			  105,  104,  165,  285,  307,  428,    0,  430,  439,  442,
			  445,  199, 1029,  454,  461,  468,  470,  476,  486,  492,
			  495,  501,  507,  515,  521,  523, 1025,  991,  993,  987,
			  280,  234,  350,  541,    0,  546,  549,  557,  563,  998,
			 1666,  991,  570,  582,  588,  594,  596,  605,  614,  616,
			  624,  650,  626,  652,  658,  989,  266,  967,  292,  294,

			  273,  361,  979,  664,  667,  670,  676,  970,  679,  691,
			  693,  702,  708,  711,  717,  723,  734,  461, 1666,  736,
			  742,  752,  954,  886,  895,  865,  297,  406,  374,    0,
			  755,  758,  761,  777,  883,  764,  783,  789,  791,  799,
			  812,  814,  820,  830,  833,  836,  839,  875,  353,  852,
			  355,  842,  494,  503,  852,  842,  855,  853,  861,  828,
			  863,  869,  876,  886,  892,  895,  912,  924,  918,  921,
			  941,  934,  826,  801,  793,  795,  363,  514,  529,    0,
			  943,  952,  905,  958,  803,  961,  977,  975,  983,  985,
			 1004,  546, 1666,  586, 1666,  992, 1010,  594, 1012, 1019,

			  798,  775,  760,  767,  764,  552,  555,  728,    0, 1027,
			 1030, 1036,  768, 1038,  654, 1044, 1063, 1051,  709, 1666,
			 1072, 1084, 1078, 1081,  746,  720,  304, 1008,  713,  609,
			  638,  670,  728, 1087, 1093,  721, 1112, 1095, 1118, 1067,
			 1666, 1134, 1127, 1116, 1666, 1136, 1152,  710, 1155,  677,
			  677, 1666, 1164,  612, 1158,    0,  685, 1173, 1666, 1166,
			 1169, 1185, 1666, 1178, 1181, 1197, 1666,  666, 1666,  637,
			  437, 1666,  656,  174,  679,  714,  654, 1193, 1196, 1206,
			 1208,  636,  612,  611,  740,  589,  585, 1217,    0,  576,
			  598, 1223, 1229, 1231, 1239,  592,  387,  396,  780,  529,

			  566,  722,  749,  803,  565, 1237, 1251, 1254, 1260,  548,
			  512,  505,  810,  474,  842, 1018, 1274,  482, 1280, 1263,
			 1282, 1301,  480,  433,  416,  888,  398,  895,  539,  924,
			  424, 1298, 1304, 1307, 1327, 1666,  409,  446,  449,  949,
			  359,  350, 1310,  310, 1324, 1326, 1333,  296,  268,  240,
			  956,  207,  241,  933,  237, 1339, 1345, 1348,  220,  174,
			  164,  960,  113,  969, 1266, 1364, 1375, 1368, 1387, 1391,
			 1380,  481, 1403,   75, 1057, 1406,  365, 1409, 1666, 1404,
			 1420, 1423, 1666, 1666,   80, 1428, 1666, 1421,   56, 1433,
			 1437, 1440, 1666, 1666, 1666, 1457, 1467, 1477, 1487, 1497,

			 1505, 1513, 1523, 1533, 1543, 1553, 1563, 1573, 1581, 1589,
			 1444, 1597, 1603, 1611, 1617, 1625, 1629, 1637, 1643, 1649,
			 1655, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  494,    1,  495,  495,  496,  497,  496,  498,  496,
			  499,  494,  494,  494,  494,  494,  494,  494,  494,  494,
			  494,  494,  500,  500,  494,  500,  494,  494,  494,  494,
			  501,  501,  501,  501,  501,  501,  494,  494,  494,  500,
			  500,  501,  501,  501,  501,  501,  501,  501,  501,  501,
			  502,  494,  502,  502,  502,  502,  494,  494,  494,  503,
			  494,  494,  494,  504,  494,  505,  505,  494,  505,  494,
			  494,  506,  500,  500,  500,  501,  501,  501,  501,  501,
			  501,  494,  506,  501,  501,  501,  501,  501,  501,  501,
			  501,  501,  501,  501,  502,  502,  502,  502,  502,  494,

			  503,  503,  494,  494,  504,  504,  494,  505,  494,  505,
			  505,  507,  494,  500,  508,  509,  494,  501,  501,  501,
			  501,  501,  494,   82,  501,  501,  501,  501,  501,  501,
			  501,  501,  501,  501,  501,  501,  501,  502,  502,  502,
			  502,  502,  505,  500,  508,  509,  510,  501,  501,  501,
			  501,  494,   82,  501,  501,  501,  501,  501,  501,  501,
			  501,  501,  501,  501,  501,  501,  502,  502,  502,  502,
			  502,  505,  500,  511,  512,  501,  501,  501,  501,  494,
			  494,   82,  501,  501,  501,  501,  501,  501,  501,  501,
			  501,  501,  501,  501,  501,  502,  502,  502,  502,  502,

			  505,  513,  512,  501,  501,  501,  501,   82,  501,  501,
			  501,  501,  501,  501,  501,  501,  501,  494,  494,  501,
			  501,  501,  502,  502,  502,  502,  502,  505,  513,  514,
			  501,  501,  501,  501,   82,  501,  501,  501,  501,  501,
			  501,  501,  501,  501,  501,  501,  501,  502,  502,  502,
			  502,  502,  505,  515,  514,  501,  501,  501,  501,   82,
			  501,  501,  501,  501,  501,  501,  501,  501,  501,  501,
			  501,  501,  502,  502,  502,  502,  502,  505,  515,  516,
			  501,  501,  501,  501,   82,  501,  501,  501,  501,  501,
			  501,  494,  494,  494,  494,  501,  501,  494,  501,  501,

			  502,  502,  502,  502,  502,  505,  517,  500,  518,  501,
			  501,  501,   82,  501,  494,  501,  501,  501,  494,  494,
			  501,  501,  501,  501,  502,  502,  502,  502,  502,  505,
			  517,  500,  518,  501,  501,   82,  501,  501,  501,  494,
			  494,  501,  501,  494,  494,  501,  501,  502,  502,  502,
			  502,  494,  502,  505,  500,  519,   82,  494,  494,  501,
			  501,  494,  494,  501,  501,  494,  494,  502,  494,  502,
			  502,  494,  505,  500,  500,  519,   82,  501,  501,  501,
			  501,  502,  502,  502,  505,  500,  500,  500,  520,  494,
			   82,  501,  501,  501,  501,  502,  502,  502,  505,  500,

			  500,  500,  520,  494,   82,  501,  501,  501,  501,  502,
			  502,  502,  505,  500,  500,  500,  494,   82,  501,  501,
			  501,  501,  502,  502,  502,  505,  500,  500,  494,  494,
			   82,  501,  501,  501,  494,  494,  502,  502,  502,  505,
			  494,  494,  494,   82,  501,  501,  501,  502,  502,  502,
			  505,  494,  494,  494,   82,  501,  501,  501,  502,  502,
			  502,  505,  494,  494,  494,   82,  501,  501,  501,  502,
			  502,  502,  505,  494,  494,  507,  494,  494,  494,  501,
			  494,  502,  494,  494,  502,  505,  494,  501,  502,  501,
			  502,  494,  494,  494,    0,  494,  494,  494,  494,  494,

			  494,  494,  494,  494,  494,  494,  494,  494,  494,  494,
			  494,  494,  494,  494,  494,  494,  494,  494,  494,  494,
			  494, yy_Dummy>>)
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
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,   66,   64,    1,    2,   16,   19,   17,   18,    8,
			    7,   14,    6,   12,    9,   63,   15,   13,   11,   20,
			   63,   63,   63,   63,   63,   63,   21,   22,   10,   63,
			    6,   63,   63,   63,   63,   63,   63,   63,   63,   63,
			   51,   50,   51,   51,   51,   51,   65,   53,   54,   65,
			   53,   56,   57,   65,   56,   65,   65,   59,   65,    1,
			    2,    4,   63,   63,   63,   62,   62,   62,   62,   62,
			   62,    0,    4,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   51,   51,   51,   51,   51,   53,

			    0,    0,   52,   56,    0,    0,   55,    0,   59,    0,
			    0,    4,    5,   60,   63,   63,    0,   62,   62,   62,
			   62,   31,    0,    4,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   51,   51,   51,
			   51,   51,    0,   63,   63,   63,    0,   62,   62,   62,
			   62,    0,    4,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   51,   51,   51,   51,
			   51,    0,   60,   63,    0,   62,   62,   62,   62,    0,
			   43,    4,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   51,   51,   51,   51,   51,

			    0,   63,    0,   62,   62,   62,   62,    4,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,    0,   36,   62,
			   62,   62,   51,   51,   51,   51,   51,    0,   63,    0,
			   62,   62,   62,   62,    4,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   51,   51,   51,
			   51,   51,    0,   63,    0,   62,   62,   62,   62,    4,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   51,   51,   51,   51,   51,    0,   63,    0,
			   62,   62,   30,   62,    4,   62,   62,   62,   62,   62,
			   62,    0,   33,    0,   42,   62,   62,   25,   62,   62,

			   51,   51,   51,   51,   51,    0,   63,   63,    0,   62,
			   62,   28,    4,   62,   23,   62,   62,   62,    0,   41,
			   62,   62,   62,   62,   51,   51,   51,   51,   51,    0,
			   63,   63,    0,   27,   29,    4,   62,   62,   62,    0,
			   35,   62,   62,    0,   32,   62,   62,   51,   51,   51,
			   51,   46,   51,    0,   61,    0,    4,    0,   38,   62,
			   62,    0,   34,   62,   62,    0,   37,   51,   47,   51,
			   51,   45,    0,   63,   63,    0,    4,   62,   62,   62,
			   62,   51,   51,   51,    0,   63,   63,   61,    0,    0,
			    4,   62,   62,   62,   62,   51,   51,   51,    0,   63,

			   61,   63,    0,    0,    4,   62,   62,   62,   62,   51,
			   51,   51,    0,   63,   63,   61,   61,    4,   62,   62,
			   62,   62,   51,   51,   51,    0,   63,   61,    0,    0,
			    4,   62,   62,   62,    0,   24,   51,   51,   51,    0,
			    0,    0,   61,    4,   62,   62,   62,   51,   51,   51,
			    0,    0,   61,    0,    4,   62,   62,   62,   51,   51,
			   51,    0,    0,    0,   61,    4,   62,   62,   62,   51,
			   51,   51,    0,    0,   61,    4,    3,    0,   40,   62,
			   26,   51,   44,   48,   51,    0,   58,   62,   51,   62,
			   51,    0,   39,   49,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 1666
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 494
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 495
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

	yyNb_rules: INTEGER = 65
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 66
			-- End of buffer rule code

	yyLine_used: BOOLEAN = false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN = false
			-- Is `position' used?

	INITIAL: INTEGER = 0
	IN_ODIN_SECTION: INTEGER = 1
	IN_CADL_SECTION: INTEGER = 2
	IN_RULES_SECTION: INTEGER = 3
	IN_TEMPLATE_OVERLAYS_SECTION: INTEGER = 4
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
			create overlay_adl_texts.make (0)
		end

feature -- Initialization

	reset
			-- Reset scanner before scanning next input.
		do
			reset_compressed_scanner_skeleton
			in_lineno := 1
			in_buffer.wipe_out
			overlay_adl_texts.wipe_out
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

	overlay_adl_texts: ARRAYED_LIST [STRING]

feature {NONE} -- Constants

	Init_buffer_size: INTEGER = 8192
				-- Initial size for `in_buffer'

end
