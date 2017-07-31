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
--|#line 195 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 195")
end
						-- ADL codes
	out_buffer.append ("[local::")
	output_new_at_ac_code (text_substring (9, text_count-1))
	out_buffer.append_character (']')

when 25 then
--|#line 201 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 201")
end

		out_buffer.append (text)
		set_start_condition (IN_ADL_VALUE_SET_DEF)
	
when 26 then
--|#line 207 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 207")
end
 -- match second last line with ';' termination (assumed value)
		output_new_at_ac_code (text)
	
when 27 then
--|#line 211 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 211")
end
out_buffer.append (text)
when 28 then
--|#line 214 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 214")
end
out_buffer.append (text)
when 29 then
--|#line 216 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 216")
end

		out_buffer.append (text)
		set_start_condition (INITIAL)
	
when 30 then
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
	
when 31 then
--|#line 245 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 245")
end

		out_buffer.append (text)
		set_start_condition (IN_VALUE_SET_DEF)
	
when 32 then
--|#line 250 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 250")
end

		out_buffer.append (text)
		set_start_condition (IN_VALUE_SET_DEF)
	
when 33 then
--|#line 256 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 256")
end
 
		out_buffer.append (text)
	
when 34 then
--|#line 260 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 260")
end

		out_buffer.append (text)
	
when 35 then
--|#line 265 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 265")
end
out_buffer.append (text)
when 36 then
--|#line 267 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 267")
end

		out_buffer.append (text)
		set_start_condition (INITIAL)
	
when 37 then
--|#line 274 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 274")
end

	out_buffer.append (text)
	set_start_condition (IN_PATH)

when 38 then
--|#line 279 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 279")
end

	out_buffer.append (text)
	set_start_condition (IN_PATH)

when 39 then
--|#line 285 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 285")
end
 
		out_buffer.append (text)
	
when 40 then
--|#line 289 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 289")
end
 
		out_buffer.append_character ('[')
		output_new_id_code (text_substring (2, text_count - 1))
		out_buffer.append_character (']')
	
when 41 then
--|#line 295 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 295")
end

		out_buffer.append (text)
	
when 42 then
--|#line 299 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 299")
end

		out_buffer.append (text)
		set_start_condition (INITIAL)
	
when 43 then
--|#line 304 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 304")
end

		out_buffer.append (text)
		set_start_condition (INITIAL)
	
when 44 then
--|#line 312 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 312")
end
out_buffer.append (text)
when 45 then
--|#line 314 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 314")
end
out_buffer.append (text)
when 46 then
--|#line 320 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 320")
end

		out_buffer.append (text)
	
when 47 then
--|#line 326 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 326")
end

		out_buffer.append (text)
	
when 48 then
--|#line 331 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 331")
end
			-- can occur in some string data
		out_buffer.append_character ('"')
		output_new_at_ac_code (text_substring (2, text_count - 1))
		out_buffer.append_character ('"')
	
when 49 then
--|#line 337 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 337")
end

		out_buffer.append (text)
	
when 50 then
--|#line 341 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 341")
end
				-- beginning of a string
		out_buffer.append (text)
		set_start_condition (IN_STR)
	
when 51 then
--|#line 347 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 347")
end
out_buffer.append (text)
when 52 then
--|#line 349 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 349")
end
out_buffer.append (text)
when 53 then
--|#line 351 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 351")
end

				out_buffer.append (text)
	
when 54 then
--|#line 355 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 355")
end
out_buffer.append (text)
when 55 then
--|#line 357 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 357")
end

				out_buffer.append (text)
	
when 56 then
--|#line 361 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 361")
end
						-- match final end of string
				out_buffer.append (text)
				set_start_condition (INITIAL)
	
when 57 then
--|#line 366 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 366")
end
	-- Catch-all rules (no backing up)
				set_start_condition (INITIAL)
	
when 58 then
--|#line 374 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 374")
end
		-- read non '[' non-space characters followed by whitespace
