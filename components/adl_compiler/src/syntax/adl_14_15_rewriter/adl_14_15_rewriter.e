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
if yy_act <= 26 then
if yy_act <= 13 then
if yy_act <= 7 then
if yy_act <= 4 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 59 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 59")
end
out_buffer.append (text)
else
--|#line 63 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 63")
end

		out_buffer.append_character ('[')
		output_new_id_code (text_substring (2, text_count - 1))
		out_buffer.append_character (']')
	
end
else
if yy_act = 3 then
--|#line 69 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 69")
end

		out_buffer.append_character ('[')
		output_new_id_code (text_substring (2, text_count - 1))
		out_buffer.append_character (']')
	
else
--|#line 76 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 76")
end

		out_buffer.append_character ('[')
		output_new_id_code (text_substring (2, text_count))
	
end
end
else
if yy_act <= 6 then
if yy_act = 5 then
--|#line 81 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 81")
end

		out_buffer.append_character ('[')
		out_buffer.append (Local_terminology_id + "::")
		output_new_at_ac_code (text_substring (2, text_count - 1))
		out_buffer.append_character (']')
	
else
--|#line 90 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 90")
end

		output_converted_code_dt_key (text_substring (3, text_count - 2))
	
end
else
--|#line 94 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 94")
end

		output_converted_code_dt_key (text_substring (3, text_count - 2))
	
end
end
else
if yy_act <= 10 then
if yy_act <= 9 then
if yy_act = 8 then
--|#line 98 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 98")
end

		output_converted_code_dt_key (text_substring (3, text_count - 2))
	
else
--|#line 103 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 103")
end

		out_buffer.append (text)
	
end
else
--|#line 107 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 107")
end
		-- match [{
		out_buffer.append (text)
		set_start_condition (IN_TUPLE)
	
end
else
if yy_act <= 12 then
if yy_act = 11 then
--|#line 113 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 113")
end
 		-- strings and lists of strings
		out_buffer.append (text)
	
else
--|#line 117 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 117")
end
 						-- interior }, { pattern
		out_buffer.append (text)
	
end
else
--|#line 121 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 121")
end
		-- numbers and lists of numbers and symbols (e.g. in intervals)
		out_buffer.append (text)
	
end
end
end
else
if yy_act <= 20 then
if yy_act <= 17 then
if yy_act <= 15 then
if yy_act = 14 then
--|#line 125 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 125")
end
						-- ADL codes
		out_buffer.append ("local::")
		output_new_at_ac_code (text_substring (8, text_count-1))
		out_buffer.append_character (']')
	
else
--|#line 131 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 131")
end
				-- other codes
		out_buffer.append (text)
	
end
else
if yy_act = 16 then
--|#line 135 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 135")
end
									-- match [{
		out_buffer.append (text)
	
else
--|#line 139 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 139")
end
		-- termination of interior tuple line }],\n
		out_buffer.append (text)
		set_start_condition (INITIAL)
	
end
end
else
if yy_act <= 19 then
if yy_act = 18 then
--|#line 144 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 144")
end
		-- termination of final tuple line }]\n
		out_buffer.append (text)
		set_start_condition (INITIAL)
	
else
--|#line 161 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 161")
end

		out_buffer.append (text)
		set_start_condition (IN_ADL_VALUE_SET_DEF)
	
end
else
--|#line 167 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 167")
end
 -- match second last line with ';' termination (assumed value)
		output_new_at_ac_code (text)
	
end
end
else
if yy_act <= 23 then
if yy_act <= 22 then
if yy_act = 21 then
--|#line 171 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 171")
end
out_buffer.append (text)
else
--|#line 174 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 174")
end
out_buffer.append (text)
end
else
--|#line 176 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 176")
end

		out_buffer.append (text)
		set_start_condition (INITIAL)
	
end
else
if yy_act <= 25 then
if yy_act = 24 then
--|#line 193 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 193")
end

		out_buffer.append (text)
		set_start_condition (IN_VALUE_SET_DEF)
	
else
--|#line 199 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 199")
end
 
		out_buffer.append (text)
	
end
else
--|#line 203 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 203")
end

		out_buffer.append (text)
	
