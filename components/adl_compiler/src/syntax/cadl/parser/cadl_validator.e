note
	component:   "openEHR Archetype Project"
	description: "Validating parser for Archetype Description Language (ADL)"
	keywords:	 "ADL"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2003-2009 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class CADL_VALIDATOR

inherit
	YY_PARSER_SKELETON
		rename
			make as make_parser_skeleton
		redefine
			report_error
		end

	CADL_SCANNER
		rename
			make as make_scanner
		end

	C_COMMON

	ARCHETYPE_TERM_CODE_TOOLS
		export
			{NONE} all
		end

	OPERATOR_TYPES
		export
			{NONE} all
		end

	SHARED_APP_RESOURCES
		export
			{NONE} all
		end

	SHARED_C_FACTORY
		export
			{NONE} all
		end

	DATE_TIME_ROUTINES
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
			yyvsp3 := -1
			yyvsp4 := -1
			yyvsp5 := -1
			yyvsp6 := -1
			yyvsp7 := -1
			yyvsp8 := -1
			yyvsp9 := -1
			yyvsp10 := -1
			yyvsp11 := -1
			yyvsp12 := -1
			yyvsp13 := -1
			yyvsp14 := -1
			yyvsp15 := -1
			yyvsp16 := -1
			yyvsp17 := -1
			yyvsp18 := -1
			yyvsp19 := -1
			yyvsp20 := -1
			yyvsp21 := -1
			yyvsp22 := -1
			yyvsp23 := -1
			yyvsp24 := -1
			yyvsp25 := -1
			yyvsp26 := -1
			yyvsp27 := -1
			yyvsp28 := -1
			yyvsp29 := -1
			yyvsp30 := -1
			yyvsp31 := -1
			yyvsp32 := -1
			yyvsp33 := -1
			yyvsp34 := -1
			yyvsp35 := -1
			yyvsp36 := -1
			yyvsp37 := -1
			yyvsp38 := -1
			yyvsp39 := -1
			yyvsp40 := -1
			yyvsp41 := -1
			yyvsp42 := -1
			yyvsp43 := -1
			yyvsp44 := -1
		end

	yy_clear_value_stacks
			-- Clear objects in semantic value stacks so that
			-- they can be collected by the garbage collector.
		local
			l_yyvs1_default_item: ANY
			l_yyvs2_default_item: STRING
			l_yyvs3_default_item: INTEGER
			l_yyvs4_default_item: REAL
			l_yyvs5_default_item: CHARACTER
			l_yyvs6_default_item: C_DOMAIN_TYPE
			l_yyvs7_default_item: ASSERTION
			l_yyvs8_default_item: ARRAYED_LIST [ASSERTION]
			l_yyvs9_default_item: C_ARCHETYPE_ROOT
			l_yyvs10_default_item: ARCHETYPE_INTERNAL_REF
			l_yyvs11_default_item: SIBLING_ORDER
			l_yyvs12_default_item: OG_PATH
			l_yyvs13_default_item: MULTIPLICITY_INTERVAL
			l_yyvs14_default_item: C_PRIMITIVE_OBJECT
			l_yyvs15_default_item: C_PRIMITIVE
			l_yyvs16_default_item: EXPR_ITEM
			l_yyvs17_default_item: CARDINALITY
			l_yyvs18_default_item: C_DATE
			l_yyvs19_default_item: BOOLEAN
			l_yyvs20_default_item: ISO8601_DATE
			l_yyvs21_default_item: ISO8601_DATE_TIME
			l_yyvs22_default_item: ISO8601_TIME
			l_yyvs23_default_item: ISO8601_DURATION
			l_yyvs24_default_item: CODE_PHRASE
			l_yyvs25_default_item: URI
			l_yyvs26_default_item: OG_PATH_ITEM
			l_yyvs27_default_item: ARRAYED_LIST [STRING]
			l_yyvs28_default_item: ARRAYED_LIST [INTEGER]
			l_yyvs29_default_item: ARRAYED_LIST [REAL]
			l_yyvs30_default_item: CHARACTER_REF
			l_yyvs31_default_item: ARRAYED_LIST [CHARACTER_REF]
			l_yyvs32_default_item: BOOLEAN_REF
			l_yyvs33_default_item: ARRAYED_LIST [BOOLEAN_REF]
			l_yyvs34_default_item: ARRAYED_LIST [ISO8601_DATE]
			l_yyvs35_default_item: ARRAYED_LIST [ISO8601_TIME]
			l_yyvs36_default_item: ARRAYED_LIST [ISO8601_DATE_TIME]
			l_yyvs37_default_item: ARRAYED_LIST [ISO8601_DURATION]
			l_yyvs38_default_item: ARRAYED_LIST [CODE_PHRASE]
			l_yyvs39_default_item: INTERVAL [INTEGER]
			l_yyvs40_default_item: INTERVAL [REAL]
			l_yyvs41_default_item: INTERVAL [ISO8601_TIME]
			l_yyvs42_default_item: INTERVAL [ISO8601_DATE]
			l_yyvs43_default_item: INTERVAL [ISO8601_DATE_TIME]
			l_yyvs44_default_item: INTERVAL [ISO8601_DURATION]
		do
			if yyvs1 /= Void then
				yyvs1.fill_with (l_yyvs1_default_item, 0, yyvs1.upper)
			end
			if yyvs2 /= Void then
				yyvs2.fill_with (l_yyvs2_default_item, 0, yyvs2.upper)
			end
			if yyvs3 /= Void then
				yyvs3.fill_with (l_yyvs3_default_item, 0, yyvs3.upper)
			end
			if yyvs4 /= Void then
				yyvs4.fill_with (l_yyvs4_default_item, 0, yyvs4.upper)
			end
			if yyvs5 /= Void then
				yyvs5.fill_with (l_yyvs5_default_item, 0, yyvs5.upper)
			end
			if yyvs6 /= Void then
				yyvs6.fill_with (l_yyvs6_default_item, 0, yyvs6.upper)
			end
			if yyvs7 /= Void then
				yyvs7.fill_with (l_yyvs7_default_item, 0, yyvs7.upper)
			end
			if yyvs8 /= Void then
				yyvs8.fill_with (l_yyvs8_default_item, 0, yyvs8.upper)
			end
			if yyvs9 /= Void then
				yyvs9.fill_with (l_yyvs9_default_item, 0, yyvs9.upper)
			end
			if yyvs10 /= Void then
				yyvs10.fill_with (l_yyvs10_default_item, 0, yyvs10.upper)
			end
			if yyvs11 /= Void then
				yyvs11.fill_with (l_yyvs11_default_item, 0, yyvs11.upper)
			end
			if yyvs12 /= Void then
				yyvs12.fill_with (l_yyvs12_default_item, 0, yyvs12.upper)
			end
			if yyvs13 /= Void then
				yyvs13.fill_with (l_yyvs13_default_item, 0, yyvs13.upper)
			end
			if yyvs14 /= Void then
				yyvs14.fill_with (l_yyvs14_default_item, 0, yyvs14.upper)
			end
			if yyvs15 /= Void then
				yyvs15.fill_with (l_yyvs15_default_item, 0, yyvs15.upper)
			end
			if yyvs16 /= Void then
				yyvs16.fill_with (l_yyvs16_default_item, 0, yyvs16.upper)
			end
			if yyvs17 /= Void then
				yyvs17.fill_with (l_yyvs17_default_item, 0, yyvs17.upper)
			end
			if yyvs18 /= Void then
				yyvs18.fill_with (l_yyvs18_default_item, 0, yyvs18.upper)
			end
			if yyvs19 /= Void then
				yyvs19.fill_with (l_yyvs19_default_item, 0, yyvs19.upper)
			end
			if yyvs20 /= Void then
				yyvs20.fill_with (l_yyvs20_default_item, 0, yyvs20.upper)
			end
			if yyvs21 /= Void then
				yyvs21.fill_with (l_yyvs21_default_item, 0, yyvs21.upper)
			end
			if yyvs22 /= Void then
				yyvs22.fill_with (l_yyvs22_default_item, 0, yyvs22.upper)
			end
			if yyvs23 /= Void then
				yyvs23.fill_with (l_yyvs23_default_item, 0, yyvs23.upper)
			end
			if yyvs24 /= Void then
				yyvs24.fill_with (l_yyvs24_default_item, 0, yyvs24.upper)
			end
			if yyvs25 /= Void then
				yyvs25.fill_with (l_yyvs25_default_item, 0, yyvs25.upper)
			end
			if yyvs26 /= Void then
				yyvs26.fill_with (l_yyvs26_default_item, 0, yyvs26.upper)
			end
			if yyvs27 /= Void then
				yyvs27.fill_with (l_yyvs27_default_item, 0, yyvs27.upper)
			end
			if yyvs28 /= Void then
				yyvs28.fill_with (l_yyvs28_default_item, 0, yyvs28.upper)
			end
			if yyvs29 /= Void then
				yyvs29.fill_with (l_yyvs29_default_item, 0, yyvs29.upper)
			end
			if yyvs30 /= Void then
				yyvs30.fill_with (l_yyvs30_default_item, 0, yyvs30.upper)
			end
			if yyvs31 /= Void then
				yyvs31.fill_with (l_yyvs31_default_item, 0, yyvs31.upper)
			end
			if yyvs32 /= Void then
				yyvs32.fill_with (l_yyvs32_default_item, 0, yyvs32.upper)
			end
			if yyvs33 /= Void then
				yyvs33.fill_with (l_yyvs33_default_item, 0, yyvs33.upper)
			end
			if yyvs34 /= Void then
				yyvs34.fill_with (l_yyvs34_default_item, 0, yyvs34.upper)
			end
			if yyvs35 /= Void then
				yyvs35.fill_with (l_yyvs35_default_item, 0, yyvs35.upper)
			end
			if yyvs36 /= Void then
				yyvs36.fill_with (l_yyvs36_default_item, 0, yyvs36.upper)
			end
			if yyvs37 /= Void then
				yyvs37.fill_with (l_yyvs37_default_item, 0, yyvs37.upper)
			end
			if yyvs38 /= Void then
				yyvs38.fill_with (l_yyvs38_default_item, 0, yyvs38.upper)
			end
			if yyvs39 /= Void then
				yyvs39.fill_with (l_yyvs39_default_item, 0, yyvs39.upper)
			end
			if yyvs40 /= Void then
				yyvs40.fill_with (l_yyvs40_default_item, 0, yyvs40.upper)
			end
			if yyvs41 /= Void then
				yyvs41.fill_with (l_yyvs41_default_item, 0, yyvs41.upper)
			end
			if yyvs42 /= Void then
				yyvs42.fill_with (l_yyvs42_default_item, 0, yyvs42.upper)
			end
			if yyvs43 /= Void then
				yyvs43.fill_with (l_yyvs43_default_item, 0, yyvs43.upper)
			end
			if yyvs44 /= Void then
				yyvs44.fill_with (l_yyvs44_default_item, 0, yyvs44.upper)
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
			when 3 then
				yyvsp3 := yyvsp3 + 1
				if yyvsp3 >= yyvsc3 then
					if yyvs3 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs3")
						end
						create yyspecial_routines3
						yyvsc3 := yyInitial_yyvs_size
						yyvs3 := yyspecial_routines3.make (yyvsc3)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs3")
						end
						yyvsc3 := yyvsc3 + yyInitial_yyvs_size
						yyvs3 := yyspecial_routines3.resize (yyvs3, yyvsc3)
					end
				end
				yyvs3.put (last_integer_value, yyvsp3)
			when 4 then
				yyvsp4 := yyvsp4 + 1
				if yyvsp4 >= yyvsc4 then
					if yyvs4 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs4")
						end
						create yyspecial_routines4
						yyvsc4 := yyInitial_yyvs_size
						yyvs4 := yyspecial_routines4.make (yyvsc4)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs4")
						end
						yyvsc4 := yyvsc4 + yyInitial_yyvs_size
						yyvs4 := yyspecial_routines4.resize (yyvs4, yyvsc4)
					end
				end
				yyvs4.put (last_real_value, yyvsp4)
			when 5 then
				yyvsp5 := yyvsp5 + 1
				if yyvsp5 >= yyvsc5 then
					if yyvs5 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs5")
						end
						create yyspecial_routines5
						yyvsc5 := yyInitial_yyvs_size
						yyvs5 := yyspecial_routines5.make (yyvsc5)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs5")
						end
						yyvsc5 := yyvsc5 + yyInitial_yyvs_size
						yyvs5 := yyspecial_routines5.resize (yyvs5, yyvsc5)
					end
				end
				yyvs5.put (last_character_value, yyvsp5)
			when 6 then
				yyvsp6 := yyvsp6 + 1
				if yyvsp6 >= yyvsc6 then
					if yyvs6 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs6")
						end
						create yyspecial_routines6
						yyvsc6 := yyInitial_yyvs_size
						yyvs6 := yyspecial_routines6.make (yyvsc6)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs6")
						end
						yyvsc6 := yyvsc6 + yyInitial_yyvs_size
						yyvs6 := yyspecial_routines6.resize (yyvs6, yyvsc6)
					end
				end
				yyvs6.put (last_c_domain_type_value, yyvsp6)
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
			when 3 then
				yyvsp3 := yyvsp3 - 1
			when 4 then
				yyvsp4 := yyvsp4 - 1
			when 5 then
				yyvsp5 := yyvsp5 - 1
			when 6 then
				yyvsp6 := yyvsp6 - 1
			when 7 then
				yyvsp7 := yyvsp7 - 1
			when 8 then
				yyvsp8 := yyvsp8 - 1
			when 9 then
				yyvsp9 := yyvsp9 - 1
			when 10 then
				yyvsp10 := yyvsp10 - 1
			when 11 then
				yyvsp11 := yyvsp11 - 1
			when 12 then
				yyvsp12 := yyvsp12 - 1
			when 13 then
				yyvsp13 := yyvsp13 - 1
			when 14 then
				yyvsp14 := yyvsp14 - 1
			when 15 then
				yyvsp15 := yyvsp15 - 1
			when 16 then
				yyvsp16 := yyvsp16 - 1
			when 17 then
				yyvsp17 := yyvsp17 - 1
			when 18 then
				yyvsp18 := yyvsp18 - 1
			when 19 then
				yyvsp19 := yyvsp19 - 1
			when 20 then
				yyvsp20 := yyvsp20 - 1
			when 21 then
				yyvsp21 := yyvsp21 - 1
			when 22 then
				yyvsp22 := yyvsp22 - 1
			when 23 then
				yyvsp23 := yyvsp23 - 1
			when 24 then
				yyvsp24 := yyvsp24 - 1
			when 25 then
				yyvsp25 := yyvsp25 - 1
			when 26 then
				yyvsp26 := yyvsp26 - 1
			when 27 then
				yyvsp27 := yyvsp27 - 1
			when 28 then
				yyvsp28 := yyvsp28 - 1
			when 29 then
				yyvsp29 := yyvsp29 - 1
			when 30 then
				yyvsp30 := yyvsp30 - 1
			when 31 then
				yyvsp31 := yyvsp31 - 1
			when 32 then
				yyvsp32 := yyvsp32 - 1
			when 33 then
				yyvsp33 := yyvsp33 - 1
			when 34 then
				yyvsp34 := yyvsp34 - 1
			when 35 then
				yyvsp35 := yyvsp35 - 1
			when 36 then
				yyvsp36 := yyvsp36 - 1
			when 37 then
				yyvsp37 := yyvsp37 - 1
			when 38 then
				yyvsp38 := yyvsp38 - 1
			when 39 then
				yyvsp39 := yyvsp39 - 1
			when 40 then
				yyvsp40 := yyvsp40 - 1
			when 41 then
				yyvsp41 := yyvsp41 - 1
			when 42 then
				yyvsp42 := yyvsp42 - 1
			when 43 then
				yyvsp43 := yyvsp43 - 1
			when 44 then
				yyvsp44 := yyvsp44 - 1
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
			yyval11: SIBLING_ORDER
			yyval9: C_ARCHETYPE_ROOT
			yyval10: ARCHETYPE_INTERNAL_REF
			yyval14: C_PRIMITIVE_OBJECT
			yyval15: C_PRIMITIVE
			yyval8: ARRAYED_LIST [ASSERTION]
			yyval16: EXPR_ITEM
			yyval12: OG_PATH
			yyval26: OG_PATH_ITEM
			yyval13: MULTIPLICITY_INTERVAL
			yyval17: CARDINALITY
			yyval3: INTEGER
			yyval18: C_DATE
			yyval2: STRING
			yyval27: ARRAYED_LIST [STRING]
			yyval28: ARRAYED_LIST [INTEGER]
			yyval39: INTERVAL [INTEGER]
			yyval4: REAL
			yyval29: ARRAYED_LIST [REAL]
			yyval40: INTERVAL [REAL]
			yyval19: BOOLEAN
			yyval20: ISO8601_DATE
			yyval42: INTERVAL [ISO8601_DATE]
			yyval22: ISO8601_TIME
			yyval41: INTERVAL [ISO8601_TIME]
			yyval21: ISO8601_DATE_TIME
			yyval43: INTERVAL [ISO8601_DATE_TIME]
			yyval23: ISO8601_DURATION
			yyval44: INTERVAL [ISO8601_DURATION]
		do
			inspect yy_act
