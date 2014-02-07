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
if yy_act <= 103 then
if yy_act <= 86 then
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
--|#line 337 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 337")
end

		set_start_condition (IN_EXTERNAL_VALUE_SET_DEF)
		create last_term_constraint_parse_structure_value.make
		str_ := text_substring (2, text_count)
		last_term_constraint_parse_structure_value.set_terminology_id (str_.substring (1, str_.index_of (':', 1)-1))
		is_assumed_code := False
	
else
--|#line 346 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 346")
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
if yy_act = 77 then
--|#line 361 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 361")
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
--|#line 376 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 376")
end
in_lineno := in_lineno + text_count
end
end
end
else
if yy_act <= 82 then
if yy_act <= 80 then
if yy_act = 79 then
--|#line 379 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 379")
end
in_lineno := in_lineno + 1
else
--|#line 381 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 381")
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
if yy_act = 81 then
--|#line 404 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 404")
end
	-- Catch-all rules (no backing up)
			last_token := ERR_VALUE_SET_DEF
			set_start_condition (INITIAL)
	
else
--|#line 416 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 416")
end

		last_token := V_SLOT_FILLER
		last_string_value := text_substring (2, text_count - 1)
		last_string_value.prune_all(' ')
		last_string_value.prune_all('%T')
	
end
end
else
if yy_act <= 84 then
if yy_act = 83 then
--|#line 424 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 424")
end

		last_token := V_EXT_REF
		last_string_value := text_substring (2, text_count - 1)
		last_string_value.prune_all(' ')
		last_string_value.prune_all('%T')
	
else
--|#line 433 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 433")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
if yy_act = 85 then
--|#line 434 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 434")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 435 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 435")
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
--|#line 442 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 442")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 443 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 443")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
else
--|#line 450 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 450")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
else
if yy_act = 90 then
--|#line 451 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 451")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
--|#line 458 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 458")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
end
else
if yy_act <= 93 then
if yy_act = 92 then
--|#line 459 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 459")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 471 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 471")
end

				last_token := V_ISO8601_DATE_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
if yy_act = 94 then
--|#line 481 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 481")
end

				last_token := V_ISO8601_TIME_CONSTRAINT_PATTERN
				last_string_value := text_substring(2, text_count)
			
else
--|#line 486 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 486")
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
--|#line 496 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 496")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
				last_string_value.put('T', last_string_value.index_of(' ', 1))
			
else
--|#line 502 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 502")
end

				last_token := V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
				last_string_value := text
			
end
else
if yy_act = 98 then
--|#line 513 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 513")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN_ERR
				unread_character(last_string_value.item(last_string_value.count)) -- put back the last character 
				last_string_value := text
			
else
--|#line 522 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 522")
end

				last_token := V_ISO8601_DURATION_CONSTRAINT_PATTERN
				last_string_value := text
			
end
end
else
if yy_act <= 101 then
if yy_act = 100 then
--|#line 528 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 528")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 534 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 534")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
end
else
if yy_act = 102 then
--|#line 540 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 540")
end

					last_token := V_FEATURE_CALL_IDENTIFIER
					last_string_value := text_substring(1, text_count - 2)
					last_string_value.right_adjust
			
else
--|#line 547 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 547")
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
--|#line 553 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 553")
end
		-- matches an absolute path string with segments of form "/attr_name" or "/attr_name[id-code]"
			last_token := V_ABS_PATH
			last_string_value := text
		
else
--|#line 559 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 559")
end
		-- matches a relative path string with segments of form "/attr_name" or "/attr_name[id-code]"
			last_token := V_REL_PATH
			last_string_value := text
		
end
else
--|#line 565 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 565")
end

			last_token := SYM_START_CBLOCK
			set_start_condition (IN_REGEXP1)
			in_buffer.append_character ('/')
		
