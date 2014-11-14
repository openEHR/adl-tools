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

				last_token := SYM_IS_CONTROLLED
			
else
--|#line 126 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 126")
end

				last_token := SYM_IS_GENERATED
			
end
end
else
if yy_act <= 30 then
if yy_act = 29 then
--|#line 130 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 130")
end

				last_token := SYM_UID
			
else
--|#line 134 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 134")
end

				last_token := SYM_SPECIALIZE
				in_lineno := in_lineno + 1
			
end
else
--|#line 140 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 140")
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
--|#line 147 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 147")
end

				last_token := SYM_DESCRIPTION
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				description_text_start_line := in_lineno
			
else
--|#line 154 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 154")
end

				last_token := SYM_DEFINITION
				set_start_condition (IN_CADL_SECTION)
				in_lineno := in_lineno + 1
				definition_text_start_line := in_lineno
			
end
else
if yy_act = 34 then
--|#line 161 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 161")
end

				last_token := SYM_RULES
				set_start_condition (IN_RULES_SECTION)
				in_lineno := in_lineno + 1
				rules_text_start_line := in_lineno
			
else
--|#line 168 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 168")
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
--|#line 175 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 175")
end

				last_token := SYM_ANNOTATIONS
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				annotations_text_start_line := in_lineno
			
else
--|#line 182 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 182")
end

				last_token := SYM_COMPONENT_TERMINOLOGIES
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				component_terminologies_text_start_line := in_lineno
			
end
else
if yy_act = 38 then
--|#line 192 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 192")
end

				last_token := SYM_CONCEPT
				in_lineno := in_lineno + 1
			
else
--|#line 197 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 197")
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
--|#line 204 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 204")
end

				last_token := SYM_RULES
				set_start_condition (IN_RULES_SECTION)
				in_lineno := in_lineno + 1
				rules_text_start_line := in_lineno
			
else
--|#line 211 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 211")
end

				last_token := SYM_TERMINOLOGY
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				terminology_text_start_line := in_lineno
			
end
else
if yy_act = 42 then
--|#line 217 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 217")
end

				last_token := V_CONCEPT_CODE
				last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 228 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 228")
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
--|#line 229 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 229")
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
--|#line 230 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 230")
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
--|#line 231 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 231")
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
--|#line 249 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 249")
end
 -- LF
				in_buffer.append_character('%N')
				in_lineno := in_lineno + 1
			
end
else
if yy_act = 49 then
--|#line 253 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 253")
end
 -- any text on line with no LF
				in_buffer.append_string(text)
			
else
--|#line 268 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 268")
end
			-- match ^whitespace <anything> \n
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
end
end
else
if yy_act <= 52 then
if yy_act = 51 then
--|#line 273 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 273")
end
in_lineno := in_lineno + text_count
else
--|#line 275 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 275")
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
end
else
if yy_act <= 58 then
if yy_act <= 56 then
if yy_act = 55 then
--|#line 294 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 294")
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
--|#line 307 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 307")
end

					last_token := V_DOTTED_NUMERIC
					last_string_value := text_substring (1, text_count)
			
end
else
if yy_act = 57 then
--|#line 313 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 313")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
else
--|#line 319 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 319")
end

					last_token := V_IDENTIFIER
					last_string_value := text
			
end
end
else
if yy_act <= 60 then
if yy_act = 59 then
--|#line 325 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 325")
end

					last_token := V_VALUE
					last_string_value := text
			
