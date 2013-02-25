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
			make as make_scanner
		end

	ADL_SYNTAX_CONVERTER

	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

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
				yyspecial_routines1.force (yyvs1, last_any_value, yyvsp1)
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
			yyval1: ANY
			yyval2: STRING
		do
			inspect yy_act
when 1 then
--|#line 62 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 62")
end

			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 2 then
--|#line 66 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 66")
end

			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 3 then
--|#line 70 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 70")
end

			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 4 then
--|#line 74 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 74")
end

			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 5 then
--|#line 78 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 78")
end

			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 6 then
--|#line 82 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 82")
end

			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 7 then
--|#line 86 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 86")
end

			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 8 then
--|#line 92 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 92")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp1 := yyvsp1 -6
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 9 then
--|#line 101 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 101")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp1 := yyvsp1 -7
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 10 then
--|#line 111 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 111")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp1 := yyvsp1 -6
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 11 then
--|#line 120 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 120")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp1 := yyvsp1 -7
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 12 then
--|#line 130 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 130")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 13 then
--|#line 137 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 137")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp1 := yyvsp1 -7
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 14 then
--|#line 147 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 147")
end

			yyvs2.item (yyvsp2 - 1).right_adjust
			create artefact_type.make_from_type_name (yyvs2.item (yyvsp2 - 1))
			if arch_id.valid_id (yyvs2.item (yyvsp2)) then
				create archetype_id.make_from_string (yyvs2.item (yyvsp2))
			else
				abort_with_error ("SASID", Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 15 then
--|#line 157 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 157")
end

			abort_with_error ("SARID", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 16 then
--|#line 163 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 163")
end

			yyval2 := text
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp2 := yyvsp2 + 1
	yyvsp1 := yyvsp1 -1
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
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 17 then
--|#line 167 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 167")
end

			yyval2 := text
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp2 := yyvsp2 + 1
	yyvsp1 := yyvsp1 -1
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
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 18 then
--|#line 171 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 171")
end

			yyval2 := text
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp2 := yyvsp2 + 1
	yyvsp1 := yyvsp1 -1
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
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 19 then
--|#line 177 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 177")
end

			yyvs2.item (yyvsp2 - 1).right_adjust
			create artefact_type.make_from_type_name (yyvs2.item (yyvsp2 - 1))
			if arch_id.valid_id (yyvs2.item (yyvsp2)) then
				create archetype_id.make_from_string (yyvs2.item (yyvsp2))
			else
				abort_with_error ("SASID", Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 20 then
--|#line 187 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 187")
end

			abort_with_error ("SARID", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 21 then
--|#line 193 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 193")
end

			yyval2 := text
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp2 := yyvsp2 + 1
	yyvsp1 := yyvsp1 -1
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
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 22 then
--|#line 199 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 199")
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
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 23 then
--|#line 200 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 200")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 24 then
--|#line 203 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 203")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 25 then
--|#line 204 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 204")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 26 then
--|#line 207 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 207")
end

			adl_version := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 27 then
--|#line 211 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 211")
end

			uid := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 28 then
--|#line 215 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 215")
end

			is_controlled := True
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 29 then
--|#line 219 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 219")
end

			is_generated := True
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 30 then
--|#line 223 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 223")
end

			other_metadata.put (yyvs2.item (yyvsp2), yyvs2.item (yyvsp2 - 1))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 31 then
--|#line 227 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 227")
end

			other_metadata.put (yyvs2.item (yyvsp2), yyvs2.item (yyvsp2 - 1))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 32 then
--|#line 231 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 231")
end

			other_metadata.put ("true", yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp2 := yyvsp2 -1
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
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 33 then
--|#line 235 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 235")
end

			other_metadata.put ("true", yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp2 := yyvsp2 -1
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
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 34 then
--|#line 241 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 241")
end

			if arch_id.valid_id (yyvs2.item (yyvsp2)) then
				create parent_archetype_id.make_from_string (yyvs2.item (yyvsp2))
			else
				abort_with_error ("SASID", Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 35 then
--|#line 249 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 249")
end

			abort_with_error ("SASID", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 36 then
--|#line 255 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 255")
end

			concept := yyvs2.item (yyvsp2)
			debug("ADL_parse")
				io.put_string("concept = " + concept + "%N")
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 37 then
--|#line 262 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 262")
end

			abort_with_error ("SACO", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 38 then
--|#line 268 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 268")
end

			convert_dadl_language(yyvs2.item (yyvsp2))
			language_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 39 then
--|#line 273 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 273")
end

			abort_with_error ("SALA", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 40 then
--|#line 279 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 279")
end

			convert_dadl_language(yyvs2.item (yyvsp2))
			description_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 41 then
--|#line 284 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 284")
end

			abort_with_error ("SADS", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 42 then
--|#line 291 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 291")
end

			definition_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 43 then
--|#line 295 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 295")
end

			abort_with_error ("SADF", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 44 then
--|#line 301 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 301")
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
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 45 then
--|#line 302 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 302")
end

			invariant_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 46 then
--|#line 306 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 306")
end

			abort_with_error ("SAIV", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 47 then
--|#line 312 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 312")
end

			ontology_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 48 then
--|#line 316 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 316")
end

			abort_with_error ("SAON", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 49 then
--|#line 322 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 322")
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
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 50 then
--|#line 323 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 323")
end

			annotations_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 51 then
--|#line 327 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 327")
end

			abort_with_error ("SAAS", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 52 then
--|#line 333 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 333")
end

			component_ontologies_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 53 then
--|#line 337 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 337")
end

			abort_with_error ("SAAS", Void)
		
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
			    0,   34,   34,   34,   34,   34,   34,   34,   39,   40,
			   35,   36,   37,   38,   41,   41,   32,   32,   32,   50,
			   50,   33,   52,   52,   53,   53,   54,   54,   54,   54,
			   54,   54,   54,   54,   48,   48,   42,   42,   43,   43,
			   44,   44,   45,   45,   46,   46,   46,   47,   47,   49,
			   49,   49,   51,   51, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    2,    2,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    2,    1,    1,    2,    2,    2,    1,
			    2,    1,    2,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    2,    1,    1,    1,
			    1,    1,    1,    1,    2,    2,    2,    2,    1,    1,
			    2,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    2,    1,    1,    1,    1,    2,    1,    1,    1,    1,
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
			    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER]
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    0,   21,   18,   17,   16,    7,    0,    0,    1,    2,
			    3,    4,    5,    6,    0,    0,    0,   15,    0,   20,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   29,
			   28,    0,   33,   32,    0,   24,   14,   19,   38,   39,
			   34,   35,   36,   37,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,   23,    0,   40,   41,    0,   44,
			    0,    0,    0,   44,   27,   26,   31,   30,   25,   44,
			   42,   43,    0,    0,    0,   44,    0,   12,    0,    0,
			   45,   46,   49,   44,    0,   47,   48,   49,    8,    0,
			   10,    0,   49,    0,   50,   51,    9,   11,    0,   13,

			   52,   53,    0,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			    6,    7,  102,    8,    9,   10,   11,   12,   13,   14,
			   24,   25,   46,   59,   73,   77,   26,   90,   15,   99,
			   18,   34,   35, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			   44, -32768, -32768, -32768, -32768, -32768,    2,    0, -32768, -32768,
			 -32768, -32768, -32768, -32768,   35,   61,   15, -32768,   80, -32768,
			   77,   59,   68,   65,   61,   55,   53,   55,   54, -32768,
			 -32768,   52, -32768,   51,   45, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768,   55,   58,   60,   61,    6,   60,
			   70,   69,    5,   15, -32768,   60, -32768, -32768,   13,   50,
			   55,   60,   41,   50, -32768, -32768, -32768, -32768, -32768,   50,
			 -32768, -32768,    4,   41,   60,   50,   46, -32768,   41,   41,
			 -32768, -32768,   25,   50,   41, -32768, -32768,   25, -32768,   30,
			 -32768,   41,   25,   17, -32768, -32768, -32768, -32768,   18, -32768,

			 -32768, -32768,   29,    7, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			   63,  -13,  -27,  -39,  -37,  -30, -32768,  -25, -32768, -32768,
			   81, -32768,   33, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   49,   19,   27,   17,  -22,   81,  -22,  104,   67,   62,
			   63,   44,   80,   48,   71,   66,   69,   55,   33,  101,
			   70,   61,   75,   58,  100,   32,   78,   45,   16,  103,
			   16,   95,   79,   74,   60,   83,   94,   98,   84,   31,
			   30,   29,   28,   82,   89,    5,   91,   86,   87,   88,
			   23,   22,   85,   21,   92,    4,    3,    2,    1,   57,
			   39,   96,   93,   76,   56,   38,   43,   97,   23,   41,
			   42,   21,   40,   72,   54,   53,   45,   58,   65,   21,
			   64,   37,   52,   51,   36,   50,   68,    0,   20,   47, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			   27,    1,   15,    1,    4,    1,    4,    0,    3,   48,
			   49,   24,    8,   26,    1,   10,   55,   44,    3,    1,
			    7,   48,   61,   17,    6,   10,   63,   21,   28,    0,
			   28,    1,   69,   60,   47,   74,    6,   20,   75,   24,
			   25,   26,   27,   73,   19,    1,   83,    1,   78,   79,
			   15,   16,    6,   18,   84,   11,   12,   13,   14,    1,
			    1,   91,   87,   22,    6,    6,    1,   92,   15,    1,
			    5,   18,    4,   23,   29,   30,   21,   17,    9,   18,
			   10,    4,   31,   31,    4,   31,   53,   -1,    7,   26, yyDummy>>)
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

	yyFinal: INTEGER = 104
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 32
			-- Number of tokens

	yyLast: INTEGER = 89
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 282
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 55
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
		end

	execute (in_text:STRING)
		do
			reset
			set_input_buffer (new_string_buffer (in_text))
			parse
		end

feature {YY_PARSER_ACTION} -- Basic Operations

	report_error (a_message: STRING)
			-- Print error message.
		do
			add_error_with_location ("general_error", <<a_message>>, error_loc)
		end

	abort_with_error (err_code: STRING; args: ARRAY [STRING])
		do
			add_error_with_location (err_code, args, error_loc)
			abort
		end

	error_loc: attached STRING
		do
			create Result.make_empty
			if attached {YY_FILE_BUFFER} input_buffer as f_buffer then
				Result.append (f_buffer.file.name + ", ")
			end
			Result.append ("line " + (in_lineno + source_start_line).out)
			Result.append(" [last ADL token = " + token_name(last_token) + "]")
		end

	source_start_line: INTEGER
			-- offset of source in other document, else 0

feature -- Parse Output

	archetype_id: ARCHETYPE_ID

	other_metadata: HASH_TABLE [STRING, STRING]

	adl_version: STRING

	uid: STRING

	is_controlled: BOOLEAN

	is_generated: BOOLEAN

	artefact_type: ARTEFACT_TYPE

	parent_archetype_id: ARCHETYPE_ID

	concept: STRING

	language_text: STRING

	description_text: STRING

	definition_text: STRING

	invariant_text: STRING
	
	ontology_text: STRING

	annotations_text: STRING

	component_ontologies_text: STRING

feature {NONE} -- Implementation 

	str: STRING

	arch_id: ARCHETYPE_ID
		once
			create Result
		end

end
