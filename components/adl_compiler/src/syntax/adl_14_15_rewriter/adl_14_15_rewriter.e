note
	component:   "openEHR ADL Tools"
	description: "Stream rewriter for ADL 1.4 and transitional ADL 1.5 archetypes containing old style 0-filled at- and ac-codes"
	keywords:    "transformation, archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ADL_14_15_REWRITER

inherit
	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton,
			output as print_out
		end

	ADL_14_TERM_CODE_TOOLS
		export
			{NONE} all
		end

	ADL_15_TERM_CODE_TOOLS
		export
			{NONE} all
		end

create
	make

feature -- Status report

	valid_start_condition (sc: INTEGER): BOOLEAN
			-- Is `sc' a valid start condition?
		do
			Result := (INITIAL <= sc and sc <= IN_PATH)
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
if yy_act <= 30 then
if yy_act <= 15 then
if yy_act <= 8 then
if yy_act <= 4 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 65 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 65")
end
out_buffer.append (text)
else
--|#line 67 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 67")
end
out_buffer.append (text)			-- pass separate comment line endings
end
else
if yy_act = 3 then
--|#line 71 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 71")
end

		out_buffer.append ("terminology%N")
		in_terminology := True
	
else
--|#line 76 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 76")
end

		out_buffer.append (text)
	
end
end
else
if yy_act <= 6 then
if yy_act = 5 then
--|#line 82 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 82")
end

		out_buffer.append_character ('[')
		output_new_id_code (text_substring (2, text_count - 1))
		out_buffer.append_character (']')
	
else
--|#line 88 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 88")
end

		out_buffer.append_character ('[')
		output_new_id_code (text_substring (2, text_count - 1))
		out_buffer.append_character (']')
	
end
else
if yy_act = 7 then
--|#line 95 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 95")
end

		out_buffer.append_character ('[')
		output_new_id_code (text_substring (2, text_count))
	
else
--|#line 100 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 100")
end

		out_buffer.append_character ('[')
		out_buffer.append (Local_terminology_id + "::")
		output_new_at_ac_code (text_substring (2, text_count - 1))
		out_buffer.append_character (']')
	
end
end
end
else
if yy_act <= 12 then
if yy_act <= 10 then
if yy_act = 9 then
--|#line 107 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 107")
end

		out_buffer.append (text)
	
else
--|#line 113 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 113")
end

		output_converted_code_dt_key (text_substring (3, text_count - 2))
	
end
else
if yy_act = 11 then
--|#line 117 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 117")
end

		output_converted_code_dt_key (text_substring (3, text_count - 2))
	
else
--|#line 121 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 121")
end

		output_converted_code_dt_key (text_substring (3, text_count - 2))
	
end
end
else
if yy_act <= 14 then
if yy_act = 13 then
--|#line 126 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 126")
end

		out_buffer.append (text)
	
else
--|#line 130 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 130")
end
		-- match [{
		out_buffer.append (text)
		set_start_condition (IN_TUPLE)
	
end
else
--|#line 136 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 136")
end
 		-- strings and lists of strings
		out_buffer.append (text)
	
end
end
end
else
if yy_act <= 23 then
if yy_act <= 19 then
if yy_act <= 17 then
if yy_act = 16 then
--|#line 140 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 140")
end
 							-- interior }, { pattern
		out_buffer.append (text)
	
else
--|#line 144 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 144")
end
			-- numbers and lists of numbers and symbols (e.g. in intervals)
		out_buffer.append (text)
	
end
else
if yy_act = 18 then
--|#line 148 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 148")
end
						-- ADL codes
		out_buffer.append ("[local::")
		output_new_at_ac_code (text_substring (9, text_count-1))
		out_buffer.append_character (']')
	
else
--|#line 154 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 154")
end
				-- other codes
		out_buffer.append (text)
	
end
end
else
if yy_act <= 21 then
if yy_act = 20 then
--|#line 158 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 158")
end
out_buffer.append (text)			-- pass separate comment lines
else
--|#line 160 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 160")
end
										-- match [{
		out_buffer.append (text)
	
end
else
if yy_act = 22 then
--|#line 164 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 164")
end
						-- termination of interior tuple line }],\n with optional comment
		out_buffer.append (text)
		set_start_condition (INITIAL)
	
else
--|#line 169 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 169")
end
						-- termination of final tuple line }]\n with optional comment
		out_buffer.append (text)
		set_start_condition (INITIAL)
	
end
end
end
else
if yy_act <= 27 then
if yy_act <= 25 then
if yy_act = 24 then
--|#line 187 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 187")
end
						-- ADL codes
	out_buffer.append ("[local::")
	output_new_at_ac_code (text_substring (9, text_count-1))
	out_buffer.append_character (']')

else
--|#line 193 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 193")
end

		out_buffer.append (text)
		set_start_condition (IN_ADL_VALUE_SET_DEF)
	
end
else
if yy_act = 26 then
--|#line 199 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 199")
end
 -- match second last line with ';' termination (assumed value)
		output_new_at_ac_code (text)
	
else
--|#line 203 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 203")
end
out_buffer.append (text)
end
end
else
if yy_act <= 29 then
if yy_act = 28 then
--|#line 206 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 206")
end
out_buffer.append (text)
else
--|#line 208 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 208")
end

		out_buffer.append (text)
		set_start_condition (INITIAL)
	
end
else
--|#line 216 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 216")
end
 
		if in_terminology then
			create term_code.make_from_string (text.substring (2, text_count - 1))
			out_buffer.append (term_code_to_uri (term_code))
		else
			out_buffer.append (text)
		end
	
end
end
end
end
else
if yy_act <= 45 then
if yy_act <= 38 then
if yy_act <= 34 then
if yy_act <= 32 then
if yy_act = 31 then
--|#line 237 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 237")
end

		out_buffer.append (text)
		set_start_condition (IN_VALUE_SET_DEF)
	
else
--|#line 242 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 242")
end

		out_buffer.append (text)
		set_start_condition (IN_VALUE_SET_DEF)
	
end
else
if yy_act = 33 then
--|#line 248 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 248")
end
 
		out_buffer.append (text)
	
else
--|#line 252 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 252")
end

		out_buffer.append (text)
	
end
end
else
if yy_act <= 36 then
if yy_act = 35 then
--|#line 257 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 257")
end
out_buffer.append (text)
else
--|#line 259 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 259")
end

		out_buffer.append (text)
		set_start_condition (INITIAL)
	
end
else
if yy_act = 37 then
--|#line 266 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 266")
end

	out_buffer.append (text)
	set_start_condition (IN_PATH)

else
--|#line 271 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 271")
end

	out_buffer.append (text)
	set_start_condition (IN_PATH)

end
end
end
else
if yy_act <= 42 then
if yy_act <= 40 then
if yy_act = 39 then
--|#line 277 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 277")
end
 
		out_buffer.append (text)
	
else
--|#line 281 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 281")
end
 
		out_buffer.append_character ('[')
		output_new_id_code (text_substring (2, text_count - 1))
		out_buffer.append_character (']')
	
end
else
if yy_act = 41 then
--|#line 287 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 287")
end

		out_buffer.append (text)
	
else
--|#line 291 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 291")
end

		out_buffer.append (text)
		set_start_condition (INITIAL)
	
end
end
else
if yy_act <= 44 then
if yy_act = 43 then
--|#line 296 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 296")
end

		out_buffer.append (text)
		set_start_condition (INITIAL)
	
else
--|#line 304 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 304")
end
out_buffer.append (text)
end
else
--|#line 306 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 306")
end
out_buffer.append (text)
end
end
end
else
if yy_act <= 52 then
if yy_act <= 49 then
if yy_act <= 47 then
if yy_act = 46 then
--|#line 309 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 309")
end

		out_buffer.append (text)
	
else
--|#line 314 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 314")
end

		out_buffer.append (text)
	
end
else
if yy_act = 48 then
--|#line 318 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 318")
end
				-- beginning of a string
		out_buffer.append (text)
		set_start_condition (IN_STR)
	
else
--|#line 324 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 324")
end
out_buffer.append (text)
end
end
else
if yy_act <= 51 then
if yy_act = 50 then
--|#line 326 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 326")
end
out_buffer.append (text)
else
--|#line 328 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 328")
end

				out_buffer.append (text)
	
end
else
--|#line 332 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 332")
end
out_buffer.append (text)
end
end
else
if yy_act <= 56 then
if yy_act <= 54 then
if yy_act = 53 then
--|#line 334 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 334")
end

				out_buffer.append (text)
	
else
--|#line 338 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 338")
end
						-- match final end of string
				out_buffer.append (text)
				set_start_condition (INITIAL)
	
end
else
if yy_act = 55 then
--|#line 343 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 343")
end
	-- Catch-all rules (no backing up)
				set_start_condition (INITIAL)
	
else
--|#line 351 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 351")
end
		-- read non '[' non-space characters followed by whitespace then '['
		out_buffer.append (text)
	
end
end
else
if yy_act <= 58 then
if yy_act = 57 then
--|#line 355 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 355")
end
						-- read non '[' non-space characters followed by whitespace then '['
		out_buffer.append (text)
	
else
--|#line 361 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 361")
end
;
end
else
--|#line 0 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 0")
end
default_action
end
end
end
end
end
			yy_set_beginning_of_line
		end

	yy_execute_eof_action (yy_sc: INTEGER)
			-- Execute EOF semantic action.
		do
			inspect yy_sc
when 0, 1, 2, 4, 5 then
--|#line 0 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 0")
end
terminate
when 3 then
--|#line 0 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 0")
end
	-- Catch-all rules (no backing up)
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
			create an_array.make_filled (0, 0, 2569)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			yy_nxt_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,   14,   15,   16,   17,   15,   18,   14,   14,   14,
			   19,   14,   20,   14,   14,   14,   14,   14,   14,   21,
			   21,   21,   21,   21,   21,   21,   22,   14,   14,   14,
			   21,   21,   21,   21,   21,   21,   21,   21,   14,   14,
			   14,   14,   14,   14,   14,   14,   14,   14,   23,  240,
			   24,   23,   57,   91,   57,   57,  290,  117,  118,   25,
			   25,   25,   89,  119,  255,   26,   26,   26,   26,   27,
			   26,   26,  196,  196,   92,   25,   26,   26,   26,   27,
			   26,   26,   26,   26,   29,   29,   57,   29,   57,   57,
			  228,   29,   30,   58,   59,   59,   58,  126,   94,   29,

			  126,   60,   59,   59,   59,   59,   59,   59,   59,   59,
			   31,  255,   32,   29,   29,   57,   29,   57,   57,  195,
			   29,   30,  195,   63,   74,   59,   75,   74,   29,  135,
			  136,  136,   76,   75,   59,   75,   75,  195,  285,   31,
			  195,   32,   28,   33,   33,   28,   33,   28,   28,   28,
			   33,   34,   35,   28,   35,   35,   35,   28,   33,   28,
			   35,   35,   35,   35,   35,   35,   35,   28,   28,   36,
			   35,   35,   35,   35,   35,   35,   35,   35,   35,   28,
			   28,   28,   28,   28,   28,   28,   28,   28,   28,   38,
			   82,   82,   39,   82,  118,   85,   85,   82,   85,  119,

			   89,   90,   85,   90,   90,   82,   89,  283,  101,   89,
			   85,  101,   89,   40,   57,  102,   57,   57,   57,  104,
			   57,   57,  104,   59,   59,   59,   59,  291,  292,   41,
			   42,   43,   44,   45,   38,   96,   96,   39,  291,  292,
			   93,   93,   93,   95,   95,   95,   97,   97,   97,  106,
			  172,  173,  173,   65,  108,  107,   65,  108,   40,  272,
			  124,  109,   58,   59,   59,   58,  270,  127,  163,  130,
			   60,  127,  164,  204,   41,   42,   43,   44,   45,   46,
			  110,  312,  197,   47,   48,  197,   48,   48,   48,   72,
			  207,   48,  115,  116,  115,  115,  114,  125,  104,   49,

			  125,  104,   67,  255,  126,   67,   67,  131,  361,  131,
			  131,  124,   50,   46,  264,  263,  114,   47,   48,  216,
			   48,   48,   48,  125,  221,   48,  125,  255,   67,  222,
			  126,   67,   67,   49,  107,  250,  218,  124,   75,   59,
			   75,   75,   77,   78,   77,   77,   50,   28,   51,   51,
			   51,   51,   52,   28,   28,   28,   28,   28,   53,   54,
			   54,   54,   28,   28,   28,   54,   54,   54,   54,   54,
			   54,   54,   55,   28,   28,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   28,   28,   28,   28,   28,   28,
			   28,   28,   28,   28,   57,  246,   57,   57,  117,  118,

			   74,   59,   75,   74,  119,   64,   64,   64,   76,  117,
			   89,   64,   64,   64,   64,   64,   64,   64,  127,  127,
			  127,   64,   64,   64,   64,   64,   64,   64,   64,   64,
			   65,  117,  118,   65,   66,   67,  174,  119,   67,   67,
			  182,   68,   68,   68,  241,  133,   94,   69,   69,   69,
			   69,   69,   69,   69,  267,  196,  133,   68,   70,   69,
			   71,   69,   69,   69,   69,   69,   72,   56,   77,   78,
			   77,   77,  228,   56,   56,   56,   56,   56,   56,   79,
			   79,   79,   56,   56,   56,   79,   79,   79,   79,   79,
			   79,   79,   89,   56,   56,   79,   79,   79,   79,   79,

			   79,   79,   79,   79,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   80,   80,   80,  178,  178,  178,
			   80,   80,   80,   80,   80,   80,   80,   96,   96,  124,
			   80,   80,   80,   80,   80,   80,   80,   80,   80,  120,
			  185,  186,  186,  120,  353,  121,  120,  120,  121,  121,
			  122,  121,  121,  121,  120,  120,  120,  121,  121,  121,
			  121,  121,  121,  121,  120,  120,  240,  121,  123,  121,
			  121,  121,  121,  121,  121,  121,  120,  120,  120,  120,
			  120,  120,  120,  120,  120,  120,  125,  224,  177,  125,
			  154,   67,  225,  126,   67,   67,  131,  361,  131,  131,

			  124,  274,   82,   82,  132,   82,  275,   85,   85,   82,
			   85,  191,  192,  192,   85,  128,  215,   82,   90,  129,
			   90,   90,   85,  137,  137,  138,  137,  137,  137,  137,
			  137,  137,   86,   86,  137,   86,   86,   86,  137,  137,
			  137,   86,   86,   86,   86,   86,   86,   86,  137,  137,
			  137,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			  137,  137,  137,  137,  137,  137,  137,  137,  137,  137,
			   89,  268,  146,  101,  279,  146,  101,  279,   89,  147,
			  102,   89,  102,  101,   89,  102,  101,   89,  269,  361,
			  102,  149,  361,  149,  149,  149,  109,  125,  149,  109,

			  125,  214,  147,  150,  126,  147,  179,  139,  140,  141,
			  142,  143,   93,   93,   93,   93,   93,   93,  144,  144,
			  144,  145,  145,  145,  108,  361,  131,  108,  131,  131,
			   89,  109,  152,  153,  154,   57,  153,   57,   57,  196,
			  155,  156,  115,  116,  115,  115,  193,  194,  194,  160,
			  110,  158,  158,  158,   99,   89,  228,  158,  158,  158,
			  158,  158,  158,  158,   93,   93,   93,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  159,  159,  159,  202,
			  202,  202,  159,  159,  159,  159,  159,  159,  159,   95,
			   95,   95,  159,  159,  159,  159,  159,  159,  159,  159,

			  159,  120,  206,  206,  206,  120,  162,  121,  120,  120,
			  121,  121,  120,  121,  121,  121,  120,  120,  120,  121,
			  121,  121,  121,  121,  121,  121,  120,  120,  200,  121,
			  121,  121,  121,  121,  121,  121,  121,  121,  120,  120,
			  120,  120,  120,  120,  120,  120,  120,  120,  167,  168,
			   89,  361,  190,   89,  169,  307,   89,  175,  116,  175,
			  175,  114,  177,  189,  178,  178,  178,  187,  240,  127,
			  117,  118,  324,  127,  167,  168,  119,  170,  171,  171,
			  169,  114,  184,  176,   97,   97,   97,   93,   93,   93,
			   93,   93,   93,  176,  181,  127,  117,  118,  124,  127,

			  137,  137,  119,  137,  137,  137,  180,  209,  165,  137,
			  137,  137,  137,  137,  137,  137,  351,  161,  209,  137,
			  137,  137,  137,  137,  137,  137,  137,  137,  146,  101,
			   67,  146,  101,   67,   67,  147,  102,  153,  154,  124,
			  153,  155,  182,  161,  155,  156,  116,  157,  361,  183,
			   57,  361,   57,   57,   67,  126,  151,   67,   67,  127,
			  127,  127,  148,  124,  210,  211,  211,  188,  188,  188,
			  188,  188,  188,  188,  197,  304,  208,  315,  188,  188,
			  188,  188,  188,  188,  188,  188,  201,   99,  202,  202,
			  202,  204,  306,  205,  206,  206,  175,  116,  175,  175, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  212,  212,  212,  203,  217,  217,  217,  216,  207,  217,
			  217,  217,  221,  223,  223,  223,   89,  222,  307,  223,
			  223,  223,  134,  124,  218,  219,  219,  219,  219,  219,
			  219,  219,  227,  227,  227,  309,  219,  219,  219,  219,
			  219,  219,  219,  219,  220,  220,  220,  233,  233,  233,
			  220,  220,  220,  220,  220,  220,  220,  234,  235,  235,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  224,
			  361,  196,  196,  361,  225,   62,  226,  227,  227,   67,
			  114,   67,  229,   67,   67,  168,  113,  111,  124,  228,
			  169,  236,  237,  237,  100,   67,  228,  195,   67,   67,

			  195,  231,  232,  232,  124,  196,  196,   99,  196,  196,
			  196,  237,  237,  237,  127,  127,  127,  117,  118,  210,
			  210,  210,   89,  119,  196,  177,   86,  211,  211,  211,
			  239,   84,   83,  238,  242,  243,  243,  244,  244,  244,
			  239,  245,  245,  245,  247,  248,  248,  245,  245,  245,
			  245,  245,  245,  245,  249,  249,  249,  245,  245,  245,
			  245,  245,  245,  245,  245,  245,  251,  252,  252,  253,
			  254,  254,  254,  254,  254,   67,   81,   62,   67,   67,
			  361,   67,   67,   67,  124,   67,  361,  361,   67,  201,
			  232,  232,  232,  361,  169,  361,  361,   67,  258,  258,

			  258,  204,  361,  235,  235,  235,  203,  259,  260,  260,
			  260,  260,  260,  127,  127,  127,  261,  361,  207,  117,
			  118,  242,  242,  242,  216,  119,  243,  243,  243,  262,
			  221,  247,  247,  247,  361,  222,  361,  248,  248,  248,
			  224,  218,  265,  251,  251,  225,  361,  252,  252,  252,
			  251,  251,  251,   67,  288,  196,   67,   67,  234,  278,
			  235,  201,  124,  127,  127,  127,  268,  361,  127,  127,
			  127,  204,  228,  127,  127,  127,  117,  118,  203,  361,
			  361,   67,  119,  269,   67,  276,  361,  361,  207,  361,
			  124,  271,  273,  273,  273,  273,  273,  273,  273,  251,

			  286,  252,  361,  273,  273,  273,  273,  273,  273,  273,
			  273,  279,  196,  196,  279,  281,  282,  281,  281,  196,
			  196,  361,  196,  196,  196,  361,  281,  282,  281,  281,
			  228,  297,  298,  298,  117,  118,  361,  289,  196,  280,
			  119,  284,  284,  284,  361,  361,  240,  284,  284,  284,
			  284,  284,  284,  284,  316,  316,  316,  284,  284,  284,
			  284,  284,  284,  284,  284,  284,   67,  361,  361,   67,
			   67,  274,   67,   67,   67,  124,  275,  361,  252,  252,
			  252,   67,  361,  361,   67,   67,  196,  196,   67,  361,
			  124,  196,  196,  361,  196,  196,  196,  267,  196,  361,

			  295,  296,  296,   67,  228,  361,  301,  302,  361,  228,
			  196,   57,  124,   57,   57,  228,  299,  299,  299,  317,
			  318,  318,  299,  299,  299,  299,  299,  299,  299,  361,
			  196,  313,  299,  299,  299,  299,  299,  299,  299,  299,
			  299,  304,  361,  305,  305,  305,  300,  307,  228,  308,
			  308,  308,  196,  196,   57,  361,   57,   57,  306,   67,
			  361,  361,   67,   67,  309,  310,  310,  310,  124,  361,
			  228,  361,  361,  319,  319,  319,   57,  361,   57,   57,
			  314,  315,  315,  361,  361,  320,  361,  310,  310,  310,
			   67,  361,  361,  301,  302,  228,  323,  323,  323,  124,

			  321,  321,  321,  124,  196,  196,  361,  196,  196,  196,
			  361,  361,  307,  361,  318,  318,  318,  332,  333,  304,
			  196,  196,  228,  196,  325,  325,  325,  361,   57,  324,
			   57,   57,  257,  257,  257,  228,  306,  361,  228,  326,
			  326,  326,  327,  361,  321,  321,  321,  124,  361,   57,
			  361,   57,   57,  331,  331,  331,  124,  361,  330,  328,
			  326,  326,  326,   57,  361,   57,   57,  335,  361,  331,
			  331,  331,  124,  361,  334,  334,  334,  196,  196,  196,
			   67,  361,  340,  340,  340,  332,  333,  341,  341,  341,
			  361,   57,  361,   57,   57,  361,   57,  361,   57,   57,

			  361,  337,   57,  228,   57,   57,  361,  361,  338,   57,
			  339,   57,   57,  334,  334,  334,  361,  349,  349,  349,
			  342,  342,  342,  344,  345,  343,  346,   67,  361,  340,
			  340,  340,  347,  361,  341,  341,  341,  361,  361,   57,
			  350,   57,   57,  343,   57,  361,   57,   57,  361,  348,
			  342,  342,  342,  361,  361,  342,  342,  342,  352,  352,
			  352,  349,  349,  349,  349,  349,  349,  354,  361,  352,
			  352,  352,  355,  355,  355,  124,  328,  356,  356,  356,
			   67,  361,  355,  355,  355,  345,  361,  357,  361,  361,
			  356,  356,  356,  196,  196,  196,  361,  196,  196,  196,

			  360,  360,  360,  360,  360,  360,  361,  361,  361,  361,
			  361,  361,  361,  361,  358,  359,  361,  361,  348,   28,
			   28,   28,   28,   28,   28,   28,   28,   28,   28,   28,
			   28,   28,   28,   28,   28,   28,   28,   28,   28,   28,
			   28,   28,   37,   37,   37,   37,   37,   37,   37,   37,
			   37,   37,   37,   37,   37,   37,   37,   37,   37,   37,
			   37,   37,   37,   37,   37,   56,   56,  361,   56,   56,
			  361,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,  361,   56,   56,   56,   56,   56,   56,   61,   61,
			  361,   61,   61,   61,   61,   61,   61,   61,   61,   61,

			   61,   61,   61,   61,   61,  361,   61,   61,   61,   61,
			   61,   73,   73,   73,   73,   73,  361,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,  361,   73,   73,
			   73,   73,   73,   73,   87,   87,   87,   87,   87,  361,
			  361,   87,  361,  361,  361,   87,   87,   87,   88,   88,
			  361,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,  361,   88,   88,   88,   88,
			   88,   98,   98,  361,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,  361,   98,
			   98,   98,   98,   98,  103,  361,  361,  103,  361,  361,

			  103,  361,  103,  103,  103,  103,  361,  103,  105,  361,
			  361,  105,  361,  361,  361,  361,  361,  105,  105,  105,
			  361,  361,  105,  361,  361,  361,  105,  105,  105,  105,
			  112,  112,  112,  361,  361,  112,  361,  361,  361,  112,
			  112,  112,   63,   63,   63,   63,   63,   63,   63,   63,
			   63,   63,   63,   63,   63,   63,   63,   63,   63,   63,
			   63,   63,   63,   63,   63,   67,  361,   67,   67,   67,
			   67,   67,   67,  361,   67,  361,  361,  361,   67,   67,
			   67,   68,  361,  361,   68,  361,   68,   68,   68,   68,
			   68,   68,   68,   68,  361,   68,  361,  361,  361,   68, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			   68,   68,  127,  361,  361,  127,  361,  127,  127,  127,
			  127,  127,  127,  127,  127,  361,  127,  361,  361,  361,
			  127,  127,  127,   83,   83,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  114,
			  114,  114,  114,  114,  114,  114,  114,  114,  114,  114,
			  114,  114,  114,  114,  114,  114,  114,  114,  114,  114,
			  114,  114,  120,  361,  361,  361,  120,  120,  120,  120,

			  120,  120,  120,  120,  120,  120,  120,  120,  120,  120,
			  361,  120,  120,  120,  120,  166,  361,  361,  166,  361,
			  361,  361,  361,  361,  166,  166,  166,  361,  361,  166,
			  361,  361,  361,  166,  166,  166,  132,  132,  132,  132,
			  132,  132,  132,  132,  132,  132,  132,  132,  132,  132,
			  132,  132,  132,  132,  132,  132,  132,  132,  132,  149,
			  361,  361,  149,  361,  361,  149,  361,  149,  149,  149,
			  149,  361,  149,  196,  361,  361,  196,  361,  361,  361,
			  196,  196,  196,  196,  196,  361,  361,  196,  361,  361,
			  361,  196,  196,  196,  198,  361,  198,  198,  198,  198,

			  198,  198,  361,  198,  361,  361,  361,  198,  198,  198,
			  199,  361,  199,  199,  199,  199,  199,  199,  361,  199,
			  361,  361,  361,  199,  199,  199,  179,  179,  361,  179,
			  179,  179,  179,  179,  179,  179,  179,  179,  179,  179,
			  179,  179,  179,  361,  179,  179,  179,  179,  179,  213,
			  213,  213,  361,  361,  213,  361,  361,  361,  213,  213,
			  213,  184,  184,  184,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,  184,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,  184,  230,  361,  361,  230,  361,  361,
			  361,  230,  230,  230,  230,  230,  361,  361,  230,  361,

			  361,  361,  230,  230,  230,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  256,  361,
			  256,  256,  256,  256,  256,  256,  361,  256,  361,  361,
			  361,  256,  256,  256,  257,  257,  257,  257,  257,  361,
			  361,  257,  361,  361,  257,  257,  257,  257,  266,  361,
			  266,  266,  266,  266,  266,  266,  361,  266,  361,  361,
			  361,  266,  266,  266,  277,  277,  277,  277,  277,  361,
			  361,  277,  361,  361,  277,  277,  277,  277,  287,  361,
			  287,  287,  287,  287,  287,  287,  361,  287,  361,  361,

			  361,  287,  287,  287,  293,  361,  293,  293,  293,  293,
			  293,  293,  361,  293,  361,  361,  361,  293,  293,  293,
			  294,  294,  294,  294,  294,  361,  361,  294,  361,  361,
			  294,  294,  294,  294,  303,  303,  303,  303,  303,  361,
			  361,  303,  361,  361,  303,  303,  303,  303,  311,  361,
			  311,  311,  311,  311,  311,  311,  361,  311,  361,  361,
			  361,  311,  311,  311,   67,  361,   67,   67,   67,   67,
			   67,   67,  361,   67,  361,  361,  361,   67,   67,   67,
			  322,  322,  322,  322,  322,  361,  361,  322,  361,  361,
			  322,  322,  322,  322,  329,  329,  329,  329,  329,  361,

			  361,  329,  361,  361,  329,  329,  329,  329,  336,  336,
			  336,  336,  336,  361,  361,  336,  361,  361,  336,  336,
			  336,  336,   13,  361,  361,  361,  361,  361,  361,  361,
			  361,  361,  361,  361,  361,  361,  361,  361,  361,  361,
			  361,  361,  361,  361,  361,  361,  361,  361,  361,  361,
			  361,  361,  361,  361,  361,  361,  361,  361,  361,  361,
			  361,  361,  361,  361,  361,  361,  361,  361,  361,  361, yy_Dummy>>,
			1, 570, 2000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 2569)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			yy_chk_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    2,  283,
			    2,    2,   14,   40,   14,   14,  283,   64,   64,    2,
			    2,    2,   42,   64,  348,    2,    2,    2,    2,    2,
			    2,    2,  230,  230,   40,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    3,    3,   20,    3,   20,   20,
			  230,    3,    3,   15,   15,   15,   15,  126,   42,    3,

			  126,   15,   16,   16,   16,   16,   17,   17,   17,   17,
			    3,  306,    3,    4,    4,   19,    4,   19,   19,  165,
			    4,    4,  165,   19,   23,   23,   23,   23,    4,   84,
			   84,   84,   23,   24,   24,   24,   24,  195,  274,    4,
			  195,    4,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    7,
			   29,   29,    7,   29,  159,   33,   33,   29,   33,  159,

			   44,   38,   33,   38,   38,   29,   41,  272,   48,   43,
			   33,   48,   45,    7,   56,   48,   56,   56,   57,   49,
			   57,   57,   49,   59,   59,   59,   59,  284,  284,    7,
			    7,    7,    7,    7,    8,   44,   44,    8,  299,  299,
			   41,   41,   41,   43,   43,   43,   45,   45,   45,   49,
			  129,  129,  129,   65,   50,   49,   65,   50,    8,  263,
			  302,   50,   58,   58,   58,   58,  261,   71,  123,   71,
			   58,   71,  123,  234,    8,    8,    8,    8,    8,    9,
			   50,  302,  197,    9,    9,  197,    9,    9,    9,   65,
			  234,    9,   63,   63,   63,   63,   63,   68,  104,    9,

			   68,  104,   68,  255,   68,   68,   68,   73,   73,   73,
			   73,   68,    9,   10,  245,  241,   63,   10,   10,  242,
			   10,   10,   10,   69,  247,   10,   69,  228,   69,  247,
			   69,   69,   69,   10,  104,  224,  242,   69,   75,   75,
			   75,   75,   77,   77,   77,   77,   10,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   21,  221,   21,   21,   80,   80,

			   74,   74,   74,   74,   80,   21,   21,   21,   74,  220,
			  140,   21,   21,   21,   21,   21,   21,   21,  130,  130,
			  130,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   22,   81,   81,   22,   22,   22,  130,   81,   22,   22,
			  215,   22,   22,   22,  214,   81,  140,   22,   22,   22,
			   22,   22,   22,   22,  257,  257,   81,   22,   22,   22,
			   22,   22,   22,   22,   22,   22,   22,   25,   25,   25,
			   25,   25,  257,   25,   25,   25,   25,   25,   25,   25,
			   25,   25,   25,   25,   25,   25,   25,   25,   25,   25,
			   25,   25,  142,   25,   25,   25,   25,   25,   25,   25,

			   25,   25,   25,   25,   25,   25,   25,   25,   25,   25,
			   25,   25,   25,   25,   26,   26,   26,  136,  136,  136,
			   26,   26,   26,   26,   26,   26,   26,  142,  142,  351,
			   26,   26,   26,   26,   26,   26,   26,   26,   26,   66,
			  157,  157,  157,   66,  351,   66,   66,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,   66,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,  213,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,   66,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,   70,  251,  210,   70,
			  184,   70,  251,   70,   70,   70,   76,   76,   76,   76,

			   70,  265,   82,   82,   76,   82,  265,   85,   85,   82,
			   85,  163,  163,  163,   85,   70,  183,   82,   90,   70,
			   90,   90,   85,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   93,  278,   99,  101,  279,   99,  101,  279,   94,   99,
			  101,   95,  102,  103,   96,  102,  103,   97,  278,  105,
			  103,  102,  105,  102,  102,  102,  109,  125,  102,  109,

			  125,  181,  147,  105,  125,  147,  147,   93,   93,   93,
			   93,   93,   94,   94,   94,   95,   95,   95,   96,   96,
			   96,   97,   97,   97,  108,  105,  131,  108,  131,  131,
			  139,  108,  109,  110,  110,  119,  110,  119,  119,  296,
			  110,  110,  115,  115,  115,  115,  164,  164,  164,  119,
			  108,  117,  117,  117,  179,  141,  296,  117,  117,  117,
			  117,  117,  117,  117,  139,  139,  139,  117,  117,  117,
			  117,  117,  117,  117,  117,  117,  118,  118,  118,  171,
			  171,  171,  118,  118,  118,  118,  118,  118,  118,  141,
			  141,  141,  118,  118,  118,  118,  118,  118,  118,  118,

			  118,  121,  173,  173,  173,  121,  121,  121,  121,  121,
			  121,  121,  121,  121,  121,  121,  121,  121,  121,  121,
			  121,  121,  121,  121,  121,  121,  121,  121,  169,  121,
			  121,  121,  121,  121,  121,  121,  121,  121,  121,  121,
			  121,  121,  121,  121,  121,  121,  121,  121,  127,  127,
			  143,  298,  162,  144,  127,  317,  145,  132,  132,  132,
			  132,  132,  135,  161,  135,  135,  135,  158,  298,  127,
			  133,  133,  317,  127,  128,  128,  133,  128,  128,  128,
			  128,  132,  156,  133,  143,  143,  143,  144,  144,  144,
			  145,  145,  145,  133,  151,  128,  176,  176,  346,  128,

			  137,  137,  176,  137,  137,  137,  150,  176,  124,  137,
			  137,  137,  137,  137,  137,  137,  346,  122,  176,  137,
			  137,  137,  137,  137,  137,  137,  137,  137,  146,  149,
			  167,  146,  149,  167,  167,  146,  149,  153,  153,  167,
			  153,  155,  155,  120,  155,  153,  114,  113,  166,  155,
			  160,  166,  160,  160,  168,  166,  106,  168,  168,  174,
			  174,  174,  100,  168,  177,  177,  177,  160,  160,  160,
			  160,  160,  160,  160,  166,  315,  174,  315,  160,  160,
			  160,  160,  160,  160,  160,  160,  170,   98,  170,  170,
			  170,  172,  315,  172,  172,  172,  175,  175,  175,  175, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  178,  178,  178,  170,  186,  186,  186,  185,  172,  185,
			  185,  185,  191,  192,  192,  192,   88,  191,  325,  191,
			  191,  191,   83,   67,  185,  187,  187,  187,  187,  187,
			  187,  187,  194,  194,  194,  325,  187,  187,  187,  187,
			  187,  187,  187,  187,  188,  188,  188,  202,  202,  202,
			  188,  188,  188,  188,  188,  188,  188,  204,  204,  204,
			  188,  188,  188,  188,  188,  188,  188,  188,  188,  193,
			  196,  267,  267,  196,  193,   61,  193,  193,  193,  198,
			   60,  199,  198,  198,  199,  199,   55,   52,  198,  267,
			  199,  205,  205,  205,   47,  201,  196,  200,  201,  201,

			  200,  201,  201,  201,  201,  200,  200,   46,  200,  200,
			  200,  206,  206,  206,  208,  208,  208,  209,  209,  212,
			  212,  212,   37,  209,  200,  211,   34,  211,  211,  211,
			  209,   32,   30,  208,  216,  216,  216,  217,  217,  217,
			  209,  219,  219,  219,  222,  222,  222,  219,  219,  219,
			  219,  219,  219,  219,  223,  223,  223,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  225,  225,  225,  226,
			  226,  226,  227,  227,  227,  229,   27,   18,  229,  229,
			   13,  229,  229,  229,  229,  231,    0,    0,  231,  231,
			  232,  232,  232,    0,  231,    0,    0,  229,  233,  233,

			  233,  235,    0,  235,  235,  235,  231,  236,  236,  236,
			  237,  237,  237,  238,  238,  238,  238,    0,  235,  239,
			  239,  244,  244,  244,  243,  239,  243,  243,  243,  239,
			  248,  249,  249,  249,    0,  248,    0,  248,  248,  248,
			  252,  243,  253,  253,  253,  252,    0,  252,  252,  252,
			  254,  254,  254,  256,  277,  277,  256,  256,  268,  268,
			  268,  258,  256,  258,  258,  258,  259,    0,  259,  259,
			  259,  260,  277,  260,  260,  260,  262,  262,  258,    0,
			    0,  266,  262,  259,  266,  266,    0,    0,  260,    0,
			  266,  262,  264,  264,  264,  264,  264,  264,  264,  275,

			  275,  275,    0,  264,  264,  264,  264,  264,  264,  264,
			  264,  270,  280,  280,  270,  281,  281,  281,  281,  270,
			  270,    0,  270,  270,  270,    0,  271,  271,  271,  271,
			  280,  290,  290,  290,  271,  271,    0,  280,  270,  270,
			  271,  273,  273,  273,    0,    0,  290,  273,  273,  273,
			  273,  273,  273,  273,  305,  305,  305,  273,  273,  273,
			  273,  273,  273,  273,  273,  273,  276,    0,    0,  276,
			  276,  286,  276,  276,  276,  276,  286,    0,  286,  286,
			  286,  287,    0,    0,  287,  287,  294,  294,  276,    0,
			  287,  288,  288,    0,  288,  288,  288,  289,  289,    0,

			  289,  289,  289,  293,  294,    0,  293,  293,    0,  288,
			  288,  292,  293,  292,  292,  289,  291,  291,  291,  307,
			  307,  307,  291,  291,  291,  291,  291,  291,  291,    0,
			  303,  303,  291,  291,  291,  291,  291,  291,  291,  291,
			  291,  295,    0,  295,  295,  295,  292,  297,  303,  297,
			  297,  297,  322,  322,  300,    0,  300,  300,  295,  301,
			    0,    0,  301,  301,  297,  300,  300,  300,  301,  304,
			  322,    0,  304,  308,  308,  308,  310,    0,  310,  310,
			  304,  304,  304,    0,    0,  310,    0,  310,  310,  310,
			  311,    0,    0,  311,  311,  304,  316,  316,  316,  311,

			  312,  312,  312,  312,  313,  313,    0,  313,  313,  313,
			  314,    0,  318,  314,  318,  318,  318,  329,  329,  314,
			  332,  332,  313,  313,  319,  319,  319,    0,  320,  318,
			  320,  320,  323,  323,  323,  329,  314,    0,  332,  320,
			  320,  320,  321,    0,  321,  321,  321,  321,    0,  326,
			    0,  326,  326,  327,  327,  327,  327,    0,  326,  321,
			  326,  326,  326,  330,    0,  330,  330,  331,    0,  331,
			  331,  331,  331,    0,  330,  330,  330,  333,  333,  333,
			  335,    0,  335,  335,  335,  336,  336,  337,  337,  337,
			    0,  339,    0,  339,  339,    0,  344,    0,  344,  344,

			    0,  333,  334,  336,  334,  334,    0,    0,  334,  338,
			  334,  338,  338,  334,  334,  334,    0,  345,  345,  345,
			  338,  338,  338,  339,  340,  344,  340,  340,    0,  340,
			  340,  340,  341,    0,  341,  341,  341,    0,    0,  342,
			  345,  342,  342,  338,  343,    0,  343,  343,    0,  341,
			  342,  342,  342,    0,    0,  343,  343,  343,  347,  347,
			  347,  349,  349,  349,  350,  350,  350,  352,    0,  352,
			  352,  352,  353,  353,  353,  353,  349,  354,  354,  354,
			  355,    0,  355,  355,  355,  356,    0,  356,    0,    0,
			  356,  356,  356,  357,  357,  357,    0,  358,  358,  358,

			  359,  359,  359,  360,  360,  360,    0,    0,    0,    0,
			    0,    0,    0,    0,  357,  358,    0,    0,  360,  362,
			  362,  362,  362,  362,  362,  362,  362,  362,  362,  362,
			  362,  362,  362,  362,  362,  362,  362,  362,  362,  362,
			  362,  362,  363,  363,  363,  363,  363,  363,  363,  363,
			  363,  363,  363,  363,  363,  363,  363,  363,  363,  363,
			  363,  363,  363,  363,  363,  364,  364,    0,  364,  364,
			    0,  364,  364,  364,  364,  364,  364,  364,  364,  364,
			  364,    0,  364,  364,  364,  364,  364,  364,  365,  365,
			    0,  365,  365,  365,  365,  365,  365,  365,  365,  365,

			  365,  365,  365,  365,  365,    0,  365,  365,  365,  365,
			  365,  366,  366,  366,  366,  366,    0,  366,  366,  366,
			  366,  366,  366,  366,  366,  366,  366,    0,  366,  366,
			  366,  366,  366,  366,  367,  367,  367,  367,  367,    0,
			    0,  367,    0,    0,    0,  367,  367,  367,  368,  368,
			    0,  368,  368,  368,  368,  368,  368,  368,  368,  368,
			  368,  368,  368,  368,  368,    0,  368,  368,  368,  368,
			  368,  369,  369,    0,  369,  369,  369,  369,  369,  369,
			  369,  369,  369,  369,  369,  369,  369,  369,    0,  369,
			  369,  369,  369,  369,  370,    0,    0,  370,    0,    0,

			  370,    0,  370,  370,  370,  370,    0,  370,  371,    0,
			    0,  371,    0,    0,    0,    0,    0,  371,  371,  371,
			    0,    0,  371,    0,    0,    0,  371,  371,  371,  371,
			  372,  372,  372,    0,    0,  372,    0,    0,    0,  372,
			  372,  372,  373,  373,  373,  373,  373,  373,  373,  373,
			  373,  373,  373,  373,  373,  373,  373,  373,  373,  373,
			  373,  373,  373,  373,  373,  374,    0,  374,  374,  374,
			  374,  374,  374,    0,  374,    0,    0,    0,  374,  374,
			  374,  375,    0,    0,  375,    0,  375,  375,  375,  375,
			  375,  375,  375,  375,    0,  375,    0,    0,    0,  375, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  375,  375,  376,    0,    0,  376,    0,  376,  376,  376,
			  376,  376,  376,  376,  376,    0,  376,    0,    0,    0,
			  376,  376,  376,  377,  377,  377,  377,  377,  377,  377,
			  377,  377,  377,  377,  377,  377,  377,  377,  377,  377,
			  377,  377,  377,  377,  377,  377,  378,  378,  378,  378,
			  378,  378,  378,  378,  378,  378,  378,  378,  378,  378,
			  378,  378,  378,  378,  378,  378,  378,  378,  378,  379,
			  379,  379,  379,  379,  379,  379,  379,  379,  379,  379,
			  379,  379,  379,  379,  379,  379,  379,  379,  379,  379,
			  379,  379,  380,    0,    0,    0,  380,  380,  380,  380,

			  380,  380,  380,  380,  380,  380,  380,  380,  380,  380,
			    0,  380,  380,  380,  380,  381,    0,    0,  381,    0,
			    0,    0,    0,    0,  381,  381,  381,    0,    0,  381,
			    0,    0,    0,  381,  381,  381,  382,  382,  382,  382,
			  382,  382,  382,  382,  382,  382,  382,  382,  382,  382,
			  382,  382,  382,  382,  382,  382,  382,  382,  382,  383,
			    0,    0,  383,    0,    0,  383,    0,  383,  383,  383,
			  383,    0,  383,  384,    0,    0,  384,    0,    0,    0,
			  384,  384,  384,  384,  384,    0,    0,  384,    0,    0,
			    0,  384,  384,  384,  385,    0,  385,  385,  385,  385,

			  385,  385,    0,  385,    0,    0,    0,  385,  385,  385,
			  386,    0,  386,  386,  386,  386,  386,  386,    0,  386,
			    0,    0,    0,  386,  386,  386,  387,  387,    0,  387,
			  387,  387,  387,  387,  387,  387,  387,  387,  387,  387,
			  387,  387,  387,    0,  387,  387,  387,  387,  387,  388,
			  388,  388,    0,    0,  388,    0,    0,    0,  388,  388,
			  388,  389,  389,  389,  389,  389,  389,  389,  389,  389,
			  389,  389,  389,  389,  389,  389,  389,  389,  389,  389,
			  389,  389,  389,  389,  390,    0,    0,  390,    0,    0,
			    0,  390,  390,  390,  390,  390,    0,    0,  390,    0,

			    0,    0,  390,  390,  390,  391,  391,  391,  391,  391,
			  391,  391,  391,  391,  391,  391,  391,  391,  391,  391,
			  391,  391,  391,  391,  391,  391,  391,  391,  392,    0,
			  392,  392,  392,  392,  392,  392,    0,  392,    0,    0,
			    0,  392,  392,  392,  393,  393,  393,  393,  393,    0,
			    0,  393,    0,    0,  393,  393,  393,  393,  394,    0,
			  394,  394,  394,  394,  394,  394,    0,  394,    0,    0,
			    0,  394,  394,  394,  395,  395,  395,  395,  395,    0,
			    0,  395,    0,    0,  395,  395,  395,  395,  396,    0,
			  396,  396,  396,  396,  396,  396,    0,  396,    0,    0,

			    0,  396,  396,  396,  397,    0,  397,  397,  397,  397,
			  397,  397,    0,  397,    0,    0,    0,  397,  397,  397,
			  398,  398,  398,  398,  398,    0,    0,  398,    0,    0,
			  398,  398,  398,  398,  399,  399,  399,  399,  399,    0,
			    0,  399,    0,    0,  399,  399,  399,  399,  400,    0,
			  400,  400,  400,  400,  400,  400,    0,  400,    0,    0,
			    0,  400,  400,  400,  401,    0,  401,  401,  401,  401,
			  401,  401,    0,  401,    0,    0,    0,  401,  401,  401,
			  402,  402,  402,  402,  402,    0,    0,  402,    0,    0,
			  402,  402,  402,  402,  403,  403,  403,  403,  403,    0,

			    0,  403,    0,    0,  403,  403,  403,  403,  404,  404,
			  404,  404,  404,    0,    0,  404,    0,    0,  404,  404,
			  404,  404,  361,  361,  361,  361,  361,  361,  361,  361,
			  361,  361,  361,  361,  361,  361,  361,  361,  361,  361,
			  361,  361,  361,  361,  361,  361,  361,  361,  361,  361,
			  361,  361,  361,  361,  361,  361,  361,  361,  361,  361,
			  361,  361,  361,  361,  361,  361,  361,  361,  361,  361, yy_Dummy>>,
			1, 570, 2000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,   46,   82,  111,  141,    0,  186,  231,  273,
			  307,  346,    0, 1180,   50,   91,  100,  104, 1171,  113,
			   84,  392,  428,  122,  131,  466,  501, 1154, 2522,  188,
			 1122, 2522, 1096,  193, 1116,    0, 2522, 1116,  199, 2522,
			   47,  200,   56,  203,  194,  206, 1101, 1084,  206,  217,
			  252, 2522, 1059, 2522,    0, 1056,  212,  216,  260,  221,
			 1070, 1069, 2522,  290,   47,  251,  538, 1007,  295,  321,
			  584,  236, 2522,  305,  398,  336,  594,  340, 2522,    0,
			  388,  421,  600, 1019,  116,  605,  622,    0, 1010, 2522,
			  616, 2522, 2522,  664,  672,  675,  678,  681,  981,  670,

			  959,  671,  680,  681,  296,  687,  923, 2522,  722,  694,
			  731, 2522,    0,  912,  943,  740, 2522,  738,  763,  733,
			  937,  800,  911,  237,  892,  695,   95,  838,  864,  237,
			  405,  724,  855,  860, 2522,  851,  504,  890, 2522,  724,
			  404,  749,  486,  844,  847,  850,  926,  700, 2522,  927,
			  890,  863, 2522,  935, 2522,  939,  872,  527,  857,  183,
			  948,  835,  824,  598,  733,  117,  946,  923,  947,  812,
			  975,  766,  980,  789,  946,  994,  886,  951,  987,  748,
			    0,  671, 2522,  606,  587,  996,  991, 1006, 1031, 2522,
			 2522, 1006, 1000, 1063, 1019,  135, 1068,  280, 1072, 1074,

			 1095, 1088, 1034, 2522, 1044, 1078, 1098, 2522, 1101, 1107,
			  577, 1114, 1106,  538,  412,  437, 1121, 1124, 2522, 1128,
			  399,  367, 1131, 1141,  307, 1153, 1156, 1159,  299, 1168,
			   62, 1178, 1177, 1185,  262, 1190, 1194, 1197, 1200, 1209,
			 2522,  299,  308, 1213, 1208,  303, 2522,  318, 1224, 1218,
			 2522,  581, 1234, 1229, 1237,  275, 1246,  444, 1250, 1255,
			 1260,  250, 1266,  243, 1273,  595, 1274, 1061, 1245, 2522,
			 1309, 1324,  177, 1328,  110, 1286, 1359, 1244,  660,  672,
			 1302, 1313, 2522,   21,  217, 2522, 1365, 1374, 1381, 1387,
			 1318, 1403, 1409, 1396, 1376, 1430,  728, 1436,  840,  228,

			 1452, 1452,  244, 1420, 1467, 1341,   83, 1406, 1460, 2522,
			 1474, 1483, 1487, 1494, 1508,  964, 1483,  844, 1501, 1511,
			 1526, 1531, 1442, 1519, 2522, 1007, 1547, 1540, 2522, 1507,
			 1561, 1556, 1510, 1564, 1600, 1569, 1575, 1574, 1607, 1589,
			 1616, 1621, 1637, 1642, 1594, 1604,  882, 1645,   36, 1648,
			 1651,  513, 1656, 1659, 1664, 1669, 1677, 1680, 1684, 1687,
			 1690, 2522, 1718, 1741, 1764, 1787, 1810, 1825, 1847, 1870,
			 1892, 1906, 1919, 1941, 1958, 1979, 2000, 2022, 2045, 2068,
			 2091, 2113, 2135, 2157, 2171, 2187, 2203, 2225, 2238, 2260,
			 2282, 2304, 2321, 2335, 2351, 2365, 2381, 2397, 2411, 2425,

			 2441, 2457, 2471, 2485, 2499, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  361,    1,  362,  362,  361,    5,  363,  363,  362,
			  362,  361,   11,  361,  364,  361,  361,  361,  365,  364,
			  364,  364,  361,  366,  366,  361,   25,   26,  361,  361,
			  361,  361,  361,  361,  367,  367,  361,  368,  361,  361,
			  361,  368,  368,  368,  368,  368,  369,  361,  370,  371,
			  361,  361,  361,  361,  372,  361,  364,  361,  361,  361,
			  361,  365,  361,  373,   21,  361,  361,  374,  375,  376,
			  376,   70,  361,  366,  366,  366,  366,  361,  361,   25,
			   26,   26,  361,  377,  361,  361,  361,  367,  368,  361,
			  361,  361,  361,  368,  368,  368,  368,  368,  369,  361,

			  378,  361,  361,  370,  361,  371,  105,  361,  361,  361,
			  361,  361,  372,  361,  379,  379,  361,   21,  117,  364,
			  380,  361,  380,  121,  361,  361,  381,   70,   70,  128,
			  128,  361,  382,   26,  361,  361,  361,   86,  361,  368,
			  368,  368,  368,  368,  368,  368,  361,  361,  361,  383,
			  361,  105,  361,  361,  361,  361,  361,  361,  117,  118,
			  364,  361,  361,  121,  121,  384,  381,  385,  386,  361,
			  128,  128,  128,  128,  128,  379,   26,  361,  361,  387,
			  388,  105,  361,  361,  389,  361,  361,  160,  187,  361,
			  361,  121,  121,  121,  121,  361,  384,  361,  385,  386,

			  390,  386,  128,  361,  201,  128,  128,  361,  128,   26,
			  361,  361,  361,  388,  105,  391,  361,  361,  361,  188,
			  188,  361,  121,  121,  361,  121,  121,  121,  361,  392,
			  393,  386,  231,  128,  231,  231,  128,  128,  128,   26,
			  361,  105,  361,  361,  361,  219,  361,  121,  121,  121,
			  361,  121,  121,  121,  121,  361,  394,  393,  128,  128,
			  128,  361,   26,  361,  187,  121,  394,  395,  201,  361,
			  390,   26,  388,  264,  361,  121,  396,  395,  235,  361,
			  393,  361,  361,  388,  273,  361,  121,  397,  398,  393,
			  388,  273,  364,  397,  399,  289,  295,  290,  297,  291,

			  364,  400,  401,  399,  384,  289,  361,  361,  290,  361,
			  364,  400,  401,  402,  384,  304,  289,  361,  361,  290,
			  364,  401,  403,  295,  361,  388,  364,  401,  361,  403,
			  364,  401,  404,  304,  364,  331,  404,  304,  364,  364,
			  331,  304,  364,  364,  364,  361,  401,  304,  361,  361,
			  361,  401,  304,  401,  304,  321,  304,  304,  304,  304,
			  304,    0,  361,  361,  361,  361,  361,  361,  361,  361,
			  361,  361,  361,  361,  361,  361,  361,  361,  361,  361,
			  361,  361,  361,  361,  361,  361,  361,  361,  361,  361,
			  361,  361,  361,  361,  361,  361,  361,  361,  361,  361,

			  361,  361,  361,  361,  361, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    5,    1,    6,    1,    1,    1,    1,    1,
			    7,    7,    1,    8,    9,   10,   11,   12,   13,   14,
			   15,   15,   15,   15,   15,   15,   15,   15,   16,   17,
			   18,   18,   18,    1,    1,   19,   19,   19,   19,   19,
			   19,   20,   19,   19,   19,   19,   21,   19,   22,   23,
			   19,   19,   19,   19,   24,   19,   19,   19,   19,   25,
			   19,   26,   27,   28,    1,   29,    1,   30,   19,   31,

			   19,   19,   19,   20,   19,   19,   19,   19,   32,   19,
			   22,   33,   19,   19,   34,   19,   35,   36,   37,   19,
			   19,   25,   19,   38,   18,   39,    1,    1,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   41,   41,   41,   41,   41,   41,
			   41,   41,   41,   41,   41,   41,   41,   41,   41,   41,
			   42,   42,   42,   42,   42,   42,   42,   42,   42,   42,
			   42,   42,   42,   42,   42,   42,   42,   42,   42,   42,
			   42,   42,   42,   42,   42,   42,   42,   42,   42,   42,
			   42,   42,    1,    1,   43,   43,   43,   43,   43,   43,

			   43,   43,   43,   43,   43,   43,   43,   43,   43,   43,
			   43,   43,   43,   43,   43,   43,   43,   43,   43,   43,
			   43,   43,   43,   43,   44,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   46,   47,   47,   47,   47,   47,   47,   47,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    3,    4,    5,    6,    7,    1,    8,
			    9,   10,    1,   11,   12,   13,   14,    1,   15,   16,
			   16,   16,   16,   16,   16,   16,   17,   18,   19,   16,
			   16,   16,   16,   16,   16,   20,   21,   22,   23,    1,
			    1,    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   60,   57,    1,    1,    1,   48,   57,
			   37,   57,   58,    1,    1,   57,   57,   57,   59,   27,
			   59,   29,   59,   34,   33,   33,   36,   52,   53,   54,
			   55,   52,   52,   52,   52,   52,   59,   59,   17,   59,
			   59,   42,   59,   41,   39,   59,   57,   57,    1,    1,
			    0,   48,   47,   57,   57,    0,    0,    0,    0,    0,
			    0,    0,   14,   56,    1,    1,   56,   57,    4,   57,
			   57,   57,   27,    0,    0,   34,   33,   33,   52,   54,
			   53,   50,   49,   51,   52,   52,   52,   52,    0,   15,

			    0,    0,    0,   17,    0,    0,    0,   21,    0,    0,
			    0,   43,   39,    0,    0,   57,    2,   57,   57,   57,
			    0,    0,   38,    0,    0,    0,    0,    0,    0,    0,
			    0,   56,   56,   57,   28,   26,    0,    0,   35,   52,
			   52,   52,   52,   52,   52,   52,    0,    0,   20,   17,
			    0,    0,   16,    0,   23,    0,    0,    0,   57,   57,
			   57,    0,    0,    0,    0,   32,    0,    0,    0,    0,
			    0,    0,    7,    0,    0,   56,   57,    0,    0,    0,
			    0,    0,   22,    0,    0,    0,    0,   57,   57,   45,
			   44,    0,    0,    0,    0,   32,   31,   13,    0,    0,

			   32,    0,    0,    8,    0,    0,    0,    6,    0,   57,
			   26,   26,    0,    0,    0,    0,    0,    0,   40,   57,
			   57,    0,    0,    0,    0,    0,    0,    0,   30,    0,
			   31,    0,    0,    0,    7,    7,    0,    0,    0,   57,
			   19,    0,    0,    0,    0,   57,   12,    0,    0,    0,
			   11,    0,    0,    0,    0,   31,    0,   31,    0,    7,
			    7,    0,   57,    0,   57,    0,    0,   31,    0,    5,
			   25,   57,    0,   57,    0,    0,    0,   31,    7,   25,
			   31,   57,    3,    0,   57,   10,    0,    0,   31,   31,
			    0,   57,   57,    0,   31,   31,   31,    0,    0,   57,

			   57,    0,    0,   31,   31,   31,   24,    0,    0,   18,
			   46,    0,    0,   31,   31,   31,   31,    0,    0,    0,
			   57,    0,   31,   31,   18,    0,   57,    0,    9,   31,
			   57,    0,   31,   31,   57,    0,   31,   31,   57,   57,
			    0,   31,   46,   57,   57,    0,    0,   31,    9,    0,
			    0,    0,   31,    0,   31,    0,   31,   31,   31,   31,
			   31,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 2522
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 361
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 362
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

	yyNb_rules: INTEGER = 59
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 60
			-- End of buffer rule code

	yyLine_used: BOOLEAN = false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN = false
			-- Is `position' used?

	INITIAL: INTEGER = 0
	IN_ADL_VALUE_SET_DEF: INTEGER = 1
	IN_VALUE_SET_DEF: INTEGER = 2
	IN_STR: INTEGER = 3
	IN_TUPLE: INTEGER = 4
	IN_PATH: INTEGER = 5
			-- Start condition codes

