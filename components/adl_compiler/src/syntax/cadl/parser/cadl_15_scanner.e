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
if yy_act <= 69 then
if yy_act <= 35 then
if yy_act <= 18 then
if yy_act <= 9 then
if yy_act <= 5 then
if yy_act <= 3 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 84 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 84")
end
-- Ignore separators
else
--|#line 85 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 85")
end
in_lineno := in_lineno + text_count
end
else
--|#line 90 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 90")
end
-- Ignore comments
end
else
if yy_act = 4 then
--|#line 91 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 91")
end
in_lineno := in_lineno + 1
else
--|#line 95 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 95")
end
last_token := Minus_code
end
end
else
if yy_act <= 7 then
if yy_act = 6 then
--|#line 96 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 96")
end
last_token := Plus_code
else
--|#line 97 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 97")
end
last_token := Star_code
end
else
if yy_act = 8 then
--|#line 98 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 98")
end
last_token := Slash_code
else
--|#line 99 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 99")
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
--|#line 100 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 100")
end
last_token := Equal_code
else
--|#line 101 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 101")
end
last_token := Dot_code
end
else
--|#line 102 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 102")
end
last_token := Semicolon_code
end
else
if yy_act = 13 then
--|#line 103 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 103")
end
last_token := Comma_code
else
--|#line 104 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 104")
end
last_token := Colon_code
end
end
else
if yy_act <= 16 then
if yy_act = 15 then
--|#line 105 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 105")
end
last_token := Exclamation_code
else
--|#line 106 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 106")
end
last_token := Left_parenthesis_code
end
else
if yy_act = 17 then
--|#line 107 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 107")
end
last_token := Right_parenthesis_code
else
--|#line 108 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 108")
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
--|#line 110 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 110")
end
last_token := Question_mark_code
else
--|#line 112 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 112")
end
last_token := SYM_INTERVAL_DELIM
end
else
--|#line 114 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 114")
end
last_token := Left_bracket_code
end
else
if yy_act = 22 then
--|#line 115 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 115")
end
last_token := Right_bracket_code
else
--|#line 117 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 117")
end
last_token := SYM_START_CBLOCK
end
end
else
if yy_act <= 25 then
if yy_act = 24 then
--|#line 118 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 118")
end
last_token := SYM_END_CBLOCK
else
--|#line 120 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 120")
end
last_token := SYM_GE
end
else
if yy_act = 26 then
--|#line 121 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 121")
end
last_token := SYM_LE
else
--|#line 122 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 122")
end
last_token := SYM_NE
end
end
end
else
if yy_act <= 31 then
if yy_act <= 29 then
if yy_act = 28 then
--|#line 124 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 124")
end
last_token := SYM_LT
else
--|#line 125 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 125")
end
last_token := SYM_GT
end
else
if yy_act = 30 then
--|#line 127 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 127")
end
last_token := SYM_MODULO
else
--|#line 128 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 128")
end
last_token := SYM_DIV
end
end
else
if yy_act <= 33 then
if yy_act = 32 then
--|#line 130 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 130")
end
last_token := SYM_ELLIPSIS
else
--|#line 131 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 131")
end
last_token := SYM_LIST_CONTINUE
end
else
if yy_act = 34 then
--|#line 135 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 135")
end
last_token := SYM_MATCHES
else
--|#line 137 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 137")
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
--|#line 141 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 141")
end
last_token := SYM_THEN
else
--|#line 143 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 143")
end
last_token := SYM_ELSE
end
else
--|#line 145 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 145")
end
last_token := SYM_AND
end
else
if yy_act = 39 then
--|#line 147 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 147")
end
last_token := SYM_OR
else
--|#line 149 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 149")
end
last_token := SYM_XOR
end
end
else
if yy_act <= 42 then
if yy_act = 41 then
--|#line 151 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 151")
end
last_token := SYM_NOT
else
--|#line 153 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 153")
end
last_token := SYM_IMPLIES
end
else
if yy_act = 43 then
--|#line 155 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 155")
end
last_token := SYM_TRUE
else
--|#line 157 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 157")
end
last_token := SYM_FALSE
end
end
end
else
if yy_act <= 48 then
if yy_act <= 46 then
if yy_act = 45 then
--|#line 159 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 159")
end
last_token := SYM_FORALL
else
--|#line 161 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 161")
end
last_token := SYM_EXISTS
end
else
if yy_act = 47 then
--|#line 165 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 165")
end
last_token := SYM_EXISTENCE
else
--|#line 167 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 167")
end
last_token := SYM_OCCURRENCES
end
end
else
if yy_act <= 50 then
if yy_act = 49 then
--|#line 169 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 169")
end
last_token := SYM_CARDINALITY
else
--|#line 171 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 171")
end
last_token := SYM_ORDERED
end
else
if yy_act = 51 then
--|#line 173 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 173")
end
last_token := SYM_UNORDERED
else
--|#line 175 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 175")
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
--|#line 177 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 177")
end
last_token := SYM_USE_NODE
else
--|#line 179 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 179")
end
last_token := SYM_USE_ARCHETYPE
end
else
--|#line 181 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 181")
end
last_token := SYM_ALLOW_ARCHETYPE
end
else
if yy_act = 56 then
--|#line 183 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 183")
end
last_token := SYM_INCLUDE
else
--|#line 185 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 185")
end
last_token := SYM_EXCLUDE
end
end
else
if yy_act <= 59 then
if yy_act = 58 then
--|#line 187 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 187")
end
last_token := SYM_AFTER
else
--|#line 189 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 189")
end
last_token := SYM_BEFORE
end
else
if yy_act = 60 then
--|#line 191 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 191")
end
last_token := SYM_CLOSED
else
--|#line 194 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 194")
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
else
if yy_act = 64 then
--|#line 212 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 212")
end

		last_token := V_ID_CODE_STR
		last_string_value := text
	
else
--|#line 218 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 218")
end

		last_token := V_VALUE_SET_REF
		last_string_value := text_substring (2, text_count - 1)
	
end
end
else
if yy_act <= 67 then
if yy_act = 66 then
--|#line 224 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 224")
end

		last_token := V_VALUE_DEF
		last_string_value := text_substring (2, text_count - 1)
	
else
--|#line 230 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 230")
end

		last_token := V_VALUE_SET_REF_ASSUMED
		last_string_value := text_substring (2, text_count - 1)
		last_string_value.prune_all(' ')
		last_string_value.prune_all('%T')
	
end
else
if yy_act = 68 then
--|#line 252 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 252")
end

		set_start_condition (IN_EXPANDED_VALUE_SET_DEF)
		create last_term_constraint_parse_structure_value.make
		str_ := text_substring (2, text_count)
		last_term_constraint_parse_structure_value.set_terminology_id (str_.substring (1, str_.index_of (':', 1)-1))
		is_assumed_code := False
	
else
--|#line 261 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 261")
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
--|#line 276 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 276")
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
--|#line 291 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 291")
end
in_lineno := in_lineno + text_count
end
else
--|#line 294 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 294")
end
in_lineno := in_lineno + 1
end
else
if yy_act = 73 then
--|#line 296 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 296")
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
--|#line 319 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 319")
end
	-- Catch-all rules (no backing up)
			last_token := ERR_VALUE_SET_DEF
			set_start_condition (INITIAL)
	
end
end
else
if yy_act <= 76 then
if yy_act = 75 then
--|#line 329 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 329")
end

		last_token := ERR_VALUE_SET_MISSING_CODES
		err_str := text
	
else
--|#line 345 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 345")
end

		set_start_condition (IN_EXTERNAL_VALUE_SET_DEF)
		create last_term_constraint_parse_structure_value.make
		str_ := text_substring (2, text_count)
		last_term_constraint_parse_structure_value.set_terminology_id (str_.substring (1, str_.index_of (':', 1)-1))
		is_assumed_code := False
	
end
else
if yy_act = 77 then
--|#line 354 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 354")
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
--|#line 369 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 369")
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
--|#line 384 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 384")
end
in_lineno := in_lineno + text_count
else
--|#line 387 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 387")
end
in_lineno := in_lineno + 1
end
else
--|#line 389 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 389")
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
--|#line 412 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 412")
end
	-- Catch-all rules (no backing up)
			last_token := ERR_VALUE_SET_DEF
			set_start_condition (INITIAL)
	
else
--|#line 424 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 424")
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
--|#line 432 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 432")
end

		last_token := V_EXT_REF
		last_string_value := text_substring (2, text_count - 1)
		last_string_value.prune_all(' ')
		last_string_value.prune_all('%T')
	
else
--|#line 441 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 441")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
if yy_act = 86 then
--|#line 442 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 442")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 443 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 443")
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
--|#line 450 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 450")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 451 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 451")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
else
--|#line 458 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 458")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
else
if yy_act = 91 then
--|#line 459 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 459")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
--|#line 466 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 466")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
end
else
if yy_act <= 94 then
if yy_act = 93 then
--|#line 467 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 467")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 479 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 479")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
if yy_act = 95 then
--|#line 489 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 489")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text_substring(2, text_count)
			
else
--|#line 494 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 494")
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
--|#line 504 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 504")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
				last_string_value.put('T', last_string_value.index_of(' ', 1))
			
else
--|#line 510 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 510")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
if yy_act = 99 then
--|#line 521 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 521")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN_ERR
				unread_character(last_string_value.item(last_string_value.count)) -- put back the last character 
				last_string_value := text
			
else
--|#line 530 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 530")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
end
end
else
if yy_act <= 102 then
if yy_act = 101 then
--|#line 536 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 536")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 542 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 542")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
end
else
if yy_act = 103 then
--|#line 548 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 548")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
else
--|#line 555 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 555")
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
--|#line 561 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 561")
end
		-- matches an absolute path string with segments of form "/attr_name" or "/attr_name[id-code]"
			last_token := V_ABS_PATH
			last_string_value := text
		
else
--|#line 567 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 567")
end
		-- matches a relative path string with segments of form "/attr_name" or "/attr_name[id-code]"
			last_token := V_REL_PATH
			last_string_value := text
		
end
else
--|#line 573 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 573")
end

			last_token := SYM_START_CBLOCK
			set_start_condition (IN_REGEXP1)
			in_buffer.append_character ('/')
		
