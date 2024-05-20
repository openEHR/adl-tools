note
	component:   "openEHR ADL Tools"
	description: "Stream rewriter for ADL 1.4 and transitional ADL 1.5 archetypes containing old style 0-filled at- and ac-codes"
	keywords:    "transformation, archetype"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- openEHR Foundation <http://www.openehr.org>"
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
			inspect yy_act
when 1 then
--|#line 70 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 70")
end
out_buffer.append (text)
when 2 then
--|#line 72 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 72")
end
out_buffer.append (text)			-- pass separate comment line endings
when 3 then
--|#line 76 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 76")
end

		out_buffer.append (text)
		in_terminology := True
	
when 4 then
--|#line 81 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 81")
end

		out_buffer.append (text)
	
when 5 then
--|#line 87 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 87")
end

		out_buffer.append_character ('[')
		output_new_id_code (text_substring (2, text_count - 1))
		out_buffer.append_character (']')
	
when 6 then
--|#line 93 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 93")
end

		out_buffer.append_character ('[')
		output_new_id_code (text_substring (2, text_count - 1))
		out_buffer.append_character (']')
	
when 7 then
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
	
when 8 then
--|#line 109 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 109")
end

		out_buffer.append_character ('[')
		output_new_value_set_code (text_substring (2, text_count - 1))
		out_buffer.append_character (']')
	
when 9 then
--|#line 115 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 115")
end

		out_buffer.append (text)
	
when 10 then
--|#line 121 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 121")
end

		output_converted_code_dt_key (text_substring (3, text_count - 2))
	
when 11 then
--|#line 125 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 125")
end

		output_converted_code_dt_key (text_substring (3, text_count - 2))
	
when 12 then
--|#line 129 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 129")
end

		output_converted_code_dt_key (text_substring (3, text_count - 2))
	
when 13 then
--|#line 134 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 134")
end

		out_buffer.append (text)
	
when 14 then
--|#line 138 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 138")
end
		-- match [{
		out_buffer.append (text)
		set_start_condition (IN_TUPLE)
	
when 15 then
--|#line 144 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 144")
end
 		-- strings and lists of strings
		out_buffer.append (text)
	
when 16 then
--|#line 148 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 148")
end
 							-- interior }, { pattern
		out_buffer.append (text)
	
when 17 then
--|#line 152 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 152")
end
			-- numbers and lists of numbers and symbols (e.g. in intervals)
		out_buffer.append (text)
	
when 18 then
--|#line 156 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 156")
end
						-- ADL codes
		out_buffer.append ("[local::")
		output_new_value_code (text_substring (9, text_count-1))
		out_buffer.append_character (']')
	
when 19 then
--|#line 162 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 162")
end
				-- other codes
		out_buffer.append (text)
	
when 20 then
--|#line 166 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 166")
end
out_buffer.append (text)			-- pass separate comment lines
when 21 then
--|#line 168 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 168")
end
										-- match [{
		out_buffer.append (text)
	
when 22 then
--|#line 172 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 172")
end
						-- termination of interior tuple line }],\n with optional comment
		out_buffer.append (text)
		set_start_condition (INITIAL)
	
when 23 then
--|#line 177 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 177")
end
						-- termination of final tuple line }]\n with optional comment
		out_buffer.append (text)
		set_start_condition (INITIAL)
	
when 24 then
--|#line 182 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 182")
end
	-- Catch-all rules (no backing up)
				set_start_condition (INITIAL)
	
when 25 then
--|#line 200 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 200")
end
						-- ADL codes
	out_buffer.append ("[local::")
	output_new_value_code (text_substring (9, text_count-1))
	out_buffer.append_character (']')

when 26 then
--|#line 206 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 206")
end

		out_buffer.append (text)
		set_start_condition (IN_ADL_VALUE_SET_DEF)
	
when 27 then
--|#line 212 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 212")
end
 -- match second last line with ';' termination (assumed value)
		output_new_value_code (text)
	
when 28 then
--|#line 216 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 216")
end
out_buffer.append (text)
when 29 then
--|#line 219 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 219")
end
out_buffer.append (text)
when 30 then
--|#line 221 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 221")
end

		out_buffer.append (text)
		set_start_condition (INITIAL)
	
when 31 then
--|#line 226 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 226")
end
	-- Catch-all rules (no backing up)
				set_start_condition (INITIAL)
	
when 32 then
--|#line 234 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 234")
end
 
		if in_terminology then
			create term_code.make_from_string (text.substring (2, text_count - 1))
			out_buffer.append (uri_for_terminology_code (term_code))
		else
			out_buffer.append (text)
		end
	
when 33 then
--|#line 255 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 255")
end

		out_buffer.append (text)
		set_start_condition (IN_VALUE_SET_DEF)
	
when 34 then
--|#line 260 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 260")
end

		out_buffer.append (text)
		set_start_condition (IN_VALUE_SET_DEF)
	
when 35 then
--|#line 266 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 266")
end
 
		out_buffer.append (text)
	
when 36 then
--|#line 270 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 270")
end

		out_buffer.append (text)
	
when 37 then
--|#line 275 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 275")
end
out_buffer.append (text)
when 38 then
--|#line 277 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 277")
end

		out_buffer.append (text)
		set_start_condition (INITIAL)
	
when 39 then
--|#line 282 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 282")
end
	-- Catch-all rules (no backing up)
				set_start_condition (INITIAL)
	
when 40 then
--|#line 289 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 289")
end

	out_buffer.append (text)
	set_start_condition (IN_PATH)

when 41 then
--|#line 294 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 294")
end

	out_buffer.append (text)
	set_start_condition (IN_PATH)

when 42 then
--|#line 300 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 300")
end
 
		out_buffer.append (text)
	
when 43 then
--|#line 304 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 304")
end
 
		out_buffer.append_character ('[')
		output_new_id_code (text_substring (2, text_count - 1))
		out_buffer.append_character (']')
	
when 44 then
--|#line 310 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 310")
end

		out_buffer.append (text)
	
when 45 then
--|#line 314 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 314")
end

		out_buffer.append (text)
		set_start_condition (INITIAL)
	
when 46 then
--|#line 319 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 319")
end

		out_buffer.append (text)
		set_start_condition (INITIAL)
	
when 47 then
--|#line 327 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 327")
end
out_buffer.append (text)
when 48 then
--|#line 329 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 329")
end
out_buffer.append (text)
when 49 then
--|#line 335 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 335")
end

		out_buffer.append (text)
	
when 50 then
--|#line 341 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 341")
end

		out_buffer.append (text)
	
when 51 then
--|#line 346 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 346")
end
			-- can occur in some string data
		out_buffer.append_character ('"')
		output_new_value_code (text_substring (2, text_count - 1))
		out_buffer.append_character ('"')
	
when 52 then
--|#line 352 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 352")
end

		out_buffer.append (text)
	
when 53 then
--|#line 356 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 356")
end
				-- beginning of a string
		out_buffer.append (text)
		set_start_condition (IN_STR)
	
when 54 then
--|#line 362 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 362")
end
out_buffer.append (text)
when 55 then
--|#line 364 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 364")
end
out_buffer.append (text)
when 56 then
--|#line 366 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 366")
end

				out_buffer.append (text)
	
when 57 then
--|#line 370 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 370")
end
out_buffer.append (text)
when 58 then
--|#line 372 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 372")
end

				out_buffer.append (text)
	
when 59 then
--|#line 376 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 376")
end
						-- match final end of string
				out_buffer.append (text)
				set_start_condition (INITIAL)
	
when 60 then
--|#line 381 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 381")
end
	-- Catch-all rules (no backing up)
				set_start_condition (INITIAL)
	
when 61 then
--|#line 389 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 389")
end
		-- read non '[' non-space characters followed by whitespace
		out_buffer.append (text)
	
when 62 then
--|#line 393 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 393")
end
						-- read non '[' non-space characters followed by whitespace
		out_buffer.append (text)
	
when 63 then
--|#line 399 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 399")
end
-- ignore unmatched chars
when 64 then
--|#line 0 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 0")
end
default_action
			else
				last_token := yyError_token
				fatal_error ("fatal scanner internal error: no action found")
			end
			yy_set_beginning_of_line
		end

	yy_execute_eof_action (yy_sc: INTEGER)
			-- Execute EOF semantic action.
		do
			inspect yy_sc
when 0, 5 then
--|#line 398 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 398")
end
terminate
when 1 then
--|#line 227 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 227")
end
	-- Catch-all rules (no backing up)
				set_start_condition (INITIAL)
	
when 2 then
--|#line 283 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 283")
end
	-- Catch-all rules (no backing up)
				set_start_condition (INITIAL)
	
when 3 then
--|#line 382 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 382")
end
	-- Catch-all rules (no backing up)
				set_start_condition (INITIAL)
	
