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
		local
			l_yyvs1_default_item: ANY
			l_yyvs2_default_item: STRING
		do
			if yyvs1 /= Void then
				yyvs1.fill_with (l_yyvs1_default_item, 0, yyvs1.upper)
			end
			if yyvs2 /= Void then
				yyvs2.fill_with (l_yyvs2_default_item, 0, yyvs2.upper)
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

			is_template := True
			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 3 then
--|#line 62 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 62")
end

			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 4 then
--|#line 68 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 68")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp1 := yyvsp1 -7
	yyvs1.put (yyval1, yyvsp1)
end
when 5 then
--|#line 78 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 78")
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
when 6 then
--|#line 86 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 86")
end

			raise_error
			report_error(create_message("SARID", Void))
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 7 then
--|#line 94 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 94")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 8 then
--|#line 95 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 95")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 9 then
--|#line 98 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 98")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp1 := yyvsp1 -7
	yyvs1.put (yyval1, yyvsp1)
end
when 10 then
--|#line 108 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 108")
end

			if arch_id.valid_id(yyvs2.item (yyvsp2)) then
				create archetype_id.make_from_string(yyvs2.item (yyvsp2))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 11 then
--|#line 114 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 114")
end

			raise_error
			report_error(create_message("SARID", Void))
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 12 then
--|#line 122 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 122")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 13 then
--|#line 123 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 123")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 14 then
--|#line 126 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 126")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 15 then
--|#line 129 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 129")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 16 then
--|#line 130 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 130")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 17 then
--|#line 133 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 133")
end

			adl_version := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 18 then
--|#line 137 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 137")
end

			is_controlled := True
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 19 then
--|#line 141 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 141")
end

			is_generated := True
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 20 then
--|#line 147 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 147")
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
when 21 then
--|#line 148 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 148")
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
when 22 then
--|#line 161 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 161")
end

			raise_error
			report_error(create_message("SASID", Void))
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 23 then
--|#line 169 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 169")
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
when 24 then
--|#line 176 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 176")
end

			raise_error
			report_error(create_message("SACO", Void))
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 25 then
--|#line 184 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 184")
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
when 26 then
--|#line 190 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 190")
end

			convert_dadl_language(yyvs2.item (yyvsp2))
			language_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 27 then
--|#line 195 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 195")
end

			raise_error
			report_error(create_message("SALA", Void))
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 28 then
--|#line 203 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 203")
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
when 29 then
--|#line 204 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 204")
end

			convert_dadl_language(yyvs2.item (yyvsp2))
			description_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 30 then
--|#line 209 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 209")
end

			raise_error
			report_error(create_message("SADS", Void))
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 31 then
--|#line 218 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 218")
end

			definition_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 32 then
--|#line 222 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 222")
end

			raise_error
			report_error(create_message("SADF", Void))
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 33 then
--|#line 230 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 230")
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
when 34 then
--|#line 231 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 231")
end

			invariant_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 35 then
--|#line 235 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 235")
end

			raise_error
			report_error(create_message("SAIV", Void))
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 36 then
--|#line 243 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 243")
end

			ontology_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 37 then
--|#line 247 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 247")
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

	yy_do_error_action (yy_act: INTEGER) is
			-- Execute error action.
		do
			inspect yy_act
			when 62 then
					-- End-of-file expected action.
				report_eof_expected_error
			else
					-- Default action.
				report_error ("parse error")
			end
		end

feature {NONE} -- Table templates

	yytranslate_template: SPECIAL [INTEGER] is
			-- Template for `yytranslate'
		once
			Result := yyfixed_array (<<
			    0,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			   22,   23,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,   24,
			    2,   25,    2,    2,    2,    2,    2,    2,    2,    2,
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
			   15,   16,   17,   18,   19,   20,   21, yyDummy>>)
		end

	yyr1_template: SPECIAL [INTEGER] is
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,   26,   26,   26,   27,   29,   29,   37,   37,   28,
			   39,   39,   40,   40,   38,   41,   41,   42,   42,   42,
			   30,   30,   30,   31,   31,   32,   32,   32,   33,   33,
			   33,   34,   34,   35,   35,   35,   36,   36, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER] is
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    2,    1,    2,
			    1,    1,    1,    1,    1,    2,    1,    1,    1,    1,
			    1,    1,    1,    2,    1,    1,    1,    1,    2,    1,
			    2,    1,    1,    1,    1,    2,    1,    1,    1,    1,
			    2,    1,    1,    1,    1,    2,    1,    1,    1,    1,
			    2,    1,    1,    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER] is
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    2,    2,    2,    2,    2,    2,    2,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER] is
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    0,    0,    0,    3,    1,    2,   20,    0,   20,    0,
			    0,   11,   13,    6,    8,    0,    0,    5,    0,   10,
			   19,   18,    0,    0,   15,   21,   22,    0,   25,   25,
			    0,    0,   14,   23,   24,    0,   28,   28,   17,   16,
			   26,   27,    0,    0,    0,   29,   30,    0,   33,   33,
			   31,   32,    0,    0,    0,   34,   35,    0,    4,    9,
			   36,   37,    0,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER] is
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			   62,    4,    5,    6,   16,   28,   36,   43,   48,   53,
			   58,    7,   12,    8,    9,   23,   24, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER] is
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			    1,    0,   -1, -32768, -32768, -32768,   26,   36,   26,   34,
			    6, -32768, -32768, -32768, -32768,   15,   25, -32768,   25, -32768,
			 -32768, -32768,   11,    8, -32768, -32768, -32768,   23,   20,   20,
			   24,    6, -32768, -32768, -32768,   17,   18,   18, -32768, -32768,
			 -32768, -32768,   14,    3,    3, -32768, -32768,    7,   12,   12,
			 -32768, -32768,    5,  -10,  -10, -32768, -32768,    4, -32768, -32768,
			 -32768, -32768,   29,    9, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER] is
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -32768, -32768, -32768, -32768,   39,   30,   16,   13,    2,   -5,
			  -11, -32768,   40, -32768, -32768, -32768,   10, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER] is
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   13,   11,    3,   -7,  -12,   61,   56,   57,   51,   64,
			   60,    2,    1,   55,   50,   46,   26,   47,   41,   25,
			   45,   10,   10,   40,   34,   22,   21,   20,   33,   63,
			   52,   32,   31,   38,   42,   35,   30,   27,   19,   15,
			   17,   39,   14,   59,   54,   37,   49,   18,   29,    0,
			   44, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER] is
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    4,    4,    1,    1,   17,    1,    0,
			    6,   10,   11,    8,    7,    1,    1,   14,    1,    4,
			    6,   22,   22,    6,    1,   19,   20,   21,    5,    0,
			   18,   23,   24,    9,   16,   15,   25,   12,    4,   13,
			    4,   31,    2,   54,   49,   29,   44,    8,   18,   -1,
			   37, yyDummy>>)
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

	yyFinal: INTEGER is 64
			-- Termination state id

	yyFlag: INTEGER is -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER is 26
			-- Number of tokens

	yyLast: INTEGER is 50
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER is 276
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER is 43
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

	execute (in_text: STRING)
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

	is_template: BOOLEAN

feature -- Access

	error_text: STRING

feature {NONE} -- Implementation 

	str: STRING

	arch_id: ARCHETYPE_ID
		once
			create Result
		end

end
