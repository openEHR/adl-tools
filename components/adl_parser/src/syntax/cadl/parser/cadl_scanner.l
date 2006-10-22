%{
indexing
	component:   "openEHR Archetype Project"
	description: "Scanner for CADL syntax items"
	keywords:    "CADL, archetype"

	author:      "Thomas Beale <thomas@deepthought.com.au>"
	support:     "Deep Thought Informatics <support@deepthought.com.au>"
	copyright:   "Copyright (c) 2003-2005 Ocean Informatics Pty Ltd"
	license:     "Mozilla tri-license"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class CADL_SCANNER

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton,
			output as print_out
		end

	CADL_TOKENS
		export
			{NONE} all
		end

	INTERNAL
		export
			{NONE} all
		end

	SHARED_DT_FACTORY
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

	ADL_SYNTAX_CONVERTER
		export 
			{NONE} all
		end

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

%x IN_STR IN_REGEXP1 IN_REGEXP2 IN_TERM_CONSTRAINT IN_C_DOMAIN_TYPE
%option outfile="cadl_scanner.e"

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
"="			last_token := Equal_code
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

"|"			last_token := SYM_INTERVAL_DELIM

"["			last_token := Left_bracket_code
"]"			last_token := Right_bracket_code

"{"			last_token := SYM_START_CBLOCK
"}"			last_token := SYM_END_CBLOCK

">="			last_token := SYM_GE
"<="			last_token := SYM_LE
"!="			last_token := SYM_NE

"<"			last_token := SYM_LT
">"			last_token := SYM_GT

"\\"			last_token := SYM_MODULO
"//"			last_token := SYM_DIV

".."			last_token := SYM_ELLIPSIS
"..."			last_token := SYM_LIST_CONTINUE

----------/* common keywords */ -------------------------------------------------

[Mm][Aa][Tt][Cc][Hh][Ee][Ss]		 			last_token := SYM_MATCHES

[Ii][Ss]_[Ii][Nn]				 			last_token := SYM_MATCHES

----------/* assertion keywords */ -------------------------------------------------

[Tt][Hh][Ee][Nn]							last_token := SYM_THEN

[Ee][Ll][Ss][Ee]							last_token := SYM_ELSE

[Aa][Nn][Dd]							last_token := SYM_AND

[Oo][Rr]								last_token := SYM_OR

[Xx][Oo][Rr]							last_token := SYM_XOR

[Nn][Oo][Tt]							last_token := SYM_NOT

[Ii][Mm][Pp][Ll][Ii][Ee][Ss]					last_token := SYM_IMPLIES

[Tt][Rr][Uu][Ee]							last_token := SYM_TRUE

[Ff][Aa][Ll][Ss][Ee] 						last_token := SYM_FALSE

[Ff][Oo][Rr][_][Aa][Ll][Ll]					last_token := SYM_FORALL

[Ee][Xx][Ii][Ss][Tt][Ss]					last_token := SYM_EXISTS

---------/* cADL keywords */ -------------------------------------------------

[Ee][Xx][Ii][Ss][Tt][Ee][Nn][Cc][Ee]			last_token := SYM_EXISTENCE

[Oo][Cc][Cc][Uu][Rr][Rr][Ee][Nn][Cc][Ee][Ss] 		last_token := SYM_OCCURRENCES

[Cc][Aa][Rr][Dd][Ii][Nn][Aa][Ll][Ii][Tt][Yy]		last_token := SYM_CARDINALITY

[Oo][Rr][Dd][Ee][Rr][Ee][Dd]					last_token := SYM_ORDERED

[Uu][Nn][Oo][Rr][Dd][Ee][Rr][Ee][Dd]			last_token := SYM_UNORDERED

[Uu][Nn][Ii][Qq][Uu][Ee]					last_token := SYM_UNIQUE

[Ii][Nn][Ff][Ii][Nn][Ii][Tt][Yy]				last_token := SYM_INFINITY

[Uu][Ss][Ee][_][Nn][Oo][Dd][Ee]				last_token := SYM_USE_NODE

[Uu][Ss][Ee][_][Aa][Rr][Cc][Hh][Ee][Tt][Yy][Pp][Ee] 	last_token := SYM_ALLOW_ARCHETYPE

[Aa][Ll][Ll][Oo][Ww][_][Aa][Rr][Cc][Hh][Ee][Tt][Yy][Pp][Ee] 	last_token := SYM_ALLOW_ARCHETYPE

[Ii][Nn][Cc][Ll][Uu][Dd][Ee]					last_token := SYM_INCLUDE

[Ee][Xx][Cc][Ll][Uu][Dd][Ee]					last_token := SYM_EXCLUDE


----------/* V_URI */ -------------------------------------------------
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

---------/* V_TERM_CODE_CONSTRAINT of form */ ------------
-- [terminology_id::code, -- comment
--		     	  code, -- comment
--			  code] -- comment
--
-- Form with assumed value
-- [terminology_id::code, -- comment
--			  code; -- comment
--			  code] -- an optional assumed value
--

\[[a-zA-Z0-9()._\-]+::[ \t\n]*	{
				in_buffer.append_string (text_substring (2, text_count))
				set_start_condition (IN_TERM_CONSTRAINT)
				term_code_count := 0
				assumed_term_code_index := 0
			}

<IN_TERM_CONSTRAINT>[ \t]*[a-zA-Z0-9._\-]+[ \t]*;[ \t\n]* {
				str_ := text
				in_buffer.append(text)
				term_code_count := term_code_count + 1
				assumed_term_code_index := term_code_count
			}

<IN_TERM_CONSTRAINT>[ \t]*[a-zA-Z0-9._\-]+[ \t]*,[ \t\n]* {
				str_ := text
				in_buffer.append(text)
				term_code_count := term_code_count + 1
			}

<IN_TERM_CONSTRAINT>\-\-[^\],\n]*\n {
				do_nothing
			}

<IN_TERM_CONSTRAINT>[ \t]*[a-zA-Z0-9._\-]*[ \t\n]*\] {
				if assumed_term_code_index > 0 and assumed_term_code_index /= term_code_count then
					last_token := ERR_TERM_CODE_CONSTRAINT
				else
					in_buffer.append(text_substring(1, text_count-1))
					str_ := STRING_.make (in_buffer.count)
					str_.append (in_buffer)
					in_buffer.wipe_out
					last_string_value := str_
					last_string_value.prune_all(' ')
					last_string_value.prune_all('%T')
					last_string_value.prune_all('%N')
					last_token := V_TERM_CODE_CONSTRAINT
				end
				set_start_condition (INITIAL)
			}


