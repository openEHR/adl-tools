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
if yy_act <= 104 then
if yy_act <= 87 then
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
if yy_act <= 83 then
if yy_act <= 81 then
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
	
end
else
if yy_act = 82 then
--|#line 397 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 397")
end
	-- Catch-all rules (no backing up)
			last_token := ERR_VALUE_SET_DEF
			set_start_condition (INITIAL)
	
else
--|#line 409 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 409")
end

		last_token := V_SLOT_FILLER
		last_string_value := text_substring (2, text_count - 1)
		last_string_value.prune_all(' ')
		last_string_value.prune_all('%T')
	
end
end
else
if yy_act <= 85 then
if yy_act = 84 then
--|#line 417 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 417")
end

		last_token := V_EXT_REF
		last_string_value := text_substring (2, text_count - 1)
		last_string_value.prune_all(' ')
		last_string_value.prune_all('%T')
	
else
--|#line 426 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 426")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
if yy_act = 86 then
--|#line 427 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 427")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 428 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 428")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
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
--|#line 435 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 435")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 436 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 436")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
else
--|#line 443 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 443")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
else
if yy_act = 91 then
--|#line 444 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 444")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
--|#line 451 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 451")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
end
else
if yy_act <= 94 then
if yy_act = 93 then
--|#line 452 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 452")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 464 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 464")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
if yy_act = 95 then
--|#line 474 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 474")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text_substring(2, text_count)
			
else
--|#line 479 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 479")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
end
end
end
else
if yy_act <= 100 then
if yy_act <= 98 then
if yy_act = 97 then
--|#line 489 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 489")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
				last_string_value.put('T', last_string_value.index_of(' ', 1))
			
else
--|#line 495 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 495")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
if yy_act = 99 then
--|#line 506 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 506")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN_ERR
				unread_character(last_string_value.item(last_string_value.count)) -- put back the last character 
				last_string_value := text
			
else
--|#line 515 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 515")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
end
end
else
if yy_act <= 102 then
if yy_act = 101 then
--|#line 521 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 521")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 527 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 527")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
end
else
if yy_act = 103 then
--|#line 533 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 533")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
else
--|#line 540 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 540")
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
--|#line 546 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 546")
end
		-- matches an absolute path string with segments of form "/attr_name" or "/attr_name[id-code]"
			last_token := V_ABS_PATH
			last_string_value := text
		
else
--|#line 552 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 552")
end
		-- matches a relative path string with segments of form "/attr_name" or "/attr_name[id-code]"
			last_token := V_REL_PATH
			last_string_value := text
		
end
else
--|#line 558 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 558")
end

			last_token := SYM_START_CBLOCK
			set_start_condition (IN_REGEXP1)
			in_buffer.append_character ('/')
		
