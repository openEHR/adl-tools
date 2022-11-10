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
			inspect yy_act
when 1 then
--|#line 82 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 82")
end
-- Ignore separators
when 2 then
--|#line 83 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 83")
end
in_lineno := in_lineno + text_count
when 3 then
--|#line 88 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 88")
end
-- Ignore comments
when 4 then
--|#line 89 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 89")
end
in_lineno := in_lineno + 1
when 5 then
--|#line 93 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 93")
end
last_token := Minus_code
when 6 then
--|#line 94 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 94")
end
last_token := Plus_code
when 7 then
--|#line 95 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 95")
end
last_token := Star_code
when 8 then
--|#line 96 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 96")
end
last_token := Slash_code
when 9 then
--|#line 97 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 97")
end
last_token := Caret_code
when 10 then
--|#line 98 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 98")
end
last_token := Equal_code
when 11 then
--|#line 99 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 99")
end
last_token := Dot_code
when 12 then
--|#line 100 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 100")
end
last_token := Semicolon_code
when 13 then
--|#line 101 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 101")
end
last_token := Comma_code
when 14 then
--|#line 102 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 102")
end
last_token := Colon_code
when 15 then
--|#line 103 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 103")
end
last_token := Exclamation_code
when 16 then
--|#line 104 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 104")
end
last_token := Left_parenthesis_code
when 17 then
--|#line 105 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 105")
end
last_token := Right_parenthesis_code
when 18 then
--|#line 106 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 106")
end
last_token := Dollar_code
when 19 then
--|#line 108 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 108")
end
last_token := Question_mark_code
when 20 then
--|#line 110 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 110")
end
last_token := SYM_INTERVAL_DELIM
when 21 then
--|#line 112 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 112")
end
last_token := Left_bracket_code
when 22 then
--|#line 113 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 113")
end
last_token := Right_bracket_code
when 23 then
--|#line 115 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 115")
end
last_token := SYM_START_CBLOCK
when 24 then
--|#line 116 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 116")
end
last_token := SYM_END_CBLOCK
when 25 then
--|#line 118 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 118")
end
last_token := SYM_GE
when 26 then
--|#line 119 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 119")
end
last_token := SYM_LE
when 27 then
--|#line 120 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 120")
end
last_token := SYM_NE
when 28 then
--|#line 122 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 122")
end
last_token := SYM_LT
when 29 then
--|#line 123 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 123")
end
last_token := SYM_GT
when 30 then
--|#line 125 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 125")
end
last_token := SYM_MODULO
when 31 then
--|#line 126 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 126")
end
last_token := SYM_DIV
when 32 then
--|#line 128 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 128")
end
last_token := SYM_ELLIPSIS
when 33 then
--|#line 129 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 129")
end
last_token := SYM_LIST_CONTINUE
when 34 then
--|#line 133 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 133")
end
last_token := SYM_MATCHES
when 35 then
--|#line 135 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 135")
end
last_token := SYM_MATCHES
when 36 then
--|#line 139 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 139")
end
last_token := SYM_THEN
when 37 then
--|#line 141 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 141")
end
last_token := SYM_ELSE
when 38 then
--|#line 143 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 143")
end
last_token := SYM_AND
when 39 then
--|#line 145 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 145")
end
last_token := SYM_OR
when 40 then
--|#line 147 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 147")
end
last_token := SYM_XOR
when 41 then
--|#line 149 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 149")
end
last_token := SYM_NOT
when 42 then
--|#line 151 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 151")
end
last_token := SYM_IMPLIES
when 43 then
--|#line 153 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 153")
end
last_token := SYM_TRUE
when 44 then
--|#line 155 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 155")
end
last_token := SYM_FALSE
when 45 then
--|#line 157 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 157")
end
last_token := SYM_FORALL
when 46 then
--|#line 159 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 159")
end
last_token := SYM_EXISTS
when 47 then
--|#line 163 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 163")
end
last_token := SYM_EXISTENCE
when 48 then
--|#line 165 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 165")
end
last_token := SYM_OCCURRENCES
when 49 then
--|#line 167 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 167")
end
last_token := SYM_CARDINALITY
when 50 then
--|#line 169 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 169")
end
last_token := SYM_ORDERED
when 51 then
--|#line 171 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 171")
end
last_token := SYM_UNORDERED
when 52 then
--|#line 173 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 173")
end
last_token := SYM_UNIQUE
when 53 then
--|#line 175 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 175")
end
last_token := SYM_USE_NODE
when 54 then
--|#line 177 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 177")
end
last_token := SYM_ALLOW_ARCHETYPE
when 55 then
--|#line 179 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 179")
end
last_token := SYM_INCLUDE
when 56 then
--|#line 181 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 181")
end
last_token := SYM_EXCLUDE
when 57 then
--|#line 183 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 183")
end
last_token := SYM_AFTER
when 58 then
--|#line 185 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 185")
end
last_token := SYM_BEFORE
when 59 then
--|#line 187 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 187")
end
last_token := SYM_CLOSED
when 60 then
--|#line 191 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 191")
end

		last_token := V_ROOT_ID_CODE
		last_string_value := text_substring (2, text_count - 1)
	
when 61 then
--|#line 197 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 197")
end

		last_token := V_ID_CODE
		last_string_value := text_substring (2, text_count - 1)
	
when 62 then
--|#line 204 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 204")
end

		last_token := V_ID_CODE_STR
		last_string_value := text
	
when 63 then
--|#line 213 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 213")
end

		str_ := text_substring (2, text_count - 1)
		last_string_value := str_.substring (str_.substring_index ("::", 1) + 2, str_.count)
		last_token := V_REUSED_ID_CODE
	
when 64 then
--|#line 221 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 221")
end

		last_token := V_VALUE_SET_REF
		last_string_value := text_substring (2, text_count - 1)
	
when 65 then
--|#line 242 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 242")
end

		set_start_condition (IN_EXPANDED_VALUE_SET_DEF)
		create last_term_constraint_parse_structure_value.make
		str_ := text_substring (2, text_count)
		last_term_constraint_parse_structure_value.set_terminology_id (str_.substring (1, str_.index_of (':', 1)-1))
		is_assumed_code := False
	
when 66 then
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
	
when 67 then
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
	
when 68 then
--|#line 281 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 281")
end
in_lineno := in_lineno + text_count
when 69 then
--|#line 284 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 284")
end
in_lineno := in_lineno + 1
when 70 then
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
	
when 71 then
--|#line 309 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 309")
end
	-- Catch-all rules (no backing up)
			last_token := ERR_VALUE_SET_DEF
			set_start_condition (INITIAL)
	
when 72 then
--|#line 319 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 319")
end

		last_token := ERR_VALUE_SET_MISSING_CODES
		err_str := text
	
when 73 then
--|#line 335 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 335")
end

		set_start_condition (IN_EXTERNAL_VALUE_SET_DEF)
		create last_term_constraint_parse_structure_value.make
		str_ := text_substring (2, text_count)
		last_term_constraint_parse_structure_value.set_terminology_id (str_.substring (1, str_.index_of (':', 1)-1))
		is_assumed_code := False
	
when 74 then
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
	
when 75 then
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
	
when 76 then
--|#line 374 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 374")
end
in_lineno := in_lineno + text_count
when 77 then
--|#line 377 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 377")
end
in_lineno := in_lineno + 1
when 78 then
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
	
when 79 then
--|#line 402 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 402")
end
	-- Catch-all rules (no backing up)
			last_token := ERR_VALUE_SET_DEF
			set_start_condition (INITIAL)
	
when 80, 81, 82 then
--|#line 411 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 411")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
when 83, 84 then
--|#line 420 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 420")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
when 85, 86 then
--|#line 428 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 428")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
when 87, 88 then
--|#line 436 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 436")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
when 89 then
--|#line 444 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 444")
end

				last_token := V_ISO8601_DURATION
				last_string_value := convert_non_conforming_duration(text)
			
when 90 then
--|#line 456 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 456")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
when 91 then
--|#line 466 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 466")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text_substring(2, text_count)
			
when 92 then
--|#line 471 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 471")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
when 93 then
--|#line 481 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 481")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
				last_string_value.put('T', last_string_value.index_of(' ', 1))
			
when 94 then
--|#line 487 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 487")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
when 95 then
--|#line 498 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 498")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN_ERR
				unread_character(last_string_value.item(last_string_value.count)) -- put back the last character 
				last_string_value := text
			
when 96 then
--|#line 507 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 507")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
when 97 then
--|#line 523 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 523")
end
	-- match a pattern like 'Type_Identifier whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
when 98 then
--|#line 530 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 530")
end
	-- match a pattern like '(Type_Identifier) whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
when 99 then
--|#line 536 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 536")
end
	-- match a pattern like '["at0004"] = (Type_Identifier)  <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
when 100 then
--|#line 542 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 542")
end
 -- match up to next > not followed by a '}' or '>' 
 				in_buffer.append_string (text)
 			
when 101 then
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
				if not odin_parser.syntax_error and attached odin_parser.output as att_output then
					if att_output.is_typed then
						tid := dynamic_type_from_string (att_output.im_type_name)
						if tid >= 0 then
							if attached {C_DV_QUANTITY} att_output.as_object(tid, Void) as cdt then
								last_c_dv_quantity_value := cdt
								last_token := V_C_DV_QUANTITY
							else
								odin_parser_error.add_error (ec_VDTCV, <<att_output.im_type_name>>, "")
								last_token := ERR_C_DV_QUANTITY_1
							end
						else
							odin_parser_error.add_error (ec_VDTTU, <<att_output.im_type_name>>, "")
							last_token := ERR_C_DV_QUANTITY_2
						end
					else
						odin_parser_error.add_error (ec_VDTNT, Void, "")
						last_token := ERR_C_DV_QUANTITY_3
					end
				else
					odin_parser_error.append (odin_parser.errors)
					last_token := ERR_C_DV_QUANTITY_4
				end

				in_buffer.wipe_out
				set_start_condition (INITIAL)
 			
when 102 then
--|#line 588 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 588")
end
 -- match up to next '}' not preceded by a '>'
 				in_buffer.append_string (text)
  			
when 103 then
--|#line 598 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 598")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
when 104 then
--|#line 604 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 604")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
when 105 then
--|#line 610 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 610")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
when 106 then
--|#line 617 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 617")
end

			last_token := V_ATTRIBUTE_IDENTIFIER
			last_string_value := text
		
when 107 then
--|#line 623 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 623")
end
		-- matches an absolute path string with segments of form "/attr_name" or "/attr_name[id-code]"
			last_token := V_ABS_PATH
			last_string_value := text
		
when 108 then
--|#line 629 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 629")
end
		-- matches a relative path string with segments of form "/attr_name" or "/attr_name[id-code]"
			last_token := V_REL_PATH
			last_string_value := text
		
