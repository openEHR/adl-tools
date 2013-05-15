note
	component:   "openEHR Archetype Project"
	description: "Scanner for ADL syntax items"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Mozilla tri-license"

class ADL_SCANNER

inherit
	--ANY_VALIDATOR
	--	rename
	--		reset as validator_reset
	--	end

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton,
			output as print_out
		end

	ADL_TOKENS
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
			Result := (INITIAL <= sc and sc <= IN_ASSERTION_SECTION)
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
if yy_act <= 29 then
if yy_act <= 15 then
if yy_act <= 8 then
if yy_act <= 4 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 63 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 63")
end
-- Ignore separators
else
--|#line 64 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 64")
end
in_lineno := in_lineno + text_count
end
else
if yy_act = 3 then
--|#line 69 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 69")
end
-- Ignore comments
else
--|#line 70 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 70")
end
in_lineno := in_lineno + 1
end
end
else
if yy_act <= 6 then
if yy_act = 5 then
--|#line 74 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 74")
end
last_token := Minus_code
else
--|#line 75 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 75")
end
last_token := Plus_code
end
else
if yy_act = 7 then
--|#line 76 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 76")
end
last_token := Star_code
else
--|#line 77 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 77")
end
last_token := Slash_code
end
end
end
else
if yy_act <= 12 then
if yy_act <= 10 then
if yy_act = 9 then
--|#line 78 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 78")
end
last_token := Caret_code
else
--|#line 79 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 79")
end
last_token := Equal_code
end
else
if yy_act = 11 then
--|#line 80 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 80")
end
last_token := Dot_code
else
--|#line 81 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 81")
end
last_token := Semicolon_code
end
end
else
if yy_act <= 14 then
if yy_act = 13 then
--|#line 82 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 82")
end
last_token := Comma_code
else
--|#line 83 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 83")
end
last_token := Colon_code
end
else
--|#line 84 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 84")
end
last_token := Exclamation_code
end
end
end
else
if yy_act <= 22 then
if yy_act <= 19 then
if yy_act <= 17 then
if yy_act = 16 then
--|#line 85 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 85")
end
last_token := Left_parenthesis_code
else
--|#line 86 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 86")
end
last_token := Right_parenthesis_code
end
else
if yy_act = 18 then
--|#line 87 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 87")
end
last_token := Dollar_code
else
--|#line 88 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 88")
end
last_token := Question_mark_code
end
end
else
if yy_act <= 21 then
if yy_act = 20 then
--|#line 90 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 90")
end
last_token := Left_bracket_code
else
--|#line 91 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 91")
end
last_token := Right_bracket_code
end
else
--|#line 95 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 95")
end

				last_token := SYM_ARCHETYPE
			
end
end
else
if yy_act <= 26 then
if yy_act <= 24 then
if yy_act = 23 then
--|#line 99 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 99")
end

				last_token := SYM_TEMPLATE_OVERLAY
			
else
--|#line 103 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 103")
end

				last_token := SYM_TEMPLATE
			
end
else
if yy_act = 25 then
--|#line 107 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 107")
end

				last_token := SYM_OPERATIONAL_TEMPLATE
			
else
--|#line 111 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 111")
end

				last_token := SYM_ADL_VERSION
			
end
end
else
if yy_act <= 28 then
if yy_act = 27 then
--|#line 115 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 115")
end

				last_token := SYM_IS_CONTROLLED
			
else
--|#line 119 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 119")
end

				last_token := SYM_IS_GENERATED
			
end
else
--|#line 123 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 123")
end

				last_token := SYM_UID
			
end
end
end
end
else
if yy_act <= 43 then
if yy_act <= 36 then
if yy_act <= 33 then
if yy_act <= 31 then
if yy_act = 30 then
--|#line 127 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 127")
end

				last_token := SYM_SPECIALIZE
				in_lineno := in_lineno + 1
			
else
--|#line 133 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 133")
end

				last_token := SYM_CONCEPT
				in_lineno := in_lineno + 1
			
