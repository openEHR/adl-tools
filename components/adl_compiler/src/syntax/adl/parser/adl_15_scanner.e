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
--|#line 74 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 74")
end
-- Ignore separators
else
--|#line 75 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 75")
end
in_lineno := in_lineno + text_count
end
else
if yy_act = 3 then
--|#line 80 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 80")
end
-- Ignore comments
else
--|#line 81 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 81")
end
in_lineno := in_lineno + 1
end
end
else
if yy_act <= 6 then
if yy_act = 5 then
--|#line 85 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 85")
end
last_token := Minus_code
else
--|#line 86 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 86")
end
last_token := Plus_code
end
else
if yy_act = 7 then
--|#line 87 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 87")
end
last_token := Star_code
else
--|#line 88 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 88")
end
last_token := Slash_code
end
end
end
else
if yy_act <= 12 then
if yy_act <= 10 then
if yy_act = 9 then
--|#line 89 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 89")
end
last_token := Caret_code
else
--|#line 90 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 90")
end
last_token := Equal_code
end
else
if yy_act = 11 then
--|#line 91 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 91")
end
last_token := Dot_code
else
--|#line 92 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 92")
end
last_token := Semicolon_code
end
end
else
if yy_act <= 14 then
if yy_act = 13 then
--|#line 93 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 93")
end
last_token := Comma_code
else
--|#line 94 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 94")
end
last_token := Colon_code
end
else
if yy_act = 15 then
--|#line 95 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 95")
end
last_token := Exclamation_code
else
--|#line 96 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 96")
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
--|#line 97 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 97")
end
last_token := Right_parenthesis_code
else
--|#line 98 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 98")
end
last_token := Dollar_code
end
else
if yy_act = 19 then
--|#line 99 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 99")
end
last_token := Question_mark_code
else
--|#line 101 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 101")
end
last_token := Left_bracket_code
end
end
else
if yy_act <= 22 then
if yy_act = 21 then
--|#line 102 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 102")
end
last_token := Right_bracket_code
else
--|#line 106 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 106")
end

				last_token := SYM_ARCHETYPE
			
end
else
if yy_act = 23 then
--|#line 110 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 110")
end

				last_token := SYM_TEMPLATE_OVERLAY
			
else
--|#line 114 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 114")
end

				last_token := SYM_TEMPLATE
			
end
end
end
else
if yy_act <= 28 then
if yy_act <= 26 then
if yy_act = 25 then
--|#line 118 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 118")
end

				last_token := SYM_OPERATIONAL_TEMPLATE
			
else
--|#line 122 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 122")
end

				last_token := SYM_ADL_VERSION
			
end
else
if yy_act = 27 then
--|#line 126 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 126")
end

				last_token := SYM_IS_CONTROLLED
			
else
--|#line 130 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 130")
end

				last_token := SYM_IS_GENERATED
			
end
end
else
if yy_act <= 30 then
if yy_act = 29 then
--|#line 134 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 134")
end

				last_token := SYM_UID
			
else
--|#line 138 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 138")
end

				last_token := SYM_SPECIALIZE
				in_lineno := in_lineno + 1
			
end
else
--|#line 144 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 144")
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
--|#line 151 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 151")
end

				last_token := SYM_DESCRIPTION
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				description_text_start_line := in_lineno
			
else
--|#line 158 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 158")
end

				last_token := SYM_DEFINITION
				set_start_condition (IN_CADL_SECTION)
				in_lineno := in_lineno + 1
				definition_text_start_line := in_lineno
			
end
else
if yy_act = 34 then
--|#line 165 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 165")
end

				last_token := SYM_RULES
				set_start_condition (IN_RULES_SECTION)
				in_lineno := in_lineno + 1
				rules_text_start_line := in_lineno
			
else
--|#line 172 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 172")
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
--|#line 179 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 179")
end

				last_token := SYM_ANNOTATIONS
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				annotations_text_start_line := in_lineno
			
else
--|#line 186 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 186")
end

				last_token := SYM_COMPONENT_TERMINOLOGIES
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				component_terminologies_text_start_line := in_lineno
			
end
else
if yy_act = 38 then
--|#line 196 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 196")
end

				last_token := SYM_CONCEPT
				in_lineno := in_lineno + 1
			
else
--|#line 201 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 201")
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
--|#line 208 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 208")
end

				last_token := SYM_RULES
				set_start_condition (IN_RULES_SECTION)
				in_lineno := in_lineno + 1
				rules_text_start_line := in_lineno
			
else
--|#line 215 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 215")
end

				last_token := SYM_TERMINOLOGY
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				terminology_text_start_line := in_lineno
			
end
else
if yy_act = 42 then
--|#line 221 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 221")
end

				last_token := V_CONCEPT_CODE
				last_string_value := text_substring (2, text_count - 1)
			
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
end
else
if yy_act <= 45 then
if yy_act = 44 then
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
			
else
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
			
