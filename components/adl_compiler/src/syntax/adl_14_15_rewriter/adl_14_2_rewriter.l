%{
note
	component:   "openEHR ADL Tools"
	description: "Stream rewriter for ADL 1.4 and transitional ADL 1.5 archetypes containing old style 0-filled at- and ac-codes"
	keywords:    "transformation, archetype"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- openEHR Foundation <http://www.openehr.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ADL_14_2_REWRITER

inherit
	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton,
			output as print_out
		end

	ADL_14_TERM_CODE_TOOLS
		export
			{NONE} all
		end

	ADL_2_TERM_CODE_TOOLS
		export
			{NONE} all
		end

	SHARED_ADL_APP_RESOURCES
		export
			{NONE} all
		end

create
	make
%}

--------------- Definitions --------------
ALPHANUM [a-zA-Z0-9]
ALPHANUM_STR [a-zA-Z0-9_]+
IDCHAR [a-zA-Z0-9_]
NAMECHAR [a-zA-Z0-9._\-]
NAMECHAR_SPACE [a-zA-Z0-9._\- ]
NAMECHAR_PAREN [a-zA-Z0-9._\-()]
NAMESTR [a-zA-Z][a-zA-Z0-9_]+
UTF8CHAR (([\xC2-\xDF][\x80-\xBF])|(\xE0[\xA0-\xBF][\x80-\xBF])|([\xE1-\xEF][\x80-\xBF][\x80-\xBF])|(\xF0[\x90-\xBF][\x80-\xBF][\x80-\xBF])|([\xF1-\xF7][\x80-\xBF][\x80-\xBF][\x80-\xBF]))

WHITESPACE_LF [ \t\r\n]+
WHITESPACE [ \t\r]+
WHITESPACE_LF_CHAR [ \t\r\n]
WHITESPACE_CHAR [ \t\r]

ADL_14_AT_CODE at(0|[0-9]{4})(\.(0|[1-9][0-9]*))*
NON_ADL_14_AT_CODE [^a][^t]
ADL_14_AC_CODE ac(0|[0-9]{4})(\.(0|[1-9][0-9]*))*
ADL_14_PATH_SEG [a-z][a-zA-Z0-9_]*(\[at(0|[0-9]{4})(\.(0|[1-9][0-9]*))*\])?

ARCHETYPE_ID ({NAMESTR}(\.{ALPHANUM_STR})*::)?{NAMESTR}-{ALPHANUM_STR}-{NAMESTR}\.{NAMESTR}(-{ALPHANUM_STR})*\.v[0-9]+((\.[0-9]+){2}((-rc|\+u|\+)[0-9]+))?

--------------- Options --------------
%x IN_ADL_VALUE_SET_DEF IN_VALUE_SET_DEF IN_STR IN_TUPLE IN_PATH
%option outfile="adl_14_2_rewriter.e"

%%

----------/** Free Separators **/----------------------------------------------------

{WHITESPACE_LF}		out_buffer.append (text)

[ \t]*\-\-[^\n]*\n	out_buffer.append (text)			-- pass separate comment line endings


----------/** Keywords **/----------------------------------------------------
^[Oo][Nn][Tt][Oo][Ll][Oo][Gg][Yy]{WHITESPACE_CHAR}*\n			{
		out_buffer.append (text)
		in_terminology := True
	}

^{ALPHANUM_STR}{WHITESPACE_CHAR}*\n			{
		out_buffer.append (text)
	}

---------/* normal codes in definition section */ ------------

\[at0000(\.1)*\] {
		out_buffer.append_character ('[')
		output_new_id_code (text_substring (2, text_count - 1))
		out_buffer.append_character (']')
	}

\[{ADL_14_AT_CODE}\] {
		out_buffer.append_character ('[')
		output_new_id_code (text_substring (2, text_count - 1))
		out_buffer.append_character (']')
	}

-- pattern for use_archetype of form [at0012, archetype_id]
\[{ADL_14_AT_CODE}{WHITESPACE_CHAR}*,{WHITESPACE_CHAR}*{ARCHETYPE_ID}\] {
		str_ := text
		out_buffer.append_character ('[')
		new_code_str := str_.substring (2, str_.index_of (',', 1) - 1)
		new_code_str.right_adjust
		output_new_id_code (new_code_str)
		out_buffer.append (str_.substring (str_.index_of (',', 1), str_.count))
	}

