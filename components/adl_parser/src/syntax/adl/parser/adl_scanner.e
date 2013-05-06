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
--|#line 59 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 59")
end
-- Ignore separators
else
--|#line 60 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 60")
end
in_lineno := in_lineno + text_count
end
else
if yy_act = 3 then
--|#line 65 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 65")
end
-- Ignore comments
else
--|#line 66 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 66")
end
in_lineno := in_lineno + 1
end
end
else
if yy_act <= 6 then
if yy_act = 5 then
--|#line 70 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 70")
end
last_token := Minus_code
else
--|#line 71 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 71")
end
last_token := Plus_code
end
else
if yy_act = 7 then
--|#line 72 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 72")
end
last_token := Star_code
else
--|#line 73 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 73")
end
last_token := Slash_code
end
end
end
else
if yy_act <= 12 then
if yy_act <= 10 then
if yy_act = 9 then
--|#line 74 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 74")
end
last_token := Caret_code
else
--|#line 75 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 75")
end
last_token := Equal_code
end
else
if yy_act = 11 then
--|#line 76 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 76")
end
last_token := Dot_code
else
--|#line 77 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 77")
end
last_token := Semicolon_code
end
end
else
if yy_act <= 14 then
if yy_act = 13 then
--|#line 78 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 78")
end
last_token := Comma_code
else
--|#line 79 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 79")
end
last_token := Colon_code
end
else
--|#line 80 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 80")
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
--|#line 81 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 81")
end
last_token := Left_parenthesis_code
else
--|#line 82 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 82")
end
last_token := Right_parenthesis_code
end
else
if yy_act = 18 then
--|#line 83 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 83")
end
last_token := Dollar_code
else
--|#line 84 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 84")
end
last_token := Question_mark_code
end
end
else
if yy_act <= 21 then
if yy_act = 20 then
--|#line 86 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 86")
end
last_token := Left_bracket_code
else
--|#line 87 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 87")
end
last_token := Right_bracket_code
end
else
--|#line 91 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 91")
end

				last_token := SYM_ARCHETYPE
			
end
end
else
if yy_act <= 26 then
if yy_act <= 24 then
if yy_act = 23 then
--|#line 95 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 95")
end

				last_token := SYM_TEMPLATE_OVERLAY
			
else
--|#line 99 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 99")
end

				last_token := SYM_TEMPLATE
			
end
else
if yy_act = 25 then
--|#line 103 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 103")
end

				last_token := SYM_OPERATIONAL_TEMPLATE
			
else
--|#line 107 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 107")
end

				last_token := SYM_ADL_VERSION
			
end
end
else
if yy_act <= 28 then
if yy_act = 27 then
--|#line 111 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 111")
end

				last_token := SYM_IS_CONTROLLED
			
else
--|#line 115 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 115")
end

				last_token := SYM_IS_GENERATED
			
end
else
--|#line 119 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 119")
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
--|#line 123 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 123")
end

				last_token := SYM_SPECIALIZE
				in_lineno := in_lineno + 1
			
else
--|#line 129 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 129")
end

				last_token := SYM_CONCEPT
				in_lineno := in_lineno + 1
			
end
else
if yy_act = 32 then
--|#line 134 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 134")
end

				last_token := SYM_LANGUAGE
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				language_text_start_line := in_lineno
			
else
--|#line 141 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 141")
end

				last_token := SYM_DESCRIPTION
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				description_text_start_line := in_lineno
			
end
end
else
if yy_act <= 35 then
if yy_act = 34 then
--|#line 148 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 148")
end

				last_token := SYM_DEFINITION
				set_start_condition(IN_CADL_SECTION)
				in_lineno := in_lineno + 1
				definition_text_start_line := in_lineno
			
else
--|#line 155 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 155")
end

				last_token := SYM_INVARIANT
				set_start_condition(IN_ASSERTION_SECTION)
				in_lineno := in_lineno + 1
				invariant_text_start_line := in_lineno
			
end
else
--|#line 162 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 162")
end

				last_token := SYM_ONTOLOGY
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				ontology_text_start_line := in_lineno
			
end
end
else
if yy_act <= 40 then
if yy_act <= 38 then
if yy_act = 37 then
--|#line 169 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 169")
end

				last_token := SYM_ANNOTATIONS
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				annotations_text_start_line := in_lineno
			
