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

	SHARED_ADL_APP_RESOURCES
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
--|#line 70 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 70")
end
out_buffer.append (text)
else
--|#line 72 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 72")
end
out_buffer.append (text)			-- pass separate comment line endings
end
else
if yy_act = 3 then
--|#line 76 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 76")
end

		out_buffer.append (text)
		in_terminology := True
	
else
--|#line 81 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 81")
end

		out_buffer.append (text)
	
end
end
else
if yy_act <= 6 then
if yy_act = 5 then
--|#line 87 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 87")
end

		out_buffer.append_character ('[')
		output_new_id_code (text_substring (2, text_count - 1))
		out_buffer.append_character (']')
	
else
--|#line 93 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 93")
end

		out_buffer.append_character ('[')
		output_new_id_code (text_substring (2, text_count - 1))
		out_buffer.append_character (']')
	
end
else
if yy_act = 7 then
--|#line 100 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 100")
end

		out_buffer.append_character ('[')
		output_new_id_code (text_substring (2, text_count))
	
else
--|#line 105 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 105")
end

		out_buffer.append_character ('[')
		output_new_at_ac_code (text_substring (2, text_count - 1))
		out_buffer.append_character (']')
	
end
end
end
else
if yy_act <= 12 then
if yy_act <= 10 then
if yy_act = 9 then
--|#line 111 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 111")
end

		out_buffer.append (text)
	
else
--|#line 117 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 117")
end

		output_converted_code_dt_key (text_substring (3, text_count - 2))
	
end
else
if yy_act = 11 then
--|#line 121 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 121")
end

		output_converted_code_dt_key (text_substring (3, text_count - 2))
	
else
--|#line 125 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 125")
end

		output_converted_code_dt_key (text_substring (3, text_count - 2))
	
end
end
else
if yy_act <= 14 then
if yy_act = 13 then
--|#line 130 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 130")
end

		out_buffer.append (text)
	
