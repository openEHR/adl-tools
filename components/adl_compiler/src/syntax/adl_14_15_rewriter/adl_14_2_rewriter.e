note
	component:   "openEHR ADL Tools"
	description: "Stream rewriter for ADL 1.4 and transitional ADL 1.5 archetypes containing old style 0-filled at- and ac-codes"
	keywords:    "transformation, archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ADL_14_2_REWRITER

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

	ADL_2_TERM_CODE_TOOLS
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
--|#line 70 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 70")
end
out_buffer.append (text)
else
--|#line 72 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 72")
end
out_buffer.append (text)			-- pass separate comment line endings
end
else
if yy_act = 3 then
--|#line 76 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 76")
end

		out_buffer.append (text)
		in_terminology := True
	
else
--|#line 81 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 81")
end

		out_buffer.append (text)
	
end
end
else
if yy_act <= 6 then
if yy_act = 5 then
--|#line 87 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 87")
end

		out_buffer.append_character ('[')
		output_new_id_code (text_substring (2, text_count - 1))
		out_buffer.append_character (']')
	
else
--|#line 93 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 93")
end

		out_buffer.append_character ('[')
		output_new_id_code (text_substring (2, text_count - 1))
		out_buffer.append_character (']')
	
end
else
if yy_act = 7 then
--|#line 100 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 100")
end

		str_ := text
		out_buffer.append_character ('[')
		new_code_str := str_.substring (2, str_.index_of (',', 1) - 1)
		new_code_str.right_adjust
		output_new_id_code (new_code_str)
		out_buffer.append (str_.substring (str_.index_of (',', 1), str_.count))
	
else
--|#line 109 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 109")
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
--|#line 115 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 115")
end

		out_buffer.append (text)
	
else
--|#line 121 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 121")
end

		output_converted_code_dt_key (text_substring (3, text_count - 2))
	
end
else
if yy_act = 11 then
--|#line 125 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 125")
end

		output_converted_code_dt_key (text_substring (3, text_count - 2))
	
else
--|#line 129 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 129")
end

		output_converted_code_dt_key (text_substring (3, text_count - 2))
	
end
end
else
if yy_act <= 14 then
if yy_act = 13 then
--|#line 134 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 134")
end

		out_buffer.append (text)
	
