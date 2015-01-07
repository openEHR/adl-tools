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
--|#line 228 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 228")
end
in_lineno := in_lineno + text_count
else
--|#line 230 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 230")
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
--|#line 242 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 242")
end
			-- match TAB whitespace <anything> \n
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	
else
--|#line 247 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 247")
end
in_lineno := in_lineno + text_count
end
else
--|#line 249 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 249")
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
--|#line 261 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 261")
end

					last_token := V_DOTTED_NUMERIC
					last_string_value := text_substring (1, text_count)
			
else
--|#line 267 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 267")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 53 then
--|#line 273 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 273")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
else
--|#line 279 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 279")
end

					last_token := V_IDENTIFIER
					last_string_value := text
			
end
end
else
if yy_act <= 56 then
if yy_act = 55 then
--|#line 285 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 285")
end

					last_token := V_VALUE
					last_string_value := text
			
else
--|#line 292 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 292")
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
--|#line 291 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 291")
end
terminate
when 1 then
--|#line 211 "adl_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_scanner.l' at line 211")
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
			-- Template for `yy_nxt'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1339)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,   10,   11,   12,   11,   13,   14,   15,   16,   17,
			   18,   19,   20,   21,   22,   23,   24,   25,   26,   27,
			   28,   29,   30,   29,   29,   29,   31,   29,   29,   29,
			   29,   29,   29,   29,   29,   29,   29,   32,   29,   29,
			   29,   33,   34,   35,   36,   28,   30,   29,   29,   32,
			   29,   37,   46,   38,   39,   53,   54,   57,   58,   40,
			   41,  356,   59,   42,   59,  118,   43,   44,   63,   47,
			   64,   48,   49,   62,   62,  119,   37,   38,  166,   44,
			   62,   62,   62,   62,   66,   62,   62,   62,   62,   62,
			   62,  166,   62,   62,   47,   48,  355,   68,   62,   62,

			   66,  318,   67,   69,   62,   62,   62,   62,   71,  351,
			   74,   72,   73,  143,   76,   62,   62,   62,   62,   62,
			   62,   87,   88,   75,   72,   91,   92,   59,   63,   59,
			   64,   80,  348,  103,   77,  103,   78,  143,   79,   76,
			   93,   93,   94,   93,   93,   93,   93,   93,   93,   93,
			   93,   87,   88,   93,  347,   93,   93,   93,   93,   96,
			   97,   96,   97,   98,  346,   98,   96,   97,   96,   97,
			   98,  163,   98,   96,   97,   96,   97,   98,   99,   98,
			   93,   93,   93,  163,  102,  100,  335,  101,   96,   97,
			   91,   92,   98,  184,  104,   96,   97,  341,  105,   98,

			   96,   97,   96,   97,   98,   94,   98,   94,   96,   97,
			   62,   62,   98,  106,  107,  108,   96,   97,  184,  120,
			   98,   95,  105,   62,   62,  109,  110,  111,  337,   96,
			   97,   96,   97,   98,  127,   98,  127,  120,  110,  144,
			  112,  113,  336,  114,   96,   97,   96,   97,   98,  335,
			   98,  205,  112,   96,   97,   96,   97,   98,  334,   98,
			   96,   97,  115,  205,   98,   96,   97,  126,  330,   98,
			  145,   62,  125,   96,   97,   96,   97,   98,  124,   98,
			   96,   97,   96,   97,   98,  128,   98,  327,  129,  317,
			  131,   96,   97,   96,   97,   98,  130,   98,  132,  125,

			  317,  133,   96,   97,   96,   97,   98,  135,   98,  207,
			  134,   96,   97,  317,  131,   98,   96,   97,   96,   97,
			   98,  207,   98,  318,  136,  133,  138,   62,   97,  326,
			  127,   98,  127,  137,  320,  134,   96,   97,  319,  139,
			   98,   96,   97,   62,   62,   98,  137,   96,   97,  316,
			  138,   98,   96,   97,   96,   97,   98,  303,   98,  150,
			   96,   97,  147,  301,   98,  148,  152,   96,   97,  149,
			  292,   98,   62,   62,  147,   62,  151,  148,  291,  154,
			  153,  289,  149,   96,   97,   96,   97,   98,  151,   98,
			   96,   97,   96,   97,   98,  287,   98,   96,   97,   96,

			   97,   98,  155,   98,   62,   96,   97,  156,  286,   98,
			   62,  209,  157,  160,  159,  161,  271,  158,   96,   97,
			  156,  270,   98,   62,   62,  157,   62,   96,   97,  158,
			  269,   98,   96,   97,  268,  162,   98,  230,  160,  169,
			   96,   97,   96,   97,   98,  251,   98,  253,  171,  230,
			  172,  308,   96,   97,  170,   62,   98,  251,   96,   97,
			   96,   97,   98,  308,   98,   62,   62,  170,   96,   97,
			   96,   97,   98,  171,   98,  172,  173,  174,   96,   97,
			  252,  175,   98,  250,  176,  232,  177,  229,  173,   96,
			   97,   96,   97,   98,  178,   98,  228,  179,  227,   96,

			   97,   96,   97,   98,  208,   98,   96,   97,  206,  182,
			   98,  180,  272,  273,  183,   96,   97,   62,   62,   98,
			   96,   97,  179,  181,   98,   96,   97,   96,   97,   98,
			  189,   98,   96,   97,  182,  181,   98,  190,  187,  183,
			  191,   96,   97,   96,   97,   98,  186,   98,  185,  192,
			  190,  193,  165,  195,   96,   97,   96,   97,   98,  194,
			   98,  192,  164,  193,   96,   97,  144,  196,   98,   96,
			   97,  142,  199,   98,  217,  218,  217,  198,  197,  196,
			   96,   97,  141,  200,   98,   96,   97,   96,   97,   98,
			  197,   98,   96,   97,  201,  140,   98,  199,   96,   97,

			  123,  202,   98,   94,  203,   96,   97,   96,   97,   98,
			  309,   98,  310,   96,   97,  336,  204,   98,   92,  213,
			   89,  211,  212,   96,   97,  272,  273,   98,  204,  214,
			   96,   97,  321,  322,   98,   88,  217,  218,  217,   96,
			   97,   96,   97,   98,  215,   98,   96,   97,   85,  216,
			   98,  117,   96,   97,  116,  219,   98,   96,   97,   96,
			   97,   98,   95,   98,   60,  220,   96,   97,   89,  222,
			   98,  221,   96,   97,   96,   97,   98,  220,   98,   96,
			   97,   89,  225,   98,   96,   97,  223,   85,   98,   85,
			  233,  226,  224,   96,   97,   96,   97,   98,   84,   98,

			   83,  234,   96,   97,  235,   82,   98,   96,   97,   96,
			   97,   98,   70,   98,  237,  236,   96,   97,   96,   97,
			   98,   61,   98,  242,  243,  242,   96,   97,   60,  239,
			   98,  238,  240,   96,   97,  321,  322,   98,  244,  245,
			  244,  361,  241,  238,   55,  246,   96,   97,   96,   97,
			   98,   51,   98,   46,  241,  361,  248,  248,  248,   96,
			   97,   96,   97,   98,  361,   98,   96,   97,  361,  247,
			   98,   96,   97,  257,  247,   98,   96,   97,  361,  256,
			   98,  259,  259,  259,  361,  361,  361,   96,   97,   96,
			   97,   98,  309,   98,  342,  258,  361,  356,  249,  263,

			  264,  263,  242,  243,  242,  361,  261,  361,  361,  262,
			  244,  245,  244,   96,   97,   96,   97,   98,  361,   98,
			  361,  265,  361,   65,  361,  361,  260,  266,  248,  248,
			  248,   96,   97,   96,   97,   98,  361,   98,   96,   97,
			  361,   65,   98,   96,   97,  361,  265,   98,  361,  276,
			  361,  267,  275,  259,  259,  259,   96,   97,  361,  361,
			   98,  279,  280,  279,   96,   97,  277,  361,   98,  263,
			  264,  263,  361,   96,   97,  361,  278,   98,  283,  284,
			  283,   96,   97,  281,  361,   98,  270,  288,  270,  361,
			  282,   96,   97,   96,   97,   98,  361,   98,  293,  294,

			  293,  361,  361,   65,   96,   97,  361,  285,   98,  279,
			  280,  279,  296,  297,  296,  361,  361,  361,  361,  285,
			   65,  361,  361,  295,  283,  284,  283,   96,   97,  361,
			  361,   98,  286,  300,  286,  289,  302,  289,  361,  299,
			   65,  293,  294,  293,   96,   97,  361,  361,   98,  296,
			  297,  296,   96,   97,   65,  361,   98,  298,  361,   96,
			   97,  361,  309,   98,  310,  311,  361,  303,  305,   96,
			   97,   96,   97,   98,  361,   98,  306,  361,   96,   97,
			  305,  307,   98,  314,  361,  361,   96,   97,  306,  313,
			   98,  361,   96,   97,  307,  315,   98,   96,   97,  361, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  361,   98,  361,  323,  309,  325,  310,  328,  361,  320,
			  324,   96,   97,   96,   97,   98,  361,   98,   96,   97,
			  361,  361,   98,   96,   97,   96,   97,   98,  361,   98,
			  325,  331,   96,   97,  332,  361,   98,  338,  340,  340,
			  340,  309,  339,  342,  343,  333,  337,  361,  344,   96,
			   97,  361,  361,   98,  340,  340,  340,  345,   96,   97,
			   96,   97,   98,  309,   98,  342,  352,  361,  348,  361,
			  349,   96,   97,   96,   97,   98,  361,   98,  361,  361,
			   65,  361,  345,  361,  350,  354,  357,  358,  357,  359,
			  359,  359,  361,  361,  353,  361,  350,  355,  360,  355,

			  357,  358,  357,  359,  359,  359,   62,   62,   62,   62,
			   62,   62,   62,   65,   65,   65,   65,   65,   65,   65,
			  121,  121,  121,  121,  121,  121,  121,  361,   65,  361,
			  361,   65,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   81,  361,
			   81,   81,   81,   81,   81,   81,   81,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   61,   61,   61,   61,   61,

			   61,   61,   61,   61,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,  122,  122,  122,  122,  122,  122,  122,
			  146,  146,  146,  167,  167,  167,  167,  167,  167,  167,
			  168,  168,  168,  168,  168,  188,  188,  188,  188,  188,
			  188,  188,  210,  210,  210,  210,  210,  231,  231,  231,
			  231,  231,  231,  231,  254,  254,  254,  254,  254,  254,
			  254,  255,  255,  255,  274,  274,  274,  274,  274,  290,
			  290,  290,  290,  290,  290,  290,  304,  304,  304,  312,
			  312,  312,  312,  312,  329,  329,  329,  329,  329,    9,
			  361,  361,  361,  361,  361,  361,  361,  361,  361,  361,

			  361,  361,  361,  361,  361,  361,  361,  361,  361,  361,
			  361,  361,  361,  361,  361,  361,  361,  361,  361,  361,
			  361,  361,  361,  361,  361,  361,  361,  361,  361,  361,
			  361,  361,  361,  361,  361,  361,  361,  361,  361,  361, yy_Dummy>>,
			1, 340, 1000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1339)
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
			    1,    2,    4,    2,    2,    6,    6,    8,    8,    2,
			    2,  352,   11,    2,   11,   84,    2,    2,   23,    4,
			   23,    4,    4,   28,   28,   84,    2,    2,  143,    2,
			   29,   29,   30,   30,   28,   31,   31,   32,   32,   37,
			   37,  143,   38,   38,    4,    4,  351,   31,   39,   39,

			   37,  347,   30,   32,   40,   40,   41,   41,   37,  346,
			   39,   37,   38,  119,   41,   42,   42,   43,   43,   44,
			   44,   53,   53,   40,   37,   57,   57,   59,   64,   59,
			   64,   44,  343,   70,   42,   70,   42,  119,   43,   41,
			   61,   61,   61,   61,   61,   61,   61,   61,   61,   61,
			   61,   87,   87,   61,  342,   61,   61,   61,   61,   65,
			   65,   66,   66,   65,  341,   66,   67,   67,   68,   68,
			   67,  140,   68,   69,   69,   71,   71,   69,   66,   71,
			   61,   61,   61,  140,   69,   67,  335,   68,   72,   72,
			   91,   91,   72,  163,   71,   73,   73,  334,   72,   73,

			   75,   75,   74,   74,   75,   94,   74,   94,   76,   76,
			   96,   96,   76,   73,   73,   74,   77,   77,  163,   95,
			   77,   95,   72,   97,   97,   74,   75,   76,  330,   78,
			   78,   79,   79,   78,  103,   79,  103,  144,   75,  144,
			   77,   78,  328,   79,   80,   80,   99,   99,   80,  327,
			   99,  184,   77,  100,  100,  101,  101,  100,  326,  101,
			  102,  102,   80,  184,  102,  104,  104,  101,  322,  104,
			  121,  121,  100,  105,  105,  106,  106,  105,   99,  106,
			  107,  107,  108,  108,  107,  104,  108,  319,  105,  309,
			  107,  109,  109,  111,  111,  109,  106,  111,  108,  107,

			  318,  109,  110,  110,  112,  112,  110,  111,  112,  186,
			  110,  113,  113,  317,  107,  113,  114,  114,  115,  115,
			  114,  186,  115,  309,  112,  109,  114,  122,  122,  316,
			  127,  122,  127,  113,  311,  110,  124,  124,  310,  115,
			  124,  125,  125,  167,  167,  125,  113,  126,  126,  308,
			  114,  126,  128,  128,  129,  129,  128,  291,  129,  127,
			  130,  130,  124,  287,  130,  125,  129,  131,  131,  126,
			  274,  131,  145,  145,  124,  145,  128,  125,  273,  131,
			  130,  271,  126,  132,  132,  133,  133,  132,  128,  133,
			  134,  134,  135,  135,  134,  269,  135,  136,  136,  138,

			  138,  136,  132,  138,  145,  137,  137,  133,  268,  137,
			  188,  188,  134,  137,  136,  138,  253,  135,  139,  139,
			  133,  252,  139,  209,  209,  134,  209,  147,  147,  135,
			  251,  147,  148,  148,  250,  139,  148,  208,  137,  147,
			  149,  149,  151,  151,  149,  228,  151,  230,  149,  208,
			  151,  301,  152,  152,  148,  209,  152,  228,  153,  153,
			  154,  154,  153,  301,  154,  231,  231,  148,  155,  155,
			  156,  156,  155,  149,  156,  151,  152,  153,  157,  157,
			  229,  154,  157,  227,  155,  210,  156,  207,  152,  158,
			  158,  159,  159,  158,  157,  159,  206,  158,  205,  160,

			  160,  161,  161,  160,  187,  161,  162,  162,  185,  161,
			  162,  159,  254,  254,  162,  169,  169,  272,  272,  169,
			  170,  170,  158,  160,  170,  171,  171,  172,  172,  171,
			  168,  172,  173,  173,  161,  160,  173,  169,  166,  162,
			  170,  174,  174,  175,  175,  174,  165,  175,  164,  171,
			  169,  172,  142,  174,  176,  176,  177,  177,  176,  173,
			  177,  171,  141,  172,  178,  178,  120,  175,  178,  179,
			  179,  118,  178,  179,  217,  217,  217,  177,  176,  175,
			  180,  180,  117,  179,  180,  181,  181,  182,  182,  181,
			  176,  182,  183,  183,  180,  116,  183,  178,  190,  190,

			   98,  181,  190,   93,  182,  191,  191,  192,  192,  191,
			  336,  192,  336,  193,  193,  336,  183,  193,   90,  192,
			   89,  190,  191,  194,  194,  290,  290,  194,  183,  193,
			  195,  195,  312,  312,  195,   86,  196,  196,  196,  197,
			  197,  198,  198,  197,  194,  198,  196,  196,   85,  195,
			  196,   83,  199,  199,   82,  197,  199,  200,  200,  201,
			  201,  200,   63,  201,   60,  198,  203,  203,   58,  200,
			  203,  199,  202,  202,  211,  211,  202,  198,  211,  204,
			  204,   55,  203,  204,  212,  212,  201,   54,  212,   51,
			  211,  204,  202,  213,  213,  214,  214,  213,   49,  214,

			   48,  212,  215,  215,  213,   47,  215,  216,  216,  219,
			  219,  216,   33,  219,  215,  214,  220,  220,  221,  221,
			  220,   20,  221,  222,  222,  222,  224,  224,   12,  219,
			  224,  216,  220,  222,  222,  329,  329,  222,  223,  223,
			  223,    9,  221,  216,    7,  224,  225,  225,  223,  223,
			  225,    5,  223,    3,  221,    0,  226,  226,  226,  233,
			  233,  234,  234,  233,    0,  234,  226,  226,    0,  225,
			  226,  235,  235,  234,  225,  235,  236,  236,    0,  233,
			  236,  237,  237,  237,  238,  238,  238,  239,  239,  240,
			  240,  239,  356,  240,  356,  236,    0,  356,  226,  241,

			  241,  241,  242,  242,  242,    0,  239,    0,    0,  240,
			  244,  244,  244,  246,  246,  247,  247,  246,    0,  247,
			    0,  246,    0,  237,    0,    0,  238,  247,  248,  248,
			  248,  249,  249,  256,  256,  249,    0,  256,  257,  257,
			    0,  241,  257,  258,  258,    0,  246,  258,    0,  257,
			    0,  249,  256,  259,  259,  259,  260,  260,    0,    0,
			  260,  261,  261,  261,  262,  262,  258,    0,  262,  263,
			  263,  263,    0,  265,  265,    0,  260,  265,  266,  266,
			  266,  267,  267,  262,    0,  267,  270,  270,  270,    0,
			  265,  275,  275,  276,  276,  275,    0,  276,  277,  277,

			  277,    0,    0,  261,  278,  278,    0,  267,  278,  279,
			  279,  279,  281,  281,  281,  282,  282,  282,    0,  267,
			  266,    0,    0,  278,  283,  283,  283,  285,  285,    0,
			    0,  285,  286,  286,  286,  289,  289,  289,    0,  285,
			  277,  293,  293,  293,  295,  295,    0,    0,  295,  296,
			  296,  296,  298,  298,  281,    0,  298,  282,    0,  299,
			  299,    0,  303,  299,  303,  303,    0,  303,  295,  305,
			  305,  306,  306,  305,    0,  306,  298,    0,  307,  307,
			  295,  299,  307,  306,    0,    0,  313,  313,  298,  305,
			  313,    0,  314,  314,  299,  307,  314,  315,  315,    0, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,  315,    0,  313,  320,  315,  320,  320,    0,  320,
			  314,  323,  323,  324,  324,  323,    0,  324,  325,  325,
			    0,    0,  325,  331,  331,  332,  332,  331,    0,  332,
			  315,  323,  338,  338,  324,    0,  338,  331,  333,  333,
			  333,  337,  332,  337,  337,  325,  337,    0,  338,  339,
			  339,    0,    0,  339,  340,  340,  340,  339,  344,  344,
			  345,  345,  344,  348,  345,  348,  348,    0,  348,    0,
			  344,  349,  349,  350,  350,  349,    0,  350,    0,    0,
			  333,    0,  339,    0,  345,  350,  353,  353,  353,  354,
			  354,  354,    0,    0,  349,    0,  345,  355,  355,  355,

			  357,  357,  357,  359,  359,  359,  366,  366,  366,  366,
			  366,  366,  366,  367,  367,  367,  367,  367,  367,  367,
			  373,  373,  373,  373,  373,  373,  373,    0,  353,    0,
			    0,  354,  362,  362,  362,  362,  362,  362,  362,  362,
			  362,  363,  363,  363,  363,  363,  363,  363,  363,  363,
			  364,  364,  364,  364,  364,  364,  364,  364,  364,  365,
			  365,  365,  365,  365,  365,  365,  365,  365,  368,    0,
			  368,  368,  368,  368,  368,  368,  368,  369,  369,  369,
			  369,  369,  369,  369,  369,  369,  370,  370,  370,  370,
			  370,  370,  370,  370,  370,  371,  371,  371,  371,  371,

			  371,  371,  371,  371,  372,  372,  372,  372,  372,  372,
			  372,  372,  372,  374,  374,  374,  374,  374,  374,  374,
			  375,  375,  375,  376,  376,  376,  376,  376,  376,  376,
			  377,  377,  377,  377,  377,  378,  378,  378,  378,  378,
			  378,  378,  379,  379,  379,  379,  379,  380,  380,  380,
			  380,  380,  380,  380,  381,  381,  381,  381,  381,  381,
			  381,  382,  382,  382,  383,  383,  383,  383,  383,  384,
			  384,  384,  384,  384,  384,  384,  385,  385,  385,  386,
			  386,  386,  386,  386,  387,  387,  387,  387,  387,  361,
			  361,  361,  361,  361,  361,  361,  361,  361,  361,  361,

			  361,  361,  361,  361,  361,  361,  361,  361,  361,  361,
			  361,  361,  361,  361,  361,  361,  361,  361,  361,  361,
			  361,  361,  361,  361,  361,  361,  361,  361,  361,  361,
			  361,  361,  361,  361,  361,  361,  361,  361,  361,  361, yy_Dummy>>,
			1, 340, 1000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,   31,  750,   49,  748,   53,  741,   55,  741,
			 1289,   60,  725, 1289, 1289, 1289, 1289, 1289, 1289, 1289,
			  709,    0, 1289,   55, 1289, 1289, 1289, 1289,   61,   68,
			   70,   73,   75,  667, 1289, 1289,    0,   77,   80,   86,
			   92,   94,  103,  105,  107,    0, 1289,  674,  668,  674,
			 1289,  686, 1289,  119,  684,  678, 1289,  123,  665,  125,
			  661,  139,    0,  647,  115,  147,  149,  154,  156,  161,
			   87,  163,  176,  183,  190,  188,  196,  204,  217,  219,
			  232,    0,  623,  621,   40,  645,  632,  149, 1289,  617,
			  615,  188, 1289,  600,  203,  206,  198,  211,  584,  234,

			  241,  243,  248,  221,  253,  261,  263,  268,  270,  279,
			  290,  281,  292,  299,  304,  306,  563,  549,  543,   91,
			  551,  258,  315,    0,  324,  329,  335,  317,  340,  342,
			  348,  355,  371,  373,  378,  380,  385,  393,  387,  406,
			  135,  530,  521,   44,  224,  360,    0,  415,  420,  428,
			 1289,  430,  440,  446,  448,  456,  458,  466,  477,  479,
			  487,  489,  494,  173,  517,  518,  510,  331,  518,  503,
			  508,  513,  515,  520,  529,  531,  542,  544,  552,  557,
			  568,  573,  575,  580,  215,  484,  273,  471,  398,    0,
			  586,  593,  595,  601,  611,  618,  634,  627,  629,  640,

			  645,  647,  660,  654,  667,  470,  465,  459,  401,  411,
			  473,  662,  672,  681,  683,  690,  695,  572, 1289,  697,
			  704,  706,  721,  736,  714,  734,  754,  451,  409,  448,
			  419,  453,    0,  747,  749,  759,  764,  779,  782,  775,
			  777,  797,  800, 1289,  808, 1289,  801,  803,  826,  819,
			  403,  386,  390,  384,  500,    0,  821,  826,  831,  851,
			  844,  859,  852,  867, 1289,  861,  876,  869,  373,  363,
			  884,  350,  505,  328,  357,  879,  881,  896,  892,  907,
			 1289,  910,  913,  922, 1289,  915,  930,  332, 1289,  933,
			  613,  342,    0,  939, 1289,  932,  947, 1289,  940,  947,

			 1289,  415, 1289,  952,    0,  957,  959,  966,  317,  274,
			  291,  319,  620,  974,  980,  985,  300,  298,  285,  241,
			  994,    0,  218,  999, 1001, 1006,  226,  234,  227,  723,
			  213, 1011, 1013, 1036,  171,  171,  600, 1031, 1020, 1037,
			 1052,  136,  107,  117, 1046, 1048,   85,   55, 1053, 1059,
			 1061,   61,   46, 1084, 1087, 1095,  782, 1098, 1289, 1101,
			 1289, 1289, 1131, 1140, 1149, 1158, 1103, 1110, 1167, 1176,
			 1185, 1194, 1203, 1117, 1210, 1214, 1220, 1225, 1232, 1237,
			 1244, 1251, 1255, 1259, 1266, 1270, 1274, 1279, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  361,    1,  362,  362,  363,  364,  363,  365,  361,
			  361,  361,  361,  361,  361,  361,  361,  361,  361,  361,
			  366,  366,  361,  366,  361,  361,  361,  361,  367,  367,
			  367,  367,  367,  361,  361,  361,  366,  367,  367,  367,
			  367,  367,  367,  367,  367,  368,  361,  368,  368,  368,
			  361,  361,  361,  369,  361,  361,  361,  370,  361,  361,
			  361,  371,  366,  366,  366,  367,  367,  367,  367,  367,
			  361,  367,  367,  367,  367,  367,  367,  367,  367,  367,
			  367,  368,  368,  368,  368,  361,  369,  369,  361,  361,
			  370,  370,  361,  372,  361,  366,  373,  374,  361,  367,

			  367,  367,  367,  361,  367,  367,  367,  367,  367,  367,
			  367,  367,  367,  367,  367,  367,  368,  368,  368,  368,
			  366,  373,  374,  375,  367,  367,  367,  361,  367,  367,
			  367,  367,  367,  367,  367,  367,  367,  367,  367,  367,
			  368,  368,  368,  368,  366,  376,  377,  367,  367,  367,
			  361,  367,  367,  367,  367,  367,  367,  367,  367,  367,
			  367,  367,  367,  368,  368,  368,  368,  378,  377,  367,
			  367,  367,  367,  367,  367,  367,  367,  367,  367,  367,
			  367,  367,  367,  367,  368,  368,  368,  368,  378,  379,
			  367,  367,  367,  367,  367,  367,  367,  367,  367,  367,

			  367,  367,  367,  367,  367,  368,  368,  368,  368,  380,
			  379,  367,  367,  367,  367,  367,  367,  361,  361,  367,
			  367,  367,  367,  367,  367,  367,  367,  368,  368,  368,
			  368,  381,  382,  367,  367,  367,  367,  226,  226,  367,
			  367,  226,  361,  361,  361,  361,  367,  367,  361,  367,
			  368,  368,  368,  368,  381,  383,  367,  367,  367,  361,
			  367,  226,  367,  361,  361,  367,  226,  367,  368,  368,
			  368,  368,  384,  366,  383,  367,  367,  226,  367,  361,
			  361,  226,  226,  361,  361,  367,  368,  368,  361,  368,
			  384,  366,  385,  361,  361,  367,  361,  361,  367,  367,

			  361,  368,  361,  366,  386,  367,  367,  367,  368,  361,
			  366,  366,  386,  367,  367,  367,  368,  361,  361,  366,
			  366,  387,  361,  367,  367,  367,  368,  366,  366,  387,
			  361,  367,  367,  226,  368,  366,  366,  361,  367,  367,
			  361,  368,  361,  361,  367,  367,  368,  361,  361,  367,
			  367,  368,  361,  226,  226,  368,  361,  361,  361,  361,
			  361,    0,  361,  361,  361,  361,  361,  361,  361,  361,
			  361,  361,  361,  361,  361,  361,  361,  361,  361,  361,
			  361,  361,  361,  361,  361,  361,  361,  361, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
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
			   31,   32,   33,   21,   47,   35,   48,   49,   50,   21,
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
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    2,    1,    1,    1,    1,    1,    1,
			    1,    1,    3,    4,    1,    5,    1,    1,    1,    1,
			    6,    6,    6,    6,    6,    7,    6,    6,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,    6,    6,
			    8,    1,    1,    1,    9,    6,    6,    6,    6,    6,
			    6, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
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
			    0,    0,   48,    3,    4,   51,   55,   55,    0,   54,

			   54,   54,   29,    0,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   44,   44,   44,   44,
			   55,   55,   55,    0,   54,   54,   54,    0,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   44,   44,   44,   44,   51,   55,    0,   54,   54,   54,
			   52,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   44,   44,   44,   44,   55,    0,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   44,   44,   44,   44,   55,    0,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,

			   54,   54,   54,   54,   54,   44,   44,   44,   44,   55,
			    0,   54,   54,   54,   54,   54,   54,    0,   31,   54,
			   54,   54,   54,   54,   54,   54,   54,   44,   44,   44,
			   44,   55,    0,   54,   54,   28,   54,   54,   54,   54,
			   54,   54,    0,   32,    0,   36,   54,   54,   24,   54,
			   44,   44,   44,   44,   55,    0,   54,   54,   54,   22,
			   54,   54,   54,    0,   35,   54,   54,   54,   44,   44,
			   44,   44,   55,   55,    0,   26,   27,   54,   54,    0,
			   34,   54,   54,    0,   30,   54,   44,   44,   40,   44,
			   55,   55,    0,    0,   37,   54,    0,   33,   54,   54,

			   41,   44,   39,   53,    0,   54,   54,   54,   44,    0,
			   55,   55,    0,   54,   54,   54,   44,   53,    0,   55,
			   53,    0,    0,   54,   54,   54,   44,   55,   55,    0,
			    0,   54,   54,   54,   44,   53,   53,   53,   54,   54,
			   23,   44,    0,    0,   54,   54,   44,    0,   53,   54,
			   54,   44,    0,   54,   54,   44,   53,    0,   38,   25,
			   42,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 1289
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 361
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 362
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

	Init_buffer_size: INTEGER = 8192
				-- Initial size for `in_buffer'

invariant
	in_buffer_not_void: in_buffer /= Void

end