-- ^{WHITESPACE}[^" \t\r\n]+{WHITESPACE_CHAR}*	{		-- read non '[' non-space characters followed by whitespace
		out_buffer.append (text)
	
when 59 then
--|#line 379 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 379")
end
						-- read non '[' non-space characters followed by whitespace
-- [^" \t\r\n]+{WHITESPACE_CHAR}*	{						-- read non '[' non-space characters followed by whitespace
		out_buffer.append (text)
	
when 60 then
--|#line 386 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 386")
end
;
when 61 then
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
when 0, 1, 2, 4, 5 then
--|#line 385 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 385")
end
terminate
when 3 then
--|#line 367 "adl_14_2_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_2_rewriter.l' at line 367")
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
			create an_array.make_filled (0, 0, 3198)
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
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			    0,   14,   15,   16,   17,   15,   18,   14,   14,   14,
			   19,   14,   20,   14,   14,   14,   14,   14,   14,   21,
			   21,   21,   21,   21,   21,   21,   22,   14,   14,   14,
			   21,   21,   21,   21,   21,   21,   21,   21,   14,   14,
			   14,   14,   14,   14,   14,   14,   14,   14,   23,   62,
			   24,   23,   57,   93,   57,   57,  444,  120,  121,   25,
			   25,   25,   91,  122,   91,   26,   26,   26,   26,   27,
			   26,   26,  445,   63,   94,   25,   26,   26,   26,   27,
			   26,   26,   26,   26,   29,   29,   57,   29,   57,   57,
			   62,   29,   30,   58,   59,   59,   58,  424,   96,   29,

			   96,   60,   59,   59,   59,   59,   59,   59,   59,   59,
			   31,  276,   32,   29,   29,   57,   29,   57,   57,  117,
			   29,   30,  419,   64,   76,   59,   77,   76,   29,  140,
			  141,  141,   78,   77,   59,   77,   77,  247,  405,   31,
			  247,   32,   28,   33,   33,   28,   33,   28,   28,   28,
			   33,   34,   35,   28,   35,   35,   35,   28,   33,   28,
			   35,   35,   35,   35,   35,   35,   35,   28,   28,   36,
			   35,   35,   35,   35,   35,   35,   35,   35,   35,   28,
			   28,   28,   28,   28,   28,   28,   28,   28,   28,   38,
			   84,   84,   39,   84,  121,   87,   87,   84,   87,  122, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   91,   92,   87,   92,   92,   84,   91,  374,  103,   91,
			   87,  103,   91,   40,   57,  104,   57,   57,   57,  106,
			   57,   57,  106,   59,   59,   59,   59,  173,  276,   41,
			   42,   43,   44,   45,   38,   98,   98,   39,  212,  123,
			   95,   95,   95,   97,   97,   97,   99,   99,   99,  108,
			  123,  364,  133,  261,  110,  109,  134,  110,   40,  308,
			  332,  111,   58,   59,   59,   58,  136,  447,  136,  136,
			   60,  186,  186,  186,   41,   42,   43,   44,   45,   46,
			  112,  123,  151,   47,   48,  151,   48,   48,   48,  152,
			  399,   48,  118,  119,  118,  118,  116,  207,   67,   49,

			  207,   67,   76,   59,   77,   76,   77,   59,   77,   77,
			   78,  152,   50,   46,  152,  187,  116,   47,   48,  362,
			   48,   48,   48,  123,  123,   48,  176,  136,  447,  136,
			  136,  177,  361,   49,   74,  137,   79,   80,   79,   79,
			   92,  247,   92,   92,  247,  294,   50,   28,   51,   51,
			   51,   51,   52,   28,   28,   28,   28,   28,   53,   54,
			   54,   54,   28,   28,   28,   54,   54,   54,   54,   54,
			   54,   54,   55,   28,   28,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   28,   28,   28,   28,   28,   28,
			   28,   28,   28,   28,   57,  337,   57,   57,  120,  121, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  136,   62,  136,  136,  122,   65,   65,   65,  163,  164,
			  164,   65,   65,   65,   65,   65,   65,   65,  193,  194,
			  194,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   66,   67,  333,  334,   67,   68,   69,   66,   66,   69,
			   69,   66,   70,   70,   70,   66,   66,   66,   71,   71,
			   71,   71,   71,   71,   71,  331,   66,  329,   70,   72,
			   71,   73,   71,   71,   71,   71,   71,   74,   66,   66,
			   66,   66,   66,   66,   66,   66,   66,   56,   79,   80,
			   79,   79,  328,   56,   56,   56,   56,   56,   56,   81,
			   81,   81,   56,   56,   56,   81,   81,   81,   81,   81,

			   81,   81,   91,   56,   56,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   82,   82,   82,  225,  226,  226,
			   82,   82,   82,   82,   82,   82,   82,   98,   98,  300,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,  124,
			   66,  123,  325,  124,   66,  125,  124,  124,  125,  125,
			  126,  125,  125,  125,  124,  124,  124,  125,  125,  125,
			  125,  125,  125,  125,  127,  124,  123,  125,  128,  125,
			  125,  125,  125,  125,  125,  125,  124,  124,  124,  124,
			  124,  124,  124,  124,  124,  124,   66,   66,  347,  348, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   66,   66,   69,   66,   66,   69,   69,   66,   69,   69,
			   69,  129,   66,   66,   69,   69,   69,   69,   69,   69,
			   69,  322,   66,  123,   69,   69,   69,   69,   69,   69,
			   69,   69,   69,   66,   66,   66,   66,   66,   66,   66,
			   66,   66,   66,  130,   84,   84,  130,   84,   91,  320,
			  131,   84,  195,  306,   70,   70,   70,  196,   91,   84,
			   70,   70,   70,   70,   70,   70,   70,  227,  227,  227,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,  132,
			  132,  132,   95,   95,   95,  132,  132,  132,  132,  132,
			  132,  132,   95,   95,   95,  132,  132,  132,  132,  132,

			  132,  132,  132,  132,  120,  121,   87,   87,  103,   87,
			  122,  103,  295,   87,  123,  104,  103,  296,  138,  103,
			  441,   87,  302,  104,  118,  119,  118,  118,  292,  138,
			  142,  142,  143,  142,  142,  142,  142,  142,  142,   88,
			   88,  142,   88,   88,   88,  142,  142,  142,   88,   88,
			   88,   88,   88,   88,   88,  142,  142,  142,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,  142,  142,  142,
			  142,  142,  142,  142,  142,  142,  142,   91,  104,  110,
			  276,  104,  110,  333,  334,   91,  111,  154,   91,  154,
			  154,  154,  106,  447,  154,  106,  447,  111,  347,  348, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  111,  158,  159,   91,  158,  112,   66,  155,  160,  161,
			  168,  232,  232,  232,  144,  145,  146,  147,  148,  149,
			  149,  149,  150,  150,  150,  169,  387,  388,  109,  447,
			  127,  124,  123,  157,  165,  165,  165,   95,   95,   95,
			  165,  165,  165,  165,  165,  165,  165,  390,  391,  125,
			  165,  165,  165,  165,  165,  165,  165,  165,  165,  166,
			  166,  166,  250,  251,  251,  166,  166,  166,  166,  166,
			  166,  166,   91,  289,  231,  166,  166,  166,  166,  166,
			  166,  166,  166,  166,   57,   66,   57,   57,  169,  168,
			  130,  233,   91,  130,  124,  175,  176,  131,  167,  175,

			  176,  177,  178,  179,  179,  177,   97,   97,   97,  127,
			  288,  123,  125,  171,  276,  298,  123,  172,  131,  175,
			  176,  131,  180,  181,  181,  177,   99,   99,   99,  174,
			  174,  174,  299,  271,   91,  174,  174,  174,  174,  174,
			  174,  174,  396,  397,  123,  174,  174,  174,  174,  174,
			  174,  174,  174,  174,  175,  176,  183,  119,  183,  183,
			  177,  183,  119,  183,  183,  116,  120,  121,   95,   95,
			   95,  447,  122,  267,  185,  182,  186,  186,  186,  184,
			  151,  309,  120,  151,   91,  116,  310,  152,  261,  184,
			  142,  142,  190,  142,  142,  142,  255,  256,  256,  142, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  142,  142,  142,  142,  142,  142,  225,  225,  225,  142,
			  142,  142,  142,  142,  142,  142,  142,  142,   95,   95,
			   95,  103,  158,  159,  103,  158,  160,  190,  104,  160,
			  161,  195,  213,  262,  191,   62,  196,  177,  197,  197,
			  197,  356,  197,  197,  197,   57,  169,   57,   57,  215,
			  120,  121,  124,  203,  204,  204,  122,   66,  377,  313,
			   66,  224,  199,  199,  199,  199,  199,  199,  199,  261,
			  125,  123,  224,  199,  199,  199,  199,  199,  199,  199,
			  199,  169,  185,  246,  226,  226,  226,  124,  205,  206,
			  206,  175,  213,  185,  214,  214,  214,  177,  175,  176,

			  248,  214,  214,  214,  177,  125,   66,  207,  159,  215,
			  207,   66,   66,   66,   66,  208,  208,   66,  208,  208,
			  208,   66,   66,   66,  208,  208,  208,  208,  208,  208,
			  208,  230,   66,  123,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,   66,   66,   66,   66,   66,   66,   66,
			   66,   66,   66,   66,  387,  388,   66,  229,  175,  176,
			  131,  221,  221,  221,  177,  175,  176,   62,  390,  391,
			  217,  177,  217,  217,  234,  235,  235,  253,  101,  209,
			  210,  210,  210,  396,  397,  223,  210,  210,  210,  210,
			  210,  210,  210,  263,  264,  264,  210,  210,  210,  210, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  210,  210,  210,  210,  210,  211,  211,  211,  265,  265,
			  265,  211,  211,  211,  211,  211,  211,  211,  263,  263,
			  263,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  216,  202,  217,  216,  175,  176,  201,  218,  175,  219,
			  286,  220,  221,  221,  177,  231,   62,  232,  232,  232,
			  200,  175,  176,  236,  236,  236,  222,  177,  253,  198,
			  253,  253,  233,  237,  237,  237,  237,  237,  237,  237,
			  132,  132,  132,  259,  237,  237,  237,  237,  237,  237,
			  237,  237,  238,  238,  238,  255,  315,  256,  238,  238,
			  238,  238,  238,  238,  238,  343,  344,  344,  238,  238,

			  238,  238,  238,  238,  238,  238,  238,  239,  192,  189,
			  261,  169,  240,  124,  241,  241,  241,  124,  241,  241,
			  241,  242,  318,  319,  318,  318,  243,  124,  244,  245,
			  245,  125,  169,  292,  353,  125,  294,  295,  124,  245,
			  245,  245,  296,  175,  176,  125,  252,  252,  252,  177,
			  213,  355,  251,  251,  251,  177,  125,  249,  249,  249,
			  249,  249,  249,  249,  368,  369,  369,  215,  249,  249,
			  249,  249,  249,  249,  249,  249,  216,  123,  217,  216,
			  440,  175,  176,  218,  257,  258,  258,  177,  175,  176,
			   62,  258,  258,  258,  177,  120,  121,  234,  234,  234, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  188,  122,  123,  218,  195,  253,  218,  170,  260,  196,
			  119,  235,  235,  235,  316,  162,  156,  316,  260,  153,
			  254,  254,  254,  254,  254,  254,  254,  316,  101,   91,
			  316,  254,  254,  254,  254,  254,  254,  254,  254,  266,
			  266,  266,  317,  139,  123,  266,  266,  266,  266,  266,
			  266,  266,  353,  123,  366,  266,  266,  266,  266,  266,
			  266,  266,  266,  266,  169,  370,  370,  370,  169,  355,
			  124,  268,  269,  269,  124,  270,  270,  270,  169,  372,
			  372,  372,  135,  356,  124,  272,  273,  273,  125,  169,
			  123,   62,  125,  116,  115,  124,  274,  275,  275,  169,

			  358,  113,  125,  175,  213,  124,  275,  275,  275,  177,
			  102,  175,  176,  125,  279,  279,  279,  177,  378,  378,
			  378,  215,  101,  125,  277,  277,  277,  277,  277,  277,
			  277,  386,  386,  386,   91,  277,  277,  277,  277,  277,
			  277,  277,  277,  208,  208,   88,  278,  278,  278,  402,
			  402,  402,  278,  278,  278,  278,  278,  278,  278,   86,
			   85,  246,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  131,   83,  120,  121,  281,  281,  281,  447,  122,
			  447,  281,  281,  281,  281,  281,  281,  281,  301,  447,
			  209,  281,  281,  281,  281,  281,  281,  281,  281,  281, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_nxt_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  282,  447,  217,  282,  308,  309,  447,  283,  447,  219,
			  310,  447,  175,  176,  177,  284,  285,  285,  177,  175,
			  176,  447,  285,  285,  285,  177,  222,  282,  447,  217,
			  282,  294,  295,  447,  283,  447,  219,  296,  256,  256,
			  256,  177,  120,  121,  403,  403,  403,  231,  122,  264,
			  264,  264,  287,  222,  239,  447,  447,  242,  447,  240,
			  124,  239,  243,  124,  233,  169,  240,  124,  269,  269,
			  269,  124,  268,  268,  268,  447,  447,  282,  125,  217,
			  282,  125,  447,  447,  283,  125,  242,  447,  447,  125,
			  169,  243,  124,  273,  273,  273,  124,  290,  272,  272,

			  169,  447,  447,  123,  447,  447,  124,  272,  272,  272,
			  125,  447,  447,  298,  125,  132,  132,  132,  292,  447,
			  447,  341,  342,  342,  125,  291,  291,  291,  447,  447,
			  299,  291,  291,  291,  291,  291,  291,  291,  414,  414,
			  414,  291,  291,  291,  291,  291,  291,  291,  291,  291,
			  283,  304,  253,  283,  447,  447,  305,  124,   57,  292,
			   57,   57,  354,  354,  354,  447,  447,  297,  297,  297,
			  297,  297,  297,  297,  447,  125,  123,  447,  297,  297,
			  297,  297,  297,  297,  297,  297,  303,  303,  303,  303,
			  303,  303,  303,  346,  208,  208,  208,  303,  303,  303, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_nxt_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  303,  303,  303,  303,  303,  307,  307,  307,  420,  420,
			  420,  307,  307,  307,  307,  307,  307,  307,  395,  447,
			  447,  307,  307,  307,  307,  307,  307,  307,  307,  307,
			  311,  311,  311,  426,  426,  426,  311,  311,  311,  311,
			  311,  311,  311,  447,  447,  123,  311,  311,  311,  311,
			  311,  311,  311,  311,  311,  312,  312,  312,  428,  428,
			  428,  312,  312,  312,  312,  312,  312,  312,  406,  406,
			  406,  312,  312,  312,  312,  312,  312,  312,  312,  312,
			  314,  314,  314,  123,  447,  447,  314,  314,  314,  314,
			  314,  314,  314,  429,  429,  429,  314,  314,  314,  314,

			  314,  314,  314,  314,  314,  318,  319,  318,  318,  169,
			  423,  423,  423,  120,  121,  124,  272,  323,  273,  122,
			  321,  321,  321,  447,  447,  123,  321,  321,  321,  321,
			  321,  321,  321,  125,  447,  447,  321,  321,  321,  321,
			  321,  321,  321,  321,  321,  324,  324,  324,  324,  324,
			  324,  324,   57,  447,   57,   57,  324,  324,  324,  324,
			  324,  324,  324,  324,  330,  330,  330,  330,  330,  330,
			  330,  447,  447,  123,  447,  330,  330,  330,  330,  330,
			  330,  330,  330,  304,  409,  417,  417,  417,  305,  124,
			  273,  273,  273,  292,  353,  447,  354,  354,  354,  292, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_nxt_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  381,  447,  367,  367,  367,  447,  447,  125,  335,  335,
			  335,  355,  447,  447,  335,  335,  335,  335,  335,  335,
			  335,  433,  433,  433,  335,  335,  335,  335,  335,  335,
			  335,  335,  335,   66,  447,   57,   66,   57,   57,  447,
			  356,  447,  357,  357,  357,  447,  359,  359,  359,  447,
			  336,  336,  336,  336,  336,  336,  336,  358,  447,  246,
			  447,  336,  336,  336,  336,  336,  336,  336,  336,  339,
			  339,  339,  339,  339,  339,  339,  417,  417,  417,  447,
			  339,  339,  339,  339,  339,  339,  339,  339,  340,  340,
			  340,  123,  447,  447,  340,  340,  340,  340,  340,  340,

			  340,  431,  431,  431,  340,  340,  340,  340,  340,  340,
			  340,  340,  340,  345,  345,  345,  123,  447,  447,  345,
			  345,  345,  345,  345,  345,  345,  428,  428,  428,  345,
			  345,  345,  345,  345,  345,  345,  345,  345,  349,  349,
			  349,  381,  447,  447,  349,  349,  349,  349,  349,  349,
			  349,  439,  439,  439,  349,  349,  349,  349,  349,  349,
			  349,  349,  349,  352,  352,  352,  416,  447,  447,  352,
			  352,  352,  352,  352,  352,  352,  439,  439,  439,  352,
			  352,  352,  352,  352,  352,  352,  352,  352,  360,  360,
			  360,  123,  447,  447,  360,  360,  360,  360,  360,  360, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_nxt_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  360,  446,  446,  446,  360,  360,  360,  360,  360,  360,
			  360,  360,  360,  365,  366,  366,  443,  443,  443,  208,
			  208,  208,  208,  208,  208,  208,  447,  208,  208,  208,
			  208,  208,  208,  208,  208,  208,  208,  208,   57,  444,
			   57,   57,  353,  447,  208,  208,  208,  371,  436,  359,
			  359,  359,  373,  373,  373,  373,  373,  373,  373,  355,
			  208,  208,  208,  373,  373,  373,  373,  373,  373,  373,
			  373,  375,  375,  375,  375,  375,  375,  375,  442,  443,
			  443,  443,  375,  375,  375,  375,  375,  375,  375,  375,
			  292,  447,  447,  376,  376,  376,  356,  447,  369,  369,

			  369,  447,  447,   57,  447,   57,   57,  380,  447,  372,
			  372,  372,  447,  377,  379,  379,  379,   57,  447,   57,
			   57,  447,  447,  447,  381,  382,  382,  382,  392,  392,
			  392,  382,  382,  382,  382,  382,  382,  382,  443,  443,
			  443,  382,  382,  382,  382,  382,  382,  382,  382,  382,
			  384,  384,  384,  422,  447,  447,  384,  384,  384,  384,
			  384,  384,  384,  447,  447,  447,  384,  384,  384,  384,
			  384,  384,  384,  384,  384,   57,  447,   57,   57,  393,
			  447,  386,  386,  386,  385,  447,  379,  379,  379,  394,
			  394,  394,  447,  447,  447,  394,  394,  394,  394,  394, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_nxt_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  394,  394,  446,  446,  446,  394,  394,  394,  394,  394,
			  394,  394,  394,  394,  398,  398,  398,  413,  447,  447,
			  398,  398,  398,  398,  398,  398,  398,  447,  447,  447,
			  398,  398,  398,  398,  398,  398,  398,  398,  398,   57,
			  447,   57,   57,  447,  447,  400,   57,  401,   57,   57,
			  392,  392,  392,   57,  447,   57,   57,  407,  407,  407,
			  410,  447,  411,  447,  447,  402,  402,  402,  412,  447,
			  403,  403,  403,  415,  447,  406,  406,  406,  447,  447,
			  408,   57,  408,   57,   57,  413,   57,  447,   57,   57,
			  416,  447,  407,  407,  407,  447,  447,  407,  407,  407,

			  417,  417,  417,  421,  447,  414,  414,  414,  425,  447,
			  420,  420,  420,  447,  427,  123,  423,  423,  423,  447,
			  422,  447,  430,  418,  426,  426,  426,  410,  447,  432,
			  447,  123,  429,  429,  429,  434,  447,  435,  447,  447,
			  431,  431,  431,  437,  447,  438,  447,  447,  433,  433,
			  433,  439,  439,  439,  105,  123,  447,  105,  447,  105,
			  447,  105,  105,  105,  105,  447,  123,  447,  447,  447,
			  447,  447,  447,  447,  440,   28,   28,   28,   28,   28,
			   28,   28,   28,   28,   28,   28,   28,   28,   28,   28,
			   28,   28,   28,   28,   28,   28,   28,   37,   37,   37, yy_Dummy>>,
			1, 200, 2400)
		end

	yy_nxt_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   37,   37,   37,   37,   37,   37,   37,   37,   37,   37,
			   37,   37,   37,   37,   37,   37,   37,   37,   37,   56,
			   56,  447,   56,   56,  447,   56,   56,   56,   56,   56,
			   56,   56,   56,  447,   56,   56,   56,   56,   56,   56,
			   56,   61,   61,  447,   61,   61,   61,   61,   61,   61,
			   61,   61,   61,   61,   61,   61,  447,   61,   61,   61,
			   61,   61,   61,   75,   75,   75,   75,   75,  447,   75,
			   75,   75,   75,   75,   75,   75,   75,  447,   75,   75,
			   75,   75,   75,   75,   75,   89,   89,   89,   89,   89,
			   89,   89,  447,  447,  447,   89,   89,   89,   89,   90,

			   90,  447,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,  447,   90,   90,   90,   90,   90,
			   90,  100,  100,  447,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  447,  100,  100,  100,
			  100,  100,  100,  107,  447,  447,  107,  447,  447,  447,
			  447,  107,  107,  107,  107,  107,  447,  447,  447,  107,
			  107,  107,  107,  107,  114,  114,  114,  114,  114,  447,
			  447,  447,  114,  114,  114,  114,   64,   64,   64,   64,
			   64,   64,   64,   64,   64,   64,   64,   64,   64,   64,
			   64,   64,   64,   64,   64,   64,   64,   64,   66,   66, yy_Dummy>>,
			1, 200, 2600)
		end

	yy_nxt_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  447,  447,   66,   66,   66,   66,   66,   66,   66,   66,
			   66,   66,  447,   66,   66,   66,   66,   66,   66,   66,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  116,  116,  116,  116,  116,  116,
			  116,  116,  116,  116,  116,  116,  116,  116,  116,  116,
			  116,  116,  116,  116,  116,  116,  124,  124,  447,  447,
			  124,  124,  124,  124,  124,  124,  124,  124,  124,  124,

			  124,  124,  124,  124,  124,  124,  124,  124,  127,  447,
			  447,  447,  127,  127,  127,  127,  127,  127,  127,  127,
			  127,  127,  127,  127,  447,  127,  127,  127,  127,  127,
			  137,  137,  137,  137,  137,  137,  137,  137,  137,  137,
			  137,  137,  137,  137,  137,  137,  137,  137,  137,  137,
			  137,  137,  154,  447,  447,  154,  447,  154,  447,  154,
			  154,  154,  154,  187,  187,  447,  187,  187,  187,  187,
			  187,  187,  187,  187,  187,  187,  187,  187,  447,  187,
			  187,  187,  187,  187,  187,  228,  228,  228,  228,  228,
			  447,  447,  447,  228,  228,  228,  228,  192,  192,  192, yy_Dummy>>,
			1, 200, 2800)
		end

	yy_nxt_template_16 (an_array: ARRAY [INTEGER])
			-- Fill chunk #16 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  192,  192,  192,  192,  192,  192,  192,  192,  192,  192,
			  192,  192,  192,  192,  192,  192,  192,  192,  192,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  280,  447,  280,  280,  447,  447,  447,  338,  338,
			  447,  447,  280,  280,  338,  338,  338,  447,  280,  280,
			  280,  293,  293,  293,  293,  293,  447,  447,  447,  293,
			  293,  293,  293,  326,  326,  326,  326,  326,  447,  447,
			  447,  326,  326,  326,  326,  327,  327,  327,  327,  327,
			  447,  350,  350,  327,  327,  327,  327,  350,  350,  350,

			  351,  351,  351,  351,  351,  447,  447,  447,  351,  351,
			  351,  351,  363,  363,  363,  363,  363,  447,  383,  383,
			  363,  363,  363,  363,  383,  383,  383,  389,  389,  389,
			  389,  389,  447,  447,  447,  389,  389,  389,  389,  404,
			  404,  404,  404,  404,  447,  447,  447,  404,  404,  404,
			  404,   13,  447,  447,  447,  447,  447,  447,  447,  447,
			  447,  447,  447,  447,  447,  447,  447,  447,  447,  447,
			  447,  447,  447,  447,  447,  447,  447,  447,  447,  447,
			  447,  447,  447,  447,  447,  447,  447,  447,  447,  447,
			  447,  447,  447,  447,  447,  447,  447,  447,  447, yy_Dummy>>,
			1, 199, 3000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 3198)
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
			    1,    1,    1,    1,    1,    1,    1,    1,    2,   18,
			    2,    2,   14,   40,   14,   14,  445,   65,   65,    2,
			    2,    2,   42,   65,  145,    2,    2,    2,    2,    2,
			    2,    2,  438,   18,   40,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    3,    3,   20,    3,   20,   20,
			   63,    3,    3,   15,   15,   15,   15,  419,   42,    3,

			  145,   15,   16,   16,   16,   16,   17,   17,   17,   17,
			    3,  413,    3,    4,    4,   19,    4,   19,   19,   63,
			    4,    4,  411,   19,   23,   23,   23,   23,    4,   86,
			   86,   86,   23,   24,   24,   24,   24,  209,  397,    4,
			  209,    4,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    7,
			   29,   29,    7,   29,  166,   33,   33,   29,   33,  166, yy_Dummy>>,
			1, 200, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   44,   38,   33,   38,   38,   29,   41,  363,   48,   43,
			   33,   48,   45,    7,   56,   48,   56,   56,   57,   49,
			   57,   57,   49,   59,   59,   59,   59,  129,  355,    7,
			    7,    7,    7,    7,    8,   44,   44,    8,  177,  129,
			   41,   41,   41,   43,   43,   43,   45,   45,   45,   49,
			  177,  352,   72,  320,   50,   49,   72,   50,    8,  351,
			  320,   50,   58,   58,   58,   58,   75,   75,   75,   75,
			   58,  141,  141,  141,    8,    8,    8,    8,    8,    9,
			   50,  391,  101,    9,    9,  101,    9,    9,    9,  101,
			  391,    9,   64,   64,   64,   64,   64,  207,   67,    9,

			  207,   67,   76,   76,   76,   76,   77,   77,   77,   77,
			   76,  152,    9,   10,  152,  152,   64,   10,   10,  349,
			   10,   10,   10,  207,   67,   10,  211,   78,   78,   78,
			   78,  211,  348,   10,   67,   78,   79,   79,   79,   79,
			   92,  247,   92,   92,  247,  340,   10,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   21,  326,   21,   21,   82,   82, yy_Dummy>>,
			1, 200, 200)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  136,  117,  136,  136,   82,   21,   21,   21,  117,  117,
			  117,   21,   21,   21,   21,   21,   21,   21,  162,  162,
			  162,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   22,   22,  321,  321,   22,   22,   22,   22,   22,   22,
			   22,   22,   22,   22,   22,   22,   22,   22,   22,   22,
			   22,   22,   22,   22,   22,  317,   22,  311,   22,   22,
			   22,   22,   22,   22,   22,   22,   22,   22,   22,   22,
			   22,   22,   22,   22,   22,   22,   22,   25,   25,   25,
			   25,   25,  310,   25,   25,   25,   25,   25,   25,   25,
			   25,   25,   25,   25,   25,   25,   25,   25,   25,   25,

			   25,   25,  147,   25,   25,   25,   25,   25,   25,   25,
			   25,   25,   25,   25,   25,   25,   25,   25,   25,   25,
			   25,   25,   25,   25,   26,   26,   26,  185,  185,  185,
			   26,   26,   26,   26,   26,   26,   26,  147,  147,  286,
			   26,   26,   26,   26,   26,   26,   26,   26,   26,   68,
			   68,  286,  307,   68,   68,   68,   68,   68,   68,   68,
			   68,   68,   68,   68,   68,   68,   68,   68,   68,   68,
			   68,   68,   68,   68,   68,   68,   68,   68,   68,   68,
			   68,   68,   68,   68,   68,   68,   68,   68,   68,   68,
			   68,   68,   68,   68,   68,   68,   69,   69,  335,  335, yy_Dummy>>,
			1, 200, 400)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   69,   69,   69,   69,   69,   69,   69,   69,   69,   69,
			   69,   69,   69,   69,   69,   69,   69,   69,   69,   69,
			   69,  304,   69,   69,   69,   69,   69,   69,   69,   69,
			   69,   69,   69,   69,   69,   69,   69,   69,   69,   69,
			   69,   69,   69,   70,   84,   84,   70,   84,   96,  302,
			   70,   84,  234,  291,   70,   70,   70,  234,   97,   84,
			   70,   70,   70,   70,   70,   70,   70,  186,  186,  186,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   71,
			   71,   71,   96,   96,   96,   71,   71,   71,   71,   71,
			   71,   71,   97,   97,   97,   71,   71,   71,   71,   71,

			   71,   71,   71,   71,   83,   83,   87,   87,  103,   87,
			   83,  103,  312,   87,  435,  103,  105,  312,   83,  105,
			  435,   87,  288,  105,  118,  118,  118,  118,  278,   83,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   95,  104,  110,
			  276,  104,  110,  345,  345,   98,  110,  104,   99,  104,
			  104,  104,  106,  107,  104,  106,  107,  111,  360,  360, yy_Dummy>>,
			1, 200, 600)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  111,  112,  112,  144,  112,  110,  124,  107,  112,  112,
			  124,  194,  194,  194,   95,   95,   95,   95,   95,   98,
			   98,   98,   99,   99,   99,  125,  382,  382,  106,  107,
			  124,  125,  124,  111,  120,  120,  120,  144,  144,  144,
			  120,  120,  120,  120,  120,  120,  120,  384,  384,  125,
			  120,  120,  120,  120,  120,  120,  120,  120,  120,  121,
			  121,  121,  213,  213,  213,  121,  121,  121,  121,  121,
			  121,  121,  146,  266,  263,  121,  121,  121,  121,  121,
			  121,  121,  121,  121,  122,  126,  122,  122,  128,  126,
			  130,  263,  148,  130,  128,  132,  132,  130,  122,  133,

			  133,  132,  133,  133,  133,  133,  146,  146,  146,  126,
			  262,  126,  128,  128,  246,  315,  130,  128,  131,  134,
			  134,  131,  134,  134,  134,  134,  148,  148,  148,  131,
			  131,  131,  315,  242,  149,  131,  131,  131,  131,  131,
			  131,  131,  389,  389,  131,  131,  131,  131,  131,  131,
			  131,  131,  131,  131,  135,  135,  183,  183,  183,  183,
			  135,  137,  137,  137,  137,  137,  138,  138,  149,  149,
			  149,  344,  138,  239,  140,  135,  140,  140,  140,  138,
			  151,  327,  238,  151,  150,  137,  327,  151,  344,  138,
			  142,  142,  230,  142,  142,  142,  219,  219,  219,  142, yy_Dummy>>,
			1, 200, 800)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  142,  142,  142,  142,  142,  142,  227,  227,  227,  142,
			  142,  142,  142,  142,  142,  142,  142,  142,  150,  150,
			  150,  154,  158,  158,  154,  158,  160,  160,  154,  160,
			  158,  163,  250,  229,  160,  164,  163,  250,  163,  163,
			  163,  368,  164,  164,  164,  167,  171,  167,  167,  250,
			  184,  184,  171,  171,  171,  171,  184,  208,  368,  296,
			  208,  184,  167,  167,  167,  167,  167,  167,  167,  228,
			  171,  296,  184,  167,  167,  167,  167,  167,  167,  167,
			  167,  172,  226,  208,  226,  226,  226,  172,  172,  172,
			  172,  178,  178,  225,  178,  178,  178,  178,  179,  179,

			  210,  179,  179,  179,  179,  172,  173,  173,  192,  178,
			  173,  173,  173,  173,  173,  173,  173,  173,  173,  173,
			  173,  173,  173,  173,  173,  173,  173,  173,  173,  173,
			  173,  191,  173,  173,  173,  173,  173,  173,  173,  173,
			  173,  173,  173,  173,  173,  173,  173,  173,  173,  173,
			  173,  173,  173,  174,  394,  394,  174,  189,  181,  181,
			  174,  181,  181,  181,  181,  182,  182,  196,  398,  398,
			  217,  182,  217,  217,  196,  196,  196,  217,  187,  174,
			  175,  175,  175,  404,  404,  182,  175,  175,  175,  175,
			  175,  175,  175,  231,  231,  231,  175,  175,  175,  175, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  175,  175,  175,  175,  175,  176,  176,  176,  232,  232,
			  232,  176,  176,  176,  176,  176,  176,  176,  265,  265,
			  265,  176,  176,  176,  176,  176,  176,  176,  176,  176,
			  180,  170,  180,  180,  259,  259,  169,  180,  180,  180,
			  259,  180,  180,  180,  180,  193,  197,  193,  193,  193,
			  168,  223,  223,  197,  197,  197,  180,  223,  253,  165,
			  253,  253,  193,  198,  198,  198,  198,  198,  198,  198,
			  285,  285,  285,  223,  198,  198,  198,  198,  198,  198,
			  198,  198,  199,  199,  199,  298,  298,  298,  199,  199,
			  199,  199,  199,  199,  199,  332,  332,  332,  199,  199,

			  199,  199,  199,  199,  199,  199,  199,  203,  161,  156,
			  332,  204,  203,  203,  203,  203,  203,  204,  204,  204,
			  204,  205,  318,  318,  318,  318,  205,  205,  205,  205,
			  205,  203,  206,  376,  376,  204,  281,  281,  206,  206,
			  206,  206,  281,  214,  214,  205,  214,  214,  214,  214,
			  251,  376,  251,  251,  251,  251,  206,  212,  212,  212,
			  212,  212,  212,  212,  356,  356,  356,  251,  212,  212,
			  212,  212,  212,  212,  212,  212,  216,  441,  216,  216,
			  441,  220,  220,  216,  220,  220,  220,  220,  221,  221,
			  236,  221,  221,  221,  221,  224,  224,  236,  236,  236, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  155,  224,  216,  218,  235,  218,  218,  127,  224,  235,
			  116,  235,  235,  235,  300,  115,  108,  300,  224,  102,
			  218,  218,  218,  218,  218,  218,  218,  316,  100,   90,
			  316,  218,  218,  218,  218,  218,  218,  218,  218,  237,
			  237,  237,  300,   85,   74,  237,  237,  237,  237,  237,
			  237,  237,  366,  316,  366,  237,  237,  237,  237,  237,
			  237,  237,  237,  237,  240,  357,  357,  357,  241,  366,
			  240,  240,  240,  240,  241,  241,  241,  241,  243,  361,
			  361,  361,   73,  378,  243,  243,  243,  243,  240,  244,
			   66,   61,  241,   60,   55,  244,  244,  244,  244,  245,

			  378,   52,  243,  279,  279,  245,  245,  245,  245,  279,
			   47,  252,  252,  244,  252,  252,  252,  252,  370,  370,
			  370,  279,   46,  245,  248,  248,  248,  248,  248,  248,
			  248,  380,  380,  380,   37,  248,  248,  248,  248,  248,
			  248,  248,  248,  249,  249,   34,  249,  249,  249,  393,
			  393,  393,  249,  249,  249,  249,  249,  249,  249,   32,
			   30,  249,  249,  249,  249,  249,  249,  249,  249,  249,
			  249,  254,   27,  287,  287,  254,  254,  254,   13,  287,
			    0,  254,  254,  254,  254,  254,  254,  254,  287,    0,
			  254,  254,  254,  254,  254,  254,  254,  254,  254,  254, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_chk_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  255,    0,  255,  255,  293,  293,    0,  255,    0,  255,
			  293,    0,  257,  257,  255,  257,  257,  257,  257,  258,
			  258,    0,  258,  258,  258,  258,  255,  256,    0,  256,
			  256,  314,  314,    0,  256,    0,  256,  314,  256,  256,
			  256,  256,  260,  260,  395,  395,  395,  264,  260,  264,
			  264,  264,  260,  256,  268,    0,    0,  272,    0,  268,
			  268,  269,  272,  272,  264,  270,  269,  269,  269,  269,
			  269,  270,  270,  270,  270,    0,    0,  282,  268,  282,
			  282,  272,    0,    0,  282,  269,  273,    0,    0,  270,
			  274,  273,  273,  273,  273,  273,  274,  274,  274,  274,

			  275,    0,    0,  282,    0,    0,  275,  275,  275,  275,
			  273,    0,    0,  284,  274,  284,  284,  284,  331,    0,
			    0,  331,  331,  331,  275,  277,  277,  277,    0,    0,
			  284,  277,  277,  277,  277,  277,  277,  277,  405,  405,
			  405,  277,  277,  277,  277,  277,  277,  277,  277,  277,
			  283,  290,  283,  283,    0,    0,  290,  290,  334,  342,
			  334,  334,  342,  342,  342,    0,    0,  283,  283,  283,
			  283,  283,  283,  283,    0,  290,  283,    0,  283,  283,
			  283,  283,  283,  283,  283,  283,  289,  289,  289,  289,
			  289,  289,  289,  334,  388,  388,  388,  289,  289,  289, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_chk_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  289,  289,  289,  289,  289,  292,  292,  292,  412,  412,
			  412,  292,  292,  292,  292,  292,  292,  292,  388,    0,
			    0,  292,  292,  292,  292,  292,  292,  292,  292,  292,
			  294,  294,  294,  421,  421,  421,  294,  294,  294,  294,
			  294,  294,  294,    0,    0,  294,  294,  294,  294,  294,
			  294,  294,  294,  294,  294,  295,  295,  295,  424,  424,
			  424,  295,  295,  295,  295,  295,  295,  295,  399,  399,
			  399,  295,  295,  295,  295,  295,  295,  295,  295,  295,
			  297,  297,  297,  399,    0,    0,  297,  297,  297,  297,
			  297,  297,  297,  425,  425,  425,  297,  297,  297,  297,

			  297,  297,  297,  297,  297,  301,  301,  301,  301,  305,
			  415,  415,  415,  301,  301,  305,  305,  305,  305,  301,
			  303,  303,  303,    0,    0,  415,  303,  303,  303,  303,
			  303,  303,  303,  305,    0,    0,  303,  303,  303,  303,
			  303,  303,  303,  303,  303,  306,  306,  306,  306,  306,
			  306,  306,  401,    0,  401,  401,  306,  306,  306,  306,
			  306,  306,  306,  306,  313,  313,  313,  313,  313,  313,
			  313,    0,    0,  313,    0,  313,  313,  313,  313,  313,
			  313,  313,  313,  323,  401,  417,  417,  417,  323,  323,
			  323,  323,  323,  341,  341,    0,  341,  341,  341,  354, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_chk_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  417,    0,  354,  354,  354,    0,    0,  323,  324,  324,
			  324,  341,    0,    0,  324,  324,  324,  324,  324,  324,
			  324,  430,  430,  430,  324,  324,  324,  324,  324,  324,
			  324,  324,  324,  325,    0,  346,  325,  346,  346,    0,
			  343,    0,  343,  343,  343,    0,  346,  346,  346,    0,
			  325,  325,  325,  325,  325,  325,  325,  343,    0,  325,
			    0,  325,  325,  325,  325,  325,  325,  325,  325,  329,
			  329,  329,  329,  329,  329,  329,  418,  418,  418,    0,
			  329,  329,  329,  329,  329,  329,  329,  329,  330,  330,
			  330,  418,    0,    0,  330,  330,  330,  330,  330,  330,

			  330,  427,  427,  427,  330,  330,  330,  330,  330,  330,
			  330,  330,  330,  333,  333,  333,  427,    0,    0,  333,
			  333,  333,  333,  333,  333,  333,  428,  428,  428,  333,
			  333,  333,  333,  333,  333,  333,  333,  333,  336,  336,
			  336,  428,    0,    0,  336,  336,  336,  336,  336,  336,
			  336,  439,  439,  439,  336,  336,  336,  336,  336,  336,
			  336,  336,  336,  339,  339,  339,  439,    0,    0,  339,
			  339,  339,  339,  339,  339,  339,  440,  440,  440,  339,
			  339,  339,  339,  339,  339,  339,  339,  339,  347,  347,
			  347,  440,    0,    0,  347,  347,  347,  347,  347,  347, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_chk_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  347,  442,  442,  442,  347,  347,  347,  347,  347,  347,
			  347,  347,  347,  353,  353,  353,  437,  437,  437,  353,
			  353,  353,  353,  353,  353,  353,    0,  432,  432,  432,
			  353,  353,  353,  353,  353,  353,  353,  353,  359,  437,
			  359,  359,  365,    0,  365,  365,  365,  359,  432,  359,
			  359,  359,  362,  362,  362,  362,  362,  362,  362,  365,
			  436,  436,  436,  362,  362,  362,  362,  362,  362,  362,
			  362,  364,  364,  364,  364,  364,  364,  364,  436,  444,
			  444,  444,  364,  364,  364,  364,  364,  364,  364,  364,
			  367,    0,    0,  367,  367,  367,  369,    0,  369,  369,

			  369,    0,    0,  371,    0,  371,  371,  372,    0,  372,
			  372,  372,    0,  369,  371,  371,  371,  385,    0,  385,
			  385,    0,    0,    0,  372,  373,  373,  373,  385,  385,
			  385,  373,  373,  373,  373,  373,  373,  373,  443,  443,
			  443,  373,  373,  373,  373,  373,  373,  373,  373,  373,
			  375,  375,  375,  443,    0,    0,  375,  375,  375,  375,
			  375,  375,  375,    0,    0,    0,  375,  375,  375,  375,
			  375,  375,  375,  375,  375,  379,    0,  379,  379,  386,
			    0,  386,  386,  386,  379,    0,  379,  379,  379,  387,
			  387,  387,    0,    0,    0,  387,  387,  387,  387,  387, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_chk_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  387,  387,  446,  446,  446,  387,  387,  387,  387,  387,
			  387,  387,  387,  387,  390,  390,  390,  446,    0,    0,
			  390,  390,  390,  390,  390,  390,  390,    0,    0,    0,
			  390,  390,  390,  390,  390,  390,  390,  390,  390,  392,
			    0,  392,  392,    0,    0,  392,  400,  392,  400,  400,
			  392,  392,  392,  409,    0,  409,  409,  400,  400,  400,
			  402,    0,  402,    0,    0,  402,  402,  402,  403,    0,
			  403,  403,  403,  406,    0,  406,  406,  406,    0,    0,
			  400,  407,  409,  407,  407,  403,  408,    0,  408,  408,
			  406,    0,  407,  407,  407,    0,    0,  408,  408,  408,

			  410,  410,  410,  414,    0,  414,  414,  414,  420,    0,
			  420,  420,  420,    0,  423,  410,  423,  423,  423,    0,
			  414,    0,  426,  410,  426,  426,  426,  429,    0,  429,
			    0,  423,  429,  429,  429,  431,    0,  431,    0,    0,
			  431,  431,  431,  433,    0,  433,    0,    0,  433,  433,
			  433,  434,  434,  434,  456,  431,    0,  456,    0,  456,
			    0,  456,  456,  456,  456,    0,  434,    0,    0,    0,
			    0,    0,    0,    0,  434,  448,  448,  448,  448,  448,
			  448,  448,  448,  448,  448,  448,  448,  448,  448,  448,
			  448,  448,  448,  448,  448,  448,  448,  449,  449,  449, yy_Dummy>>,
			1, 200, 2400)
		end

	yy_chk_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  449,  449,  449,  449,  449,  449,  449,  449,  449,  449,
			  449,  449,  449,  449,  449,  449,  449,  449,  449,  450,
			  450,    0,  450,  450,    0,  450,  450,  450,  450,  450,
			  450,  450,  450,    0,  450,  450,  450,  450,  450,  450,
			  450,  451,  451,    0,  451,  451,  451,  451,  451,  451,
			  451,  451,  451,  451,  451,  451,    0,  451,  451,  451,
			  451,  451,  451,  452,  452,  452,  452,  452,    0,  452,
			  452,  452,  452,  452,  452,  452,  452,    0,  452,  452,
			  452,  452,  452,  452,  452,  453,  453,  453,  453,  453,
			  453,  453,    0,    0,    0,  453,  453,  453,  453,  454,

			  454,    0,  454,  454,  454,  454,  454,  454,  454,  454,
			  454,  454,  454,  454,    0,  454,  454,  454,  454,  454,
			  454,  455,  455,    0,  455,  455,  455,  455,  455,  455,
			  455,  455,  455,  455,  455,  455,    0,  455,  455,  455,
			  455,  455,  455,  457,    0,    0,  457,    0,    0,    0,
			    0,  457,  457,  457,  457,  457,    0,    0,    0,  457,
			  457,  457,  457,  457,  458,  458,  458,  458,  458,    0,
			    0,    0,  458,  458,  458,  458,  459,  459,  459,  459,
			  459,  459,  459,  459,  459,  459,  459,  459,  459,  459,
			  459,  459,  459,  459,  459,  459,  459,  459,  460,  460, yy_Dummy>>,
			1, 200, 2600)
		end

	yy_chk_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,  460,  460,  460,  460,  460,  460,  460,  460,
			  460,  460,    0,  460,  460,  460,  460,  460,  460,  460,
			  461,  461,  461,  461,  461,  461,  461,  461,  461,  461,
			  461,  461,  461,  461,  461,  461,  461,  461,  461,  461,
			  461,  461,  462,  462,  462,  462,  462,  462,  462,  462,
			  462,  462,  462,  462,  462,  462,  462,  462,  462,  462,
			  462,  462,  462,  462,  463,  463,  463,  463,  463,  463,
			  463,  463,  463,  463,  463,  463,  463,  463,  463,  463,
			  463,  463,  463,  463,  463,  463,  464,  464,    0,    0,
			  464,  464,  464,  464,  464,  464,  464,  464,  464,  464,

			  464,  464,  464,  464,  464,  464,  464,  464,  465,    0,
			    0,    0,  465,  465,  465,  465,  465,  465,  465,  465,
			  465,  465,  465,  465,    0,  465,  465,  465,  465,  465,
			  466,  466,  466,  466,  466,  466,  466,  466,  466,  466,
			  466,  466,  466,  466,  466,  466,  466,  466,  466,  466,
			  466,  466,  467,    0,    0,  467,    0,  467,    0,  467,
			  467,  467,  467,  468,  468,    0,  468,  468,  468,  468,
			  468,  468,  468,  468,  468,  468,  468,  468,    0,  468,
			  468,  468,  468,  468,  468,  469,  469,  469,  469,  469,
			    0,    0,    0,  469,  469,  469,  469,  470,  470,  470, yy_Dummy>>,
			1, 200, 2800)
		end

	yy_chk_template_16 (an_array: ARRAY [INTEGER])
			-- Fill chunk #16 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  470,  470,  470,  470,  470,  470,  470,  470,  470,  470,
			  470,  470,  470,  470,  470,  470,  470,  470,  470,  471,
			  471,  471,  471,  471,  471,  471,  471,  471,  471,  471,
			  471,  471,  471,  471,  471,  471,  471,  471,  471,  471,
			  471,  472,    0,  472,  472,    0,    0,    0,  476,  476,
			    0,    0,  472,  472,  476,  476,  476,    0,  472,  472,
			  472,  473,  473,  473,  473,  473,    0,    0,    0,  473,
			  473,  473,  473,  474,  474,  474,  474,  474,    0,    0,
			    0,  474,  474,  474,  474,  475,  475,  475,  475,  475,
			    0,  477,  477,  475,  475,  475,  475,  477,  477,  477,

			  478,  478,  478,  478,  478,    0,    0,    0,  478,  478,
			  478,  478,  479,  479,  479,  479,  479,    0,  480,  480,
			  479,  479,  479,  479,  480,  480,  480,  481,  481,  481,
			  481,  481,    0,    0,    0,  481,  481,  481,  481,  482,
			  482,  482,  482,  482,    0,    0,    0,  482,  482,  482,
			  482,  447,  447,  447,  447,  447,  447,  447,  447,  447,
			  447,  447,  447,  447,  447,  447,  447,  447,  447,  447,
			  447,  447,  447,  447,  447,  447,  447,  447,  447,  447,
			  447,  447,  447,  447,  447,  447,  447,  447,  447,  447,
			  447,  447,  447,  447,  447,  447,  447,  447,  447, yy_Dummy>>,
			1, 199, 3000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 482)
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
			  307,  346,    0, 1578,   50,   91,  100,  104,   43,  113,
			   84,  392,  429,  122,  131,  476,  511, 1550, 3151,  188,
			 1550, 3151, 1524,  193, 1535,    0, 3151, 1528,  199, 3151,
			   47,  200,   56,  203,  194,  206, 1516, 1500,  206,  217,
			  252, 3151, 1473, 3151,    0, 1464,  212,  216,  260,  221,
			 1483, 1485, 3151,   84,  290,   47, 1462,  296,  548,  595,
			  641,  666,  221, 1449, 1416,  264,  300,  304,  325,  334,
			 3151,    0,  388,  694,  642, 1440,  116,  704,  729,    0,
			 1423, 3151,  338, 3151, 3151,  771,  642,  652,  779,  782,

			 1422,  280, 1416,  706,  776,  714,  790,  791, 1383, 3151,
			  777,  795,  799, 3151,    0, 1380, 1407,  395,  722, 3151,
			  821,  846,  882, 3151,  804,  819,  883, 1401,  882,  211,
			  888,  916,  885,  889,  909,  944,  398,  959,  956, 3151,
			  963,  258,  980, 3151,  797,   58,  866,  496,  886,  928,
			  978,  978,  309, 3151, 1019, 1384, 1278, 3151, 1020, 3151,
			 1024, 1298,  405, 1025, 1029, 1249,  183, 1043, 1222, 1208,
			 1203, 1040, 1075, 1105, 1151, 1167, 1192,  222, 1081, 1088,
			 1228, 1148, 1155,  954, 1040,  514,  654, 1172,    0, 1127,
			 3151, 1121, 1105, 1234,  798, 3151, 1161, 1240, 1244, 1269, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 3151, 3151, 3151, 1301, 1305, 1315, 1326,  295, 1055,  135,
			 1090,  315, 1338,  849, 1333, 3151, 1374, 1168, 1401,  983,
			 1371, 1378, 3151, 1241, 1385, 1082, 1071,  993, 1041, 1001,
			  989, 1180, 1195, 3151,  646, 1398, 1384, 1426,  972,  945,
			 1458, 1462,  905, 1472, 1483, 1493,  886,  339, 1505, 1533,
			 1021, 1339, 1501, 1256, 1562, 1598, 1625, 1602, 1609, 1224,
			 1632, 3151,  894,  863, 1636, 1205,  862, 3151, 1648, 1655,
			 1659, 3151, 1651, 1680, 1684, 1694,  752, 1712,  718, 1493,
			    0, 1326, 1675, 1748, 1702, 1257,  523, 1563,  706, 1767,
			 1745,  642, 1792, 1594, 1817, 1842, 1043, 1867, 1272, 3151,

			 1412, 1903,  619, 1907,  593, 1903, 1926,  542,    0,    0,
			  466,  447,  701, 1945, 1621,  904, 1425,  420, 1320, 3151,
			  225,  422, 3151, 1977, 1995, 2031,  385,  970,    0, 2050,
			 2075, 1708, 1282, 2100, 1756,  588, 2125,    0,    0, 2150,
			  335, 1983, 1749, 2029,  960,  773, 2033, 2175,  295,  308,
			    0,  249,  240, 2200, 1989,  200, 1351, 1452, 3151, 2236,
			  788, 1466, 2233,  196, 2252, 2231, 1441, 2280, 1030, 2285,
			 1505, 2301, 2296, 2312,    0, 2337, 1323, 3151, 1472, 2373,
			 1518, 3151,  816,    0,  837, 2315, 2368, 2376, 1781,  932,
			 2401,  253, 2437, 1536, 1144, 1631,    0,  101, 1158, 1855, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 2444, 1950, 2452, 2457, 1173, 1725, 2462, 2479, 2484, 2451,
			 2487,   88, 1795,   83, 2492, 1897, 3151, 1972, 2063,   66,
			 2497, 1820, 3151, 2503, 1845, 1880, 2511, 2088, 2113, 2519,
			 2008, 2527, 2214, 2535, 2538,  686, 2247, 2203,   38, 2138,
			 2163, 1349, 2188, 2325, 2266,   25, 2389, 3151, 2574, 2596,
			 2618, 2640, 2662, 2677, 2698, 2720, 2552, 2741, 2754, 2775,
			 2797, 2819, 2841, 2863, 2885, 2907, 2929, 2950, 2962, 2975,
			 2996, 3018, 3039, 3051, 3063, 3075, 3035, 3078, 3090, 3102,
			 3105, 3117, 3129, yy_Dummy>>,
			1, 83, 400)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 482)
			yy_def_template_1 (an_array)
			yy_def_template_2 (an_array)
			yy_def_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			    0,  447,    1,  448,  448,  447,    5,  449,  449,  448,
			  448,  447,   11,  447,  450,  447,  447,  447,  451,  450,
			  450,  450,  447,  452,  452,  447,   25,   26,  447,  447,
			  447,  447,  447,  447,  453,  453,  447,  454,  447,  447,
			  447,  454,  454,  454,  454,  454,  455,  447,  456,  457,
			  447,  447,  447,  447,  458,  447,  450,  447,  447,  447,
			  447,  451,  447,  451,  459,   21,  460,  460,  447,  447,
			   69,   70,   71,   71,  460,  452,  452,  452,  452,  447,
			  447,   25,   26,   26,  447,  461,  447,  447,  447,  453,
			  454,  447,  447,  447,  447,  454,  454,  454,  454,  454,

			  455,  447,  462,  447,  447,  456,  447,  457,  107,  447,
			  447,  447,  447,  447,  458,  447,  463,  451,  463,  447,
			   21,  120,  450,  447,  464,   68,  464,  465,   68,  460,
			  460,  460,   71,   71,   71,   71,  447,  466,   26,  447,
			  447,  447,   88,  447,  454,  454,  454,  454,  454,  454,
			  454,  447,  447,  447,  467,  447,  107,  447,  447,  447,
			  447,  447,  447,  451,  451,  120,  121,  450,  460,  460,
			  447,   68,   68,  447,  131,   69,  175,  460,   71,   71,
			   71,   71,   71,  463,   26,  447,  447,  468,  469,  107,
			  447,  447,  470,  447,  447,  447,  451,  451,  167,  198, yy_Dummy>>,
			1, 200, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  447,  447,  447,   68,   68,   68,   68,  460,  173,  447,
			  175,  176,  173,  176,   71,  447,  460,  447,  131,  176,
			   71,   71,  447,   71,   26,  447,  447,  447,  469,  107,
			  471,  447,  447,  447,  451,  451,  451,  199,  199,  460,
			   68,   68,  460,   68,   68,   68,  447,  447,   69,  460,
			  176,  176,   71,  472,  460,  176,  176,   71,   71,   71,
			   26,  447,  107,  447,  447,  447,  237,  447,   68,   68,
			   68,  447,   68,   68,   68,   68,  447,  176,  249,   71,
			  473,  254,  460,  460,  180,  180,  460,   26,  447,  198,
			   68,  277,  249,  473,  460,  294,  460,  295,  176,  447,

			  212,   26,  469,  289,  460,   68,  248,  292,  474,  475,
			  447,  294,  295,  460,  297,  256,  460,  249,  447,  447,
			  469,  303,  447,   68,  306,  212,  474,  475,  476,  313,
			  329,  249,  469,  303,  450,  324,  249,  477,  478,  330,
			  330,  249,  249,  332,  343,  333,  450,  324,   69,  336,
			  479,  478,  339,  325,  249,  447,  447,  332,  447,  450,
			  347,   69,  325,  479,  329,  353,  353,  249,  447,  447,
			  332,  450,   69,  249,  480,  364,  249,  447,  469,  450,
			   69,  447,  373,  481,  375,  450,   69,  373,  353,  481,
			  375,  460,  450,   69,  387,  353,  482,  447,  390,  460, yy_Dummy>>,
			1, 200, 200)
		end

	yy_def_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  450,  450,   69,  353,  482,  447,  460,  450,  450,  450,
			  460,   69,  353,  447,  447,  460,  447,  460,  460,   69,
			  353,  447,  447,  460,   69,  353,  447,  460,   69,  353,
			  447,  460,  353,  447,  460,  460,  353,  447,  447,  460,
			  460,  460,  353,  447,  447,  447,  353,    0,  447,  447,
			  447,  447,  447,  447,  447,  447,  447,  447,  447,  447,
			  447,  447,  447,  447,  447,  447,  447,  447,  447,  447,
			  447,  447,  447,  447,  447,  447,  447,  447,  447,  447,
			  447,  447,  447, yy_Dummy>>,
			1, 83, 400)
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
			create an_array.make_filled (0, 0, 447)
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
			    0,    0,    0,   62,   59,    1,    1,    1,   50,   59,
			   37,   59,   60,    1,    1,   59,   59,   59,   61,   27,
			   61,   29,   61,   34,   33,   33,   36,   54,   55,   56,
			   57,   54,   54,   54,   54,   54,   61,   61,   17,   61,
			   61,   42,   61,   41,   39,   61,   59,   59,    1,    1,
			    0,   50,   49,   50,   59,   59,    0,    0,    0,    0,
			    0,    0,    0,    0,   14,   58,    1,    1,   58,   59,
			    4,   59,   59,   59,   27,    0,    0,   34,   33,   33,
			   54,   56,   55,   52,   51,   53,   54,   54,   54,   54,

			    0,   15,    0,    0,    0,   17,    0,    0,    0,   21,
			    0,    0,    0,   43,   39,    0,    0,   50,   59,    2,
			   59,   59,   59,   46,    0,    0,   38,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,   58,   58,   59,   28,
			   26,    0,    0,   35,   54,   54,   54,   54,   54,   54,
			   54,    0,    0,   20,   17,    0,    0,   16,    0,   23,
			    0,    0,    0,   50,   50,   59,   59,   59,    0,    0,
			    0,    0,    0,   32,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   58,   59,    0,    0,    0,    0,    0,
			   22,    0,    0,    0,    0,   48,   50,   50,   59,   59, yy_Dummy>>,
			1, 200, 0)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			   45,   44,   45,    0,    0,    0,    0,   32,   31,   13,
			    0,    0,   32,    0,    0,    8,    0,    0,    0,    0,
			    0,    0,    6,    0,   59,   26,   26,    0,    0,    0,
			    0,    0,    0,   40,   50,   50,   50,   59,   59,    0,
			    0,    0,    0,    0,    0,    0,   30,   13,    0,   31,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			   59,   19,    0,    0,    0,    0,   59,   12,    0,    0,
			    0,   11,    0,    0,    0,    0,   31,    0,   31,    0,
			    0,    0,    0,    0,    0,    0,    0,   59,    0,   59,
			    0,    0,   31,    0,    0,    0,    0,    0,    0,    5,

			   25,   59,    0,   59,    0,    0,    0,   31,    0,    0,
			    0,    0,    0,    0,    0,    0,   25,   31,   59,    3,
			    0,   59,   10,    0,    0,   31,    0,    0,    0,    0,
			    0,   31,    0,   59,   59,    0,   31,    0,    0,    0,
			    0,   31,   31,    0,    0,   59,   59,    0,    0,   31,
			    0,    0,    0,   31,   31,   24,    0,    0,   18,   47,
			    0,    0,   31,    0,    0,   31,   31,   31,    0,    0,
			    0,   59,    0,   31,    0,    0,   31,   18,    0,   59,
			    0,    9,   31,    0,    0,   59,    0,   31,   31,    0,
			    0,    0,   59,    0,   31,   31,    0,    0,    0,    0, yy_Dummy>>,
			1, 200, 200)
		end

	yy_accept_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			   59,   59,    0,   31,    0,    0,    0,   47,   59,   59,
			    0,    0,   31,    9,    0,    0,    7,    0,    0,    0,
			   31,    0,    7,    0,    0,   31,    0,    0,    0,   31,
			    0,    0,   31,    0,    0,    0,   31,    0,    0,    0,
			    0,    0,   31,    0,    0,    0,   31,    0, yy_Dummy>>,
			1, 48, 400)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 3151
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 447
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 448
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

	yyNb_rules: INTEGER = 61
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 62
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
