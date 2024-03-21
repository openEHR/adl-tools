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

when 70 then
--|#line 287 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 287")
end
in_lineno := in_lineno + 1
when 71 then
--|#line 289 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 289")
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
	
when 72 then
--|#line 312 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 312")
end
	-- Catch-all rules (no backing up)
			last_token := ERR_VALUE_SET_DEF
			set_start_condition (INITIAL)
	
when 73 then
--|#line 322 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 322")
end

		last_token := ERR_VALUE_SET_MISSING_CODES
		err_str := text
	
when 74 then
--|#line 338 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 338")
end

		set_start_condition (IN_EXTERNAL_VALUE_SET_DEF)
		create last_term_constraint_parse_structure_value.make
		str_ := text_substring (2, text_count)
		last_term_constraint_parse_structure_value.set_terminology_id (str_.substring (1, str_.index_of (':', 1)-1))
		is_assumed_code := False
	
when 75 then
--|#line 347 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 347")
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
	
when 76 then
--|#line 362 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 362")
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
	
when 77 then
--|#line 377 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 377")
end
in_lineno := in_lineno + text_count
when 78 then
--|#line 380 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 380")
end

when 79 then
--|#line 383 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 383")
end
in_lineno := in_lineno + 1
when 80 then
--|#line 385 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 385")
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
	
when 81 then
--|#line 408 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 408")
end
	-- Catch-all rules (no backing up)
			last_token := ERR_VALUE_SET_DEF
			set_start_condition (INITIAL)
	
when 82, 83, 84 then
--|#line 417 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 417")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
when 85, 86 then
--|#line 426 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 426")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
when 87, 88 then
--|#line 434 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 434")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
when 89, 90 then
--|#line 442 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 442")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
when 91 then
--|#line 450 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 450")
end

				last_token := V_ISO8601_DURATION
				last_string_value := convert_non_conforming_duration(text)
			
when 92 then
--|#line 462 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 462")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
when 93 then
--|#line 472 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 472")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text_substring(2, text_count)
			
when 94 then
--|#line 477 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 477")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
when 95 then
--|#line 487 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 487")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
				last_string_value.put('T', last_string_value.index_of(' ', 1))
			
when 96 then
--|#line 493 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 493")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
when 97 then
--|#line 504 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 504")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN_ERR
				unread_character(last_string_value.item(last_string_value.count)) -- put back the last character 
				last_string_value := text
			
when 98 then
--|#line 513 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 513")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
when 99 then
--|#line 529 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 529")
end
	-- match a pattern like 'Type_Identifier whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
when 100 then
--|#line 536 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 536")
end
	-- match a pattern like '(Type_Identifier) whitespace <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
when 101 then
--|#line 542 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 542")
end
	-- match a pattern like '["at0004"] = (Type_Identifier)  <'
				set_start_condition (IN_C_DOMAIN_TYPE)
				in_buffer.append_string (text)
			
when 102 then
--|#line 548 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 548")
end
 -- match up to next > not followed by a '}' or '>' 
 				in_buffer.append_string (text)
 			
when 103 then
--|#line 552 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 552")
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
								odin_parser_error.add_error ({ADL_MESSAGES_IDS}.ec_VDTCV, <<att_output.im_type_name>>, "")
								last_token := ERR_C_DV_QUANTITY_1
							end
						else
							odin_parser_error.add_error ({ADL_MESSAGES_IDS}.ec_VDTTU, <<att_output.im_type_name>>, "")
							last_token := ERR_C_DV_QUANTITY_2
						end
					else
						odin_parser_error.add_error ({ADL_MESSAGES_IDS}.ec_VDTNT, Void, "")
						last_token := ERR_C_DV_QUANTITY_3
					end
				else
					odin_parser_error.append (odin_parser.errors)
					last_token := ERR_C_DV_QUANTITY_4
				end

				in_buffer.wipe_out
				set_start_condition (INITIAL)
 			
when 104 then
--|#line 594 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 594")
end
 -- match up to next '}' not preceded by a '>'
 				in_buffer.append_string (text)
  			
when 105 then
--|#line 604 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 604")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
when 106 then
--|#line 610 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 610")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
when 107 then
--|#line 616 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 616")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
when 108 then
--|#line 623 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 623")
end

			last_token := V_ATTRIBUTE_IDENTIFIER
			last_string_value := text
		
when 109 then
--|#line 629 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 629")
end
		-- matches an absolute path string with segments of form "/attr_name" or "/attr_name[id-code]"
			last_token := V_ABS_PATH
			last_string_value := text
		
when 110 then
--|#line 635 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 635")
end
		-- matches a relative path string with segments of form "/attr_name" or "/attr_name[id-code]"
			last_token := V_REL_PATH
			last_string_value := text
		
when 111 then
--|#line 641 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 641")
end

				last_token := SYM_START_CBLOCK
				set_start_condition (IN_REGEXP1)
				in_buffer.append_character ('/')
			
