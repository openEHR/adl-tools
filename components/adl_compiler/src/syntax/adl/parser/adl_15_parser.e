note
	component:   "openEHR ADL Tools"
	description: "Validating parser for Archetype Description Language (ADL)"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ADL_15_PARSER

inherit
	PARSER_VALIDATOR
		rename
			reset as validator_reset,
			make as make_parser_skeleton
		end

	ADL_15_SCANNER
		rename
			make as make_scanner
		redefine
			reset
		end

	ADL_SYNTAX_CONVERTER

	KL_SHARED_EXCEPTIONS
	KL_SHARED_ARGUMENTS

create
	make


feature {NONE} -- Implementation

	yy_build_parser_tables
			-- Build parser tables.
		do
			yytranslate := yytranslate_template
			yyr1 := yyr1_template
			yytypes1 := yytypes1_template
			yytypes2 := yytypes2_template
			yydefact := yydefact_template
			yydefgoto := yydefgoto_template
			yypact := yypact_template
			yypgoto := yypgoto_template
			yytable := yytable_template
			yycheck := yycheck_template
		end

	yy_create_value_stacks
			-- Create value stacks.
		do
			create yyspecial_routines1
			yyvsc1 := yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.make (yyvsc1)
			create yyspecial_routines2
			yyvsc2 := yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.make (yyvsc2)
		end

	yy_init_value_stacks
			-- Initialize value stacks.
		do
			yyvsp1 := -1
			yyvsp2 := -1
		end

	yy_clear_value_stacks
			-- Clear objects in semantic value stacks so that
			-- they can be collected by the garbage collector.
		do
			yyvs1.keep_head (0)
			yyvs2.keep_head (0)
		end

	yy_push_last_value (yychar1: INTEGER)
			-- Push semantic value associated with token `last_token'
			-- (with internal id `yychar1') on top of corresponding
			-- value stack.
		do
			inspect yytypes2.item (yychar1)
			when 1 then
				yyvsp1 := yyvsp1 + 1
				if yyvsp1 >= yyvsc1 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs1")
					end
					yyvsc1 := yyvsc1 + yyInitial_yyvs_size
					yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
				end
				yyspecial_routines1.force (yyvs1, last_detachable_any_value, yyvsp1)
			when 2 then
				yyvsp2 := yyvsp2 + 1
				if yyvsp2 >= yyvsc2 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs2")
					end
					yyvsc2 := yyvsc2 + yyInitial_yyvs_size
					yyvs2 := yyspecial_routines2.aliased_resized_area (yyvs2, yyvsc2)
				end
				yyspecial_routines2.force (yyvs2, last_string_value, yyvsp2)
			else
				debug ("GEYACC")
					std.error.put_string ("Error in parser: not a token type: ")
					std.error.put_integer (yytypes2.item (yychar1))
					std.error.put_new_line
				end
				abort
			end
		end

	yy_push_error_value
			-- Push semantic value associated with token 'error'
			-- on top of corresponding value stack.
		local
			yyval1: detachable ANY
		do
			yyvsp1 := yyvsp1 + 1
			if yyvsp1 >= yyvsc1 then
				debug ("GEYACC")
					std.error.put_line ("Resize yyvs1")
				end
				yyvsc1 := yyvsc1 + yyInitial_yyvs_size
				yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
			end
			yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
		end

	yy_pop_last_value (yystate: INTEGER)
			-- Pop semantic value from stack when in state `yystate'.
		local
			yy_type_id: INTEGER
		do
			yy_type_id := yytypes1.item (yystate)
			inspect yy_type_id
			when 1 then
				yyvsp1 := yyvsp1 - 1
			when 2 then
				yyvsp2 := yyvsp2 - 1
			else
				debug ("GEYACC")
					std.error.put_string ("Error in parser: unknown type id: ")
					std.error.put_integer (yy_type_id)
					std.error.put_new_line
				end
				abort
			end
		end

	yy_run_geyacc
			-- You must run geyacc to regenerate this class.
		do
		end

feature {NONE} -- Semantic actions

	yy_do_action (yy_act: INTEGER)
			-- Execute semantic action.
		local
			yy_retried: BOOLEAN
			yyval1: detachable ANY
			yyval2: STRING
		do
			if not yy_retried then
				inspect yy_act
when 1 then
--|#line 52 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 52")
end

			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 2 then
--|#line 56 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 56")
end

			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 3 then
--|#line 60 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 60")
end

			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 4 then
--|#line 64 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 64")
end

			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 5 then
--|#line 68 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 68")
end

			abort_with_error (ec_SUNK, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 6 then
--|#line 74 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 74")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp1 := yyvsp1 -6
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 7 then
--|#line 83 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 83")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp1 := yyvsp1 -7
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 8 then
--|#line 93 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 93")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 9 then
--|#line 100 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 100")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp1 := yyvsp1 -7
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 10 then
--|#line 110 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 110")
end

			yyvs2.item (yyvsp2 - 1).right_adjust
			create artefact_type.make_from_type_name (yyvs2.item (yyvsp2 - 1))
			if archetype_id_parser.valid_id (yyvs2.item (yyvsp2)) then
				create archetype_id.make_from_string (yyvs2.item (yyvsp2))
			else
				abort_with_error (ec_SASID, Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 11 then
--|#line 120 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 120")
end

			abort_with_error (ec_SARID, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 12 then
--|#line 126 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 126")
end

			yyval2 := text
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp2 := yyvsp2 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp2 >= yyvsc2 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs2")
		end
		yyvsc2 := yyvsc2 + yyInitial_yyvs_size
		yyvs2 := yyspecial_routines2.aliased_resized_area (yyvs2, yyvsc2)
	end
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 13 then
--|#line 130 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 130")
end

			yyval2 := text
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp2 := yyvsp2 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp2 >= yyvsc2 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs2")
		end
		yyvsc2 := yyvsc2 + yyInitial_yyvs_size
		yyvs2 := yyspecial_routines2.aliased_resized_area (yyvs2, yyvsc2)
	end
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 14 then
--|#line 134 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 134")
end

			yyval2 := text
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp2 := yyvsp2 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp2 >= yyvsc2 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs2")
		end
		yyvsc2 := yyvsc2 + yyInitial_yyvs_size
		yyvs2 := yyspecial_routines2.aliased_resized_area (yyvs2, yyvsc2)
	end
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 15 then
--|#line 140 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 140")
end

			yyvs2.item (yyvsp2 - 1).right_adjust
			create artefact_type.make_from_type_name (yyvs2.item (yyvsp2 - 1))
			if archetype_id_parser.valid_id (yyvs2.item (yyvsp2)) then
				create archetype_id.make_from_string (yyvs2.item (yyvsp2))
			else
				abort_with_error (ec_SASID, Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 16 then
--|#line 150 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 150")
end

			abort_with_error (ec_SARID, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 17 then
--|#line 156 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 156")
end

			yyval2 := text
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp2 := yyvsp2 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp2 >= yyvsc2 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs2")
		end
		yyvsc2 := yyvsc2 + yyInitial_yyvs_size
		yyvs2 := yyspecial_routines2.aliased_resized_area (yyvs2, yyvsc2)
	end
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 18 then
--|#line 162 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 162")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp1 := yyvsp1 + 1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 19 then
--|#line 163 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 163")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 20 then
--|#line 166 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 166")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 21 then
--|#line 167 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 167")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 22 then
--|#line 170 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 170")
end

			adl_version := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 23 then
--|#line 175 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 175")
end

			create uid.make_from_string (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 24 then
--|#line 180 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 180")
end

			create uid.make_from_string (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 25 then
--|#line 184 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 184")
end

			is_controlled := True
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 26 then
--|#line 188 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 188")
end

			is_generated := True
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 27 then
--|#line 199 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 199")
end

			other_metadata.put (yyvs2.item (yyvsp2), yyvs2.item (yyvsp2 - 1))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 28 then
--|#line 203 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 203")
end

			other_metadata.put (yyvs2.item (yyvsp2), yyvs2.item (yyvsp2 - 1))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 29 then
--|#line 207 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 207")
end

			other_metadata.put ("true", yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 30 then
--|#line 211 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 211")
end

			other_metadata.put ("true", yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 31 then
--|#line 217 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 217")
end

			if archetype_id_parser.valid_id (yyvs2.item (yyvsp2)) then
				create parent_archetype_id.make_from_string (yyvs2.item (yyvsp2))
			else
				abort_with_error (ec_SASID, Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 32 then
--|#line 225 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 225")
end

			abort_with_error (ec_SASID, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 33 then
--|#line 231 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 231")
end

			convert_odin_language(yyvs2.item (yyvsp2))
			language_text := yyvs2.item (yyvsp2)
			merge_errors (converter_status)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 34 then
--|#line 237 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 237")
end

			abort_with_error (ec_SALA, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 35 then
--|#line 243 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 243")
end

			convert_odin_language(yyvs2.item (yyvsp2))
			description_text := yyvs2.item (yyvsp2)
			merge_errors (converter_status)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 36 then
--|#line 249 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 249")
end

			abort_with_error (ec_SADS, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 37 then
--|#line 255 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 255")
end

			definition_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 38 then
--|#line 259 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 259")
end

			abort_with_error (ec_SADF, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 39 then
--|#line 265 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 265")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp1 := yyvsp1 + 1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 40 then
--|#line 266 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 266")
end

			rules_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 41 then
--|#line 270 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 270")
end

			abort_with_error (ec_SAIV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 42 then
--|#line 276 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 276")
end

			terminology_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 43 then
--|#line 280 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 280")
end

			abort_with_error (ec_SAON, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 44 then
--|#line 286 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 286")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp1 := yyvsp1 + 1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 45 then
--|#line 287 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 287")
end

			annotations_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 46 then
--|#line 291 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 291")
end

			abort_with_error (ec_SAAN, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 47 then
--|#line 297 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 297")
end

			component_ontologies_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 48 then
--|#line 301 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 301")
end

			abort_with_error (ec_SAAN, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
				else
					debug ("GEYACC")
						std.error.put_string ("Error in parser: unknown rule id: ")
						std.error.put_integer (yy_act)
						std.error.put_new_line
					end
					abort
				end
			end
		rescue
			if yy_parsing_status = yyAborted then
				yy_retried := True
				retry
			end
		end

	yy_do_error_action (yy_act: INTEGER)
			-- Execute error action.
		do
			inspect yy_act
			when 86 then
					-- End-of-file expected action.
				report_eof_expected_error
			else
					-- Default action.
				report_error ("parse error")
			end
		end

feature {NONE} -- Table templates

	yytranslate_template: SPECIAL [INTEGER]
			-- Template for `yytranslate'
		once
			Result := yyfixed_array (<<
			    0,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			   27,   28,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,   29,
			    2,   30,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    1,    2,    3,    4,
			    5,    6,    7,    8,    9,   10,   11,   12,   13,   14,
			   15,   16,   17,   18,   19,   20,   21,   22,   23,   24,
			   25,   26, yyDummy>>)
		end

	yyr1_template: SPECIAL [INTEGER]
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,   33,   33,   33,   33,   33,   34,   35,   36,   37,
			   38,   38,   31,   31,   31,   46,   46,   32,   48,   48,
			   49,   49,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   45,   45,   39,   39,   40,   40,   41,   41,   42,
			   42,   42,   43,   43,   44,   44,   44,   47,   47, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    2,    2,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    2,    2,
			    1,    1,    2,    2,    2,    1,    2,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    2,    1,    1,
			    1,    1,    1,    1,    2,    2,    2,    2,    2,    1,
			    2,    1,    1,    1,    1,    1,    1,    1,    2,    1,
			    1,    1,    2,    1,    1,    1,    1,    1,    1,    2,
			    1,    1,    1,    1,    2,    1,    1,    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER]
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    2,    2,    2,    2,    2,    2,    2,
			    2,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER]
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    0,   17,   14,   13,   12,    5,    0,    0,    1,    2,
			    3,    4,    0,    0,    0,   11,    0,   16,    0,    0,
			    0,    0,    0,    0,    0,   26,   25,    0,   30,   29,
			    0,   20,   10,   15,   33,   34,   31,   32,    0,    0,
			    0,    0,    0,    0,    0,    0,   19,   35,   36,    0,
			   39,    0,    0,   39,   24,   23,   22,   28,   27,   21,
			   37,   38,    0,    0,   39,    0,    8,    0,   40,   41,
			   44,    0,   42,   43,   44,    0,    6,   44,    0,   45,
			   46,    7,    0,    9,   47,   48,    0,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			    6,    7,   86,    8,    9,   10,   11,   12,   21,   39,
			   50,   63,   66,   76,   22,   13,   83,   16,   30,   31, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			    9, -32768, -32768, -32768, -32768, -32768,    0,   -1, -32768, -32768,
			 -32768, -32768,   35,   48,    5, -32768,   65, -32768,   64,   43,
			   50,   46,   48,   46,   45, -32768, -32768,   41, -32768,   37,
			   28, -32768, -32768, -32768, -32768, -32768, -32768, -32768,   42,   47,
			   30,   47,    2,   55,   29,    5, -32768, -32768, -32768,   34,
			   38,   47,   40,   38, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768,   13,   40,   38,   39, -32768,   40, -32768, -32768,
			   44,   40, -32768, -32768,   44,   36, -32768,   44,   17, -32768,
			 -32768, -32768,   32, -32768, -32768, -32768,   59,   53, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,   12,  -21,
			  -35,  -46,  -54,  -19, -32768, -32768, -32768,   66, -32768,   25, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   17,   15,   41,  -18,  -18,   52,   53,   67,   29,   70,
			    5,   55,   54,   74,   69,   28,   64,   77,   71,   51,
			    4,   68,    3,    2,    1,   23,   14,   14,   27,   26,
			   25,   24,   58,   85,   40,   61,   82,   80,   84,   57,
			   73,   60,   79,   48,   35,   72,   49,   20,   47,   34,
			   38,   37,   19,   88,   36,   78,   46,   45,   81,   87,
			   62,   65,   75,   49,   56,   19,   38,   44,   33,   32,
			   59,   43,    0,   18,    0,   42, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			    1,    1,   23,    4,    4,   40,   41,   53,    3,   63,
			    1,    9,   10,   67,    1,   10,   51,   71,   64,   40,
			   11,    8,   13,   14,   15,   13,   27,   27,   23,   24,
			   25,   26,    3,    1,   22,    1,   19,    1,    6,   10,
			    1,    7,    6,    1,    1,    6,   16,   12,    6,    6,
			   20,    1,   17,    0,    4,   74,   28,   29,   77,    0,
			   22,   21,   18,   16,    9,   17,   20,   30,    4,    4,
			   45,   30,   -1,    7,   -1,   30, yyDummy>>)
		end