when 109 then
--|#line 635 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 635")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			
when 110 then
--|#line 642 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 642")
end
 		-- match segment consisting of non / or [
				in_buffer.append_string (text)
	
when 111 then
--|#line 646 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 646")
end
 		-- match [] segment
				in_buffer.append_string (text)
	
when 112 then
--|#line 650 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 650")
end
 		-- match segment ending in quoted slashes '\/'
				in_buffer.append_string (text)
	
when 113 then
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
	
when 114 then
--|#line 666 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 666")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
when 115 then
--|#line 673 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 673")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
when 116 then
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
			
when 117, 118 then
--|#line 693 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 693")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
when 119, 120, 121 then
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
			
when 122 then
--|#line 720 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 720")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
when 123 then
--|#line 725 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 725")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
when 124 then
--|#line 733 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 733")
end
in_buffer.append_character ('\')
when 125 then
--|#line 735 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 735")
end
in_buffer.append_character ('"')
when 126 then
--|#line 737 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 737")
end

				in_buffer.append_string (text)
	
when 127 then
--|#line 741 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 741")
end
in_buffer.append_string (text)
when 128 then
--|#line 743 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 743")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
when 129 then
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
			
when 130 then
--|#line 759 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 759")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
when 131 then
--|#line 768 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 768")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
when 132 then
--|#line 770 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 770")
end
last_token := V_CHARACTER; last_character_value := '%N'
when 133 then
--|#line 771 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 771")
end
last_token := V_CHARACTER; last_character_value := '%R'
when 134 then
--|#line 772 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 772")
end
last_token := V_CHARACTER; last_character_value := '%T'
when 135 then
--|#line 773 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 773")
end
last_token := V_CHARACTER; last_character_value := '%''
when 136 then
--|#line 774 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 774")
end
last_token := V_CHARACTER; last_character_value := '%H'
when 137, 138 then
--|#line 776 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 776")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
when 139 then
--|#line 781 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 781")
end
;
when 140 then
--|#line 0 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 0")
end
default_action
			else
				last_token := yyError_token
				fatal_error ("fatal scanner internal error: no action found")
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
			create an_array.make_filled (0, 0, 5243)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			yy_nxt_template_3 (an_array)
			yy_nxt_template_4 (an_array)
			yy_nxt_template_5 (an_array)
			yy_nxt_template_6 (an_array)
			yy_nxt_template_7 (an_array)
			yy_nxt_template_8 (an_array)
			yy_nxt_template_9 (an_array)
			yy_nxt_template_10 (an_array)
			yy_nxt_template_11 (an_array)
			yy_nxt_template_12 (an_array)
			yy_nxt_template_13 (an_array)
			yy_nxt_template_14 (an_array)
			yy_nxt_template_15 (an_array)
			yy_nxt_template_16 (an_array)
			yy_nxt_template_17 (an_array)
			yy_nxt_template_18 (an_array)
			yy_nxt_template_19 (an_array)
			yy_nxt_template_20 (an_array)
			yy_nxt_template_21 (an_array)
			yy_nxt_template_22 (an_array)
			yy_nxt_template_23 (an_array)
			yy_nxt_template_24 (an_array)
			yy_nxt_template_25 (an_array)
			yy_nxt_template_26 (an_array)
			an_array.area.fill_with (765, 5154, 5243)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			    0,   15,   16,   15,   15,   17,   18,   19,   20,   21,
			   22,   23,   24,   25,   26,   27,   28,   29,   29,   29,
			   30,   30,   30,   31,   32,   33,   34,   35,   36,   37,
			   38,   39,   40,   41,   42,   40,   43,   44,   40,   45,
			   46,   47,   48,   40,   40,   40,   49,   50,   40,   51,
			   52,   40,   53,   54,   55,   56,   14,   57,   58,   59,
			   60,   61,   62,   60,   63,   64,   60,   65,   66,   67,
			   60,   60,   60,   60,   68,   69,   60,   70,   71,   72,
			   73,   74,   14,   14,   14,   14,   14,   14,   14,   14,
			   14,   76,   85,  108,   85,   77,   76,   89,   89,  214,

			   77,   92,   93,  197,   92,   92,   93,  102,   92,  102,
			  102,  209,  123,  123,   94,  123,  650,  112,   94,  113,
			  113,  113,  113,  113,  113,  297,  705,  297,   86,   87,
			   86,   87,  123,  123,  205,  123,  125,  158,  109,  303,
			  226,  110,   78,  226,  129,  159,  160,   78,  210,  211,
			  198,   90,   90,  215,  748,  226,  125,   95,  226,  500,
			  196,   95,  196,  196,  102,   96,  102,  102,  706,   96,
			  206,  207,  129,  301,   79,   80,   81,   82,   83,   79,
			   80,   81,   82,   83,   98,   99,   97,   98,   97,   97,
			   97,   97,   97,   97,   97,   97,   97,  100,  101,   97, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  101,  101,  101,  101,  101,  101,   97,   97,   97,   97,
			   97,   97,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,   97,   97,   97,   97,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,   97,   97,   97,   97,   97,   97,   97,   97,
			   97,   97,   97,   97,  116,  195,  117,  248,  118,  118,
			  118,  118,  118,  118,  116,  297,  117,  195,  120,  120,
			  120,  120,  120,  120,  220,  123,  123,  220,  123,  747,

			  163,  123,  123,  163,  123,  212,  123,  123,  164,  123,
			  731,  123,  123,  249,  123,  230,  730,  119,  230,  125,
			  123,  123,  300,  123,  700,  125,  696,  119,  126,  130,
			  125,  195,  127,  232,  128,  125,  232,  163,  131,  134,
			  163,  206,  207,  132,  125,  164,  123,  123,  531,  123,
			  221,  135,  165,  200,  133,  136,  126,  130,  222,  297,
			  127,  195,  128,  199,  199,  199,  131,  134,  165,  171,
			  125,  132,  123,  123,  443,  123,  677,  123,  123,  135,
			  123,  651,  133,  136,  137,  138,  123,  123,  170,  123,
			  139,  123,  123,  209,  123,  417,  125,  171,  214,  163, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  140,  125,  163,  123,  123,  205,  123,  164,  202,  202,
			  125,  339,  137,  138,  165,  125,  142,  141,  139,  250,
			  250,  250,  250,  250,  250,  649,  151,  125,  140,  143,
			  210,  211,  123,  123,  152,  123,  648,  201,  201,  201,
			  636,  206,  207,  155,  142,  141,  123,  123,  297,  123,
			  170,  195,  215,  115,  151,  341,  125,  143,  123,  123,
			  115,  123,  152,  195,  535,  535,  166,  189,  195,  248,
			  125,  155,  190,  144,  145,  145,  145,  145,  145,  145,
			  539,  156,  125,  163,  298,  153,  163,  166,  165,  146,
			  154,  164,  210,  211,  166,  189,  147,  569,  165,  299,

			  190,  123,  123,  148,  123,  149,  615,  150,  196,  156,
			  196,  196,  243,  153,  243,  243,  167,  146,  154,  212,
			  168,  119,  169,  163,  147,  256,  163,  203,  203,  203,
			  609,  164,  165,  149,  170,  150,  570,  445,  165,  163,
			  445,  200,  163,  459,  167,  202,  202,  164,  168,  163,
			  169,  172,  163,  297,  165,  206,  207,  164,  163,  450,
			  173,  163,  123,  123,  165,  123,  164,  163,  418,  229,
			  163,  195,  229,  165,  170,  164,  174,  176,  433,  172,
			  220,  230,  165,  220,  567,  548,  125,  175,  173,  177,
			  170,  163,  232,  178,  163,  183,  566,  116,  447,  164, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  170,  447,  501,  374,  174,  176,  165,  123,  123,  170,
			  123,  163,  452,  410,  163,  175,  410,  177,  170,  164,
			  348,  178,  233,  183,  163,  163,  165,  163,  163,  179,
			  180,  125,  164,  164,  385,  181,  221,  348,  163,  165,
			  165,  163,  170,  340,  222,  385,  164,  199,  199,  199,
			  182,  184,  258,  165,  185,  385,  163,  179,  180,  163,
			  187,  421,  170,  181,  164,  195,  492,  186,  188,  123,
			  123,  165,  123,  385,  229,  170,  170,  229,  191,  184,
			  258,  195,  185,  712,  712,  712,  230,  231,  187,  170,
			  493,  349,  348,  125,  349,  186,  188,  232,  297,  245,

			  245,  245,  245,  245,  245,  192,  191,  170,  123,  123,
			  410,  123,  116,  264,  117,  246,  253,  253,  253,  253,
			  253,  253,  254,  350,  348,  374,  350,  233,  364,  494,
			  269,  765,  125,  192,  217,  217,  495,  217,  247,  495,
			  236,  264,  358,  246,  332,  333,  334,  335,  336,  237,
			  237,  237,  237,  237,  237,  119,  195,  199,  199,  199,
			  218,  563,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  238,  251,  251,  251,  251,
			  251,  251,  255,  255,  255,  255,  255,  255,  123,  123, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  239,  123,  252,  116,  240,  117,  241,  253,  253,  253,
			  253,  253,  253,  357,  219,  246,  123,  123,  356,  123,
			  123,  123,  125,  123,  123,  123,  587,  123,  123,  123,
			  252,  123,  337,  337,  337,  259,  123,  123,  247,  123,
			  125,  635,  563,  246,  125,  563,  119,  260,  125,  355,
			  614,  352,  125,  261,  123,  123,  228,  123,  123,  123,
			  125,  123,  343,  259,  368,  588,  265,  262,  263,  635,
			  223,  225,  266,  123,  123,  260,  123,  163,  125,  225,
			  163,  261,  125,  123,  123,  164,  123,  123,  123,  765,
			  123,  267,  165,  339,  265,  262,  263,  125,  496,  340,

			  266,  268,  123,  123,  652,  123,  297,  125,  339,  123,
			  123,  125,  123,  271,  270,  123,  123,  195,  123,  267,
			  123,  123,  307,  123,  123,  123,  125,  123,  170,  268,
			  302,  162,  273,  125,  297,  123,  123,  497,  123,  125,
			  277,  271,  270,  653,  125,  275,  123,  123,  125,  123,
			  144,  276,  123,  123,  274,  123,  294,  272,  244,  125,
			  273,  144,  243,  123,  123,  717,  123,  715,  123,  123,
			  125,  123,  242,  275,  235,  715,  125,  146,  144,  276,
			  284,  106,  274,  278,  294,  278,  765,  125,  715,  103,
			  603,  284,  125,  149,  146,  124,  124,  124,  124,  124, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  124,  296,  279,  715,  718,  146,  280,  603,  284,  281,
			  643,  603,  123,  123,  291,  123,  124,  228,  282,  225,
			  283,  149,  146,  225,  284,  224,  223,  643,  124,  296,
			  279,  643,  474,  195,  280,  603,  125,  281,  123,  123,
			  487,  123,  291,  474,  289,  195,  282,  290,  283,  123,
			  123,  487,  123,  474,  193,  643,  124,  123,  123,  162,
			  123,  487,  125,  122,  144,  285,  285,  285,  285,  285,
			  285,  474,  289,  125,  292,  290,  121,  114,  293,  487,
			  163,  125,  163,  163,  286,  163,  163,  287,  164,  163,
			  164,  111,  106,  288,  164,  165,  195,  165,  104,  103,

			  295,  165,  292,  765,  765,  163,  293,  765,  163,  338,
			  338,  338,  286,  164,  716,  287,  765,  306,  765,  305,
			  165,  288,  716,  765,  163,  304,  163,  163,  295,  163,
			  765,  170,  164,  170,  164,  716,  765,  170,  308,  165,
			  163,  165,  765,  163,  765,  306,  163,  305,  164,  163,
			  716,  765,  765,  304,  164,  165,  170,  342,  342,  765,
			  342,  165,  765,  195,  765,  765,  308,  309,  342,  342,
			  311,  342,  199,  199,  199,  170,  312,  170,  163,  765,
			  310,  163,  313,  218,  163,  765,  164,  163,  765,  765,
			  765,  170,  164,  165,  765,  309,  765,  170,  311,  165, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
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
			  328,  329,  372,  372,  372,  372,  372,  331,  344,  345, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  345,  345,  345,  345,  330,  217,  217,  229,  217,  233,
			  229,  353,  354,  354,  354,  354,  354,  354,  361,  230,
			  361,  765,  765,  362,  362,  362,  362,  362,  362,  765,
			  232,  218,  765,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  199,  199,  199,  765,
			  233,  360,  360,  360,  360,  360,  360,  363,  363,  363,
			  363,  363,  363,  663,  663,  663,  663,  246,  365,  365,
			  365,  365,  365,  365,  765,  219,  347,  348,  346,  347,
			  346,  346,  346,  346,  346,  346,  346,  346,  349,  651,

			  247,  346,  651,  123,  123,  246,  123,  765,  346,  350,
			  346,  346,  346,  346,  366,  366,  366,  366,  366,  366,
			  373,  373,  373,  373,  373,  373,  369,  125,  369,  765,
			  367,  370,  370,  370,  370,  370,  370,  346,  346,  351,
			  346,  116,  765,  117,  765,  371,  371,  371,  371,  371,
			  371,  765,  492,  368,  123,  123,  765,  123,  367,  123,
			  123,  765,  123,  678,  346,  346,  346,  346,  346,  346,
			  346,  346,  346,  346,  346,  346,  123,  123,  125,  123,
			  765,  765,  765,  125,  119,  765,  375,  123,  123,  765,
			  123,  123,  123,  765,  123,  123,  123,  765,  123,  376, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_nxt_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  125,  123,  123,  110,  123,  123,  123,  110,  123,  765,
			  110,  125,  765,  110,  375,  125,  377,  645,  378,  125,
			  765,  123,  123,  765,  123,  125,  765,  376,  765,  125,
			  765,  765,  381,  380,  645,  379,  765,  765,  645,  765,
			  123,  123,  765,  123,  377,  125,  378,  123,  123,  382,
			  123,  123,  123,  765,  123,  123,  123,  765,  123,  765,
			  381,  380,  645,  379,  125,  383,  123,  123,  673,  123,
			  765,  125,  765,  123,  123,  125,  123,  382,  765,  125,
			  123,  123,  765,  123,  386,  673,  765,  765,  387,  673,
			  125,  388,  765,  383,  765,  384,  389,  125,  392,  392,

			  392,  392,  392,  392,  125,  391,  124,  124,  124,  124,
			  124,  124,  386,  673,  765,  765,  387,  765,  650,  388,
			  123,  123,  650,  123,  389,  650,  390,  765,  650,  123,
			  123,  556,  123,  391,  765,  765,  393,  393,  393,  393,
			  393,  393,  556,  765,  125,  395,  395,  395,  395,  395,
			  395,  765,  556,  125,  390,  123,  123,  765,  123,  362,
			  362,  362,  362,  362,  362,  394,  123,  123,  765,  123,
			  556,  396,  396,  396,  396,  396,  396,  123,  123,  125,
			  123,  765,  397,  397,  397,  397,  397,  397,  765,  399,
			  125,  399,  765,  398,  398,  398,  398,  398,  398,  765, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_nxt_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  394,  125,  765,  765,  124,  124,  124,  124,  124,  124,
			  765,  394,  400,  123,  123,  401,  123,  123,  123,  765,
			  123,  402,  394,  124,  123,  123,  765,  123,  144,  765,
			  123,  123,  144,  123,  765,  123,  123,  125,  123,  560,
			  400,  125,  765,  401,  123,  123,  765,  123,  125,  402,
			  560,  124,  404,  765,  125,  123,  123,  288,  123,  125,
			  561,  765,  765,  403,  536,  765,  536,  405,  125,  123,
			  123,  765,  123,  123,  123,  537,  123,  227,  560,  125,
			  123,  123,  227,  123,  227,  288,  406,  227,  765,  765,
			  227,  403,  765,  125,  765,  405,  765,  125,  407,  123,

			  123,  765,  123,  538,  125,  411,  412,  412,  412,  412,
			  412,  297,  765,  413,  406,  413,  413,  413,  413,  413,
			  413,  297,  765,  125,  408,  765,  407,  765,  765,  409,
			  414,  415,  416,  416,  416,  416,  297,  163,  163,  163,
			  163,  163,  163,  765,  765,  164,  164,  164,  123,  123,
			  765,  123,  165,  165,  165,  765,  163,  409,  163,  163,
			  163,  163,  163,  163,  164,  163,  164,  765,  164,  419,
			  164,  165,  125,  165,  765,  165,  765,  165,  420,  765,
			  469,  765,  765,  765,  163,  765,  765,  163,  170,  170,
			  170,  423,  164,  765,  425,  163,  422,  419,  163,  165, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_nxt_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  765,  765,  424,  164,  765,  765,  420,  170,  469,  170,
			  165,  170,  163,  170,  765,  163,  765,  765,  765,  423,
			  164,  426,  425,  163,  422,  163,  163,  165,  163,  163,
			  424,  164,  163,  164,  765,  170,  765,  164,  165,  427,
			  165,  765,  765,  765,  165,  163,  170,  765,  163,  426,
			  765,  123,  123,  164,  123,  765,  428,  765,  123,  123,
			  165,  123,  430,  170,  765,  765,  431,  427,  451,  451,
			  451,  451,  451,  451,  170,  125,  170,  765,  429,  765,
			  170,  432,  125,  163,  428,  163,  163,  765,  163,  765,
			  430,  164,  765,  164,  431,  765,  170,  433,  165,  433,

			  165,  320,  320,  320,  320,  320,  320,  163,  163,  432,
			  163,  163,  765,  765,  765,  164,  164,  163,  163,  765,
			  163,  163,  165,  165,  765,  164,  164,  123,  123,  765,
			  123,  765,  165,  165,  170,  765,  170,  434,  163,  163,
			  765,  163,  163,  765,  765,  612,  164,  164,  765,  765,
			  436,  125,  163,  165,  165,  163,  612,  765,  170,  170,
			  164,  123,  123,  435,  123,  434,  613,  165,  170,  170,
			  465,  438,  163,  163,  765,  163,  163,  437,  436,  765,
			  164,  164,  765,  444,  612,  125,  444,  165,  165,  170,
			  170,  435,  765,  163,  439,  445,  163,  446,  465,  438, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_nxt_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  613,  164,  765,  170,  163,  437,  447,  163,  165,  765,
			  765,  613,  164,  123,  123,  440,  123,  347,  348,  165,
			  347,  613,  439,  170,  170,  765,  491,  765,  441,  349,
			  449,  449,  449,  449,  449,  449,  448,  125,  765,  613,
			  350,  765,  444,  440,  170,  444,  353,  354,  354,  354,
			  354,  354,  354,  442,  445,  170,  446,  765,  345,  345,
			  345,  345,  345,  345,  765,  447,  765,  765,  765,  450,
			  351,  453,  453,  453,  453,  453,  453,  765,  765,  765,
			  765,  442,  454,  454,  454,  454,  454,  454,  457,  457,
			  457,  457,  457,  457,  455,  448,  455,  765,  367,  456,

			  456,  456,  456,  456,  456,  370,  370,  370,  370,  370,
			  370,  458,  458,  458,  458,  458,  458,  765,  765,  765,
			  765,  368,  765,  765,  460,  461,  367,  462,  462,  462,
			  462,  462,  462,  463,  463,  463,  463,  463,  463,  464,
			  464,  464,  464,  464,  464,  123,  123,  765,  123,  765,
			  459,  123,  123,  765,  123,  123,  123,  765,  123,  123,
			  123,  765,  123,  123,  123,  765,  123,  765,  765,  125,
			  765,  123,  123,  765,  123,  125,  765,  123,  123,  125,
			  123,  444,  765,  125,  444,  123,  123,  125,  123,  765,
			  765,  468,  466,  445,  467,  125,  765,  765,  765,  123, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_nxt_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  123,  125,  123,  472,  447,  470,  765,  675,  471,  125,
			  765,  675,  765,  473,  123,  123,  477,  123,  765,  468,
			  466,  765,  467,  125,  123,  123,  765,  123,  675,  123,
			  123,  472,  123,  470,  448,  475,  471,  765,  125,  675,
			  765,  473,  123,  123,  477,  123,  123,  123,  125,  123,
			  676,  765,  765,  125,  676,  123,  123,  765,  123,  478,
			  476,  765,  765,  475,  765,  765,  125,  765,  765,  765,
			  125,  676,  479,  392,  392,  392,  392,  392,  392,  125,
			  765,  124,  676,  765,  124,  480,  489,  478,  476,  765,
			  124,  395,  395,  395,  395,  395,  395,  765,  765,  765,

			  479,  481,  765,  398,  398,  398,  398,  398,  398,  124,
			  124,  765,  124,  480,  489,  765,  765,  765,  124,  765,
			  765,  765,  396,  396,  396,  396,  396,  396,  765,  481,
			  393,  393,  393,  393,  393,  393,  124,  279,  124,  484,
			  484,  484,  484,  484,  484,  124,  765,  123,  123,  765,
			  123,  765,  482,  282,  765,  485,  485,  485,  485,  485,
			  485,  124,  765,  124,  124,  279,  123,  123,  765,  123,
			  124,  125,  765,  124,  504,  505,  505,  505,  505,  505,
			  482,  282,  397,  397,  397,  397,  397,  397,  765,  124,
			  125,  124,  693,  488,  765,  765,  693,  483,  124,  486, yy_Dummy>>,
			1, 200, 2400)
		end

	yy_nxt_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  486,  486,  486,  486,  486,  123,  123,  765,  123,  124,
			  124,  765,  163,  693,  124,  163,  124,  124,  765,  124,
			  164,  488,  124,  765,  693,  483,  765,  165,  493,  125,
			  412,  412,  412,  412,  412,  412,  297,  123,  123,  765,
			  123,  765,  124,  413,  490,  413,  413,  413,  413,  413,
			  413,  297,  498,  765,  416,  416,  416,  416,  416,  416,
			  297,  125,  765,  170,  765,  765,  765,  494,  765,  765,
			  765,  496,  490,  416,  416,  416,  416,  416,  416,  297,
			  163,  163,  495,  163,  163,  765,  765,  765,  164,  164,
			  163,  499,  540,  163,  163,  165,  165,  163,  164,  751,

			  765,  765,  164,  163,  163,  165,  163,  163,  765,  165,
			  497,  164,  164,  765,  163,  765,  751,  163,  165,  165,
			  751,  765,  164,  502,  123,  123,  765,  123,  503,  165,
			  507,  170,  170,  506,  163,  508,  726,  163,  726,  765,
			  765,  170,  164,  765,  751,  170,  765,  727,  125,  165,
			  509,  502,  765,  765,  170,  170,  503,  765,  507,  510,
			  765,  506,  765,  508,  163,  170,  511,  163,  163,  765,
			  765,  163,  164,  765,  163,  728,  164,  163,  509,  165,
			  765,  765,  164,  165,  765,  170,  694,  510,  163,  165,
			  694,  163,  512,  765,  511,  765,  164,  516,  517,  517, yy_Dummy>>,
			1, 200, 2600)
		end

	yy_nxt_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  517,  517,  517,  165,  513,  765,  163,  694,  163,  163,
			  765,  163,  765,  515,  164,  170,  164,  765,  694,  170,
			  512,  165,  765,  165,  765,  170,  765,  163,  765,  765,
			  163,  765,  513,  765,  514,  164,  765,  163,  765,  170,
			  163,  515,  165,  518,  744,  164,  744,  765,  163,  519,
			  163,  163,  165,  163,  765,  745,  164,  170,  164,  170,
			  765,  163,  514,  165,  163,  165,  765,  765,  765,  164,
			  520,  518,  163,  765,  765,  163,  165,  519,  170,  765,
			  164,  765,  163,  746,  765,  163,  765,  165,  170,  765,
			  164,  765,  522,  765,  765,  491,  521,  165,  520,  170,

			  765,  170,  344,  524,  524,  524,  524,  524,  765,  765,
			  765,  523,  170,  525,  525,  525,  525,  525,  525,  765,
			  522,  765,  765,  170,  521,  526,  526,  526,  526,  526,
			  526,  765,  765,  170,  596,  596,  596,  596,  596,  523,
			  360,  360,  360,  360,  360,  360,  527,  528,  528,  528,
			  528,  528,  450,  529,  529,  529,  529,  529,  529,  456,
			  456,  456,  456,  456,  456,  123,  123,  765,  123,  367,
			  530,  530,  530,  530,  530,  530,  532,  532,  532,  532,
			  532,  532,  533,  533,  533,  533,  533,  533,  765,  125,
			  765,  765,  368,  123,  123,  765,  123,  367,  534,  534, yy_Dummy>>,
			1, 200, 2800)
		end

	yy_nxt_template_16 (an_array: ARRAY [INTEGER])
			-- Fill chunk #16 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  534,  534,  534,  534,  123,  123,  765,  123,  736,  531,
			  529,  529,  529,  529,  529,  529,  765,  125,  765,  736,
			  461,  459,  462,  462,  462,  462,  462,  462,  125,  736,
			  123,  123,  542,  123,  123,  123,  541,  123,  123,  123,
			  765,  123,  123,  123,  765,  123,  752,  736,  123,  123,
			  765,  123,  123,  123,  125,  123,  765,  765,  125,  765,
			  542,  543,  125,  752,  541,  544,  125,  752,  123,  123,
			  545,  123,  125,  765,  765,  765,  125,  765,  765,  547,
			  549,  765,  546,  550,  765,  123,  123,  765,  123,  543,
			  765,  752,  125,  544,  123,  123,  765,  123,  545,  765,

			  551,  554,  554,  554,  554,  554,  554,  547,  549,  125,
			  546,  550,  123,  123,  765,  123,  124,  553,  125,  484,
			  484,  484,  484,  484,  484,  765,  765,  765,  551,  486,
			  486,  486,  486,  486,  486,  765,  125,  552,  123,  123,
			  163,  123,  765,  163,  124,  553,  765,  555,  164,  123,
			  123,  124,  123,  123,  123,  165,  123,  394,  765,  765,
			  765,  765,  125,  123,  123,  552,  123,  765,  123,  123,
			  557,  123,  765,  125,  765,  555,  399,  125,  399,  124,
			  485,  485,  485,  485,  485,  485,  765,  125,  765,  559,
			  765,  170,  125,  765,  765,  124,  123,  123,  557,  123, yy_Dummy>>,
			1, 200, 3000)
		end

	yy_nxt_template_17 (an_array: ARRAY [INTEGER])
			-- Fill chunk #17 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  558,  765,  401,  123,  123,  765,  123,  765,  402,  411,
			  562,  562,  562,  562,  562,  297,  163,  559,  765,  163,
			  125,  765,  765,  124,  164,  765,  765,  125,  558,  765,
			  401,  165,  765,  765,  765,  765,  402,  414,  564,  564,
			  564,  564,  564,  297,  414,  565,  564,  564,  564,  564,
			  297,  569,  765,  505,  505,  505,  505,  505,  505,  765,
			  163,  163,  163,  163,  163,  163,  765,  170,  164,  164,
			  164,  568,  765,  765,  765,  165,  165,  165,  765,  163,
			  765,  163,  163,  163,  163,  765,  163,  164,  765,  164,
			  570,  164,  571,  573,  165,  765,  165,  765,  165,  163,

			  572,  163,  163,  765,  163,  123,  123,  164,  123,  164,
			  574,  170,  170,  170,  165,  575,  165,  765,  765,  765,
			  571,  573,  123,  123,  765,  123,  765,  576,  572,  125,
			  170,  765,  170,  578,  170,  765,  577,  600,  574,  163,
			  765,  163,  163,  575,  163,  163,  125,  164,  163,  164,
			  170,  765,  170,  164,  165,  576,  165,  765,  765,  765,
			  165,  578,  765,  765,  577,  600,  765,  765,  755,  433,
			  579,  517,  517,  517,  517,  517,  517,  580,  163,  163,
			  163,  163,  163,  163,  765,  755,  164,  164,  164,  755,
			  170,  765,  170,  165,  165,  165,  170,  765,  579,  163, yy_Dummy>>,
			1, 200, 3200)
		end

	yy_nxt_template_18 (an_array: ARRAY [INTEGER])
			-- Fill chunk #18 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  163,  163,  163,  163,  163,  580,  765,  164,  164,  164,
			  765,  582,  583,  755,  165,  165,  165,  665,  666,  665,
			  666,  581,  586,  586,  586,  586,  586,  586,  765,  170,
			  170,  170,  584,  591,  591,  591,  591,  591,  591,  582,
			  583,  585,  765,  123,  123,  444,  123,  765,  444,  581,
			  170,  170,  170,  765,  765,  765,  667,  445,  765,  446,
			  584,  524,  524,  524,  524,  524,  524,  125,  447,  585,
			  587,  765,  528,  528,  528,  528,  528,  528,  529,  529,
			  529,  529,  529,  529,  590,  590,  590,  590,  590,  590,
			  765,  765,  765,  765,  589,  765,  765,  765,  448,  592,

			  592,  592,  592,  592,  592,  765,  765,  765,  765,  588,
			  593,  593,  593,  593,  593,  593,  594,  594,  594,  594,
			  594,  594,  589,  531,  595,  595,  595,  595,  595,  595,
			  597,  597,  597,  597,  597,  597,  123,  123,  765,  123,
			  756,  123,  123,  765,  123,  765,  252,  123,  123,  765,
			  123,  123,  123,  765,  123,  123,  123,  756,  123,  765,
			  125,  756,  765,  765,  598,  125,  765,  123,  123,  599,
			  123,  125,  765,  765,  252,  125,  765,  123,  123,  125,
			  123,  123,  123,  765,  123,  756,  601,  163,  602,  765,
			  163,  125,  598,  123,  123,  164,  123,  599,  765,  604, yy_Dummy>>,
			1, 200, 3400)
		end

	yy_nxt_template_19 (an_array: ARRAY [INTEGER])
			-- Fill chunk #19 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  765,  125,  165,  115,  115,  125,  765,  115,  115,  605,
			  115,  606,  765,  607,  601,  618,  602,  125,  123,  123,
			  765,  123,  123,  123,  608,  123,  278,  604,  278,  765,
			  554,  554,  554,  554,  554,  554,  765,  605,  170,  606,
			  765,  607,  125,  618,  765,  124,  125,  123,  123,  765,
			  123,  765,  608,  611,  616,  617,  617,  617,  617,  617,
			  493,  610,  562,  562,  562,  562,  562,  562,  297,  765,
			  765,  125,  496,  124,  564,  564,  564,  564,  564,  564,
			  297,  611,  504,  619,  619,  619,  619,  619,  498,  610,
			  564,  564,  564,  564,  564,  564,  297,  163,  163,  494,

			  163,  163,  765,  737,  765,  164,  164,  163,  765,  765,
			  163,  497,  165,  165,  737,  164,  123,  123,  163,  123,
			  163,  163,  165,  163,  737,  620,  164,  499,  164,  163,
			  765,  765,  163,  165,  765,  165,  765,  164,  765,  621,
			  125,  765,  737,  765,  165,  765,  765,  163,  170,  170,
			  163,  765,  765,  620,  765,  164,  765,  622,  170,  765,
			  163,  765,  165,  163,  765,  765,  623,  621,  164,  170,
			  765,  170,  765,  163,  163,  165,  163,  163,  765,  765,
			  170,  164,  164,  123,  123,  622,  123,  163,  165,  165,
			  163,  624,  625,  163,  623,  164,  163,  163,  170,  765, yy_Dummy>>,
			1, 200, 3600)
		end

	yy_nxt_template_20 (an_array: ARRAY [INTEGER])
			-- Fill chunk #20 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  163,  164,  165,  765,  765,  164,  627,  125,  165,  765,
			  765,  170,  165,  642,  765,  765,  765,  626,  628,  624,
			  625,  765,  765,  765,  170,  170,  765,  163,  157,  157,
			  163,  157,  765,  157,  627,  164,  157,  765,  170,  157,
			  629,  642,  165,  765,  170,  626,  628,  765,  170,  525,
			  525,  525,  525,  525,  525,  765,  765,  765,  630,  527,
			  631,  631,  631,  631,  631,  632,  765,  632,  629,  765,
			  633,  633,  633,  633,  633,  633,  765,  765,  170,  633,
			  633,  633,  633,  633,  633,  765,  630,  634,  634,  634,
			  634,  634,  634,  533,  533,  533,  533,  533,  533,  637,

			  637,  637,  637,  637,  637,  638,  638,  638,  638,  638,
			  638,  639,  639,  639,  639,  639,  639,  765,  531,  123,
			  123,  765,  123,  123,  123,  765,  123,  635,  123,  123,
			  765,  123,  123,  123,  765,  123,  765,  123,  123,  765,
			  123,  123,  123,  125,  123,  123,  123,  125,  123,  765,
			  368,  163,  125,  741,  163,  635,  125,  765,  765,  164,
			  641,  125,  640,  765,  741,  125,  165,  123,  123,  125,
			  123,  644,  765,  646,  741,  765,  652,  647,  617,  617,
			  617,  617,  617,  617,  765,  765,  765,  765,  641,  765,
			  640,  125,  741,  765,  654,  123,  123,  765,  123,  644, yy_Dummy>>,
			1, 200, 3800)
		end

	yy_nxt_template_21 (an_array: ARRAY [INTEGER])
			-- Fill chunk #21 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  765,  646,  170,  765,  569,  647,  619,  619,  619,  619,
			  619,  619,  765,  163,  765,  653,  163,  163,  765,  125,
			  163,  164,  654,  163,  765,  164,  163,  765,  165,  765,
			  765,  164,  165,  163,  163,  765,  163,  163,  165,  765,
			  765,  164,  164,  570,  163,  765,  765,  163,  165,  165,
			  655,  765,  164,  656,  163,  163,  765,  163,  163,  165,
			  765,  765,  164,  164,  170,  765,  765,  765,  170,  165,
			  165,  765,  163,  765,  170,  163,  123,  123,  655,  123,
			  164,  656,  765,  163,  170,  170,  163,  165,  765,  163,
			  765,  164,  163,  765,  657,  170,  765,  164,  165,  765,

			  125,  765,  765,  765,  165,  170,  170,  587,  671,  631,
			  631,  631,  631,  631,  631,  658,  765,  123,  123,  765,
			  123,  659,  657,  170,  633,  633,  633,  633,  633,  633,
			  765,  765,  765,  765,  170,  765,  671,  765,  765,  765,
			  170,  125,  765,  658,  765,  765,  588,  765,  765,  659,
			  633,  633,  633,  633,  633,  633,  660,  660,  660,  660,
			  660,  660,  661,  765,  661,  765,  765,  662,  662,  662,
			  662,  662,  662,  664,  664,  664,  664,  664,  664,  668,
			  668,  668,  668,  668,  668,  123,  123,  765,  123,  123,
			  123,  765,  123,  765,  765,  635,  123,  123,  765,  123, yy_Dummy>>,
			1, 200, 4000)
		end

	yy_nxt_template_22 (an_array: ARRAY [INTEGER])
			-- Fill chunk #22 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  123,  123,  765,  123,  163,  765,  765,  163,  765,  125,
			  765,  765,  164,  125,  163,  669,  765,  163,  368,  165,
			  125,  765,  164,  635,  125,  670,  672,  765,  765,  165,
			  765,  674,  616,  679,  679,  679,  679,  679,  677,  677,
			  681,  677,  163,  669,  680,  163,  765,  765,  163,  765,
			  164,  163,  765,  670,  672,  170,  164,  165,  163,  674,
			  765,  163,  695,  165,  765,  170,  164,  163,  681,  742,
			  163,  765,  680,  165,  682,  164,  123,  123,  683,  123,
			  742,  765,  165,  662,  662,  662,  662,  662,  662,  684,
			  742,  765,  765,  170,  734,  734,  734,  734,  734,  170,

			  125,  765,  682,  765,  765,  765,  683,  765,  742,  170,
			  685,  685,  685,  685,  685,  685,  765,  684,  170,  686,
			  686,  686,  686,  686,  686,  538,  538,  538,  538,  538,
			  538,  687,  687,  687,  687,  687,  687,  688,  688,  688,
			  688,  688,  688,  689,  689,  689,  689,  689,  689,  531,
			  123,  123,  765,  123,  123,  123,  765,  123,  765,  635,
			  123,  123,  652,  123,  679,  679,  679,  679,  679,  679,
			  765,  765,  765,  163,  125,  765,  163,  765,  125,  765,
			  765,  164,  368,  163,  125,  690,  163,  635,  165,  765,
			  765,  164,  692,  765,  163,  765,  765,  163,  165,  691, yy_Dummy>>,
			1, 200, 4200)
		end

	yy_nxt_template_23 (an_array: ARRAY [INTEGER])
			-- Fill chunk #23 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  765,  653,  164,  163,  163,  765,  163,  163,  697,  165,
			  765,  164,  164,  690,  765,  765,  765,  765,  165,  165,
			  692,  765,  765,  765,  170,  765,  765,  691,  698,  123,
			  123,  765,  123,  765,  170,  699,  697,  660,  660,  660,
			  660,  660,  660,  765,  765,  170,  701,  701,  701,  701,
			  701,  701,  765,  125,  170,  170,  698,  123,  123,  665,
			  123,  665,  765,  699,  688,  688,  688,  688,  688,  688,
			  689,  689,  689,  689,  689,  689,  531,  765,  703,  123,
			  123,  125,  123,  707,  708,  708,  708,  708,  708,  702,
			  765,  765,  163,  163,  163,  163,  163,  163,  667,  765,

			  164,  164,  164,  125,  765,  765,  703,  165,  165,  165,
			  713,  713,  713,  713,  713,  713,  765,  702,  750,  750,
			  750,  750,  750,  704,  709,  765,  123,  123,  765,  123,
			  123,  123,  163,  123,  765,  163,  765,  765,  711,  765,
			  164,  765,  710,  170,  170,  170,  765,  165,  765,  765,
			  125,  704,  709,  717,  125,  708,  708,  708,  708,  708,
			  708,  163,  765,  765,  163,  163,  711,  765,  163,  164,
			  710,  714,  765,  164,  765,  765,  165,  719,  123,  123,
			  165,  123,  765,  170,  720,  720,  720,  720,  720,  720,
			  765,  765,  718,  667,  667,  667,  667,  667,  667,  714, yy_Dummy>>,
			1, 200, 4400)
		end

	yy_nxt_template_24 (an_array: ARRAY [INTEGER])
			-- Fill chunk #24 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  123,  123,  125,  123,  765,  719,  707,  724,  724,  724,
			  724,  724,  170,  765,  163,  765,  170,  163,  123,  123,
			  765,  123,  164,  765,  125,  765,  765,  721,  717,  165,
			  724,  724,  724,  724,  724,  724,  163,  765,  765,  163,
			  765,  729,  125,  765,  164,  733,  733,  733,  733,  733,
			  733,  165,  765,  765,  765,  721,  123,  123,  163,  123,
			  765,  163,  765,  725,  765,  170,  164,  718,  765,  729,
			  765,  303,  303,  165,  765,  303,  303,  732,  303,  765,
			  125,  739,  739,  739,  739,  739,  739,  170,  735,  765,
			  738,  725,  740,  740,  740,  740,  740,  740,  163,  765,

			  765,  163,  765,  765,  765,  732,  164,  765,  765,  170,
			  765,  765,  765,  165,  765,  765,  735,  765,  738,  743,
			  743,  743,  743,  743,  743,  728,  728,  728,  728,  728,
			  728,  749,  749,  749,  749,  749,  749,  753,  753,  753,
			  753,  753,  753,  754,  754,  754,  754,  754,  754,  170,
			  757,  757,  757,  757,  757,  757,  758,  759,  758,  759,
			  746,  746,  746,  746,  746,  746,  761,  761,  761,  761,
			  761,  761,  762,  762,  762,  762,  762,  762,  763,  763,
			  763,  763,  763,  763,  758,  765,  758,  765,  765,  762,
			  762,  762,  762,  762,  762,  760,  764,  764,  764,  764, yy_Dummy>>,
			1, 200, 4600)
		end

	yy_nxt_template_25 (an_array: ARRAY [INTEGER])
			-- Fill chunk #25 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  764,  764,  760,  760,  760,  760,  760,  760,  166,  765,
			  166,  765,  765,  765,  166,  166,  765,  765,  166,  166,
			  765,  166,  765,  760,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   91,   91,   91,   91,   91,   91,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,   91,  105,  765,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,

			  765,  105,  105,  105,  107,  765,  107,  107,  107,  107,
			  107,  107,  107,  107,  107,  107,  107,  107,  107,  107,
			  161,  765,  161,  161,  161,  161,  161,  161,  161,  161,
			  161,  161,  161,  161,  161,  161,  194,  765,  194,  194,
			  194,  194,  194,  194,  194,  194,  194,  194,  765,  194,
			  194,  194,  204,  204,  204,  204,  204,  204,  204,  204,
			  204,  204,  204,  204,  204,  204,  204,  204,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  208,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213, yy_Dummy>>,
			1, 200, 4800)
		end

	yy_nxt_template_26 (an_array: ARRAY [INTEGER])
			-- Fill chunk #26 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  216,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  234,  765,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  111,  111,  111,  111,  111,  111,  111,  111,
			  111,  111,  111,  111,  111,  111,  111,  111,  257,  765,
			  765,  257,  257,  257,  257,  765,  765,  257,  206,  206,
			  206,  206,  206,  206,  765,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  209,  209,  209,  209,  209,  209,
			  209,  209,  209,  209,  209,  209,  209,  209,  209,  209,
			  219,  219,  765,  765,  765,  765,  765,  765,  765,  219,

			  219,  765,  765,  765,  219,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  346,  346,  346,
			  346,  346,  346,  346,  346,  346,  346,  346,  346,  346,
			  346,  346,  346,   13, yy_Dummy>>,
			1, 154, 5000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 5243)
			an_array.put (0, 0)
			an_array.area.fill_with (1, 1, 90)
			yy_chk_template_1 (an_array)
			an_array.area.fill_with (11, 184, 273)
			yy_chk_template_2 (an_array)
			yy_chk_template_3 (an_array)
			yy_chk_template_4 (an_array)
			yy_chk_template_5 (an_array)
			yy_chk_template_6 (an_array)
			yy_chk_template_7 (an_array)
			yy_chk_template_8 (an_array)
			yy_chk_template_9 (an_array)
			yy_chk_template_10 (an_array)
			yy_chk_template_11 (an_array)
			yy_chk_template_12 (an_array)
			yy_chk_template_13 (an_array)
			yy_chk_template_14 (an_array)
			yy_chk_template_15 (an_array)
			yy_chk_template_16 (an_array)
			yy_chk_template_17 (an_array)
			yy_chk_template_18 (an_array)
			yy_chk_template_19 (an_array)
			yy_chk_template_20 (an_array)
			yy_chk_template_21 (an_array)
			yy_chk_template_22 (an_array)
			yy_chk_template_23 (an_array)
			yy_chk_template_24 (an_array)
			yy_chk_template_25 (an_array)
			yy_chk_template_26 (an_array)
			an_array.area.fill_with (765, 5153, 5243)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    3,    5,   20,    6,    3,    4,    7,    8,   88,    4,
			    9,    9,   78,    9,   10,   10,   15,   10,   15,   15,
			   86,   38,   38,    9,   38,  797,   27,   10,   27,   27,
			   27,   27,   27,   27,  417,  693,  160,    5,    5,    6,
			    6,   40,   40,   84,   40,   38,   53,   20,  789,   98,
			  772,    3,   98,   38,   53,   53,    4,   86,   86,   78,
			    7,    8,   88,  742,  226,   40,    9,  226,  417,   76,
			   10,   76,   76,  102,    9,  102,  102,  693,   10,   84,
			   84,   38,  160,    3,    3,    3,    3,    3,    4,    4,
			    4,    4,    4, yy_Dummy>>,
			1, 93, 91)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   29,   80,   29,  115,   29,   29,   29,   29,   29,   29,
			   30,  159,   30,   79,   30,   30,   30,   30,   30,   30,
			   92,   37,   37,   92,   37,  741,  163,   39,   39,  163,
			   39,   87,   41,   41,  163,   41,  723,   42,   42,  115,
			   42,  230,  722,   29,  230,   37,   43,   43,  159,   43,
			  686,   39,  678,   30,   37,   39,   41,   82,   37,  232,
			   37,   42,  232,   58,   39,   42,   58,   87,   87,   41,
			   43,   58,   44,   44,  660,   44,   92,   42,   58,   80,
			   41,   43,   37,   39,   92,  301,   37,   81,   37,   79,
			   79,   79,   39,   42,  653,   58,   44,   41,   45,   45,

			  339,   45,  650,   46,   46,   42,   46,  615,   41,   43,
			   44,   44,   47,   47,   58,   47,   44,   49,   49,  208,
			   49,  301,   45,   58,  213,   60,   45,   46,   60,   51,
			   51,  204,   51,   60,   82,   82,   47,  339,   44,   44,
			   60,   49,   47,   46,   44,  116,  116,  116,  116,  116,
			  116,  613,   49,   51,   45,   47,  208,  208,   52,   52,
			   49,   52,  612,   81,   81,   81,  594,  204,  204,   51,
			   47,   46,   50,   50,  158,   50,   60,   83,  213,  773,
			   49,  210,   52,   47,   48,   48,  773,   48,   49,  333,
			  460,  460,   69,   69,  335,  588,   50,   51,   69,   48, yy_Dummy>>,
			1, 200, 274)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   48,   48,   48,   48,   48,   48,  464,   52,   48,   57,
			  158,   50,   57,   69,  570,   48,   50,   57,  210,  210,
			   69,   69,   48,  504,   57,  158,   69,  123,  123,   48,
			  123,   48,  566,   48,  196,   52,  196,  196,  243,   50,
			  243,  243,   57,   48,   50,  207,   57,  464,   57,   59,
			   48,  123,   59,   83,   83,   83,  556,   59,  303,   48,
			   57,   48,  504,  445,   59,   61,  445,  333,   61,  533,
			   57,  335,  335,   61,   57,   62,   57,   59,   62,  500,
			   61,  207,  207,   62,   63,  525,   59,   63,  124,  124,
			   62,  124,   63,   65,  303,  101,   65,  200,  101,   63,

			   59,   65,   61,   62,  516,   59,  220,  101,   65,  220,
			  501,  474,  124,   61,   59,   62,   61,   64,  101,   63,
			   64,   65,  500,  453,  447,   64,   62,  447,  418,  374,
			   61,   62,   64,  126,  126,   63,  126,   66,  364,  410,
			   66,   61,  410,   62,   65,   66,  351,   63,  101,   65,
			   67,   68,   66,   67,   68,   64,   64,  126,   67,   68,
			  269,   64,  220,  346,   70,   67,   68,   70,   64,  341,
			  220,  269,   70,  200,  200,  200,   64,   66,  126,   70,
			   67,  269,   71,   64,   64,   71,   68,  307,   66,   64,
			   71,  199,  410,   67,   68,  132,  132,   71,  132,  269, yy_Dummy>>,
			1, 200, 474)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  100,   67,   68,  100,   70,   66,  126,  201,   67,  700,
			  700,  700,  100,  100,   68,   70,  411,  349,  349,  132,
			  349,   67,   68,  100,  411,  113,  113,  113,  113,  113,
			  113,   71,   70,   71,  136,  136,  297,  136,  118,  132,
			  118,  113,  118,  118,  118,  118,  118,  118,  118,  350,
			  350,  257,  350,  100,  249,  411,  136,  248,  136,   71,
			   89,   89,  495,   89,  113,  495,  109,  132,  241,  113,
			  199,  199,  199,  199,  199,  109,  109,  109,  109,  109,
			  109,  118,  202,  201,  201,  201,   89,  495,   89,   89,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,

			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,  109,  117,  117,  117,  117,  117,  117,  119,  119,
			  119,  119,  119,  119,  127,  127,  109,  127,  117,  120,
			  109,  120,  109,  120,  120,  120,  120,  120,  120,  240,
			   89,  360,  128,  128,  239,  128,  129,  129,  127,  129,
			  130,  130,  527,  130,  131,  131,  117,  131,  202,  202,
			  202,  127,  133,  133,  360,  133,  128,  592,  563,  360,
			  129,  563,  120,  128,  130,  238,  563,  236,  131,  129,
			  134,  134,  228,  134,  135,  135,  133,  135,  224,  127,
			  592,  527,  133,  130,  131,  592,  223,  222,  133,  137, yy_Dummy>>,
			1, 200, 674)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  137,  128,  137,  166,  134,  221,  166,  129,  135,  138,
			  138,  166,  138,  140,  140,  217,  140,  134,  166,  211,
			  133,  130,  131,  137,  414,  209,  133,  135,  139,  139,
			  616,  139,  414,  138,  206,  141,  141,  140,  141,  138,
			  137,  142,  142,  194,  142,  134,  143,  143,  170,  143,
			  154,  154,  139,  154,  166,  135,  164,  161,  140,  141,
			  157,  146,  146,  414,  146,  142,  144,  138,  137,  616,
			  143,  142,  147,  147,  154,  147,  146,  143,  156,  156,
			  141,  156,  154,  139,  112,  146,  140,  147,  111,  149,
			  149,  707,  149,  705,  152,  152,  147,  152,  110,  142,

			  107,  705,  156,  147,  149,  143,  146,  105,  141,  145,
			  154,  145,  145,  149,  705,  103,  548,  147,  152,  147,
			  149,  150,  150,  150,  150,  150,  150,  156,  145,  705,
			  707,  147,  145,  548,  149,  145,  603,  548,  151,  151,
			  152,  151,  145,   99,  145,   96,  145,  147,  149,   95,
			  150,   94,   93,  603,  150,  156,  145,  603,  385,  203,
			  145,  548,  151,  145,  153,  153,  404,  153,  152,  385,
			  151,   75,  145,  151,  145,  148,  148,  404,  148,  385,
			   72,  603,  150,  155,  155,   56,  155,  404,  153,   35,
			  148,  148,  148,  148,  148,  148,  148,  385,  151,  148, yy_Dummy>>,
			1, 200, 874)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  153,  151,   33,   28,  153,  404,  167,  155,  168,  167,
			  148,  168,  169,  148,  167,  169,  168,   26,   18,  148,
			  169,  167,  332,  168,   17,   16,  155,  169,  153,   13,
			    0,  171,  153,    0,  171,  203,  203,  203,  148,  171,
			  706,  148,    0,  169,    0,  168,  171,  148,  706,    0,
			  172,  167,  174,  172,  155,  174,    0,  167,  172,  168,
			  174,  706,    0,  169,  171,  172,  173,  174,    0,  173,
			    0,  169,  175,  168,  173,  175,  706,    0,    0,  167,
			  175,  173,  171,  218,  218,    0,  218,  175,    0,  334,
			    0,    0,  171,  172,  342,  342,  174,  342,  332,  332,

			  332,  172,  175,  174,  176,    0,  173,  176,  175,  218,
			  177,    0,  176,  177,    0,    0,    0,  173,  177,  176,
			  342,  172,    0,  175,  174,  177,    0,    0,    0,  178,
			  175,    0,  178,    0,  173,  179,  175,  178,  179,  181,
			  336,  176,  181,  179,  178,    0,    0,  181,    0,  180,
			  179,  178,  180,  177,  181,  176,    0,  180,    0,  242,
			  242,  177,  242,  715,  180,  334,  334,  334,    0,  176,
			  183,  715,    0,  183,  184,    0,  179,  184,  183,  180,
			  178,  177,  184,  242,  715,  183,  179,    0,    0,  184,
			  181,    0,  337,  182,  181,    0,  182,    0,    0,  715, yy_Dummy>>,
			1, 200, 1074)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  180,  182,    0,    0,  179,    0,    0,  180,  182,  182,
			  182,  182,  182,  182,  182,  183,  336,  336,  336,  184,
			  185,  183,    0,  185,  186,  184,  187,  186,  185,  187,
			  188,    0,  186,  188,  187,  185,    0,    0,  188,  186,
			    0,  187,    0,  183,  182,  188,  192,  184,  189,  192,
			  185,  189,    0,    0,  192,  186,  189,  190,  187,  191,
			  190,  192,  191,  189,    0,  190,    0,  191,  337,  337,
			  337,  185,  190,    0,  191,  186,  188,  187,  185,  716,
			    0,  188,  227,  186,  189,  227,  187,  716,  189,  190,
			  260,  260,    0,  260,  227,  192,    0,  192,    0,  189,

			  716,    0,  191,    0,  188,  227,  338,    0,  190,    0,
			  191,    0,  189,    0,  260,  716,  189,  190,  254,  254,
			  254,  254,  254,  192,  225,  225,  225,  225,  225,  225,
			  191,  214,  214,  229,  214,  227,  229,  237,  237,  237,
			  237,  237,  237,  237,  246,  229,  246,    0,    0,  246,
			  246,  246,  246,  246,  246,    0,  229,  214,    0,  214,
			  214,  214,  214,  214,  214,  214,  214,  214,  214,  214,
			  214,  214,  214,  214,  214,  214,  214,  214,  214,  214,
			  214,  214,  338,  338,  338,    0,  229,  245,  245,  245,
			  245,  245,  245,  247,  247,  247,  247,  247,  247,  636, yy_Dummy>>,
			1, 200, 1274)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  636,  636,  636,  245,  250,  250,  250,  250,  250,  250,
			    0,  214,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  651,  245,  231,  651,  274,
			  274,  245,  274,    0,  231,  231,  231,  231,  231,  231,
			  251,  251,  251,  251,  251,  251,  255,  255,  255,  255,
			  255,  255,  252,  274,  252,    0,  251,  252,  252,  252,
			  252,  252,  252,  231,  231,  231,  231,  253,    0,  253,
			    0,  253,  253,  253,  253,  253,  253,    0,  651,  251,
			  258,  258,    0,  258,  251,  259,  259,    0,  259,  651,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,

			  231,  231,  261,  261,  258,  261,    0,    0,    0,  259,
			  253,    0,  258,  262,  262,    0,  262,  263,  263,    0,
			  263,  265,  265,    0,  265,  259,  261,  264,  264,  785,
			  264,  266,  266,  785,  266,    0,  785,  262,    0,  785,
			  258,  263,  261,  609,  262,  265,    0,  267,  267,    0,
			  267,  264,    0,  259,    0,  266,    0,    0,  265,  264,
			  609,  263,    0,    0,  609,    0,  268,  268,    0,  268,
			  261,  267,  262,  270,  270,  266,  270,  271,  271,    0,
			  271,  272,  272,    0,  272,    0,  265,  264,  609,  263,
			  268,  267,  273,  273,  645,  273,    0,  270,    0,  276, yy_Dummy>>,
			1, 200, 1474)
		end

	yy_chk_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  276,  271,  276,  266,    0,  272,  275,  275,    0,  275,
			  270,  645,    0,    0,  271,  645,  273,  272,    0,  267,
			    0,  268,  273,  276,  278,  278,  278,  278,  278,  278,
			  275,  276,  284,  284,  284,  284,  284,  284,  270,  645,
			    0,    0,  271,    0,  798,  272,  279,  279,  798,  279,
			  273,  798,  275,    0,  798,  280,  280,  487,  280,  276,
			    0,    0,  279,  279,  279,  279,  279,  279,  487,    0,
			  279,  280,  280,  280,  280,  280,  280,    0,  487,  280,
			  275,  281,  281,    0,  281,  361,  361,  361,  361,  361,
			  361,  279,  282,  282,    0,  282,  487,  281,  281,  281,

			  281,  281,  281,  283,  283,  281,  283,    0,  282,  282,
			  282,  282,  282,  282,    0,  285,  282,  285,  285,  283,
			  283,  283,  283,  283,  283,    0,  281,  283,    0,    0,
			  286,  286,  286,  286,  286,  286,    0,  282,  285,  287,
			  287,  285,  287,  288,  288,    0,  288,  285,  283,  286,
			  289,  289,    0,  289,  287,    0,  290,  290,  288,  290,
			    0,  291,  291,  287,  291,  491,  285,  288,    0,  285,
			  292,  292,    0,  292,  289,  285,  491,  286,  290,    0,
			  290,  293,  293,  287,  293,  291,  491,    0,    0,  289,
			  463,    0,  463,  291,  292,  294,  294,    0,  294,  295, yy_Dummy>>,
			1, 200, 1674)
		end

	yy_chk_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  295,  463,  295,  783,  491,  293,  296,  296,  783,  296,
			  783,  287,  292,  783,    0,    0,  783,  289,    0,  294,
			    0,  291,    0,  295,  293,  380,  380,    0,  380,  463,
			  296,  298,  298,  298,  298,  298,  298,  298,    0,  299,
			  292,  299,  299,  299,  299,  299,  299,  299,    0,  380,
			  294,    0,  293,    0,    0,  296,  300,  300,  300,  300,
			  300,  300,  300,  304,  305,  306,  304,  305,  306,    0,
			    0,  304,  305,  306,  379,  379,    0,  379,  304,  305,
			  306,    0,  308,  296,  310,  308,  309,  310,  311,  309,
			  308,  311,  310,    0,  309,  304,  311,  308,  379,  310,

			    0,  309,    0,  311,  305,    0,  379,    0,    0,    0,
			  312,    0,    0,  312,  304,  305,  306,  309,  312,    0,
			  311,  313,  308,  304,  313,  312,    0,    0,  310,  313,
			    0,    0,  305,  308,  379,  310,  313,  309,  314,  311,
			    0,  314,    0,    0,    0,  309,  314,  312,  311,  315,
			  308,  316,  315,  314,  316,  317,  310,  315,  317,  316,
			    0,  312,    0,  317,  315,  313,  316,    0,    0,    0,
			  317,  318,  313,    0,  318,  312,    0,  402,  402,  318,
			  402,    0,  314,    0,  403,  403,  318,  403,  316,  314,
			    0,    0,  317,  313,  363,  363,  363,  363,  363,  363, yy_Dummy>>,
			1, 200, 1874)
		end

	yy_chk_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  315,  402,  316,    0,  315,    0,  317,  318,  403,  319,
			  314,  320,  319,    0,  320,    0,  316,  319,    0,  320,
			  317,    0,  318,  319,  319,  320,  320,  320,  320,  320,
			  320,  320,  320,  321,  322,  318,  321,  322,    0,    0,
			    0,  321,  322,  323,  324,    0,  323,  324,  321,  322,
			    0,  323,  324,  375,  375,    0,  375,    0,  323,  324,
			  319,    0,  320,  321,  325,  326,    0,  325,  326,    0,
			    0,  560,  325,  326,    0,    0,  324,  375,  327,  325,
			  326,  327,  560,    0,  321,  322,  327,  405,  405,  323,
			  405,  321,  560,  327,  323,  324,  375,  326,  328,  329,

			    0,  328,  329,  325,  324,    0,  328,  329,    0,  344,
			  560,  405,  344,  328,  329,  325,  326,  323,    0,  330,
			  327,  344,  330,  344,  375,  326,  561,  330,    0,  327,
			  331,  325,  344,  331,  330,    0,    0,  561,  331,  409,
			  409,  328,  409,  347,  347,  331,  347,  561,  327,  328,
			  329,    0,  409,    0,  329,  347,  362,  362,  362,  362,
			  362,  362,  344,  409,    0,  561,  347,    0,  345,  328,
			  330,  345,  354,  354,  354,  354,  354,  354,  354,  331,
			  345,  331,  345,    0,  345,  345,  345,  345,  345,  345,
			    0,  345,    0,    0,    0,  362,  347,  365,  365,  365, yy_Dummy>>,
			1, 200, 2074)
		end

	yy_chk_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  365,  365,  365,    0,    0,    0,    0,  331,  366,  366,
			  366,  366,  366,  366,  368,  368,  368,  368,  368,  368,
			  367,  345,  367,    0,  366,  367,  367,  367,  367,  367,
			  367,  369,  369,  369,  369,  369,  369,  370,  370,  370,
			  370,  370,  370,    0,    0,    0,    0,  366,    0,    0,
			  371,  371,  366,  371,  371,  371,  371,  371,  371,  372,
			  372,  372,  372,  372,  372,  373,  373,  373,  373,  373,
			  373,  376,  376,    0,  376,    0,  370,  377,  377,    0,
			  377,  378,  378,    0,  378,  381,  381,    0,  381,  382,
			  382,    0,  382,    0,    0,  376,    0,  383,  383,    0,

			  383,  377,    0,  388,  388,  378,  388,  444,    0,  381,
			  444,  384,  384,  382,  384,    0,    0,  378,  376,  444,
			  377,  383,    0,    0,    0,  386,  386,  388,  386,  383,
			  444,  381,    0,  648,  382,  384,    0,  648,    0,  384,
			  387,  387,  388,  387,    0,  378,  376,    0,  377,  386,
			  389,  389,    0,  389,  648,  390,  390,  383,  390,  381,
			  444,  386,  382,    0,  387,  648,    0,  384,  391,  391,
			  388,  391,  465,  465,  389,  465,  649,    0,    0,  390,
			  649,  407,  407,    0,  407,  389,  387,  394,    0,  386,
			    0,    0,  391,    0,    0,    0,  465,  649,  390,  392, yy_Dummy>>,
			1, 200, 2274)
		end

	yy_chk_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  392,  392,  392,  392,  392,  407,    0,  394,  649,    0,
			  394,  391,  407,  389,  387,    0,  394,  395,  395,  395,
			  395,  395,  395,    0,    0,    0,  390,  392,    0,  398,
			  398,  398,  398,  398,  398,  394,  395,    0,  394,  391,
			  407,    0,    0,    0,  394,    0,    0,    0,  396,  396,
			  396,  396,  396,  396,    0,  392,  393,  393,  393,  393,
			  393,  393,  398,  396,  395,  399,  399,  399,  399,  399,
			  399,  393,    0,  406,  406,    0,  406,    0,  393,  396,
			    0,  400,  400,  400,  400,  400,  400,  393,    0,  393,
			  398,  396,  397,  397,    0,  397,  400,  406,    0,  393,

			  421,  421,  421,  421,  421,  421,  393,  396,  397,  397,
			  397,  397,  397,  397,    0,  393,  397,  393,  675,  406,
			    0,    0,  675,  397,  400,  401,  401,  401,  401,  401,
			  401,  408,  408,    0,  408,  774,  774,    0,  425,  675,
			  401,  425,  774,  774,    0,  774,  425,  406,  774,    0,
			  675,  397,    0,  425,  412,  408,  412,  412,  412,  412,
			  412,  412,  412,  466,  466,    0,  466,    0,  401,  413,
			  408,  413,  413,  413,  413,  413,  413,  413,  415,    0,
			  415,  415,  415,  415,  415,  415,  415,  466,    0,  425,
			    0,    0,    0,  412,    0,    0,    0,  416,  408,  416, yy_Dummy>>,
			1, 200, 2474)
		end

	yy_chk_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  416,  416,  416,  416,  416,  416,  419,  420,  413,  419,
			  420,    0,    0,    0,  419,  420,  422,  415,  466,  422,
			  423,  419,  420,  423,  422,  747,    0,    0,  423,  424,
			  426,  422,  424,  426,    0,  423,  416,  424,  426,    0,
			  427,    0,  747,  427,  424,  426,  747,    0,  427,  419,
			  472,  472,    0,  472,  420,  427,  423,  419,  420,  422,
			  428,  424,  720,  428,  720,    0,    0,  422,  428,    0,
			  747,  423,    0,  720,  472,  428,  426,  419,    0,    0,
			  424,  426,  420,    0,  423,  427,    0,  422,    0,  424,
			  429,  427,  428,  429,  430,    0,    0,  430,  429,    0,

			  432,  720,  430,  432,  426,  429,    0,    0,  432,  430,
			    0,  428,  676,  427,  431,  432,  676,  431,  429,    0,
			  428,    0,  431,  433,  433,  433,  433,  433,  433,  431,
			  430,    0,  435,  676,  434,  435,    0,  434,    0,  432,
			  435,  429,  434,    0,  676,  430,  429,  435,    0,  434,
			    0,  432,    0,  436,    0,    0,  436,    0,  430,    0,
			  431,  436,    0,  437,    0,  431,  437,  432,  436,  434,
			  740,  437,  740,    0,  438,  435,  439,  438,  437,  439,
			    0,  740,  438,  435,  439,  434,    0,  440,  431,  438,
			  440,  439,    0,    0,    0,  440,  436,  434,  441,    0, yy_Dummy>>,
			1, 200, 2674)
		end

	yy_chk_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,  441,  440,  435,  436,    0,  441,    0,  442,  740,
			    0,  442,    0,  441,  437,    0,  442,    0,  440,    0,
			    0,  442,  439,  442,  436,  438,    0,  439,  446,  446,
			  446,  446,  446,  446,    0,    0,    0,  441,  440,  449,
			  449,  449,  449,  449,  449,    0,  440,    0,    0,  441,
			  439,  450,  450,  450,  450,  450,  450,    0,    0,  442,
			  537,  537,  537,  537,  537,  441,  451,  451,  451,  451,
			  451,  451,  452,  452,  452,  452,  452,  452,  449,  454,
			  454,  454,  454,  454,  454,  455,  455,  455,  455,  455,
			  455,  477,  477,    0,  477,  454,  456,  456,  456,  456,

			  456,  456,  457,  457,  457,  457,  457,  457,  458,  458,
			  458,  458,  458,  458,    0,  477,    0,    0,  454,  468,
			  468,    0,  468,  454,  459,  459,  459,  459,  459,  459,
			  467,  467,    0,  467,  730,  456,  461,  461,  461,  461,
			  461,  461,    0,  468,    0,  730,  462,  458,  462,  462,
			  462,  462,  462,  462,  467,  730,  469,  469,  468,  469,
			  470,  470,  467,  470,  471,  471,    0,  471,  473,  473,
			    0,  473,  748,  730,  475,  475,    0,  475,  476,  476,
			  469,  476,    0,    0,  470,    0,  468,  469,  471,  748,
			  467,  470,  473,  748,  478,  478,  471,  478,  475,    0, yy_Dummy>>,
			1, 200, 2874)
		end

	yy_chk_template_16 (an_array: ARRAY [INTEGER])
			-- Fill chunk #16 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,  476,    0,    0,  473,  475,    0,  471,  476,
			    0,  480,  480,    0,  480,  469,    0,  748,  478,  470,
			  479,  479,    0,  479,  471,    0,  478,  482,  482,  482,
			  482,  482,  482,  473,  475,  480,  471,  476,  483,  483,
			    0,  483,  482,  480,  479,  484,  484,  484,  484,  484,
			  484,    0,    0,    0,  478,  486,  486,  486,  486,  486,
			  486,    0,  483,  479,  488,  488,  502,  488,    0,  502,
			  482,  480,    0,  484,  502,  490,  490,  486,  490,  541,
			  541,  502,  541,  483,    0,    0,    0,    0,  488,  543,
			  543,  479,  543,    0,  489,  489,  488,  489,    0,  490,

			    0,  484,  485,  541,  485,  486,  485,  485,  485,  485,
			  485,  485,    0,  543,    0,  490,    0,  502,  489,    0,
			    0,  485,  546,  546,  488,  546,  489,    0,  485,  557,
			  557,    0,  557,    0,  485,  493,  493,  493,  493,  493,
			  493,  493,  503,  490,    0,  503,  546,    0,    0,  485,
			  503,    0,    0,  557,  489,    0,  485,  503,    0,    0,
			    0,    0,  485,  496,  496,  496,  496,  496,  496,  496,
			  498,  498,  498,  498,  498,  498,  498,  505,    0,  505,
			  505,  505,  505,  505,  505,    0,  506,  507,  508,  506,
			  507,  508,    0,  503,  506,  507,  508,  503,    0,    0, yy_Dummy>>,
			1, 200, 3074)
		end

	yy_chk_template_17 (an_array: ARRAY [INTEGER])
			-- Fill chunk #17 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,  506,  507,  508,    0,  509,    0,  511,  509,  510,
			  511,    0,  510,  509,    0,  511,  505,  510,  506,  508,
			  509,    0,  511,    0,  510,  512,  507,  513,  512,    0,
			  513,  544,  544,  512,  544,  513,  509,  506,  507,  508,
			  512,  510,  513,    0,    0,    0,  506,  508,  600,  600,
			    0,  600,    0,  510,  507,  544,  509,    0,  511,  513,
			  510,    0,  512,  544,  509,  514,    0,  515,  514,  510,
			  515,  518,  600,  514,  518,  515,  512,    0,  513,  518,
			  514,  510,  515,    0,    0,    0,  518,  513,    0,    0,
			  512,  544,    0,    0,  751,  517,  514,  517,  517,  517,

			  517,  517,  517,  518,  519,  520,  521,  519,  520,  521,
			    0,  751,  519,  520,  521,  751,  514,    0,  515,  519,
			  520,  521,  518,    0,  514,  571,  522,  523,  571,  522,
			  523,  518,    0,  571,  522,  523,    0,  520,  521,  751,
			  571,  522,  523,  638,  638,  638,  638,  519,  526,  526,
			  526,  526,  526,  526,    0,  519,  520,  521,  522,  531,
			  531,  531,  531,  531,  531,  520,  521,  523,    0,  602,
			  602,  524,  602,    0,  524,  519,  571,  522,  523,    0,
			    0,    0,  638,  524,    0,  524,  522,  524,  524,  524,
			  524,  524,  524,  602,  524,  523,  528,    0,  528,  528, yy_Dummy>>,
			1, 200, 3274)
		end

	yy_chk_template_18 (an_array: ARRAY [INTEGER])
			-- Fill chunk #18 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  528,  528,  528,  528,  529,  529,  529,  529,  529,  529,
			  530,  530,  530,  530,  530,  530,    0,    0,    0,    0,
			  529,    0,    0,    0,  524,  532,  532,  532,  532,  532,
			  532,    0,    0,    0,    0,  528,  534,  534,  534,  534,
			  534,  534,  535,  535,  535,  535,  535,  535,  529,  530,
			  536,  536,  536,  536,  536,  536,  539,  539,  539,  539,
			  539,  539,  540,  540,    0,  540,  752,  542,  542,    0,
			  542,    0,  539,  545,  545,    0,  545,  547,  547,    0,
			  547,  549,  549,  752,  549,    0,  540,  752,    0,    0,
			  540,  542,    0,  551,  551,  542,  551,  545,    0,    0,

			  539,  547,    0,  550,  550,  549,  550,  552,  552,    0,
			  552,  752,  545,  568,  547,    0,  568,  551,  540,  553,
			  553,  568,  553,  542,    0,  549,    0,  550,  568,  787,
			  787,  552,    0,  787,  787,  550,  787,  551,    0,  552,
			  545,  568,  547,  553,  558,  558,    0,  558,  559,  559,
			  553,  559,  554,  549,  554,    0,  554,  554,  554,  554,
			  554,  554,    0,  550,  568,  551,    0,  552,  558,  568,
			    0,  554,  559,  604,  604,    0,  604,    0,  553,  559,
			  567,  567,  567,  567,  567,  567,  562,  558,  562,  562,
			  562,  562,  562,  562,  562,    0,    0,  604,  564,  554, yy_Dummy>>,
			1, 200, 3474)
		end

	yy_chk_template_19 (an_array: ARRAY [INTEGER])
			-- Fill chunk #19 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  564,  564,  564,  564,  564,  564,  564,  559,  569,  569,
			  569,  569,  569,  569,  565,  558,  565,  565,  565,  565,
			  565,  565,  565,  572,  573,  562,  572,  573,    0,  731,
			    0,  572,  573,  574,    0,    0,  574,  564,  572,  573,
			  731,  574,  605,  605,  575,  605,  576,  575,  574,  576,
			  731,  572,  575,  565,  576,  577,    0,    0,  577,  575,
			    0,  576,    0,  577,    0,  574,  605,    0,  731,    0,
			  577,    0,    0,  578,  572,  573,  578,    0,    0,  572,
			    0,  578,    0,  575,  574,    0,  579,    0,  578,  579,
			    0,    0,  577,  574,  579,  575,    0,  576,    0,  580,

			  581,  579,  580,  581,    0,    0,  577,  580,  581,  601,
			  601,  575,  601,  582,  580,  581,  582,  578,  579,  583,
			  577,  582,  583,  584,  578,    0,  584,  583,  582,    0,
			    0,  584,  581,  601,  583,    0,    0,  579,  584,  601,
			    0,    0,    0,  580,  582,  578,  579,    0,    0,    0,
			  580,  581,    0,  585,  775,  775,  585,  775,    0,  775,
			  581,  585,  775,    0,  582,  775,  584,  601,  585,    0,
			  583,  580,  582,    0,  584,  586,  586,  586,  586,  586,
			  586,    0,    0,    0,  585,  587,  587,  587,  587,  587,
			  587,  589,    0,  589,  584,    0,  589,  589,  589,  589, yy_Dummy>>,
			1, 200, 3674)
		end

	yy_chk_template_20 (an_array: ARRAY [INTEGER])
			-- Fill chunk #20 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  589,  589,    0,    0,  585,  590,  590,  590,  590,  590,
			  590,    0,  585,  591,  591,  591,  591,  591,  591,  593,
			  593,  593,  593,  593,  593,  595,  595,  595,  595,  595,
			  595,  596,  596,  596,  596,  596,  596,  597,  597,  597,
			  597,  597,  597,    0,  590,  598,  598,    0,  598,  599,
			  599,    0,  599,  597,  606,  606,    0,  606,  607,  607,
			    0,  607,    0,  608,  608,    0,  608,  610,  610,  598,
			  610,  611,  611,  599,  611,    0,  597,  618,  606,  736,
			  618,  597,  607,    0,    0,  618,  599,  608,  598,    0,
			  736,  610,  618,  647,  647,  611,  647,  607,    0,  610,

			  736,    0,  617,  611,  617,  617,  617,  617,  617,  617,
			    0,    0,    0,    0,  599,    0,  598,  647,  736,    0,
			  618,  671,  671,    0,  671,  607,    0,  610,  618,    0,
			  619,  611,  619,  619,  619,  619,  619,  619,    0,  620,
			    0,  617,  620,  621,    0,  671,  621,  620,  618,  622,
			    0,  621,  622,    0,  620,    0,    0,  622,  621,  623,
			  624,    0,  623,  624,  622,    0,    0,  623,  624,  619,
			  625,    0,    0,  625,  623,  624,  620,    0,  625,  622,
			  626,  627,    0,  626,  627,  625,    0,    0,  626,  627,
			  620,    0,    0,    0,  621,  626,  627,    0,  628,    0, yy_Dummy>>,
			1, 200, 3874)
		end

	yy_chk_template_21 (an_array: ARRAY [INTEGER])
			-- Fill chunk #21 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  622,  628,  642,  642,  620,  642,  628,  622,    0,  629,
			  623,  624,  629,  628,    0,  630,    0,  629,  630,    0,
			  627,  625,    0,  630,  629,    0,  642,    0,    0,    0,
			  630,  626,  627,  631,  642,  631,  631,  631,  631,  631,
			  631,  629,    0,  674,  674,    0,  674,  630,  627,  628,
			  632,  632,  632,  632,  632,  632,    0,    0,    0,    0,
			  629,    0,  642,    0,    0,    0,  630,  674,    0,  629,
			    0,    0,  631,    0,    0,  630,  633,  633,  633,  633,
			  633,  633,  634,  634,  634,  634,  634,  634,  635,    0,
			  635,    0,    0,  635,  635,  635,  635,  635,  635,  637,

			  637,  637,  637,  637,  637,  639,  639,  639,  639,  639,
			  639,  640,  640,    0,  640,  641,  641,    0,  641,    0,
			    0,  639,  644,  644,    0,  644,  646,  646,    0,  646,
			  655,    0,    0,  655,    0,  640,    0,    0,  655,  641,
			  654,  640,    0,  654,  639,  655,  644,    0,  654,  639,
			  646,  641,  644,    0,    0,  654,    0,  646,  652,  652,
			  652,  652,  652,  652,  677,  677,  655,  677,  656,  640,
			  654,  656,    0,    0,  657,    0,  656,  657,    0,  641,
			  644,  655,  657,  656,  658,  646,    0,  658,  677,  657,
			    0,  654,  658,  659,  655,  737,  659,    0,  654,  658, yy_Dummy>>,
			1, 200, 4074)
		end

	yy_chk_template_22 (an_array: ARRAY [INTEGER])
			-- Fill chunk #22 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  656,  659,  703,  703,  657,  703,  737,    0,  659,  661,
			  661,  661,  661,  661,  661,  658,  737,    0,    0,  656,
			  727,  727,  727,  727,  727,  657,  703,    0,  656,    0,
			    0,    0,  657,    0,  737,  658,  662,  662,  662,  662,
			  662,  662,    0,  658,  659,  663,  663,  663,  663,  663,
			  663,  664,  664,  664,  664,  664,  664,  665,  665,  665,
			  665,  665,  665,  666,  666,  666,  666,  666,  666,  668,
			  668,  668,  668,  668,  668,  662,  669,  669,    0,  669,
			  670,  670,    0,  670,    0,  668,  672,  672,  679,  672,
			  679,  679,  679,  679,  679,  679,    0,    0,    0,  680,

			  669,    0,  680,    0,  670,    0,    0,  680,  668,  681,
			  672,  669,  681,  668,  680,    0,    0,  681,  672,    0,
			  682,    0,    0,  682,  681,  670,    0,  679,  682,  683,
			  684,    0,  683,  684,  680,  682,    0,  683,  684,  669,
			    0,    0,    0,    0,  683,  684,  672,    0,    0,    0,
			  680,    0,    0,  670,  681,  691,  691,    0,  691,    0,
			  681,  683,  680,  685,  685,  685,  685,  685,  685,    0,
			    0,  682,  687,  687,  687,  687,  687,  687,    0,  691,
			  683,  684,  681,  690,  690,  688,  690,  688,    0,  683,
			  688,  688,  688,  688,  688,  688,  689,  689,  689,  689, yy_Dummy>>,
			1, 200, 4274)
		end

	yy_chk_template_23 (an_array: ARRAY [INTEGER])
			-- Fill chunk #23 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  689,  689,  685,    0,  691,  692,  692,  690,  692,  696,
			  696,  696,  696,  696,  696,  690,    0,    0,  697,  698,
			  699,  697,  698,  699,  688,    0,  697,  698,  699,  692,
			    0,    0,  691,  697,  698,  699,  701,  701,  701,  701,
			  701,  701,    0,  690,  745,  745,  745,  745,  745,  692,
			  697,    0,  702,  702,    0,  702,  704,  704,  709,  704,
			    0,  709,    0,    0,  699,    0,  709,    0,  698,  697,
			  698,  699,    0,  709,    0,    0,  702,  692,  697,  708,
			  704,  708,  708,  708,  708,  708,  708,  710,    0,    0,
			  710,  711,  699,    0,  711,  710,  698,  702,    0,  711,

			    0,    0,  710,  709,  714,  714,  711,  714,    0,  709,
			  712,  712,  712,  712,  712,  712,    0,    0,  708,  713,
			  713,  713,  713,  713,  713,  702,  721,  721,  714,  721,
			    0,  709,  717,  717,  717,  717,  717,  717,  710,    0,
			  719,    0,  711,  719,  735,  735,    0,  735,  719,    0,
			  721,    0,    0,  714,  724,  719,  724,  724,  724,  724,
			  724,  724,  725,    0,    0,  725,    0,  721,  735,    0,
			  725,  726,  726,  726,  726,  726,  726,  725,    0,    0,
			    0,  714,  729,  729,  732,  729,    0,  732,    0,  719,
			    0,  719,  732,  724,    0,  721,    0,  795,  795,  732, yy_Dummy>>,
			1, 200, 4474)
		end

	yy_chk_template_24 (an_array: ARRAY [INTEGER])
			-- Fill chunk #24 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,  795,  795,  725,  795,    0,  729,  733,  733,  733,
			  733,  733,  733,  725,  729,    0,  732,  719,  734,  734,
			  734,  734,  734,  734,  738,    0,    0,  738,    0,    0,
			    0,  725,  738,    0,    0,  732,    0,    0,    0,  738,
			    0,    0,  729,    0,  732,  739,  739,  739,  739,  739,
			  739,  743,  743,  743,  743,  743,  743,  744,  744,  744,
			  744,  744,  744,  749,  749,  749,  749,  749,  749,  750,
			  750,  750,  750,  750,  750,  738,  753,  753,  753,  753,
			  753,  753,  754,  754,  754,  754,  757,  757,  757,  757,
			  757,  757,  758,  758,  758,  758,  758,  758,  759,  759,

			  759,  759,  759,  759,  761,  761,  761,  761,  761,  761,
			  762,    0,  762,    0,    0,  762,  762,  762,  762,  762,
			  762,  754,  763,  763,  763,  763,  763,  763,  764,  764,
			  764,  764,  764,  764,  777,    0,  777,    0,    0,    0,
			  777,  777,    0,    0,  777,  777,    0,  777,    0,  762,
			  766,  766,  766,  766,  766,  766,  766,  766,  766,  766,
			  766,  766,  766,  766,  766,  766,  767,  767,  767,  767,
			  767,  767,  767,  767,  767,  767,  767,  767,  767,  767,
			  767,  767,  768,  768,  768,  768,  768,  768,  768,  768,
			  768,  768,  768,  768,  768,  768,  768,  768,  769,  769, yy_Dummy>>,
			1, 200, 4674)
		end

	yy_chk_template_25 (an_array: ARRAY [INTEGER])
			-- Fill chunk #25 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  769,  769,  769,  769,  769,  769,  769,  769,  769,  769,
			  769,  769,  769,  769,  770,    0,  770,  770,  770,  770,
			  770,  770,  770,  770,  770,  770,    0,  770,  770,  770,
			  771,    0,  771,  771,  771,  771,  771,  771,  771,  771,
			  771,  771,  771,  771,  771,  771,  776,    0,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  778,    0,  778,  778,  778,  778,  778,  778,
			  778,  778,  778,  778,    0,  778,  778,  778,  779,  779,
			  779,  779,  779,  779,  779,  779,  779,  779,  779,  779,
			  779,  779,  779,  779,  780,  780,  780,  780,  780,  780,

			  780,  780,  780,  780,  780,  780,  780,  780,  780,  780,
			  781,  781,  781,  781,  781,  781,  781,  781,  781,  781,
			  781,  781,  781,  781,  781,  781,  782,  782,  782,  782,
			  782,  782,  782,  782,  782,  782,  782,  782,  782,  782,
			  782,  782,  784,    0,  784,  784,  784,  784,  784,  784,
			  784,  784,  784,  784,  784,  784,  784,  784,  786,  786,
			  786,  786,  786,  786,  786,  786,  786,  786,  786,  786,
			  786,  786,  786,  786,  788,    0,    0,  788,  788,  788,
			  788,    0,    0,  788,  790,  790,  790,  790,  790,  790,
			    0,  790,  790,  790,  790,  790,  790,  790,  790,  790, yy_Dummy>>,
			1, 200, 4874)
		end

	yy_chk_template_26 (an_array: ARRAY [INTEGER])
			-- Fill chunk #26 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  791,  791,  791,  791,  791,  791,  791,  791,  791,  791,
			  791,  791,  791,  791,  791,  791,  792,  792,    0,    0,
			    0,    0,    0,    0,    0,  792,  792,    0,    0,    0,
			  792,  793,  793,  793,  793,  793,  793,  793,  793,  793,
			  793,  793,  793,  793,  793,  793,  793,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  796,  796,  796,  796,  796,  796,  796,
			  796,  796,  796,  796,  796,  796,  796,  796,  796, yy_Dummy>>,
			1, 79, 5074)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 798)
			yy_base_template_1 (an_array)
			yy_base_template_2 (an_array)
			yy_base_template_3 (an_array)
			yy_base_template_4 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_base_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,   89,   94,   76,   78,   70,   71,  100,
			  104,  183,    0, 1103, 5153,  106, 1097, 1072, 1086, 5153,
			   85,    0, 5153, 5153, 5153, 5153, 1077,  102, 1061,  261,
			  271, 5153, 5153, 1050, 5153, 1037, 5153,  294,  111,  300,
			  131,  305,  310,  319,  345,  371,  376,  385,  457,  390,
			  445,  402,  431,   80, 5153, 5153, 1004,  482,  336,  522,
			  398,  538,  548,  557,  590,  566,  610,  623,  624,  427,
			  637,  655, 1038, 5153, 5153, 1039,  159, 5153,   97,  281,
			  269,  355,  325,  445,  118, 5153,   95,  289,   72,  733,
			 5153, 5153,  293, 1024, 1011,  949,  959, 5153,  139, 1015,

			  673,  568,  163,  987, 5153,  975, 5153,  966,    0,  732,
			  962,  960,  943,  682, 5153,  261,  402,  769,  699,  775,
			  790, 5153, 5153,  500,  561,    0,  606,  797,  815,  819,
			  823,  827,  668,  835,  853,  857,  707,  872,  882,  901,
			  886,  908,  914,  919,  859,  970,  934,  945, 1048,  962,
			  978, 1011,  967, 1037,  923, 1056,  951,  911,  425,  262,
			  104,  876, 5153,  299,  920,    0,  876, 1079, 1081, 1085,
			  857, 1104, 1123, 1139, 1125, 1145, 1177, 1183, 1202, 1208,
			 1222, 1212, 1266, 1243, 1247, 1293, 1297, 1299, 1303, 1321,
			 1330, 1332, 1319, 5153,  911, 5153,  507, 5153, 5153,  659, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  565,  675,  750, 1027,  389, 5153,  855,  503,  377,  845,
			  439,  840, 5153,  371, 1404, 5153, 5153,  862, 1156, 5153,
			  579,  805,  811,  868,  860, 1381,  154, 1355,  854, 1406,
			  314, 1485,  332, 5153, 5153, 5153,  843, 1395,  841,  810,
			  805,  734, 1232,  511, 5153, 1444, 1406, 1450,  715,  663,
			 1461, 1497, 1514, 1528, 1375, 1503, 5153,  698, 1553, 1558,
			 1363, 1575, 1586, 1590, 1600, 1594, 1604, 1620, 1639,  606,
			 1646, 1650, 1654, 1665, 1502, 1679, 1672, 5153, 1681, 1719,
			 1728, 1754, 1765, 1776, 1689, 1776, 1787, 1812, 1816, 1823,
			 1829, 1834, 1843, 1854, 1868, 1872, 1879,  687, 1888, 1898,

			 1913,  336, 5153,  516, 1936, 1937, 1938,  601, 1955, 1959,
			 1957, 1961, 1983, 1994, 2011, 2022, 2024, 2028, 2044, 2082,
			 2084, 2106, 2107, 2116, 2117, 2137, 2138, 2151, 2171, 2172,
			 2192, 2203, 1090,  457, 1157,  462, 1208, 1260, 1374,  358,
			 5153,  589, 1167, 5153, 2182, 2241,  635, 2216, 5153,  690,
			  722,  618, 5153, 5153, 2230, 5153, 5153, 5153, 5153, 5153,
			  782, 1742, 2213, 2051,  552, 2254, 2265, 2282, 2271, 2288,
			 2294, 2310, 2316, 2322,  576, 2126, 2344, 2350, 2354, 1947,
			 1898, 2358, 2362, 2370, 2384, 1004, 2398, 2413, 2376, 2423,
			 2428, 2441, 2456, 2513, 2445, 2474, 2505, 2565, 2486, 2522, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 2538, 2582, 2050, 2057, 1012, 2160, 2546, 2454, 2604, 2212,
			  612,  675, 2613, 2628,  883, 2637, 2656,  102,  537, 2679,
			 2680, 2557, 2689, 2693, 2702, 2611, 2703, 2713, 2733, 2763,
			 2767, 2787, 2773, 2780, 2807, 2805, 2826, 2836, 2847, 2849,
			 2860, 2871, 2881, 5153, 2380,  536, 2885,  597, 5153, 2896,
			 2908, 2923, 2929,  584, 2936, 2942, 2953, 2959, 2965, 2981,
			  447, 2993, 3005, 1852,  465, 2445, 2636, 3003, 2992, 3029,
			 3033, 3037, 2723, 3041,  562, 3047, 3051, 2964, 3067, 3093,
			 3084, 5153, 3084, 3111, 3102, 3163, 3112, 1703, 3137, 3167,
			 3148, 1811, 5153, 3192, 5153,  735, 3220, 5153, 3227, 5153,

			  530,  524, 3139, 3215,  482, 3236, 3259, 3260, 3261, 3278,
			 3282, 3280, 3298, 3300, 3338, 3340,  563, 3354, 3344, 3377,
			 3378, 3379, 3399, 3400, 3444,  503, 3405,  811, 3455, 3461,
			 3467, 3416, 3482,  487, 3493, 3499, 3507, 2917, 5153, 3513,
			 3535, 3152, 3540, 3162, 3304, 3546, 3195, 3550,  962, 3554,
			 3576, 3566, 3580, 3592, 3613, 5153,  507, 3202, 3617, 3621,
			 2117, 2172, 3645,  841, 3657, 3673,  483, 3637, 3586, 3665,
			  472, 3398, 3696, 3697, 3706, 3717, 3719, 3728, 3746, 3759,
			 3772, 3773, 3786, 3792, 3796, 3826, 3832, 3842,  453, 3853,
			 3862, 3870,  808, 3876,  426, 3882, 3888, 3894, 3918, 3922, yy_Dummy>>,
			1, 200, 400)
		end

	yy_base_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 3321, 3782, 3442,  982, 3646, 3715, 3927, 3931, 3936, 1589,
			 3940, 3944,  422,  411,    0,  358,  889, 3961, 3950, 3989,
			 4012, 4016, 4022, 4032, 4033, 4043, 4053, 4054, 4071, 4082,
			 4088, 4092, 4107, 4133, 4139, 4150, 1456, 4156, 3405, 4162,
			 4184, 4188, 4075, 5153, 4195, 1640, 4199, 3966, 2379, 2422,
			  366, 1498, 4215,  352, 4213, 4203, 4241, 4247, 4257, 4266,
			  292, 4266, 4293, 4302, 4308, 4314, 4320, 5153, 4326, 4349,
			 4353, 3994, 4359, 5153, 4116, 2564, 2758, 4237,  266, 4347,
			 4372, 4382, 4393, 4402, 4403, 4420,  278, 4429, 4447, 4453,
			 4456, 4428, 4478,  122, 5153, 5153, 4466, 4491, 4492, 4493,

			  666, 4493, 4525, 4275, 4529,  939, 1086,  950, 4538, 4531,
			 4560, 4564, 4567, 4576, 4577, 1209, 1325, 4589, 5153, 4613,
			 2724, 4599,  293,  287, 4613, 4635, 4628, 4277, 5153, 4655,
			 2980, 3675, 4657, 4664, 4675, 4617, 3925, 4241, 4697, 4702,
			 2832,  276,  131, 4708, 4714, 4501, 5153, 2671, 3018, 4720,
			 4726, 3340, 3512, 4733, 4744, 5153, 5153, 4743, 4749, 4755,
			 5153, 4761, 4772, 4779, 4785, 5153, 4823, 4839, 4855, 4871,
			 4887, 4903,  130,  446, 2608, 3825, 4919, 4807, 4935, 4951,
			 4967, 4983, 4999, 1876, 5015, 1599, 5031, 3596, 5043,  125,
			 5057, 5073, 5089, 5104, 5120, 4664, 5136,  105, 1714, yy_Dummy>>,
			1, 199, 600)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 798)
			yy_def_template_1 (an_array)
			yy_def_template_2 (an_array)
			yy_def_template_3 (an_array)
			yy_def_template_4 (an_array)
			an_array.area.fill_with (765, 739, 764)
			an_array.put (0, 765)
			an_array.area.fill_with (765, 766, 798)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
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
			  777,  777,  777,  765,  778,  765,  765,  765,  765,  778, yy_Dummy>>,
			1, 200, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
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
			  774,  774,  765,  145,  148,  393,  393,  774,  145,  765, yy_Dummy>>,
			1, 200, 200)
		end

	yy_def_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
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
			  765,  765,  765,  765,  765,  765,  765,  765,  774,  774, yy_Dummy>>,
			1, 200, 400)
		end

	yy_def_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
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
			  765,  765,  777,  765,  765,  774,  765,  765,  777, yy_Dummy>>,
			1, 139, 600)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 257)
			yy_ec_template_1 (an_array)
			an_array.area.fill_with (84, 160, 191)
			an_array.area.fill_with (90, 192, 193)
			an_array.area.fill_with (85, 194, 223)
			yy_ec_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    0,   90,   90,   90,   90,   90,   90,   90,   90,    1,
			    2,   90,   90,    3,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,    4,    5,    6,   90,    7,   90,   90,    8,
			    9,   10,   11,   12,   13,   14,   15,   16,   17,   18,
			   19,   20,   21,   21,   21,   22,   22,   22,   23,   24,
			   25,   26,   27,   28,   90,   29,   30,   31,   32,   33,
			   34,   35,   36,   37,   35,   35,   38,   39,   40,   41,
			   42,   43,   44,   45,   46,   47,   35,   48,   49,   50,
			   51,   52,   53,   54,   55,   56,   90,   57,   58,   59,

			   60,   61,   62,   63,   64,   65,   63,   63,   66,   67,
			   68,   69,   70,   71,   72,   73,   74,   75,   63,   76,
			   77,   78,   63,   79,   80,   81,   90,   90,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   83,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83, yy_Dummy>>,
			1, 160, 0)
		end

	yy_ec_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			   86,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   88,   89,   89,   89,
			   89,   89,   89,   89,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90, yy_Dummy>>,
			1, 34, 224)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,   16,    1,   16,   16,   16,   16,    3,
			    4,   16,   16,    5,    6,    6,    7,    8,    8,    8,
			    8,    8,    8,   16,   16,    9,   16,   10,   16,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   12,   13,   16,   16,    8,   14,   14,   14,
			   14,   14,   14,   14,   14,   14,   14,   14,   14,   14,
			   14,   14,   14,   14,   14,   14,   14,   14,   14,   16,
			   16,   15,   16,   16,   16,   16,   16,   16,   16,   16,
			   16, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 765)
			yy_accept_template_1 (an_array)
			yy_accept_template_2 (an_array)
			yy_accept_template_3 (an_array)
			yy_accept_template_4 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_accept_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
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
			  106,  106,  106,  109,  127,  129,  128,  125,  124,  126, yy_Dummy>>,
			1, 200, 0)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
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
			  103,  103,    0,  103,   87,  103,  103,  103,  103,    0, yy_Dummy>>,
			1, 200, 200)
		end

	yy_accept_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
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
			  118,    0,  121,    0,   86,    0,    0,  119,  103,  103, yy_Dummy>>,
			1, 200, 400)
		end

	yy_accept_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
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
			   80,    0,   80,    0,    0,    0, yy_Dummy>>,
			1, 166, 600)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 5153
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 765
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 766
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 90
			-- Equivalence code for NULL character

	yyMax_symbol_equiv_class: INTEGER = 256
			-- All symbols greater than this symbol will have
			-- the same equivalence class as this symbol

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