feature -- User-defined features



feature {NONE} -- Initialization

	make
			-- Create a new scanner.
		do
			make_compressed_scanner_skeleton
			create out_buffer.make (8192)
			create converted_codes.make (0)
		end

feature -- Commands

	reset
			-- Reset scanner before scanning next input.
		do
			reset_compressed_scanner_skeleton
			out_buffer.wipe_out
			create converted_codes.make (0)
		end

	execute (in_text:STRING)
		do
			reset
			in_terminology := False
			set_input_buffer (new_string_buffer (in_text))
			scan
		end

feature -- Access

	out_buffer: STRING

	term_code: TERMINOLOGY_CODE
		attribute
			create Result.default_create
		end

feature {NONE} -- Implementation

	converted_codes: HASH_TABLE [STRING, STRING]

	in_terminology: BOOLEAN

	output_new_id_code (an_old_code: STRING)
		local
			new_code: STRING
		do
			if converted_codes.has (an_old_code) and then attached converted_codes.item (an_old_code) as nc then
				new_code := nc
			else
				new_code := adl_14_id_code_converted (an_old_code)
				converted_codes.put (new_code, an_old_code)
			end
			out_buffer.append (new_code)
		end

	output_new_at_ac_code (an_old_code: STRING)
		local
			new_code: STRING
		do
			if converted_codes.has (an_old_code) and then attached converted_codes.item (an_old_code) as nc then
				new_code := nc
			else
				new_code := adl_14_code_renumbered (an_old_code)
				converted_codes.put (new_code, an_old_code)
			end
			out_buffer.append (new_code)
		end

	output_converted_code_dt_key (an_old_code: STRING)
		local
			new_code: STRING
		do
			out_buffer.append_character ('[')
			out_buffer.append_character ('"')
			if converted_codes.has (an_old_code) and then attached converted_codes.item (an_old_code) as nc then
				new_code := nc
			else
				new_code := adl_14_code_renumbered (an_old_code)
				converted_codes.put (new_code, an_old_code)
			end
			out_buffer.append (new_code)
			out_buffer.append_character ('"')
			out_buffer.append_character (']')
		end

end
