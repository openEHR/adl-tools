note
	component:   "openEHR Archetype Project"
	description: "Validating parser for Archetype Description Language (ADL)"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas@deepthought.com.au>"
	support:     "Deep Thought Informatics <support@deepthought.com.au>"
	copyright:   "Copyright (c) 2003-2005 Deep Thought Informatics Pty Ltd"
	license:     "The Eiffel Forum Open Source License version 1"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ADL_VALIDATOR

inherit
	YY_PARSER_SKELETON
		rename
			make as make_parser_skeleton
		redefine
			report_error
		end

	ADL_SCANNER
		rename
			make as make_eiffel_scanner
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
			if yyvs1 /= Void then
				yyvs1.clear_all
			end
			if yyvs2 /= Void then
				yyvs2.clear_all
			end
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
					if yyvs1 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs1")
						end
						create yyspecial_routines1
						yyvsc1 := yyInitial_yyvs_size
						yyvs1 := yyspecial_routines1.make (yyvsc1)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs1")
						end
						yyvsc1 := yyvsc1 + yyInitial_yyvs_size
						yyvs1 := yyspecial_routines1.resize (yyvs1, yyvsc1)
					end
				end
				yyvs1.put (last_any_value, yyvsp1)
			when 2 then
				yyvsp2 := yyvsp2 + 1
				if yyvsp2 >= yyvsc2 then
					if yyvs2 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs2")
						end
						create yyspecial_routines2
						yyvsc2 := yyInitial_yyvs_size
						yyvs2 := yyspecial_routines2.make (yyvsc2)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs2")
						end
						yyvsc2 := yyvsc2 + yyInitial_yyvs_size
						yyvs2 := yyspecial_routines2.resize (yyvs2, yyvsc2)
					end
				end
				yyvs2.put (last_string_value, yyvsp2)
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
			yyval1: ANY
		do
			yyvsp1 := yyvsp1 + 1
			if yyvsp1 >= yyvsc1 then
				if yyvs1 = Void then
					debug ("GEYACC")
						std.error.put_line ("Create yyvs1")
					end
					create yyspecial_routines1
					yyvsc1 := yyInitial_yyvs_size
					yyvs1 := yyspecial_routines1.make (yyvsc1)
				else
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs1")
					end
					yyvsc1 := yyvsc1 + yyInitial_yyvs_size
					yyvs1 := yyspecial_routines1.resize (yyvs1, yyvsc1)
				end
			end
			yyvs1.put (yyval1, yyvsp1)
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

feature {NONE} -- Semantic actions

	yy_do_action (yy_act: INTEGER)
			-- Execute semantic action.
		local
			yyval1: ANY
		do
			inspect yy_act
when 1 then
--|#line 53 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 53")
end

			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 2 then
--|#line 57 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 57")
end

			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 3 then
--|#line 63 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 63")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp1 := yyvsp1 -7
	yyvs1.put (yyval1, yyvsp1)
end
when 4 then
--|#line 73 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 73")
end

			if arch_id.valid_id(yyvs2.item (yyvsp2)) then
				create archetype_id.make_from_string(yyvs2.item (yyvsp2))
			elseif arch_id.old_valid_id(yyvs2.item (yyvsp2)) then
				create archetype_id.old_make_from_string(yyvs2.item (yyvsp2))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 5 then
--|#line 81 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 81")
end

			raise_error
			report_error(create_message("SARID", Void))
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 6 then
--|#line 89 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 89")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 7 then
--|#line 90 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 90")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 8 then
--|#line 93 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 93")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 9 then
--|#line 96 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 96")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 10 then
--|#line 97 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 97")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 11 then
--|#line 100 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 100")
end

			adl_version := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 12 then
--|#line 104 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 104")
end

			is_controlled := True
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 13 then
--|#line 108 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 108")
end

			is_generated := True
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 14 then
--|#line 114 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 114")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp1 := yyvsp1 + 1
	if yyvsp1 >= yyvsc1 then
		if yyvs1 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs1")
			end
			create yyspecial_routines1
			yyvsc1 := yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.make (yyvsc1)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs1")
			end
			yyvsc1 := yyvsc1 + yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.resize (yyvs1, yyvsc1)
		end
	end
	yyvs1.put (yyval1, yyvsp1)
