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
if yy_act <= 68 then
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
if yy_act <= 60 then
if yy_act <= 56 then
if yy_act <= 54 then
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
--|#line 178 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 178")
end
last_token := SYM_USE_ARCHETYPE
end
else
if yy_act = 55 then
--|#line 180 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 180")
end
last_token := SYM_ALLOW_ARCHETYPE
else
--|#line 182 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 182")
end
last_token := SYM_INCLUDE
end
end
else
if yy_act <= 58 then
if yy_act = 57 then
--|#line 184 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 184")
end
last_token := SYM_EXCLUDE
else
--|#line 186 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 186")
end
last_token := SYM_AFTER
end
else
if yy_act = 59 then
--|#line 188 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 188")
end
last_token := SYM_BEFORE
else
--|#line 190 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 190")
end
last_token := SYM_CLOSED
end
end
end
else
if yy_act <= 64 then
if yy_act <= 62 then
if yy_act = 61 then
--|#line 193 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 193")
end

			last_token := V_URI
			last_string_value := text
		
else
--|#line 200 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 200")
end

		last_token := V_ROOT_ID_CODE
		last_string_value := text_substring (2, text_count - 1)
	
end
else
if yy_act = 63 then
--|#line 206 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 206")
end

		last_token := V_ID_CODE
		last_string_value := text_substring (2, text_count - 1)
	
else
--|#line 213 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 213")
end

		last_token := V_ID_CODE_STR
		last_string_value := text
	
end
end
else
if yy_act <= 66 then
if yy_act = 65 then
--|#line 220 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 220")
end

		last_token := V_VALUE_SET_REF
		last_string_value := text_substring (2, text_count - 1)
	
else
--|#line 227 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 227")
end

		last_token := V_VALUE_DEF
		last_string_value := text_substring (2, text_count - 1)
	
end
else
if yy_act = 67 then
--|#line 234 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 234")
end

		last_token := V_VALUE_SET_REF_ASSUMED
		last_string_value := text_substring (2, text_count - 1)
		last_string_value.prune_all(' ')
		last_string_value.prune_all('%T')
	
else
--|#line 256 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 256")
end

		set_start_condition (IN_EXPANDED_VALUE_SET_DEF)
		create last_term_constraint_parse_structure_value.make
		str_ := text_substring (2, text_count)
		last_term_constraint_parse_structure_value.set_terminology_id (str_.substring (1, str_.index_of (':', 1)-1))
		is_assumed_code := False
	
end
end
end
end
end
end
else
if yy_act <= 102 then
if yy_act <= 85 then
if yy_act <= 77 then
if yy_act <= 73 then
if yy_act <= 71 then
if yy_act <= 70 then
if yy_act = 69 then
--|#line 265 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 265")
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
--|#line 280 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 280")
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
else
--|#line 295 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 295")
end
in_lineno := in_lineno + text_count
end
else
if yy_act = 72 then
--|#line 298 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 298")
end
in_lineno := in_lineno + 1
else
--|#line 300 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 300")
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
else
if yy_act <= 75 then
if yy_act = 74 then
--|#line 323 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 323")
end
	-- Catch-all rules (no backing up)
			last_token := ERR_VALUE_SET_DEF
			set_start_condition (INITIAL)
	
else
--|#line 341 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 341")
end

		set_start_condition (IN_EXTERNAL_VALUE_SET_DEF)
		create last_term_constraint_parse_structure_value.make
		str_ := text_substring (2, text_count)
		last_term_constraint_parse_structure_value.set_terminology_id (str_.substring (1, str_.index_of (':', 1)-1))
		is_assumed_code := False
	
end
else
if yy_act = 76 then
--|#line 350 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 350")
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
--|#line 365 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 365")
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
if yy_act <= 81 then
if yy_act <= 79 then
if yy_act = 78 then
--|#line 380 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 380")
end
in_lineno := in_lineno + text_count
else
--|#line 383 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 383")
end
in_lineno := in_lineno + 1
end
else
if yy_act = 80 then
--|#line 385 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 385")
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
--|#line 408 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 408")
end
	-- Catch-all rules (no backing up)
			last_token := ERR_VALUE_SET_DEF
			set_start_condition (INITIAL)
	
end
end
else
if yy_act <= 83 then
if yy_act = 82 then
--|#line 420 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 420")
end

					last_token := V_ARCHETYPE_ID
					last_string_value := text
			
else
--|#line 427 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 427")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
if yy_act = 84 then
--|#line 428 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 428")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 429 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 429")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
end
end
end
else
if yy_act <= 94 then
if yy_act <= 90 then
if yy_act <= 88 then
if yy_act <= 87 then
if yy_act = 86 then
--|#line 436 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 436")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 437 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 437")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
else
--|#line 444 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 444")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
else
if yy_act = 89 then
--|#line 445 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 445")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
--|#line 452 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 452")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
end
else
if yy_act <= 92 then
if yy_act = 91 then
--|#line 453 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 453")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 465 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 465")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
if yy_act = 93 then
--|#line 475 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 475")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text_substring(2, text_count)
			
else
--|#line 480 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 480")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
end
end
end
else
if yy_act <= 98 then
if yy_act <= 96 then
if yy_act = 95 then
--|#line 490 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 490")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
				last_string_value.put('T', last_string_value.index_of(' ', 1))
			
else
--|#line 496 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 496")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
if yy_act = 97 then
--|#line 507 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 507")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN_ERR
				unread_character(last_string_value.item(last_string_value.count)) -- put back the last character 
				last_string_value := text
			
else
--|#line 516 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 516")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
end
end
else
if yy_act <= 100 then
if yy_act = 99 then
--|#line 522 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 522")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 528 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 528")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
end
else
if yy_act = 101 then
--|#line 534 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 534")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
else
--|#line 541 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 541")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
end
end
end
end
end
else
if yy_act <= 119 then
if yy_act <= 111 then
if yy_act <= 107 then
if yy_act <= 105 then
if yy_act <= 104 then
if yy_act = 103 then
--|#line 547 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 547")
end
		-- matches an absolute path string with segments of form "/attr_name" or "/attr_name[id-code]"
			last_token := V_ABS_PATH
			last_string_value := text
		
else
--|#line 553 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 553")
end
		-- matches a relative path string with segments of form "/attr_name" or "/attr_name[id-code]"
			last_token := V_REL_PATH
			last_string_value := text
		
end
else
--|#line 559 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 559")
end

			last_token := SYM_START_CBLOCK
			set_start_condition (IN_REGEXP1)
			in_buffer.append_character ('/')
		
