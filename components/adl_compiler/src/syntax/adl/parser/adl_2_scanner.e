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
			inspect yy_act
when 1 then
--|#line 75 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 75")
end
-- Ignore separators
when 2 then
--|#line 76 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 76")
end
in_lineno := in_lineno + text_count
when 3 then
--|#line 81 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 81")
end
	-- Overlay split line
		in_lineno := in_lineno + 1
		set_start_condition (IN_TEMPLATE_OVERLAYS_SECTION)

when 4 then
--|#line 88 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 88")
end
-- Ignore comments
when 5 then
--|#line 89 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 89")
end
in_lineno := in_lineno + 1
when 6 then
--|#line 93 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 93")
end
last_token := Minus_code
when 7 then
--|#line 94 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 94")
end
last_token := Plus_code
when 8 then
--|#line 95 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 95")
end
last_token := Star_code
when 9 then
--|#line 96 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 96")
end
last_token := Slash_code
when 10 then
--|#line 97 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 97")
end
last_token := Caret_code
when 11 then
--|#line 98 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 98")
end
last_token := Equal_code
when 12 then
--|#line 99 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 99")
end
last_token := Dot_code
when 13 then
--|#line 100 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 100")
end
last_token := Semicolon_code
when 14 then
--|#line 101 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 101")
end
last_token := Comma_code
when 15 then
--|#line 102 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 102")
end
last_token := Colon_code
when 16 then
--|#line 103 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 103")
end
last_token := Exclamation_code
when 17 then
--|#line 104 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 104")
end
last_token := Left_parenthesis_code
when 18 then
--|#line 105 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 105")
end
last_token := Right_parenthesis_code
when 19 then
--|#line 106 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 106")
end
last_token := Dollar_code
when 20 then
--|#line 107 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 107")
end
last_token := Question_mark_code
when 21 then
--|#line 109 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 109")
end
last_token := Left_bracket_code
when 22 then
--|#line 110 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 110")
end
last_token := Right_bracket_code
when 23 then
--|#line 114 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 114")
end

				last_token := SYM_ARCHETYPE
			
when 24 then
--|#line 118 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 118")
end

				last_token := SYM_TEMPLATE_OVERLAY
			
when 25 then
--|#line 122 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 122")
end

				last_token := SYM_TEMPLATE
			
when 26 then
--|#line 126 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 126")
end

				last_token := SYM_OPERATIONAL_TEMPLATE
			
when 27 then
--|#line 130 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 130")
end

				last_token := SYM_ADL_VERSION
			
when 28 then
--|#line 134 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 134")
end

				last_token := SYM_RM_RELEASE
			
when 29 then
--|#line 138 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 138")
end

				last_token := SYM_IS_CONTROLLED
			
when 30 then
--|#line 142 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 142")
end

				last_token := SYM_IS_GENERATED
			
when 31 then
--|#line 146 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 146")
end

				last_token := SYM_UID
			
when 32 then
--|#line 150 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 150")
end

				last_token := SYM_BUILD_UID
			
when 33 then
--|#line 154 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 154")
end

				last_token := SYM_SPECIALIZE
				in_lineno := in_lineno + 1
			
when 34 then
--|#line 160 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 160")
end

				last_token := SYM_LANGUAGE
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				language_text_start_line := in_lineno
			
when 35 then
--|#line 167 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 167")
end

				last_token := SYM_DESCRIPTION
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				description_text_start_line := in_lineno
			
when 36 then
--|#line 174 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 174")
end

				last_token := SYM_DEFINITION
				set_start_condition (IN_CADL_SECTION)
				in_lineno := in_lineno + 1
				definition_text_start_line := in_lineno
			
when 37 then
--|#line 181 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 181")
end

				last_token := SYM_RULES
				set_start_condition (IN_RULES_SECTION)
				in_lineno := in_lineno + 1
				rules_text_start_line := in_lineno
			
when 38 then
--|#line 188 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 188")
end

				last_token := SYM_TERMINOLOGY
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				terminology_text_start_line := in_lineno
			
when 39 then
--|#line 195 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 195")
end

				last_token := SYM_ANNOTATIONS
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				annotations_text_start_line := in_lineno
			
when 40 then
--|#line 202 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 202")
end

				last_token := SYM_COMPONENT_TERMINOLOGIES
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				component_terminologies_text_start_line := in_lineno
			
when 41 then
--|#line 212 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 212")
end

				last_token := SYM_COMPONENT_TERMINOLOGIES
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				component_terminologies_text_start_line := in_lineno
			
when 42 then
--|#line 219 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 219")
end

				last_token := SYM_RULES
				set_start_condition (IN_RULES_SECTION)
				in_lineno := in_lineno + 1
				rules_text_start_line := in_lineno
			