when 4 then
--|#line 183 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 183")
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
			create an_array.make_filled (0, 0, 2995)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			yy_nxt_template_3 (an_array)
			yy_nxt_template_4 (an_array)
			yy_nxt_template_5 (an_array)
			yy_nxt_template_6 (an_array)
			yy_nxt_template_7 (an_array)
			yy_nxt_template_8 (an_array)
			yy_nxt_template_9 (an_array)
			yy_nxt_template_10 (an_array)
			yy_nxt_template_11 (an_array)
			yy_nxt_template_12 (an_array)
			yy_nxt_template_13 (an_array)
			yy_nxt_template_14 (an_array)
			yy_nxt_template_15 (an_array)
			an_array.area.fill_with (449, 2949, 2995)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			    0,   15,   16,   16,   15,   17,   14,   14,   14,   18,
			   14,   19,   14,   14,   14,   14,   14,   14,   20,   20,
			   20,   20,   20,   20,   20,   21,   14,   14,   14,   20,
			   20,   20,   20,   20,   20,   20,   20,   14,   14,   14,
			   14,   14,   14,   14,   14,   14,   14,   14,   22,   64,
			   23,   22,   59,   95,   59,   59,  385,  122,  123,   24,
			   24,   24,   93,  124,   93,   25,   25,   25,   25,   26,
			   25,   25,  233,   65,   96,   24,   25,   25,   25,   26,
			   25,   25,   25,   25,   28,   28,   28,   28,   64,  235,
			  263,   28,   29,   60,   61,   61,   60,  334,   98,   28,

			   98,   62,   61,   61,   61,   61,   59,  135,   59,   59,
			   30,  136,   31,   28,   28,   28,   28,  119,  352,  175,
			   28,   29,   59,  154,   59,   59,  154,  189,   28,  340,
			   66,  125,   78,   61,   79,   78,  142,  143,  143,   30,
			   80,   31,   33,   33,   33,   33,   32,   32,   32,   33,
			   34,   35,   32,   35,   35,   35,   32,   33,   32,   35,
			   35,   35,   35,   35,   35,   35,   32,   32,   36,   35,
			   35,   35,   35,   35,   35,   35,   35,   35,   32,   32,
			   32,   32,   32,   32,   32,   32,   32,   32,   32,   38,
			   93,  446,   39,   79,   61,   79,   79,   86,   86,   86, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   86,  335,  336,   94,   86,   94,   94,   89,   89,   89,
			   89,   93,   86,   40,   89,   93,  105,  447,   93,  105,
			   93,  125,   89,  106,   97,   97,   97,  443,  214,   41,
			   42,   43,   44,   45,   38,  108,  112,   39,  108,  112,
			  125,  153,  426,  113,  153,   99,   99,   99,  154,  278,
			  100,  100,  101,  101,  101,  100,  100,   59,   40,   59,
			   59,   59,  114,   59,   59,  110,   61,   61,   61,   61,
			   94,  111,   94,   94,   41,   42,   43,   44,   45,   47,
			   93,  125,  105,   48,   49,  105,   49,   49,   49,  106,
			  401,   49,   60,   61,   61,   60,  349,  350,   69,   50,

			   62,   69,  120,  121,  120,  120,  118,  138,  449,  138,
			  138,  302,   51,   47,   97,   97,   97,   48,   49,  315,
			   49,   49,   49,  125,  125,   49,  118,   78,   61,   79,
			   78,  125,  421,   50,   76,   80,   79,   61,   79,   79,
			   81,   82,   81,   81,  335,  336,   51,   53,   53,   53,
			   53,   54,   52,   52,   52,   52,   52,   55,   56,   56,
			   56,   52,   52,   52,   56,   56,   56,   56,   56,   56,
			   56,   57,   52,   52,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   59,  407,   59,   59,  122,  123, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  138,  449,  138,  138,  124,   67,   67,   67,  139,  349,
			  350,   67,   67,   67,   67,   67,   67,   67,  188,  188,
			  188,   67,   67,   67,   67,   67,   67,   67,   67,   67,
			   69,  389,  390,   69,   70,   71,   68,   68,   71,   71,
			   68,   72,   72,   72,   68,   68,   68,   73,   73,   73,
			   73,   73,   73,   73,  376,   68,  278,   72,   74,   73,
			   75,   73,   73,   73,   73,   73,   76,   68,   68,   68,
			   68,   68,   68,   68,   68,   68,   68,   81,   82,   81,
			   81,  366,   58,   58,   58,   58,   58,   58,   83,   83,
			   83,   58,   58,   58,   83,   83,   83,   83,   83,   83,

			   83,  310,   58,   58,   83,   83,   83,   83,   83,   83,
			   83,   83,   83,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   84,   84,   84,  195,  196,  196,
			   84,   84,   84,   84,   84,   84,   84,  227,  228,  228,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   68,
			  392,  393,  126,   68,  127,  126,  126,  127,  127,  128,
			  127,  127,  127,  126,  126,  126,  127,  127,  127,  127,
			  127,  127,  127,  129,  126,  125,  127,  130,  127,  127,
			  127,  127,  127,  127,  127,  126,  126,  126,  126,  126,
			  126,  126,  126,  126,  126,  126,   68,  398,  399,   68, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   68,   71,   68,   68,   71,   71,   68,   71,   71,   71,
			  131,   68,   68,   71,   71,   71,   71,   71,   71,   71,
			  364,   68,  125,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   68,   68,   68,   68,   68,   68,   68,   68,
			   68,   68,   68,  132,  105,  363,  132,  105,   93,  296,
			  133,  106,  177,  178,   72,   72,   72,  339,  179,  333,
			   72,   72,   72,   72,   72,   72,   72,  229,  229,  229,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,  134,
			  134,  134,   97,   97,   97,  134,  134,  134,  134,  134,
			  134,  134,  389,  390,   93,  134,  134,  134,  134,  134,

			  134,  134,  134,  134,  122,  123,   86,   86,   86,   86,
			  124,  300,  331,   86,  120,  121,  120,  120,  140,  160,
			  161,   86,  160,   89,   89,   89,   89,  163,  301,  140,
			   89,  146,  147,  148,  149,  150,  392,  393,   89,  144,
			  145,  144,  144,  144,  144,  144,  144,   90,   90,  144,
			   90,   90,   90,  144,  144,  144,   90,   90,   90,   90,
			   90,   90,   90,  144,  144,  144,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,  144,  144,  144,  144,  144,
			  144,  144,  144,  144,  144,  144,   93,  106,  123,   93,
			  106,  108,  449,  124,  108,  449,  156,  449,  156,  156, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  156,  330,  113,  156,  112,  113,  157,  112,  327,  160,
			  161,  113,  160,  171,  263,  324,  162,  163,   93,  126,
			  151,  151,  151,  152,  152,  152,   64,  111,  449,   59,
			  114,   59,   59,  165,  166,  166,  322,  127,  159,  167,
			  167,  167,  308,  169,  304,  167,  167,  167,  167,  167,
			  167,  167,   97,   97,   97,  167,  167,  167,  167,  167,
			  167,  167,  167,  167,  168,  168,  168,  234,  234,  234,
			  168,  168,  168,  168,  168,  168,  168,  252,  253,  253,
			  168,  168,  168,  168,  168,  168,  168,  168,  168,   68,
			   68,  177,  178,  170,  170,  171,  132,  179,  294,  132,

			  355,  126,  368,  133,  177,  178,  178,  180,  181,  181,
			  179,  179,  184,  129,  129,  125,  125,  357,  249,  127,
			  173,  249,  125,  278,  174,  133,  177,  178,  133,  182,
			  183,  183,  179,  257,  258,  258,  176,  176,  176,  227,
			  227,  227,  176,  176,  176,  176,  176,  176,  176,  291,
			   93,  125,  176,  176,  176,  176,  176,  176,  176,  176,
			  176,  138,  290,  138,  138,  185,  121,  185,  185,  118,
			  122,  123,  278,   64,  273,  187,  124,  188,  188,  188,
			  199,  199,  199,  186,   99,   99,   99,  197,   93,  118,
			  269,   93,  198,  186,  144,  144,   93,  144,  144,  144, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  265,  266,  266,  144,  144,  144,  144,  144,  144,  144,
			  267,  267,  267,  144,  144,  144,  144,  144,  144,  144,
			  144,  144,  101,  101,  101,   97,   97,   97,  398,  399,
			   97,   97,   97,  153,  105,  249,  153,  105,  249,  197,
			  154,  106,  162,  192,  198,  162,  199,  199,  199,  358,
			  193,   59,  171,   59,   59,  265,  265,  265,  126,  205,
			  206,  206,  185,  121,  185,  185,  379,  122,  201,  201,
			  201,  201,  201,  201,  201,  255,  127,  255,  255,  201,
			  201,  201,  201,  201,  201,  201,  201,  171,  209,  358,
			  192,  209,  264,  126,  207,  208,  208,  177,  178,  263,

			  216,  216,  216,  179,  177,  178,  360,  223,  223,  223,
			  179,  127,  209,  187,  125,  209,   68,   68,   68,   68,
			  210,  210,   68,  210,  210,  210,   68,   68,   68,  210,
			  210,  210,  210,  210,  210,  210,  250,   68,  125,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,   68,   68,
			   68,   68,   68,   68,   68,   68,   68,   68,   68,   68,
			  125,  161,   68,  442,  177,  215,  133,  216,  216,  216,
			  179,  177,  178,   68,  177,  178,   68,  179,  122,  123,
			  288,  232,  217,  231,  124,  211,  212,  212,  212,  226,
			  103,  225,  212,  212,  212,  212,  212,  212,  212,  248, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  226,  204,  212,  212,  212,  212,  212,  212,  212,  212,
			  212,  213,  213,  213,  134,  134,  134,  213,  213,  213,
			  213,  213,  213,  213,  257,  317,  258,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  218,  297,  219,  218,
			  203,  215,  298,  220,  177,  221,  179,  222,  223,  223,
			  179,  233,   64,  234,  234,  234,   64,  202,  217,  236,
			  237,  237,  224,  238,  238,  238,  200,  194,  235,  239,
			  239,  239,  239,  239,  239,  239,  318,  191,  190,  318,
			  239,  239,  239,  239,  239,  239,  239,  239,  240,  240,
			  240,  370,  371,  371,  240,  240,  240,  240,  240,  240,

			  240,  172,  125,  121,  240,  240,  240,  240,  240,  240,
			  240,  240,  240,  241,  372,  372,  372,  171,  242,  126,
			  243,  243,  243,  126,  243,  243,  243,  244,  320,  321,
			  320,  320,  245,  126,  246,  247,  247,  127,  171,  294,
			  355,  127,  296,  297,  126,  247,  247,  247,  298,  177,
			  178,  127,  254,  254,  254,  179,  187,  357,  228,  228,
			  228,  164,  127,  251,  251,  251,  251,  251,  251,  251,
			  374,  374,  374,  158,  251,  251,  251,  251,  251,  251,
			  251,  251,  218,  155,  219,  218,  310,  311,  219,  220,
			  219,  219,  312,  177,  178,  255,  259,  260,  260,  179, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  177,  178,  311,  260,  260,  260,  179,  312,  125,  220,
			  103,  255,  220,  177,  178,  197,  380,  380,  380,  179,
			  198,   93,  237,  237,  237,  141,  256,  256,  256,  256,
			  256,  256,  256,  125,  137,  261,  125,  256,  256,  256,
			  256,  256,  256,  256,  256,  122,  123,   64,  345,  346,
			  346,  124,   64,  118,  236,  236,  236,  215,  262,  253,
			  253,  253,  179,  263,  117,  115,  177,  215,  262,  268,
			  268,  268,  179,  104,  217,  268,  268,  268,  268,  268,
			  268,  268,  103,   93,  217,  268,  268,  268,  268,  268,
			  268,  268,  268,  268,  171,   90,  318,   88,  171,  318,

			  126,  270,  271,  271,  126,  272,  272,  272,  171,  388,
			  388,  388,   87,   85,  126,  274,  275,  275,  127,  171,
			  449,  449,  127,  449,  319,  126,  276,  277,  277,  171,
			  449,  449,  127,  122,  123,  126,  277,  277,  277,  124,
			  449,  177,  178,  127,  281,  281,  281,  179,  303,  404,
			  404,  404,  449,  127,  279,  279,  279,  279,  279,  279,
			  279,  405,  405,  405,  449,  279,  279,  279,  279,  279,
			  279,  279,  279,  210,  210,  449,  280,  280,  280,  416,
			  416,  416,  280,  280,  280,  280,  280,  280,  280,  449,
			  449,  248,  280,  280,  280,  280,  280,  280,  280,  280, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_nxt_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  280,  133,  296,  297,  449,  283,  283,  283,  298,  449,
			  449,  283,  283,  283,  283,  283,  283,  283,  449,  449,
			  211,  283,  283,  283,  283,  283,  283,  283,  283,  283,
			  284,  294,  219,  284,  343,  344,  344,  285,   59,  221,
			   59,   59,  177,  178,  179,  286,  287,  287,  179,  177,
			  178,  449,  287,  287,  287,  179,  224,  284,  294,  219,
			  284,  356,  356,  356,  285,  449,  221,  410,  258,  258,
			  258,  179,  122,  123,  422,  422,  422,  233,  124,  266,
			  266,  266,  289,  224,  241,  449,  449,  244,  449,  242,
			  126,  241,  245,  126,  235,  171,  242,  126,  271,  271,

			  271,  126,  270,  270,  270,  449,  449,  284,  127,  219,
			  284,  127,  116,  116,  285,  127,  244,  116,  449,  127,
			  171,  245,  126,  275,  275,  275,  126,  292,  274,  274,
			  171,  449,  282,  125,  282,  282,  126,  274,  274,  274,
			  127,  282,  449,  300,  127,  134,  134,  134,  449,   59,
			  449,   59,   59,  449,  127,  293,  293,  293,  449,  449,
			  301,  293,  293,  293,  293,  293,  293,  293,  428,  428,
			  428,  293,  293,  293,  293,  293,  293,  293,  293,  293,
			  285,  306,  255,  285,  348,  449,  307,  126,  449,  294,
			  355,  449,  356,  356,  356,  449,  449,  299,  299,  299, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_nxt_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  299,  299,  299,  299,  449,  127,  125,  357,  299,  299,
			  299,  299,  299,  299,  299,  299,  305,  305,  305,  305,
			  305,  305,  305,  449,  210,  210,  210,  305,  305,  305,
			  305,  305,  305,  305,  305,  309,  309,  309,  430,  430,
			  430,  309,  309,  309,  309,  309,  309,  309,  397,  449,
			  449,  309,  309,  309,  309,  309,  309,  309,  309,  309,
			  313,  313,  313,  431,  431,  431,  313,  313,  313,  313,
			  313,  313,  313,  449,  449,  125,  313,  313,  313,  313,
			  313,  313,  313,  313,  313,  314,  314,  314,  435,  435,
			  435,  314,  314,  314,  314,  314,  314,  314,  408,  408,

			  408,  314,  314,  314,  314,  314,  314,  314,  314,  314,
			  316,  316,  316,  125,  449,  449,  316,  316,  316,  316,
			  316,  316,  316,  448,  448,  448,  316,  316,  316,  316,
			  316,  316,  316,  316,  316,  320,  321,  320,  320,  171,
			  425,  425,  425,  122,  123,  126,  274,  325,  275,  124,
			  323,  323,  323,  449,  449,  125,  323,  323,  323,  323,
			  323,  323,  323,  127,  449,  449,  323,  323,  323,  323,
			  323,  323,  323,  323,  323,  326,  326,  326,  326,  326,
			  326,  326,   59,  449,   59,   59,  326,  326,  326,  326,
			  326,  326,  326,  326,  332,  332,  332,  332,  332,  332, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_nxt_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  332,  449,  449,  125,  449,  332,  332,  332,  332,  332,
			  332,  332,  332,  306,  411,  419,  419,  419,  307,  126,
			  275,  275,  275,  449,  358,  449,  359,  359,  359,  294,
			  383,  449,  369,  369,  369,  449,  449,  127,  337,  337,
			  337,  360,  449,  449,  337,  337,  337,  337,  337,  337,
			  337,  210,  210,  210,  337,  337,  337,  337,  337,  337,
			  337,  337,  337,   68,  449,   59,   68,   59,   59,  444,
			  355,  449,  210,  210,  210,  449,  361,  361,  361,  449,
			  338,  338,  338,  338,  338,  338,  338,  357,  449,  248,
			  449,  338,  338,  338,  338,  338,  338,  338,  338,  341,

			  341,  341,  341,  341,  341,  341,  419,  419,  419,  449,
			  341,  341,  341,  341,  341,  341,  341,  341,  342,  342,
			  342,  125,  449,  449,  342,  342,  342,  342,  342,  342,
			  342,  433,  433,  433,  342,  342,  342,  342,  342,  342,
			  342,  342,  342,  347,  347,  347,  125,  449,  449,  347,
			  347,  347,  347,  347,  347,  347,  430,  430,  430,  347,
			  347,  347,  347,  347,  347,  347,  347,  347,  351,  351,
			  351,  383,  449,  449,  351,  351,  351,  351,  351,  351,
			  351,  441,  441,  441,  351,  351,  351,  351,  351,  351,
			  351,  351,  351,  354,  354,  354,  418,  449,  449,  354, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_nxt_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  354,  354,  354,  354,  354,  354,  441,  441,  441,  354,
			  354,  354,  354,  354,  354,  354,  354,  354,  362,  362,
			  362,  125,  449,  449,  362,  362,  362,  362,  362,  362,
			  362,  445,  445,  445,  362,  362,  362,  362,  362,  362,
			  362,  362,  362,  367,  368,  368,  424,  449,  449,  210,
			  210,  210,  210,  210,  210,  210,  449,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,   59,  294,
			   59,   59,  378,  378,  378,  449,  449,  373,  438,  361,
			  361,  361,  375,  375,  375,  375,  375,  375,  375,  445,
			  445,  445,  449,  375,  375,  375,  375,  375,  375,  375,

			  375,  377,  377,  377,  377,  377,  377,  377,  449,  445,
			  445,  445,  377,  377,  377,  377,  377,  377,  377,  377,
			  358,  449,  371,  371,  371,  449,  449,   59,  449,   59,
			   59,  382,  446,  374,  374,  374,  449,  379,  381,  381,
			  381,   59,  449,   59,   59,  449,  449,  449,  383,  384,
			  384,  384,  394,  394,  394,  384,  384,  384,  384,  384,
			  384,  384,  448,  448,  448,  384,  384,  384,  384,  384,
			  384,  384,  384,  384,  386,  386,  386,  415,  449,  449,
			  386,  386,  386,  386,  386,  386,  386,  449,  449,  449,
			  386,  386,  386,  386,  386,  386,  386,  386,  386,   59, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_nxt_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  449,   59,   59,  395,  449,  388,  388,  388,  387,  449,
			  381,  381,  381,  396,  396,  396,  449,  449,  449,  396,
			  396,  396,  396,  396,  396,  396,  449,  449,  449,  396,
			  396,  396,  396,  396,  396,  396,  396,  396,  400,  400,
			  400,  449,  449,  449,  400,  400,  400,  400,  400,  400,
			  400,  449,  449,  449,  400,  400,  400,  400,  400,  400,
			  400,  400,  400,   59,  449,   59,   59,  449,  449,  402,
			   59,  403,   59,   59,  394,  394,  394,  449,  449,  449,
			  449,  409,  409,  409,  412,  449,  413,  449,  449,  404,
			  404,  404,  414,  449,  405,  405,  405,  417,  449,  408,

			  408,  408,  449,  449,  410,   59,  449,   59,   59,  415,
			   59,  449,   59,   59,  418,  449,  409,  409,  409,  449,
			  449,  409,  409,  409,  419,  419,  419,  423,  449,  416,
			  416,  416,  427,  449,  422,  422,  422,  449,  429,  125,
			  425,  425,  425,  449,  424,  449,  432,  420,  428,  428,
			  428,  412,  449,  434,  449,  125,  431,  431,  431,  436,
			  449,  437,  449,  449,  433,  433,  433,  439,  449,  440,
			  449,  449,  435,  435,  435,  441,  441,  441,  449,  125,
			   91,   91,   91,   91,  449,  449,  107,   91,  449,  107,
			  125,  107,  449,  107,  107,  449,  449,  449,  442,   27, yy_Dummy>>,
			1, 200, 2400)
		end

	yy_nxt_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   27,   27,   27,   27,   27,   27,   27,   27,   27,   27,
			   27,   27,   27,   27,   27,   37,   37,   37,   37,   37,
			   37,   37,   37,   37,   37,   37,   37,   37,   37,   37,
			   37,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   58,  449,   58,
			   58,  449,   58,   58,   58,   58,   58,  449,   58,   58,
			   58,   58,   58,   63,  449,   63,   63,   63,   63,   63,
			   63,   63,   63,   63,  449,   63,   63,   63,   63,   77,
			   77,   77,   77,  449,   77,   77,   77,   77,   77,  449,
			   77,   77,   77,   77,   77,   92,  449,   92,   92,   92,

			   92,   92,   92,   92,   92,   92,  449,   92,   92,   92,
			   92,  102,  449,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  449,  102,  102,  102,  102,  109,  230,  230,
			  109,  449,  449,  230,  449,  109,  109,  449,  449,  449,
			  109,  109,   66,   66,   66,   66,   66,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,   66,   66,   68,  449,
			  449,   68,   68,   68,   68,   68,   68,   68,  449,   68,
			   68,   68,   68,   68,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104, yy_Dummy>>,
			1, 200, 2600)
		end

	yy_nxt_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  104,  104,  104,  104,  104,  104,  118,  118,  118,  118,
			  118,  118,  118,  118,  118,  118,  118,  118,  118,  118,
			  118,  118,  126,  449,  449,  126,  126,  126,  126,  126,
			  126,  126,  126,  126,  126,  126,  126,  126,  129,  129,
			  129,  129,  129,  129,  129,  129,  129,  449,  129,  129,
			  129,  139,  139,  139,  139,  139,  139,  139,  139,  139,
			  139,  139,  139,  139,  139,  139,  139,  156,  295,  295,
			  156,  449,  156,  295,  156,  156,  189,  449,  189,  189,
			  189,  189,  189,  189,  189,  189,  189,  449,  189,  189,
			  189,  189,  194,  194,  194,  194,  194,  194,  194,  194,

			  194,  194,  194,  194,  194,  194,  194,  194,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  328,  328,  329,  329,  449,  328,
			  449,  329,  353,  353,  365,  365,  449,  353,  449,  365,
			  391,  391,  406,  406,  449,  391,  449,  406,   13, yy_Dummy>>,
			1, 149, 2800)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 2995)
			an_array.put (0, 0)
			an_array.area.fill_with (1, 1, 47)
			yy_chk_template_1 (an_array)
			an_array.area.fill_with (5, 142, 188)
			yy_chk_template_2 (an_array)
			an_array.area.fill_with (11, 347, 393)
			yy_chk_template_3 (an_array)
			an_array.area.fill_with (70, 552, 595)
			yy_chk_template_4 (an_array)
			an_array.area.fill_with (90, 739, 785)
			yy_chk_template_5 (an_array)
			yy_chk_template_6 (an_array)
			yy_chk_template_7 (an_array)
			yy_chk_template_8 (an_array)
			yy_chk_template_9 (an_array)
			yy_chk_template_10 (an_array)
			yy_chk_template_11 (an_array)
			yy_chk_template_12 (an_array)
			yy_chk_template_13 (an_array)
			yy_chk_template_14 (an_array)
			yy_chk_template_15 (an_array)
			an_array.area.fill_with (449, 2948, 2995)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    2,   17,    2,    2,   14,   40,   14,   14,  483,   67,
			   67,    2,    2,    2,   42,   67,  147,    2,    2,    2,
			    2,    2,    2,    2,  265,   17,   40,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    3,    3,    3,    3,
			   65,  265,  322,    3,    3,   15,   15,   15,   15,  322,
			   42,    3,  147,   15,   16,   16,   16,   16,   19,   74,
			   19,   19,    3,   74,    3,    4,    4,    4,    4,   65,
			  480,  131,    4,    4,   18,  154,   18,   18,  154,  154,
			    4,  479,   18,  131,   22,   22,   22,   22,   88,   88,
			   88,    4,   22,    4, yy_Dummy>>,
			1, 94, 48)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    7,   41,  447,    7,   23,   23,   23,   23,   28,   28,
			   28,   28,  323,  323,   38,   28,   38,   38,   33,   33,
			   33,   33,   43,   28,    7,   33,   44,   49,  440,   45,
			   49,  149,  437,   33,   49,   41,   41,   41,  437,  179,
			    7,    7,    7,    7,    7,    8,   50,   51,    8,   50,
			   51,  179,  103,  421,   51,  103,   43,   43,   43,  103,
			  415,   44,   44,   45,   45,   45,  149,  149,   58,    8,
			   58,   58,   59,   51,   59,   59,   50,   61,   61,   61,
			   61,   94,   50,   94,   94,    8,    8,    8,    8,    8,
			    9,   98,  393,  105,    9,    9,  105,    9,    9,    9,

			  105,  393,    9,   60,   60,   60,   60,  337,  337,   69,
			    9,   60,   69,   66,   66,   66,   66,   66,   77,   77,
			   77,   77,  288,    9,   10,   98,   98,   98,   10,   10,
			  298,   10,   10,   10,  288,   69,   10,   66,   78,   78,
			   78,   78,  298,  413,   10,   69,   78,   79,   79,   79,
			   79,   81,   81,   81,   81,  347,  347,   10, yy_Dummy>>,
			1, 158, 189)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   20,  399,   20,   20,   84,   84,   80,   80,   80,   80,
			   84,   20,   20,   20,   80,  362,  362,   20,   20,   20,
			   20,   20,   20,   20,  143,  143,  143,   20,   20,   20,
			   20,   20,   20,   20,   20,   20,   21,  384,  384,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			  365,   21,  357,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   24,   24,   24,   24,  354,   24,   24,
			   24,   24,   24,   24,   24,   24,   24,   24,   24,   24,

			   24,   24,   24,   24,   24,   24,   24,  353,   24,   24,
			   24,   24,   24,   24,   24,   24,   24,   24,   24,   24,
			   24,   24,   24,   24,   24,   24,   24,   24,   24,   24,
			   25,   25,   25,  164,  164,  164,   25,   25,   25,   25,
			   25,   25,   25,  187,  187,  187,   25,   25,   25,   25,
			   25,   25,   25,   25,   25,   70,  386,  386, yy_Dummy>>,
			1, 158, 394)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   71,  391,  391,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,  351,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   72,  107,  350,
			   72,  107,   99,  342,   72,  107,  134,  134,   72,   72,
			   72,  328,  134,  319,   72,   72,   72,   72,   72,   72,
			   72,  188,  188,  188,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   73,   73,   73,   99,   99,   99,   73,
			   73,   73,   73,   73,   73,   73,  396,  396,   97,   73,

			   73,   73,   73,   73,   73,   73,   73,   73,   85,   85,
			   86,   86,   86,   86,   85,  317,  313,   86,  120,  120,
			  120,  120,   85,  160,  160,   86,  160,   89,   89,   89,
			   89,  160,  317,   85,   89,   97,   97,   97,   97,   97,
			  400,  400,   89, yy_Dummy>>,
			1, 143, 596)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  100,  106,  168,  101,  106,  108,  109,  168,  108,  109,
			  106,  346,  106,  106,  106,  312,  113,  106,  112,  113,
			  109,  112,  309,  114,  114,  112,  114,  127,  346,  306,
			  114,  114,  146,  127,  100,  100,  100,  101,  101,  101,
			  119,  108,  109,  124,  112,  124,  124,  119,  119,  119,
			  304,  127,  113,  122,  122,  122,  293,  124,  290,  122,
			  122,  122,  122,  122,  122,  122,  146,  146,  146,  122,
			  122,  122,  122,  122,  122,  122,  122,  122,  123,  123,
			  123,  196,  196,  196,  123,  123,  123,  123,  123,  123,
			  123,  215,  215,  215,  123,  123,  123,  123,  123,  123,

			  123,  123,  123,  126,  128,  137,  137,  126,  128,  130,
			  132,  137,  280,  132,  368,  130,  368,  132,  135,  135,
			  213,  135,  135,  135,  135,  213,  137,  126,  128,  126,
			  128,  368,  211,  130,  130,  211,  132,  278,  130,  133,
			  136,  136,  133,  136,  136,  136,  136,  221,  221,  221,
			  133,  133,  133,  229,  229,  229,  133,  133,  133,  133,
			  133,  133,  133,  268,  148,  133,  133,  133,  133,  133,
			  133,  133,  133,  133,  133,  138,  264,  138,  138,  139,
			  139,  139,  139,  139,  140,  140,  248,  166,  244,  142,
			  140,  142,  142,  142,  166,  166,  166,  140,  148,  148, yy_Dummy>>,
			1, 200, 786)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  148,  236,  150,  139,  241,  151,  236,  140,  144,  144,
			  152,  144,  144,  144,  233,  233,  233,  144,  144,  144,
			  144,  144,  144,  144,  234,  234,  234,  144,  144,  144,
			  144,  144,  144,  144,  144,  144,  150,  150,  150,  151,
			  151,  151,  406,  406,  152,  152,  152,  153,  156,  249,
			  153,  156,  249,  165,  153,  156,  162,  162,  165,  162,
			  165,  165,  165,  370,  162,  169,  173,  169,  169,  267,
			  267,  267,  173,  173,  173,  173,  185,  185,  185,  185,
			  370,  240,  169,  169,  169,  169,  169,  169,  169,  255,
			  173,  255,  255,  169,  169,  169,  169,  169,  169,  169,

			  169,  174,  209,  380,  232,  209,  231,  174,  174,  174,
			  174,  181,  181,  230,  181,  181,  181,  181,  183,  183,
			  380,  183,  183,  183,  183,  174,  175,  227,  209,  175,
			  175,  175,  175,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,  175,  175,  175,  175,  175,  175,  175,  175,
			  212,  175,  175,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,  175,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,  175,  176,  443,  194,  176,  443,  180,  180,
			  176,  180,  180,  180,  180,  184,  184,  210,  261,  261,
			  210,  184,  186,  186,  261,  193,  180,  191,  186,  176, yy_Dummy>>,
			1, 200, 986)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  177,  177,  177,  186,  189,  184,  177,  177,  177,  177,
			  177,  177,  177,  210,  186,  172,  177,  177,  177,  177,
			  177,  177,  177,  177,  177,  178,  178,  178,  287,  287,
			  287,  178,  178,  178,  178,  178,  178,  178,  300,  300,
			  300,  178,  178,  178,  178,  178,  178,  178,  178,  178,
			  182,  314,  182,  182,  171,  252,  314,  182,  182,  182,
			  252,  182,  182,  182,  182,  195,  198,  195,  195,  195,
			  199,  170,  252,  198,  198,  198,  182,  199,  199,  199,
			  167,  163,  195,  200,  200,  200,  200,  200,  200,  200,
			  318,  158,  157,  318,  200,  200,  200,  200,  200,  200,

			  200,  200,  201,  201,  201,  358,  358,  358,  201,  201,
			  201,  201,  201,  201,  201,  129,  318,  118,  201,  201,
			  201,  201,  201,  201,  201,  201,  201,  205,  359,  359,
			  359,  206,  205,  205,  205,  205,  205,  206,  206,  206,
			  206,  207,  320,  320,  320,  320,  207,  207,  207,  207,
			  207,  205,  208,  378,  378,  206,  283,  283,  208,  208,
			  208,  208,  283,  216,  216,  207,  216,  216,  216,  216,
			  228,  378,  228,  228,  228,  117,  208,  214,  214,  214,
			  214,  214,  214,  214,  363,  363,  363,  110,  214,  214,
			  214,  214,  214,  214,  214,  214,  218,  104,  218,  218, yy_Dummy>>,
			1, 200, 1186)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  295,  295,  219,  218,  219,  219,  295,  222,  222,  219,
			  222,  222,  222,  222,  223,  223,  329,  223,  223,  223,
			  223,  329,  218,  220,  102,  220,  220,  225,  225,  237,
			  372,  372,  372,  225,  237,   92,  237,  237,  237,   87,
			  220,  220,  220,  220,  220,  220,  220,   76,   75,  225,
			   68,  220,  220,  220,  220,  220,  220,  220,  220,  226,
			  226,  238,  334,  334,  334,  226,   63,   62,  238,  238,
			  238,  253,  226,  253,  253,  253,  253,  334,   57,   54,
			  281,  281,  226,  239,  239,  239,  281,   48,  253,  239,
			  239,  239,  239,  239,  239,  239,   47,   37,  281,  239,

			  239,  239,  239,  239,  239,  239,  239,  239,  242,   34,
			  302,   31,  243,  302,  242,  242,  242,  242,  243,  243,
			  243,  243,  245,  382,  382,  382,   29,   26,  245,  245,
			  245,  245,  242,  246,   13,    0,  243,    0,  302,  246,
			  246,  246,  246,  247,    0,    0,  245,  289,  289,  247,
			  247,  247,  247,  289,    0,  254,  254,  246,  254,  254,
			  254,  254,  289,  395,  395,  395,    0,  247,  250,  250,
			  250,  250,  250,  250,  250,  397,  397,  397,    0,  250,
			  250,  250,  250,  250,  250,  250,  250,  251,  251,    0,
			  251,  251,  251,  407,  407,  407,  251,  251,  251,  251, yy_Dummy>>,
			1, 200, 1386)
		end

	yy_chk_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  251,  251,  251,    0,    0,  251,  251,  251,  251,  251,
			  251,  251,  251,  251,  251,  256,  316,  316,    0,  256,
			  256,  256,  316,    0,    0,  256,  256,  256,  256,  256,
			  256,  256,    0,    0,  256,  256,  256,  256,  256,  256,
			  256,  256,  256,  256,  257,  333,  257,  257,  333,  333,
			  333,  257,  411,  257,  411,  411,  259,  259,  257,  259,
			  259,  259,  259,  260,  260,    0,  260,  260,  260,  260,
			  257,  258,  344,  258,  258,  344,  344,  344,  258,    0,
			  258,  411,  258,  258,  258,  258,  262,  262,  414,  414,
			  414,  266,  262,  266,  266,  266,  262,  258,  270,    0,

			    0,  274,    0,  270,  270,  271,  274,  274,  266,  272,
			  271,  271,  271,  271,  271,  272,  272,  272,  272,    0,
			    0,  284,  270,  284,  284,  274,  461,  461,  284,  271,
			  275,  461,    0,  272,  276,  275,  275,  275,  275,  275,
			  276,  276,  276,  276,  277,    0,  475,  284,  475,  475,
			  277,  277,  277,  277,  275,  475,    0,  286,  276,  286,
			  286,  286,    0,  336,    0,  336,  336,    0,  277,  279,
			  279,  279,    0,    0,  286,  279,  279,  279,  279,  279,
			  279,  279,  423,  423,  423,  279,  279,  279,  279,  279,
			  279,  279,  279,  279,  285,  292,  285,  285,  336,    0, yy_Dummy>>,
			1, 200, 1586)
		end

	yy_chk_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  292,  292,    0,  343,  343,    0,  343,  343,  343,    0,
			    0,  285,  285,  285,  285,  285,  285,  285,    0,  292,
			  285,  343,  285,  285,  285,  285,  285,  285,  285,  285,
			  291,  291,  291,  291,  291,  291,  291,    0,  390,  390,
			  390,  291,  291,  291,  291,  291,  291,  291,  291,  294,
			  294,  294,  426,  426,  426,  294,  294,  294,  294,  294,
			  294,  294,  390,    0,    0,  294,  294,  294,  294,  294,
			  294,  294,  294,  294,  296,  296,  296,  427,  427,  427,
			  296,  296,  296,  296,  296,  296,  296,    0,    0,  296,
			  296,  296,  296,  296,  296,  296,  296,  296,  296,  297,

			  297,  297,  432,  432,  432,  297,  297,  297,  297,  297,
			  297,  297,  401,  401,  401,  297,  297,  297,  297,  297,
			  297,  297,  297,  297,  299,  299,  299,  401,    0,    0,
			  299,  299,  299,  299,  299,  299,  299,  444,  444,  444,
			  299,  299,  299,  299,  299,  299,  299,  299,  299,  303,
			  303,  303,  303,  307,  417,  417,  417,  303,  303,  307,
			  307,  307,  307,  303,  305,  305,  305,    0,    0,  417,
			  305,  305,  305,  305,  305,  305,  305,  307,    0,    0,
			  305,  305,  305,  305,  305,  305,  305,  305,  305,  308,
			  308,  308,  308,  308,  308,  308,  403,    0,  403,  403, yy_Dummy>>,
			1, 200, 1786)
		end

	yy_chk_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  308,  308,  308,  308,  308,  308,  308,  308,  315,  315,
			  315,  315,  315,  315,  315,    0,    0,  315,    0,  315,
			  315,  315,  315,  315,  315,  315,  315,  325,  403,  419,
			  419,  419,  325,  325,  325,  325,  325,    0,  345,    0,
			  345,  345,  345,  356,  419,    0,  356,  356,  356,    0,
			    0,  325,  326,  326,  326,  345,    0,    0,  326,  326,
			  326,  326,  326,  326,  326,  438,  438,  438,  326,  326,
			  326,  326,  326,  326,  326,  326,  326,  327,    0,  348,
			  327,  348,  348,  438,  367,    0,  367,  367,  367,    0,
			  348,  348,  348,    0,  327,  327,  327,  327,  327,  327,

			  327,  367,    0,  327,    0,  327,  327,  327,  327,  327,
			  327,  327,  327,  331,  331,  331,  331,  331,  331,  331,
			  420,  420,  420,    0,  331,  331,  331,  331,  331,  331,
			  331,  331,  332,  332,  332,  420,    0,    0,  332,  332,
			  332,  332,  332,  332,  332,  429,  429,  429,  332,  332,
			  332,  332,  332,  332,  332,  332,  332,  335,  335,  335,
			  429,    0,    0,  335,  335,  335,  335,  335,  335,  335,
			  430,  430,  430,  335,  335,  335,  335,  335,  335,  335,
			  335,  335,  338,  338,  338,  430,    0,    0,  338,  338,
			  338,  338,  338,  338,  338,  441,  441,  441,  338,  338, yy_Dummy>>,
			1, 200, 1986)
		end

	yy_chk_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  338,  338,  338,  338,  338,  338,  338,  341,  341,  341,
			  441,    0,    0,  341,  341,  341,  341,  341,  341,  341,
			  442,  442,  442,  341,  341,  341,  341,  341,  341,  341,
			  341,  341,  349,  349,  349,  442,    0,    0,  349,  349,
			  349,  349,  349,  349,  349,  445,  445,  445,  349,  349,
			  349,  349,  349,  349,  349,  349,  349,  355,  355,  355,
			  445,    0,    0,  355,  355,  355,  355,  355,  355,  355,
			    0,  434,  434,  434,  355,  355,  355,  355,  355,  355,
			  355,  355,  361,  369,  361,  361,  369,  369,  369,    0,
			    0,  361,  434,  361,  361,  361,  364,  364,  364,  364,

			  364,  364,  364,  446,  446,  446,    0,  364,  364,  364,
			  364,  364,  364,  364,  364,  366,  366,  366,  366,  366,
			  366,  366,    0,  439,  439,  439,  366,  366,  366,  366,
			  366,  366,  366,  366,  371,    0,  371,  371,  371,    0,
			    0,  373,    0,  373,  373,  374,  439,  374,  374,  374,
			    0,  371,  373,  373,  373,  387,    0,  387,  387,    0,
			    0,    0,  374,  375,  375,  375,  387,  387,  387,  375,
			  375,  375,  375,  375,  375,  375,  448,  448,  448,  375,
			  375,  375,  375,  375,  375,  375,  375,  375,  377,  377,
			  377,  448,    0,    0,  377,  377,  377,  377,  377,  377, yy_Dummy>>,
			1, 200, 2186)
		end

	yy_chk_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  377,    0,    0,    0,  377,  377,  377,  377,  377,  377,
			  377,  377,  377,  381,    0,  381,  381,  388,    0,  388,
			  388,  388,  381,    0,  381,  381,  381,  389,  389,  389,
			    0,    0,    0,  389,  389,  389,  389,  389,  389,  389,
			    0,    0,    0,  389,  389,  389,  389,  389,  389,  389,
			  389,  389,  392,  392,  392,    0,    0,    0,  392,  392,
			  392,  392,  392,  392,  392,    0,    0,    0,  392,  392,
			  392,  392,  392,  392,  392,  392,  392,  394,    0,  394,
			  394,    0,    0,  394,  402,  394,  402,  402,  394,  394,
			  394,    0,    0,    0,    0,  402,  402,  402,  404,    0,

			  404,    0,    0,  404,  404,  404,  405,    0,  405,  405,
			  405,  408,    0,  408,  408,  408,    0,    0,  402,  409,
			    0,  409,  409,  405,  410,    0,  410,  410,  408,    0,
			  409,  409,  409,    0,    0,  410,  410,  410,  412,  412,
			  412,  416,    0,  416,  416,  416,  422,    0,  422,  422,
			  422,    0,  425,  412,  425,  425,  425,    0,  416,    0,
			  428,  412,  428,  428,  428,  431,    0,  431,    0,  425,
			  431,  431,  431,  433,    0,  433,    0,    0,  433,  433,
			  433,  435,    0,  435,    0,    0,  435,  435,  435,  436,
			  436,  436,    0,  433,  456,  456,  456,  456,    0,    0, yy_Dummy>>,
			1, 200, 2386)
		end

	yy_chk_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  459,  456,    0,  459,  436,  459,    0,  459,  459,    0,
			    0,    0,  436,  450,  450,  450,  450,  450,  450,  450,
			  450,  450,  450,  450,  450,  450,  450,  450,  450,  451,
			  451,  451,  451,  451,  451,  451,  451,  451,  451,  451,
			  451,  451,  451,  451,  451,  452,  452,  452,  452,  452,
			  452,  452,  452,  452,  452,  452,  452,  452,  452,  452,
			  452,  453,    0,  453,  453,    0,  453,  453,  453,  453,
			  453,    0,  453,  453,  453,  453,  453,  454,    0,  454,
			  454,  454,  454,  454,  454,  454,  454,  454,    0,  454,
			  454,  454,  454,  455,  455,  455,  455,    0,  455,  455,

			  455,  455,  455,    0,  455,  455,  455,  455,  455,  457,
			    0,  457,  457,  457,  457,  457,  457,  457,  457,  457,
			    0,  457,  457,  457,  457,  458,    0,  458,  458,  458,
			  458,  458,  458,  458,  458,  458,    0,  458,  458,  458,
			  458,  460,  472,  472,  460,    0,    0,  472,    0,  460,
			  460,    0,    0,    0,  460,  460,  462,  462,  462,  462,
			  462,  462,  462,  462,  462,  462,  462,  462,  462,  462,
			  462,  462,  463,    0,    0,  463,  463,  463,  463,  463,
			  463,  463,    0,  463,  463,  463,  463,  463,  464,  464,
			  464,  464,  464,  464,  464,  464,  464,  464,  464,  464, yy_Dummy>>,
			1, 200, 2586)
		end

	yy_chk_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  464,  464,  464,  464,  465,  465,  465,  465,  465,  465,
			  465,  465,  465,  465,  465,  465,  465,  465,  465,  465,
			  466,  466,  466,  466,  466,  466,  466,  466,  466,  466,
			  466,  466,  466,  466,  466,  466,  467,    0,    0,  467,
			  467,  467,  467,  467,  467,  467,  467,  467,  467,  467,
			  467,  467,  468,  468,  468,  468,  468,  468,  468,  468,
			  468,    0,  468,  468,  468,  469,  469,  469,  469,  469,
			  469,  469,  469,  469,  469,  469,  469,  469,  469,  469,
			  469,  470,  476,  476,  470,    0,  470,  476,  470,  470,
			  471,    0,  471,  471,  471,  471,  471,  471,  471,  471,

			  471,    0,  471,  471,  471,  471,  473,  473,  473,  473,
			  473,  473,  473,  473,  473,  473,  473,  473,  473,  473,
			  473,  473,  474,  474,  474,  474,  474,  474,  474,  474,
			  474,  474,  474,  474,  474,  474,  474,  474,  477,  477,
			  478,  478,    0,  477,    0,  478,  481,  481,  482,  482,
			    0,  481,    0,  482,  484,  484,  485,  485,    0,  484,
			    0,  485, yy_Dummy>>,
			1, 162, 2786)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 485)
			yy_base_template_1 (an_array)
			yy_base_template_2 (an_array)
			yy_base_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_base_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,   47,   83,  112,  141,    0,  187,  232,  274,
			  308,  346,    0, 1520,   51,   92,  101,   44,  121,  105,
			  393,  429,  131,  192,  476,  512, 1492, 2948,  196, 1503,
			 2948, 1463, 2948,  206, 1486,    0, 2948, 1478,  202, 2948,
			   48,  185,   57,  206,  210,  213, 2948, 1477, 1464,  215,
			  234,  235, 2948, 2948, 1438, 2948,    0, 1435,  256,  260,
			  291,  265, 1444, 1447, 2948,   83,  301,   48, 1409,  297,
			  548,  595,  642,  667,   77, 1402, 1406,  306,  326,  335,
			  399,  339, 2948,    0,  389,  695,  705, 1423,  124,  722,
			  738,    0, 1416, 2948,  269, 2948, 2948,  689,  275,  643,

			  781,  784, 1405,  240, 1381,  281,  786,  643,  790,  791,
			 1341, 2948,  803,  801,  808, 2948,    0, 1327, 1301,  821,
			  713, 2948,  827,  852,  828, 2948,  888,  808,  889, 1296,
			  890,  104,  895,  924,  643,  895,  917,  882,  960,  964,
			  961, 2948,  965,  406,  985, 2948,  813,   59,  945,  215,
			  983,  986,  991, 1032,  122, 2948, 1033, 1263, 1247, 2948,
			  718, 2948, 1041, 1258,  515, 1034,  968, 1257,  778, 1050,
			 1230, 1213, 1174, 1047, 1082, 1111, 1158, 1174, 1199,  213,
			 1155, 1088, 1235, 1095, 1162, 1061, 1169,  525,  655, 1185,
			    0, 1154, 2948, 1172, 1159, 1241,  855, 2948, 1247, 1251, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1251, 1276, 2948, 2948, 2948, 1308, 1312, 1322, 1333, 1087,
			 1172,  917, 1127,  896, 1345,  865, 1340, 2948, 1381, 1387,
			 1408,  921, 1384, 1391, 2948, 1404, 1436, 1103, 1346,  927,
			 1072, 1061, 1088,  988,  998, 2948,  982, 1410, 1442, 1457,
			 1058,  963, 1489, 1493,  947, 1503, 1514, 1524,  945, 1034,
			 1536, 1564, 1231, 1447, 1532, 1074, 1593, 1629, 1656, 1633,
			 1640, 1165, 1663, 2948,  947,   62, 1667, 1043,  939, 2948,
			 1679, 1686, 1690, 2948, 1682, 1711, 1715, 1725,  896, 1743,
			  889, 1457,    0, 1333, 1706, 1779, 1733, 1202,  296, 1524,
			  829, 1798, 1776,  832, 1823, 1377, 1848, 1873,  304, 1898,

			 1212, 2948, 1495, 1934,  807, 1938,  788, 1934, 1957,  799,
			    0,    0,  786,  703, 1227, 1976, 1593,  701, 1275,  625,
			 1327, 2948,   63,  192, 2948, 2008, 2026, 2062,  648, 1392,
			    0, 2081, 2106, 1622, 1436, 2131, 1748,  287, 2156,    0,
			    0, 2181,  640, 1780, 1649, 2014,  787,  335, 2064, 2206,
			  609,  610,    0,  492,  471, 2231, 2020,  429, 1279, 1302,
			 2948, 2267,  400, 1358, 2264,  444, 2283, 2060,  890, 2260,
			 1039, 2310, 1404, 2326, 2321, 2337,    0, 2362, 1330, 2948,
			 1079, 2398, 1497, 2948,  422,    0,  541, 2340, 2393, 2401,
			 1812,  588, 2426,  254, 2462, 1537,  683, 1549,    0,  359, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  727, 1886, 2469, 1981, 2477, 2482, 1019, 1567, 2487, 2504,
			 2509, 1637, 2512,  299, 1662,  222, 2517, 1928, 2948, 2003,
			 2094,  212, 2522, 1756, 2948, 2528, 1826, 1851, 2536, 2119,
			 2144, 2544, 1876, 2552, 2245, 2560, 2563,  194, 2039, 2297,
			  184, 2169, 2194, 1133, 1911, 2219, 2277,  161, 2350, 2948,
			 2598, 2614, 2630, 2646, 2662, 2678, 2573, 2694, 2710, 2585,
			 2726, 1703, 2741, 2757, 2773, 2789, 2805, 2821, 2834, 2850,
			 2866, 2875, 2719, 2891, 2907, 1731, 2859, 2915, 2917,  119,
			  108, 2923, 2925,   46, 2931, 2933, yy_Dummy>>,
			1, 86, 400)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 485)
			yy_def_template_1 (an_array)
			yy_def_template_2 (an_array)
			yy_def_template_3 (an_array)
			an_array.area.fill_with (449, 450, 485)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			    0,  449,    1,  450,  450,  449,    5,  451,  451,  452,
			  452,  449,   11,  449,  453,  449,  449,  454,  453,  453,
			  453,  449,  455,  455,  449,   24,   25,  449,  449,  449,
			  449,  449,  449,  449,  456,  456,  449,  457,  449,  449,
			  449,  457,  457,  457,  457,  457,  449,  458,  449,  459,
			  460,  449,  449,  449,  449,  449,  461,  449,  453,  449,
			  449,  449,  449,  454,  449,  454,  462,   20,  463,  463,
			  449,  449,   71,   72,   73,   73,  463,  455,  455,  455,
			  455,  449,  449,   24,   25,   25,  449,  464,  449,  449,
			  449,  456,  457,  449,  449,  449,  449,  457,  457,  457,

			  457,  457,  458,  449,  465,  449,  449,  459,  449,  460,
			  109,  449,  449,  449,  449,  449,  461,  449,  466,  454,
			  466,  449,   20,  122,  453,  449,  467,   70,  467,  468,
			   70,  463,  463,  463,   73,   73,   73,   73,  449,  469,
			   25,  449,  449,  449,   90,  449,  457,  457,  457,  457,
			  457,  457,  457,  449,  449,  449,  470,  449,  109,  449,
			  449,  449,  449,  449,  449,  454,  454,  122,  123,  453,
			  463,  463,  449,   70,   70,  449,  133,   71,  177,  463,
			   73,   73,   73,   73,   73,  466,   25,  449,  449,  471,
			  472,  109,  449,  449,  473,  449,  449,  449,  454,  454, yy_Dummy>>,
			1, 200, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  169,  200,  449,  449,  449,   70,   70,   70,   70,  463,
			  175,  449,  177,  178,  175,  178,   73,  449,  463,  449,
			  133,  178,   73,   73,  449,   73,   25,  449,  449,  449,
			  472,  109,  474,  449,  449,  449,  454,  454,  454,  201,
			  201,  463,   70,   70,  463,   70,   70,   70,  449,  449,
			   71,  463,  178,  178,   73,  475,  463,  178,  178,   73,
			   73,   73,   25,  449,  109,  449,  449,  449,  239,  449,
			   70,   70,   70,  449,   70,   70,   70,   70,  449,  178,
			  251,   73,  476,  256,  463,  463,  182,  182,  463,   25,
			  449,  200,   70,  279,  251,  476,  463,  296,  463,  297,

			  178,  449,  214,   25,  472,  291,  463,   70,  250,  294,
			  477,  478,  449,  296,  297,  463,  299,  258,  463,  251,
			  449,  449,  472,  305,  449,   70,  308,  214,  477,  478,
			  479,  315,  331,  251,  472,  305,  453,  326,  251,  480,
			  481,  332,  332,  251,  251,  334,  345,  335,  453,  326,
			   71,  338,  482,  481,  341,  327,  251,  449,  449,  334,
			  449,  453,  349,   71,  327,  482,  331,  355,  355,  251,
			  449,  449,  334,  453,   71,  251,  483,  366,  251,  449,
			  472,  453,   71,  449,  375,  484,  377,  453,   71,  375,
			  355,  484,  377,  463,  453,   71,  389,  355,  485,  449, yy_Dummy>>,
			1, 200, 200)
		end

	yy_def_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  392,  463,  453,  453,   71,  355,  485,  449,  463,  453,
			  453,  453,  463,   71,  355,  449,  449,  463,  449,  463,
			  463,   71,  355,  449,  449,  463,   71,  355,  449,  463,
			   71,  355,  449,  463,  355,  449,  463,  463,  355,  449,
			  449,  463,  463,  463,  355,  449,  449,  449,  355,    0, yy_Dummy>>,
			1, 50, 400)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 257)
			yy_ec_template_1 (an_array)
			an_array.area.fill_with (41, 160, 191)
			an_array.area.fill_with (47, 192, 193)
			an_array.area.fill_with (42, 194, 223)
			yy_ec_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    0,   47,   47,   47,   47,   47,   47,   47,   47,    1,
			    2,   47,   47,    3,   47,   47,   47,   47,   47,   47,
			   47,   47,   47,   47,   47,   47,   47,   47,   47,   47,
			   47,   47,    4,   47,    5,   47,   47,   47,   47,   47,
			    6,    6,   47,    7,    8,    9,   10,   11,   12,   13,
			   14,   14,   14,   14,   14,   14,   14,   14,   15,   16,
			   17,   17,   17,   47,   47,   18,   18,   18,   18,   18,
			   18,   19,   18,   18,   18,   18,   20,   18,   21,   22,
			   18,   18,   18,   18,   23,   18,   18,   18,   18,   24,
			   18,   25,   26,   27,   47,   28,   47,   29,   18,   30,

			   18,   18,   18,   19,   18,   18,   18,   18,   31,   18,
			   21,   32,   18,   18,   33,   18,   34,   35,   36,   18,
			   18,   24,   18,   37,   17,   38,   47,   47,   39,   39,
			   39,   39,   39,   39,   39,   39,   39,   39,   39,   39,
			   39,   39,   39,   39,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40, yy_Dummy>>,
			1, 160, 0)
		end

	yy_ec_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			   43,   44,   44,   44,   44,   44,   44,   44,   44,   44,
			   44,   44,   44,   44,   44,   44,   45,   46,   46,   46,
			   46,   46,   46,   46,   47,   47,   47,   47,   47,   47,
			   47,   47,   47,   47, yy_Dummy>>,
			1, 34, 224)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    3,    4,    5,   16,   16,    6,    7,
			    8,   16,    9,    9,    9,   16,   16,    6,   10,   10,
			   10,   10,   10,   10,   10,   11,   12,   13,   14,   10,
			   10,   10,   10,   10,   10,   10,   10,   15,   16,   16,
			   16,   16,   16,   16,   16,   16,   16,   16, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 449)
			yy_accept_template_1 (an_array)
			yy_accept_template_2 (an_array)
			yy_accept_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_accept_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   65,   62,    1,    1,   53,   62,   40,
			   62,   63,    1,    1,   62,   62,   62,   31,   28,   31,
			   30,   31,   39,   36,   35,   35,   38,   57,   58,   59,
			   60,   57,   57,   57,   57,   57,   24,   24,   24,   17,
			   24,   24,   64,   45,   64,   44,   42,   64,   62,   62,
			    1,    1,    0,   53,   52,   53,   62,   62,    0,    0,
			    0,    0,    0,    0,    0,    0,   14,   61,    1,    1,
			   61,   62,    4,   62,   62,   62,   28,    0,    0,   36,
			   35,   35,   57,   59,   58,   55,   54,   56,   57,   57,

			   57,   57,    0,   15,    0,    0,    0,   17,    0,    0,
			    0,   21,    0,    0,    0,   46,   42,    0,    0,   53,
			   62,    2,   62,   62,   62,   49,    0,    0,   41,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,   61,   61,
			   62,   29,   27,    0,    0,   37,   57,   57,   57,   57,
			   57,   57,   57,    0,    0,   20,   17,    0,    0,   16,
			    0,   23,    0,    0,    0,   53,   53,   62,   62,   62,
			    0,    0,    0,    0,    0,   34,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,   61,   62,    0,    0,    0,
			    0,    0,   22,    0,    0,    0,    0,   51,   53,   53, yy_Dummy>>,
			1, 200, 0)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			   62,   62,   48,   47,   48,    0,    0,    0,    0,   34,
			   33,   13,    0,    0,   34,    0,    0,    8,    0,    0,
			    0,    0,    0,    0,    6,    0,   62,   27,   27,    0,
			    0,    0,    0,    0,    0,   43,   53,   53,   53,   62,
			   62,    0,    0,    0,    0,    0,    0,    0,   32,   13,
			    0,   33,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,   62,   19,    0,    0,    0,    0,   62,   12,
			    0,    0,    0,   11,    0,    0,    0,    0,   33,    0,
			   33,    0,    0,    0,    0,    0,    0,    0,    0,   62,
			    0,   62,    0,    0,   33,    0,    0,    0,    0,    0,

			    0,    5,   26,   62,    0,   62,    0,    0,    0,   33,
			    0,    0,    0,    0,    0,    0,    0,    0,   26,   33,
			   62,    3,    0,   62,   10,    0,    0,   33,    0,    0,
			    0,    0,    0,   33,    0,   62,   62,    0,   33,    0,
			    0,    0,    0,   33,   33,    0,    0,   62,   62,    0,
			    0,   33,    0,    0,    0,   33,   33,   25,    0,    0,
			   18,   50,    0,    0,   33,    0,    0,   33,   33,   33,
			    0,    0,    0,   62,    0,   33,    0,    0,   33,   18,
			    0,   62,    0,    9,   33,    0,    0,   62,    0,   33,
			   33,    0,    0,    0,   62,    0,   33,   33,    0,    0, yy_Dummy>>,
			1, 200, 200)
		end

	yy_accept_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,   62,   62,    0,   33,    0,    0,    0,   50,
			   62,   62,    0,    0,   33,    9,    0,    0,    7,    0,
			    0,    0,   33,    0,    7,    0,    0,   33,    0,    0,
			    0,   33,    0,    0,   33,    0,    0,    0,   33,    0,
			    0,    0,    0,    0,   33,    0,    0,    0,   33,    0, yy_Dummy>>,
			1, 50, 400)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 2948
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 449
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 450
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 47
			-- Equivalence code for NULL character

	yyMax_symbol_equiv_class: INTEGER = 256
			-- All symbols greater than this symbol will have
			-- the same equivalence class as this symbol

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

	yyNb_rules: INTEGER = 64
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 65
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
			parent_codes: ARRAYED_LIST[STRING]
		do
			if converted_codes.has (an_old_code) and then attached converted_codes.item (an_old_code) as nc then
				new_code := nc
			else
				new_code := adl_14_id_code_upgraded (an_old_code)
				converted_codes.put (new_code, an_old_code)

				-- check if the code is a specialised one, and obtain its specialisation parent codes; for each of
				-- them that is not in the converted_codes list, add them.
				if is_adl_14_refined_code (an_old_code) then
					parent_codes := specialised_adl14_code_parents (an_old_code)

					across parent_codes as code_csr loop
					    if not converted_codes.has (code_csr.item) then
							converted_codes.put (adl_14_id_code_upgraded (code_csr.item), code_csr.item)
						end
					end
				end
			end
			out_buffer.append (new_code)
		end

	output_new_value_code (an_old_code: STRING)
		local
			new_code: STRING
			parent_codes: ARRAYED_LIST [STRING]
		do
			if converted_codes.has (an_old_code) and then attached converted_codes.item (an_old_code) as nc then
				new_code := nc
			else
				new_code := adl_14_value_code_upgraded (an_old_code)
				converted_codes.put (new_code, an_old_code)

				-- check if the code is a specialised one, and obtain its specialisation parent codes; for each of
				-- them that is not in the converted_codes list, add them.
				if is_adl_14_refined_code (an_old_code) then
					parent_codes := specialised_adl14_code_parents (an_old_code)

					across parent_codes as code_csr loop
					    if not converted_codes.has (code_csr.item) then
							converted_codes.put (adl_14_value_code_upgraded (code_csr.item), code_csr.item)
						end
					end
				end
			end

			out_buffer.append (new_code)
		end

	output_new_value_set_code (an_old_code: STRING)
		local
			new_code: STRING
			parent_codes: ARRAYED_LIST [STRING]
		do
			if converted_codes.has (an_old_code) and then attached converted_codes.item (an_old_code) as nc then
				new_code := nc
			else
				new_code := adl_14_value_set_code_upgraded (an_old_code)
				converted_codes.put (new_code, an_old_code)

				-- check if the code is a specialised one, and obtain its specialisation parent codes; for each of
				-- them that is not in the converted_codes list, add them.
				if is_adl_14_refined_code (an_old_code) then
					parent_codes := specialised_adl14_code_parents (an_old_code)

					across parent_codes as code_csr loop
					    if not converted_codes.has (code_csr.item) then
							converted_codes.put (adl_14_value_set_code_upgraded (code_csr.item), code_csr.item)
						end
					end
				end
			end

			out_buffer.append (new_code)
		end

	output_converted_code_dt_key (an_old_code: STRING)
			-- code should exist in converted_codes list or else should be the parent code of an existing code, e.g.
			-- we get 'at0000' and the converted_codes list has 'at0000.1'.
			-- if neither, output an invalid code, which will cause later compilation to fail
		local
			new_code: STRING
		do
			out_buffer.append_character ('[')
			out_buffer.append_character ('"')
			if converted_codes.has (an_old_code) and then attached converted_codes.item (an_old_code) as nc then
				new_code := nc
			else
				new_code := an_old_code + " not found in definition"
			end
			out_buffer.append (new_code)
			out_buffer.append_character ('"')
			out_buffer.append_character (']')
		end

end
