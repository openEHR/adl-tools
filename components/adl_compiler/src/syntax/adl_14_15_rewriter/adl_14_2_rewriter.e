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
			create an_array.make_filled (0, 0, 2971)
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
			an_array.area.fill_with (449, 2925, 2971)
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
			   24,   24,   93,  124,  352,   25,   25,   25,   25,   26,
			   25,   25,  340,   65,   96,   24,   25,   25,   25,   26,
			   25,   25,   25,   25,   28,   28,   59,   28,   59,   59,
			   64,   28,   29,   60,   61,   61,   60,  446,   98,   28,

			   93,   62,   61,   61,   61,   61,   79,   61,   79,   79,
			   30,  447,   31,   28,   28,   59,   28,   59,   59,  119,
			   28,   29,  263,   66,   78,   61,   79,   78,   28,  334,
			  426,   94,   80,   94,   94,  100,  100,  249,  278,   30,
			  249,   31,   33,   33,   32,   33,   32,   32,   32,   33,
			   34,   35,   32,   35,   35,   35,   32,   33,   32,   35,
			   35,   35,   35,   35,   35,   35,   32,   32,   36,   35,
			   35,   35,   35,   35,   35,   35,   35,   35,   32,   32,
			   32,   32,   32,   32,   32,   32,   32,   32,   32,   38,
			   86,   86,   39,   86,  175,   89,   89,   86,   89,   93, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   69,  421,   89,   69,   93,   86,  125,   93,  407,  105,
			   89,   93,  105,   40,  108,  135,  106,  108,   59,  136,
			   59,   59,   59,  123,   59,   59,  125,  376,  124,   41,
			   42,   43,   44,   45,   38,   98,   76,   39,   97,   97,
			   97,   99,   99,   99,  110,  101,  101,  101,  278,  171,
			  111,  142,  143,  143,  112,  126,  154,  112,   40,  154,
			  189,  113,   60,   61,   61,   60,   61,   61,   61,   61,
			   62,  335,  336,  127,   41,   42,   43,   44,   45,   47,
			  114,  233,  153,   48,   49,  153,   49,   49,   49,  154,
			  366,   49,  120,  121,  120,  120,  118,  310,  235,   50,

			  138,  449,  138,  138,  122,  123,   78,   61,   79,   78,
			  124,  364,   51,   47,   80,  363,  118,   48,   49,  178,
			   49,   49,   49,   64,  179,   49,   79,   61,   79,   79,
			  165,  166,  166,   50,  138,  449,  138,  138,   81,   82,
			   81,   81,  139,  188,  188,  188,   51,   53,   53,   53,
			   53,   54,   52,   52,   52,   52,   52,   55,   56,   56,
			   56,   52,   52,   52,   56,   56,   56,   56,   56,   56,
			   56,   57,   52,   52,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   59,  296,   59,   59,   94,  197, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   94,   94,  177,  178,  198,   67,   67,   67,  179,  349,
			  350,   67,   67,   67,   67,   67,   67,   67,  195,  196,
			  196,   67,   67,   67,   67,   67,   67,   67,   67,   67,
			   69,  335,  336,   69,   70,   71,   68,   68,   71,   71,
			   68,   72,   72,   72,   68,   68,   68,   73,   73,   73,
			   73,   73,   73,   73,  339,   68,  333,   72,   74,   73,
			   75,   73,   73,   73,   73,   73,   76,   68,   68,   68,
			   68,   68,   68,   68,   68,   68,   68,   81,   82,   81,
			   81,  331,   58,   58,   58,   58,   58,   58,   83,   83,
			   83,   58,   58,   58,   83,   83,   83,   83,   83,   83,

			   83,  330,   58,   58,   83,   83,   83,   83,   83,   83,
			   83,   83,   83,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   84,   84,   84,  214,  349,  350,
			   84,   84,   84,   84,   84,   84,   84,  327,  302,  125,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   68,
			  125,  324,  126,   68,  127,  126,  126,  127,  127,  128,
			  127,  127,  127,  126,  126,  126,  127,  127,  127,  127,
			  127,  127,  127,  129,  126,  125,  127,  130,  127,  127,
			  127,  127,  127,  127,  127,  126,  126,  126,  126,  126,
			  126,  126,  126,  126,  126,  126,   68,  389,  390,   68, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   68,   71,   68,   68,   71,   71,   68,   71,   71,   71,
			  131,   68,   68,   71,   71,   71,   71,   71,   71,   71,
			  322,   68,  125,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   68,   68,   68,   68,   68,   68,   68,   68,
			   68,   68,   68,  132,   86,   86,  132,   86,   93,  249,
			  133,   86,  249,  308,   72,   72,   72,  304,   93,   86,
			   72,   72,   72,   72,   72,   72,   72,  227,  228,  228,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,  134,
			  134,  134,   97,   97,   97,  134,  134,  134,  134,  134,
			  134,  134,   97,   97,   97,  134,  134,  134,  134,  134,

			  134,  134,  134,  134,  122,  123,   89,   89,  105,   89,
			  124,  105,  297,   89,  125,  106,  105,  298,  140,  105,
			  443,   89,  294,  106,  120,  121,  120,  120,  278,  140,
			  144,  145,  144,  144,  144,  144,  144,  144,   90,   90,
			  144,   90,   90,   90,  144,  144,  144,   90,   90,   90,
			   90,   90,   90,   90,  144,  144,  144,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,  144,  144,  144,  144,
			  144,  144,  144,  144,  144,  144,  144,   93,  106,  112,
			  291,  106,  112,  392,  393,   93,  113,  156,   93,  156,
			  156,  156,  108,  449,  156,  108,  449,  113,  311,  290, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  113,  160,  161,  312,  160,  114,   68,  157,  162,  163,
			  170,  229,  229,  229,  146,  147,  148,  149,  150,  151,
			  151,  151,  152,  152,  152,  122,  123,   93,  111,  449,
			  129,  124,  125,  159,  167,  167,  167,  315,  186,  278,
			  167,  167,  167,  167,  167,  167,  167,  300,  186,  125,
			  167,  167,  167,  167,  167,  167,  167,  167,  167,  168,
			  168,  168,  100,  100,  301,  168,  168,  168,  168,  168,
			  168,  168,   93,  273,  449,  168,  168,  168,  168,  168,
			  168,  168,  168,  168,   59,   68,   59,   59,  171,  170,
			  132,  263,   93,  132,  126,  177,  178,  133,  169,  177,

			  178,  179,  180,  181,  181,  179,   97,   97,   97,  129,
			  269,  125,  127,  173,  122,  225,  125,  174,  133,  177,
			  178,  133,  182,  183,  183,  179,   99,   99,   99,  176,
			  176,  176,  234,  234,  234,  176,  176,  176,  176,  176,
			  176,  176,   93,  192,  125,  176,  176,  176,  176,  176,
			  176,  176,  176,  176,  177,  178,  138,  264,  138,  138,
			  179,  185,  121,  185,  185,  118,  187,  263,  188,  188,
			  188,  160,  161,  125,  160,  184,  101,  101,  101,  163,
			   93,  153,  401,   93,  153,  118,  144,  144,  154,  144,
			  144,  144,  252,  253,  253,  144,  144,  144,  144,  144, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  144,  144,  257,  258,  258,  144,  144,  144,  144,  144,
			  144,  144,  144,  144,   97,   97,   97,   97,   97,   97,
			  105,  162,  192,  105,  162,  197,  187,  106,   64,  193,
			  198,  250,  199,  199,  199,  199,  199,  199,   59,  171,
			   59,   59,  227,  227,  227,  126,  205,  206,  206,  185,
			  121,  185,  185,  398,  399,  201,  201,  201,  201,  201,
			  201,  201,  255,  127,  255,  255,  201,  201,  201,  201,
			  201,  201,  201,  201,  171,  209,  358,  161,  209,  232,
			  126,  207,  208,  208,  177,  178,  231,  216,  216,  216,
			  179,  177,  178,  379,  223,  223,  223,  179,  127,  209,

			  103,  125,  209,   68,   68,   68,   68,  210,  210,   68,
			  210,  210,  210,   68,   68,   68,  210,  210,  210,  210,
			  210,  210,  210,  204,   68,  125,  210,  210,  210,  210,
			  210,  210,  210,  210,  210,   68,   68,   68,   68,   68,
			   68,   68,   68,   68,   68,   68,   68,  389,  390,   68,
			  358,  177,  215,  133,  216,  216,  216,  179,  318,  203,
			  233,  318,  234,  234,  234,  122,  123,  360,  202,  217,
			  200,  124,  211,  212,  212,  212,  226,  235,  194,  212,
			  212,  212,  212,  212,  212,  212,  319,  226,  191,  212,
			  212,  212,  212,  212,  212,  212,  212,  212,  213,  213, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  213,  265,  266,  266,  213,  213,  213,  213,  213,  213,
			  213,  267,  267,  267,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  218,  190,  219,  218,  265,  265,  265,
			  220,  177,  221,   64,  222,  223,  223,  179,   64,  172,
			  236,  237,  237,  392,  393,  238,  238,  238,  121,  224,
			  239,  239,  239,  239,  239,  239,  239,   68,  398,  399,
			   68,  239,  239,  239,  239,  239,  239,  239,  239,  240,
			  240,  240,  134,  134,  134,  240,  240,  240,  240,  240,
			  240,  240,  164,  248,  158,  240,  240,  240,  240,  240,
			  240,  240,  240,  240,  241,  257,  317,  258,  171,  242,

			  126,  243,  243,  243,  126,  243,  243,  243,  244,  320,
			  321,  320,  320,  245,  126,  246,  247,  247,  127,  171,
			  294,  355,  127,  177,  178,  126,  247,  247,  247,  288,
			  177,  178,  127,  254,  254,  254,  179,  187,  357,  228,
			  228,  228,  155,  127,  251,  251,  251,  251,  251,  251,
			  251,  370,  371,  371,  103,  251,  251,  251,  251,  251,
			  251,  251,  251,  218,   93,  219,  218,  296,  297,  219,
			  220,  219,  219,  298,  177,  178,  255,  259,  260,  260,
			  179,  177,  178,  141,  260,  260,  260,  179,  125,  125,
			  220,  442,  255,  220,  177,  178,  197,  215,  125,  137, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  179,  198,  179,  237,  237,  237,  125,  256,  256,  256,
			  256,  256,  256,  256,  217,   64,  261,  118,  256,  256,
			  256,  256,  256,  256,  256,  256,  122,  123,   64,  345,
			  346,  346,  124,  117,  115,  236,  236,  236,  215,  262,
			  253,  253,  253,  179,  263,  104,  103,  177,  215,  262,
			  268,  268,  268,  179,   93,  217,  268,  268,  268,  268,
			  268,  268,  268,   90,   88,  217,  268,  268,  268,  268,
			  268,  268,  268,  268,  268,  171,  372,  372,  372,  171,
			   87,  126,  270,  271,  271,  126,  272,  272,  272,  171,
			  374,  374,  374,   85,  449,  126,  274,  275,  275,  127,

			  171,  449,   59,  127,   59,   59,  126,  276,  277,  277,
			  171,  449,  449,  127,  122,  123,  126,  277,  277,  277,
			  124,  449,  177,  178,  127,  281,  281,  281,  179,  303,
			  318,  410,  449,  318,  127,  279,  279,  279,  279,  279,
			  279,  279,  449,  355,  449,  368,  279,  279,  279,  279,
			  279,  279,  279,  279,  210,  210,  125,  280,  280,  280,
			  357,  449,  449,  280,  280,  280,  280,  280,  280,  280,
			  449,  449,  248,  280,  280,  280,  280,  280,  280,  280,
			  280,  280,  133,  310,  311,  449,  283,  283,  283,  312,
			  449,  449,  283,  283,  283,  283,  283,  283,  283,  449, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_nxt_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  449,  211,  283,  283,  283,  283,  283,  283,  283,  283,
			  283,  284,  449,  219,  284,  296,  297,  449,  285,  449,
			  221,  298,  449,  177,  178,  179,  286,  287,  287,  179,
			  177,  178,  449,  287,  287,  287,  179,  224,  284,  294,
			  219,  284,  343,  344,  344,  285,  449,  221,  449,  258,
			  258,  258,  179,  122,  123,  380,  380,  380,  233,  124,
			  266,  266,  266,  289,  224,  241,  449,  449,  244,  449,
			  242,  126,  241,  245,  126,  235,  171,  242,  126,  271,
			  271,  271,  126,  270,  270,  270,  449,  449,  284,  127,
			  219,  284,  127,  116,  116,  285,  127,  244,  116,  449,

			  127,  171,  245,  126,  275,  275,  275,  126,  292,  274,
			  274,  171,  449,  282,  125,  282,  282,  126,  274,  274,
			  274,  127,  282,  449,  300,  127,  134,  134,  134,  449,
			   59,  449,   59,   59,  449,  127,  293,  293,  293,  449,
			  449,  301,  293,  293,  293,  293,  293,  293,  293,  388,
			  388,  388,  293,  293,  293,  293,  293,  293,  293,  293,
			  293,  285,  306,  255,  285,  348,  449,  307,  126,  449,
			  294,  355,  449,  356,  356,  356,  449,  449,  299,  299,
			  299,  299,  299,  299,  299,  449,  127,  125,  357,  299,
			  299,  299,  299,  299,  299,  299,  299,  305,  305,  305, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_nxt_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  305,  305,  305,  305,  449,  210,  210,  210,  305,  305,
			  305,  305,  305,  305,  305,  305,  309,  309,  309,  404,
			  404,  404,  309,  309,  309,  309,  309,  309,  309,  397,
			  449,  449,  309,  309,  309,  309,  309,  309,  309,  309,
			  309,  313,  313,  313,  405,  405,  405,  313,  313,  313,
			  313,  313,  313,  313,  449,  449,  125,  313,  313,  313,
			  313,  313,  313,  313,  313,  313,  314,  314,  314,  416,
			  416,  416,  314,  314,  314,  314,  314,  314,  314,  408,
			  408,  408,  314,  314,  314,  314,  314,  314,  314,  314,
			  314,  316,  316,  316,  125,  449,  449,  316,  316,  316,

			  316,  316,  316,  316,  422,  422,  422,  316,  316,  316,
			  316,  316,  316,  316,  316,  316,  320,  321,  320,  320,
			  171,  425,  425,  425,  122,  123,  126,  274,  325,  275,
			  124,  323,  323,  323,  449,  449,  125,  323,  323,  323,
			  323,  323,  323,  323,  127,  449,  449,  323,  323,  323,
			  323,  323,  323,  323,  323,  323,  326,  326,  326,  326,
			  326,  326,  326,   59,  449,   59,   59,  326,  326,  326,
			  326,  326,  326,  326,  326,  332,  332,  332,  332,  332,
			  332,  332,  449,  449,  125,  449,  332,  332,  332,  332,
			  332,  332,  332,  332,  306,  411,  428,  428,  428,  307, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_nxt_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  126,  275,  275,  275,  294,  230,  230,  356,  356,  356,
			  230,   59,  294,   59,   59,  369,  369,  369,  127,  337,
			  337,  337,  361,  361,  361,  337,  337,  337,  337,  337,
			  337,  337,  430,  430,  430,  337,  337,  337,  337,  337,
			  337,  337,  337,  337,   68,  294,  449,   68,  378,  378,
			  378,  358,  449,  359,  359,  359,  395,  449,  388,  388,
			  388,  338,  338,  338,  338,  338,  338,  338,  360,  449,
			  248,  449,  338,  338,  338,  338,  338,  338,  338,  338,
			  341,  341,  341,  341,  341,  341,  341,  419,  419,  419,
			  449,  341,  341,  341,  341,  341,  341,  341,  341,  342,

			  342,  342,  383,  449,  449,  342,  342,  342,  342,  342,
			  342,  342,  419,  419,  419,  342,  342,  342,  342,  342,
			  342,  342,  342,  342,  347,  347,  347,  125,  449,  449,
			  347,  347,  347,  347,  347,  347,  347,  431,  431,  431,
			  347,  347,  347,  347,  347,  347,  347,  347,  347,  351,
			  351,  351,  435,  435,  435,  351,  351,  351,  351,  351,
			  351,  351,  433,  433,  433,  351,  351,  351,  351,  351,
			  351,  351,  351,  351,  354,  354,  354,  125,  449,  449,
			  354,  354,  354,  354,  354,  354,  354,  430,  430,  430,
			  354,  354,  354,  354,  354,  354,  354,  354,  354,  362, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_nxt_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  362,  362,  383,  449,  449,  362,  362,  362,  362,  362,
			  362,  362,  448,  448,  448,  362,  362,  362,  362,  362,
			  362,  362,  362,  362,  367,  368,  368,  445,  445,  445,
			  210,  210,  210,  210,  210,  210,  210,  449,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,   59,
			  446,   59,   59,  355,  449,  210,  210,  210,  373,  438,
			  361,  361,  361,  375,  375,  375,  375,  375,  375,  375,
			  357,  210,  210,  210,  375,  375,  375,  375,  375,  375,
			  375,  375,  377,  377,  377,  377,  377,  377,  377,  444,
			  445,  445,  445,  377,  377,  377,  377,  377,  377,  377,

			  377,  358,  449,  371,  371,  371,  449,  449,   59,  449,
			   59,   59,  382,  449,  374,  374,  374,  449,  379,  381,
			  381,  381,   59,  449,   59,   59,  449,  449,  449,  383,
			  384,  384,  384,  394,  394,  394,  384,  384,  384,  384,
			  384,  384,  384,  441,  441,  441,  384,  384,  384,  384,
			  384,  384,  384,  384,  384,  386,  386,  386,  418,  449,
			  449,  386,  386,  386,  386,  386,  386,  386,  449,  449,
			  449,  386,  386,  386,  386,  386,  386,  386,  386,  386,
			   59,  449,   59,   59,  419,  419,  419,  449,  449,  387,
			  449,  381,  381,  381,  396,  396,  396,  449,  449,  125, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_nxt_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  396,  396,  396,  396,  396,  396,  396,  420,  449,  449,
			  396,  396,  396,  396,  396,  396,  396,  396,  396,  400,
			  400,  400,  449,  449,  449,  400,  400,  400,  400,  400,
			  400,  400,  449,  449,  449,  400,  400,  400,  400,  400,
			  400,  400,  400,  400,   59,  449,   59,   59,  449,  449,
			  402,   59,  403,   59,   59,  394,  394,  394,  449,  441,
			  441,  441,  409,  409,  409,  412,  449,  413,  449,  449,
			  404,  404,  404,  414,  125,  405,  405,  405,  417,  449,
			  408,  408,  408,  449,  449,  410,   59,  449,   59,   59,
			  415,   59,  449,   59,   59,  418,  449,  409,  409,  409,

			  449,  449,  409,  409,  409,  423,  449,  416,  416,  416,
			  427,  449,  422,  422,  422,  429,  449,  425,  425,  425,
			  449,  432,  424,  428,  428,  428,  295,  295,  412,  449,
			  434,  295,  125,  431,  431,  431,  436,  449,  437,  449,
			  449,  433,  433,  433,  439,  449,  440,  449,  449,  435,
			  435,  435,  441,  441,  441,  449,  125,  445,  445,  445,
			  449,  448,  448,  448,  449,  449,  107,  125,  449,  107,
			  449,  107,  424,  107,  107,  442,  415,   27,   27,   27,
			   27,   27,   27,   27,   27,   27,   27,   27,   27,   27,
			   27,   27,   27,   37,   37,   37,   37,   37,   37,   37, yy_Dummy>>,
			1, 200, 2400)
		end

	yy_nxt_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   37,   37,   37,   37,   37,   37,   37,   37,   37,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   58,  449,   58,   58,  449,
			   58,   58,   58,   58,   58,  449,   58,   58,   58,   58,
			   58,   63,  449,   63,   63,   63,   63,   63,   63,   63,
			   63,   63,  449,   63,   63,   63,   63,   77,   77,   77,
			   77,  449,   77,   77,   77,   77,   77,  449,   77,   77,
			   77,   77,   77,   91,   91,   91,   91,  328,  328,  449,
			   91,   92,  328,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,  449,   92,   92,   92,   92,  102,  449,  102,

			  102,  102,  102,  102,  102,  102,  102,  102,  449,  102,
			  102,  102,  102,  109,  329,  329,  109,  449,  449,  329,
			  449,  109,  109,  449,  449,  449,  109,  109,   66,   66,
			   66,   66,   66,   66,   66,   66,   66,   66,   66,   66,
			   66,   66,   66,   66,   68,  449,  449,   68,   68,   68,
			   68,   68,   68,   68,  449,   68,   68,   68,   68,   68,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  118,  118,  118,  118,  118,  118,  118,  118, yy_Dummy>>,
			1, 200, 2600)
		end

	yy_nxt_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  118,  118,  118,  118,  118,  118,  118,  118,  126,  449,
			  449,  126,  126,  126,  126,  126,  126,  126,  126,  126,
			  126,  126,  126,  126,  129,  129,  129,  129,  129,  129,
			  129,  129,  129,  449,  129,  129,  129,  139,  139,  139,
			  139,  139,  139,  139,  139,  139,  139,  139,  139,  139,
			  139,  139,  139,  156,  353,  353,  156,  449,  156,  353,
			  156,  156,  189,  449,  189,  189,  189,  189,  189,  189,
			  189,  189,  189,  449,  189,  189,  189,  189,  194,  194,
			  194,  194,  194,  194,  194,  194,  194,  194,  194,  194,
			  194,  194,  194,  194,  232,  232,  232,  232,  232,  232,

			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  365,  365,  391,  391,  449,  365,  449,  391,  406,  406,
			  449,  449,  449,  406,   13, yy_Dummy>>,
			1, 125, 2800)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 2971)
			an_array.put (0, 0)
			an_array.area.fill_with (1, 1, 47)
			yy_chk_template_1 (an_array)
			an_array.area.fill_with (5, 142, 188)
			yy_chk_template_2 (an_array)
			an_array.area.fill_with (11, 347, 393)
			yy_chk_template_3 (an_array)
			an_array.area.fill_with (70, 552, 595)
			yy_chk_template_4 (an_array)
			an_array.area.fill_with (90, 730, 776)
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
			an_array.area.fill_with (449, 2924, 2971)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    2,   17,    2,    2,   14,   40,   14,   14,  483,   67,
			   67,    2,    2,    2,   42,   67,  480,    2,    2,    2,
			    2,    2,    2,    2,  479,   17,   40,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    3,    3,   19,    3,
			   19,   19,   65,    3,    3,   15,   15,   15,   15,  447,
			   42,    3,   44,   15,   16,   16,   16,   16,   23,   23,
			   23,   23,    3,  440,    3,    4,    4,   18,    4,   18,
			   18,   65,    4,    4,  322,   18,   22,   22,   22,   22,
			    4,  322,  421,   38,   22,   38,   38,   44,   44,  211,
			  415,    4,  211,    4, yy_Dummy>>,
			1, 94, 48)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    7,   28,   28,    7,   28,  131,   33,   33,   28,   33,
			  147,   69,  413,   33,   69,   41,   28,  131,   43,  399,
			   49,   33,   45,   49,    7,   50,   74,   49,   50,   58,
			   74,   58,   58,   59,  168,   59,   59,   69,  365,  168,
			    7,    7,    7,    7,    7,    8,  147,   69,    8,   41,
			   41,   41,   43,   43,   43,   50,   45,   45,   45,  357,
			  127,   50,   88,   88,   88,   51,  127,  154,   51,    8,
			  154,  154,   51,   60,   60,   60,   60,   61,   61,   61,
			   61,   60,  323,  323,  127,    8,    8,    8,    8,    8,
			    9,   51,  265,  103,    9,    9,  103,    9,    9,    9,

			  103,  354,    9,   66,   66,   66,   66,   66,  353,  265,
			    9,   77,   77,   77,   77,   84,   84,   78,   78,   78,
			   78,   84,  351,    9,   10,   78,  350,   66,   10,   10,
			  213,   10,   10,   10,  119,  213,   10,   79,   79,   79,
			   79,  119,  119,  119,   10,   80,   80,   80,   80,   81,
			   81,   81,   81,   80,  143,  143,  143,   10, yy_Dummy>>,
			1, 158, 189)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   20,  342,   20,   20,   94,  236,   94,   94,  134,  134,
			  236,   20,   20,   20,  134,  337,  337,   20,   20,   20,
			   20,   20,   20,   20,  164,  164,  164,   20,   20,   20,
			   20,   20,   20,   20,   20,   20,   21,  347,  347,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			  328,   21,  319,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   24,   24,   24,   24,  313,   24,   24,
			   24,   24,   24,   24,   24,   24,   24,   24,   24,   24,

			   24,   24,   24,   24,   24,   24,   24,  312,   24,   24,
			   24,   24,   24,   24,   24,   24,   24,   24,   24,   24,
			   24,   24,   24,   24,   24,   24,   24,   24,   24,   24,
			   25,   25,   25,  179,  362,  362,   25,   25,   25,   25,
			   25,   25,   25,  309,  288,  179,   25,   25,   25,   25,
			   25,   25,   25,   25,   25,   70,  288,  306, yy_Dummy>>,
			1, 158, 394)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   71,  384,  384,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,  304,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   72,   86,   86,
			   72,   86,   98,  249,   72,   86,  249,  293,   72,   72,
			   72,  290,   99,   86,   72,   72,   72,   72,   72,   72,
			   72,  187,  187,  187,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   73,   73,   73,   98,   98,   98,   73,
			   73,   73,   73,   73,   73,   73,   99,   99,   99,   73,

			   73,   73,   73,   73,   73,   73,   73,   73,   85,   85,
			   89,   89,  105,   89,   85,  105,  314,   89,  437,  105,
			  107,  314,   85,  107,  437,   89,  280,  107,  120,  120,
			  120,  120,  278,   85, yy_Dummy>>,
			1, 134, 596)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   97,  106,  112,  268,  106,  112,  386,  386,  100,  112,
			  106,  101,  106,  106,  106,  108,  109,  106,  108,  109,
			  113,  329,  264,  113,  114,  114,  329,  114,  112,  126,
			  109,  114,  114,  126,  188,  188,  188,   97,   97,   97,
			   97,   97,  100,  100,  100,  101,  101,  101,  140,  140,
			  149,  108,  109,  126,  140,  126,  113,  122,  122,  122,
			  298,  140,  248,  122,  122,  122,  122,  122,  122,  122,
			  317,  140,  298,  122,  122,  122,  122,  122,  122,  122,
			  122,  122,  123,  123,  123,  149,  149,  317,  123,  123,
			  123,  123,  123,  123,  123,  146,  244,  346,  123,  123,

			  123,  123,  123,  123,  123,  123,  123,  124,  128,  124,
			  124,  130,  128,  132,  346,  148,  132,  130,  184,  184,
			  132,  124,  135,  135,  184,  135,  135,  135,  135,  146,
			  146,  146,  128,  241,  128,  130,  130,  240,  184,  132,
			  130,  133,  136,  136,  133,  136,  136,  136,  136,  148,
			  148,  148,  133,  133,  133,  196,  196,  196,  133,  133,
			  133,  133,  133,  133,  133,  150,  232,  133,  133,  133,
			  133,  133,  133,  133,  133,  133,  133,  137,  137,  138,
			  231,  138,  138,  137,  139,  139,  139,  139,  139,  142,
			  230,  142,  142,  142,  160,  160,  393,  160,  137,  150, yy_Dummy>>,
			1, 200, 777)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  150,  150,  160,  151,  153,  393,  152,  153,  139,  144,
			  144,  153,  144,  144,  144,  215,  215,  215,  144,  144,
			  144,  144,  144,  144,  144,  221,  221,  221,  144,  144,
			  144,  144,  144,  144,  144,  144,  144,  151,  151,  151,
			  152,  152,  152,  156,  162,  162,  156,  162,  165,  227,
			  156,  166,  162,  165,  212,  165,  165,  165,  166,  166,
			  166,  169,  173,  169,  169,  229,  229,  229,  173,  173,
			  173,  173,  185,  185,  185,  185,  391,  391,  169,  169,
			  169,  169,  169,  169,  169,  255,  173,  255,  255,  169,
			  169,  169,  169,  169,  169,  169,  169,  174,  209,  370,

			  194,  209,  193,  174,  174,  174,  174,  181,  181,  191,
			  181,  181,  181,  181,  183,  183,  370,  183,  183,  183,
			  183,  174,  175,  189,  209,  175,  175,  175,  175,  175,
			  175,  175,  175,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,  175,  175,  175,  175,  172,  175,  175,  175,
			  175,  175,  175,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,  175,  175,  175,  175,  175,  175,  175,  176,
			  396,  396,  176,  380,  180,  180,  176,  180,  180,  180,
			  180,  302,  171,  195,  302,  195,  195,  195,  186,  186,
			  380,  170,  180,  167,  186,  176,  177,  177,  177,  186, yy_Dummy>>,
			1, 200, 977)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  195,  163,  177,  177,  177,  177,  177,  177,  177,  302,
			  186,  158,  177,  177,  177,  177,  177,  177,  177,  177,
			  177,  178,  178,  178,  233,  233,  233,  178,  178,  178,
			  178,  178,  178,  178,  234,  234,  234,  178,  178,  178,
			  178,  178,  178,  178,  178,  178,  182,  157,  182,  182,
			  267,  267,  267,  182,  182,  182,  198,  182,  182,  182,
			  182,  199,  129,  198,  198,  198,  400,  400,  199,  199,
			  199,  118,  182,  200,  200,  200,  200,  200,  200,  200,
			  210,  406,  406,  210,  200,  200,  200,  200,  200,  200,
			  200,  200,  201,  201,  201,  287,  287,  287,  201,  201,

			  201,  201,  201,  201,  201,  117,  210,  110,  201,  201,
			  201,  201,  201,  201,  201,  201,  201,  205,  300,  300,
			  300,  206,  205,  205,  205,  205,  205,  206,  206,  206,
			  206,  207,  320,  320,  320,  320,  207,  207,  207,  207,
			  207,  205,  208,  378,  378,  206,  261,  261,  208,  208,
			  208,  208,  261,  216,  216,  207,  216,  216,  216,  216,
			  228,  378,  228,  228,  228,  104,  208,  214,  214,  214,
			  214,  214,  214,  214,  358,  358,  358,  102,  214,  214,
			  214,  214,  214,  214,  214,  214,  218,   92,  218,  218,
			  283,  283,  219,  218,  219,  219,  283,  222,  222,  219, yy_Dummy>>,
			1, 200, 1177)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  222,  222,  222,  222,  223,  223,   87,  223,  223,  223,
			  223,  443,  218,  220,  443,  220,  220,  225,  225,  237,
			  252,   76,   75,  225,  237,  252,  237,  237,  237,   68,
			  220,  220,  220,  220,  220,  220,  220,  252,   63,  225,
			   62,  220,  220,  220,  220,  220,  220,  220,  220,  226,
			  226,  238,  334,  334,  334,  226,   57,   54,  238,  238,
			  238,  253,  226,  253,  253,  253,  253,  334,   48,   47,
			  281,  281,  226,  239,  239,  239,  281,   37,  253,  239,
			  239,  239,  239,  239,  239,  239,   34,   31,  281,  239,
			  239,  239,  239,  239,  239,  239,  239,  239,  242,  359,

			  359,  359,  243,   29,  242,  242,  242,  242,  243,  243,
			  243,  243,  245,  363,  363,  363,   26,   13,  245,  245,
			  245,  245,  242,  246,    0,  411,  243,  411,  411,  246,
			  246,  246,  246,  247,    0,    0,  245,  289,  289,  247,
			  247,  247,  247,  289,    0,  254,  254,  246,  254,  254,
			  254,  254,  289,  318,  411,    0,  318,  247,  250,  250,
			  250,  250,  250,  250,  250,    0,  368,    0,  368,  250,
			  250,  250,  250,  250,  250,  250,  250,  251,  251,  318,
			  251,  251,  251,  368,    0,    0,  251,  251,  251,  251,
			  251,  251,  251,    0,    0,  251,  251,  251,  251,  251, yy_Dummy>>,
			1, 200, 1377)
		end

	yy_chk_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  251,  251,  251,  251,  251,  256,  295,  295,    0,  256,
			  256,  256,  295,    0,    0,  256,  256,  256,  256,  256,
			  256,  256,    0,    0,  256,  256,  256,  256,  256,  256,
			  256,  256,  256,  256,  257,    0,  257,  257,  316,  316,
			    0,  257,    0,  257,  316,    0,  259,  259,  257,  259,
			  259,  259,  259,  260,  260,    0,  260,  260,  260,  260,
			  257,  258,  333,  258,  258,  333,  333,  333,  258,    0,
			  258,    0,  258,  258,  258,  258,  262,  262,  372,  372,
			  372,  266,  262,  266,  266,  266,  262,  258,  270,    0,
			    0,  274,    0,  270,  270,  271,  274,  274,  266,  272,

			  271,  271,  271,  271,  271,  272,  272,  272,  272,    0,
			    0,  284,  270,  284,  284,  274,  461,  461,  284,  271,
			  275,  461,    0,  272,  276,  275,  275,  275,  275,  275,
			  276,  276,  276,  276,  277,    0,  475,  284,  475,  475,
			  277,  277,  277,  277,  275,  475,    0,  286,  276,  286,
			  286,  286,    0,  336,    0,  336,  336,    0,  277,  279,
			  279,  279,    0,    0,  286,  279,  279,  279,  279,  279,
			  279,  279,  382,  382,  382,  279,  279,  279,  279,  279,
			  279,  279,  279,  279,  285,  292,  285,  285,  336,    0,
			  292,  292,    0,  343,  343,    0,  343,  343,  343,    0, yy_Dummy>>,
			1, 200, 1577)
		end

	yy_chk_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,  285,  285,  285,  285,  285,  285,  285,    0,  292,
			  285,  343,  285,  285,  285,  285,  285,  285,  285,  285,
			  291,  291,  291,  291,  291,  291,  291,    0,  390,  390,
			  390,  291,  291,  291,  291,  291,  291,  291,  291,  294,
			  294,  294,  395,  395,  395,  294,  294,  294,  294,  294,
			  294,  294,  390,    0,    0,  294,  294,  294,  294,  294,
			  294,  294,  294,  294,  296,  296,  296,  397,  397,  397,
			  296,  296,  296,  296,  296,  296,  296,    0,    0,  296,
			  296,  296,  296,  296,  296,  296,  296,  296,  296,  297,
			  297,  297,  407,  407,  407,  297,  297,  297,  297,  297,

			  297,  297,  401,  401,  401,  297,  297,  297,  297,  297,
			  297,  297,  297,  297,  299,  299,  299,  401,    0,    0,
			  299,  299,  299,  299,  299,  299,  299,  414,  414,  414,
			  299,  299,  299,  299,  299,  299,  299,  299,  299,  303,
			  303,  303,  303,  307,  417,  417,  417,  303,  303,  307,
			  307,  307,  307,  303,  305,  305,  305,    0,    0,  417,
			  305,  305,  305,  305,  305,  305,  305,  307,    0,    0,
			  305,  305,  305,  305,  305,  305,  305,  305,  305,  308,
			  308,  308,  308,  308,  308,  308,  403,    0,  403,  403,
			  308,  308,  308,  308,  308,  308,  308,  308,  315,  315, yy_Dummy>>,
			1, 200, 1777)
		end

	yy_chk_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  315,  315,  315,  315,  315,    0,    0,  315,    0,  315,
			  315,  315,  315,  315,  315,  315,  315,  325,  403,  423,
			  423,  423,  325,  325,  325,  325,  325,  344,  472,  472,
			  344,  344,  344,  472,  348,  356,  348,  348,  356,  356,
			  356,  325,  326,  326,  326,  348,  348,  348,  326,  326,
			  326,  326,  326,  326,  326,  426,  426,  426,  326,  326,
			  326,  326,  326,  326,  326,  326,  326,  327,  369,    0,
			  327,  369,  369,  369,  345,    0,  345,  345,  345,  388,
			    0,  388,  388,  388,  327,  327,  327,  327,  327,  327,
			  327,  345,    0,  327,    0,  327,  327,  327,  327,  327,

			  327,  327,  327,  331,  331,  331,  331,  331,  331,  331,
			  419,  419,  419,    0,  331,  331,  331,  331,  331,  331,
			  331,  331,  332,  332,  332,  419,    0,    0,  332,  332,
			  332,  332,  332,  332,  332,  420,  420,  420,  332,  332,
			  332,  332,  332,  332,  332,  332,  332,  335,  335,  335,
			  420,    0,    0,  335,  335,  335,  335,  335,  335,  335,
			  427,  427,  427,  335,  335,  335,  335,  335,  335,  335,
			  335,  335,  338,  338,  338,  432,  432,  432,  338,  338,
			  338,  338,  338,  338,  338,  429,  429,  429,  338,  338,
			  338,  338,  338,  338,  338,  338,  338,  341,  341,  341, yy_Dummy>>,
			1, 200, 1977)
		end

	yy_chk_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  429,    0,    0,  341,  341,  341,  341,  341,  341,  341,
			  430,  430,  430,  341,  341,  341,  341,  341,  341,  341,
			  341,  341,  349,  349,  349,  430,    0,    0,  349,  349,
			  349,  349,  349,  349,  349,  444,  444,  444,  349,  349,
			  349,  349,  349,  349,  349,  349,  349,  355,  355,  355,
			  439,  439,  439,  355,  355,  355,  355,  355,  355,  355,
			    0,  434,  434,  434,  355,  355,  355,  355,  355,  355,
			  355,  355,  361,  439,  361,  361,  367,    0,  367,  367,
			  367,  361,  434,  361,  361,  361,  364,  364,  364,  364,
			  364,  364,  364,  367,  438,  438,  438,  364,  364,  364,

			  364,  364,  364,  364,  364,  366,  366,  366,  366,  366,
			  366,  366,  438,  446,  446,  446,  366,  366,  366,  366,
			  366,  366,  366,  366,  371,    0,  371,  371,  371,    0,
			    0,  373,    0,  373,  373,  374,    0,  374,  374,  374,
			    0,  371,  373,  373,  373,  387,    0,  387,  387,    0,
			    0,    0,  374,  375,  375,  375,  387,  387,  387,  375,
			  375,  375,  375,  375,  375,  375,  441,  441,  441,  375,
			  375,  375,  375,  375,  375,  375,  375,  375,  377,  377,
			  377,  441,    0,    0,  377,  377,  377,  377,  377,  377,
			  377,    0,    0,    0,  377,  377,  377,  377,  377,  377, yy_Dummy>>,
			1, 200, 2177)
		end

	yy_chk_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  377,  377,  377,  381,    0,  381,  381,  412,  412,  412,
			    0,    0,  381,    0,  381,  381,  381,  389,  389,  389,
			    0,    0,  412,  389,  389,  389,  389,  389,  389,  389,
			  412,    0,    0,  389,  389,  389,  389,  389,  389,  389,
			  389,  389,  392,  392,  392,    0,    0,    0,  392,  392,
			  392,  392,  392,  392,  392,    0,    0,    0,  392,  392,
			  392,  392,  392,  392,  392,  392,  392,  394,    0,  394,
			  394,    0,    0,  394,  402,  394,  402,  402,  394,  394,
			  394,    0,  442,  442,  442,  402,  402,  402,  404,    0,
			  404,    0,    0,  404,  404,  404,  405,  442,  405,  405,

			  405,  408,    0,  408,  408,  408,    0,    0,  402,  409,
			    0,  409,  409,  405,  410,    0,  410,  410,  408,    0,
			  409,  409,  409,    0,    0,  410,  410,  410,  416,    0,
			  416,  416,  416,  422,    0,  422,  422,  422,  425,    0,
			  425,  425,  425,    0,  428,  416,  428,  428,  428,  476,
			  476,  431,    0,  431,  476,  425,  431,  431,  431,  433,
			    0,  433,    0,    0,  433,  433,  433,  435,    0,  435,
			    0,    0,  435,  435,  435,  436,  436,  436,    0,  433,
			  445,  445,  445,    0,  448,  448,  448,    0,    0,  459,
			  436,    0,  459,    0,  459,  445,  459,  459,  436,  448, yy_Dummy>>,
			1, 200, 2377)
		end

	yy_chk_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  450,  450,  450,  450,  450,  450,  450,  450,  450,  450,
			  450,  450,  450,  450,  450,  450,  451,  451,  451,  451,
			  451,  451,  451,  451,  451,  451,  451,  451,  451,  451,
			  451,  451,  452,  452,  452,  452,  452,  452,  452,  452,
			  452,  452,  452,  452,  452,  452,  452,  452,  453,    0,
			  453,  453,    0,  453,  453,  453,  453,  453,    0,  453,
			  453,  453,  453,  453,  454,    0,  454,  454,  454,  454,
			  454,  454,  454,  454,  454,    0,  454,  454,  454,  454,
			  455,  455,  455,  455,    0,  455,  455,  455,  455,  455,
			    0,  455,  455,  455,  455,  455,  456,  456,  456,  456,

			  477,  477,    0,  456,  457,  477,  457,  457,  457,  457,
			  457,  457,  457,  457,  457,    0,  457,  457,  457,  457,
			  458,    0,  458,  458,  458,  458,  458,  458,  458,  458,
			  458,    0,  458,  458,  458,  458,  460,  478,  478,  460,
			    0,    0,  478,    0,  460,  460,    0,    0,    0,  460,
			  460,  462,  462,  462,  462,  462,  462,  462,  462,  462,
			  462,  462,  462,  462,  462,  462,  462,  463,    0,    0,
			  463,  463,  463,  463,  463,  463,  463,    0,  463,  463,
			  463,  463,  463,  464,  464,  464,  464,  464,  464,  464,
			  464,  464,  464,  464,  464,  464,  464,  464,  464,  465, yy_Dummy>>,
			1, 200, 2577)
		end

	yy_chk_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  465,  465,  465,  465,  465,  465,  465,  465,  465,  465,
			  465,  465,  465,  465,  465,  466,  466,  466,  466,  466,
			  466,  466,  466,  466,  466,  466,  466,  466,  466,  466,
			  466,  467,    0,    0,  467,  467,  467,  467,  467,  467,
			  467,  467,  467,  467,  467,  467,  467,  468,  468,  468,
			  468,  468,  468,  468,  468,  468,    0,  468,  468,  468,
			  469,  469,  469,  469,  469,  469,  469,  469,  469,  469,
			  469,  469,  469,  469,  469,  469,  470,  481,  481,  470,
			    0,  470,  481,  470,  470,  471,    0,  471,  471,  471,
			  471,  471,  471,  471,  471,  471,    0,  471,  471,  471,

			  471,  473,  473,  473,  473,  473,  473,  473,  473,  473,
			  473,  473,  473,  473,  473,  473,  473,  474,  474,  474,
			  474,  474,  474,  474,  474,  474,  474,  474,  474,  474,
			  474,  474,  474,  482,  482,  484,  484,    0,  482,    0,
			  484,  485,  485,    0,    0,    0,  485, yy_Dummy>>,
			1, 147, 2777)
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
			  308,  346,    0, 1494,   51,   92,  101,   44,  114,   85,
			  393,  429,  123,  105,  476,  512, 1472, 2924,  189, 1471,
			 2924, 1430, 2924,  194, 1454,    0, 2924, 1449,  130, 2924,
			   48,  199,   57,  202,   95,  206, 2924, 1441, 1436,  208,
			  213,  253, 2924, 2924, 1407, 2924,    0, 1404,  217,  221,
			  261,  265, 1408, 1410, 2924,   85,  291,   48, 1379,  199,
			  548,  595,  642,  667,  185, 1367, 1371,  299,  305,  325,
			  333,  337, 2924,    0,  295,  695,  643, 1381,  239,  705,
			  729,    0, 1359, 2924,  397, 2924, 2924,  772,  643,  653,

			  780,  783, 1349,  281, 1340,  707,  777,  715,  791,  792,
			 1252, 2924,  778,  796,  800, 2924,    0, 1248, 1246,  318,
			  723, 2924,  822,  847,  883, 2924,  805,  244,  884, 1234,
			  883,  179,  889,  917,  393,  890,  910,  945,  955,  960,
			  816, 2924,  956,  331,  977, 2924,  867,  194,  887,  822,
			  937,  975,  978,  980,  255, 2924, 1019, 1209, 1158, 2924,
			  970, 2924, 1020, 1169,  406, 1020, 1023, 1161,  213, 1037,
			 1141, 1132, 1096, 1034, 1069, 1098, 1145, 1161, 1186,  512,
			 1142, 1075, 1222, 1082,  886, 1048, 1156,  655,  799, 1095,
			    0, 1057, 2924, 1070, 1075, 1150,  920, 2924, 1228, 1233, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1232, 1257, 2924, 2924, 2924, 1289, 1293, 1303, 1314, 1074,
			 1256,  136, 1022,  309, 1326,  980, 1321, 2924, 1362, 1368,
			 1389,  990, 1365, 1372, 2924, 1385, 1417, 1016, 1327, 1030,
			  940,  926,  941, 1189, 1199, 2924,  394, 1391, 1423, 1438,
			  905,  883, 1470, 1474,  846, 1484, 1495, 1505,  812,  648,
			 1517, 1545, 1387, 1428, 1513, 1061, 1574, 1610, 1637, 1614,
			 1621, 1314, 1644, 2924,  784,  271, 1648, 1215,  770, 2924,
			 1660, 1667, 1671, 2924, 1663, 1692, 1696, 1706,  701, 1724,
			  713, 1438,    0, 1358, 1687, 1760, 1714, 1260,  523, 1505,
			  642, 1779, 1757,  643, 1804, 1574, 1829, 1854,  822, 1879,

			 1283, 2924, 1157, 1915,  591, 1919,  524, 1915, 1938,  528,
			    0,    0,  486,  472,  702, 1957, 1606,  837, 1529,  422,
			 1308, 2924,   95,  262, 2924, 1989, 2007, 2043,  445,  788,
			    0, 2062, 2087, 1630, 1417, 2112, 1729,  400, 2137,    0,
			    0, 2162,  386, 1761, 1995, 2041,  864,  422, 2010, 2187,
			  279,  301,    0,  288,  280, 2212, 2003,  221, 1339, 1464,
			 2924, 2248,  519, 1478, 2245,  217, 2264, 2243, 1533, 2036,
			 1066, 2291, 1643, 2307, 2302, 2318,    0, 2343, 1311, 2924,
			 1140, 2379, 1737, 2924,  588,    0,  774, 2321, 2046, 2382,
			 1793, 1044, 2407,  946, 2443, 1807, 1138, 1832,    0,  172, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1234, 1867, 2450, 1962, 2458, 2463, 1249, 1857, 2468, 2485,
			 2490, 1501, 2372,  168, 1892,  111, 2495, 1909, 2924, 2075,
			 2100,  100, 2500, 1984, 2924, 2505, 2020, 2125, 2511, 2150,
			 2175, 2521, 2140, 2529, 2226, 2537, 2540,  687, 2259, 2215,
			   78, 2331, 2447, 1361, 2200, 2545, 2278,   67, 2549, 2924,
			 2576, 2592, 2608, 2624, 2640, 2656, 2666, 2680, 2696, 2565,
			 2712, 1684, 2727, 2743, 2759, 2775, 2791, 2807, 2820, 2836,
			 2852, 2861, 1996, 2877, 2893, 1712, 2517, 2668, 2705,   62,
			   54, 2845, 2901,   46, 2903, 2909, yy_Dummy>>,
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

	yyJam_base: INTEGER = 2924
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
		do
			if converted_codes.has (an_old_code) and then attached converted_codes.item (an_old_code) as nc then
				new_code := nc
			else
				new_code := adl_14_id_code_upgraded (an_old_code)
				converted_codes.put (new_code, an_old_code)
			end
			out_buffer.append (new_code)
		end

	output_new_value_code (an_old_code: STRING)
		local
			new_code: STRING
		do
			if converted_codes.has (an_old_code) and then attached converted_codes.item (an_old_code) as nc then
				new_code := nc
			else
				new_code := adl_14_value_code_upgraded (an_old_code)
				converted_codes.put (new_code, an_old_code)
			end

			out_buffer.append (new_code)
		end

	output_new_value_set_code (an_old_code: STRING)
		local
			new_code: STRING
		do
			if converted_codes.has (an_old_code) and then attached converted_codes.item (an_old_code) as nc then
				new_code := nc
			else
				new_code := adl_14_value_set_code_upgraded (an_old_code)
				converted_codes.put (new_code, an_old_code)
			end

			out_buffer.append (new_code)
		end

	output_converted_code_dt_key (an_old_code: STRING; )
			-- code should exist in converted_codes list; if not, output an invalid code, which will
			-- cause later compilation to fail
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