else
--|#line 138 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 138")
end
		-- match [{
		out_buffer.append (text)
		set_start_condition (IN_TUPLE)
	
end
else
--|#line 144 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 144")
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
--|#line 148 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 148")
end
 							-- interior }, { pattern
		out_buffer.append (text)
	
else
--|#line 152 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 152")
end
			-- numbers and lists of numbers and symbols (e.g. in intervals)
		out_buffer.append (text)
	
end
else
if yy_act = 18 then
--|#line 156 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 156")
end
						-- ADL codes
		out_buffer.append ("[local::")
		output_new_at_ac_code (text_substring (9, text_count-1))
		out_buffer.append_character (']')
	
else
--|#line 162 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 162")
end
				-- other codes
		out_buffer.append (text)
	
end
end
else
if yy_act <= 21 then
if yy_act = 20 then
--|#line 166 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 166")
end
out_buffer.append (text)			-- pass separate comment lines
else
--|#line 168 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 168")
end
										-- match [{
		out_buffer.append (text)
	
end
else
if yy_act = 22 then
--|#line 172 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 172")
end
						-- termination of interior tuple line }],\n with optional comment
		out_buffer.append (text)
		set_start_condition (INITIAL)
	
else
--|#line 177 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 177")
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
--|#line 195 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 195")
end
						-- ADL codes
	out_buffer.append ("[local::")
	output_new_at_ac_code (text_substring (9, text_count-1))
	out_buffer.append_character (']')

else
--|#line 201 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 201")
end

		out_buffer.append (text)
		set_start_condition (IN_ADL_VALUE_SET_DEF)
	
end
else
if yy_act = 26 then
--|#line 207 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 207")
end
 -- match second last line with ';' termination (assumed value)
		output_new_at_ac_code (text)
	
else
--|#line 211 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 211")
end
out_buffer.append (text)
end
end
else
if yy_act <= 29 then
if yy_act = 28 then
--|#line 214 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 214")
end
out_buffer.append (text)
else
--|#line 216 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 216")
end

		out_buffer.append (text)
		set_start_condition (INITIAL)
	
end
else
--|#line 224 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 224")
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
--|#line 245 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 245")
end

		out_buffer.append (text)
		set_start_condition (IN_VALUE_SET_DEF)
	
else
--|#line 250 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 250")
end

		out_buffer.append (text)
		set_start_condition (IN_VALUE_SET_DEF)
	
end
else
if yy_act = 33 then
--|#line 256 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 256")
end
 
		out_buffer.append (text)
	
else
--|#line 260 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 260")
end

		out_buffer.append (text)
	
end
end
else
if yy_act <= 36 then
if yy_act = 35 then
--|#line 265 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 265")
end
out_buffer.append (text)
else
--|#line 267 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 267")
end

		out_buffer.append (text)
		set_start_condition (INITIAL)
	
end
else
if yy_act = 37 then
--|#line 274 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 274")
end

	out_buffer.append (text)
	set_start_condition (IN_PATH)

else
--|#line 279 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 279")
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
--|#line 285 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 285")
end
 
		out_buffer.append (text)
	
else
--|#line 289 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 289")
end
 
		out_buffer.append_character ('[')
		output_new_id_code (text_substring (2, text_count - 1))
		out_buffer.append_character (']')
	
end
else
if yy_act = 41 then
--|#line 295 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 295")
end

		out_buffer.append (text)
	
else
--|#line 299 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 299")
end

		out_buffer.append (text)
		set_start_condition (INITIAL)
	
end
end
else
if yy_act <= 44 then
if yy_act = 43 then
--|#line 304 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 304")
end

		out_buffer.append (text)
		set_start_condition (INITIAL)
	
else
--|#line 312 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 312")
end
out_buffer.append (text)
end
else
--|#line 314 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 314")
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
--|#line 317 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 317")
end

		out_buffer.append (text)
	
else
--|#line 322 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 322")
end
			-- can occur in some string data
		out_buffer.append_character ('"')
		output_new_at_ac_code (text_substring (2, text_count - 1))
		out_buffer.append_character ('"')
	
end
else
if yy_act = 48 then
--|#line 328 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 328")
end

		out_buffer.append (text)
	
else
--|#line 332 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 332")
end
				-- beginning of a string
		out_buffer.append (text)
		set_start_condition (IN_STR)
	
end
end
else
if yy_act <= 51 then
if yy_act = 50 then
--|#line 338 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 338")
end
out_buffer.append (text)
else
--|#line 340 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 340")
end
out_buffer.append (text)
end
else
if yy_act = 52 then
--|#line 342 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 342")
end

				out_buffer.append (text)
	
else
--|#line 346 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 346")
end
out_buffer.append (text)
end
end
end
else
if yy_act <= 57 then
if yy_act <= 55 then
if yy_act = 54 then
--|#line 348 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 348")
end

				out_buffer.append (text)
	
else
--|#line 352 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 352")
end
						-- match final end of string
				out_buffer.append (text)
				set_start_condition (INITIAL)
	
end
else
if yy_act = 56 then
--|#line 357 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 357")
end
	-- Catch-all rules (no backing up)
				set_start_condition (INITIAL)
	
else
--|#line 365 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 365")
end
		-- read non '[' non-space characters followed by whitespace
		out_buffer.append (text)
	
end
end
else
if yy_act <= 59 then
if yy_act = 58 then
--|#line 369 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 369")
end
						-- read non '[' non-space characters followed by whitespace
		out_buffer.append (text)
	
else
--|#line 375 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 375")
end
;
end
else
--|#line 0 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 0")
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
--|#line 374 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 374")
end
terminate
when 3 then
--|#line 358 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 358")
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
			create an_array.make_filled (0, 0, 2874)
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
			   24,   23,   57,   92,   57,   57,  404,  119,  120,   25,
			   25,   25,   90,  121,  405,   26,   26,   26,   26,   27,
			   26,   26,  270,   63,   93,   25,   26,   26,   26,   27,
			   26,   26,   26,   26,   29,   29,   57,   29,   57,   57,
			   62,   29,   30,   58,   59,   59,   58,  128,   95,   29,

			  128,   60,   59,   59,   59,   59,   59,   59,   59,   59,
			   31,  373,   32,   29,   29,   57,   29,   57,   57,  116,
			   29,   30,  270,   64,   75,   59,   76,   75,   29,  137,
			  138,  138,   77,   76,   59,   76,   76,  202,  343,   31,
			  202,   32,   28,   33,   33,   28,   33,   28,   28,   28,
			   33,   34,   35,   28,   35,   35,   35,   28,   33,   28,
			   35,   35,   35,   35,   35,   35,   35,   28,   28,   36,
			   35,   35,   35,   35,   35,   35,   35,   35,   35,   28,
			   28,   28,   28,   28,   28,   28,   28,   28,   28,   38,
			   83,   83,   39,   83,  120,   86,   86,   83,   86,  121,

			   90,   91,   86,   91,   91,   83,   90,  286,  102,   90,
			   86,  102,   90,   40,   57,  103,   57,   57,   57,  105,
			   57,   57,  105,   59,   59,   59,   59,  317,  318,   41,
			   42,   43,   44,   45,   38,   97,   97,   39,  317,  318,
			   94,   94,   94,   96,   96,   96,   98,   98,   98,  107,
			  176,  177,  177,   66,  109,  108,   66,  109,   40,  255,
			  126,  110,   58,   59,   59,   58,  316,  129,  167,  132,
			   60,  129,  168,  226,   41,   42,   43,   44,   45,   46,
			  111,  341,  202,   47,   48,  202,   48,   48,   48,   73,
			  228,   48,  117,  118,  117,  117,  115,  127,  105,   49,

			  127,  105,   68,  313,  128,   68,   68,  133,  408,  133,
			  133,  126,   50,   46,  191,  309,  115,   47,   48,  192,
			   48,   48,   48,  127,  204,   48,  127,  204,   68,  307,
			  128,   68,   68,   49,  108,  366,  367,  126,   76,   59,
			   76,   76,   78,   79,   78,   78,   50,   28,   51,   51,
			   51,   51,   52,   28,   28,   28,   28,   28,   53,   54,
			   54,   54,   28,   28,   28,   54,   54,   54,   54,   54,
			   54,   54,   55,   28,   28,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   28,   28,   28,   28,   28,   28,
			   28,   28,   28,   28,   57,  301,   57,   57,  119,  120,

			   75,   59,   76,   75,  121,   65,   65,   65,   77,  293,
			   90,   65,   65,   65,   65,   65,   65,   65,  129,  129,
			  129,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   66,  119,  120,   66,   67,   68,  178,  121,   68,   68,
			  291,   69,   69,   69,  270,  135,   95,   70,   70,   70,
			   70,   70,   70,   70,  203,  203,  135,   69,   71,   70,
			   72,   70,   70,   70,   70,   70,   73,   56,   78,   79,
			   78,   78,  241,   56,   56,   56,   56,   56,   56,   80,
			   80,   80,   56,   56,   56,   80,   80,   80,   80,   80,
			   80,   80,   90,   56,   56,   80,   80,   80,   80,   80,

			   80,   80,   80,   80,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   81,   81,   81,  182,  182,  182,
			   81,   81,   81,   81,   81,   81,   81,   97,   97,  126,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,  122,
			  189,  190,  190,  122,  393,  123,  122,  122,  123,  123,
			  124,  123,  123,  123,  122,  122,  122,  123,  123,  123,
			  123,  123,  123,  123,  122,  122,  281,  123,  125,  123,
			  123,  123,  123,  123,  123,  123,  122,  122,  122,  122,
			  122,  122,  122,  122,  122,  122,  127,  128,  280,  127,
			  270,   68,  265,  128,   68,   68,  133,  408,  133,  133,

			  126,  261,   83,   83,  134,   83,  204,   86,   86,   83,
			   86,  198,  199,  199,   86,  130,  119,   83,   91,  131,
			   91,   91,   86,  139,  139,  140,  139,  139,  139,  139,
			  139,  139,   87,   87,  139,   87,   87,   87,  139,  139,
			  139,   87,   87,   87,   87,   87,   87,   87,  139,  139,
			  139,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			  139,  139,  139,  139,  139,  139,  139,  139,  139,  139,
			   90,  303,  148,  102,  303,  148,  102,  186,   90,  149,
			  103,   90,  103,  102,   90,  103,  102,   90,  256,  408,
			  103,  151,  408,  151,  151,  151,  110,   62,  151,  110,

			  200,  201,  201,  152,  160,  161,  161,  141,  142,  143,
			  144,  145,   94,   94,   94,   94,   94,   94,  146,  146,
			  146,  147,  147,  147,  109,  408,  133,  109,  133,  133,
			   90,  110,  154,  155,  156,   57,  155,   57,   57,   62,
			  157,  158,  117,  118,  117,  117,  193,  193,  193,  164,
			  111,  162,  162,  162,  255,   90,  181,  162,  162,  162,
			  162,  162,  162,  162,   94,   94,   94,  162,  162,  162,
			  162,  162,  162,  162,  162,  162,  163,  163,  163,  209,
			  209,  209,  163,  163,  163,  163,  163,  163,  163,   96,
			   96,   96,  163,  163,  163,  163,  163,  163,  163,  163,

			  163,  122,  216,  216,  216,  122,  166,  123,  122,  122,
			  123,  123,  122,  123,  123,  123,  122,  122,  122,  123,
			  123,  123,  123,  123,  123,  123,  122,  122,  156,  123,
			  123,  123,  123,  123,  123,  123,  123,  123,  122,  122,
			  122,  122,  122,  122,  122,  122,  122,  122,  127,  366,
			  367,  127,  171,  172,   90,  128,  225,   90,  173,  224,
			   90,  179,  118,  179,  179,  115,  181,  234,  182,  182,
			  182,  237,  235,  129,  119,  120,  238,  129,  171,  172,
			  121,  174,  175,  175,  173,  115,  100,  180,   98,   98,
			   98,   94,   94,   94,   94,   94,   94,  180,  149,  129,

			  207,  149,  183,  129,  139,  139,  197,  139,  139,  139,
			  220,  221,  221,  139,  139,  139,  139,  139,  139,  139,
			  222,  222,  222,  139,  139,  139,  139,  139,  139,  139,
			  139,  139,  148,  102,   68,  148,  102,   68,   68,  149,
			  103,  155,  156,  126,  155,  157,  186,  191,  157,  158,
			  196,  194,  192,  187,  193,  193,  193,   57,  408,   57,
			   57,  408,  188,   68,  185,  128,   68,   68,  179,  118,
			  179,  179,  126,  184,  195,  195,  195,  195,  195,  195,
			  195,  129,  129,  129,  204,  195,  195,  195,  195,  195,
			  195,  195,  195,  208,  169,  209,  209,  209,  218,  226, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  295,  227,  227,  227,  287,  296,  119,  120,  165,  288,
			  210,  211,  121,  212,  211,  165,  228,  219,  213,  203,
			  214,  118,  215,  216,  216,  227,  227,  227,  219,  159,
			  247,   62,  247,  247,   62,  153,  241,  217,  229,  230,
			  230,  231,  231,  231,  232,  232,  232,  232,  232,  232,
			  232,  236,  236,  236,  150,  232,  232,  232,  232,  232,
			  232,  232,  232,  233,  233,  233,  240,  240,  240,  233,
			  233,  233,  233,  233,  233,  233,  246,  246,  246,  233,
			  233,  233,  233,  233,  233,  233,  233,  233,  234,  408,
			  100,   90,  408,  235,  237,  236,  236,  236,  136,  238,

			  126,  239,  240,  240,   68,   62,  115,  242,   68,  211,
			  114,  212,  211,  126,   68,  241,  213,   68,  172,  249,
			  250,  250,   68,  173,  202,   68,   68,  202,  244,  245,
			  245,  126,  203,  203,  112,  203,  203,  203,  212,  101,
			  212,  212,  100,   90,  213,  247,  247,  213,  251,  252,
			  252,  203,  252,  252,  252,  170,  170,  170,  129,  129,
			  129,  119,  120,  220,  220,  220,  181,  121,  221,  221,
			  221,  170,  408,  126,  254,   87,   85,  253,  257,  258,
			  258,  259,  259,  259,  254,  191,   84,   82,   62,  255,
			  192,  390,  230,  230,  230,  229,  229,  229,  260,  260,

			  260,  262,  263,  263,  260,  260,  260,  260,  260,  260,
			  260,  264,  264,  264,  260,  260,  260,  260,  260,  260,
			  260,  260,  260,  266,  267,  267,  268,  269,  269,  269,
			  269,  269,   68,  408,  408,   68,   68,  408,   68,   68,
			   68,  126,   68,  408,  408,   68,  208,  245,  245,  245,
			   57,  173,   57,   57,   68,  273,  273,  273,  212,  408,
			  212,  212,  408,  210,  408,  247,  336,  214,  250,  250,
			  250,  276,  277,  277,  277,  277,  277,  129,  129,  129,
			  278,  119,  120,  355,  217,  328,  226,  121,  258,  258,
			  258,  279,  257,  257,  257,  284,  203,  234,  262,  262,

			  262,  408,  235,  228,  263,  263,  263,  237,  282,  266,
			  266,  408,  238,  241,  267,  267,  267,  266,  266,  266,
			   68,  336,  408,   68,   68,  129,  129,  129,  208,  126,
			  129,  129,  129,  128,  286,  287,  203,  203,  338,  289,
			  288,  129,  129,  129,  408,  210,   68,  119,  120,   68,
			  297,  408,  204,  121,  241,  126,  290,  249,  302,  250,
			  408,  408,  292,  294,  294,  294,  294,  294,  294,  294,
			  266,  310,  267,  408,  294,  294,  294,  294,  294,  294,
			  294,  294,  286,  287,  408,  312,  203,  408,  288,  303,
			  408,  289,  303,  250,  250,  250,  408,  203,  203,  408,

			  203,  203,  203,  241,  305,  306,  305,  305,  290,  325,
			  326,  326,  119,  120,  203,  203,  203,  304,  121,  308,
			  308,  308,  408,  408,  255,  308,  308,  308,  308,  308,
			  308,  308,  241,  408,  408,  308,  308,  308,  308,  308,
			  308,  308,  308,  308,   68,  203,  203,   68,   68,  408,
			   68,   68,   68,  126,  305,  306,  305,  305,  203,  342,
			  295,  408,  408,  241,  408,  296,   68,  267,  267,  267,
			  315,   68,  408,  408,   68,   68,  241,  408,  203,  203,
			  126,  203,  203,  203,  284,  203,  408,  323,  324,  324,
			   68,  408,  408,  329,  330,  408,  241,  203,  408,  126,

			  408,  408,  241,  327,  327,  327,  346,  346,  346,  327,
			  327,  327,  327,  327,  327,  327,  347,  348,  348,  327,
			  327,  327,  327,  327,  327,  327,  327,  327,  333,  408,
			  334,  334,  334,  336,  408,  337,  337,  337,  408,  408,
			   57,  408,   57,   57,  408,  335,  349,  349,  349,  408,
			  338,  339,  339,  339,   68,  408,  408,   68,   68,  408,
			  203,  203,   57,  126,   57,   57,  408,  344,  345,  345,
			  408,  350,  408,  339,  339,  339,   68,  408,  241,  329,
			  330,  333,  241,  345,  408,  126,  351,  351,  351,  126,
			  203,  203,  408,  203,  203,  203,  408,  408,  335,  408,

			  354,  354,  354,  408,   57,  333,   57,   57,  241,  203,
			  336,  408,  348,  348,  348,  356,  356,  356,   57,  408,
			   57,   57,  335,  272,  272,  272,  408,  355,  408,  357,
			  357,  357,  358,  380,  351,  351,  351,  126,  408,   57,
			  408,   57,   57,  363,  363,  363,  126,  408,  362,  359,
			  357,  357,  357,  364,  365,   57,  408,   57,   57,  369,
			  408,  363,  363,  363,  126,  408,  368,  368,  368,  203,
			  203,  241,  203,  203,  203,   68,  408,  376,  376,  376,
			  364,  365,  377,  377,  377,  408,  408,  241,  378,  378,
			  378,   57,  408,   57,   57,  408,  371,   57,  241,   57,

			   57,  408,  408,  374,   57,  375,   57,   57,  368,  368,
			  368,  391,  391,  391,  408,  379,  379,  379,  408,  382,
			  408,  383,   68,  381,  376,  376,  376,  384,  408,  377,
			  377,  377,  386,  408,  378,  378,  378,  408,  380,   57,
			  408,   57,   57,   57,  385,   57,   57,  408,  408,  387,
			  379,  379,  379,  408,  379,  379,  379,  388,  388,  388,
			  392,  392,  392,  388,  388,  388,  388,  388,  388,  394,
			  408,  391,  391,  391,  396,  396,  396,  126,  359,  395,
			  389,  392,  392,  392,  397,  397,  397,  398,  398,  398,
			   68,  408,  396,  396,  396,  382,  408,  399,  408,  408,

			  397,  397,  397,  400,  408,  401,  408,  408,  398,  398,
			  398,  203,  203,  203,  403,  403,  403,  203,  203,  203,
			  408,  403,  403,  403,  403,  403,  403,  407,  407,  407,
			  408,  274,  402,  274,  274,  406,  387,  404,  407,  407,
			  407,  314,  408,  408,  408,  274,  314,  314,  314,  408,
			  274,  274,  274,  385,   28,   28,   28,   28,   28,   28,
			   28,   28,   28,   28,   28,   28,   28,   28,   28,   28,
			   28,   28,   28,   28,   28,   28,   28,   28,   37,   37,
			   37,   37,   37,   37,   37,   37,   37,   37,   37,   37,
			   37,   37,   37,   37,   37,   37,   37,   37,   37,   37,

			   37,   37,   56,   56,  408,   56,   56,  408,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,  408,   56,
			   56,   56,   56,   56,   56,   56,   61,   61,  408,   61,
			   61,   61,   61,   61,   61,   61,   61,   61,   61,   61,
			   61,   61,   61,  408,   61,   61,   61,   61,   61,   61,
			   74,   74,   74,   74,   74,  408,   74,   74,   74,   74,
			   74,   74,   74,   74,   74,   74,  408,   74,   74,   74,
			   74,   74,   74,   74,   88,   88,   88,   88,   88,  408,
			  408,   88,  408,  408,  408,   88,   88,   88,   88,   89,
			   89,  408,   89,   89,   89,   89,   89,   89,   89,   89, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			   89,   89,   89,   89,   89,   89,  408,   89,   89,   89,
			   89,   89,   89,   99,   99,  408,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			  408,   99,   99,   99,   99,   99,   99,  104,  408,  408,
			  104,  408,  408,  104,  408,  104,  104,  104,  104,  408,
			  104,  106,  321,  408,  106,  408,  408,  321,  321,  321,
			  106,  106,  106,  408,  408,  106,  408,  408,  408,  106,
			  106,  106,  106,  106,  113,  113,  113,  408,  408,  113,
			  408,  408,  408,  113,  113,  113,  113,   64,   64,   64,
			   64,   64,   64,   64,   64,   64,   64,   64,   64,   64,

			   64,   64,   64,   64,   64,   64,   64,   64,   64,   64,
			   64,   68,  408,   68,   68,   68,   68,   68,   68,  408,
			   68,  408,  408,  408,   68,   68,   68,   68,   69,  408,
			  408,   69,  408,   69,   69,   69,   69,   69,   69,   69,
			   69,  408,   69,  408,  408,  408,   69,   69,   69,   69,
			  129,  408,  408,  129,  408,  129,  129,  129,  129,  129,
			  129,  129,  129,  408,  129,  408,  408,  408,  129,  129,
			  129,  129,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,  101,  101,  101,  101,

			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  115,  115,  115,  115,  115,  115,  115,  115,  115,  115,
			  115,  115,  115,  115,  115,  115,  115,  115,  115,  115,
			  115,  115,  115,  115,  122,  408,  408,  408,  122,  122,
			  122,  122,  122,  122,  122,  122,  122,  122,  122,  122,
			  122,  122,  408,  122,  122,  122,  122,  122,  170,  353,
			  408,  170,  408,  408,  353,  353,  353,  170,  170,  170,
			  408,  408,  170,  408,  408,  408,  170,  170,  170,  170,
			  134,  134,  134,  134,  134,  134,  134,  134,  134,  134,

			  134,  134,  134,  134,  134,  134,  134,  134,  134,  134,
			  134,  134,  134,  134,  151,  408,  408,  151,  408,  408,
			  151,  408,  151,  151,  151,  151,  408,  151,  203,  408,
			  408,  203,  408,  408,  408,  203,  203,  203,  203,  203,
			  408,  408,  203,  408,  408,  408,  203,  203,  203,  203,
			  205,  408,  205,  205,  205,  205,  205,  205,  408,  205,
			  408,  408,  408,  205,  205,  205,  205,  206,  408,  206,
			  206,  206,  206,  206,  206,  408,  206,  408,  408,  408,
			  206,  206,  206,  206,  183,  183,  408,  183,  183,  183,
			  183,  183,  183,  183,  183,  183,  183,  183,  183,  183,

			  183,  408,  183,  183,  183,  183,  183,  183,  223,  223,
			  223,  408,  408,  223,  408,  408,  408,  223,  223,  223,
			  223,  188,  188,  188,  188,  188,  188,  188,  188,  188,
			  188,  188,  188,  188,  188,  188,  188,  188,  188,  188,
			  188,  188,  188,  188,  188,  243,  408,  408,  243,  408,
			  408,  408,  243,  243,  243,  243,  243,  408,  408,  243,
			  408,  408,  408,  243,  243,  243,  243,  248,  408,  248,
			  248,  408,  408,  408,  408,  408,  248,  248,  248,  408,
			  408,  248,  408,  408,  408,  248,  248,  248,  248,  225,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,

			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  271,  408,  271,  271,  271,  271,  271,
			  271,  408,  271,  408,  408,  408,  271,  271,  271,  271,
			  272,  272,  272,  272,  272,  408,  408,  272,  408,  408,
			  272,  272,  272,  272,  272,  275,  408,  408,  275,  275,
			  275,  408,  408,  275,  408,  408,  275,  275,  275,  275,
			  275,  283,  408,  283,  283,  283,  283,  283,  283,  408,
			  283,  408,  408,  408,  283,  283,  283,  283,  285,  285,
			  285,  408,  408,  285,  408,  408,  408,  285,  285,  285,
			  285,  298,  298,  298,  298,  298,  408,  408,  298,  408,

			  408,  298,  298,  298,  298,  298,  299,  299,  299,  408,
			  408,  299,  408,  408,  408,  299,  299,  299,  299,  300,
			  300,  300,  408,  408,  300,  408,  408,  408,  300,  300,
			  300,  300,  311,  408,  311,  311,  311,  311,  311,  311,
			  408,  311,  408,  408,  408,  311,  311,  311,  311,  319,
			  408,  319,  319,  319,  319,  319,  319,  408,  319,  408,
			  408,  408,  319,  319,  319,  319,  320,  320,  320,  320,
			  320,  408,  408,  320,  408,  408,  320,  320,  320,  320,
			  320,  322,  322,  322,  408,  408,  322,  408,  408,  408,
			  322,  322,  322,  322,  331,  331,  331,  331,  331,  408,

			  408,  331,  408,  408,  331,  331,  331,  331,  331,  332,
			  332,  332,  408,  408,  332,  408,  408,  408,  332,  332,
			  332,  332,  340,  408,  340,  340,  340,  340,  340,  340,
			  408,  340,  408,  408,  408,  340,  340,  340,  340,   68,
			  408,   68,   68,   68,   68,   68,   68,  408,   68,  408,
			  408,  408,   68,   68,   68,   68,  352,  352,  352,  352,
			  352,  408,  408,  352,  408,  408,  352,  352,  352,  352,
			  352,  360,  360,  360,  360,  360,  408,  408,  360,  408,
			  408,  360,  360,  360,  360,  360,  361,  361,  361,  408,
			  408,  361,  408,  408,  408,  361,  361,  361,  361,  370,

			  370,  370,  370,  370,  408,  408,  370,  408,  408,  370,
			  370,  370,  370,  370,  372,  372,  372,  408,  408,  372,
			  408,  408,  408,  372,  372,  372,  372,   13,  408,  408,
			  408,  408,  408,  408,  408,  408,  408,  408,  408,  408,
			  408,  408,  408,  408,  408,  408,  408,  408,  408,  408,
			  408,  408,  408,  408,  408,  408,  408,  408,  408,  408,
			  408,  408,  408,  408,  408,  408,  408,  408,  408,  408,
			  408,  408,  408,  408,  408, yy_Dummy>>,
			1, 875, 2000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 2874)
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
			    2,    2,   14,   40,   14,   14,  405,   65,   65,    2,
			    2,    2,   42,   65,  401,    2,    2,    2,    2,    2,
			    2,    2,  385,   18,   40,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    3,    3,   20,    3,   20,   20,
			   63,    3,    3,   15,   15,   15,   15,  128,   42,    3,

			  128,   15,   16,   16,   16,   16,   17,   17,   17,   17,
			    3,  367,    3,    4,    4,   19,    4,   19,   19,   63,
			    4,    4,  335,   19,   23,   23,   23,   23,    4,   85,
			   85,   85,   23,   24,   24,   24,   24,  169,  332,    4,
			  169,    4,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    7,
			   29,   29,    7,   29,  163,   33,   33,   29,   33,  163,

			   44,   38,   33,   38,   38,   29,   41,  322,   48,   43,
			   33,   48,   45,    7,   56,   48,   56,   56,   57,   49,
			   57,   57,   49,   59,   59,   59,   59,  308,  308,    7,
			    7,    7,    7,    7,    8,   44,   44,    8,  327,  327,
			   41,   41,   41,   43,   43,   43,   45,   45,   45,   49,
			  131,  131,  131,   66,   50,   49,   66,   50,    8,  307,
			  330,   50,   58,   58,   58,   58,  307,   72,  125,   72,
			   58,   72,  125,  257,    8,    8,    8,    8,    8,    9,
			   50,  330,  202,    9,    9,  202,    9,    9,    9,   66,
			  257,    9,   64,   64,   64,   64,   64,   69,  105,    9,

			   69,  105,   69,  299,   69,   69,   69,   74,   74,   74,
			   74,   69,    9,   10,  229,  295,   64,   10,   10,  229,
			   10,   10,   10,   70,  204,   10,   70,  204,   70,  293,
			   70,   70,   70,   10,  105,  361,  361,   70,   76,   76,
			   76,   76,   78,   78,   78,   78,   10,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   21,  288,   21,   21,   81,   81,

			   75,   75,   75,   75,   81,   21,   21,   21,   75,  280,
			  142,   21,   21,   21,   21,   21,   21,   21,  132,  132,
			  132,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   22,   82,   82,   22,   22,   22,  132,   82,   22,   22,
			  278,   22,   22,   22,  270,   82,  142,   22,   22,   22,
			   22,   22,   22,   22,  243,  243,   82,   22,   22,   22,
			   22,   22,   22,   22,   22,   22,   22,   25,   25,   25,
			   25,   25,  243,   25,   25,   25,   25,   25,   25,   25,
			   25,   25,   25,   25,   25,   25,   25,   25,   25,   25,
			   25,   25,  144,   25,   25,   25,   25,   25,   25,   25,

			   25,   25,   25,   25,   25,   25,   25,   25,   25,   25,
			   25,   25,   25,   25,   26,   26,   26,  138,  138,  138,
			   26,   26,   26,   26,   26,   26,   26,  144,  144,  390,
			   26,   26,   26,   26,   26,   26,   26,   26,   26,   67,
			  159,  159,  159,   67,  390,   67,   67,   67,   67,   67,
			   67,   67,   67,   67,   67,   67,   67,   67,   67,   67,
			   67,   67,   67,   67,   67,   67,  260,   67,   67,   67,
			   67,   67,   67,   67,   67,   67,   67,   67,   67,   67,
			   67,   67,   67,   67,   67,   67,   71,  248,  256,   71,
			  241,   71,  237,   71,   71,   71,   77,   77,   77,   77,

			   71,  234,   83,   83,   77,   83,  248,   86,   86,   83,
			   86,  167,  167,  167,   86,   71,  233,   83,   91,   71,
			   91,   91,   86,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   94,  303,  100,  102,  303,  100,  102,  225,   95,  100,
			  102,   96,  103,  104,   97,  103,  104,   98,  224,  106,
			  104,  103,  106,  103,  103,  103,  110,  116,  103,  110,

			  168,  168,  168,  106,  116,  116,  116,   94,   94,   94,
			   94,   94,   95,   95,   95,   96,   96,   96,   97,   97,
			   97,   98,   98,   98,  109,  106,  133,  109,  133,  133,
			  141,  109,  110,  111,  111,  121,  111,  121,  121,  161,
			  111,  111,  117,  117,  117,  117,  161,  161,  161,  121,
			  109,  119,  119,  119,  223,  143,  220,  119,  119,  119,
			  119,  119,  119,  119,  141,  141,  141,  119,  119,  119,
			  119,  119,  119,  119,  119,  119,  120,  120,  120,  175,
			  175,  175,  120,  120,  120,  120,  120,  120,  120,  143,
			  143,  143,  120,  120,  120,  120,  120,  120,  120,  120,

			  120,  123,  177,  177,  177,  123,  123,  123,  123,  123,
			  123,  123,  123,  123,  123,  123,  123,  123,  123,  123,
			  123,  123,  123,  123,  123,  123,  123,  123,  188,  123,
			  123,  123,  123,  123,  123,  123,  123,  123,  123,  123,
			  123,  123,  123,  123,  123,  123,  123,  123,  127,  372,
			  372,  127,  129,  129,  145,  127,  187,  146,  129,  185,
			  147,  134,  134,  134,  134,  134,  137,  262,  137,  137,
			  137,  266,  262,  129,  135,  135,  266,  129,  130,  130,
			  135,  130,  130,  130,  130,  134,  183,  135,  145,  145,
			  145,  146,  146,  146,  147,  147,  147,  135,  149,  130,

			  173,  149,  149,  130,  139,  139,  166,  139,  139,  139,
			  181,  181,  181,  139,  139,  139,  139,  139,  139,  139,
			  182,  182,  182,  139,  139,  139,  139,  139,  139,  139,
			  139,  139,  148,  151,  171,  148,  151,  171,  171,  148,
			  151,  155,  155,  171,  155,  157,  157,  160,  157,  155,
			  165,  162,  160,  157,  160,  160,  160,  164,  170,  164,
			  164,  170,  158,  172,  153,  170,  172,  172,  179,  179,
			  179,  179,  172,  152,  164,  164,  164,  164,  164,  164,
			  164,  178,  178,  178,  170,  164,  164,  164,  164,  164,
			  164,  164,  164,  174,  126,  174,  174,  174,  178,  189, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  282,  189,  189,  189,  300,  282,  180,  180,  124,  300,
			  174,  176,  180,  176,  176,  122,  189,  180,  176,  324,
			  176,  115,  176,  176,  176,  190,  190,  190,  180,  114,
			  247,  192,  247,  247,  193,  107,  324,  176,  192,  192,
			  192,  193,  193,  193,  194,  194,  194,  194,  194,  194,
			  194,  199,  199,  199,  101,  194,  194,  194,  194,  194,
			  194,  194,  194,  195,  195,  195,  201,  201,  201,  195,
			  195,  195,  195,  195,  195,  195,  209,  209,  209,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  198,  203,
			   99,   89,  203,  198,  200,  198,  198,  198,   84,  200,

			   68,  200,  200,  200,  205,   61,   60,  205,  205,  211,
			   55,  211,  211,  205,  206,  203,  211,  206,  206,  214,
			  214,  214,  208,  206,  207,  208,  208,  207,  208,  208,
			  208,  208,  207,  207,   52,  207,  207,  207,  212,   47,
			  212,  212,   46,   37,  213,  212,  213,  213,  215,  215,
			  215,  207,  216,  216,  216,  213,  213,  213,  218,  218,
			  218,  219,  219,  222,  222,  222,  221,  219,  221,  221,
			  221,  213,  326,  383,  219,   34,   32,  218,  226,  226,
			  226,  227,  227,  227,  219,  230,   30,   27,  231,  326,
			  230,  383,  230,  230,  230,  231,  231,  231,  232,  232,

			  232,  235,  235,  235,  232,  232,  232,  232,  232,  232,
			  232,  236,  236,  236,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  238,  238,  238,  239,  239,  239,  240,
			  240,  240,  242,   13,    0,  242,  242,    0,  242,  242,
			  242,  242,  244,    0,    0,  244,  244,  245,  245,  245,
			  318,  244,  318,  318,  242,  246,  246,  246,  249,    0,
			  249,  249,    0,  244,    0,  249,  347,  249,  250,  250,
			  250,  251,  251,  251,  252,  252,  252,  253,  253,  253,
			  253,  254,  254,  347,  249,  318,  258,  254,  258,  258,
			  258,  254,  259,  259,  259,  272,  272,  263,  264,  264,

			  264,    0,  263,  258,  263,  263,  263,  267,  268,  268,
			  268,    0,  267,  272,  267,  267,  267,  269,  269,  269,
			  271,  356,    0,  271,  271,  277,  277,  277,  273,  271,
			  273,  273,  273,  275,  275,  275,  284,  284,  356,  276,
			  275,  276,  276,  276,    0,  273,  283,  279,  279,  283,
			  283,    0,  275,  279,  284,  283,  276,  289,  289,  289,
			    0,    0,  279,  281,  281,  281,  281,  281,  281,  281,
			  296,  296,  296,    0,  281,  281,  281,  281,  281,  281,
			  281,  281,  285,  285,    0,  298,  298,    0,  285,  291,
			    0,  302,  291,  302,  302,  302,    0,  291,  291,    0,

			  291,  291,  291,  298,  292,  292,  292,  292,  302,  316,
			  316,  316,  292,  292,  320,  320,  291,  291,  292,  294,
			  294,  294,    0,    0,  316,  294,  294,  294,  294,  294,
			  294,  294,  320,    0,    0,  294,  294,  294,  294,  294,
			  294,  294,  294,  294,  297,  304,  304,  297,  297,    0,
			  297,  297,  297,  297,  305,  305,  305,  305,  331,  331,
			  310,    0,    0,  304,    0,  310,  297,  310,  310,  310,
			  304,  311,    0,    0,  311,  311,  331,    0,  312,  312,
			  311,  312,  312,  312,  315,  315,    0,  315,  315,  315,
			  319,    0,    0,  319,  319,    0,  312,  312,    0,  319,

			    0,    0,  315,  317,  317,  317,  334,  334,  334,  317,
			  317,  317,  317,  317,  317,  317,  336,  336,  336,  317,
			  317,  317,  317,  317,  317,  317,  317,  317,  323,    0,
			  323,  323,  323,  325,    0,  325,  325,  325,    0,    0,
			  328,    0,  328,  328,    0,  323,  337,  337,  337,    0,
			  325,  328,  328,  328,  329,    0,  333,  329,  329,  333,
			  352,  352,  339,  329,  339,  339,    0,  333,  333,  333,
			    0,  339,    0,  339,  339,  339,  340,    0,  352,  340,
			  340,  345,  333,  345,    0,  340,  341,  341,  341,  341,
			  342,  342,    0,  342,  342,  342,  344,    0,  345,  344,

			  346,  346,  346,    0,  381,  344,  381,  381,  342,  342,
			  348,    0,  348,  348,  348,  349,  349,  349,  350,    0,
			  350,  350,  344,  354,  354,  354,    0,  348,    0,  350,
			  350,  350,  351,  381,  351,  351,  351,  351,    0,  357,
			    0,  357,  357,  358,  358,  358,  358,    0,  357,  351,
			  357,  357,  357,  360,  360,  362,    0,  362,  362,  363,
			    0,  363,  363,  363,  363,    0,  362,  362,  362,  364,
			  364,  360,  365,  365,  365,  369,    0,  369,  369,  369,
			  370,  370,  371,  371,  371,    0,    0,  364,  373,  373,
			  373,  375,    0,  375,  375,    0,  365,  368,  370,  368,

			  368,    0,    0,  368,  374,  368,  374,  374,  368,  368,
			  368,  384,  384,  384,    0,  374,  374,  374,    0,  376,
			    0,  376,  376,  375,  376,  376,  376,  377,    0,  377,
			  377,  377,  378,    0,  378,  378,  378,    0,  374,  379,
			    0,  379,  379,  380,  377,  380,  380,    0,    0,  378,
			  379,  379,  379,    0,  380,  380,  380,  382,  382,  382,
			  386,  386,  386,  388,  388,  388,  389,  389,  389,  391,
			    0,  391,  391,  391,  393,  393,  393,  393,  388,  392,
			  382,  392,  392,  392,  394,  394,  394,  395,  395,  395,
			  396,    0,  396,  396,  396,  397,    0,  397,    0,    0,

			  397,  397,  397,  398,    0,  398,    0,    0,  398,  398,
			  398,  399,  399,  399,  400,  400,  400,  402,  402,  402,
			    0,  403,  403,  403,  404,  404,  404,  406,  406,  406,
			    0,  442,  399,  442,  442,  402,  403,  400,  407,  407,
			  407,  450,    0,    0,    0,  442,  450,  450,  450,    0,
			  442,  442,  442,  407,  409,  409,  409,  409,  409,  409,
			  409,  409,  409,  409,  409,  409,  409,  409,  409,  409,
			  409,  409,  409,  409,  409,  409,  409,  409,  410,  410,
			  410,  410,  410,  410,  410,  410,  410,  410,  410,  410,
			  410,  410,  410,  410,  410,  410,  410,  410,  410,  410,

			  410,  410,  411,  411,    0,  411,  411,    0,  411,  411,
			  411,  411,  411,  411,  411,  411,  411,  411,    0,  411,
			  411,  411,  411,  411,  411,  411,  412,  412,    0,  412,
			  412,  412,  412,  412,  412,  412,  412,  412,  412,  412,
			  412,  412,  412,    0,  412,  412,  412,  412,  412,  412,
			  413,  413,  413,  413,  413,    0,  413,  413,  413,  413,
			  413,  413,  413,  413,  413,  413,    0,  413,  413,  413,
			  413,  413,  413,  413,  414,  414,  414,  414,  414,    0,
			    0,  414,    0,    0,    0,  414,  414,  414,  414,  415,
			  415,    0,  415,  415,  415,  415,  415,  415,  415,  415, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  415,  415,  415,  415,  415,  415,    0,  415,  415,  415,
			  415,  415,  415,  416,  416,    0,  416,  416,  416,  416,
			  416,  416,  416,  416,  416,  416,  416,  416,  416,  416,
			    0,  416,  416,  416,  416,  416,  416,  417,    0,    0,
			  417,    0,    0,  417,    0,  417,  417,  417,  417,    0,
			  417,  418,  453,    0,  418,    0,    0,  453,  453,  453,
			  418,  418,  418,    0,    0,  418,    0,    0,    0,  418,
			  418,  418,  418,  418,  419,  419,  419,    0,    0,  419,
			    0,    0,    0,  419,  419,  419,  419,  420,  420,  420,
			  420,  420,  420,  420,  420,  420,  420,  420,  420,  420,

			  420,  420,  420,  420,  420,  420,  420,  420,  420,  420,
			  420,  421,    0,  421,  421,  421,  421,  421,  421,    0,
			  421,    0,    0,    0,  421,  421,  421,  421,  422,    0,
			    0,  422,    0,  422,  422,  422,  422,  422,  422,  422,
			  422,    0,  422,    0,    0,    0,  422,  422,  422,  422,
			  423,    0,    0,  423,    0,  423,  423,  423,  423,  423,
			  423,  423,  423,    0,  423,    0,    0,    0,  423,  423,
			  423,  423,  424,  424,  424,  424,  424,  424,  424,  424,
			  424,  424,  424,  424,  424,  424,  424,  424,  424,  424,
			  424,  424,  424,  424,  424,  424,  425,  425,  425,  425,

			  425,  425,  425,  425,  425,  425,  425,  425,  425,  425,
			  425,  425,  425,  425,  425,  425,  425,  425,  425,  425,
			  426,  426,  426,  426,  426,  426,  426,  426,  426,  426,
			  426,  426,  426,  426,  426,  426,  426,  426,  426,  426,
			  426,  426,  426,  426,  427,    0,    0,    0,  427,  427,
			  427,  427,  427,  427,  427,  427,  427,  427,  427,  427,
			  427,  427,    0,  427,  427,  427,  427,  427,  428,  460,
			    0,  428,    0,    0,  460,  460,  460,  428,  428,  428,
			    0,    0,  428,    0,    0,    0,  428,  428,  428,  428,
			  429,  429,  429,  429,  429,  429,  429,  429,  429,  429,

			  429,  429,  429,  429,  429,  429,  429,  429,  429,  429,
			  429,  429,  429,  429,  430,    0,    0,  430,    0,    0,
			  430,    0,  430,  430,  430,  430,    0,  430,  431,    0,
			    0,  431,    0,    0,    0,  431,  431,  431,  431,  431,
			    0,    0,  431,    0,    0,    0,  431,  431,  431,  431,
			  432,    0,  432,  432,  432,  432,  432,  432,    0,  432,
			    0,    0,    0,  432,  432,  432,  432,  433,    0,  433,
			  433,  433,  433,  433,  433,    0,  433,    0,    0,    0,
			  433,  433,  433,  433,  434,  434,    0,  434,  434,  434,
			  434,  434,  434,  434,  434,  434,  434,  434,  434,  434,

			  434,    0,  434,  434,  434,  434,  434,  434,  435,  435,
			  435,    0,    0,  435,    0,    0,    0,  435,  435,  435,
			  435,  436,  436,  436,  436,  436,  436,  436,  436,  436,
			  436,  436,  436,  436,  436,  436,  436,  436,  436,  436,
			  436,  436,  436,  436,  436,  437,    0,    0,  437,    0,
			    0,    0,  437,  437,  437,  437,  437,    0,    0,  437,
			    0,    0,    0,  437,  437,  437,  437,  438,    0,  438,
			  438,    0,    0,    0,    0,    0,  438,  438,  438,    0,
			    0,  438,    0,    0,    0,  438,  438,  438,  438,  439,
			  439,  439,  439,  439,  439,  439,  439,  439,  439,  439,

			  439,  439,  439,  439,  439,  439,  439,  439,  439,  439,
			  439,  439,  439,  440,    0,  440,  440,  440,  440,  440,
			  440,    0,  440,    0,    0,    0,  440,  440,  440,  440,
			  441,  441,  441,  441,  441,    0,    0,  441,    0,    0,
			  441,  441,  441,  441,  441,  443,    0,    0,  443,  443,
			  443,    0,    0,  443,    0,    0,  443,  443,  443,  443,
			  443,  444,    0,  444,  444,  444,  444,  444,  444,    0,
			  444,    0,    0,    0,  444,  444,  444,  444,  445,  445,
			  445,    0,    0,  445,    0,    0,    0,  445,  445,  445,
			  445,  446,  446,  446,  446,  446,    0,    0,  446,    0,

			    0,  446,  446,  446,  446,  446,  447,  447,  447,    0,
			    0,  447,    0,    0,    0,  447,  447,  447,  447,  448,
			  448,  448,    0,    0,  448,    0,    0,    0,  448,  448,
			  448,  448,  449,    0,  449,  449,  449,  449,  449,  449,
			    0,  449,    0,    0,    0,  449,  449,  449,  449,  451,
			    0,  451,  451,  451,  451,  451,  451,    0,  451,    0,
			    0,    0,  451,  451,  451,  451,  452,  452,  452,  452,
			  452,    0,    0,  452,    0,    0,  452,  452,  452,  452,
			  452,  454,  454,  454,    0,    0,  454,    0,    0,    0,
			  454,  454,  454,  454,  455,  455,  455,  455,  455,    0,

			    0,  455,    0,    0,  455,  455,  455,  455,  455,  456,
			  456,  456,    0,    0,  456,    0,    0,    0,  456,  456,
			  456,  456,  457,    0,  457,  457,  457,  457,  457,  457,
			    0,  457,    0,    0,    0,  457,  457,  457,  457,  458,
			    0,  458,  458,  458,  458,  458,  458,    0,  458,    0,
			    0,    0,  458,  458,  458,  458,  459,  459,  459,  459,
			  459,    0,    0,  459,    0,    0,  459,  459,  459,  459,
			  459,  461,  461,  461,  461,  461,    0,    0,  461,    0,
			    0,  461,  461,  461,  461,  461,  462,  462,  462,    0,
			    0,  462,    0,    0,    0,  462,  462,  462,  462,  463,

			  463,  463,  463,  463,    0,    0,  463,    0,    0,  463,
			  463,  463,  463,  463,  464,  464,  464,    0,    0,  464,
			    0,    0,    0,  464,  464,  464,  464,  408,  408,  408,
			  408,  408,  408,  408,  408,  408,  408,  408,  408,  408,
			  408,  408,  408,  408,  408,  408,  408,  408,  408,  408,
			  408,  408,  408,  408,  408,  408,  408,  408,  408,  408,
			  408,  408,  408,  408,  408,  408,  408,  408,  408,  408,
			  408,  408,  408,  408,  408, yy_Dummy>>,
			1, 875, 2000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,   46,   82,  111,  141,    0,  186,  231,  273,
			  307,  346,    0, 1233,   50,   91,  100,  104,   43,  113,
			   84,  392,  428,  122,  131,  466,  501, 1165, 2827,  188,
			 1176, 2827, 1141,  193, 1165,    0, 2827, 1137,  199, 2827,
			   47,  200,   56,  203,  194,  206, 1136, 1129,  206,  217,
			  252, 2827, 1106, 2827,    0, 1080,  212,  216,  260,  221,
			 1096, 1099, 2827,   84,  290,   47,  251,  538, 1084,  295,
			  321,  584,  236, 2827,  305,  398,  336,  594,  340, 2827,
			    0,  388,  421,  600, 1095,  116,  605,  622,    0, 1085,
			 2827,  616, 2827, 2827,  664,  672,  675,  678,  681, 1084,

			  670, 1051,  671,  680,  681,  296,  687, 1002, 2827,  722,
			  694,  731, 2827,    0,  994, 1018,  691,  740, 2827,  738,
			  763,  733, 1009,  800, 1002,  237,  978,  846,   95,  842,
			  868,  237,  405,  724,  859,  864, 2827,  855,  504,  894,
			 2827,  724,  404,  749,  486,  848,  851,  854,  930,  896,
			 2827,  931,  957,  933, 2827,  939, 2827,  943,  952,  527,
			  941,  733,  941,  183,  955,  922,  878,  598,  687,  135,
			  956,  927,  956,  884,  982,  766, 1009,  789,  968,  966,
			  996,  897,  907,  880,    0,  829, 2827,  846,  825,  988,
			 1012, 2827, 1025, 1028, 1025, 1050, 2827, 2827, 1082, 1038,

			 1088, 1053,  280, 1087,  322, 1097, 1107, 1122, 1115, 1063,
			 2827, 1107, 1136, 1142, 1106, 1135, 1139, 2827, 1145, 1151,
			  745, 1155, 1150,  726,  656,  674, 1165, 1168, 2827,  308,
			 1179, 1182, 1185,  606,  573, 1188, 1198,  564, 1210, 1213,
			 1216,  562, 1225,  444, 1235, 1234, 1242, 1028,  578, 1256,
			 1255, 1258, 1261, 1264, 1271, 2827,  572,  262, 1275, 1279,
			  555, 2827,  861, 1291, 1285, 2827,  865, 1301, 1295, 1304,
			  416, 1313, 1285, 1317,    0, 1324, 1328, 1312,  424, 1337,
			  393, 1344,  994, 1339, 1326, 1372,    0,    0,  379, 1344,
			 2827, 1387, 1402,  299, 1406,  287, 1357, 1437, 1375,  293,

			  993,    0, 1380,  669, 1435, 1452, 2827,  231,  217, 2827,
			 1454, 1464, 1468,    0,    0, 1474, 1396, 1490, 1248, 1483,
			 1404,    0,  197, 1517, 1008, 1522, 1161,  228, 1538, 1547,
			  244, 1448,  127, 1554, 1493,   94, 1503, 1533, 2827, 1560,
			 1569, 1573, 1580,    0, 1594, 1570, 1587, 1255, 1599, 1602,
			 1616, 1621, 1550,    0, 1610, 2827, 1310, 1637, 1630, 2827,
			 1643,  325, 1653, 1648, 1659, 1659,    0,   74, 1695, 1664,
			 1670, 1669,  839, 1675, 1702, 1689, 1711, 1716, 1721, 1737,
			 1741, 1602, 1744, 1157, 1698,   44, 1747, 2827, 1750, 1753,
			  513, 1758, 1768, 1761, 1771, 1774, 1779, 1787, 1795, 1798,

			 1801,   30, 1804, 1808, 1811,   25, 1814, 1825, 2827, 1853,
			 1877, 1901, 1925, 1949, 1965, 1988, 2012, 2035, 2049, 2063,
			 2086, 2104, 2126, 2148, 2171, 2195, 2219, 2243, 2266, 2289,
			 2312, 2326, 2343, 2360, 2383, 2397, 2420, 2443, 2465, 2488,
			 2506, 2521, 1829, 2537, 2554, 2567, 2582, 2595, 2608, 2625,
			 1825, 2642, 2657, 2036, 2670, 2685, 2698, 2715, 2732, 2747,
			 2253, 2762, 2775, 2790, 2803, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  408,    1,  409,  409,  408,    5,  410,  410,  409,
			  409,  408,   11,  408,  411,  408,  408,  408,  412,  411,
			  411,  411,  408,  413,  413,  408,   25,   26,  408,  408,
			  408,  408,  408,  408,  414,  414,  408,  415,  408,  408,
			  408,  415,  415,  415,  415,  415,  416,  408,  417,  418,
			  408,  408,  408,  408,  419,  408,  411,  408,  408,  408,
			  408,  412,  408,  412,  420,   21,  408,  408,  421,  422,
			  423,  423,   71,  408,  413,  413,  413,  413,  408,  408,
			   25,   26,   26,  408,  424,  408,  408,  408,  414,  415,
			  408,  408,  408,  408,  415,  415,  415,  415,  415,  416,

			  408,  425,  408,  408,  417,  408,  418,  106,  408,  408,
			  408,  408,  408,  419,  408,  426,  412,  426,  408,   21,
			  119,  411,  427,  408,  427,  123,  408,  408,  428,   71,
			   71,  130,  130,  408,  429,   26,  408,  408,  408,   87,
			  408,  415,  415,  415,  415,  415,  415,  415,  408,  408,
			  408,  430,  408,  106,  408,  408,  408,  408,  408,  408,
			  412,  412,  119,  120,  411,  408,  408,  123,  123,  431,
			  428,  432,  433,  408,  130,  130,  130,  130,  130,  426,
			   26,  408,  408,  434,  435,  106,  408,  408,  436,  408,
			  408,  408,  412,  412,  164,  194,  408,  408,  123,  123,

			  123,  123,  408,  431,  408,  432,  433,  437,  433,  130,
			  408,  408,  408,  438,  208,  130,  130,  408,  130,   26,
			  408,  408,  408,  435,  106,  439,  408,  408,  408,  412,
			  412,  412,  195,  195,  408,  123,  123,  408,  123,  123,
			  123,  408,  440,  441,  433,  244,  130,  442,  443,  244,
			  249,  130,  130,  130,   26,  408,  106,  408,  408,  408,
			  232,  408,  123,  123,  123,  408,  123,  123,  123,  123,
			  408,  444,  441,  130,  445,  443,  176,  176,  408,   26,
			  408,  194,  123,  444,  446,  445,  447,  448,  408,  208,
			  408,  437,   26,  435,  281,  408,  123,  449,  446,  447,

			  448,  450,  249,  408,  441,  408,  408,  435,  294,  408,
			  123,  451,  452,  453,  454,  441,  435,  294,  411,  451,
			  455,  456,  454,  315,  323,  316,  325,  317,  411,  457,
			  458,  455,  456,  431,  315,  408,  408,  316,  408,  411,
			  457,  458,  459,  460,  431,  333,  315,  408,  408,  316,
			  411,  458,  461,  462,  323,  408,  435,  411,  458,  408,
			  461,  462,  411,  458,  463,  333,  464,  408,  411,  363,
			  463,  333,  464,  408,  411,  411,  363,  333,  408,  411,
			  411,  411,  408,  458,  333,  408,  408,  408,  408,  408,
			  458,  333,  408,  458,  333,  408,  351,  333,  408,  333,

			  408,  408,  333,  408,  408,  408,  333,  333,    0,  408,
			  408,  408,  408,  408,  408,  408,  408,  408,  408,  408,
			  408,  408,  408,  408,  408,  408,  408,  408,  408,  408,
			  408,  408,  408,  408,  408,  408,  408,  408,  408,  408,
			  408,  408,  408,  408,  408,  408,  408,  408,  408,  408,
			  408,  408,  408,  408,  408,  408,  408,  408,  408,  408,
			  408,  408,  408,  408,  408, yy_Dummy>>)
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
			   16,   16,   16,   16,   16,   16,   17,   18,   19,   20,
			   16,   16,   16,   16,   16,   21,   22,   23,   24,    1,
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
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   57,
			   58,    0,    0,    0,    0,    0,   22,    0,    0,    0,
			    0,   47,   49,   49,   58,   58,   45,   44,    0,    0,

			    0,    0,   32,   31,   13,    0,    0,   32,    0,    0,
			    8,    0,    0,    0,    0,    0,    0,    6,    0,   58,
			   26,   26,    0,    0,    0,    0,    0,    0,   40,   49,
			   49,   49,   58,   58,    0,    0,    0,    0,    0,    0,
			    0,   30,    0,   31,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,   58,   19,    0,    0,    0,    0,
			   58,   12,    0,    0,    0,   11,    0,    0,    0,    0,
			   31,    0,   31,    0,    0,    0,    0,    0,    0,   58,
			    0,   58,    0,    0,   31,    0,    0,    0,    0,    0,
			    5,   25,   58,    0,   58,    0,    0,    0,   31,    0,

			    0,    0,    0,   25,   31,   58,    3,    0,   58,   10,
			    0,    0,   31,    0,    0,   31,    0,   58,   58,    0,
			   31,    0,    0,   31,   31,    0,    0,   58,   58,    0,
			    0,   31,    0,   31,   31,   24,    0,    0,   18,   46,
			    0,    0,   31,    0,   31,   31,   31,    0,    0,    0,
			   58,    0,   31,    0,   31,   18,    0,   58,    0,    9,
			   31,    0,   58,    0,   31,   31,    0,    0,   58,    0,
			   31,   31,    0,    0,   58,   58,    0,   31,    0,   46,
			   58,   58,    0,    0,   31,    9,    0,    7,    0,    0,
			    0,   31,    0,    0,   31,    0,    0,   31,    0,   31,

			    0,    0,   31,    0,    0,    0,   31,   31,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 2827
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 408
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 409
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
			create str_.make_empty
			create new_code_str.make_empty
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

	str_, new_code_str: STRING

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
