note
	component:   "openEHR ADL Tools"
	description: "Validating parser for Archetype Description Language (ADL) 1.4 archetypes"
	keywords:    "ADL 1.4"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ADL_14_PARSER

inherit
	PARSER_VALIDATOR
		rename
			reset as validator_reset,
			make as make_parser_skeleton
		end

	ADL_14_SCANNER
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
			yyval2: STRING
		do
			if not yy_retried then
				inspect yy_act
when 1 then
--|#line 54 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 54")
end

			accept

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 2 then
--|#line 58 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 58")
end

			accept

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 3 then
--|#line 62 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 62")
end

			abort_with_error (ec_SUNK, Void)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 4 then
--|#line 68 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 68")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp1 := yyvsp1 -7
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 5 then
--|#line 78 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 78")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 9
	yyvsp1 := yyvsp1 -8
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 6 then
--|#line 89 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 89")
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
when 7 then
--|#line 99 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 99")
end

			abort_with_error (ec_SARID, Void)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 8 then
--|#line 105 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 105")
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
when 9 then
--|#line 109 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 109")
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
when 10 then
--|#line 113 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 113")
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
when 11 then
--|#line 119 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 119")
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
when 12 then
--|#line 120 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 120")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 13 then
--|#line 123 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 123")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 14 then
--|#line 124 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 124")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 15 then
--|#line 127 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 127")
end

			adl_version := yyvs2.item (yyvsp2)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 16 then
--|#line 132 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 132")
end

			create uid.make_from_string (yyvs2.item (yyvsp2))

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 17 then
--|#line 137 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 137")
end

			create uid.make_from_string (yyvs2.item (yyvsp2))

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 18 then
--|#line 141 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 141")
end

			is_controlled := True

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 19 then
--|#line 145 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 145")
end

			is_generated := True

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 20 then
--|#line 156 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 156")
end

			other_metadata.put (yyvs2.item (yyvsp2), yyvs2.item (yyvsp2 - 1))

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 21 then
--|#line 160 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 160")
end

			other_metadata.put (yyvs2.item (yyvsp2), yyvs2.item (yyvsp2 - 1))

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 22 then
--|#line 164 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 164")
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
when 23 then
--|#line 168 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 168")
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
when 24 then
--|#line 174 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 174")
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
when 25 then
--|#line 182 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 182")
end

			abort_with_error (ec_SASID, Void)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 26 then
--|#line 188 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 188")
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
when 27 then
--|#line 189 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 189")
end

			concept := yyvs2.item (yyvsp2)
			debug("ADL_parse")
				io.put_string("concept = " + yyvs2.item (yyvsp2) + "%N")
			end

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 28 then
--|#line 196 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 196")
end

			abort_with_error (ec_SACO, Void)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 29 then
--|#line 202 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 202")
end

			convert_odin_language(yyvs2.item (yyvsp2))
			language_text := yyvs2.item (yyvsp2)
			merge_errors (converter_status)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 30 then
--|#line 208 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 208")
end

			abort_with_error (ec_SALA, Void)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 31 then
--|#line 214 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 214")
end

			convert_odin_language(yyvs2.item (yyvsp2))
			description_text := yyvs2.item (yyvsp2)
			merge_errors (converter_status)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 32 then
--|#line 220 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 220")
end

			abort_with_error (ec_SADS, Void)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 33 then
--|#line 227 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 227")
end

			definition_text := yyvs2.item (yyvsp2)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 34 then
--|#line 231 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 231")
end

			abort_with_error (ec_SADF, Void)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 35 then
--|#line 237 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 237")
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
when 36 then
--|#line 238 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 238")
end

			invariant_text := yyvs2.item (yyvsp2)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 37 then
--|#line 242 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 242")
end

			abort_with_error (ec_SAIV, Void)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 38 then
--|#line 248 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 248")
end

			ontology_text := yyvs2.item (yyvsp2)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 39 then
--|#line 252 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 252")
end

			abort_with_error (ec_SAON, Void)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 40 then
--|#line 258 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 258")
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
when 41 then
--|#line 259 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 259")
end

			annotations_text := yyvs2.item (yyvsp2)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 42 then
