note
	component:   "openEHR ADL Tools"
	description: "Scanner for CADL syntax items"
	keywords:    "CADL, archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class CADL_14_SCANNER

inherit
	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton,
			output as print_out
		end

	CADL_14_TOKENS
		export
			{NONE} all
		end

	ADL_14_TERM_CODE_TOOLS
		export
			{NONE} all
		end

	ADL_15_TERM_CODE_TOOLS
		export
			{NONE} all
		end

	INTERNAL
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

create
	make

feature -- Status report

	valid_start_condition (sc: INTEGER): BOOLEAN
			-- Is `sc' a valid start condition?
		do
			Result := (INITIAL <= sc and sc <= IN_EXTERNAL_VALUE_SET_DEF)
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
if yy_act <= 70 then
if yy_act <= 35 then
if yy_act <= 18 then
if yy_act <= 9 then
if yy_act <= 5 then
if yy_act <= 3 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 87 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 87")
end
-- Ignore separators
else
--|#line 88 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 88")
end
in_lineno := in_lineno + text_count
end
else
--|#line 93 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 93")
end
-- Ignore comments
end
else
if yy_act = 4 then
--|#line 94 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 94")
end
in_lineno := in_lineno + 1
else
--|#line 98 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 98")
end
last_token := Minus_code
end
end
else
if yy_act <= 7 then
if yy_act = 6 then
--|#line 99 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 99")
end
last_token := Plus_code
else
--|#line 100 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 100")
end
last_token := Star_code
end
else
if yy_act = 8 then
--|#line 101 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 101")
end
last_token := Slash_code
else
--|#line 102 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 102")
end
last_token := Caret_code
end
end
end
else
if yy_act <= 14 then
if yy_act <= 12 then
if yy_act <= 11 then
if yy_act = 10 then
--|#line 103 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 103")
end
last_token := Equal_code
else
--|#line 104 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 104")
end
last_token := Dot_code
end
else
--|#line 105 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 105")
end
last_token := Semicolon_code
end
else
if yy_act = 13 then
--|#line 106 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 106")
end
last_token := Comma_code
else
--|#line 107 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 107")
end
last_token := Colon_code
end
end
else
if yy_act <= 16 then
if yy_act = 15 then
--|#line 108 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 108")
end
last_token := Exclamation_code
else
--|#line 109 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 109")
end
last_token := Left_parenthesis_code
end
else
if yy_act = 17 then
--|#line 110 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 110")
end
last_token := Right_parenthesis_code
else
--|#line 111 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 111")
end
last_token := Dollar_code
end
end
end
end
else
if yy_act <= 27 then
if yy_act <= 23 then
if yy_act <= 21 then
if yy_act <= 20 then
if yy_act = 19 then
--|#line 113 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 113")
end
last_token := Question_mark_code
else
--|#line 115 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 115")
end
last_token := SYM_INTERVAL_DELIM
end
else
--|#line 117 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 117")
end
last_token := Left_bracket_code
end
else
if yy_act = 22 then
--|#line 118 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 118")
end
last_token := Right_bracket_code
else
--|#line 120 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 120")
end
last_token := SYM_START_CBLOCK
end
end
else
if yy_act <= 25 then
if yy_act = 24 then
--|#line 121 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 121")
end
last_token := SYM_END_CBLOCK
else
--|#line 123 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 123")
end
last_token := SYM_GE
end
else
if yy_act = 26 then
--|#line 124 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 124")
end
last_token := SYM_LE
else
--|#line 125 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 125")
end
last_token := SYM_NE
end
end
end
else
if yy_act <= 31 then
if yy_act <= 29 then
if yy_act = 28 then
--|#line 127 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 127")
end
last_token := SYM_LT
else
--|#line 128 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 128")
end
last_token := SYM_GT
end
else
if yy_act = 30 then
--|#line 130 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 130")
end
last_token := SYM_MODULO
else
--|#line 131 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 131")
end
last_token := SYM_DIV
end
end
else
if yy_act <= 33 then
if yy_act = 32 then
--|#line 133 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 133")
end
last_token := SYM_ELLIPSIS
else
--|#line 134 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 134")
end
last_token := SYM_LIST_CONTINUE
end
else
if yy_act = 34 then
--|#line 138 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 138")
end
last_token := SYM_MATCHES
else
--|#line 140 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 140")
end
last_token := SYM_MATCHES
end
end
end
end
end
else
if yy_act <= 53 then
if yy_act <= 44 then
if yy_act <= 40 then
if yy_act <= 38 then
if yy_act <= 37 then
if yy_act = 36 then
--|#line 144 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 144")
end
last_token := SYM_THEN
else
--|#line 146 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 146")
end
last_token := SYM_ELSE
end
else
--|#line 148 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 148")
end
last_token := SYM_AND
end
else
if yy_act = 39 then
--|#line 150 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 150")
end
last_token := SYM_OR
else
--|#line 152 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 152")
end
last_token := SYM_XOR
end
end
else
if yy_act <= 42 then
if yy_act = 41 then
--|#line 154 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 154")
end
last_token := SYM_NOT
else
--|#line 156 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 156")
end
last_token := SYM_IMPLIES
end
else
if yy_act = 43 then
--|#line 158 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 158")
end
last_token := SYM_TRUE
else
--|#line 160 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 160")
end
last_token := SYM_FALSE
end
end
end
else
if yy_act <= 49 then
if yy_act <= 47 then
if yy_act <= 46 then
if yy_act = 45 then
--|#line 162 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 162")
end
last_token := SYM_FORALL
else
--|#line 164 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 164")
end
last_token := SYM_EXISTS
end
else
--|#line 168 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 168")
end
last_token := SYM_EXISTENCE
end
else
if yy_act = 48 then
--|#line 170 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 170")
end
last_token := SYM_OCCURRENCES
else
--|#line 172 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 172")
end
last_token := SYM_CARDINALITY
end
end
else
if yy_act <= 51 then
if yy_act = 50 then
--|#line 174 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 174")
end
last_token := SYM_ORDERED
else
--|#line 176 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 176")
end
last_token := SYM_UNORDERED
end
else
if yy_act = 52 then
--|#line 178 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 178")
end
last_token := SYM_UNIQUE
else
--|#line 180 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 180")
end
last_token := SYM_USE_NODE
end
end
end
end
else
if yy_act <= 62 then
if yy_act <= 58 then
if yy_act <= 56 then
if yy_act <= 55 then
if yy_act = 54 then
--|#line 182 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 182")
end
last_token := SYM_USE_ARCHETYPE
else
--|#line 184 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 184")
end
last_token := SYM_ALLOW_ARCHETYPE
end
else
--|#line 186 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 186")
end
last_token := SYM_INCLUDE
end
else
if yy_act = 57 then
--|#line 188 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 188")
end
last_token := SYM_EXCLUDE
else
--|#line 190 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 190")
end
last_token := SYM_AFTER
end
end
else
if yy_act <= 60 then
if yy_act = 59 then
--|#line 192 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 192")
end
last_token := SYM_BEFORE
else
--|#line 194 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 194")
end
last_token := SYM_CLOSED
end
else
if yy_act = 61 then
--|#line 198 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 198")
end

		last_token := V_ROOT_ID_CODE
		last_string_value := text_substring (2, text_count - 1)
	
else
--|#line 204 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 204")
end

		last_token := V_ID_CODE
		last_string_value := text_substring (2, text_count - 1)
	
end
end
end
else
if yy_act <= 66 then
if yy_act <= 64 then
if yy_act = 63 then
--|#line 211 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 211")
end

		last_token := V_ID_CODE_STR
		last_string_value := text
	
else
--|#line 218 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 218")
end

		last_token := V_VALUE_SET_REF
		last_string_value := text_substring (2, text_count - 1)
	
end
else
if yy_act = 65 then
--|#line 234 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 234")
end

		set_start_condition (IN_EXPANDED_VALUE_SET_DEF)
		create last_term_constraint_parse_structure_value.make
		str_ := text_substring (2, text_count)
		last_term_constraint_parse_structure_value.set_terminology_id (str_.substring (1, str_.index_of (':', 1)-1))
		is_assumed_code := False
	
else
--|#line 243 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 243")
end
 -- match second last line with ';' termination (assumed value)
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
	
end
end
else
if yy_act <= 68 then
if yy_act = 67 then
--|#line 258 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 258")
end
	-- match any line, with ',' termination
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
	
else
--|#line 273 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 273")
end
in_lineno := in_lineno + text_count
end
else
if yy_act = 69 then
--|#line 276 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 276")
end
in_lineno := in_lineno + 1
else
--|#line 278 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 278")
end
 -- match final line, terminating in ']'
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
	
end
end
end
end
end
end
else
if yy_act <= 105 then
if yy_act <= 88 then
if yy_act <= 79 then
if yy_act <= 75 then
if yy_act <= 73 then
if yy_act <= 72 then
if yy_act = 71 then
--|#line 301 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 301")
end
	-- Catch-all rules (no backing up)
			last_token := ERR_VALUE_SET_DEF
			set_start_condition (INITIAL)
	
else
--|#line 319 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 319")
end

		set_start_condition (IN_EXTERNAL_VALUE_SET_DEF)
		create last_term_constraint_parse_structure_value.make
		str_ := text_substring (2, text_count)
		last_term_constraint_parse_structure_value.set_terminology_id (str_.substring (1, str_.index_of (':', 1)-1))
		is_assumed_code := False
	
end
else
--|#line 328 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 328")
end
 -- match second last line with ';' termination (assumed value)
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
	
end
else
if yy_act = 74 then
--|#line 343 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 343")
end
	-- match any line, with ',' termination
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
	
else
--|#line 358 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 358")
end
in_lineno := in_lineno + text_count
end
end
else
if yy_act <= 77 then
if yy_act = 76 then
--|#line 361 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 361")
end
in_lineno := in_lineno + 1
else
--|#line 363 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 363")
end
 -- match final line, terminating in ']'
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
	
end
else
if yy_act = 78 then
--|#line 386 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 386")
end
	-- Catch-all rules (no backing up)
			last_token := ERR_VALUE_SET_DEF
			set_start_condition (INITIAL)
	
else
--|#line 394 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 394")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
end
end
end
else
if yy_act <= 84 then
if yy_act <= 82 then
if yy_act <= 81 then
if yy_act = 80 then
--|#line 401 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 401")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 402 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 402")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
--|#line 403 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 403")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
if yy_act = 83 then
--|#line 410 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 410")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 411 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 411")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
end
else
if yy_act <= 86 then
if yy_act = 85 then
--|#line 418 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 418")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
--|#line 419 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 419")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
else
if yy_act = 87 then
--|#line 426 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 426")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 427 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 427")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
end
end
end
else
if yy_act <= 97 then
if yy_act <= 93 then
if yy_act <= 91 then
if yy_act <= 90 then
if yy_act = 89 then
--|#line 434 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 434")
end

				last_token := V_ISO8601_DURATION
				last_string_value := convert_non_conforming_duration(text)
			
else
--|#line 446 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 446")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
--|#line 456 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 456")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text_substring(2, text_count)
			
end
else
if yy_act = 92 then
--|#line 461 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 461")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 471 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 471")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
				last_string_value.put('T', last_string_value.index_of(' ', 1))
			
end
end
else
if yy_act <= 95 then
if yy_act = 94 then
--|#line 477 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 477")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 488 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 488")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN_ERR
				unread_character(last_string_value.item(last_string_value.count)) -- put back the last character 
				last_string_value := text
			
end
else
if yy_act = 96 then
--|#line 497 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 497")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 513 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 513")
end
	-- match a pattern like 'Type_Identifier whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
end
end
end
else
if yy_act <= 101 then
if yy_act <= 99 then
if yy_act = 98 then
--|#line 520 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 520")
end
	-- match a pattern like '(Type_Identifier) whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
else
--|#line 526 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 526")
end
	-- match a pattern like '["at0004"] = (Type_Identifier)  <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
end
else
if yy_act = 100 then
--|#line 532 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 532")
end
 -- match up to next > not followed by a '}' or '>' 
 				in_buffer.append_string (text)
 			
else
--|#line 536 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 536")
end
 -- final section - '...> whitespace } or beginning of a type identifier'
				-- get the entire section of ODIN
				in_buffer.append_string (text)
				unread_character(in_buffer.item(in_buffer.count)) -- put back the last character 
				in_buffer.remove_tail(1) -- get rid of the "}" from the buffer
				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_lineno := in_lineno + str_.occurrences('%N')

				-- perform any upgrades to embedded ODIN object syntax here by substitution
				convert_c_dv_names(str_)

				odin_parser_error.wipe_out
				odin_parser.execute (str_, source_start_line + in_lineno)
				if not odin_parser.syntax_error then
					if odin_parser.output.is_typed then
						tid := dynamic_type_from_string(odin_parser.output.im_type_name)
						if tid >= 0 then
							if attached {C_DV_QUANTITY} odin_parser.output.as_object(tid, Void) as cdt then
								last_c_dv_quantity_value := cdt
								last_token := V_C_DV_QUANTITY
							else
								odin_parser_error.add_error (ec_VDTCV, <<odin_parser.output.im_type_name>>, "")
								last_token := ERR_C_DV_QUANTITY
							end
						else
							odin_parser_error.add_error (ec_VDTTU, <<odin_parser.output.im_type_name>>, "")
							last_token := ERR_C_DV_QUANTITY
						end
					else
						odin_parser_error.add_error (ec_VDTNT, Void, "")
						last_token := ERR_C_DV_QUANTITY
					end
				else
					odin_parser_error.append (odin_parser.errors)
					last_token := ERR_C_DV_QUANTITY
				end

				in_buffer.wipe_out
				set_start_condition (INITIAL)
 			
end
end
else
if yy_act <= 103 then
if yy_act = 102 then
--|#line 578 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 578")
end
 -- match up to next '}' not preceded by a '>'
 				in_buffer.append_string (text)
  			
else
--|#line 588 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 588")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
end
else
if yy_act = 104 then
--|#line 594 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 594")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 600 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 600")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
end
end
end
end
end
else
if yy_act <= 123 then
if yy_act <= 114 then
if yy_act <= 110 then
if yy_act <= 108 then
if yy_act <= 107 then
if yy_act = 106 then
--|#line 607 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 607")
end

			last_token := V_ATTRIBUTE_IDENTIFIER
			last_string_value := text
		
else
--|#line 613 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 613")
end
		-- matches an absolute path string with segments of form "/attr_name" or "/attr_name[id-code]"
			last_token := V_ABS_PATH
			last_string_value := text
		
end
else
--|#line 619 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 619")
end
		-- matches a relative path string with segments of form "/attr_name" or "/attr_name[id-code]"
			last_token := V_REL_PATH
			last_string_value := text
		
end
else
if yy_act = 109 then
--|#line 625 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 625")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			
else
--|#line 632 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 632")
end
 		-- match segment consisting of non / or [
				in_buffer.append_string (text)
	
end
end
else
if yy_act <= 112 then
if yy_act = 111 then
--|#line 636 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 636")
end
 		-- match [] segment
				in_buffer.append_string (text)
	
else
--|#line 640 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 640")
end
 		-- match segment ending in quoted slashes '\/'
				in_buffer.append_string (text)
	
end
else
if yy_act = 113 then
--|#line 644 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 644")
end
 		-- match final segment
				in_buffer.append_string (text)

				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
 				last_string_value := str_
 				last_token := V_REGEXP
				set_start_condition (INITIAL)
	
else
--|#line 656 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 656")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
end
end
end
else
if yy_act <= 119 then
if yy_act <= 117 then
if yy_act <= 116 then
if yy_act = 115 then
--|#line 663 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 663")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
else
--|#line 668 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 668")
end

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
			
end
else
--|#line 683 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 683")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
end
else
if yy_act = 118 then
--|#line 684 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 684")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
else
--|#line 688 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 688")
end

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
			
end
end
else
if yy_act <= 121 then
if yy_act = 120 then
--|#line 689 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 689")
end

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
			
else
--|#line 690 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 690")
end

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
			
end
else
if yy_act = 122 then
--|#line 710 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 710")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 715 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 715")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
end
end
end
end
else
if yy_act <= 132 then
if yy_act <= 128 then
if yy_act <= 126 then
if yy_act <= 125 then
if yy_act = 124 then
--|#line 723 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 723")
end
in_buffer.append_character ('\')
else
--|#line 725 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 725")
end
in_buffer.append_character ('"')
end
else
--|#line 727 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 727")
end

				in_buffer.append_string (text)
	
end
else
if yy_act = 127 then
--|#line 731 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 731")
end
in_buffer.append_string (text)
else
--|#line 733 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 733")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
end
else
if yy_act <= 130 then
if yy_act = 129 then
--|#line 738 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 738")
end
						-- match final end of string
				last_token := V_STRING
				if text_count > 1 then
					in_buffer.append_string (text_substring (1, text_count - 1))
				end
				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_
				set_start_condition (INITIAL)
			
else
--|#line 749 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 749")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
else
if yy_act = 131 then
--|#line 758 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 758")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
--|#line 760 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 760")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
end
end
else
if yy_act <= 136 then
if yy_act <= 134 then
if yy_act = 133 then
--|#line 761 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 761")
end
last_token := V_CHARACTER; last_character_value := '%R'
else
--|#line 762 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 762")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 135 then
--|#line 763 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 763")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 764 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 764")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 138 then
if yy_act = 137 then
--|#line 766 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 766")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 767 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 767")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 139 then
--|#line 771 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 771")
end
;
else
--|#line 0 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 0")
end
default_action
end
end
end
end
end
end
end
		end

	yy_execute_eof_action (yy_sc: INTEGER)
			-- Execute EOF semantic action.
		do
			inspect yy_sc
when 0, 2, 3 then
--|#line 0 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 0")
end
terminate
when 1 then
--|#line 0 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 0")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
when 4 then
--|#line 0 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 0")
end
	-- Catch-all rules (no backing up)
			last_token := ERR_VALUE_SET_DEF
			set_start_condition (INITIAL)
	
when 5 then
--|#line 0 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 0")
end
	-- Catch-all rules (no backing up)
			last_token := ERR_VALUE_SET_DEF
			set_start_condition (INITIAL)
	
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
			create an_array.make_filled (0, 0, 6824)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			yy_nxt_template_3 (an_array)
			yy_nxt_template_4 (an_array)
			yy_nxt_template_5 (an_array)
			yy_nxt_template_6 (an_array)
			yy_nxt_template_7 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,   14,   15,   16,   15,   15,   17,   18,   19,   20,
			   21,   22,   23,   24,   25,   26,   27,   28,   29,   29,
			   29,   30,   30,   30,   31,   32,   33,   34,   35,   36,
			   37,   38,   39,   40,   41,   42,   40,   43,   44,   40,
			   45,   46,   47,   48,   40,   40,   40,   49,   50,   40,
			   51,   52,   40,   53,   54,   55,   56,   14,   57,   58,
			   59,   60,   61,   62,   60,   63,   64,   60,   65,   66,
			   67,   60,   60,   60,   60,   68,   69,   60,   60,   70,
			   71,   72,   73,   74,   14,   14,   14,   14,   14,   14,
			   14,   14,   76,   85,   89,   85,   77,   76,   89,   92,

			   93,   77,   92,   92,   93,  101,   92,  101,  101,  107,
			  122,  122,   94,  122,  204,  111,   94,  112,  112,  112,
			  112,  112,  112,  122,  122,  196,  122,  157,  208,   86,
			   87,   86,   87,  246,  124,  158,  159,  299,  211,  165,
			  188,  224,  128,   78,  224,  189,  802,  124,   78,   90,
			  205,  206,  801,   90,  108,   95,  440,  784,  322,   95,
			  165,  195,  785,  195,  195,  209,  210,  165,  188,  247,
			  128,  511,  197,  189,  205,  206,   79,   80,   81,   82,
			   83,   79,   80,   81,   82,   83,   96,   97,   98,   96,
			   97,   96,   96,   96,   96,   96,   96,   96,   96,   96,

			   99,  100,   96,  100,  100,  100,  100,  100,  100,   96,
			   96,   96,   96,   96,   96,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,   96,   96,
			   96,   96,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,  115,  146,  116,
			  779,  117,  117,  117,  117,  117,  117,  115,  194,  116,
			  299,  119,  119,  119,  119,  119,  119,  299,  122,  122,

			  219,  122,  194,  219,  122,  122,  146,  122,  778,  122,
			  122,  213,  122,  299,  122,  122,  194,  122,  213,  194,
			  118,  101,  124,  101,  101,  194,  122,  122,  124,  122,
			  118,  125,  129,  124,  302,  126,  303,  127,  124,  164,
			  162,  130,  133,  162,  122,  122,  131,  122,  163,  424,
			  124,  450,  122,  122,  134,  122,  220,  132,  194,  125,
			  129,  135,  754,  126,  551,  127,  214,  199,  124,  130,
			  133,  663,  139,  214,  131,  425,  124,  122,  122,  204,
			  122,  199,  134,  123,  122,  122,  132,  122,  341,  135,
			  136,  137,  736,  198,  198,  198,  138,  201,  201,  543,

			  139,  124,  200,  200,  200,  118,  122,  122,  124,  122,
			  122,  122,  123,  122,  141,  205,  206,  140,  136,  137,
			  122,  122,  819,  122,  138,  122,  122,  142,  122,  195,
			  254,  195,  195,  164,  124,  202,  202,  202,  123,  709,
			  122,  122,  141,  122,  124,  140,  678,  194,  219,  124,
			  154,  219,  123,  293,  123,  142,  122,  122,  224,  122,
			  150,  224,  299,  211,  124,  676,  123,  675,  151,  155,
			  300,  143,  144,  144,  144,  144,  144,  144,  154,  152,
			  124,  293,  162,  123,  153,  162,  228,  145,  150,  228,
			  163,  208,  344,  344,  146,  344,  151,  164,  155,  205,

			  206,  147,  586,  148,  220,  149,  162,  152,  162,  162,
			  171,  162,  153,  301,  163,  145,  163,  230,  217,  172,
			  230,  164,  146,  164,  198,  198,  198,  162,  209,  210,
			  162,  674,  148,  169,  149,  163,  256,  343,  171,  166,
			  170,  587,  164,  167,  257,  168,  162,  172,  162,  162,
			  162,  162,  417,  162,  163,  417,  163,  169,  163,  169,
			  673,  164,  663,  164,  659,  164,  246,  166,  170,  240,
			  240,  167,  240,  168,  209,  210,  175,  241,  169,  241,
			  241,  162,  744,  173,  162,  177,  194,  162,  176,  163,
			  162,  547,  547,  361,  174,  163,  164,  169,  605,  169,

			  452,  169,  164,  452,  175,  227,  162,  454,  227,  162,
			  454,  173,  164,  177,  163,  182,  176,  228,  229,  178,
			  179,  164,  637,  174,  745,  180,  162,  162,  230,  162,
			  162,  194,  169,  679,  163,  163,  162,  606,  169,  162,
			  181,  164,  164,  182,  163,  194,  183,  178,  179,  628,
			  483,  164,  162,  180,  255,  162,  184,  169,  231,  466,
			  163,  483,  186,  227,  201,  201,  227,  164,  457,  185,
			  187,  483,  680,  584,  183,  228,  190,  169,  169,  562,
			  351,  350,  234,  351,  184,  299,  230,  169,  115,  483,
			  186,  235,  235,  235,  235,  235,  235,  185,  187,  344,

			  344,  191,  344,  169,  190,  243,  243,  243,  243,  243,
			  243,  334,  335,  336,  337,  338,  231,  352,  350,  512,
			  352,  244,  198,  198,  198,  819,  678,  236,  583,  678,
			  191,  216,  216,  256,  216,  248,  248,  248,  248,  248,
			  248,  257,  237,  379,  245,  472,  238,  459,  239,  244,
			  253,  253,  253,  253,  253,  253,  350,  217,  350,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  249,  249,  249,  249,  249,  249,  346,  347,
			  347,  347,  347,  347,  342,  115,  244,  116,  250,  251,

			  251,  251,  251,  251,  251,  252,  428,  122,  122,  115,
			  122,  116,  218,  251,  251,  251,  251,  251,  251,  245,
			  255,  256,  122,  122,  244,  122,  250,  122,  122,  257,
			  122,  124,  738,  739,  417,  255,  256,  378,  118,  194,
			  255,  256,  390,  379,  257,  378,  124,  122,  122,  257,
			  122,  124,  118,  390,  165,  165,  165,  165,  165,  165,
			  255,  256,  506,  390,  260,  506,  194,  259,  366,  257,
			  819,  124,  122,  122,  504,  122,  122,  122,  261,  122,
			  440,  390,  299,  323,  360,  255,  256,  580,  257,  255,
			  256,  507,  260,  359,  257,  259,  124,  358,  257,  299,

			  124,  122,  122,  357,  122,  262,  261,  122,  122,  354,
			  122,  323,  226,  505,  255,  256,  339,  339,  339,  263,
			  255,  256,  345,  257,  256,  124,  751,  751,  751,  257,
			  508,  124,  257,  262,  819,  122,  122,  622,  122,  122,
			  122,  264,  122,  340,  340,  340,  221,  263,  255,  256,
			  123,  265,  255,  256,  622,  738,  739,  257,  622,  124,
			  223,  257,  819,  124,  123,  266,  123,  122,  122,  264,
			  122,  267,  122,  122,  341,  122,  268,  342,  123,  265,
			  255,  256,  622,  341,  658,  255,  256,  122,  122,  257,
			  122,  124,  194,  266,  270,  123,  124,  309,  757,  267, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  255,  256,  122,  122,  268,  122,  757,  370,  304,  257,
			  269,  124,  658,  161,  299,  255,  256,  122,  122,  757,
			  122,  819,  122,  122,  257,  122,  124,  278,  271,  242,
			  255,  256,  272,  241,  757,  255,  256,  123,  269,  257,
			  580,  124,  378,  580,  257,  240,  124,  498,  636,  122,
			  122,  123,  122,  123,  233,  298,  271,  105,  498,  744,
			  272,  663,  255,  256,  102,  123,  226,  274,  498,  779,
			  663,  257,  273,  124,  122,  122,  667,  122,  122,  122,
			  223,  122,  123,  222,  298,  221,  498,  255,  256,  194,
			  192,  255,  256,  667,  275,  274,  257,  667,  124,  161,

			  257,  746,  124,  121,  276,  122,  122,  120,  122,  277,
			  113,  122,  122,  110,  122,  819,  105,  103,  255,  256,
			  143,  667,  275,  102,  255,  256,  143,  257,  819,  124,
			  819,  383,  276,  257,  819,  124,  819,  277,  279,  255,
			  280,  819,  145,  819,  194,  123,  123,  123,  257,  123,
			  286,  294,  819,  819,  819,  295,  286,  281,  148,  383,
			  123,  282,  123,  123,  283,  123,  819,  819,  123,  291,
			  145,  123,  292,  284,  123,  285,  123,  123,  227,  294,
			  819,  227,  123,  295,  123,  281,  819,  148,  819,  282,
			  228,  123,  283,  819,  123,  669,  123,  291,  819,  819,

			  292,  230,  284,  819,  285,  287,  287,  287,  287,  287,
			  287,  819,  669,  123,  123,  296,  669,  819,  819,  819,
			  123,  198,  198,  198,  288,  819,  819,  289,  123,  819,
			  123,  231,  819,  290,  123,  123,  123,  305,  305,  305,
			  669,  227,  123,  296,  227,  819,  819,  297,  123,  123,
			  758,  123,  288,  228,  162,  289,  819,  162,  758,  123,
			  819,  290,  163,  123,  230,  123,  819,  255,  256,  164,
			  162,  758,  819,  162,  162,  297,  257,  162,  163,  548,
			  123,  548,  163,  255,  256,  164,  758,  255,  256,  164,
			  549,  819,  257,  819,  231,  162,  257,  194,  162,  819,

			  819,  571,  819,  163,  194,  169,  819,  819,  255,  256,
			  164,  307,  571,  819,  819,  306,  162,  257,  550,  162,
			  162,  169,  571,  162,  163,  169,  308,  819,  163,  255,
			  256,  164,  705,  255,  256,  164,  705,  819,  257,  307,
			  571,  819,  257,  306,  162,  194,  169,  162,  819,  310,
			  819,  194,  163,  705,  308,  819,  819,  255,  256,  164,
			  819,  819,  819,  311,  705,  162,  257,  169,  162,  702,
			  819,  169,  819,  163,  200,  200,  200,  310,  255,  256,
			  164,  202,  202,  202,  312,  162,  702,  257,  162,  162,
			  702,  311,  162,  163,  819,  169,  819,  163,  255,  256,

			  164,  819,  255,  256,  164,  162,  819,  257,  162,  313,
			  819,  257,  312,  163,  702,  314,  169,  819,  255,  256,
			  164,  315,  198,  198,  198,  819,  316,  257,  198,  198,
			  198,  162,  819,  819,  162,  819,  169,  313,  706,  163,
			  169,  819,  706,  314,  255,  256,  164,  162,  317,  315,
			  162,  819,  123,  270,  316,  163,  169,  819,  819,  706,
			  255,  256,  164,  766,  162,  290,  123,  162,  123,  257,
			  706,  766,  163,  819,  819,  819,  317,  255,  256,  164,
			  123,  819,  169,  819,  766,  819,  257,  162,  318,  819,
			  162,  819,  819,  290,  319,  163,  819,  123,  169,  766,

			  255,  256,  164,  165,  165,  165,  165,  165,  165,  257,
			  374,  374,  374,  374,  374,  169,  318,  325,  691,  691,
			  691,  691,  319,  165,  165,  165,  165,  165,  165,  165,
			  165,  165,  165,  165,  165,  819,  819,  819,  169,  114,
			  819,  819,  320,  162,  326,  325,  162,  819,  819,  819,
			  819,  163,  324,  114,  114,  114,  255,  256,  164,  321,
			  322,  322,  322,  322,  322,  257,  165,  165,  165,  165,
			  165,  165,  326,  165,  165,  165,  165,  165,  165,  819,
			  324,  819,  327,  819,  165,  165,  165,  165,  165,  165,
			  819,  819,  819,  819,  169,  165,  165,  165,  165,  165,

			  165,  819,  819,  328,  329,  819,  819,  819,  330,  819,
			  327,  331,  819,  165,  165,  165,  165,  165,  165,  165,
			  165,  165,  165,  165,  165,  365,  365,  365,  365,  365,
			  365,  328,  329,  819,  819,  819,  330,  819,  819,  331,
			  332,  355,  356,  356,  356,  356,  356,  356,  819,  819,
			  819,  819,  333,  362,  362,  362,  362,  362,  362,  367,
			  367,  367,  367,  367,  367,  363,  819,  363,  332,  244,
			  364,  364,  364,  364,  364,  364,  614,  614,  614,  614,
			  614,  333,  216,  216,  819,  216,  375,  375,  375,  375,
			  375,  375,  245,  371,  819,  371,  819,  244,  372,  372,

			  372,  372,  372,  372,  819,  819,  819,  819,  217,  819,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  397,  397,  397,  397,  397,  397,  368,
			  368,  368,  368,  368,  368,  398,  398,  398,  398,  398,
			  398,  819,  115,  819,  116,  369,  373,  373,  373,  373,
			  373,  373,  819,  218,  348,  349,  350,  348,  349,  348,
			  348,  348,  348,  348,  348,  348,  348,  351,  370,  805,
			  348,  819,  771,  369,  771,  819,  767,  348,  352,  348,
			  348,  348,  348,  772,  767,  118,  805,  123,  380,  819,

			  805,  401,  401,  401,  401,  401,  401,  767,  819,  819,
			  819,  123,  819,  123,  819,  123,  348,  348,  353,  348,
			  819,  773,  767,  819,  805,  123,  380,  819,  819,  123,
			  123,  123,  402,  402,  402,  402,  402,  402,  819,  819,
			  819,  819,  123,  123,  348,  348,  348,  348,  348,  348,
			  348,  348,  348,  348,  348,  123,  123,  576,  819,  819,
			  123,  819,  819,  819,  381,  382,  819,  819,  577,  123,
			  123,  123,  123,  819,  123,  123,  385,  819,  578,  819,
			  819,  819,  819,  123,  123,  819,  632,  384,  123,  123,
			  123,  123,  381,  382,  819,  123,  577,  632,  819,  819,

			  123,  123,  123,  123,  385,  819,  819,  633,  387,  123,
			  123,  123,  819,  819,  123,  384,  386,  819,  819,  123,
			  123,  123,  410,  123,  123,  632,  123,  819,  123,  123,
			  123,  819,  819,  819,  388,  123,  387,  123,  123,  819,
			  123,  819,  123,  123,  386,  123,  819,  819,  819,  123,
			  410,  819,  819,  389,  788,  123,  819,  123,  819,  123,
			  819,  819,  388,  123,  123,  788,  123,  123,  123,  391,
			  392,  819,  393,  819,  123,  788,  819,  123,  123,  123,
			  123,  123,  123,  123,  123,  819,  394,  123,  819,  819,
			  819,  123,  123,  788,  819,  123,  123,  391,  392,  819, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  393,  123,  705,  123,  819,  123,  707,  819,  123,  123,
			  123,  396,  123,  123,  394,  123,  819,  819,  819,  123,
			  395,  123,  819,  707,  123,  819,  123,  709,  709,  819,
			  709,  819,  123,  123,  707,  819,  819,  819,  123,  396,
			  819,  399,  399,  399,  399,  399,  399,  819,  395,  819,
			  123,  731,  819,  819,  819,  123,  123,  403,  403,  403,
			  403,  403,  403,  404,  404,  404,  404,  404,  404,  819,
			  400,  819,  123,  123,  123,  123,  123,  123,  123,  405,
			  819,  406,  819,  819,  123,  123,  123,  123,  123,  123,
			  123,  819,  806,  819,  819,  819,  123,  412,  411,  819,

			  819,  123,  407,  819,  123,  408,  819,  123,  819,  806,
			  123,  409,  123,  806,  819,  123,  693,  694,  693,  694,
			  819,  123,  123,  123,  123,  412,  413,  819,  472,  123,
			  407,  123,  123,  408,  414,  123,  123,  806,  123,  409,
			  819,  123,  632,  123,  819,  819,  349,  350,  819,  349,
			  123,  472,  123,  634,  413,  695,  123,  809,  351,  819,
			  123,  123,  414,  635,  819,  633,  819,  123,  819,  352,
			  123,  819,  123,  819,  809,  123,  635,  123,  809,  416,
			  415,  634,  819,  819,  123,  819,  635,  819,  819,  123,
			  418,  419,  419,  419,  419,  419,  299,  819,  819,  353,

			  819,  123,  809,  819,  635,  819,  123,  420,  416,  420,
			  420,  420,  420,  420,  420,  299,  421,  422,  423,  423,
			  423,  423,  299,  165,  165,  165,  165,  165,  165,  165,
			  165,  165,  165,  165,  165,  819,  819,  819,  819,  426,
			  165,  165,  165,  165,  165,  165,  165,  165,  165,  165,
			  165,  165,  819,  427,  165,  165,  165,  165,  165,  165,
			  165,  165,  165,  165,  165,  165,  819,  426,  123,  430,
			  429,  165,  165,  165,  165,  165,  165,  819,  819,  819,
			  474,  427,  123,  451,  123,  819,  451,  432,  431,  165,
			  165,  165,  165,  165,  165,  452,  123,  430,  429,  165,

			  165,  165,  165,  165,  165,  706,  454,  819,  474,  708,
			  433,  819,  819,  123,  789,  432,  431,  165,  165,  165,
			  165,  165,  165,  819,  819,  789,  708,  434,  165,  165,
			  165,  165,  165,  165,  819,  789,  455,  708,  433,  165,
			  165,  165,  165,  165,  165,  435,  819,  165,  165,  165,
			  165,  165,  165,  789,  819,  434,  812,  813,  812,  813,
			  437,  165,  165,  165,  165,  165,  165,  436,  438,  819,
			  819,  819,  440,  435,  165,  165,  165,  165,  165,  165,
			  819,  439,  165,  165,  165,  165,  165,  165,  437,  165,
			  165,  165,  165,  165,  165,  814,  438,  165,  165,  165,

			  165,  165,  165,  441,  782,  782,  782,  782,  782,  439,
			  165,  165,  165,  165,  165,  165,  165,  165,  165,  165,
			  165,  165,  819,  819,  819,  819,  443,  442,  819,  819,
			  810,  441,  165,  165,  165,  165,  165,  165,  819,  444,
			  165,  165,  165,  165,  165,  165,  819,  810,  445,  819,
			  819,  810,  819,  794,  443,  442,  165,  165,  165,  165,
			  165,  165,  819,  819,  794,  819,  446,  444,  165,  165,
			  165,  165,  165,  165,  794,  810,  445,  165,  165,  165,
			  165,  165,  165,  447,  165,  165,  165,  165,  165,  165,
			  451,  819,  794,  451,  446,  355,  356,  356,  356,  356,

			  356,  356,  452,  797,  453,  797,  451,  448,  819,  451,
			  819,  447,  819,  454,  798,  819,  819,  449,  452,  819,
			  453,  819,  347,  347,  347,  347,  347,  347,  819,  454,
			  364,  364,  364,  364,  364,  364,  456,  456,  456,  456,
			  456,  456,  799,  455,  819,  819,  449,  458,  458,  458,
			  458,  458,  458,  460,  460,  460,  460,  460,  460,  455,
			  461,  461,  461,  461,  461,  461,  464,  464,  464,  464,
			  464,  464,  462,  819,  462,  457,  369,  463,  463,  463,
			  463,  463,  463,  372,  372,  372,  372,  372,  372,  465,
			  465,  465,  465,  465,  465,  819,  819,  819,  819,  370,

			  819,  819,  467,  468,  369,  469,  469,  469,  469,  469,
			  469,  470,  470,  470,  470,  470,  470,  471,  471,  471,
			  471,  471,  471,  819,  819,  819,  819,  819,  466,  819,
			  819,  819,  819,  819,  819,  819,  819,  727,  819,  123,
			  123,  727,  819,  123,  819,  819,  123,  478,  477,  123,
			  819,  819,  476,  123,  123,  475,  123,  123,  727,  123,
			  123,  819,  123,  123,  819,  123,  819,  123,  123,  727,
			  819,  123,  819,  819,  123,  478,  477,  123,  819,  819,
			  476,  819,  123,  728,  475,  123,  123,  728,  123,  123,
			  481,  123,  482,  819,  123,  123,  123,  479,  123,  819,

			  480,  819,  123,  123,  728,  123,  819,  819,  819,  123,
			  123,  123,  819,  819,  123,  728,  819,  123,  481,  819,
			  482,  819,  123,  123,  819,  479,  819,  123,  480,  123,
			  486,  123,  123,  819,  123,  123,  123,  484,  123,  819,
			  123,  819,  819,  123,  485,  123,  123,  488,  123,  123,
			  123,  123,  819,  819,  819,  123,  819,  123,  486,  487,
			  123,  819,  819,  123,  819,  484,  819,  123,  819,  123,
			  123,  123,  485,  819,  123,  488,  819,  123,  819,  819,
			  123,  819,  489,  123,  123,  819,  123,  487,  397,  397,
			  397,  397,  397,  397,  279,  819,  280,  819,  123,  256,

			  123,  398,  398,  398,  398,  398,  398,  257,  819,  819,
			  489,  819,  819,  819,  819,  123,  490,  282,  819,  819,
			  492,  287,  287,  287,  287,  287,  287,  123,  279,  491,
			  280,  819,  401,  401,  401,  401,  401,  401,  402,  402,
			  402,  402,  402,  402,  490,  282,  819,  727,  492,  728,
			  123,  729,  819,  730,  492,  819,  819,  491,  819,  819,
			  492,  123,  403,  403,  403,  403,  403,  403,  729,  819,
			  730,  123,  804,  804,  804,  804,  804,  493,  819,  729,
			  819,  730,  492,  819,  819,  819,  819,  819,  492,  819,
			  819,  123,  404,  404,  404,  404,  404,  404,  819,  819,

			  123,  819,  819,  819,  819,  493,  494,  494,  494,  494,
			  494,  494,  495,  495,  495,  495,  495,  495,  496,  496,
			  496,  496,  496,  496,  819,  123,  497,  497,  497,  497,
			  497,  497,  819,  819,  819,  819,  819,  819,  819,  795,
			  819,  503,  819,  819,  819,  819,  819,  123,  123,  123,
			  795,  819,  123,  500,  123,  123,  123,  819,  819,  123,
			  795,  819,  123,  123,  123,  123,  123,  123,  123,  123,
			  123,  499,  123,  123,  123,  123,  123,  123,  795,  819,
			  123,  500,  819,  819,  123,  819,  819,  123,  123,  819,
			  123,  819,  501,  123,  123,  123,  819,  123,  123,  499, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  819,  123,  123,  502,  123,  819,  819,  819,  819,  123,
			  504,  123,  419,  419,  419,  419,  419,  419,  299,  123,
			  501,  819,  420,  123,  420,  420,  420,  420,  420,  420,
			  299,  502,  819,  165,  165,  165,  165,  165,  165,  509,
			  123,  423,  423,  423,  423,  423,  423,  299,  507,  505,
			  423,  423,  423,  423,  423,  423,  299,  819,  819,  819,
			  513,  506,  165,  165,  165,  165,  165,  165,  515,  516,
			  516,  516,  516,  516,  819,  819,  819,  819,  510,  165,
			  165,  165,  165,  165,  165,  819,  819,  508,  513,  819,
			  819,  819,  819,  514,  165,  165,  165,  165,  165,  165,

			  165,  165,  165,  165,  165,  165,  517,  165,  165,  165,
			  165,  165,  165,  819,  518,  819,  519,  819,  819,  819,
			  819,  819,  514,  165,  165,  165,  165,  165,  165,  819,
			  819,  819,  819,  819,  517,  165,  165,  165,  165,  165,
			  165,  819,  518,  819,  519,  165,  165,  165,  165,  165,
			  165,  819,  819,  520,  165,  165,  165,  165,  165,  165,
			  819,  522,  819,  819,  521,  819,  523,  165,  165,  165,
			  165,  165,  165,  165,  165,  165,  165,  165,  165,  819,
			  819,  520,  819,  819,  819,  819,  819,  524,  819,  522,
			  819,  819,  521,  819,  523,  165,  165,  165,  165,  165,

			  165,  819,  819,  525,  527,  528,  528,  528,  528,  528,
			  819,  819,  819,  819,  819,  524,  819,  819,  526,  165,
			  165,  165,  165,  165,  165,  165,  165,  165,  165,  165,
			  165,  525,  165,  165,  165,  165,  165,  165,  529,  165,
			  165,  165,  165,  165,  165,  819,  526,  819,  819,  819,
			  819,  819,  530,  165,  165,  165,  165,  165,  165,  531,
			  165,  165,  165,  165,  165,  165,  529,  165,  165,  165,
			  165,  165,  165,  165,  165,  165,  165,  165,  165,  819,
			  530,  819,  533,  819,  819,  534,  819,  531,  819,  819,
			  532,  819,  819,  819,  503,  819,  535,  165,  165,  165,

			  165,  165,  165,  346,  536,  536,  536,  536,  536,  819,
			  533,  819,  819,  534,  819,  819,  819,  819,  532,  819,
			  819,  819,  819,  819,  535,  537,  537,  537,  537,  537,
			  537,  538,  538,  538,  538,  538,  538,  362,  362,  362,
			  362,  362,  362,  539,  540,  540,  540,  540,  540,  541,
			  541,  541,  541,  541,  541,  463,  463,  463,  463,  463,
			  463,  819,  819,  819,  457,  369,  542,  542,  542,  542,
			  542,  542,  544,  544,  544,  544,  544,  544,  545,  545,
			  545,  545,  545,  545,  819,  819,  819,  819,  370,  819,
			  819,  819,  819,  369,  546,  546,  546,  546,  546,  546,

			  819,  819,  819,  819,  819,  543,  541,  541,  541,  541,
			  541,  541,  819,  819,  819,  819,  468,  466,  469,  469,
			  469,  469,  469,  469,  819,  819,  819,  819,  123,  123,
			  555,  819,  819,  819,  819,  819,  123,  123,  123,  123,
			  123,  123,  123,  123,  123,  123,  819,  123,  557,  819,
			  819,  558,  554,  819,  819,  556,  123,  123,  555,  819,
			  819,  123,  123,  123,  123,  123,  123,  123,  819,  819,
			  819,  819,  819,  123,  123,  123,  557,  819,  819,  558,
			  123,  819,  123,  556,  123,  559,  819,  819,  819,  819,
			  819,  819,  123,  123,  123,  819,  123,  560,  123,  819,

			  123,  819,  123,  123,  563,  819,  564,  123,  561,  819,
			  819,  123,  123,  559,  819,  819,  123,  123,  123,  123,
			  123,  123,  123,  123,  819,  560,  123,  565,  819,  123,
			  123,  123,  563,  819,  564,  123,  561,  819,  819,  819,
			  123,  819,  123,  819,  123,  819,  819,  123,  123,  123,
			  567,  123,  123,  819,  123,  565,  566,  819,  123,  819,
			  123,  819,  819,  123,  819,  123,  819,  819,  819,  819,
			  819,  123,  123,  819,  819,  819,  819,  123,  567,  819,
			  819,  819,  819,  819,  566,  819,  819,  819,  819,  123,
			  819,  819,  819,  819,  123,  568,  568,  568,  568,  568,

			  568,  494,  494,  494,  494,  494,  494,  256,  819,  495,
			  495,  495,  495,  495,  495,  257,  497,  497,  497,  497,
			  497,  497,  819,  819,  123,  819,  405,  819,  406,  569,
			  496,  496,  496,  496,  496,  496,  819,  570,  123,  123,
			  572,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  408,  123,  819,  123,  819,  569,  409,  123,
			  123,  573,  819,  123,  819,  570,  123,  123,  572,  819,
			  819,  819,  819,  819,  123,  574,  123,  123,  123,  123,
			  408,  819,  819,  819,  123,  819,  409,  575,  123,  573,
			  819,  123,  123,  819,  123,  418,  579,  579,  579,  579,

			  579,  299,  819,  574,  819,  123,  123,  819,  123,  165,
			  165,  165,  165,  165,  165,  575,  421,  581,  581,  581,
			  581,  581,  299,  123,  421,  582,  581,  581,  581,  581,
			  299,  165,  165,  165,  165,  165,  165,  586,  819,  516,
			  516,  516,  516,  516,  516,  165,  165,  165,  165,  165,
			  165,  165,  165,  165,  165,  165,  165,  819,  819,  819,
			  819,  588,  165,  165,  165,  165,  165,  165,  819,  819,
			  585,  819,  819,  819,  589,  819,  587,  590,  165,  165,
			  165,  165,  165,  165,  819,  819,  819,  819,  819,  588,
			  819,  819,  819,  591,  165,  165,  165,  165,  165,  165,

			  819,  819,  589,  819,  819,  590,  819,  819,  819,  819,
			  592,  165,  165,  165,  165,  165,  165,  819,  819,  819,
			  819,  591,  593,  165,  165,  165,  165,  165,  165,  165,
			  165,  165,  165,  165,  165,  819,  819,  819,  592,  819,
			  819,  819,  819,  819,  594,  595,  819,  819,  819,  819,
			  593,  165,  165,  165,  165,  165,  165,  165,  165,  165,
			  165,  165,  165,  819,  819,  819,  596,  819,  819,  819,
			  819,  819,  594,  595,  440,  819,  528,  528,  528,  528,
			  528,  528,  257,  165,  165,  165,  165,  165,  165,  819,
			  819,  819,  819,  819,  596,  819,  819,  819,  819,  597,

			  819,  165,  165,  165,  165,  165,  165,  165,  165,  165,
			  165,  165,  165,  165,  165,  165,  165,  165,  165,  819,
			  819,  819,  819,  599,  819,  819,  819,  597,  598,  600,
			  165,  165,  165,  165,  165,  165,  165,  165,  165,  165,
			  165,  165,  819,  819,  819,  819,  601,  819,  819,  819,
			  819,  599,  819,  819,  819,  819,  598,  600,  819,  451,
			  819,  819,  451,  602,  165,  165,  165,  165,  165,  165,
			  819,  452,  819,  453,  601,  536,  536,  536,  536,  536,
			  536,  819,  454,  819,  819,  819,  819,  819,  603,  819,
			  819,  602,  604,  604,  604,  604,  604,  604,  605,  819, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  540,  540,  540,  540,  540,  540,  541,  541,  541,  541,
			  541,  541,  455,  819,  819,  819,  603,  819,  819,  819,
			  819,  819,  607,  608,  608,  608,  608,  608,  608,  609,
			  609,  609,  609,  609,  609,  819,  819,  606,  610,  610,
			  610,  610,  610,  610,  611,  611,  611,  611,  611,  611,
			  607,  612,  612,  612,  612,  612,  612,  819,  819,  819,
			  819,  819,  543,  613,  613,  613,  613,  613,  613,  615,
			  615,  615,  615,  615,  615,  819,  123,  819,  819,  819,
			  819,  819,  819,  819,  819,  250,  819,  819,  617,  819,
			  123,  123,  123,  819,  123,  618,  819,  819,  123,  819,

			  819,  819,  819,  819,  123,  123,  819,  123,  123,  819,
			  123,  819,  123,  250,  123,  819,  617,  123,  619,  123,
			  819,  123,  123,  618,  819,  819,  123,  819,  819,  819,
			  819,  123,  819,  123,  819,  819,  123,  819,  819,  123,
			  123,  123,  819,  123,  123,  123,  619,  819,  620,  819,
			  621,  123,  819,  819,  123,  123,  123,  123,  123,  819,
			  123,  819,  123,  819,  623,  123,  819,  123,  123,  123,
			  819,  819,  123,  819,  819,  819,  620,  123,  621,  123,
			  819,  819,  819,  819,  819,  123,  123,  123,  624,  123,
			  625,  123,  623,  123,  819,  819,  123,  123,  626,  819,

			  819,  123,  819,  123,  819,  123,  819,  819,  819,  819,
			  819,  123,  819,  123,  819,  123,  624,  819,  625,  819,
			  627,  819,  123,  819,  819,  123,  626,  819,  819,  819,
			  123,  819,  123,  819,  123,  819,  123,  819,  819,  819,
			  819,  819,  123,  123,  123,  279,  123,  280,  627,  568,
			  568,  568,  568,  568,  568,  629,  631,  123,  123,  123,
			  819,  819,  819,  819,  819,  123,  819,  819,  819,  819,
			  123,  123,  123,  819,  819,  123,  630,  123,  123,  819,
			  819,  819,  819,  629,  631,  819,  819,  819,  123,  819,
			  819,  123,  504,  123,  579,  579,  579,  579,  579,  579,

			  299,  123,  819,  819,  630,  123,  507,  819,  581,  581,
			  581,  581,  581,  581,  299,  638,  639,  639,  639,  639,
			  639,  509,  123,  581,  581,  581,  581,  581,  581,  299,
			  819,  505,  165,  165,  165,  165,  165,  165,  515,  641,
			  641,  641,  641,  641,  640,  508,  165,  165,  165,  165,
			  165,  165,  165,  165,  165,  165,  165,  165,  819,  819,
			  510,  819,  819,  819,  642,  165,  165,  165,  165,  165,
			  165,  819,  640,  165,  165,  165,  165,  165,  165,  165,
			  165,  165,  165,  165,  165,  819,  819,  819,  819,  643,
			  819,  819,  642,  165,  165,  165,  165,  165,  165,  819,

			  819,  819,  644,  165,  165,  165,  165,  165,  165,  165,
			  165,  165,  165,  165,  165,  819,  819,  643,  165,  165,
			  165,  165,  165,  165,  645,  819,  819,  819,  819,  819,
			  644,  819,  819,  819,  647,  819,  819,  646,  165,  165,
			  165,  165,  165,  165,  165,  165,  165,  165,  165,  165,
			  819,  819,  645,  165,  165,  165,  165,  165,  165,  819,
			  649,  819,  647,  819,  819,  646,  648,  819,  650,  165,
			  165,  165,  165,  165,  165,  165,  165,  165,  165,  165,
			  165,  165,  165,  165,  165,  165,  165,  819,  649,  819,
			  819,  819,  819,  819,  648,  652,  650,  819,  819,  819,

			  819,  819,  651,  165,  165,  165,  165,  165,  165,  537,
			  537,  537,  537,  537,  537,  819,  819,  819,  653,  819,
			  819,  819,  819,  652,  539,  654,  654,  654,  654,  654,
			  651,  655,  819,  655,  819,  819,  656,  656,  656,  656,
			  656,  656,  819,  819,  819,  819,  653,  656,  656,  656,
			  656,  656,  656,  657,  657,  657,  657,  657,  657,  545,
			  545,  545,  545,  545,  545,  660,  660,  660,  660,  660,
			  660,  661,  661,  661,  661,  661,  661,  662,  662,  662,
			  662,  662,  662,  819,  819,  819,  543,  819,  819,  663,
			  819,  819,  819,  658,  819,  819,  819,  819,  819,  123,

			  819,  819,  758,  123,  123,  819,  819,  666,  123,  665,
			  759,  664,  123,  123,  819,  123,  370,  123,  123,  123,
			  123,  658,  123,  759,  123,  819,  123,  123,  123,  819,
			  819,  123,  123,  819,  819,  666,  123,  665,  759,  664,
			  123,  819,  819,  819,  123,  123,  123,  819,  123,  123,
			  123,  819,  819,  123,  819,  819,  819,  123,  819,  123,
			  123,  123,  123,  819,  123,  819,  123,  819,  123,  819,
			  819,  123,  703,  123,  123,  819,  668,  819,  123,  819,
			  819,  819,  123,  819,  123,  123,  123,  123,  123,  819,
			  123,  123,  819,  123,  670,  123,  123,  819,  819,  123,

			  703,  819,  819,  819,  668,  819,  819,  123,  819,  123,
			  819,  663,  819,  123,  123,  819,  123,  123,  671,  123,
			  672,  123,  670,  819,  767,  819,  819,  819,  123,  819,
			  123,  819,  768,  123,  819,  123,  819,  819,  123,  819,
			  819,  819,  123,  819,  819,  768,  671,  123,  672,  679,
			  819,  639,  639,  639,  639,  639,  639,  819,  819,  123,
			  768,  819,  819,  819,  123,  165,  165,  165,  165,  165,
			  165,  586,  819,  641,  641,  641,  641,  641,  641,  165,
			  165,  165,  165,  165,  165,  819,  819,  819,  680,  819,
			  819,  819,  681,  165,  165,  165,  165,  165,  165,  819,

			  682,  165,  165,  165,  165,  165,  165,  819,  819,  819,
			  587,  819,  819,  819,  819,  683,  819,  819,  819,  819,
			  681,  165,  165,  165,  165,  165,  165,  819,  682,  165,
			  165,  165,  165,  165,  165,  165,  165,  165,  165,  165,
			  165,  819,  819,  683,  165,  165,  165,  165,  165,  165,
			  165,  165,  165,  165,  165,  165,  165,  165,  165,  165,
			  165,  165,  165,  165,  165,  165,  165,  165,  819,  819,
			  819,  819,  819,  684,  819,  819,  819,  819,  685,  165,
			  165,  165,  165,  165,  165,  819,  165,  165,  165,  165,
			  165,  165,  656,  656,  656,  656,  656,  656,  686,  819,

			  819,  684,  687,  819,  819,  605,  685,  654,  654,  654,
			  654,  654,  654,  656,  656,  656,  656,  656,  656,  688,
			  688,  688,  688,  688,  688,  819,  686,  689,  819,  689,
			  687,  819,  690,  690,  690,  690,  690,  690,  692,  692,
			  692,  692,  692,  692,  606,  696,  696,  696,  696,  696,
			  696,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  658,  819,  819,  819,  819,  698,  123,  819,  819,
			  819,  123,  123,  700,  819,  819,  699,  819,  819,  819,
			  819,  123,  819,  123,  370,  123,  123,  123,  123,  658,
			  701,  123,  819,  819,  698,  123,  819,  819,  819,  123, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  123,  700,  819,  819,  699,  123,  819,  123,  819,  123,
			  704,  819,  123,  123,  819,  819,  123,  123,  701,  123,
			  819,  819,  819,  123,  819,  123,  819,  123,  819,  123,
			  638,  710,  710,  710,  710,  710,  123,  123,  704,  819,
			  819,  123,  165,  165,  165,  165,  165,  165,  165,  165,
			  165,  165,  165,  165,  123,  819,  711,  819,  123,  165,
			  165,  165,  165,  165,  165,  819,  819,  819,  712,  165,
			  165,  165,  165,  165,  165,  713,  165,  165,  165,  165,
			  165,  165,  819,  714,  711,  165,  165,  165,  165,  165,
			  165,  715,  819,  819,  819,  819,  712,  819,  819,  819,

			  819,  716,  819,  713,  165,  165,  165,  165,  165,  165,
			  819,  714,  690,  690,  690,  690,  690,  690,  819,  715,
			  717,  717,  717,  717,  717,  717,  819,  819,  819,  716,
			  718,  718,  718,  718,  718,  718,  550,  550,  550,  550,
			  550,  550,  719,  719,  719,  719,  719,  719,  720,  720,
			  720,  720,  720,  720,  819,  819,  819,  819,  819,  543,
			  721,  721,  721,  721,  721,  721,  819,  819,  819,  819,
			  123,  819,  819,  819,  723,  819,  658,  819,  819,  819,
			  819,  819,  819,  819,  123,  819,  123,  819,  819,  123,
			  819,  819,  819,  123,  123,  725,  819,  123,  123,  370,

			  819,  819,  723,  724,  658,  123,  819,  123,  123,  123,
			  123,  123,  123,  123,  819,  123,  819,  123,  819,  819,
			  819,  123,  123,  725,  819,  123,  726,  819,  123,  819,
			  819,  724,  819,  819,  123,  819,  819,  819,  123,  123,
			  123,  679,  123,  710,  710,  710,  710,  710,  710,  819,
			  819,  819,  819,  819,  726,  819,  819,  123,  165,  165,
			  165,  165,  165,  165,  165,  165,  165,  165,  165,  165,
			  165,  165,  165,  165,  165,  165,  819,  732,  819,  819,
			  680,  165,  165,  165,  165,  165,  165,  165,  165,  165,
			  165,  165,  165,  733,  819,  819,  819,  734,  165,  165,

			  165,  165,  165,  165,  819,  732,  688,  688,  688,  688,
			  688,  688,  737,  737,  737,  737,  737,  737,  819,  819,
			  819,  733,  819,  819,  693,  734,  693,  735,  819,  720,
			  720,  720,  720,  720,  720,  721,  721,  721,  721,  721,
			  721,  819,  819,  819,  819,  543,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  735,  819,  123,  740,  819,
			  123,  819,  819,  695,  819,  819,  819,  123,  819,  819,
			  819,  123,  819,  123,  123,  123,  123,  819,  741,  819,
			  742,  123,  819,  123,  819,  123,  740,  819,  123,  123,
			  819,  123,  819,  743,  819,  123,  752,  752,  752,  752,

			  752,  752,  123,  123,  819,  123,  819,  741,  742,  819,
			  819,  819,  123,  165,  165,  165,  165,  165,  165,  819,
			  123,  819,  743,  165,  165,  165,  165,  165,  165,  747,
			  165,  165,  165,  165,  165,  165,  165,  165,  165,  165,
			  165,  165,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  748,  747,  749,  123,
			  123,  819,  819,  123,  819,  819,  819,  123,  123,  750,
			  819,  819,  819,  755,  123,  123,  123,  123,  756,  123,
			  819,  123,  123,  123,  123,  748,  749,  123,  123,  819,
			  819,  123,  819,  819,  819,  123,  123,  819,  750,  819,

			  819,  755,  819,  819,  123,  123,  756,  819,  123,  819,
			  819,  819,  123,  123,  165,  165,  165,  165,  165,  165,
			  165,  165,  165,  165,  165,  165,  165,  165,  165,  165,
			  165,  165,  165,  165,  165,  165,  165,  165,  819,  819,
			  819,  819,  819,  760,  762,  762,  762,  762,  762,  762,
			  695,  695,  695,  695,  695,  695,  123,  761,  763,  763,
			  763,  763,  763,  763,  819,  819,  819,  819,  819,  819,
			  123,  760,  123,  819,  764,  819,  819,  819,  819,  819,
			  123,  765,  819,  819,  123,  761,  165,  165,  165,  165,
			  165,  165,  819,  819,  123,  819,  123,  819,  819,  819,

			  819,  123,  819,  764,  819,  819,  819,  819,  123,  765,
			  165,  165,  165,  165,  165,  165,  819,  819,  819,  769,
			  819,  819,  819,  819,  819,  123,  770,  774,  819,  775,
			  776,  819,  763,  763,  763,  763,  763,  763,  819,  123,
			  165,  165,  165,  165,  165,  165,  819,  819,  769,  777,
			  819,  819,  819,  123,  770,  123,  165,  165,  165,  165,
			  165,  165,  819,  819,  819,  780,  819,  123,  781,  781,
			  781,  781,  781,  781,  819,  819,  819,  777,  783,  783,
			  783,  783,  783,  783,  123,  786,  786,  786,  786,  786,
			  786,  819,  819,  780,  819,  819,  165,  165,  165,  165,

			  165,  165,  791,  791,  791,  791,  791,  791,  819,  819,
			  123,  787,  790,  792,  792,  792,  792,  792,  792,  819,
			  819,  819,  819,  819,  123,  819,  123,  783,  783,  783,
			  783,  783,  783,  819,  819,  819,  784,  819,  123,  787,
			  790,  783,  783,  783,  783,  783,  783,  819,  819,  123,
			  819,  774,  819,  775,  793,  123,  786,  786,  786,  786,
			  786,  786,  819,  123,  819,  123,  165,  165,  165,  165,
			  165,  165,  819,  819,  819,  819,  819,  123,  796,  796,
			  796,  796,  796,  796,  800,  800,  800,  800,  800,  800,
			  819,  819,  819,  819,  123,  773,  773,  773,  773,  773,

			  773,  803,  803,  803,  803,  803,  803,  774,  819,  775,
			  819,  819,  800,  800,  800,  800,  800,  800,  807,  807,
			  807,  807,  807,  807,  808,  808,  808,  808,  808,  808,
			  811,  811,  811,  811,  811,  811,  799,  799,  799,  799,
			  799,  799,  815,  815,  815,  815,  815,  815,  816,  816,
			  816,  816,  816,  816,  817,  817,  817,  817,  817,  817,
			  812,  819,  812,  819,  819,  816,  816,  816,  816,  816,
			  816,  818,  818,  818,  818,  818,  818,  814,  814,  814,
			  814,  814,  814,  109,  109,  109,  109,  109,  109,  109,
			  677,  677,  677,  677,  677,  677,  677,  819,  819,  814,

			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,   91,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,   91,   91,   91, yy_Dummy>>,
			1, 1000, 5000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			   91,   91,   91,   91,  104,  104,  819,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  819,  104,  104,  104,  104,
			  106,  106,  819,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  123,  123,  123,  819,
			  819,  819,  819,  819,  123,  123,  123,  819,  123,  123,
			  123,  123,  123,  123,  123,  819,  819,  123,  123,  123,
			  156,  156,  819,  156,  819,  156,  156,  819,  819,  156,
			  156,  156,  156,  156,  156,  156,  819,  819,  156,  156,

			  156,  160,  160,  819,  160,  160,  160,  160,  160,  160,
			  160,  160,  160,  160,  160,  160,  160,  160,  160,  160,
			  160,  160,  160,  160,  160,  160,  160,  165,  819,  165,
			  165,  819,  819,  819,  165,  165,  165,  819,  819,  165,
			  165,  165,  165,  165,  165,  165,  165,  819,  165,  165,
			  165,  193,  193,  819,  193,  193,  193,  193,  193,  193,
			  193,  193,  193,  193,  193,  193,  193,  193,  193,  193,
			  193,  193,  819,  193,  193,  193,  193,  203,  203,  203,
			  203,  203,  203,  203,  203,  203,  203,  203,  203,  203,
			  203,  203,  203,  203,  203,  203,  203,  203,  203,  203,

			  203,  203,  203,  207,  207,  207,  207,  207,  207,  207,
			  207,  207,  207,  207,  207,  207,  207,  207,  207,  207,
			  207,  207,  207,  207,  207,  207,  207,  207,  207,  212,
			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  225,  819,  225,  819,  819,  819,  225,  819,  225,
			  225,  819,  819,  225,  225,  225,  225,  225,  225,  225,

			  819,  819,  225,  225,  225,  232,  232,  819,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  109,  819,  819,  819,  109,  109,  819,  819,  109,
			  109,  109,  109,  109,  109,  109,  819,  819,  109,  109,
			  109,  110,  110,  110,  110,  110,  110,  110,  110,  110,
			  110,  110,  110,  110,  110,  110,  110,  110,  110,  110,
			  110,  110,  110,  110,  110,  110,  110,  114,  114,  114,
			  819,  819,  114,  114,  114,  114,  114,  114,  114,  114,
			  819,  114,  114,  114,  258,  819,  819,  258,  258,  258,

			  258,  258,  258,  258,  258,  258,  258,  258,  819,  819,
			  258,  258,  258,  205,  205,  205,  205,  205,  205,  205,
			  205,  819,  205,  205,  205,  205,  205,  205,  205,  205,
			  205,  205,  205,  205,  205,  205,  205,  205,  205,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  218,  218,  218,  819,  819,
			  819,  819,  819,  819,  819,  819,  218,  218,  218,  218,
			  218,  218,  218,  218,  819,  819,  819,  819,  819,  218,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,

			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  376,  376,  819,  819,  376,  376,  376,  376,
			  376,  376,  376,  819,  819,  376,  376,  376,  377,  377,
			  819,  819,  377,  377,  377,  377,  377,  377,  377,  819,
			  819,  377,  377,  377,  305,  305,  305,  819,  819,  305,
			  305,  305,  305,  305,  305,  305,  305,  819,  305,  305,
			  305,  348,  348,  348,  348,  348,  348,  348,  348,  348,

			  348,  348,  348,  348,  348,  348,  348,  348,  348,  348,
			  348,  348,  348,  348,  348,  348,  348,  473,  473,  473,
			  473,  473,  473,  473,  819,  819,  473,  473,  473,  552,
			  552,  552,  552,  552,  552,  552,  819,  819,  552,  552,
			  552,  553,  553,  819,  819,  553,  553,  553,  553,  553,
			  553,  553,  819,  819,  553,  553,  553,  616,  616,  819,
			  819,  616,  616,  616,  616,  616,  616,  616,  819,  819,
			  616,  616,  616,  697,  697,  697,  697,  697,  697,  697,
			  819,  677,  697,  697,  697,  677,  677,  819,  819,  677,
			  677,  677,  677,  677,  677,  677,  819,  819,  677,  677,

			  677,  722,  722,  819,  819,  722,  722,  722,  722,  722,
			  722,  722,  819,  819,  722,  722,  722,  753,  753,  819,
			  819,  753,  753,  753,  753,  753,  753,  753,  819,  819,
			  753,  753,  753,   13,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,

			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819, yy_Dummy>>,
			1, 825, 6000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 6824)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			yy_chk_template_3 (an_array)
			yy_chk_template_4 (an_array)
			yy_chk_template_5 (an_array)
			yy_chk_template_6 (an_array)
			yy_chk_template_7 (an_array)
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
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    3,    5,    7,    6,    3,    4,    8,    9,

			    9,    4,    9,   10,   10,   15,   10,   15,   15,   20,
			   38,   38,    9,   38,   84,   27,   10,   27,   27,   27,
			   27,   27,   27,   40,   40,   78,   40,   53,   86,    5,
			    5,    6,    6,  114,   38,   53,   53,  424,   87,   69,
			   69,   97,   38,    3,   97,   69,  795,   40,    4,    7,
			   84,   84,  794,    8,   20,    9,  322,  785,  322,   10,
			   69,   76,  775,   76,   76,   86,   86,   69,   69,  114,
			   38,  424,   78,   69,   87,   87,    3,    3,    3,    3,
			    3,    4,    4,    4,    4,    4,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,

			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   29,  149,   29,
			  767,   29,   29,   29,   29,   29,   29,   30,   80,   30,
			  159,   30,   30,   30,   30,   30,   30,  158,   37,   37,

			   92,   37,  335,   92,   39,   39,  149,   39,  766,   41,
			   41,   88,   41,  303,   42,   42,   79,   42,  212,   82,
			   29,  101,   37,  101,  101,   81,   43,   43,   39,   43,
			   30,   37,   39,   41,  158,   37,  159,   37,   42,  305,
			  162,   39,   42,  162,   45,   45,   41,   45,  162,  303,
			   43,  341,   44,   44,   42,   44,   92,   41,   83,   37,
			   39,   43,  739,   37,  471,   37,   88,   80,   45,   39,
			   42,  730,   45,  212,   41,  305,   44,   46,   46,  203,
			   46,  335,   42,  148,   47,   47,   41,   47,  341,   43,
			   44,   44,  718,   79,   79,   79,   44,   82,   82,  688,

			   45,   46,   81,   81,   81,  471,  122,  122,   47,  122,
			   51,   51,  148,   51,   47,  203,  203,   46,   44,   44,
			   52,   52,  151,   52,   44,   49,   49,   47,   49,  195,
			  122,  195,  195,  680,   51,   83,   83,   83,  151,  677,
			   50,   50,   47,   50,   52,   46,  637,  199,  219,   49,
			   51,  219,  151,  151,  151,   47,   48,   48,  224,   48,
			   49,  224,  157,  206,   50,  635,  151,  634,   49,   52,
			  157,   48,   48,   48,   48,   48,   48,   48,   51,   50,
			   48,  151,   59,  151,   50,   59,  228,   48,   49,  228,
			   59,  207,  217,  217,   48,  217,   49,   59,   52,  206,

			  206,   48,  515,   48,  219,   48,   57,   50,   58,   57,
			   59,   58,   50,  157,   57,   48,   58,  230,  217,   59,
			  230,   57,   48,   58,  199,  199,  199,   60,  207,  207,
			   60,  633,   48,   59,   48,   60,  377,  209,   59,   57,
			   58,  515,   60,   57,  377,   57,   61,   59,   62,   61,
			   63,   62,  417,   63,   61,  417,   62,   57,   63,   58,
			  632,   61,  616,   62,  612,   63,  606,   57,   58,  240,
			  240,   57,  240,   57,  209,  209,   62,  241,   60,  241,
			  241,   64,  727,   61,   64,   63,  337,   65,   62,   64,
			   65,  467,  467,  240,   61,   65,   64,   61,  539,   62,

			  452,   63,   65,  452,   62,   99,   66,  454,   99,   66,
			  454,   61,  587,   63,   66,   65,   62,   99,   99,   64,
			   64,   66,  583,   61,  727,   64,   67,   68,   99,   67,
			   68,  198,   64,  638,   67,   68,   70,  539,   65,   70,
			   64,   67,   68,   65,   70,  200,   66,   64,   64,  571,
			  390,   70,   71,   64,  553,   71,   67,   66,   99,  545,
			   71,  390,   68,  100,  337,  337,  100,   71,  537,   67,
			   68,  390,  638,  512,   66,  100,   70,   67,   68,  483,
			  351,  351,  108,  351,   67,  511,  100,   70,  460,  390,
			   68,  108,  108,  108,  108,  108,  108,   67,   68,  344,

			  344,   71,  344,   71,   70,  112,  112,  112,  112,  112,
			  112,  198,  198,  198,  198,  198,  100,  352,  352,  425,
			  352,  112,  200,  200,  200,  344,  678,  108,  511,  678,
			   71,   89,   89,  491,   89,  115,  115,  115,  115,  115,
			  115,  491,  108,  379,  112,  376,  108,  366,  108,  112,
			  118,  118,  118,  118,  118,  118,  353,   89,  348,   89,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,  116,  116,  116,  116,  116,  116,  223,  223,
			  223,  223,  223,  223,  343,  117,  362,  117,  116,  117,

			  117,  117,  117,  117,  117,  117,  309,  123,  123,  119,
			  123,  119,   89,  119,  119,  119,  119,  119,  119,  362,
			  123,  123,  125,  125,  362,  125,  116,  126,  126,  123,
			  126,  123,  722,  722,  299,  125,  125,  270,  117,  201,
			  126,  126,  270,  258,  125,  257,  125,  127,  127,  126,
			  127,  126,  119,  270,  182,  182,  182,  182,  182,  182,
			  127,  127,  506,  270,  126,  506,  202,  125,  247,  127,
			  246,  127,  128,  128,  418,  128,  129,  129,  127,  129,
			  527,  270,  418,  182,  239,  128,  128,  506,  527,  129,
			  129,  421,  126,  238,  128,  125,  128,  237,  129,  421,

			  129,  130,  130,  236,  130,  128,  127,  131,  131,  234,
			  131,  182,  226,  418,  130,  130,  201,  201,  201,  129,
			  131,  131,  222,  130,  570,  130,  736,  736,  736,  131,
			  421,  131,  570,  128,  261,  132,  132,  562,  132,  133,
			  133,  130,  133,  202,  202,  202,  221,  129,  132,  132,
			  261,  131,  133,  133,  562,  753,  753,  132,  562,  132,
			  220,  133,  216,  133,  261,  132,  261,  134,  134,  130,
			  134,  132,  135,  135,  210,  135,  133,  208,  261,  131,
			  134,  134,  562,  205,  610,  135,  135,  136,  136,  134,
			  136,  134,  193,  132,  135,  261,  135,  169,  744,  132, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  136,  136,  137,  137,  133,  137,  744,  610,  163,  136,
			  134,  136,  610,  160,  156,  137,  137,  138,  138,  744,
			  138,  155,  139,  139,  137,  139,  137,  143,  136,  111,
			  138,  138,  137,  110,  744,  139,  139,  155,  134,  138,
			  580,  138,  411,  580,  139,  109,  139,  411,  580,  140,
			  140,  155,  140,  155,  106,  155,  136,  104,  411,  729,
			  137,  768,  140,  140,  102,  155,   98,  139,  411,  768,
			  729,  140,  138,  140,  141,  141,  622,  141,  142,  142,
			   95,  142,  155,   94,  155,   93,  411,  141,  141,   75,
			   72,  142,  142,  622,  140,  139,  141,  622,  141,   56,

			  142,  729,  142,   35,  141,  145,  145,   33,  145,  142,
			   28,  146,  146,   26,  146,  263,   18,   17,  145,  145,
			  145,  622,  140,   16,  146,  146,  146,  145,   13,  145,
			  152,  263,  141,  146,    0,  146,    0,  142,  144,  144,
			  144,  144,  146,    0,  334,  263,  152,  263,  144,  290,
			  145,  152,  150,    0,    0,  152,  146,  144,  146,  263,
			  152,  144,  152,  290,  144,  290,    0,    0,  150,  150,
			  146,  144,  150,  144,  152,  144,  263,  290,  225,  152,
			    0,  225,  150,  152,  150,  144,    0,  146,    0,  144,
			  225,  152,  144,    0,  290,  628,  150,  150,  153,    0,

			  150,  225,  144,    0,  144,  147,  147,  147,  147,  147,
			  147,    0,  628,  150,  153,  153,  628,    0,    0,  154,
			  147,  334,  334,  334,  147,    0,    0,  147,  153,    0,
			  153,  225,    0,  147,  147,  154,  147,  843,  843,  843,
			  628,  227,  153,  153,  227,    0,    0,  154,  147,  154,
			  745,  154,  147,  227,  165,  147,    0,  165,  745,  153,
			    0,  147,  165,  154,  227,  147,    0,  165,  165,  165,
			  166,  745,    0,  166,  167,  154,  165,  167,  166,  470,
			  154,  470,  167,  166,  166,  166,  745,  167,  167,  167,
			  470,    0,  166,    0,  227,  168,  167,  336,  168,    0,

			    0,  498,    0,  168,  338,  165,    0,    0,  168,  168,
			  168,  167,  498,    0,    0,  166,  170,  168,  470,  170,
			  171,  166,  498,  171,  170,  167,  168,    0,  171,  170,
			  170,  170,  673,  171,  171,  171,  673,    0,  170,  167,
			  498,    0,  171,  166,  172,  339,  168,  172,    0,  170,
			    0,  340,  172,  673,  168,    0,    0,  172,  172,  172,
			    0,    0,    0,  171,  673,  173,  172,  170,  173,  669,
			    0,  171,    0,  173,  336,  336,  336,  170,  173,  173,
			  173,  338,  338,  338,  172,  174,  669,  173,  174,  175,
			  669,  171,  175,  174,    0,  172,    0,  175,  174,  174,

			  174,    0,  175,  175,  175,  176,    0,  174,  176,  173,
			    0,  175,  172,  176,  669,  174,  173,    0,  176,  176,
			  176,  174,  339,  339,  339,    0,  175,  176,  340,  340,
			  340,  177,    0,    0,  177,    0,  174,  173,  674,  177,
			  175,    0,  674,  174,  177,  177,  177,  178,  176,  174,
			  178,    0,  289,  177,  175,  178,  176,    0,    0,  674,
			  178,  178,  178,  757,  179,  289,  289,  179,  289,  178,
			  674,  757,  179,    0,    0,    0,  176,  179,  179,  179,
			  289,    0,  177,    0,  757,    0,  179,  180,  178,    0,
			  180,    0,    0,  289,  179,  180,    0,  289,  178,  757,

			  180,  180,  180,  184,  184,  184,  184,  184,  184,  180,
			  252,  252,  252,  252,  252,  179,  178,  184,  659,  659,
			  659,  659,  179,  183,  183,  183,  183,  183,  183,  185,
			  185,  185,  185,  185,  185,    0,    0,    0,  180,  827,
			    0,    0,  180,  181,  185,  184,  181,    0,    0,    0,
			    0,  181,  183,  827,  827,  827,  181,  181,  181,  181,
			  181,  181,  181,  181,  181,  181,  186,  186,  186,  186,
			  186,  186,  185,  187,  187,  187,  187,  187,  187,    0,
			  183,    0,  186,    0,  188,  188,  188,  188,  188,  188,
			    0,    0,    0,    0,  181,  189,  189,  189,  189,  189,

			  189,    0,    0,  187,  188,    0,    0,    0,  188,    0,
			  186,  189,    0,  190,  190,  190,  190,  190,  190,  191,
			  191,  191,  191,  191,  191,  245,  245,  245,  245,  245,
			  245,  187,  188,    0,    0,    0,  188,    0,    0,  189,
			  190,  235,  235,  235,  235,  235,  235,  235,    0,    0,
			    0,    0,  191,  243,  243,  243,  243,  243,  243,  248,
			  248,  248,  248,  248,  248,  244,    0,  244,  190,  243,
			  244,  244,  244,  244,  244,  244,  549,  549,  549,  549,
			  549,  191,  213,  213,    0,  213,  253,  253,  253,  253,
			  253,  253,  243,  250,    0,  250,    0,  243,  250,  250,

			  250,  250,  250,  250,    0,    0,    0,    0,  213,    0,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  279,  279,  279,  279,  279,  279,  249,
			  249,  249,  249,  249,  249,  280,  280,  280,  280,  280,
			  280,    0,  251,    0,  251,  249,  251,  251,  251,  251,
			  251,  251,    0,  213,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  249,  801,
			  229,  259,  762,  249,  762,    0,  758,  229,  229,  229,
			  229,  229,  229,  762,  758,  251,  801,  259,  259,  275,

			  801,  282,  282,  282,  282,  282,  282,  758,    0,    0,
			    0,  259,    0,  259,    0,  275,  229,  229,  229,  229,
			    0,  762,  758,    0,  801,  259,  259,    0,    0,  275,
			  282,  275,  283,  283,  283,  283,  283,  283,    0,  260,
			  262,    0,  259,  275,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  260,  262,  503,  264,  265,
			  275,    0,    0,    0,  260,  262,    0,    0,  503,  260,
			  262,  260,  262,    0,  264,  265,  265,    0,  503,  267,
			    0,    0,    0,  260,  262,    0,  576,  264,  264,  265,
			  264,  265,  260,  262,  266,  267,  503,  576,  291,    0,

			  260,  262,  264,  265,  265,  268,    0,  576,  267,  267,
			  266,  267,    0,  269,  291,  264,  266,    0,    0,  264,
			  265,  268,  291,  267,  266,  576,  266,    0,  291,  269,
			  291,    0,    0,    0,  268,  268,  267,  268,  266,    0,
			  267,    0,  291,  269,  266,  269,    0,  271,  272,  268,
			  291,  273,  297,  269,  778,  266,    0,  269,    0,  291,
			    0,    0,  268,  271,  272,  778,  268,  273,  297,  271,
			  272,  274,  273,    0,  269,  778,    0,  271,  272,  271,
			  272,  273,  297,  273,  297,    0,  274,  274,    0,  276,
			    0,  271,  272,  778,  277,  273,  297,  271,  272,    0, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  273,  274,  675,  274,    0,  276,  675,    0,  271,  272,
			  277,  277,  273,  297,  274,  274,    0,    0,    0,  276,
			  276,  276,    0,  675,  277,    0,  277,  709,  709,    0,
			  709,    0,  274,  276,  675,    0,    0,    0,  277,  277,
			  281,  281,  281,  281,  281,  281,  281,    0,  276,    0,
			  276,  709,    0,    0,    0,  277,  281,  284,  284,  284,
			  284,  284,  284,  285,  285,  285,  285,  285,  285,    0,
			  281,    0,  281,  286,  286,  286,  286,  286,  286,  287,
			  293,  287,  287,    0,  281,  288,  288,  288,  288,  288,
			  288,  292,  802,    0,    0,    0,  293,  293,  292,  294,

			    0,  281,  287,    0,  288,  287,  295,  292,    0,  802,
			  293,  287,  293,  802,    0,  294,  661,  661,  661,  661,
			    0,  292,  295,  292,  293,  293,  294,    0,  577,  294,
			  287,  294,  288,  287,  295,  292,  295,  802,  295,  287,
			  296,  293,  577,  294,    0,  298,  349,  349,    0,  349,
			  295,  578,  292,  577,  294,  661,  296,  805,  349,    0,
			  294,  298,  295,  577,    0,  578,    0,  295,    0,  349,
			  296,    0,  296,    0,  805,  298,  578,  298,  805,  298,
			  296,  577,    0,    0,  296,    0,  578,    0,    0,  298,
			  300,  300,  300,  300,  300,  300,  300,    0,    0,  349,

			    0,  296,  805,    0,  578,    0,  298,  301,  298,  301,
			  301,  301,  301,  301,  301,  301,  302,  302,  302,  302,
			  302,  302,  302,  306,  306,  306,  306,  306,  306,  307,
			  307,  307,  307,  307,  307,    0,    0,    0,    0,  306,
			  308,  308,  308,  308,  308,  308,  310,  310,  310,  310,
			  310,  310,  380,  307,  311,  311,  311,  311,  311,  311,
			  312,  312,  312,  312,  312,  312,    0,  306,  380,  311,
			  310,  313,  313,  313,  313,  313,  313,    0,    0,    0,
			  380,  307,  380,  451,  380,    0,  451,  313,  312,  314,
			  314,  314,  314,  314,  314,  451,  380,  311,  310,  315,

			  315,  315,  315,  315,  315,  676,  451,    0,  380,  676,
			  314,    0,    0,  380,  779,  313,  312,  316,  316,  316,
			  316,  316,  316,    0,    0,  779,  676,  315,  317,  317,
			  317,  317,  317,  317,    0,  779,  451,  676,  314,  318,
			  318,  318,  318,  318,  318,  316,    0,  319,  319,  319,
			  319,  319,  319,  779,    0,  315,  808,  808,  808,  808,
			  318,  320,  320,  320,  320,  320,  320,  317,  319,    0,
			    0,    0,  321,  316,  321,  321,  321,  321,  321,  321,
			    0,  320,  324,  324,  324,  324,  324,  324,  318,  323,
			  323,  323,  323,  323,  323,  808,  319,  325,  325,  325,

			  325,  325,  325,  323,  772,  772,  772,  772,  772,  320,
			  326,  326,  326,  326,  326,  326,  327,  327,  327,  327,
			  327,  327,    0,    0,    0,    0,  326,  325,    0,    0,
			  806,  323,  328,  328,  328,  328,  328,  328,    0,  327,
			  329,  329,  329,  329,  329,  329,    0,  806,  328,    0,
			    0,  806,    0,  788,  326,  325,  330,  330,  330,  330,
			  330,  330,    0,    0,  788,    0,  329,  327,  331,  331,
			  331,  331,  331,  331,  788,  806,  328,  332,  332,  332,
			  332,  332,  332,  330,  333,  333,  333,  333,  333,  333,
			  346,    0,  788,  346,  329,  356,  356,  356,  356,  356,

			  356,  356,  346,  792,  346,  792,  347,  331,    0,  347,
			    0,  330,    0,  346,  792,    0,    0,  333,  347,    0,
			  347,    0,  347,  347,  347,  347,  347,  347,    0,  347,
			  363,  363,  363,  363,  363,  363,  364,  364,  364,  364,
			  364,  364,  792,  346,    0,    0,  333,  365,  365,  365,
			  365,  365,  365,  367,  367,  367,  367,  367,  367,  347,
			  368,  368,  368,  368,  368,  368,  370,  370,  370,  370,
			  370,  370,  369,    0,  369,  364,  368,  369,  369,  369,
			  369,  369,  369,  371,  371,  371,  371,  371,  371,  372,
			  372,  372,  372,  372,  372,    0,    0,    0,    0,  368,

			    0,    0,  373,  373,  368,  373,  373,  373,  373,  373,
			  373,  374,  374,  374,  374,  374,  374,  375,  375,  375,
			  375,  375,  375,  381,  382,    0,    0,  383,  372,    0,
			  384,    0,    0,  385,    0,    0,    0,  705,    0,  381,
			  382,  705,    0,  383,    0,    0,  384,  384,  383,  385,
			    0,    0,  382,  381,  382,  381,  382,  383,  705,  383,
			  384,    0,  384,  385,    0,  385,  386,  381,  382,  705,
			  387,  383,    0,  388,  384,  384,  383,  385,    0,  389,
			  382,    0,  386,  706,  381,  382,  387,  706,  383,  388,
			  388,  384,  389,    0,  385,  389,  386,  386,  386,    0,

			  387,    0,  387,  388,  706,  388,  393,    0,    0,  389,
			  386,  389,    0,  392,  387,  706,  391,  388,  388,  395,
			  389,    0,  393,  389,    0,  386,    0,  386,  387,  392,
			  393,  387,  391,    0,  388,  395,  393,  391,  393,  394,
			  389,    0,    0,  392,  392,  392,  391,  395,  391,  395,
			  393,  395,    0,    0,  396,  394,    0,  392,  393,  394,
			  391,    0,    0,  395,    0,  391,    0,  393,    0,  394,
			  396,  394,  392,    0,  392,  395,    0,  391,    0,    0,
			  395,    0,  396,  394,  396,    0,  396,  394,  397,  397,
			  397,  397,  397,  397,  399,    0,  399,    0,  396,  398,

			  394,  398,  398,  398,  398,  398,  398,  398,    0,    0,
			  396,    0,    0,    0,    0,  396,  397,  399,    0,    0,
			  399,  400,  400,  400,  400,  400,  400,  399,  401,  398,
			  401,    0,  401,  401,  401,  401,  401,  401,  402,  402,
			  402,  402,  402,  402,  397,  399,    0,  707,  399,  708,
			  400,  707,    0,  708,  401,    0,    0,  398,    0,    0,
			  402,  401,  403,  403,  403,  403,  403,  403,  707,    0,
			  708,  402,  798,  798,  798,  798,  798,  403,    0,  707,
			    0,  708,  401,    0,    0,    0,    0,    0,  402,    0,
			    0,  403,  404,  404,  404,  404,  404,  404,    0,    0,

			  402,    0,    0,    0,    0,  403,  405,  405,  405,  405,
			  405,  405,  406,  406,  406,  406,  406,  406,  407,  407,
			  407,  407,  407,  407,    0,  404,  408,  408,  408,  408,
			  408,  408,  409,  410,    0,    0,  412,  414,    0,  789,
			  413,  416,    0,  416,    0,    0,    0,  407,  409,  410,
			  789,    0,  412,  414,  404,  408,  413,    0,  474,  416,
			  789,    0,  409,  410,  409,  410,  412,  414,  412,  414,
			  413,  413,  413,  416,  474,  416,  409,  410,  789,  415,
			  412,  414,    0,    0,  413,    0,    0,  416,  474,    0,
			  474,    0,  415,  409,  410,  415,    0,  412,  414,  413, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,  413,  474,  415,  416,    0,    0,    0,    0,  415,
			  419,  415,  419,  419,  419,  419,  419,  419,  419,  474,
			  415,    0,  420,  415,  420,  420,  420,  420,  420,  420,
			  420,  415,    0,  426,  426,  426,  426,  426,  426,  422,
			  415,  422,  422,  422,  422,  422,  422,  422,  423,  419,
			  423,  423,  423,  423,  423,  423,  423,    0,    0,    0,
			  426,  420,  427,  427,  427,  427,  427,  427,  428,  428,
			  428,  428,  428,  428,    0,    0,    0,    0,  422,  429,
			  429,  429,  429,  429,  429,    0,    0,  423,  426,    0,
			    0,    0,    0,  427,  430,  430,  430,  430,  430,  430,

			  431,  431,  431,  431,  431,  431,  429,  432,  432,  432,
			  432,  432,  432,    0,  430,    0,  431,    0,    0,    0,
			    0,    0,  427,  433,  433,  433,  433,  433,  433,    0,
			    0,    0,    0,    0,  429,  434,  434,  434,  434,  434,
			  434,    0,  430,    0,  431,  435,  435,  435,  435,  435,
			  435,    0,    0,  433,  436,  436,  436,  436,  436,  436,
			    0,  435,    0,    0,  434,    0,  436,  437,  437,  437,
			  437,  437,  437,  438,  438,  438,  438,  438,  438,    0,
			    0,  433,    0,    0,    0,    0,    0,  437,    0,  435,
			    0,    0,  434,    0,  436,  439,  439,  439,  439,  439,

			  439,    0,    0,  438,  440,  440,  440,  440,  440,  440,
			    0,    0,    0,    0,    0,  437,    0,    0,  439,  441,
			  441,  441,  441,  441,  441,  442,  442,  442,  442,  442,
			  442,  438,  443,  443,  443,  443,  443,  443,  441,  444,
			  444,  444,  444,  444,  444,    0,  439,    0,    0,    0,
			    0,    0,  442,  445,  445,  445,  445,  445,  445,  443,
			  446,  446,  446,  446,  446,  446,  441,  447,  447,  447,
			  447,  447,  447,  448,  448,  448,  448,  448,  448,    0,
			  442,    0,  447,    0,    0,  448,    0,  443,    0,    0,
			  446,    0,    0,    0,  449,    0,  448,  449,  449,  449,

			  449,  449,  449,  453,  453,  453,  453,  453,  453,    0,
			  447,    0,    0,  448,    0,    0,    0,    0,  446,    0,
			    0,    0,    0,    0,  448,  456,  456,  456,  456,  456,
			  456,  457,  457,  457,  457,  457,  457,  458,  458,  458,
			  458,  458,  458,  459,  459,  459,  459,  459,  459,  461,
			  461,  461,  461,  461,  461,  462,  462,  462,  462,  462,
			  462,    0,    0,    0,  456,  461,  463,  463,  463,  463,
			  463,  463,  464,  464,  464,  464,  464,  464,  465,  465,
			  465,  465,  465,  465,    0,    0,    0,    0,  461,    0,
			    0,    0,    0,  461,  466,  466,  466,  466,  466,  466,

			    0,    0,    0,    0,    0,  463,  468,  468,  468,  468,
			  468,  468,  475,  476,    0,    0,  469,  465,  469,  469,
			  469,  469,  469,  469,    0,    0,    0,    0,  475,  476,
			  476,  477,  478,    0,    0,  479,  493,  493,  493,  493,
			  493,  493,  475,  476,  475,  476,    0,  477,  478,    0,
			  481,  479,  475,    0,    0,  477,  475,  476,  476,    0,
			    0,  477,  478,  477,  478,  479,  481,  479,  480,    0,
			    0,    0,    0,  475,  476,  477,  478,    0,    0,  479,
			  481,    0,  481,  477,  480,  480,  482,  484,    0,    0,
			  485,  486,  477,  478,  481,    0,  479,  480,  480,    0,

			  480,    0,  482,  484,  484,    0,  485,  486,  482,    0,
			  487,  481,  480,  480,    0,    0,  482,  484,  482,  484,
			  485,  486,  485,  486,    0,  480,  487,  487,  488,  480,
			  482,  484,  484,  489,  485,  486,  482,    0,    0,    0,
			  487,    0,  487,    0,  488,    0,    0,  482,  484,  489,
			  489,  485,  486,    0,  487,  487,  488,    0,  488,    0,
			  488,    0,    0,  489,    0,  489,    0,    0,    0,    0,
			    0,  487,  488,    0,    0,    0,    0,  489,  489,    0,
			    0,    0,    0,    0,  488,    0,    0,    0,    0,  488,
			    0,    0,    0,    0,  489,  492,  492,  492,  492,  492,

			  492,  494,  494,  494,  494,  494,  494,  495,    0,  495,
			  495,  495,  495,  495,  495,  495,  497,  497,  497,  497,
			  497,  497,    0,  499,  492,    0,  496,    0,  496,  494,
			  496,  496,  496,  496,  496,  496,    0,  495,  497,  499,
			  499,    0,    0,    0,  500,    0,    0,  501,    0,    0,
			    0,    0,  496,  499,    0,  499,    0,  494,  496,  496,
			  500,  500,  502,  501,    0,  495,  497,  499,  499,    0,
			    0,    0,    0,    0,  500,  501,  500,  501,  502,  501,
			  496,    0,    0,    0,  499,    0,  496,  502,  500,  500,
			    0,  501,  502,    0,  502,  504,  504,  504,  504,  504,

			  504,  504,    0,  501,    0,  500,  502,    0,  501,  513,
			  513,  513,  513,  513,  513,  502,  507,  507,  507,  507,
			  507,  507,  507,  502,  509,  509,  509,  509,  509,  509,
			  509,  514,  514,  514,  514,  514,  514,  516,    0,  516,
			  516,  516,  516,  516,  516,  517,  517,  517,  517,  517,
			  517,  518,  518,  518,  518,  518,  518,    0,    0,    0,
			    0,  517,  519,  519,  519,  519,  519,  519,    0,    0,
			  514,    0,    0,    0,  518,    0,  516,  519,  520,  520,
			  520,  520,  520,  520,    0,    0,    0,    0,    0,  517,
			    0,    0,    0,  520,  521,  521,  521,  521,  521,  521,

			    0,    0,  518,    0,    0,  519,    0,    0,    0,    0,
			  521,  522,  522,  522,  522,  522,  522,    0,    0,    0,
			    0,  520,  521,  523,  523,  523,  523,  523,  523,  524,
			  524,  524,  524,  524,  524,    0,    0,    0,  521,    0,
			    0,    0,    0,    0,  523,  524,    0,    0,    0,    0,
			  521,  525,  525,  525,  525,  525,  525,  526,  526,  526,
			  526,  526,  526,    0,    0,    0,  525,    0,    0,    0,
			    0,    0,  523,  524,  528,    0,  528,  528,  528,  528,
			  528,  528,  528,  529,  529,  529,  529,  529,  529,    0,
			    0,    0,    0,    0,  525,    0,    0,    0,    0,  529,

			    0,  530,  530,  530,  530,  530,  530,  531,  531,  531,
			  531,  531,  531,  532,  532,  532,  532,  532,  532,    0,
			    0,    0,    0,  531,    0,    0,    0,  529,  530,  532,
			  533,  533,  533,  533,  533,  533,  534,  534,  534,  534,
			  534,  534,    0,    0,    0,    0,  533,    0,    0,    0,
			    0,  531,    0,    0,    0,    0,  530,  532,    0,  536,
			    0,    0,  536,  534,  535,  535,  535,  535,  535,  535,
			    0,  536,    0,  536,  533,  536,  536,  536,  536,  536,
			  536,    0,  536,    0,    0,    0,    0,    0,  535,    0,
			    0,  534,  538,  538,  538,  538,  538,  538,  540,    0, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  540,  540,  540,  540,  540,  540,  541,  541,  541,  541,
			  541,  541,  536,    0,    0,    0,  535,    0,    0,    0,
			    0,    0,  541,  542,  542,  542,  542,  542,  542,  543,
			  543,  543,  543,  543,  543,    0,    0,  540,  544,  544,
			  544,  544,  544,  544,  546,  546,  546,  546,  546,  546,
			  541,  547,  547,  547,  547,  547,  547,    0,    0,    0,
			  555,    0,  542,  548,  548,  548,  548,  548,  548,  551,
			  551,  551,  551,  551,  551,  554,  555,    0,  557,    0,
			    0,    0,  556,    0,    0,  551,    0,    0,  554,    0,
			  555,  554,  555,    0,  557,  556,    0,    0,  556,    0,

			    0,  558,    0,    0,  555,  554,    0,  554,  557,    0,
			  557,    0,  556,  551,  556,    0,  554,  558,  558,  554,
			    0,  555,  557,  556,  559,  560,  556,    0,  561,    0,
			    0,  558,    0,  558,    0,  563,  554,    0,    0,  557,
			  559,  560,    0,  556,  561,  558,  558,    0,  559,    0,
			  561,  563,    0,    0,  559,  560,  559,  560,  561,    0,
			  561,  565,  558,    0,  563,  563,    0,  563,  559,  560,
			    0,  564,  561,    0,    0,    0,  559,  565,  561,  563,
			    0,  566,    0,    0,    0,  559,  560,  564,  564,  561,
			  565,  565,  563,  565,    0,    0,  563,  566,  566,    0,

			    0,  564,    0,  564,  567,  565,    0,    0,    0,    0,
			    0,  566,    0,  566,  572,  564,  564,    0,  565,    0,
			  567,    0,  565,    0,    0,  566,  566,  573,    0,    0,
			  572,    0,  564,    0,  567,    0,  567,    0,    0,    0,
			  575,    0,  566,  573,  572,  568,  572,  568,  567,  568,
			  568,  568,  568,  568,  568,  573,  575,  573,  572,  573,
			    0,  574,    0,    0,    0,  567,    0,    0,    0,    0,
			  575,  573,  575,    0,    0,  572,  574,  574,  568,    0,
			    0,    0,    0,  573,  575,    0,    0,    0,  573,    0,
			    0,  574,  579,  574,  579,  579,  579,  579,  579,  579,

			  579,  575,    0,    0,  574,  574,  581,    0,  581,  581,
			  581,  581,  581,  581,  581,  584,  584,  584,  584,  584,
			  584,  582,  574,  582,  582,  582,  582,  582,  582,  582,
			    0,  579,  585,  585,  585,  585,  585,  585,  586,  586,
			  586,  586,  586,  586,  585,  581,  588,  588,  588,  588,
			  588,  588,  589,  589,  589,  589,  589,  589,    0,    0,
			  582,    0,    0,    0,  589,  590,  590,  590,  590,  590,
			  590,    0,  585,  591,  591,  591,  591,  591,  591,  592,
			  592,  592,  592,  592,  592,    0,    0,    0,    0,  591,
			    0,    0,  589,  593,  593,  593,  593,  593,  593,    0,

			    0,    0,  592,  594,  594,  594,  594,  594,  594,  595,
			  595,  595,  595,  595,  595,    0,    0,  591,  596,  596,
			  596,  596,  596,  596,  594,    0,    0,    0,    0,    0,
			  592,    0,    0,    0,  596,    0,    0,  595,  597,  597,
			  597,  597,  597,  597,  598,  598,  598,  598,  598,  598,
			    0,    0,  594,  599,  599,  599,  599,  599,  599,    0,
			  598,    0,  596,    0,    0,  595,  597,    0,  599,  600,
			  600,  600,  600,  600,  600,  601,  601,  601,  601,  601,
			  601,  602,  602,  602,  602,  602,  602,    0,  598,    0,
			    0,    0,    0,    0,  597,  602,  599,    0,    0,    0,

			    0,    0,  601,  603,  603,  603,  603,  603,  603,  604,
			  604,  604,  604,  604,  604,    0,    0,    0,  603,    0,
			    0,    0,    0,  602,  605,  605,  605,  605,  605,  605,
			  601,  607,    0,  607,    0,    0,  607,  607,  607,  607,
			  607,  607,    0,    0,    0,    0,  603,  608,  608,  608,
			  608,  608,  608,  609,  609,  609,  609,  609,  609,  611,
			  611,  611,  611,  611,  611,  613,  613,  613,  613,  613,
			  613,  614,  614,  614,  614,  614,  614,  615,  615,  615,
			  615,  615,  615,  617,    0,    0,  608,  618,  619,  746,
			    0,    0,  620,  615,    0,    0,  621,    0,    0,  617,

			    0,    0,  746,  618,  619,    0,    0,  620,  620,  618,
			  746,  617,  621,  617,    0,  617,  615,  618,  619,  618,
			  619,  615,  620,  746,  620,    0,  621,  617,  621,  623,
			  624,  618,  619,    0,  625,  620,  620,  618,  746,  617,
			  621,    0,    0,    0,  617,  623,  624,    0,  618,  619,
			  625,    0,  626,  620,    0,  627,  670,  621,    0,  623,
			  624,  623,  624,    0,  625,    0,  625,    0,  626,    0,
			    0,  627,  670,  623,  624,    0,  626,  629,  625,    0,
			    0,    0,  626,    0,  626,  627,  670,  627,  670,    0,
			  623,  624,    0,  629,  629,  625,  626,    0,  630,  627,

			  670,    0,    0,  631,  626,    0,    0,  629,    0,  629,
			    0,  759,    0,  626,  630,    0,  627,  670,  630,  631,
			  631,  629,  629,    0,  759,    0,    0,    0,  630,    0,
			  630,    0,  759,  631,    0,  631,    0,    0,  629,    0,
			    0,    0,  630,    0,    0,  759,  630,  631,  631,  639,
			    0,  639,  639,  639,  639,  639,  639,    0,    0,  630,
			  759,    0,    0,    0,  631,  640,  640,  640,  640,  640,
			  640,  641,    0,  641,  641,  641,  641,  641,  641,  642,
			  642,  642,  642,  642,  642,    0,    0,    0,  639,    0,
			    0,    0,  640,  643,  643,  643,  643,  643,  643,    0,

			  642,  644,  644,  644,  644,  644,  644,    0,    0,    0,
			  641,    0,    0,    0,    0,  644,    0,    0,    0,    0,
			  640,  645,  645,  645,  645,  645,  645,    0,  642,  646,
			  646,  646,  646,  646,  646,  647,  647,  647,  647,  647,
			  647,    0,    0,  644,  648,  648,  648,  648,  648,  648,
			  649,  649,  649,  649,  649,  649,  650,  650,  650,  650,
			  650,  650,  651,  651,  651,  651,  651,  651,    0,    0,
			    0,    0,    0,  649,    0,    0,    0,    0,  651,  652,
			  652,  652,  652,  652,  652,    0,  653,  653,  653,  653,
			  653,  653,  655,  655,  655,  655,  655,  655,  652,    0,

			    0,  649,  653,    0,    0,  654,  651,  654,  654,  654,
			  654,  654,  654,  656,  656,  656,  656,  656,  656,  657,
			  657,  657,  657,  657,  657,    0,  652,  658,    0,  658,
			  653,    0,  658,  658,  658,  658,  658,  658,  660,  660,
			  660,  660,  660,  660,  654,  662,  662,  662,  662,  662,
			  662,  664,    0,    0,    0,  665,  666,    0,    0,    0,
			    0,  662,    0,    0,    0,    0,  664,  664,    0,    0,
			    0,  665,  666,  666,    0,  668,  665,    0,    0,    0,
			    0,  664,    0,  664,  662,  665,  666,  665,  666,  662,
			  668,  668,    0,  671,  664,  664,    0,  672,    0,  665, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  666,  666,    0,    0,  665,  668,    0,  668,    0,  671,
			  671,    0,  664,  672,    0,    0,  665,  666,  668,  668,
			    0,    0,    0,  671,    0,  671,    0,  672,    0,  672,
			  679,  679,  679,  679,  679,  679,  668,  671,  671,    0,
			    0,  672,  681,  681,  681,  681,  681,  681,  682,  682,
			  682,  682,  682,  682,  671,    0,  681,    0,  672,  683,
			  683,  683,  683,  683,  683,    0,    0,    0,  682,  684,
			  684,  684,  684,  684,  684,  683,  685,  685,  685,  685,
			  685,  685,    0,  684,  681,  686,  686,  686,  686,  686,
			  686,  685,    0,    0,    0,    0,  682,    0,    0,    0,

			    0,  686,    0,  683,  687,  687,  687,  687,  687,  687,
			    0,  684,  689,  689,  689,  689,  689,  689,    0,  685,
			  690,  690,  690,  690,  690,  690,    0,    0,    0,  686,
			  691,  691,  691,  691,  691,  691,  692,  692,  692,  692,
			  692,  692,  693,  693,  693,  693,  693,  693,  694,  694,
			  694,  694,  694,  694,  698,    0,    0,    0,    0,  690,
			  696,  696,  696,  696,  696,  696,    0,    0,    0,    0,
			  698,    0,    0,  699,  698,    0,  696,  700,  701,    0,
			    0,  703,    0,    0,  698,    0,  698,    0,    0,  699,
			    0,    0,    0,  700,  701,  701,  704,  703,  698,  696,

			    0,    0,  698,  699,  696,  699,    0,  700,  701,  700,
			  701,  703,  704,  703,    0,  698,    0,  699,    0,    0,
			    0,  700,  701,  701,    0,  703,  704,    0,  704,    0,
			    0,  699,    0,    0,  699,    0,    0,    0,  700,  701,
			  704,  710,  703,  710,  710,  710,  710,  710,  710,    0,
			    0,    0,    0,    0,  704,    0,    0,  704,  711,  711,
			  711,  711,  711,  711,  712,  712,  712,  712,  712,  712,
			  713,  713,  713,  713,  713,  713,    0,  711,    0,    0,
			  710,  714,  714,  714,  714,  714,  714,  715,  715,  715,
			  715,  715,  715,  712,    0,    0,    0,  714,  716,  716,

			  716,  716,  716,  716,    0,  711,  717,  717,  717,  717,
			  717,  717,  719,  719,  719,  719,  719,  719,    0,    0,
			    0,  712,    0,    0,  720,  714,  720,  716,    0,  720,
			  720,  720,  720,  720,  720,  721,  721,  721,  721,  721,
			  721,  723,    0,    0,  724,  717,    0,    0,    0,    0,
			    0,  725,    0,    0,    0,  716,    0,  723,  723,  726,
			  724,    0,    0,  720,    0,    0,    0,  725,    0,    0,
			    0,  723,    0,  723,  724,  726,  724,    0,  724,    0,
			  725,  725,    0,  725,    0,  723,  723,    0,  724,  726,
			    0,  726,    0,  726,    0,  725,  737,  737,  737,  737,

			  737,  737,  723,  726,    0,  724,    0,  724,  725,    0,
			    0,    0,  725,  732,  732,  732,  732,  732,  732,    0,
			  726,    0,  726,  733,  733,  733,  733,  733,  733,  732,
			  734,  734,  734,  734,  734,  734,  735,  735,  735,  735,
			  735,  735,    0,  740,  741,    0,    0,  742,    0,    0,
			    0,  765,  743,    0,    0,    0,  733,  732,  734,  740,
			  741,    0,    0,  742,    0,    0,    0,  765,  743,  735,
			    0,    0,    0,  740,  741,  740,  741,  742,  743,  742,
			    0,  765,  743,  765,  743,  733,  734,  740,  741,    0,
			    0,  742,    0,    0,    0,  765,  743,    0,  735,    0,

			    0,  740,    0,    0,  740,  741,  743,    0,  742,    0,
			    0,    0,  765,  743,  747,  747,  747,  747,  747,  747,
			  748,  748,  748,  748,  748,  748,  749,  749,  749,  749,
			  749,  749,  750,  750,  750,  750,  750,  750,    0,    0,
			  755,    0,    0,  747,  751,  751,  751,  751,  751,  751,
			  752,  752,  752,  752,  752,  752,  755,  750,  754,  754,
			  754,  754,  754,  754,  756,    0,    0,    0,    0,    0,
			  755,  747,  755,    0,  755,    0,    0,    0,    0,    0,
			  756,  756,    0,    0,  755,  750,  760,  760,  760,  760,
			  760,  760,    0,    0,  756,    0,  756,    0,    0,    0,

			    0,  755,    0,  755,    0,    0,    0,    0,  756,  756,
			  761,  761,  761,  761,  761,  761,    0,    0,    0,  760,
			    0,    0,    0,  764,    0,  756,  761,  763,    0,  763,
			  763,    0,  763,  763,  763,  763,  763,  763,    0,  764,
			  769,  769,  769,  769,  769,  769,    0,    0,  760,  764,
			    0,    0,    0,  764,  761,  764,  770,  770,  770,  770,
			  770,  770,    0,    0,    0,  769,    0,  764,  771,  771,
			  771,  771,  771,  771,    0,    0,    0,  764,  774,  774,
			  774,  774,  774,  774,  764,  776,  776,  776,  776,  776,
			  776,    0,    0,  769,  777,    0,  780,  780,  780,  780,

			  780,  780,  781,  781,  781,  781,  781,  781,    0,    0,
			  777,  777,  780,  782,  782,  782,  782,  782,  782,    0,
			    0,    0,    0,    0,  777,    0,  777,  783,  783,  783,
			  783,  783,  783,  787,    0,    0,  774,    0,  777,  777,
			  780,  784,  784,  784,  784,  784,  784,    0,    0,  787,
			    0,  786,    0,  786,  786,  777,  786,  786,  786,  786,
			  786,  786,    0,  787,    0,  787,  790,  790,  790,  790,
			  790,  790,    0,    0,    0,    0,    0,  787,  791,  791,
			  791,  791,  791,  791,  793,  793,  793,  793,  793,  793,
			    0,    0,    0,    0,  787,  796,  796,  796,  796,  796,

			  796,  797,  797,  797,  797,  797,  797,  800,    0,  800,
			    0,    0,  800,  800,  800,  800,  800,  800,  803,  803,
			  803,  803,  803,  803,  804,  804,  804,  804,  804,  804,
			  807,  807,  807,  807,  807,  807,  811,  811,  811,  811,
			  811,  811,  812,  812,  812,  812,  812,  812,  813,  813,
			  813,  813,  813,  813,  815,  815,  815,  815,  815,  815,
			  816,    0,  816,    0,    0,  816,  816,  816,  816,  816,
			  816,  817,  817,  817,  817,  817,  817,  818,  818,  818,
			  818,  818,  818,  826,  826,  826,  826,  826,  826,  826,
			  857,  857,  857,  857,  857,  857,  857,    0,    0,  816,

			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,
			  820,  820,  820,  820,  820,  820,  820,  820,  820,  820,
			  820,  820,  820,  820,  820,  820,  821,  821,  821,  821,
			  821,  821,  821,  821,  821,  821,  821,  821,  821,  821,
			  821,  821,  821,  821,  821,  821,  821,  821,  821,  821,
			  821,  821,  822,  822,  822,  822,  822,  822,  822,  822,
			  822,  822,  822,  822,  822,  822,  822,  822,  822,  822,
			  822,  822,  822,  822,  822,  822,  822,  822,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,  823,  823,  823,  823,  823, yy_Dummy>>,
			1, 1000, 5000)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  823,  823,  823,  823,  824,  824,    0,  824,  824,  824,
			  824,  824,  824,  824,  824,  824,  824,  824,  824,  824,
			  824,  824,  824,  824,  824,    0,  824,  824,  824,  824,
			  825,  825,    0,  825,  825,  825,  825,  825,  825,  825,
			  825,  825,  825,  825,  825,  825,  825,  825,  825,  825,
			  825,  825,  825,  825,  825,  825,  828,  828,  828,    0,
			    0,    0,    0,    0,  828,  828,  828,    0,  828,  828,
			  828,  828,  828,  828,  828,    0,    0,  828,  828,  828,
			  829,  829,    0,  829,    0,  829,  829,    0,    0,  829,
			  829,  829,  829,  829,  829,  829,    0,    0,  829,  829,

			  829,  830,  830,    0,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  830,  830,
			  830,  830,  830,  830,  830,  830,  830,  831,    0,  831,
			  831,    0,    0,    0,  831,  831,  831,    0,    0,  831,
			  831,  831,  831,  831,  831,  831,  831,    0,  831,  831,
			  831,  832,  832,    0,  832,  832,  832,  832,  832,  832,
			  832,  832,  832,  832,  832,  832,  832,  832,  832,  832,
			  832,  832,    0,  832,  832,  832,  832,  833,  833,  833,
			  833,  833,  833,  833,  833,  833,  833,  833,  833,  833,
			  833,  833,  833,  833,  833,  833,  833,  833,  833,  833,

			  833,  833,  833,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  834,
			  834,  834,  834,  834,  834,  834,  834,  834,  834,  835,
			  835,  835,  835,  835,  835,  835,  835,  835,  835,  835,
			  835,  835,  835,  835,  835,  835,  835,  835,  835,  835,
			  835,  835,  835,  835,  835,  836,  836,  836,  836,  836,
			  836,  836,  836,  836,  836,  836,  836,  836,  836,  836,
			  836,  836,  836,  836,  836,  836,  836,  836,  836,  836,
			  836,  837,    0,  837,    0,    0,    0,  837,    0,  837,
			  837,    0,    0,  837,  837,  837,  837,  837,  837,  837,

			    0,    0,  837,  837,  837,  838,  838,    0,  838,  838,
			  838,  838,  838,  838,  838,  838,  838,  838,  838,  838,
			  838,  838,  838,  838,  838,  838,  838,  838,  838,  838,
			  838,  839,    0,    0,    0,  839,  839,    0,    0,  839,
			  839,  839,  839,  839,  839,  839,    0,    0,  839,  839,
			  839,  840,  840,  840,  840,  840,  840,  840,  840,  840,
			  840,  840,  840,  840,  840,  840,  840,  840,  840,  840,
			  840,  840,  840,  840,  840,  840,  840,  841,  841,  841,
			    0,    0,  841,  841,  841,  841,  841,  841,  841,  841,
			    0,  841,  841,  841,  842,    0,    0,  842,  842,  842,

			  842,  842,  842,  842,  842,  842,  842,  842,    0,    0,
			  842,  842,  842,  844,  844,  844,  844,  844,  844,  844,
			  844,    0,  844,  844,  844,  844,  844,  844,  844,  844,
			  844,  844,  844,  844,  844,  844,  844,  844,  844,  845,
			  845,  845,  845,  845,  845,  845,  845,  845,  845,  845,
			  845,  845,  845,  845,  845,  845,  845,  845,  845,  845,
			  845,  845,  845,  845,  845,  846,  846,  846,    0,    0,
			    0,    0,    0,    0,    0,    0,  846,  846,  846,  846,
			  846,  846,  846,  846,    0,    0,    0,    0,    0,  846,
			  847,  847,  847,  847,  847,  847,  847,  847,  847,  847,

			  847,  847,  847,  847,  847,  847,  847,  847,  847,  847,
			  847,  847,  847,  847,  847,  847,  848,  848,  848,  848,
			  848,  848,  848,  848,  848,  848,  848,  848,  848,  848,
			  848,  848,  848,  848,  848,  848,  848,  848,  848,  848,
			  848,  848,  849,  849,    0,    0,  849,  849,  849,  849,
			  849,  849,  849,    0,    0,  849,  849,  849,  850,  850,
			    0,    0,  850,  850,  850,  850,  850,  850,  850,    0,
			    0,  850,  850,  850,  851,  851,  851,    0,    0,  851,
			  851,  851,  851,  851,  851,  851,  851,    0,  851,  851,
			  851,  852,  852,  852,  852,  852,  852,  852,  852,  852,

			  852,  852,  852,  852,  852,  852,  852,  852,  852,  852,
			  852,  852,  852,  852,  852,  852,  852,  853,  853,  853,
			  853,  853,  853,  853,    0,    0,  853,  853,  853,  854,
			  854,  854,  854,  854,  854,  854,    0,    0,  854,  854,
			  854,  855,  855,    0,    0,  855,  855,  855,  855,  855,
			  855,  855,    0,    0,  855,  855,  855,  856,  856,    0,
			    0,  856,  856,  856,  856,  856,  856,  856,    0,    0,
			  856,  856,  856,  858,  858,  858,  858,  858,  858,  858,
			    0,  859,  858,  858,  858,  859,  859,    0,    0,  859,
			  859,  859,  859,  859,  859,  859,    0,    0,  859,  859,

			  859,  860,  860,    0,    0,  860,  860,  860,  860,  860,
			  860,  860,    0,    0,  860,  860,  860,  861,  861,    0,
			    0,  861,  861,  861,  861,  861,  861,  861,    0,    0,
			  861,  861,  861,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,

			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819, yy_Dummy>>,
			1, 825, 6000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   89,   94,   76,   78,   66,   70,   97,
			  101,  185,    0, 1128, 6733,  103, 1120, 1090, 1109, 6733,
			  100,    0, 6733, 6733, 6733, 6733, 1098,   99, 1093,  263,
			  273, 6733, 6733, 1080, 6733, 1076, 6733,  296,  108,  302,
			  121,  307,  312,  324,  350,  342,  375,  382,  454,  423,
			  438,  408,  418,   69, 6733, 6733, 1043,  504,  506,  480,
			  525,  544,  546,  548,  579,  585,  604,  624,  625,   99,
			  634,  650, 1073, 6733, 6733, 1082,  159, 6733,  118,  309,
			  281,  318,  312,  351,   97, 6733,  111,  121,  283,  729,
			 6733, 6733,  298, 1082, 1068, 1005, 6733,  139, 1063,  603,

			  661,  319, 1061, 6733, 1050, 6733, 1045,    0,  673, 1034,
			 1030, 1013,  687, 6733,  116,  717,  764,  781,  732,  795,
			 6733, 6733,  404,  805,    0,  820,  825,  845,  870,  874,
			  899,  905,  933,  937,  965,  970,  985, 1000, 1015, 1020,
			 1047, 1072, 1076,  944, 1124, 1103, 1109, 1187,  334,  238,
			 1135,  405, 1113, 1181, 1202, 1004,  990,  438,  273,  266,
			  957, 6733,  338,  997,    0, 1252, 1268, 1272, 1293,  931,
			 1314, 1318, 1342, 1363, 1383, 1387, 1403, 1429, 1445, 1462,
			 1485, 1541,  836, 1505, 1485, 1511, 1548, 1555, 1566, 1577,
			 1595, 1601, 6733,  985, 6733,  427, 6733, 6733,  624,  440,

			  638,  832,  859,  362, 6733,  929,  446,  474,  922,  520,
			  920, 6733,  290, 1680, 6733, 6733,  934,  490, 6733,  446,
			  885,  943,  919,  770,  456, 1176,  909, 1239,  484, 1763,
			  515, 6733, 6733, 6733,  900, 1624,  894,  888,  884,  875,
			  567,  575, 6733, 1635, 1652, 1607,  853,  802, 1641, 1721,
			 1680, 1738, 1492, 1668, 6733,    0,    0,  821,  815, 1764,
			 1822,  917, 1823, 1098, 1841, 1842, 1877, 1862, 1888, 1896,
			  813, 1930, 1931, 1934, 1954, 1782, 1972, 1977, 6733, 1715,
			 1727, 2023, 1783, 1814, 2039, 2045, 2055, 2065, 2067, 1419,
			 1116, 1881, 2074, 2063, 2082, 2089, 2123, 1935, 2128,  810,

			 2172, 2191, 2198,  289, 6733,  322, 2205, 2211, 2222,  745,
			 2228, 2236, 2242, 2253, 2271, 2281, 2299, 2310, 2321, 2329,
			 2343, 2356,  140, 2371, 2364, 2379, 2392, 2398, 2414, 2422,
			 2438, 2450, 2459, 2466, 1137,  295, 1290,  579, 1297, 1338,
			 1344,  334, 6733,  739,  697, 6733, 2488, 2504,  755, 2144,
			 6733,  678,  715,  753, 6733, 6733, 2478, 6733, 6733, 6733,
			 6733, 6733,  762, 2512, 2518, 2529,  686, 2535, 2542, 2559,
			 2548, 2565, 2571, 2587, 2593, 2599,  730,  520,    0,  715,
			 2235, 2606, 2607, 2610, 2613, 2616, 2649, 2653, 2656, 2662,
			  621, 2699, 2696, 2689, 2722, 2702, 2737, 2770, 2783, 2780,

			 2803, 2814, 2820, 2844, 2874, 2888, 2894, 2900, 2908, 2915,
			 2916, 1018, 2919, 2923, 2920, 2962, 2926,  550,  858, 2994,
			 3006,  875, 3023, 3032,  113,  653, 3015, 3044, 3050, 3061,
			 3076, 3082, 3089, 3105, 3117, 3127, 3136, 3149, 3155, 3177,
			 3186, 3201, 3207, 3214, 3221, 3235, 3242, 3249, 3255, 3279,
			 6733, 2281,  598, 3285,  605, 6733, 3307, 3313, 3319, 3325,
			  674, 3331, 3337, 3348, 3354, 3360, 3376,  573, 3388, 3400,
			 1266,  348,    0,    0, 2941, 3395, 3396, 3414, 3415, 3418,
			 3451, 3433, 3469,  655, 3470, 3473, 3474, 3493, 3511, 3516,
			 6733,  717, 3577, 3418, 3583, 3591, 3612, 3598, 1272, 3606,

			 3627, 3630, 3645, 1828, 3677, 6733,  860, 3698, 6733, 3706,
			 6733,  661,  612, 3691, 3713,  486, 3721, 3727, 3733, 3744,
			 3760, 3776, 3793, 3805, 3811, 3833, 3839,  864, 3858, 3865,
			 3883, 3889, 3895, 3912, 3918, 3946, 3957,  611, 3974,  582,
			 3982, 3988, 4005, 4011, 4020,  602, 4026, 4033, 4045, 1658,
			 6733, 4051,    0,  639, 4058, 4043, 4065, 4061, 4084, 4107,
			 4108, 4111,  908, 4118, 4154, 4144, 4164, 4187, 4231, 6733,
			  908,  625, 4197, 4210, 4244, 4223, 1857, 2113, 2136, 4276,
			 1038, 4290, 4305,  598, 4297, 4314, 4320,  595, 4328, 4334,
			 4347, 4355, 4361, 4375, 4385, 4391, 4400, 4420, 4426, 4435,

			 4451, 4457, 4463, 4485, 4491, 4506,  549, 4518, 4529, 4535,
			  950, 4541,  549, 4547, 4553, 4559,  546, 4566, 4570, 4571,
			 4575, 4579, 1047, 4612, 4613, 4617, 4635, 4638, 1166, 4660,
			 4681, 4686,  545,  516,  452,  450,    0,  422,  617, 4733,
			 4747, 4755, 4761, 4775, 4783, 4803, 4811, 4817, 4826, 4832,
			 4838, 4844, 4861, 4868, 4889, 4874, 4895, 4901, 4914, 1500,
			 4920, 2103, 4927,    0, 4934, 4938, 4939, 6733, 4958, 1340,
			 4639, 4976, 4980, 1303, 1409, 1973, 2276,  428,  724, 5012,
			  416, 5024, 5030, 5041, 5051, 5058, 5067, 5086,  342, 5094,
			 5102, 5112, 5118, 5124, 5130, 6733, 5142,    0, 5137, 5156,

			 5160, 5161, 6733, 5164, 5179, 2608, 2654, 2818, 2820, 2025,
			 5225, 5240, 5246, 5252, 5263, 5269, 5280, 5288,  345, 5294,
			 5311, 5317,  817, 5324, 5327, 5334, 5342,  577, 6733, 1054,
			  355, 6733, 5395, 5405, 5412, 5418,  908, 5378,    0,  285,
			 5426, 5427, 5430, 5435,  969, 1221, 4573, 5496, 5502, 5508,
			 5514, 5526, 5532,  940, 5540, 5523, 5547, 1434, 1757, 4695,
			 5568, 5592, 1769, 5614, 5606, 5434,  284,  256, 1045, 5622,
			 5638, 5650, 2386, 6733, 5660,   89, 5667, 5677, 1925, 2285,
			 5678, 5684, 5695, 5709, 5723,   97, 5738, 5716, 2424, 2910,
			 5748, 5760, 2490, 5766,  128,  122, 5777, 5783, 2854, 6733,

			 5794, 1750, 2063, 5800, 5806, 2128, 2401, 5812, 2343, 6733,
			 6733, 5818, 5824, 5830, 6733, 5836, 5847, 5853, 5859, 6733,
			 5899, 5925, 5951, 5977, 6003, 6029, 5869, 1530, 6054, 6075,
			 6100, 6125, 6150, 6176, 6202, 6228, 6254, 6279, 6304, 6325,
			 6350, 6368, 6387, 1214, 6412, 6438, 6463, 6489, 6515, 6532,
			 6548, 6565, 6590, 6603, 6615, 6631, 6647, 5876, 6659, 6675,
			 6691, 6707, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  819,    1,  820,  820,  821,  821,  822,  822,  823,
			  823,  819,   11,  819,  819,  819,  819,  819,  824,  819,
			  825,  826,  819,  819,  819,  819,  819,  819,  827,  819,
			  819,  819,  819,  819,  819,  819,  819,  828,  828,  828,
			  828,  828,  828,  828,  828,  828,  828,  828,  828,  828,
			  828,  828,  828,  829,  819,  819,  830,  831,  831,  831,
			  831,  831,  831,  831,  831,  831,  831,  831,  831,   64,
			  831,  831,  819,  819,  819,  832,  819,  819,  819,  832,
			  832,  832,  832,  832,  833,  819,  834,  833,  835,  836,
			  819,  819,  819,  819,  819,  819,  819,  837,  819,  837,

			  837,  819,  819,  819,  824,  819,  838,  838,  838,  839,
			  840,  819,  819,  819,  841,  819,  819,  819,  819,  819,
			  819,  819,  819,  828,  842,  828,  828,  828,  828,  828,
			  828,  828,  828,  828,  828,  828,  828,  828,  828,  828,
			  828,  828,  828,  819,   48,  828,  828,  146,  146,  146,
			  146,  146,  146,  146,  146,  146,  829,  829,  829,  829,
			  830,  819,  819,  819,  843,  831,  831,  831,  831,  819,
			  831,  831,  831,  831,  831,  831,  831,  831,  831,  831,
			  831,  831,  181,  181,  181,  181,  181,  181,  181,  181,
			  181,  181,  819,  832,  819,  819,  819,  819,  832,  832,

			  832,  832,  832,  833,  819,  844,  833,  834,  845,  834,
			  844,  819,  835,  836,  819,  819,  213,  846,  819,  819,
			  819,  819,  847,  819,  837,  837,  819,  819,  819,  848,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  827,  819,  819,  819,
			  819,  819,  819,  819,  819,  849,  850,  819,  842,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  146,  146,
			  819,  146,  146,  146,  146,  146,  146,  146,  819,  819,
			  850,  146,  281,  281,  281,  281,  147,  147,  147,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  146,  819,

			  829,  829,  829,  829,  819,  851,  181,  181,  181,  819,
			  181,  181,  181,  181,  181,  181,  181,  181,  181,  181,
			  181,  181,  181,  181,  181,  181,  181,  181,  181,  181,
			  181,  181,  181,  181,  832,  832,  832,  832,  832,  832,
			  832,  844,  819,  845,  846,  819,  819,  819,  852,  852,
			  819,  852,  852,  852,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  849,  850,  853,  842,
			  146,  146,  146,  146,  146,  146,  146,  146,  146,  146,
			  819,  146,  146,  146,  146,  146,  146,  819,  850,  281,

			  281,  281,  144,  281,  144,  819,  850,  281,  281,  146,
			  146,  819,  146,  146,  146,  146,  146,  819,  829,  829,
			  829,  829,  829,  829,  829,  819,  181,  181,  819,  181,
			  181,  181,  181,  181,  181,  181,  181,  181,  181,  181,
			  850,  181,  181,  181,  181,  181,  181,  181,  181,  181,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  854,  855,  146,  146,  146,  146,  146,  146,
			  146,  146,  146,  819,  146,  146,  146,  146,  146,  146,
			  819,  850,  281,  281,  819,  850,  281,  496,  819,  146,

			  146,  146,  146,  849,  829,  819,  819,  829,  819,  829,
			  819,  829,  819,  181,  181,  819,  819,  181,  181,  181,
			  181,  181,  181,  181,  181,  181,  181,  850,  850,  181,
			  181,  181,  181,  181,  181,  181,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  856,  855,  146,  146,  146,  146,  146,  146,
			  146,  146,  819,  146,  146,  146,  146,  146,  281,  819,
			  850,  819,  146,  146,  146,  146,  819,  849,  849,  829,
			  819,  829,  829,  829,  819,  181,  819,  819,  181,  181,
			  181,  181,  181,  181,  181,  181,  181,  181,  181,  181,

			  181,  181,  181,  181,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  856,  146,  146,  146,
			  146,  146,  819,  146,  146,  146,  146,  146,  819,  146,
			  146,  146,  819,  819,  849,  849,  857,  819,  819,  819,
			  181,  819,  181,  181,  181,  181,  181,  181,  181,  181,
			  181,  181,  181,  181,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  858,  146,  146,  146,  819,  146,  819,
			  146,  146,  146,  819,  819,  854,  854,  859,  819,  819,
			  819,  181,  181,  181,  181,  181,  181,  181,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  860,  146,  146,

			  146,  146,  819,  146,  146,  819,  819,  856,  856,  819,
			  819,  181,  181,  181,  181,  181,  181,  819,  819,  819,
			  819,  819,  860,  146,  146,  146,  146,  819,  819,  856,
			  856,  819,  181,  181,  181,  181,  819,  819,  861,  819,
			  146,  146,  146,  146,  819,  819,  856,  181,  181,  181,
			  181,  819,  819,  861,  819,  146,  146,  819,  819,  856,
			  181,  181,  819,  819,  146,  146,  819,  819,  856,  181,
			  181,  819,  819,  819,  819,  819,  819,  146,  819,  819,
			  181,  819,  819,  819,  819,  819,  819,  146,  819,  819,
			  181,  819,  819,  819,  819,  819,  819,  819,  819,  819,

			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,    0,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  819,  819, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    5,    6,    7,    1,    8,    1,    1,    9,
			   10,   11,   12,   13,   14,   15,   16,   17,   18,   19,
			   20,   21,   22,   22,   22,   23,   23,   23,   24,   25,
			   26,   27,   28,   29,    1,   30,   31,   32,   33,   34,
			   35,   36,   37,   38,   36,   36,   39,   40,   41,   42,
			   43,   44,   45,   46,   47,   48,   36,   49,   50,   51,
			   52,   53,   54,   55,   56,   57,    1,   58,   59,   60,

			   61,   62,   63,   64,   65,   66,   64,   64,   67,   68,
			   69,   70,   71,   72,   73,   74,   75,   76,   77,   78,
			   79,   80,   64,   81,   82,   83,    1,    1,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,    1,    1,   87,   87,   87,   87,   87,   87,

			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   88,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   90,   91,   91,   91,   91,   91,   91,   91,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    3,    1,    4,    1,    1,    1,    1,
			    5,    6,    1,    1,    7,    8,    8,    9,   10,   10,
			   10,   10,   10,   11,    1,    1,   12,    1,   13,    1,
			   14,   15,   16,   17,   18,   19,   14,   14,   14,   14,
			   14,   14,   14,   14,   14,   14,   14,   14,   14,   14,
			   14,   14,   20,   21,   22,    1,    1,   10,   23,   23,
			   23,   23,   23,   23,   23,   23,   23,   23,   23,   23,
			   23,   23,   23,   23,   23,   23,   23,   23,   23,   24,
			   25,    1,    1,   26,    1,    1,    1,    1,    1,    1,
			    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,  110,  110,    0,    0,    0,
			    0,    0,    0,  141,  139,    1,    2,   15,  123,   18,
			  139,   16,   17,    7,    6,   13,    5,   11,    8,  115,
			  115,   14,   12,   28,   10,   29,   19,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,   88,  103,
			  103,  103,  103,   21,   30,   22,    9,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,   23,   20,   24,  127,  128,  129,  130,  127,
			  127,  127,  127,  127,  110,  113,  140,  110,  140,  140,
			  102,   71,   71,   68,   71,   71,   78,   78,   75,   78,

			   78,    1,    2,   27,  123,  122,  137,  137,  137,    0,
			    3,   32,  121,   31,  107,    0,    0,  115,    0,  115,
			   26,   25,    0,  103,   97,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,   39,    0,  103,   96,   96,   87,   96,   96,
			  103,  103,  103,  103,  103,  103,    0,    0,    0,    0,
			    0,  114,    0,    0,    0,  106,  106,  106,  106,    0,
			  106,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,   39,  106,  106,  106,  106,
			  106,  106,  109,  127,  129,  128,  125,  124,  126,  127,

			  127,  127,  127,  110,  113,    0,  110,    0,    0,    0,
			  111,  112,    0,    0,  102,  100,  100,    0,  101,    0,
			    0,   68,    0,    0,    0,    0,   75,    0,   74,    0,
			   73,   77,  137,  131,  137,  137,  137,  137,  137,  137,
			    0,    4,   33,  121,    0,    0,    0,    0,    0,  117,
			    0,  115,    0,    0,   97,    0,    0,    0,    0,  103,
			  103,   38,  103,  103,  103,  103,  103,  103,  103,  103,
			    0,  103,  103,  103,  103,   41,  103,  103,   95,    0,
			    0,   88,   89,   88,   88,   88,   96,  103,   96,   96,
			   96,  103,  103,  103,  103,  103,  103,   40,  103,    0,

			    0,    0,    0,    0,  105,  108,  106,  106,   38,    0,
			  106,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,   63,   63,  106,   41,  106,  106,  106,  106,  106,
			  106,  106,   40,  106,  127,  127,  127,  127,  127,  127,
			  127,    0,  111,  112,    0,   69,    0,    0,    0,    0,
			   76,   74,   73,   77,  135,  138,  138,  136,  132,  133,
			  134,   98,  121,    0,  121,    0,    0,    0,  117,    0,
			    0,    0,  120,  115,    0,    0,    0,    0,    0,  104,
			  103,  103,  103,  103,  103,   37,  103,  103,  103,  103,
			    0,  103,  103,  103,  103,  103,  103,    0,    0,  103,

			   87,  103,  103,  103,  103,    0,    0,   87,   87,   87,
			   36,    0,   43,  103,  103,  103,  103,   72,    0,    0,
			    0,    0,    0,    0,    0,    0,  106,  106,    0,  106,
			  106,  106,   37,  106,  106,  106,  106,  106,  106,  106,
			    0,  106,  106,  106,   36,   43,  106,  106,  106,  106,
			  112,    0,   67,    0,   66,   70,  121,    0,    0,    0,
			  116,  117,    0,  118,    0,  120,    0,    0,    0,  115,
			   84,    0,    0,    0,   58,  103,  103,  103,  103,  103,
			  103,   44,  103,    0,  103,  103,   35,  103,  103,  103,
			   89,   89,   89,   88,    0,    0,  103,  103,    0,  103,

			  103,  103,  103,    0,    0,   64,    0,    0,   62,    0,
			   61,    0,    0,   58,  106,    0,    0,  106,  106,  106,
			  106,  106,   44,  106,  106,  106,   35,   63,   63,  106,
			  106,  106,  106,  106,  106,  106,    0,  121,    0,    0,
			    0,  117,  118,    0,    0,  120,    0,    0,    0,    0,
			   84,    0,    0,    0,  103,   59,  103,   60,  103,  103,
			   46,  103,    0,  103,  103,  103,  103,  103,  103,   87,
			   87,    0,   52,  103,  103,  103,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  106,    0,    0,   59,  106,
			   60,  106,  106,   46,  106,  106,  106,  106,  106,  106,

			   52,  106,  106,  106,    0,    0,  107,    0,  118,    0,
			  121,    0,   86,    0,    0,  119,    0,  103,  103,   57,
			  103,   45,    0,   42,   56,   34,  103,   50,    0,  103,
			  103,  103,    0,    0,    0,    0,    0,    0,    0,    0,
			  106,    0,  106,   57,  106,   45,   42,   56,   34,  106,
			   50,  106,  106,  106,    0,    0,  118,    0,    0,    0,
			    0,   83,  119,    0,  103,  103,  103,   92,  103,    0,
			  103,  103,   53,    0,    0,    0,    0,    0,   65,    0,
			  108,  106,  106,  106,  106,  106,  106,   53,  120,    0,
			  120,    0,    0,    0,    0,   83,  119,    0,  103,  103,

			   47,  103,   91,   51,  103,    0,    0,    0,    0,    0,
			    0,  106,  106,   47,  106,   51,  106,  120,   85,    0,
			   83,  119,    0,  103,  103,  103,  103,   90,   90,   90,
			   90,   99,  106,  106,  106,  106,    0,    0,    0,    0,
			  103,   49,   48,  103,    0,    0,    0,  106,   49,   48,
			  106,    0,    0,    0,    0,  103,  103,    0,    0,    0,
			  106,  106,   82,   79,  103,   54,    0,    0,    0,  106,
			   54,    0,    0,   82,    0,    0,    0,  103,    0,    0,
			  106,    0,    0,   79,    0,    0,   79,   55,    0,    0,
			   55,    0,   81,    0,    0,    0,    0,    0,    0,   81,

			   79,    0,    0,    0,    0,    0,    0,    0,   80,   93,
			   94,    0,    0,    0,   80,    0,   80,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 6733
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 819
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 820
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

	yyNb_rules: INTEGER = 140
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 141
			-- End of buffer rule code

	yyLine_used: BOOLEAN = false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN = false
			-- Is `position' used?

	INITIAL: INTEGER = 0
	IN_STR: INTEGER = 1
	IN_REGEXP1: INTEGER = 2
	IN_C_DOMAIN_TYPE: INTEGER = 3
	IN_EXPANDED_VALUE_SET_DEF: INTEGER = 4
	IN_EXTERNAL_VALUE_SET_DEF: INTEGER = 5
			-- Start condition codes

feature -- User-defined features



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
			create odin_parser_error.make
			create str_.make_empty
			create last_string_value.make_empty
			create last_term_constraint_parse_structure_value.make
			create last_c_dv_quantity_value.default_create
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

	odin_parser: ODIN_PARSER
		once
			create Result.make
		end

	odin_parser_error: ERROR_ACCUMULATOR

	tid: INTEGER

	is_assumed_code: BOOLEAN
			-- True if next code parsed is assumed code


end