end
else
if yy_act = 106 then
--|#line 566 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 566")
end
 		-- match segment consisting of non / or [
				in_buffer.append_string (text)
	
else
--|#line 570 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 570")
end
 		-- match [] segment
				in_buffer.append_string (text)
	
end
end
else
if yy_act <= 109 then
if yy_act = 108 then
--|#line 574 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 574")
end
 		-- match segment ending in quoted slashes '\/'
				in_buffer.append_string (text)
	
else
--|#line 578 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 578")
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
if yy_act = 110 then
--|#line 590 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 590")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
else
--|#line 597 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 597")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
end
end
else
if yy_act <= 115 then
if yy_act <= 113 then
if yy_act = 112 then
--|#line 602 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 602")
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
--|#line 617 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 617")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
end
else
if yy_act = 114 then
--|#line 618 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 618")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
else
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
			
end
end
else
if yy_act <= 117 then
if yy_act = 116 then
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
			
else
--|#line 624 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 624")
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
if yy_act = 118 then
--|#line 644 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 644")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 649 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 649")
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
if yy_act <= 128 then
if yy_act <= 124 then
if yy_act <= 122 then
if yy_act <= 121 then
if yy_act = 120 then
--|#line 657 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 657")
end
in_buffer.append_character ('\')
else
--|#line 659 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 659")
end
in_buffer.append_character ('"')
end
else
--|#line 661 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 661")
end

				in_buffer.append_string (text)
	
end
else
if yy_act = 123 then
--|#line 665 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 665")
end
in_buffer.append_string (text)
else
--|#line 667 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 667")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
end
else
if yy_act <= 126 then
if yy_act = 125 then
--|#line 672 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 672")
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
--|#line 683 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 683")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
else
if yy_act = 127 then
--|#line 691 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 691")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
--|#line 693 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 693")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
end
end
else
if yy_act <= 132 then
if yy_act <= 130 then
if yy_act = 129 then
--|#line 694 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 694")
end
last_token := V_CHARACTER; last_character_value := '%R'
else
--|#line 695 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 695")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 131 then
--|#line 696 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 696")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 697 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 697")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 134 then
if yy_act = 133 then
--|#line 699 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 699")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 700 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 700")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 135 then
--|#line 704 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 704")
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
			create an_array.make_filled (0, 0, 5240)
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
			  265,  266,  123,  151,  152,  236,   90,  132,  236,  318,
			   90,  216,  180,  118,  121,  155,  148,  119,  155,  120,
			  145,  610,  610,  156,  181,  146,  183,  901,   77,   78,
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
			  109,  900,  110,  306,  111,  111,  111,  111,  111,  111,
			  109,  117,  110,  117,  113,  113,  113,  113,  113,  113,

			  117,  117,  117,  117,  124,  117,  126,  129,  130,  134,
			  191,  143,  193,  131,  207,  125,  883,  133,  127,  144,
			  309,  147,  135,  112,  214,  213,  214,  214,   96,  213,
			   96,   96,  124,  112,  126,  129,  130,  134,  192,  143,
			  194,  131,  208,  884,  125,  133,  127,  144,  209,  147,
			  135,  136,  137,  137,  137,  137,  137,  137,  168,  158,
			  117,  170,  213,  158,  174,  158,  158,  138,  203,  195,
			  171,  199,  158,  204,  139,  175,  499,  210,  314,  200,
			  223,  140,  196,  141,  227,  142,  169,  164,  257,  172,
			  230,  164,  176,  164,  164,  138,  205,  197,  173,  201,

			  164,  206,  139,  878,  177,  218,  314,  202,  220,  220,
			  198,  315,  141,  375,  142,  155,  224,  225,  155,  877,
			  213,  228,  229,  156,  258,  213,  224,  225,  213,  853,
			  157,  158,  158,  158,  158,  158,  158,  159,  748,  315,
			  217,  217,  217,  158,  158,  158,  158,  158,  160,  158,
			  158,  158,  161,  158,  162,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  163,  316,  322,  833,
			  158,  164,  164,  164,  164,  164,  165,  164,  164,  164,
			  166,  164,  167,  164,  164,  164,  164,  164,  164,  164,
			  164,  164,  164,  164,  155,  316,  322,  155,  219,  219,

			  219,  606,  156,  221,  221,  221,  217,  217,  217,  157,
			  158,  158,  158,  158,  158,  158,  159,  157,  236,  764,
			  324,  236,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  163,  306,  306,  324,  158,
			  164,  164,  164,  164,  164,  164,  164,  164,  164,  164,
			  164,  164,  164,  164,  164,  164,  164,  164,  164,  164,
			  164,  164,  164,  184,  185,  231,  761,  239,  231,  186,
			  239,  239,  760,  307,  239,  231,  265,  266,  231,  240,
			  241,  759,  310,  240,  187,  267,  313,  117,  308,  246,

			  242,  188,  189,  410,  242,  265,  266,  190,  247,  247,
			  247,  247,  247,  247,  318,  325,  254,  254,  254,  254,
			  254,  254,  259,  259,  259,  259,  259,  259,  328,  315,
			  243,  232,  255,  334,  243,  260,  260,  260,  260,  260,
			  260,  232,  758,  325,  248,  264,  264,  264,  264,  264,
			  264,  261,  649,  306,  748,  256,  328,  320,  744,  249,
			  255,  334,  109,  250,  110,  251,  262,  262,  262,  262,
			  262,  262,  263,  306,  335,  257,  109,  157,  110,  261,
			  262,  262,  262,  262,  262,  262,  265,  266,  329,  265,
			  266,  650,  265,  266,  330,  267,  646,  117,  267,  339,

			  117,  267,  335,  117,  340,  112,  265,  266,  157,  453,
			  271,  346,  348,  270,  350,  267,  329,  117,  269,  112,
			  265,  266,  330,  713,  265,  266,  272,  339,  841,  267,
			  351,  117,  340,  267,  354,  117,  265,  266,  271,  346,
			  348,  270,  350,  712,  454,  267,  269,  117,  265,  266,
			  273,  274,  265,  266,  272,  265,  266,  267,  351,  117,
			  213,  267,  354,  117,  267,  276,  117,  275,  265,  266,
			  842,  277,  265,  266,  704,  355,  278,  338,  273,  274,
			  681,  280,  366,  117,  360,  279,  265,  265,  266,  364,
			  223,  265,  266,  276,  240,  275,  267,  240,  117,  277,

			  267,  515,  117,  355,  278,  265,  266,  506,  282,  265,
			  266,  366,  360,  279,  267,  281,  117,  364,  267,  682,
			  117,  265,  266,  227,  265,  266,  224,  225,  265,  266,
			  267,  242,  117,  267,  242,  117,  282,  267,  497,  117,
			  218,  284,  287,  281,  306,  286,  214,  283,  214,  214,
			  265,  266,  918,  285,  562,  265,  266,  136,  230,  267,
			  228,  229,  384,  383,  267,  384,  117,  497,  289,  284,
			  287,  265,  266,  286,  377,  290,  265,  266,  559,  648,
			  318,  285,  116,  562,  291,  318,  292,  293,  265,  266,
			  136,  265,  266,  136,  224,  225,  289,  267,  456,  117,

			  267,  324,  117,  290,  339,  647,  138,  265,  266,  138,
			  625,  228,  229,  291,  109,  292,  267,  358,  117,  548,
			  293,  359,  141,  293,  265,  266,  456,  265,  266,  326,
			  265,  266,  344,  267,  138,  117,  267,  138,  117,  318,
			  300,  265,  266,  303,  252,  358,  252,  252,  457,  359,
			  318,  141,  265,  266,  136,  294,  294,  294,  294,  294,
			  294,  267,  314,  117,  265,  266,  136,  614,  300,  265,
			  266,  303,  328,  267,  295,  117,  457,  296,  267,  560,
			  117,  411,  138,  297,  461,  845,  265,  266,  298,  139,
			  319,  299,  265,  266,  765,  267,  293,  117,  141,  849, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  331,  267,  295,  117,  463,  296,  265,  266,  112,  301,
			  138,  297,  461,  302,  845,  318,  298,  139,  464,  299,
			  265,  266,  304,  521,  316,  265,  266,  141,  849,  267,
			  467,  117,  463,  766,  318,  265,  266,  301,  265,  266,
			  213,  302,  265,  266,  318,  322,  464,  318,  265,  266,
			  304,  318,  321,  468,  469,  329,  305,  318,  467,  835,
			  836,  330,  325,  265,  266,  473,  334,  265,  266,  508,
			  265,  266,  318,  323,  385,  383,  318,  385,  335,  318,
			  340,  468,  469,  332,  266,  305,  265,  266,  351,  333,
			  327,  476,  267,  473,  336,  267,  265,  266,  477,  342,

			  343,  343,  343,  343,  343,  318,  337,  445,  345,  341,
			  445,  265,  266,  383,  501,  213,  353,  501,  213,  476,
			  318,  368,  369,  370,  371,  372,  477,  213,  350,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  265,  266,  265,  266,  352,  265,  266,  265,
			  266,  318,  383,  318,  265,  266,  318,  376,  318,  265,
			  266,  265,  266,  318,  265,  266,  354,  479,  318,  799,
			  318,  265,  266,  318,  346,  267,  348,  358,  360,  478,
			  318,  359,  355,  217,  217,  217,  373,  373,  373,  265,

			  266,  364,  265,  266,  356,  374,  374,  374,  318,  494,
			  366,  267,  347,  117,  349,  361,  363,  478,  800,  362,
			  357,  379,  380,  380,  380,  380,  380,  479,  239,  365,
			  239,  239,  474,  239,  406,  406,  406,  406,  406,  367,
			  240,  474,  240,  388,  389,  389,  389,  389,  389,  389,
			  395,  242,  395,  242,  482,  396,  396,  396,  396,  396,
			  396,  397,  397,  397,  397,  397,  397,  399,  399,  399,
			  399,  399,  399,  407,  407,  407,  407,  407,  407,  835,
			  836,  243,  482,  243,  381,  382,  383,  381,  382,  381,
			  381,  381,  381,  381,  381,  381,  381,  384,  241,  241,

			  381,  241,  241,  241,  241,  241,  241,  381,  385,  381,
			  381,  381,  381,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  381,  381,  386,  381,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  381,  381,  381,  381,  381,  381,
			  381,  381,  381,  381,  381,  381,  394,  394,  394,  394,
			  394,  394,  400,  400,  400,  400,  400,  400,  265,  266,
			  484,  485,  255,  458,  403,  455,  403,  318,  401,  404,

			  404,  404,  404,  404,  404,  109,  463,  110,  488,  405,
			  405,  405,  405,  405,  405,  256,  265,  266,  484,  485,
			  255,  402,  265,  266,  266,  267,  401,  117,  265,  266,
			  748,  267,  267,  117,  465,  412,  488,  267,  878,  117,
			  445,  265,  266,  553,  489,  265,  266,  411,  112,  413,
			  267,  306,  117,  410,  267,  414,  117,  265,  266,  415,
			  265,  266,  492,  412,  265,  266,  267,  503,  117,  267,
			  503,  117,  489,  267,  398,  117,  416,  413,  493,  417,
			  561,  418,  554,  414,  567,  265,  266,  415,  265,  266,
			  492,  265,  266,  918,  267,  419,  117,  267,  410,  117,

			  267,  393,  117,  422,  416,  392,  493,  417,  561,  418,
			  265,  266,  567,  391,  422,  423,  420,  265,  266,  267,
			  569,  117,  764,  419,  422,  764,  267,  390,  117,  255,
			  421,  570,  265,  266,  424,  532,  265,  266,  387,  238,
			  425,  318,  422,  423,  420,  267,  532,  117,  569,  265,
			  266,  456,  256,  426,  265,  266,  532,  255,  267,  570,
			  117,  213,  424,  267,  868,  117,  265,  266,  425,  265,
			  266,  136,  378,  428,  532,  267,  233,  117,  267,  459,
			  117,  426,  427,  265,  266,  841,  430,  430,  430,  430,
			  430,  430,  267,  868,  117,  573,  748,  235,  429,  265,

			  266,  428,  116,  116,  116,  116,  116,  116,  318,  375,
			  427,  376,  375,  265,  266,  429,  431,  431,  431,  431,
			  431,  431,  267,  573,  117,  265,  266,  843,  432,  432,
			  432,  432,  432,  432,  267,  433,  117,  434,  918,  217,
			  217,  217,  213,  265,  266,  429,  116,  116,  116,  116,
			  116,  116,  318,  265,  266,  136,  341,  429,  435,  265,
			  266,  436,  267,  280,  117,  116,  574,  437,  267,  488,
			  117,  265,  266,  446,  447,  447,  447,  447,  447,  306,
			  439,  577,  117,  317,  297,  438,  435,  265,  266,  436,
			  265,  266,  313,  116,  574,  437,  267,  490,  117,  267,

			  311,  117,  265,  266,  578,  154,  440,  265,  266,  577,
			  306,  318,  297,  438,  265,  266,  267,  288,  117,  441,
			  265,  266,  253,  267,  252,  117,  245,  265,  266,  267,
			  100,  117,  578,  464,  440,   97,  267,  442,  117,  448,
			  449,  449,  449,  449,  449,  306,  238,  441,  450,  451,
			  452,  452,  452,  452,  306,  580,  443,  265,  266,  265,
			  266,  466,  235,  444,  234,  442,  318,  233,  318,  265,
			  266,  265,  266,  265,  266,  213,  265,  266,  318,  211,
			  318,  154,  318,  580,  457,  318,  461,  313,  467,  265,
			  266,  213,  444,  117,  410,  468,  265,  266,  318,  422,

			  265,  266,  265,  266,  469,  318,  213,  473,  115,  318,
			  422,  318,  460,  476,  462,  485,  470,  482,  114,  107,
			  422,  489,  479,  471,  343,  343,  343,  343,  343,  343,
			  265,  266,  472,  265,  266,  475,  213,  104,  422,  318,
			  213,  480,  318,  487,  213,  483,  265,  266,  100,  491,
			  265,  266,  265,  266,  477,  318,  265,  266,   98,  318,
			   97,  318,  918,  265,  266,  318,  484,  918,  555,  219,
			  219,  219,  318,  918,  581,  492,  306,  582,  500,  918,
			  493,  500,  481,  918,  918,  220,  220,  918,  382,  383,
			  501,  382,  502,  918,  486,  265,  266,  587,  494,  497,

			  384,  503,  581,  495,  267,  582,  117,  556,  496,  918,
			  918,  385,  265,  266,  221,  221,  221,  918,  217,  217,
			  217,  318,  217,  217,  217,  587,  500,  918,  498,  500,
			  918,  504,  396,  396,  396,  396,  396,  396,  501,  918,
			  502,  386,  380,  380,  380,  380,  380,  380,  589,  503,
			  388,  389,  389,  389,  389,  389,  389,  505,  505,  505,
			  505,  505,  505,  507,  507,  507,  507,  507,  507,  509,
			  509,  509,  509,  509,  509,  918,  589,  918,  918,  504,
			  918,  510,  510,  510,  510,  510,  510,  513,  513,  513,
			  513,  513,  513,  511,  590,  511,  506,  401,  512,  512, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  512,  512,  512,  512,  404,  404,  404,  404,  404,  404,
			  514,  514,  514,  514,  514,  514,  551,  918,  593,  551,
			  402,  918,  590,  516,  517,  401,  518,  518,  518,  518,
			  518,  518,  519,  519,  519,  519,  519,  519,  520,  520,
			  520,  520,  520,  520,  265,  266,  593,  265,  266,  515,
			  265,  266,  918,  267,  549,  117,  267,  549,  117,  267,
			  918,  117,  265,  266,  594,  918,  918,  265,  266,  651,
			  918,  267,  642,  117,  523,  918,  267,  551,  117,  595,
			  525,  524,  265,  266,  918,  526,  527,  265,  266,  918,
			  596,  267,  594,  117,  265,  266,  267,  651,  117,  918,

			  653,  654,  523,  267,  918,  117,  918,  595,  525,  531,
			  524,  265,  266,  526,  527,  528,  265,  266,  596,  529,
			  267,  918,  117,  265,  266,  267,  410,  117,  653,  654,
			  530,  543,  267,  918,  117,  265,  266,  531,  657,  533,
			  265,  266,  543,  528,  267,  918,  117,  529,  611,  267,
			  611,  117,  543,  918,  918,  663,  534,  918,  530,  612,
			  633,  535,  536,  265,  266,  918,  657,  533,  265,  266,
			  543,  633,  267,  116,  117,  664,  116,  267,  665,  117,
			  918,  633,  116,  663,  534,  265,  266,  613,  918,  535,
			  536,  265,  266,  537,  267,  668,  117,  670,  538,  633,

			  267,  116,  117,  664,  116,  918,  665,  918,  265,  266,
			  116,  430,  430,  430,  430,  430,  430,  267,  671,  117,
			  674,  537,  918,  668,  918,  670,  538,  431,  431,  431,
			  431,  431,  431,  116,  432,  432,  432,  432,  432,  432,
			  675,  676,  677,  716,  116,  918,  671,  918,  674,  116,
			  539,  539,  539,  539,  539,  539,  265,  266,  116,  918,
			  116,  116,  918,  548,  266,  318,  918,  116,  675,  676,
			  677,  716,  267,  116,  117,  265,  266,  116,  540,  540,
			  540,  540,  540,  540,  267,  918,  117,  116,  574,  116,
			  541,  541,  541,  541,  541,  541,  116,  542,  542,  542,

			  542,  542,  542,  918,  918,  116,  265,  266,  544,  265,
			  266,  658,  116,  265,  266,  267,  576,  117,  318,  265,
			  266,  918,  318,  659,  545,  718,  918,  918,  267,  918,
			  117,  587,  549,  116,  546,  549,  544,  918,  918,  658,
			  116,  918,  918,  561,  918,  547,  550,  549,  265,  266,
			  549,  659,  545,  718,  306,  551,  918,  318,  918,  588,
			  918,  550,  546,  447,  447,  447,  447,  447,  447,  306,
			  551,  565,  553,  547,  449,  449,  449,  449,  449,  449,
			  306,  918,  720,  918,  557,  552,  452,  452,  452,  452,
			  452,  452,  306,  563,  564,  564,  564,  564,  564,  555,

			  552,  452,  452,  452,  452,  452,  452,  306,  265,  266,
			  720,  554,  265,  266,  918,  265,  266,  318,  265,  266,
			  918,  318,  918,  558,  318,  265,  266,  318,  918,  721,
			  265,  266,  265,  266,  318,  569,  724,  570,  556,  318,
			  918,  318,  562,  918,  725,  567,  726,  265,  266,  577,
			  583,  584,  584,  584,  584,  584,  318,  721,  573,  265,
			  266,  918,  589,  571,  724,  572,  265,  266,  318,  918,
			  580,  566,  725,  568,  726,  318,  729,  579,  265,  266,
			  265,  266,  265,  266,  548,  266,  575,  318,  918,  318,
			  591,  318,  581,  318,  500,  918,  590,  500,  585,  918,

			  594,  850,  850,  850,  729,  638,  501,  379,  599,  599,
			  599,  599,  599,  593,  265,  266,  639,  503,  265,  266,
			  586,  918,  918,  267,  592,  117,  640,  318,  598,  600,
			  600,  600,  600,  600,  600,  601,  601,  601,  601,  601,
			  601,  597,  918,  918,  639,  918,  918,  504,  394,  394,
			  394,  394,  394,  394,  602,  603,  603,  603,  603,  603,
			  604,  604,  604,  604,  604,  604,  265,  266,  506,  512,
			  512,  512,  512,  512,  512,  318,  401,  605,  605,  605,
			  605,  605,  605,  607,  607,  607,  607,  607,  607,  608,
			  608,  608,  608,  608,  608,  918,  731,  918,  732,  402,

			  918,  918,  265,  266,  401,  609,  609,  609,  609,  609,
			  609,  267,  918,  117,  265,  266,  606,  604,  604,  604,
			  604,  604,  604,  267,  731,  117,  732,  517,  515,  518,
			  518,  518,  518,  518,  518,  735,  265,  266,  918,  918,
			  619,  265,  266,  918,  617,  267,  918,  117,  265,  266,
			  267,  736,  117,  265,  266,  618,  698,  318,  737,  620,
			  767,  768,  267,  735,  117,  265,  266,  651,  619,  265,
			  266,  621,  770,  698,  267,  772,  117,  698,  267,  736,
			  117,  265,  266,  618,  622,  774,  737,  620,  767,  768,
			  267,  918,  117,  265,  266,  652,  623,  265,  266,  621,

			  770,  698,  267,  772,  117,  624,  267,  775,  117,  265,
			  266,  627,  622,  774,  265,  266,  626,  776,  267,  743,
			  117,  265,  266,  318,  623,  265,  266,  918,  918,  918,
			  267,  918,  117,  624,  267,  775,  117,  265,  266,  627,
			  628,  918,  402,  918,  626,  776,  267,  743,  117,  539,
			  539,  539,  539,  539,  539,  629,  630,  266,  918,  540,
			  540,  540,  540,  540,  540,  267,  265,  266,  628,  542,
			  542,  542,  542,  542,  542,  318,  918,  631,  802,  265,
			  266,  718,  918,  629,  630,  265,  266,  632,  267,  803,
			  117,  116,  265,  266,  267,  918,  117,  918,  634,  265,

			  266,  318,  265,  266,  635,  631,  802,  918,  267,  719,
			  117,  267,  805,  117,  918,  632,  433,  803,  434,  116,
			  541,  541,  541,  541,  541,  541,  634,  265,  266,  636,
			  265,  266,  635,  918,  648,  116,  267,  918,  117,  318,
			  805,  708,  436,  690,  690,  690,  690,  690,  437,  664,
			  265,  266,  708,  918,  637,  918,  918,  636,  918,  267,
			  918,  117,  709,  116,  680,  680,  680,  680,  680,  680,
			  436,  918,  265,  266,  918,  918,  437,  666,  918,  918,
			  708,  318,  637,  446,  641,  641,  641,  641,  641,  306,
			  448,  643,  643,  643,  643,  643,  306,  450,  644,  644,

			  644,  644,  644,  306,  450,  645,  644,  644,  644,  644,
			  306,  649,  807,  564,  564,  564,  564,  564,  564,  265,
			  266,  265,  266,  265,  266,  265,  266,  918,  318,  918,
			  318,  918,  318,  918,  318,  918,  809,  265,  266,  654,
			  807,  657,  265,  266,  658,  653,  267,  810,  117,  918,
			  650,  267,  693,  117,  918,  479,  659,  584,  584,  584,
			  584,  584,  584,  267,  809,  265,  266,  656,  696,  660,
			  265,  266,  661,  655,  318,  810,  265,  266,  521,  318,
			  693,  265,  266,  665,  662,  318,  265,  266,  918,  668,
			  318,  827,  708,  265,  266,  318,  696,  918,  918,  918, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  671,  521,  318,  710,  500,  674,  670,  500,  918,  828,
			  918,  667,  675,  711,  918,  709,  501,  669,  502,  827,
			  599,  599,  599,  599,  599,  599,  711,  503,  673,  265,
			  266,  710,  918,  678,  672,  918,  711,  828,  318,  681,
			  679,  603,  603,  603,  603,  603,  603,  604,  604,  604,
			  604,  604,  604,  918,  711,  918,  918,  504,  781,  781,
			  781,  781,  918,  683,  684,  684,  684,  684,  684,  684,
			  685,  685,  685,  685,  685,  685,  918,  918,  682,  686,
			  686,  686,  686,  686,  686,  687,  687,  687,  687,  687,
			  687,  683,  688,  688,  688,  688,  688,  688,  918,  918,

			  918,  752,  918,  606,  689,  689,  689,  689,  689,  689,
			  691,  691,  691,  691,  691,  691,  265,  266,  752,  265,
			  266,  830,  752,  265,  266,  267,  261,  117,  267,  918,
			  117,  694,  267,  918,  117,  918,  265,  266,  695,  265,
			  266,  918,  265,  266,  918,  267,  752,  117,  267,  830,
			  117,  267,  832,  117,  261,  754,  265,  266,  918,  694,
			  697,  700,  265,  266,  844,  267,  695,  117,  265,  266,
			  699,  267,  754,  117,  265,  266,  754,  267,  847,  117,
			  832,  702,  918,  267,  918,  117,  703,  701,  697,  700,
			  265,  266,  844,  265,  266,  918,  265,  266,  699,  267,

			  754,  117,  267,  918,  117,  318,  847,  265,  266,  702,
			  706,  918,  265,  266,  703,  701,  267,  918,  117,  859,
			  705,  318,  721,  549,  918,  707,  549,  553,  918,  643,
			  643,  643,  643,  643,  643,  306,  918,  550,  706,  641,
			  641,  641,  641,  641,  641,  306,  551,  859,  705,  918,
			  723,  918,  555,  707,  644,  644,  644,  644,  644,  644,
			  306,  783,  784,  783,  784,  557,  554,  644,  644,  644,
			  644,  644,  644,  306,  860,  918,  552,  714,  715,  715,
			  715,  715,  715,  563,  717,  717,  717,  717,  717,  265,
			  266,  556,  265,  266,  265,  266,  265,  266,  318,  918,

			  785,  318,  860,  318,  558,  318,  265,  266,  720,  918,
			  265,  266,  869,  726,  856,  318,  918,  265,  266,  318,
			  918,  879,  856,  725,  918,  731,  318,  729,  732,  600,
			  600,  600,  600,  600,  600,  856,  722,  265,  266,  889,
			  869,  728,  918,  265,  266,  918,  267,  735,  117,  879,
			  856,  727,  267,  733,  117,  730,  734,  602,  739,  739,
			  739,  739,  739,  740,  918,  740,  918,  889,  741,  741,
			  741,  741,  741,  741,  918,  738,  741,  741,  741,  741,
			  741,  741,  742,  742,  742,  742,  742,  742,  608,  608,
			  608,  608,  608,  608,  745,  745,  745,  745,  745,  745,

			  746,  746,  746,  746,  746,  746,  747,  747,  747,  747,
			  747,  747,  265,  266,  918,  606,  265,  266,  918,  265,
			  266,  267,  743,  117,  918,  267,  918,  117,  267,  918,
			  117,  918,  265,  266,  918,  918,  751,  265,  266,  918,
			  750,  267,  749,  117,  918,  402,  267,  918,  117,  918,
			  743,  265,  266,  795,  265,  266,  918,  795,  265,  266,
			  267,  918,  117,  267,  751,  117,  918,  267,  750,  117,
			  749,  918,  265,  266,  795,  265,  266,  918,  918,  918,
			  753,  267,  918,  117,  267,  795,  117,  265,  266,  918,
			  918,  755,  918,  918,  918,  918,  267,  756,  117,  762,

			  763,  763,  763,  763,  763,  918,  757,  765,  753,  715,
			  715,  715,  715,  715,  715,  918,  918,  918,  918,  755,
			  918,  918,  918,  918,  649,  756,  717,  717,  717,  717,
			  717,  717,  265,  266,  757,  265,  266,  792,  265,  266,
			  918,  318,  265,  266,  318,  918,  766,  318,  265,  266,
			  918,  318,  265,  266,  792,  770,  768,  318,  792,  265,
			  266,  318,  918,  650,  265,  266,  265,  266,  318,  265,
			  266,  265,  266,  318,  918,  267,  918,  117,  318,  918,
			  318,  918,  792,  771,  769,  772,  918,  681,  774,  739,
			  739,  739,  739,  739,  739,  741,  741,  741,  741,  741,

			  741,  741,  741,  741,  741,  741,  741,  778,  778,  778,
			  778,  778,  778,  773,  918,  779,  777,  779,  918,  918,
			  780,  780,  780,  780,  780,  780,  682,  782,  782,  782,
			  782,  782,  782,  786,  786,  786,  786,  786,  786,  265,
			  266,  918,  265,  266,  918,  265,  266,  918,  267,  743,
			  117,  267,  918,  117,  318,  918,  788,  265,  266,  918,
			  918,  918,  265,  266,  918,  789,  267,  918,  117,  265,
			  266,  267,  402,  117,  265,  266,  790,  743,  267,  791,
			  117,  265,  266,  318,  788,  796,  918,  793,  857,  796,
			  267,  795,  117,  789,  918,  797,  857,  796,  918,  918,

			  794,  798,  265,  266,  790,  887,  796,  791,  870,  857,
			  870,  318,  797,  265,  266,  793,  887,  796,  798,  871,
			  918,  918,  318,  797,  857,  803,  887,  918,  794,  798,
			  799,  809,  763,  763,  763,  763,  763,  763,  714,  801,
			  801,  801,  801,  801,  887,  265,  266,  872,  265,  266,
			  918,  265,  266,  804,  318,  918,  918,  318,  918,  811,
			  267,  918,  117,  918,  805,  807,  918,  918,  918,  800,
			  780,  780,  780,  780,  780,  780,  812,  812,  812,  812,
			  812,  812,  813,  813,  813,  813,  813,  813,  918,  918,
			  918,  918,  806,  808,  613,  613,  613,  613,  613,  613,

			  814,  814,  814,  814,  814,  814,  815,  815,  815,  815,
			  815,  815,  918,  265,  266,  606,  816,  816,  816,  816,
			  816,  816,  267,  918,  117,  265,  266,  822,  265,  266,
			  918,  822,  743,  918,  267,  818,  117,  267,  918,  117,
			  265,  266,  918,  265,  266,  265,  266,  820,  822,  267,
			  918,  117,  318,  918,  267,  402,  117,  819,  823,  822,
			  743,  822,  823,  818,  918,  824,  823,  265,  266,  918,
			  825,  918,  918,  918,  918,  820,  318,  821,  918,  823,
			  265,  266,  824,  265,  266,  819,  830,  825,  918,  267,
			  823,  117,  318,  824,  918,  918,  918,  918,  825,  762,

			  826,  826,  826,  826,  826,  821,  765,  918,  801,  801,
			  801,  801,  801,  801,  831,  828,  778,  778,  778,  778,
			  778,  778,  834,  834,  834,  834,  834,  834,  783,  918,
			  783,  265,  266,  815,  815,  815,  815,  815,  815,  904,
			  267,  918,  117,  829,  918,  766,  816,  816,  816,  816,
			  816,  816,  265,  266,  918,  606,  904,  265,  266,  918,
			  904,  267,  839,  117,  265,  266,  267,  785,  117,  918,
			  918,  837,  918,  267,  799,  117,  826,  826,  826,  826,
			  826,  826,  265,  266,  904,  265,  266,  265,  266,  918,
			  839,  318,  918,  838,  318,  918,  267,  918,  117,  837, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  840,  851,  851,  851,  851,  851,  851,  748,  265,  266,
			  918,  918,  918,  800,  265,  266,  847,  267,  845,  117,
			  857,  918,  838,  267,  918,  117,  918,  918,  858,  840,
			  861,  861,  861,  861,  861,  861,  918,  918,  918,  918,
			  854,  858,  855,  918,  848,  918,  918,  846,  785,  785,
			  785,  785,  785,  785,  265,  266,  858,  862,  862,  862,
			  862,  862,  862,  267,  918,  117,  265,  266,  854,  918,
			  855,  865,  866,  265,  266,  267,  748,  117,  918,  865,
			  866,  918,  267,  918,  117,  864,  918,  918,  918,  866,
			  863,  918,  865,  866,  918,  918,  873,  867,  874,  875,

			  918,  862,  862,  862,  862,  862,  862,  865,  866,  918,
			  867,  265,  266,  864,  881,  881,  881,  881,  881,  863,
			  267,  918,  117,  918,  918,  867,  880,  880,  880,  880,
			  880,  880,  882,  882,  882,  882,  882,  882,  888,  876,
			  885,  885,  885,  885,  885,  885,  265,  266,  918,  888,
			  918,  265,  266,  893,  918,  267,  918,  117,  918,  888,
			  267,  918,  117,  918,  893,  886,  918,  876,  890,  890,
			  890,  890,  890,  890,  893,  918,  918,  888,  891,  891,
			  891,  891,  891,  891,  882,  882,  882,  882,  882,  882,
			  883,  918,  893,  886,  882,  882,  882,  882,  882,  882,

			  873,  894,  874,  892,  918,  885,  885,  885,  885,  885,
			  885,  918,  894,  895,  895,  895,  895,  895,  895,  896,
			  918,  896,  894,  899,  899,  899,  899,  899,  899,  918,
			  897,  872,  872,  872,  872,  872,  872,  918,  918,  918,
			  894,  902,  902,  902,  902,  902,  902,  903,  903,  903,
			  903,  903,  905,  918,  873,  918,  874,  918,  898,  899,
			  899,  899,  899,  899,  899,  911,  912,  911,  912,  905,
			  908,  909,  918,  905,  906,  906,  906,  906,  906,  906,
			  907,  907,  907,  907,  907,  907,  918,  908,  909,  918,
			  918,  908,  909,  918,  918,  918,  918,  905,  910,  910,

			  910,  910,  910,  910,  913,  898,  898,  898,  898,  898,
			  898,  918,  918,  918,  918,  908,  909,  914,  914,  914,
			  914,  914,  914,  915,  915,  915,  915,  915,  915,  916,
			  916,  916,  916,  916,  916,  911,  918,  911,  918,  918,
			  915,  915,  915,  915,  915,  915,  917,  917,  917,  917,
			  917,  917,  913,  913,  913,  913,  913,  913,  312,  312,
			  312,  312,  312,  312,  312,  312,  312,  918,  918,  918,
			  918,  918,  918,  918,  913,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,

			   73,   73,   73,   73,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   99,   99,  918,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,  918,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,  101,  101,  918,  101,  101,  101,  101,  101,  101,

			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  108,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  108,  108,  108,  108,  108,  108,  108,  108,  108,
			  116,  116,  116,  116,  918,  116,  116,  116,  918,  918,
			  116,  116,  116,  116,  116,  116,  116,  116,  116,  149,
			  149,  918,  149,  918,  149,  149,  149,  918,  918,  149,
			  149,  149,  918,  918,  149,  149,  149,  149,  149,  149,
			  149,  149,  149,  153,  153,  918,  153,  153,  153,  153,
			  153,  153,  153,  153,  153,  153,  153,  153,  153,  153,

			  153,  153,  153,  153,  153,  153,  153,  153,  153,  153,
			  153,  153,  212,  212,  918,  212,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,
			  212,  918,  212,  212,  212,  212,  212,  212,  212,  212,
			  212,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  237,

			  918,  237,  918,  918,  918,  918,  237,  918,  237,  237,
			  237,  918,  918,  237,  237,  237,  918,  918,  237,  237,
			  237,  237,  237,  237,  237,  237,  237,  244,  244,  918,
			  244,  244,  244,  244,  244,  244,  244,  244,  244,  244,
			  244,  244,  244,  244,  244,  244,  244,  244,  244,  244,
			  244,  244,  244,  244,  244,  244,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  108,  108,  108,  108,  918,
			  918,  108,  108,  108,  108,  918,  108,  108,  108,  108,

			  108,  108,  108,  108,  108,  268,  918,  918,  268,  268,
			  268,  268,  268,  268,  268,  268,  918,  918,  268,  268,
			  268,  268,  268,  268,  268,  268,  268,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  918,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,

			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  408,  408,  408,  918,  918,  408,
			  408,  408,  918,  918,  408,  408,  408,  408,  408,  408,
			  408,  408,  408,  409,  409,  409,  918,  918,  409,  409,
			  409,  918,  918,  409,  409,  409,  409,  409,  409,  409,
			  409,  409,  312,  312,  312,  312,  918,  918,  312,  312,
			  312,  312,  918,  312,  312,  312,  312,  312,  312,  312,
			  312,  312,  381,  381,  381,  381,  381,  381,  381,  381,
			  381,  381,  381,  381,  381,  381,  381,  381,  381,  381,
			  381,  381,  381,  381,  381,  381,  381,  381,  381,  381, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  381,  522,  522,  522,  918,  918,  522,  522,  522,  522,
			  522,  522,  522,  522,  522,  455,  455,  455,  918,  918,
			  455,  455,  455,  455,  455,  455,  455,  455,  918,  918,
			  455,  455,  455,  918,  918,  455,  455,  455,  455,  455,
			  455,  455,  455,  455,  615,  615,  615,  918,  918,  615,
			  615,  615,  615,  615,  615,  615,  615,  615,  616,  616,
			  616,  918,  918,  616,  616,  616,  918,  918,  616,  616,
			  616,  616,  616,  616,  616,  616,  616,  692,  692,  692,
			  918,  918,  692,  692,  692,  918,  918,  692,  692,  692,
			  692,  692,  692,  692,  692,  692,  787,  787,  787,  918,

			  918,  787,  787,  787,  787,  787,  787,  787,  787,  787,
			  817,  817,  817,  918,  918,  817,  817,  817,  918,  918,
			  817,  817,  817,  817,  817,  817,  817,  817,  817,  852,
			  852,  852,  918,  918,  852,  852,  852,  918,  918,  852,
			  852,  852,  852,  852,  852,  852,  852,  852,   11,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,

			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918, yy_Dummy>>,
			1, 241, 5000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 5240)
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
			  164,  164,   37,   51,   51,   92,    7,   43,   92,  164,
			    8,   76,   60,   35,   36,  155,   50,   35,  155,   35,
			   48,  516,  516,  155,   60,   48,   61,  894,    3,    3,
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
			   27,  893,   27,  151,   27,   27,   27,   27,   27,   27,
			   28,   39,   28,   42,   28,   28,   28,   28,   28,   28,

			   47,   44,   40,   45,   39,   49,   40,   42,   42,   45,
			   63,   47,   64,   42,   68,   39,  884,   44,   40,   47,
			  151,   49,   45,   27,   74,   78,   74,   74,   96,   80,
			   96,   96,   39,   28,   40,   42,   42,   45,   63,   47,
			   64,   42,   68,  874,   39,   44,   40,   47,   69,   49,
			   45,   46,   46,   46,   46,   46,   46,   46,   56,   56,
			   46,   57,   77,   56,   59,   56,   57,   46,   67,   65,
			   57,   66,   57,   67,   46,   59,  375,   69,  160,   66,
			   82,   46,   65,   46,   84,   46,   56,   56,  108,   57,
			   85,   56,   59,   56,   57,   46,   67,   65,   57,   66,

			   57,   67,   46,  866,   59,   78,  160,   66,   80,   80,
			   65,  161,   46,  375,   46,   55,   82,   82,   55,  865,
			   79,   84,   84,   55,  108,   81,   85,   85,  218,  836,
			   55,   55,   55,   55,   55,   55,   55,   55,  825,  161,
			   77,   77,   77,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,  162,  168,  813,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   58,  162,  168,   58,   79,   79,

			   79,  778,   58,   81,   81,   81,  218,  218,  218,   58,
			   58,   58,   58,   58,   58,   58,   58,  766,  236,  713,
			  170,  236,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,  152,  150,  170,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   62,   62,   87,  711,   94,   87,   62,
			   94,   95,  710,  150,   95,  231,  116,  116,  231,   94,
			   94,  709,  152,   95,   62,  116,  318,  116,  150,  103,

			   94,   62,   62,  318,   95,  166,  166,   62,  103,  103,
			  103,  103,  103,  103,  166,  171,  106,  106,  106,  106,
			  106,  106,  109,  109,  109,  109,  109,  109,  174,  166,
			   94,   87,  106,  178,   95,  110,  110,  110,  110,  110,
			  110,  231,  708,  171,  103,  112,  112,  112,  112,  112,
			  112,  110,  563,  559,  692,  106,  174,  166,  688,  103,
			  106,  178,  111,  103,  111,  103,  111,  111,  111,  111,
			  111,  111,  111,  310,  179,  682,  113,  650,  113,  110,
			  113,  113,  113,  113,  113,  113,  118,  118,  175,  119,
			  119,  563,  120,  120,  175,  118,  559,  118,  119,  184,

			  119,  120,  179,  120,  185,  111,  121,  121,  312,  310,
			  120,  191,  193,  119,  195,  121,  175,  121,  118,  113,
			  122,  122,  175,  646,  123,  123,  121,  184,  822,  122,
			  196,  122,  185,  123,  199,  123,  124,  124,  120,  191,
			  193,  119,  195,  642,  312,  124,  118,  124,  125,  125,
			  122,  123,  126,  126,  121,  127,  127,  125,  196,  125,
			  369,  126,  199,  126,  127,  125,  127,  124,  183,  183,
			  822,  125,  128,  128,  633,  200,  126,  183,  122,  123,
			  602,  128,  209,  128,  204,  127,  616,  129,  129,  207,
			  222,  130,  130,  125,  240,  124,  129,  240,  129,  125,

			  130,  608,  130,  200,  126,  131,  131,  600,  130,  132,
			  132,  209,  204,  127,  131,  129,  131,  207,  132,  602,
			  132,  133,  133,  226,  135,  135,  222,  222,  134,  134,
			  133,  242,  133,  135,  242,  135,  130,  134,  366,  134,
			  369,  132,  135,  129,  453,  134,  214,  131,  214,  214,
			  137,  137,  137,  133,  457,  138,  138,  138,  225,  137,
			  226,  226,  384,  384,  138,  384,  138,  366,  137,  132,
			  135,  172,  172,  134,  228,  137,  188,  188,  453,  562,
			  172,  133,  137,  457,  137,  188,  137,  138,  139,  139,
			  139,  141,  141,  141,  225,  225,  137,  139,  314,  139,

			  141,  172,  141,  137,  188,  560,  139,  144,  144,  141,
			  532,  228,  228,  137,  509,  137,  144,  203,  144,  497,
			  139,  203,  139,  141,  146,  146,  314,  271,  271,  172,
			  165,  165,  188,  146,  139,  146,  271,  141,  271,  165,
			  144,  176,  176,  146,  252,  203,  252,  252,  315,  203,
			  176,  139,  140,  140,  140,  140,  140,  140,  140,  140,
			  140,  140,  165,  140,  142,  142,  142,  520,  144,  143,
			  143,  146,  176,  142,  140,  142,  315,  140,  143,  454,
			  143,  411,  142,  140,  322,  828,  145,  145,  143,  142,
			  165,  143,  147,  147,  714,  145,  142,  145,  142,  832, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  176,  147,  140,  147,  324,  140,  167,  167,  520,  145,
			  142,  140,  322,  145,  828,  167,  143,  142,  325,  143,
			  148,  148,  147,  408,  167,  169,  169,  142,  832,  148,
			  328,  148,  324,  714,  169,  173,  173,  145,  177,  177,
			  217,  145,  180,  180,  173,  169,  325,  177,  181,  181,
			  147,  180,  167,  329,  330,  177,  148,  181,  328,  817,
			  817,  177,  173,  189,  189,  334,  180,  190,  190,  398,
			  198,  198,  189,  169,  385,  385,  190,  385,  181,  198,
			  189,  329,  330,  177,  409,  148,  158,  158,  198,  177,
			  173,  339,  409,  334,  180,  158,  187,  187,  340,  187,

			  187,  187,  187,  187,  187,  187,  181,  445,  189,  190,
			  445,  197,  197,  386,  501,  219,  198,  501,  220,  339,
			  197,  217,  217,  217,  217,  217,  340,  221,  197,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  192,  192,  194,  194,  197,  201,  201,  202,
			  202,  192,  381,  194,  205,  205,  201,  377,  202,  206,
			  206,  208,  208,  205,  210,  210,  201,  583,  206,  762,
			  208,  321,  321,  210,  192,  583,  194,  205,  206,  341,
			  321,  205,  202,  219,  219,  219,  220,  220,  220,  337,

			  337,  208,  285,  285,  201,  221,  221,  221,  337,  360,
			  210,  285,  192,  285,  194,  205,  206,  341,  762,  205,
			  202,  235,  235,  235,  235,  235,  235,  342,  237,  208,
			  239,  237,  335,  239,  263,  263,  263,  263,  263,  210,
			  237,  337,  239,  247,  247,  247,  247,  247,  247,  247,
			  255,  237,  255,  239,  346,  255,  255,  255,  255,  255,
			  255,  256,  256,  256,  256,  256,  256,  259,  259,  259,
			  259,  259,  259,  264,  264,  264,  264,  264,  264,  852,
			  852,  237,  346,  239,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,

			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  254,  254,  254,  254,
			  254,  254,  260,  260,  260,  260,  260,  260,  326,  326,
			  350,  351,  254,  317,  261,  313,  261,  326,  260,  261,

			  261,  261,  261,  261,  261,  262,  326,  262,  354,  262,
			  262,  262,  262,  262,  262,  254,  269,  269,  350,  351,
			  254,  260,  270,  270,  632,  269,  260,  269,  272,  272,
			  867,  270,  632,  270,  326,  269,  354,  272,  867,  272,
			  306,  273,  273,  448,  355,  274,  274,  268,  262,  270,
			  273,  448,  273,  267,  274,  272,  274,  276,  276,  273,
			  275,  275,  358,  269,  277,  277,  276,  503,  276,  275,
			  503,  275,  355,  277,  258,  277,  274,  270,  359,  275,
			  456,  276,  448,  272,  461,  278,  278,  273,  279,  279,
			  358,  281,  281,  257,  278,  277,  278,  279,  280,  279,

			  281,  251,  281,  280,  274,  250,  359,  275,  456,  276,
			  282,  282,  461,  249,  280,  281,  278,  283,  283,  282,
			  463,  282,  764,  277,  280,  764,  283,  248,  283,  394,
			  279,  464,  319,  319,  282,  422,  284,  284,  246,  238,
			  283,  319,  280,  281,  278,  284,  422,  284,  463,  286,
			  286,  319,  394,  284,  287,  287,  422,  394,  286,  464,
			  286,  368,  282,  287,  859,  287,  289,  289,  283,  297,
			  297,  297,  234,  287,  422,  289,  233,  289,  297,  319,
			  297,  284,  286,  290,  290,  824,  290,  290,  290,  290,
			  290,  290,  290,  859,  290,  468,  824,  232,  289,  349,

			  349,  287,  293,  293,  293,  293,  293,  293,  349,  229,
			  286,  227,  224,  291,  291,  290,  291,  291,  291,  291,
			  291,  291,  291,  468,  291,  292,  292,  824,  292,  292,
			  292,  292,  292,  292,  292,  294,  292,  294,  294,  368,
			  368,  368,  212,  356,  356,  291,  295,  295,  295,  295,
			  295,  295,  356,  296,  296,  296,  186,  292,  294,  298,
			  298,  294,  296,  182,  296,  295,  469,  294,  298,  356,
			  298,  299,  299,  307,  307,  307,  307,  307,  307,  307,
			  299,  473,  299,  163,  296,  298,  294,  300,  300,  294,
			  301,  301,  159,  295,  469,  294,  300,  356,  300,  301,

			  156,  301,  327,  327,  474,  153,  300,  302,  302,  473,
			  149,  327,  296,  298,  303,  303,  302,  136,  302,  301,
			  304,  304,  105,  303,  104,  303,  101,  305,  305,  304,
			   99,  304,  474,  327,  300,   97,  305,  302,  305,  308,
			  308,  308,  308,  308,  308,  308,   93,  301,  309,  309,
			  309,  309,  309,  309,  309,  476,  303,  320,  320,  323,
			  323,  327,   90,  305,   89,  302,  320,   88,  323,  331,
			  331,  332,  332,  333,  333,   73,  336,  336,  331,   70,
			  332,   54,  333,  476,  320,  336,  323,  338,  331,  344,
			  344,  370,  305,   38,  338,  332,  353,  353,  344,  338,

			  347,  347,  357,  357,  333,  353,  371,  336,   33,  347,
			  338,  357,  320,  344,  323,  353,  331,  347,   31,   26,
			  338,  357,  343,  332,  343,  343,  343,  343,  343,  343,
			  345,  345,  333,  352,  352,  336,  372,   24,  338,  345,
			  373,  344,  352,  353,  374,  347,  361,  361,   16,  357,
			  362,  362,  365,  365,  345,  361,  363,  363,   15,  362,
			   14,  365,   11,  367,  367,  363,  352,    0,  450,  370,
			  370,  370,  367,    0,  477,  361,  450,  478,  379,    0,
			  362,  379,  345,    0,    0,  371,  371,    0,  382,  382,
			  379,  382,  379,    0,  352,  417,  417,  482,  363,  367,

			  382,  379,  477,  361,  417,  478,  417,  450,  362,    0,
			    0,  382,  470,  470,  372,  372,  372,    0,  373,  373,
			  373,  470,  374,  374,  374,  482,  380,    0,  367,  380,
			    0,  379,  395,  395,  395,  395,  395,  395,  380,    0,
			  380,  382,  380,  380,  380,  380,  380,  380,  484,  380,
			  389,  389,  389,  389,  389,  389,  389,  396,  396,  396,
			  396,  396,  396,  397,  397,  397,  397,  397,  397,  399,
			  399,  399,  399,  399,  399,    0,  484,    0,    0,  380,
			    0,  400,  400,  400,  400,  400,  400,  402,  402,  402,
			  402,  402,  402,  401,  485,  401,  396,  400,  401,  401, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  401,  401,  401,  401,  403,  403,  403,  403,  403,  403,
			  404,  404,  404,  404,  404,  404,  551,    0,  492,  551,
			  400,    0,  485,  405,  405,  400,  405,  405,  405,  405,
			  405,  405,  406,  406,  406,  406,  406,  406,  407,  407,
			  407,  407,  407,  407,  412,  412,  492,  413,  413,  404,
			  414,  414,    0,  412,  549,  412,  413,  549,  413,  414,
			    0,  414,  415,  415,  493,    0,    0,  416,  416,  567,
			    0,  415,  551,  415,  412,    0,  416,  549,  416,  494,
			  414,  413,  418,  418,    0,  415,  416,  419,  419,    0,
			  494,  418,  493,  418,  421,  421,  419,  567,  419,    0,

			  569,  570,  412,  421,    0,  421,    0,  494,  414,  421,
			  413,  420,  420,  415,  416,  418,  423,  423,  494,  419,
			  420,    0,  420,  424,  424,  423,  439,  423,  569,  570,
			  420,  439,  424,    0,  424,  425,  425,  421,  573,  423,
			  426,  426,  439,  418,  425,    0,  425,  419,  519,  426,
			  519,  426,  439,  429,    0,  578,  424,    0,  420,  519,
			  543,  425,  426,  427,  427,    0,  573,  423,  428,  428,
			  439,  543,  427,  429,  427,  580,  429,  428,  581,  428,
			    0,  543,  429,  578,  424,  437,  437,  519,    0,  425,
			  426,  438,  438,  427,  437,  587,  437,  589,  428,  543,

			  438,  429,  438,  580,  429,    0,  581,    0,  440,  440,
			  429,  430,  430,  430,  430,  430,  430,  440,  590,  440,
			  593,  427,    0,  587,    0,  589,  428,  431,  431,  431,
			  431,  431,  431,  430,  432,  432,  432,  432,  432,  432,
			  594,  595,  596,  648,  430,    0,  590,    0,  593,  431,
			  433,  433,  433,  433,  433,  433,  472,  472,  431,    0,
			  431,  430,    0,  444,  444,  472,    0,  432,  594,  595,
			  596,  648,  444,  430,  444,  441,  441,  431,  434,  434,
			  434,  434,  434,  434,  441,    0,  441,  431,  472,  431,
			  435,  435,  435,  435,  435,  435,  432,  436,  436,  436,

			  436,  436,  436,    0,    0,  435,  442,  442,  441,  483,
			  483,  574,  436,  459,  459,  442,  472,  442,  483,  443,
			  443,    0,  459,  574,  442,  653,    0,    0,  443,    0,
			  443,  483,  446,  435,  443,  446,  441,    0,    0,  574,
			  436,    0,    0,  459,    0,  443,  446,  447,  490,  490,
			  447,  574,  442,  653,  446,  446,    0,  490,    0,  483,
			    0,  447,  443,  447,  447,  447,  447,  447,  447,  447,
			  447,  459,  449,  443,  449,  449,  449,  449,  449,  449,
			  449,    0,  657,    0,  451,  446,  451,  451,  451,  451,
			  451,  451,  451,  458,  458,  458,  458,  458,  458,  452,

			  447,  452,  452,  452,  452,  452,  452,  452,  460,  460,
			  657,  449,  465,  465,    0,  462,  462,  460,  466,  466,
			    0,  465,    0,  451,  462,  471,  471,  466,    0,  658,
			  475,  475,  486,  486,  471,  465,  663,  466,  452,  475,
			    0,  486,  460,    0,  664,  462,  665,  480,  480,  475,
			  479,  479,  479,  479,  479,  479,  480,  658,  471,  481,
			  481,    0,  486,  465,  663,  466,  487,  487,  481,    0,
			  480,  460,  664,  462,  665,  487,  668,  475,  491,  491,
			  495,  495,  496,  496,  498,  498,  471,  491,    0,  495,
			  486,  496,  481,  498,  500,    0,  487,  500,  480,    0,

			  496,  833,  833,  833,  668,  548,  500,  502,  502,  502,
			  502,  502,  502,  495,  523,  523,  548,  500,  565,  565,
			  481,    0,    0,  523,  487,  523,  548,  565,  496,  505,
			  505,  505,  505,  505,  505,  506,  506,  506,  506,  506,
			  506,  495,    0,    0,  548,    0,    0,  500,  507,  507,
			  507,  507,  507,  507,  508,  508,  508,  508,  508,  508,
			  510,  510,  510,  510,  510,  510,  579,  579,  505,  511,
			  511,  511,  511,  511,  511,  579,  510,  512,  512,  512,
			  512,  512,  512,  513,  513,  513,  513,  513,  513,  514,
			  514,  514,  514,  514,  514,    0,  670,    0,  671,  510,

			    0,    0,  524,  524,  510,  515,  515,  515,  515,  515,
			  515,  524,    0,  524,  526,  526,  512,  517,  517,  517,
			  517,  517,  517,  526,  670,  526,  671,  518,  514,  518,
			  518,  518,  518,  518,  518,  675,  525,  525,    0,    0,
			  526,  527,  527,    0,  524,  525,    0,  525,  568,  568,
			  527,  676,  527,  528,  528,  525,  625,  568,  677,  527,
			  716,  718,  528,  675,  528,  529,  529,  568,  526,  530,
			  530,  528,  721,  625,  529,  731,  529,  625,  530,  676,
			  530,  531,  531,  525,  529,  735,  677,  527,  716,  718,
			  531,    0,  531,  534,  534,  568,  529,  533,  533,  528,

			  721,  625,  534,  731,  534,  531,  533,  736,  533,  535,
			  535,  534,  529,  735,  652,  652,  533,  737,  535,  686,
			  535,  536,  536,  652,  529,  537,  537,    0,    0,    0,
			  536,    0,  536,  531,  537,  736,  537,  538,  538,  534,
			  536,    0,  686,    0,  533,  737,  538,  686,  538,  539,
			  539,  539,  539,  539,  539,  537,  538,  540,    0,  540,
			  540,  540,  540,  540,  540,  540,  655,  655,  536,  542,
			  542,  542,  542,  542,  542,  655,    0,  539,  767,  544,
			  544,  655,    0,  537,  538,  545,  545,  540,  544,  768,
			  544,  542,  566,  566,  545,    0,  545,    0,  544,  546,

			  546,  566,  618,  618,  545,  539,  767,    0,  546,  655,
			  546,  618,  770,  618,    0,  540,  541,  768,  541,  542,
			  541,  541,  541,  541,  541,  541,  544,  547,  547,  546,
			  585,  585,  545,    0,  566,  541,  547,    0,  547,  585,
			  770,  638,  541,  612,  612,  612,  612,  612,  541,  585,
			  620,  620,  638,    0,  547,    0,    0,  546,    0,  620,
			    0,  620,  638,  541,  601,  601,  601,  601,  601,  601,
			  541,    0,  656,  656,    0,    0,  541,  585,    0,    0,
			  638,  656,  547,  550,  550,  550,  550,  550,  550,  550,
			  553,  553,  553,  553,  553,  553,  553,  555,  555,  555,

			  555,  555,  555,  555,  557,  557,  557,  557,  557,  557,
			  557,  564,  772,  564,  564,  564,  564,  564,  564,  571,
			  571,  572,  572,  575,  575,  576,  576,    0,  571,    0,
			  572,    0,  575,    0,  576,    0,  774,  617,  617,  572,
			  772,  575,  622,  622,  576,  571,  617,  775,  617,    0,
			  564,  622,  617,  622,    0,  584,  576,  584,  584,  584,
			  584,  584,  584,  584,  774,  586,  586,  572,  622,  575,
			  588,  588,  576,  571,  586,  775,  591,  591,  639,  588,
			  617,  592,  592,  586,  576,  591,  597,  597,    0,  588,
			  592,  802,  639,  598,  598,  597,  622,    0,    0,    0, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  592,  640,  598,  639,  599,  597,  591,  599,    0,  803,
			    0,  586,  598,  639,    0,  640,  599,  588,  599,  802,
			  599,  599,  599,  599,  599,  599,  640,  599,  592,  662,
			  662,  639,    0,  597,  591,    0,  640,  803,  662,  603,
			  598,  603,  603,  603,  603,  603,  603,  604,  604,  604,
			  604,  604,  604,    0,  640,    0,    0,  599,  744,  744,
			  744,  744,    0,  604,  605,  605,  605,  605,  605,  605,
			  606,  606,  606,  606,  606,  606,    0,    0,  603,  607,
			  607,  607,  607,  607,  607,  609,  609,  609,  609,  609,
			  609,  604,  610,  610,  610,  610,  610,  610,    0,    0,

			    0,  698,    0,  605,  611,  611,  611,  611,  611,  611,
			  614,  614,  614,  614,  614,  614,  619,  619,  698,  621,
			  621,  807,  698,  623,  623,  619,  614,  619,  621,    0,
			  621,  619,  623,    0,  623,    0,  624,  624,  621,  626,
			  626,    0,  627,  627,    0,  624,  698,  624,  626,  807,
			  626,  627,  810,  627,  614,  704,  628,  628,    0,  619,
			  624,  627,  629,  629,  827,  628,  621,  628,  630,  630,
			  626,  629,  704,  629,  634,  634,  704,  630,  830,  630,
			  810,  629,    0,  634,    0,  634,  630,  628,  624,  627,
			  635,  635,  827,  636,  636,    0,  661,  661,  626,  635,

			  704,  635,  636,    0,  636,  661,  830,  637,  637,  629,
			  636,    0,  678,  678,  630,  628,  637,    0,  637,  844,
			  635,  678,  661,  641,    0,  637,  641,  643,    0,  643,
			  643,  643,  643,  643,  643,  643,    0,  641,  636,  641,
			  641,  641,  641,  641,  641,  641,  641,  844,  635,    0,
			  661,    0,  644,  637,  644,  644,  644,  644,  644,  644,
			  644,  746,  746,  746,  746,  645,  643,  645,  645,  645,
			  645,  645,  645,  645,  849,    0,  641,  647,  647,  647,
			  647,  647,  647,  649,  649,  649,  649,  649,  649,  660,
			  660,  644,  666,  666,  667,  667,  669,  669,  660,    0,

			  746,  666,  849,  667,  645,  669,  672,  672,  660,    0,
			  673,  673,  860,  667,  841,  672,    0,  679,  679,  673,
			    0,  868,  841,  666,    0,  672,  679,  669,  673,  680,
			  680,  680,  680,  680,  680,  841,  660,  695,  695,  879,
			  860,  667,    0,  697,  697,    0,  695,  679,  695,  868,
			  841,  666,  697,  672,  697,  669,  673,  681,  681,  681,
			  681,  681,  681,  683,    0,  683,    0,  879,  683,  683,
			  683,  683,  683,  683,    0,  679,  684,  684,  684,  684,
			  684,  684,  685,  685,  685,  685,  685,  685,  687,  687,
			  687,  687,  687,  687,  689,  689,  689,  689,  689,  689,

			  690,  690,  690,  690,  690,  690,  691,  691,  691,  691,
			  691,  691,  693,  693,    0,  684,  694,  694,    0,  696,
			  696,  693,  691,  693,    0,  694,    0,  694,  696,    0,
			  696,    0,  699,  699,    0,    0,  696,  700,  700,    0,
			  694,  699,  693,  699,    0,  691,  700,    0,  700,    0,
			  691,  701,  701,  758,  702,  702,    0,  758,  703,  703,
			  701,    0,  701,  702,  696,  702,    0,  703,  694,  703,
			  693,    0,  705,  705,  758,  706,  706,    0,    0,    0,
			  702,  705,    0,  705,  706,  758,  706,  707,  707,    0,
			    0,  705,    0,    0,    0,    0,  707,  706,  707,  712,

			  712,  712,  712,  712,  712,    0,  707,  715,  702,  715,
			  715,  715,  715,  715,  715,    0,    0,    0,    0,  705,
			    0,    0,    0,    0,  717,  706,  717,  717,  717,  717,
			  717,  717,  719,  719,  707,  722,  722,  754,  723,  723,
			    0,  719,  727,  727,  722,    0,  715,  723,  728,  728,
			    0,  727,  730,  730,  754,  723,  719,  728,  754,  733,
			  733,  730,    0,  717,  734,  734,  757,  757,  733,  738,
			  738,  806,  806,  734,    0,  757,    0,  757,  738,    0,
			  806,    0,  754,  723,  719,  733,    0,  739,  738,  739,
			  739,  739,  739,  739,  739,  740,  740,  740,  740,  740,

			  740,  741,  741,  741,  741,  741,  741,  742,  742,  742,
			  742,  742,  742,  733,    0,  743,  738,  743,    0,    0,
			  743,  743,  743,  743,  743,  743,  739,  745,  745,  745,
			  745,  745,  745,  747,  747,  747,  747,  747,  747,  749,
			  749,    0,  750,  750,    0,  811,  811,    0,  749,  747,
			  749,  750,    0,  750,  811,    0,  749,  751,  751,    0,
			    0,    0,  753,  753,    0,  750,  751,    0,  751,  755,
			  755,  753,  747,  753,  846,  846,  751,  747,  755,  753,
			  755,  756,  756,  846,  749,  759,    0,  755,  842,  759,
			  756,  760,  756,  750,    0,  760,  842,  761,    0,    0,

			  756,  761,  769,  769,  751,  877,  759,  753,  861,  842,
			  861,  769,  760,  777,  777,  755,  877,  759,  761,  861,
			    0,    0,  777,  760,  842,  769,  877,    0,  756,  761,
			  763,  777,  763,  763,  763,  763,  763,  763,  765,  765,
			  765,  765,  765,  765,  877,  771,  771,  861,  773,  773,
			    0,  790,  790,  769,  771,    0,    0,  773,    0,  777,
			  790,    0,  790,    0,  771,  773,    0,    0,    0,  763,
			  779,  779,  779,  779,  779,  779,  780,  780,  780,  780,
			  780,  780,  781,  781,  781,  781,  781,  781,    0,    0,
			    0,    0,  771,  773,  782,  782,  782,  782,  782,  782,

			  783,  783,  783,  783,  783,  783,  784,  784,  784,  784,
			  784,  784,    0,  788,  788,  780,  786,  786,  786,  786,
			  786,  786,  788,    0,  788,  789,  789,  795,  791,  791,
			    0,  795,  786,    0,  789,  788,  789,  791,    0,  791,
			  793,  793,    0,  848,  848,  794,  794,  791,  795,  793,
			    0,  793,  848,    0,  794,  786,  794,  789,  796,  795,
			  786,  797,  796,  788,    0,  797,  798,  808,  808,    0,
			  798,    0,    0,    0,    0,  791,  808,  794,    0,  796,
			  838,  838,  797,  804,  804,  789,  808,  798,    0,  838,
			  796,  838,  804,  797,    0,    0,    0,    0,  798,  799,

			  799,  799,  799,  799,  799,  794,  801,    0,  801,  801,
			  801,  801,  801,  801,  808,  804,  812,  812,  812,  812,
			  812,  812,  814,  814,  814,  814,  814,  814,  815,    0,
			  815,  820,  820,  815,  815,  815,  815,  815,  815,  900,
			  820,    0,  820,  804,    0,  801,  816,  816,  816,  816,
			  816,  816,  818,  818,    0,  812,  900,  819,  819,    0,
			  900,  818,  820,  818,  821,  821,  819,  815,  819,    0,
			    0,  818,    0,  821,  826,  821,  826,  826,  826,  826,
			  826,  826,  829,  829,  900,  831,  831,  839,  839,    0,
			  820,  829,    0,  819,  831,    0,  839,    0,  839,  818, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  821,  834,  834,  834,  834,  834,  834,  843,  837,  837,
			    0,    0,    0,  826,  840,  840,  831,  837,  829,  837,
			  843,    0,  819,  840,    0,  840,    0,    0,  843,  821,
			  850,  850,  850,  850,  850,  850,    0,    0,    0,    0,
			  837,  843,  840,    0,  831,    0,    0,  829,  851,  851,
			  851,  851,  851,  851,  854,  854,  843,  853,  853,  853,
			  853,  853,  853,  854,    0,  854,  855,  855,  837,    0,
			  840,  856,  857,  864,  864,  855,  858,  855,    0,  856,
			  857,    0,  864,    0,  864,  855,    0,    0,    0,  858,
			  854,    0,  856,  857,    0,    0,  862,  858,  862,  862,

			    0,  862,  862,  862,  862,  862,  862,  856,  857,    0,
			  858,  863,  863,  855,  871,  871,  871,  871,  871,  854,
			  863,    0,  863,    0,    0,  858,  870,  870,  870,  870,
			  870,  870,  873,  873,  873,  873,  873,  873,  878,  863,
			  875,  875,  875,  875,  875,  875,  876,  876,    0,  878,
			    0,  886,  886,  887,    0,  876,    0,  876,    0,  878,
			  886,    0,  886,    0,  887,  876,    0,  863,  880,  880,
			  880,  880,  880,  880,  887,    0,    0,  878,  881,  881,
			  881,  881,  881,  881,  882,  882,  882,  882,  882,  882,
			  873,    0,  887,  876,  883,  883,  883,  883,  883,  883,

			  885,  888,  885,  885,    0,  885,  885,  885,  885,  885,
			  885,    0,  888,  890,  890,  890,  890,  890,  890,  891,
			    0,  891,  888,  892,  892,  892,  892,  892,  892,    0,
			  891,  895,  895,  895,  895,  895,  895,    0,    0,    0,
			  888,  896,  896,  896,  896,  896,  896,  897,  897,  897,
			  897,  897,  901,    0,  899,    0,  899,    0,  891,  899,
			  899,  899,  899,  899,  899,  907,  907,  907,  907,  901,
			  904,  905,    0,  901,  902,  902,  902,  902,  902,  902,
			  903,  903,  903,  903,  903,  903,    0,  904,  905,    0,
			    0,  904,  905,    0,    0,    0,    0,  901,  906,  906,

			  906,  906,  906,  906,  907,  910,  910,  910,  910,  910,
			  910,    0,    0,    0,    0,  904,  905,  911,  911,  911,
			  911,  911,  911,  912,  912,  912,  912,  912,  912,  914,
			  914,  914,  914,  914,  914,  915,    0,  915,    0,    0,
			  915,  915,  915,  915,  915,  915,  916,  916,  916,  916,
			  916,  916,  917,  917,  917,  917,  917,  917,  936,  936,
			  936,  936,  936,  936,  936,  936,  936,    0,    0,    0,
			    0,    0,    0,    0,  915,  919,  919,  919,  919,  919,
			  919,  919,  919,  919,  919,  919,  919,  919,  919,  919,
			  919,  919,  919,  919,  919,  919,  919,  919,  919,  919,

			  919,  919,  919,  919,  920,  920,  920,  920,  920,  920,
			  920,  920,  920,  920,  920,  920,  920,  920,  920,  920,
			  920,  920,  920,  920,  920,  920,  920,  920,  920,  920,
			  920,  920,  920,  921,  921,  921,  921,  921,  921,  921,
			  921,  921,  921,  921,  921,  921,  921,  921,  921,  921,
			  921,  921,  921,  921,  921,  921,  921,  921,  921,  921,
			  921,  921,  922,  922,    0,  922,  922,  922,  922,  922,
			  922,  922,  922,  922,  922,  922,  922,  922,  922,  922,
			  922,    0,  922,  922,  922,  922,  922,  922,  922,  922,
			  922,  923,  923,    0,  923,  923,  923,  923,  923,  923,

			  923,  923,  923,  923,  923,  923,  923,  923,  923,  923,
			  923,  923,  923,  923,  923,  923,  923,  923,  923,  923,
			  924,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  924,  924,  924,  924,  924,  924,  924,  924,  924,
			  925,  925,  925,  925,    0,  925,  925,  925,    0,    0,
			  925,  925,  925,  925,  925,  925,  925,  925,  925,  926,
			  926,    0,  926,    0,  926,  926,  926,    0,    0,  926,
			  926,  926,    0,    0,  926,  926,  926,  926,  926,  926,
			  926,  926,  926,  927,  927,    0,  927,  927,  927,  927,
			  927,  927,  927,  927,  927,  927,  927,  927,  927,  927,

			  927,  927,  927,  927,  927,  927,  927,  927,  927,  927,
			  927,  927,  928,  928,    0,  928,  928,  928,  928,  928,
			  928,  928,  928,  928,  928,  928,  928,  928,  928,  928,
			  928,    0,  928,  928,  928,  928,  928,  928,  928,  928,
			  928,  929,  929,  929,  929,  929,  929,  929,  929,  929,
			  929,  929,  929,  929,  929,  929,  929,  929,  929,  929,
			  929,  929,  929,  929,  929,  929,  929,  929,  929,  929,
			  930,  930,  930,  930,  930,  930,  930,  930,  930,  930,
			  930,  930,  930,  930,  930,  930,  930,  930,  930,  930,
			  930,  930,  930,  930,  930,  930,  930,  930,  930,  931,

			    0,  931,    0,    0,    0,    0,  931,    0,  931,  931,
			  931,    0,    0,  931,  931,  931,    0,    0,  931,  931,
			  931,  931,  931,  931,  931,  931,  931,  932,  932,    0,
			  932,  932,  932,  932,  932,  932,  932,  932,  932,  932,
			  932,  932,  932,  932,  932,  932,  932,  932,  932,  932,
			  932,  932,  932,  932,  932,  932,  933,  933,  933,  933,
			  933,  933,  933,  933,  933,  933,  933,  933,  933,  933,
			  933,  933,  933,  933,  933,  933,  933,  933,  933,  933,
			  933,  933,  933,  933,  933,  934,  934,  934,  934,    0,
			    0,  934,  934,  934,  934,    0,  934,  934,  934,  934,

			  934,  934,  934,  934,  934,  935,    0,    0,  935,  935,
			  935,  935,  935,  935,  935,  935,    0,    0,  935,  935,
			  935,  935,  935,  935,  935,  935,  935,  937,  937,  937,
			  937,  937,  937,  937,  937,  937,    0,  937,  937,  937,
			  937,  937,  937,  937,  937,  937,  937,  937,  937,  937,
			  937,  937,  937,  937,  937,  937,  938,  938,  938,  938,
			  938,  938,  938,  938,  938,  938,  938,  938,  938,  938,
			  938,  938,  938,  938,  938,  938,  938,  938,  938,  938,
			  938,  938,  938,  938,  938,  939,  939,  939,  939,  939,
			  939,  939,  939,  939,  939,  939,  939,  939,  939,  939,

			  939,  939,  939,  939,  939,  939,  939,  939,  939,  939,
			  939,  939,  939,  939,  940,  940,  940,    0,    0,  940,
			  940,  940,    0,    0,  940,  940,  940,  940,  940,  940,
			  940,  940,  940,  941,  941,  941,    0,    0,  941,  941,
			  941,    0,    0,  941,  941,  941,  941,  941,  941,  941,
			  941,  941,  942,  942,  942,  942,    0,    0,  942,  942,
			  942,  942,    0,  942,  942,  942,  942,  942,  942,  942,
			  942,  942,  943,  943,  943,  943,  943,  943,  943,  943,
			  943,  943,  943,  943,  943,  943,  943,  943,  943,  943,
			  943,  943,  943,  943,  943,  943,  943,  943,  943,  943, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  943,  944,  944,  944,    0,    0,  944,  944,  944,  944,
			  944,  944,  944,  944,  944,  945,  945,  945,    0,    0,
			  945,  945,  945,  945,  945,  945,  945,  945,    0,    0,
			  945,  945,  945,    0,    0,  945,  945,  945,  945,  945,
			  945,  945,  945,  945,  946,  946,  946,    0,    0,  946,
			  946,  946,  946,  946,  946,  946,  946,  946,  947,  947,
			  947,    0,    0,  947,  947,  947,    0,    0,  947,  947,
			  947,  947,  947,  947,  947,  947,  947,  948,  948,  948,
			    0,    0,  948,  948,  948,    0,    0,  948,  948,  948,
			  948,  948,  948,  948,  948,  948,  949,  949,  949,    0,

			    0,  949,  949,  949,  949,  949,  949,  949,  949,  949,
			  950,  950,  950,    0,    0,  950,  950,  950,    0,    0,
			  950,  950,  950,  950,  950,  950,  950,  950,  950,  951,
			  951,  951,    0,    0,  951,  951,  951,    0,    0,  951,
			  951,  951,  951,  951,  951,  951,  951,  951,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,

			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918, yy_Dummy>>,
			1, 241, 5000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   90,   95,   77,   79,   98,  102,  187,
			    0, 1862, 5148,  104, 1857, 1831, 1841, 5148,   86, 5148,
			 5148, 5148, 5148, 5148, 1822,  100, 1802,  266,  276, 5148,
			 5148, 1791, 5148, 1781, 5148,  100,  102,   85, 1767,  265,
			  276,   73,  267,   99,  275,  277,  334,  274,  101,  279,
			   86,   87, 5148, 5148, 1725,  413,  324,  331,  492,  325,
			  104,  111,  533,  280,  270,  337,  334,  327,  272,  297,
			 1762, 5148, 5148, 1768,  322, 5148,  107,  355,  318,  413,
			  322,  418,  363, 5148,  367,  373, 5148,  573, 1764, 1749,
			 1687, 5148,  153, 1743,  575,  579,  326, 1732, 5148, 1723,

			 5148, 1717,    0,  590, 1721, 1706,  598, 5148,  371,  604,
			  617,  648,  627,  662, 5148, 5148,  571,    0,  671,  674,
			  677,  691,  705,  709,  721,  733,  737,  740,  757,  772,
			  776,  790,  794,  806,  813,  809, 1634,  835,  840,  873,
			  937,  876,  949,  954,  892,  971,  909,  977, 1005, 1686,
			  523,  259,  522, 1649, 5148,  163, 1689,    0, 1071, 1675,
			  331,  372,  434, 1617,  135,  915,  590,  991,  433, 1010,
			  475,  573,  856, 1020,  582,  656,  926, 1023,  594,  629,
			 1027, 1033, 1639,  753,  656,  672, 1599, 1081,  861, 1048,
			 1052,  664, 1137,  665, 1139,  682,  697, 1096, 1055,  700,

			  727, 1142, 1144,  879,  750, 1149, 1154,  744, 1156,  731,
			 1159, 5148, 1635, 5148,  844, 5148, 5148, 1033,  421, 1108,
			 1111, 1120,  773, 5148, 1558,  841,  806, 1556,  857, 1555,
			 5148,  583, 1522, 1573, 1569, 1203,  516, 1226, 1536, 1228,
			  792, 1283,  829, 5148, 5148, 5148, 1529, 1226, 1518, 1504,
			 1496, 1492,  942, 5148, 1358, 1237, 1243, 1476, 1408, 1249,
			 1364, 1381, 1391, 1216, 1255,    0,    0, 1429, 1419, 1401,
			 1407,  912, 1413, 1426, 1430, 1445, 1442, 1449, 1470, 1473,
			 1474, 1476, 1495, 1502, 1521, 1187, 1534, 1539, 5148, 1551,
			 1568, 1598, 1610, 1584, 1621, 1628, 1638, 1554, 1644, 1656,

			 1672, 1675, 1692, 1699, 1705, 1712, 1416, 1655, 1721, 1730,
			  649, 5148,  691, 1378,  864,  906,    0, 1332,  579, 1517,
			 1742, 1166,  942, 1744,  971,  972, 1373, 1687,  996, 1014,
			 1008, 1754, 1756, 1758, 1019, 1175, 1761, 1184, 1770, 1052,
			 1059, 1151, 1211, 1806, 1774, 1815, 1222, 1785,    0, 1584,
			 1342, 1357, 1818, 1781, 1367, 1410, 1628, 1787, 1418, 1433,
			 1152, 1831, 1835, 1841,    0, 1837,  787, 1848, 1554,  753,
			 1784, 1799, 1829, 1833, 1837,  359, 5148, 1112, 5148, 1876,
			 1924, 1159, 1886, 5148,  860, 1072, 1110, 5148, 5148, 1933,
			 5148, 5148, 5148, 5148, 1495, 1914, 1939, 1945, 1008, 1951,

			 1963, 1980, 1969, 1986, 1992, 2008, 2014, 2020, 1008, 1068,
			    0,  953, 2029, 2032, 2035, 2047, 2052, 1880, 2067, 2072,
			 2096, 2079, 1506, 2101, 2108, 2120, 2125, 2148, 2153, 2136,
			 2193, 2209, 2216, 2232, 2260, 2272, 2279, 2170, 2176, 2102,
			 2193, 2260, 2291, 2304, 2248, 1105, 2330, 2345, 1427, 2356,
			 1852, 2368, 2383,  820,  913,    0, 1435,  805, 2375, 2298,
			 2393, 1439, 2400, 1482, 1497, 2397, 2403,    0, 1547, 1619,
			 1897, 2410, 2241, 1647, 1674, 2415, 1717, 1826, 1836, 2432,
			 2432, 2444, 1860, 2294, 1903, 1949, 2417, 2451,    0,    0,
			 2333, 2463, 1970, 2031, 2049, 2465, 2467,  904, 2469, 5148,

			 2492, 1112, 2489, 1465, 5148, 2511, 2517, 2530, 2536,  900,
			 2542, 2551, 2559, 2565, 2571, 2587,  153, 2599, 2611, 2135,
			  951,    0,    0, 2499, 2587, 2621, 2599, 2626, 2638, 2650,
			 2654, 2666,  886, 2682, 2678, 2694, 2706, 2710, 2722, 2731,
			 2741, 2802, 2751, 2131, 2764, 2770, 2784, 2812, 2476, 2052,
			 2865, 2014, 5148, 2872, 5148, 2879, 5148, 2886, 5148,  629,
			  844,    0,  822,  636, 2895, 2503, 2777, 2035, 2633, 2059,
			 2068, 2904, 2906, 2105, 2277, 2908, 2910,    0, 2116, 2551,
			 2141, 2145,    0, 1161, 2939, 2815, 2950, 2161, 2955, 2152,
			 2184, 2961, 2966, 2186, 2206, 2196, 2200, 2971, 2978, 3002,

			  750, 2846,  764, 3023, 3029, 3046, 3052, 3061,  744, 3067,
			 3074, 3086, 2825, 5148, 3092,    0,  771, 2922, 2787, 3101,
			 2835, 3104, 2927, 3108, 3121, 2627, 3124, 3127, 3141, 3147,
			 3153, 5148, 1408,  750, 3159, 3175, 3178, 3192, 2812, 2963,
			 2986, 3221,  668, 3211, 3236, 3249,  699, 3259, 2213, 3265,
			  660,    0, 2699, 2295,    0, 2751, 2857, 2348, 2388,    0,
			 3274, 3181, 3014, 2397, 2398, 2412, 3277, 3279, 2430, 3281,
			 2562, 2565, 3291, 3295,    0, 2590, 2619, 2625, 3197, 3302,
			 3311, 3339,  658, 3350, 3358, 3364, 2685, 3370,  643, 3376,
			 3382, 3388,  638, 3397, 3401, 3322, 3404, 3328, 3072, 3417,

			 3422, 3436, 3439, 3443, 3126, 3457, 3460, 3472,  627,  576,
			  567,  561, 3481,  495,  978, 3491, 2615, 3508, 2622, 3517,
			    0, 2640, 3520, 3523,    0,    0,    0, 3527, 3533,    0,
			 3537, 2634,    0, 3544, 3549, 2651, 2670, 2683, 3554, 3571,
			 3577, 3583, 3589, 3602, 3040, 3609, 3248, 3615,    0, 3624,
			 3627, 3642, 5148, 3647, 3508, 3654, 3666, 3551, 3424, 3656,
			 3662, 3668, 1163, 3714, 1520, 3720,  500, 2746, 2751, 3687,
			 2778, 3730, 2880, 3733, 2903, 2913,    0, 3698,  444, 3752,
			 3758, 3764, 3776, 3782, 3788, 5148, 3798,    0, 3798, 3810,
			 3736, 3813, 5148, 3825, 3830, 3798, 3829, 3832, 3837, 3881,

			 5148, 3890, 2954, 2962, 3868,    0, 3556, 3087, 3852,    0,
			 3105, 3630, 3898,  422, 3904, 3915, 3928, 1044, 3937, 3942,
			 3916, 3949,  723, 5148, 1580,  422, 3958, 3130,  934, 3967,
			 3132, 3970,  948, 2483, 3983,    0,  352, 3993, 3865, 3972,
			 3999, 3285, 3659, 3991, 3172,    0, 3659,    0, 3828, 3231,
			 4012, 4030, 1264, 4039, 4039, 4051, 4042, 4043, 4060, 1513,
			 3278, 3695, 4083, 4096, 4058,  395,  379, 1414, 3278,    0,
			 4108, 4096, 5148, 4114,  270, 4122, 4131, 3676, 4109, 3305,
			 4150, 4160, 4166, 4176,  256, 4187, 4136, 4124, 4172,    0,
			 4195, 4206, 4205,  257,  153, 4213, 4223, 4229, 5148, 4241,

			 3910, 4223, 4256, 4262, 4241, 4242, 4280, 4252, 5148, 5148,
			 4287, 4299, 4305, 5148, 4311, 4322, 4328, 4334, 5148, 4374,
			 4403, 4432, 4461, 4490, 4510, 4529, 4553, 4582, 4611, 4640,
			 4669, 4697, 4726, 4755, 4775, 4797, 4337, 4826, 4855, 4884,
			 4903, 4922, 4942, 4971, 4985, 5014, 5028, 5047, 5066, 5080,
			 5099, 5118, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  918,    1,  919,  919,  920,  920,  921,  921,  918,
			    9,  918,  918,  918,  918,  918,  922,  918,  923,  918,
			  918,  918,  918,  918,  918,  918,  924,  918,  918,  918,
			  918,  918,  918,  918,  918,  925,  925,  925,  925,  925,
			  925,  925,  925,  925,  925,  925,  925,  925,  925,  925,
			  925,  926,  918,  918,  927,  918,   55,   55,  918,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			  918,  918,  918,  928,  918,  918,  918,  928,  928,  928,
			  928,  928,  929,  918,  930,  929,  918,  918,  918,  918,
			  918,  918,  931,  918,  931,  931,  918,  918,  918,  922,

			  918,  932,  932,  932,  933,  918,  918,  918,  934,  918,
			  918,  918,  918,  918,  918,  918,  925,  935,  925,  925,
			  925,  925,  925,  925,  925,  925,  925,  925,  925,  925,
			  925,  925,  925,  925,  925,  925,  918,   46,  925,  925,
			  925,  925,  925,  925,  925,  925,  925,  925,  925,  926,
			  926,  926,  926,  927,  918,  918,  918,  936,   58,  918,
			  158,  158,  158,  918,   58,   58,   58,   58,  158,   58,
			  158,  158,   58,   58,  158,  158,   58,   58,  158,  158,
			   58,   58,  158,   58,  158,  158,  158,   58,   58,   58,
			   58,  158,   58,  158,   58,  158,  158,   58,   58,  158,

			  158,   58,   58,  158,  158,   58,   58,  158,   58,  158,
			   58,  918,  928,  918,  918,  918,  918,  928,  928,  928,
			  928,  928,  929,  918,  937,  929,  930,  938,  930,  937,
			  918,  918,  918,  918,  939,  918,  931,  931,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  924,  918,  918,
			  918,  918,  918,  918,  918,  940,  941,  918,  935,  925,
			  925,  925,  925,  925,  925,  925,  925,  925,  925,  925,
			  918,  925,  925,  925,  925,  925,  925,  925,  918,  925,
			  925,  925,  925,  140,  140,  140,  925,  925,  925,  925,

			  925,  925,  925,  925,  925,  925,  918,  926,  926,  926,
			  926,  918,  942,  918,  158,  158,  158,  918,  918,   58,
			   58,   58,  158,   58,  158,  158,   58,   58,  158,  158,
			  158,   58,   58,   58,  158,  158,   58,   58,  918,  158,
			  158,  158,  158,  158,   58,   58,  158,   58,  158,   58,
			  158,  158,   58,   58,  158,  158,   58,   58,  158,  158,
			  158,   58,   58,   58,  158,   58,  158,   58,  928,  928,
			  928,  928,  928,  928,  928,  937,  918,  938,  918,  918,
			  918,  943,  943,  918,  943,  943,  943,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,

			  918,  918,  918,  918,  918,  918,  918,  918,  940,  941,
			  944,  935,  925,  925,  925,  925,  925,  925,  925,  925,
			  925,  925,  918,  925,  925,  925,  925,  925,  925,  140,
			  137,  137,  137,  918,  941,  431,  431,  925,  925,  918,
			  925,  925,  925,  925,  925,  918,  926,  926,  926,  926,
			  926,  926,  926,  926,  918,  945,  158,  158,  918,   58,
			   58,  158,   58,  158,  158,   58,   58,  158,  158,  158,
			   58,   58,   58,  158,  158,   58,  158,  158,  158,  941,
			   58,   58,  158,   58,  158,  158,   58,   58,  158,  158,
			   58,   58,  158,  158,  158,   58,   58,  158,   58,  918,

			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  946,  947,  925,  925,  925,  925,  925,  925,  925,
			  925,  925,  918,  925,  925,  925,  925,  925,  925,  918,
			  941,  431,  541,  918,  925,  925,  925,  925,  940,  918,
			  926,  918,  918,  926,  918,  926,  918,  926,  918,  926,
			  918,  158,  158,  918,  918,   58,   58,  158,   58,  158,
			  158,   58,   58,  158,  158,   58,   58,  158,  158,   58,
			  158,  158,  158,  941,  941,   58,   58,  158,   58,  158,
			  158,   58,   58,  158,  158,  158,  158,   58,   58,  918,

			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  948,  947,  925,  925,  925,
			  925,  925,  925,  925,  925,  918,  925,  925,  925,  925,
			  925,  918,  941,  918,  925,  925,  925,  925,  918,  940,
			  940,  926,  918,  926,  926,  926,  926,  918,  158,  918,
			  918,  158,   58,  158,  158,   58,   58,  158,  158,  158,
			   58,   58,   58,  158,  158,  158,   58,   58,  158,   58,
			  158,  158,   58,   58,  158,  158,  158,  158,   58,   58,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  948,  925,  925,  925,  925,  925,  918,  925,

			  925,  925,  925,  925,  918,  925,  925,  925,  918,  918,
			  940,  940,  918,  918,  918,  918,  158,  918,  158,   58,
			  158,  158,   58,   58,  158,  158,  158,   58,   58,  158,
			   58,  158,  158,   58,   58,  158,  158,  158,   58,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  949,  925,
			  925,  925,  918,  925,  918,  925,  925,  925,  918,  918,
			  946,  946,  918,  918,  918,  918,  918,  158,  158,   58,
			  158,   58,  158,   58,  158,  158,  158,   58,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  950,  925,  925,
			  925,  925,  918,  925,  925,  918,  918,  948,  948,  918,

			  918,  918,  158,  158,   58,  158,   58,  158,   58,  158,
			  158,   58,  918,  918,  918,  918,  918,  950,  925,  925,
			  925,  925,  918,  918,  948,  948,  918,  158,  158,   58,
			  158,   58,  158,  918,  918,  951,  918,  925,  925,  925,
			  925,  918,  918,  948,  158,  158,   58,  158,   58,  158,
			  918,  918,  951,  918,  925,  925,  918,  918,  948,  158,
			  158,  918,  918,  925,  925,  918,  918,  948,  158,  158,
			  918,  918,  918,  918,  918,  918,  925,  918,  918,  158,
			  918,  918,  918,  918,  918,  918,  925,  918,  918,  158,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,

			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,    0,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918,  918,  918,  918,  918,  918,  918,  918,  918,
			  918,  918, yy_Dummy>>)
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
			    0,    0,    0,    0,    0,  106,  106,    0,    0,    0,
			    0,  137,  135,    1,    2,   15,  119,   18,  135,   16,
			   17,    7,    6,   13,    5,   11,    8,  111,  111,   14,
			   12,   28,   10,   29,   19,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   91,   99,   99,   99,
			   99,   21,   30,   22,    9,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			   23,   20,   24,  123,  124,  125,  126,  123,  123,  123,
			  123,  123,  106,  109,  136,  106,   74,   74,   71,   74,
			   74,   81,   81,   78,   81,   81,    1,    2,   27,  119,

			  118,  133,  133,  133,    3,   32,  117,   31,  103,    0,
			    0,  111,    0,  111,   26,   25,   99,    0,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   39,    0,   99,   98,   98,
			   90,   98,   98,   99,   99,   99,   99,   99,   99,    0,
			    0,    0,    0,    0,  110,    0,    0,    0,  102,    0,
			  102,  102,  102,    0,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,   39,  102,   39,  102,

			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  105,  123,  125,  124,  121,  120,  122,  123,  123,
			  123,  123,  106,  109,    0,  106,    0,    0,    0,  107,
			  108,    0,    0,   71,    0,    0,    0,    0,   78,    0,
			   77,    0,   76,   80,  133,  127,  133,  133,  133,  133,
			  133,  133,    4,   33,  117,    0,    0,    0,    0,    0,
			  113,    0,  111,    0,    0,    0,    0,    0,    0,   99,
			   99,   38,   99,   99,   99,   99,   99,   99,   99,   99,
			    0,   99,   99,   99,   99,   41,   99,   99,   97,   91,
			   91,   91,   91,   98,   99,   98,   98,   98,   99,   99,

			   99,   99,   99,   99,   40,   99,    0,    0,    0,    0,
			    0,  101,  104,    0,  102,  102,   38,    0,    0,  102,
			  102,   38,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,    0,  102,
			  102,  102,   64,   64,  102,  102,  102,  102,   41,   41,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,   40,   40,  102,  102,  123,  123,
			  123,  123,  123,  123,  123,    0,  107,  108,   72,    0,
			    0,    0,    0,   79,   77,   76,   80,  131,  134,  134,
			  132,  128,  129,  130,  117,    0,  117,    0,    0,    0,

			  113,    0,    0,    0,  116,  111,    0,    0,    0,    0,
			    0,  100,   99,   99,   99,   99,   99,   37,   99,   99,
			   99,   99,    0,   99,   99,   99,   99,   99,   99,   90,
			   99,   99,   99,    0,    0,   90,   90,   90,   36,    0,
			   43,   99,   99,   99,   99,   75,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,   61,  102,  102,    0,  102,
			  102,  102,  102,  102,  102,  102,  102,   37,  102,  102,
			   37,  102,  102,  102,  102,  102,  102,  102,  102,    0,
			  102,  102,  102,  102,  102,  102,  102,  102,   36,   43,
			   36,   43,  102,  102,  102,  102,  102,  102,  102,  108,

			    0,   70,    0,   69,   73,  117,    0,    0,    0,  112,
			  113,    0,  114,    0,  116,    0,    0,    0,  111,   87,
			    0,    0,    0,   58,   99,   99,   99,   99,   99,   99,
			   44,   99,    0,   99,   99,   35,   99,   99,   99,    0,
			    0,   99,   99,    0,   99,   99,   99,   99,    0,    0,
			    0,    0,   65,    0,   66,    0,   63,    0,   62,    0,
			    0,   58,  102,    0,    0,   58,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,   44,  102,   44,
			  102,  102,   35,   64,   64,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,    0,

			  117,    0,    0,    0,  113,  114,    0,    0,  116,    0,
			    0,    0,    0,   87,    0,    0,    0,   99,   59,   99,
			   60,   99,   99,   46,   99,    0,   99,   99,   99,   99,
			   99,   90,   90,    0,   52,   99,   99,   99,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  102,    0,
			    0,   59,   59,  102,   60,  102,   60,  102,  102,   46,
			  102,  102,   46,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,   52,  102,  102,  102,   52,  102,
			    0,    0,  103,    0,  114,    0,  117,    0,   89,    0,
			    0,  115,    0,   99,   99,   57,   99,   45,    0,   42,

			   56,   34,   99,   50,    0,   99,   99,   99,    0,    0,
			    0,    0,    0,    0,    0,    0,  102,    0,  102,  102,
			   57,  102,   57,  102,   45,   42,   56,   42,   56,   34,
			   34,  102,   50,  102,   50,  102,  102,  102,  102,    0,
			    0,  114,    0,    0,    0,    0,   86,  115,    0,   99,
			   99,   99,   94,   99,    0,   99,   99,   53,    0,    0,
			    0,    0,    0,    0,   68,    0,  104,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,   53,  102,  116,    0,
			  116,    0,    0,    0,    0,   86,  115,    0,   99,   99,
			   47,   99,   93,   51,   99,    0,    0,    0,    0,    0,

			   67,    0,  102,  102,  102,   47,   47,  102,  102,   51,
			  102,   51,  116,   88,    0,   86,  115,    0,   99,   99,
			   99,   99,   92,   92,   92,   92,    0,  102,  102,  102,
			  102,  102,  102,    0,    0,    0,    0,   99,   49,   48,
			   99,    0,    0,    0,  102,   49,   49,   48,   48,  102,
			    0,    0,    0,    0,   99,   99,    0,    0,    0,  102,
			  102,   85,   82,   99,   54,    0,    0,    0,  102,   54,
			    0,    0,   85,    0,    0,    0,   99,    0,    0,  102,
			    0,    0,   82,    0,    0,   82,   55,    0,    0,   55,
			    0,   84,    0,    0,    0,    0,    0,    0,   84,   82,

			    0,    0,    0,    0,    0,    0,    0,   83,   95,   96,
			    0,    0,    0,   83,    0,   83,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 5148
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 918
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 919
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

	yyNb_rules: INTEGER = 136
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 137
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