\[{ADL_14_AC_CODE}\] {
		out_buffer.append_character ('[')
		output_new_value_set_code (text_substring (2, text_count - 1))
		out_buffer.append_character (']')
	}

\[{ARCHETYPE_ID}\] {
		out_buffer.append (text)
	}

---------/* ADL codes in ODIN strings */ ------------

\[\"at0000(\.1)*\"\] {
		output_converted_code_dt_key (text_substring (3, text_count - 2))
	}

\[\"{ADL_14_AT_CODE}\"\] {
		output_converted_code_dt_key (text_substring (3, text_count - 2))
	}

\[\"{ADL_14_AC_CODE}\"\] {
		output_converted_code_dt_key (text_substring (3, text_count - 2))
	}

---------/* tuples */ ------------
\[{ALPHANUM_STR}[ \t]*(,[ \t]*{ALPHANUM_STR})+\][ \t]* {
		out_buffer.append (text)
	}

\[[ \t]*\{	{		-- match [{
		out_buffer.append (text)
		set_start_condition (IN_TUPLE)
	}

<IN_TUPLE> {
	\"[^\\\n"]*\"([ \t]*,[ \t]*\"[^\\\n"]*\")* 	{ 		-- strings and lists of strings
		out_buffer.append (text)
	}

	\}[ \t]*,[ \t]*\{		{ 							-- interior }, { pattern
		out_buffer.append (text)
	}

	[0-9.=|<>]+([ \t]*,[ \t]*[0-9.=|<>]+)*	{			-- numbers and lists of numbers and symbols (e.g. in intervals)
		out_buffer.append (text)
	}

	\[local::{ADL_14_AT_CODE}\] {						-- ADL codes
		out_buffer.append ("[local::")
		output_new_value_code (text_substring (9, text_count-1))
		out_buffer.append_character (']')
	}

	\[{ALPHANUM_STR}::{ALPHANUM_STR}\] {				-- other codes
		out_buffer.append (text)
	}

	\-\-[^\n]*\n	out_buffer.append (text)			-- pass separate comment lines

	\[[ \t]*\{	{										-- match [{
		out_buffer.append (text)
	}

	\}[ \t]*\],[ \t]*(\-\-[^\n]*)?\n {						-- termination of interior tuple line }],\n with optional comment
		out_buffer.append (text)
		set_start_condition (INITIAL)
	}

	\}[ \t]*\][ \t]*(\-\-[^\n]*)?\n {						-- termination of final tuple line }]\n with optional comment
		out_buffer.append (text)
		set_start_condition (INITIAL)
	}

	.|\n	|
	<<EOF>>	{	-- Catch-all rules (no backing up)
				set_start_condition (INITIAL)
	}
}

---------/* V_VALUE_SET_DEF of form */ ------------
-- [local::code, -- comment
--	     	  code, -- comment
--			  code] -- comment
--
-- Form with assumed value
-- [local:: -- comment
--			  code; -- comment
--			  code] -- an optional assumed value
--

-- single line version
\[local::{ADL_14_AT_CODE}\] {						-- ADL codes
	out_buffer.append ("[local::")
	output_new_value_code (text_substring (9, text_count-1))
	out_buffer.append_character (']')
}

\[local::[ \t]*	{
		out_buffer.append (text)
		set_start_condition (IN_ADL_VALUE_SET_DEF)
	}

<IN_ADL_VALUE_SET_DEF> {
	{ADL_14_AT_CODE} { -- match second last line with ';' termination (assumed value)
		output_new_value_code (text)
	}

	[ \r\n\t,;]+	out_buffer.append (text)
	
	-- pass comment lines
	\-\-[^\n]*\n	out_buffer.append (text)

	\] 			{
		out_buffer.append (text)
		set_start_condition (INITIAL)
	}

	.|\n	|
	<<EOF>>	{	-- Catch-all rules (no backing up)
				set_start_condition (INITIAL)
	}
}

---------/* terminology codes in terminology bindings */ ------------

\[{NAMECHAR_PAREN}+::{NAMECHAR}+\] { 
		if in_terminology then
			create term_code.make_from_string (text.substring (2, text_count - 1))
			out_buffer.append (uri_for_terminology_code (term_code))
		else
			out_buffer.append (text)
		end
	}

