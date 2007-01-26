%{
indexing
	component:   "openEHR Archetype Project"
	description: "Scanner for ADL syntax items"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas@deepthought.com.au>"
	support:     "Deep Thought Informatics <support@deepthought.com.au>"
	copyright:   "Copyright (c) 2003-2005 Ocean Informatics Pty Ltd"
	license:     "Mozilla tri-license"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

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

creation

	make
%}

%x IN_DADL_SECTION IN_CADL_SECTION IN_ASSERTION_SECTION
%option outfile="adl_scanner.e"

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

^[Aa][Rr][Cc][Hh][Ee][Tt][Yy][Pp][Ee][ \t\r]* 		{
				last_token := SYM_ARCHETYPE
			}

[Aa][Dd][Ll]_[Vv][Ee][Rr][Ss][Ii][Oo][Nn] 		{
				last_token := SYM_ADL_VERSION
			}

[Cc][Oo][Nn][Nn][Tt][Rr][Oo][Ll][Ll][Ee][Dd] 		{
				last_token := SYM_IS_CONTROLLED
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
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				language_text_start_line := in_lineno
			}

^[Dd][Ee][Ss][Cc][Rr][Ii][Pp][Tt][Ii][Oo][Nn][ \t\r]*\n	{
				last_token := SYM_DESCRIPTION
				set_start_condition(IN_DADL_SECTION)
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
				set_start_condition(IN_DADL_SECTION)
				in_lineno := in_lineno + 1
				ontology_text_start_line := in_lineno
			}

<IN_DADL_SECTION>{
	^[Dd][Ee][Ss][Cc][Rr][Ii][Pp][Tt][Ii][Oo][Nn][ \t\r]*\n	|
	^[Dd][Ee][Ff][Ii][Nn][Ii][Tt][Ii][Oo][Nn][ \t\r]*\n { -- line starting with "definition" or "description"
				-- unread the pattern just matched
				a_text := text
				from i := text_count until i < 1 loop
					unread_character (a_text.item (i))
					i := i - 1
				end

				-- get the dADL section sorted out
				last_token := V_DADL_TEXT
				str_ := STRING_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_

				set_start_condition(INITIAL)
			}
	[^\n]+\n { -- any text on line with a LF
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
			}
	[^\n]+ { -- any text on line with no LF
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
			}
	<<EOF>> {
				-- get the dADL section sorted out
				last_token := V_DADL_TEXT
				str_ := STRING_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_
				set_start_condition(INITIAL)
			}
	(.|\n) {
		-- ignore unmatched chars
	}
}

<IN_CADL_SECTION>{
	^[ \t]+[^\n]*\n {
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	}
	\n+				in_lineno := in_lineno + text_count

	^[^ \t] { -- non-white space at start
				unread_character(text.item(1))
				last_token := V_CADL_TEXT
				str_ := STRING_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_
				set_start_condition(INITIAL)
	}
}

<IN_ASSERTION_SECTION>{
	^[ \t]+[^\n]*\n {
				in_buffer.append_string(text)
				in_lineno := in_lineno + 1
	}
	^[^ \t] { -- non-white space at start
				unread_character(text.item(1))
				last_token := V_ASSERTION_TEXT
				str_ := STRING_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_
				set_start_condition(INITIAL)
	}
}

----------/* V_VERSION_STRING */ -------------------------------------------------
[0-9]+\.[0-9]+(\.[0-9]+)* {
					last_token := V_VERSION_STRING
					last_string_value := text_substring (1, text_count)
			}

----------/* term code reference */ -------------------------------------------------
\[[a-zA-Z0-9][a-zA-Z0-9._\-]*\]	{
					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			}

----------/* archetype id */ -------------------------------------------------
[a-zA-Z][a-zA-Z0-9_-]+\.[a-zA-Z][a-zA-Z0-9_-]+\.[a-zA-Z0-9]+	{
					last_token := V_ARCHETYPE_ID
					last_string_value := text
			}

----------/* identifiers */ -------------------------------------------------
[a-zA-Z][a-zA-Z0-9_]*	{
					last_token := V_IDENTIFIER
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

	make is
			-- Create a new scanner.
		do
			make_compressed_scanner_skeleton
			in_buffer := string_.make (Init_buffer_size)
			in_lineno := 1
		end

feature -- Initialization

	reset is
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

feature {NONE} -- Constants

	Init_buffer_size: INTEGER is 256
				-- Initial size for `in_buffer'

invariant

	in_buffer_not_void: in_buffer /= Void

end