----------/* V_LOCAL_CODE */ ----------------------------------------

a[ct][0-9.]+ {
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

----------/* V_ISO8601_TIME hh:mm:ss[,sss][Z|+/-nnnn] */ -------------------------------------------------

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

P([0-9]+[yY])?([0-9]+[mM])?([0-9]+[wW])?([0-9]+[dD])?T([0-9]+[hH])?([0-9]+[mM])?([0-9]+[sS])? |
P([0-9]+[yY])?([0-9]+[mM])?([0-9]+[wW])?([0-9]+[dD])? {
				last_token := V_ISO8601_DURATION
				last_string_value := text
			}

-- temporary...
-- missing 'T' silently correct; assume 'm' means minutes not months
P([0-9]+[yY])?([0-9]+[mM])?([0-9]+[dD])?([0-9]+[hH])?([0-9]+[mM])?([0-9]+[sS])? {
				last_token := V_ISO8601_DURATION
				last_string_value := convert_non_conforming_duration(text)
			}

-- in future, use this instead to treat as an error
-- P([0-9]+[yY])?([0-9]+[mM])?([0-9]+[dD])?([0-9]+[hH])?([0-9]+[mM])?([0-9]+[sS])? {
-- 				last_token := ERR_V_ISO8601_DURATION
--			}

----------/* V_ISO8601_DATE_CONSTRAINT_PATTERN */ -------------------------------------------------

[yY][yY][yY][yY]-[mM?X][mM?X]-[dD?X][dD?X]	{
				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			}

----------/* V_ISO8601_TIME_CONSTRAINT_PATTERN */ -------------------------------------------------

--
-- remove the following pattern when all archetypes with leading 'T' on times are gone
--
T[hH][hH]:[mM?X][mM?X]:[sS?X][sS?X]	{
				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text_substring(2, text_count)
			}

[hH][hH]:[mM?X][mM?X]:[sS?X][sS?X]	{
				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			}

----------/* V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN */ -------------------------------------------------

--
-- remove the following pattern when all archetypes with missing 'T' are gone
--
[yY][yY][yY][yY]-[mM?][mM?]-[dD?X][dD?X][ ][hH?X][hH?X]:[mM?X][mM?X]:[sS?X][sS?X]	{
				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
				last_string_value.put('T', last_string_value.index_of(' ', 1))
			}

[yY][yY][yY][yY]-[mM?][mM?]-[dD?X][dD?X]T[hH?X][hH?X]:[mM?X][mM?X]:[sS?X][sS?X]	{
				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			}

----------/* V_ISO8601_DURATION_CONSTRAINT_PATTERN */ -------------------------------------------------

-- the following includes the openEHR deviation from ISO8601, to allow 'W' to be mixed in with 
-- other designators

P[yY]?[mM]?[Ww]?[dD]?T[hH]?[mM]?[sS]? |
P[yY]?[mM]?[Ww]?[dD]? {
				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			}

----------/* V_C_DOMAIN_TYPE - sections of dADL syntax */ -------------------------------------------------

-- this is an attempt to match a dADL section inside cADL. It will probably never work properly since 
-- there can be '>' inside "||" ranges, and also strings containing any character, e.g. units string
-- contining "{}" chars. The real solution is to use the dADL parser on the buffer from the current
-- point on and be able to fast-forward the cursor to the last character matched by the dADL scanner

[A-Z][a-zA-Z0-9_]*[	 \n]*< 			{	-- match a pattern like 'Type_Identifier whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			}

<IN_C_DOMAIN_TYPE>[^}>]*>[	 \n]*[^>}A-Z] { -- match up to next > not followed by a '}' or '>' 
 				in_buffer.append_string (text)
 			}

