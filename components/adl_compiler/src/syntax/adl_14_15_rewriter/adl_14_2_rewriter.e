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
--|#line 278 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 278")
end

when 39 then
--|#line 280 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 280")
end

		out_buffer.append (text)
		set_start_condition (INITIAL)
	
when 40 then
--|#line 285 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 285")
end
	-- Catch-all rules (no backing up)
				set_start_condition (INITIAL)
	
when 41 then
--|#line 292 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 292")
end

	out_buffer.append (text)
	set_start_condition (IN_PATH)

when 42 then
--|#line 297 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 297")
end

	out_buffer.append (text)
	set_start_condition (IN_PATH)

when 43 then
--|#line 303 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 303")
end
 
		out_buffer.append (text)
	
when 44 then
--|#line 307 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 307")
end
 
		out_buffer.append_character ('[')
		output_new_id_code (text_substring (2, text_count - 1))
		out_buffer.append_character (']')
	
when 45 then
--|#line 313 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 313")
end

		out_buffer.append (text)
	
when 46 then
--|#line 317 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 317")
end

		out_buffer.append (text)
		set_start_condition (INITIAL)
	
when 47 then
--|#line 322 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 322")
end

		out_buffer.append (text)
		set_start_condition (INITIAL)
	
when 48 then
--|#line 330 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 330")
end
out_buffer.append (text)
when 49 then
--|#line 332 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 332")
end
out_buffer.append (text)
when 50 then
--|#line 338 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 338")
end

		out_buffer.append (text)
	
when 51 then
--|#line 344 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 344")
end

		out_buffer.append (text)
	
when 52 then
--|#line 349 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 349")
end
			-- can occur in some string data
		out_buffer.append_character ('"')
		output_new_value_code (text_substring (2, text_count - 1))
		out_buffer.append_character ('"')
	
when 53 then
--|#line 355 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 355")
end

		out_buffer.append (text)
	
when 54 then
--|#line 359 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 359")
end
				-- beginning of a string
		out_buffer.append (text)
		set_start_condition (IN_STR)
	
when 55 then
--|#line 365 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 365")
end
out_buffer.append (text)
when 56 then
--|#line 367 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 367")
end
out_buffer.append (text)
when 57 then
--|#line 369 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 369")
end

				out_buffer.append (text)
	
when 58 then
--|#line 373 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 373")
end
out_buffer.append (text)
when 59 then
--|#line 375 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 375")
end

				out_buffer.append (text)
	
when 60 then
--|#line 379 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 379")
end
						-- match final end of string
				out_buffer.append (text)
				set_start_condition (INITIAL)
	
when 61 then
--|#line 384 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 384")
end
	-- Catch-all rules (no backing up)
				set_start_condition (INITIAL)
	
when 62 then
--|#line 392 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 392")
end
		-- read non '[' non-space characters followed by whitespace
		out_buffer.append (text)
	
when 63 then
--|#line 396 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 396")
end
						-- read non '[' non-space characters followed by whitespace
		out_buffer.append (text)
	
when 64 then
--|#line 402 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 402")
end
-- ignore unmatched chars
when 65 then
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
--|#line 401 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 401")
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
--|#line 286 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 286")
end
	-- Catch-all rules (no backing up)
				set_start_condition (INITIAL)
	