end
when 15 then
--|#line 115 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 115")
end

			if arch_id.valid_id(yyvs2.item (yyvsp2)) then
				create parent_archetype_id.make_from_string(yyvs2.item (yyvsp2))
			elseif arch_id.old_valid_id(yyvs2.item (yyvsp2)) then
				create parent_archetype_id.old_make_from_string(yyvs2.item (yyvsp2))
			end
			if not parent_archetype_id.semantic_id.is_equal(archetype_id.semantic_parent_id) then
				raise_error
				report_error(create_message("VASID", Void))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 16 then
--|#line 128 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 128")
end

			raise_error
			report_error(create_message("SASID", Void))
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 17 then
--|#line 136 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 136")
end

			concept := yyvs2.item (yyvsp2)
			debug("ADL_parse")
				io.put_string("concept = " + concept + "%N")
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 18 then
--|#line 143 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 143")
end

			raise_error
			report_error(create_message("SACO", Void))
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 19 then
--|#line 151 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 151")
end

			raise_error
			report_error(create_message("SALAN", Void))
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp1 := yyvsp1 + 1
	if yyvsp1 >= yyvsc1 then
		if yyvs1 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs1")
			end
			create yyspecial_routines1
			yyvsc1 := yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.make (yyvsc1)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs1")
			end
			yyvsc1 := yyvsc1 + yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.resize (yyvs1, yyvsc1)
		end
	end
	yyvs1.put (yyval1, yyvsp1)
end
when 20 then
--|#line 157 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 157")
end

			convert_dadl_language(yyvs2.item (yyvsp2))
			language_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 21 then
--|#line 162 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 162")
end

			raise_error
			report_error(create_message("SALA", Void))
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 22 then
--|#line 170 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 170")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp1 := yyvsp1 + 1
	if yyvsp1 >= yyvsc1 then
		if yyvs1 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs1")
			end
			create yyspecial_routines1
			yyvsc1 := yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.make (yyvsc1)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs1")
			end
			yyvsc1 := yyvsc1 + yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.resize (yyvs1, yyvsc1)
		end
	end
	yyvs1.put (yyval1, yyvsp1)
end
when 23 then
--|#line 171 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 171")
end

			convert_dadl_language(yyvs2.item (yyvsp2))
			description_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 24 then
--|#line 176 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 176")
end

			raise_error
			report_error(create_message("SADS", Void))
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 25 then
--|#line 185 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 185")
end

			definition_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 26 then
--|#line 189 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 189")
end

			raise_error
			report_error(create_message("SADF", Void))
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 27 then
--|#line 197 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 197")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp1 := yyvsp1 + 1
	if yyvsp1 >= yyvsc1 then
		if yyvs1 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs1")
			end
			create yyspecial_routines1
			yyvsc1 := yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.make (yyvsc1)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs1")
			end
			yyvsc1 := yyvsc1 + yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.resize (yyvs1, yyvsc1)
		end
	end
	yyvs1.put (yyval1, yyvsp1)
end
when 28 then
--|#line 198 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 198")
end

			invariant_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 29 then
--|#line 202 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 202")
end

			raise_error
			report_error(create_message("SAIV", Void))
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 30 then
--|#line 210 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 210")
end

			ontology_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 31 then
