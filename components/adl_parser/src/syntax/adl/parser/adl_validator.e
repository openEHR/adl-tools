indexing
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

	KL_SHARED_EXCEPTIONS
	KL_SHARED_ARGUMENTS

creation

	make


feature {NONE} -- Implementation

	yy_build_parser_tables is
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

	yy_create_value_stacks is
			-- Create value stacks.
		do
		end

	yy_init_value_stacks is
			-- Initialize value stacks.
		do
			yyvsp1 := -1
			yyvsp2 := -1
		end

	yy_clear_value_stacks is
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

	yy_push_last_value (yychar1: INTEGER) is
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

	yy_push_error_value is
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

	yy_pop_last_value (yystate: INTEGER) is
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

	yy_do_action (yy_act: INTEGER) is
			-- Execute semantic action.
		local
			yyval1: ANY
		do
			inspect yy_act
when 1 then
--|#line 52 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 52")
end

			accept
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 2 then
--|#line 56 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 56")
end

			abort
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 3 then
--|#line 62 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 62")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 7
	yyvsp1 := yyvsp1 -6
	yyvs1.put (yyval1, yyvsp1)
end
when 4 then
--|#line 71 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 71")
end

			create archetype_id.make_from_string(yyvs2.item (yyvsp2)) -- FIXME - should be other make routine
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 5 then
--|#line 75 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 75")
end

			raise_error
			report_error("In 'archetype' clause; expecting archetype id (model_issuer-ref_model-model_class.concept.version)")
			abort
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 6 then
--|#line 83 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 83")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 7 then
--|#line 84 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 84")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 8 then
--|#line 87 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 87")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 9 then
--|#line 90 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 90")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 10 then
--|#line 91 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 91")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 11 then
--|#line 94 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 94")
end

			adl_version := yyvs2.item (yyvsp2)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 12 then
--|#line 98 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 98")
end

			is_controlled := True
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 13 then
--|#line 104 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 104")
end


if yy_parsing_status = yyContinue then
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
when 14 then
--|#line 105 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 105")
end

			create parent_archetype_id.make_from_string(yyvs2.item (yyvsp2)) -- FIXME - should be other make routine
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 15 then
--|#line 109 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 109")
end

			raise_error
			report_error("In 'specialise' clause; expecting parent archetype id (model_issuer-ref_model-model_class.concept.version)")
			abort
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 16 then
--|#line 117 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 117")
end

			concept := yyvs2.item (yyvsp2)
			debug("ADL_parse")
				io.put_string("concept = " + concept + "%N")
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 17 then
--|#line 124 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 124")
end

			raise_error
			report_error("In 'concept' clause; expecting TERM_CODE reference")
			abort
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 18 then
--|#line 132 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 132")
end

		
if yy_parsing_status = yyContinue then
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
when 19 then
--|#line 135 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 135")
end

			description_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 20 then
--|#line 139 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 139")
end

			raise_error
			report_error("Error in description section")
			abort
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 21 then
--|#line 148 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 148")
end

			definition_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 22 then
--|#line 152 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 152")
end

			raise_error
			report_error("Error in definition section")
			abort
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 23 then
--|#line 160 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 160")
end


if yy_parsing_status = yyContinue then
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
when 24 then
--|#line 161 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 161")
end

			invariant_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 25 then
--|#line 165 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 165")
end

			raise_error
			report_error("Error in invariant section")
			abort
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 26 then
--|#line 173 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 173")
end

			ontology_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 27 then
--|#line 177 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 177")
end

			raise_error
			report_error("Error in ontology section")
			abort
		
if yy_parsing_status = yyContinue then
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

	yy_do_error_action (yy_act: INTEGER) is
			-- Execute error action.
		do
			inspect yy_act
			when 43 then
					-- End-of-file expected action.
				report_eof_expected_error
			else
					-- Default action.
				report_error ("parse error")
			end
		end

