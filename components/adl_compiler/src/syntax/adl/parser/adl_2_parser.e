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

			abort_with_error ({ADL_MESSAGES_IDS}.ec_SUNK, Void)
		
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

			create build_uid.make_from_string (yyvs2.item (yyvsp2))
		
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

			create rm_release.make_from_string (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 28 then
--|#line 185 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 185")
end

			is_controlled := True
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 29 then
--|#line 189 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 189")
end

			is_generated := True
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
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

			other_metadata.put (yyvs2.item (yyvsp2), yyvs2.item (yyvsp2 - 1))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -2
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
--|#line 212 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 212")
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
when 34 then
--|#line 218 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 218")
end

			if archetype_id_checker.valid_adl2_archetype_ref (yyvs2.item (yyvsp2)) then
				parent_archetype_id := yyvs2.item (yyvsp2)
			else
				abort_with_error ({ADL_MESSAGES_IDS}.ec_SASID, Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 35 then
--|#line 226 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 226")
end

			abort_with_error ({ADL_MESSAGES_IDS}.ec_SASID, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 36 then
--|#line 232 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 232")
end

			convert_odin_language (yyvs2.item (yyvsp2))
			language_text := yyvs2.item (yyvsp2)
			merge_errors (converter_status)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 37 then
--|#line 238 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 238")
end

			abort_with_error ({ADL_MESSAGES_IDS}.ec_SALA, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 38 then
--|#line 244 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 244")
end

			convert_odin_language (yyvs2.item (yyvsp2))
			description_text := yyvs2.item (yyvsp2)
			merge_errors (converter_status)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 39 then
--|#line 250 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 250")
end

			abort_with_error ({ADL_MESSAGES_IDS}.ec_SADS, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 40 then
--|#line 256 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 256")
end

			definition_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 41 then
--|#line 260 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 260")
end

			abort_with_error ({ADL_MESSAGES_IDS}.ec_SADF, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 42 then
--|#line 266 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 266")
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
when 43 then
--|#line 267 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 267")
end

			rules_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 44 then
--|#line 271 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 271")
end

			abort_with_error ({ADL_MESSAGES_IDS}.ec_SAIV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 45 then
--|#line 277 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 277")
end

			terminology_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 46 then
--|#line 281 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 281")
end

			abort_with_error ({ADL_MESSAGES_IDS}.ec_SAON, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 47 then
--|#line 287 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 287")
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
when 48 then
--|#line 288 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 288")
end

			annotations_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 49 then
--|#line 292 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 292")
end

			abort_with_error ({ADL_MESSAGES_IDS}.ec_SAAN, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 50 then
--|#line 298 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 298")
end

			component_terminologies_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 51 then
--|#line 302 "adl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_2_parser.y' at line 302")
end

			abort_with_error ({ADL_MESSAGES_IDS}.ec_SAAN, Void)
		
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
			when 105 then
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
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 284)
			yytranslate_template_1 (an_array)
			yytranslate_template_2 (an_array)
			Result := yyfixed_array (an_array)
		end

	yytranslate_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yytranslate'.
		do
			yyarray_subcopy (an_array, <<
			    0,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			   30,   31,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,   32,
			    2,   33,    2,    2,    2,    2,    2,    2,    2,    2,
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
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2, yyDummy>>,
			1, 200, 0)
		end

	yytranslate_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yytranslate'.
		do
			yyarray_subcopy (an_array, <<
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    1,    2,    3,    4,
			    5,    6,    7,    8,    9,   10,   11,   12,   13,   14,
			   15,   16,   17,   18,   19,   20,   21,   22,   23,   24,
			   25,   26,   27,   28,   29, yyDummy>>,
			1, 85, 200)
		end

	yyr1_template: SPECIAL [INTEGER]
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,   34,   34,   34,   34,   34,   34,   35,   36,   37,
			   51,   51,   38,   39,   40,   50,   52,   53,   42,   41,
			   41,   55,   55,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   49,   49,   43,   43,   44,   44,
			   45,   45,   46,   46,   46,   47,   47,   48,   48,   48,
			   54,   54, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    2,    1,
			    1,    1,    1,    1,    1,    1,    1,    2,    2,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    2,    1,    1,
			    1,    1,    2,    2,    2,    2,    2,    2,    2,    1,
			    2,    1,    1,    1,    1,    1,    2,    1,    1,    1,
			    1,    2,    1,    1,    1,    1,    2,    1,    1,    1,
			    1,    1,    1,    1,    2,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    2,    1,    1,    1,    1,

			    1,    1,    1,    2,    1,    1,    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER]
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    2,    2,    2,    2,    2,    2,    2,
			    2,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER]
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    0,   17,   16,   15,   14,    6,    1,    2,    3,    4,
			    5,   19,   19,    0,   19,    0,    0,    0,   18,    0,
			    0,    0,    0,   29,   28,    0,    0,   33,   32,    0,
			   21,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,   20,    0,    0,    0,    0,   34,   35,    0,
			    0,    0,   25,   24,   26,   27,   23,   31,   30,   22,
			   36,   37,    0,    0,    0,    0,   40,   41,    0,   12,
			    0,   38,   39,   42,    0,    0,   45,   46,   42,    0,
			    0,   42,   42,    0,   43,   44,   47,    0,    0,   47,
			    0,    7,   47,   47,    0,   48,   49,    8,   10,    0,

			   13,   11,    9,   50,   51,    0,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			  105,    6,    7,    8,    9,   10,   11,   16,   19,   44,
			   63,   50,   80,   69,   91,   34,   12,  102,   13,   14,
			  100,   29,   30, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			    0, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768,   59,   59,   74,   59,   -3,   74,   74, -32768,   64,
			   74,   55,   54, -32768, -32768,   52,   49, -32768,   46,   37,
			 -32768,   33,   64,   43,   51,   56,   53,   67,   66,   65,
			   29,   -3, -32768,   42,   38,   56,   56, -32768, -32768,    5,
			   44,   38, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768,   36,   51,   38,   38, -32768, -32768,   35, -32768,
			   51, -32768, -32768,   50,   51,   51, -32768, -32768,   50,   26,
			   44,   50,   50,   44, -32768, -32768,   48,   44,   44,   48,
			   34, -32768,   48,   48,   45, -32768, -32768, -32768,   17,   32,

			 -32768, -32768, -32768, -32768, -32768,    8,    4, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768,   47,   40,  -17,
			  -48,  -44,  -27,  -78,  -40,   39, -32768, -32768, -32768, -32768,
			 -32768, -32768,   57, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   28,    5,   86,   70,  107,   89,   67,   27,  106,   92,
			   93,    4,   66,    3,    2,    1,   74,   75,   51,   73,
			   26,   25,   24,   23,   22,   21,   78,   85,   64,   65,
			   81,   82,   58,  104,   84,   96,   77,   72,  103,   57,
			   95,   76,   71,   61,   48,   33,  101,   47,   60,   94,
			   43,   83,   97,   98,   87,   88,   31,   32,   62,   17,
			   35,   20,   53,   52,   99,   68,   90,   49,   42,   41,
			   45,   46,   79,   43,   56,   55,   33,   54,   18,   40,
			    0,    0,   39,    0,    0,   38,    0,   37,   36,   15,
			    0,    0,    0,    0,    0,    0,    0,    0,   59, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			    3,    1,   80,   51,    0,   83,    1,   10,    0,   87,
			   88,   11,    7,   13,   14,   15,   64,   65,   35,   63,
			   23,   24,   25,   26,   27,   28,   70,    1,   45,   46,
			   74,   75,    3,    1,    8,    1,    1,    1,    6,   10,
			    6,    6,    6,    1,    1,   12,   29,    4,    6,   89,
			   17,   78,   92,   93,   81,   82,   16,   17,   20,   12,
			   20,   14,    9,   10,   19,   21,   18,   16,   31,   32,
			   31,   32,   22,   17,    9,    9,   12,   10,    4,   33,
			   -1,   -1,   33,   -1,   -1,   33,   -1,   33,   33,   30,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   41, yyDummy>>)
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

	yyFinal: INTEGER = 107
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 34
			-- Number of tokens

	yyLast: INTEGER = 98
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 284
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
			build_uid := Void
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

	build_uid: detachable HIER_OBJECT_ID

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
			if archetype_id_checker.valid_adl2_archetype_id (an_arch_id) then
				create archetype_id.make_from_string (an_arch_id)
			else
				abort_with_error ({ADL_MESSAGES_IDS}.ec_SASID, Void)
			end
		end

end
