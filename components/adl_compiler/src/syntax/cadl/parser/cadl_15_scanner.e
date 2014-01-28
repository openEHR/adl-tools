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

	ADL_14_TERM_CODE_TOOLS
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
if yy_act <= 67 then
if yy_act <= 34 then
if yy_act <= 17 then
if yy_act <= 9 then
if yy_act <= 5 then
if yy_act <= 3 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 83 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 83")
end
-- Ignore separators
else
--|#line 84 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 84")
end
in_lineno := in_lineno + text_count
end
else
--|#line 89 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 89")
end
-- Ignore comments
end
else
if yy_act = 4 then
--|#line 90 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 90")
end
in_lineno := in_lineno + 1
else
--|#line 94 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 94")
end
last_token := Minus_code
end
end
else
if yy_act <= 7 then
if yy_act = 6 then
--|#line 95 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 95")
end
last_token := Plus_code
else
--|#line 96 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 96")
end
last_token := Star_code
end
else
if yy_act = 8 then
--|#line 97 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 97")
end
last_token := Slash_code
else
--|#line 98 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 98")
end
last_token := Caret_code
end
end
end
else
if yy_act <= 13 then
if yy_act <= 11 then
if yy_act = 10 then
--|#line 99 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 99")
end
last_token := Equal_code
else
--|#line 100 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 100")
end
last_token := Dot_code
end
else
if yy_act = 12 then
--|#line 101 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 101")
end
last_token := Semicolon_code
else
--|#line 102 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 102")
end
last_token := Comma_code
end
end
else
if yy_act <= 15 then
if yy_act = 14 then
--|#line 103 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 103")
end
last_token := Colon_code
else
--|#line 104 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 104")
end
last_token := Exclamation_code
end
else
if yy_act = 16 then
--|#line 105 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 105")
end
last_token := Left_parenthesis_code
else
--|#line 106 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 106")
end
last_token := Right_parenthesis_code
end
end
end
end
else
if yy_act <= 26 then
if yy_act <= 22 then
if yy_act <= 20 then
if yy_act <= 19 then
if yy_act = 18 then
--|#line 107 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 107")
end
last_token := Dollar_code
else
--|#line 109 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 109")
end
last_token := Question_mark_code
end
else
--|#line 111 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 111")
end
last_token := SYM_INTERVAL_DELIM
end
else
if yy_act = 21 then
--|#line 113 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 113")
end
last_token := Left_bracket_code
else
--|#line 114 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 114")
end
last_token := Right_bracket_code
end
end
else
if yy_act <= 24 then
if yy_act = 23 then
--|#line 116 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 116")
end
last_token := SYM_START_CBLOCK
else
--|#line 117 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 117")
end
last_token := SYM_END_CBLOCK
end
else
if yy_act = 25 then
--|#line 119 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 119")
end
last_token := SYM_GE
else
--|#line 120 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 120")
end
last_token := SYM_LE
end
end
end
else
if yy_act <= 30 then
if yy_act <= 28 then
if yy_act = 27 then
--|#line 121 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 121")
end
last_token := SYM_NE
else
--|#line 123 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 123")
end
last_token := SYM_LT
end
else
if yy_act = 29 then
--|#line 124 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 124")
end
last_token := SYM_GT
else
--|#line 126 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 126")
end
last_token := SYM_MODULO
end
end
else
if yy_act <= 32 then
if yy_act = 31 then
--|#line 127 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 127")
end
last_token := SYM_DIV
else
--|#line 129 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 129")
end
last_token := SYM_ELLIPSIS
end
else
if yy_act = 33 then
--|#line 130 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 130")
end
last_token := SYM_LIST_CONTINUE
else
--|#line 134 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 134")
end
last_token := SYM_MATCHES
end
end
end
end
end
else
if yy_act <= 51 then
if yy_act <= 43 then
if yy_act <= 39 then
if yy_act <= 37 then
if yy_act <= 36 then
if yy_act = 35 then
--|#line 136 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 136")
end
last_token := SYM_MATCHES
else
--|#line 140 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 140")
end
last_token := SYM_THEN
end
else
--|#line 142 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 142")
end
last_token := SYM_ELSE
end
else
if yy_act = 38 then
--|#line 144 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 144")
end
last_token := SYM_AND
else
--|#line 146 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 146")
end
last_token := SYM_OR
end
end
else
if yy_act <= 41 then
if yy_act = 40 then
--|#line 148 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 148")
end
last_token := SYM_XOR
else
--|#line 150 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 150")
end
last_token := SYM_NOT
end
else
if yy_act = 42 then
--|#line 152 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 152")
end
last_token := SYM_IMPLIES
else
--|#line 154 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 154")
end
last_token := SYM_TRUE
end
end
end
else
if yy_act <= 47 then
if yy_act <= 45 then
if yy_act = 44 then
--|#line 156 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 156")
end
last_token := SYM_FALSE
else
--|#line 158 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 158")
end
last_token := SYM_FORALL
end
else
if yy_act = 46 then
--|#line 160 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 160")
end
last_token := SYM_EXISTS
else
--|#line 164 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 164")
end
last_token := SYM_EXISTENCE
end
end
else
if yy_act <= 49 then
if yy_act = 48 then
--|#line 166 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 166")
end
last_token := SYM_OCCURRENCES
else
--|#line 168 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 168")
end
last_token := SYM_CARDINALITY
end
else
if yy_act = 50 then
--|#line 170 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 170")
end
last_token := SYM_ORDERED
else
--|#line 172 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 172")
end
last_token := SYM_UNORDERED
end
end
end
end
else
if yy_act <= 59 then
if yy_act <= 55 then
if yy_act <= 53 then
if yy_act = 52 then
--|#line 174 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 174")
end
last_token := SYM_UNIQUE
else
--|#line 176 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 176")
end
last_token := SYM_USE_NODE
end
else
if yy_act = 54 then
--|#line 178 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 178")
end
last_token := SYM_USE_ARCHETYPE
else
--|#line 180 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 180")
end
last_token := SYM_ALLOW_ARCHETYPE
end
end
else
if yy_act <= 57 then
if yy_act = 56 then
--|#line 182 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 182")
end
last_token := SYM_INCLUDE
else
--|#line 184 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 184")
end
last_token := SYM_EXCLUDE
end
else
if yy_act = 58 then
--|#line 186 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 186")
end
last_token := SYM_AFTER
else
--|#line 188 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 188")
end
last_token := SYM_BEFORE
end
end
end
else
if yy_act <= 63 then
if yy_act <= 61 then
if yy_act = 60 then
--|#line 190 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 190")
end
last_token := SYM_CLOSED
else
--|#line 193 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 193")
end

			last_token := V_URI
			last_string_value := text
		
end
else
if yy_act = 62 then
--|#line 200 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 200")
end

		last_token := V_ROOT_ID_CODE
		last_string_value := text_substring (2, text_count - 1)
	
else
--|#line 206 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 206")
end

		last_token := V_ID_CODE
		last_string_value := text_substring (2, text_count - 1)
	
end
end
else
if yy_act <= 65 then
if yy_act = 64 then
--|#line 213 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 213")
end

		last_token := V_ID_CODE_STR
		last_string_value := text
	
else
--|#line 220 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 220")
end

		last_token := V_VALUE_SET_REF
		last_string_value := text_substring (2, text_count - 1)
	
end
else
if yy_act = 66 then
--|#line 236 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 236")
end

		set_start_condition (IN_EXPANDED_VALUE_SET_DEF)
		create last_term_constraint_parse_structure_value.make
		str_ := text_substring (2, text_count)
		last_term_constraint_parse_structure_value.set_terminology_id (str_.substring (1, str_.index_of (':', 1)-1))
		is_assumed_code := False
	
else
--|#line 245 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 245")
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
if yy_act <= 101 then
if yy_act <= 84 then
if yy_act <= 76 then
if yy_act <= 72 then
if yy_act <= 70 then
if yy_act <= 69 then
if yy_act = 68 then
--|#line 260 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 260")
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
--|#line 275 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 275")
end
in_lineno := in_lineno + text_count
end
else
--|#line 278 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 278")
end
in_lineno := in_lineno + 1
end
else
if yy_act = 71 then
--|#line 280 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 280")
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
--|#line 303 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 303")
end
	-- Catch-all rules (no backing up)
			last_token := ERR_VALUE_SET_DEF
			set_start_condition (INITIAL)
	
end
end
else
if yy_act <= 74 then
if yy_act = 73 then
--|#line 321 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 321")
end

		set_start_condition (IN_EXTERNAL_VALUE_SET_DEF)
		create last_term_constraint_parse_structure_value.make
		str_ := text_substring (2, text_count)
		last_term_constraint_parse_structure_value.set_terminology_id (str_.substring (1, str_.index_of (':', 1)-1))
		is_assumed_code := False
	
else
--|#line 330 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 330")
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
if yy_act = 75 then
--|#line 345 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 345")
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
--|#line 360 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 360")
end
in_lineno := in_lineno + text_count
end
end
end
else
if yy_act <= 80 then
if yy_act <= 78 then
if yy_act = 77 then
--|#line 363 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 363")
end
in_lineno := in_lineno + 1
else
--|#line 365 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 365")
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
if yy_act = 79 then
--|#line 388 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 388")
end
	-- Catch-all rules (no backing up)
			last_token := ERR_VALUE_SET_DEF
			set_start_condition (INITIAL)
	
else
--|#line 396 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 396")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
end
end
else
if yy_act <= 82 then
if yy_act = 81 then
--|#line 403 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 403")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 404 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 404")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
if yy_act = 83 then
--|#line 405 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 405")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 412 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 412")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
end
end
end
else
if yy_act <= 93 then
if yy_act <= 89 then
if yy_act <= 87 then
if yy_act <= 86 then
if yy_act = 85 then
--|#line 413 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 413")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 420 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 420")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
else
--|#line 421 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 421")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
else
if yy_act = 88 then
--|#line 428 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 428")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 429 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 429")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
end
else
if yy_act <= 91 then
if yy_act = 90 then
--|#line 441 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 441")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 451 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 451")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text_substring(2, text_count)
			
end
else
if yy_act = 92 then
--|#line 456 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 456")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 466 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 466")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
				last_string_value.put('T', last_string_value.index_of(' ', 1))
			
end
end
end
else
if yy_act <= 97 then
if yy_act <= 95 then
if yy_act = 94 then
--|#line 472 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 472")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 483 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 483")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN_ERR
				unread_character(last_string_value.item(last_string_value.count)) -- put back the last character 
				last_string_value := text
			
end
else
if yy_act = 96 then
--|#line 492 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 492")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
else
--|#line 498 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 498")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
end
end
else
if yy_act <= 99 then
if yy_act = 98 then
--|#line 504 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 504")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 510 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 510")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
end
else
if yy_act = 100 then
--|#line 517 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 517")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
else
--|#line 523 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 523")
end
		-- matches an absolute path string with segments of form "/attr_name" or "/attr_name[id-code]"
			last_token := V_ABS_PATH
			last_string_value := text
		
end
end
end
end
end
else
if yy_act <= 118 then
if yy_act <= 110 then
if yy_act <= 106 then
if yy_act <= 104 then
if yy_act <= 103 then
if yy_act = 102 then
--|#line 529 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 529")
end
		-- matches a relative path string with segments of form "/attr_name" or "/attr_name[id-code]"
			last_token := V_REL_PATH
			last_string_value := text
		
else
--|#line 535 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 535")
end

			last_token := SYM_START_CBLOCK
			set_start_condition (IN_REGEXP1)
			in_buffer.append_character ('/')
		
