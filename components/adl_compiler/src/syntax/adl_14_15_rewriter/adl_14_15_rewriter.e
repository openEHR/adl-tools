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
if yy_act <= 27 then
if yy_act <= 14 then
if yy_act <= 7 then
if yy_act <= 4 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 64 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 64")
end
out_buffer.append (text)
else
--|#line 68 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 68")
end

		out_buffer.append ("terminology%N")
		in_terminology := True
	
end
else
if yy_act = 3 then
--|#line 73 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 73")
end

		out_buffer.append (text)
	
else
--|#line 79 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 79")
end

		out_buffer.append_character ('[')
		output_new_id_code (text_substring (2, text_count - 1))
		out_buffer.append_character (']')
	
end
end
else
if yy_act <= 6 then
if yy_act = 5 then
--|#line 85 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 85")
end

		out_buffer.append_character ('[')
		output_new_id_code (text_substring (2, text_count - 1))
		out_buffer.append_character (']')
	
else
--|#line 92 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 92")
end

		out_buffer.append_character ('[')
		output_new_id_code (text_substring (2, text_count))
	
end
else
--|#line 97 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 97")
end

		out_buffer.append_character ('[')
		out_buffer.append (Local_terminology_id + "::")
		output_new_at_ac_code (text_substring (2, text_count - 1))
		out_buffer.append_character (']')
	
end
end
else
if yy_act <= 11 then
if yy_act <= 9 then
if yy_act = 8 then
--|#line 106 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 106")
end

		output_converted_code_dt_key (text_substring (3, text_count - 2))
	
else
--|#line 110 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 110")
end

		output_converted_code_dt_key (text_substring (3, text_count - 2))
	
end
else
if yy_act = 10 then
--|#line 114 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 114")
end

		output_converted_code_dt_key (text_substring (3, text_count - 2))
	
else
--|#line 119 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 119")
end

		out_buffer.append (text)
	
end
end
else
if yy_act <= 13 then
if yy_act = 12 then
--|#line 123 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 123")
end
		-- match [{
		out_buffer.append (text)
		set_start_condition (IN_TUPLE)
	
else
--|#line 129 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 129")
end
 		-- strings and lists of strings
		out_buffer.append (text)
	
end
else
--|#line 133 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 133")
end
 						-- interior }, { pattern
		out_buffer.append (text)
	
end
end
end
else
if yy_act <= 21 then
if yy_act <= 18 then
if yy_act <= 16 then
if yy_act = 15 then
--|#line 137 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 137")
end
		-- numbers and lists of numbers and symbols (e.g. in intervals)
		out_buffer.append (text)
	
else
--|#line 141 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 141")
end
						-- ADL codes
		out_buffer.append ("[local::")
		output_new_at_ac_code (text_substring (9, text_count-1))
		out_buffer.append_character (']')
	
end
else
if yy_act = 17 then
--|#line 147 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 147")
end
				-- other codes
		out_buffer.append (text)
	
else
--|#line 151 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 151")
end
									-- match [{
		out_buffer.append (text)
	
end
end
else
if yy_act <= 20 then
if yy_act = 19 then
--|#line 155 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 155")
end
		-- termination of interior tuple line }],\n
		out_buffer.append (text)
		set_start_condition (INITIAL)
	
else
--|#line 160 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 160")
end
		-- termination of final tuple line }]\n
		out_buffer.append (text)
		set_start_condition (INITIAL)
	
end
else
--|#line 177 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 177")
end

		out_buffer.append (text)
		set_start_condition (IN_ADL_VALUE_SET_DEF)
	
end
end
else
if yy_act <= 24 then
if yy_act <= 23 then
if yy_act = 22 then
--|#line 183 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 183")
end
 -- match second last line with ';' termination (assumed value)
		output_new_at_ac_code (text)
	
else
--|#line 187 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 187")
end
out_buffer.append (text)
end
else
--|#line 190 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 190")
end
out_buffer.append (text)
end
else
if yy_act <= 26 then
if yy_act = 25 then
--|#line 192 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 192")
end

		out_buffer.append (text)
		set_start_condition (INITIAL)
	
else
--|#line 200 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 200")
end
 
		if in_terminology then
			create term_code.make_from_string (text.substring (2, text_count - 1))
			out_buffer.append (term_code_to_uri (term_code))
		else
			out_buffer.append (text)
		end
	
end
else
--|#line 220 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 220")
end

		out_buffer.append (text)
		set_start_condition (IN_VALUE_SET_DEF)
	