end
else
if yy_act = 107 then
--|#line 572 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 572")
end
 		-- match segment consisting of non / or [
				in_buffer.append_string (text)
	
else
--|#line 576 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 576")
end
 		-- match [] segment
				in_buffer.append_string (text)
	
end
end
else
if yy_act <= 110 then
if yy_act = 109 then
--|#line 580 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 580")
end
 		-- match segment ending in quoted slashes '\/'
				in_buffer.append_string (text)
	
else
--|#line 584 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 584")
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
--|#line 596 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 596")
end
	-- regexp formed using '^' delimiters
 				last_token := V_REGEXP
 				last_string_value := text
			
else
--|#line 603 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 603")
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
--|#line 608 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 608")
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
--|#line 623 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 623")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
end
else
if yy_act = 115 then
--|#line 624 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 624")
end

						last_token := V_REAL
						last_real_value := text.to_real
			
else
--|#line 628 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 628")
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
--|#line 629 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 629")
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
--|#line 630 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 630")
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
--|#line 650 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 650")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 655 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 655")
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
--|#line 663 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 663")
end
in_buffer.append_character ('\')
else
--|#line 665 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 665")
end
in_buffer.append_character ('"')
end
else
--|#line 667 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 667")
end

				in_buffer.append_string (text)
	
end
else
if yy_act = 124 then
--|#line 671 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 671")
end
in_buffer.append_string (text)
else
--|#line 673 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 673")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
end
else
if yy_act <= 127 then
if yy_act = 126 then
--|#line 678 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 678")
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
--|#line 689 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 689")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
else
if yy_act = 128 then
--|#line 697 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 697")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
--|#line 699 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 699")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
end
end
else
if yy_act <= 133 then
if yy_act <= 131 then
if yy_act = 130 then
--|#line 700 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 700")
end
last_token := V_CHARACTER; last_character_value := '%R'
else
--|#line 701 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 701")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 132 then
--|#line 702 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 702")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 703 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 703")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 135 then
if yy_act = 134 then
--|#line 705 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 705")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 706 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 706")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 136 then
--|#line 710 "cadl_15_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'cadl_15_scanner.l' at line 710")
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
			create an_array.make_filled (0, 0, 4895)
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
			  145,  278,  952,  117,  178,  146,  184,  281,   77,   78,
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
			  192,  143,  194,  131,  208,  125,  908,  133,  127,  144,
			  313,  147,  135,  112,  241,  953,  214,  241,  232,  949,
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
			  117,  241,  242,  609,  609,  364,  241,  269,  229,  230,
			  270,  188,  243,  225,  226,  259,  267,  243,  189,  190,
			  424,  314,  149,  151,  191,  926,  220,  220,  220,  416,
			  924,  152,  153,  156,  364,  269,  156,  920,  221,  221,
			  117,  157,  244,   96,  267,   96,   96,  244,  158,  159,
			  159,  159,  159,  159,  159,  160,  222,  222,  222,  271,

			  117,  159,  159,  159,  159,  159,  161,  159,  159,  159,
			  162,  159,  163,  159,  159,  159,  159,  159,  159,  159,
			  159,  159,  159,  159,  164,  303,  304,  271,  159,  165,
			  165,  165,  165,  165,  166,  165,  165,  165,  167,  165,
			  168,  165,  165,  165,  165,  165,  165,  165,  165,  165,
			  165,  165,  156,  919,  303,  156,  117,  117,  117,  117,
			  157,  260,  260,  260,  260,  260,  260,  158,  159,  159,
			  159,  159,  159,  159,  160,  886,  273,  277,  282,  876,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159,

			  159,  159,  159,  164,  273,  277,  282,  159,  165,  165,
			  165,  165,  165,  165,  165,  165,  165,  165,  165,  165,
			  165,  165,  165,  165,  165,  165,  165,  165,  165,  165,
			  165,  247,  117,  255,  255,  255,  255,  255,  255,  285,
			  248,  248,  248,  248,  248,  248,  117,  315,  117,  256,
			  261,  261,  261,  261,  261,  261,  265,  265,  265,  265,
			  265,  265,  272,  911,  912,  279,  262,  285,  117,  913,
			  914,  215,  257,  215,  215,  315,  249,  256,  109,  117,
			  110,  268,  263,  263,  263,  263,  263,  263,  264,  117,
			  272,  250,  276,  279,  262,  251,  109,  252,  110,  963,

			  263,  263,  263,  263,  263,  263,  117,  117,  117,  268,
			  283,  117,  274,  280,  284,  287,  117,  136,  275,  136,
			  276,  112,  288,  158,  296,  885,  117,  297,  117,  116,
			  302,  289,  117,  290,  878,  138,  117,  224,  283,  112,
			  274,  280,  284,  287,  117,  136,  275,  291,  877,  291,
			  288,  141,  296,  117,  117,  297,  117,  764,  302,  451,
			  289,  138,  290,  138,  301,  299,  298,  437,  156,  300,
			  313,  156,  314,  225,  226,  291,  157,  315,  320,  136,
			  141,  136,  292,  292,  292,  292,  292,  292,  117,  138,
			  117,  117,  301,  299,  298,  138,  320,  300,  317,  322,

			  318,  293,  139,  323,  294,  319,  320,  149,  149,  291,
			  295,  141,  149,  149,  149,  149,  117,  322,  323,  149,
			  149,  304,  364,  138,  321,  326,  326,  322,  304,  293,
			  139,  323,  294,  327,  332,  333,  149,  149,  295,  328,
			  141,  149,  149,  149,  149,  324,  325,  332,  149,  149,
			  304,  365,  327,  326,  329,  333,  337,  304,  328,  840,
			  338,  327,  332,  333,  306,  337,  338,  328,  340,  341,
			  341,  341,  341,  341,  344,  334,  832,  344,  346,  307,
			  330,  346,  348,  335,  337,  349,  331,  308,  338,  348,
			  349,  352,  353,  342,  343,  352,  353,  356,  358,  358,

			  362,  357,  344,  309,  963,  345,  346,  362,  214,  347,
			  348,  243,  439,  349,  243,  439,  214,  350,  351,  352,
			  353,  214,  214,  354,  355,  356,  358,  361,  362,  357,
			  214,  231,  228,  356,  214,  363,  375,  357,  159,  159,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159,
			  159,  359,  304,  232,  613,  360,  232,  225,  226,  229,
			  230,  830,  650,  229,  230,  377,  378,  378,  378,  378,
			  378,  386,  387,  387,  387,  387,  387,  387,  117,  366,
			  367,  368,  369,  370,  218,  218,  218,  117,  921,  218, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  218,  218,  219,  240,  240,  112,  240,  240,  371,  371,
			  371,  651,  372,  372,  372,  241,  241,  117,  253,  233,
			  253,  253,  438,  393,  410,  393,  243,  243,  394,  394,
			  394,  394,  394,  394,  395,  395,  395,  395,  395,  395,
			  397,  397,  397,  397,  397,  397,  404,  404,  404,  404,
			  404,  438,  410,  858,  858,  858,  244,  244,  379,  380,
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
			  398,  398,  214,  117,  117,  453,  256,  117,  401,  605,
			  401,  407,  399,  402,  402,  402,  402,  402,  402,  109,
			  408,  110,  117,  403,  403,  403,  403,  403,  403,  257,
			  117,  117,  117,  453,  256,  400,  117,  117,  409,  407,

			  399,  405,  405,  405,  405,  405,  405,  117,  408,  413,
			  411,  414,  415,  417,  117,  412,  117,  117,  117,  422,
			  117,  454,  112,  421,  417,  453,  409,  418,  423,  419,
			  420,  158,  382,  381,  417,  382,  494,  413,  411,  414,
			  415,  221,  221,  412,  805,  136,  117,  422,  767,  454,
			  761,  421,  417,  456,  117,  418,  423,  419,  420,  425,
			  425,  425,  425,  425,  425,  494,  759,  117,  426,  426,
			  426,  426,  426,  426,  295,  454,  117,  427,  427,  427,
			  427,  427,  427,  117,  428,  117,  428,  963,  424,  116,
			  116,  116,  116,  116,  116,  136,  117,  424,  432,  117,

			  117,  117,  295,  457,  117,  494,  424,  429,  434,  458,
			  430,  458,  460,  765,  435,  461,  431,  460,  294,  461,
			  436,  766,  304,  464,  295,  465,  432,  149,  149,  496,
			  614,  758,  440,  441,  495,  429,  434,  458,  430,  459,
			  460,  442,  435,  461,  431,  462,  294,  463,  436,  149,
			  149,  464,  295,  465,  440,  441,  117,  443,  444,  444,
			  444,  444,  444,  442,  149,  149,  373,  117,  466,  440,
			  441,  909,  445,  446,  446,  446,  446,  446,  442,  149,
			  149,  464,  465,  466,  440,  441,  470,  447,  448,  449,
			  449,  449,  449,  442,  149,  149,  466,  470,  473,  440,

			  441,  312,  474,  475,  473,  474,  214,  479,  442,  467,
			  468,  469,  479,  417,  470,  476,  214,  341,  341,  341,
			  341,  341,  341,  481,  417,  472,  473,  482,  481,  482,
			  474,  475,  477,  478,  417,  479,  485,  486,  485,  486,
			  480,  489,  490,  489,  450,  490,  214,  383,  381,  214,
			  383,  481,  417,  214,  117,  482,  483,  484,  498,  561,
			  497,  498,  117,  497,  485,  486,  487,  488,  561,  489,
			  490,  492,  498,  493,  499,  117,  500,  380,  381,  500,
			  380,  518,  117,  500,  218,  218,  218,  497,  561,  382,
			  497,  911,  912,  531,  220,  220,  220,  565,  682,  498,

			  383,  499,  117,  378,  378,  378,  378,  378,  378,  518,
			  500,  256,  117,  501,  386,  387,  387,  387,  387,  387,
			  387,  531,  913,  914,  222,  222,  222,  218,  218,  218,
			  384,  218,  218,  218,  257,  439,  745,  683,  439,  256,
			  501,  394,  394,  394,  394,  394,  394,  502,  502,  502,
			  502,  502,  502,  504,  504,  504,  504,  504,  504,  506,
			  506,  506,  506,  506,  506,  507,  507,  507,  507,  507,
			  507,  510,  510,  510,  510,  510,  510,  560,  560,  566,
			  546,  399,  508,  546,  508,  117,  503,  509,  509,  509,
			  509,  509,  509,  402,  402,  402,  402,  402,  402,  117,

			  258,  158,  712,  548,  400,  560,  564,  566,  519,  399,
			  511,  511,  511,  511,  511,  511,  513,  514,  520,  515,
			  515,  515,  515,  515,  515,  516,  516,  516,  516,  516,
			  516,  517,  517,  517,  517,  517,  517,  519,  117,  117,
			  117,  117,  117,  117,  527,  526,  520,  522,  117,  512,
			  521,  525,  117,  117,  117,  527,  566,  117,  117,  537,
			  528,  539,  523,  524,  568,  527,  569,  117,  530,  568,
			  537,  117,  569,  526,  529,  522,  532,  533,  521,  525,
			  537,  149,  149,  527,  567,  572,  149,  149,  528,  539,
			  523,  524,  568,  538,  569,  304,  530,  570,  537,  704,

			  571,  117,  529,  846,  532,  533,  292,  292,  292,  292,
			  292,  292,  117,  572,  117,  425,  425,  425,  425,  425,
			  425,  538,  117,  117,  426,  426,  426,  426,  426,  426,
			  287,  427,  427,  427,  427,  427,  427,  534,  534,  534,
			  534,  534,  534,  149,  149,  847,  289,  512,  149,  149,
			  117,  573,  503,  288,  540,  116,  768,  304,  287,  535,
			  535,  535,  535,  535,  535,  541,  572,  117,  536,  536,
			  536,  536,  536,  536,  476,  289,  117,  546,  649,  573,
			  546,  288,  540,  649,  116,  149,  149,  648,  801,  553,
			  440,  547,  553,  541,  574,  769,  149,  149,  117,  442,

			  548,  440,  550,  963,  573,  576,  963,  577,  576,  579,
			  442,  562,  563,  563,  563,  563,  563,  550,  580,  446,
			  446,  446,  446,  446,  446,  806,  963,  802,  806,  581,
			  549,  546,  575,  576,  546,  577,  578,  579,  579,  149,
			  149,  551,  580,  586,  440,  547,  580,  444,  444,  444,
			  444,  444,  444,  442,  548,  552,  551,  581,  552,  622,
			  117,  853,  552,  149,  149,  552,  584,  553,  440,  554,
			  585,  586,  548,  117,  553,  548,  556,  442,  449,  449,
			  449,  449,  449,  449,  549,  963,  552,  149,  149,  552,
			  853,  109,  440,  441,  586,  588,  589,  588,  553,  589,

			  554,  442,  449,  449,  449,  449,  449,  449,  555,  963,
			  592,  542,  593,  592,  593,  557,  582,  583,  583,  583,
			  583,  583,  587,  588,  589,  590,  594,  591,  640,  806,
			  542,  552,  806,  497,  552,  558,  497,  595,  592,  555,
			  593,  596,  597,  553,  559,  498,  377,  598,  598,  598,
			  598,  598,  545,  117,  594,  117,  500,  599,  599,  599,
			  599,  599,  599,  117,  117,  595,  600,  600,  600,  600,
			  600,  600,  392,  392,  392,  392,  392,  392,  601,  602,
			  602,  602,  602,  602,  764,  765,  501,  603,  603,  603,
			  603,  603,  603,  766,  652,  652,  503,  509,  509,  509, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  509,  509,  509,  399,  604,  604,  604,  604,  604,  604,
			  606,  606,  606,  606,  606,  606,  607,  607,  607,  607,
			  607,  607,  652,  653,  117,  406,  400,  610,  505,  610,
			  381,  399,  608,  608,  608,  608,  608,  608,  611,  616,
			  117,  381,  117,  605,  603,  603,  603,  603,  603,  603,
			  615,  374,  654,  621,  514,  512,  515,  515,  515,  515,
			  515,  515,  117,  117,  117,  117,  612,  616,  117,  617,
			  618,  117,  619,  623,  117,  624,  655,  117,  615,  625,
			  654,  621,  491,  491,  620,  627,  534,  534,  534,  534,
			  534,  534,  117,  626,  476,  471,  471,  617,  618,  117,

			  619,  623,  117,  624,  655,  455,  452,  625,  629,  117,
			  630,  632,  620,  627,  628,  633,  439,  631,  428,  629,
			  428,  626,  535,  535,  535,  535,  535,  535,  117,  629,
			  117,  536,  536,  536,  536,  536,  536,  634,  630,  632,
			  117,  654,  628,  633,  430,  631,  117,  629,  634,  655,
			  431,  149,  149,  116,  149,  149,  636,  149,  635,  149,
			  441,  406,  396,  658,  658,  304,  963,  853,  442,  656,
			  391,  390,  430,  389,  149,  149,  634,  657,  431,  149,
			  149,  116,  638,  639,  639,  639,  639,  639,  304,  149,
			  149,  658,  661,  664,  149,  149,  854,  641,  642,  642,

			  642,  642,  642,  304,  149,  149,  388,  385,  665,  149,
			  149,  239,  644,  645,  645,  645,  645,  645,  304,  149,
			  149,  664,  376,  234,  149,  149,  236,  644,  646,  645,
			  645,  645,  645,  304,  149,  149,  665,  666,  665,  440,
			  441,  666,  669,  659,  659,  669,  671,  650,  442,  563,
			  563,  563,  563,  563,  563,  660,  660,  476,  857,  583,
			  583,  583,  583,  583,  583,  666,  667,  672,  671,  668,
			  669,  659,  662,  670,  671,  672,  675,  676,  677,  678,
			  675,  676,  879,  660,  663,  717,  651,  857,  117,  373,
			  374,  647,  693,  373,  214,  672,  673,  339,  497,  339,

			  336,  497,  278,  674,  675,  676,  677,  678,  679,  680,
			  498,  879,  499,  717,  598,  598,  598,  598,  598,  598,
			  693,  500,  681,  681,  681,  681,  681,  681,  682,  316,
			  602,  602,  602,  602,  602,  602,  603,  603,  603,  603,
			  603,  603,  685,  685,  685,  685,  685,  685,  312,  310,
			  155,  501,  684,  686,  686,  686,  686,  686,  686,  687,
			  687,  687,  687,  687,  687,  304,  286,  683,  688,  688,
			  688,  688,  688,  688,  689,  689,  689,  689,  689,  689,
			  684,  605,  690,  690,  690,  690,  690,  690,  691,  691,
			  691,  691,  691,  692,  692,  692,  692,  692,  692,  117,

			  117,  117,  117,  694,  698,  117,  117,  117,  695,  262,
			  117,  117,  117,  700,  117,  697,  696,  117,  702,  703,
			  706,  698,  117,  719,  707,  698,  699,  701,  719,  708,
			  705,  694,  721,  254,  253,  246,  695,  262,  100,   97,
			  708,  700,  709,  697,  696,  239,  702,  703,  706,  698,
			  709,  719,  707,  709,  699,  701,  720,  236,  705,  722,
			  721,  149,  149,  709,  235,  234,  149,  149,  708,  149,
			  149,  149,  149,  149,  149,  304,  546,  149,  149,  546,
			  117,  709,  149,  550,  149,  149,  214,  722,  721,  149,
			  547,  442,  715,  716,  716,  716,  716,  716,  442,  548,

			  722,  552,  212,  725,  552,  843,  149,  149,  149,  149,
			  149,  440,  441,  553,  149,  554,  723,  155,  117,  115,
			  714,  114,  551,  442,  107,  104,  100,  726,  724,  549,
			  546,  725,   98,  546,  843,   97,  727,  963,  149,  149,
			  963,  726,  963,  149,  547,  963,  639,  639,  639,  639,
			  639,  639,  442,  548,  555,  726,  550,  963,  642,  642,
			  642,  642,  642,  642,  727,  963,  727,  963,  552,  728,
			  730,  552,  562,  718,  718,  718,  718,  718,  963,  963,
			  553,  963,  554,  549,  645,  645,  645,  645,  645,  645,
			  552,  963,  730,  552,  729,  551,  732,  733,  730,  732,

			  733,  736,  553,  737,  556,  738,  645,  645,  645,  645,
			  645,  645,  736,  963,  599,  599,  599,  599,  599,  599,
			  731,  555,  117,  963,  732,  733,  963,  734,  735,  736,
			  963,  737,  963,  738,  601,  740,  740,  740,  740,  740,
			  739,  749,  741,  557,  741,  744,  963,  742,  742,  742,
			  742,  742,  742,  742,  742,  742,  742,  742,  742,  743,
			  743,  743,  743,  743,  743,  963,  117,  963,  400,  749,
			  963,  963,  751,  744,  607,  607,  607,  607,  607,  607,
			  746,  746,  746,  746,  746,  746,  747,  747,  747,  747,
			  747,  747,  605,  748,  748,  748,  748,  748,  748,  117,

			  751,  752,  117,  754,  117,  117,  117,  770,  771,  744,
			  771,  963,  750,  755,  757,  756,  773,  753,  752,  773,
			  754,  963,  752,  963,  754,  149,  149,  963,  775,  963,
			  149,  149,  400,  963,  963,  770,  771,  744,  772,  304,
			  750,  755,  757,  756,  773,  753,  752,  774,  754,  762,
			  763,  763,  763,  763,  763,  768,  775,  716,  716,  716,
			  716,  716,  716,  650,  775,  718,  718,  718,  718,  718,
			  718,  777,  778,  779,  682,  777,  740,  740,  740,  740,
			  740,  740,  742,  742,  742,  742,  742,  742,  784,  784,
			  784,  784,  776,  808,  769,  963,  809,  963,  963,  777,

			  778,  779,  651,  780,  742,  742,  742,  742,  742,  742,
			  963,  117,  963,  683,  781,  781,  781,  781,  781,  781,
			  782,  808,  782,  791,  809,  783,  783,  783,  783,  783,
			  783,  785,  785,  785,  785,  785,  785,  786,  787,  786,
			  787,  789,  789,  789,  789,  789,  789,  117,  117,  117,
			  794,  791,  117,  790,  117,  793,  792,  744,  809,  795,
			  811,  797,  796,  963,  963,  797,  811,  794,  798,  963,
			  813,  794,  798,  813,  815,  816,  788,  963,  963,  963,
			  400,  790,  797,  793,  792,  744,  810,  795,  811,  798,
			  796,  149,  149,  797,  812,  794,  149,  799,  813,  815,

			  798,  814,  815,  816,  801,  304,  763,  763,  763,  763,
			  763,  763,  715,  807,  807,  807,  807,  807,  783,  783,
			  783,  783,  783,  783,  963,  963,  963,  817,  818,  818,
			  818,  818,  818,  818,  819,  819,  819,  819,  819,  819,
			  963,  117,  963,  802,  612,  612,  612,  612,  612,  612,
			  820,  820,  820,  820,  820,  820,  821,  821,  821,  821,
			  821,  821,  824,  117,  117,  963,  963,  605,  822,  822,
			  822,  822,  822,  822,  823,  117,  827,  828,  834,  963,
			  827,  828,  835,  825,  744,  826,  963,  963,  835,  837,
			  824,  762,  831,  831,  831,  831,  831,  827,  828,  963, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  963,  963,  823,  963,  963,  963,  834,  400,  827,  828,
			  835,  825,  744,  826,  149,  149,  836,  837,  837,  149,
			  149,  839,  149,  149,  149,  149,  149,  149,  304,  768,
			  963,  807,  807,  807,  807,  807,  807,  781,  781,  781,
			  781,  781,  781,  963,  963,  963,  838,  852,  117,  839,
			  841,  841,  841,  841,  841,  841,  842,  786,  117,  786,
			  117,  149,  821,  821,  821,  821,  821,  821,  769,  822,
			  822,  822,  822,  822,  822,  852,  605,  855,  844,  855,
			  963,  149,  149,  868,  842,  845,  149,  149,  859,  859,
			  859,  859,  859,  859,  117,  304,  788,  801,  963,  831,

			  831,  831,  831,  831,  831,  855,  844,  856,  117,  862,
			  863,  868,  869,  117,  845,  860,  880,  862,  863,  963,
			  963,  149,  149,  963,  117,  861,  864,  865,  149,  149,
			  862,  863,  872,  149,  149,  304,  802,  963,  871,  963,
			  869,  963,  304,  860,  880,  862,  863,  870,  870,  870,
			  870,  870,  870,  861,  788,  788,  788,  788,  788,  788,
			  872,  873,  874,  881,  117,  881,  890,  871,  902,  873,
			  874,  149,  149,  963,  882,  963,  864,  865,  929,  963,
			  963,  884,  873,  874,  963,  304,  887,  887,  887,  887,
			  887,  887,  304,  117,  890,  929,  902,  873,  874,  929,

			  963,  893,  883,  891,  891,  891,  891,  891,  891,  884,
			  892,  892,  892,  892,  892,  894,  895,  903,  903,  903,
			  903,  903,  903,  929,  963,  963,  894,  895,  963,  893,
			  904,  904,  904,  904,  904,  904,  894,  895,  896,  905,
			  897,  898,  906,  887,  887,  887,  887,  887,  887,  304,
			  905,  963,  963,  906,  894,  895,  963,  963,  963,  963,
			  905,  963,  963,  906,  907,  907,  907,  907,  907,  907,
			  910,  910,  910,  910,  910,  910,  304,  916,  905,  916,
			  899,  906,  915,  915,  915,  915,  915,  915,  917,  907,
			  907,  907,  907,  907,  907,  907,  907,  907,  907,  907,

			  907,  896,  963,  897,  922,  963,  910,  910,  910,  910,
			  910,  910,  304,  963,  963,  963,  918,  928,  928,  928,
			  928,  928,  908,  930,  963,  963,  899,  883,  883,  883,
			  883,  883,  883,  927,  927,  927,  927,  927,  927,  963,
			  930,  963,  963,  899,  930,  931,  931,  931,  931,  931,
			  931,  304,  932,  932,  932,  932,  932,  932,  304,  933,
			  933,  933,  933,  933,  933,  963,  963,  963,  930,  934,
			  934,  934,  934,  934,  934,  935,  935,  935,  935,  935,
			  935,  936,  936,  936,  936,  936,  936,  937,  938,  931,
			  931,  931,  931,  931,  931,  304,  945,  945,  945,  945,

			  945,  945,  963,  963,  937,  938,  963,  963,  937,  938,
			  896,  963,  897,  963,  963,  932,  932,  932,  932,  932,
			  932,  304,  946,  947,  946,  947,  899,  963,  963,  963,
			  963,  963,  937,  938,  896,  963,  939,  940,  963,  933,
			  933,  933,  933,  933,  933,  963,  963,  963,  941,  963,
			  942,  943,  899,  934,  934,  934,  934,  934,  934,  963,
			  963,  948,  950,  950,  950,  950,  950,  950,  951,  951,
			  951,  951,  951,  951,  963,  963,  899,  954,  954,  954,
			  954,  954,  954,  918,  918,  918,  918,  918,  918,  963,
			  944,  955,  955,  955,  955,  955,  955,  956,  956,  956,

			  956,  956,  956,  896,  963,  939,  957,  963,  950,  950,
			  950,  950,  950,  950,  951,  951,  951,  951,  951,  951,
			  951,  951,  951,  951,  951,  951,  952,  941,  963,  942,
			  958,  963,  954,  954,  954,  954,  954,  954,  959,  959,
			  959,  959,  959,  959,  963,  899,  963,  946,  963,  946,
			  963,  944,  956,  956,  956,  956,  956,  956,  960,  960,
			  960,  960,  960,  960,  963,  963,  963,  963,  963,  944,
			  961,  961,  961,  961,  961,  961,  962,  962,  962,  962,
			  962,  962,  896,  963,  939,  963,  948,  960,  960,  960,
			  960,  960,  960,  941,  963,  942,  963,  963,  961,  961,

			  961,  961,  961,  961,  948,  948,  948,  948,  948,  948,
			  963,  963,  963,  963,  108,  311,  311,  311,  311,  311,
			  311,  311,  311,  311,  899,  108,  108,  108,  108,  108,
			  108,  108,  108,  108,  963,  944,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   86,   86,   86,   86,   86,   86,

			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   99,   99,  963,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,  963,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,  101,  101,  963,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  116,  116,  963,  116,  963,  116,  116,  116,  963,
			  963,  116,  116,  116,  116,  116,  116,  116,  116,  116,

			  150,  150,  963,  150,  963,  150,  150,  963,  963,  963,
			  150,  150,  150,  963,  963,  150,  150,  150,  150,  150,
			  150,  150,  150,  150,  154,  154,  963,  154,  154,  154,
			  154,  154,  154,  154,  154,  154,  154,  154,  154,  154,
			  154,  154,  154,  154,  154,  154,  154,  154,  154,  154,
			  154,  154,  154,  213,  213,  963,  213,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,
			  213,  213,  963,  213,  213,  213,  213,  213,  213,  213,
			  213,  213,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,

			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  238,  963,  238,  963,  963,  963,  963,  238,  963,  238,
			  238,  963,  963,  963,  238,  238,  238,  963,  963,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  245,  245,
			  963,  245,  245,  245,  245,  245,  245,  245,  245,  245,
			  245,  245,  245,  245,  245,  245,  245,  245,  245,  245,
			  245,  245,  245,  245,  245,  245,  245,  104,  104,  104, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  108,  108,  108,  963,
			  963,  963,  108,  108,  108,  108,  963,  108,  108,  108,
			  108,  108,  108,  108,  108,  108,  266,  963,  963,  266,
			  266,  963,  266,  266,  266,  266,  266,  963,  963,  266,
			  266,  266,  266,  266,  266,  266,  266,  266,  149,  149,
			  963,  149,  963,  149,  149,  149,  963,  963,  149,  149,
			  149,  963,  963,  149,  149,  149,  149,  149,  149,  149,
			  149,  149,  305,  305,  963,  305,  963,  305,  305,  305,

			  963,  963,  305,  305,  305,  963,  963,  305,  305,  305,
			  305,  305,  305,  305,  305,  305,  225,  225,  225,  225,
			  225,  225,  225,  225,  225,  963,  225,  225,  225,  225,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  225,  225,  228,  228,  228,  228,  228,
			  228,  228,  228,  228,  228,  228,  228,  228,  228,  228,
			  228,  228,  228,  228,  228,  228,  228,  228,  228,  228,
			  228,  228,  228,  228,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,

			  235,  235,  235,  311,  311,  311,  963,  963,  963,  311,
			  311,  311,  311,  963,  311,  311,  311,  311,  311,  311,
			  311,  311,  311,  379,  379,  379,  379,  379,  379,  379,
			  379,  379,  379,  379,  379,  379,  379,  379,  379,  379,
			  379,  379,  379,  379,  379,  379,  379,  379,  379,  379,
			  379,  379,  543,  543,  963,  543,  963,  543,  543,  543,
			  963,  963,  543,  543,  543,  963,  963,  543,  543,  543,
			  543,  543,  543,  543,  543,  543,  544,  544,  963,  544,
			  963,  544,  544,  544,  963,  963,  544,  544,  544,  963,
			  963,  544,  544,  544,  544,  544,  544,  544,  544,  544,

			  452,  452,  452,  963,  963,  452,  452,  452,  452,  452,
			  452,  452,  452,  963,  963,  452,  452,  452,  963,  963,
			  452,  452,  452,  452,  452,  452,  452,  452,  452,  637,
			  963,  637,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  637,  637,  637,  963,  963,  637,  637,
			  637,  637,  637,  637,  637,  637,  637,  643,  963,  643,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  643,  643,  643,  963,  963,  643,  643,  643,  643,
			  643,  643,  643,  643,  643,  710,  710,  963,  710,  963,
			  710,  710,  710,  963,  963,  710,  710,  710,  963,  963,

			  710,  710,  710,  710,  710,  710,  710,  710,  710,  711,
			  711,  963,  963,  963,  711,  711,  711,  963,  963,  711,
			  711,  711,  711,  711,  711,  711,  711,  711,  713,  713,
			  963,  963,  963,  713,  713,  713,  963,  963,  713,  713,
			  713,  713,  713,  713,  713,  713,  713,  760,  760,  963,
			  760,  963,  760,  760,  760,  963,  963,  760,  760,  760,
			  963,  963,  760,  760,  760,  760,  760,  760,  760,  760,
			  760,  800,  800,  963,  963,  963,  800,  800,  800,  963,
			  963,  800,  800,  800,  800,  800,  800,  800,  800,  800,
			  803,  803,  963,  963,  963,  803,  803,  803,  963,  963,

			  803,  803,  803,  803,  803,  803,  803,  803,  803,  804,
			  804,  963,  963,  963,  804,  804,  804,  963,  963,  804,
			  804,  804,  804,  804,  804,  804,  804,  804,  829,  829,
			  963,  829,  963,  829,  829,  829,  963,  963,  829,  829,
			  829,  963,  963,  829,  829,  829,  829,  829,  829,  829,
			  829,  829,  833,  833,  833,  963,  963,  833,  833,  833,
			  833,  833,  833,  833,  833,  833,  848,  848,  963,  848,
			  963,  848,  848,  848,  963,  963,  848,  848,  848,  963,
			  963,  848,  848,  848,  848,  848,  848,  848,  848,  848,
			  849,  849,  849,  963,  963,  849,  849,  849,  849,  849,

			  849,  849,  849,  849,  850,  850,  850,  963,  963,  850,
			  850,  850,  850,  850,  850,  850,  850,  850,  851,  851,
			  963,  963,  963,  851,  851,  851,  963,  963,  851,  851,
			  851,  851,  851,  851,  851,  851,  851,  866,  866,  963,
			  963,  963,  866,  866,  866,  963,  963,  866,  866,  866,
			  866,  866,  866,  866,  866,  866,  867,  867,  963,  963,
			  963,  867,  867,  867,  963,  963,  867,  867,  867,  867,
			  867,  867,  867,  867,  867,  875,  875,  963,  875,  963,
			  875,  875,  875,  963,  963,  875,  875,  875,  963,  963,
			  875,  875,  875,  875,  875,  875,  875,  875,  875,  888,

			  888,  888,  963,  963,  888,  888,  888,  888,  888,  888,
			  888,  888,  888,  889,  889,  889,  963,  963,  889,  889,
			  889,  889,  889,  889,  889,  889,  889,  900,  900,  963,
			  963,  963,  900,  900,  900,  963,  963,  900,  900,  900,
			  900,  900,  900,  900,  900,  900,  901,  901,  963,  963,
			  963,  901,  901,  901,  963,  963,  901,  901,  901,  901,
			  901,  901,  901,  901,  901,  923,  923,  963,  963,  963,
			  923,  923,  923,  963,  963,  923,  923,  923,  923,  923,
			  923,  923,  923,  923,  925,  925,  963,  963,  963,  925,
			  925,  925,  963,  963,  925,  925,  925,  925,  925,  925,

			  925,  925,  925,   11,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963, yy_Dummy>>,
			1, 896, 4000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 4895)
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
			   48,  128,  953,  128,   59,   48,   61,  131,    3,    3,
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
			   63,   47,   64,   42,   68,   39,  949,   44,   40,   47,
			  161,   49,   45,   27,  241,  942,   78,  241,   87,  939,
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
			  287,  162,   51,   51,   62,  914,   79,   79,   79,  277,
			  912,   51,   51,   55,  210,  120,   55,  906,   80,   80,
			  122,   55,   94,   96,  118,   96,   96,   95,   55,   55,
			   55,   55,   55,   55,   55,   55,   81,   81,   81,  122,

			  148,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,  148,  865,  122,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   58,  905,  148,   58,  124,  132,  127,  893,
			   58,  109,  109,  109,  109,  109,  109,   58,   58,   58,
			   58,   58,   58,   58,   58,  874,  124,  127,  132,  865,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,

			   58,   58,   58,   58,  124,  127,  132,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,  103,  135,  106,  106,  106,  106,  106,  106,  135,
			  103,  103,  103,  103,  103,  103,  123,  163,  129,  106,
			  110,  110,  110,  110,  110,  110,  112,  112,  112,  112,
			  112,  112,  123,  900,  900,  129,  110,  135,  119,  901,
			  901,  215,  106,  215,  215,  163,  103,  106,  111,  126,
			  111,  119,  111,  111,  111,  111,  111,  111,  111,  133,
			  123,  103,  126,  129,  110,  103,  113,  103,  113,  137,

			  113,  113,  113,  113,  113,  113,  125,  130,  134,  119,
			  133,  147,  125,  130,  134,  137,  143,  138,  125,  139,
			  126,  111,  137,  311,  143,  873,  138,  143,  139,  137,
			  147,  137,  872,  137,  867,  139,  301,  223,  133,  113,
			  125,  130,  134,  137,  144,  141,  125,  138,  866,  139,
			  137,  139,  143,  145,  141,  143,  146,  851,  147,  311,
			  137,  141,  137,  139,  146,  145,  144,  301,  156,  145,
			  166,  156,  167,  223,  223,  141,  156,  168,  169,  142,
			  139,  140,  140,  140,  140,  140,  140,  140,  142,  141,
			  140,  844,  146,  145,  144,  142,  170,  145,  166,  171,

			  167,  140,  142,  172,  140,  168,  169,  150,  150,  142,
			  140,  142,  150,  150,  151,  151,  843,  173,  174,  151,
			  151,  150,  211,  142,  170,  175,  177,  171,  151,  140,
			  142,  172,  140,  176,  179,  180,  152,  152,  140,  176,
			  142,  152,  152,  153,  153,  173,  174,  181,  153,  153,
			  152,  211,  178,  175,  177,  182,  185,  153,  178,  819,
			  186,  176,  179,  180,  151,  189,  190,  176,  188,  188,
			  188,  188,  188,  188,  192,  181,  803,  193,  194,  151,
			  178,  195,  196,  182,  185,  197,  178,  152,  186,  198,
			  199,  200,  201,  189,  190,  202,  203,  204,  205,  207,

			  208,  204,  192,  153,  159,  193,  194,  209,  218,  195,
			  196,  243,  439,  197,  243,  439,  219,  198,  199,  200,
			  201,  220,  367,  202,  203,  204,  205,  207,  208,  204,
			  221,  226,  227,  206,  222,  209,  229,  206,  159,  159,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159,
			  159,  206,  909,  232,  517,  206,  232,  226,  226,  227,
			  227,  800,  562,  229,  229,  236,  236,  236,  236,  236,
			  236,  248,  248,  248,  248,  248,  248,  248,  795,  218,
			  218,  218,  218,  218,  219,  219,  219,  303,  909,  220, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  220,  220,  367,  238,  240,  517,  238,  240,  221,  221,
			  221,  562,  222,  222,  222,  238,  240,  271,  253,  232,
			  253,  253,  303,  256,  271,  256,  238,  240,  256,  256,
			  256,  256,  256,  256,  257,  257,  257,  257,  257,  257,
			  260,  260,  260,  260,  260,  260,  264,  264,  264,  264,
			  264,  303,  271,  840,  840,  840,  238,  240,  242,  242,
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
			  261,  261,  369,  267,  268,  313,  255,  792,  262,  781,
			  262,  267,  261,  262,  262,  262,  262,  262,  262,  263,
			  268,  263,  270,  263,  263,  263,  263,  263,  263,  255,
			  272,  275,  276,  313,  255,  261,  274,  284,  270,  267,

			  261,  265,  265,  265,  265,  265,  265,  273,  268,  274,
			  272,  275,  276,  278,  279,  273,  280,  282,  281,  284,
			  285,  314,  263,  282,  278,  317,  270,  279,  285,  280,
			  281,  769,  382,  382,  278,  382,  364,  274,  272,  275,
			  276,  369,  369,  273,  766,  294,  757,  284,  714,  314,
			  711,  282,  278,  317,  294,  279,  285,  280,  281,  288,
			  288,  288,  288,  288,  288,  364,  709,  288,  289,  289,
			  289,  289,  289,  289,  294,  318,  289,  290,  290,  290,
			  290,  290,  290,  296,  292,  290,  292,  292,  288,  291,
			  291,  291,  291,  291,  291,  293,  299,  289,  296,  519,

			  298,  300,  294,  318,  293,  365,  290,  292,  298,  320,
			  292,  321,  322,  804,  299,  323,  292,  324,  293,  325,
			  300,  804,  897,  326,  293,  327,  296,  305,  305,  373,
			  519,  708,  305,  305,  365,  292,  298,  320,  292,  321,
			  322,  305,  299,  323,  292,  324,  293,  325,  300,  306,
			  306,  326,  293,  327,  306,  306,  703,  306,  306,  306,
			  306,  306,  306,  306,  307,  307,  373,  701,  328,  307,
			  307,  897,  307,  307,  307,  307,  307,  307,  307,  308,
			  308,  329,  330,  331,  308,  308,  332,  308,  308,  308,
			  308,  308,  308,  308,  309,  309,  328,  334,  337,  309,

			  309,  336,  338,  339,  342,  343,  366,  344,  309,  329,
			  330,  331,  345,  336,  332,  341,  368,  341,  341,  341,
			  341,  341,  341,  348,  336,  334,  337,  349,  350,  351,
			  338,  339,  342,  343,  336,  344,  352,  353,  354,  355,
			  345,  356,  357,  359,  309,  360,  370,  383,  383,  371,
			  383,  348,  336,  372,  700,  349,  350,  351,  498,  454,
			  377,  498,  407,  377,  352,  353,  354,  355,  457,  356,
			  357,  359,  377,  360,  377,  699,  500,  380,  380,  500,
			  380,  407,  421,  377,  366,  366,  366,  378,  454,  380,
			  378,  923,  923,  421,  368,  368,  368,  457,  601,  378,

			  380,  378,  697,  378,  378,  378,  378,  378,  378,  407,
			  378,  392,  695,  377,  387,  387,  387,  387,  387,  387,
			  387,  421,  925,  925,  370,  370,  370,  371,  371,  371,
			  380,  372,  372,  372,  392,  545,  689,  601,  545,  392,
			  378,  393,  393,  393,  393,  393,  393,  394,  394,  394,
			  394,  394,  394,  395,  395,  395,  395,  395,  395,  397,
			  397,  397,  397,  397,  397,  398,  398,  398,  398,  398,
			  398,  400,  400,  400,  400,  400,  400,  453,  456,  458,
			  546,  398,  399,  546,  399,  408,  394,  399,  399,  399,
			  399,  399,  399,  401,  401,  401,  401,  401,  401,  409,

			  683,  651,  640,  546,  398,  453,  456,  458,  408,  398,
			  402,  402,  402,  402,  402,  402,  403,  403,  409,  403,
			  403,  403,  403,  403,  403,  404,  404,  404,  404,  404,
			  404,  405,  405,  405,  405,  405,  405,  408,  410,  411,
			  413,  416,  414,  415,  417,  416,  409,  411,  418,  402,
			  410,  415,  419,  420,  436,  417,  459,  422,  423,  433,
			  418,  436,  413,  414,  460,  417,  461,  630,  420,  462,
			  433,  435,  463,  416,  419,  411,  422,  423,  410,  415,
			  433,  440,  440,  417,  459,  465,  440,  440,  418,  436,
			  413,  414,  460,  435,  461,  440,  420,  462,  433,  629,

			  463,  620,  419,  827,  422,  423,  424,  424,  424,  424,
			  424,  424,  617,  465,  424,  425,  425,  425,  425,  425,
			  425,  435,  615,  425,  426,  426,  426,  426,  426,  426,
			  425,  427,  427,  427,  427,  427,  427,  428,  428,  428,
			  428,  428,  428,  441,  441,  827,  425,  607,  441,  441,
			  437,  466,  599,  427,  437,  426,  715,  441,  425,  429,
			  429,  429,  429,  429,  429,  437,  468,  429,  430,  430,
			  430,  430,  430,  430,  582,  425,  430,  443,  565,  466,
			  443,  427,  437,  561,  426,  443,  443,  559,  762,  553,
			  443,  443,  553,  437,  468,  715,  445,  445,  530,  443,

			  443,  445,  445,  446,  469,  470,  446,  471,  472,  473,
			  445,  455,  455,  455,  455,  455,  455,  446,  474,  446,
			  446,  446,  446,  446,  446,  767,  446,  762,  767,  475,
			  443,  444,  469,  470,  444,  471,  472,  473,  477,  444,
			  444,  445,  478,  479,  444,  444,  474,  444,  444,  444,
			  444,  444,  444,  444,  444,  447,  446,  475,  447,  527,
			  525,  835,  448,  447,  447,  448,  477,  447,  447,  447,
			  478,  479,  548,  518,  448,  548,  448,  447,  448,  448,
			  448,  448,  448,  448,  444,  448,  449,  450,  450,  449,
			  835,  506,  450,  450,  480,  481,  482,  483,  449,  484,

			  449,  450,  449,  449,  449,  449,  449,  449,  447,  449,
			  489,  495,  490,  492,  493,  448,  476,  476,  476,  476,
			  476,  476,  480,  481,  482,  483,  491,  484,  548,  806,
			  494,  552,  806,  497,  552,  450,  497,  491,  489,  449,
			  490,  492,  493,  552,  451,  497,  499,  499,  499,  499,
			  499,  499,  442,  434,  491,  432,  497,  502,  502,  502,
			  502,  502,  502,  431,  412,  491,  503,  503,  503,  503,
			  503,  503,  504,  504,  504,  504,  504,  504,  505,  505,
			  505,  505,  505,  505,  713,  713,  497,  507,  507,  507,
			  507,  507,  507,  713,  566,  567,  502,  508,  508,  508, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  508,  508,  508,  507,  509,  509,  509,  509,  509,  509,
			  510,  510,  510,  510,  510,  510,  511,  511,  511,  511,
			  511,  511,  566,  567,  521,  406,  507,  516,  396,  516,
			  384,  507,  512,  512,  512,  512,  512,  512,  516,  521,
			  526,  379,  520,  509,  514,  514,  514,  514,  514,  514,
			  520,  375,  568,  526,  515,  511,  515,  515,  515,  515,
			  515,  515,  522,  523,  524,  528,  516,  521,  529,  522,
			  523,  531,  524,  528,  532,  529,  569,  533,  520,  531,
			  568,  526,  361,  358,  524,  533,  534,  534,  534,  534,
			  534,  534,  540,  532,  340,  335,  333,  522,  523,  541,

			  524,  528,  538,  529,  569,  316,  312,  531,  537,  539,
			  538,  540,  524,  533,  534,  541,  304,  539,  535,  537,
			  535,  532,  535,  535,  535,  535,  535,  535,  302,  537,
			  535,  536,  536,  536,  536,  536,  536,  542,  538,  540,
			  283,  570,  534,  541,  535,  539,  269,  537,  542,  571,
			  535,  543,  543,  536,  544,  544,  543,  543,  542,  544,
			  544,  266,  259,  572,  574,  543,  258,  836,  544,  570,
			  252,  251,  535,  250,  547,  547,  542,  571,  535,  547,
			  547,  536,  547,  547,  547,  547,  547,  547,  547,  550,
			  550,  572,  574,  577,  550,  550,  836,  550,  550,  550,

			  550,  550,  550,  550,  554,  554,  249,  247,  579,  554,
			  554,  239,  554,  554,  554,  554,  554,  554,  554,  556,
			  556,  577,  235,  234,  556,  556,  233,  556,  556,  556,
			  556,  556,  556,  556,  558,  558,  579,  580,  584,  558,
			  558,  585,  586,  573,  575,  587,  588,  563,  558,  563,
			  563,  563,  563,  563,  563,  573,  575,  583,  839,  583,
			  583,  583,  583,  583,  583,  580,  584,  589,  590,  585,
			  586,  573,  575,  587,  588,  591,  592,  593,  594,  595,
			  596,  597,  868,  573,  575,  649,  563,  839,  614,  230,
			  228,  558,  614,  225,  213,  589,  590,  191,  598,  187,

			  184,  598,  183,  591,  592,  593,  594,  595,  596,  597,
			  598,  868,  598,  649,  598,  598,  598,  598,  598,  598,
			  614,  598,  600,  600,  600,  600,  600,  600,  602,  164,
			  602,  602,  602,  602,  602,  602,  603,  603,  603,  603,
			  603,  603,  604,  604,  604,  604,  604,  604,  160,  157,
			  154,  598,  603,  605,  605,  605,  605,  605,  605,  606,
			  606,  606,  606,  606,  606,  149,  136,  602,  608,  608,
			  608,  608,  608,  608,  609,  609,  609,  609,  609,  609,
			  603,  604,  610,  610,  610,  610,  610,  610,  611,  611,
			  611,  611,  611,  613,  613,  613,  613,  613,  613,  616,

			  618,  619,  621,  616,  622,  624,  623,  625,  618,  613,
			  626,  631,  627,  624,  632,  621,  619,  633,  626,  627,
			  632,  622,  116,  654,  633,  622,  623,  625,  656,  634,
			  631,  616,  658,  105,  104,  101,  618,  613,   99,   97,
			  634,  624,  635,  621,  619,   93,  626,  627,  632,  622,
			  634,  654,  633,  635,  623,  625,  656,   90,  631,  659,
			  658,  636,  636,  635,   89,   88,  636,  636,  634,  636,
			  636,  636,  636,  636,  636,  636,  638,  641,  641,  638,
			  824,  635,  641,  641,  638,  638,   73,  659,  661,  638,
			  638,  641,  648,  648,  648,  648,  648,  648,  638,  638,

			  662,  644,   70,  664,  644,  824,  647,  647,  636,  644,
			  644,  647,  647,  644,  644,  644,  661,   54,   38,   33,
			  647,   31,  641,  644,   26,   24,   16,  665,  662,  638,
			  639,  664,   15,  639,  824,   14,  666,   11,  639,  639,
			    0,  667,  642,  639,  639,  642,  639,  639,  639,  639,
			  639,  639,  639,  639,  644,  665,  642,    0,  642,  642,
			  642,  642,  642,  642,  666,  642,  668,    0,  645,  667,
			  669,  645,  650,  650,  650,  650,  650,  650,    0,    0,
			  645,    0,  645,  639,  645,  645,  645,  645,  645,  645,
			  646,  645,  670,  646,  668,  642,  671,  672,  669,  673,

			  674,  676,  646,  677,  646,  678,  646,  646,  646,  646,
			  646,  646,  680,  646,  681,  681,  681,  681,  681,  681,
			  670,  645,  693,    0,  671,  672,    0,  673,  674,  676,
			    0,  677,    0,  678,  682,  682,  682,  682,  682,  682,
			  680,  693,  684,  646,  684,  687,    0,  684,  684,  684,
			  684,  684,  684,  685,  685,  685,  685,  685,  685,  686,
			  686,  686,  686,  686,  686,    0,  696,    0,  687,  693,
			    0,    0,  696,  687,  688,  688,  688,  688,  688,  688,
			  690,  690,  690,  690,  690,  690,  691,  691,  691,  691,
			  691,  691,  685,  692,  692,  692,  692,  692,  692,  694,

			  696,  698,  702,  704,  706,  705,  707,  717,  719,  692,
			  720,    0,  694,  705,  707,  706,  722,  702,  698,  724,
			  704,    0,  698,    0,  704,  710,  710,    0,  732,    0,
			  710,  710,  692,    0,    0,  717,  719,  692,  720,  710,
			  694,  705,  707,  706,  722,  702,  698,  724,  704,  712,
			  712,  712,  712,  712,  712,  716,  732,  716,  716,  716,
			  716,  716,  716,  718,  734,  718,  718,  718,  718,  718,
			  718,  736,  737,  738,  740,  739,  740,  740,  740,  740,
			  740,  740,  741,  741,  741,  741,  741,  741,  745,  745,
			  745,  745,  734,  770,  716,    0,  771,    0,    0,  736,

			  737,  738,  718,  739,  742,  742,  742,  742,  742,  742,
			    0,  750,    0,  740,  743,  743,  743,  743,  743,  743,
			  744,  770,  744,  750,  771,  744,  744,  744,  744,  744,
			  744,  746,  746,  746,  746,  746,  746,  747,  747,  747,
			  747,  748,  748,  748,  748,  748,  748,  749,  751,  753,
			  754,  750,  755,  749,  756,  753,  751,  748,  772,  755,
			  773,  758,  756,    0,    0,  758,  774,  754,  759,    0,
			  775,  754,  759,  776,  777,  778,  747,    0,    0,    0,
			  748,  749,  758,  753,  751,  748,  772,  755,  773,  759,
			  756,  760,  760,  758,  774,  754,  760,  760,  775,  780,

			  759,  776,  777,  778,  763,  760,  763,  763,  763,  763,
			  763,  763,  768,  768,  768,  768,  768,  768,  782,  782,
			  782,  782,  782,  782,    0,    0,    0,  780,  783,  783,
			  783,  783,  783,  783,  784,  784,  784,  784,  784,  784,
			    0,  791,    0,  763,  785,  785,  785,  785,  785,  785,
			  786,  786,  786,  786,  786,  786,  787,  787,  787,  787,
			  787,  787,  791,  790,  796,    0,    0,  783,  789,  789,
			  789,  789,  789,  789,  790,  793,  797,  798,  808,    0,
			  797,  798,  809,  793,  789,  796,    0,    0,  810,  813,
			  791,  801,  801,  801,  801,  801,  801,  797,  798,    0, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,    0,  790,    0,    0,    0,  808,  789,  797,  798,
			  809,  793,  789,  796,  799,  799,  810,  813,  814,  799,
			  799,  816,  799,  799,  799,  799,  799,  799,  799,  807,
			    0,  807,  807,  807,  807,  807,  807,  818,  818,  818,
			  818,  818,  818,    0,    0,    0,  814,  834,  823,  816,
			  820,  820,  820,  820,  820,  820,  823,  821,  825,  821,
			  826,  799,  821,  821,  821,  821,  821,  821,  807,  822,
			  822,  822,  822,  822,  822,  834,  818,  837,  825,  838,
			    0,  829,  829,  852,  823,  826,  829,  829,  841,  841,
			  841,  841,  841,  841,  842,  829,  821,  831,    0,  831,

			  831,  831,  831,  831,  831,  837,  825,  838,  845,  846,
			  847,  852,  857,  860,  826,  842,  869,  846,  847,    0,
			    0,  848,  848,    0,  861,  845,  848,  848,  864,  864,
			  846,  847,  861,  864,  864,  848,  831,    0,  860,    0,
			  857,    0,  864,  842,  869,  846,  847,  858,  858,  858,
			  858,  858,  858,  845,  859,  859,  859,  859,  859,  859,
			  861,  862,  863,  870,  871,  870,  879,  860,  890,  862,
			  863,  875,  875,    0,  870,    0,  875,  875,  919,    0,
			    0,  871,  862,  863,    0,  875,  876,  876,  876,  876,
			  876,  876,  876,  884,  879,  919,  890,  862,  863,  919,

			    0,  884,  870,  881,  881,  881,  881,  881,  881,  871,
			  882,  882,  882,  882,  882,  885,  886,  891,  891,  891,
			  891,  891,  891,  919,    0,    0,  885,  886,    0,  884,
			  892,  892,  892,  892,  892,  892,  885,  886,  887,  894,
			  887,  887,  895,  887,  887,  887,  887,  887,  887,  887,
			  894,    0,    0,  895,  885,  886,    0,    0,    0,    0,
			  894,    0,    0,  895,  896,  896,  896,  896,  896,  896,
			  898,  898,  898,  898,  898,  898,  898,  904,  894,  904,
			  887,  895,  903,  903,  903,  903,  903,  903,  904,  907,
			  907,  907,  907,  907,  907,  908,  908,  908,  908,  908,

			  908,  910,    0,  910,  910,    0,  910,  910,  910,  910,
			  910,  910,  910,    0,    0,    0,  904,  917,  917,  917,
			  917,  917,  896,  920,    0,    0,  907,  915,  915,  915,
			  915,  915,  915,  916,  916,  916,  916,  916,  916,    0,
			  920,    0,    0,  910,  920,  921,  921,  921,  921,  921,
			  921,  921,  922,  922,  922,  922,  922,  922,  922,  924,
			  924,  924,  924,  924,  924,    0,    0,    0,  920,  926,
			  926,  926,  926,  926,  926,  927,  927,  927,  927,  927,
			  927,  928,  928,  928,  928,  928,  928,  929,  930,  931,
			  931,  931,  931,  931,  931,  931,  935,  935,  935,  935,

			  935,  935,    0,    0,  929,  930,    0,    0,  929,  930,
			  932,    0,  932,    0,    0,  932,  932,  932,  932,  932,
			  932,  932,  936,  936,  936,  936,  931,    0,    0,    0,
			    0,    0,  929,  930,  933,    0,  933,  933,    0,  933,
			  933,  933,  933,  933,  933,    0,    0,    0,  934,    0,
			  934,  934,  932,  934,  934,  934,  934,  934,  934,    0,
			    0,  936,  940,  940,  940,  940,  940,  940,  941,  941,
			  941,  941,  941,  941,    0,    0,  933,  943,  943,  943,
			  943,  943,  943,  945,  945,  945,  945,  945,  945,    0,
			  934,  946,  946,  946,  946,  946,  946,  947,  947,  947,

			  947,  947,  947,  950,    0,  950,  950,    0,  950,  950,
			  950,  950,  950,  950,  951,  951,  951,  951,  951,  951,
			  952,  952,  952,  952,  952,  952,  941,  954,    0,  954,
			  954,    0,  954,  954,  954,  954,  954,  954,  955,  955,
			  955,  955,  955,  955,    0,  950,    0,  956,    0,  956,
			    0,  951,  956,  956,  956,  956,  956,  956,  957,  957,
			  957,  957,  957,  957,    0,    0,    0,    0,    0,  954,
			  958,  958,  958,  958,  958,  958,  959,  959,  959,  959,
			  959,  959,  960,    0,  960,    0,  956,  960,  960,  960,
			  960,  960,  960,  961,    0,  961,    0,    0,  961,  961,

			  961,  961,  961,  961,  962,  962,  962,  962,  962,  962,
			    0,    0,    0,    0,  969,  983,  983,  983,  983,  983,
			  983,  983,  983,  983,  960,  969,  969,  969,  969,  969,
			  969,  969,  969,  969,    0,  961,  964,  964,  964,  964,
			  964,  964,  964,  964,  964,  964,  964,  964,  964,  964,
			  964,  964,  964,  964,  964,  964,  964,  964,  964,  964,
			  964,  964,  964,  964,  964,  965,  965,  965,  965,  965,
			  965,  965,  965,  965,  965,  965,  965,  965,  965,  965,
			  965,  965,  965,  965,  965,  965,  965,  965,  965,  965,
			  965,  965,  965,  965,  966,  966,  966,  966,  966,  966,

			  966,  966,  966,  966,  966,  966,  966,  966,  966,  966,
			  966,  966,  966,  966,  966,  966,  966,  966,  966,  966,
			  966,  966,  966,  967,  967,    0,  967,  967,  967,  967,
			  967,  967,  967,  967,  967,  967,  967,  967,  967,  967,
			  967,  967,    0,  967,  967,  967,  967,  967,  967,  967,
			  967,  967,  968,  968,    0,  968,  968,  968,  968,  968,
			  968,  968,  968,  968,  968,  968,  968,  968,  968,  968,
			  968,  968,  968,  968,  968,  968,  968,  968,  968,  968,
			  968,  970,  970,    0,  970,    0,  970,  970,  970,    0,
			    0,  970,  970,  970,  970,  970,  970,  970,  970,  970,

			  971,  971,    0,  971,    0,  971,  971,    0,    0,    0,
			  971,  971,  971,    0,    0,  971,  971,  971,  971,  971,
			  971,  971,  971,  971,  972,  972,    0,  972,  972,  972,
			  972,  972,  972,  972,  972,  972,  972,  972,  972,  972,
			  972,  972,  972,  972,  972,  972,  972,  972,  972,  972,
			  972,  972,  972,  973,  973,    0,  973,  973,  973,  973,
			  973,  973,  973,  973,  973,  973,  973,  973,  973,  973,
			  973,  973,    0,  973,  973,  973,  973,  973,  973,  973,
			  973,  973,  974,  974,  974,  974,  974,  974,  974,  974,
			  974,  974,  974,  974,  974,  974,  974,  974,  974,  974,

			  974,  974,  974,  974,  974,  974,  974,  974,  974,  974,
			  974,  975,  975,  975,  975,  975,  975,  975,  975,  975,
			  975,  975,  975,  975,  975,  975,  975,  975,  975,  975,
			  975,  975,  975,  975,  975,  975,  975,  975,  975,  975,
			  976,    0,  976,    0,    0,    0,    0,  976,    0,  976,
			  976,    0,    0,    0,  976,  976,  976,    0,    0,  976,
			  976,  976,  976,  976,  976,  976,  976,  976,  977,  977,
			    0,  977,  977,  977,  977,  977,  977,  977,  977,  977,
			  977,  977,  977,  977,  977,  977,  977,  977,  977,  977,
			  977,  977,  977,  977,  977,  977,  977,  978,  978,  978, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  978,  978,  978,  978,  978,  978,  978,  978,  978,  978,
			  978,  978,  978,  978,  978,  978,  978,  978,  978,  978,
			  978,  978,  978,  978,  978,  978,  979,  979,  979,    0,
			    0,    0,  979,  979,  979,  979,    0,  979,  979,  979,
			  979,  979,  979,  979,  979,  979,  980,    0,    0,  980,
			  980,    0,  980,  980,  980,  980,  980,    0,    0,  980,
			  980,  980,  980,  980,  980,  980,  980,  980,  981,  981,
			    0,  981,    0,  981,  981,  981,    0,    0,  981,  981,
			  981,    0,    0,  981,  981,  981,  981,  981,  981,  981,
			  981,  981,  982,  982,    0,  982,    0,  982,  982,  982,

			    0,    0,  982,  982,  982,    0,    0,  982,  982,  982,
			  982,  982,  982,  982,  982,  982,  984,  984,  984,  984,
			  984,  984,  984,  984,  984,    0,  984,  984,  984,  984,
			  984,  984,  984,  984,  984,  984,  984,  984,  984,  984,
			  984,  984,  984,  984,  984,  985,  985,  985,  985,  985,
			  985,  985,  985,  985,  985,  985,  985,  985,  985,  985,
			  985,  985,  985,  985,  985,  985,  985,  985,  985,  985,
			  985,  985,  985,  985,  986,  986,  986,  986,  986,  986,
			  986,  986,  986,  986,  986,  986,  986,  986,  986,  986,
			  986,  986,  986,  986,  986,  986,  986,  986,  986,  986,

			  986,  986,  986,  987,  987,  987,    0,    0,    0,  987,
			  987,  987,  987,    0,  987,  987,  987,  987,  987,  987,
			  987,  987,  987,  988,  988,  988,  988,  988,  988,  988,
			  988,  988,  988,  988,  988,  988,  988,  988,  988,  988,
			  988,  988,  988,  988,  988,  988,  988,  988,  988,  988,
			  988,  988,  989,  989,    0,  989,    0,  989,  989,  989,
			    0,    0,  989,  989,  989,    0,    0,  989,  989,  989,
			  989,  989,  989,  989,  989,  989,  990,  990,    0,  990,
			    0,  990,  990,  990,    0,    0,  990,  990,  990,    0,
			    0,  990,  990,  990,  990,  990,  990,  990,  990,  990,

			  991,  991,  991,    0,    0,  991,  991,  991,  991,  991,
			  991,  991,  991,    0,    0,  991,  991,  991,    0,    0,
			  991,  991,  991,  991,  991,  991,  991,  991,  991,  992,
			    0,  992,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  992,  992,  992,    0,    0,  992,  992,
			  992,  992,  992,  992,  992,  992,  992,  993,    0,  993,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  993,  993,  993,    0,    0,  993,  993,  993,  993,
			  993,  993,  993,  993,  993,  994,  994,    0,  994,    0,
			  994,  994,  994,    0,    0,  994,  994,  994,    0,    0,

			  994,  994,  994,  994,  994,  994,  994,  994,  994,  995,
			  995,    0,    0,    0,  995,  995,  995,    0,    0,  995,
			  995,  995,  995,  995,  995,  995,  995,  995,  996,  996,
			    0,    0,    0,  996,  996,  996,    0,    0,  996,  996,
			  996,  996,  996,  996,  996,  996,  996,  997,  997,    0,
			  997,    0,  997,  997,  997,    0,    0,  997,  997,  997,
			    0,    0,  997,  997,  997,  997,  997,  997,  997,  997,
			  997,  998,  998,    0,    0,    0,  998,  998,  998,    0,
			    0,  998,  998,  998,  998,  998,  998,  998,  998,  998,
			  999,  999,    0,    0,    0,  999,  999,  999,    0,    0,

			  999,  999,  999,  999,  999,  999,  999,  999,  999, 1000,
			 1000,    0,    0,    0, 1000, 1000, 1000,    0,    0, 1000,
			 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1001, 1001,
			    0, 1001,    0, 1001, 1001, 1001,    0,    0, 1001, 1001,
			 1001,    0,    0, 1001, 1001, 1001, 1001, 1001, 1001, 1001,
			 1001, 1001, 1002, 1002, 1002,    0,    0, 1002, 1002, 1002,
			 1002, 1002, 1002, 1002, 1002, 1002, 1003, 1003,    0, 1003,
			    0, 1003, 1003, 1003,    0,    0, 1003, 1003, 1003,    0,
			    0, 1003, 1003, 1003, 1003, 1003, 1003, 1003, 1003, 1003,
			 1004, 1004, 1004,    0,    0, 1004, 1004, 1004, 1004, 1004,

			 1004, 1004, 1004, 1004, 1005, 1005, 1005,    0,    0, 1005,
			 1005, 1005, 1005, 1005, 1005, 1005, 1005, 1005, 1006, 1006,
			    0,    0,    0, 1006, 1006, 1006,    0,    0, 1006, 1006,
			 1006, 1006, 1006, 1006, 1006, 1006, 1006, 1007, 1007,    0,
			    0,    0, 1007, 1007, 1007,    0,    0, 1007, 1007, 1007,
			 1007, 1007, 1007, 1007, 1007, 1007, 1008, 1008,    0,    0,
			    0, 1008, 1008, 1008,    0,    0, 1008, 1008, 1008, 1008,
			 1008, 1008, 1008, 1008, 1008, 1009, 1009,    0, 1009,    0,
			 1009, 1009, 1009,    0,    0, 1009, 1009, 1009,    0,    0,
			 1009, 1009, 1009, 1009, 1009, 1009, 1009, 1009, 1009, 1010,

			 1010, 1010,    0,    0, 1010, 1010, 1010, 1010, 1010, 1010,
			 1010, 1010, 1010, 1011, 1011, 1011,    0,    0, 1011, 1011,
			 1011, 1011, 1011, 1011, 1011, 1011, 1011, 1012, 1012,    0,
			    0,    0, 1012, 1012, 1012,    0,    0, 1012, 1012, 1012,
			 1012, 1012, 1012, 1012, 1012, 1012, 1013, 1013,    0,    0,
			    0, 1013, 1013, 1013,    0,    0, 1013, 1013, 1013, 1013,
			 1013, 1013, 1013, 1013, 1013, 1014, 1014,    0,    0,    0,
			 1014, 1014, 1014,    0,    0, 1014, 1014, 1014, 1014, 1014,
			 1014, 1014, 1014, 1014, 1015, 1015,    0,    0,    0, 1015,
			 1015, 1015,    0,    0, 1015, 1015, 1015, 1015, 1015, 1015,

			 1015, 1015, 1015,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963, yy_Dummy>>,
			1, 896, 4000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1015)
			yy_base_template_1 (an_array)
			yy_base_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_base_template_1 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,   90,   95,   77,   79,   98,  102,  187,
			    0, 2537, 4803,  104, 2532, 2505, 2519, 4803,   86, 4803,
			 4803, 4803, 4803, 4803, 2510,  100, 2507,  266,  276, 4803,
			 4803, 2494, 4803, 2492, 4803,  100,  102,   85, 2492,  265,
			  276,   73,  267,   99,  275,  277,  334,  274,  101,  279,
			   86,  405, 4803, 4803, 2461,  471,  324,  331,  550,   95,
			  334,  111,  390,  280,  270,  330,  332,  327,  272,  327,
			 2485, 4803, 4803, 2479,  149, 4803,  107,  323,  319,  381,
			  392,  411,  326, 4803,  394,  400, 4803,  326, 2462, 2449,
			 2382, 4803,  153, 2442,  427,  432,  481, 2436, 4803, 2431,

			 4803, 2426,    0,  622, 2431, 2417,  615, 4803,  402,  543,
			  632,  664,  638,  682, 4803, 4803, 2396,    0,  409,  642,
			  414,  387,  454,  620,  530,  680,  653,  532,  147,  622,
			  681,  120,  531,  663,  682,  606, 2283,  682,  700,  702,
			  764,  728,  762,  690,  718,  727,  730,  685,  474, 2341,
			  797,  804,  826,  833, 2294, 4803,  766, 2338,    0,  880,
			 2331,  273,  394,  614, 2263,    0,  723,  733,  744,  743,
			  761,  754,  761,  772,  776,  779,  801,  780,  820,  795,
			  790,  808,  810, 2278, 2276,  813,  828, 2242,  850,  822,
			  834, 2240,  827,  830,  831,  834,  850,  852,  857,  857,

			  857,  844,  861,  848,  859,  864,  895,  865,  855,  862,
			  394,  771, 4803, 2287, 4803,  669, 4803, 4803,  901,  909,
			  914,  923,  927,  720, 4803, 2239,  914,  915, 2235,  919,
			 2235, 4803,  961, 2151, 2220, 2219,  957,  163, 1001, 2208,
			 1002,  322, 1057,  909, 4803, 4803, 4803, 2198,  964, 2197,
			 2164, 2162, 2161, 1016, 4803, 1132, 1010, 1016, 2149, 2096,
			 1022, 1138, 1155, 1165, 1028, 1183, 2133, 1137, 1138, 2120,
			 1156,  991, 1164, 1181, 1170, 1165, 1166,  412, 1184, 1188,
			 1190, 1192, 1191, 2114, 1171, 1194, 4803,  413, 1241, 1250,
			 1259, 1271, 1270, 1278, 1228,  133, 1257,  257, 1274, 1270,

			 1275,  710, 2102,  971, 2092, 1317, 1339, 1354, 1369, 1384,
			 4803,  706, 2089, 1131, 1179,    0, 2044, 1191, 1233,    0,
			 1267, 1269, 1279, 1269, 1284, 1273, 1289, 1286, 1322, 1347,
			 1343, 1337, 1340, 2039, 1351, 2038, 1384, 1359, 1363, 1365,
			 2078, 1399, 1365, 1366, 1375, 1380,    0,    0, 1375, 1393,
			 1380, 1395, 1395, 1403, 1397, 1405, 1397, 1397, 2026, 1399,
			 1400, 2025,    0,    0, 1185, 1254, 1399,  915, 1409, 1155,
			 1439, 1442, 1446, 1312, 4803, 1996, 4803, 1458, 1485, 2038,
			 1475, 4803, 1230, 1445, 2027, 4803, 4803, 1497, 4803, 4803,
			 4803, 4803, 1477, 1523, 1529, 1535, 1967, 1541, 1547, 1569,

			 1553, 1575, 1592, 1601, 1607, 1613, 1997, 1436, 1559, 1573,
			 1612, 1613, 1938, 1614, 1616, 1617, 1615, 1615, 1622, 1626,
			 1627, 1456, 1631, 1632, 1688, 1697, 1706, 1713, 1719, 1741,
			 1750, 1937, 1929, 1630, 1927, 1645, 1628, 1724,  356,  910,
			 1671, 1733, 1928, 1775, 1829, 1786, 1801, 1853, 1860, 1884,
			 1877, 1878,    0, 1532, 1410, 1793, 1533, 1419, 1534, 1611,
			 1626, 1632, 1631, 1638,    0, 1637, 1704,    0, 1718, 1757,
			 1771, 1777, 1774, 1771, 1770, 1788, 1898, 1800, 1794, 1806,
			 1857, 1850, 1851, 1852, 1854,    0,    0,    0,    0, 1862,
			 1879, 1896, 1865, 1881, 1915, 1896, 4803, 1931, 1456, 1928,

			 1474, 4803, 1939, 1948, 1954, 1960, 1877, 1969, 1979, 1986,
			 1992, 1998, 2014,  425, 2026, 2038, 2014,  948, 1847, 1273,
			 2016, 1998, 2036, 2037, 2038, 1834, 2014, 1835, 2039, 2042,
			 1772, 2045, 2048, 2051, 2068, 2104, 2113, 2079, 2076, 2083,
			 2066, 2073, 2108, 2141, 2144, 1533, 1578, 2164, 1870, 4803,
			 2179, 4803, 1929, 1787, 2194, 4803, 2209, 4803, 2224, 1726,
			    0, 1726,  956, 2231,    0, 1721, 1960, 1961, 2011, 2043,
			 2100, 2116, 2130, 2209, 2131, 2210,    0, 2154,    0, 2174,
			 2204,    0, 1758, 2241, 2204, 2208, 2208, 2211, 2201, 2233,
			 2223, 2241, 2242, 2243, 2233, 2237, 2246, 2247, 2296, 1695,

			 2304, 1482, 2312, 2318, 2324, 2335, 2341, 1690, 2350, 2356,
			 2364, 2370, 4803, 2375, 2262, 1696, 2373, 1686, 2374, 2375,
			 1675, 2376, 2375, 2380, 2379, 2381, 2384, 2386, 4803, 1675,
			 1641, 2385, 2388, 2391, 2400, 2413, 2451,    0, 2474, 2528,
			 1527, 2467, 2540,    0, 2499, 2566, 2588, 2496, 2474, 2255,
			 2554, 1584,    0,    0, 2393,    0, 2398,    0, 2398, 2418,
			    0, 2454, 2459,    0, 2464, 2481, 2502, 2495, 2532, 2524,
			 2546, 2562, 2564, 2565, 2567,    0, 2556, 2571, 2572,    0,
			 2567, 2596, 2616, 1583, 2629, 2635, 2641, 2611, 2656, 1521,
			 2662, 2668, 2675, 2596, 2673, 1486, 2640, 1476, 2672, 1449,

			 1428, 1341, 2676, 1330, 2674, 2679, 2678, 2680, 1316, 1251,
			 2715, 1235, 2731, 1969, 1224, 1740, 2739, 2662, 2747, 2669,
			 2671,    0, 2684,    0, 2687,    0,    0,    0,    0,    0,
			    0,    0, 2687,    0, 2723,    0, 2737, 2735, 2739, 2741,
			 2758, 2764, 2786, 2796, 2807, 2770, 2813, 2824, 2823, 2821,
			 2785, 2822, 4803, 2823, 2821, 2826, 2828, 1220, 2832, 2839,
			 2881,    0, 1772, 2888,    0,    0, 1220, 1823, 2894, 1214,
			 2761, 2758, 2820, 2826, 2832, 2838, 2841, 2841, 2841,    0,
			 2866, 1112, 2900, 2910, 2916, 2926, 2932, 2938, 4803, 2950,
			 2937, 2915, 1141, 2949, 4803,  962, 2938, 2947, 2948, 3004,

			  956, 2973, 4803,  861, 1297,    0, 1927, 3013, 2941, 2935,
			 2941,    0,    0, 2955, 2984,    0, 2974,    0, 3019,  812,
			 3032, 3044, 3051, 3022, 2454, 3032, 3034, 1698, 4803, 3071,
			    0, 3081,    0,    0, 3013, 1810, 2116, 3031, 3033, 2207,
			 1035, 3070, 3068,  790,  765, 3082, 3080, 3081, 3111,    0,
			    0,  742, 3036,    0,    0,    0,    0, 3069, 3129, 3136,
			 3087, 3098, 3132, 3133, 3118,  502,  732,  718, 2231, 3082,
			 3150, 3138,  706,  701,  551, 3161, 3168,    0,    0, 3123,
			    0, 3185, 3192, 4803, 3167, 3186, 3187, 3225,    0,    0,
			 3134, 3199, 3212,  533, 3210, 3213, 3246, 1298, 3252, 4803,

			  648,  654,    0, 3264, 3264,  529,  453, 3271, 3277,  938,
			 3288,    0,  393,    0,  388, 3309, 3315, 3299, 4803, 3149,
			 3294, 3327, 3334, 1476, 3341, 1507, 3351, 3357, 3363, 3358,
			 3359, 3371, 3397, 3421, 3435, 3378, 3409, 4803, 4803,  256,
			 3444, 3450,  252, 3459, 4803, 3465, 3473, 3479, 4803,  256,
			 3490, 3496, 3502,  112, 3514, 3520, 3534, 3540, 3552, 3558,
			 3569, 3580, 3586, 4803, 3635, 3664, 3693, 3722, 3751, 3604,
			 3770, 3794, 3823, 3852, 3881, 3910, 3938, 3967, 3996, 4016,
			 4038, 4062, 4086, 3594, 4115, 4144, 4173, 4193, 4222, 4246,
			 4270, 4299, 4327, 4355, 4379, 4398, 4417, 4441, 4460, 4479, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			 4498, 4522, 4536, 4560, 4574, 4588, 4607, 4626, 4645, 4669,
			 4683, 4697, 4716, 4735, 4754, 4773, yy_Dummy>>,
			1, 16, 1000)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1015)
			yy_def_template_1 (an_array)
			yy_def_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,  963,    1,  964,  964,  965,  965,  966,  966,  963,
			    9,  963,  963,  963,  963,  963,  967,  963,  968,  963,
			  963,  963,  963,  963,  963,  963,  969,  963,  963,  963,
			  963,  963,  963,  963,  963,  970,  970,  970,  970,  970,
			  970,  970,  970,  970,  970,  970,  970,  970,  970,  970,
			  970,  971,  963,  963,  972,  963,   55,   55,  963,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			  963,  963,  963,  973,  963,  963,  963,  973,  973,  973,
			  973,  973,  974,  963,  975,  974,  963,  963,  963,  963,
			  963,  963,  976,  963,  976,  976,  963,  963,  963,  967,

			  963,  977,  977,  977,  978,  963,  963,  963,  979,  963,
			  963,  963,  963,  963,  963,  963,  970,  980,  970,  970,
			  970,  970,  970,  970,  970,  970,  970,  970,  970,  970,
			  970,  970,  970,  970,  970,  970,  963,   46,  970,  970,
			  970,  970,  970,  970,  970,  970,  970,  970,  970,  981,
			  982,  982,  982,  982,  972,  963,  963,  963,  983,   58,
			  963,  159,  159,  159,  963,   58,   58,   58,   58,  159,
			   58,  159,  159,   58,   58,  159,  159,   58,   58,  159,
			  159,   58,   58,  159,   58,  159,  159,  159,   58,   58,
			   58,   58,  159,   58,  159,   58,  159,  159,   58,   58,

			  159,  159,   58,   58,  159,  159,   58,   58,  159,   58,
			  159,   58,  963,  973,  963,  963,  963,  963,  973,  973,
			  973,  973,  973,  974,  963,  984,  974,  975,  985,  975,
			  984,  963,  963,  963,  963,  986,  963,  976,  976,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  969,  963,
			  963,  963,  963,  963,  963,  963,  980,  970,  970,  970,
			  970,  970,  970,  970,  970,  970,  970,  970,  963,  970,
			  970,  970,  970,  970,  970,  970,  963,  970,  970,  970,
			  970,  140,  140,  970,  970,  970,  970,  970,  970,  970,

			  970,  970,  970,  970,  963,  982,  982,  982,  982,  982,
			  963,  987,  963,  159,  159,  159,  963,   58,   58,   58,
			  159,   58,  159,  159,   58,   58,  159,  159,  159,   58,
			   58,   58,  159,  159,   58,   58,  963,  159,  159,  159,
			  159,  159,   58,   58,  159,   58,  159,   58,  159,  159,
			   58,   58,  159,  159,   58,   58,  159,  159,  159,   58,
			   58,   58,  159,   58,  159,   58,  973,  973,  973,  973,
			  973,  973,  973,  984,  963,  985,  963,  963,  963,  988,
			  988,  963,  988,  988,  988,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,

			  963,  963,  963,  963,  963,  963,  980,  970,  970,  970,
			  970,  970,  970,  970,  970,  970,  970,  963,  970,  970,
			  970,  970,  970,  970,  970,  970,  425,  425,  963,  970,
			  970,  970,  970,  963,  970,  970,  970,  970,  970,  963,
			  989,  990,  963,  982,  982,  982,  444,  982,  444,  444,
			  982,  963,  991,  159,  159,  963,   58,   58,  159,   58,
			  159,  159,   58,   58,  159,  159,  159,   58,   58,   58,
			  159,  159,   58,  159,  159,  159,  963,   58,   58,  159,
			   58,  159,  159,   58,   58,  159,  159,   58,   58,  159,
			  159,  159,   58,   58,  159,   58,  963,  963,  963,  963,

			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  970,  970,
			  970,  970,  970,  970,  970,  970,  970,  963,  970,  970,
			  970,  970,  970,  970,  963,  970,  535,  963,  970,  970,
			  970,  970,  963,  989,  990,  992,  963,  990,  963,  963,
			  990,  963,  963,  993,  990,  963,  990,  963,  982,  963,
			  159,  159,  963,  963,   58,   58,  159,   58,  159,  159,
			   58,   58,  159,  159,   58,   58,  159,  159,   58,  159,
			  159,  159,  963,  963,   58,   58,  159,   58,  159,  159,
			   58,   58,  159,  159,  159,  159,   58,   58,  963,  963,

			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  970,  970,  970,  970,  970,  970,
			  970,  970,  963,  970,  970,  970,  970,  970,  963,  963,
			  970,  970,  970,  970,  963,  963,  994,  995,  990,  990,
			  963,  990,  639,  996,  990,  639,  639,  982,  963,  159,
			  963,  963,  159,   58,  159,  159,   58,   58,  159,  159,
			  159,   58,   58,   58,  159,  159,  159,   58,   58,  159,
			   58,  159,  159,   58,   58,  159,  159,  159,  159,   58,
			   58,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  970,  970,  970,  970,  970,  963,  970,

			  970,  970,  970,  970,  963,  970,  970,  970,  963,  963,
			  997,  995,  963,  996,  963,  963,  963,  159,  963,  159,
			   58,  159,  159,   58,   58,  159,  159,  159,   58,   58,
			  159,   58,  159,  159,   58,   58,  159,  159,  159,   58,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  970,
			  970,  970,  963,  970,  963,  970,  970,  970,  963,  963,
			  997,  998,  963,  963,  999, 1000,  963,  992,  963,  963,
			  159,  159,   58,  159,   58,  159,   58,  159,  159,  159,
			   58,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  970,  970,  970,  970,  963,  970,  970,  963,  963, 1001,

			  998,  963,  963,  999, 1000, 1002,  963,  963,  159,  159,
			   58,  159,   58,  159,   58,  159,  159,   58,  963,  963,
			  963,  963,  963,  970,  970,  970,  970,  963,  963, 1003,
			 1004,  963, 1005, 1006,  159,  159,   58,  159,   58,  159,
			  963,  963,  970,  970,  970,  970,  963,  963, 1003, 1007,
			 1008, 1006,  159,  159,   58,  159,   58,  159,  963,  963,
			  970,  970,  963,  963, 1009,  981, 1007, 1008,  159,  159,
			  963,  970,  970,  963,  963, 1009,  981, 1010, 1011,  159,
			  159,  963,  963,  963,  970,  963,  963,  981, 1012, 1013,
			  159,  963,  963,  970,  963,  963,  963,  981,  981,  963,

			 1012, 1013,  159,  963,  963,  963,  963,  963,  963,  981,
			  981, 1014,  963, 1015,  963,  963,  963,  963,  963,  963,
			  963,  981,  981, 1014,  963, 1015,  963,  963,  963,  963,
			  963,  981,  981,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,    0,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  963,  963,  963,  963,  963,  963,  963,  963,  963,  963,
			  963,  963,  963,  963,  963,  963, yy_Dummy>>,
			1, 16, 1000)
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
			    0,    0,    0,    0,    0,  107,  107,    0,    0,    0,
			    0,  138,  136,    1,    2,   15,  120,   18,  136,   16,
			   17,    7,    6,   13,    5,   11,    8,  112,  112,   14,
			   12,   28,   10,   29,   19,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,   92,  100,  100,  100,
			  100,   21,   30,   22,    9,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			   23,   20,   24,  124,  125,  126,  127,  124,  124,  124,
			  124,  124,  107,  110,  137,  107,   74,   74,   71,   74,
			   74,   81,   81,   78,   81,   81,    1,    2,   27,  120,

			  119,  134,  134,  134,    3,   32,  118,   31,  104,    0,
			    0,  112,    0,  112,   26,   25,  100,    0,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,   39,    0,  100,   99,   99,
			   91,   99,   99,  100,  100,  100,  100,  100,  100,    0,
			    0,    0,    0,    0,    0,  111,    0,    0,    0,  103,
			    0,  103,  103,  103,    0,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,   39,  103,   39,

			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  106,  124,  126,  125,  122,  121,  123,  124,
			  124,  124,  124,  107,  110,    0,  107,    0,    0,    0,
			  108,  109,    0,    0,   71,    0,    0,    0,    0,   78,
			    0,   77,    0,   76,   80,  134,  128,  134,  134,  134,
			  134,  134,  134,    4,   33,  118,    0,    0,    0,    0,
			    0,  114,    0,  112,    0,    0,    0,  100,  100,   38,
			  100,  100,  100,  100,  100,  100,  100,  100,    0,  100,
			  100,  100,  100,   41,  100,  100,   98,   92,   92,   92,
			   92,   99,  100,   99,   99,   99,  100,  100,  100,  100,

			  100,  100,   40,  100,    0,    0,    0,    0,    0,    0,
			  102,  105,    0,  103,  103,   38,    0,  103,  103,   38,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,    0,  103,  103,  103,
			   64,   64,  103,  103,  103,  103,   41,   41,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,   40,   40,  103,  103,  124,  124,  124,  124,
			  124,  124,  124,    0,  108,  109,   72,    0,    0,    0,
			    0,   79,   77,   76,   80,  132,  135,  135,  133,  129,
			  130,  131,  118,    0,  118,    0,    0,    0,  114,    0,

			    0,    0,  117,  112,    0,    0,  101,  100,  100,  100,
			  100,  100,   37,  100,  100,  100,  100,    0,  100,  100,
			  100,  100,  100,  100,   91,  100,  100,  100,    0,   91,
			   91,   91,   36,    0,   43,  100,  100,  100,  100,   75,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,   61,  103,  103,    0,  103,  103,  103,  103,
			  103,  103,  103,  103,   37,  103,  103,   37,  103,  103,
			  103,  103,  103,  103,  103,  103,    0,  103,  103,  103,
			  103,  103,  103,  103,  103,   36,   43,   36,   43,  103,
			  103,  103,  103,  103,  103,  103,  109,    0,   70,    0,

			   69,   73,  118,    0,    0,    0,  113,  114,    0,  115,
			    0,  117,    0,    0,    0,  112,   88,    0,   58,  100,
			  100,  100,  100,  100,  100,   44,  100,    0,  100,  100,
			   35,  100,  100,  100,    0,  100,  100,    0,  100,  100,
			  100,  100,    0,    0,    0,   75,    0,    0,    0,   65,
			    0,   66,    0,    0,    0,   63,    0,   62,    0,    0,
			   58,  103,    0,    0,   58,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,   44,  103,   44,  103,
			  103,   35,   64,   64,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,    0,  118,

			    0,    0,    0,  114,  115,    0,    0,  117,    0,    0,
			    0,    0,   88,    0,  100,   59,  100,   60,  100,  100,
			   46,  100,    0,  100,  100,  100,  100,  100,   91,    0,
			   52,  100,  100,  100,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  103,
			    0,    0,   59,   59,  103,   60,  103,   60,  103,  103,
			   46,  103,  103,   46,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,   52,  103,  103,  103,   52,
			  103,    0,    0,  104,    0,  115,    0,  118,    0,   90,
			    0,    0,  116,  100,  100,   57,  100,   45,    0,   42,

			   56,   34,  100,   50,    0,  100,  100,  100,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  103,    0,  103,
			  103,   57,  103,   57,  103,   45,   42,   56,   42,   56,
			   34,   34,  103,   50,  103,   50,  103,  103,  103,  103,
			    0,    0,  115,    0,    0,    0,    0,   87,  116,  100,
			  100,  100,   95,  100,    0,  100,  100,   53,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,   68,    0,  105,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,   53,
			  103,  117,    0,  117,    0,    0,    0,    0,   87,  116,
			  100,  100,   47,  100,   94,   51,  100,    0,    0,    0,

			    0,    0,   67,    0,    0,    0,   68,    0,  103,  103,
			  103,   47,   47,  103,  103,   51,  103,   51,  117,   89,
			    0,   87,  116,  100,  100,  100,  100,   93,   93,    0,
			    0,    0,    0,    0,  103,  103,  103,  103,  103,  103,
			    0,    0,  100,   49,   48,  100,    0,    0,    0,    0,
			    0,    0,  103,   49,   49,   48,   48,  103,    0,    0,
			  100,  100,    0,    0,    0,    0,    0,    0,  103,  103,
			   86,  100,   54,    0,    0,    0,    0,    0,    0,  103,
			   54,    0,    0,   86,  100,    0,    0,    0,    0,    0,
			  103,    0,    0,   55,    0,    0,    0,    0,    0,   83,

			    0,    0,   55,    0,   85,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,   85,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,   84,   96,   97,    0,
			    0,    0,    0,    0,   82,    0,    0,    0,   84,    0,
			    0,    0,    0,    0,    0,    0,   84,    0,    0,    0,
			    0,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 4803
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 963
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 964
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
