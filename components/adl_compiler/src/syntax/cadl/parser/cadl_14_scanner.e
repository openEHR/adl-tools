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

	ADL_2_TERM_CODE_TOOLS
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
--|#line 82 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 82")
end
-- Ignore separators
else
--|#line 83 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 83")
end
in_lineno := in_lineno + text_count
end
else
--|#line 88 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 88")
end
-- Ignore comments
end
else
if yy_act = 4 then
--|#line 89 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 89")
end
in_lineno := in_lineno + 1
else
--|#line 93 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 93")
end
last_token := Minus_code
end
end
else
if yy_act <= 7 then
if yy_act = 6 then
--|#line 94 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 94")
end
last_token := Plus_code
else
--|#line 95 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 95")
end
last_token := Star_code
end
else
if yy_act = 8 then
--|#line 96 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 96")
end
last_token := Slash_code
else
--|#line 97 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 97")
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
--|#line 98 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 98")
end
last_token := Equal_code
else
--|#line 99 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 99")
end
last_token := Dot_code
end
else
--|#line 100 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 100")
end
last_token := Semicolon_code
end
else
if yy_act = 13 then
--|#line 101 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 101")
end
last_token := Comma_code
else
--|#line 102 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 102")
end
last_token := Colon_code
end
end
else
if yy_act <= 16 then
if yy_act = 15 then
--|#line 103 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 103")
end
last_token := Exclamation_code
else
--|#line 104 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 104")
end
last_token := Left_parenthesis_code
end
else
if yy_act = 17 then
--|#line 105 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 105")
end
last_token := Right_parenthesis_code
else
--|#line 106 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 106")
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
--|#line 108 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 108")
end
last_token := Question_mark_code
else
--|#line 110 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 110")
end
last_token := SYM_INTERVAL_DELIM
end
else
--|#line 112 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 112")
end
last_token := Left_bracket_code
end
else
if yy_act = 22 then
--|#line 113 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 113")
end
last_token := Right_bracket_code
else
--|#line 115 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 115")
end
last_token := SYM_START_CBLOCK
end
end
else
if yy_act <= 25 then
if yy_act = 24 then
--|#line 116 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 116")
end
last_token := SYM_END_CBLOCK
else
--|#line 118 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 118")
end
last_token := SYM_GE
end
else
if yy_act = 26 then
--|#line 119 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 119")
end
last_token := SYM_LE
else
--|#line 120 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 120")
end
last_token := SYM_NE
end
end
end
else
if yy_act <= 31 then
if yy_act <= 29 then
if yy_act = 28 then
--|#line 122 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 122")
end
last_token := SYM_LT
else
--|#line 123 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 123")
end
last_token := SYM_GT
end
else
if yy_act = 30 then
--|#line 125 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 125")
end
last_token := SYM_MODULO
else
--|#line 126 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 126")
end
last_token := SYM_DIV
end
end
else
if yy_act <= 33 then
if yy_act = 32 then
--|#line 128 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 128")
end
last_token := SYM_ELLIPSIS
else
--|#line 129 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 129")
end
last_token := SYM_LIST_CONTINUE
end
else
if yy_act = 34 then
--|#line 133 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 133")
end
last_token := SYM_MATCHES
else
--|#line 135 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 135")
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
--|#line 139 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 139")
end
last_token := SYM_THEN
else
--|#line 141 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 141")
end
last_token := SYM_ELSE
end
else
--|#line 143 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 143")
end
last_token := SYM_AND
end
else
if yy_act = 39 then
--|#line 145 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 145")
end
last_token := SYM_OR
else
--|#line 147 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 147")
end
last_token := SYM_XOR
end
end
else
if yy_act <= 42 then
if yy_act = 41 then
--|#line 149 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 149")
end
last_token := SYM_NOT
else
--|#line 151 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 151")
end
last_token := SYM_IMPLIES
end
else
if yy_act = 43 then
--|#line 153 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 153")
end
last_token := SYM_TRUE
else
--|#line 155 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 155")
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
--|#line 157 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 157")
end
last_token := SYM_FORALL
else
--|#line 159 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 159")
end
last_token := SYM_EXISTS
end
else
--|#line 163 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 163")
end
last_token := SYM_EXISTENCE
end
else
if yy_act = 48 then
--|#line 165 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 165")
end
last_token := SYM_OCCURRENCES
else
--|#line 167 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 167")
end
last_token := SYM_CARDINALITY
end
end
else
if yy_act <= 51 then
if yy_act = 50 then
--|#line 169 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 169")
end
last_token := SYM_ORDERED
else
--|#line 171 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 171")
end
last_token := SYM_UNORDERED
end
else
if yy_act = 52 then
--|#line 173 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 173")
end
last_token := SYM_UNIQUE
else
--|#line 175 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 175")
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
--|#line 177 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 177")
end
last_token := SYM_ALLOW_ARCHETYPE
else
--|#line 179 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 179")
end
last_token := SYM_INCLUDE
end
else
--|#line 181 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 181")
end
last_token := SYM_EXCLUDE
end
else
if yy_act = 57 then
--|#line 183 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 183")
end
last_token := SYM_AFTER
else
--|#line 185 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 185")
end
last_token := SYM_BEFORE
end
end
else
if yy_act <= 60 then
if yy_act = 59 then
--|#line 187 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 187")
end
last_token := SYM_CLOSED
else
--|#line 191 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 191")
end

		last_token := V_ROOT_ID_CODE
		last_string_value := text_substring (2, text_count - 1)

end
else
if yy_act = 61 then
--|#line 197 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 197")
end

		last_token := V_ID_CODE
		last_string_value := text_substring (2, text_count - 1)

else
--|#line 204 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 204")
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
--|#line 213 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 213")
end

		str_ := text_substring (2, text_count - 1)
		last_string_value := str_.substring (str_.substring_index ("::", 1) + 2, str_.count)
		last_token := V_REUSED_ID_CODE

else
--|#line 221 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 221")
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
--|#line 780 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 780")
end
terminate
when 1 then
--|#line 761 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 761")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)

when 4 then
--|#line 310 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 310")
end
	-- Catch-all rules (no backing up)
			last_token := ERR_VALUE_SET_DEF
			set_start_condition (INITIAL)

