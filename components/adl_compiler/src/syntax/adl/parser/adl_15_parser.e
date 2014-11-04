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
--|#line 57 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 57")
end

			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 2 then
--|#line 61 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 61")
end

			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 3 then
--|#line 65 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 65")
end

			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 4 then
--|#line 69 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 69")
end

			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 5 then
--|#line 73 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 73")
end

			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 6 then
--|#line 80 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 80")
end

			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 7 then
--|#line 84 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 84")
end

			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 8 then
--|#line 91 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 91")
end

			abort_with_error (ec_SUNK, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 9 then
--|#line 97 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 97")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 9
	yyvsp1 := yyvsp1 -8
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 10 then
--|#line 106 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 106")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp1 := yyvsp1 -9
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 11 then
--|#line 116 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 116")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp1 := yyvsp1 -9
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 12 then
--|#line 126 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 126")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp1 := yyvsp1 -6
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 13 then
--|#line 133 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 133")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp1 := yyvsp1 -9
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 14 then
--|#line 146 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 146")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 11
	yyvsp1 := yyvsp1 -10
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 15 then
--|#line 157 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 157")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp1 := yyvsp1 -9
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 16 then
--|#line 167 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 167")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 17 then
--|#line 170 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 170")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 18 then
--|#line 178 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 178")
end

			set_artefact_type (text)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 19 then
--|#line 184 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 184")
end

			set_artefact_type (text)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 20 then
--|#line 190 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 190")
end

			set_artefact_type (text)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 21 then
--|#line 196 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 196")
end

			set_artefact_type (text)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 22 then
--|#line 202 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 202")
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
--|#line 208 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 208")
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
--|#line 209 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 209")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 25 then
--|#line 212 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 212")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 26 then
--|#line 213 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 213")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 27 then
--|#line 216 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 216")
end

			adl_version := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 28 then
--|#line 221 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 221")
end

			create uid.make_from_string (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 29 then
--|#line 226 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 226")
end

			create uid.make_from_string (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 30 then
--|#line 230 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 230")
end

			is_controlled := True
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 31 then
--|#line 234 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 234")
end

			is_generated := True
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 32 then
--|#line 245 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 245")
end

			other_metadata.put (yyvs2.item (yyvsp2), yyvs2.item (yyvsp2 - 1))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 33 then
--|#line 249 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 249")
end

			other_metadata.put (yyvs2.item (yyvsp2), yyvs2.item (yyvsp2 - 1))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 34 then
--|#line 253 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 253")
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
when 35 then
--|#line 257 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 257")
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
--|#line 263 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 263")
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
when 37 then
--|#line 271 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 271")
end

			abort_with_error (ec_SASID, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 38 then
--|#line 277 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 277")
end

			convert_odin_language (yyvs2.item (yyvsp2))
			language_text := yyvs2.item (yyvsp2)
			merge_errors (converter_status)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 39 then
--|#line 283 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 283")
end

			abort_with_error (ec_SALA, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 40 then
--|#line 289 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 289")
end

			convert_odin_language (yyvs2.item (yyvsp2))
			description_text := yyvs2.item (yyvsp2)
			merge_errors (converter_status)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 41 then
--|#line 295 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 295")
end

			abort_with_error (ec_SADS, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 42 then
--|#line 301 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 301")
end

			definition_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 43 then
--|#line 305 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 305")
end

			abort_with_error (ec_SADF, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 44 then
--|#line 311 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 311")
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
--|#line 312 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 312")
end

			rules_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 46 then
--|#line 316 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 316")
end

			abort_with_error (ec_SAIV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 47 then
--|#line 322 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 322")
end

			terminology_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 48 then
--|#line 326 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 326")
end

			abort_with_error (ec_SAON, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 49 then
--|#line 332 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 332")
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
when 50 then
--|#line 333 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 333")
end

			annotations_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 51 then
--|#line 337 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 337")
end

			abort_with_error (ec_SAAN, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 52 then
--|#line 343 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 343")
end

			component_terminologies_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 53 then
--|#line 347 "adl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_15_parser.y' at line 347")
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
			when 118 then
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
			   28,   29,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,   30,
			    2,   31,    2,    2,    2,    2,    2,    2,    2,    2,
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
			   25,   26,   27, yyDummy>>)
		end

	yyr1_template: SPECIAL [INTEGER]
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,   32,   32,   32,   32,   32,   32,   32,   32,   33,
			   34,   35,   36,   37,   39,   38,   54,   54,   40,   50,
			   51,   52,   42,   41,   41,   55,   55,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   49,   49,   43,   43,
			   44,   44,   45,   45,   46,   46,   46,   47,   47,   48,
			   48,   48,   53,   53, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    2,    2,    1,    1,
			    2,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    2,    2,    2,    2,    1,    2,    1,    2,    1,    2,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    2,    1,    1,    1,    1,    1,    1,    2,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    2,    1,    1,
			    1,    1,    1,    1,    1,    1,    2,    1,    1,    1,
			    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER]
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    2,    2,    2,    2,    2,    2,    2,
			    2,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER]
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    0,   21,   20,   19,   18,    8,    1,    2,    3,    4,
			    5,    6,    7,   23,   23,   23,   23,    0,    0,    0,
			    0,    0,    0,   31,   30,    0,   35,   34,    0,   25,
			   22,    0,    0,    0,    0,    0,    0,    0,    0,   24,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   29,
			   28,   27,   33,   32,   26,   38,   39,   16,   17,   36,
			   37,    0,    0,    0,    0,    0,    0,    0,    0,   40,
			   41,    0,   44,    0,    0,    0,    0,    0,   44,   42,
			   43,    0,    0,   44,    0,   44,   44,    0,   12,    0,
			   45,   46,   49,    0,   44,    0,    0,   47,   48,   49,

			    0,    9,   49,    0,   49,   49,    0,   50,   51,   10,
			   49,   15,   11,    0,   13,   14,   52,   53,    0,    0,
			    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			  118,    6,    7,    8,    9,   10,   11,   12,   13,   18,
			   31,   43,   62,   72,   82,   88,  101,   44,   14,   15,
			   16,  114,   45,   28,   29, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			   38, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768,   72,   72,   72,   72,   -1,   91,   91,
			   91,   91,   63, -32768, -32768,   62, -32768,   61,   54, -32768,
			 -32768,   52,   77,   77,   73,   -5,   78,    5,   -1, -32768,
			   70,   28,    2,   69,   57,   73,   73,   73,   69, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768,   68,   71,   69,   73,   69,   69,   71,   71, -32768,
			 -32768,   40,   49,   71,   69,   71,   71,   26,   49, -32768,
			 -32768,    6,   26,   49,   71,   49,   49,   59, -32768,   26,
			 -32768, -32768,   21,   26,   49,   26,   26, -32768, -32768,   21,

			   30, -32768,   21,   26,   21,   21,   43, -32768, -32768, -32768,
			   21, -32768, -32768,   16, -32768, -32768, -32768, -32768,   44,   20,
			 -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,   66,
			   58,  -34,  -47,  -30,  -28,  -61,  -43,   53, -32768, -32768,
			 -32768, -32768,   55, -32768,   60, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   48,   68,   27,   60,   50,   49,   59,   91,   53,   26,
			   63,   65,   66,   67,   90,   52,   73,  117,   75,   76,
			  120,   92,  116,   25,   24,   23,   22,   84,   99,   58,
			   74,  108,  102,   57,  104,  105,  107,   77,   78,    5,
			  100,   80,  110,   83,  119,   85,   86,   79,   87,    4,
			   89,    3,    2,    1,   94,   93,  106,   95,   96,  109,
			   98,  111,  112,  113,   42,   97,  103,  115,   41,   70,
			   40,   56,   81,   41,   69,   40,   55,   32,   33,   34,
			   19,   20,   21,   39,   38,   46,   47,   51,   71,   42,
			   61,   40,   37,   36,   35,   30,    0,    0,   54,   64,

			   17, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			   34,   48,    3,    1,    9,   10,    4,    1,    3,   10,
			   44,   45,   46,   47,    8,   10,   63,    1,   65,   66,
			    0,   82,    6,   24,   25,   26,   27,   74,   89,    1,
			   64,    1,   93,    5,   95,   96,    6,   67,   68,    1,
			   19,    1,  103,   73,    0,   75,   76,    7,   22,   11,
			   78,   13,   14,   15,   84,   83,   99,   85,   86,  102,
			    1,  104,  105,   20,   12,    6,   94,  110,   16,    1,
			   18,    1,   23,   16,    6,   18,    6,   19,   20,   21,
			   14,   15,   16,   29,   30,   32,   33,    9,   17,   12,
			   21,   18,   31,   31,   31,    4,   -1,   -1,   38,   44,

			   28, yyDummy>>)
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

	yyFinal: INTEGER = 120
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 32
			-- Number of tokens

	yyLast: INTEGER = 100
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 282
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 57
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

	adl_version: detachable STRING

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
