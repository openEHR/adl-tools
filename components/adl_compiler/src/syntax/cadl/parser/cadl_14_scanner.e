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
if yy_act <= 69 then
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
if yy_act <= 52 then
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
if yy_act <= 48 then
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
if yy_act = 47 then
--|#line 168 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 168")
end
last_token := SYM_EXISTENCE
else
--|#line 170 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 170")
end
last_token := SYM_OCCURRENCES
end
end
else
if yy_act <= 50 then
if yy_act = 49 then
--|#line 172 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 172")
end
last_token := SYM_CARDINALITY
else
--|#line 174 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 174")
end
last_token := SYM_ORDERED
end
else
if yy_act = 51 then
--|#line 176 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 176")
end
last_token := SYM_UNORDERED
else
--|#line 178 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 178")
end
last_token := SYM_UNIQUE
end
end
end
end
else
if yy_act <= 61 then
if yy_act <= 57 then
if yy_act <= 55 then
if yy_act <= 54 then
if yy_act = 53 then
--|#line 180 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 180")
end
last_token := SYM_USE_NODE
else
--|#line 182 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 182")
end
last_token := SYM_ALLOW_ARCHETYPE
end
else
--|#line 184 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 184")
end
last_token := SYM_INCLUDE
end
else
if yy_act = 56 then
--|#line 186 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 186")
end
last_token := SYM_EXCLUDE
else
--|#line 188 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 188")
end
last_token := SYM_AFTER
end
end
else
if yy_act <= 59 then
if yy_act = 58 then
--|#line 190 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 190")
end
last_token := SYM_BEFORE
else
--|#line 192 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 192")
end
last_token := SYM_CLOSED
end
else
if yy_act = 60 then
--|#line 196 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 196")
end

		last_token := V_ROOT_ID_CODE
		last_string_value := text_substring (2, text_count - 1)
	
else
--|#line 202 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 202")
end

		last_token := V_ID_CODE
		last_string_value := text_substring (2, text_count - 1)
	
end
end
end
else
if yy_act <= 65 then
if yy_act <= 63 then
if yy_act = 62 then
--|#line 209 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 209")
end

		last_token := V_ID_CODE_STR
		last_string_value := text
	
else
--|#line 216 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 216")
end

		last_token := V_VALUE_SET_REF
		last_string_value := text_substring (2, text_count - 1)
	
end
else
if yy_act = 64 then
--|#line 232 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 232")
end

		set_start_condition (IN_EXPANDED_VALUE_SET_DEF)
		create last_term_constraint_parse_structure_value.make
		str_ := text_substring (2, text_count)
		last_term_constraint_parse_structure_value.set_terminology_id (str_.substring (1, str_.index_of (':', 1)-1))
		is_assumed_code := False
	
else
--|#line 241 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 241")
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
if yy_act <= 67 then
if yy_act = 66 then
--|#line 256 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 256")
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
--|#line 271 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 271")
end
in_lineno := in_lineno + text_count
end
else
if yy_act = 68 then
--|#line 274 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 274")
end
in_lineno := in_lineno + 1
else
--|#line 276 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 276")
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
if yy_act <= 104 then
if yy_act <= 87 then
if yy_act <= 78 then
if yy_act <= 74 then
if yy_act <= 72 then
if yy_act <= 71 then
if yy_act = 70 then
--|#line 299 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 299")
end
	-- Catch-all rules (no backing up)
			last_token := ERR_VALUE_SET_DEF
			set_start_condition (INITIAL)
	
else
--|#line 317 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 317")
end

		set_start_condition (IN_EXTERNAL_VALUE_SET_DEF)
		create last_term_constraint_parse_structure_value.make
		str_ := text_substring (2, text_count)
		last_term_constraint_parse_structure_value.set_terminology_id (str_.substring (1, str_.index_of (':', 1)-1))
		is_assumed_code := False
	
end
else
--|#line 326 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 326")
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
if yy_act = 73 then
--|#line 341 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 341")
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
--|#line 356 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 356")
end
in_lineno := in_lineno + text_count
end
end
else
if yy_act <= 76 then
if yy_act = 75 then
--|#line 359 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 359")
end
in_lineno := in_lineno + 1
else
--|#line 361 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 361")
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
if yy_act = 77 then
--|#line 384 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 384")
end
	-- Catch-all rules (no backing up)
			last_token := ERR_VALUE_SET_DEF
			set_start_condition (INITIAL)
	
else
--|#line 393 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 393")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
end
end
else
if yy_act <= 83 then
if yy_act <= 81 then
if yy_act <= 80 then
if yy_act = 79 then
--|#line 394 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 394")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 395 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 395")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
--|#line 402 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 402")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
else
if yy_act = 82 then
--|#line 403 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 403")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 410 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 410")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
end
else
if yy_act <= 85 then
if yy_act = 84 then
--|#line 411 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 411")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
--|#line 418 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 418")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
else
if yy_act = 86 then
--|#line 419 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 419")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 426 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 426")
end

				last_token := V_ISO8601_DURATION
				last_string_value := convert_non_conforming_duration(text)
			
end
end
end
end
else
if yy_act <= 96 then
if yy_act <= 92 then
if yy_act <= 90 then
if yy_act <= 89 then
if yy_act = 88 then
--|#line 438 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 438")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 448 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 448")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text_substring(2, text_count)
			
end
else
--|#line 453 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 453")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
if yy_act = 91 then
--|#line 463 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 463")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
				last_string_value.put('T', last_string_value.index_of(' ', 1))
			
else
--|#line 469 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 469")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
end
end
else
if yy_act <= 94 then
if yy_act = 93 then
--|#line 480 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 480")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN_ERR
				unread_character(last_string_value.item(last_string_value.count)) -- put back the last character 
				last_string_value := text
			
else
--|#line 489 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 489")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
if yy_act = 95 then
--|#line 505 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 505")
end
	-- match a pattern like 'Type_Identifier whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
else
--|#line 512 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 512")
end
	-- match a pattern like '(Type_Identifier) whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
end
end
end
else
if yy_act <= 100 then
if yy_act <= 98 then
if yy_act = 97 then
--|#line 518 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 518")
end
	-- match a pattern like '["at0004"] = (Type_Identifier)  <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
else
--|#line 524 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 524")
end
 -- match up to next > not followed by a '}' or '>' 
 				in_buffer.append_string (text)
 			
end
else
if yy_act = 99 then
--|#line 528 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 528")
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
 			
else
--|#line 570 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 570")
end
 -- match up to next '}' not preceded by a '>'
 				in_buffer.append_string (text)
  			
end
end
else
if yy_act <= 102 then
if yy_act = 101 then
--|#line 580 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 580")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 586 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 586")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
end
else
if yy_act = 103 then
--|#line 592 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 592")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
else
--|#line 599 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 599")
end

			last_token := V_ATTRIBUTE_IDENTIFIER
			last_string_value := text
		
end
end
end
end
end
else
if yy_act <= 121 then
if yy_act <= 113 then
if yy_act <= 109 then
if yy_act <= 107 then
if yy_act <= 106 then
if yy_act = 105 then
--|#line 605 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 605")
end
		-- matches an absolute path string with segments of form "/attr_name" or "/attr_name[id-code]"
			last_token := V_ABS_PATH
			last_string_value := text
		
else
--|#line 611 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 611")
end
		-- matches a relative path string with segments of form "/attr_name" or "/attr_name[id-code]"
			last_token := V_REL_PATH
			last_string_value := text
		