feature {NONE} -- Semantic value stacks

	yyvs1: SPECIAL [detachable ANY]
			-- Stack for semantic values of type detachable ANY

	yyvsc1: INTEGER
			-- Capacity of semantic value stack `yyvs1'

	yyvsp1: INTEGER
			-- Top of semantic value stack `yyvs1'

	yyspecial_routines1: KL_SPECIAL_ROUTINES [detachable ANY]
			-- Routines that ought to be in SPECIAL [detachable ANY]

	yyvs2: SPECIAL [STRING]
			-- Stack for semantic values of type STRING

	yyvsc2: INTEGER
			-- Capacity of semantic value stack `yyvs2'

	yyvsp2: INTEGER
			-- Top of semantic value stack `yyvs2'

	yyspecial_routines2: KL_SPECIAL_ROUTINES [STRING]
			-- Routines that ought to be in SPECIAL [STRING]

feature {NONE} -- Constants

	yyFinal: INTEGER = 88
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 31
			-- Number of tokens

	yyLast: INTEGER = 75
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 281
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 51
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



feature -- Initialization

	make
			-- Create a new Eiffel parser.
		do
			make_scanner
			make_parser_skeleton
			create other_metadata.make (0)
			create archetype_id.default_create
			create definition_text.make_empty
			create language_text.make_empty
			create terminology_text.make_empty
			create artefact_type.default_create
		end

	reset
		do
			precursor
			validator_reset
			accept
		end

	execute (in_text:STRING)
		do
			reset

			create artefact_type.default_create
			adl_version := Void
			other_metadata.wipe_out
			create archetype_id.default_create
			uid := Void
			parent_archetype_id := Void
			is_controlled := False
			is_generated := False

			language_text.wipe_out
			description_text := Void
			definition_text.wipe_out
			terminology_text.wipe_out
			rules_text := Void
			annotations_text := Void
			component_ontologies_text := Void

			set_input_buffer (new_string_buffer (in_text))
			parse
		end

feature {YY_PARSER_ACTION} -- Basic Operations

	error_loc: STRING
		do
			create Result.make_empty
			if attached {YY_FILE_BUFFER} input_buffer as f_buffer then
				Result.append (f_buffer.file.name + ", ")
			end
			Result.append ("line " + (in_lineno + source_start_line).out)
			Result.append(" [last ADL token = " + token_name(last_token) + "]")
		end

feature -- Parse Output

	archetype_id: ARCHETYPE_HRID

	other_metadata: HASH_TABLE [STRING, STRING]

	adl_version: detachable STRING

	uid: detachable HIER_OBJECT_ID

	is_controlled: BOOLEAN

	is_generated: BOOLEAN

	artefact_type: ARTEFACT_TYPE

	parent_archetype_id: detachable ARCHETYPE_HRID

	concept: detachable STRING

	language_text: STRING

	description_text: detachable STRING

	definition_text: STRING

	rules_text: detachable STRING
	
	terminology_text: STRING

	annotations_text: detachable STRING

	component_ontologies_text: detachable STRING

feature {NONE} -- Implementation 

	archetype_id_parser: ARCHETYPE_HRID_PARSER
		once
			create Result.make
		end

end
