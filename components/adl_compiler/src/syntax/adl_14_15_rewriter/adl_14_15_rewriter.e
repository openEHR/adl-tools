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
if yy_act <= 29 then
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
--|#line 69 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 69")
end

		out_buffer.append ("terminology%N")
		in_terminology := True
	
end
else
if yy_act = 3 then
--|#line 74 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 74")
end

		out_buffer.append (text)
	
else
--|#line 80 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 80")
end

		out_buffer.append_character ('[')
		output_new_id_code (text_substring (2, text_count - 1))
		out_buffer.append_character (']')
	
end
end
else
if yy_act <= 6 then
if yy_act = 5 then
--|#line 86 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 86")
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
		output_new_id_code (text_substring (2, text_count))
	
end
else
if yy_act = 7 then
--|#line 98 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 98")
end

		out_buffer.append_character ('[')
		out_buffer.append (Local_terminology_id + "::")
		output_new_at_ac_code (text_substring (2, text_count - 1))
		out_buffer.append_character (']')
	
else
--|#line 105 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 105")
end

		out_buffer.append (text)
	
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

		output_converted_code_dt_key (text_substring (3, text_count - 2))
	
else
--|#line 115 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 115")
end

		output_converted_code_dt_key (text_substring (3, text_count - 2))
	
end
else
if yy_act = 11 then
--|#line 119 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 119")
end

		output_converted_code_dt_key (text_substring (3, text_count - 2))
	
else
--|#line 124 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 124")
end

		out_buffer.append (text)
	
end
end
else
if yy_act <= 14 then
if yy_act = 13 then
--|#line 128 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 128")
end
		-- match [{
		out_buffer.append (text)
		set_start_condition (IN_TUPLE)
	
else
--|#line 134 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 134")
end
 		-- strings and lists of strings
		out_buffer.append (text)
	
end
else
--|#line 138 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 138")
end
 							-- interior }, { pattern
		out_buffer.append (text)
	
end
end
end
else
if yy_act <= 22 then
if yy_act <= 19 then
if yy_act <= 17 then
if yy_act = 16 then
--|#line 142 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 142")
end
			-- numbers and lists of numbers and symbols (e.g. in intervals)
		out_buffer.append (text)
	
else
--|#line 146 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 146")
end
						-- ADL codes
		out_buffer.append ("[local::")
		output_new_at_ac_code (text_substring (9, text_count-1))
		out_buffer.append_character (']')
	
end
else
if yy_act = 18 then
--|#line 152 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 152")
end
				-- other codes
		out_buffer.append (text)
	
else
--|#line 156 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 156")
end
out_buffer.append (text)			-- pass separate comment lines
end
end
else
if yy_act <= 21 then
if yy_act = 20 then
--|#line 158 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 158")
end
										-- match [{
		out_buffer.append (text)
	
else
--|#line 162 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 162")
end
						-- termination of interior tuple line }],\n with optional comment
		out_buffer.append (text)
		set_start_condition (INITIAL)
	
end
else
--|#line 167 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 167")
end
						-- termination of final tuple line }]\n with optional comment
		out_buffer.append (text)
		set_start_condition (INITIAL)
	
end
end
else
if yy_act <= 26 then
if yy_act <= 24 then
if yy_act = 23 then
--|#line 185 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 185")
end
						-- ADL codes
	out_buffer.append ("[local::")
	output_new_at_ac_code (text_substring (9, text_count-1))
	out_buffer.append_character (']')

else
--|#line 191 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 191")
end

		out_buffer.append (text)
		set_start_condition (IN_ADL_VALUE_SET_DEF)
	
end
else
if yy_act = 25 then
--|#line 197 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 197")
end
 -- match second last line with ';' termination (assumed value)
		output_new_at_ac_code (text)
	
else
--|#line 201 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 201")
end
out_buffer.append (text)
end
end
else
if yy_act <= 28 then
if yy_act = 27 then
--|#line 204 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 204")
end
out_buffer.append (text)
else
--|#line 206 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 206")
end

		out_buffer.append (text)
		set_start_condition (INITIAL)
	
end
else
--|#line 214 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 214")
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
if yy_act <= 44 then
if yy_act <= 37 then
if yy_act <= 33 then
if yy_act <= 31 then
if yy_act = 30 then
--|#line 235 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 235")
end

		out_buffer.append (text)
		set_start_condition (IN_VALUE_SET_DEF)
	
else
--|#line 240 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 240")
end

		out_buffer.append (text)
		set_start_condition (IN_VALUE_SET_DEF)
	
end
else
if yy_act = 32 then
--|#line 246 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 246")
end
 
		out_buffer.append (text)
	
else
--|#line 250 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 250")
end

		out_buffer.append (text)
	
end
end
else
if yy_act <= 35 then
if yy_act = 34 then
--|#line 255 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 255")
end
out_buffer.append (text)
else
--|#line 257 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 257")
end

		out_buffer.append (text)
		set_start_condition (INITIAL)
	
end
else
if yy_act = 36 then
--|#line 264 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 264")
end

	out_buffer.append (text)
	set_start_condition (IN_PATH)

else
--|#line 269 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 269")
end

	out_buffer.append (text)
	set_start_condition (IN_PATH)

end
end
end
else
if yy_act <= 41 then
if yy_act <= 39 then
if yy_act = 38 then
--|#line 275 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 275")
end
 
		out_buffer.append (text)
	
else
--|#line 279 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 279")
end
 
		out_buffer.append_character ('[')
		output_new_id_code (text_substring (2, text_count - 1))
		out_buffer.append_character (']')
	
end
else
if yy_act = 40 then
--|#line 285 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 285")
end

		out_buffer.append (text)
	
else
--|#line 289 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 289")
end

		out_buffer.append (text)
		set_start_condition (INITIAL)
	
end
end
else
if yy_act <= 43 then
if yy_act = 42 then
--|#line 294 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 294")
end

		out_buffer.append (text)
		set_start_condition (INITIAL)
	
else
--|#line 302 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 302")
end
out_buffer.append (text)
end
else
--|#line 304 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 304")
end
out_buffer.append (text)
end
end
end
else
if yy_act <= 51 then
if yy_act <= 48 then
if yy_act <= 46 then
if yy_act = 45 then
--|#line 307 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 307")
end

		out_buffer.append (text)
	
else
--|#line 312 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 312")
end

		out_buffer.append (text)
	
end
else
if yy_act = 47 then
--|#line 316 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 316")
end
				-- beginning of a string
		out_buffer.append (text)
		set_start_condition (IN_STR)
	
else
--|#line 322 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 322")
end
out_buffer.append (text)
end
end
else
if yy_act <= 50 then
if yy_act = 49 then
--|#line 324 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 324")
end
out_buffer.append (text)
else
--|#line 326 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 326")
end

				out_buffer.append (text)
	