end
else
if yy_act = 108 then
--|#line 565 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 565")
end
 		-- match segment consisting of non / or [
				in_buffer.append_string (text)
	
else
--|#line 569 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 569")
end
 		-- match [] segment
				in_buffer.append_string (text)
	
end
end
else
if yy_act <= 111 then
if yy_act = 110 then
--|#line 573 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 573")
end
 		-- match segment ending in quoted slashes '\/'
				in_buffer.append_string (text)
	
else
--|#line 577 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 577")
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
--|#line 589 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 589")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
else
--|#line 596 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 596")
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
--|#line 601 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 601")
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
--|#line 616 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 616")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
end
else
if yy_act = 116 then
--|#line 617 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 617")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
else
--|#line 621 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 621")
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
--|#line 622 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 622")
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
--|#line 623 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 623")
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
--|#line 643 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 643")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 648 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 648")
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
--|#line 656 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 656")
end
in_buffer.append_character ('\')
else
--|#line 658 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 658")
end
in_buffer.append_character ('"')
end
else
--|#line 660 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 660")
end

				in_buffer.append_string (text)
	
end
else
if yy_act = 125 then
--|#line 664 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 664")
end
in_buffer.append_string (text)
else
--|#line 666 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 666")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
end
else
if yy_act <= 128 then
if yy_act = 127 then
--|#line 671 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 671")
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
--|#line 682 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 682")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
else
if yy_act = 129 then
--|#line 690 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 690")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
--|#line 692 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 692")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
end
end
else
if yy_act <= 134 then
if yy_act <= 132 then
if yy_act = 131 then
--|#line 693 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 693")
end
last_token := V_CHARACTER; last_character_value := '%R'
else
--|#line 694 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 694")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 133 then
--|#line 695 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 695")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 696 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 696")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 136 then
if yy_act = 135 then
--|#line 698 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 698")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 699 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 699")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 137 then
--|#line 703 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 703")
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
--|#line 702 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 702")
end
terminate
when 1 then
--|#line 683 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 683")
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
			create an_array.make_filled (0, 0, 6068)
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
			  128,  117,  117,   89,  216,  122,  105,   89,  106,  106,
			  106,  106,  106,  106,  123,  117,  117,  117,  117,  132,
			   84,   85,   84,   85,  175,  118,  121,  148,  128,  119,
			  103,  120,  145,  122,   76,  176,  117,  146,  183,   76,
			  136,  215,  123,  215,  215,  237,   90,  132,  237,  117,
			   90,  217,  177,  118,  121,  237,  148,  119,  237,  120,
			  145,  278, 1044,  117,  178,  146,  184,  281,   77,   78,
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
			  109,  435,  110,  117,  111,  111,  111,  111,  111,  111,
			  109,  117,  110,  117,  113,  113,  113,  113,  113,  113,

			  117,  117,  117,  117,  124,  117,  126,  129,  130,  134,
			  192,  143,  194,  131,  208,  125,  972,  133,  127,  144,
			  313,  147,  135,  112,  241, 1032,  214,  241,  232, 1045,
			  214,  232,  124,  112,  126,  129,  130,  134,  193,  143,
			  195,  131,  209,  224,  125,  133,  127,  144,  313,  147,
			  135,  136,  137,  137,  137,  137,  137,  137,  169,  159,
			  117,  171,  196,  159,  179,  159,  159,  138,  204,  200,
			  172,  546,  159,  205,  139,  197,  180,  201,  210,  225,
			  226,  140,  117,  141,  233,  142,  170,  165,  214,  173,
			  198,  165,  181,  165,  165,  138,  206,  202,  174,  214,

			  165,  207,  139,  199,  182,  203,  219,  211,  218,  218,
			  218,  228,  141,  117,  142,  149,  149,  231,  214,  258,
			  149,  149,  270,  149,  149,  149,  149,  149,  149,  240,
			  185,  186,  240,  314,  240,  117,  187,  240,  117,  117,
			  117,  241,  242,  621,  621,  365,  241,  269,  229,  230,
			  270,  188,  243,  225,  226,  259,  267,  243,  189,  190,
			  426,  314,  149,  151,  191, 1041,  220,  220,  220,  418,
			 1033,  152,  153,  156,  365,  269,  156, 1005,  221,  221,
			  117,  157,  244,   96,  267,   96,   96,  244,  158,  159,
			  159,  159,  159,  159,  159,  160,  222,  222,  222,  271,

			  117,  159,  159,  159,  159,  159,  161,  159,  159,  159,
			  162,  159,  163,  159,  159,  159,  159,  159,  159,  159,
			  159,  159,  159,  159,  164,  303,  304,  271,  159,  165,
			  165,  165,  165,  165,  166,  165,  165,  165,  167,  165,
			  168,  165,  165,  165,  165,  165,  165,  165,  165,  165,
			  165,  165,  156, 1001,  303,  156,  117,  117,  117, 1006,
			  157,  260,  260,  260,  260,  260,  260,  158,  159,  159,
			  159,  159,  159,  159,  160, 1002,  273,  277,  282,  926,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159,

			  159,  159,  159,  164,  273,  277,  282,  159,  165,  165,
			  165,  165,  165,  165,  165,  165,  165,  165,  165,  165,
			  165,  165,  165,  165,  165,  165,  165,  165,  165,  165,
			  165,  247,  117,  255,  255,  255,  255,  255,  255,  285,
			  248,  248,  248,  248,  248,  248,  117,  315,  117,  256,
			  261,  261,  261,  261,  261,  261,  265,  265,  265,  265,
			  265,  265,  272,  931,  932,  279,  262,  285,  117,  934,
			  935,  215,  257,  215,  215,  315,  249,  256,  109,  117,
			  110,  268,  263,  263,  263,  263,  263,  263,  264,  117,
			  272,  250,  276,  279,  262,  251,  109,  252,  110, 1057,

			  263,  263,  263,  263,  263,  263,  117,  117,  117,  268,
			  283,  117,  274,  280,  284,  287,  117,  136,  275,  136,
			  276,  112,  288,  158,  296,  998,  117,  297,  117,  116,
			  302,  289,  996,  290,  992,  138,  117,  224,  283,  112,
			  274,  280,  284,  287,  117,  136,  275,  291,  991,  291,
			  288,  141,  296,  117,  117,  297,  117,  980,  302,  453,
			  289,  138,  290,  138,  301,  299,  298,  439,  156,  300,
			  313,  156,  314,  225,  226,  291,  157,  315,  321,  136,
			  141,  136,  292,  292,  292,  292,  292,  292,  117,  138,
			  117,  117,  301,  299,  298,  138,  321,  300,  318,  323,

			  319,  293,  139,  324,  294,  320,  321,  149,  149,  291,
			  295,  141,  149,  149,  149,  149,  950,  323,  324,  149,
			  149,  304,  365,  138,  322,  327,  327,  323,  304,  293,
			  139,  324,  294,  328,  333,  334,  149,  149,  295,  329,
			  141,  149,  149,  149,  149,  325,  326,  333,  149,  149,
			  304,  366,  328,  327,  330,  334,  338,  304,  329,  948,
			  339,  328,  333,  334,  306,  338,  339,  329,  341,  342,
			  342,  342,  342,  342,  345,  335,  941,  345,  347,  307,
			  331,  347,  349,  336,  338,  350,  332,  308,  339,  349,
			  350,  353,  354,  343,  344,  353,  354,  357,  359,  359,

			  363,  358,  345,  309, 1057,  346,  347,  363,  214,  348,
			  349,  243,  501,  350,  243,  501,  214,  351,  352,  353,
			  354,  214,  214,  355,  356,  357,  359,  362,  363,  358,
			  214,  231,  228,  357,  214,  364,  376,  358,  159,  159,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159,
			  159,  360,  304,  232,  625,  361,  232,  225,  226,  229,
			  230,  940,  836,  229,  230,  378,  379,  379,  379,  379,
			  379,  387,  388,  388,  388,  388,  388,  388,  117,  367,
			  368,  369,  370,  371,  218,  218,  218,  117,  993,  218, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  218,  218,  219,  240,  240,  112,  240,  240,  372,  372,
			  372,  837,  373,  373,  373,  241,  241,  117,  253,  233,
			  253,  253,  440,  394,  412,  394,  243,  243,  395,  395,
			  395,  395,  395,  395,  396,  396,  396,  396,  396,  396,
			  399,  399,  399,  399,  399,  399,  406,  406,  406,  406,
			  406,  440,  412,  905,  905,  905,  244,  244,  380,  381,
			  382,  380,  381,  380,  380,  380,  380,  380,  380,  380,
			  380,  383,  242,  242,  380,  242,  242,  242,  242,  242,
			  242,  380,  384,  380,  380,  380,  380,  242,  242,  242,
			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,

			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,
			  380,  380,  385,  380,  242,  242,  242,  242,  242,  242,
			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,
			  242,  242,  242,  242,  242,  242,  242,  242,  380,  380,
			  380,  380,  380,  380,  380,  380,  380,  380,  380,  380,
			  393,  393,  393,  393,  393,  393,  400,  400,  400,  400,
			  400,  400,  214,  117,  117,  455,  256,  928,  403,  927,
			  403,  409,  401,  404,  404,  404,  404,  404,  404,  109,
			  410,  110,  117,  405,  405,  405,  405,  405,  405,  257,
			  117,  117,  117,  455,  256,  402,  117,  117,  411,  409,

			  401,  407,  407,  407,  407,  407,  407,  117,  410,  415,
			  413,  416,  417,  419,  117,  414,  117,  117,  117,  424,
			  117,  456,  112,  423,  419,  455,  411,  420,  425,  421,
			  422,  915,  383,  382,  419,  383,  497,  415,  413,  416,
			  417,  221,  221,  414,  792,  136,  117,  424,  117,  456,
			  304,  423,  419,  459,  117,  420,  425,  421,  422,  427,
			  427,  427,  427,  427,  427,  497,  734,  117,  428,  428,
			  428,  428,  428,  428,  295,  456,  117,  429,  429,  429,
			  429,  429,  429,  117,  430,  117,  430, 1057,  426,  116,
			  116,  116,  116,  116,  116,  136,  117,  426,  434,  973,

			  117,  117,  295,  460,  117,  497,  426,  431,  436,  461,
			  432,  461,  463,  884,  437,  464,  433,  463,  294,  464,
			  438,  568,  569,  467,  295,  468,  434,  149,  149,  499,
			  570,  883,  442,  443,  498,  431,  436,  461,  432,  462,
			  463,  444,  437,  464,  433,  465,  294,  466,  438,  149,
			  149,  467,  295,  468,  442,  443,  877,  445,  446,  446,
			  446,  446,  446,  444,  149,  149,  374,  872,  469,  442,
			  443,  870,  447,  448,  448,  448,  448,  448,  444,  149,
			  149,  467,  468,  469,  442,  443,  473,  449,  450,  451,
			  451,  451,  451,  444,  149,  149,  469,  473,  476,  442,

			  443,  312,  477,  478,  476,  477,  214,  482,  444,  470,
			  471,  472,  482,  419,  473,  479,  214,  342,  342,  342,
			  342,  342,  342,  484,  419,  475,  476,  485,  484,  485,
			  477,  478,  480,  481,  419,  482,  488,  489,  488,  489,
			  483,  492,  493,  492,  452,  493,  214,  384,  382,  214,
			  384,  484,  419,  214,  117,  485,  486,  487,  503,  567,
			  500,  503,  117,  500,  488,  489,  490,  491,  567,  492,
			  493,  495,  501,  496,  502,  117,  558,  381,  382,  558,
			  381,  522,  117,  503,  218,  218,  218,  500,  567,  383,
			  500,  117,  617,  535,  220,  220,  220,  574,  610,  501,

			  384,  502,  568,  379,  379,  379,  379,  379,  379,  522,
			  503,  256,  158,  504,  387,  388,  388,  388,  388,  388,
			  388,  535,  626,  842,  222,  222,  222,  218,  218,  218,
			  385,  218,  218,  218,  257,  819,  819,  819,  819,  256,
			  504,  395,  395,  395,  395,  395,  395,  505,  505,  505,
			  505,  505,  505,  507,  507,  507,  507,  507,  507,  510,
			  510,  510,  510,  510,  510,  511,  511,  511,  511,  511,
			  511,  514,  514,  514,  514,  514,  514,  566,  840,  566,
			  117,  401,  512,  798,  512,  117,  506,  513,  513,  513,
			  513,  513,  513,  404,  404,  404,  404,  404,  404,  117,

			  962,  963,  795,  441,  402,  566,  441,  573,  523,  401,
			  515,  515,  515,  515,  515,  515,  517,  518,  524,  519,
			  519,  519,  519,  519,  519,  520,  520,  520,  520,  520,
			  520,  521,  521,  521,  521,  521,  521,  523,  117,  117,
			  117,  117,  117,  117,  531,  530,  524,  526,  117,  516,
			  525,  529,  117,  117,  117,  531,  547,  117,  117,  541,
			  532,  543,  527,  528,  575,  531,  575,  789,  534,  577,
			  541,  117,  578,  530,  533,  526,  536,  537,  525,  529,
			  541,  149,  149,  531,  577,  578,  149,  149,  532,  543,
			  527,  528,  575,  542,  576,  304,  534,  577,  541,  787,

			  578,  786,  533,  890,  536,  537,  292,  292,  292,  292,
			  292,  292,  579,  580,  117,  427,  427,  427,  427,  427,
			  427,  542,  117,  117,  428,  428,  428,  428,  428,  428,
			  287,  429,  429,  429,  429,  429,  429,  538,  538,  538,
			  538,  538,  538,  149,  149,  891,  289,  117,  149,  149,
			  117,  581,  117,  288,  544,  116,  117,  304,  287,  539,
			  539,  539,  539,  539,  539,  545,  582,  117,  540,  540,
			  540,  540,  540,  540,  117,  289,  117,  551,  117,  581,
			  551,  288,  544,  581,  116,  149,  149,  582,  585,  551,
			  442,  552,  551,  545,  582,  773,  149,  149,  899,  444,

			  553,  442,  555, 1057,  586,  585, 1057,  588,  589,  590,
			  444,  583,  553,  258,  588,  584,  585,  555,  589,  448,
			  448,  448,  448,  448,  448,  765, 1057,  899,  158,  595,
			  554,  551,  586,  587,  551,  588,  589,  590,  595,  149,
			  149,  556,  593,  597,  442,  552,  594,  446,  446,  446,
			  446,  446,  446,  444,  553,  557,  556,  595,  557,  931,
			  932,  740,  557,  149,  149,  557,  596,  558,  442,  559,
			  731,  597,  934,  935,  558,  117,  561,  444,  451,  451,
			  451,  451,  451,  451,  554, 1057,  557,  149,  149,  557,
			  610,  611,  442,  443,  975,  976,  977,  978,  558,  612,

			  559,  444,  451,  451,  451,  451,  451,  451,  560, 1057,
			  598,  723,  597,  568,  569,  562,  571,  572,  572,  572,
			  572,  572,  570,  591,  592,  592,  592,  592,  592,  598,
			  601,  602,  603,  601,  602,  563,  962,  963,  598,  560,
			  599,  500,  117,  604,  500,  378,  607,  607,  607,  607,
			  607,  557,  117,  501,  557,  975,  976,  600,  601,  602,
			  603,  605,  606,  558,  503,  608,  608,  608,  608,  608,
			  608,  604,  609,  609,  609,  609,  609,  609,  393,  393,
			  393,  393,  393,  393,  610,  611,  117,  613,  614,  614,
			  614,  614,  614,  612,  504,  615,  615,  615,  615,  615, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  615,  117,  645,  668,  506,  513,  513,  513,  513,  513,
			  513,  401,  616,  616,  616,  616,  616,  616,  618,  618,
			  618,  618,  618,  618,  619,  619,  619,  619,  619,  619,
			  645,  668,  117,  516,  402,  622,  700,  622,  506,  401,
			  620,  620,  620,  620,  620,  620,  623,  628,  117,  479,
			  117,  617,  615,  615,  615,  615,  615,  615,  627,  662,
			  668,  633,  518,  516,  519,  519,  519,  519,  519,  519,
			  117,  117,  117,  117,  624,  628,  117,  629,  630,  117,
			  631,  635,  117,  636,  670,  117,  627,  637,  669,  633,
			  977,  978,  632,  639,  538,  538,  538,  538,  538,  538,

			  117,  638,  665,  662,  441,  629,  630,  441,  631,  635,
			  117,  636,  670,  661,  117,  637,  641,  117,  642,  644,
			  632,  639,  640,  634,  117,  643,  430,  641,  430,  638,
			  539,  539,  539,  539,  539,  539,  117,  641,  117,  540,
			  540,  540,  540,  540,  540,  646,  642,  644,  553,  671,
			  640,  553,  432,  643,  109,  641,  646,  547,  433,  149,
			  149,  116,  149,  149,  648,  149,  647,  149,  443,  734,
			  735,  670,  671,  304,  546,  546,  444,  671,  736,  565,
			  432,  550,  149,  149,  646,  899,  433,  149,  149,  116,
			  650,  651,  651,  651,  651,  651,  304,  149,  149,  672,

			  673,  674,  149,  149,  652,  653,  654,  654,  654,  654,
			  654,  304,  149,  149,  900,  117,  117,  149,  149,  117,
			  656,  657,  657,  657,  657,  657,  304,  149,  149,  674,
			  117,  408,  149,  149,  509,  656,  658,  657,  657,  657,
			  657,  304,  149,  149,  568,  666,  674,  442,  443,  382,
			  680,  681,  675,  570,  568,  666,  444,  572,  572,  572,
			  572,  572,  572,  570,  676,  675,  479,  682,  592,  592,
			  592,  592,  592,  592,  677,  681,  682,  676,  680,  681,
			  675,  685,  685,  687,  667,  688,  687,  688,  691,  692,
			  693,  694,  676,  678,  667,  682,  691,  692,  569,  659,

			  117,  382,  375,  683,  684,  679,  570,  722,  494,  685,
			  686,  687,  494,  688,  689,  690,  691,  692,  693,  694,
			  500,  479,  474,  500,  695,  696,  697,  697,  697,  697,
			  697,  697,  501,  474,  502,  722,  607,  607,  607,  607,
			  607,  607,  458,  503,  610,  701,  710,  710,  710,  710,
			  710,  610,  701,  612,  614,  614,  614,  614,  614,  614,
			  612,  615,  615,  615,  615,  615,  615,  704,  704,  704,
			  704,  704,  704,  504,  454,  441,  739,  703,  705,  705,
			  705,  705,  705,  705,  702,  706,  706,  706,  706,  706,
			  706,  702,  707,  707,  707,  707,  707,  707,  708,  708,

			  708,  708,  708,  708,  739,  703,  617,  709,  709,  709,
			  709,  709,  709,  711,  711,  711,  711,  711,  711,  117,
			  117,  117,  117,  712,  713,  117,  717,  117,  117,  262,
			  714,  117,  744,  117,  117,  719,  715,  117,  716,  721,
			  725,  744,  117,  717,  727,  117,  903,  717,  718,  726,
			  117,  712,  713,  720,  746,  727,  724,  262,  714,  728,
			  744,  747,  746,  719,  715,  728,  716,  721,  725,  745,
			  728,  717,  117,  149,  149,  903,  718,  726,  149,  555,
			  728,  720,  746,  727,  724,  611,  735,  444,  930,  747,
			  748,  149,  149,  612,  736,  747,  149,  149,  728,  149,

			  149,  149,  149,  149,  149,  304,  551,  408,  750,  551,
			  398, 1057,  392,  557,  149,  149,  557,  930,  556,  149,
			  552,  149,  149,  749,  793,  558,  149,  559,  444,  553,
			  751, 1057,  794,  391, 1057,  444,  750,  752,  149,  742,
			  743,  743,  743,  743,  743,  555,  390,  654,  654,  654,
			  654,  654,  654,  389, 1057,  386,  149,  149,  751,  554,
			  551,  442,  443,  551,  239,  752,  560,  377,  149,  149,
			  733,  234,  751,  149,  552,  236,  651,  651,  651,  651,
			  651,  651,  444,  553,  556,  557,  734,  735,  557,  737,
			  738,  738,  738,  738,  738,  736,  374,  558,  375,  559,

			  753,  657,  657,  657,  657,  657,  657,  557, 1057,  752,
			  557,  755,  755,  554,  757,  758,  757,  758,  761,  558,
			  762,  561,  763,  657,  657,  657,  657,  657,  657,  761,
			 1057,  608,  608,  608,  608,  608,  608,  754,  560,  755,
			  756,  374,  757,  758,  759,  760,  761,  117,  762,  214,
			  763,  767,  768,  768,  768,  768,  768,  764,  784,  769,
			  562,  769,  772,  340,  770,  770,  770,  770,  770,  770,
			  770,  770,  770,  770,  770,  770,  771,  771,  771,  771,
			  771,  771,  340,  337,  278,  402,  784,  317,  312,  310,
			  772,  619,  619,  619,  619,  619,  619,  774,  774,  774,

			  774,  774,  774,  775,  775,  775,  775,  775,  775,  617,
			  776,  776,  776,  776,  776,  776,  117,  117,  117,  780,
			  117,  782,  117,  117,  779,  801,  772,  804,  783,  804,
			  778,  785,  792,  793,  155,  777,  780,  781,  782,  304,
			  780,  794,  782,  790,  791,  791,  791,  791,  791,  402,
			  806,  286,  779,  801,  772,  804,  783,  805,  778,  785,
			  734,  799,  666,  777,  780,  781,  782,  149,  149,  736,
			  570,  806,  149,  149,  808,  808,  810,  811,  806,  734,
			  799,  304,  738,  738,  738,  738,  738,  738,  736,  666,
			  812,  743,  743,  743,  743,  743,  743,  570,  810,  807,

			  800,  667,  808,  809,  810,  811,  701,  770,  770,  770,
			  770,  770,  770,  117,  612,  846,  254,  253,  812,  800,
			  770,  770,  770,  770,  770,  770,  813,  701,  667,  768,
			  768,  768,  768,  768,  768,  612,  816,  816,  816,  816,
			  816,  816,  817,  846,  817,  702,  246,  818,  818,  818,
			  818,  818,  818,  820,  820,  820,  820,  820,  820,  821,
			  822,  821,  822,  117,  829,  100,  702,  824,  824,  824,
			  824,  824,  824,  117,  117,  826,  848,  848,  117,  825,
			  117,  829,  827,  772,  828,  829,  117,  830,   97,  239,
			  236,  235,  832,  833,  831,  850,  832,  833,  823,  841,

			  850,  852,  841,  826,  848,  849,  402,  825,  852,  829,
			  827,  772,  828,  832,  833,  830,  844,  845,  845,  845,
			  845,  845,  831,  850,  832,  833,  149,  149,  851,  852,
			  854,  149,  834,  855,  854,  234,  853,  117,  214,  836,
			  304,  791,  791,  791,  791,  791,  791,  212,  863,  155,
			  117,  115,  547,  114,  117,  107,  117,  104,  854,  100,
			   98,  855,  856,  818,  818,  818,  818,  818,  818,  858,
			  858,  858,  858,  858,  858,  864,  863,  866,  837,  859,
			  859,  859,  859,  859,  859,  624,  624,  624,  624,  624,
			  624,  860,  860,  860,  860,  860,  860,  861,  861,  861, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  861,  861,  861,  864,   97,  866, 1057,  117,  617,  862,
			  862,  862,  862,  862,  862,  865,  841,  867,  868,  841,
			 1057,  867,  868,  149,  149,  772, 1057, 1057,  149,  149,
			 1057,  149,  149,  149,  149,  149,  149,  304,  867,  868,
			 1057, 1057, 1057,  865,  799,  876,  878,  878,  402,  867,
			  868,  880,  736,  772,  790,  871,  871,  871,  871,  871,
			  799,  880,  845,  845,  845,  845,  845,  845,  736,  547,
			  149, 1057,  882,  876,  878,  879, 1057,  117, 1057,  880,
			  897, 1057, 1057,  800, 1057,  117,  117, 1057,  117,  881,
			  816,  816,  816,  816,  816,  816,  886,  888,  901,  800,

			  882,  885,  885,  885,  885,  885,  885,  821,  897,  821,
			  887,  889,  861,  861,  861,  861,  861,  861,  862,  862,
			  862,  862,  862,  862,  886,  888,  901,  149,  149,  617,
			  901, 1057,  149,  149,  117,  909,  117, 1057,  916,  887,
			  889,  304,  918,  909,  933,  836,  823,  871,  871,  871,
			  871,  871,  871,  908,  117,  907,  909,  910,  902,  906,
			  906,  906,  906,  906,  906,  910,  916,  117,  149,  149,
			  918,  909,  933,  911,  912,  922, 1057, 1057,  910,  921,
			 1057,  908,  304,  907,  837,  920,  920,  920,  920,  920,
			  920, 1057,  923,  910,  823,  823,  823,  823,  823,  823,

			  923,  924, 1057,  922,  117,  149,  149,  946,  921,  924,
			  149,  149,  936,  923,  936, 1057, 1057, 1057,  964,  304,
			 1057,  939,  924,  937,  149,  149, 1057, 1057,  923,  911,
			  912, 1057, 1057, 1057, 1057,  946, 1057,  924,  304,  942,
			  942,  942,  942,  942,  942,  304,  964, 1057, 1057,  939,
			 1057,  938,  951,  951,  951,  951,  951,  951,  952,  952,
			  952,  952,  952,  117,  954,  955, 1009, 1009, 1009, 1009,
			 1009,  953, 1057, 1057, 1057,  954,  955,  965,  965,  965,
			  965,  965,  965, 1057, 1057,  954,  955,  956, 1057,  957,
			  958, 1057,  942,  942,  942,  942,  942,  942,  304,  953,

			 1057, 1057, 1057,  954,  955,  966,  966,  966,  966,  966,
			  966,  967,  967,  967,  967,  967,  967,  968,  968,  968,
			  968,  968,  968,  969,  970, 1057, 1057, 1057, 1057,  959,
			 1057, 1057, 1057, 1057,  969,  970,  971,  971,  971,  971,
			  971,  971, 1057, 1057,  969,  970,  974,  974,  974,  974,
			  974,  974,  304,  987,  987,  987,  987,  987,  987, 1057,
			 1057, 1057,  969,  970,  981, 1057,  982,  983, 1057,  965,
			  965,  965,  965,  965,  965,  984, 1057,  985,  986, 1057,
			  966,  966,  966,  966,  966,  966,  988, 1057,  988, 1057,
			 1057, 1057, 1057, 1057,  972, 1057, 1057,  989,  971,  971,

			  971,  971,  971,  971, 1057, 1057,  667,  971,  971,  971,
			  971,  971,  971,  956, 1057,  957,  994,  702,  974,  974,
			  974,  974,  974,  974,  304,  990,  999,  999,  999,  999,
			  999,  999, 1057, 1057, 1057,  959, 1000, 1000, 1000, 1000,
			 1000, 1000, 1003, 1003, 1003, 1003, 1003, 1003, 1004, 1004,
			 1004, 1004, 1004, 1004, 1057,  959, 1007, 1007, 1007, 1007,
			 1007, 1007,  938,  938,  938,  938,  938,  938, 1008, 1008,
			 1008, 1008, 1008, 1008, 1010, 1011, 1012, 1012, 1012, 1012,
			 1012, 1012,  304, 1013, 1013, 1013, 1013, 1013, 1013,  304,
			 1057, 1010, 1011, 1057, 1001, 1010, 1011, 1014, 1014, 1014,

			 1014, 1014, 1014, 1057, 1057, 1057, 1005, 1015, 1015, 1015,
			 1015, 1015, 1015, 1000, 1000, 1000, 1000, 1000, 1000, 1010,
			 1011, 1016, 1057, 1017, 1018, 1057,  999,  999,  999,  999,
			  999,  999, 1000, 1000, 1000, 1000, 1000, 1000,  981, 1057,
			  982, 1019, 1057, 1003, 1003, 1003, 1003, 1003, 1003, 1057,
			  667, 1004, 1004, 1004, 1004, 1004, 1004, 1004, 1004, 1004,
			 1004, 1004, 1004,  800,  984, 1057,  985, 1020, 1057, 1007,
			 1007, 1007, 1007, 1007, 1007, 1057, 1057, 1057, 1023, 1024,
			  667, 1021, 1021, 1021, 1021, 1021, 1021, 1057,  702, 1022,
			 1022, 1022, 1022, 1022, 1022, 1023, 1024, 1057, 1057, 1023,

			 1024, 1057, 1057, 1057, 1057, 1057,  702, 1012, 1012, 1012,
			 1012, 1012, 1012,  304, 1031, 1031, 1031, 1031, 1031, 1031,
			  956, 1057,  957, 1023, 1024, 1013, 1013, 1013, 1013, 1013,
			 1013,  304,  956, 1057, 1025, 1026, 1057, 1014, 1014, 1014,
			 1014, 1014, 1014, 1027,  959, 1028, 1029, 1057, 1015, 1015,
			 1015, 1015, 1015, 1015, 1034, 1034, 1034, 1034, 1034, 1034,
			 1057, 1057,  959, 1035, 1035, 1035, 1035, 1035, 1035, 1057,
			 1057, 1057, 1032, 1057,  959, 1036, 1036, 1036, 1036, 1036,
			 1036, 1038, 1039, 1038, 1039, 1030, 1037, 1037, 1037, 1037,
			 1037, 1037, 1042, 1042, 1042, 1042, 1042, 1042, 1043, 1043,

			 1043, 1043, 1043, 1043, 1046, 1046, 1046, 1046, 1046, 1046,
			 1031, 1031, 1031, 1031, 1031, 1031, 1057, 1057, 1057, 1057,
			 1040, 1031, 1031, 1031, 1031, 1031, 1031, 1016, 1057, 1017,
			 1047, 1057, 1034, 1034, 1034, 1034, 1034, 1034, 1057, 1057,
			 1057, 1057, 1057,  981, 1057,  982, 1057,  800, 1035, 1035,
			 1035, 1035, 1035, 1035, 1057,  984, 1044,  985, 1057, 1057,
			 1036, 1036, 1036, 1036, 1036, 1036, 1057, 1057, 1057,  800,
			  990,  990,  990,  990,  990,  990, 1048, 1048, 1048, 1048,
			 1048, 1048, 1057, 1057, 1057,  667, 1049, 1049, 1049, 1049,
			 1049, 1049, 1057,  956, 1057, 1025, 1050,  702, 1042, 1042,

			 1042, 1042, 1042, 1042, 1043, 1043, 1043, 1043, 1043, 1043,
			 1043, 1043, 1043, 1043, 1043, 1043, 1027, 1057, 1028, 1051,
			 1057, 1046, 1046, 1046, 1046, 1046, 1046, 1052, 1052, 1052,
			 1052, 1052, 1052, 1057, 1057,  959, 1057, 1057, 1057, 1057,
			 1057, 1030, 1053, 1053, 1053, 1053, 1053, 1053, 1054, 1054,
			 1054, 1054, 1054, 1054, 1038, 1057, 1038, 1057, 1030, 1049,
			 1049, 1049, 1049, 1049, 1049, 1055, 1055, 1055, 1055, 1055,
			 1055, 1016, 1057, 1017, 1057, 1057, 1052, 1052, 1052, 1052,
			 1052, 1052, 1056, 1056, 1056, 1056, 1056, 1056, 1057,  956,
			 1057, 1025, 1057, 1040, 1054, 1054, 1054, 1054, 1054, 1054,

			 1027, 1057, 1028, 1057, 1057, 1055, 1055, 1055, 1055, 1055,
			 1055, 1057, 1057,  800, 1040, 1040, 1040, 1040, 1040, 1040,
			  311,  311,  311,  311,  311,  311,  311,  311,  311, 1057,
			 1057,  959, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057,
			 1057, 1057, 1030,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			   82,   82,   82,   82,   82,   82,   82,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   99,
			   99, 1057,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			 1057,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,  101,  101, 1057,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,

			  101,  101,  101,  108, 1057, 1057, 1057, 1057, 1057, 1057,
			 1057, 1057, 1057, 1057, 1057, 1057, 1057,  108,  108,  108,
			  108,  108,  108,  108,  108,  108,  116,  116, 1057,  116,
			 1057,  116,  116,  116,  116,  116, 1057, 1057, 1057,  116,
			  116,  116,  116,  116,  116,  116,  116,  116,  150,  150,
			 1057,  150, 1057,  150,  150, 1057, 1057, 1057,  150,  150,
			  150,  150,  150, 1057, 1057, 1057,  150,  150,  150,  150,
			  150,  150,  150,  150,  150,  154,  154, 1057,  154,  154,
			  154,  154,  154,  154,  154,  154,  154,  154,  154,  154,
			  154,  154,  154,  154,  154,  154,  154,  154,  154,  154,

			  154,  154,  154,  154,  154,  154,  154,  213,  213, 1057,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  213,  213, 1057,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,

			  227,  227,  227,  238, 1057,  238, 1057, 1057, 1057, 1057,
			  238, 1057,  238,  238, 1057, 1057, 1057,  238,  238,  238,
			  238,  238, 1057, 1057, 1057,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  245,  245, 1057,  245,  245,  245,
			  245,  245,  245,  245,  245,  245,  245,  245,  245,  245,
			  245,  245,  245,  245,  245,  245,  245,  245,  245,  245,
			  245,  245,  245,  245,  245,  245,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  108,  108,

			  108, 1057, 1057, 1057,  108,  108,  108,  108,  108,  108,
			 1057, 1057,  108,  108,  108,  108,  108,  108,  108,  108,
			  108,  266, 1057, 1057,  266,  266, 1057,  266,  266,  266,
			  266,  266,  266,  266, 1057, 1057, 1057,  266,  266,  266,
			  266,  266,  266,  266,  266,  266,  149,  149, 1057,  149,
			 1057,  149,  149,  149, 1057, 1057,  149,  149,  149,  149,
			  149, 1057, 1057, 1057,  149,  149,  149,  149,  149,  149,
			  149,  149,  149,  305,  305, 1057,  305, 1057,  305,  305,
			  305, 1057, 1057,  305,  305,  305,  305,  305, 1057, 1057,
			 1057,  305,  305,  305,  305,  305,  305,  305,  305,  305,

			  316,  316,  316,  316,  316, 1057, 1057, 1057,  316,  316,
			  316,  316,  316,  316,  316,  316,  316,  225,  225,  225,
			  225,  225,  225,  225,  225,  225, 1057,  225,  225,  225,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  228,
			  228,  228,  228,  228,  228,  228,  228,  228,  228,  228,
			  228,  228,  228,  228,  228,  228,  228,  228,  228,  228,
			  228,  228,  228,  228,  228,  228,  228,  228,  228,  228,
			  228,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,

			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  397,  397,  397,  397,  397, 1057, 1057,
			 1057,  397,  397,  397,  397,  397,  397,  397,  397,  397,
			  311,  311,  311, 1057, 1057, 1057,  311,  311,  311,  311,
			  311,  311, 1057, 1057,  311,  311,  311,  311,  311,  311,
			  311,  311,  311,  457,  457, 1057, 1057, 1057,  457,  457,
			  457,  457,  457, 1057, 1057, 1057,  457,  457,  457,  457,
			  457,  457,  457,  457,  457,  380,  380,  380,  380,  380,
			  380,  380,  380,  380,  380,  380,  380,  380,  380,  380,
			  380,  380,  380,  380,  380,  380,  380,  380,  380,  380,

			  380,  380,  380,  380,  380,  380,  380,  508,  508, 1057,
			 1057, 1057,  508,  508,  508,  508,  508, 1057, 1057, 1057,
			  508,  508,  508,  508,  508,  508,  508,  508,  508,  548,
			  548, 1057,  548, 1057,  548,  548,  548, 1057, 1057,  548,
			  548,  548,  548,  548, 1057, 1057, 1057,  548,  548,  548,
			  548,  548,  548,  548,  548,  548,  549,  549, 1057,  549,
			 1057,  549,  549,  549, 1057, 1057,  549,  549,  549,  549,
			  549, 1057, 1057, 1057,  549,  549,  549,  549,  549,  549,
			  549,  549,  549,  564,  564,  564,  564,  564, 1057, 1057,
			 1057,  564,  564,  564,  564,  564,  564,  564,  564,  564,

			  454,  454,  454, 1057, 1057,  454,  454,  454,  454,  454,
			  454,  454,  454, 1057, 1057,  454,  454,  454,  454,  454,
			 1057, 1057, 1057,  454,  454,  454,  454,  454,  454,  454,
			  454,  454,  649, 1057,  649, 1057, 1057, 1057, 1057, 1057,
			 1057, 1057, 1057, 1057, 1057, 1057,  649,  649,  649,  649,
			  649, 1057, 1057,  649,  649,  649,  649,  649,  649,  649,
			  649,  649,  649,  655, 1057,  655, 1057, 1057, 1057, 1057,
			 1057, 1057, 1057, 1057, 1057, 1057, 1057,  655,  655,  655,
			  655,  655, 1057, 1057, 1057,  655,  655,  655,  655,  655,
			  655,  655,  655,  655,  660,  660, 1057, 1057, 1057,  660,

			  660,  660,  660,  660, 1057, 1057, 1057,  660,  660,  660,
			  660,  660,  660,  660,  660,  660,  663,  663, 1057, 1057,
			 1057,  663,  663,  663,  663,  663, 1057, 1057, 1057,  663,
			  663,  663,  663,  663,  663,  663,  663,  663,  664,  664,
			 1057, 1057, 1057,  664,  664,  664,  664,  664, 1057, 1057,
			 1057,  664,  664,  664,  664,  664,  664,  664,  664,  664,
			  698,  698, 1057, 1057, 1057,  698,  698,  698,  698,  698,
			 1057, 1057, 1057,  698,  698,  698,  698,  698,  698,  698,
			  698,  698,  699,  699, 1057, 1057, 1057,  699,  699,  699,
			  699,  699, 1057, 1057, 1057,  699,  699,  699,  699,  699, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  699,  699,  699,  699,  729,  729, 1057,  729, 1057,  729,
			  729,  729, 1057, 1057,  729,  729,  729,  729,  729, 1057,
			 1057, 1057,  729,  729,  729,  729,  729,  729,  729,  729,
			  729,  730,  730, 1057, 1057, 1057,  730,  730,  730,  730,
			  730, 1057, 1057, 1057,  730,  730,  730,  730,  730,  730,
			  730,  730,  730,  732,  732, 1057, 1057, 1057,  732,  732,
			  732,  732,  732, 1057, 1057, 1057,  732,  732,  732,  732,
			  732,  732,  732,  732,  732,  741,  741,  741,  741,  741,
			 1057, 1057, 1057,  741,  741,  741,  741,  741,  741,  741,
			  741,  741,  766,  766,  766,  766,  766, 1057, 1057, 1057,

			  766,  766,  766,  766,  766,  766,  766,  766,  766,  788,
			  788, 1057,  788, 1057,  788,  788,  788, 1057, 1057,  788,
			  788,  788,  788,  788, 1057, 1057, 1057,  788,  788,  788,
			  788,  788,  788,  788,  788,  788,  796,  796, 1057, 1057,
			 1057,  796,  796,  796,  796,  796, 1057, 1057, 1057,  796,
			  796,  796,  796,  796,  796,  796,  796,  796,  797,  797,
			 1057, 1057, 1057,  797,  797,  797,  797,  797, 1057, 1057,
			 1057,  797,  797,  797,  797,  797,  797,  797,  797,  797,
			  802,  802,  802,  802,  802, 1057, 1057, 1057,  802,  802,
			  802,  802,  802,  802,  802,  802,  802,  803,  803, 1057,

			 1057, 1057,  803,  803,  803,  803,  803, 1057, 1057, 1057,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  814,
			  814,  814,  814,  814, 1057, 1057, 1057,  814,  814,  814,
			  814,  814,  814,  814,  814,  814,  815,  815, 1057, 1057,
			 1057,  815,  815,  815,  815,  815, 1057, 1057, 1057,  815,
			  815,  815,  815,  815,  815,  815,  815,  815,  835,  835,
			 1057, 1057, 1057,  835,  835,  835,  835,  835, 1057, 1057,
			 1057,  835,  835,  835,  835,  835,  835,  835,  835,  835,
			  838,  838, 1057, 1057, 1057,  838,  838,  838,  838,  838,
			 1057, 1057, 1057,  838,  838,  838,  838,  838,  838,  838,

			  838,  838,  839,  839, 1057, 1057, 1057,  839,  839,  839,
			  839,  839, 1057, 1057, 1057,  839,  839,  839,  839,  839,
			  839,  839,  839,  839,  843,  843,  843,  843,  843, 1057,
			 1057, 1057,  843,  843,  843,  843,  843,  843,  843,  843,
			  843,  847,  847, 1057, 1057, 1057,  847,  847,  847,  847,
			  847, 1057, 1057, 1057,  847,  847,  847,  847,  847,  847,
			  847,  847,  847,  857,  857, 1057, 1057, 1057,  857,  857,
			  857,  857,  857, 1057, 1057, 1057,  857,  857,  857,  857,
			  857,  857,  857,  857,  857,  869,  869, 1057,  869, 1057,
			  869,  869,  869, 1057, 1057,  869,  869,  869,  869,  869,

			 1057, 1057, 1057,  869,  869,  869,  869,  869,  869,  869,
			  869,  869,  873,  873,  873,  873,  873, 1057, 1057, 1057,
			  873,  873,  873,  873,  873,  873,  873,  873,  873,  874,
			  874,  874,  874,  874, 1057, 1057, 1057,  874,  874,  874,
			  874,  874,  874,  874,  874,  874,  875,  875, 1057, 1057,
			 1057,  875,  875,  875,  875,  875, 1057, 1057, 1057,  875,
			  875,  875,  875,  875,  875,  875,  875,  875,  892,  892,
			 1057,  892, 1057,  892,  892,  892, 1057, 1057,  892,  892,
			  892,  892,  892, 1057, 1057, 1057,  892,  892,  892,  892,
			  892,  892,  892,  892,  892,  893,  893,  893,  893,  893,

			 1057, 1057, 1057,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  894,  894,  894,  894,  894, 1057, 1057, 1057,
			  894,  894,  894,  894,  894,  894,  894,  894,  894,  895,
			  895, 1057, 1057, 1057,  895,  895,  895,  895,  895, 1057,
			 1057, 1057,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  896,  896, 1057, 1057, 1057,  896,  896,  896,  896,
			  896, 1057, 1057, 1057,  896,  896,  896,  896,  896,  896,
			  896,  896,  896,  898,  898,  898,  898,  898, 1057, 1057,
			 1057,  898,  898,  898,  898,  898,  898,  898,  898,  898,
			  904,  904,  904,  904,  904, 1057, 1057, 1057,  904,  904,

			  904,  904,  904,  904,  904,  904,  904,  913,  913, 1057,
			 1057, 1057,  913,  913,  913,  913,  913, 1057, 1057, 1057,
			  913,  913,  913,  913,  913,  913,  913,  913,  913,  914,
			  914, 1057, 1057, 1057,  914,  914,  914,  914,  914, 1057,
			 1057, 1057,  914,  914,  914,  914,  914,  914,  914,  914,
			  914,  917,  917, 1057, 1057, 1057,  917,  917,  917,  917,
			  917, 1057, 1057, 1057,  917,  917,  917,  917,  917,  917,
			  917,  917,  917,  919,  919, 1057, 1057, 1057,  919,  919,
			  919,  919,  919, 1057, 1057, 1057,  919,  919,  919,  919,
			  919,  919,  919,  919,  919,  925,  925, 1057,  925, 1057,

			  925,  925,  925, 1057, 1057,  925,  925,  925,  925,  925,
			 1057, 1057, 1057,  925,  925,  925,  925,  925,  925,  925,
			  925,  925,  149,  149, 1057,  149, 1057,  149,  149,  149,
			 1057, 1057,  149,  149,  149,  149,  149, 1057, 1057, 1057,
			  149,  149,  149,  149,  149,  149,  149,  149,  149,  929,
			  929,  929,  929,  929, 1057, 1057, 1057,  929,  929,  929,
			  929,  929,  929,  929,  929,  929,  943,  943,  943,  943,
			  943, 1057, 1057, 1057,  943,  943,  943,  943,  943,  943,
			  943,  943,  943,  944,  944,  944,  944,  944, 1057, 1057,
			 1057,  944,  944,  944,  944,  944,  944,  944,  944,  944,

			  945,  945, 1057, 1057, 1057,  945,  945,  945,  945,  945,
			 1057, 1057, 1057,  945,  945,  945,  945,  945,  945,  945,
			  945,  945,  947,  947, 1057, 1057, 1057,  947,  947,  947,
			  947,  947, 1057, 1057, 1057,  947,  947,  947,  947,  947,
			  947,  947,  947,  947,  949,  949, 1057, 1057, 1057,  949,
			  949,  949,  949,  949, 1057, 1057, 1057,  949,  949,  949,
			  949,  949,  949,  949,  949,  949,  960,  960, 1057, 1057,
			 1057,  960,  960,  960,  960,  960, 1057, 1057, 1057,  960,
			  960,  960,  960,  960,  960,  960,  960,  960,  961,  961,
			 1057, 1057, 1057,  961,  961,  961,  961,  961, 1057, 1057,

			 1057,  961,  961,  961,  961,  961,  961,  961,  961,  961,
			  979,  979, 1057, 1057, 1057,  979,  979,  979,  979,  979,
			 1057, 1057, 1057,  979,  979,  979,  979,  979,  979,  979,
			  979,  979,  995,  995, 1057, 1057, 1057,  995,  995,  995,
			  995,  995, 1057, 1057, 1057,  995,  995,  995,  995,  995,
			  995,  995,  995,  995,  997,  997, 1057, 1057, 1057,  997,
			  997,  997,  997,  997, 1057, 1057, 1057,  997,  997,  997,
			  997,  997,  997,  997,  997,  997,   11, 1057, 1057, 1057,
			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057,
			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, yy_Dummy>>,
			1, 1000, 5000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057,
			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057,
			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057,
			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057,
			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057,
			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057,
			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, yy_Dummy>>,
			1, 69, 6000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 6068)
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
			    1,    1,    1,    3,    5,   18,    6,    3,    4,   41,

			    7,    7,    4,    7,    8,    8,   13,    8,   13,   13,
			   41,   37,   50,    7,   76,   37,   25,    8,   25,   25,
			   25,   25,   25,   25,   37,   43,   35,   48,   36,   43,
			    5,    5,    6,    6,   59,   35,   36,   50,   41,   35,
			   18,   35,   48,   37,    3,   59,  131,   48,   61,    4,
			  295,   74,   37,   74,   74,   92,    7,   43,   92,  295,
			    8,   76,   59,   35,   36,  237,   50,   35,  237,   35,
			   48,  128, 1045,  128,   59,   48,   61,  131,    3,    3,
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
			   27,  297,   27,  297,   27,   27,   27,   27,   27,   27,
			   28,   39,   28,   42,   28,   28,   28,   28,   28,   28,

			   47,   44,   40,   45,   39,   49,   40,   42,   42,   45,
			   63,   47,   64,   42,   68,   39, 1041,   44,   40,   47,
			  161,   49,   45,   27,  241, 1033,   78,  241,   87, 1028,
			   77,   87,   39,   28,   40,   42,   42,   45,   63,   47,
			   64,   42,   68,   82,   39,   44,   40,   47,  161,   49,
			   45,   46,   46,   46,   46,   46,   46,   46,   56,   56,
			   46,   57,   65,   56,   60,   56,   57,   46,   67,   66,
			   57,  440,   57,   67,   46,   65,   60,   66,   69,   82,
			   82,   46,  440,   46,   87,   46,   56,   56,   79,   57,
			   65,   56,   60,   56,   57,   46,   67,   66,   57,   80,

			   57,   67,   46,   65,   60,   66,   78,   69,   77,   77,
			   77,   84,   46,  121,   46,   51,   51,   85,   81,  108,
			   51,   51,  121,   51,   51,   51,   51,   51,   51,   94,
			   62,   62,   94,  162,   95,  118,   62,   95,  277,  287,
			  120,   94,   94,  517,  517,  210,   95,  120,   84,   84,
			  121,   62,   94,   85,   85,  108,  118,   95,   62,   62,
			  287,  162,   51,   51,   62, 1025,   79,   79,   79,  277,
			 1017,   51,   51,   55,  210,  120,   55, 1006,   80,   80,
			  122,   55,   94,   96,  118,   96,   96,   95,   55,   55,
			   55,   55,   55,   55,   55,   55,   81,   81,   81,  122,

			  148,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,  148,  912,  122,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   58, 1002,  148,   58,  124,  132,  127,  985,
			   58,  109,  109,  109,  109,  109,  109,   58,   58,   58,
			   58,   58,   58,   58,   58,  982,  124,  127,  132,  912,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,

			   58,   58,   58,   58,  124,  127,  132,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,  103,  135,  106,  106,  106,  106,  106,  106,  135,
			  103,  103,  103,  103,  103,  103,  123,  163,  129,  106,
			  110,  110,  110,  110,  110,  110,  112,  112,  112,  112,
			  112,  112,  123,  917,  917,  129,  110,  135,  119,  919,
			  919,  215,  106,  215,  215,  163,  103,  106,  111,  126,
			  111,  119,  111,  111,  111,  111,  111,  111,  111,  133,
			  123,  103,  126,  129,  110,  103,  113,  103,  113,  137,

			  113,  113,  113,  113,  113,  113,  125,  130,  134,  119,
			  133,  147,  125,  130,  134,  137,  143,  138,  125,  139,
			  126,  111,  137,  311,  143,  978,  138,  143,  139,  137,
			  147,  137,  976,  137,  970,  139,  301,  223,  133,  113,
			  125,  130,  134,  137,  144,  141,  125,  138,  969,  139,
			  137,  139,  143,  145,  141,  143,  146,  963,  147,  311,
			  137,  141,  137,  139,  146,  145,  144,  301,  156,  145,
			  166,  156,  167,  223,  223,  141,  156,  168,  169,  142,
			  139,  140,  140,  140,  140,  140,  140,  140,  142,  141,
			  140,  953,  146,  145,  144,  142,  170,  145,  166,  171,

			  167,  140,  142,  172,  140,  168,  169,  150,  150,  142,
			  140,  142,  150,  150,  151,  151,  935,  173,  174,  151,
			  151,  150,  211,  142,  170,  175,  177,  171,  151,  140,
			  142,  172,  140,  176,  179,  180,  152,  152,  140,  176,
			  142,  152,  152,  153,  153,  173,  174,  181,  153,  153,
			  152,  211,  178,  175,  177,  182,  185,  153,  178,  932,
			  186,  176,  179,  180,  151,  189,  190,  176,  188,  188,
			  188,  188,  188,  188,  192,  181,  924,  193,  194,  151,
			  178,  195,  196,  182,  185,  197,  178,  152,  186,  198,
			  199,  200,  201,  189,  190,  202,  203,  204,  205,  207,

			  208,  204,  192,  153,  159,  193,  194,  209,  218,  195,
			  196,  243,  501,  197,  243,  501,  219,  198,  199,  200,
			  201,  220,  368,  202,  203,  204,  205,  207,  208,  204,
			  221,  226,  227,  206,  222,  209,  229,  206,  159,  159,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159,
			  159,  206,  973,  232,  521,  206,  232,  226,  226,  227,
			  227,  923,  790,  229,  229,  236,  236,  236,  236,  236,
			  236,  248,  248,  248,  248,  248,  248,  248,  922,  218,
			  218,  218,  218,  218,  219,  219,  219,  303,  973,  220, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  220,  220,  368,  238,  240,  521,  238,  240,  221,  221,
			  221,  790,  222,  222,  222,  238,  240,  271,  253,  232,
			  253,  253,  303,  256,  271,  256,  238,  240,  256,  256,
			  256,  256,  256,  256,  257,  257,  257,  257,  257,  257,
			  260,  260,  260,  260,  260,  260,  264,  264,  264,  264,
			  264,  303,  271,  884,  884,  884,  238,  240,  242,  242,
			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,
			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,
			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,
			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,

			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,
			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,
			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,
			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,
			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,
			  255,  255,  255,  255,  255,  255,  261,  261,  261,  261,
			  261,  261,  370,  267,  268,  313,  255,  914,  262,  913,
			  262,  267,  261,  262,  262,  262,  262,  262,  262,  263,
			  268,  263,  270,  263,  263,  263,  263,  263,  263,  255,
			  272,  275,  276,  313,  255,  261,  274,  284,  270,  267,

			  261,  265,  265,  265,  265,  265,  265,  273,  268,  274,
			  272,  275,  276,  278,  279,  273,  280,  282,  281,  284,
			  285,  314,  263,  282,  278,  318,  270,  279,  285,  280,
			  281,  896,  383,  383,  278,  383,  365,  274,  272,  275,
			  276,  370,  370,  273,  895,  294,  888,  284,  887,  314,
			  957,  282,  278,  318,  294,  279,  285,  280,  281,  288,
			  288,  288,  288,  288,  288,  365,  875,  288,  289,  289,
			  289,  289,  289,  289,  294,  319,  289,  290,  290,  290,
			  290,  290,  290,  296,  292,  290,  292,  292,  288,  291,
			  291,  291,  291,  291,  291,  293,  299,  289,  296,  957,

			  298,  300,  294,  319,  293,  366,  290,  292,  298,  321,
			  292,  322,  323,  859,  299,  324,  292,  325,  293,  326,
			  300,  457,  457,  327,  293,  328,  296,  305,  305,  374,
			  457,  857,  305,  305,  366,  292,  298,  321,  292,  322,
			  323,  305,  299,  324,  292,  325,  293,  326,  300,  306,
			  306,  327,  293,  328,  306,  306,  847,  306,  306,  306,
			  306,  306,  306,  306,  307,  307,  374,  838,  329,  307,
			  307,  835,  307,  307,  307,  307,  307,  307,  307,  308,
			  308,  330,  331,  332,  308,  308,  333,  308,  308,  308,
			  308,  308,  308,  308,  309,  309,  329,  335,  338,  309,

			  309,  337,  339,  340,  343,  344,  367,  345,  309,  330,
			  331,  332,  346,  337,  333,  342,  369,  342,  342,  342,
			  342,  342,  342,  349,  337,  335,  338,  350,  351,  352,
			  339,  340,  343,  344,  337,  345,  353,  354,  355,  356,
			  346,  357,  358,  360,  309,  361,  371,  384,  384,  372,
			  384,  349,  337,  373,  830,  350,  351,  352,  503,  456,
			  378,  503,  409,  378,  353,  354,  355,  356,  460,  357,
			  358,  360,  378,  361,  378,  827,  558,  381,  381,  558,
			  381,  409,  423,  378,  367,  367,  367,  379,  456,  381,
			  379,  523,  816,  423,  369,  369,  369,  460,  815,  379,

			  381,  379,  803,  379,  379,  379,  379,  379,  379,  409,
			  379,  393,  800,  378,  388,  388,  388,  388,  388,  388,
			  388,  423,  523,  796,  371,  371,  371,  372,  372,  372,
			  381,  373,  373,  373,  393,  773,  773,  773,  773,  393,
			  379,  394,  394,  394,  394,  394,  394,  395,  395,  395,
			  395,  395,  395,  396,  396,  396,  396,  396,  396,  399,
			  399,  399,  399,  399,  399,  400,  400,  400,  400,  400,
			  400,  402,  402,  402,  402,  402,  402,  455,  794,  459,
			  785,  400,  401,  736,  401,  410,  395,  401,  401,  401,
			  401,  401,  401,  403,  403,  403,  403,  403,  403,  411,

			  945,  945,  733,  441,  400,  455,  441,  459,  410,  400,
			  404,  404,  404,  404,  404,  404,  405,  405,  411,  405,
			  405,  405,  405,  405,  405,  406,  406,  406,  406,  406,
			  406,  407,  407,  407,  407,  407,  407,  410,  412,  413,
			  415,  418,  416,  417,  419,  418,  411,  413,  420,  404,
			  412,  417,  421,  422,  438,  419,  441,  424,  425,  435,
			  420,  438,  415,  416,  461,  419,  462,  730,  422,  463,
			  435,  437,  464,  418,  421,  413,  424,  425,  412,  417,
			  435,  442,  442,  419,  465,  466,  442,  442,  420,  438,
			  415,  416,  461,  437,  462,  442,  422,  463,  435,  728,

			  464,  727,  421,  867,  424,  425,  426,  426,  426,  426,
			  426,  426,  465,  466,  426,  427,  427,  427,  427,  427,
			  427,  437,  722,  427,  428,  428,  428,  428,  428,  428,
			  427,  429,  429,  429,  429,  429,  429,  430,  430,  430,
			  430,  430,  430,  443,  443,  867,  427,  720,  443,  443,
			  439,  468,  719,  429,  439,  428,  718,  443,  427,  431,
			  431,  431,  431,  431,  431,  439,  469,  431,  432,  432,
			  432,  432,  432,  432,  716,  427,  432,  445,  714,  468,
			  445,  429,  439,  471,  428,  445,  445,  472,  473,  551,
			  445,  445,  551,  439,  469,  708,  447,  447,  878,  445,

			  445,  447,  447,  448,  474,  475,  448,  476,  477,  478,
			  447,  471,  551,  702,  480,  472,  473,  448,  481,  448,
			  448,  448,  448,  448,  448,  698,  448,  878,  667,  482,
			  445,  446,  474,  475,  446,  476,  477,  478,  483,  446,
			  446,  447,  480,  484,  446,  446,  481,  446,  446,  446,
			  446,  446,  446,  446,  446,  449,  448,  482,  449,  947,
			  947,  663,  450,  449,  449,  450,  483,  449,  449,  449,
			  652,  484,  949,  949,  450,  642,  450,  449,  450,  450,
			  450,  450,  450,  450,  446,  450,  451,  452,  452,  451,
			  508,  508,  452,  452,  960,  960,  961,  961,  451,  508,

			  451,  452,  451,  451,  451,  451,  451,  451,  449,  451,
			  485,  641,  486,  458,  458,  450,  458,  458,  458,  458,
			  458,  458,  458,  479,  479,  479,  479,  479,  479,  487,
			  492,  493,  494,  495,  496,  452,  979,  979,  485,  451,
			  486,  500,  632,  494,  500,  502,  502,  502,  502,  502,
			  502,  557,  629,  500,  557,  995,  995,  487,  492,  493,
			  494,  495,  496,  557,  500,  505,  505,  505,  505,  505,
			  505,  494,  506,  506,  506,  506,  506,  506,  507,  507,
			  507,  507,  507,  507,  509,  509,  545,  509,  509,  509,
			  509,  509,  509,  509,  500,  511,  511,  511,  511,  511, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  511,  627,  545,  575,  505,  512,  512,  512,  512,  512,
			  512,  511,  513,  513,  513,  513,  513,  513,  514,  514,
			  514,  514,  514,  514,  515,  515,  515,  515,  515,  515,
			  545,  575,  525,  619,  511,  520,  612,  520,  608,  511,
			  516,  516,  516,  516,  516,  516,  520,  525,  530,  591,
			  524,  513,  518,  518,  518,  518,  518,  518,  524,  574,
			  576,  530,  519,  515,  519,  519,  519,  519,  519,  519,
			  526,  527,  528,  532,  520,  525,  533,  526,  527,  535,
			  528,  532,  536,  533,  577,  537,  524,  535,  576,  530,
			  997,  997,  528,  537,  538,  538,  538,  538,  538,  538,

			  544,  536,  570,  567,  550,  526,  527,  550,  528,  532,
			  542,  533,  577,  565,  534,  535,  541,  543,  542,  544,
			  528,  537,  538,  531,  529,  543,  539,  541,  539,  536,
			  539,  539,  539,  539,  539,  539,  522,  541,  539,  540,
			  540,  540,  540,  540,  540,  546,  542,  544,  553,  578,
			  538,  553,  539,  543,  510,  541,  546,  550,  539,  548,
			  548,  540,  549,  549,  548,  548,  546,  549,  549,  660,
			  660,  579,  580,  548,  498,  497,  549,  578,  660,  453,
			  539,  444,  552,  552,  546,  879,  539,  552,  552,  540,
			  552,  552,  552,  552,  552,  552,  552,  555,  555,  579,

			  580,  581,  555,  555,  553,  555,  555,  555,  555,  555,
			  555,  555,  559,  559,  879,  436,  434,  559,  559,  433,
			  559,  559,  559,  559,  559,  559,  559,  561,  561,  581,
			  414,  408,  561,  561,  398,  561,  561,  561,  561,  561,
			  561,  561,  563,  563,  571,  571,  583,  563,  563,  385,
			  586,  588,  582,  571,  572,  572,  563,  572,  572,  572,
			  572,  572,  572,  572,  582,  584,  592,  589,  592,  592,
			  592,  592,  592,  592,  583,  593,  594,  584,  586,  588,
			  582,  595,  596,  597,  571,  598,  599,  600,  601,  602,
			  603,  604,  582,  584,  572,  589,  605,  606,  664,  563,

			  639,  380,  376,  593,  594,  584,  664,  639,  362,  595,
			  596,  597,  359,  598,  599,  600,  601,  602,  603,  604,
			  607,  341,  336,  607,  605,  606,  609,  609,  609,  609,
			  609,  609,  607,  334,  607,  639,  607,  607,  607,  607,
			  607,  607,  317,  607,  613,  613,  623,  623,  623,  623,
			  623,  614,  614,  613,  614,  614,  614,  614,  614,  614,
			  614,  615,  615,  615,  615,  615,  615,  616,  616,  616,
			  616,  616,  616,  607,  312,  304,  662,  615,  617,  617,
			  617,  617,  617,  617,  613,  618,  618,  618,  618,  618,
			  618,  614,  620,  620,  620,  620,  620,  620,  621,  621,

			  621,  621,  621,  621,  662,  615,  616,  622,  622,  622,
			  622,  622,  622,  625,  625,  625,  625,  625,  625,  626,
			  628,  631,  630,  626,  628,  633,  634,  636,  635,  625,
			  630,  638,  670,  637,  644,  636,  631,  643,  633,  638,
			  644,  672,  645,  634,  646,  302,  882,  634,  635,  645,
			  283,  626,  628,  637,  674,  646,  643,  625,  630,  647,
			  670,  675,  677,  636,  631,  646,  633,  638,  644,  672,
			  647,  634,  269,  653,  653,  882,  635,  645,  653,  653,
			  647,  637,  674,  646,  643,  699,  797,  653,  916,  675,
			  677,  648,  648,  699,  797,  678,  648,  648,  647,  648,

			  648,  648,  648,  648,  648,  648,  650,  266,  680,  650,
			  259,  258,  252,  656,  650,  650,  656,  916,  653,  650,
			  650,  656,  656,  678,  839,  656,  656,  656,  650,  650,
			  681,  654,  839,  251,  654,  656,  680,  682,  648,  666,
			  666,  666,  666,  666,  666,  654,  250,  654,  654,  654,
			  654,  654,  654,  249,  654,  247,  659,  659,  681,  650,
			  651,  659,  659,  651,  239,  682,  656,  235,  651,  651,
			  659,  234,  683,  651,  651,  233,  651,  651,  651,  651,
			  651,  651,  651,  651,  654,  657,  661,  661,  657,  661,
			  661,  661,  661,  661,  661,  661,  230,  657,  228,  657,

			  683,  657,  657,  657,  657,  657,  657,  658,  657,  684,
			  658,  685,  686,  651,  687,  688,  689,  690,  692,  658,
			  693,  658,  694,  658,  658,  658,  658,  658,  658,  696,
			  658,  697,  697,  697,  697,  697,  697,  684,  657,  685,
			  686,  225,  687,  688,  689,  690,  692,  725,  693,  213,
			  694,  701,  701,  701,  701,  701,  701,  696,  725,  703,
			  658,  703,  706,  191,  703,  703,  703,  703,  703,  703,
			  704,  704,  704,  704,  704,  704,  705,  705,  705,  705,
			  705,  705,  187,  184,  183,  706,  725,  164,  160,  157,
			  706,  707,  707,  707,  707,  707,  707,  709,  709,  709,

			  709,  709,  709,  710,  710,  710,  710,  710,  710,  704,
			  711,  711,  711,  711,  711,  711,  712,  713,  715,  717,
			  724,  723,  721,  726,  715,  739,  711,  744,  724,  745,
			  713,  726,  732,  732,  154,  712,  717,  721,  723,  149,
			  717,  732,  723,  731,  731,  731,  731,  731,  731,  711,
			  747,  136,  715,  739,  711,  744,  724,  745,  713,  726,
			  737,  737,  742,  712,  717,  721,  723,  729,  729,  737,
			  742,  749,  729,  729,  757,  759,  761,  762,  747,  738,
			  738,  729,  738,  738,  738,  738,  738,  738,  738,  743,
			  763,  743,  743,  743,  743,  743,  743,  743,  764,  749,

			  737,  742,  757,  759,  761,  762,  767,  769,  769,  769,
			  769,  769,  769,  116,  767,  801,  105,  104,  763,  738,
			  770,  770,  770,  770,  770,  770,  764,  768,  743,  768,
			  768,  768,  768,  768,  768,  768,  771,  771,  771,  771,
			  771,  771,  772,  801,  772,  767,  101,  772,  772,  772,
			  772,  772,  772,  774,  774,  774,  774,  774,  774,  775,
			  775,  775,  775,  778,  782,   99,  768,  776,  776,  776,
			  776,  776,  776,  777,  779,  778,  804,  805,  781,  777,
			  783,  782,  779,  776,  781,  782,  784,  783,   97,   93,
			   90,   89,  786,  787,  784,  806,  786,  787,  775,  795,

			  807,  808,  795,  778,  804,  805,  776,  777,  809,  782,
			  779,  776,  781,  786,  787,  783,  799,  799,  799,  799,
			  799,  799,  784,  806,  786,  787,  788,  788,  807,  808,
			  810,  788,  788,  811,  813,   88,  809,  825,   73,  791,
			  788,  791,  791,  791,  791,  791,  791,   70,  825,   54,
			   38,   33,  795,   31,  826,   26,  831,   24,  810,   16,
			   15,  811,  813,  817,  817,  817,  817,  817,  817,  818,
			  818,  818,  818,  818,  818,  826,  825,  831,  791,  819,
			  819,  819,  819,  819,  819,  820,  820,  820,  820,  820,
			  820,  821,  821,  821,  821,  821,  821,  822,  822,  822, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  822,  822,  822,  826,   14,  831,   11,  828,  818,  824,
			  824,  824,  824,  824,  824,  828,  841,  832,  833,  841,
			    0,  832,  833,  834,  834,  824,    0,    0,  834,  834,
			    0,  834,  834,  834,  834,  834,  834,  834,  832,  833,
			    0,    0,    0,  828,  844,  846,  848,  849,  824,  832,
			  833,  852,  844,  824,  836,  836,  836,  836,  836,  836,
			  845,  853,  845,  845,  845,  845,  845,  845,  845,  841,
			  834,    0,  855,  846,  848,  849,    0,  865,    0,  852,
			  876,    0,    0,  844,    0,  864,  866,    0,  863,  853,
			  858,  858,  858,  858,  858,  858,  863,  865,  880,  845,

			  855,  860,  860,  860,  860,  860,  860,  861,  876,  861,
			  864,  866,  861,  861,  861,  861,  861,  861,  862,  862,
			  862,  862,  862,  862,  863,  865,  880,  869,  869,  858,
			  881,    0,  869,  869,  886,  890,  889,    0,  897,  864,
			  866,  869,  903,  890,  918,  871,  861,  871,  871,  871,
			  871,  871,  871,  889,  907,  886,  890,  891,  881,  885,
			  885,  885,  885,  885,  885,  891,  897,  908,  892,  892,
			  903,  890,  918,  892,  892,  908,    0,    0,  891,  907,
			    0,  889,  892,  886,  871,  905,  905,  905,  905,  905,
			  905,    0,  909,  891,  906,  906,  906,  906,  906,  906,

			  909,  910,    0,  908,  921,  911,  911,  930,  907,  910,
			  911,  911,  920,  909,  920,    0,    0,    0,  946,  911,
			    0,  921,  910,  920,  925,  925,    0,    0,  909,  925,
			  925,    0,    0,    0,    0,  930,    0,  910,  925,  926,
			  926,  926,  926,  926,  926,  926,  946,    0,    0,  921,
			    0,  920,  936,  936,  936,  936,  936,  936,  937,  937,
			  937,  937,  937,  939,  940,  941,  989,  989,  989,  989,
			  989,  939,    0,    0,    0,  940,  941,  948,  948,  948,
			  948,  948,  948,    0,    0,  940,  941,  942,    0,  942,
			  942,    0,  942,  942,  942,  942,  942,  942,  942,  939,

			    0,    0,    0,  940,  941,  950,  950,  950,  950,  950,
			  950,  951,  951,  951,  951,  951,  951,  952,  952,  952,
			  952,  952,  952,  954,  955,    0,    0,    0,    0,  942,
			    0,    0,    0,    0,  954,  955,  956,  956,  956,  956,
			  956,  956,    0,    0,  954,  955,  958,  958,  958,  958,
			  958,  958,  958,  967,  967,  967,  967,  967,  967,    0,
			    0,    0,  954,  955,  965,    0,  965,  965,    0,  965,
			  965,  965,  965,  965,  965,  966,    0,  966,  966,    0,
			  966,  966,  966,  966,  966,  966,  968,    0,  968,    0,
			    0,    0,    0,    0,  956,    0,    0,  968,  971,  971,

			  971,  971,  971,  971,    0,    0,  965,  972,  972,  972,
			  972,  972,  972,  974,    0,  974,  974,  966,  974,  974,
			  974,  974,  974,  974,  974,  968,  980,  980,  980,  980,
			  980,  980,    0,    0,    0,  971,  981,  981,  981,  981,
			  981,  981,  983,  983,  983,  983,  983,  983,  984,  984,
			  984,  984,  984,  984,    0,  974,  986,  986,  986,  986,
			  986,  986,  987,  987,  987,  987,  987,  987,  988,  988,
			  988,  988,  988,  988,  991,  992,  993,  993,  993,  993,
			  993,  993,  993,  994,  994,  994,  994,  994,  994,  994,
			    0,  991,  992,    0,  981,  991,  992,  996,  996,  996,

			  996,  996,  996,    0,    0,    0,  984,  998,  998,  998,
			  998,  998,  998, 1000, 1000, 1000, 1000, 1000, 1000,  991,
			  992,  999,    0,  999,  999,    0,  999,  999,  999,  999,
			  999,  999, 1001, 1001, 1001, 1001, 1001, 1001, 1003,    0,
			 1003, 1003,    0, 1003, 1003, 1003, 1003, 1003, 1003,    0,
			 1000, 1004, 1004, 1004, 1004, 1004, 1004, 1005, 1005, 1005,
			 1005, 1005, 1005,  999, 1007,    0, 1007, 1007,    0, 1007,
			 1007, 1007, 1007, 1007, 1007,    0,    0,    0, 1010, 1011,
			 1003, 1008, 1008, 1008, 1008, 1008, 1008,    0, 1004, 1009,
			 1009, 1009, 1009, 1009, 1009, 1010, 1011,    0,    0, 1010,

			 1011,    0,    0,    0,    0,    0, 1007, 1012, 1012, 1012,
			 1012, 1012, 1012, 1012, 1016, 1016, 1016, 1016, 1016, 1016,
			 1013,    0, 1013, 1010, 1011, 1013, 1013, 1013, 1013, 1013,
			 1013, 1013, 1014,    0, 1014, 1014,    0, 1014, 1014, 1014,
			 1014, 1014, 1014, 1015, 1012, 1015, 1015,    0, 1015, 1015,
			 1015, 1015, 1015, 1015, 1018, 1018, 1018, 1018, 1018, 1018,
			    0,    0, 1013, 1019, 1019, 1019, 1019, 1019, 1019,    0,
			    0,    0, 1016,    0, 1014, 1020, 1020, 1020, 1020, 1020,
			 1020, 1022, 1022, 1022, 1022, 1015, 1021, 1021, 1021, 1021,
			 1021, 1021, 1026, 1026, 1026, 1026, 1026, 1026, 1027, 1027,

			 1027, 1027, 1027, 1027, 1029, 1029, 1029, 1029, 1029, 1029,
			 1031, 1031, 1031, 1031, 1031, 1031,    0,    0,    0,    0,
			 1022, 1032, 1032, 1032, 1032, 1032, 1032, 1034,    0, 1034,
			 1034,    0, 1034, 1034, 1034, 1034, 1034, 1034,    0,    0,
			    0,    0,    0, 1035,    0, 1035,    0, 1031, 1035, 1035,
			 1035, 1035, 1035, 1035,    0, 1036, 1027, 1036,    0,    0,
			 1036, 1036, 1036, 1036, 1036, 1036,    0,    0,    0, 1034,
			 1037, 1037, 1037, 1037, 1037, 1037, 1038, 1038, 1038, 1038,
			 1038, 1038,    0,    0,    0, 1035, 1039, 1039, 1039, 1039,
			 1039, 1039,    0, 1042,    0, 1042, 1042, 1036, 1042, 1042,

			 1042, 1042, 1042, 1042, 1043, 1043, 1043, 1043, 1043, 1043,
			 1044, 1044, 1044, 1044, 1044, 1044, 1046,    0, 1046, 1046,
			    0, 1046, 1046, 1046, 1046, 1046, 1046, 1047, 1047, 1047,
			 1047, 1047, 1047,    0,    0, 1042,    0,    0,    0,    0,
			    0, 1043, 1048, 1048, 1048, 1048, 1048, 1048, 1050, 1050,
			 1050, 1050, 1050, 1050, 1049,    0, 1049,    0, 1046, 1049,
			 1049, 1049, 1049, 1049, 1049, 1051, 1051, 1051, 1051, 1051,
			 1051, 1052,    0, 1052,    0,    0, 1052, 1052, 1052, 1052,
			 1052, 1052, 1053, 1053, 1053, 1053, 1053, 1053,    0, 1054,
			    0, 1054,    0, 1049, 1054, 1054, 1054, 1054, 1054, 1054,

			 1055,    0, 1055,    0,    0, 1055, 1055, 1055, 1055, 1055,
			 1055,    0,    0, 1052, 1056, 1056, 1056, 1056, 1056, 1056,
			 1077, 1077, 1077, 1077, 1077, 1077, 1077, 1077, 1077,    0,
			    0, 1054,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0, 1055, 1058, 1058, 1058, 1058, 1058, 1058, 1058,
			 1058, 1058, 1058, 1058, 1058, 1058, 1058, 1058, 1058, 1058,
			 1058, 1058, 1058, 1058, 1058, 1058, 1058, 1058, 1058, 1058,
			 1058, 1058, 1058, 1058, 1058, 1059, 1059, 1059, 1059, 1059,
			 1059, 1059, 1059, 1059, 1059, 1059, 1059, 1059, 1059, 1059,
			 1059, 1059, 1059, 1059, 1059, 1059, 1059, 1059, 1059, 1059, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			 1059, 1059, 1059, 1059, 1059, 1059, 1059, 1060, 1060, 1060,
			 1060, 1060, 1060, 1060, 1060, 1060, 1060, 1060, 1060, 1060,
			 1060, 1060, 1060, 1060, 1060, 1060, 1060, 1060, 1060, 1060,
			 1060, 1060, 1060, 1060, 1060, 1060, 1060, 1060, 1060, 1061,
			 1061,    0, 1061, 1061, 1061, 1061, 1061, 1061, 1061, 1061,
			 1061, 1061, 1061, 1061, 1061, 1061, 1061, 1061, 1061, 1061,
			    0, 1061, 1061, 1061, 1061, 1061, 1061, 1061, 1061, 1061,
			 1061, 1062, 1062,    0, 1062, 1062, 1062, 1062, 1062, 1062,
			 1062, 1062, 1062, 1062, 1062, 1062, 1062, 1062, 1062, 1062,
			 1062, 1062, 1062, 1062, 1062, 1062, 1062, 1062, 1062, 1062,

			 1062, 1062, 1062, 1063,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0, 1063, 1063, 1063,
			 1063, 1063, 1063, 1063, 1063, 1063, 1064, 1064,    0, 1064,
			    0, 1064, 1064, 1064, 1064, 1064,    0,    0,    0, 1064,
			 1064, 1064, 1064, 1064, 1064, 1064, 1064, 1064, 1065, 1065,
			    0, 1065,    0, 1065, 1065,    0,    0,    0, 1065, 1065,
			 1065, 1065, 1065,    0,    0,    0, 1065, 1065, 1065, 1065,
			 1065, 1065, 1065, 1065, 1065, 1066, 1066,    0, 1066, 1066,
			 1066, 1066, 1066, 1066, 1066, 1066, 1066, 1066, 1066, 1066,
			 1066, 1066, 1066, 1066, 1066, 1066, 1066, 1066, 1066, 1066,

			 1066, 1066, 1066, 1066, 1066, 1066, 1066, 1067, 1067,    0,
			 1067, 1067, 1067, 1067, 1067, 1067, 1067, 1067, 1067, 1067,
			 1067, 1067, 1067, 1067, 1067, 1067, 1067, 1067,    0, 1067,
			 1067, 1067, 1067, 1067, 1067, 1067, 1067, 1067, 1067, 1068,
			 1068, 1068, 1068, 1068, 1068, 1068, 1068, 1068, 1068, 1068,
			 1068, 1068, 1068, 1068, 1068, 1068, 1068, 1068, 1068, 1068,
			 1068, 1068, 1068, 1068, 1068, 1068, 1068, 1068, 1068, 1068,
			 1068, 1069, 1069, 1069, 1069, 1069, 1069, 1069, 1069, 1069,
			 1069, 1069, 1069, 1069, 1069, 1069, 1069, 1069, 1069, 1069,
			 1069, 1069, 1069, 1069, 1069, 1069, 1069, 1069, 1069, 1069,

			 1069, 1069, 1069, 1070,    0, 1070,    0,    0,    0,    0,
			 1070,    0, 1070, 1070,    0,    0,    0, 1070, 1070, 1070,
			 1070, 1070,    0,    0,    0, 1070, 1070, 1070, 1070, 1070,
			 1070, 1070, 1070, 1070, 1071, 1071,    0, 1071, 1071, 1071,
			 1071, 1071, 1071, 1071, 1071, 1071, 1071, 1071, 1071, 1071,
			 1071, 1071, 1071, 1071, 1071, 1071, 1071, 1071, 1071, 1071,
			 1071, 1071, 1071, 1071, 1071, 1071, 1072, 1072, 1072, 1072,
			 1072, 1072, 1072, 1072, 1072, 1072, 1072, 1072, 1072, 1072,
			 1072, 1072, 1072, 1072, 1072, 1072, 1072, 1072, 1072, 1072,
			 1072, 1072, 1072, 1072, 1072, 1072, 1072, 1072, 1073, 1073,

			 1073,    0,    0,    0, 1073, 1073, 1073, 1073, 1073, 1073,
			    0,    0, 1073, 1073, 1073, 1073, 1073, 1073, 1073, 1073,
			 1073, 1074,    0,    0, 1074, 1074,    0, 1074, 1074, 1074,
			 1074, 1074, 1074, 1074,    0,    0,    0, 1074, 1074, 1074,
			 1074, 1074, 1074, 1074, 1074, 1074, 1075, 1075,    0, 1075,
			    0, 1075, 1075, 1075,    0,    0, 1075, 1075, 1075, 1075,
			 1075,    0,    0,    0, 1075, 1075, 1075, 1075, 1075, 1075,
			 1075, 1075, 1075, 1076, 1076,    0, 1076,    0, 1076, 1076,
			 1076,    0,    0, 1076, 1076, 1076, 1076, 1076,    0,    0,
			    0, 1076, 1076, 1076, 1076, 1076, 1076, 1076, 1076, 1076,

			 1078, 1078, 1078, 1078, 1078,    0,    0,    0, 1078, 1078,
			 1078, 1078, 1078, 1078, 1078, 1078, 1078, 1079, 1079, 1079,
			 1079, 1079, 1079, 1079, 1079, 1079,    0, 1079, 1079, 1079,
			 1079, 1079, 1079, 1079, 1079, 1079, 1079, 1079, 1079, 1079,
			 1079, 1079, 1079, 1079, 1079, 1079, 1079, 1079, 1079, 1080,
			 1080, 1080, 1080, 1080, 1080, 1080, 1080, 1080, 1080, 1080,
			 1080, 1080, 1080, 1080, 1080, 1080, 1080, 1080, 1080, 1080,
			 1080, 1080, 1080, 1080, 1080, 1080, 1080, 1080, 1080, 1080,
			 1080, 1081, 1081, 1081, 1081, 1081, 1081, 1081, 1081, 1081,
			 1081, 1081, 1081, 1081, 1081, 1081, 1081, 1081, 1081, 1081,

			 1081, 1081, 1081, 1081, 1081, 1081, 1081, 1081, 1081, 1081,
			 1081, 1081, 1081, 1082, 1082, 1082, 1082, 1082,    0,    0,
			    0, 1082, 1082, 1082, 1082, 1082, 1082, 1082, 1082, 1082,
			 1083, 1083, 1083,    0,    0,    0, 1083, 1083, 1083, 1083,
			 1083, 1083,    0,    0, 1083, 1083, 1083, 1083, 1083, 1083,
			 1083, 1083, 1083, 1084, 1084,    0,    0,    0, 1084, 1084,
			 1084, 1084, 1084,    0,    0,    0, 1084, 1084, 1084, 1084,
			 1084, 1084, 1084, 1084, 1084, 1085, 1085, 1085, 1085, 1085,
			 1085, 1085, 1085, 1085, 1085, 1085, 1085, 1085, 1085, 1085,
			 1085, 1085, 1085, 1085, 1085, 1085, 1085, 1085, 1085, 1085,

			 1085, 1085, 1085, 1085, 1085, 1085, 1085, 1086, 1086,    0,
			    0,    0, 1086, 1086, 1086, 1086, 1086,    0,    0,    0,
			 1086, 1086, 1086, 1086, 1086, 1086, 1086, 1086, 1086, 1087,
			 1087,    0, 1087,    0, 1087, 1087, 1087,    0,    0, 1087,
			 1087, 1087, 1087, 1087,    0,    0,    0, 1087, 1087, 1087,
			 1087, 1087, 1087, 1087, 1087, 1087, 1088, 1088,    0, 1088,
			    0, 1088, 1088, 1088,    0,    0, 1088, 1088, 1088, 1088,
			 1088,    0,    0,    0, 1088, 1088, 1088, 1088, 1088, 1088,
			 1088, 1088, 1088, 1089, 1089, 1089, 1089, 1089,    0,    0,
			    0, 1089, 1089, 1089, 1089, 1089, 1089, 1089, 1089, 1089,

			 1090, 1090, 1090,    0,    0, 1090, 1090, 1090, 1090, 1090,
			 1090, 1090, 1090,    0,    0, 1090, 1090, 1090, 1090, 1090,
			    0,    0,    0, 1090, 1090, 1090, 1090, 1090, 1090, 1090,
			 1090, 1090, 1091,    0, 1091,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0, 1091, 1091, 1091, 1091,
			 1091,    0,    0, 1091, 1091, 1091, 1091, 1091, 1091, 1091,
			 1091, 1091, 1091, 1092,    0, 1092,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0, 1092, 1092, 1092,
			 1092, 1092,    0,    0,    0, 1092, 1092, 1092, 1092, 1092,
			 1092, 1092, 1092, 1092, 1093, 1093,    0,    0,    0, 1093,

			 1093, 1093, 1093, 1093,    0,    0,    0, 1093, 1093, 1093,
			 1093, 1093, 1093, 1093, 1093, 1093, 1094, 1094,    0,    0,
			    0, 1094, 1094, 1094, 1094, 1094,    0,    0,    0, 1094,
			 1094, 1094, 1094, 1094, 1094, 1094, 1094, 1094, 1095, 1095,
			    0,    0,    0, 1095, 1095, 1095, 1095, 1095,    0,    0,
			    0, 1095, 1095, 1095, 1095, 1095, 1095, 1095, 1095, 1095,
			 1096, 1096,    0,    0,    0, 1096, 1096, 1096, 1096, 1096,
			    0,    0,    0, 1096, 1096, 1096, 1096, 1096, 1096, 1096,
			 1096, 1096, 1097, 1097,    0,    0,    0, 1097, 1097, 1097,
			 1097, 1097,    0,    0,    0, 1097, 1097, 1097, 1097, 1097, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			 1097, 1097, 1097, 1097, 1098, 1098,    0, 1098,    0, 1098,
			 1098, 1098,    0,    0, 1098, 1098, 1098, 1098, 1098,    0,
			    0,    0, 1098, 1098, 1098, 1098, 1098, 1098, 1098, 1098,
			 1098, 1099, 1099,    0,    0,    0, 1099, 1099, 1099, 1099,
			 1099,    0,    0,    0, 1099, 1099, 1099, 1099, 1099, 1099,
			 1099, 1099, 1099, 1100, 1100,    0,    0,    0, 1100, 1100,
			 1100, 1100, 1100,    0,    0,    0, 1100, 1100, 1100, 1100,
			 1100, 1100, 1100, 1100, 1100, 1101, 1101, 1101, 1101, 1101,
			    0,    0,    0, 1101, 1101, 1101, 1101, 1101, 1101, 1101,
			 1101, 1101, 1102, 1102, 1102, 1102, 1102,    0,    0,    0,

			 1102, 1102, 1102, 1102, 1102, 1102, 1102, 1102, 1102, 1103,
			 1103,    0, 1103,    0, 1103, 1103, 1103,    0,    0, 1103,
			 1103, 1103, 1103, 1103,    0,    0,    0, 1103, 1103, 1103,
			 1103, 1103, 1103, 1103, 1103, 1103, 1104, 1104,    0,    0,
			    0, 1104, 1104, 1104, 1104, 1104,    0,    0,    0, 1104,
			 1104, 1104, 1104, 1104, 1104, 1104, 1104, 1104, 1105, 1105,
			    0,    0,    0, 1105, 1105, 1105, 1105, 1105,    0,    0,
			    0, 1105, 1105, 1105, 1105, 1105, 1105, 1105, 1105, 1105,
			 1106, 1106, 1106, 1106, 1106,    0,    0,    0, 1106, 1106,
			 1106, 1106, 1106, 1106, 1106, 1106, 1106, 1107, 1107,    0,

			    0,    0, 1107, 1107, 1107, 1107, 1107,    0,    0,    0,
			 1107, 1107, 1107, 1107, 1107, 1107, 1107, 1107, 1107, 1108,
			 1108, 1108, 1108, 1108,    0,    0,    0, 1108, 1108, 1108,
			 1108, 1108, 1108, 1108, 1108, 1108, 1109, 1109,    0,    0,
			    0, 1109, 1109, 1109, 1109, 1109,    0,    0,    0, 1109,
			 1109, 1109, 1109, 1109, 1109, 1109, 1109, 1109, 1110, 1110,
			    0,    0,    0, 1110, 1110, 1110, 1110, 1110,    0,    0,
			    0, 1110, 1110, 1110, 1110, 1110, 1110, 1110, 1110, 1110,
			 1111, 1111,    0,    0,    0, 1111, 1111, 1111, 1111, 1111,
			    0,    0,    0, 1111, 1111, 1111, 1111, 1111, 1111, 1111,

			 1111, 1111, 1112, 1112,    0,    0,    0, 1112, 1112, 1112,
			 1112, 1112,    0,    0,    0, 1112, 1112, 1112, 1112, 1112,
			 1112, 1112, 1112, 1112, 1113, 1113, 1113, 1113, 1113,    0,
			    0,    0, 1113, 1113, 1113, 1113, 1113, 1113, 1113, 1113,
			 1113, 1114, 1114,    0,    0,    0, 1114, 1114, 1114, 1114,
			 1114,    0,    0,    0, 1114, 1114, 1114, 1114, 1114, 1114,
			 1114, 1114, 1114, 1115, 1115,    0,    0,    0, 1115, 1115,
			 1115, 1115, 1115,    0,    0,    0, 1115, 1115, 1115, 1115,
			 1115, 1115, 1115, 1115, 1115, 1116, 1116,    0, 1116,    0,
			 1116, 1116, 1116,    0,    0, 1116, 1116, 1116, 1116, 1116,

			    0,    0,    0, 1116, 1116, 1116, 1116, 1116, 1116, 1116,
			 1116, 1116, 1117, 1117, 1117, 1117, 1117,    0,    0,    0,
			 1117, 1117, 1117, 1117, 1117, 1117, 1117, 1117, 1117, 1118,
			 1118, 1118, 1118, 1118,    0,    0,    0, 1118, 1118, 1118,
			 1118, 1118, 1118, 1118, 1118, 1118, 1119, 1119,    0,    0,
			    0, 1119, 1119, 1119, 1119, 1119,    0,    0,    0, 1119,
			 1119, 1119, 1119, 1119, 1119, 1119, 1119, 1119, 1120, 1120,
			    0, 1120,    0, 1120, 1120, 1120,    0,    0, 1120, 1120,
			 1120, 1120, 1120,    0,    0,    0, 1120, 1120, 1120, 1120,
			 1120, 1120, 1120, 1120, 1120, 1121, 1121, 1121, 1121, 1121,

			    0,    0,    0, 1121, 1121, 1121, 1121, 1121, 1121, 1121,
			 1121, 1121, 1122, 1122, 1122, 1122, 1122,    0,    0,    0,
			 1122, 1122, 1122, 1122, 1122, 1122, 1122, 1122, 1122, 1123,
			 1123,    0,    0,    0, 1123, 1123, 1123, 1123, 1123,    0,
			    0,    0, 1123, 1123, 1123, 1123, 1123, 1123, 1123, 1123,
			 1123, 1124, 1124,    0,    0,    0, 1124, 1124, 1124, 1124,
			 1124,    0,    0,    0, 1124, 1124, 1124, 1124, 1124, 1124,
			 1124, 1124, 1124, 1125, 1125, 1125, 1125, 1125,    0,    0,
			    0, 1125, 1125, 1125, 1125, 1125, 1125, 1125, 1125, 1125,
			 1126, 1126, 1126, 1126, 1126,    0,    0,    0, 1126, 1126,

			 1126, 1126, 1126, 1126, 1126, 1126, 1126, 1127, 1127,    0,
			    0,    0, 1127, 1127, 1127, 1127, 1127,    0,    0,    0,
			 1127, 1127, 1127, 1127, 1127, 1127, 1127, 1127, 1127, 1128,
			 1128,    0,    0,    0, 1128, 1128, 1128, 1128, 1128,    0,
			    0,    0, 1128, 1128, 1128, 1128, 1128, 1128, 1128, 1128,
			 1128, 1129, 1129,    0,    0,    0, 1129, 1129, 1129, 1129,
			 1129,    0,    0,    0, 1129, 1129, 1129, 1129, 1129, 1129,
			 1129, 1129, 1129, 1130, 1130,    0,    0,    0, 1130, 1130,
			 1130, 1130, 1130,    0,    0,    0, 1130, 1130, 1130, 1130,
			 1130, 1130, 1130, 1130, 1130, 1131, 1131,    0, 1131,    0,

			 1131, 1131, 1131,    0,    0, 1131, 1131, 1131, 1131, 1131,
			    0,    0,    0, 1131, 1131, 1131, 1131, 1131, 1131, 1131,
			 1131, 1131, 1132, 1132,    0, 1132,    0, 1132, 1132, 1132,
			    0,    0, 1132, 1132, 1132, 1132, 1132,    0,    0,    0,
			 1132, 1132, 1132, 1132, 1132, 1132, 1132, 1132, 1132, 1133,
			 1133, 1133, 1133, 1133,    0,    0,    0, 1133, 1133, 1133,
			 1133, 1133, 1133, 1133, 1133, 1133, 1134, 1134, 1134, 1134,
			 1134,    0,    0,    0, 1134, 1134, 1134, 1134, 1134, 1134,
			 1134, 1134, 1134, 1135, 1135, 1135, 1135, 1135,    0,    0,
			    0, 1135, 1135, 1135, 1135, 1135, 1135, 1135, 1135, 1135,

			 1136, 1136,    0,    0,    0, 1136, 1136, 1136, 1136, 1136,
			    0,    0,    0, 1136, 1136, 1136, 1136, 1136, 1136, 1136,
			 1136, 1136, 1137, 1137,    0,    0,    0, 1137, 1137, 1137,
			 1137, 1137,    0,    0,    0, 1137, 1137, 1137, 1137, 1137,
			 1137, 1137, 1137, 1137, 1138, 1138,    0,    0,    0, 1138,
			 1138, 1138, 1138, 1138,    0,    0,    0, 1138, 1138, 1138,
			 1138, 1138, 1138, 1138, 1138, 1138, 1139, 1139,    0,    0,
			    0, 1139, 1139, 1139, 1139, 1139,    0,    0,    0, 1139,
			 1139, 1139, 1139, 1139, 1139, 1139, 1139, 1139, 1140, 1140,
			    0,    0,    0, 1140, 1140, 1140, 1140, 1140,    0,    0,

			    0, 1140, 1140, 1140, 1140, 1140, 1140, 1140, 1140, 1140,
			 1141, 1141,    0,    0,    0, 1141, 1141, 1141, 1141, 1141,
			    0,    0,    0, 1141, 1141, 1141, 1141, 1141, 1141, 1141,
			 1141, 1141, 1142, 1142,    0,    0,    0, 1142, 1142, 1142,
			 1142, 1142,    0,    0,    0, 1142, 1142, 1142, 1142, 1142,
			 1142, 1142, 1142, 1142, 1143, 1143,    0,    0,    0, 1143,
			 1143, 1143, 1143, 1143,    0,    0,    0, 1143, 1143, 1143,
			 1143, 1143, 1143, 1143, 1143, 1143, 1057, 1057, 1057, 1057,
			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057,
			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, yy_Dummy>>,
			1, 1000, 5000)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057,
			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057,
			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057,
			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057,
			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057,
			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057,
			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, yy_Dummy>>,
			1, 69, 6000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1143)
			yy_base_template_1 (an_array)
			yy_base_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_base_template_1 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,   90,   95,   77,   79,   98,  102,  187,
			    0, 3006, 5976,  104, 3001, 2933, 2952, 5976,   86, 5976,
			 5976, 5976, 5976, 5976, 2942,  100, 2938,  266,  276, 5976,
			 5976, 2926, 5976, 2924, 5976,  100,  102,   85, 2924,  265,
			  276,   73,  267,   99,  275,  277,  334,  274,  101,  279,
			   86,  405, 5976, 5976, 2893,  471,  324,  331,  550,   95,
			  334,  111,  390,  280,  270,  330,  332,  327,  272,  327,
			 2930, 5976, 5976, 2931,  149, 5976,  107,  323,  319,  381,
			  392,  411,  326, 5976,  394,  400, 5976,  326, 2932, 2876,
			 2815, 5976,  153, 2886,  427,  432,  481, 2885, 5976, 2858,

			 5976, 2837,    0,  622, 2814, 2800,  615, 5976,  402,  543,
			  632,  664,  638,  682, 5976, 5976, 2787,    0,  409,  642,
			  414,  387,  454,  620,  530,  680,  653,  532,  147,  622,
			  681,  120,  531,  663,  682,  606, 2668,  682,  700,  702,
			  764,  728,  762,  690,  718,  727,  730,  685,  474, 2715,
			  797,  804,  826,  833, 2678, 5976,  766, 2678,    0,  880,
			 2671,  273,  394,  614, 2621,    0,  723,  733,  744,  743,
			  761,  754,  761,  772,  776,  779,  801,  780,  820,  795,
			  790,  808,  810, 2660, 2659,  813,  828, 2625,  850,  822,
			  834, 2606,  827,  830,  831,  834,  850,  852,  857,  857,

			  857,  844,  861,  848,  859,  864,  895,  865,  855,  862,
			  394,  771, 5976, 2642, 5976,  669, 5976, 5976,  901,  909,
			  914,  923,  927,  720, 5976, 2587,  914,  915, 2543,  919,
			 2542, 5976,  961, 2500, 2568, 2564,  957,  163, 1001, 2561,
			 1002,  322, 1057,  909, 5976, 5976, 5976, 2546,  964, 2544,
			 2537, 2524, 2503, 1016, 5976, 1132, 1010, 1016, 2494, 2444,
			 1022, 1138, 1155, 1165, 1028, 1183, 2479, 1137, 1138, 2446,
			 1156,  991, 1164, 1181, 1170, 1165, 1166,  412, 1184, 1188,
			 1190, 1192, 1191, 2424, 1171, 1194, 5976,  413, 1241, 1250,
			 1259, 1271, 1270, 1278, 1228,  133, 1257,  257, 1274, 1270,

			 1275,  710, 2419,  971, 2351, 1317, 1339, 1354, 1369, 1384,
			 5976,  706, 2357, 1131, 1179,    0,    0, 2281, 1191, 1233,
			    0, 1267, 1269, 1279, 1269, 1284, 1273, 1289, 1286, 1322,
			 1347, 1343, 1337, 1340, 2276, 1351, 2265, 1384, 1359, 1363,
			 1365, 2305, 1399, 1365, 1366, 1375, 1380,    0,    0, 1375,
			 1393, 1380, 1395, 1395, 1403, 1397, 1405, 1397, 1397, 2255,
			 1399, 1400, 2251,    0,    0, 1185, 1254, 1399,  915, 1409,
			 1155, 1439, 1442, 1446, 1312, 5976, 2247, 5976, 1458, 1485,
			 2298, 1475, 5976, 1230, 1445, 2246, 5976, 5976, 1497, 5976,
			 5976, 5976, 5976, 1477, 1523, 1529, 1535,    0, 2173, 1541,

			 1547, 1569, 1553, 1575, 1592, 1601, 1607, 1613, 2203, 1436,
			 1559, 1573, 1612, 1613, 2204, 1614, 1616, 1617, 1615, 1615,
			 1622, 1626, 1627, 1456, 1631, 1632, 1688, 1697, 1706, 1713,
			 1719, 1741, 1750, 2193, 2190, 1630, 2189, 1645, 1628, 1724,
			  356, 1601, 1671, 1733, 2157, 1775, 1829, 1786, 1801, 1853,
			 1860, 1884, 1877, 2113,    0, 1532, 1410, 1306, 1898, 1534,
			 1419, 1619, 1621, 1631, 1638, 1646, 1651,    0, 1703, 1719,
			    0, 1735, 1740, 1754, 1774, 1771, 1769, 1760, 1768, 1905,
			 1776, 1770, 1792, 1801, 1798, 1865, 1867, 1884,    0,    0,
			    0,    0, 1882, 1898, 1902, 1885, 1901, 2160, 2159, 5976,

			 1939,  910, 1927, 1456, 5976, 1947, 1954, 1960, 1875, 1969,
			 2140, 1977, 1987, 1994, 2000, 2006, 2022,  425, 2034, 2046,
			 2022,  948, 2110, 1465, 2024, 2006, 2044, 2045, 2046, 2098,
			 2022, 2099, 2047, 2050, 2088, 2053, 2056, 2059, 2076, 2112,
			 2121, 2087, 2084, 2091, 2074, 1960, 2116, 5976, 2149, 2152,
			 2102, 1787, 2172, 2146, 5976, 2187, 5976, 1949, 1474, 2202,
			 5976, 2217, 5976, 2232,    0, 2052,    0, 2046,    0,    0,
			 2078, 2229, 2239,    0, 2002, 1969, 2026, 2043, 2116, 2130,
			 2139, 2168, 2218, 2213, 2231,    0, 2211,    0, 2217, 2234,
			    0, 2033, 2250, 2241, 2243, 2247, 2248, 2238, 2251, 2241,

			 2253, 2254, 2255, 2245, 2249, 2262, 2263, 2318, 1981, 2308,
			    0,    0, 2012, 2329, 2336, 2343, 2349, 2360, 2367, 1976,
			 2374, 2380, 2389, 2328, 5976, 2395, 2393, 1975, 2394, 1926,
			 2396, 2395, 1916, 2399, 2397, 2402, 2401, 2407, 2405, 2274,
			 5976, 1887, 1849, 2411, 2408, 2416, 2415, 2430, 2481,    0,
			 2504, 2558, 1795, 2463, 2529,    0, 2511, 2583, 2605, 2546,
			 2154, 2571, 2346, 1846, 2282,    0, 2521, 1811,    0,    0,
			 2402,    0, 2411,    0, 2420, 2420,    0, 2428, 2454,    0,
			 2469, 2484, 2503, 2526, 2575, 2565, 2566, 2580, 2582, 2582,
			 2584,    0, 2573, 2588, 2589,    0, 2584, 2613, 1810, 2469,

			    0, 2633, 1796, 2646, 2652, 2658, 2628, 2673, 1780, 2679,
			 2685, 2692, 2690, 2691, 1752, 2692, 1748, 2690, 1730, 1726,
			 1721, 2696, 1696, 2692, 2694, 2621, 2697, 1686, 1684, 2757,
			 1652, 2725, 2717, 1578,    0,    0, 1559, 2745, 2764, 2680,
			    0,    0, 2746, 2773, 2688, 2690,    0, 2718,    0, 2739,
			    0,    0,    0,    0,    0,    0,    0, 2733,    0, 2734,
			    0, 2742, 2740, 2756, 2764,    0,    0, 2790, 2811, 2789,
			 2802, 2818, 2829, 1517, 2835, 2846, 2849, 2847, 2837, 2848,
			 5976, 2852, 2835, 2854, 2860, 1554, 2863, 2864, 2916,    0,
			  956, 2923,    0,    0, 1554, 2897, 1508, 2470,    0, 2898,

			 1495, 2783,    0, 1487, 2838, 2839, 2861, 2866, 2869, 2876,
			 2897, 2899,    0, 2901,    0, 1483, 1435, 2945, 2951, 2961,
			 2967, 2973, 2979, 5976, 2991, 2911, 2928, 1449, 2981, 5976,
			 1428, 2930, 2988, 2989, 3013, 1356, 3036, 5976, 1352, 2508,
			    0, 3014,    0,    0, 3028, 3044, 3008, 1340, 2999, 3000,
			    0,    0, 3017, 3027,    0, 3025,    0, 1315, 3072, 1266,
			 3083, 3094, 3100, 3062, 3059, 3051, 3060, 1698, 5976, 3117,
			    0, 3129,    0,    0,    0, 1251, 3046,    0, 1747, 2134,
			 3052, 3084, 2395,    0, 1035, 3141, 3108, 1222, 1220, 3110,
			 3106, 3128, 3158,    0,    0, 1229, 1215, 3091,    0,    0,

			    0,    0,    0, 3099,    0, 3167, 3176, 3128, 3141, 3163,
			 3172, 3195,  502, 1153, 1151,    0, 2437,  648, 3110,  654,
			 3199, 3178,  962,  947,  852, 3214, 3221,    0,    0,    0,
			 3164,    0,  782,    0,    0,  739, 3234, 3240, 5976, 3237,
			 3235, 3236, 3274,    0,    0, 1585, 3184, 1844, 3259, 1857,
			 3287, 3293, 3299,  765, 3294, 3295, 3318, 1226, 3328, 5976,
			 1879, 1881,    0,  680,    0, 3351, 3362, 3335, 3373,  724,
			  710, 3380, 3389,  938, 3400,    0,  655,    0,  648, 1921,
			 3408, 3418,  502, 3424, 3430,  486, 3438, 3444, 3450, 3248,
			 5976, 3445, 3446, 3458, 3465, 1940, 3479, 2075, 3489, 3508, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			 3495, 3514,  493, 3525, 3533, 3539,  417, 3551, 3563, 3571,
			 3549, 3550, 3589, 3607, 3619, 3630, 3596,  397, 3636, 3645,
			 3657, 3668, 3668, 5976, 5976,  392, 3674, 3680,  256, 3686,
			 5976, 3692, 3703,  265, 3714, 3730, 3742, 3752, 3758, 3768,
			 5976,  256, 3780, 3786, 3792,  112, 3803, 3809, 3824, 3841,
			 3830, 3847, 3858, 3864, 3876, 3887, 3896, 5976, 3942, 3974,
			 4006, 4038, 4070, 4093, 4115, 4142, 4174, 4206, 4238, 4270,
			 4301, 4333, 4365, 4388, 4413, 4440, 4467, 3896, 4484, 4516,
			 4548, 4580, 4597, 4620, 4642, 4674, 4696, 4723, 4750, 4767,
			 4799, 4830, 4861, 4883, 4905, 4927, 4949, 4971, 4998, 5020,

			 5042, 5059, 5076, 5103, 5125, 5147, 5164, 5186, 5203, 5225,
			 5247, 5269, 5291, 5308, 5330, 5352, 5379, 5396, 5413, 5435,
			 5462, 5479, 5496, 5518, 5540, 5557, 5574, 5596, 5618, 5640,
			 5662, 5689, 5716, 5733, 5750, 5767, 5789, 5811, 5833, 5855,
			 5877, 5899, 5921, 5943, yy_Dummy>>,
			1, 144, 1000)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1143)
			yy_def_template_1 (an_array)
			yy_def_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0, 1057,    1, 1058, 1058, 1059, 1059, 1060, 1060, 1057,
			    9, 1057, 1057, 1057, 1057, 1057, 1061, 1057, 1062, 1057,
			 1057, 1057, 1057, 1057, 1057, 1057, 1063, 1057, 1057, 1057,
			 1057, 1057, 1057, 1057, 1057, 1064, 1064, 1064, 1064, 1064,
			 1064, 1064, 1064, 1064, 1064, 1064, 1064, 1064, 1064, 1064,
			 1064, 1065, 1057, 1057, 1066, 1057,   55,   55, 1057,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			 1057, 1057, 1057, 1067, 1057, 1057, 1057, 1067, 1067, 1067,
			 1067, 1067, 1068, 1057, 1069, 1068, 1057, 1057, 1057, 1057,
			 1057, 1057, 1070, 1057, 1070, 1070, 1057, 1057, 1057, 1061,

			 1057, 1071, 1071, 1071, 1072, 1057, 1057, 1057, 1073, 1057,
			 1057, 1057, 1057, 1057, 1057, 1057, 1064, 1074, 1064, 1064,
			 1064, 1064, 1064, 1064, 1064, 1064, 1064, 1064, 1064, 1064,
			 1064, 1064, 1064, 1064, 1064, 1064, 1057,   46, 1064, 1064,
			 1064, 1064, 1064, 1064, 1064, 1064, 1064, 1064, 1064, 1075,
			 1076, 1076, 1076, 1076, 1066, 1057, 1057, 1057, 1077,   58,
			 1057,  159,  159,  159, 1078,   58,   58,   58,   58,  159,
			   58,  159,  159,   58,   58,  159,  159,   58,   58,  159,
			  159,   58,   58,  159,   58,  159,  159,  159,   58,   58,
			   58,   58,  159,   58,  159,   58,  159,  159,   58,   58,

			  159,  159,   58,   58,  159,  159,   58,   58,  159,   58,
			  159,   58, 1057, 1067, 1057, 1057, 1057, 1057, 1067, 1067,
			 1067, 1067, 1067, 1068, 1057, 1079, 1068, 1069, 1080, 1069,
			 1079, 1057, 1057, 1057, 1057, 1081, 1057, 1070, 1070, 1057,
			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057,
			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1063, 1082,
			 1057, 1057, 1057, 1057, 1057, 1057, 1074, 1064, 1064, 1064,
			 1064, 1064, 1064, 1064, 1064, 1064, 1064, 1064, 1057, 1064,
			 1064, 1064, 1064, 1064, 1064, 1064, 1057, 1064, 1064, 1064,
			 1064,  140,  140, 1064, 1064, 1064, 1064, 1064, 1064, 1064,

			 1064, 1064, 1064, 1064, 1057, 1076, 1076, 1076, 1076, 1076,
			 1057, 1083, 1057,  159,  159,  159, 1084, 1084,   58,   58,
			   58,  159,   58,  159,  159,   58,   58,  159,  159,  159,
			   58,   58,   58,  159,  159,   58,   58, 1057,  159,  159,
			  159,  159,  159,   58,   58,  159,   58,  159,   58,  159,
			  159,   58,   58,  159,  159,   58,   58,  159,  159,  159,
			   58,   58,   58,  159,   58,  159,   58, 1067, 1067, 1067,
			 1067, 1067, 1067, 1067, 1079, 1057, 1080, 1057, 1057, 1057,
			 1085, 1085, 1057, 1085, 1085, 1085, 1057, 1057, 1057, 1057,
			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1086, 1086, 1057,

			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1074, 1064,
			 1064, 1064, 1064, 1064, 1064, 1064, 1064, 1064, 1064, 1057,
			 1064, 1064, 1064, 1064, 1064, 1064, 1064, 1064,  427,  427,
			 1057, 1064, 1064, 1064, 1064, 1057, 1064, 1064, 1064, 1064,
			 1064, 1057, 1087, 1088, 1057, 1076, 1076, 1076,  446, 1076,
			  446,  446, 1076, 1089, 1090,  159,  159, 1084, 1084,   58,
			   58,  159,   58,  159,  159,   58,   58,  159,  159,  159,
			   58,   58,   58,  159,  159,   58,  159,  159,  159, 1057,
			   58,   58,  159,   58,  159,  159,   58,   58,  159,  159,
			   58,   58,  159,  159,  159,   58,   58,  159,   58, 1057,

			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1086, 1086,
			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057,
			 1057, 1057, 1064, 1064, 1064, 1064, 1064, 1064, 1064, 1064,
			 1064, 1057, 1064, 1064, 1064, 1064, 1064, 1064, 1057, 1064,
			  539, 1057, 1064, 1064, 1064, 1064, 1057, 1057, 1087, 1088,
			 1091, 1057, 1088, 1057, 1057, 1088, 1057, 1057, 1092, 1088,
			 1057, 1088, 1057, 1076, 1093, 1093,  159,  159, 1094, 1095,
			 1057, 1084, 1084,   58,   58,  159,   58,  159,  159,   58,
			   58,  159,  159,   58,   58,  159,  159,   58,  159,  159,
			  159, 1057, 1057,   58,   58,  159,   58,  159,  159,   58,

			   58,  159,  159,  159,  159,   58,   58, 1057, 1057, 1057,
			 1096, 1097, 1057, 1086, 1086, 1057, 1057, 1057, 1057, 1057,
			 1057, 1057, 1057, 1057, 1057, 1057, 1064, 1064, 1064, 1064,
			 1064, 1064, 1064, 1064, 1057, 1064, 1064, 1064, 1064, 1064,
			 1057, 1057, 1064, 1064, 1064, 1064, 1057, 1057, 1098, 1099,
			 1088, 1088, 1057, 1088,  651, 1100, 1088,  651,  651, 1076,
			 1093, 1093,  159, 1094, 1095, 1101, 1095, 1057,  159,   58,
			  159,  159,   58,   58,  159,  159,  159,   58,   58,   58,
			  159,  159,  159,   58,   58,  159,   58,  159,  159,   58,
			   58,  159,  159,  159,  159,   58,   58, 1057, 1096, 1097,

			 1102, 1097, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057,
			 1057, 1057, 1064, 1064, 1064, 1064, 1064, 1057, 1064, 1064,
			 1064, 1064, 1064, 1057, 1064, 1064, 1064, 1057, 1057, 1103,
			 1099, 1057, 1100, 1057, 1104, 1105, 1057, 1093, 1093,  159,
			 1106, 1107, 1095, 1095,  159,   58,  159,  159,   58,   58,
			  159,  159,  159,   58,   58,  159,   58,  159,  159,   58,
			   58,  159,  159,  159,   58, 1108, 1109, 1097, 1097, 1057,
			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1064, 1064, 1064,
			 1057, 1064, 1057, 1064, 1064, 1064, 1057, 1057, 1103, 1110,
			 1057, 1057, 1111, 1112, 1057, 1091, 1104, 1105, 1113, 1105,

			 1057,  159, 1114, 1107,  159,   58,  159,   58,  159,   58,
			  159,  159,  159,   58, 1115, 1109, 1057, 1057, 1057, 1057,
			 1057, 1057, 1057, 1057, 1057, 1064, 1064, 1064, 1064, 1057,
			 1064, 1064, 1057, 1057, 1116, 1110, 1057, 1057, 1111, 1112,
			 1117, 1057, 1118, 1119, 1105, 1105,  159, 1114,  159,   58,
			  159,   58,  159,   58,  159,  159,   58, 1115, 1057, 1057,
			 1057, 1057, 1057, 1064, 1064, 1064, 1064, 1057, 1057, 1120,
			 1121, 1057, 1122, 1123, 1124, 1119,  159, 1125,  159,   58,
			  159,   58,  159, 1126, 1057, 1057, 1064, 1064, 1064, 1064,
			 1057, 1057, 1120, 1127, 1128, 1123, 1124,  159, 1129,  159,

			   58,  159,   58,  159, 1130, 1057, 1057, 1064, 1064, 1057,
			 1057, 1131, 1132, 1127, 1128, 1133,  159, 1129,  159, 1130,
			 1057, 1064, 1064, 1057, 1057, 1131, 1132, 1134, 1135, 1136,
			  159, 1137, 1057,  159, 1138, 1057, 1057, 1057, 1057, 1064,
			 1057, 1057, 1132, 1139, 1140, 1136,  159, 1137, 1057, 1138,
			 1057, 1057, 1057, 1064, 1057, 1057, 1057, 1132, 1132, 1057,
			 1139, 1140, 1141, 1057,  159, 1057, 1057, 1057, 1057, 1057,
			 1057, 1057, 1057, 1132, 1132, 1142, 1057, 1143, 1057, 1141,
			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057,
			 1057, 1057, 1057, 1132, 1132, 1142, 1057, 1143, 1057, 1057, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057,
			 1057, 1057, 1132, 1132, 1057, 1057, 1057, 1057, 1057, 1057,
			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057,
			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057,
			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057,
			 1057, 1057, 1057, 1057, 1057, 1057, 1057,    0, 1057, 1057,
			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057,
			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057,
			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057,
			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057,

			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057,
			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057,
			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057,
			 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057, 1057,
			 1057, 1057, 1057, 1057, yy_Dummy>>,
			1, 144, 1000)
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
			   11,   11,   11,   12,   13,    1,   14,    1,   15,    1,
			   16,   16,   17,   16,   16,   18,   16,   16,   16,   16,
			   16,   16,   16,   16,   16,   16,   16,   16,   16,   19,
			   16,   16,   20,   21,   22,   23,    5,   11,   24,   24,
			   24,   24,   24,   24,   24,   24,   24,   24,   24,   24,
			   24,   24,   24,   25,   26,   27,   28,   29,   30,   31,
			   32,    5,    5,    5,    5,    1,    1,    1,    1,    1,
			    1,    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1057)
			yy_accept_template_1 (an_array)
			yy_accept_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_accept_template_1 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,    0,  108,  108,    0,    0,    0,
			    0,  139,  137,    1,    2,   15,  121,   18,  137,   16,
			   17,    7,    6,   13,    5,   11,    8,  113,  113,   14,
			   12,   28,   10,   29,   19,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,   93,  101,  101,  101,
			  101,   21,   30,   22,    9,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			   23,   20,   24,  125,  126,  127,  128,  125,  125,  125,
			  125,  125,  108,  111,  138,  108,   74,   74,   71,   74,
			   74,   82,   82,   79,   82,   82,    1,    2,   27,  121,

			  120,  135,  135,  135,    3,   32,  119,   31,  105,    0,
			    0,  113,    0,  113,   26,   25,  101,    0,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,   39,    0,  101,  100,  100,
			   92,  100,  100,  101,  101,  101,  101,  101,  101,    0,
			    0,    0,    0,    0,    0,  112,    0,    0,    0,  104,
			    0,  104,  104,  104,    0,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,   39,  104,   39,

			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  107,  125,  127,  126,  123,  122,  124,  125,
			  125,  125,  125,  108,  111,    0,  108,    0,    0,    0,
			  109,  110,    0,    0,   71,    0,    0,    0,    0,   79,
			    0,   78,    0,   77,   81,  135,  129,  135,  135,  135,
			  135,  135,  135,    4,   33,  119,    0,    0,    0,    0,
			    0,  115,    0,  113,    0,    0,    0,  101,  101,   38,
			  101,  101,  101,  101,  101,  101,  101,  101,    0,  101,
			  101,  101,  101,   41,  101,  101,   99,   93,   93,   93,
			   93,  100,  101,  100,  100,  100,  101,  101,  101,  101,

			  101,  101,   40,  101,    0,    0,    0,    0,    0,    0,
			  103,  106,    0,  104,  104,   38,    0,    0,  104,  104,
			   38,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,    0,  104,  104,
			  104,   64,   64,  104,  104,  104,  104,   41,   41,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,   40,   40,  104,  104,  125,  125,  125,
			  125,  125,  125,  125,    0,  109,  110,   72,    0,    0,
			    0,    0,   80,   78,   77,   81,  133,  136,  136,  134,
			  130,  131,  132,  119,    0,  119,    0,    0,    0,    0,

			  115,    0,    0,    0,  118,  113,    0,    0,  102,  101,
			  101,  101,  101,  101,   37,  101,  101,  101,  101,    0,
			  101,  101,  101,  101,  101,  101,   92,  101,  101,  101,
			    0,   92,   92,   92,   36,    0,   43,  101,  101,  101,
			  101,   76,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,   61,  104,  104,    0,    0,  104,
			  104,  104,  104,  104,  104,  104,  104,   37,  104,  104,
			   37,  104,  104,  104,  104,  104,  104,  104,  104,    0,
			  104,  104,  104,  104,  104,  104,  104,  104,   36,   43,
			   36,   43,  104,  104,  104,  104,  104,  104,  104,  110,

			    0,   70,    0,   69,   73,  119,    0,    0,    0,    0,
			  114,  115,    0,  116,    0,  118,    0,    0,    0,  113,
			   89,    0,   58,  101,  101,  101,  101,  101,  101,   44,
			  101,    0,  101,  101,   35,  101,  101,  101,    0,  101,
			  101,    0,  101,  101,  101,  101,    0,   75,    0,    0,
			   76,    0,    0,    0,   65,    0,   66,    0,    0,    0,
			   63,    0,   62,    0,    0,    0,   58,  104,    0,    0,
			    0,    0,    0,   58,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,   44,  104,   44,  104,  104,
			   35,   64,   64,  104,  104,  104,  104,  104,  104,  104,

			  104,  104,  104,  104,  104,  104,  104,    0,  119,    0,
			    0,    0,    0,    0,    0,  115,  116,    0,    0,  118,
			    0,    0,    0,    0,   89,    0,  101,   59,  101,   60,
			  101,  101,   46,  101,    0,  101,  101,  101,  101,  101,
			   92,    0,   52,  101,  101,  101,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  104,    0,    0,    0,    0,    0,   59,   59,
			  104,   60,  104,   60,  104,  104,   46,  104,  104,   46,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,   52,  104,  104,  104,   52,  104,    0,    0,    0,

			    0,    0,  105,    0,  116,    0,  119,    0,   91,    0,
			    0,  117,  101,  101,   57,  101,   45,    0,   42,   56,
			   34,  101,   50,    0,  101,  101,  101,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  104,
			    0,    0,    0,    0,  104,  104,   57,  104,   57,  104,
			   45,   42,   56,   42,   56,   34,   34,  104,   50,  104,
			   50,  104,  104,  104,  104,    0,    0,    0,    0,    0,
			  116,    0,    0,    0,    0,   88,  117,  101,  101,  101,
			   96,  101,    0,  101,  101,   53,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,   68,    0,    0,    0,    0,

			  106,  104,    0,    0,  104,  104,  104,  104,  104,  104,
			  104,  104,   53,  104,    0,    0,  118,    0,  118,    0,
			    0,    0,    0,   88,  117,  101,  101,   47,  101,   95,
			   51,  101,    0,    0,    0,    0,    0,   67,    0,    0,
			    0,   68,    0,    0,    0,    0,  104,    0,  104,  104,
			   47,   47,  104,  104,   51,  104,   51,    0,  118,   90,
			    0,   88,  117,  101,  101,  101,  101,   94,   94,    0,
			    0,    0,    0,    0,    0,    0,  104,    0,  104,  104,
			  104,  104,  104,    0,    0,    0,  101,   49,   48,  101,
			    0,    0,    0,    0,    0,    0,    0,  104,    0,   49,

			   49,   48,   48,  104,    0,    0,    0,  101,  101,    0,
			    0,    0,    0,    0,    0,    0,  104,    0,  104,    0,
			   87,  101,   54,    0,    0,    0,    0,    0,    0,    0,
			  104,    0,    0,   54,    0,    0,    0,    0,   87,  101,
			    0,    0,    0,    0,    0,    0,  104,    0,    0,    0,
			    0,    0,    0,   55,    0,    0,    0,    0,    0,   84,
			    0,    0,    0,    0,   55,    0,    0,    0,   86,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			   86,    0,    0,    0,    0,    0,    0,    0,    0,    0, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,   85,   97,   98,    0,    0,    0,    0,    0,
			   83,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			   85,    0,    0,    0,    0,    0,    0,    0,    0,   85,
			    0,    0,    0,    0,    0,    0,    0,    0, yy_Dummy>>,
			1, 58, 1000)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 5976
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 1057
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 1058
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