when 43 then
--|#line 226 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 226")
end

				last_token := SYM_TERMINOLOGY
				set_start_condition (IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				terminology_text_start_line := in_lineno
			
when 44 then
--|#line 232 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 232")
end

				last_token := V_CONCEPT_CODE
				last_string_value := text_substring (2, text_count - 1)
			
when 45, 46, 47, 48, 49, 50 then
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
			
when 51 then
--|#line 266 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 266")
end
 -- LF
				in_buffer.append_character('%N')
				in_lineno := in_lineno + 1
			
when 52 then
--|#line 271 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 271")
end
 -- any text on line with no LF
				in_buffer.append_string (text)
			
when 53 then
--|#line 287 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 287")
end
			-- match ^whitespace <anything> \n
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
when 54 then
--|#line 292 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 292")
end
in_lineno := in_lineno + text_count
when 55 then
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
	
when 56 then
--|#line 306 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 306")
end
			-- match ^whitespace <anything> \n
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
when 57 then
--|#line 311 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 311")
end
in_lineno := in_lineno + text_count
when 58 then
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
	
when 59 then
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
	
when 60 then
--|#line 333 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 333")
end
			-- match <anything> \n
				in_buffer.append_string (text)
				in_lineno := in_lineno + 1
	
when 61 then
--|#line 349 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 349")
end

					last_token := V_DOTTED_NUMERIC
					last_string_value := text_substring (1, text_count)
			
when 62 then
--|#line 355 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 355")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
when 63 then
--|#line 361 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 361")
end

					last_token := V_IDENTIFIER
					last_string_value := text
			
when 64 then
--|#line 367 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 367")
end

					last_token := V_VALUE
					last_string_value := text
			
when 65 then
--|#line 374 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 374")
end
-- ignore unmatched chars
when 66 then
--|#line 0 "adl_2_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_2_scanner.l' at line 0")
end
default_action
			else
				last_token := yyError_token
				fatal_error ("fatal scanner internal error: no action found")
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
			create an_array.make_filled (0, 0, 1620)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			yy_nxt_template_3 (an_array)
			yy_nxt_template_4 (an_array)
			yy_nxt_template_5 (an_array)
			yy_nxt_template_6 (an_array)
			yy_nxt_template_7 (an_array)
			yy_nxt_template_8 (an_array)
			an_array.area.fill_with (503, 1566, 1620)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			    0,   13,   14,   13,   15,   16,   17,   18,   19,   20,
			   21,   22,   23,   24,   25,   25,   26,   27,   28,   29,
			   30,   31,   32,   33,   33,   33,   34,   33,   33,   33,
			   33,   33,   33,   33,   33,   35,   33,   33,   36,   33,
			   33,   33,   37,   38,   39,   40,   30,   32,   33,   33,
			   33,   33,   33,   35,   33,   12,   41,   60,   61,   64,
			   65,   67,   68,  110,   70,   42,   70,   43,   44,   73,
			   73,   69,  112,   45,   74,   46,   75,   75,   47,   52,
			   48,   49,   50,   73,   73,   73,   73,  394,   53,   73,
			   73,   42,   43,   44,  395,   45,   46,   54,   48,   55,

			   56,   77,   73,   73,   73,   73,  184,   79,   73,   73,
			   78,   73,   73,   73,   73,   80,  143,   73,   73,   73,
			   73,   82,  317,   54,   55,   56,   77,  144,   81,   77,
			   73,   73,   88,   87,   89,   73,   73,  185,   85,   90,
			   70,   86,   70,   82,   73,   73,   73,   73,   73,   73,
			  103,  104,  107,  108,   77,  114,   91,  114,   92,   86,
			  178,   95,  111,  110,   81,   90,  115,  115,  172,   94,
			   74,   93,   75,   75,  116,  117,   92,  116,  117,  118,
			  116,  117,  118,  103,  104,  118,  172,   94,  113,  114,
			  113,  113,  113,  113,  113,  113,  113,  113,  121,  119, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  113,  107,  108,  113,  113,  113,  113,  116,  117,  499,
			  116,  117,  118,  116,  117,  118,  116,  117,  118,  497,
			  119,  118,  116,  117,  120,  111,  110,  118,  124,  113,
			  113,  113,  449,  146,  122,  115,  115,   73,   73,  450,
			  116,  117,  113,  127,  123,  118,  120,  116,  117,   73,
			   73,  128,  118,  124,  113,  114,  113,  113,  113,  113,
			  113,  113,  113,  113,  126,  174,  113,  129,  121,  113,
			  113,  113,  113,  116,  117,  229,  128,  461,  118,  116,
			  117,  116,  117,  110,  118,  110,  118,  130,  116,  117,
			  174,  173,  145,  118,  175,  113,  113,  113,  131,  116,

			  117,  229,  133,  204,  118,  116,  117,  132,  113,  258,
			  118,  231,  135,  173,  134,  116,  117,  482,  116,  117,
			  118,  204,  132,  118,  136,  116,  117,  258,  137,  480,
			  118,  116,  117,  231,  116,  117,  118,  479,  138,  118,
			  176,  176,  139,  116,  117,  136,  116,  117,  118,  110,
			  151,  118,  116,  117,  478,  152,  153,  118,  205,  150,
			  139,  116,  117,  116,  117,  232,  118,  281,  118,  110,
			  154,  151,  116,  117,  474,  116,  117,  118,  233,  158,
			  118,  177,   73,  157,  472,  116,  117,  232,  154,  281,
			  118,  471,  160,  116,  117,  159,  161,  146,  118,  176, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  176,  158,  162,  116,  117,  116,  117,  283,  118,  313,
			  118,  116,  117,  159,  160,  420,  118,  469,  163,  116,
			  117,  161,   73,   73,  118,  116,  117,  164,  162,  283,
			  118,  313,  166,  116,  117,  165,  167,  420,  118,  116,
			  117,   73,  117,  468,  118,  110,  118,  116,  117,  392,
			  116,  117,  118,  165,  259,  118,  168,   73,  260,  169,
			  110,  167,  180,  116,  117,  116,  117,  392,  118,  285,
			  118,  116,  117,  358,  168,  179,  118,  359,  183,  116,
			  117,  116,  117,  419,  118,  467,  118,  180,  463,  181,
			  179,  110,  116,  117,  188,  182,  461,  118,  116,  117,

			  314,  116,  117,  118,  419,  187,  118,  116,  117,  110,
			  116,  117,  118,  182,  189,  118,  116,  117,  338,  190,
			  460,  118,  457,  116,  117,  191,   73,   73,  118,  116,
			  117,  192,  195,  110,  118,  194,  456,  193,  315,  316,
			  116,  117,  362,  191,  457,  118,  116,  117,  452,  192,
			  458,  118,   73,   73,  196,  409,  194,  197,  195,  116,
			  117,  223,  224,  223,  118,  198,   73,   73,  447,   73,
			   73,  458,  116,  117,  315,  316,  199,  118,  446,  197,
			  363,  363,  116,  117,  445,  208,  198,  118,  116,  117,
			  116,  117,  493,  118,  439,  118,  116,  117,  199,  211, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   73,  118,  116,  117,  435,  116,  117,  118,  116,  117,
			  118,  214,  210,  118,  493,  212,  209,  116,  117,  300,
			  301,  300,  118,  116,  117,  211,  110,  433,  118,  216,
			  210,  215,  396,  396,  217,  381,  212,  214,  116,  117,
			  218,  116,  117,  118,  116,  117,  118,  116,  117,  118,
			  220,  114,  118,  114,  110,  219,  217,  223,  224,  223,
			  116,  117,  218,  393,  432,  118,  221,  116,  117,  225,
			  116,  117,  118,  222,  431,  118,  220,  219,  426,  226,
			  116,  117,  116,  117,  423,  118,  422,  118,  116,  117,
			  418,  116,  117,  118,  110,  225,  118,  116,  117,  116,

			  117,  227,  118,  407,  118,  226,  236,  397,  398,  116,
			  117,  413,  240,  238,  118,  237,  116,  117,  302,  303,
			  302,  118,  110,  239,  236,  116,  117,  116,  117,  412,
			  118,  421,  118,  424,  424,  242,  116,  117,  244,  116,
			  117,  118,  116,  117,  118,  243,  110,  118,  247,  116,
			  117,  116,  117,  245,  118,  434,  118,  248,  409,  246,
			  116,  117,  116,  117,  249,  118,  408,  118,  250,  110,
			  116,  117,  397,  398,  247,  118,  406,  246,  448,  251,
			  116,  117,  116,  117,  405,  118,  110,  118,  252,  404,
			  250,  399,  253,  116,  117,  459,  116,  117,  118,  263, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  251,  118,  116,  117,  391,  262,  390,  118,  110,  265,
			  110,  266,  264,  116,  117,  116,  117,  470,  118,  481,
			  118,  263,  116,  117,  116,  117,  385,  118,  379,  118,
			  268,  116,  117,  264,  116,  117,  118,  266,  269,  118,
			  378,  271,  376,  270,  365,  116,  117,  364,  116,  117,
			  118,  361,  268,  118,  357,  273,  269,  272,  274,  116,
			  117,  116,  117,  271,  118,  356,  118,  116,  117,  116,
			  117,  344,  118,  340,  118,  425,  425,  275,  277,  337,
			  278,  276,  116,  117,  336,  116,  117,  118,  279,  335,
			  118,  116,  117,  116,  117,  334,  118,  289,  118,  288,

			  277,  116,  117,  116,  117,  291,  118,  333,  118,  279,
			  290,  116,  117,  116,  117,  321,  118,  312,  118,  436,
			  436,  288,  289,  311,  295,  294,  292,  116,  117,  310,
			  291,  290,  118,  116,  117,  116,  117,  309,  118,  296,
			  118,  300,  301,  300,  302,  303,  302,  436,  436,  297,
			  298,  116,  117,  293,  116,  117,  118,  116,  117,  118,
			  287,  299,  118,  116,  117,  306,  306,  306,  118,  116,
			  117,  284,  298,  282,  118,  116,  117,  280,  304,  267,
			  118,  116,  117,  257,  116,  117,  118,  256,  305,  118,
			  255,  308,  254,  305,  116,  117,  116,  117,  241,  118, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  235,  118,  230,  318,  228,  116,  117,  319,  213,  307,
			  118,  116,  117,  323,  323,  323,  118,  155,  320,  203,
			  116,  117,  202,  116,  117,  118,  116,  117,  118,  116,
			  117,  118,  322,  201,  118,  327,  328,  327,  200,  116,
			  117,  306,  306,  306,  118,  116,  117,  325,  329,  186,
			  118,  326,  116,  117,  324,  116,  117,  118,  116,  117,
			  118,  116,  117,  118,  171,  330,  118,  116,  117,  170,
			  116,  117,  118,  332,  329,  118,  156,  331,  155,  343,
			  116,  117,  342,  451,  451,  118,  323,  323,  323,  116,
			  117,  348,  349,  348,  118,  116,  117,  327,  328,  327,

			  118,  116,  117,  149,  343,  345,  118,  116,  117,  116,
			  117,  346,  118,  114,  118,  347,  350,  352,  353,  352,
			  116,  117,  336,  360,  336,  118,  351,  116,  117,  116,
			  117,  110,  118,  108,  118,  116,  117,  354,  473,  473,
			  118,  116,  117,  366,  367,  366,  118,  351,  105,  355,
			  116,  117,  354,  116,  117,  118,  483,  483,  118,  348,
			  349,  348,  368,  369,  370,  371,  370,  116,  117,  352,
			  353,  352,  118,  104,  116,  117,  116,  117,  101,  118,
			  142,  118,  374,  375,  374,  357,  377,  357,  141,  373,
			  483,  483,  116,  117,  361,  380,  361,  118,  140,  382, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  383,  372,  363,  363,  366,  367,  366,  116,  117,  125,
			  116,  117,  118,  207,  207,  118,  370,  371,  370,  116,
			  117,   71,  116,  117,  118,  261,  261,  118,  374,  375,
			  374,  116,  117,  386,  387,  110,  118,  116,  117,  443,
			  444,  443,  118,  116,  117,  388,  389,  105,  118,  116,
			  117,  105,  387,  400,  118,  101,  402,  401,  382,  410,
			  101,  396,  396,  100,  389,  116,  117,   99,  403,   98,
			  118,  116,  117,  116,  117,   97,  118,   84,  118,  341,
			  341,  116,  117,   83,  414,   72,  118,   71,  415,  403,
			  417,  116,  117,  416,  116,  117,  118,  116,  117,  118,

			  384,  384,  118,  116,  117,  414,  116,  117,  118,  503,
			  415,  118,   62,  427,  382,  428,  417,  424,  424,   58,
			  429,  437,  438,   52,  425,  425,  116,  117,  441,  116,
			  117,  118,  430,  503,  118,  443,  444,  443,  429,  116,
			  117,  440,  116,  117,  118,  116,  117,  118,  442,  503,
			  118,  411,  411,  116,  117,  503,  453,  503,  118,  503,
			  503,  454,  455,  437,  462,  503,  451,  451,  503,  442,
			  116,  117,  116,  117,  503,  118,  503,  118,  453,  116,
			  117,  503,  454,  464,  118,  116,  117,  503,  455,  503,
			  118,  116,  117,  503,  465,  503,  118,  437,  116,  117, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  473,  473,  503,  118,  503,  466,  476,  484,  485,  484,
			  475,  477,  486,  487,  486,  116,  117,  474,  503,  503,
			  118,  503,  116,  117,  489,  489,  489,  118,  490,  491,
			  490,  503,  488,  503,  116,  117,  503,  503,  478,  118,
			  479,  492,  479,  494,  495,  494,  484,  485,  484,  486,
			  487,  486,  503,  481,  488,  116,  117,  489,  489,  489,
			  118,  490,  491,  490,  494,  495,  494,  503,  496,  116,
			  117,  500,  501,  500,  118,  499,  502,  499,  500,  501,
			  500,  116,  117,   73,   73,   73,  118,   51,   51,   51,
			   51,   51,  503,  503,  498,   57,   57,   57,   57,   57,

			   59,   59,   59,   59,   59,   63,   63,   63,   63,   63,
			   66,   66,   66,   66,   66,   76,   76,   76,   96,   96,
			   96,   96,  102,  102,  102,  102,  102,  106,  106,  106,
			  106,  106,  109,  109,  109,  109,  109,   72,   72,   72,
			   72,   72,  113,  113,  113,  113,  113,  147,  147,  147,
			  148,  148,  148,  206,  206,  206,  234,  234,  234,  286,
			  286,  286,  339,  339,  339,   11, yy_Dummy>>,
			1, 166, 1400)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1620)
			an_array.put (0, 0)
			an_array.area.fill_with (1, 1, 55)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			yy_chk_template_3 (an_array)
			yy_chk_template_4 (an_array)
			yy_chk_template_5 (an_array)
			yy_chk_template_6 (an_array)
			yy_chk_template_7 (an_array)
			yy_chk_template_8 (an_array)
			an_array.area.fill_with (503, 1565, 1620)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    2,    6,    6,    8,    8,   10,   10,   69,   13,    2,
			   13,    2,    2,   33,   33,   10,   69,    2,   25,    2,
			   25,   25,    2,    4,    2,    2,    2,   31,   31,   32,
			   32,  382,    4,   30,   30,    2,    2,    2,  382,    2,
			    2,    4,    2,    4,    4,   30,   34,   34,   36,   36,
			  155,   32,   35,   35,   31,   43,   43,   45,   45,   34,
			  100,   42,   42,   44,   44,   36,  525,    4,    4,    4,
			   30,  100,   35,   42,   46,   46,   44,   43,   45,   47,
			   47,  155,   42,   46,   70,   42,   70,   36,   48,   48,
			   49,   49,   50,   50,   60,   60,   64,   64,   42,  114,

			   47,  114,   47,   42,  519,   50,   67,   67,   48,   46,
			   74,   74,  142,   49,   75,   48,   75,   75,   76,   76,
			   47,   79,   79,   76,   77,   77,   79,  103,  103,   77,
			  142,   49,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   79,   77,   72,  107,  107,   72,   72,   72,
			   72,   78,   78,  497,   81,   81,   78,   80,   80,   81,
			   82,   82,   80,  493,   77,   82,   85,   85,   78,  111,
			  111,   85,   82,   72,   72,   72,  437,  115,   80,  115,
			  115,  116,  116,  437,   86,   86,   72,   85,   81,   86,
			   78,   87,   87,  117,  117,   86,   87,   82,   84,   84, yy_Dummy>>,
			1, 200, 56)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   84,   84,   84,   84,   84,   84,   84,   84,   84,  144,
			   84,   87,   87,   84,   84,   84,   84,   88,   88,  201,
			   86,  482,   88,   89,   89,   90,   90,  112,   89,  145,
			   90,   88,   91,   91,  144,  143,  112,   91,  145,   84,
			   84,   84,   88,   92,   92,  201,   90,  174,   92,   93,
			   93,   89,   84,  232,   93,  203,   92,  143,   91,   94,
			   94,  471,   95,   95,   94,  174,   89,   95,   93,  119,
			  119,  232,   94,  469,  119,  120,  120,  203,  121,  121,
			  120,  468,   95,  121,  146,  146,   95,  122,  122,   93,
			  123,  123,  122,  175,  120,  123,  124,  124,  467,  121,

			  122,  124,  175,  119,   95,  127,  127,  128,  128,  204,
			  127,  255,  128,  205,  123,  120,  129,  129,  463,  130,
			  130,  129,  205,  128,  130,  147,  147,  127,  461,  131,
			  131,  204,  123,  255,  131,  460,  130,  132,  132,  129,
			  131,  176,  132,  176,  176,  128,  132,  133,  133,  134,
			  134,  257,  133,  284,  134,  135,  135,  129,  130,  406,
			  135,  458,  133,  136,  136,  131,  206,  206,  136,  137,
			  137,  134,  132,  257,  137,  284,  136,  138,  138,  135,
			  137,  406,  138,  139,  139,  148,  148,  457,  139,  233,
			  148,  150,  150,  379,  151,  151,  150,  135,  233,  151, yy_Dummy>>,
			1, 200, 256)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  138,  234,  234,  139,  259,  137,  151,  152,  152,  154,
			  154,  379,  152,  259,  154,  153,  153,  335,  138,  150,
			  153,  335,  154,  157,  157,  158,  158,  405,  157,  456,
			  158,  151,  452,  152,  150,  285,  159,  159,  158,  153,
			  450,  159,  160,  160,  285,  161,  161,  160,  405,  157,
			  161,  162,  162,  314,  163,  163,  162,  153,  159,  163,
			  164,  164,  314,  160,  449,  164,  446,  165,  165,  161,
			  260,  260,  165,  166,  166,  162,  165,  338,  166,  164,
			  445,  163,  286,  286,  167,  167,  338,  161,  446,  167,
			  168,  168,  439,  162,  447,  168,  315,  315,  166,  435,

			  164,  167,  165,  169,  169,  223,  223,  223,  169,  168,
			  177,  177,  433,  177,  177,  447,  179,  179,  339,  339,
			  169,  179,  432,  167,  340,  340,  180,  180,  431,  179,
			  168,  180,  181,  181,  182,  182,  480,  181,  426,  182,
			  183,  183,  169,  182,  177,  183,  187,  187,  422,  188,
			  188,  187,  189,  189,  188,  187,  181,  189,  480,  183,
			  180,  190,  190,  300,  300,  300,  190,  191,  191,  182,
			  362,  420,  191,  189,  181,  188,  383,  383,  190,  362,
			  183,  187,  192,  192,  191,  193,  193,  192,  194,  194,
			  193,  195,  195,  194,  193,  485,  195,  485,  381,  192, yy_Dummy>>,
			1, 200, 456)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  190,  196,  196,  196,  197,  197,  191,  381,  419,  197,
			  194,  196,  196,  197,  198,  198,  196,  195,  418,  198,
			  193,  192,  413,  198,  199,  199,  208,  208,  409,  199,
			  408,  208,  209,  209,  404,  210,  210,  209,  393,  197,
			  210,  211,  211,  212,  212,  199,  211,  393,  212,  198,
			  208,  384,  384,  214,  214,  399,  212,  210,  214,  209,
			  215,  215,  302,  302,  302,  215,  407,  211,  208,  216,
			  216,  217,  217,  398,  216,  407,  217,  410,  410,  214,
			  218,  218,  216,  219,  219,  218,  220,  220,  219,  215,
			  421,  220,  219,  221,  221,  222,  222,  217,  221,  421,

			  222,  220,  395,  218,  225,  225,  226,  226,  221,  225,
			  394,  226,  222,  434,  227,  227,  411,  411,  219,  227,
			  392,  218,  434,  225,  236,  236,  237,  237,  391,  236,
			  448,  237,  226,  390,  222,  385,  227,  238,  238,  448,
			  239,  239,  238,  237,  225,  239,  240,  240,  378,  236,
			  376,  240,  459,  239,  470,  240,  238,  242,  242,  243,
			  243,  459,  242,  470,  243,  237,  244,  244,  245,  245,
			  365,  244,  359,  245,  242,  246,  246,  238,  247,  247,
			  246,  240,  243,  247,  358,  245,  356,  244,  344,  248,
			  248,  341,  249,  249,  248,  337,  242,  249,  334,  247, yy_Dummy>>,
			1, 200, 656)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  243,  246,  248,  250,  250,  251,  251,  245,  250,  333,
			  251,  252,  252,  253,  253,  321,  252,  316,  253,  412,
			  412,  249,  251,  313,  252,  250,  262,  262,  312,  263,
			  263,  262,  253,  311,  263,  264,  264,  265,  265,  310,
			  264,  263,  265,  262,  251,  266,  266,  268,  268,  265,
			  266,  309,  268,  253,  264,  269,  269,  270,  270,  293,
			  269,  283,  270,  423,  423,  262,  263,  282,  269,  268,
			  266,  271,  271,  281,  265,  264,  271,  272,  272,  273,
			  273,  280,  272,  270,  273,  274,  274,  274,  275,  275,
			  275,  436,  436,  271,  272,  274,  274,  267,  275,  275,

			  274,  276,  276,  275,  261,  273,  276,  277,  277,  278,
			  278,  278,  277,  279,  279,  258,  272,  256,  279,  278,
			  278,  254,  276,  241,  278,  288,  288,  231,  289,  289,
			  288,  230,  277,  289,  229,  279,  228,  277,  290,  290,
			  291,  291,  213,  290,  207,  291,  202,  288,  200,  292,
			  292,  290,  186,  278,  292,  294,  294,  295,  295,  295,
			  294,  184,  292,  173,  296,  296,  172,  295,  295,  296,
			  297,  297,  295,  298,  298,  297,  294,  171,  298,  299,
			  299,  299,  170,  304,  304,  306,  306,  306,  304,  299,
			  299,  297,  304,  156,  299,  298,  305,  305,  296,  307, yy_Dummy>>,
			1, 200, 856)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  307,  305,  308,  308,  307,  318,  318,  308,  141,  305,
			  318,  319,  319,  140,  320,  320,  319,  308,  304,  320,
			  126,  307,  125,  319,  322,  322,  318,  438,  438,  322,
			  323,  323,  323,  324,  324,  325,  325,  325,  324,  326,
			  326,  327,  327,  327,  326,  325,  325,  118,  319,  322,
			  325,  329,  329,  331,  331,  324,  329,  113,  331,  324,
			  326,  330,  330,  330,  332,  332,  336,  336,  336,  332,
			  329,  330,  330,  342,  342,  109,  330,  106,  342,  343,
			  343,  331,  462,  462,  343,  346,  346,  345,  345,  345,
			  346,  329,  105,  332,  347,  347,  331,  345,  345,  347,

			  472,  472,  345,  348,  348,  348,  346,  347,  350,  350,
			  350,  351,  351,  352,  352,  352,  351,  102,  350,  350,
			  354,  354,  101,  350,   99,  354,  355,  355,  355,  357,
			  357,  357,   98,  354,  483,  483,  355,  355,  361,  361,
			  361,  355,   97,  363,  363,  351,  363,  363,  366,  366,
			  366,  368,  368,   83,  369,  369,  368,  521,  521,  369,
			  370,  370,  370,  372,  372,   71,  373,  373,  372,  523,
			  523,  373,  374,  374,  374,  386,  386,  368,  369,   66,
			  386,  387,  387,  443,  443,  443,  387,  388,  388,  372,
			  373,   65,  388,  389,  389,   62,  369,  386,  389,   61, yy_Dummy>>,
			1, 200, 1056)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  388,  387,  396,  396,   58,  396,  396,   56,  373,  400,
			  400,   55,  389,   54,  400,  401,  401,  402,  402,   53,
			  401,   41,  402,  527,  527,  403,  403,   37,  400,   22,
			  403,   14,  401,  389,  403,  414,  414,  402,  415,  415,
			  414,  416,  416,  415,  528,  528,  416,  417,  417,  400,
			  428,  428,  417,   11,  401,  428,    7,  414,  424,  415,
			  403,  424,  424,    5,  416,  425,  425,    3,  425,  425,
			  427,  427,  428,  429,  429,  427,  417,    0,  429,  430,
			  430,  430,  416,  440,  440,  427,  441,  441,  440,  430,
			  430,  441,  429,    0,  430,  529,  529,  442,  442,    0,

			  440,    0,  442,    0,    0,  441,  442,  451,  451,    0,
			  451,  451,    0,  429,  453,  453,  454,  454,    0,  453,
			    0,  454,  440,  455,  455,    0,  441,  453,  455,  464,
			  464,    0,  442,    0,  464,  465,  465,    0,  454,    0,
			  465,  473,  466,  466,  473,  473,    0,  466,    0,  455,
			  465,  474,  474,  474,  464,  466,  475,  475,  475,  476,
			  476,  474,    0,    0,  476,    0,  475,  475,  477,  477,
			  477,  475,  478,  478,  478,    0,  476,    0,  477,  477,
			    0,    0,  478,  477,  479,  479,  479,  481,  481,  481,
			  484,  484,  484,  486,  486,  486,    0,  481,  476,  488, yy_Dummy>>,
			1, 200, 1256)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  488,  489,  489,  489,  488,  490,  490,  490,  494,  494,
			  494,    0,  488,  496,  496,  498,  498,  498,  496,  499,
			  499,  499,  500,  500,  500,  498,  498,  509,  509,  509,
			  498,  504,  504,  504,  504,  504,    0,    0,  496,  505,
			  505,  505,  505,  505,  506,  506,  506,  506,  506,  507,
			  507,  507,  507,  507,  508,  508,  508,  508,  508,  510,
			  510,  510,  511,  511,  511,  511,  512,  512,  512,  512,
			  512,  513,  513,  513,  513,  513,  514,  514,  514,  514,
			  514,  515,  515,  515,  515,  515,  516,  516,  516,  516,
			  516,  517,  517,  517,  518,  518,  518,  520,  520,  520,

			  522,  522,  522,  524,  524,  524,  526,  526,  526, yy_Dummy>>,
			1, 109, 1456)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 529)
			yy_base_template_1 (an_array)
			yy_base_template_2 (an_array)
			yy_base_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_base_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,   45, 1321,   77, 1317,   56, 1310,   58,    0,
			   60, 1309, 1565,   63, 1285, 1565, 1565, 1565, 1565, 1565,
			 1565, 1565, 1274,    0, 1565,   62, 1565, 1565, 1565, 1565,
			   78,   72,   74,   58,   91,   97,   93, 1233, 1565, 1565,
			    0, 1266,  106,  100,  108,  102,  119,  124,  133,  135,
			  137,    0, 1565, 1264, 1237, 1234, 1239, 1565, 1258, 1565,
			  149, 1253, 1249, 1565,  151, 1245, 1233,  161, 1565,   61,
			  139, 1219,  187,    0,  152,  158,  163,  169,  196,  166,
			  202,  199,  205, 1161,  253,  211,  229,  236,  262,  268,
			  270,  277,  288,  294,  304,  307,    0, 1187, 1156, 1149,

			   91, 1176, 1171,  182, 1565, 1146, 1131,  200, 1565, 1129,
			 1565,  224,  281, 1111,  154,  221,  226,  238, 1087,  314,
			  320,  323,  332,  335,  341, 1063, 1065,  350,  352,  361,
			  364,  374,  382,  392,  394,  400,  408,  414,  422,  428,
			 1058, 1031,  134,  263,  243,  283,  326,  370,  430,    0,
			  436,  439,  452,  460,  454,   94, 1038,  468,  470,  481,
			  487,  490,  496,  499,  505,  512,  518,  529,  535,  548,
			 1027,  996,  989,  987,  268,  347,  385,  555,    0,  561,
			  571,  577,  579,  585, 1002, 1565,  997,  591,  594,  597,
			  606,  612,  627,  630,  633,  636,  656,  649,  659,  669, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  993,  255,  970,  283,  337,  367,  411,  989,  671,  677,
			  680,  686,  688,  987,  698,  705,  714,  716,  725,  728,
			  731,  738,  740,  560, 1565,  749,  751,  759,  981,  953,
			  963,  946,  275,  443,  446,    0,  769,  771,  782,  785,
			  791,  968,  802,  804,  811,  813,  820,  823,  834,  837,
			  848,  850,  856,  858,  966,  339,  941,  379,  934,  458,
			  515,  949,  871,  874,  880,  882,  890,  942,  892,  900,
			  902,  916,  922,  924,  940,  943,  946,  952,  964,  958,
			  926,  896,  886,  884,  381,  489,  527,    0,  970,  973,
			  983,  985,  994,  904, 1000, 1012, 1009, 1015, 1018, 1034,

			  618, 1565,  717, 1565, 1028, 1041, 1040, 1044, 1047,  896,
			  863,  844,  852,  846,  507,  541,  819,    0, 1050, 1056,
			 1059,  860, 1069, 1085, 1078, 1090, 1084, 1096, 1565, 1096,
			 1116, 1098, 1109,  854,  818,  440, 1121,  819,  531,  563,
			  566,  835, 1118, 1124,  833, 1142, 1130, 1139, 1158, 1565,
			 1163, 1156, 1168, 1565, 1165, 1181,  831, 1184,  808,  804,
			 1565, 1193,  624, 1188,    0,  815, 1203, 1565, 1196, 1199,
			 1215, 1565, 1208, 1211, 1227, 1565,  795, 1565,  767,  414,
			 1565,  652,   41,  618,  696,  780, 1220, 1226, 1232, 1238,
			  778,  751,  745,  692,  715,  711, 1247,    0,  675,  700, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1254, 1260, 1262, 1270,  679,  453,  387,  720,  634,  672,
			  719,  761,  861,  667, 1280, 1283, 1286, 1292,  663,  631,
			  595,  744,  555,  905, 1303, 1310,  583, 1315, 1295, 1318,
			 1334,  573,  552,  535,  767,  509,  933,  186, 1069,  537,
			 1328, 1331, 1342, 1238, 1565,  525,  494,  520,  784,  469,
			  449, 1352,  477, 1359, 1361, 1368,  474,  419,  384,  806,
			  339,  372, 1124,  363, 1374, 1380, 1387,  343,  301,  303,
			  808,  268, 1142, 1386, 1406, 1411, 1404, 1423, 1427, 1439,
			  564, 1442,  231, 1176, 1445,  650, 1448, 1565, 1444, 1456,
			 1460, 1565, 1565,  195, 1463, 1565, 1458,  173, 1470, 1474,

			 1477, 1565, 1565, 1565, 1486, 1494, 1499, 1504, 1509, 1481,
			 1513, 1516, 1521, 1526, 1531, 1536, 1541, 1545, 1548,  156,
			 1551, 1210, 1554, 1222, 1557,  118, 1560, 1276, 1297, 1348, yy_Dummy>>,
			1, 130, 400)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 529)
			yy_def_template_1 (an_array)
			yy_def_template_2 (an_array)
			yy_def_template_3 (an_array)
			an_array.area.fill_with (503, 504, 529)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
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
			  510,  510,  510,  510,  510,  510,  510,  510,  510,  510, yy_Dummy>>,
			1, 200, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
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
			  511,  511,  511,  514,  509,  509,  509,  529,  503,   84, yy_Dummy>>,
			1, 200, 200)
		end

	yy_def_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
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

			  503,  503,  503,    0, yy_Dummy>>,
			1, 104, 400)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 257)
			yy_ec_template_1 (an_array)
			an_array.area.fill_with (55, 123, 257)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    0,   55,   55,   55,   55,   55,   55,   55,   55,    1,
			    2,   55,   55,    3,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,    1,    4,   55,   55,    5,   55,   55,   55,
			    6,    7,    8,    9,   10,   11,   12,   13,   14,   15,
			   14,   14,   14,   14,   14,   14,   14,   14,   16,   17,
			   55,   18,   55,   19,   55,   20,   21,   22,   23,   24,
			   25,   26,   27,   28,   29,   29,   30,   31,   32,   33,
			   34,   29,   35,   36,   37,   38,   39,   29,   29,   40,
			   41,   42,   55,   43,   44,   45,   55,   46,   21,   47,

			   48,   24,   25,   26,   49,   50,   29,   29,   51,   31,
			   32,   33,   52,   29,   53,   36,   37,   38,   54,   29,
			   29,   40,   41, yy_Dummy>>,
			1, 123, 0)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    5,    1,    5,    5,    5,    5,    5,    5,    5,
			    5,    2,    2,    5,    3,    3,    5,    5,    5,    5,
			    4,    4,    4,    4,    4,    4,    4,    4,    4,    4,
			    4,    4,    4,    4,    4,    4,    4,    4,    4,    4,
			    4,    4,    5,    5,    5,    3,    4,    4,    4,    4,
			    4,    4,    4,    4,    4,    5, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 503)
			yy_accept_template_1 (an_array)
			yy_accept_template_2 (an_array)
			yy_accept_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_accept_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
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
			   63,   63,   63,   63,   63,   63,   63,   63,   63,   63, yy_Dummy>>,
			1, 200, 0)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
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
			   52,   52,   52,    0,   64,   64,   62,    0,    0,    4, yy_Dummy>>,
			1, 200, 200)
		end

	yy_accept_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
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

			    0,   40,   50,    0, yy_Dummy>>,
			1, 104, 400)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 1565
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 503
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 504
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 55
			-- Equivalence code for NULL character

	yyMax_symbol_equiv_class: INTEGER = 256
			-- All symbols greater than this symbol will have
			-- the same equivalence class as this symbol

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
