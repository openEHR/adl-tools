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
--|#line 49 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 49")
end

			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 2 then
--|#line 53 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 53")
end

			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 3 then
--|#line 57 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 57")
end

			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 4 then
--|#line 61 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 61")
end

			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 5 then
--|#line 65 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 65")
end

			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 6 then
--|#line 69 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 69")
end

			abort_with_error (ec_SUNK, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 7 then
--|#line 75 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 75")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 9
	yyvsp1 := yyvsp1 -8
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 8 then
--|#line 84 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 84")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp1 := yyvsp1 -9
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 9 then
--|#line 94 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 94")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 11
	yyvsp1 := yyvsp1 -10
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 10 then
--|#line 105 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 105")
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
when 11 then
--|#line 106 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 106")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 12 then
--|#line 109 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 109")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 13 then
--|#line 115 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 115")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp1 := yyvsp1 -9
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 14 then
--|#line 125 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 125")
end

			set_artefact_type (text)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 15 then
--|#line 131 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 131")
end

			set_artefact_type (text)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 16 then
--|#line 137 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 137")
end

			set_artefact_type (text)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 17 then
--|#line 143 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 143")
end

			set_artefact_type (text)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 18 then
--|#line 149 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 149")
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
when 19 then
--|#line 155 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 155")
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
when 20 then
--|#line 156 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 156")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 21 then
--|#line 159 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 159")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 22 then
--|#line 160 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 160")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 23 then
--|#line 163 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 163")
end

			create adl_version.make_from_string (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 24 then
--|#line 168 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 168")
end

			create uid.make_from_string (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 25 then
--|#line 173 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 173")
end

			create uid.make_from_string (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 26 then
--|#line 177 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 177")
end

			create rm_release.make_from_string (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 27 then
--|#line 181 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 181")
end

			is_controlled := True
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 28 then
--|#line 185 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 185")
end

			is_generated := True
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 29 then
--|#line 196 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 196")
end

			other_metadata.put (yyvs2.item (yyvsp2), yyvs2.item (yyvsp2 - 1))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 30 then
--|#line 200 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 200")
end

			other_metadata.put (yyvs2.item (yyvsp2), yyvs2.item (yyvsp2 - 1))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 31 then
--|#line 204 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 204")
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
when 32 then
--|#line 208 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 208")
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
when 33 then
--|#line 214 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 214")
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
when 34 then
--|#line 222 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 222")
end

			abort_with_error (ec_SASID, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 35 then
--|#line 228 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 228")
end

			convert_odin_language (yyvs2.item (yyvsp2))
			language_text := yyvs2.item (yyvsp2)
			merge_errors (converter_status)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 36 then
--|#line 234 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 234")
end

			abort_with_error (ec_SALA, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 37 then
--|#line 240 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 240")
end

			convert_odin_language (yyvs2.item (yyvsp2))
			description_text := yyvs2.item (yyvsp2)
			merge_errors (converter_status)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 38 then
--|#line 246 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 246")
end

			abort_with_error (ec_SADS, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 39 then
--|#line 252 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 252")
end

			definition_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 40 then
--|#line 256 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 256")
end

			abort_with_error (ec_SADF, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 41 then
--|#line 262 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 262")
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
when 42 then
--|#line 263 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 263")
end

			rules_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 43 then
--|#line 267 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 267")
end

			abort_with_error (ec_SAIV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 44 then
--|#line 273 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 273")
end

			terminology_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 45 then
--|#line 277 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 277")
end

			abort_with_error (ec_SAON, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 46 then
--|#line 283 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 283")
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
when 47 then
--|#line 284 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 284")
end

			annotations_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 48 then
--|#line 288 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 288")
end

			abort_with_error (ec_SAAN, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 49 then
--|#line 294 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 294")
end

			component_terminologies_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 50 then
--|#line 298 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 298")
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
			when 102 then
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
			    0,   33,   33,   33,   33,   33,   33,   34,   35,   36,
			   50,   50,   37,   38,   39,   49,   51,   52,   41,   40,
			   40,   54,   54,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   48,   48,   42,   42,   43,   43,   44,
			   44,   45,   45,   45,   46,   46,   47,   47,   47,   53,
			   53, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    2,    1,
			    1,    1,    1,    1,    1,    1,    2,    2,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    2,    1,    1,    1,    1,
			    2,    2,    2,    2,    2,    2,    1,    2,    1,    1,
			    1,    1,    1,    2,    1,    1,    1,    1,    2,    1,
			    1,    1,    1,    2,    1,    1,    1,    1,    1,    1,
			    1,    2,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    1,    1,    1,    1,    1,    1,    1,

			    2,    1,    1,    1,    1, yyDummy>>)
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
			    0,   17,   16,   15,   14,    6,    1,    2,    3,    4,
			    5,   19,   19,    0,   19,    0,    0,    0,   18,    0,
			    0,    0,   28,   27,    0,    0,   32,   31,    0,   21,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			   20,    0,    0,    0,    0,   33,   34,    0,    0,    0,
			   25,   24,   26,   23,   30,   29,   22,   35,   36,    0,
			    0,    0,    0,   39,   40,    0,   12,    0,   37,   38,
			   41,    0,    0,   44,   45,   41,    0,    0,   41,   41,
			    0,   42,   43,   46,    0,    0,   46,    0,    7,   46,
			   46,    0,   47,   48,    8,   10,    0,   13,   11,    9,

			   49,   50,    0,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			  102,    6,    7,    8,    9,   10,   11,   16,   19,   42,
			   60,   48,   77,   66,   88,   33,   12,   99,   13,   14,
			   97,   28,   29, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			    0, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768,   51,   51,   75,   51,   -3,   75,   75, -32768,   63,
			   75,   49, -32768, -32768,   46,   45, -32768,   44,   34, -32768,
			   29,   63,   54,   55,   56,   53,   65,   61,   24,   -3,
			 -32768,   39,   52,   56,   56, -32768, -32768,   30,   48,   52,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,   38,
			   55,   52,   52, -32768, -32768,   37, -32768,   55, -32768, -32768,
			   26,   55,   55, -32768, -32768,   26,   11,   48,   26,   26,
			   48, -32768, -32768,   50,   48,   48,   50,   27, -32768,   50,
			   50,   35, -32768, -32768, -32768,   14,    2, -32768, -32768, -32768,

			 -32768, -32768,   32,    6, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768,   47,   40,   -8,
			  -45,  -42,  -26,  -75,  -39,   36, -32768, -32768, -32768, -32768,
			 -32768, -32768,   43, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   27,    5,   83,  101,   67,   86,  104,   26,  100,   89,
			   90,    4,   82,    3,    2,    1,   71,   72,   70,   81,
			   25,   24,   23,   22,   21,   75,   49,   55,   93,   78,
			   79,   64,  103,   92,   54,   61,   62,   63,   74,   69,
			   58,   32,   98,   73,   68,   57,   41,   91,   76,   80,
			   94,   95,   84,   85,   96,   46,   30,   31,   45,   17,
			   34,   20,   51,   50,   40,   39,   43,   44,   87,   65,
			   53,   47,   59,   41,   52,   32,   38,   37,   36,   18,
			   15,   35,   56, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			    3,    1,   77,    1,   49,   80,    0,   10,    6,   84,
			   85,   11,    1,   13,   14,   15,   61,   62,   60,    8,
			   23,   24,   25,   26,   27,   67,   34,    3,    1,   71,
			   72,    1,    0,    6,   10,   43,   44,    7,    1,    1,
			    1,   12,   28,    6,    6,    6,   17,   86,   22,   75,
			   89,   90,   78,   79,   19,    1,   16,   17,    4,   12,
			   20,   14,    9,   10,   30,   31,   30,   31,   18,   21,
			    9,   16,   20,   17,    9,   12,   32,   32,   32,    4,
			   29,   32,   39, yyDummy>>)
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

	yyFinal: INTEGER = 104
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 33
			-- Number of tokens

	yyLast: INTEGER = 82
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 283
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 56
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
			create adl_version.make_empty
			create rm_release.make_empty
			create other_metadata.make (0)
			create archetype_id.default_create
			uid := Void
			parent_archetype_id := Void
			is_controlled := False
			is_generated := False

			language_text := Void
			description_text := Void
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

	language_text: detachable STRING

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
