%{
indexing
	component:   "openEHR Archetype Project"
	description: "Scanner for Object Graph PathS"
	keywords:    "OG_PATH scanner"
	author:      "Thomas Beale <thomas@deepthought.com.au>"
	support:     "Deep Thought Informatics <support@deepthought.com.au>"
	copyright:   "Copyright (c) 2003, 2004 Deep Thought Informatics Pty Ltd"
	license:     "The Eiffel Forum Open Source License version 1"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

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

creation

	make
%}

%x IN_STR
%option nodefault outfile="og_path_scanner.e"

%%

----------/* symbols */ -------------------------------------------------
"."			last_token := Dot_code
"/"			last_token := Slash_code

"["			last_token := Left_bracket_code
"]"			last_token := Right_bracket_code

"//"			last_token := SYM_MOVABLE_LEADER

----------/* term code reference */ -------------------------------------------------
\[[a-zA-Z0-9][a-zA-Z0-9._\-]*\]	{
					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			}

----------/* identifiers */ -------------------------------------------------
[A-Z][a-zA-Z0-9_]*	{
					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			}

[a-z][a-zA-Z0-9_]*	{
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
<IN_STR>\\\\		in_buffer.append_character ('\')
<IN_STR>\\\"		in_buffer.append_character ('"')
<IN_STR>&[a-zA-Z][a-zA-Z0-9_]*;	{	-- match ISO special character pattern &char_name;
				-- look up the code in an ISO table
				-- if a valid code then
				-- 	convert to actual character?
				--	in_buffer.append_character (converted character)
				-- else
				--	last_token := ERR_STRING
				--	set_start_condition (INITIAL)
				-- end
			
				-- current simple approach: just copy the pattern into the buffer
				--
				in_buffer.append_string (text)
			}
<IN_STR>&#x([a-fA-F0-9_]){4};	{	-- match W3C XML special character pattern &#xHHHH;
				-- look up the code in an W3C table
				-- if a valid code then
				-- 	convert to actual character?
				--	in_buffer.append_character (converted character)
				-- else
				--	last_token := ERR_STRING
				--	set_start_condition (INITIAL)
				-- end
			
				-- current simple approach: just copy the pattern into the buffer
				--
				in_buffer.append_string (text)
			}
<IN_STR>[^\\\n"]+		in_buffer.append_string (text)
<IN_STR>\\\n[ \t\r]*	in_lineno := in_lineno + 1	-- match LF in line
<IN_STR>[^\n"]*\"	{						-- match final end of string
				last_token := V_STRING
				if text_count > 1 then
					in_buffer.append_string (text_substring (1, text_count - 1))
				end
				str_ := STRING_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_any_value := str_
				set_start_condition (INITIAL)
			}
<IN_STR>.|\n			|
<IN_STR><<EOF>>	{	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
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