when 1 then
--|#line 159 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 159")
end

			debug("ADL_parse")
				io.put_string("CADL definition parsed%N")
			end

			if is_valid_concept_code(output.node_id) then
				accept
			else
				abort_with_error("VARCN", <<output.node_id>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 2 then
--|#line 171 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 171")
end

			debug("ADL_parse")
				io.put_string("assertion definition parsed%N")
			end

			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp8 := yyvsp8 -1
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
when 3 then
--|#line 179 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 179")
end

			debug("ADL_parse")
				io.put_string("CADL definition NOT parsed%N")
			end
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 4 then
--|#line 188 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 188")
end

			debug("ADL_parse")
				io.put_string(indent + "POP OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "]%N") 
				indent.remove_tail(1)
			end
			object_nodes.remove
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyvs1.put (yyval1, yyvsp1)
end
when 5 then
--|#line 196 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 196")
end

			-- ok in case where occurrences or node_id is being redefined in a specialised archetype or template
			if differential_syntax then
				debug("ADL_parse")
					io.put_string(indent + "POP OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "]%N") 
					indent.remove_tail(1)
				end
				object_nodes.remove
			else
				abort_with_error("VCOCDocc", <<complex_obj.rm_type_name, complex_obj.path>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 6 then
--|#line 211 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 211")
end

			if yyvs13.item (yyvsp13) /= Void then
				complex_obj.set_occurrences(yyvs13.item (yyvsp13))
			end

			if rm_schema.has_class_definition (complex_obj.rm_type_name) then
				object_nodes.extend(complex_obj)
				debug("ADL_parse")
					io.put_string(indent + "PUSH create OBJECT_NODE " + complex_obj.rm_type_name + " [id=" + complex_obj.node_id + "] ")
					if yyvs13.item (yyvsp13) /= Void then
						io.put_string("; occurrences=(" + yyvs13.item (yyvsp13).as_string + ")") 
					end
					io.new_line
					indent.append("%T")
				end

				-- put it under current attribute, unless it is the root object, in which case it will be returned
				-- via the 'output' attribute of this parser
				if not c_attrs.is_empty then
					safe_put_c_attribute_child(c_attrs.item, complex_obj)
				end

				-- set root node to current node if not already set - guarantees it is set to outermost block
				if output = Void then
					output := object_nodes.item
				end
			else
				abort_with_error("VCORM", <<complex_obj.rm_type_name, complex_obj.path>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp13 := yyvsp13 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 7 then
--|#line 244 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 244")
end

			create complex_obj.make_anonymous(yyvs2.item (yyvsp2))
		
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
	yyvs1.put (yyval1, yyvsp1)
end
when 8 then
--|#line 248 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 248")
end

			create complex_obj.make_identified(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 + 1
	yyvsp2 := yyvsp2 -2
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
when 9 then
--|#line 252 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 252")
end

			if differential_syntax then
				create complex_obj.make_identified(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
				complex_obj.set_sibling_order(yyvs11.item (yyvsp11))
			else
				abort_with_error("SDSF", Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 + 1
	yyvsp11 := yyvsp11 -1
	yyvsp2 := yyvsp2 -2
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
when 10 then
--|#line 263 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 263")
end

			yyval11 := create {SIBLING_ORDER}.make_after(yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp11 := yyvsp11 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp11 >= yyvsc11 then
		if yyvs11 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs11")
			end
			create yyspecial_routines11
			yyvsc11 := yyInitial_yyvs_size
			yyvs11 := yyspecial_routines11.make (yyvsc11)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs11")
			end
			yyvsc11 := yyvsc11 + yyInitial_yyvs_size
			yyvs11 := yyspecial_routines11.resize (yyvs11, yyvsc11)
		end
	end
	yyvs11.put (yyval11, yyvsp11)
end
when 11 then
--|#line 267 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 267")
end

			yyval11 := create {SIBLING_ORDER}.make_before(yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp11 := yyvsp11 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp11 >= yyvsc11 then
		if yyvs11 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs11")
			end
			create yyspecial_routines11
			yyvsc11 := yyInitial_yyvs_size
			yyvs11 := yyspecial_routines11.make (yyvsc11)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs11")
			end
			yyvsc11 := yyvsc11 + yyInitial_yyvs_size
			yyvs11 := yyspecial_routines11.resize (yyvs11, yyvsc11)
		end
	end
	yyvs11.put (yyval11, yyvsp11)
end
when 12 then
--|#line 273 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 273")
end

			debug("ADL_parse")
				io.put_string(indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + 
					" [id=" + object_nodes.item.node_id + "] - any_allowed%N") 
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 13 then
--|#line 280 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 280")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 14 then
--|#line 289 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 289")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 15 then
--|#line 292 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 292")
end

			safe_put_c_attribute_child (c_attrs.item, yyvs9.item (yyvsp9))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp9 := yyvsp9 -1
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
when 16 then
--|#line 296 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 296")
end

			safe_put_c_attribute_child (c_attrs.item, yyvs10.item (yyvsp10))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp10 := yyvsp10 -1
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
when 17 then
--|#line 300 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 300")
end

			safe_put_c_attribute_child (c_attrs.item, archetype_slot)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 18 then
--|#line 304 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 304")
end

			safe_put_c_attribute_child (c_attrs.item, constraint_ref)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 19 then
--|#line 308 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 308")
end

			safe_put_c_attribute_child(c_attrs.item, c_code_phrase_obj)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 20 then
--|#line 312 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 312")
end

			safe_put_c_attribute_child(c_attrs.item, ordinal_node)
			ordinal_node := Void
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 21 then
--|#line 317 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 317")
end

			safe_put_c_attribute_child(c_attrs.item, c_prim_obj)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp14 := yyvsp14 -1
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
when 22 then
--|#line 321 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 321")
end

			safe_put_c_attribute_child(c_attrs.item, c_domain_type)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp6 := yyvsp6 -1
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
--|#line 325 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 325")
end

			abort_with_error("SDINV", <<dadl_parser_error>>)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 24 then
--|#line 329 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 329")
end

			abort_with_error("SCCOG", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 25 then
--|#line 340 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 340")
end

			if (create {ARCHETYPE_ID}).valid_id(yyvs2.item (yyvsp2)) then
				create yyval9.make(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
				if yyvs13.item (yyvsp13) /= Void then
					yyval9.set_occurrences(yyvs13.item (yyvsp13))
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp9 := yyvsp9 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -2
	yyvsp13 := yyvsp13 -1
	if yyvsp9 >= yyvsc9 then
		if yyvs9 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs9")
			end
			create yyspecial_routines9
			yyvsc9 := yyInitial_yyvs_size
			yyvs9 := yyspecial_routines9.make (yyvsc9)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs9")
			end
			yyvsc9 := yyvsc9 + yyInitial_yyvs_size
			yyvs9 := yyspecial_routines9.resize (yyvs9, yyvsc9)
		end
	end
	yyvs9.put (yyval9, yyvsp9)
end
when 26 then
--|#line 349 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 349")
end

			if (create {ARCHETYPE_ID}).valid_id(yyvs2.item (yyvsp2)) then
				create yyval9.make_with_slot_id(yyvs2.item (yyvsp2 - 2), yyvs2.item (yyvsp2), yyvs2.item (yyvsp2 - 1))
				if yyvs13.item (yyvsp13) /= Void then
					yyval9.set_occurrences(yyvs13.item (yyvsp13))
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp9 := yyvsp9 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp2 := yyvsp2 -3
	yyvsp13 := yyvsp13 -1
	if yyvsp9 >= yyvsc9 then
		if yyvs9 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs9")
			end
			create yyspecial_routines9
			yyvsc9 := yyInitial_yyvs_size
			yyvs9 := yyspecial_routines9.make (yyvsc9)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs9")
			end
			yyvsc9 := yyvsc9 + yyInitial_yyvs_size
			yyvs9 := yyspecial_routines9.resize (yyvs9, yyvsc9)
		end
	end
	yyvs9.put (yyval9, yyvsp9)
end
when 27 then
--|#line 358 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 358")
end

			abort_with_error("SUAID", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp9 := yyvsp9 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -1
	if yyvsp9 >= yyvsc9 then
		if yyvs9 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs9")
			end
			create yyspecial_routines9
			yyvsc9 := yyInitial_yyvs_size
			yyvs9 := yyspecial_routines9.make (yyvsc9)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs9")
			end
			yyvsc9 := yyvsc9 + yyInitial_yyvs_size
			yyvs9 := yyspecial_routines9.resize (yyvs9, yyvsc9)
		end
	end
	yyvs9.put (yyval9, yyvsp9)
end
when 28 then
--|#line 364 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 364")
end

			if attached arch_internal_ref_node_id then
				create yyval10.make_identified (arch_internal_ref_rm_type_name, arch_internal_ref_node_id, yyvs12.item (yyvsp12).as_string)
			else
				create yyval10.make (arch_internal_ref_rm_type_name, yyvs12.item (yyvsp12).as_string)

				-- if the C_ATTRIBUTE above this node requires that this node has an identifier, then take it from the target path
				if c_attrs.item.candidate_child_requires_id (yyval10.rm_type_name) then
					-- default to the id from the target path
					if not yyvs12.item (yyvsp12).last.object_id.is_empty then
						yyval10.set_node_id (yyvs12.item (yyvsp12).last.object_id)
					else
						-- error will be generated when attempt is made to add this object to C_ATTRIBUTE
					end
				end

			end
			if attached yyvs13.item (yyvsp13) then
				yyval10.set_occurrences (yyvs13.item (yyvsp13))
			end

			debug("ADL_parse")
				io.put_string(indent + "create ARCHETYPE_INTERNAL_REF ")
				io.put_string (yyval10.rm_type_name) 
				if yyval10.is_addressable then
					io.put_string("[" + yyval10.node_id + "] ")
				else
					io.put_string(" ")
				end
				if yyval10.use_target_occurrences then
					io.put_string("occurrences=(use target) ")
				elseif yyvs13.item (yyvsp13) /= Void then
					io.put_string("occurrences=" + yyval10.occurrences.as_string + " ")
				end
				io.put_string (" => " + yyval10.target_path + "%N") 
				io.put_string (indent + "C_ATTR " + c_attrs.item.rm_attribute_name + " safe_put_c_attribute_child(ARCHETYPE_INTERNAL_REF)%N") 
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp10 := yyvsp10 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp13 := yyvsp13 -1
	yyvsp12 := yyvsp12 -1
	if yyvsp10 >= yyvsc10 then
		if yyvs10 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs10")
			end
			create yyspecial_routines10
			yyvsc10 := yyInitial_yyvs_size
			yyvs10 := yyspecial_routines10.make (yyvsc10)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs10")
			end
			yyvsc10 := yyvsc10 + yyInitial_yyvs_size
			yyvs10 := yyspecial_routines10.resize (yyvs10, yyvsc10)
		end
	end
	yyvs10.put (yyval10, yyvsp10)
end
when 29 then
--|#line 403 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 403")
end

			abort_with_error("SUNPA", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp10 := yyvsp10 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -1
	if yyvsp10 >= yyvsc10 then
		if yyvs10 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs10")
			end
			create yyspecial_routines10
			yyvsc10 := yyInitial_yyvs_size
			yyvs10 := yyspecial_routines10.make (yyvsc10)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs10")
			end
			yyvsc10 := yyvsc10 + yyInitial_yyvs_size
			yyvs10 := yyspecial_routines10.resize (yyvs10, yyvsc10)
		end
	end
	yyvs10.put (yyval10, yyvsp10)
end
when 30 then
--|#line 409 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 409")
end

			arch_internal_ref_rm_type_name := yyvs2.item (yyvsp2)
			arch_internal_ref_node_id := Void
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 31 then
--|#line 414 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 414")
end

			arch_internal_ref_rm_type_name := yyvs2.item (yyvsp2 - 1)
			arch_internal_ref_node_id := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 32 then
--|#line 421 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 421")
end

			if yyvs8.item (yyvsp8 - 1) /= Void then
				archetype_slot.set_includes(yyvs8.item (yyvsp8 - 1))
			end
			if yyvs8.item (yyvsp8) /= Void then
				archetype_slot.set_excludes(yyvs8.item (yyvsp8))
			end

			debug("ADL_parse")
				indent.remove_tail(1)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp1 := yyvsp1 -3
	yyvsp8 := yyvsp8 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 33 then
--|#line 434 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 434")
end

			if not (archetype_slot.is_closed or archetype_slot.is_prohibited) then
				abort_with_error("VASMD", <<archetype_slot.rm_type_name, c_attrs.item.path>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 34 then
--|#line 442 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 442")
end

			if yyvs13.item (yyvsp13) /= Void then
				archetype_slot.set_occurrences(yyvs13.item (yyvsp13))
			end

			debug("ADL_parse")
				io.put_string(indent + "create ARCHETYPE_SLOT " + archetype_slot.rm_type_name + " [id=" + archetype_slot.node_id + "]")
				if yyvs13.item (yyvsp13) /= Void then
					io.put_string("; occurrences=(" + yyvs13.item (yyvsp13).as_string + ")") 
				end
				io.new_line
				indent.append("%T")
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp13 := yyvsp13 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 35 then
--|#line 459 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 459")
end

			create archetype_slot.make_anonymous(yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 36 then
--|#line 463 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 463")
end

			if differential_syntax then
				create archetype_slot.make_anonymous(yyvs2.item (yyvsp2))
				archetype_slot.set_sibling_order(yyvs11.item (yyvsp11))
			else
				abort_with_error("SDSF", Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp11 := yyvsp11 -1
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 37 then
--|#line 472 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 472")
end

			create archetype_slot.make_identified(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 38 then
--|#line 476 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 476")
end

			if differential_syntax then
				create archetype_slot.make_identified(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
				archetype_slot.set_sibling_order(yyvs11.item (yyvsp11))
			else
				abort_with_error("SDSF", Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp11 := yyvsp11 -1
	yyvsp2 := yyvsp2 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 39 then
--|#line 485 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 485")
end

			create archetype_slot.make_anonymous(yyvs2.item (yyvsp2))
			archetype_slot.set_closed
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 40 then
--|#line 490 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 490")
end

			create archetype_slot.make_identified(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
			archetype_slot.set_closed
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 41 then
--|#line 495 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 495")
end

			abort_with_error("SUAS", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 42 then
--|#line 501 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 501")
end

			create c_prim_obj.make(yyvs15.item (yyvsp15))
			yyval14 := c_prim_obj
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp15 := yyvsp15 -1
	if yyvsp14 >= yyvsc14 then
		if yyvs14 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs14")
			end
			create yyspecial_routines14
			yyvsc14 := yyInitial_yyvs_size
			yyvs14 := yyspecial_routines14.make (yyvsc14)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs14")
			end
			yyvsc14 := yyvsc14 + yyInitial_yyvs_size
			yyvs14 := yyspecial_routines14.resize (yyvs14, yyvsc14)
		end
	end
	yyvs14.put (yyval14, yyvsp14)
end
when 43 then
--|#line 508 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 508")
end

			debug("ADL_parse")
				io.put_string(indent + "C_INTEGER: " +  c_integer.as_string + "%N")
			end
			yyval15 := c_integer
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp15 := yyvsp15 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp15 >= yyvsc15 then
		if yyvs15 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs15")
			end
			create yyspecial_routines15
			yyvsc15 := yyInitial_yyvs_size
			yyvs15 := yyspecial_routines15.make (yyvsc15)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs15")
			end
			yyvsc15 := yyvsc15 + yyInitial_yyvs_size
			yyvs15 := yyspecial_routines15.resize (yyvs15, yyvsc15)
		end
	end
	yyvs15.put (yyval15, yyvsp15)
end
when 44 then
--|#line 515 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 515")
end

			debug("ADL_parse")
				io.put_string(indent + "C_REAL: " +  c_real.as_string + "%N")
			end
			yyval15 := c_real
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp15 := yyvsp15 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp15 >= yyvsc15 then
		if yyvs15 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs15")
			end
			create yyspecial_routines15
			yyvsc15 := yyInitial_yyvs_size
			yyvs15 := yyspecial_routines15.make (yyvsc15)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs15")
			end
			yyvsc15 := yyvsc15 + yyInitial_yyvs_size
			yyvs15 := yyspecial_routines15.resize (yyvs15, yyvsc15)
		end
	end
	yyvs15.put (yyval15, yyvsp15)
end
when 45 then
--|#line 522 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 522")
end

			debug("ADL_parse")
				io.put_string(indent + "C_DATE: " +  yyvs18.item (yyvsp18).as_string + "%N")
			end
			yyval15 := yyvs18.item (yyvsp18)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp15 := yyvsp15 + 1
	yyvsp18 := yyvsp18 -1
	if yyvsp15 >= yyvsc15 then
		if yyvs15 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs15")
			end
			create yyspecial_routines15
			yyvsc15 := yyInitial_yyvs_size
			yyvs15 := yyspecial_routines15.make (yyvsc15)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs15")
			end
			yyvsc15 := yyvsc15 + yyInitial_yyvs_size
			yyvs15 := yyspecial_routines15.resize (yyvs15, yyvsc15)
		end
	end
	yyvs15.put (yyval15, yyvsp15)
end
when 46 then
--|#line 529 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 529")
end

			debug("ADL_parse")
				io.put_string(indent + "C_TIME: " +  c_time.as_string + "%N")
			end
			yyval15 := c_time
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp15 := yyvsp15 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp15 >= yyvsc15 then
		if yyvs15 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs15")
			end
			create yyspecial_routines15
			yyvsc15 := yyInitial_yyvs_size
			yyvs15 := yyspecial_routines15.make (yyvsc15)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs15")
			end
			yyvsc15 := yyvsc15 + yyInitial_yyvs_size
			yyvs15 := yyspecial_routines15.resize (yyvs15, yyvsc15)
		end
	end
	yyvs15.put (yyval15, yyvsp15)
end
when 47 then
--|#line 536 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 536")
end

			debug("ADL_parse")
				io.put_string(indent + "C_DATE_TIME: " +  c_date_time.as_string + "%N")
			end
			yyval15 := c_date_time
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp15 := yyvsp15 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp15 >= yyvsc15 then
		if yyvs15 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs15")
			end
			create yyspecial_routines15
			yyvsc15 := yyInitial_yyvs_size
			yyvs15 := yyspecial_routines15.make (yyvsc15)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs15")
			end
			yyvsc15 := yyvsc15 + yyInitial_yyvs_size
			yyvs15 := yyspecial_routines15.resize (yyvs15, yyvsc15)
		end
	end
	yyvs15.put (yyval15, yyvsp15)
end
when 48 then
--|#line 543 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 543")
end

			debug("ADL_parse")
				io.put_string(indent + "C_DURATION: " +  c_duration.as_string + "%N")
			end
			yyval15 := c_duration
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp15 := yyvsp15 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp15 >= yyvsc15 then
		if yyvs15 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs15")
			end
			create yyspecial_routines15
			yyvsc15 := yyInitial_yyvs_size
			yyvs15 := yyspecial_routines15.make (yyvsc15)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs15")
			end
			yyvsc15 := yyvsc15 + yyInitial_yyvs_size
			yyvs15 := yyspecial_routines15.resize (yyvs15, yyvsc15)
		end
	end
	yyvs15.put (yyval15, yyvsp15)
end
when 49 then
--|#line 550 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 550")
end

			debug("ADL_parse")
				io.put_string(indent + "C_STRING: " +  c_string.as_string + "%N")
			end
			yyval15 := c_string
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp15 := yyvsp15 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp15 >= yyvsc15 then
		if yyvs15 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs15")
			end
			create yyspecial_routines15
			yyvsc15 := yyInitial_yyvs_size
			yyvs15 := yyspecial_routines15.make (yyvsc15)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs15")
			end
			yyvsc15 := yyvsc15 + yyInitial_yyvs_size
			yyvs15 := yyspecial_routines15.resize (yyvs15, yyvsc15)
		end
	end
	yyvs15.put (yyval15, yyvsp15)
end
when 50 then
--|#line 557 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 557")
end

			debug("ADL_parse")
				io.put_string(indent + "C_BOOLEAN: " +  c_boolean.as_string + "%N")
			end
			yyval15 := c_boolean
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp15 := yyvsp15 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp15 >= yyvsc15 then
		if yyvs15 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs15")
			end
			create yyspecial_routines15
			yyvsc15 := yyInitial_yyvs_size
			yyvs15 := yyspecial_routines15.make (yyvsc15)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs15")
			end
			yyvsc15 := yyvsc15 + yyInitial_yyvs_size
			yyvs15 := yyspecial_routines15.resize (yyvs15, yyvsc15)
		end
	end
	yyvs15.put (yyval15, yyvsp15)
end
when 51 then
--|#line 566 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 566")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 52 then
--|#line 573 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 573")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 53 then
--|#line 576 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 576")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 54 then
--|#line 581 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 581")
end

			debug("ADL_parse")
				io.put_string(indent + "POP ATTR_NODE " + c_attrs.item.rm_attribute_name + "%N") 
				indent.remove_tail(1)
			end
			c_attrs.remove
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyvs1.put (yyval1, yyvsp1)
end
when 55 then
--|#line 589 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 589")
end

			if differential_syntax then
				c_attrs.remove
			else
				abort_with_error("SCAS", Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 56 then
--|#line 597 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 597")
end

			abort_with_error("SCAS", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyvs1.put (yyval1, yyvsp1)
end
when 57 then
--|#line 603 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 603")
end

			rm_attribute_name := yyvs2.item (yyvsp2)
			if not object_nodes.item.has_attribute(rm_attribute_name) then
				if rm_schema.has_property (object_nodes.item.rm_type_name, rm_attribute_name) then
					bmm_prop_def := rm_schema.property_definition (object_nodes.item.rm_type_name, rm_attribute_name)
					if bmm_prop_def.is_container then
						create attr_node.make_multiple(rm_attribute_name, yyvs13.item (yyvsp13), yyvs17.item (yyvsp17))
						c_attrs.put(attr_node)
						debug("ADL_parse")
							io.put_string(indent + "PUSH create ATTR_NODE " + rm_attribute_name + "; container = " + attr_node.is_multiple.out)
							if yyvs13.item (yyvsp13) /= Void then io.put_string(" existence={" + yyvs13.item (yyvsp13).as_string + "}") end
							if yyvs17.item (yyvsp17) /= Void then io.put_string("; cardinality=(" + yyvs17.item (yyvsp17).as_string + ")") end
							io.new_line
							io.put_string(indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_attribute(REL)%N") 
							indent.append("%T")
						end
						object_nodes.item.put_attribute(attr_node)
					elseif yyvs17.item (yyvsp17) = Void then
						create attr_node.make_single(rm_attribute_name, yyvs13.item (yyvsp13))
						c_attrs.put(attr_node)
						debug("ADL_parse")
							io.put_string(indent + "PUSH create ATTR_NODE " + rm_attribute_name + "; container = " + attr_node.is_multiple.out) 
							if yyvs13.item (yyvsp13) /= Void then io.put_string(" existence={" + yyvs13.item (yyvsp13).as_string + "}") end
							if yyvs17.item (yyvsp17) /= Void then io.put_string("; cardinality=(" + yyvs17.item (yyvsp17).as_string + ")") end
							io.new_line
							io.put_string(indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_attribute(REL)%N") 
							indent.append("%T")
						end
						object_nodes.item.put_attribute(attr_node)
					else -- error - cardinality stated, but on a non-container attribute
						abort_with_error("VSAM2", <<rm_attribute_name>>)
					end
				else
					abort_with_error("VCARM", <<rm_attribute_name, object_nodes.item.path, object_nodes.item.rm_type_name>>)
				end
			else
				abort_with_error("VCATU", <<rm_attribute_name>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp13 := yyvsp13 -1
	yyvsp17 := yyvsp17 -1
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
when 58 then
--|#line 643 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 643")
end

			rm_attribute_name := yyvs12.item (yyvsp12).last.attr_name
			parent_path_str := yyvs12.item (yyvsp12).parent_path.as_string
			path_str := yyvs12.item (yyvsp12).as_string

			if not object_nodes.item.has_attribute(path_str) then
				-- check RM to see if path is valid, and if it is a container
				if rm_schema.has_property_path (object_nodes.item.rm_type_name, path_str) then
					bmm_prop_def := rm_schema.property_definition_at_path (object_nodes.item.rm_type_name, path_str)
					if bmm_prop_def.is_container then
						create attr_node.make_multiple(rm_attribute_name, yyvs13.item (yyvsp13), yyvs17.item (yyvsp17))
						attr_node.set_differential_path (parent_path_str)
						c_attrs.put(attr_node)
						debug("ADL_parse")
							io.put_string(indent + "PUSH create ATTR_NODE " + path_str + "; container = " + attr_node.is_multiple.out) 
							if yyvs13.item (yyvsp13) /= Void then io.put_string(" existence={" + yyvs13.item (yyvsp13).as_string + "}") end
							io.new_line
							io.put_string(indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_attribute(REL)%N") 
							indent.append("%T")
						end
						object_nodes.item.put_attribute(attr_node)
					elseif yyvs17.item (yyvsp17) = Void then
						create attr_node.make_single(rm_attribute_name, yyvs13.item (yyvsp13))
						attr_node.set_differential_path (parent_path_str)
						c_attrs.put(attr_node)
						debug("ADL_parse")
							io.put_string(indent + "PUSH create ATTR_NODE " + path_str + "; container = " + attr_node.is_multiple.out) 
							if yyvs13.item (yyvsp13) /= Void then io.put_string(" existence={" + yyvs13.item (yyvsp13).as_string + "}") end
							io.new_line
							io.put_string(indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_attribute(REL)%N") 
							indent.append("%T")
						end
						object_nodes.item.put_attribute(attr_node)
					else -- error - cardinality stated, but on a non-container attribute
						abort_with_error("VSAM2", <<path_str>>)
					end
				else
					abort_with_error("VDIFP2", <<path_str>>)
				end
			else
				abort_with_error("VCATU", <<path_str>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp13 := yyvsp13 -1
	yyvsp17 := yyvsp17 -1
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
when 59 then
--|#line 689 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 689")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 60 then
--|#line 692 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 692")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 61 then
--|#line 695 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 695")
end

			debug("ADL_parse")
				io.put_string(indent + "ATTR_NODE " + attr_node.rm_attribute_name + "  - any_allowed%N") 
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 62 then
--|#line 704 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 704")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp8 := yyvsp8 + 1
	if yyvsp8 >= yyvsc8 then
		if yyvs8 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs8")
			end
			create yyspecial_routines8
			yyvsc8 := yyInitial_yyvs_size
			yyvs8 := yyspecial_routines8.make (yyvsc8)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs8")
			end
			yyvsc8 := yyvsc8 + yyInitial_yyvs_size
			yyvs8 := yyspecial_routines8.resize (yyvs8, yyvsc8)
		end
	end
	yyvs8.put (yyval8, yyvsp8)
end
when 63 then
--|#line 705 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 705")
end

			debug("include list")
				io.put_string(indent + "[---assertion expression---] %N")
			end
			yyval8 := assertion_list
			assertion_list := Void
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs8.put (yyval8, yyvsp8)
end
when 64 then
--|#line 715 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 715")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp8 := yyvsp8 + 1
	if yyvsp8 >= yyvsc8 then
		if yyvs8 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs8")
			end
			create yyspecial_routines8
			yyvsc8 := yyInitial_yyvs_size
			yyvs8 := yyspecial_routines8.make (yyvsc8)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs8")
			end
			yyvsc8 := yyvsc8 + yyInitial_yyvs_size
			yyvs8 := yyspecial_routines8.resize (yyvs8, yyvsc8)
		end
	end
	yyvs8.put (yyval8, yyvsp8)
end
when 65 then
--|#line 716 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 716")
end

			debug("exclude list")
				io.put_string(indent + "[---assertion expression---] %N")
			end
			yyval8 := assertion_list
			assertion_list := Void
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs8.put (yyval8, yyvsp8)
end
when 66 then
--|#line 730 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 730")
end

			if assertion_list = Void then 
				create assertion_list.make(0)
			end
			assertion_list.extend(assertion)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp8 := yyvsp8 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp8 >= yyvsc8 then
		if yyvs8 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs8")
			end
			create yyspecial_routines8
			yyvsc8 := yyInitial_yyvs_size
			yyvs8 := yyspecial_routines8.make (yyvsc8)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs8")
			end
			yyvsc8 := yyvsc8 + yyInitial_yyvs_size
			yyvs8 := yyspecial_routines8.resize (yyvs8, yyvsc8)
		end
	end
	yyvs8.put (yyval8, yyvsp8)
end
when 67 then
--|#line 737 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 737")
end

			assertion_list.extend(assertion)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs8.put (yyval8, yyvsp8)
end
when 68 then
--|#line 743 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 743")
end

			create assertion.make(yyvs16.item (yyvsp16), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 69 then
--|#line 747 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 747")
end

			create assertion.make(yyvs16.item (yyvsp16), Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp16 := yyvsp16 -1
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
when 70 then
--|#line 751 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 751")
end

			abort_with_error("SINVS", <<yyvs2.item (yyvsp2)>>)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 71 then
--|#line 759 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 759")
end

			yyval16 := yyvs16.item (yyvsp16)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
when 72 then
--|#line 763 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 763")
end

			yyval16 := yyvs16.item (yyvsp16)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
when 73 then
--|#line 769 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 769")
end

			debug("ADL_invariant")
				io.put_string(indent + "Exists " + yyvs12.item (yyvsp12).as_string + "%N") 
			end
			create expr_unary_operator.make(create {OPERATOR_KIND}.make(op_exists))
			create expr_leaf.make_archetype_definition_ref(yyvs12.item (yyvsp12).as_string)
			expr_unary_operator.set_operand(expr_leaf)
			yyval16 := expr_unary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp16 := yyvsp16 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp12 := yyvsp12 -1
	if yyvsp16 >= yyvsc16 then
		if yyvs16 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs16")
			end
			create yyspecial_routines16
			yyvsc16 := yyInitial_yyvs_size
			yyvs16 := yyspecial_routines16.make (yyvsc16)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs16")
			end
			yyvsc16 := yyvsc16 + yyInitial_yyvs_size
			yyvs16 := yyspecial_routines16.resize (yyvs16, yyvsc16)
		end
	end
	yyvs16.put (yyval16, yyvsp16)
end
when 74 then
--|#line 779 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 779")
end

			abort_with_error("SEXPT", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp16 := yyvsp16 + 1
	yyvsp1 := yyvsp1 -2
	if yyvsp16 >= yyvsc16 then
		if yyvs16 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs16")
			end
			create yyspecial_routines16
			yyvsc16 := yyInitial_yyvs_size
			yyvs16 := yyspecial_routines16.make (yyvsc16)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs16")
			end
			yyvsc16 := yyvsc16 + yyInitial_yyvs_size
			yyvs16 := yyspecial_routines16.resize (yyvs16, yyvsc16)
		end
	end
	yyvs16.put (yyval16, yyvsp16)
end
when 75 then
--|#line 783 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 783")
end

			debug("ADL_invariant")
				io.put_string(indent + "Archetype feature matches {" + yyvs15.item (yyvsp15).as_string + "}%N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_matches))
			expr_binary_operator.set_left_operand(create {EXPR_LEAF}.make_archetype_ref(yyvs12.item (yyvsp12).as_string))
			expr_binary_operator.set_right_operand(create {EXPR_LEAF}.make_constraint(yyvs15.item (yyvsp15)))
			yyval16 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp16 := yyvsp16 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp1 := yyvsp1 -3
	yyvsp15 := yyvsp15 -1
	if yyvsp16 >= yyvsc16 then
		if yyvs16 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs16")
			end
			create yyspecial_routines16
			yyvsc16 := yyInitial_yyvs_size
			yyvs16 := yyspecial_routines16.make (yyvsc16)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs16")
			end
			yyvsc16 := yyvsc16 + yyInitial_yyvs_size
			yyvs16 := yyspecial_routines16.resize (yyvs16, yyvsc16)
		end
	end
	yyvs16.put (yyval16, yyvsp16)
end
when 76 then
--|#line 793 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 793")
end

			debug("ADL_invariant")
				io.put_string(indent + "NOT bool_leaf %N") 
			end
			create expr_unary_operator.make(create {OPERATOR_KIND}.make(op_not))
			expr_unary_operator.set_operand(yyvs16.item (yyvsp16))
			yyval16 := expr_unary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs16.put (yyval16, yyvsp16)
end
when 77 then
--|#line 802 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 802")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_expr = arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_eq))
			expr_binary_operator.set_left_operand(yyvs16.item (yyvsp16 - 1))
			expr_binary_operator.set_right_operand(yyvs16.item (yyvsp16))
			yyval16 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp16 := yyvsp16 -1
	yyvsp1 := yyvsp1 -1
	yyvs16.put (yyval16, yyvsp16)
end
when 78 then
--|#line 812 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 812")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_expr != arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_ne))
			expr_binary_operator.set_left_operand(yyvs16.item (yyvsp16 - 1))
			expr_binary_operator.set_right_operand(yyvs16.item (yyvsp16))
			yyval16 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp16 := yyvsp16 -1
	yyvsp1 := yyvsp1 -1
	yyvs16.put (yyval16, yyvsp16)
end
when 79 then
--|#line 822 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 822")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_expr < arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_lt))
			expr_binary_operator.set_left_operand(yyvs16.item (yyvsp16 - 1))
			expr_binary_operator.set_right_operand(yyvs16.item (yyvsp16))
			yyval16 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp16 := yyvsp16 -1
	yyvsp1 := yyvsp1 -1
	yyvs16.put (yyval16, yyvsp16)
end
when 80 then
--|#line 832 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 832")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_expr > arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_gt))
			expr_binary_operator.set_left_operand(yyvs16.item (yyvsp16 - 1))
			expr_binary_operator.set_right_operand(yyvs16.item (yyvsp16))
			yyval16 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp16 := yyvsp16 -1
	yyvsp1 := yyvsp1 -1
	yyvs16.put (yyval16, yyvsp16)
end
when 81 then
--|#line 842 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 842")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_expr <= arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_le))
			expr_binary_operator.set_left_operand(yyvs16.item (yyvsp16 - 1))
			expr_binary_operator.set_right_operand(yyvs16.item (yyvsp16))
			yyval16 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp16 := yyvsp16 -1
	yyvsp1 := yyvsp1 -1
	yyvs16.put (yyval16, yyvsp16)
end
when 82 then
--|#line 852 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 852")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_expr >= arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_ge))
			expr_binary_operator.set_left_operand(yyvs16.item (yyvsp16 - 1))
			expr_binary_operator.set_right_operand(yyvs16.item (yyvsp16))
			yyval16 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp16 := yyvsp16 -1
	yyvsp1 := yyvsp1 -1
	yyvs16.put (yyval16, yyvsp16)
end
when 83 then
--|#line 862 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 862")
end

			debug("ADL_invariant")
				io.put_string(indent + "bool_expr AND bool_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_and))
			expr_binary_operator.set_left_operand(yyvs16.item (yyvsp16 - 1))
			expr_binary_operator.set_right_operand(yyvs16.item (yyvsp16))
			yyval16 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp16 := yyvsp16 -1
	yyvsp1 := yyvsp1 -1
	yyvs16.put (yyval16, yyvsp16)
end
when 84 then
--|#line 872 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 872")
end

			debug("ADL_invariant")
				io.put_string(indent + "bool_expr OR bool_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_or))
			expr_binary_operator.set_left_operand(yyvs16.item (yyvsp16 - 1))
			expr_binary_operator.set_right_operand(yyvs16.item (yyvsp16))
			yyval16 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp16 := yyvsp16 -1
	yyvsp1 := yyvsp1 -1
	yyvs16.put (yyval16, yyvsp16)
end
when 85 then
--|#line 882 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 882")
end

			debug("ADL_invariant")
				io.put_string(indent + "bool_expr XOR bool_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_xor))
			expr_binary_operator.set_left_operand(yyvs16.item (yyvsp16 - 1))
			expr_binary_operator.set_right_operand(yyvs16.item (yyvsp16))
			yyval16 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp16 := yyvsp16 -1
	yyvsp1 := yyvsp1 -1
	yyvs16.put (yyval16, yyvsp16)
end
when 86 then
--|#line 892 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 892")
end

			debug("ADL_invariant")
				io.put_string(indent + "bool_expr IMPLIES bool_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_implies))
			expr_binary_operator.set_left_operand(yyvs16.item (yyvsp16 - 1))
			expr_binary_operator.set_right_operand(yyvs16.item (yyvsp16))
			yyval16 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp16 := yyvsp16 -1
	yyvsp1 := yyvsp1 -1
	yyvs16.put (yyval16, yyvsp16)
end
when 87 then
--|#line 904 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 904")
end

			yyval16 := yyvs16.item (yyvsp16)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs16.put (yyval16, yyvsp16)
end
when 88 then
--|#line 908 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 908")
end

			create expr_leaf.make_boolean(True)
			yyval16 := expr_leaf
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp16 >= yyvsc16 then
		if yyvs16 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs16")
			end
			create yyspecial_routines16
			yyvsc16 := yyInitial_yyvs_size
			yyvs16 := yyspecial_routines16.make (yyvsc16)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs16")
			end
			yyvsc16 := yyvsc16 + yyInitial_yyvs_size
			yyvs16 := yyspecial_routines16.resize (yyvs16, yyvsc16)
		end
	end
	yyvs16.put (yyval16, yyvsp16)
end
when 89 then
--|#line 913 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 913")
end

			create expr_leaf.make_boolean(False)
			yyval16 := expr_leaf
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp16 >= yyvsc16 then
		if yyvs16 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs16")
			end
			create yyspecial_routines16
			yyvsc16 := yyInitial_yyvs_size
			yyvs16 := yyspecial_routines16.make (yyvsc16)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs16")
			end
			yyvsc16 := yyvsc16 + yyInitial_yyvs_size
			yyvs16 := yyspecial_routines16.resize (yyvs16, yyvsc16)
		end
	end
	yyvs16.put (yyval16, yyvsp16)
end
when 90 then
--|#line 920 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 920")
end

			yyval16 := yyvs16.item (yyvsp16)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
when 91 then
--|#line 924 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 924")
end

			yyval16 := yyvs16.item (yyvsp16)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
when 92 then
--|#line 930 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 930")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_expr + arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_plus))
			expr_binary_operator.set_left_operand(yyvs16.item (yyvsp16 - 1))
			expr_binary_operator.set_right_operand(yyvs16.item (yyvsp16))
			yyval16 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp16 := yyvsp16 -1
	yyvsp1 := yyvsp1 -1
	yyvs16.put (yyval16, yyvsp16)
end
when 93 then
--|#line 940 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 940")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_expr - arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_minus))
			expr_binary_operator.set_left_operand(yyvs16.item (yyvsp16 - 1))
			expr_binary_operator.set_right_operand(yyvs16.item (yyvsp16))
			yyval16 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp16 := yyvsp16 -1
	yyvsp1 := yyvsp1 -1
	yyvs16.put (yyval16, yyvsp16)
end
when 94 then
--|#line 950 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 950")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_expr * arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_multiply))
			expr_binary_operator.set_left_operand(yyvs16.item (yyvsp16 - 1))
			expr_binary_operator.set_right_operand(yyvs16.item (yyvsp16))
			yyval16 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp16 := yyvsp16 -1
	yyvsp1 := yyvsp1 -1
	yyvs16.put (yyval16, yyvsp16)
end
when 95 then
--|#line 960 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 960")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_expr / arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_divide))
			expr_binary_operator.set_left_operand(yyvs16.item (yyvsp16 - 1))
			expr_binary_operator.set_right_operand(yyvs16.item (yyvsp16))
			yyval16 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp16 := yyvsp16 -1
	yyvsp1 := yyvsp1 -1
	yyvs16.put (yyval16, yyvsp16)
end
when 96 then
--|#line 970 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 970")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_expr ^ arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_exp))
			expr_binary_operator.set_left_operand(yyvs16.item (yyvsp16 - 1))
			expr_binary_operator.set_right_operand(yyvs16.item (yyvsp16))
			yyval16 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp16 := yyvsp16 -1
	yyvsp1 := yyvsp1 -1
	yyvs16.put (yyval16, yyvsp16)
end
when 97 then
--|#line 982 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 982")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_leaf - (expr) %N") 
			end
			yyval16 := yyvs16.item (yyvsp16)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs16.put (yyval16, yyvsp16)
end
when 98 then
--|#line 989 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 989")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_leaf - integer: " + yyvs3.item (yyvsp3).out + "%N") 
			end
			create expr_leaf.make_integer(yyvs3.item (yyvsp3))
			yyval16 := expr_leaf
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp16 >= yyvsc16 then
		if yyvs16 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs16")
			end
			create yyspecial_routines16
			yyvsc16 := yyInitial_yyvs_size
			yyvs16 := yyspecial_routines16.make (yyvsc16)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs16")
			end
			yyvsc16 := yyvsc16 + yyInitial_yyvs_size
			yyvs16 := yyspecial_routines16.resize (yyvs16, yyvsc16)
		end
	end
	yyvs16.put (yyval16, yyvsp16)
end
when 99 then
--|#line 997 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 997")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_leaf - real: " + yyvs4.item (yyvsp4).out + "%N") 
			end
			create expr_leaf.make_real(yyvs4.item (yyvsp4))
			yyval16 := expr_leaf
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp16 >= yyvsc16 then
		if yyvs16 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs16")
			end
			create yyspecial_routines16
			yyvsc16 := yyInitial_yyvs_size
			yyvs16 := yyspecial_routines16.make (yyvsc16)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs16")
			end
			yyvsc16 := yyvsc16 + yyInitial_yyvs_size
			yyvs16 := yyspecial_routines16.resize (yyvs16, yyvsc16)
		end
	end
	yyvs16.put (yyval16, yyvsp16)
end
when 100 then
--|#line 1005 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1005")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_leaf - path: " + yyvs12.item (yyvsp12).as_string + "%N") 
			end
			create expr_leaf.make_archetype_definition_ref(yyvs12.item (yyvsp12).as_string)
			yyval16 := expr_leaf
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp12 := yyvsp12 -1
	if yyvsp16 >= yyvsc16 then
		if yyvs16 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs16")
			end
			create yyspecial_routines16
			yyvsc16 := yyInitial_yyvs_size
			yyvs16 := yyspecial_routines16.make (yyvsc16)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs16")
			end
			yyvsc16 := yyvsc16 + yyInitial_yyvs_size
			yyvs16 := yyspecial_routines16.resize (yyvs16, yyvsc16)
		end
	end
	yyvs16.put (yyval16, yyvsp16)
end
when 101 then
--|#line 1020 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1020")
end

			create yyval12.make_root
			debug("OG_PATH_parse")
				io.put_string("....absolute_path (root); %N")
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp12 := yyvsp12 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp12 >= yyvsc12 then
		if yyvs12 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs12")
			end
			create yyspecial_routines12
			yyvsc12 := yyInitial_yyvs_size
			yyvs12 := yyspecial_routines12.make (yyvsc12)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs12")
			end
			yyvsc12 := yyvsc12 + yyInitial_yyvs_size
			yyvs12 := yyspecial_routines12.resize (yyvs12, yyvsc12)
		end
	end
	yyvs12.put (yyval12, yyvsp12)
end
when 102 then
--|#line 1027 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1027")
end

			yyval12 := yyvs12.item (yyvsp12)
			yyval12.set_absolute
			debug("OG_PATH_parse")
				io.put_string("....absolute_path; %N")
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs12.put (yyval12, yyvsp12)
end
when 103 then
--|#line 1035 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1035")
end

			yyval12 := yyvs12.item (yyvsp12 - 1)
			yyval12.append_path(yyvs12.item (yyvsp12))
			debug("OG_PATH_parse")
				io.put_string("....absolute_path (appended relative path); %N")
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp12 := yyvsp12 -1
	yyvsp1 := yyvsp1 -1
	yyvs12.put (yyval12, yyvsp12)
end
when 104 then
--|#line 1045 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1045")
end

			create yyval12.make_relative(yyvs26.item (yyvsp26))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp12 := yyvsp12 + 1
	yyvsp26 := yyvsp26 -1
	if yyvsp12 >= yyvsc12 then
		if yyvs12 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs12")
			end
			create yyspecial_routines12
			yyvsc12 := yyInitial_yyvs_size
			yyvs12 := yyspecial_routines12.make (yyvsc12)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs12")
			end
			yyvsc12 := yyvsc12 + yyInitial_yyvs_size
			yyvs12 := yyspecial_routines12.resize (yyvs12, yyvsc12)
		end
	end
	yyvs12.put (yyval12, yyvsp12)
end
when 105 then
--|#line 1049 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1049")
end

			yyval12 := yyvs12.item (yyvsp12)
			yyval12.append_segment(yyvs26.item (yyvsp26))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp26 := yyvsp26 -1
	yyvs12.put (yyval12, yyvsp12)
end
when 106 then
--|#line 1056 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1056")
end

			create yyval26.make_with_object_id(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
			debug("OG_PATH_parse")
				io.put_string("...path_segment: " + yyvs2.item (yyvsp2 - 1) + "[" + yyvs2.item (yyvsp2) + "]%N")
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp26 := yyvsp26 + 1
	yyvsp2 := yyvsp2 -2
	if yyvsp26 >= yyvsc26 then
		if yyvs26 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs26")
			end
			create yyspecial_routines26
			yyvsc26 := yyInitial_yyvs_size
			yyvs26 := yyspecial_routines26.make (yyvsc26)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs26")
			end
			yyvsc26 := yyvsc26 + yyInitial_yyvs_size
			yyvs26 := yyspecial_routines26.resize (yyvs26, yyvsc26)
		end
	end
	yyvs26.put (yyval26, yyvsp26)
end
when 107 then
--|#line 1063 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1063")
end

			create yyval26.make_with_object_id(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
			debug("OG_PATH_parse")
				io.put_string("...path_segment: " + yyvs2.item (yyvsp2 - 1) + "[" + yyvs2.item (yyvsp2) + "]%N")
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp26 := yyvsp26 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp1 := yyvsp1 -2
	if yyvsp26 >= yyvsc26 then
		if yyvs26 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs26")
			end
			create yyspecial_routines26
			yyvsc26 := yyInitial_yyvs_size
			yyvs26 := yyspecial_routines26.make (yyvsc26)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs26")
			end
			yyvsc26 := yyvsc26 + yyInitial_yyvs_size
			yyvs26 := yyspecial_routines26.resize (yyvs26, yyvsc26)
		end
	end
	yyvs26.put (yyval26, yyvsp26)
end
when 108 then
--|#line 1070 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1070")
end

			create yyval26.make(yyvs2.item (yyvsp2))
			debug("OG_PATH_parse")
				io.put_string("...path_segment: " + yyvs2.item (yyvsp2) + "%N")
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp26 := yyvsp26 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp26 >= yyvsc26 then
		if yyvs26 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs26")
			end
			create yyspecial_routines26
			yyvsc26 := yyInitial_yyvs_size
			yyvs26 := yyspecial_routines26.make (yyvsc26)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs26")
			end
			yyvsc26 := yyvsc26 + yyInitial_yyvs_size
			yyvs26 := yyspecial_routines26.resize (yyvs26, yyvsc26)
		end
	end
	yyvs26.put (yyval26, yyvsp26)
end
when 109 then
--|#line 1086 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1086")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp13 := yyvsp13 + 1
	if yyvsp13 >= yyvsc13 then
		if yyvs13 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs13")
			end
			create yyspecial_routines13
			yyvsc13 := yyInitial_yyvs_size
			yyvs13 := yyspecial_routines13.make (yyvsc13)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs13")
			end
			yyvsc13 := yyvsc13 + yyInitial_yyvs_size
			yyvs13 := yyspecial_routines13.resize (yyvs13, yyvsc13)
		end
	end
	yyvs13.put (yyval13, yyvsp13)
end
when 110 then
--|#line 1087 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1087")
end

			yyval13 := yyvs13.item (yyvsp13)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyvs13.put (yyval13, yyvsp13)
end
when 111 then
--|#line 1093 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1093")
end

			if yyvs3.item (yyvsp3) = 0 then
				create yyval13.make_prohibited
			elseif yyvs3.item (yyvsp3) = 1 then
				create yyval13.make_mandatory
			else
				abort_with_error("SEXLSG", Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp13 := yyvsp13 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp13 >= yyvsc13 then
		if yyvs13 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs13")
			end
			create yyspecial_routines13
			yyvsc13 := yyInitial_yyvs_size
			yyvs13 := yyspecial_routines13.make (yyvsc13)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs13")
			end
			yyvsc13 := yyvsc13 + yyInitial_yyvs_size
			yyvs13 := yyspecial_routines13.resize (yyvs13, yyvsc13)
		end
	end
	yyvs13.put (yyval13, yyvsp13)
end
when 112 then
--|#line 1103 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1103")
end

			if yyvs3.item (yyvsp3 - 1) = 0 then
				if yyvs3.item (yyvsp3) = 0 then
					create yyval13.make_point(0)
				elseif yyvs3.item (yyvsp3) = 1 then
					create yyval13.make_bounded(0, 1)
				else
					abort_with_error("SEXLU1", Void)
				end
			elseif yyvs3.item (yyvsp3 - 1) = 1 then
				if yyvs3.item (yyvsp3) = 1 then
					create yyval13.make_point(1)
				else
					abort_with_error("SEXLU2", Void)
				end
			else
				abort_with_error("SEXLMG", Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp13 := yyvsp13 + 1
	yyvsp3 := yyvsp3 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp13 >= yyvsc13 then
		if yyvs13 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs13")
			end
			create yyspecial_routines13
			yyvsc13 := yyInitial_yyvs_size
			yyvs13 := yyspecial_routines13.make (yyvsc13)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs13")
			end
			yyvsc13 := yyvsc13 + yyInitial_yyvs_size
			yyvs13 := yyspecial_routines13.resize (yyvs13, yyvsc13)
		end
	end
	yyvs13.put (yyval13, yyvsp13)
end
when 113 then
--|#line 1125 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1125")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp17 := yyvsp17 + 1
	if yyvsp17 >= yyvsc17 then
		if yyvs17 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs17")
			end
			create yyspecial_routines17
			yyvsc17 := yyInitial_yyvs_size
			yyvs17 := yyspecial_routines17.make (yyvsc17)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs17")
			end
			yyvsc17 := yyvsc17 + yyInitial_yyvs_size
			yyvs17 := yyspecial_routines17.resize (yyvs17, yyvsc17)
		end
	end
	yyvs17.put (yyval17, yyvsp17)
end
when 114 then
--|#line 1126 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1126")
end

			yyval17 := a_cardinality
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp17 := yyvsp17 + 1
	yyvsp1 := yyvsp1 -5
	if yyvsp17 >= yyvsc17 then
		if yyvs17 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs17")
			end
			create yyspecial_routines17
			yyvsc17 := yyInitial_yyvs_size
			yyvs17 := yyspecial_routines17.make (yyvsc17)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs17")
			end
			yyvsc17 := yyvsc17 + yyInitial_yyvs_size
			yyvs17 := yyspecial_routines17.resize (yyvs17, yyvsc17)
		end
	end
	yyvs17.put (yyval17, yyvsp17)
end
when 115 then
--|#line 1132 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1132")
end

			create a_cardinality.make(multiplicity_interval)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp13 := yyvsp13 -1
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
when 116 then
--|#line 1136 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1136")
end

			create a_cardinality.make(multiplicity_interval)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp13 := yyvsp13 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 117 then
--|#line 1140 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1140")
end

			create a_cardinality.make(multiplicity_interval)
			a_cardinality.set_unordered
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp13 := yyvsp13 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 118 then
--|#line 1145 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1145")
end

			create a_cardinality.make(multiplicity_interval)
			a_cardinality.set_unique
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp13 := yyvsp13 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 119 then
--|#line 1150 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1150")
end

			create a_cardinality.make(multiplicity_interval)
			a_cardinality.set_unique
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp13 := yyvsp13 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 120 then
--|#line 1155 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1155")
end

			create a_cardinality.make(multiplicity_interval)
			a_cardinality.set_unique
			a_cardinality.set_unordered
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp13 := yyvsp13 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 121 then
--|#line 1161 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1161")
end

			create a_cardinality.make(multiplicity_interval)
			a_cardinality.set_unique
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp13 := yyvsp13 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 122 then
--|#line 1166 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1166")
end

			create a_cardinality.make(multiplicity_interval)
			a_cardinality.set_unique
			a_cardinality.set_unordered
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp13 := yyvsp13 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 123 then
--|#line 1174 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1174")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs3.put (yyval3, yyvsp3)
end
when 124 then
--|#line 1178 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1178")
end

			cardinality_limit_pos_infinity := True
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp3 := yyvsp3 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp3 >= yyvsc3 then
		if yyvs3 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs3")
			end
			create yyspecial_routines3
			yyvsc3 := yyInitial_yyvs_size
			yyvs3 := yyspecial_routines3.make (yyvsc3)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs3")
			end
			yyvsc3 := yyvsc3 + yyInitial_yyvs_size
			yyvs3 := yyspecial_routines3.resize (yyvs3, yyvsc3)
		end
	end
	yyvs3.put (yyval3, yyvsp3)
end
when 125 then
--|#line 1184 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1184")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp13 := yyvsp13 + 1
	if yyvsp13 >= yyvsc13 then
		if yyvs13 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs13")
			end
			create yyspecial_routines13
			yyvsc13 := yyInitial_yyvs_size
			yyvs13 := yyspecial_routines13.make (yyvsc13)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs13")
			end
			yyvsc13 := yyvsc13 + yyInitial_yyvs_size
			yyvs13 := yyspecial_routines13.resize (yyvs13, yyvsc13)
		end
	end
	yyvs13.put (yyval13, yyvsp13)
end
when 126 then
--|#line 1185 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1185")
end

			yyval13 := yyvs13.item (yyvsp13)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyvs13.put (yyval13, yyvsp13)
end
when 127 then
--|#line 1189 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1189")
end

			abort_with_error("SOCCF", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp13 := yyvsp13 + 1
	yyvsp1 := yyvsp1 -2
	if yyvsp13 >= yyvsc13 then
		if yyvs13 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs13")
			end
			create yyspecial_routines13
			yyvsc13 := yyInitial_yyvs_size
			yyvs13 := yyspecial_routines13.make (yyvsc13)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs13")
			end
			yyvsc13 := yyvsc13 + yyInitial_yyvs_size
			yyvs13 := yyspecial_routines13.resize (yyvs13, yyvsc13)
		end
	end
	yyvs13.put (yyval13, yyvsp13)
end
when 128 then
--|#line 1195 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1195")
end

			if not cardinality_limit_pos_infinity then
				create multiplicity_interval.make_point(yyvs3.item (yyvsp3))
			else
				create multiplicity_interval.make_upper_unbounded(0)
				cardinality_limit_pos_infinity := False
			end
			yyval13 := multiplicity_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp13 := yyvsp13 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp13 >= yyvsc13 then
		if yyvs13 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs13")
			end
			create yyspecial_routines13
			yyvsc13 := yyInitial_yyvs_size
			yyvs13 := yyspecial_routines13.make (yyvsc13)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs13")
			end
			yyvsc13 := yyvsc13 + yyInitial_yyvs_size
			yyvs13 := yyspecial_routines13.resize (yyvs13, yyvsc13)
		end
	end
	yyvs13.put (yyval13, yyvsp13)
end
when 129 then
--|#line 1205 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1205")
end

			if cardinality_limit_pos_infinity then
				create multiplicity_interval.make_upper_unbounded(yyvs3.item (yyvsp3 - 1))
				cardinality_limit_pos_infinity := False
			else
				create multiplicity_interval.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3))
			end
			yyval13 := multiplicity_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp13 := yyvsp13 + 1
	yyvsp3 := yyvsp3 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp13 >= yyvsc13 then
		if yyvs13 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs13")
			end
			create yyspecial_routines13
			yyvsc13 := yyInitial_yyvs_size
			yyvs13 := yyspecial_routines13.make (yyvsc13)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs13")
			end
			yyvsc13 := yyvsc13 + yyInitial_yyvs_size
			yyvs13 := yyspecial_routines13.resize (yyvs13, yyvsc13)
		end
	end
	yyvs13.put (yyval13, yyvsp13)
end
when 130 then
--|#line 1219 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1219")
end

			create int_list.make(0)
			int_list.extend(yyvs3.item (yyvsp3))
			create c_integer.make_list(int_list)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp3 := yyvsp3 -1
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
when 131 then
--|#line 1225 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1225")
end

			create c_integer.make_list(yyvs28.item (yyvsp28))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp28 := yyvsp28 -1
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
when 132 then
--|#line 1229 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1229")
end

			if integer_interval.lower_unbounded then
				create int_interval.make_lower_unbounded(integer_interval.upper.item, integer_interval.upper_included)
			else
				if integer_interval.upper_unbounded then
					create int_interval.make_upper_unbounded(integer_interval.lower.item, integer_interval.lower_included)
				else
					create int_interval.make_bounded(integer_interval.lower.item, integer_interval.upper.item, integer_interval.lower_included, integer_interval.upper_included)
				end
			end

			create c_integer.make_range(int_interval)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp39 := yyvsp39 -1
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
when 133 then
--|#line 1245 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1245")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 134 then
--|#line 1246 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1246")
end

			if c_integer.valid_value(yyvs3.item (yyvsp3)) then
				c_integer.set_assumed_value(yyvs3.item (yyvsp3))
			else
				abort_with_error("VOBAV", <<yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 135 then
--|#line 1254 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1254")
end

			abort_with_error("SCIAV", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 136 then
--|#line 1260 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1260")
end

			create real_list.make(0)
			real_list.extend(yyvs4.item (yyvsp4))
			create c_real.make_list(real_list)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp4 := yyvsp4 -1
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
when 137 then
--|#line 1266 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1266")
end

			create c_real.make_list(yyvs29.item (yyvsp29))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp29 := yyvsp29 -1
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
when 138 then
--|#line 1270 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1270")
end

			if real_interval.lower_unbounded then
				create rl_interval.make_lower_unbounded(real_interval.upper.item, real_interval.upper_included)
			else
				if real_interval.upper_unbounded then
					create rl_interval.make_upper_unbounded(real_interval.lower.item, real_interval.lower_included)
				else
					create rl_interval.make_bounded(real_interval.lower.item, real_interval.upper.item, real_interval.lower_included, real_interval.upper_included)
				end
			end

			create c_real.make_range(rl_interval)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp40 := yyvsp40 -1
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
when 139 then
--|#line 1286 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1286")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 140 then
--|#line 1287 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1287")
end

			if c_real.valid_value(yyvs4.item (yyvsp4)) then
				c_real.set_assumed_value(yyvs4.item (yyvsp4))
			else
				abort_with_error("VOBAV", <<yyvs4.item (yyvsp4).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 141 then
--|#line 1295 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1295")
end

			abort_with_error("SCRAV", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 142 then
--|#line 1301 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1301")
end

			if valid_iso8601_date_constraint_pattern(yyvs2.item (yyvsp2)) then
				create yyval18.make_from_pattern(yyvs2.item (yyvsp2))
			else
				create str.make(0)
				from valid_date_constraint_patterns.start until valid_date_constraint_patterns.off loop
					if not valid_date_constraint_patterns.isfirst then
						str.append(", ")
					end
					str.append(valid_date_constraint_patterns.item)
					valid_date_constraint_patterns.forth
				end

				abort_with_error("SCDPT", <<str>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp18 := yyvsp18 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp18 >= yyvsc18 then
		if yyvs18 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs18")
			end
			create yyspecial_routines18
			yyvsc18 := yyInitial_yyvs_size
			yyvs18 := yyspecial_routines18.make (yyvsc18)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs18")
			end
			yyvsc18 := yyvsc18 + yyInitial_yyvs_size
			yyvs18 := yyspecial_routines18.resize (yyvs18, yyvsc18)
		end
	end
	yyvs18.put (yyval18, yyvsp18)
end
when 143 then
--|#line 1318 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1318")
end

			create date_interval.make_point(yyvs20.item (yyvsp20))
			create yyval18.make_range(date_interval)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp18 := yyvsp18 + 1
	yyvsp20 := yyvsp20 -1
	if yyvsp18 >= yyvsc18 then
		if yyvs18 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs18")
			end
			create yyspecial_routines18
			yyvsc18 := yyInitial_yyvs_size
			yyvs18 := yyspecial_routines18.make (yyvsc18)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs18")
			end
			yyvsc18 := yyvsc18 + yyInitial_yyvs_size
			yyvs18 := yyspecial_routines18.resize (yyvs18, yyvsc18)
		end
	end
	yyvs18.put (yyval18, yyvsp18)
end
when 144 then
--|#line 1323 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1323")
end

			create yyval18.make_range(date_interval)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp18 := yyvsp18 + 1
	yyvsp42 := yyvsp42 -1
	if yyvsp18 >= yyvsc18 then
		if yyvs18 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs18")
			end
			create yyspecial_routines18
			yyvsc18 := yyInitial_yyvs_size
			yyvs18 := yyspecial_routines18.make (yyvsc18)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs18")
			end
			yyvsc18 := yyvsc18 + yyInitial_yyvs_size
			yyvs18 := yyspecial_routines18.resize (yyvs18, yyvsc18)
		end
	end
	yyvs18.put (yyval18, yyvsp18)
end
when 145 then
--|#line 1329 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1329")
end

			yyval18 := yyvs18.item (yyvsp18)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs18.put (yyval18, yyvsp18)
end
when 146 then
--|#line 1333 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1333")
end

			if yyvs18.item (yyvsp18).valid_value(yyvs20.item (yyvsp20)) then
				yyvs18.item (yyvsp18).set_assumed_value(yyvs20.item (yyvsp20))
				yyval18 := yyvs18.item (yyvsp18)
			else
				abort_with_error("VOBAV", <<yyvs20.item (yyvsp20).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp20 := yyvsp20 -1
	yyvs18.put (yyval18, yyvsp18)
end
when 147 then
--|#line 1342 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1342")
end

			abort_with_error("SCDAV", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs18.put (yyval18, yyvsp18)
end
when 148 then
--|#line 1348 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1348")
end

			if valid_iso8601_time_constraint_pattern(yyvs2.item (yyvsp2)) then
				create c_time.make_from_pattern(yyvs2.item (yyvsp2))
			else
				create str.make(0)
				from 
					valid_time_constraint_patterns.start
				until
					valid_time_constraint_patterns.off
				loop
					if not valid_time_constraint_patterns.isfirst then
						str.append(", ")
					end
					str.append(valid_time_constraint_patterns.item)
					valid_time_constraint_patterns.forth
				end

				abort_with_error("SCTPT", <<str>>)
			end
		
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
	yyvs1.put (yyval1, yyvsp1)
end
when 149 then
--|#line 1369 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1369")
end

			create time_interval.make_point(yyvs22.item (yyvsp22))
			create c_time.make_range(time_interval)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp22 := yyvsp22 -1
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
when 150 then
--|#line 1374 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1374")
end

			create c_time.make_range(time_interval)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp41 := yyvsp41 -1
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
when 151 then
--|#line 1380 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1380")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 152 then
--|#line 1381 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1381")
end

			if c_time.valid_value(yyvs22.item (yyvsp22)) then
				c_time.set_assumed_value(yyvs22.item (yyvsp22))
			else
				abort_with_error("VOBAV", <<yyvs22.item (yyvsp22).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp22 := yyvsp22 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 153 then
--|#line 1389 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1389")
end

			abort_with_error("SCTAV", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 154 then
--|#line 1395 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1395")
end

			if valid_iso8601_date_time_constraint_pattern(yyvs2.item (yyvsp2)) then
				create c_date_time.make_from_pattern(yyvs2.item (yyvsp2))
			else
				create str.make(0)
				from 
					valid_date_time_constraint_patterns.start
				until
					valid_date_time_constraint_patterns.off
				loop
					if not valid_date_time_constraint_patterns.isfirst then
						str.append(", ")
					end
					str.append(valid_date_time_constraint_patterns.item)
					valid_date_time_constraint_patterns.forth
				end

				abort_with_error("SCDTPT", <<str>>)
			end
		
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
	yyvs1.put (yyval1, yyvsp1)
end
when 155 then
--|#line 1416 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1416")
end

			create date_time_interval.make_point(yyvs21.item (yyvsp21))
			create c_date_time.make_range(date_time_interval)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp21 := yyvsp21 -1
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
when 156 then
--|#line 1421 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1421")
end

			create c_date_time.make_range(date_time_interval)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp43 := yyvsp43 -1
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
when 157 then
--|#line 1427 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1427")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 158 then
--|#line 1428 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1428")
end

			if c_date_time.valid_value(yyvs21.item (yyvsp21)) then
				c_date_time.set_assumed_value(yyvs21.item (yyvsp21))
			else
				abort_with_error("VOBAV", <<yyvs21.item (yyvsp21).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp21 := yyvsp21 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 159 then
--|#line 1436 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1436")
end

			abort_with_error("SCDTAV", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 160 then
--|#line 1442 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1442")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 161 then
--|#line 1443 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1443")
end

			create c_duration.make_pattern_with_range (c_duration.pattern, duration_interval)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp44 := yyvsp44 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 162 then
--|#line 1447 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1447")
end

			create duration_interval.make_point(yyvs23.item (yyvsp23))
			create c_duration.make_range(duration_interval)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp23 := yyvsp23 -1
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
when 163 then
--|#line 1452 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1452")
end

			create c_duration.make_range(duration_interval)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp44 := yyvsp44 -1
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
when 164 then
--|#line 1458 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1458")
end

			if valid_iso8601_duration_constraint_pattern (yyvs2.item (yyvsp2)) then
				create c_duration.make_from_pattern (yyvs2.item (yyvsp2))
			else
				abort_with_error("SCDUPT", Void)
			end
		
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
	yyvs1.put (yyval1, yyvsp1)
end
when 165 then
--|#line 1468 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1468")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 166 then
--|#line 1469 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1469")
end

			if c_duration.valid_value(yyvs23.item (yyvsp23)) then
				c_duration.set_assumed_value(yyvs23.item (yyvsp23))
			else
				abort_with_error("VOBAV", <<yyvs23.item (yyvsp23).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp23 := yyvsp23 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 167 then
--|#line 1477 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1477")
end

			abort_with_error("SCDUAV", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 168 then
--|#line 1483 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1483")
end

			create string_list.make(0)
			string_list.extend(yyvs2.item (yyvsp2))
			create c_string.make_from_string_list(string_list)
			string_list := Void
		
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
	yyvs1.put (yyval1, yyvsp1)
end
when 169 then
--|#line 1490 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1490")
end

			create c_string.make_from_string_list(yyvs27.item (yyvsp27))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp27 := yyvsp27 -1
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
when 170 then
--|#line 1494 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1494")
end

			create c_string.make_from_string_list(yyvs27.item (yyvsp27))
			c_string.set_open
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp27 := yyvsp27 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 171 then
--|#line 1499 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1499")
end

			create c_string.make_from_regexp(yyvs2.item (yyvsp2).substring (2, yyvs2.item (yyvsp2).count - 1), yyvs2.item (yyvsp2).item(1) = '/')
			if c_string.regexp.is_equal(c_string.regexp_compile_error) then
				abort_with_error("SCSRE", <<yyvs2.item (yyvsp2)>>)
			end
		
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
	yyvs1.put (yyval1, yyvsp1)
end
when 172 then
--|#line 1508 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1508")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 173 then
--|#line 1509 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1509")
end

			if c_string.valid_value(yyvs2.item (yyvsp2)) then
				c_string.set_assumed_value(yyvs2.item (yyvsp2))
			else
				abort_with_error("VOBAV", <<yyvs2.item (yyvsp2).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 174 then
--|#line 1517 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1517")
end

			abort_with_error("SCSAV", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 175 then
--|#line 1523 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1523")
end

			create c_boolean.make_true
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 176 then
--|#line 1527 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1527")
end

			create c_boolean.make_false
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 177 then
--|#line 1531 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1531")
end

			create c_boolean.make_true_false
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 178 then
--|#line 1535 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1535")
end

			create c_boolean.make_true_false
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 179 then
--|#line 1541 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1541")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 180 then
--|#line 1542 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1542")
end

			if c_boolean.valid_value(yyvs19.item (yyvsp19)) then
				c_boolean.set_assumed_value(yyvs19.item (yyvsp19))
			else
				abort_with_error("VOBAV", <<yyvs19.item (yyvsp19).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp19 := yyvsp19 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 181 then
--|#line 1550 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1550")
end

			abort_with_error("SCBAV", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 182 then
--|#line 1556 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1556")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 183 then
--|#line 1557 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1557")
end

			if ordinal_node.has_item (yyvs3.item (yyvsp3)) then
				ordinal_node.set_assumed_value_from_integer (yyvs3.item (yyvsp3))
			else
				abort_with_error("VOBAV", <<yyvs3.item (yyvsp3).out>>)
			end
 		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 184 then
--|#line 1565 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1565")
end

			abort_with_error("SCOAV", Void)
 		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 185 then
--|#line 1571 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1571")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 186 then
--|#line 1572 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1572")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 187 then
--|#line 1575 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1575")
end

			if ordinal_node = Void then
				create ordinal_node.make
			end

			create a_code_phrase.make_from_string (yyvs2.item (yyvsp2))
			create an_ordinal.make (yyvs3.item (yyvsp3), a_code_phrase)

			if ordinal_node.has_item (yyvs3.item (yyvsp3)) then
				abort_with_error("VCOV", <<yyvs3.item (yyvsp3).out>>)
			elseif ordinal_node.has_code_phrase (a_code_phrase) then
				abort_with_error("VCOC", <<yyvs2.item (yyvsp2)>>)
			else
				ordinal_node.add_item (an_ordinal)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp3 := yyvsp3 -1
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 188 then
--|#line 1594 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1594")
end

			create c_code_phrase_obj.default_create

			if c_code_phrase_obj.valid_pattern (yyvs2.item (yyvsp2)) then
				c_code_phrase_obj.make_from_pattern (yyvs2.item (yyvsp2))
			else
				abort_with_error("VOBAV", <<c_code_phrase_obj.fail_reason>>)
			end
		
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
	yyvs1.put (yyval1, yyvsp1)
end
when 189 then
--|#line 1604 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1604")
end

			create c_code_phrase_obj.make_from_pattern(yyvs2.item (yyvsp2))
		
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
	yyvs1.put (yyval1, yyvsp1)
end
when 190 then
--|#line 1610 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1610")
end

			create constraint_ref.make(yyvs2.item (yyvsp2))
		
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
	yyvs1.put (yyval1, yyvsp1)
end
when 191 then
--|#line 1616 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1616")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 192 then
--|#line 1620 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1620")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 193 then
--|#line 1632 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1632")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs2.put (yyval2, yyvsp2)
end
when 194 then
--|#line 1636 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1636")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs2.put (yyval2, yyvsp2)
end
when 195 then
--|#line 1640 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1640")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 196 then
--|#line 1644 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1644")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 197 then
--|#line 1650 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1650")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 198 then
--|#line 1656 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1656")
end

			create yyval27.make(0)
			yyval27.extend(yyvs2.item (yyvsp2 - 1))
			yyval27.extend(yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp27 := yyvsp27 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp27 >= yyvsc27 then
		if yyvs27 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs27")
			end
			create yyspecial_routines27
			yyvsc27 := yyInitial_yyvs_size
			yyvs27 := yyspecial_routines27.make (yyvsc27)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs27")
			end
			yyvsc27 := yyvsc27 + yyInitial_yyvs_size
			yyvs27 := yyspecial_routines27.resize (yyvs27, yyvsc27)
		end
	end
	yyvs27.put (yyval27, yyvsp27)
end
when 199 then
--|#line 1662 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1662")
end

			yyvs27.item (yyvsp27).extend(yyvs2.item (yyvsp2))
			yyval27 := yyvs27.item (yyvsp27)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyvs27.put (yyval27, yyvsp27)
end
when 200 then
--|#line 1667 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1667")
end

			yyval27 := yyvs27.item (yyvsp27)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs27.put (yyval27, yyvsp27)
end
when 201 then
--|#line 1671 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1671")
end

			create yyval27.make (0)
			yyval27.extend (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp27 := yyvsp27 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp27 >= yyvsc27 then
		if yyvs27 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs27")
			end
			create yyspecial_routines27
			yyvsc27 := yyInitial_yyvs_size
			yyvs27 := yyspecial_routines27.make (yyvsc27)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs27")
			end
			yyvsc27 := yyvsc27 + yyInitial_yyvs_size
			yyvs27 := yyspecial_routines27.resize (yyvs27, yyvsc27)
		end
	end
	yyvs27.put (yyval27, yyvsp27)
end
when 202 then
--|#line 1678 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1678")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs3.put (yyval3, yyvsp3)
end
when 203 then
--|#line 1681 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1681")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs3.put (yyval3, yyvsp3)
end
when 204 then
--|#line 1684 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1684")
end

			yyval3 := - yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs3.put (yyval3, yyvsp3)
end
when 205 then
--|#line 1689 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1689")
end

			create yyval28.make(0)
			yyval28.extend(yyvs3.item (yyvsp3 - 1))
			yyval28.extend(yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp28 := yyvsp28 + 1
	yyvsp3 := yyvsp3 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp28 >= yyvsc28 then
		if yyvs28 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs28")
			end
			create yyspecial_routines28
			yyvsc28 := yyInitial_yyvs_size
			yyvs28 := yyspecial_routines28.make (yyvsc28)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs28")
			end
			yyvsc28 := yyvsc28 + yyInitial_yyvs_size
			yyvs28 := yyspecial_routines28.resize (yyvs28, yyvsc28)
		end
	end
	yyvs28.put (yyval28, yyvsp28)
end
when 206 then
--|#line 1695 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1695")
end

			yyvs28.item (yyvsp28).extend(yyvs3.item (yyvsp3))
			yyval28 := yyvs28.item (yyvsp28)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyvs28.put (yyval28, yyvsp28)
end
when 207 then
--|#line 1700 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1700")
end

			create yyval28.make(0)
			yyval28.extend(yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp28 := yyvsp28 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp28 >= yyvsc28 then
		if yyvs28 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs28")
			end
			create yyspecial_routines28
			yyvsc28 := yyInitial_yyvs_size
			yyvs28 := yyspecial_routines28.make (yyvsc28)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs28")
			end
			yyvsc28 := yyvsc28 + yyInitial_yyvs_size
			yyvs28 := yyspecial_routines28.resize (yyvs28, yyvsc28)
		end
	end
	yyvs28.put (yyval28, yyvsp28)
end
when 208 then
--|#line 1707 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1707")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create integer_interval.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), True, True)
				yyval39 := integer_interval
			else
				abort_with_error("VIVLO", <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -2
	if yyvsp39 >= yyvsc39 then
		if yyvs39 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs39")
			end
			create yyspecial_routines39
			yyvsc39 := yyInitial_yyvs_size
			yyvs39 := yyspecial_routines39.make (yyvsc39)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs39")
			end
			yyvsc39 := yyvsc39 + yyInitial_yyvs_size
			yyvs39 := yyspecial_routines39.resize (yyvs39, yyvsc39)
		end
	end
	yyvs39.put (yyval39, yyvsp39)
end
when 209 then
--|#line 1716 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1716")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create integer_interval.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), False, True)
				yyval39 := integer_interval
			else
				abort_with_error("VIVLO", <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp3 := yyvsp3 -2
	if yyvsp39 >= yyvsc39 then
		if yyvs39 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs39")
			end
			create yyspecial_routines39
			yyvsc39 := yyInitial_yyvs_size
			yyvs39 := yyspecial_routines39.make (yyvsc39)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs39")
			end
			yyvsc39 := yyvsc39 + yyInitial_yyvs_size
			yyvs39 := yyspecial_routines39.resize (yyvs39, yyvsc39)
		end
	end
	yyvs39.put (yyval39, yyvsp39)
end
when 210 then
--|#line 1725 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1725")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create integer_interval.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), True, False)
				yyval39 := integer_interval
			else
				abort_with_error("VIVLO", <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp3 := yyvsp3 -2
	if yyvsp39 >= yyvsc39 then
		if yyvs39 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs39")
			end
			create yyspecial_routines39
			yyvsc39 := yyInitial_yyvs_size
			yyvs39 := yyspecial_routines39.make (yyvsc39)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs39")
			end
			yyvsc39 := yyvsc39 + yyInitial_yyvs_size
			yyvs39 := yyspecial_routines39.resize (yyvs39, yyvsc39)
		end
	end
	yyvs39.put (yyval39, yyvsp39)
end
when 211 then
--|#line 1734 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1734")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create integer_interval.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), False, False)
				yyval39 := integer_interval
			else
				abort_with_error("VIVLO", <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp3 := yyvsp3 -2
	if yyvsp39 >= yyvsc39 then
		if yyvs39 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs39")
			end
			create yyspecial_routines39
			yyvsc39 := yyInitial_yyvs_size
			yyvs39 := yyspecial_routines39.make (yyvsc39)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs39")
			end
			yyvsc39 := yyvsc39 + yyInitial_yyvs_size
			yyvs39 := yyspecial_routines39.resize (yyvs39, yyvsc39)
		end
	end
	yyvs39.put (yyval39, yyvsp39)
end
when 212 then
--|#line 1743 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1743")
end

			create integer_interval.make_lower_unbounded(yyvs3.item (yyvsp3), False)
			yyval39 := integer_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp39 >= yyvsc39 then
		if yyvs39 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs39")
			end
			create yyspecial_routines39
			yyvsc39 := yyInitial_yyvs_size
			yyvs39 := yyspecial_routines39.make (yyvsc39)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs39")
			end
			yyvsc39 := yyvsc39 + yyInitial_yyvs_size
			yyvs39 := yyspecial_routines39.resize (yyvs39, yyvsc39)
		end
	end
	yyvs39.put (yyval39, yyvsp39)
end
when 213 then
--|#line 1748 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1748")
end

			create integer_interval.make_lower_unbounded(yyvs3.item (yyvsp3), True)
			yyval39 := integer_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp39 >= yyvsc39 then
		if yyvs39 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs39")
			end
			create yyspecial_routines39
			yyvsc39 := yyInitial_yyvs_size
			yyvs39 := yyspecial_routines39.make (yyvsc39)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs39")
			end
			yyvsc39 := yyvsc39 + yyInitial_yyvs_size
			yyvs39 := yyspecial_routines39.resize (yyvs39, yyvsc39)
		end
	end
	yyvs39.put (yyval39, yyvsp39)
end
when 214 then
--|#line 1753 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1753")
end

			create integer_interval.make_upper_unbounded(yyvs3.item (yyvsp3), False)
			yyval39 := integer_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp39 >= yyvsc39 then
		if yyvs39 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs39")
			end
			create yyspecial_routines39
			yyvsc39 := yyInitial_yyvs_size
			yyvs39 := yyspecial_routines39.make (yyvsc39)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs39")
			end
			yyvsc39 := yyvsc39 + yyInitial_yyvs_size
			yyvs39 := yyspecial_routines39.resize (yyvs39, yyvsc39)
		end
	end
	yyvs39.put (yyval39, yyvsp39)
end
when 215 then
--|#line 1758 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1758")
end

			create integer_interval.make_upper_unbounded(yyvs3.item (yyvsp3), True)
			yyval39 := integer_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp39 >= yyvsc39 then
		if yyvs39 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs39")
			end
			create yyspecial_routines39
			yyvsc39 := yyInitial_yyvs_size
			yyvs39 := yyspecial_routines39.make (yyvsc39)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs39")
			end
			yyvsc39 := yyvsc39 + yyInitial_yyvs_size
			yyvs39 := yyspecial_routines39.resize (yyvs39, yyvsc39)
		end
	end
	yyvs39.put (yyval39, yyvsp39)
end
when 216 then
--|#line 1763 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1763")
end

			create integer_interval.make_point(yyvs3.item (yyvsp3))
			yyval39 := integer_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp3 := yyvsp3 -1
	if yyvsp39 >= yyvsc39 then
		if yyvs39 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs39")
			end
			create yyspecial_routines39
			yyvsc39 := yyInitial_yyvs_size
			yyvs39 := yyspecial_routines39.make (yyvsc39)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs39")
			end
			yyvsc39 := yyvsc39 + yyInitial_yyvs_size
			yyvs39 := yyspecial_routines39.resize (yyvs39, yyvsc39)
		end
	end
	yyvs39.put (yyval39, yyvsp39)
end
when 217 then
--|#line 1770 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1770")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs4.put (yyval4, yyvsp4)
end
when 218 then
--|#line 1774 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1774")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs4.put (yyval4, yyvsp4)
end
when 219 then
--|#line 1778 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1778")
end

			yyval4 := - yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs4.put (yyval4, yyvsp4)
end
when 220 then
--|#line 1784 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1784")
end

			create yyval29.make(0)
			yyval29.extend(yyvs4.item (yyvsp4 - 1))
			yyval29.extend(yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp29 := yyvsp29 + 1
	yyvsp4 := yyvsp4 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp29 >= yyvsc29 then
		if yyvs29 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs29")
			end
			create yyspecial_routines29
			yyvsc29 := yyInitial_yyvs_size
			yyvs29 := yyspecial_routines29.make (yyvsc29)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs29")
			end
			yyvsc29 := yyvsc29 + yyInitial_yyvs_size
			yyvs29 := yyspecial_routines29.resize (yyvs29, yyvsc29)
		end
	end
	yyvs29.put (yyval29, yyvsp29)
end
when 221 then
--|#line 1790 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1790")
end

			yyvs29.item (yyvsp29).extend(yyvs4.item (yyvsp4))
			yyval29 := yyvs29.item (yyvsp29)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyvs29.put (yyval29, yyvsp29)
end
when 222 then
--|#line 1795 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1795")
end

			create yyval29.make(0)
			yyval29.extend(yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp29 := yyvsp29 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp29 >= yyvsc29 then
		if yyvs29 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs29")
			end
			create yyspecial_routines29
			yyvsc29 := yyInitial_yyvs_size
			yyvs29 := yyspecial_routines29.make (yyvsc29)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs29")
			end
			yyvsc29 := yyvsc29 + yyInitial_yyvs_size
			yyvs29 := yyspecial_routines29.resize (yyvs29, yyvsc29)
		end
	end
	yyvs29.put (yyval29, yyvsp29)
end
when 223 then
--|#line 1802 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1802")
end

			if yyvs4.item (yyvsp4 - 1) <= yyvs4.item (yyvsp4) then
				create real_interval.make_bounded(yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4), True, True)
				yyval40 := real_interval
			else
				abort_with_error("VIVLO", <<yyvs4.item (yyvsp4 - 1).out, yyvs4.item (yyvsp4).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp4 := yyvsp4 -2
	if yyvsp40 >= yyvsc40 then
		if yyvs40 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs40")
			end
			create yyspecial_routines40
			yyvsc40 := yyInitial_yyvs_size
			yyvs40 := yyspecial_routines40.make (yyvsc40)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs40")
			end
			yyvsc40 := yyvsc40 + yyInitial_yyvs_size
			yyvs40 := yyspecial_routines40.resize (yyvs40, yyvsc40)
		end
	end
	yyvs40.put (yyval40, yyvsp40)
end
when 224 then
--|#line 1811 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1811")
end

			if yyvs4.item (yyvsp4 - 1) <= yyvs4.item (yyvsp4) then
				create real_interval.make_bounded(yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4), False, True)
				yyval40 := real_interval
			else
				abort_with_error("VIVLO", <<yyvs4.item (yyvsp4 - 1).out, yyvs4.item (yyvsp4).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp4 := yyvsp4 -2
	if yyvsp40 >= yyvsc40 then
		if yyvs40 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs40")
			end
			create yyspecial_routines40
			yyvsc40 := yyInitial_yyvs_size
			yyvs40 := yyspecial_routines40.make (yyvsc40)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs40")
			end
			yyvsc40 := yyvsc40 + yyInitial_yyvs_size
			yyvs40 := yyspecial_routines40.resize (yyvs40, yyvsc40)
		end
	end
	yyvs40.put (yyval40, yyvsp40)
end
when 225 then
--|#line 1820 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1820")
end

			if yyvs4.item (yyvsp4 - 1) <= yyvs4.item (yyvsp4) then
				create real_interval.make_bounded(yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4), True, False)
				yyval40 := real_interval
			else
				abort_with_error("VIVLO", <<yyvs4.item (yyvsp4 - 1).out, yyvs4.item (yyvsp4).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp4 := yyvsp4 -2
	if yyvsp40 >= yyvsc40 then
		if yyvs40 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs40")
			end
			create yyspecial_routines40
			yyvsc40 := yyInitial_yyvs_size
			yyvs40 := yyspecial_routines40.make (yyvsc40)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs40")
			end
			yyvsc40 := yyvsc40 + yyInitial_yyvs_size
			yyvs40 := yyspecial_routines40.resize (yyvs40, yyvsc40)
		end
	end
	yyvs40.put (yyval40, yyvsp40)
end
when 226 then
--|#line 1829 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1829")
end

			if yyvs4.item (yyvsp4 - 1) <= yyvs4.item (yyvsp4) then
				create real_interval.make_bounded(yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4), False, False)
				yyval40 := real_interval
			else
				abort_with_error("VIVLO", <<yyvs4.item (yyvsp4 - 1).out, yyvs4.item (yyvsp4).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp4 := yyvsp4 -2
	if yyvsp40 >= yyvsc40 then
		if yyvs40 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs40")
			end
			create yyspecial_routines40
			yyvsc40 := yyInitial_yyvs_size
			yyvs40 := yyspecial_routines40.make (yyvsc40)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs40")
			end
			yyvsc40 := yyvsc40 + yyInitial_yyvs_size
			yyvs40 := yyspecial_routines40.resize (yyvs40, yyvsc40)
		end
	end
	yyvs40.put (yyval40, yyvsp40)
end
when 227 then
--|#line 1838 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1838")
end

			create real_interval.make_lower_unbounded(yyvs4.item (yyvsp4), False)
			yyval40 := real_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp4 := yyvsp4 -1
	if yyvsp40 >= yyvsc40 then
		if yyvs40 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs40")
			end
			create yyspecial_routines40
			yyvsc40 := yyInitial_yyvs_size
			yyvs40 := yyspecial_routines40.make (yyvsc40)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs40")
			end
			yyvsc40 := yyvsc40 + yyInitial_yyvs_size
			yyvs40 := yyspecial_routines40.resize (yyvs40, yyvsc40)
		end
	end
	yyvs40.put (yyval40, yyvsp40)
end
when 228 then
--|#line 1843 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1843")
end

			create real_interval.make_lower_unbounded(yyvs4.item (yyvsp4), True)
			yyval40 := real_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp4 := yyvsp4 -1
	if yyvsp40 >= yyvsc40 then
		if yyvs40 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs40")
			end
			create yyspecial_routines40
			yyvsc40 := yyInitial_yyvs_size
			yyvs40 := yyspecial_routines40.make (yyvsc40)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs40")
			end
			yyvsc40 := yyvsc40 + yyInitial_yyvs_size
			yyvs40 := yyspecial_routines40.resize (yyvs40, yyvsc40)
		end
	end
	yyvs40.put (yyval40, yyvsp40)
end
when 229 then
--|#line 1848 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1848")
end

			create real_interval.make_upper_unbounded(yyvs4.item (yyvsp4), False)
			yyval40 := real_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp4 := yyvsp4 -1
	if yyvsp40 >= yyvsc40 then
		if yyvs40 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs40")
			end
			create yyspecial_routines40
			yyvsc40 := yyInitial_yyvs_size
			yyvs40 := yyspecial_routines40.make (yyvsc40)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs40")
			end
			yyvsc40 := yyvsc40 + yyInitial_yyvs_size
			yyvs40 := yyspecial_routines40.resize (yyvs40, yyvsc40)
		end
	end
	yyvs40.put (yyval40, yyvsp40)
end
when 230 then
--|#line 1853 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1853")
end

			create real_interval.make_upper_unbounded(yyvs4.item (yyvsp4), True)
			yyval40 := real_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp4 := yyvsp4 -1
	if yyvsp40 >= yyvsc40 then
		if yyvs40 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs40")
			end
			create yyspecial_routines40
			yyvsc40 := yyInitial_yyvs_size
			yyvs40 := yyspecial_routines40.make (yyvsc40)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs40")
			end
			yyvsc40 := yyvsc40 + yyInitial_yyvs_size
			yyvs40 := yyspecial_routines40.resize (yyvs40, yyvsc40)
		end
	end
	yyvs40.put (yyval40, yyvsp40)
end
when 231 then
--|#line 1858 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1858")
end

			create real_interval.make_point(yyvs4.item (yyvsp4))
			yyval40 := real_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp4 := yyvsp4 -1
	if yyvsp40 >= yyvsc40 then
		if yyvs40 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs40")
			end
			create yyspecial_routines40
			yyvsc40 := yyInitial_yyvs_size
			yyvs40 := yyspecial_routines40.make (yyvsc40)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs40")
			end
			yyvsc40 := yyvsc40 + yyInitial_yyvs_size
			yyvs40 := yyspecial_routines40.resize (yyvs40, yyvsc40)
		end
	end
	yyvs40.put (yyval40, yyvsp40)
end
when 232 then
--|#line 1865 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1865")
end

			yyval19 := True
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp19 := yyvsp19 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp19 >= yyvsc19 then
		if yyvs19 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs19")
			end
			create yyspecial_routines19
			yyvsc19 := yyInitial_yyvs_size
			yyvs19 := yyspecial_routines19.make (yyvsc19)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs19")
			end
			yyvsc19 := yyvsc19 + yyInitial_yyvs_size
			yyvs19 := yyspecial_routines19.resize (yyvs19, yyvsc19)
		end
	end
	yyvs19.put (yyval19, yyvsp19)
end
when 233 then
--|#line 1869 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1869")
end

			yyval19 := False
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp19 := yyvsp19 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp19 >= yyvsc19 then
		if yyvs19 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs19")
			end
			create yyspecial_routines19
			yyvsc19 := yyInitial_yyvs_size
			yyvs19 := yyspecial_routines19.make (yyvsc19)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs19")
			end
			yyvsc19 := yyvsc19 + yyInitial_yyvs_size
			yyvs19 := yyspecial_routines19.resize (yyvs19, yyvsc19)
		end
	end
	yyvs19.put (yyval19, yyvsp19)
end
when 234 then
--|#line 1917 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1917")
end

			if valid_iso8601_date(yyvs2.item (yyvsp2)) then
				create yyval20.make_from_string(yyvs2.item (yyvsp2))
			else
				abort_with_error("VIDV", <<yyvs2.item (yyvsp2)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp20 := yyvsp20 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp20 >= yyvsc20 then
		if yyvs20 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs20")
			end
			create yyspecial_routines20
			yyvsc20 := yyInitial_yyvs_size
			yyvs20 := yyspecial_routines20.make (yyvsc20)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs20")
			end
			yyvsc20 := yyvsc20 + yyInitial_yyvs_size
			yyvs20 := yyspecial_routines20.resize (yyvs20, yyvsc20)
		end
	end
	yyvs20.put (yyval20, yyvsp20)
end
when 235 then
--|#line 1945 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1945")
end

			if yyvs20.item (yyvsp20 - 1) <= yyvs20.item (yyvsp20) then
				create date_interval.make_bounded(yyvs20.item (yyvsp20 - 1), yyvs20.item (yyvsp20), True, True)
				yyval42 := date_interval
			else
				abort_with_error("VIVLO", <<yyvs20.item (yyvsp20 - 1).out, yyvs20.item (yyvsp20).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp20 := yyvsp20 -2
	if yyvsp42 >= yyvsc42 then
		if yyvs42 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs42")
			end
			create yyspecial_routines42
			yyvsc42 := yyInitial_yyvs_size
			yyvs42 := yyspecial_routines42.make (yyvsc42)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs42")
			end
			yyvsc42 := yyvsc42 + yyInitial_yyvs_size
			yyvs42 := yyspecial_routines42.resize (yyvs42, yyvsc42)
		end
	end
	yyvs42.put (yyval42, yyvsp42)
end
when 236 then
--|#line 1954 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1954")
end

			if yyvs20.item (yyvsp20 - 1) <= yyvs20.item (yyvsp20) then
				create date_interval.make_bounded(yyvs20.item (yyvsp20 - 1), yyvs20.item (yyvsp20), False, True)
				yyval42 := date_interval
			else
				abort_with_error("VIVLO", <<yyvs20.item (yyvsp20 - 1).out, yyvs20.item (yyvsp20).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp20 := yyvsp20 -2
	if yyvsp42 >= yyvsc42 then
		if yyvs42 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs42")
			end
			create yyspecial_routines42
			yyvsc42 := yyInitial_yyvs_size
			yyvs42 := yyspecial_routines42.make (yyvsc42)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs42")
			end
			yyvsc42 := yyvsc42 + yyInitial_yyvs_size
			yyvs42 := yyspecial_routines42.resize (yyvs42, yyvsc42)
		end
	end
	yyvs42.put (yyval42, yyvsp42)
end
when 237 then
--|#line 1963 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1963")
end

			if yyvs20.item (yyvsp20 - 1) <= yyvs20.item (yyvsp20) then
				create date_interval.make_bounded(yyvs20.item (yyvsp20 - 1), yyvs20.item (yyvsp20), True, False)
				yyval42 := date_interval
			else
				abort_with_error("VIVLO", <<yyvs20.item (yyvsp20 - 1).out, yyvs20.item (yyvsp20).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp20 := yyvsp20 -2
	if yyvsp42 >= yyvsc42 then
		if yyvs42 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs42")
			end
			create yyspecial_routines42
			yyvsc42 := yyInitial_yyvs_size
			yyvs42 := yyspecial_routines42.make (yyvsc42)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs42")
			end
			yyvsc42 := yyvsc42 + yyInitial_yyvs_size
			yyvs42 := yyspecial_routines42.resize (yyvs42, yyvsc42)
		end
	end
	yyvs42.put (yyval42, yyvsp42)
end
when 238 then
--|#line 1972 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1972")
end

			if yyvs20.item (yyvsp20 - 1) <= yyvs20.item (yyvsp20) then
				create date_interval.make_bounded(yyvs20.item (yyvsp20 - 1), yyvs20.item (yyvsp20), False, False)
				yyval42 := date_interval
			else
				abort_with_error("VIVLO", <<yyvs20.item (yyvsp20 - 1).out, yyvs20.item (yyvsp20).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp20 := yyvsp20 -2
	if yyvsp42 >= yyvsc42 then
		if yyvs42 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs42")
			end
			create yyspecial_routines42
			yyvsc42 := yyInitial_yyvs_size
			yyvs42 := yyspecial_routines42.make (yyvsc42)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs42")
			end
			yyvsc42 := yyvsc42 + yyInitial_yyvs_size
			yyvs42 := yyspecial_routines42.resize (yyvs42, yyvsc42)
		end
	end
	yyvs42.put (yyval42, yyvsp42)
end
when 239 then
--|#line 1981 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1981")
end

			create date_interval.make_lower_unbounded(yyvs20.item (yyvsp20), False)
			yyval42 := date_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp20 := yyvsp20 -1
	if yyvsp42 >= yyvsc42 then
		if yyvs42 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs42")
			end
			create yyspecial_routines42
			yyvsc42 := yyInitial_yyvs_size
			yyvs42 := yyspecial_routines42.make (yyvsc42)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs42")
			end
			yyvsc42 := yyvsc42 + yyInitial_yyvs_size
			yyvs42 := yyspecial_routines42.resize (yyvs42, yyvsc42)
		end
	end
	yyvs42.put (yyval42, yyvsp42)
end
when 240 then
--|#line 1986 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1986")
end

			create date_interval.make_lower_unbounded(yyvs20.item (yyvsp20), True)
			yyval42 := date_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp20 := yyvsp20 -1
	if yyvsp42 >= yyvsc42 then
		if yyvs42 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs42")
			end
			create yyspecial_routines42
			yyvsc42 := yyInitial_yyvs_size
			yyvs42 := yyspecial_routines42.make (yyvsc42)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs42")
			end
			yyvsc42 := yyvsc42 + yyInitial_yyvs_size
			yyvs42 := yyspecial_routines42.resize (yyvs42, yyvsc42)
		end
	end
	yyvs42.put (yyval42, yyvsp42)
end
when 241 then
--|#line 1991 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1991")
end

			create date_interval.make_upper_unbounded(yyvs20.item (yyvsp20), False)
			yyval42 := date_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp20 := yyvsp20 -1
	if yyvsp42 >= yyvsc42 then
		if yyvs42 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs42")
			end
			create yyspecial_routines42
			yyvsc42 := yyInitial_yyvs_size
			yyvs42 := yyspecial_routines42.make (yyvsc42)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs42")
			end
			yyvsc42 := yyvsc42 + yyInitial_yyvs_size
			yyvs42 := yyspecial_routines42.resize (yyvs42, yyvsc42)
		end
	end
	yyvs42.put (yyval42, yyvsp42)
end
when 242 then
--|#line 1996 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1996")
end

			create date_interval.make_upper_unbounded(yyvs20.item (yyvsp20), True)
			yyval42 := date_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp20 := yyvsp20 -1
	if yyvsp42 >= yyvsc42 then
		if yyvs42 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs42")
			end
			create yyspecial_routines42
			yyvsc42 := yyInitial_yyvs_size
			yyvs42 := yyspecial_routines42.make (yyvsc42)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs42")
			end
			yyvsc42 := yyvsc42 + yyInitial_yyvs_size
			yyvs42 := yyspecial_routines42.resize (yyvs42, yyvsc42)
		end
	end
	yyvs42.put (yyval42, yyvsp42)
end
when 243 then
--|#line 2001 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2001")
end

			create date_interval.make_point(yyvs20.item (yyvsp20))
			yyval42 := date_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp20 := yyvsp20 -1
	if yyvsp42 >= yyvsc42 then
		if yyvs42 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs42")
			end
			create yyspecial_routines42
			yyvsc42 := yyInitial_yyvs_size
			yyvs42 := yyspecial_routines42.make (yyvsc42)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs42")
			end
			yyvsc42 := yyvsc42 + yyInitial_yyvs_size
			yyvs42 := yyspecial_routines42.resize (yyvs42, yyvsc42)
		end
	end
	yyvs42.put (yyval42, yyvsp42)
end
when 244 then
--|#line 2008 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2008")
end

			if valid_iso8601_time(yyvs2.item (yyvsp2)) then
				create yyval22.make_from_string(yyvs2.item (yyvsp2))
			else
				abort_with_error("VITV", <<yyvs2.item (yyvsp2)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp22 := yyvsp22 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp22 >= yyvsc22 then
		if yyvs22 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs22")
			end
			create yyspecial_routines22
			yyvsc22 := yyInitial_yyvs_size
			yyvs22 := yyspecial_routines22.make (yyvsc22)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs22")
			end
			yyvsc22 := yyvsc22 + yyInitial_yyvs_size
			yyvs22 := yyspecial_routines22.resize (yyvs22, yyvsc22)
		end
	end
	yyvs22.put (yyval22, yyvsp22)
end
when 245 then
--|#line 2036 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2036")
end

			if yyvs22.item (yyvsp22 - 1) <= yyvs22.item (yyvsp22) then
				create time_interval.make_bounded(yyvs22.item (yyvsp22 - 1), yyvs22.item (yyvsp22), True, True)
				yyval41 := time_interval
			else
				abort_with_error("VIVLO", <<yyvs22.item (yyvsp22 - 1).out, yyvs22.item (yyvsp22).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp22 := yyvsp22 -2
	if yyvsp41 >= yyvsc41 then
		if yyvs41 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs41")
			end
			create yyspecial_routines41
			yyvsc41 := yyInitial_yyvs_size
			yyvs41 := yyspecial_routines41.make (yyvsc41)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs41")
			end
			yyvsc41 := yyvsc41 + yyInitial_yyvs_size
			yyvs41 := yyspecial_routines41.resize (yyvs41, yyvsc41)
		end
	end
	yyvs41.put (yyval41, yyvsp41)
end
when 246 then
--|#line 2045 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2045")
end

			if yyvs22.item (yyvsp22 - 1) <= yyvs22.item (yyvsp22) then
				create time_interval.make_bounded(yyvs22.item (yyvsp22 - 1), yyvs22.item (yyvsp22), False, True)
				yyval41 := time_interval
			else
				abort_with_error("VIVLO", <<yyvs22.item (yyvsp22 - 1).out, yyvs22.item (yyvsp22).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp22 := yyvsp22 -2
	if yyvsp41 >= yyvsc41 then
		if yyvs41 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs41")
			end
			create yyspecial_routines41
			yyvsc41 := yyInitial_yyvs_size
			yyvs41 := yyspecial_routines41.make (yyvsc41)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs41")
			end
			yyvsc41 := yyvsc41 + yyInitial_yyvs_size
			yyvs41 := yyspecial_routines41.resize (yyvs41, yyvsc41)
		end
	end
	yyvs41.put (yyval41, yyvsp41)
end
when 247 then
--|#line 2054 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2054")
end

			if yyvs22.item (yyvsp22 - 1) <= yyvs22.item (yyvsp22) then
				create time_interval.make_bounded(yyvs22.item (yyvsp22 - 1), yyvs22.item (yyvsp22), True, False)
				yyval41 := time_interval
			else
				abort_with_error("VIVLO", <<yyvs22.item (yyvsp22 - 1).out, yyvs22.item (yyvsp22).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp22 := yyvsp22 -2
	if yyvsp41 >= yyvsc41 then
		if yyvs41 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs41")
			end
			create yyspecial_routines41
			yyvsc41 := yyInitial_yyvs_size
			yyvs41 := yyspecial_routines41.make (yyvsc41)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs41")
			end
			yyvsc41 := yyvsc41 + yyInitial_yyvs_size
			yyvs41 := yyspecial_routines41.resize (yyvs41, yyvsc41)
		end
	end
	yyvs41.put (yyval41, yyvsp41)
end
when 248 then
--|#line 2063 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2063")
end

			if yyvs22.item (yyvsp22 - 1) <= yyvs22.item (yyvsp22) then
				create time_interval.make_bounded(yyvs22.item (yyvsp22 - 1), yyvs22.item (yyvsp22), False, False)
				yyval41 := time_interval
			else
				abort_with_error("VIVLO", <<yyvs22.item (yyvsp22 - 1).out, yyvs22.item (yyvsp22).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp22 := yyvsp22 -2
	if yyvsp41 >= yyvsc41 then
		if yyvs41 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs41")
			end
			create yyspecial_routines41
			yyvsc41 := yyInitial_yyvs_size
			yyvs41 := yyspecial_routines41.make (yyvsc41)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs41")
			end
			yyvsc41 := yyvsc41 + yyInitial_yyvs_size
			yyvs41 := yyspecial_routines41.resize (yyvs41, yyvsc41)
		end
	end
	yyvs41.put (yyval41, yyvsp41)
end
when 249 then
--|#line 2072 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2072")
end

			create time_interval.make_lower_unbounded(yyvs22.item (yyvsp22), False)
			yyval41 := time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp22 := yyvsp22 -1
	if yyvsp41 >= yyvsc41 then
		if yyvs41 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs41")
			end
			create yyspecial_routines41
			yyvsc41 := yyInitial_yyvs_size
			yyvs41 := yyspecial_routines41.make (yyvsc41)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs41")
			end
			yyvsc41 := yyvsc41 + yyInitial_yyvs_size
			yyvs41 := yyspecial_routines41.resize (yyvs41, yyvsc41)
		end
	end
	yyvs41.put (yyval41, yyvsp41)
end
when 250 then
--|#line 2077 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2077")
end

			create time_interval.make_lower_unbounded(yyvs22.item (yyvsp22), True)
			yyval41 := time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp22 := yyvsp22 -1
	if yyvsp41 >= yyvsc41 then
		if yyvs41 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs41")
			end
			create yyspecial_routines41
			yyvsc41 := yyInitial_yyvs_size
			yyvs41 := yyspecial_routines41.make (yyvsc41)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs41")
			end
			yyvsc41 := yyvsc41 + yyInitial_yyvs_size
			yyvs41 := yyspecial_routines41.resize (yyvs41, yyvsc41)
		end
	end
	yyvs41.put (yyval41, yyvsp41)
end
when 251 then
--|#line 2082 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2082")
end

			create time_interval.make_upper_unbounded(yyvs22.item (yyvsp22), False)
			yyval41 := time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp22 := yyvsp22 -1
	if yyvsp41 >= yyvsc41 then
		if yyvs41 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs41")
			end
			create yyspecial_routines41
			yyvsc41 := yyInitial_yyvs_size
			yyvs41 := yyspecial_routines41.make (yyvsc41)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs41")
			end
			yyvsc41 := yyvsc41 + yyInitial_yyvs_size
			yyvs41 := yyspecial_routines41.resize (yyvs41, yyvsc41)
		end
	end
	yyvs41.put (yyval41, yyvsp41)
end
when 252 then
--|#line 2087 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2087")
end

			create time_interval.make_upper_unbounded(yyvs22.item (yyvsp22), True)
			yyval41 := time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp22 := yyvsp22 -1
	if yyvsp41 >= yyvsc41 then
		if yyvs41 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs41")
			end
			create yyspecial_routines41
			yyvsc41 := yyInitial_yyvs_size
			yyvs41 := yyspecial_routines41.make (yyvsc41)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs41")
			end
			yyvsc41 := yyvsc41 + yyInitial_yyvs_size
			yyvs41 := yyspecial_routines41.resize (yyvs41, yyvsc41)
		end
	end
	yyvs41.put (yyval41, yyvsp41)
end
when 253 then
--|#line 2092 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2092")
end

			create time_interval.make_point(yyvs22.item (yyvsp22))
			yyval41 := time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp22 := yyvsp22 -1
	if yyvsp41 >= yyvsc41 then
		if yyvs41 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs41")
			end
			create yyspecial_routines41
			yyvsc41 := yyInitial_yyvs_size
			yyvs41 := yyspecial_routines41.make (yyvsc41)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs41")
			end
			yyvsc41 := yyvsc41 + yyInitial_yyvs_size
			yyvs41 := yyspecial_routines41.resize (yyvs41, yyvsc41)
		end
	end
	yyvs41.put (yyval41, yyvsp41)
end
when 254 then
--|#line 2099 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2099")
end

			if valid_iso8601_date_time(yyvs2.item (yyvsp2)) then
				create yyval21.make_from_string(yyvs2.item (yyvsp2))
			else
				abort_with_error("VIDTV", <<yyvs2.item (yyvsp2)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp21 := yyvsp21 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp21 >= yyvsc21 then
		if yyvs21 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs21")
			end
			create yyspecial_routines21
			yyvsc21 := yyInitial_yyvs_size
			yyvs21 := yyspecial_routines21.make (yyvsc21)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs21")
			end
			yyvsc21 := yyvsc21 + yyInitial_yyvs_size
			yyvs21 := yyspecial_routines21.resize (yyvs21, yyvsc21)
		end
	end
	yyvs21.put (yyval21, yyvsp21)
end
when 255 then
--|#line 2127 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2127")
end

			if yyvs21.item (yyvsp21 - 1) <= yyvs21.item (yyvsp21) then
				create date_time_interval.make_bounded(yyvs21.item (yyvsp21 - 1), yyvs21.item (yyvsp21), True, True)
				yyval43 := date_time_interval
			else
				abort_with_error("VIVLO", <<yyvs21.item (yyvsp21 - 1).out, yyvs21.item (yyvsp21).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp43 := yyvsp43 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp21 := yyvsp21 -2
	if yyvsp43 >= yyvsc43 then
		if yyvs43 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs43")
			end
			create yyspecial_routines43
			yyvsc43 := yyInitial_yyvs_size
			yyvs43 := yyspecial_routines43.make (yyvsc43)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs43")
			end
			yyvsc43 := yyvsc43 + yyInitial_yyvs_size
			yyvs43 := yyspecial_routines43.resize (yyvs43, yyvsc43)
		end
	end
	yyvs43.put (yyval43, yyvsp43)
end
when 256 then
--|#line 2136 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2136")
end

			if yyvs21.item (yyvsp21 - 1) <= yyvs21.item (yyvsp21) then
				create date_time_interval.make_bounded(yyvs21.item (yyvsp21 - 1), yyvs21.item (yyvsp21), False, True)
				yyval43 := date_time_interval
			else
				abort_with_error("VIVLO", <<yyvs21.item (yyvsp21 - 1).out, yyvs21.item (yyvsp21).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp43 := yyvsp43 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp21 := yyvsp21 -2
	if yyvsp43 >= yyvsc43 then
		if yyvs43 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs43")
			end
			create yyspecial_routines43
			yyvsc43 := yyInitial_yyvs_size
			yyvs43 := yyspecial_routines43.make (yyvsc43)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs43")
			end
			yyvsc43 := yyvsc43 + yyInitial_yyvs_size
			yyvs43 := yyspecial_routines43.resize (yyvs43, yyvsc43)
		end
	end
	yyvs43.put (yyval43, yyvsp43)
end
when 257 then
--|#line 2145 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2145")
end

			if yyvs21.item (yyvsp21 - 1) <= yyvs21.item (yyvsp21) then
				create date_time_interval.make_bounded(yyvs21.item (yyvsp21 - 1), yyvs21.item (yyvsp21), True, False)
				yyval43 := date_time_interval
			else
				abort_with_error("VIVLO", <<yyvs21.item (yyvsp21 - 1).out, yyvs21.item (yyvsp21).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp43 := yyvsp43 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp21 := yyvsp21 -2
	if yyvsp43 >= yyvsc43 then
		if yyvs43 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs43")
			end
			create yyspecial_routines43
			yyvsc43 := yyInitial_yyvs_size
			yyvs43 := yyspecial_routines43.make (yyvsc43)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs43")
			end
			yyvsc43 := yyvsc43 + yyInitial_yyvs_size
			yyvs43 := yyspecial_routines43.resize (yyvs43, yyvsc43)
		end
	end
	yyvs43.put (yyval43, yyvsp43)
end
when 258 then
--|#line 2154 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2154")
end

			if yyvs21.item (yyvsp21 - 1) <= yyvs21.item (yyvsp21) then
				create date_time_interval.make_bounded(yyvs21.item (yyvsp21 - 1), yyvs21.item (yyvsp21), False, False)
				yyval43 := date_time_interval
			else
				abort_with_error("VIVLO", <<yyvs21.item (yyvsp21 - 1).out, yyvs21.item (yyvsp21).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp43 := yyvsp43 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp21 := yyvsp21 -2
	if yyvsp43 >= yyvsc43 then
		if yyvs43 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs43")
			end
			create yyspecial_routines43
			yyvsc43 := yyInitial_yyvs_size
			yyvs43 := yyspecial_routines43.make (yyvsc43)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs43")
			end
			yyvsc43 := yyvsc43 + yyInitial_yyvs_size
			yyvs43 := yyspecial_routines43.resize (yyvs43, yyvsc43)
		end
	end
	yyvs43.put (yyval43, yyvsp43)
end
when 259 then
--|#line 2163 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2163")
end

			create date_time_interval.make_lower_unbounded(yyvs21.item (yyvsp21), False)
			yyval43 := date_time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp43 := yyvsp43 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp21 := yyvsp21 -1
	if yyvsp43 >= yyvsc43 then
		if yyvs43 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs43")
			end
			create yyspecial_routines43
			yyvsc43 := yyInitial_yyvs_size
			yyvs43 := yyspecial_routines43.make (yyvsc43)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs43")
			end
			yyvsc43 := yyvsc43 + yyInitial_yyvs_size
			yyvs43 := yyspecial_routines43.resize (yyvs43, yyvsc43)
		end
	end
	yyvs43.put (yyval43, yyvsp43)
end
when 260 then
--|#line 2168 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2168")
end

			create date_time_interval.make_lower_unbounded(yyvs21.item (yyvsp21), True)
			yyval43 := date_time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp43 := yyvsp43 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp21 := yyvsp21 -1
	if yyvsp43 >= yyvsc43 then
		if yyvs43 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs43")
			end
			create yyspecial_routines43
			yyvsc43 := yyInitial_yyvs_size
			yyvs43 := yyspecial_routines43.make (yyvsc43)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs43")
			end
			yyvsc43 := yyvsc43 + yyInitial_yyvs_size
			yyvs43 := yyspecial_routines43.resize (yyvs43, yyvsc43)
		end
	end
	yyvs43.put (yyval43, yyvsp43)
end
when 261 then
--|#line 2173 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2173")
end

			create date_time_interval.make_upper_unbounded(yyvs21.item (yyvsp21), False)
			yyval43 := date_time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp43 := yyvsp43 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp21 := yyvsp21 -1
	if yyvsp43 >= yyvsc43 then
		if yyvs43 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs43")
			end
			create yyspecial_routines43
			yyvsc43 := yyInitial_yyvs_size
			yyvs43 := yyspecial_routines43.make (yyvsc43)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs43")
			end
			yyvsc43 := yyvsc43 + yyInitial_yyvs_size
			yyvs43 := yyspecial_routines43.resize (yyvs43, yyvsc43)
		end
	end
	yyvs43.put (yyval43, yyvsp43)
end
when 262 then
--|#line 2178 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2178")
end

			create date_time_interval.make_upper_unbounded(yyvs21.item (yyvsp21), True)
			yyval43 := date_time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp43 := yyvsp43 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp21 := yyvsp21 -1
	if yyvsp43 >= yyvsc43 then
		if yyvs43 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs43")
			end
			create yyspecial_routines43
			yyvsc43 := yyInitial_yyvs_size
			yyvs43 := yyspecial_routines43.make (yyvsc43)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs43")
			end
			yyvsc43 := yyvsc43 + yyInitial_yyvs_size
			yyvs43 := yyspecial_routines43.resize (yyvs43, yyvsc43)
		end
	end
	yyvs43.put (yyval43, yyvsp43)
end
when 263 then
--|#line 2183 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2183")
end

			create date_time_interval.make_point(yyvs21.item (yyvsp21))
			yyval43 := date_time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp43 := yyvsp43 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp21 := yyvsp21 -1
	if yyvsp43 >= yyvsc43 then
		if yyvs43 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs43")
			end
			create yyspecial_routines43
			yyvsc43 := yyInitial_yyvs_size
			yyvs43 := yyspecial_routines43.make (yyvsc43)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs43")
			end
			yyvsc43 := yyvsc43 + yyInitial_yyvs_size
			yyvs43 := yyspecial_routines43.resize (yyvs43, yyvsc43)
		end
	end
	yyvs43.put (yyval43, yyvsp43)
end
when 264 then
--|#line 2190 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2190")
end

			if valid_iso8601_duration(yyvs2.item (yyvsp2)) then
				create yyval23.make_from_string(yyvs2.item (yyvsp2))
			else
				abort_with_error("VIDUV", <<yyvs2.item (yyvsp2)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp23 := yyvsp23 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp23 >= yyvsc23 then
		if yyvs23 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs23")
			end
			create yyspecial_routines23
			yyvsc23 := yyInitial_yyvs_size
			yyvs23 := yyspecial_routines23.make (yyvsc23)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs23")
			end
			yyvsc23 := yyvsc23 + yyInitial_yyvs_size
			yyvs23 := yyspecial_routines23.resize (yyvs23, yyvsc23)
		end
	end
	yyvs23.put (yyval23, yyvsp23)
end
when 265 then
--|#line 2218 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2218")
end

			if yyvs23.item (yyvsp23 - 1) <= yyvs23.item (yyvsp23) then
				create duration_interval.make_bounded(yyvs23.item (yyvsp23 - 1), yyvs23.item (yyvsp23), True, True)
				yyval44 := duration_interval
			else
				abort_with_error("VIVLO", <<yyvs23.item (yyvsp23 - 1).out, yyvs23.item (yyvsp23).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp44 := yyvsp44 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp23 := yyvsp23 -2
	if yyvsp44 >= yyvsc44 then
		if yyvs44 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs44")
			end
			create yyspecial_routines44
			yyvsc44 := yyInitial_yyvs_size
			yyvs44 := yyspecial_routines44.make (yyvsc44)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs44")
			end
			yyvsc44 := yyvsc44 + yyInitial_yyvs_size
			yyvs44 := yyspecial_routines44.resize (yyvs44, yyvsc44)
		end
	end
	yyvs44.put (yyval44, yyvsp44)
end
when 266 then
--|#line 2227 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2227")
end

			if yyvs23.item (yyvsp23 - 1) <= yyvs23.item (yyvsp23) then
				create duration_interval.make_bounded(yyvs23.item (yyvsp23 - 1), yyvs23.item (yyvsp23), False, True)
				yyval44 := duration_interval
			else
				abort_with_error("VIVLO", <<yyvs23.item (yyvsp23 - 1).out, yyvs23.item (yyvsp23).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp44 := yyvsp44 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp23 := yyvsp23 -2
	if yyvsp44 >= yyvsc44 then
		if yyvs44 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs44")
			end
			create yyspecial_routines44
			yyvsc44 := yyInitial_yyvs_size
			yyvs44 := yyspecial_routines44.make (yyvsc44)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs44")
			end
			yyvsc44 := yyvsc44 + yyInitial_yyvs_size
			yyvs44 := yyspecial_routines44.resize (yyvs44, yyvsc44)
		end
	end
	yyvs44.put (yyval44, yyvsp44)
end
when 267 then
--|#line 2236 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2236")
end

			if yyvs23.item (yyvsp23 - 1) <= yyvs23.item (yyvsp23) then
				create duration_interval.make_bounded(yyvs23.item (yyvsp23 - 1), yyvs23.item (yyvsp23), True, False)
				yyval44 := duration_interval
			else
				abort_with_error("VIVLO", <<yyvs23.item (yyvsp23 - 1).out, yyvs23.item (yyvsp23).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp44 := yyvsp44 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp23 := yyvsp23 -2
	if yyvsp44 >= yyvsc44 then
		if yyvs44 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs44")
			end
			create yyspecial_routines44
			yyvsc44 := yyInitial_yyvs_size
			yyvs44 := yyspecial_routines44.make (yyvsc44)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs44")
			end
			yyvsc44 := yyvsc44 + yyInitial_yyvs_size
			yyvs44 := yyspecial_routines44.resize (yyvs44, yyvsc44)
		end
	end
	yyvs44.put (yyval44, yyvsp44)
end
when 268 then
--|#line 2245 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2245")
end

			if yyvs23.item (yyvsp23 - 1) <= yyvs23.item (yyvsp23) then
				create duration_interval.make_bounded(yyvs23.item (yyvsp23 - 1), yyvs23.item (yyvsp23), False, False)
				yyval44 := duration_interval
			else
				abort_with_error("VIVLO", <<yyvs23.item (yyvsp23 - 1).out, yyvs23.item (yyvsp23).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp44 := yyvsp44 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp23 := yyvsp23 -2
	if yyvsp44 >= yyvsc44 then
		if yyvs44 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs44")
			end
			create yyspecial_routines44
			yyvsc44 := yyInitial_yyvs_size
			yyvs44 := yyspecial_routines44.make (yyvsc44)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs44")
			end
			yyvsc44 := yyvsc44 + yyInitial_yyvs_size
			yyvs44 := yyspecial_routines44.resize (yyvs44, yyvsc44)
		end
	end
	yyvs44.put (yyval44, yyvsp44)
end
when 269 then
--|#line 2254 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2254")
end

			create duration_interval.make_lower_unbounded(yyvs23.item (yyvsp23), False)
			yyval44 := duration_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp44 := yyvsp44 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp23 := yyvsp23 -1
	if yyvsp44 >= yyvsc44 then
		if yyvs44 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs44")
			end
			create yyspecial_routines44
			yyvsc44 := yyInitial_yyvs_size
			yyvs44 := yyspecial_routines44.make (yyvsc44)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs44")
			end
			yyvsc44 := yyvsc44 + yyInitial_yyvs_size
			yyvs44 := yyspecial_routines44.resize (yyvs44, yyvsc44)
		end
	end
	yyvs44.put (yyval44, yyvsp44)
end
when 270 then
--|#line 2259 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2259")
end

			create duration_interval.make_lower_unbounded(yyvs23.item (yyvsp23), True)
			yyval44 := duration_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp44 := yyvsp44 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp23 := yyvsp23 -1
	if yyvsp44 >= yyvsc44 then
		if yyvs44 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs44")
			end
			create yyspecial_routines44
			yyvsc44 := yyInitial_yyvs_size
			yyvs44 := yyspecial_routines44.make (yyvsc44)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs44")
			end
			yyvsc44 := yyvsc44 + yyInitial_yyvs_size
			yyvs44 := yyspecial_routines44.resize (yyvs44, yyvsc44)
		end
	end
	yyvs44.put (yyval44, yyvsp44)
end
when 271 then
--|#line 2264 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2264")
end

			create duration_interval.make_upper_unbounded(yyvs23.item (yyvsp23), False)
			yyval44 := duration_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp44 := yyvsp44 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp23 := yyvsp23 -1
	if yyvsp44 >= yyvsc44 then
		if yyvs44 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs44")
			end
			create yyspecial_routines44
			yyvsc44 := yyInitial_yyvs_size
			yyvs44 := yyspecial_routines44.make (yyvsc44)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs44")
			end
			yyvsc44 := yyvsc44 + yyInitial_yyvs_size
			yyvs44 := yyspecial_routines44.resize (yyvs44, yyvsc44)
		end
	end
	yyvs44.put (yyval44, yyvsp44)
end
when 272 then
--|#line 2269 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2269")
end

			create duration_interval.make_upper_unbounded(yyvs23.item (yyvsp23), True)
			yyval44 := duration_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp44 := yyvsp44 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp23 := yyvsp23 -1
	if yyvsp44 >= yyvsc44 then
		if yyvs44 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs44")
			end
			create yyspecial_routines44
			yyvsc44 := yyInitial_yyvs_size
			yyvs44 := yyspecial_routines44.make (yyvsc44)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs44")
			end
			yyvsc44 := yyvsc44 + yyInitial_yyvs_size
			yyvs44 := yyspecial_routines44.resize (yyvs44, yyvsc44)
		end
	end
	yyvs44.put (yyval44, yyvsp44)
end
when 273 then
--|#line 2274 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2274")
end

			create duration_interval.make_point(yyvs23.item (yyvsp23))
			yyval44 := duration_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp44 := yyvsp44 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp23 := yyvsp23 -1
	if yyvsp44 >= yyvsc44 then
		if yyvs44 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs44")
			end
			create yyspecial_routines44
			yyvsc44 := yyInitial_yyvs_size
			yyvs44 := yyspecial_routines44.make (yyvsc44)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs44")
			end
			yyvsc44 := yyvsc44 + yyInitial_yyvs_size
			yyvs44 := yyspecial_routines44.resize (yyvs44, yyvsc44)
		end
	end
	yyvs44.put (yyval44, yyvsp44)
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
			when 480 then
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
			   85,   86,   75,   73,   83,   74,    2,   76,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,   84,   87,
			    2,   70,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,   81,    2,   82,   79,    2,    2,    2,    2,    2,

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
			   25,   26,   27,   28,   29,   30,   31,   32,   33,   34,
			   35,   36,   37,   38,   39,   40,   41,   42,   43,   44,

			   45,   46,   47,   48,   49,   50,   51,   52,   53,   54,
			   55,   56,   57,   58,   59,   60,   61,   62,   63,   64,
			   65,   66,   67,   68,   69,   71,   72,   77,   78,   80, yyDummy>>)
		end

	yyr1_template: SPECIAL [INTEGER]
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,  132,  132,  132,  133,  133,  134,  136,  136,  136,
			   94,   94,  135,  135,  139,  139,  139,  139,  139,  139,
			  139,  139,  139,  139,  139,   91,   91,   91,   92,   92,
			  144,  144,  140,  140,  145,  146,  146,  146,  146,  146,
			  146,  146,  102,  103,  103,  103,  103,  103,  103,  103,
			  103,  137,  138,  138,  154,  154,  154,  155,  155,  156,
			  156,  156,   89,   89,   90,   90,   88,   88,  157,  157,
			  157,  104,  104,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  106,  106,  106,
			  107,  107,  108,  108,  108,  108,  108,  109,  109,  109,

			  109,   95,   95,   95,   96,   96,  122,  122,  122,   99,
			   99,  101,  101,  110,  110,  158,  158,  158,  158,  158,
			  158,  158,  158,   97,   97,   98,   98,   98,  100,  100,
			  159,  159,  159,  147,  147,  147,  160,  160,  160,  148,
			  148,  148,  111,  111,  111,  112,  112,  112,  161,  161,
			  161,  149,  149,  149,  162,  162,  162,  150,  150,  150,
			  163,  163,  163,  163,  164,  151,  151,  151,  165,  165,
			  165,  165,  152,  152,  152,  166,  166,  166,  166,  153,
			  153,  153,  143,  143,  143,  167,  167,  168,  142,  142,
			  141,  120,  120,   93,   93,   93,   93,  121,  123,  123,

			  123,  123,  113,  113,  113,  124,  124,  124,  126,  126,
			  126,  126,  126,  126,  126,  126,  126,  114,  114,  114,
			  125,  125,  125,  127,  127,  127,  127,  127,  127,  127,
			  127,  127,  115,  115,  116,  129,  129,  129,  129,  129,
			  129,  129,  129,  129,  118,  128,  128,  128,  128,  128,
			  128,  128,  128,  128,  117,  130,  130,  130,  130,  130,
			  130,  130,  130,  130,  119,  131,  131,  131,  131,  131,
			  131,  131,  131,  131, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    2,    2,    2,    4,    3,    1,    8,    2,   11,
			   12,   12,   16,   16,   16,   16,   16,   16,    3,    4,
			    2,   26,    1,    1,    1,    1,    1,    2,    2,    2,
			   16,   16,    1,   16,   12,    4,    3,    4,    3,    2,
			    2,    1,   12,    1,    2,    2,    1,    2,    1,    2,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,   13,    1,    1,    1,    1,    2,    2,   12,   26,
			    1,   16,   16,   16,   16,    1,   16,   16,   16,   16,

			   16,   16,   16,   16,   16,   16,   16,    1,   16,    1,
			    1,    1,    1,    1,    1,    1,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,   15,   18,   18,    3,
			    4,   20,   21,   22,   23,   27,   28,   29,   39,   40,
			   41,   42,   43,   44,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,   16,
			    1,    2,   12,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    3,    4,   20,   21,   22,
			   23,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,   13,   13,

			    1,    1,    1,    1,    1,    1,    3,    3,   13,    3,
			    1,    1,    3,    4,   20,   21,   22,   23,    3,    4,
			   20,   21,   22,   23,    3,    4,   20,   21,   22,   23,
			    3,    4,   20,   21,   22,   23,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    1,   20,    1,    3,    1,    1,    1,    4,    1,    2,
			    3,    4,    1,    3,    1,    4,    1,   22,    1,   21,
			    1,   23,    1,   44,    2,    1,    2,    1,    1,    1,
			   19,    1,    1,   17,   17,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    3,
			    1,    4,    1,   20,    1,   21,    1,   22,    1,   23,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    6,    2,    2,    2,    1,    9,   10,    2,   11,   14,
			   15,    3,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    3,    1,    3,    1,    4,
			    1,   20,    1,   21,    1,   22,    1,   23,    3,    1,
			    4,    1,   20,    1,   21,    1,   22,    1,   23,    1,
			    3,   13,    1,    2,    1,    2,    2,    1,    1,    1,

			   13,    1,   13,    1,    1,    1,    1,    1,    3,    1,
			    4,    1,   20,    1,   21,    1,   22,    1,   23,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,   13,    1,
			    2,    1,    1,    2,    1,    1,    2,    2,   12,    1,
			    1,    3,    3,    1,    1,    1,    1,    1,    1,    1,
			    3,    1,    1,    1,    2,    2,    2,    1,    8,    1,
			    1,    1,    1,    1,    8,    1,    8,    1,    1,    1,
			    2,   13,    8,    1,    1,    1,    1,    1,    1,   13,
			    1,    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER]
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    2,    3,    4,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    5,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    6,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER]
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    0,    0,    0,  101,    0,    0,    0,    0,    0,   89,
			   88,  192,  196,  195,  217,  202,    3,    2,  191,    0,
			  100,    0,   69,   72,   71,    0,   91,   90,   98,   99,
			    0,  104,    1,    5,  125,   66,    0,  108,    0,    0,
			    0,    0,    0,   76,  102,  219,  204,  218,  203,   11,
			   10,   74,   73,    0,  106,  191,   67,    8,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    6,  194,  193,   87,   97,    0,    9,  103,  105,
			    0,   83,   85,   84,   86,    0,   96,   95,   94,   93,

			   92,   80,   79,   77,   78,   81,   82,   70,   68,    0,
			    0,  127,  107,  176,  175,    0,  164,  142,  148,  154,
			  264,  254,  244,  234,  171,  168,    0,  145,   45,  130,
			  136,  143,  155,  149,  162,  169,  131,  137,  132,  138,
			  150,  144,  156,  163,   43,   44,   46,   47,   48,   49,
			   50,  133,  139,  151,  157,  165,  160,  172,  179,    0,
			   51,  109,  109,    0,   12,   13,   52,   55,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,   75,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  113,  113,

			    4,   53,    0,  124,    0,    0,  202,  128,    0,  123,
			  178,  177,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  216,    0,  231,
			    0,  243,    0,  263,    0,  253,    0,  273,  201,  198,
			  147,  146,  207,  205,    0,    0,  222,  220,  200,  199,
			  206,  221,  135,  134,  141,  140,  153,  152,  159,  158,
			  167,  166,    0,  161,  197,  174,  173,  233,  232,  181,
			  180,    0,    0,   57,   58,    0,    0,  126,    0,  214,
			    0,  229,    0,  241,    0,  261,    0,  251,    0,  271,

			  212,  227,  239,  259,  249,  269,  213,  228,  240,  260,
			  250,  270,  215,  230,  242,  262,  252,  272,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,   23,    0,    0,    0,
			   22,  188,  189,  190,   24,   15,   16,    7,    0,   21,
			   42,  130,   14,   61,   59,   17,   18,   19,   20,  125,
			   33,  125,    0,  182,  185,  129,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  208,
			    0,  223,    0,  235,    0,  255,    0,  245,    0,  265,
			  111,    0,    0,    0,   41,   35,    0,   56,    0,    0,

			    0,    0,   34,   54,   24,   60,    0,    0,    0,  209,
			    0,  224,    0,  236,    0,  256,    0,  246,    0,  266,
			  210,  225,  237,  257,  247,  267,    0,  110,  115,    0,
			   31,   29,   39,   37,    0,   27,   36,  187,   28,   62,
			  184,  183,    0,  186,  211,  226,  238,  258,  248,  268,
			  112,    0,  114,   40,    0,    0,   38,    0,   64,  118,
			  116,  117,    0,  125,   63,    0,    0,    0,    0,    0,
			    0,   25,   65,   32,  121,  122,  119,  120,  125,   26,
			    0,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			   17,  458,  466,  345,  346,   55,  348,   20,   21,  207,
			   81,  198,  208,  391,  349,  350,   22,   23,   24,   25,
			   26,   27,  283,  127,  128,   28,   29,  280,  131,  132,
			  133,  134,   30,  276,   31,  135,  136,  137,  138,  139,
			  140,  141,  142,  143,  480,  352,   33,  163,   34,  164,
			  165,  354,  355,  356,  357,  358,  359,  360,  361,  144,
			  145,  146,  147,  148,  149,  150,  166,  167,  362,   35,
			  429,  151,  152,  153,  154,  155,  156,  157,  158,  363,
			  364, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			  171,  654,  139,  627,  319,  310,  635,  630,   30, -32768,
			 -32768,  119, -32768, -32768, -32768, -32768, -32768,  621,  444,   16,
			  230,  -31,  493, -32768, -32768,  683, -32768, -32768, -32768, -32768,
			  557, -32768, -32768,  588,  -23, -32768,  667,   17,  554,  553,
			  232,  357,  667, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768,  230,  634, -32768, -32768, -32768, -32768,  254,  624,
			  627,  627,  594,  667,  667,  667,  667,   48,   48,   48,
			   48,   48,   48,   48,   48,   48,   48,   48,  478,  582,
			   15, -32768, -32768, -32768, -32768, -32768,  552, -32768, -32768, -32768,
			  312, -32768,  539,  539,  320,   48, -32768, -32768, -32768, -32768,

			 -32768,  344,  344,  344,  344,  344,  344, -32768,  493,  173,
			  574, -32768, -32768,  550,  549,  703, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768,  548,  556,  513, -32768,  547,
			  537, -32768, -32768, -32768, -32768,  536,  512,  511, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768,  503,  502,  501,  500,  499,  507,  498,  494,  429,
			 -32768,  542,  -26,  551, -32768,   32, -32768,  528,   79,  545,
			  541,  272,  272,  272,  272,  370,  366,  351,  349,  322,
			  282,  248, -32768,  155,  160,  211,  140,  156,  181,   55,
			  141,   24,   31,  161,  538,   36,  263,  527,  530,  530,

			 -32768, -32768,  540, -32768,  562,  560,  519, -32768,  529, -32768,
			 -32768, -32768,  279,  267,  243,  242,  237,    3,  526,  525,
			  523,  517,  515,  505,  504,  497,  496,  491,  490,  486,
			  483,  482,  481,  477,  469,  468,  164, -32768,  179, -32768,
			  114, -32768,  123, -32768,  121, -32768,  126, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768,  488,  479, -32768, -32768,  352, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768,  236, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768,  454,  442, -32768, -32768,  592,   92, -32768,   63, -32768,
			  169, -32768,   -5, -32768,  -13, -32768,  120, -32768,    9, -32768,

			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  156,  450,
			  181,  448,  406,  447,  415,  443,  403,  441,  394,  431,
			  394,  394,  394,  394,  456,  426, -32768,   16,    4,   16,
			 -32768, -32768, -32768, -32768,  424, -32768, -32768,  434,   20, -32768,
			 -32768,   47, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  -23,
			  392,  -23,  518,  -45, -32768, -32768,  156,  411,  181,  410,
			  406,  408,  415,  404,  403,  391,  394,  383,  381, -32768,
			  380, -32768,  377, -32768,  376, -32768,  372, -32768,  368, -32768,
			  355,  341,   79,   23, -32768,  178,   14, -32768,   16,  342,

			  317,  323, -32768, -32768, -32768, -32768,   53,  156,  331, -32768,
			  330, -32768,  324, -32768,  321, -32768,  318, -32768,  311, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768,  325, -32768,  260,  293,
			 -32768, -32768, -32768,  268,  152, -32768,  299, -32768,  230,  228,
			 -32768, -32768,  250, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768,  259, -32768, -32768,  195,  184, -32768,  621,  213,  176,
			  159,  154,   45,  -23,  621,  621,  190,  162,  113,  106,
			  -46, -32768,  621, -32768, -32768, -32768, -32768, -32768,  -23, -32768,
			  145,   41, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -418, -32768, -32768, -32768, -32768,    1,  678,   -6,   18,  388,
			 -353,  514,  281, -32768, -32768,  579,  147, -32768,  666,   43,
			 -32768,  420,  471, -32768, -32768,  -87,  -81, -32768,  -60,  -98,
			 -103, -111, -32768, -32768,  602, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768,  470, -32768,  655, -32768, -32768, -32768,  371,
			 -32768,  289, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768,  485, -32768, -32768,  -17,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			  239, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   56,   18,   52,  129,  180,  394,  400,  121,  402,  130,
			   13,   12,  179,  123,  197,  435,  111,  178,   80,   62,
			   59,   44,   13,   12,  431,  266,   13,   12,  175,   54,
			  120,   51,  268,  299,  176,  430,  478,  275,  407,  464,
			  161,  482,  406,  122,   41,   61,  274,  472,  470,  298,
			   60,  121,   15,   14,  440,  177,  262,   15,  372,   15,
			  217,  223,  229,  235,  -30,  110,  370,   15,  216,  222,
			  228,  234,  398,  215,  221,  227,  233,  399,   88,   41,
			  376,  209,  271,  206,  212,  218,  224,  230,  267,   58,
			  213,  219,  225,  231,  269,  434,   15,  253,   53,  -30,

			  260,   58,  263,  162,  257,   58,    3,  261,    3,  265,
			  471,  214,  220,  226,  232,  101,  102,  103,  104,  105,
			  106,    5,    4,  251,    3,  479,  205,  204,  205,  204,
			  184,   54,  123,   95,  366,  329,  205,  204,  159,  122,
			  122,  327,  264,  121,  325,  481,   14,  120,   40,  319,
			  259,  477,  205,  204,  203,  455,  250,  321,  476,  162,
			   15,  180,  270,  454,   15,  205,  204,  203,   15, -108,
			   10,    9,   16,  123,   14,   15,   14,   13,   12,   11,
			  323,  161,  120,   40,   14,  322,   14,  377,  258,   40,
			  433,  374,  326,  375,  324, -108,  373,  328,  351,  209,

			   53,  367,   10,    9,  130,  475,  474,    8,  252,  369,
			   91,   92,   93,   94,  255,  254,   14,  388,  473,  217,
			  223,  229,  235,  386,   42,  108,  384,    7,    6,  205,
			  204,  378,  371,  205,  204,  318,  432,  205,  204,  380,
			  368,  469,  255,  254,    5,    4,  468,    3,  160,    3,
			  320,    2,  255,  254,  255,  254,    1,  120,  249,  256,
			   39,   38,  382,  467,  279,  418,  463,  297,  465,  333,
			  332,  416,  295,  293,  414,  351,   15,   14,  462,  408,
			  399,  130,  457,  296,  255,  254,  347,  410,  294,  292,
			  123,  122,  121,  120,  278,  277,  248,  291,   66,   65,

			   64,   63,  461,  460,  459,  209,   60,  331,  330,  289,
			  412,  456,  247,  290,   48,   47,   15,   14,   84,  441,
			  442,  452,  125,   46,   45,  288,  453,  124,  246,  450,
			  123,  122,  121,  120,  119,  118,  117,  116,  393,  395,
			  396,  449,  115,  114,  113,    5,    4,  451,  448,   59,
			  439,  447,  245, -170,  446,  437, -170, -170, -170, -170,
			  445,  444, -170,  347, -170, -170, -170, -170,  244,  427,
			 -170, -170, -170, -170, -170, -170, -170, -170, -170,  243,
			 -170,  241, -170, -170, -170,    5,    4,   65,   64,   63,
			   77,   76,   75,    3,  438,  242,  239,  240,  425,  436,

			  237,  426,  424, -170, -170, -170,  423,  422, -170, -170,
			  421,  420,  238,  419, -170,  120,  236,   71,   70,   69,
			   68,  417,  122,   67,  123, -170, -170,   74,   73,   72,
			   71,   70,   69,   68,  415,  121,   67, -170,  413, -170,
			  411,  409,  401,   85,   -7,   -7,   57,   56,   -7,   -7,
			   -7,   -7,  397,  392,   -7,   56,   57,   -7,   -7,   -7,
			  390,  389,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,
			   -7,  387,   -7,  385,   -7,   -7,   -7,  383,  381,  107,
			  379,  334,   15,   14,   47,   -7,   37,   96,   97,   98,
			   99,  100,  335,   45,   -7,   -7,   -7,   -7,  317,  316,

			   -7,   -7,   71,   70,   69,   68,   -7,  315,   67,   10,
			    9,  314,  313,  312,    8,   85,  311,   -7,   -7,  404,
			  310,  309,   15,   14,   13,   12,  308,  307,  125,   -7,
			  343,  342,  341,  124,  306,  305,  123,  122,  121,  120,
			  119,  118,  117,  116,  340,  304,  403,  303,  115,  114,
			  113,    5,    4,  302,    3,  301,  300,  287,    2,   66,
			   65,   64,   63,   36,   48,  286,   46,  285,  272,  339,
			  338,  337,  282,  211,    7,    6,  210,  281,  202,  200,
			  336,  196,  197,  194,  182,  195,  193,  192,  191,  190,
			  189,    5,    4,  344,  188,  187,   15,   14,   13,   12,

			  183,  168,  125,   58,  343,  342,  341,  124,   63,  109,
			  123,  122,  121,  120,  119,  118,  117,  116,  340,  186,
			  185,   90,  115,  114,  113,   15,   14,   13,   12,   11,
			  184,  181,  170,  169,  112,   37,   87,   86,   79,   83,
			   82,   78,   50,  339,  338,  337,  443,   49,    7,    6,
			  201,  405,   10,    9,  336,   32,  353,    8,   15,   14,
			   39,   38,   37,   89,  273,    5,    4,  160,   43,  126,
			  284,   15,   14,  428,  365,   37,  199,   58,   19,    0,
			    0,    0,    0,    0,    0,   10,    9,    0,    0,    0,
			    8,    0,    0,    0,    5,    4,    0,    3,   10,    9,

			    0,    2,    0,    8,    0,    0,    1,   15,   14,    0,
			    0,    0,    0,    0,    0,    0,   77,   76,   75,    0,
			    0,  123,  122,  121,  120,    0,    0,    5,    4,    0,
			    3,    0,    0,    0,    2,    0,  174,  173,    0,   36,
			    5,    4,    0,    3,    0,    0,    0,    2,    0,    0,
			    0,    0,   36,   74,   73,   72,   71,   70,   69,   68,
			    0,    0,   67,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  172,  171,    5,    4, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			   17,    0,    8,   90,  115,    1,  359,   20,  361,   90,
			    6,    7,  115,   18,   40,    1,    1,  115,   41,   50,
			   19,    3,    6,    7,    1,    1,    6,    7,  115,   12,
			   21,    1,    1,   30,  115,   12,   82,    1,   83,  457,
			    8,    0,   87,   19,    1,   76,   10,  465,    3,   46,
			   76,   20,    4,    5,    1,  115,    1,    4,   71,    4,
			  171,  172,  173,  174,   41,   50,   71,    4,  171,  172,
			  173,  174,   52,  171,  172,  173,  174,   30,   60,   36,
			   71,  168,  193,    4,  171,  172,  173,  174,  191,   85,
			  171,  172,  173,  174,  192,   81,    4,  184,   81,   76,

			  187,   85,  189,  109,  185,   85,   76,  188,   76,  190,
			  463,  171,  172,  173,  174,   72,   73,   74,   75,   76,
			   77,   73,   74,  183,   76,  478,   73,   74,   73,   74,
			   83,   12,   18,   85,   71,  246,   73,   74,   95,   19,
			   19,  244,    1,   20,  242,    0,    5,   21,    1,  236,
			   10,   45,   73,   74,   75,    3,    1,  238,   45,  165,
			    4,  272,    1,   11,    4,   73,   74,   75,    4,   50,
			   31,   32,    1,   18,    5,    4,    5,    6,    7,    8,
			  240,    8,   21,   36,    5,   71,    5,  298,   48,   42,
			   12,   71,   71,  296,   71,   76,  294,   71,  285,  286,

			   81,  288,   31,   32,  285,   43,   44,   36,   48,  290,
			   63,   64,   65,   66,   73,   74,    5,  328,   28,  330,
			  331,  332,  333,  326,   85,   78,  324,   56,   57,   73,
			   74,  318,  292,   73,   74,   71,   58,   73,   74,  320,
			   71,   87,   73,   74,   73,   74,   87,   76,   75,   76,
			   71,   80,   73,   74,   73,   74,   85,   21,   10,   48,
			    6,    7,  322,   87,    1,  376,   82,   30,   55,   33,
			   34,  374,   30,   30,  372,  362,    4,    5,   83,  366,
			   30,  362,   54,   46,   73,   74,  285,  368,   46,   46,
			   18,   19,   20,   21,   31,   32,   48,   30,   66,   67,

			   68,   69,   43,   44,   45,  392,   76,   71,   72,   30,
			  370,   12,   30,   46,    4,    5,    4,    5,   86,  406,
			  407,   28,   10,    4,    5,   46,   58,   15,   46,    4,
			   18,   19,   20,   21,   22,   23,   24,   25,  337,  338,
			  339,   30,   30,   31,   32,   73,   74,   87,   30,  348,
			   27,   30,   30,    1,   30,   13,    4,    5,    6,    7,
			   30,   30,   10,  362,   12,   13,   14,   15,   46,   28,
			   18,   19,   20,   21,   22,   23,   24,   25,   26,   30,
			   28,   30,   30,   31,   32,   73,   74,   67,   68,   69,
			   33,   34,   35,   76,  400,   46,   30,   46,   30,  398,

			   30,   46,   30,   51,   52,   53,   30,   30,   56,   57,
			   30,   30,   46,   30,   62,   21,   46,   73,   74,   75,
			   76,   30,   19,   79,   18,   73,   74,   70,   71,   72,
			   73,   74,   75,   76,   30,   20,   79,   85,   30,   87,
			   30,   30,   50,   86,    0,    1,   12,  464,    4,    5,
			    6,    7,   28,   27,   10,  472,   12,   13,   14,   15,
			    4,   30,   18,   19,   20,   21,   22,   23,   24,   25,
			   26,   30,   28,   30,   30,   31,   32,   30,   30,    1,
			   30,   27,    4,    5,    5,   41,    8,   67,   68,   69,
			   70,   71,   50,    5,   50,   51,   52,   53,   30,   30,

			   56,   57,   73,   74,   75,   76,   62,   30,   79,   31,
			   32,   30,   30,   30,   36,   86,   30,   73,   74,    1,
			   30,   30,    4,    5,    6,    7,   30,   30,   10,   85,
			   12,   13,   14,   15,   30,   30,   18,   19,   20,   21,
			   22,   23,   24,   25,   26,   30,   28,   30,   30,   31,
			   32,   73,   74,   30,   76,   30,   30,   28,   80,   66,
			   67,   68,   69,   85,    4,   46,    4,   27,   30,   51,
			   52,   53,   42,   32,   56,   57,   31,   50,   50,   28,
			   62,   87,   40,   76,   28,   87,   87,   87,   87,   87,
			   87,   73,   74,    1,   83,   83,    4,    5,    6,    7,

			   87,   27,   10,   85,   12,   13,   14,   15,   69,   27,
			   18,   19,   20,   21,   22,   23,   24,   25,   26,   83,
			   83,   27,   30,   31,   32,    4,    5,    6,    7,    8,
			   83,   83,   83,   83,   82,    8,   12,    3,   50,   86,
			   86,   84,   12,   51,   52,   53,  407,   12,   56,   57,
			  165,  362,   31,   32,   62,    0,  285,   36,    4,    5,
			    6,    7,    8,   61,  194,   73,   74,   75,    2,   90,
			  199,    4,    5,  392,  286,    8,  162,   85,    0,   -1,
			   -1,   -1,   -1,   -1,   -1,   31,   32,   -1,   -1,   -1,
			   36,   -1,   -1,   -1,   73,   74,   -1,   76,   31,   32,

			   -1,   80,   -1,   36,   -1,   -1,   85,    4,    5,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   33,   34,   35,   -1,
			   -1,   18,   19,   20,   21,   -1,   -1,   73,   74,   -1,
			   76,   -1,   -1,   -1,   80,   -1,   33,   34,   -1,   85,
			   73,   74,   -1,   76,   -1,   -1,   -1,   80,   -1,   -1,
			   -1,   -1,   85,   70,   71,   72,   73,   74,   75,   76,
			   -1,   -1,   79,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   71,   72,   73,   74, yyDummy>>)
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

	yyvs3: SPECIAL [INTEGER]
			-- Stack for semantic values of type INTEGER

	yyvsc3: INTEGER
			-- Capacity of semantic value stack `yyvs3'

	yyvsp3: INTEGER
			-- Top of semantic value stack `yyvs3'

	yyspecial_routines3: KL_SPECIAL_ROUTINES [INTEGER]
			-- Routines that ought to be in SPECIAL [INTEGER]

	yyvs4: SPECIAL [REAL]
			-- Stack for semantic values of type REAL

	yyvsc4: INTEGER
			-- Capacity of semantic value stack `yyvs4'

	yyvsp4: INTEGER
			-- Top of semantic value stack `yyvs4'

	yyspecial_routines4: KL_SPECIAL_ROUTINES [REAL]
			-- Routines that ought to be in SPECIAL [REAL]

	yyvs5: SPECIAL [CHARACTER]
			-- Stack for semantic values of type CHARACTER

	yyvsc5: INTEGER
			-- Capacity of semantic value stack `yyvs5'

	yyvsp5: INTEGER
			-- Top of semantic value stack `yyvs5'

	yyspecial_routines5: KL_SPECIAL_ROUTINES [CHARACTER]
			-- Routines that ought to be in SPECIAL [CHARACTER]

	yyvs6: SPECIAL [C_DOMAIN_TYPE]
			-- Stack for semantic values of type C_DOMAIN_TYPE

	yyvsc6: INTEGER
			-- Capacity of semantic value stack `yyvs6'

	yyvsp6: INTEGER
			-- Top of semantic value stack `yyvs6'

	yyspecial_routines6: KL_SPECIAL_ROUTINES [C_DOMAIN_TYPE]
			-- Routines that ought to be in SPECIAL [C_DOMAIN_TYPE]

	yyvs7: SPECIAL [ASSERTION]
			-- Stack for semantic values of type ASSERTION

	yyvsc7: INTEGER
			-- Capacity of semantic value stack `yyvs7'

	yyvsp7: INTEGER
			-- Top of semantic value stack `yyvs7'

	yyspecial_routines7: KL_SPECIAL_ROUTINES [ASSERTION]
			-- Routines that ought to be in SPECIAL [ASSERTION]

	yyvs8: SPECIAL [ARRAYED_LIST [ASSERTION]]
			-- Stack for semantic values of type ARRAYED_LIST [ASSERTION]

	yyvsc8: INTEGER
			-- Capacity of semantic value stack `yyvs8'

	yyvsp8: INTEGER
			-- Top of semantic value stack `yyvs8'

	yyspecial_routines8: KL_SPECIAL_ROUTINES [ARRAYED_LIST [ASSERTION]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ASSERTION]]

	yyvs9: SPECIAL [C_ARCHETYPE_ROOT]
			-- Stack for semantic values of type C_ARCHETYPE_ROOT

	yyvsc9: INTEGER
			-- Capacity of semantic value stack `yyvs9'

	yyvsp9: INTEGER
			-- Top of semantic value stack `yyvs9'

	yyspecial_routines9: KL_SPECIAL_ROUTINES [C_ARCHETYPE_ROOT]
			-- Routines that ought to be in SPECIAL [C_ARCHETYPE_ROOT]

	yyvs10: SPECIAL [ARCHETYPE_INTERNAL_REF]
			-- Stack for semantic values of type ARCHETYPE_INTERNAL_REF

	yyvsc10: INTEGER
			-- Capacity of semantic value stack `yyvs10'

	yyvsp10: INTEGER
			-- Top of semantic value stack `yyvs10'

	yyspecial_routines10: KL_SPECIAL_ROUTINES [ARCHETYPE_INTERNAL_REF]
			-- Routines that ought to be in SPECIAL [ARCHETYPE_INTERNAL_REF]

	yyvs11: SPECIAL [SIBLING_ORDER]
			-- Stack for semantic values of type SIBLING_ORDER

	yyvsc11: INTEGER
			-- Capacity of semantic value stack `yyvs11'

	yyvsp11: INTEGER
			-- Top of semantic value stack `yyvs11'

	yyspecial_routines11: KL_SPECIAL_ROUTINES [SIBLING_ORDER]
			-- Routines that ought to be in SPECIAL [SIBLING_ORDER]

	yyvs12: SPECIAL [OG_PATH]
			-- Stack for semantic values of type OG_PATH

	yyvsc12: INTEGER
			-- Capacity of semantic value stack `yyvs12'

	yyvsp12: INTEGER
			-- Top of semantic value stack `yyvs12'

	yyspecial_routines12: KL_SPECIAL_ROUTINES [OG_PATH]
			-- Routines that ought to be in SPECIAL [OG_PATH]

	yyvs13: SPECIAL [MULTIPLICITY_INTERVAL]
			-- Stack for semantic values of type MULTIPLICITY_INTERVAL

	yyvsc13: INTEGER
			-- Capacity of semantic value stack `yyvs13'

	yyvsp13: INTEGER
			-- Top of semantic value stack `yyvs13'

	yyspecial_routines13: KL_SPECIAL_ROUTINES [MULTIPLICITY_INTERVAL]
			-- Routines that ought to be in SPECIAL [MULTIPLICITY_INTERVAL]

	yyvs14: SPECIAL [C_PRIMITIVE_OBJECT]
			-- Stack for semantic values of type C_PRIMITIVE_OBJECT

	yyvsc14: INTEGER
			-- Capacity of semantic value stack `yyvs14'

	yyvsp14: INTEGER
			-- Top of semantic value stack `yyvs14'

	yyspecial_routines14: KL_SPECIAL_ROUTINES [C_PRIMITIVE_OBJECT]
			-- Routines that ought to be in SPECIAL [C_PRIMITIVE_OBJECT]

	yyvs15: SPECIAL [C_PRIMITIVE]
			-- Stack for semantic values of type C_PRIMITIVE

	yyvsc15: INTEGER
			-- Capacity of semantic value stack `yyvs15'

	yyvsp15: INTEGER
			-- Top of semantic value stack `yyvs15'

	yyspecial_routines15: KL_SPECIAL_ROUTINES [C_PRIMITIVE]
			-- Routines that ought to be in SPECIAL [C_PRIMITIVE]

	yyvs16: SPECIAL [EXPR_ITEM]
			-- Stack for semantic values of type EXPR_ITEM

	yyvsc16: INTEGER
			-- Capacity of semantic value stack `yyvs16'

	yyvsp16: INTEGER
			-- Top of semantic value stack `yyvs16'

	yyspecial_routines16: KL_SPECIAL_ROUTINES [EXPR_ITEM]
			-- Routines that ought to be in SPECIAL [EXPR_ITEM]

	yyvs17: SPECIAL [CARDINALITY]
			-- Stack for semantic values of type CARDINALITY

	yyvsc17: INTEGER
			-- Capacity of semantic value stack `yyvs17'

	yyvsp17: INTEGER
			-- Top of semantic value stack `yyvs17'

	yyspecial_routines17: KL_SPECIAL_ROUTINES [CARDINALITY]
			-- Routines that ought to be in SPECIAL [CARDINALITY]

	yyvs18: SPECIAL [C_DATE]
			-- Stack for semantic values of type C_DATE

	yyvsc18: INTEGER
			-- Capacity of semantic value stack `yyvs18'

	yyvsp18: INTEGER
			-- Top of semantic value stack `yyvs18'

	yyspecial_routines18: KL_SPECIAL_ROUTINES [C_DATE]
			-- Routines that ought to be in SPECIAL [C_DATE]

	yyvs19: SPECIAL [BOOLEAN]
			-- Stack for semantic values of type BOOLEAN

	yyvsc19: INTEGER
			-- Capacity of semantic value stack `yyvs19'

	yyvsp19: INTEGER
			-- Top of semantic value stack `yyvs19'

	yyspecial_routines19: KL_SPECIAL_ROUTINES [BOOLEAN]
			-- Routines that ought to be in SPECIAL [BOOLEAN]

	yyvs20: SPECIAL [ISO8601_DATE]
			-- Stack for semantic values of type ISO8601_DATE

	yyvsc20: INTEGER
			-- Capacity of semantic value stack `yyvs20'

	yyvsp20: INTEGER
			-- Top of semantic value stack `yyvs20'

	yyspecial_routines20: KL_SPECIAL_ROUTINES [ISO8601_DATE]
			-- Routines that ought to be in SPECIAL [ISO8601_DATE]

	yyvs21: SPECIAL [ISO8601_DATE_TIME]
			-- Stack for semantic values of type ISO8601_DATE_TIME

	yyvsc21: INTEGER
			-- Capacity of semantic value stack `yyvs21'

	yyvsp21: INTEGER
			-- Top of semantic value stack `yyvs21'

	yyspecial_routines21: KL_SPECIAL_ROUTINES [ISO8601_DATE_TIME]
			-- Routines that ought to be in SPECIAL [ISO8601_DATE_TIME]

	yyvs22: SPECIAL [ISO8601_TIME]
			-- Stack for semantic values of type ISO8601_TIME

	yyvsc22: INTEGER
			-- Capacity of semantic value stack `yyvs22'

	yyvsp22: INTEGER
			-- Top of semantic value stack `yyvs22'

	yyspecial_routines22: KL_SPECIAL_ROUTINES [ISO8601_TIME]
			-- Routines that ought to be in SPECIAL [ISO8601_TIME]

	yyvs23: SPECIAL [ISO8601_DURATION]
			-- Stack for semantic values of type ISO8601_DURATION

	yyvsc23: INTEGER
			-- Capacity of semantic value stack `yyvs23'

	yyvsp23: INTEGER
			-- Top of semantic value stack `yyvs23'

	yyspecial_routines23: KL_SPECIAL_ROUTINES [ISO8601_DURATION]
			-- Routines that ought to be in SPECIAL [ISO8601_DURATION]

	yyvs24: SPECIAL [CODE_PHRASE]
			-- Stack for semantic values of type CODE_PHRASE

	yyvsc24: INTEGER
			-- Capacity of semantic value stack `yyvs24'

	yyvsp24: INTEGER
			-- Top of semantic value stack `yyvs24'

	yyspecial_routines24: KL_SPECIAL_ROUTINES [CODE_PHRASE]
			-- Routines that ought to be in SPECIAL [CODE_PHRASE]

	yyvs25: SPECIAL [URI]
			-- Stack for semantic values of type URI

	yyvsc25: INTEGER
			-- Capacity of semantic value stack `yyvs25'

	yyvsp25: INTEGER
			-- Top of semantic value stack `yyvs25'

	yyspecial_routines25: KL_SPECIAL_ROUTINES [URI]
			-- Routines that ought to be in SPECIAL [URI]

	yyvs26: SPECIAL [OG_PATH_ITEM]
			-- Stack for semantic values of type OG_PATH_ITEM

	yyvsc26: INTEGER
			-- Capacity of semantic value stack `yyvs26'

	yyvsp26: INTEGER
			-- Top of semantic value stack `yyvs26'

	yyspecial_routines26: KL_SPECIAL_ROUTINES [OG_PATH_ITEM]
			-- Routines that ought to be in SPECIAL [OG_PATH_ITEM]

	yyvs27: SPECIAL [ARRAYED_LIST [STRING]]
			-- Stack for semantic values of type ARRAYED_LIST [STRING]

	yyvsc27: INTEGER
			-- Capacity of semantic value stack `yyvs27'

	yyvsp27: INTEGER
			-- Top of semantic value stack `yyvs27'

	yyspecial_routines27: KL_SPECIAL_ROUTINES [ARRAYED_LIST [STRING]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [STRING]]

	yyvs28: SPECIAL [ARRAYED_LIST [INTEGER]]
			-- Stack for semantic values of type ARRAYED_LIST [INTEGER]

	yyvsc28: INTEGER
			-- Capacity of semantic value stack `yyvs28'

	yyvsp28: INTEGER
			-- Top of semantic value stack `yyvs28'

	yyspecial_routines28: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTEGER]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTEGER]]

	yyvs29: SPECIAL [ARRAYED_LIST [REAL]]
			-- Stack for semantic values of type ARRAYED_LIST [REAL]

	yyvsc29: INTEGER
			-- Capacity of semantic value stack `yyvs29'

	yyvsp29: INTEGER
			-- Top of semantic value stack `yyvs29'

	yyspecial_routines29: KL_SPECIAL_ROUTINES [ARRAYED_LIST [REAL]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [REAL]]

	yyvs30: SPECIAL [CHARACTER_REF]
			-- Stack for semantic values of type CHARACTER_REF

	yyvsc30: INTEGER
			-- Capacity of semantic value stack `yyvs30'

	yyvsp30: INTEGER
			-- Top of semantic value stack `yyvs30'

	yyspecial_routines30: KL_SPECIAL_ROUTINES [CHARACTER_REF]
			-- Routines that ought to be in SPECIAL [CHARACTER_REF]

	yyvs31: SPECIAL [ARRAYED_LIST [CHARACTER_REF]]
			-- Stack for semantic values of type ARRAYED_LIST [CHARACTER_REF]

	yyvsc31: INTEGER
			-- Capacity of semantic value stack `yyvs31'

	yyvsp31: INTEGER
			-- Top of semantic value stack `yyvs31'

	yyspecial_routines31: KL_SPECIAL_ROUTINES [ARRAYED_LIST [CHARACTER_REF]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [CHARACTER_REF]]

	yyvs32: SPECIAL [BOOLEAN_REF]
			-- Stack for semantic values of type BOOLEAN_REF

	yyvsc32: INTEGER
			-- Capacity of semantic value stack `yyvs32'

	yyvsp32: INTEGER
			-- Top of semantic value stack `yyvs32'

	yyspecial_routines32: KL_SPECIAL_ROUTINES [BOOLEAN_REF]
			-- Routines that ought to be in SPECIAL [BOOLEAN_REF]

	yyvs33: SPECIAL [ARRAYED_LIST [BOOLEAN_REF]]
			-- Stack for semantic values of type ARRAYED_LIST [BOOLEAN_REF]

	yyvsc33: INTEGER
			-- Capacity of semantic value stack `yyvs33'

	yyvsp33: INTEGER
			-- Top of semantic value stack `yyvs33'

	yyspecial_routines33: KL_SPECIAL_ROUTINES [ARRAYED_LIST [BOOLEAN_REF]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [BOOLEAN_REF]]

	yyvs34: SPECIAL [ARRAYED_LIST [ISO8601_DATE]]
			-- Stack for semantic values of type ARRAYED_LIST [ISO8601_DATE]

	yyvsc34: INTEGER
			-- Capacity of semantic value stack `yyvs34'

	yyvsp34: INTEGER
			-- Top of semantic value stack `yyvs34'

	yyspecial_routines34: KL_SPECIAL_ROUTINES [ARRAYED_LIST [ISO8601_DATE]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ISO8601_DATE]]

	yyvs35: SPECIAL [ARRAYED_LIST [ISO8601_TIME]]
			-- Stack for semantic values of type ARRAYED_LIST [ISO8601_TIME]

	yyvsc35: INTEGER
			-- Capacity of semantic value stack `yyvs35'

	yyvsp35: INTEGER
			-- Top of semantic value stack `yyvs35'

	yyspecial_routines35: KL_SPECIAL_ROUTINES [ARRAYED_LIST [ISO8601_TIME]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ISO8601_TIME]]

	yyvs36: SPECIAL [ARRAYED_LIST [ISO8601_DATE_TIME]]
			-- Stack for semantic values of type ARRAYED_LIST [ISO8601_DATE_TIME]

	yyvsc36: INTEGER
			-- Capacity of semantic value stack `yyvs36'

	yyvsp36: INTEGER
			-- Top of semantic value stack `yyvs36'

	yyspecial_routines36: KL_SPECIAL_ROUTINES [ARRAYED_LIST [ISO8601_DATE_TIME]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ISO8601_DATE_TIME]]

	yyvs37: SPECIAL [ARRAYED_LIST [ISO8601_DURATION]]
			-- Stack for semantic values of type ARRAYED_LIST [ISO8601_DURATION]

	yyvsc37: INTEGER
			-- Capacity of semantic value stack `yyvs37'

	yyvsp37: INTEGER
			-- Top of semantic value stack `yyvs37'

	yyspecial_routines37: KL_SPECIAL_ROUTINES [ARRAYED_LIST [ISO8601_DURATION]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ISO8601_DURATION]]

	yyvs38: SPECIAL [ARRAYED_LIST [CODE_PHRASE]]
			-- Stack for semantic values of type ARRAYED_LIST [CODE_PHRASE]

	yyvsc38: INTEGER
			-- Capacity of semantic value stack `yyvs38'

	yyvsp38: INTEGER
			-- Top of semantic value stack `yyvs38'

	yyspecial_routines38: KL_SPECIAL_ROUTINES [ARRAYED_LIST [CODE_PHRASE]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [CODE_PHRASE]]

	yyvs39: SPECIAL [INTERVAL [INTEGER]]
			-- Stack for semantic values of type INTERVAL [INTEGER]

	yyvsc39: INTEGER
			-- Capacity of semantic value stack `yyvs39'

	yyvsp39: INTEGER
			-- Top of semantic value stack `yyvs39'

	yyspecial_routines39: KL_SPECIAL_ROUTINES [INTERVAL [INTEGER]]
			-- Routines that ought to be in SPECIAL [INTERVAL [INTEGER]]

	yyvs40: SPECIAL [INTERVAL [REAL]]
			-- Stack for semantic values of type INTERVAL [REAL]

	yyvsc40: INTEGER
			-- Capacity of semantic value stack `yyvs40'

	yyvsp40: INTEGER
			-- Top of semantic value stack `yyvs40'

	yyspecial_routines40: KL_SPECIAL_ROUTINES [INTERVAL [REAL]]
			-- Routines that ought to be in SPECIAL [INTERVAL [REAL]]

	yyvs41: SPECIAL [INTERVAL [ISO8601_TIME]]
			-- Stack for semantic values of type INTERVAL [ISO8601_TIME]

	yyvsc41: INTEGER
			-- Capacity of semantic value stack `yyvs41'

	yyvsp41: INTEGER
			-- Top of semantic value stack `yyvs41'

	yyspecial_routines41: KL_SPECIAL_ROUTINES [INTERVAL [ISO8601_TIME]]
			-- Routines that ought to be in SPECIAL [INTERVAL [ISO8601_TIME]]

	yyvs42: SPECIAL [INTERVAL [ISO8601_DATE]]
			-- Stack for semantic values of type INTERVAL [ISO8601_DATE]

	yyvsc42: INTEGER
			-- Capacity of semantic value stack `yyvs42'

	yyvsp42: INTEGER
			-- Top of semantic value stack `yyvs42'

	yyspecial_routines42: KL_SPECIAL_ROUTINES [INTERVAL [ISO8601_DATE]]
			-- Routines that ought to be in SPECIAL [INTERVAL [ISO8601_DATE]]

	yyvs43: SPECIAL [INTERVAL [ISO8601_DATE_TIME]]
			-- Stack for semantic values of type INTERVAL [ISO8601_DATE_TIME]

	yyvsc43: INTEGER
			-- Capacity of semantic value stack `yyvs43'

	yyvsp43: INTEGER
			-- Top of semantic value stack `yyvs43'

	yyspecial_routines43: KL_SPECIAL_ROUTINES [INTERVAL [ISO8601_DATE_TIME]]
			-- Routines that ought to be in SPECIAL [INTERVAL [ISO8601_DATE_TIME]]

	yyvs44: SPECIAL [INTERVAL [ISO8601_DURATION]]
			-- Stack for semantic values of type INTERVAL [ISO8601_DURATION]

	yyvsc44: INTEGER
			-- Capacity of semantic value stack `yyvs44'

	yyvsp44: INTEGER
			-- Top of semantic value stack `yyvs44'

	yyspecial_routines44: KL_SPECIAL_ROUTINES [INTERVAL [ISO8601_DURATION]]
			-- Routines that ought to be in SPECIAL [INTERVAL [ISO8601_DURATION]]

feature {NONE} -- Constants

	yyFinal: INTEGER = 482
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 88
			-- Number of tokens

	yyLast: INTEGER = 777
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 329
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 169
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



feature -- Initialization

	make
			-- Create a new Eiffel parser.
		do
			make_scanner
			make_parser_skeleton
		end

	execute (in_text:STRING; a_source_start_line: INTEGER; differential_flag: BOOLEAN; an_rm_schema: attached BMM_SCHEMA)
		do
			reset
			rm_schema := an_rm_schema
			source_start_line := a_source_start_line
			differential_syntax := differential_flag

			create indent.make(0)

			create object_nodes.make(0)
			assertion_list := Void
			create c_attrs.make(0)

			create time_vc
			create date_vc
	
			set_input_buffer (new_string_buffer (in_text))
			parse
		end

feature {YY_PARSER_ACTION} -- Basic Operations

	report_error (a_message: STRING)
			-- Print error message.
		do
			add_error_with_location("general_error", <<a_message>>, error_loc)
		end

	abort_with_error (err_code: STRING; args: ARRAY [STRING])
		do
			add_error_with_location(err_code, args, error_loc)
			raise_error
			abort
		end

	error_loc: attached STRING
		do
			create Result.make_empty
			if attached {YY_FILE_BUFFER} input_buffer as f_buffer then
				Result.append (f_buffer.file.name + ", ")
			end
			Result.append ("line " + (in_lineno + source_start_line).out)
			Result.append(" [last cADL token = " + token_name(last_token) + "]")
		end

feature -- Access

	output: C_COMPLEX_OBJECT
			
	assertion_list: ARRAYED_LIST [ASSERTION]

	differential_syntax: BOOLEAN
			-- True if the supplied text to parse is differential, in which case it can contain the 
			-- differential syntax variants, i.e. ordering markers and specialisation paths

feature {NONE} -- Implementation

	rm_schema: BMM_SCHEMA

	safe_put_c_attribute_child (an_attr: C_ATTRIBUTE; an_obj: C_OBJECT)
			-- check child object for validity and then put as new child
		require
			Not_already_added: not an_attr.has_child(an_obj)
		do
			debug("ADL_parse")
				io.put_string(indent + "ATTR_NODE " + an_attr.rm_attribute_name + " put_child(" + 
						an_obj.generating_type + ": " + an_obj.rm_type_name + " [id=" + an_obj.node_id + "])%N") 
				
			end
			if rm_schema.has_class_definition (an_obj.rm_type_name) then
				if check_c_attribute_child(an_attr, an_obj) then
					c_attrs.item.put_child(an_obj)
				end
			else
				abort_with_error("VCORM", <<an_obj.rm_type_name, an_obj.path>>)
			end
		end

	check_c_attribute_child (an_attr: C_ATTRIBUTE; an_obj: C_OBJECT): BOOLEAN
			-- check a new child node
			-- FIXME: the semantics here should be rationalised with C_ATTRIBUTE.valid_child and related functions
		require
			Attribute_exists: an_attr /= Void
			Object_exists: an_obj /= Void
		local
			err_code: STRING
			ar: ARRAYED_LIST[STRING]
		do
			create ar.make (0)
			ar.extend (an_obj.generating_type) -- $1
			if an_obj.is_addressable then
				ar.extend ("node_id=" + an_obj.node_id) -- $2
			else
				ar.extend ("rm_type_name=" + an_obj.rm_type_name) -- $2
			end
			ar.extend(an_attr.rm_attribute_name) -- $3

			if an_attr.is_single then
				if an_obj.occurrences /= Void and then (an_obj.occurrences.upper_unbounded or an_obj.occurrences.upper > 1) then
					err_code := "VACSO"
				elseif an_obj.is_addressable and an_attr.has_child_with_id (an_obj.node_id) then
					err_code := "VACSI"
				elseif not an_obj.is_addressable and an_attr.has_child_with_rm_type_name (an_obj.rm_type_name) then
					err_code := "VACSIT"
				else
					Result := True
				end
			elseif an_attr.is_multiple then
				if not an_obj.is_addressable then
					err_code := "VACMI"
				elseif an_attr.has_child_with_id (an_obj.node_id) then
					err_code := "VACMM"
				elseif (an_attr.cardinality /= Void and then not an_attr.cardinality.interval.upper_unbounded) and 
						(an_obj.occurrences /= Void and then not an_obj.occurrences.upper_unbounded) and
						an_obj.occurrences.upper > an_attr.cardinality.interval.upper then
					err_code := "VACMCU"
					ar.extend (an_obj.occurrences.upper.out)
					ar.extend (an_attr.cardinality.interval.upper.out)
				else
					Result := True
				end
			end

			if not Result then
				abort_with_error (err_code, ar.to_array)
			end
		end

feature {NONE} -- Parse Tree

	object_nodes: ARRAYED_STACK [C_COMPLEX_OBJECT]
	complex_obj: C_COMPLEX_OBJECT

	c_attrs: ARRAYED_STACK [C_ATTRIBUTE]
			-- main stack of attributes during construction

	c_diff_attrs: ARRAYED_LIST [C_ATTRIBUTE]
			-- reference list of attributes with differential paths that require a special grafting process

	attr_node: C_ATTRIBUTE

	c_prim_obj: C_PRIMITIVE_OBJECT
	c_code_phrase_obj: C_CODE_PHRASE
	constraint_ref: CONSTRAINT_REF
	archetype_slot: ARCHETYPE_SLOT

	ordinal_node: C_DV_ORDINAL
	an_ordinal: ORDINAL
	a_code_phrase: CODE_PHRASE

	expr_tree: EXPR_OPERATOR
	expr_binary_operator: EXPR_BINARY_OPERATOR
	expr_unary_operator: EXPR_UNARY_OPERATOR
	expr_leaf: EXPR_LEAF

	assertion: ASSERTION

	c_string: C_STRING
	string_list: ARRAYED_LIST [STRING]
	c_boolean: C_BOOLEAN
	c_real: C_REAL
	c_integer:  C_INTEGER
	c_time: C_TIME
	c_date_time: C_DATE_TIME
	c_duration: C_DURATION

	a_cardinality: CARDINALITY
	cardinality_limit_pos_infinity: BOOLEAN

	rm_attribute_name: STRING
	parent_path_str, path_str: STRING

	occurrences: STRING

	invariant_expr: STRING

	time_vc: TIME_VALIDITY_CHECKER
	date_vc: DATE_VALIDITY_CHECKER

	bmm_prop_def: BMM_PROPERTY_DEFINITION

-------------- FOLLOWING TAKEN FROM DADL_VALIDATOR.Y ---------------
feature {NONE} -- Implementation 

	term: CODE_PHRASE
	a_uri: URI

	arch_internal_ref_rm_type_name: STRING
	arch_internal_ref_node_id: STRING

	multiplicity_interval: MULTIPLICITY_INTERVAL
	int_interval: INTERVAL [INTEGER]
	rl_interval: INTERVAL [REAL]

	integer_interval: INTERVAL [INTEGER]
	real_interval: INTERVAL [REAL]
	date_interval: INTERVAL [ISO8601_DATE]
	time_interval: INTERVAL [ISO8601_TIME]
	date_time_interval: INTERVAL [ISO8601_DATE_TIME]
	duration_interval: INTERVAL [ISO8601_DURATION]

	int_list: ARRAYED_LIST [INTEGER]
	real_list: ARRAYED_LIST [REAL]

	indent: STRING
	str: STRING

end