--|#line 263 "adl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_14_parser.y' at line 263")
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
			when 71 then
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
			    0,   33,   33,   33,   34,   35,   36,   36,   32,   32,
			   32,   45,   45,   46,   46,   47,   47,   47,   47,   47,
			   47,   47,   47,   47,   44,   44,   37,   37,   37,   38,
			   38,   39,   39,   40,   40,   41,   41,   41,   42,   42,
			   43,   43,   43, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    2,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    2,    2,    1,    1,    2,    2,    1,    2,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    2,    1,    1,
			    1,    1,    2,    2,    2,    2,    2,    1,    2,    1,
			    1,    1,    1,    2,    1,    1,    1,    1,    2,    1,
			    1,    1,    1,    2,    1,    1,    1,    1,    2,    1,
			    1,    1,    1,    1, yyDummy>>)
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
			    0,   10,    9,    8,    3,    0,    1,    2,   26,    0,
			    7,    0,    0,    0,    0,   26,    0,   19,   18,    0,
			   23,   22,    0,   13,    6,   24,   25,   27,   28,    0,
			    0,    0,    0,    0,    0,    0,   12,   29,   30,    0,
			    0,    0,   17,   16,   15,   21,   20,   14,   31,   32,
			    0,   35,    0,   33,   34,    0,    0,   35,   36,   37,
			    0,   40,    0,   38,   39,    0,    4,   40,   41,   42,
			    5,    0,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			    5,   71,    6,    7,    8,   14,   30,   40,   51,   56,
			   61,   66,   15,   11,   22,   23, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			    1, -32768, -32768, -32768, -32768,   -1, -32768, -32768,   22,   -2,
			 -32768,   41,   16,   31,   29,   36,   21, -32768, -32768,   17,
			 -32768,   15,  -11, -32768, -32768, -32768, -32768, -32768, -32768,   28,
			   23,   29,   -3,   34,    6,   -2, -32768, -32768, -32768,   27,
			   24,   23, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			   14,   19,   24, -32768, -32768,    3,   18,   19, -32768, -32768,
			   25,   20,   18, -32768, -32768,    4, -32768,   20, -32768, -32768,
			 -32768,   35,   30, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -32768, -32768, -32768, -32768, -32768,   40,   33,   32,    2,   -4,
			  -12,  -18, -32768, -32768, -32768,   26, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   10,   21,    4,  -11,   59,   69,   43,   42,   20,   46,
			   68,   58,    3,    2,    1,   54,   45,   26,   36,   35,
			   25,   53,   19,   18,   17,   16,   64,    9,   49,   38,
			   73,   63,   28,   48,   37,   72,   27,   13,   12,   65,
			   60,   50,   55,   44,   39,   24,   34,   29,   33,   70,
			   67,   13,   32,   62,   57,   31,    0,    0,    0,    0,
			    0,   47,    0,    0,   41,    0,    0,    0,    0,    0,
			    0,    0,    0,   52, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			    1,    3,    1,    4,    1,    1,    9,   10,   10,    3,
			    6,    8,   11,   12,   13,    1,   10,    1,   29,   30,
			    4,    7,   24,   25,   26,   27,    1,   28,    1,    1,
			    0,    6,    1,    6,    6,    0,    5,   15,   16,   19,
			   22,   17,   23,    9,   21,    4,   31,   18,   31,   67,
			   62,   15,   31,   57,   52,   15,   -1,   -1,   -1,   -1,
			   -1,   35,   -1,   -1,   31,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   41, yyDummy>>)
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

	yyFinal: INTEGER = 73
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 32
			-- Number of tokens

	yyLast: INTEGER = 73
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 282
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 48
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
			create ontology_text.make_empty
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
			ontology_text.wipe_out
			invariant_text := Void
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

	invariant_text: detachable STRING

	ontology_text: STRING

	annotations_text: detachable STRING

	component_ontologies_text: detachable STRING

feature {NONE} -- Implementation

	archetype_id_parser: ARCHETYPE_HRID_PARSER
		once
			create Result.make
		end

end