--|#line 214 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 214")
end

			raise_error
			report_error(create_message("SAON", Void))
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
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

	yy_do_error_action (yy_act: INTEGER)
			-- Execute error action.
		do
			inspect yy_act
			when 48 then
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
			   21,   22,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,   23,
			    2,   24,    2,    2,    2,    2,    2,    2,    2,    2,
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
			   15,   16,   17,   18,   19,   20, yyDummy>>)
		end

	yyr1_template: SPECIAL [INTEGER]
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,   25,   25,   26,   27,   27,   35,   35,   36,   37,
			   37,   38,   38,   38,   28,   28,   28,   29,   29,   30,
			   30,   30,   31,   31,   31,   32,   32,   33,   33,   33,
			   34,   34, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    2,    1,    1,    1,    1,    1,    2,    1,    1,
			    1,    1,    1,    1,    2,    1,    1,    1,    2,    1,
			    2,    1,    1,    1,    2,    1,    1,    1,    2,    1,
			    1,    1,    2,    1,    1,    1,    2,    1,    1,    1,
			    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER]
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    2,    2,    2,    2,    2,    2,    2,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER]
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    0,    0,    2,    1,   14,    0,    0,    5,    7,    0,
			    0,    4,   13,   12,    0,    0,    9,   15,   16,    0,
			   19,    0,    0,    8,   17,   18,    0,   22,   11,   10,
			   20,   21,    0,    0,   23,   24,    0,   27,   25,   26,
			    0,    0,   28,   29,    0,    3,   30,   31,    0,    0,
			    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			   48,    3,    4,   10,   20,   27,   33,   37,   41,   45,
			    5,    8,   15,   16, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			    0,   -1, -32768, -32768,   23,   30,    5, -32768, -32768,   14,
			   21, -32768, -32768, -32768,    9,    8, -32768, -32768, -32768,   16,
			   15,   19,    5, -32768, -32768, -32768,   13,   12, -32768, -32768,
			 -32768, -32768,    7,    3, -32768, -32768,    4,  -11, -32768, -32768,
			    1,  -12, -32768, -32768,    6, -32768, -32768, -32768,   26,   22,
			 -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768,   17, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			    7,    2,   43,   -6,   44,   39,   40,   47,   35,   42,
			    1,   38,   46,   34,   31,   18,   36,   25,   17,   30,
			    6,   24,   50,   14,   13,   12,   49,   32,   28,   26,
			   23,   22,   19,   21,   11,    9,    0,    0,    0,   29, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    4,   16,    1,   17,    1,    1,    8,
			   10,    7,    6,    6,    1,    1,   13,    1,    4,    6,
			   21,    5,    0,   18,   19,   20,    0,   15,    9,   14,
			   22,   23,   11,   24,    4,   12,   -1,   -1,   -1,   22, yyDummy>>)
		end

feature {NONE} -- Semantic value stacks

	yyvs1: SPECIAL [ANY]
			-- Stack for semantic values of type ANY

	yyvsc1: INTEGER
			-- Capacity of semantic value stack `yyvs1'

	yyvsp1: INTEGER
			-- Top of semantic value stack `yyvs1'

	yyspecial_routines1: KL_SPECIAL_ROUTINES [ANY]
			-- Routines that ought to be in SPECIAL [ANY]

	yyvs2: SPECIAL [STRING]
			-- Stack for semantic values of type STRING

	yyvsc2: INTEGER
			-- Capacity of semantic value stack `yyvs2'

	yyvsp2: INTEGER
			-- Top of semantic value stack `yyvs2'

	yyspecial_routines2: KL_SPECIAL_ROUTINES [STRING]
			-- Routines that ought to be in SPECIAL [STRING]

feature {NONE} -- Constants

	yyFinal: INTEGER = 50
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 25
			-- Number of tokens

	yyLast: INTEGER = 39
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 275
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 39
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



feature -- Initialization

	make
			-- Create a new Eiffel parser.
		do
			make_eiffel_scanner
			make_parser_skeleton
		end

	execute(in_text:STRING)
		do
			reset
			create error_text.make(0)
			set_input_buffer (new_string_buffer (in_text))
			parse
		end

feature {YY_PARSER_ACTION} -- Basic Operations

	report_error (a_message: STRING)
			-- Print error message.
		local
			f_buffer: YY_FILE_BUFFER
		do
			f_buffer ?= input_buffer
			if f_buffer /= Void then
				error_text.append (f_buffer.file.name + ", line ")
			else
				error_text.append ("line ")
			end
			error_text.append (in_lineno.out + ": " + a_message + " [last token = " + token_name(last_token) + "]%N")
		end

feature -- Parse Output

	archetype_id: ARCHETYPE_ID

	adl_version: STRING

	is_controlled: BOOLEAN

	is_generated: BOOLEAN

	parent_archetype_id: ARCHETYPE_ID

	concept: STRING

	language_text: STRING

	description_text: STRING

	definition_text: STRING

	invariant_text: STRING
	
	ontology_text: STRING

feature -- Access

	error_text: STRING

feature {NONE} -- Implementation 

	str: STRING

	arch_id: ARCHETYPE_ID
		once
			create Result
		end

end
