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
	yyssp := yyssp - 7
	yyvsp1 := yyvsp1 -6
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 13 then
--|#line 133 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 133")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp1 := yyvsp1 -9
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 14 then
--|#line 146 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 146")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 11
	yyvsp1 := yyvsp1 -10
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 15 then
--|#line 157 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 157")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp1 := yyvsp1 -9
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 16 then
--|#line 167 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 167")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 17 then
--|#line 170 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 170")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 18 then
--|#line 178 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 178")
end

			set_artefact_type (text)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 19 then
--|#line 184 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 184")
end

			set_artefact_type (text)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 20 then
--|#line 190 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 190")
end

			set_artefact_type (text)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 21 then
--|#line 196 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 196")
end

			set_artefact_type (text)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 22 then
--|#line 202 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 202")
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
--|#line 208 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 208")
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
--|#line 209 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 209")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 25 then
--|#line 212 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 212")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 26 then
--|#line 213 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 213")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 27 then
--|#line 216 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 216")
end

			adl_version.copy (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 28 then
--|#line 221 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 221")
end

			create uid.make_from_string (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 29 then
--|#line 226 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 226")
end

			create uid.make_from_string (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 30 then
--|#line 230 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 230")
end

			rm_release.copy (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 31 then
--|#line 234 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 234")
end

			is_controlled := True
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 32 then
--|#line 238 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 238")
end

			is_generated := True
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 33 then
--|#line 249 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 249")
end

			other_metadata.put (yyvs2.item (yyvsp2), yyvs2.item (yyvsp2 - 1))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 34 then
--|#line 253 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 253")
end

			other_metadata.put (yyvs2.item (yyvsp2), yyvs2.item (yyvsp2 - 1))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 35 then
--|#line 257 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 257")
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
--|#line 261 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 261")
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
--|#line 267 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 267")
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
--|#line 275 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 275")
end

			abort_with_error (ec_SASID, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 39 then
--|#line 281 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 281")
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
--|#line 287 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 287")
end

			abort_with_error (ec_SALA, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 41 then
--|#line 293 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 293")
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
--|#line 299 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 299")
end

			abort_with_error (ec_SADS, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 43 then
--|#line 305 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 305")
end

			definition_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 44 then
--|#line 309 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 309")
end

			abort_with_error (ec_SADF, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 45 then
--|#line 315 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 315")
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
--|#line 316 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 316")
end

			rules_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 47 then
--|#line 320 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 320")
end

			abort_with_error (ec_SAIV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 48 then
--|#line 326 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 326")
end

			terminology_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 49 then
--|#line 330 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 330")
end

			abort_with_error (ec_SAON, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 50 then
--|#line 336 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 336")
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
--|#line 337 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 337")
end

			annotations_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 52 then
--|#line 341 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 341")
end

			abort_with_error (ec_SAAN, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 53 then
--|#line 347 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 347")
end

			component_terminologies_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 54 then
--|#line 351 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 351")
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
			when 121 then
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
			    1,    1,    1,    1,    1,    1,    1,    2,    2,    1,
			    1,    2,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    2,    2,    2,    2,    2,    2,    1,    2,    1,
			    2,    1,    2,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    2,    1,    1,    1,    1,    1,    1,

			    2,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    2,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    1,    1,    1,    1, yyDummy>>)
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
			    5,    6,    7,   23,   23,   23,   23,    0,    0,    0,
			    0,    0,    0,   32,   31,    0,    0,   36,   35,    0,
			   25,   22,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,   24,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,   29,   28,   30,   27,   34,   33,   26,   39,   40,
			   16,   17,   37,   38,    0,    0,    0,    0,    0,    0,
			    0,    0,   41,   42,    0,   45,    0,    0,    0,    0,
			    0,   45,   43,   44,    0,    0,   45,    0,   45,   45,
			    0,   12,    0,   46,   47,   50,    0,   45,    0,    0,

			   48,   49,   50,    0,    9,   50,    0,   50,   50,    0,
			   51,   52,   10,   50,   15,   11,    0,   13,   14,   53,
			   54,    0,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			  121,    6,    7,    8,    9,   10,   11,   12,   13,   18,
			   32,   45,   65,   75,   85,   91,  104,   46,   14,   15,
			   16,  117,   47,   29,   30, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			   53, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768,   73,   73,   73,   73,   -1,   92,   92,
			   92,   92,   71, -32768, -32768,   66,   63, -32768,   62,   54,
			 -32768, -32768,   44,   81,   81,   68,   -4,   83,   82,    5,
			   -1, -32768,   72,   29,    3,   69,   33,   68,   68,   68,
			   69, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768,   70,   60,   69,   68,   69,   69,
			   60,   60, -32768, -32768,   30,   56,   60,   69,   60,   60,
			   65,   56, -32768, -32768,    2,   65,   56,   60,   56,   56,
			   64, -32768,   65, -32768, -32768,   38,   65,   56,   65,   65,

			 -32768, -32768,   38,   57, -32768,   38,   65,   38,   38,   39,
			 -32768, -32768, -32768,   38, -32768, -32768,   15, -32768, -32768, -32768,
			 -32768,   48,   18, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,   67,
			   21,  -35,  -49,  -32,  -36,  -63,  -33,   55, -32768, -32768,
			 -32768, -32768,   51, -32768,   59, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   50,   71,   28,   94,   63,   52,   51,   62,   56,   27,
			   93,   66,   68,   69,   70,   55,  120,   76,  123,   78,
			   79,  119,   95,   26,   25,   24,   23,   22,   87,  102,
			   61,   83,   77,  105,   60,  107,  108,   82,   80,   81,
			   33,   34,   35,  113,   86,   92,   88,   89,  122,   43,
			   96,   42,   98,   99,    5,   97,   44,  103,  111,  116,
			   43,  106,   42,  110,    4,  101,    3,    2,    1,  109,
			  100,   73,  112,   59,  114,  115,   72,   74,   58,   84,
			  118,   19,   20,   21,   41,   40,   42,   90,   48,   49,
			   64,   54,   53,   44,   39,   38,   31,   67,   37,   57,

			    0,    0,   17,   36, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			   35,   50,    3,    1,    1,    9,   10,    4,    3,   10,
			    8,   46,   47,   48,   49,   10,    1,   66,    0,   68,
			   69,    6,   85,   24,   25,   26,   27,   28,   77,   92,
			    1,    1,   67,   96,    5,   98,   99,    7,   70,   71,
			   19,   20,   21,  106,   76,   81,   78,   79,    0,   16,
			   86,   18,   88,   89,    1,   87,   12,   19,    1,   20,
			   16,   97,   18,    6,   11,    1,   13,   14,   15,  102,
			    6,    1,  105,    1,  107,  108,    6,   17,    6,   23,
			  113,   14,   15,   16,   30,   31,   18,   22,   33,   34,
			   21,    9,    9,   12,   32,   32,    4,   46,   32,   40,

			   -1,   -1,   29,   32, yyDummy>>)
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

	yyFinal: INTEGER = 123
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