else
--|#line 134 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 134")
end
		-- match [{
		out_buffer.append (text)
		set_start_condition (IN_TUPLE)
	
end
else
--|#line 140 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 140")
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
--|#line 144 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 144")
end
 							-- interior }, { pattern
		out_buffer.append (text)
	
else
--|#line 148 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 148")
end
			-- numbers and lists of numbers and symbols (e.g. in intervals)
		out_buffer.append (text)
	
end
else
if yy_act = 18 then
--|#line 152 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 152")
end
						-- ADL codes
		out_buffer.append ("[local::")
		output_new_at_ac_code (text_substring (9, text_count-1))
		out_buffer.append_character (']')
	
else
--|#line 158 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 158")
end
				-- other codes
		out_buffer.append (text)
	
end
end
else
if yy_act <= 21 then
if yy_act = 20 then
--|#line 162 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 162")
end
out_buffer.append (text)			-- pass separate comment lines
else
--|#line 164 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 164")
end
										-- match [{
		out_buffer.append (text)
	
end
else
if yy_act = 22 then
--|#line 168 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 168")
end
						-- termination of interior tuple line }],\n with optional comment
		out_buffer.append (text)
		set_start_condition (INITIAL)
	
else
--|#line 173 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 173")
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
--|#line 191 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 191")
end
						-- ADL codes
	out_buffer.append ("[local::")
	output_new_at_ac_code (text_substring (9, text_count-1))
	out_buffer.append_character (']')

else
--|#line 197 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 197")
end

		out_buffer.append (text)
		set_start_condition (IN_ADL_VALUE_SET_DEF)
	
end
else
if yy_act = 26 then
--|#line 203 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 203")
end
 -- match second last line with ';' termination (assumed value)
		output_new_at_ac_code (text)
	
else
--|#line 207 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 207")
end
out_buffer.append (text)
end
end
else
if yy_act <= 29 then
if yy_act = 28 then
--|#line 210 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 210")
end
out_buffer.append (text)
else
--|#line 212 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 212")
end

		out_buffer.append (text)
		set_start_condition (INITIAL)
	
end
else
--|#line 220 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 220")
end
 
		if in_terminology then
			create term_code.make_from_string (text.substring (2, text_count - 1))
			out_buffer.append (uri_for_terminology_code (term_code))
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
--|#line 241 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 241")
end

		out_buffer.append (text)
		set_start_condition (IN_VALUE_SET_DEF)
	
else
--|#line 246 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 246")
end

		out_buffer.append (text)
		set_start_condition (IN_VALUE_SET_DEF)
	
end
else
if yy_act = 33 then
--|#line 252 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 252")
end
 
		out_buffer.append (text)
	
else
--|#line 256 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 256")
end

		out_buffer.append (text)
	
end
end
else
if yy_act <= 36 then
if yy_act = 35 then
--|#line 261 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 261")
end
out_buffer.append (text)
else
--|#line 263 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 263")
end

		out_buffer.append (text)
		set_start_condition (INITIAL)
	
end
else
if yy_act = 37 then
--|#line 270 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 270")
end

	out_buffer.append (text)
	set_start_condition (IN_PATH)

else
--|#line 275 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 275")
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
--|#line 281 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 281")
end
 
		out_buffer.append (text)
	
else
--|#line 285 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 285")
end
 
		out_buffer.append_character ('[')
		output_new_id_code (text_substring (2, text_count - 1))
		out_buffer.append_character (']')
	
end
else
if yy_act = 41 then
--|#line 291 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 291")
end

		out_buffer.append (text)
	
else
--|#line 295 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 295")
end

		out_buffer.append (text)
		set_start_condition (INITIAL)
	
end
end
else
if yy_act <= 44 then
if yy_act = 43 then
--|#line 300 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 300")
end

		out_buffer.append (text)
		set_start_condition (INITIAL)
	
else
--|#line 308 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 308")
end
out_buffer.append (text)
end
else
--|#line 310 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 310")
end
out_buffer.append (text)
end
end
end
else
if yy_act <= 53 then
if yy_act <= 49 then
if yy_act <= 47 then
if yy_act = 46 then
--|#line 313 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 313")
end

		out_buffer.append (text)
	
else
--|#line 318 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 318")
end
			-- can occur in some string data
		out_buffer.append_character ('"')
		output_new_at_ac_code (text_substring (2, text_count - 1))
		out_buffer.append_character ('"')
	
end
else
if yy_act = 48 then
--|#line 324 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 324")
end

		out_buffer.append (text)
	
else
--|#line 328 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 328")
end
				-- beginning of a string
		out_buffer.append (text)
		set_start_condition (IN_STR)
	
end
end
else
if yy_act <= 51 then
if yy_act = 50 then
--|#line 334 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 334")
end
out_buffer.append (text)
else
--|#line 336 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 336")
end
out_buffer.append (text)
end
else
if yy_act = 52 then
--|#line 338 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 338")
end

				out_buffer.append (text)
	
else
--|#line 342 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 342")
end
out_buffer.append (text)
end
end
end
else
if yy_act <= 57 then
if yy_act <= 55 then
if yy_act = 54 then
--|#line 344 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 344")
end

				out_buffer.append (text)
	
else
--|#line 348 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 348")
end
						-- match final end of string
				out_buffer.append (text)
				set_start_condition (INITIAL)
	
end
else
if yy_act = 56 then
--|#line 353 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 353")
end
	-- Catch-all rules (no backing up)
				set_start_condition (INITIAL)
	
else
--|#line 361 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 361")
end
		-- read non '[' non-space characters followed by whitespace then '['
		out_buffer.append (text)
	
end
end
else
if yy_act <= 59 then
if yy_act = 58 then
--|#line 365 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 365")
end
						-- read non '[' non-space characters followed by whitespace then '['
		out_buffer.append (text)
	
else
--|#line 371 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 371")
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
			create an_array.make_filled (0, 0, 2598)
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
			   14,   14,   14,   14,   14,   14,   14,   14,   23,   62,
			   24,   23,   57,   92,   57,   57,  265,  119,  120,   25,
			   25,   25,   90,  121,  265,   26,   26,   26,   26,   27,
			   26,   26,  295,   63,   93,   25,   26,   26,   26,   27,
			   26,   26,   26,   26,   29,   29,   57,   29,   57,   57,
			   62,   29,   30,   58,   59,   59,   58,  128,   95,   29,

			  128,   60,   59,   59,   59,   59,   59,   59,   59,   59,
			   31,  293,   32,   29,   29,   57,   29,   57,   57,  116,
			   29,   30,  282,   64,   75,   59,   76,   75,   29,  137,
			  138,  138,   77,   76,   59,   76,   76,  202,  280,   31,
			  202,   32,   28,   33,   33,   28,   33,   28,   28,   28,
			   33,   34,   35,   28,   35,   35,   35,   28,   33,   28,
			   35,   35,   35,   35,   35,   35,   35,   28,   28,   36,
			   35,   35,   35,   35,   35,   35,   35,   35,   35,   28,
			   28,   28,   28,   28,   28,   28,   28,   28,   28,   38,
			   83,   83,   39,   83,  120,   86,   86,   83,   86,  121,

			   90,   91,   86,   91,   91,   83,   90,  265,  102,   90,
			   86,  102,   90,   40,   57,  103,   57,   57,   57,  105,
			   57,   57,  105,   59,   59,   59,   59,  301,  302,   41,
			   42,   43,   44,   45,   38,   97,   97,   39,  301,  302,
			   94,   94,   94,   96,   96,   96,   98,   98,   98,  107,
			  176,  177,  177,   66,  109,  108,   66,  109,   40,  250,
			  126,  110,   58,   59,   59,   58,  300,  129,  167,  132,
			   60,  129,  168,  211,   41,   42,   43,   44,   45,   46,
			  111,  322,  202,   47,   48,  202,   48,   48,   48,   73,
			  214,   48,  117,  118,  117,  117,  115,  127,  105,   49,

			  127,  105,   68,  274,  128,   68,   68,  133,  371,  133,
			  133,  126,   50,   46,  191,  273,  115,   47,   48,  192,
			   48,   48,   48,  127,  204,   48,  127,  204,   68,  265,
			  128,   68,   68,   49,  108,  260,  256,  126,   76,   59,
			   76,   76,   78,   79,   78,   78,   50,   28,   51,   51,
			   51,   51,   52,   28,   28,   28,   28,   28,   53,   54,
			   54,   54,   28,   28,   28,   54,   54,   54,   54,   54,
			   54,   54,   55,   28,   28,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   28,   28,   28,   28,   28,   28,
			   28,   28,   28,   28,   57,  119,   57,   57,  119,  120,

			   75,   59,   76,   75,  121,   65,   65,   65,   77,  186,
			   90,   65,   65,   65,   65,   65,   65,   65,  129,  129,
			  129,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   66,  119,  120,   66,   67,   68,  178,  121,   68,   68,
			  251,   69,   69,   69,  250,  135,   95,   70,   70,   70,
			   70,   70,   70,   70,  203,  203,  135,   69,   71,   70,
			   72,   70,   70,   70,   70,   70,   73,   56,   78,   79,
			   78,   78,  238,   56,   56,   56,   56,   56,   56,   80,
			   80,   80,   56,   56,   56,   80,   80,   80,   80,   80,
			   80,   80,   90,   56,   56,   80,   80,   80,   80,   80,

			   80,   80,   80,   80,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   81,   81,   81,  182,  182,  182,
			   81,   81,   81,   81,   81,   81,   81,   97,   97,  126,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,  122,
			  189,  190,  190,  122,  363,  123,  122,  122,  123,  123,
			  124,  123,  123,  123,  122,  122,  122,  123,  123,  123,
			  123,  123,  123,  123,  122,  122,  181,  123,  125,  123,
			  123,  123,  123,  123,  123,  123,  122,  122,  122,  122,
			  122,  122,  122,  122,  122,  122,  127,  231,  156,  127,
			  222,   68,  232,  128,   68,   68,  133,  371,  133,  133,

			  126,  234,   83,   83,  134,   83,  235,   86,   86,   83,
			   86,  198,  199,  199,   86,  130,  221,   83,   91,  131,
			   91,   91,   86,  139,  139,  140,  139,  139,  139,  139,
			  139,  139,   87,   87,  139,   87,   87,   87,  139,  139,
			  139,   87,   87,   87,   87,   87,   87,   87,  139,  139,
			  139,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			  139,  139,  139,  139,  139,  139,  139,  139,  139,  139,
			   90,  223,  148,  102,  289,  148,  102,  289,   90,  149,
			  103,   90,  103,  102,   90,  103,  102,   90,  225,  371,
			  103,  151,  371,  151,  151,  151,  110,   62,  151,  110,

			  200,  201,  201,  152,  160,  161,  161,  141,  142,  143,
			  144,  145,   94,   94,   94,   94,   94,   94,  146,  146,
			  146,  147,  147,  147,  109,  371,  133,  109,  133,  133,
			   90,  110,  154,  155,  156,   57,  155,   57,   57,   62,
			  157,  158,  117,  118,  117,  117,  193,  193,  193,  164,
			  111,  162,  162,  162,  100,   90,  207,  162,  162,  162,
			  162,  162,  162,  162,   94,   94,   94,  162,  162,  162,
			  162,  162,  162,  162,  162,  162,  163,  163,  163,  209,
			  209,  209,  163,  163,  163,  163,  163,  163,  163,   96,
			   96,   96,  163,  163,  163,  163,  163,  163,  163,  163,

			  163,  122,  213,  213,  213,  122,  166,  123,  122,  122,
			  123,  123,  122,  123,  123,  123,  122,  122,  122,  123,
			  123,  123,  123,  123,  123,  123,  122,  122,  197,  123,
			  123,  123,  123,  123,  123,  123,  123,  123,  122,  122,
			  122,  122,  122,  122,  122,  122,  122,  122,  127,  277,
			  203,  127,  171,  172,   90,  128,  196,   90,  173,  194,
			   90,  179,  118,  179,  179,  115,  181,  238,  182,  182,
			  182,  284,  188,  129,  119,  120,  285,  129,  171,  172,
			  121,  174,  175,  175,  173,  115,  185,  180,   98,   98,
			   98,   94,   94,   94,   94,   94,   94,  180,  149,  129,

			  184,  149,  183,  129,  139,  139,  169,  139,  139,  139,
			  217,  218,  218,  139,  139,  139,  139,  139,  139,  139,
			  219,  219,  219,  139,  139,  139,  139,  139,  139,  139,
			  139,  139,  148,  102,   68,  148,  102,   68,   68,  149,
			  103,  155,  156,  126,  155,  157,  186,  191,  157,  158,
			  165,  165,  192,  187,  193,  193,  193,   57,  371,   57,
			   57,  371,  118,   68,  159,  128,   68,   68,  179,  118,
			  179,  179,  126,  153,  195,  195,  195,  195,  195,  195,
			  195,  224,  224,  224,  204,  195,  195,  195,  195,  195,
			  195,  195,  195,  208,  150,  209,  209,  209,  211,  278, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  212,  213,  213,  129,  129,  129,  119,  120,  371,  100,
			  210,  371,  121,   90,  136,  214,  279,  216,   62,  223,
			  215,  224,  224,  224,   62,  226,  227,  227,  216,  203,
			  203,  228,  228,  228,  238,  126,  225,  229,  229,  229,
			  229,  229,  229,  229,  233,  233,  233,  238,  229,  229,
			  229,  229,  229,  229,  229,  229,  230,  230,  230,  237,
			  237,  237,  230,  230,  230,  230,  230,  230,  230,  243,
			  243,  243,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  231,  244,  245,  245,   62,  232,  234,  233,  233,
			  233,  115,  235,  114,  236,  237,  237,   68,  112,   68,

			  239,   68,   68,  172,  101,  100,  126,   68,  173,  202,
			   68,   68,  202,  241,  242,  242,  126,  203,  203,   90,
			  203,  203,  203,  246,  247,  247,  247,  247,  247,  129,
			  129,  129,  119,  120,   87,   85,  203,  181,  121,  218,
			  218,  218,  217,  217,  217,  249,   84,   82,  248,  252,
			  253,  253,  254,  254,  254,  249,  191,  371,  371,   62,
			  371,  192,  371,  227,  227,  227,  226,  226,  226,  255,
			  255,  255,  257,  258,  258,  255,  255,  255,  255,  255,
			  255,  255,  259,  259,  259,  255,  255,  255,  255,  255,
			  255,  255,  255,  255,  261,  262,  262,  263,  264,  264,

			  264,  264,  264,   68,  203,  126,   68,   68,  371,   68,
			   68,   68,  126,   68,  371,  371,   68,  208,  242,  242,
			  242,  238,  173,  361,  371,   68,  268,  268,  268,  211,
			  371,  245,  245,  245,  210,  269,  270,  270,  270,  270,
			  270,  129,  129,  129,  271,  371,  214,  119,  120,  252,
			  252,  252,  223,  121,  253,  253,  253,  272,  231,  257,
			  257,  257,  250,  232,  371,  258,  258,  258,  234,  225,
			  275,  261,  261,  235,  371,  262,  262,  262,  261,  261,
			  261,   68,  298,  203,   68,   68,  244,  288,  245,  208,
			  126,  129,  129,  129,  278,  371,  129,  129,  129,  211,

			  238,  129,  129,  129,  119,  120,  210,  371,  371,   68,
			  121,  279,   68,  286,  371,  371,  214,  371,  126,  281,
			  283,  283,  283,  283,  283,  283,  283,  261,  296,  262,
			  371,  283,  283,  283,  283,  283,  283,  283,  283,  289,
			  203,  203,  289,  291,  292,  291,  291,  203,  203,  371,
			  203,  203,  203,  371,  291,  292,  291,  291,  238,  307,
			  308,  308,  119,  120,  371,  299,  203,  290,  121,  294,
			  294,  294,  371,  371,  250,  294,  294,  294,  294,  294,
			  294,  294,  326,  326,  326,  294,  294,  294,  294,  294,
			  294,  294,  294,  294,   68,  371,  371,   68,   68,  284,

			   68,   68,   68,  126,  285,  371,  262,  262,  262,   68,
			  317,  371,   68,   68,  203,  203,   68,  371,  126,  203,
			  203,  371,  203,  203,  203,  277,  203,  334,  305,  306,
			  306,   68,  238,  371,  311,  312,  371,  238,  203,   57,
			  126,   57,   57,  238,  309,  309,  309,  327,  328,  328,
			  309,  309,  309,  309,  309,  309,  309,  371,  203,  323,
			  309,  309,  309,  309,  309,  309,  309,  309,  309,  314,
			  371,  315,  315,  315,  310,  317,  238,  318,  318,  318,
			  371,  314,   57,  325,   57,   57,  316,   68,  317,  371,
			   68,   68,  319,  320,  320,  320,  126,  371,  316,  371,

			  371,  329,  329,  329,   57,  319,   57,   57,  324,  325,
			  325,  371,  371,  330,  371,  320,  320,  320,   68,  371,
			  371,  311,  312,  238,  333,  333,  333,  126,  331,  331,
			  331,  126,  203,  203,  371,  203,  203,  203,  371,  371,
			  317,  371,  328,  328,  328,  203,  203,  314,  342,  343,
			  238,  203,  335,  335,  335,  371,   57,  334,   57,   57,
			  267,  267,  267,  238,  316,  371,  238,  336,  336,  336,
			  337,  371,  331,  331,  331,  126,  371,   57,  371,   57,
			   57,  341,  341,  341,  126,  371,  340,  338,  336,  336,
			  336,   57,  371,   57,   57,  345,  371,  341,  341,  341,

			  126,  371,  344,  344,  344,  203,  203,  203,  203,  203,
			   68,  371,  350,  350,  350,  342,  343,  351,  351,  351,
			  371,  371,   57,  238,   57,   57,  359,  359,  359,  371,
			  371,  347,   57,  238,   57,   57,  371,  371,  348,   57,
			  349,   57,   57,  344,  344,  344,  362,  362,  362,  360,
			  352,  352,  352,  355,  354,  356,   68,  371,  350,  350,
			  350,  357,  371,  351,  351,  351,  371,  371,   57,  371,
			   57,   57,   57,  353,   57,   57,  371,  371,  358,  352,
			  352,  352,  371,  352,  352,  352,   57,  371,   57,   57,
			  359,  359,  359,  359,  359,  359,  364,  371,  362,  362,

			  362,  365,  365,  365,  126,  338,  366,  366,  366,   68,
			  371,  365,  365,  365,  355,  353,  367,  371,  371,  366,
			  366,  366,  203,  203,  203,  371,  203,  203,  203,  370,
			  370,  370,  370,  370,  370,  371,  371,  371,  371,  371,
			  371,  371,  371,  368,  369,  371,  371,  358,   28,   28,
			   28,   28,   28,   28,   28,   28,   28,   28,   28,   28,
			   28,   28,   28,   28,   28,   28,   28,   28,   28,   28,
			   28,   37,   37,   37,   37,   37,   37,   37,   37,   37,
			   37,   37,   37,   37,   37,   37,   37,   37,   37,   37,
			   37,   37,   37,   37,   56,   56,  371,   56,   56,  371,

			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			  371,   56,   56,   56,   56,   56,   56,   61,   61,  371,
			   61,   61,   61,   61,   61,   61,   61,   61,   61,   61,
			   61,   61,   61,   61,  371,   61,   61,   61,   61,   61,
			   74,   74,   74,   74,   74,  371,   74,   74,   74,   74,
			   74,   74,   74,   74,   74,   74,  371,   74,   74,   74,
			   74,   74,   74,   88,   88,   88,   88,   88,  371,  371,
			   88,  371,  371,  371,   88,   88,   88,   89,   89,  371,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,  371,   89,   89,   89,   89,   89,

			   99,   99,  371,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,  371,   99,   99,
			   99,   99,   99,  104,  371,  371,  104,  371,  371,  104,
			  371,  104,  104,  104,  104,  371,  104,  106,  371,  371,
			  106,  371,  371,  371,  371,  371,  106,  106,  106,  371,
			  371,  106,  371,  371,  371,  106,  106,  106,  106,  113,
			  113,  113,  371,  371,  113,  371,  371,  371,  113,  113,
			  113,   64,   64,   64,   64,   64,   64,   64,   64,   64,
			   64,   64,   64,   64,   64,   64,   64,   64,   64,   64,
			   64,   64,   64,   64,   68,  371,   68,   68,   68,   68, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			   68,   68,  371,   68,  371,  371,  371,   68,   68,   68,
			   69,  371,  371,   69,  371,   69,   69,   69,   69,   69,
			   69,   69,   69,  371,   69,  371,  371,  371,   69,   69,
			   69,  129,  371,  371,  129,  371,  129,  129,  129,  129,
			  129,  129,  129,  129,  371,  129,  371,  371,  371,  129,
			  129,  129,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  115,  115,

			  115,  115,  115,  115,  115,  115,  115,  115,  115,  115,
			  115,  115,  115,  115,  115,  115,  115,  115,  115,  115,
			  115,  122,  371,  371,  371,  122,  122,  122,  122,  122,
			  122,  122,  122,  122,  122,  122,  122,  122,  122,  371,
			  122,  122,  122,  122,  170,  371,  371,  170,  371,  371,
			  371,  371,  371,  170,  170,  170,  371,  371,  170,  371,
			  371,  371,  170,  170,  170,  134,  134,  134,  134,  134,
			  134,  134,  134,  134,  134,  134,  134,  134,  134,  134,
			  134,  134,  134,  134,  134,  134,  134,  134,  151,  371,
			  371,  151,  371,  371,  151,  371,  151,  151,  151,  151,

			  371,  151,  203,  371,  371,  203,  371,  371,  371,  203,
			  203,  203,  203,  203,  371,  371,  203,  371,  371,  371,
			  203,  203,  203,  205,  371,  205,  205,  205,  205,  205,
			  205,  371,  205,  371,  371,  371,  205,  205,  205,  206,
			  371,  206,  206,  206,  206,  206,  206,  371,  206,  371,
			  371,  371,  206,  206,  206,  183,  183,  371,  183,  183,
			  183,  183,  183,  183,  183,  183,  183,  183,  183,  183,
			  183,  183,  371,  183,  183,  183,  183,  183,  220,  220,
			  220,  371,  371,  220,  371,  371,  371,  220,  220,  220,
			  188,  188,  188,  188,  188,  188,  188,  188,  188,  188,

			  188,  188,  188,  188,  188,  188,  188,  188,  188,  188,
			  188,  188,  188,  240,  371,  371,  240,  371,  371,  371,
			  240,  240,  240,  240,  240,  371,  371,  240,  371,  371,
			  371,  240,  240,  240,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  266,  371,  266,
			  266,  266,  266,  266,  266,  371,  266,  371,  371,  371,
			  266,  266,  266,  267,  267,  267,  267,  267,  371,  371,
			  267,  371,  371,  267,  267,  267,  267,  276,  371,  276,
			  276,  276,  276,  276,  276,  371,  276,  371,  371,  371,

			  276,  276,  276,  287,  287,  287,  287,  287,  371,  371,
			  287,  371,  371,  287,  287,  287,  287,  297,  371,  297,
			  297,  297,  297,  297,  297,  371,  297,  371,  371,  371,
			  297,  297,  297,  303,  371,  303,  303,  303,  303,  303,
			  303,  371,  303,  371,  371,  371,  303,  303,  303,  304,
			  304,  304,  304,  304,  371,  371,  304,  371,  371,  304,
			  304,  304,  304,  313,  313,  313,  313,  313,  371,  371,
			  313,  371,  371,  313,  313,  313,  313,  321,  371,  321,
			  321,  321,  321,  321,  321,  371,  321,  371,  371,  371,
			  321,  321,  321,   68,  371,   68,   68,   68,   68,   68,

			   68,  371,   68,  371,  371,  371,   68,   68,   68,  332,
			  332,  332,  332,  332,  371,  371,  332,  371,  371,  332,
			  332,  332,  332,  339,  339,  339,  339,  339,  371,  371,
			  339,  371,  371,  339,  339,  339,  339,  346,  346,  346,
			  346,  346,  371,  371,  346,  371,  371,  346,  346,  346,
			  346,   13,  371,  371,  371,  371,  371,  371,  371,  371,
			  371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
			  371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
			  371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
			  371,  371,  371,  371,  371,  371,  371,  371,  371, yy_Dummy>>,
			1, 599, 2000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 2598)
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
			    1,    1,    1,    1,    1,    1,    1,    1,    2,   18,
			    2,    2,   14,   40,   14,   14,  358,   65,   65,    2,
			    2,    2,   42,   65,  316,    2,    2,    2,    2,    2,
			    2,    2,  284,   18,   40,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    3,    3,   20,    3,   20,   20,
			   63,    3,    3,   15,   15,   15,   15,  128,   42,    3,

			  128,   15,   16,   16,   16,   16,   17,   17,   17,   17,
			    3,  282,    3,    4,    4,   19,    4,   19,   19,   63,
			    4,    4,  273,   19,   23,   23,   23,   23,    4,   85,
			   85,   85,   23,   24,   24,   24,   24,  169,  271,    4,
			  169,    4,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    7,
			   29,   29,    7,   29,  163,   33,   33,   29,   33,  163,

			   44,   38,   33,   38,   38,   29,   41,  265,   48,   43,
			   33,   48,   45,    7,   56,   48,   56,   56,   57,   49,
			   57,   57,   49,   59,   59,   59,   59,  294,  294,    7,
			    7,    7,    7,    7,    8,   44,   44,    8,  309,  309,
			   41,   41,   41,   43,   43,   43,   45,   45,   45,   49,
			  131,  131,  131,   66,   50,   49,   66,   50,    8,  293,
			  312,   50,   58,   58,   58,   58,  293,   72,  125,   72,
			   58,   72,  125,  244,    8,    8,    8,    8,    8,    9,
			   50,  312,  202,    9,    9,  202,    9,    9,    9,   66,
			  244,    9,   64,   64,   64,   64,   64,   69,  105,    9,

			   69,  105,   69,  255,   69,   69,   69,   74,   74,   74,
			   74,   69,    9,   10,  226,  251,   64,   10,   10,  226,
			   10,   10,   10,   70,  204,   10,   70,  204,   70,  238,
			   70,   70,   70,   10,  105,  234,  231,   70,   76,   76,
			   76,   76,   78,   78,   78,   78,   10,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   21,  230,   21,   21,   81,   81,

			   75,   75,   75,   75,   81,   21,   21,   21,   75,  222,
			  142,   21,   21,   21,   21,   21,   21,   21,  132,  132,
			  132,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   22,   82,   82,   22,   22,   22,  132,   82,   22,   22,
			  221,   22,   22,   22,  220,   82,  142,   22,   22,   22,
			   22,   22,   22,   22,  240,  240,   82,   22,   22,   22,
			   22,   22,   22,   22,   22,   22,   22,   25,   25,   25,
			   25,   25,  240,   25,   25,   25,   25,   25,   25,   25,
			   25,   25,   25,   25,   25,   25,   25,   25,   25,   25,
			   25,   25,  144,   25,   25,   25,   25,   25,   25,   25,

			   25,   25,   25,   25,   25,   25,   25,   25,   25,   25,
			   25,   25,   25,   25,   26,   26,   26,  138,  138,  138,
			   26,   26,   26,   26,   26,   26,   26,  144,  144,  361,
			   26,   26,   26,   26,   26,   26,   26,   26,   26,   67,
			  159,  159,  159,   67,  361,   67,   67,   67,   67,   67,
			   67,   67,   67,   67,   67,   67,   67,   67,   67,   67,
			   67,   67,   67,   67,   67,   67,  217,   67,   67,   67,
			   67,   67,   67,   67,   67,   67,   67,   67,   67,   67,
			   67,   67,   67,   67,   67,   67,   71,  257,  188,   71,
			  187,   71,  257,   71,   71,   71,   77,   77,   77,   77,

			   71,  261,   83,   83,   77,   83,  261,   86,   86,   83,
			   86,  167,  167,  167,   86,   71,  185,   83,   91,   71,
			   91,   91,   86,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   94,  252,  100,  102,  289,  100,  102,  289,   95,  100,
			  102,   96,  103,  104,   97,  103,  104,   98,  252,  106,
			  104,  103,  106,  103,  103,  103,  110,  116,  103,  110,

			  168,  168,  168,  106,  116,  116,  116,   94,   94,   94,
			   94,   94,   95,   95,   95,   96,   96,   96,   97,   97,
			   97,   98,   98,   98,  109,  106,  133,  109,  133,  133,
			  141,  109,  110,  111,  111,  121,  111,  121,  121,  161,
			  111,  111,  117,  117,  117,  117,  161,  161,  161,  121,
			  109,  119,  119,  119,  183,  143,  173,  119,  119,  119,
			  119,  119,  119,  119,  141,  141,  141,  119,  119,  119,
			  119,  119,  119,  119,  119,  119,  120,  120,  120,  175,
			  175,  175,  120,  120,  120,  120,  120,  120,  120,  143,
			  143,  143,  120,  120,  120,  120,  120,  120,  120,  120,

			  120,  123,  177,  177,  177,  123,  123,  123,  123,  123,
			  123,  123,  123,  123,  123,  123,  123,  123,  123,  123,
			  123,  123,  123,  123,  123,  123,  123,  123,  166,  123,
			  123,  123,  123,  123,  123,  123,  123,  123,  123,  123,
			  123,  123,  123,  123,  123,  123,  123,  123,  127,  267,
			  267,  127,  129,  129,  145,  127,  165,  146,  129,  162,
			  147,  134,  134,  134,  134,  134,  137,  267,  137,  137,
			  137,  275,  158,  129,  135,  135,  275,  129,  130,  130,
			  135,  130,  130,  130,  130,  134,  153,  135,  145,  145,
			  145,  146,  146,  146,  147,  147,  147,  135,  149,  130,

			  152,  149,  149,  130,  139,  139,  126,  139,  139,  139,
			  181,  181,  181,  139,  139,  139,  139,  139,  139,  139,
			  182,  182,  182,  139,  139,  139,  139,  139,  139,  139,
			  139,  139,  148,  151,  171,  148,  151,  171,  171,  148,
			  151,  155,  155,  171,  155,  157,  157,  160,  157,  155,
			  124,  122,  160,  157,  160,  160,  160,  164,  170,  164,
			  164,  170,  115,  172,  114,  170,  172,  172,  179,  179,
			  179,  179,  172,  107,  164,  164,  164,  164,  164,  164,
			  164,  190,  190,  190,  170,  164,  164,  164,  164,  164,
			  164,  164,  164,  174,  101,  174,  174,  174,  176,  288, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  176,  176,  176,  178,  178,  178,  180,  180,  203,   99,
			  174,  203,  180,   89,   84,  176,  288,  180,  192,  189,
			  178,  189,  189,  189,  193,  192,  192,  192,  180,  277,
			  277,  193,  193,  193,  203,   68,  189,  194,  194,  194,
			  194,  194,  194,  194,  199,  199,  199,  277,  194,  194,
			  194,  194,  194,  194,  194,  194,  195,  195,  195,  201,
			  201,  201,  195,  195,  195,  195,  195,  195,  195,  209,
			  209,  209,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  198,  211,  211,  211,   61,  198,  200,  198,  198,
			  198,   60,  200,   55,  200,  200,  200,  205,   52,  206,

			  205,  205,  206,  206,   47,   46,  205,  208,  206,  207,
			  208,  208,  207,  208,  208,  208,  208,  207,  207,   37,
			  207,  207,  207,  212,  212,  212,  213,  213,  213,  215,
			  215,  215,  216,  216,   34,   32,  207,  218,  216,  218,
			  218,  218,  219,  219,  219,  216,   30,   27,  215,  223,
			  223,  223,  224,  224,  224,  216,  227,   13,    0,  228,
			    0,  227,    0,  227,  227,  227,  228,  228,  228,  229,
			  229,  229,  232,  232,  232,  229,  229,  229,  229,  229,
			  229,  229,  233,  233,  233,  229,  229,  229,  229,  229,
			  229,  229,  229,  229,  235,  235,  235,  236,  236,  236,

			  237,  237,  237,  239,  306,  356,  239,  239,    0,  239,
			  239,  239,  239,  241,    0,    0,  241,  241,  242,  242,
			  242,  306,  241,  356,    0,  239,  243,  243,  243,  245,
			    0,  245,  245,  245,  241,  246,  246,  246,  247,  247,
			  247,  248,  248,  248,  248,  308,  245,  249,  249,  254,
			  254,  254,  253,  249,  253,  253,  253,  249,  258,  259,
			  259,  259,  308,  258,    0,  258,  258,  258,  262,  253,
			  263,  263,  263,  262,    0,  262,  262,  262,  264,  264,
			  264,  266,  287,  287,  266,  266,  278,  278,  278,  268,
			  266,  268,  268,  268,  269,    0,  269,  269,  269,  270,

			  287,  270,  270,  270,  272,  272,  268,    0,    0,  276,
			  272,  269,  276,  276,    0,    0,  270,    0,  276,  272,
			  274,  274,  274,  274,  274,  274,  274,  285,  285,  285,
			    0,  274,  274,  274,  274,  274,  274,  274,  274,  280,
			  290,  290,  280,  291,  291,  291,  291,  280,  280,    0,
			  280,  280,  280,    0,  281,  281,  281,  281,  290,  300,
			  300,  300,  281,  281,    0,  290,  280,  280,  281,  283,
			  283,  283,    0,    0,  300,  283,  283,  283,  283,  283,
			  283,  283,  315,  315,  315,  283,  283,  283,  283,  283,
			  283,  283,  283,  283,  286,    0,    0,  286,  286,  296,

			  286,  286,  286,  286,  296,    0,  296,  296,  296,  297,
			  327,    0,  297,  297,  304,  304,  286,    0,  297,  298,
			  298,    0,  298,  298,  298,  299,  299,  327,  299,  299,
			  299,  303,  304,    0,  303,  303,    0,  298,  298,  302,
			  303,  302,  302,  299,  301,  301,  301,  317,  317,  317,
			  301,  301,  301,  301,  301,  301,  301,    0,  313,  313,
			  301,  301,  301,  301,  301,  301,  301,  301,  301,  305,
			    0,  305,  305,  305,  302,  307,  313,  307,  307,  307,
			    0,  325,  310,  325,  310,  310,  305,  311,  335,    0,
			  311,  311,  307,  310,  310,  310,  311,  314,  325,    0,

			  314,  318,  318,  318,  320,  335,  320,  320,  314,  314,
			  314,    0,    0,  320,    0,  320,  320,  320,  321,    0,
			    0,  321,  321,  314,  326,  326,  326,  321,  322,  322,
			  322,  322,  323,  323,    0,  323,  323,  323,  324,    0,
			  328,  324,  328,  328,  328,  332,  332,  324,  339,  339,
			  323,  323,  329,  329,  329,    0,  330,  328,  330,  330,
			  333,  333,  333,  332,  324,    0,  339,  330,  330,  330,
			  331,    0,  331,  331,  331,  331,    0,  336,    0,  336,
			  336,  337,  337,  337,  337,    0,  336,  331,  336,  336,
			  336,  340,    0,  340,  340,  341,    0,  341,  341,  341,

			  341,    0,  340,  340,  340,  342,  342,  343,  343,  343,
			  345,    0,  345,  345,  345,  346,  346,  347,  347,  347,
			    0,    0,  349,  342,  349,  349,  355,  355,  355,    0,
			    0,  343,  344,  346,  344,  344,    0,    0,  344,  348,
			  344,  348,  348,  344,  344,  344,  357,  357,  357,  355,
			  348,  348,  348,  350,  349,  350,  350,    0,  350,  350,
			  350,  351,    0,  351,  351,  351,    0,    0,  352,    0,
			  352,  352,  353,  348,  353,  353,    0,    0,  351,  352,
			  352,  352,    0,  353,  353,  353,  354,    0,  354,  354,
			  359,  359,  359,  360,  360,  360,  362,    0,  362,  362,

			  362,  363,  363,  363,  363,  359,  364,  364,  364,  365,
			    0,  365,  365,  365,  366,  354,  366,    0,    0,  366,
			  366,  366,  367,  367,  367,    0,  368,  368,  368,  369,
			  369,  369,  370,  370,  370,    0,    0,    0,    0,    0,
			    0,    0,    0,  367,  368,    0,    0,  370,  372,  372,
			  372,  372,  372,  372,  372,  372,  372,  372,  372,  372,
			  372,  372,  372,  372,  372,  372,  372,  372,  372,  372,
			  372,  373,  373,  373,  373,  373,  373,  373,  373,  373,
			  373,  373,  373,  373,  373,  373,  373,  373,  373,  373,
			  373,  373,  373,  373,  374,  374,    0,  374,  374,    0,

			  374,  374,  374,  374,  374,  374,  374,  374,  374,  374,
			    0,  374,  374,  374,  374,  374,  374,  375,  375,    0,
			  375,  375,  375,  375,  375,  375,  375,  375,  375,  375,
			  375,  375,  375,  375,    0,  375,  375,  375,  375,  375,
			  376,  376,  376,  376,  376,    0,  376,  376,  376,  376,
			  376,  376,  376,  376,  376,  376,    0,  376,  376,  376,
			  376,  376,  376,  377,  377,  377,  377,  377,    0,    0,
			  377,    0,    0,    0,  377,  377,  377,  378,  378,    0,
			  378,  378,  378,  378,  378,  378,  378,  378,  378,  378,
			  378,  378,  378,  378,    0,  378,  378,  378,  378,  378,

			  379,  379,    0,  379,  379,  379,  379,  379,  379,  379,
			  379,  379,  379,  379,  379,  379,  379,    0,  379,  379,
			  379,  379,  379,  380,    0,    0,  380,    0,    0,  380,
			    0,  380,  380,  380,  380,    0,  380,  381,    0,    0,
			  381,    0,    0,    0,    0,    0,  381,  381,  381,    0,
			    0,  381,    0,    0,    0,  381,  381,  381,  381,  382,
			  382,  382,    0,    0,  382,    0,    0,    0,  382,  382,
			  382,  383,  383,  383,  383,  383,  383,  383,  383,  383,
			  383,  383,  383,  383,  383,  383,  383,  383,  383,  383,
			  383,  383,  383,  383,  384,    0,  384,  384,  384,  384, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  384,  384,    0,  384,    0,    0,    0,  384,  384,  384,
			  385,    0,    0,  385,    0,  385,  385,  385,  385,  385,
			  385,  385,  385,    0,  385,    0,    0,    0,  385,  385,
			  385,  386,    0,    0,  386,    0,  386,  386,  386,  386,
			  386,  386,  386,  386,    0,  386,    0,    0,    0,  386,
			  386,  386,  387,  387,  387,  387,  387,  387,  387,  387,
			  387,  387,  387,  387,  387,  387,  387,  387,  387,  387,
			  387,  387,  387,  387,  387,  388,  388,  388,  388,  388,
			  388,  388,  388,  388,  388,  388,  388,  388,  388,  388,
			  388,  388,  388,  388,  388,  388,  388,  388,  389,  389,

			  389,  389,  389,  389,  389,  389,  389,  389,  389,  389,
			  389,  389,  389,  389,  389,  389,  389,  389,  389,  389,
			  389,  390,    0,    0,    0,  390,  390,  390,  390,  390,
			  390,  390,  390,  390,  390,  390,  390,  390,  390,    0,
			  390,  390,  390,  390,  391,    0,    0,  391,    0,    0,
			    0,    0,    0,  391,  391,  391,    0,    0,  391,    0,
			    0,    0,  391,  391,  391,  392,  392,  392,  392,  392,
			  392,  392,  392,  392,  392,  392,  392,  392,  392,  392,
			  392,  392,  392,  392,  392,  392,  392,  392,  393,    0,
			    0,  393,    0,    0,  393,    0,  393,  393,  393,  393,

			    0,  393,  394,    0,    0,  394,    0,    0,    0,  394,
			  394,  394,  394,  394,    0,    0,  394,    0,    0,    0,
			  394,  394,  394,  395,    0,  395,  395,  395,  395,  395,
			  395,    0,  395,    0,    0,    0,  395,  395,  395,  396,
			    0,  396,  396,  396,  396,  396,  396,    0,  396,    0,
			    0,    0,  396,  396,  396,  397,  397,    0,  397,  397,
			  397,  397,  397,  397,  397,  397,  397,  397,  397,  397,
			  397,  397,    0,  397,  397,  397,  397,  397,  398,  398,
			  398,    0,    0,  398,    0,    0,    0,  398,  398,  398,
			  399,  399,  399,  399,  399,  399,  399,  399,  399,  399,

			  399,  399,  399,  399,  399,  399,  399,  399,  399,  399,
			  399,  399,  399,  400,    0,    0,  400,    0,    0,    0,
			  400,  400,  400,  400,  400,    0,    0,  400,    0,    0,
			    0,  400,  400,  400,  401,  401,  401,  401,  401,  401,
			  401,  401,  401,  401,  401,  401,  401,  401,  401,  401,
			  401,  401,  401,  401,  401,  401,  401,  402,    0,  402,
			  402,  402,  402,  402,  402,    0,  402,    0,    0,    0,
			  402,  402,  402,  403,  403,  403,  403,  403,    0,    0,
			  403,    0,    0,  403,  403,  403,  403,  404,    0,  404,
			  404,  404,  404,  404,  404,    0,  404,    0,    0,    0,

			  404,  404,  404,  405,  405,  405,  405,  405,    0,    0,
			  405,    0,    0,  405,  405,  405,  405,  406,    0,  406,
			  406,  406,  406,  406,  406,    0,  406,    0,    0,    0,
			  406,  406,  406,  407,    0,  407,  407,  407,  407,  407,
			  407,    0,  407,    0,    0,    0,  407,  407,  407,  408,
			  408,  408,  408,  408,    0,    0,  408,    0,    0,  408,
			  408,  408,  408,  409,  409,  409,  409,  409,    0,    0,
			  409,    0,    0,  409,  409,  409,  409,  410,    0,  410,
			  410,  410,  410,  410,  410,    0,  410,    0,    0,    0,
			  410,  410,  410,  411,    0,  411,  411,  411,  411,  411,

			  411,    0,  411,    0,    0,    0,  411,  411,  411,  412,
			  412,  412,  412,  412,    0,    0,  412,    0,    0,  412,
			  412,  412,  412,  413,  413,  413,  413,  413,    0,    0,
			  413,    0,    0,  413,  413,  413,  413,  414,  414,  414,
			  414,  414,    0,    0,  414,    0,    0,  414,  414,  414,
			  414,  371,  371,  371,  371,  371,  371,  371,  371,  371,
			  371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
			  371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
			  371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
			  371,  371,  371,  371,  371,  371,  371,  371,  371, yy_Dummy>>,
			1, 599, 2000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,   46,   82,  111,  141,    0,  186,  231,  273,
			  307,  346,    0, 1157,   50,   91,  100,  104,   43,  113,
			   84,  392,  428,  122,  131,  466,  501, 1125, 2551,  188,
			 1136, 2551, 1100,  193, 1124,    0, 2551, 1113,  199, 2551,
			   47,  200,   56,  203,  194,  206, 1099, 1094,  206,  217,
			  252, 2551, 1070, 2551,    0, 1063,  212,  216,  260,  221,
			 1081, 1079, 2551,   84,  290,   47,  251,  538, 1019,  295,
			  321,  584,  236, 2551,  305,  398,  336,  594,  340, 2551,
			    0,  388,  421,  600, 1011,  116,  605,  622,    0, 1007,
			 2551,  616, 2551, 2551,  664,  672,  675,  678,  681, 1003,

			  670,  991,  671,  680,  681,  296,  687,  940, 2551,  722,
			  694,  731, 2551,    0,  929,  959,  691,  740, 2551,  738,
			  763,  733,  945,  800,  944,  237,  890,  846,   95,  842,
			  868,  237,  405,  724,  859,  864, 2551,  855,  504,  894,
			 2551,  724,  404,  749,  486,  848,  851,  854,  930,  896,
			 2551,  931,  884,  855, 2551,  939, 2551,  943,  862,  527,
			  941,  733,  849,  183,  955,  828,  800,  598,  687,  135,
			  956,  927,  956,  740,  982,  766,  987,  789,  990,  966,
			  996,  897,  907,  748,    0,  586, 2551,  580,  585, 1008,
			  968, 2551, 1012, 1018, 1018, 1043, 2551, 2551, 1075, 1031,

			 1081, 1046,  280, 1006,  322, 1090, 1092, 1107, 1100, 1056,
			 2551, 1069, 1110, 1113, 2551, 1116, 1122,  555, 1126, 1129,
			  416,  408,  406, 1136, 1139, 2551,  308, 1150, 1153, 1156,
			  385,  308, 1159, 1169,  307, 1181, 1184, 1187,  301, 1196,
			  444, 1206, 1205, 1213,  262, 1218, 1222, 1225, 1228, 1237,
			 2551,  299,  660, 1241, 1236,  292, 2551,  581, 1252, 1246,
			 2551,  595, 1262, 1257, 1265,  179, 1274,  839, 1278, 1283,
			 1288,  122, 1294,  106, 1301,  865, 1302, 1019, 1273, 2551,
			 1337, 1352,   81, 1356,   44, 1314, 1387, 1272,  988,  672,
			 1330, 1341, 2551,  231,  217, 2551, 1393, 1402, 1409, 1415,

			 1346, 1431, 1437, 1424, 1404, 1458, 1193, 1464, 1234,  228,
			 1480, 1480,  244, 1448, 1495, 1369,   36, 1434, 1488, 2551,
			 1502, 1511, 1515, 1522, 1536, 1470, 1511, 1399, 1529, 1539,
			 1554, 1559, 1535, 1547, 2551, 1477, 1575, 1568, 2551, 1538,
			 1589, 1584, 1595, 1594, 1630, 1599, 1605, 1604, 1637, 1620,
			 1645, 1650, 1666, 1670, 1684, 1613, 1189, 1633,   28, 1677,
			 1680,  513, 1685, 1688, 1693, 1698, 1706, 1709, 1713, 1716,
			 1719, 2551, 1747, 1770, 1793, 1816, 1839, 1854, 1876, 1899,
			 1921, 1935, 1948, 1970, 1987, 2008, 2029, 2051, 2074, 2097,
			 2120, 2142, 2164, 2186, 2200, 2216, 2232, 2254, 2267, 2289,

			 2311, 2333, 2350, 2364, 2380, 2394, 2410, 2426, 2440, 2454,
			 2470, 2486, 2500, 2514, 2528, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  371,    1,  372,  372,  371,    5,  373,  373,  372,
			  372,  371,   11,  371,  374,  371,  371,  371,  375,  374,
			  374,  374,  371,  376,  376,  371,   25,   26,  371,  371,
			  371,  371,  371,  371,  377,  377,  371,  378,  371,  371,
			  371,  378,  378,  378,  378,  378,  379,  371,  380,  381,
			  371,  371,  371,  371,  382,  371,  374,  371,  371,  371,
			  371,  375,  371,  375,  383,   21,  371,  371,  384,  385,
			  386,  386,   71,  371,  376,  376,  376,  376,  371,  371,
			   25,   26,   26,  371,  387,  371,  371,  371,  377,  378,
			  371,  371,  371,  371,  378,  378,  378,  378,  378,  379,

			  371,  388,  371,  371,  380,  371,  381,  106,  371,  371,
			  371,  371,  371,  382,  371,  389,  375,  389,  371,   21,
			  119,  374,  390,  371,  390,  123,  371,  371,  391,   71,
			   71,  130,  130,  371,  392,   26,  371,  371,  371,   87,
			  371,  378,  378,  378,  378,  378,  378,  378,  371,  371,
			  371,  393,  371,  106,  371,  371,  371,  371,  371,  371,
			  375,  375,  119,  120,  374,  371,  371,  123,  123,  394,
			  391,  395,  396,  371,  130,  130,  130,  130,  130,  389,
			   26,  371,  371,  397,  398,  106,  371,  371,  399,  371,
			  371,  371,  375,  375,  164,  194,  371,  371,  123,  123,

			  123,  123,  371,  394,  371,  395,  396,  400,  396,  130,
			  371,  208,  130,  130,  371,  130,   26,  371,  371,  371,
			  398,  106,  401,  371,  371,  371,  375,  375,  375,  195,
			  195,  371,  123,  123,  371,  123,  123,  123,  371,  402,
			  403,  396,  241,  130,  241,  241,  130,  130,  130,   26,
			  371,  106,  371,  371,  371,  229,  371,  123,  123,  123,
			  371,  123,  123,  123,  123,  371,  404,  403,  130,  130,
			  130,  371,   26,  371,  194,  123,  404,  405,  208,  371,
			  400,   26,  398,  274,  371,  123,  406,  405,  245,  371,
			  403,  371,  371,  398,  283,  371,  123,  407,  408,  403,

			  398,  283,  374,  407,  409,  299,  305,  300,  307,  301,
			  374,  410,  411,  409,  394,  299,  371,  371,  300,  371,
			  374,  410,  411,  412,  394,  314,  299,  371,  371,  300,
			  374,  411,  413,  305,  371,  398,  374,  411,  371,  413,
			  374,  411,  414,  314,  374,  341,  414,  314,  374,  374,
			  341,  314,  374,  374,  374,  371,  411,  314,  371,  371,
			  371,  411,  314,  411,  314,  331,  314,  314,  314,  314,
			  314,    0,  371,  371,  371,  371,  371,  371,  371,  371,
			  371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
			  371,  371,  371,  371,  371,  371,  371,  371,  371,  371,

			  371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
			  371,  371,  371,  371,  371, yy_Dummy>>)
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
			    0,    0,    0,   61,   58,    1,    1,    1,   49,   58,
			   37,   58,   59,    1,    1,   58,   58,   58,   60,   27,
			   60,   29,   60,   34,   33,   33,   36,   53,   54,   55,
			   56,   53,   53,   53,   53,   53,   60,   60,   17,   60,
			   60,   42,   60,   41,   39,   60,   58,   58,    1,    1,
			    0,   49,   48,   49,   58,   58,    0,    0,    0,    0,
			    0,    0,    0,   14,   57,    1,    1,   57,   58,    4,
			   58,   58,   58,   27,    0,    0,   34,   33,   33,   53,
			   55,   54,   51,   50,   52,   53,   53,   53,   53,    0,

			   15,    0,    0,    0,   17,    0,    0,    0,   21,    0,
			    0,    0,   43,   39,    0,    0,   49,   58,    2,   58,
			   58,   58,    0,    0,   38,    0,    0,    0,    0,    0,
			    0,    0,    0,   57,   57,   58,   28,   26,    0,    0,
			   35,   53,   53,   53,   53,   53,   53,   53,    0,    0,
			   20,   17,    0,    0,   16,    0,   23,    0,    0,    0,
			   49,   49,   58,   58,   58,    0,    0,    0,    0,   32,
			    0,    0,    0,    0,    0,    0,    7,    0,    0,   57,
			   58,    0,    0,    0,    0,    0,   22,    0,    0,    0,
			    0,   47,   49,   49,   58,   58,   45,   44,    0,    0,

			    0,    0,   32,   31,   13,    0,    0,   32,    0,    0,
			    8,    0,    0,    0,    6,    0,   58,   26,   26,    0,
			    0,    0,    0,    0,    0,   40,   49,   49,   49,   58,
			   58,    0,    0,    0,    0,    0,    0,    0,   30,    0,
			   31,    0,    0,    0,    7,    7,    0,    0,    0,   58,
			   19,    0,    0,    0,    0,   58,   12,    0,    0,    0,
			   11,    0,    0,    0,    0,   31,    0,   31,    0,    7,
			    7,    0,   58,    0,   58,    0,    0,   31,    0,    5,
			   25,   58,    0,   58,    0,    0,    0,   31,    7,   25,
			   31,   58,    3,    0,   58,   10,    0,    0,   31,   31,

			    0,   58,   58,    0,   31,   31,   31,    0,    0,   58,
			   58,    0,    0,   31,   31,   31,   24,    0,    0,   18,
			   46,    0,    0,   31,   31,   31,   31,    0,    0,    0,
			   58,    0,   31,   31,   18,    0,   58,    0,    9,   31,
			   58,    0,   31,   31,   58,    0,   31,   31,   58,   58,
			    0,   31,   46,   58,   58,    0,    0,   31,    9,    0,
			    0,    0,   31,    0,   31,    0,   31,   31,   31,   31,
			   31,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 2551
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 371
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 372
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

	yyNb_rules: INTEGER = 60
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 61
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
