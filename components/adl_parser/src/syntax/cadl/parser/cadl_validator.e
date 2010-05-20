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
			make as make_eiffel_scanner
		end

	C_COMMON

	OPERATOR_TYPES
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

	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

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

	yy_clear_value_stacks is
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

	yy_do_action (yy_act: INTEGER) is
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
--|#line 154 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 154")
end

			debug("ADL_parse")
				io.put_string("CADL definition validated%N")
			end

			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 2 then
--|#line 162 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 162")
end

			debug("ADL_parse")
				io.put_string("assertion definition validated%N")
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
--|#line 170 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 170")
end

			debug("ADL_parse")
				io.put_string("CADL definition NOT validated%N")
			end
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 4 then
--|#line 179 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 179")
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
--|#line 187 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 187")
end

			-- ok in case where occurrences is {0}, i.e. an exclusion
			if complex_obj.occurrences_prohibited then
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
--|#line 202 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 202")
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
--|#line 235 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 235")
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
--|#line 239 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 239")
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
--|#line 243 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 243")
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
--|#line 254 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 254")
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
--|#line 258 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 258")
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
--|#line 264 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 264")
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
--|#line 271 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 271")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 14 then
--|#line 280 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 280")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 15 then
--|#line 283 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 283")
end

			safe_put_c_attribute_child(c_attrs.item, yyvs9.item (yyvsp9))
		
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
--|#line 287 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 287")
end

			safe_put_c_attribute_child(c_attrs.item, yyvs10.item (yyvsp10))
		
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
--|#line 291 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 291")
end

			safe_put_c_attribute_child(c_attrs.item, archetype_slot)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 18 then
--|#line 295 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 295")
end

			safe_put_c_attribute_child(c_attrs.item, constraint_ref)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 19 then
--|#line 299 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 299")
end

			safe_put_c_attribute_child(c_attrs.item, c_code_phrase_obj)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 20 then
--|#line 303 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 303")
end

			safe_put_c_attribute_child(c_attrs.item, ordinal_node)
			ordinal_node := Void
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 21 then
--|#line 308 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 308")
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
--|#line 312 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 312")
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
--|#line 316 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 316")
end

			abort_with_error("SDINV", <<dadl_parser_error>>)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 24 then
