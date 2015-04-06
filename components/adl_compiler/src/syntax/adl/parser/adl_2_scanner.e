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

				last_token := SYM_BUILD_UID
			
else
--|#line 154 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 154")
end

				last_token := SYM_SPECIALIZE
				in_lineno := in_lineno + 1
			
end
end
end
end
end
else
if yy_act <= 50 then
if yy_act <= 42 then
if yy_act <= 38 then
if yy_act <= 36 then
if yy_act <= 35 then
if yy_act = 34 then
--|#line 160 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 160")
end

				last_token := SYM_LANGUAGE
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				language_text_start_line := in_lineno
			
else
--|#line 167 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 167")
end

				last_token := SYM_DESCRIPTION
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				description_text_start_line := in_lineno
			
end
else
--|#line 174 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 174")
end

				last_token := SYM_DEFINITION
				set_start_condition (IN_CADL_SECTION)
				in_lineno := in_lineno + 1
				definition_text_start_line := in_lineno
			
end
else
if yy_act = 37 then
--|#line 181 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 181")
end

				last_token := SYM_RULES
				set_start_condition (IN_RULES_SECTION)
				in_lineno := in_lineno + 1
				rules_text_start_line := in_lineno
			
else
--|#line 188 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 188")
end

				last_token := SYM_TERMINOLOGY
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				terminology_text_start_line := in_lineno
			
end
end
else
if yy_act <= 40 then
if yy_act = 39 then
--|#line 195 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 195")
end

				last_token := SYM_ANNOTATIONS
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				annotations_text_start_line := in_lineno
			
else
--|#line 202 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 202")
end

				last_token := SYM_COMPONENT_TERMINOLOGIES
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				component_terminologies_text_start_line := in_lineno
			
end
else
if yy_act = 41 then
--|#line 212 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 212")
end

				last_token := SYM_COMPONENT_TERMINOLOGIES
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				component_terminologies_text_start_line := in_lineno
			
else
--|#line 219 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 219")
end

				last_token := SYM_RULES
				set_start_condition (IN_RULES_SECTION)
				in_lineno := in_lineno + 1
				rules_text_start_line := in_lineno
			
end
end
end
else
if yy_act <= 46 then
if yy_act <= 44 then
if yy_act = 43 then
--|#line 226 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 226")
end

				last_token := SYM_TERMINOLOGY
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				terminology_text_start_line := in_lineno
			
else
--|#line 232 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 232")
end

				last_token := V_CONCEPT_CODE
				last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 45 then
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
else
if yy_act <= 48 then
if yy_act = 47 then
--|#line 245 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 245")
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
--|#line 246 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 246")
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
if yy_act = 49 then
--|#line 247 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 247")
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
--|#line 248 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 248")
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
if yy_act <= 58 then
if yy_act <= 54 then
if yy_act <= 52 then
if yy_act = 51 then
--|#line 266 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 266")
end
 -- LF
				in_buffer.append_character('%N')
				in_lineno := in_lineno + 1
			
else
--|#line 271 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 271")
end
 -- any text on line with no LF
				in_buffer.append_string (text)
			
end
else
if yy_act = 53 then
--|#line 287 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 287")
end
			-- match ^whitespace <anything> \n
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
else
--|#line 292 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 292")
end
in_lineno := in_lineno + text_count
end
end
else
if yy_act <= 56 then
if yy_act = 55 then
--|#line 294 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 294")
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
--|#line 306 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 306")
end
			-- match ^whitespace <anything> \n
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
end
else
if yy_act = 57 then
--|#line 311 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 311")
end
in_lineno := in_lineno + text_count
else
--|#line 313 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 313")
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
if yy_act <= 62 then
if yy_act <= 60 then
if yy_act = 59 then
--|#line 325 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 325")
end
	-- Overlay split line
				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				overlay_adl_texts.extend (str_)
				in_lineno := in_lineno + 1
	
else
--|#line 333 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 333")
end
			-- match <anything> \n
				in_buffer.append_string (text)
				in_lineno := in_lineno + 1
	
end
else
if yy_act = 61 then
--|#line 349 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 349")
end

					last_token := V_DOTTED_NUMERIC
					last_string_value := text_substring (1, text_count)
			
else
--|#line 355 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 355")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
end
end
else
if yy_act <= 64 then
if yy_act = 63 then
--|#line 361 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 361")
end

					last_token := V_IDENTIFIER
					last_string_value := text
			
else
--|#line 367 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 367")
end

					last_token := V_VALUE
					last_string_value := text
			
end
else
if yy_act = 65 then
--|#line 374 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 374")
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
--|#line 373 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 373")
end
terminate
when 1 then
--|#line 275 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 275")
end

				-- get the ODIN section sorted out
				last_token := V_ODIN_TEXT
				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_
				set_start_condition (INITIAL)
			
