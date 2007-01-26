%{
indexing
	component:   "openEHR Archetype Project"
	description: "Scanner for dADL syntax items"
	keywords:    "ADL, dADL"
	
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class DADL_SCANNER

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton,
			output as print_out
		end

	DADL_TOKENS
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

--------------- Definitions --------------
ALPHANUM [a-zA-Z0-9]
IDCHAR [a-zA-Z0-9_]
NAMECHAR [a-zA-Z0-9._\-]
NAMECHAR_SPACE [a-zA-Z0-9._\- ]
NAMECHAR_PAREN [a-zA-Z0-9._\-()]

UTF8CHAR (([\xC2-\xDF][\x80-\xBF])|(\xE0[\xA0-\xBF][\x80-\xBF])|([\xE1-\xEF][\x80-\xBF][\x80-\xBF])|(\xF0[\x90-\xBF][\x80-\xBF][\x80-\xBF])|([\xF1-\xF7][\x80-\xBF][\x80-\xBF][\x80-\xBF]))

---------------- Options -----------------
%x IN_STR IN_CADL_BLOCK
%option position outfile="dadl_scanner.e"

%%

----------/** Separators **/----------------------------------------------------

[ \t\r]+		-- Ignore separators
\n+			in_lineno := in_lineno + text_count


----------/** comments **/-----------------------------------------------

"--".*				-- Ignore comments
"--".*\n[ \t\r]*	in_lineno := in_lineno + 1


----------/* symbols */ -------------------------------------------------
"-"			last_token := Minus_code
"+"			last_token := Plus_code
"*"			last_token := Star_code
"/"			last_token := Slash_code
"^"			last_token := Caret_code
"."			last_token := Dot_code
";"			last_token := Semicolon_code
","			last_token := Comma_code
":"			last_token := Colon_code
"!"			last_token := Exclamation_code
"("			last_token := Left_parenthesis_code
")"			last_token := Right_parenthesis_code
"$"			last_token := Dollar_code
"??"			last_token := SYM_DT_UNKNOWN
"?"			last_token := Question_mark_code

"|"		{
			if in_interval then
				in_interval := False
			elseif start_block_received then
				in_interval := True
				start_block_received := False
			end
			last_token := SYM_INTERVAL_DELIM
		}

"["			last_token := Left_bracket_code
"]"			last_token := Right_bracket_code

"="			last_token := SYM_EQ

">="			last_token := SYM_GE
"<="			last_token := SYM_LE

"<"		{
			if in_interval then
				last_token := SYM_LT
				start_block_received := False
			else
				last_token := SYM_START_DBLOCK
				start_block_received := True
			end
		}

">"		{
			if in_interval then
				last_token := SYM_GT
			else
				last_token := SYM_END_DBLOCK
			end
		}

".."			last_token := SYM_ELLIPSIS
"..."			last_token := SYM_LIST_CONTINUE

----------/* keywords */ -------------------------------------------------

[Tt][Rr][Uu][Ee]							last_token := SYM_TRUE

[Ff][Aa][Ll][Ss][Ee] 						last_token := SYM_FALSE

[Ii][Nn][Ff][Ii][Nn][Ii][Tt][Yy]			last_token := SYM_INFINITY

-- FIXME: query syntax is obsolete from 01/jun/2005; remove when backward compatibility no longer needed
[Qq][Uu][Ee][Rr][Yy]					 	last_token := SYM_QUERY_FUNC

----------/* URI */ -------------------------------------------------
[a-z]+:\/\/[^<>|\\{}^~"\[\] ]*	{
	last_token := V_URI
	last_string_value := text
}

----------/* term code reference of form [ICD10AM(1998)::F23] */ -------------------------------------------------
\[{NAMECHAR_PAREN}+::{NAMECHAR}+\]	{
					last_token := V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			}

\[{NAMECHAR_PAREN}+::{NAMECHAR_SPACE}+\]	{
					last_token := ERR_V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			}

\[{ALPHANUM}{NAMECHAR}*\]	{
					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			}

----------/* local code definition */ -------------------------------------------------
a[ct][0-9.]+		{
					last_token := V_LOCAL_CODE
					last_string_value := text
			}

----------/* V_ISO8601_DATE_TIME YYYY-MM-DDThh:mm:ss[,sss][Z|+/-nnnn] */ -------------------------------------------------

[0-9]{4}-[0-1][0-9]-[0-3][0-9]T[0-2][0-9]:[0-6][0-9]:[0-6][0-9](,[0-9]+)?(Z|[+-][0-9]{4})? |
[0-9]{4}-[0-1][0-9]-[0-3][0-9]T[0-2][0-9]:[0-6][0-9](Z|[+-][0-9]{4})? |
[0-9]{4}-[0-1][0-9]-[0-3][0-9]T[0-2][0-9](Z|[+-][0-9]{4})? {
				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		}

----------/* V_ISO8601_TIME Thh:mm:ss[,sss][Z|+/-nnnn] */ -------------------------------------------------

[0-2][0-9]:[0-6][0-9]:[0-6][0-9](,[0-9]+)?(Z|[+-][0-9]{4})? |
[0-2][0-9]:[0-6][0-9](Z|[+-][0-9]{4})? {
				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		}

----------/* V_ISO8601_DATE YYYY-MM-DD */ -------------------------------------------------

[0-9]{4}-[0-1][0-9]-[0-3][0-9] |
[0-9]{4}-[0-1][0-9] {
				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		}

----------/* V_ISO8601_DURATION PnYnMnWnDtnnHnnMnnS */ -------------------------------------------------

-- here we allow a deviation from the standard to allow weeks to be mixed in with the rest
-- since this commonly occurs in medicine

P([0-9]+[yY])?([0-9]+[mM])?([0-9]+[wW])?([0-9]+[dD])?T([0-9]+[hH])?([0-9]+[mM])?([0-9]+[sS])? |
P([0-9]+[yY])?([0-9]+[mM])?([0-9]+[wW])?([0-9]+[dD])? {
				last_token := V_ISO8601_DURATION
				last_string_value := text
			}

----------/* identifiers */ -------------------------------------------------
[A-Z]{IDCHAR}*	{
					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			}

[A-Z]{IDCHAR}*<[a-zA-Z0-9,_<>]+>	{
					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			}

[a-z]{IDCHAR}*	{
					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			}


----------/* CADL Blocks */ -------------------------------------------------
\{[^{}]*		{				-- beginning of CADL block
				in_buffer.append_string (text)
				set_start_condition (IN_CADL_BLOCK)
				cadl_depth := 1
			}

<IN_CADL_BLOCK> {
	\{[^{}]*		{		-- got an open brace
				in_buffer.append_string (text)
				cadl_depth := cadl_depth + 1
			}
	[^{}]*\}		{		-- got a close brace
				in_buffer.append_string (text)
				cadl_depth := cadl_depth - 1
				if cadl_depth = 0 then
					set_start_condition (INITIAL)
					last_token := V_CADL_BLOCK
					create last_string_value.make(in_buffer.count)
					last_string_value.append(in_buffer)
					in_lineno := in_lineno + in_buffer.occurrences('%N')
					in_buffer.wipe_out
				end
			}
}


----------/* integers */ -------------------------------------------------

[0-9]+		|
[0-9]+[eE][+-]?[0-9]+		{
					last_token := V_INTEGER
					last_integer_value := text.to_integer
			}

----------/* reals */ -------------------------------------------------

[0-9]+\.[0-9]+				|
[0-9]+\.[0-9]+[eE][+-]?[0-9]+		{
						last_token := V_REAL
						last_real_value := text.to_real
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
				str_ := STRING_.make (in_buffer.count)
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


----------/* characters */ -------------------------------------------------
\'[^\\\n']\'			last_token := V_CHARACTER; last_character_value := text_item (2)
-- \'{UTF8CHAR}\'			last_token := V_CHARACTER; last_character_value := text.to_character
\'\\n\'				last_token := V_CHARACTER; last_character_value := '%N'
\'\\r\'				last_token := V_CHARACTER; last_character_value := '%R'
\'\\t\'				last_token := V_CHARACTER; last_character_value := '%T'
\'\\'\'				last_token := V_CHARACTER; last_character_value := '%''
\'\\\\'				last_token := V_CHARACTER; last_character_value := '%H'

\'.{1,2}			|
\'\\[0-9]+(\/)?	last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)

--------------------------------------------------------------------------------
<<EOF>>			terminate
.				;


%%

feature {NONE} -- Local variables

	i_, nb_: INTEGER
	char_: CHARACTER
	str_: STRING
	code_: INTEGER

	cadl_depth: INTEGER

	in_interval: BOOLEAN

	start_block_received: BOOLEAN

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
			-- Buffer for lexical tokens

	in_lineno: INTEGER
			-- Current line number

	is_operator: BOOLEAN
			-- Parsing an operator declaration?

feature {NONE} -- Constants

	Init_buffer_size: INTEGER is 256
				-- Initial size for `in_buffer'

invariant

	in_buffer_not_void: in_buffer /= Void

end