end
else
--|#line 542 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 542")
end
 		-- match segment consisting of non / or [
				in_buffer.append_string (text)
	
end
else
if yy_act = 105 then
--|#line 546 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 546")
end
 		-- match [] segment
				in_buffer.append_string (text)
	
else
--|#line 550 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 550")
end
 		-- match segment ending in quoted slashes '\/'
				in_buffer.append_string (text)
	
end
end
else
if yy_act <= 108 then
if yy_act = 107 then
--|#line 554 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 554")
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
--|#line 566 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 566")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
end
else
if yy_act = 109 then
--|#line 573 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 573")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
else
--|#line 578 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 578")
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
end
end
else
if yy_act <= 114 then
if yy_act <= 112 then
if yy_act = 111 then
--|#line 593 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 593")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
else
--|#line 594 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 594")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
end
else
if yy_act = 113 then
--|#line 598 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 598")
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
--|#line 599 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 599")
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
if yy_act <= 116 then
if yy_act = 115 then
--|#line 600 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 600")
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
--|#line 620 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 620")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 117 then
--|#line 625 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 625")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
else
--|#line 633 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 633")
end
in_buffer.append_character ('\')
end
end
end
end
else
if yy_act <= 126 then
if yy_act <= 122 then
if yy_act <= 120 then
if yy_act = 119 then
--|#line 635 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 635")
end
in_buffer.append_character ('"')
else
--|#line 637 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 637")
end

				in_buffer.append_string (text)
	
end
else
if yy_act = 121 then
--|#line 641 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 641")
end
in_buffer.append_string (text)
else
--|#line 643 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 643")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
end
else
if yy_act <= 124 then
if yy_act = 123 then
--|#line 648 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 648")
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
--|#line 659 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 659")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
else
if yy_act = 125 then
--|#line 667 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 667")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
--|#line 669 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 669")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
end
end
else
if yy_act <= 130 then
if yy_act <= 128 then
if yy_act = 127 then
--|#line 670 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 670")
end
last_token := V_CHARACTER; last_character_value := '%R'
else
--|#line 671 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 671")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 129 then
--|#line 672 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 672")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 673 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 673")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 132 then
if yy_act = 131 then
--|#line 675 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 675")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 676 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 676")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 133 then
--|#line 680 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 680")
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
--|#line 0 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 0")
end
terminate
when 1 then
--|#line 0 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 0")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
when 3 then
--|#line 0 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 0")
end
	-- Catch-all rules (no backing up)
			last_token := ERR_VALUE_SET_DEF
			set_start_condition (INITIAL)
	
when 4 then
--|#line 0 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 0")
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
			create an_array.make_filled (0, 0, 5180)
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
			  886,  306,  123,  151,  152,  236,   90,  132,  236,  307,
			   90,  216,  180,  118,  121,  155,  148,  119,  155,  120,
			  145,  603,  603,  156,  181,  146,  183,  885,   77,   78,
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
			  109,  868,  110,  306,  111,  111,  111,  111,  111,  111,
			  109,  117,  110,  117,  113,  113,  113,  113,  113,  113,

			  117,  117,  117,  117,  124,  117,  126,  129,  130,  134,
			  191,  143,  193,  131,  207,  125,  869,  133,  127,  144,
			  308,  147,  135,  112,  214,  213,  214,  214,   96,  213,
			   96,   96,  124,  112,  126,  129,  130,  134,  192,  143,
			  194,  131,  208,  863,  125,  133,  127,  144,  209,  147,
			  135,  136,  137,  137,  137,  137,  137,  137,  168,  158,
			  117,  170,  213,  158,  174,  158,  158,  138,  203,  195,
			  171,  199,  158,  204,  139,  175,  496,  210,  313,  200,
			  223,  140,  196,  141,  227,  142,  169,  164,  257,  172,
			  230,  164,  176,  164,  164,  138,  205,  197,  173,  201,

			  164,  206,  139,  862,  177,  218,  313,  202,  220,  220,
			  198,  314,  141,  374,  142,  155,  224,  225,  155,  838,
			  213,  228,  229,  156,  258,  213,  224,  225,  213,  738,
			  157,  158,  158,  158,  158,  158,  158,  159,  818,  314,
			  217,  217,  217,  158,  158,  158,  158,  158,  160,  158,
			  158,  158,  161,  158,  162,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  163,  315,  321,  599,
			  158,  164,  164,  164,  164,  164,  165,  164,  164,  164,
			  166,  164,  167,  164,  164,  164,  164,  164,  164,  164,
			  164,  164,  164,  164,  155,  315,  321,  155,  219,  219,

			  219,  306,  156,  221,  221,  221,  217,  217,  217,  157,
			  158,  158,  158,  158,  158,  158,  159,  157,  323,  752,
			  324,  751,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  163,  323,  309,  324,  158,
			  164,  164,  164,  164,  164,  164,  164,  164,  164,  164,
			  164,  164,  164,  164,  164,  164,  164,  164,  164,  164,
			  164,  164,  164,  184,  185,  231,  750,  239,  231,  186,
			  239,  239,  265,  266,  239,  231,  265,  266,  231,  240,
			  241,  317,  749,  240,  187,  267,  312,  117,  748,  246,

			  242,  188,  189,  409,  242,  265,  266,  190,  247,  247,
			  247,  247,  247,  247,  317,  327,  254,  254,  254,  254,
			  254,  254,  259,  259,  259,  259,  259,  259,  333,  314,
			  243,  232,  255,  334,  243,  260,  260,  260,  260,  260,
			  260,  232,  738,  327,  248,  264,  264,  264,  264,  264,
			  264,  261,  640,  306,  734,  256,  333,  319,  257,  249,
			  255,  334,  109,  250,  110,  251,  262,  262,  262,  262,
			  262,  262,  263,  306,  338,  157,  109,  703,  110,  261,
			  262,  262,  262,  262,  262,  262,  265,  266,  328,  265,
			  266,  641,  265,  266,  329,  267,  637,  117,  267,  339,

			  117,  267,  338,  117,  345,  112,  265,  266,  157,  450,
			  271,  347,  349,  270,  350,  267,  328,  117,  269,  112,
			  265,  266,  329,  695,  265,  266,  272,  339,  826,  267,
			  353,  117,  345,  267,  354,  117,  265,  266,  271,  347,
			  349,  270,  350,  213,  451,  267,  269,  117,  265,  266,
			  273,  274,  265,  266,  272,  265,  266,  267,  353,  117,
			  365,  267,  354,  117,  267,  276,  117,  275,  265,  266,
			  827,  277,  265,  266,  265,  359,  278,  337,  273,  274,
			  672,  280,  213,  117,  363,  279,  512,  265,  266,  365,
			  223,  265,  266,  276,  236,  275,  267,  236,  117,  277,

			  267,  503,  117,  359,  278,  265,  266,  639,  282,  265,
			  266,  494,  363,  279,  267,  281,  117,  638,  267,  673,
			  117,  265,  266,  218,  265,  266,  224,  225,  265,  266,
			  267,  240,  117,  267,  240,  117,  282,  267,  555,  117,
			  494,  284,  287,  281,  306,  286,  214,  283,  214,  214,
			  265,  266,  903,  285,  830,  265,  266,  136,  230,  267,
			  217,  217,  217,  618,  267,  109,  117,  555,  289,  284,
			  287,  265,  266,  286,  227,  290,  265,  266,  552,  545,
			  317,  285,  116,  830,  291,  317,  292,  293,  265,  266,
			  136,  265,  266,  136,  224,  225,  289,  267,  453,  117,

			  267,  323,  117,  290,  338,  607,  138,  265,  266,  138,
			  376,  228,  229,  291,  553,  292,  267,  357,  117,  410,
			  293,  358,  141,  293,  265,  266,  453,  265,  266,  325,
			  265,  266,  343,  267,  138,  117,  267,  138,  117,  317,
			  300,  265,  266,  303,  518,  357,  112,  228,  229,  358,
			  317,  141,  265,  266,  136,  294,  294,  294,  294,  294,
			  294,  267,  313,  117,  265,  266,  136,  505,  300,  265,
			  266,  303,  327,  267,  295,  117,  242,  296,  267,  242,
			  117,  382,  138,  297,  454,  834,  265,  266,  298,  139,
			  318,  299,  265,  266,  853,  267,  293,  117,  141,  382, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  330,  267,  295,  117,  375,  296,  265,  266,  491,  301,
			  138,  297,  454,  302,  834,  317,  298,  139,  458,  299,
			  265,  266,  304,  853,  315,  265,  266,  141,  476,  267,
			  252,  117,  252,  252,  317,  265,  266,  301,  265,  266,
			  213,  302,  265,  266,  317,  321,  458,  317,  265,  266,
			  304,  317,  320,  460,  461,  328,  305,  317,  820,  821,
			  471,  329,  324,  265,  266,  464,  333,  265,  266,  455,
			  265,  266,  317,  322,  383,  382,  317,  383,  334,  317,
			  339,  460,  461,  331,  266,  305,  265,  266,  350,  332,
			  326,  465,  267,  464,  335,  267,  265,  266,  466,  341,

			  342,  342,  342,  342,  342,  317,  336,  444,  344,  340,
			  444,  265,  266,  452,  498,  213,  352,  498,  213,  465,
			  317,  367,  368,  369,  370,  371,  466,  444,  349,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  265,  266,  265,  266,  351,  265,  266,  265,
			  266,  317,  410,  317,  265,  266,  317,  409,  317,  265,
			  266,  265,  266,  317,  265,  266,  353,  476,  317,  470,
			  317,  265,  266,  317,  345,  267,  347,  357,  359,  397,
			  317,  358,  354,  372,  372,  372,  373,  373,  373,  473,

			  903,  363,  265,  266,  355,  239,  500,  470,  239,  500,
			  365,  267,  346,  117,  348,  360,  362,  240,  753,  361,
			  356,  378,  379,  379,  379,  379,  379,  473,  242,  364,
			  239,  265,  266,  239,  405,  405,  405,  405,  405,  366,
			  317,  392,  240,  387,  388,  388,  388,  388,  388,  388,
			  820,  821,  752,  242,  394,  752,  394,  754,  243,  395,
			  395,  395,  395,  395,  395,  396,  396,  396,  396,  396,
			  396,  398,  398,  398,  398,  398,  398,  406,  406,  406,
			  406,  406,  406,  243,  380,  381,  382,  380,  381,  380,
			  380,  380,  380,  380,  380,  380,  380,  383,  241,  241,

			  380,  241,  241,  241,  241,  241,  241,  380,  384,  380,
			  380,  380,  380,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  380,  380,  385,  380,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  380,  380,  380,  380,  380,  380,
			  380,  380,  380,  380,  380,  380,  393,  393,  393,  393,
			  393,  393,  399,  399,  399,  399,  399,  399,  265,  266,
			  474,  475,  255,  391,  402,  390,  402,  317,  400,  403,

			  403,  403,  403,  403,  403,  109,  460,  110,  479,  404,
			  404,  404,  404,  404,  404,  256,  265,  266,  474,  475,
			  255,  401,  265,  266,  266,  267,  400,  117,  265,  266,
			  738,  267,  267,  117,  462,  411,  479,  267,  863,  117,
			  389,  265,  266,  546,  481,  265,  266,  386,  112,  412,
			  267,  306,  117,  238,  267,  413,  117,  265,  266,  414,
			  265,  266,  482,  411,  265,  266,  267,  377,  117,  267,
			  233,  117,  481,  267,  235,  117,  415,  412,  485,  416,
			  486,  417,  547,  413,  489,  265,  266,  414,  265,  266,
			  482,  265,  266,  374,  267,  418,  117,  267,  409,  117,

			  267,  490,  117,  421,  415,  375,  485,  416,  486,  417,
			  265,  266,  489,  374,  421,  422,  419,  265,  266,  267,
			  554,  117,  213,  418,  421,  340,  267,  280,  117,  490,
			  420,  316,  265,  266,  423,  312,  265,  266,  310,  154,
			  424,  317,  421,  422,  419,  267,  560,  117,  554,  265,
			  266,  453,  306,  425,  265,  266,  384,  382,  267,  384,
			  117,  288,  423,  267,  253,  117,  265,  266,  424,  265,
			  266,  136,  252,  427,  560,  267,  245,  117,  267,  456,
			  117,  425,  426,  265,  266,  826,  429,  429,  429,  429,
			  429,  429,  267,  100,  117,  562,  738,   97,  428,  265,

			  266,  427,  116,  116,  116,  116,  116,  116,  317,  238,
			  426,  563,  566,  265,  266,  428,  430,  430,  430,  430,
			  430,  430,  267,  562,  117,  265,  266,  828,  431,  431,
			  431,  431,  431,  431,  267,  432,  117,  433,  903,  563,
			  566,  471,  235,  265,  266,  428,  116,  116,  116,  116,
			  116,  116,  317,  265,  266,  136,  234,  428,  434,  265,
			  266,  435,  267,  233,  117,  116,  567,  436,  267,  485,
			  117,  265,  266,  445,  446,  446,  446,  446,  446,  306,
			  438,  255,  117,  213,  297,  437,  434,  265,  266,  435,
			  265,  266,  211,  116,  567,  436,  267,  487,  117,  267,

			  154,  117,  265,  266,  256,  117,  439,  265,  266,  255,
			  115,  317,  297,  437,  265,  266,  267,  114,  117,  440,
			  265,  266,  107,  267,  570,  117,  104,  265,  266,  267,
			  571,  117,  573,  461,  439,  100,  267,  441,  117,  447,
			  448,  449,  449,  449,  449,  306,   98,  440,  265,  266,
			  265,  266,  570,  265,  266,   97,  442,  317,  571,  317,
			  573,  463,  317,  443,  903,  441,  574,  265,  266,  903,
			  265,  266,  464,  265,  266,  454,  317,  458,  903,  317,
			  265,  266,  317,  312,  265,  266,  213,  265,  266,  317,
			  409,  465,  443,  317,  574,  421,  317,  479,  213,  903,

			  467,  466,  213,  457,  470,  459,  421,  476,  473,  342,
			  342,  342,  342,  342,  342,  213,  421,  265,  266,  468,
			  481,  265,  266,  903,  575,  480,  317,  213,  903,  469,
			  317,  213,  472,  903,  421,  903,  477,  265,  266,  903,
			  482,  474,  265,  266,  265,  266,  317,  903,  483,  265,
			  266,  317,  575,  317,  265,  266,  486,  580,  317,  548,
			  903,  265,  266,  317,  217,  217,  217,  306,  484,  478,
			  317,  489,  582,  903,  490,  529,  219,  219,  219,  265,
			  266,  220,  220,  903,  488,  580,  529,  583,  267,  497,
			  117,  491,  497,  221,  221,  221,  529,  494,  549,  492,

			  582,  498,  493,  499,  903,  217,  217,  217,  903,  217,
			  217,  217,  500,  497,  529,  583,  497,  387,  388,  388,
			  388,  388,  388,  388,  903,  498,  495,  499,  903,  379,
			  379,  379,  379,  379,  379,  586,  500,  381,  382,  903,
			  381,  903,  501,  395,  395,  395,  395,  395,  395,  383,
			  502,  502,  502,  502,  502,  502,  265,  266,  903,  587,
			  384,  903,  903,  586,  642,  317,  501,  504,  504,  504,
			  504,  504,  504,  506,  506,  506,  506,  506,  506,  507,
			  507,  507,  507,  507,  507,  903,  554,  587,  644,  503,
			  385,  508,  642,  508,  645,  400,  509,  509,  509,  509, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  509,  509,  510,  510,  510,  510,  510,  510,  403,  403,
			  403,  403,  403,  403,  558,  903,  644,  903,  401,  835,
			  835,  835,  645,  400,  511,  511,  511,  511,  511,  511,
			  513,  514,  903,  515,  515,  515,  515,  515,  515,  516,
			  516,  516,  516,  516,  516,  517,  517,  517,  517,  517,
			  517,  265,  266,  903,  903,  265,  266,  626,  265,  266,
			  267,  903,  117,  512,  267,  903,  117,  267,  626,  117,
			  648,  265,  266,  654,  265,  266,  903,  655,  626,  903,
			  267,  520,  117,  267,  903,  117,  265,  266,  522,  521,
			  903,  265,  266,  524,  523,  267,  626,  117,  648,  903,

			  267,  654,  117,  265,  266,  655,  265,  266,  903,  520,
			  903,  656,  267,  903,  117,  267,  522,  117,  521,  525,
			  903,  524,  523,  526,  903,  527,  265,  266,  903,  265,
			  266,  903,  903,  265,  266,  267,  531,  117,  267,  656,
			  117,  528,  267,  903,  117,  265,  266,  525,  903,  265,
			  266,  526,  530,  527,  267,  903,  117,  903,  267,  532,
			  117,  265,  266,  903,  531,  265,  266,  533,  116,  528,
			  267,  116,  117,  659,  267,  903,  117,  116,  661,  534,
			  530,  429,  429,  429,  429,  429,  429,  532,  662,  265,
			  266,  535,  903,  265,  266,  533,  116,  903,  267,  116,

			  117,  659,  267,  116,  117,  116,  661,  534,  430,  430,
			  430,  430,  430,  430,  116,  903,  662,  545,  266,  535,
			  431,  431,  431,  431,  431,  431,  267,  588,  117,  903,
			  116,  116,  536,  536,  536,  536,  536,  536,  589,  116,
			  903,  116,  903,  116,  537,  537,  537,  537,  537,  537,
			  903,  903,  903,  116,  903,  588,  265,  266,  116,  538,
			  538,  538,  538,  538,  538,  317,  589,  409,  116,  903,
			  116,  903,  540,  665,  116,  539,  539,  539,  539,  539,
			  539,  903,  116,  540,  903,  903,  265,  266,  903,  666,
			  116,  265,  266,  540,  667,  267,  668,  117,  265,  266,

			  317,  665,  116,  903,  604,  903,  604,  267,  903,  117,
			  903,  540,  265,  266,  562,  605,  542,  666,  116,  541,
			  903,  267,  667,  117,  668,  903,  546,  543,  446,  446,
			  446,  446,  446,  446,  306,  903,  265,  266,  544,  903,
			  903,  903,  564,  606,  542,  317,  550,  541,  449,  449,
			  449,  449,  449,  449,  306,  543,  548,  903,  449,  449,
			  449,  449,  449,  449,  306,  547,  544,  556,  557,  557,
			  557,  557,  557,  265,  266,  265,  266,  265,  266,  265,
			  266,  706,  317,  903,  317,  551,  317,  689,  317,  265,
			  266,  265,  266,  903,  903,  549,  563,  903,  317,  903,

			  317,  708,  265,  266,  689,  560,  710,  555,  689,  706,
			  570,  317,  566,  576,  577,  577,  577,  577,  577,  265,
			  266,  567,  265,  266,  565,  573,  265,  266,  317,  708,
			  903,  317,  689,  561,  710,  317,  559,  711,  572,  903,
			  568,  265,  266,  903,  580,  265,  266,  903,  903,  569,
			  317,  714,  574,  578,  317,  903,  582,  265,  266,  265,
			  266,  545,  266,  903,  497,  711,  317,  497,  317,  903,
			  317,  583,  581,  715,  265,  266,  498,  587,  903,  714,
			  579,  903,  903,  267,  584,  117,  903,  500,  265,  266,
			  586,  378,  592,  592,  592,  592,  592,  317,  903,  585,

			  903,  715,  903,  265,  266,  591,  593,  593,  593,  593,
			  593,  593,  267,  903,  117,  903,  903,  501,  590,  594,
			  594,  594,  594,  594,  594,  393,  393,  393,  393,  393,
			  393,  595,  596,  596,  596,  596,  596,  597,  597,  597,
			  597,  597,  597,  265,  266,  503,  509,  509,  509,  509,
			  509,  509,  317,  400,  598,  598,  598,  598,  598,  598,
			  600,  600,  600,  600,  600,  600,  601,  601,  601,  601,
			  601,  601,  903,  716,  903,  719,  401,  903,  903,  265,
			  266,  400,  602,  602,  602,  602,  602,  602,  267,  903,
			  117,  265,  266,  599,  597,  597,  597,  597,  597,  597,

			  267,  716,  117,  719,  514,  512,  515,  515,  515,  515,
			  515,  515,  721,  265,  266,  903,  903,  612,  265,  266,
			  903,  610,  267,  631,  117,  903,  649,  267,  722,  117,
			  265,  266,  611,  903,  632,  725,  613,  726,  650,  267,
			  721,  117,  265,  266,  633,  612,  265,  266,  614,  903,
			  727,  267,  903,  117,  649,  267,  722,  117,  265,  266,
			  611,  615,  632,  725,  613,  726,  650,  267,  733,  117,
			  617,  265,  266,  616,  265,  266,  614,  619,  727,  903,
			  267,  755,  117,  267,  903,  117,  265,  266,  903,  615,
			  903,  401,  620,  265,  266,  267,  733,  117,  617,  265,

			  266,  616,  267,  903,  117,  619,  265,  266,  267,  755,
			  117,  756,  621,  758,  760,  267,  622,  117,  623,  903,
			  620,  536,  536,  536,  536,  536,  536,  266,  903,  537,
			  537,  537,  537,  537,  537,  267,  629,  762,  903,  756,
			  621,  758,  760,  903,  622,  903,  623,  265,  266,  624,
			  539,  539,  539,  539,  539,  539,  267,  625,  117,  265,
			  266,  763,  265,  266,  629,  762,  265,  266,  267,  903,
			  117,  267,  116,  117,  630,  317,  699,  624,  627,  903,
			  903,  628,  764,  788,  903,  625,  432,  699,  433,  763,
			  538,  538,  538,  538,  538,  538,  903,  700,  265,  266,

			  116,  903,  630,  903,  903,  116,  627,  317,  639,  628,
			  764,  788,  435,  903,  903,  699,  903,  642,  436,  445,
			  634,  634,  634,  634,  634,  306,  447,  635,  635,  635,
			  635,  635,  306,  116,  671,  671,  671,  671,  671,  671,
			  435,  769,  769,  769,  769,  643,  436,  447,  636,  635,
			  635,  635,  635,  306,  640,  789,  557,  557,  557,  557,
			  557,  557,  265,  266,  265,  266,  265,  266,  265,  266,
			  903,  317,  903,  317,  903,  317,  903,  317,  903,  903,
			  265,  266,  645,  789,  648,  265,  266,  649,  644,  267,
			  742,  117,  903,  641,  267,  684,  117,  903,  476,  650,

			  577,  577,  577,  577,  577,  577,  267,  742,  265,  266,
			  647,  742,  651,  265,  266,  652,  646,  317,  903,  265,
			  266,  903,  317,  684,  903,  783,  656,  653,  317,  783,
			  265,  266,  655,  265,  266,  742,  265,  266,  659,  317,
			  791,  903,  317,  265,  266,  317,  783,  793,  903,  662,
			  265,  266,  317,  497,  658,  665,  497,  783,  903,  267,
			  657,  117,  666,  661,  903,  498,  660,  499,  791,  592,
			  592,  592,  592,  592,  592,  793,  500,  664,  903,  795,
			  903,  903,  672,  669,  596,  596,  596,  596,  596,  596,
			  670,  663,  597,  597,  597,  597,  597,  597,  675,  675, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  675,  675,  675,  675,  903,  903,  501,  795,  674,  676,
			  676,  676,  676,  676,  676,  677,  677,  677,  677,  677,
			  677,  673,  678,  678,  678,  678,  678,  678,  679,  679,
			  679,  679,  679,  679,  903,  903,  674,  599,  680,  680,
			  680,  680,  680,  680,  681,  681,  681,  681,  681,  682,
			  682,  682,  682,  682,  682,  265,  266,  903,  265,  266,
			  903,  903,  265,  266,  267,  261,  117,  267,  903,  117,
			  685,  267,  518,  117,  265,  266,  903,  686,  265,  266,
			  903,  265,  266,  267,  903,  117,  699,  267,  687,  117,
			  267,  903,  117,  261,  518,  265,  266,  701,  685,  796,

			  265,  266,  688,  903,  267,  686,  117,  702,  700,  267,
			  903,  117,  690,  903,  691,  903,  687,  265,  266,  702,
			  903,  903,  903,  265,  266,  701,  267,  796,  117,  702,
			  688,  692,  267,  903,  117,  812,  693,  265,  266,  903,
			  690,  694,  691,  265,  266,  903,  267,  702,  117,  265,
			  266,  903,  267,  903,  117,  903,  265,  266,  267,  692,
			  117,  265,  266,  812,  693,  267,  697,  117,  903,  694,
			  317,  903,  784,  696,  698,  546,  784,  634,  634,  634,
			  634,  634,  634,  306,  548,  903,  635,  635,  635,  635,
			  635,  635,  306,  784,  697,  704,  705,  705,  705,  705,

			  705,  696,  698,  550,  784,  635,  635,  635,  635,  635,
			  635,  306,  265,  266,  547,  556,  707,  707,  707,  707,
			  707,  317,  903,  549,  265,  266,  813,  708,  265,  266,
			  265,  266,  903,  317,  265,  266,  903,  317,  903,  317,
			  265,  266,  551,  317,  265,  266,  815,  710,  903,  317,
			  265,  266,  903,  317,  813,  709,  711,  265,  266,  317,
			  265,  266,  903,  716,  265,  266,  317,  817,  783,  317,
			  829,  715,  785,  317,  815,  712,  721,  903,  722,  265,
			  266,  719,  903,  832,  713,  265,  266,  903,  267,  785,
			  117,  718,  903,  903,  317,  817,  265,  266,  829,  717,

			  785,  265,  266,  740,  723,  267,  724,  117,  903,  720,
			  267,  832,  117,  844,  845,  725,  593,  593,  593,  593,
			  593,  593,  595,  729,  729,  729,  729,  729,  730,  903,
			  730,  740,  903,  731,  731,  731,  731,  731,  731,  903,
			  903,  844,  845,  728,  731,  731,  731,  731,  731,  731,
			  732,  732,  732,  732,  732,  732,  601,  601,  601,  601,
			  601,  601,  735,  735,  735,  735,  735,  735,  736,  736,
			  736,  736,  736,  736,  737,  737,  737,  737,  737,  737,
			  265,  266,  903,  599,  265,  266,  903,  265,  266,  267,
			  733,  117,  903,  267,  903,  117,  267,  903,  117,  265,

			  266,  741,  903,  265,  266,  903,  265,  266,  317,  854,
			  739,  903,  267,  401,  117,  267,  903,  117,  733,  265,
			  266,  864,  265,  266,  903,  744,  265,  266,  267,  741,
			  117,  267,  903,  117,  903,  317,  903,  854,  739,  265,
			  266,  874,  744,  265,  266,  743,  744,  903,  267,  864,
			  117,  903,  267,  903,  117,  265,  266,  903,  745,  265,
			  266,  903,  265,  266,  267,  746,  117,  903,  317,  874,
			  744,  317,  903,  743,  747,  753,  903,  705,  705,  705,
			  705,  705,  705,  756,  903,  640,  745,  707,  707,  707,
			  707,  707,  707,  746,  903,  265,  266,  265,  266,  265,

			  266,  903,  747,  903,  317,  903,  317,  903,  317,  265,
			  266,  757,  758,  903,  754,  903,  903,  903,  317,  265,
			  266,  265,  266,  903,  641,  760,  903,  903,  317,  672,
			  317,  729,  729,  729,  729,  729,  729,  903,  762,  903,
			  759,  731,  731,  731,  731,  731,  731,  731,  731,  731,
			  731,  731,  731,  761,  766,  766,  766,  766,  766,  766,
			  771,  772,  771,  772,  903,  767,  765,  767,  673,  903,
			  768,  768,  768,  768,  768,  768,  770,  770,  770,  770,
			  770,  770,  774,  774,  774,  774,  774,  774,  265,  266,
			  780,  265,  266,  903,  265,  266,  903,  317,  733,  773,

			  267,  903,  117,  267,  903,  117,  795,  780,  776,  265,
			  266,  780,  903,  265,  266,  903,  903,  777,  267,  903,
			  117,  401,  267,  903,  117,  903,  733,  903,  778,  784,
			  779,  265,  266,  786,  797,  780,  776,  265,  266,  841,
			  267,  903,  117,  265,  266,  777,  267,  841,  117,  781,
			  786,  903,  267,  903,  117,  903,  778,  903,  779,  903,
			  841,  786,  782,  704,  787,  787,  787,  787,  787,  265,
			  266,  903,  265,  266,  903,  841,  903,  781,  317,  265,
			  266,  317,  768,  768,  768,  768,  768,  768,  317,  903,
			  782,  791,  789,  903,  903,  903,  793,  798,  798,  798,

			  798,  798,  798,  799,  799,  799,  799,  799,  799,  606,
			  606,  606,  606,  606,  606,  896,  897,  896,  897,  792,
			  790,  903,  265,  266,  794,  800,  800,  800,  800,  800,
			  800,  267,  903,  117,  903,  903,  599,  801,  801,  801,
			  801,  801,  801,  802,  802,  802,  802,  802,  802,  265,
			  266,  903,  265,  266,  898,  265,  266,  903,  267,  733,
			  117,  267,  903,  117,  267,  808,  117,  265,  266,  808,
			  903,  804,  265,  266,  806,  809,  267,  903,  117,  809,
			  903,  267,  401,  117,  805,  808,  808,  733,  809,  810,
			  903,  903,  811,  903,  265,  266,  809,  808,  903,  804,

			  903,  903,  806,  317,  807,  903,  810,  809,  903,  811,
			  903,  903,  805,  815,  903,  903,  903,  810,  903,  753,
			  811,  787,  787,  787,  787,  787,  787,  265,  266,  265,
			  266,  903,  807,  903,  903,  903,  317,  903,  317,  903,
			  903,  816,  766,  766,  766,  766,  766,  766,  819,  819,
			  819,  819,  819,  819,  903,  771,  903,  771,  754,  813,
			  801,  801,  801,  801,  801,  801,  802,  802,  802,  802,
			  802,  802,  842,  265,  266,  903,  903,  265,  266,  903,
			  842,  599,  267,  903,  117,  903,  267,  814,  117,  903,
			  265,  266,  822,  842,  773,  265,  266,  903,  903,  267,

			  903,  117,  265,  266,  267,  903,  117,  903,  842,  265,
			  266,  317,  903,  823,  903,  903,  903,  903,  317,  903,
			  822,  824,  836,  836,  836,  836,  836,  836,  265,  266,
			  903,  825,  265,  266,  872,  265,  266,  267,  830,  117,
			  832,  267,  823,  117,  267,  872,  117,  265,  266,  824,
			  738,  903,  265,  266,  903,  872,  267,  903,  117,  903,
			  825,  317,  903,  842,  839,  265,  266,  831,  833,  903,
			  903,  843,  903,  872,  317,  840,  846,  846,  846,  846,
			  846,  846,  903,  903,  843,  773,  773,  773,  773,  773,
			  773,  903,  839,  847,  847,  847,  847,  847,  847,  843, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  265,  266,  903,  840,  265,  266,  850,  738,  851,  267,
			  855,  117,  855,  267,  850,  117,  851,  903,  903,  903,
			  851,  856,  903,  849,  265,  266,  903,  850,  852,  851,
			  903,  903,  903,  267,  903,  117,  848,  903,  903,  265,
			  266,  852,  850,  903,  851,  903,  903,  903,  267,  857,
			  117,  849,  858,  903,  859,  860,  852,  847,  847,  847,
			  847,  847,  847,  903,  903,  848,  903,  861,  865,  865,
			  865,  865,  865,  865,  866,  866,  866,  866,  866,  867,
			  867,  867,  867,  867,  867,  870,  870,  870,  870,  870,
			  870,  265,  266,  873,  903,  861,  265,  266,  903,  903,

			  267,  903,  117,  903,  873,  267,  903,  117,  903,  903,
			  871,  903,  903,  903,  873,  875,  875,  875,  875,  875,
			  875,  876,  876,  876,  876,  876,  876,  888,  888,  888,
			  888,  888,  873,  903,  903,  903,  903,  868,  871,  867,
			  867,  867,  867,  867,  867,  867,  867,  867,  867,  867,
			  867,  858,  878,  859,  877,  879,  870,  870,  870,  870,
			  870,  870,  903,  878,  903,  903,  879,  880,  880,  880,
			  880,  880,  880,  878,  903,  881,  879,  881,  884,  884,
			  884,  884,  884,  884,  903,  903,  882,  903,  903,  903,
			  889,  878,  890,  903,  879,  857,  857,  857,  857,  857,

			  857,  887,  887,  887,  887,  887,  887,  889,  903,  890,
			  858,  889,  859,  890,  883,  884,  884,  884,  884,  884,
			  884,  891,  891,  891,  891,  891,  891,  892,  892,  892,
			  892,  892,  892,  893,  894,  889,  903,  890,  895,  895,
			  895,  895,  895,  895,  883,  883,  883,  883,  883,  883,
			  893,  894,  903,  903,  893,  894,  899,  899,  899,  899,
			  899,  899,  900,  900,  900,  900,  900,  900,  901,  901,
			  901,  901,  901,  901,  903,  896,  903,  896,  893,  894,
			  900,  900,  900,  900,  900,  900,  902,  902,  902,  902,
			  902,  902,  898,  898,  898,  898,  898,  898,  311,  311,

			  311,  311,  311,  311,  311,  311,  311,  903,  903,  903,
			  903,  903,  903,  903,  898,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,

			   86,   86,   99,   99,  903,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,  903,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,  101,  101,  903,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  108,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  108,  108,  108,  108,  108,  108,  108,  108,  108,
			  116,  116,  116,  116,  903,  116,  116,  116,  903,  903,
			  116,  116,  116,  116,  116,  116,  116,  116,  116,  149,

			  149,  903,  149,  903,  149,  149,  149,  903,  903,  149,
			  149,  149,  903,  903,  149,  149,  149,  149,  149,  149,
			  149,  149,  149,  153,  153,  903,  153,  153,  153,  153,
			  153,  153,  153,  153,  153,  153,  153,  153,  153,  153,
			  153,  153,  153,  153,  153,  153,  153,  153,  153,  153,
			  153,  153,  212,  212,  903,  212,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,
			  212,  903,  212,  212,  212,  212,  212,  212,  212,  212,
			  212,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,

			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  237,
			  903,  237,  903,  903,  903,  903,  237,  903,  237,  237,
			  237,  903,  903,  237,  237,  237,  903,  903,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  244,  244,  903,
			  244,  244,  244,  244,  244,  244,  244,  244,  244,  244,
			  244,  244,  244,  244,  244,  244,  244,  244,  244,  244,
			  244,  244,  244,  244,  244,  244,  104,  104,  104,  104,

			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  108,  108,  108,  108,  903,
			  903,  108,  108,  108,  108,  903,  108,  108,  108,  108,
			  108,  108,  108,  108,  108,  268,  903,  903,  268,  268,
			  268,  268,  268,  268,  268,  268,  903,  903,  268,  268,
			  268,  268,  268,  268,  268,  268,  268,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  903,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  227,  227,  227,  227,

			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  407,  407,  407,  903,  903,  407,
			  407,  407,  903,  903,  407,  407,  407,  407,  407,  407,
			  407,  407,  407,  408,  408,  408,  903,  903,  408,  408,
			  408,  903,  903,  408,  408,  408,  408,  408,  408,  408,
			  408,  408,  311,  311,  311,  311,  903,  903,  311,  311,

			  311,  311,  903,  311,  311,  311,  311,  311,  311,  311,
			  311,  311,  380,  380,  380,  380,  380,  380,  380,  380,
			  380,  380,  380,  380,  380,  380,  380,  380,  380,  380,
			  380,  380,  380,  380,  380,  380,  380,  380,  380,  380,
			  380,  519,  519,  519,  903,  903,  519,  519,  519,  519,
			  519,  519,  519,  519,  519,  452,  452,  452,  903,  903,
			  452,  452,  452,  452,  452,  452,  452,  452,  903,  903,
			  452,  452,  452,  903,  903,  452,  452,  452,  452,  452,
			  452,  452,  452,  452,  608,  608,  608,  903,  903,  608,
			  608,  608,  608,  608,  608,  608,  608,  608,  609,  609, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  609,  903,  903,  609,  609,  609,  903,  903,  609,  609,
			  609,  609,  609,  609,  609,  609,  609,  683,  683,  683,
			  903,  903,  683,  683,  683,  903,  903,  683,  683,  683,
			  683,  683,  683,  683,  683,  683,  775,  775,  775,  903,
			  903,  775,  775,  775,  775,  775,  775,  775,  775,  775,
			  803,  803,  803,  903,  903,  803,  803,  803,  903,  903,
			  803,  803,  803,  803,  803,  803,  803,  803,  803,  837,
			  837,  837,  903,  903,  837,  837,  837,  903,  903,  837,
			  837,  837,  837,  837,  837,  837,  837,  837,   11,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,

			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903, yy_Dummy>>,
			1, 181, 5000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 5180)
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
			  879,  150,   37,   51,   51,   92,    7,   43,   92,  150,
			    8,   76,   60,   35,   36,  155,   50,   35,  155,   35,
			   48,  513,  513,  155,   60,   48,   61,  878,    3,    3,
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
			   27,  869,   27,  151,   27,   27,   27,   27,   27,   27,
			   28,   39,   28,   42,   28,   28,   28,   28,   28,   28,

			   47,   44,   40,   45,   39,   49,   40,   42,   42,   45,
			   63,   47,   64,   42,   68,   39,  859,   44,   40,   47,
			  151,   49,   45,   27,   74,   78,   74,   74,   96,   80,
			   96,   96,   39,   28,   40,   42,   42,   45,   63,   47,
			   64,   42,   68,  851,   39,   44,   40,   47,   69,   49,
			   45,   46,   46,   46,   46,   46,   46,   46,   56,   56,
			   46,   57,   77,   56,   59,   56,   57,   46,   67,   65,
			   57,   66,   57,   67,   46,   59,  374,   69,  160,   66,
			   82,   46,   65,   46,   84,   46,   56,   56,  108,   57,
			   85,   56,   59,   56,   57,   46,   67,   65,   57,   66,

			   57,   67,   46,  850,   59,   78,  160,   66,   80,   80,
			   65,  161,   46,  374,   46,   55,   82,   82,   55,  821,
			   79,   84,   84,   55,  108,   81,   85,   85,  218,  811,
			   55,   55,   55,   55,   55,   55,   55,   55,  799,  161,
			   77,   77,   77,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,  162,  168,  766,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   58,  162,  168,   58,   79,   79,

			   79,  152,   58,   81,   81,   81,  218,  218,  218,   58,
			   58,   58,   58,   58,   58,   58,   58,  754,  170,  703,
			  171,  702,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,  170,  152,  171,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   62,   62,   87,  701,   94,   87,   62,
			   94,   95,  164,  164,   95,  231,  116,  116,  231,   94,
			   94,  164,  700,   95,   62,  116,  317,  116,  699,  103,

			   94,   62,   62,  317,   95,  166,  166,   62,  103,  103,
			  103,  103,  103,  103,  166,  174,  106,  106,  106,  106,
			  106,  106,  109,  109,  109,  109,  109,  109,  178,  166,
			   94,   87,  106,  179,   95,  110,  110,  110,  110,  110,
			  110,  231,  683,  174,  103,  112,  112,  112,  112,  112,
			  112,  110,  556,  552,  679,  106,  178,  166,  673,  103,
			  106,  179,  111,  103,  111,  103,  111,  111,  111,  111,
			  111,  111,  111,  309,  184,  641,  113,  637,  113,  110,
			  113,  113,  113,  113,  113,  113,  118,  118,  175,  119,
			  119,  556,  120,  120,  175,  118,  552,  118,  119,  185,

			  119,  120,  184,  120,  191,  111,  121,  121,  311,  309,
			  120,  193,  195,  119,  196,  121,  175,  121,  118,  113,
			  122,  122,  175,  626,  123,  123,  121,  185,  808,  122,
			  199,  122,  191,  123,  200,  123,  124,  124,  120,  193,
			  195,  119,  196,  368,  311,  124,  118,  124,  125,  125,
			  122,  123,  126,  126,  121,  127,  127,  125,  199,  125,
			  209,  126,  200,  126,  127,  125,  127,  124,  183,  183,
			  808,  125,  128,  128,  609,  204,  126,  183,  122,  123,
			  595,  128,  219,  128,  207,  127,  601,  129,  129,  209,
			  222,  130,  130,  125,  236,  124,  129,  236,  129,  125,

			  130,  593,  130,  204,  126,  131,  131,  555,  130,  132,
			  132,  365,  207,  127,  131,  129,  131,  553,  132,  595,
			  132,  133,  133,  368,  135,  135,  222,  222,  134,  134,
			  133,  240,  133,  135,  240,  135,  130,  134,  454,  134,
			  365,  132,  135,  129,  450,  134,  214,  131,  214,  214,
			  137,  137,  137,  133,  813,  138,  138,  138,  225,  137,
			  219,  219,  219,  529,  138,  506,  138,  454,  137,  132,
			  135,  172,  172,  134,  226,  137,  188,  188,  450,  494,
			  172,  133,  137,  813,  137,  188,  137,  138,  139,  139,
			  139,  141,  141,  141,  225,  225,  137,  139,  313,  139,

			  141,  172,  141,  137,  188,  517,  139,  144,  144,  141,
			  228,  226,  226,  137,  451,  137,  144,  203,  144,  410,
			  139,  203,  139,  141,  146,  146,  313,  271,  271,  172,
			  165,  165,  188,  146,  139,  146,  271,  141,  271,  165,
			  144,  176,  176,  146,  407,  203,  517,  228,  228,  203,
			  176,  139,  140,  140,  140,  140,  140,  140,  140,  140,
			  140,  140,  165,  140,  142,  142,  142,  397,  144,  143,
			  143,  146,  176,  142,  140,  142,  242,  140,  143,  242,
			  143,  385,  142,  140,  314,  817,  145,  145,  143,  142,
			  165,  143,  147,  147,  844,  145,  142,  145,  142,  380, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  176,  147,  140,  147,  376,  140,  167,  167,  359,  145,
			  142,  140,  314,  145,  817,  167,  143,  142,  321,  143,
			  148,  148,  147,  844,  167,  169,  169,  142,  341,  148,
			  252,  148,  252,  252,  169,  173,  173,  145,  177,  177,
			  217,  145,  180,  180,  173,  169,  321,  177,  181,  181,
			  147,  180,  167,  323,  324,  177,  148,  181,  803,  803,
			  334,  177,  173,  189,  189,  327,  180,  190,  190,  316,
			  198,  198,  189,  169,  383,  383,  190,  383,  181,  198,
			  189,  323,  324,  177,  408,  148,  158,  158,  198,  177,
			  173,  328,  408,  327,  180,  158,  187,  187,  329,  187,

			  187,  187,  187,  187,  187,  187,  181,  444,  189,  190,
			  444,  197,  197,  312,  498,  220,  198,  498,  221,  328,
			  197,  217,  217,  217,  217,  217,  329,  306,  197,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  192,  192,  194,  194,  197,  201,  201,  202,
			  202,  192,  268,  194,  205,  205,  201,  267,  202,  206,
			  206,  208,  208,  205,  210,  210,  201,  576,  206,  333,
			  208,  320,  320,  210,  192,  576,  194,  205,  206,  258,
			  320,  205,  202,  220,  220,  220,  221,  221,  221,  338,

			  257,  208,  285,  285,  201,  237,  500,  333,  237,  500,
			  210,  285,  192,  285,  194,  205,  206,  237,  704,  205,
			  202,  235,  235,  235,  235,  235,  235,  338,  237,  208,
			  239,  348,  348,  239,  263,  263,  263,  263,  263,  210,
			  348,  251,  239,  247,  247,  247,  247,  247,  247,  247,
			  837,  837,  752,  239,  255,  752,  255,  704,  237,  255,
			  255,  255,  255,  255,  255,  256,  256,  256,  256,  256,
			  256,  259,  259,  259,  259,  259,  259,  264,  264,  264,
			  264,  264,  264,  239,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,

			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  254,  254,  254,  254,
			  254,  254,  260,  260,  260,  260,  260,  260,  325,  325,
			  339,  340,  254,  250,  261,  249,  261,  325,  260,  261,

			  261,  261,  261,  261,  261,  262,  325,  262,  345,  262,
			  262,  262,  262,  262,  262,  254,  269,  269,  339,  340,
			  254,  260,  270,  270,  625,  269,  260,  269,  272,  272,
			  852,  270,  625,  270,  325,  269,  345,  272,  852,  272,
			  248,  273,  273,  445,  349,  274,  274,  246,  262,  270,
			  273,  445,  273,  238,  274,  272,  274,  276,  276,  273,
			  275,  275,  350,  269,  277,  277,  276,  234,  276,  275,
			  233,  275,  349,  277,  232,  277,  274,  270,  353,  275,
			  354,  276,  445,  272,  357,  278,  278,  273,  279,  279,
			  350,  281,  281,  229,  278,  277,  278,  279,  280,  279,

			  281,  358,  281,  280,  274,  227,  353,  275,  354,  276,
			  282,  282,  357,  224,  280,  281,  278,  283,  283,  282,
			  453,  282,  212,  277,  280,  186,  283,  182,  283,  358,
			  279,  163,  318,  318,  282,  159,  284,  284,  156,  153,
			  283,  318,  280,  281,  278,  284,  458,  284,  453,  286,
			  286,  318,  149,  284,  287,  287,  384,  384,  286,  384,
			  286,  136,  282,  287,  105,  287,  289,  289,  283,  297,
			  297,  297,  104,  287,  458,  289,  101,  289,  297,  318,
			  297,  284,  286,  290,  290,  810,  290,  290,  290,  290,
			  290,  290,  290,   99,  290,  460,  810,   97,  289,  336,

			  336,  287,  293,  293,  293,  293,  293,  293,  336,   93,
			  286,  461,  465,  291,  291,  290,  291,  291,  291,  291,
			  291,  291,  291,  460,  291,  292,  292,  810,  292,  292,
			  292,  292,  292,  292,  292,  294,  292,  294,  294,  461,
			  465,  336,   90,  355,  355,  291,  295,  295,  295,  295,
			  295,  295,  355,  296,  296,  296,   89,  292,  294,  298,
			  298,  294,  296,   88,  296,  295,  466,  294,  298,  355,
			  298,  299,  299,  307,  307,  307,  307,  307,  307,  307,
			  299,  393,  299,   73,  296,  298,  294,  300,  300,  294,
			  301,  301,   70,  295,  466,  294,  300,  355,  300,  301,

			   54,  301,  326,  326,  393,   38,  300,  302,  302,  393,
			   33,  326,  296,  298,  303,  303,  302,   31,  302,  301,
			  304,  304,   26,  303,  470,  303,   24,  305,  305,  304,
			  471,  304,  473,  326,  300,   16,  305,  302,  305,  308,
			  308,  308,  308,  308,  308,  308,   15,  301,  319,  319,
			  322,  322,  470,  330,  330,   14,  303,  319,  471,  322,
			  473,  326,  330,  305,   11,  302,  474,  331,  331,    0,
			  332,  332,  330,  335,  335,  319,  331,  322,    0,  332,
			  346,  346,  335,  337,  343,  343,  367,  351,  351,  346,
			  337,  331,  305,  343,  474,  337,  351,  346,  369,    0,

			  330,  332,  370,  319,  335,  322,  337,  342,  343,  342,
			  342,  342,  342,  342,  342,  371,  337,  344,  344,  331,
			  351,  352,  352,    0,  475,  346,  344,  372,    0,  332,
			  352,  373,  335,    0,  337,    0,  343,  356,  356,    0,
			  352,  344,  360,  360,  361,  361,  356,    0,  351,  362,
			  362,  360,  475,  361,  364,  364,  356,  479,  362,  447,
			    0,  366,  366,  364,  367,  367,  367,  447,  352,  344,
			  366,  360,  481,    0,  361,  421,  369,  369,  369,  416,
			  416,  370,  370,    0,  356,  479,  421,  482,  416,  378,
			  416,  362,  378,  371,  371,  371,  421,  366,  447,  360,

			  481,  378,  361,  378,    0,  372,  372,  372,    0,  373,
			  373,  373,  378,  379,  421,  482,  379,  388,  388,  388,
			  388,  388,  388,  388,    0,  379,  366,  379,    0,  379,
			  379,  379,  379,  379,  379,  489,  379,  381,  381,    0,
			  381,    0,  378,  394,  394,  394,  394,  394,  394,  381,
			  395,  395,  395,  395,  395,  395,  456,  456,    0,  490,
			  381,    0,    0,  489,  560,  456,  379,  396,  396,  396,
			  396,  396,  396,  398,  398,  398,  398,  398,  398,  399,
			  399,  399,  399,  399,  399,    0,  456,  490,  562,  395,
			  381,  400,  560,  400,  563,  399,  400,  400,  400,  400, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  400,  400,  401,  401,  401,  401,  401,  401,  402,  402,
			  402,  402,  402,  402,  456,    0,  562,    0,  399,  818,
			  818,  818,  563,  399,  403,  403,  403,  403,  403,  403,
			  404,  404,    0,  404,  404,  404,  404,  404,  404,  405,
			  405,  405,  405,  405,  405,  406,  406,  406,  406,  406,
			  406,  411,  411,    0,    0,  412,  412,  540,  413,  413,
			  411,    0,  411,  403,  412,    0,  412,  413,  540,  413,
			  566,  414,  414,  571,  415,  415,    0,  573,  540,    0,
			  414,  411,  414,  415,    0,  415,  417,  417,  413,  412,
			    0,  418,  418,  415,  414,  417,  540,  417,  566,    0,

			  418,  571,  418,  423,  423,  573,  419,  419,    0,  411,
			    0,  574,  423,    0,  423,  419,  413,  419,  412,  417,
			    0,  415,  414,  418,    0,  419,  420,  420,    0,  422,
			  422,    0,    0,  424,  424,  420,  423,  420,  422,  574,
			  422,  420,  424,    0,  424,  425,  425,  417,  428,  426,
			  426,  418,  422,  419,  425,    0,  425,    0,  426,  424,
			  426,  427,  427,    0,  423,  436,  436,  425,  428,  420,
			  427,  428,  427,  580,  436,    0,  436,  428,  582,  426,
			  422,  429,  429,  429,  429,  429,  429,  424,  583,  437,
			  437,  427,    0,  439,  439,  425,  428,    0,  437,  428,

			  437,  580,  439,  429,  439,  428,  582,  426,  430,  430,
			  430,  430,  430,  430,  429,    0,  583,  443,  443,  427,
			  431,  431,  431,  431,  431,  431,  443,  491,  443,    0,
			  430,  429,  432,  432,  432,  432,  432,  432,  491,  430,
			    0,  430,    0,  429,  433,  433,  433,  433,  433,  433,
			    0,    0,    0,  431,    0,  491,  467,  467,  430,  434,
			  434,  434,  434,  434,  434,  467,  491,  438,  430,    0,
			  430,    0,  438,  586,  434,  435,  435,  435,  435,  435,
			  435,    0,  431,  438,    0,    0,  440,  440,    0,  587,
			  435,  462,  462,  438,  588,  440,  589,  440,  441,  441,

			  462,  586,  434,    0,  516,    0,  516,  441,    0,  441,
			    0,  438,  442,  442,  462,  516,  441,  587,  435,  440,
			    0,  442,  588,  442,  589,    0,  446,  442,  446,  446,
			  446,  446,  446,  446,  446,    0,  487,  487,  442,    0,
			    0,    0,  462,  516,  441,  487,  448,  440,  448,  448,
			  448,  448,  448,  448,  448,  442,  449,    0,  449,  449,
			  449,  449,  449,  449,  449,  446,  442,  455,  455,  455,
			  455,  455,  455,  457,  457,  459,  459,  463,  463,  468,
			  468,  639,  457,    0,  459,  448,  463,  618,  468,  469,
			  469,  472,  472,    0,    0,  449,  463,    0,  469,    0,

			  472,  644,  477,  477,  618,  459,  648,  457,  618,  639,
			  472,  477,  468,  476,  476,  476,  476,  476,  476,  478,
			  478,  469,  480,  480,  463,  477,  483,  483,  478,  644,
			    0,  480,  618,  459,  648,  483,  457,  649,  472,    0,
			  468,  484,  484,    0,  480,  488,  488,    0,    0,  469,
			  484,  654,  478,  477,  488,    0,  483,  492,  492,  493,
			  493,  495,  495,    0,  497,  649,  492,  497,  493,    0,
			  495,  484,  480,  655,  520,  520,  497,  493,    0,  654,
			  478,    0,    0,  520,  483,  520,    0,  497,  558,  558,
			  492,  499,  499,  499,  499,  499,  499,  558,    0,  484,

			    0,  655,    0,  527,  527,  493,  502,  502,  502,  502,
			  502,  502,  527,    0,  527,    0,    0,  497,  492,  503,
			  503,  503,  503,  503,  503,  504,  504,  504,  504,  504,
			  504,  505,  505,  505,  505,  505,  505,  507,  507,  507,
			  507,  507,  507,  572,  572,  502,  508,  508,  508,  508,
			  508,  508,  572,  507,  509,  509,  509,  509,  509,  509,
			  510,  510,  510,  510,  510,  510,  511,  511,  511,  511,
			  511,  511,    0,  656,    0,  659,  507,    0,    0,  521,
			  521,  507,  512,  512,  512,  512,  512,  512,  521,    0,
			  521,  523,  523,  509,  514,  514,  514,  514,  514,  514,

			  523,  656,  523,  659,  515,  511,  515,  515,  515,  515,
			  515,  515,  661,  522,  522,    0,    0,  523,  524,  524,
			    0,  521,  522,  545,  522,    0,  567,  524,  662,  524,
			  525,  525,  522,    0,  545,  666,  524,  667,  567,  525,
			  661,  525,  526,  526,  545,  523,  528,  528,  525,    0,
			  668,  526,    0,  526,  567,  528,  662,  528,  530,  530,
			  522,  526,  545,  666,  524,  667,  567,  530,  677,  530,
			  528,  532,  532,  526,  531,  531,  525,  530,  668,    0,
			  532,  706,  532,  531,    0,  531,  534,  534,    0,  526,
			    0,  677,  531,  533,  533,  534,  677,  534,  528,  535,

			  535,  526,  533,    0,  533,  530,  543,  543,  535,  706,
			  535,  708,  533,  711,  721,  543,  534,  543,  535,    0,
			  531,  536,  536,  536,  536,  536,  536,  537,    0,  537,
			  537,  537,  537,  537,  537,  537,  543,  725,    0,  708,
			  533,  711,  721,    0,  534,    0,  535,  544,  544,  536,
			  539,  539,  539,  539,  539,  539,  544,  537,  544,  541,
			  541,  726,  542,  542,  543,  725,  559,  559,  541,    0,
			  541,  542,  539,  542,  544,  559,  631,  536,  541,    0,
			    0,  542,  727,  755,    0,  537,  538,  631,  538,  726,
			  538,  538,  538,  538,  538,  538,    0,  631,  561,  561,

			  539,    0,  544,    0,    0,  538,  541,  561,  559,  542,
			  727,  755,  538,    0,    0,  631,    0,  561,  538,  546,
			  546,  546,  546,  546,  546,  546,  548,  548,  548,  548,
			  548,  548,  548,  538,  594,  594,  594,  594,  594,  594,
			  538,  734,  734,  734,  734,  561,  538,  550,  550,  550,
			  550,  550,  550,  550,  557,  756,  557,  557,  557,  557,
			  557,  557,  564,  564,  565,  565,  568,  568,  569,  569,
			    0,  564,    0,  565,    0,  568,    0,  569,    0,    0,
			  610,  610,  565,  756,  568,  611,  611,  569,  564,  610,
			  689,  610,    0,  557,  611,  610,  611,    0,  577,  569,

			  577,  577,  577,  577,  577,  577,  577,  689,  579,  579,
			  565,  689,  568,  578,  578,  569,  564,  579,    0,  581,
			  581,    0,  578,  610,    0,  748,  579,  569,  581,  748,
			  585,  585,  578,  584,  584,  689,  590,  590,  581,  585,
			  758,    0,  584,  591,  591,  590,  748,  760,    0,  585,
			  613,  613,  591,  592,  579,  590,  592,  748,    0,  613,
			  578,  613,  591,  584,    0,  592,  581,  592,  758,  592,
			  592,  592,  592,  592,  592,  760,  592,  585,    0,  762,
			    0,    0,  596,  590,  596,  596,  596,  596,  596,  596,
			  591,  584,  597,  597,  597,  597,  597,  597,  598,  598, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  598,  598,  598,  598,    0,    0,  592,  762,  597,  599,
			  599,  599,  599,  599,  599,  600,  600,  600,  600,  600,
			  600,  596,  602,  602,  602,  602,  602,  602,  603,  603,
			  603,  603,  603,  603,    0,    0,  597,  598,  604,  604,
			  604,  604,  604,  604,  605,  605,  605,  605,  605,  607,
			  607,  607,  607,  607,  607,  612,  612,    0,  614,  614,
			    0,    0,  615,  615,  612,  607,  612,  614,    0,  614,
			  612,  615,  632,  615,  616,  616,    0,  614,  617,  617,
			    0,  619,  619,  616,    0,  616,  632,  617,  615,  617,
			  619,    0,  619,  607,  633,  620,  620,  632,  612,  763,

			  621,  621,  617,    0,  620,  614,  620,  632,  633,  621,
			    0,  621,  619,    0,  620,    0,  615,  622,  622,  633,
			    0,    0,    0,  623,  623,  632,  622,  763,  622,  633,
			  617,  621,  623,    0,  623,  788,  622,  627,  627,    0,
			  619,  623,  620,  628,  628,    0,  627,  633,  627,  629,
			  629,    0,  628,    0,  628,    0,  630,  630,  629,  621,
			  629,  643,  643,  788,  622,  630,  629,  630,    0,  623,
			  643,    0,  749,  628,  630,  634,  749,  634,  634,  634,
			  634,  634,  634,  634,  635,    0,  635,  635,  635,  635,
			  635,  635,  635,  749,  629,  638,  638,  638,  638,  638,

			  638,  628,  630,  636,  749,  636,  636,  636,  636,  636,
			  636,  636,  646,  646,  634,  640,  640,  640,  640,  640,
			  640,  646,    0,  635,  647,  647,  789,  646,  651,  651,
			  652,  652,    0,  647,  653,  653,    0,  651,    0,  652,
			  657,  657,  636,  653,  658,  658,  793,  651,    0,  657,
			  660,  660,    0,  658,  789,  646,  652,  663,  663,  660,
			  664,  664,    0,  658,  669,  669,  663,  796,  750,  664,
			  812,  657,  750,  669,  793,  651,  663,    0,  664,  685,
			  685,  660,    0,  815,  652,  670,  670,    0,  685,  750,
			  685,  658,    0,    0,  670,  796,  686,  686,  812,  657,

			  750,  688,  688,  685,  663,  686,  664,  686,    0,  660,
			  688,  815,  688,  829,  834,  670,  671,  671,  671,  671,
			  671,  671,  672,  672,  672,  672,  672,  672,  674,    0,
			  674,  685,    0,  674,  674,  674,  674,  674,  674,    0,
			    0,  829,  834,  670,  675,  675,  675,  675,  675,  675,
			  676,  676,  676,  676,  676,  676,  678,  678,  678,  678,
			  678,  678,  680,  680,  680,  680,  680,  680,  681,  681,
			  681,  681,  681,  681,  682,  682,  682,  682,  682,  682,
			  684,  684,    0,  675,  687,  687,    0,  690,  690,  684,
			  682,  684,    0,  687,    0,  687,  690,    0,  690,  712,

			  712,  687,    0,  691,  691,    0,  692,  692,  712,  845,
			  684,    0,  691,  682,  691,  692,    0,  692,  682,  693,
			  693,  853,  694,  694,    0,  695,  717,  717,  693,  687,
			  693,  694,    0,  694,    0,  717,    0,  845,  684,  696,
			  696,  864,  695,  697,  697,  693,  695,    0,  696,  853,
			  696,    0,  697,    0,  697,  698,  698,    0,  696,  709,
			  709,    0,  718,  718,  698,  697,  698,    0,  709,  864,
			  695,  718,    0,  693,  698,  705,    0,  705,  705,  705,
			  705,  705,  705,  709,    0,  707,  696,  707,  707,  707,
			  707,  707,  707,  697,    0,  713,  713,  720,  720,  723,

			  723,    0,  698,    0,  713,    0,  720,    0,  723,  724,
			  724,  709,  713,    0,  705,    0,    0,    0,  724,  728,
			  728,  792,  792,    0,  707,  723,    0,    0,  728,  729,
			  792,  729,  729,  729,  729,  729,  729,    0,  728,    0,
			  713,  730,  730,  730,  730,  730,  730,  731,  731,  731,
			  731,  731,  731,  723,  732,  732,  732,  732,  732,  732,
			  736,  736,  736,  736,    0,  733,  728,  733,  729,    0,
			  733,  733,  733,  733,  733,  733,  735,  735,  735,  735,
			  735,  735,  737,  737,  737,  737,  737,  737,  765,  765,
			  744,  739,  739,    0,  740,  740,    0,  765,  737,  736,

			  739,    0,  739,  740,    0,  740,  765,  744,  739,  741,
			  741,  744,    0,  743,  743,    0,    0,  740,  741,    0,
			  741,  737,  743,    0,  743,    0,  737,    0,  741,  751,
			  743,  745,  745,  751,  765,  744,  739,  747,  747,  826,
			  745,    0,  745,  746,  746,  740,  747,  826,  747,  745,
			  751,    0,  746,    0,  746,    0,  741,    0,  743,    0,
			  826,  751,  746,  753,  753,  753,  753,  753,  753,  757,
			  757,    0,  759,  759,    0,  826,    0,  745,  757,  761,
			  761,  759,  767,  767,  767,  767,  767,  767,  761,    0,
			  746,  759,  757,    0,    0,    0,  761,  768,  768,  768,

			  768,  768,  768,  769,  769,  769,  769,  769,  769,  770,
			  770,  770,  770,  770,  770,  892,  892,  892,  892,  759,
			  757,    0,  778,  778,  761,  771,  771,  771,  771,  771,
			  771,  778,    0,  778,    0,    0,  768,  772,  772,  772,
			  772,  772,  772,  774,  774,  774,  774,  774,  774,  776,
			  776,    0,  777,  777,  892,  779,  779,    0,  776,  774,
			  776,  777,    0,  777,  779,  783,  779,  781,  781,  783,
			    0,  776,  782,  782,  779,  784,  781,    0,  781,  784,
			    0,  782,  774,  782,  777,  785,  783,  774,  786,  785,
			    0,    0,  786,    0,  794,  794,  784,  783,    0,  776,

			    0,    0,  779,  794,  782,    0,  785,  784,    0,  786,
			    0,    0,  777,  794,    0,    0,    0,  785,    0,  787,
			  786,  787,  787,  787,  787,  787,  787,  790,  790,  797,
			  797,    0,  782,    0,    0,    0,  790,    0,  797,    0,
			    0,  794,  798,  798,  798,  798,  798,  798,  800,  800,
			  800,  800,  800,  800,    0,  801,    0,  801,  787,  790,
			  801,  801,  801,  801,  801,  801,  802,  802,  802,  802,
			  802,  802,  827,  804,  804,    0,    0,  805,  805,    0,
			  827,  798,  804,    0,  804,    0,  805,  790,  805,    0,
			  806,  806,  804,  827,  801,  807,  807,    0,    0,  806,

			    0,  806,  814,  814,  807,    0,  807,    0,  827,  816,
			  816,  814,    0,  805,    0,    0,    0,    0,  816,    0,
			  804,  806,  819,  819,  819,  819,  819,  819,  823,  823,
			    0,  807,  822,  822,  862,  824,  824,  823,  814,  823,
			  816,  822,  805,  822,  824,  862,  824,  825,  825,  806,
			  828,    0,  831,  831,    0,  862,  825,    0,  825,    0,
			  807,  831,    0,  828,  822,  833,  833,  814,  816,    0,
			    0,  828,    0,  862,  833,  825,  835,  835,  835,  835,
			  835,  835,    0,    0,  828,  836,  836,  836,  836,  836,
			  836,    0,  822,  838,  838,  838,  838,  838,  838,  828, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  839,  839,    0,  825,  840,  840,  841,  843,  842,  839,
			  846,  839,  846,  840,  841,  840,  842,    0,    0,    0,
			  843,  846,    0,  840,  849,  849,    0,  841,  843,  842,
			    0,    0,    0,  849,    0,  849,  839,    0,    0,  848,
			  848,  843,  841,    0,  842,    0,    0,    0,  848,  846,
			  848,  840,  847,    0,  847,  847,  843,  847,  847,  847,
			  847,  847,  847,    0,    0,  839,    0,  848,  855,  855,
			  855,  855,  855,  855,  856,  856,  856,  856,  856,  858,
			  858,  858,  858,  858,  858,  860,  860,  860,  860,  860,
			  860,  861,  861,  863,    0,  848,  871,  871,    0,    0,

			  861,    0,  861,    0,  863,  871,    0,  871,    0,    0,
			  861,    0,    0,    0,  863,  865,  865,  865,  865,  865,
			  865,  866,  866,  866,  866,  866,  866,  882,  882,  882,
			  882,  882,  863,    0,    0,    0,    0,  858,  861,  867,
			  867,  867,  867,  867,  867,  868,  868,  868,  868,  868,
			  868,  870,  872,  870,  870,  873,  870,  870,  870,  870,
			  870,  870,    0,  872,    0,    0,  873,  875,  875,  875,
			  875,  875,  875,  872,    0,  876,  873,  876,  877,  877,
			  877,  877,  877,  877,    0,    0,  876,    0,    0,    0,
			  885,  872,  886,    0,  873,  880,  880,  880,  880,  880,

			  880,  881,  881,  881,  881,  881,  881,  885,    0,  886,
			  884,  885,  884,  886,  876,  884,  884,  884,  884,  884,
			  884,  887,  887,  887,  887,  887,  887,  888,  888,  888,
			  888,  888,  888,  889,  890,  885,    0,  886,  891,  891,
			  891,  891,  891,  891,  895,  895,  895,  895,  895,  895,
			  889,  890,    0,    0,  889,  890,  896,  896,  896,  896,
			  896,  896,  897,  897,  897,  897,  897,  897,  899,  899,
			  899,  899,  899,  899,    0,  900,    0,  900,  889,  890,
			  900,  900,  900,  900,  900,  900,  901,  901,  901,  901,
			  901,  901,  902,  902,  902,  902,  902,  902,  921,  921,

			  921,  921,  921,  921,  921,  921,  921,    0,    0,    0,
			    0,    0,    0,    0,  900,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  906,  906,  906,  906,  906,  906,  906,
			  906,  906,  906,  906,  906,  906,  906,  906,  906,  906,
			  906,  906,  906,  906,  906,  906,  906,  906,  906,  906,

			  906,  906,  907,  907,    0,  907,  907,  907,  907,  907,
			  907,  907,  907,  907,  907,  907,  907,  907,  907,  907,
			  907,    0,  907,  907,  907,  907,  907,  907,  907,  907,
			  907,  908,  908,    0,  908,  908,  908,  908,  908,  908,
			  908,  908,  908,  908,  908,  908,  908,  908,  908,  908,
			  908,  908,  908,  908,  908,  908,  908,  908,  908,  908,
			  909,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  909,  909,  909,  909,  909,  909,  909,  909,  909,
			  910,  910,  910,  910,    0,  910,  910,  910,    0,    0,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  911,

			  911,    0,  911,    0,  911,  911,  911,    0,    0,  911,
			  911,  911,    0,    0,  911,  911,  911,  911,  911,  911,
			  911,  911,  911,  912,  912,    0,  912,  912,  912,  912,
			  912,  912,  912,  912,  912,  912,  912,  912,  912,  912,
			  912,  912,  912,  912,  912,  912,  912,  912,  912,  912,
			  912,  912,  913,  913,    0,  913,  913,  913,  913,  913,
			  913,  913,  913,  913,  913,  913,  913,  913,  913,  913,
			  913,    0,  913,  913,  913,  913,  913,  913,  913,  913,
			  913,  914,  914,  914,  914,  914,  914,  914,  914,  914,
			  914,  914,  914,  914,  914,  914,  914,  914,  914,  914,

			  914,  914,  914,  914,  914,  914,  914,  914,  914,  914,
			  915,  915,  915,  915,  915,  915,  915,  915,  915,  915,
			  915,  915,  915,  915,  915,  915,  915,  915,  915,  915,
			  915,  915,  915,  915,  915,  915,  915,  915,  915,  916,
			    0,  916,    0,    0,    0,    0,  916,    0,  916,  916,
			  916,    0,    0,  916,  916,  916,    0,    0,  916,  916,
			  916,  916,  916,  916,  916,  916,  916,  917,  917,    0,
			  917,  917,  917,  917,  917,  917,  917,  917,  917,  917,
			  917,  917,  917,  917,  917,  917,  917,  917,  917,  917,
			  917,  917,  917,  917,  917,  917,  918,  918,  918,  918,

			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  919,  919,  919,  919,    0,
			    0,  919,  919,  919,  919,    0,  919,  919,  919,  919,
			  919,  919,  919,  919,  919,  920,    0,    0,  920,  920,
			  920,  920,  920,  920,  920,  920,    0,    0,  920,  920,
			  920,  920,  920,  920,  920,  920,  920,  922,  922,  922,
			  922,  922,  922,  922,  922,  922,    0,  922,  922,  922,
			  922,  922,  922,  922,  922,  922,  922,  922,  922,  922,
			  922,  922,  922,  922,  922,  922,  923,  923,  923,  923,

			  923,  923,  923,  923,  923,  923,  923,  923,  923,  923,
			  923,  923,  923,  923,  923,  923,  923,  923,  923,  923,
			  923,  923,  923,  923,  923,  924,  924,  924,  924,  924,
			  924,  924,  924,  924,  924,  924,  924,  924,  924,  924,
			  924,  924,  924,  924,  924,  924,  924,  924,  924,  924,
			  924,  924,  924,  924,  925,  925,  925,    0,    0,  925,
			  925,  925,    0,    0,  925,  925,  925,  925,  925,  925,
			  925,  925,  925,  926,  926,  926,    0,    0,  926,  926,
			  926,    0,    0,  926,  926,  926,  926,  926,  926,  926,
			  926,  926,  927,  927,  927,  927,    0,    0,  927,  927,

			  927,  927,    0,  927,  927,  927,  927,  927,  927,  927,
			  927,  927,  928,  928,  928,  928,  928,  928,  928,  928,
			  928,  928,  928,  928,  928,  928,  928,  928,  928,  928,
			  928,  928,  928,  928,  928,  928,  928,  928,  928,  928,
			  928,  929,  929,  929,    0,    0,  929,  929,  929,  929,
			  929,  929,  929,  929,  929,  930,  930,  930,    0,    0,
			  930,  930,  930,  930,  930,  930,  930,  930,    0,    0,
			  930,  930,  930,    0,    0,  930,  930,  930,  930,  930,
			  930,  930,  930,  930,  931,  931,  931,    0,    0,  931,
			  931,  931,  931,  931,  931,  931,  931,  931,  932,  932, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  932,    0,    0,  932,  932,  932,    0,    0,  932,  932,
			  932,  932,  932,  932,  932,  932,  932,  933,  933,  933,
			    0,    0,  933,  933,  933,    0,    0,  933,  933,  933,
			  933,  933,  933,  933,  933,  933,  934,  934,  934,    0,
			    0,  934,  934,  934,  934,  934,  934,  934,  934,  934,
			  935,  935,  935,    0,    0,  935,  935,  935,    0,    0,
			  935,  935,  935,  935,  935,  935,  935,  935,  935,  936,
			  936,  936,    0,    0,  936,  936,  936,    0,    0,  936,
			  936,  936,  936,  936,  936,  936,  936,  936,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,

			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903, yy_Dummy>>,
			1, 181, 5000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   90,   95,   77,   79,   98,  102,  187,
			    0, 1764, 5088,  104, 1752, 1719, 1728, 5088,   86, 5088,
			 5088, 5088, 5088, 5088, 1711,  100, 1705,  266,  276, 5088,
			 5088, 1690, 5088, 1683, 5088,  100,  102,   85, 1679,  265,
			  276,   73,  267,   99,  275,  277,  334,  274,  101,  279,
			   86,   87, 5088, 5088, 1644,  413,  324,  331,  492,  325,
			  104,  111,  533,  280,  270,  337,  334,  327,  272,  297,
			 1675, 5088, 5088, 1676,  322, 5088,  107,  355,  318,  413,
			  322,  418,  363, 5088,  367,  373, 5088,  573, 1660, 1641,
			 1567, 5088,  153, 1606,  575,  579,  326, 1594, 5088, 1586,

			 5088, 1567,    0,  590, 1569, 1548,  598, 5088,  371,  604,
			  617,  648,  627,  662, 5088, 5088,  571,    0,  671,  674,
			  677,  691,  705,  709,  721,  733,  737,  740,  757,  772,
			  776,  790,  794,  806,  813,  809, 1478,  835,  840,  873,
			  937,  876,  949,  954,  892,  971,  909,  977, 1005, 1528,
			  127,  259,  477, 1483, 5088,  163, 1527,    0, 1071, 1518,
			  331,  372,  434, 1465,  567,  915,  590,  991,  433, 1010,
			  473,  478,  856, 1020,  569,  656,  926, 1023,  589,  588,
			 1027, 1033, 1503,  753,  631,  667, 1468, 1081,  861, 1048,
			 1052,  657, 1137,  664, 1139,  680,  681, 1096, 1055,  696,

			  686, 1142, 1144,  879,  741, 1149, 1154,  739, 1156,  709,
			 1159, 5088, 1515, 5088,  844, 5088, 5088, 1033,  421,  775,
			 1108, 1111,  773, 5088, 1459,  841,  857, 1450,  893, 1439,
			 5088,  583, 1399, 1467, 1464, 1203,  792, 1203, 1450, 1228,
			  829, 1283,  974, 5088, 5088, 5088, 1438, 1226, 1431, 1386,
			 1384, 1232, 1028, 5088, 1358, 1241, 1247, 1183, 1123, 1253,
			 1364, 1381, 1391, 1216, 1259,    0,    0, 1143, 1134, 1401,
			 1407,  912, 1413, 1426, 1430, 1445, 1442, 1449, 1470, 1473,
			 1474, 1476, 1495, 1502, 1521, 1187, 1534, 1539, 5088, 1551,
			 1568, 1598, 1610, 1584, 1621, 1628, 1638, 1554, 1644, 1656,

			 1672, 1675, 1692, 1699, 1705, 1712, 1103, 1655, 1721,  649,
			 5088,  691, 1096,  864,  942,    0, 1008,  579, 1517, 1733,
			 1166,  976, 1735, 1020, 1008, 1373, 1687, 1031, 1052, 1052,
			 1738, 1752, 1755, 1133, 1003, 1758, 1584, 1766, 1160, 1351,
			 1353, 1012, 1791, 1769, 1802, 1376, 1765,    0, 1216, 1396,
			 1428, 1772, 1806, 1437, 1446, 1628, 1822, 1440, 1456,  951,
			 1827, 1829, 1834,    0, 1839,  760, 1846, 1779,  736, 1791,
			 1795, 1808, 1820, 1824,  359, 5088,  949, 5088, 1887, 1911,
			  996, 1935, 5088, 1072, 1554,  978, 5088, 5088, 1900, 5088,
			 5088, 5088, 5088, 1647, 1925, 1932, 1949,  906, 1955, 1961,

			 1978, 1984, 1990, 2006, 2015, 2021, 2027,  929, 1068,    0,
			  891, 2036, 2040, 2043, 2056, 2059, 1864, 2071, 2076, 2091,
			 2111, 1846, 2114, 2088, 2118, 2130, 2134, 2146, 2131, 2163,
			 2190, 2202, 2214, 2226, 2241, 2257, 2150, 2174, 2243, 2178,
			 2271, 2283, 2297, 2202, 1105, 1427, 2310, 1843, 2330, 2340,
			  820,  848,    0, 1475,  789, 2349, 1941, 2358, 1501, 2360,
			 1557, 1577, 2276, 2362,    0, 1564, 1619, 2241, 2364, 2374,
			 1690, 1700, 2376, 1694, 1718, 1783, 2395, 2387, 2404, 1820,
			 2407, 1827, 1842, 2411, 2426,    0,    0, 2321, 2430, 1887,
			 1926, 2197, 2442, 2444,  864, 2446, 5088, 2462, 1112, 2473,

			 1204, 5088, 2488, 2501, 2507, 2513,  851, 2519, 2528, 2536,
			 2542, 2548, 2564,  153, 2576, 2588, 2291,  889,    0,    0,
			 2459, 2564, 2598, 2576, 2603, 2615, 2627, 2488, 2631,  839,
			 2643, 2659, 2656, 2678, 2671, 2684, 2703, 2711, 2772, 2732,
			 2028, 2744, 2747, 2691, 2732, 2594, 2801, 5088, 2808, 5088,
			 2829, 5088,  629,  756,    0,  750,  636, 2838, 2473, 2751,
			 1930, 2783, 1947, 1961, 2847, 2849, 2037, 2592, 2851, 2853,
			    0, 2034, 2528, 2043, 2078,    0, 1161, 2882, 2898, 2893,
			 2139, 2904, 2133, 2154, 2918, 2915, 2239, 2255, 2249, 2254,
			 2921, 2928, 2951,  744, 2816,  764, 2966, 2974, 2980, 2991,

			 2997,  729, 3004, 3010, 3020, 3026, 5088, 3031,    0,  759,
			 2865, 2870, 3040, 2935, 3043, 3047, 3059, 3063, 2358, 3066,
			 3080, 3085, 3102, 3108, 5088, 1408,  699, 3122, 3128, 3134,
			 3141, 2747, 3057, 3079, 3159, 3168, 3187,  653, 3177, 2351,
			 3197,  658,    0, 3146, 2371,    0, 3197, 3209, 2372, 2396,
			    0, 3213, 3215, 3219, 2412, 2427, 2539, 3225, 3229, 2529,
			 3235, 2578, 2595, 3242, 3245,    0, 2590, 2605, 2617, 3249,
			 3270, 3298, 3304,  641, 3315, 3326, 3332, 2634, 3338,  639,
			 3344, 3350, 3356,  626, 3365, 3264, 3281, 3369, 3286, 2861,
			 3372, 3388, 3391, 3404, 3407, 3396, 3424, 3428, 3440,  583,

			  577,  561,  506,  495, 1202, 3459, 2636, 3469, 2672, 3444,
			    0, 2681, 3384, 3480,    0,    0,    0, 3411, 3447,    0,
			 3482, 2673,    0, 3484, 3494, 2703, 2724, 2748, 3504, 3513,
			 3523, 3529, 3536, 3552, 2823, 3558, 3547, 3564,    0, 3576,
			 3579, 3594, 5088, 3598, 3561, 3616, 3628, 3622, 2896, 3143,
			 3239, 3600, 1250, 3645,  500, 2751, 2817, 3654, 2906, 3657,
			 2915, 3664, 2946, 3065,    0, 3573,  412, 3664, 3679, 3685,
			 3691, 3707, 3719, 5088, 3725,    0, 3734, 3737, 3707, 3740,
			 5088, 3752, 3757, 3736, 3746, 3756, 3759, 3803, 3098, 3179,
			 3812,    0, 3506, 3212, 3779,    0, 3220, 3814, 3824,  391,

			 3830, 3842, 3848, 1043, 3858, 3862, 3875, 3880,  723, 5088,
			 1580,  413, 3236,  803, 3887, 3237, 3894,  934, 2001, 3904,
			    0,  342, 3917, 3913, 3920, 3932, 3610, 3843, 3934, 3266,
			    0, 3937,    0, 3950, 3271, 3958, 3967, 1235, 3975, 3985,
			 3989, 3977, 3979, 3991,  943, 3375, 3997, 4039, 4024, 4009,
			  379,  319, 1414, 3378,    0, 4050, 4056, 5088, 4061,  243,
			 4067, 4076, 3905, 4064, 3407, 4097, 4103, 4121, 4127,  221,
			 4138, 4081, 4123, 4126,    0, 4149, 4162, 4160,  153,  126,
			 4177, 4183, 4109, 5088, 4197, 4161, 4163, 4203, 4209, 4204,
			 4205, 4220, 3702, 5088, 5088, 4226, 4238, 4244, 5088, 4250,

			 4262, 4268, 4274, 5088, 4314, 4343, 4372, 4401, 4430, 4450,
			 4469, 4493, 4522, 4551, 4580, 4609, 4637, 4666, 4695, 4715,
			 4737, 4277, 4766, 4795, 4824, 4843, 4862, 4882, 4911, 4925,
			 4954, 4968, 4987, 5006, 5020, 5039, 5058, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  903,    1,  904,  904,  905,  905,  906,  906,  903,
			    9,  903,  903,  903,  903,  903,  907,  903,  908,  903,
			  903,  903,  903,  903,  903,  903,  909,  903,  903,  903,
			  903,  903,  903,  903,  903,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  911,  903,  903,  912,  903,   55,   55,  903,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			  903,  903,  903,  913,  903,  903,  903,  913,  913,  913,
			  913,  913,  914,  903,  915,  914,  903,  903,  903,  903,
			  903,  903,  916,  903,  916,  916,  903,  903,  903,  907,

			  903,  917,  917,  917,  918,  903,  903,  903,  919,  903,
			  903,  903,  903,  903,  903,  903,  910,  920,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  903,   46,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  911,
			  911,  911,  911,  912,  903,  903,  903,  921,   58,  903,
			  158,  158,  158,  903,   58,   58,   58,   58,  158,   58,
			  158,  158,   58,   58,  158,  158,   58,   58,  158,  158,
			   58,   58,  158,   58,  158,  158,  158,   58,   58,   58,
			   58,  158,   58,  158,   58,  158,  158,   58,   58,  158,

			  158,   58,   58,  158,  158,   58,   58,  158,   58,  158,
			   58,  903,  913,  903,  903,  903,  903,  913,  913,  913,
			  913,  913,  914,  903,  922,  914,  915,  923,  915,  922,
			  903,  903,  903,  903,  924,  903,  916,  916,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  909,  903,  903,
			  903,  903,  903,  903,  903,  925,  926,  903,  920,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  903,  910,  910,  910,  910,  910,  910,  910,  903,  910,
			  910,  910,  910,  140,  140,  140,  910,  910,  910,  910,

			  910,  910,  910,  910,  910,  910,  903,  911,  911,  911,
			  903,  927,  903,  158,  158,  158,  903,  903,   58,   58,
			   58,  158,   58,  158,  158,   58,   58,  158,  158,  158,
			   58,   58,   58,  158,  158,   58,   58,  903,  158,  158,
			  158,  158,  158,   58,   58,  158,   58,  158,   58,  158,
			  158,   58,   58,  158,  158,   58,   58,  158,  158,  158,
			   58,   58,   58,  158,   58,  158,   58,  913,  913,  913,
			  913,  913,  913,  913,  922,  903,  923,  903,  903,  903,
			  928,  928,  903,  928,  928,  928,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,

			  903,  903,  903,  903,  903,  903,  903,  925,  926,  929,
			  920,  910,  910,  910,  910,  910,  910,  910,  910,  910,
			  910,  903,  910,  910,  910,  910,  910,  910,  140,  137,
			  137,  137,  903,  926,  430,  430,  910,  910,  903,  910,
			  910,  910,  910,  910,  903,  911,  911,  911,  911,  911,
			  911,  903,  930,  158,  158,  903,   58,   58,  158,   58,
			  158,  158,   58,   58,  158,  158,  158,   58,   58,   58,
			  158,  158,   58,  158,  158,  158,  926,   58,   58,  158,
			   58,  158,  158,   58,   58,  158,  158,   58,   58,  158,
			  158,  158,   58,   58,  158,   58,  903,  903,  903,  903,

			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  931,  932,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  903,
			  910,  910,  910,  910,  910,  910,  903,  926,  430,  538,
			  903,  910,  910,  910,  910,  925,  911,  903,  911,  903,
			  911,  903,  911,  903,  158,  158,  903,  903,   58,   58,
			  158,   58,  158,  158,   58,   58,  158,  158,   58,   58,
			  158,  158,   58,  158,  158,  158,  926,  926,   58,   58,
			  158,   58,  158,  158,   58,   58,  158,  158,  158,  158,
			   58,   58,  903,  903,  903,  903,  903,  903,  903,  903,

			  903,  903,  903,  903,  903,  903,  903,  903,  933,  932,
			  910,  910,  910,  910,  910,  910,  910,  910,  903,  910,
			  910,  910,  910,  910,  903,  926,  903,  910,  910,  910,
			  910,  903,  925,  925,  911,  911,  911,  911,  903,  158,
			  903,  903,  158,   58,  158,  158,   58,   58,  158,  158,
			  158,   58,   58,   58,  158,  158,  158,   58,   58,  158,
			   58,  158,  158,   58,   58,  158,  158,  158,  158,   58,
			   58,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  933,  910,  910,  910,  910,  910,  903,
			  910,  910,  910,  910,  910,  903,  910,  910,  910,  903,

			  903,  925,  925,  903,  903,  903,  158,  903,  158,   58,
			  158,  158,   58,   58,  158,  158,  158,   58,   58,  158,
			   58,  158,  158,   58,   58,  158,  158,  158,   58,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  934,  910,
			  910,  910,  903,  910,  903,  910,  910,  910,  903,  903,
			  931,  931,  903,  903,  903,  158,  158,   58,  158,   58,
			  158,   58,  158,  158,  158,   58,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  935,  910,  910,  910,  910,
			  903,  910,  910,  903,  903,  933,  933,  903,  158,  158,
			   58,  158,   58,  158,   58,  158,  158,   58,  903,  903,

			  903,  903,  903,  935,  910,  910,  910,  910,  903,  903,
			  933,  933,  158,  158,   58,  158,   58,  158,  903,  903,
			  936,  903,  910,  910,  910,  910,  903,  903,  933,  158,
			  158,   58,  158,   58,  158,  903,  903,  936,  903,  910,
			  910,  903,  903,  933,  158,  158,  903,  903,  910,  910,
			  903,  903,  933,  158,  158,  903,  903,  903,  903,  903,
			  903,  910,  903,  903,  158,  903,  903,  903,  903,  903,
			  903,  910,  903,  903,  158,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,

			  903,  903,  903,    0,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903, yy_Dummy>>)
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
			   16,   16,   16,   16,   16,   16,   16,   16,   16,   16,
			   16,   16,   16,   16,   16,   16,   16,   16,   16,   17,
			   16,   16,   18,   19,   20,    5,    5,   11,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   22,   23,   24,   25,   26,   27,   28,
			   29,    5,    5,    5,    5,    1,    1,    1,    1,    1,
			    1,    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,  104,  104,    0,    0,    0,
			    0,  135,  133,    1,    2,   15,  117,   18,  133,   16,
			   17,    7,    6,   13,    5,   11,    8,  109,  109,   14,
			   12,   28,   10,   29,   19,   97,   97,   97,   97,   97,
			   97,   97,   97,   97,   97,   97,   89,   97,   97,   97,
			   97,   21,   30,   22,    9,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			   23,   20,   24,  121,  122,  123,  124,  121,  121,  121,
			  121,  121,  104,  107,  134,  104,   72,   72,   69,   72,
			   72,   79,   79,   76,   79,   79,    1,    2,   27,  117,

			  116,  131,  131,  131,    3,   32,  115,   31,  101,    0,
			    0,  109,    0,  109,   26,   25,   97,    0,   97,   97,
			   97,   97,   97,   97,   97,   97,   97,   97,   97,   97,
			   97,   97,   97,   97,   97,   39,    0,   97,   96,   96,
			   88,   96,   96,   97,   97,   97,   97,   97,   97,    0,
			    0,    0,    0,    0,  108,    0,    0,    0,  100,    0,
			  100,  100,  100,    0,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,   39,  100,   39,  100,

			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  103,  121,  123,  122,  119,  118,  120,  121,  121,
			  121,  121,  104,  107,    0,  104,    0,    0,    0,  105,
			  106,    0,    0,   69,    0,    0,    0,    0,   76,    0,
			   75,    0,   74,   78,  131,  125,  131,  131,  131,  131,
			  131,  131,    4,   33,  115,    0,    0,    0,    0,    0,
			  111,    0,  109,    0,    0,    0,    0,    0,    0,   97,
			   97,   38,   97,   97,   97,   97,   97,   97,   97,   97,
			    0,   97,   97,   97,   97,   41,   97,   97,   95,   89,
			   89,   89,   89,   96,   97,   96,   96,   96,   97,   97,

			   97,   97,   97,   97,   40,   97,    0,    0,    0,    0,
			   99,  102,    0,  100,  100,   38,    0,    0,  100,  100,
			   38,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,    0,  100,  100,
			  100,   64,   64,  100,  100,  100,  100,   41,   41,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,   40,   40,  100,  100,  121,  121,  121,
			  121,  121,  121,  121,    0,  105,  106,   70,    0,    0,
			    0,    0,   77,   75,   74,   78,  129,  132,  132,  130,
			  126,  127,  128,  115,    0,  115,    0,    0,    0,  111,

			    0,    0,    0,  114,  109,    0,    0,    0,    0,    0,
			   98,   97,   97,   97,   97,   97,   37,   97,   97,   97,
			   97,    0,   97,   97,   97,   97,   97,   97,   88,   97,
			   97,   97,    0,    0,   88,   88,   88,   36,    0,   43,
			   97,   97,   97,   97,   73,    0,    0,    0,    0,    0,
			    0,    0,   61,  100,  100,    0,  100,  100,  100,  100,
			  100,  100,  100,  100,   37,  100,  100,   37,  100,  100,
			  100,  100,  100,  100,  100,  100,    0,  100,  100,  100,
			  100,  100,  100,  100,  100,   36,   43,   36,   43,  100,
			  100,  100,  100,  100,  100,  100,  106,    0,   68,    0,

			   67,   71,  115,    0,    0,    0,  110,  111,    0,  112,
			    0,  114,    0,    0,    0,  109,   85,    0,    0,    0,
			   58,   97,   97,   97,   97,   97,   97,   44,   97,    0,
			   97,   97,   35,   97,   97,   97,    0,    0,   97,   97,
			    0,   97,   97,   97,   97,    0,    0,   65,    0,   63,
			    0,   62,    0,    0,   58,  100,    0,    0,   58,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			   44,  100,   44,  100,  100,   35,   64,   64,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,    0,  115,    0,    0,    0,  111,  112,    0,

			    0,  114,    0,    0,    0,    0,   85,    0,    0,    0,
			   97,   59,   97,   60,   97,   97,   46,   97,    0,   97,
			   97,   97,   97,   97,   88,   88,    0,   52,   97,   97,
			   97,    0,    0,    0,    0,    0,    0,    0,    0,  100,
			    0,    0,   59,   59,  100,   60,  100,   60,  100,  100,
			   46,  100,  100,   46,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,   52,  100,  100,  100,   52,
			  100,    0,    0,  101,    0,  112,    0,  115,    0,   87,
			    0,    0,  113,    0,   97,   97,   57,   97,   45,    0,
			   42,   56,   34,   97,   50,    0,   97,   97,   97,    0,

			    0,    0,    0,    0,    0,    0,  100,    0,  100,  100,
			   57,  100,   57,  100,   45,   42,   56,   42,   56,   34,
			   34,  100,   50,  100,   50,  100,  100,  100,  100,    0,
			    0,  112,    0,    0,    0,    0,   84,  113,    0,   97,
			   97,   97,   92,   97,    0,   97,   97,   53,    0,    0,
			    0,    0,   66,    0,  102,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,   53,  100,  114,    0,  114,    0,
			    0,    0,    0,   84,  113,    0,   97,   97,   47,   97,
			   91,   51,   97,    0,    0,    0,    0,    0,  100,  100,
			  100,   47,   47,  100,  100,   51,  100,   51,  114,   86,

			    0,   84,  113,    0,   97,   97,   97,   97,   90,   90,
			   90,   90,  100,  100,  100,  100,  100,  100,    0,    0,
			    0,    0,   97,   49,   48,   97,    0,    0,    0,  100,
			   49,   49,   48,   48,  100,    0,    0,    0,    0,   97,
			   97,    0,    0,    0,  100,  100,   83,   80,   97,   54,
			    0,    0,    0,  100,   54,    0,    0,   83,    0,    0,
			    0,   97,    0,    0,  100,    0,    0,   80,    0,    0,
			   80,   55,    0,    0,   55,    0,   82,    0,    0,    0,
			    0,    0,    0,   82,   80,    0,    0,    0,    0,    0,
			    0,    0,   81,   93,   94,    0,    0,    0,   81,    0,

			   81,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 5088
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 903
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 904
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

	yyNb_rules: INTEGER = 134
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 135
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
