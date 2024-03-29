%{
note
	component:   "openEHR ADL Tools"
	description: "Scanner for CADL syntax items"
	keywords:    "CADL, archetype"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class CADL_2_SCANNER

inherit
	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton,
			output as print_out
		end

	CADL_2_TOKENS
		export
			{NONE} all
		end

	ADL_2_TERM_CODE_TOOLS
		export
			{NONE} all
		end

	UT_CHARACTER_CODES
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
ALPHANUM_CHAR [a-zA-Z0-9_]
ALPHANUM_STR {ALPHANUM_CHAR}+
IDCHAR [a-zA-Z0-9_]
NAMECHAR [a-zA-Z0-9._\-]
EXTERNAL_CODECHAR [a-zA-Z0-9._\-|*^+?$]
NAMECHAR_SPACE [a-zA-Z0-9._\- ]
NAMECHAR_PAREN [a-zA-Z0-9._\-()]
NAMESTR [a-zA-Z][a-zA-Z0-9_]+

ID_CODE_LEADER id
CODE_STR (0|[1-9][0-9]*)(\.(0|[1-9][0-9]*))*
ID_CODE {ID_CODE_LEADER}{CODE_STR}
AT_CODE at{CODE_STR}
AC_CODE ac{CODE_STR}

-- full 3-part ID, possibly including -rc / -alpha parts etc
ARCHETYPE_ID ({NAMESTR}(\.{ALPHANUM_STR})*::)?{NAMESTR}-{ALPHANUM_STR}-{NAMESTR}\.{ALPHANUM_STR}(-{ALPHANUM_STR})*\.v[0-9]+(\.[0-9]+){0,2}((-rc|\-alpha)(\.[0-9]+)?)?

-- archetype reference, which may be .vN, .VN.M, .vN.M.P, but no -rc etc.
ARCHETYPE_REF ({NAMESTR}(\.{ALPHANUM_STR})*::)?{NAMESTR}-{ALPHANUM_STR}-{NAMESTR}\.{ALPHANUM_STR}(-{ALPHANUM_STR})*\.v[0-9]+(\.[0-9]+){0,2}

-- open reference, which allows whole version id part to be optional
ARCHETYPE_OPEN_REF ({NAMESTR}(\.{ALPHANUM_STR})*::)?{NAMESTR}-{ALPHANUM_STR}-{NAMESTR}\.{ALPHANUM_STR}(-{ALPHANUM_STR})*(\.v[0-9]+(\.[0-9]+){0,2})?

-- paths segments can only have full matched archetype ids.
PATH_SEG [a-z]{ALPHANUM_CHAR}*(\[({ID_CODE}|{ARCHETYPE_REF})\])?

UTF8_CHAR (([\xC2-\xDF][\x80-\xBF])|(\xE0[\xA0-\xBF][\x80-\xBF])|([\xE1-\xEF][\x80-\xBF][\x80-\xBF])|(\xF0[\x90-\xBF][\x80-\xBF][\x80-\xBF])|([\xF1-\xF7][\x80-\xBF][\x80-\xBF][\x80-\xBF]))

--------------- Options --------------
%x IN_STR IN_REGEXP1 IN_EXPANDED_VALUE_SET_DEF IN_EXTERNAL_VALUE_SET_DEF
%option outfile="cadl_2_scanner.e"

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

[Uu][Ss][Ee][_][Nn][Oo][Dd][Ee]				last_token := SYM_USE_NODE

[Uu][Ss][Ee][_][Aa][Rr][Cc][Hh][Ee][Tt][Yy][Pp][Ee] 	last_token := SYM_USE_ARCHETYPE

[Aa][Ll][Ll][Oo][Ww][_][Aa][Rr][Cc][Hh][Ee][Tt][Yy][Pp][Ee] 	last_token := SYM_ALLOW_ARCHETYPE

[Ii][Nn][Cc][Ll][Uu][Dd][Ee]					last_token := SYM_INCLUDE

[Ee][Xx][Cc][Ll][Uu][Dd][Ee]					last_token := SYM_EXCLUDE

[Aa][Ff][Tt][Ee][Rr]							last_token := SYM_AFTER

[Bb][Ee][Ff][Oo][Rr][Ee]						last_token := SYM_BEFORE

[Cc][Ll][Oo][Ss][Ee][Dd]						last_token := SYM_CLOSED

----------/* V_ROOT_ID_CODE: id code of form [at0], [at0.1] etc */ ---------------
\[{ID_CODE_LEADER}1(\.1)*\] {
		last_token := V_ROOT_ID_CODE
		last_string_value := text_substring (2, text_count - 1)
	}

----------/* V_ID_CODE: id code of form [id1], [id1.4] */ ---------------
\[{ID_CODE}\] {
		last_token := V_ID_CODE
		last_string_value := text_substring (2, text_count - 1)
	}

----------/* V_ID_CODE_STR */ ----------------------------------------
{ID_CODE} {
		last_token := V_ID_CODE_STR
		last_string_value := text
	}

----------/* V_VALUE_SET_REF: term code of form [ac2], [ac0.0.2] */ ---------------
\[{AC_CODE}\] {
		last_token := V_VALUE_SET_REF
		last_string_value := text_substring (2, text_count - 1)
	}

----------/* V_VALUE_DEF: term code of form [at2], [at0.0.2] */ ---------------
\[{AT_CODE}\] {
		last_token := V_VALUE_DEF
		last_string_value := text_substring (2, text_count - 1)
	}

----------/* V_VALUE_SET_REF_ASSUMED: term code of form [ac2; at4] */ ---------------
\[{AC_CODE}[ \t]*;[ \t]*{AT_CODE}\] {
		last_token := V_VALUE_SET_REF_ASSUMED
		last_string_value := text_substring (2, text_count - 1)
		last_string_value.prune_all(' ')
		last_string_value.prune_all('%T')
	}

----------/* external ref / slot filler */ -------------------------------------------------
\[{ID_CODE}[ \t]*,[ \t]*{ARCHETYPE_OPEN_REF}\] {
		last_token := V_ARCHETYPE_OPEN_REF
		last_string_value := text_substring (2, text_count - 1)
		last_string_value.prune_all(' ')
		last_string_value.prune_all('%T')
	}

----------/* V_ISO8601_EXTENDED_DATE_TIME YYYY-MM-DDThh:mm:ss[,sss][Z|+/-nnnn] */ -------------------------------------------------

[0-9]{4}-[0-1][0-9]-[0-3][0-9]T[0-2][0-9]:[0-6][0-9]:[0-6][0-9]([\.,][0-9]+)?(Z|[+-][0-9]{4})? |
[0-9]{4}-[0-1][0-9]-[0-3][0-9]T[0-2][0-9]:[0-6][0-9](Z|[+-][0-9]{4})? |
[0-9]{4}-[0-1][0-9]-[0-3][0-9]T[0-2][0-9](Z|[+-][0-9]{4})? {
				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		}

----------/* V_ISO8601_EXTENDED_TIME hh:mm:ss[,sss][Z|+/-nnnn] */ -------------------------------------------------

[0-2][0-9]:[0-6][0-9]:[0-6][0-9]([\.,][0-9]+)?(Z|[+-][0-9]{4})? |
[0-2][0-9]:[0-6][0-9](Z|[+-][0-9]{4})? {
				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		}

----------/* V_ISO8601_EXTENDED_DATE YYYY-MM-DD */ -------------------------------------------------

[0-9]{4}-[0-1][0-9]-[0-3][0-9] |
[0-9]{4}-[0-1][0-9] {
				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		}

----------/* V_ISO8601_DURATION PnYnMnWnDtnnHnnMnn.nnnS */ -------------------------------------------------

P([0-9]+[yY])?([0-9]+[mM])?([0-9]+[wW])?([0-9]+[dD])?T([0-9]+[hH])?([0-9]+[mM])?([0-9]+([\.,][0-9]+)?[sS])? |
P([0-9]+[yY])?([0-9]+[mM])?([0-9]+[wW])?([0-9]+[dD])? {
				last_token := V_ISO8601_DURATION
				last_string_value := text
			}

-- in future, use this instead to treat as an error
-- P([0-9]+[yY])?([0-9]+[mM])?([0-9]+[dD])?([0-9]+[hH])?([0-9]+[mM])?([0-9]+([\.,][0-9]+)[sS])? {
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

-- the following is an erroroneous form of the one below to cope with the AE bug that causes a duration 
-- constraint of the form {pattern/} to be written out, i.e. trailing '/'. For now we provide a dedicated
-- syntax error on this, so at least modellers know what to fix

P[yY]?[mM]?[Ww]?[dD]?(T[hH]?[mM]?[sS]?)?\/\} {
				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN_ERR
				unread_character(last_string_value.item(last_string_value.count)) -- put back the last character 
				last_string_value := text
			}

-- the following includes the openEHR deviation from ISO8601, to allow 'W' to be mixed in with 
-- other designators

P[yY]?[mM]?[Ww]?[dD]?(T[hH]?[mM]?[sS]?)? {
				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			}

----------/* V_TYPE_ID, V_PRIMITIVE_TYPE_ID */ --------------------------------------
[A-Z]{IDCHAR}*	{
				last_string_value := text
				if is_primitive_type (last_string_value) then
					last_token := V_PRIMITIVE_TYPE_ID
				else
					last_token := V_TYPE_ID
				end
			}

----------/* V_GENERIC_TYPE_ID */ --------------------------------------
[A-Z]{IDCHAR}*<[a-zA-Z0-9,_<>]+>	{
					last_token := V_GENERIC_TYPE_ID
					last_string_value := text
			}

----------/* V_FEATURE_CALL_ID */ --------------------------------------
[a-z]{IDCHAR}*[	 ]*\(\)	{
					last_token := V_FEATURE_CALL_ID
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			}

----------/* V_ATTRIBUTE_ID */ --------------------------------------
[a-z]{IDCHAR}*	{
					last_token := V_ATTRIBUTE_ID
					last_string_value := text
			}

----------/* V_ABS_PATH */ -------------------------------------------------
(\/{PATH_SEG})+ {		-- matches an absolute path string with segments of form "/attr_name" or "/attr_name[id-code]"
			last_token := V_ABS_PATH
			last_string_value := text
		}

----------/* V_REL_PATH */ -------------------------------------------------
{PATH_SEG}(\/{PATH_SEG})+ {		-- matches a relative path string with segments of form "/attr_name" or "/attr_name[id-code]"
			last_token := V_REL_PATH
			last_string_value := text
		}

----------/* V_URI */ -------------------------------------------------
[a-z]+:\/\/[^<>|\\{}^~"\[\] ]*	{
			last_token := V_URI
			last_string_value := text
		}

----------/* V_REGEXP */ -------------------------------------------------
"{/" 	{
			last_token := SYM_START_CBLOCK
			set_start_condition (IN_REGEXP1)
			in_buffer.append_character ('/')
		}

<IN_REGEXP1> {
	[^/[]*	{ 		-- match segment consisting of non / or [
				in_buffer.append_string (text)
	}

	"["[^]]*"]"	{ 		-- match [] segment
				in_buffer.append_string (text)
	}

	[^/]*\\\/	{ 		-- match segment ending in quoted slashes '\/'
				in_buffer.append_string (text)
	}

	[^/[]*"/"	{ 		-- match final segment
				in_buffer.append_string (text)

				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
 				last_string_value := str_
 				last_token := V_REGEXP
				set_start_condition (INITIAL)
	}
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

[0-9]+\.[0-9]+						|
[0-9]+\.[0-9]+[eE][+-]?[0-9]+		{
						last_token := V_REAL
						last_real_value := text.to_real
			}
[0-9]{1,3}(_[0-9]{3})+\.[0-9]+	|
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

---========================================================================================================================================
--- START Legacy ADL 1.4 inline term set
---

---------/* V_EXPANDED_VALUE_SET_DEF of form: */ ------------
-- [local::atN, -- comment
--		  atN, -- comment
--		  atN] -- comment
--
-- Form with assumed value:
-- [local::atN -- comment
--		atN; -- comment
--		atN] -- an optional assumed value
--

\[local::[ \t]*	{
		set_start_condition (IN_EXPANDED_VALUE_SET_DEF)
		create last_term_constraint_parse_structure_value.make
		str_ := text_substring (2, text_count)
		last_term_constraint_parse_structure_value.set_terminology_id (str_.substring (1, str_.index_of (':', 1)-1))
		is_assumed_code := False
	}

<IN_EXPANDED_VALUE_SET_DEF> {
	[ \t]*{AT_CODE}[ \t]*;[ \t]* { -- match second last line with ';' termination (assumed value)
		str_ := text
		str_.prune_all(' ')
		str_.prune_all('%T')
		str_.prune_all(';')
		if not last_term_constraint_parse_structure_value.has_code (str_) then
			last_term_constraint_parse_structure_value.add_code (str_)
			is_assumed_code := True -- for next code, not the one just parsed
		else
			last_token := ERR_VALUE_SET_DEF_DUP_CODE
			err_str.append (str_)
			set_start_condition (INITIAL)
		end
	}

	[ \t]*{AT_CODE}[ \t]*,[ \t]* {	-- match any line, with ',' termination
		str_ := text
		str_.prune_all(' ')
		str_.prune_all('%T')
		str_.prune_all(',')
		if not last_term_constraint_parse_structure_value.has_code (str_) then
			last_term_constraint_parse_structure_value.add_code (str_)
		else
			last_token := ERR_VALUE_SET_DEF_DUP_CODE
			err_str.append (str_)
			set_start_condition (INITIAL)
		end
	}

	-- count line endings
	\n+			in_lineno := in_lineno + text_count

	-- ignore CRs
	\r

	-- count line endings with comments
	\-\-[^\n]*\n	in_lineno := in_lineno + 1

	[ \t]*{AT_CODE}[ \t]*\] { -- match final line, terminating in ']'
		str_ := text
		str_.prune_all(' ')
		str_.prune_all('%T')
		str_.prune_all(']')
		if is_assumed_code then
			if last_term_constraint_parse_structure_value.has_code (str_) and not last_term_constraint_parse_structure_value.is_single then
				last_term_constraint_parse_structure_value.set_assumed_code (str_)
				last_token := V_EXPANDED_VALUE_SET_DEF
			else
				last_token := ERR_VALUE_SET_DEF_ASSUMED
				err_str.append (str_)
			end
		elseif not last_term_constraint_parse_structure_value.has_code (str_) then
			last_term_constraint_parse_structure_value.add_code (str_)
			last_token := V_EXPANDED_VALUE_SET_DEF
		else
			last_token := ERR_VALUE_SET_DEF_DUP_CODE
			err_str.append (str_)
		end
		set_start_condition (INITIAL)
	}

	.|\n		|
	<<EOF>>	{	-- Catch-all rules (no backing up)
			last_token := ERR_VALUE_SET_DEF
			set_start_condition (INITIAL)
	}
}

---------/* error condition with terminology id but no codes */ ------------
-- [terminology_id::code, -- comment
--
\[{NAMECHAR_PAREN}+::[ \t]*\] {
		last_token := ERR_VALUE_SET_MISSING_CODES
		err_str := text
	}

---------/* V_EXTERNAL_VALUE_SET_DEF of form */ ------------
-- [terminology_id::code, -- comment
--		     	  code, -- comment
--			  code] -- comment
--
-- Form with assumed value
-- [terminology_id:: -- comment
--			  code; -- comment
--			  code] -- an optional assumed value
--

\[{NAMECHAR_PAREN}+::[ \t]*	{
		set_start_condition (IN_EXTERNAL_VALUE_SET_DEF)
		create last_term_constraint_parse_structure_value.make
		str_ := text_substring (2, text_count)
		last_term_constraint_parse_structure_value.set_terminology_id (str_.substring (1, str_.index_of (':', 1)-1))
		is_assumed_code := False
	}

<IN_EXTERNAL_VALUE_SET_DEF> {
	[ \t]*{NAMECHAR}+[ \t]*;[ \t]* { -- match second last line with ';' termination (assumed value)
		str_ := text
		str_.prune_all(' ')
		str_.prune_all('%T')
		str_.prune_all(';')
		if not last_term_constraint_parse_structure_value.has_code (str_) then
			last_term_constraint_parse_structure_value.add_code (str_)
			is_assumed_code := True -- for next code, not the one just parsed
		else
			last_token := ERR_VALUE_SET_DEF_DUP_CODE
			err_str.append (str_)
			set_start_condition (INITIAL)
		end
	}

	[ \t]*{NAMECHAR}+[ \t]*,[ \t]* {	-- match any line, with ',' termination
		str_ := text
		str_.prune_all(' ')
		str_.prune_all('%T')
		str_.prune_all(',')
		if not last_term_constraint_parse_structure_value.has_code (str_) then
			last_term_constraint_parse_structure_value.add_code (str_)
		else
			last_token := ERR_VALUE_SET_DEF_DUP_CODE
			err_str.append (str_)
			set_start_condition (INITIAL)
		end
	}

	-- count line endings
	\n+			in_lineno := in_lineno + text_count

	-- ignore CRs
	\r

	-- count line endings with comments
	\-\-[^\n]*\n	in_lineno := in_lineno + 1

	[ \t]*{NAMECHAR}+[ \t]*\] { -- match final line, terminating in ']'
		str_ := text
		str_.prune_all(' ')
		str_.prune_all('%T')
		str_.prune_all(']')
		if is_assumed_code then
			if last_term_constraint_parse_structure_value.has_code (str_) and not last_term_constraint_parse_structure_value.is_single then
				last_term_constraint_parse_structure_value.set_assumed_code (str_)
				last_token := V_EXTERNAL_VALUE_SET_DEF
			else
				last_token := ERR_VALUE_SET_DEF_ASSUMED
				err_str.append (str_)
			end
		elseif not last_term_constraint_parse_structure_value.has_code (str_) then
			last_term_constraint_parse_structure_value.add_code (str_)
			last_token := V_EXTERNAL_VALUE_SET_DEF
		else
			last_token := ERR_VALUE_SET_DEF_DUP_CODE
			err_str.append (str_)
		end
		set_start_condition (INITIAL)
	}

	.|\n		|
	<<EOF>>	{	-- Catch-all rules (no backing up)
			last_token := ERR_VALUE_SET_DEF
			set_start_condition (INITIAL)
	}
}

---
--- END Legacy ADL 1.4 inline term set
---========================================================================================================================================

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

	{UTF8_CHAR}+ {
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
	.|\n		|
	<<EOF>>	{	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			}
}

----------/* characters */ -------------------------------------------------
\'[^\\\n']\'			last_token := V_CHARACTER; last_character_value := text_item (2)
-- \'{UTF8_CHAR}\'			last_token := V_CHARACTER; last_character_value := text.to_character
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

feature {NONE} -- Initialization

	make
			-- Create a new scanner.
		do
			make_compressed_scanner_skeleton
			create in_buffer.make (Init_buffer_size)
			in_lineno := 1
			create str_.make_empty
			create last_string_value.make_empty
			create last_term_constraint_parse_structure_value.make
		end

feature -- Commands

	reset
			-- Reset scanner before scanning next input.
		do
			reset_compressed_scanner_skeleton
			in_lineno := 1
			in_buffer.wipe_out
		end

feature -- Access

	ref_model: BMM_MODEL
		attribute
			create Result.default_create
		end

	aom_profile: detachable AOM_PROFILE

	in_buffer: STRING
			-- Buffer for lexical tokens.

	in_lineno: INTEGER
			-- Current line number.

	is_operator: BOOLEAN
			-- Parsing an operator declaration?

	source_start_line: INTEGER
			-- Offset of source in other document, else 0.

	err_str: STRING
		attribute
			create Result.make (0)
		end

feature {NONE} -- Implementation

	Init_buffer_size: INTEGER = 1024
				-- Initial size for `in_buffer'

	is_assumed_code: BOOLEAN
			-- True if next code parsed is assumed code

	is_primitive_type (a_type_name: STRING): BOOLEAN
		do
			Result := attached aom_profile as aomp and then aomp.has_aom_primitive_type (a_type_name) or 
				c_primitive_subtypes.has (a_type_name.as_upper) or 
				ref_model.has_class_definition (a_type_name) and then ref_model.is_enumerated_type (a_type_name)
		end

end
