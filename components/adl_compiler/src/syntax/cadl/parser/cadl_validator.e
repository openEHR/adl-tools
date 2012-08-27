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
			yyvsp45 := -1
			yyvsp46 := -1
			yyvsp47 := -1
			yyvsp48 := -1
			yyvsp49 := -1
			yyvsp50 := -1
			yyvsp51 := -1
			yyvsp52 := -1
			yyvsp53 := -1
			yyvsp54 := -1
			yyvsp55 := -1
			yyvsp56 := -1
			yyvsp57 := -1
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
			l_yyvs12_default_item: MULTIPLICITY_INTERVAL
			l_yyvs13_default_item: C_PRIMITIVE_OBJECT
			l_yyvs14_default_item: C_PRIMITIVE
			l_yyvs15_default_item: ARCHETYPE_SLOT
			l_yyvs16_default_item: EXPR_ITEM
			l_yyvs17_default_item: EXPR_UNARY_OPERATOR
			l_yyvs18_default_item: EXPR_BINARY_OPERATOR
			l_yyvs19_default_item: EXPR_LEAF
			l_yyvs20_default_item: BOOLEAN
			l_yyvs21_default_item: ISO8601_DATE
			l_yyvs22_default_item: ISO8601_DATE_TIME
			l_yyvs23_default_item: ISO8601_TIME
			l_yyvs24_default_item: ISO8601_DURATION
			l_yyvs25_default_item: CODE_PHRASE
			l_yyvs26_default_item: URI
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
			l_yyvs45_default_item: CARDINALITY
			l_yyvs46_default_item: CONSTRAINT_REF
			l_yyvs47_default_item: C_CODE_PHRASE
			l_yyvs48_default_item: C_DV_ORDINAL
			l_yyvs49_default_item: ORDINAL
			l_yyvs50_default_item: C_BOOLEAN
			l_yyvs51_default_item: C_STRING
			l_yyvs52_default_item: C_DATE_TIME
			l_yyvs53_default_item: C_DURATION
			l_yyvs54_default_item: C_DATE
			l_yyvs55_default_item: C_TIME
			l_yyvs56_default_item: C_REAL
			l_yyvs57_default_item: C_INTEGER
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
			if yyvs45 /= Void then
				yyvs45.fill_with (l_yyvs45_default_item, 0, yyvs45.upper)
			end
			if yyvs46 /= Void then
				yyvs46.fill_with (l_yyvs46_default_item, 0, yyvs46.upper)
			end
			if yyvs47 /= Void then
				yyvs47.fill_with (l_yyvs47_default_item, 0, yyvs47.upper)
			end
			if yyvs48 /= Void then
				yyvs48.fill_with (l_yyvs48_default_item, 0, yyvs48.upper)
			end
			if yyvs49 /= Void then
				yyvs49.fill_with (l_yyvs49_default_item, 0, yyvs49.upper)
			end
			if yyvs50 /= Void then
				yyvs50.fill_with (l_yyvs50_default_item, 0, yyvs50.upper)
			end
			if yyvs51 /= Void then
				yyvs51.fill_with (l_yyvs51_default_item, 0, yyvs51.upper)
			end
			if yyvs52 /= Void then
				yyvs52.fill_with (l_yyvs52_default_item, 0, yyvs52.upper)
			end
			if yyvs53 /= Void then
				yyvs53.fill_with (l_yyvs53_default_item, 0, yyvs53.upper)
			end
			if yyvs54 /= Void then
				yyvs54.fill_with (l_yyvs54_default_item, 0, yyvs54.upper)
			end
			if yyvs55 /= Void then
				yyvs55.fill_with (l_yyvs55_default_item, 0, yyvs55.upper)
			end
			if yyvs56 /= Void then
				yyvs56.fill_with (l_yyvs56_default_item, 0, yyvs56.upper)
			end
			if yyvs57 /= Void then
				yyvs57.fill_with (l_yyvs57_default_item, 0, yyvs57.upper)
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
			when 45 then
				yyvsp45 := yyvsp45 - 1
			when 46 then
				yyvsp46 := yyvsp46 - 1
			when 47 then
				yyvsp47 := yyvsp47 - 1
			when 48 then
				yyvsp48 := yyvsp48 - 1
			when 49 then
				yyvsp49 := yyvsp49 - 1
			when 50 then
				yyvsp50 := yyvsp50 - 1
			when 51 then
				yyvsp51 := yyvsp51 - 1
			when 52 then
				yyvsp52 := yyvsp52 - 1
			when 53 then
				yyvsp53 := yyvsp53 - 1
			when 54 then
				yyvsp54 := yyvsp54 - 1
			when 55 then
				yyvsp55 := yyvsp55 - 1
			when 56 then
				yyvsp56 := yyvsp56 - 1
			when 57 then
				yyvsp57 := yyvsp57 - 1
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
			yyval15: ARCHETYPE_SLOT
			yyval13: C_PRIMITIVE_OBJECT
			yyval14: C_PRIMITIVE
			yyval8: ARRAYED_LIST [ASSERTION]
			yyval7: ASSERTION
			yyval16: EXPR_ITEM
			yyval18: EXPR_BINARY_OPERATOR
			yyval17: EXPR_UNARY_OPERATOR
			yyval2: STRING
			yyval19: EXPR_LEAF
			yyval12: MULTIPLICITY_INTERVAL
			yyval45: CARDINALITY
			yyval57: C_INTEGER
			yyval56: C_REAL
			yyval54: C_DATE
			yyval55: C_TIME
			yyval52: C_DATE_TIME
			yyval53: C_DURATION
			yyval51: C_STRING
			yyval50: C_BOOLEAN
			yyval48: C_DV_ORDINAL
			yyval49: ORDINAL
			yyval47: C_CODE_PHRASE
			yyval46: CONSTRAINT_REF
			yyval27: ARRAYED_LIST [STRING]
			yyval3: INTEGER
			yyval28: ARRAYED_LIST [INTEGER]
			yyval39: INTERVAL [INTEGER]
			yyval4: REAL
			yyval29: ARRAYED_LIST [REAL]
			yyval40: INTERVAL [REAL]
			yyval20: BOOLEAN
			yyval21: ISO8601_DATE
			yyval42: INTERVAL [ISO8601_DATE]
			yyval23: ISO8601_TIME
			yyval41: INTERVAL [ISO8601_TIME]
			yyval22: ISO8601_DATE_TIME
			yyval43: INTERVAL [ISO8601_DATE_TIME]
			yyval24: ISO8601_DURATION
			yyval44: INTERVAL [ISO8601_DURATION]
		do
			inspect yy_act
when 1 then
--|#line 175 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 175")
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
--|#line 187 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 187")
end

			debug("ADL_parse")
				io.put_string("assertion definition parsed%N")
			end
			assertion_list := yyvs8.item (yyvsp8)

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
--|#line 196 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 196")
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
--|#line 205 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 205")
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
--|#line 213 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 213")
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
--|#line 228 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 228")
end

			if yyvs12.item (yyvsp12) /= Void then
				complex_obj.set_occurrences(yyvs12.item (yyvsp12))
			end

			if rm_schema.has_class_definition (complex_obj.rm_type_name) then
				object_nodes.extend(complex_obj)
				debug("ADL_parse")
					io.put_string(indent + "PUSH create OBJECT_NODE " + complex_obj.rm_type_name + " [id=" + complex_obj.node_id + "] ")
					if yyvs12.item (yyvsp12) /= Void then
						io.put_string("; occurrences=(" + yyvs12.item (yyvsp12).as_string + ")") 
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
	yyvsp12 := yyvsp12 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 7 then
--|#line 261 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 261")
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
--|#line 265 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 265")
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
--|#line 269 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 269")
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
--|#line 280 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 280")
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
--|#line 284 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 284")
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
--|#line 290 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 290")
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
--|#line 297 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 297")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 14 then
--|#line 306 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 306")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 15 then
--|#line 309 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 309")
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
--|#line 313 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 313")
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
--|#line 317 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 317")
end

			safe_put_c_attribute_child (c_attrs.item, yyvs15.item (yyvsp15))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp15 := yyvsp15 -1
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
when 18 then
--|#line 321 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 321")
end

			safe_put_c_attribute_child (c_attrs.item, yyvs46.item (yyvsp46))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp46 := yyvsp46 -1
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
--|#line 325 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 325")
end

			safe_put_c_attribute_child(c_attrs.item, yyvs47.item (yyvsp47))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp47 := yyvsp47 -1
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
--|#line 329 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 329")
end

			safe_put_c_attribute_child (c_attrs.item, yyvs48.item (yyvsp48))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp48 := yyvsp48 -1
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
--|#line 333 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 333")
end

			safe_put_c_attribute_child(c_attrs.item, yyvs13.item (yyvsp13))
		
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
when 22 then
--|#line 337 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 337")
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
--|#line 341 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 341")
end

			abort_with_error("SDINV", <<dadl_parser_error>>)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 24 then
