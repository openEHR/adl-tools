%{
note
	component:   "openEHR ADL Tools"
	description: "Scanner for ADL 1.4 texts"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ADL_14_SCANNER

inherit
	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton,
			output as print_out
		end

	ADL_14_TOKENS
		export
			{NONE} all
		end

	UT_CHARACTER_CODES
		export
			{NONE} all
		end

create
	make
%}

--------------- Definitions --------------
ALPHANUM [a-zA-Z0-9]
ALPHANUM_STR [a-zA-Z0-9_]+
VALUE_STR [a-zA-Z0-9._\-]+
IDCHAR [a-zA-Z0-9_]
NAMECHAR [a-zA-Z0-9._\-]
NAMESTR ([a-zA-Z][a-zA-Z0-9_]+)
ID_CODE_LEADER id
DOTTED_NUMERIC_STR	[0-9]+\.[0-9]+(\.[0-9]+)*

--------------- Options --------------
%x IN_ODIN_SECTION IN_CADL_SECTION IN_ASSERTION_SECTION
%option outfile="adl_14_scanner.e"

%%

----------/** Separators **/----------------------------------------------------

[ \t\r]+		-- Ignore separators
\n+				in_lineno := in_lineno + text_count


----------/** comments **/-----------------------------------------------

"--".*				-- Ignore comments
"--".*\n[ \t\r]*	in_lineno := in_lineno + 1


----------/* symbols */ -------------------------------------------------
"-"			last_token := Minus_code
"+"			last_token := Plus_code
"*"			last_token := Star_code
"/"			last_token := Slash_code
"^"			last_token := Caret_code
"="			last_token := Equal_code
"."			last_token := Dot_code
";"			last_token := Semicolon_code
","			last_token := Comma_code
":"			last_token := Colon_code
"!"			last_token := Exclamation_code
"("			last_token := Left_parenthesis_code
")"			last_token := Right_parenthesis_code
"$"			last_token := Dollar_code
"?"			last_token := Question_mark_code

"["			last_token := Left_bracket_code
"]"			last_token := Right_bracket_code

----------/* keywords */ -------------------------------------------------

^[Aa][Rr][Cc][Hh][Ee][Tt][Yy][Pp][Ee][ \t\r\n]+ 		{
				last_token := SYM_ARCHETYPE
			}

[Aa][Dd][Ll]_[Vv][Ee][Rr][Ss][Ii][Oo][Nn] 		{
				last_token := SYM_ADL_VERSION
			}

[Cc][Oo][Nn][Nn][Tt][Rr][Oo][Ll][Ll][Ee][Dd] 		{
				last_token := SYM_IS_CONTROLLED
			}

[Gg][Ee][Nn][Ee][Rr][Aa][Tt][Ee][Dd] 		{
				last_token := SYM_IS_GENERATED
			}

[Uu][Ii][Dd] 		{
				last_token := SYM_UID
			}

^[Ss][Pp][Ee][Cc][Ii][Aa][Ll][Ii][SsZz][Ee][ \t\r]*\n 	{
				last_token := SYM_SPECIALIZE
				in_lineno := in_lineno + 1
			}


^[Cc][Oo][Nn][Cc][Ee][Pp][Tt][ \t\r]*\n 				{
				last_token := SYM_CONCEPT
				in_lineno := in_lineno + 1
			}