end
else
if yy_act = 108 then
--|#line 580 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 580")
end
 		-- match segment consisting of non / or [
				in_buffer.append_string (text)
	
else
--|#line 584 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 584")
end
 		-- match [] segment
				in_buffer.append_string (text)
	
end
end
else
if yy_act <= 111 then
if yy_act = 110 then
--|#line 588 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 588")
end
 		-- match segment ending in quoted slashes '\/'
				in_buffer.append_string (text)
	
else
--|#line 592 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 592")
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
--|#line 604 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 604")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
else
--|#line 611 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 611")
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
--|#line 616 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 616")
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
--|#line 631 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 631")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
end
else
if yy_act = 116 then
--|#line 632 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 632")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
else
--|#line 636 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 636")
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
--|#line 637 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 637")
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
--|#line 638 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 638")
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
--|#line 658 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 658")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 663 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 663")
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
--|#line 671 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 671")
end
in_buffer.append_character ('\')
else
--|#line 673 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 673")
end
in_buffer.append_character ('"')
end
else
--|#line 675 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 675")
end

				in_buffer.append_string (text)
	
end
else
if yy_act = 125 then
--|#line 679 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 679")
end
in_buffer.append_string (text)
else
--|#line 681 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 681")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
end
else
if yy_act <= 128 then
if yy_act = 127 then
--|#line 686 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 686")
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
--|#line 697 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 697")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
else
if yy_act = 129 then
--|#line 705 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 705")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
--|#line 707 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 707")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
end
end
else
if yy_act <= 134 then
if yy_act <= 132 then
if yy_act = 131 then
--|#line 708 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 708")
end
last_token := V_CHARACTER; last_character_value := '%R'
else
--|#line 709 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 709")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 133 then
--|#line 710 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 710")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 711 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 711")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 136 then
if yy_act = 135 then
--|#line 713 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 713")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 714 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 714")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 137 then
--|#line 718 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 718")
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
			create an_array.make_filled (0, 0, 4945)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			yy_nxt_template_3 (an_array)
			yy_nxt_template_4 (an_array)
			yy_nxt_template_5 (an_array)
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
			  145,  278,  953,  117,  178,  146,  184,  281,   77,   78,
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
			  109,  433,  110,  117,  111,  111,  111,  111,  111,  111,
			  109,  117,  110,  117,  113,  113,  113,  113,  113,  113,

			  117,  117,  117,  117,  124,  117,  126,  129,  130,  134,
			  192,  143,  194,  131,  208,  125,  909,  133,  127,  144,
			  313,  147,  135,  112,  241,  954,  214,  241,  232,  950,
			  214,  232,  124,  112,  126,  129,  130,  134,  193,  143,
			  195,  131,  209,  224,  125,  133,  127,  144,  313,  147,
			  135,  136,  137,  137,  137,  137,  137,  137,  169,  159,
			  117,  171,  196,  159,  179,  159,  159,  138,  204,  200,
			  172,  542,  159,  205,  139,  197,  180,  201,  210,  225,
			  226,  140,  117,  141,  233,  142,  170,  165,  214,  173,
			  198,  165,  181,  165,  165,  138,  206,  202,  174,  214,

			  165,  207,  139,  199,  182,  203,  219,  211,  218,  218,
			  218,  228,  141,  117,  142,  149,  149,  231,  214,  258,
			  149,  149,  270,  149,  149,  149,  149,  149,  149,  240,
			  185,  186,  240,  314,  240,  117,  187,  240,  117,  117,
			  117,  241,  242,  610,  610,  364,  241,  269,  229,  230,
			  270,  188,  243,  225,  226,  259,  267,  243,  189,  190,
			  424,  314,  149,  151,  191,  927,  220,  220,  220,  416,
			  925,  152,  153,  156,  364,  269,  156,  921,  221,  221,
			  117,  157,  244,   96,  267,   96,   96,  244,  158,  159,
			  159,  159,  159,  159,  159,  160,  222,  222,  222,  271,

			  117,  159,  159,  159,  159,  159,  161,  159,  159,  159,
			  162,  159,  163,  159,  159,  159,  159,  159,  159,  159,
			  159,  159,  159,  159,  164,  303,  304,  271,  159,  165,
			  165,  165,  165,  165,  166,  165,  165,  165,  167,  165,
			  168,  165,  165,  165,  165,  165,  165,  165,  165,  165,
			  165,  165,  156,  920,  303,  156,  117,  117,  117,  117,
			  157,  260,  260,  260,  260,  260,  260,  158,  159,  159,
			  159,  159,  159,  159,  160,  887,  273,  277,  282,  877,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159,

			  159,  159,  159,  164,  273,  277,  282,  159,  165,  165,
			  165,  165,  165,  165,  165,  165,  165,  165,  165,  165,
			  165,  165,  165,  165,  165,  165,  165,  165,  165,  165,
			  165,  247,  117,  255,  255,  255,  255,  255,  255,  285,
			  248,  248,  248,  248,  248,  248,  117,  315,  117,  256,
			  261,  261,  261,  261,  261,  261,  265,  265,  265,  265,
			  265,  265,  272,  912,  913,  279,  262,  285,  117,  914,
			  915,  215,  257,  215,  215,  315,  249,  256,  109,  117,
			  110,  268,  263,  263,  263,  263,  263,  263,  264,  117,
			  272,  250,  276,  279,  262,  251,  109,  252,  110,  964,

			  263,  263,  263,  263,  263,  263,  117,  117,  117,  268,
			  283,  117,  274,  280,  284,  287,  117,  136,  275,  136,
			  276,  112,  288,  158,  296,  886,  117,  297,  117,  116,
			  302,  289,  117,  290,  879,  138,  117,  224,  283,  112,
			  274,  280,  284,  287,  117,  136,  275,  291,  878,  291,
			  288,  141,  296,  117,  117,  297,  117,  765,  302,  451,
			  289,  138,  290,  138,  301,  299,  298,  437,  156,  300,
			  313,  156,  314,  225,  226,  291,  157,  315,  320,  136,
			  141,  136,  292,  292,  292,  292,  292,  292,  117,  138,
			  117,  117,  301,  299,  298,  138,  320,  300,  317,  322,

			  318,  293,  139,  323,  294,  319,  320,  149,  149,  291,
			  295,  141,  149,  149,  149,  149,  117,  322,  323,  149,
			  149,  304,  364,  138,  321,  326,  326,  322,  304,  293,
			  139,  323,  294,  327,  332,  333,  149,  149,  295,  328,
			  141,  149,  149,  149,  149,  324,  325,  332,  149,  149,
			  304,  365,  327,  326,  329,  333,  337,  304,  328,  841,
			  338,  327,  332,  333,  306,  337,  338,  328,  340,  341,
			  341,  341,  341,  341,  344,  334,  833,  344,  346,  307,
			  330,  346,  348,  335,  337,  349,  331,  308,  338,  348,
			  349,  352,  353,  342,  343,  352,  353,  356,  358,  358,

			  362,  357,  344,  309,  964,  345,  346,  362,  214,  347,
			  348,  243,  498,  349,  243,  498,  214,  350,  351,  352,
			  353,  214,  214,  354,  355,  356,  358,  361,  362,  357,
			  214,  231,  228,  356,  214,  363,  375,  357,  159,  159,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159,
			  159,  359,  304,  232,  614,  360,  232,  225,  226,  229,
			  230,  831,  651,  229,  230,  377,  378,  378,  378,  378,
			  378,  386,  387,  387,  387,  387,  387,  387,  117,  366,
			  367,  368,  369,  370,  218,  218,  218,  117,  922,  218, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  218,  218,  219,  240,  240,  112,  240,  240,  371,  371,
			  371,  652,  372,  372,  372,  241,  241,  117,  253,  233,
			  253,  253,  438,  393,  410,  393,  243,  243,  394,  394,
			  394,  394,  394,  394,  395,  395,  395,  395,  395,  395,
			  397,  397,  397,  397,  397,  397,  404,  404,  404,  404,
			  404,  438,  410,  859,  859,  859,  244,  244,  379,  380,
			  381,  379,  380,  379,  379,  379,  379,  379,  379,  379,
			  379,  382,  242,  242,  379,  242,  242,  242,  242,  242,
			  242,  379,  383,  379,  379,  379,  379,  242,  242,  242,
			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,

			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,
			  379,  379,  384,  379,  242,  242,  242,  242,  242,  242,
			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,
			  242,  242,  242,  242,  242,  242,  242,  242,  379,  379,
			  379,  379,  379,  379,  379,  379,  379,  379,  379,  379,
			  392,  392,  392,  392,  392,  392,  398,  398,  398,  398,
			  398,  398,  214,  117,  117,  453,  256,  117,  401,  606,
			  401,  407,  399,  402,  402,  402,  402,  402,  402,  109,
			  408,  110,  117,  403,  403,  403,  403,  403,  403,  257,
			  117,  117,  117,  453,  256,  400,  117,  117,  409,  407,

			  399,  405,  405,  405,  405,  405,  405,  117,  408,  413,
			  411,  414,  415,  417,  117,  412,  117,  117,  117,  422,
			  117,  454,  112,  421,  417,  453,  409,  418,  423,  419,
			  420,  158,  382,  381,  417,  382,  494,  413,  411,  414,
			  415,  221,  221,  412,  806,  136,  117,  422,  768,  454,
			  762,  421,  417,  456,  117,  418,  423,  419,  420,  425,
			  425,  425,  425,  425,  425,  494,  760,  117,  426,  426,
			  426,  426,  426,  426,  295,  454,  117,  427,  427,  427,
			  427,  427,  427,  117,  428,  117,  428,  964,  424,  116,
			  116,  116,  116,  116,  116,  136,  117,  424,  432,  117,

			  117,  117,  295,  457,  117,  494,  424,  429,  434,  458,
			  430,  458,  460,  766,  435,  461,  431,  460,  294,  461,
			  436,  767,  304,  464,  295,  465,  432,  149,  149,  496,
			  615,  759,  440,  441,  495,  429,  434,  458,  430,  459,
			  460,  442,  435,  461,  431,  462,  294,  463,  436,  149,
			  149,  464,  295,  465,  440,  441,  117,  443,  444,  444,
			  444,  444,  444,  442,  149,  149,  373,  117,  466,  440,
			  441,  910,  445,  446,  446,  446,  446,  446,  442,  149,
			  149,  464,  465,  466,  440,  441,  470,  447,  448,  449,
			  449,  449,  449,  442,  149,  149,  466,  470,  473,  440,

			  441,  312,  474,  475,  473,  474,  214,  479,  442,  467,
			  468,  469,  479,  417,  470,  476,  214,  341,  341,  341,
			  341,  341,  341,  481,  417,  472,  473,  482,  481,  482,
			  474,  475,  477,  478,  417,  479,  485,  486,  485,  486,
			  480,  489,  490,  489,  450,  490,  214,  383,  381,  214,
			  383,  481,  417,  214,  117,  482,  483,  484,  500,  562,
			  497,  500,  117,  497,  485,  486,  487,  488,  562,  489,
			  490,  492,  498,  493,  499,  117,  554,  380,  381,  554,
			  380,  518,  117,  500,  218,  218,  218,  497,  562,  382,
			  497,  912,  913,  531,  220,  220,  220,  566,  683,  498,

			  383,  499,  117,  378,  378,  378,  378,  378,  378,  518,
			  500,  256,  117,  501,  386,  387,  387,  387,  387,  387,
			  387,  531,  914,  915,  222,  222,  222,  218,  218,  218,
			  384,  218,  218,  218,  257,  746,  847,  684,  258,  256,
			  501,  394,  394,  394,  394,  394,  394,  502,  502,  502,
			  502,  502,  502,  504,  504,  504,  504,  504,  504,  506,
			  506,  506,  506,  506,  506,  507,  507,  507,  507,  507,
			  507,  510,  510,  510,  510,  510,  510,  561,  848,  561,
			  158,  399,  508,  713,  508,  117,  503,  509,  509,  509,
			  509,  509,  509,  402,  402,  402,  402,  402,  402,  117,

			  117,  705,  117,  439,  400,  561,  439,  565,  519,  399,
			  511,  511,  511,  511,  511,  511,  513,  514,  520,  515,
			  515,  515,  515,  515,  515,  516,  516,  516,  516,  516,
			  516,  517,  517,  517,  517,  517,  517,  519,  117,  117,
			  117,  117,  117,  117,  527,  526,  520,  522,  117,  512,
			  521,  525,  117,  117,  117,  527,  543,  117,  117,  537,
			  528,  539,  523,  524,  567,  527,  567,  117,  530,  569,
			  537,  117,  570,  526,  529,  522,  532,  533,  521,  525,
			  537,  149,  149,  527,  569,  570,  149,  149,  528,  539,
			  523,  524,  567,  538,  568,  304,  530,  569,  537,  117,

			  570,  512,  529,  503,  532,  533,  292,  292,  292,  292,
			  292,  292,  571,  572,  117,  425,  425,  425,  425,  425,
			  425,  538,  476,  117,  426,  426,  426,  426,  426,  426,
			  287,  427,  427,  427,  427,  427,  427,  534,  534,  534,
			  534,  534,  534,  149,  149,  854,  289,  650,  149,  149,
			  117,  573,  650,  288,  540,  116,  769,  304,  287,  535,
			  535,  535,  535,  535,  535,  541,  574,  117,  536,  536,
			  536,  536,  536,  536,  854,  289,  117,  547,  649,  573,
			  547,  288,  540,  117,  116,  149,  149,  623,  802,  117,
			  440,  548,  117,  541,  574,  770,  149,  149,  109,  442,

			  549,  440,  551,  964,  573,  574,  964,  577,  578,  577,
			  442,  563,  564,  564,  564,  564,  564,  551,  580,  446,
			  446,  446,  446,  446,  446,  542,  964,  803,  542,  581,
			  550,  547,  575,  576,  547,  577,  578,  579,  582,  149,
			  149,  552,  580,  581,  440,  548,  580,  444,  444,  444,
			  444,  444,  444,  442,  549,  553,  552,  581,  553,  560,
			  546,  854,  553,  149,  149,  553,  582,  554,  440,  555,
			  585,  586,  117,  117,  554,  117,  557,  442,  449,  449,
			  449,  449,  449,  449,  550,  964,  553,  149,  149,  553,
			  855,  117,  440,  441,  587,  587,  589,  590,  554,  589,

			  555,  442,  449,  449,  449,  449,  449,  449,  556,  964,
			  590,  406,  593,  594,  593,  558,  583,  584,  584,  584,
			  584,  584,  587,  588,  589,  590,  595,  591,  594,  377,
			  599,  599,  599,  599,  599,  559,  653,  596,  592,  556,
			  593,  594,  597,  497,  765,  766,  497,  600,  600,  600,
			  600,  600,  600,  767,  595,  498,  598,  601,  601,  601,
			  601,  601,  601,  505,  653,  596,  500,  392,  392,  392,
			  392,  392,  392,  602,  603,  603,  603,  603,  603,  604,
			  604,  604,  604,  604,  604,  117,  503,  509,  509,  509,
			  509,  509,  509,  616,  381,  399,  501,  605,  605,  605, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  605,  605,  605,  607,  607,  607,  607,  607,  607,  608,
			  608,  608,  608,  608,  608,  117,  381,  374,  400,  491,
			  491,  616,  618,  399,  609,  609,  609,  609,  609,  609,
			  604,  604,  604,  604,  604,  604,  606,  514,  117,  515,
			  515,  515,  515,  515,  515,  611,  117,  611,  512,  117,
			  618,  117,  117,  617,  620,  117,  612,  117,  619,  117,
			  624,  117,  622,  626,  625,  476,  621,  471,  653,  628,
			  534,  534,  534,  534,  534,  534,  471,  117,  627,  455,
			  117,  617,  620,  452,  613,  631,  619,  117,  624,  439,
			  622,  626,  625,  630,  621,  632,  654,  628,  629,  633,

			  117,  117,  655,  428,  630,  428,  627,  535,  535,  535,
			  535,  535,  535,  631,  630,  117,  536,  536,  536,  536,
			  536,  536,  635,  632,  117,  439,  629,  633,  439,  430,
			  655,  547,  630,  635,  547,  431,  149,  149,  116,  656,
			  634,  637,  149,  636,  858,  549,  149,  149,  549,  117,
			  304,  149,  441,  553,  549,  406,  553,  430,  396,  880,
			  442,  635,  655,  431,  964,  554,  116,  656,  634,  391,
			  390,  149,  149,  858,  389,  388,  149,  149,  543,  639,
			  640,  640,  640,  640,  640,  304,  149,  149,  880,  385,
			  657,  149,  149,  656,  642,  643,  643,  643,  643,  643,

			  304,  641,  149,  149,  239,  376,  659,  149,  149,  234,
			  645,  646,  646,  646,  646,  646,  304,  149,  149,  236,
			  373,  658,  149,  149,  374,  645,  647,  646,  646,  646,
			  646,  304,  149,  149,  659,  659,  665,  440,  441,  666,
			  667,  660,  660,  666,  667,  651,  442,  564,  564,  564,
			  564,  564,  564,  661,  661,  476,  373,  584,  584,  584,
			  584,  584,  584,  662,  665,  670,  670,  666,  667,  660,
			  663,  668,  669,  672,  673,  672,  673,  676,  677,  678,
			  679,  661,  664,  676,  652,  677,  214,  339,  117,  648,
			  339,  336,  694,  670,  671,  682,  682,  682,  682,  682,

			  682,  672,  673,  674,  675,  676,  677,  678,  679,  497,
			  278,  680,  497,  681,  686,  686,  686,  686,  686,  686,
			  694,  498,  316,  499,  718,  599,  599,  599,  599,  599,
			  599,  683,  500,  603,  603,  603,  603,  603,  603,  604,
			  604,  604,  604,  604,  604,  687,  687,  687,  687,  687,
			  687,  312,  718,  606,  117,  685,  688,  688,  688,  688,
			  688,  688,  501,  689,  689,  689,  689,  689,  689,  697,
			  684,  690,  690,  690,  690,  690,  690,  691,  691,  691,
			  691,  691,  691,  685,  692,  692,  692,  692,  692,  693,
			  693,  693,  693,  693,  693,  117,  117,  697,  117,  695,

			  699,  117,  117,  117,  696,  262,  117,  117,  117,  701,
			  117,  698,  117,  709,  703,  704,  707,  699,  720,  708,
			  710,  699,  700,  702,  709,  720,  706,  695,  310,  722,
			  723,  710,  696,  262,  710,  155,  304,  701,  286,  698,
			  117,  710,  703,  704,  707,  699,  720,  708,  254,  253,
			  700,  702,  709,  721,  706,  149,  149,  722,  723,  710,
			  149,  149,  246,  149,  149,  149,  149,  149,  149,  304,
			  547,  149,  149,  547,  117,  100,  149,  551,  149,  149,
			   97,  239,  722,  149,  548,  442,  716,  717,  717,  717,
			  717,  717,  442,  549,  723,  553,  236,  726,  553,  844,

			  149,  149,  149,  149,  149,  440,  441,  554,  149,  555,
			  724,  235,  234,  214,  715,  212,  552,  442,  155,  117,
			  115,  727,  725,  550,  547,  726,  114,  547,  844,  107,
			  728,  104,  149,  149,  100,  727,  964,  149,  548,  964,
			  640,  640,  640,  640,  640,  640,  442,  549,  556,  727,
			  551,   98,  643,  643,  643,  643,  643,  643,  728,  964,
			  728,   97,  553,  729,  731,  553,  563,  719,  719,  719,
			  719,  719,  964,  964,  554,  964,  555,  550,  646,  646,
			  646,  646,  646,  646,  553,  964,  731,  553,  730,  552,
			  733,  734,  731,  733,  734,  737,  554,  738,  557,  739,

			  646,  646,  646,  646,  646,  646,  737,  964,  600,  600,
			  600,  600,  600,  600,  732,  556,  117,  964,  733,  734,
			  964,  735,  736,  737,  964,  738,  964,  739,  602,  741,
			  741,  741,  741,  741,  740,  750,  742,  558,  742,  745,
			  964,  743,  743,  743,  743,  743,  743,  743,  743,  743,
			  743,  743,  743,  744,  744,  744,  744,  744,  744,  964,
			  117,  964,  400,  750,  964,  964,  752,  745,  608,  608,
			  608,  608,  608,  608,  747,  747,  747,  747,  747,  747,
			  748,  748,  748,  748,  748,  748,  606,  749,  749,  749,
			  749,  749,  749,  117,  752,  753,  117,  755,  117,  117,

			  117,  771,  772,  745,  772,  964,  751,  756,  758,  757,
			  774,  754,  753,  774,  755,  964,  753,  964,  755,  149,
			  149,  964,  776,  964,  149,  149,  400,  964,  964,  771,
			  772,  745,  773,  304,  751,  756,  758,  757,  774,  754,
			  753,  775,  755,  763,  764,  764,  764,  764,  764,  769,
			  776,  717,  717,  717,  717,  717,  717,  651,  776,  719,
			  719,  719,  719,  719,  719,  778,  779,  780,  683,  778,
			  741,  741,  741,  741,  741,  741,  743,  743,  743,  743,
			  743,  743,  785,  785,  785,  785,  777,  964,  770,  964,
			  964,  964,  964,  778,  779,  780,  652,  781,  743,  743,

			  743,  743,  743,  743,  964,  117,  964,  684,  782,  782,
			  782,  782,  782,  782,  783,  807,  783,  792,  807,  784,
			  784,  784,  784,  784,  784,  786,  786,  786,  786,  786,
			  786,  787,  788,  787,  788,  790,  790,  790,  790,  790,
			  790,  117,  117,  117,  795,  792,  117,  791,  117,  794,
			  793,  745,  809,  796,  810,  798,  797,  964,  964,  798,
			  810,  795,  799,  964,  812,  795,  799,  812,  543,  814,
			  789,  964,  964,  964,  400,  791,  798,  794,  793,  745,
			  809,  796,  810,  799,  797,  149,  149,  798,  811,  795,
			  149,  800,  812,  814,  799,  813,  816,  814,  802,  304,

			  764,  764,  764,  764,  764,  764,  716,  808,  808,  808,
			  808,  808,  817,  816,  784,  784,  784,  784,  784,  784,
			  964,  815,  964,  964,  816,  819,  819,  819,  819,  819,
			  819,  820,  820,  820,  820,  820,  820,  803,  964,  964,
			  817,  818,  613,  613,  613,  613,  613,  613,  821,  821,
			  821,  821,  821,  821,  822,  822,  822,  822,  822,  822,
			  117,  117,  117,  835,  606,  823,  823,  823,  823,  823,
			  823,  824,  117,  828,  829,  836,  807,  828,  829,  807,
			  826,  745,  825,  827,  763,  832,  832,  832,  832,  832,
			  964,  835,  964,  964,  828,  829,  964,  964,  964,  824, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  964,  964,  964,  836,  400,  828,  829,  964,  826,  745,
			  825,  827,  149,  149,  836,  838,  838,  149,  149,  840,
			  149,  149,  149,  149,  149,  149,  304,  964,  769,  543,
			  808,  808,  808,  808,  808,  808,  782,  782,  782,  782,
			  782,  782,  837,  838,  839,  964,  117,  840,  842,  842,
			  842,  842,  842,  842,  843,  787,  117,  787,  117,  149,
			  822,  822,  822,  822,  822,  822,  964,  770,  823,  823,
			  823,  823,  823,  823,  964,  606,  845,  853,  856,  149,
			  149,  856,  843,  846,  149,  149,  860,  860,  860,  860,
			  860,  860,  117,  304,  789,  802,  869,  832,  832,  832,

			  832,  832,  832,  117,  845,  853,  856,  863,  864,  857,
			  870,  117,  846,  861,  881,  863,  864,  149,  149,  964,
			  862,  964,  865,  866,  869,  117,  964,  964,  863,  864,
			  117,  304,  964,  873,  803,  882,  872,  882,  870,  964,
			  964,  861,  881,  863,  864,  964,  883,  885,  862,  871,
			  871,  871,  871,  871,  871,  789,  789,  789,  789,  789,
			  789,  873,  874,  875,  964,  872,  891,  149,  149,  903,
			  874,  875,  149,  149,  884,  885,  893,  893,  893,  893,
			  893,  304,  117,  874,  875,  964,  149,  149,  964,  964,
			  894,  865,  866,  964,  891,  964,  964,  903,  874,  875,

			  304,  888,  888,  888,  888,  888,  888,  304,  892,  892,
			  892,  892,  892,  892,  895,  896,  964,  964,  894,  904,
			  904,  904,  904,  904,  904,  895,  896,  905,  905,  905,
			  905,  905,  905,  964,  964,  895,  896,  897,  906,  898,
			  899,  907,  888,  888,  888,  888,  888,  888,  304,  906,
			  964,  964,  907,  895,  896,  964,  964,  964,  964,  906,
			  964,  964,  907,  908,  908,  908,  908,  908,  908,  911,
			  911,  911,  911,  911,  911,  304,  917,  906,  917,  900,
			  907,  916,  916,  916,  916,  916,  916,  918,  908,  908,
			  908,  908,  908,  908,  908,  908,  908,  908,  908,  908,

			  897,  964,  898,  923,  964,  911,  911,  911,  911,  911,
			  911,  304,  964,  964,  964,  919,  929,  929,  929,  929,
			  929,  909,  930,  931,  964,  900,  884,  884,  884,  884,
			  884,  884,  928,  928,  928,  928,  928,  928,  964,  930,
			  931,  964,  900,  930,  931,  932,  932,  932,  932,  932,
			  932,  304,  933,  933,  933,  933,  933,  933,  304,  934,
			  934,  934,  934,  934,  934,  964,  964,  930,  931,  935,
			  935,  935,  935,  935,  935,  936,  936,  936,  936,  936,
			  936,  937,  937,  937,  937,  937,  937,  938,  939,  932,
			  932,  932,  932,  932,  932,  304,  946,  946,  946,  946,

			  946,  946,  964,  964,  938,  939,  964,  964,  938,  939,
			  897,  964,  898,  964,  964,  933,  933,  933,  933,  933,
			  933,  304,  947,  948,  947,  948,  900,  964,  964,  964,
			  964,  964,  938,  939,  897,  964,  940,  941,  964,  934,
			  934,  934,  934,  934,  934,  964,  964,  964,  942,  964,
			  943,  944,  900,  935,  935,  935,  935,  935,  935,  964,
			  964,  949,  951,  951,  951,  951,  951,  951,  952,  952,
			  952,  952,  952,  952,  964,  964,  900,  955,  955,  955,
			  955,  955,  955,  919,  919,  919,  919,  919,  919,  964,
			  945,  956,  956,  956,  956,  956,  956,  957,  957,  957,

			  957,  957,  957,  897,  964,  940,  958,  964,  951,  951,
			  951,  951,  951,  951,  952,  952,  952,  952,  952,  952,
			  952,  952,  952,  952,  952,  952,  953,  942,  964,  943,
			  959,  964,  955,  955,  955,  955,  955,  955,  960,  960,
			  960,  960,  960,  960,  964,  900,  964,  947,  964,  947,
			  964,  945,  957,  957,  957,  957,  957,  957,  961,  961,
			  961,  961,  961,  961,  964,  964,  964,  964,  964,  945,
			  962,  962,  962,  962,  962,  962,  963,  963,  963,  963,
			  963,  963,  897,  964,  940,  964,  949,  961,  961,  961,
			  961,  961,  961,  942,  964,  943,  964,  964,  962,  962,

			  962,  962,  962,  962,  949,  949,  949,  949,  949,  949,
			  964,  964,  964,  108,  311,  311,  311,  311,  311,  311,
			  311,  311,  311,  964,  900,  108,  108,  108,  108,  108,
			  108,  108,  108,  108,  964,  945,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   86,   86,   86,   86,

			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   99,   99,  964,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,  964,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,  101,  101,  964,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  116,  116,  964,  116,
			  964,  116,  116,  116,  964,  964,  964,  116,  116,  116,

			  116,  116,  116,  116,  116,  116,  150,  150,  964,  150,
			  964,  150,  150,  964,  964,  964,  150,  150,  150,  964,
			  964,  964,  150,  150,  150,  150,  150,  150,  150,  150,
			  150,  154,  154,  964,  154,  154,  154,  154,  154,  154,
			  154,  154,  154,  154,  154,  154,  154,  154,  154,  154,
			  154,  154,  154,  154,  154,  154,  154,  154,  154,  154,
			  154,  213,  213,  964,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,
			  964,  213,  213,  213,  213,  213,  213,  213,  213,  213,
			  213,  223,  223,  223,  223,  223,  223,  223,  223,  223,

			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  238,  964,  238,  964,  964,  964,  964,  238,  964,
			  238,  238,  964,  964,  964,  238,  238,  238,  964,  964,
			  964,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  245,  245,  964,  245,  245,  245,  245,  245,  245,  245,
			  245,  245,  245,  245,  245,  245,  245,  245,  245,  245, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  245,  245,  245,  245,  245,  245,  245,  245,  245,  245,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  108,  108,  108,  964,  964,  964,  108,  108,  108,  108,
			  964,  964,  108,  108,  108,  108,  108,  108,  108,  108,
			  108,  266,  964,  964,  266,  266,  964,  266,  266,  266,
			  266,  266,  964,  964,  964,  266,  266,  266,  266,  266,
			  266,  266,  266,  266,  149,  149,  964,  149,  964,  149,
			  149,  149,  964,  964,  149,  149,  149,  964,  964,  964,

			  149,  149,  149,  149,  149,  149,  149,  149,  149,  305,
			  305,  964,  305,  964,  305,  305,  305,  964,  964,  305,
			  305,  305,  964,  964,  964,  305,  305,  305,  305,  305,
			  305,  305,  305,  305,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  964,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  225,  228,  228,  228,  228,  228,  228,
			  228,  228,  228,  228,  228,  228,  228,  228,  228,  228,
			  228,  228,  228,  228,  228,  228,  228,  228,  228,  228,
			  228,  228,  228,  228,  235,  235,  235,  235,  235,  235,

			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  311,  311,  311,  964,  964,  964,
			  311,  311,  311,  311,  964,  964,  311,  311,  311,  311,
			  311,  311,  311,  311,  311,  379,  379,  379,  379,  379,
			  379,  379,  379,  379,  379,  379,  379,  379,  379,  379,
			  379,  379,  379,  379,  379,  379,  379,  379,  379,  379,
			  379,  379,  379,  379,  379,  544,  544,  964,  544,  964,
			  544,  544,  544,  964,  964,  544,  544,  544,  964,  964,
			  964,  544,  544,  544,  544,  544,  544,  544,  544,  544,

			  545,  545,  964,  545,  964,  545,  545,  545,  964,  964,
			  545,  545,  545,  964,  964,  964,  545,  545,  545,  545,
			  545,  545,  545,  545,  545,  452,  452,  452,  964,  964,
			  452,  452,  452,  452,  452,  452,  452,  452,  964,  964,
			  452,  452,  452,  964,  964,  964,  452,  452,  452,  452,
			  452,  452,  452,  452,  452,  638,  964,  638,  964,  964,
			  964,  964,  964,  964,  964,  964,  964,  964,  964,  638,
			  638,  638,  964,  964,  638,  638,  638,  638,  638,  638,
			  638,  638,  638,  638,  644,  964,  644,  964,  964,  964,
			  964,  964,  964,  964,  964,  964,  964,  964,  644,  644,

			  644,  964,  964,  964,  644,  644,  644,  644,  644,  644,
			  644,  644,  644,  711,  711,  964,  711,  964,  711,  711,
			  711,  964,  964,  711,  711,  711,  964,  964,  964,  711,
			  711,  711,  711,  711,  711,  711,  711,  711,  712,  712,
			  964,  964,  964,  712,  712,  712,  964,  964,  964,  712,
			  712,  712,  712,  712,  712,  712,  712,  712,  714,  714,
			  964,  964,  964,  714,  714,  714,  964,  964,  964,  714,
			  714,  714,  714,  714,  714,  714,  714,  714,  761,  761,
			  964,  761,  964,  761,  761,  761,  964,  964,  761,  761,
			  761,  964,  964,  964,  761,  761,  761,  761,  761,  761,

			  761,  761,  761,  801,  801,  964,  964,  964,  801,  801,
			  801,  964,  964,  964,  801,  801,  801,  801,  801,  801,
			  801,  801,  801,  804,  804,  964,  964,  964,  804,  804,
			  804,  964,  964,  964,  804,  804,  804,  804,  804,  804,
			  804,  804,  804,  805,  805,  964,  964,  964,  805,  805,
			  805,  964,  964,  964,  805,  805,  805,  805,  805,  805,
			  805,  805,  805,  830,  830,  964,  830,  964,  830,  830,
			  830,  964,  964,  830,  830,  830,  964,  964,  964,  830,
			  830,  830,  830,  830,  830,  830,  830,  830,  834,  834,
			  834,  964,  964,  964,  834,  834,  834,  834,  834,  834,

			  834,  834,  834,  849,  849,  964,  849,  964,  849,  849,
			  849,  964,  964,  849,  849,  849,  964,  964,  964,  849,
			  849,  849,  849,  849,  849,  849,  849,  849,  850,  850,
			  850,  964,  964,  964,  850,  850,  850,  850,  850,  850,
			  850,  850,  850,  851,  851,  851,  964,  964,  964,  851,
			  851,  851,  851,  851,  851,  851,  851,  851,  852,  852,
			  964,  964,  964,  852,  852,  852,  964,  964,  964,  852,
			  852,  852,  852,  852,  852,  852,  852,  852,  867,  867,
			  964,  964,  964,  867,  867,  867,  964,  964,  964,  867,
			  867,  867,  867,  867,  867,  867,  867,  867,  868,  868,

			  964,  964,  964,  868,  868,  868,  964,  964,  964,  868,
			  868,  868,  868,  868,  868,  868,  868,  868,  876,  876,
			  964,  876,  964,  876,  876,  876,  964,  964,  876,  876,
			  876,  964,  964,  964,  876,  876,  876,  876,  876,  876,
			  876,  876,  876,  889,  889,  889,  964,  964,  964,  889,
			  889,  889,  889,  889,  889,  889,  889,  889,  890,  890,
			  890,  964,  964,  964,  890,  890,  890,  890,  890,  890,
			  890,  890,  890,  901,  901,  964,  964,  964,  901,  901,
			  901,  964,  964,  964,  901,  901,  901,  901,  901,  901,
			  901,  901,  901,  902,  902,  964,  964,  964,  902,  902,

			  902,  964,  964,  964,  902,  902,  902,  902,  902,  902,
			  902,  902,  902,  924,  924,  964,  964,  964,  924,  924,
			  924,  964,  964,  964,  924,  924,  924,  924,  924,  924,
			  924,  924,  924,  926,  926,  964,  964,  964,  926,  926,
			  926,  964,  964,  964,  926,  926,  926,  926,  926,  926,
			  926,  926,  926,   11,  964,  964,  964,  964,  964,  964,
			  964,  964,  964,  964,  964,  964,  964,  964,  964,  964,
			  964,  964,  964,  964,  964,  964,  964,  964,  964,  964,
			  964,  964,  964,  964,  964,  964,  964,  964,  964,  964,
			  964,  964,  964,  964,  964,  964,  964,  964,  964,  964,

			  964,  964,  964,  964,  964,  964,  964,  964,  964,  964,
			  964,  964,  964,  964,  964,  964,  964,  964,  964,  964,
			  964,  964,  964,  964,  964,  964,  964,  964,  964,  964,
			  964,  964,  964,  964,  964,  964,  964,  964,  964,  964,
			  964,  964,  964,  964,  964,  964, yy_Dummy>>,
			1, 946, 4000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 4945)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			yy_chk_template_3 (an_array)
			yy_chk_template_4 (an_array)
			yy_chk_template_5 (an_array)
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
			   48,  128,  954,  128,   59,   48,   61,  131,    3,    3,
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
			   63,   47,   64,   42,   68,   39,  950,   44,   40,   47,
			  161,   49,   45,   27,  241,  943,   78,  241,   87,  940,
			   77,   87,   39,   28,   40,   42,   42,   45,   63,   47,
			   64,   42,   68,   82,   39,   44,   40,   47,  161,   49,
			   45,   46,   46,   46,   46,   46,   46,   46,   56,   56,
			   46,   57,   65,   56,   60,   56,   57,   46,   67,   66,
			   57,  438,   57,   67,   46,   65,   60,   66,   69,   82,
			   82,   46,  438,   46,   87,   46,   56,   56,   79,   57,
			   65,   56,   60,   56,   57,   46,   67,   66,   57,   80,

			   57,   67,   46,   65,   60,   66,   78,   69,   77,   77,
			   77,   84,   46,  121,   46,   51,   51,   85,   81,  108,
			   51,   51,  121,   51,   51,   51,   51,   51,   51,   94,
			   62,   62,   94,  162,   95,  118,   62,   95,  277,  287,
			  120,   94,   94,  513,  513,  210,   95,  120,   84,   84,
			  121,   62,   94,   85,   85,  108,  118,   95,   62,   62,
			  287,  162,   51,   51,   62,  915,   79,   79,   79,  277,
			  913,   51,   51,   55,  210,  120,   55,  907,   80,   80,
			  122,   55,   94,   96,  118,   96,   96,   95,   55,   55,
			   55,   55,   55,   55,   55,   55,   81,   81,   81,  122,

			  148,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,  148,  866,  122,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   58,  906,  148,   58,  124,  132,  127,  894,
			   58,  109,  109,  109,  109,  109,  109,   58,   58,   58,
			   58,   58,   58,   58,   58,  875,  124,  127,  132,  866,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,

			   58,   58,   58,   58,  124,  127,  132,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,  103,  135,  106,  106,  106,  106,  106,  106,  135,
			  103,  103,  103,  103,  103,  103,  123,  163,  129,  106,
			  110,  110,  110,  110,  110,  110,  112,  112,  112,  112,
			  112,  112,  123,  901,  901,  129,  110,  135,  119,  902,
			  902,  215,  106,  215,  215,  163,  103,  106,  111,  126,
			  111,  119,  111,  111,  111,  111,  111,  111,  111,  133,
			  123,  103,  126,  129,  110,  103,  113,  103,  113,  137,

			  113,  113,  113,  113,  113,  113,  125,  130,  134,  119,
			  133,  147,  125,  130,  134,  137,  143,  138,  125,  139,
			  126,  111,  137,  311,  143,  874,  138,  143,  139,  137,
			  147,  137,  873,  137,  868,  139,  301,  223,  133,  113,
			  125,  130,  134,  137,  144,  141,  125,  138,  867,  139,
			  137,  139,  143,  145,  141,  143,  146,  852,  147,  311,
			  137,  141,  137,  139,  146,  145,  144,  301,  156,  145,
			  166,  156,  167,  223,  223,  141,  156,  168,  169,  142,
			  139,  140,  140,  140,  140,  140,  140,  140,  142,  141,
			  140,  845,  146,  145,  144,  142,  170,  145,  166,  171,

			  167,  140,  142,  172,  140,  168,  169,  150,  150,  142,
			  140,  142,  150,  150,  151,  151,  844,  173,  174,  151,
			  151,  150,  211,  142,  170,  175,  177,  171,  151,  140,
			  142,  172,  140,  176,  179,  180,  152,  152,  140,  176,
			  142,  152,  152,  153,  153,  173,  174,  181,  153,  153,
			  152,  211,  178,  175,  177,  182,  185,  153,  178,  820,
			  186,  176,  179,  180,  151,  189,  190,  176,  188,  188,
			  188,  188,  188,  188,  192,  181,  804,  193,  194,  151,
			  178,  195,  196,  182,  185,  197,  178,  152,  186,  198,
			  199,  200,  201,  189,  190,  202,  203,  204,  205,  207,

			  208,  204,  192,  153,  159,  193,  194,  209,  218,  195,
			  196,  243,  498,  197,  243,  498,  219,  198,  199,  200,
			  201,  220,  367,  202,  203,  204,  205,  207,  208,  204,
			  221,  226,  227,  206,  222,  209,  229,  206,  159,  159,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159,
			  159,  206,  910,  232,  517,  206,  232,  226,  226,  227,
			  227,  801,  563,  229,  229,  236,  236,  236,  236,  236,
			  236,  248,  248,  248,  248,  248,  248,  248,  796,  218,
			  218,  218,  218,  218,  219,  219,  219,  303,  910,  220, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  220,  220,  367,  238,  240,  517,  238,  240,  221,  221,
			  221,  563,  222,  222,  222,  238,  240,  271,  253,  232,
			  253,  253,  303,  256,  271,  256,  238,  240,  256,  256,
			  256,  256,  256,  256,  257,  257,  257,  257,  257,  257,
			  260,  260,  260,  260,  260,  260,  264,  264,  264,  264,
			  264,  303,  271,  841,  841,  841,  238,  240,  242,  242,
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
			  261,  261,  369,  267,  268,  313,  255,  793,  262,  782,
			  262,  267,  261,  262,  262,  262,  262,  262,  262,  263,
			  268,  263,  270,  263,  263,  263,  263,  263,  263,  255,
			  272,  275,  276,  313,  255,  261,  274,  284,  270,  267,

			  261,  265,  265,  265,  265,  265,  265,  273,  268,  274,
			  272,  275,  276,  278,  279,  273,  280,  282,  281,  284,
			  285,  314,  263,  282,  278,  317,  270,  279,  285,  280,
			  281,  770,  382,  382,  278,  382,  364,  274,  272,  275,
			  276,  369,  369,  273,  767,  294,  758,  284,  715,  314,
			  712,  282,  278,  317,  294,  279,  285,  280,  281,  288,
			  288,  288,  288,  288,  288,  364,  710,  288,  289,  289,
			  289,  289,  289,  289,  294,  318,  289,  290,  290,  290,
			  290,  290,  290,  296,  292,  290,  292,  292,  288,  291,
			  291,  291,  291,  291,  291,  293,  299,  289,  296,  519,

			  298,  300,  294,  318,  293,  365,  290,  292,  298,  320,
			  292,  321,  322,  805,  299,  323,  292,  324,  293,  325,
			  300,  805,  898,  326,  293,  327,  296,  305,  305,  373,
			  519,  709,  305,  305,  365,  292,  298,  320,  292,  321,
			  322,  305,  299,  323,  292,  324,  293,  325,  300,  306,
			  306,  326,  293,  327,  306,  306,  704,  306,  306,  306,
			  306,  306,  306,  306,  307,  307,  373,  702,  328,  307,
			  307,  898,  307,  307,  307,  307,  307,  307,  307,  308,
			  308,  329,  330,  331,  308,  308,  332,  308,  308,  308,
			  308,  308,  308,  308,  309,  309,  328,  334,  337,  309,

			  309,  336,  338,  339,  342,  343,  366,  344,  309,  329,
			  330,  331,  345,  336,  332,  341,  368,  341,  341,  341,
			  341,  341,  341,  348,  336,  334,  337,  349,  350,  351,
			  338,  339,  342,  343,  336,  344,  352,  353,  354,  355,
			  345,  356,  357,  359,  309,  360,  370,  383,  383,  371,
			  383,  348,  336,  372,  701,  349,  350,  351,  500,  454,
			  377,  500,  407,  377,  352,  353,  354,  355,  457,  356,
			  357,  359,  377,  360,  377,  700,  554,  380,  380,  554,
			  380,  407,  421,  377,  366,  366,  366,  378,  454,  380,
			  378,  924,  924,  421,  368,  368,  368,  457,  602,  378,

			  380,  378,  698,  378,  378,  378,  378,  378,  378,  407,
			  378,  392,  696,  377,  387,  387,  387,  387,  387,  387,
			  387,  421,  926,  926,  370,  370,  370,  371,  371,  371,
			  380,  372,  372,  372,  392,  690,  828,  602,  684,  392,
			  378,  393,  393,  393,  393,  393,  393,  394,  394,  394,
			  394,  394,  394,  395,  395,  395,  395,  395,  395,  397,
			  397,  397,  397,  397,  397,  398,  398,  398,  398,  398,
			  398,  400,  400,  400,  400,  400,  400,  453,  828,  456,
			  652,  398,  399,  641,  399,  408,  394,  399,  399,  399,
			  399,  399,  399,  401,  401,  401,  401,  401,  401,  409,

			  631,  630,  621,  439,  398,  453,  439,  456,  408,  398,
			  402,  402,  402,  402,  402,  402,  403,  403,  409,  403,
			  403,  403,  403,  403,  403,  404,  404,  404,  404,  404,
			  404,  405,  405,  405,  405,  405,  405,  408,  410,  411,
			  413,  416,  414,  415,  417,  416,  409,  411,  418,  402,
			  410,  415,  419,  420,  436,  417,  439,  422,  423,  433,
			  418,  436,  413,  414,  458,  417,  459,  618,  420,  460,
			  433,  435,  461,  416,  419,  411,  422,  423,  410,  415,
			  433,  440,  440,  417,  462,  463,  440,  440,  418,  436,
			  413,  414,  458,  435,  459,  440,  420,  460,  433,  616,

			  461,  608,  419,  600,  422,  423,  424,  424,  424,  424,
			  424,  424,  462,  463,  424,  425,  425,  425,  425,  425,
			  425,  435,  583,  425,  426,  426,  426,  426,  426,  426,
			  425,  427,  427,  427,  427,  427,  427,  428,  428,  428,
			  428,  428,  428,  441,  441,  836,  425,  566,  441,  441,
			  437,  465,  562,  427,  437,  426,  716,  441,  425,  429,
			  429,  429,  429,  429,  429,  437,  466,  429,  430,  430,
			  430,  430,  430,  430,  836,  425,  430,  443,  560,  465,
			  443,  427,  437,  530,  426,  443,  443,  527,  763,  525,
			  443,  443,  518,  437,  466,  716,  445,  445,  506,  443,

			  443,  445,  445,  446,  468,  469,  446,  470,  471,  472,
			  445,  455,  455,  455,  455,  455,  455,  446,  473,  446,
			  446,  446,  446,  446,  446,  495,  446,  763,  494,  474,
			  443,  444,  468,  469,  444,  470,  471,  472,  475,  444,
			  444,  445,  477,  478,  444,  444,  473,  444,  444,  444,
			  444,  444,  444,  444,  444,  447,  446,  474,  447,  451,
			  442,  837,  448,  447,  447,  448,  475,  447,  447,  447,
			  477,  478,  434,  432,  448,  431,  448,  447,  448,  448,
			  448,  448,  448,  448,  444,  448,  449,  450,  450,  449,
			  837,  412,  450,  450,  479,  480,  481,  482,  449,  483,

			  449,  450,  449,  449,  449,  449,  449,  449,  447,  449,
			  484,  406,  489,  490,  492,  448,  476,  476,  476,  476,
			  476,  476,  479,  480,  481,  482,  491,  483,  493,  499,
			  499,  499,  499,  499,  499,  450,  567,  491,  484,  449,
			  489,  490,  492,  497,  714,  714,  497,  502,  502,  502,
			  502,  502,  502,  714,  491,  497,  493,  503,  503,  503,
			  503,  503,  503,  396,  567,  491,  497,  504,  504,  504,
			  504,  504,  504,  505,  505,  505,  505,  505,  505,  507,
			  507,  507,  507,  507,  507,  520,  502,  508,  508,  508,
			  508,  508,  508,  520,  384,  507,  497,  509,  509,  509, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  509,  509,  509,  510,  510,  510,  510,  510,  510,  511,
			  511,  511,  511,  511,  511,  522,  379,  375,  507,  361,
			  358,  520,  522,  507,  512,  512,  512,  512,  512,  512,
			  514,  514,  514,  514,  514,  514,  509,  515,  521,  515,
			  515,  515,  515,  515,  515,  516,  524,  516,  511,  526,
			  522,  523,  528,  521,  524,  531,  516,  529,  523,  532,
			  528,  533,  526,  531,  529,  340,  524,  335,  568,  533,
			  534,  534,  534,  534,  534,  534,  333,  538,  532,  316,
			  540,  521,  524,  312,  516,  538,  523,  539,  528,  304,
			  526,  531,  529,  537,  524,  539,  568,  533,  534,  540,

			  302,  283,  569,  535,  537,  535,  532,  535,  535,  535,
			  535,  535,  535,  538,  537,  535,  536,  536,  536,  536,
			  536,  536,  542,  539,  541,  546,  534,  540,  546,  535,
			  569,  547,  537,  542,  547,  535,  544,  544,  536,  570,
			  541,  544,  544,  542,  840,  549,  545,  545,  549,  269,
			  544,  545,  545,  553,  547,  266,  553,  535,  259,  869,
			  545,  542,  571,  535,  258,  553,  536,  570,  541,  252,
			  251,  548,  548,  840,  250,  249,  548,  548,  546,  548,
			  548,  548,  548,  548,  548,  548,  551,  551,  869,  247,
			  571,  551,  551,  572,  551,  551,  551,  551,  551,  551,

			  551,  549,  555,  555,  239,  235,  573,  555,  555,  234,
			  555,  555,  555,  555,  555,  555,  555,  557,  557,  233,
			  230,  572,  557,  557,  228,  557,  557,  557,  557,  557,
			  557,  557,  559,  559,  573,  575,  578,  559,  559,  580,
			  581,  574,  576,  585,  586,  564,  559,  564,  564,  564,
			  564,  564,  564,  574,  576,  584,  225,  584,  584,  584,
			  584,  584,  584,  575,  578,  587,  588,  580,  581,  574,
			  576,  585,  586,  589,  590,  591,  592,  593,  594,  595,
			  596,  574,  576,  597,  564,  598,  213,  191,  615,  559,
			  187,  184,  615,  587,  588,  601,  601,  601,  601,  601,

			  601,  589,  590,  591,  592,  593,  594,  595,  596,  599,
			  183,  597,  599,  598,  605,  605,  605,  605,  605,  605,
			  615,  599,  164,  599,  650,  599,  599,  599,  599,  599,
			  599,  603,  599,  603,  603,  603,  603,  603,  603,  604,
			  604,  604,  604,  604,  604,  606,  606,  606,  606,  606,
			  606,  160,  650,  605,  620,  604,  607,  607,  607,  607,
			  607,  607,  599,  609,  609,  609,  609,  609,  609,  620,
			  603,  610,  610,  610,  610,  610,  610,  611,  611,  611,
			  611,  611,  611,  604,  612,  612,  612,  612,  612,  614,
			  614,  614,  614,  614,  614,  617,  619,  620,  622,  617,

			  623,  625,  624,  626,  619,  614,  627,  632,  628,  625,
			  633,  622,  634,  635,  627,  628,  633,  623,  655,  634,
			  636,  623,  624,  626,  635,  657,  632,  617,  157,  659,
			  660,  636,  619,  614,  635,  154,  149,  625,  136,  622,
			  116,  636,  627,  628,  633,  623,  655,  634,  105,  104,
			  624,  626,  635,  657,  632,  637,  637,  659,  660,  636,
			  637,  637,  101,  637,  637,  637,  637,  637,  637,  637,
			  639,  642,  642,  639,  825,   99,  642,  642,  639,  639,
			   97,   93,  662,  639,  639,  642,  649,  649,  649,  649,
			  649,  649,  639,  639,  663,  645,   90,  665,  645,  825,

			  648,  648,  637,  645,  645,  648,  648,  645,  645,  645,
			  662,   89,   88,   73,  648,   70,  642,  645,   54,   38,
			   33,  666,  663,  639,  640,  665,   31,  640,  825,   26,
			  667,   24,  640,  640,   16,  668,  643,  640,  640,  643,
			  640,  640,  640,  640,  640,  640,  640,  640,  645,  666,
			  643,   15,  643,  643,  643,  643,  643,  643,  667,  643,
			  669,   14,  646,  668,  670,  646,  651,  651,  651,  651,
			  651,  651,   11,    0,  646,    0,  646,  640,  646,  646,
			  646,  646,  646,  646,  647,  646,  671,  647,  669,  643,
			  672,  673,  670,  674,  675,  677,  647,  678,  647,  679,

			  647,  647,  647,  647,  647,  647,  681,  647,  682,  682,
			  682,  682,  682,  682,  671,  646,  694,    0,  672,  673,
			    0,  674,  675,  677,    0,  678,    0,  679,  683,  683,
			  683,  683,  683,  683,  681,  694,  685,  647,  685,  688,
			    0,  685,  685,  685,  685,  685,  685,  686,  686,  686,
			  686,  686,  686,  687,  687,  687,  687,  687,  687,    0,
			  697,    0,  688,  694,    0,    0,  697,  688,  689,  689,
			  689,  689,  689,  689,  691,  691,  691,  691,  691,  691,
			  692,  692,  692,  692,  692,  692,  686,  693,  693,  693,
			  693,  693,  693,  695,  697,  699,  703,  705,  707,  706,

			  708,  718,  720,  693,  721,    0,  695,  706,  708,  707,
			  723,  703,  699,  725,  705,    0,  699,    0,  705,  711,
			  711,    0,  733,    0,  711,  711,  693,    0,    0,  718,
			  720,  693,  721,  711,  695,  706,  708,  707,  723,  703,
			  699,  725,  705,  713,  713,  713,  713,  713,  713,  717,
			  733,  717,  717,  717,  717,  717,  717,  719,  735,  719,
			  719,  719,  719,  719,  719,  737,  738,  739,  741,  740,
			  741,  741,  741,  741,  741,  741,  742,  742,  742,  742,
			  742,  742,  746,  746,  746,  746,  735,    0,  717,    0,
			    0,    0,    0,  737,  738,  739,  719,  740,  743,  743,

			  743,  743,  743,  743,    0,  751,    0,  741,  744,  744,
			  744,  744,  744,  744,  745,  768,  745,  751,  768,  745,
			  745,  745,  745,  745,  745,  747,  747,  747,  747,  747,
			  747,  748,  748,  748,  748,  749,  749,  749,  749,  749,
			  749,  750,  752,  754,  755,  751,  756,  750,  757,  754,
			  752,  749,  771,  756,  772,  759,  757,    0,    0,  759,
			  773,  755,  760,    0,  774,  755,  760,  775,  768,  776,
			  748,    0,    0,    0,  749,  750,  759,  754,  752,  749,
			  771,  756,  772,  760,  757,  761,  761,  759,  773,  755,
			  761,  761,  774,  777,  760,  775,  778,  776,  764,  761,

			  764,  764,  764,  764,  764,  764,  769,  769,  769,  769,
			  769,  769,  779,  781,  783,  783,  783,  783,  783,  783,
			    0,  777,    0,    0,  778,  784,  784,  784,  784,  784,
			  784,  785,  785,  785,  785,  785,  785,  764,    0,    0,
			  779,  781,  786,  786,  786,  786,  786,  786,  787,  787,
			  787,  787,  787,  787,  788,  788,  788,  788,  788,  788,
			  791,  792,  797,  809,  784,  790,  790,  790,  790,  790,
			  790,  791,  794,  798,  799,  810,  807,  798,  799,  807,
			  794,  790,  792,  797,  802,  802,  802,  802,  802,  802,
			    0,  809,    0,    0,  798,  799,    0,    0,    0,  791, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,  810,  790,  798,  799,    0,  794,  790,
			  792,  797,  800,  800,  811,  814,  815,  800,  800,  817,
			  800,  800,  800,  800,  800,  800,  800,    0,  808,  807,
			  808,  808,  808,  808,  808,  808,  819,  819,  819,  819,
			  819,  819,  811,  814,  815,    0,  824,  817,  821,  821,
			  821,  821,  821,  821,  824,  822,  826,  822,  827,  800,
			  822,  822,  822,  822,  822,  822,    0,  808,  823,  823,
			  823,  823,  823,  823,    0,  819,  826,  835,  838,  830,
			  830,  839,  824,  827,  830,  830,  842,  842,  842,  842,
			  842,  842,  843,  830,  822,  832,  853,  832,  832,  832,

			  832,  832,  832,  846,  826,  835,  838,  847,  848,  839,
			  858,  861,  827,  843,  870,  847,  848,  849,  849,    0,
			  846,    0,  849,  849,  853,  862,    0,    0,  847,  848,
			  872,  849,    0,  862,  832,  871,  861,  871,  858,    0,
			    0,  843,  870,  847,  848,    0,  871,  872,  846,  859,
			  859,  859,  859,  859,  859,  860,  860,  860,  860,  860,
			  860,  862,  863,  864,    0,  861,  880,  865,  865,  891,
			  863,  864,  865,  865,  871,  872,  883,  883,  883,  883,
			  883,  865,  885,  863,  864,    0,  876,  876,    0,    0,
			  885,  876,  876,    0,  880,    0,    0,  891,  863,  864,

			  876,  877,  877,  877,  877,  877,  877,  877,  882,  882,
			  882,  882,  882,  882,  886,  887,    0,    0,  885,  892,
			  892,  892,  892,  892,  892,  886,  887,  893,  893,  893,
			  893,  893,  893,    0,    0,  886,  887,  888,  895,  888,
			  888,  896,  888,  888,  888,  888,  888,  888,  888,  895,
			    0,    0,  896,  886,  887,    0,    0,    0,    0,  895,
			    0,    0,  896,  897,  897,  897,  897,  897,  897,  899,
			  899,  899,  899,  899,  899,  899,  905,  895,  905,  888,
			  896,  904,  904,  904,  904,  904,  904,  905,  908,  908,
			  908,  908,  908,  908,  909,  909,  909,  909,  909,  909,

			  911,    0,  911,  911,    0,  911,  911,  911,  911,  911,
			  911,  911,    0,    0,    0,  905,  918,  918,  918,  918,
			  918,  897,  920,  921,    0,  908,  916,  916,  916,  916,
			  916,  916,  917,  917,  917,  917,  917,  917,    0,  920,
			  921,    0,  911,  920,  921,  922,  922,  922,  922,  922,
			  922,  922,  923,  923,  923,  923,  923,  923,  923,  925,
			  925,  925,  925,  925,  925,    0,    0,  920,  921,  927,
			  927,  927,  927,  927,  927,  928,  928,  928,  928,  928,
			  928,  929,  929,  929,  929,  929,  929,  930,  931,  932,
			  932,  932,  932,  932,  932,  932,  936,  936,  936,  936,

			  936,  936,    0,    0,  930,  931,    0,    0,  930,  931,
			  933,    0,  933,    0,    0,  933,  933,  933,  933,  933,
			  933,  933,  937,  937,  937,  937,  932,    0,    0,    0,
			    0,    0,  930,  931,  934,    0,  934,  934,    0,  934,
			  934,  934,  934,  934,  934,    0,    0,    0,  935,    0,
			  935,  935,  933,  935,  935,  935,  935,  935,  935,    0,
			    0,  937,  941,  941,  941,  941,  941,  941,  942,  942,
			  942,  942,  942,  942,    0,    0,  934,  944,  944,  944,
			  944,  944,  944,  946,  946,  946,  946,  946,  946,    0,
			  935,  947,  947,  947,  947,  947,  947,  948,  948,  948,

			  948,  948,  948,  951,    0,  951,  951,    0,  951,  951,
			  951,  951,  951,  951,  952,  952,  952,  952,  952,  952,
			  953,  953,  953,  953,  953,  953,  942,  955,    0,  955,
			  955,    0,  955,  955,  955,  955,  955,  955,  956,  956,
			  956,  956,  956,  956,    0,  951,    0,  957,    0,  957,
			    0,  952,  957,  957,  957,  957,  957,  957,  958,  958,
			  958,  958,  958,  958,    0,    0,    0,    0,    0,  955,
			  959,  959,  959,  959,  959,  959,  960,  960,  960,  960,
			  960,  960,  961,    0,  961,    0,  957,  961,  961,  961,
			  961,  961,  961,  962,    0,  962,    0,    0,  962,  962,

			  962,  962,  962,  962,  963,  963,  963,  963,  963,  963,
			    0,    0,    0,  970,  984,  984,  984,  984,  984,  984,
			  984,  984,  984,    0,  961,  970,  970,  970,  970,  970,
			  970,  970,  970,  970,    0,  962,  965,  965,  965,  965,
			  965,  965,  965,  965,  965,  965,  965,  965,  965,  965,
			  965,  965,  965,  965,  965,  965,  965,  965,  965,  965,
			  965,  965,  965,  965,  965,  965,  966,  966,  966,  966,
			  966,  966,  966,  966,  966,  966,  966,  966,  966,  966,
			  966,  966,  966,  966,  966,  966,  966,  966,  966,  966,
			  966,  966,  966,  966,  966,  966,  967,  967,  967,  967,

			  967,  967,  967,  967,  967,  967,  967,  967,  967,  967,
			  967,  967,  967,  967,  967,  967,  967,  967,  967,  967,
			  967,  967,  967,  967,  967,  967,  968,  968,    0,  968,
			  968,  968,  968,  968,  968,  968,  968,  968,  968,  968,
			  968,  968,  968,  968,  968,    0,  968,  968,  968,  968,
			  968,  968,  968,  968,  968,  968,  969,  969,    0,  969,
			  969,  969,  969,  969,  969,  969,  969,  969,  969,  969,
			  969,  969,  969,  969,  969,  969,  969,  969,  969,  969,
			  969,  969,  969,  969,  969,  969,  971,  971,    0,  971,
			    0,  971,  971,  971,    0,    0,    0,  971,  971,  971,

			  971,  971,  971,  971,  971,  971,  972,  972,    0,  972,
			    0,  972,  972,    0,    0,    0,  972,  972,  972,    0,
			    0,    0,  972,  972,  972,  972,  972,  972,  972,  972,
			  972,  973,  973,    0,  973,  973,  973,  973,  973,  973,
			  973,  973,  973,  973,  973,  973,  973,  973,  973,  973,
			  973,  973,  973,  973,  973,  973,  973,  973,  973,  973,
			  973,  974,  974,    0,  974,  974,  974,  974,  974,  974,
			  974,  974,  974,  974,  974,  974,  974,  974,  974,  974,
			    0,  974,  974,  974,  974,  974,  974,  974,  974,  974,
			  974,  975,  975,  975,  975,  975,  975,  975,  975,  975,

			  975,  975,  975,  975,  975,  975,  975,  975,  975,  975,
			  975,  975,  975,  975,  975,  975,  975,  975,  975,  975,
			  975,  976,  976,  976,  976,  976,  976,  976,  976,  976,
			  976,  976,  976,  976,  976,  976,  976,  976,  976,  976,
			  976,  976,  976,  976,  976,  976,  976,  976,  976,  976,
			  976,  977,    0,  977,    0,    0,    0,    0,  977,    0,
			  977,  977,    0,    0,    0,  977,  977,  977,    0,    0,
			    0,  977,  977,  977,  977,  977,  977,  977,  977,  977,
			  978,  978,    0,  978,  978,  978,  978,  978,  978,  978,
			  978,  978,  978,  978,  978,  978,  978,  978,  978,  978, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  978,  978,  978,  978,  978,  978,  978,  978,  978,  978,
			  979,  979,  979,  979,  979,  979,  979,  979,  979,  979,
			  979,  979,  979,  979,  979,  979,  979,  979,  979,  979,
			  979,  979,  979,  979,  979,  979,  979,  979,  979,  979,
			  980,  980,  980,    0,    0,    0,  980,  980,  980,  980,
			    0,    0,  980,  980,  980,  980,  980,  980,  980,  980,
			  980,  981,    0,    0,  981,  981,    0,  981,  981,  981,
			  981,  981,    0,    0,    0,  981,  981,  981,  981,  981,
			  981,  981,  981,  981,  982,  982,    0,  982,    0,  982,
			  982,  982,    0,    0,  982,  982,  982,    0,    0,    0,

			  982,  982,  982,  982,  982,  982,  982,  982,  982,  983,
			  983,    0,  983,    0,  983,  983,  983,    0,    0,  983,
			  983,  983,    0,    0,    0,  983,  983,  983,  983,  983,
			  983,  983,  983,  983,  985,  985,  985,  985,  985,  985,
			  985,  985,  985,    0,  985,  985,  985,  985,  985,  985,
			  985,  985,  985,  985,  985,  985,  985,  985,  985,  985,
			  985,  985,  985,  985,  986,  986,  986,  986,  986,  986,
			  986,  986,  986,  986,  986,  986,  986,  986,  986,  986,
			  986,  986,  986,  986,  986,  986,  986,  986,  986,  986,
			  986,  986,  986,  986,  987,  987,  987,  987,  987,  987,

			  987,  987,  987,  987,  987,  987,  987,  987,  987,  987,
			  987,  987,  987,  987,  987,  987,  987,  987,  987,  987,
			  987,  987,  987,  987,  988,  988,  988,    0,    0,    0,
			  988,  988,  988,  988,    0,    0,  988,  988,  988,  988,
			  988,  988,  988,  988,  988,  989,  989,  989,  989,  989,
			  989,  989,  989,  989,  989,  989,  989,  989,  989,  989,
			  989,  989,  989,  989,  989,  989,  989,  989,  989,  989,
			  989,  989,  989,  989,  989,  990,  990,    0,  990,    0,
			  990,  990,  990,    0,    0,  990,  990,  990,    0,    0,
			    0,  990,  990,  990,  990,  990,  990,  990,  990,  990,

			  991,  991,    0,  991,    0,  991,  991,  991,    0,    0,
			  991,  991,  991,    0,    0,    0,  991,  991,  991,  991,
			  991,  991,  991,  991,  991,  992,  992,  992,    0,    0,
			  992,  992,  992,  992,  992,  992,  992,  992,    0,    0,
			  992,  992,  992,    0,    0,    0,  992,  992,  992,  992,
			  992,  992,  992,  992,  992,  993,    0,  993,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  993,
			  993,  993,    0,    0,  993,  993,  993,  993,  993,  993,
			  993,  993,  993,  993,  994,    0,  994,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  994,  994,

			  994,    0,    0,    0,  994,  994,  994,  994,  994,  994,
			  994,  994,  994,  995,  995,    0,  995,    0,  995,  995,
			  995,    0,    0,  995,  995,  995,    0,    0,    0,  995,
			  995,  995,  995,  995,  995,  995,  995,  995,  996,  996,
			    0,    0,    0,  996,  996,  996,    0,    0,    0,  996,
			  996,  996,  996,  996,  996,  996,  996,  996,  997,  997,
			    0,    0,    0,  997,  997,  997,    0,    0,    0,  997,
			  997,  997,  997,  997,  997,  997,  997,  997,  998,  998,
			    0,  998,    0,  998,  998,  998,    0,    0,  998,  998,
			  998,    0,    0,    0,  998,  998,  998,  998,  998,  998,

			  998,  998,  998,  999,  999,    0,    0,    0,  999,  999,
			  999,    0,    0,    0,  999,  999,  999,  999,  999,  999,
			  999,  999,  999, 1000, 1000,    0,    0,    0, 1000, 1000,
			 1000,    0,    0,    0, 1000, 1000, 1000, 1000, 1000, 1000,
			 1000, 1000, 1000, 1001, 1001,    0,    0,    0, 1001, 1001,
			 1001,    0,    0,    0, 1001, 1001, 1001, 1001, 1001, 1001,
			 1001, 1001, 1001, 1002, 1002,    0, 1002,    0, 1002, 1002,
			 1002,    0,    0, 1002, 1002, 1002,    0,    0,    0, 1002,
			 1002, 1002, 1002, 1002, 1002, 1002, 1002, 1002, 1003, 1003,
			 1003,    0,    0,    0, 1003, 1003, 1003, 1003, 1003, 1003,

			 1003, 1003, 1003, 1004, 1004,    0, 1004,    0, 1004, 1004,
			 1004,    0,    0, 1004, 1004, 1004,    0,    0,    0, 1004,
			 1004, 1004, 1004, 1004, 1004, 1004, 1004, 1004, 1005, 1005,
			 1005,    0,    0,    0, 1005, 1005, 1005, 1005, 1005, 1005,
			 1005, 1005, 1005, 1006, 1006, 1006,    0,    0,    0, 1006,
			 1006, 1006, 1006, 1006, 1006, 1006, 1006, 1006, 1007, 1007,
			    0,    0,    0, 1007, 1007, 1007,    0,    0,    0, 1007,
			 1007, 1007, 1007, 1007, 1007, 1007, 1007, 1007, 1008, 1008,
			    0,    0,    0, 1008, 1008, 1008,    0,    0,    0, 1008,
			 1008, 1008, 1008, 1008, 1008, 1008, 1008, 1008, 1009, 1009,

			    0,    0,    0, 1009, 1009, 1009,    0,    0,    0, 1009,
			 1009, 1009, 1009, 1009, 1009, 1009, 1009, 1009, 1010, 1010,
			    0, 1010,    0, 1010, 1010, 1010,    0,    0, 1010, 1010,
			 1010,    0,    0,    0, 1010, 1010, 1010, 1010, 1010, 1010,
			 1010, 1010, 1010, 1011, 1011, 1011,    0,    0,    0, 1011,
			 1011, 1011, 1011, 1011, 1011, 1011, 1011, 1011, 1012, 1012,
			 1012,    0,    0,    0, 1012, 1012, 1012, 1012, 1012, 1012,
			 1012, 1012, 1012, 1013, 1013,    0,    0,    0, 1013, 1013,
			 1013,    0,    0,    0, 1013, 1013, 1013, 1013, 1013, 1013,
			 1013, 1013, 1013, 1014, 1014,    0,    0,    0, 1014, 1014,

			 1014,    0,    0,    0, 1014, 1014, 1014, 1014, 1014, 1014,
			 1014, 1014, 1014, 1015, 1015,    0,    0,    0, 1015, 1015,
			 1015,    0,    0,    0, 1015, 1015, 1015, 1015, 1015, 1015,
			 1015, 1015, 1015, 1016, 1016,    0,    0,    0, 1016, 1016,
			 1016,    0,    0,    0, 1016, 1016, 1016, 1016, 1016, 1016,
			 1016, 1016, 1016,  964,  964,  964,  964,  964,  964,  964,
			  964,  964,  964,  964,  964,  964,  964,  964,  964,  964,
			  964,  964,  964,  964,  964,  964,  964,  964,  964,  964,
			  964,  964,  964,  964,  964,  964,  964,  964,  964,  964,
			  964,  964,  964,  964,  964,  964,  964,  964,  964,  964,

			  964,  964,  964,  964,  964,  964,  964,  964,  964,  964,
			  964,  964,  964,  964,  964,  964,  964,  964,  964,  964,
			  964,  964,  964,  964,  964,  964,  964,  964,  964,  964,
			  964,  964,  964,  964,  964,  964,  964,  964,  964,  964,
			  964,  964,  964,  964,  964,  964, yy_Dummy>>,
			1, 946, 4000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1016)
			yy_base_template_1 (an_array)
			yy_base_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_base_template_1 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,   90,   95,   77,   79,   98,  102,  187,
			    0, 2572, 4853,  104, 2558, 2524, 2527, 4853,   86, 4853,
			 4853, 4853, 4853, 4853, 2516,  100, 2512,  266,  276, 4853,
			 4853, 2499, 4853, 2493, 4853,  100,  102,   85, 2493,  265,
			  276,   73,  267,   99,  275,  277,  334,  274,  101,  279,
			   86,  405, 4853, 4853, 2462,  471,  324,  331,  550,   95,
			  334,  111,  390,  280,  270,  330,  332,  327,  272,  327,
			 2498, 4853, 4853, 2506,  149, 4853,  107,  323,  319,  381,
			  392,  411,  326, 4853,  394,  400, 4853,  326, 2509, 2496,
			 2421, 4853,  153, 2478,  427,  432,  481, 2477, 4853, 2468,

			 4853, 2453,    0,  622, 2446, 2432,  615, 4853,  402,  543,
			  632,  664,  638,  682, 4853, 4853, 2414,    0,  409,  642,
			  414,  387,  454,  620,  530,  680,  653,  532,  147,  622,
			  681,  120,  531,  663,  682,  606, 2355,  682,  700,  702,
			  764,  728,  762,  690,  718,  727,  730,  685,  474, 2412,
			  797,  804,  826,  833, 2379, 4853,  766, 2417,    0,  880,
			 2334,  273,  394,  614, 2256,    0,  723,  733,  744,  743,
			  761,  754,  761,  772,  776,  779,  801,  780,  820,  795,
			  790,  808,  810, 2286, 2267,  813,  828, 2233,  850,  822,
			  834, 2230,  827,  830,  831,  834,  850,  852,  857,  857,

			  857,  844,  861,  848,  859,  864,  895,  865,  855,  862,
			  394,  771, 4853, 2279, 4853,  669, 4853, 4853,  901,  909,
			  914,  923,  927,  720, 4853, 2202,  914,  915, 2169,  919,
			 2166, 4853,  961, 2144, 2206, 2202,  957,  163, 1001, 2201,
			 1002,  322, 1057,  909, 4853, 4853, 4853, 2180,  964, 2166,
			 2165, 2161, 2160, 1016, 4853, 1132, 1010, 1016, 2147, 2092,
			 1022, 1138, 1155, 1165, 1028, 1183, 2127, 1137, 1138, 2123,
			 1156,  991, 1164, 1181, 1170, 1165, 1166,  412, 1184, 1188,
			 1190, 1192, 1191, 2075, 1171, 1194, 4853,  413, 1241, 1250,
			 1259, 1271, 1270, 1278, 1228,  133, 1257,  257, 1274, 1270,

			 1275,  710, 2074,  971, 2065, 1317, 1339, 1354, 1369, 1384,
			 4853,  706, 2066, 1131, 1179,    0, 2018, 1191, 1233,    0,
			 1267, 1269, 1279, 1269, 1284, 1273, 1289, 1286, 1322, 1347,
			 1343, 1337, 1340, 2019, 1351, 2010, 1384, 1359, 1363, 1365,
			 2049, 1399, 1365, 1366, 1375, 1380,    0,    0, 1375, 1393,
			 1380, 1395, 1395, 1403, 1397, 1405, 1397, 1397, 1963, 1399,
			 1400, 1962,    0,    0, 1185, 1254, 1399,  915, 1409, 1155,
			 1439, 1442, 1446, 1312, 4853, 1962, 4853, 1458, 1485, 2013,
			 1475, 4853, 1230, 1445, 1991, 4853, 4853, 1497, 4853, 4853,
			 4853, 4853, 1477, 1523, 1529, 1535, 1902, 1541, 1547, 1569,

			 1553, 1575, 1592, 1601, 1607, 1613, 1883, 1436, 1559, 1573,
			 1612, 1613, 1865, 1614, 1616, 1617, 1615, 1615, 1622, 1626,
			 1627, 1456, 1631, 1632, 1688, 1697, 1706, 1713, 1719, 1741,
			 1750, 1849, 1847, 1630, 1846, 1645, 1628, 1724,  356, 1601,
			 1671, 1733, 1836, 1775, 1829, 1786, 1801, 1853, 1860, 1884,
			 1877, 1793,    0, 1532, 1410, 1793, 1534, 1419, 1619, 1621,
			 1631, 1638, 1646, 1651,    0, 1703, 1719,    0, 1756, 1758,
			 1773, 1778, 1775, 1780, 1781, 1797, 1898, 1804, 1795, 1857,
			 1858, 1851, 1852, 1854, 1865,    0,    0,    0,    0, 1864,
			 1880, 1896, 1866, 1895, 1813, 1810, 4853, 1941,  910, 1911,

			 1456, 4853, 1929, 1939, 1949, 1955, 1784, 1961, 1969, 1979,
			 1985, 1991, 2006,  425, 2012, 2021, 2032,  948, 1766, 1273,
			 1959, 2012, 1989, 2025, 2020, 1763, 2023, 1763, 2026, 2031,
			 1757, 2029, 2033, 2035, 2052, 2089, 2098, 2064, 2051, 2061,
			 2054, 2098, 2093, 4853, 2126, 2136, 2123, 2129, 2161, 2143,
			 4853, 2176, 4853, 2151, 1474, 2192, 4853, 2207, 4853, 2222,
			 1717,    0, 1695,  956, 2229,    0, 1690, 1902, 2034, 2061,
			 2106, 2121, 2160, 2173, 2207, 2202, 2208,    0, 2197,    0,
			 2205, 2207,    0, 1706, 2239, 2209, 2211, 2231, 2232, 2228,
			 2240, 2230, 2242, 2243, 2244, 2234, 2238, 2249, 2251, 2307,

			 1646, 2277, 1482, 2315, 2321, 2296, 2327, 2338, 1644, 2345,
			 2353, 2359, 2366, 4853, 2371, 2262, 1673, 2369, 1641, 2370,
			 2328, 1576, 2372, 2371, 2376, 2375, 2377, 2380, 2382, 4853,
			 1577, 1574, 2381, 2384, 2386, 2384, 2391, 2445,    0, 2468,
			 2522, 1508, 2461, 2534,    0, 2493, 2560, 2582, 2490, 2468,
			 2294, 2548, 1563,    0,    0, 2388,    0, 2395,    0, 2395,
			 2389,    0, 2448, 2453,    0, 2458, 2475, 2496, 2489, 2526,
			 2518, 2540, 2556, 2558, 2559, 2561,    0, 2550, 2565, 2566,
			    0, 2561, 2590, 2610, 1521, 2623, 2629, 2635, 2605, 2650,
			 1520, 2656, 2662, 2669, 2590, 2667, 1486, 2634, 1476, 2666,

			 1449, 1428, 1341, 2670, 1330, 2668, 2673, 2672, 2674, 1316,
			 1251, 2709, 1235, 2725, 1929, 1224, 1740, 2733, 2656, 2741,
			 2663, 2665,    0, 2678,    0, 2681,    0,    0,    0,    0,
			    0,    0,    0, 2681,    0, 2717,    0, 2731, 2729, 2733,
			 2735, 2752, 2758, 2780, 2790, 2801, 2764, 2807, 2818, 2817,
			 2815, 2779, 2816, 4853, 2817, 2815, 2820, 2822, 1220, 2826,
			 2833, 2875,    0, 1772, 2882,    0,    0, 1220, 2813, 2888,
			 1214, 2820, 2816, 2822, 2830, 2833, 2837, 2861, 2863, 2878,
			    0, 2880, 1112, 2896, 2907, 2913, 2924, 2930, 2936, 4853,
			 2947, 2934, 2935, 1141, 2946, 4853,  962, 2936, 2944, 2945,

			 3002,  956, 2966, 4853,  861, 1297,    0, 2974, 3012, 2926,
			 2928, 2967,    0,    0, 2981, 2982,    0, 2972,    0, 3018,
			  812, 3030, 3042, 3050, 3020, 2448, 3030, 3032, 1531, 4853,
			 3069,    0, 3079,    0,    0, 3043, 1694, 1810, 3032, 3035,
			 2093, 1035, 3068, 3066,  790,  765, 3077, 3078, 3079, 3107,
			    0,    0,  742, 3049,    0,    0,    0,    0, 3067, 3131,
			 3137, 3085, 3099, 3133, 3134, 3157,  502,  732,  718, 2108,
			 3080, 3122, 3104,  706,  701,  551, 3176, 3183,    0,    0,
			 3123,    0, 3190, 3158, 4853, 3156, 3185, 3186, 3224,    0,
			    0, 3135, 3201, 3209,  533, 3209, 3212, 3245, 1298, 3251,

			 4853,  648,  654,    0, 3263, 3263,  529,  453, 3270, 3276,
			  938, 3287,    0,  393,    0,  388, 3308, 3314, 3298, 4853,
			 3293, 3294, 3327, 3334, 1476, 3341, 1507, 3351, 3357, 3363,
			 3358, 3359, 3371, 3397, 3421, 3435, 3378, 3409, 4853, 4853,
			  256, 3444, 3450,  252, 3459, 4853, 3465, 3473, 3479, 4853,
			  256, 3490, 3496, 3502,  112, 3514, 3520, 3534, 3540, 3552,
			 3558, 3569, 3580, 3586, 4853, 3635, 3665, 3695, 3725, 3755,
			 3603, 3775, 3800, 3830, 3860, 3890, 3920, 3949, 3979, 4009,
			 4030, 4053, 4078, 4103, 3592, 4133, 4163, 4193, 4214, 4244,
			 4269, 4294, 4324, 4353, 4382, 4407, 4427, 4447, 4472, 4492, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			 4512, 4532, 4557, 4572, 4597, 4612, 4627, 4647, 4667, 4687,
			 4712, 4727, 4742, 4762, 4782, 4802, 4822, yy_Dummy>>,
			1, 17, 1000)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1016)
			yy_def_template_1 (an_array)
			yy_def_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,  964,    1,  965,  965,  966,  966,  967,  967,  964,
			    9,  964,  964,  964,  964,  964,  968,  964,  969,  964,
			  964,  964,  964,  964,  964,  964,  970,  964,  964,  964,
			  964,  964,  964,  964,  964,  971,  971,  971,  971,  971,
			  971,  971,  971,  971,  971,  971,  971,  971,  971,  971,
			  971,  972,  964,  964,  973,  964,   55,   55,  964,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			  964,  964,  964,  974,  964,  964,  964,  974,  974,  974,
			  974,  974,  975,  964,  976,  975,  964,  964,  964,  964,
			  964,  964,  977,  964,  977,  977,  964,  964,  964,  968,

			  964,  978,  978,  978,  979,  964,  964,  964,  980,  964,
			  964,  964,  964,  964,  964,  964,  971,  981,  971,  971,
			  971,  971,  971,  971,  971,  971,  971,  971,  971,  971,
			  971,  971,  971,  971,  971,  971,  964,   46,  971,  971,
			  971,  971,  971,  971,  971,  971,  971,  971,  971,  982,
			  983,  983,  983,  983,  973,  964,  964,  964,  984,   58,
			  964,  159,  159,  159,  964,   58,   58,   58,   58,  159,
			   58,  159,  159,   58,   58,  159,  159,   58,   58,  159,
			  159,   58,   58,  159,   58,  159,  159,  159,   58,   58,
			   58,   58,  159,   58,  159,   58,  159,  159,   58,   58,

			  159,  159,   58,   58,  159,  159,   58,   58,  159,   58,
			  159,   58,  964,  974,  964,  964,  964,  964,  974,  974,
			  974,  974,  974,  975,  964,  985,  975,  976,  986,  976,
			  985,  964,  964,  964,  964,  987,  964,  977,  977,  964,
			  964,  964,  964,  964,  964,  964,  964,  964,  964,  964,
			  964,  964,  964,  964,  964,  964,  964,  964,  970,  964,
			  964,  964,  964,  964,  964,  964,  981,  971,  971,  971,
			  971,  971,  971,  971,  971,  971,  971,  971,  964,  971,
			  971,  971,  971,  971,  971,  971,  964,  971,  971,  971,
			  971,  140,  140,  971,  971,  971,  971,  971,  971,  971,

			  971,  971,  971,  971,  964,  983,  983,  983,  983,  983,
			  964,  988,  964,  159,  159,  159,  964,   58,   58,   58,
			  159,   58,  159,  159,   58,   58,  159,  159,  159,   58,
			   58,   58,  159,  159,   58,   58,  964,  159,  159,  159,
			  159,  159,   58,   58,  159,   58,  159,   58,  159,  159,
			   58,   58,  159,  159,   58,   58,  159,  159,  159,   58,
			   58,   58,  159,   58,  159,   58,  974,  974,  974,  974,
			  974,  974,  974,  985,  964,  986,  964,  964,  964,  989,
			  989,  964,  989,  989,  989,  964,  964,  964,  964,  964,
			  964,  964,  964,  964,  964,  964,  964,  964,  964,  964,

			  964,  964,  964,  964,  964,  964,  981,  971,  971,  971,
			  971,  971,  971,  971,  971,  971,  971,  964,  971,  971,
			  971,  971,  971,  971,  971,  971,  425,  425,  964,  971,
			  971,  971,  971,  964,  971,  971,  971,  971,  971,  964,
			  990,  991,  964,  983,  983,  983,  444,  983,  444,  444,
			  983,  964,  992,  159,  159,  964,   58,   58,  159,   58,
			  159,  159,   58,   58,  159,  159,  159,   58,   58,   58,
			  159,  159,   58,  159,  159,  159,  964,   58,   58,  159,
			   58,  159,  159,   58,   58,  159,  159,   58,   58,  159,
			  159,  159,   58,   58,  159,   58,  964,  964,  964,  964,

			  964,  964,  964,  964,  964,  964,  964,  964,  964,  964,
			  964,  964,  964,  964,  964,  964,  964,  964,  971,  971,
			  971,  971,  971,  971,  971,  971,  971,  964,  971,  971,
			  971,  971,  971,  971,  964,  971,  535,  964,  971,  971,
			  971,  971,  964,  964,  990,  991,  993,  964,  991,  964,
			  964,  991,  964,  964,  994,  991,  964,  991,  964,  983,
			  964,  159,  159,  964,  964,   58,   58,  159,   58,  159,
			  159,   58,   58,  159,  159,   58,   58,  159,  159,   58,
			  159,  159,  159,  964,  964,   58,   58,  159,   58,  159,
			  159,   58,   58,  159,  159,  159,  159,   58,   58,  964,

			  964,  964,  964,  964,  964,  964,  964,  964,  964,  964,
			  964,  964,  964,  964,  964,  971,  971,  971,  971,  971,
			  971,  971,  971,  964,  971,  971,  971,  971,  971,  964,
			  964,  971,  971,  971,  971,  964,  964,  995,  996,  991,
			  991,  964,  991,  640,  997,  991,  640,  640,  983,  964,
			  159,  964,  964,  159,   58,  159,  159,   58,   58,  159,
			  159,  159,   58,   58,   58,  159,  159,  159,   58,   58,
			  159,   58,  159,  159,   58,   58,  159,  159,  159,  159,
			   58,   58,  964,  964,  964,  964,  964,  964,  964,  964,
			  964,  964,  964,  964,  971,  971,  971,  971,  971,  964,

			  971,  971,  971,  971,  971,  964,  971,  971,  971,  964,
			  964,  998,  996,  964,  997,  964,  964,  964,  159,  964,
			  159,   58,  159,  159,   58,   58,  159,  159,  159,   58,
			   58,  159,   58,  159,  159,   58,   58,  159,  159,  159,
			   58,  964,  964,  964,  964,  964,  964,  964,  964,  964,
			  971,  971,  971,  964,  971,  964,  971,  971,  971,  964,
			  964,  998,  999,  964,  964, 1000, 1001,  964,  993,  964,
			  964,  159,  159,   58,  159,   58,  159,   58,  159,  159,
			  159,   58,  964,  964,  964,  964,  964,  964,  964,  964,
			  964,  971,  971,  971,  971,  964,  971,  971,  964,  964,

			 1002,  999,  964,  964, 1000, 1001, 1003,  964,  964,  159,
			  159,   58,  159,   58,  159,   58,  159,  159,   58,  964,
			  964,  964,  964,  964,  971,  971,  971,  971,  964,  964,
			 1004, 1005,  964, 1006, 1007,  159,  159,   58,  159,   58,
			  159,  964,  964,  971,  971,  971,  971,  964,  964, 1004,
			 1008, 1009, 1007,  159,  159,   58,  159,   58,  159,  964,
			  964,  971,  971,  964,  964, 1010,  982, 1008, 1009,  159,
			  159,  964,  971,  971,  964,  964, 1010,  982, 1011, 1012,
			  159,  159,  964,  964,  964,  971,  964,  964,  982, 1013,
			 1014,  159,  964,  964,  971,  964,  964,  964,  982,  982,

			  964, 1013, 1014,  159,  964,  964,  964,  964,  964,  964,
			  982,  982, 1015,  964, 1016,  964,  964,  964,  964,  964,
			  964,  964,  982,  982, 1015,  964, 1016,  964,  964,  964,
			  964,  964,  982,  982,  964,  964,  964,  964,  964,  964,
			  964,  964,  964,  964,  964,  964,  964,  964,  964,  964,
			  964,  964,  964,  964,  964,  964,  964,  964,  964,  964,
			  964,  964,  964,  964,    0,  964,  964,  964,  964,  964,
			  964,  964,  964,  964,  964,  964,  964,  964,  964,  964,
			  964,  964,  964,  964,  964,  964,  964,  964,  964,  964,
			  964,  964,  964,  964,  964,  964,  964,  964,  964,  964, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  964,  964,  964,  964,  964,  964,  964,  964,  964,  964,
			  964,  964,  964,  964,  964,  964,  964, yy_Dummy>>,
			1, 17, 1000)
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
			   16,   16,   16,   16,   16,   17,   16,   16,   16,   16,
			   16,   16,   16,   16,   16,   16,   16,   16,   16,   16,
			   16,   16,   18,   19,   20,   21,    5,   11,   22,   22,
			   22,   22,   22,   22,   22,   22,   22,   22,   22,   22,
			   22,   22,   22,   23,   24,   25,   26,   27,   28,   29,
			   30,    5,    5,    5,    5,    1,    1,    1,    1,    1,
			    1,    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		once
			Result := yy_fixed_array (<<
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
			  103,  106,    0,  104,  104,   38,    0,  104,  104,   38,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,    0,  104,  104,  104,
			   64,   64,  104,  104,  104,  104,   41,   41,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,   40,   40,  104,  104,  125,  125,  125,  125,
			  125,  125,  125,    0,  109,  110,   72,    0,    0,    0,
			    0,   80,   78,   77,   81,  133,  136,  136,  134,  130,
			  131,  132,  119,    0,  119,    0,    0,    0,  115,    0,

			    0,    0,  118,  113,    0,    0,  102,  101,  101,  101,
			  101,  101,   37,  101,  101,  101,  101,    0,  101,  101,
			  101,  101,  101,  101,   92,  101,  101,  101,    0,   92,
			   92,   92,   36,    0,   43,  101,  101,  101,  101,   76,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,   61,  104,  104,    0,  104,  104,  104,  104,
			  104,  104,  104,  104,   37,  104,  104,   37,  104,  104,
			  104,  104,  104,  104,  104,  104,    0,  104,  104,  104,
			  104,  104,  104,  104,  104,   36,   43,   36,   43,  104,
			  104,  104,  104,  104,  104,  104,  110,    0,   70,    0,

			   69,   73,  119,    0,    0,    0,  114,  115,    0,  116,
			    0,  118,    0,    0,    0,  113,   89,    0,   58,  101,
			  101,  101,  101,  101,  101,   44,  101,    0,  101,  101,
			   35,  101,  101,  101,    0,  101,  101,    0,  101,  101,
			  101,  101,    0,   75,    0,    0,   76,    0,    0,    0,
			   65,    0,   66,    0,    0,    0,   63,    0,   62,    0,
			    0,   58,  104,    0,    0,   58,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,   44,  104,   44,
			  104,  104,   35,   64,   64,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,    0,

			  119,    0,    0,    0,  115,  116,    0,    0,  118,    0,
			    0,    0,    0,   89,    0,  101,   59,  101,   60,  101,
			  101,   46,  101,    0,  101,  101,  101,  101,  101,   92,
			    0,   52,  101,  101,  101,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			  104,    0,    0,   59,   59,  104,   60,  104,   60,  104,
			  104,   46,  104,  104,   46,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,   52,  104,  104,  104,
			   52,  104,    0,    0,  105,    0,  116,    0,  119,    0,
			   91,    0,    0,  117,  101,  101,   57,  101,   45,    0,

			   42,   56,   34,  101,   50,    0,  101,  101,  101,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  104,    0,
			  104,  104,   57,  104,   57,  104,   45,   42,   56,   42,
			   56,   34,   34,  104,   50,  104,   50,  104,  104,  104,
			  104,    0,    0,  116,    0,    0,    0,    0,   88,  117,
			  101,  101,  101,   96,  101,    0,  101,  101,   53,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,   68,    0,
			  106,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			   53,  104,  118,    0,  118,    0,    0,    0,    0,   88,
			  117,  101,  101,   47,  101,   95,   51,  101,    0,    0,

			    0,    0,    0,   67,    0,    0,    0,   68,    0,  104,
			  104,  104,   47,   47,  104,  104,   51,  104,   51,  118,
			   90,    0,   88,  117,  101,  101,  101,  101,   94,   94,
			    0,    0,    0,    0,    0,  104,  104,  104,  104,  104,
			  104,    0,    0,  101,   49,   48,  101,    0,    0,    0,
			    0,    0,    0,  104,   49,   49,   48,   48,  104,    0,
			    0,  101,  101,    0,    0,    0,    0,    0,    0,  104,
			  104,   87,  101,   54,    0,    0,    0,    0,    0,    0,
			  104,   54,    0,    0,   87,  101,    0,    0,    0,    0,
			    0,  104,    0,    0,   55,    0,    0,    0,    0,    0,

			   84,    0,    0,   55,    0,   86,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   86,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,   85,   97,   98,
			    0,    0,    0,    0,    0,   83,    0,    0,    0,   85,
			    0,    0,    0,    0,    0,    0,    0,   85,    0,    0,
			    0,    0,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 4853
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 964
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 965
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