--|#line 345 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 345")
end

			abort_with_error("SCCOG", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 25 then
--|#line 356 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 356")
end

			if (create {ARCHETYPE_ID}).valid_id(yyvs2.item (yyvsp2)) then
				create yyval9.make(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
				if yyvs12.item (yyvsp12) /= Void then
					yyval9.set_occurrences(yyvs12.item (yyvsp12))
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp9 := yyvsp9 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
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
--|#line 365 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 365")
end

			if (create {ARCHETYPE_ID}).valid_id(yyvs2.item (yyvsp2)) then
				create yyval9.make_with_slot_id(yyvs2.item (yyvsp2 - 2), yyvs2.item (yyvsp2), yyvs2.item (yyvsp2 - 1))
				if yyvs12.item (yyvsp12) /= Void then
					yyval9.set_occurrences(yyvs12.item (yyvsp12))
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp9 := yyvsp9 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp2 := yyvsp2 -3
	yyvsp12 := yyvsp12 -1
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
--|#line 374 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 374")
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
--|#line 380 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 380")
end

			create og_path.make_from_string (yyvs2.item (yyvsp2))
			if attached arch_internal_ref_node_id then
				create yyval10.make_identified (arch_internal_ref_rm_type_name, arch_internal_ref_node_id, yyvs2.item (yyvsp2))
			else
				create yyval10.make (arch_internal_ref_rm_type_name, yyvs2.item (yyvsp2))

				-- if the C_ATTRIBUTE above this node requires that this node has an identifier, then take it from the target path
				if c_attrs.item.candidate_child_requires_id (yyval10.rm_type_name) then
					-- default to the id from the target path
					if not og_path.last.object_id.is_empty then
						yyval10.set_node_id (og_path.last.object_id)
					else
						-- error will be generated when attempt is made to add this object to C_ATTRIBUTE
					end
				end

			end
			if attached yyvs12.item (yyvsp12) then
				yyval10.set_occurrences (yyvs12.item (yyvsp12))
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
				elseif yyvs12.item (yyvsp12) /= Void then
					io.put_string("occurrences=" + yyval10.occurrences.as_string + " ")
				end
				io.put_string (" => " + yyval10.target_path + "%N") 
				io.put_string (indent + "C_ATTR " + c_attrs.item.rm_attribute_name + " safe_put_c_attribute_child(ARCHETYPE_INTERNAL_REF)%N") 
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp10 := yyvsp10 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp12 := yyvsp12 -1
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
--|#line 420 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 420")
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
--|#line 426 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 426")
end

			arch_internal_ref_rm_type_name := yyvs2.item (yyvsp2)
			arch_internal_ref_node_id := Void
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 31 then
--|#line 431 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 431")
end

			arch_internal_ref_rm_type_name := yyvs2.item (yyvsp2 - 1)
			arch_internal_ref_node_id := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 32 then
--|#line 438 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 438")
end

			if attached yyvs8.item (yyvsp8 - 1) then
				yyvs15.item (yyvsp15).set_includes(yyvs8.item (yyvsp8 - 1))
			end
			if attached yyvs8.item (yyvsp8) then
				yyvs15.item (yyvsp15).set_excludes(yyvs8.item (yyvsp8))
			end

			debug("ADL_parse")
				indent.remove_tail(1)
			end
			yyval15 := yyvs15.item (yyvsp15)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp1 := yyvsp1 -3
	yyvsp8 := yyvsp8 -2
	yyvs15.put (yyval15, yyvsp15)
end
when 33 then
--|#line 452 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 452")
end

			if not (yyvs15.item (yyvsp15).is_closed or yyvs15.item (yyvsp15).is_prohibited) then
				abort_with_error("VASMD", <<yyvs15.item (yyvsp15).rm_type_name, c_attrs.item.path>>)
			end
			yyval15 := yyvs15.item (yyvsp15)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs15.put (yyval15, yyvsp15)
end
when 34 then
--|#line 461 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 461")
end

			if attached yyvs12.item (yyvsp12) then
				yyvs15.item (yyvsp15).set_occurrences(yyvs12.item (yyvsp12))
			end

			debug("ADL_parse")
				io.put_string(indent + "create ARCHETYPE_SLOT " + yyvs15.item (yyvsp15).rm_type_name + " [id=" + yyvs15.item (yyvsp15).node_id + "]")
				if attached yyvs12.item (yyvsp12) then
					io.put_string("; occurrences=(" + yyvs12.item (yyvsp12).as_string + ")") 
				end
				io.new_line
				indent.append("%T")
			end
			yyval15 := yyvs15.item (yyvsp15)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp12 := yyvsp12 -1
	yyvs15.put (yyval15, yyvsp15)
end
when 35 then
--|#line 479 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 479")
end

			create yyval15.make_anonymous(yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp15 := yyvsp15 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
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
when 36 then
--|#line 483 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 483")
end

			if differential_syntax then
				create yyval15.make_anonymous(yyvs2.item (yyvsp2))
				yyval15.set_sibling_order(yyvs11.item (yyvsp11))
			else
				abort_with_error("SDSF", Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp15 := yyvsp15 + 1
	yyvsp11 := yyvsp11 -1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
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
when 37 then
--|#line 492 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 492")
end

			create yyval15.make_identified(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp15 := yyvsp15 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -2
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
when 38 then
--|#line 496 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 496")
end

			if differential_syntax then
				create yyval15.make_identified(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
				yyval15.set_sibling_order(yyvs11.item (yyvsp11))
			else
				abort_with_error("SDSF", Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp15 := yyvsp15 + 1
	yyvsp11 := yyvsp11 -1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -2
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
--|#line 505 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 505")
end

			create yyval15.make_anonymous(yyvs2.item (yyvsp2))
			yyval15.set_closed
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp15 := yyvsp15 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -1
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
--|#line 510 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 510")
end

			create yyval15.make_identified(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
			yyval15.set_closed
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp15 := yyvsp15 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -2
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
--|#line 515 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 515")
end

			abort_with_error("SUAS", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp15 := yyvsp15 + 1
	yyvsp1 := yyvsp1 -2
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
--|#line 521 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 521")
end

			create yyval13.make (yyvs14.item (yyvsp14))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp13 := yyvsp13 + 1
	yyvsp14 := yyvsp14 -1
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
when 43 then
--|#line 527 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 527")
end

			debug("ADL_parse")
				io.put_string(indent + "C_INTEGER: " +  yyvs57.item (yyvsp57).as_string + "%N")
			end
			yyval14 := yyvs57.item (yyvsp57)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp57 := yyvsp57 -1
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
when 44 then
--|#line 534 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 534")
end

			debug("ADL_parse")
				io.put_string(indent + "C_REAL: " +  yyvs56.item (yyvsp56).as_string + "%N")
			end
			yyval14 := yyvs56.item (yyvsp56)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp56 := yyvsp56 -1
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
when 45 then
--|#line 541 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 541")
end

			debug("ADL_parse")
				io.put_string(indent + "C_DATE: " +  yyvs54.item (yyvsp54).as_string + "%N")
			end
			yyval14 := yyvs54.item (yyvsp54)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp54 := yyvsp54 -1
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
when 46 then
--|#line 548 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 548")
end

			debug("ADL_parse")
				io.put_string(indent + "C_TIME: " +  yyvs55.item (yyvsp55).as_string + "%N")
			end
			yyval14 := yyvs55.item (yyvsp55)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp55 := yyvsp55 -1
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
when 47 then
--|#line 555 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 555")
end

			debug("ADL_parse")
				io.put_string(indent + "C_DATE_TIME: " +  yyvs52.item (yyvsp52).as_string + "%N")
			end
			yyval14 := yyvs52.item (yyvsp52)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp52 := yyvsp52 -1
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
when 48 then
--|#line 562 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 562")
end

			debug("ADL_parse")
				io.put_string(indent + "C_DURATION: " +  yyvs53.item (yyvsp53).as_string + "%N")
			end
			yyval14 := yyvs53.item (yyvsp53)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp53 := yyvsp53 -1
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
when 49 then
--|#line 569 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 569")
end

			debug("ADL_parse")
				io.put_string(indent + "C_STRING: " +  yyvs51.item (yyvsp51).as_string + "%N")
			end
			yyval14 := yyvs51.item (yyvsp51)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp51 := yyvsp51 -1
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
when 50 then
--|#line 576 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 576")
end

			debug("ADL_parse")
				io.put_string(indent + "C_BOOLEAN: " +  yyvs50.item (yyvsp50).as_string + "%N")
			end
			yyval14 := yyvs50.item (yyvsp50)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp50 := yyvsp50 -1
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
when 51 then
--|#line 585 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 585")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 52 then
--|#line 592 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 592")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 53 then
--|#line 595 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 595")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 54 then
--|#line 600 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 600")
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
--|#line 608 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 608")
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
--|#line 616 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 616")
end

			abort_with_error("SCAS", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyvs1.put (yyval1, yyvsp1)
end
when 57 then
--|#line 622 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 622")
end

			rm_attribute_name := yyvs2.item (yyvsp2)
			if not object_nodes.item.has_attribute(rm_attribute_name) then
				if rm_schema.has_property (object_nodes.item.rm_type_name, rm_attribute_name) then
					bmm_prop_def := rm_schema.property_definition (object_nodes.item.rm_type_name, rm_attribute_name)
					if bmm_prop_def.is_container then
						create attr_node.make_multiple(rm_attribute_name, yyvs12.item (yyvsp12), yyvs45.item (yyvsp45))
						c_attrs.put(attr_node)
						debug("ADL_parse")
							io.put_string(indent + "PUSH create ATTR_NODE " + rm_attribute_name + "; container = " + attr_node.is_multiple.out)
							if yyvs12.item (yyvsp12) /= Void then io.put_string(" existence={" + yyvs12.item (yyvsp12).as_string + "}") end
							if yyvs45.item (yyvsp45) /= Void then io.put_string("; cardinality=(" + yyvs45.item (yyvsp45).as_string + ")") end
							io.new_line
							io.put_string(indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_attribute(REL)%N") 
							indent.append("%T")
						end
						object_nodes.item.put_attribute(attr_node)
					elseif yyvs45.item (yyvsp45) = Void then
						create attr_node.make_single(rm_attribute_name, yyvs12.item (yyvsp12))
						c_attrs.put(attr_node)
						debug("ADL_parse")
							io.put_string(indent + "PUSH create ATTR_NODE " + rm_attribute_name + "; container = " + attr_node.is_multiple.out) 
							if yyvs12.item (yyvsp12) /= Void then io.put_string(" existence={" + yyvs12.item (yyvsp12).as_string + "}") end
							if yyvs45.item (yyvsp45) /= Void then io.put_string("; cardinality=(" + yyvs45.item (yyvsp45).as_string + ")") end
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
	yyvsp12 := yyvsp12 -1
	yyvsp45 := yyvsp45 -1
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
--|#line 662 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 662")
end

			create og_path.make_from_string (yyvs2.item (yyvsp2))
			rm_attribute_name := og_path.last.attr_name
			parent_path_str := og_path.parent_path.as_string

			if not object_nodes.item.has_attribute(yyvs2.item (yyvsp2)) then
				-- check RM to see if path is valid, and if it is a container
				if rm_schema.has_property_path (object_nodes.item.rm_type_name, yyvs2.item (yyvsp2)) then
					bmm_prop_def := rm_schema.property_definition_at_path (object_nodes.item.rm_type_name, yyvs2.item (yyvsp2))
					if bmm_prop_def.is_container then
						create attr_node.make_multiple(rm_attribute_name, yyvs12.item (yyvsp12), yyvs45.item (yyvsp45))
						attr_node.set_differential_path (parent_path_str)
						c_attrs.put(attr_node)
						debug("ADL_parse")
							io.put_string(indent + "PUSH create ATTR_NODE " + yyvs2.item (yyvsp2) + "; container = " + attr_node.is_multiple.out) 
							if yyvs12.item (yyvsp12) /= Void then io.put_string(" existence={" + yyvs12.item (yyvsp12).as_string + "}") end
							io.new_line
							io.put_string(indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_attribute(REL)%N") 
							indent.append("%T")
						end
						object_nodes.item.put_attribute(attr_node)
					elseif yyvs45.item (yyvsp45) = Void then
						create attr_node.make_single(rm_attribute_name, yyvs12.item (yyvsp12))
						attr_node.set_differential_path (parent_path_str)
						c_attrs.put(attr_node)
						debug("ADL_parse")
							io.put_string(indent + "PUSH create ATTR_NODE " + yyvs2.item (yyvsp2) + "; container = " + attr_node.is_multiple.out) 
							if yyvs12.item (yyvsp12) /= Void then io.put_string(" existence={" + yyvs12.item (yyvsp12).as_string + "}") end
							io.new_line
							io.put_string(indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_attribute(REL)%N") 
							indent.append("%T")
						end
						object_nodes.item.put_attribute(attr_node)
					else -- error - cardinality stated, but on a non-container attribute
						abort_with_error("VSAM2", <<yyvs2.item (yyvsp2)>>)
					end
				else
					abort_with_error("VDIFP2", <<yyvs2.item (yyvsp2)>>)
				end
			else
				abort_with_error("VCATU", <<yyvs2.item (yyvsp2)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp45 := yyvsp45 -1
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
--|#line 708 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 708")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 60 then
--|#line 711 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 711")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 61 then
--|#line 714 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 714")
end

			debug("ADL_parse")
				io.put_string(indent + "ATTR_NODE " + attr_node.rm_attribute_name + "  - any_allowed%N") 
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 62 then
--|#line 722 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 722")
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
--|#line 723 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 723")
end

			debug("include list")
				io.put_string(indent + "[---assertion expression---] %N")
			end
			yyval8 := yyvs8.item (yyvsp8)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs8.put (yyval8, yyvsp8)
end
when 64 then
--|#line 732 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 732")
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
--|#line 733 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 733")
end

			debug("exclude list")
				io.put_string(indent + "[---assertion expression---] %N")
			end
			yyval8 := yyvs8.item (yyvsp8)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs8.put (yyval8, yyvsp8)
end
when 66 then
--|#line 746 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 746")
end

			create yyval8.make(0)
			yyval8.extend (yyvs7.item (yyvsp7))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp8 := yyvsp8 + 1
	yyvsp7 := yyvsp7 -1
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
--|#line 751 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 751")
end

			yyvs8.item (yyvsp8).extend (yyvs7.item (yyvsp7))
			yyval8 := yyvs8.item (yyvsp8)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp7 := yyvsp7 -1
	yyvs8.put (yyval8, yyvsp8)
end
when 68 then
--|#line 758 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 758")
end

			create yyval7.make (yyvs16.item (yyvsp16), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp7 := yyvsp7 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp7 >= yyvsc7 then
		if yyvs7 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs7")
			end
			create yyspecial_routines7
			yyvsc7 := yyInitial_yyvs_size
			yyvs7 := yyspecial_routines7.make (yyvsc7)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs7")
			end
			yyvsc7 := yyvsc7 + yyInitial_yyvs_size
			yyvs7 := yyspecial_routines7.resize (yyvs7, yyvsc7)
		end
	end
	yyvs7.put (yyval7, yyvsp7)
end
when 69 then
--|#line 762 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 762")
end

			create yyval7.make (yyvs16.item (yyvsp16), Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp7 := yyvsp7 + 1
	yyvsp16 := yyvsp16 -1
	if yyvsp7 >= yyvsc7 then
		if yyvs7 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs7")
			end
			create yyspecial_routines7
			yyvsc7 := yyInitial_yyvs_size
			yyvs7 := yyspecial_routines7.make (yyvsc7)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs7")
			end
			yyvsc7 := yyvsc7 + yyInitial_yyvs_size
			yyvs7 := yyspecial_routines7.resize (yyvs7, yyvsc7)
		end
	end
	yyvs7.put (yyval7, yyvsp7)
end
when 70 then
--|#line 770 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 770")
end

			create yyval7.make (yyvs18.item (yyvsp18), Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp7 := yyvsp7 + 1
	yyvsp18 := yyvsp18 -1
	if yyvsp7 >= yyvsc7 then
		if yyvs7 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs7")
			end
			create yyspecial_routines7
			yyvsc7 := yyInitial_yyvs_size
			yyvs7 := yyspecial_routines7.make (yyvsc7)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs7")
			end
			yyvsc7 := yyvsc7 + yyInitial_yyvs_size
			yyvs7 := yyspecial_routines7.resize (yyvs7, yyvsc7)
		end
	end
	yyvs7.put (yyval7, yyvsp7)
end
when 71 then
--|#line 774 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 774")
end

			abort_with_error ("SINVS", <<yyvs2.item (yyvsp2)>>)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp7 := yyvsp7 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp7 >= yyvsc7 then
		if yyvs7 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs7")
			end
			create yyspecial_routines7
			yyvsc7 := yyInitial_yyvs_size
			yyvs7 := yyspecial_routines7.make (yyvsc7)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs7")
			end
			yyvsc7 := yyvsc7 + yyInitial_yyvs_size
			yyvs7 := yyspecial_routines7.resize (yyvs7, yyvsc7)
		end
	end
	yyvs7.put (yyval7, yyvsp7)
end
when 72 then
--|#line 782 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 782")
end

			yyval16 := yyvs19.item (yyvsp19)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp19 := yyvsp19 -1
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
when 73 then
--|#line 786 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 786")
end

			debug("ADL_invariant")
				io.put_string(indent + "boolean_node: REDUCE from boolean_unop_expr: [" + yyvs17.item (yyvsp17).as_string + "]%N") 
			end
			yyval16 := yyvs17.item (yyvsp17)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp17 := yyvsp17 -1
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
--|#line 793 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 793")
end

			yyval16 := yyvs18.item (yyvsp18)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp18 := yyvsp18 -1
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
--|#line 797 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 797")
end

			yyval16 := yyvs18.item (yyvsp18)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp18 := yyvsp18 -1
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
--|#line 801 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 801")
end

			debug("ADL_invariant")
				io.put_string(indent + "boolean_node: REDUCE from boolean_constraint_expr: [" + yyvs18.item (yyvsp18).as_string + "]%N") 
			end
			yyval16 := yyvs18.item (yyvsp18)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp18 := yyvsp18 -1
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
when 77 then
--|#line 808 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 808")
end

			yyval16 := yyvs16.item (yyvsp16)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs16.put (yyval16, yyvsp16)
end
when 78 then
--|#line 818 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 818")
end

			debug("ADL_invariant")
				io.put_string(indent + "arch_outer_constraint_expr: Archetype outer feature " + yyvs2.item (yyvsp2) + " matches {" + yyvs14.item (yyvsp14).as_string + "}%N") 
			end
			create yyval18.make(create {OPERATOR_KIND}.make(op_matches))
			yyval18.set_left_operand (create {EXPR_LEAF}.make_archetype_ref (yyvs2.item (yyvsp2)))
			yyval18.set_right_operand (create {EXPR_LEAF}.make_constraint (yyvs14.item (yyvsp14)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp18 := yyvsp18 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -3
	yyvsp14 := yyvsp14 -1
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
when 79 then
--|#line 829 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 829")
end

			debug("ADL_invariant")
				io.put_string(indent + "boolean_constraint_expr:" + yyvs2.item (yyvsp2) + " matches {" + yyvs14.item (yyvsp14).as_string + "}%N") 
			end
			create yyval18.make(create {OPERATOR_KIND}.make(op_matches))
			yyval18.set_left_operand (create {EXPR_LEAF}.make_archetype_definition_ref (yyvs2.item (yyvsp2)))
			yyval18.set_right_operand (create {EXPR_LEAF}.make_constraint (yyvs14.item (yyvsp14)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp18 := yyvsp18 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -3
	yyvsp14 := yyvsp14 -1
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
when 80 then
--|#line 838 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 838")
end

			debug("ADL_invariant")
				io.put_string(indent + "boolean_constraint_expr:" + yyvs2.item (yyvsp2) + " matches {" + yyvs47.item (yyvsp47).as_string + "}%N") 
			end
			create yyval18.make (create {OPERATOR_KIND}.make (op_matches))
			yyval18.set_left_operand (create {EXPR_LEAF}.make_archetype_definition_ref (yyvs2.item (yyvsp2)))
			yyval18.set_right_operand (create {EXPR_LEAF}.make_coded_term (yyvs47.item (yyvsp47)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp18 := yyvsp18 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -3
	yyvsp47 := yyvsp47 -1
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
when 81 then
--|#line 853 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 853")
end

			debug("ADL_invariant")
				io.put_string(indent + "boolean_unop_expr: exists " + yyvs2.item (yyvsp2) + "%N") 
			end
			create yyval17.make (create {OPERATOR_KIND}.make (op_exists))
			yyval17.set_operand (create {EXPR_LEAF}.make_archetype_definition_ref (yyvs2.item (yyvsp2)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp17 := yyvsp17 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
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
when 82 then
--|#line 861 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 861")
end

			debug("ADL_invariant")
				io.put_string(indent + "boolean_unop_expr: not " + yyvs2.item (yyvsp2) + "%N") 
			end
			create yyval17.make (create {OPERATOR_KIND}.make (op_not))
			yyval17.set_operand (create {EXPR_LEAF}.make_archetype_definition_ref (yyvs2.item (yyvsp2)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp17 := yyvsp17 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
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
when 83 then
--|#line 869 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 869")
end

			debug("ADL_invariant")
				io.put_string(indent + "boolean_unop_expr: not [(" + yyvs16.item (yyvsp16).as_string + ")] %N") 
			end
			create yyval17.make (create {OPERATOR_KIND}.make (op_not))
			yyval17.set_operand (yyvs16.item (yyvsp16))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp17 := yyvsp17 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp16 := yyvsp16 -1
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
when 84 then
--|#line 877 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 877")
end

			abort_with_error ("SEXPT", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp17 := yyvsp17 + 1
	yyvsp1 := yyvsp1 -2
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
when 85 then
--|#line 887 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 887")
end

			debug("ADL_invariant")
				io.put_string(indent + "boolean_binop_expr: [" + yyvs16.item (yyvsp16 - 1).as_string + "] " + yyvs2.item (yyvsp2) + " [" + yyvs16.item (yyvsp16).as_string + "]%N") 
			end
			create yyval18.make (create {OPERATOR_KIND}.make (operator_ids_from_symbols.item (yyvs2.item (yyvsp2))))
			yyval18.set_left_operand(yyvs16.item (yyvsp16 - 1))
			yyval18.set_right_operand(yyvs16.item (yyvsp16))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp18 := yyvsp18 + 1
	yyvsp16 := yyvsp16 -2
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
when 86 then
--|#line 898 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 898")
end

			yyval2 := operator_symbols.item (op_or)
		
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
	yyvs2.put (yyval2, yyvsp2)
end
when 87 then
--|#line 902 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 902")
end

			yyval2 := operator_symbols.item (op_and)
		
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
	yyvs2.put (yyval2, yyvsp2)
end
when 88 then
--|#line 906 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 906")
end

			yyval2 := operator_symbols.item (op_xor)
		
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
	yyvs2.put (yyval2, yyvsp2)
end
when 89 then
--|#line 910 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 910")
end

			yyval2 := operator_symbols.item (op_implies)
		
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
	yyvs2.put (yyval2, yyvsp2)
end
when 90 then
--|#line 920 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 920")
end

			create yyval19.make_boolean (True)
		
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
when 91 then
--|#line 924 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 924")
end

			create yyval19.make_boolean (False)
		
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
when 92 then
--|#line 934 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 934")
end

			debug("ADL_invariant")
				io.put_string(indent + "arithmetic_relop_expr: [" + yyvs16.item (yyvsp16 - 1).as_string + "] " + yyvs2.item (yyvsp2) + " [" + yyvs16.item (yyvsp16).as_string + "]%N") 
			end
			create yyval18.make (create {OPERATOR_KIND}.make (operator_ids_from_symbols.item (yyvs2.item (yyvsp2))))
			yyval18.set_left_operand (yyvs16.item (yyvsp16 - 1))
			yyval18.set_right_operand (yyvs16.item (yyvsp16))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp18 := yyvsp18 + 1
	yyvsp16 := yyvsp16 -2
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
when 93 then
--|#line 949 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 949")
end

			yyval16 := yyvs19.item (yyvsp19)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp19 := yyvsp19 -1
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
--|#line 953 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 953")
end

			yyval16 := yyvs18.item (yyvsp18)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp18 := yyvsp18 -1
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
--|#line 957 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 957")
end

			debug("ADL_invariant")
				io.put_string (indent + "(expr) %N") 
			end
			yyval16 := yyvs16.item (yyvsp16)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs16.put (yyval16, yyvsp16)
end
when 96 then
--|#line 970 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 970")
end

			debug("ADL_invariant")
				io.put_string(indent + "arithmetic_arith_binop_expr: [" + yyvs16.item (yyvsp16 - 1).as_string + "] " + yyvs2.item (yyvsp2) + " [" + yyvs16.item (yyvsp16).as_string + "]%N") 
			end
			create yyval18.make (create {OPERATOR_KIND}.make (operator_ids_from_symbols.item (yyvs2.item (yyvsp2))))
			yyval18.set_left_operand (yyvs16.item (yyvsp16 - 1))
			yyval18.set_right_operand (yyvs16.item (yyvsp16))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp18 := yyvsp18 + 1
	yyvsp16 := yyvsp16 -2
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
when 97 then
--|#line 985 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 985")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_leaf - integer: " + yyvs3.item (yyvsp3).out + "%N") 
			end
			create yyval19.make_integer (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp19 := yyvsp19 + 1
	yyvsp3 := yyvsp3 -1
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
when 98 then
--|#line 992 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 992")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_leaf - real: " + yyvs4.item (yyvsp4).out + "%N") 
			end
			create yyval19.make_real (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp19 := yyvsp19 + 1
	yyvsp4 := yyvsp4 -1
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
when 99 then
--|#line 999 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 999")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_leaf - path: " + yyvs2.item (yyvsp2) + "%N") 
			end
			create yyval19.make_archetype_definition_ref (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp19 := yyvsp19 + 1
	yyvsp2 := yyvsp2 -1
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
when 100 then
--|#line 1008 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1008")
end

			yyval2 := operator_symbols.item (op_eq)
		
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
	yyvs2.put (yyval2, yyvsp2)
end
when 101 then
--|#line 1012 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1012")
end

			yyval2 := operator_symbols.item (op_ne)
		
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
	yyvs2.put (yyval2, yyvsp2)
end
when 102 then
--|#line 1016 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1016")
end

			yyval2 := operator_symbols.item (op_le)
		
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
	yyvs2.put (yyval2, yyvsp2)
end
when 103 then
--|#line 1020 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1020")
end

			yyval2 := operator_symbols.item (op_lt)
		
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
	yyvs2.put (yyval2, yyvsp2)
end
when 104 then
--|#line 1024 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1024")
end

			yyval2 := operator_symbols.item (op_ge)
		
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
	yyvs2.put (yyval2, yyvsp2)
end
when 105 then
--|#line 1028 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1028")
end

			yyval2 := operator_symbols.item (op_gt)
		
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
	yyvs2.put (yyval2, yyvsp2)
end
when 106 then
--|#line 1034 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1034")
end

			yyval2 := operator_symbols.item (op_divide)
		
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
	yyvs2.put (yyval2, yyvsp2)
end
when 107 then
--|#line 1038 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1038")
end

			yyval2 := operator_symbols.item (op_multiply)
		
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
	yyvs2.put (yyval2, yyvsp2)
end
when 108 then
--|#line 1042 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1042")
end

			yyval2 := operator_symbols.item (op_plus)
		
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
	yyvs2.put (yyval2, yyvsp2)
end
when 109 then
--|#line 1046 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1046")
end

			yyval2 := operator_symbols.item (op_minus)
		
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
	yyvs2.put (yyval2, yyvsp2)
end
when 110 then
--|#line 1050 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1050")
end

			yyval2 := operator_symbols.item (op_exp)
		
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
	yyvs2.put (yyval2, yyvsp2)
end
when 111 then
--|#line 1059 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1059")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp12 := yyvsp12 + 1
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
when 112 then
--|#line 1060 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1060")
end

			yyval12 := yyvs12.item (yyvsp12)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyvs12.put (yyval12, yyvsp12)
end
when 113 then
--|#line 1066 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1066")
end

			if yyvs3.item (yyvsp3) = 0 then
				create yyval12.make_prohibited
			elseif yyvs3.item (yyvsp3) = 1 then
				create yyval12.make_mandatory
			else
				abort_with_error("SEXLSG", Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp12 := yyvsp12 + 1
	yyvsp3 := yyvsp3 -1
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
when 114 then
--|#line 1076 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1076")
end

			if yyvs3.item (yyvsp3 - 1) = 0 then
				if yyvs3.item (yyvsp3) = 0 then
					create yyval12.make_point(0)
				elseif yyvs3.item (yyvsp3) = 1 then
					create yyval12.make_bounded(0, 1)
				else
					abort_with_error("SEXLU1", Void)
				end
			elseif yyvs3.item (yyvsp3 - 1) = 1 then
				if yyvs3.item (yyvsp3) = 1 then
					create yyval12.make_point(1)
				else
					abort_with_error("SEXLU2", Void)
				end
			else
				abort_with_error("SEXLMG", Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp12 := yyvsp12 + 1
	yyvsp3 := yyvsp3 -2
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
when 115 then
--|#line 1098 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1098")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp45 := yyvsp45 + 1
	if yyvsp45 >= yyvsc45 then
		if yyvs45 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs45")
			end
			create yyspecial_routines45
			yyvsc45 := yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.make (yyvsc45)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs45")
			end
			yyvsc45 := yyvsc45 + yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.resize (yyvs45, yyvsc45)
		end
	end
	yyvs45.put (yyval45, yyvsp45)
end
when 116 then
--|#line 1099 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1099")
end

			yyval45 := yyvs45.item (yyvsp45)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyvs45.put (yyval45, yyvsp45)
end
when 117 then
--|#line 1105 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1105")
end

			create yyval45.make (yyvs12.item (yyvsp12))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp45 := yyvsp45 + 1
	yyvsp12 := yyvsp12 -1
	if yyvsp45 >= yyvsc45 then
		if yyvs45 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs45")
			end
			create yyspecial_routines45
			yyvsc45 := yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.make (yyvsc45)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs45")
			end
			yyvsc45 := yyvsc45 + yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.resize (yyvs45, yyvsc45)
		end
	end
	yyvs45.put (yyval45, yyvsp45)
end
when 118 then
--|#line 1109 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1109")
end

			create yyval45.make (yyvs12.item (yyvsp12))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp45 := yyvsp45 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp45 >= yyvsc45 then
		if yyvs45 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs45")
			end
			create yyspecial_routines45
			yyvsc45 := yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.make (yyvsc45)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs45")
			end
			yyvsc45 := yyvsc45 + yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.resize (yyvs45, yyvsc45)
		end
	end
	yyvs45.put (yyval45, yyvsp45)
end
when 119 then
--|#line 1113 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1113")
end

			create yyval45.make (yyvs12.item (yyvsp12))
			yyval45.set_unordered
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp45 := yyvsp45 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp45 >= yyvsc45 then
		if yyvs45 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs45")
			end
			create yyspecial_routines45
			yyvsc45 := yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.make (yyvsc45)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs45")
			end
			yyvsc45 := yyvsc45 + yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.resize (yyvs45, yyvsc45)
		end
	end
	yyvs45.put (yyval45, yyvsp45)
end
when 120 then
--|#line 1118 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1118")
end

			create yyval45.make (yyvs12.item (yyvsp12))
			yyval45.set_unique
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp45 := yyvsp45 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp45 >= yyvsc45 then
		if yyvs45 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs45")
			end
			create yyspecial_routines45
			yyvsc45 := yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.make (yyvsc45)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs45")
			end
			yyvsc45 := yyvsc45 + yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.resize (yyvs45, yyvsc45)
		end
	end
	yyvs45.put (yyval45, yyvsp45)
end
when 121 then
--|#line 1123 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1123")
end

			create yyval45.make (yyvs12.item (yyvsp12))
			yyval45.set_unique
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp45 := yyvsp45 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp1 := yyvsp1 -4
	if yyvsp45 >= yyvsc45 then
		if yyvs45 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs45")
			end
			create yyspecial_routines45
			yyvsc45 := yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.make (yyvsc45)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs45")
			end
			yyvsc45 := yyvsc45 + yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.resize (yyvs45, yyvsc45)
		end
	end
	yyvs45.put (yyval45, yyvsp45)
end
when 122 then
--|#line 1128 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1128")
end

			create yyval45.make (yyvs12.item (yyvsp12))
			yyval45.set_unique
			yyval45.set_unordered
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp45 := yyvsp45 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp1 := yyvsp1 -4
	if yyvsp45 >= yyvsc45 then
		if yyvs45 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs45")
			end
			create yyspecial_routines45
			yyvsc45 := yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.make (yyvsc45)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs45")
			end
			yyvsc45 := yyvsc45 + yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.resize (yyvs45, yyvsc45)
		end
	end
	yyvs45.put (yyval45, yyvsp45)
end
when 123 then
--|#line 1134 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1134")
end

			create yyval45.make (yyvs12.item (yyvsp12))
			yyval45.set_unique
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp45 := yyvsp45 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp1 := yyvsp1 -4
	if yyvsp45 >= yyvsc45 then
		if yyvs45 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs45")
			end
			create yyspecial_routines45
			yyvsc45 := yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.make (yyvsc45)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs45")
			end
			yyvsc45 := yyvsc45 + yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.resize (yyvs45, yyvsc45)
		end
	end
	yyvs45.put (yyval45, yyvsp45)
end
when 124 then
--|#line 1139 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1139")
end

			create yyval45.make (yyvs12.item (yyvsp12))
			yyval45.set_unique
			yyval45.set_unordered
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp45 := yyvsp45 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp1 := yyvsp1 -4
	if yyvsp45 >= yyvsc45 then
		if yyvs45 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs45")
			end
			create yyspecial_routines45
			yyvsc45 := yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.make (yyvsc45)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs45")
			end
			yyvsc45 := yyvsc45 + yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.resize (yyvs45, yyvsc45)
		end
	end
	yyvs45.put (yyval45, yyvsp45)
end
when 125 then
--|#line 1147 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1147")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp12 := yyvsp12 + 1
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
when 126 then
--|#line 1148 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1148")
end

			yyval12 := yyvs12.item (yyvsp12)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyvs12.put (yyval12, yyvsp12)
end
when 127 then
--|#line 1152 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1152")
end

			abort_with_error ("SOCCF", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp12 := yyvsp12 + 1
	yyvsp1 := yyvsp1 -2
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
when 128 then
--|#line 1158 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1158")
end

			create yyval12.make_point (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp12 := yyvsp12 + 1
	yyvsp3 := yyvsp3 -1
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
when 129 then
--|#line 1162 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1162")
end

			create yyval12.make_upper_unbounded (0)
		
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
when 130 then
--|#line 1166 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1166")
end

			create yyval12.make_bounded (yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp12 := yyvsp12 + 1
	yyvsp3 := yyvsp3 -2
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
when 131 then
--|#line 1170 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1170")
end

			create yyval12.make_upper_unbounded (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp12 := yyvsp12 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -2
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
when 132 then
--|#line 1178 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1178")
end

			create yyval57.make_list (create {ARRAYED_LIST [INTEGER]}.make_from_array (<<yyvs3.item (yyvsp3)>>))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp57 := yyvsp57 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp57 >= yyvsc57 then
		if yyvs57 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs57")
			end
			create yyspecial_routines57
			yyvsc57 := yyInitial_yyvs_size
			yyvs57 := yyspecial_routines57.make (yyvsc57)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs57")
			end
			yyvsc57 := yyvsc57 + yyInitial_yyvs_size
			yyvs57 := yyspecial_routines57.resize (yyvs57, yyvsc57)
		end
	end
	yyvs57.put (yyval57, yyvsp57)
end
when 133 then
--|#line 1182 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1182")
end

			create yyval57.make_list (yyvs28.item (yyvsp28))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp57 := yyvsp57 + 1
	yyvsp28 := yyvsp28 -1
	if yyvsp57 >= yyvsc57 then
		if yyvs57 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs57")
			end
			create yyspecial_routines57
			yyvsc57 := yyInitial_yyvs_size
			yyvs57 := yyspecial_routines57.make (yyvsc57)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs57")
			end
			yyvsc57 := yyvsc57 + yyInitial_yyvs_size
			yyvs57 := yyspecial_routines57.resize (yyvs57, yyvsc57)
		end
	end
	yyvs57.put (yyval57, yyvsp57)
end
when 134 then
--|#line 1186 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1186")
end

			create yyval57.make_range (yyvs39.item (yyvsp39))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp57 := yyvsp57 + 1
	yyvsp39 := yyvsp39 -1
	if yyvsp57 >= yyvsc57 then
		if yyvs57 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs57")
			end
			create yyspecial_routines57
			yyvsc57 := yyInitial_yyvs_size
			yyvs57 := yyspecial_routines57.make (yyvsc57)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs57")
			end
			yyvsc57 := yyvsc57 + yyInitial_yyvs_size
			yyvs57 := yyspecial_routines57.resize (yyvs57, yyvsc57)
		end
	end
	yyvs57.put (yyval57, yyvsp57)
end
when 135 then
--|#line 1190 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1190")
end

			if yyvs57.item (yyvsp57).valid_value (yyvs3.item (yyvsp3)) then
				yyvs57.item (yyvsp57).set_assumed_value (yyvs3.item (yyvsp3))
				yyval57 := yyvs57.item (yyvsp57)
			else
				abort_with_error ("VOBAV", <<yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyvs57.put (yyval57, yyvsp57)
end
when 136 then
--|#line 1199 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1199")
end

			abort_with_error ("SCIAV", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs57.put (yyval57, yyvsp57)
end
when 137 then
--|#line 1205 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1205")
end

			create yyval56.make_list (create {ARRAYED_LIST [REAL]}.make_from_array (<<yyvs4.item (yyvsp4)>>))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp56 := yyvsp56 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp56 >= yyvsc56 then
		if yyvs56 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs56")
			end
			create yyspecial_routines56
			yyvsc56 := yyInitial_yyvs_size
			yyvs56 := yyspecial_routines56.make (yyvsc56)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs56")
			end
			yyvsc56 := yyvsc56 + yyInitial_yyvs_size
			yyvs56 := yyspecial_routines56.resize (yyvs56, yyvsc56)
		end
	end
	yyvs56.put (yyval56, yyvsp56)
end
when 138 then
--|#line 1209 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1209")
end

			create yyval56.make_list (yyvs29.item (yyvsp29))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp56 := yyvsp56 + 1
	yyvsp29 := yyvsp29 -1
	if yyvsp56 >= yyvsc56 then
		if yyvs56 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs56")
			end
			create yyspecial_routines56
			yyvsc56 := yyInitial_yyvs_size
			yyvs56 := yyspecial_routines56.make (yyvsc56)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs56")
			end
			yyvsc56 := yyvsc56 + yyInitial_yyvs_size
			yyvs56 := yyspecial_routines56.resize (yyvs56, yyvsc56)
		end
	end
	yyvs56.put (yyval56, yyvsp56)
end
when 139 then
--|#line 1213 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1213")
end

			create yyval56.make_range (yyvs40.item (yyvsp40))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp56 := yyvsp56 + 1
	yyvsp40 := yyvsp40 -1
	if yyvsp56 >= yyvsc56 then
		if yyvs56 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs56")
			end
			create yyspecial_routines56
			yyvsc56 := yyInitial_yyvs_size
			yyvs56 := yyspecial_routines56.make (yyvsc56)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs56")
			end
			yyvsc56 := yyvsc56 + yyInitial_yyvs_size
			yyvs56 := yyspecial_routines56.resize (yyvs56, yyvsc56)
		end
	end
	yyvs56.put (yyval56, yyvsp56)
end
when 140 then
--|#line 1217 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1217")
end

			if yyvs56.item (yyvsp56).valid_value (yyvs4.item (yyvsp4)) then
				yyvs56.item (yyvsp56).set_assumed_value (yyvs4.item (yyvsp4))
				yyval56 := yyvs56.item (yyvsp56)
			else
				abort_with_error ("VOBAV", <<yyvs4.item (yyvsp4).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyvs56.put (yyval56, yyvsp56)
end
when 141 then
--|#line 1226 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1226")
end

			abort_with_error("SCRAV", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs56.put (yyval56, yyvsp56)
end
when 142 then
--|#line 1232 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1232")
end

			if valid_iso8601_date_constraint_pattern(yyvs2.item (yyvsp2)) then
				create yyval54.make_from_pattern(yyvs2.item (yyvsp2))
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
	yyvsp54 := yyvsp54 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp54 >= yyvsc54 then
		if yyvs54 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs54")
			end
			create yyspecial_routines54
			yyvsc54 := yyInitial_yyvs_size
			yyvs54 := yyspecial_routines54.make (yyvsc54)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs54")
			end
			yyvsc54 := yyvsc54 + yyInitial_yyvs_size
			yyvs54 := yyspecial_routines54.resize (yyvs54, yyvsc54)
		end
	end
	yyvs54.put (yyval54, yyvsp54)
end
when 143 then
--|#line 1248 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1248")
end

			create yyval54.make_range (create {INTERVAL [ISO8601_DATE]}.make_point(yyvs21.item (yyvsp21)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp54 := yyvsp54 + 1
	yyvsp21 := yyvsp21 -1
	if yyvsp54 >= yyvsc54 then
		if yyvs54 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs54")
			end
			create yyspecial_routines54
			yyvsc54 := yyInitial_yyvs_size
			yyvs54 := yyspecial_routines54.make (yyvsc54)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs54")
			end
			yyvsc54 := yyvsc54 + yyInitial_yyvs_size
			yyvs54 := yyspecial_routines54.resize (yyvs54, yyvsc54)
		end
	end
	yyvs54.put (yyval54, yyvsp54)
end
when 144 then
--|#line 1252 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1252")
end

			create yyval54.make_range (yyvs42.item (yyvsp42))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp54 := yyvsp54 + 1
	yyvsp42 := yyvsp42 -1
	if yyvsp54 >= yyvsc54 then
		if yyvs54 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs54")
			end
			create yyspecial_routines54
			yyvsc54 := yyInitial_yyvs_size
			yyvs54 := yyspecial_routines54.make (yyvsc54)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs54")
			end
			yyvsc54 := yyvsc54 + yyInitial_yyvs_size
			yyvs54 := yyspecial_routines54.resize (yyvs54, yyvsc54)
		end
	end
	yyvs54.put (yyval54, yyvsp54)
end
when 145 then
--|#line 1256 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1256")
end

			if yyvs54.item (yyvsp54).valid_value (yyvs21.item (yyvsp21)) then
				yyvs54.item (yyvsp54).set_assumed_value (yyvs21.item (yyvsp21))
				yyval54 := yyvs54.item (yyvsp54)
			else
				abort_with_error ("VOBAV", <<yyvs21.item (yyvsp21).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp21 := yyvsp21 -1
	yyvs54.put (yyval54, yyvsp54)
end
when 146 then
--|#line 1265 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1265")
end

			abort_with_error ("SCDAV", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs54.put (yyval54, yyvsp54)
end
when 147 then
--|#line 1271 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1271")
end

			if valid_iso8601_time_constraint_pattern(yyvs2.item (yyvsp2)) then
				create yyval55.make_from_pattern(yyvs2.item (yyvsp2))
			else
				create str.make(0)
				across valid_time_constraint_patterns as patterns_csr loop
					if patterns_csr.cursor_index > 1 then
						str.append(", ")
					end
					str.append (patterns_csr.item)
				end
				abort_with_error("SCTPT", <<str>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp55 := yyvsp55 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp55 >= yyvsc55 then
		if yyvs55 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs55")
			end
			create yyspecial_routines55
			yyvsc55 := yyInitial_yyvs_size
			yyvs55 := yyspecial_routines55.make (yyvsc55)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs55")
			end
			yyvsc55 := yyvsc55 + yyInitial_yyvs_size
			yyvs55 := yyspecial_routines55.resize (yyvs55, yyvsc55)
		end
	end
	yyvs55.put (yyval55, yyvsp55)
end
when 148 then
--|#line 1286 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1286")
end

			create yyval55.make_range (create {INTERVAL [ISO8601_TIME]}.make_point(yyvs23.item (yyvsp23)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp55 := yyvsp55 + 1
	yyvsp23 := yyvsp23 -1
	if yyvsp55 >= yyvsc55 then
		if yyvs55 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs55")
			end
			create yyspecial_routines55
			yyvsc55 := yyInitial_yyvs_size
			yyvs55 := yyspecial_routines55.make (yyvsc55)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs55")
			end
			yyvsc55 := yyvsc55 + yyInitial_yyvs_size
			yyvs55 := yyspecial_routines55.resize (yyvs55, yyvsc55)
		end
	end
	yyvs55.put (yyval55, yyvsp55)
end
when 149 then
--|#line 1290 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1290")
end

			create yyval55.make_range (yyvs41.item (yyvsp41))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp55 := yyvsp55 + 1
	yyvsp41 := yyvsp41 -1
	if yyvsp55 >= yyvsc55 then
		if yyvs55 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs55")
			end
			create yyspecial_routines55
			yyvsc55 := yyInitial_yyvs_size
			yyvs55 := yyspecial_routines55.make (yyvsc55)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs55")
			end
			yyvsc55 := yyvsc55 + yyInitial_yyvs_size
			yyvs55 := yyspecial_routines55.resize (yyvs55, yyvsc55)
		end
	end
	yyvs55.put (yyval55, yyvsp55)
end
when 150 then
--|#line 1294 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1294")
end

			if yyvs55.item (yyvsp55).valid_value (yyvs23.item (yyvsp23)) then
				yyvs55.item (yyvsp55).set_assumed_value (yyvs23.item (yyvsp23))
				yyval55 := yyvs55.item (yyvsp55)
			else
				abort_with_error ("VOBAV", <<yyvs23.item (yyvsp23).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp23 := yyvsp23 -1
	yyvs55.put (yyval55, yyvsp55)
end
when 151 then
--|#line 1303 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1303")
end

			abort_with_error ("SCTAV", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs55.put (yyval55, yyvsp55)
end
when 152 then
--|#line 1309 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1309")
end

			if valid_iso8601_date_time_constraint_pattern (yyvs2.item (yyvsp2)) then
				create yyval52.make_from_pattern(yyvs2.item (yyvsp2))
			else
				create str.make (0)
				across valid_date_time_constraint_patterns as patterns_csr loop
					if patterns_csr.cursor_index > 1 then
						str.append(", ")
					end
					str.append (patterns_csr.item)
				end
				abort_with_error("SCDTPT", <<str>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp52 := yyvsp52 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp52 >= yyvsc52 then
		if yyvs52 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs52")
			end
			create yyspecial_routines52
			yyvsc52 := yyInitial_yyvs_size
			yyvs52 := yyspecial_routines52.make (yyvsc52)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs52")
			end
			yyvsc52 := yyvsc52 + yyInitial_yyvs_size
			yyvs52 := yyspecial_routines52.resize (yyvs52, yyvsc52)
		end
	end
	yyvs52.put (yyval52, yyvsp52)
end
when 153 then
--|#line 1324 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1324")
end

			create yyval52.make_range (create {INTERVAL [ISO8601_DATE_TIME]}.make_point(yyvs22.item (yyvsp22)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp52 := yyvsp52 + 1
	yyvsp22 := yyvsp22 -1
	if yyvsp52 >= yyvsc52 then
		if yyvs52 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs52")
			end
			create yyspecial_routines52
			yyvsc52 := yyInitial_yyvs_size
			yyvs52 := yyspecial_routines52.make (yyvsc52)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs52")
			end
			yyvsc52 := yyvsc52 + yyInitial_yyvs_size
			yyvs52 := yyspecial_routines52.resize (yyvs52, yyvsc52)
		end
	end
	yyvs52.put (yyval52, yyvsp52)
end
when 154 then
--|#line 1328 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1328")
end

			create yyval52.make_range (yyvs43.item (yyvsp43))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp52 := yyvsp52 + 1
	yyvsp43 := yyvsp43 -1
	if yyvsp52 >= yyvsc52 then
		if yyvs52 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs52")
			end
			create yyspecial_routines52
			yyvsc52 := yyInitial_yyvs_size
			yyvs52 := yyspecial_routines52.make (yyvsc52)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs52")
			end
			yyvsc52 := yyvsc52 + yyInitial_yyvs_size
			yyvs52 := yyspecial_routines52.resize (yyvs52, yyvsc52)
		end
	end
	yyvs52.put (yyval52, yyvsp52)
end
when 155 then
--|#line 1332 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1332")
end

			if yyvs52.item (yyvsp52).valid_value(yyvs22.item (yyvsp22)) then
				yyvs52.item (yyvsp52).set_assumed_value(yyvs22.item (yyvsp22))
				yyval52 := yyvs52.item (yyvsp52)
			else
				abort_with_error("VOBAV", <<yyvs22.item (yyvsp22).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp22 := yyvsp22 -1
	yyvs52.put (yyval52, yyvsp52)
end
when 156 then
--|#line 1341 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1341")
end

			abort_with_error("SCDTAV", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs52.put (yyval52, yyvsp52)
end
when 157 then
--|#line 1347 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1347")
end

			if valid_iso8601_duration_constraint_pattern (yyvs2.item (yyvsp2)) then
				create yyval53.make_from_pattern (yyvs2.item (yyvsp2))
			else
				abort_with_error("SCDUPT", Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp53 := yyvsp53 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp53 >= yyvsc53 then
		if yyvs53 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs53")
			end
			create yyspecial_routines53
			yyvsc53 := yyInitial_yyvs_size
			yyvs53 := yyspecial_routines53.make (yyvsc53)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs53")
			end
			yyvsc53 := yyvsc53 + yyInitial_yyvs_size
			yyvs53 := yyspecial_routines53.resize (yyvs53, yyvsc53)
		end
	end
	yyvs53.put (yyval53, yyvsp53)
end
when 158 then
--|#line 1355 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1355")
end

			if valid_iso8601_duration_constraint_pattern (yyvs2.item (yyvsp2)) then
				create yyval53.make_pattern_with_range (yyvs2.item (yyvsp2), yyvs44.item (yyvsp44))
			else
				abort_with_error("SCDUPT", Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp53 := yyvsp53 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyvsp44 := yyvsp44 -1
	if yyvsp53 >= yyvsc53 then
		if yyvs53 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs53")
			end
			create yyspecial_routines53
			yyvsc53 := yyInitial_yyvs_size
			yyvs53 := yyspecial_routines53.make (yyvsc53)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs53")
			end
			yyvsc53 := yyvsc53 + yyInitial_yyvs_size
			yyvs53 := yyspecial_routines53.resize (yyvs53, yyvsc53)
		end
	end
	yyvs53.put (yyval53, yyvsp53)
end
when 159 then
--|#line 1363 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1363")
end

			create yyval53.make_range (create {INTERVAL [ISO8601_DURATION]}.make_point(yyvs24.item (yyvsp24)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp53 := yyvsp53 + 1
	yyvsp24 := yyvsp24 -1
	if yyvsp53 >= yyvsc53 then
		if yyvs53 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs53")
			end
			create yyspecial_routines53
			yyvsc53 := yyInitial_yyvs_size
			yyvs53 := yyspecial_routines53.make (yyvsc53)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs53")
			end
			yyvsc53 := yyvsc53 + yyInitial_yyvs_size
			yyvs53 := yyspecial_routines53.resize (yyvs53, yyvsc53)
		end
	end
	yyvs53.put (yyval53, yyvsp53)
end
when 160 then
--|#line 1367 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1367")
end

			create yyval53.make_range (yyvs44.item (yyvsp44))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp53 := yyvsp53 + 1
	yyvsp44 := yyvsp44 -1
	if yyvsp53 >= yyvsc53 then
		if yyvs53 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs53")
			end
			create yyspecial_routines53
			yyvsc53 := yyInitial_yyvs_size
			yyvs53 := yyspecial_routines53.make (yyvsc53)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs53")
			end
			yyvsc53 := yyvsc53 + yyInitial_yyvs_size
			yyvs53 := yyspecial_routines53.resize (yyvs53, yyvsc53)
		end
	end
	yyvs53.put (yyval53, yyvsp53)
end
when 161 then
--|#line 1371 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1371")
end

			if yyvs53.item (yyvsp53).valid_value (yyvs24.item (yyvsp24)) then
				yyvs53.item (yyvsp53).set_assumed_value (yyvs24.item (yyvsp24))
				yyval53 := yyvs53.item (yyvsp53)
			else
				abort_with_error ("VOBAV", <<yyvs24.item (yyvsp24).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp24 := yyvsp24 -1
	yyvs53.put (yyval53, yyvsp53)
end
when 162 then
--|#line 1380 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1380")
end

			abort_with_error("SCDUAV", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs53.put (yyval53, yyvsp53)
end
when 163 then
--|#line 1386 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1386")
end

			create yyval51.make_from_string_list (create {ARRAYED_LIST [STRING]}.make_from_array (<<yyvs2.item (yyvsp2)>>))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp51 := yyvsp51 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp51 >= yyvsc51 then
		if yyvs51 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs51")
			end
			create yyspecial_routines51
			yyvsc51 := yyInitial_yyvs_size
			yyvs51 := yyspecial_routines51.make (yyvsc51)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs51")
			end
			yyvsc51 := yyvsc51 + yyInitial_yyvs_size
			yyvs51 := yyspecial_routines51.resize (yyvs51, yyvsc51)
		end
	end
	yyvs51.put (yyval51, yyvsp51)
end
when 164 then
--|#line 1390 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1390")
end

			create yyval51.make_from_string_list (yyvs27.item (yyvsp27))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp51 := yyvsp51 + 1
	yyvsp27 := yyvsp27 -1
	if yyvsp51 >= yyvsc51 then
		if yyvs51 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs51")
			end
			create yyspecial_routines51
			yyvsc51 := yyInitial_yyvs_size
			yyvs51 := yyspecial_routines51.make (yyvsc51)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs51")
			end
			yyvsc51 := yyvsc51 + yyInitial_yyvs_size
			yyvs51 := yyspecial_routines51.resize (yyvs51, yyvsc51)
		end
	end
	yyvs51.put (yyval51, yyvsp51)
end
when 165 then
--|#line 1394 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1394")
end

			create yyval51.make_from_string_list (yyvs27.item (yyvsp27))
			yyval51.set_open
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp51 := yyvsp51 + 1
	yyvsp27 := yyvsp27 -1
	if yyvsp51 >= yyvsc51 then
		if yyvs51 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs51")
			end
			create yyspecial_routines51
			yyvsc51 := yyInitial_yyvs_size
			yyvs51 := yyspecial_routines51.make (yyvsc51)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs51")
			end
			yyvsc51 := yyvsc51 + yyInitial_yyvs_size
			yyvs51 := yyspecial_routines51.resize (yyvs51, yyvsc51)
		end
	end
	yyvs51.put (yyval51, yyvsp51)
end
when 166 then
--|#line 1399 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1399")
end

			create yyval51.make_from_regexp (yyvs2.item (yyvsp2).substring (2, yyvs2.item (yyvsp2).count - 1), yyvs2.item (yyvsp2).item(1) = '/')
			if yyval51.regexp.is_equal ({C_STRING}.regexp_compile_error) then
				abort_with_error ("SCSRE", <<yyvs2.item (yyvsp2)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp51 := yyvsp51 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp51 >= yyvsc51 then
		if yyvs51 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs51")
			end
			create yyspecial_routines51
			yyvsc51 := yyInitial_yyvs_size
			yyvs51 := yyspecial_routines51.make (yyvsc51)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs51")
			end
			yyvsc51 := yyvsc51 + yyInitial_yyvs_size
			yyvs51 := yyspecial_routines51.resize (yyvs51, yyvsc51)
		end
	end
	yyvs51.put (yyval51, yyvsp51)
end
when 167 then
--|#line 1406 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1406")
end

			if yyvs51.item (yyvsp51).valid_value (yyvs2.item (yyvsp2)) then
				yyvs51.item (yyvsp51).set_assumed_value (yyvs2.item (yyvsp2))
				yyval51 := yyvs51.item (yyvsp51)
			else
				abort_with_error ("VOBAV", <<yyvs2.item (yyvsp2).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyvs51.put (yyval51, yyvsp51)
end
when 168 then
--|#line 1415 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1415")
end

			abort_with_error ("SCSAV", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs51.put (yyval51, yyvsp51)
end
when 169 then
--|#line 1421 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1421")
end

			create yyval50.make_true
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp50 := yyvsp50 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp50 >= yyvsc50 then
		if yyvs50 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs50")
			end
			create yyspecial_routines50
			yyvsc50 := yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.make (yyvsc50)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs50")
			end
			yyvsc50 := yyvsc50 + yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.resize (yyvs50, yyvsc50)
		end
	end
	yyvs50.put (yyval50, yyvsp50)
end
when 170 then
--|#line 1425 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1425")
end

			create yyval50.make_false
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp50 := yyvsp50 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp50 >= yyvsc50 then
		if yyvs50 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs50")
			end
			create yyspecial_routines50
			yyvsc50 := yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.make (yyvsc50)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs50")
			end
			yyvsc50 := yyvsc50 + yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.resize (yyvs50, yyvsc50)
		end
	end
	yyvs50.put (yyval50, yyvsp50)
end
when 171 then
--|#line 1429 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1429")
end

			create yyval50.make_true_false
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp50 := yyvsp50 + 1
	yyvsp1 := yyvsp1 -3
	if yyvsp50 >= yyvsc50 then
		if yyvs50 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs50")
			end
			create yyspecial_routines50
			yyvsc50 := yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.make (yyvsc50)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs50")
			end
			yyvsc50 := yyvsc50 + yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.resize (yyvs50, yyvsc50)
		end
	end
	yyvs50.put (yyval50, yyvsp50)
end
when 172 then
--|#line 1433 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1433")
end

			create yyval50.make_true_false
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp50 := yyvsp50 + 1
	yyvsp1 := yyvsp1 -3
	if yyvsp50 >= yyvsc50 then
		if yyvs50 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs50")
			end
			create yyspecial_routines50
			yyvsc50 := yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.make (yyvsc50)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs50")
			end
			yyvsc50 := yyvsc50 + yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.resize (yyvs50, yyvsc50)
		end
	end
	yyvs50.put (yyval50, yyvsp50)
end
when 173 then
--|#line 1437 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1437")
end

			if yyvs50.item (yyvsp50).valid_value (yyvs20.item (yyvsp20)) then
				yyvs50.item (yyvsp50).set_assumed_value (yyvs20.item (yyvsp20))
			else
				abort_with_error ("VOBAV", <<yyvs20.item (yyvsp20).out>>)
			end
			yyval50 := yyvs50.item (yyvsp50)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp20 := yyvsp20 -1
	yyvs50.put (yyval50, yyvsp50)
end
when 174 then
--|#line 1446 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1446")
end

			abort_with_error ("SCBAV", Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs50.put (yyval50, yyvsp50)
end
when 175 then
--|#line 1452 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1452")
end

			create yyval48.make
			yyval48.add_item (yyvs49.item (yyvsp49))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp48 := yyvsp48 + 1
	yyvsp49 := yyvsp49 -1
	if yyvsp48 >= yyvsc48 then
		if yyvs48 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs48")
			end
			create yyspecial_routines48
			yyvsc48 := yyInitial_yyvs_size
			yyvs48 := yyspecial_routines48.make (yyvsc48)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs48")
			end
			yyvsc48 := yyvsc48 + yyInitial_yyvs_size
			yyvs48 := yyspecial_routines48.resize (yyvs48, yyvsc48)
		end
	end
	yyvs48.put (yyval48, yyvsp48)
end
when 176 then
--|#line 1457 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1457")
end

			if yyvs48.item (yyvsp48).has_item (yyvs49.item (yyvsp49).value) then
				abort_with_error ("VCOV", <<yyvs49.item (yyvsp49).value.out>>)
			elseif yyvs48.item (yyvsp48).has_code_phrase (yyvs49.item (yyvsp49).symbol) then
				abort_with_error ("VCOC", <<yyvs49.item (yyvsp49).symbol.code_string>>)
			else
				yyvs48.item (yyvsp48).add_item (yyvs49.item (yyvsp49))
			end
			yyval48 := yyvs48.item (yyvsp48)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp49 := yyvsp49 -1
	yyvs48.put (yyval48, yyvsp48)
end
when 177 then
--|#line 1468 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1468")
end

			if yyvs48.item (yyvsp48).has_item (yyvs3.item (yyvsp3)) then
				yyvs48.item (yyvsp48).set_assumed_value_from_integer (yyvs3.item (yyvsp3))
			else
				abort_with_error("VOBAV", <<yyvs3.item (yyvsp3).out>>)
			end
			yyval48 := yyvs48.item (yyvsp48)
 		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyvs48.put (yyval48, yyvsp48)
end
when 178 then
--|#line 1477 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1477")
end

			abort_with_error ("SCOAV", Void)
 		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs48.put (yyval48, yyvsp48)
end
when 179 then
--|#line 1483 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1483")
end

			create yyval49.make (yyvs3.item (yyvsp3), create {CODE_PHRASE}.make_from_string (yyvs2.item (yyvsp2)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp49 := yyvsp49 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp49 >= yyvsc49 then
		if yyvs49 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs49")
			end
			create yyspecial_routines49
			yyvsc49 := yyInitial_yyvs_size
			yyvs49 := yyspecial_routines49.make (yyvsc49)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs49")
			end
			yyvsc49 := yyvsc49 + yyInitial_yyvs_size
			yyvs49 := yyspecial_routines49.resize (yyvs49, yyvsc49)
		end
	end
	yyvs49.put (yyval49, yyvsp49)
end
when 180 then
--|#line 1489 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1489")
end

			create yyval47.default_create

			if yyval47.valid_pattern (yyvs2.item (yyvsp2)) then
				yyval47.make_from_pattern (yyvs2.item (yyvsp2))
			else
				abort_with_error("VOBAV", <<yyval47.fail_reason>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp47 := yyvsp47 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp47 >= yyvsc47 then
		if yyvs47 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs47")
			end
			create yyspecial_routines47
			yyvsc47 := yyInitial_yyvs_size
			yyvs47 := yyspecial_routines47.make (yyvsc47)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs47")
			end
			yyvsc47 := yyvsc47 + yyInitial_yyvs_size
			yyvs47 := yyspecial_routines47.resize (yyvs47, yyvsc47)
		end
	end
	yyvs47.put (yyval47, yyvsp47)
end
when 181 then
--|#line 1499 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1499")
end

			create yyval47.make_from_pattern(yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp47 := yyvsp47 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp47 >= yyvsc47 then
		if yyvs47 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs47")
			end
			create yyspecial_routines47
			yyvsc47 := yyInitial_yyvs_size
			yyvs47 := yyspecial_routines47.make (yyvsc47)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs47")
			end
			yyvsc47 := yyvsc47 + yyInitial_yyvs_size
			yyvs47 := yyspecial_routines47.resize (yyvs47, yyvsc47)
		end
	end
	yyvs47.put (yyval47, yyvsp47)
end
when 182 then
--|#line 1505 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1505")
end

			create yyval46.make(yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp46 := yyvsp46 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp46 >= yyvsc46 then
		if yyvs46 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs46")
			end
			create yyspecial_routines46
			yyvsc46 := yyInitial_yyvs_size
			yyvs46 := yyspecial_routines46.make (yyvsc46)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs46")
			end
			yyvsc46 := yyvsc46 + yyInitial_yyvs_size
			yyvs46 := yyspecial_routines46.resize (yyvs46, yyvsc46)
		end
	end
	yyvs46.put (yyval46, yyvsp46)
end
when 183 then
--|#line 1511 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1511")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 184 then
--|#line 1515 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1515")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 185 then
--|#line 1527 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1527")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs2.put (yyval2, yyvsp2)
end
when 186 then
--|#line 1531 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1531")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs2.put (yyval2, yyvsp2)
end
when 187 then
--|#line 1535 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1535")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 188 then
--|#line 1539 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1539")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 189 then
--|#line 1545 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1545")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 190 then
--|#line 1551 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1551")
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
when 191 then
--|#line 1557 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1557")
end

			yyvs27.item (yyvsp27).extend(yyvs2.item (yyvsp2))
			yyval27 := yyvs27.item (yyvsp27)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyvs27.put (yyval27, yyvsp27)
end
when 192 then
--|#line 1567 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1567")
end

			yyval27 := yyvs27.item (yyvsp27)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs27.put (yyval27, yyvsp27)
end
when 193 then
--|#line 1571 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1571")
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
when 194 then
--|#line 1578 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1578")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs3.put (yyval3, yyvsp3)
end
when 195 then
--|#line 1581 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1581")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs3.put (yyval3, yyvsp3)
end
when 196 then
--|#line 1584 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1584")
end

			yyval3 := - yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs3.put (yyval3, yyvsp3)
end
when 197 then
--|#line 1589 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1589")
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
--|#line 1595 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1595")
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
--|#line 1600 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1600")
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
--|#line 1607 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1607")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create yyval39.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), True, True)
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
--|#line 1615 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1615")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create yyval39.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), False, True)
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
--|#line 1623 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1623")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create yyval39.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), True, False)
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
--|#line 1631 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1631")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create yyval39.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), False, False)
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
--|#line 1639 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1639")
end

			create yyval39.make_lower_unbounded(yyvs3.item (yyvsp3), False)
		
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
--|#line 1643 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1643")
end

			create yyval39.make_lower_unbounded(yyvs3.item (yyvsp3), True)
		
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
--|#line 1647 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1647")
end

			create yyval39.make_upper_unbounded(yyvs3.item (yyvsp3), False)
		
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
--|#line 1651 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1651")
end

			create yyval39.make_upper_unbounded(yyvs3.item (yyvsp3), True)
		
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
--|#line 1655 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1655")
end

			create yyval39.make_point(yyvs3.item (yyvsp3))
		
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
--|#line 1661 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1661")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs4.put (yyval4, yyvsp4)
end
when 210 then
--|#line 1665 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1665")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs4.put (yyval4, yyvsp4)
end
when 211 then
--|#line 1669 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1669")
end

			yyval4 := - yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs4.put (yyval4, yyvsp4)
end
when 212 then
--|#line 1675 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1675")
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
--|#line 1681 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1681")
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
--|#line 1686 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1686")
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
--|#line 1693 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1693")
end

			if yyvs4.item (yyvsp4 - 1) <= yyvs4.item (yyvsp4) then
				create yyval40.make_bounded(yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4), True, True)
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
--|#line 1701 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1701")
end

			if yyvs4.item (yyvsp4 - 1) <= yyvs4.item (yyvsp4) then
				create yyval40.make_bounded(yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4), False, True)
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
--|#line 1709 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1709")
end

			if yyvs4.item (yyvsp4 - 1) <= yyvs4.item (yyvsp4) then
				create yyval40.make_bounded(yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4), True, False)
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
--|#line 1717 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1717")
end

			if yyvs4.item (yyvsp4 - 1) <= yyvs4.item (yyvsp4) then
				create yyval40.make_bounded(yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4), False, False)
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
--|#line 1725 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1725")
end

			create yyval40.make_lower_unbounded(yyvs4.item (yyvsp4), False)
		
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
--|#line 1729 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1729")
end

			create yyval40.make_lower_unbounded(yyvs4.item (yyvsp4), True)
		
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
--|#line 1733 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1733")
end

			create yyval40.make_upper_unbounded(yyvs4.item (yyvsp4), False)
		
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
--|#line 1737 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1737")
end

			create yyval40.make_upper_unbounded(yyvs4.item (yyvsp4), True)
		
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
--|#line 1741 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1741")
end

			create yyval40.make_point(yyvs4.item (yyvsp4))
		
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
--|#line 1747 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1747")
end

			yyval20 := True
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp20 := yyvsp20 + 1
	yyvsp1 := yyvsp1 -1
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
when 225 then
--|#line 1751 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1751")
end

			yyval20 := False
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp20 := yyvsp20 + 1
	yyvsp1 := yyvsp1 -1
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
when 226 then
--|#line 1799 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1799")
end

			if valid_iso8601_date(yyvs2.item (yyvsp2)) then
				create yyval21.make_from_string(yyvs2.item (yyvsp2))
			else
				abort_with_error("VIDV", <<yyvs2.item (yyvsp2)>>)
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
when 227 then
--|#line 1827 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1827")
end

			if yyvs21.item (yyvsp21 - 1) <= yyvs21.item (yyvsp21) then
				create yyval42.make_bounded(yyvs21.item (yyvsp21 - 1), yyvs21.item (yyvsp21), True, True)
			else
				abort_with_error("VIVLO", <<yyvs21.item (yyvsp21 - 1).out, yyvs21.item (yyvsp21).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp21 := yyvsp21 -2
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
--|#line 1835 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1835")
end

			if yyvs21.item (yyvsp21 - 1) <= yyvs21.item (yyvsp21) then
				create yyval42.make_bounded(yyvs21.item (yyvsp21 - 1), yyvs21.item (yyvsp21), False, True)
			else
				abort_with_error("VIVLO", <<yyvs21.item (yyvsp21 - 1).out, yyvs21.item (yyvsp21).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp21 := yyvsp21 -2
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
--|#line 1843 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1843")
end

			if yyvs21.item (yyvsp21 - 1) <= yyvs21.item (yyvsp21) then
				create yyval42.make_bounded(yyvs21.item (yyvsp21 - 1), yyvs21.item (yyvsp21), True, False)
			else
				abort_with_error("VIVLO", <<yyvs21.item (yyvsp21 - 1).out, yyvs21.item (yyvsp21).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp21 := yyvsp21 -2
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
--|#line 1851 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1851")
end

			if yyvs21.item (yyvsp21 - 1) <= yyvs21.item (yyvsp21) then
				create yyval42.make_bounded(yyvs21.item (yyvsp21 - 1), yyvs21.item (yyvsp21), False, False)
			else
				abort_with_error("VIVLO", <<yyvs21.item (yyvsp21 - 1).out, yyvs21.item (yyvsp21).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp21 := yyvsp21 -2
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
--|#line 1859 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1859")
end

			create yyval42.make_lower_unbounded(yyvs21.item (yyvsp21), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp21 := yyvsp21 -1
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
--|#line 1863 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1863")
end

			create yyval42.make_lower_unbounded(yyvs21.item (yyvsp21), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp21 := yyvsp21 -1
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
--|#line 1867 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1867")
end

			create yyval42.make_upper_unbounded(yyvs21.item (yyvsp21), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp21 := yyvsp21 -1
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
--|#line 1871 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1871")
end

			create yyval42.make_upper_unbounded(yyvs21.item (yyvsp21), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp21 := yyvsp21 -1
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
--|#line 1875 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1875")
end

			create yyval42.make_point(yyvs21.item (yyvsp21))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp21 := yyvsp21 -1
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
--|#line 1881 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1881")
end

			if valid_iso8601_time(yyvs2.item (yyvsp2)) then
				create yyval23.make_from_string(yyvs2.item (yyvsp2))
			else
				abort_with_error("VITV", <<yyvs2.item (yyvsp2)>>)
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
when 237 then
--|#line 1909 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1909")
end

			if yyvs23.item (yyvsp23 - 1) <= yyvs23.item (yyvsp23) then
				create yyval41.make_bounded(yyvs23.item (yyvsp23 - 1), yyvs23.item (yyvsp23), True, True)
			else
				abort_with_error("VIVLO", <<yyvs23.item (yyvsp23 - 1).out, yyvs23.item (yyvsp23).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp23 := yyvsp23 -2
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
--|#line 1917 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1917")
end

			if yyvs23.item (yyvsp23 - 1) <= yyvs23.item (yyvsp23) then
				create yyval41.make_bounded(yyvs23.item (yyvsp23 - 1), yyvs23.item (yyvsp23), False, True)
			else
				abort_with_error("VIVLO", <<yyvs23.item (yyvsp23 - 1).out, yyvs23.item (yyvsp23).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp23 := yyvsp23 -2
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
--|#line 1925 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1925")
end

			if yyvs23.item (yyvsp23 - 1) <= yyvs23.item (yyvsp23) then
				create yyval41.make_bounded(yyvs23.item (yyvsp23 - 1), yyvs23.item (yyvsp23), True, False)
			else
				abort_with_error("VIVLO", <<yyvs23.item (yyvsp23 - 1).out, yyvs23.item (yyvsp23).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp23 := yyvsp23 -2
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
--|#line 1933 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1933")
end

			if yyvs23.item (yyvsp23 - 1) <= yyvs23.item (yyvsp23) then
				create yyval41.make_bounded(yyvs23.item (yyvsp23 - 1), yyvs23.item (yyvsp23), False, False)
			else
				abort_with_error("VIVLO", <<yyvs23.item (yyvsp23 - 1).out, yyvs23.item (yyvsp23).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp23 := yyvsp23 -2
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
--|#line 1941 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1941")
end

			create yyval41.make_lower_unbounded(yyvs23.item (yyvsp23), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp23 := yyvsp23 -1
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
--|#line 1945 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1945")
end

			create yyval41.make_lower_unbounded(yyvs23.item (yyvsp23), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp23 := yyvsp23 -1
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
--|#line 1949 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1949")
end

			create yyval41.make_upper_unbounded(yyvs23.item (yyvsp23), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp23 := yyvsp23 -1
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
--|#line 1953 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1953")
end

			create yyval41.make_upper_unbounded(yyvs23.item (yyvsp23), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp23 := yyvsp23 -1
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
--|#line 1957 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1957")
end

			create yyval41.make_point(yyvs23.item (yyvsp23))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp23 := yyvsp23 -1
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
--|#line 1963 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1963")
end

			if valid_iso8601_date_time(yyvs2.item (yyvsp2)) then
				create yyval22.make_from_string(yyvs2.item (yyvsp2))
			else
				abort_with_error("VIDTV", <<yyvs2.item (yyvsp2)>>)
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
when 247 then
--|#line 1991 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1991")
end

			if yyvs22.item (yyvsp22 - 1) <= yyvs22.item (yyvsp22) then
				create yyval43.make_bounded(yyvs22.item (yyvsp22 - 1), yyvs22.item (yyvsp22), True, True)
			else
				abort_with_error("VIVLO", <<yyvs22.item (yyvsp22 - 1).out, yyvs22.item (yyvsp22).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp43 := yyvsp43 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp22 := yyvsp22 -2
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
--|#line 1999 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1999")
end

			if yyvs22.item (yyvsp22 - 1) <= yyvs22.item (yyvsp22) then
				create yyval43.make_bounded(yyvs22.item (yyvsp22 - 1), yyvs22.item (yyvsp22), False, True)
			else
				abort_with_error("VIVLO", <<yyvs22.item (yyvsp22 - 1).out, yyvs22.item (yyvsp22).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp43 := yyvsp43 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp22 := yyvsp22 -2
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
--|#line 2007 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2007")
end

			if yyvs22.item (yyvsp22 - 1) <= yyvs22.item (yyvsp22) then
				create yyval43.make_bounded(yyvs22.item (yyvsp22 - 1), yyvs22.item (yyvsp22), True, False)
			else
				abort_with_error("VIVLO", <<yyvs22.item (yyvsp22 - 1).out, yyvs22.item (yyvsp22).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp43 := yyvsp43 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp22 := yyvsp22 -2
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
--|#line 2015 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2015")
end

			if yyvs22.item (yyvsp22 - 1) <= yyvs22.item (yyvsp22) then
				create yyval43.make_bounded(yyvs22.item (yyvsp22 - 1), yyvs22.item (yyvsp22), False, False)
			else
				abort_with_error("VIVLO", <<yyvs22.item (yyvsp22 - 1).out, yyvs22.item (yyvsp22).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp43 := yyvsp43 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp22 := yyvsp22 -2
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
--|#line 2023 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2023")
end

			create yyval43.make_lower_unbounded(yyvs22.item (yyvsp22), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp43 := yyvsp43 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp22 := yyvsp22 -1
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
--|#line 2027 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2027")
end

			create yyval43.make_lower_unbounded(yyvs22.item (yyvsp22), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp43 := yyvsp43 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp22 := yyvsp22 -1
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
--|#line 2031 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2031")
end

			create yyval43.make_upper_unbounded(yyvs22.item (yyvsp22), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp43 := yyvsp43 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp22 := yyvsp22 -1
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
--|#line 2035 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2035")
end

			create yyval43.make_upper_unbounded(yyvs22.item (yyvsp22), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp43 := yyvsp43 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp22 := yyvsp22 -1
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
--|#line 2039 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2039")
end

			create yyval43.make_point(yyvs22.item (yyvsp22))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp43 := yyvsp43 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp22 := yyvsp22 -1
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
--|#line 2045 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2045")
end

			if valid_iso8601_duration(yyvs2.item (yyvsp2)) then
				create yyval24.make_from_string(yyvs2.item (yyvsp2))
			else
				abort_with_error("VIDUV", <<yyvs2.item (yyvsp2)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp24 := yyvsp24 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp24 >= yyvsc24 then
		if yyvs24 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs24")
			end
			create yyspecial_routines24
			yyvsc24 := yyInitial_yyvs_size
			yyvs24 := yyspecial_routines24.make (yyvsc24)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs24")
			end
			yyvsc24 := yyvsc24 + yyInitial_yyvs_size
			yyvs24 := yyspecial_routines24.resize (yyvs24, yyvsc24)
		end
	end
	yyvs24.put (yyval24, yyvsp24)
end
when 257 then
--|#line 2073 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2073")
end

			if yyvs24.item (yyvsp24 - 1) <= yyvs24.item (yyvsp24) then
				create yyval44.make_bounded(yyvs24.item (yyvsp24 - 1), yyvs24.item (yyvsp24), True, True)
			else
				abort_with_error("VIVLO", <<yyvs24.item (yyvsp24 - 1).out, yyvs24.item (yyvsp24).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp44 := yyvsp44 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp24 := yyvsp24 -2
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
--|#line 2081 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2081")
end

			if yyvs24.item (yyvsp24 - 1) <= yyvs24.item (yyvsp24) then
				create yyval44.make_bounded(yyvs24.item (yyvsp24 - 1), yyvs24.item (yyvsp24), False, True)
			else
				abort_with_error("VIVLO", <<yyvs24.item (yyvsp24 - 1).out, yyvs24.item (yyvsp24).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp44 := yyvsp44 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp24 := yyvsp24 -2
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
--|#line 2089 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2089")
end

			if yyvs24.item (yyvsp24 - 1) <= yyvs24.item (yyvsp24) then
				create yyval44.make_bounded(yyvs24.item (yyvsp24 - 1), yyvs24.item (yyvsp24), True, False)
			else
				abort_with_error("VIVLO", <<yyvs24.item (yyvsp24 - 1).out, yyvs24.item (yyvsp24).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp44 := yyvsp44 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp24 := yyvsp24 -2
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
--|#line 2097 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2097")
end

			if yyvs24.item (yyvsp24 - 1) <= yyvs24.item (yyvsp24) then
				create yyval44.make_bounded(yyvs24.item (yyvsp24 - 1), yyvs24.item (yyvsp24), False, False)
			else
				abort_with_error("VIVLO", <<yyvs24.item (yyvsp24 - 1).out, yyvs24.item (yyvsp24).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp44 := yyvsp44 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp24 := yyvsp24 -2
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
--|#line 2105 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2105")
end

			create yyval44.make_lower_unbounded(yyvs24.item (yyvsp24), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp44 := yyvsp44 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp24 := yyvsp24 -1
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
--|#line 2109 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2109")
end

			create yyval44.make_lower_unbounded(yyvs24.item (yyvsp24), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp44 := yyvsp44 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp24 := yyvsp24 -1
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
--|#line 2113 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2113")
end

			create yyval44.make_upper_unbounded(yyvs24.item (yyvsp24), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp44 := yyvsp44 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp24 := yyvsp24 -1
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
--|#line 2117 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2117")
end

			create yyval44.make_upper_unbounded(yyvs24.item (yyvsp24), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp44 := yyvsp44 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp24 := yyvsp24 -1
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
--|#line 2121 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2121")
end

			create yyval44.make_point(yyvs24.item (yyvsp24))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp44 := yyvsp44 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp24 := yyvsp24 -1
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
			when 463 then
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
			    2,   67,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,   81,    2,   82,   80,    2,    2,    2,    2,    2,

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
			   65,   66,   68,   69,   70,   71,   72,   77,   78,   79, yyDummy>>)
		end

	yyr1_template: SPECIAL [INTEGER]
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,  151,  151,  151,  152,  152,  153,  155,  155,  155,
			   95,   95,  154,  154,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,   92,   92,   92,   93,   93,
			  159,  159,  104,  104,  103,  102,  102,  102,  102,  102,
			  102,  102,  100,  101,  101,  101,  101,  101,  101,  101,
			  101,  156,  157,  157,  160,  160,  160,  161,  161,  162,
			  162,  162,   89,   89,   90,   90,   88,   88,   91,   91,
			   91,   91,  105,  105,  105,  105,  105,  105,  110,  111,
			  111,  106,  106,  106,  106,  107,  136,  136,  136,  136,
			  113,  113,  108,  114,  114,  114,  109,  112,  112,  112,

			  135,  135,  135,  135,  135,  135,  134,  134,  134,  134,
			  134,   97,   97,   99,   99,  137,  137,  138,  138,  138,
			  138,  138,  138,  138,  138,   96,   96,   96,   98,   98,
			   98,   98,  150,  150,  150,  150,  150,  149,  149,  149,
			  149,  149,  147,  147,  147,  147,  147,  148,  148,  148,
			  148,  148,  145,  145,  145,  145,  145,  146,  146,  146,
			  146,  146,  146,  144,  144,  144,  144,  144,  144,  143,
			  143,  143,  143,  143,  143,  141,  141,  141,  141,  142,
			  140,  140,  139,  122,  122,   94,   94,   94,   94,  123,
			  124,  124,  125,  125,  115,  115,  115,  126,  126,  126,

			  128,  128,  128,  128,  128,  128,  128,  128,  128,  116,
			  116,  116,  127,  127,  127,  129,  129,  129,  129,  129,
			  129,  129,  129,  129,  117,  117,  118,  131,  131,  131,
			  131,  131,  131,  131,  131,  131,  120,  130,  130,  130,
			  130,  130,  130,  130,  130,  130,  119,  132,  132,  132,
			  132,  132,  132,  132,  132,  132,  121,  133,  133,  133,
			  133,  133,  133,  133,  133,  133, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    2,    2,    2,    2,    2,    4,    3,    1,    8,    7,
			    2,   11,   16,   17,   18,   18,   18,   18,   18,   19,
			   19,   16,    3,    4,    2,    1,    1,    1,    1,    2,
			    2,   16,   16,    4,    3,    4,    3,    1,    2,    2,
			    1,    2,    2,    1,    1,    7,    2,    2,    1,    2,
			    1,    1,    1,    1,    2,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    2,    2,    1,    1,
			    1,   12,    1,    1,    1,    1,   16,    1,    1,    2,
			   16,    1,    2,   16,   16,    1,   16,    1,    1,    1,

			    1,    1,    1,    1,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,   14,    3,    4,   21,   22,   23,
			   24,   27,   27,   28,   29,   39,   40,   41,   42,   43,
			   44,   50,   51,   52,   53,   54,   55,   56,   57,    2,
			    2,   14,   47,   16,    1,    2,    2,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    3,
			    4,   21,   22,   23,   24,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,   12,   12,    1,    1,    1,    1,
			    1,    1,    3,   12,    3,    1,    1,    3,    4,   21,

			   22,   23,   24,    3,    4,   21,   22,   23,   24,    3,
			    4,   21,   22,   23,   24,    3,    4,   21,   22,   23,
			   24,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,   44,    1,    2,    1,    3,    1,
			    1,    1,    4,    1,    2,    3,    4,    1,    1,    1,
			   20,    2,    1,    2,    1,   22,    1,   24,    1,   21,
			    1,   23,    1,    4,    1,    3,    1,    1,   45,   45,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    3,    1,    4,    1,   21,    1,
			   22,    1,   23,    1,   24,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    6,    2,    1,    9,   10,
			    2,   11,   13,   14,   15,   15,   15,    3,   46,   47,
			   48,   49,    1,    1,    1,    1,    1,    1,    3,    1,
			    3,    1,    4,    1,   21,    1,   22,    1,   23,    1,
			   24,    3,    1,    4,    1,   21,    1,   22,    1,   23,
			    1,   24,    1,    3,   12,    1,    2,    1,    2,    2,
			    1,    1,   12,    1,    1,    1,    1,   12,    1,    1,
			    1,    3,    1,    4,    1,   21,    1,   22,    1,   23,

			    1,   24,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,   12,   45,    2,    1,    1,    2,    1,    1,    2,
			    1,    2,    1,    3,    3,   49,    2,    1,    1,    1,
			    1,    1,    1,    3,    1,    1,    1,    2,    2,    2,
			    1,    8,    1,    1,    1,    1,    1,    8,    1,    8,
			    1,    1,    1,    2,   12,    8,    1,    1,    1,    1,
			    1,    1,   12,    1,    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER]
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    2,    3,    4,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    5,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    6,    1,
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
			    0,    0,    0,    0,    0,    0,    0,    0,   91,   90,
			    0,   99,  184,  188,  187,  209,  194,    3,    2,   66,
			  183,    0,   69,   73,   74,   75,   94,   70,   76,   93,
			   72,    0,   97,   98,    0,    1,    5,  125,    0,    0,
			    0,    0,    0,  211,  196,  210,  195,    0,   82,   81,
			   84,   11,   10,    0,    0,   67,  183,    8,    0,    0,
			   87,   88,   86,   89,    0,  110,  106,  107,  109,  108,
			  104,  102,  105,  103,  101,  100,    0,    0,    0,    0,
			    0,    6,  186,  185,   77,   95,    0,    0,    0,    9,
			   85,    0,   99,   96,   92,   71,   68,    0,    0,  127,

			   83,  170,  169,    0,  157,  142,  147,  152,  256,  246,
			  236,  226,  166,  163,    0,  132,  137,  143,  153,  148,
			  159,  164,  165,  133,  138,  134,  139,  149,  144,  154,
			  160,   50,   49,   47,   48,   45,   46,   44,   43,  180,
			  181,    0,    0,    0,   51,  111,  111,    0,   12,   13,
			   52,   55,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,   78,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,   79,   80,    0,  115,  115,    4,   53,    0,  129,
			    0,    0,  194,    0,  128,  172,  171,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  208,    0,  223,    0,  235,    0,  255,    0,
			  245,    0,  265,    0,  158,  193,  190,  199,  197,    0,
			    0,  214,  212,  192,  191,  198,  213,  225,  224,  174,
			  173,  189,  168,  167,  156,  155,  162,  161,  146,  145,
			  151,  150,  141,  140,  136,  135,    0,    0,   58,   57,
			    0,    0,  126,  207,  222,  234,  254,  244,  264,  205,
			  220,  232,  252,  242,  262,    0,  206,    0,  221,    0,
			  233,    0,  253,    0,  243,    0,  263,  204,  219,  231,

			  251,  241,  261,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,   23,    0,    0,    0,   22,  182,   24,   15,   16,
			    7,    0,   21,   42,  125,   33,   17,  132,   18,   19,
			   20,  175,   14,   61,   59,  125,    0,  131,  130,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  200,    0,  215,    0,  227,    0,  247,    0,
			  237,    0,  257,  113,    0,    0,    0,   41,   35,    0,
			   56,    0,   34,    0,    0,    0,    0,    0,   54,   24,
			   60,    0,  201,    0,  216,    0,  228,    0,  248,    0,

			  238,    0,  258,  202,  217,  229,  249,  239,  259,    0,
			  112,  117,    0,   31,   29,   39,   37,    0,   27,   36,
			   62,  179,  178,  177,    0,  176,   28,  203,  218,  230,
			  250,  240,  260,  114,    0,  116,   40,    0,    0,   38,
			    0,   64,  120,  118,  119,    0,  125,   63,    0,    0,
			    0,    0,    0,    0,   25,   65,   32,  123,  124,  121,
			  122,  125,   26,    0,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			   18,  441,  449,   19,  328,  329,   56,  331,   81,  184,
			  193,  374,  332,  333,  334,  335,  336,   22,   23,   24,
			   25,   26,   27,   28,   29,   30,   31,   32,   33,  250,
			  117,  118,  119,  120,   34,  253,  121,  122,  123,  124,
			  125,  126,  127,  128,  129,  130,   76,   77,   64,  268,
			  412,  338,  339,  340,  341,  131,  132,  133,  134,  135,
			  136,  137,  138,  463,  342,   36,  147,   37,  148,  149,
			  344,  345,  150,  151,  346, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			  150,  241,  341,  323,  -10,   33,  653,  639, -32768, -32768,
			  624,  623, -32768, -32768, -32768, -32768, -32768, -32768,  383, -32768,
			  329,   25,  344, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768,  552, -32768, -32768,  587, -32768,  622,    9,  500,  586,
			  578,  399,  470, -32768, -32768, -32768, -32768,  500, -32768, -32768,
			 -32768, -32768, -32768,  621,  620, -32768, -32768, -32768,  306,  636,
			 -32768, -32768, -32768, -32768,  500, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768,   41,   41,  177,  615,
			   13, -32768, -32768, -32768, -32768, -32768,  348,  582,  557, -32768,
			  344,   41, -32768,  478,  478, -32768,  344,   12,  614, -32768,

			 -32768,  580,  579,  208,  585, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768,  577,  609,  576,  575, -32768, -32768, -32768,
			 -32768,  574, -32768,  571,  570, -32768, -32768, -32768, -32768, -32768,
			 -32768,  565,  560,  559,  558,  555,  554,  553,  549, -32768,
			 -32768,  608,  607,  437, -32768,  598,  598,  604, -32768,  199,
			 -32768,  588,   59,  584,  595,  264,  264,  264,  264,  340,
			  336,  328,  279,  278,  277,  581,  162, -32768,  159,  124,
			  131,  192,  220,  203,  163,   34,   16,   20,   22,   50,
			   87, -32768, -32768,  573,  572,  572, -32768, -32768,  583, -32768,
			  606,  597,  512,  502, -32768, -32768, -32768,  568,  567,  566,

			  564,  563,  562,  561,  556,  544,  543,  537,  536,  263,
			  256,  210,  137,   -5,   -7,  533,  531,  528,  525,  504,
			  503,  223, -32768,   79, -32768,   -1, -32768,  125, -32768,   96,
			 -32768,  136, -32768,  247, -32768, -32768, -32768, -32768, -32768,  526,
			  523, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768,  498,  484, -32768, -32768,
			  474,  114, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768,  186, -32768,   76, -32768,   -4,
			 -32768,  108, -32768,   32, -32768,  123, -32768, -32768, -32768, -32768,

			 -32768, -32768, -32768,  192,  492,  220,  487,  452,  486,  445,
			  483,  442,  482,  431,  477,  431,  431,  431,  431,  489,
			  453, -32768,   25,    4,   25, -32768, -32768,  460, -32768, -32768,
			  471,   35, -32768, -32768,    9,  432, -32768,  -19, -32768, -32768,
			  -57, -32768, -32768, -32768, -32768,    9,  418, -32768, -32768,  192,
			  444,  220,  441,  452,  439,  445,  426,  442,  423,  431,
			  421,  404, -32768,  403, -32768,  395, -32768,  394, -32768,  389,
			 -32768,  388, -32768,  375,  382,   59,  357, -32768,  109,   11,
			 -32768,   25, -32768,  386,  400,   65,  192,  385, -32768, -32768,
			 -32768,  366, -32768,  365, -32768,  364, -32768,  362, -32768,  354,

			 -32768,  352, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  374,
			 -32768,  283,  318, -32768, -32768, -32768,  287,  168, -32768,  319,
			  259, -32768, -32768, -32768,  271, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768,  324, -32768, -32768,  166,  191, -32768,
			  383,  239,  189,  167,  157,  236,    9,  383,  383,  179,
			  102,  153,   -9,   58, -32768,  383, -32768, -32768, -32768, -32768,
			 -32768,    9, -32768,   52,   29, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -157, -32768, -32768,  -18, -32768, -32768,    1,  681, -330,  534,
			  304, -32768, -32768,  305, -32768, -32768, -32768,   47, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768,   36,  -85,  -79, -32768,
			  -49,  -53,  -59,  -96, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768,  513, -32768, -32768, -32768,  491,
			 -32768, -32768,  589, -32768,  288, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768,  670, -32768, -32768, -32768,  405, -32768,
			  327, -32768,  517, -32768, -32768, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   55,   20,  115,  115,  382,  377,   48,  164,  116,  116,
			   14,   13,  418,  384,   99,  387,  111,  256,  159,  111,
			  146,  258,   59,  260,  160,  296,  386,  294,  145,  465,
			  385,   14,   13,  460,   50,  254,  295,   42,  293,  108,
			  111,   14,   13,  110,  163,   16,   15,   80,   41,   49,
			  162,  262,  464,  110,  161,   15,  109,   92,   98,  202,
			  208,  214,  220,  192,  168,  353,  422,  194,  307,   16,
			  197,  203,  209,  215,   42,   47,  198,  204,  210,  216,
			  257,   15,  381,  238,   15,   41,  245,  144,  264,   58,
			  242,   16,  417,  246,   86,  265,  201,  207,  213,  219,

			  263,  357,  200,  206,  212,  218,  199,  205,  211,  217,
			   58,   90,   93,   94,    3,    2,  454,  110,   16,  261,
			   58,  416,  255,  240,  239,   96,   91,  143,  259,   15,
			  109,  462,  191,  190,  189,  314,  304,  164,  191,  190,
			  461,  244,  458,  457,  306,  351,  108,  109,  305,  240,
			  239,   17,  240,  239,   16,   15,   14,   13,   12,  108,
			  191,  190,  415,   16,  252,  311,   11,   10,  241,  292,
			  312,  438,  236,  251,  310,  243,  308,  355,   95,  437,
			  291,   16,   15,    9,    8,  337,  348,  191,  190,  347,
			   16,  116,  359,   11,  309,  459,   16,  240,  239,  360,

			  350,    7,    6,  237,  249,  313,  235,  146,  352,  456,
			    9,    8,   16,   15,    5,  145,    4,  371,  361,  202,
			  208,  214,  220,    3,    2,   15,  363,   16,  111,  110,
			  109,  108,  191,  190,  358,    1,  248,  247,  356,  453,
			  354,    5,  290,    4,  452,   16,   15,   40,   39,  445,
			    3,    2,  369,  289,  451,  349,  367,   11,  365,  191,
			  190,  337,   38,  401,  391,  191,  190,  116,   16,   15,
			  108,  330,  393,  446,    9,    8,  450,  158,  157,  156,
			  155,    3,    2,  447,  111,  110,  109,  108,  288,  448,
			  194,  455,  303,  240,  239,  286,  191,  190,  399,  287,

			  423,  424,  397,  384,  395,    5,  285,    4,  440,  232,
			  230,  228,   40,   39,    3,    2,  318,  317,  316,  315,
			  231,  229,  227,  376,  378,  379,   38,   46,   45,   -7,
			   -7,  439,   59,   -7,   -7,   -7,   -7,    3,    2,   -7,
			  436,   57,   -7,   -7,   -7,   44,   43,  330,  435,   -7,
			   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,  414,   -7,
			  226,   -7,   -7,   -7,  444,  443,  442,   -7,  224,  413,
			  434,  225,  222,  -30,   -7,   -7,   -7,   -7,  433,  223,
			   -7,   -7,  419,  221,  432,   -7,  431,   16,   15,   14,
			   13,   12,  114,  141,  430,  -30,  429,  428,  427,   11,

			   10,  426,   -7,   -7,   63,   62,   61,   60,   63,   62,
			   61,   60,  410,  421,   -7,  420,    9,    8,  409,  389,
			  408,  407,   16,   15,   14,   13,  406,  405,  113,   55,
			  326,  140,  139,  112,  100,  404,  403,   55,  111,  110,
			  109,  108,  107,  106,  105,  104,  325,    5,  388,    4,
			  103,  102,  101,  402,  108,  400,    3,    2,  398,   63,
			   62,   61,   60,  110,  324,  323,  322,  109,    1,    7,
			    6,  396,  111,  394,  321,  327,  392,  383,   16,   15,
			   14,   13,  375,   57,  113,   84,  326,  140,  139,  112,
			  380,    3,    2,  373,  111,  110,  109,  108,  107,  106,

			  105,  104,  325,   58,   16,   15,  103,  102,  101,  372,
			   69,   68,   67,   66,  370,  368,   11,   65,  366,  364,
			  324,  323,  322,   85,  362,    7,    6,  319,   45,  320,
			  321,   43,  272,    9,    8,  302,  301,   75,   74,   73,
			   72,   71,   70,   69,   68,   67,   66,    3,    2,  144,
			   65,   69,   68,   67,   66,  271,   85,  300,   65,   58,
			  299,   16,   15,  298,    5,  297,    4,  113,  284,  283,
			  140,  139,  112,    3,    2,  282,  281,  111,  110,  109,
			  108,  107,  106,  105,  104,   38,   16,   15,  280,  103,
			  102,  101,  113,  279,  278,  277,  276,  112,  275,  274,

			  273,   46,  111,  110,  109,  108,  107,  106,  105,  104,
			   44,  267,  270,  233,  103,  102,  101,  195,  266,   75,
			   74,   73,   72,   71,   70,   69,   68,   67,   66,  196,
			    3,    2,   65,  188,  186,  183,  180,  182,  181,  167,
			  179,  178,  177,  152,   97,  176,  175,  174,   89,   88,
			   87,   52,  173,  172,  171,    3,    2,  170,  169,  168,
			  166,  165,  154,  153,   83,   51,  187,   79,   54,   53,
			   35,   78,   82,  390,  425,  343,  269,  142,  234,  411,
			  185,   21, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			   18,    0,   87,   88,  334,    1,   16,  103,   87,   88,
			    6,    7,    1,   32,    1,  345,   20,    1,  103,   20,
			    8,    1,   21,    1,  103,   32,   83,   32,   16,    0,
			   87,    6,    7,   42,    1,    1,   43,    1,   43,   23,
			   20,    6,    7,   21,  103,    4,    5,   38,    1,   16,
			  103,    1,    0,   21,  103,    5,   22,   16,   45,  155,
			  156,  157,  158,    4,   83,   69,    1,  152,   69,    4,
			  155,  156,  157,  158,   38,   85,  155,  156,  157,  158,
			  176,    5,   47,  168,    5,   38,  171,   75,    1,   85,
			  169,    4,   81,  172,   47,  180,  155,  156,  157,  158,

			  179,   69,  155,  156,  157,  158,  155,  156,  157,  158,
			   85,   64,   76,   77,   73,   74,  446,   21,    4,  178,
			   85,   12,  175,   73,   74,   78,   85,   91,  177,    5,
			   22,  461,   73,   74,   75,  231,  221,  233,   73,   74,
			   82,   10,   40,   41,  223,   69,   23,   22,   69,   73,
			   74,    1,   73,   74,    4,    5,    6,    7,    8,   23,
			   73,   74,   53,    4,    1,   69,   16,   17,   44,   32,
			  229,    3,   10,   10,  227,   44,  225,   69,    1,   11,
			   43,    4,    5,   33,   34,  270,  271,   73,   74,   75,
			    4,  270,   69,   16,   69,   42,    4,   73,   74,  295,

			  285,   51,   52,   44,    1,   69,   44,    8,  287,   30,
			   33,   34,    4,    5,   64,   16,   66,  313,  303,  315,
			  316,  317,  318,   73,   74,    5,  305,    4,   20,   21,
			   22,   23,   73,   74,  293,   85,   33,   34,  291,    3,
			  289,   64,   32,   66,   87,    4,    5,    6,    7,   83,
			   73,   74,  311,   43,   87,   69,  309,   16,  307,   73,
			   74,  346,   85,  359,  349,   73,   74,  346,    4,    5,
			   23,  270,  351,   82,   33,   34,   87,   69,   70,   71,
			   72,   73,   74,  440,   20,   21,   22,   23,   32,   50,
			  375,  448,   69,   73,   74,   32,   73,   74,  357,   43,

			  385,  386,  355,   32,  353,   64,   43,   66,   49,   32,
			   32,   32,    6,    7,   73,   74,   69,   70,   71,   72,
			   43,   43,   43,  322,  323,  324,   85,    4,    5,    0,
			    1,   12,  331,    4,    5,    6,    7,   73,   74,   10,
			   53,   12,   13,   14,   15,    4,    5,  346,   30,   20,
			   21,   22,   23,   24,   25,   26,   27,   28,    1,   30,
			   32,   32,   33,   34,   40,   41,   42,   38,   32,   12,
			   87,   43,   32,   16,   45,   46,   47,   48,    4,   43,
			   51,   52,  381,   43,   32,   56,   32,    4,    5,    6,
			    7,    8,   87,   88,   32,   38,   32,   32,   32,   16,

			   17,   16,   73,   74,   60,   61,   62,   63,   60,   61,
			   62,   63,   30,   13,   85,   29,   33,   34,   43,    1,
			   32,   32,    4,    5,    6,    7,   32,   32,   10,  447,
			   12,   13,   14,   15,   86,   32,   32,  455,   20,   21,
			   22,   23,   24,   25,   26,   27,   28,   64,   30,   66,
			   32,   33,   34,   32,   23,   32,   73,   74,   32,   60,
			   61,   62,   63,   21,   46,   47,   48,   22,   85,   51,
			   52,   32,   20,   32,   56,    1,   32,   45,    4,    5,
			    6,    7,   29,   12,   10,   86,   12,   13,   14,   15,
			   30,   73,   74,    4,   20,   21,   22,   23,   24,   25,

			   26,   27,   28,   85,    4,    5,   32,   33,   34,   32,
			   73,   74,   75,   76,   32,   32,   16,   80,   32,   32,
			   46,   47,   48,   86,   32,   51,   52,   29,    5,   45,
			   56,    5,   30,   33,   34,   32,   32,   67,   68,   69,
			   70,   71,   72,   73,   74,   75,   76,   73,   74,   75,
			   80,   73,   74,   75,   76,   43,   86,   32,   80,   85,
			   32,    4,    5,   32,   64,   32,   66,   10,   32,   32,
			   13,   14,   15,   73,   74,   32,   32,   20,   21,   22,
			   23,   24,   25,   26,   27,   85,    4,    5,   32,   32,
			   33,   34,   10,   32,   32,   32,   32,   15,   32,   32,

			   32,    4,   20,   21,   22,   23,   24,   25,   26,   27,
			    4,   39,   29,   32,   32,   33,   34,   33,   45,   67,
			   68,   69,   70,   71,   72,   73,   74,   75,   76,   34,
			   73,   74,   80,   45,   30,   37,   87,   30,   30,   30,
			   87,   87,   87,   29,   29,   87,   87,   87,   12,   29,
			   29,   12,   87,   83,   83,   73,   74,   83,   83,   83,
			   83,   76,   83,   83,   86,   12,  149,   45,   45,   45,
			    0,   84,   86,  346,  386,  270,  185,   88,  165,  375,
			  146,    0, yyDummy>>)
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

	yyvs12: SPECIAL [MULTIPLICITY_INTERVAL]
			-- Stack for semantic values of type MULTIPLICITY_INTERVAL

	yyvsc12: INTEGER
			-- Capacity of semantic value stack `yyvs12'

	yyvsp12: INTEGER
			-- Top of semantic value stack `yyvs12'

	yyspecial_routines12: KL_SPECIAL_ROUTINES [MULTIPLICITY_INTERVAL]
			-- Routines that ought to be in SPECIAL [MULTIPLICITY_INTERVAL]

	yyvs13: SPECIAL [C_PRIMITIVE_OBJECT]
			-- Stack for semantic values of type C_PRIMITIVE_OBJECT

	yyvsc13: INTEGER
			-- Capacity of semantic value stack `yyvs13'

	yyvsp13: INTEGER
			-- Top of semantic value stack `yyvs13'

	yyspecial_routines13: KL_SPECIAL_ROUTINES [C_PRIMITIVE_OBJECT]
			-- Routines that ought to be in SPECIAL [C_PRIMITIVE_OBJECT]

	yyvs14: SPECIAL [C_PRIMITIVE]
			-- Stack for semantic values of type C_PRIMITIVE

	yyvsc14: INTEGER
			-- Capacity of semantic value stack `yyvs14'

	yyvsp14: INTEGER
			-- Top of semantic value stack `yyvs14'

	yyspecial_routines14: KL_SPECIAL_ROUTINES [C_PRIMITIVE]
			-- Routines that ought to be in SPECIAL [C_PRIMITIVE]

	yyvs15: SPECIAL [ARCHETYPE_SLOT]
			-- Stack for semantic values of type ARCHETYPE_SLOT

	yyvsc15: INTEGER
			-- Capacity of semantic value stack `yyvs15'

	yyvsp15: INTEGER
			-- Top of semantic value stack `yyvs15'

	yyspecial_routines15: KL_SPECIAL_ROUTINES [ARCHETYPE_SLOT]
			-- Routines that ought to be in SPECIAL [ARCHETYPE_SLOT]

	yyvs16: SPECIAL [EXPR_ITEM]
			-- Stack for semantic values of type EXPR_ITEM

	yyvsc16: INTEGER
			-- Capacity of semantic value stack `yyvs16'

	yyvsp16: INTEGER
			-- Top of semantic value stack `yyvs16'

	yyspecial_routines16: KL_SPECIAL_ROUTINES [EXPR_ITEM]
			-- Routines that ought to be in SPECIAL [EXPR_ITEM]

	yyvs17: SPECIAL [EXPR_UNARY_OPERATOR]
			-- Stack for semantic values of type EXPR_UNARY_OPERATOR

	yyvsc17: INTEGER
			-- Capacity of semantic value stack `yyvs17'

	yyvsp17: INTEGER
			-- Top of semantic value stack `yyvs17'

	yyspecial_routines17: KL_SPECIAL_ROUTINES [EXPR_UNARY_OPERATOR]
			-- Routines that ought to be in SPECIAL [EXPR_UNARY_OPERATOR]

	yyvs18: SPECIAL [EXPR_BINARY_OPERATOR]
			-- Stack for semantic values of type EXPR_BINARY_OPERATOR

	yyvsc18: INTEGER
			-- Capacity of semantic value stack `yyvs18'

	yyvsp18: INTEGER
			-- Top of semantic value stack `yyvs18'

	yyspecial_routines18: KL_SPECIAL_ROUTINES [EXPR_BINARY_OPERATOR]
			-- Routines that ought to be in SPECIAL [EXPR_BINARY_OPERATOR]

	yyvs19: SPECIAL [EXPR_LEAF]
			-- Stack for semantic values of type EXPR_LEAF

	yyvsc19: INTEGER
			-- Capacity of semantic value stack `yyvs19'

	yyvsp19: INTEGER
			-- Top of semantic value stack `yyvs19'

	yyspecial_routines19: KL_SPECIAL_ROUTINES [EXPR_LEAF]
			-- Routines that ought to be in SPECIAL [EXPR_LEAF]

	yyvs20: SPECIAL [BOOLEAN]
			-- Stack for semantic values of type BOOLEAN

	yyvsc20: INTEGER
			-- Capacity of semantic value stack `yyvs20'

	yyvsp20: INTEGER
			-- Top of semantic value stack `yyvs20'

	yyspecial_routines20: KL_SPECIAL_ROUTINES [BOOLEAN]
			-- Routines that ought to be in SPECIAL [BOOLEAN]

	yyvs21: SPECIAL [ISO8601_DATE]
			-- Stack for semantic values of type ISO8601_DATE

	yyvsc21: INTEGER
			-- Capacity of semantic value stack `yyvs21'

	yyvsp21: INTEGER
			-- Top of semantic value stack `yyvs21'

	yyspecial_routines21: KL_SPECIAL_ROUTINES [ISO8601_DATE]
			-- Routines that ought to be in SPECIAL [ISO8601_DATE]

	yyvs22: SPECIAL [ISO8601_DATE_TIME]
			-- Stack for semantic values of type ISO8601_DATE_TIME

	yyvsc22: INTEGER
			-- Capacity of semantic value stack `yyvs22'

	yyvsp22: INTEGER
			-- Top of semantic value stack `yyvs22'

	yyspecial_routines22: KL_SPECIAL_ROUTINES [ISO8601_DATE_TIME]
			-- Routines that ought to be in SPECIAL [ISO8601_DATE_TIME]

	yyvs23: SPECIAL [ISO8601_TIME]
			-- Stack for semantic values of type ISO8601_TIME

	yyvsc23: INTEGER
			-- Capacity of semantic value stack `yyvs23'

	yyvsp23: INTEGER
			-- Top of semantic value stack `yyvs23'

	yyspecial_routines23: KL_SPECIAL_ROUTINES [ISO8601_TIME]
			-- Routines that ought to be in SPECIAL [ISO8601_TIME]

	yyvs24: SPECIAL [ISO8601_DURATION]
			-- Stack for semantic values of type ISO8601_DURATION

	yyvsc24: INTEGER
			-- Capacity of semantic value stack `yyvs24'

	yyvsp24: INTEGER
			-- Top of semantic value stack `yyvs24'

	yyspecial_routines24: KL_SPECIAL_ROUTINES [ISO8601_DURATION]
			-- Routines that ought to be in SPECIAL [ISO8601_DURATION]

	yyvs25: SPECIAL [CODE_PHRASE]
			-- Stack for semantic values of type CODE_PHRASE

	yyvsc25: INTEGER
			-- Capacity of semantic value stack `yyvs25'

	yyvsp25: INTEGER
			-- Top of semantic value stack `yyvs25'

	yyspecial_routines25: KL_SPECIAL_ROUTINES [CODE_PHRASE]
			-- Routines that ought to be in SPECIAL [CODE_PHRASE]

	yyvs26: SPECIAL [URI]
			-- Stack for semantic values of type URI

	yyvsc26: INTEGER
			-- Capacity of semantic value stack `yyvs26'

	yyvsp26: INTEGER
			-- Top of semantic value stack `yyvs26'

	yyspecial_routines26: KL_SPECIAL_ROUTINES [URI]
			-- Routines that ought to be in SPECIAL [URI]

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

	yyvs45: SPECIAL [CARDINALITY]
			-- Stack for semantic values of type CARDINALITY

	yyvsc45: INTEGER
			-- Capacity of semantic value stack `yyvs45'

	yyvsp45: INTEGER
			-- Top of semantic value stack `yyvs45'

	yyspecial_routines45: KL_SPECIAL_ROUTINES [CARDINALITY]
			-- Routines that ought to be in SPECIAL [CARDINALITY]

	yyvs46: SPECIAL [CONSTRAINT_REF]
			-- Stack for semantic values of type CONSTRAINT_REF

	yyvsc46: INTEGER
			-- Capacity of semantic value stack `yyvs46'

	yyvsp46: INTEGER
			-- Top of semantic value stack `yyvs46'

	yyspecial_routines46: KL_SPECIAL_ROUTINES [CONSTRAINT_REF]
			-- Routines that ought to be in SPECIAL [CONSTRAINT_REF]

	yyvs47: SPECIAL [C_CODE_PHRASE]
			-- Stack for semantic values of type C_CODE_PHRASE

	yyvsc47: INTEGER
			-- Capacity of semantic value stack `yyvs47'

	yyvsp47: INTEGER
			-- Top of semantic value stack `yyvs47'

	yyspecial_routines47: KL_SPECIAL_ROUTINES [C_CODE_PHRASE]
			-- Routines that ought to be in SPECIAL [C_CODE_PHRASE]

	yyvs48: SPECIAL [C_DV_ORDINAL]
			-- Stack for semantic values of type C_DV_ORDINAL

	yyvsc48: INTEGER
			-- Capacity of semantic value stack `yyvs48'

	yyvsp48: INTEGER
			-- Top of semantic value stack `yyvs48'

	yyspecial_routines48: KL_SPECIAL_ROUTINES [C_DV_ORDINAL]
			-- Routines that ought to be in SPECIAL [C_DV_ORDINAL]

	yyvs49: SPECIAL [ORDINAL]
			-- Stack for semantic values of type ORDINAL

	yyvsc49: INTEGER
			-- Capacity of semantic value stack `yyvs49'

	yyvsp49: INTEGER
			-- Top of semantic value stack `yyvs49'

	yyspecial_routines49: KL_SPECIAL_ROUTINES [ORDINAL]
			-- Routines that ought to be in SPECIAL [ORDINAL]

	yyvs50: SPECIAL [C_BOOLEAN]
			-- Stack for semantic values of type C_BOOLEAN

	yyvsc50: INTEGER
			-- Capacity of semantic value stack `yyvs50'

	yyvsp50: INTEGER
			-- Top of semantic value stack `yyvs50'

	yyspecial_routines50: KL_SPECIAL_ROUTINES [C_BOOLEAN]
			-- Routines that ought to be in SPECIAL [C_BOOLEAN]

	yyvs51: SPECIAL [C_STRING]
			-- Stack for semantic values of type C_STRING

	yyvsc51: INTEGER
			-- Capacity of semantic value stack `yyvs51'

	yyvsp51: INTEGER
			-- Top of semantic value stack `yyvs51'

	yyspecial_routines51: KL_SPECIAL_ROUTINES [C_STRING]
			-- Routines that ought to be in SPECIAL [C_STRING]

	yyvs52: SPECIAL [C_DATE_TIME]
			-- Stack for semantic values of type C_DATE_TIME

	yyvsc52: INTEGER
			-- Capacity of semantic value stack `yyvs52'

	yyvsp52: INTEGER
			-- Top of semantic value stack `yyvs52'

	yyspecial_routines52: KL_SPECIAL_ROUTINES [C_DATE_TIME]
			-- Routines that ought to be in SPECIAL [C_DATE_TIME]

	yyvs53: SPECIAL [C_DURATION]
			-- Stack for semantic values of type C_DURATION

	yyvsc53: INTEGER
			-- Capacity of semantic value stack `yyvs53'

	yyvsp53: INTEGER
			-- Top of semantic value stack `yyvs53'

	yyspecial_routines53: KL_SPECIAL_ROUTINES [C_DURATION]
			-- Routines that ought to be in SPECIAL [C_DURATION]

	yyvs54: SPECIAL [C_DATE]
			-- Stack for semantic values of type C_DATE

	yyvsc54: INTEGER
			-- Capacity of semantic value stack `yyvs54'

	yyvsp54: INTEGER
			-- Top of semantic value stack `yyvs54'

	yyspecial_routines54: KL_SPECIAL_ROUTINES [C_DATE]
			-- Routines that ought to be in SPECIAL [C_DATE]

	yyvs55: SPECIAL [C_TIME]
			-- Stack for semantic values of type C_TIME

	yyvsc55: INTEGER
			-- Capacity of semantic value stack `yyvs55'

	yyvsp55: INTEGER
			-- Top of semantic value stack `yyvs55'

	yyspecial_routines55: KL_SPECIAL_ROUTINES [C_TIME]
			-- Routines that ought to be in SPECIAL [C_TIME]

	yyvs56: SPECIAL [C_REAL]
			-- Stack for semantic values of type C_REAL

	yyvsc56: INTEGER
			-- Capacity of semantic value stack `yyvs56'

	yyvsp56: INTEGER
			-- Top of semantic value stack `yyvs56'

	yyspecial_routines56: KL_SPECIAL_ROUTINES [C_REAL]
			-- Routines that ought to be in SPECIAL [C_REAL]

	yyvs57: SPECIAL [C_INTEGER]
			-- Stack for semantic values of type C_INTEGER

	yyvsc57: INTEGER
			-- Capacity of semantic value stack `yyvs57'

	yyvsp57: INTEGER
			-- Top of semantic value stack `yyvs57'

	yyspecial_routines57: KL_SPECIAL_ROUTINES [C_INTEGER]
			-- Routines that ought to be in SPECIAL [C_INTEGER]

feature {NONE} -- Constants

	yyFinal: INTEGER = 465
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 88
			-- Number of tokens

	yyLast: INTEGER = 681
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 329
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 163
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



feature -- Definitions

	Unbounded_value: INTEGER = -1

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

	rm_attribute_name: STRING
	parent_path_str: STRING

	invariant_expr: STRING

	time_vc: TIME_VALIDITY_CHECKER
	date_vc: DATE_VALIDITY_CHECKER

	bmm_prop_def: BMM_PROPERTY_DEFINITION

-------------- FOLLOWING TAKEN FROM DADL_VALIDATOR.Y ---------------
feature {NONE} -- Implementation 

	arch_internal_ref_rm_type_name: STRING
	arch_internal_ref_node_id: STRING

	indent: STRING
	str: STRING

	og_path: OG_PATH

end