---------/* V_VALUE_SET_DEF of non-local codes */ ------------
-- [terminology_id::code, -- comment
--		   	  code, -- comment
--			  code] -- comment
--
-- Form with assumed value
-- [terminology_id:: -- comment
--			  code; -- comment
--			  code] -- an optional assumed value
--

-- single line version
\[{NAMECHAR_PAREN}+::{NAMECHAR}+\]*	{
		out_buffer.append (text)
		set_start_condition (IN_VALUE_SET_DEF)
	}

\[{NAMECHAR_PAREN}+::[ \t]*	{
		out_buffer.append (text)
		set_start_condition (IN_VALUE_SET_DEF)
	}

<IN_VALUE_SET_DEF> {
	{NAMECHAR}+ { 
		out_buffer.append (text)
	}

	[ \r\n\t,;]+[ \t]*	{
		out_buffer.append (text)
	}
	
	-- pass comment lines
	\-\-[^\n]*\n	out_buffer.append (text)

	\] 			{
		out_buffer.append (text)
		set_start_condition (INITIAL)
	}

	.|\n	|
	<<EOF>>	{	-- Catch-all rules (no backing up)
				set_start_condition (INITIAL)
	}
}

----------/* paths */ -------------------------------------------------
\/	{
	out_buffer.append (text)
	set_start_condition (IN_PATH)
}

\[\"\/	{
	out_buffer.append (text)
	set_start_condition (IN_PATH)
}

<IN_PATH> {
	{ALPHANUM_STR} { 
		out_buffer.append (text)
	}

	\[{ADL_14_AT_CODE}\] { 
		out_buffer.append_character ('[')
		output_new_id_code (text_substring (2, text_count - 1))
		out_buffer.append_character (']')
	}

	\/	{
		out_buffer.append (text)
	}

	{WHITESPACE_LF_CHAR}	{
		out_buffer.append (text)
		set_start_condition (INITIAL)
	}

	\"\]	{
		out_buffer.append (text)
		set_start_condition (INITIAL)
	}
}

---------/* DT key patterns starting with [" */ ------------

\[\"{NAMECHAR_PAREN}+\"\]		 out_buffer.append (text)

\[\"[^\]\r\t\n"]+\"\]		 out_buffer.append (text)

----------/* regex character classes */ ---------------------------------------------
-- good enough matcher for character classes found in regexes found in ADL 1.4
--

\[[^\]\[\r\n]+\] {
		out_buffer.append (text)
	}


----------/* ADL 1.5 archetype id */ -------------------------------------------------
{ARCHETYPE_ID} {
		out_buffer.append (text)
	}

----------/* strings */ -------------------------------------------------
\"{ADL_14_AT_CODE}\" {			-- can occur in some string data
		out_buffer.append_character ('"')
		output_new_value_code (text_substring (2, text_count - 1))
		out_buffer.append_character ('"')
	}

\"[^\\\n"]*\" 	{
		out_buffer.append (text)
	}

\"[^\\\n"]*		{				-- beginning of a string
		out_buffer.append (text)
		set_start_condition (IN_STR)
	}