else
--|#line 332 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 332")
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
--|#line 331 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 331")
end
terminate
when 1 then
--|#line 256 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 256")
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
			create an_array.make_filled (0, 0, 1593)
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
			   29,   29,   29,   29,   29,   29,   29,   29,   32,   29,
			   29,   29,   33,   34,   35,   36,   28,   30,   29,   29,
			   29,   29,   29,   29,   29,   37,   47,   38,   39,   54,
			   55,   58,   59,   40,   41,  122,   60,   42,   60,   43,
			   44,   45,   63,   63,   48,  123,   49,   50,   63,   63,
			   37,   38,   39,  412,   40,   41,   64,   43,   65,   65,
			   67,   63,   63,   63,   63,  410,   63,   63,  306,   48,

			   49,   50,  307,   63,   63,  386,   69,   63,   63,   63,
			   63,  149,   68,   70,   67,   67,   63,   63,   63,   63,
			   63,   63,   75,   72,   63,   63,   73,   77,   74,   63,
			   63,  401,   63,   63,   70,  149,   76,   89,   90,   67,
			   78,   60,   79,   60,   73,   82,   93,   94,   97,   97,
			   80,   81,   77,   64,  400,   65,   65,   98,   99,   96,
			   79,   96,  100,   98,   99,   89,   90,  196,  100,   81,
			   95,   95,   96,   95,   95,   95,   95,   95,   95,   95,
			   95,  101,  148,   95,   93,   94,   95,   95,   95,   95,
			   98,   99,  196,   98,   99,  100,   98,   99,  100,   98,

			   99,  100,  101,  148,  100,  104,  124,  399,   97,   97,
			  102,   95,   95,   95,   63,   63,  103,   98,   99,  106,
			   98,   99,  100,   63,   63,  100,  156,  147,  107,  104,
			   98,   99,   98,   99,  394,  100,  335,  100,  393,  108,
			  109,   98,   99,  336,  110,  147,  100,  198,   98,   99,
			   98,   99,  107,  100,  111,  100,  157,   98,   99,  112,
			  392,  113,  100,  115,   98,   99,   98,   99,  198,  100,
			  391,  100,  386,  114,  112,  116,  199,  117,   98,   99,
			  385,   98,   99,  100,  175,  118,  100,   98,   99,  119,
			   98,   99,  100,   98,   99,  100,  116,  199,  100,  347,

			  130,  129,  175,   98,   99,   98,   99,  119,  100,  376,
			  100,  128,   98,   99,  132,  150,  150,  100,  221,  133,
			   98,   99,  375,  135,  367,  100,  366,  134,   98,   99,
			   98,   99,  129,  100,  365,  100,  221,  136,  358,  137,
			  133,   98,   99,   98,   99,  134,  100,  135,  100,  241,
			  138,   98,   99,  141,   98,   99,  100,  243,  136,  100,
			   98,   99,  334,  137,  140,  100,  139,  142,   98,   99,
			  241,  141,  357,  100,  350,  138,   98,   99,  243,  143,
			  334,  100,  144,  151,   63,   63,   99,   98,   99,  347,
			  100,  346,  100,   98,   99,  145,   98,   99,  100,  345,

			  144,  100,  377,  143,  268,   98,   99,   98,   99,  378,
			  100,  344,  100,  124,  153,  150,  150,  333,  154,  155,
			  159,   98,   99,   98,   99,  268,  100,  324,  100,  153,
			  158,   63,   63,   98,   99,  323,  161,  155,  100,   98,
			   99,  311,  160,  309,  100,   98,   99,   98,   99,  305,
			  100,  290,  100,  162,   98,   99,   98,   99,  288,  100,
			  287,  100,  163,   63,   63,  167,   63,   63,  164,  286,
			   98,   99,  166,  165,  285,  100,   98,   99,   98,   99,
			  163,  100,  267,  100,   98,   99,  164,   98,   99,  100,
			  167,  355,  100,  166,  168,  169,   63,  356,   98,   99,

			  266,  182,  170,  100,  171,   98,   99,  265,   98,   99,
			  100,  178,  355,  100,   98,   99,  169,  180,  356,  100,
			  383,   98,   99,  170,  384,  171,  100,  246,  179,  244,
			  181,   98,   99,  242,  183,  220,  100,   63,  222,   98,
			   99,  383,  180,  219,  100,  384,  179,   98,   99,   98,
			   99,  408,  100,  184,  100,  181,  185,  218,   98,   99,
			   98,   99,  201,  100,  186,  100,  187,  188,   98,   99,
			  197,  184,  408,  100,   98,   99,  131,  185,  174,  100,
			  173,  189,  172,  193,  146,  186,  131,  187,  191,  192,
			  191,  127,  188,  190,   96,   98,   99,   94,   98,   99,

			  100,   98,   99,  100,  194,   91,  100,   90,  193,   98,
			   99,   87,   98,   99,  100,   98,   99,  100,   98,   99,
			  100,  195,  121,  100,  120,   98,   99,   63,   63,  194,
			  100,  105,  202,  203,   98,   99,   98,   99,   61,  100,
			  204,  100,   91,  205,   98,   99,   91,  207,   87,  100,
			  202,   98,   99,  206,   98,   99,  100,   98,   99,  100,
			   87,  208,  100,  211,   86,   98,   99,  269,  270,  209,
			  100,   85,  212,  210,   98,   99,   98,   99,   84,  100,
			  213,  100,  191,  192,  191,   98,   99,   71,  211,   62,
			  100,  210,  215,  214,   98,   99,   98,   99,   61,  100,

			  416,  100,   56,   98,   99,   52,   98,   99,  100,   47,
			  216,  100,  416,  215,  214,  217,  416,   98,   99,  226,
			  224,  225,  100,   98,   99,  416,   98,   99,  100,   63,
			   63,  100,  269,  270,  227,   98,   99,  230,  231,  230,
			  100,  416,  225,  310,  310,  228,  229,   98,   99,   98,
			   99,  416,  100,  416,  100,  227,   98,   99,  337,  337,
			  233,  100,  416,  228,   98,   99,  232,   98,   99,  100,
			   98,   99,  100,   98,   99,  100,  234,  235,  100,   98,
			   99,   98,   99,  416,  100,  416,  100,  232,   98,   99,
			  238,  237,  239,  100,  416,  236,   98,   99,  416,  240,

			  416,  100,  416,   98,   99,  247,  326,  327,  100,  310,
			  310,  238,   98,   99,  248,  249,  416,  100,   98,   99,
			  240,  338,  339,  100,   98,   99,  247,   98,   99,  100,
			  416,  251,  100,  250,  416,  248,  230,  231,  230,  249,
			   98,   99,   98,   99,  416,  100,  416,  100,  253,  252,
			  256,  257,  256,  258,  259,  258,  416,  254,  359,  359,
			   98,   99,  416,   98,   99,  100,  416,  255,  100,   98,
			   99,   98,   99,  416,  100,  416,  100,  416,  254,   98,
			   99,  262,  262,  262,  100,   98,   99,  338,  339,  260,
			  100,   98,   99,   98,   99,  261,  100,  416,  100,  416,

			  261,  416,   98,   99,  360,  360,  264,  100,   98,   99,
			  275,  275,  275,  100,  272,  273,  416,   98,   99,  416,
			   98,   99,  100,  416,  263,  100,   98,   99,  274,  368,
			  368,  100,   98,   99,  279,  280,  279,  100,  256,  257,
			  256,  258,  259,  258,   98,   99,  277,   98,   99,  100,
			  276,  416,  100,  278,   98,   99,  281,  368,  368,  100,
			  262,  262,  262,   98,   99,   98,   99,  282,  100,  416,
			  100,   98,   99,   98,   99,  416,  100,  416,  100,  416,
			  284,  281,   98,   99,  283,  293,  416,  100,  275,  275,
			  275,  292,   98,   99,   98,   99,  416,  100,  416,  100, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  297,  298,  297,  279,  280,  279,  294,   98,   99,  293,
			   98,   99,  100,  295,  299,  100,  416,  296,  301,  302,
			  301,   98,   99,  379,  379,  300,  100,  416,   98,   99,
			   98,   99,  416,  100,  416,  100,  287,  308,  287,   98,
			   99,  416,   98,   99,  100,  416,  300,  100,  303,  312,
			  313,  312,   98,   99,  297,  298,  297,  100,  304,   98,
			   99,   98,   99,  303,  100,  416,  100,  316,  317,  316,
			   98,   99,  314,  416,  315,  100,  416,   98,   99,  301,
			  302,  301,  100,   98,   99,  305,  322,  305,  100,  320,
			  321,  320,  309,  325,  309,  416,  319,   98,   99,   98,

			   99,  416,  100,  318,  100,  312,  313,  312,   98,   99,
			  316,  317,  316,  100,   98,   99,  320,  321,  320,  100,
			   98,   99,  329,   98,   99,  100,  395,  395,  100,   98,
			   99,  330,   98,   99,  100,   98,   99,  100,  416,  331,
			  100,   98,   99,  332,  340,  342,  100,  416,  341,  330,
			  416,  326,  348,  343,  337,  337,  374,  374,  374,  351,
			  416,  332,   98,   99,   98,   99,  416,  100,  416,  100,
			   98,   99,   98,   99,  343,  100,  416,  100,  416,  352,
			  351,  354,  416,  353,   98,   99,  416,   98,   99,  100,
			  416,  361,  100,   98,   99,  416,   98,   99,  100,  326,

			  352,  100,  359,  359,  362,  416,  354,  369,  370,  363,
			  360,  360,  416,   98,   99,   98,   99,  372,  100,  416,
			  100,  364,  402,  402,  374,  374,  374,  363,  371,  402,
			  402,   98,   99,  373,   98,   99,  100,   98,   99,  100,
			   98,   99,  100,  369,  387,  100,  379,  379,  380,  382,
			  416,   98,   99,  416,  373,  381,  100,   98,   99,  416,
			   98,   99,  100,  416,  388,  100,   98,   99,  416,  380,
			  416,  100,   98,   99,  382,  416,  381,  100,  389,   98,
			   99,  399,  407,  399,  100,  390,  416,  397,   98,   99,
			  396,  369,  398,  100,  395,  395,  403,  404,  403,  406,

			  406,  406,  403,  404,  403,  405,   98,   99,  416,   98,
			   99,  100,   98,   99,  100,  416,  416,  100,  406,  406,
			  406,  416,   98,   99,  416,  409,  405,  100,  413,  414,
			  413,  412,  415,  412,  413,  414,  413,  416,   98,   99,
			  416,  416,  416,  100,  416,  416,  411,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   63,   63,   63,
			   63,   63,   63,   63,   63,   66,   66,   66,   66,   66,

			   66,   66,   66,   83,  416,   83,   83,   83,   83,   83,
			   83,   83,   83,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,  125,  125,  125,  125,  125,  125,  125,
			  125,  126,  126,  126,  126,  126,  126,  126,  126,  152,
			  152,  152,  152,  176,  176,  176,  176,  176,  176,  176,
			  176,  177,  177,  177,  177,  177,  177,  200,  200,  200,
			  200,  200,  200,  200,  200,  223,  223,  223,  223,  223,

			  223,  245,  245,  245,  245,  245,  245,  245,  245,  271,
			  271,  271,  271,  289,  289,  289,  289,  289,  289,  289,
			  289,  291,  291,  291,  291,  291,  291,  328,  328,  328,
			  328,  328,  328,  349,  349,  349,  349,  349,  349,    9,
			  416,  416,  416,  416,  416,  416,  416,  416,  416,  416,
			  416,  416,  416,  416,  416,  416,  416,  416,  416,  416,
			  416,  416,  416,  416,  416,  416,  416,  416,  416,  416,
			  416,  416,  416,  416,  416,  416,  416,  416,  416,  416,
			  416,  416,  416,  416,  416,  416,  416,  416,  416,  416,
			  416,  416,  416,  416, yy_Dummy>>,
			1, 594, 1000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1593)
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
			    6,    8,    8,    2,    2,   86,   11,    2,   11,    2,
			    2,    2,   29,   29,    4,   86,    4,    4,   28,   28,
			    2,    2,    2,  410,    2,    2,   23,    2,   23,   23,
			   28,   30,   30,   31,   31,  408,   32,   32,  286,    4,

			    4,    4,  286,   37,   37,  401,   31,   38,   38,   39,
			   39,  123,   30,   32,   28,   37,   40,   40,   41,   41,
			   42,   42,   39,   37,   43,   43,   37,   41,   38,   44,
			   44,  393,   45,   45,   32,  123,   40,   54,   54,   37,
			   42,   60,   42,   60,   37,   45,   58,   58,   64,   64,
			   43,   44,   41,   65,  392,   65,   65,   66,   66,   96,
			   42,   96,   66,   67,   67,   89,   89,  172,   67,   44,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   67,  122,   62,   93,   93,   62,   62,   62,   62,
			   68,   68,  172,   70,   70,   68,   69,   69,   70,   72,

			   72,   69,   67,  122,   72,   70,   97,  391,   97,   97,
			   68,   62,   62,   62,   98,   98,   69,   73,   73,   72,
			   74,   74,   73,   99,   99,   74,  131,  121,   73,   70,
			   75,   75,   76,   76,  386,   75,  326,   76,  385,   74,
			   74,   77,   77,  326,   75,  121,   77,  174,   78,   78,
			   79,   79,   73,   78,   75,   79,  131,   80,   80,   76,
			  384,   77,   80,   79,   81,   81,   82,   82,  174,   81,
			  383,   82,  378,   78,   76,   80,  175,   81,  101,  101,
			  377,  102,  102,  101,  149,   82,  102,  103,  103,   82,
			  104,  104,  103,  106,  106,  104,   80,  175,  106,  367,

			  103,  102,  149,  107,  107,  108,  108,   82,  107,  366,
			  108,  101,  109,  109,  106,  124,  124,  109,  199,  107,
			  110,  110,  365,  109,  357,  110,  356,  108,  111,  111,
			  115,  115,  109,  111,  355,  115,  199,  110,  347,  111,
			  107,  112,  112,  114,  114,  108,  112,  109,  114,  218,
			  112,  113,  113,  115,  116,  116,  113,  220,  110,  116,
			  118,  118,  324,  111,  114,  118,  113,  116,  117,  117,
			  218,  115,  346,  117,  339,  112,  119,  119,  220,  117,
			  324,  119,  118,  125,  125,  126,  126,  128,  128,  336,
			  126,  335,  128,  129,  129,  119,  130,  130,  129,  334,

			  118,  130,  369,  117,  244,  132,  132,  133,  133,  369,
			  132,  333,  133,  150,  128,  150,  150,  323,  129,  130,
			  133,  134,  134,  135,  135,  244,  134,  307,  135,  128,
			  132,  176,  176,  136,  136,  306,  135,  130,  136,  137,
			  137,  291,  134,  288,  137,  138,  138,  139,  139,  285,
			  138,  270,  139,  136,  140,  140,  141,  141,  268,  140,
			  267,  141,  137,  151,  151,  141,  151,  151,  138,  266,
			  142,  142,  140,  139,  265,  142,  159,  159,  143,  143,
			  137,  159,  243,  143,  144,  144,  138,  145,  145,  144,
			  141,  344,  145,  140,  142,  143,  151,  345,  153,  153,

			  242,  159,  144,  153,  145,  154,  154,  241,  155,  155,
			  154,  153,  344,  155,  160,  160,  143,  155,  345,  160,
			  375,  158,  158,  144,  376,  145,  158,  223,  154,  221,
			  158,  161,  161,  219,  160,  198,  161,  200,  200,  162,
			  162,  375,  155,  197,  162,  376,  154,  163,  163,  164,
			  164,  400,  163,  161,  164,  158,  162,  196,  165,  165,
			  166,  166,  177,  165,  163,  166,  164,  165,  167,  167,
			  173,  161,  400,  167,  169,  169,  156,  162,  148,  169,
			  147,  166,  146,  169,  120,  163,  105,  164,  168,  168,
			  168,  100,  165,  167,   95,  170,  170,   92,  168,  168,

			  170,  171,  171,  168,  170,   91,  171,   88,  169,  178,
			  178,   87,  179,  179,  178,  180,  180,  179,  181,  181,
			  180,  171,   85,  181,   84,  182,  182,  222,  222,  170,
			  182,   71,  178,  179,  183,  183,  184,  184,   61,  183,
			  180,  184,   59,  181,  185,  185,   56,  183,   55,  185,
			  178,  186,  186,  182,  187,  187,  186,  188,  188,  187,
			   52,  184,  188,  187,   50,  189,  189,  245,  245,  185,
			  189,   49,  188,  186,  193,  193,  190,  190,   48,  193,
			  189,  190,  191,  191,  191,  194,  194,   33,  187,   20,
			  194,  186,  193,  190,  195,  195,  202,  202,   12,  195,

			    9,  202,    7,  203,  203,    5,  204,  204,  203,    3,
			  194,  204,    0,  193,  190,  195,    0,  205,  205,  204,
			  202,  203,  205,  206,  206,    0,  207,  207,  206,  269,
			  269,  207,  289,  289,  205,  210,  210,  208,  208,  208,
			  210,    0,  203,  290,  290,  206,  207,  208,  208,  209,
			  209,    0,  208,    0,  209,  205,  211,  211,  327,  327,
			  210,  211,    0,  206,  212,  212,  209,  213,  213,  212,
			  214,  214,  213,  215,  215,  214,  211,  212,  215,  216,
			  216,  217,  217,    0,  216,    0,  217,  209,  224,  224,
			  215,  214,  216,  224,    0,  213,  225,  225,    0,  217,

			    0,  225,    0,  226,  226,  224,  310,  310,  226,  310,
			  310,  215,  227,  227,  225,  226,    0,  227,  228,  228,
			  217,  328,  328,  228,  229,  229,  224,  232,  232,  229,
			    0,  228,  232,  227,    0,  225,  230,  230,  230,  226,
			  233,  233,  234,  234,    0,  233,    0,  234,  232,  229,
			  235,  235,  235,  236,  236,  236,    0,  233,  348,  348,
			  235,  235,    0,  236,  236,  235,    0,  234,  236,  237,
			  237,  238,  238,    0,  237,    0,  238,    0,  233,  249,
			  249,  239,  239,  239,  249,  240,  240,  349,  349,  237,
			  240,  239,  239,  247,  247,  238,  239,    0,  247,    0,

			  238,    0,  248,  248,  350,  350,  240,  248,  250,  250,
			  251,  251,  251,  250,  247,  248,    0,  252,  252,    0,
			  251,  251,  252,    0,  239,  251,  253,  253,  250,  358,
			  358,  253,  254,  254,  255,  255,  255,  254,  256,  256,
			  256,  258,  258,  258,  255,  255,  253,  260,  260,  255,
			  252,    0,  260,  254,  261,  261,  260,  368,  368,  261,
			  262,  262,  262,  263,  263,  264,  264,  261,  263,    0,
			  264,  272,  272,  273,  273,    0,  272,    0,  273,    0,
			  264,  260,  274,  274,  263,  273,    0,  274,  275,  275,
			  275,  272,  276,  276,  278,  278,    0,  276,    0,  278, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  277,  277,  277,  279,  279,  279,  274,  281,  281,  273,
			  277,  277,  281,  276,  278,  277,    0,  276,  282,  282,
			  282,  283,  283,  370,  370,  281,  283,    0,  282,  282,
			  284,  284,    0,  282,    0,  284,  287,  287,  287,  292,
			  292,    0,  293,  293,  292,    0,  281,  293,  283,  294,
			  294,  294,  295,  295,  297,  297,  297,  295,  284,  294,
			  294,  296,  296,  283,  294,    0,  296,  299,  299,  299,
			  300,  300,  295,    0,  296,  300,    0,  299,  299,  301,
			  301,  301,  299,  303,  303,  305,  305,  305,  303,  304,
			  304,  304,  309,  309,  309,    0,  303,  314,  314,  304,

			  304,    0,  314,  300,  304,  312,  312,  312,  315,  315,
			  316,  316,  316,  315,  318,  318,  320,  320,  320,  318,
			  319,  319,  314,  329,  329,  319,  387,  387,  329,  330,
			  330,  315,  331,  331,  330,  332,  332,  331,    0,  318,
			  332,  340,  340,  319,  329,  331,  340,    0,  330,  315,
			    0,  337,  337,  332,  337,  337,  374,  374,  374,  340,
			    0,  319,  341,  341,  342,  342,    0,  341,    0,  342,
			  351,  351,  343,  343,  332,  351,    0,  343,    0,  341,
			  340,  343,    0,  342,  352,  352,    0,  353,  353,  352,
			    0,  351,  353,  354,  354,    0,  362,  362,  354,  359,

			  341,  362,  359,  359,  352,    0,  343,  360,  360,  353,
			  360,  360,    0,  361,  361,  363,  363,  362,  361,    0,
			  363,  354,  394,  394,  364,  364,  364,  353,  361,  402,
			  402,  371,  371,  363,  364,  364,  371,  372,  372,  364,
			  373,  373,  372,  379,  379,  373,  379,  379,  371,  373,
			    0,  380,  380,    0,  363,  372,  380,  381,  381,    0,
			  382,  382,  381,    0,  380,  382,  388,  388,    0,  371,
			    0,  388,  389,  389,  373,    0,  372,  389,  381,  390,
			  390,  399,  399,  399,  390,  382,    0,  389,  397,  397,
			  388,  395,  390,  397,  395,  395,  396,  396,  396,  398,

			  398,  398,  403,  403,  403,  397,  396,  396,    0,  398,
			  398,  396,  405,  405,  398,    0,    0,  405,  406,  406,
			  406,    0,  409,  409,    0,  405,  397,  409,  411,  411,
			  411,  412,  412,  412,  413,  413,  413,    0,  411,  411,
			    0,    0,    0,  411,    0,    0,  409,  417,  417,  417,
			  417,  417,  417,  417,  417,  417,  417,  418,  418,  418,
			  418,  418,  418,  418,  418,  418,  418,  419,  419,  419,
			  419,  419,  419,  419,  419,  419,  419,  420,  420,  420,
			  420,  420,  420,  420,  420,  420,  420,  421,  421,  421,
			  421,  421,  421,  421,  421,  422,  422,  422,  422,  422,

			  422,  422,  422,  423,    0,  423,  423,  423,  423,  423,
			  423,  423,  423,  424,  424,  424,  424,  424,  424,  424,
			  424,  424,  424,  425,  425,  425,  425,  425,  425,  425,
			  425,  425,  425,  426,  426,  426,  426,  426,  426,  426,
			  426,  426,  426,  427,  427,  427,  427,  427,  427,  427,
			  427,  427,  427,  428,  428,  428,  428,  428,  428,  428,
			  428,  429,  429,  429,  429,  429,  429,  429,  429,  430,
			  430,  430,  430,  431,  431,  431,  431,  431,  431,  431,
			  431,  432,  432,  432,  432,  432,  432,  433,  433,  433,
			  433,  433,  433,  433,  433,  434,  434,  434,  434,  434,

			  434,  435,  435,  435,  435,  435,  435,  435,  435,  436,
			  436,  436,  436,  437,  437,  437,  437,  437,  437,  437,
			  437,  438,  438,  438,  438,  438,  438,  439,  439,  439,
			  439,  439,  439,  440,  440,  440,  440,  440,  440,  416,
			  416,  416,  416,  416,  416,  416,  416,  416,  416,  416,
			  416,  416,  416,  416,  416,  416,  416,  416,  416,  416,
			  416,  416,  416,  416,  416,  416,  416,  416,  416,  416,
			  416,  416,  416,  416,  416,  416,  416,  416,  416,  416,
			  416,  416,  416,  416,  416,  416,  416,  416,  416,  416,
			  416,  416,  416,  416, yy_Dummy>>,
			1, 594, 1000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,   34,  706,   53,  702,   57,  699,   59,  700,
			 1539,   64,  695, 1539, 1539, 1539, 1539, 1539, 1539, 1539,
			  677,    0, 1539,   73, 1539, 1539, 1539, 1539,   66,   60,
			   79,   81,   84,  637, 1539, 1539,    0,   91,   95,   97,
			  104,  106,  108,  112,  117,  120,    0, 1539,  646,  638,
			  639, 1539,  657, 1539,  135,  645,  643, 1539,  144,  639,
			  139,  635,  169,    0,  133,  140,  145,  151,  178,  184,
			  181,  583,  187,  205,  208,  218,  220,  229,  236,  238,
			  245,  252,  254,    0,  592,  591,   39,  608,  604,  163,
			 1539,  602,  594,  182, 1539,  591,  157,  193,  202,  211,

			  574,  266,  269,  275,  278,  570,  281,  291,  293,  300,
			  308,  316,  329,  339,  331,  318,  342,  356,  348,  364,
			  551,  193,  153,   88,  300,  371,  373,    0,  375,  381,
			  384,  213,  393,  395,  409,  411,  421,  427,  433,  435,
			  442,  444,  458,  466,  472,  475,  545,  547,  546,  249,
			  400,  451,    0,  486,  493,  496,  560, 1539,  509,  464,
			  502,  519,  527,  535,  537,  546,  548,  556,  586,  562,
			  583,  589,  146,  538,  218,  247,  419,  550,  597,  600,
			  603,  606,  613,  622,  624,  632,  639,  642,  645,  653,
			  664,  680, 1539,  662,  673,  682,  520,  518,  498,  284,

			  525,    0,  684,  691,  694,  705,  711,  714,  735,  737,
			  723,  744,  752,  755,  758,  761,  767,  769,  320,  501,
			  328,  492,  615,  515,  776,  784,  791,  800,  806,  812,
			  834, 1539,  815,  828,  830,  848,  851,  857,  859,  879,
			  873,  474,  463,  449,  375,  655,    0,  881,  890,  867,
			  896,  908,  905,  914,  920,  932,  936, 1539,  939, 1539,
			  935,  942,  958,  951,  953,  442,  424,  428,  425,  717,
			  397,    0,  959,  961,  970,  986,  980,  998,  982, 1001,
			 1539,  995, 1016, 1009, 1018,  413,   65, 1034,  411,  720,
			  728,  428, 1027, 1030, 1047, 1040, 1049, 1052, 1539, 1065,

			 1058, 1077, 1539, 1071, 1087, 1083,  403,  402, 1539, 1090,
			  794,    0, 1103, 1539, 1085, 1096, 1108, 1539, 1102, 1108,
			 1114, 1539, 1539,  380,  327, 1539,  190,  743,  809, 1111,
			 1117, 1120, 1123,  378,  368,  340,  342, 1139,    0,  320,
			 1129, 1150, 1152, 1160,  461,  468,  320,  325,  843,  875,
			  889, 1158, 1172, 1175, 1181,  301,  294,  275,  914, 1187,
			 1195, 1201, 1184, 1203, 1222,  295,  276,  253,  942,  356,
			 1008, 1219, 1225, 1228, 1154,  491,  494,  229,  225, 1231,
			 1239, 1245, 1248,  245,  227,  186,  221, 1111, 1254, 1260,
			 1267,  171,  127,   82, 1207, 1279, 1294, 1276, 1297, 1279,

			  522,   59, 1214, 1300, 1539, 1300, 1316, 1539,   70, 1310,
			   47, 1326, 1329, 1332, 1539, 1539, 1539, 1346, 1356, 1366,
			 1376, 1384, 1392, 1402, 1412, 1422, 1432, 1442, 1450, 1458,
			 1462, 1470, 1476, 1484, 1490, 1498, 1502, 1510, 1516, 1522,
			 1528, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  416,    1,  417,  417,  418,  419,  418,  420,  416,
			  416,  416,  416,  416,  416,  416,  416,  416,  416,  416,
			  421,  421,  416,  421,  416,  416,  416,  416,  422,  422,
			  422,  422,  422,  416,  416,  416,  421,  422,  422,  422,
			  422,  422,  422,  422,  422,  422,  423,  416,  423,  423,
			  423,  416,  416,  416,  424,  416,  416,  416,  425,  416,
			  416,  416,  426,  421,  421,  421,  422,  422,  422,  422,
			  422,  416,  422,  422,  422,  422,  422,  422,  422,  422,
			  422,  422,  422,  423,  423,  423,  423,  416,  424,  424,
			  416,  416,  425,  425,  416,  427,  416,  421,  428,  429,

			  416,  422,  422,  422,  422,  416,  422,  422,  422,  422,
			  422,  422,  422,  422,  422,  422,  422,  422,  422,  422,
			  423,  423,  423,  423,  421,  428,  429,  430,  422,  422,
			  422,  416,  422,  422,  422,  422,  422,  422,  422,  422,
			  422,  422,  422,  422,  422,  422,  423,  423,  423,  423,
			  421,  431,  432,  422,  422,  422,  416,  416,  422,  422,
			  422,  422,  422,  422,  422,  422,  422,  422,  422,  422,
			  422,  422,  423,  423,  423,  423,  433,  432,  422,  422,
			  422,  422,  422,  422,  422,  422,  422,  422,  422,  422,
			  422,  416,  416,  422,  422,  422,  423,  423,  423,  423,

			  433,  434,  422,  422,  422,  422,  422,  422,  422,  422,
			  422,  422,  422,  422,  422,  422,  422,  422,  423,  423,
			  423,  423,  435,  434,  422,  422,  422,  422,  422,  422,
			  416,  416,  422,  422,  422,  422,  422,  422,  422,  422,
			  422,  423,  423,  423,  423,  435,  436,  422,  422,  422,
			  422,  422,  422,  422,  422,  422,  416,  416,  416,  416,
			  422,  422,  416,  422,  422,  423,  423,  423,  423,  437,
			  421,  438,  422,  422,  422,  416,  422,  422,  422,  416,
			  416,  422,  422,  422,  422,  423,  423,  423,  423,  437,
			  421,  438,  422,  422,  422,  422,  422,  416,  416,  422,

			  422,  416,  416,  422,  422,  423,  423,  423,  416,  423,
			  421,  439,  416,  416,  422,  422,  416,  416,  422,  422,
			  416,  416,  416,  423,  423,  416,  421,  421,  439,  422,
			  422,  422,  422,  423,  423,  421,  421,  421,  440,  416,
			  422,  422,  422,  422,  423,  423,  421,  421,  421,  440,
			  416,  422,  422,  422,  422,  423,  423,  421,  421,  421,
			  416,  422,  422,  422,  422,  423,  423,  421,  421,  416,
			  416,  422,  422,  422,  416,  423,  423,  416,  416,  416,
			  422,  422,  422,  423,  423,  416,  416,  416,  422,  422,
			  422,  423,  423,  416,  416,  416,  422,  422,  422,  423,

			  423,  416,  416,  416,  416,  422,  416,  416,  423,  422,
			  423,  422,  423,  416,  416,  416,    0,  416,  416,  416,
			  416,  416,  416,  416,  416,  416,  416,  416,  416,  416,
			  416,  416,  416,  416,  416,  416,  416,  416,  416,  416,
			  416, yy_Dummy>>)
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
			   56,   59,    0,   58,   58,   58,    0,   42,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   49,   49,   49,   49,   59,    0,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,    0,   34,   58,   58,   58,   49,   49,   49,   49,

			   59,    0,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   49,   49,
			   49,   49,   59,    0,   58,   58,   58,   58,   58,   58,
			    0,   38,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   49,   49,   49,   49,   59,    0,   58,   58,   28,
			   58,   58,   58,   58,   58,   58,    0,   31,    0,   41,
			   58,   58,   24,   58,   58,   49,   49,   49,   49,   59,
			   59,    0,   58,   58,   58,   22,   58,   58,   58,    0,
			   40,   58,   58,   58,   58,   49,   49,   49,   49,   59,
			   59,    0,   26,   27,   58,   58,   58,    0,   33,   58,

			   58,    0,   30,   58,   58,   49,   49,   49,   44,   49,
			   57,    0,    0,   36,   58,   58,    0,   32,   58,   58,
			    0,   35,   45,   49,   49,   43,   59,   59,    0,   58,
			   58,   58,   58,   49,   49,   59,   59,   57,    0,    0,
			   58,   58,   58,   58,   49,   49,   59,   59,   59,    0,
			    0,   58,   58,   58,   58,   49,   49,   59,   59,   57,
			   57,   58,   58,   58,   58,   49,   49,   59,   57,    0,
			    0,   58,   58,   58,   23,   49,   49,    0,    0,   57,
			   58,   58,   58,   49,   49,    0,    0,    0,   58,   58,
			   58,   49,   49,    0,    0,   57,   58,   58,   58,   49,

			   49,    0,   57,    0,   39,   58,   25,   46,   49,   58,
			   49,   58,   49,    0,   37,   47,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 1539
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 416
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 417
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