when 112 then
--|#line 648 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 648")
end
 		-- match segment consisting of non / or [
				in_buffer.append_string (text)
	
when 113 then
--|#line 652 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 652")
end
 		-- match [] segment
				in_buffer.append_string (text)
	
when 114 then
--|#line 656 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 656")
end
 		-- match segment ending in quoted slashes '\/'
				in_buffer.append_string (text)
	
when 115 then
--|#line 660 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 660")
end
 		-- match final segment
				in_buffer.append_string (text)

				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
 				last_string_value := str_
 				last_token := V_REGEXP
				set_start_condition (INITIAL)
	
when 116 then
--|#line 672 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 672")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
when 117 then
--|#line 679 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 679")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
when 118 then
--|#line 684 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 684")
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
			
when 119, 120 then
--|#line 699 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 699")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
when 121, 122, 123 then
--|#line 704 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 704")
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
			
when 124 then
--|#line 726 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 726")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
when 125 then
--|#line 731 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 731")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
when 126 then
--|#line 739 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 739")
end
in_buffer.append_character ('\')
when 127 then
--|#line 741 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 741")
end
in_buffer.append_character ('"')
when 128 then
--|#line 743 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 743")
end

				in_buffer.append_string (text)
	
when 129 then
--|#line 747 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 747")
end
in_buffer.append_string (text)
when 130 then
--|#line 749 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 749")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
when 131 then
--|#line 754 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 754")
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
			
when 132 then
--|#line 765 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 765")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
when 133 then
--|#line 774 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 774")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
when 134 then
--|#line 776 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 776")
end
last_token := V_CHARACTER; last_character_value := '%N'
when 135 then
--|#line 777 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 777")
end
last_token := V_CHARACTER; last_character_value := '%R'
when 136 then
--|#line 778 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 778")
end
last_token := V_CHARACTER; last_character_value := '%T'
when 137 then
--|#line 779 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 779")
end
last_token := V_CHARACTER; last_character_value := '%''
when 138 then
--|#line 780 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 780")
end
last_token := V_CHARACTER; last_character_value := '%H'
when 139, 140 then
--|#line 782 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 782")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
when 141 then
--|#line 787 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 787")
end
;
when 142 then
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
--|#line 786 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 786")
end
terminate
when 1 then
--|#line 767 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 767")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
when 4 then
--|#line 313 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 313")
end
	-- Catch-all rules (no backing up)
			last_token := ERR_VALUE_SET_DEF
			set_start_condition (INITIAL)
	
when 5 then
--|#line 409 "cadl_14_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_14_scanner.l' at line 409")
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
			create an_array.make_filled (0, 0, 5304)
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
			yy_nxt_template_27 (an_array)
			an_array.area.fill_with (767, 5215, 5304)
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
			   14,   76,   85,  110,   85,   77,   76,   89,   89,  199,

			   77,   92,   93,   94,   92,   92,   93,   94,   92,  104,
			  216,  104,  104,  198,   95,  198,  198,  114,   95,  115,
			  115,  115,  115,  115,  115,  299,  207,  299,   86,   87,
			   86,   87,  125,  125,  211,  125,  160,  228,  111,  652,
			  228,  305,   78,  112,  161,  162,  200,   78,  537,  537,
			  165,   90,   90,  165,  750,  749,  127,   96,  166,  502,
			  733,   96,  208,  209,  217,   97,  732,  228,  702,   97,
			  228,  212,  213,  303,   79,   80,   81,   82,   83,   79,
			   80,   81,   82,   83,   99,  100,  101,   99,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,  102,  103,   98, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  103,  103,  103,  103,  103,  103,   98,   98,   98,   98,
			   98,   98,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,   98,   98,   98,   98,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,  118,  214,  119,  250,  120,  120,
			  120,  120,  120,  120,  118,  541,  119,  216,  122,  122,
			  122,  122,  122,  122,  232,  125,  125,  232,  125,  125,

			  125,  197,  125,  299,  197,  125,  125,  117,  125,  387,
			  197,  208,  209,  251,  117,  125,  125,  121,  125,  127,
			  387,  125,  125,  127,  125,  698,  121,  121,  128,  127,
			  387,  131,  129,  132,  130,  104,  197,  104,  104,  127,
			  302,  217,  133,  125,  125,  127,  125,  197,  387,  142,
			  125,  125,  134,  125,  125,  125,  128,  125,  533,  131,
			  129,  132,  130,  135,  299,  125,  125,  127,  125,  571,
			  133,  136,  125,  125,  127,  125,  167,  142,  127,  202,
			  134,  204,  204,  137,  167,  138,  201,  201,  201,  127,
			  679,  135,  139,  140,  125,  125,  127,  125,  141,  136, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  419,  197,  144,  125,  125,  143,  125,  198,  572,  198,
			  198,  137,  420,  138,  202,  145,  125,  125,  258,  125,
			  139,  140,  653,  203,  203,  203,  141,  127,  125,  125,
			  144,  125,  211,  143,  125,  125,  234,  125,  153,  234,
			  127,  589,  651,  145,  125,  125,  154,  125,  222,  207,
			  445,  222,  127,  299,  299,  650,  157,  638,  127,  146,
			  147,  147,  147,  147,  147,  147,  153,  155,  127,  212,
			  213,  214,  156,  165,  154,  148,  165,  205,  205,  205,
			  590,  166,  149,  158,  157,  208,  209,  341,  167,  150,
			  300,  151,  707,  152,  165,  155,  568,  165,  165,  343,

			  156,  165,  166,  148,  223,  301,  166,  208,  209,  167,
			  149,  158,  224,  167,  165,  125,  125,  165,  125,  151,
			  165,  152,  166,  165,  172,  250,  167,  169,  166,  167,
			  173,  170,  617,  171,  708,  167,  212,  213,  165,  127,
			  231,  165,  174,  231,  611,  172,  166,  344,  344,  172,
			  344,  175,  232,  167,  461,  169,  452,  176,  173,  170,
			  435,  171,  569,  234,  447,  172,  178,  447,  177,  165,
			  174,  172,  165,  220,  654,  550,  118,  166,  179,  175,
			  165,  168,  191,  165,  167,  176,  503,  192,  166,  172,
			  714,  714,  714,  235,  178,  167,  177,  165,  351,  350, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  165,  351,  168,  376,  180,  166,  179,  454,  165,  168,
			  191,  165,  167,  655,  165,  192,  166,  165,  181,  182,
			  172,  350,  166,  167,  183,  185,  350,  165,  342,  167,
			  165,  172,  180,  125,  125,  166,  125,  449,  187,  184,
			  449,  165,  167,  423,  165,  412,  181,  182,  172,  166,
			  197,  188,  183,  185,  186,  271,  167,  127,  719,  172,
			  231,  165,  189,  231,  165,  172,  187,  197,  376,  166,
			  190,  248,  232,  233,  366,  767,  167,  222,  172,  188,
			  222,  193,  186,  234,  252,  252,  252,  252,  252,  252,
			  189,  238,  172,  245,  249,  245,  245,  720,  190,  248,

			  239,  239,  239,  239,  239,  239,  360,  359,  358,  193,
			  194,  357,  172,  235,  247,  247,  247,  247,  247,  247,
			  257,  257,  257,  257,  257,  257,  201,  201,  201,  354,
			  248,  230,  345,  223,  344,  344,  240,  344,  194,  219,
			  219,  224,  219,  201,  201,  201,  165,  352,  350,  165,
			  352,  241,  225,  249,  166,  242,  565,  243,  248,  565,
			  767,  167,  227,  227,  616,  220,  767,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  253,  253,  253,  253,  253,  253,  197,  172,  374,  374, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  374,  374,  374,  118,  341,  119,  254,  255,  255,  255,
			  255,  255,  255,  256,  125,  125,  118,  125,  119,  221,
			  255,  255,  255,  255,  255,  255,  125,  125,  342,  125,
			  125,  125,  341,  125,  254,  197,  125,  125,  127,  125,
			  125,  125,  309,  125,  125,  125,  121,  125,  304,  495,
			  127,  261,  125,  125,  127,  125,  538,  299,  538,  121,
			  127,  262,  125,  125,  127,  125,  164,  539,  127,  263,
			  476,  260,  339,  339,  339,  299,  127,  125,  125,  261,
			  125,  476,  231,  264,  265,  231,  127,  197,  496,  262,
			  231,  476,  267,  231,  232,  540,  266,  263,  268,  260,

			  279,  127,  232,  125,  125,  234,  125,  125,  125,  476,
			  125,  264,  265,  234,  269,  125,  125,  246,  125,  245,
			  267,  244,  197,  237,  266,  497,  268,  127,  497,  125,
			  125,  127,  125,  125,  125,  235,  125,  125,  125,  127,
			  125,  498,  269,  235,  637,  273,  270,  108,  272,  299,
			  565,  125,  125,  127,  125,  125,  125,  127,  125,  105,
			  230,  127,  227,  340,  340,  340,  489,  370,  125,  125,
			  227,  125,  637,  273,  270,  127,  272,  489,  275,  127,
			  499,  277,  276,  146,  274,  226,  278,  489,  125,  125,
			  225,  125,  127,  126,  126,  126,  126,  126,  126,  204, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  204,  125,  125,  146,  125,  489,  275,  197,  412,  277,
			  276,  412,  127,  286,  278,  280,  146,  280,  767,  148,
			  244,  244,  286,  244,  195,  127,  126,  125,  125,  728,
			  125,  728,  148,  286,  281,  151,  197,  164,  282,  124,
			  729,  283,  123,  116,  361,  113,  286,  148,  126,  108,
			  284,  127,  285,  106,  126,  125,  125,  105,  125,  767,
			  148,  494,  281,  151,  125,  125,  282,  125,  730,  283,
			  767,  125,  125,  767,  125,  767,  298,  767,  284,  127,
			  285,  125,  125,  767,  125,  197,  767,  291,  127,  767,
			  292,  665,  665,  665,  665,  127,  146,  287,  287,  287,

			  287,  287,  287,  767,  298,  127,  767,  294,  767,  558,
			  293,  295,  201,  201,  201,  291,  288,  767,  292,  289,
			  558,  125,  125,  767,  125,  290,  125,  125,  165,  125,
			  558,  165,  767,  767,  165,  294,  166,  165,  293,  295,
			  767,  767,  166,  167,  288,  127,  767,  289,  558,  167,
			  127,  165,  767,  290,  165,  197,  767,  165,  296,  166,
			  165,  203,  203,  203,  297,  166,  167,  125,  125,  767,
			  125,  307,  167,  306,  125,  125,  746,  125,  746,  172,
			  165,  165,  308,  165,  165,  172,  296,  747,  166,  166,
			  310,  127,  297,  767,  767,  167,  167,  165,  127,  307, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  165,  306,  172,  125,  125,  166,  125,  767,  172,  605,
			  308,  383,  167,  767,  165,  748,  767,  165,  310,  767,
			  767,  312,  166,  311,  767,  165,  605,  127,  165,  167,
			  605,  172,  172,  166,  334,  335,  336,  337,  338,  383,
			  167,  313,  125,  125,  314,  125,  767,  767,  172,  312,
			  315,  311,  165,  165,  605,  165,  165,  767,  386,  767,
			  166,  166,  316,  767,  767,  172,  127,  167,  167,  313,
			  767,  165,  314,  767,  165,  271,  172,  165,  315,  166,
			  165,  165,  378,  767,  165,  166,  167,  767,  767,  166,
			  316,  767,  167,  767,  165,  317,  167,  165,  165,  767,

			  767,  165,  166,  172,  172,  767,  166,  319,  767,  167,
			  378,  767,  318,  167,  321,  322,  322,  322,  322,  322,
			  197,  645,  172,  317,  125,  125,  165,  125,  172,  165,
			  767,  767,  172,  767,  166,  319,  320,  767,  645,  323,
			  318,  167,  645,  165,  165,  172,  165,  165,  127,  172,
			  767,  166,  166,  165,  165,  767,  165,  165,  167,  167,
			  767,  166,  166,  767,  379,  197,  645,  323,  167,  167,
			  767,  324,  767,  325,  767,  326,  165,  172,  165,  165,
			  767,  165,  767,  767,  166,  327,  166,  125,  125,  767,
			  125,  167,  379,  167,  172,  172,  205,  205,  205,  324, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  328,  325,  767,  326,  172,  172,  165,  767,  767,  165,
			  331,  127,  329,  327,  166,  165,  330,  767,  165,  377,
			  767,  167,  767,  166,  767,  767,  767,  172,  328,  172,
			  167,  346,  347,  347,  347,  347,  347,  767,  331,  197,
			  329,  201,  201,  201,  330,  767,  767,  377,  767,  332,
			  355,  356,  356,  356,  356,  356,  356,  172,  362,  362,
			  362,  362,  362,  362,  333,  767,  172,  365,  365,  365,
			  365,  365,  365,  363,  248,  363,  767,  332,  364,  364,
			  364,  364,  364,  364,  367,  367,  367,  367,  367,  367,
			  767,  767,  333,  219,  219,  767,  219,  249,  371,  767,

			  371,  767,  248,  372,  372,  372,  372,  372,  372,  375,
			  375,  375,  375,  375,  375,  201,  201,  201,  767,  220,
			  767,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  767,  767,  767,  767,  368,  368,
			  368,  368,  368,  368,  394,  394,  394,  394,  394,  394,
			  767,  118,  767,  119,  369,  373,  373,  373,  373,  373,
			  373,  767,  767,  221,  349,  350,  348,  349,  348,  348,
			  348,  348,  348,  348,  348,  348,  351,  370,  767,  348,
			  125,  125,  369,  125,  767,  767,  348,  352,  348,  348, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_nxt_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  348,  348,  767,  647,  121,  767,  125,  125,  767,  125,
			  125,  125,  767,  125,  127,  125,  125,  767,  125,  767,
			  647,  380,  767,  767,  647,  348,  348,  353,  348,  653,
			  127,  767,  653,  767,  127,  767,  767,  767,  767,  127,
			  125,  125,  382,  125,  125,  125,  767,  125,  647,  380,
			  381,  390,  348,  348,  348,  348,  348,  348,  348,  348,
			  348,  348,  348,  348,  127,  767,  125,  125,  127,  125,
			  382,  125,  125,  767,  125,  767,  767,  767,  381,  390,
			  125,  125,  494,  125,  384,  767,  767,  767,  385,  767,
			  127,  125,  125,  680,  125,  127,  125,  125,  165,  125,

			  767,  165,  767,  388,  127,  767,  166,  112,  389,  767,
			  391,  112,  384,  167,  112,  127,  385,  112,  675,  767,
			  127,  125,  125,  767,  125,  126,  126,  126,  126,  126,
			  126,  388,  767,  767,  767,  675,  389,  767,  391,  675,
			  125,  125,  392,  125,  767,  127,  767,  165,  767,  172,
			  165,  125,  125,  393,  125,  166,  395,  395,  395,  395,
			  395,  395,  167,  675,  127,  767,  146,  767,  767,  767,
			  392,  125,  125,  767,  125,  127,  598,  598,  598,  598,
			  598,  393,  767,  125,  125,  396,  125,  397,  397,  397,
			  397,  397,  397,  125,  125,  127,  125,  767,  172,  398, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_nxt_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  398,  398,  398,  398,  398,  125,  125,  127,  125,  399,
			  399,  399,  399,  399,  399,  767,  401,  127,  401,  767,
			  767,  400,  400,  400,  400,  400,  400,  767,  396,  127,
			  126,  126,  126,  126,  126,  126,  767,  767,  396,  402,
			  125,  125,  403,  125,  125,  125,  767,  125,  404,  126,
			  396,  125,  125,  767,  125,  146,  125,  125,  767,  125,
			  767,  767,  125,  125,  127,  125,  767,  402,  127,  767,
			  403,  125,  125,  406,  125,  127,  404,  126,  125,  125,
			  127,  125,  767,  405,  290,  767,  127,  677,  407,  125,
			  125,  677,  125,  767,  767,  127,  125,  125,  767,  125,

			  767,  767,  127,  767,  408,  767,  349,  350,  677,  349,
			  767,  405,  290,  127,  409,  767,  407,  767,  351,  677,
			  127,  413,  414,  414,  414,  414,  414,  299,  767,  352,
			  767,  767,  408,  410,  416,  417,  418,  418,  418,  418,
			  299,  767,  409,  767,  415,  411,  415,  415,  415,  415,
			  415,  415,  299,  165,  165,  165,  165,  165,  165,  353,
			  767,  166,  166,  166,  125,  125,  767,  125,  167,  167,
			  167,  767,  767,  411,  165,  767,  165,  165,  165,  165,
			  767,  165,  166,  767,  166,  421,  166,  767,  127,  167,
			  767,  167,  767,  167,  422,  424,  125,  125,  767,  125, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_nxt_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  165,  767,  767,  165,  172,  172,  172,  425,  166,  165,
			  427,  165,  165,  421,  165,  167,  767,  166,  426,  166,
			  127,  767,  422,  424,  167,  172,  167,  172,  471,  172,
			  767,  767,  767,  165,  767,  425,  165,  428,  427,  165,
			  767,  166,  165,  767,  767,  767,  426,  166,  167,  165,
			  767,  172,  165,  429,  167,  430,  471,  166,  165,  767,
			  172,  165,  172,  767,  167,  428,  166,  364,  364,  364,
			  364,  364,  364,  167,  767,  767,  432,  165,  562,  767,
			  165,  429,  767,  430,  172,  166,  433,  767,  431,  562,
			  172,  435,  167,  165,  434,  165,  165,  767,  165,  563,

			  172,  166,  767,  166,  432,  717,  767,  767,  167,  172,
			  167,  767,  767,  717,  433,  165,  767,  562,  165,  767,
			  767,  767,  434,  166,  767,  436,  717,  767,  172,  435,
			  167,  322,  322,  322,  322,  322,  322,  165,  767,  437,
			  165,  717,  767,  767,  172,  166,  172,  165,  165,  767,
			  165,  165,  167,  436,  614,  166,  166,  125,  125,  767,
			  125,  767,  167,  167,  767,  614,  172,  437,  165,  438,
			  165,  165,  767,  165,  165,  615,  166,  165,  166,  767,
			  440,  127,  166,  167,  767,  167,  439,  767,  172,  167,
			  678,  767,  165,  614,  678,  165,  767,  438,  172,  172, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_nxt_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  166,  165,  473,  446,  165,  767,  446,  167,  440,  166,
			  441,  678,  767,  442,  439,  447,  167,  448,  767,  172,
			  767,  172,  678,  767,  767,  172,  449,  767,  446,  443,
			  473,  446,  451,  451,  451,  451,  451,  451,  441,  767,
			  447,  442,  448,  172,  347,  347,  347,  347,  347,  347,
			  444,  449,  172,  767,  767,  767,  450,  355,  356,  356,
			  356,  356,  356,  356,  453,  453,  453,  453,  453,  453,
			  767,  452,  455,  455,  455,  455,  455,  455,  444,  767,
			  767,  450,  456,  456,  456,  456,  456,  456,  459,  459,
			  459,  459,  459,  459,  457,  767,  457,  767,  369,  458,

			  458,  458,  458,  458,  458,  372,  372,  372,  372,  372,
			  372,  460,  460,  460,  460,  460,  460,  767,  767,  767,
			  767,  370,  767,  767,  462,  463,  369,  464,  464,  464,
			  464,  464,  464,  465,  465,  465,  465,  465,  465,  466,
			  466,  466,  466,  466,  466,  125,  125,  767,  125,  767,
			  461,  125,  125,  615,  125,  446,  125,  125,  446,  125,
			  125,  125,  767,  125,  615,  125,  125,  447,  125,  127,
			  125,  125,  767,  125,  615,  127,  125,  125,  449,  125,
			  127,  767,  125,  125,  127,  125,  738,  767,  467,  127,
			  125,  125,  615,  125,  127,  767,  470,  738,  468,  469, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_nxt_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  127,  767,  474,  767,  475,  767,  127,  738,  450,  125,
			  125,  472,  125,  767,  127,  767,  467,  695,  477,  125,
			  125,  695,  125,  767,  470,  738,  468,  469,  125,  125,
			  474,  125,  475,  127,  125,  125,  478,  125,  695,  472,
			  696,  767,  767,  127,  696,  767,  477,  767,  479,  695,
			  125,  125,  127,  125,  480,  767,  125,  125,  127,  125,
			  767,  696,  753,  767,  478,  394,  394,  394,  394,  394,
			  394,  481,  696,  718,  127,  126,  479,  482,  126,  753,
			  127,  718,  480,  753,  126,  397,  397,  397,  397,  397,
			  397,  117,  117,  483,  718,  117,  117,  767,  117,  481,

			  767,  767,  767,  126,  126,  482,  126,  753,  767,  718,
			  125,  125,  126,  125,  398,  398,  398,  398,  398,  398,
			  767,  483,  395,  395,  395,  395,  395,  395,  767,  281,
			  125,  125,  126,  125,  127,  767,  767,  126,  400,  400,
			  400,  400,  400,  400,  484,  284,  399,  399,  399,  399,
			  399,  399,  767,  126,  127,  126,  767,  281,  767,  739,
			  767,  485,  767,  125,  125,  126,  125,  767,  767,  767,
			  739,  126,  484,  284,  486,  486,  486,  486,  486,  486,
			  739,  126,  767,  126,  767,  767,  767,  127,  767,  485,
			  487,  487,  487,  487,  487,  487,  767,  754,  739,  126, yy_Dummy>>,
			1, 200, 2400)
		end

	yy_nxt_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  125,  125,  492,  125,  767,  126,  488,  488,  488,  488,
			  488,  488,  125,  125,  754,  125,  125,  125,  754,  125,
			  767,  126,  259,  767,  127,  259,  259,  259,  259,  493,
			  492,  259,  767,  126,  125,  125,  127,  125,  767,  767,
			  127,  767,  754,  491,  125,  125,  490,  125,  495,  126,
			  414,  414,  414,  414,  414,  414,  299,  415,  127,  415,
			  415,  415,  415,  415,  415,  299,  767,  767,  127,  767,
			  767,  491,  767,  500,  490,  418,  418,  418,  418,  418,
			  418,  299,  125,  125,  767,  125,  498,  496,  418,  418,
			  418,  418,  418,  418,  299,  165,  497,  767,  165,  165,

			  767,  165,  165,  166,  165,  767,  127,  166,  767,  166,
			  167,  767,  501,  767,  167,  767,  167,  506,  507,  507,
			  507,  507,  507,  767,  165,  499,  165,  165,  165,  165,
			  767,  165,  166,  767,  166,  767,  166,  542,  504,  167,
			  767,  167,  508,  167,  767,  767,  172,  767,  505,  767,
			  172,  767,  172,  165,  125,  125,  165,  125,  510,  165,
			  509,  166,  165,  767,  767,  767,  504,  166,  167,  767,
			  508,  767,  767,  767,  167,  172,  505,  172,  127,  172,
			  767,  165,  767,  767,  165,  767,  510,  165,  509,  166,
			  165,  513,  767,  544,  767,  166,  167,  165,  165,  511, yy_Dummy>>,
			1, 200, 2600)
		end

	yy_nxt_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  165,  165,  167,  743,  172,  166,  166,  767,  165,  767,
			  172,  165,  167,  167,  743,  514,  166,  125,  125,  513,
			  125,  544,  165,  167,  743,  165,  512,  511,  767,  767,
			  166,  165,  172,  515,  165,  767,  767,  167,  172,  166,
			  767,  127,  743,  514,  516,  767,  167,  517,  172,  172,
			  667,  668,  667,  668,  512,  125,  125,  520,  125,  172,
			  767,  515,  518,  519,  519,  519,  519,  519,  165,  744,
			  767,  165,  516,  172,  521,  517,  166,  767,  165,  127,
			  744,  165,  172,  167,  165,  520,  166,  165,  767,  669,
			  744,  767,  166,  167,  767,  165,  767,  165,  165,  167,

			  165,  165,  521,  166,  165,  166,  724,  767,  744,  166,
			  167,  522,  167,  767,  724,  767,  167,  767,  767,  172,
			  767,  125,  125,  165,  125,  767,  165,  724,  524,  172,
			  767,  166,  767,  767,  767,  172,  493,  767,  167,  522,
			  525,  523,  724,  652,  767,  127,  172,  652,  172,  767,
			  652,  767,  172,  652,  767,  767,  524,  346,  526,  526,
			  526,  526,  526,  767,  767,  767,  396,  767,  525,  523,
			  767,  767,  767,  767,  172,  527,  527,  527,  527,  527,
			  527,  528,  528,  528,  528,  528,  528,  362,  362,  362,
			  362,  362,  362,  529,  530,  530,  530,  530,  530,  531, yy_Dummy>>,
			1, 200, 2800)
		end

	yy_nxt_template_16 (an_array: ARRAY [INTEGER])
			-- Fill chunk #16 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  531,  531,  531,  531,  531,  458,  458,  458,  458,  458,
			  458,  767,  767,  767,  452,  369,  532,  532,  532,  532,
			  532,  532,  534,  534,  534,  534,  534,  534,  535,  535,
			  535,  535,  535,  535,  767,  305,  305,  767,  370,  305,
			  305,  767,  305,  369,  536,  536,  536,  536,  536,  536,
			  125,  125,  767,  125,  767,  533,  531,  531,  531,  531,
			  531,  531,  125,  125,  767,  125,  463,  461,  464,  464,
			  464,  464,  464,  464,  127,  125,  125,  767,  125,  767,
			  125,  125,  543,  125,  125,  125,  127,  125,  767,  125,
			  125,  767,  125,  545,  125,  125,  767,  125,  767,  127,

			  767,  767,  767,  767,  127,  767,  546,  767,  127,  767,
			  543,  767,  547,  127,  125,  125,  551,  125,  127,  125,
			  125,  545,  125,  767,  548,  552,  549,  125,  125,  767,
			  125,  767,  125,  125,  546,  125,  125,  125,  127,  125,
			  547,  767,  165,  127,  551,  165,  553,  767,  767,  767,
			  166,  127,  548,  552,  549,  767,  127,  167,  767,  555,
			  127,  767,  554,  556,  556,  556,  556,  556,  556,  767,
			  125,  125,  767,  125,  553,  767,  561,  767,  126,  486,
			  486,  486,  486,  486,  486,  767,  767,  555,  125,  125,
			  554,  125,  767,  172,  127,  767,  488,  488,  488,  488, yy_Dummy>>,
			1, 200, 3000)
		end

	yy_nxt_template_17 (an_array: ARRAY [INTEGER])
			-- Fill chunk #17 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  488,  488,  559,  767,  561,  767,  126,  557,  125,  125,
			  767,  125,  127,  125,  125,  767,  125,  767,  126,  767,
			  560,  413,  564,  564,  564,  564,  564,  299,  767,  767,
			  559,  767,  127,  767,  767,  557,  401,  127,  401,  767,
			  487,  487,  487,  487,  487,  487,  126,  767,  560,  165,
			  165,  165,  165,  165,  165,  126,  767,  166,  166,  166,
			  767,  767,  403,  767,  167,  167,  167,  767,  404,  416,
			  566,  566,  566,  566,  566,  299,  416,  567,  566,  566,
			  566,  566,  299,  126,  165,  767,  767,  165,  767,  574,
			  403,  767,  166,  767,  767,  767,  404,  767,  767,  167,

			  172,  172,  172,  571,  570,  507,  507,  507,  507,  507,
			  507,  767,  165,  767,  767,  165,  573,  574,  165,  767,
			  166,  165,  165,  767,  767,  165,  166,  167,  125,  125,
			  166,  125,  767,  167,  767,  172,  767,  167,  165,  767,
			  725,  165,  572,  575,  573,  767,  166,  165,  725,  576,
			  165,  767,  127,  167,  577,  166,  600,  165,  767,  767,
			  165,  725,  167,  172,  767,  166,  578,  125,  125,  172,
			  125,  575,  167,  172,  767,  579,  725,  576,  165,  580,
			  767,  165,  577,  767,  600,  767,  166,  165,  581,  172,
			  165,  127,  767,  167,  578,  166,  165,  767,  172,  165, yy_Dummy>>,
			1, 200, 3200)
		end

	yy_nxt_template_18 (an_array: ARRAY [INTEGER])
			-- Fill chunk #18 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  221,  221,  167,  579,  166,  767,  767,  580,  172,  221,
			  221,  167,  767,  767,  221,  435,  581,  519,  519,  519,
			  519,  519,  519,  736,  736,  736,  736,  736,  582,  172,
			  583,  165,  767,  165,  165,  767,  165,  165,  172,  166,
			  165,  166,  767,  767,  767,  166,  167,  172,  167,  767,
			  767,  757,  167,  767,  767,  767,  582,  767,  583,  165,
			  767,  767,  165,  584,  767,  585,  767,  166,  757,  586,
			  125,  125,  757,  125,  167,  588,  588,  588,  588,  588,
			  588,  767,  172,  767,  172,  767,  446,  767,  172,  446,
			  767,  584,  767,  585,  127,  767,  757,  586,  447,  587,

			  448,  767,  526,  526,  526,  526,  526,  526,  767,  449,
			  172,  589,  767,  530,  530,  530,  530,  530,  530,  531,
			  531,  531,  531,  531,  531,  767,  767,  587,  592,  592,
			  592,  592,  592,  592,  767,  591,  767,  767,  767,  450,
			  593,  593,  593,  593,  593,  593,  767,  767,  767,  767,
			  590,  594,  594,  594,  594,  594,  594,  595,  595,  595,
			  595,  595,  595,  591,  767,  767,  767,  533,  596,  596,
			  596,  596,  596,  596,  597,  597,  597,  597,  597,  597,
			  599,  599,  599,  599,  599,  599,  125,  125,  767,  125,
			  767,  125,  125,  767,  125,  767,  254,  125,  125,  767, yy_Dummy>>,
			1, 200, 3400)
		end

	yy_nxt_template_19 (an_array: ARRAY [INTEGER])
			-- Fill chunk #19 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  125,  125,  125,  767,  125,  125,  125,  767,  125,  767,
			  127,  758,  767,  767,  601,  127,  125,  125,  767,  125,
			  767,  127,  767,  602,  254,  127,  767,  767,  758,  127,
			  125,  125,  758,  125,  125,  125,  603,  125,  604,  767,
			  127,  767,  601,  125,  125,  767,  125,  165,  607,  606,
			  165,  602,  767,  767,  127,  166,  758,  767,  127,  767,
			  767,  767,  167,  767,  603,  610,  604,  127,  125,  125,
			  767,  125,  767,  767,  608,  609,  607,  606,  280,  767,
			  280,  767,  556,  556,  556,  556,  556,  556,  125,  125,
			  767,  125,  127,  610,  767,  767,  767,  126,  172,  767,

			  767,  767,  608,  609,  618,  619,  619,  619,  619,  619,
			  767,  612,  127,  506,  621,  621,  621,  621,  621,  613,
			  767,  767,  767,  767,  495,  126,  564,  564,  564,  564,
			  564,  564,  299,  752,  752,  752,  752,  752,  498,  612,
			  566,  566,  566,  566,  566,  566,  299,  613,  500,  767,
			  566,  566,  566,  566,  566,  566,  299,  165,  165,  165,
			  165,  165,  165,  496,  767,  166,  166,  166,  165,  767,
			  767,  165,  167,  167,  167,  767,  166,  499,  767,  767,
			  767,  165,  767,  167,  165,  620,  622,  501,  767,  166,
			  165,  125,  125,  165,  125,  767,  167,  767,  166,  767, yy_Dummy>>,
			1, 200, 3600)
		end

	yy_nxt_template_20 (an_array: ARRAY [INTEGER])
			-- Fill chunk #20 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  623,  767,  767,  165,  767,  167,  165,  767,  172,  172,
			  172,  166,  767,  620,  622,  127,  767,  767,  167,  172,
			  624,  165,  165,  165,  165,  165,  165,  767,  623,  166,
			  166,  166,  172,  767,  642,  767,  167,  167,  167,  767,
			  625,  172,  767,  767,  165,  767,  767,  165,  624,  767,
			  126,  126,  166,  767,  172,  627,  767,  126,  126,  167,
			  126,  767,  642,  126,  767,  626,  628,  165,  625,  767,
			  165,  767,  172,  172,  172,  166,  629,  165,  767,  767,
			  165,  165,  167,  627,  165,  166,  767,  767,  767,  166,
			  767,  767,  167,  626,  628,  172,  167,  767,  630,  165,

			  767,  767,  165,  767,  629,  767,  767,  166,  527,  527,
			  527,  527,  527,  527,  167,  767,  125,  125,  172,  125,
			  767,  767,  767,  767,  631,  767,  630,  767,  172,  767,
			  632,  767,  172,  529,  633,  633,  633,  633,  633,  634,
			  127,  634,  767,  767,  635,  635,  635,  635,  635,  635,
			  172,  767,  631,  767,  767,  767,  767,  767,  632,  635,
			  635,  635,  635,  635,  635,  636,  636,  636,  636,  636,
			  636,  535,  535,  535,  535,  535,  535,  639,  639,  639,
			  639,  639,  639,  640,  640,  640,  640,  640,  640,  641,
			  641,  641,  641,  641,  641,  767,  767,  767,  533,  125, yy_Dummy>>,
			1, 200, 3800)
		end

	yy_nxt_template_21 (an_array: ARRAY [INTEGER])
			-- Fill chunk #21 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  125,  767,  125,  125,  125,  637,  125,  125,  125,  767,
			  125,  125,  125,  767,  125,  125,  125,  767,  125,  125,
			  125,  767,  125,  127,  767,  767,  767,  127,  370,  125,
			  125,  127,  125,  637,  767,  127,  643,  644,  767,  127,
			  767,  767,  767,  127,  125,  125,  767,  125,  165,  767,
			  767,  165,  767,  127,  646,  767,  166,  760,  761,  760,
			  761,  648,  767,  167,  643,  644,  767,  654,  127,  619,
			  619,  619,  619,  619,  619,  767,  649,  125,  125,  767,
			  125,  571,  646,  621,  621,  621,  621,  621,  621,  648,
			  165,  656,  165,  165,  165,  165,  762,  165,  166,  172,

			  166,  127,  166,  767,  649,  167,  655,  167,  165,  167,
			  165,  165,  767,  165,  165,  767,  166,  165,  166,  656,
			  572,  767,  166,  167,  658,  167,  767,  657,  767,  167,
			  767,  165,  165,  767,  165,  165,  767,  767,  767,  166,
			  166,  172,  767,  172,  767,  172,  167,  167,  767,  767,
			  125,  125,  658,  125,  165,  657,  767,  165,  767,  172,
			  165,  172,  166,  165,  165,  172,  767,  165,  166,  167,
			  165,  659,  166,  165,  127,  167,  767,  767,  166,  167,
			  671,  767,  172,  172,  589,  167,  633,  633,  633,  633,
			  633,  633,  660,  767,  125,  125,  661,  125,  767,  659, yy_Dummy>>,
			1, 200, 4000)
		end

	yy_nxt_template_22 (an_array: ARRAY [INTEGER])
			-- Fill chunk #22 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  767,  159,  159,  767,  159,  172,  159,  767,  671,  159,
			  767,  172,  159,  767,  767,  172,  767,  767,  127,  767,
			  660,  172,  767,  590,  661,  635,  635,  635,  635,  635,
			  635,  635,  635,  635,  635,  635,  635,  662,  662,  662,
			  662,  662,  662,  663,  767,  663,  767,  767,  664,  664,
			  664,  664,  664,  664,  666,  666,  666,  666,  666,  666,
			  670,  670,  670,  670,  670,  670,  125,  125,  767,  125,
			  767,  125,  125,  767,  125,  767,  637,  125,  125,  767,
			  125,  125,  125,  767,  125,  125,  125,  168,  125,  168,
			  127,  767,  767,  168,  168,  127,  767,  168,  168,  370,

			  168,  127,  672,  673,  637,  127,  767,  674,  767,  127,
			  767,  767,  676,  618,  681,  681,  681,  681,  681,  165,
			  692,  165,  165,  767,  165,  767,  767,  166,  767,  166,
			  672,  673,  767,  767,  167,  674,  167,  767,  165,  165,
			  676,  165,  165,  767,  767,  767,  166,  166,  692,  682,
			  767,  767,  165,  167,  167,  165,  767,  683,  767,  767,
			  166,  664,  664,  664,  664,  664,  664,  167,  685,  767,
			  172,  684,  172,  125,  125,  767,  125,  682,  679,  679,
			  767,  679,  767,  686,  767,  683,  767,  767,  229,  172,
			  172,  767,  767,  229,  767,  229,  685,  127,  229,  684, yy_Dummy>>,
			1, 200, 4200)
		end

	yy_nxt_template_23 (an_array: ARRAY [INTEGER])
			-- Fill chunk #23 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  767,  229,  697,  172,  687,  687,  687,  687,  687,  687,
			  767,  686,  688,  688,  688,  688,  688,  688,  540,  540,
			  540,  540,  540,  540,  689,  689,  689,  689,  689,  689,
			  690,  690,  690,  690,  690,  690,  691,  691,  691,  691,
			  691,  691,  767,  533,  125,  125,  767,  125,  767,  767,
			  125,  125,  637,  125,  654,  767,  681,  681,  681,  681,
			  681,  681,  165,  165,  165,  165,  165,  165,  127,  767,
			  166,  166,  166,  165,  127,  370,  165,  167,  167,  167,
			  637,  166,  694,  165,  767,  767,  165,  767,  167,  693,
			  767,  166,  767,  655,  767,  767,  767,  699,  167,  662,

			  662,  662,  662,  662,  662,  701,  767,  767,  700,  767,
			  694,  767,  767,  172,  172,  172,  767,  693,  703,  703,
			  703,  703,  703,  703,  172,  699,  691,  691,  691,  691,
			  691,  691,  767,  701,  172,  667,  700,  667,  533,  767,
			  690,  690,  690,  690,  690,  690,  125,  125,  767,  125,
			  767,  125,  125,  767,  125,  125,  125,  767,  125,  709,
			  710,  710,  710,  710,  710,  165,  767,  767,  165,  165,
			  127,  767,  165,  166,  669,  127,  767,  166,  704,  127,
			  167,  767,  767,  767,  167,  767,  165,  767,  767,  165,
			  125,  125,  767,  125,  166,  125,  125,  711,  125,  706, yy_Dummy>>,
			1, 200, 4400)
		end

	yy_nxt_template_24 (an_array: ARRAY [INTEGER])
			-- Fill chunk #24 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  705,  167,  125,  125,  767,  125,  704,  715,  715,  715,
			  715,  715,  715,  767,  127,  767,  172,  767,  712,  127,
			  172,  767,  767,  767,  767,  711,  127,  706,  705,  767,
			  713,  125,  125,  767,  125,  716,  719,  172,  710,  710,
			  710,  710,  710,  710,  165,  165,  712,  165,  165,  767,
			  767,  767,  166,  166,  165,  127,  767,  165,  713,  167,
			  167,  767,  166,  716,  125,  125,  767,  125,  767,  167,
			  767,  767,  767,  767,  767,  720,  722,  722,  722,  722,
			  722,  722,  669,  669,  669,  669,  669,  669,  127,  721,
			  125,  125,  767,  125,  767,  172,  172,  709,  726,  726,

			  726,  726,  726,  165,  767,  172,  165,  767,  767,  767,
			  767,  166,  165,  723,  127,  165,  767,  721,  167,  719,
			  166,  726,  726,  726,  726,  726,  726,  167,  767,  767,
			  767,  731,  735,  735,  735,  735,  735,  735,  767,  767,
			  767,  723,  125,  125,  767,  125,  767,  165,  767,  767,
			  165,  767,  727,  734,  172,  166,  767,  767,  720,  731,
			  767,  767,  167,  172,  767,  767,  127,  741,  741,  741,
			  741,  741,  741,  767,  737,  767,  767,  767,  767,  740,
			  727,  734,  742,  742,  742,  742,  742,  742,  165,  767,
			  767,  165,  767,  767,  767,  767,  166,  767,  172,  767, yy_Dummy>>,
			1, 200, 4600)
		end

	yy_nxt_template_25 (an_array: ARRAY [INTEGER])
			-- Fill chunk #25 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  767,  767,  737,  167,  767,  767,  767,  740,  745,  745,
			  745,  745,  745,  745,  730,  730,  730,  730,  730,  730,
			  751,  751,  751,  751,  751,  751,  755,  755,  755,  755,
			  755,  755,  756,  756,  756,  756,  756,  756,  767,  172,
			  759,  759,  759,  759,  759,  759,  748,  748,  748,  748,
			  748,  748,  763,  763,  763,  763,  763,  763,  764,  764,
			  764,  764,  764,  764,  765,  765,  765,  765,  765,  765,
			  760,  767,  760,  767,  767,  764,  764,  764,  764,  764,
			  764,  766,  766,  766,  766,  766,  766,  762,  762,  762,
			  762,  762,  762,  767,  767,  767,  767,  767,  767,  767,

			  767,  767,  767,  767,  767,  767,  767,  767,  767,  762,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,   91,   91,   91,
			   91,   91,   91,   91,  107,  767,  107,  107,  107,  107,
			  107,  107,  107,  107,  107,  107,  767,  107,  107,  107,
			  109,  767,  109,  109,  109,  109,  109,  109,  109,  109, yy_Dummy>>,
			1, 200, 4800)
		end

	yy_nxt_template_26 (an_array: ARRAY [INTEGER])
			-- Fill chunk #26 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  109,  109,  109,  109,  109,  109,  163,  767,  163,  163,
			  163,  163,  163,  163,  163,  163,  163,  163,  163,  163,
			  163,  163,  196,  767,  196,  196,  196,  196,  196,  196,
			  196,  196,  196,  196,  767,  196,  196,  196,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  210,  210,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,

			  218,  218,  236,  767,  236,  236,  236,  236,  236,  236,
			  236,  236,  236,  236,  236,  236,  236,  236,  113,  113,
			  113,  113,  113,  113,  113,  113,  113,  113,  113,  113,
			  113,  113,  113,  113,  208,  208,  208,  208,  208,  208,
			  767,  208,  208,  208,  208,  208,  208,  208,  208,  208,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  233,  233,  233,  233,  233,  233,  233,  233,
			  233,  233,  233,  233,  233,  233,  233,  233,  348,  348, yy_Dummy>>,
			1, 200, 5000)
		end

	yy_nxt_template_27 (an_array: ARRAY [INTEGER])
			-- Fill chunk #27 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  348,  348,  348,  348,  348,  348,  348,  348,  348,  348,
			  348,  348,  348,  348,   13, yy_Dummy>>,
			1, 15, 5200)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 5304)
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
			an_array.area.fill_with (767, 5214, 5304)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    3,    5,   20,    6,    3,    4,    7,    8,   78,    4,
			    9,    9,    9,    9,   10,   10,   10,   10,   15,   88,
			   15,   15,   76,    9,   76,   76,   27,   10,   27,   27,
			   27,   27,   27,   27,  419,   84,  162,    5,    5,    6,
			    6,   40,   40,   86,   40,   53,   99,   20,  799,   99,
			  791,    3,  774,   53,   53,   78,    4,  462,  462,  165,
			    7,    8,  165,  744,  743,   40,    9,  165,  419,  725,
			   10,   84,   84,   88,    9,  724,  228,  688,   10,  228,
			   86,   86,  162,    3,    3,    3,    3,    3,    4,    4,
			    4,    4,    4, yy_Dummy>>,
			1, 93, 91)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   29,   87,   29,  117,   29,   29,   29,   29,   29,   29,
			   30,  466,   30,  215,   30,   30,   30,   30,   30,   30,
			  232,   37,   37,  232,   37,   38,   38,   80,   38,  161,
			   82,   39,   39,  775,   39,  271,   79,   87,   87,  117,
			  775,   41,   41,   29,   41,   37,  271,   45,   45,   38,
			   45,  680,  466,   30,   37,   39,  271,   38,   37,   39,
			   37,  104,  335,  104,  104,   41,  161,  215,   39,   42,
			   42,   45,   42,   81,  271,   45,   43,   43,   41,   43,
			   44,   44,   37,   44,  662,   38,   37,   39,   37,   41,
			  303,   46,   46,   42,   46,  506,   39,   42,   47,   47,

			   43,   47,  305,   45,   44,   80,   41,   82,   82,   42,
			  655,   43,   79,   79,   79,   46,  652,   41,   44,   44,
			  125,  125,   47,  125,   44,   42,  303,   83,   47,   49,
			   49,   46,   49,  198,  506,  198,  198,   42,  305,   43,
			  335,   47,   51,   51,  125,   51,   44,   44,  617,   81,
			   81,   81,   44,   49,   50,   50,   47,   50,  210,   46,
			   52,   52,  234,   52,   49,  234,   51,  529,  615,   47,
			   48,   48,   49,   48,   92,  206,  341,   92,   50,  502,
			  160,  614,   51,  596,   52,   48,   48,   48,   48,   48,
			   48,   48,   49,   50,   48,  210,  210,  209,   50,   60, yy_Dummy>>,
			1, 200, 274)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   49,   48,   60,   83,   83,   83,  529,   60,   48,   52,
			   51,  206,  206,  341,   60,   48,  160,   48,  695,   48,
			   57,   50,  502,   57,   58,  212,   50,   58,   57,   48,
			   92,  160,   58,  209,  209,   57,   48,   52,   92,   58,
			   59,  126,  126,   59,  126,   48,   61,   48,   59,   61,
			   60,  590,  572,   57,   61,   59,   58,   57,  568,   57,
			  695,   61,  212,  212,   62,  126,  103,   62,   59,  103,
			  558,   57,   62,  220,  220,   58,  220,   59,  103,   62,
			  535,   57,  527,   61,   58,   57,  518,   57,  503,  103,
			  447,   59,   62,  447,   61,   63,   59,   61,   63,  220,

			  618,  476,  455,   63,   62,   59,   64,   69,   69,   64,
			   63,   61,  420,   69,   64,   62,  702,  702,  702,  103,
			   62,   64,   61,   65,  351,  351,   65,  351,   69,  376,
			   63,   65,   62,  366,   67,   69,   69,   67,   65,  618,
			   66,   69,   67,   66,   64,   64,   63,  353,   66,   67,
			   64,   65,  348,   68,  343,   66,   68,   64,   63,  138,
			  138,   68,  138,  449,   67,   64,  449,   70,   68,  309,
			   70,  299,   64,   64,   65,   70,  202,   67,   64,   65,
			   66,  138,   70,  138,  709,   67,  102,   71,   68,  102,
			   71,   66,   67,  203,  259,   71,   68,  362,  102,  102, yy_Dummy>>,
			1, 200, 474)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  251,  250,   71,  222,   68,   67,  222,   70,   66,  102,
			  118,  118,  118,  118,  118,  118,   68,  111,   70,  245,
			  362,  245,  245,  709,   68,  362,  111,  111,  111,  111,
			  111,  111,  243,  242,  241,   70,   71,  240,   71,  102,
			  115,  115,  115,  115,  115,  115,  121,  121,  121,  121,
			  121,  121,  202,  202,  202,  238,  115,  230,  226,  222,
			  344,  344,  111,  344,   71,   89,   89,  222,   89,  203,
			  203,  203,  168,  352,  352,  168,  352,  111,  225,  115,
			  168,  111,  565,  111,  115,  565,  344,  168,  224,  223,
			  565,   89,  219,   89,   89,   89,   89,   89,   89,   89,

			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,  119,  119,  119,  119,
			  119,  119,  204,  168,  256,  256,  256,  256,  256,  120,
			  213,  120,  119,  120,  120,  120,  120,  120,  120,  120,
			  129,  129,  122,  129,  122,   89,  122,  122,  122,  122,
			  122,  122,  128,  128,  211,  128,  130,  130,  208,  130,
			  119,  196,  131,  131,  129,  131,  132,  132,  172,  132,
			  133,  133,  120,  133,  166,  413,  128,  129,  134,  134,
			  130,  134,  465,  413,  465,  122,  131,  130,  135,  135,
			  132,  135,  163,  465,  133,  131,  387,  128,  204,  204, yy_Dummy>>,
			1, 200, 674)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  204,  159,  134,  136,  136,  129,  136,  387,  229,  132,
			  133,  229,  135,  205,  413,  130,  231,  387,  135,  231,
			  229,  465,  134,  131,  135,  128,  146,  136,  231,  137,
			  137,  229,  137,  139,  139,  387,  139,  132,  133,  231,
			  136,  140,  140,  114,  140,  113,  135,  112,  337,  109,
			  134,  497,  135,  137,  497,  141,  141,  139,  141,  142,
			  142,  229,  142,  143,  143,  140,  143,  416,  136,  231,
			  594,  140,  137,  107,  139,  416,  497,  144,  144,  141,
			  144,  145,  145,  142,  145,  105,  100,  143,   97,  205,
			  205,  205,  406,  594,  148,  148,   96,  148,  594,  140,

			  137,  144,  139,  406,  142,  145,  416,  144,  143,  148,
			  141,   95,  145,  406,  149,  149,   93,  149,  148,  152,
			  152,  152,  152,  152,  152,  337,  337,  151,  151,  149,
			  151,  406,  142,   75,  412,  144,  143,  412,  149,  148,
			  145,  147,  151,  147,  147,  149,  244,  244,  152,  244,
			   72,  151,  152,  158,  158,  722,  158,  722,  151,  149,
			  147,  149,  334,   56,  147,   35,  722,  147,   33,   28,
			  244,   26,  151,  149,  147,   18,  147,  158,  147,   17,
			  152,  153,  153,   16,  153,   13,  151,  412,  147,  149,
			  154,  154,  147,  154,  722,  147,    0,  155,  155,    0, yy_Dummy>>,
			1, 200, 874)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  155,    0,  158,    0,  147,  153,  147,  150,  150,    0,
			  150,  336,    0,  153,  154,    0,  153,  638,  638,  638,
			  638,  155,  150,  150,  150,  150,  150,  150,  150,    0,
			  158,  150,    0,  155,    0,  489,  154,  155,  334,  334,
			  334,  153,  150,    0,  153,  150,  489,  157,  157,    0,
			  157,  150,  156,  156,  169,  156,  489,  169,    0,    0,
			  170,  155,  169,  170,  154,  155,    0,    0,  170,  169,
			  150,  157,    0,  150,  489,  170,  156,  171,    0,  150,
			  171,  201,    0,  173,  156,  171,  173,  336,  336,  336,
			  157,  173,  171,  262,  262,    0,  262,  170,  173,  169,

			  267,  267,  742,  267,  742,  169,  174,  175,  171,  174,
			  175,  170,  156,  742,  174,  175,  173,  262,  157,    0,
			    0,  174,  175,  176,  267,  170,  176,  169,  171,  270,
			  270,  176,  270,    0,  173,  550,  171,  267,  176,    0,
			  177,  742,    0,  177,  173,    0,    0,  175,  177,  174,
			    0,  178,  550,  270,  178,  177,  550,  174,  175,  178,
			  201,  201,  201,  201,  201,  267,  178,  176,  261,  261,
			  177,  261,    0,    0,  176,  175,  177,  174,  179,  180,
			  550,  179,  180,    0,  270,    0,  179,  180,  178,    0,
			    0,  177,  261,  179,  180,  176,    0,  181,  177,    0, yy_Dummy>>,
			1, 200, 1074)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  181,  180,  178,  182,  177,  181,  182,  183,  261,    0,
			  183,  182,  181,    0,    0,  183,  178,    0,  182,    0,
			  185,  179,  183,  185,  184,    0,    0,  184,  185,  179,
			  180,    0,  184,  182,    0,  185,  261,    0,  181,  184,
			  184,  184,  184,  184,  184,  184,  338,  605,  181,  179,
			  263,  263,  186,  263,  182,  186,    0,    0,  183,    0,
			  186,  182,  183,    0,  605,  185,  181,  186,  605,  187,
			  188,  185,  187,  188,  263,  184,    0,  187,  188,  189,
			  190,    0,  189,  190,  187,  188,    0,  189,  190,    0,
			  263,  339,  605,  185,  189,  190,    0,  186,    0,  187,

			    0,  188,  191,  186,  192,  191,    0,  192,    0,    0,
			  191,  189,  192,  260,  260,    0,  260,  191,  263,  192,
			  187,  188,  338,  338,  338,  186,  190,  187,    0,  188,
			  189,  190,  193,    0,    0,  193,  192,  260,  191,  189,
			  193,  194,  191,    0,  194,  260,    0,  193,    0,  194,
			    0,    0,    0,  191,  190,  192,  194,  227,  227,  227,
			  227,  227,  227,    0,  192,  340,  191,  339,  339,  339,
			  191,    0,    0,  260,    0,  193,  239,  239,  239,  239,
			  239,  239,  239,  193,  247,  247,  247,  247,  247,  247,
			  194,    0,  194,  249,  249,  249,  249,  249,  249,  248, yy_Dummy>>,
			1, 200, 1274)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  247,  248,    0,  193,  248,  248,  248,  248,  248,  248,
			  252,  252,  252,  252,  252,  252,    0,    0,  194,  216,
			  216,    0,  216,  247,  254,    0,  254,    0,  247,  254,
			  254,  254,  254,  254,  254,  257,  257,  257,  257,  257,
			  257,  340,  340,  340,    0,  216,    0,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			    0,    0,    0,    0,  253,  253,  253,  253,  253,  253,
			  280,  280,  280,  280,  280,  280,    0,  255,    0,  255,
			  253,  255,  255,  255,  255,  255,  255,    0,    0,  216,

			  233,  233,  233,  233,  233,  233,  233,  233,  233,  233,
			  233,  233,  233,  253,    0,  233,  264,  264,  253,  264,
			    0,    0,  233,  233,  233,  233,  233,  233,    0,  611,
			  255,    0,  265,  265,    0,  265,  266,  266,    0,  266,
			  264,  274,  274,    0,  274,    0,  611,  264,    0,    0,
			  611,  233,  233,  233,  233,  653,  265,    0,  653,    0,
			  266,    0,    0,    0,    0,  274,  268,  268,  266,  268,
			  269,  269,    0,  269,  611,  264,  265,  274,  233,  233,
			  233,  233,  233,  233,  233,  233,  233,  233,  233,  233,
			  268,    0,  272,  272,  269,  272,  266,  273,  273,    0, yy_Dummy>>,
			1, 200, 1474)
		end

	yy_chk_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  273,    0,    0,    0,  265,  274,  275,  275,  653,  275,
			  268,    0,    0,    0,  269,    0,  272,  276,  276,  653,
			  276,  273,  277,  277,  308,  277,    0,  308,    0,  272,
			  275,    0,  308,  787,  273,    0,  275,  787,  268,  308,
			  787,  276,  269,  787,  647,    0,  277,  278,  278,    0,
			  278,  286,  286,  286,  286,  286,  286,  272,    0,    0,
			    0,  647,  273,    0,  275,  647,  281,  281,  277,  281,
			    0,  278,    0,  324,    0,  308,  324,  290,  290,  278,
			  290,  324,  281,  281,  281,  281,  281,  281,  324,  647,
			  281,    0,  290,    0,    0,    0,  277,  282,  282,    0,

			  282,  290,  539,  539,  539,  539,  539,  278,    0,  283,
			  283,  281,  283,  282,  282,  282,  282,  282,  282,  284,
			  284,  282,  284,    0,  324,  283,  283,  283,  283,  283,
			  283,  285,  285,  283,  285,  284,  284,  284,  284,  284,
			  284,    0,  287,  284,  287,  287,    0,  285,  285,  285,
			  285,  285,  285,    0,  283,  285,  288,  288,  288,  288,
			  288,  288,    0,    0,  284,  287,  289,  289,  287,  289,
			  291,  291,    0,  291,  287,  288,  285,  292,  292,    0,
			  292,  289,  293,  293,    0,  293,    0,    0,  294,  294,
			  289,  294,    0,  287,  291,    0,  287,  295,  295,  292, yy_Dummy>>,
			1, 200, 1674)
		end

	yy_chk_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  295,  292,  287,  288,  296,  296,  293,  296,    0,  291,
			  289,    0,  294,  650,  293,  297,  297,  650,  297,    0,
			    0,  295,  298,  298,    0,  298,    0,    0,  296,    0,
			  294,    0,  349,  349,  650,  349,    0,  291,  289,  297,
			  295,    0,  293,    0,  349,  650,  298,  300,  300,  300,
			  300,  300,  300,  300,    0,  349,    0,    0,  294,  296,
			  302,  302,  302,  302,  302,  302,  302,    0,  295,    0,
			  301,  298,  301,  301,  301,  301,  301,  301,  301,  306,
			  307,  310,  306,  307,  310,  349,    0,  306,  307,  310,
			  382,  382,    0,  382,  306,  307,  310,    0,    0,  298,

			  312,    0,  311,  312,  313,  311,    0,  313,  312,    0,
			  311,  306,  313,    0,  382,  312,    0,  311,    0,  313,
			  307,  310,  381,  381,    0,  381,  314,    0,    0,  314,
			  306,  307,  310,  311,  314,  315,  313,  316,  315,  306,
			  316,  314,    0,  315,  312,  316,  381,    0,  307,  310,
			  315,  312,  316,  311,  381,  313,    0,    0,    0,  317,
			    0,  311,  317,  314,  313,  318,    0,  317,  318,    0,
			    0,    0,  312,  318,  317,  319,    0,  314,  319,  315,
			  318,  316,  381,  319,  320,    0,  315,  320,  316,    0,
			  319,  314,  320,  363,  363,  363,  363,  363,  363,  320, yy_Dummy>>,
			1, 200, 1874)
		end

	yy_chk_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,  318,  321,  493,    0,  321,  315,    0,  316,
			  317,  321,  319,    0,  317,  493,  318,  321,  321,  325,
			  320,  323,  325,    0,  323,  493,  319,  325,    0,  323,
			  318,  707,    0,    0,  325,  320,  323,    0,    0,  707,
			  319,  322,    0,  493,  322,    0,    0,    0,  320,  322,
			    0,  323,  707,    0,  321,  322,  322,  322,  322,  322,
			  322,  322,  322,  326,    0,  325,  326,  707,    0,    0,
			  325,  326,  323,  327,  328,    0,  327,  328,  326,  323,
			  562,  327,  328,  384,  384,    0,  384,    0,  327,  328,
			    0,  562,  322,  325,  329,  326,  330,  329,    0,  330,

			  331,  562,  329,  331,  330,    0,  328,  384,  331,  329,
			    0,  330,  327,    0,  326,  331,  651,    0,  332,  562,
			  651,  332,    0,  326,  327,  328,  332,  333,  384,  346,
			  333,    0,  346,  332,  328,  333,  329,  651,    0,  330,
			  327,  346,  333,  346,    0,  329,    0,  330,  651,    0,
			    0,  331,  346,    0,  347,  331,  384,  347,  364,  364,
			  364,  364,  364,  364,  329,    0,  347,  330,  347,  332,
			  347,  347,  347,  347,  347,  347,  333,  347,  333,    0,
			    0,    0,  346,  356,  356,  356,  356,  356,  356,  356,
			  365,  365,  365,  365,  365,  365,    0,  364,  367,  367, yy_Dummy>>,
			1, 200, 2074)
		end

	yy_chk_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  367,  367,  367,  367,  333,    0,    0,  347,  368,  368,
			  368,  368,  368,  368,  370,  370,  370,  370,  370,  370,
			  369,    0,  369,    0,  368,  369,  369,  369,  369,  369,
			  369,  371,  371,  371,  371,  371,  371,  372,  372,  372,
			  372,  372,  372,    0,    0,    0,    0,  368,    0,    0,
			  373,  373,  368,  373,  373,  373,  373,  373,  373,  374,
			  374,  374,  374,  374,  374,  375,  375,  375,  375,  375,
			  375,  377,  377,    0,  377,    0,  372,  378,  378,  563,
			  378,  446,  379,  379,  446,  379,  380,  380,    0,  380,
			  563,  383,  383,  446,  383,  377,  385,  385,    0,  385,

			  563,  378,  386,  386,  446,  386,  379,    0,  388,  388,
			  380,  388,  732,    0,  377,  383,  389,  389,  563,  389,
			  385,    0,  380,  732,  378,  379,  386,    0,  385,    0,
			  386,    0,  388,  732,  446,  390,  390,  383,  390,    0,
			  389,    0,  377,  677,  388,  391,  391,  677,  391,    0,
			  380,  732,  378,  379,  392,  392,  385,  392,  386,  390,
			  393,  393,  389,  393,  677,  383,  678,    0,    0,  391,
			  678,    0,  388,    0,  390,  677,  404,  404,  392,  404,
			  391,  396,  405,  405,  393,  405,    0,  678,  749,    0,
			  389,  394,  394,  394,  394,  394,  394,  392,  678,  708, yy_Dummy>>,
			1, 200, 2274)
		end

	yy_chk_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  404,  396,  390,  393,  396,  749,  405,  708,  391,  749,
			  396,  397,  397,  397,  397,  397,  397,  789,  789,  394,
			  708,  789,  789,    0,  789,  392,    0,    0,    0,  396,
			  397,  393,  396,  749,    0,  708,  407,  407,  396,  407,
			  398,  398,  398,  398,  398,  398,    0,  394,  395,  395,
			  395,  395,  395,  395,    0,  398,  399,  399,  397,  399,
			  407,    0,    0,  395,  400,  400,  400,  400,  400,  400,
			  395,  398,  399,  399,  399,  399,  399,  399,    0,  395,
			  399,  395,    0,  398,    0,  733,    0,  399,    0,  410,
			  410,  395,  410,    0,    0,    0,  733,  400,  395,  398,

			  401,  401,  401,  401,  401,  401,  733,  395,    0,  395,
			    0,    0,    0,  410,    0,  399,  402,  402,  402,  402,
			  402,  402,    0,  750,  733,  400,  408,  408,  410,  408,
			    0,  402,  403,  403,  403,  403,  403,  403,  409,  409,
			  750,  409,  411,  411,  750,  411,    0,  403,  790,    0,
			  408,  790,  790,  790,  790,  411,  410,  790,    0,  402,
			  467,  467,  409,  467,    0,    0,  411,    0,  750,  409,
			  474,  474,  408,  474,  414,  403,  414,  414,  414,  414,
			  414,  414,  414,  415,  467,  415,  415,  415,  415,  415,
			  415,  415,    0,    0,  474,    0,    0,  409,    0,  417, yy_Dummy>>,
			1, 200, 2474)
		end

	yy_chk_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  408,  417,  417,  417,  417,  417,  417,  417,  468,  468,
			    0,  468,  418,  414,  418,  418,  418,  418,  418,  418,
			  418,  421,  415,    0,  421,  424,    0,  422,  424,  421,
			  422,    0,  468,  424,    0,  422,  421,    0,  417,    0,
			  424,    0,  422,  423,  423,  423,  423,  423,  423,    0,
			  425,  418,  426,  425,  427,  426,    0,  427,  425,    0,
			  426,    0,  427,  468,  421,  425,    0,  426,  424,  427,
			    0,    0,  421,    0,  422,    0,  424,    0,  422,  428,
			  470,  470,  428,  470,  426,  430,  425,  428,  430,    0,
			    0,    0,  421,  430,  428,    0,  424,    0,    0,    0,

			  430,  425,  422,  426,  470,  427,    0,  429,    0,    0,
			  429,    0,  426,  431,  425,  429,  431,  430,    0,  470,
			    0,  431,  429,  432,  433,  428,  432,  433,  431,  738,
			  428,  432,  433,    0,  434,    0,  430,  434,  432,  433,
			  738,  431,  434,  479,  479,  430,  479,  470,  436,  434,
			  738,  436,  429,  428,    0,    0,  436,  437,  429,  432,
			  437,    0,    0,  436,  431,  437,    0,  479,  738,  431,
			  433,    0,  437,  434,  432,  433,  640,  640,  640,  640,
			  429,  543,  543,  436,  543,  434,    0,  432,  435,  435,
			  435,  435,  435,  435,  438,  739,    0,  438,  433,  436, yy_Dummy>>,
			1, 200, 2674)
		end

	yy_chk_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  437,  434,  438,    0,  439,  543,  739,  439,  437,  438,
			  440,  436,  439,  440,    0,  640,  739,    0,  440,  439,
			    0,  441,    0,  442,  441,  440,  442,  443,  437,  441,
			  443,  442,  717,    0,  739,  443,  441,  438,  442,    0,
			  717,    0,  443,    0,    0,  438,    0,  485,  485,  444,
			  485,    0,  444,  717,  442,  439,    0,  444,    0,    0,
			    0,  440,  444,    0,  444,  438,  443,  441,  717,  800,
			    0,  485,  441,  800,  442,    0,  800,    0,  443,  800,
			    0,    0,  442,  448,  448,  448,  448,  448,  448,    0,
			    0,    0,  485,    0,  443,  441,    0,    0,    0,    0,

			  444,  451,  451,  451,  451,  451,  451,  452,  452,  452,
			  452,  452,  452,  453,  453,  453,  453,  453,  453,  454,
			  454,  454,  454,  454,  454,  456,  456,  456,  456,  456,
			  456,  457,  457,  457,  457,  457,  457,    0,    0,    0,
			  451,  456,  458,  458,  458,  458,  458,  458,  459,  459,
			  459,  459,  459,  459,  460,  460,  460,  460,  460,  460,
			    0,  797,  797,    0,  456,  797,  797,    0,  797,  456,
			  461,  461,  461,  461,  461,  461,  469,  469,    0,  469,
			    0,  458,  463,  463,  463,  463,  463,  463,  471,  471,
			    0,  471,  464,  460,  464,  464,  464,  464,  464,  464, yy_Dummy>>,
			1, 200, 2874)
		end

	yy_chk_template_16 (an_array: ARRAY [INTEGER])
			-- Fill chunk #16 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  469,  472,  472,    0,  472,    0,  473,  473,  469,  473,
			  477,  477,  471,  477,    0,  475,  475,    0,  475,  471,
			  478,  478,    0,  478,    0,  472,    0,    0,    0,    0,
			  473,    0,  472,    0,  477,    0,  469,    0,  473,  475,
			  480,  480,  477,  480,  478,  481,  481,  471,  481,    0,
			  473,  478,  475,  482,  482,    0,  482,    0,  545,  545,
			  472,  545,  492,  492,  480,  492,  473,    0,  504,  481,
			  477,  504,  480,    0,    0,    0,  504,  482,  473,  478,
			  475,    0,  545,  504,    0,  482,  492,    0,  481,  484,
			  484,  484,  484,  484,  484,    0,  490,  490,    0,  490,

			  480,    0,  492,    0,  484,  486,  486,  486,  486,  486,
			  486,    0,    0,  482,  491,  491,  481,  491,    0,  504,
			  490,    0,  488,  488,  488,  488,  488,  488,  490,    0,
			  492,    0,  484,  486,  548,  548,    0,  548,  491,  559,
			  559,    0,  559,    0,  488,    0,  491,  495,  495,  495,
			  495,  495,  495,  495,    0,    0,  490,    0,  548,    0,
			    0,  486,  487,  559,  487,    0,  487,  487,  487,  487,
			  487,  487,  488,    0,  491,  505,  509,  513,  505,  509,
			  513,  487,    0,  505,  509,  513,    0,    0,  487,    0,
			  505,  509,  513,    0,  487,  498,  498,  498,  498,  498, yy_Dummy>>,
			1, 200, 3074)
		end

	yy_chk_template_17 (an_array: ARRAY [INTEGER])
			-- Fill chunk #17 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  498,  498,  500,  500,  500,  500,  500,  500,  500,  487,
			  508,    0,    0,  508,    0,  509,  487,    0,  508,    0,
			    0,    0,  487,    0,    0,  508,  505,  509,  513,  507,
			  505,  507,  507,  507,  507,  507,  507,    0,  510,    0,
			    0,  510,  508,  509,  511,    0,  510,  511,  512,    0,
			    0,  512,  511,  510,  542,  542,  512,  542,    0,  511,
			    0,  508,    0,  512,  514,    0,  718,  514,  507,  510,
			  508,    0,  514,  515,  718,  511,  515,    0,  542,  514,
			  512,  515,  542,  516,    0,    0,  516,  718,  515,  510,
			    0,  516,  512,  602,  602,  511,  602,  510,  516,  512,

			    0,  514,  718,  511,  517,  515,    0,  517,  512,    0,
			  542,    0,  517,  521,  516,  514,  521,  602,    0,  517,
			  512,  521,  520,    0,  515,  520,  794,  794,  521,  514,
			  520,    0,    0,  515,  516,  794,  794,  520,    0,    0,
			  794,  519,  516,  519,  519,  519,  519,  519,  519,  729,
			  729,  729,  729,  729,  520,  517,  521,  522,    0,  523,
			  522,    0,  523,  524,  521,  522,  524,  523,    0,    0,
			    0,  524,  522,  520,  523,    0,    0,  753,  524,    0,
			    0,    0,  520,    0,  521,  525,    0,    0,  525,  522,
			    0,  523,    0,  525,  753,  524,  604,  604,  753,  604, yy_Dummy>>,
			1, 200, 3274)
		end

	yy_chk_template_18 (an_array: ARRAY [INTEGER])
			-- Fill chunk #18 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  525,  528,  528,  528,  528,  528,  528,    0,  522,    0,
			  523,    0,  526,    0,  524,  526,    0,  522,    0,  523,
			  604,    0,  753,  524,  526,  525,  526,    0,  526,  526,
			  526,  526,  526,  526,    0,  526,  525,  530,    0,  530,
			  530,  530,  530,  530,  530,  531,  531,  531,  531,  531,
			  531,    0,    0,  525,  532,  532,  532,  532,  532,  532,
			    0,  531,    0,    0,    0,  526,  533,  533,  533,  533,
			  533,  533,    0,    0,    0,    0,  530,  534,  534,  534,
			  534,  534,  534,  536,  536,  536,  536,  536,  536,  531,
			    0,    0,    0,  532,  537,  537,  537,  537,  537,  537,

			  538,  538,  538,  538,  538,  538,  541,  541,  541,  541,
			  541,  541,  544,  544,    0,  544,    0,  546,  546,    0,
			  546,    0,  541,  547,  547,    0,  547,  549,  549,    0,
			  549,  551,  551,    0,  551,    0,  544,  754,    0,    0,
			  544,  546,  552,  552,    0,  552,    0,  547,    0,  546,
			  541,  549,    0,    0,  754,  551,  553,  553,  754,  553,
			  555,  555,  547,  555,  549,    0,  552,    0,  544,  554,
			  554,    0,  554,  573,  552,  551,  573,  546,    0,    0,
			  553,  573,  754,    0,  555,    0,    0,    0,  573,    0,
			  547,  555,  549,  554,  560,  560,    0,  560,    0,    0, yy_Dummy>>,
			1, 200, 3474)
		end

	yy_chk_template_19 (an_array: ARRAY [INTEGER])
			-- Fill chunk #19 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  553,  554,  552,  551,  556,    0,  556,    0,  556,  556,
			  556,  556,  556,  556,  561,  561,    0,  561,  560,  555,
			    0,    0,    0,  556,  573,    0,    0,    0,  553,  554,
			  569,  569,  569,  569,  569,  569,    0,  560,  561,  571,
			  571,  571,  571,  571,  571,  561,    0,    0,    0,    0,
			  564,  556,  564,  564,  564,  564,  564,  564,  564,  747,
			  747,  747,  747,  747,  566,  560,  566,  566,  566,  566,
			  566,  566,  566,  561,  567,    0,  567,  567,  567,  567,
			  567,  567,  567,  570,  574,  575,  570,  574,  575,  564,
			    0,  570,  574,  575,  576,    0,    0,  576,  570,  574,

			  575,    0,  576,  566,    0,    0,    0,  577,    0,  576,
			  577,  570,  574,  567,    0,  577,  578,  600,  600,  578,
			  600,    0,  577,    0,  578,    0,  576,    0,    0,  579,
			    0,  578,  579,    0,  570,  574,  575,  579,    0,  570,
			  574,  600,    0,    0,  579,  576,  577,  580,  582,  581,
			  580,  582,  581,    0,  576,  580,  582,  581,  577,    0,
			  600,    0,  580,  582,  581,    0,  579,  578,    0,    0,
			  583,    0,    0,  583,  577,    0,  776,  776,  583,    0,
			  579,  581,    0,  776,  776,  583,  776,    0,  600,  776,
			    0,  580,  582,  584,  579,    0,  584,    0,  580,  582, yy_Dummy>>,
			1, 200, 3674)
		end

	yy_chk_template_20 (an_array: ARRAY [INTEGER])
			-- Fill chunk #20 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  581,  584,  583,  585,    0,    0,  585,  586,  584,  581,
			  586,  585,    0,    0,    0,  586,    0,    0,  585,  580,
			  582,  583,  586,    0,  584,  587,    0,    0,  587,    0,
			  583,    0,    0,  587,  588,  588,  588,  588,  588,  588,
			  587,    0,  606,  606,  584,  606,    0,    0,    0,    0,
			  586,    0,  584,    0,  585,    0,  587,    0,  586,  589,
			  589,  589,  589,  589,  589,  591,  606,  591,    0,    0,
			  591,  591,  591,  591,  591,  591,  587,    0,  586,    0,
			    0,    0,    0,    0,  587,  592,  592,  592,  592,  592,
			  592,  593,  593,  593,  593,  593,  593,  595,  595,  595,

			  595,  595,  595,  597,  597,  597,  597,  597,  597,  598,
			  598,  598,  598,  598,  598,  599,  599,  599,  599,  599,
			  599,    0,    0,    0,  592,  601,  601,    0,  601,  607,
			  607,  599,  607,  603,  603,    0,  603,  608,  608,    0,
			  608,  609,  609,    0,  609,  610,  610,    0,  610,  601,
			    0,    0,    0,  607,  599,  612,  612,  603,  612,  599,
			    0,  608,  601,  603,    0,  609,    0,    0,    0,  610,
			  613,  613,    0,  613,  620,    0,    0,  620,    0,  612,
			  609,    0,  620,  756,  756,  756,  756,  612,    0,  620,
			  601,  603,    0,  619,  613,  619,  619,  619,  619,  619, yy_Dummy>>,
			1, 200, 3874)
		end

	yy_chk_template_21 (an_array: ARRAY [INTEGER])
			-- Fill chunk #21 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  619,    0,  613,  649,  649,    0,  649,  621,  609,  621,
			  621,  621,  621,  621,  621,  612,  622,  620,  623,  622,
			  624,  623,  756,  624,  622,  620,  623,  649,  624,    0,
			  613,  622,  619,  623,  625,  624,  626,  625,    0,  626,
			  627,    0,  625,  627,  626,  620,  621,    0,  627,  625,
			  624,  626,    0,  622,    0,  627,    0,  628,  629,    0,
			  628,  629,    0,    0,    0,  628,  629,  622,    0,  623,
			    0,  624,  628,  629,    0,    0,  642,  642,  624,  642,
			  630,  622,    0,  630,    0,  625,  631,  626,  630,  631,
			  632,  627,    0,  632,  631,  630,  661,  629,  632,  661,

			  642,  631,    0,    0,  661,  632,  642,    0,  628,  629,
			  633,  661,  633,  633,  633,  633,  633,  633,  631,    0,
			  673,  673,  632,  673,    0,  629,    0,  777,  777,    0,
			  777,  630,  777,    0,  642,  777,    0,  631,  777,    0,
			    0,  632,    0,    0,  673,    0,  631,  661,    0,  633,
			  632,  634,  634,  634,  634,  634,  634,  635,  635,  635,
			  635,  635,  635,  636,  636,  636,  636,  636,  636,  637,
			    0,  637,    0,    0,  637,  637,  637,  637,  637,  637,
			  639,  639,  639,  639,  639,  639,  641,  641,  641,  641,
			  641,  641,  643,  643,    0,  643,    0,  644,  644,    0, yy_Dummy>>,
			1, 200, 4074)
		end

	yy_chk_template_22 (an_array: ARRAY [INTEGER])
			-- Fill chunk #22 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  644,    0,  641,  646,  646,    0,  646,  648,  648,    0,
			  648,  671,  671,  779,  671,  779,  643,    0,    0,  779,
			  779,  644,    0,  779,  779,  641,  779,  646,  643,  644,
			  641,  648,    0,  646,    0,  671,    0,    0,  648,  654,
			  654,  654,  654,  654,  654,  656,  671,  657,  656,    0,
			  657,    0,    0,  656,    0,  657,  643,  644,    0,    0,
			  656,  646,  657,    0,  659,  658,  648,  659,  658,    0,
			    0,    0,  659,  658,  671,  656,    0,    0,  660,  659,
			  658,  660,    0,  657,    0,    0,  660,  663,  663,  663,
			  663,  663,  663,  660,  659,    0,  656,  658,  657,  676,

			  676,    0,  676,  656,  679,  679,    0,  679,    0,  660,
			    0,  657,    0,    0,  785,  659,  658,    0,    0,  785,
			    0,  785,  659,  676,  785,  658,    0,  785,  679,  660,
			  664,  664,  664,  664,  664,  664,    0,  660,  665,  665,
			  665,  665,  665,  665,  666,  666,  666,  666,  666,  666,
			  667,  667,  667,  667,  667,  667,  668,  668,  668,  668,
			  668,  668,  670,  670,  670,  670,  670,  670,    0,  664,
			  672,  672,    0,  672,    0,    0,  674,  674,  670,  674,
			  681,    0,  681,  681,  681,  681,  681,  681,  682,  683,
			  684,  682,  683,  684,  672,    0,  682,  683,  684,  685, yy_Dummy>>,
			1, 200, 4274)
		end

	yy_chk_template_23 (an_array: ARRAY [INTEGER])
			-- Fill chunk #23 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  674,  670,  685,  682,  683,  684,  670,  685,  674,  686,
			    0,    0,  686,    0,  685,  672,    0,  686,    0,  681,
			    0,    0,    0,  682,  686,  687,  687,  687,  687,  687,
			  687,  685,    0,    0,  683,    0,  674,    0,    0,  682,
			  683,  684,    0,  672,  689,  689,  689,  689,  689,  689,
			  685,  682,  691,  691,  691,  691,  691,  691,    0,  685,
			  686,  690,  683,  690,  687,    0,  690,  690,  690,  690,
			  690,  690,  692,  692,    0,  692,    0,  693,  693,    0,
			  693,  694,  694,    0,  694,  698,  698,  698,  698,  698,
			  698,  699,    0,    0,  699,  700,  692,    0,  700,  699,

			  690,  693,    0,  700,  692,  694,  699,    0,    0,    0,
			  700,    0,  701,    0,    0,  701,  704,  704,    0,  704,
			  701,  705,  705,  699,  705,  694,  693,  701,  706,  706,
			    0,  706,  692,  703,  703,  703,  703,  703,  703,    0,
			  704,    0,  699,    0,  700,  705,  700,    0,    0,    0,
			    0,  699,  706,  694,  693,    0,  701,  737,  737,    0,
			  737,  704,  710,  701,  710,  710,  710,  710,  710,  710,
			  711,  712,  700,  711,  712,    0,    0,    0,  711,  712,
			  713,  737,    0,  713,  701,  711,  712,    0,  713,  704,
			  716,  716,    0,  716,    0,  713,    0,    0,    0,    0, yy_Dummy>>,
			1, 200, 4474)
		end

	yy_chk_template_24 (an_array: ARRAY [INTEGER])
			-- Fill chunk #24 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,  710,  714,  714,  714,  714,  714,  714,  715,  715,
			  715,  715,  715,  715,  716,  711,  723,  723,    0,  723,
			    0,  711,  712,  719,  719,  719,  719,  719,  719,  721,
			    0,  713,  721,    0,    0,    0,    0,  721,  727,  716,
			  723,  727,    0,  711,  721,  726,  727,  726,  726,  726,
			  726,  726,  726,  727,    0,    0,    0,  723,  728,  728,
			  728,  728,  728,  728,    0,    0,    0,  716,  731,  731,
			    0,  731,    0,  734,    0,    0,  734,    0,  721,  727,
			  721,  734,    0,    0,  726,  723,    0,    0,  734,  727,
			    0,    0,  731,  735,  735,  735,  735,  735,  735,    0,

			  731,    0,    0,    0,    0,  734,  721,  727,  736,  736,
			  736,  736,  736,  736,  740,    0,    0,  740,    0,    0,
			    0,    0,  740,    0,  734,    0,    0,    0,  731,  740,
			    0,    0,    0,  734,  741,  741,  741,  741,  741,  741,
			  745,  745,  745,  745,  745,  745,  746,  746,  746,  746,
			  746,  746,  751,  751,  751,  751,  751,  751,  752,  752,
			  752,  752,  752,  752,    0,  740,  755,  755,  755,  755,
			  755,  755,  759,  759,  759,  759,  759,  759,  760,  760,
			  760,  760,  760,  760,  761,  761,  761,  761,  761,  761,
			  763,  763,  763,  763,  763,  763,  764,    0,  764,    0, yy_Dummy>>,
			1, 200, 4674)
		end

	yy_chk_template_25 (an_array: ARRAY [INTEGER])
			-- Fill chunk #25 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,  764,  764,  764,  764,  764,  764,  765,  765,  765,
			  765,  765,  765,  766,  766,  766,  766,  766,  766,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  764,  768,  768,  768,  768,
			  768,  768,  768,  768,  768,  768,  768,  768,  768,  768,
			  768,  768,  769,  769,  769,  769,  769,  769,  769,  769,
			  769,  769,  769,  769,  769,  769,  769,  769,  770,  770,
			  770,  770,  770,  770,  770,  770,  770,  770,  770,  770,
			  770,  770,  770,  770,  771,  771,  771,  771,  771,  771,
			  771,  771,  771,  771,  771,  771,  771,  771,  771,  771,

			  772,    0,  772,  772,  772,  772,  772,  772,  772,  772,
			  772,  772,    0,  772,  772,  772,  773,    0,  773,  773,
			  773,  773,  773,  773,  773,  773,  773,  773,  773,  773,
			  773,  773,  778,    0,  778,  778,  778,  778,  778,  778,
			  778,  778,  778,  778,  778,  778,  778,  778,  780,    0,
			  780,  780,  780,  780,  780,  780,  780,  780,  780,  780,
			    0,  780,  780,  780,  781,  781,  781,  781,  781,  781,
			  781,  781,  781,  781,  781,  781,  781,  781,  781,  781,
			  782,  782,  782,  782,  782,  782,  782,  782,  782,  782,
			  782,  782,  782,  782,  782,  782,  783,  783,  783,  783, yy_Dummy>>,
			1, 200, 4874)
		end

	yy_chk_template_26 (an_array: ARRAY [INTEGER])
			-- Fill chunk #26 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  783,  783,  783,  783,  783,  783,  783,  783,  783,  783,
			  783,  783,  784,  784,  784,  784,  784,  784,  784,  784,
			  784,  784,  784,  784,  784,  784,  784,  784,  786,    0,
			  786,  786,  786,  786,  786,  786,  786,  786,  786,  786,
			  786,  786,  786,  786,  788,  788,  788,  788,  788,  788,
			  788,  788,  788,  788,  788,  788,  788,  788,  788,  788,
			  792,  792,  792,  792,  792,  792,    0,  792,  792,  792,
			  792,  792,  792,  792,  792,  792,  793,  793,  793,  793,
			  793,  793,  793,  793,  793,  793,  793,  793,  793,  793,
			  793,  793,  795,  795,  795,  795,  795,  795,  795,  795,

			  795,  795,  795,  795,  795,  795,  795,  795,  796,  796,
			  796,  796,  796,  796,  796,  796,  796,  796,  796,  796,
			  796,  796,  796,  796,  798,  798,  798,  798,  798,  798,
			  798,  798,  798,  798,  798,  798,  798,  798,  798,  798, yy_Dummy>>,
			1, 140, 5074)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 800)
			yy_base_template_1 (an_array)
			yy_base_template_2 (an_array)
			yy_base_template_3 (an_array)
			yy_base_template_4 (an_array)
			an_array.put (2939, 800)
			Result := yy_fixed_array (an_array)
		end

	yy_base_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,   89,   94,   76,   78,   70,   71,  100,
			  104,  183,    0, 1059, 5214,  108, 1055, 1027, 1043, 5214,
			   85,    0, 5214, 5214, 5214, 5214, 1031,  102, 1027,  261,
			  271, 5214, 5214, 1016, 5214, 1013, 5214,  294,  298,  304,
			  131,  314,  342,  349,  353,  320,  364,  371,  443,  402,
			  427,  415,  433,   79, 5214, 5214,  982,  493,  497,  513,
			  472,  519,  537,  568,  579,  596,  613,  607,  626,  542,
			  640,  660, 1008, 5214, 5214, 1001,  112, 5214,   93,  304,
			  295,  341,  298,  395,  110, 5214,  118,  259,   83,  738,
			 5214, 5214,  447,  988, 5214,  971,  896,  902, 5214,  136,

			  958, 5214,  659,  539,  334,  957, 5214,  941, 5214,  915,
			    0,  683,  911,  917,  902,  697, 5214,  261,  667,  773,
			  790,  703,  803, 5214, 5214,  393,  514,    0,  825,  813,
			  829,  835,  839,  843,  851,  861,  876,  902,  632,  906,
			  914,  928,  932,  936,  950,  954,  819, 1002,  967,  987,
			 1080, 1000,  976, 1054, 1063, 1070, 1125, 1120, 1026,  852,
			  431,  280,  104,  811, 5214,  149,  838,    0,  745, 1127,
			 1133, 1150,  777, 1156, 1179, 1180, 1196, 1213, 1224, 1251,
			 1252, 1270, 1276, 1280, 1297, 1293, 1325, 1342, 1343, 1352,
			 1353, 1375, 1377, 1405, 1414, 5214,  829, 5214,  406, 5214, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 5214, 1149,  644,  661,  790,  881,  433, 5214,  779,  455,
			  416,  774,  483,  751, 5214,  260, 1492, 5214, 5214,  739,
			  546, 5214,  676,  689,  702,  750,  730, 1414,  166,  881,
			  729,  889,  293, 1573,  435, 5214, 5214, 5214,  721, 1434,
			  703,  700,  699,  698, 1019,  692, 5214, 1441, 1461, 1450,
			  659,  609, 1467, 1531, 1486, 1548,  781, 1492, 5214,  641,
			 1386, 1241, 1166, 1323, 1589, 1605, 1609, 1173, 1639, 1643,
			 1202,  281, 1665, 1670, 1614, 1679, 1690, 1695, 1720, 5214,
			 1537, 1739, 1770, 1782, 1792, 1804, 1708, 1803, 1813, 1839,
			 1750, 1843, 1850, 1855, 1861, 1870, 1877, 1888, 1895,  622,

			 1904, 1929, 1917,  341, 5214,  360, 1952, 1953, 1697,  583,
			 1954, 1975, 1973, 1977, 1999, 2008, 2010, 2032, 2038, 2048,
			 2057, 2076, 2114, 2094, 1746, 2092, 2136, 2146, 2147, 2167,
			 2169, 2173, 2191, 2200, 1030,  330, 1079,  916, 1314, 1359,
			 1433,  434, 5214,  574,  733, 5214, 2202, 2227,  624, 1905,
			 5214,  597,  746,  619, 5214, 5214, 2241, 5214, 5214, 5214,
			 5214, 5214,  638, 2050, 2215, 2247,  547, 2255, 2265, 2282,
			 2271, 2288, 2294, 2310, 2316, 2322,  576, 2344, 2350, 2355,
			 2359, 1995, 1963, 2364, 2156, 2369, 2375,  842, 2381, 2389,
			 2408, 2418, 2427, 2433, 2448, 2505, 2439, 2468, 2497, 2529, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 2521, 2557, 2573, 2589, 2449, 2455,  938, 2509, 2599, 2611,
			 2562, 2615, 1007,  834, 2633, 2642,  926, 2658, 2671,  102,
			  521, 2694, 2700, 2700, 2698, 2723, 2725, 2727, 2752, 2780,
			 2758, 2786, 2796, 2797, 2807, 2845, 2821, 2830, 2867, 2877,
			 2883, 2894, 2896, 2900, 2922, 5214, 2354,  563, 2940,  636,
			 5214, 2958, 2964, 2970, 2976,  563, 2982, 2988, 2999, 3005,
			 3011, 3027,  131, 3039, 3051,  844,  270, 2633, 2681, 3049,
			 2753, 3061, 3074, 3079, 2643, 3088,  552, 3083, 3093, 2816,
			 3113, 3118, 3126, 5214, 3146, 2920, 3162, 3223, 3179, 1081,
			 3169, 3187, 3135, 2050, 5214, 3204, 5214,  924, 3252, 5214,

			 3259, 5214,  430,  502, 3141, 3248,  354, 3288, 3283, 3249,
			 3311, 3317, 3321, 3250, 3337, 3346, 3356, 3377,  545, 3400,
			 3395, 3386, 3430, 3432, 3436, 3458, 3485,  500, 3458,  426,
			 3496, 3502, 3511, 3523, 3534,  498, 3540, 3551, 3557, 1759,
			 5214, 3563, 3327, 2854, 3585, 3131, 3590, 3596, 3207, 3600,
			 1181, 3604, 3615, 3629, 3642, 3633, 3665, 5214,  521, 3212,
			 3667, 3687, 2126, 2325, 3709,  755, 3723, 3733,  509, 3687,
			 3756, 3696,  510, 3646, 3757, 3758, 3767, 3780, 3789, 3802,
			 3820, 3822, 3821, 3843, 3866, 3876, 3880, 3898, 3891, 3916,
			  509, 3927, 3942, 3948,  911, 3954,  443, 3960, 3966, 3972, yy_Dummy>>,
			1, 200, 400)
		end

	yy_base_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 3790, 3998, 3366, 4006, 3469, 1293, 3915, 4002, 4010, 4014,
			 4018, 1575, 4028, 4043,  441,  428,    0,  399,  559, 4052,
			 4047, 4066, 4089, 4091, 4093, 4107, 4109, 4113, 4130, 4131,
			 4153, 4159, 4163, 4169, 4208, 4214, 4220, 4231, 1074, 4237,
			 2838, 4243, 4149, 4265, 4270, 5214, 4276, 1690, 4280, 4076,
			 1859, 2162,  380, 1628, 4296,  368, 4318, 4320, 4338, 4337,
			 4351, 4169,  302, 4344, 4387, 4395, 4401, 4407, 4413, 5214,
			 4419, 4284, 4443, 4193, 4449, 5214, 4372, 2389, 2412, 4377,
			  265, 4439, 4461, 4462, 4463, 4472, 4482, 4482,  122, 4501,
			 4523, 4509, 4545, 4550, 4554,  488, 5214, 5214, 4542, 4564,

			 4568, 4585,  573, 4590, 4589, 4594, 4601, 2077, 2445,  643,
			 4621, 4643, 4644, 4653, 4659, 4665, 4663, 2878, 3312, 4680,
			 5214, 4702, 1017, 4689,  143,  137, 4704, 4711, 4715, 3406,
			 5214, 4741, 2358, 2531, 4746, 4750, 4765, 4630, 2775, 2841,
			 4787, 4791, 1164,  132,  131, 4797, 4803, 3716, 5214, 2434,
			 2569, 4809, 4815, 3423, 3583, 4823, 4045, 5214, 5214, 4829,
			 4835, 4841, 5214, 4847, 4858, 4864, 4870, 5214, 4909, 4925,
			 4941, 4957, 4973, 4989,  132,  300, 3849, 4198, 5005, 4286,
			 5021, 5037, 5053, 5069, 5085, 4387, 5101, 1703, 5117, 2484,
			 2617,  127, 5133, 5149, 3399, 5165, 5181, 3028, 5197,  128, yy_Dummy>>,
			1, 200, 600)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 800)
			yy_def_template_1 (an_array)
			yy_def_template_2 (an_array)
			yy_def_template_3 (an_array)
			yy_def_template_4 (an_array)
			an_array.area.fill_with (767, 741, 766)
			an_array.put (0, 767)
			an_array.area.fill_with (767, 768, 800)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			    0,  767,    1,  768,  768,  769,  769,  770,  770,  771,
			  771,  767,   11,  767,  767,  767,  767,  767,  772,  767,
			  773,  774,  767,  767,  767,  767,  767,  767,  775,  767,
			  767,  767,  767,  767,  767,  767,  767,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  777,  767,  767,  778,  779,  779,  779,
			  779,  779,  779,  779,  779,  779,  779,  779,  779,   64,
			  779,  779,  767,  767,  767,  780,  767,  767,  767,  780,
			  780,  780,  780,  780,  781,  767,  782,  781,  783,  784,
			  767,  767,  767,  767,  767,  767,  767,  767,  767,  785,

			  767,  767,  785,  785,  767,  767,  767,  772,  767,  786,
			  786,  786,  787,  788,  767,  767,  767,  789,  767,  767,
			  767,  767,  767,  767,  767,  767,  776,  790,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  767,   48,  776,  776,
			  776,  776,   48,  776,  776,  776,  776,  776,  776,  777,
			  777,  777,  777,  778,  767,  767,  767,  791,  779,  779,
			  779,  779,  767,  779,  779,  779,  779,  779,  779,  779,
			  779,  779,  779,  779,  779,  779,  779,  779,  779,  779,
			  779,  779,  779,  779,  779,  767,  780,  767,  767,  767, yy_Dummy>>,
			1, 200, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  767,  780,  780,  780,  780,  780,  781,  767,  792,  781,
			  782,  793,  782,  792,  767,  783,  784,  767,  767,  216,
			  794,  767,  767,  767,  767,  767,  795,  767,  785,  785,
			  767,  767,  767,  796,  767,  767,  767,  767,  767,  767,
			  767,  767,  767,  767,  767,  767,  767,  767,  767,  767,
			  775,  767,  767,  767,  767,  767,  767,  767,  767,  790,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  776,
			  776,  767,  776,  776,  776,  776,  776,  776,  776,  767,
			  767,  776,  776,  776,  776,  776,  150,  150,  150,  776,
			  776,  776,  776,  776,  776,  776,  776,  776,  776,  767,

			  777,  777,  777,  777,  767,  797,  779,  779,  779,  767,
			  779,  779,  779,  779,  779,  779,  779,  779,  779,  779,
			  779,  779,  779,  779,  779,  779,  779,  779,  779,  779,
			  779,  779,  779,  779,  780,  780,  780,  780,  780,  780,
			  780,  792,  767,  793,  794,  767,  767,  767,  798,  798,
			  767,  798,  798,  798,  767,  767,  767,  767,  767,  767,
			  767,  767,  767,  767,  767,  767,  767,  767,  767,  767,
			  767,  767,  767,  767,  767,  767,  790,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  776,  767,  776,  776,
			  776,  776,  776,  776,  767,  147,  150,  395,  395,  776, yy_Dummy>>,
			1, 200, 200)
		end

	yy_def_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  147,  767,  399,  399,  776,  776,  767,  776,  776,  776,
			  776,  776,  767,  777,  777,  777,  777,  777,  777,  777,
			  767,  779,  779,  767,  779,  779,  779,  779,  779,  779,
			  779,  779,  779,  779,  779,  767,  779,  779,  779,  779,
			  779,  779,  779,  779,  779,  767,  767,  767,  767,  767,
			  767,  767,  767,  767,  767,  767,  767,  767,  767,  767,
			  767,  767,  767,  767,  767,  767,  767,  776,  776,  776,
			  776,  776,  776,  776,  776,  776,  767,  776,  776,  776,
			  776,  776,  776,  767,  399,  776,  767,  399,  487,  767,
			  776,  776,  776,  767,  767,  777,  767,  767,  777,  767,

			  777,  767,  777,  767,  779,  779,  767,  767,  779,  779,
			  779,  779,  779,  779,  779,  779,  779,  779,  767,  767,
			  779,  779,  779,  779,  779,  779,  767,  767,  767,  767,
			  767,  767,  767,  767,  767,  767,  767,  767,  767,  767,
			  767,  767,  776,  776,  776,  776,  776,  776,  776,  776,
			  767,  776,  776,  776,  776,  776,  399,  767,  767,  776,
			  776,  776,  767,  767,  777,  767,  777,  777,  777,  767,
			  779,  767,  767,  779,  779,  779,  779,  779,  779,  779,
			  779,  779,  779,  779,  779,  779,  779,  779,  767,  767,
			  767,  767,  767,  767,  767,  767,  767,  767,  767,  767, yy_Dummy>>,
			1, 200, 400)
		end

	yy_def_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  776,  776,  776,  776,  776,  767,  776,  776,  776,  776,
			  776,  767,  776,  776,  767,  767,  799,  767,  767,  767,
			  779,  767,  779,  779,  779,  779,  779,  779,  779,  779,
			  779,  779,  779,  767,  767,  767,  767,  767,  767,  767,
			  767,  767,  776,  776,  776,  767,  776,  767,  776,  776,
			  767,  767,  800,  767,  767,  767,  779,  779,  779,  779,
			  779,  779,  767,  767,  767,  767,  767,  767,  767,  767,
			  767,  776,  776,  776,  776,  767,  776,  767,  767,  767,
			  767,  767,  779,  779,  779,  779,  779,  767,  767,  767,
			  767,  767,  776,  776,  776,  767,  767,  767,  767,  779,

			  779,  779,  767,  767,  776,  776,  776,  767,  767,  767,
			  767,  779,  779,  779,  767,  767,  776,  767,  767,  767,
			  767,  779,  767,  776,  767,  767,  767,  779,  767,  767,
			  767,  776,  767,  767,  779,  767,  767,  776,  767,  767,
			  779, yy_Dummy>>,
			1, 141, 600)
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
			create an_array.make_filled (0, 0, 767)
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
			    0,    0,    0,    0,    0,  112,  112,    0,    0,    0,
			    0,    0,    0,  143,  141,    1,    2,   15,  125,   18,
			  141,   16,   17,    7,    6,   13,    5,   11,    8,  117,
			  117,   14,   12,   28,   10,   29,   19,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,   90,  105,
			  105,  105,  105,   21,   30,   22,    9,  108,  108,  108,
			  108,  108,  108,  108,  108,  108,  108,  108,  108,  108,
			  108,  108,   23,   20,   24,  129,  130,  131,  132,  129,
			  129,  129,  129,  129,  112,  115,  142,  112,  142,  142,
			  104,   72,   72,   68,   69,   72,   72,   72,   81,   81,

			   77,   78,   81,   81,    1,    2,   27,  125,  124,  139,
			  139,  139,    0,    3,   32,  123,   31,  109,    0,    0,
			  117,    0,  117,   26,   25,    0,  105,   99,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,   39,    0,  105,   98,   98,
			   89,   98,   98,  105,  105,  105,  105,  105,  105,    0,
			    0,    0,    0,    0,  116,    0,    0,    0,  108,  108,
			  108,  108,    0,  108,  108,  108,  108,  108,  108,  108,
			  108,  108,  108,  108,  108,  108,  108,  108,   39,  108,
			  108,  108,  108,  108,  108,  111,  129,  131,  130,  127, yy_Dummy>>,
			1, 200, 0)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			  126,  128,  129,  129,  129,  129,  112,  115,    0,  112,
			    0,    0,    0,  113,  114,    0,    0,  104,  102,  102,
			    0,  103,    0,    0,    0,   68,    0,    0,    0,    0,
			   77,    0,   76,    0,   75,   80,  139,  133,  139,  139,
			  139,  139,  139,  139,    0,    4,   33,  123,    0,    0,
			    0,    0,    0,  119,    0,  117,    0,    0,   99,    0,
			  105,  105,   38,  105,  105,  105,  105,  105,  105,  105,
			  105,    0,  105,  105,  105,  105,   41,  105,  105,   97,
			    0,   90,   91,   90,   90,   90,   98,  105,   98,   98,
			   98,  105,  105,  105,  105,  105,  105,   40,  105,    0,

			    0,    0,    0,    0,  107,  110,  108,  108,   38,    0,
			  108,  108,  108,  108,  108,  108,  108,  108,  108,  108,
			  108,   62,   62,  108,   41,  108,  108,  108,  108,  108,
			  108,  108,   40,  108,  129,  129,  129,  129,  129,  129,
			  129,    0,  113,  114,    0,   70,    0,    0,    0,    0,
			   79,   76,   75,   80,  137,  140,  140,  138,  134,  135,
			  136,  100,  123,    0,  123,    0,    0,    0,  119,    0,
			    0,    0,  122,  117,    0,    0,  106,  105,  105,  105,
			  105,  105,   37,  105,  105,  105,  105,    0,  105,  105,
			  105,  105,  105,  105,    0,  105,   89,  105,  105,  105, yy_Dummy>>,
			1, 200, 200)
		end

	yy_accept_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			  105,    0,   89,   89,   89,   36,    0,   43,  105,  105,
			  105,  105,   74,    0,    0,    0,    0,    0,    0,    0,
			    0,  108,  108,    0,  108,  108,  108,   37,  108,  108,
			  108,  108,  108,  108,  108,    0,  108,  108,  108,   36,
			   43,  108,  108,  108,  108,  114,    0,   67,    0,   66,
			   71,  123,    0,    0,    0,  118,  119,    0,  120,    0,
			  122,    0,    0,    0,  117,   86,    0,   57,  105,  105,
			  105,  105,  105,  105,   44,  105,    0,  105,  105,   35,
			  105,  105,  105,   91,   91,   90,    0,  105,  105,    0,
			  105,  105,  105,    0,   73,    0,   64,    0,    0,   61,

			    0,   60,    0,    0,   57,  108,    0,    0,  108,  108,
			  108,  108,  108,   44,  108,  108,  108,   35,   62,   62,
			  108,  108,  108,  108,  108,  108,    0,  123,    0,    0,
			    0,  119,  120,    0,    0,  122,    0,    0,    0,    0,
			   86,    0,  105,   58,  105,   59,  105,  105,   46,  105,
			    0,  105,  105,  105,  105,  105,  105,   89,    0,   52,
			  105,  105,    0,    0,    0,    0,    0,    0,    0,    0,
			  108,    0,    0,   58,  108,   59,  108,  108,   46,  108,
			  108,  108,  108,  108,  108,   52,  108,  108,    0,    0,
			  109,    0,  120,    0,  123,    0,   88,    0,    0,  121, yy_Dummy>>,
			1, 200, 400)
		end

	yy_accept_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			  105,  105,   56,  105,   45,    0,   42,   55,   34,  105,
			   50,    0,  105,  105,    0,    0,    0,    0,    0,    0,
			  108,    0,  108,   56,  108,   45,   42,   55,   34,  108,
			   50,  108,  108,    0,    0,  120,    0,    0,    0,    0,
			   85,  121,  105,  105,  105,   94,  105,    0,  105,   53,
			    0,    0,    0,   65,    0,  110,  108,  108,  108,  108,
			  108,   53,  122,    0,  122,    0,    0,    0,    0,   85,
			  121,  105,  105,   47,  105,   93,   51,    0,    0,    0,
			    0,    0,  108,  108,   47,  108,   51,  122,   87,    0,
			   85,  121,  105,  105,  105,   92,   92,  101,    0,  108,

			  108,  108,    0,    0,  105,   49,   48,    0,    0,    0,
			    0,  108,   49,   48,    0,    0,  105,    0,    0,    0,
			   63,  108,   84,  105,    0,    0,    0,  108,    0,    0,
			   84,  105,    0,    0,  108,    0,    0,   54,    0,    0,
			   54,    0,   83,    0,    0,    0,    0,    0,   83,    0,
			    0,    0,    0,    0,    0,    0,   82,   95,   96,    0,
			    0,    0,   82,    0,   82,    0,    0,    0, yy_Dummy>>,
			1, 168, 600)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 5214
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 767
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 768
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

	yyNb_rules: INTEGER = 142
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 143
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