end
else
if yy_act = 32 then
--|#line 138 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 138")
end

				last_token := SYM_LANGUAGE
				set_start_condition(IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				language_text_start_line := in_lineno
			
else
--|#line 145 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 145")
end

				last_token := SYM_DESCRIPTION
				set_start_condition(IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				description_text_start_line := in_lineno
			
end
end
else
if yy_act <= 35 then
if yy_act = 34 then
--|#line 152 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 152")
end

				last_token := SYM_DEFINITION
				set_start_condition(IN_CADL_SECTION)
				in_lineno := in_lineno + 1
				definition_text_start_line := in_lineno
			
else
--|#line 159 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 159")
end

				last_token := SYM_INVARIANT
				set_start_condition(IN_ASSERTION_SECTION)
				in_lineno := in_lineno + 1
				invariant_text_start_line := in_lineno
			
end
else
--|#line 166 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 166")
end

				last_token := SYM_ONTOLOGY
				set_start_condition(IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				ontology_text_start_line := in_lineno
			
end
end
else
if yy_act <= 40 then
if yy_act <= 38 then
if yy_act = 37 then
--|#line 173 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 173")
end

				last_token := SYM_ANNOTATIONS
				set_start_condition(IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				annotations_text_start_line := in_lineno
			
else
--|#line 180 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 180")
end

				last_token := SYM_COMPONENT_ONTOLOGIES
				set_start_condition(IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				comp_onts_text_start_line := in_lineno
			
end
else
if yy_act = 39 then
--|#line 188 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 188")
end
 -- line starting with "definition" or "description" or "annotations"
				-- unread the pattern just matched
				a_text := text
				from i := text_count until i < 1 loop
					unread_character (a_text.item (i))
					i := i - 1
				end

				-- get the dADL section sorted out
				last_token := V_ODIN_TEXT
				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_

				set_start_condition(INITIAL)
			
else
--|#line 189 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 189")
end
 -- line starting with "definition" or "description" or "annotations"
				-- unread the pattern just matched
				a_text := text
				from i := text_count until i < 1 loop
					unread_character (a_text.item (i))
					i := i - 1
				end

				-- get the dADL section sorted out
				last_token := V_ODIN_TEXT
				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_

				set_start_condition(INITIAL)
			
end
end
else
if yy_act <= 42 then
if yy_act = 41 then
--|#line 190 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 190")
end
 -- line starting with "definition" or "description" or "annotations"
				-- unread the pattern just matched
				a_text := text
				from i := text_count until i < 1 loop
					unread_character (a_text.item (i))
					i := i - 1
				end

				-- get the dADL section sorted out
				last_token := V_ODIN_TEXT
				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_

				set_start_condition(INITIAL)
			
else
--|#line 191 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 191")
end
 -- line starting with "definition" or "description" or "annotations"
				-- unread the pattern just matched
				a_text := text
				from i := text_count until i < 1 loop
					unread_character (a_text.item (i))
					i := i - 1
				end

				-- get the dADL section sorted out
				last_token := V_ODIN_TEXT
				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_

				set_start_condition(INITIAL)
			
end
else
--|#line 208 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 208")
end
 -- LF
				in_buffer.append_character('%N')
				in_lineno := in_lineno + 1
			
end
end
end
else
if yy_act <= 50 then
if yy_act <= 47 then
if yy_act <= 45 then
if yy_act = 44 then
--|#line 212 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 212")
end
 -- any text on line with no LF
				in_buffer.append_string(text)
			
else
--|#line 227 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 227")
end

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
end
else
if yy_act = 46 then
--|#line 231 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 231")
end
in_lineno := in_lineno + text_count
else
--|#line 233 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 233")
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
if yy_act <= 49 then
if yy_act = 48 then
--|#line 245 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 245")
end
			-- match TAB whitsepace <anything> \n
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
else
--|#line 250 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 250")
end
in_lineno := in_lineno + text_count
end
else
--|#line 252 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 252")
end
 -- non-white space at start
				unread_character(text.item(1))
				last_token := V_ASSERTION_TEXT
				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_
				set_start_condition(INITIAL)
	
end
end
else
if yy_act <= 54 then
if yy_act <= 52 then
if yy_act = 51 then
--|#line 264 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 264")
end

					last_token := V_DOTTED_NUMERIC
					last_string_value := text_substring (1, text_count)
			
else
--|#line 270 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 270")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 53 then
--|#line 276 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 276")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
else
--|#line 282 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 282")
end

					last_token := V_IDENTIFIER
					last_string_value := text
			
end
end
else
if yy_act <= 56 then
if yy_act = 55 then
--|#line 288 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 288")
end

					last_token := V_VALUE
					last_string_value := text
			
else
--|#line 295 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 295")
end
-- ignore unmatched chars
end
else
--|#line 0 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 0")
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
--|#line 0 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 0")
end
terminate
when 1 then
--|#line 0 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 0")
end

				-- get the dADL section sorted out
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
		once
			Result := yy_fixed_array (<<
			    0,   10,   11,   12,   11,   13,   14,   15,   16,   17,
			   18,   19,   20,   21,   22,   23,   24,   25,   26,   27,
			   28,   29,   30,   29,   29,   29,   31,   29,   29,   29,
			   29,   29,   29,   29,   29,   29,   29,   32,   29,   29,
			   29,   33,   34,   35,   36,   28,   30,   29,   29,   37,
			   46,   38,   39,   53,   54,   57,   58,   40,   41,  324,
			   59,   42,   59,  116,   43,   44,   63,   47,   64,   48,
			   49,   62,   62,  117,   37,   38,   44,   62,   62,   62,
			   62,  321,   66,   62,   62,   62,   62,   62,   62,  158,
			   62,   62,   47,   48,  318,   68,   62,   62,   66,   67,

			  158,   69,   62,   62,   62,   62,   71,  311,   74,   72,
			   73,  315,   76,   62,   62,   62,   62,   62,   62,   87,
			   88,   75,   91,   92,   59,   63,   59,   64,  139,   80,
			   96,   62,   77,   94,   78,   94,   79,   76,   93,   93,
			   94,   93,   93,   93,   93,   93,   93,   93,   93,   96,
			   62,   93,  139,   93,   93,   93,   93,   96,   62,   96,
			   62,  311,   96,   62,  101,  101,   97,   96,   62,  118,
			  100,   95,   96,   62,   96,   62,   98,  310,   93,   93,
			   93,   99,  103,  305,   96,   62,  102,   96,   62,   96,
			   62,  301,  104,  105,   96,   62,  300,  106,   96,   62,

			   96,   62,   96,   62,   87,   88,  103,  107,  109,  123,
			  111,  123,  112,  108,   91,   92,   62,   62,  110,  291,
			  113,   96,   62,  108,   96,   62,   96,   62,  198,  110,
			   96,   62,   96,   62,   96,   62,   96,   62,  122,  198,
			   96,   62,  289,  121,   96,   62,   96,   62,  178,  125,
			  127,  280,  124,  120,   96,   62,  129,  126,  278,  121,
			  128,  276,  130,   96,   62,   96,   62,   96,   62,   96,
			   62,   96,   62,  178,  127,  141,   62,  131,  275,  134,
			  129,   96,   62,   96,   62,  132,  123,  130,  123,  133,
			   96,   62,  135,  261,   96,   62,   96,   62,  260,   96,

			   62,   96,   62,  134,  118,  144,  140,  142,  147,   96,
			   62,   96,   62,  149,  143,  145,  259,  142,  146,  148,
			   96,   62,   96,   62,  258,  143,   96,   62,  150,  146,
			   96,   62,  244,  151,   96,   62,   96,   62,  155,   96,
			   62,  200,  152,  154,  243,   62,   62,  153,   62,  241,
			  156,  163,  200,  157,   96,   62,   96,   62,   96,   62,
			   96,   62,  222,  155,  165,  221,  166,   96,   62,   96,
			   62,   96,   62,  222,   96,   62,  164,   62,   96,   62,
			   96,   62,  173,  296,  167,  291,  168,  170,  242,  165,
			  169,  166,   96,   62,  171,  167,  172,   96,   62,  242,

			   96,   62,   96,   62,   62,   62,  220,  173,  176,  306,
			  177,  301,  174,  219,   96,   62,  201,   96,   62,   96,
			   62,  175,   96,   62,   96,   62,   96,   62,   96,   62,
			   62,  202,  175,  176,  199,  177,  183,  184,  188,  181,
			   96,   62,  295,  185,   96,   62,  186,   96,   62,   96,
			   62,  187,  189,  295,  185,  192,  180,  186,   96,   62,
			   96,   62,  179,  189,  190,  191,   96,   62,   96,   62,
			   96,   62,  193,  197,  194,  190,  161,   96,   62,  160,
			  192,  159,  195,  140,  197,  196,   96,   62,   96,   62,
			   96,   62,  138,  203,  204,   96,   62,  137,  205,  209,

			  210,  209,   96,   62,  206,   96,   62,   96,   62,   96,
			   62,  207,   96,   62,  208,   96,   62,  136,  211,   96,
			   62,   96,   62,   94,  214,   92,  213,   62,   62,  212,
			   62,   96,   62,   96,   62,   96,   62,  217,   89,  216,
			  212,   88,  215,  218,   96,   62,   96,   62,   85,  224,
			   96,   62,  225,   96,   62,  226,  209,  210,  209,   62,
			   96,   62,  228,   96,   62,  115,  227,   96,   62,   96,
			   62,  233,  234,  233,  235,  236,  235,  229,  114,  231,
			  230,   96,   62,   95,   96,   62,   96,   62,  229,   62,
			   62,  232,  238,  239,  239,  239,   60,  238,   96,   62,

			   96,   62,  232,   96,   62,  237,   96,   62,   96,   62,
			   96,   62,  247,  249,  249,  249,   96,   62,  246,   96,
			   62,   96,   62,   96,   62,   96,   62,  248,   89,  253,
			  254,  253,  233,  234,  233,  240,  252,  256,  251,   96,
			   62,  257,  250,  235,  236,  235,   96,   62,  239,  239,
			  239,  262,  263,   89,  255,   96,   62,   96,   62,   96,
			   62,  249,  249,  249,   96,   62,   96,   62,  265,   85,
			  268,  269,  268,   85,  264,  253,  254,  253,   84,  255,
			   96,   62,  266,   83,  267,  270,   96,   62,  272,  273,
			  272,   96,   62,  260,  277,  260,   62,   62,   96,   62,

			   96,   62,   82,  271,   96,   62,   96,   62,  281,  282,
			  281,  268,  269,  268,   96,   62,   70,  274,   96,   62,
			  284,  285,  284,   96,   62,  283,   61,  274,  262,  263,
			   96,   62,  272,  273,  272,  287,  275,  288,  275,  278,
			  290,  278,  281,  282,  281,   60,  286,   96,   62,  284,
			  285,  284,   96,   62,  329,   96,   62,   55,   96,   62,
			   96,   62,   96,   62,   96,   62,   96,   62,   96,   62,
			   51,  292,  298,   96,   62,   46,  293,  294,  297,  299,
			  329,  302,  292,  329,  303,   96,   62,  293,  307,   96,
			   62,   96,   62,  304,  308,   96,   62,  314,  314,  314,

			  329,   96,   62,   96,   62,  312,  329,   96,   62,   96,
			   62,  317,  313,  314,  314,  314,  309,  316,  304,   96,
			   62,  319,   96,   62,  329,   96,   62,  329,  325,  326,
			  325,  327,  327,  327,  329,  329,  317,  323,   96,   62,
			  329,   96,   62,  320,  329,  322,  324,  328,  324,  325,
			  326,  325,  329,  329,  320,  327,  327,  327,   45,   45,
			   45,   45,   45,   45,   50,   50,   50,   50,   50,   50,
			   52,   52,   52,   52,   52,   52,   56,   56,   56,   56,
			   56,   56,   62,   62,   62,   62,   65,   65,   65,   65,
			   81,  329,   81,   81,   81,   81,   86,   86,   86,   86,

			   86,   86,   90,   90,   90,   90,   90,   90,   61,   61,
			   61,   61,   61,   61,   93,   93,   93,   93,   93,   93,
			  119,  119,  119,  119,  162,  162,  162,  162,  182,  182,
			  182,  182,  223,  223,  223,  223,  245,  245,  245,  245,
			  279,  279,  279,  279,    9,  329,  329,  329,  329,  329,
			  329,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			  329,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			  329,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			  329,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			  329,  329,  329, yy_Dummy>>)
		end

	yy_chk_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    4,    2,    2,    6,    6,    8,    8,    2,    2,  321,
			   11,    2,   11,   84,    2,    2,   23,    4,   23,    4,
			    4,   28,   28,   84,    2,    2,    2,   29,   29,   30,
			   30,  318,   28,   31,   31,   32,   32,   37,   37,  136,
			   38,   38,    4,    4,  315,   31,   39,   39,   37,   30,

			  136,   32,   40,   40,   41,   41,   37,  311,   39,   37,
			   38,  310,   41,   42,   42,   43,   43,   44,   44,   53,
			   53,   40,   57,   57,   59,   64,   59,   64,  117,   44,
			   65,   65,   42,   94,   42,   94,   43,   41,   61,   61,
			   61,   61,   61,   61,   61,   61,   61,   61,   61,   66,
			   66,   61,  117,   61,   61,   61,   61,   67,   67,   69,
			   69,  306,   68,   68,   70,   70,   66,   71,   71,   95,
			   69,   95,   72,   72,   73,   73,   67,  305,   61,   61,
			   61,   68,   72,  300,   74,   74,   71,   75,   75,   76,
			   76,  296,   73,   73,   77,   77,  295,   74,   78,   78,

			   79,   79,   80,   80,   87,   87,   72,   74,   76,  101,
			   78,  101,   79,   75,   91,   91,   96,   96,   77,  280,
			   80,   97,   97,   75,   98,   98,   99,   99,  178,   77,
			  100,  100,  102,  102,  103,  103,  104,  104,   99,  178,
			  105,  105,  276,   98,  106,  106,  107,  107,  158,  103,
			  105,  263,  102,   97,  108,  108,  107,  104,  261,  105,
			  106,  259,  108,  109,  109,  110,  110,  111,  111,  112,
			  112,  113,  113,  158,  105,  119,  119,  109,  258,  112,
			  107,  120,  120,  122,  122,  110,  123,  108,  123,  111,
			  121,  121,  113,  244,  124,  124,  125,  125,  243,  126,

			  126,  127,  127,  112,  140,  122,  140,  120,  125,  128,
			  128,  129,  129,  127,  121,  123,  242,  120,  124,  126,
			  130,  130,  131,  131,  241,  121,  132,  132,  128,  124,
			  133,  133,  222,  129,  134,  134,  135,  135,  133,  142,
			  142,  180,  130,  132,  221,  141,  141,  131,  141,  219,
			  134,  142,  180,  135,  143,  143,  144,  144,  146,  146,
			  147,  147,  201,  133,  144,  200,  146,  148,  148,  149,
			  149,  150,  150,  201,  153,  153,  143,  141,  151,  151,
			  152,  152,  153,  291,  147,  291,  148,  150,  220,  144,
			  149,  146,  154,  154,  151,  147,  152,  155,  155,  220,

			  156,  156,  157,  157,  162,  162,  199,  153,  156,  301,
			  157,  301,  154,  198,  163,  163,  181,  164,  164,  165,
			  165,  155,  166,  166,  167,  167,  168,  168,  169,  169,
			  182,  182,  155,  156,  179,  157,  163,  164,  168,  161,
			  170,  170,  289,  165,  171,  171,  166,  172,  172,  177,
			  177,  167,  169,  289,  165,  172,  160,  166,  173,  173,
			  174,  174,  159,  169,  170,  171,  175,  175,  176,  176,
			  183,  183,  173,  177,  174,  170,  139,  184,  184,  138,
			  172,  137,  175,  118,  177,  176,  185,  185,  186,  186,
			  187,  187,  116,  183,  184,  188,  188,  115,  185,  189,

			  189,  189,  190,  190,  186,  191,  191,  192,  192,  189,
			  189,  187,  193,  193,  188,  194,  194,  114,  190,  195,
			  195,  196,  196,   93,  193,   90,  192,  202,  202,  191,
			  202,  197,  197,  203,  203,  204,  204,  196,   89,  195,
			  191,   86,  194,  197,  205,  205,  206,  206,   85,  203,
			  207,  207,  204,  208,  208,  205,  209,  209,  209,  202,
			  211,  211,  207,  212,  212,   83,  206,  213,  213,  217,
			  217,  214,  214,  214,  215,  215,  215,  208,   82,  212,
			  211,  214,  214,   63,  215,  215,  216,  216,  208,  223,
			  223,  213,  217,  218,  218,  218,   60,  217,  224,  224,

			  225,  225,  213,  218,  218,  216,  226,  226,  227,  227,
			  229,  229,  225,  228,  228,  228,  231,  231,  224,  230,
			  230,  240,  240,  228,  228,  238,  238,  227,   58,  232,
			  232,  232,  233,  233,  233,  218,  231,  238,  230,  232,
			  232,  240,  229,  235,  235,  235,  237,  237,  239,  239,
			  239,  245,  245,   55,  237,  246,  246,  247,  247,  248,
			  248,  249,  249,  249,  250,  250,  252,  252,  247,   54,
			  251,  251,  251,   51,  246,  253,  253,  253,   49,  237,
			  251,  251,  248,   48,  250,  252,  255,  255,  256,  256,
			  256,  257,  257,  260,  260,  260,  262,  262,  256,  256,

			  264,  264,   47,  255,  265,  265,  267,  267,  266,  266,
			  266,  268,  268,  268,  271,  271,   33,  257,  266,  266,
			  270,  270,  270,  274,  274,  267,   20,  257,  279,  279,
			  270,  270,  272,  272,  272,  274,  275,  275,  275,  278,
			  278,  278,  281,  281,  281,   12,  271,  283,  283,  284,
			  284,  284,  286,  286,    9,  287,  287,    7,  292,  292,
			  293,  293,  294,  294,  297,  297,  298,  298,  302,  302,
			    5,  283,  293,  303,  303,    3,  286,  287,  292,  294,
			    0,  297,  283,    0,  298,  299,  299,  286,  302,  304,
			  304,  307,  307,  299,  303,  308,  308,  309,  309,  309,

			    0,  312,  312,  313,  313,  307,    0,  309,  309,  316,
			  316,  313,  308,  314,  314,  314,  304,  312,  299,  317,
			  317,  316,  319,  319,    0,  320,  320,    0,  322,  322,
			  322,  323,  323,  323,    0,    0,  313,  320,  322,  322,
			    0,  323,  323,  317,    0,  319,  324,  324,  324,  325,
			  325,  325,    0,    0,  317,  327,  327,  327,  330,  330,
			  330,  330,  330,  330,  331,  331,  331,  331,  331,  331,
			  332,  332,  332,  332,  332,  332,  333,  333,  333,  333,
			  333,  333,  334,  334,  334,  334,  335,  335,  335,  335,
			  336,    0,  336,  336,  336,  336,  337,  337,  337,  337,

			  337,  337,  338,  338,  338,  338,  338,  338,  339,  339,
			  339,  339,  339,  339,  340,  340,  340,  340,  340,  340,
			  341,  341,  341,  341,  342,  342,  342,  342,  343,  343,
			  343,  343,  344,  344,  344,  344,  345,  345,  345,  345,
			  346,  346,  346,  346,  329,  329,  329,  329,  329,  329,
			  329,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			  329,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			  329,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			  329,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			  329,  329,  329, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,   29,  772,   47,  767,   51,  754,   53,  754,
			  944,   58,  742,  944,  944,  944,  944,  944,  944,  944,
			  714,    0,  944,   53,  944,  944,  944,  944,   59,   65,
			   67,   71,   73,  671,  944,  944,    0,   75,   78,   84,
			   90,   92,  101,  103,  105,    0,  944,  671,  651,  654,
			  944,  670,  944,  117,  666,  650,  944,  120,  625,  122,
			  593,  137,    0,  568,  112,  118,  137,  145,  150,  147,
			  118,  155,  160,  162,  172,  175,  177,  182,  186,  188,
			  190,    0,  547,  535,   38,  545,  538,  202,  944,  535,
			  522,  212,  944,  520,  131,  156,  204,  209,  212,  214,

			  218,  196,  220,  222,  224,  228,  232,  234,  242,  251,
			  253,  255,  257,  259,  485,  464,  464,  106,  468,  263,
			  269,  278,  271,  273,  282,  284,  287,  289,  297,  299,
			  308,  310,  314,  318,  322,  324,   53,  449,  448,  442,
			  291,  333,  327,  342,  344,  944,  346,  348,  355,  357,
			  359,  366,  368,  362,  380,  385,  388,  390,  228,  431,
			  428,  411,  392,  402,  405,  407,  410,  412,  414,  416,
			  428,  432,  435,  446,  448,  454,  456,  437,  192,  410,
			  305,  383,  418,  458,  465,  474,  476,  478,  483,  497,
			  490,  493,  495,  500,  503,  507,  509,  519,  385,  375,

			  337,  326,  515,  521,  523,  532,  534,  538,  541,  554,
			  944,  548,  551,  555,  569,  572,  574,  557,  591,  317,
			  352,  312,  304,  577,  586,  588,  594,  596,  611,  598,
			  607,  604,  627,  630,  944,  641,  944,  634,  613,  646,
			  609,  293,  272,  267,  261,  639,  643,  645,  647,  659,
			  652,  668,  654,  673,  944,  674,  686,  679,  243,  229,
			  691,  227,  684,  203,  688,  692,  706,  694,  709,  944,
			  718,  702,  730,  944,  711,  734,  211,  944,  737,  716,
			  204,  740,  944,  735,  747,  944,  740,  743,  944,  406,
			  944,  370,  746,  748,  750,  164,  176,  752,  754,  773,

			  154,  396,  756,  761,  777,  145,  146,  779,  783,  795,
			   85,   92,  789,  791,  811,   66,  797,  807,   57,  810,
			  813,   24,  826,  829,  844,  847,  944,  853,  944,  944,
			  857,  863,  869,  875,  879,  883,  889,  895,  901,  907,
			  913,  917,  921,  925,  929,  933,  937, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,  329,    1,  330,  330,  331,  332,  331,  333,  329,
			  329,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			  334,  334,  329,  334,  329,  329,  329,  329,  335,  335,
			  335,  335,  335,  329,  329,  329,  334,  335,  335,  335,
			  335,  335,  335,  335,  335,  336,  329,  336,  336,  336,
			  329,  329,  329,  337,  329,  329,  329,  338,  329,  329,
			  329,  339,  334,  334,  334,  335,  335,  335,  335,  335,
			  329,  335,  335,  335,  335,  335,  335,  335,  335,  335,
			  335,  336,  336,  336,  336,  329,  337,  337,  329,  329,
			  338,  338,  329,  340,  329,  334,  341,  335,  335,  335,

			  335,  329,  335,  335,  335,  335,  335,  335,  335,  335,
			  335,  335,  335,  335,  336,  336,  336,  336,  334,  341,
			  335,  335,  335,  329,  335,  335,  335,  335,  335,  335,
			  335,  335,  335,  335,  335,  335,  336,  336,  336,  336,
			  334,  342,  335,  335,  335,  329,  335,  335,  335,  335,
			  335,  335,  335,  335,  335,  335,  335,  335,  336,  336,
			  336,  336,  343,  335,  335,  335,  335,  335,  335,  335,
			  335,  335,  335,  335,  335,  335,  335,  335,  336,  336,
			  336,  336,  343,  335,  335,  335,  335,  335,  335,  335,
			  335,  335,  335,  335,  335,  335,  335,  335,  336,  336,

			  336,  336,  344,  335,  335,  335,  335,  335,  335,  329,
			  329,  335,  335,  335,  335,  335,  335,  335,  335,  336,
			  336,  336,  336,  345,  335,  335,  335,  335,  335,  335,
			  335,  335,  335,  329,  329,  329,  329,  335,  335,  329,
			  335,  336,  336,  336,  336,  345,  335,  335,  335,  329,
			  335,  335,  335,  329,  329,  335,  335,  335,  336,  336,
			  336,  336,  346,  334,  335,  335,  335,  335,  329,  329,
			  335,  335,  329,  329,  335,  336,  336,  329,  336,  346,
			  334,  329,  329,  335,  329,  329,  335,  335,  329,  336,
			  329,  334,  335,  335,  335,  336,  334,  335,  335,  335,

			  336,  334,  335,  335,  335,  336,  334,  335,  335,  335,
			  336,  334,  335,  335,  329,  336,  335,  335,  336,  335,
			  335,  336,  335,  335,  336,  329,  329,  329,  329,    0,
			  329,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			  329,  329,  329,  329,  329,  329,  329, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER]
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
			   31,   32,   33,   21,   34,   35,   47,   37,   48,   21,
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
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    2,    1,    1,    1,    1,    1,    1,
			    1,    1,    3,    4,    1,    5,    1,    1,    1,    1,
			    3,    3,    3,    3,    3,    3,    3,    3,    3,    3,
			    3,    3,    3,    3,    3,    3,    3,    3,    3,    3,
			    6,    1,    1,    1,    3,    3,    3,    3,    3, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   58,
			   56,    1,    2,   15,   18,   16,   17,    7,    6,   13,
			    5,   11,    8,   55,   14,   12,   10,   19,   55,   55,
			   55,   55,   55,   20,   21,    9,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   44,   43,   44,   44,   44,
			   57,   46,   47,   57,   46,   49,   50,   57,   49,    1,
			    2,    3,   55,   55,   55,   54,   54,   54,   54,   54,
			    0,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   44,   44,   44,   44,   46,    0,    0,   45,   49,
			    0,    0,   48,    3,    4,   51,   55,   54,   54,   54,

			   29,    0,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   44,   44,   44,   44,   55,   55,
			   54,   54,   54,    0,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   44,   44,   44,   44,
			   51,   55,   54,   54,   54,   52,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   44,   44,
			   44,   44,   55,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   44,   44,
			   44,   44,   55,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   44,   44,

			   44,   44,   55,   54,   54,   54,   54,   54,   54,    0,
			   31,   54,   54,   54,   54,   54,   54,   54,   54,   44,
			   44,   44,   44,   55,   54,   54,   28,   54,   54,   54,
			   54,   54,   54,    0,   32,    0,   36,   54,   54,   24,
			   54,   44,   44,   44,   44,   55,   54,   54,   54,   22,
			   54,   54,   54,    0,   35,   54,   54,   54,   44,   44,
			   44,   44,   55,   55,   26,   27,   54,   54,    0,   34,
			   54,   54,    0,   30,   54,   44,   44,   40,   44,   55,
			   55,    0,   37,   54,    0,   33,   54,   54,   41,   44,
			   39,   53,   54,   54,   54,   44,   55,   54,   54,   54,

			   44,   53,   54,   54,   54,   44,   55,   54,   54,   54,
			   44,   53,   54,   54,   23,   44,   54,   54,   44,   54,
			   54,   44,   54,   54,   44,    0,   38,   25,   42,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 944
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 329
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 330
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

	yyNb_rules: INTEGER = 57
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 58
			-- End of buffer rule code

	yyLine_used: BOOLEAN = false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN = false
			-- Is `position' used?

	INITIAL: INTEGER = 0
	IN_ODIN_SECTION: INTEGER = 1
	IN_CADL_SECTION: INTEGER = 2
	IN_ASSERTION_SECTION: INTEGER = 3
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

	invariant_text_start_line: INTEGER

	ontology_text_start_line: INTEGER

	annotations_text_start_line: INTEGER

	comp_onts_text_start_line: INTEGER

feature {NONE} -- Constants

	Init_buffer_size: INTEGER = 256
				-- Initial size for `in_buffer'

invariant
	in_buffer_not_void: in_buffer /= Void

end
