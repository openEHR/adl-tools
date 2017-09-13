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
		output_new_at_ac_code (text_substring (2, text_count - 1))
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
		output_new_at_ac_code (text_substring (9, text_count-1))
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
	output_new_at_ac_code (text_substring (9, text_count-1))
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
		output_new_at_ac_code (text)
	
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
		output_new_at_ac_code (text_substring (2, text_count - 1))
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
			create an_array.make_filled (0, 0, 3233)
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
			yy_nxt_template_16 (an_array)
			yy_nxt_template_17 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			    0,   14,   15,   16,   16,   15,   17,   14,   14,   14,
			   18,   14,   19,   14,   14,   14,   14,   14,   14,   20,
			   20,   20,   20,   20,   20,   20,   21,   14,   14,   14,
			   20,   20,   20,   20,   20,   20,   20,   20,   14,   14,
			   14,   14,   14,   14,   14,   14,   14,   14,   22,   64,
			   23,   22,   59,   95,   59,   59,  446,  122,  123,   24,
			   24,   24,   93,  124,  447,   25,   25,   25,   25,   26,
			   25,   25,  426,   65,   96,   24,   25,   25,   25,   26,
			   25,   25,   25,   25,   28,   28,   59,   28,   59,   59,
			   64,   28,   29,   60,   61,   61,   60,  278,   98,   28,

			   93,   62,   61,   61,   61,   61,   79,   61,   79,   79,
			   30,  421,   31,   28,   28,   59,   28,   59,   59,  119,
			   28,   29,  263,   66,   78,   61,   79,   78,   28,  334,
			  407,   94,   80,   94,   94,  100,  100,  249,  376,   30,
			  249,   31,   32,   33,   33,   32,   33,   32,   32,   32,
			   33,   34,   35,   32,   35,   35,   35,   32,   33,   32,
			   35,   35,   35,   35,   35,   35,   35,   32,   32,   36,
			   35,   35,   35,   35,   35,   35,   35,   35,   35,   32,
			   32,   32,   32,   32,   32,   32,   32,   32,   32,   38,
			   86,   86,   39,   86,  175,   89,   89,   86,   89,   93, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   69,  278,   89,   69,   93,   86,  125,   93,  366,  105,
			   89,   93,  105,   40,  108,  135,  106,  108,   59,  136,
			   59,   59,   59,  123,   59,   59,  125,  310,  124,   41,
			   42,   43,   44,   45,   38,   98,   76,   39,   97,   97,
			   97,   99,   99,   99,  110,  101,  101,  101,  364,  171,
			  111,  142,  143,  143,  112,  126,  154,  112,   40,  154,
			  189,  113,   60,   61,   61,   60,   61,   61,   61,   61,
			   62,  335,  336,  127,   41,   42,   43,   44,   45,   47,
			  114,  233,  153,   48,   49,  153,   49,   49,   49,  154,
			  363,   49,  120,  121,  120,  120,  118,  296,  235,   50,

			  138,  449,  138,  138,  122,  123,   78,   61,   79,   78,
			  124,  339,   51,   47,   80,  333,  118,   48,   49,  178,
			   49,   49,   49,   64,  179,   49,   79,   61,   79,   79,
			  165,  166,  166,   50,  138,  449,  138,  138,   81,   82,
			   81,   81,  139,  188,  188,  188,   51,   52,   53,   53,
			   53,   53,   54,   52,   52,   52,   52,   52,   55,   56,
			   56,   56,   52,   52,   52,   56,   56,   56,   56,   56,
			   56,   56,   57,   52,   52,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   59,  331,   59,   59,   94,  197, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   94,   94,  177,  178,  198,   67,   67,   67,  179,  349,
			  350,   67,   67,   67,   67,   67,   67,   67,  195,  196,
			  196,   67,   67,   67,   67,   67,   67,   67,   67,   67,
			   68,   69,  335,  336,   69,   70,   71,   68,   68,   71,
			   71,   68,   72,   72,   72,   68,   68,   68,   73,   73,
			   73,   73,   73,   73,   73,  330,   68,  327,   72,   74,
			   73,   75,   73,   73,   73,   73,   73,   76,   68,   68,
			   68,   68,   68,   68,   68,   68,   68,   58,   81,   82,
			   81,   81,  324,   58,   58,   58,   58,   58,   58,   83,
			   83,   83,   58,   58,   58,   83,   83,   83,   83,   83,

			   83,   83,   93,   58,   58,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   84,   84,   84,  214,  349,  350,
			   84,   84,   84,   84,   84,   84,   84,  100,  100,  125,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,  126,
			   68,  389,  390,  126,   68,  127,  126,  126,  127,  127,
			  128,  127,  127,  127,  126,  126,  126,  127,  127,  127,
			  127,  127,  127,  127,  129,  126,  125,  127,  130,  127,
			  127,  127,  127,  127,  127,  127,  126,  126,  126,  126,
			  126,  126,  126,  126,  126,  126,   68,   68,  392,  393, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   68,   68,   71,   68,   68,   71,   71,   68,   71,   71,
			   71,  131,   68,   68,   71,   71,   71,   71,   71,   71,
			   71,  322,   68,  125,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   68,   68,   68,   68,   68,   68,   68,
			   68,   68,   68,  132,   86,   86,  132,   86,   93,  249,
			  133,   86,  249,  308,   72,   72,   72,  304,   93,   86,
			   72,   72,   72,   72,   72,   72,   72,  227,  228,  228,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,  134,
			  134,  134,   97,   97,   97,  134,  134,  134,  134,  134,
			  134,  134,   97,   97,   97,  134,  134,  134,  134,  134,

			  134,  134,  134,  134,  122,  123,   89,   89,  105,   89,
			  124,  105,  297,   89,  125,  106,  105,  298,  140,  105,
			  443,   89,  294,  106,  120,  121,  120,  120,  278,  140,
			  144,  144,  145,  144,  144,  144,  144,  144,  144,   90,
			   90,  144,   90,   90,   90,  144,  144,  144,   90,   90,
			   90,   90,   90,   90,   90,  144,  144,  144,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,  144,  144,  144,
			  144,  144,  144,  144,  144,  144,  144,   93,  106,  112,
			  291,  106,  112,  398,  399,   93,  113,  156,   93,  156,
			  156,  156,  108,  449,  156,  108,  449,  113,  311,  290, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  113,  160,  161,  312,  160,  114,   68,  157,  162,  163,
			  170,  229,  229,  229,  146,  147,  148,  149,  150,  151,
			  151,  151,  152,  152,  152,  122,  123,  302,  111,  449,
			  129,  124,  125,  159,  167,  167,  167,  315,  186,  125,
			  167,  167,  167,  167,  167,  167,  167,  278,  186,  125,
			  167,  167,  167,  167,  167,  167,  167,  167,  167,  168,
			  168,  168,  234,  234,  234,  168,  168,  168,  168,  168,
			  168,  168,   93,  273,  300,  168,  168,  168,  168,  168,
			  168,  168,  168,  168,   59,   68,   59,   59,  171,  170,
			  132,  301,   93,  132,  126,  177,  178,  133,  169,  177,

			  178,  179,  180,  181,  181,  179,   97,   97,   97,  129,
			  269,  125,  127,  173,  122,  225,  125,  174,  133,  177,
			  178,  133,  182,  183,  183,  179,   99,   99,   99,  176,
			  176,  176,  252,  253,  253,  176,  176,  176,  176,  176,
			  176,  176,   93,  192,  125,  176,  176,  176,  176,  176,
			  176,  176,  176,  176,  177,  178,  138,  264,  138,  138,
			  179,  185,  121,  185,  185,  118,  187,  263,  188,  188,
			  188,  160,  161,  125,  160,  184,  101,  101,  101,  163,
			   93,  153,  401,   93,  153,  118,  144,  144,  154,  144,
			  144,  144,  257,  258,  258,  144,  144,  144,  144,  144, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  144,  144,  227,  227,  227,  144,  144,  144,  144,  144,
			  144,  144,  144,  144,   97,   97,   97,   97,   97,   97,
			  105,  162,  192,  105,  162,  197,  187,  106,   64,  193,
			  198,  250,  199,  199,  199,  199,  199,  199,   59,  171,
			   59,   59,  265,  266,  266,  126,  205,  206,  206,  185,
			  121,  185,  185,  389,  390,  201,  201,  201,  201,  201,
			  201,  201,  255,  127,  255,  255,  201,  201,  201,  201,
			  201,  201,  201,  201,  171,  209,  449,  161,  209,  232,
			  126,  207,  208,  208,  177,  215,  231,  216,  216,  216,
			  179,  177,  178,  263,  216,  216,  216,  179,  127,   68,

			  209,  125,  217,  209,   68,   68,   68,   68,  210,  210,
			   68,  210,  210,  210,   68,   68,   68,  210,  210,  210,
			  210,  210,  210,  210,  103,   68,  125,  210,  210,  210,
			  210,  210,  210,  210,  210,  210,   68,   68,   68,   68,
			   68,   68,   68,   68,   68,   68,   68,  392,  393,   68,
			  358,  177,  178,  133,  223,  223,  223,  179,  398,  399,
			  233,   64,  234,  234,  234,  122,  123,  379,  236,  237,
			  237,  124,  211,  212,  212,  212,  226,  235,  204,  212,
			  212,  212,  212,  212,  212,  212,  203,  226,  202,  212,
			  212,  212,  212,  212,  212,  212,  212,  212,  213,  213, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  213,  267,  267,  267,  213,  213,  213,  213,  213,  213,
			  213,  265,  265,  265,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  218,  200,  219,  218,  134,  134,  134,
			  220,  177,  221,   64,  222,  223,  223,  179,  177,  178,
			  238,  238,  238,  187,  288,  228,  228,  228,  194,  224,
			  239,  239,  239,  239,  239,  239,  239,   68,  191,  190,
			   68,  239,  239,  239,  239,  239,  239,  239,  239,  240,
			  240,  240,  257,  317,  258,  240,  240,  240,  240,  240,
			  240,  240,  172,  248,  121,  240,  240,  240,  240,  240,
			  240,  240,  240,  240,  241,  345,  346,  346,  171,  242,

			  126,  243,  243,  243,  126,  243,  243,  243,  244,  318,
			  263,  164,  318,  245,  126,  246,  247,  247,  127,  171,
			  125,  158,  127,  442,  215,  126,  247,  247,  247,  179,
			  177,  178,  127,  254,  254,  254,  179,  319,  370,  371,
			  371,  217,  155,  127,  251,  251,  251,  251,  251,  251,
			  251,  320,  321,  320,  320,  251,  251,  251,  251,  251,
			  251,  251,  251,  218,  103,  219,  218,  296,  297,  219,
			  220,  219,  219,  298,  177,  178,  255,  259,  260,  260,
			  179,  177,  178,   93,  260,  260,  260,  179,  318,  125,
			  220,  318,  255,  220,  177,  178,  197,  372,  372,  372, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  179,  198,  141,  237,  237,  237,  125,  256,  256,  256,
			  256,  256,  256,  256,  125,  137,  261,  358,  256,  256,
			  256,  256,  256,  256,  256,  256,  122,  123,   64,  374,
			  374,  374,  124,  125,  360,  236,  236,  236,  215,  262,
			  253,  253,  253,  179,  380,  380,  380,  177,  215,  262,
			  268,  268,  268,  179,   64,  217,  268,  268,  268,  268,
			  268,  268,  268,  118,  117,  217,  268,  268,  268,  268,
			  268,  268,  268,  268,  268,  171,  355,  115,  368,  171,
			  104,  126,  270,  271,  271,  126,  272,  272,  272,  171,
			  388,  388,  388,  357,  103,  126,  274,  275,  275,  127,

			  171,   93,   90,  127,   88,   87,  126,  276,  277,  277,
			  171,   85,  449,  127,  122,  123,  126,  277,  277,  277,
			  124,  449,  177,  178,  127,  281,  281,  281,  179,  303,
			  404,  404,  404,  449,  127,  279,  279,  279,  279,  279,
			  279,  279,  294,  355,  449,  449,  279,  279,  279,  279,
			  279,  279,  279,  279,  210,  210,  449,  280,  280,  280,
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
			  258,  258,  179,  122,  123,  405,  405,  405,  233,  124,
			  266,  266,  266,  289,  224,  241,  449,  449,  244,  449,
			  242,  126,  241,  245,  126,  235,  171,  242,  126,  271,
			  271,  271,  126,  270,  270,  270,  449,  449,  284,  127,
			  219,  284,  127,  449,  449,  285,  127,  244,  449,  449,

			  127,  171,  245,  126,  275,  275,  275,  126,  292,  274,
			  274,  171,  449,  449,  125,  449,  449,  126,  274,  274,
			  274,  127,  449,  449,  300,  127,  134,  134,  134,  449,
			   59,  449,   59,   59,  449,  127,  293,  293,  293,  449,
			  449,  301,  293,  293,  293,  293,  293,  293,  293,  416,
			  416,  416,  293,  293,  293,  293,  293,  293,  293,  293,
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
			  305,  305,  305,  305,  305,  305,  309,  309,  309,  422,
			  422,  422,  309,  309,  309,  309,  309,  309,  309,  397,
			  449,  449,  309,  309,  309,  309,  309,  309,  309,  309,
			  309,  313,  313,  313,  428,  428,  428,  313,  313,  313,
			  313,  313,  313,  313,  449,  449,  125,  313,  313,  313,
			  313,  313,  313,  313,  313,  313,  314,  314,  314,  430,
			  430,  430,  314,  314,  314,  314,  314,  314,  314,  408,
			  408,  408,  314,  314,  314,  314,  314,  314,  314,  314,
			  314,  316,  316,  316,  125,  449,  449,  316,  316,  316,

			  316,  316,  316,  316,  431,  431,  431,  316,  316,  316,
			  316,  316,  316,  316,  316,  316,  320,  321,  320,  320,
			  171,  425,  425,  425,  122,  123,  126,  274,  325,  275,
			  124,  323,  323,  323,  449,  449,  125,  323,  323,  323,
			  323,  323,  323,  323,  127,  449,  449,  323,  323,  323,
			  323,  323,  323,  323,  323,  323,  326,  326,  326,  326,
			  326,  326,  326,   59,  449,   59,   59,  326,  326,  326,
			  326,  326,  326,  326,  326,  332,  332,  332,  332,  332,
			  332,  332,  449,  449,  125,  449,  332,  332,  332,  332,
			  332,  332,  332,  332,  306,  411,  435,  435,  435,  307, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_nxt_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  126,  275,  275,  275,  294,  449,  449,  356,  356,  356,
			  449,   59,  294,   59,   59,  369,  369,  369,  127,  337,
			  337,  337,  361,  361,  361,  337,  337,  337,  337,  337,
			  337,  337,  448,  448,  448,  337,  337,  337,  337,  337,
			  337,  337,  337,  337,   68,  294,  449,   68,  378,  378,
			  378,  358,  449,  359,  359,  359,  395,  449,  388,  388,
			  388,  338,  338,  338,  338,  338,  338,  338,  360,  449,
			  248,  449,  338,  338,  338,  338,  338,  338,  338,  338,
			  341,  341,  341,  341,  341,  341,  341,  419,  419,  419,
			  449,  341,  341,  341,  341,  341,  341,  341,  341,  342,

			  342,  342,  383,  449,  449,  342,  342,  342,  342,  342,
			  342,  342,  419,  419,  419,  342,  342,  342,  342,  342,
			  342,  342,  342,  342,  347,  347,  347,  125,  449,  449,
			  347,  347,  347,  347,  347,  347,  347,  433,  433,  433,
			  347,  347,  347,  347,  347,  347,  347,  347,  347,  351,
			  351,  351,  125,  449,  449,  351,  351,  351,  351,  351,
			  351,  351,  430,  430,  430,  351,  351,  351,  351,  351,
			  351,  351,  351,  351,  354,  354,  354,  383,  449,  449,
			  354,  354,  354,  354,  354,  354,  354,  441,  441,  441,
			  354,  354,  354,  354,  354,  354,  354,  354,  354,  362, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_nxt_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  362,  362,  418,  449,  449,  362,  362,  362,  362,  362,
			  362,  362,  445,  445,  445,  362,  362,  362,  362,  362,
			  362,  362,  362,  362,  367,  368,  368,  445,  445,  445,
			  210,  210,  210,  210,  210,  210,  210,  449,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,   59,
			  446,   59,   59,  355,  449,  210,  210,  210,  373,  438,
			  361,  361,  361,  375,  375,  375,  375,  375,  375,  375,
			  357,  210,  210,  210,  375,  375,  375,  375,  375,  375,
			  375,  375,  377,  377,  377,  377,  377,  377,  377,  444,
			  449,  449,  449,  377,  377,  377,  377,  377,  377,  377,

			  377,  358,  449,  371,  371,  371,  449,  449,   59,  449,
			   59,   59,  382,  449,  374,  374,  374,  449,  379,  381,
			  381,  381,   59,  449,   59,   59,  449,  449,  449,  383,
			  384,  384,  384,  394,  394,  394,  384,  384,  384,  384,
			  384,  384,  384,  441,  441,  441,  384,  384,  384,  384,
			  384,  384,  384,  384,  384,  386,  386,  386,  125,  449,
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
			  402,   59,  403,   59,   59,  394,  394,  394,   59,  449,
			   59,   59,  409,  409,  409,  412,  449,  413,  449,  449,
			  404,  404,  404,  414,  449,  405,  405,  405,  417,  449,
			  408,  408,  408,  449,  449,  410,   59,  410,   59,   59,
			  415,   59,  449,   59,   59,  418,  449,  409,  409,  409,

			  449,  449,  409,  409,  409,  423,  449,  416,  416,  416,
			  427,  449,  422,  422,  422,  429,  449,  425,  425,  425,
			  449,  432,  424,  428,  428,  428,  449,  449,  412,  449,
			  434,  449,  125,  431,  431,  431,  436,  449,  437,  449,
			  449,  433,  433,  433,  439,  449,  440,  449,  449,  435,
			  435,  435,  441,  441,  441,  449,  125,  445,  445,  445,
			  449,  448,  448,  448,  449,  449,  449,  125,  449,  449,
			  449,  449,  424,  449,  449,  442,  415,   27,   27,   27,
			   27,   27,   27,   27,   27,   27,   27,   27,   27,   27,
			   27,   27,   27,   27,   27,   27,   27,   27,   27,   37, yy_Dummy>>,
			1, 200, 2400)
		end

	yy_nxt_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   37,   37,   37,   37,   37,   37,   37,   37,   37,   37,
			   37,   37,   37,   37,   37,   37,   37,   37,   37,   37,
			   37,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   58,   58,  449,   58,   58,  449,   58,
			   58,   58,   58,   58,   58,   58,   58,  449,   58,   58,
			   58,   58,   58,   58,   58,   63,   63,  449,   63,   63,
			   63,   63,   63,   63,   63,   63,   63,   63,   63,   63,
			  449,   63,   63,   63,   63,   63,   63,   77,   77,   77,
			   77,   77,  449,   77,   77,   77,   77,   77,   77,   77,

			   77,  449,   77,   77,   77,   77,   77,   77,   77,   91,
			   91,   91,   91,   91,   91,   91,  449,  449,  449,   91,
			   91,   91,   91,   92,   92,  449,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,  449,   92,
			   92,   92,   92,   92,   92,  102,  102,  449,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  449,  102,  102,  102,  102,  102,  102,  107,  449,  449,
			  107,  449,  107,  449,  107,  107,  107,  107,  109,  449,
			  449,  109,  449,  449,  449,  449,  109,  109,  109,  109,
			  109,  449,  449,  449,  109,  109,  109,  109,  109,  116, yy_Dummy>>,
			1, 200, 2600)
		end

	yy_nxt_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  116,  116,  116,  116,  449,  449,  449,  116,  116,  116,
			  116,   66,   66,   66,   66,   66,   66,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,   66,   66,   66,   66,
			   66,   66,   66,   68,   68,  449,  449,   68,   68,   68,
			   68,   68,   68,   68,   68,   68,   68,  449,   68,   68,
			   68,   68,   68,   68,   68,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  118,

			  118,  118,  118,  118,  118,  118,  118,  118,  118,  118,
			  118,  118,  118,  118,  118,  118,  118,  118,  118,  118,
			  118,  126,  126,  449,  449,  126,  126,  126,  126,  126,
			  126,  126,  126,  126,  126,  126,  126,  126,  126,  126,
			  126,  126,  126,  129,  449,  449,  449,  129,  129,  129,
			  129,  129,  129,  129,  129,  129,  129,  129,  129,  449,
			  129,  129,  129,  129,  129,  139,  139,  139,  139,  139,
			  139,  139,  139,  139,  139,  139,  139,  139,  139,  139,
			  139,  139,  139,  139,  139,  139,  139,  156,  449,  449,
			  156,  449,  156,  449,  156,  156,  156,  156,  189,  189, yy_Dummy>>,
			1, 200, 2800)
		end

	yy_nxt_template_16 (an_array: ARRAY [INTEGER])
			-- Fill chunk #16 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  449,  189,  189,  189,  189,  189,  189,  189,  189,  189,
			  189,  189,  189,  449,  189,  189,  189,  189,  189,  189,
			  230,  230,  230,  230,  230,  449,  449,  449,  230,  230,
			  230,  230,  194,  194,  194,  194,  194,  194,  194,  194,
			  194,  194,  194,  194,  194,  194,  194,  194,  194,  194,
			  194,  194,  194,  194,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  282,  449,  282,  282,
			  449,  449,  449,  340,  340,  449,  449,  282,  282,  340,
			  340,  340,  449,  282,  282,  282,  295,  295,  295,  295,

			  295,  449,  449,  449,  295,  295,  295,  295,  328,  328,
			  328,  328,  328,  449,  449,  449,  328,  328,  328,  328,
			  329,  329,  329,  329,  329,  449,  352,  352,  329,  329,
			  329,  329,  352,  352,  352,  353,  353,  353,  353,  353,
			  449,  449,  449,  353,  353,  353,  353,  365,  365,  365,
			  365,  365,  449,  385,  385,  365,  365,  365,  365,  385,
			  385,  385,  391,  391,  391,  391,  391,  449,  449,  449,
			  391,  391,  391,  391,  406,  406,  406,  406,  406,  449,
			  449,  449,  406,  406,  406,  406,   13,  449,  449,  449,
			  449,  449,  449,  449,  449,  449,  449,  449,  449,  449, yy_Dummy>>,
			1, 200, 3000)
		end

	yy_nxt_template_17 (an_array: ARRAY [INTEGER])
			-- Fill chunk #17 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  449,  449,  449,  449,  449,  449,  449,  449,  449,  449,
			  449,  449,  449,  449,  449,  449,  449,  449,  449,  449,
			  449,  449,  449,  449,  449,  449,  449,  449,  449,  449,
			  449,  449,  449,  449, yy_Dummy>>,
			1, 34, 3200)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 3233)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			yy_chk_template_3 (an_array)
			yy_chk_template_4 (an_array)
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
			yy_chk_template_16 (an_array)
			yy_chk_template_17 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    2,   17,
			    2,    2,   14,   40,   14,   14,  447,   67,   67,    2,
			    2,    2,   42,   67,  440,    2,    2,    2,    2,    2,
			    2,    2,  421,   17,   40,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    3,    3,   19,    3,   19,   19,
			   65,    3,    3,   15,   15,   15,   15,  415,   42,    3,

			   44,   15,   16,   16,   16,   16,   23,   23,   23,   23,
			    3,  413,    3,    4,    4,   18,    4,   18,   18,   65,
			    4,    4,  322,   18,   22,   22,   22,   22,    4,  322,
			  399,   38,   22,   38,   38,   44,   44,  211,  365,    4,
			  211,    4,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    7,
			   28,   28,    7,   28,  131,   33,   33,   28,   33,  147, yy_Dummy>>,
			1, 200, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   69,  357,   33,   69,   41,   28,  131,   43,  354,   49,
			   33,   45,   49,    7,   50,   74,   49,   50,   58,   74,
			   58,   58,   59,  168,   59,   59,   69,  353,  168,    7,
			    7,    7,    7,    7,    8,  147,   69,    8,   41,   41,
			   41,   43,   43,   43,   50,   45,   45,   45,  351,  127,
			   50,   88,   88,   88,   51,  127,  154,   51,    8,  154,
			  154,   51,   60,   60,   60,   60,   61,   61,   61,   61,
			   60,  323,  323,  127,    8,    8,    8,    8,    8,    9,
			   51,  265,  103,    9,    9,  103,    9,    9,    9,  103,
			  350,    9,   66,   66,   66,   66,   66,  342,  265,    9,

			   77,   77,   77,   77,   84,   84,   78,   78,   78,   78,
			   84,  328,    9,   10,   78,  319,   66,   10,   10,  213,
			   10,   10,   10,  119,  213,   10,   79,   79,   79,   79,
			  119,  119,  119,   10,   80,   80,   80,   80,   81,   81,
			   81,   81,   80,  143,  143,  143,   10,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   20,  313,   20,   20,   94,  236, yy_Dummy>>,
			1, 200, 200)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   94,   94,  134,  134,  236,   20,   20,   20,  134,  337,
			  337,   20,   20,   20,   20,   20,   20,   20,  164,  164,
			  164,   20,   20,   20,   20,   20,   20,   20,   20,   20,
			   21,   21,  347,  347,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,  312,   21,  309,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   24,   24,   24,
			   24,   24,  306,   24,   24,   24,   24,   24,   24,   24,
			   24,   24,   24,   24,   24,   24,   24,   24,   24,   24,

			   24,   24,  149,   24,   24,   24,   24,   24,   24,   24,
			   24,   24,   24,   24,   24,   24,   24,   24,   24,   24,
			   24,   24,   24,   24,   25,   25,   25,  179,  362,  362,
			   25,   25,   25,   25,   25,   25,   25,  149,  149,  179,
			   25,   25,   25,   25,   25,   25,   25,   25,   25,   70,
			   70,  384,  384,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   71,   71,  386,  386, yy_Dummy>>,
			1, 200, 400)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,  304,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   72,   86,   86,   72,   86,   98,  249,
			   72,   86,  249,  293,   72,   72,   72,  290,   99,   86,
			   72,   72,   72,   72,   72,   72,   72,  187,  187,  187,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   73,
			   73,   73,   98,   98,   98,   73,   73,   73,   73,   73,
			   73,   73,   99,   99,   99,   73,   73,   73,   73,   73,

			   73,   73,   73,   73,   85,   85,   89,   89,  105,   89,
			   85,  105,  314,   89,  437,  105,  107,  314,   85,  107,
			  437,   89,  280,  107,  120,  120,  120,  120,  278,   85,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   97,  106,  112,
			  268,  106,  112,  391,  391,  100,  112,  106,  101,  106,
			  106,  106,  108,  109,  106,  108,  109,  113,  329,  264, yy_Dummy>>,
			1, 200, 600)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  113,  114,  114,  329,  114,  112,  126,  109,  114,  114,
			  126,  188,  188,  188,   97,   97,   97,   97,   97,  100,
			  100,  100,  101,  101,  101,  140,  140,  288,  108,  109,
			  126,  140,  126,  113,  122,  122,  122,  298,  140,  288,
			  122,  122,  122,  122,  122,  122,  122,  248,  140,  298,
			  122,  122,  122,  122,  122,  122,  122,  122,  122,  123,
			  123,  123,  196,  196,  196,  123,  123,  123,  123,  123,
			  123,  123,  146,  244,  317,  123,  123,  123,  123,  123,
			  123,  123,  123,  123,  124,  128,  124,  124,  130,  128,
			  132,  317,  148,  132,  130,  184,  184,  132,  124,  135,

			  135,  184,  135,  135,  135,  135,  146,  146,  146,  128,
			  241,  128,  130,  130,  240,  184,  132,  130,  133,  136,
			  136,  133,  136,  136,  136,  136,  148,  148,  148,  133,
			  133,  133,  215,  215,  215,  133,  133,  133,  133,  133,
			  133,  133,  150,  232,  133,  133,  133,  133,  133,  133,
			  133,  133,  133,  133,  137,  137,  138,  231,  138,  138,
			  137,  139,  139,  139,  139,  139,  142,  230,  142,  142,
			  142,  160,  160,  393,  160,  137,  150,  150,  150,  160,
			  151,  153,  393,  152,  153,  139,  144,  144,  153,  144,
			  144,  144,  221,  221,  221,  144,  144,  144,  144,  144, yy_Dummy>>,
			1, 200, 800)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  144,  144,  229,  229,  229,  144,  144,  144,  144,  144,
			  144,  144,  144,  144,  151,  151,  151,  152,  152,  152,
			  156,  162,  162,  156,  162,  165,  227,  156,  166,  162,
			  165,  212,  165,  165,  165,  166,  166,  166,  169,  173,
			  169,  169,  233,  233,  233,  173,  173,  173,  173,  185,
			  185,  185,  185,  396,  396,  169,  169,  169,  169,  169,
			  169,  169,  255,  173,  255,  255,  169,  169,  169,  169,
			  169,  169,  169,  169,  174,  209,  346,  194,  209,  193,
			  174,  174,  174,  174,  180,  180,  191,  180,  180,  180,
			  180,  181,  181,  346,  181,  181,  181,  181,  174,  175,

			  175,  209,  180,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,  175,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,  175,  175,  189,  175,  175,  175,  175,  175,
			  175,  175,  175,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,  175,  175,  175,  175,  176,  400,  400,  176,
			  370,  183,  183,  176,  183,  183,  183,  183,  406,  406,
			  195,  198,  195,  195,  195,  186,  186,  370,  198,  198,
			  198,  186,  176,  177,  177,  177,  186,  195,  172,  177,
			  177,  177,  177,  177,  177,  177,  171,  186,  170,  177,
			  177,  177,  177,  177,  177,  177,  177,  177,  178,  178, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  178,  234,  234,  234,  178,  178,  178,  178,  178,  178,
			  178,  267,  267,  267,  178,  178,  178,  178,  178,  178,
			  178,  178,  178,  182,  167,  182,  182,  287,  287,  287,
			  182,  182,  182,  199,  182,  182,  182,  182,  261,  261,
			  199,  199,  199,  228,  261,  228,  228,  228,  163,  182,
			  200,  200,  200,  200,  200,  200,  200,  210,  158,  157,
			  210,  200,  200,  200,  200,  200,  200,  200,  200,  201,
			  201,  201,  300,  300,  300,  201,  201,  201,  201,  201,
			  201,  201,  129,  210,  118,  201,  201,  201,  201,  201,
			  201,  201,  201,  201,  205,  334,  334,  334,  206,  205,

			  205,  205,  205,  205,  206,  206,  206,  206,  207,  302,
			  334,  117,  302,  207,  207,  207,  207,  207,  205,  208,
			  443,  110,  206,  443,  252,  208,  208,  208,  208,  252,
			  216,  216,  207,  216,  216,  216,  216,  302,  358,  358,
			  358,  252,  104,  208,  214,  214,  214,  214,  214,  214,
			  214,  320,  320,  320,  320,  214,  214,  214,  214,  214,
			  214,  214,  214,  218,  102,  218,  218,  283,  283,  219,
			  218,  219,  219,  283,  222,  222,  219,  222,  222,  222,
			  222,  223,  223,   92,  223,  223,  223,  223,  318,  218,
			  220,  318,  220,  220,  225,  225,  237,  359,  359,  359, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  225,  237,   87,  237,  237,  237,   76,  220,  220,  220,
			  220,  220,  220,  220,  318,   75,  225,  380,  220,  220,
			  220,  220,  220,  220,  220,  220,  226,  226,  238,  363,
			  363,  363,  226,   68,  380,  238,  238,  238,  253,  226,
			  253,  253,  253,  253,  372,  372,  372,  281,  281,  226,
			  239,  239,  239,  281,   63,  253,  239,  239,  239,  239,
			  239,  239,  239,   62,   57,  281,  239,  239,  239,  239,
			  239,  239,  239,  239,  239,  242,  368,   54,  368,  243,
			   48,  242,  242,  242,  242,  243,  243,  243,  243,  245,
			  382,  382,  382,  368,   47,  245,  245,  245,  245,  242,

			  246,   37,   34,  243,   31,   29,  246,  246,  246,  246,
			  247,   26,   13,  245,  289,  289,  247,  247,  247,  247,
			  289,    0,  254,  254,  246,  254,  254,  254,  254,  289,
			  395,  395,  395,    0,  247,  250,  250,  250,  250,  250,
			  250,  250,  378,  378,    0,    0,  250,  250,  250,  250,
			  250,  250,  250,  250,  251,  251,    0,  251,  251,  251,
			  378,    0,    0,  251,  251,  251,  251,  251,  251,  251,
			    0,    0,  251,  251,  251,  251,  251,  251,  251,  251,
			  251,  251,  256,  295,  295,    0,  256,  256,  256,  295,
			    0,    0,  256,  256,  256,  256,  256,  256,  256,    0, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_chk_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,  256,  256,  256,  256,  256,  256,  256,  256,  256,
			  256,  257,    0,  257,  257,  316,  316,    0,  257,    0,
			  257,  316,    0,  259,  259,  257,  259,  259,  259,  259,
			  260,  260,    0,  260,  260,  260,  260,  257,  258,  333,
			  258,  258,  333,  333,  333,  258,    0,  258,    0,  258,
			  258,  258,  258,  262,  262,  397,  397,  397,  266,  262,
			  266,  266,  266,  262,  258,  270,    0,    0,  274,    0,
			  270,  270,  271,  274,  274,  266,  272,  271,  271,  271,
			  271,  271,  272,  272,  272,  272,    0,    0,  284,  270,
			  284,  284,  274,    0,    0,  284,  271,  275,    0,    0,

			  272,  276,  275,  275,  275,  275,  275,  276,  276,  276,
			  276,  277,    0,    0,  284,    0,    0,  277,  277,  277,
			  277,  275,    0,    0,  286,  276,  286,  286,  286,    0,
			  336,    0,  336,  336,    0,  277,  279,  279,  279,    0,
			    0,  286,  279,  279,  279,  279,  279,  279,  279,  407,
			  407,  407,  279,  279,  279,  279,  279,  279,  279,  279,
			  279,  285,  292,  285,  285,  336,    0,  292,  292,    0,
			  343,  343,    0,  343,  343,  343,    0,    0,  285,  285,
			  285,  285,  285,  285,  285,    0,  292,  285,  343,  285,
			  285,  285,  285,  285,  285,  285,  285,  291,  291,  291, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_chk_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  291,  291,  291,  291,    0,  390,  390,  390,  291,  291,
			  291,  291,  291,  291,  291,  291,  294,  294,  294,  414,
			  414,  414,  294,  294,  294,  294,  294,  294,  294,  390,
			    0,    0,  294,  294,  294,  294,  294,  294,  294,  294,
			  294,  296,  296,  296,  423,  423,  423,  296,  296,  296,
			  296,  296,  296,  296,    0,    0,  296,  296,  296,  296,
			  296,  296,  296,  296,  296,  296,  297,  297,  297,  426,
			  426,  426,  297,  297,  297,  297,  297,  297,  297,  401,
			  401,  401,  297,  297,  297,  297,  297,  297,  297,  297,
			  297,  299,  299,  299,  401,    0,    0,  299,  299,  299,

			  299,  299,  299,  299,  427,  427,  427,  299,  299,  299,
			  299,  299,  299,  299,  299,  299,  303,  303,  303,  303,
			  307,  417,  417,  417,  303,  303,  307,  307,  307,  307,
			  303,  305,  305,  305,    0,    0,  417,  305,  305,  305,
			  305,  305,  305,  305,  307,    0,    0,  305,  305,  305,
			  305,  305,  305,  305,  305,  305,  308,  308,  308,  308,
			  308,  308,  308,  403,    0,  403,  403,  308,  308,  308,
			  308,  308,  308,  308,  308,  315,  315,  315,  315,  315,
			  315,  315,    0,    0,  315,    0,  315,  315,  315,  315,
			  315,  315,  315,  315,  325,  403,  432,  432,  432,  325, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_chk_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  325,  325,  325,  325,  344,    0,    0,  344,  344,  344,
			    0,  348,  356,  348,  348,  356,  356,  356,  325,  326,
			  326,  326,  348,  348,  348,  326,  326,  326,  326,  326,
			  326,  326,  444,  444,  444,  326,  326,  326,  326,  326,
			  326,  326,  326,  326,  327,  369,    0,  327,  369,  369,
			  369,  345,    0,  345,  345,  345,  388,    0,  388,  388,
			  388,  327,  327,  327,  327,  327,  327,  327,  345,    0,
			  327,    0,  327,  327,  327,  327,  327,  327,  327,  327,
			  331,  331,  331,  331,  331,  331,  331,  419,  419,  419,
			    0,  331,  331,  331,  331,  331,  331,  331,  331,  332,

			  332,  332,  419,    0,    0,  332,  332,  332,  332,  332,
			  332,  332,  420,  420,  420,  332,  332,  332,  332,  332,
			  332,  332,  332,  332,  335,  335,  335,  420,    0,    0,
			  335,  335,  335,  335,  335,  335,  335,  429,  429,  429,
			  335,  335,  335,  335,  335,  335,  335,  335,  335,  338,
			  338,  338,  429,    0,    0,  338,  338,  338,  338,  338,
			  338,  338,  430,  430,  430,  338,  338,  338,  338,  338,
			  338,  338,  338,  338,  341,  341,  341,  430,    0,    0,
			  341,  341,  341,  341,  341,  341,  341,  441,  441,  441,
			  341,  341,  341,  341,  341,  341,  341,  341,  341,  349, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_chk_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  349,  349,  441,    0,    0,  349,  349,  349,  349,  349,
			  349,  349,  446,  446,  446,  349,  349,  349,  349,  349,
			  349,  349,  349,  349,  355,  355,  355,  439,  439,  439,
			  355,  355,  355,  355,  355,  355,  355,    0,  434,  434,
			  434,  355,  355,  355,  355,  355,  355,  355,  355,  361,
			  439,  361,  361,  367,    0,  367,  367,  367,  361,  434,
			  361,  361,  361,  364,  364,  364,  364,  364,  364,  364,
			  367,  438,  438,  438,  364,  364,  364,  364,  364,  364,
			  364,  364,  366,  366,  366,  366,  366,  366,  366,  438,
			    0,    0,    0,  366,  366,  366,  366,  366,  366,  366,

			  366,  371,    0,  371,  371,  371,    0,    0,  373,    0,
			  373,  373,  374,    0,  374,  374,  374,    0,  371,  373,
			  373,  373,  387,    0,  387,  387,    0,    0,    0,  374,
			  375,  375,  375,  387,  387,  387,  375,  375,  375,  375,
			  375,  375,  375,  442,  442,  442,  375,  375,  375,  375,
			  375,  375,  375,  375,  375,  377,  377,  377,  442,    0,
			    0,  377,  377,  377,  377,  377,  377,  377,    0,    0,
			    0,  377,  377,  377,  377,  377,  377,  377,  377,  377,
			  381,    0,  381,  381,  412,  412,  412,    0,    0,  381,
			    0,  381,  381,  381,  389,  389,  389,    0,    0,  412, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_chk_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  389,  389,  389,  389,  389,  389,  389,  412,    0,    0,
			  389,  389,  389,  389,  389,  389,  389,  389,  389,  392,
			  392,  392,    0,    0,    0,  392,  392,  392,  392,  392,
			  392,  392,    0,    0,    0,  392,  392,  392,  392,  392,
			  392,  392,  392,  392,  394,    0,  394,  394,    0,    0,
			  394,  402,  394,  402,  402,  394,  394,  394,  411,    0,
			  411,  411,  402,  402,  402,  404,    0,  404,    0,    0,
			  404,  404,  404,  405,    0,  405,  405,  405,  408,    0,
			  408,  408,  408,    0,    0,  402,  409,  411,  409,  409,
			  405,  410,    0,  410,  410,  408,    0,  409,  409,  409,

			    0,    0,  410,  410,  410,  416,    0,  416,  416,  416,
			  422,    0,  422,  422,  422,  425,    0,  425,  425,  425,
			    0,  428,  416,  428,  428,  428,    0,    0,  431,    0,
			  431,    0,  425,  431,  431,  431,  433,    0,  433,    0,
			    0,  433,  433,  433,  435,    0,  435,    0,    0,  435,
			  435,  435,  436,  436,  436,    0,  433,  445,  445,  445,
			    0,  448,  448,  448,    0,    0,    0,  436,    0,    0,
			    0,    0,  445,    0,    0,  436,  448,  450,  450,  450,
			  450,  450,  450,  450,  450,  450,  450,  450,  450,  450,
			  450,  450,  450,  450,  450,  450,  450,  450,  450,  451, yy_Dummy>>,
			1, 200, 2400)
		end

	yy_chk_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  451,  451,  451,  451,  451,  451,  451,  451,  451,  451,
			  451,  451,  451,  451,  451,  451,  451,  451,  451,  451,
			  451,  452,  452,  452,  452,  452,  452,  452,  452,  452,
			  452,  452,  452,  452,  452,  452,  452,  452,  452,  452,
			  452,  452,  452,  453,  453,    0,  453,  453,    0,  453,
			  453,  453,  453,  453,  453,  453,  453,    0,  453,  453,
			  453,  453,  453,  453,  453,  454,  454,    0,  454,  454,
			  454,  454,  454,  454,  454,  454,  454,  454,  454,  454,
			    0,  454,  454,  454,  454,  454,  454,  455,  455,  455,
			  455,  455,    0,  455,  455,  455,  455,  455,  455,  455,

			  455,    0,  455,  455,  455,  455,  455,  455,  455,  456,
			  456,  456,  456,  456,  456,  456,    0,    0,    0,  456,
			  456,  456,  456,  457,  457,    0,  457,  457,  457,  457,
			  457,  457,  457,  457,  457,  457,  457,  457,    0,  457,
			  457,  457,  457,  457,  457,  458,  458,    0,  458,  458,
			  458,  458,  458,  458,  458,  458,  458,  458,  458,  458,
			    0,  458,  458,  458,  458,  458,  458,  459,    0,    0,
			  459,    0,  459,    0,  459,  459,  459,  459,  460,    0,
			    0,  460,    0,    0,    0,    0,  460,  460,  460,  460,
			  460,    0,    0,    0,  460,  460,  460,  460,  460,  461, yy_Dummy>>,
			1, 200, 2600)
		end

	yy_chk_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  461,  461,  461,  461,    0,    0,    0,  461,  461,  461,
			  461,  462,  462,  462,  462,  462,  462,  462,  462,  462,
			  462,  462,  462,  462,  462,  462,  462,  462,  462,  462,
			  462,  462,  462,  463,  463,    0,    0,  463,  463,  463,
			  463,  463,  463,  463,  463,  463,  463,    0,  463,  463,
			  463,  463,  463,  463,  463,  464,  464,  464,  464,  464,
			  464,  464,  464,  464,  464,  464,  464,  464,  464,  464,
			  464,  464,  464,  464,  464,  464,  464,  465,  465,  465,
			  465,  465,  465,  465,  465,  465,  465,  465,  465,  465,
			  465,  465,  465,  465,  465,  465,  465,  465,  465,  466,

			  466,  466,  466,  466,  466,  466,  466,  466,  466,  466,
			  466,  466,  466,  466,  466,  466,  466,  466,  466,  466,
			  466,  467,  467,    0,    0,  467,  467,  467,  467,  467,
			  467,  467,  467,  467,  467,  467,  467,  467,  467,  467,
			  467,  467,  467,  468,    0,    0,    0,  468,  468,  468,
			  468,  468,  468,  468,  468,  468,  468,  468,  468,    0,
			  468,  468,  468,  468,  468,  469,  469,  469,  469,  469,
			  469,  469,  469,  469,  469,  469,  469,  469,  469,  469,
			  469,  469,  469,  469,  469,  469,  469,  470,    0,    0,
			  470,    0,  470,    0,  470,  470,  470,  470,  471,  471, yy_Dummy>>,
			1, 200, 2800)
		end

	yy_chk_template_16 (an_array: ARRAY [INTEGER])
			-- Fill chunk #16 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,  471,  471,  471,  471,  471,  471,  471,  471,  471,
			  471,  471,  471,    0,  471,  471,  471,  471,  471,  471,
			  472,  472,  472,  472,  472,    0,    0,    0,  472,  472,
			  472,  472,  473,  473,  473,  473,  473,  473,  473,  473,
			  473,  473,  473,  473,  473,  473,  473,  473,  473,  473,
			  473,  473,  473,  473,  474,  474,  474,  474,  474,  474,
			  474,  474,  474,  474,  474,  474,  474,  474,  474,  474,
			  474,  474,  474,  474,  474,  474,  475,    0,  475,  475,
			    0,    0,    0,  479,  479,    0,    0,  475,  475,  479,
			  479,  479,    0,  475,  475,  475,  476,  476,  476,  476,

			  476,    0,    0,    0,  476,  476,  476,  476,  477,  477,
			  477,  477,  477,    0,    0,    0,  477,  477,  477,  477,
			  478,  478,  478,  478,  478,    0,  480,  480,  478,  478,
			  478,  478,  480,  480,  480,  481,  481,  481,  481,  481,
			    0,    0,    0,  481,  481,  481,  481,  482,  482,  482,
			  482,  482,    0,  483,  483,  482,  482,  482,  482,  483,
			  483,  483,  484,  484,  484,  484,  484,    0,    0,    0,
			  484,  484,  484,  484,  485,  485,  485,  485,  485,    0,
			    0,    0,  485,  485,  485,  485,  449,  449,  449,  449,
			  449,  449,  449,  449,  449,  449,  449,  449,  449,  449, yy_Dummy>>,
			1, 200, 3000)
		end

	yy_chk_template_17 (an_array: ARRAY [INTEGER])
			-- Fill chunk #17 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  449,  449,  449,  449,  449,  449,  449,  449,  449,  449,
			  449,  449,  449,  449,  449,  449,  449,  449,  449,  449,
			  449,  449,  449,  449,  449,  449,  449,  449,  449,  449,
			  449,  449,  449,  449, yy_Dummy>>,
			1, 34, 3200)
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
			    0,    0,   46,   82,  111,  141,    0,  186,  231,  273,
			  307,  346,    0, 1512,   50,   91,  100,   43,  113,   84,
			  392,  429,  122,  104,  476,  511, 1489, 3186,  188, 1495,
			 3186, 1469, 3186,  193, 1492,    0, 3186, 1495,  129, 3186,
			   47,  198,   56,  201,   94,  205, 3186, 1488, 1470,  207,
			  212,  252, 3186, 3186, 1449, 3186,    0, 1434,  216,  220,
			  260,  264, 1453, 1448, 3186,   84,  290,   47, 1405,  198,
			  548,  595,  641,  666,  184, 1382, 1378,  298,  304,  324,
			  332,  336, 3186,    0,  294,  694,  642, 1399,  238,  704,
			  729,    0, 1377, 3186,  396, 3186, 3186,  771,  642,  652,

			  779,  782, 1358,  280, 1339,  706,  776,  714,  790,  791,
			 1288, 3186,  777,  795,  799, 3186,    0, 1276, 1281,  317,
			  722, 3186,  821,  846,  882, 3186,  804,  243,  883, 1276,
			  882,  178,  888,  916,  392,  889,  909,  944,  954,  959,
			  815, 3186,  955,  330,  976, 3186,  866,  193,  886,  496,
			  936,  974,  977,  979,  254, 3186, 1018, 1243, 1227, 3186,
			  969, 3186, 1019, 1238,  405, 1019, 1022, 1214,  212, 1036,
			 1160, 1158, 1150, 1033, 1068, 1098, 1144, 1160, 1185,  511,
			 1074, 1081, 1221, 1141,  885, 1047, 1155,  654,  798, 1118,
			    0, 1056, 3186, 1069, 1074, 1149,  849, 3186, 1155, 1227, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1231, 1256, 3186, 3186, 3186, 1288, 1292, 1302, 1313, 1073,
			 1255,  135, 1021,  308, 1325,  919, 1320, 3186, 1361, 1367,
			 1388,  979, 1364, 1371, 3186, 1384, 1416, 1015, 1232,  989,
			  939,  925,  940, 1029, 1188, 3186,  393, 1390, 1422, 1437,
			  904,  882, 1469, 1473,  845, 1483, 1494, 1504,  819,  647,
			 1516, 1544, 1313, 1427, 1512, 1060, 1573, 1609, 1636, 1613,
			 1620, 1228, 1643, 3186,  783,  270, 1647, 1198,  769, 3186,
			 1659, 1666, 1670, 3186, 1662, 1691, 1695, 1705,  700, 1723,
			  712, 1437,    0, 1357, 1686, 1759, 1713, 1214,  811, 1504,
			  641, 1778, 1756,  642, 1803, 1573, 1828, 1853,  821, 1878,

			 1259, 3186, 1307, 1914,  591, 1918,  454, 1914, 1937,  447,
			    0,    0,  439,  385,  701, 1956, 1605,  863, 1386,  280,
			 1349, 3186,   94,  261, 3186, 1988, 2006, 2042,  301,  787,
			    0, 2061, 2086, 1629, 1282, 2111, 1728,  399, 2136,    0,
			    0, 2161,  287, 1760, 1994, 2040, 1065,  422, 2009, 2186,
			  253,  237,    0,  217,  197, 2211, 2002,  173, 1325, 1384,
			 3186, 2247,  518, 1416, 2244,  127, 2263, 2242, 1465, 2035,
			 1139, 2290, 1431, 2306, 2301, 2317,    0, 2342, 1532, 3186,
			 1406, 2378, 1477, 3186,  541,    0,  588, 2320, 2045, 2381,
			 1792,  773, 2406,  945, 2442, 1517, 1043, 1642,    0,   93, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1137, 1866, 2449, 1961, 2457, 2462, 1148, 1736, 2467, 2484,
			 2489, 2456, 2371,   77, 1806,   69, 2494, 1908, 3186, 2074,
			 2099,   41, 2499, 1831, 3186, 2504, 1856, 1891, 2510, 2124,
			 2149, 2520, 1983, 2528, 2225, 2536, 2539,  686, 2258, 2214,
			   30, 2174, 2330, 1292, 2019, 2544, 2199,   25, 2548, 3186,
			 2576, 2598, 2620, 2642, 2664, 2686, 2701, 2722, 2744, 2765,
			 2776, 2789, 2810, 2832, 2854, 2876, 2898, 2920, 2942, 2964,
			 2985, 2997, 3010, 3031, 3053, 3074, 3086, 3098, 3110, 3070,
			 3113, 3125, 3137, 3140, 3152, 3164, yy_Dummy>>,
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
			  449,  463,  463,  463,  355,  449,  449,  449,  355,    0,
			  449,  449,  449,  449,  449,  449,  449,  449,  449,  449,
			  449,  449,  449,  449,  449,  449,  449,  449,  449,  449,
			  449,  449,  449,  449,  449,  449,  449,  449,  449,  449,
			  449,  449,  449,  449,  449,  449, yy_Dummy>>,
			1, 86, 400)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 256)
			yy_ec_template_1 (an_array)
			yy_ec_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
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
			   42,   42,    1,    1,   43,   43,   43,   43,   43,   43, yy_Dummy>>,
			1, 200, 0)
		end

	yy_ec_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			   43,   43,   43,   43,   43,   43,   43,   43,   43,   43,
			   43,   43,   43,   43,   43,   43,   43,   43,   43,   43,
			   43,   43,   43,   43,   44,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   46,   47,   47,   47,   47,   47,   47,   47,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>,
			1, 57, 200)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    3,    4,    5,    6,    1,    1,    7,
			    8,    9,    1,   10,   11,   12,    1,    1,    7,   13,
			   13,   13,   13,   13,   13,   14,   15,   16,   17,   18,
			   13,   13,   13,   13,   13,   19,   20,   21,   22,    1,
			    1,    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
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

	yyJam_base: INTEGER = 3186
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 449
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 450
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