end
end
end
end
else
if yy_act <= 41 then
if yy_act <= 34 then
if yy_act <= 31 then
if yy_act <= 29 then
if yy_act = 28 then
--|#line 226 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 226")
end
 
		out_buffer.append (text)
	
else
--|#line 230 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 230")
end

		out_buffer.append (text)
	
end
else
if yy_act = 30 then
--|#line 235 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 235")
end
out_buffer.append (text)
else
--|#line 237 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 237")
end

		out_buffer.append (text)
		set_start_condition (INITIAL)
	
end
end
else
if yy_act <= 33 then
if yy_act = 32 then
--|#line 244 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 244")
end

	out_buffer.append (text)
	set_start_condition (IN_PATH)

else
--|#line 249 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 249")
end

	out_buffer.append (text)
	set_start_condition (IN_PATH)

end
else
--|#line 255 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 255")
end
 
		out_buffer.append (text)
	
end
end
else
if yy_act <= 38 then
if yy_act <= 36 then
if yy_act = 35 then
--|#line 259 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 259")
end
 
		out_buffer.append_character ('[')
		output_new_id_code (text_substring (2, text_count - 1))
		out_buffer.append_character (']')
	
else
--|#line 265 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 265")
end

		out_buffer.append (text)
	
end
else
if yy_act = 37 then
--|#line 269 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 269")
end

		out_buffer.append (text)
		set_start_condition (INITIAL)
	
else
--|#line 274 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 274")
end

		out_buffer.append (text)
		set_start_condition (INITIAL)
	
end
end
else
if yy_act <= 40 then
if yy_act = 39 then
--|#line 282 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 282")
end
out_buffer.append (text)
else
--|#line 285 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 285")
end

		out_buffer.append (text)
	
end
else
--|#line 290 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 290")
end

		out_buffer.append (text)
		out_buffer.append (".0.0")
	
end
end
end
else
if yy_act <= 48 then
if yy_act <= 45 then
if yy_act <= 43 then
if yy_act = 42 then
--|#line 296 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 296")
end

		out_buffer.append (text)
	
else
--|#line 300 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 300")
end
				-- beginning of a string
		out_buffer.append (text)
		set_start_condition (IN_STR)
	
end
else
if yy_act = 44 then
--|#line 306 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 306")
end
out_buffer.append (text)
else
--|#line 308 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 308")
end
out_buffer.append (text)
end
end
else
if yy_act <= 47 then
if yy_act = 46 then
--|#line 310 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 310")
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
--|#line 316 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 316")
end

				out_buffer.append (text)
	
end
end
else
if yy_act <= 51 then
if yy_act <= 50 then
if yy_act = 49 then
--|#line 320 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 320")
end
						-- match final end of string
				out_buffer.append (text)
				set_start_condition (INITIAL)
	
else
--|#line 325 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 325")
end
	-- Catch-all rules (no backing up)
				set_start_condition (INITIAL)
	
end
else
--|#line 333 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 333")
end
		-- read non '[' non-space characters followed by whitespace then '['
		out_buffer.append (text)
	
end
else
if yy_act <= 53 then
if yy_act = 52 then
--|#line 337 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 337")
end
						-- read non '[' non-space characters followed by whitespace then '['
		out_buffer.append (text)
	