^[Ll][Aa][Nn][Gg][Uu][Aa][Gg][Ee][ \t\r]*\n 	{
				last_token := SYM_LANGUAGE
				set_start_condition(IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				language_text_start_line := in_lineno
			}

^[Dd][Ee][Ss][Cc][Rr][Ii][Pp][Tt][Ii][Oo][Nn][ \t\r]*\n	{
				last_token := SYM_DESCRIPTION
				set_start_condition(IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				description_text_start_line := in_lineno
			}

^[Dd][Ee][Ff][Ii][Nn][Ii][Tt][Ii][Oo][Nn][ \t\r]*\n		{
				last_token := SYM_DEFINITION
				set_start_condition(IN_CADL_SECTION)
				in_lineno := in_lineno + 1
				definition_text_start_line := in_lineno
			}

^[Ii][Nn][Vv][Aa][Rr][Ii][Aa][Nn][Tt][ \t\r]*\n	{
				last_token := SYM_INVARIANT
				set_start_condition(IN_ASSERTION_SECTION)
				in_lineno := in_lineno + 1
				invariant_text_start_line := in_lineno
			}

^[Oo][Nn][Tt][Oo][Ll][Oo][Gg][Yy][ \t\r]*\n			{
				last_token := SYM_ONTOLOGY
				set_start_condition(IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				terminology_text_start_line := in_lineno
			}

^[Aa][Nn][Nn][Oo][Tt][Aa][Tt][Ii][Oo][Nn][Ss][ \t\r]*\n			{
				last_token := SYM_ANNOTATIONS
				set_start_condition(IN_ODIN_SECTION)
				in_lineno := in_lineno + 1
				annotations_text_start_line := in_lineno
			}

<IN_ODIN_SECTION>{
	^[Dd][Ee][Ss][Cc][Rr][Ii][Pp][Tt][Ii][Oo][Nn][ \t\r]*\n	|
	^[Dd][Ee][Ff][Ii][Nn][Ii][Tt][Ii][Oo][Nn][ \t\r]*\n |
	^[Aa][Nn][Nn][Oo][Tt][Aa][Tt][Ii][Oo][Nn][Ss][ \t\r]*\n	{ -- line starting with any keyword that can appear after an ODIN section
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

				set_start_condition(INITIAL)
			}
	\n 		{ -- LF
				in_buffer.append_character('%N')
				in_lineno := in_lineno + 1
			}
	[^\n]+ { -- any text on line with no LF
				in_buffer.append_string(text)
			}
	<<EOF>> {
				-- get the ODIN section sorted out
				last_token := V_ODIN_TEXT
				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_
				set_start_condition(INITIAL)
			}
}

<IN_CADL_SECTION>{
	^[ \t]+[^\n]*\n {
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	}

	\n+			in_lineno := in_lineno + text_count

	^[^ \t] { -- non-white space at start
				unread_character(text.item(1))
				last_token := V_CADL_TEXT
				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_
				set_start_condition(INITIAL)
	}
}

<IN_ASSERTION_SECTION>{
	^[ \t]+[^\n]*\n {			-- match ^whitespace <anything> \n
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	}

	\n+				in_lineno := in_lineno + text_count

	^[^ \t] { -- non-white space at start
				unread_character(text.item(1))
				last_token := V_ASSERTION_TEXT
				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_
				set_start_condition(INITIAL)
	}
}

----------/* V_DOTTED_NUMERIC any length of n.n.n... with at least 2 segments */ -------------------------------------------------
{DOTTED_NUMERIC_STR} {
					last_token := V_DOTTED_NUMERIC
					last_string_value := text_substring (1, text_count)
			}

----------/* term code reference */ -------------------------------------------------
\[{ID_CODE_LEADER}1(\.1)*\] {
					last_token := V_CONCEPT_CODE
					last_string_value := text_substring (2, text_count - 1)
			}

----------/* archetype id */ -------------------------------------------------
({NAMESTR}(\.{ALPHANUM_STR})*::)?{NAMESTR}-{ALPHANUM_STR}-{NAMESTR}\.{NAMESTR}(-{ALPHANUM_STR})*\.v[0-9]+((\.[0-9]+){0,2}((-rc|\+u|\+)[0-9]+)?)? {
					last_token := V_ARCHETYPE_ID
					last_string_value := text
			}

----------/* identifiers (used in meta-data section after 'archetype' or other keyword) */ -------------------------------------------------
{NAMESTR}	{
					last_token := V_IDENTIFIER
					last_string_value := text
			}

----------/* values (used in meta-data section after 'archetype' or other keyword) */ -------------------------------------------------
{VALUE_STR}	{
					last_token := V_VALUE
					last_string_value := text
			}

--------------------------------------------------------------------------------
<<EOF>>			terminate
(.|\n)			-- ignore unmatched chars


%%

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

	invariant_text_start_line: INTEGER

	terminology_text_start_line: INTEGER

	annotations_text_start_line: INTEGER

feature {NONE} -- Constants

	Init_buffer_size: INTEGER = 8192
				-- Initial size for `in_buffer'

end
