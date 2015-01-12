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
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
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

			abort_with_error (ec_SUNK, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 6 then
--|#line 79 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 79")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 9
	yyvsp1 := yyvsp1 -8
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 7 then
--|#line 88 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 88")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp1 := yyvsp1 -9
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 8 then
--|#line 98 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 98")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp1 := yyvsp1 -9
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 9 then
--|#line 108 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 108")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 10 then
--|#line 114 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 114")
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
--|#line 117 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 117")
end

			parsed_template.add_overlay (parsed_overlay)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 12 then
--|#line 121 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 121")
end

			parsed_template.add_overlay (parsed_overlay)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 13 then
--|#line 127 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 127")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp1 := yyvsp1 -9
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 14 then
--|#line 137 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 137")
end

			parsed_auth_arch.reset
			parsed_arch_ref := parsed_auth_arch
			parsed_auth_arch_ref := parsed_auth_arch
			parsed_arch_ref.set_artefact_type (text)
			artefact_type := parsed_arch_ref.artefact_type
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 15 then
--|#line 147 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 147")
end

			parsed_template.reset
			parsed_arch_ref := parsed_template
			parsed_auth_arch := parsed_template
			parsed_arch_ref.set_artefact_type (text)
			artefact_type := parsed_arch_ref.artefact_type
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 16 then
--|#line 157 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 157")
end

			parsed_overlay.reset
			parsed_arch_ref := parsed_overlay
			parsed_arch_ref.set_artefact_type (text)
			artefact_type := parsed_arch_ref.artefact_type
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 17 then
--|#line 166 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 166")
end

			parsed_opt.reset
			parsed_arch_ref := parsed_opt
			parsed_auth_arch_ref := parsed_opt
			parsed_arch_ref.set_artefact_type (text)
			artefact_type := parsed_arch_ref.artefact_type
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 18 then
--|#line 176 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 176")
end

			parsed_arch_ref.set_archetype_id (text)
		
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
--|#line 182 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 182")
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
--|#line 183 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 183")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 21 then
--|#line 186 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 186")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 22 then
--|#line 187 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 187")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 23 then
--|#line 190 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 190")
end

			parsed_auth_arch_ref.set_adl_version (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 24 then
--|#line 195 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 195")
end

			parsed_auth_arch_ref.set_uid (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 25 then
--|#line 200 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 200")
end

			parsed_auth_arch_ref.set_uid (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 26 then
--|#line 204 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 204")
end

			parsed_auth_arch_ref.set_rm_release (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 27 then
--|#line 208 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 208")
end

			parsed_auth_arch_ref.set_is_controlled
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 28 then
--|#line 212 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 212")
end

			parsed_arch_ref.set_is_generated
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 29 then
--|#line 223 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 223")
end

			parsed_auth_arch_ref.put_other_metadata_item (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 30 then
--|#line 227 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 227")
end

			parsed_auth_arch_ref.put_other_metadata_item (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 31 then
--|#line 231 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 231")
end

			parsed_auth_arch_ref.put_other_metadata_item (yyvs2.item (yyvsp2), "true")
		
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
--|#line 235 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 235")
end

			parsed_auth_arch_ref.put_other_metadata_item (yyvs2.item (yyvsp2), "true")
		
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
--|#line 241 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 241")
end

			if archetype_id_checker.valid_id_reference (yyvs2.item (yyvsp2)) then
				parsed_arch_ref.set_parent_archetype_id (yyvs2.item (yyvsp2))
			else
				abort_with_error (ec_SASID, Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 34 then
--|#line 249 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 249")
end

			abort_with_error (ec_SASID, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 35 then
--|#line 255 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 255")
end

			convert_odin_language (yyvs2.item (yyvsp2))
			parsed_auth_arch_ref.set_language_text (yyvs2.item (yyvsp2))
			parsed_auth_arch_ref.set_language_text_start_line (language_text_start_line)
			merge_errors (converter_status)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 36 then
--|#line 262 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 262")
end

			abort_with_error (ec_SALA, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 37 then
--|#line 268 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 268")
end

			convert_odin_language (yyvs2.item (yyvsp2))
			parsed_auth_arch_ref.set_description_text  (yyvs2.item (yyvsp2))
			parsed_auth_arch_ref.set_description_text_start_line (description_text_start_line)
			merge_errors (converter_status)
		
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

			abort_with_error (ec_SADS, Void)
		
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

			parsed_arch_ref.set_definition_text (yyvs2.item (yyvsp2))
			parsed_arch_ref.set_definition_text_start_line (definition_text_start_line)
		
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

			abort_with_error (ec_SADF, Void)
		
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
--|#line 293 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 293")
end

			parsed_arch_ref.set_rules_text (yyvs2.item (yyvsp2))
			parsed_arch_ref.set_rules_text_start_line (rules_text_start_line)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 43 then
--|#line 298 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 298")
end

			abort_with_error (ec_SAIV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 44 then
--|#line 304 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 304")
end

			parsed_arch_ref.set_terminology_text (yyvs2.item (yyvsp2))
			parsed_arch_ref.set_terminology_text_start_line (terminology_text_start_line)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 45 then
--|#line 309 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 309")
end

			abort_with_error (ec_SAON, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 46 then
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
when 47 then
--|#line 316 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 316")
end

			parsed_auth_arch.set_annotations_text (yyvs2.item (yyvsp2))
			parsed_auth_arch_ref.set_annotations_text_start_line (annotations_text_start_line)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 48 then
--|#line 321 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 321")
end

			abort_with_error (ec_SAAN, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 49 then
--|#line 327 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 327")
end

			parsed_opt.set_component_terminologies_text (yyvs2.item (yyvsp2))
			parsed_opt.set_component_terminologies_text_start_line (component_terminologies_text_start_line)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 50 then
--|#line 332 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 332")
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
			    0,   33,   33,   33,   33,   33,   34,   35,   36,   50,
			   37,   37,   37,   38,   39,   49,   51,   52,   41,   40,
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
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    2,    1,    1,    1,    1,    1,    1,    2,    2,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    2,    1,
			    1,    1,    2,    2,    2,    2,    2,    2,    1,    2,
			    1,    1,    1,    1,    1,    1,    2,    1,    1,    1,
			    2,    1,    1,    1,    1,    1,    2,    1,    1,    1,
			    1,    1,    1,    2,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    2,    1,    1,    1,    1,    1,

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
			    0,   17,   15,   14,    5,    1,    2,   10,    4,   19,
			   19,   19,   16,    3,   11,    0,    0,    0,    0,    0,
			   12,   18,    0,    0,   28,   27,    0,    0,   32,   31,
			    0,   21,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,   20,    0,    0,    0,    0,    0,   33,   34,
			    0,    0,   25,   24,   26,   23,   30,   29,   22,   35,
			   36,    0,    0,    0,    0,    0,   39,   40,    0,    9,
			   37,   38,   41,    0,    0,   41,   44,   45,    0,    0,
			   41,   41,    0,   42,   43,   46,    0,    0,   46,    0,
			    6,   46,   46,    0,   47,   48,    7,    8,    0,   13,

			   49,   50,    0,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			  102,    5,    6,    7,   13,    8,    9,   17,   22,   44,
			   62,   51,   79,   69,   90,   36,   10,   14,   15,   11,
			   99,   30,   31, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			    1, -32768, -32768, -32768, -32768, -32768, -32768,   62, -32768,   64,
			   64,   64, -32768,   62, -32768,   70,   -3,   70,   70,   70,
			 -32768, -32768,   58,   60, -32768, -32768,   57,   54, -32768,   53,
			   -1, -32768,   22,   58,   55,   52,   50,   -5,   59,   56,
			    3,   -3, -32768,   44,   51,   55,   55,   51, -32768, -32768,
			   32,   47, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768,   43,   50,   51,   51,   50, -32768, -32768,   42, -32768,
			 -32768, -32768,   48,   50,   50,   48, -32768, -32768,    2,   47,
			   48,   48,   47, -32768, -32768,   33,   47,   47,   33,   41,
			 -32768,   33,   33,   46, -32768, -32768, -32768, -32768,   40, -32768,

			 -32768, -32768,   61,    9, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768,   49,   45,  -19,
			  -46,  -54,  -43,  -51,  -37,   25, -32768,   65, -32768, -32768,
			 -32768, -32768,   34, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   29,   65,    4,   84,   53,   52,   57,   28,   72,  104,
			   83,   75,    3,   56,    2,   47,    1,   73,   74,   80,
			   81,   27,   26,   25,   24,   23,   63,   64,   85,   42,
			   41,   88,   82,   67,   35,   91,   92,   86,   87,   66,
			   43,  101,   95,   77,   71,   60,  100,   94,   76,   70,
			   59,   93,   89,   49,   96,   97,   48,   45,   46,   18,
			   19,  103,   32,   33,   34,   55,   98,   50,   54,   68,
			   35,   78,   61,   43,   21,   58,   12,    0,   20,    0,
			    0,    0,    0,    0,    0,   40,   39,    0,    0,   38,
			    0,    0,   37,   16, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			    3,   47,    1,    1,    9,   10,    3,   10,   62,    0,
			    8,   65,   11,   10,   13,   34,   15,   63,   64,   73,
			   74,   24,   25,   26,   27,   28,   45,   46,   79,   30,
			   31,   82,   75,    1,   12,   86,   87,   80,   81,    7,
			   18,    1,    1,    1,    1,    1,    6,    6,    6,    6,
			    6,   88,   19,    1,   91,   92,    4,   32,   33,   10,
			   11,    0,   17,   18,   19,    9,   20,   17,    9,   22,
			   12,   23,   21,   18,    4,   41,   14,   -1,   13,   -1,
			   -1,   -1,   -1,   -1,   -1,   32,   32,   -1,   -1,   32,
			   -1,   -1,   32,   29, yyDummy>>)
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

	yyLast: INTEGER = 93
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
			create artefact_type.default_create
			create parsed_auth_arch.make
			parsed_arch_ref := parsed_auth_arch
			parsed_auth_arch_ref := parsed_auth_arch
			create parsed_template.make
			create parsed_overlay.make
			create parsed_opt.make
		end

	reset
		do
			precursor
			validator_reset
			create artefact_type.default_create
			accept
		end

	execute (in_text:STRING)
		do
			reset
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

	artefact_type: ARTEFACT_TYPE

	parsed_arch_ref: PARSED_ARCHETYPE

	parsed_auth_arch_ref: PARSED_AUTHORED_ARCHETYPE

	parsed_auth_arch: PARSED_AUTHORED_ARCHETYPE

	parsed_overlay: PARSED_ARCHETYPE

	parsed_template: PARSED_TEMPLATE

	parsed_opt: PARSED_OPT

feature {NONE} -- Implementation 

	set_archetype_id (an_arch_id: STRING)
		do
			if archetype_id_checker.valid_id (an_arch_id) then
				parsed_arch_ref.set_archetype_id (an_arch_id)
			else
				abort_with_error (ec_SASID, Void)
			end
		end

end
