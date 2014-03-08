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
last_token := SYM_ALLOW_ARCHETYPE
else
--|#line 184 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 184")
end
last_token := SYM_INCLUDE
end
else
--|#line 186 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 186")
end
last_token := SYM_EXCLUDE
end
else
if yy_act = 57 then
--|#line 188 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 188")
end
last_token := SYM_AFTER
else
--|#line 190 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 190")
end
last_token := SYM_BEFORE
end
end
else
if yy_act <= 60 then
if yy_act = 59 then
--|#line 192 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 192")
end
last_token := SYM_CLOSED
else
--|#line 196 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 196")
end

		last_token := V_ROOT_ID_CODE
		last_string_value := text_substring (2, text_count - 1)

end
else
if yy_act = 61 then
--|#line 202 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 202")
end

		last_token := V_ID_CODE
		last_string_value := text_substring (2, text_count - 1)

else
--|#line 209 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 209")
end

		last_token := V_ID_CODE_STR
		last_string_value := text

end
end
end
else
if yy_act <= 66 then
if yy_act <= 64 then
if yy_act = 63 then
--|#line 218 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 218")
end

		str_ := text_substring (2, text_count - 1)
		last_string_value := str_.substring (str_.substring_index ("::", 1) + 2, str_.count)
		last_token := V_REUSED_ID_CODE

else
--|#line 226 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 226")
end

		last_token := V_VALUE_SET_REF
		last_string_value := text_substring (2, text_count - 1)

end
else
if yy_act = 65 then
--|#line 242 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 242")
end

		set_start_condition (IN_EXPANDED_VALUE_SET_DEF)
		create last_term_constraint_parse_structure_value.make
		str_ := text_substring (2, text_count)
		last_term_constraint_parse_structure_value.set_terminology_id (str_.substring (1, str_.index_of (':', 1)-1))
		is_assumed_code := False

else
--|#line 251 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 251")
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
--|#line 266 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 266")
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
--|#line 281 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 281")
end
in_lineno := in_lineno + text_count
end
else
if yy_act = 69 then
--|#line 284 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 284")
end
in_lineno := in_lineno + 1
else
--|#line 286 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 286")
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
--|#line 309 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 309")
end
	-- Catch-all rules (no backing up)
			last_token := ERR_VALUE_SET_DEF
			set_start_condition (INITIAL)

else
--|#line 319 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 319")
end

		last_token := ERR_VALUE_SET_MISSING_CODES
		err_str := text

end
else
--|#line 335 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 335")
end

		set_start_condition (IN_EXTERNAL_VALUE_SET_DEF)
		create last_term_constraint_parse_structure_value.make
		str_ := text_substring (2, text_count)
		last_term_constraint_parse_structure_value.set_terminology_id (str_.substring (1, str_.index_of (':', 1)-1))
		is_assumed_code := False

end
else
if yy_act = 74 then
--|#line 344 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 344")
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

else
--|#line 359 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 359")
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

end
end
else
if yy_act <= 77 then
if yy_act = 76 then
--|#line 374 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 374")
end
in_lineno := in_lineno + text_count
else
--|#line 377 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 377")
end
in_lineno := in_lineno + 1
end
else
if yy_act = 78 then
--|#line 379 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 379")
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

else
--|#line 402 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 402")
end
	-- Catch-all rules (no backing up)
			last_token := ERR_VALUE_SET_DEF
			set_start_condition (INITIAL)

end
end
end
else
if yy_act <= 84 then
if yy_act <= 82 then
if yy_act <= 81 then
if yy_act = 80 then
--|#line 411 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 411")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text

else
--|#line 412 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 412")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text

end
else
--|#line 413 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 413")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text

end
else
if yy_act = 83 then
--|#line 420 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 420")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text

else
--|#line 421 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 421")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text

end
end
else
if yy_act <= 86 then
if yy_act = 85 then
--|#line 428 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 428")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text

else
--|#line 429 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 429")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text

end
else
if yy_act = 87 then
--|#line 436 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 436")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text

else
--|#line 437 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 437")
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
--|#line 444 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 444")
end

				last_token := V_ISO8601_DURATION
				last_string_value := convert_non_conforming_duration(text)

else
--|#line 456 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 456")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text

end
else
--|#line 466 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 466")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text_substring(2, text_count)

end
else
if yy_act = 92 then
--|#line 471 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 471")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text

else
--|#line 481 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 481")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
				last_string_value.put('T', last_string_value.index_of(' ', 1))

end
end
else
if yy_act <= 95 then
if yy_act = 94 then
--|#line 487 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 487")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text

else
--|#line 498 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 498")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN_ERR
				unread_character(last_string_value.item(last_string_value.count)) -- put back the last character
				last_string_value := text

end
else
if yy_act = 96 then
--|#line 507 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 507")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text

else
--|#line 523 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 523")
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
--|#line 530 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 530")
end
	-- match a pattern like '(Type_Identifier) whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)

else
--|#line 536 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 536")
end
	-- match a pattern like '["at0004"] = (Type_Identifier)  <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)

end
else
if yy_act = 100 then
--|#line 542 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 542")
end
 -- match up to next > not followed by a '}' or '>'
 				in_buffer.append_string (text)

else
--|#line 546 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 546")
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
--|#line 588 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 588")
end
 -- match up to next '}' not preceded by a '>'
 				in_buffer.append_string (text)

else
--|#line 598 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 598")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text

end
else
if yy_act = 104 then
--|#line 604 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 604")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text

else
--|#line 610 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 610")
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
--|#line 617 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 617")
end

			last_token := V_ATTRIBUTE_IDENTIFIER
			last_string_value := text

else
--|#line 623 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 623")
end
		-- matches an absolute path string with segments of form "/attr_name" or "/attr_name[id-code]"
			last_token := V_ABS_PATH
			last_string_value := text

end
else
--|#line 629 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 629")
end
		-- matches a relative path string with segments of form "/attr_name" or "/attr_name[id-code]"
			last_token := V_REL_PATH
			last_string_value := text

end
else
if yy_act = 109 then
--|#line 635 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 635")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')

