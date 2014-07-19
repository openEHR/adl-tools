note
	component:   "openEHR ADL Tools"
	description: "Scanner for CADL syntax items"
	keywords:    "CADL, archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class CADL_15_SCANNER

inherit
	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton,
			output as print_out
		end

	CADL_15_TOKENS
		export
			{NONE} all
		end

	ADL_15_TERM_CODE_TOOLS
		export
			{NONE} all
		end

	UT_CHARACTER_CODES
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
--|#line 69 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 69")
end
-- Ignore separators
else
--|#line 70 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 70")
end
in_lineno := in_lineno + text_count
end
else
--|#line 75 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 75")
end
-- Ignore comments
end
else
if yy_act = 4 then
--|#line 76 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 76")
end
in_lineno := in_lineno + 1
else
--|#line 80 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 80")
end
last_token := Minus_code
end
end
else
if yy_act <= 7 then
if yy_act = 6 then
--|#line 81 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 81")
end
last_token := Plus_code
else
--|#line 82 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 82")
end
last_token := Star_code
end
else
if yy_act = 8 then
--|#line 83 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 83")
end
last_token := Slash_code
else
--|#line 84 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 84")
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
--|#line 85 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 85")
end
last_token := Equal_code
else
--|#line 86 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 86")
end
last_token := Dot_code
end
else
--|#line 87 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 87")
end
last_token := Semicolon_code
end
else
if yy_act = 13 then
--|#line 88 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 88")
end
last_token := Comma_code
else
--|#line 89 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 89")
end
last_token := Colon_code
end
end
else
if yy_act <= 16 then
if yy_act = 15 then
--|#line 90 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 90")
end
last_token := Exclamation_code
else
--|#line 91 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 91")
end
last_token := Left_parenthesis_code
end
else
if yy_act = 17 then
--|#line 92 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 92")
end
last_token := Right_parenthesis_code
else
--|#line 93 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 93")
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
--|#line 95 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 95")
end
last_token := Question_mark_code
else
--|#line 97 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 97")
end
last_token := SYM_INTERVAL_DELIM
end
else
--|#line 99 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 99")
end
last_token := Left_bracket_code
end
else
if yy_act = 22 then
--|#line 100 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 100")
end
last_token := Right_bracket_code
else
--|#line 102 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 102")
end
last_token := SYM_START_CBLOCK
end
end
else
if yy_act <= 25 then
if yy_act = 24 then
--|#line 103 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 103")
end
last_token := SYM_END_CBLOCK
else
--|#line 105 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 105")
end
last_token := SYM_GE
end
else
if yy_act = 26 then
--|#line 106 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 106")
end
last_token := SYM_LE
else
--|#line 107 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 107")
end
last_token := SYM_NE
end
end
end
else
if yy_act <= 31 then
if yy_act <= 29 then
if yy_act = 28 then
--|#line 109 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 109")
end
last_token := SYM_LT
else
--|#line 110 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 110")
end
last_token := SYM_GT
end
else
if yy_act = 30 then
--|#line 112 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 112")
end
last_token := SYM_MODULO
else
--|#line 113 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 113")
end
last_token := SYM_DIV
end
end
else
if yy_act <= 33 then
if yy_act = 32 then
--|#line 115 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 115")
end
last_token := SYM_ELLIPSIS
else
--|#line 116 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 116")
end
last_token := SYM_LIST_CONTINUE
end
else
if yy_act = 34 then
--|#line 120 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 120")
end
last_token := SYM_MATCHES
else
--|#line 122 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 122")
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
--|#line 126 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 126")
end
last_token := SYM_THEN
else
--|#line 128 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 128")
end
last_token := SYM_ELSE
end
else
--|#line 130 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 130")
end
last_token := SYM_AND
end
else
if yy_act = 39 then
--|#line 132 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 132")
end
last_token := SYM_OR
else
--|#line 134 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 134")
end
last_token := SYM_XOR
end
end
else
if yy_act <= 42 then
if yy_act = 41 then
--|#line 136 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 136")
end
last_token := SYM_NOT
else
--|#line 138 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 138")
end
last_token := SYM_IMPLIES
end
else
if yy_act = 43 then
--|#line 140 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 140")
end
last_token := SYM_TRUE
else
--|#line 142 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 142")
end
last_token := SYM_FALSE
end
end
end
else
if yy_act <= 48 then
if yy_act <= 46 then
if yy_act = 45 then
--|#line 144 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 144")
end
last_token := SYM_FORALL
else
--|#line 146 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 146")
end
last_token := SYM_EXISTS
end
else
if yy_act = 47 then
--|#line 150 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 150")
end
last_token := SYM_EXISTENCE
else
--|#line 152 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 152")
end
last_token := SYM_OCCURRENCES
end
end
else
if yy_act <= 50 then
if yy_act = 49 then
--|#line 154 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 154")
end
last_token := SYM_CARDINALITY
else
--|#line 156 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 156")
end
last_token := SYM_ORDERED
end
else
if yy_act = 51 then
--|#line 158 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 158")
end
last_token := SYM_UNORDERED
else
--|#line 160 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 160")
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
--|#line 162 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 162")
end
last_token := SYM_USE_NODE
else
--|#line 164 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 164")
end
last_token := SYM_USE_ARCHETYPE
end
else
--|#line 166 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 166")
end
last_token := SYM_ALLOW_ARCHETYPE
end
else
if yy_act = 56 then
--|#line 168 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 168")
end
last_token := SYM_INCLUDE
else
--|#line 170 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 170")
end
last_token := SYM_EXCLUDE
end
end
else
if yy_act <= 59 then
if yy_act = 58 then
--|#line 172 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 172")
end
last_token := SYM_AFTER
else
--|#line 174 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 174")
end
last_token := SYM_BEFORE
end
else
if yy_act = 60 then
--|#line 176 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 176")
end
last_token := SYM_CLOSED
else
--|#line 179 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 179")
end

			last_token := V_URI
			last_string_value := text
		
end
end
end
else
if yy_act <= 65 then
if yy_act <= 63 then
if yy_act = 62 then
--|#line 185 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 185")
end

		last_token := V_ROOT_ID_CODE
		last_string_value := text_substring (2, text_count - 1)
	
else
--|#line 191 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 191")
end

		last_token := V_ID_CODE
		last_string_value := text_substring (2, text_count - 1)
	
end
else
if yy_act = 64 then
--|#line 197 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 197")
end

		last_token := V_ID_CODE_STR
		last_string_value := text
	
else
--|#line 203 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 203")
end

		last_token := V_VALUE_SET_REF
		last_string_value := text_substring (2, text_count - 1)
	
end
end
else
if yy_act <= 67 then
if yy_act = 66 then
--|#line 209 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 209")
end

		last_token := V_VALUE_DEF
		last_string_value := text_substring (2, text_count - 1)
	
else
--|#line 215 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 215")
end

		last_token := V_VALUE_SET_REF_ASSUMED
		last_string_value := text_substring (2, text_count - 1)
		last_string_value.prune_all(' ')
		last_string_value.prune_all('%T')
	
end
else
if yy_act = 68 then
--|#line 237 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 237")
end

		set_start_condition (IN_EXPANDED_VALUE_SET_DEF)
		create last_term_constraint_parse_structure_value.make
		str_ := text_substring (2, text_count)
		last_term_constraint_parse_structure_value.set_terminology_id (str_.substring (1, str_.index_of (':', 1)-1))
		is_assumed_code := False
	
else
--|#line 246 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 246")
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
end
end
end
end
else
if yy_act <= 103 then
if yy_act <= 86 then
if yy_act <= 78 then
if yy_act <= 74 then
if yy_act <= 72 then
if yy_act <= 71 then
if yy_act = 70 then
--|#line 261 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 261")
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
--|#line 276 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 276")
end
in_lineno := in_lineno + text_count
end
else
--|#line 279 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 279")
end
in_lineno := in_lineno + 1
end
else
if yy_act = 73 then
--|#line 281 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 281")
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
	
else
--|#line 304 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 304")
end
	-- Catch-all rules (no backing up)
			last_token := ERR_VALUE_SET_DEF
			set_start_condition (INITIAL)
	
end
end
else
if yy_act <= 76 then
if yy_act = 75 then
--|#line 314 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 314")
end

		last_token := ERR_VALUE_SET_MISSING_CODES
		err_str := text
	
else
--|#line 330 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 330")
end

		set_start_condition (IN_EXTERNAL_VALUE_SET_DEF)
		create last_term_constraint_parse_structure_value.make
		str_ := text_substring (2, text_count)
		last_term_constraint_parse_structure_value.set_terminology_id (str_.substring (1, str_.index_of (':', 1)-1))
		is_assumed_code := False
	
end
else
if yy_act = 77 then
--|#line 339 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 339")
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
--|#line 354 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 354")
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
end
else
if yy_act <= 82 then
if yy_act <= 80 then
if yy_act = 79 then
--|#line 369 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 369")
end
in_lineno := in_lineno + text_count
else
--|#line 372 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 372")
end
in_lineno := in_lineno + 1
end
else
if yy_act = 81 then
--|#line 374 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 374")
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
--|#line 397 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 397")
end
	-- Catch-all rules (no backing up)
			last_token := ERR_VALUE_SET_DEF
			set_start_condition (INITIAL)
	
end
end
else
if yy_act <= 84 then
if yy_act = 83 then
--|#line 409 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 409")
end

		last_token := V_EXT_REF
		last_string_value := text_substring (2, text_count - 1)
		last_string_value.prune_all(' ')
		last_string_value.prune_all('%T')
	
else
--|#line 418 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 418")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
if yy_act = 85 then
--|#line 419 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 419")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 420 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 420")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
end
end
end
else
if yy_act <= 95 then
if yy_act <= 91 then
if yy_act <= 89 then
if yy_act <= 88 then
if yy_act = 87 then
--|#line 427 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 427")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 428 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 428")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
else
--|#line 435 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 435")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
else
if yy_act = 90 then
--|#line 436 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 436")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
--|#line 443 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 443")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
end
else
if yy_act <= 93 then
if yy_act = 92 then
--|#line 444 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 444")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 456 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 456")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
if yy_act = 94 then
--|#line 466 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 466")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text_substring(2, text_count)
			
else
--|#line 471 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 471")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
end
end
end
else
if yy_act <= 99 then
if yy_act <= 97 then
if yy_act = 96 then
--|#line 481 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 481")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
				last_string_value.put('T', last_string_value.index_of(' ', 1))
			
else
--|#line 487 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 487")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
if yy_act = 98 then
--|#line 498 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 498")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN_ERR
				unread_character(last_string_value.item(last_string_value.count)) -- put back the last character 
				last_string_value := text
			
else
--|#line 507 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 507")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
end
end
else
if yy_act <= 101 then
if yy_act = 100 then
--|#line 513 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 513")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 519 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 519")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
end
else
if yy_act = 102 then
--|#line 525 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 525")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
else
--|#line 532 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 532")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
end
end
end
end
end
else
if yy_act <= 120 then
if yy_act <= 112 then
if yy_act <= 108 then
if yy_act <= 106 then
if yy_act <= 105 then
if yy_act = 104 then
--|#line 538 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 538")
end
		-- matches an absolute path string with segments of form "/attr_name" or "/attr_name[id-code]"
			last_token := V_ABS_PATH
			last_string_value := text
		
else
--|#line 544 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 544")
end
		-- matches a relative path string with segments of form "/attr_name" or "/attr_name[id-code]"
			last_token := V_REL_PATH
			last_string_value := text
		
end
else
--|#line 550 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 550")
end

			last_token := SYM_START_CBLOCK
			set_start_condition (IN_REGEXP1)
			in_buffer.append_character ('/')
		