when 5 then
--|#line 403 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 403")
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
			   14,   76,   85,  108,   85,   77,   76,   89,   89,  214,

			   77,   92,   93,  197,   92,   92,   93,  102,   92,  102,
			  102,  209,  123,  123,   94,  123,  748,  112,   94,  113,
			  113,  113,  113,  113,  113,  297,  705,  297,   86,   87,
			   86,   87,  123,  123,  205,  123,  125,  158,  109,  747,
			  226,  731,   78,  226,  129,  159,  160,   78,  210,  211,
			  198,   90,   90,  215,  730,  226,  125,   95,  226,  500,
			  196,   95,  196,  196,  102,   96,  102,  102,  706,   96,
			  206,  207,  129,  301,   79,   80,   81,   82,   83,   79,
			   80,   81,   82,   83,   97,   98,   99,   97,   98,   97,
			   97,   97,   97,   97,   97,   97,   97,   97,  100,  101,

			   97,  101,  101,  101,  101,  101,  101,   97,   97,   97,
			   97,   97,   97,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,   97,   97,   97,   97,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,   97,   97,   97,   97,   97,   97,   97,
			   97,   97,   97,   97,  116,  195,  117,  248,  118,  118,
			  118,  118,  118,  118,  116,  297,  117,  195,  120,  120,
			  120,  120,  120,  120,  220,  123,  123,  220,  123,  700,

			  163,  123,  123,  163,  123,  212,  123,  123,  164,  123,
			  696,  123,  123,  249,  123,  230,  531,  119,  230,  125,
			  123,  123,  300,  123,  165,  125,  677,  119,  126,  130,
			  125,  195,  127,  232,  128,  125,  232,  163,  131,  134,
			  163,  206,  207,  132,  125,  164,  123,  123,  651,  123,
			  221,  135,  165,  200,  133,  136,  126,  130,  222,  297,
			  127,  195,  128,  199,  199,  199,  131,  134,  649,  171,
			  125,  132,  123,  123,  443,  123,  648,  123,  123,  135,
			  123,  636,  133,  136,  137,  138,  123,  123,  170,  123,
			  139,  123,  123,  209,  123,  417,  125,  171,  214,  163,

			  140,  125,  163,  123,  123,  205,  123,  164,  202,  202,
			  125,  339,  137,  138,  165,  125,  142,  141,  139,  250,
			  250,  250,  250,  250,  250,  248,  151,  125,  140,  143,
			  210,  211,  123,  123,  152,  123,  165,  201,  201,  201,
			  615,  206,  207,  155,  142,  141,  123,  123,  297,  123,
			  170,  195,  215,  609,  151,  341,  125,  143,  123,  123,
			  459,  123,  152,  195,  535,  535,  166,  189,  195,  450,
			  125,  155,  190,  144,  145,  145,  145,  145,  145,  145,
			  539,  156,  125,  163,  298,  153,  163,  166,  433,  146,
			  154,  164,  210,  211,  166,  189,  147,  569,  165,  299,

			  190,  123,  123,  148,  123,  149,  567,  150,  196,  156,
			  196,  196,  243,  153,  243,  243,  167,  146,  154,  212,
			  168,  119,  169,  163,  147,  256,  163,  203,  203,  203,
			  548,  164,  165,  149,  170,  150,  570,  445,  165,  163,
			  445,  200,  163,  116,  167,  202,  202,  164,  168,  163,
			  169,  172,  163,  297,  165,  206,  207,  164,  163,  501,
			  173,  163,  123,  123,  165,  123,  164,  163,  418,  229,
			  163,  195,  229,  165,  170,  164,  174,  176,  374,  172,
			  220,  230,  165,  220,  452,  348,  125,  175,  173,  177,
			  170,  163,  232,  178,  163,  183,  566,  348,  447,  164,

			  170,  447,  340,  421,  174,  176,  165,  123,  123,  170,
			  123,  163,  410,  410,  163,  175,  410,  177,  170,  164,
			  374,  178,  233,  183,  163,  163,  165,  163,  163,  179,
			  180,  125,  164,  164,  385,  181,  221,  364,  163,  165,
			  165,  163,  170,  765,  222,  385,  164,  199,  199,  199,
			  182,  184,  258,  165,  185,  385,  163,  179,  180,  163,
			  187,  358,  170,  181,  164,  195,  492,  186,  188,  123,
			  123,  165,  123,  385,  229,  170,  170,  229,  191,  184,
			  258,  195,  185,  712,  712,  712,  230,  231,  187,  170,
			  493,  349,  348,  125,  349,  186,  188,  232,  297,  245,

			  245,  245,  245,  245,  245,  192,  191,  170,  123,  123,
			  357,  123,  116,  264,  117,  246,  253,  253,  253,  253,
			  253,  253,  254,  350,  348,  356,  350,  233,  355,  494,
			  269,  352,  125,  192,  217,  217,  495,  217,  247,  495,
			  236,  264,  228,  246,  332,  333,  334,  335,  336,  237,
			  237,  237,  237,  237,  237,  119,  195,  199,  199,  199,
			  218,  563,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  238,  251,  251,  251,  251,
			  251,  251,  255,  255,  255,  255,  255,  255,  123,  123,

			  239,  123,  252,  116,  240,  117,  241,  253,  253,  253,
			  253,  253,  253,  343,  219,  246,  123,  123,  223,  123,
			  123,  123,  125,  123,  123,  123,  587,  123,  123,  123,
			  252,  123,  337,  337,  337,  259,  123,  123,  247,  123,
			  125,  635,  563,  246,  125,  563,  119,  260,  125,  225,
			  614,  225,  125,  261,  123,  123,  765,  123,  123,  123,
			  125,  123,  339,  259,  368,  588,  265,  262,  263,  635,
			  340,  339,  266,  123,  123,  260,  123,  163,  125,  195,
			  163,  261,  125,  123,  123,  164,  123,  123,  123,  307,
			  123,  267,  165,  302,  265,  262,  263,  125,  496,  162,

			  266,  268,  123,  123,  652,  123,  297,  125,  297,  123,
			  123,  125,  123,  271,  270,  123,  123,  277,  123,  267,
			  123,  123,  244,  123,  123,  123,  125,  123,  170,  268,
			  243,  242,  273,  125,  235,  123,  123,  497,  123,  125,
			  106,  271,  270,  653,  125,  275,  123,  123,  125,  123,
			  144,  276,  123,  123,  274,  123,  294,  272,  103,  125,
			  273,  144,  228,  123,  123,  717,  123,  715,  123,  123,
			  125,  123,  225,  275,  225,  715,  125,  146,  144,  276,
			  284,  224,  274,  278,  294,  278,  765,  125,  715,  223,
			  603,  284,  125,  149,  146,  124,  124,  124,  124,  124, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  124,  296,  279,  715,  718,  146,  280,  603,  284,  281,
			  643,  603,  123,  123,  291,  123,  124,  195,  282,  193,
			  283,  149,  146,  162,  284,  122,  121,  643,  124,  296,
			  279,  643,  474,  195,  280,  603,  125,  281,  123,  123,
			  487,  123,  291,  474,  289,  114,  282,  290,  283,  123,
			  123,  487,  123,  474,  111,  643,  124,  123,  123,  106,
			  123,  487,  125,  104,  144,  285,  285,  285,  285,  285,
			  285,  474,  289,  125,  292,  290,  103,  765,  293,  487,
			  163,  125,  163,  163,  286,  163,  163,  287,  164,  163,
			  164,  765,  765,  288,  164,  165,  195,  165,  765,  765,

			  295,  165,  292,  765,  765,  163,  293,  765,  163,  338,
			  338,  338,  286,  164,  716,  287,  765,  306,  765,  305,
			  165,  288,  716,  765,  163,  304,  163,  163,  295,  163,
			  765,  170,  164,  170,  164,  716,  765,  170,  308,  165,
			  163,  165,  765,  163,  765,  306,  163,  305,  164,  163,
			  716,  765,  765,  304,  164,  165,  170,  342,  342,  765,
			  342,  165,  765,  195,  765,  765,  308,  309,  342,  342,
			  311,  342,  199,  199,  199,  170,  312,  170,  163,  765,
			  310,  163,  313,  218,  163,  765,  164,  163,  303,  303,
			  303,  170,  164,  165,  765,  309,  765,  170,  311,  165,

			  765,  765,  765,  163,  312,  765,  163,  765,  310,  163,
			  313,  164,  163,  163,  195,  314,  163,  164,  165,  765,
			  765,  164,  765,  163,  165,  269,  163,  315,  165,  170,
			  765,  164,  765,  242,  242,  170,  242,  722,  165,  201,
			  201,  201,  765,  314,  163,  722,  765,  163,  163,  765,
			  316,  163,  164,  317,  170,  315,  164,  359,  722,  165,
			  170,  765,  765,  165,  170,  765,  195,  163,  318,  765,
			  163,  765,  765,  722,  170,  164,  765,  765,  316,  765,
			  765,  317,  165,  319,  320,  320,  320,  320,  320,  321,
			  203,  203,  203,  322,  163,  170,  765,  163,  163,  170,

			  163,  163,  164,  163,  163,  765,  164,  163,  164,  165,
			  765,  765,  164,  165,  765,  165,  765,  321,  170,  165,
			  163,  322,  163,  163,  323,  163,  765,  765,  164,  324,
			  164,  163,  325,  163,  163,  165,  163,  165,  765,  164,
			  765,  164,  199,  199,  199,  170,  165,  765,  165,  170,
			  326,  170,  323,  723,  765,  170,  229,  324,  327,  229,
			  325,  723,  328,  329,  123,  123,  765,  123,  230,  331,
			  765,  170,  765,  170,  723,  765,  330,  765,  326,  232,
			  195,  765,  170,  765,  170,  765,  327,  765,  125,  723,
			  328,  329,  372,  372,  372,  372,  372,  331,  344,  345,

			  345,  345,  345,  345,  330,  217,  217,  229,  217,  233,
			  229,  353,  354,  354,  354,  354,  354,  354,  361,  230,
			  361,  765,  765,  362,  362,  362,  362,  362,  362,  765,
			  232,  218,  765,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  199,  199,  199,  765,
			  233,  360,  360,  360,  360,  360,  360,  363,  363,  363,
			  363,  363,  363,  663,  663,  663,  663,  246,  365,  365,
			  365,  365,  365,  365,  765,  219,  346,  347,  348,  346,
			  347,  346,  346,  346,  346,  346,  346,  346,  346,  349,

			  247,  765,  346,  765,  765,  246,  765,  765,  765,  346,
			  350,  346,  346,  346,  346,  366,  366,  366,  366,  366,
			  366,  373,  373,  373,  373,  373,  373,  369,  765,  369,
			  765,  367,  370,  370,  370,  370,  370,  370,  346,  346,
			  351,  346,  116,  765,  117,  765,  371,  371,  371,  371,
			  371,  371,  123,  123,  368,  123,  765,  123,  123,  367,
			  123,  765,  765,  765,  765,  346,  346,  346,  346,  346,
			  346,  346,  346,  346,  346,  346,  125,  123,  123,  765,
			  123,  125,  765,  765,  375,  119,  765,  123,  123,  645,
			  123,  123,  123,  765,  123,  123,  123,  376,  123,  123,

			  123,  125,  123,  765,  123,  123,  645,  123,  765,  765,
			  645,  125,  375,  123,  123,  125,  123,  377,  378,  125,
			  765,  347,  348,  125,  347,  376,  673,  380,  125,  123,
			  123,  765,  123,  349,  645,  379,  381,  125,  123,  123,
			  765,  123,  765,  673,  350,  377,  378,  673,  382,  123,
			  123,  765,  123,  125,  765,  380,  765,  383,  123,  123,
			  765,  123,  125,  379,  381,  123,  123,  765,  123,  123,
			  123,  673,  123,  125,  351,  386,  382,  765,  123,  123,
			  765,  123,  125,  765,  384,  383,  387,  123,  123,  125,
			  123,  765,  765,  125,  388,  389,  392,  392,  392,  392,

			  392,  392,  125,  386,  536,  726,  536,  726,  765,  123,
			  123,  125,  123,  765,  387,  537,  727,  123,  123,  391,
			  123,  765,  388,  389,  390,  393,  393,  393,  393,  393,
			  393,  765,  144,  125,  596,  596,  596,  596,  596,  123,
			  123,  125,  123,  538,  728,  765,  765,  391,  123,  123,
			  765,  123,  390,  765,  394,  395,  395,  395,  395,  395,
			  395,  765,  765,  125,  396,  396,  396,  396,  396,  396,
			  123,  123,  125,  123,  765,  665,  666,  665,  666,  123,
			  123,  765,  123,  765,  765,  765,  397,  397,  397,  397,
			  397,  397,  765,  394,  125,  398,  398,  398,  398,  398,

			  398,  765,  765,  125,  124,  124,  124,  124,  124,  124,
			  399,  765,  399,  765,  667,  394,  124,  124,  124,  124,
			  124,  124,  123,  123,  394,  123,  123,  123,  765,  123,
			  765,  123,  123,  400,  123,  124,  401,  144,  123,  123,
			  765,  123,  402,  765,  123,  123,  125,  123,  123,  123,
			  125,  123,  675,  404,  765,  125,  675,  123,  123,  765,
			  123,  400,  125,  124,  401,  403,  288,  765,  125,  765,
			  402,  765,  125,  675,  123,  123,  405,  123,  765,  765,
			  406,  125,  123,  123,  675,  123,  765,  123,  123,  765,
			  123,  407,  765,  403,  288,  676,  765,  693,  125,  676,

			  765,  693,  163,  765,  405,  163,  125,  765,  406,  765,
			  164,  125,  408,  765,  765,  765,  676,  165,  693,  407,
			  411,  412,  412,  412,  412,  412,  297,  676,  765,  693,
			  413,  409,  413,  413,  413,  413,  413,  413,  297,  414,
			  415,  416,  416,  416,  416,  297,  163,  163,  163,  163,
			  163,  163,  765,  170,  164,  164,  164,  123,  123,  409,
			  123,  165,  165,  165,  765,  765,  765,  163,  765,  163,
			  163,  163,  163,  765,  163,  164,  765,  164,  419,  164,
			  765,  125,  165,  765,  165,  765,  165,  420,  422,  123,
			  123,  765,  123,  163,  765,  765,  163,  170,  170,  170, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  423,  164,  163,  425,  163,  163,  419,  163,  165,  115,
			  164,  424,  164,  125,  765,  420,  422,  165,  170,  165,
			  170,  469,  170,  115,  115,  115,  163,  765,  423,  163,
			  426,  425,  163,  765,  164,  163,  765,  765,  765,  424,
			  164,  165,  163,  765,  170,  163,  427,  165,  428,  469,
			  164,  163,  765,  170,  163,  170,  765,  165,  426,  164,
			  362,  362,  362,  362,  362,  362,  165,  765,  765,  430,
			  163,  556,  765,  163,  427,  765,  428,  170,  164,  431,
			  765,  429,  556,  170,  433,  165,  163,  432,  163,  163,
			  765,  163,  556,  170,  164,  765,  164,  430,  765,  765,

			  765,  165,  170,  165,  765,  765,  765,  431,  163,  765,
			  556,  163,  765,  765,  765,  432,  164,  765,  434,  765,
			  765,  170,  433,  165,  320,  320,  320,  320,  320,  320,
			  163,  651,  163,  163,  651,  163,  765,  170,  164,  170,
			  164,  758,  759,  758,  759,  165,  434,  165,  163,  765,
			  163,  163,  163,  163,  163,  163,  164,  163,  164,  170,
			  164,  765,  164,  165,  436,  165,  765,  165,  560,  165,
			  451,  451,  451,  451,  451,  451,  435,  765,  765,  560,
			  760,  170,  438,  170,  492,  163,  765,  437,  163,  561,
			  765,  765,  436,  164,  439,  678,  765,  440,  765,  170,

			  165,  170,  765,  170,  435,  170,  163,  560,  765,  163,
			  438,  765,  765,  765,  164,  437,  163,  612,  765,  163,
			  444,  165,  439,  444,  164,  440,  765,  765,  612,  765,
			  444,  165,  445,  444,  446,  765,  170,  765,  613,  765,
			  441,  765,  445,  447,  446,  765,  345,  345,  345,  345,
			  345,  345,  765,  447,  765,  765,  612,  170,  353,  354,
			  354,  354,  354,  354,  354,  442,  765,  170,  123,  123,
			  765,  123,  765,  448,  449,  449,  449,  449,  449,  449,
			  765,  765,  765,  448,  453,  453,  453,  453,  453,  453,
			  765,  765,  125,  442,  454,  454,  454,  454,  454,  454,

			  457,  457,  457,  457,  457,  457,  765,  477,  765,  455,
			  367,  455,  765,  450,  456,  456,  456,  456,  456,  456,
			  370,  370,  370,  370,  370,  370,  458,  458,  458,  458,
			  458,  458,  765,  368,  765,  477,  460,  461,  367,  462,
			  462,  462,  462,  462,  462,  463,  463,  463,  463,  463,
			  463,  464,  464,  464,  464,  464,  464,  123,  123,  765,
			  123,  123,  123,  765,  123,  459,  123,  123,  765,  123,
			  123,  123,  765,  123,  123,  123,  765,  123,  751,  123,
			  123,  125,  123,  123,  123,  125,  123,  765,  123,  123,
			  125,  123,  765,  765,  125,  751,  765,  765,  125,  751,

			  465,  123,  123,  125,  123,  765,  468,  125,  466,  467,
			  765,  765,  125,  765,  752,  472,  473,  765,  123,  123,
			  470,  123,  765,  751,  471,  125,  123,  123,  465,  123,
			  765,  752,  765,  765,  468,  752,  466,  467,  123,  123,
			  765,  123,  125,  472,  473,  765,  765,  476,  470,  765,
			  125,  765,  471,  765,  475,  123,  123,  765,  123,  752,
			  765,  478,  125,  392,  392,  392,  392,  392,  392,  124,
			  123,  123,  124,  123,  765,  476,  765,  765,  124,  125,
			  765,  479,  475,  398,  398,  398,  398,  398,  398,  478,
			  765,  481,  765,  765,  125,  765,  765,  124,  480,  765,

			  124,  734,  734,  734,  734,  734,  124,  765,  765,  479,
			  484,  484,  484,  484,  484,  484,  124,  765,  765,  481,
			  395,  395,  395,  395,  395,  395,  480,  393,  393,  393,
			  393,  393,  393,  396,  396,  396,  396,  396,  396,  124,
			  765,  694,  124,  765,  124,  694,  765,  765,  279,  482,
			  485,  485,  485,  485,  485,  485,  123,  123,  124,  123,
			  124,  613,  694,  765,  282,  124,  765,  124,  765,  765,
			  124,  765,  613,  694,  765,  765,  279,  482,  123,  123,
			  125,  123,  613,  765,  765,  765,  124,  765,  124,  765,
			  765,  765,  282,  124,  397,  397,  397,  397,  397,  397,

			  613,  765,  125,  486,  486,  486,  486,  486,  486,  483,
			  123,  123,  765,  123,  123,  123,  765,  123,  124,  123,
			  123,  765,  123,  123,  123,  493,  123,  412,  412,  412,
			  412,  412,  412,  297,  125,  765,  491,  483,  125,  765,
			  765,  765,  765,  125,  765,  489,  124,  125,  504,  505,
			  505,  505,  505,  505,  765,  765,  488,  765,  490,  123,
			  123,  765,  123,  413,  494,  413,  413,  413,  413,  413,
			  413,  297,  498,  489,  416,  416,  416,  416,  416,  416,
			  297,  765,  765,  125,  488,  496,  490,  416,  416,  416,
			  416,  416,  416,  297,  765,  163,  765,  163,  163,  765,

			  163,  765,  495,  164,  765,  164,  163,  765,  765,  163,
			  165,  499,  165,  765,  164,  765,  765,  163,  765,  163,
			  163,  165,  163,  765,  497,  164,  765,  164,  765,  765,
			  765,  765,  165,  765,  165,  765,  765,  163,  502,  163,
			  163,  765,  163,  765,  503,  164,  170,  164,  170,  506,
			  765,  508,  165,  507,  165,  444,  163,  170,  444,  163,
			  765,  765,  765,  765,  164,  765,  502,  445,  170,  765,
			  170,  165,  503,  765,  765,  765,  765,  506,  447,  508,
			  765,  507,  765,  163,  163,  509,  163,  163,  170,  736,
			  170,  164,  164,  765,  163,  765,  765,  163,  165,  165,

			  736,  510,  164,  163,  765,  765,  163,  170,  448,  165,
			  736,  164,  512,  509,  765,  511,  163,  163,  165,  163,
			  163,  765,  765,  765,  164,  164,  737,  765,  736,  510,
			  513,  165,  165,  163,  170,  170,  163,  737,  765,  765,
			  512,  164,  765,  511,  765,  170,  765,  737,  165,  514,
			  765,  765,  518,  765,  170,  515,  765,  765,  513,  516,
			  517,  517,  517,  517,  517,  737,  163,  170,  170,  163,
			  163,  765,  765,  163,  164,  765,  519,  514,  164,  163,
			  518,  165,  163,  515,  170,  165,  765,  164,  163,  765,
			  163,  163,  163,  163,  165,  163,  164,  741,  164,  744,

			  164,  744,  765,  165,  519,  165,  765,  165,  741,  520,
			  745,  765,  163,  765,  765,  163,  765,  170,  741,  765,
			  164,  170,  765,  522,  765,  491,  765,  165,  765,  523,
			  170,  765,  123,  123,  521,  123,  741,  520,  746,  170,
			  765,  170,  765,  170,  344,  524,  524,  524,  524,  524,
			  765,  522,  765,  765,  765,  765,  125,  523,  765,  765,
			  765,  765,  521,  170,  525,  525,  525,  525,  525,  525,
			  526,  526,  526,  526,  526,  526,  360,  360,  360,  360,
			  360,  360,  527,  528,  528,  528,  528,  528,  529,  529,
			  529,  529,  529,  529,  456,  456,  456,  456,  456,  456, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  765,  765,  765,  450,  367,  530,  530,  530,  530,  530,
			  530,  532,  532,  532,  532,  532,  532,  533,  533,  533,
			  533,  533,  533,  765,  765,  765,  765,  368,  123,  123,
			  765,  123,  367,  534,  534,  534,  534,  534,  534,  123,
			  123,  765,  123,  765,  531,  529,  529,  529,  529,  529,
			  529,  765,  125,  765,  765,  461,  459,  462,  462,  462,
			  462,  462,  462,  125,  123,  123,  765,  123,  765,  123,
			  123,  541,  123,  123,  123,  765,  123,  123,  123,  765,
			  123,  123,  123,  540,  123,  755,  123,  123,  125,  123,
			  765,  123,  123,  125,  123,  123,  123,  125,  123,  541,

			  543,  125,  755,  542,  544,  125,  755,  765,  765,  545,
			  125,  123,  123,  765,  123,  125,  765,  550,  547,  125,
			  765,  546,  765,  549,  123,  123,  765,  123,  543,  742,
			  755,  542,  544,  123,  123,  125,  123,  545,  765,  765,
			  742,  765,  765,  551,  765,  550,  547,  765,  125,  546,
			  742,  549,  123,  123,  765,  123,  765,  125,  554,  554,
			  554,  554,  554,  554,  765,  553,  765,  552,  742,  765,
			  765,  551,  765,  124,  765,  765,  125,  484,  484,  484,
			  484,  484,  484,  765,  765,  486,  486,  486,  486,  486,
			  486,  123,  123,  553,  123,  552,  765,  394,  765,  765,

			  765,  124,  765,  765,  765,  555,  765,  124,  123,  123,
			  765,  123,  765,  123,  123,  125,  123,  586,  586,  586,
			  586,  586,  586,  557,  411,  562,  562,  562,  562,  562,
			  297,  765,  125,  555,  399,  124,  399,  125,  485,  485,
			  485,  485,  485,  485,  765,  558,  123,  123,  559,  123,
			  765,  557,  765,  124,  123,  123,  765,  123,  765,  163,
			  401,  765,  163,  765,  765,  765,  402,  164,  765,  163,
			  125,  765,  163,  558,  165,  765,  559,  164,  125,  765,
			  765,  124,  765,  765,  165,  765,  765,  765,  401,  750,
			  750,  750,  750,  750,  402,  414,  564,  564,  564,  564,

			  564,  297,  414,  565,  564,  564,  564,  564,  297,  569,
			  170,  505,  505,  505,  505,  505,  505,  765,  163,  163,
			  170,  163,  163,  765,  568,  765,  164,  164,  163,  163,
			  765,  163,  163,  165,  165,  765,  164,  164,  163,  163,
			  765,  163,  163,  165,  165,  765,  164,  164,  570,  765,
			  571,  765,  765,  165,  165,  765,  765,  765,  572,  573,
			  574,  433,  765,  517,  517,  517,  517,  517,  517,  170,
			  170,  575,  591,  591,  591,  591,  591,  591,  571,  170,
			  170,  123,  123,  576,  123,  765,  572,  573,  574,  170,
			  170,  765,  163,  163,  765,  163,  163,  765,  765,  575,

			  164,  164,  765,  765,  765,  125,  765,  165,  165,  163,
			  765,  576,  163,  163,  756,  163,  163,  164,  163,  163,
			  765,  164,  163,  164,  165,  578,  765,  164,  165,  577,
			  165,  756,  765,  163,  165,  756,  163,  765,  765,  765,
			  579,  164,  765,  170,  170,  765,  163,  580,  165,  163,
			  765,  765,  765,  578,  164,  765,  765,  577,  765,  756,
			  170,  165,  581,  765,  170,  582,  170,  765,  579,  765,
			  170,  163,  765,  163,  163,  580,  163,  765,  583,  164,
			  765,  164,  765,  765,  170,  765,  165,  765,  165,  765,
			  581,  765,  765,  582,  765,  765,  765,  170,  444,  765,

			  765,  444,  765,  584,  765,  765,  583,  765,  765,  765,
			  445,  765,  446,  585,  524,  524,  524,  524,  524,  524,
			  765,  447,  170,  587,  170,  528,  528,  528,  528,  528,
			  528,  584,  529,  529,  529,  529,  529,  529,  765,  765,
			  765,  585,  590,  590,  590,  590,  590,  590,  589,  765,
			  765,  448,  592,  592,  592,  592,  592,  592,  765,  765,
			  765,  765,  588,  593,  593,  593,  593,  593,  593,  594,
			  594,  594,  594,  594,  594,  765,  589,  123,  123,  765,
			  123,  531,  595,  595,  595,  595,  595,  595,  597,  597,
			  597,  597,  597,  597,  123,  123,  765,  123,  765,  123,

			  123,  125,  123,  765,  252,  598,  123,  123,  765,  123,
			  123,  123,  765,  123,  123,  123,  765,  123,  125,  765,
			  765,  765,  599,  125,  123,  123,  765,  123,  765,  765,
			  125,  600,  252,  598,  125,  765,  123,  123,  125,  123,
			  123,  123,  765,  123,  765,  601,  163,  602,  125,  163,
			  599,  765,  123,  123,  164,  123,  605,  765,  604,  600,
			  125,  165,  765,  765,  125,  616,  617,  617,  617,  617,
			  617,  765,  607,  601,  765,  602,  125,  765,  123,  123,
			  606,  123,  765,  608,  605,  278,  604,  278,  765,  554,
			  554,  554,  554,  554,  554,  123,  123,  170,  123,  765,

			  607,  765,  125,  765,  124,  765,  123,  123,  606,  123,
			  493,  608,  562,  562,  562,  562,  562,  562,  297,  125,
			  496,  765,  564,  564,  564,  564,  564,  564,  297,  765,
			  125,  765,  124,  123,  123,  765,  123,  611,  610,  498,
			  765,  564,  564,  564,  564,  564,  564,  297,  163,  494,
			  765,  163,  765,  765,  765,  765,  164,  125,  765,  497,
			  765,  123,  123,  165,  123,  611,  610,  504,  619,  619,
			  619,  619,  619,  765,  163,  765,  618,  163,  499,  765,
			  163,  765,  164,  163,  765,  125,  765,  765,  164,  165,
			  163,  642,  765,  163,  765,  165,  765,  765,  164,  170,

			  163,  765,  620,  163,  618,  165,  163,  765,  164,  163,
			  123,  123,  765,  123,  164,  165,  765,  765,  765,  642,
			  163,  165,  621,  163,  765,  170,  765,  765,  164,  163,
			  620,  170,  163,  765,  125,  165,  765,  164,  765,  622,
			  163,  170,  765,  163,  165,  765,  163,  765,  164,  163,
			  621,  170,  765,  640,  164,  165,  765,  170,  765,  765,
			  163,  165,  765,  163,  624,  765,  623,  622,  164,  765,
			  163,  170,  625,  163,  163,  165,  765,  163,  164,  765,
			  170,  640,  164,  123,  123,  165,  123,  765,  765,  165,
			  626,  170,  624,  163,  623,  163,  163,  170,  163,  765,

			  625,  164,  627,  164,  765,  628,  765,  125,  165,  765,
			  165,  170,  525,  525,  525,  525,  525,  525,  626,  765,
			  765,  170,  765,  765,  765,  170,  630,  765,  765,  765,
			  627,  765,  765,  628,  765,  765,  629,  527,  631,  631,
			  631,  631,  631,  632,  170,  632,  170,  765,  633,  633,
			  633,  633,  633,  633,  630,  633,  633,  633,  633,  633,
			  633,  765,  765,  765,  629,  634,  634,  634,  634,  634,
			  634,  533,  533,  533,  533,  533,  533,  637,  637,  637,
			  637,  637,  637,  638,  638,  638,  638,  638,  638,  123,
			  123,  765,  123,  765,  531,  639,  639,  639,  639,  639, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  639,  123,  123,  765,  123,  123,  123,  765,  123,  123,
			  123,  635,  123,  125,  123,  123,  765,  123,  123,  123,
			  765,  123,  765,  765,  765,  125,  641,  123,  123,  125,
			  123,  765,  765,  125,  368,  765,  765,  765,  125,  635,
			  123,  123,  125,  123,  765,  765,  765,  163,  765,  765,
			  163,  125,  765,  644,  641,  164,  765,  765,  765,  646,
			  765,  765,  165,  652,  125,  617,  617,  617,  617,  617,
			  617,  569,  647,  619,  619,  619,  619,  619,  619,  765,
			  163,  644,  765,  163,  765,  765,  163,  646,  164,  163,
			  654,  765,  765,  765,  164,  165,  163,  765,  170,  163,

			  647,  165,  653,  765,  164,  163,  163,  765,  163,  163,
			  570,  165,  765,  164,  164,  765,  765,  655,  654,  163,
			  165,  165,  163,  765,  765,  163,  656,  164,  163,  123,
			  123,  170,  123,  164,  165,  163,  163,  170,  163,  163,
			  165,  765,  765,  164,  164,  655,  765,  170,  765,  765,
			  165,  165,  163,  125,  656,  163,  170,  170,  163,  765,
			  164,  163,  765,  765,  765,  765,  164,  165,  765,  765,
			  170,  765,  765,  165,  657,  587,  170,  631,  631,  631,
			  631,  631,  631,  765,  658,  765,  170,  170,  765,  765,
			  659,  633,  633,  633,  633,  633,  633,  765,  765,  765,

			  765,  765,  657,  170,  765,  765,  765,  765,  765,  170,
			  123,  123,  658,  123,  588,  765,  765,  765,  659,  633,
			  633,  633,  633,  633,  633,  660,  660,  660,  660,  660,
			  660,  661,  765,  661,  125,  765,  662,  662,  662,  662,
			  662,  662,  664,  664,  664,  664,  664,  664,  668,  668,
			  668,  668,  668,  668,  123,  123,  765,  123,  123,  123,
			  765,  123,  765,  765,  635,  123,  123,  765,  123,  123,
			  123,  765,  123,  163,  123,  123,  163,  123,  125,  765,
			  765,  164,  125,  765,  669,  765,  765,  368,  165,  125,
			  765,  765,  635,  125,  670,  765,  765,  671,  125,  672,

			  765,  765,  765,  680,  765,  674,  616,  679,  679,  679,
			  679,  679,  669,  163,  765,  163,  163,  765,  163,  765,
			  765,  164,  670,  164,  170,  671,  765,  672,  165,  163,
			  165,  680,  163,  674,  765,  765,  765,  164,  163,  765,
			  163,  163,  163,  163,  165,  163,  164,  682,  164,  681,
			  164,  765,  765,  165,  765,  165,  765,  165,  765,  683,
			  765,  765,  765,  765,  170,  765,  170,  765,  765,  684,
			  123,  123,  765,  123,  765,  682,  765,  681,  765,  765,
			  170,  662,  662,  662,  662,  662,  662,  683,  765,  170,
			  765,  170,  765,  170,  125,  765,  765,  684,  685,  685,

			  685,  685,  685,  685,  686,  686,  686,  686,  686,  686,
			  538,  538,  538,  538,  538,  538,  687,  687,  687,  687,
			  687,  687,  688,  688,  688,  688,  688,  688,  689,  689,
			  689,  689,  689,  689,  765,  123,  123,  531,  123,  123,
			  123,  765,  123,  765,  635,  123,  123,  765,  123,  677,
			  677,  652,  677,  679,  679,  679,  679,  679,  679,  125,
			  765,  123,  123,  125,  123,  765,  765,  368,  163,  125,
			  690,  163,  635,  695,  765,  765,  164,  692,  163,  163,
			  765,  163,  163,  165,  691,  125,  164,  164,  765,  163,
			  653,  765,  163,  165,  165,  765,  765,  164,  690,  765,

			  765,  765,  765,  697,  165,  692,  765,  765,  765,  765,
			  703,  699,  691,  660,  660,  660,  660,  660,  660,  170,
			  765,  765,  765,  698,  765,  123,  123,  765,  123,  170,
			  170,  697,  701,  701,  701,  701,  701,  701,  703,  699,
			  170,  689,  689,  689,  689,  689,  689,  765,  665,  125,
			  665,  698,  531,  688,  688,  688,  688,  688,  688,  123,
			  123,  765,  123,  707,  708,  708,  708,  708,  708,  704,
			  163,  163,  765,  163,  163,  765,  765,  765,  164,  164,
			  765,  163,  765,  125,  163,  165,  165,  667,  765,  164,
			  765,  702,  123,  123,  765,  123,  165,  704,  765,  765,

			  765,  765,  709,  713,  713,  713,  713,  713,  713,  123,
			  123,  765,  123,  765,  123,  123,  125,  123,  765,  702,
			  710,  170,  170,  765,  765,  711,  765,  765,  765,  765,
			  709,  765,  170,  125,  765,  765,  765,  714,  125,  717,
			  765,  708,  708,  708,  708,  708,  708,  163,  710,  163,
			  163,  163,  163,  711,  163,  164,  765,  164,  765,  164,
			  765,  765,  165,  765,  165,  714,  165,  720,  720,  720,
			  720,  720,  720,  123,  123,  765,  123,  765,  718,  667,
			  667,  667,  667,  667,  667,  707,  724,  724,  724,  724,
			  724,  163,  719,  765,  163,  765,  765,  125,  170,  164,

			  170,  765,  170,  765,  123,  123,  165,  123,  717,  765,
			  724,  724,  724,  724,  724,  724,  163,  765,  765,  163,
			  719,  765,  721,  765,  164,  765,  765,  765,  125,  765,
			  765,  165,  733,  733,  733,  733,  733,  733,  123,  123,
			  725,  123,  170,  163,  765,  729,  163,  718,  765,  765,
			  721,  164,  765,  765,  765,  765,  163,  732,  165,  163,
			  123,  123,  125,  123,  164,  765,  765,  170,  725,  765,
			  735,  165,  765,  729,  765,  738,  739,  739,  739,  739,
			  739,  739,  765,  765,  125,  732,  740,  740,  740,  740,
			  740,  740,  765,  765,  170,  765,  765,  765,  735,  765,

			  765,  765,  765,  738,  765,  765,  765,  170,  743,  743,
			  743,  743,  743,  743,  728,  728,  728,  728,  728,  728,
			  749,  749,  749,  749,  749,  749,  753,  753,  753,  753,
			  753,  753,  754,  754,  754,  754,  754,  754,  757,  757,
			  757,  757,  757,  757,  746,  746,  746,  746,  746,  746,
			  761,  761,  761,  761,  761,  761,  762,  762,  762,  762,
			  762,  762,  763,  763,  763,  763,  763,  763,  758,  765,
			  758,  765,  765,  762,  762,  762,  762,  762,  762,  764,
			  764,  764,  764,  764,  764,  760,  760,  760,  760,  760,
			  760,  110,  110,  110,  110,  110,  110,  110,  650,  650,

			  650,  650,  650,  650,  650,  765,  765,  760,   75,   75,
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
			   91,   91,  105,  105,  765,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  765,  105,  105,  105,  105,  107,  107,
			  765,  107,  107,  107,  107,  107,  107,  107,  107,  107,
			  107,  107,  107,  107,  107,  107,  107,  107,  107,  107,
			  107,  107,  107,  107,  124,  124,  124,  765,  765,  765,
			  765,  765,  124,  124,  124,  765,  124,  124,  124,  124,
			  124,  124,  124,  765,  765,  124,  124,  124,  157,  157,
			  765,  157,  765,  157,  157,  765,  765,  157,  157,  157,

			  157,  157,  157,  157,  765,  765,  157,  157,  157,  161,
			  161,  765,  161,  161,  161,  161,  161,  161,  161,  161,
			  161,  161,  161,  161,  161,  161,  161,  161,  161,  161,
			  161,  161,  161,  161,  161,  166,  765,  166,  166,  765,
			  765,  765,  166,  166,  166,  765,  765,  166,  166,  166,
			  166,  166,  166,  166,  166,  765,  166,  166,  166,  194,
			  194,  765,  194,  194,  194,  194,  194,  194,  194,  194,
			  194,  194,  194,  194,  194,  194,  194,  194,  194,  194,
			  765,  194,  194,  194,  194,  204,  204,  204,  204,  204,
			  204,  204,  204,  204,  204,  204,  204,  204,  204,  204,

			  204,  204,  204,  204,  204,  204,  204,  204,  204,  204,
			  204,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  216,  216,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  216,  227,
			  765,  227,  765,  765,  765,  227,  765,  227,  227,  765,

			  765,  227,  227,  227,  227,  227,  227,  227,  765,  765,
			  227,  227,  227,  234,  234,  765,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  110,
			  765,  765,  765,  110,  110,  765,  765,  110,  110,  110,
			  110,  110,  110,  110,  765,  765,  110,  110,  110,  111,
			  111,  111,  111,  111,  111,  111,  111,  111,  111,  111,
			  111,  111,  111,  111,  111,  111,  111,  111,  111,  111,
			  111,  111,  111,  111,  111,  115,  115,  115,  765,  765,
			  115,  115,  115,  115,  115,  115,  115,  115,  765,  115,

			  115,  115,  257,  765,  765,  257,  257,  257,  257,  257,
			  257,  257,  257,  257,  257,  257,  765,  765,  257,  257,
			  257,  206,  206,  206,  206,  206,  206,  206,  206,  765,
			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  209,  209,  209,
			  209,  209,  209,  209,  209,  209,  209,  209,  209,  209,
			  209,  209,  209,  209,  209,  209,  209,  209,  209,  209,
			  209,  209,  209,  219,  219,  219,  765,  765,  765,  765,
			  765,  765,  765,  765,  219,  219,  219,  219,  219,  219,
			  219,  219,  765,  765,  765,  765,  765,  219,  224,  224,

			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  303,  303,  303,  765,  765,  303,  303,  303,  303,  303,
			  303,  303,  303,  765,  303,  303,  303,  346,  346,  346,
			  346,  346,  346,  346,  346,  346,  346,  346,  346,  346,
			  346,  346,  346,  346,  346,  346,  346,  346,  346,  346,
			  346,  346,  346,  650,  765,  765,  765,  650,  650,  765,

			  765,  650,  650,  650,  650,  650,  650,  650,  765,  765,
			  650,  650,  650,   13,  765,  765,  765,  765,  765,  765,
			  765,  765,  765,  765,  765,  765,  765,  765,  765,  765,
			  765,  765,  765,  765,  765,  765,  765,  765,  765,  765,
			  765,  765,  765,  765,  765,  765,  765,  765,  765,  765,
			  765,  765,  765,  765,  765,  765,  765,  765,  765,  765,
			  765,  765,  765,  765,  765,  765,  765,  765,  765,  765,
			  765,  765,  765,  765,  765,  765,  765,  765,  765,  765,
			  765,  765,  765,  765,  765,  765,  765,  765,  765,  765,
			  765,  765,  765,  765,  765,  765,  765,  765,  765,  765,

			  765,  765,  765,  765, yy_Dummy>>,
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
			   15,   86,   38,   38,    9,   38,  742,   27,   10,   27,
			   27,   27,   27,   27,   27,  417,  693,  160,    5,    5,
			    6,    6,   40,   40,   84,   40,   38,   53,   20,  741,
			   98,  723,    3,   98,   38,   53,   53,    4,   86,   86,
			   78,    7,    8,   88,  722,  226,   40,    9,  226,  417,
			   76,   10,   76,   76,  102,    9,  102,  102,  693,   10,
			   84,   84,   38,  160,    3,    3,    3,    3,    3,    4,
			    4,    4,    4,    4,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,

			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   29,   80,   29,  115,   29,   29,
			   29,   29,   29,   29,   30,  159,   30,   79,   30,   30,
			   30,   30,   30,   30,   92,   37,   37,   92,   37,  686,

			  163,   39,   39,  163,   39,   87,   41,   41,  163,   41,
			  678,   42,   42,  115,   42,  230,  660,   29,  230,   37,
			   43,   43,  159,   43,  653,   39,  650,   30,   37,   39,
			   41,   82,   37,  232,   37,   42,  232,   58,   39,   42,
			   58,   87,   87,   41,   43,   58,   44,   44,  615,   44,
			   92,   42,   58,   80,   41,   43,   37,   39,   92,  301,
			   37,   81,   37,   79,   79,   79,   39,   42,  613,   58,
			   44,   41,   45,   45,  339,   45,  612,   46,   46,   42,
			   46,  594,   41,   43,   44,   44,   47,   47,   58,   47,
			   44,   49,   49,  208,   49,  301,   45,   58,  213,   60,

			   45,   46,   60,   51,   51,  204,   51,   60,   82,   82,
			   47,  339,   44,   44,   60,   49,   47,   46,   44,  116,
			  116,  116,  116,  116,  116,  588,   49,   51,   45,   47,
			  208,  208,   52,   52,   49,   52,  570,   81,   81,   81,
			  566,  204,  204,   51,   47,   46,   50,   50,  158,   50,
			   60,   83,  213,  556,   49,  210,   52,   47,   48,   48,
			  533,   48,   49,  333,  460,  460,   69,   69,  335,  525,
			   50,   51,   69,   48,   48,   48,   48,   48,   48,   48,
			  464,   52,   48,   57,  158,   50,   57,   69,  516,   48,
			   50,   57,  210,  210,   69,   69,   48,  504,   57,  158,

			   69,  123,  123,   48,  123,   48,  501,   48,  196,   52,
			  196,  196,  243,   50,  243,  243,   57,   48,   50,  207,
			   57,  464,   57,   59,   48,  123,   59,   83,   83,   83,
			  474,   59,  303,   48,   57,   48,  504,  445,   59,   61,
			  445,  333,   61,  453,   57,  335,  335,   61,   57,   62,
			   57,   59,   62,  500,   61,  207,  207,   62,   63,  418,
			   59,   63,  124,  124,   62,  124,   63,   65,  303,  101,
			   65,  200,  101,   63,   59,   65,   61,   62,  374,   59,
			  220,  101,   65,  220,  364,  351,  124,   61,   59,   62,
			   61,   64,  101,   63,   64,   65,  500,  346,  447,   64,

			   62,  447,  341,  307,   61,   62,   64,  126,  126,   63,
			  126,   66,  297,  410,   66,   61,  410,   62,   65,   66,
			  257,   63,  101,   65,   67,   68,   66,   67,   68,   64,
			   64,  126,   67,   68,  269,   64,  220,  249,   70,   67,
			   68,   70,   64,  248,  220,  269,   70,  200,  200,  200,
			   64,   66,  126,   70,   67,  269,   71,   64,   64,   71,
			   68,  241,   66,   64,   71,  199,  410,   67,   68,  132,
			  132,   71,  132,  269,  100,   67,   68,  100,   70,   66,
			  126,  201,   67,  700,  700,  700,  100,  100,   68,   70,
			  411,  349,  349,  132,  349,   67,   68,  100,  411,  113,

			  113,  113,  113,  113,  113,   71,   70,   71,  136,  136,
			  240,  136,  118,  132,  118,  113,  118,  118,  118,  118,
			  118,  118,  118,  350,  350,  239,  350,  100,  238,  411,
			  136,  236,  136,   71,   89,   89,  495,   89,  113,  495,
			  109,  132,  228,  113,  199,  199,  199,  199,  199,  109,
			  109,  109,  109,  109,  109,  118,  202,  201,  201,  201,
			   89,  495,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,  109,  117,  117,  117,  117,
			  117,  117,  119,  119,  119,  119,  119,  119,  127,  127,

			  109,  127,  117,  120,  109,  120,  109,  120,  120,  120,
			  120,  120,  120,  224,   89,  360,  128,  128,  223,  128,
			  129,  129,  127,  129,  130,  130,  527,  130,  131,  131,
			  117,  131,  202,  202,  202,  127,  133,  133,  360,  133,
			  128,  592,  563,  360,  129,  563,  120,  128,  130,  222,
			  563,  221,  131,  129,  134,  134,  217,  134,  135,  135,
			  133,  135,  211,  127,  592,  527,  133,  130,  131,  592,
			  209,  206,  133,  137,  137,  128,  137,  166,  134,  194,
			  166,  129,  135,  138,  138,  166,  138,  140,  140,  170,
			  140,  134,  166,  164,  133,  130,  131,  137,  414,  161,

			  133,  135,  139,  139,  616,  139,  414,  138,  157,  141,
			  141,  140,  141,  138,  137,  142,  142,  144,  142,  134,
			  143,  143,  112,  143,  154,  154,  139,  154,  166,  135,
			  111,  110,  140,  141,  107,  146,  146,  414,  146,  142,
			  105,  138,  137,  616,  143,  142,  147,  147,  154,  147,
			  146,  143,  156,  156,  141,  156,  154,  139,  103,  146,
			  140,  147,   99,  149,  149,  707,  149,  705,  152,  152,
			  147,  152,   96,  142,   95,  705,  156,  147,  149,  143,
			  146,   94,  141,  145,  154,  145,  145,  149,  705,   93,
			  548,  147,  152,  147,  149,  150,  150,  150,  150,  150, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  150,  156,  145,  705,  707,  147,  145,  548,  149,  145,
			  603,  548,  151,  151,  152,  151,  145,   75,  145,   72,
			  145,  147,  149,   56,  150,   35,   33,  603,  150,  156,
			  145,  603,  385,  203,  145,  548,  151,  145,  153,  153,
			  404,  153,  152,  385,  151,   28,  145,  151,  145,  148,
			  148,  404,  148,  385,   26,  603,  150,  155,  155,   18,
			  155,  404,  153,   17,  148,  148,  148,  148,  148,  148,
			  148,  385,  151,  148,  153,  151,   16,   13,  153,  404,
			  167,  155,  168,  167,  148,  168,  169,  148,  167,  169,
			  168,    0,    0,  148,  169,  167,  332,  168,    0,    0,

			  155,  169,  153,    0,    0,  171,  153,    0,  171,  203,
			  203,  203,  148,  171,  706,  148,    0,  169,    0,  168,
			  171,  148,  706,    0,  172,  167,  174,  172,  155,  174,
			    0,  167,  172,  168,  174,  706,    0,  169,  171,  172,
			  173,  174,    0,  173,    0,  169,  175,  168,  173,  175,
			  706,    0,    0,  167,  175,  173,  171,  218,  218,    0,
			  218,  175,    0,  334,    0,    0,  171,  172,  342,  342,
			  174,  342,  332,  332,  332,  172,  175,  174,  176,    0,
			  173,  176,  175,  218,  177,    0,  176,  177,  789,  789,
			  789,  173,  177,  176,  342,  172,    0,  175,  174,  177,

			    0,    0,    0,  178,  175,    0,  178,    0,  173,  179,
			  175,  178,  179,  181,  336,  176,  181,  179,  178,    0,
			    0,  181,    0,  180,  179,  178,  180,  177,  181,  176,
			    0,  180,    0,  242,  242,  177,  242,  715,  180,  334,
			  334,  334,    0,  176,  183,  715,    0,  183,  184,    0,
			  179,  184,  183,  180,  178,  177,  184,  242,  715,  183,
			  179,    0,    0,  184,  181,    0,  337,  182,  181,    0,
			  182,    0,    0,  715,  180,  182,    0,    0,  179,    0,
			    0,  180,  182,  182,  182,  182,  182,  182,  182,  183,
			  336,  336,  336,  184,  185,  183,    0,  185,  186,  184,

			  187,  186,  185,  187,  188,    0,  186,  188,  187,  185,
			    0,    0,  188,  186,    0,  187,    0,  183,  182,  188,
			  192,  184,  189,  192,  185,  189,    0,    0,  192,  186,
			  189,  190,  187,  191,  190,  192,  191,  189,    0,  190,
			    0,  191,  337,  337,  337,  185,  190,    0,  191,  186,
			  188,  187,  185,  716,    0,  188,  227,  186,  189,  227,
			  187,  716,  189,  190,  260,  260,    0,  260,  227,  192,
			    0,  192,    0,  189,  716,    0,  191,    0,  188,  227,
			  338,    0,  190,    0,  191,    0,  189,    0,  260,  716,
			  189,  190,  254,  254,  254,  254,  254,  192,  225,  225,

			  225,  225,  225,  225,  191,  214,  214,  229,  214,  227,
			  229,  237,  237,  237,  237,  237,  237,  237,  246,  229,
			  246,    0,    0,  246,  246,  246,  246,  246,  246,    0,
			  229,  214,    0,  214,  214,  214,  214,  214,  214,  214,
			  214,  214,  214,  214,  214,  214,  214,  214,  214,  214,
			  214,  214,  214,  214,  214,  214,  338,  338,  338,    0,
			  229,  245,  245,  245,  245,  245,  245,  247,  247,  247,
			  247,  247,  247,  636,  636,  636,  636,  245,  250,  250,
			  250,  250,  250,  250,    0,  214,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,

			  245,    0,  231,    0,    0,  245,    0,    0,    0,  231,
			  231,  231,  231,  231,  231,  251,  251,  251,  251,  251,
			  251,  255,  255,  255,  255,  255,  255,  252,    0,  252,
			    0,  251,  252,  252,  252,  252,  252,  252,  231,  231,
			  231,  231,  253,    0,  253,    0,  253,  253,  253,  253,
			  253,  253,  258,  258,  251,  258,    0,  259,  259,  251,
			  259,    0,    0,    0,    0,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  258,  261,  261,    0,
			  261,  259,    0,    0,  258,  253,    0,  262,  262,  609,
			  262,  263,  263,    0,  263,  264,  264,  259,  264,  265,

			  265,  261,  265,    0,  266,  266,  609,  266,    0,    0,
			  609,  262,  258,  267,  267,  263,  267,  261,  262,  264,
			    0,  347,  347,  265,  347,  259,  645,  264,  266,  268,
			  268,    0,  268,  347,  609,  263,  265,  267,  270,  270,
			    0,  270,    0,  645,  347,  261,  262,  645,  266,  271,
			  271,    0,  271,  268,    0,  264,    0,  267,  272,  272,
			    0,  272,  270,  263,  265,  273,  273,    0,  273,  274,
			  274,  645,  274,  271,  347,  270,  266,    0,  275,  275,
			    0,  275,  272,    0,  268,  267,  271,  276,  276,  273,
			  276,    0,    0,  274,  272,  273,  278,  278,  278,  278,

			  278,  278,  275,  270,  463,  720,  463,  720,    0,  279,
			  279,  276,  279,    0,  271,  463,  720,  288,  288,  276,
			  288,    0,  272,  273,  275,  279,  279,  279,  279,  279,
			  279,    0,  288,  279,  537,  537,  537,  537,  537,  280,
			  280,  288,  280,  463,  720,    0,    0,  276,  281,  281,
			    0,  281,  275,    0,  279,  280,  280,  280,  280,  280,
			  280,    0,    0,  280,  281,  281,  281,  281,  281,  281,
			  282,  282,  281,  282,    0,  638,  638,  638,  638,  283,
			  283,    0,  283,    0,    0,    0,  282,  282,  282,  282,
			  282,  282,    0,  281,  282,  283,  283,  283,  283,  283,

			  283,    0,    0,  283,  284,  284,  284,  284,  284,  284,
			  285,    0,  285,  285,  638,  282,  286,  286,  286,  286,
			  286,  286,  287,  287,  283,  287,  289,  289,    0,  289,
			    0,  290,  290,  285,  290,  286,  285,  287,  292,  292,
			    0,  292,  285,    0,  291,  291,  287,  291,  293,  293,
			  289,  293,  648,  290,    0,  290,  648,  294,  294,    0,
			  294,  285,  292,  286,  285,  289,  287,    0,  291,    0,
			  285,    0,  293,  648,  295,  295,  291,  295,    0,    0,
			  292,  294,  296,  296,  648,  296,    0,  380,  380,    0,
			  380,  293,    0,  289,  287,  649,    0,  675,  295,  649,

			    0,  675,  306,    0,  291,  306,  296,    0,  292,    0,
			  306,  380,  294,    0,    0,    0,  649,  306,  675,  293,
			  298,  298,  298,  298,  298,  298,  298,  649,    0,  675,
			  299,  296,  299,  299,  299,  299,  299,  299,  299,  300,
			  300,  300,  300,  300,  300,  300,  304,  305,  308,  304,
			  305,  308,    0,  306,  304,  305,  308,  402,  402,  296,
			  402,  304,  305,  308,    0,    0,    0,  310,    0,  309,
			  310,  311,  309,    0,  311,  310,    0,  309,  304,  311,
			    0,  402,  310,    0,  309,    0,  311,  305,  308,  379,
			  379,    0,  379,  312,    0,    0,  312,  304,  305,  308, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  309,  312,  313,  311,  314,  313,  304,  314,  312,  773,
			  313,  310,  314,  379,    0,  305,  308,  313,  310,  314,
			  309,  379,  311,  773,  773,  773,  315,    0,  309,  315,
			  312,  311,  316,    0,  315,  316,    0,    0,    0,  310,
			  316,  315,  317,    0,  312,  317,  313,  316,  314,  379,
			  317,  318,    0,  313,  318,  314,    0,  317,  312,  318,
			  361,  361,  361,  361,  361,  361,  318,    0,    0,  316,
			  319,  487,    0,  319,  313,    0,  314,  315,  319,  317,
			    0,  315,  487,  316,  319,  319,  322,  318,  321,  322,
			    0,  321,  487,  317,  322,    0,  321,  316,    0,    0,

			    0,  322,  318,  321,    0,    0,    0,  317,  320,    0,
			  487,  320,    0,    0,    0,  318,  320,    0,  321,    0,
			    0,  319,  320,  320,  320,  320,  320,  320,  320,  320,
			  323,  651,  324,  323,  651,  324,    0,  322,  323,  321,
			  324,  754,  754,  754,  754,  323,  321,  324,  325,    0,
			  326,  325,  327,  326,  328,  327,  325,  328,  326,  320,
			  327,    0,  328,  325,  324,  326,    0,  327,  491,  328,
			  363,  363,  363,  363,  363,  363,  323,    0,    0,  491,
			  754,  323,  326,  324,  651,  329,    0,  325,  329,  491,
			    0,    0,  324,  329,  327,  651,    0,  328,    0,  325,

			  329,  326,    0,  327,  323,  328,  330,  491,    0,  330,
			  326,    0,    0,    0,  330,  325,  331,  560,    0,  331,
			  344,  330,  327,  344,  331,  328,    0,    0,  560,    0,
			  345,  331,  344,  345,  344,    0,  329,    0,  560,    0,
			  329,    0,  345,  344,  345,    0,  345,  345,  345,  345,
			  345,  345,    0,  345,    0,    0,  560,  330,  354,  354,
			  354,  354,  354,  354,  354,  331,    0,  331,  388,  388,
			    0,  388,    0,  344,  362,  362,  362,  362,  362,  362,
			    0,    0,    0,  345,  365,  365,  365,  365,  365,  365,
			    0,    0,  388,  331,  366,  366,  366,  366,  366,  366,

			  368,  368,  368,  368,  368,  368,    0,  388,    0,  367,
			  366,  367,    0,  362,  367,  367,  367,  367,  367,  367,
			  369,  369,  369,  369,  369,  369,  370,  370,  370,  370,
			  370,  370,    0,  366,    0,  388,  371,  371,  366,  371,
			  371,  371,  371,  371,  371,  372,  372,  372,  372,  372,
			  372,  373,  373,  373,  373,  373,  373,  375,  375,    0,
			  375,  376,  376,    0,  376,  370,  377,  377,    0,  377,
			  378,  378,    0,  378,  381,  381,    0,  381,  747,  382,
			  382,  375,  382,  383,  383,  376,  383,    0,  384,  384,
			  377,  384,    0,    0,  378,  747,    0,    0,  381,  747,

			  375,  387,  387,  382,  387,    0,  378,  383,  376,  377,
			    0,    0,  384,    0,  748,  383,  384,    0,  386,  386,
			  381,  386,    0,  747,  382,  387,  389,  389,  375,  389,
			    0,  748,    0,    0,  378,  748,  376,  377,  390,  390,
			    0,  390,  386,  383,  384,    0,    0,  387,  381,  394,
			  389,    0,  382,    0,  386,  391,  391,    0,  391,  748,
			    0,  389,  390,  392,  392,  392,  392,  392,  392,  394,
			  403,  403,  394,  403,    0,  387,    0,    0,  394,  391,
			    0,  390,  386,  398,  398,  398,  398,  398,  398,  389,
			    0,  392,    0,    0,  403,    0,    0,  394,  391,    0,

			  394,  727,  727,  727,  727,  727,  394,    0,    0,  390,
			  399,  399,  399,  399,  399,  399,  398,    0,    0,  392,
			  395,  395,  395,  395,  395,  395,  391,  393,  393,  393,
			  393,  393,  393,  396,  396,  396,  396,  396,  396,  395,
			    0,  676,  393,    0,  398,  676,    0,    0,  396,  393,
			  400,  400,  400,  400,  400,  400,  405,  405,  393,  405,
			  393,  561,  676,    0,  396,  400,    0,  395,    0,    0,
			  393,    0,  561,  676,    0,    0,  396,  393,  397,  397,
			  405,  397,  561,    0,    0,    0,  393,    0,  393,    0,
			    0,    0,  396,  400,  397,  397,  397,  397,  397,  397,

			  561,    0,  397,  401,  401,  401,  401,  401,  401,  397,
			  406,  406,    0,  406,  407,  407,    0,  407,  401,  408,
			  408,    0,  408,  409,  409,  412,  409,  412,  412,  412,
			  412,  412,  412,  412,  406,    0,  409,  397,  407,    0,
			    0,    0,    0,  408,    0,  407,  401,  409,  421,  421,
			  421,  421,  421,  421,    0,    0,  406,    0,  408,  465,
			  465,    0,  465,  413,  412,  413,  413,  413,  413,  413,
			  413,  413,  415,  407,  415,  415,  415,  415,  415,  415,
			  415,    0,    0,  465,  406,  416,  408,  416,  416,  416,
			  416,  416,  416,  416,    0,  419,    0,  420,  419,    0,

			  420,    0,  413,  419,    0,  420,  422,    0,    0,  422,
			  419,  415,  420,    0,  422,    0,    0,  423,    0,  424,
			  423,  422,  424,    0,  416,  423,    0,  424,    0,    0,
			    0,    0,  423,    0,  424,    0,    0,  425,  419,  426,
			  425,    0,  426,    0,  420,  425,  419,  426,  420,  422,
			    0,  424,  425,  423,  426,  444,  427,  422,  444,  427,
			    0,    0,    0,    0,  427,    0,  419,  444,  423,    0,
			  424,  427,  420,    0,    0,    0,    0,  422,  444,  424,
			    0,  423,    0,  428,  429,  426,  428,  429,  425,  730,
			  426,  428,  429,    0,  430,    0,    0,  430,  428,  429,

			  730,  427,  430,  431,    0,    0,  431,  427,  444,  430,
			  730,  431,  429,  426,    0,  428,  432,  434,  431,  432,
			  434,    0,    0,    0,  432,  434,  731,    0,  730,  427,
			  430,  432,  434,  435,  428,  429,  435,  731,    0,    0,
			  429,  435,    0,  428,    0,  430,    0,  731,  435,  431,
			    0,    0,  434,    0,  431,  432,    0,    0,  430,  433,
			  433,  433,  433,  433,  433,  731,  436,  432,  434,  436,
			  437,    0,    0,  437,  436,    0,  435,  431,  437,  438,
			  434,  436,  438,  432,  435,  437,    0,  438,  439,    0,
			  441,  439,  440,  441,  438,  440,  439,  736,  441,  740,

			  440,  740,    0,  439,  435,  441,    0,  440,  736,  436,
			  740,    0,  442,    0,    0,  442,    0,  436,  736,    0,
			  442,  437,    0,  440,    0,  442,    0,  442,    0,  441,
			  438,    0,  472,  472,  439,  472,  736,  436,  740,  439,
			    0,  441,    0,  440,  446,  446,  446,  446,  446,  446,
			    0,  440,    0,    0,    0,    0,  472,  441,    0,    0,
			    0,    0,  439,  442,  449,  449,  449,  449,  449,  449,
			  450,  450,  450,  450,  450,  450,  451,  451,  451,  451,
			  451,  451,  452,  452,  452,  452,  452,  452,  454,  454,
			  454,  454,  454,  454,  455,  455,  455,  455,  455,  455, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,  449,  454,  456,  456,  456,  456,  456,
			  456,  457,  457,  457,  457,  457,  457,  458,  458,  458,
			  458,  458,  458,    0,    0,    0,    0,  454,  466,  466,
			    0,  466,  454,  459,  459,  459,  459,  459,  459,  467,
			  467,    0,  467,    0,  456,  461,  461,  461,  461,  461,
			  461,    0,  466,    0,    0,  462,  458,  462,  462,  462,
			  462,  462,  462,  467,  468,  468,    0,  468,    0,  469,
			  469,  467,  469,  470,  470,    0,  470,  471,  471,    0,
			  471,  473,  473,  466,  473,  751,  476,  476,  468,  476,
			    0,  475,  475,  469,  475,  477,  477,  470,  477,  467,

			  469,  471,  751,  468,  470,  473,  751,    0,    0,  471,
			  476,  478,  478,    0,  478,  475,    0,  476,  473,  477,
			    0,  471,    0,  475,  479,  479,    0,  479,  469,  737,
			  751,  468,  470,  480,  480,  478,  480,  471,    0,    0,
			  737,    0,    0,  478,    0,  476,  473,    0,  479,  471,
			  737,  475,  483,  483,    0,  483,    0,  480,  482,  482,
			  482,  482,  482,  482,    0,  480,    0,  479,  737,    0,
			    0,  478,    0,  482,    0,    0,  483,  484,  484,  484,
			  484,  484,  484,    0,    0,  486,  486,  486,  486,  486,
			  486,  488,  488,  480,  488,  479,    0,  483,    0,    0,

			    0,  482,    0,    0,    0,  484,    0,  486,  490,  490,
			    0,  490,    0,  489,  489,  488,  489,  526,  526,  526,
			  526,  526,  526,  488,  493,  493,  493,  493,  493,  493,
			  493,    0,  490,  484,  485,  486,  485,  489,  485,  485,
			  485,  485,  485,  485,    0,  489,  541,  541,  490,  541,
			    0,  488,    0,  485,  543,  543,    0,  543,    0,  502,
			  485,    0,  502,    0,    0,    0,  485,  502,    0,  503,
			  541,    0,  503,  489,  502,    0,  490,  503,  543,    0,
			    0,  485,    0,    0,  503,    0,    0,    0,  485,  745,
			  745,  745,  745,  745,  485,  496,  496,  496,  496,  496,

			  496,  496,  498,  498,  498,  498,  498,  498,  498,  505,
			  502,  505,  505,  505,  505,  505,  505,    0,  506,  507,
			  503,  506,  507,    0,  503,    0,  506,  507,  508,  509,
			    0,  508,  509,  506,  507,    0,  508,  509,  511,  510,
			    0,  511,  510,  508,  509,    0,  511,  510,  505,    0,
			  506,    0,    0,  511,  510,    0,    0,    0,  507,  508,
			  509,  517,    0,  517,  517,  517,  517,  517,  517,  506,
			  507,  510,  531,  531,  531,  531,  531,  531,  506,  508,
			  509,  546,  546,  510,  546,    0,  507,  508,  509,  511,
			  510,    0,  512,  513,    0,  512,  513,    0,    0,  510,

			  512,  513,    0,    0,    0,  546,    0,  512,  513,  514,
			    0,  510,  514,  515,  752,  518,  515,  514,  518,  519,
			    0,  515,  519,  518,  514,  513,    0,  519,  515,  512,
			  518,  752,    0,  520,  519,  752,  520,    0,    0,    0,
			  514,  520,    0,  512,  513,    0,  521,  518,  520,  521,
			    0,    0,    0,  513,  521,    0,    0,  512,    0,  752,
			  514,  521,  519,    0,  515,  520,  518,    0,  514,    0,
			  519,  522,    0,  523,  522,  518,  523,    0,  521,  522,
			    0,  523,    0,    0,  520,    0,  522,    0,  523,    0,
			  519,    0,    0,  520,    0,    0,    0,  521,  524,    0,

			    0,  524,    0,  522,    0,    0,  521,    0,    0,    0,
			  524,    0,  524,  523,  524,  524,  524,  524,  524,  524,
			    0,  524,  522,  528,  523,  528,  528,  528,  528,  528,
			  528,  522,  529,  529,  529,  529,  529,  529,    0,    0,
			    0,  523,  530,  530,  530,  530,  530,  530,  529,    0,
			    0,  524,  532,  532,  532,  532,  532,  532,    0,    0,
			    0,    0,  528,  534,  534,  534,  534,  534,  534,  535,
			  535,  535,  535,  535,  535,    0,  529,  540,  540,    0,
			  540,  530,  536,  536,  536,  536,  536,  536,  539,  539,
			  539,  539,  539,  539,  542,  542,    0,  542,    0,  544,

			  544,  540,  544,    0,  539,  540,  545,  545,    0,  545,
			  547,  547,    0,  547,  549,  549,    0,  549,  542,    0,
			    0,    0,  542,  544,  550,  550,    0,  550,    0,    0,
			  545,  544,  539,  540,  547,    0,  551,  551,  549,  551,
			  552,  552,    0,  552,    0,  545,  571,  547,  550,  571,
			  542,    0,  553,  553,  571,  553,  550,    0,  549,  544,
			  551,  571,    0,    0,  552,  567,  567,  567,  567,  567,
			  567,    0,  552,  545,    0,  547,  553,    0,  557,  557,
			  551,  557,    0,  553,  550,  554,  549,  554,    0,  554,
			  554,  554,  554,  554,  554,  558,  558,  571,  558,    0,

			  552,    0,  557,    0,  554,    0,  559,  559,  551,  559,
			  562,  553,  562,  562,  562,  562,  562,  562,  562,  558,
			  564,    0,  564,  564,  564,  564,  564,  564,  564,    0,
			  559,    0,  554,  600,  600,    0,  600,  559,  558,  565,
			    0,  565,  565,  565,  565,  565,  565,  565,  568,  562,
			    0,  568,    0,    0,    0,    0,  568,  600,    0,  564,
			    0,  601,  601,  568,  601,  559,  558,  569,  569,  569,
			  569,  569,  569,    0,  572,    0,  568,  572,  565,    0,
			  573,    0,  572,  573,    0,  601,    0,    0,  573,  572,
			  574,  601,    0,  574,    0,  573,    0,    0,  574,  568,

			  575,    0,  572,  575,  568,  574,  576,    0,  575,  576,
			  598,  598,    0,  598,  576,  575,    0,    0,    0,  601,
			  578,  576,  574,  578,    0,  572,    0,    0,  578,  577,
			  572,  573,  577,    0,  598,  578,    0,  577,    0,  575,
			  579,  574,    0,  579,  577,    0,  580,    0,  579,  580,
			  574,  575,    0,  598,  580,  579,    0,  576,    0,    0,
			  583,  580,    0,  583,  578,    0,  577,  575,  583,    0,
			  581,  578,  579,  581,  582,  583,    0,  582,  581,    0,
			  577,  598,  582,  602,  602,  581,  602,    0,    0,  582,
			  580,  579,  578,  584,  577,  585,  584,  580,  585,    0,

			  579,  584,  581,  585,    0,  582,    0,  602,  584,    0,
			  585,  583,  586,  586,  586,  586,  586,  586,  580,    0,
			    0,  581,    0,    0,    0,  582,  585,    0,    0,    0,
			  581,    0,    0,  582,    0,    0,  584,  587,  587,  587,
			  587,  587,  587,  589,  584,  589,  585,    0,  589,  589,
			  589,  589,  589,  589,  585,  590,  590,  590,  590,  590,
			  590,    0,    0,    0,  584,  591,  591,  591,  591,  591,
			  591,  593,  593,  593,  593,  593,  593,  595,  595,  595,
			  595,  595,  595,  596,  596,  596,  596,  596,  596,  599,
			  599,    0,  599,    0,  590,  597,  597,  597,  597,  597, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  597,  604,  604,    0,  604,  605,  605,    0,  605,  606,
			  606,  597,  606,  599,  607,  607,    0,  607,  608,  608,
			    0,  608,    0,    0,    0,  604,  599,  610,  610,  605,
			  610,    0,    0,  606,  597,    0,    0,    0,  607,  597,
			  611,  611,  608,  611,    0,    0,    0,  618,    0,    0,
			  618,  610,    0,  607,  599,  618,    0,    0,    0,  610,
			    0,    0,  618,  617,  611,  617,  617,  617,  617,  617,
			  617,  619,  611,  619,  619,  619,  619,  619,  619,    0,
			  620,  607,    0,  620,    0,    0,  621,  610,  620,  621,
			  618,    0,    0,    0,  621,  620,  622,    0,  618,  622,

			  611,  621,  617,    0,  622,  623,  624,    0,  623,  624,
			  619,  622,    0,  623,  624,    0,    0,  620,  618,  625,
			  623,  624,  625,    0,    0,  626,  622,  625,  626,  647,
			  647,  620,  647,  626,  625,  627,  628,  621,  627,  628,
			  626,    0,    0,  627,  628,  620,    0,  622,    0,    0,
			  627,  628,  629,  647,  622,  629,  623,  624,  630,    0,
			  629,  630,    0,    0,    0,    0,  630,  629,    0,    0,
			  625,    0,    0,  630,  627,  631,  626,  631,  631,  631,
			  631,  631,  631,    0,  629,    0,  627,  628,    0,    0,
			  630,  632,  632,  632,  632,  632,  632,    0,    0,    0,

			    0,    0,  627,  629,    0,    0,    0,    0,    0,  630,
			  671,  671,  629,  671,  631,    0,    0,    0,  630,  633,
			  633,  633,  633,  633,  633,  634,  634,  634,  634,  634,
			  634,  635,    0,  635,  671,    0,  635,  635,  635,  635,
			  635,  635,  637,  637,  637,  637,  637,  637,  639,  639,
			  639,  639,  639,  639,  640,  640,    0,  640,  641,  641,
			    0,  641,    0,    0,  639,  642,  642,    0,  642,  644,
			  644,    0,  644,  654,  646,  646,  654,  646,  640,    0,
			    0,  654,  641,    0,  640,    0,    0,  639,  654,  642,
			    0,    0,  639,  644,  641,    0,    0,  642,  646,  644,

			    0,    0,    0,  654,    0,  646,  652,  652,  652,  652,
			  652,  652,  640,  655,    0,  656,  655,    0,  656,    0,
			    0,  655,  641,  656,  654,  642,    0,  644,  655,  657,
			  656,  654,  657,  646,    0,    0,    0,  657,  658,    0,
			  659,  658,  682,  659,  657,  682,  658,  656,  659,  655,
			  682,    0,    0,  658,    0,  659,    0,  682,    0,  657,
			    0,    0,    0,    0,  655,    0,  656,    0,    0,  658,
			  674,  674,    0,  674,    0,  656,    0,  655,    0,    0,
			  657,  661,  661,  661,  661,  661,  661,  657,    0,  658,
			    0,  659,    0,  682,  674,    0,    0,  658,  662,  662,

			  662,  662,  662,  662,  663,  663,  663,  663,  663,  663,
			  664,  664,  664,  664,  664,  664,  665,  665,  665,  665,
			  665,  665,  666,  666,  666,  666,  666,  666,  668,  668,
			  668,  668,  668,  668,    0,  669,  669,  662,  669,  670,
			  670,    0,  670,    0,  668,  672,  672,    0,  672,  677,
			  677,  679,  677,  679,  679,  679,  679,  679,  679,  669,
			    0,  691,  691,  670,  691,    0,    0,  668,  680,  672,
			  669,  680,  668,  677,    0,    0,  680,  672,  681,  683,
			    0,  681,  683,  680,  670,  691,  681,  683,    0,  684,
			  679,    0,  684,  681,  683,    0,    0,  684,  669,    0,

			    0,    0,    0,  680,  684,  672,    0,    0,    0,    0,
			  691,  683,  670,  685,  685,  685,  685,  685,  685,  680,
			    0,    0,    0,  681,    0,  692,  692,    0,  692,  681,
			  683,  680,  687,  687,  687,  687,  687,  687,  691,  683,
			  684,  689,  689,  689,  689,  689,  689,    0,  688,  692,
			  688,  681,  685,  688,  688,  688,  688,  688,  688,  690,
			  690,    0,  690,  696,  696,  696,  696,  696,  696,  692,
			  697,  698,    0,  697,  698,    0,    0,    0,  697,  698,
			    0,  699,    0,  690,  699,  697,  698,  688,    0,  699,
			    0,  690,  702,  702,    0,  702,  699,  692,    0,    0,

			    0,    0,  697,  701,  701,  701,  701,  701,  701,  703,
			  703,    0,  703,    0,  704,  704,  702,  704,    0,  690,
			  698,  697,  698,    0,    0,  699,    0,    0,    0,    0,
			  697,    0,  699,  703,    0,    0,    0,  702,  704,  708,
			    0,  708,  708,  708,  708,  708,  708,  709,  698,  710,
			  709,  711,  710,  699,  711,  709,    0,  710,    0,  711,
			    0,    0,  709,    0,  710,  702,  711,  712,  712,  712,
			  712,  712,  712,  714,  714,    0,  714,    0,  708,  713,
			  713,  713,  713,  713,  713,  717,  717,  717,  717,  717,
			  717,  719,  709,    0,  719,    0,    0,  714,  709,  719,

			  710,    0,  711,    0,  721,  721,  719,  721,  724,    0,
			  724,  724,  724,  724,  724,  724,  725,    0,    0,  725,
			  709,    0,  714,    0,  725,    0,    0,    0,  721,    0,
			    0,  725,  726,  726,  726,  726,  726,  726,  729,  729,
			  719,  729,  719,  732,    0,  721,  732,  724,    0,    0,
			  714,  732,    0,    0,    0,    0,  738,  725,  732,  738,
			  735,  735,  729,  735,  738,    0,    0,  725,  719,    0,
			  729,  738,    0,  721,    0,  732,  733,  733,  733,  733,
			  733,  733,    0,    0,  735,  725,  734,  734,  734,  734,
			  734,  734,    0,    0,  732,    0,    0,    0,  729,    0,

			    0,    0,    0,  732,    0,    0,    0,  738,  739,  739,
			  739,  739,  739,  739,  743,  743,  743,  743,  743,  743,
			  744,  744,  744,  744,  744,  744,  749,  749,  749,  749,
			  749,  749,  750,  750,  750,  750,  750,  750,  753,  753,
			  753,  753,  753,  753,  757,  757,  757,  757,  757,  757,
			  758,  758,  758,  758,  758,  758,  759,  759,  759,  759,
			  759,  759,  761,  761,  761,  761,  761,  761,  762,    0,
			  762,    0,    0,  762,  762,  762,  762,  762,  762,  763,
			  763,  763,  763,  763,  763,  764,  764,  764,  764,  764,
			  764,  772,  772,  772,  772,  772,  772,  772,  797,  797,

			  797,  797,  797,  797,  797,    0,    0,  762,  766,  766,
			  766,  766,  766,  766,  766,  766,  766,  766,  766,  766,
			  766,  766,  766,  766,  766,  766,  766,  766,  766,  766,
			  766,  766,  766,  766,  767,  767,  767,  767,  767,  767,
			  767,  767,  767,  767,  767,  767,  767,  767,  767,  767,
			  767,  767,  767,  767,  767,  767,  767,  767,  767,  767,
			  768,  768,  768,  768,  768,  768,  768,  768,  768,  768,
			  768,  768,  768,  768,  768,  768,  768,  768,  768,  768,
			  768,  768,  768,  768,  768,  768,  769,  769,  769,  769,
			  769,  769,  769,  769,  769,  769,  769,  769,  769,  769, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  769,  769,  769,  769,  769,  769,  769,  769,  769,  769,
			  769,  769,  770,  770,    0,  770,  770,  770,  770,  770,
			  770,  770,  770,  770,  770,  770,  770,  770,  770,  770,
			  770,  770,  770,    0,  770,  770,  770,  770,  771,  771,
			    0,  771,  771,  771,  771,  771,  771,  771,  771,  771,
			  771,  771,  771,  771,  771,  771,  771,  771,  771,  771,
			  771,  771,  771,  771,  774,  774,  774,    0,    0,    0,
			    0,    0,  774,  774,  774,    0,  774,  774,  774,  774,
			  774,  774,  774,    0,    0,  774,  774,  774,  775,  775,
			    0,  775,    0,  775,  775,    0,    0,  775,  775,  775,

			  775,  775,  775,  775,    0,    0,  775,  775,  775,  776,
			  776,    0,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  777,    0,  777,  777,    0,
			    0,    0,  777,  777,  777,    0,    0,  777,  777,  777,
			  777,  777,  777,  777,  777,    0,  777,  777,  777,  778,
			  778,    0,  778,  778,  778,  778,  778,  778,  778,  778,
			  778,  778,  778,  778,  778,  778,  778,  778,  778,  778,
			    0,  778,  778,  778,  778,  779,  779,  779,  779,  779,
			  779,  779,  779,  779,  779,  779,  779,  779,  779,  779,

			  779,  779,  779,  779,  779,  779,  779,  779,  779,  779,
			  779,  780,  780,  780,  780,  780,  780,  780,  780,  780,
			  780,  780,  780,  780,  780,  780,  780,  780,  780,  780,
			  780,  780,  780,  780,  780,  780,  780,  781,  781,  781,
			  781,  781,  781,  781,  781,  781,  781,  781,  781,  781,
			  781,  781,  781,  781,  781,  781,  781,  781,  781,  781,
			  781,  781,  781,  782,  782,  782,  782,  782,  782,  782,
			  782,  782,  782,  782,  782,  782,  782,  782,  782,  782,
			  782,  782,  782,  782,  782,  782,  782,  782,  782,  783,
			    0,  783,    0,    0,    0,  783,    0,  783,  783,    0,

			    0,  783,  783,  783,  783,  783,  783,  783,    0,    0,
			  783,  783,  783,  784,  784,    0,  784,  784,  784,  784,
			  784,  784,  784,  784,  784,  784,  784,  784,  784,  784,
			  784,  784,  784,  784,  784,  784,  784,  784,  784,  785,
			    0,    0,    0,  785,  785,    0,    0,  785,  785,  785,
			  785,  785,  785,  785,    0,    0,  785,  785,  785,  786,
			  786,  786,  786,  786,  786,  786,  786,  786,  786,  786,
			  786,  786,  786,  786,  786,  786,  786,  786,  786,  786,
			  786,  786,  786,  786,  786,  787,  787,  787,    0,    0,
			  787,  787,  787,  787,  787,  787,  787,  787,    0,  787,

			  787,  787,  788,    0,    0,  788,  788,  788,  788,  788,
			  788,  788,  788,  788,  788,  788,    0,    0,  788,  788,
			  788,  790,  790,  790,  790,  790,  790,  790,  790,    0,
			  790,  790,  790,  790,  790,  790,  790,  790,  790,  790,
			  790,  790,  790,  790,  790,  790,  790,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  792,  792,  792,    0,    0,    0,    0,
			    0,    0,    0,    0,  792,  792,  792,  792,  792,  792,
			  792,  792,    0,    0,    0,    0,    0,  792,  793,  793,

			  793,  793,  793,  793,  793,  793,  793,  793,  793,  793,
			  793,  793,  793,  793,  793,  793,  793,  793,  793,  793,
			  793,  793,  793,  793,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  795,  795,  795,    0,    0,  795,  795,  795,  795,  795,
			  795,  795,  795,    0,  795,  795,  795,  796,  796,  796,
			  796,  796,  796,  796,  796,  796,  796,  796,  796,  796,
			  796,  796,  796,  796,  796,  796,  796,  796,  796,  796,
			  796,  796,  796,  798,    0,    0,    0,  798,  798,    0,

			    0,  798,  798,  798,  798,  798,  798,  798,    0,    0,
			  798,  798,  798,  765,  765,  765,  765,  765,  765,  765,
			  765,  765,  765,  765,  765,  765,  765,  765,  765,  765,
			  765,  765,  765,  765,  765,  765,  765,  765,  765,  765,
			  765,  765,  765,  765,  765,  765,  765,  765,  765,  765,
			  765,  765,  765,  765,  765,  765,  765,  765,  765,  765,
			  765,  765,  765,  765,  765,  765,  765,  765,  765,  765,
			  765,  765,  765,  765,  765,  765,  765,  765,  765,  765,
			  765,  765,  765,  765,  765,  765,  765,  765,  765,  765,
			  765,  765,  765,  765,  765,  765,  765,  765,  765,  765,

			  765,  765,  765,  765, yy_Dummy>>,
			1, 704, 5000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   88,   93,   75,   77,   69,   70,   99,
			  103,  183,    0, 1077, 5613,  105, 1073, 1036, 1052, 5613,
			   84,    0, 5613, 5613, 5613, 5613, 1039,  101, 1028,  260,
			  270, 5613, 5613,  999, 5613,  998, 5613,  293,  110,  299,
			  130,  304,  309,  318,  344,  370,  375,  384,  456,  389,
			  444,  401,  430,   79, 5613, 5613,  967,  481,  335,  521,
			  397,  537,  547,  556,  589,  565,  609,  622,  623,  426,
			  636,  654, 1002, 5613, 5613, 1010,  158, 5613,   96,  280,
			  268,  354,  324,  444,  117, 5613,   94,  288,   71,  732,
			 5613, 5613,  292,  986,  966,  899,  911, 5613,  138,  959,

			  672,  567,  162,  955, 5613,  933, 5613,  925,    0,  731,
			  920,  927,  906,  681, 5613,  260,  401,  768,  698,  774,
			  789, 5613, 5613,  499,  560,    0,  605,  796,  814,  818,
			  822,  826,  667,  834,  852,  856,  706,  871,  881,  900,
			  885,  907,  913,  918,  835,  969,  933,  944, 1047,  961,
			  977, 1010,  966, 1036,  922, 1055,  950,  884,  424,  261,
			  103,  843, 5613,  298,  882,    0,  875, 1078, 1080, 1084,
			  823, 1103, 1122, 1138, 1124, 1144, 1176, 1182, 1201, 1207,
			 1221, 1211, 1265, 1242, 1246, 1292, 1296, 1298, 1302, 1320,
			 1329, 1331, 1318, 5613,  872, 5613,  506, 5613, 5613,  658,

			  564,  674,  749, 1026,  388, 5613,  817,  502,  376,  815,
			  438,  808, 5613,  370, 1403, 5613, 5613,  828, 1155, 5613,
			  578,  776,  788,  815,  810, 1380,  153, 1354,  739, 1405,
			  313, 1485,  331, 5613, 5613, 5613,  722, 1394,  719,  716,
			  701,  652, 1231,  510, 5613, 1443, 1405, 1449,  626,  571,
			 1460, 1497, 1514, 1528, 1374, 1503, 5613,  592, 1550, 1555,
			 1362, 1575, 1585, 1589, 1593, 1597, 1602, 1611, 1627,  605,
			 1636, 1647, 1656, 1663, 1667, 1676, 1685, 5613, 1678, 1707,
			 1737, 1746, 1768, 1777, 1786, 1796, 1798, 1820, 1715, 1824,
			 1829, 1842, 1836, 1846, 1855, 1872, 1880,  588, 1902, 1914,

			 1921,  335, 5613,  515, 1944, 1945, 1900,  542, 1946, 1967,
			 1965, 1969, 1991, 2000, 2002, 2024, 2030, 2040, 2049, 2068,
			 2106, 2086, 2084, 2128, 2130, 2146, 2148, 2150, 2152, 2183,
			 2204, 2214, 1089,  456, 1156,  461, 1207, 1259, 1373,  357,
			 5613,  547, 1166, 5613, 2218, 2228,  594, 1619, 5613,  689,
			  721,  582, 5613, 5613, 2241, 5613, 5613, 5613, 5613, 5613,
			  781, 2042, 2256, 2152,  523, 2266, 2276, 2296, 2282, 2302,
			 2308, 2321, 2327, 2333,  550, 2355, 2359, 2364, 2368, 1987,
			 1885, 2372, 2377, 2381, 2386, 1003, 2416, 2399, 2266, 2424,
			 2436, 2453, 2445, 2509, 2432, 2502, 2515, 2576, 2465, 2492,

			 2532, 2585, 1955, 2468, 1011, 2554, 2608, 2612, 2617, 2621,
			  611,  674, 2609, 2647,  882, 2656, 2669,  101,  493, 2693,
			 2695, 2630, 2704, 2715, 2717, 2735, 2737, 2754, 2781, 2782,
			 2792, 2801, 2814, 2841, 2815, 2831, 2864, 2868, 2877, 2886,
			 2890, 2888, 2910, 5613, 2753,  535, 2926,  596, 5613, 2946,
			 2952, 2958, 2964,  529, 2970, 2976, 2987, 2993, 2999, 3015,
			  446, 3027, 3039, 1691,  464, 2657, 3026, 3037, 3062, 3067,
			 3071, 3075, 2930, 3079,  506, 3089, 3084, 3093, 3109, 3122,
			 3131, 5613, 3140, 3150, 3159, 3220, 3167, 2042, 3189, 3211,
			 3206, 2139, 5613, 3206, 5613,  734, 3277, 5613, 3284, 5613,

			  529,  445, 3257, 3267,  481, 3293, 3316, 3317, 3326, 3327,
			 3337, 3336, 3390, 3391, 3407, 3411,  472, 3345, 3413, 3417,
			 3431, 3444, 3469, 3471, 3496,  412, 3199,  810, 3507, 3514,
			 3524, 3354, 3534,  403, 3545, 3551, 3564, 1716, 5613, 3570,
			 3575, 3244, 3592, 3252, 3597, 3604, 3379, 3608,  961, 3612,
			 3622, 3634, 3638, 3650, 3671, 5613,  429, 3676, 3693, 3704,
			 2188, 2532, 3694,  840, 3704, 3723,  416, 3647, 3746, 3749,
			  419, 3644, 3772, 3778, 3788, 3798, 3804, 3827, 3818, 3838,
			 3844, 3868, 3872, 3858, 3891, 3893, 3894, 3919,  408, 3930,
			 3937, 3947,  807, 3953,  366, 3959, 3965, 3977, 3808, 3987,

			 3731, 3759, 3881,  981, 3999, 4003, 4007, 4012, 4016, 1560,
			 4025, 4038,  361,  353,    0,  324,  888, 4047, 4045, 4055,
			 4078, 4084, 4094, 4103, 4104, 4117, 4123, 4133, 4134, 4150,
			 4156, 4159, 4173, 4201, 4207, 4218, 1455, 4224, 1762, 4230,
			 4252, 4256, 4263, 5613, 4267, 1597, 4272, 4127, 1823, 1866,
			  315, 2129, 4288,  307, 4271, 4311, 4313, 4327, 4336, 4338,
			  259, 4363, 4380, 4386, 4392, 4398, 4404, 5613, 4410, 4433,
			 4437, 4208, 4443, 5613, 4368, 1868, 2512, 4447,  249, 4435,
			 4466, 4476, 4340, 4477, 4487, 4495,  252, 4514, 4535, 4523,
			 4557, 4459, 4523,  121, 5613, 5613, 4545, 4568, 4569, 4579,

			  665, 4585, 4590, 4607, 4612,  938, 1085,  949, 4623, 4645,
			 4647, 4649, 4649, 4661, 4671, 1208, 1324, 4667, 5613, 4689,
			 1692, 4702,  130,  117, 4692, 4714, 4714, 2483, 5613, 4736,
			 2760, 2797, 4741, 4758, 4768, 4758, 2868, 3100, 4754, 4790,
			 2886,  115,   92, 4796, 4802, 3271, 5613, 2349, 2385, 4808,
			 4814, 3056, 3385, 4820, 2128, 5613, 5613, 4826, 4832, 4838,
			 5613, 4844, 4855, 4861, 4867, 5613, 4907, 4933, 4959, 4985,
			 5011, 5037, 4877, 2000, 5062, 5083, 5108, 5133, 5158, 5184,
			 5210, 5236, 5262, 5287, 5312, 5333, 5358, 5376, 5395, 1165,
			 5420, 5446, 5471, 5497, 5523, 5541, 5566, 4884, 5587, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  765,    1,  766,  766,  767,  767,  768,  768,  769,
			  769,  765,   11,  765,  765,  765,  765,  765,  770,  765,
			  771,  772,  765,  765,  765,  765,  765,  765,  773,  765,
			  765,  765,  765,  765,  765,  765,  765,  774,  774,  774,
			  774,  774,  774,  774,  774,  774,  774,  774,  774,  774,
			  774,  774,  774,  775,  765,  765,  776,  777,  777,  777,
			  777,  777,  777,  777,  777,  777,  777,  777,  777,   64,
			  777,  777,  765,  765,  765,  778,  765,  765,  765,  778,
			  778,  778,  778,  778,  779,  765,  780,  779,  781,  782,
			  765,  765,  765,  765,  765,  765,  765,  765,  783,  765,

			  783,  783,  765,  765,  765,  770,  765,  784,  784,  784,
			  785,  786,  765,  765,  765,  787,  765,  765,  765,  765,
			  765,  765,  765,  765,  774,  788,  774,  774,  774,  774,
			  774,  774,  774,  774,  774,  774,  774,  774,  774,  774,
			  774,  774,  774,  774,  765,   48,  774,  774,  774,  774,
			   48,  774,  774,  774,  774,  774,  774,  775,  775,  775,
			  775,  776,  765,  765,  765,  789,  777,  777,  777,  777,
			  765,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  777,  777,  777,  765,  778,  765,  765,  765,  765,  778,

			  778,  778,  778,  778,  779,  765,  790,  779,  780,  791,
			  780,  790,  765,  781,  782,  765,  765,  214,  792,  765,
			  765,  765,  765,  765,  793,  765,  783,  783,  765,  765,
			  765,  794,  765,  765,  765,  765,  765,  765,  765,  765,
			  765,  765,  765,  765,  765,  765,  765,  765,  773,  765,
			  765,  765,  765,  765,  765,  765,  765,  788,  774,  774,
			  774,  774,  774,  774,  774,  774,  774,  774,  774,  765,
			  774,  774,  774,  774,  774,  774,  774,  765,  765,  774,
			  774,  774,  774,  774,  148,  148,  148,  774,  774,  774,
			  774,  774,  774,  774,  774,  774,  774,  765,  775,  775,

			  775,  775,  765,  795,  777,  777,  777,  765,  777,  777,
			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  777,  777,  778,  778,  778,  778,  778,  778,  778,  790,
			  765,  791,  792,  765,  765,  765,  796,  796,  765,  796,
			  796,  796,  765,  765,  765,  765,  765,  765,  765,  765,
			  765,  765,  765,  765,  765,  765,  765,  765,  765,  765,
			  765,  765,  765,  765,  788,  774,  774,  774,  774,  774,
			  774,  774,  774,  774,  774,  765,  774,  774,  774,  774,
			  774,  774,  765,  145,  148,  393,  393,  774,  145,  765,

			  397,  397,  774,  774,  765,  774,  774,  774,  774,  774,
			  765,  775,  775,  775,  775,  775,  775,  775,  765,  777,
			  777,  765,  777,  777,  777,  777,  777,  777,  777,  777,
			  777,  777,  777,  765,  777,  777,  777,  777,  777,  777,
			  777,  777,  777,  765,  765,  765,  765,  765,  765,  765,
			  765,  765,  765,  765,  765,  765,  765,  765,  765,  765,
			  765,  765,  765,  765,  765,  774,  774,  774,  774,  774,
			  774,  774,  774,  774,  765,  774,  774,  774,  774,  774,
			  774,  765,  397,  774,  765,  397,  485,  765,  774,  774,
			  774,  765,  765,  775,  765,  765,  775,  765,  775,  765,

			  775,  765,  777,  777,  765,  765,  777,  777,  777,  777,
			  777,  777,  777,  777,  777,  777,  765,  765,  777,  777,
			  777,  777,  777,  777,  765,  765,  765,  765,  765,  765,
			  765,  765,  765,  765,  765,  765,  765,  765,  765,  765,
			  774,  774,  774,  774,  774,  774,  774,  774,  765,  774,
			  774,  774,  774,  774,  397,  765,  765,  774,  774,  774,
			  765,  765,  775,  765,  775,  775,  775,  765,  777,  765,
			  765,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  777,  777,  777,  777,  777,  777,  765,  765,  765,  765,
			  765,  765,  765,  765,  765,  765,  765,  765,  774,  774,

			  774,  774,  774,  765,  774,  774,  774,  774,  774,  765,
			  774,  774,  765,  765,  797,  765,  765,  765,  777,  765,
			  777,  777,  777,  777,  777,  777,  777,  777,  777,  777,
			  777,  765,  765,  765,  765,  765,  765,  765,  765,  765,
			  774,  774,  774,  765,  774,  765,  774,  774,  765,  765,
			  798,  765,  765,  765,  777,  777,  777,  777,  777,  777,
			  765,  765,  765,  765,  765,  765,  765,  765,  765,  774,
			  774,  774,  774,  765,  774,  765,  765,  765,  765,  765,
			  777,  777,  777,  777,  777,  765,  765,  765,  765,  765,
			  774,  774,  774,  765,  765,  765,  765,  777,  777,  777,

			  765,  765,  774,  774,  774,  765,  765,  765,  765,  777,
			  777,  777,  765,  765,  774,  765,  765,  765,  765,  777,
			  765,  774,  765,  765,  765,  777,  765,  765,  765,  774,
			  765,  765,  777,  765,  765,  774,  765,  765,  777,  765,
			  765,  765,  765,  765,  765,  765,  765,  765,  765,  765,
			  765,  765,  765,  765,  765,  765,  765,  765,  765,  765,
			  765,  765,  765,  765,  765,    0,  765,  765,  765,  765,
			  765,  765,  765,  765,  765,  765,  765,  765,  765,  765,
			  765,  765,  765,  765,  765,  765,  765,  765,  765,  765,
			  765,  765,  765,  765,  765,  765,  765,  765,  765, yy_Dummy>>)
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
			  102,   71,   71,   68,   71,   71,   71,   79,   79,   76,

			   79,   79,    1,    2,   27,  123,  122,  137,  137,  137,
			    0,    3,   32,  121,   31,  107,    0,    0,  115,    0,
			  115,   26,   25,    0,  103,   97,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,   39,    0,  103,   96,   96,   87,   96,
			   96,  103,  103,  103,  103,  103,  103,    0,    0,    0,
			    0,    0,  114,    0,    0,    0,  106,  106,  106,  106,
			    0,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,   39,  106,  106,  106,
			  106,  106,  106,  109,  127,  129,  128,  125,  124,  126,

			  127,  127,  127,  127,  110,  113,    0,  110,    0,    0,
			    0,  111,  112,    0,    0,  102,  100,  100,    0,  101,
			    0,    0,    0,   68,    0,    0,    0,    0,   76,    0,
			   75,    0,   74,   78,  137,  131,  137,  137,  137,  137,
			  137,  137,    0,    4,   33,  121,    0,    0,    0,    0,
			    0,  117,    0,  115,    0,    0,   97,    0,  103,  103,
			   38,  103,  103,  103,  103,  103,  103,  103,  103,    0,
			  103,  103,  103,  103,   41,  103,  103,   95,    0,   88,
			   89,   88,   88,   88,   96,  103,   96,   96,   96,  103,
			  103,  103,  103,  103,  103,   40,  103,    0,    0,    0,

			    0,    0,  105,  108,  106,  106,   38,    0,  106,  106,
			  106,  106,  106,  106,  106,  106,  106,  106,  106,   62,
			   62,  106,   41,  106,  106,  106,  106,  106,  106,  106,
			   40,  106,  127,  127,  127,  127,  127,  127,  127,    0,
			  111,  112,    0,   69,    0,    0,    0,    0,   77,   75,
			   74,   78,  135,  138,  138,  136,  132,  133,  134,   98,
			  121,    0,  121,    0,    0,    0,  117,    0,    0,    0,
			  120,  115,    0,    0,  104,  103,  103,  103,  103,  103,
			   37,  103,  103,  103,  103,    0,  103,  103,  103,  103,
			  103,  103,    0,  103,   87,  103,  103,  103,  103,    0,

			   87,   87,   87,   36,    0,   43,  103,  103,  103,  103,
			   73,    0,    0,    0,    0,    0,    0,    0,    0,  106,
			  106,    0,  106,  106,  106,   37,  106,  106,  106,  106,
			  106,  106,  106,    0,  106,  106,  106,   36,   43,  106,
			  106,  106,  106,  112,    0,   67,    0,   66,   70,  121,
			    0,    0,    0,  116,  117,    0,  118,    0,  120,    0,
			    0,    0,  115,   84,    0,   57,  103,  103,  103,  103,
			  103,  103,   44,  103,    0,  103,  103,   35,  103,  103,
			  103,   89,   89,   88,    0,  103,  103,    0,  103,  103,
			  103,    0,   72,    0,   64,    0,    0,   61,    0,   60,

			    0,    0,   57,  106,    0,    0,  106,  106,  106,  106,
			  106,   44,  106,  106,  106,   35,   62,   62,  106,  106,
			  106,  106,  106,  106,    0,  121,    0,    0,    0,  117,
			  118,    0,    0,  120,    0,    0,    0,    0,   84,    0,
			  103,   58,  103,   59,  103,  103,   46,  103,    0,  103,
			  103,  103,  103,  103,  103,   87,    0,   52,  103,  103,
			    0,    0,    0,    0,    0,    0,    0,    0,  106,    0,
			    0,   58,  106,   59,  106,  106,   46,  106,  106,  106,
			  106,  106,  106,   52,  106,  106,    0,    0,  107,    0,
			  118,    0,  121,    0,   86,    0,    0,  119,  103,  103,

			   56,  103,   45,    0,   42,   55,   34,  103,   50,    0,
			  103,  103,    0,    0,    0,    0,    0,    0,  106,    0,
			  106,   56,  106,   45,   42,   55,   34,  106,   50,  106,
			  106,    0,    0,  118,    0,    0,    0,    0,   83,  119,
			  103,  103,  103,   92,  103,    0,  103,   53,    0,    0,
			    0,   65,    0,  108,  106,  106,  106,  106,  106,   53,
			  120,    0,  120,    0,    0,    0,    0,   83,  119,  103,
			  103,   47,  103,   91,   51,    0,    0,    0,    0,    0,
			  106,  106,   47,  106,   51,  120,   85,    0,   83,  119,
			  103,  103,  103,   90,   90,   99,    0,  106,  106,  106,

			    0,    0,  103,   49,   48,    0,    0,    0,    0,  106,
			   49,   48,    0,    0,  103,    0,    0,    0,   63,  106,
			   82,  103,    0,    0,    0,  106,    0,    0,   82,  103,
			    0,    0,  106,    0,    0,   54,    0,    0,   54,    0,
			   81,    0,    0,    0,    0,    0,   81,    0,    0,    0,
			    0,    0,    0,    0,   80,   93,   94,    0,    0,    0,
			   80,    0,   80,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 5613
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 765
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 766
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