--|#line 320 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 320")
end

			abort_with_error("SCCOG", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 25 then
--|#line 331 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 331")
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
--|#line 340 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 340")
end

			if (create {ARCHETYPE_ID}).valid_id(yyvs2.item (yyvsp2)) then
				create yyval9.make_slot_id(yyvs2.item (yyvsp2 - 2), yyvs2.item (yyvsp2), yyvs2.item (yyvsp2 - 1))
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
--|#line 351 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 351")
end

			create yyval10.make(yyvs2.item (yyvsp2), yyvs12.item (yyvsp12).as_string)
			if yyvs13.item (yyvsp13) /= Void then
				yyval10.set_occurrences(yyvs13.item (yyvsp13))
			end

			debug("ADL_parse")
				io.put_string(indent + "create ARCHETYPE_INTERNAL_REF ")
				if yyval10.use_target_occurrences then
					io.put_string("occurrences=(use target) ")
				elseif yyvs13.item (yyvsp13) /= Void then
					io.put_string("occurrences=" + yyval10.occurrences.as_string + " ")
				end
				io.put_string(yyval10.rm_type_name + " path=" + yyval10.target_path + "%N") 
				io.put_string(indent + "C_ATTR " + c_attrs.item.rm_attribute_name + " safe_put_c_attribute_child(ARCHETYPE_INTERNAL_REF)%N") 
			end

			if (c_attrs.item.is_multiple or c_attrs.item.child_count > 1) and not yyval10.is_addressable and not yyvs12.item (yyvsp12).last.object_id.is_empty then
				yyval10.set_node_id(yyvs12.item (yyvsp12).last.object_id)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp10 := yyvsp10 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
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
when 28 then
--|#line 373 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 373")
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
when 29 then
--|#line 379 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 379")
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
when 30 then
--|#line 392 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 392")
end

			if not archetype_slot.occurrences_prohibited then
				abort_with_error("VCOCDocc", <<archetype_slot.rm_type_name, archetype_slot.path>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 31 then
--|#line 400 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 400")
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
when 32 then
--|#line 417 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 417")
end

			create archetype_slot.make_anonymous(yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 33 then
--|#line 421 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 421")
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
when 34 then
--|#line 430 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 430")
end

			create archetype_slot.make_identified(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 35 then
--|#line 434 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 434")
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
when 36 then
--|#line 443 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 443")
end

			abort_with_error("SUAS", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 37 then
--|#line 449 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 449")
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
when 38 then
--|#line 456 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 456")
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
when 39 then
--|#line 463 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 463")
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
when 40 then
--|#line 470 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 470")
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
when 41 then
--|#line 477 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 477")
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
when 42 then
--|#line 484 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 484")
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
when 43 then
--|#line 491 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 491")
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
when 44 then
--|#line 498 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 498")
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
when 45 then
--|#line 505 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 505")
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
when 46 then
--|#line 514 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 514")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 47 then
--|#line 521 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 521")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 48 then
--|#line 524 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 524")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 49 then
--|#line 529 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 529")
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
when 50 then
--|#line 537 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 537")
end

			abort_with_error("SCAS", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyvs1.put (yyval1, yyvsp1)
end
when 51 then
--|#line 543 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 543")
end

			rm_attribute_name := yyvs2.item (yyvsp2)
			if not object_nodes.item.has_attribute(rm_attribute_name) then
				if rm_schema.has_property (object_nodes.item.rm_type_name, rm_attribute_name) then
					bmm_prop_def := rm_schema.property_definition (object_nodes.item.rm_type_name, rm_attribute_name)
					if yyvs13.item (yyvsp13) /= Void and then bmm_prop_def.existence.equal_interval(yyvs13.item (yyvsp13)) then
						yyvs13.item (yyvsp13) := Void -- throw out constraint that is same as RM
					end
					if bmm_prop_def.is_container then
						if attached {BMM_CONTAINER_PROPERTY} bmm_prop_def as bmm_cont_prop and yyvs17.item (yyvsp17) /= Void then
							if yyvs17.item (yyvsp17).interval.equal_interval(bmm_cont_prop.type.cardinality) then
								-- $3 := Void -- throw out constraint that is same as RM
							end
						end
						create attr_node.make_multiple(rm_attribute_name, yyvs13.item (yyvsp13), yyvs17.item (yyvsp17))
						c_attrs.put(attr_node)
						debug("ADL_parse")
							io.put_string(indent + "PUSH create ATTR_NODE " + rm_attribute_name + "; container = " + attr_node.is_multiple.out + " existence=(" + yyvs13.item (yyvsp13).as_string + "); cardinality=(" + yyvs17.item (yyvsp17).as_string + ")%N") 
							io.put_string(indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_attribute(REL)%N") 
							indent.append("%T")
						end
						object_nodes.item.put_attribute(attr_node)
					elseif yyvs17.item (yyvsp17) = Void then
						create attr_node.make_single(rm_attribute_name, yyvs13.item (yyvsp13))
						c_attrs.put(attr_node)
						debug("ADL_parse")
							io.put_string(indent + "PUSH create ATTR_NODE " + rm_attribute_name + "; container = " + attr_node.is_multiple.out + " existence=(" + yyvs13.item (yyvsp13).as_string + "); cardinality=(" + yyvs17.item (yyvsp17).as_string + ")%N") 
							io.put_string(indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_attribute(REL)%N") 
							indent.append("%T")
						end
						object_nodes.item.put_attribute(attr_node)
					else -- error - cardinality stated, but on a non-container attribute
						abort_with_error("VSAM", <<rm_attribute_name>>)
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
when 52 then
--|#line 585 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 585")
end

			rm_attribute_name := yyvs12.item (yyvsp12).last.attr_name
			parent_path_str := yyvs12.item (yyvsp12).parent_path.as_string
			path_str := yyvs12.item (yyvsp12).as_string

			if not object_nodes.item.has_attribute(rm_attribute_name) then
				-- check RM to see if path is valid, and if it is a container
				if rm_schema.has_property_path (object_nodes.item.rm_type_name, path_str) then
					bmm_prop_def := rm_schema.property_definition_at_path (object_nodes.item.rm_type_name, path_str)
					if yyvs13.item (yyvsp13) /= Void and then bmm_prop_def.existence.equal_interval(yyvs13.item (yyvsp13)) then
						yyvs13.item (yyvsp13) := Void -- throw out constraint that is same as RM
					end
					if bmm_prop_def.is_container then
						if attached {BMM_CONTAINER_PROPERTY} bmm_prop_def as bmm_cont_prop and yyvs17.item (yyvsp17) /= Void then
							if yyvs17.item (yyvsp17).interval.equal_interval(bmm_cont_prop.type.cardinality) then
								-- $3 := Void -- throw out constraint that is same as RM
							end
						end
						create attr_node.make_multiple(rm_attribute_name, yyvs13.item (yyvsp13), yyvs17.item (yyvsp17))
						attr_node.set_differential_path(parent_path_str)
						c_attrs.put(attr_node)
						debug("ADL_parse")
							io.put_string(indent + "PUSH create ATTR_NODE " + path_str + "; container = " + attr_node.is_multiple.out + " existence=(" + yyvs13.item (yyvsp13).as_string + ")%N") 
							io.put_string(indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_attribute(REL)%N") 
							indent.append("%T")
						end
						object_nodes.item.put_attribute(attr_node)
					elseif yyvs17.item (yyvsp17) = Void then
						create attr_node.make_single(rm_attribute_name, yyvs13.item (yyvsp13))
						attr_node.set_differential_path(parent_path_str)
						c_attrs.put(attr_node)
						debug("ADL_parse")
							io.put_string(indent + "PUSH create ATTR_NODE " + path_str + "; container = " + attr_node.is_multiple.out + " existence=(" + yyvs13.item (yyvsp13).as_string + ")%N") 
							io.put_string(indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_attribute(REL)%N") 
							indent.append("%T")
						end
						object_nodes.item.put_attribute(attr_node)
					else -- error - cardinality stated, but on a non-container attribute
						abort_with_error("VSAM", <<path_str>>)
					end
				else
					abort_with_error("VDIFP", <<path_str>>)
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
when 53 then
--|#line 635 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 635")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 54 then
--|#line 638 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 638")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 55 then
--|#line 641 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 641")
end

			debug("ADL_parse")
				io.put_string(indent + "ATTR_NODE " + attr_node.rm_attribute_name + "  - any_allowed%N") 
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 56 then
--|#line 650 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 650")
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
when 57 then
--|#line 651 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 651")
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
when 58 then
--|#line 661 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 661")
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
when 59 then
--|#line 662 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 662")
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
when 60 then
--|#line 676 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 676")
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
when 61 then
--|#line 683 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 683")
end

			assertion_list.extend(assertion)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs8.put (yyval8, yyvsp8)
end
when 62 then
--|#line 689 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 689")
end

			create assertion.make(yyvs16.item (yyvsp16), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 63 then
--|#line 693 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 693")
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
when 64 then
--|#line 697 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 697")
end

			abort_with_error("SINVS", <<yyvs2.item (yyvsp2)>>)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 65 then
--|#line 705 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 705")
end

			yyval16 := yyvs16.item (yyvsp16)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
when 66 then
--|#line 709 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 709")
end

			yyval16 := yyvs16.item (yyvsp16)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
when 67 then
--|#line 715 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 715")
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
when 68 then
--|#line 725 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 725")
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
when 69 then
--|#line 729 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 729")
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
when 70 then
--|#line 739 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 739")
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
when 71 then
--|#line 748 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 748")
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
when 72 then
--|#line 758 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 758")
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
when 73 then
--|#line 768 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 768")
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
when 74 then
--|#line 778 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 778")
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
when 75 then
--|#line 788 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 788")
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
when 76 then
--|#line 798 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 798")
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
when 77 then
--|#line 808 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 808")
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
when 78 then
--|#line 818 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 818")
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
when 79 then
--|#line 828 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 828")
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
when 80 then
--|#line 838 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 838")
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
when 81 then
--|#line 850 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 850")
end

			yyval16 := yyvs16.item (yyvsp16)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs16.put (yyval16, yyvsp16)
end
when 82 then
--|#line 854 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 854")
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
when 83 then
--|#line 859 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 859")
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
when 84 then
--|#line 866 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 866")
end

			yyval16 := yyvs16.item (yyvsp16)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
when 85 then
--|#line 870 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 870")
end

			yyval16 := yyvs16.item (yyvsp16)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
when 86 then
--|#line 876 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 876")
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
when 87 then
--|#line 886 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 886")
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
when 88 then
--|#line 896 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 896")
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
when 89 then
--|#line 906 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 906")
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
when 90 then
--|#line 916 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 916")
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
when 91 then
--|#line 928 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 928")
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
when 92 then
--|#line 935 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 935")
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
when 93 then
--|#line 943 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 943")
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
when 94 then
--|#line 951 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 951")
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
when 95 then
--|#line 966 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 966")
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
when 96 then
--|#line 973 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 973")
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
when 97 then
--|#line 981 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 981")
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
when 98 then
--|#line 991 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 991")
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
when 99 then
--|#line 995 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 995")
end

			yyval12 := yyvs12.item (yyvsp12)
			yyval12.append_segment(yyvs26.item (yyvsp26))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp26 := yyvsp26 -1
	yyvs12.put (yyval12, yyvsp12)
end
when 100 then
--|#line 1002 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1002")
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
when 101 then
--|#line 1009 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1009")
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
when 102 then
--|#line 1025 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1025")
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
when 103 then
--|#line 1026 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1026")
end

			yyval13 := multiplicity_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp13 := yyvsp13 + 1
	yyvsp1 := yyvsp1 -5
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
when 104 then
--|#line 1032 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1032")
end

			if yyvs3.item (yyvsp3) = 0 then
				create multiplicity_interval.make_point(0)
			elseif yyvs3.item (yyvsp3) = 1 then
				create multiplicity_interval.make_point(1)
			else
				abort_with_error("SEXLSG", Void)
			end
		
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
when 105 then
--|#line 1042 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1042")
end

			if yyvs3.item (yyvsp3 - 1) = 0 then
				if yyvs3.item (yyvsp3) = 0 then
					create multiplicity_interval.make_point(0)
				elseif yyvs3.item (yyvsp3) = 1 then
					create multiplicity_interval.make_bounded(0, 1)
				else
					abort_with_error("SEXLU1", Void)
				end
			elseif yyvs3.item (yyvsp3 - 1) = 1 then
				if yyvs3.item (yyvsp3) = 1 then
					create multiplicity_interval.make_point(1)
				else
					abort_with_error("SEXLU2", Void)
				end
			else
				abort_with_error("SEXLMG", Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp3 := yyvsp3 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 106 then
--|#line 1064 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1064")
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
when 107 then
--|#line 1065 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1065")
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
when 108 then
--|#line 1071 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1071")
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
when 109 then
--|#line 1075 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1075")
end

			create a_cardinality.make(multiplicity_interval)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp13 := yyvsp13 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 110 then
--|#line 1079 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1079")
end

			create a_cardinality.make(multiplicity_interval)
			a_cardinality.set_unordered
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp13 := yyvsp13 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 111 then
--|#line 1084 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1084")
end

			create a_cardinality.make(multiplicity_interval)
			a_cardinality.set_unique
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp13 := yyvsp13 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 112 then
--|#line 1089 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1089")
end

			create a_cardinality.make(multiplicity_interval)
			a_cardinality.set_unique
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp13 := yyvsp13 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 113 then
--|#line 1094 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1094")
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
when 114 then
--|#line 1100 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1100")
end

			create a_cardinality.make(multiplicity_interval)
			a_cardinality.set_unique
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp13 := yyvsp13 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 115 then
--|#line 1105 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1105")
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
when 116 then
--|#line 1113 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1113")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs3.put (yyval3, yyvsp3)
end
when 117 then
--|#line 1117 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1117")
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
when 118 then
--|#line 1123 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1123")
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
when 119 then
--|#line 1124 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1124")
end

			yyval13 := yyvs13.item (yyvsp13)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyvs13.put (yyval13, yyvsp13)
end
when 120 then
--|#line 1128 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1128")
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
when 121 then
--|#line 1134 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1134")
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
when 122 then
--|#line 1144 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1144")
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
when 123 then
--|#line 1158 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1158")
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
when 124 then
--|#line 1164 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1164")
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
when 125 then
--|#line 1168 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1168")
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
when 126 then
--|#line 1184 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1184")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 127 then
--|#line 1185 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1185")
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
when 128 then
--|#line 1193 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1193")
end

			abort_with_error("SCIAV", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 129 then
--|#line 1199 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1199")
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
when 130 then
--|#line 1205 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1205")
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
when 131 then
--|#line 1209 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1209")
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
when 132 then
--|#line 1225 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1225")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 133 then
--|#line 1226 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1226")
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
when 134 then
--|#line 1234 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1234")
end

			abort_with_error("SCRAV", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 135 then
--|#line 1240 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1240")
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
when 136 then
--|#line 1257 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1257")
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
when 137 then
--|#line 1262 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1262")
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
when 138 then
--|#line 1268 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1268")
end

			yyval18 := yyvs18.item (yyvsp18)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs18.put (yyval18, yyvsp18)
end
when 139 then
--|#line 1272 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1272")
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
when 140 then
--|#line 1281 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1281")
end

			abort_with_error("SCDAV", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs18.put (yyval18, yyvsp18)
end
when 141 then
--|#line 1287 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1287")
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
when 142 then
--|#line 1308 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1308")
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
when 143 then
--|#line 1313 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1313")
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
when 144 then
--|#line 1319 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1319")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 145 then
--|#line 1320 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1320")
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
when 146 then
--|#line 1328 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1328")
end

			abort_with_error("SCTAV", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 147 then
--|#line 1334 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1334")
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
when 148 then
--|#line 1355 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1355")
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
when 149 then
--|#line 1360 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1360")
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
when 150 then
--|#line 1366 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1366")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 151 then
--|#line 1367 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1367")
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
when 152 then
--|#line 1375 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1375")
end

			abort_with_error("SCDTAV", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 153 then
--|#line 1381 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1381")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 154 then
--|#line 1382 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1382")
end

			create c_duration.make_pattern_with_range (c_duration.pattern, duration_interval)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp44 := yyvsp44 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 155 then
--|#line 1386 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1386")
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
when 156 then
--|#line 1391 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1391")
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
when 157 then
--|#line 1397 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1397")
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
when 158 then
--|#line 1407 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1407")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 159 then
--|#line 1408 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1408")
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
when 160 then
--|#line 1416 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1416")
end

			abort_with_error("SCDUAV", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 161 then
--|#line 1422 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1422")
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
when 162 then
--|#line 1429 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1429")
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
when 163 then
--|#line 1433 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1433")
end

			create c_string.make_from_string_list(yyvs27.item (yyvsp27))
			c_string.set_open
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp27 := yyvsp27 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 164 then
--|#line 1438 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1438")
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
when 165 then
--|#line 1447 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1447")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 166 then
--|#line 1448 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1448")
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
when 167 then
--|#line 1456 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1456")
end

			abort_with_error("SCSAV", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 168 then
--|#line 1462 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1462")
end

			create c_boolean.make_true
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 169 then
--|#line 1466 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1466")
end

			create c_boolean.make_false
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 170 then
--|#line 1470 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1470")
end

			create c_boolean.make_true_false
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 171 then
--|#line 1474 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1474")
end

			create c_boolean.make_true_false
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 172 then
--|#line 1480 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1480")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 173 then
--|#line 1481 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1481")
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
when 174 then
--|#line 1489 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1489")
end

			abort_with_error("SCBAV", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 175 then
--|#line 1495 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1495")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 176 then
--|#line 1496 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1496")
end

			if ordinal_node.has_item (yyvs3.item (yyvsp3)) then
				ordinal_node.set_assumed_value_from_integer (yyvs3.item (yyvsp3))
			else
				abort_with_error("VOBAVL", <<yyvs3.item (yyvsp3).out>>)
			end
 		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 177 then
--|#line 1504 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1504")
end

			abort_with_error("SCOAV", Void)
 		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 178 then
--|#line 1510 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1510")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 179 then
--|#line 1511 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1511")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 180 then
--|#line 1514 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1514")
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
when 181 then
--|#line 1533 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1533")
end

			create c_code_phrase_obj

			if c_code_phrase_obj.valid_pattern (yyvs2.item (yyvsp2)) then
				c_code_phrase_obj.make_from_pattern (yyvs2.item (yyvsp2))
			else
				abort_with_error("SCPCV", <<c_code_phrase_obj.fail_reason>>)
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
when 182 then
--|#line 1543 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1543")
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
when 183 then
--|#line 1549 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1549")
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
when 184 then
--|#line 1555 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1555")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 185 then
--|#line 1559 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1559")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 186 then
--|#line 1571 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1571")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs2.put (yyval2, yyvsp2)
end
when 187 then
--|#line 1575 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1575")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs2.put (yyval2, yyvsp2)
end
when 188 then
--|#line 1579 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1579")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 189 then
--|#line 1583 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1583")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 190 then
--|#line 1589 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1589")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 191 then
--|#line 1595 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1595")
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
when 192 then
--|#line 1601 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1601")
end

			yyvs27.item (yyvsp27).extend(yyvs2.item (yyvsp2))
			yyval27 := yyvs27.item (yyvsp27)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyvs27.put (yyval27, yyvsp27)
end
when 193 then
--|#line 1606 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1606")
end

			create yyval27.make(0)
			yyval27.extend(yyvs2.item (yyvsp2))
		
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
when 194 then
--|#line 1613 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1613")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs3.put (yyval3, yyvsp3)
end
when 195 then
--|#line 1616 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1616")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs3.put (yyval3, yyvsp3)
end
when 196 then
--|#line 1619 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1619")
end

			yyval3 := - yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs3.put (yyval3, yyvsp3)
end
when 197 then
--|#line 1624 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1624")
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
when 198 then
--|#line 1630 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1630")
end

			yyvs28.item (yyvsp28).extend(yyvs3.item (yyvsp3))
			yyval28 := yyvs28.item (yyvsp28)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyvs28.put (yyval28, yyvsp28)
end
when 199 then
--|#line 1635 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1635")
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
when 200 then
--|#line 1642 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1642")
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
when 201 then
--|#line 1651 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1651")
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
when 202 then
--|#line 1660 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1660")
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
when 203 then
--|#line 1669 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1669")
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
when 204 then
--|#line 1678 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1678")
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
when 205 then
--|#line 1683 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1683")
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
when 206 then
--|#line 1688 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1688")
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
when 207 then
--|#line 1693 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1693")
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
when 208 then
--|#line 1698 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1698")
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
when 209 then
--|#line 1705 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1705")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs4.put (yyval4, yyvsp4)
end
when 210 then
--|#line 1709 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1709")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs4.put (yyval4, yyvsp4)
end
when 211 then
--|#line 1713 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1713")
end

			yyval4 := - yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs4.put (yyval4, yyvsp4)
end
when 212 then
--|#line 1719 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1719")
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
when 213 then
--|#line 1725 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1725")
end

			yyvs29.item (yyvsp29).extend(yyvs4.item (yyvsp4))
			yyval29 := yyvs29.item (yyvsp29)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyvs29.put (yyval29, yyvsp29)
end
when 214 then
--|#line 1730 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1730")
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
when 215 then
--|#line 1737 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1737")
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
when 216 then
--|#line 1746 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1746")
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
when 217 then
--|#line 1755 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1755")
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
when 218 then
--|#line 1764 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1764")
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
when 219 then
--|#line 1773 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1773")
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
when 220 then
--|#line 1778 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1778")
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
when 221 then
--|#line 1783 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1783")
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
when 222 then
--|#line 1788 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1788")
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
when 223 then
--|#line 1793 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1793")
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
when 224 then
--|#line 1800 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1800")
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
when 225 then
--|#line 1804 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1804")
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
when 226 then
--|#line 1852 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1852")
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
when 227 then
--|#line 1880 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1880")
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
when 228 then
--|#line 1889 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1889")
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
when 229 then
--|#line 1898 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1898")
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
when 230 then
--|#line 1907 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1907")
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
when 231 then
--|#line 1916 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1916")
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
when 232 then
--|#line 1921 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1921")
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
when 233 then
--|#line 1926 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1926")
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
when 234 then
--|#line 1931 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1931")
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
when 235 then
--|#line 1936 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1936")
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
when 236 then
--|#line 1943 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1943")
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
when 237 then
--|#line 1971 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1971")
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
when 238 then
--|#line 1980 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1980")
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
when 239 then
--|#line 1989 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1989")
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
when 240 then
--|#line 1998 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1998")
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
when 241 then
--|#line 2007 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2007")
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
when 242 then
--|#line 2012 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2012")
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
when 243 then
--|#line 2017 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2017")
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
when 244 then
--|#line 2022 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2022")
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
when 245 then
--|#line 2027 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2027")
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
when 246 then
--|#line 2034 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2034")
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
when 247 then
--|#line 2062 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2062")
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
when 248 then
--|#line 2071 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2071")
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
when 249 then
--|#line 2080 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2080")
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
when 250 then
--|#line 2089 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2089")
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
when 251 then
--|#line 2098 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2098")
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
when 252 then
--|#line 2103 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2103")
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
when 253 then
--|#line 2108 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2108")
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
when 254 then
--|#line 2113 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2113")
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
when 255 then
--|#line 2118 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2118")
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
when 256 then
--|#line 2125 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2125")
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
when 257 then
--|#line 2153 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2153")
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
when 258 then
--|#line 2162 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2162")
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
when 259 then
--|#line 2171 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2171")
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
when 260 then
--|#line 2180 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2180")
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
when 261 then
--|#line 2189 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2189")
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
when 262 then
--|#line 2194 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2194")
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
when 263 then
--|#line 2199 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2199")
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
when 264 then
--|#line 2204 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2204")
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
when 265 then
--|#line 2209 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2209")
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

	yy_do_error_action (yy_act: INTEGER) is
			-- Execute error action.
		do
			inspect yy_act
			when 472 then
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
			   84,   85,   74,   72,   82,   73,    2,   75,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,   83,   86,
			    2,   69,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,   80,    2,   81,   78,    2,    2,    2,    2,    2,

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
			   65,   66,   67,   68,   70,   71,   76,   77,   79, yyDummy>>)
		end

	yyr1_template: SPECIAL [INTEGER] is
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,  130,  130,  130,  131,  131,  132,  134,  134,  134,
			   93,   93,  133,  133,  137,  137,  137,  137,  137,  137,
			  137,  137,  137,  137,  137,   90,   90,   91,   91,  138,
			  138,  142,  143,  143,  143,  143,  143,  100,  101,  101,
			  101,  101,  101,  101,  101,  101,  135,  136,  136,  151,
			  151,  152,  152,  153,  153,  153,   88,   88,   89,   89,
			   87,   87,  154,  154,  154,  102,  102,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  104,  104,  104,  105,  105,  106,  106,  106,  106,
			  106,  107,  107,  107,  107,   94,   94,   94,   95,   95,

			  120,  120,   98,   98,  155,  155,  108,  108,  156,  156,
			  156,  156,  156,  156,  156,  156,   96,   96,   97,   97,
			   97,   99,   99,  157,  157,  157,  144,  144,  144,  158,
			  158,  158,  145,  145,  145,  109,  109,  109,  110,  110,
			  110,  159,  159,  159,  146,  146,  146,  160,  160,  160,
			  147,  147,  147,  161,  161,  161,  161,  162,  148,  148,
			  148,  163,  163,  163,  163,  149,  149,  149,  164,  164,
			  164,  164,  150,  150,  150,  141,  141,  141,  165,  165,
			  166,  140,  140,  139,  118,  118,   92,   92,   92,   92,
			  119,  121,  121,  121,  111,  111,  111,  122,  122,  122,

			  124,  124,  124,  124,  124,  124,  124,  124,  124,  112,
			  112,  112,  123,  123,  123,  125,  125,  125,  125,  125,
			  125,  125,  125,  125,  113,  113,  114,  127,  127,  127,
			  127,  127,  127,  127,  127,  127,  116,  126,  126,  126,
			  126,  126,  126,  126,  126,  126,  115,  128,  128,  128,
			  128,  128,  128,  128,  128,  128,  117,  129,  129,  129,
			  129,  129,  129,  129,  129,  129, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER] is
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    2,    2,    2,    4,    3,    1,    8,    2,   11,
			   12,   12,   16,   16,   16,   16,   16,   16,    3,    4,
			    2,   26,    1,    1,    1,    1,    1,    2,    2,    2,
			   16,   16,    1,   16,   12,    4,    3,    4,    3,    2,
			    2,    1,   12,    2,    2,    1,    2,    1,    2,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			   13,    1,    1,    1,    1,    2,   12,   26,    1,   16,
			   16,   16,   16,    1,   16,   16,   16,   16,   16,   16,

			   16,   16,   16,   16,   16,    1,   16,    1,    1,    1,
			    1,    1,    1,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,   15,   18,   18,    3,    4,   20,   21,
			   22,   23,   27,   28,   29,   39,   40,   41,   42,   43,
			   44,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,   16,    1,    2,   12,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    3,    4,   20,   21,   22,   23,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,   13,   13,    1,    1,    1,

			    1,    1,    1,    3,    3,   13,    3,    1,    1,    3,
			    4,   20,   21,   22,   23,    3,    4,   20,   21,   22,
			   23,    3,    4,   20,   21,   22,   23,    3,    4,   20,
			   21,   22,   23,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    2,    1,   20,    1,
			    3,    1,    1,    1,    4,    1,    2,    3,    4,    1,
			    3,    1,    4,    1,   22,    1,   21,    1,   23,    1,
			   44,    2,    1,    2,    1,    1,    1,   19,    1,    1,
			   17,   17,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    3,    1,    4,    1,
			   20,    1,   21,    1,   22,    1,   23,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    6,    2,    2,
			    2,    1,    9,   10,    2,   11,   14,   15,    3,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    3,    1,    3,    1,    4,    1,   20,    1,   21,
			    1,   22,    1,   23,    3,    1,    4,    1,   20,    1,
			   21,    1,   22,    1,   23,    1,    3,    1,    1,    2,
			    1,    2,    2,    1,    1,    1,    1,   13,    1,    1,

			    1,    1,    1,    3,    1,    4,    1,   20,    1,   21,
			    1,   22,    1,   23,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,   13,    1,    1,   13,    2,    1,    2,
			    2,    1,    1,    3,    3,    1,    1,    1,    1,    1,
			    1,    1,    3,    1,    1,   12,    2,    2,    2,    1,
			    8,    1,    1,    1,    1,    1,    8,    1,    8,    1,
			    1,    1,    2,   13,    8,    1,    1,    1,    1,    1,
			    1,   13,    1,    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER] is
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
			    1,    1,    1,    1,    1,    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER] is
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    0,    0,    0,   95,    0,    0,    0,    0,    0,   83,
			   82,  185,  189,  188,  209,  194,    3,    2,  184,    0,
			   94,    0,   63,   66,   65,    0,   85,   84,   92,   93,
			    0,   98,    1,    5,  118,   60,    0,  101,    0,    0,
			    0,    0,    0,   70,   96,  211,  196,  210,  195,   11,
			   10,   68,   67,  100,  184,   61,    8,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    6,  187,  186,   81,   91,    9,   97,   99,    0,   77,
			   79,   78,   80,    0,   90,   89,   88,   87,   86,   74,

			   73,   71,   72,   75,   76,   64,   62,    0,    0,  120,
			  169,  168,    0,  157,  135,  141,  147,  256,  246,  236,
			  226,  164,  161,    0,  138,   40,  123,  129,  136,  148,
			  142,  155,  162,  124,  130,  125,  131,  143,  137,  149,
			  156,   38,   39,   41,   42,   43,   44,   45,  126,  132,
			  144,  150,  158,  153,  165,  172,    0,   46,  102,  102,
			    0,   12,   13,   47,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   69,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  106,  106,    4,   48,    0,

			  117,    0,    0,  194,  121,    0,  116,  171,  170,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  208,    0,  223,    0,  235,    0,
			  255,    0,  245,    0,  265,  193,  191,  140,  139,  199,
			  197,    0,    0,  214,  212,  163,  192,  198,  213,  128,
			  127,  134,  133,  146,  145,  152,  151,  160,  159,    0,
			  154,  190,  167,  166,  225,  224,  174,  173,    0,    0,
			   51,   52,    0,    0,  119,    0,  206,    0,  221,    0,
			  233,    0,  253,    0,  243,    0,  263,  204,  219,  231,

			  251,  241,  261,  205,  220,  232,  252,  242,  262,  207,
			  222,  234,  254,  244,  264,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   23,    0,    0,    0,   22,  181,  182,
			  183,   24,   15,   16,    7,    0,   21,   37,  123,   14,
			   55,   53,   17,   18,   19,   20,   30,  118,    0,  175,
			  178,  122,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  200,    0,  215,    0,  227,
			    0,  247,    0,  237,    0,  257,  104,    0,    0,    0,
			   36,   32,    0,   50,    0,    0,    0,   31,   49,   24,

			   54,    0,    0,    0,  201,    0,  216,    0,  228,    0,
			  248,    0,  238,    0,  258,  202,  217,  229,  249,  239,
			  259,    0,  103,  108,    0,   28,    0,   34,    0,   33,
			  180,   56,  177,  176,    0,  179,  203,  218,  230,  250,
			  240,  260,  105,    0,  107,   27,    0,    0,   35,    0,
			   58,  111,  109,  110,    0,  118,   57,    0,    0,    0,
			    0,    0,    0,   25,   59,   29,  114,  115,  112,  113,
			  118,   26,    0,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER] is
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			   17,  450,  458,  342,  343,   54,  345,   20,   21,  204,
			   80,  195,  205,  346,  347,   22,   23,   24,   25,   26,
			   27,  280,  124,  125,   28,   29,  277,  128,  129,  130,
			  131,   30,  273,   31,  132,  133,  134,  135,  136,  137,
			  138,  139,  140,  472,  349,   33,  160,   34,  161,  162,
			  351,  352,  353,  354,  355,  356,  357,  141,  142,  143,
			  144,  145,  146,  147,  163,  164,  358,   35,  387,  424,
			  148,  149,  150,  151,  152,  153,  154,  155,  359,  360, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER] is
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			  170,  516,    3,  632,  378,  362,  652,  648,    6, -32768,
			 -32768,   97, -32768, -32768, -32768, -32768, -32768,  419,  300,   11,
			  310,  -39,  -42, -32768, -32768,  559, -32768, -32768, -32768, -32768,
			  586, -32768, -32768,  605,  121, -32768,  497,  642,  583,  582,
			  223,  540,  497, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768,  310, -32768, -32768, -32768, -32768,  352,  629,  632,
			  632,  622,  497,  497,  497,  497,   48,   48,   48,   48,
			   48,   48,   48,   48,   48,   48,   48,  208,  618,  187,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  535, -32768,
			  585,  585,  354,   48, -32768, -32768, -32768, -32768, -32768,  296,

			  296,  296,  296,  296,  296, -32768,  -42,   70,  616, -32768,
			  581,  580,  360, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768,  579,  614,  565, -32768,  577,  576, -32768, -32768,
			 -32768, -32768,  575,  574,  570, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  564,  562,
			  561,  560,  558,  563,  553,  550,  505, -32768,  595,  -25,
			  599, -32768,   23, -32768,  573,  118,  593,  594,  132,  132,
			  132,  132,  316,  309,  299,  265,  256,  252,  226, -32768,
			   36,  180,  261,  148,  195,   52,  138,   38,   28,   12,
			  240,  591,  255,    9,  572,  578,  578, -32768, -32768,  592,

			 -32768,  613,  612,  522, -32768,  518, -32768, -32768, -32768,  230,
			  217,  188,  119,  108,   -2,  571,  569,  568,  567,  566,
			  557,  556,  555,  554,  552,  541,  534,  533,  532,  531,
			  521,  519,  514,  185, -32768,  270, -32768,  113, -32768,  144,
			 -32768,  154, -32768,  165, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768,  538,  530, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  466,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  499,  477,
			 -32768, -32768,  458,  159, -32768,  178, -32768,  224, -32768,  100,
			 -32768,  137, -32768,  110, -32768,  109, -32768, -32768, -32768, -32768,

			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768,  195,  511,   52,  508,  478,
			  504,  475,  495,  448,  488,  433,  487,  433,  433,  433,
			  433,  512,  486, -32768,   11,   13,   11, -32768, -32768, -32768,
			 -32768,  484, -32768, -32768,  496,   42, -32768, -32768,   25, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768,  457,  121,  385,  262,
			 -32768, -32768,  195,  476,   52,  474,  478,  467,  475,  463,
			  448,  456,  433,  455,  445, -32768,  444, -32768,  436, -32768,
			  431, -32768,  430, -32768,  426, -32768,  407,  424,  118,    4,
			 -32768,  437,  368, -32768,   11,  432,  417, -32768, -32768, -32768,

			 -32768,   55,  195,  413, -32768,  410, -32768,  405, -32768,  404,
			 -32768,  399, -32768,  398, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768,  414, -32768,  328,  384, -32768,  327, -32768,   19,  389,
			 -32768,  334, -32768, -32768,  357, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768,  332, -32768,  310,  281,  273, -32768,  419,
			  294,  213,  207,  192,  266,  121,  419,  419,  231,  116,
			  201,  149,  190, -32768,  419, -32768, -32768, -32768, -32768, -32768,
			  121, -32768,   58,   51, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER] is
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -122, -32768, -32768, -32768, -32768,    2,  681,   -7,   43,  397,
			 -351,  520,  286, -32768,  590,  104, -32768,  675,   41, -32768,
			  536,  480, -32768, -32768,  -85,  -79, -32768, -104,  -96, -100,
			 -108, -32768, -32768,  615, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768,  482, -32768,  672, -32768, -32768, -32768,  388, -32768,
			  308, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768,  509, -32768, -32768,  -17, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  263, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER] is
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   55,   52,   18,  126,  177,  425,  397,   51,  174,  127,
			  276,   61,  176,  265,  390,  194,  175,   13,   12,   13,
			   12,   58,  447,   65,   64,   63,   62,  172,  296,  263,
			  446,  158,  118,  173,   10,    9,   60,  247,  426,  261,
			  275,  274,   41,   14,  295,   79,   44,  119,   13,   12,
			   59,  474,   15,   14,  120,  395,  432,   14,  473,   15,
			  214,  220,  226,  232,  211,  217,  223,  229,  213,  219,
			  225,  231,  212,  218,  224,  230,  248,   41,  158, -118,
			  206,    3,  268,  209,  215,  221,  227,   42,  264,  210,
			  216,  222,  228,  266,  394,   57,  250,   57,    3,  257,

			  159,  260,   86,  254,  463,   40,  258,  181,  262,   53,
			  252,  251,   99,  100,  101,  102,  103,  104,  120,  471,
			    5,    4,  203,    3,  252,  251,   57,  202,  201,  119,
			  117,  120,   93,  320,  156,  326,   15,   14,  294,  259,
			   40,  324,   15,  322,  157,    3,   40, -101,  316,  292,
			  120,  119,  118,  117,  293,  159,  318,  118,  256,  467,
			  466,  177,   79,   15,  118,  291,   89,   90,   91,   92,
			  366,   16, -101,  119,   15,   14,   13,   12,   11,  372,
			  370,  106,   15,  319,   15,  367,  117,  373,  109,   15,
			  202,  201,  200,  371,  469,  369,  255,  348,  206,   15,

			  363,   10,    9,  127,    5,    4,    8,  368,  365,  105,
			  202,  201,   15,   14,  321,  378,   37,  384,  290,  214,
			  220,  226,  232,  382,  323,  380,    7,    6,  249,   14,
			  374,  202,  201,  200,  289,  325,  246,  108,  376,   10,
			    9,  267,    5,    4,    8,    3,  468,  288,  362,    2,
			  202,  201,  202,  201,    1,  315,  272,  202,  201,  465,
			  286,  117,  407,  287,  413,  271,   14,  202,  201,  462,
			  411,  470,  409,  348,  245,   14,  285,  403,  461,  127,
			    5,    4,  244,    3,  344,  405,  242,    2,   65,   64,
			   63,   62,   36,  460,  364,  240,  252,  251,  243,  459,

			   -7,   -7,  241,  206,   -7,   -7,   -7,   -7,   83,  253,
			   -7,  239,   56,   -7,   -7,   -7,  433,  434,   -7,   -7,
			   -7,   -7,   -7,   -7,   -7,   -7,   -7,  456,   -7,  238,
			   -7,   -7,   -7,  252,  251,  464,  389,  391,  392,  236,
			  317,   -7,  252,  251,  402,  237,  234,   58,  401,  457,
			   -7,   -7,   -7,   -7,  455,  235,   -7,   -7,   39,   38,
			  344,   -7,  233,  454,   15,   14,   48,   47,   70,   69,
			   68,   67,   -7,   -7,   66,  453,  452,  451,  120,  119,
			  118,  117,   46,   45,   -7,   59,  399,  395,  449,   15,
			   14,   13,   12,  171,  170,  122,  429,  340,  339,  338,

			  121,  448,    3,  120,  119,  118,  117,  116,  115,  114,
			  113,  337,  444,  398,  443,  112,  111,  110,  442,  445,
			   64,   63,   62,   15,   14,   13,   12,   11,  441,  440,
			  169,  168,    5,    4,  439,  438,  336,  335,  334,   55,
			  437,    7,    6,  436,  431,  430,  333,   55,  428,  427,
			   10,    9,  422,  421,  117,    8,  420,    5,    4,  341,
			  419,  418,   15,   14,   13,   12,  417,  119,  122,   57,
			  340,  339,  338,  121,  416,  415,  120,  119,  118,  117,
			  116,  115,  114,  113,  337,  414,  412,  117,  112,  111,
			  110,    5,    4,  410,    3,  118,  120,  408,    2,  330,

			  329,   15,   14,    1,  406,   37,  404,  396,   56,  336,
			  335,  334,  393,  388,    7,    6,  386,  385,  383,  333,
			   15,   14,   39,   38,   37,  381,  331,  332,   10,    9,
			    5,    4,  157,    8,  379,   47,  328,  327,  377,   15,
			   14,  375,   57,   45,  314,  122,  284,   10,    9,  313,
			  121,  312,    8,  120,  119,  118,  117,  116,  115,  114,
			  113,  311,  310,  309,  308,  112,  111,  110,  283,    5,
			    4,  307,    3,   76,   75,   74,    2,   70,   69,   68,
			   67,   36,  306,   66,  305,  304,  303,  302,    5,    4,
			   84,    3,   76,   75,   74,    2,  301,  300,  299,  298,

			   36,  297,   94,   95,   96,   97,   98,    5,    4,   73,
			   72,   71,   70,   69,   68,   67,   48,   46,   66,  282,
			  279,  269,  278,  199,  207,   84,  208,  197,   73,   72,
			   71,   70,   69,   68,   67,  194,  193,   66,  191,  192,
			   37,   85,  179,  165,  190,  107,  189,  188,  187,   88,
			  186,  180,  185,   62,   53,   78,  184,  183,  182,  181,
			   50,  178,  167,  166,   49,  435,  400,   82,   81,   77,
			  350,  198,   32,  270,  423,   87,  281,   43,  123,  196,
			  361,   19, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER] is
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			   17,    8,    0,   88,  112,    1,  357,    1,  112,   88,
			    1,   50,  112,    1,    1,   40,  112,    6,    7,    6,
			    7,   19,    3,   65,   66,   67,   68,  112,   30,    1,
			   11,    8,   20,  112,   31,   32,   75,    1,  389,    1,
			   31,   32,    1,    5,   46,   41,    3,   19,    6,    7,
			   75,    0,    4,    5,   18,   30,    1,    5,    0,    4,
			  168,  169,  170,  171,  168,  169,  170,  171,  168,  169,
			  170,  171,  168,  169,  170,  171,  180,   36,    8,   75,
			  165,   75,  190,  168,  169,  170,  171,   84,  188,  168,
			  169,  170,  171,  189,   52,   84,  181,   84,   75,  184,

			  107,  186,   59,  182,  455,    1,  185,   82,  187,   12,
			   72,   73,   71,   72,   73,   74,   75,   76,   18,  470,
			   72,   73,    4,   75,   72,   73,   84,   72,   73,   19,
			   21,   18,   84,  237,   93,  243,    4,    5,   30,    1,
			   36,  241,    4,  239,   74,   75,   42,   50,  233,   30,
			   18,   19,   20,   21,   46,  162,  235,   20,   10,   43,
			   44,  269,   41,    4,   20,   46,   62,   63,   64,   65,
			   70,    1,   75,   19,    4,    5,    6,    7,    8,   70,
			   70,   77,    4,   70,    4,  289,   21,  295,    1,    4,
			   72,   73,   74,  293,   45,  291,   48,  282,  283,    4,

			  285,   31,   32,  282,   72,   73,   36,   70,  287,    1,
			   72,   73,    4,    5,   70,  319,    8,  325,   30,  327,
			  328,  329,  330,  323,   70,  321,   56,   57,   48,    5,
			  315,   72,   73,   74,   46,   70,   10,   50,  317,   31,
			   32,    1,   72,   73,   36,   75,   45,   30,   70,   79,
			   72,   73,   72,   73,   84,   70,    1,   72,   73,   28,
			   30,   21,  366,   46,  372,   10,    5,   72,   73,    3,
			  370,   81,  368,  358,   48,    5,   46,  362,   86,  358,
			   72,   73,   30,   75,  282,  364,   30,   79,   65,   66,
			   67,   68,   84,   86,   70,   30,   72,   73,   46,   86,

			    0,    1,   46,  388,    4,    5,    6,    7,   85,   48,
			   10,   46,   12,   13,   14,   15,  401,  402,   18,   19,
			   20,   21,   22,   23,   24,   25,   26,  449,   28,   30,
			   30,   31,   32,   72,   73,  457,  334,  335,  336,   30,
			   70,   41,   72,   73,   82,   46,   30,  345,   86,   55,
			   50,   51,   52,   53,   81,   46,   56,   57,    6,    7,
			  358,   61,   46,   82,    4,    5,    4,    5,   72,   73,
			   74,   75,   72,   73,   78,   43,   44,   45,   18,   19,
			   20,   21,    4,    5,   84,   75,    1,   30,   54,    4,
			    5,    6,    7,   33,   34,   10,  394,   12,   13,   14,

			   15,   12,   75,   18,   19,   20,   21,   22,   23,   24,
			   25,   26,   28,   28,   86,   30,   31,   32,    4,  426,
			   66,   67,   68,    4,    5,    6,    7,    8,   30,   30,
			   70,   71,   72,   73,   30,   30,   51,   52,   53,  456,
			   30,   56,   57,   30,   27,   13,   61,  464,   80,   12,
			   31,   32,   28,   46,   21,   36,   30,   72,   73,    1,
			   30,   30,    4,    5,    6,    7,   30,   19,   10,   84,
			   12,   13,   14,   15,   30,   30,   18,   19,   20,   21,
			   22,   23,   24,   25,   26,   30,   30,   21,   30,   31,
			   32,   72,   73,   30,   75,   20,   18,   30,   79,   33,

			   34,    4,    5,   84,   30,    8,   30,   50,   12,   51,
			   52,   53,   28,   27,   56,   57,    4,   30,   30,   61,
			    4,    5,    6,    7,    8,   30,   27,   50,   31,   32,
			   72,   73,   74,   36,   30,    5,   70,   71,   30,    4,
			    5,   30,   84,    5,   30,   10,   28,   31,   32,   30,
			   15,   30,   36,   18,   19,   20,   21,   22,   23,   24,
			   25,   30,   30,   30,   30,   30,   31,   32,   46,   72,
			   73,   30,   75,   33,   34,   35,   79,   72,   73,   74,
			   75,   84,   30,   78,   30,   30,   30,   30,   72,   73,
			   85,   75,   33,   34,   35,   79,   30,   30,   30,   30,

			   84,   30,   66,   67,   68,   69,   70,   72,   73,   69,
			   70,   71,   72,   73,   74,   75,    4,    4,   78,   27,
			   42,   30,   50,   50,   31,   85,   32,   28,   69,   70,
			   71,   72,   73,   74,   75,   40,   86,   78,   75,   86,
			    8,   12,   28,   27,   86,   27,   86,   86,   86,   27,
			   86,   86,   82,   68,   12,   50,   82,   82,   82,   82,
			   12,   82,   82,   82,   12,  402,  358,   85,   85,   83,
			  282,  162,    0,  191,  388,   60,  196,    2,   88,  159,
			  283,    0, yyDummy>>)
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

	yyFinal: INTEGER is 474
			-- Termination state id

	yyFlag: INTEGER is -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER is 87
			-- Number of tokens

	yyLast: INTEGER is 681
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER is 328
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER is 167
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

	execute (in_text:STRING; a_source_start_line: INTEGER; differential_flag: BOOLEAN; an_rm_schema: SCHEMA_ACCESS)
		require
			Rm_schema_available: an_rm_schema /= Void
		do
			reset
			rm_schema := an_rm_schema
			source_start_line := a_source_start_line
			differential_syntax := differential_flag

			create indent.make(0)
			create error_text.make(0)

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
		local
			f_buffer: YY_FILE_BUFFER
		do
			f_buffer ?= input_buffer
			if f_buffer /= Void then
				error_text.append (f_buffer.file.name + ", line ")
			else
				error_text.append ("line ")
			end
			error_text.append ((in_lineno + source_start_line).out + ": " + a_message + " [last cADL token = " + token_name(last_token) + "]%N")
		end

	abort_with_error (err_code: STRING; params: ARRAY [STRING])
		do
			raise_error
			report_error(create_message_line(err_code, params))
			abort
		end

feature -- Access

	error_text: STRING

	output: C_COMPLEX_OBJECT
			
	assertion_list: ARRAYED_LIST [ASSERTION]

	differential_syntax: BOOLEAN
			-- True if the supplied text to parse is differential, in which case it can contain the 
			-- differential syntax variants, i.e. ordering markers and specialisation paths

feature {NONE} -- Implementation

	rm_schema: SCHEMA_ACCESS

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
			-- but doing so probably requires splitting out C_SINGLE_ATTRIBUTE and C_MULTIPLE_ATTRIBUTE
		require
			Attribute_exists: an_attr /= Void
			Object_exists: an_obj /= Void
		local
			err_code: STRING
			ar: ARRAYED_LIST[STRING]
		do
			create ar.make(0)
			ar.extend(an_obj.generating_type) -- $1
			if an_obj.is_addressable then
				ar.extend("node_id=" + an_obj.node_id) -- $2
			else
				ar.extend("rm_type_name=" + an_obj.rm_type_name) -- $2
			end
			ar.extend(an_attr.rm_attribute_name) -- $3

			if an_attr.is_single then
				if an_obj.occurrences /= Void and then (an_obj.occurrences.upper_unbounded or an_obj.occurrences.upper > 1) then
					err_code := "VACSO"
				elseif an_obj.is_addressable and an_attr.has_child_with_id(an_obj.node_id) then
					err_code := "VACSI"
				elseif not an_obj.is_addressable and an_attr.has_child_with_rm_type_name(an_obj.rm_type_name) then
					err_code := "VACSIT"
				else
					Result := True
				end
			elseif an_attr.is_multiple then
				if an_attr.cardinality /= Void and an_obj.occurrences /= Void and (
					not an_attr.cardinality.interval.upper_unbounded and (an_obj.occurrences.upper_unbounded or 
								an_attr.cardinality.interval.upper < an_obj.occurrences.upper)) then
					ar.extend(an_attr.cardinality.interval.as_string)
					ar.extend(an_obj.occurrences.as_string)
					err_code := "VACMC1"
				elseif not an_obj.is_addressable then
					err_code := "VACMI"
				elseif an_attr.has_child_with_id(an_obj.node_id) then
					err_code := "VACMM"
				else
					Result := True
				end
			end

			if not Result then
				abort_with_error(err_code, ar)
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