<IN_STR> {
	\\\\		out_buffer.append (text)

	\\\"		out_buffer.append (text)

	{UTF8CHAR}+ {
				out_buffer.append (text)
	}

	[^\\\n"]+	out_buffer.append (text)

	\n[ \t\r]*	{
				out_buffer.append (text)
	}

	[^\\\n"]*\"	{						-- match final end of string
				out_buffer.append (text)
				set_start_condition (INITIAL)
	}

	.|\n	|
	<<EOF>>	{	-- Catch-all rules (no backing up)
				set_start_condition (INITIAL)
	}
}

----------/* all other text */ -------------------------------------------------

^{WHITESPACE}[^[" \t\r\n]+{WHITESPACE_CHAR}*	{		-- read non '[' non-space characters followed by whitespace
		out_buffer.append (text)
	}

[^[" \t\r\n]+{WHITESPACE_CHAR}*	{						-- read non '[' non-space characters followed by whitespace
		out_buffer.append (text)
	}

--------------------------------------------------------------------------------
<<EOF>>			terminate
(.|\n)			-- ignore unmatched chars


%%

feature {NONE} -- Initialization

	make
			-- Create a new scanner.
		do
			make_compressed_scanner_skeleton
			create out_buffer.make (8192)
			create converted_codes.make (0)
			create str_.make_empty
			create new_code_str.make_empty
		end

feature -- Commands

	reset
			-- Reset scanner before scanning next input.
		do
			reset_compressed_scanner_skeleton
			out_buffer.wipe_out
			create converted_codes.make (0)
		end

	execute (in_text:STRING)
		do
			reset
			in_terminology := False
			set_input_buffer (new_string_buffer (in_text))
			scan
		end

feature -- Access

	str_, new_code_str: STRING

	out_buffer: STRING

	term_code: TERMINOLOGY_CODE
		attribute
			create Result.default_create
		end

feature {NONE} -- Implementation

	converted_codes: HASH_TABLE [STRING, STRING]

	in_terminology: BOOLEAN

	output_new_id_code (an_old_code: STRING)
		local
			new_code: STRING
			parent_codes: ARRAYED_LIST[STRING]
		do
			if converted_codes.has (an_old_code) and then attached converted_codes.item (an_old_code) as nc then
				new_code := nc
			else
				new_code := adl_14_id_code_upgraded (an_old_code)
				converted_codes.put (new_code, an_old_code)

				-- check if the code is a specialised one, and obtain its specialisation parent codes; for each of
				-- them that is not in the converted_codes list, add them.
				if is_adl_14_refined_code (an_old_code) then
					parent_codes := specialised_adl14_code_parents (an_old_code)

					across parent_codes as code_csr loop
					    if not converted_codes.has (code_csr.item) then
							converted_codes.put (adl_14_id_code_upgraded (code_csr.item), code_csr.item)
						end
					end
				end
			end
			out_buffer.append (new_code)
		end

	output_new_value_code (an_old_code: STRING)
		local
			new_code: STRING
			parent_codes: ARRAYED_LIST [STRING]
		do
			if converted_codes.has (an_old_code) and then attached converted_codes.item (an_old_code) as nc then
				new_code := nc
			else
				new_code := adl_14_value_code_upgraded (an_old_code)
				converted_codes.put (new_code, an_old_code)

				-- check if the code is a specialised one, and obtain its specialisation parent codes; for each of
				-- them that is not in the converted_codes list, add them.
				if is_adl_14_refined_code (an_old_code) then
					parent_codes := specialised_adl14_code_parents (an_old_code)

					across parent_codes as code_csr loop
					    if not converted_codes.has (code_csr.item) then
							converted_codes.put (adl_14_value_code_upgraded (code_csr.item), code_csr.item)
						end
					end
				end
			end

			out_buffer.append (new_code)
		end

	output_new_value_set_code (an_old_code: STRING)
		local
			new_code: STRING
			parent_codes: ARRAYED_LIST [STRING]
		do
			if converted_codes.has (an_old_code) and then attached converted_codes.item (an_old_code) as nc then
				new_code := nc
			else
				new_code := adl_14_value_set_code_upgraded (an_old_code)
				converted_codes.put (new_code, an_old_code)

				-- check if the code is a specialised one, and obtain its specialisation parent codes; for each of
				-- them that is not in the converted_codes list, add them.
				if is_adl_14_refined_code (an_old_code) then
					parent_codes := specialised_adl14_code_parents (an_old_code)

					across parent_codes as code_csr loop
					    if not converted_codes.has (code_csr.item) then
							converted_codes.put (adl_14_value_set_code_upgraded (code_csr.item), code_csr.item)
						end
					end
				end
			end

			out_buffer.append (new_code)
		end

	output_converted_code_dt_key (an_old_code: STRING)
			-- code should exist in converted_codes list or else should be the parent code of an existing code, e.g.
			-- we get 'at0000' and the converted_codes list has 'at0000.1'.
			-- if neither, output an invalid code, which will cause later compilation to fail
		local
			new_code: STRING
		do
			out_buffer.append_character ('[')
			out_buffer.append_character ('"')
			if converted_codes.has (an_old_code) and then attached converted_codes.item (an_old_code) as nc then
				new_code := nc
			else
				new_code := an_old_code + " not found in definition"
			end
			out_buffer.append (new_code)
			out_buffer.append_character ('"')
			out_buffer.append_character (']')
		end

end