when 3 then
--|#line 385 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 385")
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
			an_array.area.fill_with (450, 2925, 2971)
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
			   14,   14,   14,   14,   14,   14,   14,   14,   22,   65,
			   23,   22,   60,   96,   60,   60,  386,  123,  124,   24,
			   24,   24,   94,  125,  353,   25,   25,   25,   25,   26,
			   25,   25,  341,   66,   97,   24,   25,   25,   25,   26,
			   25,   25,   25,   25,   28,   28,   60,   28,   60,   60,
			   65,   28,   29,   61,   62,   62,   61,  447,   99,   28,

			   94,   63,   62,   62,   62,   62,   80,   62,   80,   80,
			   30,  448,   31,   28,   28,   60,   28,   60,   60,  120,
			   28,   29,  264,   67,   79,   62,   80,   79,   28,  335,
			  427,   95,   81,   95,   95,  101,  101,  250,  279,   30,
			  250,   31,   33,   33,   34,   33,   32,   32,   32,   33,
			   35,   36,   32,   36,   36,   36,   32,   33,   32,   36,
			   36,   36,   36,   36,   36,   36,   32,   32,   37,   36,
			   36,   36,   36,   36,   36,   36,   36,   36,   32,   32,
			   32,   32,   32,   32,   32,   32,   32,   32,   32,   39,
			   87,   87,   40,   87,  176,   90,   90,   87,   90,   94, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   70,  422,   90,   70,   94,   87,  126,   94,  408,  106,
			   90,   94,  106,   41,  109,  136,  107,  109,   60,  137,
			   60,   60,   60,  124,   60,   60,  126,  377,  125,   42,
			   43,   44,   45,   46,   39,   99,   77,   40,   98,   98,
			   98,  100,  100,  100,  111,  102,  102,  102,  279,  172,
			  112,  143,  144,  144,  113,  127,  155,  113,   41,  155,
			  190,  114,   61,   62,   62,   61,   62,   62,   62,   62,
			   63,  336,  337,  128,   42,   43,   44,   45,   46,   48,
			  115,  234,  154,   49,   50,  154,   50,   50,   50,  155,
			  367,   50,  121,  122,  121,  121,  119,  311,  236,   51,

			  139,  450,  139,  139,  123,  124,   79,   62,   80,   79,
			  125,  365,   52,   48,   81,  364,  119,   49,   50,  179,
			   50,   50,   50,   65,  180,   50,   80,   62,   80,   80,
			  166,  167,  167,   51,  139,  450,  139,  139,   82,   83,
			   82,   82,  140,  189,  189,  189,   52,   54,   54,   54,
			   54,   55,   53,   53,   53,   53,   53,   56,   57,   57,
			   57,   53,   53,   53,   57,   57,   57,   57,   57,   57,
			   57,   58,   53,   53,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   60,  297,   60,   60,   95,  198, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   95,   95,  178,  179,  199,   68,   68,   68,  180,  350,
			  351,   68,   68,   68,   68,   68,   68,   68,  196,  197,
			  197,   68,   68,   68,   68,   68,   68,   68,   68,   68,
			   70,  336,  337,   70,   71,   72,   69,   69,   72,   72,
			   69,   73,   73,   73,   69,   69,   69,   74,   74,   74,
			   74,   74,   74,   74,  340,   69,  334,   73,   75,   74,
			   76,   74,   74,   74,   74,   74,   77,   69,   69,   69,
			   69,   69,   69,   69,   69,   69,   69,   82,   83,   82,
			   82,  332,   59,   59,   59,   59,   59,   59,   84,   84,
			   84,   59,   59,   59,   84,   84,   84,   84,   84,   84,

			   84,  331,   59,   59,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   59,   59,   59,   59,   59,   59,   59,
			   59,   59,   59,   59,   85,   85,   85,  215,  350,  351,
			   85,   85,   85,   85,   85,   85,   85,  328,  303,  126,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   69,
			  126,  325,  127,   69,  128,  127,  127,  128,  128,  129,
			  128,  128,  128,  127,  127,  127,  128,  128,  128,  128,
			  128,  128,  128,  130,  127,  126,  128,  131,  128,  128,
			  128,  128,  128,  128,  128,  127,  127,  127,  127,  127,
			  127,  127,  127,  127,  127,  127,   69,  390,  391,   69, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   69,   72,   69,   69,   72,   72,   69,   72,   72,   72,
			  132,   69,   69,   72,   72,   72,   72,   72,   72,   72,
			  323,   69,  126,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   69,   69,   69,   69,   69,   69,   69,   69,
			   69,   69,   69,  133,   87,   87,  133,   87,   94,  250,
			  134,   87,  250,  309,   73,   73,   73,  305,   94,   87,
			   73,   73,   73,   73,   73,   73,   73,  228,  229,  229,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,  135,
			  135,  135,   98,   98,   98,  135,  135,  135,  135,  135,
			  135,  135,   98,   98,   98,  135,  135,  135,  135,  135,

			  135,  135,  135,  135,  123,  124,   90,   90,  106,   90,
			  125,  106,  298,   90,  126,  107,  106,  299,  141,  106,
			  444,   90,  295,  107,  121,  122,  121,  121,  279,  141,
			  145,  146,  145,  145,  145,  145,  145,  145,   91,   91,
			  145,   91,   91,   91,  145,  145,  145,   91,   91,   91,
			   91,   91,   91,   91,  145,  145,  145,   91,   91,   91,
			   91,   91,   91,   91,   91,   91,  145,  145,  145,  145,
			  145,  145,  145,  145,  145,  145,  145,   94,  107,  113,
			  292,  107,  113,  393,  394,   94,  114,  157,   94,  157,
			  157,  157,  109,  450,  157,  109,  450,  114,  312,  291, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  114,  161,  162,  313,  161,  115,   69,  158,  163,  164,
			  171,  230,  230,  230,  147,  148,  149,  150,  151,  152,
			  152,  152,  153,  153,  153,  123,  124,   94,  112,  450,
			  130,  125,  126,  160,  168,  168,  168,  316,  187,  279,
			  168,  168,  168,  168,  168,  168,  168,  301,  187,  126,
			  168,  168,  168,  168,  168,  168,  168,  168,  168,  169,
			  169,  169,  101,  101,  302,  169,  169,  169,  169,  169,
			  169,  169,   94,  274,  450,  169,  169,  169,  169,  169,
			  169,  169,  169,  169,   60,   69,   60,   60,  172,  171,
			  133,  264,   94,  133,  127,  178,  179,  134,  170,  178,

			  179,  180,  181,  182,  182,  180,   98,   98,   98,  130,
			  270,  126,  128,  174,  123,  226,  126,  175,  134,  178,
			  179,  134,  183,  184,  184,  180,  100,  100,  100,  177,
			  177,  177,  235,  235,  235,  177,  177,  177,  177,  177,
			  177,  177,   94,  193,  126,  177,  177,  177,  177,  177,
			  177,  177,  177,  177,  178,  179,  139,  265,  139,  139,
			  180,  186,  122,  186,  186,  119,  188,  264,  189,  189,
			  189,  161,  162,  126,  161,  185,  102,  102,  102,  164,
			   94,  154,  402,   94,  154,  119,  145,  145,  155,  145,
			  145,  145,  253,  254,  254,  145,  145,  145,  145,  145, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  145,  145,  258,  259,  259,  145,  145,  145,  145,  145,
			  145,  145,  145,  145,   98,   98,   98,   98,   98,   98,
			  106,  163,  193,  106,  163,  198,  188,  107,   65,  194,
			  199,  251,  200,  200,  200,  200,  200,  200,   60,  172,
			   60,   60,  228,  228,  228,  127,  206,  207,  207,  186,
			  122,  186,  186,  399,  400,  202,  202,  202,  202,  202,
			  202,  202,  256,  128,  256,  256,  202,  202,  202,  202,
			  202,  202,  202,  202,  172,  210,  359,  162,  210,  233,
			  127,  208,  209,  209,  178,  179,  232,  217,  217,  217,
			  180,  178,  179,  380,  224,  224,  224,  180,  128,  210,

			  104,  126,  210,   69,   69,   69,   69,  211,  211,   69,
			  211,  211,  211,   69,   69,   69,  211,  211,  211,  211,
			  211,  211,  211,  205,   69,  126,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,   69,   69,   69,   69,   69,
			   69,   69,   69,   69,   69,   69,   69,  390,  391,   69,
			  359,  178,  216,  134,  217,  217,  217,  180,  319,  204,
			  234,  319,  235,  235,  235,  123,  124,  361,  203,  218,
			  201,  125,  212,  213,  213,  213,  227,  236,  195,  213,
			  213,  213,  213,  213,  213,  213,  320,  227,  192,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  214,  214, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  214,  266,  267,  267,  214,  214,  214,  214,  214,  214,
			  214,  268,  268,  268,  214,  214,  214,  214,  214,  214,
			  214,  214,  214,  219,  191,  220,  219,  266,  266,  266,
			  221,  178,  222,   65,  223,  224,  224,  180,   65,  173,
			  237,  238,  238,  393,  394,  239,  239,  239,  122,  225,
			  240,  240,  240,  240,  240,  240,  240,   69,  399,  400,
			   69,  240,  240,  240,  240,  240,  240,  240,  240,  241,
			  241,  241,  135,  135,  135,  241,  241,  241,  241,  241,
			  241,  241,  165,  249,  159,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  242,  258,  318,  259,  172,  243,

			  127,  244,  244,  244,  127,  244,  244,  244,  245,  321,
			  322,  321,  321,  246,  127,  247,  248,  248,  128,  172,
			  295,  356,  128,  178,  179,  127,  248,  248,  248,  289,
			  178,  179,  128,  255,  255,  255,  180,  188,  358,  229,
			  229,  229,  156,  128,  252,  252,  252,  252,  252,  252,
			  252,  371,  372,  372,  104,  252,  252,  252,  252,  252,
			  252,  252,  252,  219,   94,  220,  219,  297,  298,  220,
			  221,  220,  220,  299,  178,  179,  256,  260,  261,  261,
			  180,  178,  179,  142,  261,  261,  261,  180,  126,  126,
			  221,  443,  256,  221,  178,  179,  198,  216,  126,  138, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  180,  199,  180,  238,  238,  238,  126,  257,  257,  257,
			  257,  257,  257,  257,  218,   65,  262,  119,  257,  257,
			  257,  257,  257,  257,  257,  257,  123,  124,   65,  346,
			  347,  347,  125,  118,  116,  237,  237,  237,  216,  263,
			  254,  254,  254,  180,  264,  105,  104,  178,  216,  263,
			  269,  269,  269,  180,   94,  218,  269,  269,  269,  269,
			  269,  269,  269,   91,   89,  218,  269,  269,  269,  269,
			  269,  269,  269,  269,  269,  172,  373,  373,  373,  172,
			   88,  127,  271,  272,  272,  127,  273,  273,  273,  172,
			  375,  375,  375,   86,  450,  127,  275,  276,  276,  128,

			  172,  450,   60,  128,   60,   60,  127,  277,  278,  278,
			  172,  450,  450,  128,  123,  124,  127,  278,  278,  278,
			  125,  450,  178,  179,  128,  282,  282,  282,  180,  304,
			  319,  411,  450,  319,  128,  280,  280,  280,  280,  280,
			  280,  280,  450,  356,  450,  369,  280,  280,  280,  280,
			  280,  280,  280,  280,  211,  211,  126,  281,  281,  281,
			  358,  450,  450,  281,  281,  281,  281,  281,  281,  281,
			  450,  450,  249,  281,  281,  281,  281,  281,  281,  281,
			  281,  281,  134,  311,  312,  450,  284,  284,  284,  313,
			  450,  450,  284,  284,  284,  284,  284,  284,  284,  450, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_nxt_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  450,  212,  284,  284,  284,  284,  284,  284,  284,  284,
			  284,  285,  450,  220,  285,  297,  298,  450,  286,  450,
			  222,  299,  450,  178,  179,  180,  287,  288,  288,  180,
			  178,  179,  450,  288,  288,  288,  180,  225,  285,  295,
			  220,  285,  344,  345,  345,  286,  450,  222,  450,  259,
			  259,  259,  180,  123,  124,  381,  381,  381,  234,  125,
			  267,  267,  267,  290,  225,  242,  450,  450,  245,  450,
			  243,  127,  242,  246,  127,  236,  172,  243,  127,  272,
			  272,  272,  127,  271,  271,  271,  450,  450,  285,  128,
			  220,  285,  128,  117,  117,  286,  128,  245,  117,  450,

			  128,  172,  246,  127,  276,  276,  276,  127,  293,  275,
			  275,  172,  450,  283,  126,  283,  283,  127,  275,  275,
			  275,  128,  283,  450,  301,  128,  135,  135,  135,  450,
			   60,  450,   60,   60,  450,  128,  294,  294,  294,  450,
			  450,  302,  294,  294,  294,  294,  294,  294,  294,  389,
			  389,  389,  294,  294,  294,  294,  294,  294,  294,  294,
			  294,  286,  307,  256,  286,  349,  450,  308,  127,  450,
			  295,  356,  450,  357,  357,  357,  450,  450,  300,  300,
			  300,  300,  300,  300,  300,  450,  128,  126,  358,  300,
			  300,  300,  300,  300,  300,  300,  300,  306,  306,  306, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_nxt_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  306,  306,  306,  306,  450,  211,  211,  211,  306,  306,
			  306,  306,  306,  306,  306,  306,  310,  310,  310,  405,
			  405,  405,  310,  310,  310,  310,  310,  310,  310,  398,
			  450,  450,  310,  310,  310,  310,  310,  310,  310,  310,
			  310,  314,  314,  314,  406,  406,  406,  314,  314,  314,
			  314,  314,  314,  314,  450,  450,  126,  314,  314,  314,
			  314,  314,  314,  314,  314,  314,  315,  315,  315,  417,
			  417,  417,  315,  315,  315,  315,  315,  315,  315,  409,
			  409,  409,  315,  315,  315,  315,  315,  315,  315,  315,
			  315,  317,  317,  317,  126,  450,  450,  317,  317,  317,

			  317,  317,  317,  317,  423,  423,  423,  317,  317,  317,
			  317,  317,  317,  317,  317,  317,  321,  322,  321,  321,
			  172,  426,  426,  426,  123,  124,  127,  275,  326,  276,
			  125,  324,  324,  324,  450,  450,  126,  324,  324,  324,
			  324,  324,  324,  324,  128,  450,  450,  324,  324,  324,
			  324,  324,  324,  324,  324,  324,  327,  327,  327,  327,
			  327,  327,  327,   60,  450,   60,   60,  327,  327,  327,
			  327,  327,  327,  327,  327,  333,  333,  333,  333,  333,
			  333,  333,  450,  450,  126,  450,  333,  333,  333,  333,
			  333,  333,  333,  333,  307,  412,  429,  429,  429,  308, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_nxt_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  127,  276,  276,  276,  295,  231,  231,  357,  357,  357,
			  231,   60,  295,   60,   60,  370,  370,  370,  128,  338,
			  338,  338,  362,  362,  362,  338,  338,  338,  338,  338,
			  338,  338,  431,  431,  431,  338,  338,  338,  338,  338,
			  338,  338,  338,  338,   69,  295,  450,   69,  379,  379,
			  379,  359,  450,  360,  360,  360,  396,  450,  389,  389,
			  389,  339,  339,  339,  339,  339,  339,  339,  361,  450,
			  249,  450,  339,  339,  339,  339,  339,  339,  339,  339,
			  342,  342,  342,  342,  342,  342,  342,  420,  420,  420,
			  450,  342,  342,  342,  342,  342,  342,  342,  342,  343,

			  343,  343,  384,  450,  450,  343,  343,  343,  343,  343,
			  343,  343,  420,  420,  420,  343,  343,  343,  343,  343,
			  343,  343,  343,  343,  348,  348,  348,  126,  450,  450,
			  348,  348,  348,  348,  348,  348,  348,  432,  432,  432,
			  348,  348,  348,  348,  348,  348,  348,  348,  348,  352,
			  352,  352,  436,  436,  436,  352,  352,  352,  352,  352,
			  352,  352,  434,  434,  434,  352,  352,  352,  352,  352,
			  352,  352,  352,  352,  355,  355,  355,  126,  450,  450,
			  355,  355,  355,  355,  355,  355,  355,  431,  431,  431,
			  355,  355,  355,  355,  355,  355,  355,  355,  355,  363, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_nxt_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  363,  363,  384,  450,  450,  363,  363,  363,  363,  363,
			  363,  363,  449,  449,  449,  363,  363,  363,  363,  363,
			  363,  363,  363,  363,  368,  369,  369,  446,  446,  446,
			  211,  211,  211,  211,  211,  211,  211,  450,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,   60,
			  447,   60,   60,  356,  450,  211,  211,  211,  374,  439,
			  362,  362,  362,  376,  376,  376,  376,  376,  376,  376,
			  358,  211,  211,  211,  376,  376,  376,  376,  376,  376,
			  376,  376,  378,  378,  378,  378,  378,  378,  378,  445,
			  446,  446,  446,  378,  378,  378,  378,  378,  378,  378,

			  378,  359,  450,  372,  372,  372,  450,  450,   60,  450,
			   60,   60,  383,  450,  375,  375,  375,  450,  380,  382,
			  382,  382,   60,  450,   60,   60,  450,  450,  450,  384,
			  385,  385,  385,  395,  395,  395,  385,  385,  385,  385,
			  385,  385,  385,  442,  442,  442,  385,  385,  385,  385,
			  385,  385,  385,  385,  385,  387,  387,  387,  419,  450,
			  450,  387,  387,  387,  387,  387,  387,  387,  450,  450,
			  450,  387,  387,  387,  387,  387,  387,  387,  387,  387,
			   60,  450,   60,   60,  420,  420,  420,  450,  450,  388,
			  450,  382,  382,  382,  397,  397,  397,  450,  450,  126, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_nxt_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  397,  397,  397,  397,  397,  397,  397,  421,  450,  450,
			  397,  397,  397,  397,  397,  397,  397,  397,  397,  401,
			  401,  401,  450,  450,  450,  401,  401,  401,  401,  401,
			  401,  401,  450,  450,  450,  401,  401,  401,  401,  401,
			  401,  401,  401,  401,   60,  450,   60,   60,  450,  450,
			  403,   60,  404,   60,   60,  395,  395,  395,  450,  442,
			  442,  442,  410,  410,  410,  413,  450,  414,  450,  450,
			  405,  405,  405,  415,  126,  406,  406,  406,  418,  450,
			  409,  409,  409,  450,  450,  411,   60,  450,   60,   60,
			  416,   60,  450,   60,   60,  419,  450,  410,  410,  410,

			  450,  450,  410,  410,  410,  424,  450,  417,  417,  417,
			  428,  450,  423,  423,  423,  430,  450,  426,  426,  426,
			  450,  433,  425,  429,  429,  429,  296,  296,  413,  450,
			  435,  296,  126,  432,  432,  432,  437,  450,  438,  450,
			  450,  434,  434,  434,  440,  450,  441,  450,  450,  436,
			  436,  436,  442,  442,  442,  450,  126,  446,  446,  446,
			  450,  449,  449,  449,  450,  450,  108,  126,  450,  108,
			  450,  108,  425,  108,  108,  443,  416,   27,   27,   27,
			   27,   27,   27,   27,   27,   27,   27,   27,   27,   27,
			   27,   27,   27,   38,   38,   38,   38,   38,   38,   38, yy_Dummy>>,
			1, 200, 2400)
		end

	yy_nxt_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   38,   38,   38,   38,   38,   38,   38,   38,   38,   47,
			   47,   47,   47,   47,   47,   47,   47,   47,   47,   47,
			   47,   47,   47,   47,   47,   59,  450,   59,   59,  450,
			   59,   59,   59,   59,   59,  450,   59,   59,   59,   59,
			   59,   64,  450,   64,   64,   64,   64,   64,   64,   64,
			   64,   64,  450,   64,   64,   64,   64,   78,   78,   78,
			   78,  450,   78,   78,   78,   78,   78,  450,   78,   78,
			   78,   78,   78,   92,   92,   92,   92,  329,  329,  450,
			   92,   93,  329,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,  450,   93,   93,   93,   93,  103,  450,  103,

			  103,  103,  103,  103,  103,  103,  103,  103,  450,  103,
			  103,  103,  103,  110,  330,  330,  110,  450,  450,  330,
			  450,  110,  110,  450,  450,  450,  110,  110,   67,   67,
			   67,   67,   67,   67,   67,   67,   67,   67,   67,   67,
			   67,   67,   67,   67,   69,  450,  450,   69,   69,   69,
			   69,   69,   69,   69,  450,   69,   69,   69,   69,   69,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  119,  119,  119,  119,  119,  119,  119,  119, yy_Dummy>>,
			1, 200, 2600)
		end

	yy_nxt_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  119,  119,  119,  119,  119,  119,  119,  119,  127,  450,
			  450,  127,  127,  127,  127,  127,  127,  127,  127,  127,
			  127,  127,  127,  127,  130,  130,  130,  130,  130,  130,
			  130,  130,  130,  450,  130,  130,  130,  140,  140,  140,
			  140,  140,  140,  140,  140,  140,  140,  140,  140,  140,
			  140,  140,  140,  157,  354,  354,  157,  450,  157,  354,
			  157,  157,  190,  450,  190,  190,  190,  190,  190,  190,
			  190,  190,  190,  450,  190,  190,  190,  190,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  233,  233,  233,  233,  233,  233,

			  233,  233,  233,  233,  233,  233,  233,  233,  233,  233,
			  366,  366,  392,  392,  450,  366,  450,  392,  407,  407,
			  450,  450,  450,  407,   13, yy_Dummy>>,
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
			an_array.area.fill_with (71, 552, 595)
			yy_chk_template_4 (an_array)
			an_array.area.fill_with (91, 730, 776)
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
			an_array.area.fill_with (450, 2924, 2971)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    2,   17,    2,    2,   14,   41,   14,   14,  484,   68,
			   68,    2,    2,    2,   43,   68,  481,    2,    2,    2,
			    2,    2,    2,    2,  480,   17,   41,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    3,    3,   19,    3,
			   19,   19,   66,    3,    3,   15,   15,   15,   15,  448,
			   43,    3,   45,   15,   16,   16,   16,   16,   23,   23,
			   23,   23,    3,  441,    3,    4,    4,   18,    4,   18,
			   18,   66,    4,    4,  323,   18,   22,   22,   22,   22,
			    4,  323,  422,   39,   22,   39,   39,   45,   45,  212,
			  416,    4,  212,    4, yy_Dummy>>,
			1, 94, 48)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    7,   28,   28,    7,   28,  132,   33,   33,   28,   33,
			  148,   70,  414,   33,   70,   42,   28,  132,   44,  400,
			   50,   33,   46,   50,    7,   51,   75,   50,   51,   59,
			   75,   59,   59,   60,  169,   60,   60,   70,  366,  169,
			    7,    7,    7,    7,    7,    8,  148,   70,    8,   42,
			   42,   42,   44,   44,   44,   51,   46,   46,   46,  358,
			  128,   51,   89,   89,   89,   52,  128,  155,   52,    8,
			  155,  155,   52,   61,   61,   61,   61,   62,   62,   62,
			   62,   61,  324,  324,  128,    8,    8,    8,    8,    8,
			    9,   52,  266,  104,    9,    9,  104,    9,    9,    9,

			  104,  355,    9,   67,   67,   67,   67,   67,  354,  266,
			    9,   78,   78,   78,   78,   85,   85,   79,   79,   79,
			   79,   85,  352,    9,   10,   79,  351,   67,   10,   10,
			  214,   10,   10,   10,  120,  214,   10,   80,   80,   80,
			   80,  120,  120,  120,   10,   81,   81,   81,   81,   82,
			   82,   82,   82,   81,  144,  144,  144,   10, yy_Dummy>>,
			1, 158, 189)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   20,  343,   20,   20,   95,  237,   95,   95,  135,  135,
			  237,   20,   20,   20,  135,  338,  338,   20,   20,   20,
			   20,   20,   20,   20,  165,  165,  165,   20,   20,   20,
			   20,   20,   20,   20,   20,   20,   21,  348,  348,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			  329,   21,  320,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   24,   24,   24,   24,  314,   24,   24,
			   24,   24,   24,   24,   24,   24,   24,   24,   24,   24,

			   24,   24,   24,   24,   24,   24,   24,  313,   24,   24,
			   24,   24,   24,   24,   24,   24,   24,   24,   24,   24,
			   24,   24,   24,   24,   24,   24,   24,   24,   24,   24,
			   25,   25,   25,  180,  363,  363,   25,   25,   25,   25,
			   25,   25,   25,  310,  289,  180,   25,   25,   25,   25,
			   25,   25,   25,   25,   25,   71,  289,  307, yy_Dummy>>,
			1, 158, 394)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   72,  385,  385,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,  305,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   73,   87,   87,
			   73,   87,   99,  250,   73,   87,  250,  294,   73,   73,
			   73,  291,  100,   87,   73,   73,   73,   73,   73,   73,
			   73,  188,  188,  188,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   74,   74,   74,   99,   99,   99,   74,
			   74,   74,   74,   74,   74,   74,  100,  100,  100,   74,

			   74,   74,   74,   74,   74,   74,   74,   74,   86,   86,
			   90,   90,  106,   90,   86,  106,  315,   90,  438,  106,
			  108,  315,   86,  108,  438,   90,  281,  108,  121,  121,
			  121,  121,  279,   86, yy_Dummy>>,
			1, 134, 596)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   98,  107,  113,  269,  107,  113,  387,  387,  101,  113,
			  107,  102,  107,  107,  107,  109,  110,  107,  109,  110,
			  114,  330,  265,  114,  115,  115,  330,  115,  113,  127,
			  110,  115,  115,  127,  189,  189,  189,   98,   98,   98,
			   98,   98,  101,  101,  101,  102,  102,  102,  141,  141,
			  150,  109,  110,  127,  141,  127,  114,  123,  123,  123,
			  299,  141,  249,  123,  123,  123,  123,  123,  123,  123,
			  318,  141,  299,  123,  123,  123,  123,  123,  123,  123,
			  123,  123,  124,  124,  124,  150,  150,  318,  124,  124,
			  124,  124,  124,  124,  124,  147,  245,  347,  124,  124,

			  124,  124,  124,  124,  124,  124,  124,  125,  129,  125,
			  125,  131,  129,  133,  347,  149,  133,  131,  185,  185,
			  133,  125,  136,  136,  185,  136,  136,  136,  136,  147,
			  147,  147,  129,  242,  129,  131,  131,  241,  185,  133,
			  131,  134,  137,  137,  134,  137,  137,  137,  137,  149,
			  149,  149,  134,  134,  134,  197,  197,  197,  134,  134,
			  134,  134,  134,  134,  134,  151,  233,  134,  134,  134,
			  134,  134,  134,  134,  134,  134,  134,  138,  138,  139,
			  232,  139,  139,  138,  140,  140,  140,  140,  140,  143,
			  231,  143,  143,  143,  161,  161,  394,  161,  138,  151, yy_Dummy>>,
			1, 200, 777)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  151,  151,  161,  152,  154,  394,  153,  154,  140,  145,
			  145,  154,  145,  145,  145,  216,  216,  216,  145,  145,
			  145,  145,  145,  145,  145,  222,  222,  222,  145,  145,
			  145,  145,  145,  145,  145,  145,  145,  152,  152,  152,
			  153,  153,  153,  157,  163,  163,  157,  163,  166,  228,
			  157,  167,  163,  166,  213,  166,  166,  166,  167,  167,
			  167,  170,  174,  170,  170,  230,  230,  230,  174,  174,
			  174,  174,  186,  186,  186,  186,  392,  392,  170,  170,
			  170,  170,  170,  170,  170,  256,  174,  256,  256,  170,
			  170,  170,  170,  170,  170,  170,  170,  175,  210,  371,

			  195,  210,  194,  175,  175,  175,  175,  182,  182,  192,
			  182,  182,  182,  182,  184,  184,  371,  184,  184,  184,
			  184,  175,  176,  190,  210,  176,  176,  176,  176,  176,
			  176,  176,  176,  176,  176,  176,  176,  176,  176,  176,
			  176,  176,  176,  176,  176,  176,  173,  176,  176,  176,
			  176,  176,  176,  176,  176,  176,  176,  176,  176,  176,
			  176,  176,  176,  176,  176,  176,  176,  176,  176,  177,
			  397,  397,  177,  381,  181,  181,  177,  181,  181,  181,
			  181,  303,  172,  196,  303,  196,  196,  196,  187,  187,
			  381,  171,  181,  168,  187,  177,  178,  178,  178,  187, yy_Dummy>>,
			1, 200, 977)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  196,  164,  178,  178,  178,  178,  178,  178,  178,  303,
			  187,  159,  178,  178,  178,  178,  178,  178,  178,  178,
			  178,  179,  179,  179,  234,  234,  234,  179,  179,  179,
			  179,  179,  179,  179,  235,  235,  235,  179,  179,  179,
			  179,  179,  179,  179,  179,  179,  183,  158,  183,  183,
			  268,  268,  268,  183,  183,  183,  199,  183,  183,  183,
			  183,  200,  130,  199,  199,  199,  401,  401,  200,  200,
			  200,  119,  183,  201,  201,  201,  201,  201,  201,  201,
			  211,  407,  407,  211,  201,  201,  201,  201,  201,  201,
			  201,  201,  202,  202,  202,  288,  288,  288,  202,  202,

			  202,  202,  202,  202,  202,  118,  211,  111,  202,  202,
			  202,  202,  202,  202,  202,  202,  202,  206,  301,  301,
			  301,  207,  206,  206,  206,  206,  206,  207,  207,  207,
			  207,  208,  321,  321,  321,  321,  208,  208,  208,  208,
			  208,  206,  209,  379,  379,  207,  262,  262,  209,  209,
			  209,  209,  262,  217,  217,  208,  217,  217,  217,  217,
			  229,  379,  229,  229,  229,  105,  209,  215,  215,  215,
			  215,  215,  215,  215,  359,  359,  359,  103,  215,  215,
			  215,  215,  215,  215,  215,  215,  219,   93,  219,  219,
			  284,  284,  220,  219,  220,  220,  284,  223,  223,  220, yy_Dummy>>,
			1, 200, 1177)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  223,  223,  223,  223,  224,  224,   88,  224,  224,  224,
			  224,  444,  219,  221,  444,  221,  221,  226,  226,  238,
			  253,   77,   76,  226,  238,  253,  238,  238,  238,   69,
			  221,  221,  221,  221,  221,  221,  221,  253,   64,  226,
			   63,  221,  221,  221,  221,  221,  221,  221,  221,  227,
			  227,  239,  335,  335,  335,  227,   58,   55,  239,  239,
			  239,  254,  227,  254,  254,  254,  254,  335,   49,   48,
			  282,  282,  227,  240,  240,  240,  282,   38,  254,  240,
			  240,  240,  240,  240,  240,  240,   35,   31,  282,  240,
			  240,  240,  240,  240,  240,  240,  240,  240,  243,  360,

			  360,  360,  244,   29,  243,  243,  243,  243,  244,  244,
			  244,  244,  246,  364,  364,  364,   26,   13,  246,  246,
			  246,  246,  243,  247,    0,  412,  244,  412,  412,  247,
			  247,  247,  247,  248,    0,    0,  246,  290,  290,  248,
			  248,  248,  248,  290,    0,  255,  255,  247,  255,  255,
			  255,  255,  290,  319,  412,    0,  319,  248,  251,  251,
			  251,  251,  251,  251,  251,    0,  369,    0,  369,  251,
			  251,  251,  251,  251,  251,  251,  251,  252,  252,  319,
			  252,  252,  252,  369,    0,    0,  252,  252,  252,  252,
			  252,  252,  252,    0,    0,  252,  252,  252,  252,  252, yy_Dummy>>,
			1, 200, 1377)
		end

	yy_chk_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  252,  252,  252,  252,  252,  257,  296,  296,    0,  257,
			  257,  257,  296,    0,    0,  257,  257,  257,  257,  257,
			  257,  257,    0,    0,  257,  257,  257,  257,  257,  257,
			  257,  257,  257,  257,  258,    0,  258,  258,  317,  317,
			    0,  258,    0,  258,  317,    0,  260,  260,  258,  260,
			  260,  260,  260,  261,  261,    0,  261,  261,  261,  261,
			  258,  259,  334,  259,  259,  334,  334,  334,  259,    0,
			  259,    0,  259,  259,  259,  259,  263,  263,  373,  373,
			  373,  267,  263,  267,  267,  267,  263,  259,  271,    0,
			    0,  275,    0,  271,  271,  272,  275,  275,  267,  273,

			  272,  272,  272,  272,  272,  273,  273,  273,  273,    0,
			    0,  285,  271,  285,  285,  275,  462,  462,  285,  272,
			  276,  462,    0,  273,  277,  276,  276,  276,  276,  276,
			  277,  277,  277,  277,  278,    0,  476,  285,  476,  476,
			  278,  278,  278,  278,  276,  476,    0,  287,  277,  287,
			  287,  287,    0,  337,    0,  337,  337,    0,  278,  280,
			  280,  280,    0,    0,  287,  280,  280,  280,  280,  280,
			  280,  280,  383,  383,  383,  280,  280,  280,  280,  280,
			  280,  280,  280,  280,  286,  293,  286,  286,  337,    0,
			  293,  293,    0,  344,  344,    0,  344,  344,  344,    0, yy_Dummy>>,
			1, 200, 1577)
		end

	yy_chk_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,  286,  286,  286,  286,  286,  286,  286,    0,  293,
			  286,  344,  286,  286,  286,  286,  286,  286,  286,  286,
			  292,  292,  292,  292,  292,  292,  292,    0,  391,  391,
			  391,  292,  292,  292,  292,  292,  292,  292,  292,  295,
			  295,  295,  396,  396,  396,  295,  295,  295,  295,  295,
			  295,  295,  391,    0,    0,  295,  295,  295,  295,  295,
			  295,  295,  295,  295,  297,  297,  297,  398,  398,  398,
			  297,  297,  297,  297,  297,  297,  297,    0,    0,  297,
			  297,  297,  297,  297,  297,  297,  297,  297,  297,  298,
			  298,  298,  408,  408,  408,  298,  298,  298,  298,  298,

			  298,  298,  402,  402,  402,  298,  298,  298,  298,  298,
			  298,  298,  298,  298,  300,  300,  300,  402,    0,    0,
			  300,  300,  300,  300,  300,  300,  300,  415,  415,  415,
			  300,  300,  300,  300,  300,  300,  300,  300,  300,  304,
			  304,  304,  304,  308,  418,  418,  418,  304,  304,  308,
			  308,  308,  308,  304,  306,  306,  306,    0,    0,  418,
			  306,  306,  306,  306,  306,  306,  306,  308,    0,    0,
			  306,  306,  306,  306,  306,  306,  306,  306,  306,  309,
			  309,  309,  309,  309,  309,  309,  404,    0,  404,  404,
			  309,  309,  309,  309,  309,  309,  309,  309,  316,  316, yy_Dummy>>,
			1, 200, 1777)
		end

	yy_chk_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  316,  316,  316,  316,  316,    0,    0,  316,    0,  316,
			  316,  316,  316,  316,  316,  316,  316,  326,  404,  424,
			  424,  424,  326,  326,  326,  326,  326,  345,  473,  473,
			  345,  345,  345,  473,  349,  357,  349,  349,  357,  357,
			  357,  326,  327,  327,  327,  349,  349,  349,  327,  327,
			  327,  327,  327,  327,  327,  427,  427,  427,  327,  327,
			  327,  327,  327,  327,  327,  327,  327,  328,  370,    0,
			  328,  370,  370,  370,  346,    0,  346,  346,  346,  389,
			    0,  389,  389,  389,  328,  328,  328,  328,  328,  328,
			  328,  346,    0,  328,    0,  328,  328,  328,  328,  328,

			  328,  328,  328,  332,  332,  332,  332,  332,  332,  332,
			  420,  420,  420,    0,  332,  332,  332,  332,  332,  332,
			  332,  332,  333,  333,  333,  420,    0,    0,  333,  333,
			  333,  333,  333,  333,  333,  421,  421,  421,  333,  333,
			  333,  333,  333,  333,  333,  333,  333,  336,  336,  336,
			  421,    0,    0,  336,  336,  336,  336,  336,  336,  336,
			  428,  428,  428,  336,  336,  336,  336,  336,  336,  336,
			  336,  336,  339,  339,  339,  433,  433,  433,  339,  339,
			  339,  339,  339,  339,  339,  430,  430,  430,  339,  339,
			  339,  339,  339,  339,  339,  339,  339,  342,  342,  342, yy_Dummy>>,
			1, 200, 1977)
		end

	yy_chk_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  430,    0,    0,  342,  342,  342,  342,  342,  342,  342,
			  431,  431,  431,  342,  342,  342,  342,  342,  342,  342,
			  342,  342,  350,  350,  350,  431,    0,    0,  350,  350,
			  350,  350,  350,  350,  350,  445,  445,  445,  350,  350,
			  350,  350,  350,  350,  350,  350,  350,  356,  356,  356,
			  440,  440,  440,  356,  356,  356,  356,  356,  356,  356,
			    0,  435,  435,  435,  356,  356,  356,  356,  356,  356,
			  356,  356,  362,  440,  362,  362,  368,    0,  368,  368,
			  368,  362,  435,  362,  362,  362,  365,  365,  365,  365,
			  365,  365,  365,  368,  439,  439,  439,  365,  365,  365,

			  365,  365,  365,  365,  365,  367,  367,  367,  367,  367,
			  367,  367,  439,  447,  447,  447,  367,  367,  367,  367,
			  367,  367,  367,  367,  372,    0,  372,  372,  372,    0,
			    0,  374,    0,  374,  374,  375,    0,  375,  375,  375,
			    0,  372,  374,  374,  374,  388,    0,  388,  388,    0,
			    0,    0,  375,  376,  376,  376,  388,  388,  388,  376,
			  376,  376,  376,  376,  376,  376,  442,  442,  442,  376,
			  376,  376,  376,  376,  376,  376,  376,  376,  378,  378,
			  378,  442,    0,    0,  378,  378,  378,  378,  378,  378,
			  378,    0,    0,    0,  378,  378,  378,  378,  378,  378, yy_Dummy>>,
			1, 200, 2177)
		end

	yy_chk_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  378,  378,  378,  382,    0,  382,  382,  413,  413,  413,
			    0,    0,  382,    0,  382,  382,  382,  390,  390,  390,
			    0,    0,  413,  390,  390,  390,  390,  390,  390,  390,
			  413,    0,    0,  390,  390,  390,  390,  390,  390,  390,
			  390,  390,  393,  393,  393,    0,    0,    0,  393,  393,
			  393,  393,  393,  393,  393,    0,    0,    0,  393,  393,
			  393,  393,  393,  393,  393,  393,  393,  395,    0,  395,
			  395,    0,    0,  395,  403,  395,  403,  403,  395,  395,
			  395,    0,  443,  443,  443,  403,  403,  403,  405,    0,
			  405,    0,    0,  405,  405,  405,  406,  443,  406,  406,

			  406,  409,    0,  409,  409,  409,    0,    0,  403,  410,
			    0,  410,  410,  406,  411,    0,  411,  411,  409,    0,
			  410,  410,  410,    0,    0,  411,  411,  411,  417,    0,
			  417,  417,  417,  423,    0,  423,  423,  423,  426,    0,
			  426,  426,  426,    0,  429,  417,  429,  429,  429,  477,
			  477,  432,    0,  432,  477,  426,  432,  432,  432,  434,
			    0,  434,    0,    0,  434,  434,  434,  436,    0,  436,
			    0,    0,  436,  436,  436,  437,  437,  437,    0,  434,
			  446,  446,  446,    0,  449,  449,  449,    0,    0,  460,
			  437,    0,  460,    0,  460,  446,  460,  460,  437,  449, yy_Dummy>>,
			1, 200, 2377)
		end

	yy_chk_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  451,  451,  451,  451,  451,  451,  451,  451,  451,  451,
			  451,  451,  451,  451,  451,  451,  452,  452,  452,  452,
			  452,  452,  452,  452,  452,  452,  452,  452,  452,  452,
			  452,  452,  453,  453,  453,  453,  453,  453,  453,  453,
			  453,  453,  453,  453,  453,  453,  453,  453,  454,    0,
			  454,  454,    0,  454,  454,  454,  454,  454,    0,  454,
			  454,  454,  454,  454,  455,    0,  455,  455,  455,  455,
			  455,  455,  455,  455,  455,    0,  455,  455,  455,  455,
			  456,  456,  456,  456,    0,  456,  456,  456,  456,  456,
			    0,  456,  456,  456,  456,  456,  457,  457,  457,  457,

			  478,  478,    0,  457,  458,  478,  458,  458,  458,  458,
			  458,  458,  458,  458,  458,    0,  458,  458,  458,  458,
			  459,    0,  459,  459,  459,  459,  459,  459,  459,  459,
			  459,    0,  459,  459,  459,  459,  461,  479,  479,  461,
			    0,    0,  479,    0,  461,  461,    0,    0,    0,  461,
			  461,  463,  463,  463,  463,  463,  463,  463,  463,  463,
			  463,  463,  463,  463,  463,  463,  463,  464,    0,    0,
			  464,  464,  464,  464,  464,  464,  464,    0,  464,  464,
			  464,  464,  464,  465,  465,  465,  465,  465,  465,  465,
			  465,  465,  465,  465,  465,  465,  465,  465,  465,  466, yy_Dummy>>,
			1, 200, 2577)
		end

	yy_chk_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  466,  466,  466,  466,  466,  466,  466,  466,  466,  466,
			  466,  466,  466,  466,  466,  467,  467,  467,  467,  467,
			  467,  467,  467,  467,  467,  467,  467,  467,  467,  467,
			  467,  468,    0,    0,  468,  468,  468,  468,  468,  468,
			  468,  468,  468,  468,  468,  468,  468,  469,  469,  469,
			  469,  469,  469,  469,  469,  469,    0,  469,  469,  469,
			  470,  470,  470,  470,  470,  470,  470,  470,  470,  470,
			  470,  470,  470,  470,  470,  470,  471,  482,  482,  471,
			    0,  471,  482,  471,  471,  472,    0,  472,  472,  472,
			  472,  472,  472,  472,  472,  472,    0,  472,  472,  472,

			  472,  474,  474,  474,  474,  474,  474,  474,  474,  474,
			  474,  474,  474,  474,  474,  474,  474,  475,  475,  475,
			  475,  475,  475,  475,  475,  475,  475,  475,  475,  475,
			  475,  475,  475,  483,  483,  485,  485,    0,  483,    0,
			  485,  486,  486,    0,    0,    0,  486, yy_Dummy>>,
			1, 147, 2777)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 486)
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
			 2924, 1430, 2924,  194, 2924, 1454,    0, 2924, 1449,  130,
			 2924,   48,  199,   57,  202,   95,  206, 2924, 1441, 1436,
			  208,  213,  253, 2924, 2924, 1407, 2924,    0, 1404,  217,
			  221,  261,  265, 1408, 1410, 2924,   85,  291,   48, 1379,
			  199,  548,  595,  642,  667,  185, 1367, 1371,  299,  305,
			  325,  333,  337, 2924,    0,  295,  695,  643, 1381,  239,
			  705,  729,    0, 1359, 2924,  397, 2924, 2924,  772,  643,

			  653,  780,  783, 1349,  281, 1340,  707,  777,  715,  791,
			  792, 1252, 2924,  778,  796,  800, 2924,    0, 1248, 1246,
			  318,  723, 2924,  822,  847,  883, 2924,  805,  244,  884,
			 1234,  883,  179,  889,  917,  393,  890,  910,  945,  955,
			  960,  816, 2924,  956,  331,  977, 2924,  867,  194,  887,
			  822,  937,  975,  978,  980,  255, 2924, 1019, 1209, 1158,
			 2924,  970, 2924, 1020, 1169,  406, 1020, 1023, 1161,  213,
			 1037, 1141, 1132, 1096, 1034, 1069, 1098, 1145, 1161, 1186,
			  512, 1142, 1075, 1222, 1082,  886, 1048, 1156,  655,  799,
			 1095,    0, 1057, 2924, 1070, 1075, 1150,  920, 2924, 1228, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1233, 1232, 1257, 2924, 2924, 2924, 1289, 1293, 1303, 1314,
			 1074, 1256,  136, 1022,  309, 1326,  980, 1321, 2924, 1362,
			 1368, 1389,  990, 1365, 1372, 2924, 1385, 1417, 1016, 1327,
			 1030,  940,  926,  941, 1189, 1199, 2924,  394, 1391, 1423,
			 1438,  905,  883, 1470, 1474,  846, 1484, 1495, 1505,  812,
			  648, 1517, 1545, 1387, 1428, 1513, 1061, 1574, 1610, 1637,
			 1614, 1621, 1314, 1644, 2924,  784,  271, 1648, 1215,  770,
			 2924, 1660, 1667, 1671, 2924, 1663, 1692, 1696, 1706,  701,
			 1724,  713, 1438,    0, 1358, 1687, 1760, 1714, 1260,  523,
			 1505,  642, 1779, 1757,  643, 1804, 1574, 1829, 1854,  822,

			 1879, 1283, 2924, 1157, 1915,  591, 1919,  524, 1915, 1938,
			  528,    0,    0,  486,  472,  702, 1957, 1606,  837, 1529,
			  422, 1308, 2924,   95,  262, 2924, 1989, 2007, 2043,  445,
			  788,    0, 2062, 2087, 1630, 1417, 2112, 1729,  400, 2137,
			    0,    0, 2162,  386, 1761, 1995, 2041,  864,  422, 2010,
			 2187,  279,  301,    0,  288,  280, 2212, 2003,  221, 1339,
			 1464, 2924, 2248,  519, 1478, 2245,  217, 2264, 2243, 1533,
			 2036, 1066, 2291, 1643, 2307, 2302, 2318,    0, 2343, 1311,
			 2924, 1140, 2379, 1737, 2924,  588,    0,  774, 2321, 2046,
			 2382, 1793, 1044, 2407,  946, 2443, 1807, 1138, 1832,    0, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  172, 1234, 1867, 2450, 1962, 2458, 2463, 1249, 1857, 2468,
			 2485, 2490, 1501, 2372,  168, 1892,  111, 2495, 1909, 2924,
			 2075, 2100,  100, 2500, 1984, 2924, 2505, 2020, 2125, 2511,
			 2150, 2175, 2521, 2140, 2529, 2226, 2537, 2540,  687, 2259,
			 2215,   78, 2331, 2447, 1361, 2200, 2545, 2278,   67, 2549,
			 2924, 2576, 2592, 2608, 2624, 2640, 2656, 2666, 2680, 2696,
			 2565, 2712, 1684, 2727, 2743, 2759, 2775, 2791, 2807, 2820,
			 2836, 2852, 2861, 1996, 2877, 2893, 1712, 2517, 2668, 2705,
			   62,   54, 2845, 2901,   46, 2903, 2909, yy_Dummy>>,
			1, 87, 400)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 486)
			yy_def_template_1 (an_array)
			yy_def_template_2 (an_array)
			yy_def_template_3 (an_array)
			an_array.area.fill_with (450, 451, 486)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			    0,  450,    1,  451,  451,  450,    5,  452,  452,  453,
			  453,  450,   11,  450,  454,  450,  450,  455,  454,  454,
			  454,  450,  456,  456,  450,   24,   25,  450,  450,  450,
			  450,  450,  450,  450,  450,  457,  457,  450,  458,  450,
			  450,  450,  458,  458,  458,  458,  458,  450,  459,  450,
			  460,  461,  450,  450,  450,  450,  450,  462,  450,  454,
			  450,  450,  450,  450,  455,  450,  455,  463,   20,  464,
			  464,  450,  450,   72,   73,   74,   74,  464,  456,  456,
			  456,  456,  450,  450,   24,   25,   25,  450,  465,  450,
			  450,  450,  457,  458,  450,  450,  450,  450,  458,  458,

			  458,  458,  458,  459,  450,  466,  450,  450,  460,  450,
			  461,  110,  450,  450,  450,  450,  450,  462,  450,  467,
			  455,  467,  450,   20,  123,  454,  450,  468,   71,  468,
			  469,   71,  464,  464,  464,   74,   74,   74,   74,  450,
			  470,   25,  450,  450,  450,   91,  450,  458,  458,  458,
			  458,  458,  458,  458,  450,  450,  450,  471,  450,  110,
			  450,  450,  450,  450,  450,  450,  455,  455,  123,  124,
			  454,  464,  464,  450,   71,   71,  450,  134,   72,  178,
			  464,   74,   74,   74,   74,   74,  467,   25,  450,  450,
			  472,  473,  110,  450,  450,  474,  450,  450,  450,  455, yy_Dummy>>,
			1, 200, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  455,  170,  201,  450,  450,  450,   71,   71,   71,   71,
			  464,  176,  450,  178,  179,  176,  179,   74,  450,  464,
			  450,  134,  179,   74,   74,  450,   74,   25,  450,  450,
			  450,  473,  110,  475,  450,  450,  450,  455,  455,  455,
			  202,  202,  464,   71,   71,  464,   71,   71,   71,  450,
			  450,   72,  464,  179,  179,   74,  476,  464,  179,  179,
			   74,   74,   74,   25,  450,  110,  450,  450,  450,  240,
			  450,   71,   71,   71,  450,   71,   71,   71,   71,  450,
			  179,  252,   74,  477,  257,  464,  464,  183,  183,  464,
			   25,  450,  201,   71,  280,  252,  477,  464,  297,  464,

			  298,  179,  450,  215,   25,  473,  292,  464,   71,  251,
			  295,  478,  479,  450,  297,  298,  464,  300,  259,  464,
			  252,  450,  450,  473,  306,  450,   71,  309,  215,  478,
			  479,  480,  316,  332,  252,  473,  306,  454,  327,  252,
			  481,  482,  333,  333,  252,  252,  335,  346,  336,  454,
			  327,   72,  339,  483,  482,  342,  328,  252,  450,  450,
			  335,  450,  454,  350,   72,  328,  483,  332,  356,  356,
			  252,  450,  450,  335,  454,   72,  252,  484,  367,  252,
			  450,  473,  454,   72,  450,  376,  485,  378,  454,   72,
			  376,  356,  485,  378,  464,  454,   72,  390,  356,  486, yy_Dummy>>,
			1, 200, 200)
		end

	yy_def_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  450,  393,  464,  454,  454,   72,  356,  486,  450,  464,
			  454,  454,  454,  464,   72,  356,  450,  450,  464,  450,
			  464,  464,   72,  356,  450,  450,  464,   72,  356,  450,
			  464,   72,  356,  450,  464,  356,  450,  464,  464,  356,
			  450,  450,  464,  464,  464,  356,  450,  450,  450,  356,
			    0, yy_Dummy>>,
			1, 51, 400)
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
			create an_array.make_filled (0, 0, 450)
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
			    0,    0,    0,   66,   63,    1,    1,   54,   63,   41,
			   63,   64,    1,    1,   63,   63,   63,   31,   28,   31,
			   30,   31,   40,   36,   38,   35,   35,   39,   58,   59,
			   60,   61,   58,   58,   58,   58,   58,   24,   24,   24,
			   17,   24,   24,   65,   46,   65,   45,   43,   65,   63,
			   63,    1,    1,    0,   54,   53,   54,   63,   63,    0,
			    0,    0,    0,    0,    0,    0,    0,   14,   62,    1,
			    1,   62,   63,    4,   63,   63,   63,   28,    0,    0,
			   36,   35,   35,   58,   60,   59,   56,   55,   57,   58,

			   58,   58,   58,    0,   15,    0,    0,    0,   17,    0,
			    0,    0,   21,    0,    0,    0,   47,   43,    0,    0,
			   54,   63,    2,   63,   63,   63,   50,    0,    0,   42,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   62,
			   62,   63,   29,   27,    0,    0,   37,   58,   58,   58,
			   58,   58,   58,   58,    0,    0,   20,   17,    0,    0,
			   16,    0,   23,    0,    0,    0,   54,   54,   63,   63,
			   63,    0,    0,    0,    0,    0,   34,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,   62,   63,    0,    0,
			    0,    0,    0,   22,    0,    0,    0,    0,   52,   54, yy_Dummy>>,
			1, 200, 0)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			   54,   63,   63,   49,   48,   49,    0,    0,    0,    0,
			   34,   33,   13,    0,    0,   34,    0,    0,    8,    0,
			    0,    0,    0,    0,    0,    6,    0,   63,   27,   27,
			    0,    0,    0,    0,    0,    0,   44,   54,   54,   54,
			   63,   63,    0,    0,    0,    0,    0,    0,    0,   32,
			   13,    0,   33,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   63,   19,    0,    0,    0,    0,   63,
			   12,    0,    0,    0,   11,    0,    0,    0,    0,   33,
			    0,   33,    0,    0,    0,    0,    0,    0,    0,    0,
			   63,    0,   63,    0,    0,   33,    0,    0,    0,    0,

			    0,    0,    5,   26,   63,    0,   63,    0,    0,    0,
			   33,    0,    0,    0,    0,    0,    0,    0,    0,   26,
			   33,   63,    3,    0,   63,   10,    0,    0,   33,    0,
			    0,    0,    0,    0,   33,    0,   63,   63,    0,   33,
			    0,    0,    0,    0,   33,   33,    0,    0,   63,   63,
			    0,    0,   33,    0,    0,    0,   33,   33,   25,    0,
			    0,   18,   51,    0,    0,   33,    0,    0,   33,   33,
			   33,    0,    0,    0,   63,    0,   33,    0,    0,   33,
			   18,    0,   63,    0,    9,   33,    0,    0,   63,    0,
			   33,   33,    0,    0,    0,   63,    0,   33,   33,    0, yy_Dummy>>,
			1, 200, 200)
		end

	yy_accept_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,   63,   63,    0,   33,    0,    0,    0,
			   51,   63,   63,    0,    0,   33,    9,    0,    0,    7,
			    0,    0,    0,   33,    0,    7,    0,    0,   33,    0,
			    0,    0,   33,    0,    0,   33,    0,    0,    0,   33,
			    0,    0,    0,    0,    0,   33,    0,    0,    0,   33,
			    0, yy_Dummy>>,
			1, 51, 400)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 2924
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 450
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 451
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

	yyNb_rules: INTEGER = 65
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 66
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