feature {NONE} -- Table templates

	yytranslate_template: SPECIAL [INTEGER] is
		once
			Result := yyfixed_array (<<
			    0,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			   19,   20,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,   21,
			    2,   22,    2,    2,    2,    2,    2,    2,    2,    2,
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
			   15,   16,   17,   18, yyDummy>>)
		end

	yyr1_template: SPECIAL [INTEGER] is
		once
			Result := yyfixed_array (<<
			    0,   23,   23,   24,   25,   25,   32,   32,   33,   34,
			   34,   35,   35,   26,   26,   26,   27,   27,   28,   28,
			   28,   29,   29,   30,   30,   30,   31,   31, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER] is
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    2,    1,    1,    1,    1,    2,    1,    1,    1,
			    1,    1,    1,    2,    1,    1,    1,    2,    1,    2,
			    1,    1,    1,    2,    1,    1,    1,    2,    1,    1,
			    1,    2,    1,    1,    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER] is
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    2,    2,    2,    2,    2,    2,    2,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER] is
		once
			Result := yyfixed_array (<<
			    0,    0,    2,    1,   13,    0,    0,    5,    7,    0,
			    0,    4,   12,    0,    0,    9,   14,   15,    0,   18,
			    0,    0,    8,   16,   17,    0,    0,   11,   10,   19,
			   20,    0,   23,   21,   22,    0,    0,   24,   25,    0,
			    3,   26,   27,    0,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER] is
		once
			Result := yyfixed_array (<<
			   43,    3,    4,   10,   19,   26,   32,   36,   40,    5,
			    8,   14,   15, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER] is
		once
			Result := yyfixed_array (<<
			    0,   -1, -32768, -32768,   20,   27,    3, -32768, -32768,   13,
			   19, -32768, -32768,    5,    2, -32768, -32768, -32768,   14,   15,
			   17,    3, -32768, -32768, -32768,    7,   12, -32768, -32768, -32768,
			 -32768,    4,  -10, -32768, -32768,    1,  -11, -32768, -32768,    6,
			 -32768, -32768, -32768,   24,   16, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER] is
		once
			Result := yyfixed_array (<<
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768,   18, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER] is
		once
			Result := yyfixed_array (<<
			    7,    2,   38,   -6,   39,   34,   35,   42,   30,   37,
			    1,   33,   41,   29,   17,   24,   45,   16,    6,   23,
			   13,   12,   22,   21,   44,   31,   27,   20,    0,   25,
			   18,   11,    9,    0,    0,    0,    0,    0,    0,   28, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER] is
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    4,   15,    1,   16,    1,    1,    8,
			   10,    7,    6,    6,    1,    1,    0,    4,   19,    5,
			   17,   18,   20,   21,    0,   13,    9,   22,   -1,   14,
			   11,    4,   12,   -1,   -1,   -1,   -1,   -1,   -1,   21, yyDummy>>)
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

	yyFinal: INTEGER is 45
			-- Termination state id

	yyFlag: INTEGER is -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER is 23
			-- Number of tokens

	yyLast: INTEGER is 39
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER is 273
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER is 36
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



feature -- Initialization

	make is
			-- Create a new Eiffel parser.
		do
			make_eiffel_scanner
			make_parser_skeleton
		end

	execute(in_text:STRING) is
		do
			reset
			create error_text.make(0)
			set_input_buffer (new_string_buffer (in_text))
			parse
		end

feature {YY_PARSER_ACTION} -- Basic Operations

	report_error (a_message: STRING) is
			-- Print error message.
		local
			f_buffer: YY_FILE_BUFFER
		do
			f_buffer ?= input_buffer
			if f_buffer /= Void then
				error_text.append (f_buffer.file.name)
				error_text.append (", line ")
			else
				error_text.append ("line ")
			end
			error_text.append_integer (in_lineno)
			error_text.append (": ")
			error_text.append (a_message)
			error_text.append (" [last token = " + token_name(last_token) + "]")
			error_text.append_character ('%N')
		end

feature -- Parse Output

	archetype_id: ARCHETYPE_ID

	adl_version: STRING

	is_controlled: BOOLEAN

	parent_archetype_id: ARCHETYPE_ID

	concept: STRING

	description_text: STRING

	definition_text: STRING

	invariant_text: STRING
	
	ontology_text: STRING

feature -- Access

	error_text: STRING

feature {NONE} -- Implementation 

	str: STRING

end