<IN_C_DOMAIN_TYPE>[^}>]*>+[	 \n]*[}A-Z] 	{ -- final section - '...> whitespace } or beginning of a type identifier'
				-- get the entire section of dADL
				in_buffer.append_string (text)
				unread_character(in_buffer.item(in_buffer.count)) -- put back the last character 
				in_buffer.remove_tail(1) -- get rid of the "}" from the buffer
				str_ := STRING_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_lineno := in_lineno + str_.occurrences('%N')

				-- perform any upgrades to embedded dADL object syntax here by substitution
				convert_c_quantity_property(str_)

				dadl_parser.execute(str_, source_start_line)
				if not dadl_parser.syntax_error then
					if dadl_parser.output.is_typed then
						tid := dynamic_type_from_string(dadl_parser.output.rm_type_name)
						if tid >= 0 then
							c_domain_type ?= dadl_parser.output.as_object(tid)
							if c_domain_type /= Void then
								last_token := V_C_DOMAIN_TYPE
							else
								dadl_parser_error := "Conversion of " + dadl_parser.output.rm_type_name + " failed"
								last_token := ERR_C_DOMAIN_TYPE
							end
						else
							dadl_parser_error := "Domain type " + dadl_parser.output.rm_type_name + " unknown or not visible in type system"
							last_token := ERR_C_DOMAIN_TYPE
						end
					else
						dadl_parser_error := "Domain type in dADL section not typed"
						last_token := ERR_C_DOMAIN_TYPE
					end
				else
					dadl_parser_error := dadl_parser.error_text
					last_token := ERR_C_DOMAIN_TYPE
				end

				in_buffer.wipe_out
				set_start_condition (INITIAL)
 			}

<IN_C_DOMAIN_TYPE>[^}>]*[	 \n]*} 			{ -- match up to next '}' not preceded by a '>'
 				in_buffer.append_string (text)
  			}

----------/* V_TYPE_IDENTIFIER */ -------------------------------------------------
[A-Z]{IDCHAR}*	{
					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			}

[A-Z]{IDCHAR}*<[a-zA-Z0-9,_<>]+>	{
					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			}

[a-z]{IDCHAR}*[	 ]*\(\)	{
					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			}

[a-z]{IDCHAR}*	{
					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			}

----------/* V_REGEXP */ -------------------------------------------------
"{/" 			{
				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			}

<IN_REGEXP1>[^/]*\\\/	{ 		-- match any segments with quoted slashes
				in_buffer.append_string (text)
			}

<IN_REGEXP1>[^/}]*\/	{ 		-- match final segment
				in_buffer.append_string (text)
				str_ := STRING_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
 				last_string_value := str_
 				last_token := V_REGEXP
				set_start_condition (INITIAL)
 			}

\^[^^\n]*\^		{	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			}

----------/* integers */ -------------------------------------------------