else
--|#line 176 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 176")
end

				last_token := SYM_COMPONENT_ONTOLOGIES
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				comp_onts_text_start_line := in_lineno
			
end
else
if yy_act = 39 then
--|#line 184 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 184")
end
 -- line starting with "definition" or "description" or "annotations"
				-- unread the pattern just matched
				a_text := text
				from i := text_count until i < 1 loop
					unread_character (a_text.item (i))
					i := i - 1
				end

				-- get the dADL section sorted out
				last_token := V_DADL_TEXT
				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_

				set_start_condition(INITIAL)
			
else
--|#line 185 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 185")
end
 -- line starting with "definition" or "description" or "annotations"
				-- unread the pattern just matched
				a_text := text
				from i := text_count until i < 1 loop
					unread_character (a_text.item (i))
					i := i - 1
				end

				-- get the dADL section sorted out
				last_token := V_DADL_TEXT
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
--|#line 186 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 186")
end
 -- line starting with "definition" or "description" or "annotations"
				-- unread the pattern just matched
				a_text := text
				from i := text_count until i < 1 loop
					unread_character (a_text.item (i))
					i := i - 1
				end

				-- get the dADL section sorted out
				last_token := V_DADL_TEXT
				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_

				set_start_condition(INITIAL)
			
else
--|#line 187 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 187")
end
 -- line starting with "definition" or "description" or "annotations"
				-- unread the pattern just matched
				a_text := text
				from i := text_count until i < 1 loop
					unread_character (a_text.item (i))
					i := i - 1
				end

				-- get the dADL section sorted out
				last_token := V_DADL_TEXT
				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_

				set_start_condition(INITIAL)
			
end
else
--|#line 204 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 204")
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
--|#line 208 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 208")
end
 -- any text on line with no LF
				in_buffer.append_string(text)
			
else
--|#line 223 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 223")
end

				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
end
else
if yy_act = 46 then
--|#line 227 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 227")
end
in_lineno := in_lineno + text_count
else
--|#line 229 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 229")
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
--|#line 241 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 241")
end
			-- match TAB whitsepace <anything> \n
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
else
--|#line 246 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 246")
end
in_lineno := in_lineno + text_count
end
else
--|#line 248 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 248")
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
--|#line 260 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 260")
end

					last_token := V_DOTTED_NUMERIC
					last_string_value := text_substring (1, text_count)
			
else
--|#line 266 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 266")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 53 then
--|#line 272 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 272")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
else
--|#line 278 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 278")
end

					last_token := V_IDENTIFIER
					last_string_value := text
			
end
end
else
if yy_act <= 56 then
if yy_act = 55 then
--|#line 284 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 284")
end

					last_token := V_VALUE
					last_string_value := text
			
