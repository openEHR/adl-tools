note
	component:   "openEHR ADL Tools"
	description: "Validating parser for Archetype Description Language (ADL)"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ADL_2_PARSER

inherit
	PARSER_VALIDATOR
		rename
			reset as validator_reset,
			make as make_parser_skeleton
		end

	ADL_2_SCANNER
		rename
			make as make_scanner
		redefine
			reset
		end

	ADL_SYNTAX_CONVERTER

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
		do
			if not yy_retried then
				inspect yy_act
when 1 then
--|#line 57 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 57")
end

			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 2 then
--|#line 61 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 61")
end

			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 3 then
--|#line 65 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 65")
end

			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 4 then
--|#line 69 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 69")
end

			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 5 then
--|#line 73 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 73")
end

			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 6 then
--|#line 80 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 80")
end

			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 7 then
--|#line 84 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 84")
end

			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 8 then
--|#line 91 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 91")
end

			abort_with_error (ec_SUNK, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 9 then
--|#line 97 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 97")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 9
	yyvsp1 := yyvsp1 -8
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 10 then
--|#line 106 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 106")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp1 := yyvsp1 -9
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 11 then
--|#line 116 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 116")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp1 := yyvsp1 -9
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 12 then
--|#line 126 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 126")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 13 then
--|#line 132 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 132")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp1 := yyvsp1 -9
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 14 then
--|#line 145 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 145")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 11
	yyvsp1 := yyvsp1 -10
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 15 then
--|#line 156 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 156")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp1 := yyvsp1 -9
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 16 then
--|#line 166 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 166")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 17 then
--|#line 169 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 169")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 18 then
--|#line 177 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 177")
end

			set_artefact_type (text)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 19 then
--|#line 183 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 183")
end

			set_artefact_type (text)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 20 then
--|#line 189 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 189")
end

			set_artefact_type (text)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 21 then
--|#line 195 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 195")
end

			set_artefact_type (text)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 22 then
--|#line 201 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 201")
end

			set_archetype_id (text)
		
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
when 23 then
--|#line 207 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 207")
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
when 24 then
--|#line 208 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 208")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 25 then
--|#line 211 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 211")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 26 then
--|#line 212 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 212")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 27 then
--|#line 215 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 215")
end

			adl_version.copy (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 28 then
--|#line 220 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 220")
end

			create uid.make_from_string (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 29 then
--|#line 225 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 225")
end

			create uid.make_from_string (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 30 then
--|#line 229 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 229")
end

			rm_release.copy (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 31 then
--|#line 233 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 233")
end

			is_controlled := True
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 32 then
--|#line 237 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 237")
end

			is_generated := True
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 33 then
--|#line 248 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 248")
end

			other_metadata.put (yyvs2.item (yyvsp2), yyvs2.item (yyvsp2 - 1))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 34 then
--|#line 252 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 252")
end

			other_metadata.put (yyvs2.item (yyvsp2), yyvs2.item (yyvsp2 - 1))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 35 then
--|#line 256 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 256")
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
when 36 then
--|#line 260 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 260")
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
when 37 then
--|#line 266 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 266")
end

			if archetype_id_checker.valid_id_reference (yyvs2.item (yyvsp2)) then
				parent_archetype_id := yyvs2.item (yyvsp2)
			else
				abort_with_error (ec_SASID, Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 38 then
--|#line 274 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 274")
end

			abort_with_error (ec_SASID, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 39 then
--|#line 280 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 280")
end

			convert_odin_language (yyvs2.item (yyvsp2))
			language_text := yyvs2.item (yyvsp2)
			merge_errors (converter_status)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 40 then
--|#line 286 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 286")
end

			abort_with_error (ec_SALA, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 41 then
--|#line 292 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 292")
end

			convert_odin_language (yyvs2.item (yyvsp2))
			description_text := yyvs2.item (yyvsp2)
			merge_errors (converter_status)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 42 then
--|#line 298 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 298")
end

			abort_with_error (ec_SADS, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 43 then
--|#line 304 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 304")
end

			definition_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 44 then
--|#line 308 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 308")
end

			abort_with_error (ec_SADF, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 45 then
--|#line 314 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 314")
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
when 46 then
--|#line 315 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 315")
end

			rules_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 47 then
--|#line 319 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 319")
end

			abort_with_error (ec_SAIV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 48 then
--|#line 325 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 325")
end

			terminology_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 49 then
--|#line 329 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 329")
end

			abort_with_error (ec_SAON, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 50 then
--|#line 335 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 335")
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
when 51 then
--|#line 336 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 336")
end

			annotations_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 52 then
--|#line 340 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 340")
end

			abort_with_error (ec_SAAN, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 53 then
--|#line 346 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 346")
end

			component_terminologies_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 54 then
--|#line 350 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 350")
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
			when 119 then
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
			   29,   30,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,   31,
			    2,   32,    2,    2,    2,    2,    2,    2,    2,    2,
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
			   25,   26,   27,   28, yyDummy>>)
		end

	yyr1_template: SPECIAL [INTEGER]
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,   33,   33,   33,   33,   33,   33,   33,   33,   34,
			   35,   36,   37,   38,   40,   39,   55,   55,   41,   51,
			   52,   53,   43,   42,   42,   56,   56,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   50,   50,   44,
			   44,   45,   45,   46,   46,   47,   47,   47,   48,   48,
			   49,   49,   49,   54,   54, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    2,    1,    1,    1,    1,    1,    1,    1,    2,    2,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    1,    1,    1,    1,    2,    2,    2,    2,    2,    2,
			    1,    2,    1,    2,    1,    1,    1,    1,    1,    1,
			    1,    2,    1,    1,    1,    1,    2,    1,    1,    1,
			    1,    1,    1,    2,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    2,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    2,    1,
			    1,    1,    1,    1,    1,    1,    1,    2,    1,    1,
			    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER]
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    2,    2,    2,    2,    2,    2,    2,
			    2,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER]
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    0,   21,   20,   19,   18,    8,    1,    2,    3,    4,
			    5,    6,    7,   23,   23,    0,   23,    0,    0,    0,
			   22,    0,    0,    0,   32,   31,    0,    0,   36,   35,
			    0,   25,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,   24,    0,    0,    0,    0,    0,    0,   37,
			   38,    0,    0,    0,   29,   28,   30,   27,   34,   33,
			   26,   39,   40,   16,   17,    0,    0,    0,    0,    0,
			    0,   43,   44,    0,   12,    0,   41,   42,   45,    0,
			    0,    0,    0,   48,   49,   45,    0,    0,   45,    0,
			   45,   45,    0,   46,   47,   50,    0,   45,    0,    0,

			   50,    0,    9,   50,    0,   50,   50,    0,   51,   52,
			   10,   50,   15,   11,    0,   13,   14,   53,   54,    0,
			    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			  119,    6,    7,    8,    9,   10,   11,   12,   13,   18,
			   21,   45,   66,   52,   87,   74,  102,   35,   14,   15,
			   16,  115,   47,   30,   31, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			   44, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768,   73,   73,   89,   73,   -1,   89,   89,
			 -32768,   79,   89,   71, -32768, -32768,   69,   65, -32768,   60,
			    0, -32768,   22,   79,   49,   68,   70,   -5,   81,   80,
			    4,   -1, -32768,   61,   77,   66,    3,   70,   70, -32768,
			 -32768,   15,   62,   66, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768,   50,   68,   66,   70,   66,
			   66, -32768, -32768,   46, -32768,   68, -32768, -32768,   63,   68,
			   66,   68,   68, -32768, -32768,   63,    5,   62,   63,   68,
			   63,   63,   62, -32768, -32768,   42,   62,   63,   62,   62,

			   42,   38, -32768,   42,   62,   42,   42,   55, -32768, -32768,
			 -32768,   42, -32768, -32768,    2, -32768, -32768, -32768, -32768,   64,
			   41, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,   67,
			   58,  -36,  -52,  -46,  -25,  -50,  -32,   37, -32768, -32768,
			 -32768, -32768,   52, -32768,   53, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   53,   75,   29,  118,   55,   54,   94,   59,  117,   28,
			   67,   69,   70,   93,   58,   79,   72,   81,   82,   44,
			   78,   43,   71,   27,   26,   25,   24,   23,   89,   85,
			   42,   41,   80,   88,   34,   90,   91,   95,   44,  109,
			   43,  121,  100,   97,  108,    5,  103,   84,  105,  106,
			   50,   77,   83,   49,  111,    4,   76,    3,    2,    1,
			   92,  101,   62,   96,  120,   98,   99,   61,  107,   46,
			   48,  110,  104,  112,  113,  114,   32,   33,   64,  116,
			   36,   19,   63,   22,   73,   51,   86,   65,   43,   57,
			   56,   34,   40,   20,   60,    0,    0,   39,   68,    0,

			    0,   38,   17,   37, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			   36,   53,    3,    1,    9,   10,    1,    3,    6,   10,
			   46,   47,   48,    8,   10,   67,    1,   69,   70,   16,
			   66,   18,    7,   24,   25,   26,   27,   28,   80,   75,
			   30,   31,   68,   79,   12,   81,   82,   87,   16,    1,
			   18,    0,   92,   89,    6,    1,   96,    1,   98,   99,
			    1,    1,    6,    4,  104,   11,    6,   13,   14,   15,
			   85,   19,    1,   88,    0,   90,   91,    6,  100,   32,
			   33,  103,   97,  105,  106,   20,   18,   19,    1,  111,
			   22,   14,    5,   16,   22,   17,   23,   21,   18,    9,
			    9,   12,   32,    4,   41,   -1,   -1,   32,   46,   -1,

			   -1,   32,   29,   32, yyDummy>>)
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

	yyFinal: INTEGER = 121
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 33
			-- Number of tokens

	yyLast: INTEGER = 103
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 283
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 58
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
			create adl_version.make_empty
			create rm_release.make_empty
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
			adl_version.wipe_out
			rm_release.wipe_out
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
			component_terminologies_text := Void

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

	adl_version: STRING

	rm_release: STRING

	uid: detachable HIER_OBJECT_ID

	is_controlled: BOOLEAN

	is_generated: BOOLEAN

	artefact_type: ARTEFACT_TYPE

	parent_archetype_id: detachable STRING

	concept: detachable STRING

	language_text: STRING

	description_text: detachable STRING

	definition_text: STRING

	rules_text: detachable STRING
	
	terminology_text: STRING

	annotations_text: detachable STRING

	component_terminologies_text: detachable STRING

feature {NONE} -- Implementation 

	set_artefact_type (an_artefact_type: STRING)
		do
			an_artefact_type.right_adjust
			create artefact_type.make_from_type_name (an_artefact_type)
		end

	set_archetype_id (an_arch_id: STRING)
		do
			if archetype_id_checker.valid_id (an_arch_id) then
				create archetype_id.make_from_string (an_arch_id)
			else
				abort_with_error (ec_SASID, Void)
			end
		end

end