[0-9]+		{
					last_token := V_INTEGER
					last_integer_value := text.to_integer
			}

[0-9]{1,3}(,[0-9]{3})+		{
					last_token := V_INTEGER
					str_ := text
					nb_ := text_count
					from i_ := 1 until i_ > nb_ loop
						char_ := str_.item (i_)
						in_buffer.append_character (char_)
						i_ := i_ + 1
					end
					last_integer_value := in_buffer.to_integer
					in_buffer.wipe_out
			}

----------/* reals */ -------------------------------------------------

[0-9]+\./[^.0-9]				|
[0-9]+\.[0-9]*[eE][+-]?[0-9]+		|
[0-9]*\.[0-9]+([eE][+-]?[0-9]+)?	{
						last_token := V_REAL
						last_real_value := text.to_real
					}
[0-9]{1,3}(_[0-9]{3})+\./[^.0-9]	|
[0-9]{1,3}(_[0-9]{3})*\.([0-9]{1,3}(_[0-9]{3})*)?[eE][+-]?[0-9]{1,3}(_[0-9]{3})*	|
([0-9]{1,3}(_[0-9]{3})*)?\.[0-9]{1,3}(_[0-9]{3})*([eE][+-]?[0-9]{1,3}(_[0-9]{3})*)?	{
						last_token := V_REAL
						str_ := text
						nb_ := text_count
						from i_ := 1 until i_ > nb_ loop
							char_ := str_.item (i_)
							if char_ /= '_' then
								in_buffer.append_character (char_)
							end
							i_ := i_ + 1
						end
						last_real_value := in_buffer.to_real
						in_buffer.wipe_out
					}

		-- The first and fourth expressions use a trailing context
		-- to make sure that an integer followed by two dots is
		-- not recognized as a real followed by a dot.

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

<IN_STR>\n[ \t\r]*	{
				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_string (text)
			}

<IN_STR>[^\n"]*\"	{						-- match final end of string
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
<IN_STR>.|\n			|
<IN_STR><<EOF>>	{	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			}


----------/* characters */ -------------------------------------------------
\'[^\\\n']\'		last_token := V_CHARACTER; last_character_value := text_item (2)
\'\\n\'			last_token := V_CHARACTER; last_character_value := '%N'
\'\\r\'			last_token := V_CHARACTER; last_character_value := '%R'
\'\\t\'			last_token := V_CHARACTER; last_character_value := '%T'
\'\\f\'			last_token := V_CHARACTER; last_character_value := '%F'
\'\\'\'			last_token := V_CHARACTER; last_character_value := '%''
\'\\\\'			last_token := V_CHARACTER; last_character_value := '%H'
\'\\\"\'			last_token := V_CHARACTER; last_character_value := '"'
\'\\[0-9]+\'	{
				code_ := text_substring (4, text_count - 1).to_integer
				last_token := V_CHARACTER
				last_character_value := code_.to_character
			}
\'&[a-zA-Z0-9_]+;\'	{	-- match ISO special character pattern &char_name;
				-- look up the code in an ISO table
				-- if a valid code then
				--	last_token := V_CHARACTER
				-- 	convert to actual character?
				--	last_character_value := converted character
				-- else
				--	last_token := ERR_CHARACTER
				-- end
			}
\'&#x([a-fA-F0-9_]){4};\'	{	-- match W3C XML special character pattern &#xHHHH;
				-- look up the code in an W3C table
				-- if a valid code then
				--	last_token := V_CHARACTER
				-- 	convert to actual character?
				--	last_character_value := converted character
				-- else
				--	last_token := ERR_CHARACTER
				-- end
			}
\'.{1,2}		|
\'\\[0-9]+(\/)?		last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)

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

	source_start_line: INTEGER
			-- offset of source in other document, else 0

feature {NONE} -- Implementation

	Init_buffer_size: INTEGER is 256
				-- Initial size for `in_buffer'

	dadl_parser: DADL2_VALIDATOR is
		once
			create Result.make
		end

	dadl_parser_error: STRING

	term_code_count: INTEGER
			-- number of term codes found so far parsing a  TERM_CONSTRAINT

	assumed_term_code_index: INTEGER
			-- index of term code in 'assumed' position when parsing a  TERM_CONSTRAINT

	c_domain_type: C_DOMAIN_TYPE

	tid: INTEGER

invariant

	in_buffer_not_void: in_buffer /= Void

end