when 4 then
--|#line 338 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 338")
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
			create an_array.make_filled (0, 0, 1756)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,   12,   13,   14,   13,   15,   16,   17,   18,   19,
			   20,   21,   22,   23,   24,   25,   25,   26,   27,   28,
			   29,   30,   31,   32,   33,   33,   33,   34,   33,   33,
			   33,   33,   33,   33,   33,   33,   35,   33,   33,   36,
			   33,   33,   33,   37,   38,   39,   40,   30,   32,   33,
			   33,   33,   33,   33,   35,   33,   41,   60,   61,   64,
			   65,   67,   68,  110,   70,   42,   70,   43,   44,   73,
			   73,   69,  112,   45,   74,   46,   75,   75,   47,   52,
			   48,   49,   50,   73,   73,   73,   73,  394,   53,   73,
			   73,   42,   43,   44,  395,   45,   46,   54,   48,   55,

			   56,   77,   73,   73,   73,   73,  184,   79,   73,   73,
			   78,   73,   73,   73,   73,   80,  143,   73,   73,   73,
			   73,   82,  499,   54,   55,   56,   77,  144,   81,   77,
			   73,   73,   88,   87,   89,   73,   73,  185,   85,   90,
			   70,   86,   70,   82,   73,   73,   73,   73,   73,   73,
			  103,  104,  107,  108,   77,  114,   91,  114,   92,   86,
			  497,   95,  111,  110,   81,   90,  115,  115,  172,   94,
			   74,   93,   75,   75,  116,  117,   92,  116,  117,  118,
			  116,  117,  118,  103,  104,  118,  172,   94,  113,  113,
			  114,  113,  113,  113,  113,  113,  113,  113,  113,  119,

			  461,  113,  107,  108,  113,  113,  113,  113,  116,  117,
			  482,  123,  229,  118,  116,  117,  116,  117,  174,  118,
			  119,  118,  116,  117,  480,  120,  173,  118,  116,  117,
			  113,  113,  113,  118,  124,  121,  110,  122,  229,  116,
			  117,  116,  117,  174,  118,  145,  118,  120,  173,  127,
			  128,  116,  117,  114,  135,  114,  118,  111,  110,  124,
			  113,  113,  114,  113,  113,  113,  113,  113,  113,  113,
			  113,  126,  133,  113,  204,  128,  113,  113,  113,  113,
			  116,  117,  116,  117,  479,  118,  478,  118,  116,  117,
			   73,   73,  204,  118,  116,  117,  130,   73,   73,  118,

			  129,  121,  113,  113,  113,  116,  117,  131,  116,  117,
			  118,  176,  176,  118,  116,  117,  132,  116,  117,  118,
			  134,  137,  118,  146,  136,  115,  115,  116,  117,  177,
			   73,  132,  118,  474,  138,  472,  116,  117,  139,  116,
			  117,  118,  116,  117,  118,  136,  151,  118,  116,  117,
			  231,  150,  153,  118,  116,  117,  139,  152,  471,  118,
			  116,  117,  110,  116,  117,  118,  154,  151,  118,  116,
			  117,  175,  231,  469,  118,  468,  157,  160,  467,  158,
			  116,  117,  116,  117,  154,  118,  463,  118,  116,  117,
			  232,  161,  159,  118,  358,  116,  117,  162,  359,  160,

			  118,  158,  116,  117,  164,  110,  110,  118,  116,  117,
			  159,  110,  232,  118,  205,  233,  161,  163,  258,  165,
			  259,  166,  419,  162,  116,  117,  116,  117,  461,  118,
			  460,  118,  281,  116,  117,  167,  258,  165,  118,   73,
			  117,  116,  117,  419,  118,  456,  118,  116,  117,  168,
			  116,  117,  118,  169,  281,  118,  116,  117,  116,  117,
			  167,  118,  180,  118,  452,  116,  117,  168,  409,  179,
			  118,  183,  447,  181,  116,  117,  116,  117,  446,  118,
			  182,  118,   73,   73,  179,  116,  117,  180,  445,  188,
			  118,  187,  116,  117,  116,  117,  189,  118,  182,  118,

			  116,  117,  116,  117,  439,  118,  190,  118,  116,  117,
			  116,  117,  435,  118,  433,  118,  191,  195,  192,   73,
			  260,  194,  110,  116,  117,  116,  117,  193,  118,  110,
			  118,  285,  116,  117,  191,  196,  192,  118,  314,  283,
			  197,  432,  194,  195,  198,  146,  431,  176,  176,  199,
			   73,   73,  426,   73,   73,  116,  117,  423,  116,  117,
			  118,  283,  197,  118,  313,  198,   73,   73,  208,  116,
			  117,  199,  116,  117,  118,  116,  117,  118,  116,  117,
			  118,  211,  422,  118,   73,  418,  313,  214,  315,  316,
			  116,  117,  209,  210,  212,  118,  116,  117,  223,  224,

			  223,  118,  449,  116,  117,  116,  117,  211,  118,  450,
			  118,  210,  110,  214,  392,  212,  215,  216,  116,  117,
			  217,  338,  218,  118,  116,  117,  116,  117,  413,  118,
			  412,  118,  392,  220,  409,  219,  116,  117,  116,  117,
			  458,  118,  217,  118,  218,  223,  224,  223,  221,  116,
			  117,  240,   73,   73,  118,  116,  117,  219,  225,  220,
			  118,  458,  222,  116,  117,  116,  117,  408,  118,  406,
			  118,  405,  226,  116,  117,  116,  117,  420,  118,  404,
			  118,  399,  116,  117,  225,  110,  227,  118,  116,  117,
			  116,  117,  391,  118,  362,  118,  390,  236,  226,  420,

			  116,  117,  237,  110,  238,  118,  116,  117,  116,  117,
			  385,  118,  381,  118,  239,  236,  242,  116,  117,  244,
			  116,  117,  118,  116,  117,  118,  116,  117,  118,  243,
			  110,  118,  116,  117,  245,  247,  379,  118,  248,  393,
			  246,  378,  253,  116,  117,  116,  117,  249,  118,  376,
			  118,  116,  117,  365,  116,  117,  118,  364,  246,  118,
			  250,  247,  315,  316,  251,  110,  116,  117,  116,  117,
			  361,  118,  110,  118,  407,  116,  117,  252,  357,  262,
			  118,  421,  250,  263,  356,  251,  344,  264,  265,  116,
			  117,  340,  116,  117,  118,  116,  117,  118,  266,  337,

			  118,  116,  117,  363,  363,  263,  118,  110,  264,  268,
			  116,  117,  116,  117,  110,  118,  434,  118,  269,  110,
			  116,  117,  270,  448,  266,  118,  336,  271,  459,  116,
			  117,  268,  116,  117,  118,  457,  269,  118,  272,  396,
			  396,  273,  274,  116,  117,  116,  117,  335,  118,  271,
			  118,  116,  117,  116,  117,  334,  118,  457,  118,  397,
			  398,  275,  277,  333,  278,  276,  116,  117,  321,  116,
			  117,  118,  279,  312,  118,  116,  117,  116,  117,  493,
			  118,  289,  118,  288,  277,  116,  117,  116,  117,  291,
			  118,  311,  118,  279,  290,  116,  117,  116,  117,  310,

			  118,  493,  118,  424,  424,  288,  289,  309,  295,  294,
			  292,  116,  117,  293,  291,  290,  118,  116,  117,  116,
			  117,  287,  118,  296,  118,  300,  301,  300,  302,  303,
			  302,  397,  398,  297,  298,  116,  117,  284,  116,  117,
			  118,  116,  117,  118,  282,  299,  118,  116,  117,  306,
			  306,  306,  118,  116,  117,  280,  298,  267,  118,  116,
			  117,  257,  304,  256,  118,  116,  117,  110,  116,  117,
			  118,  255,  305,  118,  254,  308,  470,  305,  116,  117,
			  116,  117,  241,  118,  235,  118,  230,  318,  228,  116,
			  117,  319,  110,  307,  118,  116,  117,  323,  323,  323, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  118,  481,  320,  213,  116,  117,  155,  116,  117,  118,
			  116,  117,  118,  116,  117,  118,  322,  203,  118,  327,
			  328,  327,  300,  301,  300,  302,  303,  302,  202,  116,
			  117,  325,  116,  117,  118,  326,  201,  118,  324,  116,
			  117,  329,  425,  425,  118,  306,  306,  306,  116,  117,
			  116,  117,  330,  118,  200,  118,  116,  117,  186,  116,
			  117,  118,  436,  436,  118,  332,  171,  329,  116,  117,
			  331,  343,  170,  118,  116,  117,  156,  342,  155,  118,
			  323,  323,  323,  116,  117,  327,  328,  327,  118,  116,
			  117,  348,  349,  348,  118,  149,  343,  436,  436,  345,

			  114,  116,  117,  116,  117,  346,  118,  110,  118,  347,
			  350,  116,  117,  352,  353,  352,  118,  336,  360,  336,
			  116,  117,  351,  116,  117,  118,  116,  117,  118,  116,
			  117,  118,  451,  451,  118,  366,  367,  366,  108,  354,
			  348,  349,  348,  351,  105,  116,  117,  116,  117,  355,
			  118,  104,  118,  101,  354,  142,  116,  117,  352,  353,
			  352,  118,  370,  371,  370,  116,  117,  141,  368,  369,
			  118,  140,  116,  117,  116,  117,  125,  118,   71,  118,
			  374,  375,  374,  357,  377,  357,  110,  373,  473,  473,
			  116,  117,  361,  380,  361,  118,  105,  382,  383,  372,

			  363,  363,  366,  367,  366,  116,  117,  105,  116,  117,
			  118,  483,  483,  118,  370,  371,  370,  116,  117,  101,
			  116,  117,  118,  483,  483,  118,  374,  375,  374,  116,
			  117,  386,  387,  101,  118,  116,  117,  443,  444,  443,
			  118,  116,  117,  388,  389,  100,  118,  116,  117,   99,
			  387,  400,  118,   98,  402,  401,  382,  410,   97,  396,
			  396,   84,  389,  116,  117,   83,  403,   72,  118,  116,
			  117,  116,  117,   71,  118,  503,  118,   62,   58,  116,
			  117,   52,  414,  503,  118,  503,  415,  403,  417,  116,
			  117,  416,  116,  117,  118,  116,  117,  118,  503,  503,

			  118,  116,  117,  414,  116,  117,  118,  503,  415,  118,
			  503,  427,  382,  428,  417,  424,  424,  503,  429,  437,
			  438,  503,  425,  425,  116,  117,  441,  116,  117,  118,
			  430,  503,  118,  443,  444,  443,  429,  116,  117,  440,
			  116,  117,  118,  116,  117,  118,  442,  503,  118,  503,
			  503,  116,  117,  503,  453,  503,  118,  503,  503,  454,
			  455,  437,  462,  503,  451,  451,  503,  442,  116,  117,
			  116,  117,  503,  118,  503,  118,  453,  116,  117,  503,
			  454,  464,  118,  116,  117,  503,  455,  503,  118,  116,
			  117,  503,  465,  503,  118,  437,  116,  117,  473,  473,

			  503,  118,  503,  466,  476,  484,  485,  484,  475,  477,
			  486,  487,  486,  116,  117,  474,  503,  503,  118,  503,
			  116,  117,  489,  489,  489,  118,  490,  491,  490,  503,
			  488,  503,  116,  117,  503,  503,  478,  118,  479,  492,
			  479,  494,  495,  494,  484,  485,  484,  486,  487,  486,
			  503,  481,  488,  116,  117,  489,  489,  489,  118,  490,
			  491,  490,  494,  495,  494,  503,  496,  116,  117,  500,
			  501,  500,  118,  499,  502,  499,  500,  501,  500,  116,
			  117,  503,  503,  503,  118,  178,  178,  178,  178,  503,
			  503,  503,  498,   51,   51,   51,   51,   51,   51,   51,

			   51,   51,   51,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   59,   59,   59,   59,   59,   59,   59,
			   59,   59,   59,   63,   63,   63,   63,   63,   63,   63,
			   63,   63,   63,   66,   66,   66,   66,   66,   66,   66,
			   66,   66,   66,   73,   73,   73,   73,   73,   73,   73,
			   73,   76,   76,   76,   76,   76,   76,   76,   76,   96,
			  503,   96,   96,   96,   96,   96,   96,   96,   96,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  106,
			  106,  106,  106,  106,  106,  106,  106,  106,  106,  109,
			  109,  109,  109,  109,  109,  109,  109,  109,  109,   72,

			   72,   72,   72,   72,   72,   72,   72,   72,   72,  113,
			  113,  113,  113,  113,  113,  113,  113,  113,  113,  147,
			  147,  147,  147,  147,  147,  147,  147,  148,  148,  148,
			  148,  148,  148,  148,  148,  206,  206,  206,  206,  206,
			  206,  206,  206,  207,  207,  207,  207,  207,  207,  234,
			  234,  234,  234,  234,  234,  234,  234,  261,  261,  261,
			  261,  261,  261,  286,  286,  286,  286,  286,  286,  286,
			  286,  317,  317,  317,  317,  339,  339,  339,  339,  339,
			  339,  339,  339,  341,  341,  341,  341,  341,  341,  384,
			  384,  384,  384,  384,  384,  411,  411,  411,  411,  411,

			  411,   11,  503,  503,  503,  503,  503,  503,  503,  503,
			  503,  503,  503,  503,  503,  503,  503,  503,  503,  503,
			  503,  503,  503,  503,  503,  503,  503,  503,  503,  503,
			  503,  503,  503,  503,  503,  503,  503,  503,  503,  503,
			  503,  503,  503,  503,  503,  503,  503,  503,  503,  503,
			  503,  503,  503,  503,  503,  503,  503, yy_Dummy>>,
			1, 757, 1000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1756)
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
			    1,    1,    1,    1,    1,    1,    2,    6,    6,    8,
			    8,   10,   10,   69,   13,    2,   13,    2,    2,   33,
			   33,   10,   69,    2,   25,    2,   25,   25,    2,    4,
			    2,    2,    2,   31,   31,   32,   32,  382,    4,   30,
			   30,    2,    2,    2,  382,    2,    2,    4,    2,    4,

			    4,   30,   34,   34,   36,   36,  155,   32,   35,   35,
			   31,   43,   43,   45,   45,   34,  100,   42,   42,   44,
			   44,   36,  497,    4,    4,    4,   30,  100,   35,   42,
			   46,   46,   44,   43,   45,   47,   47,  155,   42,   46,
			   70,   42,   70,   36,   48,   48,   49,   49,   50,   50,
			   60,   60,   64,   64,   42,  114,   47,  114,   47,   42,
			  493,   50,   67,   67,   48,   46,   74,   74,  142,   49,
			   75,   48,   75,   75,   76,   76,   47,   81,   81,   76,
			   77,   77,   81,  103,  103,   77,  142,   49,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   77,

			  482,   72,  107,  107,   72,   72,   72,   72,   78,   78,
			  471,   81,  201,   78,   79,   79,   80,   80,  144,   79,
			   77,   80,   82,   82,  469,   78,  143,   82,   85,   85,
			   72,   72,   72,   85,   82,   79,  112,   80,  201,   86,
			   86,   92,   92,  144,   86,  112,   92,   78,  143,   85,
			   86,   90,   90,  485,   92,  485,   90,  111,  111,   82,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   90,   84,  174,   86,   84,   84,   84,   84,
			   87,   87,   88,   88,  468,   87,  467,   88,   89,   89,
			  116,  116,  174,   89,   91,   91,   88,  117,  117,   91,

			   87,   87,   84,   84,   84,   93,   93,   88,   94,   94,
			   93,  146,  146,   94,   95,   95,   89,  119,  119,   95,
			   91,   94,  119,  115,   93,  115,  115,  120,  120,  147,
			  147,   89,  120,  463,   95,  461,  121,  121,   95,  122,
			  122,  121,  123,  123,  122,   93,  120,  123,  124,  124,
			  203,  119,  122,  124,  127,  127,   95,  121,  460,  127,
			  130,  130,  145,  128,  128,  130,  123,  120,  128,  129,
			  129,  145,  203,  458,  129,  457,  127,  130,  456,  128,
			  131,  131,  134,  134,  123,  131,  452,  134,  132,  132,
			  204,  131,  129,  132,  335,  135,  135,  132,  335,  130,

			  135,  128,  133,  133,  134,  175,  205,  133,  136,  136,
			  129,  233,  204,  136,  175,  205,  131,  133,  232,  135,
			  233,  136,  405,  132,  137,  137,  138,  138,  450,  137,
			  449,  138,  255,  139,  139,  137,  232,  135,  139,  148,
			  148,  150,  150,  405,  148,  445,  150,  152,  152,  138,
			  151,  151,  152,  139,  255,  151,  153,  153,  154,  154,
			  137,  153,  151,  154,  439,  157,  157,  138,  435,  150,
			  157,  154,  433,  152,  159,  159,  158,  158,  432,  159,
			  153,  158,  206,  206,  150,  160,  160,  151,  431,  158,
			  160,  157,  161,  161,  162,  162,  159,  161,  153,  162,

			  163,  163,  164,  164,  426,  163,  160,  164,  165,  165,
			  166,  166,  422,  165,  420,  166,  161,  165,  162,  234,
			  234,  164,  259,  167,  167,  168,  168,  163,  167,  285,
			  168,  259,  169,  169,  161,  166,  162,  169,  285,  257,
			  167,  419,  164,  165,  168,  176,  418,  176,  176,  169,
			  177,  177,  413,  177,  177,  179,  179,  409,  180,  180,
			  179,  257,  167,  180,  284,  168,  260,  260,  179,  181,
			  181,  169,  182,  182,  181,  183,  183,  182,  187,  187,
			  183,  182,  408,  187,  177,  404,  284,  187,  286,  286,
			  188,  188,  180,  181,  183,  188,  189,  189,  223,  223,

			  223,  189,  437,  190,  190,  191,  191,  182,  190,  437,
			  191,  181,  314,  187,  379,  183,  188,  189,  192,  192,
			  190,  314,  191,  192,  193,  193,  194,  194,  399,  193,
			  398,  194,  379,  193,  395,  192,  195,  195,  212,  212,
			  447,  195,  190,  212,  191,  196,  196,  196,  194,  197,
			  197,  212,  315,  315,  197,  196,  196,  192,  197,  193,
			  196,  447,  195,  198,  198,  199,  199,  394,  198,  392,
			  199,  391,  198,  208,  208,  209,  209,  406,  208,  390,
			  209,  385,  210,  210,  197,  338,  199,  210,  211,  211,
			  214,  214,  378,  211,  338,  214,  376,  208,  198,  406,

			  215,  215,  209,  362,  210,  215,  216,  216,  217,  217,
			  365,  216,  362,  217,  211,  208,  214,  218,  218,  216,
			  227,  227,  218,  220,  220,  227,  219,  219,  220,  215,
			  381,  219,  221,  221,  217,  219,  359,  221,  220,  381,
			  218,  358,  227,  222,  222,  225,  225,  221,  222,  356,
			  225,  226,  226,  344,  236,  236,  226,  341,  218,  236,
			  222,  219,  339,  339,  225,  393,  237,  237,  238,  238,
			  337,  237,  407,  238,  393,  239,  239,  226,  334,  236,
			  239,  407,  222,  237,  333,  225,  321,  238,  239,  240,
			  240,  316,  242,  242,  240,  243,  243,  242,  240,  313,

			  243,  244,  244,  340,  340,  237,  244,  421,  238,  242,
			  245,  245,  246,  246,  434,  245,  421,  246,  243,  448,
			  247,  247,  244,  434,  240,  247,  312,  245,  448,  248,
			  248,  242,  249,  249,  248,  446,  243,  249,  246,  383,
			  383,  247,  248,  250,  250,  251,  251,  311,  250,  245,
			  251,  252,  252,  253,  253,  310,  252,  446,  253,  384,
			  384,  249,  251,  309,  252,  250,  262,  262,  293,  263,
			  263,  262,  253,  283,  263,  264,  264,  265,  265,  480,
			  264,  263,  265,  262,  251,  266,  266,  268,  268,  265,
			  266,  282,  268,  253,  264,  269,  269,  270,  270,  281,

			  269,  480,  270,  410,  410,  262,  263,  280,  269,  268,
			  266,  271,  271,  267,  265,  264,  271,  272,  272,  273,
			  273,  261,  272,  270,  273,  274,  274,  274,  275,  275,
			  275,  411,  411,  271,  272,  274,  274,  258,  275,  275,
			  274,  276,  276,  275,  256,  273,  276,  277,  277,  278,
			  278,  278,  277,  279,  279,  254,  272,  241,  279,  278,
			  278,  231,  276,  230,  278,  288,  288,  459,  289,  289,
			  288,  229,  277,  289,  228,  279,  459,  277,  290,  290,
			  291,  291,  213,  290,  207,  291,  202,  288,  200,  292,
			  292,  290,  470,  278,  292,  294,  294,  295,  295,  295, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  294,  470,  292,  186,  296,  296,  184,  295,  295,  296,
			  297,  297,  295,  298,  298,  297,  294,  173,  298,  299,
			  299,  299,  300,  300,  300,  302,  302,  302,  172,  299,
			  299,  297,  304,  304,  299,  298,  171,  304,  296,  305,
			  305,  304,  412,  412,  305,  306,  306,  306,  307,  307,
			  308,  308,  305,  307,  170,  308,  318,  318,  156,  319,
			  319,  318,  423,  423,  319,  308,  141,  304,  320,  320,
			  307,  319,  140,  320,  322,  322,  126,  318,  125,  322,
			  323,  323,  323,  324,  324,  327,  327,  327,  324,  326,
			  326,  325,  325,  325,  326,  118,  319,  436,  436,  322,

			  113,  325,  325,  329,  329,  324,  325,  109,  329,  324,
			  326,  331,  331,  330,  330,  330,  331,  336,  336,  336,
			  332,  332,  329,  330,  330,  332,  342,  342,  330,  343,
			  343,  342,  438,  438,  343,  345,  345,  345,  106,  331,
			  348,  348,  348,  329,  105,  345,  345,  346,  346,  332,
			  345,  102,  346,  101,  331,   99,  347,  347,  352,  352,
			  352,  347,  350,  350,  350,  351,  351,   98,  346,  347,
			  351,   97,  350,  350,  354,  354,   83,  350,   71,  354,
			  355,  355,  355,  357,  357,  357,   66,  354,  462,  462,
			  355,  355,  361,  361,  361,  355,   65,  363,  363,  351,

			  363,  363,  366,  366,  366,  368,  368,   62,  369,  369,
			  368,  472,  472,  369,  370,  370,  370,  372,  372,   61,
			  373,  373,  372,  483,  483,  373,  374,  374,  374,  386,
			  386,  368,  369,   58,  386,  387,  387,  443,  443,  443,
			  387,  388,  388,  372,  373,   56,  388,  389,  389,   55,
			  369,  386,  389,   54,  388,  387,  396,  396,   53,  396,
			  396,   41,  373,  400,  400,   37,  389,   22,  400,  401,
			  401,  402,  402,   14,  401,   11,  402,    7,    5,  403,
			  403,    3,  400,    0,  403,    0,  401,  389,  403,  414,
			  414,  402,  415,  415,  414,  416,  416,  415,    0,    0,

			  416,  417,  417,  400,  428,  428,  417,    0,  401,  428,
			    0,  414,  424,  415,  403,  424,  424,    0,  416,  425,
			  425,    0,  425,  425,  427,  427,  428,  429,  429,  427,
			  417,    0,  429,  430,  430,  430,  416,  440,  440,  427,
			  441,  441,  440,  430,  430,  441,  429,    0,  430,    0,
			    0,  442,  442,    0,  440,    0,  442,    0,    0,  441,
			  442,  451,  451,    0,  451,  451,    0,  429,  453,  453,
			  454,  454,    0,  453,    0,  454,  440,  455,  455,    0,
			  441,  453,  455,  464,  464,    0,  442,    0,  464,  465,
			  465,    0,  454,    0,  465,  473,  466,  466,  473,  473,

			    0,  466,    0,  455,  465,  474,  474,  474,  464,  466,
			  475,  475,  475,  476,  476,  474,    0,    0,  476,    0,
			  475,  475,  477,  477,  477,  475,  478,  478,  478,    0,
			  476,    0,  477,  477,    0,    0,  478,  477,  479,  479,
			  479,  481,  481,  481,  484,  484,  484,  486,  486,  486,
			    0,  481,  476,  488,  488,  489,  489,  489,  488,  490,
			  490,  490,  494,  494,  494,    0,  488,  496,  496,  498,
			  498,  498,  496,  499,  499,  499,  500,  500,  500,  498,
			  498,    0,    0,    0,  498,  519,  519,  519,  519,    0,
			    0,    0,  496,  504,  504,  504,  504,  504,  504,  504,

			  504,  504,  504,  505,  505,  505,  505,  505,  505,  505,
			  505,  505,  505,  506,  506,  506,  506,  506,  506,  506,
			  506,  506,  506,  507,  507,  507,  507,  507,  507,  507,
			  507,  507,  507,  508,  508,  508,  508,  508,  508,  508,
			  508,  508,  508,  509,  509,  509,  509,  509,  509,  509,
			  509,  510,  510,  510,  510,  510,  510,  510,  510,  511,
			    0,  511,  511,  511,  511,  511,  511,  511,  511,  512,
			  512,  512,  512,  512,  512,  512,  512,  512,  512,  513,
			  513,  513,  513,  513,  513,  513,  513,  513,  513,  514,
			  514,  514,  514,  514,  514,  514,  514,  514,  514,  515,

			  515,  515,  515,  515,  515,  515,  515,  515,  515,  516,
			  516,  516,  516,  516,  516,  516,  516,  516,  516,  517,
			  517,  517,  517,  517,  517,  517,  517,  518,  518,  518,
			  518,  518,  518,  518,  518,  520,  520,  520,  520,  520,
			  520,  520,  520,  521,  521,  521,  521,  521,  521,  522,
			  522,  522,  522,  522,  522,  522,  522,  523,  523,  523,
			  523,  523,  523,  524,  524,  524,  524,  524,  524,  524,
			  524,  525,  525,  525,  525,  526,  526,  526,  526,  526,
			  526,  526,  526,  527,  527,  527,  527,  527,  527,  528,
			  528,  528,  528,  528,  528,  529,  529,  529,  529,  529,

			  529,  503,  503,  503,  503,  503,  503,  503,  503,  503,
			  503,  503,  503,  503,  503,  503,  503,  503,  503,  503,
			  503,  503,  503,  503,  503,  503,  503,  503,  503,  503,
			  503,  503,  503,  503,  503,  503,  503,  503,  503,  503,
			  503,  503,  503,  503,  503,  503,  503,  503,  503,  503,
			  503,  503,  503,  503,  503,  503,  503, yy_Dummy>>,
			1, 757, 1000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,   44, 1278,   76, 1275,   55, 1274,   57,    0,
			   59, 1275, 1701,   62, 1270, 1701, 1701, 1701, 1701, 1701,
			 1701, 1701, 1255,    0, 1701,   61, 1701, 1701, 1701, 1701,
			   77,   71,   73,   57,   90,   96,   92, 1214, 1701, 1701,
			    0, 1249,  105,   99,  107,  101,  118,  123,  132,  134,
			  136,    0, 1701, 1246, 1220, 1215, 1220, 1701, 1230, 1701,
			  148, 1216, 1204, 1701,  150, 1193, 1183,  160, 1701,   60,
			  138, 1175,  187,    0,  151,  157,  162,  168,  196,  202,
			  204,  165,  210, 1127,  259,  216,  227,  268,  270,  276,
			  239,  282,  229,  293,  296,  302,    0, 1159, 1134, 1123,

			   90, 1150, 1148,  181, 1701, 1141, 1135,  200, 1701, 1104,
			 1701,  255,  233, 1097,  153,  310,  278,  285, 1078,  305,
			  315,  324,  327,  330,  336, 1062, 1064,  342,  351,  357,
			  348,  368,  376,  390,  370,  383,  396,  412,  414,  421,
			 1060, 1032,  133,  197,  195,  359,  296,  317,  427,    0,
			  429,  438,  435,  444,  446,   93, 1046,  453,  464,  462,
			  473,  480,  482,  488,  490,  496,  498,  511,  513,  520,
			 1042,  998,  994,  984,  238,  402,  532,  538,    0,  543,
			  546,  557,  560,  563,  990, 1701,  991,  566,  578,  584,
			  591,  593,  606,  612,  614,  624,  643,  637,  651,  653,

			  976,  191,  953,  321,  361,  403,  470,  972,  661,  663,
			  670,  676,  626,  970,  678,  688,  694,  696,  705,  714,
			  711,  720,  731,  596, 1701,  733,  739,  708,  962,  933,
			  938,  923,  383,  408,  507,    0,  742,  754,  756,  763,
			  777,  945,  780,  783,  789,  798,  800,  808,  817,  820,
			  831,  833,  839,  841,  943,  403,  911,  510,  899,  519,
			  554,  909,  854,  857,  863,  865,  873,  901,  875,  883,
			  885,  899,  905,  907,  923,  926,  929,  935,  947,  941,
			  895,  865,  853,  839,  535,  526,  576,    0,  953,  956,
			  966,  968,  977,  856,  983,  995,  992,  998, 1001, 1017,

			 1020, 1701, 1023, 1701, 1020, 1027, 1043, 1036, 1038,  851,
			  822,  801,  793,  765,  609,  640,  736,    0, 1044, 1047,
			 1056,  774, 1062, 1078, 1071, 1089, 1077, 1083, 1701, 1091,
			 1111, 1099, 1108,  772,  741,  360, 1115,  737,  682,  750,
			  788,  744, 1114, 1117,  741, 1133, 1135, 1144, 1138, 1701,
			 1160, 1153, 1156, 1701, 1162, 1178,  737, 1181,  708,  711,
			 1701, 1190,  700, 1185,    0,  698, 1200, 1701, 1193, 1196,
			 1212, 1701, 1205, 1208, 1224, 1701,  684, 1701,  654,  578,
			 1701,  727,   40,  824,  847,  669, 1217, 1223, 1229, 1235,
			  667,  637,  637,  762,  615,  586, 1244,    0,  575,  616,

			 1251, 1257, 1259, 1267,  573,  391,  648,  769,  529,  544,
			  888,  919, 1027,  540, 1277, 1280, 1283, 1289,  534,  507,
			  481,  804,  462, 1047, 1300, 1307,  492, 1312, 1292, 1315,
			 1331,  476,  451,  438,  811,  421, 1082,  555, 1117,  452,
			 1325, 1328, 1339, 1235, 1701,  433,  806,  609,  816,  378,
			  380, 1349,  374, 1356, 1358, 1365,  366,  350,  339,  964,
			  305,  322, 1173,  321, 1371, 1377, 1384,  274,  247,  197,
			  989,  160, 1196, 1383, 1403, 1408, 1401, 1420, 1424, 1436,
			  850, 1439,  153, 1208, 1442,  251, 1445, 1701, 1441, 1453,
			 1457, 1701, 1701,  135, 1460, 1701, 1455,   85, 1467, 1471,

			 1474, 1701, 1701, 1701, 1492, 1502, 1512, 1522, 1532, 1540,
			 1548, 1558, 1568, 1578, 1588, 1598, 1608, 1616, 1624, 1478,
			 1632, 1638, 1646, 1652, 1660, 1664, 1672, 1678, 1684, 1690, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  503,    1,  504,  504,  505,  506,  505,  507,  505,
			  508,  503,  503,  503,  503,  503,  503,  503,  503,  503,
			  503,  503,  509,  509,  503,  509,  503,  503,  503,  503,
			  510,  510,  510,  510,  510,  510,  510,  503,  503,  503,
			  509,  509,  510,  510,  510,  510,  510,  510,  510,  510,
			  510,  511,  503,  511,  511,  511,  511,  503,  503,  503,
			  512,  503,  503,  503,  513,  503,  514,  514,  503,  514,
			  503,  503,  515,  509,  509,  509,  510,  510,  510,  510,
			  510,  510,  510,  503,  515,  510,  510,  510,  510,  510,
			  510,  510,  510,  510,  510,  510,  511,  511,  511,  511,

			  511,  503,  512,  512,  503,  503,  513,  513,  503,  514,
			  503,  514,  514,  516,  503,  509,  517,  518,  503,  510,
			  510,  510,  510,  510,  510,  503,   84,  510,  510,  510,
			  510,  510,  510,  510,  510,  510,  510,  510,  510,  510,
			  511,  511,  511,  511,  511,  514,  509,  517,  518,  519,
			  510,  510,  510,  510,  510,  503,   84,  510,  510,  510,
			  510,  510,  510,  510,  510,  510,  510,  510,  510,  510,
			  511,  511,  511,  511,  511,  514,  509,  520,  521,  510,
			  510,  510,  510,  510,  503,  503,   84,  510,  510,  510,
			  510,  510,  510,  510,  510,  510,  510,  510,  510,  510,

			  511,  511,  511,  511,  511,  514,  522,  521,  510,  510,
			  510,  510,  510,   84,  510,  510,  510,  510,  510,  510,
			  510,  510,  510,  503,  503,  510,  510,  510,  511,  511,
			  511,  511,  511,  514,  522,  523,  510,  510,  510,  510,
			  510,   84,  510,  510,  510,  510,  510,  510,  510,  510,
			  510,  510,  510,  510,  511,  511,  511,  511,  511,  514,
			  524,  523,  510,  510,  510,  510,  510,   84,  510,  510,
			  510,  510,  510,  510,  510,  510,  510,  510,  510,  510,
			  511,  511,  511,  511,  511,  514,  524,  525,  510,  510,
			  510,  510,  510,   84,  510,  510,  510,  510,  510,  510,

			  503,  503,  503,  503,  510,  510,  503,  510,  510,  511,
			  511,  511,  511,  511,  514,  526,  509,  527,  510,  510,
			  510,   84,  510,  503,  510,  510,  510,  503,  503,  510,
			  510,  510,  510,  511,  511,  511,  511,  511,  514,  526,
			  509,  527,  510,  510,   84,  510,  510,  510,  503,  503,
			  510,  510,  503,  503,  510,  510,  511,  511,  511,  511,
			  503,  511,  514,  509,  528,   84,  503,  503,  510,  510,
			  503,  503,  510,  510,  503,  503,  511,  503,  511,  511,
			  503,  514,  509,  509,  528,   84,  510,  510,  510,  510,
			  511,  511,  511,  514,  509,  509,  509,  529,  503,   84,

			  510,  510,  510,  510,  511,  511,  511,  514,  509,  509,
			  509,  529,  503,   84,  510,  510,  510,  510,  511,  511,
			  511,  514,  509,  509,  509,  503,   84,  510,  510,  510,
			  510,  511,  511,  511,  514,  509,  509,  503,  503,   84,
			  510,  510,  510,  503,  503,  511,  511,  511,  514,  503,
			  503,  503,   84,  510,  510,  510,  511,  511,  511,  514,
			  503,  503,  503,   84,  510,  510,  510,  511,  511,  511,
			  514,  503,  503,  503,   84,  510,  510,  510,  511,  511,
			  511,  514,  503,  503,  516,  503,  503,  503,  510,  503,
			  511,  503,  503,  511,  514,  503,  510,  511,  510,  511,

			  503,  503,  503,    0,  503,  503,  503,  503,  503,  503,
			  503,  503,  503,  503,  503,  503,  503,  503,  503,  503,
			  503,  503,  503,  503,  503,  503,  503,  503,  503,  503, yy_Dummy>>)
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
			   26,   27,   28,   29,   30,   30,   31,   32,   33,   34,
			   35,   30,   36,   37,   38,   39,   40,   30,   30,   41,
			   42,   43,    1,   44,   45,   46,    1,   47,   22,   48,

			   49,   25,   26,   27,   50,   51,   30,   30,   52,   32,
			   33,   34,   53,   30,   54,   37,   38,   39,   55,   30,
			   30,   41,   42,    1,    1,    1,    1,    1,    1,    1,
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
			    1,    7,    7,    7,    7,    8,    7,    9,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,   10,    1,    1,    1,    5,    7,    7,    7,
			    7,    7,    7,    7,    7,    7, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,   67,   65,    1,    2,   16,   19,   17,   18,    8,
			    7,   14,    6,   12,    9,   64,   15,   13,   11,   20,
			   64,   64,   64,   64,   64,   64,   64,   21,   22,   10,
			   64,    6,   64,   64,   64,   64,   64,   64,   64,   64,
			   64,   52,   51,   52,   52,   52,   52,   66,   54,   55,
			   66,   54,   57,   58,   66,   57,   66,   66,   60,   66,
			    1,    2,    4,   64,   64,   64,   63,   63,   63,   63,
			   63,   63,   63,    0,    4,   63,   63,   63,   63,   63,
			   63,   63,   63,   63,   63,   63,   52,   52,   52,   52,

			   52,   54,    0,    0,   53,   57,    0,    0,   56,    0,
			   60,    0,    0,    4,    5,   61,   64,   64,    0,   63,
			   63,   63,   63,   63,   31,    0,    4,   63,   63,   63,
			   63,   63,   63,   63,   63,   63,   63,   63,   63,   63,
			   52,   52,   52,   52,   52,    0,   64,   64,   64,    0,
			   63,   63,   63,   63,   63,    0,    4,   63,   63,   63,
			   63,   63,   63,   63,   63,   63,   63,   63,   63,   63,
			   52,   52,   52,   52,   52,    0,   61,   64,    0,   63,
			   63,   63,   63,   63,    0,   44,    4,   63,   63,   63,
			   63,   63,   63,   63,   63,   63,   63,   63,   63,   63,

			   52,   52,   52,   52,   52,    0,   64,    0,   63,   63,
			   63,   63,   63,    4,   63,   63,   63,   63,   63,   63,
			   63,   63,   63,    0,   37,   63,   63,   63,   52,   52,
			   52,   52,   52,    0,   64,    0,   63,   63,   63,   63,
			   63,    4,   63,   63,   63,   63,   63,   63,   63,   63,
			   63,   63,   63,   63,   52,   52,   52,   52,   52,    0,
			   64,    0,   63,   63,   63,   63,   63,    4,   63,   63,
			   63,   63,   63,   63,   63,   63,   63,   63,   63,   63,
			   52,   52,   52,   52,   52,    0,   64,    0,   63,   32,
			   63,   30,   63,    4,   63,   63,   63,   63,   63,   63,

			    0,   34,    0,   43,   63,   63,   25,   63,   63,   52,
			   52,   52,   52,   52,    0,   64,   64,    0,   63,   63,
			   28,    4,   63,   23,   63,   63,   63,    0,   42,   63,
			   63,   63,   63,   52,   52,   52,   52,   52,    0,   64,
			   64,    0,   27,   29,    4,   63,   63,   63,    0,   36,
			   63,   63,    0,   33,   63,   63,   52,   52,   52,   52,
			   47,   52,    0,   62,    0,    4,    0,   39,   63,   63,
			    0,   35,   63,   63,    0,   38,   52,   48,   52,   52,
			   46,    0,   64,   64,    0,    4,   63,   63,   63,   63,
			   52,   52,   52,    0,   64,   64,   62,    0,    0,    4,

			   63,   63,   63,   63,   52,   52,   52,    0,   64,   62,
			   64,    0,    0,    4,   63,   63,   63,   63,   52,   52,
			   52,    0,   64,   64,   62,   62,    4,   63,   63,   63,
			   63,   52,   52,   52,    0,   64,   62,    0,    0,    4,
			   63,   63,   63,    0,   24,   52,   52,   52,    0,    0,
			    0,   62,    4,   63,   63,   63,   52,   52,   52,    0,
			    0,   62,    0,    4,   63,   63,   63,   52,   52,   52,
			    0,    0,    0,   62,    4,   63,   63,   63,   52,   52,
			   52,    0,    0,   62,    4,    3,    0,   41,   63,   26,
			   52,   45,   49,   52,    0,   59,   63,   52,   63,   52,

			    0,   40,   50,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 1701
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 503
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 504
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

	yyNb_rules: INTEGER = 66
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 67
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