end
end
end
end
else
if yy_act <= 39 then
if yy_act <= 33 then
if yy_act <= 30 then
if yy_act <= 28 then
if yy_act = 27 then
--|#line 208 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 208")
end
out_buffer.append (text)
else
--|#line 210 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 210")
end

		out_buffer.append (text)
		set_start_condition (INITIAL)
	
end
else
if yy_act = 29 then
--|#line 217 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 217")
end

	out_buffer.append (text)
	set_start_condition (IN_PATH)

else
--|#line 222 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 222")
end

	out_buffer.append (text)
	set_start_condition (IN_PATH)

end
end
else
if yy_act <= 32 then
if yy_act = 31 then
--|#line 228 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 228")
end
 
		out_buffer.append (text)
	
else
--|#line 232 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 232")
end
 
		out_buffer.append_character ('[')
		output_new_id_code (text_substring (2, text_count - 1))
		out_buffer.append_character (']')
	
end
else
--|#line 238 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 238")
end

		out_buffer.append (text)
	
end
end
else
if yy_act <= 36 then
if yy_act <= 35 then
if yy_act = 34 then
--|#line 242 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 242")
end

		out_buffer.append (text)
		set_start_condition (INITIAL)
	
else
--|#line 247 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 247")
end

		out_buffer.append (text)
		set_start_condition (INITIAL)
	
end
else
--|#line 255 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 255")
end
out_buffer.append (text)
end
else
if yy_act <= 38 then
if yy_act = 37 then
--|#line 258 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 258")
end

		out_buffer.append (text)
	
else
--|#line 263 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 263")
end

		out_buffer.append (text)
		out_buffer.append (".0.0")
	
end
else
--|#line 269 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 269")
end

		out_buffer.append (text)
	
end
end
end
else
if yy_act <= 45 then
if yy_act <= 42 then
if yy_act <= 41 then
if yy_act = 40 then
--|#line 273 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 273")
end
				-- beginning of a string
		out_buffer.append (text)
		set_start_condition (IN_STR)
	
else
--|#line 279 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 279")
end
out_buffer.append (text)
end
else
--|#line 281 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 281")
end
out_buffer.append (text)
end
else
if yy_act <= 44 then
if yy_act = 43 then
--|#line 283 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 283")
end

				out_buffer.append (text)
	
else
--|#line 287 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 287")
end
out_buffer.append (text)
end
else
--|#line 289 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 289")
end

				out_buffer.append (text)
	
end
end
else
if yy_act <= 48 then
if yy_act <= 47 then
if yy_act = 46 then
--|#line 293 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 293")
end
						-- match final end of string
				out_buffer.append (text)
				set_start_condition (INITIAL)
	
else
--|#line 298 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 298")
end
	-- Catch-all rules (no backing up)
				set_start_condition (INITIAL)
	
end
else
--|#line 306 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 306")
end
						-- read non '[' non-space characters followed by whitespace then '['
		out_buffer.append (text.substring (1, text_count - 1))
		unread_character('[')
	
end
else
if yy_act <= 50 then
if yy_act = 49 then
--|#line 311 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 311")
end
						-- read non '[' non-space characters followed by whitespace
		out_buffer.append (text)
	