end
else
if yy_act = 107 then
--|#line 557 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 557")
end
 		-- match segment consisting of non / or [
				in_buffer.append_string (text)
	
else
--|#line 561 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 561")
end
 		-- match [] segment
				in_buffer.append_string (text)
	
end
end
else
if yy_act <= 110 then
if yy_act = 109 then
--|#line 565 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 565")
end
 		-- match segment ending in quoted slashes '\/'
				in_buffer.append_string (text)
	
else
--|#line 569 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 569")
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
if yy_act = 111 then
--|#line 581 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 581")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
else
--|#line 588 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 588")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
end
end
else
if yy_act <= 116 then
if yy_act <= 114 then
if yy_act = 113 then
--|#line 593 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 593")
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
--|#line 608 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 608")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
end
else
if yy_act = 115 then
--|#line 609 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 609")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
else
--|#line 613 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 613")
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
if yy_act <= 118 then
if yy_act = 117 then
--|#line 614 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 614")
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
--|#line 615 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 615")
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
if yy_act = 119 then
--|#line 635 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 635")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 640 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 640")
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
if yy_act <= 129 then
if yy_act <= 125 then
if yy_act <= 123 then
if yy_act <= 122 then
if yy_act = 121 then
--|#line 648 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 648")
end
in_buffer.append_character ('\')
else
--|#line 650 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 650")
end
in_buffer.append_character ('"')
end
else
--|#line 652 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 652")
end

				in_buffer.append_string (text)
	
end
else
if yy_act = 124 then
--|#line 656 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 656")
end
in_buffer.append_string (text)
else
--|#line 658 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 658")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
end
else
if yy_act <= 127 then
if yy_act = 126 then
--|#line 663 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 663")
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
--|#line 674 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 674")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
else
if yy_act = 128 then
--|#line 682 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 682")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
--|#line 684 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 684")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
end
end
else
if yy_act <= 133 then
if yy_act <= 131 then
if yy_act = 130 then
--|#line 685 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 685")
end
last_token := V_CHARACTER; last_character_value := '%R'
else
--|#line 686 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 686")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 132 then
--|#line 687 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 687")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 688 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 688")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 135 then
if yy_act = 134 then
--|#line 690 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 690")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 691 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 691")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 136 then
--|#line 695 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 695")
end
;
else
--|#line 0 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 0")
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
when 0, 2 then
--|#line 694 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 694")
end
terminate
when 1 then
--|#line 675 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 675")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
when 3 then
--|#line 305 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 305")
end
	-- Catch-all rules (no backing up)
			last_token := ERR_VALUE_SET_DEF
			set_start_condition (INITIAL)
	
when 4 then
--|#line 398 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 398")
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
			create an_array.make_filled (0, 0, 5052)
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
			    0,   12,   13,   14,   13,   13,   15,   16,   17,   18,
			   19,   20,   21,   22,   23,   24,   25,   26,   27,   27,
			   27,   28,   28,   28,   29,   30,   31,   32,   33,   34,
			   35,   36,   37,   38,   39,   40,   38,   41,   42,   38,
			   43,   44,   45,   46,   38,   38,   38,   47,   48,   38,
			   49,   50,   38,   51,   52,   53,   54,   12,   55,   56,
			   57,   58,   59,   60,   58,   61,   62,   58,   63,   64,
			   65,   58,   58,   58,   58,   66,   67,   58,   58,   68,
			   69,   70,   71,   72,   12,   12,   12,   12,   12,   12,
			   12,   12,   12,   74,   83,  102,   83,   75,   74,  117,

			   87,   88,   75,   87,   87,   88,   96,   87,   96,   96,
			  128,  117,  117,   89,  215,  122,  105,   89,  106,  106,
			  106,  106,  106,  106,  123,  117,  117,  117,  117,  132,
			   84,   85,   84,   85,  178,  118,  121,  148,  128,  119,
			  103,  120,  145,  122,   76,  150,  179,  146,  182,   76,
			  136,  117,  123,  151,  152,  236,   90,  132,  236,  117,
			   90,  216,  180,  118,  121,  236,  148,  119,  236,  120,
			  145,  277,  424,  117,  181,  146,  183,  990,   77,   78,
			   79,   80,   81,   77,   78,   79,   80,   81,   91,   92,
			   93,   91,   92,   91,   91,   91,   91,   91,   91,   91,

			   91,   91,   94,   95,   91,   95,   95,   95,   95,   95,
			   95,   91,   91,   91,   91,   91,   91,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   91,   91,   91,   91,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,   91,   91,   91,
			  109,  980,  110,  303,  111,  111,  111,  111,  111,  111,
			  109,  117,  110,  117,  113,  113,  113,  113,  113,  113,

			  117,  117,  117,  117,  124,  117,  126,  129,  130,  134,
			  191,  143,  193,  131,  207,  125,  991,  133,  127,  144,
			  306,  147,  135,  112,  214,  213,  214,  214,   96,  213,
			   96,   96,  124,  112,  126,  129,  130,  134,  192,  143,
			  194,  131,  208,  981,  125,  133,  127,  144,  209,  147,
			  135,  136,  137,  137,  137,  137,  137,  137,  168,  158,
			  117,  170,  213,  158,  174,  158,  158,  138,  203,  195,
			  171,  199,  158,  204,  139,  175,  433,  210,  117,  200,
			  223,  140,  196,  141,  227,  142,  169,  164,  257,  172,
			  230,  164,  176,  164,  164,  138,  205,  197,  173,  201,

			  164,  206,  139,  155,  177,  218,  155,  202,  220,  220,
			  198,  156,  141,  958,  142,  155,  224,  225,  155,  117,
			  213,  228,  229,  156,  258,  213,  224,  225,  213,  817,
			  157,  158,  158,  158,  158,  158,  158,  159,  117,  272,
			  217,  217,  217,  158,  158,  158,  158,  158,  160,  158,
			  158,  158,  161,  158,  162,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  163,  272,  818,  280,
			  158,  164,  164,  164,  164,  164,  165,  164,  164,  164,
			  166,  164,  167,  164,  164,  164,  164,  164,  164,  164,
			  164,  164,  164,  164,  155,  954,  117,  155,  219,  219,

			  219,  117,  156,  221,  221,  221,  117,  959,  218,  157,
			  158,  158,  158,  158,  158,  158,  159,  213,  297,  267,
			  270,  955,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  163,  297,  267,  270,  158,
			  164,  164,  164,  164,  164,  164,  164,  164,  164,  164,
			  164,  164,  164,  164,  164,  164,  164,  164,  164,  164,
			  164,  164,  164,  184,  185,  231,  951,  239,  231,  186,
			  239,  239,  949,  303,  239,  214,  311,  214,  214,  240,
			  241,  613,  613,  240,  187,  217,  217,  217,  117,  246,

			  242,  188,  189,  117,  242,  268,  117,  190,  247,  247,
			  247,  247,  247,  247,  311,  269,  254,  254,  254,  254,
			  254,  254,  259,  259,  259,  259,  259,  259,  302,  307,
			  243,  232,  255,  268,  243,  260,  260,  260,  260,  260,
			  260,  948,  117,  269,  248,  264,  264,  264,  264,  264,
			  264,  261,  117,  901,  902,  256,  117,  302,  271,  249,
			  255,  117,  109,  250,  110,  251,  262,  262,  262,  262,
			  262,  262,  263,  266,  275,  276,  109,  117,  110,  261,
			  262,  262,  262,  262,  262,  262,  271,  117,  117,  117,
			  117,  117,  937,  273,  278,  279,  117,  283,  561,  274,

			  117,  266,  275,  276,  136,  112,  562,  284, 1001,  281,
			  117,  282,  363,  117,  303,  301,  117,  136,  300,  112,
			  136,  273,  278,  279,  286,  283,  117,  274,  298,  117,
			  312,  287,  299,  138,  290,  284,  138,  281,  116,  282,
			  288,  363,  289,  301,  313,  311,  300,  290,  312,  141,
			  290,  240,  286,  303,  240,  117,  298,  646,  312,  287,
			  299,  138,  313,  295,  138,  117,  296,  319,  319,  288,
			  321,  289,  313,  316,  223,  322,  317,  136,  141,  136,
			  291,  291,  291,  291,  291,  291,  117,  321,  117,  304,
			  318,  295,  322,  138,  296,  319,  320,  325,  321,  292,

			  139,  325,  293,  322,  305,  331,  326,  290,  294,  141,
			  224,  225,  327,  326,  332,  323,  331,  332,  336,  327,
			  324,  138,  337,  242,  494,  325,  242,  292,  139,  328,
			  293,  336,  337,  331,  326,  343,  294,  343,  141, 1001,
			  327,  329,  332,  345,  333,  334,  336,  330,  560,  561,
			  337,  339,  340,  340,  340,  340,  340,  562,  918,  341,
			  342,  372,  213,  343,  252,  344,  252,  252,  345,  347,
			  348,  345,  347,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  346,  347,  348,  348,

			  349,  351,  352,  351,  352,  355,  357,  355,  357,  356,
			  361,  356,  361,  363,  213,  230,  227,  213,  374,  231,
			  213,  450,  231,  381,  380,  496,  381,  350,  496,  351,
			  352,  353,  354,  355,  357,  358,  360,  356,  361,  359,
			  362,  916,  364,  365,  366,  367,  368,  369,  617,  450,
			  117,  224,  225,  228,  229,  228,  229,  376,  377,  377,
			  377,  377,  377,  413,  239,  239,  117,  239,  239,  391,
			  391,  391,  391,  391,  391,  232,  240,  240,  385,  386,
			  386,  386,  386,  386,  386,  255,  411,  242,  242,  112,
			  911,  413,  217,  217,  217,  370,  370,  370,  371,  371, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  371,  394,  394,  394,  394,  394,  394,  603,  256,  382,
			  380,  910,  382,  255,  411,  604,  117,  243,  243,  378,
			  379,  380,  378,  379,  378,  378,  378,  378,  378,  378,
			  378,  378,  381,  241,  241,  378,  241,  241,  241,  241,
			  241,  241,  378,  382,  378,  378,  378,  378,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  378,  378,  383,  378,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  378,

			  378,  378,  378,  378,  378,  378,  378,  378,  378,  378,
			  378,  392,  117,  392,  904,  905,  393,  393,  393,  393,
			  393,  393,  397,  397,  397,  397,  397,  397,  398,  398,
			  398,  398,  398,  398,  404,  404,  404,  404,  404,  117,
			  401,  898,  401,  416,  399,  402,  402,  402,  402,  402,
			  402,  109,  418,  110,  117,  403,  403,  403,  403,  403,
			  403,  405,  405,  405,  405,  405,  405,  400,  117,  117,
			  408,  117,  399,  117,  117,  117,  407,  117,  410,  417,
			  418,  412,  117,  117,  117,  409,  117,  419,  421,  117,
			  417,  117,  136,  303,  112,  414,  420,  415,  408,  423,

			  417,  117,  720,  451,  407,  422,  410,  117,  541,  412,
			  721,  492,  117,  409,  888,  419,  421,  437,  417,  117,
			  618,  294,  432,  414,  420,  415,  775,  423,  117,  447,
			  435,  451,  868,  422,  425,  425,  425,  425,  425,  425,
			  492,  157,  117,  426,  426,  426,  426,  426,  426,  294,
			  432,  117,  427,  427,  427,  427,  427,  427,  435,  428,
			  117,  428, 1001,  424,  116,  116,  116,  116,  116,  116,
			  136,  117,  424,  117,  869,  117,  117,  448,  719,  117,
			  492,  424,  429,  434,  450,  430,  451,  456,  456,  458,
			  436,  431,  459,  293,  458,  459,  462,  463,  464,  294,

			  462,  438,  440,  441,  441,  441,  441,  441,  303,  493,
			  429,  434,  454,  430,  455,  456,  457,  458,  436,  431,
			  459,  293,  460,  461,  462,  463,  464,  294,  465,  463,
			  438,  442,  443,  443,  443,  443,  443,  303,  444,  445,
			  446,  446,  446,  446,  303,  464,  468,  468,  310,  471,
			  472,  473,  471,  213,  472,  477,  477,  466,  479,  474,
			  417,  340,  340,  340,  340,  340,  340,  480,  479,  480,
			  483,  417,  484,  467,  468,  470,  483,  471,  472,  473,
			  475,  417,  476,  477,  478,  484,  479,  487,  488,  487,
			  488,  213,  558,  213,  776,  480,  481,  482,  483,  417,

			  484,  213,  777,  303,  485,  213,  117,  495,  213,  117,
			  495,  498,  117,  486,  498,  487,  488,  490,  491,  496,
			  558,  497,  495,  379,  380,  495,  379,  529,  517,  518,
			  498,  217,  217,  217,  496,  381,  497,  555,  377,  377,
			  377,  377,  377,  377,  862,  498,  382,  385,  386,  386,
			  386,  386,  386,  386,  255,  529,  517,  861,  518,  855,
			  499,  393,  393,  393,  393,  393,  393,  925,  926,  219,
			  219,  219,  220,  220,  850,  499,  383,  256,  117,  221,
			  221,  221,  255,  217,  217,  217,  217,  217,  217,  500,
			  500,  500,  500,  500,  500,  502,  502,  502,  502,  502,

			  502,  505,  505,  505,  505,  505,  505,  506,  506,  506,
			  506,  506,  506,  509,  509,  509,  509,  509,  509,  559,
			  117,  558,  567,  399,  507,  609,  507,  602,  501,  508,
			  508,  508,  508,  508,  508,  402,  402,  402,  402,  402,
			  402,  117,  550,  560,  439,  550,  400,  439,  559,  565,
			  567,  399,  510,  510,  510,  510,  510,  510,  512,  513,
			  519,  514,  514,  514,  514,  514,  514,  515,  515,  515,
			  515,  515,  515,  516,  516,  516,  516,  516,  516,  117,
			  117,  117,  117,  117,  526,  117,  117,  521,  519,  525,
			  524,  511,  520,  117,  117,  526,  117,  542,  527,  117,

			  117,  559,  157,  522,  523,  526,  538,  530,  822,  567,
			  569,  570,  531,  821,  569,  521,  528,  525,  524,  532,
			  520,  549,  117,  526,  549,  536,  527,  570,  901,  902,
			  566,  522,  523,  550,  538,  530,  536,  568,  569,  570,
			  531,  117,  571,  781,  528,  778,  536,  532,  291,  291,
			  291,  291,  291,  291,  772,  572,  117,  425,  425,  425,
			  425,  425,  425,  537,  536,  117,  426,  426,  426,  426,
			  426,  426,  286,  427,  427,  427,  427,  427,  427,  533,
			  533,  533,  533,  533,  533,  771,  547,  117,  288,  602,
			  603,  537,  117,  573,  303,  287,  539,  116,  604,  574,

			  286,  534,  534,  534,  534,  534,  534,  540,  573,  117,
			  535,  535,  535,  535,  535,  535,  543,  288,  117,  543,
			  117,  573,  117,  287,  539,  548,  116,  574,  543,  117,
			  544,  543,  560,  653,  574,  540,  575,  577,  303,  545,
			  543,  562,  544,  543,  441,  441,  441,  441,  441,  441,
			  303,  545,  547,  117,  443,  443,  443,  443,  443,  443,
			  303,  549,  576,  545,  549,  577,  578,  117,  549,  546,
			  758,  549,  654,  550,  577,  551,  580,  581,  257,  582,
			  550,  546,  553,  303,  446,  446,  446,  446,  446,  446,
			  303,  548,  560,  561,  578,  563,  564,  564,  564,  564,

			  564,  562,  579,  750,  580,  581,  549,  582,  580,  549,
			  581,  587,  587,  589,  552,  590,  589,  590,  550,  593,
			  551,  554,  446,  446,  446,  446,  446,  446,  303,  583,
			  584,  584,  584,  584,  584,  594,  585,  595,  586,  587,
			  588,  589,  593,  590,  591,  592,  594,  593,  596,  495,
			  117,  117,  495,  376,  599,  599,  599,  599,  599,  552,
			  614,  496,  614,  594,  157,  595,  725,  637,  655,  630,
			  597,  615,  498,  718,  598,  716,  596,  600,  600,  600,
			  600,  600,  600,  601,  601,  601,  601,  601,  601,  391,
			  391,  391,  391,  391,  391,  637,  655,  630,  117,  616,

			  602,  603,  499,  605,  606,  606,  606,  606,  606,  604,
			  607,  607,  607,  607,  607,  607,  501,  508,  508,  508,
			  508,  508,  508,  710,  655,  117,  399,  608,  608,  608,
			  608,  608,  608,  610,  610,  610,  610,  610,  610,  611,
			  611,  611,  611,  611,  611,  117,  657,  117,  545,  400,
			  117,  545,  656,  117,  399,  612,  612,  612,  612,  612,
			  612,  619,  620,  625,  117,  117,  609,  607,  607,  607,
			  607,  607,  607,  627,  657,  904,  905,  513,  511,  514,
			  514,  514,  514,  514,  514,  117,  117,  117,  658,  619,
			  620,  625,  621,  622,  117,  623,  117,  117,  117,  657, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  117,  627,  629,  628,  641,  631,  634,  624,  533,  533,
			  533,  533,  533,  533,  934,  935,  658,  633,  511,  636,
			  621,  622,  778,  623,  117,  778,  687,  659,  633,  501,
			  629,  628,  635,  631,  634,  624,  632,  428,  633,  428,
			  474,  534,  534,  534,  534,  534,  534,  636,  658,  117,
			  535,  535,  535,  535,  535,  535,  633,  638,  661,  662,
			  635,  661,  667,  430,  632,  668,  669,  668,  638,  431,
			  669,  663,  116,  925,  926,  542,  660,  649,  639,  440,
			  640,  640,  640,  640,  640,  303,  661,  662,  652,  664,
			  667,  430,  649,  668,  669,  670,  638,  431,  671,  663,

			  116,  442,  642,  642,  642,  642,  642,  303,  444,  644,
			  644,  644,  644,  644,  303,  444,  645,  644,  644,  644,
			  644,  303,  560,  653,  662,  564,  564,  564,  564,  564,
			  564,  562,  672,  672,  875,  474,  663,  584,  584,  584,
			  584,  584,  584,  674,  675,  674,  675,  678,  679,  680,
			  681,  678,  665,  679,  684,  684,  684,  684,  684,  684,
			  672,  673,  654,  875,  666,  692,  692,  692,  692,  692,
			  692,  674,  675,  676,  677,  678,  679,  680,  681,  682,
			  495,  683,  117,  495,  602,  688,  607,  607,  607,  607,
			  607,  607,  496,  604,  497,  703,  599,  599,  599,  599,

			  599,  599,  690,  498,  602,  688,  648,  606,  606,  606,
			  606,  606,  606,  604,  691,  691,  691,  691,  691,  691,
			  881,  881,  881,  703,  689,  697,  697,  697,  697,  697,
			  690,  117,  117,  499,  693,  693,  693,  693,  693,  693,
			  934,  935,  626,  117,  689,  694,  694,  694,  694,  694,
			  694,  701,  705,  609,  695,  695,  695,  695,  695,  695,
			  696,  696,  696,  696,  696,  696,  698,  698,  698,  698,
			  698,  698,  117,  117,  117,  704,  699,  700,  117,  701,
			  705,  117,  261,  117,  117,  724,  706,  117,  117,  702,
			  117,  708,  704,  117,  709,  713,  704,  714,  729,  712,

			  715,  707,  117,  711,  699,  700,  719,  720,  714,  729,
			  261,  715,  731,  724,  706,  721,  653,  702,  715,  708,
			  704,  715,  709,  713,  562,  109,  729,  712,  541,  707,
			  543,  711,  541,  543,  557,  732,  714,  730,  731,  715,
			  731,  117,  117,  117,  544,  117,  640,  640,  640,  640,
			  640,  640,  303,  545,  547,  654,  642,  642,  642,  642,
			  642,  642,  303,  732,  732,  406,  733,  504,  549,  719,
			  720,  549,  722,  723,  723,  723,  723,  723,  721,  380,
			  550,  380,  551,  546,  644,  644,  644,  644,  644,  644,
			  303,  549,  734,  548,  549,  727,  728,  728,  728,  728,

			  728,  735,  736,  550,  737,  553,  736,  644,  644,  644,
			  644,  644,  644,  303,  737,  740,  373,  740,  742,  743,
			  742,  552,  743,  746,  747,  748,  746,  489,  489,  735,
			  736,  474,  737,  469,  738,  600,  600,  600,  600,  600,
			  600,  469,  739,  740,  554,  741,  742,  743,  744,  453,
			  745,  746,  747,  748,  749,  752,  753,  753,  753,  753,
			  753,  754,  757,  754,  449,  439,  755,  755,  755,  755,
			  755,  755,  755,  755,  755,  755,  755,  755,  756,  756,
			  756,  756,  756,  756,  117,  400,  802,  802,  802,  802,
			  757,  611,  611,  611,  611,  611,  611,  759,  759,  759,

			  759,  759,  759,  760,  760,  760,  760,  760,  760,  117,
			  117,  609,  761,  761,  761,  761,  761,  761,  117,  765,
			  117,  767,  763,  117,  764,  117,  117,  784,  757,  762,
			  787,  768,  787,  770,  117,  766,  765,  769,  767,  117,
			  765,  789,  767,  773,  774,  774,  774,  774,  774,  406,
			  763,  400,  764,  775,  776,  784,  757,  762,  787,  768,
			  788,  770,  777,  766,  765,  769,  767,  719,  782,  789,
			  789,  791,  791,  793,  719,  782,  721,  723,  723,  723,
			  723,  723,  723,  721,  653,  794,  728,  728,  728,  728,
			  728,  728,  562,  795,  793,  688,  875,  117,  790,  791,

			  792,  793,  396,  604, 1001,  810,  390,  783,  389,  804,
			  805,  804,  805,  794,  783,  755,  755,  755,  755,  755,
			  755,  795,  796,  654,  688,  876,  753,  753,  753,  753,
			  753,  753,  604,  810,  689,  755,  755,  755,  755,  755,
			  755,  799,  799,  799,  799,  799,  799,  800,  806,  800,
			  117,  826,  801,  801,  801,  801,  801,  801,  986,  987,
			  986,  987,  809,  689,  803,  803,  803,  803,  803,  803,
			  807,  807,  807,  807,  807,  807,  117,  117,  812,  826,
			  117,  117,  808,  811,  815,  388,  757,  813,  815,  814,
			  809,  828,  816,  828,  830,  812,  816,  988,  830,  812,

			  920,  920,  920,  920,  920,  815,  387,  384,  238,  400,
			  808,  811,  832,  816,  757,  813,  815,  814,  832,  828,
			  834,  829,  830,  812,  816,  817,  831,  774,  774,  774,
			  774,  774,  774,  824,  825,  825,  825,  825,  825,  835,
			  832,  834,  375,  233,  235,  372,  833,  373,  834,  801,
			  801,  801,  801,  801,  801,  838,  838,  838,  838,  838,
			  838,  372,  213,  338,  818,  338,  335,  835,  277,  836,
			  839,  839,  839,  839,  839,  839,  616,  616,  616,  616,
			  616,  616,  840,  840,  840,  840,  840,  840,  841,  841,
			  841,  841,  841,  841,  609,  842,  842,  842,  842,  842,

			  842,  117,  117,  117,  847,  117,  848,  854,  847,  856,
			  848,  757,  843,  845,  773,  849,  849,  849,  849,  849,
			  782,  315,  310,  844,  846,  847,  856,  848,  721,  858,
			  858,  308,  860,  154,  400,  854,  847,  856,  848,  757,
			  843,  845,  782,  303,  825,  825,  825,  825,  825,  825,
			  721,  844,  846,  117,  857,  117,  285,  858,  859,  783,
			  860,  799,  799,  799,  799,  799,  799,  863,  863,  863,
			  863,  863,  863,  117,  117,  866,  873,  804,  865,  804,
			  117,  783,  841,  841,  841,  841,  841,  841,  842,  842,
			  842,  842,  842,  842,  117,  877,  877,  879,  867,  253,

			  609,  883,  864,  866,  873,  900,  817,  865,  849,  849,
			  849,  849,  849,  849,  117,  889,  806,  882,  882,  882,
			  882,  882,  882,  877,  878,  885,  879,  867,  886,  883,
			  864,  884,  891,  885,  900,  903,  886,  893,  893,  893,
			  893,  893,  893,  889,  117,  818,  885,  914,  117,  886,
			  806,  806,  806,  806,  806,  806,  895,  896,  897,  884,
			  891,  885,  922,  903,  886,  896,  897,  252,  117,  894,
			  906,  927,  906,  922,  117,  914,  245,  100,  896,  897,
			   97,  907,  921,  922,  895,  909,  919,  919,  919,  919,
			  919,  919,  238,  896,  897,  923,  235,  234,  894,  927, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  233,  922,  213,  211,  154,  117,  923,  115,  114,  908,
			  921,  107,  104,  909,  100,   98,  923,  928,  928,  928,
			  928,  928,  928,  929,  929,  929,  929,  929,  929,  962,
			  962,  962,  962,  962,  923,  930,  930,  930,  930,  930,
			  930,  931,  931,  931,  931,  931,  931,  932,  933,  944,
			  944,  944,  944,  944,  944,   97, 1001, 1001,  932,  933,
			  945, 1001,  945, 1001, 1001, 1001, 1001, 1001,  932,  933,
			  938,  946,  939,  940, 1001,  928,  928,  928,  928,  928,
			  928, 1001, 1001, 1001, 1001, 1001,  932,  933,  941, 1001,
			  942,  943, 1001,  929,  929,  929,  929,  929,  929,  947,

			  952,  952,  952,  952,  952,  952,  953,  953,  953,  953,
			  953,  953,  654,  956,  956,  956,  956,  956,  956,  957,
			  957,  957,  957,  957,  957, 1001, 1001, 1001, 1001, 1001,
			  689,  960,  960,  960,  960,  960,  960,  908,  908,  908,
			  908,  908,  908,  961,  961,  961,  961,  961,  961,  963,
			  964,  965,  965,  965,  965,  965,  965,  953,  953,  953,
			  953,  953,  953, 1001,  954, 1001,  963,  964, 1001, 1001,
			  963,  964, 1001,  966, 1001,  967,  968,  958,  952,  952,
			  952,  952,  952,  952,  953,  953,  953,  953,  953,  953,
			 1001, 1001, 1001, 1001,  963,  964,  938, 1001,  939,  969,

			 1001,  956,  956,  956,  956,  956,  956,  957,  957,  957,
			  957,  957,  957, 1001, 1001,  783, 1001, 1001,  973, 1001,
			  974,  654,  957,  957,  957,  957,  957,  957,  971,  971,
			  971,  971,  971,  971, 1001,  973, 1001,  974,  654,  973,
			  941,  974,  942,  970,  689,  960,  960,  960,  960,  960,
			  960,  972,  972,  972,  972,  972,  972,  979,  979,  979,
			  979,  979,  979,  973,  975,  974,  976,  977, 1001,  965,
			  965,  965,  965,  965,  965,  982,  982,  982,  982,  982,
			  982, 1001,  689,  983,  983,  983,  983,  983,  983,  984,
			  984,  984,  984,  984,  984,  985,  985,  985,  985,  985,

			  985, 1001, 1001, 1001, 1001, 1001,  978,  989,  989,  989,
			  989,  989,  989, 1001, 1001,  980,  992,  992,  992,  992,
			  992,  992,  979,  979,  979,  979,  979,  979,  979,  979,
			  979,  979,  979,  979,  966, 1001,  967,  993, 1001,  982,
			  982,  982,  982,  982,  982,  938, 1001,  939, 1001, 1001,
			  983,  983,  983,  983,  983,  983, 1001, 1001, 1001,  783,
			 1001,  941, 1001,  942, 1001,  990,  984,  984,  984,  984,
			  984,  984, 1001, 1001, 1001, 1001,  783,  947,  947,  947,
			  947,  947,  947, 1001, 1001, 1001, 1001,  654,  994,  994,
			  994,  994,  994,  994,  995,  995,  995,  995,  995,  995,

			 1001, 1001, 1001,  689,  989,  989,  989,  989,  989,  989,
			  989,  989,  989,  989,  989,  989,  975, 1001,  976,  996,
			 1001,  992,  992,  992,  992,  992,  992,  997,  997,  997,
			  997,  997,  997,  998,  998,  998,  998,  998,  998, 1001,
			  986,  978,  986, 1001, 1001,  995,  995,  995,  995,  995,
			  995,  999,  999,  999,  999,  999,  999,  966,  978,  967,
			 1001, 1001,  997,  997,  997,  997,  997,  997, 1000, 1000,
			 1000, 1000, 1000, 1000, 1001,  975, 1001,  976, 1001,  988,
			  999,  999,  999,  999,  999,  999,  988,  988,  988,  988,
			  988,  988,  108, 1001, 1001, 1001, 1001, 1001, 1001,  783,

			 1001, 1001, 1001, 1001,  108,  108,  108,  108,  108,  108,
			  108,  108,  108, 1001, 1001, 1001, 1001,  978,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,

			   86,   86,   86,   86,   86,   86,   86,   86,   99,   99,
			 1001,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99, 1001,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,  101,  101,
			 1001,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  116,  116,
			  116,  116, 1001,  116,  116,  116,  116, 1001, 1001,  116,
			  116,  116,  116,  116,  116,  116,  116,  116,  149,  149,
			 1001,  149, 1001,  149,  149,  149, 1001, 1001,  149,  149,

			  149,  149, 1001, 1001,  149,  149,  149,  149,  149,  149,
			  149,  149,  149,  153,  153, 1001,  153,  153,  153,  153,
			  153,  153,  153,  153,  153,  153,  153,  153,  153,  153,
			  153,  153,  153,  153,  153,  153,  153,  153,  153,  153,
			  153,  153,  153,  212,  212, 1001,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,
			  212,  212,  212, 1001,  212,  212,  212,  212,  212,  212,
			  212,  212,  212,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,

			  222,  222,  222,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  237, 1001,  237, 1001, 1001, 1001, 1001,
			  237, 1001,  237,  237,  237, 1001, 1001,  237,  237,  237,
			  237, 1001, 1001,  237,  237,  237,  237,  237,  237,  237,
			  237,  237,  244,  244, 1001,  244,  244,  244,  244,  244,
			  244,  244,  244,  244,  244,  244,  244,  244,  244,  244,
			  244,  244,  244,  244,  244,  244,  244,  244,  244,  244,
			  244,  244,  104,  104,  104,  104,  104,  104,  104,  104,

			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  108,  108,  108,  108, 1001, 1001,  108,  108,
			  108,  108,  108, 1001,  108,  108,  108,  108,  108,  108,
			  108,  108,  108,  265, 1001, 1001,  265,  265,  265,  265,
			  265,  265,  265,  265,  265, 1001, 1001,  265,  265,  265,
			  265,  265,  265,  265,  265,  265,  309,  309,  309,  309,
			  309,  309,  309,  309,  309,  314,  314,  314,  314, 1001,
			 1001,  314,  314,  314,  314,  314,  314,  314,  314,  314,
			  224,  224,  224,  224,  224,  224,  224,  224,  224, 1001, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  395,  395,  395,  395, 1001, 1001,  395,  395,  395,  395,
			  395,  395,  395,  395,  395,  309,  309,  309,  309, 1001,

			 1001,  309,  309,  309,  309,  309, 1001,  309,  309,  309,
			  309,  309,  309,  309,  309,  309,  452,  452,  452, 1001,
			 1001,  452,  452,  452,  452, 1001, 1001,  452,  452,  452,
			  452,  452,  452,  452,  452,  452,  378,  378,  378,  378,
			  378,  378,  378,  378,  378,  378,  378,  378,  378,  378,
			  378,  378,  378,  378,  378,  378,  378,  378,  378,  378,
			  378,  378,  378,  378,  378,  378,  503,  503,  503, 1001,
			 1001,  503,  503,  503,  503, 1001, 1001,  503,  503,  503,
			  503,  503,  503,  503,  503,  503,  556,  556,  556,  556,
			 1001, 1001,  556,  556,  556,  556,  556,  556,  556,  556,

			  556,  449,  449,  449, 1001, 1001,  449,  449,  449,  449,
			  449,  449,  449,  449, 1001, 1001,  449,  449,  449,  449,
			 1001, 1001,  449,  449,  449,  449,  449,  449,  449,  449,
			  449,  643, 1001,  643, 1001, 1001, 1001, 1001, 1001, 1001,
			 1001, 1001, 1001, 1001, 1001,  643,  643,  643,  643, 1001,
			 1001,  643,  643,  643,  643,  643,  643,  643,  643,  643,
			  647,  647,  647, 1001, 1001,  647,  647,  647,  647, 1001,
			 1001,  647,  647,  647,  647,  647,  647,  647,  647,  647,
			  650,  650,  650, 1001, 1001,  650,  650,  650,  650, 1001,
			 1001,  650,  650,  650,  650,  650,  650,  650,  650,  650,

			  651,  651,  651, 1001, 1001,  651,  651,  651,  651, 1001,
			 1001,  651,  651,  651,  651,  651,  651,  651,  651,  651,
			  685,  685,  685, 1001, 1001,  685,  685,  685,  685, 1001,
			 1001,  685,  685,  685,  685,  685,  685,  685,  685,  685,
			  686,  686,  686, 1001, 1001,  686,  686,  686,  686, 1001,
			 1001,  686,  686,  686,  686,  686,  686,  686,  686,  686,
			  717,  717,  717, 1001, 1001,  717,  717,  717,  717, 1001,
			 1001,  717,  717,  717,  717,  717,  717,  717,  717,  717,
			  726,  726,  726,  726, 1001, 1001,  726,  726,  726,  726,
			  726,  726,  726,  726,  726,  751,  751,  751,  751, 1001,

			 1001,  751,  751,  751,  751,  751,  751,  751,  751,  751,
			  779,  779,  779, 1001, 1001,  779,  779,  779,  779, 1001,
			 1001,  779,  779,  779,  779,  779,  779,  779,  779,  779,
			  780,  780,  780, 1001, 1001,  780,  780,  780,  780, 1001,
			 1001,  780,  780,  780,  780,  780,  780,  780,  780,  780,
			  785,  785,  785,  785, 1001, 1001,  785,  785,  785,  785,
			  785,  785,  785,  785,  785,  786,  786,  786, 1001, 1001,
			  786,  786,  786,  786, 1001, 1001,  786,  786,  786,  786,
			  786,  786,  786,  786,  786,  797,  797,  797,  797, 1001,
			 1001,  797,  797,  797,  797,  797,  797,  797,  797,  797,

			  798,  798,  798, 1001, 1001,  798,  798,  798,  798, 1001,
			 1001,  798,  798,  798,  798,  798,  798,  798,  798,  798,
			  819,  819,  819, 1001, 1001,  819,  819,  819,  819, 1001,
			 1001,  819,  819,  819,  819,  819,  819,  819,  819,  819,
			  820,  820,  820, 1001, 1001,  820,  820,  820,  820, 1001,
			 1001,  820,  820,  820,  820,  820,  820,  820,  820,  820,
			  823,  823,  823,  823, 1001, 1001,  823,  823,  823,  823,
			  823,  823,  823,  823,  823,  827,  827,  827, 1001, 1001,
			  827,  827,  827,  827, 1001, 1001,  827,  827,  827,  827,
			  827,  827,  827,  827,  827,  837,  837,  837, 1001, 1001,

			  837,  837,  837,  837, 1001, 1001,  837,  837,  837,  837,
			  837,  837,  837,  837,  837,  851,  851,  851,  851, 1001,
			 1001,  851,  851,  851,  851,  851,  851,  851,  851,  851,
			  852,  852,  852,  852, 1001, 1001,  852,  852,  852,  852,
			  852,  852,  852,  852,  852,  853,  853,  853, 1001, 1001,
			  853,  853,  853,  853, 1001, 1001,  853,  853,  853,  853,
			  853,  853,  853,  853,  853,  870,  870,  870,  870, 1001,
			 1001,  870,  870,  870,  870,  870,  870,  870,  870,  870,
			  871,  871,  871, 1001, 1001,  871,  871,  871,  871, 1001,
			 1001,  871,  871,  871,  871,  871,  871,  871,  871,  871,

			  872,  872,  872, 1001, 1001,  872,  872,  872,  872, 1001,
			 1001,  872,  872,  872,  872,  872,  872,  872,  872,  872,
			  874,  874,  874,  874, 1001, 1001,  874,  874,  874,  874,
			  874,  874,  874,  874,  874,  880,  880,  880,  880, 1001,
			 1001,  880,  880,  880,  880,  880,  880,  880,  880,  880,
			  887,  887,  887, 1001, 1001,  887,  887,  887,  887, 1001,
			 1001,  887,  887,  887,  887,  887,  887,  887,  887,  887,
			  890,  890,  890, 1001, 1001,  890,  890,  890,  890, 1001,
			 1001,  890,  890,  890,  890,  890,  890,  890,  890,  890,
			  892,  892,  892, 1001, 1001,  892,  892,  892,  892, 1001,

			 1001,  892,  892,  892,  892,  892,  892,  892,  892,  892,
			  899,  899,  899,  899, 1001, 1001,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  912,  912,  912,  912, 1001,
			 1001,  912,  912,  912,  912,  912,  912,  912,  912,  912,
			  913,  913,  913, 1001, 1001,  913,  913,  913,  913, 1001,
			 1001,  913,  913,  913,  913,  913,  913,  913,  913,  913,
			  915,  915,  915, 1001, 1001,  915,  915,  915,  915, 1001,
			 1001,  915,  915,  915,  915,  915,  915,  915,  915,  915,
			  917,  917,  917, 1001, 1001,  917,  917,  917,  917, 1001,
			 1001,  917,  917,  917,  917,  917,  917,  917,  917,  917,

			  924,  924,  924, 1001, 1001,  924,  924,  924,  924, 1001,
			 1001,  924,  924,  924,  924,  924,  924,  924,  924,  924,
			  936,  936,  936, 1001, 1001,  936,  936,  936,  936, 1001,
			 1001,  936,  936,  936,  936,  936,  936,  936,  936,  936,
			  950,  950,  950, 1001, 1001,  950,  950,  950,  950, 1001,
			 1001,  950,  950,  950,  950,  950,  950,  950,  950,  950,
			   11, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001,
			 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001,
			 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001,
			 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001,
			 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001,
			 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001,
			 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001,
			 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001,
			 1001, 1001, 1001, yy_Dummy>>,
			1, 53, 5000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 5052)
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
			    1,    1,    1,    3,    5,   18,    6,    3,    4,   41,

			    7,    7,    4,    7,    8,    8,   13,    8,   13,   13,
			   41,   37,   50,    7,   76,   37,   25,    8,   25,   25,
			   25,   25,   25,   25,   37,   43,   35,   48,   36,   43,
			    5,    5,    6,    6,   60,   35,   36,   50,   41,   35,
			   18,   35,   48,   37,    3,   51,   60,   48,   61,    4,
			  294,  286,   37,   51,   51,   92,    7,   43,   92,  294,
			    8,   76,   60,   35,   36,  236,   50,   35,  236,   35,
			   48,  128,  286,  128,   60,   48,   61,  991,    3,    3,
			    3,    3,    3,    4,    4,    4,    4,    4,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,

			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			   27,  981,   27,  151,   27,   27,   27,   27,   27,   27,
			   28,   39,   28,   42,   28,   28,   28,   28,   28,   28,

			   47,   44,   40,   45,   39,   49,   40,   42,   42,   45,
			   63,   47,   64,   42,   68,   39,  976,   44,   40,   47,
			  151,   49,   45,   27,   74,   78,   74,   74,   96,   80,
			   96,   96,   39,   28,   40,   42,   42,   45,   63,   47,
			   64,   42,   68,  967,   39,   44,   40,   47,   69,   49,
			   45,   46,   46,   46,   46,   46,   46,   46,   56,   56,
			   46,   57,   77,   56,   59,   56,   57,   46,   67,   65,
			   57,   66,   57,   67,   46,   59,  296,   69,  296,   66,
			   82,   46,   65,   46,   84,   46,   56,   56,  108,   57,
			   85,   56,   59,   56,   57,   46,   67,   65,   57,   66,

			   57,   67,   46,  155,   59,   78,  155,   66,   80,   80,
			   65,  155,   46,  959,   46,   55,   82,   82,   55,  124,
			   79,   84,   84,   55,  108,   81,   85,   85,  366,  773,
			   55,   55,   55,   55,   55,   55,   55,   55,  131,  124,
			   77,   77,   77,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,  124,  773,  131,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   58,  955,  144,   58,   79,   79,

			   79,  122,   58,   81,   81,   81,  119,  942,  366,   58,
			   58,   58,   58,   58,   58,   58,   58,  218,  144,  119,
			  122,  939,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,  144,  119,  122,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   62,   62,   87,  935,   94,   87,   62,
			   94,   95,  933,  152,   95,  214,  160,  214,  214,   94,
			   94,  512,  512,   95,   62,  218,  218,  218,  120,  103,

			   94,   62,   62,  148,   95,  120,  121,   62,  103,  103,
			  103,  103,  103,  103,  160,  121,  106,  106,  106,  106,
			  106,  106,  109,  109,  109,  109,  109,  109,  148,  152,
			   94,   87,  106,  120,   95,  110,  110,  110,  110,  110,
			  110,  932,  123,  121,  103,  112,  112,  112,  112,  112,
			  112,  110,  118,  890,  890,  106,  127,  148,  123,  103,
			  106,  126,  111,  103,  111,  103,  111,  111,  111,  111,
			  111,  111,  111,  118,  126,  127,  113,  129,  113,  110,
			  113,  113,  113,  113,  113,  113,  123,  125,  132,  130,
			  133,  134,  926,  125,  129,  130,  147,  134,  651,  125,

			  135,  118,  126,  127,  138,  111,  651,  135,  137,  132,
			  146,  133,  209,  138,  555,  147,  145,  139,  146,  113,
			  141,  125,  129,  130,  137,  134,  139,  125,  145,  141,
			  161,  137,  145,  139,  138,  135,  141,  132,  137,  133,
			  137,  209,  137,  147,  162,  165,  146,  139,  166,  139,
			  141,  240,  137,  150,  240,  143,  145,  555,  161,  137,
			  145,  139,  167,  143,  141,  921,  143,  168,  169,  137,
			  170,  137,  162,  165,  222,  171,  166,  142,  139,  140,
			  140,  140,  140,  140,  140,  140,  142,  172,  140,  150,
			  167,  143,  173,  142,  143,  168,  169,  174,  170,  140,

			  142,  176,  140,  171,  150,  178,  175,  142,  140,  142,
			  222,  222,  175,  177,  179,  172,  180,  181,  184,  177,
			  173,  142,  185,  242,  372,  174,  242,  140,  142,  176,
			  140,  188,  189,  178,  175,  191,  140,  192,  142,  158,
			  175,  177,  179,  193,  180,  181,  184,  177,  452,  452,
			  185,  187,  187,  187,  187,  187,  187,  452,  905,  188,
			  189,  372,  217,  191,  252,  192,  252,  252,  194,  195,
			  196,  193,  197,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  194,  195,  196,  198,

			  197,  199,  200,  201,  202,  203,  204,  205,  206,  203,
			  207,  205,  208,  210,  219,  225,  226,  220,  228,  231,
			  221,  311,  231,  381,  381,  496,  381,  198,  496,  199,
			  200,  201,  202,  203,  204,  205,  206,  203,  207,  205,
			  208,  902,  210,  217,  217,  217,  217,  217,  516,  311,
			  273,  225,  225,  226,  226,  228,  228,  235,  235,  235,
			  235,  235,  235,  273,  237,  239,  271,  237,  239,  254,
			  254,  254,  254,  254,  254,  231,  237,  239,  247,  247,
			  247,  247,  247,  247,  247,  254,  271,  237,  239,  516,
			  897,  273,  219,  219,  219,  220,  220,  220,  221,  221, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  221,  256,  256,  256,  256,  256,  256,  686,  254,  382,
			  382,  896,  382,  254,  271,  686,  895,  237,  239,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,

			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  255,  276,  255,  892,  892,  255,  255,  255,  255,
			  255,  255,  259,  259,  259,  259,  259,  259,  260,  260,
			  260,  260,  260,  260,  263,  263,  263,  263,  263,  278,
			  261,  887,  261,  276,  260,  261,  261,  261,  261,  261,
			  261,  262,  278,  262,  267,  262,  262,  262,  262,  262,
			  262,  264,  264,  264,  264,  264,  264,  260,  266,  269,
			  267,  270,  260,  272,  279,  274,  266,  275,  270,  277,
			  278,  272,  281,  283,  280,  269,  300,  279,  281,  518,
			  277,  284,  293,  307,  262,  274,  280,  275,  267,  284,

			  277,  293,  780,  312,  266,  283,  270,  295,  438,  272,
			  780,  363,  298,  269,  872,  279,  281,  300,  277,  438,
			  518,  293,  295,  274,  280,  275,  871,  284,  866,  307,
			  298,  312,  847,  283,  287,  287,  287,  287,  287,  287,
			  363,  309,  287,  288,  288,  288,  288,  288,  288,  293,
			  295,  288,  289,  289,  289,  289,  289,  289,  298,  291,
			  289,  291,  291,  287,  290,  290,  290,  290,  290,  290,
			  292,  299,  288,  865,  847,  297,  302,  309,  853,  292,
			  364,  289,  291,  297,  316,  291,  317,  319,  320,  321,
			  299,  291,  322,  292,  323,  324,  325,  326,  327,  292,

			  328,  302,  304,  304,  304,  304,  304,  304,  304,  364,
			  291,  297,  316,  291,  317,  319,  320,  321,  299,  291,
			  322,  292,  323,  324,  325,  326,  327,  292,  328,  329,
			  302,  305,  305,  305,  305,  305,  305,  305,  306,  306,
			  306,  306,  306,  306,  306,  330,  331,  333,  335,  336,
			  337,  338,  341,  365,  342,  343,  344,  329,  347,  340,
			  335,  340,  340,  340,  340,  340,  340,  348,  349,  350,
			  351,  335,  352,  330,  331,  333,  353,  336,  337,  338,
			  341,  335,  342,  343,  344,  354,  347,  355,  356,  358,
			  359,  367,  450,  368,  820,  348,  349,  350,  351,  335,

			  352,  369,  820,  447,  353,  370,  408,  376,  371,  407,
			  376,  498,  420,  354,  498,  355,  356,  358,  359,  376,
			  450,  376,  377,  379,  379,  377,  379,  420,  407,  408,
			  376,  365,  365,  365,  377,  379,  377,  447,  377,  377,
			  377,  377,  377,  377,  839,  377,  379,  386,  386,  386,
			  386,  386,  386,  386,  391,  420,  407,  837,  408,  827,
			  376,  392,  392,  392,  392,  392,  392,  913,  913,  367,
			  367,  367,  368,  368,  819,  377,  379,  391,  813,  369,
			  369,  369,  391,  370,  370,  370,  371,  371,  371,  393,
			  393,  393,  393,  393,  393,  394,  394,  394,  394,  394,

			  394,  397,  397,  397,  397,  397,  397,  398,  398,  398,
			  398,  398,  398,  400,  400,  400,  400,  400,  400,  451,
			  810,  454,  456,  398,  399,  799,  399,  798,  393,  399,
			  399,  399,  399,  399,  399,  401,  401,  401,  401,  401,
			  401,  409,  550,  786,  439,  550,  398,  439,  451,  454,
			  456,  398,  402,  402,  402,  402,  402,  402,  403,  403,
			  409,  403,  403,  403,  403,  403,  403,  404,  404,  404,
			  404,  404,  404,  405,  405,  405,  405,  405,  405,  411,
			  410,  413,  415,  414,  417,  416,  418,  411,  409,  416,
			  415,  402,  410,  422,  419,  417,  421,  439,  418,  436,

			  423,  455,  783,  413,  414,  417,  436,  421,  779,  457,
			  458,  459,  422,  777,  460,  411,  419,  416,  415,  423,
			  410,  549,  770,  417,  549,  433,  418,  461,  915,  915,
			  455,  413,  414,  549,  436,  421,  433,  457,  458,  459,
			  422,  435,  460,  721,  419,  718,  433,  423,  424,  424,
			  424,  424,  424,  424,  715,  461,  424,  425,  425,  425,
			  425,  425,  425,  435,  433,  425,  426,  426,  426,  426,
			  426,  426,  425,  427,  427,  427,  427,  427,  427,  428,
			  428,  428,  428,  428,  428,  714,  442,  709,  425,  503,
			  503,  435,  437,  463,  442,  427,  437,  426,  503,  464,

			  425,  429,  429,  429,  429,  429,  429,  437,  466,  429,
			  430,  430,  430,  430,  430,  430,  440,  425,  430,  440,
			  707,  463,  706,  427,  437,  442,  426,  464,  441,  705,
			  440,  441,  563,  563,  467,  437,  466,  468,  440,  440,
			  543,  563,  441,  543,  441,  441,  441,  441,  441,  441,
			  441,  441,  443,  703,  443,  443,  443,  443,  443,  443,
			  443,  444,  467,  543,  444,  468,  469,  701,  445,  440,
			  695,  445,  563,  444,  470,  444,  471,  472,  689,  473,
			  445,  441,  445,  444,  445,  445,  445,  445,  445,  445,
			  445,  443,  453,  453,  469,  453,  453,  453,  453,  453,

			  453,  453,  470,  685,  471,  472,  446,  473,  475,  446,
			  476,  477,  478,  479,  444,  480,  481,  482,  446,  487,
			  446,  445,  446,  446,  446,  446,  446,  446,  446,  474,
			  474,  474,  474,  474,  474,  488,  475,  489,  476,  477,
			  478,  479,  490,  480,  481,  482,  491,  487,  489,  495,
			  531,  540,  495,  497,  497,  497,  497,  497,  497,  446,
			  515,  495,  515,  488,  654,  489,  650,  540,  567,  531,
			  490,  515,  495,  646,  491,  641,  489,  500,  500,  500,
			  500,  500,  500,  501,  501,  501,  501,  501,  501,  502,
			  502,  502,  502,  502,  502,  540,  567,  531,  634,  515,

			  504,  504,  495,  504,  504,  504,  504,  504,  504,  504,
			  506,  506,  506,  506,  506,  506,  500,  507,  507,  507,
			  507,  507,  507,  633,  568,  624,  506,  508,  508,  508,
			  508,  508,  508,  509,  509,  509,  509,  509,  509,  510,
			  510,  510,  510,  510,  510,  621,  569,  520,  545,  506,
			  525,  545,  568,  519,  506,  511,  511,  511,  511,  511,
			  511,  519,  520,  525,  619,  527,  508,  513,  513,  513,
			  513,  513,  513,  527,  569,  917,  917,  514,  510,  514,
			  514,  514,  514,  514,  514,  521,  522,  523,  570,  519,
			  520,  525,  521,  522,  530,  523,  528,  532,  537,  571, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  539,  527,  530,  528,  545,  532,  537,  523,  533,  533,
			  533,  533,  533,  533,  924,  924,  570,  536,  611,  539,
			  521,  522,  778,  523,  538,  778,  604,  571,  536,  600,
			  530,  528,  538,  532,  537,  523,  533,  534,  536,  534,
			  583,  534,  534,  534,  534,  534,  534,  539,  572,  534,
			  535,  535,  535,  535,  535,  535,  536,  541,  573,  574,
			  538,  575,  578,  534,  533,  580,  581,  585,  541,  534,
			  586,  574,  535,  936,  936,  778,  572,  566,  541,  544,
			  544,  544,  544,  544,  544,  544,  573,  574,  562,  575,
			  578,  534,  559,  580,  581,  585,  541,  534,  586,  574,

			  535,  547,  547,  547,  547,  547,  547,  547,  551,  551,
			  551,  551,  551,  551,  551,  553,  553,  553,  553,  553,
			  553,  553,  564,  564,  576,  564,  564,  564,  564,  564,
			  564,  564,  587,  588,  856,  584,  576,  584,  584,  584,
			  584,  584,  584,  589,  590,  591,  592,  593,  594,  595,
			  596,  597,  576,  598,  601,  601,  601,  601,  601,  601,
			  587,  588,  564,  856,  576,  609,  609,  609,  609,  609,
			  609,  589,  590,  591,  592,  593,  594,  595,  596,  597,
			  599,  598,  625,  599,  605,  605,  607,  607,  607,  607,
			  607,  607,  599,  605,  599,  625,  599,  599,  599,  599,

			  599,  599,  607,  599,  606,  606,  557,  606,  606,  606,
			  606,  606,  606,  606,  608,  608,  608,  608,  608,  608,
			  862,  862,  862,  625,  605,  615,  615,  615,  615,  615,
			  607,  529,  627,  599,  610,  610,  610,  610,  610,  610,
			  950,  950,  526,  622,  606,  612,  612,  612,  612,  612,
			  612,  622,  627,  608,  613,  613,  613,  613,  613,  613,
			  614,  614,  614,  614,  614,  614,  617,  617,  617,  617,
			  617,  617,  618,  620,  623,  626,  618,  620,  628,  622,
			  627,  629,  617,  630,  635,  649,  628,  631,  637,  623,
			  524,  630,  626,  636,  631,  637,  626,  638,  657,  636,

			  639,  629,  517,  635,  618,  620,  647,  647,  638,  659,
			  617,  639,  661,  649,  628,  647,  727,  623,  638,  630,
			  626,  639,  631,  637,  727,  505,  657,  636,  493,  629,
			  640,  635,  492,  640,  448,  662,  638,  659,  664,  639,
			  661,  434,  432,  431,  640,  412,  640,  640,  640,  640,
			  640,  640,  640,  640,  642,  727,  642,  642,  642,  642,
			  642,  642,  642,  662,  665,  406,  664,  396,  644,  648,
			  648,  644,  648,  648,  648,  648,  648,  648,  648,  383,
			  644,  378,  644,  640,  644,  644,  644,  644,  644,  644,
			  644,  645,  665,  642,  645,  653,  653,  653,  653,  653,

			  653,  667,  668,  645,  669,  645,  670,  645,  645,  645,
			  645,  645,  645,  645,  671,  672,  374,  673,  674,  675,
			  676,  644,  677,  679,  680,  681,  683,  360,  357,  667,
			  668,  339,  669,  334,  670,  684,  684,  684,  684,  684,
			  684,  332,  671,  672,  645,  673,  674,  675,  676,  315,
			  677,  679,  680,  681,  683,  688,  688,  688,  688,  688,
			  688,  690,  693,  690,  310,  303,  690,  690,  690,  690,
			  690,  690,  691,  691,  691,  691,  691,  691,  692,  692,
			  692,  692,  692,  692,  301,  693,  758,  758,  758,  758,
			  693,  694,  694,  694,  694,  694,  694,  696,  696,  696,

			  696,  696,  696,  697,  697,  697,  697,  697,  697,  700,
			  699,  691,  698,  698,  698,  698,  698,  698,  702,  704,
			  708,  710,  700,  711,  702,  713,  712,  724,  698,  699,
			  729,  711,  730,  713,  282,  708,  704,  712,  710,  268,
			  704,  732,  710,  716,  716,  716,  716,  716,  716,  265,
			  700,  698,  702,  717,  717,  724,  698,  699,  729,  711,
			  730,  713,  717,  708,  704,  712,  710,  722,  722,  732,
			  734,  742,  744,  746,  723,  723,  722,  723,  723,  723,
			  723,  723,  723,  723,  728,  747,  728,  728,  728,  728,
			  728,  728,  728,  748,  749,  752,  857,  764,  734,  742,

			  744,  746,  258,  752,  257,  764,  251,  722,  250,  760,
			  760,  760,  760,  747,  723,  754,  754,  754,  754,  754,
			  754,  748,  749,  728,  753,  857,  753,  753,  753,  753,
			  753,  753,  753,  764,  752,  755,  755,  755,  755,  755,
			  755,  756,  756,  756,  756,  756,  756,  757,  760,  757,
			  763,  784,  757,  757,  757,  757,  757,  757,  972,  972,
			  972,  972,  763,  753,  759,  759,  759,  759,  759,  759,
			  761,  761,  761,  761,  761,  761,  762,  766,  767,  784,
			  768,  769,  762,  766,  771,  249,  761,  768,  771,  769,
			  763,  787,  772,  788,  789,  767,  772,  972,  790,  767,

			  907,  907,  907,  907,  907,  771,  248,  246,  238,  761,
			  762,  766,  791,  772,  761,  768,  771,  769,  792,  787,
			  793,  788,  789,  767,  772,  774,  790,  774,  774,  774,
			  774,  774,  774,  782,  782,  782,  782,  782,  782,  794,
			  791,  796,  234,  233,  232,  229,  792,  227,  793,  800,
			  800,  800,  800,  800,  800,  801,  801,  801,  801,  801,
			  801,  224,  212,  190,  774,  186,  183,  794,  182,  796,
			  802,  802,  802,  802,  802,  802,  803,  803,  803,  803,
			  803,  803,  804,  804,  804,  804,  804,  804,  805,  805,
			  805,  805,  805,  805,  801,  807,  807,  807,  807,  807,

			  807,  808,  809,  814,  815,  811,  816,  826,  815,  828,
			  816,  807,  808,  811,  817,  817,  817,  817,  817,  817,
			  824,  163,  159,  809,  814,  815,  829,  816,  824,  832,
			  833,  156,  835,  153,  807,  826,  815,  828,  816,  807,
			  808,  811,  825,  149,  825,  825,  825,  825,  825,  825,
			  825,  809,  814,  844,  829,  845,  136,  832,  833,  824,
			  835,  838,  838,  838,  838,  838,  838,  840,  840,  840,
			  840,  840,  840,  846,  116,  845,  854,  841,  844,  841,
			  864,  825,  841,  841,  841,  841,  841,  841,  842,  842,
			  842,  842,  842,  842,  843,  858,  859,  860,  846,  105,

			  838,  864,  843,  845,  854,  889,  849,  844,  849,  849,
			  849,  849,  849,  849,  867,  873,  841,  863,  863,  863,
			  863,  863,  863,  858,  859,  868,  860,  846,  869,  864,
			  843,  867,  879,  868,  889,  891,  869,  881,  881,  881,
			  881,  881,  881,  873,  883,  849,  868,  900,  884,  869,
			  882,  882,  882,  882,  882,  882,  884,  885,  886,  867,
			  879,  868,  910,  891,  869,  885,  886,  104,  894,  883,
			  893,  914,  893,  910,  909,  900,  101,   99,  885,  886,
			   97,  893,  909,  910,  884,  894,  906,  906,  906,  906,
			  906,  906,   93,  885,  886,  911,   90,   89,  883,  914, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			   88,  910,   73,   70,   54,   38,  911,   33,   31,  893,
			  909,   26,   24,  894,   16,   15,  911,  916,  916,  916,
			  916,  916,  916,  918,  918,  918,  918,  918,  918,  946,
			  946,  946,  946,  946,  911,  919,  919,  919,  919,  919,
			  919,  920,  920,  920,  920,  920,  920,  922,  923,  930,
			  930,  930,  930,  930,  930,   14,   11,    0,  922,  923,
			  931,    0,  931,    0,    0,    0,    0,    0,  922,  923,
			  928,  931,  928,  928,    0,  928,  928,  928,  928,  928,
			  928,    0,    0,    0,    0,    0,  922,  923,  929,    0,
			  929,  929,    0,  929,  929,  929,  929,  929,  929,  931,

			  937,  937,  937,  937,  937,  937,  938,  938,  938,  938,
			  938,  938,  928,  940,  940,  940,  940,  940,  940,  941,
			  941,  941,  941,  941,  941,    0,    0,    0,    0,    0,
			  929,  943,  943,  943,  943,  943,  943,  944,  944,  944,
			  944,  944,  944,  945,  945,  945,  945,  945,  945,  948,
			  949,  951,  951,  951,  951,  951,  951,  954,  954,  954,
			  954,  954,  954,    0,  938,    0,  948,  949,    0,    0,
			  948,  949,    0,  952,    0,  952,  952,  941,  952,  952,
			  952,  952,  952,  952,  953,  953,  953,  953,  953,  953,
			    0,    0,    0,    0,  948,  949,  956,    0,  956,  956,

			    0,  956,  956,  956,  956,  956,  956,  957,  957,  957,
			  957,  957,  957,    0,    0,  952,    0,    0,  963,    0,
			  964,  953,  958,  958,  958,  958,  958,  958,  961,  961,
			  961,  961,  961,  961,    0,  963,    0,  964,  956,  963,
			  960,  964,  960,  960,  957,  960,  960,  960,  960,  960,
			  960,  962,  962,  962,  962,  962,  962,  966,  966,  966,
			  966,  966,  966,  963,  965,  964,  965,  965,    0,  965,
			  965,  965,  965,  965,  965,  968,  968,  968,  968,  968,
			  968,    0,  960,  969,  969,  969,  969,  969,  969,  970,
			  970,  970,  970,  970,  970,  971,  971,  971,  971,  971,

			  971,    0,    0,    0,    0,    0,  965,  975,  975,  975,
			  975,  975,  975,    0,    0,  966,  977,  977,  977,  977,
			  977,  977,  979,  979,  979,  979,  979,  979,  980,  980,
			  980,  980,  980,  980,  982,    0,  982,  982,    0,  982,
			  982,  982,  982,  982,  982,  983,    0,  983,    0,    0,
			  983,  983,  983,  983,  983,  983,    0,    0,    0,  979,
			    0,  984,    0,  984,    0,  975,  984,  984,  984,  984,
			  984,  984,    0,    0,    0,    0,  982,  985,  985,  985,
			  985,  985,  985,    0,    0,    0,    0,  983,  986,  986,
			  986,  986,  986,  986,  987,  987,  987,  987,  987,  987,

			    0,    0,    0,  984,  989,  989,  989,  989,  989,  989,
			  990,  990,  990,  990,  990,  990,  992,    0,  992,  992,
			    0,  992,  992,  992,  992,  992,  992,  993,  993,  993,
			  993,  993,  993,  994,  994,  994,  994,  994,  994,    0,
			  995,  989,  995,    0,    0,  995,  995,  995,  995,  995,
			  995,  996,  996,  996,  996,  996,  996,  997,  992,  997,
			    0,    0,  997,  997,  997,  997,  997,  997,  998,  998,
			  998,  998,  998,  998,    0,  999,    0,  999,    0,  995,
			  999,  999,  999,  999,  999,  999, 1000, 1000, 1000, 1000,
			 1000, 1000, 1007,    0,    0,    0,    0,    0,    0,  997,

			    0,    0,    0,    0, 1007, 1007, 1007, 1007, 1007, 1007,
			 1007, 1007, 1007,    0,    0,    0,    0,  999, 1002, 1002,
			 1002, 1002, 1002, 1002, 1002, 1002, 1002, 1002, 1002, 1002,
			 1002, 1002, 1002, 1002, 1002, 1002, 1002, 1002, 1002, 1002,
			 1002, 1002, 1002, 1002, 1002, 1002, 1002, 1002, 1003, 1003,
			 1003, 1003, 1003, 1003, 1003, 1003, 1003, 1003, 1003, 1003,
			 1003, 1003, 1003, 1003, 1003, 1003, 1003, 1003, 1003, 1003,
			 1003, 1003, 1003, 1003, 1003, 1003, 1003, 1003, 1004, 1004,
			 1004, 1004, 1004, 1004, 1004, 1004, 1004, 1004, 1004, 1004,
			 1004, 1004, 1004, 1004, 1004, 1004, 1004, 1004, 1004, 1004,

			 1004, 1004, 1004, 1004, 1004, 1004, 1004, 1004, 1005, 1005,
			    0, 1005, 1005, 1005, 1005, 1005, 1005, 1005, 1005, 1005,
			 1005, 1005, 1005, 1005, 1005, 1005, 1005, 1005,    0, 1005,
			 1005, 1005, 1005, 1005, 1005, 1005, 1005, 1005, 1006, 1006,
			    0, 1006, 1006, 1006, 1006, 1006, 1006, 1006, 1006, 1006,
			 1006, 1006, 1006, 1006, 1006, 1006, 1006, 1006, 1006, 1006,
			 1006, 1006, 1006, 1006, 1006, 1006, 1006, 1006, 1008, 1008,
			 1008, 1008,    0, 1008, 1008, 1008, 1008,    0,    0, 1008,
			 1008, 1008, 1008, 1008, 1008, 1008, 1008, 1008, 1009, 1009,
			    0, 1009,    0, 1009, 1009, 1009,    0,    0, 1009, 1009,

			 1009, 1009,    0,    0, 1009, 1009, 1009, 1009, 1009, 1009,
			 1009, 1009, 1009, 1010, 1010,    0, 1010, 1010, 1010, 1010,
			 1010, 1010, 1010, 1010, 1010, 1010, 1010, 1010, 1010, 1010,
			 1010, 1010, 1010, 1010, 1010, 1010, 1010, 1010, 1010, 1010,
			 1010, 1010, 1010, 1011, 1011,    0, 1011, 1011, 1011, 1011,
			 1011, 1011, 1011, 1011, 1011, 1011, 1011, 1011, 1011, 1011,
			 1011, 1011, 1011,    0, 1011, 1011, 1011, 1011, 1011, 1011,
			 1011, 1011, 1011, 1012, 1012, 1012, 1012, 1012, 1012, 1012,
			 1012, 1012, 1012, 1012, 1012, 1012, 1012, 1012, 1012, 1012,
			 1012, 1012, 1012, 1012, 1012, 1012, 1012, 1012, 1012, 1012,

			 1012, 1012, 1012, 1013, 1013, 1013, 1013, 1013, 1013, 1013,
			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013,
			 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013, 1013,
			 1013, 1013, 1013, 1014,    0, 1014,    0,    0,    0,    0,
			 1014,    0, 1014, 1014, 1014,    0,    0, 1014, 1014, 1014,
			 1014,    0,    0, 1014, 1014, 1014, 1014, 1014, 1014, 1014,
			 1014, 1014, 1015, 1015,    0, 1015, 1015, 1015, 1015, 1015,
			 1015, 1015, 1015, 1015, 1015, 1015, 1015, 1015, 1015, 1015,
			 1015, 1015, 1015, 1015, 1015, 1015, 1015, 1015, 1015, 1015,
			 1015, 1015, 1016, 1016, 1016, 1016, 1016, 1016, 1016, 1016,

			 1016, 1016, 1016, 1016, 1016, 1016, 1016, 1016, 1016, 1016,
			 1016, 1016, 1016, 1016, 1016, 1016, 1016, 1016, 1016, 1016,
			 1016, 1016, 1017, 1017, 1017, 1017,    0,    0, 1017, 1017,
			 1017, 1017, 1017,    0, 1017, 1017, 1017, 1017, 1017, 1017,
			 1017, 1017, 1017, 1018,    0,    0, 1018, 1018, 1018, 1018,
			 1018, 1018, 1018, 1018, 1018,    0,    0, 1018, 1018, 1018,
			 1018, 1018, 1018, 1018, 1018, 1018, 1019, 1019, 1019, 1019,
			 1019, 1019, 1019, 1019, 1019, 1020, 1020, 1020, 1020,    0,
			    0, 1020, 1020, 1020, 1020, 1020, 1020, 1020, 1020, 1020,
			 1021, 1021, 1021, 1021, 1021, 1021, 1021, 1021, 1021,    0, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			 1021, 1021, 1021, 1021, 1021, 1021, 1021, 1021, 1021, 1021,
			 1021, 1021, 1021, 1021, 1021, 1021, 1021, 1021, 1021, 1021,
			 1022, 1022, 1022, 1022, 1022, 1022, 1022, 1022, 1022, 1022,
			 1022, 1022, 1022, 1022, 1022, 1022, 1022, 1022, 1022, 1022,
			 1022, 1022, 1022, 1022, 1022, 1022, 1022, 1022, 1022, 1022,
			 1023, 1023, 1023, 1023, 1023, 1023, 1023, 1023, 1023, 1023,
			 1023, 1023, 1023, 1023, 1023, 1023, 1023, 1023, 1023, 1023,
			 1023, 1023, 1023, 1023, 1023, 1023, 1023, 1023, 1023, 1023,
			 1024, 1024, 1024, 1024,    0,    0, 1024, 1024, 1024, 1024,
			 1024, 1024, 1024, 1024, 1024, 1025, 1025, 1025, 1025,    0,

			    0, 1025, 1025, 1025, 1025, 1025,    0, 1025, 1025, 1025,
			 1025, 1025, 1025, 1025, 1025, 1025, 1026, 1026, 1026,    0,
			    0, 1026, 1026, 1026, 1026,    0,    0, 1026, 1026, 1026,
			 1026, 1026, 1026, 1026, 1026, 1026, 1027, 1027, 1027, 1027,
			 1027, 1027, 1027, 1027, 1027, 1027, 1027, 1027, 1027, 1027,
			 1027, 1027, 1027, 1027, 1027, 1027, 1027, 1027, 1027, 1027,
			 1027, 1027, 1027, 1027, 1027, 1027, 1028, 1028, 1028,    0,
			    0, 1028, 1028, 1028, 1028,    0,    0, 1028, 1028, 1028,
			 1028, 1028, 1028, 1028, 1028, 1028, 1029, 1029, 1029, 1029,
			    0,    0, 1029, 1029, 1029, 1029, 1029, 1029, 1029, 1029,

			 1029, 1030, 1030, 1030,    0,    0, 1030, 1030, 1030, 1030,
			 1030, 1030, 1030, 1030,    0,    0, 1030, 1030, 1030, 1030,
			    0,    0, 1030, 1030, 1030, 1030, 1030, 1030, 1030, 1030,
			 1030, 1031,    0, 1031,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0, 1031, 1031, 1031, 1031,    0,
			    0, 1031, 1031, 1031, 1031, 1031, 1031, 1031, 1031, 1031,
			 1032, 1032, 1032,    0,    0, 1032, 1032, 1032, 1032,    0,
			    0, 1032, 1032, 1032, 1032, 1032, 1032, 1032, 1032, 1032,
			 1033, 1033, 1033,    0,    0, 1033, 1033, 1033, 1033,    0,
			    0, 1033, 1033, 1033, 1033, 1033, 1033, 1033, 1033, 1033,

			 1034, 1034, 1034,    0,    0, 1034, 1034, 1034, 1034,    0,
			    0, 1034, 1034, 1034, 1034, 1034, 1034, 1034, 1034, 1034,
			 1035, 1035, 1035,    0,    0, 1035, 1035, 1035, 1035,    0,
			    0, 1035, 1035, 1035, 1035, 1035, 1035, 1035, 1035, 1035,
			 1036, 1036, 1036,    0,    0, 1036, 1036, 1036, 1036,    0,
			    0, 1036, 1036, 1036, 1036, 1036, 1036, 1036, 1036, 1036,
			 1037, 1037, 1037,    0,    0, 1037, 1037, 1037, 1037,    0,
			    0, 1037, 1037, 1037, 1037, 1037, 1037, 1037, 1037, 1037,
			 1038, 1038, 1038, 1038,    0,    0, 1038, 1038, 1038, 1038,
			 1038, 1038, 1038, 1038, 1038, 1039, 1039, 1039, 1039,    0,

			    0, 1039, 1039, 1039, 1039, 1039, 1039, 1039, 1039, 1039,
			 1040, 1040, 1040,    0,    0, 1040, 1040, 1040, 1040,    0,
			    0, 1040, 1040, 1040, 1040, 1040, 1040, 1040, 1040, 1040,
			 1041, 1041, 1041,    0,    0, 1041, 1041, 1041, 1041,    0,
			    0, 1041, 1041, 1041, 1041, 1041, 1041, 1041, 1041, 1041,
			 1042, 1042, 1042, 1042,    0,    0, 1042, 1042, 1042, 1042,
			 1042, 1042, 1042, 1042, 1042, 1043, 1043, 1043,    0,    0,
			 1043, 1043, 1043, 1043,    0,    0, 1043, 1043, 1043, 1043,
			 1043, 1043, 1043, 1043, 1043, 1044, 1044, 1044, 1044,    0,
			    0, 1044, 1044, 1044, 1044, 1044, 1044, 1044, 1044, 1044,

			 1045, 1045, 1045,    0,    0, 1045, 1045, 1045, 1045,    0,
			    0, 1045, 1045, 1045, 1045, 1045, 1045, 1045, 1045, 1045,
			 1046, 1046, 1046,    0,    0, 1046, 1046, 1046, 1046,    0,
			    0, 1046, 1046, 1046, 1046, 1046, 1046, 1046, 1046, 1046,
			 1047, 1047, 1047,    0,    0, 1047, 1047, 1047, 1047,    0,
			    0, 1047, 1047, 1047, 1047, 1047, 1047, 1047, 1047, 1047,
			 1048, 1048, 1048, 1048,    0,    0, 1048, 1048, 1048, 1048,
			 1048, 1048, 1048, 1048, 1048, 1049, 1049, 1049,    0,    0,
			 1049, 1049, 1049, 1049,    0,    0, 1049, 1049, 1049, 1049,
			 1049, 1049, 1049, 1049, 1049, 1050, 1050, 1050,    0,    0,

			 1050, 1050, 1050, 1050,    0,    0, 1050, 1050, 1050, 1050,
			 1050, 1050, 1050, 1050, 1050, 1051, 1051, 1051, 1051,    0,
			    0, 1051, 1051, 1051, 1051, 1051, 1051, 1051, 1051, 1051,
			 1052, 1052, 1052, 1052,    0,    0, 1052, 1052, 1052, 1052,
			 1052, 1052, 1052, 1052, 1052, 1053, 1053, 1053,    0,    0,
			 1053, 1053, 1053, 1053,    0,    0, 1053, 1053, 1053, 1053,
			 1053, 1053, 1053, 1053, 1053, 1054, 1054, 1054, 1054,    0,
			    0, 1054, 1054, 1054, 1054, 1054, 1054, 1054, 1054, 1054,
			 1055, 1055, 1055,    0,    0, 1055, 1055, 1055, 1055,    0,
			    0, 1055, 1055, 1055, 1055, 1055, 1055, 1055, 1055, 1055,

			 1056, 1056, 1056,    0,    0, 1056, 1056, 1056, 1056,    0,
			    0, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056, 1056,
			 1057, 1057, 1057, 1057,    0,    0, 1057, 1057, 1057, 1057,
			 1057, 1057, 1057, 1057, 1057, 1058, 1058, 1058, 1058,    0,
			    0, 1058, 1058, 1058, 1058, 1058, 1058, 1058, 1058, 1058,
			 1059, 1059, 1059,    0,    0, 1059, 1059, 1059, 1059,    0,
			    0, 1059, 1059, 1059, 1059, 1059, 1059, 1059, 1059, 1059,
			 1060, 1060, 1060,    0,    0, 1060, 1060, 1060, 1060,    0,
			    0, 1060, 1060, 1060, 1060, 1060, 1060, 1060, 1060, 1060,
			 1061, 1061, 1061,    0,    0, 1061, 1061, 1061, 1061,    0,

			    0, 1061, 1061, 1061, 1061, 1061, 1061, 1061, 1061, 1061,
			 1062, 1062, 1062, 1062,    0,    0, 1062, 1062, 1062, 1062,
			 1062, 1062, 1062, 1062, 1062, 1063, 1063, 1063, 1063,    0,
			    0, 1063, 1063, 1063, 1063, 1063, 1063, 1063, 1063, 1063,
			 1064, 1064, 1064,    0,    0, 1064, 1064, 1064, 1064,    0,
			    0, 1064, 1064, 1064, 1064, 1064, 1064, 1064, 1064, 1064,
			 1065, 1065, 1065,    0,    0, 1065, 1065, 1065, 1065,    0,
			    0, 1065, 1065, 1065, 1065, 1065, 1065, 1065, 1065, 1065,
			 1066, 1066, 1066,    0,    0, 1066, 1066, 1066, 1066,    0,
			    0, 1066, 1066, 1066, 1066, 1066, 1066, 1066, 1066, 1066,

			 1067, 1067, 1067,    0,    0, 1067, 1067, 1067, 1067,    0,
			    0, 1067, 1067, 1067, 1067, 1067, 1067, 1067, 1067, 1067,
			 1068, 1068, 1068,    0,    0, 1068, 1068, 1068, 1068,    0,
			    0, 1068, 1068, 1068, 1068, 1068, 1068, 1068, 1068, 1068,
			 1069, 1069, 1069,    0,    0, 1069, 1069, 1069, 1069,    0,
			    0, 1069, 1069, 1069, 1069, 1069, 1069, 1069, 1069, 1069,
			 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001,
			 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001,
			 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001,
			 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001,
			 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001,
			 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001,
			 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001,
			 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001,
			 1001, 1001, 1001, yy_Dummy>>,
			1, 53, 5000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1069)
			yy_base_template_1 (an_array)
			yy_base_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_base_template_1 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,   90,   95,   77,   79,   98,  102,  187,
			    0, 3056, 4960,  104, 3052, 2988, 3007, 4960,   86, 4960,
			 4960, 4960, 4960, 4960, 2997,  100, 2994,  266,  276, 4960,
			 4960, 2981, 4960, 2980, 4960,  100,  102,   85, 2979,  265,
			  276,   73,  267,   99,  275,  277,  334,  274,  101,  279,
			   86,   87, 4960, 4960, 2948,  413,  324,  331,  492,  325,
			  104,  111,  533,  280,  270,  337,  334,  327,  272,  297,
			 2986, 4960, 4960, 2995,  322, 4960,  107,  355,  318,  413,
			  322,  418,  363, 4960,  367,  373, 4960,  573, 2997, 2982,
			 2921, 4960,  153, 2989,  575,  579,  326, 2977, 4960, 2970,

			 4960, 2967,    0,  590, 2964, 2883,  598, 4960,  371,  604,
			  617,  648,  627,  662, 4960, 4960, 2848,    0,  626,  480,
			  572,  580,  475,  616,  393,  661,  635,  630,  147,  651,
			  663,  412,  662,  664,  665,  674, 2773,  691,  687,  700,
			  762,  703,  760,  729,  470,  690,  684,  670,  577, 2819,
			  729,  259,  559, 2777, 4960,  401, 2820,    0,  815, 2805,
			  539,  691,  711, 2755,    0,  698,  709,  729,  732,  733,
			  725,  733,  742,  750,  751,  774,  755,  781,  766,  769,
			  777,  772, 2744, 2742,  775,  790, 2708,  833,  788,  800,
			 2706,  788,  790,  796,  821,  837,  837,  840,  866,  867,

			  854,  869,  856,  867,  872,  869,  874,  865,  867,  661,
			  862, 4960, 2755, 4960,  583, 4960, 4960,  855,  510,  907,
			  910,  913,  757, 4960, 2707,  898,  899, 2692,  901, 2691,
			 4960,  917, 2669, 2740, 2739,  939,  163,  962, 2705,  963,
			  749, 1018,  821, 4960, 4960, 4960, 2698,  961, 2697, 2676,
			 2599, 2597,  862, 4960,  951, 1098,  983, 2587, 2536, 1104,
			 1110, 1127, 1137, 1116, 1143, 2521, 1142, 1128, 2513, 1143,
			 1145,  940, 1147,  924, 1149, 1151, 1086, 1150, 1113, 1148,
			 1158, 1156, 2508, 1157, 1165, 4960,  125, 1216, 1225, 1234,
			 1246, 1245, 1253, 1175,  133, 1181,  352, 1249, 1186, 1245,

			 1160, 2458, 1250, 2441, 1284, 1313, 1320, 1169, 4960, 1224,
			 2447,  887, 1161,    0,    0, 2388, 1250, 1244,    0, 1245,
			 1246, 1256, 1246, 1261, 1249, 1262, 1258, 1252, 1266, 1290,
			 1299, 1300, 2384, 1301, 2376, 1331, 1310, 1311, 1313, 2415,
			 1343, 1313, 1315, 1323, 1324,    0,    0, 1310, 1333, 1320,
			 1335, 1329, 1338, 1335, 1351, 1343, 1343, 2371, 1345, 1345,
			 2370,    0,    0, 1160, 1229, 1346,  421, 1384, 1386, 1394,
			 1398, 1401,  807, 4960, 2361, 4960, 1405, 1420, 2378, 1421,
			 4960,  921, 1007, 2376, 4960, 4960, 1430, 4960, 4960, 4960,
			 4960, 1420, 1443, 1471, 1477,    0, 2306, 1483, 1489, 1511,

			 1495, 1517, 1534, 1543, 1549, 1555, 2337, 1383, 1380, 1515,
			 1554, 1553, 2319, 1555, 1557, 1556, 1559, 1555, 1560, 1568,
			 1386, 1570, 1567, 1574, 1630, 1639, 1648, 1655, 1661, 1683,
			 1692, 2317, 2316, 1596, 2315, 1615, 1573, 1666, 1193, 1542,
			 1714, 1726, 1670, 1736, 1759, 1766, 1804, 1379, 2268,    0,
			 1347, 1470,  833, 1777, 1476, 1552, 1477, 1564, 1572, 1577,
			 1576, 1593,    0, 1645, 1652,    0, 1660, 1687, 1703, 1736,
			 1740, 1738, 1729, 1738, 1811, 1770, 1762, 1774, 1775, 1768,
			 1770, 1771, 1772,    0,    0,    0,    0, 1771, 1802, 1807,
			 1794, 1813, 2317, 2313, 4960, 1847,  923, 1835, 1409, 4960,

			 1859, 1865, 1871, 1674, 1885, 2311, 1892, 1899, 1909, 1915,
			 1921, 1937,  573, 1949, 1961, 1847,  932, 2276, 1163, 1927,
			 1921, 1959, 1960, 1961, 2264, 1924, 2218, 1939, 1970, 2205,
			 1968, 1824, 1971, 1990, 2023, 2032, 1988, 1972, 1998, 1974,
			 1825, 2028, 4960, 1738, 2061, 1946, 4960, 2083, 4960, 1619,
			 1540, 2090, 4960, 2097, 4960,  690,    0, 2145,    0, 2035,
			    0,    0, 2064, 1717, 2107,    0, 2020, 1834, 1890, 1905,
			 1955, 1958, 2015, 2025, 2025, 2028, 2090,    0, 2023,    0,
			 2031, 2033,    0, 2024, 2119, 2033, 2037, 2098, 2099, 2098,
			 2110, 2100, 2112, 2113, 2114, 2104, 2108, 2117, 2119, 2178,

			 1972, 2136,    0,    0, 2002, 2169, 2189, 2168, 2196, 2147,
			 2216, 1961, 2227, 2236, 2242, 2207, 4960, 2248, 2246, 1938,
			 2247, 1919, 2217, 2248, 1899, 2156, 2246, 2206, 2252, 2255,
			 2257, 2261, 4960, 1899, 1872, 2258, 2267, 2262, 2268, 2271,
			 2328, 1800, 2338,    0, 2366, 2389, 1849, 2291, 2354, 2255,
			 1851,  682,    0, 2377, 1847,    0,    0, 2268,    0, 2279,
			    0, 2278, 2294,    0, 2304, 2323,    0, 2362, 2356, 2370,
			 2360, 2380, 2369, 2371, 2384, 2386, 2386, 2389,    0, 2378,
			 2392, 2392,    0, 2381, 2417, 1788,  991,    0, 2437, 1761,
			 2448, 2454, 2460, 2428, 2473, 1755, 2479, 2485, 2494, 2484,

			 2483, 1741, 2492, 1727, 2490, 1703, 1696, 1694, 2494, 1661,
			 2492, 2497, 2500, 2499, 1670, 1639, 2525, 2538, 1621,    0,
			    0, 1619, 2552, 2559, 2482,    0,    0, 2300, 2568, 2491,
			 2493,    0, 2509,    0, 2538,    0,    0,    0,    0,    0,
			    0,    0, 2530,    0, 2531,    0, 2539, 2548, 2559, 2560,
			    0,    0, 2579, 2608, 2597, 2617, 2623, 2634, 2468, 2646,
			 2596, 2652, 2650, 2624, 2571, 4960, 2651, 2649, 2654, 2655,
			 1596, 2655, 2663,  413, 2709,    0,    0, 1589, 2020, 1593,
			 1186,    0, 2715, 1585, 2619,    0, 1528, 2653, 2655, 2660,
			 2664, 2680, 2686, 2687, 2705,    0, 2708,    0, 1512, 1468,

			 2731, 2737, 2752, 2758, 2764, 2770, 4960, 2777, 2775, 2776,
			 1494, 2779, 4960, 1452, 2777, 2775, 2777, 2796, 4960, 1459,
			 1378,    0,    0,    0, 2804, 2826, 2770, 1443, 2762, 2779,
			    0,    0, 2795, 2796,    0, 2785,    0, 1441, 2843, 1397,
			 2849, 2864, 2870, 2868, 2827, 2829, 2847, 1227, 4960, 2890,
			    0,    0,    0, 1263, 2842,    0, 2083, 2545, 2849, 2850,
			 2846,    0, 2202, 2899, 2854, 1247, 1202, 2888, 2896, 2899,
			    0, 1211, 1198, 2868,    0,    0,    0,    0,    0, 2889,
			    0, 2919, 2932, 2918, 2922, 2928, 2929, 1125,    0, 2854,
			  638, 2901, 1099, 2957, 2942,  990,  987,  966,    0,    0,

			 2904,    0,  864,    0,    0,  781, 2968, 2682, 4960, 2948,
			 2933, 2966,    0, 1452, 2937, 1613, 2999, 1960, 3005, 3017,
			 3023,  739, 3018, 3019, 1999,    0,  615,    0, 3057, 3075,
			 3031, 3047,  617,  558,    0,  499, 2058, 3082, 3088,  448,
			 3095, 3101,  434, 3113, 3119, 3125, 3011, 4960, 3120, 3121,
			 2225, 3133, 3160, 3166, 3139,  435, 3183, 3189, 3204,  353,
			 3227, 3210, 3233, 3189, 3191, 3251, 3239,  270, 3257, 3265,
			 3271, 3277, 2645, 4960, 4960, 3289,  243, 3298, 4960, 3304,
			 3310,  221, 3321, 3332, 3348, 3359, 3370, 3376, 4960, 3386,
			 3392,  117, 3403, 3409, 3415, 3427, 3433, 3444, 3450, 3462, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			 3468, 4960, 3517, 3547, 3577, 3607, 3637, 3482, 3657, 3682,
			 3712, 3742, 3772, 3802, 3831, 3861, 3891, 3912, 3935, 3944,
			 3959, 3989, 4019, 4049, 4064, 4085, 4105, 4135, 4155, 4170,
			 4200, 4229, 4249, 4269, 4289, 4309, 4329, 4349, 4364, 4379,
			 4399, 4419, 4434, 4454, 4469, 4489, 4509, 4529, 4544, 4564,
			 4584, 4599, 4614, 4634, 4649, 4669, 4689, 4704, 4719, 4739,
			 4759, 4779, 4794, 4809, 4829, 4849, 4869, 4889, 4909, 4929, yy_Dummy>>,
			1, 70, 1000)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1069)
			yy_def_template_1 (an_array)
			yy_def_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0, 1001,    1, 1002, 1002, 1003, 1003, 1004, 1004, 1001,
			    9, 1001, 1001, 1001, 1001, 1001, 1005, 1001, 1006, 1001,
			 1001, 1001, 1001, 1001, 1001, 1001, 1007, 1001, 1001, 1001,
			 1001, 1001, 1001, 1001, 1001, 1008, 1008, 1008, 1008, 1008,
			 1008, 1008, 1008, 1008, 1008, 1008, 1008, 1008, 1008, 1008,
			 1008, 1009, 1001, 1001, 1010, 1001,   55,   55, 1001,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			 1001, 1001, 1001, 1011, 1001, 1001, 1001, 1011, 1011, 1011,
			 1011, 1011, 1012, 1001, 1013, 1012, 1001, 1001, 1001, 1001,
			 1001, 1001, 1014, 1001, 1014, 1014, 1001, 1001, 1001, 1005,

			 1001, 1015, 1015, 1015, 1016, 1001, 1001, 1001, 1017, 1001,
			 1001, 1001, 1001, 1001, 1001, 1001, 1008, 1018, 1008, 1008,
			 1008, 1008, 1008, 1008, 1008, 1008, 1008, 1008, 1008, 1008,
			 1008, 1008, 1008, 1008, 1008, 1008, 1001,   46, 1008, 1008,
			 1008, 1008, 1008, 1008, 1008, 1008, 1008, 1008, 1008, 1009,
			 1009, 1009, 1009, 1010, 1001, 1001, 1001, 1019,   58, 1001,
			  158,  158,  158, 1020,   58,   58,   58,   58,  158,   58,
			  158,  158,   58,   58,  158,  158,   58,   58,  158,  158,
			   58,   58,  158,   58,  158,  158,  158,   58,   58,   58,
			   58,  158,   58,  158,   58,  158,  158,   58,   58,  158,

			  158,   58,   58,  158,  158,   58,   58,  158,   58,  158,
			   58, 1001, 1011, 1001, 1001, 1001, 1001, 1011, 1011, 1011,
			 1011, 1011, 1012, 1001, 1021, 1012, 1013, 1022, 1013, 1021,
			 1001, 1001, 1001, 1001, 1023, 1001, 1014, 1014, 1001, 1001,
			 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001,
			 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1007, 1024, 1001,
			 1001, 1001, 1001, 1001, 1001, 1018, 1008, 1008, 1008, 1008,
			 1008, 1008, 1008, 1008, 1008, 1008, 1008, 1001, 1008, 1008,
			 1008, 1008, 1008, 1008, 1008, 1001, 1008, 1008, 1008, 1008,
			  140,  140, 1008, 1008, 1008, 1008, 1008, 1008, 1008, 1008,

			 1008, 1008, 1008, 1001, 1009, 1009, 1009, 1009, 1001, 1025,
			 1001,  158,  158,  158, 1026, 1026,   58,   58,   58,  158,
			   58,  158,  158,   58,   58,  158,  158,  158,   58,   58,
			   58,  158,  158,   58,   58, 1001,  158,  158,  158,  158,
			  158,   58,   58,  158,   58,  158,   58,  158,  158,   58,
			   58,  158,  158,   58,   58,  158,  158,  158,   58,   58,
			   58,  158,   58,  158,   58, 1011, 1011, 1011, 1011, 1011,
			 1011, 1011, 1021, 1001, 1022, 1001, 1001, 1001, 1027, 1027,
			 1001, 1027, 1027, 1027, 1001, 1001, 1001, 1001, 1001, 1001,
			 1001, 1001, 1001, 1001, 1001, 1028, 1028, 1001, 1001, 1001,

			 1001, 1001, 1001, 1001, 1001, 1001, 1018, 1008, 1008, 1008,
			 1008, 1008, 1008, 1008, 1008, 1008, 1008, 1001, 1008, 1008,
			 1008, 1008, 1008, 1008, 1008, 1008,  425,  425, 1001, 1008,
			 1008, 1008, 1008, 1001, 1008, 1008, 1008, 1008, 1008, 1001,
			 1009, 1009, 1009, 1009, 1009, 1009, 1009, 1009, 1029, 1030,
			  158,  158, 1026, 1026,   58,   58,  158,   58,  158,  158,
			   58,   58,  158,  158,  158,   58,   58,   58,  158,  158,
			   58,  158,  158,  158, 1001,   58,   58,  158,   58,  158,
			  158,   58,   58,  158,  158,   58,   58,  158,  158,  158,
			   58,   58,  158,   58, 1001, 1001, 1001, 1001, 1001, 1001,

			 1001, 1001, 1001, 1028, 1028, 1001, 1001, 1001, 1001, 1001,
			 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1008, 1008, 1008,
			 1008, 1008, 1008, 1008, 1008, 1008, 1001, 1008, 1008, 1008,
			 1008, 1008, 1008, 1001, 1008,  534, 1001, 1008, 1008, 1008,
			 1008, 1001, 1001, 1001, 1009, 1001, 1001, 1009, 1001, 1001,
			 1031, 1009, 1001, 1009, 1001, 1009, 1032, 1032,  158,  158,
			 1033, 1034, 1001, 1026, 1026,   58,   58,  158,   58,  158,
			  158,   58,   58,  158,  158,   58,   58,  158,  158,   58,
			  158,  158,  158, 1001, 1001,   58,   58,  158,   58,  158,
			  158,   58,   58,  158,  158,  158,  158,   58,   58, 1001,

			 1001, 1001, 1035, 1036, 1001, 1028, 1028, 1001, 1001, 1001,
			 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1008, 1008,
			 1008, 1008, 1008, 1008, 1008, 1008, 1001, 1008, 1008, 1008,
			 1008, 1008, 1001, 1001, 1008, 1008, 1008, 1008, 1001, 1001,
			 1009, 1001, 1009, 1037, 1009, 1009, 1009, 1032, 1032,  158,
			 1033, 1034, 1038, 1034, 1001,  158,   58,  158,  158,   58,
			   58,  158,  158,  158,   58,   58,   58,  158,  158,  158,
			   58,   58,  158,   58,  158,  158,   58,   58,  158,  158,
			  158,  158,   58,   58, 1001, 1035, 1036, 1039, 1036, 1001,
			 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1008,

			 1008, 1008, 1008, 1008, 1001, 1008, 1008, 1008, 1008, 1008,
			 1001, 1008, 1008, 1008, 1001, 1001, 1001, 1037, 1001, 1040,
			 1041, 1001, 1032, 1032,  158, 1042, 1043, 1034, 1034,  158,
			   58,  158,  158,   58,   58,  158,  158,  158,   58,   58,
			  158,   58,  158,  158,   58,   58,  158,  158,  158,   58,
			 1044, 1045, 1036, 1036, 1001, 1001, 1001, 1001, 1001, 1001,
			 1001, 1001, 1008, 1008, 1008, 1001, 1008, 1001, 1008, 1008,
			 1008, 1001, 1001, 1001, 1001, 1046, 1047, 1001, 1001, 1040,
			 1041, 1048, 1041, 1001,  158, 1049, 1043,  158,   58,  158,
			   58,  158,   58,  158,  158,  158,   58, 1050, 1045, 1001,

			 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1008, 1008,
			 1008, 1008, 1001, 1008, 1008, 1001, 1001, 1001, 1001, 1046,
			 1047, 1051, 1052, 1053, 1041, 1041,  158, 1049,  158,   58,
			  158,   58,  158,   58,  158,  158,   58, 1050, 1001, 1001,
			 1001, 1001, 1001, 1008, 1008, 1008, 1008, 1001, 1001, 1001,
			 1054, 1055, 1056, 1053,  158, 1057,  158,   58,  158,   58,
			  158, 1058, 1001, 1001, 1008, 1008, 1008, 1008, 1001, 1001,
			 1059, 1055, 1056,  158, 1060,  158,   58,  158,   58,  158,
			 1061, 1001, 1001, 1008, 1008, 1001, 1001, 1059, 1062,  158,
			 1060,  158, 1061, 1001, 1008, 1008, 1001, 1001, 1063, 1064,

			  158, 1065, 1001,  158, 1066, 1001, 1001, 1001, 1001, 1008,
			 1001, 1001, 1067, 1064,  158, 1065, 1001, 1066, 1001, 1001,
			 1001, 1008, 1001, 1001, 1067, 1068, 1001,  158, 1001, 1001,
			 1001, 1001, 1001, 1001, 1069, 1001, 1068, 1001, 1001, 1001,
			 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001,
			 1069, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001,
			 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001,
			 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001,
			 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001,
			 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			 1001,    0, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001,
			 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001,
			 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001,
			 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001,
			 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001,
			 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001,
			 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, 1001, yy_Dummy>>,
			1, 70, 1000)
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
			   79,   80,   64,   81,   82,   83,   84,    1,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,    1,    1,   88,   88,   88,   88,   88,   88,

			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   89,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   91,   92,   92,   92,   92,   92,   92,   92,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    3,    1,    4,    1,    5,    1,    1,
			    6,    7,    1,    1,    8,    9,    9,   10,   11,   11,
			   11,   11,   12,   13,    1,    1,   14,    1,   15,    1,
			   16,   16,   17,   16,   16,   16,   16,   16,   16,   16,
			   16,   16,   16,   16,   16,   16,   16,   16,   16,   18,
			   16,   16,   19,   20,   21,    5,    5,   11,   22,   22,
			   22,   22,   22,   22,   22,   22,   22,   22,   22,   22,
			   22,   22,   22,   23,   24,   25,   26,   27,   28,   29,
			   30,    5,    5,    5,    5,    1,    1,    1,    1,    1,
			    1,    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1001)
			yy_accept_template_1 (an_array)
			yy_accept_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_accept_template_1 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,    0,  107,  107,    0,    0,    0,
			    0,  138,  136,    1,    2,   15,  120,   18,  136,   16,
			   17,    7,    6,   13,    5,   11,    8,  112,  112,   14,
			   12,   28,   10,   29,   19,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,   92,  100,  100,  100,
			  100,   21,   30,   22,    9,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			   23,   20,   24,  124,  125,  126,  127,  124,  124,  124,
			  124,  124,  107,  110,  137,  107,   74,   74,   71,   74,
			   74,   82,   82,   79,   82,   82,    1,    2,   27,  120,

			  119,  134,  134,  134,    3,   32,  118,   31,  104,    0,
			    0,  112,    0,  112,   26,   25,  100,    0,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,   39,    0,  100,   99,   99,
			   91,   99,   99,  100,  100,  100,  100,  100,  100,    0,
			    0,    0,    0,    0,  111,    0,    0,    0,  103,    0,
			  103,  103,  103,    0,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,   39,  103,   39,  103,

			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  106,  124,  126,  125,  122,  121,  123,  124,  124,
			  124,  124,  107,  110,    0,  107,    0,    0,    0,  108,
			  109,    0,    0,   71,    0,    0,    0,    0,   79,    0,
			   78,    0,   77,   81,  134,  128,  134,  134,  134,  134,
			  134,  134,    4,   33,  118,    0,    0,    0,    0,    0,
			  114,    0,  112,    0,    0,    0,  100,  100,   38,  100,
			  100,  100,  100,  100,  100,  100,  100,    0,  100,  100,
			  100,  100,   41,  100,  100,   98,   92,   92,   92,   92,
			   99,  100,   99,   99,   99,  100,  100,  100,  100,  100,

			  100,   40,  100,    0,    0,    0,    0,    0,  102,  105,
			    0,  103,  103,   38,    0,    0,  103,  103,   38,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,    0,  103,  103,  103,   64,
			   64,  103,  103,  103,  103,   41,   41,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,   40,   40,  103,  103,  124,  124,  124,  124,  124,
			  124,  124,    0,  108,  109,   72,    0,    0,    0,    0,
			   80,   78,   77,   81,  132,  135,  135,  133,  129,  130,
			  131,  118,    0,  118,    0,    0,    0,    0,  114,    0,

			    0,    0,  117,  112,    0,    0,  101,  100,  100,  100,
			  100,  100,   37,  100,  100,  100,  100,    0,  100,  100,
			  100,  100,  100,  100,   91,  100,  100,  100,    0,   91,
			   91,   91,   36,    0,   43,  100,  100,  100,  100,   76,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   61,
			  103,  103,    0,    0,  103,  103,  103,  103,  103,  103,
			  103,  103,   37,  103,  103,   37,  103,  103,  103,  103,
			  103,  103,  103,  103,    0,  103,  103,  103,  103,  103,
			  103,  103,  103,   36,   43,   36,   43,  103,  103,  103,
			  103,  103,  103,  103,  109,    0,   70,    0,   69,   73,

			  118,    0,    0,    0,    0,  113,  114,    0,  115,    0,
			  117,    0,    0,    0,  112,   88,    0,   58,  100,  100,
			  100,  100,  100,  100,   44,  100,    0,  100,  100,   35,
			  100,  100,  100,    0,  100,  100,    0,  100,  100,  100,
			  100,    0,   75,    0,    0,    0,   65,    0,   66,    0,
			    0,    0,   63,    0,   62,    0,    0,    0,   58,  103,
			    0,    0,    0,    0,    0,   58,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,   44,  103,   44,
			  103,  103,   35,   64,   64,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,    0,

			  118,    0,    0,    0,    0,    0,    0,  114,  115,    0,
			    0,  117,    0,    0,    0,    0,   88,    0,  100,   59,
			  100,   60,  100,  100,   46,  100,    0,  100,  100,  100,
			  100,  100,   91,    0,   52,  100,  100,  100,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  103,
			    0,    0,    0,    0,    0,   59,   59,  103,   60,  103,
			   60,  103,  103,   46,  103,  103,   46,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,   52,  103,
			  103,  103,   52,  103,    0,    0,    0,    0,    0,  104,
			    0,  115,    0,  118,    0,   90,    0,    0,  116,  100,

			  100,   57,  100,   45,    0,   42,   56,   34,  100,   50,
			    0,  100,  100,  100,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  103,    0,    0,    0,    0,  103,
			  103,   57,  103,   57,  103,   45,   42,   56,   42,   56,
			   34,   34,  103,   50,  103,   50,  103,  103,  103,  103,
			    0,    0,    0,    0,    0,  115,    0,    0,    0,    0,
			   87,  116,  100,  100,  100,   95,  100,    0,  100,  100,
			   53,    0,    0,    0,    0,    0,    0,    0,   68,    0,
			    0,    0,    0,  105,  103,    0,    0,  103,  103,  103,
			  103,  103,  103,  103,  103,   53,  103,    0,    0,  117,

			    0,  117,    0,    0,    0,    0,   87,  116,  100,  100,
			   47,  100,   94,   51,  100,    0,    0,    0,   67,    0,
			    0,    0,    0,    0,    0,    0,  103,    0,  103,  103,
			   47,   47,  103,  103,   51,  103,   51,    0,  117,   89,
			    0,   87,  116,  100,  100,  100,  100,   93,   93,    0,
			    0,    0,    0,    0,  103,    0,  103,  103,  103,  103,
			  103,    0,    0,    0,  100,   49,   48,  100,    0,    0,
			    0,    0,    0,  103,    0,   49,   49,   48,   48,  103,
			    0,    0,    0,  100,  100,    0,    0,    0,    0,  103,
			    0,  103,    0,   86,  100,   54,    0,    0,    0,    0,

			  103,    0,    0,   54,    0,    0,    0,    0,   86,  100,
			    0,    0,    0,    0,  103,    0,    0,    0,    0,    0,
			    0,   55,    0,    0,    0,    0,    0,   55,    0,    0,
			    0,   85,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,   85,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,   84,   96,   97,    0,    0,    0,   83,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,   84,    0,
			    0,    0,    0,    0,    0,   84,    0,    0,    0,    0, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,    0, yy_Dummy>>,
			1, 2, 1000)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 4960
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 1001
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 1002
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

	yyNb_rules: INTEGER = 137
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 138
			-- End of buffer rule code

	yyLine_used: BOOLEAN = false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN = false
			-- Is `position' used?

	INITIAL: INTEGER = 0
	IN_STR: INTEGER = 1
	IN_REGEXP1: INTEGER = 2
	IN_EXPANDED_VALUE_SET_DEF: INTEGER = 3
	IN_EXTERNAL_VALUE_SET_DEF: INTEGER = 4
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

end