end
else
--|#line 235 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 235")
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
--|#line 236 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 236")
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
--|#line 253 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 253")
end
 -- LF
				in_buffer.append_character('%N')
				in_lineno := in_lineno + 1
			
end
else
if yy_act = 49 then
--|#line 257 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 257")
end
 -- any text on line with no LF
				in_buffer.append_string(text)
			
else
--|#line 272 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 272")
end
			-- match ^whitespace <anything> \n
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
end
end
else
if yy_act <= 52 then
if yy_act = 51 then
--|#line 277 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 277")
end
in_lineno := in_lineno + text_count
else
--|#line 279 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 279")
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
--|#line 291 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 291")
end
			-- match ^whitespace <anything> \n
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
else
--|#line 296 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 296")
end
in_lineno := in_lineno + text_count
end
end
end
else
if yy_act <= 58 then
if yy_act <= 56 then
if yy_act = 55 then
--|#line 298 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 298")
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
--|#line 311 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 311")
end

					last_token := V_DOTTED_NUMERIC
					last_string_value := text_substring (1, text_count)
			
end
else
if yy_act = 57 then
--|#line 317 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 317")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
else
--|#line 323 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 323")
end

					last_token := V_IDENTIFIER
					last_string_value := text
			
end
end
else
if yy_act <= 60 then
if yy_act = 59 then
--|#line 329 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 329")
end

					last_token := V_VALUE
					last_string_value := text
			