end
else
--|#line 330 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 330")
end
out_buffer.append (text)
end
end
else
if yy_act <= 55 then
if yy_act <= 53 then
if yy_act = 52 then
--|#line 332 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 332")
end

				out_buffer.append (text)
	
else
--|#line 336 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 336")
end
						-- match final end of string
				out_buffer.append (text)
				set_start_condition (INITIAL)
	
end
else
if yy_act = 54 then
--|#line 341 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 341")
end
	-- Catch-all rules (no backing up)
				set_start_condition (INITIAL)
	
else
--|#line 349 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 349")
end
		-- read non '[' non-space characters followed by whitespace then '['
		out_buffer.append (text)
	
end
end
else
if yy_act <= 57 then
if yy_act = 56 then
--|#line 353 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 353")
end
						-- read non '[' non-space characters followed by whitespace then '['
		out_buffer.append (text)
	
else
--|#line 359 "adl_14_15_rewriter.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'adl_14_15_rewriter.l' at line 359")
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
			create an_array.make_filled (0, 0, 2435)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			yy_nxt_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,   14,   15,   16,   15,   15,   17,   14,   14,   14,
			   14,   14,   18,   14,   14,   14,   14,   14,   14,   19,
			   19,   19,   19,   19,   19,   19,   20,   14,   14,   14,
			   19,   19,   19,   19,   19,   19,   19,   19,   14,   14,
			   14,   14,   14,   14,   14,   14,   14,   14,   21,  227,
			   21,   21,   54,   83,   54,   54,  277,  106,  107,   22,
			   22,   22,   81,  108,  242,   23,   23,   23,   23,   24,
			   23,   23,  183,  183,   84,   22,   23,   23,   23,   24,
			   23,   23,   23,   23,   26,   26,   54,   26,   54,   54,
			  215,   26,   27,   55,   55,   55,   55,   81,   86,   26,

			   55,   55,   55,   55,   68,   55,   68,   68,   74,   74,
			   28,   74,   29,   26,   26,   74,   26,  123,  124,  124,
			   26,   27,   82,   74,   82,   82,  115,   93,   26,  115,
			   93,   85,   85,   85,   94,   54,  151,   54,   54,   28,
			  152,   29,   25,   30,   30,   25,   30,   25,   25,   25,
			   30,   31,   32,   25,   32,   32,   32,   25,   30,   25,
			   32,   32,   32,   32,   32,   32,   32,   25,   25,   33,
			   32,   32,   32,   32,   32,   32,   32,   32,   32,   25,
			   25,   25,   25,   25,   25,   25,   25,   25,   25,   35,
			   77,   77,   36,   77,  242,  100,  272,   77,  100,  116,

			   81,  119,  101,  116,   81,   77,   54,   81,   54,   54,
			  106,  107,   59,   37,   96,   59,  108,   96,  160,  161,
			  161,  102,   55,   55,   55,   55,  165,  165,  165,   38,
			   39,   40,   41,   42,   35,   88,   88,   36,   87,   87,
			   87,   89,   89,   89,   98,   81,  114,  107,   66,  114,
			   99,   61,  108,  115,   61,   61,  114,  270,   37,  114,
			  113,   61,   81,  115,   61,   61,  120,  348,  120,  120,
			  113,  172,  173,  173,   38,   39,   40,   41,   42,   43,
			   81,   86,  134,   44,   45,  134,   45,   45,   45,  135,
			  113,   45,   68,   55,   68,   68,   85,   85,   85,   46,

			   69,   70,   69,   69,   81,  106,  107,   82,  338,   82,
			   82,  108,   47,   43,   85,   85,   85,   44,   45,  121,
			   45,   45,   45,  113,  120,   45,  120,  120,   74,   74,
			  121,   74,  259,   46,   93,   74,  257,   93,  132,  132,
			  132,   94,  182,   74,  299,  182,   47,   25,   48,   48,
			   48,   48,   49,   25,   25,   25,   25,   25,   50,   51,
			   51,   51,   25,   25,   25,   51,   51,   51,   51,   51,
			   51,   51,   52,   25,   25,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   25,   25,   25,   25,   25,   25,
			   25,   25,   25,   25,   54,   93,   54,   54,   93,  242,

			   96,  101,   94,   96,  101,   58,   58,   58,  278,  279,
			   81,   58,   58,   58,   58,   58,   58,   58,  178,  179,
			  179,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   59,  278,  279,   59,   60,   61,   99,  140,   61,   61,
			  251,   62,   62,   62,  133,  133,  133,   63,   63,   63,
			   63,   63,   63,   63,  116,  116,  116,   62,   64,   63,
			   65,   63,   63,   63,   63,   63,   66,   53,   69,   70,
			   69,   69,  162,   53,   53,   53,   53,   53,   53,   71,
			   71,   71,   53,   53,   53,   71,   71,   71,   71,   71,
			   71,   71,   81,   53,   53,   71,   71,   71,   71,   71,

			   71,   71,   71,   71,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   72,   72,   72,  180,  181,  181,
			   72,   72,   72,   72,   72,   72,   72,   88,   88,  113,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,  109,
			  189,  189,  189,  109,  340,  110,  109,  109,  110,  110,
			  111,  110,  110,  110,  109,  109,  109,  110,  110,  110,
			  110,  110,  110,  110,  109,  109,  250,  110,  112,  110,
			  110,  110,  110,  110,  110,  110,  109,  109,  109,  109,
			  109,  109,  109,  109,  109,  109,  114,  182,  242,  114,
			  182,   61,  237,  115,   61,   61,   77,   77,  233,   77,

			  113,   94,  114,   77,   94,  114,  193,  193,  193,  115,
			  137,   77,  137,  137,  137,  117,  106,  137,  169,  118,
			  125,  125,  126,  125,  125,  125,  125,  125,  125,   78,
			   78,  125,   78,   78,   78,  125,  125,  125,   78,   78,
			   78,   78,   78,   78,   78,  125,  125,  125,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,  125,  125,  125,
			  125,  125,  125,  125,  125,  125,  125,   81,  100,  184,
			  228,  100,  184,  348,  227,  101,  348,  141,  142,   54,
			  141,   54,   54,  208,  143,  144,  164,  138,  209,   81,
			  106,  107,  142,  148,  102,  164,  108,  165,  165,  165,

			  197,  198,  198,  163,  127,  128,  129,  130,  131,  348,
			  146,  146,  146,  163,   81,  202,  146,  146,  146,  146,
			  146,  146,  146,   85,   85,   85,  146,  146,  146,  146,
			  146,  146,  146,  146,  146,  147,  147,  147,  199,  199,
			  199,  147,  147,  147,  147,  147,  147,  147,   87,   87,
			   87,  147,  147,  147,  147,  147,  147,  147,  147,  147,
			  109,  204,  204,  204,  109,  150,  110,  109,  109,  110,
			  110,  109,  110,  110,  110,  109,  109,  109,  110,  110,
			  110,  110,  110,  110,  110,  109,  109,   81,  110,  110,
			  110,  110,  110,  110,  110,  110,  110,  109,  109,  109,

			  109,  109,  109,  109,  109,  109,  109,  155,  156,   81,
			  211,  134,   81,  157,  134,  212,  135,  201,  135,  135,
			  166,   89,   89,   89,   93,   91,   61,   93,  116,   61,
			   61,   94,  116,  155,  156,  113,  158,  159,  159,  157,
			  210,  210,  210,   85,   85,   85,   85,   85,   85,  141,
			  142,  187,  141,  177,  116,  106,  107,  144,  116,  125,
			  125,  108,  125,  125,  125,  176,  196,  174,  125,  125,
			  125,  125,  125,  125,  125,  171,  168,  196,  125,  125,
			  125,  125,  125,  125,  125,  125,  125,  143,  169,  188,
			  143,  189,  189,  189,  348,  170,   54,  348,   54,   54,

			   61,  115,  261,   61,   61,  266,  190,  262,  266,  113,
			  214,  214,  214,  175,  175,  175,  175,  175,  175,  175,
			  184,  116,  116,  116,  175,  175,  175,  175,  175,  175,
			  175,  175,  191,  167,  192,  193,  193,  203,  195,  204,
			  204,  204,  153,  208,  220,  220,  220,  191,  209,  194,
			  210,  210,  210,  149,  205,  206,  206,  206,  206,  206,
			  206,  206,  348,  149,  194,  348,  206,  206,  206,  206,
			  206,  206,  206,  206,  207,  207,  207,  221,  222,  222,
			  207,  207,  207,  207,  207,  207,  207,  145,  215,  139,
			  207,  207,  207,  207,  207,  207,  207,  207,  207,  211, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  223,  224,  224,  136,  212,   91,  213,  214,  214,   61,
			   81,   61,  216,   61,   61,  156,  122,  113,  113,   61,
			  157,  182,   61,   61,  182,  218,  219,  219,  113,  183,
			  183,   57,  183,  183,  183,  224,  224,  224,  116,  116,
			  116,  106,  107,  197,  197,  197,  105,  108,  183,  164,
			  103,  198,  198,  198,  226,   92,   91,  225,  229,  230,
			  230,  231,  231,  231,  226,  232,  232,  232,  234,  235,
			  235,  232,  232,  232,  232,  232,  232,  232,  236,  236,
			  236,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  238,  239,  239,  240,  241,  241,  241,  241,  241,   61,

			  203,   81,   61,   61,   78,   61,   61,   61,  113,   61,
			   76,   75,   61,  188,  219,  219,  219,  205,  157,   73,
			   57,   61,  245,  245,  245,  191,  348,  222,  222,  222,
			  190,  246,  247,  247,  247,  247,  247,  116,  116,  116,
			  248,  255,  194,  106,  107,  229,  229,  229,  203,  108,
			  230,  230,  230,  249,  208,  234,  234,  234,  256,  209,
			  348,  235,  235,  235,  211,  205,  252,  238,  238,  212,
			  348,  239,  239,  239,  238,  238,  238,   61,  254,  183,
			   61,   61,  221,  265,  222,  188,  113,  116,  116,  116,
			  255,  348,  116,  116,  116,  191,  215,  116,  116,  116,

			  106,  107,  190,  348,  348,   61,  108,  256,   61,  263,
			  348,  348,  194,  348,  113,  258,  260,  260,  260,  260,
			  260,  260,  260,  183,  183,  348,  348,  260,  260,  260,
			  260,  260,  260,  260,  260,  268,  269,  268,  268,  275,
			  183,  215,  266,  106,  107,  266,  238,  273,  239,  108,
			  183,  183,  348,  183,  183,  183,  348,  215,  268,  269,
			  268,  268,  303,  303,  303,  348,  183,  183,  183,  183,
			  267,  271,  271,  271,  304,  305,  305,  271,  271,  271,
			  271,  271,  271,  271,  215,  215,  348,  271,  271,  271,
			  271,  271,  271,  271,  271,  271,   61,  183,  183,   61,

			   61,  261,   61,   61,   61,  113,  262,  348,  239,  239,
			  239,   54,  348,   54,   54,  215,   61,  348,   61,   61,
			   61,  348,  276,  183,  183,  113,  183,  183,  183,  254,
			  183,  294,  282,  283,  283,  284,  285,  285,  227,  348,
			   61,  215,  183,  288,  289,  348,  287,  215,  311,  113,
			  227,  286,  286,  286,  306,  306,  306,  286,  286,  286,
			  286,  286,  286,  286,  183,  300,  348,  286,  286,  286,
			  286,  286,  286,  286,  286,  286,  291,  348,  292,  292,
			  292,  294,  215,  295,  295,  295,  294,  348,   54,  348,
			   54,   54,  348,  293,  308,  308,  308,  113,  296,  297,

			  297,  297,   61,  296,  348,   61,   61,  348,  183,  183,
			   54,  113,   54,   54,  348,  301,  302,  302,  348,  307,
			  348,  297,  297,  297,   61,  348,  215,  288,  289,  348,
			  215,  183,  183,  113,  183,  183,  183,  348,  348,  291,
			  348,  302,  310,  310,  310,  348,  291,  348,  348,  215,
			  183,  294,  348,  305,  305,  305,  293,  312,  312,  312,
			  348,  348,   54,  293,   54,   54,  348,  314,  311,  308,
			  308,  308,  113,  313,  313,  313,  244,  244,  244,   54,
			  348,   54,   54,  348,  315,  319,  320,  348,  317,  348,
			  313,  313,  313,  318,  318,  318,  113,   54,  348,   54,

			   54,  348,  322,  215,  318,  318,  318,  113,  321,  321,
			  321,  183,  183,  183,  183,  183,   61,  348,  327,  327,
			  327,  319,  320,  328,  328,  328,  348,  348,   54,  215,
			   54,   54,  336,  336,  336,  348,  348,  324,   54,  215,
			   54,   54,  348,  348,  325,   54,  326,   54,   54,  321,
			  321,  321,  339,  339,  339,  337,  329,  329,  329,  332,
			  331,  333,   61,  348,  327,  327,  327,  334,  348,  328,
			  328,  328,  348,  348,   54,  348,   54,   54,   54,  330,
			   54,   54,  348,  348,  335,  329,  329,  329,  348,  329,
			  329,  329,   54,  348,   54,   54,  336,  336,  336,  336,

			  336,  336,  341,  348,  339,  339,  339,  342,  342,  342,
			  113,  315,  343,  343,  343,   61,  348,  342,  342,  342,
			  332,  330,  344,  348,  348,  343,  343,  343,  183,  183,
			  183,  348,  183,  183,  183,  347,  347,  347,  347,  347,
			  347,  348,  348,  348,  348,  348,  348,  348,  348,  345,
			  346,  348,  348,  335,   25,   25,   25,   25,   25,   25,
			   25,   25,   25,   25,   25,   25,   25,   25,   25,   25,
			   25,   25,   25,   25,   25,   25,   25,   34,   34,   34,
			   34,   34,   34,   34,   34,   34,   34,   34,   34,   34,
			   34,   34,   34,   34,   34,   34,   34,   34,   34,   34,

			   53,   53,  348,   53,   53,  348,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,  348,   53,   53,   53,
			   53,   53,   53,   56,   56,  348,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			  348,   56,   56,   56,   56,   56,   67,   67,   67,   67,
			   67,  348,   67,   67,   67,   67,   67,   67,   67,   67,
			   67,   67,  348,   67,   67,   67,   67,   67,   67,   79,
			   79,   79,   79,   79,  348,  348,   79,  348,  348,  348,
			   79,   79,   79,   80,   80,  348,   80,   80,   80,   80,
			   80,   80,   80,   80,   80,   80,   80,   80,   80,   80,

			  348,   80,   80,   80,   80,   80,   90,   90,  348,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,  348,   90,   90,   90,   90,   90,   95,
			  348,  348,   95,  348,  348,   95,  348,   95,   95,   95,
			   95,  348,   95,   97,  348,  348,   97,  348,  348,  348,
			  348,  348,   97,   97,   97,  348,  348,   97,  348,  348,
			  348,   97,   97,   97,   97,  104,  104,  104,  348,  348,
			  104,  348,  348,  348,  104,  104,  104,   61,  348,   61,
			   61,   61,   61,   61,   61,  348,   61,  348,  348,  348,
			   61,   61,   61,   62,  348,  348,   62,  348,   62,   62,

			   62,   62,   62,   62,   62,   62,  348,   62,  348,  348,
			  348,   62,   62,   62,  116,  348,  348,  116,  348,  116,
			  116,  116,  116,  116,  116,  116,  116,  348,  116,  348,
			  348,  348,  116,  116,  116,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,  109,  348,  348,  348,  109,  109,  109,  109,  109,
			  109,  109,  109,  109,  109,  109,  109,  109,  109,  348, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  109,  109,  109,  109,  154,  348,  348,  154,  348,  348,
			  348,  348,  348,  154,  154,  154,  348,  348,  154,  348,
			  348,  348,  154,  154,  154,  137,  348,  348,  137,  348,
			  348,  137,  348,  137,  137,  137,  137,  348,  137,  183,
			  348,  348,  183,  348,  348,  348,  183,  183,  183,  183,
			  183,  348,  348,  183,  348,  348,  348,  183,  183,  183,
			  185,  348,  185,  185,  185,  185,  185,  185,  348,  185,
			  348,  348,  348,  185,  185,  185,  186,  348,  186,  186,
			  186,  186,  186,  186,  348,  186,  348,  348,  348,  186,
			  186,  186,  166,  166,  348,  166,  166,  166,  166,  166,

			  166,  166,  166,  166,  166,  166,  166,  166,  166,  348,
			  166,  166,  166,  166,  166,  200,  200,  200,  348,  348,
			  200,  348,  348,  348,  200,  200,  200,  171,  171,  171,
			  171,  171,  171,  171,  171,  171,  171,  171,  171,  171,
			  171,  171,  171,  171,  171,  171,  171,  171,  171,  171,
			  217,  348,  348,  217,  348,  348,  348,  217,  217,  217,
			  217,  217,  348,  348,  217,  348,  348,  348,  217,  217,
			  217,  202,  202,  202,  202,  202,  202,  202,  202,  202,
			  202,  202,  202,  202,  202,  202,  202,  202,  202,  202,
			  202,  202,  202,  202,  243,  348,  243,  243,  243,  243,

			  243,  243,  348,  243,  348,  348,  348,  243,  243,  243,
			  244,  244,  244,  244,  244,  348,  348,  244,  348,  348,
			  244,  244,  244,  244,  253,  348,  253,  253,  253,  253,
			  253,  253,  348,  253,  348,  348,  348,  253,  253,  253,
			  264,  264,  264,  264,  264,  348,  348,  264,  348,  348,
			  264,  264,  264,  264,  274,  348,  274,  274,  274,  274,
			  274,  274,  348,  274,  348,  348,  348,  274,  274,  274,
			  280,  348,  280,  280,  280,  280,  280,  280,  348,  280,
			  348,  348,  348,  280,  280,  280,  281,  281,  281,  281,
			  281,  348,  348,  281,  348,  348,  281,  281,  281,  281,

			  290,  290,  290,  290,  290,  348,  348,  290,  348,  348,
			  290,  290,  290,  290,  298,  348,  298,  298,  298,  298,
			  298,  298,  348,  298,  348,  348,  348,  298,  298,  298,
			   61,  348,   61,   61,   61,   61,   61,   61,  348,   61,
			  348,  348,  348,   61,   61,   61,  309,  309,  309,  309,
			  309,  348,  348,  309,  348,  348,  309,  309,  309,  309,
			  316,  316,  316,  316,  316,  348,  348,  316,  348,  348,
			  316,  316,  316,  316,  323,  323,  323,  323,  323,  348,
			  348,  323,  348,  348,  323,  323,  323,  323,   13,  348,
			  348,  348,  348,  348,  348,  348,  348,  348,  348,  348,

			  348,  348,  348,  348,  348,  348,  348,  348,  348,  348,
			  348,  348,  348,  348,  348,  348,  348,  348,  348,  348,
			  348,  348,  348,  348,  348,  348,  348,  348,  348,  348,
			  348,  348,  348,  348,  348,  348, yy_Dummy>>,
			1, 436, 2000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 2435)
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
			    1,    1,    1,    1,    1,    1,    1,    1,    2,  270,
			    2,    2,   14,   37,   14,   14,  270,   58,   58,    2,
			    2,    2,   39,   58,  335,    2,    2,    2,    2,    2,
			    2,    2,  217,  217,   37,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    3,    3,   18,    3,   18,   18,
			  217,    3,    3,   15,   15,   15,   15,   38,   39,    3,

			   16,   16,   16,   16,   21,   21,   21,   21,   26,   26,
			    3,   26,    3,    4,    4,   26,    4,   76,   76,   76,
			    4,    4,   35,   26,   35,   35,  115,   45,    4,  115,
			   45,   38,   38,   38,   45,   53,  112,   53,   53,    4,
			  112,    4,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    7,
			   30,   30,    7,   30,  293,   47,  261,   30,   47,   65,

			   41,   65,   47,   65,   40,   30,   54,   42,   54,   54,
			   72,   72,   59,    7,   46,   59,   72,   46,  118,  118,
			  118,   47,   55,   55,   55,   55,  124,  124,  124,    7,
			    7,    7,    7,    7,    8,   41,   41,    8,   40,   40,
			   40,   42,   42,   42,   46,  128,   62,  147,   59,   62,
			   46,   62,  147,   62,   62,   62,   63,  259,    8,   63,
			   62,   63,   86,   63,   63,   63,   67,   67,   67,   67,
			   63,  145,  145,  145,    8,    8,    8,    8,    8,    9,
			   87,  128,   91,    9,    9,   91,    9,    9,    9,   91,
			  333,    9,   68,   68,   68,   68,   86,   86,   86,    9,

			   69,   69,   69,   69,   88,   73,   73,   82,  333,   82,
			   82,   73,    9,   10,   87,   87,   87,   10,   10,   73,
			   10,   10,   10,  289,  120,   10,  120,  120,   74,   74,
			   73,   74,  250,   10,   93,   74,  248,   93,   88,   88,
			   88,   93,  153,   74,  289,  153,   10,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   19,   95,   19,   19,   95,  242,

			   96,  101,   95,   96,  101,   19,   19,   19,  271,  271,
			   89,   19,   19,   19,   19,   19,   19,   19,  151,  151,
			  151,   19,   19,   19,   19,   19,   19,   19,   19,   19,
			   20,  286,  286,   20,   20,   20,   96,  101,   20,   20,
			  232,   20,   20,   20,   89,   89,   89,   20,   20,   20,
			   20,   20,   20,   20,  119,  119,  119,   20,   20,   20,
			   20,   20,   20,   20,   20,   20,   20,   22,   22,   22,
			   22,   22,  119,   22,   22,   22,   22,   22,   22,   22,
			   22,   22,   22,   22,   22,   22,   22,   22,   22,   22,
			   22,   22,  130,   22,   22,   22,   22,   22,   22,   22,

			   22,   22,   22,   22,   22,   22,   22,   22,   22,   22,
			   22,   22,   22,   22,   23,   23,   23,  152,  152,  152,
			   23,   23,   23,   23,   23,   23,   23,  130,  130,  338,
			   23,   23,   23,   23,   23,   23,   23,   23,   23,   60,
			  159,  159,  159,   60,  338,   60,   60,   60,   60,   60,
			   60,   60,   60,   60,   60,   60,   60,   60,   60,   60,
			   60,   60,   60,   60,   60,   60,  228,   60,   60,   60,
			   60,   60,   60,   60,   60,   60,   60,   60,   60,   60,
			   60,   60,   60,   60,   60,   60,   64,  182,  215,   64,
			  182,   64,  211,   64,   64,   64,   77,   77,  208,   77,

			   64,   94,  114,   77,   94,  114,  161,  161,  161,  114,
			   94,   77,   94,   94,   94,   64,  207,   94,  202,   64,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   85,  100,  184,
			  201,  100,  184,   97,  200,  100,   97,  102,  102,  108,
			  102,  108,  108,  234,  102,  102,  197,   97,  234,  127,
			  121,  121,  171,  108,  100,  123,  121,  123,  123,  123,

			  164,  164,  164,  121,   85,   85,   85,   85,   85,   97,
			  106,  106,  106,  121,  129,  170,  106,  106,  106,  106,
			  106,  106,  106,  127,  127,  127,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  107,  107,  107,  165,  165,
			  165,  107,  107,  107,  107,  107,  107,  107,  129,  129,
			  129,  107,  107,  107,  107,  107,  107,  107,  107,  107,
			  110,  173,  173,  173,  110,  110,  110,  110,  110,  110,
			  110,  110,  110,  110,  110,  110,  110,  110,  110,  110,
			  110,  110,  110,  110,  110,  110,  110,  131,  110,  110,
			  110,  110,  110,  110,  110,  110,  110,  110,  110,  110,

			  110,  110,  110,  110,  110,  110,  110,  116,  116,  132,
			  238,  134,  133,  116,  134,  238,  135,  168,  134,  135,
			  135,  131,  131,  131,  137,  166,  155,  137,  116,  155,
			  155,  137,  116,  117,  117,  155,  117,  117,  117,  117,
			  179,  179,  179,  132,  132,  132,  133,  133,  133,  141,
			  141,  157,  141,  150,  117,  163,  163,  141,  117,  125,
			  125,  163,  125,  125,  125,  149,  163,  146,  125,  125,
			  125,  125,  125,  125,  125,  144,  139,  163,  125,  125,
			  125,  125,  125,  125,  125,  125,  125,  143,  143,  158,
			  143,  158,  158,  158,  154,  143,  148,  154,  148,  148,

			  156,  154,  252,  156,  156,  266,  158,  252,  266,  156,
			  181,  181,  181,  148,  148,  148,  148,  148,  148,  148,
			  154,  162,  162,  162,  148,  148,  148,  148,  148,  148,
			  148,  148,  160,  138,  160,  160,  160,  172,  162,  172,
			  172,  172,  113,  178,  189,  189,  189,  221,  178,  160,
			  178,  178,  178,  111,  172,  174,  174,  174,  174,  174,
			  174,  174,  183,  109,  221,  183,  174,  174,  174,  174,
			  174,  174,  174,  174,  175,  175,  175,  191,  191,  191,
			  175,  175,  175,  175,  175,  175,  175,  105,  183,   98,
			  175,  175,  175,  175,  175,  175,  175,  175,  175,  180, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  192,  192,  192,   92,  180,   90,  180,  180,  180,  185,
			   80,  186,  185,  185,  186,  186,   75,   61,  185,  188,
			  186,  187,  188,  188,  187,  188,  188,  188,  188,  187,
			  187,   56,  187,  187,  187,  193,  193,  193,  195,  195,
			  195,  196,  196,  199,  199,  199,   52,  196,  187,  198,
			   49,  198,  198,  198,  196,   44,   43,  195,  203,  203,
			  203,  204,  204,  204,  196,  206,  206,  206,  209,  209,
			  209,  206,  206,  206,  206,  206,  206,  206,  210,  210,
			  210,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  212,  212,  212,  213,  213,  213,  214,  214,  214,  216,

			  229,   34,  216,  216,   31,  216,  216,  216,  216,  218,
			   29,   27,  218,  218,  219,  219,  219,  229,  218,   24,
			   17,  216,  220,  220,  220,  222,   13,  222,  222,  222,
			  218,  223,  223,  223,  224,  224,  224,  225,  225,  225,
			  225,  265,  222,  226,  226,  231,  231,  231,  230,  226,
			  230,  230,  230,  226,  235,  236,  236,  236,  265,  235,
			    0,  235,  235,  235,  239,  230,  240,  240,  240,  239,
			    0,  239,  239,  239,  241,  241,  241,  243,  244,  244,
			  243,  243,  255,  255,  255,  245,  243,  245,  245,  245,
			  246,    0,  246,  246,  246,  247,  244,  247,  247,  247,

			  249,  249,  245,    0,    0,  253,  249,  246,  253,  253,
			    0,    0,  247,    0,  253,  249,  251,  251,  251,  251,
			  251,  251,  251,  254,  254,    0,    0,  251,  251,  251,
			  251,  251,  251,  251,  251,  258,  258,  258,  258,  264,
			  264,  254,  257,  258,  258,  257,  262,  262,  262,  258,
			  257,  257,    0,  257,  257,  257,    0,  264,  268,  268,
			  268,  268,  292,  292,  292,    0,  281,  281,  283,  257,
			  257,  260,  260,  260,  294,  294,  294,  260,  260,  260,
			  260,  260,  260,  260,  281,  283,    0,  260,  260,  260,
			  260,  260,  260,  260,  260,  260,  263,  267,  267,  263,

			  263,  273,  263,  263,  263,  263,  273,    0,  273,  273,
			  273,  279,    0,  279,  279,  267,  274,    0,  263,  274,
			  274,  285,  267,  275,  275,  274,  275,  275,  275,  276,
			  276,  304,  276,  276,  276,  277,  277,  277,  285,    0,
			  280,  275,  275,  280,  280,    0,  279,  276,  304,  280,
			  277,  278,  278,  278,  295,  295,  295,  278,  278,  278,
			  278,  278,  278,  278,  290,  290,    0,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  282,    0,  282,  282,
			  282,  284,  290,  284,  284,  284,  312,    0,  287,    0,
			  287,  287,    0,  282,  299,  299,  299,  299,  284,  287,

			  287,  287,  288,  312,  291,  288,  288,  291,  309,  309,
			  297,  288,  297,  297,    0,  291,  291,  291,    0,  297,
			    0,  297,  297,  297,  298,    0,  309,  298,  298,    0,
			  291,  300,  300,  298,  300,  300,  300,  301,    0,  302,
			  301,  302,  303,  303,  303,    0,  301,    0,    0,  300,
			  300,  305,    0,  305,  305,  305,  302,  306,  306,  306,
			    0,    0,  307,  301,  307,  307,    0,  308,  305,  308,
			  308,  308,  308,  307,  307,  307,  310,  310,  310,  313,
			    0,  313,  313,    0,  308,  316,  316,    0,  313,    0,
			  313,  313,  313,  314,  314,  314,  314,  317,    0,  317,

			  317,    0,  318,  316,  318,  318,  318,  318,  317,  317,
			  317,  319,  319,  320,  320,  320,  322,    0,  322,  322,
			  322,  323,  323,  324,  324,  324,    0,    0,  326,  319,
			  326,  326,  332,  332,  332,    0,    0,  320,  321,  323,
			  321,  321,    0,    0,  321,  325,  321,  325,  325,  321,
			  321,  321,  334,  334,  334,  332,  325,  325,  325,  327,
			  326,  327,  327,    0,  327,  327,  327,  328,    0,  328,
			  328,  328,    0,    0,  329,    0,  329,  329,  330,  325,
			  330,  330,    0,    0,  328,  329,  329,  329,    0,  330,
			  330,  330,  331,    0,  331,  331,  336,  336,  336,  337,

			  337,  337,  339,    0,  339,  339,  339,  340,  340,  340,
			  340,  336,  341,  341,  341,  342,    0,  342,  342,  342,
			  343,  331,  343,    0,    0,  343,  343,  343,  344,  344,
			  344,    0,  345,  345,  345,  346,  346,  346,  347,  347,
			  347,    0,    0,    0,    0,    0,    0,    0,    0,  344,
			  345,    0,    0,  347,  349,  349,  349,  349,  349,  349,
			  349,  349,  349,  349,  349,  349,  349,  349,  349,  349,
			  349,  349,  349,  349,  349,  349,  349,  350,  350,  350,
			  350,  350,  350,  350,  350,  350,  350,  350,  350,  350,
			  350,  350,  350,  350,  350,  350,  350,  350,  350,  350,

			  351,  351,    0,  351,  351,    0,  351,  351,  351,  351,
			  351,  351,  351,  351,  351,  351,    0,  351,  351,  351,
			  351,  351,  351,  352,  352,    0,  352,  352,  352,  352,
			  352,  352,  352,  352,  352,  352,  352,  352,  352,  352,
			    0,  352,  352,  352,  352,  352,  353,  353,  353,  353,
			  353,    0,  353,  353,  353,  353,  353,  353,  353,  353,
			  353,  353,    0,  353,  353,  353,  353,  353,  353,  354,
			  354,  354,  354,  354,    0,    0,  354,    0,    0,    0,
			  354,  354,  354,  355,  355,    0,  355,  355,  355,  355,
			  355,  355,  355,  355,  355,  355,  355,  355,  355,  355,

			    0,  355,  355,  355,  355,  355,  356,  356,    0,  356,
			  356,  356,  356,  356,  356,  356,  356,  356,  356,  356,
			  356,  356,  356,    0,  356,  356,  356,  356,  356,  357,
			    0,    0,  357,    0,    0,  357,    0,  357,  357,  357,
			  357,    0,  357,  358,    0,    0,  358,    0,    0,    0,
			    0,    0,  358,  358,  358,    0,    0,  358,    0,    0,
			    0,  358,  358,  358,  358,  359,  359,  359,    0,    0,
			  359,    0,    0,    0,  359,  359,  359,  360,    0,  360,
			  360,  360,  360,  360,  360,    0,  360,    0,    0,    0,
			  360,  360,  360,  361,    0,    0,  361,    0,  361,  361,

			  361,  361,  361,  361,  361,  361,    0,  361,    0,    0,
			    0,  361,  361,  361,  362,    0,    0,  362,    0,  362,
			  362,  362,  362,  362,  362,  362,  362,    0,  362,    0,
			    0,    0,  362,  362,  362,  363,  363,  363,  363,  363,
			  363,  363,  363,  363,  363,  363,  363,  363,  363,  363,
			  363,  363,  363,  363,  363,  363,  363,  363,  364,  364,
			  364,  364,  364,  364,  364,  364,  364,  364,  364,  364,
			  364,  364,  364,  364,  364,  364,  364,  364,  364,  364,
			  364,  365,    0,    0,    0,  365,  365,  365,  365,  365,
			  365,  365,  365,  365,  365,  365,  365,  365,  365,    0, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  365,  365,  365,  365,  366,    0,    0,  366,    0,    0,
			    0,    0,    0,  366,  366,  366,    0,    0,  366,    0,
			    0,    0,  366,  366,  366,  367,    0,    0,  367,    0,
			    0,  367,    0,  367,  367,  367,  367,    0,  367,  368,
			    0,    0,  368,    0,    0,    0,  368,  368,  368,  368,
			  368,    0,    0,  368,    0,    0,    0,  368,  368,  368,
			  369,    0,  369,  369,  369,  369,  369,  369,    0,  369,
			    0,    0,    0,  369,  369,  369,  370,    0,  370,  370,
			  370,  370,  370,  370,    0,  370,    0,    0,    0,  370,
			  370,  370,  371,  371,    0,  371,  371,  371,  371,  371,

			  371,  371,  371,  371,  371,  371,  371,  371,  371,    0,
			  371,  371,  371,  371,  371,  372,  372,  372,    0,    0,
			  372,    0,    0,    0,  372,  372,  372,  373,  373,  373,
			  373,  373,  373,  373,  373,  373,  373,  373,  373,  373,
			  373,  373,  373,  373,  373,  373,  373,  373,  373,  373,
			  374,    0,    0,  374,    0,    0,    0,  374,  374,  374,
			  374,  374,    0,    0,  374,    0,    0,    0,  374,  374,
			  374,  375,  375,  375,  375,  375,  375,  375,  375,  375,
			  375,  375,  375,  375,  375,  375,  375,  375,  375,  375,
			  375,  375,  375,  375,  376,    0,  376,  376,  376,  376,

			  376,  376,    0,  376,    0,    0,    0,  376,  376,  376,
			  377,  377,  377,  377,  377,    0,    0,  377,    0,    0,
			  377,  377,  377,  377,  378,    0,  378,  378,  378,  378,
			  378,  378,    0,  378,    0,    0,    0,  378,  378,  378,
			  379,  379,  379,  379,  379,    0,    0,  379,    0,    0,
			  379,  379,  379,  379,  380,    0,  380,  380,  380,  380,
			  380,  380,    0,  380,    0,    0,    0,  380,  380,  380,
			  381,    0,  381,  381,  381,  381,  381,  381,    0,  381,
			    0,    0,    0,  381,  381,  381,  382,  382,  382,  382,
			  382,    0,    0,  382,    0,    0,  382,  382,  382,  382,

			  383,  383,  383,  383,  383,    0,    0,  383,    0,    0,
			  383,  383,  383,  383,  384,    0,  384,  384,  384,  384,
			  384,  384,    0,  384,    0,    0,    0,  384,  384,  384,
			  385,    0,  385,  385,  385,  385,  385,  385,    0,  385,
			    0,    0,    0,  385,  385,  385,  386,  386,  386,  386,
			  386,    0,    0,  386,    0,    0,  386,  386,  386,  386,
			  387,  387,  387,  387,  387,    0,    0,  387,    0,    0,
			  387,  387,  387,  387,  388,  388,  388,  388,  388,    0,
			    0,  388,    0,    0,  388,  388,  388,  388,  348,  348,
			  348,  348,  348,  348,  348,  348,  348,  348,  348,  348,

			  348,  348,  348,  348,  348,  348,  348,  348,  348,  348,
			  348,  348,  348,  348,  348,  348,  348,  348,  348,  348,
			  348,  348,  348,  348,  348,  348,  348,  348,  348,  348,
			  348,  348,  348,  348,  348,  348, yy_Dummy>>,
			1, 436, 2000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,   46,   82,  111,  141,    0,  186,  231,  273,
			  307,  346,    0, 1126,   50,   91,   98, 1114,   84,  392,
			  428,  102,  466,  501, 1097, 2388,  106, 1101, 2388, 1075,
			  188, 1094,    0, 2388, 1095,  120, 2388,   47,   91,   56,
			  198,  194,  201, 1050, 1045,  125,  212,  193, 2388, 1022,
			 2388,    0, 1016,  133,  204,  220, 1025, 2388,   47,  210,
			  538, 1001,  244,  254,  584,  168, 2388,  264,  290,  298,
			 2388,    0,  200,  295,  326, 1013,  104,  594,  619,    0,
			 1004, 2388,  305, 2388, 2388,  661,  256,  274,  298,  404,
			  999,  280, 1000,  332,  599,  393,  398,  671,  956, 2388,

			  666,  399,  675, 2388,    0,  952,  697,  722,  677,  957,
			  759,  947,  105,  926,  600,  124,  797,  823,  205,  441,
			  322,  680, 2388,  684,  213,  849, 2388,  683,  239,  708,
			  486,  781,  803,  806,  809,  814, 2388,  822,  917,  845,
			 2388,  847, 2388,  885,  865,  258,  857,  236,  894,  837,
			  825,  405,  504,  340,  892,  819,  893,  835,  878,  527,
			  921,  593,  908,  845,  687,  725,  819,    0,  787, 2388,
			  705,  689,  926,  748,  936,  961, 2388, 2388,  937,  827,
			  993,  897,  585,  960,  667, 1002, 1004, 1019, 1012,  931,
			 2388,  964,  987, 1022, 2388, 1025, 1031,  675, 1038, 1030,

			  646,  638,  615, 1045, 1048, 2388, 1052,  606,  570, 1055,
			 1065,  564, 1077, 1080, 1083,  560, 1092,   62, 1102, 1101,
			 1109,  936, 1114, 1118, 1121, 1124, 1133, 2388,  550, 1089,
			 1137, 1132,  429, 2388,  677, 1148, 1142, 2388,  804, 1158,
			 1153, 1161,  371, 1170, 1168, 1174, 1179, 1184,  320, 1190,
			  316, 1197,  896, 1198, 1213, 1169, 2388, 1240, 1233,  227,
			 1258,  168, 1233, 1289, 1229, 1130,  903, 1287, 1256, 2388,
			   21,  398, 2388, 1295, 1309, 1313, 1319, 1322, 1338, 1309,
			 1333, 1256, 1365, 1257, 1370, 1310,  421, 1386, 1395,  307,
			 1354, 1402, 1249,  166, 1261, 1341, 2388, 1408, 1417, 1381,

			 1421, 1435, 1428, 1429, 1320, 1440, 1444, 1460, 1456, 1398,
			 1463, 2388, 1375, 1477, 1480, 2388, 1475, 1495, 1491, 1501,
			 1500, 1536, 1505, 1511, 1510, 1543, 1526, 1551, 1556, 1572,
			 1576, 1590, 1519,  274, 1539,   36, 1583, 1586,  513, 1591,
			 1594, 1599, 1604, 1612, 1615, 1619, 1622, 1625, 2388, 1653,
			 1676, 1699, 1722, 1745, 1760, 1782, 1805, 1827, 1841, 1854,
			 1870, 1891, 1912, 1934, 1957, 1980, 2002, 2023, 2037, 2053,
			 2069, 2091, 2104, 2126, 2148, 2170, 2187, 2201, 2217, 2231,
			 2247, 2263, 2277, 2291, 2307, 2323, 2337, 2351, 2365, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  348,    1,  349,  349,  348,    5,  350,  350,  349,
			  349,  348,   11,  348,  351,  348,  348,  352,  351,  351,
			  348,  353,  348,   22,   23,  348,  348,  348,  348,  348,
			  348,  354,  354,  348,  355,  348,  348,  348,  355,  355,
			  355,  355,  355,  356,  348,  357,  358,  348,  348,  348,
			  348,  359,  348,  351,  348,  348,  352,  348,   19,  348,
			  348,  360,  361,  362,  362,   64,  348,  353,  353,  348,
			  348,   22,   23,   23,  348,  363,  348,  348,  348,  354,
			  355,  348,  348,  348,  348,  355,  355,  355,  355,  355,
			  356,  348,  364,  348,  348,  357,  348,  358,   97,  348,

			  348,  348,  348,  348,  359,  348,   19,  106,  351,  365,
			  348,  365,  110,  348,  348,  366,   64,   64,  117,  117,
			  348,   23,  348,  348,  348,   78,  348,  355,  355,  355,
			  355,  355,  355,  355,  348,  348,  348,  367,  348,   97,
			  348,  348,  348,  348,  348,  348,  106,  107,  351,  348,
			  348,  110,  110,  368,  366,  369,  370,  348,  117,  117,
			  117,  117,  117,   23,  348,  348,  371,  372,   97,  348,
			  348,  373,  348,  348,  148,  174,  348,  348,  110,  110,
			  110,  110,  348,  368,  348,  369,  370,  374,  370,  117,
			  348,  188,  117,  117,  348,  117,   23,  348,  348,  348,

			  372,   97,  375,  348,  348,  348,  175,  175,  348,  110,
			  110,  348,  110,  110,  110,  348,  376,  377,  370,  218,
			  117,  218,  218,  117,  117,  117,   23,  348,   97,  348,
			  348,  348,  206,  348,  110,  110,  110,  348,  110,  110,
			  110,  110,  348,  378,  377,  117,  117,  117,  348,   23,
			  348,  174,  110,  378,  379,  188,  348,  374,   23,  372,
			  251,  348,  110,  380,  379,  222,  348,  377,  348,  348,
			  372,  260,  348,  110,  381,  382,  377,  372,  260,  351,
			  381,  383,  276,  282,  277,  284,  278,  351,  384,  385,
			  383,  368,  276,  348,  348,  277,  348,  351,  384,  385,

			  386,  368,  291,  276,  348,  348,  277,  351,  385,  387,
			  282,  348,  372,  351,  385,  348,  387,  351,  385,  388,
			  291,  351,  318,  388,  291,  351,  351,  318,  291,  351,
			  351,  351,  348,  385,  291,  348,  348,  348,  385,  291,
			  385,  291,  308,  291,  291,  291,  291,  291,    0,  348,
			  348,  348,  348,  348,  348,  348,  348,  348,  348,  348,
			  348,  348,  348,  348,  348,  348,  348,  348,  348,  348,
			  348,  348,  348,  348,  348,  348,  348,  348,  348,  348,
			  348,  348,  348,  348,  348,  348,  348,  348,  348, yy_Dummy>>)
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
			    0,    0,    0,   59,   56,    1,    1,   47,   36,   56,
			   57,    1,   56,   56,   56,   58,   26,   58,   28,   58,
			   33,   32,   32,   35,   51,   52,   53,   54,   51,   51,
			   51,   51,   51,   58,   58,   16,   58,   58,   41,   58,
			   40,   38,   58,   56,   56,    1,   47,   46,   56,    0,
			    0,    0,    0,    0,    0,    0,   13,   55,    1,   56,
			    3,   56,   56,   56,   26,    0,    0,   33,   32,   32,
			   51,   53,   52,   49,   48,   50,   51,   51,   51,   51,
			    0,   14,    0,    0,    0,   16,    0,    0,    0,   20,

			    0,    0,    0,   42,   38,    0,   56,   56,   56,    0,
			    0,   37,    0,    0,    0,    0,    0,    0,    0,    0,
			   55,   56,   27,   25,    0,    0,   34,   51,   51,   51,
			   51,   51,   51,   51,    0,    0,   19,   16,    0,    0,
			   15,    0,   22,    0,    0,    0,   56,   56,   56,    0,
			    0,    0,    0,   31,    0,    0,    0,    0,    0,    0,
			    6,    0,    0,   56,    0,    0,    0,    0,    0,   21,
			    0,    0,    0,    0,   56,   56,   44,   43,    0,    0,
			    0,    0,   31,   30,   12,    0,    0,   31,    0,    0,
			    7,    0,    0,    0,    5,    0,   56,   25,   25,    0,

			    0,    0,    0,    0,    0,   39,   56,   56,    0,    0,
			    0,    0,    0,    0,    0,   29,    0,   30,    0,    0,
			    0,    6,    6,    0,    0,    0,   56,   18,    0,    0,
			    0,    0,   56,   11,    0,    0,    0,   10,    0,    0,
			    0,    0,   30,    0,   30,    0,    6,    6,    0,   56,
			    0,   56,    0,    0,   30,    0,    4,   24,   56,    0,
			   56,    0,    0,    0,   30,    6,   24,   30,   56,    2,
			    0,   56,    9,    0,    0,   30,   30,    0,   56,   56,
			    0,   30,   30,   30,    0,    0,   56,   56,    0,    0,
			   30,   30,   30,   23,    0,    0,   17,   45,    0,    0,

			   30,   30,   30,   30,    0,    0,    0,   56,    0,   30,
			   30,   17,    0,   56,    0,    8,   30,   56,    0,   30,
			   30,   56,    0,   30,   30,   56,   56,    0,   30,   45,
			   56,   56,    0,    0,   30,    8,    0,    0,    0,   30,
			    0,   30,    0,   30,   30,   30,   30,   30,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 2388
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 348
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 349
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

	yyNb_rules: INTEGER = 58
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 59
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
