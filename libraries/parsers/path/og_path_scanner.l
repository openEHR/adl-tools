%{
note
	component:   "openEHR Archetype Project"
	description: "Scanner for Object Graph PathS"
	keywords:    "OG_PATH scanner"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class OG_PATH_SCANNER

inherit
	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton,
			output as print_out
		end

	OG_PATH_TOKENS
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
%}

--------------- Definitions --------------
ALPHANUM [a-zA-Z0-9]
IDCHAR [a-zA-Z0-9_]
NAMECHAR [a-zA-Z0-9._\-]
NAMECHAR_SPACE [a-zA-Z0-9._\- ]
NAMECHAR_PAREN [a-zA-Z0-9._\-()]

UTF8CHAR (([\xC2-\xDF][\x80-\xBF])|(\xE0[\xA0-\xBF][\x80-\xBF])|([\xE1-\xEF][\x80-\xBF][\x80-\xBF])|(\xF0[\x90-\xBF][\x80-\xBF][\x80-\xBF])|([\xF1-\xF7][\x80-\xBF][\x80-\xBF][\x80-\xBF]))

--------------- Options ------------
%x IN_STR
%option outfile="og_path_scanner.e"

%%

----------/* symbols */ -------------------------------------------------
"."			last_token := Dot_code
"/"			last_token := Slash_code

"["			last_token := Left_bracket_code
"]"			last_token := Right_bracket_code

"("			last_token := Left_parenthesis_code
")"			last_token := Right_parenthesis_code

"//"			last_token := SYM_MOVABLE_LEADER

----------/* term code reference */ -------------------------------------------------
\[{ALPHANUM}{NAMECHAR}*\]	{
					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			}

----------/* any predicate expression (i.e. [] Xpath expression), currently not internally parsed */ ------------
\[[^\\\[\\\]]+\]	{
					last_token := V_ANY_PREDICATE
					last_string_value := text_substring (2, text_count - 1)
			}

----------/* identifiers */ -------------------------------------------------
[a-z]{IDCHAR}*	{
					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			}

----------/* strings */ -------------------------------------------------
\"[^\\\n"]*\" 	{
				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			}

\"[^\\\n"]*		{				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			}

<IN_STR> {
	\\\\		in_buffer.append_character ('\')

	\\\"		in_buffer.append_character ('"')

	{UTF8CHAR}+ {
				in_buffer.append_string (text)
	}

	[^\\\n"]+		in_buffer.append_string (text)

	\n[ \t\r]*	{
				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			}

	[^\\\n"]*\"	{						-- match final end of string
				last_token := V_STRING

				if text_count > 1 then
					in_buffer.append_string (text_substring (1, text_count - 1))
				end

				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_
				set_start_condition (INITIAL)
			}
	.|\n			|

	<<EOF>>	{	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			}
}

--------------------------------------------------------------------------------
<<EOF>>			terminate
.				;


%%

feature {NONE} -- Local variables

	i_, nb_: INTEGER
	char_: CHARACTER
	str_: STRING
	code_: INTEGER

feature {NONE} -- Initialization

	make
			-- Create a new scanner.
		do
			make_compressed_scanner_skeleton
			create in_buffer.make (Init_buffer_size)
			in_lineno := 1
			create str_.make_empty
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
			-- Buffer for lexical tokens

	in_lineno: INTEGER
			-- Current line number

	is_operator: BOOLEAN
			-- Parsing an operator declaration?

feature {NONE} -- Constants

	Init_buffer_size: INTEGER = 256
				-- Initial size for `in_buffer'

invariant
	in_buffer_not_void: in_buffer /= Void

end