else
--|#line 336 "adl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_15_scanner.l' at line 336")
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
			create an_array.make_filled (0, 0, 1578)
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
			   29,   29,   33,   34,   35,   36,   30,   29,   29,   29,
			   32,   29,   37,   47,   38,   39,   54,   55,   58,   59,
			   40,   41,  122,   60,   42,   60,   43,   44,   45,   63,
			   63,   48,  123,   49,   50,   63,   63,   38,   39,   40,
			   43,   64,  149,   65,   65,   63,   63,   67,   63,   63,
			   63,   63,   63,   63,   63,   63,   49,   50,   63,   63,

			  405,   69,   63,   63,   67,  149,   68,   70,   63,   63,
			   67,   77,   72,  403,   76,   73,   63,   63,   60,   74,
			   60,   75,   63,   63,   63,   63,   70,   67,  148,   73,
			   63,   63,   89,   90,   93,   94,   78,  175,   79,   97,
			   97,  394,   64,   82,   65,   65,   81,  148,   80,   98,
			   99,  175,   98,   99,  100,   89,   90,  100,   93,   94,
			   80,   95,   95,   96,   95,   95,   95,   95,   95,   95,
			   95,   95,  102,   96,   95,   96,  393,   95,   95,   95,
			   95,   98,   99,  345,   98,   99,  100,   98,   99,  100,
			   98,   99,  100,   98,   99,  100,  104,  156,  100,  101,

			   98,   99,   95,   95,   95,  100,  124,  103,   97,   97,
			  106,  107,  108,  109,  388,   98,   99,   98,   99,  104,
			  100,  387,  100,   98,   99,   98,   99,  157,  100,  110,
			  100,  382,   98,   99,  107,   98,   99,  100,  381,  111,
			  100,   98,   99,  113,  112,  115,  100,   98,   99,  374,
			  114,  305,  100,  116,  117,  306,  112,   63,   63,   63,
			   63,  373,   98,   99,  150,  150,  118,  100,   98,   99,
			  119,   98,   99,  100,   98,   99,  100,   98,   99,  100,
			   98,   99,  100,  365,  119,  100,  198,  130,  129,   98,
			   99,  364,   98,   99,  100,  128,  133,  100,  132,   98,

			   99,   98,   99,  135,  100,  198,  100,  359,   98,   99,
			  138,  134,  129,  100,  151,   63,  136,   98,   99,  137,
			   98,   99,  100,   98,   99,  100,  135,  356,  100,   98,
			   99,  199,  139,  354,  100,  136,   63,   63,   98,   99,
			  143,  140,  137,  100,   98,   99,  141,   63,  222,  100,
			  199,  142,   98,   99,   63,   99,  333,  100,  241,  100,
			  141,   63,   63,  143,   98,   99,  144,   98,   99,  100,
			  333,  145,  100,   98,   99,   98,   99,  241,  100,  346,
			  100,   98,   99,   98,   99,  343,  100,  124,  100,  150,
			  150,  153,  154,  342,  159,  332,  155,  191,  192,  191,

			  158,   98,   99,  153,  160,  324,  100,   98,   99,  323,
			  155,  311,  100,  310,  161,   98,   99,   98,   99,  308,
			  100,  304,  100,   98,   99,   98,   99,  162,  100,  243,
			  100,  287,   98,   99,   98,   99,  286,  100,  163,  100,
			  164,  167,  285,  166,  284,   98,   99,  267,  243,  165,
			  100,  266,  163,  265,  164,   98,   99,  268,  168,  246,
			  100,  165,  169,   98,   99,   98,   99,  355,  100,  380,
			  100,   63,   63,  170,   63,   63,  268,  244,  178,  242,
			  171,  169,   98,   99,   98,   99,  355,  100,  380,  100,
			  221,   98,   99,  180,  288,  289,  100,   98,   99,  171,

			  181,  220,  100,  219,   63,  179,   98,   99,   98,   99,
			  401,  100,  218,  100,  201,   98,   99,   63,   63,  179,
			  100,  197,  182,   98,   99,  196,  183,  131,  100,  401,
			  184,  174,  185,   98,   99,  173,   98,   99,  100,  172,
			  186,  100,   98,   99,  147,  188,  146,  100,   98,   99,
			  187,  185,  131,  100,  127,  191,  192,  191,   96,  186,
			  230,  231,  230,  189,   94,   98,   99,   98,   99,  187,
			  100,   91,  100,  190,   98,   99,  193,   98,   99,  100,
			   98,   99,  100,  194,   90,  100,   98,   99,   98,   99,
			   87,  100,  121,  100,   98,   99,  120,  195,  105,  100,

			   98,   99,   61,  202,   91,  100,   91,  203,   87,   98,
			   99,   98,   99,  204,  100,   87,  100,  202,   86,  205,
			   98,   99,  207,  288,  289,  100,   98,   99,  206,   98,
			   99,  100,   98,   99,  100,   85,  208,  100,  211,   98,
			   99,   98,   99,   84,  100,  209,  100,  212,  210,   71,
			   98,   99,  326,  326,  213,  100,   98,   99,  214,   98,
			   99,  100,   98,   99,  100,   98,   99,  100,  215,   62,
			  100,   98,   99,   98,   99,   61,  100,  214,  100,  409,
			  217,  216,   56,  225,  226,   52,  224,   47,   98,   99,
			  227,   98,   99,  100,  347,  347,  100,  230,  231,  230,

			   98,   99,  256,  257,  256,  100,  409,   98,   99,  227,
			  228,  229,  100,   98,   99,   98,   99,  232,  100,  409,
			  100,   98,   99,   98,   99,  409,  100,  409,  100,  258,
			  259,  258,   98,   99,  235,  234,  232,  100,  233,   98,
			   99,   98,   99,  409,  100,  409,  100,   98,   99,  344,
			  344,  236,  100,  237,  239,  409,  238,   63,   63,  409,
			   63,   63,   98,   99,  409,  240,  409,  100,   98,   99,
			  409,   98,   99,  100,  409,  238,  100,   98,   99,  247,
			   98,   99,  100,  249,  345,  100,  248,   98,   99,  409,
			   63,  409,  100,  409,   98,   99,  348,  349,  247,  100,

			  251,  250,  252,   98,   99,  409,  249,  409,  100,   98,
			   99,  256,  257,  256,  100,  253,  409,  258,  259,  258,
			  254,   98,   99,  409,   98,   99,  100,   98,   99,  100,
			   98,   99,  100,  409,  255,  100,  262,  262,  262,  254,
			   98,   99,  344,  344,  260,  100,   98,   99,   98,   99,
			  409,  100,  409,  100,  261,   98,   99,   98,   99,  261,
			  100,  264,  100,  344,  344,   98,   99,  409,  272,  271,
			  100,  274,  274,  274,  409,   98,   99,  366,  366,  263,
			  100,   98,   99,   98,   99,  273,  100,  409,  100,   98,
			   99,  278,  279,  278,  100,   98,   99,  262,  262,  262,

			  100,   98,   99,  276,  280,  409,  100,  409,  275,  409,
			  277,   98,   99,   98,   99,  409,  100,  409,  100,  409,
			   98,   99,   98,   99,  281,  100,  409,  100,   98,   99,
			  409,   98,   99,  100,  282,  283,  100,  274,  274,  274,
			  292,  409,  291,   98,   99,  278,  279,  278,  100,  409,
			  296,  297,  296,   98,   99,  293,  367,  367,  100,  409,
			   98,   99,  409,  292,  294,  100,   98,   99,  295,   98,
			   99,  100,  409,  298,  100,  300,  301,  300,   98,   99,
			  286,  307,  286,  100,  299,   98,   99,   98,   99,  409,
			  100,  409,  100,   98,   99,  409,  302,  409,  100,  312, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  313,  312,   98,   99,  348,  349,  303,  100,  302,   98,
			   99,   98,   99,  409,  100,  409,  100,  296,  297,  296,
			  368,  368,  314,  409,  315,  316,  317,  316,   98,   99,
			  300,  301,  300,  100,  409,   98,   99,   98,   99,  409,
			  100,  409,  100,  320,  321,  320,  304,  322,  304,  409,
			  319,  366,  366,   98,   99,  308,  325,  308,  100,  383,
			  383,  318,  312,  313,  312,   98,   99,  409,   98,   99,
			  100,  395,  395,  100,  316,  317,  316,   98,   99,  409,
			   98,   99,  100,  409,  409,  100,  320,  321,  320,  409,
			  328,  329,  334,  409,  335,  336,  409,  326,  326,   98,

			   99,  409,  330,  331,  100,  329,   98,   99,   98,   99,
			  409,  100,  409,  100,   98,   99,  409,  331,  409,  100,
			  338,  340,   98,   99,  409,  339,  409,  100,   98,   99,
			   98,   99,  341,  100,  409,  100,  409,   98,   99,  409,
			  350,  409,  100,  409,  409,  351,  353,  409,  334,  352,
			  335,  357,  409,  347,  347,   98,   99,   98,   99,  409,
			  100,  409,  100,  409,  351,   98,   99,   98,   99,  409,
			  100,  409,  100,   98,   99,  409,  360,  361,  100,   98,
			   99,   98,   99,  409,  100,  409,  100,  362,  369,   98,
			   99,  372,  372,  372,  100,  363,  372,  372,  372,  371,

			  370,   98,   99,  334,  409,  335,  100,  378,  367,  367,
			  334,  409,  375,  376,  409,  368,  368,   98,   99,   98,
			   99,  409,  100,  409,  100,   98,   99,  409,  379,  409,
			  100,   98,   99,  409,  377,  409,  100,  409,  384,   98,
			   99,  409,  409,  334,  100,  375,  389,  409,  383,  383,
			   98,   99,  385,  377,  409,  100,   98,   99,  396,  397,
			  396,  100,   98,   99,  386,   98,   99,  100,   98,   99,
			  100,  391,  409,  100,  390,  392,  399,  399,  399,  393,
			  400,  393,  398,  334,  409,  375,   98,   99,  395,  395,
			  409,  100,  396,  397,  396,   98,   99,  399,  399,  399,

			  100,  398,   98,   99,  406,  407,  406,  100,  402,  405,
			  408,  405,  409,  409,   98,   99,  406,  407,  406,  100,
			  152,  152,  152,  152,  409,  409,  404,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   63,   63,   63,
			   63,   63,   63,   63,   63,   66,   66,   66,   66,   66,
			   66,   66,   66,   83,  409,   83,   83,   83,   83,   83,
			   83,   83,   83,   88,   88,   88,   88,   88,   88,   88,

			   88,   88,   88,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,  125,  125,  125,  125,  125,  125,  125,
			  125,  126,  126,  126,  126,  126,  126,  126,  126,  176,
			  176,  176,  176,  176,  176,  176,  176,  177,  177,  177,
			  177,  177,  177,  200,  200,  200,  200,  200,  200,  200,
			  200,  223,  223,  223,  223,  223,  223,  245,  245,  245,
			  245,  245,  245,  245,  245,  269,  269,  269,  269,  269,
			  269,  269,  269,  270,  270,  270,  270,  290,  290,  290,

			  290,  290,  290,  309,  309,  309,  309,  309,  309,  309,
			  309,  327,  327,  327,  327,  337,  337,  337,  337,  337,
			  337,  358,  358,  358,  358,  358,  358,    9,  409,  409,
			  409,  409,  409,  409,  409,  409,  409,  409,  409,  409,
			  409,  409,  409,  409,  409,  409,  409,  409,  409,  409,
			  409,  409,  409,  409,  409,  409,  409,  409,  409,  409,
			  409,  409,  409,  409,  409,  409,  409,  409,  409,  409,
			  409,  409,  409,  409,  409,  409,  409,  409,  409, yy_Dummy>>,
			1, 579, 1000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1578)
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
			    1,    1,    2,    4,    2,    2,    6,    6,    8,    8,
			    2,    2,   86,   11,    2,   11,    2,    2,    2,   29,
			   29,    4,   86,    4,    4,   28,   28,    2,    2,    2,
			    2,   23,  123,   23,   23,   30,   30,   28,   31,   31,
			   32,   32,   37,   37,   40,   40,    4,    4,   38,   38,

			  403,   31,   41,   41,   37,  123,   30,   32,   39,   39,
			   28,   41,   37,  401,   40,   37,   42,   42,   60,   38,
			   60,   39,   43,   43,   44,   44,   32,   37,  122,   37,
			   45,   45,   54,   54,   58,   58,   42,  149,   42,   64,
			   64,  388,   65,   45,   65,   65,   44,  122,   43,   66,
			   66,  149,   68,   68,   66,   89,   89,   68,   93,   93,
			   43,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   68,   96,   62,   96,  387,   62,   62,   62,
			   62,   67,   67,  382,   70,   70,   67,   69,   69,   70,
			   72,   72,   69,   74,   74,   72,   70,  131,   74,   67,

			   73,   73,   62,   62,   62,   73,   97,   69,   97,   97,
			   72,   73,   74,   74,  381,   75,   75,   76,   76,   70,
			   75,  380,   76,   77,   77,   78,   78,  131,   77,   75,
			   78,  375,   79,   79,   73,   80,   80,   79,  374,   75,
			   80,   81,   81,   77,   76,   79,   81,   82,   82,  365,
			   78,  285,   82,   80,   81,  285,   76,   98,   98,   99,
			   99,  364,  101,  101,  124,  124,   82,  101,  102,  102,
			   82,  104,  104,  102,  103,  103,  104,  106,  106,  103,
			  107,  107,  106,  355,   82,  107,  174,  103,  102,  108,
			  108,  354,  109,  109,  108,  101,  107,  109,  106,  110,

			  110,  112,  112,  109,  110,  174,  112,  349,  111,  111,
			  112,  108,  109,  111,  125,  125,  110,  113,  113,  111,
			  114,  114,  113,  115,  115,  114,  109,  346,  115,  117,
			  117,  175,  113,  342,  117,  110,  176,  176,  116,  116,
			  117,  114,  111,  116,  118,  118,  115,  200,  200,  118,
			  175,  116,  119,  119,  126,  126,  324,  119,  218,  126,
			  115,  245,  245,  117,  128,  128,  118,  129,  129,  128,
			  324,  119,  129,  130,  130,  132,  132,  218,  130,  335,
			  132,  133,  133,  134,  134,  333,  133,  150,  134,  150,
			  150,  128,  129,  332,  133,  323,  130,  191,  191,  191,

			  132,  135,  135,  128,  134,  306,  135,  136,  136,  305,
			  130,  290,  136,  289,  135,  137,  137,  138,  138,  287,
			  137,  284,  138,  139,  139,  140,  140,  136,  139,  220,
			  140,  268,  141,  141,  142,  142,  267,  141,  137,  142,
			  138,  141,  266,  140,  265,  143,  143,  243,  220,  139,
			  143,  242,  137,  241,  138,  144,  144,  244,  142,  223,
			  144,  139,  143,  145,  145,  153,  153,  343,  145,  373,
			  153,  151,  151,  144,  151,  151,  244,  221,  153,  219,
			  145,  143,  154,  154,  155,  155,  343,  154,  373,  155,
			  199,  158,  158,  155,  269,  269,  158,  159,  159,  145,

			  158,  198,  159,  197,  151,  154,  160,  160,  161,  161,
			  394,  160,  196,  161,  177,  162,  162,  288,  288,  154,
			  162,  173,  159,  163,  163,  172,  160,  156,  163,  394,
			  161,  148,  162,  164,  164,  147,  165,  165,  164,  146,
			  163,  165,  166,  166,  121,  165,  120,  166,  167,  167,
			  164,  162,  105,  167,  100,  168,  168,  168,   95,  163,
			  230,  230,  230,  166,   92,  168,  168,  169,  169,  164,
			  168,   91,  169,  167,  170,  170,  169,  171,  171,  170,
			  178,  178,  171,  170,   88,  178,  179,  179,  180,  180,
			   87,  179,   85,  180,  181,  181,   84,  171,   71,  181,

			  182,  182,   61,  178,   59,  182,   56,  179,   55,  183,
			  183,  184,  184,  180,  183,   52,  184,  178,   50,  181,
			  185,  185,  183,  309,  309,  185,  186,  186,  182,  187,
			  187,  186,  188,  188,  187,   49,  184,  188,  187,  189,
			  189,  190,  190,   48,  189,  185,  190,  188,  186,   33,
			  193,  193,  310,  310,  189,  193,  194,  194,  190,  195,
			  195,  194,  202,  202,  195,  203,  203,  202,  193,   20,
			  203,  204,  204,  205,  205,   12,  204,  190,  205,    9,
			  195,  194,    7,  203,  204,    5,  202,    3,  206,  206,
			  205,  207,  207,  206,  336,  336,  207,  208,  208,  208,

			  209,  209,  256,  256,  256,  209,    0,  208,  208,  205,
			  206,  207,  208,  210,  210,  211,  211,  209,  210,    0,
			  211,  212,  212,  213,  213,    0,  212,    0,  213,  258,
			  258,  258,  214,  214,  212,  211,  209,  214,  210,  215,
			  215,  216,  216,    0,  215,    0,  216,  217,  217,  334,
			  334,  213,  217,  214,  216,    0,  215,  222,  222,    0,
			  222,  222,  224,  224,    0,  217,    0,  224,  225,  225,
			    0,  226,  226,  225,    0,  215,  226,  229,  229,  224,
			  227,  227,  229,  226,  334,  227,  225,  228,  228,    0,
			  222,    0,  228,    0,  232,  232,  337,  337,  224,  232,

			  228,  227,  229,  233,  233,    0,  226,    0,  233,  234,
			  234,  235,  235,  235,  234,  232,    0,  236,  236,  236,
			  233,  235,  235,    0,  237,  237,  235,  236,  236,  237,
			  238,  238,  236,    0,  234,  238,  239,  239,  239,  233,
			  240,  240,  344,  344,  237,  240,  239,  239,  247,  247,
			    0,  239,    0,  247,  238,  248,  248,  249,  249,  238,
			  248,  240,  249,  345,  345,  250,  250,    0,  248,  247,
			  250,  251,  251,  251,    0,  252,  252,  356,  356,  239,
			  252,  251,  251,  253,  253,  250,  251,    0,  253,  254,
			  254,  255,  255,  255,  254,  260,  260,  262,  262,  262,

			  260,  255,  255,  253,  260,    0,  255,    0,  252,    0,
			  254,  261,  261,  263,  263,    0,  261,    0,  263,    0,
			  264,  264,  271,  271,  261,  264,    0,  271,  272,  272,
			    0,  273,  273,  272,  263,  264,  273,  274,  274,  274,
			  272,    0,  271,  275,  275,  278,  278,  278,  275,    0,
			  276,  276,  276,  277,  277,  273,  357,  357,  277,    0,
			  276,  276,    0,  272,  275,  276,  280,  280,  275,  282,
			  282,  280,    0,  277,  282,  281,  281,  281,  283,  283,
			  286,  286,  286,  283,  280,  281,  281,  291,  291,    0,
			  281,    0,  291,  292,  292,    0,  282,    0,  292,  293, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  293,  293,  294,  294,  358,  358,  283,  294,  282,  293,
			  293,  295,  295,    0,  293,    0,  295,  296,  296,  296,
			  359,  359,  294,    0,  295,  298,  298,  298,  299,  299,
			  300,  300,  300,  299,    0,  298,  298,  302,  302,    0,
			  298,    0,  302,  303,  303,  303,  304,  304,  304,    0,
			  302,  366,  366,  303,  303,  308,  308,  308,  303,  376,
			  376,  299,  312,  312,  312,  314,  314,    0,  315,  315,
			  314,  389,  389,  315,  316,  316,  316,  318,  318,    0,
			  319,  319,  318,    0,    0,  319,  320,  320,  320,    0,
			  314,  315,  326,    0,  326,  326,    0,  326,  326,  328,

			  328,    0,  318,  319,  328,  315,  329,  329,  330,  330,
			    0,  329,    0,  330,  331,  331,    0,  319,    0,  331,
			  328,  330,  338,  338,    0,  329,    0,  338,  339,  339,
			  340,  340,  331,  339,    0,  340,    0,  341,  341,    0,
			  338,    0,  341,    0,    0,  339,  341,    0,  347,  340,
			  347,  347,    0,  347,  347,  350,  350,  351,  351,    0,
			  350,    0,  351,    0,  339,  352,  352,  353,  353,    0,
			  352,    0,  353,  360,  360,    0,  350,  351,  360,  361,
			  361,  362,  362,    0,  361,    0,  362,  352,  360,  370,
			  370,  363,  363,  363,  370,  353,  372,  372,  372,  362,

			  361,  363,  363,  367,    0,  367,  363,  370,  367,  367,
			  368,    0,  368,  368,    0,  368,  368,  369,  369,  371,
			  371,    0,  369,    0,  371,  377,  377,    0,  371,    0,
			  377,  378,  378,    0,  369,    0,  378,    0,  377,  379,
			  379,    0,    0,  383,  379,  383,  383,    0,  383,  383,
			  384,  384,  378,  369,    0,  384,  385,  385,  390,  390,
			  390,  385,  386,  386,  379,  391,  391,  386,  390,  390,
			  391,  385,    0,  390,  384,  386,  392,  392,  392,  393,
			  393,  393,  391,  395,    0,  395,  392,  392,  395,  395,
			    0,  392,  396,  396,  396,  398,  398,  399,  399,  399,

			  398,  391,  402,  402,  404,  404,  404,  402,  398,  405,
			  405,  405,    0,    0,  404,  404,  406,  406,  406,  404,
			  423,  423,  423,  423,    0,    0,  402,  410,  410,  410,
			  410,  410,  410,  410,  410,  410,  410,  411,  411,  411,
			  411,  411,  411,  411,  411,  411,  411,  412,  412,  412,
			  412,  412,  412,  412,  412,  412,  412,  413,  413,  413,
			  413,  413,  413,  413,  413,  413,  413,  414,  414,  414,
			  414,  414,  414,  414,  414,  415,  415,  415,  415,  415,
			  415,  415,  415,  416,    0,  416,  416,  416,  416,  416,
			  416,  416,  416,  417,  417,  417,  417,  417,  417,  417,

			  417,  417,  417,  418,  418,  418,  418,  418,  418,  418,
			  418,  418,  418,  419,  419,  419,  419,  419,  419,  419,
			  419,  419,  419,  420,  420,  420,  420,  420,  420,  420,
			  420,  420,  420,  421,  421,  421,  421,  421,  421,  421,
			  421,  422,  422,  422,  422,  422,  422,  422,  422,  424,
			  424,  424,  424,  424,  424,  424,  424,  425,  425,  425,
			  425,  425,  425,  426,  426,  426,  426,  426,  426,  426,
			  426,  427,  427,  427,  427,  427,  427,  428,  428,  428,
			  428,  428,  428,  428,  428,  429,  429,  429,  429,  429,
			  429,  429,  429,  430,  430,  430,  430,  431,  431,  431,

			  431,  431,  431,  432,  432,  432,  432,  432,  432,  432,
			  432,  433,  433,  433,  433,  434,  434,  434,  434,  434,
			  434,  435,  435,  435,  435,  435,  435,  409,  409,  409,
			  409,  409,  409,  409,  409,  409,  409,  409,  409,  409,
			  409,  409,  409,  409,  409,  409,  409,  409,  409,  409,
			  409,  409,  409,  409,  409,  409,  409,  409,  409,  409,
			  409,  409,  409,  409,  409,  409,  409,  409,  409,  409,
			  409,  409,  409,  409,  409,  409,  409,  409,  409, yy_Dummy>>,
			1, 579, 1000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,   31,  684,   50,  682,   54,  679,   56,  679,
			 1527,   61,  672, 1527, 1527, 1527, 1527, 1527, 1527, 1527,
			  657,    0, 1527,   68, 1527, 1527, 1527, 1527,   63,   57,
			   73,   76,   78,  601, 1527, 1527,    0,   80,   86,   96,
			   82,   90,  104,  110,  112,  118,    0, 1527,  611,  602,
			  593, 1527,  612, 1527,  130,  605,  603, 1527,  132,  601,
			  116,  599,  160,    0,  124,  129,  137,  169,  140,  175,
			  172,  551,  178,  188,  181,  203,  205,  211,  213,  220,
			  223,  229,  235,    0,  564,  561,   36,  587,  581,  153,
			 1527,  568,  561,  156, 1527,  555,  171,  193,  245,  247,

			  537,  250,  256,  262,  259,  536,  265,  268,  277,  280,
			  287,  296,  289,  305,  308,  311,  326,  317,  332,  340,
			  513,  510,   99,   59,  249,  302,  342,    0,  352,  355,
			  361,  184,  363,  369,  371,  389,  395,  403,  405,  411,
			  413,  420,  422,  433,  443,  451,  502,  502,  499,  102,
			  374,  459,    0,  453,  470,  472,  511, 1527,  479,  485,
			  494,  496,  503,  511,  521,  524,  530,  536,  553,  555,
			  562,  565,  504,  489,  257,  302,  324,  502,  568,  574,
			  576,  582,  588,  597,  599,  608,  614,  617,  620,  627,
			  629,  395, 1527,  638,  644,  647,  475,  478,  464,  456,

			  335,    0,  650,  653,  659,  661,  676,  679,  695,  688,
			  701,  703,  709,  711,  720,  727,  729,  735,  329,  447,
			  400,  440,  745,  447,  750,  756,  759,  768,  775,  765,
			  558, 1527,  782,  791,  797,  809,  815,  812,  818,  834,
			  828,  420,  414,  414,  428,  349,    0,  836,  843,  845,
			  853,  869,  863,  871,  877,  889,  700, 1527,  727, 1527,
			  883,  899,  895,  901,  908,  412,  397,  404,  398,  482,
			    0,  910,  916,  919,  935,  931,  948,  941,  943, 1527,
			  954,  973,  957,  966,  385,  218,  978,  387,  505,  362,
			  398,  975,  981,  997,  990,  999, 1015, 1527, 1023, 1016,

			 1028, 1527, 1025, 1041, 1044,  377,  380, 1527, 1053,  611,
			  637,    0, 1060, 1527, 1053, 1056, 1072, 1527, 1065, 1068,
			 1084, 1527, 1527,  358,  321, 1527, 1082,    0, 1087, 1094,
			 1096, 1102,  360,  354,  734,  330,  679,  784, 1110, 1116,
			 1118, 1125,  303,  438,  827,  848,  281, 1138,    0,  256,
			 1143, 1145, 1153, 1155,  258,  251,  862,  941,  992, 1005,
			 1161, 1167, 1169, 1189,  234,  216, 1036, 1193, 1200, 1205,
			 1177, 1207, 1194,  440,  208,  182, 1044, 1213, 1219, 1227,
			  196,  181,  137, 1233, 1238, 1244, 1250,  140,  114, 1056,
			 1256, 1253, 1274, 1277,  481, 1273, 1290, 1527, 1283, 1295,

			 1527,   88, 1290,   64, 1302, 1307, 1314, 1527, 1527, 1527,
			 1326, 1336, 1346, 1356, 1364, 1372, 1382, 1392, 1402, 1412,
			 1422, 1430, 1438, 1313, 1446, 1452, 1460, 1466, 1474, 1482,
			 1486, 1492, 1500, 1504, 1510, 1516, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  409,    1,  410,  410,  411,  412,  411,  413,  409,
			  409,  409,  409,  409,  409,  409,  409,  409,  409,  409,
			  414,  414,  409,  414,  409,  409,  409,  409,  415,  415,
			  415,  415,  415,  409,  409,  409,  414,  415,  415,  415,
			  415,  415,  415,  415,  415,  415,  416,  409,  416,  416,
			  416,  409,  409,  409,  417,  409,  409,  409,  418,  409,
			  409,  409,  419,  414,  414,  414,  415,  415,  415,  415,
			  415,  409,  415,  415,  415,  415,  415,  415,  415,  415,
			  415,  415,  415,  416,  416,  416,  416,  409,  417,  417,
			  409,  409,  418,  418,  409,  420,  409,  414,  421,  422,

			  409,  415,  415,  415,  415,  409,  415,  415,  415,  415,
			  415,  415,  415,  415,  415,  415,  415,  415,  415,  415,
			  416,  416,  416,  416,  414,  421,  422,  423,  415,  415,
			  415,  409,  415,  415,  415,  415,  415,  415,  415,  415,
			  415,  415,  415,  415,  415,  415,  416,  416,  416,  416,
			  414,  424,  425,  415,  415,  415,  409,  409,  415,  415,
			  415,  415,  415,  415,  415,  415,  415,  415,  415,  415,
			  415,  415,  416,  416,  416,  416,  426,  425,  415,  415,
			  415,  415,  415,  415,  415,  415,  415,  415,  415,  415,
			  415,  409,  409,  415,  415,  415,  416,  416,  416,  416,

			  426,  427,  415,  415,  415,  415,  415,  415,  415,  415,
			  415,  415,  415,  415,  415,  415,  415,  415,  416,  416,
			  416,  416,  428,  427,  415,  415,  415,  415,  415,  415,
			  409,  409,  415,  415,  415,  415,  415,  415,  415,  415,
			  415,  416,  416,  416,  416,  429,  430,  415,  415,  415,
			  415,  415,  415,  415,  415,  415,  409,  409,  409,  409,
			  415,  415,  409,  415,  415,  416,  416,  416,  416,  429,
			  431,  415,  415,  415,  409,  415,  415,  415,  409,  409,
			  415,  415,  415,  415,  416,  416,  416,  416,  432,  414,
			  431,  415,  415,  415,  415,  415,  409,  409,  415,  415,

			  409,  409,  415,  415,  416,  416,  416,  409,  416,  432,
			  414,  433,  409,  409,  415,  415,  409,  409,  415,  415,
			  409,  409,  409,  416,  416,  409,  414,  434,  415,  415,
			  415,  415,  416,  416,  409,  414,  414,  434,  415,  415,
			  415,  415,  416,  416,  409,  409,  414,  414,  435,  409,
			  415,  415,  415,  415,  416,  416,  414,  414,  435,  409,
			  415,  415,  415,  415,  416,  416,  414,  414,  409,  415,
			  415,  415,  409,  416,  416,  409,  409,  415,  415,  415,
			  416,  416,  409,  409,  415,  415,  415,  416,  416,  409,
			  415,  415,  415,  416,  416,  409,  409,  409,  415,  409,

			  409,  416,  415,  416,  415,  416,  409,  409,  409,    0,
			  409,  409,  409,  409,  409,  409,  409,  409,  409,  409,
			  409,  409,  409,  409,  409,  409,  409,  409,  409,  409,
			  409,  409,  409,  409,  409,  409, yy_Dummy>>)
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
			   41,   42,    1,   43,   44,   45,    1,   21,   22,   46,

			   47,   25,   26,   27,   28,   48,   22,   22,   30,   31,
			   32,   33,   34,   22,   49,   36,   37,   50,   51,   22,
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
			    7,    7, yy_Dummy>>)
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
			    0,   58,   58,   58,   22,   58,   58,   58,    0,   40,
			   58,   58,   58,   58,   49,   49,   49,   49,   59,   59,
			    0,   26,   27,   58,   58,   58,    0,   33,   58,   58,

			    0,   30,   58,   58,   49,   49,   49,   44,   49,   59,
			   59,    0,    0,   36,   58,   58,    0,   32,   58,   58,
			    0,   35,   45,   49,   49,   43,   57,    0,   58,   58,
			   58,   58,   49,   49,    0,   59,   59,    0,   58,   58,
			   58,   58,   49,   49,   57,    0,   59,   57,    0,    0,
			   58,   58,   58,   58,   49,   49,   59,   59,    0,    0,
			   58,   58,   58,   58,   49,   49,   57,   57,   57,   58,
			   58,   58,   23,   49,   49,    0,    0,   58,   58,   58,
			   49,   49,    0,   57,   58,   58,   58,   49,   49,    0,
			   58,   58,   58,   49,   49,   57,    0,   39,   58,   25,

			   46,   49,   58,   49,   58,   49,    0,   37,   47,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 1527
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 409
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 410
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