else
--|#line 317 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 317")
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
			create an_array.make_filled (0, 0, 1140)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,  249,   15,   16,   15,   17,   54,   54,   54,   74,
			  249,   18,   54,   54,   54,   75,   74,   75,   19,   20,
			   52,   52,   52,   19,   19,   19,   19,   19,   19,   19,
			   19,   15,   16,   15,   17,   67,   67,   53,  107,   79,
			   18,   67,  226,   74,   78,   78,   78,   19,   20,   67,
			  108,  164,   19,   19,   19,   19,   19,   19,   19,   19,
			   22,   22,   76,   52,   52,   52,   22,   23,   56,   52,
			   56,   57,   81,   81,   22,  132,  133,   77,   85,   24,
			   53,   25,   22,   22,   86,   58,   51,  112,   22,   23,
			   91,  113,   70,   70,  104,  249,   22,  102,   70,  105,

			   75,   24,   75,   25,   26,   26,   70,  249,   74,  102,
			   26,   27,   28,   74,   28,   28,   28,  225,   26,   92,
			   28,  222,   60,   29,   28,   28,   28,   28,   28,   28,
			   28,   28,   28,   31,   94,   32,   80,   80,   80,  220,
			   95,   82,   82,   82,   97,   97,   97,   52,   52,   52,
			   33,   66,  194,   96,  200,   52,   52,   52,   54,   54,
			   54,   91,  127,  195,   53,  148,   34,   35,   36,   37,
			   38,   31,   53,   32,   56,   52,   56,   57,   56,   52,
			   56,  102,   52,   52,   52,  202,   95,  126,   33,  200,
			   92,   58,   51,  127,   85,   58,  103,  104,  210,   53,

			   86,  190,  105,  211,   34,   35,   36,   37,   38,   39,
			   74,  134,  151,   85,   40,  131,   41,   41,   41,   86,
			  188,   40,   42,   43,  196,   74,   42,   42,   42,   44,
			   42,   42,   42,   42,   42,  197,   45,   46,   46,   46,
			   47,  119,  120,  121,  122,  123,   48,   49,   49,   49,
			   94,   74,  187,   49,   50,   79,   95,   49,   49,   49,
			   49,   49,   49,   49,   49,   49,   52,   52,   52,   96,
			   97,   97,   97,  147,  147,  147,   59,   59,   59,   78,
			   78,   78,   59,   53,   74,  156,   59,   59,   59,   59,
			   59,   59,   59,   59,   59,   60,  186,  106,   61,   62,

			  103,  106,   62,   62,  139,   63,   63,   63,  227,  228,
			  249,   63,   78,   78,   78,   63,   64,   63,   65,   63,
			   63,   63,   63,   63,   66,   85,  132,  133,   67,   67,
			  177,   86,  134,   87,   67,   88,   88,   88,   89,  175,
			   87,   90,   67,  227,  228,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,  249,  110,   74,   70,   70,   74,
			  249,  111,  249,   70,   90,   90,   90,  158,   74,  249,
			  110,   70,  151,  249,   74,  126,  111,   52,   52,   52,
			  165,  127,  164,  109,  124,  124,  124,  125,  125,  125,
			  138,   63,   84,   63,   53,  139,   78,   78,   78,  249,

			  118,  249,   80,   80,   80,  198,   71,   71,  162,   71,
			   71,   71,  142,  155,  140,   71,  199,  153,  141,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,  136,  136,
			  136,  159,  159,  159,  136,  152,  133,   74,  136,  136,
			  136,  136,  136,  136,  136,  136,  136,  137,  137,  137,
			   74,  150,  118,  137,   74,  146,  145,  137,  137,  137,
			  137,  137,  137,  137,  137,  137,   81,   81,   74,   85,
			  203,  249,  144,  157,  111,   86,  142,  111,   82,   82,
			   82,  204,   78,   78,   78,  106,  160,  161,  161,  106,
			  158,  163,  163,  163,  135,  130,   78,   78,   78,   51,

			   51,   51,  166,  166,  166,  154,  170,  171,  171,   51,
			  154,  154,  154,  154,  154,  154,  154,  154,  167,  172,
			  172,  172,  129,  167,  167,  167,  167,  167,  167,  167,
			  167,  168,  168,  168,  173,  174,  174,  168,  169,  169,
			  169,  168,  168,  168,  168,  168,  168,  168,  168,  168,
			  106,  174,  174,  174,  106,  176,  176,  176,  178,  178,
			  178,  179,  179,  179,  180,  180,  180,  179,  181,  182,
			  182,  179,  179,  179,  179,  179,  179,  179,  179,  179,
			  182,  182,  182,  183,  183,  183,  184,  185,  185,  185,
			  185,  185,  189,  189,  189,  191,  191,  191,  192,  193,

			  193,  193,  193,  193,  176,  201,  201,  205,  212,  213,
			  213,  109,  205,  205,  205,  205,  205,  205,  205,  205,
			  206,   86,  208,   84,  210,  207,  249,  209,  249,  211,
			  249,  214,  215,  216,  214,  216,  216,  187,  164,  201,
			  201,  201,  189,  218,  218,  217,  219,  219,  219,  191,
			  221,  221,  219,  193,  223,  224,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  193,  224,  224,  194,  194,
			  198,  213,  198,  109,  196,  109,  216,  216,  216,  195,
			  195,  199,   74,  199,  203,  197,  218,  218,  218,  206,
			  116,  229,  229,  229,  207,  204,  221,  221,  221,  208,

			  164,   52,   52,   52,  209,  236,  224,  224,  224,  230,
			  230,  230,  232,  232,  232,  230,  237,  236,   53,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  242,  231,
			   52,   52,   52,  234,  234,  234,  239,  240,  240,  115,
			  233,  233,  233,  114,  109,  100,   98,   53,   52,   52,
			   52,   51,   93,  238,  238,  238,  235,   84,  233,  233,
			  233,   74,   71,   69,  241,   53,  238,  238,  238,  236,
			   68,  240,  240,  240,   51,  249,  243,  243,  243,  244,
			  242,  245,   51,  249,  243,  243,  243,   51,  249,  246,
			  246,  246,   51,  249,   51,   51,   51,   51,  249,  246,

			  246,  246,  249,  249,  249,  249,  247,  249,   51,  248,
			  246,  246,  246,   51,  249,   51,   51,   51,   99,   99,
			  249,  249,   99,  249,   99,   99,   99,  247,   14,   14,
			   14,   14,   14,   14,   14,   14,   14,   14,   14,   14,
			   14,   14,   14,   14,   14,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   30,   30,   30,   30,   30,   30,   30,   30,
			   30,   30,   30,   30,   30,   30,   30,   30,   30,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   55,   55,   55,   55,

			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   72,   72,  249,   72,   72,  249,  249,
			   72,  249,   72,   72,   72,   73,   73,  249,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,  249,   73,
			   73,   73,   83,   83,  249,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,  249,   83,   83,   83,   87,
			  249,  249,   87,  249,   87,  249,   87,   87,  249,   87,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  249,  101,  101,  101,  106,  106,  106,
			  106,  106,  249,  249,  106,  249,  106,  106,  106,   62, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  249,   62,   62,  249,   62,   62,   62,  249,   62,  249,
			   62,   62,   62,   68,   68,   68,   68,   68,   68,   68,
			   68,   68,   68,   68,   68,   68,   68,   68,   68,   68,
			  117,  117,  117,  117,  117,  117,  117,  117,  117,  117,
			  117,  117,  117,  117,  117,  117,  117,  128,  249,  249,
			  249,  249,  128,  249,  128,  128,  249,  128,  143,  249,
			  249,  249,  249,  249,  249,  143,  143,  249,  249,  143,
			  249,  143,  143,  143,  149,  149,  249,  249,  149,  249,
			  149,  149,  149,  148,  148,  249,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  249,  148,  148,  148,

			   13,  249,  249,  249,  249,  249,  249,  249,  249,  249,
			  249,  249,  249,  249,  249,  249,  249,  249,  249,  249,
			  249,  249,  249,  249,  249,  249,  249,  249,  249,  249,
			  249,  249,  249,  249,  249,  249,  249,  249,  249,  249,
			  249, yy_Dummy>>,
			1, 141, 1000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1140)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    1,    1,    1,    1,   15,   15,   15,   35,
			    0,    1,   16,   16,   16,   31,   34,   31,    1,    1,
			   14,   14,   14,    1,    1,    1,    1,    1,    1,    1,
			    1,    2,    2,    2,    2,   22,   22,   14,   61,   35,
			    2,   22,  217,   37,   34,   34,   34,    2,    2,   22,
			   61,  217,    2,    2,    2,    2,    2,    2,    2,    2,
			    3,    3,   33,   18,   18,   18,    3,    3,   17,   17,
			   17,   17,   37,   37,    3,  132,  132,   33,   40,    3,
			   18,    3,    4,    4,   40,   17,   17,   64,    4,    4,
			   43,   64,   26,   26,  137,   58,    4,   58,   26,  137,

			   75,    4,   75,    4,    5,    5,   26,  101,   36,  101,
			    5,    5,    5,   38,    5,    5,    5,  210,    5,   43,
			    5,  208,   60,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    7,   45,    7,   36,   36,   36,  206,
			   45,   38,   38,   38,   46,   46,   46,   51,   51,   51,
			    7,   60,  183,   45,  200,   52,   52,   52,   54,   54,
			   54,   91,  127,  183,   51,  127,    7,    7,    7,    7,
			    7,    8,   52,    8,   55,   55,   55,   55,   56,   56,
			   56,   56,   57,   57,   57,  188,   95,   84,    8,  186,
			   91,   55,   55,   84,   85,   56,   59,   59,  224,   57,

			   85,  179,   59,  224,    8,    8,    8,    8,    8,    9,
			   78,  134,  134,   87,    9,   95,    9,    9,    9,   87,
			  177,    9,    9,    9,  184,  120,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,  184,    9,   11,   11,   11,
			   11,   78,   78,   78,   78,   78,   11,   11,   11,   11,
			   94,   79,  176,   11,   11,  120,   94,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   19,   19,   19,   94,
			   97,   97,   97,  116,  116,  116,   19,   19,   19,   79,
			   79,   79,   19,   19,   80,  140,   19,   19,   19,   19,
			   19,   19,   19,   19,   19,   20,  175,  140,   20,   20,

			  168,  140,   20,   20,  106,   20,   20,   20,  219,  219,
			  106,   20,   80,   80,   80,   20,   20,   20,   20,   20,
			   20,   20,   20,   20,   20,   41,   96,   96,   67,   67,
			  165,   41,   96,   41,   67,   41,   41,   41,   41,  162,
			   41,   41,   67,  230,  230,   41,   41,   41,   41,   41,
			   41,   41,   41,   41,   42,  110,   81,   70,   70,   82,
			   42,  110,   42,   70,   42,   42,   42,  158,  119,   42,
			   63,   70,  151,   63,  121,  126,   63,  105,  105,  105,
			  150,  126,  149,   63,   81,   81,   81,   82,   82,   82,
			  105,   63,  148,   63,  105,  108,  119,  119,  119,   63,

			   71,  108,  121,  121,  121,  185,   71,   71,  146,   71,
			   71,   71,  142,  139,  108,   71,  185,  136,  108,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,  103,  103,
			  103,  144,  144,  144,  103,  135,  133,  122,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  104,  104,  104,
			  123,  130,  117,  104,  124,  114,  113,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  122,  122,  125,  128,
			  189,  143,  112,  141,  111,  128,  109,  143,  123,  123,
			  123,  189,  124,  124,  124,  141,  145,  145,  145,  141,
			  143,  147,  147,  147,  100,   93,  125,  125,  125,  138,

			  138,  138,  152,  152,  152,  138,  157,  157,  157,  138,
			  138,  138,  138,  138,  138,  138,  138,  138,  153,  159,
			  159,  159,   89,  153,  153,  153,  153,  153,  153,  153,
			  153,  154,  154,  154,  160,  160,  160,  154,  156,  156,
			  156,  154,  154,  154,  154,  154,  154,  154,  154,  154,
			  156,  161,  161,  161,  156,  163,  163,  163,  166,  166,
			  166,  167,  167,  167,  169,  169,  169,  167,  170,  170,
			  170,  167,  167,  167,  167,  167,  167,  167,  167,  167,
			  171,  171,  171,  172,  172,  172,  173,  173,  173,  174,
			  174,  174,  178,  178,  178,  180,  180,  180,  181,  181,

			  181,  182,  182,  182,  187,  187,  187,  190,  194,  194,
			  194,  194,  190,  190,  190,  190,  190,  190,  190,  190,
			  191,   86,  192,   83,  193,  191,  191,  192,  192,  193,
			  193,  196,  196,  196,  198,  198,  198,  201,  202,  201,
			  201,  201,  203,  203,  203,  202,  205,  205,  205,  207,
			  207,  207,  205,  209,  209,  209,  205,  205,  205,  205,
			  205,  205,  205,  205,  205,  211,  211,  211,  212,  213,
			  214,  213,  216,  212,  215,  214,  215,  215,  215,  212,
			  213,  214,   73,  216,  218,  215,  218,  218,  218,  221,
			   69,  226,  226,  226,  221,  218,  221,  221,  221,  223,

			  226,  228,  228,  228,  223,  234,  223,  223,  223,  227,
			  227,  227,  229,  229,  229,  227,  234,  239,  228,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  239,  228,
			  231,  231,  231,  232,  232,  232,  236,  236,  236,   68,
			  231,  231,  231,   65,   62,   50,   47,  231,  233,  233,
			  233,  235,   44,  235,  235,  235,  233,   39,  233,  233,
			  233,   30,   27,   25,  238,  233,  238,  238,  238,  240,
			   23,  240,  240,  240,  241,   13,  241,  241,  241,  243,
			  240,  243,  243,    0,  243,  243,  243,  244,    0,  244,
			  244,  244,  245,    0,  245,  245,  245,  246,    0,  246,

			  246,  246,    0,    0,    0,    0,  244,    0,  247,  245,
			  247,  247,  247,  248,    0,  248,  248,  248,  259,  259,
			    0,    0,  259,    0,  259,  259,  259,  248,  250,  250,
			  250,  250,  250,  250,  250,  250,  250,  250,  250,  250,
			  250,  250,  250,  250,  250,  251,  251,  251,  251,  251,
			  251,  251,  251,  251,  251,  251,  251,  251,  251,  251,
			  251,  251,  252,  252,  252,  252,  252,  252,  252,  252,
			  252,  252,  252,  252,  252,  252,  252,  252,  252,  253,
			  253,  253,  253,  253,  253,  253,  253,  253,  253,  253,
			  253,  253,  253,  253,  253,  253,  254,  254,  254,  254,

			  254,  254,  254,  254,  254,  254,  254,  254,  254,  254,
			  254,  254,  254,  255,  255,    0,  255,  255,    0,    0,
			  255,    0,  255,  255,  255,  256,  256,    0,  256,  256,
			  256,  256,  256,  256,  256,  256,  256,  256,    0,  256,
			  256,  256,  257,  257,    0,  257,  257,  257,  257,  257,
			  257,  257,  257,  257,  257,    0,  257,  257,  257,  258,
			    0,    0,  258,    0,  258,    0,  258,  258,    0,  258,
			  260,  260,  260,  260,  260,  260,  260,  260,  260,  260,
			  260,  260,  260,    0,  260,  260,  260,  261,  261,  261,
			  261,  261,    0,    0,  261,    0,  261,  261,  261,  262, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,  262,  262,    0,  262,  262,  262,    0,  262,    0,
			  262,  262,  262,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  264,  264,  264,  264,  264,  264,  264,  264,  264,  264,
			  264,  264,  264,  264,  264,  264,  264,  265,    0,    0,
			    0,    0,  265,    0,  265,  265,    0,  265,  266,    0,
			    0,    0,    0,    0,    0,  266,  266,    0,    0,  266,
			    0,  266,  266,  266,  267,  267,    0,    0,  267,    0,
			  267,  267,  267,  268,  268,    0,  268,  268,  268,  268,
			  268,  268,  268,  268,  268,  268,    0,  268,  268,  268,

			  249,  249,  249,  249,  249,  249,  249,  249,  249,  249,
			  249,  249,  249,  249,  249,  249,  249,  249,  249,  249,
			  249,  249,  249,  249,  249,  249,  249,  249,  249,  249,
			  249,  249,  249,  249,  249,  249,  249,  249,  249,  249,
			  249, yy_Dummy>>,
			1, 141, 1000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,   29,   58,   80,  102,    0,  130,  168,  204,
			    0,  235,    0,  775,   18,    4,   10,   66,   61,  264,
			  293, 1100,   33,  761, 1100,  735,   90,  753,    0, 1100,
			  756,   13, 1100,   57,   11,    4,  103,   38,  108,  752,
			   76,  323,  352,   88,  726,  132,  142,  725, 1100,    0,
			  722,  145,  153, 1100,  156,  172,  176,  180,   92,  187,
			  120,   27,  729,  368,   63,  717, 1100,  326,  736,  678,
			  355,  397,    0,  677, 1100,   98, 1100, 1100,  205,  246,
			  279,  351,  354,  618,  185,  192,  619,  211,    0,  507,
			    0,  159, 1100,  471,  248,  184,  324,  268, 1100,    0,

			  466,  104, 1100,  416,  435,  375,  299, 1100,  390,  461,
			  353,  472,  460,  444,  431, 1100,  261,  449, 1100,  363,
			  220,  369,  432,  445,  449,  463,  373,  160,  467,    0,
			  428, 1100,   73,  434,  209,  423,  408,   84,  487,  392,
			  273,  461,  410,  469,  419,  474,  385,  479,  387,  361,
			  355,  370,  490,  500,  519, 1100,  526,  494,  365,  507,
			  522,  539,  314,  543, 1100,  315,  546,  549,  291,  552,
			  556,  568,  571,  574,  577,  281,  242,  205,  580,  191,
			  583,  586,  589,  142,  214,  395,  174,  592,  162,  460,
			  589,  615,  617,  619,  596, 1100,  619, 1100,  622, 1100,

			  152,  627,  617,  630, 1100,  634,  118,  637,  100,  641,
			   96,  653,  658,  659,  660,  664,  662,   30,  674,  299,
			 1100,  684, 1100,  694,  193, 1100,  679,  697,  699,  700,
			  334,  728,  721,  746,  695,  741,  724, 1100,  754,  707,
			  759,  764, 1100,  772,  777,  782,  787,  798,  803, 1100,
			  827,  844,  861,  878,  895,  907,  924,  941,  957,  809,
			  969,  981,  995, 1012, 1029, 1045, 1056, 1065, 1082, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  250,  250,  251,  251,  251,    5,  252,  252,  251,
			    9,  251,   11,  249,  253,  249,  249,  254,  253,  253,
			  249,  249,  249,  249,  249,  249,  249,  255,  255,  249,
			  256,  249,  249,  249,  256,  256,  256,  256,  256,  257,
			  258,  249,   41,  249,   42,  249,  249,  249,  249,  259,
			  249,  253,  249,  249,  249,  254,  260,  253,  260,   19,
			  249,  261,  262,   20,   63,   63,  249,  249,  263,  249,
			  249,  264,  255,  256,  249,  249,  249,  249,  256,  256,
			  256,  256,  256,  257,  249,  249,  265,  258,   41,  249,
			   42,  249,  249,   42,  249,  249,  249,  249,  249,  259,

			  249,  260,  249,   19,  103,  253,  261,  249,  261,  249,
			  249,  266,   63,   63,   63,  249,  249,  264,  249,  256,
			  256,  256,  256,  256,  256,  256,  249,  249,  265,  267,
			   42,  249,  249,  249,  249,  249,  103,  104,  104,  249,
			  108,  108,  249,  266,   63,   63,   63,  249,  268,  267,
			   42,  249,  249,  138,  153,  249,  108,  156,  249,   63,
			   63,   63,   63,  249,  249,   42,  249,  154,  154,  156,
			  156,  156,   63,   63,   63,   63,  249,  249,  249,  167,
			  156,  156,  156,   63,   63,   63,  249,  249,  267,  249,
			  153,  261,  261,  261,  262,  249,  194,  249,  194,  249,

			  249,  249,  267,  249,  249,  190,  249,  156,  249,  156,
			  249,  156,  262,  194,  262,  194,  215,  267,  249,  205,
			  249,  156,  249,  221,  223,  249,  267,  205,  253,  226,
			  227,  253,  229,  253,  267,  233,  249,  249,  233,  249,
			  249,  233,  249,  233,  233,  233,  233,  233,  233,    0,
			  249,  249,  249,  249,  249,  249,  249,  249,  249,  249,
			  249,  249,  249,  249,  249,  249,  249,  249,  249, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    1,    5,    1,    1,    1,    1,    1,
			    6,    6,    1,    7,    8,    9,   10,   11,   12,   13,
			   14,   14,   14,   14,   14,   14,   14,   14,   15,   16,
			   17,   17,   17,    1,    1,   18,   18,   18,   18,   18,
			   18,   18,   18,   18,   18,   18,   18,   18,   18,   18,
			   18,   18,   18,   18,   18,   18,   18,   18,   18,   18,
			   18,   19,   20,   21,    1,   22,    1,   23,   18,   24,

			   18,   18,   18,   18,   18,   18,   18,   18,   25,   18,
			   18,   26,   18,   18,   27,   18,   28,   29,   30,   18,
			   18,   18,   18,   31,   17,   32,    1,    1,   33,   33,
			   33,   33,   33,   33,   33,   33,   33,   33,   33,   33,
			   33,   33,   33,   33,   34,   34,   34,   34,   34,   34,
			   34,   34,   34,   34,   34,   34,   34,   34,   34,   34,
			   35,   35,   35,   35,   35,   35,   35,   35,   35,   35,
			   35,   35,   35,   35,   35,   35,   35,   35,   35,   35,
			   35,   35,   35,   35,   35,   35,   35,   35,   35,   35,
			   35,   35,    1,    1,   36,   36,   36,   36,   36,   36,

			   36,   36,   36,   36,   36,   36,   36,   36,   36,   36,
			   36,   36,   36,   36,   36,   36,   36,   36,   36,   36,
			   36,   36,   36,   36,   37,   38,   38,   38,   38,   38,
			   38,   38,   38,   38,   38,   38,   38,   38,   38,   38,
			   39,   40,   40,   40,   40,   40,   40,   40,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    3,    1,    1,    4,    1,    5,    6,
			    7,    8,    9,    9,   10,   11,    1,   12,   13,    1,
			   14,    1,   15,   15,   15,   15,   15,   15,   15,   16,
			   17,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,   34,   34,   52,   49,    1,    1,   40,   29,   49,
			   50,   51,   21,   51,   23,   51,   26,   25,   25,   28,
			   44,   45,   46,   47,   44,   44,   44,   44,   44,   51,
			   13,   13,   51,   51,   51,   51,   34,   51,   33,   31,
			   51,   49,   49,   48,    1,   40,   40,   39,   40,   49,
			    0,    0,    0,    0,    0,    0,   10,   21,    0,    0,
			   26,   25,   25,   44,   46,   45,   42,   41,   43,   44,
			   44,   44,   44,    0,   11,    0,    0,   13,   13,    0,
			    0,    0,   16,    0,    0,    0,    0,   34,   35,   31,

			    0,   40,   39,   49,   49,   49,    0,   30,    0,    0,
			    0,    0,    0,    0,    0,   22,    0,    0,   27,   44,
			   44,   44,   44,   44,   44,   44,    0,    0,   13,    0,
			    0,   12,    0,   18,    0,    0,   49,   49,   49,    0,
			    0,    0,   24,    0,    0,    0,    0,    0,    0,    0,
			    0,   17,    0,   49,   49,   36,    0,    0,    9,    0,
			    0,    0,    0,    0,   15,    0,    0,   49,   49,    0,
			    0,    0,    0,    0,    0,    0,   20,    0,    0,   49,
			    0,    0,    0,    0,    4,    4,    0,    0,    0,    0,
			   49,    0,    0,    0,    0,    5,    0,    2,    0,    3,

			   19,   20,    0,    0,   32,   49,    0,    0,    0,    0,
			    0,    0,    0,    0,    4,    4,    4,    0,    0,   49,
			    8,    0,    6,    0,    0,    7,    0,   49,   49,    0,
			   49,   49,    0,   38,    0,   49,    0,   14,   49,    0,
			    0,   49,   14,   49,   49,   49,   37,   49,   49,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 1100
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 249
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 250
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

	yyNb_rules: INTEGER = 51
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 52
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



feature {NONE} -- Local variables


	converted_codes: HASH_TABLE [STRING, STRING]

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
			set_input_buffer (new_string_buffer (in_text))
			scan
		end

feature -- Access

	out_buffer: STRING

feature {NONE} -- Implementation

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
		do
			out_buffer.append_character ('[')
			out_buffer.append_character ('"')
			if converted_codes.has (an_old_code) and then attached converted_codes.item (an_old_code) as nc then
				out_buffer.append (nc)
			else
				out_buffer.append (an_old_code)
			end
			out_buffer.append_character ('"')
			out_buffer.append_character (']')
		end

end