else
--|#line 642 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 642")
end
 		-- match segment consisting of non / or [
				in_buffer.append_string (text)

end
end
else
if yy_act <= 112 then
if yy_act = 111 then
--|#line 646 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 646")
end
 		-- match [] segment
				in_buffer.append_string (text)

else
--|#line 650 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 650")
end
 		-- match segment ending in quoted slashes '\/'
				in_buffer.append_string (text)

end
else
if yy_act = 113 then
--|#line 654 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 654")
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
--|#line 666 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 666")
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
--|#line 673 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 673")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer

else
--|#line 678 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 678")
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
--|#line 693 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 693")
end

						last_token := V_REAL
						last_real_value := text.to_real

end
else
if yy_act = 118 then
--|#line 694 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 694")
end

						last_token := V_REAL
						last_real_value := text.to_real

else
--|#line 698 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 698")
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
--|#line 699 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 699")
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
--|#line 700 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 700")
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
--|#line 720 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 720")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)

else
--|#line 725 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 725")
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
--|#line 733 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 733")
end
in_buffer.append_character ('\')
else
--|#line 735 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 735")
end
in_buffer.append_character ('"')
end
else
--|#line 737 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 737")
end

				in_buffer.append_string (text)

end
else
if yy_act = 127 then
--|#line 741 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 741")
end
in_buffer.append_string (text)
else
--|#line 743 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 743")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')

end
end
else
if yy_act <= 130 then
if yy_act = 129 then
--|#line 748 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 748")
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
--|#line 759 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 759")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)

end
else
if yy_act = 131 then
--|#line 768 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 768")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
--|#line 770 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 770")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
end
end
else
if yy_act <= 136 then
if yy_act <= 134 then
if yy_act = 133 then
--|#line 771 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 771")
end
last_token := V_CHARACTER; last_character_value := '%R'
else
--|#line 772 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 772")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 135 then
--|#line 773 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 773")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 774 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 774")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 138 then
if yy_act = 137 then
--|#line 776 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 776")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 777 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 777")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 139 then
--|#line 781 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 781")
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
			create an_array.make_filled (0, 0, 5703)
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
			  101,  208,  122,  122,   94,  122,  746,  111,   94,  112,
			  112,  112,  112,  112,  112,  295,  295,  295,   86,   87,
			   86,   87,  122,  122,  204,  122,  124,  157,  108,  745,
			  224,  729,   78,  224,  128,  158,  159,   78,  209,  210,
			  197,   90,   90,  214,  728,  224,  124,   95,  224,  498,
			  195,   95,  195,  195,  101,  228,  101,  101,  228,  564,
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
			  698,  122,  122,  247,  122,  230,  703,  118,  230,  124,
			  122,  122,  298,  122,  694,  124,  529,  118,  125,  129,
			  124,  194,  126,  194,  127,  124,  337,  162,  130,  133,
			  162,  205,  206,  131,  124,  163,  122,  122,  164,  122,
			  220,  134,  164,  199,  132,  135,  125,  129,  704,  295,
			  126,  194,  127,  198,  198,  198,  130,  133,  675,  170,
			  124,  131,  122,  122,  649,  122,  647,  122,  122,  134,
			  122,  646,  132,  135,  136,  137,  122,  122,  169,  122,
			  138,  122,  122,  208,  122,  415,  124,  170,  213,  162,

			  139,  124,  162,  122,  122,  204,  122,  163,  201,  201,
			  124,  199,  136,  137,  164,  124,  141,  140,  138,  248,
			  248,  248,  248,  248,  248,  567,  150,  124,  139,  142,
			  209,  210,  122,  122,  151,  122,  634,  200,  200,  200,
			  246,  205,  206,  154,  141,  140,  122,  122,  295,  122,
			  169,  194,  214,  164,  150,  339,  124,  142,  122,  122,
			  613,  122,  151,  194,  568,  219,  165,  188,  219,  607,
			  124,  154,  189,  143,  144,  144,  144,  144,  144,  144,
			  457,  155,  124,  162,  296,  152,  162,  165,  448,  145,
			  153,  163,  209,  210,  165,  188,  146,  431,  164,  297,

			  189,  122,  122,  147,  122,  148,  565,  149,  195,  155,
			  195,  195,  241,  152,  241,  241,  166,  145,  153,  211,
			  167,  220,  168,  162,  146,  254,  162,  202,  202,  202,
			  546,  163,  164,  148,  169,  149,  533,  533,  164,  162,
			  201,  201,  162,  408,  166,  491,  408,  163,  167,  162,
			  168,  171,  162,  295,  164,  205,  206,  163,  162,  115,
			  172,  162,  122,  122,  164,  122,  163,  162,  416,  227,
			  162,  194,  227,  164,  169,  163,  173,  175,  499,  171,
			  443,  228,  164,  443,  492,  372,  124,  174,  172,  176,
			  169,  162,  230,  177,  162,  182,  490,  585,  445,  163,

			  169,  445,  537,  450,  173,  175,  164,  122,  122,  169,
			  122,  162,  346,  346,  162,  174,  338,  176,  169,  163,
			  419,  177,  231,  182,  162,  162,  164,  162,  162,  178,
			  179,  124,  163,  163,  383,  180,  586,  408,  162,  164,
			  164,  162,  169,  118,  650,  383,  163,  198,  198,  198,
			  181,  183,  256,  164,  184,  383,  162,  178,  179,  162,
			  186,  372,  169,  180,  163,  194,  362,  185,  187,  122,
			  122,  164,  122,  383,  227,  169,  169,  227,  190,  183,
			  256,  194,  184,  651,  763,  356,  228,  229,  186,  169,
			  494,  347,  346,  124,  347,  185,  187,  230,  295,  243,

			  243,  243,  243,  243,  243,  191,  190,  169,  122,  122,
			  355,  122,  115,  262,  116,  244,  251,  251,  251,  251,
			  251,  251,  252,  348,  346,  354,  348,  231,  353,  495,
			  267,  350,  124,  191,  216,  216,  493,  216,  245,  493,
			  234,  262,  226,  244,  330,  331,  332,  333,  334,  235,
			  235,  235,  235,  235,  235,  118,  194,  198,  198,  198,
			  217,  561,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  236,  249,  249,  249,  249,
			  249,  249,  253,  253,  253,  253,  253,  253,  122,  122,

			  237,  122,  250,  115,  238,  116,  239,  251,  251,  251,
			  251,  251,  251,  341,  218,  244,  122,  122,  221,  122,
			  122,  122,  124,  122,  122,  122,  715,  122,  122,  122,
			  250,  122,  335,  335,  335,  257,  122,  122,  245,  122,
			  124,  633,  561,  244,  124,  561,  118,  258,  124,  223,
			  612,  763,  124,  259,  122,  122,  337,  122,  122,  122,
			  124,  122,  338,  257,  366,  716,  263,  260,  261,  633,
			  337,  194,  264,  122,  122,  258,  122,  162,  124,  305,
			  162,  259,  124,  122,  122,  163,  122,  122,  122,  300,
			  122,  265,  164,  161,  263,  260,  261,  124,  295,  275,

			  264,  266,  122,  122,  242,  122,  241,  124,  240,  122,
			  122,  124,  122,  269,  268,  122,  122,  233,  122,  265,
			  122,  122,  713,  122,  122,  122,  124,  122,  169,  266,
			  713,  105,  271,  124,  102,  122,  122,  226,  122,  124,
			  223,  269,  268,  713,  124,  273,  122,  122,  124,  122,
			  143,  274,  122,  122,  272,  122,  292,  270,  713,  124,
			  271,  143,  222,  122,  122,  221,  122,  714,  122,  122,
			  124,  122,  194,  273,  192,  714,  124,  145,  143,  274,
			  282,  161,  272,  276,  292,  276,  763,  124,  714,  121,
			  601,  282,  124,  148,  145,  123,  123,  123,  123,  123, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  123,  294,  277,  714,  120,  145,  278,  601,  282,  279,
			  641,  601,  122,  122,  289,  122,  123,  113,  280,  110,
			  281,  148,  145,  105,  282,  103,  102,  641,  123,  294,
			  277,  641,  472,  194,  278,  601,  124,  279,  122,  122,
			  485,  122,  289,  472,  287,  763,  280,  288,  281,  122,
			  122,  485,  122,  472,  763,  641,  123,  122,  122,  763,
			  122,  485,  124,  763,  143,  283,  283,  283,  283,  283,
			  283,  472,  287,  124,  290,  288,  763,  763,  291,  485,
			  162,  124,  162,  162,  284,  162,  162,  285,  163,  162,
			  163,  763,  763,  286,  163,  164,  194,  164,  763,  763,

			  293,  164,  290,  763,  763,  162,  291,  763,  162,  336,
			  336,  336,  284,  163,  763,  285,  763,  304,  763,  303,
			  164,  286,  763,  763,  162,  302,  162,  162,  293,  162,
			  763,  169,  163,  169,  163,  763,  763,  169,  306,  164,
			  162,  164,  763,  162,  763,  304,  162,  303,  163,  162,
			  710,  710,  710,  302,  163,  164,  169,  340,  340,  763,
			  340,  164,  763,  194,  763,  763,  306,  307,  340,  340,
			  309,  340,  198,  198,  198,  169,  310,  169,  162,  763,
			  308,  162,  311,  217,  162,  763,  163,  162,  301,  301,
			  301,  169,  163,  164,  763,  307,  763,  169,  309,  164,

			  763,  763,  763,  162,  310,  763,  162,  763,  308,  162,
			  311,  163,  162,  162,  194,  312,  162,  163,  164,  763,
			  763,  163,  763,  162,  164,  267,  162,  313,  164,  169,
			  763,  163,  763,  240,  240,  169,  240,  720,  164,  200,
			  200,  200,  763,  312,  162,  720,  763,  162,  162,  763,
			  314,  162,  163,  315,  169,  313,  163,  357,  720,  164,
			  169,  763,  763,  164,  169,  763,  194,  162,  316,  763,
			  162,  763,  763,  720,  169,  163,  763,  763,  314,  763,
			  763,  315,  164,  317,  318,  318,  318,  318,  318,  319,
			  202,  202,  202,  320,  162,  169,  763,  162,  162,  169,

			  162,  162,  163,  162,  162,  763,  163,  162,  163,  164,
			  763,  763,  163,  164,  763,  164,  763,  319,  169,  164,
			  162,  320,  162,  162,  321,  162,  763,  763,  163,  322,
			  163,  162,  323,  162,  162,  164,  162,  164,  763,  163,
			  763,  163,  198,  198,  198,  169,  164,  763,  164,  169,
			  324,  169,  321,  721,  763,  169,  227,  322,  325,  227,
			  323,  721,  326,  327,  122,  122,  763,  122,  228,  329,
			  763,  169,  763,  169,  721,  763,  328,  763,  324,  230,
			  194,  763,  169,  763,  169,  763,  325,  763,  124,  721,
			  326,  327,  370,  370,  370,  370,  370,  329,  342,  343,

			  343,  343,  343,  343,  328,  216,  216,  227,  216,  231,
			  227,  351,  352,  352,  352,  352,  352,  352,  359,  228,
			  359,  763,  763,  360,  360,  360,  360,  360,  360,  763,
			  230,  217,  763,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  198,  198,  198,  763,
			  231,  358,  358,  358,  358,  358,  358,  361,  361,  361,
			  361,  361,  361,  661,  661,  661,  661,  244,  363,  363,
			  363,  363,  363,  363,  763,  218,  344,  345,  346,  344,
			  345,  344,  344,  344,  344,  344,  344,  344,  344,  347,

			  245,  763,  344,  763,  763,  244,  763,  763,  763,  344,
			  348,  344,  344,  344,  344,  364,  364,  364,  364,  364,
			  364,  371,  371,  371,  371,  371,  371,  367,  763,  367,
			  763,  365,  368,  368,  368,  368,  368,  368,  344,  344,
			  349,  344,  115,  763,  116,  763,  369,  369,  369,  369,
			  369,  369,  122,  122,  366,  122,  763,  122,  122,  365,
			  122,  763,  763,  763,  763,  344,  344,  344,  344,  344,
			  344,  344,  344,  344,  344,  344,  124,  122,  122,  763,
			  122,  124,  763,  763,  373,  118,  763,  122,  122,  643,
			  122,  122,  122,  763,  122,  122,  122,  374,  122,  122,

			  122,  124,  122,  763,  122,  122,  643,  122,  763,  763,
			  643,  124,  373,  122,  122,  124,  122,  375,  376,  124,
			  763,  345,  346,  124,  345,  374,  671,  378,  124,  122,
			  122,  763,  122,  347,  643,  377,  379,  124,  122,  122,
			  763,  122,  763,  671,  348,  375,  376,  671,  380,  122,
			  122,  763,  122,  124,  763,  378,  763,  381,  122,  122,
			  763,  122,  124,  377,  379,  122,  122,  763,  122,  122,
			  122,  671,  122,  124,  349,  384,  380,  763,  122,  122,
			  763,  122,  124,  763,  382,  381,  385,  122,  122,  124,
			  122,  763,  763,  124,  386,  387,  390,  390,  390,  390,

			  390,  390,  124,  384,  534,  724,  534,  724,  763,  122,
			  122,  124,  122,  763,  385,  535,  725,  122,  122,  389,
			  122,  763,  386,  387,  388,  391,  391,  391,  391,  391,
			  391,  763,  143,  124,  594,  594,  594,  594,  594,  122,
			  122,  124,  122,  536,  726,  763,  763,  389,  122,  122,
			  763,  122,  388,  763,  392,  393,  393,  393,  393,  393,
			  393,  763,  763,  124,  394,  394,  394,  394,  394,  394,
			  122,  122,  124,  122,  763,  663,  664,  663,  664,  122,
			  122,  763,  122,  763,  763,  763,  395,  395,  395,  395,
			  395,  395,  763,  392,  124,  396,  396,  396,  396,  396,

			  396,  763,  763,  124,  123,  123,  123,  123,  123,  123,
			  397,  763,  397,  763,  665,  392,  123,  123,  123,  123,
			  123,  123,  122,  122,  392,  122,  122,  122,  763,  122,
			  763,  122,  122,  398,  122,  123,  399,  143,  122,  122,
			  763,  122,  400,  763,  122,  122,  124,  122,  122,  122,
			  124,  122,  673,  402,  763,  124,  673,  122,  122,  763,
			  122,  398,  124,  123,  399,  401,  286,  763,  124,  763,
			  400,  763,  124,  673,  122,  122,  403,  122,  763,  763,
			  404,  124,  122,  122,  673,  122,  763,  122,  122,  763,
			  122,  405,  763,  401,  286,  674,  763,  691,  124,  674,

			  763,  691,  162,  763,  403,  162,  124,  763,  404,  763,
			  163,  124,  406,  763,  763,  763,  674,  164,  691,  405,
			  409,  410,  410,  410,  410,  410,  295,  674,  763,  691,
			  411,  407,  411,  411,  411,  411,  411,  411,  295,  412,
			  413,  414,  414,  414,  414,  295,  162,  162,  162,  162,
			  162,  162,  763,  169,  163,  163,  163,  122,  122,  407,
			  122,  164,  164,  164,  763,  763,  763,  162,  763,  162,
			  162,  162,  162,  763,  162,  163,  763,  163,  417,  163,
			  763,  124,  164,  763,  164,  763,  164,  418,  420,  122,
			  122,  763,  122,  162,  763,  763,  162,  169,  169,  169, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  421,  163,  162,  423,  162,  162,  417,  162,  164,  114,
			  163,  422,  163,  124,  763,  418,  420,  164,  169,  164,
			  169,  467,  169,  114,  114,  114,  162,  763,  421,  162,
			  424,  423,  162,  763,  163,  162,  763,  763,  763,  422,
			  163,  164,  162,  763,  169,  162,  425,  164,  426,  467,
			  163,  162,  763,  169,  162,  169,  763,  164,  424,  163,
			  360,  360,  360,  360,  360,  360,  164,  763,  763,  428,
			  162,  554,  763,  162,  425,  763,  426,  169,  163,  429,
			  763,  427,  554,  169,  431,  164,  162,  430,  162,  162,
			  763,  162,  554,  169,  163,  763,  163,  428,  763,  763,

			  763,  164,  169,  164,  763,  763,  763,  429,  162,  763,
			  554,  162,  763,  763,  763,  430,  163,  763,  432,  763,
			  763,  169,  431,  164,  318,  318,  318,  318,  318,  318,
			  162,  649,  162,  162,  649,  162,  763,  169,  163,  169,
			  163,  756,  757,  756,  757,  164,  432,  164,  162,  763,
			  162,  162,  162,  162,  162,  162,  163,  162,  163,  169,
			  163,  763,  163,  164,  434,  164,  763,  164,  558,  164,
			  449,  449,  449,  449,  449,  449,  433,  763,  763,  558,
			  758,  169,  436,  169,  490,  162,  763,  435,  162,  559,
			  763,  763,  434,  163,  437,  676,  763,  438,  763,  169,

			  164,  169,  763,  169,  433,  169,  162,  558,  763,  162,
			  436,  763,  763,  763,  163,  435,  162,  610,  763,  162,
			  442,  164,  437,  442,  163,  438,  763,  763,  610,  763,
			  442,  164,  443,  442,  444,  763,  169,  763,  611,  763,
			  439,  763,  443,  445,  444,  763,  343,  343,  343,  343,
			  343,  343,  763,  445,  763,  763,  610,  169,  351,  352,
			  352,  352,  352,  352,  352,  440,  763,  169,  122,  122,
			  763,  122,  763,  446,  447,  447,  447,  447,  447,  447,
			  763,  763,  763,  446,  451,  451,  451,  451,  451,  451,
			  763,  763,  124,  440,  452,  452,  452,  452,  452,  452,

			  455,  455,  455,  455,  455,  455,  763,  475,  763,  453,
			  365,  453,  763,  448,  454,  454,  454,  454,  454,  454,
			  368,  368,  368,  368,  368,  368,  456,  456,  456,  456,
			  456,  456,  763,  366,  763,  475,  458,  459,  365,  460,
			  460,  460,  460,  460,  460,  461,  461,  461,  461,  461,
			  461,  462,  462,  462,  462,  462,  462,  122,  122,  763,
			  122,  122,  122,  763,  122,  457,  122,  122,  763,  122,
			  122,  122,  763,  122,  122,  122,  763,  122,  749,  122,
			  122,  124,  122,  122,  122,  124,  122,  763,  122,  122,
			  124,  122,  763,  763,  124,  749,  763,  763,  124,  749,

			  463,  122,  122,  124,  122,  763,  466,  124,  464,  465,
			  763,  763,  124,  763,  750,  470,  471,  763,  122,  122,
			  468,  122,  763,  749,  469,  124,  122,  122,  463,  122,
			  763,  750,  763,  763,  466,  750,  464,  465,  122,  122,
			  763,  122,  124,  470,  471,  763,  763,  474,  468,  763,
			  124,  763,  469,  763,  473,  122,  122,  763,  122,  750,
			  763,  476,  124,  390,  390,  390,  390,  390,  390,  123,
			  122,  122,  123,  122,  763,  474,  763,  763,  123,  124,
			  763,  477,  473,  396,  396,  396,  396,  396,  396,  476,
			  763,  479,  763,  763,  124,  763,  763,  123,  478,  763,

			  123,  732,  732,  732,  732,  732,  123,  763,  763,  477,
			  482,  482,  482,  482,  482,  482,  123,  763,  763,  479,
			  393,  393,  393,  393,  393,  393,  478,  391,  391,  391,
			  391,  391,  391,  394,  394,  394,  394,  394,  394,  123,
			  763,  692,  123,  763,  123,  692,  763,  763,  277,  480,
			  483,  483,  483,  483,  483,  483,  122,  122,  123,  122,
			  123,  611,  692,  763,  280,  123,  763,  123,  763,  763,
			  123,  763,  611,  692,  763,  763,  277,  480,  122,  122,
			  124,  122,  611,  763,  763,  763,  123,  763,  123,  763,
			  763,  763,  280,  123,  395,  395,  395,  395,  395,  395,

			  611,  763,  124,  484,  484,  484,  484,  484,  484,  481,
			  122,  122,  763,  122,  122,  122,  763,  122,  123,  122,
			  122,  763,  122,  122,  122,  491,  122,  410,  410,  410,
			  410,  410,  410,  295,  124,  763,  489,  481,  124,  763,
			  763,  763,  763,  124,  763,  487,  123,  124,  502,  503,
			  503,  503,  503,  503,  763,  763,  486,  763,  488,  122,
			  122,  763,  122,  411,  492,  411,  411,  411,  411,  411,
			  411,  295,  496,  487,  414,  414,  414,  414,  414,  414,
			  295,  763,  763,  124,  486,  494,  488,  414,  414,  414,
			  414,  414,  414,  295,  763,  162,  763,  162,  162,  763,

			  162,  763,  493,  163,  763,  163,  162,  763,  763,  162,
			  164,  497,  164,  763,  163,  763,  763,  162,  763,  162,
			  162,  164,  162,  763,  495,  163,  763,  163,  763,  763,
			  763,  763,  164,  763,  164,  763,  763,  162,  500,  162,
			  162,  763,  162,  763,  501,  163,  169,  163,  169,  504,
			  763,  506,  164,  505,  164,  442,  162,  169,  442,  162,
			  763,  763,  763,  763,  163,  763,  500,  443,  169,  763,
			  169,  164,  501,  763,  763,  763,  763,  504,  445,  506,
			  763,  505,  763,  162,  162,  507,  162,  162,  169,  734,
			  169,  163,  163,  763,  162,  763,  763,  162,  164,  164,

			  734,  508,  163,  162,  763,  763,  162,  169,  446,  164,
			  734,  163,  510,  507,  763,  509,  162,  162,  164,  162,
			  162,  763,  763,  763,  163,  163,  735,  763,  734,  508,
			  511,  164,  164,  162,  169,  169,  162,  735,  763,  763,
			  510,  163,  763,  509,  763,  169,  763,  735,  164,  512,
			  763,  763,  516,  763,  169,  513,  763,  763,  511,  514,
			  515,  515,  515,  515,  515,  735,  162,  169,  169,  162,
			  162,  763,  763,  162,  163,  763,  517,  512,  163,  162,
			  516,  164,  162,  513,  169,  164,  763,  163,  162,  763,
			  162,  162,  162,  162,  164,  162,  163,  739,  163,  742,

			  163,  742,  763,  164,  517,  164,  763,  164,  739,  518,
			  743,  763,  162,  763,  763,  162,  763,  169,  739,  763,
			  163,  169,  763,  520,  763,  489,  763,  164,  763,  521,
			  169,  763,  122,  122,  519,  122,  739,  518,  744,  169,
			  763,  169,  763,  169,  342,  522,  522,  522,  522,  522,
			  763,  520,  763,  763,  763,  763,  124,  521,  763,  763,
			  763,  763,  519,  169,  523,  523,  523,  523,  523,  523,
			  524,  524,  524,  524,  524,  524,  358,  358,  358,  358,
			  358,  358,  525,  526,  526,  526,  526,  526,  527,  527,
			  527,  527,  527,  527,  454,  454,  454,  454,  454,  454, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  763,  763,  763,  448,  365,  528,  528,  528,  528,  528,
			  528,  530,  530,  530,  530,  530,  530,  531,  531,  531,
			  531,  531,  531,  763,  763,  763,  763,  366,  122,  122,
			  763,  122,  365,  532,  532,  532,  532,  532,  532,  122,
			  122,  763,  122,  763,  529,  527,  527,  527,  527,  527,
			  527,  763,  124,  763,  763,  459,  457,  460,  460,  460,
			  460,  460,  460,  124,  122,  122,  763,  122,  763,  122,
			  122,  539,  122,  122,  122,  763,  122,  122,  122,  763,
			  122,  122,  122,  538,  122,  753,  122,  122,  124,  122,
			  763,  122,  122,  124,  122,  122,  122,  124,  122,  539,

			  541,  124,  753,  540,  542,  124,  753,  763,  763,  543,
			  124,  122,  122,  763,  122,  124,  763,  548,  545,  124,
			  763,  544,  763,  547,  122,  122,  763,  122,  541,  740,
			  753,  540,  542,  122,  122,  124,  122,  543,  763,  763,
			  740,  763,  763,  549,  763,  548,  545,  763,  124,  544,
			  740,  547,  122,  122,  763,  122,  763,  124,  552,  552,
			  552,  552,  552,  552,  763,  551,  763,  550,  740,  763,
			  763,  549,  763,  123,  763,  763,  124,  482,  482,  482,
			  482,  482,  482,  763,  763,  484,  484,  484,  484,  484,
			  484,  122,  122,  551,  122,  550,  763,  392,  763,  763,

			  763,  123,  763,  763,  763,  553,  763,  123,  122,  122,
			  763,  122,  763,  122,  122,  124,  122,  584,  584,  584,
			  584,  584,  584,  555,  409,  560,  560,  560,  560,  560,
			  295,  763,  124,  553,  397,  123,  397,  124,  483,  483,
			  483,  483,  483,  483,  763,  556,  122,  122,  557,  122,
			  763,  555,  763,  123,  122,  122,  763,  122,  763,  162,
			  399,  763,  162,  763,  763,  763,  400,  163,  763,  162,
			  124,  763,  162,  556,  164,  763,  557,  163,  124,  763,
			  763,  123,  763,  763,  164,  763,  763,  763,  399,  748,
			  748,  748,  748,  748,  400,  412,  562,  562,  562,  562,

			  562,  295,  412,  563,  562,  562,  562,  562,  295,  567,
			  169,  503,  503,  503,  503,  503,  503,  763,  162,  162,
			  169,  162,  162,  763,  566,  763,  163,  163,  162,  162,
			  763,  162,  162,  164,  164,  763,  163,  163,  162,  162,
			  763,  162,  162,  164,  164,  763,  163,  163,  568,  763,
			  569,  763,  763,  164,  164,  763,  763,  763,  570,  571,
			  572,  431,  763,  515,  515,  515,  515,  515,  515,  169,
			  169,  573,  589,  589,  589,  589,  589,  589,  569,  169,
			  169,  122,  122,  574,  122,  763,  570,  571,  572,  169,
			  169,  763,  162,  162,  763,  162,  162,  763,  763,  573,

			  163,  163,  763,  763,  763,  124,  763,  164,  164,  162,
			  763,  574,  162,  162,  754,  162,  162,  163,  162,  162,
			  763,  163,  162,  163,  164,  576,  763,  163,  164,  575,
			  164,  754,  763,  162,  164,  754,  162,  763,  763,  763,
			  577,  163,  763,  169,  169,  763,  162,  578,  164,  162,
			  763,  763,  763,  576,  163,  763,  763,  575,  763,  754,
			  169,  164,  579,  763,  169,  580,  169,  763,  577,  763,
			  169,  162,  763,  162,  162,  578,  162,  763,  581,  163,
			  763,  163,  763,  763,  169,  763,  164,  763,  164,  763,
			  579,  763,  763,  580,  763,  763,  763,  169,  442,  763,

			  763,  442,  763,  582,  763,  763,  581,  763,  763,  763,
			  443,  763,  444,  583,  522,  522,  522,  522,  522,  522,
			  763,  445,  169,  585,  169,  526,  526,  526,  526,  526,
			  526,  582,  527,  527,  527,  527,  527,  527,  763,  763,
			  763,  583,  588,  588,  588,  588,  588,  588,  587,  763,
			  763,  446,  590,  590,  590,  590,  590,  590,  763,  763,
			  763,  763,  586,  591,  591,  591,  591,  591,  591,  592,
			  592,  592,  592,  592,  592,  763,  587,  122,  122,  763,
			  122,  529,  593,  593,  593,  593,  593,  593,  595,  595,
			  595,  595,  595,  595,  122,  122,  763,  122,  763,  122,

			  122,  124,  122,  763,  250,  596,  122,  122,  763,  122,
			  122,  122,  763,  122,  122,  122,  763,  122,  124,  763,
			  763,  763,  597,  124,  122,  122,  763,  122,  763,  763,
			  124,  598,  250,  596,  124,  763,  122,  122,  124,  122,
			  122,  122,  763,  122,  763,  599,  162,  600,  124,  162,
			  597,  763,  122,  122,  163,  122,  603,  763,  602,  598,
			  124,  164,  763,  763,  124,  614,  615,  615,  615,  615,
			  615,  763,  605,  599,  763,  600,  124,  763,  122,  122,
			  604,  122,  763,  606,  603,  276,  602,  276,  763,  552,
			  552,  552,  552,  552,  552,  122,  122,  169,  122,  763,

			  605,  763,  124,  763,  123,  763,  122,  122,  604,  122,
			  491,  606,  560,  560,  560,  560,  560,  560,  295,  124,
			  494,  763,  562,  562,  562,  562,  562,  562,  295,  763,
			  124,  763,  123,  122,  122,  763,  122,  609,  608,  496,
			  763,  562,  562,  562,  562,  562,  562,  295,  162,  492,
			  763,  162,  763,  763,  763,  763,  163,  124,  763,  495,
			  763,  122,  122,  164,  122,  609,  608,  502,  617,  617,
			  617,  617,  617,  763,  162,  763,  616,  162,  497,  763,
			  162,  763,  163,  162,  763,  124,  763,  763,  163,  164,
			  162,  640,  763,  162,  763,  164,  763,  763,  163,  169,

			  162,  763,  618,  162,  616,  164,  162,  763,  163,  162,
			  122,  122,  763,  122,  163,  164,  763,  763,  763,  640,
			  162,  164,  619,  162,  763,  169,  763,  763,  163,  162,
			  618,  169,  162,  763,  124,  164,  763,  163,  763,  620,
			  162,  169,  763,  162,  164,  763,  162,  763,  163,  162,
			  619,  169,  763,  638,  163,  164,  763,  169,  763,  763,
			  162,  164,  763,  162,  622,  763,  621,  620,  163,  763,
			  162,  169,  623,  162,  162,  164,  763,  162,  163,  763,
			  169,  638,  163,  122,  122,  164,  122,  763,  763,  164,
			  624,  169,  622,  162,  621,  162,  162,  169,  162,  763,

			  623,  163,  625,  163,  763,  626,  763,  124,  164,  763,
			  164,  169,  523,  523,  523,  523,  523,  523,  624,  763,
			  763,  169,  763,  763,  763,  169,  628,  763,  763,  763,
			  625,  763,  763,  626,  763,  763,  627,  525,  629,  629,
			  629,  629,  629,  630,  169,  630,  169,  763,  631,  631,
			  631,  631,  631,  631,  628,  631,  631,  631,  631,  631,
			  631,  763,  763,  763,  627,  632,  632,  632,  632,  632,
			  632,  531,  531,  531,  531,  531,  531,  635,  635,  635,
			  635,  635,  635,  636,  636,  636,  636,  636,  636,  122,
			  122,  763,  122,  763,  529,  637,  637,  637,  637,  637, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  637,  122,  122,  763,  122,  122,  122,  763,  122,  122,
			  122,  633,  122,  124,  122,  122,  763,  122,  122,  122,
			  763,  122,  763,  763,  763,  124,  639,  122,  122,  124,
			  122,  763,  763,  124,  366,  763,  763,  763,  124,  633,
			  122,  122,  124,  122,  763,  763,  763,  162,  763,  763,
			  162,  124,  763,  642,  639,  163,  763,  763,  763,  644,
			  763,  763,  164,  650,  124,  615,  615,  615,  615,  615,
			  615,  567,  645,  617,  617,  617,  617,  617,  617,  763,
			  162,  642,  763,  162,  763,  763,  162,  644,  163,  162,
			  652,  763,  763,  763,  163,  164,  162,  763,  169,  162,

			  645,  164,  651,  763,  163,  162,  162,  763,  162,  162,
			  568,  164,  763,  163,  163,  763,  763,  653,  652,  162,
			  164,  164,  162,  763,  763,  162,  654,  163,  162,  122,
			  122,  169,  122,  163,  164,  162,  162,  169,  162,  162,
			  164,  763,  763,  163,  163,  653,  763,  169,  763,  763,
			  164,  164,  162,  124,  654,  162,  169,  169,  162,  763,
			  163,  162,  763,  763,  763,  763,  163,  164,  763,  763,
			  169,  763,  763,  164,  655,  585,  169,  629,  629,  629,
			  629,  629,  629,  763,  656,  763,  169,  169,  763,  763,
			  657,  631,  631,  631,  631,  631,  631,  763,  763,  763,

			  763,  763,  655,  169,  763,  763,  763,  763,  763,  169,
			  122,  122,  656,  122,  586,  763,  763,  763,  657,  631,
			  631,  631,  631,  631,  631,  658,  658,  658,  658,  658,
			  658,  659,  763,  659,  124,  763,  660,  660,  660,  660,
			  660,  660,  662,  662,  662,  662,  662,  662,  666,  666,
			  666,  666,  666,  666,  122,  122,  763,  122,  122,  122,
			  763,  122,  763,  763,  633,  122,  122,  763,  122,  122,
			  122,  763,  122,  162,  122,  122,  162,  122,  124,  763,
			  763,  163,  124,  763,  667,  763,  763,  366,  164,  124,
			  763,  763,  633,  124,  668,  763,  763,  669,  124,  670,

			  763,  763,  763,  678,  763,  672,  614,  677,  677,  677,
			  677,  677,  667,  162,  763,  162,  162,  763,  162,  763,
			  763,  163,  668,  163,  169,  669,  763,  670,  164,  162,
			  164,  678,  162,  672,  763,  763,  763,  163,  162,  763,
			  162,  162,  162,  162,  164,  162,  163,  680,  163,  679,
			  163,  763,  763,  164,  763,  164,  763,  164,  763,  681,
			  763,  763,  763,  763,  169,  763,  169,  763,  763,  682,
			  122,  122,  763,  122,  763,  680,  763,  679,  763,  763,
			  169,  660,  660,  660,  660,  660,  660,  681,  763,  169,
			  763,  169,  763,  169,  124,  763,  763,  682,  683,  683,

			  683,  683,  683,  683,  684,  684,  684,  684,  684,  684,
			  536,  536,  536,  536,  536,  536,  685,  685,  685,  685,
			  685,  685,  686,  686,  686,  686,  686,  686,  687,  687,
			  687,  687,  687,  687,  763,  122,  122,  529,  122,  122,
			  122,  763,  122,  763,  633,  122,  122,  763,  122,  675,
			  675,  650,  675,  677,  677,  677,  677,  677,  677,  124,
			  763,  122,  122,  124,  122,  763,  763,  366,  162,  124,
			  688,  162,  633,  693,  763,  763,  163,  690,  162,  162,
			  763,  162,  162,  164,  689,  124,  163,  163,  763,  162,
			  651,  763,  162,  164,  164,  763,  763,  163,  688,  763,

			  763,  763,  763,  695,  164,  690,  763,  763,  763,  763,
			  701,  697,  689,  658,  658,  658,  658,  658,  658,  169,
			  763,  763,  763,  696,  763,  122,  122,  763,  122,  169,
			  169,  695,  699,  699,  699,  699,  699,  699,  701,  697,
			  169,  687,  687,  687,  687,  687,  687,  763,  663,  124,
			  663,  696,  529,  686,  686,  686,  686,  686,  686,  122,
			  122,  763,  122,  705,  706,  706,  706,  706,  706,  702,
			  162,  162,  763,  162,  162,  763,  763,  763,  163,  163,
			  763,  162,  763,  124,  162,  164,  164,  665,  763,  163,
			  763,  700,  122,  122,  763,  122,  164,  702,  763,  763,

			  763,  763,  707,  711,  711,  711,  711,  711,  711,  122,
			  122,  763,  122,  763,  122,  122,  124,  122,  763,  700,
			  708,  169,  169,  763,  763,  709,  763,  763,  763,  763,
			  707,  763,  169,  124,  763,  763,  763,  712,  124,  715,
			  763,  706,  706,  706,  706,  706,  706,  162,  708,  162,
			  162,  162,  162,  709,  162,  163,  763,  163,  763,  163,
			  763,  763,  164,  763,  164,  712,  164,  718,  718,  718,
			  718,  718,  718,  122,  122,  763,  122,  763,  716,  665,
			  665,  665,  665,  665,  665,  705,  722,  722,  722,  722,
			  722,  162,  717,  763,  162,  763,  763,  124,  169,  163,

			  169,  763,  169,  763,  122,  122,  164,  122,  715,  763,
			  722,  722,  722,  722,  722,  722,  162,  763,  763,  162,
			  717,  763,  719,  763,  163,  763,  763,  763,  124,  763,
			  763,  164,  731,  731,  731,  731,  731,  731,  122,  122,
			  723,  122,  169,  162,  763,  727,  162,  716,  763,  763,
			  719,  163,  763,  763,  763,  763,  162,  730,  164,  162,
			  122,  122,  124,  122,  163,  763,  763,  169,  723,  763,
			  733,  164,  763,  727,  763,  736,  737,  737,  737,  737,
			  737,  737,  763,  763,  124,  730,  738,  738,  738,  738,
			  738,  738,  763,  763,  169,  763,  763,  763,  733,  763,

			  763,  763,  763,  736,  763,  763,  763,  169,  741,  741,
			  741,  741,  741,  741,  726,  726,  726,  726,  726,  726,
			  747,  747,  747,  747,  747,  747,  751,  751,  751,  751,
			  751,  751,  752,  752,  752,  752,  752,  752,  755,  755,
			  755,  755,  755,  755,  744,  744,  744,  744,  744,  744,
			  759,  759,  759,  759,  759,  759,  760,  760,  760,  760,
			  760,  760,  761,  761,  761,  761,  761,  761,  756,  763,
			  756,  763,  763,  760,  760,  760,  760,  760,  760,  762,
			  762,  762,  762,  762,  762,  758,  758,  758,  758,  758,
			  758,  109,  109,  109,  109,  109,  109,  109,  648,  648,

			  648,  648,  648,  648,  648,  763,  763,  758,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   91,   91,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,   91,   91,   91, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			   91,   91,   91,   91,   91,   91,   91,   91,   91,   91,
			   91,   91,  104,  104,  763,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  763,  104,  104,  104,  104,  106,  106,
			  763,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  106,  106,  123,  123,  123,  763,  763,  763,
			  763,  763,  123,  123,  123,  763,  123,  123,  123,  123,
			  123,  123,  123,  763,  763,  123,  123,  123,  156,  156,
			  763,  156,  763,  156,  156,  763,  763,  156,  156,  156,

			  156,  156,  156,  156,  763,  763,  156,  156,  156,  160,
			  160,  763,  160,  160,  160,  160,  160,  160,  160,  160,
			  160,  160,  160,  160,  160,  160,  160,  160,  160,  160,
			  160,  160,  160,  160,  160,  165,  763,  165,  165,  763,
			  763,  763,  165,  165,  165,  763,  763,  165,  165,  165,
			  165,  165,  165,  165,  165,  763,  165,  165,  165,  193,
			  193,  763,  193,  193,  193,  193,  193,  193,  193,  193,
			  193,  193,  193,  193,  193,  193,  193,  193,  193,  193,
			  763,  193,  193,  193,  193,  203,  203,  203,  203,  203,
			  203,  203,  203,  203,  203,  203,  203,  203,  203,  203,

			  203,  203,  203,  203,  203,  203,  203,  203,  203,  203,
			  203,  207,  207,  207,  207,  207,  207,  207,  207,  207,
			  207,  207,  207,  207,  207,  207,  207,  207,  207,  207,
			  207,  207,  207,  207,  207,  207,  207,  212,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,
			  212,  212,  212,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  225,
			  763,  225,  763,  763,  763,  225,  763,  225,  225,  763,

			  763,  225,  225,  225,  225,  225,  225,  225,  763,  763,
			  225,  225,  225,  232,  232,  763,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  109,
			  763,  763,  763,  109,  109,  763,  763,  109,  109,  109,
			  109,  109,  109,  109,  763,  763,  109,  109,  109,  110,
			  110,  110,  110,  110,  110,  110,  110,  110,  110,  110,
			  110,  110,  110,  110,  110,  110,  110,  110,  110,  110,
			  110,  110,  110,  110,  110,  114,  114,  114,  763,  763,
			  114,  114,  114,  114,  114,  114,  114,  114,  763,  114,

			  114,  114,  255,  763,  763,  255,  255,  255,  255,  255,
			  255,  255,  255,  255,  255,  255,  763,  763,  255,  255,
			  255,  205,  205,  205,  205,  205,  205,  205,  205,  763,
			  205,  205,  205,  205,  205,  205,  205,  205,  205,  205,
			  205,  205,  205,  205,  205,  205,  205,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  218,  218,  218,  763,  763,  763,  763,
			  763,  763,  763,  763,  218,  218,  218,  218,  218,  218,
			  218,  218,  763,  763,  763,  763,  763,  218,  222,  222,

			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  229,  229,  229,  229,  229,  229,
			  301,  301,  301,  763,  763,  301,  301,  301,  301,  301,
			  301,  301,  301,  763,  301,  301,  301,  344,  344,  344,
			  344,  344,  344,  344,  344,  344,  344,  344,  344,  344,
			  344,  344,  344,  344,  344,  344,  344,  344,  344,  344,
			  344,  344,  344,  648,  763,  763,  763,  648,  648,  763,

			  763,  648,  648,  648,  648,  648,  648,  648,  763,  763,
			  648,  648,  648,   13,  763,  763,  763,  763,  763,  763,
			  763,  763,  763,  763,  763,  763,  763,  763,  763,  763,
			  763,  763,  763,  763,  763,  763,  763,  763,  763,  763,
			  763,  763,  763,  763,  763,  763,  763,  763,  763,  763,
			  763,  763,  763,  763,  763,  763,  763,  763,  763,  763,
			  763,  763,  763,  763,  763,  763,  763,  763,  763,  763,
			  763,  763,  763,  763,  763,  763,  763,  763,  763,  763,
			  763,  763,  763,  763,  763,  763,  763,  763,  763,  763,
			  763,  763,  763,  763,  763,  763,  763,  763,  763,  763,

			  763,  763,  763,  763, yy_Dummy>>,
			1, 704, 5000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 5703)
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
			   15,   86,   38,   38,    9,   38,  740,   27,   10,   27,
			   27,   27,   27,   27,   27,  415,  498,  159,    5,    5,
			    6,    6,   40,   40,   84,   40,   38,   53,   20,  739,
			   97,  721,    3,   97,   38,   53,   53,    4,   86,   86,
			   78,    7,    8,   88,  720,  224,   40,    9,  224,  415,
			   76,   10,   76,   76,  101,  228,  101,  101,  228,  498,
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
			  684,   42,   42,  114,   42,  230,  691,   29,  230,   37,
			   43,   43,  158,   43,  676,   39,  658,   30,   37,   39,
			   41,   82,   37,  331,   37,   42,  337,   58,   39,   42,
			   58,   87,   87,   41,   43,   58,   44,   44,  651,   44,
			   92,   42,   58,   80,   41,   43,   37,   39,  691,  299,
			   37,   81,   37,   79,   79,   79,   39,   42,  648,   58,
			   44,   41,   45,   45,  613,   45,  611,   46,   46,   42,
			   46,  610,   41,   43,   44,   44,   47,   47,   58,   47,
			   44,   49,   49,  207,   49,  299,   45,   58,  212,   60,

			   45,   46,   60,   51,   51,  203,   51,   60,   82,   82,
			   47,  331,   44,   44,   60,   49,   47,   46,   44,  115,
			  115,  115,  115,  115,  115,  502,   49,   51,   45,   47,
			  207,  207,   52,   52,   49,   52,  592,   81,   81,   81,
			  586,  203,  203,   51,   47,   46,   50,   50,  157,   50,
			   60,   83,  212,  568,   49,  209,   52,   47,   48,   48,
			  564,   48,   49,  333,  502,  219,   69,   69,  219,  554,
			   50,   51,   69,   48,   48,   48,   48,   48,   48,   48,
			  531,   52,   48,   57,  157,   50,   57,   69,  523,   48,
			   50,   57,  209,  209,   69,   69,   48,  514,   57,  157,

			   69,  122,  122,   48,  122,   48,  499,   48,  195,   52,
			  195,  195,  241,   50,  241,  241,   57,   48,   50,  206,
			   57,  219,   57,   59,   48,  122,   59,   83,   83,   83,
			  472,   59,  301,   48,   57,   48,  458,  458,   59,   61,
			  333,  333,   61,  408,   57,  409,  408,   61,   57,   62,
			   57,   59,   62,  409,   61,  206,  206,   62,   63,  451,
			   59,   63,  123,  123,   62,  123,   63,   65,  301,  100,
			   65,  199,  100,   63,   59,   65,   61,   62,  416,   59,
			  443,  100,   65,  443,  409,  372,  123,   61,   59,   62,
			   61,   64,  100,   63,   64,   65,  408,  525,  445,   64,

			   62,  445,  462,  362,   61,   62,   64,  125,  125,   63,
			  125,   66,  349,  344,   66,   61,  339,   62,   65,   66,
			  305,   63,  100,   65,   67,   68,   66,   67,   68,   64,
			   64,  125,   67,   68,  267,   64,  525,  295,   70,   67,
			   68,   70,   64,  462,  614,  267,   70,  199,  199,  199,
			   64,   66,  125,   70,   67,  267,   71,   64,   64,   71,
			   68,  255,   66,   64,   71,  198,  247,   67,   68,  131,
			  131,   71,  131,  267,   99,   67,   68,   99,   70,   66,
			  125,  200,   67,  614,  246,  239,   99,   99,   68,   70,
			  412,  347,  347,  131,  347,   67,   68,   99,  412,  112,

			  112,  112,  112,  112,  112,   71,   70,   71,  135,  135,
			  238,  135,  117,  131,  117,  112,  117,  117,  117,  117,
			  117,  117,  117,  348,  348,  237,  348,   99,  236,  412,
			  135,  234,  135,   71,   89,   89,  493,   89,  112,  493,
			  108,  131,  226,  112,  198,  198,  198,  198,  198,  108,
			  108,  108,  108,  108,  108,  117,  201,  200,  200,  200,
			   89,  493,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,  108,  116,  116,  116,  116,
			  116,  116,  118,  118,  118,  118,  118,  118,  126,  126,

			  108,  126,  116,  119,  108,  119,  108,  119,  119,  119,
			  119,  119,  119,  222,   89,  358,  127,  127,  221,  127,
			  128,  128,  126,  128,  129,  129,  705,  129,  130,  130,
			  116,  130,  201,  201,  201,  126,  132,  132,  358,  132,
			  127,  590,  561,  358,  128,  561,  119,  127,  129,  220,
			  561,  216,  130,  128,  133,  133,  210,  133,  134,  134,
			  132,  134,  208,  126,  590,  705,  132,  129,  130,  590,
			  205,  193,  132,  136,  136,  127,  136,  165,  133,  169,
			  165,  128,  134,  137,  137,  165,  137,  139,  139,  163,
			  139,  133,  165,  160,  132,  129,  130,  136,  156,  143,

			  132,  134,  138,  138,  111,  138,  110,  137,  109,  140,
			  140,  139,  140,  137,  136,  141,  141,  106,  141,  133,
			  142,  142,  703,  142,  153,  153,  138,  153,  165,  134,
			  703,  104,  139,  140,  102,  145,  145,   98,  145,  141,
			   95,  137,  136,  703,  142,  141,  146,  146,  153,  146,
			  145,  142,  155,  155,  140,  155,  153,  138,  703,  145,
			  139,  146,   94,  148,  148,   93,  148,  704,  151,  151,
			  146,  151,   75,  141,   72,  704,  155,  146,  148,  142,
			  145,   56,  140,  144,  153,  144,  144,  148,  704,   35,
			  546,  146,  151,  146,  148,  149,  149,  149,  149,  149, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  149,  155,  144,  704,   33,  146,  144,  546,  148,  144,
			  601,  546,  150,  150,  151,  150,  144,   28,  144,   26,
			  144,  146,  148,   18,  149,   17,   16,  601,  149,  155,
			  144,  601,  383,  202,  144,  546,  150,  144,  152,  152,
			  402,  152,  151,  383,  150,   13,  144,  150,  144,  147,
			  147,  402,  147,  383,    0,  601,  149,  154,  154,    0,
			  154,  402,  152,    0,  147,  147,  147,  147,  147,  147,
			  147,  383,  150,  147,  152,  150,    0,    0,  152,  402,
			  166,  154,  167,  166,  147,  167,  168,  147,  166,  168,
			  167,    0,    0,  147,  168,  166,  330,  167,    0,    0,

			  154,  168,  152,    0,    0,  170,  152,    0,  170,  202,
			  202,  202,  147,  170,    0,  147,    0,  168,    0,  167,
			  170,  147,    0,    0,  171,  166,  173,  171,  154,  173,
			    0,  166,  171,  167,  173,    0,    0,  168,  170,  171,
			  172,  173,    0,  172,    0,  168,  174,  167,  172,  174,
			  698,  698,  698,  166,  174,  172,  170,  217,  217,    0,
			  217,  174,    0,  332,    0,    0,  170,  171,  340,  340,
			  173,  340,  330,  330,  330,  171,  174,  173,  175,    0,
			  172,  175,  174,  217,  176,    0,  175,  176,  787,  787,
			  787,  172,  176,  175,  340,  171,    0,  174,  173,  176,

			    0,    0,    0,  177,  174,    0,  177,    0,  172,  178,
			  174,  177,  178,  180,  334,  175,  180,  178,  177,    0,
			    0,  180,    0,  179,  178,  177,  179,  176,  180,  175,
			    0,  179,    0,  240,  240,  176,  240,  713,  179,  332,
			  332,  332,    0,  175,  182,  713,    0,  182,  183,    0,
			  178,  183,  182,  179,  177,  176,  183,  240,  713,  182,
			  178,    0,    0,  183,  180,    0,  335,  181,  180,    0,
			  181,    0,    0,  713,  179,  181,    0,    0,  178,    0,
			    0,  179,  181,  181,  181,  181,  181,  181,  181,  182,
			  334,  334,  334,  183,  184,  182,    0,  184,  185,  183,

			  186,  185,  184,  186,  187,    0,  185,  187,  186,  184,
			    0,    0,  187,  185,    0,  186,    0,  182,  181,  187,
			  191,  183,  188,  191,  184,  188,    0,    0,  191,  185,
			  188,  189,  186,  190,  189,  191,  190,  188,    0,  189,
			    0,  190,  335,  335,  335,  184,  189,    0,  190,  185,
			  187,  186,  184,  714,    0,  187,  225,  185,  188,  225,
			  186,  714,  188,  189,  258,  258,    0,  258,  225,  191,
			    0,  191,    0,  188,  714,    0,  190,    0,  187,  225,
			  336,    0,  189,    0,  190,    0,  188,    0,  258,  714,
			  188,  189,  252,  252,  252,  252,  252,  191,  223,  223,

			  223,  223,  223,  223,  190,  213,  213,  227,  213,  225,
			  227,  235,  235,  235,  235,  235,  235,  235,  244,  227,
			  244,    0,    0,  244,  244,  244,  244,  244,  244,    0,
			  227,  213,    0,  213,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  336,  336,  336,    0,
			  227,  243,  243,  243,  243,  243,  243,  245,  245,  245,
			  245,  245,  245,  634,  634,  634,  634,  243,  248,  248,
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
			  259,  257,    0,    0,  256,  251,    0,  260,  260,  607,
			  260,  261,  261,    0,  261,  262,  262,  257,  262,  263,

			  263,  259,  263,    0,  264,  264,  607,  264,    0,    0,
			  607,  260,  256,  265,  265,  261,  265,  259,  260,  262,
			    0,  345,  345,  263,  345,  257,  643,  262,  264,  266,
			  266,    0,  266,  345,  607,  261,  263,  265,  268,  268,
			    0,  268,    0,  643,  345,  259,  260,  643,  264,  269,
			  269,    0,  269,  266,    0,  262,    0,  265,  270,  270,
			    0,  270,  268,  261,  263,  271,  271,    0,  271,  272,
			  272,  643,  272,  269,  345,  268,  264,    0,  273,  273,
			    0,  273,  270,    0,  266,  265,  269,  274,  274,  271,
			  274,    0,    0,  272,  270,  271,  276,  276,  276,  276,

			  276,  276,  273,  268,  461,  718,  461,  718,    0,  277,
			  277,  274,  277,    0,  269,  461,  718,  286,  286,  274,
			  286,    0,  270,  271,  273,  277,  277,  277,  277,  277,
			  277,    0,  286,  277,  535,  535,  535,  535,  535,  278,
			  278,  286,  278,  461,  718,    0,    0,  274,  279,  279,
			    0,  279,  273,    0,  277,  278,  278,  278,  278,  278,
			  278,    0,    0,  278,  279,  279,  279,  279,  279,  279,
			  280,  280,  279,  280,    0,  636,  636,  636,  636,  281,
			  281,    0,  281,    0,    0,    0,  280,  280,  280,  280,
			  280,  280,    0,  279,  280,  281,  281,  281,  281,  281,

			  281,    0,    0,  281,  282,  282,  282,  282,  282,  282,
			  283,    0,  283,  283,  636,  280,  284,  284,  284,  284,
			  284,  284,  285,  285,  281,  285,  287,  287,    0,  287,
			    0,  288,  288,  283,  288,  284,  283,  285,  290,  290,
			    0,  290,  283,    0,  289,  289,  285,  289,  291,  291,
			  287,  291,  646,  288,    0,  288,  646,  292,  292,    0,
			  292,  283,  290,  284,  283,  287,  285,    0,  289,    0,
			  283,    0,  291,  646,  293,  293,  289,  293,    0,    0,
			  290,  292,  294,  294,  646,  294,    0,  378,  378,    0,
			  378,  291,    0,  287,  285,  647,    0,  673,  293,  647,

			    0,  673,  304,    0,  289,  304,  294,    0,  290,    0,
			  304,  378,  292,    0,    0,    0,  647,  304,  673,  291,
			  296,  296,  296,  296,  296,  296,  296,  647,    0,  673,
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
			  307,  310,  311,  309,  312,  311,  302,  312,  310,  771,
			  311,  308,  312,  377,    0,  303,  306,  311,  308,  312,
			  307,  377,  309,  771,  771,  771,  313,    0,  307,  313,
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
			  321,  649,  322,  321,  649,  322,    0,  320,  321,  319,
			  322,  752,  752,  752,  752,  321,  319,  322,  323,    0,
			  324,  323,  325,  324,  326,  325,  323,  326,  324,  318,
			  325,    0,  326,  323,  322,  324,    0,  325,  489,  326,
			  361,  361,  361,  361,  361,  361,  321,    0,    0,  489,
			  752,  321,  324,  322,  649,  327,    0,  323,  327,  489,
			    0,    0,  322,  327,  325,  649,    0,  326,    0,  323,

			  327,  324,    0,  325,  321,  326,  328,  489,    0,  328,
			  324,    0,    0,    0,  328,  323,  329,  558,    0,  329,
			  342,  328,  325,  342,  329,  326,    0,    0,  558,    0,
			  343,  329,  342,  343,  342,    0,  327,    0,  558,    0,
			  327,    0,  343,  342,  343,    0,  343,  343,  343,  343,
			  343,  343,    0,  343,    0,    0,  558,  328,  352,  352,
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
			  376,  376,    0,  376,  379,  379,    0,  379,  745,  380,
			  380,  373,  380,  381,  381,  374,  381,    0,  382,  382,
			  375,  382,    0,    0,  376,  745,    0,    0,  379,  745,

			  373,  385,  385,  380,  385,    0,  376,  381,  374,  375,
			    0,    0,  382,    0,  746,  381,  382,    0,  384,  384,
			  379,  384,    0,  745,  380,  385,  387,  387,  373,  387,
			    0,  746,    0,    0,  376,  746,  374,  375,  388,  388,
			    0,  388,  384,  381,  382,    0,    0,  385,  379,  392,
			  387,    0,  380,    0,  384,  389,  389,    0,  389,  746,
			    0,  387,  388,  390,  390,  390,  390,  390,  390,  392,
			  401,  401,  392,  401,    0,  385,    0,    0,  392,  389,
			    0,  388,  384,  396,  396,  396,  396,  396,  396,  387,
			    0,  390,    0,    0,  401,    0,    0,  392,  389,    0,

			  392,  725,  725,  725,  725,  725,  392,    0,    0,  388,
			  397,  397,  397,  397,  397,  397,  396,    0,    0,  390,
			  393,  393,  393,  393,  393,  393,  389,  391,  391,  391,
			  391,  391,  391,  394,  394,  394,  394,  394,  394,  393,
			    0,  674,  391,    0,  396,  674,    0,    0,  394,  391,
			  398,  398,  398,  398,  398,  398,  403,  403,  391,  403,
			  391,  559,  674,    0,  394,  398,    0,  393,    0,    0,
			  391,    0,  559,  674,    0,    0,  394,  391,  395,  395,
			  403,  395,  559,    0,    0,    0,  391,    0,  391,    0,
			    0,    0,  394,  398,  395,  395,  395,  395,  395,  395,

			  559,    0,  395,  399,  399,  399,  399,  399,  399,  395,
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
			    0,  421,    0,  426,  427,  424,  426,  427,  423,  728,
			  424,  426,  427,    0,  428,    0,    0,  428,  426,  427,

			  728,  425,  428,  429,    0,    0,  429,  425,  442,  428,
			  728,  429,  427,  424,    0,  426,  430,  432,  429,  430,
			  432,    0,    0,    0,  430,  432,  729,    0,  728,  425,
			  428,  430,  432,  433,  426,  427,  433,  729,    0,    0,
			  427,  433,    0,  426,    0,  428,    0,  729,  433,  429,
			    0,    0,  432,    0,  429,  430,    0,    0,  428,  431,
			  431,  431,  431,  431,  431,  729,  434,  430,  432,  434,
			  435,    0,    0,  435,  434,    0,  433,  429,  435,  436,
			  432,  434,  436,  430,  433,  435,    0,  436,  437,    0,
			  439,  437,  438,  439,  436,  438,  437,  734,  439,  738,

			  438,  738,    0,  437,  433,  439,    0,  438,  734,  434,
			  738,    0,  440,    0,    0,  440,    0,  434,  734,    0,
			  440,  435,    0,  438,    0,  440,    0,  440,    0,  439,
			  436,    0,  470,  470,  437,  470,  734,  434,  738,  437,
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
			  469,  471,  471,  464,  471,  749,  474,  474,  466,  474,
			    0,  473,  473,  467,  473,  475,  475,  468,  475,  465,

			  467,  469,  749,  466,  468,  471,  749,    0,    0,  469,
			  474,  476,  476,    0,  476,  473,    0,  474,  471,  475,
			    0,  469,    0,  473,  477,  477,    0,  477,  467,  735,
			  749,  466,  468,  478,  478,  476,  478,  469,    0,    0,
			  735,    0,    0,  476,    0,  474,  471,    0,  477,  469,
			  735,  473,  481,  481,    0,  481,    0,  478,  480,  480,
			  480,  480,  480,  480,    0,  478,    0,  477,  735,    0,
			    0,  476,    0,  480,    0,    0,  481,  482,  482,  482,
			  482,  482,  482,    0,    0,  484,  484,  484,  484,  484,
			  484,  486,  486,  478,  486,  477,    0,  481,    0,    0,

			    0,  480,    0,    0,    0,  482,    0,  484,  488,  488,
			    0,  488,    0,  487,  487,  486,  487,  524,  524,  524,
			  524,  524,  524,  486,  491,  491,  491,  491,  491,  491,
			  491,    0,  488,  482,  483,  484,  483,  487,  483,  483,
			  483,  483,  483,  483,    0,  487,  539,  539,  488,  539,
			    0,  486,    0,  483,  541,  541,    0,  541,    0,  500,
			  483,    0,  500,    0,    0,    0,  483,  500,    0,  501,
			  539,    0,  501,  487,  500,    0,  488,  501,  541,    0,
			    0,  483,    0,    0,  501,    0,    0,    0,  483,  743,
			  743,  743,  743,  743,  483,  494,  494,  494,  494,  494,

			  494,  494,  496,  496,  496,  496,  496,  496,  496,  503,
			  500,  503,  503,  503,  503,  503,  503,    0,  504,  505,
			  501,  504,  505,    0,  501,    0,  504,  505,  506,  507,
			    0,  506,  507,  504,  505,    0,  506,  507,  509,  508,
			    0,  509,  508,  506,  507,    0,  509,  508,  503,    0,
			  504,    0,    0,  509,  508,    0,    0,    0,  505,  506,
			  507,  515,    0,  515,  515,  515,  515,  515,  515,  504,
			  505,  508,  529,  529,  529,  529,  529,  529,  504,  506,
			  507,  544,  544,  508,  544,    0,  505,  506,  507,  509,
			  508,    0,  510,  511,    0,  510,  511,    0,    0,  508,

			  510,  511,    0,    0,    0,  544,    0,  510,  511,  512,
			    0,  508,  512,  513,  750,  516,  513,  512,  516,  517,
			    0,  513,  517,  516,  512,  511,    0,  517,  513,  510,
			  516,  750,    0,  518,  517,  750,  518,    0,    0,    0,
			  512,  518,    0,  510,  511,    0,  519,  516,  518,  519,
			    0,    0,    0,  511,  519,    0,    0,  510,    0,  750,
			  512,  519,  517,    0,  513,  518,  516,    0,  512,    0,
			  517,  520,    0,  521,  520,  516,  521,    0,  519,  520,
			    0,  521,    0,    0,  518,    0,  520,    0,  521,    0,
			  517,    0,    0,  518,    0,    0,    0,  519,  522,    0,

			    0,  522,    0,  520,    0,    0,  519,    0,    0,    0,
			  522,    0,  522,  521,  522,  522,  522,  522,  522,  522,
			    0,  522,  520,  526,  521,  526,  526,  526,  526,  526,
			  526,  520,  527,  527,  527,  527,  527,  527,    0,    0,
			    0,  521,  528,  528,  528,  528,  528,  528,  527,    0,
			    0,  522,  530,  530,  530,  530,  530,  530,    0,    0,
			    0,    0,  526,  532,  532,  532,  532,  532,  532,  533,
			  533,  533,  533,  533,  533,    0,  527,  538,  538,    0,
			  538,  528,  534,  534,  534,  534,  534,  534,  537,  537,
			  537,  537,  537,  537,  540,  540,    0,  540,    0,  542,

			  542,  538,  542,    0,  537,  538,  543,  543,    0,  543,
			  545,  545,    0,  545,  547,  547,    0,  547,  540,    0,
			    0,    0,  540,  542,  548,  548,    0,  548,    0,    0,
			  543,  542,  537,  538,  545,    0,  549,  549,  547,  549,
			  550,  550,    0,  550,    0,  543,  569,  545,  548,  569,
			  540,    0,  551,  551,  569,  551,  548,    0,  547,  542,
			  549,  569,    0,    0,  550,  565,  565,  565,  565,  565,
			  565,    0,  550,  543,    0,  545,  551,    0,  555,  555,
			  549,  555,    0,  551,  548,  552,  547,  552,    0,  552,
			  552,  552,  552,  552,  552,  556,  556,  569,  556,    0,

			  550,    0,  555,    0,  552,    0,  557,  557,  549,  557,
			  560,  551,  560,  560,  560,  560,  560,  560,  560,  556,
			  562,    0,  562,  562,  562,  562,  562,  562,  562,    0,
			  557,    0,  552,  598,  598,    0,  598,  557,  556,  563,
			    0,  563,  563,  563,  563,  563,  563,  563,  566,  560,
			    0,  566,    0,    0,    0,    0,  566,  598,    0,  562,
			    0,  599,  599,  566,  599,  557,  556,  567,  567,  567,
			  567,  567,  567,    0,  570,    0,  566,  570,  563,    0,
			  571,    0,  570,  571,    0,  599,    0,    0,  571,  570,
			  572,  599,    0,  572,    0,  571,    0,    0,  572,  566,

			  573,    0,  570,  573,  566,  572,  574,    0,  573,  574,
			  596,  596,    0,  596,  574,  573,    0,    0,    0,  599,
			  576,  574,  572,  576,    0,  570,    0,    0,  576,  575,
			  570,  571,  575,    0,  596,  576,    0,  575,    0,  573,
			  577,  572,    0,  577,  575,    0,  578,    0,  577,  578,
			  572,  573,    0,  596,  578,  577,    0,  574,    0,    0,
			  581,  578,    0,  581,  576,    0,  575,  573,  581,    0,
			  579,  576,  577,  579,  580,  581,    0,  580,  579,    0,
			  575,  596,  580,  600,  600,  579,  600,    0,    0,  580,
			  578,  577,  576,  582,  575,  583,  582,  578,  583,    0,

			  577,  582,  579,  583,    0,  580,    0,  600,  582,    0,
			  583,  581,  584,  584,  584,  584,  584,  584,  578,    0,
			    0,  579,    0,    0,    0,  580,  583,    0,    0,    0,
			  579,    0,    0,  580,    0,    0,  582,  585,  585,  585,
			  585,  585,  585,  587,  582,  587,  583,    0,  587,  587,
			  587,  587,  587,  587,  583,  588,  588,  588,  588,  588,
			  588,    0,    0,    0,  582,  589,  589,  589,  589,  589,
			  589,  591,  591,  591,  591,  591,  591,  593,  593,  593,
			  593,  593,  593,  594,  594,  594,  594,  594,  594,  597,
			  597,    0,  597,    0,  588,  595,  595,  595,  595,  595, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  595,  602,  602,    0,  602,  603,  603,    0,  603,  604,
			  604,  595,  604,  597,  605,  605,    0,  605,  606,  606,
			    0,  606,    0,    0,    0,  602,  597,  608,  608,  603,
			  608,    0,    0,  604,  595,    0,    0,    0,  605,  595,
			  609,  609,  606,  609,    0,    0,    0,  616,    0,    0,
			  616,  608,    0,  605,  597,  616,    0,    0,    0,  608,
			    0,    0,  616,  615,  609,  615,  615,  615,  615,  615,
			  615,  617,  609,  617,  617,  617,  617,  617,  617,    0,
			  618,  605,    0,  618,    0,    0,  619,  608,  618,  619,
			  616,    0,    0,    0,  619,  618,  620,    0,  616,  620,

			  609,  619,  615,    0,  620,  621,  622,    0,  621,  622,
			  617,  620,    0,  621,  622,    0,    0,  618,  616,  623,
			  621,  622,  623,    0,    0,  624,  620,  623,  624,  645,
			  645,  618,  645,  624,  623,  625,  626,  619,  625,  626,
			  624,    0,    0,  625,  626,  618,    0,  620,    0,    0,
			  625,  626,  627,  645,  620,  627,  621,  622,  628,    0,
			  627,  628,    0,    0,    0,    0,  628,  627,    0,    0,
			  623,    0,    0,  628,  625,  629,  624,  629,  629,  629,
			  629,  629,  629,    0,  627,    0,  625,  626,    0,    0,
			  628,  630,  630,  630,  630,  630,  630,    0,    0,    0,

			    0,    0,  625,  627,    0,    0,    0,    0,    0,  628,
			  669,  669,  627,  669,  629,    0,    0,    0,  628,  631,
			  631,  631,  631,  631,  631,  632,  632,  632,  632,  632,
			  632,  633,    0,  633,  669,    0,  633,  633,  633,  633,
			  633,  633,  635,  635,  635,  635,  635,  635,  637,  637,
			  637,  637,  637,  637,  638,  638,    0,  638,  639,  639,
			    0,  639,    0,    0,  637,  640,  640,    0,  640,  642,
			  642,    0,  642,  652,  644,  644,  652,  644,  638,    0,
			    0,  652,  639,    0,  638,    0,    0,  637,  652,  640,
			    0,    0,  637,  642,  639,    0,    0,  640,  644,  642,

			    0,    0,    0,  652,    0,  644,  650,  650,  650,  650,
			  650,  650,  638,  653,    0,  654,  653,    0,  654,    0,
			    0,  653,  639,  654,  652,  640,    0,  642,  653,  655,
			  654,  652,  655,  644,    0,    0,    0,  655,  656,    0,
			  657,  656,  680,  657,  655,  680,  656,  654,  657,  653,
			  680,    0,    0,  656,    0,  657,    0,  680,    0,  655,
			    0,    0,    0,    0,  653,    0,  654,    0,    0,  656,
			  672,  672,    0,  672,    0,  654,    0,  653,    0,    0,
			  655,  659,  659,  659,  659,  659,  659,  655,    0,  656,
			    0,  657,    0,  680,  672,    0,    0,  656,  660,  660,

			  660,  660,  660,  660,  661,  661,  661,  661,  661,  661,
			  662,  662,  662,  662,  662,  662,  663,  663,  663,  663,
			  663,  663,  664,  664,  664,  664,  664,  664,  666,  666,
			  666,  666,  666,  666,    0,  667,  667,  660,  667,  668,
			  668,    0,  668,    0,  666,  670,  670,    0,  670,  675,
			  675,  677,  675,  677,  677,  677,  677,  677,  677,  667,
			    0,  689,  689,  668,  689,    0,    0,  666,  678,  670,
			  667,  678,  666,  675,    0,    0,  678,  670,  679,  681,
			    0,  679,  681,  678,  668,  689,  679,  681,    0,  682,
			  677,    0,  682,  679,  681,    0,    0,  682,  667,    0,

			    0,    0,    0,  678,  682,  670,    0,    0,    0,    0,
			  689,  681,  668,  683,  683,  683,  683,  683,  683,  678,
			    0,    0,    0,  679,    0,  690,  690,    0,  690,  679,
			  681,  678,  685,  685,  685,  685,  685,  685,  689,  681,
			  682,  687,  687,  687,  687,  687,  687,    0,  686,  690,
			  686,  679,  683,  686,  686,  686,  686,  686,  686,  688,
			  688,    0,  688,  694,  694,  694,  694,  694,  694,  690,
			  695,  696,    0,  695,  696,    0,    0,    0,  695,  696,
			    0,  697,    0,  688,  697,  695,  696,  686,    0,  697,
			    0,  688,  700,  700,    0,  700,  697,  690,    0,    0,

			    0,    0,  695,  699,  699,  699,  699,  699,  699,  701,
			  701,    0,  701,    0,  702,  702,  700,  702,    0,  688,
			  696,  695,  696,    0,    0,  697,    0,    0,    0,    0,
			  695,    0,  697,  701,    0,    0,    0,  700,  702,  706,
			    0,  706,  706,  706,  706,  706,  706,  707,  696,  708,
			  707,  709,  708,  697,  709,  707,    0,  708,    0,  709,
			    0,    0,  707,    0,  708,  700,  709,  710,  710,  710,
			  710,  710,  710,  712,  712,    0,  712,    0,  706,  711,
			  711,  711,  711,  711,  711,  715,  715,  715,  715,  715,
			  715,  717,  707,    0,  717,    0,    0,  712,  707,  717,

			  708,    0,  709,    0,  719,  719,  717,  719,  722,    0,
			  722,  722,  722,  722,  722,  722,  723,    0,    0,  723,
			  707,    0,  712,    0,  723,    0,    0,    0,  719,    0,
			    0,  723,  724,  724,  724,  724,  724,  724,  727,  727,
			  717,  727,  717,  730,    0,  719,  730,  722,    0,    0,
			  712,  730,    0,    0,    0,    0,  736,  723,  730,  736,
			  733,  733,  727,  733,  736,    0,    0,  723,  717,    0,
			  727,  736,    0,  719,    0,  730,  731,  731,  731,  731,
			  731,  731,    0,    0,  733,  723,  732,  732,  732,  732,
			  732,  732,    0,    0,  730,    0,    0,    0,  727,    0,

			    0,    0,    0,  730,    0,    0,    0,  736,  737,  737,
			  737,  737,  737,  737,  741,  741,  741,  741,  741,  741,
			  742,  742,  742,  742,  742,  742,  747,  747,  747,  747,
			  747,  747,  748,  748,  748,  748,  748,  748,  751,  751,
			  751,  751,  751,  751,  755,  755,  755,  755,  755,  755,
			  756,  756,  756,  756,  756,  756,  757,  757,  757,  757,
			  757,  757,  759,  759,  759,  759,  759,  759,  760,    0,
			  760,    0,    0,  760,  760,  760,  760,  760,  760,  761,
			  761,  761,  761,  761,  761,  762,  762,  762,  762,  762,
			  762,  770,  770,  770,  770,  770,  770,  770,  795,  795,

			  795,  795,  795,  795,  795,    0,    0,  760,  764,  764,
			  764,  764,  764,  764,  764,  764,  764,  764,  764,  764,
			  764,  764,  764,  764,  764,  764,  764,  764,  764,  764,
			  764,  764,  764,  764,  765,  765,  765,  765,  765,  765,
			  765,  765,  765,  765,  765,  765,  765,  765,  765,  765,
			  765,  765,  765,  765,  765,  765,  765,  765,  765,  765,
			  766,  766,  766,  766,  766,  766,  766,  766,  766,  766,
			  766,  766,  766,  766,  766,  766,  766,  766,  766,  766,
			  766,  766,  766,  766,  766,  766,  767,  767,  767,  767,
			  767,  767,  767,  767,  767,  767,  767,  767,  767,  767, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  767,  767,  767,  767,  767,  767,  767,  767,  767,  767,
			  767,  767,  768,  768,    0,  768,  768,  768,  768,  768,
			  768,  768,  768,  768,  768,  768,  768,  768,  768,  768,
			  768,  768,  768,    0,  768,  768,  768,  768,  769,  769,
			    0,  769,  769,  769,  769,  769,  769,  769,  769,  769,
			  769,  769,  769,  769,  769,  769,  769,  769,  769,  769,
			  769,  769,  769,  769,  772,  772,  772,    0,    0,    0,
			    0,    0,  772,  772,  772,    0,  772,  772,  772,  772,
			  772,  772,  772,    0,    0,  772,  772,  772,  773,  773,
			    0,  773,    0,  773,  773,    0,    0,  773,  773,  773,

			  773,  773,  773,  773,    0,    0,  773,  773,  773,  774,
			  774,    0,  774,  774,  774,  774,  774,  774,  774,  774,
			  774,  774,  774,  774,  774,  774,  774,  774,  774,  774,
			  774,  774,  774,  774,  774,  775,    0,  775,  775,    0,
			    0,    0,  775,  775,  775,    0,    0,  775,  775,  775,
			  775,  775,  775,  775,  775,    0,  775,  775,  775,  776,
			  776,    0,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			    0,  776,  776,  776,  776,  777,  777,  777,  777,  777,
			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,

			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  777,  778,  778,  778,  778,  778,  778,  778,  778,  778,
			  778,  778,  778,  778,  778,  778,  778,  778,  778,  778,
			  778,  778,  778,  778,  778,  778,  778,  779,  779,  779,
			  779,  779,  779,  779,  779,  779,  779,  779,  779,  779,
			  779,  779,  779,  779,  779,  779,  779,  779,  779,  779,
			  779,  779,  779,  780,  780,  780,  780,  780,  780,  780,
			  780,  780,  780,  780,  780,  780,  780,  780,  780,  780,
			  780,  780,  780,  780,  780,  780,  780,  780,  780,  781,
			    0,  781,    0,    0,    0,  781,    0,  781,  781,    0,

			    0,  781,  781,  781,  781,  781,  781,  781,    0,    0,
			  781,  781,  781,  782,  782,    0,  782,  782,  782,  782,
			  782,  782,  782,  782,  782,  782,  782,  782,  782,  782,
			  782,  782,  782,  782,  782,  782,  782,  782,  782,  783,
			    0,    0,    0,  783,  783,    0,    0,  783,  783,  783,
			  783,  783,  783,  783,    0,    0,  783,  783,  783,  784,
			  784,  784,  784,  784,  784,  784,  784,  784,  784,  784,
			  784,  784,  784,  784,  784,  784,  784,  784,  784,  784,
			  784,  784,  784,  784,  784,  785,  785,  785,    0,    0,
			  785,  785,  785,  785,  785,  785,  785,  785,    0,  785,

			  785,  785,  786,    0,    0,  786,  786,  786,  786,  786,
			  786,  786,  786,  786,  786,  786,    0,    0,  786,  786,
			  786,  788,  788,  788,  788,  788,  788,  788,  788,    0,
			  788,  788,  788,  788,  788,  788,  788,  788,  788,  788,
			  788,  788,  788,  788,  788,  788,  788,  789,  789,  789,
			  789,  789,  789,  789,  789,  789,  789,  789,  789,  789,
			  789,  789,  789,  789,  789,  789,  789,  789,  789,  789,
			  789,  789,  789,  790,  790,  790,    0,    0,    0,    0,
			    0,    0,    0,    0,  790,  790,  790,  790,  790,  790,
			  790,  790,    0,    0,    0,    0,    0,  790,  791,  791,

			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  792,  792,  792,  792,  792,  792,
			  792,  792,  792,  792,  792,  792,  792,  792,  792,  792,
			  792,  792,  792,  792,  792,  792,  792,  792,  792,  792,
			  793,  793,  793,    0,    0,  793,  793,  793,  793,  793,
			  793,  793,  793,    0,  793,  793,  793,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  796,    0,    0,    0,  796,  796,    0,

			    0,  796,  796,  796,  796,  796,  796,  796,    0,    0,
			  796,  796,  796,  763,  763,  763,  763,  763,  763,  763,
			  763,  763,  763,  763,  763,  763,  763,  763,  763,  763,
			  763,  763,  763,  763,  763,  763,  763,  763,  763,  763,
			  763,  763,  763,  763,  763,  763,  763,  763,  763,  763,
			  763,  763,  763,  763,  763,  763,  763,  763,  763,  763,
			  763,  763,  763,  763,  763,  763,  763,  763,  763,  763,
			  763,  763,  763,  763,  763,  763,  763,  763,  763,  763,
			  763,  763,  763,  763,  763,  763,  763,  763,  763,  763,
			  763,  763,  763,  763,  763,  763,  763,  763,  763,  763,

			  763,  763,  763,  763, yy_Dummy>>,
			1, 704, 5000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   88,   93,   75,   77,   69,   70,   99,
			  103,  183,    0, 1045, 5613,  105, 1023,  998, 1016, 5613,
			   84,    0, 5613, 5613, 5613, 5613, 1004,  101, 1000,  260,
			  270, 5613, 5613,  977, 5613,  962, 5613,  293,  110,  299,
			  130,  304,  309,  318,  344,  370,  375,  384,  456,  389,
			  444,  401,  430,   79, 5613, 5613,  925,  481,  335,  521,
			  397,  537,  547,  556,  589,  565,  609,  622,  623,  426,
			  636,  654,  957, 5613, 5613,  965,  158, 5613,   96,  280,
			  268,  354,  324,  444,  117, 5613,   94,  288,   71,  732,
			 5613, 5613,  292,  962,  947,  865, 5613,  138,  934,  672,

			  567,  162,  931, 5613,  924, 5613,  908,    0,  731,  897,
			  903,  888,  681, 5613,  260,  401,  768,  698,  774,  789,
			 5613, 5613,  499,  560,    0,  605,  796,  814,  818,  822,
			  826,  667,  834,  852,  856,  706,  871,  881,  900,  885,
			  907,  913,  918,  817,  969,  933,  944, 1047,  961,  977,
			 1010,  966, 1036,  922, 1055,  950,  874,  424,  261,  103,
			  837, 5613,  298,  878,    0,  875, 1078, 1080, 1084,  813,
			 1103, 1122, 1138, 1124, 1144, 1176, 1182, 1201, 1207, 1221,
			 1211, 1265, 1242, 1246, 1292, 1296, 1298, 1302, 1320, 1329,
			 1331, 1318, 5613,  864, 5613,  506, 5613, 5613,  658,  564,

			  674,  749, 1026,  388, 5613,  816,  502,  376,  807,  438,
			  802, 5613,  370, 1403, 5613, 5613,  823, 1155, 5613,  463,
			  774,  815,  810, 1380,  153, 1354,  739, 1405,  163, 1485,
			  313, 5613, 5613, 5613,  722, 1394,  719,  716,  701,  676,
			 1231,  510, 5613, 1443, 1405, 1449,  667,  600, 1460, 1497,
			 1514, 1528, 1374, 1503, 5613,  633, 1550, 1555, 1362, 1575,
			 1585, 1589, 1593, 1597, 1602, 1611, 1627,  605, 1636, 1647,
			 1656, 1663, 1667, 1676, 1685, 5613, 1678, 1707, 1737, 1746,
			 1768, 1777, 1786, 1796, 1798, 1820, 1715, 1824, 1829, 1842,
			 1836, 1846, 1855, 1872, 1880,  613, 1902, 1914, 1921,  335,

			 5613,  515, 1944, 1945, 1900,  559, 1946, 1967, 1965, 1969,
			 1991, 2000, 2002, 2024, 2030, 2040, 2049, 2068, 2106, 2086,
			 2084, 2128, 2130, 2146, 2148, 2150, 2152, 2183, 2204, 2214,
			 1089,  326, 1156,  456, 1207, 1259, 1373,  282, 5613,  561,
			 1166, 5613, 2218, 2228,  610, 1619, 5613,  689,  721,  609,
			 5613, 5613, 2241, 5613, 5613, 5613, 5613, 5613,  781, 2042,
			 2256, 2152,  542, 2266, 2276, 2296, 2282, 2302, 2308, 2321,
			 2327, 2333,  557, 2355, 2359, 2364, 2368, 1987, 1885, 2372,
			 2377, 2381, 2386, 1003, 2416, 2399, 2266, 2424, 2436, 2453,
			 2445, 2509, 2432, 2502, 2515, 2576, 2465, 2492, 2532, 2585,

			 1955, 2468, 1011, 2554, 2608, 2612, 2617, 2621,  541,  529,
			 2609, 2647,  674, 2656, 2669,  101,  512, 2693, 2695, 2630,
			 2704, 2715, 2717, 2735, 2737, 2754, 2781, 2782, 2792, 2801,
			 2814, 2841, 2815, 2831, 2864, 2868, 2877, 2886, 2890, 2888,
			 2910, 5613, 2753,  578, 2926,  596, 5613, 2946, 2952, 2958,
			 2964,  545, 2970, 2976, 2987, 2993, 2999, 3015,  518, 3027,
			 3039, 1691,  586, 2657, 3026, 3037, 3062, 3067, 3071, 3075,
			 2930, 3079,  506, 3089, 3084, 3093, 3109, 3122, 3131, 5613,
			 3140, 3150, 3159, 3220, 3167, 2042, 3189, 3211, 3206, 2139,
			 5613, 3206, 5613,  734, 3277, 5613, 3284, 5613,  102,  445,

			 3257, 3267,  409, 3293, 3316, 3317, 3326, 3327, 3337, 3336,
			 3390, 3391, 3407, 3411,  481, 3345, 3413, 3417, 3431, 3444,
			 3469, 3471, 3496,  431, 3199,  581, 3507, 3514, 3524, 3354,
			 3534,  423, 3545, 3551, 3564, 1716, 5613, 3570, 3575, 3244,
			 3592, 3252, 3597, 3604, 3379, 3608,  961, 3612, 3622, 3634,
			 3638, 3650, 3671, 5613,  445, 3676, 3693, 3704, 2188, 2532,
			 3694,  840, 3704, 3723,  436, 3647, 3746, 3749,  436, 3644,
			 3772, 3778, 3788, 3798, 3804, 3827, 3818, 3838, 3844, 3868,
			 3872, 3858, 3891, 3893, 3894, 3919,  423, 3930, 3937, 3947,
			  807, 3953,  421, 3959, 3965, 3977, 3808, 3987, 3731, 3759,

			 3881,  981, 3999, 4003, 4007, 4012, 4016, 1560, 4025, 4038,
			  366,  361,    0,  350,  628, 4047, 4045, 4055, 4078, 4084,
			 4094, 4103, 4104, 4117, 4123, 4133, 4134, 4150, 4156, 4159,
			 4173, 4201, 4207, 4218, 1455, 4224, 1762, 4230, 4252, 4256,
			 4263, 5613, 4267, 1597, 4272, 4127, 1823, 1866,  357, 2129,
			 4288,  331, 4271, 4311, 4313, 4327, 4336, 4338,  269, 4363,
			 4380, 4386, 4392, 4398, 4404, 5613, 4410, 4433, 4437, 4208,
			 4443, 5613, 4368, 1868, 2512, 4447,  263, 4435, 4466, 4476,
			 4340, 4477, 4487, 4495,  263, 4514, 4535, 4523, 4557, 4459,
			 4523,  311, 5613, 5613, 4545, 4568, 4569, 4579, 1132, 4585,

			 4590, 4607, 4612,  893,  938,  810, 4623, 4645, 4647, 4649,
			 4649, 4661, 4671, 1208, 1324, 4667, 5613, 4689, 1692, 4702,
			  130,  117, 4692, 4714, 4714, 2483, 5613, 4736, 2760, 2797,
			 4741, 4758, 4768, 4758, 2868, 3100, 4754, 4790, 2886,  115,
			   92, 4796, 4802, 3271, 5613, 2349, 2385, 4808, 4814, 3056,
			 3385, 4820, 2128, 5613, 5613, 4826, 4832, 4838, 5613, 4844,
			 4855, 4861, 4867, 5613, 4907, 4933, 4959, 4985, 5011, 5037,
			 4877, 2000, 5062, 5083, 5108, 5133, 5158, 5184, 5210, 5236,
			 5262, 5287, 5312, 5333, 5358, 5376, 5395, 1165, 5420, 5446,
			 5471, 5497, 5523, 5541, 5566, 4884, 5587, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  763,    1,  764,  764,  765,  765,  766,  766,  767,
			  767,  763,   11,  763,  763,  763,  763,  763,  768,  763,
			  769,  770,  763,  763,  763,  763,  763,  763,  771,  763,
			  763,  763,  763,  763,  763,  763,  763,  772,  772,  772,
			  772,  772,  772,  772,  772,  772,  772,  772,  772,  772,
			  772,  772,  772,  773,  763,  763,  774,  775,  775,  775,
			  775,  775,  775,  775,  775,  775,  775,  775,  775,   64,
			  775,  775,  763,  763,  763,  776,  763,  763,  763,  776,
			  776,  776,  776,  776,  777,  763,  778,  777,  779,  780,
			  763,  763,  763,  763,  763,  763,  763,  781,  763,  781,

			  781,  763,  763,  763,  768,  763,  782,  782,  782,  783,
			  784,  763,  763,  763,  785,  763,  763,  763,  763,  763,
			  763,  763,  763,  772,  786,  772,  772,  772,  772,  772,
			  772,  772,  772,  772,  772,  772,  772,  772,  772,  772,
			  772,  772,  772,  763,   48,  772,  772,  772,  772,   48,
			  772,  772,  772,  772,  772,  772,  773,  773,  773,  773,
			  774,  763,  763,  763,  787,  775,  775,  775,  775,  763,
			  775,  775,  775,  775,  775,  775,  775,  775,  775,  775,
			  775,  775,  775,  775,  775,  775,  775,  775,  775,  775,
			  775,  775,  763,  776,  763,  763,  763,  763,  776,  776,

			  776,  776,  776,  777,  763,  788,  777,  778,  789,  778,
			  788,  763,  779,  780,  763,  763,  213,  790,  763,  763,
			  763,  763,  791,  763,  781,  781,  763,  763,  763,  792,
			  763,  763,  763,  763,  763,  763,  763,  763,  763,  763,
			  763,  763,  763,  763,  763,  763,  771,  763,  763,  763,
			  763,  763,  763,  763,  763,  786,  772,  772,  772,  772,
			  772,  772,  772,  772,  772,  772,  772,  763,  772,  772,
			  772,  772,  772,  772,  772,  763,  763,  772,  772,  772,
			  772,  772,  147,  147,  147,  772,  772,  772,  772,  772,
			  772,  772,  772,  772,  772,  763,  773,  773,  773,  773,

			  763,  793,  775,  775,  775,  763,  775,  775,  775,  775,
			  775,  775,  775,  775,  775,  775,  775,  775,  775,  775,
			  775,  775,  775,  775,  775,  775,  775,  775,  775,  775,
			  776,  776,  776,  776,  776,  776,  776,  788,  763,  789,
			  790,  763,  763,  763,  794,  794,  763,  794,  794,  794,
			  763,  763,  763,  763,  763,  763,  763,  763,  763,  763,
			  763,  763,  763,  763,  763,  763,  763,  763,  763,  763,
			  763,  763,  786,  772,  772,  772,  772,  772,  772,  772,
			  772,  772,  772,  763,  772,  772,  772,  772,  772,  772,
			  763,  144,  147,  391,  391,  772,  144,  763,  395,  395,

			  772,  772,  763,  772,  772,  772,  772,  772,  763,  773,
			  773,  773,  773,  773,  773,  773,  763,  775,  775,  763,
			  775,  775,  775,  775,  775,  775,  775,  775,  775,  775,
			  775,  763,  775,  775,  775,  775,  775,  775,  775,  775,
			  775,  763,  763,  763,  763,  763,  763,  763,  763,  763,
			  763,  763,  763,  763,  763,  763,  763,  763,  763,  763,
			  763,  763,  763,  772,  772,  772,  772,  772,  772,  772,
			  772,  772,  763,  772,  772,  772,  772,  772,  772,  763,
			  395,  772,  763,  395,  483,  763,  772,  772,  772,  763,
			  763,  773,  763,  763,  773,  763,  773,  763,  773,  763,

			  775,  775,  763,  763,  775,  775,  775,  775,  775,  775,
			  775,  775,  775,  775,  763,  763,  775,  775,  775,  775,
			  775,  775,  763,  763,  763,  763,  763,  763,  763,  763,
			  763,  763,  763,  763,  763,  763,  763,  763,  772,  772,
			  772,  772,  772,  772,  772,  772,  763,  772,  772,  772,
			  772,  772,  395,  763,  763,  772,  772,  772,  763,  763,
			  773,  763,  773,  773,  773,  763,  775,  763,  763,  775,
			  775,  775,  775,  775,  775,  775,  775,  775,  775,  775,
			  775,  775,  775,  775,  763,  763,  763,  763,  763,  763,
			  763,  763,  763,  763,  763,  763,  772,  772,  772,  772,

			  772,  763,  772,  772,  772,  772,  772,  763,  772,  772,
			  763,  763,  795,  763,  763,  763,  775,  763,  775,  775,
			  775,  775,  775,  775,  775,  775,  775,  775,  775,  763,
			  763,  763,  763,  763,  763,  763,  763,  763,  772,  772,
			  772,  763,  772,  763,  772,  772,  763,  763,  796,  763,
			  763,  763,  775,  775,  775,  775,  775,  775,  763,  763,
			  763,  763,  763,  763,  763,  763,  763,  772,  772,  772,
			  772,  763,  772,  763,  763,  763,  763,  763,  775,  775,
			  775,  775,  775,  763,  763,  763,  763,  763,  772,  772,
			  772,  763,  763,  763,  763,  775,  775,  775,  763,  763,

			  772,  772,  772,  763,  763,  763,  763,  775,  775,  775,
			  763,  763,  772,  763,  763,  763,  763,  775,  763,  772,
			  763,  763,  763,  775,  763,  763,  763,  772,  763,  763,
			  775,  763,  763,  772,  763,  763,  775,  763,  763,  763,
			  763,  763,  763,  763,  763,  763,  763,  763,  763,  763,
			  763,  763,  763,  763,  763,  763,  763,  763,  763,  763,
			  763,  763,  763,    0,  763,  763,  763,  763,  763,  763,
			  763,  763,  763,  763,  763,  763,  763,  763,  763,  763,
			  763,  763,  763,  763,  763,  763,  763,  763,  763,  763,
			  763,  763,  763,  763,  763,  763,  763, yy_Dummy>>)
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
			    0,    0,    0,    0,    0,  110,  110,    0,    0,    0,
			    0,    0,    0,  141,  139,    1,    2,   15,  123,   18,
			  139,   16,   17,    7,    6,   13,    5,   11,    8,  115,
			  115,   14,   12,   28,   10,   29,   19,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,   88,  103,
			  103,  103,  103,   21,   30,   22,    9,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,   23,   20,   24,  127,  128,  129,  130,  127,
			  127,  127,  127,  127,  110,  113,  140,  110,  140,  140,
			  102,   71,   71,   68,   71,   71,   79,   79,   76,   79,

			   79,    1,    2,   27,  123,  122,  137,  137,  137,    0,
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
			    0,   68,    0,    0,    0,    0,   76,    0,   75,    0,
			   74,   78,  137,  131,  137,  137,  137,  137,  137,  137,
			    0,    4,   33,  121,    0,    0,    0,    0,    0,  117,
			    0,  115,    0,    0,   97,    0,  103,  103,   38,  103,
			  103,  103,  103,  103,  103,  103,  103,    0,  103,  103,
			  103,  103,   41,  103,  103,   95,    0,   88,   89,   88,
			   88,   88,   96,  103,   96,   96,   96,  103,  103,  103,
			  103,  103,  103,   40,  103,    0,    0,    0,    0,    0,

			  105,  108,  106,  106,   38,    0,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  106,   62,   62,  106,
			   41,  106,  106,  106,  106,  106,  106,  106,   40,  106,
			  127,  127,  127,  127,  127,  127,  127,    0,  111,  112,
			    0,   69,    0,    0,    0,    0,   77,   75,   74,   78,
			  135,  138,  138,  136,  132,  133,  134,   98,  121,    0,
			  121,    0,    0,    0,  117,    0,    0,    0,  120,  115,
			    0,    0,  104,  103,  103,  103,  103,  103,   37,  103,
			  103,  103,  103,    0,  103,  103,  103,  103,  103,  103,
			    0,  103,   87,  103,  103,  103,  103,    0,   87,   87,

			   87,   36,    0,   43,  103,  103,  103,  103,   73,    0,
			    0,    0,    0,    0,    0,    0,    0,  106,  106,    0,
			  106,  106,  106,   37,  106,  106,  106,  106,  106,  106,
			  106,    0,  106,  106,  106,   36,   43,  106,  106,  106,
			  106,  112,    0,   67,    0,   66,   70,  121,    0,    0,
			    0,  116,  117,    0,  118,    0,  120,    0,    0,    0,
			  115,   84,    0,   57,  103,  103,  103,  103,  103,  103,
			   44,  103,    0,  103,  103,   35,  103,  103,  103,   89,
			   89,   88,    0,  103,  103,    0,  103,  103,  103,    0,
			   72,    0,   64,    0,    0,   61,    0,   60,    0,    0,

			   57,  106,    0,    0,  106,  106,  106,  106,  106,   44,
			  106,  106,  106,   35,   62,   62,  106,  106,  106,  106,
			  106,  106,    0,  121,    0,    0,    0,  117,  118,    0,
			    0,  120,    0,    0,    0,    0,   84,    0,  103,   58,
			  103,   59,  103,  103,   46,  103,    0,  103,  103,  103,
			  103,  103,  103,   87,    0,   52,  103,  103,    0,    0,
			    0,    0,    0,    0,    0,    0,  106,    0,    0,   58,
			  106,   59,  106,  106,   46,  106,  106,  106,  106,  106,
			  106,   52,  106,  106,    0,    0,  107,    0,  118,    0,
			  121,    0,   86,    0,    0,  119,  103,  103,   56,  103,

			   45,    0,   42,   55,   34,  103,   50,    0,  103,  103,
			    0,    0,    0,    0,    0,    0,  106,    0,  106,   56,
			  106,   45,   42,   55,   34,  106,   50,  106,  106,    0,
			    0,  118,    0,    0,    0,    0,   83,  119,  103,  103,
			  103,   92,  103,    0,  103,   53,    0,    0,    0,   65,
			    0,  108,  106,  106,  106,  106,  106,   53,  120,    0,
			  120,    0,    0,    0,    0,   83,  119,  103,  103,   47,
			  103,   91,   51,    0,    0,    0,    0,    0,  106,  106,
			   47,  106,   51,  120,   85,    0,   83,  119,  103,  103,
			  103,   90,   90,   99,    0,  106,  106,  106,    0,    0,

			  103,   49,   48,    0,    0,    0,    0,  106,   49,   48,
			    0,    0,  103,    0,    0,    0,   63,  106,   82,  103,
			    0,    0,    0,  106,    0,    0,   82,  103,    0,    0,
			  106,    0,    0,   54,    0,    0,   54,    0,   81,    0,
			    0,    0,    0,    0,   81,    0,    0,    0,    0,    0,
			    0,    0,   80,   93,   94,    0,    0,    0,   80,    0,
			   80,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 5613
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 763
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 764
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