end
else
--|#line 617 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 617")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			
end
else
if yy_act = 108 then
--|#line 624 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 624")
end
 		-- match segment consisting of non / or [
				in_buffer.append_string (text)
	
else
--|#line 628 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 628")
end
 		-- match [] segment
				in_buffer.append_string (text)
	
end
end
else
if yy_act <= 111 then
if yy_act = 110 then
--|#line 632 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 632")
end
 		-- match segment ending in quoted slashes '\/'
				in_buffer.append_string (text)
	
else
--|#line 636 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 636")
end
 		-- match final segment
				in_buffer.append_string (text)

				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
 				last_string_value := str_
 				last_token := V_REGEXP
				set_start_condition (INITIAL)
	
end
else
if yy_act = 112 then
--|#line 648 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 648")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
else
--|#line 655 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 655")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
end
end
else
if yy_act <= 117 then
if yy_act <= 115 then
if yy_act = 114 then
--|#line 660 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 660")
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
			
else
--|#line 675 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 675")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
end
else
if yy_act = 116 then
--|#line 676 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 676")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
else
--|#line 680 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 680")
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
if yy_act <= 119 then
if yy_act = 118 then
--|#line 681 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 681")
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
--|#line 682 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 682")
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
if yy_act = 120 then
--|#line 702 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 702")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 707 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 707")
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
if yy_act <= 130 then
if yy_act <= 126 then
if yy_act <= 124 then
if yy_act <= 123 then
if yy_act = 122 then
--|#line 715 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 715")
end
in_buffer.append_character ('\')
else
--|#line 717 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 717")
end
in_buffer.append_character ('"')
end
else
--|#line 719 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 719")
end

				in_buffer.append_string (text)
	
end
else
if yy_act = 125 then
--|#line 723 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 723")
end
in_buffer.append_string (text)
else
--|#line 725 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 725")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
end
else
if yy_act <= 128 then
if yy_act = 127 then
--|#line 730 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 730")
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
--|#line 741 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 741")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
else
if yy_act = 129 then
--|#line 750 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 750")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
--|#line 752 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 752")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
end
end
else
if yy_act <= 134 then
if yy_act <= 132 then
if yy_act = 131 then
--|#line 753 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 753")
end
last_token := V_CHARACTER; last_character_value := '%R'
else
--|#line 754 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 754")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 133 then
--|#line 755 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 755")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 756 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 756")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 136 then
if yy_act = 135 then
--|#line 758 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 758")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 759 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 759")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 137 then
--|#line 763 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 763")
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
			create an_array.make_filled (0, 0, 5664)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			yy_nxt_template_3 (an_array)
			yy_nxt_template_4 (an_array)
			yy_nxt_template_5 (an_array)
			yy_nxt_template_6 (an_array)
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
			   67,   60,   60,   60,   60,   68,   69,   60,   70,   71,
			   72,   73,   74,   14,   14,   14,   14,   14,   14,   14,
			   14,   76,   85,  107,   85,   77,   76,   89,   89,  213,

			   77,   92,   93,  196,   92,   92,   93,  101,   92,  101,
			  101,  208,  122,  122,   94,  122,  738,  111,   94,  112,
			  112,  112,  112,  112,  112,  295,  295,  295,   86,   87,
			   86,   87,  122,  122,  204,  122,  124,  157,  108,  737,
			  224,  721,   78,  224,  128,  158,  159,   78,  209,  210,
			  197,   90,   90,  214,  720,  224,  124,   95,  224,  497,
			  195,   95,  195,  195,  101,  228,  101,  101,  228,  563,
			  205,  206,  128,  299,   79,   80,   81,   82,   83,   79,
			   80,   81,   82,   83,   96,   97,   98,   96,   97,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   99,  100,

			   96,  100,  100,  100,  100,  100,  100,   96,   96,   96,
			   96,   96,   96,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,   96,   96,   96,   96,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,  115,  194,  116,  246,  117,  117,
			  117,  117,  117,  117,  115,  295,  116,  194,  119,  119,
			  119,  119,  119,  119,  219,  122,  122,  219,  122,  441,

			  162,  122,  122,  162,  122,  211,  122,  122,  163,  122,
			  695,  122,  122,  247,  122,  230,  700,  118,  230,  124,
			  122,  122,  298,  122,  528,  124,  164,  118,  125,  129,
			  124,  194,  126,  194,  127,  124,  337,  162,  130,  133,
			  162,  205,  206,  131,  124,  163,  122,  122,  674,  122,
			  220,  134,  164,  199,  132,  135,  125,  129,  701,  295,
			  126,  194,  127,  198,  198,  198,  130,  133,  648,  170,
			  124,  131,  122,  122,  646,  122,  645,  122,  122,  134,
			  122,  633,  132,  135,  136,  137,  122,  122,  169,  122,
			  138,  122,  122,  208,  122,  415,  124,  170,  213,  162,

			  139,  124,  162,  122,  122,  204,  122,  163,  201,  201,
			  124,  199,  136,  137,  164,  124,  141,  140,  138,  248,
			  248,  248,  248,  248,  248,  566,  150,  124,  139,  142,
			  209,  210,  122,  122,  151,  122,  246,  200,  200,  200,
			  164,  205,  206,  154,  141,  140,  122,  122,  295,  122,
			  169,  194,  214,  612,  150,  339,  124,  142,  122,  122,
			  606,  122,  151,  194,  567,  219,  165,  188,  219,  457,
			  124,  154,  189,  143,  144,  144,  144,  144,  144,  144,
			  448,  155,  124,  162,  296,  152,  162,  165,  431,  145,
			  153,  163,  209,  210,  165,  188,  146,  564,  164,  297,

			  189,  122,  122,  147,  122,  148,  545,  149,  195,  155,
			  195,  195,  241,  152,  241,  241,  166,  145,  153,  211,
			  167,  220,  168,  162,  146,  254,  162,  202,  202,  202,
			  115,  163,  164,  148,  169,  149,  532,  532,  164,  162,
			  201,  201,  162,  408,  166,  490,  408,  163,  167,  162,
			  168,  171,  162,  295,  164,  205,  206,  163,  162,  498,
			  172,  162,  122,  122,  164,  122,  163,  162,  416,  227,
			  162,  194,  227,  164,  169,  163,  173,  175,  372,  171,
			  443,  228,  164,  443,  491,  450,  124,  174,  172,  176,
			  169,  162,  230,  177,  162,  182,  536,  584,  445,  163,

			  169,  445,  346,  346,  173,  175,  164,  122,  122,  169,
			  122,  162,  338,  648,  162,  174,  648,  176,  169,  163,
			  419,  177,  231,  182,  162,  162,  164,  162,  162,  178,
			  179,  124,  163,  163,  383,  180,  585,  118,  162,  164,
			  164,  162,  169,  408,  649,  383,  163,  198,  198,  198,
			  181,  183,  256,  164,  184,  383,  162,  178,  179,  162,
			  186,  372,  169,  180,  163,  194,  362,  185,  187,  122,
			  122,  164,  122,  383,  227,  169,  169,  227,  190,  183,
			  256,  194,  184,  650,  755,  356,  228,  229,  186,  169,
			  493,  347,  346,  124,  347,  185,  187,  230,  295,  243,

			  243,  243,  243,  243,  243,  191,  190,  169,  122,  122,
			  355,  122,  115,  262,  116,  244,  251,  251,  251,  251,
			  251,  251,  252,  348,  346,  354,  348,  231,  353,  494,
			  267,  350,  124,  191,  216,  216,  492,  216,  245,  492,
			  234,  262,  226,  244,  330,  331,  332,  333,  334,  235,
			  235,  235,  235,  235,  235,  118,  194,  198,  198,  198,
			  217,  560,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  236,  249,  249,  249,  249,
			  249,  249,  253,  253,  253,  253,  253,  253,  122,  122,

			  237,  122,  250,  115,  238,  116,  239,  251,  251,  251,
			  251,  251,  251,  341,  218,  244,  122,  122,  221,  122,
			  122,  122,  124,  122,  122,  122,  223,  122,  122,  122,
			  250,  122,  335,  335,  335,  257,  122,  122,  245,  122,
			  124,  632,  560,  244,  124,  560,  118,  258,  124,  755,
			  611,  337,  124,  259,  122,  122,  338,  122,  122,  122,
			  124,  122,  337,  257,  366,  194,  263,  260,  261,  632,
			  305,  300,  264,  122,  122,  258,  122,  162,  124,  161,
			  162,  259,  124,  122,  122,  163,  122,  122,  122,  295,
			  122,  265,  164,  275,  263,  260,  261,  124,  242,  241,

			  264,  266,  122,  122,  240,  122,  233,  124,  105,  122,
			  122,  124,  122,  269,  268,  122,  122,  102,  122,  265,
			  122,  122,  708,  122,  122,  122,  124,  122,  169,  266,
			  708,  226,  271,  124,  223,  122,  122,  222,  122,  124,
			  221,  269,  268,  708,  124,  273,  122,  122,  124,  122,
			  143,  274,  122,  122,  272,  122,  292,  270,  708,  124,
			  271,  143,  194,  122,  122,  192,  122,  709,  122,  122,
			  124,  122,  161,  273,  121,  709,  124,  145,  143,  274,
			  282,  120,  272,  276,  292,  276,  755,  124,  709,  113,
			  600,  282,  124,  148,  145,  123,  123,  123,  123,  123, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  123,  294,  277,  709,  110,  145,  278,  600,  282,  279,
			  640,  600,  122,  122,  289,  122,  123,  105,  280,  103,
			  281,  148,  145,  102,  282,  755,  755,  640,  123,  294,
			  277,  640,  472,  194,  278,  600,  124,  279,  122,  122,
			  485,  122,  289,  472,  287,  755,  280,  288,  281,  122,
			  122,  485,  122,  472,  755,  640,  123,  122,  122,  755,
			  122,  485,  124,  755,  143,  283,  283,  283,  283,  283,
			  283,  472,  287,  124,  290,  288,  755,  755,  291,  485,
			  162,  124,  162,  162,  284,  162,  162,  285,  163,  162,
			  163,  755,  755,  286,  163,  164,  194,  164,  755,  755,

			  293,  164,  290,  755,  755,  162,  291,  755,  162,  336,
			  336,  336,  284,  163,  755,  285,  755,  304,  755,  303,
			  164,  286,  755,  755,  162,  302,  162,  162,  293,  162,
			  755,  169,  163,  169,  163,  755,  755,  169,  306,  164,
			  162,  164,  755,  162,  755,  304,  162,  303,  163,  162,
			  705,  705,  705,  302,  163,  164,  169,  340,  340,  755,
			  340,  164,  755,  194,  755,  755,  306,  307,  340,  340,
			  309,  340,  198,  198,  198,  169,  310,  169,  162,  755,
			  308,  162,  311,  217,  162,  755,  163,  162,  301,  301,
			  301,  169,  163,  164,  755,  307,  755,  169,  309,  164,

			  755,  755,  755,  162,  310,  755,  162,  755,  308,  162,
			  311,  163,  162,  162,  194,  312,  162,  163,  164,  755,
			  755,  163,  755,  162,  164,  267,  162,  313,  164,  169,
			  755,  163,  755,  240,  240,  169,  240,  713,  164,  200,
			  200,  200,  755,  312,  162,  713,  755,  162,  162,  755,
			  314,  162,  163,  315,  169,  313,  163,  357,  713,  164,
			  169,  755,  755,  164,  169,  755,  194,  162,  316,  755,
			  162,  755,  755,  713,  169,  163,  755,  755,  314,  755,
			  755,  315,  164,  317,  318,  318,  318,  318,  318,  319,
			  202,  202,  202,  320,  162,  169,  755,  162,  162,  169,

			  162,  162,  163,  162,  162,  755,  163,  162,  163,  164,
			  755,  755,  163,  164,  755,  164,  755,  319,  169,  164,
			  162,  320,  162,  162,  321,  162,  755,  755,  163,  322,
			  163,  162,  323,  162,  162,  164,  162,  164,  755,  163,
			  755,  163,  198,  198,  198,  169,  164,  755,  164,  169,
			  324,  169,  321,  714,  755,  169,  227,  322,  325,  227,
			  323,  714,  326,  327,  122,  122,  755,  122,  228,  329,
			  755,  169,  755,  169,  714,  755,  328,  755,  324,  230,
			  194,  755,  169,  755,  169,  755,  325,  755,  124,  714,
			  326,  327,  370,  370,  370,  370,  370,  329,  342,  343,

			  343,  343,  343,  343,  328,  216,  216,  227,  216,  231,
			  227,  351,  352,  352,  352,  352,  352,  352,  359,  228,
			  359,  755,  755,  360,  360,  360,  360,  360,  360,  755,
			  230,  217,  755,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  198,  198,  198,  755,
			  231,  358,  358,  358,  358,  358,  358,  361,  361,  361,
			  361,  361,  361,  660,  660,  660,  660,  244,  363,  363,
			  363,  363,  363,  363,  755,  218,  344,  345,  346,  344,
			  345,  344,  344,  344,  344,  344,  344,  344,  344,  347,

			  245,  755,  344,  755,  755,  244,  755,  755,  755,  344,
			  348,  344,  344,  344,  344,  364,  364,  364,  364,  364,
			  364,  371,  371,  371,  371,  371,  371,  367,  755,  367,
			  755,  365,  368,  368,  368,  368,  368,  368,  344,  344,
			  349,  344,  115,  755,  116,  755,  369,  369,  369,  369,
			  369,  369,  122,  122,  366,  122,  755,  122,  122,  365,
			  122,  755,  755,  755,  755,  344,  344,  344,  344,  344,
			  344,  344,  344,  344,  344,  344,  124,  122,  122,  755,
			  122,  124,  755,  755,  373,  118,  755,  122,  122,  642,
			  122,  122,  122,  755,  122,  122,  122,  374,  122,  122,

			  122,  124,  122,  755,  122,  122,  642,  122,  755,  755,
			  642,  124,  373,  122,  122,  124,  122,  375,  376,  124,
			  755,  345,  346,  124,  345,  374,  670,  378,  124,  122,
			  122,  755,  122,  347,  642,  377,  379,  124,  122,  122,
			  755,  122,  755,  670,  348,  375,  376,  670,  380,  122,
			  122,  755,  122,  124,  755,  378,  755,  381,  122,  122,
			  755,  122,  124,  377,  379,  122,  122,  755,  122,  122,
			  122,  670,  122,  124,  349,  384,  380,  755,  122,  122,
			  755,  122,  124,  755,  382,  381,  385,  122,  122,  124,
			  122,  755,  755,  124,  386,  387,  390,  390,  390,  390,

			  390,  390,  124,  384,  533,  716,  533,  716,  755,  122,
			  122,  124,  122,  755,  385,  534,  717,  122,  122,  389,
			  122,  755,  386,  387,  388,  391,  391,  391,  391,  391,
			  391,  755,  143,  124,  593,  593,  593,  593,  593,  122,
			  122,  124,  122,  535,  718,  755,  755,  389,  122,  122,
			  755,  122,  388,  755,  392,  393,  393,  393,  393,  393,
			  393,  755,  755,  124,  394,  394,  394,  394,  394,  394,
			  122,  122,  124,  122,  755,  662,  663,  662,  663,  122,
			  122,  755,  122,  755,  755,  755,  395,  395,  395,  395,
			  395,  395,  755,  392,  124,  396,  396,  396,  396,  396,

			  396,  755,  755,  124,  123,  123,  123,  123,  123,  123,
			  397,  755,  397,  755,  664,  392,  123,  123,  123,  123,
			  123,  123,  122,  122,  392,  122,  122,  122,  755,  122,
			  755,  122,  122,  398,  122,  123,  399,  143,  122,  122,
			  755,  122,  400,  755,  122,  122,  124,  122,  122,  122,
			  124,  122,  672,  402,  755,  124,  672,  122,  122,  755,
			  122,  398,  124,  123,  399,  401,  286,  755,  124,  755,
			  400,  755,  124,  672,  122,  122,  403,  122,  755,  755,
			  404,  124,  122,  122,  672,  122,  755,  122,  122,  755,
			  122,  405,  755,  401,  286,  673,  755,  689,  124,  673,

			  755,  689,  162,  755,  403,  162,  124,  755,  404,  755,
			  163,  124,  406,  755,  755,  755,  673,  164,  689,  405,
			  409,  410,  410,  410,  410,  410,  295,  673,  755,  689,
			  411,  407,  411,  411,  411,  411,  411,  411,  295,  412,
			  413,  414,  414,  414,  414,  295,  162,  162,  162,  162,
			  162,  162,  755,  169,  163,  163,  163,  122,  122,  407,
			  122,  164,  164,  164,  755,  755,  755,  162,  755,  162,
			  162,  162,  162,  755,  162,  163,  755,  163,  417,  163,
			  755,  124,  164,  755,  164,  755,  164,  418,  420,  122,
			  122,  755,  122,  162,  755,  755,  162,  169,  169,  169, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  421,  163,  162,  423,  162,  162,  417,  162,  164,  114,
			  163,  422,  163,  124,  755,  418,  420,  164,  169,  164,
			  169,  467,  169,  114,  114,  114,  162,  755,  421,  162,
			  424,  423,  162,  755,  163,  162,  755,  755,  755,  422,
			  163,  164,  162,  755,  169,  162,  425,  164,  426,  467,
			  163,  162,  755,  169,  162,  169,  755,  164,  424,  163,
			  360,  360,  360,  360,  360,  360,  164,  755,  755,  428,
			  162,  553,  755,  162,  425,  755,  426,  169,  163,  429,
			  755,  427,  553,  169,  431,  164,  162,  430,  162,  162,
			  755,  162,  553,  169,  163,  755,  163,  428,  755,  755,

			  755,  164,  169,  164,  755,  755,  755,  429,  162,  755,
			  553,  162,  755,  755,  755,  430,  163,  755,  432,  755,
			  755,  169,  431,  164,  318,  318,  318,  318,  318,  318,
			  162,  755,  162,  162,  755,  162,  755,  169,  163,  169,
			  163,  748,  749,  748,  749,  164,  432,  164,  162,  755,
			  162,  162,  162,  162,  162,  162,  163,  162,  163,  169,
			  163,  755,  163,  164,  434,  164,  755,  164,  557,  164,
			  449,  449,  449,  449,  449,  449,  433,  755,  755,  557,
			  750,  169,  436,  169,  755,  162,  755,  435,  162,  558,
			  755,  755,  434,  163,  437,  755,  755,  438,  755,  169,

			  164,  169,  755,  169,  433,  169,  162,  557,  755,  162,
			  436,  755,  755,  755,  163,  435,  162,  609,  755,  162,
			  442,  164,  437,  442,  163,  438,  755,  755,  609,  755,
			  442,  164,  443,  442,  444,  755,  169,  755,  610,  755,
			  439,  755,  443,  445,  444,  755,  343,  343,  343,  343,
			  343,  343,  755,  445,  755,  755,  609,  169,  351,  352,
			  352,  352,  352,  352,  352,  440,  755,  169,  122,  122,
			  755,  122,  755,  446,  447,  447,  447,  447,  447,  447,
			  755,  755,  755,  446,  451,  451,  451,  451,  451,  451,
			  755,  755,  124,  440,  452,  452,  452,  452,  452,  452,

			  455,  455,  455,  455,  455,  455,  755,  475,  755,  453,
			  365,  453,  755,  448,  454,  454,  454,  454,  454,  454,
			  368,  368,  368,  368,  368,  368,  456,  456,  456,  456,
			  456,  456,  755,  366,  755,  475,  458,  459,  365,  460,
			  460,  460,  460,  460,  460,  461,  461,  461,  461,  461,
			  461,  462,  462,  462,  462,  462,  462,  122,  122,  755,
			  122,  122,  122,  755,  122,  457,  122,  122,  755,  122,
			  122,  122,  755,  122,  122,  122,  755,  122,  741,  122,
			  122,  124,  122,  122,  122,  124,  122,  755,  122,  122,
			  124,  122,  755,  755,  124,  741,  755,  755,  124,  741,

			  463,  122,  122,  124,  122,  755,  466,  124,  464,  465,
			  755,  755,  124,  755,  742,  470,  471,  755,  122,  122,
			  468,  122,  755,  741,  469,  124,  122,  122,  463,  122,
			  755,  742,  755,  755,  466,  742,  464,  465,  122,  122,
			  755,  122,  124,  470,  471,  755,  755,  474,  468,  755,
			  124,  755,  469,  755,  473,  122,  122,  755,  122,  742,
			  755,  476,  124,  390,  390,  390,  390,  390,  390,  123,
			  122,  122,  123,  122,  755,  474,  755,  755,  123,  124,
			  755,  477,  473,  396,  396,  396,  396,  396,  396,  476,
			  755,  479,  755,  755,  124,  755,  755,  123,  478,  755,

			  123,  724,  724,  724,  724,  724,  123,  755,  755,  477,
			  482,  482,  482,  482,  482,  482,  123,  755,  755,  479,
			  393,  393,  393,  393,  393,  393,  478,  391,  391,  391,
			  391,  391,  391,  394,  394,  394,  394,  394,  394,  123,
			  755,  690,  123,  755,  123,  690,  755,  755,  277,  480,
			  483,  483,  483,  483,  483,  483,  122,  122,  123,  122,
			  123,  610,  690,  755,  280,  123,  755,  123,  755,  755,
			  123,  755,  610,  690,  755,  755,  277,  480,  122,  122,
			  124,  122,  610,  755,  755,  755,  123,  755,  123,  755,
			  755,  755,  280,  123,  395,  395,  395,  395,  395,  395,

			  610,  755,  124,  484,  484,  484,  484,  484,  484,  481,
			  122,  122,  755,  122,  122,  122,  755,  122,  123,  122,
			  122,  755,  122,  122,  122,  490,  122,  410,  410,  410,
			  410,  410,  410,  295,  124,  755,  489,  481,  124,  755,
			  755,  755,  755,  124,  755,  487,  123,  124,  501,  502,
			  502,  502,  502,  502,  755,  755,  486,  755,  488,  122,
			  122,  755,  122,  411,  491,  411,  411,  411,  411,  411,
			  411,  295,  495,  487,  414,  414,  414,  414,  414,  414,
			  295,  755,  755,  124,  486,  493,  488,  414,  414,  414,
			  414,  414,  414,  295,  755,  162,  755,  162,  162,  755,

			  162,  755,  492,  163,  755,  163,  162,  755,  755,  162,
			  164,  496,  164,  755,  163,  755,  755,  162,  755,  162,
			  162,  164,  162,  755,  494,  163,  755,  163,  755,  755,
			  755,  755,  164,  755,  164,  755,  755,  162,  499,  162,
			  162,  755,  162,  755,  500,  163,  169,  163,  169,  503,
			  755,  505,  164,  504,  164,  442,  162,  169,  442,  162,
			  755,  755,  755,  755,  163,  755,  499,  443,  169,  755,
			  169,  164,  500,  755,  755,  755,  755,  503,  445,  505,
			  755,  504,  755,  162,  162,  506,  162,  162,  169,  726,
			  169,  163,  163,  755,  162,  755,  755,  162,  164,  164,

			  726,  507,  163,  162,  755,  755,  162,  169,  446,  164,
			  726,  163,  509,  506,  755,  508,  162,  162,  164,  162,
			  162,  755,  755,  755,  163,  163,  727,  755,  726,  507,
			  510,  164,  164,  162,  169,  169,  162,  727,  755,  755,
			  509,  163,  755,  508,  755,  169,  755,  727,  164,  511,
			  755,  755,  515,  755,  169,  512,  755,  755,  510,  513,
			  514,  514,  514,  514,  514,  727,  162,  169,  169,  162,
			  162,  755,  755,  162,  163,  755,  516,  511,  163,  162,
			  515,  164,  162,  512,  169,  164,  755,  163,  162,  755,
			  162,  162,  162,  162,  164,  162,  163,  731,  163,  734,

			  163,  734,  755,  164,  516,  164,  755,  164,  731,  517,
			  735,  755,  162,  755,  755,  162,  755,  169,  731,  755,
			  163,  169,  755,  519,  755,  489,  755,  164,  755,  520,
			  169,  755,  122,  122,  518,  122,  731,  517,  736,  169,
			  755,  169,  755,  169,  342,  521,  521,  521,  521,  521,
			  755,  519,  755,  755,  755,  755,  124,  520,  755,  755,
			  755,  755,  518,  169,  522,  522,  522,  522,  522,  522,
			  523,  523,  523,  523,  523,  523,  358,  358,  358,  358,
			  358,  358,  524,  525,  525,  525,  525,  525,  526,  526,
			  526,  526,  526,  526,  454,  454,  454,  454,  454,  454, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  755,  755,  755,  448,  365,  527,  527,  527,  527,  527,
			  527,  529,  529,  529,  529,  529,  529,  530,  530,  530,
			  530,  530,  530,  755,  755,  755,  755,  366,  122,  122,
			  755,  122,  365,  531,  531,  531,  531,  531,  531,  122,
			  122,  755,  122,  755,  528,  526,  526,  526,  526,  526,
			  526,  755,  124,  755,  755,  459,  457,  460,  460,  460,
			  460,  460,  460,  124,  122,  122,  755,  122,  755,  122,
			  122,  538,  122,  122,  122,  755,  122,  122,  122,  755,
			  122,  122,  122,  537,  122,  745,  122,  122,  124,  122,
			  755,  122,  122,  124,  122,  122,  122,  124,  122,  538,

			  540,  124,  745,  539,  541,  124,  745,  755,  755,  542,
			  124,  122,  122,  755,  122,  124,  755,  547,  544,  124,
			  755,  543,  755,  546,  122,  122,  755,  122,  540,  732,
			  745,  539,  541,  122,  122,  124,  122,  542,  755,  755,
			  732,  755,  755,  548,  755,  547,  544,  755,  124,  543,
			  732,  546,  122,  122,  755,  122,  755,  124,  551,  551,
			  551,  551,  551,  551,  755,  550,  755,  549,  732,  755,
			  755,  548,  755,  123,  755,  755,  124,  482,  482,  482,
			  482,  482,  482,  755,  755,  484,  484,  484,  484,  484,
			  484,  122,  122,  550,  122,  549,  755,  392,  755,  755,

			  755,  123,  755,  755,  755,  552,  755,  123,  122,  122,
			  755,  122,  755,  122,  122,  124,  122,  583,  583,  583,
			  583,  583,  583,  554,  409,  559,  559,  559,  559,  559,
			  295,  755,  124,  552,  397,  123,  397,  124,  483,  483,
			  483,  483,  483,  483,  755,  555,  122,  122,  556,  122,
			  755,  554,  755,  123,  122,  122,  755,  122,  755,  162,
			  399,  755,  162,  755,  755,  755,  400,  163,  755,  162,
			  124,  755,  162,  555,  164,  755,  556,  163,  124,  755,
			  755,  123,  755,  755,  164,  755,  755,  755,  399,  740,
			  740,  740,  740,  740,  400,  412,  561,  561,  561,  561,

			  561,  295,  412,  562,  561,  561,  561,  561,  295,  566,
			  169,  502,  502,  502,  502,  502,  502,  755,  162,  162,
			  169,  162,  162,  755,  565,  755,  163,  163,  162,  162,
			  755,  162,  162,  164,  164,  755,  163,  163,  162,  162,
			  755,  162,  162,  164,  164,  755,  163,  163,  567,  755,
			  568,  755,  755,  164,  164,  755,  755,  755,  569,  570,
			  571,  431,  755,  514,  514,  514,  514,  514,  514,  169,
			  169,  572,  588,  588,  588,  588,  588,  588,  568,  169,
			  169,  122,  122,  573,  122,  755,  569,  570,  571,  169,
			  169,  755,  162,  162,  755,  162,  162,  755,  755,  572,

			  163,  163,  755,  755,  755,  124,  755,  164,  164,  162,
			  755,  573,  162,  162,  746,  162,  162,  163,  162,  162,
			  755,  163,  162,  163,  164,  575,  755,  163,  164,  574,
			  164,  746,  755,  162,  164,  746,  162,  755,  755,  755,
			  576,  163,  755,  169,  169,  755,  162,  577,  164,  162,
			  755,  755,  755,  575,  163,  755,  755,  574,  755,  746,
			  169,  164,  578,  755,  169,  579,  169,  755,  576,  755,
			  169,  162,  755,  162,  162,  577,  162,  755,  580,  163,
			  755,  163,  755,  755,  169,  755,  164,  755,  164,  755,
			  578,  755,  755,  579,  755,  755,  755,  169,  442,  755,

			  755,  442,  755,  581,  755,  755,  580,  755,  755,  755,
			  443,  755,  444,  582,  521,  521,  521,  521,  521,  521,
			  755,  445,  169,  584,  169,  525,  525,  525,  525,  525,
			  525,  581,  526,  526,  526,  526,  526,  526,  755,  755,
			  755,  582,  587,  587,  587,  587,  587,  587,  586,  755,
			  755,  446,  589,  589,  589,  589,  589,  589,  755,  755,
			  755,  755,  585,  590,  590,  590,  590,  590,  590,  591,
			  591,  591,  591,  591,  591,  755,  586,  122,  122,  755,
			  122,  528,  592,  592,  592,  592,  592,  592,  594,  594,
			  594,  594,  594,  594,  122,  122,  755,  122,  755,  122,

			  122,  124,  122,  755,  250,  595,  122,  122,  755,  122,
			  122,  122,  755,  122,  122,  122,  755,  122,  124,  755,
			  755,  755,  596,  124,  122,  122,  755,  122,  755,  755,
			  124,  597,  250,  595,  124,  755,  122,  122,  124,  122,
			  122,  122,  755,  122,  755,  598,  162,  599,  124,  162,
			  596,  755,  122,  122,  163,  122,  602,  755,  601,  597,
			  124,  164,  755,  755,  124,  613,  614,  614,  614,  614,
			  614,  755,  604,  598,  755,  599,  124,  755,  122,  122,
			  603,  122,  755,  605,  602,  276,  601,  276,  755,  551,
			  551,  551,  551,  551,  551,  122,  122,  169,  122,  755,

			  604,  755,  124,  755,  123,  755,  122,  122,  603,  122,
			  490,  605,  559,  559,  559,  559,  559,  559,  295,  124,
			  493,  755,  561,  561,  561,  561,  561,  561,  295,  755,
			  124,  755,  123,  122,  122,  755,  122,  608,  607,  495,
			  755,  561,  561,  561,  561,  561,  561,  295,  162,  491,
			  755,  162,  755,  755,  755,  755,  163,  124,  755,  494,
			  755,  122,  122,  164,  122,  608,  607,  501,  616,  616,
			  616,  616,  616,  755,  162,  755,  615,  162,  496,  755,
			  162,  755,  163,  162,  755,  124,  755,  755,  163,  164,
			  162,  639,  755,  162,  755,  164,  755,  755,  163,  169,

			  162,  755,  617,  162,  615,  164,  162,  755,  163,  162,
			  122,  122,  755,  122,  163,  164,  755,  755,  755,  639,
			  162,  164,  618,  162,  755,  169,  755,  755,  163,  162,
			  617,  169,  162,  755,  124,  164,  755,  163,  755,  619,
			  162,  169,  755,  162,  164,  755,  162,  755,  163,  162,
			  618,  169,  755,  637,  163,  164,  755,  169,  755,  755,
			  162,  164,  755,  162,  621,  755,  620,  619,  163,  755,
			  162,  169,  622,  162,  162,  164,  755,  162,  163,  755,
			  169,  637,  163,  122,  122,  164,  122,  755,  755,  164,
			  623,  169,  621,  162,  620,  162,  162,  169,  162,  755,

			  622,  163,  624,  163,  755,  625,  755,  124,  164,  755,
			  164,  169,  522,  522,  522,  522,  522,  522,  623,  755,
			  755,  169,  755,  755,  755,  169,  627,  755,  755,  755,
			  624,  755,  755,  625,  755,  755,  626,  524,  628,  628,
			  628,  628,  628,  629,  169,  629,  169,  755,  630,  630,
			  630,  630,  630,  630,  627,  630,  630,  630,  630,  630,
			  630,  755,  755,  755,  626,  631,  631,  631,  631,  631,
			  631,  530,  530,  530,  530,  530,  530,  634,  634,  634,
			  634,  634,  634,  635,  635,  635,  635,  635,  635,  122,
			  122,  755,  122,  755,  528,  636,  636,  636,  636,  636, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  636,  122,  122,  755,  122,  122,  122,  755,  122,  122,
			  122,  632,  122,  124,  122,  122,  755,  122,  122,  122,
			  755,  122,  755,  755,  755,  124,  638,  122,  122,  124,
			  122,  755,  755,  124,  366,  755,  755,  755,  124,  632,
			  122,  122,  124,  122,  755,  755,  755,  162,  755,  755,
			  162,  124,  755,  641,  638,  163,  755,  755,  755,  643,
			  755,  755,  164,  649,  124,  614,  614,  614,  614,  614,
			  614,  566,  644,  616,  616,  616,  616,  616,  616,  755,
			  162,  641,  755,  162,  755,  755,  162,  643,  163,  162,
			  651,  755,  755,  755,  163,  164,  162,  755,  169,  162,

			  644,  164,  650,  755,  163,  162,  162,  755,  162,  162,
			  567,  164,  755,  163,  163,  755,  755,  652,  651,  162,
			  164,  164,  162,  755,  755,  162,  653,  163,  162,  122,
			  122,  169,  122,  163,  164,  162,  162,  169,  162,  162,
			  164,  755,  755,  163,  163,  652,  755,  169,  755,  755,
			  164,  164,  162,  124,  653,  162,  169,  169,  162,  755,
			  163,  162,  755,  755,  755,  755,  163,  164,  755,  755,
			  169,  755,  755,  164,  654,  584,  169,  628,  628,  628,
			  628,  628,  628,  755,  655,  755,  169,  169,  755,  755,
			  656,  630,  630,  630,  630,  630,  630,  755,  755,  755,

			  755,  755,  654,  169,  755,  755,  755,  755,  755,  169,
			  122,  122,  655,  122,  585,  755,  755,  755,  656,  630,
			  630,  630,  630,  630,  630,  657,  657,  657,  657,  657,
			  657,  658,  755,  658,  124,  755,  659,  659,  659,  659,
			  659,  659,  661,  661,  661,  661,  661,  661,  665,  665,
			  665,  665,  665,  665,  122,  122,  755,  122,  122,  122,
			  755,  122,  755,  755,  632,  122,  122,  755,  122,  122,
			  122,  755,  122,  162,  122,  122,  162,  122,  124,  755,
			  755,  163,  124,  755,  666,  755,  755,  366,  164,  124,
			  755,  755,  632,  124,  667,  755,  755,  668,  124,  669,

			  755,  755,  755,  676,  755,  671,  613,  675,  675,  675,
			  675,  675,  666,  162,  755,  162,  162,  755,  162,  755,
			  755,  163,  667,  163,  169,  668,  755,  669,  164,  162,
			  164,  676,  162,  671,  755,  755,  755,  163,  162,  755,
			  162,  162,  162,  162,  164,  162,  163,  678,  163,  677,
			  163,  755,  755,  164,  755,  164,  755,  164,  755,  679,
			  755,  755,  755,  755,  169,  755,  169,  755,  755,  680,
			  122,  122,  755,  122,  755,  678,  755,  677,  755,  755,
			  169,  659,  659,  659,  659,  659,  659,  679,  755,  169,
			  755,  169,  755,  169,  124,  755,  755,  680,  681,  681,

			  681,  681,  681,  681,  682,  682,  682,  682,  682,  682,
			  535,  535,  535,  535,  535,  535,  683,  683,  683,  683,
			  683,  683,  684,  684,  684,  684,  684,  684,  685,  685,
			  685,  685,  685,  685,  755,  122,  122,  528,  122,  122,
			  122,  755,  122,  755,  632,  122,  122,  755,  122,  674,
			  674,  649,  674,  675,  675,  675,  675,  675,  675,  124,
			  755,  122,  122,  124,  122,  755,  755,  366,  162,  124,
			  686,  162,  632,  691,  755,  755,  163,  688,  162,  162,
			  755,  162,  162,  164,  687,  124,  163,  163,  755,  162,
			  650,  755,  162,  164,  164,  755,  755,  163,  686,  755,

			  755,  755,  755,  692,  164,  688,  755,  755,  755,  755,
			  698,  694,  687,  657,  657,  657,  657,  657,  657,  169,
			  755,  755,  755,  693,  755,  122,  122,  755,  122,  169,
			  169,  692,  696,  696,  696,  696,  696,  696,  698,  694,
			  169,  685,  685,  685,  685,  685,  685,  755,  662,  124,
			  662,  693,  528,  684,  684,  684,  684,  684,  684,  122,
			  122,  755,  122,  162,  162,  162,  162,  162,  162,  699,
			  755,  163,  163,  163,  755,  755,  755,  755,  164,  164,
			  164,  122,  122,  124,  122,  755,  755,  664,  755,  755,
			  755,  697,  755,  122,  122,  702,  122,  699,  706,  706,

			  706,  706,  706,  706,  755,  124,  755,  122,  122,  704,
			  122,  755,  755,  703,  169,  169,  169,  124,  755,  697,
			  755,  162,  755,  702,  162,  162,  707,  162,  162,  163,
			  162,  124,  755,  163,  755,  163,  164,  704,  755,  755,
			  164,  703,  164,  711,  711,  711,  711,  711,  711,  122,
			  122,  755,  122,  755,  707,  664,  664,  664,  664,  664,
			  664,  755,  162,  755,  755,  162,  710,  755,  122,  122,
			  163,  122,  169,  124,  755,  755,  169,  164,  169,  755,
			  162,  755,  755,  162,  122,  122,  755,  122,  163,  755,
			  755,  755,  124,  755,  710,  164,  755,  755,  712,  723,

			  723,  723,  723,  723,  723,  755,  755,  755,  124,  719,
			  755,  715,  755,  169,  162,  162,  725,  162,  162,  755,
			  755,  722,  163,  163,  122,  122,  712,  122,  755,  164,
			  164,  169,  755,  755,  755,  755,  755,  719,  755,  715,
			  755,  755,  755,  755,  725,  755,  728,  755,  124,  722,
			  729,  729,  729,  729,  729,  729,  730,  730,  730,  730,
			  730,  730,  755,  755,  755,  169,  169,  733,  733,  733,
			  733,  733,  733,  755,  728,  718,  718,  718,  718,  718,
			  718,  739,  739,  739,  739,  739,  739,  743,  743,  743,
			  743,  743,  743,  744,  744,  744,  744,  744,  744,  747,

			  747,  747,  747,  747,  747,  736,  736,  736,  736,  736,
			  736,  751,  751,  751,  751,  751,  751,  752,  752,  752,
			  752,  752,  752,  753,  753,  753,  753,  753,  753,  748,
			  755,  748,  755,  755,  752,  752,  752,  752,  752,  752,
			  754,  754,  754,  754,  754,  754,  750,  750,  750,  750,
			  750,  750,  109,  109,  109,  109,  109,  109,  109,  647,
			  647,  647,  647,  647,  647,  647,  755,  755,  750,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   84,   84,   84,   84,   84,

			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   91,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,   91,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,   91,   91,   91,
			   91,   91,   91,  104,  104,  755,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  755,  104,  104,  104,  104,  106, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  106,  755,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  123,  123,  123,  755,  755,
			  755,  755,  755,  123,  123,  123,  755,  123,  123,  123,
			  123,  123,  123,  123,  755,  755,  123,  123,  123,  156,
			  156,  755,  156,  755,  156,  156,  755,  755,  156,  156,
			  156,  156,  156,  156,  156,  755,  755,  156,  156,  156,
			  160,  160,  755,  160,  160,  160,  160,  160,  160,  160,
			  160,  160,  160,  160,  160,  160,  160,  160,  160,  160,
			  160,  160,  160,  160,  160,  160,  165,  755,  165,  165,

			  755,  755,  755,  165,  165,  165,  755,  755,  165,  165,
			  165,  165,  165,  165,  165,  165,  755,  165,  165,  165,
			  193,  193,  755,  193,  193,  193,  193,  193,  193,  193,
			  193,  193,  193,  193,  193,  193,  193,  193,  193,  193,
			  193,  755,  193,  193,  193,  193,  203,  203,  203,  203,
			  203,  203,  203,  203,  203,  203,  203,  203,  203,  203,
			  203,  203,  203,  203,  203,  203,  203,  203,  203,  203,
			  203,  203,  207,  207,  207,  207,  207,  207,  207,  207,
			  207,  207,  207,  207,  207,  207,  207,  207,  207,  207,
			  207,  207,  207,  207,  207,  207,  207,  207,  212,  212,

			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,
			  212,  212,  212,  212,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  225,  755,  225,  755,  755,  755,  225,  755,  225,  225,
			  755,  755,  225,  225,  225,  225,  225,  225,  225,  755,
			  755,  225,  225,  225,  232,  232,  755,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,

			  109,  755,  755,  755,  109,  109,  755,  755,  109,  109,
			  109,  109,  109,  109,  109,  755,  755,  109,  109,  109,
			  110,  110,  110,  110,  110,  110,  110,  110,  110,  110,
			  110,  110,  110,  110,  110,  110,  110,  110,  110,  110,
			  110,  110,  110,  110,  110,  110,  114,  114,  114,  755,
			  755,  114,  114,  114,  114,  114,  114,  114,  114,  755,
			  114,  114,  114,  255,  755,  755,  255,  255,  255,  255,
			  255,  255,  255,  255,  255,  255,  255,  755,  755,  255,
			  255,  255,  205,  205,  205,  205,  205,  205,  205,  205,
			  755,  205,  205,  205,  205,  205,  205,  205,  205,  205,

			  205,  205,  205,  205,  205,  205,  205,  205,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  218,  218,  218,  755,  755,  755,
			  755,  755,  755,  755,  755,  218,  218,  218,  218,  218,
			  218,  218,  218,  755,  755,  755,  755,  755,  218,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,

			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  301,  301,  301,  755,  755,  301,  301,  301,  301,
			  301,  301,  301,  301,  755,  301,  301,  301,  344,  344,
			  344,  344,  344,  344,  344,  344,  344,  344,  344,  344,
			  344,  344,  344,  344,  344,  344,  344,  344,  344,  344,
			  344,  344,  344,  344,  647,  755,  755,  755,  647,  647,
			  755,  755,  647,  647,  647,  647,  647,  647,  647,  755,
			  755,  647,  647,  647,   13,  755,  755,  755,  755,  755,
			  755,  755,  755,  755,  755,  755,  755,  755,  755,  755,
			  755,  755,  755,  755,  755,  755,  755,  755,  755,  755,

			  755,  755,  755,  755,  755,  755,  755,  755,  755,  755,
			  755,  755,  755,  755,  755,  755,  755,  755,  755,  755,
			  755,  755,  755,  755,  755,  755,  755,  755,  755,  755,
			  755,  755,  755,  755,  755,  755,  755,  755,  755,  755,
			  755,  755,  755,  755,  755,  755,  755,  755,  755,  755,
			  755,  755,  755,  755,  755,  755,  755,  755,  755,  755,
			  755,  755,  755,  755,  755, yy_Dummy>>,
			1, 665, 5000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 5664)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			yy_chk_template_3 (an_array)
			yy_chk_template_4 (an_array)
			yy_chk_template_5 (an_array)
			yy_chk_template_6 (an_array)
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
			    1,    3,    5,   20,    6,    3,    4,    7,    8,   88,

			    4,    9,    9,   78,    9,   10,   10,   15,   10,   15,
			   15,   86,   38,   38,    9,   38,  732,   27,   10,   27,
			   27,   27,   27,   27,   27,  415,  497,  159,    5,    5,
			    6,    6,   40,   40,   84,   40,   38,   53,   20,  731,
			   97,  714,    3,   97,   38,   53,   53,    4,   86,   86,
			   78,    7,    8,   88,  713,  224,   40,    9,  224,  415,
			   76,   10,   76,   76,  101,  228,  101,  101,  228,  497,
			   84,   84,   38,  159,    3,    3,    3,    3,    3,    4,
			    4,    4,    4,    4,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,

			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   29,   80,   29,  114,   29,   29,
			   29,   29,   29,   29,   30,  158,   30,   79,   30,   30,
			   30,   30,   30,   30,   92,   37,   37,   92,   37,  337,

			  162,   39,   39,  162,   39,   87,   41,   41,  162,   41,
			  682,   42,   42,  114,   42,  230,  689,   29,  230,   37,
			   43,   43,  158,   43,  657,   39,  650,   30,   37,   39,
			   41,   82,   37,  331,   37,   42,  337,   58,   39,   42,
			   58,   87,   87,   41,   43,   58,   44,   44,  647,   44,
			   92,   42,   58,   80,   41,   43,   37,   39,  689,  299,
			   37,   81,   37,   79,   79,   79,   39,   42,  612,   58,
			   44,   41,   45,   45,  610,   45,  609,   46,   46,   42,
			   46,  591,   41,   43,   44,   44,   47,   47,   58,   47,
			   44,   49,   49,  207,   49,  299,   45,   58,  212,   60,

			   45,   46,   60,   51,   51,  203,   51,   60,   82,   82,
			   47,  331,   44,   44,   60,   49,   47,   46,   44,  115,
			  115,  115,  115,  115,  115,  501,   49,   51,   45,   47,
			  207,  207,   52,   52,   49,   52,  585,   81,   81,   81,
			  567,  203,  203,   51,   47,   46,   50,   50,  157,   50,
			   60,   83,  212,  563,   49,  209,   52,   47,   48,   48,
			  553,   48,   49,  333,  501,  219,   69,   69,  219,  530,
			   50,   51,   69,   48,   48,   48,   48,   48,   48,   48,
			  522,   52,   48,   57,  157,   50,   57,   69,  513,   48,
			   50,   57,  209,  209,   69,   69,   48,  498,   57,  157,

			   69,  122,  122,   48,  122,   48,  472,   48,  195,   52,
			  195,  195,  241,   50,  241,  241,   57,   48,   50,  206,
			   57,  219,   57,   59,   48,  122,   59,   83,   83,   83,
			  451,   59,  301,   48,   57,   48,  458,  458,   59,   61,
			  333,  333,   61,  408,   57,  409,  408,   61,   57,   62,
			   57,   59,   62,  409,   61,  206,  206,   62,   63,  416,
			   59,   63,  123,  123,   62,  123,   63,   65,  301,  100,
			   65,  199,  100,   63,   59,   65,   61,   62,  372,   59,
			  443,  100,   65,  443,  409,  362,  123,   61,   59,   62,
			   61,   64,  100,   63,   64,   65,  462,  524,  445,   64,

			   62,  445,  349,  344,   61,   62,   64,  125,  125,   63,
			  125,   66,  339,  648,   66,   61,  648,   62,   65,   66,
			  305,   63,  100,   65,   67,   68,   66,   67,   68,   64,
			   64,  125,   67,   68,  267,   64,  524,  462,   70,   67,
			   68,   70,   64,  295,  613,  267,   70,  199,  199,  199,
			   64,   66,  125,   70,   67,  267,   71,   64,   64,   71,
			   68,  255,   66,   64,   71,  198,  247,   67,   68,  131,
			  131,   71,  131,  267,   99,   67,   68,   99,   70,   66,
			  125,  200,   67,  613,  246,  239,   99,   99,   68,   70,
			  412,  347,  347,  131,  347,   67,   68,   99,  412,  112,

			  112,  112,  112,  112,  112,   71,   70,   71,  135,  135,
			  238,  135,  117,  131,  117,  112,  117,  117,  117,  117,
			  117,  117,  117,  348,  348,  237,  348,   99,  236,  412,
			  135,  234,  135,   71,   89,   89,  492,   89,  112,  492,
			  108,  131,  226,  112,  198,  198,  198,  198,  198,  108,
			  108,  108,  108,  108,  108,  117,  201,  200,  200,  200,
			   89,  492,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,  108,  116,  116,  116,  116,
			  116,  116,  118,  118,  118,  118,  118,  118,  126,  126,

			  108,  126,  116,  119,  108,  119,  108,  119,  119,  119,
			  119,  119,  119,  222,   89,  358,  127,  127,  221,  127,
			  128,  128,  126,  128,  129,  129,  220,  129,  130,  130,
			  116,  130,  201,  201,  201,  126,  132,  132,  358,  132,
			  127,  589,  560,  358,  128,  560,  119,  127,  129,  216,
			  560,  210,  130,  128,  133,  133,  208,  133,  134,  134,
			  132,  134,  205,  126,  589,  193,  132,  129,  130,  589,
			  169,  163,  132,  136,  136,  127,  136,  165,  133,  160,
			  165,  128,  134,  137,  137,  165,  137,  139,  139,  156,
			  139,  133,  165,  143,  132,  129,  130,  136,  111,  110,

			  132,  134,  138,  138,  109,  138,  106,  137,  104,  140,
			  140,  139,  140,  137,  136,  141,  141,  102,  141,  133,
			  142,  142,  700,  142,  153,  153,  138,  153,  165,  134,
			  700,   98,  139,  140,   95,  145,  145,   94,  145,  141,
			   93,  137,  136,  700,  142,  141,  146,  146,  153,  146,
			  145,  142,  155,  155,  140,  155,  153,  138,  700,  145,
			  139,  146,   75,  148,  148,   72,  148,  701,  151,  151,
			  146,  151,   56,  141,   35,  701,  155,  146,  148,  142,
			  145,   33,  140,  144,  153,  144,  144,  148,  701,   28,
			  545,  146,  151,  146,  148,  149,  149,  149,  149,  149, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  149,  155,  144,  701,   26,  146,  144,  545,  148,  144,
			  600,  545,  150,  150,  151,  150,  144,   18,  144,   17,
			  144,  146,  148,   16,  149,   13,    0,  600,  149,  155,
			  144,  600,  383,  202,  144,  545,  150,  144,  152,  152,
			  402,  152,  151,  383,  150,    0,  144,  150,  144,  147,
			  147,  402,  147,  383,    0,  600,  149,  154,  154,    0,
			  154,  402,  152,    0,  147,  147,  147,  147,  147,  147,
			  147,  383,  150,  147,  152,  150,    0,    0,  152,  402,
			  166,  154,  167,  166,  147,  167,  168,  147,  166,  168,
			  167,    0,    0,  147,  168,  166,  330,  167,    0,    0,

			  154,  168,  152,    0,    0,  170,  152,    0,  170,  202,
			  202,  202,  147,  170,    0,  147,    0,  168,    0,  167,
			  170,  147,    0,    0,  171,  166,  173,  171,  154,  173,
			    0,  166,  171,  167,  173,    0,    0,  168,  170,  171,
			  172,  173,    0,  172,    0,  168,  174,  167,  172,  174,
			  695,  695,  695,  166,  174,  172,  170,  217,  217,    0,
			  217,  174,    0,  332,    0,    0,  170,  171,  340,  340,
			  173,  340,  330,  330,  330,  171,  174,  173,  175,    0,
			  172,  175,  174,  217,  176,    0,  175,  176,  779,  779,
			  779,  172,  176,  175,  340,  171,    0,  174,  173,  176,

			    0,    0,    0,  177,  174,    0,  177,    0,  172,  178,
			  174,  177,  178,  180,  334,  175,  180,  178,  177,    0,
			    0,  180,    0,  179,  178,  177,  179,  176,  180,  175,
			    0,  179,    0,  240,  240,  176,  240,  708,  179,  332,
			  332,  332,    0,  175,  182,  708,    0,  182,  183,    0,
			  178,  183,  182,  179,  177,  176,  183,  240,  708,  182,
			  178,    0,    0,  183,  180,    0,  335,  181,  180,    0,
			  181,    0,    0,  708,  179,  181,    0,    0,  178,    0,
			    0,  179,  181,  181,  181,  181,  181,  181,  181,  182,
			  334,  334,  334,  183,  184,  182,    0,  184,  185,  183,

			  186,  185,  184,  186,  187,    0,  185,  187,  186,  184,
			    0,    0,  187,  185,    0,  186,    0,  182,  181,  187,
			  191,  183,  188,  191,  184,  188,    0,    0,  191,  185,
			  188,  189,  186,  190,  189,  191,  190,  188,    0,  189,
			    0,  190,  335,  335,  335,  184,  189,    0,  190,  185,
			  187,  186,  184,  709,    0,  187,  225,  185,  188,  225,
			  186,  709,  188,  189,  258,  258,    0,  258,  225,  191,
			    0,  191,    0,  188,  709,    0,  190,    0,  187,  225,
			  336,    0,  189,    0,  190,    0,  188,    0,  258,  709,
			  188,  189,  252,  252,  252,  252,  252,  191,  223,  223,

			  223,  223,  223,  223,  190,  213,  213,  227,  213,  225,
			  227,  235,  235,  235,  235,  235,  235,  235,  244,  227,
			  244,    0,    0,  244,  244,  244,  244,  244,  244,    0,
			  227,  213,    0,  213,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  336,  336,  336,    0,
			  227,  243,  243,  243,  243,  243,  243,  245,  245,  245,
			  245,  245,  245,  633,  633,  633,  633,  243,  248,  248,
			  248,  248,  248,  248,    0,  213,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,

			  243,    0,  229,    0,    0,  243,    0,    0,    0,  229,
			  229,  229,  229,  229,  229,  249,  249,  249,  249,  249,
			  249,  253,  253,  253,  253,  253,  253,  250,    0,  250,
			    0,  249,  250,  250,  250,  250,  250,  250,  229,  229,
			  229,  229,  251,    0,  251,    0,  251,  251,  251,  251,
			  251,  251,  256,  256,  249,  256,    0,  257,  257,  249,
			  257,    0,    0,    0,    0,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  256,  259,  259,    0,
			  259,  257,    0,    0,  256,  251,    0,  260,  260,  606,
			  260,  261,  261,    0,  261,  262,  262,  257,  262,  263,

			  263,  259,  263,    0,  264,  264,  606,  264,    0,    0,
			  606,  260,  256,  265,  265,  261,  265,  259,  260,  262,
			    0,  345,  345,  263,  345,  257,  642,  262,  264,  266,
			  266,    0,  266,  345,  606,  261,  263,  265,  268,  268,
			    0,  268,    0,  642,  345,  259,  260,  642,  264,  269,
			  269,    0,  269,  266,    0,  262,    0,  265,  270,  270,
			    0,  270,  268,  261,  263,  271,  271,    0,  271,  272,
			  272,  642,  272,  269,  345,  268,  264,    0,  273,  273,
			    0,  273,  270,    0,  266,  265,  269,  274,  274,  271,
			  274,    0,    0,  272,  270,  271,  276,  276,  276,  276,

			  276,  276,  273,  268,  461,  711,  461,  711,    0,  277,
			  277,  274,  277,    0,  269,  461,  711,  286,  286,  274,
			  286,    0,  270,  271,  273,  277,  277,  277,  277,  277,
			  277,    0,  286,  277,  534,  534,  534,  534,  534,  278,
			  278,  286,  278,  461,  711,    0,    0,  274,  279,  279,
			    0,  279,  273,    0,  277,  278,  278,  278,  278,  278,
			  278,    0,    0,  278,  279,  279,  279,  279,  279,  279,
			  280,  280,  279,  280,    0,  635,  635,  635,  635,  281,
			  281,    0,  281,    0,    0,    0,  280,  280,  280,  280,
			  280,  280,    0,  279,  280,  281,  281,  281,  281,  281,

			  281,    0,    0,  281,  282,  282,  282,  282,  282,  282,
			  283,    0,  283,  283,  635,  280,  284,  284,  284,  284,
			  284,  284,  285,  285,  281,  285,  287,  287,    0,  287,
			    0,  288,  288,  283,  288,  284,  283,  285,  290,  290,
			    0,  290,  283,    0,  289,  289,  285,  289,  291,  291,
			  287,  291,  645,  288,    0,  288,  645,  292,  292,    0,
			  292,  283,  290,  284,  283,  287,  285,    0,  289,    0,
			  283,    0,  291,  645,  293,  293,  289,  293,    0,    0,
			  290,  292,  294,  294,  645,  294,    0,  378,  378,    0,
			  378,  291,    0,  287,  285,  646,    0,  672,  293,  646,

			    0,  672,  304,    0,  289,  304,  294,    0,  290,    0,
			  304,  378,  292,    0,    0,    0,  646,  304,  672,  291,
			  296,  296,  296,  296,  296,  296,  296,  646,    0,  672,
			  297,  294,  297,  297,  297,  297,  297,  297,  297,  298,
			  298,  298,  298,  298,  298,  298,  302,  303,  306,  302,
			  303,  306,    0,  304,  302,  303,  306,  400,  400,  294,
			  400,  302,  303,  306,    0,    0,    0,  308,    0,  307,
			  308,  309,  307,    0,  309,  308,    0,  307,  302,  309,
			    0,  400,  308,    0,  307,    0,  309,  303,  306,  377,
			  377,    0,  377,  310,    0,    0,  310,  302,  303,  306, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  307,  310,  311,  309,  312,  311,  302,  312,  310,  763,
			  311,  308,  312,  377,    0,  303,  306,  311,  308,  312,
			  307,  377,  309,  763,  763,  763,  313,    0,  307,  313,
			  310,  309,  314,    0,  313,  314,    0,    0,    0,  308,
			  314,  313,  315,    0,  310,  315,  311,  314,  312,  377,
			  315,  316,    0,  311,  316,  312,    0,  315,  310,  316,
			  359,  359,  359,  359,  359,  359,  316,    0,    0,  314,
			  317,  485,    0,  317,  311,    0,  312,  313,  317,  315,
			    0,  313,  485,  314,  317,  317,  320,  316,  319,  320,
			    0,  319,  485,  315,  320,    0,  319,  314,    0,    0,

			    0,  320,  316,  319,    0,    0,    0,  315,  318,    0,
			  485,  318,    0,    0,    0,  316,  318,    0,  319,    0,
			    0,  317,  318,  318,  318,  318,  318,  318,  318,  318,
			  321,    0,  322,  321,    0,  322,    0,  320,  321,  319,
			  322,  744,  744,  744,  744,  321,  319,  322,  323,    0,
			  324,  323,  325,  324,  326,  325,  323,  326,  324,  318,
			  325,    0,  326,  323,  322,  324,    0,  325,  489,  326,
			  361,  361,  361,  361,  361,  361,  321,    0,    0,  489,
			  744,  321,  324,  322,    0,  327,    0,  323,  327,  489,
			    0,    0,  322,  327,  325,    0,    0,  326,    0,  323,

			  327,  324,    0,  325,  321,  326,  328,  489,    0,  328,
			  324,    0,    0,    0,  328,  323,  329,  557,    0,  329,
			  342,  328,  325,  342,  329,  326,    0,    0,  557,    0,
			  343,  329,  342,  343,  342,    0,  327,    0,  557,    0,
			  327,    0,  343,  342,  343,    0,  343,  343,  343,  343,
			  343,  343,    0,  343,    0,    0,  557,  328,  352,  352,
			  352,  352,  352,  352,  352,  329,    0,  329,  386,  386,
			    0,  386,    0,  342,  360,  360,  360,  360,  360,  360,
			    0,    0,    0,  343,  363,  363,  363,  363,  363,  363,
			    0,    0,  386,  329,  364,  364,  364,  364,  364,  364,

			  366,  366,  366,  366,  366,  366,    0,  386,    0,  365,
			  364,  365,    0,  360,  365,  365,  365,  365,  365,  365,
			  367,  367,  367,  367,  367,  367,  368,  368,  368,  368,
			  368,  368,    0,  364,    0,  386,  369,  369,  364,  369,
			  369,  369,  369,  369,  369,  370,  370,  370,  370,  370,
			  370,  371,  371,  371,  371,  371,  371,  373,  373,    0,
			  373,  374,  374,    0,  374,  368,  375,  375,    0,  375,
			  376,  376,    0,  376,  379,  379,    0,  379,  737,  380,
			  380,  373,  380,  381,  381,  374,  381,    0,  382,  382,
			  375,  382,    0,    0,  376,  737,    0,    0,  379,  737,

			  373,  385,  385,  380,  385,    0,  376,  381,  374,  375,
			    0,    0,  382,    0,  738,  381,  382,    0,  384,  384,
			  379,  384,    0,  737,  380,  385,  387,  387,  373,  387,
			    0,  738,    0,    0,  376,  738,  374,  375,  388,  388,
			    0,  388,  384,  381,  382,    0,    0,  385,  379,  392,
			  387,    0,  380,    0,  384,  389,  389,    0,  389,  738,
			    0,  387,  388,  390,  390,  390,  390,  390,  390,  392,
			  401,  401,  392,  401,    0,  385,    0,    0,  392,  389,
			    0,  388,  384,  396,  396,  396,  396,  396,  396,  387,
			    0,  390,    0,    0,  401,    0,    0,  392,  389,    0,

			  392,  717,  717,  717,  717,  717,  392,    0,    0,  388,
			  397,  397,  397,  397,  397,  397,  396,    0,    0,  390,
			  393,  393,  393,  393,  393,  393,  389,  391,  391,  391,
			  391,  391,  391,  394,  394,  394,  394,  394,  394,  393,
			    0,  673,  391,    0,  396,  673,    0,    0,  394,  391,
			  398,  398,  398,  398,  398,  398,  403,  403,  391,  403,
			  391,  558,  673,    0,  394,  398,    0,  393,    0,    0,
			  391,    0,  558,  673,    0,    0,  394,  391,  395,  395,
			  403,  395,  558,    0,    0,    0,  391,    0,  391,    0,
			    0,    0,  394,  398,  395,  395,  395,  395,  395,  395,

			  558,    0,  395,  399,  399,  399,  399,  399,  399,  395,
			  404,  404,    0,  404,  405,  405,    0,  405,  399,  406,
			  406,    0,  406,  407,  407,  410,  407,  410,  410,  410,
			  410,  410,  410,  410,  404,    0,  407,  395,  405,    0,
			    0,    0,    0,  406,    0,  405,  399,  407,  419,  419,
			  419,  419,  419,  419,    0,    0,  404,    0,  406,  463,
			  463,    0,  463,  411,  410,  411,  411,  411,  411,  411,
			  411,  411,  413,  405,  413,  413,  413,  413,  413,  413,
			  413,    0,    0,  463,  404,  414,  406,  414,  414,  414,
			  414,  414,  414,  414,    0,  417,    0,  418,  417,    0,

			  418,    0,  411,  417,    0,  418,  420,    0,    0,  420,
			  417,  413,  418,    0,  420,    0,    0,  421,    0,  422,
			  421,  420,  422,    0,  414,  421,    0,  422,    0,    0,
			    0,    0,  421,    0,  422,    0,    0,  423,  417,  424,
			  423,    0,  424,    0,  418,  423,  417,  424,  418,  420,
			    0,  422,  423,  421,  424,  442,  425,  420,  442,  425,
			    0,    0,    0,    0,  425,    0,  417,  442,  421,    0,
			  422,  425,  418,    0,    0,    0,    0,  420,  442,  422,
			    0,  421,    0,  426,  427,  424,  426,  427,  423,  720,
			  424,  426,  427,    0,  428,    0,    0,  428,  426,  427,

			  720,  425,  428,  429,    0,    0,  429,  425,  442,  428,
			  720,  429,  427,  424,    0,  426,  430,  432,  429,  430,
			  432,    0,    0,    0,  430,  432,  721,    0,  720,  425,
			  428,  430,  432,  433,  426,  427,  433,  721,    0,    0,
			  427,  433,    0,  426,    0,  428,    0,  721,  433,  429,
			    0,    0,  432,    0,  429,  430,    0,    0,  428,  431,
			  431,  431,  431,  431,  431,  721,  434,  430,  432,  434,
			  435,    0,    0,  435,  434,    0,  433,  429,  435,  436,
			  432,  434,  436,  430,  433,  435,    0,  436,  437,    0,
			  439,  437,  438,  439,  436,  438,  437,  726,  439,  730,

			  438,  730,    0,  437,  433,  439,    0,  438,  726,  434,
			  730,    0,  440,    0,    0,  440,    0,  434,  726,    0,
			  440,  435,    0,  438,    0,  440,    0,  440,    0,  439,
			  436,    0,  470,  470,  437,  470,  726,  434,  730,  437,
			    0,  439,    0,  438,  444,  444,  444,  444,  444,  444,
			    0,  438,    0,    0,    0,    0,  470,  439,    0,    0,
			    0,    0,  437,  440,  447,  447,  447,  447,  447,  447,
			  448,  448,  448,  448,  448,  448,  449,  449,  449,  449,
			  449,  449,  450,  450,  450,  450,  450,  450,  452,  452,
			  452,  452,  452,  452,  453,  453,  453,  453,  453,  453, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,  447,  452,  454,  454,  454,  454,  454,
			  454,  455,  455,  455,  455,  455,  455,  456,  456,  456,
			  456,  456,  456,    0,    0,    0,    0,  452,  464,  464,
			    0,  464,  452,  457,  457,  457,  457,  457,  457,  465,
			  465,    0,  465,    0,  454,  459,  459,  459,  459,  459,
			  459,    0,  464,    0,    0,  460,  456,  460,  460,  460,
			  460,  460,  460,  465,  466,  466,    0,  466,    0,  467,
			  467,  465,  467,  468,  468,    0,  468,  469,  469,    0,
			  469,  471,  471,  464,  471,  741,  474,  474,  466,  474,
			    0,  473,  473,  467,  473,  475,  475,  468,  475,  465,

			  467,  469,  741,  466,  468,  471,  741,    0,    0,  469,
			  474,  476,  476,    0,  476,  473,    0,  474,  471,  475,
			    0,  469,    0,  473,  477,  477,    0,  477,  467,  727,
			  741,  466,  468,  478,  478,  476,  478,  469,    0,    0,
			  727,    0,    0,  476,    0,  474,  471,    0,  477,  469,
			  727,  473,  481,  481,    0,  481,    0,  478,  480,  480,
			  480,  480,  480,  480,    0,  478,    0,  477,  727,    0,
			    0,  476,    0,  480,    0,    0,  481,  482,  482,  482,
			  482,  482,  482,    0,    0,  484,  484,  484,  484,  484,
			  484,  486,  486,  478,  486,  477,    0,  481,    0,    0,

			    0,  480,    0,    0,    0,  482,    0,  484,  488,  488,
			    0,  488,    0,  487,  487,  486,  487,  523,  523,  523,
			  523,  523,  523,  486,  490,  490,  490,  490,  490,  490,
			  490,    0,  488,  482,  483,  484,  483,  487,  483,  483,
			  483,  483,  483,  483,    0,  487,  538,  538,  488,  538,
			    0,  486,    0,  483,  540,  540,    0,  540,    0,  499,
			  483,    0,  499,    0,    0,    0,  483,  499,    0,  500,
			  538,    0,  500,  487,  499,    0,  488,  500,  540,    0,
			    0,  483,    0,    0,  500,    0,    0,    0,  483,  735,
			  735,  735,  735,  735,  483,  493,  493,  493,  493,  493,

			  493,  493,  495,  495,  495,  495,  495,  495,  495,  502,
			  499,  502,  502,  502,  502,  502,  502,    0,  503,  504,
			  500,  503,  504,    0,  500,    0,  503,  504,  505,  506,
			    0,  505,  506,  503,  504,    0,  505,  506,  508,  507,
			    0,  508,  507,  505,  506,    0,  508,  507,  502,    0,
			  503,    0,    0,  508,  507,    0,    0,    0,  504,  505,
			  506,  514,    0,  514,  514,  514,  514,  514,  514,  503,
			  504,  507,  528,  528,  528,  528,  528,  528,  503,  505,
			  506,  543,  543,  507,  543,    0,  504,  505,  506,  508,
			  507,    0,  509,  510,    0,  509,  510,    0,    0,  507,

			  509,  510,    0,    0,    0,  543,    0,  509,  510,  511,
			    0,  507,  511,  512,  742,  515,  512,  511,  515,  516,
			    0,  512,  516,  515,  511,  510,    0,  516,  512,  509,
			  515,  742,    0,  517,  516,  742,  517,    0,    0,    0,
			  511,  517,    0,  509,  510,    0,  518,  515,  517,  518,
			    0,    0,    0,  510,  518,    0,    0,  509,    0,  742,
			  511,  518,  516,    0,  512,  517,  515,    0,  511,    0,
			  516,  519,    0,  520,  519,  515,  520,    0,  518,  519,
			    0,  520,    0,    0,  517,    0,  519,    0,  520,    0,
			  516,    0,    0,  517,    0,    0,    0,  518,  521,    0,

			    0,  521,    0,  519,    0,    0,  518,    0,    0,    0,
			  521,    0,  521,  520,  521,  521,  521,  521,  521,  521,
			    0,  521,  519,  525,  520,  525,  525,  525,  525,  525,
			  525,  519,  526,  526,  526,  526,  526,  526,    0,    0,
			    0,  520,  527,  527,  527,  527,  527,  527,  526,    0,
			    0,  521,  529,  529,  529,  529,  529,  529,    0,    0,
			    0,    0,  525,  531,  531,  531,  531,  531,  531,  532,
			  532,  532,  532,  532,  532,    0,  526,  537,  537,    0,
			  537,  527,  533,  533,  533,  533,  533,  533,  536,  536,
			  536,  536,  536,  536,  539,  539,    0,  539,    0,  541,

			  541,  537,  541,    0,  536,  537,  542,  542,    0,  542,
			  544,  544,    0,  544,  546,  546,    0,  546,  539,    0,
			    0,    0,  539,  541,  547,  547,    0,  547,    0,    0,
			  542,  541,  536,  537,  544,    0,  548,  548,  546,  548,
			  549,  549,    0,  549,    0,  542,  568,  544,  547,  568,
			  539,    0,  550,  550,  568,  550,  547,    0,  546,  541,
			  548,  568,    0,    0,  549,  564,  564,  564,  564,  564,
			  564,    0,  549,  542,    0,  544,  550,    0,  554,  554,
			  548,  554,    0,  550,  547,  551,  546,  551,    0,  551,
			  551,  551,  551,  551,  551,  555,  555,  568,  555,    0,

			  549,    0,  554,    0,  551,    0,  556,  556,  548,  556,
			  559,  550,  559,  559,  559,  559,  559,  559,  559,  555,
			  561,    0,  561,  561,  561,  561,  561,  561,  561,    0,
			  556,    0,  551,  597,  597,    0,  597,  556,  555,  562,
			    0,  562,  562,  562,  562,  562,  562,  562,  565,  559,
			    0,  565,    0,    0,    0,    0,  565,  597,    0,  561,
			    0,  598,  598,  565,  598,  556,  555,  566,  566,  566,
			  566,  566,  566,    0,  569,    0,  565,  569,  562,    0,
			  570,    0,  569,  570,    0,  598,    0,    0,  570,  569,
			  571,  598,    0,  571,    0,  570,    0,    0,  571,  565,

			  572,    0,  569,  572,  565,  571,  573,    0,  572,  573,
			  595,  595,    0,  595,  573,  572,    0,    0,    0,  598,
			  575,  573,  571,  575,    0,  569,    0,    0,  575,  574,
			  569,  570,  574,    0,  595,  575,    0,  574,    0,  572,
			  576,  571,    0,  576,  574,    0,  577,    0,  576,  577,
			  571,  572,    0,  595,  577,  576,    0,  573,    0,    0,
			  580,  577,    0,  580,  575,    0,  574,  572,  580,    0,
			  578,  575,  576,  578,  579,  580,    0,  579,  578,    0,
			  574,  595,  579,  599,  599,  578,  599,    0,    0,  579,
			  577,  576,  575,  581,  574,  582,  581,  577,  582,    0,

			  576,  581,  578,  582,    0,  579,    0,  599,  581,    0,
			  582,  580,  583,  583,  583,  583,  583,  583,  577,    0,
			    0,  578,    0,    0,    0,  579,  582,    0,    0,    0,
			  578,    0,    0,  579,    0,    0,  581,  584,  584,  584,
			  584,  584,  584,  586,  581,  586,  582,    0,  586,  586,
			  586,  586,  586,  586,  582,  587,  587,  587,  587,  587,
			  587,    0,    0,    0,  581,  588,  588,  588,  588,  588,
			  588,  590,  590,  590,  590,  590,  590,  592,  592,  592,
			  592,  592,  592,  593,  593,  593,  593,  593,  593,  596,
			  596,    0,  596,    0,  587,  594,  594,  594,  594,  594, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  594,  601,  601,    0,  601,  602,  602,    0,  602,  603,
			  603,  594,  603,  596,  604,  604,    0,  604,  605,  605,
			    0,  605,    0,    0,    0,  601,  596,  607,  607,  602,
			  607,    0,    0,  603,  594,    0,    0,    0,  604,  594,
			  608,  608,  605,  608,    0,    0,    0,  615,    0,    0,
			  615,  607,    0,  604,  596,  615,    0,    0,    0,  607,
			    0,    0,  615,  614,  608,  614,  614,  614,  614,  614,
			  614,  616,  608,  616,  616,  616,  616,  616,  616,    0,
			  617,  604,    0,  617,    0,    0,  618,  607,  617,  618,
			  615,    0,    0,    0,  618,  617,  619,    0,  615,  619,

			  608,  618,  614,    0,  619,  620,  621,    0,  620,  621,
			  616,  619,    0,  620,  621,    0,    0,  617,  615,  622,
			  620,  621,  622,    0,    0,  623,  619,  622,  623,  644,
			  644,  617,  644,  623,  622,  624,  625,  618,  624,  625,
			  623,    0,    0,  624,  625,  617,    0,  619,    0,    0,
			  624,  625,  626,  644,  619,  626,  620,  621,  627,    0,
			  626,  627,    0,    0,    0,    0,  627,  626,    0,    0,
			  622,    0,    0,  627,  624,  628,  623,  628,  628,  628,
			  628,  628,  628,    0,  626,    0,  624,  625,    0,    0,
			  627,  629,  629,  629,  629,  629,  629,    0,    0,    0,

			    0,    0,  624,  626,    0,    0,    0,    0,    0,  627,
			  668,  668,  626,  668,  628,    0,    0,    0,  627,  630,
			  630,  630,  630,  630,  630,  631,  631,  631,  631,  631,
			  631,  632,    0,  632,  668,    0,  632,  632,  632,  632,
			  632,  632,  634,  634,  634,  634,  634,  634,  636,  636,
			  636,  636,  636,  636,  637,  637,    0,  637,  638,  638,
			    0,  638,    0,    0,  636,  639,  639,    0,  639,  641,
			  641,    0,  641,  651,  643,  643,  651,  643,  637,    0,
			    0,  651,  638,    0,  637,    0,    0,  636,  651,  639,
			    0,    0,  636,  641,  638,    0,    0,  639,  643,  641,

			    0,    0,    0,  651,    0,  643,  649,  649,  649,  649,
			  649,  649,  637,  652,    0,  653,  652,    0,  653,    0,
			    0,  652,  638,  653,  651,  639,    0,  641,  652,  654,
			  653,  651,  654,  643,    0,    0,    0,  654,  655,    0,
			  656,  655,  678,  656,  654,  678,  655,  653,  656,  652,
			  678,    0,    0,  655,    0,  656,    0,  678,    0,  654,
			    0,    0,    0,    0,  652,    0,  653,    0,    0,  655,
			  671,  671,    0,  671,    0,  653,    0,  652,    0,    0,
			  654,  658,  658,  658,  658,  658,  658,  654,    0,  655,
			    0,  656,    0,  678,  671,    0,    0,  655,  659,  659,

			  659,  659,  659,  659,  660,  660,  660,  660,  660,  660,
			  661,  661,  661,  661,  661,  661,  662,  662,  662,  662,
			  662,  662,  663,  663,  663,  663,  663,  663,  665,  665,
			  665,  665,  665,  665,    0,  666,  666,  659,  666,  667,
			  667,    0,  667,    0,  665,  669,  669,    0,  669,  674,
			  674,  675,  674,  675,  675,  675,  675,  675,  675,  666,
			    0,  687,  687,  667,  687,    0,    0,  665,  676,  669,
			  666,  676,  665,  674,    0,    0,  676,  669,  677,  679,
			    0,  677,  679,  676,  667,  687,  677,  679,    0,  680,
			  675,    0,  680,  677,  679,    0,    0,  680,  666,    0,

			    0,    0,    0,  676,  680,  669,    0,    0,    0,    0,
			  687,  679,  667,  681,  681,  681,  681,  681,  681,  676,
			    0,    0,    0,  677,    0,  688,  688,    0,  688,  677,
			  679,  676,  683,  683,  683,  683,  683,  683,  687,  679,
			  680,  685,  685,  685,  685,  685,  685,    0,  684,  688,
			  684,  677,  681,  684,  684,  684,  684,  684,  684,  686,
			  686,    0,  686,  692,  693,  694,  692,  693,  694,  688,
			    0,  692,  693,  694,    0,    0,    0,    0,  692,  693,
			  694,  697,  697,  686,  697,    0,    0,  684,    0,    0,
			    0,  686,    0,  698,  698,  692,  698,  688,  696,  696,

			  696,  696,  696,  696,    0,  697,    0,  699,  699,  694,
			  699,    0,    0,  693,  692,  693,  694,  698,    0,  686,
			    0,  702,    0,  692,  702,  703,  697,  704,  703,  702,
			  704,  699,    0,  703,    0,  704,  702,  694,    0,    0,
			  703,  693,  704,  705,  705,  705,  705,  705,  705,  707,
			  707,    0,  707,    0,  697,  706,  706,  706,  706,  706,
			  706,    0,  710,    0,    0,  710,  702,    0,  712,  712,
			  710,  712,  702,  707,    0,    0,  703,  710,  704,    0,
			  715,    0,    0,  715,  719,  719,    0,  719,  715,    0,
			    0,    0,  712,    0,  702,  715,    0,    0,  707,  716,

			  716,  716,  716,  716,  716,    0,    0,    0,  719,  712,
			    0,  710,    0,  710,  722,  728,  719,  722,  728,    0,
			    0,  715,  722,  728,  725,  725,  707,  725,    0,  722,
			  728,  715,    0,    0,    0,    0,    0,  712,    0,  710,
			    0,    0,    0,    0,  719,    0,  722,    0,  725,  715,
			  723,  723,  723,  723,  723,  723,  724,  724,  724,  724,
			  724,  724,    0,    0,    0,  722,  728,  729,  729,  729,
			  729,  729,  729,    0,  722,  733,  733,  733,  733,  733,
			  733,  734,  734,  734,  734,  734,  734,  739,  739,  739,
			  739,  739,  739,  740,  740,  740,  740,  740,  740,  743,

			  743,  743,  743,  743,  743,  747,  747,  747,  747,  747,
			  747,  748,  748,  748,  748,  748,  748,  749,  749,  749,
			  749,  749,  749,  751,  751,  751,  751,  751,  751,  752,
			    0,  752,    0,    0,  752,  752,  752,  752,  752,  752,
			  753,  753,  753,  753,  753,  753,  754,  754,  754,  754,
			  754,  754,  762,  762,  762,  762,  762,  762,  762,  787,
			  787,  787,  787,  787,  787,  787,    0,    0,  752,  756,
			  756,  756,  756,  756,  756,  756,  756,  756,  756,  756,
			  756,  756,  756,  756,  756,  756,  756,  756,  756,  756,
			  756,  756,  756,  756,  756,  757,  757,  757,  757,  757,

			  757,  757,  757,  757,  757,  757,  757,  757,  757,  757,
			  757,  757,  757,  757,  757,  757,  757,  757,  757,  757,
			  757,  758,  758,  758,  758,  758,  758,  758,  758,  758,
			  758,  758,  758,  758,  758,  758,  758,  758,  758,  758,
			  758,  758,  758,  758,  758,  758,  758,  759,  759,  759,
			  759,  759,  759,  759,  759,  759,  759,  759,  759,  759,
			  759,  759,  759,  759,  759,  759,  759,  759,  759,  759,
			  759,  759,  759,  760,  760,    0,  760,  760,  760,  760,
			  760,  760,  760,  760,  760,  760,  760,  760,  760,  760,
			  760,  760,  760,  760,    0,  760,  760,  760,  760,  761, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  761,    0,  761,  761,  761,  761,  761,  761,  761,  761,
			  761,  761,  761,  761,  761,  761,  761,  761,  761,  761,
			  761,  761,  761,  761,  761,  764,  764,  764,    0,    0,
			    0,    0,    0,  764,  764,  764,    0,  764,  764,  764,
			  764,  764,  764,  764,    0,    0,  764,  764,  764,  765,
			  765,    0,  765,    0,  765,  765,    0,    0,  765,  765,
			  765,  765,  765,  765,  765,    0,    0,  765,  765,  765,
			  766,  766,    0,  766,  766,  766,  766,  766,  766,  766,
			  766,  766,  766,  766,  766,  766,  766,  766,  766,  766,
			  766,  766,  766,  766,  766,  766,  767,    0,  767,  767,

			    0,    0,    0,  767,  767,  767,    0,    0,  767,  767,
			  767,  767,  767,  767,  767,  767,    0,  767,  767,  767,
			  768,  768,    0,  768,  768,  768,  768,  768,  768,  768,
			  768,  768,  768,  768,  768,  768,  768,  768,  768,  768,
			  768,    0,  768,  768,  768,  768,  769,  769,  769,  769,
			  769,  769,  769,  769,  769,  769,  769,  769,  769,  769,
			  769,  769,  769,  769,  769,  769,  769,  769,  769,  769,
			  769,  769,  770,  770,  770,  770,  770,  770,  770,  770,
			  770,  770,  770,  770,  770,  770,  770,  770,  770,  770,
			  770,  770,  770,  770,  770,  770,  770,  770,  771,  771,

			  771,  771,  771,  771,  771,  771,  771,  771,  771,  771,
			  771,  771,  771,  771,  771,  771,  771,  771,  771,  771,
			  771,  771,  771,  771,  772,  772,  772,  772,  772,  772,
			  772,  772,  772,  772,  772,  772,  772,  772,  772,  772,
			  772,  772,  772,  772,  772,  772,  772,  772,  772,  772,
			  773,    0,  773,    0,    0,    0,  773,    0,  773,  773,
			    0,    0,  773,  773,  773,  773,  773,  773,  773,    0,
			    0,  773,  773,  773,  774,  774,    0,  774,  774,  774,
			  774,  774,  774,  774,  774,  774,  774,  774,  774,  774,
			  774,  774,  774,  774,  774,  774,  774,  774,  774,  774,

			  775,    0,    0,    0,  775,  775,    0,    0,  775,  775,
			  775,  775,  775,  775,  775,    0,    0,  775,  775,  775,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  777,  777,  777,    0,
			    0,  777,  777,  777,  777,  777,  777,  777,  777,    0,
			  777,  777,  777,  778,    0,    0,  778,  778,  778,  778,
			  778,  778,  778,  778,  778,  778,  778,    0,    0,  778,
			  778,  778,  780,  780,  780,  780,  780,  780,  780,  780,
			    0,  780,  780,  780,  780,  780,  780,  780,  780,  780,

			  780,  780,  780,  780,  780,  780,  780,  780,  781,  781,
			  781,  781,  781,  781,  781,  781,  781,  781,  781,  781,
			  781,  781,  781,  781,  781,  781,  781,  781,  781,  781,
			  781,  781,  781,  781,  782,  782,  782,    0,    0,    0,
			    0,    0,    0,    0,    0,  782,  782,  782,  782,  782,
			  782,  782,  782,    0,    0,    0,    0,    0,  782,  783,
			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,
			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,
			  783,  783,  783,  783,  783,  784,  784,  784,  784,  784,
			  784,  784,  784,  784,  784,  784,  784,  784,  784,  784,

			  784,  784,  784,  784,  784,  784,  784,  784,  784,  784,
			  784,  785,  785,  785,    0,    0,  785,  785,  785,  785,
			  785,  785,  785,  785,    0,  785,  785,  785,  786,  786,
			  786,  786,  786,  786,  786,  786,  786,  786,  786,  786,
			  786,  786,  786,  786,  786,  786,  786,  786,  786,  786,
			  786,  786,  786,  786,  788,    0,    0,    0,  788,  788,
			    0,    0,  788,  788,  788,  788,  788,  788,  788,    0,
			    0,  788,  788,  788,  755,  755,  755,  755,  755,  755,
			  755,  755,  755,  755,  755,  755,  755,  755,  755,  755,
			  755,  755,  755,  755,  755,  755,  755,  755,  755,  755,

			  755,  755,  755,  755,  755,  755,  755,  755,  755,  755,
			  755,  755,  755,  755,  755,  755,  755,  755,  755,  755,
			  755,  755,  755,  755,  755,  755,  755,  755,  755,  755,
			  755,  755,  755,  755,  755,  755,  755,  755,  755,  755,
			  755,  755,  755,  755,  755,  755,  755,  755,  755,  755,
			  755,  755,  755,  755,  755,  755,  755,  755,  755,  755,
			  755,  755,  755,  755,  755, yy_Dummy>>,
			1, 665, 5000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   88,   93,   75,   77,   69,   70,   99,
			  103,  183,    0, 1025, 5574,  105, 1020,  992, 1010, 5574,
			   84,    0, 5574, 5574, 5574, 5574,  989,  101,  972,  260,
			  270, 5574, 5574,  954, 5574,  947, 5574,  293,  110,  299,
			  130,  304,  309,  318,  344,  370,  375,  384,  456,  389,
			  444,  401,  430,   79, 5574, 5574,  916,  481,  335,  521,
			  397,  537,  547,  556,  589,  565,  609,  622,  623,  426,
			  636,  654,  948, 5574, 5574,  955,  158, 5574,   96,  280,
			  268,  354,  324,  444,  117, 5574,   94,  288,   71,  732,
			 5574, 5574,  292,  937,  922,  859, 5574,  138,  928,  672,

			  567,  162,  914, 5574,  901, 5574,  897,    0,  731,  893,
			  896,  882,  681, 5574,  260,  401,  768,  698,  774,  789,
			 5574, 5574,  499,  560,    0,  605,  796,  814,  818,  822,
			  826,  667,  834,  852,  856,  706,  871,  881,  900,  885,
			  907,  913,  918,  811,  969,  933,  944, 1047,  961,  977,
			 1010,  966, 1036,  922, 1055,  950,  865,  424,  261,  103,
			  823, 5574,  298,  860,    0,  875, 1078, 1080, 1084,  804,
			 1103, 1122, 1138, 1124, 1144, 1176, 1182, 1201, 1207, 1221,
			 1211, 1265, 1242, 1246, 1292, 1296, 1298, 1302, 1320, 1329,
			 1331, 1318, 5574,  858, 5574,  506, 5574, 5574,  658,  564,

			  674,  749, 1026,  388, 5574,  808,  502,  376,  801,  438,
			  797, 5574,  370, 1403, 5574, 5574,  821, 1155, 5574,  463,
			  751,  815,  810, 1380,  153, 1354,  739, 1405,  163, 1485,
			  313, 5574, 5574, 5574,  722, 1394,  719,  716,  701,  676,
			 1231,  510, 5574, 1443, 1405, 1449,  667,  600, 1460, 1497,
			 1514, 1528, 1374, 1503, 5574,  633, 1550, 1555, 1362, 1575,
			 1585, 1589, 1593, 1597, 1602, 1611, 1627,  605, 1636, 1647,
			 1656, 1663, 1667, 1676, 1685, 5574, 1678, 1707, 1737, 1746,
			 1768, 1777, 1786, 1796, 1798, 1820, 1715, 1824, 1829, 1842,
			 1836, 1846, 1855, 1872, 1880,  619, 1902, 1914, 1921,  335,

			 5574,  515, 1944, 1945, 1900,  559, 1946, 1967, 1965, 1969,
			 1991, 2000, 2002, 2024, 2030, 2040, 2049, 2068, 2106, 2086,
			 2084, 2128, 2130, 2146, 2148, 2150, 2152, 2183, 2204, 2214,
			 1089,  326, 1156,  456, 1207, 1259, 1373,  282, 5574,  557,
			 1166, 5574, 2218, 2228,  600, 1619, 5574,  689,  721,  599,
			 5574, 5574, 2241, 5574, 5574, 5574, 5574, 5574,  781, 2042,
			 2256, 2152,  524, 2266, 2276, 2296, 2282, 2302, 2308, 2321,
			 2327, 2333,  550, 2355, 2359, 2364, 2368, 1987, 1885, 2372,
			 2377, 2381, 2386, 1003, 2416, 2399, 2266, 2424, 2436, 2453,
			 2445, 2509, 2432, 2502, 2515, 2576, 2465, 2492, 2532, 2585,

			 1955, 2468, 1011, 2554, 2608, 2612, 2617, 2621,  541,  529,
			 2609, 2647,  674, 2656, 2669,  101,  493, 2693, 2695, 2630,
			 2704, 2715, 2717, 2735, 2737, 2754, 2781, 2782, 2792, 2801,
			 2814, 2841, 2815, 2831, 2864, 2868, 2877, 2886, 2890, 2888,
			 2910, 5574, 2753,  578, 2926,  596, 5574, 2946, 2952, 2958,
			 2964,  516, 2970, 2976, 2987, 2993, 2999, 3015,  518, 3027,
			 3039, 1691,  580, 2657, 3026, 3037, 3062, 3067, 3071, 3075,
			 2930, 3079,  482, 3089, 3084, 3093, 3109, 3122, 3131, 5574,
			 3140, 3150, 3159, 3220, 3167, 2042, 3189, 3211, 3206, 2139,
			 3206, 5574,  734, 3277, 5574, 3284, 5574,  102,  436, 3257,

			 3267,  409, 3293, 3316, 3317, 3326, 3327, 3337, 3336, 3390,
			 3391, 3407, 3411,  472, 3345, 3413, 3417, 3431, 3444, 3469,
			 3471, 3496,  423, 3199,  581, 3507, 3514, 3524, 3354, 3534,
			  412, 3545, 3551, 3564, 1716, 5574, 3570, 3575, 3244, 3592,
			 3252, 3597, 3604, 3379, 3608,  961, 3612, 3622, 3634, 3638,
			 3650, 3671, 5574,  436, 3676, 3693, 3704, 2188, 2532, 3694,
			  840, 3704, 3723,  429, 3647, 3746, 3749,  423, 3644, 3772,
			 3778, 3788, 3798, 3804, 3827, 3818, 3838, 3844, 3868, 3872,
			 3858, 3891, 3893, 3894, 3919,  419, 3930, 3937, 3947,  807,
			 3953,  366, 3959, 3965, 3977, 3808, 3987, 3731, 3759, 3881,

			  981, 3999, 4003, 4007, 4012, 4016, 1560, 4025, 4038,  361,
			  359,    0,  344,  628, 4047, 4045, 4055, 4078, 4084, 4094,
			 4103, 4104, 4117, 4123, 4133, 4134, 4150, 4156, 4159, 4173,
			 4201, 4207, 4218, 1455, 4224, 1762, 4230, 4252, 4256, 4263,
			 5574, 4267, 1597, 4272, 4127, 1823, 1866,  337,  611, 4288,
			  309, 4271, 4311, 4313, 4327, 4336, 4338,  267, 4363, 4380,
			 4386, 4392, 4398, 4404, 5574, 4410, 4433, 4437, 4208, 4443,
			 5574, 4368, 1868, 2512, 4447, 4435, 4466, 4476, 4340, 4477,
			 4487, 4495,  263, 4514, 4535, 4523, 4557, 4459, 4523,  311,
			 5574, 5574, 4561, 4562, 4563, 1132, 4580, 4579, 4591, 4605,

			  893,  938, 4619, 4623, 4625, 4625, 4637, 4647, 1208, 1324,
			 4660, 1692, 4666,  130,  117, 4678, 4681, 2483, 5574, 4682,
			 2760, 2797, 4712, 4732, 4738, 4722, 2868, 3100, 4713, 4749,
			 2886,  115,   92, 4757, 4763, 3271, 5574, 2349, 2385, 4769,
			 4775, 3056, 3385, 4781, 2128, 5574, 5574, 4787, 4793, 4799,
			 5574, 4805, 4816, 4822, 4828, 5574, 4868, 4894, 4920, 4946,
			 4972, 4998, 4838, 2000, 5023, 5044, 5069, 5094, 5119, 5145,
			 5171, 5197, 5223, 5248, 5273, 5294, 5319, 5337, 5356, 1165,
			 5381, 5407, 5432, 5458, 5484, 5502, 5527, 4845, 5548, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  755,    1,  756,  756,  757,  757,  758,  758,  759,
			  759,  755,   11,  755,  755,  755,  755,  755,  760,  755,
			  761,  762,  755,  755,  755,  755,  755,  755,  763,  755,
			  755,  755,  755,  755,  755,  755,  755,  764,  764,  764,
			  764,  764,  764,  764,  764,  764,  764,  764,  764,  764,
			  764,  764,  764,  765,  755,  755,  766,  767,  767,  767,
			  767,  767,  767,  767,  767,  767,  767,  767,  767,   64,
			  767,  767,  755,  755,  755,  768,  755,  755,  755,  768,
			  768,  768,  768,  768,  769,  755,  770,  769,  771,  772,
			  755,  755,  755,  755,  755,  755,  755,  773,  755,  773,

			  773,  755,  755,  755,  760,  755,  774,  774,  774,  775,
			  776,  755,  755,  755,  777,  755,  755,  755,  755,  755,
			  755,  755,  755,  764,  778,  764,  764,  764,  764,  764,
			  764,  764,  764,  764,  764,  764,  764,  764,  764,  764,
			  764,  764,  764,  755,   48,  764,  764,  764,  764,   48,
			  764,  764,  764,  764,  764,  764,  765,  765,  765,  765,
			  766,  755,  755,  755,  779,  767,  767,  767,  767,  755,
			  767,  767,  767,  767,  767,  767,  767,  767,  767,  767,
			  767,  767,  767,  767,  767,  767,  767,  767,  767,  767,
			  767,  767,  755,  768,  755,  755,  755,  755,  768,  768,

			  768,  768,  768,  769,  755,  780,  769,  770,  781,  770,
			  780,  755,  771,  772,  755,  755,  213,  782,  755,  755,
			  755,  755,  783,  755,  773,  773,  755,  755,  755,  784,
			  755,  755,  755,  755,  755,  755,  755,  755,  755,  755,
			  755,  755,  755,  755,  755,  755,  763,  755,  755,  755,
			  755,  755,  755,  755,  755,  778,  764,  764,  764,  764,
			  764,  764,  764,  764,  764,  764,  764,  755,  764,  764,
			  764,  764,  764,  764,  764,  755,  755,  764,  764,  764,
			  764,  764,  147,  147,  147,  764,  764,  764,  764,  764,
			  764,  764,  764,  764,  764,  755,  765,  765,  765,  765,

			  755,  785,  767,  767,  767,  755,  767,  767,  767,  767,
			  767,  767,  767,  767,  767,  767,  767,  767,  767,  767,
			  767,  767,  767,  767,  767,  767,  767,  767,  767,  767,
			  768,  768,  768,  768,  768,  768,  768,  780,  755,  781,
			  782,  755,  755,  755,  786,  786,  755,  786,  786,  786,
			  755,  755,  755,  755,  755,  755,  755,  755,  755,  755,
			  755,  755,  755,  755,  755,  755,  755,  755,  755,  755,
			  755,  755,  778,  764,  764,  764,  764,  764,  764,  764,
			  764,  764,  764,  755,  764,  764,  764,  764,  764,  764,
			  755,  144,  147,  391,  391,  764,  144,  755,  395,  395,

			  764,  764,  755,  764,  764,  764,  764,  764,  755,  765,
			  765,  765,  765,  765,  765,  765,  755,  767,  767,  755,
			  767,  767,  767,  767,  767,  767,  767,  767,  767,  767,
			  767,  755,  767,  767,  767,  767,  767,  767,  767,  767,
			  767,  755,  755,  755,  755,  755,  755,  755,  755,  755,
			  755,  755,  755,  755,  755,  755,  755,  755,  755,  755,
			  755,  755,  755,  764,  764,  764,  764,  764,  764,  764,
			  764,  764,  755,  764,  764,  764,  764,  764,  764,  755,
			  395,  764,  755,  395,  483,  755,  764,  764,  764,  755,
			  765,  755,  755,  765,  755,  765,  755,  765,  755,  767,

			  767,  755,  755,  767,  767,  767,  767,  767,  767,  767,
			  767,  767,  767,  755,  755,  767,  767,  767,  767,  767,
			  767,  755,  755,  755,  755,  755,  755,  755,  755,  755,
			  755,  755,  755,  755,  755,  755,  755,  764,  764,  764,
			  764,  764,  764,  764,  764,  755,  764,  764,  764,  764,
			  764,  395,  755,  755,  764,  764,  764,  755,  755,  765,
			  755,  765,  765,  765,  755,  767,  755,  755,  767,  767,
			  767,  767,  767,  767,  767,  767,  767,  767,  767,  767,
			  767,  767,  767,  755,  755,  755,  755,  755,  755,  755,
			  755,  755,  755,  755,  755,  764,  764,  764,  764,  764,

			  755,  764,  764,  764,  764,  764,  755,  764,  764,  755,
			  755,  787,  755,  755,  755,  767,  755,  767,  767,  767,
			  767,  767,  767,  767,  767,  767,  767,  767,  755,  755,
			  755,  755,  755,  755,  755,  755,  755,  764,  764,  764,
			  755,  764,  755,  764,  764,  755,  755,  788,  755,  755,
			  755,  767,  767,  767,  767,  767,  767,  755,  755,  755,
			  755,  755,  755,  755,  755,  755,  764,  764,  764,  764,
			  755,  764,  755,  755,  755,  755,  767,  767,  767,  767,
			  767,  755,  755,  755,  755,  755,  764,  764,  764,  755,
			  755,  755,  767,  767,  767,  755,  755,  764,  764,  764,

			  755,  755,  767,  767,  767,  755,  755,  764,  755,  755,
			  767,  755,  764,  755,  755,  767,  755,  755,  755,  764,
			  755,  755,  767,  755,  755,  764,  755,  755,  767,  755,
			  755,  755,  755,  755,  755,  755,  755,  755,  755,  755,
			  755,  755,  755,  755,  755,  755,  755,  755,  755,  755,
			  755,  755,  755,  755,  755,    0,  755,  755,  755,  755,
			  755,  755,  755,  755,  755,  755,  755,  755,  755,  755,
			  755,  755,  755,  755,  755,  755,  755,  755,  755,  755,
			  755,  755,  755,  755,  755,  755,  755,  755,  755, yy_Dummy>>)
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
			   69,   70,   71,   72,   73,   74,   75,   76,   64,   77,
			   78,   79,   64,   80,   81,   82,    1,    1,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,    1,    1,   86,   86,   86,   86,   86,   86,

			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   87,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   89,   90,   90,   90,   90,   90,   90,   90,    1,    1,
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
			   23,   23,   23,   23,   23,   23,   23,   23,   24,   25,
			    1,    1,   26,    1,    1,    1,    1,    1,    1,    1,
			    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,  108,  108,    0,    0,    0,
			    0,    0,    0,  139,  137,    1,    2,   15,  121,   18,
			  137,   16,   17,    7,    6,   13,    5,   11,    8,  113,
			  113,   14,   12,   28,   10,   29,   19,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,   86,  101,
			  101,  101,  101,   21,   30,   22,    9,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,   23,   20,   24,  125,  126,  127,  128,  125,
			  125,  125,  125,  125,  108,  111,  138,  108,  138,  138,
			  100,   70,   70,   67,   70,   70,   77,   77,   74,   77,

			   77,    1,    2,   27,  121,  120,  135,  135,  135,    0,
			    3,   32,  119,   31,  105,    0,    0,  113,    0,  113,
			   26,   25,    0,  101,   95,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,   39,    0,  101,   94,   94,   85,   94,   94,
			  101,  101,  101,  101,  101,  101,    0,    0,    0,    0,
			    0,  112,    0,    0,    0,  104,  104,  104,  104,    0,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,   39,  104,  104,  104,  104,
			  104,  104,  107,  125,  127,  126,  123,  122,  124,  125,

			  125,  125,  125,  108,  111,    0,  108,    0,    0,    0,
			  109,  110,    0,    0,  100,   98,   98,    0,   99,    0,
			    0,   67,    0,    0,    0,    0,   74,    0,   73,    0,
			   72,   76,  135,  129,  135,  135,  135,  135,  135,  135,
			    0,    4,   33,  119,    0,    0,    0,    0,    0,  115,
			    0,  113,    0,    0,   95,    0,  101,  101,   38,  101,
			  101,  101,  101,  101,  101,  101,  101,    0,  101,  101,
			  101,  101,   41,  101,  101,   93,    0,   86,   87,   86,
			   86,   86,   94,  101,   94,   94,   94,  101,  101,  101,
			  101,  101,  101,   40,  101,    0,    0,    0,    0,    0,

			  103,  106,  104,  104,   38,    0,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,   62,   62,  104,
			   41,  104,  104,  104,  104,  104,  104,  104,   40,  104,
			  125,  125,  125,  125,  125,  125,  125,    0,  109,  110,
			    0,   68,    0,    0,    0,    0,   75,   73,   72,   76,
			  133,  136,  136,  134,  130,  131,  132,   96,  119,    0,
			  119,    0,    0,    0,  115,    0,    0,    0,  118,  113,
			    0,    0,  102,  101,  101,  101,  101,  101,   37,  101,
			  101,  101,  101,    0,  101,  101,  101,  101,  101,  101,
			    0,  101,   85,  101,  101,  101,  101,    0,   85,   85,

			   85,   36,    0,   43,  101,  101,  101,  101,   71,    0,
			    0,    0,    0,    0,    0,    0,    0,  104,  104,    0,
			  104,  104,  104,   37,  104,  104,  104,  104,  104,  104,
			  104,    0,  104,  104,  104,   36,   43,  104,  104,  104,
			  104,  110,    0,   66,    0,   65,   69,  119,    0,    0,
			    0,  114,  115,    0,  116,    0,  118,    0,    0,    0,
			  113,   82,    0,   57,  101,  101,  101,  101,  101,  101,
			   44,  101,    0,  101,  101,   35,  101,  101,  101,   87,
			   87,   86,    0,  101,  101,    0,  101,  101,  101,    0,
			    0,   63,    0,    0,   61,    0,   60,    0,    0,   57,

			  104,    0,    0,  104,  104,  104,  104,  104,   44,  104,
			  104,  104,   35,   62,   62,  104,  104,  104,  104,  104,
			  104,    0,  119,    0,    0,    0,  115,  116,    0,    0,
			  118,    0,    0,    0,    0,   82,    0,  101,   58,  101,
			   59,  101,  101,   46,  101,    0,  101,  101,  101,  101,
			  101,  101,   85,    0,   52,  101,  101,    0,    0,    0,
			    0,    0,    0,    0,    0,  104,    0,    0,   58,  104,
			   59,  104,  104,   46,  104,  104,  104,  104,  104,  104,
			   52,  104,  104,    0,    0,  105,    0,  116,    0,  119,
			    0,   84,    0,    0,  117,  101,  101,   56,  101,   45,

			    0,   42,   55,   34,  101,   50,    0,  101,  101,    0,
			    0,    0,    0,    0,    0,  104,    0,  104,   56,  104,
			   45,   42,   55,   34,  104,   50,  104,  104,    0,    0,
			  116,    0,    0,    0,    0,   81,  117,  101,  101,  101,
			   90,  101,    0,  101,   53,    0,    0,    0,   64,    0,
			  106,  104,  104,  104,  104,  104,   53,  118,    0,  118,
			    0,    0,    0,    0,   81,  117,  101,  101,   47,  101,
			   89,   51,    0,    0,    0,    0,  104,  104,   47,  104,
			   51,  118,   83,    0,   81,  117,  101,  101,  101,   88,
			   88,   97,  104,  104,  104,    0,    0,  101,   49,   48,

			    0,    0,  104,   49,   48,    0,    0,  101,    0,    0,
			  104,   80,  101,    0,    0,  104,    0,    0,   80,  101,
			    0,    0,  104,    0,    0,   54,    0,    0,   54,    0,
			   79,    0,    0,    0,    0,    0,   79,    0,    0,    0,
			    0,    0,    0,    0,   78,   91,   92,    0,    0,    0,
			   78,    0,   78,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 5574
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 755
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 756
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

	yyNb_rules: INTEGER = 138
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 139
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