else
--|#line 343 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 343")
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
			create an_array.make_filled (0, 0, 1365)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,   14,   15,   16,   15,   17,   14,   14,   14,   14,
			   14,   18,   14,   14,   14,   14,   14,   14,   19,   19,
			   19,   19,   19,   19,   19,   20,   14,   14,   14,   19,
			   19,   19,   19,   19,   19,   19,   19,   14,   14,   14,
			   14,   14,   14,   14,   14,   14,   14,   21,   53,   21,
			   53,   54,   54,   54,   54,   54,   54,   22,   22,   22,
			   53,   79,   53,   23,   23,   23,   23,   24,   23,   23,
			   66,   54,   66,   22,   23,   23,   23,   24,   23,   23,
			   23,   23,   26,   26,   72,   72,   75,   75,   26,   27,
			   72,   80,   75,   80,   81,   79,   26,   84,   72,   90,

			   75,   53,   97,   53,   53,   91,   53,   28,   98,   29,
			   26,   26,   54,   54,   54,   82,   26,   27,  107,  103,
			  104,   80,  112,   80,   26,  105,  113,   99,  228,   83,
			   83,   83,  115,  264,  115,   28,  108,   29,   25,   30,
			   30,   25,   25,   25,   25,   30,   31,   32,   25,   32,
			   32,   32,   25,   30,   25,   32,   32,   32,   32,   32,
			   32,   32,   25,   25,   33,   32,   32,   32,   32,   32,
			   32,   32,   32,   32,   25,   25,   25,   25,   25,   25,
			   25,   25,   25,   25,   35,   79,   36,   93,   66,   54,
			   66,   67,   68,   67,   58,  185,   79,  103,  104,   79,

			   72,   72,  240,  105,   75,   75,   72,   37,   79,  128,
			   75,   90,  134,  135,   72,  129,   95,   91,   75,   85,
			   85,   85,   96,   38,   39,   40,   41,   42,   35,   64,
			   36,   86,   86,   87,   87,   87,  103,  104,   90,   79,
			  239,   93,  105,  264,   91,  121,  122,  123,  124,  125,
			  116,   37,   79,  104,  141,   79,  131,   97,  105,   79,
			  264,  116,  129,   98,   98,  151,  236,   38,   39,   40,
			   41,   42,   43,   83,   83,   83,   96,   44,  264,   44,
			   44,   44,   99,   53,   44,   53,   83,   83,   83,  126,
			  126,  126,   45,  127,  127,  127,  140,  264,  110,  133,

			   79,  134,  135,  234,  111,   46,   43,  136,  264,   91,
			  131,   44,  231,   44,   44,   44,  128,  130,   44,  130,
			  130,  130,  129,  115,  130,  115,   45,  132,  150,  150,
			  150,   90,  264,  178,   83,   83,   83,   91,  228,   46,
			   25,   47,   47,   47,   48,   25,   25,   25,   25,   25,
			   49,   50,   50,   50,   25,   25,   25,   50,   50,   50,
			   50,   50,   50,   50,   51,   25,   25,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   25,   25,   25,   25,
			   25,   25,   25,   25,   25,   25,   53,   79,   53,  153,
			  221,   94,  136,  154,  141,  222,   57,   57,   57,   79,

			  264,  159,   57,   57,   57,   57,   57,   57,   57,   79,
			  186,   94,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   58,  213,   84,   59,   60,  141,   79,   60,   60,
			  103,  104,  264,   85,   85,   85,  105,  164,  164,  164,
			  210,  264,  200,  149,   86,   86,   79,  111,   62,  171,
			   63,  142,   94,  149,  197,  143,   64,   67,   68,   67,
			  195,   87,   87,   87,  241,  242,  163,   69,   69,   69,
			  103,   79,  185,   69,   69,   69,   69,   69,   69,   69,
			   83,   83,   83,   69,   69,   69,   69,   69,   69,   69,
			   69,   69,   70,   70,   70,  165,  166,  166,   70,   70,

			   70,   70,   70,   70,   70,   83,   83,   83,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,  110,  241,  242,
			  264,   60,  141,  111,   60,   60,  103,  104,  264,  160,
			  109,  182,  105,  169,  169,  169,  141,  168,  172,  172,
			  172,  217,  264,  175,  175,  175,  218,  264,  168,  176,
			  177,  177,  264,  119,  119,  120,  119,  119,  119,  119,
			  119,   76,   76,  119,   76,   76,   76,  119,  119,  119,
			   76,   76,   76,   76,   76,   76,   76,  119,  119,  119,
			   76,   76,   76,   76,   76,   76,   76,   76,   76,  119,
			  119,  119,  119,  119,  119,  119,  119,  119,  119,  138,

			  138,  138,  179,  179,  179,  138,  138,  138,  138,  138,
			  138,  138,  180,  181,  181,  138,  138,  138,  138,  138,
			  138,  138,  138,  138,  139,  139,  139,  181,  181,  181,
			  139,  139,  139,  139,  139,  139,  139,  184,  184,  184,
			  139,  139,  139,  139,  139,  139,  139,  139,  139,  119,
			  119,  163,  119,  119,  119,  187,  187,  187,  119,  119,
			  119,  119,  119,  119,  119,  189,  189,  189,  119,  119,
			  119,  119,  119,  119,  119,  119,  119,   53,  161,   53,
			  190,  191,  191,  191,  191,  191,  192,  192,  192,  193,
			  194,  194,  154,  157,  157,  157,  157,  157,  157,  157,

			  194,  194,  194,  198,  157,  157,  157,  157,  157,  157,
			  157,  157,  173,  173,  173,  173,  173,  173,  173,   89,
			   94,  167,  161,  173,  173,  173,  173,  173,  173,  173,
			  173,  174,  174,  174,  199,  199,  199,  174,  174,  174,
			  174,  174,  174,  174,  201,  201,  201,  174,  174,  174,
			  174,  174,  174,  174,  174,  174,  103,  104,  103,  104,
			  204,  206,  105,  158,  105,  202,  203,  203,  196,  183,
			  203,  203,  203,  184,  212,  212,  208,  205,  207,  183,
			  188,  188,  188,  199,  232,  232,  188,  188,  188,  188,
			  188,  188,  188,  209,  243,  214,  188,  188,  188,  188,

			  188,  188,  188,  188,  188,  103,  104,  156,  219,  185,
			  221,  105,  215,  220,  264,  222,  264,  201,  235,  235,
			  211,  216,  216,  216,  216,  216,  216,  216,  223,  224,
			  224,  109,  216,  216,  216,  216,  216,  216,  216,  216,
			  225,  226,  227,  109,  225,  227,  227,  109,  229,  230,
			  229,  203,  237,  238,  155,  103,  104,  203,  238,  238,
			  197,  105,  212,  212,  212,  233,  233,  233,  229,  230,
			  229,  233,  233,  233,  233,  233,  233,  233,  246,  246,
			  246,  233,  233,  233,  233,  233,  233,  233,  233,  233,
			  204,  135,  152,  185,  204,  109,  224,  224,  224,  109,

			  208,  208,  248,  248,  248,  109,  206,  205,  227,  227,
			  227,  205,  214,  148,  232,  232,  232,  209,  209,  217,
			  250,  250,  250,  207,  218,  219,  235,  235,  235,  215,
			  220,  252,  238,  238,  238,  244,  244,  244,   53,  147,
			   53,  244,  244,  244,  244,  244,  244,  244,  253,  252,
			  146,  244,  244,  244,  244,  244,  244,  244,  244,  244,
			  255,  256,  256,   53,  111,   53,  258,   53,   53,   53,
			   53,  144,  245,  247,  247,  247,  249,  137,  247,  247,
			  247,   53,   53,   53,   53,   89,   53,   79,   53,  118,
			  117,  251,  251,  251,  254,  262,  251,  251,  251,   53, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  252,   53,  256,  256,  256,  114,  109,   56,  102,  257,
			  257,  257,  100,  263,   89,   79,   76,  258,   53,   74,
			   53,   73,   53,  259,   53,  260,   71,   56,  257,  257,
			  257,  264,  261,  261,  261,   53,  264,   53,   53,  264,
			   53,  264,  264,  264,  264,  261,  261,  261,  261,  261,
			  261,  264,  264,  264,  264,  262,   25,   25,   25,   25,
			   25,   25,   25,   25,   25,   25,   25,   25,   25,   25,
			   25,   25,   25,   34,   34,   34,   34,   34,   34,   34,
			   34,   34,   34,   34,   34,   34,   34,   34,   34,   34,
			   52,   52,  264,  264,   52,   52,   52,   52,   52,   52,

			   52,   52,   52,  264,   52,   52,   52,   55,   55,  264,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,  264,   55,   55,   61,  264,   61,   61,  264,   61,
			   61,  264,   61,   61,  264,   61,  264,  264,   61,   61,
			   65,   65,   65,  264,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,  264,   65,   65,   65,   77,   77,  264,
			   77,   77,  264,   77,  264,  264,   77,   78,   78,  264,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,  264,   78,   78,   88,   88,  264,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   92,   88,

			   88,   94,   92,  264,   92,  264,   92,   92,  264,   94,
			   94,  264,   94,  264,  264,   94,   94,  101,  101,  264,
			  101,  264,  264,  101,  106,  264,  106,  106,  106,  106,
			  106,  264,  106,  264,  264,  106,   60,  264,   60,   60,
			  264,   60,   60,   60,   60,  264,  264,   60,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,  145,  170,  170,  264,  170,
			  264,  264,  170,  145,  145,  264,  145,  130,  264,  145,
			  264,  130,  264,  130,  264,  130,  130,  162,  264,  264,
			  264,  264,  162,  162,  264,  162,  162,  264,  162,  264,

			  264,  162,  151,  151,  264,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  264,  151,  151,   13,
			  264,  264,  264,  264,  264,  264,  264,  264,  264,  264,
			  264,  264,  264,  264,  264,  264,  264,  264,  264,  264,
			  264,  264,  264,  264,  264,  264,  264,  264,  264,  264,
			  264,  264,  264,  264,  264,  264,  264,  264,  264,  264,
			  264,  264,  264,  264,  264,  264, yy_Dummy>>,
			1, 366, 1000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1365)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    2,   14,    2,
			   14,   15,   15,   15,   16,   16,   16,    2,    2,    2,
			   18,   39,   18,    2,    2,    2,    2,    2,    2,    2,
			   21,   21,   21,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    3,    3,   26,   26,   30,   30,    3,    3,
			   26,   35,   30,   35,   37,   38,    3,   39,   26,   44,

			   30,   52,   46,   52,   53,   44,   53,    3,   46,    3,
			    4,    4,   54,   54,   54,   37,    4,    4,   59,   57,
			   57,   80,   62,   80,    4,   57,   62,   46,  228,   38,
			   38,   38,   65,   65,   65,    4,   59,    4,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    7,   40,    7,   45,   66,   66,
			   66,   67,   67,   67,   58,  231,   41,   70,   70,   42,

			   72,   72,  231,   70,   75,   75,   72,    7,   83,   89,
			   75,   90,  134,  134,   72,   89,   45,   90,   75,   40,
			   40,   40,   45,    7,    7,    7,    7,    7,    8,   58,
			    8,   41,   41,   42,   42,   42,   71,   71,   92,   84,
			  221,   93,   71,   94,   92,   83,   83,   83,   83,   83,
			   71,    8,   85,  139,  106,   86,   94,   97,  139,   87,
			  106,   71,  129,   97,   98,  129,  219,    8,    8,    8,
			    8,    8,    9,   84,   84,   84,   93,    9,   94,    9,
			    9,    9,   97,  105,    9,  105,   85,   85,   85,   86,
			   86,   86,    9,   87,   87,   87,  105,   95,  110,   98,

			  121,   99,   99,  217,  110,    9,   10,   99,  162,   91,
			   95,   10,  213,   10,   10,   10,  128,   91,   10,   91,
			   91,   91,  128,  115,   91,  115,   10,   95,  118,  118,
			  118,  130,   95,  162,  121,  121,  121,  130,  210,   10,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   19,  122,   19,  132,
			  238,  132,  136,  136,  142,  238,   19,   19,   19,  123,

			  142,  142,   19,   19,   19,   19,   19,   19,   19,  124,
			  171,  171,   19,   19,   19,   19,   19,   19,   19,   19,
			   19,   20,  198,  122,   20,   20,  108,  125,   20,   20,
			  116,  116,  108,  123,  123,  123,  116,  146,  146,  146,
			  195,  145,  188,  116,  124,  124,  126,  145,   20,  153,
			   20,  108,  153,  116,  184,  108,   20,   22,   22,   22,
			  182,  125,  125,  125,  233,  233,  145,   22,   22,   22,
			  174,  127,  170,   22,   22,   22,   22,   22,   22,   22,
			  126,  126,  126,   22,   22,   22,   22,   22,   22,   22,
			   22,   22,   23,   23,   23,  147,  147,  147,   23,   23,

			   23,   23,   23,   23,   23,  127,  127,  127,   23,   23,
			   23,   23,   23,   23,   23,   23,   23,   61,  244,  244,
			   61,   61,  143,   61,   61,   61,  149,  149,  143,  143,
			   61,  167,  149,  150,  150,  150,  159,  149,  155,  155,
			  155,  201,  159,  159,  159,  159,  201,  201,  149,  160,
			  160,  160,   61,   76,   76,   76,   76,   76,   76,   76,
			   76,   76,   76,   76,   76,   76,   76,   76,   76,   76,
			   76,   76,   76,   76,   76,   76,   76,   76,   76,   76,
			   76,   76,   76,   76,   76,   76,   76,   76,   76,   76,
			   76,   76,   76,   76,   76,   76,   76,   76,   76,  103,

			  103,  103,  164,  164,  164,  103,  103,  103,  103,  103,
			  103,  103,  165,  165,  165,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  104,  104,  104,  166,  166,  166,
			  104,  104,  104,  104,  104,  104,  104,  169,  169,  169,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  119,
			  119,  163,  119,  119,  119,  172,  172,  172,  119,  119,
			  119,  119,  119,  119,  119,  175,  175,  175,  119,  119,
			  119,  119,  119,  119,  119,  119,  119,  140,  161,  140,
			  176,  176,  176,  177,  177,  177,  179,  179,  179,  180,
			  180,  180,  154,  140,  140,  140,  140,  140,  140,  140,

			  181,  181,  181,  186,  140,  140,  140,  140,  140,  140,
			  140,  140,  156,  156,  156,  156,  156,  156,  156,  151,
			  186,  148,  144,  156,  156,  156,  156,  156,  156,  156,
			  156,  157,  157,  157,  187,  187,  187,  157,  157,  157,
			  157,  157,  157,  157,  189,  189,  189,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  168,  168,  183,  183,
			  192,  193,  168,  141,  183,  190,  190,  190,  183,  168,
			  191,  191,  191,  197,  197,  197,  194,  192,  193,  168,
			  173,  173,  173,  214,  214,  214,  173,  173,  173,  173,
			  173,  173,  173,  194,  240,  199,  173,  173,  173,  173,

			  173,  173,  173,  173,  173,  196,  196,  138,  202,  240,
			  203,  196,  199,  202,  202,  203,  203,  218,  218,  218,
			  196,  200,  200,  200,  200,  200,  200,  200,  204,  204,
			  204,  204,  200,  200,  200,  200,  200,  200,  200,  200,
			  206,  206,  206,  206,  208,  208,  208,  208,  211,  211,
			  211,  220,  220,  220,  137,  211,  211,  222,  222,  222,
			  212,  211,  212,  212,  212,  216,  216,  216,  229,  229,
			  229,  216,  216,  216,  216,  216,  216,  216,  243,  243,
			  243,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  223,  135,  131,  243,  224,  223,  224,  224,  224,  224,

			  225,  227,  246,  246,  246,  225,  226,  223,  226,  226,
			  226,  224,  232,  114,  232,  232,  232,  225,  227,  235,
			  248,  248,  248,  226,  235,  237,  235,  235,  235,  232,
			  237,  250,  237,  237,  237,  241,  241,  241,  242,  113,
			  242,  241,  241,  241,  241,  241,  241,  241,  250,  255,
			  112,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  252,  252,  252,  245,  111,  245,  255,  263,  247,  263,
			  247,  109,  242,  245,  245,  245,  247,  102,  247,  247,
			  247,  249,  260,  249,  260,   88,  251,   78,  251,   74,
			   73,  249,  249,  249,  251,  263,  251,  251,  251,  254, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  256,  254,  256,  256,  256,   63,   60,   55,   51,  254,
			  254,  254,   48,  260,   43,   34,   31,  256,  257,   29,
			  257,   27,  259,  257,  259,  257,   24,   17,  257,  257,
			  257,   13,  259,  259,  259,  261,    0,  261,  262,    0,
			  262,    0,    0,    0,    0,  261,  261,  261,  262,  262,
			  262,    0,    0,    0,    0,  259,  265,  265,  265,  265,
			  265,  265,  265,  265,  265,  265,  265,  265,  265,  265,
			  265,  265,  265,  266,  266,  266,  266,  266,  266,  266,
			  266,  266,  266,  266,  266,  266,  266,  266,  266,  266,
			  267,  267,    0,    0,  267,  267,  267,  267,  267,  267,

			  267,  267,  267,    0,  267,  267,  267,  268,  268,    0,
			  268,  268,  268,  268,  268,  268,  268,  268,  268,  268,
			  268,    0,  268,  268,  269,    0,  269,  269,    0,  269,
			  269,    0,  269,  269,    0,  269,    0,    0,  269,  269,
			  270,  270,  270,    0,  270,  270,  270,  270,  270,  270,
			  270,  270,  270,    0,  270,  270,  270,  271,  271,    0,
			  271,  271,    0,  271,    0,    0,  271,  272,  272,    0,
			  272,  272,  272,  272,  272,  272,  272,  272,  272,  272,
			  272,    0,  272,  272,  273,  273,    0,  273,  273,  273,
			  273,  273,  273,  273,  273,  273,  273,  273,  274,  273,

			  273,  275,  274,    0,  274,    0,  274,  274,    0,  275,
			  275,    0,  275,    0,    0,  275,  275,  276,  276,    0,
			  276,    0,    0,  276,  277,    0,  277,  277,  277,  277,
			  277,    0,  277,    0,    0,  277,  278,    0,  278,  278,
			    0,  278,  278,  278,  278,    0,    0,  278,  279,  279,
			  279,  279,  279,  279,  279,  279,  279,  279,  279,  279,
			  279,  279,  279,  279,  279,  280,  284,  284,    0,  284,
			    0,    0,  284,  280,  280,    0,  280,  281,    0,  280,
			    0,  281,    0,  281,    0,  281,  281,  282,    0,    0,
			    0,    0,  282,  282,    0,  282,  282,    0,  282,    0,

			    0,  282,  283,  283,    0,  283,  283,  283,  283,  283,
			  283,  283,  283,  283,  283,  283,    0,  283,  283,  264,
			  264,  264,  264,  264,  264,  264,  264,  264,  264,  264,
			  264,  264,  264,  264,  264,  264,  264,  264,  264,  264,
			  264,  264,  264,  264,  264,  264,  264,  264,  264,  264,
			  264,  264,  264,  264,  264,  264,  264,  264,  264,  264,
			  264,  264,  264,  264,  264,  264, yy_Dummy>>,
			1, 366, 1000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,   45,   80,  108,  137,    0,  181,  225,  267,
			  301,  339,    0, 1031,   46,   49,   52, 1022,   58,  384,
			  419,   68,  455,  480, 1005, 1319,   82, 1012, 1319,  985,
			   84, 1007,    0, 1319, 1010,   89, 1319,   89,   90,   56,
			  180,  191,  194, 1009,   97,  185,  100, 1319,  985, 1319,
			    0,  979,   99,  102,  110, 1002, 1319,  110,  192,  107,
			  991,  515,   92,  973, 1319,  130,  186,  189, 1319,    0,
			  188,  227,  198,  987,  977,  202,  552,    0,  982, 1319,
			  119, 1319, 1319,  203,  234,  247,  250,  254,  980,  207,
			  209,  307,  236,  239,  241,  295, 1319,  255,  262,  299,

			 1319,    0,  943,  587,  612,  281,  249, 1319,  421,  956,
			  296,  962,  938,  927,  883,  321,  421, 1319,  316,  640,
			 1319,  295,  382,  394,  404,  422,  441,  466,  314,  260,
			  329,  877,  359, 1319,  210,  889,  390,  842,  798,  243,
			  675,  736,  389,  517,  720,  439,  425,  483,  692,  517,
			  521,  714,    0,  420,  690,  526,  694,  719, 1319,  531,
			  537,  676,  306,  649,  590,  600,  615,  500,  747,  625,
			  445,  379,  643,  768,  461,  653,  668,  671, 1319,  674,
			  677,  688,  445,  749,  444, 1319,  688,  722,  432,  732,
			  753,  758,  750,  751,  766,  425,  796,  761,  407,  785,

			  803,  536,  803,  805,  816, 1319,  828, 1319,  832, 1319,
			  336,  846,  850,  283,  771, 1319,  853,  276,  805,  239,
			  839,  213,  845,  880,  884,  890,  896,  891,  126,  866,
			 1319,  168,  902,  455, 1319,  914, 1319,  920,  385, 1319,
			  782,  923,  936,  866,  509,  961,  890,  966,  908,  979,
			  921,  984,  948, 1319,  997,  939,  990, 1016, 1319, 1020,
			  980, 1033, 1036,  965, 1319, 1055, 1072, 1089, 1106, 1122,
			 1139, 1150, 1166, 1183, 1196, 1199, 1207, 1219, 1231, 1247,
			 1263, 1275, 1285, 1301, 1256, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  264,    1,  265,  265,  264,    5,  266,  266,  265,
			  265,  264,   11,  264,  267,  264,  264,  268,  267,  267,
			  269,  270,   19,   22,   23,  264,  264,  264,  264,  264,
			  264,  271,  271,  264,  272,  264,  264,  264,  272,  272,
			  272,  272,  272,  273,  274,  275,  264,  264,  264,  264,
			  276,  264,  267,  264,  264,  268,  264,   19,  264,  277,
			  278,  269,   61,   61,  264,  270,  270,  264,  264,   22,
			   23,   23,  264,  279,  264,  264,  264,  271,  272,  264,
			  264,  264,  264,  272,  272,  272,  272,  272,  273,  264,
			  264,  264,  274,  264,  275,  275,  264,  264,  264,  264,

			  264,  276,  264,   19,  103,  267,  277,  264,  277,  264,
			  264,  280,   61,   61,   61,  264,   23,  264,  264,   76,
			  264,  272,  272,  272,  272,  272,  272,  272,  264,  264,
			  281,  264,   95,  264,  264,  264,  264,  264,  103,  104,
			  267,  264,  277,  277,  282,  280,   61,   61,   61,   23,
			  264,  283,  284,   95,  264,  264,  140,  156,  264,  277,
			  159,  264,  282,  264,   61,   61,   61,   61,   23,  264,
			  284,   95,  264,  157,  157,  159,  159,  159,  264,   61,
			   61,   61,   61,   23,  264,  264,   95,  264,  173,  159,
			  159,  159,   61,   61,   61,  264,   23,  264,  264,  264,

			  156,  277,  277,  277,  278,  264,  278,  264,  278,  264,
			  282,   23,  264,  284,  264,  264,  200,  264,  159,  264,
			  159,  264,  159,  278,  278,  278,  224,  226,  264,  264,
			  264,  284,  264,  216,  264,  159,  264,  235,  237,  264,
			  284,  216,  267,  284,  241,  267,  243,  267,  243,  267,
			  284,  267,  264,  264,  267,  264,  264,  267,  264,  267,
			  267,  267,  267,  267,    0,  264,  264,  264,  264,  264,
			  264,  264,  264,  264,  264,  264,  264,  264,  264,  264,
			  264,  264,  264,  264,  264, yy_Dummy>>)
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
			   18,   19,   18,   18,   18,   18,   20,   18,   21,   22,
			   18,   18,   18,   18,   23,   18,   18,   18,   18,   24,
			   18,   25,   26,   27,    1,   28,    1,   29,   18,   30,

			   18,   18,   18,   19,   18,   18,   18,   18,   31,   18,
			   21,   32,   18,   18,   33,   18,   34,   35,   36,   18,
			   18,   24,   18,   37,   17,   38,    1,    1,   39,   39,
			   39,   39,   39,   39,   39,   39,   39,   39,   39,   39,
			   39,   39,   39,   39,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   41,   41,   41,   41,   41,   41,   41,   41,   41,   41,
			   41,   41,   41,   41,   41,   41,   41,   41,   41,   41,
			   41,   41,   41,   41,   41,   41,   41,   41,   41,   41,
			   41,   41,    1,    1,   42,   42,   42,   42,   42,   42,

			   42,   42,   42,   42,   42,   42,   42,   42,   42,   42,
			   42,   42,   42,   42,   42,   42,   42,   42,   42,   42,
			   42,   42,   42,   42,   43,   44,   44,   44,   44,   44,
			   44,   44,   44,   44,   44,   44,   44,   44,   44,   44,
			   45,   46,   46,   46,   46,   46,   46,   46,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    3,    1,    4,    5,    1,    6,    7,
			    8,    9,   10,   10,   11,   12,    1,    6,   13,   13,
			   13,   13,   13,   13,   13,   14,   15,    1,   13,   13,
			   13,   13,   13,   13,   13,   13,   16,   17,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   55,   52,    1,    1,   43,   32,   52,
			   53,    1,   52,   52,   52,   54,   23,   54,   25,   54,
			   29,   28,   28,   31,   47,   48,   49,   50,   47,   47,
			   47,   47,   47,   54,   15,   54,   54,   37,   54,   36,
			   34,   54,   52,   52,    1,   43,   42,   52,    0,    0,
			    0,    0,    0,    0,   12,   51,    1,   52,    3,   52,
			   52,   52,   23,    0,    0,   29,   28,   28,   47,   49,
			   48,   45,   44,   46,   47,   47,   47,   47,    0,   13,
			    0,    0,   15,    0,    0,    0,   18,    0,    0,    0,

			   38,   34,    0,   52,   52,   52,    0,   33,    0,    0,
			    0,    0,    0,    0,    0,   51,   52,   24,    0,    0,
			   30,   47,   47,   47,   47,   47,   47,   47,    0,    0,
			   15,    0,    0,   14,    0,   20,    0,    0,   52,   52,
			   52,    0,    0,    0,   27,    0,    0,    0,    0,   52,
			    0,    0,    0,    0,   19,    0,   52,   52,   39,    0,
			    0,   27,    0,   11,    0,    0,    0,    0,   52,    0,
			    0,    0,    0,   52,   52,    0,    0,    0,   26,    0,
			    0,    0,    0,   52,   22,   17,    0,    0,   52,    0,
			    0,    0,    0,    6,    6,    0,   52,    0,    0,    0,

			   52,    0,    0,    0,    0,    7,    0,    4,    0,    5,
			   21,   52,   22,    0,    0,   35,   52,    0,    0,    0,
			    0,    0,    0,    0,    0,    6,    6,    6,   21,   52,
			    2,    0,    0,   52,   10,    0,    8,    0,    0,    9,
			    0,   52,   52,    0,   52,   52,    0,   41,    0,   52,
			    0,   52,    0,   16,   52,    0,    0,   52,   16,   52,
			   52,   40,   52,   52,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 1319
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 264
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 265
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

	yyNb_rules: INTEGER = 54
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 55
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