else
--|#line 291 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 291")
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
				last_token := V_DADL_TEXT
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
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1024)
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
			   37,   46,   38,   39,   53,   54,   57,   58,   40,   41,
			  116,   59,   42,   59,  320,   43,   44,   62,   62,   47,
			  117,   48,   49,   62,   62,   37,   38,   44,   63,   66,
			   64,   64,   62,   62,   62,   62,  139,   62,   62,   62,
			   62,  317,   62,   62,   47,   48,  314,   68,   62,   62,

			   59,   66,   59,   67,   69,   62,   62,   62,   62,   71,
			  139,   74,   72,   73,   62,   62,   76,   62,   62,   62,
			   62,   87,   88,   91,   92,   75,   95,   95,   63,  158,
			   64,   64,   80,   94,   77,   94,   78,   96,   62,   79,
			  158,   76,   93,   93,   94,   93,   93,   93,   93,   93,
			   93,   93,   93,   96,   62,   93,   96,   62,   93,   93,
			   93,   93,   96,   62,  311,   96,   62,  101,  101,   96,
			   62,   97,   96,   62,   96,   62,   98,  100,  307,   96,
			   62,  303,   99,   93,   93,   93,   96,   62,  106,  102,
			  103,  104,  105,   96,   62,   96,   62,  299,  107,   96,

			   62,   96,   62,   96,   62,   87,   88,   91,   92,   62,
			   62,  291,  111,  108,  103,  109,  112,  178,  110,  118,
			  113,   95,   95,  108,   96,   62,   96,   62,  289,  110,
			   96,   62,   96,   62,  123,  280,  123,  123,   96,   62,
			   96,   62,  178,  122,   96,   62,  121,   96,   62,   96,
			   62,   96,   62,   96,   62,  278,  125,  120,  127,  124,
			  129,  276,  130,   96,   62,  275,  126,  121,  128,   96,
			   62,   96,   62,  261,   96,   62,   96,   62,  131,  140,
			  140,  260,  127,  259,  129,  134,  198,  130,  141,   62,
			  132,   96,   62,  258,  133,   96,   62,  198,  135,   96,

			   62,  244,  123,  243,  123,  123,   96,   62,  241,  134,
			   96,   62,   96,   62,   96,   62,   96,   62,  142,  147,
			  143,  221,  144,  200,   96,   62,  220,  149,  142,   96,
			   62,  143,  145,  148,  200,  146,  150,   96,   62,   96,
			   62,   96,   62,   96,   62,  219,  146,  151,   96,   62,
			  155,  118,  152,  140,  140,   62,   62,  154,   62,   62,
			  156,   96,   62,  153,   96,   62,  157,   96,   62,   96,
			   62,   96,   62,  222,  163,  155,  165,  201,  166,   96,
			   62,  199,   96,   62,  222,   96,   62,  164,   62,   96,
			   62,   96,   62,   96,   62,  181,  167,   96,   62,  168,

			  180,  165,  170,  166,  169,  179,  171,  167,  172,   96,
			   62,   96,   62,  161,  174,   96,   62,  160,  173,  159,
			  176,  242,  175,  138,  177,   62,   62,   96,   62,  137,
			   96,   62,  242,  175,   96,   62,   96,   62,   96,   62,
			   96,   62,  136,  173,   94,  176,   96,   62,   92,  177,
			  183,  184,   89,  188,   96,   62,   96,   62,   88,  185,
			   85,  186,   96,   62,   96,   62,  187,  115,   96,   62,
			  185,  189,  186,  192,   96,   62,  114,  193,  191,  190,
			   96,   62,  189,  194,   96,   62,   62,  202,   96,   62,
			  190,  195,   96,   62,   96,   62,   96,   62,  192,   96,

			   62,   60,  196,   96,   62,  197,   89,  205,   96,   62,
			  204,  295,  203,  206,   96,   62,  197,  209,  210,  209,
			   89,  207,  295,  208,   85,  211,   85,   96,   62,   96,
			   62,   96,   62,   96,   62,   96,   62,   96,   62,  212,
			   96,   62,   62,   62,  214,   62,   62,   96,   62,  213,
			  212,   96,   62,  218,  217,   84,  216,   83,   96,   62,
			   82,  215,   96,   62,  224,   96,   62,   96,   62,  225,
			  226,  209,  210,  209,   70,   62,   96,   62,  228,   96,
			   62,   96,   62,  227,  233,  234,  233,   61,  235,  236,
			  235,   60,  229,  325,   96,   62,  231,  230,   96,   62,

			   96,   62,   55,  229,   96,   62,  232,   51,  239,  239,
			  239,   62,   62,   96,   62,   96,   62,  232,   96,   62,
			  237,   46,   96,   62,   96,   62,   96,   62,  238,  249,
			  249,  249,  325,  238,  246,  247,   96,   62,  325,   96,
			   62,   96,   62,  325,  248,  262,  263,  253,  254,  253,
			  325,  240,  233,  234,  233,  325,  251,   96,   62,  250,
			   96,   62,  252,  235,  236,  235,   96,   62,  325,  255,
			  239,  239,  239,  325,   96,   62,   96,   62,  325,  256,
			   96,   62,   96,   62,  249,  249,  249,   96,   62,  268,
			  269,  268,  265,  325,  255,  257,  264,   96,   62,   96,

			   62,  253,  254,  253,   96,   62,  266,  325,  267,  272,
			  273,  272,   96,   62,  260,  277,  260,  270,  325,   96,
			   62,  325,  271,   62,   62,   96,   62,   96,   62,  325,
			  281,  282,  281,   96,   62,  268,  269,  268,  325,  274,
			   96,   62,   96,   62,  284,  285,  284,   96,   62,  274,
			  272,  273,  272,  283,   96,   62,  275,  288,  275,  325,
			  287,  278,  290,  278,  262,  263,  281,  282,  281,   96,
			   62,  284,  285,  284,  325,  286,   96,   62,  325,   96,
			   62,  291,  291,   96,   62,   96,   62,  325,   96,   62,
			   96,   62,   96,   62,  292,   96,   62,  325,  297,   96,

			   62,  293,  294,  325,  296,  292,  298,  325,  300,   96,
			   62,  301,  293,   96,   62,  325,  304,  325,  302,   96,
			   62,  305,   96,   62,  325,  310,  310,  310,   96,   62,
			   96,   62,   96,   62,  308,   96,   62,   96,   62,  313,
			  309,  306,  325,  302,  325,  312,  310,  310,  310,  325,
			  315,   96,   62,   96,   62,  325,  325,  316,  325,  321,
			  322,  321,  325,  325,  313,  325,  319,  325,  316,   96,
			   62,  323,  323,  323,  325,  318,  320,  324,  320,  325,
			  325,   96,   62,  321,  322,  321,  323,  323,  323,   45,
			   45,   45,   45,   45,   45,   50,   50,   50,   50,   50,

			   50,   52,   52,   52,   52,   52,   52,   56,   56,   56,
			   56,   56,   56,   62,   62,   62,   62,   65,   65,   65,
			   65,   81,  325,   81,   81,   81,   81,   86,   86,   86,
			   86,   86,   86,   90,   90,   90,   90,   90,   90,   61,
			   61,   61,   61,   61,   61,   93,   93,   93,   93,   93,
			   93,  119,  119,  119,  119,  162,  162,  162,  162,  182,
			  182,  182,  182,  223,  223,  223,  223,  245,  245,  245,
			  245,  279,  279,  279,  279,    9,  325,  325,  325,  325,
			  325,  325,  325,  325,  325,  325,  325,  325,  325,  325,
			  325,  325,  325,  325,  325,  325,  325,  325,  325,  325, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  325,  325,  325,  325,  325,  325,  325,  325,  325,  325,
			  325,  325,  325,  325,  325,  325,  325,  325,  325,  325,
			  325,  325,  325,  325,  325, yy_Dummy>>,
			1, 25, 1000)
		end

	yy_chk_template: SPECIAL [INTEGER]
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1024)
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
			    2,    4,    2,    2,    6,    6,    8,    8,    2,    2,
			   84,   11,    2,   11,  317,    2,    2,   28,   28,    4,
			   84,    4,    4,   29,   29,    2,    2,    2,   23,   28,
			   23,   23,   30,   30,   31,   31,  117,   32,   32,   37,
			   37,  314,   38,   38,    4,    4,  311,   31,   39,   39,

			   59,   37,   59,   30,   32,   40,   40,   41,   41,   37,
			  117,   39,   37,   38,   42,   42,   41,   43,   43,   44,
			   44,   53,   53,   57,   57,   40,   63,   63,   64,  136,
			   64,   64,   44,   94,   42,   94,   42,   65,   65,   43,
			  136,   41,   61,   61,   61,   61,   61,   61,   61,   61,
			   61,   61,   61,   66,   66,   61,   67,   67,   61,   61,
			   61,   61,   68,   68,  307,   69,   69,   70,   70,   71,
			   71,   66,   73,   73,   74,   74,   67,   69,  303,   72,
			   72,  299,   68,   61,   61,   61,   75,   75,   74,   71,
			   72,   73,   73,   77,   77,   76,   76,  295,   74,   78,

			   78,   80,   80,   79,   79,   87,   87,   91,   91,   96,
			   96,  280,   78,   75,   72,   76,   79,  158,   77,   95,
			   80,   95,   95,   75,   97,   97,   98,   98,  276,   77,
			   99,   99,  100,  100,  101,  263,  101,  101,  102,  102,
			  103,  103,  158,   99,  104,  104,   98,  105,  105,  107,
			  107,  106,  106,  108,  108,  261,  103,   97,  105,  102,
			  107,  259,  108,  109,  109,  258,  104,  105,  106,  110,
			  110,  111,  111,  244,  112,  112,  113,  113,  109,  118,
			  118,  243,  105,  242,  107,  112,  178,  108,  119,  119,
			  110,  120,  120,  241,  111,  121,  121,  178,  113,  122,

			  122,  222,  123,  221,  123,  123,  125,  125,  219,  112,
			  124,  124,  126,  126,  127,  127,  128,  128,  120,  125,
			  121,  200,  122,  180,  129,  129,  199,  127,  120,  130,
			  130,  121,  123,  126,  180,  124,  128,  131,  131,  132,
			  132,  133,  133,  134,  134,  198,  124,  129,  135,  135,
			  133,  140,  130,  140,  140,  141,  141,  132,  141,  141,
			  134,  142,  142,  131,  143,  143,  135,  144,  144,  146,
			  146,  147,  147,  201,  142,  133,  144,  181,  146,  148,
			  148,  179,  149,  149,  201,  150,  150,  143,  141,  151,
			  151,  152,  152,  154,  154,  161,  147,  155,  155,  148,

			  160,  144,  150,  146,  149,  159,  151,  147,  152,  153,
			  153,  156,  156,  139,  154,  157,  157,  138,  153,  137,
			  156,  220,  155,  116,  157,  162,  162,  163,  163,  115,
			  164,  164,  220,  155,  165,  165,  166,  166,  167,  167,
			  168,  168,  114,  153,   93,  156,  169,  169,   90,  157,
			  163,  164,   89,  168,  170,  170,  171,  171,   86,  165,
			   85,  166,  173,  173,  172,  172,  167,   83,  174,  174,
			  165,  169,  166,  172,  175,  175,   82,  173,  171,  170,
			  177,  177,  169,  174,  176,  176,  182,  182,  183,  183,
			  170,  175,  184,  184,  185,  185,  186,  186,  172,  187,

			  187,   60,  176,  188,  188,  177,   58,  185,  190,  190,
			  184,  289,  183,  186,  191,  191,  177,  189,  189,  189,
			   55,  187,  289,  188,   54,  190,   51,  189,  189,  192,
			  192,  193,  193,  194,  194,  195,  195,  196,  196,  191,
			  197,  197,  202,  202,  193,  202,  202,  203,  203,  192,
			  191,  204,  204,  197,  196,   49,  195,   48,  205,  205,
			   47,  194,  206,  206,  203,  207,  207,  208,  208,  204,
			  205,  209,  209,  209,   33,  202,  211,  211,  207,  212,
			  212,  213,  213,  206,  214,  214,  214,   20,  215,  215,
			  215,   12,  208,    9,  214,  214,  212,  211,  215,  215,

			  216,  216,    7,  208,  217,  217,  213,    5,  218,  218,
			  218,  223,  223,  224,  224,  226,  226,  213,  218,  218,
			  216,    3,  225,  225,  227,  227,  229,  229,  217,  228,
			  228,  228,    0,  217,  224,  225,  230,  230,    0,  228,
			  228,  231,  231,    0,  227,  245,  245,  232,  232,  232,
			    0,  218,  233,  233,  233,    0,  230,  232,  232,  229,
			  237,  237,  231,  235,  235,  235,  238,  238,    0,  237,
			  239,  239,  239,    0,  240,  240,  246,  246,    0,  238,
			  247,  247,  248,  248,  249,  249,  249,  250,  250,  251,
			  251,  251,  247,    0,  237,  240,  246,  252,  252,  251,

			  251,  253,  253,  253,  255,  255,  248,    0,  250,  256,
			  256,  256,  257,  257,  260,  260,  260,  252,    0,  256,
			  256,    0,  255,  262,  262,  264,  264,  265,  265,    0,
			  266,  266,  266,  267,  267,  268,  268,  268,    0,  257,
			  266,  266,  271,  271,  270,  270,  270,  274,  274,  257,
			  272,  272,  272,  267,  270,  270,  275,  275,  275,    0,
			  274,  278,  278,  278,  279,  279,  281,  281,  281,  283,
			  283,  284,  284,  284,    0,  271,  286,  286,    0,  287,
			  287,  291,  291,  292,  292,  293,  293,    0,  294,  294,
			  296,  296,  297,  297,  283,  300,  300,    0,  293,  301,

			  301,  286,  287,    0,  292,  283,  294,    0,  296,  298,
			  298,  297,  286,  302,  302,    0,  300,    0,  298,  304,
			  304,  301,  305,  305,    0,  306,  306,  306,  308,  308,
			  309,  309,  313,  313,  304,  306,  306,  312,  312,  309,
			  305,  302,    0,  298,    0,  308,  310,  310,  310,    0,
			  312,  315,  315,  316,  316,    0,    0,  313,    0,  318,
			  318,  318,    0,    0,  309,    0,  316,    0,  313,  318,
			  318,  319,  319,  319,    0,  315,  320,  320,  320,    0,
			    0,  319,  319,  321,  321,  321,  323,  323,  323,  326,
			  326,  326,  326,  326,  326,  327,  327,  327,  327,  327,

			  327,  328,  328,  328,  328,  328,  328,  329,  329,  329,
			  329,  329,  329,  330,  330,  330,  330,  331,  331,  331,
			  331,  332,    0,  332,  332,  332,  332,  333,  333,  333,
			  333,  333,  333,  334,  334,  334,  334,  334,  334,  335,
			  335,  335,  335,  335,  335,  336,  336,  336,  336,  336,
			  336,  337,  337,  337,  337,  338,  338,  338,  338,  339,
			  339,  339,  339,  340,  340,  340,  340,  341,  341,  341,
			  341,  342,  342,  342,  342,  325,  325,  325,  325,  325,
			  325,  325,  325,  325,  325,  325,  325,  325,  325,  325,
			  325,  325,  325,  325,  325,  325,  325,  325,  325,  325, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  325,  325,  325,  325,  325,  325,  325,  325,  325,  325,
			  325,  325,  325,  325,  325,  325,  325,  325,  325,  325,
			  325,  325,  325,  325,  325, yy_Dummy>>,
			1, 25, 1000)
		end

	yy_base_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,   29,  618,   48,  604,   52,  599,   54,  593,
			  975,   59,  588,  975,  975,  975,  975,  975,  975,  975,
			  575,    0,  975,   65,  975,  975,  975,  975,   55,   61,
			   70,   72,   75,  528,  975,  975,    0,   77,   80,   86,
			   93,   95,  102,  105,  107,    0,  975,  528,  524,  530,
			  975,  523,  975,  119,  521,  517,  975,  121,  503,   98,
			  498,  141,    0,  111,  115,  125,  141,  144,  150,  153,
			  120,  157,  167,  160,  162,  174,  183,  181,  187,  191,
			  189,    0,  444,  436,   34,  457,  455,  203,  975,  449,
			  445,  205,  975,  441,  131,  206,  197,  212,  214,  218,

			  220,  221,  226,  228,  232,  235,  239,  237,  241,  251,
			  257,  259,  262,  264,  409,  395,  394,   63,  264,  276,
			  279,  283,  287,  289,  298,  294,  300,  302,  304,  312,
			  317,  325,  327,  329,  331,  336,   92,  386,  385,  378,
			  338,  343,  349,  352,  355,  975,  357,  359,  367,  370,
			  373,  377,  379,  397,  381,  385,  399,  403,  196,  373,
			  371,  366,  413,  415,  418,  422,  424,  426,  428,  434,
			  442,  444,  452,  450,  456,  462,  472,  468,  249,  356,
			  286,  343,  474,  476,  480,  482,  484,  487,  491,  515,
			  496,  502,  517,  519,  521,  523,  525,  528,  316,  294,

			  292,  336,  530,  535,  539,  546,  550,  553,  555,  569,
			  975,  564,  567,  569,  582,  586,  588,  592,  606,  275,
			  384,  270,  272,  599,  601,  610,  603,  612,  627,  614,
			  624,  629,  645,  650,  975,  661,  975,  648,  654,  668,
			  662,  261,  238,  249,  240,  633,  664,  668,  670,  682,
			  675,  687,  685,  699,  975,  692,  707,  700,  229,  228,
			  712,  223,  711,  186,  713,  715,  728,  721,  733,  975,
			  742,  730,  748,  975,  735,  754,  196,  975,  759,  752,
			  195,  764,  975,  757,  769,  975,  764,  767,  975,  474,
			  975,  766,  771,  773,  776,  164,  778,  780,  797,  151,

			  783,  787,  801,  145,  807,  810,  823,  137,  816,  818,
			  844,   67,  825,  820,   66,  839,  841,   28,  857,  869,
			  874,  881,  975,  884,  975,  975,  888,  894,  900,  906,
			  910,  914,  920,  926,  932,  938,  944,  948,  952,  956,
			  960,  964,  968, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,  325,    1,  326,  326,  327,  328,  327,  329,  325,
			  325,  325,  325,  325,  325,  325,  325,  325,  325,  325,
			  330,  330,  325,  330,  325,  325,  325,  325,  331,  331,
			  331,  331,  331,  325,  325,  325,  330,  331,  331,  331,
			  331,  331,  331,  331,  331,  332,  325,  332,  332,  332,
			  325,  325,  325,  333,  325,  325,  325,  334,  325,  325,
			  325,  335,  330,  330,  330,  331,  331,  331,  331,  331,
			  325,  331,  331,  331,  331,  331,  331,  331,  331,  331,
			  331,  332,  332,  332,  332,  325,  333,  333,  325,  325,
			  334,  334,  325,  336,  325,  330,  337,  331,  331,  331,

			  331,  325,  331,  331,  331,  331,  331,  331,  331,  331,
			  331,  331,  331,  331,  332,  332,  332,  332,  330,  337,
			  331,  331,  331,  325,  331,  331,  331,  331,  331,  331,
			  331,  331,  331,  331,  331,  331,  332,  332,  332,  332,
			  330,  338,  331,  331,  331,  325,  331,  331,  331,  331,
			  331,  331,  331,  331,  331,  331,  331,  331,  332,  332,
			  332,  332,  339,  331,  331,  331,  331,  331,  331,  331,
			  331,  331,  331,  331,  331,  331,  331,  331,  332,  332,
			  332,  332,  339,  331,  331,  331,  331,  331,  331,  331,
			  331,  331,  331,  331,  331,  331,  331,  331,  332,  332,

			  332,  332,  340,  331,  331,  331,  331,  331,  331,  325,
			  325,  331,  331,  331,  331,  331,  331,  331,  331,  332,
			  332,  332,  332,  341,  331,  331,  331,  331,  331,  331,
			  331,  331,  331,  325,  325,  325,  325,  331,  331,  325,
			  331,  332,  332,  332,  332,  341,  331,  331,  331,  325,
			  331,  331,  331,  325,  325,  331,  331,  331,  332,  332,
			  332,  332,  342,  330,  331,  331,  331,  331,  325,  325,
			  331,  331,  325,  325,  331,  332,  332,  325,  332,  342,
			  330,  325,  325,  331,  325,  325,  331,  331,  325,  332,
			  325,  330,  331,  331,  331,  332,  331,  331,  331,  332,

			  331,  331,  331,  332,  331,  331,  331,  332,  331,  331,
			  325,  332,  331,  331,  332,  331,  331,  332,  331,  331,
			  332,  325,  325,  325,  325,    0,  325,  325,  325,  325,
			  325,  325,  325,  325,  325,  325,  325,  325,  325,  325,
			  325,  325,  325, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    5,    1,    1,    6,    1,    1,    1,
			    7,    8,    9,   10,   11,   12,   13,   14,   15,   16,
			   16,   16,   16,   16,   16,   16,   16,   16,   17,   18,
			    1,   19,    1,   20,    1,   21,   22,   23,   24,   25,
			   26,   27,   28,   29,   22,   22,   30,   31,   32,   33,
			   34,   22,   35,   36,   37,   38,   39,   22,   22,   40,
			   41,   42,    1,   43,   44,   45,    1,   46,   22,   47,

			   24,   25,   26,   27,   28,   29,   22,   22,   30,   31,
			   32,   33,   34,   22,   35,   36,   48,   38,   49,   22,
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
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    2,    1,    1,    1,    1,    1,    1,
			    1,    1,    3,    4,    1,    3,    5,    1,    1,    1,
			    1,    3,    3,    3,    3,    3,    3,    3,    3,    3,
			    3,    3,    3,    3,    3,    3,    3,    3,    3,    3,
			    3,    6,    1,    1,    1,    3,    3,    3,    3,    3, yy_Dummy>>)
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
			   39,   53,   54,   54,   54,   44,   54,   54,   54,   44,

			   54,   54,   54,   44,   54,   54,   54,   44,   54,   54,
			   23,   44,   54,   54,   44,   54,   54,   44,   54,   54,
			   44,    0,   38,   25,   42,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 975
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 325
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 326
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
	IN_DADL_SECTION: INTEGER = 1
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
