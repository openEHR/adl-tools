note
	component:   "openEHR ADL Tools"
	description: "Validating parser for Archetype Description Language (ADL)"
	keywords:	 "ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class CADL_15_PARSER

inherit
	PARSER_VALIDATOR
		rename
			reset as validator_reset,
			make as make_parser_skeleton
		end

	CADL_15_SCANNER
		rename
			make as make_scanner
		redefine
			reset
		end

	C_COMMON

	OPERATOR_TYPES
		export
			{NONE} all
		end

	SHARED_ADL_APP_RESOURCES
		export
			{NONE} all
		end

	SHARED_COMPILER_BILLBOARD
		export
			{NONE} all
		end

	SHARED_C_FACTORY
		export
			{NONE} all
		end

	C_DATE_TIME_ROUTINES
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
			create yyspecial_routines1
			yyvsc1 := yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.make (yyvsc1)
			create yyspecial_routines2
			yyvsc2 := yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.make (yyvsc2)
			create yyspecial_routines3
			yyvsc3 := yyInitial_yyvs_size
			yyvs3 := yyspecial_routines3.make (yyvsc3)
			create yyspecial_routines4
			yyvsc4 := yyInitial_yyvs_size
			yyvs4 := yyspecial_routines4.make (yyvsc4)
			create yyspecial_routines5
			yyvsc5 := yyInitial_yyvs_size
			yyvs5 := yyspecial_routines5.make (yyvsc5)
			create yyspecial_routines6
			yyvsc6 := yyInitial_yyvs_size
			yyvs6 := yyspecial_routines6.make (yyvsc6)
			create yyspecial_routines7
			yyvsc7 := yyInitial_yyvs_size
			yyvs7 := yyspecial_routines7.make (yyvsc7)
			create yyspecial_routines8
			yyvsc8 := yyInitial_yyvs_size
			yyvs8 := yyspecial_routines8.make (yyvsc8)
			create yyspecial_routines9
			yyvsc9 := yyInitial_yyvs_size
			yyvs9 := yyspecial_routines9.make (yyvsc9)
			create yyspecial_routines10
			yyvsc10 := yyInitial_yyvs_size
			yyvs10 := yyspecial_routines10.make (yyvsc10)
			create yyspecial_routines11
			yyvsc11 := yyInitial_yyvs_size
			yyvs11 := yyspecial_routines11.make (yyvsc11)
			create yyspecial_routines12
			yyvsc12 := yyInitial_yyvs_size
			yyvs12 := yyspecial_routines12.make (yyvsc12)
			create yyspecial_routines13
			yyvsc13 := yyInitial_yyvs_size
			yyvs13 := yyspecial_routines13.make (yyvsc13)
			create yyspecial_routines14
			yyvsc14 := yyInitial_yyvs_size
			yyvs14 := yyspecial_routines14.make (yyvsc14)
			create yyspecial_routines15
			yyvsc15 := yyInitial_yyvs_size
			yyvs15 := yyspecial_routines15.make (yyvsc15)
			create yyspecial_routines16
			yyvsc16 := yyInitial_yyvs_size
			yyvs16 := yyspecial_routines16.make (yyvsc16)
			create yyspecial_routines17
			yyvsc17 := yyInitial_yyvs_size
			yyvs17 := yyspecial_routines17.make (yyvsc17)
			create yyspecial_routines18
			yyvsc18 := yyInitial_yyvs_size
			yyvs18 := yyspecial_routines18.make (yyvsc18)
			create yyspecial_routines19
			yyvsc19 := yyInitial_yyvs_size
			yyvs19 := yyspecial_routines19.make (yyvsc19)
			create yyspecial_routines20
			yyvsc20 := yyInitial_yyvs_size
			yyvs20 := yyspecial_routines20.make (yyvsc20)
			create yyspecial_routines21
			yyvsc21 := yyInitial_yyvs_size
			yyvs21 := yyspecial_routines21.make (yyvsc21)
			create yyspecial_routines22
			yyvsc22 := yyInitial_yyvs_size
			yyvs22 := yyspecial_routines22.make (yyvsc22)
			create yyspecial_routines23
			yyvsc23 := yyInitial_yyvs_size
			yyvs23 := yyspecial_routines23.make (yyvsc23)
			create yyspecial_routines24
			yyvsc24 := yyInitial_yyvs_size
			yyvs24 := yyspecial_routines24.make (yyvsc24)
			create yyspecial_routines25
			yyvsc25 := yyInitial_yyvs_size
			yyvs25 := yyspecial_routines25.make (yyvsc25)
			create yyspecial_routines26
			yyvsc26 := yyInitial_yyvs_size
			yyvs26 := yyspecial_routines26.make (yyvsc26)
			create yyspecial_routines27
			yyvsc27 := yyInitial_yyvs_size
			yyvs27 := yyspecial_routines27.make (yyvsc27)
			create yyspecial_routines28
			yyvsc28 := yyInitial_yyvs_size
			yyvs28 := yyspecial_routines28.make (yyvsc28)
			create yyspecial_routines29
			yyvsc29 := yyInitial_yyvs_size
			yyvs29 := yyspecial_routines29.make (yyvsc29)
			create yyspecial_routines30
			yyvsc30 := yyInitial_yyvs_size
			yyvs30 := yyspecial_routines30.make (yyvsc30)
			create yyspecial_routines31
			yyvsc31 := yyInitial_yyvs_size
			yyvs31 := yyspecial_routines31.make (yyvsc31)
			create yyspecial_routines32
			yyvsc32 := yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.make (yyvsc32)
			create yyspecial_routines33
			yyvsc33 := yyInitial_yyvs_size
			yyvs33 := yyspecial_routines33.make (yyvsc33)
			create yyspecial_routines34
			yyvsc34 := yyInitial_yyvs_size
			yyvs34 := yyspecial_routines34.make (yyvsc34)
			create yyspecial_routines35
			yyvsc35 := yyInitial_yyvs_size
			yyvs35 := yyspecial_routines35.make (yyvsc35)
			create yyspecial_routines36
			yyvsc36 := yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.make (yyvsc36)
			create yyspecial_routines37
			yyvsc37 := yyInitial_yyvs_size
			yyvs37 := yyspecial_routines37.make (yyvsc37)
			create yyspecial_routines38
			yyvsc38 := yyInitial_yyvs_size
			yyvs38 := yyspecial_routines38.make (yyvsc38)
			create yyspecial_routines39
			yyvsc39 := yyInitial_yyvs_size
			yyvs39 := yyspecial_routines39.make (yyvsc39)
			create yyspecial_routines40
			yyvsc40 := yyInitial_yyvs_size
			yyvs40 := yyspecial_routines40.make (yyvsc40)
			create yyspecial_routines41
			yyvsc41 := yyInitial_yyvs_size
			yyvs41 := yyspecial_routines41.make (yyvsc41)
			create yyspecial_routines42
			yyvsc42 := yyInitial_yyvs_size
			yyvs42 := yyspecial_routines42.make (yyvsc42)
			create yyspecial_routines43
			yyvsc43 := yyInitial_yyvs_size
			yyvs43 := yyspecial_routines43.make (yyvsc43)
			create yyspecial_routines44
			yyvsc44 := yyInitial_yyvs_size
			yyvs44 := yyspecial_routines44.make (yyvsc44)
			create yyspecial_routines45
			yyvsc45 := yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.make (yyvsc45)
			create yyspecial_routines46
			yyvsc46 := yyInitial_yyvs_size
			yyvs46 := yyspecial_routines46.make (yyvsc46)
			create yyspecial_routines47
			yyvsc47 := yyInitial_yyvs_size
			yyvs47 := yyspecial_routines47.make (yyvsc47)
			create yyspecial_routines48
			yyvsc48 := yyInitial_yyvs_size
			yyvs48 := yyspecial_routines48.make (yyvsc48)
			create yyspecial_routines49
			yyvsc49 := yyInitial_yyvs_size
			yyvs49 := yyspecial_routines49.make (yyvsc49)
			create yyspecial_routines50
			yyvsc50 := yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.make (yyvsc50)
			create yyspecial_routines51
			yyvsc51 := yyInitial_yyvs_size
			yyvs51 := yyspecial_routines51.make (yyvsc51)
			create yyspecial_routines52
			yyvsc52 := yyInitial_yyvs_size
			yyvs52 := yyspecial_routines52.make (yyvsc52)
			create yyspecial_routines53
			yyvsc53 := yyInitial_yyvs_size
			yyvs53 := yyspecial_routines53.make (yyvsc53)
			create yyspecial_routines54
			yyvsc54 := yyInitial_yyvs_size
			yyvs54 := yyspecial_routines54.make (yyvsc54)
			create yyspecial_routines55
			yyvsc55 := yyInitial_yyvs_size
			yyvs55 := yyspecial_routines55.make (yyvsc55)
			create yyspecial_routines56
			yyvsc56 := yyInitial_yyvs_size
			yyvs56 := yyspecial_routines56.make (yyvsc56)
			create yyspecial_routines57
			yyvsc57 := yyInitial_yyvs_size
			yyvs57 := yyspecial_routines57.make (yyvsc57)
			create yyspecial_routines58
			yyvsc58 := yyInitial_yyvs_size
			yyvs58 := yyspecial_routines58.make (yyvsc58)
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
			yyvsp58 := -1
		end

	yy_clear_value_stacks
			-- Clear objects in semantic value stacks so that
			-- they can be collected by the garbage collector.
		do
			yyvs1.keep_head (0)
			yyvs2.keep_head (0)
			yyvs3.keep_head (0)
			yyvs4.keep_head (0)
			yyvs5.keep_head (0)
			yyvs6.keep_head (0)
			yyvs7.keep_head (0)
			yyvs8.keep_head (0)
			yyvs9.keep_head (0)
			yyvs10.keep_head (0)
			yyvs11.keep_head (0)
			yyvs12.keep_head (0)
			yyvs13.keep_head (0)
			yyvs14.keep_head (0)
			yyvs15.keep_head (0)
			yyvs16.keep_head (0)
			yyvs17.keep_head (0)
			yyvs18.keep_head (0)
			yyvs19.keep_head (0)
			yyvs20.keep_head (0)
			yyvs21.keep_head (0)
			yyvs22.keep_head (0)
			yyvs23.keep_head (0)
			yyvs24.keep_head (0)
			yyvs25.keep_head (0)
			yyvs26.keep_head (0)
			yyvs27.keep_head (0)
			yyvs28.keep_head (0)
			yyvs29.keep_head (0)
			yyvs30.keep_head (0)
			yyvs31.keep_head (0)
			yyvs32.keep_head (0)
			yyvs33.keep_head (0)
			yyvs34.keep_head (0)
			yyvs35.keep_head (0)
			yyvs36.keep_head (0)
			yyvs37.keep_head (0)
			yyvs38.keep_head (0)
			yyvs39.keep_head (0)
			yyvs40.keep_head (0)
			yyvs41.keep_head (0)
			yyvs42.keep_head (0)
			yyvs43.keep_head (0)
			yyvs44.keep_head (0)
			yyvs45.keep_head (0)
			yyvs46.keep_head (0)
			yyvs47.keep_head (0)
			yyvs48.keep_head (0)
			yyvs49.keep_head (0)
			yyvs50.keep_head (0)
			yyvs51.keep_head (0)
			yyvs52.keep_head (0)
			yyvs53.keep_head (0)
			yyvs54.keep_head (0)
			yyvs55.keep_head (0)
			yyvs56.keep_head (0)
			yyvs57.keep_head (0)
			yyvs58.keep_head (0)
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
			when 3 then
				yyvsp3 := yyvsp3 + 1
				if yyvsp3 >= yyvsc3 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs3")
					end
					yyvsc3 := yyvsc3 + yyInitial_yyvs_size
					yyvs3 := yyspecial_routines3.aliased_resized_area (yyvs3, yyvsc3)
				end
				yyspecial_routines3.force (yyvs3, last_integer_value, yyvsp3)
			when 4 then
				yyvsp4 := yyvsp4 + 1
				if yyvsp4 >= yyvsc4 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs4")
					end
					yyvsc4 := yyvsc4 + yyInitial_yyvs_size
					yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
				end
				yyspecial_routines4.force (yyvs4, last_real_value, yyvsp4)
			when 5 then
				yyvsp5 := yyvsp5 + 1
				if yyvsp5 >= yyvsc5 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs5")
					end
					yyvsc5 := yyvsc5 + yyInitial_yyvs_size
					yyvs5 := yyspecial_routines5.aliased_resized_area (yyvs5, yyvsc5)
				end
				yyspecial_routines5.force (yyvs5, last_term_constraint_parse_structure_value, yyvsp5)
			when 6 then
				yyvsp6 := yyvsp6 + 1
				if yyvsp6 >= yyvsc6 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs6")
					end
					yyvsc6 := yyvsc6 + yyInitial_yyvs_size
					yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
				end
				yyspecial_routines6.force (yyvs6, last_character_value, yyvsp6)
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
			when 58 then
				yyvsp58 := yyvsp58 - 1
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
			yyval16: C_COMPLEX_OBJECT
			yyval11: SIBLING_ORDER
			yyval9: C_ARCHETYPE_ROOT
			yyval10: C_COMPLEX_OBJECT_PROXY
			yyval18: ARCHETYPE_SLOT
			yyval17: C_PRIMITIVE_OBJECT
			yyval19: C_ATTRIBUTE
			yyval7: detachable ARRAYED_LIST [ASSERTION]
			yyval8: ASSERTION
			yyval20: EXPR_ITEM
			yyval22: EXPR_BINARY_OPERATOR
			yyval21: EXPR_UNARY_OPERATOR
			yyval2: STRING
			yyval23: EXPR_LEAF
			yyval14: detachable MULTIPLICITY_INTERVAL
			yyval12: MULTIPLICITY_INTERVAL
			yyval15: detachable CARDINALITY
			yyval13: CARDINALITY
			yyval57: C_INTEGER
			yyval56: C_REAL
			yyval54: C_DATE
			yyval55: C_TIME
			yyval52: C_DATE_TIME
			yyval53: C_DURATION
			yyval51: C_STRING
			yyval58: C_TERMINOLOGY_CODE
			yyval50: C_BOOLEAN
			yyval30: ARRAYED_LIST [STRING]
			yyval3: INTEGER
			yyval31: ARRAYED_LIST [INTEGER]
			yyval38: INTERVAL [INTEGER]
			yyval44: ARRAYED_LIST [INTERVAL [INTEGER]]
			yyval4: REAL
			yyval32: ARRAYED_LIST [REAL]
			yyval39: INTERVAL [REAL]
			yyval45: ARRAYED_LIST [INTERVAL [REAL]]
			yyval24: BOOLEAN
			yyval33: ARRAYED_LIST [BOOLEAN]
			yyval25: ISO8601_DATE
			yyval34: ARRAYED_LIST [ISO8601_DATE]
			yyval41: INTERVAL [ISO8601_DATE]
			yyval47: ARRAYED_LIST [INTERVAL [ISO8601_DATE]]
			yyval27: ISO8601_TIME
			yyval35: ARRAYED_LIST [ISO8601_TIME]
			yyval40: INTERVAL [ISO8601_TIME]
			yyval46: ARRAYED_LIST [INTERVAL [ISO8601_TIME]]
			yyval26: ISO8601_DATE_TIME
			yyval36: ARRAYED_LIST [ISO8601_DATE_TIME]
			yyval42: INTERVAL [ISO8601_DATE_TIME]
			yyval48: ARRAYED_LIST [INTERVAL [ISO8601_DATE_TIME]]
			yyval28: ISO8601_DURATION
			yyval37: ARRAYED_LIST [ISO8601_DURATION]
			yyval43: INTERVAL [ISO8601_DURATION]
			yyval49: ARRAYED_LIST [INTERVAL [ISO8601_DURATION]]
		do
			if not yy_retried then
				inspect yy_act
when 1 then
--|#line 180 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 180")
end

			debug ("ADL_parse")
				io.put_string ("CADL definition parsed%N")
			end
			output := yyvs1.item (yyvsp1)
			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 2 then
--|#line 188 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 188")
end

			debug ("ADL_parse")
				io.put_string ("assertion definition parsed%N")
			end
			output := yyvs7.item (yyvsp7)
			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp7 := yyvsp7 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 3 then
--|#line 196 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 196")
end

			debug ("ADL_parse")
				io.put_string ("CADL definition NOT parsed%N")
			end
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 4 then
--|#line 205 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 205")
end

			debug ("ADL_parse")
				io.put_string (indent + "POP OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "]%N") 
				indent.remove_tail (1)
			end
			yyval1 := object_nodes.item
			object_nodes.remove
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp16 := yyvsp16 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 5 then
--|#line 214 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 214")
end

			-- ok in case where occurrences or node_id is being redefined in a specialised archetype or template
			debug ("ADL_parse")
				io.put_string (indent + "POP OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "]%N") 
				indent.remove_tail (1)
			end
			yyval1 := object_nodes.item
			object_nodes.remove
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp16 := yyvsp16 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 6 then
--|#line 226 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 226")
end

			yyval16 := yyvs16.item (yyvsp16)
			if attached yyvs14.item (yyvsp14) as att_occ then
				yyvs16.item (yyvsp16).set_occurrences (att_occ)
			end

			if rm_schema.has_class_definition (yyvs16.item (yyvsp16).rm_type_name) then
				object_nodes.extend (yyvs16.item (yyvsp16))
debug ("ADL_parse")
	io.put_string (indent + "PUSH create OBJECT_NODE " + yyvs16.item (yyvsp16).rm_type_name + " [id=" + yyvs16.item (yyvsp16).node_id + "] ")
	if yyvs14.item (yyvsp14) /= Void then
		io.put_string ("; occurrences=(" + yyvs14.item (yyvsp14).as_string + ")") 
	end
	io.new_line
	indent.append ("%T")
end

				-- put it under current attribute, unless it is the root object, in which case it will be returned
				-- via the 'output' attribute of this parser
				if not c_attrs.is_empty then
					safe_put_c_attribute_child (c_attrs.item, yyvs16.item (yyvsp16))
				end
			else
				abort_with_error (ec_VCORM, <<yyvs16.item (yyvsp16).rm_type_name, yyvs16.item (yyvsp16).path>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp14 := yyvsp14 -1
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 7 then
--|#line 255 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 255")
end

			if object_nodes.is_empty then
				create yyval16.make (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
			else
				abort_with_error (ec_VARND, <<yyvs2.item (yyvsp2), Id_code_regex_pattern>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp16 := yyvsp16 + 1
	yyvsp2 := yyvsp2 -2
	if yyvsp16 >= yyvsc16 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs16")
		end
		yyvsc16 := yyvsc16 + yyInitial_yyvs_size
		yyvs16 := yyspecial_routines16.aliased_resized_area (yyvs16, yyvsc16)
	end
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 8 then
--|#line 263 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 263")
end

			if not object_nodes.is_empty then
				create yyval16.make (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
			else
				abort_with_error (ec_VARCN, <<yyvs2.item (yyvsp2), Root_id_code_regex_pattern>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp16 := yyvsp16 + 1
	yyvsp2 := yyvsp2 -2
	if yyvsp16 >= yyvsc16 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs16")
		end
		yyvsc16 := yyvsc16 + yyInitial_yyvs_size
		yyvs16 := yyspecial_routines16.aliased_resized_area (yyvs16, yyvsc16)
	end
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 9 then
--|#line 271 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 271")
end

			create yyval16.make (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
			yyval16.set_sibling_order (yyvs11.item (yyvsp11))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp16 := yyvsp16 + 1
	yyvsp11 := yyvsp11 -1
	yyvsp2 := yyvsp2 -2
	if yyvsp16 >= yyvsc16 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs16")
		end
		yyvsc16 := yyvsc16 + yyInitial_yyvs_size
		yyvs16 := yyspecial_routines16.aliased_resized_area (yyvs16, yyvsc16)
	end
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 10 then
--|#line 279 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 279")
end

			if object_nodes.is_empty then
				abort_with_error (ec_VARCN, <<"(none)", Root_id_code_regex_pattern>>)
			else
				create yyval16.make (yyvs2.item (yyvsp2), new_fake_node_id)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp16 >= yyvsc16 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs16")
		end
		yyvsc16 := yyvsc16 + yyInitial_yyvs_size
		yyvs16 := yyspecial_routines16.aliased_resized_area (yyvs16, yyvsc16)
	end
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 11 then
--|#line 292 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 292")
end

			yyval11 := create {SIBLING_ORDER}.make_after (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp11 := yyvsp11 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp11 >= yyvsc11 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs11")
		end
		yyvsc11 := yyvsc11 + yyInitial_yyvs_size
		yyvs11 := yyspecial_routines11.aliased_resized_area (yyvs11, yyvsc11)
	end
	yyspecial_routines11.force (yyvs11, yyval11, yyvsp11)
end
when 12 then
--|#line 296 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 296")
end

			yyval11 := create {SIBLING_ORDER}.make_before (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp11 := yyvsp11 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp11 >= yyvsc11 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs11")
		end
		yyvsc11 := yyvsc11 + yyInitial_yyvs_size
		yyvs11 := yyspecial_routines11.aliased_resized_area (yyvs11, yyvsc11)
	end
	yyspecial_routines11.force (yyvs11, yyval11, yyvsp11)
end
when 13 then
--|#line 302 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 302")
end

			debug ("ADL_parse")
				io.put_string (indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + 
					" [id=" + object_nodes.item.node_id + "] - any_allowed%N") 
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 14 then
--|#line 309 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 309")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 15 then
--|#line 312 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 312")
end

			abort_with_error (ec_SCOAT, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 16 then
--|#line 322 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 322")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 17 then
--|#line 325 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 325")
end

			safe_put_c_attribute_child (c_attrs.item, yyvs9.item (yyvsp9))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp9 := yyvsp9 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 18 then
--|#line 329 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 329")
end

			safe_put_c_attribute_child (c_attrs.item, yyvs10.item (yyvsp10))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp10 := yyvsp10 -1
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
--|#line 333 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 333")
end

			safe_put_c_attribute_child (c_attrs.item, yyvs18.item (yyvsp18))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp18 := yyvsp18 -1
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
--|#line 337 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 337")
end

			safe_put_c_attribute_child (c_attrs.item, yyvs17.item (yyvsp17))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp17 := yyvsp17 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 21 then
--|#line 341 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 341")
end

			abort_with_error (ec_SCCOG, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 22 then
--|#line 352 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 352")
end

			if archetype_id_parser.valid_id (yyvs2.item (yyvsp2)) then
				create yyval9.make (yyvs2.item (yyvsp2 - 2), yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
				if attached yyvs14.item (yyvsp14) as occ then
					yyval9.set_occurrences (occ)
				end
			else
				abort_with_error (ec_SUAIDI, <<yyvs2.item (yyvsp2 - 1)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp9 := yyvsp9 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -3
	yyvsp14 := yyvsp14 -1
	if yyvsp9 >= yyvsc9 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs9")
		end
		yyvsc9 := yyvsc9 + yyInitial_yyvs_size
		yyvs9 := yyspecial_routines9.aliased_resized_area (yyvs9, yyvsc9)
	end
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
when 23 then
--|#line 363 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 363")
end

			abort_with_error (ec_SUAID, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp9 := yyvsp9 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -1
	if yyvsp9 >= yyvsc9 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs9")
		end
		yyvsc9 := yyvsc9 + yyInitial_yyvs_size
		yyvs9 := yyspecial_routines9.aliased_resized_area (yyvs9, yyvsc9)
	end
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
when 24 then
--|#line 369 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 369")
end

			create yyval10.make (yyvs2.item (yyvsp2 - 2), yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
			if attached yyvs14.item (yyvsp14) as att_occ then
				yyval10.set_occurrences (att_occ)
			end

			debug ("ADL_parse")
				io.put_string (indent + "create C_COMPLEX_OBJECT_PROXY ")
				io.put_string (yyval10.rm_type_name) 
				io.put_string ("[" + yyval10.node_id + "] ")
				if yyval10.use_target_occurrences then
					io.put_string ("occurrences=(use target) ")
				elseif yyvs14.item (yyvsp14) /= Void then
					io.put_string ("occurrences=" + yyval10.occurrences.as_string + " ")
				end
				io.put_string (" => " + yyval10.target_path + "%N") 
				io.put_string (indent + "C_ATTR " + c_attrs.item.rm_attribute_name + " safe_put_c_attribute_child (C_COMPLEX_OBJECT_PROXY)%N") 
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp10 := yyvsp10 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -3
	yyvsp14 := yyvsp14 -1
	if yyvsp10 >= yyvsc10 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs10")
		end
		yyvsc10 := yyvsc10 + yyInitial_yyvs_size
		yyvs10 := yyspecial_routines10.aliased_resized_area (yyvs10, yyvsc10)
	end
	yyspecial_routines10.force (yyvs10, yyval10, yyvsp10)
end
when 25 then
--|#line 392 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 392")
end

			create yyval10.make (yyvs2.item (yyvsp2 - 1), new_fake_node_id, yyvs2.item (yyvsp2))
			if attached yyvs14.item (yyvsp14) as att_occ then
				yyval10.set_occurrences (att_occ)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp10 := yyvsp10 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -2
	yyvsp14 := yyvsp14 -1
	if yyvsp10 >= yyvsc10 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs10")
		end
		yyvsc10 := yyvsc10 + yyInitial_yyvs_size
		yyvs10 := yyspecial_routines10.aliased_resized_area (yyvs10, yyvsc10)
	end
	yyspecial_routines10.force (yyvs10, yyval10, yyvsp10)
end
when 26 then
--|#line 406 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 406")
end

			abort_with_error (ec_SUNPA, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp10 := yyvsp10 + 1
	yyvsp1 := yyvsp1 -2
	if yyvsp10 >= yyvsc10 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs10")
		end
		yyvsc10 := yyvsc10 + yyInitial_yyvs_size
		yyvs10 := yyspecial_routines10.aliased_resized_area (yyvs10, yyvsc10)
	end
	yyspecial_routines10.force (yyvs10, yyval10, yyvsp10)
end
when 27 then
--|#line 412 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 412")
end

			if attached yyvs7.item (yyvsp7 - 1) as att_c_incs then
				yyvs18.item (yyvsp18).set_includes (att_c_incs)
			end
			if attached yyvs7.item (yyvsp7) as att_c_excs then
				yyvs18.item (yyvsp18).set_excludes (att_c_excs)
			end

			debug ("ADL_parse")
				indent.remove_tail (1)
			end
			yyval18 := yyvs18.item (yyvsp18)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp1 := yyvsp1 -3
	yyvsp7 := yyvsp7 -2
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
when 28 then
--|#line 426 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 426")
end

			if not (yyvs18.item (yyvsp18).is_closed or yyvs18.item (yyvsp18).is_prohibited) then
				abort_with_error (ec_VASMD, <<yyvs18.item (yyvsp18).rm_type_name, c_attrs.item.path>>)
			end
			yyval18 := yyvs18.item (yyvsp18)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
when 29 then
--|#line 435 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 435")
end

			if attached yyvs14.item (yyvsp14) as att_occ then
				yyvs18.item (yyvsp18).set_occurrences (att_occ)
			end

			debug ("ADL_parse")
				io.put_string (indent + "create ARCHETYPE_SLOT " + yyvs18.item (yyvsp18).rm_type_name + " [id=" + yyvs18.item (yyvsp18).node_id + "]")
				if attached yyvs14.item (yyvsp14) then
					io.put_string ("; occurrences=(" + yyvs14.item (yyvsp14).as_string + ")") 
				end
				io.new_line
				indent.append ("%T")
			end
			yyval18 := yyvs18.item (yyvsp18)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp14 := yyvsp14 -1
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
when 30 then
--|#line 453 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 453")
end

			create yyval18.make (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp18 := yyvsp18 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -2
	if yyvsp18 >= yyvsc18 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs18")
		end
		yyvsc18 := yyvsc18 + yyInitial_yyvs_size
		yyvs18 := yyspecial_routines18.aliased_resized_area (yyvs18, yyvsc18)
	end
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
when 31 then
--|#line 457 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 457")
end

			create yyval18.make (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
			yyval18.set_sibling_order (yyvs11.item (yyvsp11))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp18 := yyvsp18 + 1
	yyvsp11 := yyvsp11 -1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -2
	if yyvsp18 >= yyvsc18 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs18")
		end
		yyvsc18 := yyvsc18 + yyInitial_yyvs_size
		yyvs18 := yyspecial_routines18.aliased_resized_area (yyvs18, yyvsc18)
	end
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
when 32 then
--|#line 462 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 462")
end

			create yyval18.make (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
			yyval18.set_closed
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp18 := yyvsp18 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -2
	if yyvsp18 >= yyvsc18 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs18")
		end
		yyvsc18 := yyvsc18 + yyInitial_yyvs_size
		yyvs18 := yyspecial_routines18.aliased_resized_area (yyvs18, yyvsc18)
	end
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
when 33 then
--|#line 470 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 470")
end

			create yyval18.make (yyvs2.item (yyvsp2), new_fake_node_id)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp18 := yyvsp18 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp18 >= yyvsc18 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs18")
		end
		yyvsc18 := yyvsc18 + yyInitial_yyvs_size
		yyvs18 := yyspecial_routines18.aliased_resized_area (yyvs18, yyvsc18)
	end
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
when 34 then
--|#line 477 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 477")
end

			abort_with_error (ec_SUAS, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp18 := yyvsp18 + 1
	yyvsp1 := yyvsp1 -2
	if yyvsp18 >= yyvsc18 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs18")
		end
		yyvsc18 := yyvsc18 + yyInitial_yyvs_size
		yyvs18 := yyspecial_routines18.aliased_resized_area (yyvs18, yyvsc18)
	end
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
when 35 then
--|#line 483 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 483")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_INTEGER: " +  yyvs57.item (yyvsp57).as_string + "%N")
			end
			yyval17 := yyvs57.item (yyvsp57)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp17 := yyvsp17 + 1
	yyvsp57 := yyvsp57 -1
	if yyvsp17 >= yyvsc17 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs17")
		end
		yyvsc17 := yyvsc17 + yyInitial_yyvs_size
		yyvs17 := yyspecial_routines17.aliased_resized_area (yyvs17, yyvsc17)
	end
	yyspecial_routines17.force (yyvs17, yyval17, yyvsp17)
end
when 36 then
--|#line 490 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 490")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_REAL: " +  yyvs56.item (yyvsp56).as_string + "%N")
			end
			yyval17 := yyvs56.item (yyvsp56)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp17 := yyvsp17 + 1
	yyvsp56 := yyvsp56 -1
	if yyvsp17 >= yyvsc17 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs17")
		end
		yyvsc17 := yyvsc17 + yyInitial_yyvs_size
		yyvs17 := yyspecial_routines17.aliased_resized_area (yyvs17, yyvsc17)
	end
	yyspecial_routines17.force (yyvs17, yyval17, yyvsp17)
end
when 37 then
--|#line 497 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 497")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_DATE: " +  yyvs54.item (yyvsp54).as_string + "%N")
			end
			yyval17 := yyvs54.item (yyvsp54)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp17 := yyvsp17 + 1
	yyvsp54 := yyvsp54 -1
	if yyvsp17 >= yyvsc17 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs17")
		end
		yyvsc17 := yyvsc17 + yyInitial_yyvs_size
		yyvs17 := yyspecial_routines17.aliased_resized_area (yyvs17, yyvsc17)
	end
	yyspecial_routines17.force (yyvs17, yyval17, yyvsp17)
end
when 38 then
--|#line 504 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 504")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_TIME: " +  yyvs55.item (yyvsp55).as_string + "%N")
			end
			yyval17 := yyvs55.item (yyvsp55)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp17 := yyvsp17 + 1
	yyvsp55 := yyvsp55 -1
	if yyvsp17 >= yyvsc17 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs17")
		end
		yyvsc17 := yyvsc17 + yyInitial_yyvs_size
		yyvs17 := yyspecial_routines17.aliased_resized_area (yyvs17, yyvsc17)
	end
	yyspecial_routines17.force (yyvs17, yyval17, yyvsp17)
end
when 39 then
--|#line 511 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 511")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_DATE_TIME: " +  yyvs52.item (yyvsp52).as_string + "%N")
			end
			yyval17 := yyvs52.item (yyvsp52)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp17 := yyvsp17 + 1
	yyvsp52 := yyvsp52 -1
	if yyvsp17 >= yyvsc17 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs17")
		end
		yyvsc17 := yyvsc17 + yyInitial_yyvs_size
		yyvs17 := yyspecial_routines17.aliased_resized_area (yyvs17, yyvsc17)
	end
	yyspecial_routines17.force (yyvs17, yyval17, yyvsp17)
end
when 40 then
--|#line 518 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 518")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_DURATION: " +  yyvs53.item (yyvsp53).as_string + "%N")
			end
			yyval17 := yyvs53.item (yyvsp53)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp17 := yyvsp17 + 1
	yyvsp53 := yyvsp53 -1
	if yyvsp17 >= yyvsc17 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs17")
		end
		yyvsc17 := yyvsc17 + yyInitial_yyvs_size
		yyvs17 := yyspecial_routines17.aliased_resized_area (yyvs17, yyvsc17)
	end
	yyspecial_routines17.force (yyvs17, yyval17, yyvsp17)
end
when 41 then
--|#line 525 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 525")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_STRING: " +  yyvs51.item (yyvsp51).as_string + "%N")
			end
			yyval17 := yyvs51.item (yyvsp51)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp17 := yyvsp17 + 1
	yyvsp51 := yyvsp51 -1
	if yyvsp17 >= yyvsc17 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs17")
		end
		yyvsc17 := yyvsc17 + yyInitial_yyvs_size
		yyvs17 := yyspecial_routines17.aliased_resized_area (yyvs17, yyvsc17)
	end
	yyspecial_routines17.force (yyvs17, yyval17, yyvsp17)
end
when 42 then
--|#line 532 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 532")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_TERMINOLOGY_CODE: " +  yyvs58.item (yyvsp58).as_string + "%N")
			end
			yyval17 := yyvs58.item (yyvsp58)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp17 := yyvsp17 + 1
	yyvsp58 := yyvsp58 -1
	if yyvsp17 >= yyvsc17 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs17")
		end
		yyvsc17 := yyvsc17 + yyInitial_yyvs_size
		yyvs17 := yyspecial_routines17.aliased_resized_area (yyvs17, yyvsc17)
	end
	yyspecial_routines17.force (yyvs17, yyval17, yyvsp17)
end
when 43 then
--|#line 539 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 539")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_BOOLEAN: " +  yyvs50.item (yyvsp50).as_string + "%N")
			end
			yyval17 := yyvs50.item (yyvsp50)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp17 := yyvsp17 + 1
	yyvsp50 := yyvsp50 -1
	if yyvsp17 >= yyvsc17 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs17")
		end
		yyvsc17 := yyvsc17 + yyInitial_yyvs_size
		yyvs17 := yyspecial_routines17.aliased_resized_area (yyvs17, yyvsc17)
	end
	yyspecial_routines17.force (yyvs17, yyval17, yyvsp17)
end
when 44 then
--|#line 548 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 548")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 45 then
--|#line 555 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 555")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 46 then
--|#line 558 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 558")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 47 then
--|#line 563 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 563")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 48 then
--|#line 566 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 566")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 49 then
--|#line 571 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 571")
end

			debug ("ADL_parse")
				io.put_string (indent + "POP ATTR_NODE " + c_attrs.item.rm_attribute_name + "%N") 
				indent.remove_tail (1)
			end
			c_attrs.remove
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp19 := yyvsp19 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 50 then
--|#line 579 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 579")
end

			c_attrs.remove
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp19 := yyvsp19 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 51 then
--|#line 583 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 583")
end

			abort_with_error (ec_SCAS, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp19 := yyvsp19 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 52 then
--|#line 589 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 589")
end

			rm_attribute_name := yyvs2.item (yyvsp2)
			if not object_nodes.item.has_attribute (rm_attribute_name) then
				if rm_schema.has_property (object_nodes.item.rm_type_name, rm_attribute_name) then
					rm_prop_def := rm_schema.property_definition (object_nodes.item.rm_type_name, rm_attribute_name)
					if rm_prop_def.is_container then
						create yyval19.make_multiple (rm_attribute_name, yyvs14.item (yyvsp14), yyvs15.item (yyvsp15))
						c_attrs.put (yyval19)
debug ("ADL_parse")
	io.put_string (indent + "PUSH create ATTR_NODE " + rm_attribute_name + "; container = " + yyval19.is_multiple.out)
	if attached yyvs14.item (yyvsp14) as att_ex then io.put_string (" existence={" + att_ex.as_string + "}") end
	if attached yyvs15.item (yyvsp15) as att_card then io.put_string ("; cardinality=(" + att_card.as_string + ")") end
	io.new_line
	io.put_string (indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_attribute (REL)%N") 
	indent.append ("%T")
end
						object_nodes.item.put_attribute (yyval19)

					elseif not attached yyvs15.item (yyvsp15) then
						create yyval19.make_single (rm_attribute_name, yyvs14.item (yyvsp14))
						c_attrs.put (yyval19)
debug ("ADL_parse")
	io.put_string (indent + "PUSH create ATTR_NODE " + rm_attribute_name + "; container = " + yyval19.is_multiple.out) 
	if attached yyvs14.item (yyvsp14) as att_ex then io.put_string (" existence={" + att_ex.as_string + "}") end
	io.new_line
	io.put_string (indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_attribute (REL)%N") 
	indent.append ("%T")
end
						object_nodes.item.put_attribute (yyval19)
					else -- error - cardinality stated, but on a non-container attribute
						abort_with_error (ec_VSAM2, <<rm_attribute_name>>)
					end
				else
					abort_with_error (ec_VCARM, <<rm_attribute_name, object_nodes.item.path, object_nodes.item.rm_type_name>>)
				end
			else
				abort_with_error (ec_VCATU, <<rm_attribute_name>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp19 := yyvsp19 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp14 := yyvsp14 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp19 >= yyvsc19 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs19")
		end
		yyvsc19 := yyvsc19 + yyInitial_yyvs_size
		yyvs19 := yyspecial_routines19.aliased_resized_area (yyvs19, yyvsc19)
	end
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 53 then
--|#line 629 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 629")
end

			create og_path.make_from_string (yyvs2.item (yyvsp2))
			rm_attribute_name := og_path.last.attr_name
			parent_path_str := og_path.parent_path.as_string

			if not object_nodes.item.has_attribute (yyvs2.item (yyvsp2)) then
				-- check RM to see if path is valid, and if it is a container
				if rm_schema.has_property_path (object_nodes.item.rm_type_name, yyvs2.item (yyvsp2)) then
					rm_prop_def := rm_schema.property_definition_at_path (object_nodes.item.rm_type_name, yyvs2.item (yyvsp2))
					if rm_prop_def.is_container then
						create yyval19.make_multiple (rm_attribute_name, yyvs14.item (yyvsp14), yyvs15.item (yyvsp15))
						yyval19.set_differential_path (parent_path_str)
						c_attrs.put (yyval19)
debug ("ADL_parse")
	io.put_string (indent + "PUSH create ATTR_NODE " + yyvs2.item (yyvsp2) + "; container = " + yyval19.is_multiple.out) 
	if attached yyvs14.item (yyvsp14) as att_ex then io.put_string (" existence={" + att_ex.as_string + "}") end
	if attached yyvs15.item (yyvsp15) as att_card then io.put_string ("; cardinality=(" + att_card.as_string + ")") end
	io.new_line
	io.put_string (indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_attribute (REL)%N") 
	indent.append ("%T")
end
						object_nodes.item.put_attribute (yyval19)

					elseif not attached yyvs15.item (yyvsp15) then
						create yyval19.make_single (rm_attribute_name, yyvs14.item (yyvsp14))
						yyval19.set_differential_path (parent_path_str)
						c_attrs.put (yyval19)
debug ("ADL_parse")
	io.put_string (indent + "PUSH create ATTR_NODE " + yyvs2.item (yyvsp2) + "; container = " + yyval19.is_multiple.out) 
	if attached yyvs14.item (yyvsp14) as att_ex then io.put_string (" existence={" + att_ex.as_string + "}") end
	io.new_line
	io.put_string (indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_attribute (REL)%N") 
	indent.append ("%T")
end
						object_nodes.item.put_attribute (yyval19)
					else -- error - cardinality stated, but on a non-container attribute
						abort_with_error (ec_VSAM2, <<yyvs2.item (yyvsp2)>>)
					end
				else
					abort_with_error (ec_VDIFP2, <<yyvs2.item (yyvsp2)>>)
				end
			else
				abort_with_error (ec_VCATU, <<yyvs2.item (yyvsp2)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp19 := yyvsp19 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp14 := yyvsp14 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp19 >= yyvsc19 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs19")
		end
		yyvsc19 := yyvsc19 + yyInitial_yyvs_size
		yyvs19 := yyspecial_routines19.aliased_resized_area (yyvs19, yyvsc19)
	end
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 54 then
--|#line 677 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 677")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 55 then
--|#line 680 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 680")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 56 then
--|#line 683 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 683")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 57 then
--|#line 688 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 688")
end

			-- add the tuple's C_ATTRIBUTEs to the current object node's children
			across c_attr_tuple.members as c_attrs_csr loop
				if not object_nodes.item.has_attribute (c_attrs_csr.item.rm_attribute_name) then
					object_nodes.item.put_attribute (c_attrs_csr.item)
				else
					abort_with_error (ec_VCATU, <<c_attrs_csr.item.rm_attribute_name>>)
				end
			end

			-- add the tuple to the current object node
			object_nodes.item.put_attribute_tuple (c_attr_tuple)

			debug ("ADL_parse")
				indent.remove_tail (1)
				io.put_string (indent + "C_ATTR_TUPLE (complete)%N") 
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp1 := yyvsp1 -6
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 58 then
--|#line 709 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 709")
end

			create c_attr_tuple.make
			c_attr_tuple.put_member (create {C_ATTRIBUTE}.make_single (yyvs2.item (yyvsp2), Void))
			debug ("ADL_parse")
				io.put_string (indent + "enter C_ATTR_TUPLE%N") 
				indent.append ("%T")
				io.put_string (indent + "add C_ATTR_TUPLE id " + yyvs2.item (yyvsp2) + "%N") 
			end
		
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
when 59 then
--|#line 719 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 719")
end

			c_attr_tuple.put_member (create {C_ATTRIBUTE}.make_single (yyvs2.item (yyvsp2), Void))
			debug ("ADL_parse")
				io.put_string (indent + "add C_ATTR_TUPLE id " + yyvs2.item (yyvsp2) + "%N") 
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 60 then
--|#line 728 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 728")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 61 then
--|#line 731 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 731")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 62 then
--|#line 736 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 736")
end

			debug ("ADL_parse")
				io.put_string (indent + "c_object_tuple - received one tuple %N") 
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 63 then
--|#line 744 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 744")
end

			c_attr_tuple.add_tuple

			-- attach the C_PRIMITIVE_OBJECT under the C_ATTRIBUTE
			c_attr_tuple.i_th_member (c_attr_tuple.tuples.last.count + 1).put_child (yyvs17.item (yyvsp17))

			-- attach the C_PRIMITIVE_OBJECT under the new C_PRIMITIVE_TUPLE
			c_attr_tuple.tuples.last.put_member (yyvs17.item (yyvsp17))
			debug ("ADL_parse")
				io.put_string (indent + "c_tuple values - add C_PRIMITIVE_OBJECT " + c_attr_tuple.i_th_member (1).rm_attribute_name + " %N")
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp17 := yyvsp17 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 64 then
--|#line 757 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 757")
end

			-- attach the C_PRIMITIVE_OBJECT under the C_ATTRIBUTE
			c_attr_tuple.i_th_member (c_attr_tuple.tuples.last.count + 1).put_child (yyvs17.item (yyvsp17))
			c_attr_tuple.tuples.last.put_member (yyvs17.item (yyvsp17))
			debug ("ADL_parse")
				io.put_string (indent + "c_tuple values - add other C_PRIMITIVE_OBJECT " + c_attr_tuple.i_th_member (c_attr_tuple.tuples.last.count + 1).rm_attribute_name + " %N")
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp17 := yyvsp17 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 65 then
--|#line 768 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 768")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp7 := yyvsp7 + 1
	if yyvsp7 >= yyvsc7 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs7")
		end
		yyvsc7 := yyvsc7 + yyInitial_yyvs_size
		yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
	end
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 66 then
--|#line 769 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 769")
end

			debug ("include list")
				io.put_string (indent + "[---assertion expression---] %N")
			end
			yyval7 := yyvs7.item (yyvsp7)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 67 then
--|#line 778 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 778")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp7 := yyvsp7 + 1
	if yyvsp7 >= yyvsc7 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs7")
		end
		yyvsc7 := yyvsc7 + yyInitial_yyvs_size
		yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
	end
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 68 then
--|#line 779 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 779")
end

			debug ("exclude list")
				io.put_string (indent + "[---assertion expression---] %N")
			end
			yyval7 := yyvs7.item (yyvsp7)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 69 then
--|#line 792 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 792")
end

			create yyval7.make (0)
			yyval7.extend (yyvs8.item (yyvsp8))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp7 := yyvsp7 + 1
	yyvsp8 := yyvsp8 -1
	if yyvsp7 >= yyvsc7 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs7")
		end
		yyvsc7 := yyvsc7 + yyInitial_yyvs_size
		yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
	end
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 70 then
--|#line 797 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 797")
end

			yyvs7.item (yyvsp7).extend (yyvs8.item (yyvsp8))
			yyval7 := yyvs7.item (yyvsp7)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp8 := yyvsp8 -1
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 71 then
--|#line 804 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 804")
end

			create yyval8.make (yyvs20.item (yyvsp20), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp8 := yyvsp8 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyvsp20 := yyvsp20 -1
	if yyvsp8 >= yyvsc8 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs8")
		end
		yyvsc8 := yyvsc8 + yyInitial_yyvs_size
		yyvs8 := yyspecial_routines8.aliased_resized_area (yyvs8, yyvsc8)
	end
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 72 then
--|#line 808 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 808")
end

			create yyval8.make (yyvs20.item (yyvsp20), Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp8 := yyvsp8 + 1
	yyvsp20 := yyvsp20 -1
	if yyvsp8 >= yyvsc8 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs8")
		end
		yyvsc8 := yyvsc8 + yyInitial_yyvs_size
		yyvs8 := yyspecial_routines8.aliased_resized_area (yyvs8, yyvsc8)
	end
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 73 then
--|#line 816 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 816")
end

			create yyval8.make (yyvs22.item (yyvsp22), Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp8 := yyvsp8 + 1
	yyvsp22 := yyvsp22 -1
	if yyvsp8 >= yyvsc8 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs8")
		end
		yyvsc8 := yyvsc8 + yyInitial_yyvs_size
		yyvs8 := yyspecial_routines8.aliased_resized_area (yyvs8, yyvsc8)
	end
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 74 then
--|#line 820 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 820")
end

			abort_with_error (ec_SINVS, <<yyvs2.item (yyvsp2)>>)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp8 := yyvsp8 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp8 >= yyvsc8 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs8")
		end
		yyvsc8 := yyvsc8 + yyInitial_yyvs_size
		yyvs8 := yyspecial_routines8.aliased_resized_area (yyvs8, yyvsc8)
	end
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 75 then
--|#line 828 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 828")
end

			yyval20 := yyvs20.item (yyvsp20)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 76 then
--|#line 832 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 832")
end

			yyval20 := yyvs20.item (yyvsp20)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 77 then
--|#line 838 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 838")
end

			debug ("ADL_rule")
				io.put_string (indent + "boolean_expr: REDUCE from boolean_unop_expr: [" + yyvs21.item (yyvsp21).as_string + "]%N") 
			end
			yyval20 := yyvs21.item (yyvsp21)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp20 := yyvsp20 + 1
	yyvsp21 := yyvsp21 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 78 then
--|#line 845 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 845")
end

			yyval20 := yyvs22.item (yyvsp22)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp20 := yyvsp20 + 1
	yyvsp22 := yyvsp22 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 79 then
--|#line 851 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 851")
end

			yyval20 := yyvs23.item (yyvsp23)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp20 := yyvsp20 + 1
	yyvsp23 := yyvsp23 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 80 then
--|#line 855 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 855")
end

			debug ("ADL_rule")
				io.put_string (indent + "boolean_leaf: REDUCE from boolean_constraint: [" + yyvs22.item (yyvsp22).as_string + "]%N") 
			end
			yyval20 := yyvs22.item (yyvsp22)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp20 := yyvsp20 + 1
	yyvsp22 := yyvsp22 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 81 then
--|#line 862 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 862")
end

			yyval20 := yyvs20.item (yyvsp20)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 82 then
--|#line 866 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 866")
end

			yyval20 := yyvs22.item (yyvsp22)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp20 := yyvsp20 + 1
	yyvsp22 := yyvsp22 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 83 then
--|#line 876 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 876")
end

			debug ("ADL_rule")
				io.put_string (indent + "arch_outer_constraint_expr: Archetype outer feature " + yyvs2.item (yyvsp2) + " matches {" + yyvs17.item (yyvsp17).as_string + "}%N") 
			end
			create yyval22.make (create {OPERATOR_KIND}.make (op_matches),
				create {EXPR_LEAF}.make_archetype_ref (yyvs2.item (yyvsp2)),
				create {EXPR_LEAF}.make_constraint (yyvs17.item (yyvsp17)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp22 := yyvsp22 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -3
	yyvsp17 := yyvsp17 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
when 84 then
--|#line 887 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 887")
end

			debug ("ADL_rule")
				io.put_string (indent + "boolean_constraint:" + yyvs2.item (yyvsp2) + " matches {" + yyvs17.item (yyvsp17).as_string + "}%N") 
			end
			create yyval22.make (create {OPERATOR_KIND}.make (op_matches), 
				create {EXPR_LEAF}.make_archetype_definition_ref (yyvs2.item (yyvsp2)),
				create {EXPR_LEAF}.make_constraint (yyvs17.item (yyvsp17)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp22 := yyvsp22 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -3
	yyvsp17 := yyvsp17 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
when 85 then
--|#line 896 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 896")
end

			debug ("ADL_rule")
				io.put_string (indent + "boolean_constraint:" + yyvs2.item (yyvsp2) + " matches {" + yyvs58.item (yyvsp58).as_string + "}%N") 
			end
			create yyval22.make (create {OPERATOR_KIND}.make (op_matches), 
				create {EXPR_LEAF}.make_archetype_definition_ref (yyvs2.item (yyvsp2)),
				create {EXPR_LEAF}.make_coded_term (yyvs58.item (yyvsp58)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp22 := yyvsp22 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -3
	yyvsp58 := yyvsp58 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
when 86 then
--|#line 911 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 911")
end

			debug ("ADL_rule")
				io.put_string (indent + "boolean_unop_expr: exists " + yyvs2.item (yyvsp2) + "%N") 
			end
			create yyval21.make (create {OPERATOR_KIND}.make (op_exists), create {EXPR_LEAF}.make_archetype_definition_ref (yyvs2.item (yyvsp2)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp21 := yyvsp21 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 87 then
--|#line 918 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 918")
end

			debug ("ADL_rule")
				io.put_string (indent + "boolean_unop_expr: not " + yyvs2.item (yyvsp2) + "%N") 
			end
			create yyval21.make (create {OPERATOR_KIND}.make (op_not), create {EXPR_LEAF}.make_archetype_definition_ref (yyvs2.item (yyvsp2)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp21 := yyvsp21 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 88 then
--|#line 925 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 925")
end

			debug ("ADL_rule")
				io.put_string (indent + "boolean_unop_expr: not [(" + yyvs20.item (yyvsp20).as_string + ")] %N") 
			end
			create yyval21.make (create {OPERATOR_KIND}.make (op_not), yyvs20.item (yyvsp20))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp21 := yyvsp21 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp20 := yyvsp20 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 89 then
--|#line 932 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 932")
end

			abort_with_error (ec_SEXPT, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp21 := yyvsp21 + 1
	yyvsp1 := yyvsp1 -2
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 90 then
--|#line 942 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 942")
end

			debug ("ADL_rule")
				io.put_string (indent + "boolean_binop_expr: [" + yyvs20.item (yyvsp20 - 1).as_string + "] " + yyvs2.item (yyvsp2) + " [" + yyvs20.item (yyvsp20).as_string + "]%N") 
			end
			create yyval22.make (create {OPERATOR_KIND}.make (operator_ids_from_symbols.item (yyvs2.item (yyvsp2))), yyvs20.item (yyvsp20 - 1), yyvs20.item (yyvsp20))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp22 := yyvsp22 + 1
	yyvsp20 := yyvsp20 -2
	yyvsp2 := yyvsp2 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
when 91 then
--|#line 951 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 951")
end

			yyval2 := operator_symbol (op_or)
		
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
when 92 then
--|#line 955 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 955")
end

			yyval2 := operator_symbol (op_and)
		
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
when 93 then
--|#line 959 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 959")
end

			yyval2 := operator_symbol (op_xor)
		
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
when 94 then
--|#line 963 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 963")
end

			yyval2 := operator_symbol (op_implies)
		
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
when 95 then
--|#line 973 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 973")
end

			create yyval23.make_boolean (True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp23 := yyvsp23 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp23 >= yyvsc23 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs23")
		end
		yyvsc23 := yyvsc23 + yyInitial_yyvs_size
		yyvs23 := yyspecial_routines23.aliased_resized_area (yyvs23, yyvsc23)
	end
	yyspecial_routines23.force (yyvs23, yyval23, yyvsp23)
end
when 96 then
--|#line 977 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 977")
end

			create yyval23.make_boolean (False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp23 := yyvsp23 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp23 >= yyvsc23 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs23")
		end
		yyvsc23 := yyvsc23 + yyInitial_yyvs_size
		yyvs23 := yyspecial_routines23.aliased_resized_area (yyvs23, yyvsc23)
	end
	yyspecial_routines23.force (yyvs23, yyval23, yyvsp23)
end
when 97 then
--|#line 987 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 987")
end

			debug ("ADL_rule")
				io.put_string (indent + "arithmetic_relop_expr: [" + yyvs20.item (yyvsp20 - 1).as_string + "] " + yyvs2.item (yyvsp2) + " [" + yyvs20.item (yyvsp20).as_string + "]%N") 
			end
			create yyval22.make (create {OPERATOR_KIND}.make (operator_ids_from_symbols.item (yyvs2.item (yyvsp2))), yyvs20.item (yyvsp20 - 1), yyvs20.item (yyvsp20))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp22 := yyvsp22 + 1
	yyvsp20 := yyvsp20 -2
	yyvsp2 := yyvsp2 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
when 98 then
--|#line 1000 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1000")
end

			yyval20 := yyvs20.item (yyvsp20)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 99 then
--|#line 1004 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1004")
end

			yyval20 := yyvs22.item (yyvsp22)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp20 := yyvsp20 + 1
	yyvsp22 := yyvsp22 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 100 then
--|#line 1010 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1010")
end

			yyval20 := yyvs23.item (yyvsp23)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp20 := yyvsp20 + 1
	yyvsp23 := yyvsp23 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 101 then
--|#line 1014 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1014")
end

			debug ("ADL_rule")
				io.put_string (indent + "(expr) %N") 
			end
			yyval20 := yyvs20.item (yyvsp20)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 102 then
--|#line 1027 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1027")
end

			debug ("ADL_rule")
				io.put_string (indent + "arithmetic_arith_binop_expr: [" + yyvs20.item (yyvsp20 - 1).as_string + "] " + yyvs2.item (yyvsp2) + " [" + yyvs20.item (yyvsp20).as_string + "]%N") 
			end
			create yyval22.make (create {OPERATOR_KIND}.make (operator_ids_from_symbols.item (yyvs2.item (yyvsp2))), yyvs20.item (yyvsp20 - 1), yyvs20.item (yyvsp20))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp22 := yyvsp22 + 1
	yyvsp20 := yyvsp20 -2
	yyvsp2 := yyvsp2 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
when 103 then
--|#line 1040 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1040")
end

			debug ("ADL_rule")
				io.put_string (indent + "arith_leaf - integer: " + yyvs3.item (yyvsp3).out + "%N") 
			end
			create yyval23.make_integer (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp23 := yyvsp23 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp23 >= yyvsc23 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs23")
		end
		yyvsc23 := yyvsc23 + yyInitial_yyvs_size
		yyvs23 := yyspecial_routines23.aliased_resized_area (yyvs23, yyvsc23)
	end
	yyspecial_routines23.force (yyvs23, yyval23, yyvsp23)
end
when 104 then
--|#line 1047 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1047")
end

			debug ("ADL_rule")
				io.put_string (indent + "arith_leaf - real: " + yyvs4.item (yyvsp4).out + "%N") 
			end
			create yyval23.make_real (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp23 := yyvsp23 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp23 >= yyvsc23 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs23")
		end
		yyvsc23 := yyvsc23 + yyInitial_yyvs_size
		yyvs23 := yyspecial_routines23.aliased_resized_area (yyvs23, yyvsc23)
	end
	yyspecial_routines23.force (yyvs23, yyval23, yyvsp23)
end
when 105 then
--|#line 1054 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1054")
end

			debug ("ADL_rule")
				io.put_string (indent + "arith_leaf - path: " + yyvs2.item (yyvsp2) + "%N") 
			end
			create yyval23.make_archetype_definition_ref (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp23 := yyvsp23 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp23 >= yyvsc23 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs23")
		end
		yyvsc23 := yyvsc23 + yyInitial_yyvs_size
		yyvs23 := yyspecial_routines23.aliased_resized_area (yyvs23, yyvsc23)
	end
	yyspecial_routines23.force (yyvs23, yyval23, yyvsp23)
end
when 106 then
--|#line 1063 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1063")
end

			yyval2 := operator_symbol (op_eq)
		
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
when 107 then
--|#line 1067 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1067")
end

			yyval2 := operator_symbol (op_ne)
		
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
when 108 then
--|#line 1071 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1071")
end

			yyval2 := operator_symbol (op_le)
		
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
when 109 then
--|#line 1075 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1075")
end

			yyval2 := operator_symbol (op_lt)
		
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
when 110 then
--|#line 1079 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1079")
end

			yyval2 := operator_symbol (op_ge)
		
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
when 111 then
--|#line 1083 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1083")
end

			yyval2 := operator_symbol (op_gt)
		
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
when 112 then
--|#line 1089 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1089")
end

			yyval2 := operator_symbol (op_divide)
		
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
when 113 then
--|#line 1093 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1093")
end

			yyval2 := operator_symbol (op_multiply)
		
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
when 114 then
--|#line 1097 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1097")
end

			yyval2 := operator_symbol (op_plus)
		
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
when 115 then
--|#line 1101 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1101")
end

			yyval2 := operator_symbol (op_minus)
		
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
when 116 then
--|#line 1105 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1105")
end

			yyval2 := operator_symbol (op_exp)
		
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
when 117 then
--|#line 1114 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1114")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp14 := yyvsp14 + 1
	if yyvsp14 >= yyvsc14 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs14")
		end
		yyvsc14 := yyvsc14 + yyInitial_yyvs_size
		yyvs14 := yyspecial_routines14.aliased_resized_area (yyvs14, yyvsc14)
	end
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 118 then
--|#line 1115 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1115")
end

			yyval14 := yyvs12.item (yyvsp12)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp14 := yyvsp14 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp12 := yyvsp12 -1
	if yyvsp14 >= yyvsc14 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs14")
		end
		yyvsc14 := yyvsc14 + yyInitial_yyvs_size
		yyvs14 := yyspecial_routines14.aliased_resized_area (yyvs14, yyvsc14)
	end
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 119 then
--|#line 1121 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1121")
end

			if yyvs3.item (yyvsp3) = 0 then
				create yyval12.make_prohibited
			elseif yyvs3.item (yyvsp3) = 1 then
				create yyval12.make_mandatory
			else
				abort_with_error (ec_SEXLSG, Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp12 := yyvsp12 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp12 >= yyvsc12 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs12")
		end
		yyvsc12 := yyvsc12 + yyInitial_yyvs_size
		yyvs12 := yyspecial_routines12.aliased_resized_area (yyvs12, yyvsc12)
	end
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 120 then
--|#line 1131 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1131")
end

			if yyvs3.item (yyvsp3 - 1) = 0 then
				if yyvs3.item (yyvsp3) = 0 then
					create yyval12.make_point (0)
				elseif yyvs3.item (yyvsp3) = 1 then
					create yyval12.make_bounded (0, 1)
				else
					abort_with_error (ec_SEXLU1, Void)
				end
			elseif yyvs3.item (yyvsp3 - 1) = 1 then
				if yyvs3.item (yyvsp3) = 1 then
					create yyval12.make_point (1)
				else
					abort_with_error (ec_SEXLU2, Void)
				end
			else
				abort_with_error (ec_SEXLMG, Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp12 := yyvsp12 + 1
	yyvsp3 := yyvsp3 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp12 >= yyvsc12 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs12")
		end
		yyvsc12 := yyvsc12 + yyInitial_yyvs_size
		yyvs12 := yyspecial_routines12.aliased_resized_area (yyvs12, yyvsc12)
	end
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 121 then
--|#line 1153 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1153")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp15 := yyvsp15 + 1
	if yyvsp15 >= yyvsc15 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs15")
		end
		yyvsc15 := yyvsc15 + yyInitial_yyvs_size
		yyvs15 := yyspecial_routines15.aliased_resized_area (yyvs15, yyvsc15)
	end
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 122 then
--|#line 1154 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1154")
end

			yyval15 := yyvs13.item (yyvsp13)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp15 := yyvsp15 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp13 := yyvsp13 -1
	if yyvsp15 >= yyvsc15 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs15")
		end
		yyvsc15 := yyvsc15 + yyInitial_yyvs_size
		yyvs15 := yyspecial_routines15.aliased_resized_area (yyvs15, yyvsc15)
	end
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 123 then
--|#line 1160 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1160")
end

			create yyval13.make (yyvs12.item (yyvsp12))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp13 := yyvsp13 + 1
	yyvsp12 := yyvsp12 -1
	if yyvsp13 >= yyvsc13 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs13")
		end
		yyvsc13 := yyvsc13 + yyInitial_yyvs_size
		yyvs13 := yyspecial_routines13.aliased_resized_area (yyvs13, yyvsc13)
	end
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 124 then
--|#line 1164 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1164")
end

			create yyval13.make (yyvs12.item (yyvsp12))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp13 := yyvsp13 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp13 >= yyvsc13 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs13")
		end
		yyvsc13 := yyvsc13 + yyInitial_yyvs_size
		yyvs13 := yyspecial_routines13.aliased_resized_area (yyvs13, yyvsc13)
	end
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 125 then
--|#line 1168 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1168")
end

			create yyval13.make (yyvs12.item (yyvsp12))
			yyval13.set_unordered
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp13 := yyvsp13 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp13 >= yyvsc13 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs13")
		end
		yyvsc13 := yyvsc13 + yyInitial_yyvs_size
		yyvs13 := yyspecial_routines13.aliased_resized_area (yyvs13, yyvsc13)
	end
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 126 then
--|#line 1173 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1173")
end

			create yyval13.make (yyvs12.item (yyvsp12))
			yyval13.set_unique
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp13 := yyvsp13 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp13 >= yyvsc13 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs13")
		end
		yyvsc13 := yyvsc13 + yyInitial_yyvs_size
		yyvs13 := yyspecial_routines13.aliased_resized_area (yyvs13, yyvsc13)
	end
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 127 then
--|#line 1178 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1178")
end

			create yyval13.make (yyvs12.item (yyvsp12))
			yyval13.set_unique
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp13 := yyvsp13 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp1 := yyvsp1 -4
	if yyvsp13 >= yyvsc13 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs13")
		end
		yyvsc13 := yyvsc13 + yyInitial_yyvs_size
		yyvs13 := yyspecial_routines13.aliased_resized_area (yyvs13, yyvsc13)
	end
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 128 then
--|#line 1183 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1183")
end

			create yyval13.make (yyvs12.item (yyvsp12))
			yyval13.set_unique
			yyval13.set_unordered
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp13 := yyvsp13 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp1 := yyvsp1 -4
	if yyvsp13 >= yyvsc13 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs13")
		end
		yyvsc13 := yyvsc13 + yyInitial_yyvs_size
		yyvs13 := yyspecial_routines13.aliased_resized_area (yyvs13, yyvsc13)
	end
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 129 then
--|#line 1189 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1189")
end

			create yyval13.make (yyvs12.item (yyvsp12))
			yyval13.set_unique
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp13 := yyvsp13 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp1 := yyvsp1 -4
	if yyvsp13 >= yyvsc13 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs13")
		end
		yyvsc13 := yyvsc13 + yyInitial_yyvs_size
		yyvs13 := yyspecial_routines13.aliased_resized_area (yyvs13, yyvsc13)
	end
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 130 then
--|#line 1194 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1194")
end

			create yyval13.make (yyvs12.item (yyvsp12))
			yyval13.set_unique
			yyval13.set_unordered
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp13 := yyvsp13 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp1 := yyvsp1 -4
	if yyvsp13 >= yyvsc13 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs13")
		end
		yyvsc13 := yyvsc13 + yyInitial_yyvs_size
		yyvs13 := yyspecial_routines13.aliased_resized_area (yyvs13, yyvsc13)
	end
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 131 then
--|#line 1202 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1202")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp14 := yyvsp14 + 1
	if yyvsp14 >= yyvsc14 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs14")
		end
		yyvsc14 := yyvsc14 + yyInitial_yyvs_size
		yyvs14 := yyspecial_routines14.aliased_resized_area (yyvs14, yyvsc14)
	end
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 132 then
--|#line 1203 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1203")
end

			yyval14 := yyvs12.item (yyvsp12)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp14 := yyvsp14 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp12 := yyvsp12 -1
	if yyvsp14 >= yyvsc14 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs14")
		end
		yyvsc14 := yyvsc14 + yyInitial_yyvs_size
		yyvs14 := yyspecial_routines14.aliased_resized_area (yyvs14, yyvsc14)
	end
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 133 then
--|#line 1207 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1207")
end

			abort_with_error (ec_SOCCF, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp14 := yyvsp14 + 1
	yyvsp1 := yyvsp1 -2
	if yyvsp14 >= yyvsc14 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs14")
		end
		yyvsc14 := yyvsc14 + yyInitial_yyvs_size
		yyvs14 := yyspecial_routines14.aliased_resized_area (yyvs14, yyvsc14)
	end
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 134 then
--|#line 1213 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1213")
end

			create yyval12.make_point (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp12 := yyvsp12 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp12 >= yyvsc12 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs12")
		end
		yyvsc12 := yyvsc12 + yyInitial_yyvs_size
		yyvs12 := yyspecial_routines12.aliased_resized_area (yyvs12, yyvsc12)
	end
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 135 then
--|#line 1217 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1217")
end

			create yyval12.make_upper_unbounded (0)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp12 := yyvsp12 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp12 >= yyvsc12 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs12")
		end
		yyvsc12 := yyvsc12 + yyInitial_yyvs_size
		yyvs12 := yyspecial_routines12.aliased_resized_area (yyvs12, yyvsc12)
	end
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 136 then
--|#line 1221 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1221")
end

			create yyval12.make_bounded (yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp12 := yyvsp12 + 1
	yyvsp3 := yyvsp3 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp12 >= yyvsc12 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs12")
		end
		yyvsc12 := yyvsc12 + yyInitial_yyvs_size
		yyvs12 := yyspecial_routines12.aliased_resized_area (yyvs12, yyvsc12)
	end
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 137 then
--|#line 1225 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1225")
end

			create yyval12.make_upper_unbounded (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp12 := yyvsp12 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp12 >= yyvsc12 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs12")
		end
		yyvsc12 := yyvsc12 + yyInitial_yyvs_size
		yyvs12 := yyspecial_routines12.aliased_resized_area (yyvs12, yyvsc12)
	end
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 138 then
--|#line 1233 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1233")
end

			create yyval57.make_value (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp57 := yyvsp57 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp57 >= yyvsc57 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs57")
		end
		yyvsc57 := yyvsc57 + yyInitial_yyvs_size
		yyvs57 := yyspecial_routines57.aliased_resized_area (yyvs57, yyvsc57)
	end
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
when 139 then
--|#line 1237 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1237")
end

			create yyval57.make_value_list (yyvs31.item (yyvsp31))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp57 := yyvsp57 + 1
	yyvsp31 := yyvsp31 -1
	if yyvsp57 >= yyvsc57 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs57")
		end
		yyvsc57 := yyvsc57 + yyInitial_yyvs_size
		yyvs57 := yyspecial_routines57.aliased_resized_area (yyvs57, yyvsc57)
	end
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
when 140 then
--|#line 1241 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1241")
end

			create yyval57.make_interval (yyvs38.item (yyvsp38))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp57 := yyvsp57 + 1
	yyvsp38 := yyvsp38 -1
	if yyvsp57 >= yyvsc57 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs57")
		end
		yyvsc57 := yyvsc57 + yyInitial_yyvs_size
		yyvs57 := yyspecial_routines57.aliased_resized_area (yyvs57, yyvsc57)
	end
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
when 141 then
--|#line 1245 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1245")
end

			create yyval57.make (yyvs44.item (yyvsp44))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp57 := yyvsp57 + 1
	yyvsp44 := yyvsp44 -1
	if yyvsp57 >= yyvsc57 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs57")
		end
		yyvsc57 := yyvsc57 + yyInitial_yyvs_size
		yyvs57 := yyspecial_routines57.aliased_resized_area (yyvs57, yyvsc57)
	end
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
when 142 then
--|#line 1249 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1249")
end

			if yyvs57.item (yyvsp57).valid_value (yyvs3.item (yyvsp3)) then
				yyvs57.item (yyvsp57).set_assumed_value (yyvs3.item (yyvsp3))
				yyval57 := yyvs57.item (yyvsp57)
			else
				abort_with_error (ec_VOBAV, <<yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
when 143 then
--|#line 1258 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1258")
end

			abort_with_error (ec_SCIAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
when 144 then
--|#line 1264 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1264")
end

			create yyval56.make_value (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp56 := yyvsp56 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp56 >= yyvsc56 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs56")
		end
		yyvsc56 := yyvsc56 + yyInitial_yyvs_size
		yyvs56 := yyspecial_routines56.aliased_resized_area (yyvs56, yyvsc56)
	end
	yyspecial_routines56.force (yyvs56, yyval56, yyvsp56)
end
when 145 then
--|#line 1268 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1268")
end

			create yyval56.make_value_list (yyvs32.item (yyvsp32))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp56 := yyvsp56 + 1
	yyvsp32 := yyvsp32 -1
	if yyvsp56 >= yyvsc56 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs56")
		end
		yyvsc56 := yyvsc56 + yyInitial_yyvs_size
		yyvs56 := yyspecial_routines56.aliased_resized_area (yyvs56, yyvsc56)
	end
	yyspecial_routines56.force (yyvs56, yyval56, yyvsp56)
end
when 146 then
--|#line 1272 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1272")
end

			create yyval56.make_interval (yyvs39.item (yyvsp39))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp56 := yyvsp56 + 1
	yyvsp39 := yyvsp39 -1
	if yyvsp56 >= yyvsc56 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs56")
		end
		yyvsc56 := yyvsc56 + yyInitial_yyvs_size
		yyvs56 := yyspecial_routines56.aliased_resized_area (yyvs56, yyvsc56)
	end
	yyspecial_routines56.force (yyvs56, yyval56, yyvsp56)
end
when 147 then
--|#line 1276 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1276")
end

			create yyval56.make (yyvs45.item (yyvsp45))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp56 := yyvsp56 + 1
	yyvsp45 := yyvsp45 -1
	if yyvsp56 >= yyvsc56 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs56")
		end
		yyvsc56 := yyvsc56 + yyInitial_yyvs_size
		yyvs56 := yyspecial_routines56.aliased_resized_area (yyvs56, yyvsc56)
	end
	yyspecial_routines56.force (yyvs56, yyval56, yyvsp56)
end
when 148 then
--|#line 1280 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1280")
end

			if yyvs56.item (yyvsp56).valid_value (yyvs4.item (yyvsp4)) then
				yyvs56.item (yyvsp56).set_assumed_value (yyvs4.item (yyvsp4))
				yyval56 := yyvs56.item (yyvsp56)
			else
				abort_with_error (ec_VOBAV, <<yyvs4.item (yyvsp4).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyspecial_routines56.force (yyvs56, yyval56, yyvsp56)
end
when 149 then
--|#line 1289 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1289")
end

			abort_with_error (ec_SCRAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines56.force (yyvs56, yyval56, yyvsp56)
end
when 150 then
--|#line 1295 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1295")
end

			if valid_iso8601_date_constraint_pattern (yyvs2.item (yyvsp2)) then
				create yyval54.make_from_pattern (yyvs2.item (yyvsp2))
			else
				create str.make (0)
				from valid_date_constraint_patterns.start until valid_date_constraint_patterns.off loop
					if not valid_date_constraint_patterns.isfirst then
						str.append (", ")
					end
					str.append (valid_date_constraint_patterns.item)
					valid_date_constraint_patterns.forth
				end
				abort_with_error (ec_SCDPT, <<yyvs2.item (yyvsp2), str>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp54 := yyvsp54 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp54 >= yyvsc54 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs54")
		end
		yyvsc54 := yyvsc54 + yyInitial_yyvs_size
		yyvs54 := yyspecial_routines54.aliased_resized_area (yyvs54, yyvsc54)
	end
	yyspecial_routines54.force (yyvs54, yyval54, yyvsp54)
end
when 151 then
--|#line 1311 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1311")
end

			create yyval54.make_value (yyvs25.item (yyvsp25))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp54 := yyvsp54 + 1
	yyvsp25 := yyvsp25 -1
	if yyvsp54 >= yyvsc54 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs54")
		end
		yyvsc54 := yyvsc54 + yyInitial_yyvs_size
		yyvs54 := yyspecial_routines54.aliased_resized_area (yyvs54, yyvsc54)
	end
	yyspecial_routines54.force (yyvs54, yyval54, yyvsp54)
end
when 152 then
--|#line 1315 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1315")
end

			create yyval54.make_value_list (yyvs34.item (yyvsp34))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp54 := yyvsp54 + 1
	yyvsp34 := yyvsp34 -1
	if yyvsp54 >= yyvsc54 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs54")
		end
		yyvsc54 := yyvsc54 + yyInitial_yyvs_size
		yyvs54 := yyspecial_routines54.aliased_resized_area (yyvs54, yyvsc54)
	end
	yyspecial_routines54.force (yyvs54, yyval54, yyvsp54)
end
when 153 then
--|#line 1319 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1319")
end

			create yyval54.make_interval (yyvs41.item (yyvsp41))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp54 := yyvsp54 + 1
	yyvsp41 := yyvsp41 -1
	if yyvsp54 >= yyvsc54 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs54")
		end
		yyvsc54 := yyvsc54 + yyInitial_yyvs_size
		yyvs54 := yyspecial_routines54.aliased_resized_area (yyvs54, yyvsc54)
	end
	yyspecial_routines54.force (yyvs54, yyval54, yyvsp54)
end
when 154 then
--|#line 1323 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1323")
end

			create yyval54.make (yyvs47.item (yyvsp47))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp54 := yyvsp54 + 1
	yyvsp47 := yyvsp47 -1
	if yyvsp54 >= yyvsc54 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs54")
		end
		yyvsc54 := yyvsc54 + yyInitial_yyvs_size
		yyvs54 := yyspecial_routines54.aliased_resized_area (yyvs54, yyvsc54)
	end
	yyspecial_routines54.force (yyvs54, yyval54, yyvsp54)
end
when 155 then
--|#line 1327 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1327")
end

			if yyvs54.item (yyvsp54).valid_value (yyvs25.item (yyvsp25)) then
				yyvs54.item (yyvsp54).set_assumed_value (yyvs25.item (yyvsp25))
				yyval54 := yyvs54.item (yyvsp54)
			else
				abort_with_error (ec_VOBAV, <<yyvs25.item (yyvsp25).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp25 := yyvsp25 -1
	yyspecial_routines54.force (yyvs54, yyval54, yyvsp54)
end
when 156 then
--|#line 1336 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1336")
end

			abort_with_error (ec_SCDAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines54.force (yyvs54, yyval54, yyvsp54)
end
when 157 then
--|#line 1342 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1342")
end

			if valid_iso8601_time_constraint_pattern (yyvs2.item (yyvsp2)) then
				create yyval55.make_from_pattern (yyvs2.item (yyvsp2))
			else
				create str.make (0)
				across valid_time_constraint_patterns as patterns_csr loop
					if patterns_csr.cursor_index > 1 then
						str.append (", ")
					end
					str.append (patterns_csr.item)
				end
				abort_with_error (ec_SCTPT, <<yyvs2.item (yyvsp2), str>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp55 := yyvsp55 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp55 >= yyvsc55 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs55")
		end
		yyvsc55 := yyvsc55 + yyInitial_yyvs_size
		yyvs55 := yyspecial_routines55.aliased_resized_area (yyvs55, yyvsc55)
	end
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
when 158 then
--|#line 1357 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1357")
end

			create yyval55.make_value (yyvs27.item (yyvsp27))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp55 := yyvsp55 + 1
	yyvsp27 := yyvsp27 -1
	if yyvsp55 >= yyvsc55 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs55")
		end
		yyvsc55 := yyvsc55 + yyInitial_yyvs_size
		yyvs55 := yyspecial_routines55.aliased_resized_area (yyvs55, yyvsc55)
	end
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
when 159 then
--|#line 1361 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1361")
end

			create yyval55.make_value_list (yyvs35.item (yyvsp35))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp55 := yyvsp55 + 1
	yyvsp35 := yyvsp35 -1
	if yyvsp55 >= yyvsc55 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs55")
		end
		yyvsc55 := yyvsc55 + yyInitial_yyvs_size
		yyvs55 := yyspecial_routines55.aliased_resized_area (yyvs55, yyvsc55)
	end
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
when 160 then
--|#line 1365 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1365")
end

			create yyval55.make_interval (yyvs40.item (yyvsp40))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp55 := yyvsp55 + 1
	yyvsp40 := yyvsp40 -1
	if yyvsp55 >= yyvsc55 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs55")
		end
		yyvsc55 := yyvsc55 + yyInitial_yyvs_size
		yyvs55 := yyspecial_routines55.aliased_resized_area (yyvs55, yyvsc55)
	end
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
when 161 then
--|#line 1369 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1369")
end

			create yyval55.make (yyvs46.item (yyvsp46))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp55 := yyvsp55 + 1
	yyvsp46 := yyvsp46 -1
	if yyvsp55 >= yyvsc55 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs55")
		end
		yyvsc55 := yyvsc55 + yyInitial_yyvs_size
		yyvs55 := yyspecial_routines55.aliased_resized_area (yyvs55, yyvsc55)
	end
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
when 162 then
--|#line 1373 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1373")
end

			if yyvs55.item (yyvsp55).valid_value (yyvs27.item (yyvsp27)) then
				yyvs55.item (yyvsp55).set_assumed_value (yyvs27.item (yyvsp27))
				yyval55 := yyvs55.item (yyvsp55)
			else
				abort_with_error (ec_VOBAV, <<yyvs27.item (yyvsp27).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp27 := yyvsp27 -1
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
when 163 then
--|#line 1382 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1382")
end

			abort_with_error (ec_SCTAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
when 164 then
--|#line 1388 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1388")
end

			if valid_iso8601_date_time_constraint_pattern (yyvs2.item (yyvsp2)) then
				create yyval52.make_from_pattern (yyvs2.item (yyvsp2))
			else
				create str.make (0)
				across valid_date_time_constraint_patterns as patterns_csr loop
					if patterns_csr.cursor_index > 1 then
						str.append (", ")
					end
					str.append (patterns_csr.item)
				end
				abort_with_error (ec_SCDTPT, <<yyvs2.item (yyvsp2), str>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp52 := yyvsp52 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
when 165 then
--|#line 1403 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1403")
end

			create yyval52.make_value (yyvs26.item (yyvsp26))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp52 := yyvsp52 + 1
	yyvsp26 := yyvsp26 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
when 166 then
--|#line 1407 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1407")
end

			create yyval52.make_value_list (yyvs36.item (yyvsp36))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp52 := yyvsp52 + 1
	yyvsp36 := yyvsp36 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
when 167 then
--|#line 1411 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1411")
end

			create yyval52.make_interval (yyvs42.item (yyvsp42))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp52 := yyvsp52 + 1
	yyvsp42 := yyvsp42 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
when 168 then
--|#line 1415 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1415")
end

			create yyval52.make (yyvs48.item (yyvsp48))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp52 := yyvsp52 + 1
	yyvsp48 := yyvsp48 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
when 169 then
--|#line 1419 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1419")
end

			if yyvs52.item (yyvsp52).valid_value (yyvs26.item (yyvsp26)) then
				yyvs52.item (yyvsp52).set_assumed_value (yyvs26.item (yyvsp26))
				yyval52 := yyvs52.item (yyvsp52)
			else
				abort_with_error (ec_VOBAV, <<yyvs26.item (yyvsp26).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp26 := yyvsp26 -1
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
when 170 then
--|#line 1428 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1428")
end

			abort_with_error (ec_SCDTAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
when 171 then
--|#line 1434 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1434")
end

			if valid_iso8601_duration_constraint_pattern (yyvs2.item (yyvsp2)) then
				create yyval53.make_pattern_with_range (yyvs2.item (yyvsp2), yyvs43.item (yyvsp43))
			else
				abort_with_error (ec_SCDUPT, <<yyvs2.item (yyvsp2)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp53 := yyvsp53 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyvsp43 := yyvsp43 -1
	if yyvsp53 >= yyvsc53 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs53")
		end
		yyvsc53 := yyvsc53 + yyInitial_yyvs_size
		yyvs53 := yyspecial_routines53.aliased_resized_area (yyvs53, yyvsc53)
	end
	yyspecial_routines53.force (yyvs53, yyval53, yyvsp53)
end
when 172 then
--|#line 1442 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1442")
end

			if valid_iso8601_duration_constraint_pattern (yyvs2.item (yyvsp2)) then
				create yyval53.make_from_pattern (yyvs2.item (yyvsp2))
			else
				abort_with_error (ec_SCDUPT, <<yyvs2.item (yyvsp2)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp53 := yyvsp53 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp53 >= yyvsc53 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs53")
		end
		yyvsc53 := yyvsc53 + yyInitial_yyvs_size
		yyvs53 := yyspecial_routines53.aliased_resized_area (yyvs53, yyvsc53)
	end
	yyspecial_routines53.force (yyvs53, yyval53, yyvsp53)
end
when 173 then
--|#line 1450 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1450")
end

			create yyval53.make_value (yyvs28.item (yyvsp28))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp53 := yyvsp53 + 1
	yyvsp28 := yyvsp28 -1
	if yyvsp53 >= yyvsc53 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs53")
		end
		yyvsc53 := yyvsc53 + yyInitial_yyvs_size
		yyvs53 := yyspecial_routines53.aliased_resized_area (yyvs53, yyvsc53)
	end
	yyspecial_routines53.force (yyvs53, yyval53, yyvsp53)
end
when 174 then
--|#line 1454 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1454")
end

			create yyval53.make_value_list (yyvs37.item (yyvsp37))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp53 := yyvsp53 + 1
	yyvsp37 := yyvsp37 -1
	if yyvsp53 >= yyvsc53 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs53")
		end
		yyvsc53 := yyvsc53 + yyInitial_yyvs_size
		yyvs53 := yyspecial_routines53.aliased_resized_area (yyvs53, yyvsc53)
	end
	yyspecial_routines53.force (yyvs53, yyval53, yyvsp53)
end
when 175 then
--|#line 1458 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1458")
end

			create yyval53.make_interval (yyvs43.item (yyvsp43))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp53 := yyvsp53 + 1
	yyvsp43 := yyvsp43 -1
	if yyvsp53 >= yyvsc53 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs53")
		end
		yyvsc53 := yyvsc53 + yyInitial_yyvs_size
		yyvs53 := yyspecial_routines53.aliased_resized_area (yyvs53, yyvsc53)
	end
	yyspecial_routines53.force (yyvs53, yyval53, yyvsp53)
end
when 176 then
--|#line 1462 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1462")
end

			create yyval53.make (yyvs49.item (yyvsp49))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp53 := yyvsp53 + 1
	yyvsp49 := yyvsp49 -1
	if yyvsp53 >= yyvsc53 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs53")
		end
		yyvsc53 := yyvsc53 + yyInitial_yyvs_size
		yyvs53 := yyspecial_routines53.aliased_resized_area (yyvs53, yyvsc53)
	end
	yyspecial_routines53.force (yyvs53, yyval53, yyvsp53)
end
when 177 then
--|#line 1466 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1466")
end

			if yyvs53.item (yyvsp53).valid_value (yyvs28.item (yyvsp28)) then
				yyvs53.item (yyvsp53).set_assumed_value (yyvs28.item (yyvsp28))
				yyval53 := yyvs53.item (yyvsp53)
			else
				abort_with_error (ec_VOBAV, <<yyvs28.item (yyvsp28).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp28 := yyvsp28 -1
	yyspecial_routines53.force (yyvs53, yyval53, yyvsp53)
end
when 178 then
--|#line 1475 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1475")
end

			abort_with_error (ec_SCDUAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines53.force (yyvs53, yyval53, yyvsp53)
end
when 179 then
--|#line 1480 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1480")
end

			abort_with_error (ec_SCDUPT, <<yyvs2.item (yyvsp2).out>>)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp53 := yyvsp53 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp53 >= yyvsc53 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs53")
		end
		yyvsc53 := yyvsc53 + yyInitial_yyvs_size
		yyvs53 := yyspecial_routines53.aliased_resized_area (yyvs53, yyvsc53)
	end
	yyspecial_routines53.force (yyvs53, yyval53, yyvsp53)
end
when 180 then
--|#line 1486 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1486")
end

			create yyval51.make_value (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp51 := yyvsp51 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp51 >= yyvsc51 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs51")
		end
		yyvsc51 := yyvsc51 + yyInitial_yyvs_size
		yyvs51 := yyspecial_routines51.aliased_resized_area (yyvs51, yyvsc51)
	end
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
when 181 then
--|#line 1490 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1490")
end

			create yyval51.make (yyvs30.item (yyvsp30))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp51 := yyvsp51 + 1
	yyvsp30 := yyvsp30 -1
	if yyvsp51 >= yyvsc51 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs51")
		end
		yyvsc51 := yyvsc51 + yyInitial_yyvs_size
		yyvs51 := yyspecial_routines51.aliased_resized_area (yyvs51, yyvsc51)
	end
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
when 182 then
--|#line 1494 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1494")
end

			create yyval51.make_value (yyvs2.item (yyvsp2))
			if yyval51.constraint.first.is_equal ({C_STRING}.Invalid_regex_message) then
				abort_with_error (ec_SCSRE, <<yyvs2.item (yyvsp2)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp51 := yyvsp51 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp51 >= yyvsc51 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs51")
		end
		yyvsc51 := yyvsc51 + yyInitial_yyvs_size
		yyvs51 := yyspecial_routines51.aliased_resized_area (yyvs51, yyvsc51)
	end
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
when 183 then
--|#line 1501 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1501")
end

			if yyvs51.item (yyvsp51).valid_value (yyvs2.item (yyvsp2)) then
				yyvs51.item (yyvsp51).set_assumed_value (yyvs2.item (yyvsp2))
				yyval51 := yyvs51.item (yyvsp51)
			else
				abort_with_error (ec_VOBAV, <<yyvs2.item (yyvsp2).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
when 184 then
--|#line 1510 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1510")
end

			abort_with_error (ec_SCSAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
when 185 then
--|#line 1516 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1516")
end

			create yyval58.make (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp58 := yyvsp58 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp58 >= yyvsc58 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs58")
		end
		yyvsc58 := yyvsc58 + yyInitial_yyvs_size
		yyvs58 := yyspecial_routines58.aliased_resized_area (yyvs58, yyvsc58)
	end
	yyspecial_routines58.force (yyvs58, yyval58, yyvsp58)
end
when 186 then
--|#line 1520 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1520")
end

			-- note - whitespace is stripped in scanner
			create yyval58.make (yyvs2.item (yyvsp2).substring (1, yyvs2.item (yyvsp2).index_of (';', 1) - 1))
			yyval58.set_assumed_value (yyvs2.item (yyvsp2).substring (yyvs2.item (yyvsp2).index_of (';', 1) + 1, yyvs2.item (yyvsp2).count))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp58 := yyvsp58 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp58 >= yyvsc58 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs58")
		end
		yyvsc58 := yyvsc58 + yyInitial_yyvs_size
		yyvs58 := yyspecial_routines58.aliased_resized_area (yyvs58, yyvsc58)
	end
	yyspecial_routines58.force (yyvs58, yyval58, yyvsp58)
end
when 187 then
--|#line 1526 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1526")
end

			create yyval58.make (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp58 := yyvsp58 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp58 >= yyvsc58 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs58")
		end
		yyvsc58 := yyvsc58 + yyInitial_yyvs_size
		yyvs58 := yyspecial_routines58.aliased_resized_area (yyvs58, yyvsc58)
	end
	yyspecial_routines58.force (yyvs58, yyval58, yyvsp58)
end
when 188 then
--|#line 1533 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1533")
end

			-- e.g. "local::at40"
			if yyvs5.item (yyvsp5).is_single then
				create yyval58.make (yyvs5.item (yyvsp5).codes.first)

			-- e.g. "local::at40, at41; at40"; we have to synthesise an ac-code and convert the inline 
			-- definition to a separate value set
			else
				-- replace by ac-code ref and store value set for addition to terminology
				create yyval58.make (new_fake_ac_code)
				if attached yyvs5.item (yyvsp5).assumed_code as att_ac then
					yyval58.set_assumed_value (att_ac)
				end
				compiler_billboard.value_sets.put (create {VALUE_SET_RELATION}.make (yyval58.constraint, yyvs5.item (yyvsp5).codes), yyval58.constraint)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp58 := yyvsp58 + 1
	yyvsp5 := yyvsp5 -1
	if yyvsp58 >= yyvsc58 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs58")
		end
		yyvsc58 := yyvsc58 + yyInitial_yyvs_size
		yyvs58 := yyspecial_routines58.aliased_resized_area (yyvs58, yyvsc58)
	end
	yyspecial_routines58.force (yyvs58, yyval58, yyvsp58)
end
when 189 then
--|#line 1550 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1550")
end

			-- the following statement generates an at-coded equivalent of the value-set just scanned, 
			-- and also the appropriate term_binding structure for it
			yyvs5.item (yyvsp5).convert_to_local (agent new_fake_at_code)

			-- e.g. "openehr::250"; here we have to synthesise an at-code and binding
			-- the at-code definition is synthesised later when the proper at-code is substituted
			if yyvs5.item (yyvsp5).is_single then
				-- first of all, if this is a specialised archetype, see if this external code has been seen in the parent, 
				-- and if there is an at-code and binding we can use
				if target_descriptor.is_specialised and then attached flat_ancestor as flat_anc and then
					flat_anc.terminology.has_term_binding_for_external_code (yyvs5.item (yyvsp5).terminology_id, yyvs5.item (yyvsp5).first_code) 
				then
					create yyval58.make (flat_anc.terminology.term_binding_key_for_external_code (yyvs5.item (yyvsp5).terminology_id, yyvs5.item (yyvsp5).first_code))
				else
					-- otherwise we use the synthesised code
					check attached yyvs5.item (yyvsp5).last_converted_local as att_tcps then
						create yyval58.make (att_tcps.first_code)
					end

					-- add a binding to be processed by the parse post-processor
					if not compiler_billboard.term_bindings.has (yyvs5.item (yyvsp5).terminology_id.as_lower) then
						compiler_billboard.term_bindings.put (create {HASH_TABLE [URI, STRING]}.make (0), yyvs5.item (yyvsp5).terminology_id.as_lower)
					end
					check attached compiler_billboard.term_bindings.item (yyvs5.item (yyvsp5).terminology_id) as att_bindings_for_terminology and then
						attached yyvs5.item (yyvsp5).last_converted_local_bindings as att_b
					then
						att_bindings_for_terminology.merge (att_b)
						if attached yyvs5.item (yyvsp5).last_converted_binding_map as att_bmap then
							compiler_billboard.binding_code_map.merge (att_bmap)
						end
					end
				end
				
			-- e.g. "openehr::250, 251, 249"; here we have to synthesise at-codes and bindings and value set
			-- the at-code definitions are synthesised later when the proper at-codes are substituted
			else
				create yyval58.make (new_fake_ac_code)

				-- if this is a specialised archetype, see if this external code has been seen in the parent, 
				-- if so, the at-codes and bindings are inherited, we only have to re-construct the value set def
				if target_descriptor.is_specialised and then attached flat_ancestor as flat_anc and then
					flat_anc.terminology.has_term_binding_for_external_code (yyvs5.item (yyvsp5).terminology_id, yyvs5.item (yyvsp5).first_code) 
				then
					create at_codes.make (0)
					across yyvs5.item (yyvsp5).codes as ext_code_csr loop
						if flat_anc.terminology.has_term_binding_for_external_code (yyvs5.item (yyvsp5).terminology_id, ext_code_csr.item) then
							at_codes.extend (flat_anc.terminology.term_binding_key_for_external_code (yyvs5.item (yyvsp5).terminology_id, ext_code_csr.item))
						end
					end
					compiler_billboard.value_sets.put (create {VALUE_SET_RELATION}.make (yyval58.constraint, at_codes), yyval58.constraint)
				else
					if attached yyvs5.item (yyvsp5).last_converted_local as att_tcps then
						if attached att_tcps.assumed_code as att_ac then
							yyval58.set_assumed_value (att_ac)
						end
						compiler_billboard.value_sets.put (create {VALUE_SET_RELATION}.make (yyval58.constraint, att_tcps.codes), yyval58.constraint)
					end

					-- add term bindings
					if not compiler_billboard.term_bindings.has (yyvs5.item (yyvsp5).terminology_id.as_lower) then
						compiler_billboard.term_bindings.put (create {HASH_TABLE [URI, STRING]}.make (0), yyvs5.item (yyvsp5).terminology_id.as_lower)
					end
					check attached compiler_billboard.term_bindings.item (yyvs5.item (yyvsp5).terminology_id.as_lower) as att_bindings_for_terminology and then
						attached yyvs5.item (yyvsp5).last_converted_local_bindings as att_b
					then
						att_bindings_for_terminology.merge (att_b)
					end
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp58 := yyvsp58 + 1
	yyvsp5 := yyvsp5 -1
	if yyvsp58 >= yyvsc58 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs58")
		end
		yyvsc58 := yyvsc58 + yyInitial_yyvs_size
		yyvs58 := yyspecial_routines58.aliased_resized_area (yyvs58, yyvsc58)
	end
	yyspecial_routines58.force (yyvs58, yyval58, yyvsp58)
end
when 190 then
--|#line 1625 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1625")
end

			abort_with_error (ec_STCDC, <<err_str, c_attrs.item.path>>)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp58 := yyvsp58 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp58 >= yyvsc58 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs58")
		end
		yyvsc58 := yyvsc58 + yyInitial_yyvs_size
		yyvs58 := yyspecial_routines58.aliased_resized_area (yyvs58, yyvsc58)
	end
	yyspecial_routines58.force (yyvs58, yyval58, yyvsp58)
end
when 191 then
--|#line 1629 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1629")
end

			abort_with_error (ec_STCAC, <<err_str, c_attrs.item.path>>)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp58 := yyvsp58 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp58 >= yyvsc58 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs58")
		end
		yyvsc58 := yyvsc58 + yyInitial_yyvs_size
		yyvs58 := yyspecial_routines58.aliased_resized_area (yyvs58, yyvsc58)
	end
	yyspecial_routines58.force (yyvs58, yyval58, yyvsp58)
end
when 192 then
--|#line 1633 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1633")
end

			abort_with_error (ec_STCV, <<c_attrs.item.path>>)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp58 := yyvsp58 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp58 >= yyvsc58 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs58")
		end
		yyvsc58 := yyvsc58 + yyInitial_yyvs_size
		yyvs58 := yyspecial_routines58.aliased_resized_area (yyvs58, yyvsc58)
	end
	yyspecial_routines58.force (yyvs58, yyval58, yyvsp58)
end
when 193 then
--|#line 1639 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1639")
end

			create yyval50.make_true
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp50 := yyvsp50 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp50 >= yyvsc50 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs50")
		end
		yyvsc50 := yyvsc50 + yyInitial_yyvs_size
		yyvs50 := yyspecial_routines50.aliased_resized_area (yyvs50, yyvsc50)
	end
	yyspecial_routines50.force (yyvs50, yyval50, yyvsp50)
end
when 194 then
--|#line 1643 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1643")
end

			create yyval50.make_false
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp50 := yyvsp50 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp50 >= yyvsc50 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs50")
		end
		yyvsc50 := yyvsc50 + yyInitial_yyvs_size
		yyvs50 := yyspecial_routines50.aliased_resized_area (yyvs50, yyvsc50)
	end
	yyspecial_routines50.force (yyvs50, yyval50, yyvsp50)
end
when 195 then
--|#line 1647 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1647")
end

			create yyval50.make (yyvs33.item (yyvsp33))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp50 := yyvsp50 + 1
	yyvsp33 := yyvsp33 -1
	if yyvsp50 >= yyvsc50 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs50")
		end
		yyvsc50 := yyvsc50 + yyInitial_yyvs_size
		yyvs50 := yyspecial_routines50.aliased_resized_area (yyvs50, yyvsc50)
	end
	yyspecial_routines50.force (yyvs50, yyval50, yyvsp50)
end
when 196 then
--|#line 1651 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1651")
end

			if yyvs50.item (yyvsp50).valid_value (yyvs24.item (yyvsp24)) then
				yyvs50.item (yyvsp50).set_assumed_value (yyvs24.item (yyvsp24))
			else
				abort_with_error (ec_VOBAV, <<yyvs24.item (yyvsp24).out>>)
			end
			yyval50 := yyvs50.item (yyvsp50)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp24 := yyvsp24 -1
	yyspecial_routines50.force (yyvs50, yyval50, yyvsp50)
end
when 197 then
--|#line 1660 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1660")
end

			abort_with_error (ec_SCBAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines50.force (yyvs50, yyval50, yyvsp50)
end
when 198 then
--|#line 1666 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1666")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 199 then
--|#line 1670 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1670")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 200 then
--|#line 1676 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1676")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 201 then
--|#line 1680 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1680")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 202 then
--|#line 1693 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1693")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 203 then
--|#line 1699 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1699")
end

			create yyval30.make(0)
			yyval30.extend(yyvs2.item (yyvsp2 - 1))
			yyval30.extend(yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp30 := yyvsp30 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp30 >= yyvsc30 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs30")
		end
		yyvsc30 := yyvsc30 + yyInitial_yyvs_size
		yyvs30 := yyspecial_routines30.aliased_resized_area (yyvs30, yyvsc30)
	end
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
when 204 then
--|#line 1705 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1705")
end

			yyvs30.item (yyvsp30).extend(yyvs2.item (yyvsp2))
			yyval30 := yyvs30.item (yyvsp30)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
when 205 then
--|#line 1713 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1713")
end

			yyval30 := yyvs30.item (yyvsp30)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
when 206 then
--|#line 1717 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1717")
end

			create yyval30.make (0)
			yyval30.extend (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp30 := yyvsp30 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp30 >= yyvsc30 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs30")
		end
		yyvsc30 := yyvsc30 + yyInitial_yyvs_size
		yyvs30 := yyspecial_routines30.aliased_resized_area (yyvs30, yyvsc30)
	end
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
when 207 then
--|#line 1724 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1724")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 208 then
--|#line 1728 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1728")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 209 then
--|#line 1732 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1732")
end

			yyval3 := - yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 210 then
--|#line 1738 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1738")
end

			create yyval31.make(0)
			yyval31.extend(yyvs3.item (yyvsp3 - 1))
			yyval31.extend(yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp31 := yyvsp31 + 1
	yyvsp3 := yyvsp3 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp31 >= yyvsc31 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs31")
		end
		yyvsc31 := yyvsc31 + yyInitial_yyvs_size
		yyvs31 := yyspecial_routines31.aliased_resized_area (yyvs31, yyvsc31)
	end
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 211 then
--|#line 1744 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1744")
end

			yyvs31.item (yyvsp31).extend(yyvs3.item (yyvsp3))
			yyval31 := yyvs31.item (yyvsp31)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 212 then
--|#line 1749 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1749")
end

			create yyval31.make(0)
			yyval31.extend(yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp31 := yyvsp31 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp31 >= yyvsc31 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs31")
		end
		yyvsc31 := yyvsc31 + yyInitial_yyvs_size
		yyvs31 := yyspecial_routines31.aliased_resized_area (yyvs31, yyvsc31)
	end
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 213 then
--|#line 1756 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1756")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create {PROPER_INTERVAL [INTEGER]} yyval38.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -2
	if yyvsp38 >= yyvsc38 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs38")
		end
		yyvsc38 := yyvsc38 + yyInitial_yyvs_size
		yyvs38 := yyspecial_routines38.aliased_resized_area (yyvs38, yyvsc38)
	end
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 214 then
--|#line 1764 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1764")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create {PROPER_INTERVAL [INTEGER]} yyval38.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp3 := yyvsp3 -2
	if yyvsp38 >= yyvsc38 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs38")
		end
		yyvsc38 := yyvsc38 + yyInitial_yyvs_size
		yyvs38 := yyspecial_routines38.aliased_resized_area (yyvs38, yyvsc38)
	end
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 215 then
--|#line 1772 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1772")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create {PROPER_INTERVAL [INTEGER]} yyval38.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp3 := yyvsp3 -2
	if yyvsp38 >= yyvsc38 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs38")
		end
		yyvsc38 := yyvsc38 + yyInitial_yyvs_size
		yyvs38 := yyspecial_routines38.aliased_resized_area (yyvs38, yyvsc38)
	end
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 216 then
--|#line 1780 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1780")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create {PROPER_INTERVAL [INTEGER]} yyval38.make_bounded (yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp3 := yyvsp3 -2
	if yyvsp38 >= yyvsc38 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs38")
		end
		yyvsc38 := yyvsc38 + yyInitial_yyvs_size
		yyvs38 := yyspecial_routines38.aliased_resized_area (yyvs38, yyvsc38)
	end
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 217 then
--|#line 1788 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1788")
end

			create {PROPER_INTERVAL [INTEGER]} yyval38.make_lower_unbounded (yyvs3.item (yyvsp3), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp38 >= yyvsc38 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs38")
		end
		yyvsc38 := yyvsc38 + yyInitial_yyvs_size
		yyvs38 := yyspecial_routines38.aliased_resized_area (yyvs38, yyvsc38)
	end
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 218 then
--|#line 1792 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1792")
end

			create {PROPER_INTERVAL [INTEGER]} yyval38.make_lower_unbounded (yyvs3.item (yyvsp3), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp38 >= yyvsc38 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs38")
		end
		yyvsc38 := yyvsc38 + yyInitial_yyvs_size
		yyvs38 := yyspecial_routines38.aliased_resized_area (yyvs38, yyvsc38)
	end
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 219 then
--|#line 1796 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1796")
end

			create {PROPER_INTERVAL [INTEGER]} yyval38.make_upper_unbounded (yyvs3.item (yyvsp3), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp38 >= yyvsc38 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs38")
		end
		yyvsc38 := yyvsc38 + yyInitial_yyvs_size
		yyvs38 := yyspecial_routines38.aliased_resized_area (yyvs38, yyvsc38)
	end
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 220 then
--|#line 1800 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1800")
end

			create {PROPER_INTERVAL [INTEGER]} yyval38.make_upper_unbounded (yyvs3.item (yyvsp3), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp38 >= yyvsc38 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs38")
		end
		yyvsc38 := yyvsc38 + yyInitial_yyvs_size
		yyvs38 := yyspecial_routines38.aliased_resized_area (yyvs38, yyvsc38)
	end
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 221 then
--|#line 1804 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1804")
end

			create {POINT_INTERVAL [INTEGER]} yyval38.make (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp3 := yyvsp3 -1
	if yyvsp38 >= yyvsc38 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs38")
		end
		yyvsc38 := yyvsc38 + yyInitial_yyvs_size
		yyvs38 := yyspecial_routines38.aliased_resized_area (yyvs38, yyvsc38)
	end
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 222 then
--|#line 1810 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1810")
end

			create yyval44.make(0)
			yyval44.extend(yyvs38.item (yyvsp38 - 1))
			yyval44.extend(yyvs38.item (yyvsp38))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp44 := yyvsp44 + 1
	yyvsp38 := yyvsp38 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp44 >= yyvsc44 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs44")
		end
		yyvsc44 := yyvsc44 + yyInitial_yyvs_size
		yyvs44 := yyspecial_routines44.aliased_resized_area (yyvs44, yyvsc44)
	end
	yyspecial_routines44.force (yyvs44, yyval44, yyvsp44)
end
when 223 then
--|#line 1816 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1816")
end

			yyvs44.item (yyvsp44).extend(yyvs38.item (yyvsp38))
			yyval44 := yyvs44.item (yyvsp44)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp38 := yyvsp38 -1
	yyspecial_routines44.force (yyvs44, yyval44, yyvsp44)
end
when 224 then
--|#line 1821 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1821")
end

			create yyval44.make(0)
			yyval44.extend(yyvs38.item (yyvsp38))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp44 := yyvsp44 + 1
	yyvsp38 := yyvsp38 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp44 >= yyvsc44 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs44")
		end
		yyvsc44 := yyvsc44 + yyInitial_yyvs_size
		yyvs44 := yyspecial_routines44.aliased_resized_area (yyvs44, yyvsc44)
	end
	yyspecial_routines44.force (yyvs44, yyval44, yyvsp44)
end
when 225 then
--|#line 1828 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1828")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 226 then
--|#line 1832 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1832")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 227 then
--|#line 1836 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1836")
end

			yyval4 := - yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 228 then
--|#line 1842 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1842")
end

			create yyval32.make(0)
			yyval32.extend(yyvs4.item (yyvsp4 - 1))
			yyval32.extend(yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp32 := yyvsp32 + 1
	yyvsp4 := yyvsp4 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp32 >= yyvsc32 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs32")
		end
		yyvsc32 := yyvsc32 + yyInitial_yyvs_size
		yyvs32 := yyspecial_routines32.aliased_resized_area (yyvs32, yyvsc32)
	end
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 229 then
--|#line 1848 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1848")
end

			yyvs32.item (yyvsp32).extend(yyvs4.item (yyvsp4))
			yyval32 := yyvs32.item (yyvsp32)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 230 then
--|#line 1853 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1853")
end

			create yyval32.make(0)
			yyval32.extend(yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp32 := yyvsp32 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp32 >= yyvsc32 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs32")
		end
		yyvsc32 := yyvsc32 + yyInitial_yyvs_size
		yyvs32 := yyspecial_routines32.aliased_resized_area (yyvs32, yyvsc32)
	end
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 231 then
--|#line 1860 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1860")
end

			if yyvs4.item (yyvsp4 - 1) <= yyvs4.item (yyvsp4) then
				create {PROPER_INTERVAL [REAL]} yyval39.make_bounded(yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs4.item (yyvsp4 - 1).out, yyvs4.item (yyvsp4).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp4 := yyvsp4 -2
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 232 then
--|#line 1868 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1868")
end

			if yyvs4.item (yyvsp4 - 1) <= yyvs4.item (yyvsp4) then
				create {PROPER_INTERVAL [REAL]} yyval39.make_bounded(yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs4.item (yyvsp4 - 1).out, yyvs4.item (yyvsp4).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp4 := yyvsp4 -2
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 233 then
--|#line 1876 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1876")
end

			if yyvs4.item (yyvsp4 - 1) <= yyvs4.item (yyvsp4) then
				create {PROPER_INTERVAL [REAL]} yyval39.make_bounded(yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs4.item (yyvsp4 - 1).out, yyvs4.item (yyvsp4).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp4 := yyvsp4 -2
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 234 then
--|#line 1884 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1884")
end

			if yyvs4.item (yyvsp4 - 1) <= yyvs4.item (yyvsp4) then
				create {PROPER_INTERVAL [REAL]} yyval39.make_bounded(yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs4.item (yyvsp4 - 1).out, yyvs4.item (yyvsp4).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp4 := yyvsp4 -2
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 235 then
--|#line 1892 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1892")
end

			create {PROPER_INTERVAL [REAL]} yyval39.make_lower_unbounded(yyvs4.item (yyvsp4), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp4 := yyvsp4 -1
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 236 then
--|#line 1896 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1896")
end

			create {PROPER_INTERVAL [REAL]} yyval39.make_lower_unbounded(yyvs4.item (yyvsp4), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp4 := yyvsp4 -1
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 237 then
--|#line 1900 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1900")
end

			create {PROPER_INTERVAL [REAL]} yyval39.make_upper_unbounded(yyvs4.item (yyvsp4), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp4 := yyvsp4 -1
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 238 then
--|#line 1904 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1904")
end

			create {PROPER_INTERVAL [REAL]} yyval39.make_upper_unbounded(yyvs4.item (yyvsp4), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp4 := yyvsp4 -1
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 239 then
--|#line 1908 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1908")
end

			create {POINT_INTERVAL [REAL]} yyval39.make(yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp4 := yyvsp4 -1
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 240 then
--|#line 1914 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1914")
end

			create yyval45.make(0)
			yyval45.extend(yyvs39.item (yyvsp39 - 1))
			yyval45.extend(yyvs39.item (yyvsp39))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp45 := yyvsp45 + 1
	yyvsp39 := yyvsp39 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp45 >= yyvsc45 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs45")
		end
		yyvsc45 := yyvsc45 + yyInitial_yyvs_size
		yyvs45 := yyspecial_routines45.aliased_resized_area (yyvs45, yyvsc45)
	end
	yyspecial_routines45.force (yyvs45, yyval45, yyvsp45)
end
when 241 then
--|#line 1920 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1920")
end

			yyvs45.item (yyvsp45).extend(yyvs39.item (yyvsp39))
			yyval45 := yyvs45.item (yyvsp45)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp39 := yyvsp39 -1
	yyspecial_routines45.force (yyvs45, yyval45, yyvsp45)
end
when 242 then
--|#line 1925 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1925")
end

			create yyval45.make(0)
			yyval45.extend(yyvs39.item (yyvsp39))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp45 := yyvsp45 + 1
	yyvsp39 := yyvsp39 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp45 >= yyvsc45 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs45")
		end
		yyvsc45 := yyvsc45 + yyInitial_yyvs_size
		yyvs45 := yyspecial_routines45.aliased_resized_area (yyvs45, yyvsc45)
	end
	yyspecial_routines45.force (yyvs45, yyval45, yyvsp45)
end
when 243 then
--|#line 1932 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1932")
end

			yyval24 := True
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp24 := yyvsp24 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp24 >= yyvsc24 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs24")
		end
		yyvsc24 := yyvsc24 + yyInitial_yyvs_size
		yyvs24 := yyspecial_routines24.aliased_resized_area (yyvs24, yyvsc24)
	end
	yyspecial_routines24.force (yyvs24, yyval24, yyvsp24)
end
when 244 then
--|#line 1936 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1936")
end

			yyval24 := False
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp24 := yyvsp24 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp24 >= yyvsc24 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs24")
		end
		yyvsc24 := yyvsc24 + yyInitial_yyvs_size
		yyvs24 := yyspecial_routines24.aliased_resized_area (yyvs24, yyvsc24)
	end
	yyspecial_routines24.force (yyvs24, yyval24, yyvsp24)
end
when 245 then
--|#line 1942 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1942")
end

			create yyval33.make(0)
			yyval33.extend(yyvs24.item (yyvsp24 - 1))
			yyval33.extend(yyvs24.item (yyvsp24))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp24 := yyvsp24 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 246 then
--|#line 1948 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1948")
end

			yyvs33.item (yyvsp33).extend(yyvs24.item (yyvsp24))
			yyval33 := yyvs33.item (yyvsp33)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp24 := yyvsp24 -1
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 247 then
--|#line 1953 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1953")
end

			create yyval33.make(0)
			yyval33.extend(yyvs24.item (yyvsp24))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp24 := yyvsp24 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 248 then
--|#line 1960 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1960")
end

			if valid_iso8601_date(yyvs2.item (yyvsp2)) then
				create yyval25.make_from_string(yyvs2.item (yyvsp2))
			else
				abort_with_error (ec_VIDV, <<yyvs2.item (yyvsp2)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp25 := yyvsp25 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp25 >= yyvsc25 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs25")
		end
		yyvsc25 := yyvsc25 + yyInitial_yyvs_size
		yyvs25 := yyspecial_routines25.aliased_resized_area (yyvs25, yyvsc25)
	end
	yyspecial_routines25.force (yyvs25, yyval25, yyvsp25)
end
when 249 then
--|#line 1970 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1970")
end

			create yyval34.make(0)
			yyval34.extend (yyvs25.item (yyvsp25 - 1))
			yyval34.extend (yyvs25.item (yyvsp25))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp34 := yyvsp34 + 1
	yyvsp25 := yyvsp25 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp34 >= yyvsc34 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs34")
		end
		yyvsc34 := yyvsc34 + yyInitial_yyvs_size
		yyvs34 := yyspecial_routines34.aliased_resized_area (yyvs34, yyvsc34)
	end
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 250 then
--|#line 1976 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1976")
end

			yyvs34.item (yyvsp34).extend (yyvs25.item (yyvsp25))
			yyval34 := yyvs34.item (yyvsp34)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp25 := yyvsp25 -1
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 251 then
--|#line 1981 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1981")
end

			create yyval34.make(0)
			yyval34.extend (yyvs25.item (yyvsp25))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp34 := yyvsp34 + 1
	yyvsp25 := yyvsp25 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp34 >= yyvsc34 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs34")
		end
		yyvsc34 := yyvsc34 + yyInitial_yyvs_size
		yyvs34 := yyspecial_routines34.aliased_resized_area (yyvs34, yyvsc34)
	end
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 252 then
--|#line 1988 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1988")
end

			if yyvs25.item (yyvsp25 - 1) <= yyvs25.item (yyvsp25) then
				create {PROPER_INTERVAL [ISO8601_DATE]} yyval41.make_bounded(yyvs25.item (yyvsp25 - 1), yyvs25.item (yyvsp25), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs25.item (yyvsp25 - 1).out, yyvs25.item (yyvsp25).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp25 := yyvsp25 -2
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 253 then
--|#line 1996 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1996")
end

			if yyvs25.item (yyvsp25 - 1) <= yyvs25.item (yyvsp25) then
				create {PROPER_INTERVAL [ISO8601_DATE]} yyval41.make_bounded(yyvs25.item (yyvsp25 - 1), yyvs25.item (yyvsp25), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs25.item (yyvsp25 - 1).out, yyvs25.item (yyvsp25).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp25 := yyvsp25 -2
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 254 then
--|#line 2004 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2004")
end

			if yyvs25.item (yyvsp25 - 1) <= yyvs25.item (yyvsp25) then
				create {PROPER_INTERVAL [ISO8601_DATE]} yyval41.make_bounded(yyvs25.item (yyvsp25 - 1), yyvs25.item (yyvsp25), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs25.item (yyvsp25 - 1).out, yyvs25.item (yyvsp25).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp25 := yyvsp25 -2
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 255 then
--|#line 2012 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2012")
end

			if yyvs25.item (yyvsp25 - 1) <= yyvs25.item (yyvsp25) then
				create {PROPER_INTERVAL [ISO8601_DATE]} yyval41.make_bounded(yyvs25.item (yyvsp25 - 1), yyvs25.item (yyvsp25), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs25.item (yyvsp25 - 1).out, yyvs25.item (yyvsp25).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp25 := yyvsp25 -2
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 256 then
--|#line 2020 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2020")
end

			create {PROPER_INTERVAL [ISO8601_DATE]} yyval41.make_lower_unbounded(yyvs25.item (yyvsp25), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp25 := yyvsp25 -1
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 257 then
--|#line 2024 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2024")
end

			create {PROPER_INTERVAL [ISO8601_DATE]} yyval41.make_lower_unbounded(yyvs25.item (yyvsp25), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp25 := yyvsp25 -1
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 258 then
--|#line 2028 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2028")
end

			create {PROPER_INTERVAL [ISO8601_DATE]} yyval41.make_upper_unbounded(yyvs25.item (yyvsp25), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp25 := yyvsp25 -1
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 259 then
--|#line 2032 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2032")
end

			create {PROPER_INTERVAL [ISO8601_DATE]} yyval41.make_upper_unbounded(yyvs25.item (yyvsp25), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp25 := yyvsp25 -1
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 260 then
--|#line 2036 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2036")
end

			create {POINT_INTERVAL [ISO8601_DATE]} yyval41.make (yyvs25.item (yyvsp25))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp25 := yyvsp25 -1
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 261 then
--|#line 2042 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2042")
end

			create yyval47.make(0)
			yyval47.extend(yyvs41.item (yyvsp41 - 1))
			yyval47.extend(yyvs41.item (yyvsp41))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp47 := yyvsp47 + 1
	yyvsp41 := yyvsp41 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp47 >= yyvsc47 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs47")
		end
		yyvsc47 := yyvsc47 + yyInitial_yyvs_size
		yyvs47 := yyspecial_routines47.aliased_resized_area (yyvs47, yyvsc47)
	end
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
when 262 then
--|#line 2048 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2048")
end

			yyvs47.item (yyvsp47).extend(yyvs41.item (yyvsp41))
			yyval47 := yyvs47.item (yyvsp47)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp41 := yyvsp41 -1
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
when 263 then
--|#line 2053 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2053")
end

			create yyval47.make(0)
			yyval47.extend(yyvs41.item (yyvsp41))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp47 := yyvsp47 + 1
	yyvsp41 := yyvsp41 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp47 >= yyvsc47 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs47")
		end
		yyvsc47 := yyvsc47 + yyInitial_yyvs_size
		yyvs47 := yyspecial_routines47.aliased_resized_area (yyvs47, yyvsc47)
	end
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
when 264 then
--|#line 2060 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2060")
end

			if valid_iso8601_time(yyvs2.item (yyvsp2)) then
				create yyval27.make_from_string(yyvs2.item (yyvsp2))
			else
				abort_with_error (ec_VITV, <<yyvs2.item (yyvsp2)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp27 := yyvsp27 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp27 >= yyvsc27 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs27")
		end
		yyvsc27 := yyvsc27 + yyInitial_yyvs_size
		yyvs27 := yyspecial_routines27.aliased_resized_area (yyvs27, yyvsc27)
	end
	yyspecial_routines27.force (yyvs27, yyval27, yyvsp27)
end
when 265 then
--|#line 2070 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2070")
end

			create yyval35.make(0)
			yyval35.extend(yyvs27.item (yyvsp27 - 1))
			yyval35.extend(yyvs27.item (yyvsp27))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp35 := yyvsp35 + 1
	yyvsp27 := yyvsp27 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp35 >= yyvsc35 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs35")
		end
		yyvsc35 := yyvsc35 + yyInitial_yyvs_size
		yyvs35 := yyspecial_routines35.aliased_resized_area (yyvs35, yyvsc35)
	end
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 266 then
--|#line 2076 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2076")
end

			yyvs35.item (yyvsp35).extend(yyvs27.item (yyvsp27))
			yyval35 := yyvs35.item (yyvsp35)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp27 := yyvsp27 -1
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 267 then
--|#line 2081 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2081")
end

			create yyval35.make(0)
			yyval35.extend(yyvs27.item (yyvsp27))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp35 := yyvsp35 + 1
	yyvsp27 := yyvsp27 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp35 >= yyvsc35 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs35")
		end
		yyvsc35 := yyvsc35 + yyInitial_yyvs_size
		yyvs35 := yyspecial_routines35.aliased_resized_area (yyvs35, yyvsc35)
	end
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 268 then
--|#line 2088 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2088")
end

			if yyvs27.item (yyvsp27 - 1) <= yyvs27.item (yyvsp27) then
				create {PROPER_INTERVAL [ISO8601_TIME]} yyval40.make_bounded(yyvs27.item (yyvsp27 - 1), yyvs27.item (yyvsp27), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs27.item (yyvsp27 - 1).out, yyvs27.item (yyvsp27).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp27 := yyvsp27 -2
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 269 then
--|#line 2096 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2096")
end

			if yyvs27.item (yyvsp27 - 1) <= yyvs27.item (yyvsp27) then
				create {PROPER_INTERVAL [ISO8601_TIME]} yyval40.make_bounded(yyvs27.item (yyvsp27 - 1), yyvs27.item (yyvsp27), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs27.item (yyvsp27 - 1).out, yyvs27.item (yyvsp27).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp27 := yyvsp27 -2
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 270 then
--|#line 2104 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2104")
end

			if yyvs27.item (yyvsp27 - 1) <= yyvs27.item (yyvsp27) then
				create {PROPER_INTERVAL [ISO8601_TIME]} yyval40.make_bounded(yyvs27.item (yyvsp27 - 1), yyvs27.item (yyvsp27), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs27.item (yyvsp27 - 1).out, yyvs27.item (yyvsp27).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp27 := yyvsp27 -2
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 271 then
--|#line 2112 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2112")
end

			if yyvs27.item (yyvsp27 - 1) <= yyvs27.item (yyvsp27) then
				create {PROPER_INTERVAL [ISO8601_TIME]} yyval40.make_bounded(yyvs27.item (yyvsp27 - 1), yyvs27.item (yyvsp27), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs27.item (yyvsp27 - 1).out, yyvs27.item (yyvsp27).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp27 := yyvsp27 -2
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 272 then
--|#line 2120 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2120")
end

			create {PROPER_INTERVAL [ISO8601_TIME]} yyval40.make_lower_unbounded(yyvs27.item (yyvsp27), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp27 := yyvsp27 -1
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 273 then
--|#line 2124 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2124")
end

			create {PROPER_INTERVAL [ISO8601_TIME]} yyval40.make_lower_unbounded(yyvs27.item (yyvsp27), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp27 := yyvsp27 -1
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 274 then
--|#line 2128 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2128")
end

			create {PROPER_INTERVAL [ISO8601_TIME]} yyval40.make_upper_unbounded(yyvs27.item (yyvsp27), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp27 := yyvsp27 -1
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 275 then
--|#line 2132 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2132")
end

			create {PROPER_INTERVAL [ISO8601_TIME]} yyval40.make_upper_unbounded(yyvs27.item (yyvsp27), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp27 := yyvsp27 -1
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 276 then
--|#line 2136 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2136")
end

			create {POINT_INTERVAL [ISO8601_TIME]} yyval40.make (yyvs27.item (yyvsp27))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp27 := yyvsp27 -1
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 277 then
--|#line 2142 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2142")
end

			create yyval46.make(0)
			yyval46.extend(yyvs40.item (yyvsp40 - 1))
			yyval46.extend(yyvs40.item (yyvsp40))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp46 := yyvsp46 + 1
	yyvsp40 := yyvsp40 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp46 >= yyvsc46 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs46")
		end
		yyvsc46 := yyvsc46 + yyInitial_yyvs_size
		yyvs46 := yyspecial_routines46.aliased_resized_area (yyvs46, yyvsc46)
	end
	yyspecial_routines46.force (yyvs46, yyval46, yyvsp46)
end
when 278 then
--|#line 2148 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2148")
end

			yyvs46.item (yyvsp46).extend(yyvs40.item (yyvsp40))
			yyval46 := yyvs46.item (yyvsp46)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp40 := yyvsp40 -1
	yyspecial_routines46.force (yyvs46, yyval46, yyvsp46)
end
when 279 then
--|#line 2153 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2153")
end

			create yyval46.make(0)
			yyval46.extend(yyvs40.item (yyvsp40))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp46 := yyvsp46 + 1
	yyvsp40 := yyvsp40 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp46 >= yyvsc46 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs46")
		end
		yyvsc46 := yyvsc46 + yyInitial_yyvs_size
		yyvs46 := yyspecial_routines46.aliased_resized_area (yyvs46, yyvsc46)
	end
	yyspecial_routines46.force (yyvs46, yyval46, yyvsp46)
end
when 280 then
--|#line 2160 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2160")
end

			if valid_iso8601_date_time(yyvs2.item (yyvsp2)) then
				create yyval26.make_from_string(yyvs2.item (yyvsp2))
			else
				abort_with_error (ec_VIDTV, <<yyvs2.item (yyvsp2)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp26 := yyvsp26 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp26 >= yyvsc26 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs26")
		end
		yyvsc26 := yyvsc26 + yyInitial_yyvs_size
		yyvs26 := yyspecial_routines26.aliased_resized_area (yyvs26, yyvsc26)
	end
	yyspecial_routines26.force (yyvs26, yyval26, yyvsp26)
end
when 281 then
--|#line 2170 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2170")
end

			create yyval36.make(0)
			yyval36.extend(yyvs26.item (yyvsp26 - 1))
			yyval36.extend(yyvs26.item (yyvsp26))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp36 := yyvsp36 + 1
	yyvsp26 := yyvsp26 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp36 >= yyvsc36 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs36")
		end
		yyvsc36 := yyvsc36 + yyInitial_yyvs_size
		yyvs36 := yyspecial_routines36.aliased_resized_area (yyvs36, yyvsc36)
	end
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
when 282 then
--|#line 2176 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2176")
end

			yyvs36.item (yyvsp36).extend(yyvs26.item (yyvsp26))
			yyval36 := yyvs36.item (yyvsp36)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp26 := yyvsp26 -1
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
when 283 then
--|#line 2181 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2181")
end

			create yyval36.make(0)
			yyval36.extend(yyvs26.item (yyvsp26))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp36 := yyvsp36 + 1
	yyvsp26 := yyvsp26 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp36 >= yyvsc36 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs36")
		end
		yyvsc36 := yyvsc36 + yyInitial_yyvs_size
		yyvs36 := yyspecial_routines36.aliased_resized_area (yyvs36, yyvsc36)
	end
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
when 284 then
--|#line 2188 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2188")
end

			if yyvs26.item (yyvsp26 - 1) <= yyvs26.item (yyvsp26) then
				create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval42.make_bounded(yyvs26.item (yyvsp26 - 1), yyvs26.item (yyvsp26), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs26.item (yyvsp26 - 1).out, yyvs26.item (yyvsp26).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp26 := yyvsp26 -2
	if yyvsp42 >= yyvsc42 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs42")
		end
		yyvsc42 := yyvsc42 + yyInitial_yyvs_size
		yyvs42 := yyspecial_routines42.aliased_resized_area (yyvs42, yyvsc42)
	end
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
when 285 then
--|#line 2196 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2196")
end

			if yyvs26.item (yyvsp26 - 1) <= yyvs26.item (yyvsp26) then
				create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval42.make_bounded(yyvs26.item (yyvsp26 - 1), yyvs26.item (yyvsp26), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs26.item (yyvsp26 - 1).out, yyvs26.item (yyvsp26).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp26 := yyvsp26 -2
	if yyvsp42 >= yyvsc42 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs42")
		end
		yyvsc42 := yyvsc42 + yyInitial_yyvs_size
		yyvs42 := yyspecial_routines42.aliased_resized_area (yyvs42, yyvsc42)
	end
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
when 286 then
--|#line 2204 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2204")
end

			if yyvs26.item (yyvsp26 - 1) <= yyvs26.item (yyvsp26) then
				create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval42.make_bounded(yyvs26.item (yyvsp26 - 1), yyvs26.item (yyvsp26), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs26.item (yyvsp26 - 1).out, yyvs26.item (yyvsp26).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp26 := yyvsp26 -2
	if yyvsp42 >= yyvsc42 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs42")
		end
		yyvsc42 := yyvsc42 + yyInitial_yyvs_size
		yyvs42 := yyspecial_routines42.aliased_resized_area (yyvs42, yyvsc42)
	end
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
when 287 then
--|#line 2212 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2212")
end

			if yyvs26.item (yyvsp26 - 1) <= yyvs26.item (yyvsp26) then
				create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval42.make_bounded(yyvs26.item (yyvsp26 - 1), yyvs26.item (yyvsp26), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs26.item (yyvsp26 - 1).out, yyvs26.item (yyvsp26).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp26 := yyvsp26 -2
	if yyvsp42 >= yyvsc42 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs42")
		end
		yyvsc42 := yyvsc42 + yyInitial_yyvs_size
		yyvs42 := yyspecial_routines42.aliased_resized_area (yyvs42, yyvsc42)
	end
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
when 288 then
--|#line 2220 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2220")
end

			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval42.make_lower_unbounded(yyvs26.item (yyvsp26), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp26 := yyvsp26 -1
	if yyvsp42 >= yyvsc42 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs42")
		end
		yyvsc42 := yyvsc42 + yyInitial_yyvs_size
		yyvs42 := yyspecial_routines42.aliased_resized_area (yyvs42, yyvsc42)
	end
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
when 289 then
--|#line 2224 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2224")
end

			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval42.make_lower_unbounded(yyvs26.item (yyvsp26), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp26 := yyvsp26 -1
	if yyvsp42 >= yyvsc42 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs42")
		end
		yyvsc42 := yyvsc42 + yyInitial_yyvs_size
		yyvs42 := yyspecial_routines42.aliased_resized_area (yyvs42, yyvsc42)
	end
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
when 290 then
--|#line 2228 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2228")
end

			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval42.make_upper_unbounded(yyvs26.item (yyvsp26), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp26 := yyvsp26 -1
	if yyvsp42 >= yyvsc42 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs42")
		end
		yyvsc42 := yyvsc42 + yyInitial_yyvs_size
		yyvs42 := yyspecial_routines42.aliased_resized_area (yyvs42, yyvsc42)
	end
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
when 291 then
--|#line 2232 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2232")
end

			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval42.make_upper_unbounded(yyvs26.item (yyvsp26), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp26 := yyvsp26 -1
	if yyvsp42 >= yyvsc42 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs42")
		end
		yyvsc42 := yyvsc42 + yyInitial_yyvs_size
		yyvs42 := yyspecial_routines42.aliased_resized_area (yyvs42, yyvsc42)
	end
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
when 292 then
--|#line 2236 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2236")
end

			create {POINT_INTERVAL [ISO8601_DATE_TIME]} yyval42.make (yyvs26.item (yyvsp26))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp26 := yyvsp26 -1
	if yyvsp42 >= yyvsc42 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs42")
		end
		yyvsc42 := yyvsc42 + yyInitial_yyvs_size
		yyvs42 := yyspecial_routines42.aliased_resized_area (yyvs42, yyvsc42)
	end
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
when 293 then
--|#line 2242 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2242")
end

			create yyval48.make(0)
			yyval48.extend(yyvs42.item (yyvsp42 - 1))
			yyval48.extend(yyvs42.item (yyvsp42))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp48 := yyvsp48 + 1
	yyvsp42 := yyvsp42 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp48 >= yyvsc48 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs48")
		end
		yyvsc48 := yyvsc48 + yyInitial_yyvs_size
		yyvs48 := yyspecial_routines48.aliased_resized_area (yyvs48, yyvsc48)
	end
	yyspecial_routines48.force (yyvs48, yyval48, yyvsp48)
end
when 294 then
--|#line 2248 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2248")
end

			yyvs48.item (yyvsp48).extend(yyvs42.item (yyvsp42))
			yyval48 := yyvs48.item (yyvsp48)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp42 := yyvsp42 -1
	yyspecial_routines48.force (yyvs48, yyval48, yyvsp48)
end
when 295 then
--|#line 2253 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2253")
end

			create yyval48.make(0)
			yyval48.extend(yyvs42.item (yyvsp42))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp48 := yyvsp48 + 1
	yyvsp42 := yyvsp42 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp48 >= yyvsc48 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs48")
		end
		yyvsc48 := yyvsc48 + yyInitial_yyvs_size
		yyvs48 := yyspecial_routines48.aliased_resized_area (yyvs48, yyvsc48)
	end
	yyspecial_routines48.force (yyvs48, yyval48, yyvsp48)
end
when 296 then
--|#line 2260 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2260")
end

			if valid_iso8601_duration(yyvs2.item (yyvsp2)) then
				create yyval28.make_from_string(yyvs2.item (yyvsp2))
			else
				abort_with_error (ec_VIDUV, <<yyvs2.item (yyvsp2)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp28 := yyvsp28 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp28 >= yyvsc28 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs28")
		end
		yyvsc28 := yyvsc28 + yyInitial_yyvs_size
		yyvs28 := yyspecial_routines28.aliased_resized_area (yyvs28, yyvsc28)
	end
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
when 297 then
--|#line 2270 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2270")
end

			create yyval37.make(0)
			yyval37.extend(yyvs28.item (yyvsp28 - 1))
			yyval37.extend(yyvs28.item (yyvsp28))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp37 := yyvsp37 + 1
	yyvsp28 := yyvsp28 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp37 >= yyvsc37 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs37")
		end
		yyvsc37 := yyvsc37 + yyInitial_yyvs_size
		yyvs37 := yyspecial_routines37.aliased_resized_area (yyvs37, yyvsc37)
	end
	yyspecial_routines37.force (yyvs37, yyval37, yyvsp37)
end
when 298 then
--|#line 2276 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2276")
end

			yyvs37.item (yyvsp37).extend(yyvs28.item (yyvsp28))
			yyval37 := yyvs37.item (yyvsp37)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp28 := yyvsp28 -1
	yyspecial_routines37.force (yyvs37, yyval37, yyvsp37)
end
when 299 then
--|#line 2281 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2281")
end

			create yyval37.make(0)
			yyval37.extend(yyvs28.item (yyvsp28))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp37 := yyvsp37 + 1
	yyvsp28 := yyvsp28 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp37 >= yyvsc37 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs37")
		end
		yyvsc37 := yyvsc37 + yyInitial_yyvs_size
		yyvs37 := yyspecial_routines37.aliased_resized_area (yyvs37, yyvsc37)
	end
	yyspecial_routines37.force (yyvs37, yyval37, yyvsp37)
end
when 300 then
--|#line 2288 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2288")
end

			if yyvs28.item (yyvsp28 - 1) <= yyvs28.item (yyvsp28) then
				create {PROPER_INTERVAL [ISO8601_DURATION]} yyval43.make_bounded(yyvs28.item (yyvsp28 - 1), yyvs28.item (yyvsp28), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs28.item (yyvsp28 - 1).out, yyvs28.item (yyvsp28).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp43 := yyvsp43 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp28 := yyvsp28 -2
	if yyvsp43 >= yyvsc43 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs43")
		end
		yyvsc43 := yyvsc43 + yyInitial_yyvs_size
		yyvs43 := yyspecial_routines43.aliased_resized_area (yyvs43, yyvsc43)
	end
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
when 301 then
--|#line 2296 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2296")
end

			if yyvs28.item (yyvsp28 - 1) <= yyvs28.item (yyvsp28) then
				create {PROPER_INTERVAL [ISO8601_DURATION]} yyval43.make_bounded(yyvs28.item (yyvsp28 - 1), yyvs28.item (yyvsp28), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs28.item (yyvsp28 - 1).out, yyvs28.item (yyvsp28).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp43 := yyvsp43 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp28 := yyvsp28 -2
	if yyvsp43 >= yyvsc43 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs43")
		end
		yyvsc43 := yyvsc43 + yyInitial_yyvs_size
		yyvs43 := yyspecial_routines43.aliased_resized_area (yyvs43, yyvsc43)
	end
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
when 302 then
--|#line 2304 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2304")
end

			if yyvs28.item (yyvsp28 - 1) <= yyvs28.item (yyvsp28) then
				create {PROPER_INTERVAL [ISO8601_DURATION]} yyval43.make_bounded(yyvs28.item (yyvsp28 - 1), yyvs28.item (yyvsp28), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs28.item (yyvsp28 - 1).out, yyvs28.item (yyvsp28).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp43 := yyvsp43 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp28 := yyvsp28 -2
	if yyvsp43 >= yyvsc43 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs43")
		end
		yyvsc43 := yyvsc43 + yyInitial_yyvs_size
		yyvs43 := yyspecial_routines43.aliased_resized_area (yyvs43, yyvsc43)
	end
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
when 303 then
--|#line 2312 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2312")
end

			if yyvs28.item (yyvsp28 - 1) <= yyvs28.item (yyvsp28) then
				create {PROPER_INTERVAL [ISO8601_DURATION]} yyval43.make_bounded(yyvs28.item (yyvsp28 - 1), yyvs28.item (yyvsp28), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs28.item (yyvsp28 - 1).out, yyvs28.item (yyvsp28).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp43 := yyvsp43 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp28 := yyvsp28 -2
	if yyvsp43 >= yyvsc43 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs43")
		end
		yyvsc43 := yyvsc43 + yyInitial_yyvs_size
		yyvs43 := yyspecial_routines43.aliased_resized_area (yyvs43, yyvsc43)
	end
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
when 304 then
--|#line 2320 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2320")
end

			create {PROPER_INTERVAL [ISO8601_DURATION]} yyval43.make_lower_unbounded(yyvs28.item (yyvsp28), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp43 := yyvsp43 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp28 := yyvsp28 -1
	if yyvsp43 >= yyvsc43 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs43")
		end
		yyvsc43 := yyvsc43 + yyInitial_yyvs_size
		yyvs43 := yyspecial_routines43.aliased_resized_area (yyvs43, yyvsc43)
	end
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
when 305 then
--|#line 2324 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2324")
end

			create {PROPER_INTERVAL [ISO8601_DURATION]} yyval43.make_lower_unbounded(yyvs28.item (yyvsp28), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp43 := yyvsp43 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp28 := yyvsp28 -1
	if yyvsp43 >= yyvsc43 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs43")
		end
		yyvsc43 := yyvsc43 + yyInitial_yyvs_size
		yyvs43 := yyspecial_routines43.aliased_resized_area (yyvs43, yyvsc43)
	end
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
when 306 then
--|#line 2328 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2328")
end

			create {PROPER_INTERVAL [ISO8601_DURATION]} yyval43.make_upper_unbounded(yyvs28.item (yyvsp28), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp43 := yyvsp43 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp28 := yyvsp28 -1
	if yyvsp43 >= yyvsc43 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs43")
		end
		yyvsc43 := yyvsc43 + yyInitial_yyvs_size
		yyvs43 := yyspecial_routines43.aliased_resized_area (yyvs43, yyvsc43)
	end
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
when 307 then
--|#line 2332 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2332")
end

			create {PROPER_INTERVAL [ISO8601_DURATION]} yyval43.make_upper_unbounded(yyvs28.item (yyvsp28), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp43 := yyvsp43 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp28 := yyvsp28 -1
	if yyvsp43 >= yyvsc43 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs43")
		end
		yyvsc43 := yyvsc43 + yyInitial_yyvs_size
		yyvs43 := yyspecial_routines43.aliased_resized_area (yyvs43, yyvsc43)
	end
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
when 308 then
--|#line 2336 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2336")
end

			create {POINT_INTERVAL [ISO8601_DURATION]} yyval43.make (yyvs28.item (yyvsp28))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp43 := yyvsp43 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp28 := yyvsp28 -1
	if yyvsp43 >= yyvsc43 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs43")
		end
		yyvsc43 := yyvsc43 + yyInitial_yyvs_size
		yyvs43 := yyspecial_routines43.aliased_resized_area (yyvs43, yyvsc43)
	end
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
when 309 then
--|#line 2342 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2342")
end

			create yyval49.make(0)
			yyval49.extend(yyvs43.item (yyvsp43 - 1))
			yyval49.extend(yyvs43.item (yyvsp43))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp49 := yyvsp49 + 1
	yyvsp43 := yyvsp43 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp49 >= yyvsc49 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs49")
		end
		yyvsc49 := yyvsc49 + yyInitial_yyvs_size
		yyvs49 := yyspecial_routines49.aliased_resized_area (yyvs49, yyvsc49)
	end
	yyspecial_routines49.force (yyvs49, yyval49, yyvsp49)
end
when 310 then
--|#line 2348 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2348")
end

			yyvs49.item (yyvsp49).extend(yyvs43.item (yyvsp43))
			yyval49 := yyvs49.item (yyvsp49)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp43 := yyvsp43 -1
	yyspecial_routines49.force (yyvs49, yyval49, yyvsp49)
end
when 311 then
--|#line 2353 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2353")
end

			create yyval49.make(0)
			yyval49.extend(yyvs43.item (yyvsp43))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp49 := yyvsp49 + 1
	yyvsp43 := yyvsp43 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp49 >= yyvsc49 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs49")
		end
		yyvsc49 := yyvsc49 + yyInitial_yyvs_size
		yyvs49 := yyspecial_routines49.aliased_resized_area (yyvs49, yyvsc49)
	end
	yyspecial_routines49.force (yyvs49, yyval49, yyvsp49)
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
			when 559 then
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
			   89,   90,   79,   77,   87,   78,    2,   80,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,   88,   91,
			    2,   71,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,   85,    2,   86,   84,    2,    2,    2,    2,    2,

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
			   65,   66,   67,   68,   69,   70,   72,   73,   74,   75,
			   76,   81,   82,   83, yyDummy>>)
		end

	yyr1_template: SPECIAL [INTEGER]
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,  167,  167,  167,  168,  168,  107,  106,  106,  106,
			  106,   99,   99,  169,  169,  169,  172,  172,  172,  172,
			  172,  172,   96,   96,   97,   97,   97,  111,  111,  110,
			  109,  109,  109,  109,  109,  108,  108,  108,  108,  108,
			  108,  108,  108,  108,  170,  171,  171,  173,  173,  174,
			  174,  174,  112,  112,  176,  176,  176,  175,  177,  177,
			  178,  178,  179,  180,  180,   93,   93,   94,   94,   92,
			   92,   95,   95,   95,   95,  113,  113,  114,  114,  115,
			  115,  115,  115,  121,  122,  122,  117,  117,  117,  117,
			  118,  157,  157,  157,  157,  124,  124,  119,  125,  125,

			  116,  116,  120,  123,  123,  123,  156,  156,  156,  156,
			  156,  156,  155,  155,  155,  155,  155,  104,  104,  101,
			  101,  105,  105,  102,  102,  102,  102,  102,  102,  102,
			  102,  103,  103,  103,  100,  100,  100,  100,  165,  165,
			  165,  165,  165,  165,  164,  164,  164,  164,  164,  164,
			  162,  162,  162,  162,  162,  162,  162,  163,  163,  163,
			  163,  163,  163,  163,  160,  160,  160,  160,  160,  160,
			  160,  161,  161,  161,  161,  161,  161,  161,  161,  161,
			  159,  159,  159,  159,  159,  166,  166,  166,  166,  166,
			  166,  166,  166,  158,  158,  158,  158,  158,  133,  133,

			   98,   98,  134,  135,  135,  135,  135,  126,  126,  126,
			  136,  136,  136,  143,  143,  143,  143,  143,  143,  143,
			  143,  143,  149,  149,  149,  127,  127,  127,  137,  137,
			  137,  144,  144,  144,  144,  144,  144,  144,  144,  144,
			  150,  150,  150,  128,  128,  138,  138,  138,  129,  139,
			  139,  139,  146,  146,  146,  146,  146,  146,  146,  146,
			  146,  152,  152,  152,  131,  140,  140,  140,  145,  145,
			  145,  145,  145,  145,  145,  145,  145,  151,  151,  151,
			  130,  141,  141,  141,  147,  147,  147,  147,  147,  147,
			  147,  147,  147,  153,  153,  153,  132,  142,  142,  142,

			  148,  148,  148,  148,  148,  148,  148,  148,  148,  154,
			  154,  154, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    2,    2,    2,    2,    2,    4,    3,    1,    7,    8,
			    2,   11,   16,   16,   20,   20,   20,   20,   21,   22,
			   22,   22,   22,   22,   23,   23,   20,    3,    4,    2,
			    1,   20,   20,    4,    3,    4,    3,    1,    2,    2,
			    1,    2,    2,    1,    1,    8,    2,    2,    2,    2,
			    1,   14,    1,    1,    1,    1,    1,    2,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    2,    1,    1,    1,   20,    1,    1,    2,    1,    1,
			    1,   20,    1,    2,   20,   20,    1,   20,    1,    1,

			    1,    1,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    1,    1,    1,    5,    5,    2,    2,    2,
			    2,   17,    3,    4,   24,   25,   26,   27,   28,   30,
			   31,   32,   33,   34,   35,   36,   37,   38,   39,   40,
			   41,   42,   43,   44,   45,   46,   47,   48,   49,   50,
			   51,   52,   53,   54,   55,   56,   57,   58,   17,   58,
			    1,    1,    1,    2,    2,    1,   19,    1,    1,    1,
			    1,    1,    1,   20,    1,    1,    1,    1,    3,    4,
			   25,   26,   27,   28,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    3,   12,    3,
			    2,    1,    1,   14,   14,    1,    1,    1,    3,    4,
			   25,   26,   27,   28,    3,    4,   25,   26,   27,   28,
			    3,    4,   25,   26,   27,   28,    3,    4,   25,   26,
			   27,   28,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,   43,    1,    2,    1,    3,
			    1,    1,    1,    4,    1,    1,    1,   24,    1,   25,
			    1,   26,    1,   27,    1,   28,    1,    2,    3,    4,

			   24,   25,   27,   26,   28,    1,    1,   38,    1,    1,
			   39,    1,    1,   40,    1,    1,   41,    1,    1,   42,
			    1,   43,   38,   39,   40,   41,   42,   43,    1,   24,
			    2,    1,    2,    1,   26,    1,   28,    1,   25,    1,
			   27,    1,    4,    1,    3,    1,    1,    1,    1,    1,
			    1,   15,   15,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    3,    1,    4,    1,   25,
			    1,   26,    1,   27,    1,   28,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    3,    2,    1,    1,    1,    1,    1,    1,    1,
			    9,   10,    2,   11,   17,   18,   18,   18,    1,    1,
			    1,    1,    1,    3,    1,    4,    1,   25,    1,   26,
			    1,   27,    1,   28,    3,    1,    4,    1,   25,    1,
			   26,    1,   27,    1,   28,    1,    1,    3,   12,    1,
			    1,    2,    1,    2,    2,    1,    1,   14,    1,    1,
			    1,    1,    3,    1,    4,    1,   25,    1,   26,    1,
			   27,    1,   28,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,   12,   13,    2,   14,    2,
			    2,    1,    2,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    3,    1,    1,   14,    2,    1,
			   14,    2,    1,    7,   17,    1,    1,    1,    1,    1,
			    1,    2,    2,    7,    1,    7,    1,    1,    1,    1,
			    1,    7,    1,   17,    1,    1,    1,    1,    1,    1,
			    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER]
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    2,    3,    4,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    5,    5,    1,
			    1,    1,    2,    2,    2,    6,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER]
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,   96,   95,
			    0,  105,  199,  201,  200,  225,  207,    3,    2,   69,
			  198,    0,  131,    5,   72,   76,   75,   98,   77,   78,
			   82,   99,   73,   80,  100,   79,    0,  103,  104,    0,
			    1,    0,    0,  227,  209,  226,  208,    0,   87,   86,
			   89,   12,   11,    0,    0,   70,  198,    8,    7,    0,
			    0,    6,    0,   92,   93,   91,   94,    0,  116,  112,
			  113,  115,  114,  110,  108,  111,  109,  107,  106,    0,
			    0,    0,   81,  101,    0,    0,    0,    9,    0,  133,
			    0,   90,    0,  105,  102,   97,   74,   71,   88,  244,

			  243,    0,  179,  172,  150,  157,  164,  296,  280,  264,
			  248,  182,  192,  190,  191,  189,  188,  186,  187,  185,
			  180,    0,  138,  144,    0,  151,  165,  158,  173,  181,
			  139,  145,  195,  152,  159,  166,  174,  140,  146,  160,
			  153,  167,  175,  141,  147,  161,  154,  168,  176,   43,
			   41,   39,   40,   37,   38,   36,   35,   42,    0,    0,
			    0,    0,   44,  117,  117,   15,   50,    0,   13,   14,
			   45,   47,   48,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,   83,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,   84,   85,  135,    0,    0,  207,    0,  134,
			   58,    0,    0,  121,  121,    0,    4,   46,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  221,    0,  239,    0,  260,    0,  292,
			    0,  276,    0,  308,    0,  171,  206,  203,  212,  210,
			    0,    0,  230,  228,  247,  244,  243,  245,  251,  249,
			  283,  281,  267,  265,  299,  297,  205,  204,  211,  229,

			  246,  250,  266,  282,  298,  224,    0,  222,  242,    0,
			  240,  279,    0,  277,  263,    0,  261,  295,    0,  293,
			  311,  309,  223,  241,  278,  262,  294,  310,  197,  196,
			  202,  184,  183,  170,  169,  178,  177,  156,  155,  163,
			  162,  149,  148,  143,  142,    0,  132,    0,    0,    0,
			    0,   53,   52,    0,  220,  238,  259,  291,  275,  307,
			  218,  236,  257,  289,  273,  305,    0,  219,    0,  237,
			    0,  258,    0,  290,    0,  274,    0,  306,  217,  235,
			  256,  288,  272,  304,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			  137,  136,   59,    0,    0,    0,    0,    0,    0,   21,
			   17,   18,   10,    0,   20,  131,   28,   19,   16,   56,
			   54,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  213,    0,  231,    0,  252,
			    0,  284,    0,  268,    0,  300,    0,  119,    0,    0,
			   26,  131,   34,   33,    0,   51,    0,   29,    0,   49,
			   21,   55,    0,  214,    0,  232,    0,  253,    0,  285,
			    0,  269,    0,  301,  215,  233,  254,  286,  270,  302,

			    0,    0,   60,    0,  118,  123,    0,  131,    0,   30,
			  131,   23,    0,   65,  216,  234,  255,  287,  271,  303,
			    0,    0,    0,   57,  120,    0,  122,    0,   25,   32,
			    0,   31,    0,   67,    0,    0,   62,   61,  126,  124,
			  125,   24,   22,   66,    0,    0,   63,    0,    0,    0,
			    0,   68,   27,    0,  129,  130,  127,  128,   64,    0,
			    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			   18,  533,  545,   19,  430,  431,   56,  433,  228,  468,
			  506,   61,  233,  351,   22,   23,  434,  435,  436,  437,
			  166,   24,   25,   26,   27,   28,   29,   30,   31,   32,
			   33,   34,   35,   36,   37,   38,  124,  125,  126,  127,
			  128,   39,  332,  129,  130,  131,  132,  133,  134,  135,
			  136,  137,  138,  139,  140,  141,  142,  143,  144,  145,
			  146,  147,  148,   79,   80,   67,  149,  150,  151,  152,
			  153,  154,  155,  156,  157,  559,  438,  167,  168,  169,
			  440,  170,  171,  172,  441,  231,  501,  502,  521, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			  188,  256,  564,  519,  -16,  230,  849,  848, -32768, -32768,
			  807,  806, -32768, -32768, -32768, -32768, -32768, -32768,  522, -32768,
			  602,  293,  340,  805,  440, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768,  502, -32768, -32768,  768,
			 -32768,  477,  476, -32768, -32768, -32768, -32768,  256, -32768, -32768,
			 -32768, -32768, -32768,  819,  818, -32768, -32768, -32768, -32768,  829,
			   10, -32768,  744, -32768, -32768, -32768, -32768,   47, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,   45,
			   45,  234, -32768, -32768,  393,  785,  785, -32768,  743, -32768,
			   11, -32768,   45, -32768, -32768,  395, -32768,  440, -32768,  481,

			  377,  754, -32768,  691, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			  766,  739,  765,  764,  763,  762,  761,  760,  759,  758,
			  757,  756,  755,  753,  752,  751,  750,  749,  748,  747,
			  746,  736,  735,  734,  722,  721,  709,  682,  669,  707,
			  706,  703,  702,  694,  687,  686,  684, -32768,  720,  705,
			    2,  728, -32768,  697,  697, -32768,  683,  696, -32768,   23,
			 -32768, -32768, -32768,  585,  136,  136,  136,  136,  417,  402,
			  376,  350,  329,  327,  685,  150, -32768,  164,   84,  301,
			  192,  197,  139,  120,   25,   71,  108,  524,  578,  557,

			  568,  566,  239,  229,  194,  131,   -9,  -14,  693,  692,
			  690,  689,  688,  685,   16,  272,   14,   44,   26,   27,
			   43,   28, -32768, -32768, -32768,  719,  715,  668,  680, -32768,
			 -32768,  394,  678,  647,  647,  656, -32768, -32768,  677,  676,
			  675,  674,  673,  672,  671,  670,  666,  665,  664,  652,
			  326,  324,  323,  307,  305,  205,  651,  639,  637,  631,
			  628,  627,  147, -32768,  211, -32768,   -4, -32768,  129, -32768,
			    5, -32768,  154, -32768,  219, -32768, -32768, -32768, -32768, -32768,
			  654,  653, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,

			 -32768, -32768, -32768, -32768, -32768, -32768,   99, -32768, -32768,  262,
			 -32768, -32768,  375, -32768, -32768,  348, -32768, -32768,  -15, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768,   68, -32768,  645,  600,  615,
			  598, -32768, -32768,  667, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768,  127, -32768,  186, -32768,
			   -7, -32768,   36, -32768,   -2, -32768,  107, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768,   71,  610,  108,  609,  578,  607,
			  568,  606,  557,  605,  566,  599,  566,  566,  566,  566,

			   71,   71,   71,   71,  108,  108,  108,  108,  557,  557,
			  557,  557,  578,  578,  578,  578,  568,  568,  568,  568,
			 -32768, -32768, -32768,  604,  624,  591,  531,  483,  293,  589,
			 -32768, -32768,  450,  149, -32768,  340,  573, -32768, -32768, -32768,
			 -32768,  733,   71,  576,  108,  571,  578,  565,  568,  562,
			  557,  559,  566,  556,  555, -32768,  554, -32768,  552, -32768,
			  550, -32768,  549, -32768,  548, -32768,  271,  534,  546,    2,
			 -32768,  206, -32768,  558,  187, -32768,  293, -32768,  525, -32768,
			 -32768, -32768,  532, -32768,  518, -32768,  480, -32768,  478, -32768,
			  437, -32768,  414, -32768, -32768, -32768, -32768, -32768, -32768, -32768,

			  495,  -24, -32768,  436, -32768,  347,  351,  340,  410,  365,
			  340, -32768,  368,  304, -32768, -32768, -32768, -32768, -32768, -32768,
			  785,  111,  271, -32768, -32768,  445, -32768,  330, -32768, -32768,
			  328, -32768,  522,  265,  276,  250, -32768, -32768,  181,  163,
			   87, -32768, -32768,  522,  522,  115, -32768,  785,  189,  168,
			   93,  522, -32768,   -1, -32768, -32768, -32768, -32768, -32768,   40,
			   38, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -263, -32768, -32768,  -18, -32768, -32768,    1,  875,  404, -32768,
			 -32768, -353,  710,  638, -32768, -32768,  -81, -32768, -32768, -32768,
			 -32768,   20, -32768,  804,  791, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768,   15,  -83,  -77, -150,   32,  -47,  -60,
			  -91, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768,  263,  260,  209,   29,  109,  103, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768,  783, -32768,  868, -32768,  513, -32768,
			  424,  698, -32768, -32768, -32768, -32768, -32768,  342, -32768, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   55,   20,  122,  122,  121,  158,  227,   48,  123,  123,
			  183,   89,  165,  523,  108,  333,   42,  328,  178,  164,
			  110,   41,   59,  110,  179,  274,  109,  337,  339,  343,
			  318,  164,   16,  109,  163,  297,  558,  320,  561,  287,
			  560,  182,  317,  108,  341,  335,  163,  300,   15,   16,
			   15,   16,   15,  110,  181,  109,  286,  285,  419,  418,
			  417,  416,   88,  522,  329,  108,  446,   84,   93,  388,
			   11,  450,   16,   47,  107,   16,  296,  229,  392,  226,
			  225,  224,  477,  243,  249,  255,  261,    9,    8,   15,
			  162,  238,  244,  250,  256,   95,  161,  239,  245,  251,

			  257,   97,  295,   16,  279,  226,  225,  173,  161,  448,
			  304,  283,  298,   15,  242,  248,  254,  260,  508,  299,
			  281,  280,    3,    2,    3,    2,  336,  241,  247,  253,
			  259,   16,  293,  180,   92,  282,    1,  107,  344,  302,
			   16,   15,  557,  342,  291,  226,  225,  420,  226,  225,
			  107,   16,  552,  303,  527,   14,   13,  530,  108,  340,
			  277,  281,  280,  110,  109,  108,  107,  109,   16,  334,
			  315,  294,  403,  402,  401,  400,  226,  225,  550,  385,
			  452,  395,  314,  183,  107,  281,  280,  387,  511,   17,
			  292,   15,   16,   15,   14,   13,   12,  536,  535,  510,

			  442,  276,  390,  476,  226,  225,  240,  246,  252,  258,
			  393,   11,   10,    3,    2,  278,   15,  556,  507,  110,
			  384,  391,  289,  178,  226,  225,  108,  394,    9,    8,
			  301,   50,  179,  312,  316,   96,  555,  554,   16,   15,
			  325,  226,  225,  288,  377,  311,    7,    6,  290,  107,
			  338,   60,  182,   49,  549,  376,    5,   11,    4,  444,
			   16,   15,  421,  281,  280,    3,    2,   15,  309,  543,
			  122,  181,  548,  331,    9,    8,  123,    1,  306,   11,
			  308,  551,  330,  443,  386,  453,  547,  275,  281,  280,
			  305,  445,  399,  398,  397,  396,    9,    8,  389,   14,

			   13,  454,    5,  464,    4,  243,  249,  255,  261,  456,
			  321,    3,    2,  546,  451,  319,  327,  238,  244,  250,
			  256,  326,  544,    1,    5,  449,    4,  239,  245,  251,
			  257,  542,  462,    3,    2,  407,  406,  405,  404,  281,
			  280,  286,  285,  460,  375,    1,  373,  180,  242,  248,
			  254,  260,  284,  541,  432,  374,  500,  372,  122,  482,
			  532,  492,  371,  369,  123,  367,  273,  484,  271,  241,
			  247,  253,  259,  370,  368,  110,  366,  272, -193,  270,
			  531, -193, -193, -193, -193,   60,  229, -193,  526,  269,
			  490, -193, -193, -193, -193, -193, -193, -193, -193, -193,

			  268,  488,  447,  109, -193, -193, -193, -193, -193, -193,
			 -193, -193, -193,  313, -193,  267, -193, -193, -193,  324,
			  458,  415,  414,  413,  412,  529,  266,  471,  473,  474,
			 -193, -193, -193,  528,   59, -193, -193,  122,  525,  534,
			  524,  265,  432,  123,  240,  246,  252,  258,  411,  410,
			  409,  408,  264,  519, -193, -193,  263,   66,   65,   64,
			   63,   58,   57,  310,  122,  307,  553,  262, -193,  323,
			  123,  322,   72,   71,   70,   69,  518,  512,  486,   68,
			  348,  347, -194,   98,  472, -194, -194, -194, -194,   14,
			   13, -194,  540,  539,  538, -194, -194, -194, -194, -194,

			 -194, -194, -194, -194,   66,   65,   64,   63, -194, -194,
			 -194, -194, -194, -194, -194, -194, -194,  517, -194,  516,
			 -194, -194, -194,   46,   45,   55,   16,   15,   14,   13,
			   12,  520,  470,   55, -194, -194, -194,   14,   13, -194,
			 -194,   66,   65,   64,   63,   11,   10,   78,   77,   76,
			   75,   74,   73,   72,   71,   70,   69,  515, -194, -194,
			   68,  513,    9,    8,  286,  285,   83,   82,   44,   43,
			  509,  514, -194,   78,   77,   76,   75,   74,   73,   72,
			   71,   70,   69,  504,  503,  109,   68,  499,  498,  497,
			    5,  496,    4,  495,  494,  493,  107,  108,  491,    3,

			    2,  489,  -10,  -10,  487,  110,  -10,  -10,  -10,  -10,
			  485,    1,  -10,   58,   57,  483,  -10,  -10,  -10,  -10,
			  -10,  -10,  -10,  -10,  -10,  478,  475,  469,  467,  -10,
			  -10,  -10,  -10,  -10,  -10,  -10,  -10,  -10,  465,  -10,
			  466,  -10,  -10,  -10,  463,  461,  459,  -10,  457,  455,
			  425,  424,  423,  422,  -10,  -10,  -10,  -10,   45,   43,
			  -10,  -10,   72,   71,   70,   69,  383,  382,  429,   68,
			  381,   16,   15,   14,   13,   83,  380,  120,  379,  -10,
			  -10,  119,  118,  117,  116,  115,  114,  113,  112,  111,
			  378,  365,  353,  350,  110,  109,  108,  107,  106,  105,

			  104,  103,  102,  364,  363,  362,  101,  100,   99,  361,
			  360,  359,  358,  357,  356,  355,  354,  346,  345,   46,
			  428,  427,  426,   44,  274,    7,    6,  318,  315,  312,
			  349,  309,  306,  236,  480,  235,  230,   16,   15,   14,
			   13,  232,  223,  120,    3,    2,  162,  119,  118,  117,
			  116,  115,  114,  113,  112,  111,  213,  222,   16,   15,
			  110,  109,  108,  107,  106,  105,  104,  103,  102,  212,
			  479,  184,  101,  100,   99,  221,  186,  220,  219,  160,
			   90,  110,  109,  108,  107,  218,  428,  427,  426,   16,
			   15,    7,    6,  217,  216,  120,  211,  215,  214,  119,

			  118,  117,  116,  115,  114,  113,  112,  111,  210,  209,
			    3,    2,  110,  109,  108,  107,  106,  105,  104,  103,
			  102,  208,  207,  206,  101,  100,   99,  177,  176,  175,
			  174,    3,    2,  205,  204,  203,  202,  201,  200,  199,
			  198,   87,  197,  196,  195,  194,  193,  192,  191,  190,
			  189,  188,  187,  185,   86,   85,   81,   62,   54,   53,
			   52,   51,    3,    2,  537,  481,  439,  237,   40,  159,
			   94,   91,  352,  505,  234,   21, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			   18,    0,   85,   86,   85,   86,    4,   23,   85,   86,
			  101,    1,    1,   37,   29,    1,    1,    1,  101,    8,
			   27,    1,   21,   27,  101,   39,   28,    1,    1,    1,
			   39,    8,    4,   28,   23,   10,   37,   51,    0,  189,
			    0,  101,   51,   29,    1,    1,   23,  197,    5,    4,
			    5,    4,    5,   27,  101,   28,   40,   41,   73,   74,
			   75,   76,   52,   87,  214,   29,   73,   47,   23,   73,
			   23,   73,    4,   89,   30,    4,   51,  160,   73,   77,
			   78,   79,  435,  174,  175,  176,  177,   40,   41,    5,
			   79,  174,  175,  176,  177,   80,   85,  174,  175,  176,

			  177,   81,  193,    4,  187,   77,   78,   92,   85,   73,
			  201,  188,  195,    5,  174,  175,  176,  177,  471,  196,
			   77,   78,   77,   78,   77,   78,  217,  174,  175,  176,
			  177,    4,  192,  101,   89,   51,   89,   30,  221,  199,
			    4,    5,   49,  220,  191,   77,   78,   79,   77,   78,
			   30,    4,   37,  200,  507,    6,    7,  510,   29,  219,
			   10,   77,   78,   27,   28,   29,   30,   28,    4,  216,
			   39,   51,   73,   74,   75,   76,   77,   78,   91,  262,
			   73,  272,   51,  274,   30,   77,   78,  264,    1,    1,
			   51,    5,    4,    5,    6,    7,    8,   86,   87,   12,

			   73,   51,   73,   54,   77,   78,  174,  175,  176,  177,
			  270,   23,   24,   77,   78,   51,    5,   49,   12,   27,
			   73,  268,  190,  306,   77,   78,   29,   73,   40,   41,
			  198,    1,  309,   39,  205,    1,   47,   48,    4,    5,
			  211,   77,   78,   51,   39,   51,   58,   59,   51,   30,
			  218,   45,  312,   23,   91,   50,   68,   23,   70,   73,
			    4,    5,  345,   77,   78,   77,   78,    5,   39,  532,
			  353,  318,   91,    1,   40,   41,  353,   89,   39,   23,
			   51,  544,   10,  366,   73,  376,   36,  184,   77,   78,
			   51,  368,   73,   74,   75,   76,   40,   41,  266,    6,

			    7,  384,   68,  394,   70,  396,  397,  398,  399,  386,
			  207,   77,   78,   37,  374,  206,  213,  400,  401,  402,
			  403,  212,   57,   89,   68,  372,   70,  404,  405,  406,
			  407,    3,  392,   77,   78,   73,   74,   75,   76,   77,
			   78,   40,   41,  390,   39,   89,   39,  315,  408,  409,
			  410,  411,   51,   23,  353,   50,   85,   50,  441,  442,
			   56,  452,   39,   39,  441,   39,   39,  444,   39,  416,
			  417,  418,  419,   50,   50,   27,   50,   50,    1,   50,
			   12,    4,    5,    6,    7,   45,  469,   10,   37,   39,
			  450,   14,   15,   16,   17,   18,   19,   20,   21,   22,

			   50,  448,  370,   28,   27,   28,   29,   30,   31,   32,
			   33,   34,   35,  204,   37,   39,   39,   40,   41,  210,
			  388,   73,   74,   75,   76,   60,   50,  426,  427,  428,
			   53,   54,   55,   23,  433,   58,   59,  520,   91,  520,
			    4,   39,  441,  520,  412,  413,  414,  415,   73,   74,
			   75,   76,   50,   39,   77,   78,   39,   64,   65,   66,
			   67,   11,   12,  203,  547,  202,  547,   50,   91,  209,
			  547,  208,   77,   78,   79,   80,   39,  476,  446,   84,
			   86,   87,    1,   90,    1,    4,    5,    6,    7,    6,
			    7,   10,   47,   48,   49,   14,   15,   16,   17,   18,

			   19,   20,   21,   22,   64,   65,   66,   67,   27,   28,
			   29,   30,   31,   32,   33,   34,   35,   39,   37,   39,
			   39,   40,   41,    4,    5,  543,    4,    5,    6,    7,
			    8,   36,    1,  551,   53,   54,   55,    6,    7,   58,
			   59,   64,   65,   66,   67,   23,   24,   71,   72,   73,
			   74,   75,   76,   77,   78,   79,   80,   39,   77,   78,
			   84,   36,   40,   41,   40,   41,   90,   90,    4,    5,
			   12,   39,   91,   71,   72,   73,   74,   75,   76,   77,
			   78,   79,   80,   37,   50,   28,   84,   39,   39,   39,
			   68,   39,   70,   39,   39,   39,   30,   29,   39,   77,

			   78,   39,    0,    1,   39,   27,    4,    5,    6,    7,
			   39,   89,   10,   11,   12,   39,   14,   15,   16,   17,
			   18,   19,   20,   21,   22,   52,   37,   36,    4,   27,
			   28,   29,   30,   31,   32,   33,   34,   35,   39,   37,
			   36,   39,   40,   41,   39,   39,   39,   45,   39,   39,
			   52,   36,   52,    8,   52,   53,   54,   55,    5,    5,
			   58,   59,   77,   78,   79,   80,   39,   39,    1,   84,
			   39,    4,    5,    6,    7,   90,   39,   10,   39,   77,
			   78,   14,   15,   16,   17,   18,   19,   20,   21,   22,
			   39,   39,   36,   46,   27,   28,   29,   30,   31,   32,

			   33,   34,   35,   39,   39,   39,   39,   40,   41,   39,
			   39,   39,   39,   39,   39,   39,   39,   37,   50,    4,
			   53,   54,   55,    4,   39,   58,   59,   39,   39,   39,
			   52,   39,   39,   37,    1,   52,    8,    4,    5,    6,
			    7,   44,   37,   10,   77,   78,   79,   14,   15,   16,
			   17,   18,   19,   20,   21,   22,   87,   37,    4,    5,
			   27,   28,   29,   30,   31,   32,   33,   34,   35,   87,
			   37,   80,   39,   40,   41,   91,   37,   91,   91,   36,
			   36,   27,   28,   29,   30,   91,   53,   54,   55,    4,
			    5,   58,   59,   91,   91,   10,   87,   91,   91,   14,

			   15,   16,   17,   18,   19,   20,   21,   22,   87,   87,
			   77,   78,   27,   28,   29,   30,   31,   32,   33,   34,
			   35,   87,   87,   87,   39,   40,   41,   73,   74,   75,
			   76,   77,   78,   87,   87,   87,   87,   87,   87,   87,
			   87,   12,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   36,   36,   88,   52,   52,   52,
			   12,   12,   77,   78,  522,  441,  353,  169,    0,   86,
			   79,   67,  234,  469,  164,    0, yyDummy>>)
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

	yyvs5: SPECIAL [TERM_CONSTRAINT_PARSE_STRUCTURE]
			-- Stack for semantic values of type TERM_CONSTRAINT_PARSE_STRUCTURE

	yyvsc5: INTEGER
			-- Capacity of semantic value stack `yyvs5'

	yyvsp5: INTEGER
			-- Top of semantic value stack `yyvs5'

	yyspecial_routines5: KL_SPECIAL_ROUTINES [TERM_CONSTRAINT_PARSE_STRUCTURE]
			-- Routines that ought to be in SPECIAL [TERM_CONSTRAINT_PARSE_STRUCTURE]

	yyvs6: SPECIAL [CHARACTER]
			-- Stack for semantic values of type CHARACTER

	yyvsc6: INTEGER
			-- Capacity of semantic value stack `yyvs6'

	yyvsp6: INTEGER
			-- Top of semantic value stack `yyvs6'

	yyspecial_routines6: KL_SPECIAL_ROUTINES [CHARACTER]
			-- Routines that ought to be in SPECIAL [CHARACTER]

	yyvs7: SPECIAL [detachable ARRAYED_LIST [ASSERTION]]
			-- Stack for semantic values of type detachable ARRAYED_LIST [ASSERTION]

	yyvsc7: INTEGER
			-- Capacity of semantic value stack `yyvs7'

	yyvsp7: INTEGER
			-- Top of semantic value stack `yyvs7'

	yyspecial_routines7: KL_SPECIAL_ROUTINES [detachable ARRAYED_LIST [ASSERTION]]
			-- Routines that ought to be in SPECIAL [detachable ARRAYED_LIST [ASSERTION]]

	yyvs8: SPECIAL [ASSERTION]
			-- Stack for semantic values of type ASSERTION

	yyvsc8: INTEGER
			-- Capacity of semantic value stack `yyvs8'

	yyvsp8: INTEGER
			-- Top of semantic value stack `yyvs8'

	yyspecial_routines8: KL_SPECIAL_ROUTINES [ASSERTION]
			-- Routines that ought to be in SPECIAL [ASSERTION]

	yyvs9: SPECIAL [C_ARCHETYPE_ROOT]
			-- Stack for semantic values of type C_ARCHETYPE_ROOT

	yyvsc9: INTEGER
			-- Capacity of semantic value stack `yyvs9'

	yyvsp9: INTEGER
			-- Top of semantic value stack `yyvs9'

	yyspecial_routines9: KL_SPECIAL_ROUTINES [C_ARCHETYPE_ROOT]
			-- Routines that ought to be in SPECIAL [C_ARCHETYPE_ROOT]

	yyvs10: SPECIAL [C_COMPLEX_OBJECT_PROXY]
			-- Stack for semantic values of type C_COMPLEX_OBJECT_PROXY

	yyvsc10: INTEGER
			-- Capacity of semantic value stack `yyvs10'

	yyvsp10: INTEGER
			-- Top of semantic value stack `yyvs10'

	yyspecial_routines10: KL_SPECIAL_ROUTINES [C_COMPLEX_OBJECT_PROXY]
			-- Routines that ought to be in SPECIAL [C_COMPLEX_OBJECT_PROXY]

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

	yyvs13: SPECIAL [CARDINALITY]
			-- Stack for semantic values of type CARDINALITY

	yyvsc13: INTEGER
			-- Capacity of semantic value stack `yyvs13'

	yyvsp13: INTEGER
			-- Top of semantic value stack `yyvs13'

	yyspecial_routines13: KL_SPECIAL_ROUTINES [CARDINALITY]
			-- Routines that ought to be in SPECIAL [CARDINALITY]

	yyvs14: SPECIAL [detachable MULTIPLICITY_INTERVAL]
			-- Stack for semantic values of type detachable MULTIPLICITY_INTERVAL

	yyvsc14: INTEGER
			-- Capacity of semantic value stack `yyvs14'

	yyvsp14: INTEGER
			-- Top of semantic value stack `yyvs14'

	yyspecial_routines14: KL_SPECIAL_ROUTINES [detachable MULTIPLICITY_INTERVAL]
			-- Routines that ought to be in SPECIAL [detachable MULTIPLICITY_INTERVAL]

	yyvs15: SPECIAL [detachable CARDINALITY]
			-- Stack for semantic values of type detachable CARDINALITY

	yyvsc15: INTEGER
			-- Capacity of semantic value stack `yyvs15'

	yyvsp15: INTEGER
			-- Top of semantic value stack `yyvs15'

	yyspecial_routines15: KL_SPECIAL_ROUTINES [detachable CARDINALITY]
			-- Routines that ought to be in SPECIAL [detachable CARDINALITY]

	yyvs16: SPECIAL [C_COMPLEX_OBJECT]
			-- Stack for semantic values of type C_COMPLEX_OBJECT

	yyvsc16: INTEGER
			-- Capacity of semantic value stack `yyvs16'

	yyvsp16: INTEGER
			-- Top of semantic value stack `yyvs16'

	yyspecial_routines16: KL_SPECIAL_ROUTINES [C_COMPLEX_OBJECT]
			-- Routines that ought to be in SPECIAL [C_COMPLEX_OBJECT]

	yyvs17: SPECIAL [C_PRIMITIVE_OBJECT]
			-- Stack for semantic values of type C_PRIMITIVE_OBJECT

	yyvsc17: INTEGER
			-- Capacity of semantic value stack `yyvs17'

	yyvsp17: INTEGER
			-- Top of semantic value stack `yyvs17'

	yyspecial_routines17: KL_SPECIAL_ROUTINES [C_PRIMITIVE_OBJECT]
			-- Routines that ought to be in SPECIAL [C_PRIMITIVE_OBJECT]

	yyvs18: SPECIAL [ARCHETYPE_SLOT]
			-- Stack for semantic values of type ARCHETYPE_SLOT

	yyvsc18: INTEGER
			-- Capacity of semantic value stack `yyvs18'

	yyvsp18: INTEGER
			-- Top of semantic value stack `yyvs18'

	yyspecial_routines18: KL_SPECIAL_ROUTINES [ARCHETYPE_SLOT]
			-- Routines that ought to be in SPECIAL [ARCHETYPE_SLOT]

	yyvs19: SPECIAL [C_ATTRIBUTE]
			-- Stack for semantic values of type C_ATTRIBUTE

	yyvsc19: INTEGER
			-- Capacity of semantic value stack `yyvs19'

	yyvsp19: INTEGER
			-- Top of semantic value stack `yyvs19'

	yyspecial_routines19: KL_SPECIAL_ROUTINES [C_ATTRIBUTE]
			-- Routines that ought to be in SPECIAL [C_ATTRIBUTE]

	yyvs20: SPECIAL [EXPR_ITEM]
			-- Stack for semantic values of type EXPR_ITEM

	yyvsc20: INTEGER
			-- Capacity of semantic value stack `yyvs20'

	yyvsp20: INTEGER
			-- Top of semantic value stack `yyvs20'

	yyspecial_routines20: KL_SPECIAL_ROUTINES [EXPR_ITEM]
			-- Routines that ought to be in SPECIAL [EXPR_ITEM]

	yyvs21: SPECIAL [EXPR_UNARY_OPERATOR]
			-- Stack for semantic values of type EXPR_UNARY_OPERATOR

	yyvsc21: INTEGER
			-- Capacity of semantic value stack `yyvs21'

	yyvsp21: INTEGER
			-- Top of semantic value stack `yyvs21'

	yyspecial_routines21: KL_SPECIAL_ROUTINES [EXPR_UNARY_OPERATOR]
			-- Routines that ought to be in SPECIAL [EXPR_UNARY_OPERATOR]

	yyvs22: SPECIAL [EXPR_BINARY_OPERATOR]
			-- Stack for semantic values of type EXPR_BINARY_OPERATOR

	yyvsc22: INTEGER
			-- Capacity of semantic value stack `yyvs22'

	yyvsp22: INTEGER
			-- Top of semantic value stack `yyvs22'

	yyspecial_routines22: KL_SPECIAL_ROUTINES [EXPR_BINARY_OPERATOR]
			-- Routines that ought to be in SPECIAL [EXPR_BINARY_OPERATOR]

	yyvs23: SPECIAL [EXPR_LEAF]
			-- Stack for semantic values of type EXPR_LEAF

	yyvsc23: INTEGER
			-- Capacity of semantic value stack `yyvs23'

	yyvsp23: INTEGER
			-- Top of semantic value stack `yyvs23'

	yyspecial_routines23: KL_SPECIAL_ROUTINES [EXPR_LEAF]
			-- Routines that ought to be in SPECIAL [EXPR_LEAF]

	yyvs24: SPECIAL [BOOLEAN]
			-- Stack for semantic values of type BOOLEAN

	yyvsc24: INTEGER
			-- Capacity of semantic value stack `yyvs24'

	yyvsp24: INTEGER
			-- Top of semantic value stack `yyvs24'

	yyspecial_routines24: KL_SPECIAL_ROUTINES [BOOLEAN]
			-- Routines that ought to be in SPECIAL [BOOLEAN]

	yyvs25: SPECIAL [ISO8601_DATE]
			-- Stack for semantic values of type ISO8601_DATE

	yyvsc25: INTEGER
			-- Capacity of semantic value stack `yyvs25'

	yyvsp25: INTEGER
			-- Top of semantic value stack `yyvs25'

	yyspecial_routines25: KL_SPECIAL_ROUTINES [ISO8601_DATE]
			-- Routines that ought to be in SPECIAL [ISO8601_DATE]

	yyvs26: SPECIAL [ISO8601_DATE_TIME]
			-- Stack for semantic values of type ISO8601_DATE_TIME

	yyvsc26: INTEGER
			-- Capacity of semantic value stack `yyvs26'

	yyvsp26: INTEGER
			-- Top of semantic value stack `yyvs26'

	yyspecial_routines26: KL_SPECIAL_ROUTINES [ISO8601_DATE_TIME]
			-- Routines that ought to be in SPECIAL [ISO8601_DATE_TIME]

	yyvs27: SPECIAL [ISO8601_TIME]
			-- Stack for semantic values of type ISO8601_TIME

	yyvsc27: INTEGER
			-- Capacity of semantic value stack `yyvs27'

	yyvsp27: INTEGER
			-- Top of semantic value stack `yyvs27'

	yyspecial_routines27: KL_SPECIAL_ROUTINES [ISO8601_TIME]
			-- Routines that ought to be in SPECIAL [ISO8601_TIME]

	yyvs28: SPECIAL [ISO8601_DURATION]
			-- Stack for semantic values of type ISO8601_DURATION

	yyvsc28: INTEGER
			-- Capacity of semantic value stack `yyvs28'

	yyvsp28: INTEGER
			-- Top of semantic value stack `yyvs28'

	yyspecial_routines28: KL_SPECIAL_ROUTINES [ISO8601_DURATION]
			-- Routines that ought to be in SPECIAL [ISO8601_DURATION]

	yyvs29: SPECIAL [URI]
			-- Stack for semantic values of type URI

	yyvsc29: INTEGER
			-- Capacity of semantic value stack `yyvs29'

	yyvsp29: INTEGER
			-- Top of semantic value stack `yyvs29'

	yyspecial_routines29: KL_SPECIAL_ROUTINES [URI]
			-- Routines that ought to be in SPECIAL [URI]

	yyvs30: SPECIAL [ARRAYED_LIST [STRING]]
			-- Stack for semantic values of type ARRAYED_LIST [STRING]

	yyvsc30: INTEGER
			-- Capacity of semantic value stack `yyvs30'

	yyvsp30: INTEGER
			-- Top of semantic value stack `yyvs30'

	yyspecial_routines30: KL_SPECIAL_ROUTINES [ARRAYED_LIST [STRING]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [STRING]]

	yyvs31: SPECIAL [ARRAYED_LIST [INTEGER]]
			-- Stack for semantic values of type ARRAYED_LIST [INTEGER]

	yyvsc31: INTEGER
			-- Capacity of semantic value stack `yyvs31'

	yyvsp31: INTEGER
			-- Top of semantic value stack `yyvs31'

	yyspecial_routines31: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTEGER]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTEGER]]

	yyvs32: SPECIAL [ARRAYED_LIST [REAL]]
			-- Stack for semantic values of type ARRAYED_LIST [REAL]

	yyvsc32: INTEGER
			-- Capacity of semantic value stack `yyvs32'

	yyvsp32: INTEGER
			-- Top of semantic value stack `yyvs32'

	yyspecial_routines32: KL_SPECIAL_ROUTINES [ARRAYED_LIST [REAL]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [REAL]]

	yyvs33: SPECIAL [ARRAYED_LIST [BOOLEAN]]
			-- Stack for semantic values of type ARRAYED_LIST [BOOLEAN]

	yyvsc33: INTEGER
			-- Capacity of semantic value stack `yyvs33'

	yyvsp33: INTEGER
			-- Top of semantic value stack `yyvs33'

	yyspecial_routines33: KL_SPECIAL_ROUTINES [ARRAYED_LIST [BOOLEAN]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [BOOLEAN]]

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

	yyvs38: SPECIAL [INTERVAL [INTEGER]]
			-- Stack for semantic values of type INTERVAL [INTEGER]

	yyvsc38: INTEGER
			-- Capacity of semantic value stack `yyvs38'

	yyvsp38: INTEGER
			-- Top of semantic value stack `yyvs38'

	yyspecial_routines38: KL_SPECIAL_ROUTINES [INTERVAL [INTEGER]]
			-- Routines that ought to be in SPECIAL [INTERVAL [INTEGER]]

	yyvs39: SPECIAL [INTERVAL [REAL]]
			-- Stack for semantic values of type INTERVAL [REAL]

	yyvsc39: INTEGER
			-- Capacity of semantic value stack `yyvs39'

	yyvsp39: INTEGER
			-- Top of semantic value stack `yyvs39'

	yyspecial_routines39: KL_SPECIAL_ROUTINES [INTERVAL [REAL]]
			-- Routines that ought to be in SPECIAL [INTERVAL [REAL]]

	yyvs40: SPECIAL [INTERVAL [ISO8601_TIME]]
			-- Stack for semantic values of type INTERVAL [ISO8601_TIME]

	yyvsc40: INTEGER
			-- Capacity of semantic value stack `yyvs40'

	yyvsp40: INTEGER
			-- Top of semantic value stack `yyvs40'

	yyspecial_routines40: KL_SPECIAL_ROUTINES [INTERVAL [ISO8601_TIME]]
			-- Routines that ought to be in SPECIAL [INTERVAL [ISO8601_TIME]]

	yyvs41: SPECIAL [INTERVAL [ISO8601_DATE]]
			-- Stack for semantic values of type INTERVAL [ISO8601_DATE]

	yyvsc41: INTEGER
			-- Capacity of semantic value stack `yyvs41'

	yyvsp41: INTEGER
			-- Top of semantic value stack `yyvs41'

	yyspecial_routines41: KL_SPECIAL_ROUTINES [INTERVAL [ISO8601_DATE]]
			-- Routines that ought to be in SPECIAL [INTERVAL [ISO8601_DATE]]

	yyvs42: SPECIAL [INTERVAL [ISO8601_DATE_TIME]]
			-- Stack for semantic values of type INTERVAL [ISO8601_DATE_TIME]

	yyvsc42: INTEGER
			-- Capacity of semantic value stack `yyvs42'

	yyvsp42: INTEGER
			-- Top of semantic value stack `yyvs42'

	yyspecial_routines42: KL_SPECIAL_ROUTINES [INTERVAL [ISO8601_DATE_TIME]]
			-- Routines that ought to be in SPECIAL [INTERVAL [ISO8601_DATE_TIME]]

	yyvs43: SPECIAL [INTERVAL [ISO8601_DURATION]]
			-- Stack for semantic values of type INTERVAL [ISO8601_DURATION]

	yyvsc43: INTEGER
			-- Capacity of semantic value stack `yyvs43'

	yyvsp43: INTEGER
			-- Top of semantic value stack `yyvs43'

	yyspecial_routines43: KL_SPECIAL_ROUTINES [INTERVAL [ISO8601_DURATION]]
			-- Routines that ought to be in SPECIAL [INTERVAL [ISO8601_DURATION]]

	yyvs44: SPECIAL [ARRAYED_LIST [INTERVAL [INTEGER]]]
			-- Stack for semantic values of type ARRAYED_LIST [INTERVAL [INTEGER]]

	yyvsc44: INTEGER
			-- Capacity of semantic value stack `yyvs44'

	yyvsp44: INTEGER
			-- Top of semantic value stack `yyvs44'

	yyspecial_routines44: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTERVAL [INTEGER]]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTERVAL [INTEGER]]]

	yyvs45: SPECIAL [ARRAYED_LIST [INTERVAL [REAL]]]
			-- Stack for semantic values of type ARRAYED_LIST [INTERVAL [REAL]]

	yyvsc45: INTEGER
			-- Capacity of semantic value stack `yyvs45'

	yyvsp45: INTEGER
			-- Top of semantic value stack `yyvs45'

	yyspecial_routines45: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTERVAL [REAL]]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTERVAL [REAL]]]

	yyvs46: SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_TIME]]]
			-- Stack for semantic values of type ARRAYED_LIST [INTERVAL [ISO8601_TIME]]

	yyvsc46: INTEGER
			-- Capacity of semantic value stack `yyvs46'

	yyvsp46: INTEGER
			-- Top of semantic value stack `yyvs46'

	yyspecial_routines46: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTERVAL [ISO8601_TIME]]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_TIME]]]

	yyvs47: SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_DATE]]]
			-- Stack for semantic values of type ARRAYED_LIST [INTERVAL [ISO8601_DATE]]

	yyvsc47: INTEGER
			-- Capacity of semantic value stack `yyvs47'

	yyvsp47: INTEGER
			-- Top of semantic value stack `yyvs47'

	yyspecial_routines47: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTERVAL [ISO8601_DATE]]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_DATE]]]

	yyvs48: SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_DATE_TIME]]]
			-- Stack for semantic values of type ARRAYED_LIST [INTERVAL [ISO8601_DATE_TIME]]

	yyvsc48: INTEGER
			-- Capacity of semantic value stack `yyvs48'

	yyvsp48: INTEGER
			-- Top of semantic value stack `yyvs48'

	yyspecial_routines48: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTERVAL [ISO8601_DATE_TIME]]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_DATE_TIME]]]

	yyvs49: SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_DURATION]]]
			-- Stack for semantic values of type ARRAYED_LIST [INTERVAL [ISO8601_DURATION]]

	yyvsc49: INTEGER
			-- Capacity of semantic value stack `yyvs49'

	yyvsp49: INTEGER
			-- Top of semantic value stack `yyvs49'

	yyspecial_routines49: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTERVAL [ISO8601_DURATION]]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_DURATION]]]

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

	yyvs58: SPECIAL [C_TERMINOLOGY_CODE]
			-- Stack for semantic values of type C_TERMINOLOGY_CODE

	yyvsc58: INTEGER
			-- Capacity of semantic value stack `yyvs58'

	yyvsp58: INTEGER
			-- Top of semantic value stack `yyvs58'

	yyspecial_routines58: KL_SPECIAL_ROUTINES [C_TERMINOLOGY_CODE]
			-- Routines that ought to be in SPECIAL [C_TERMINOLOGY_CODE]

feature {NONE} -- Constants

	yyFinal: INTEGER = 561
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 92
			-- Number of tokens

	yyLast: INTEGER = 875
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 333
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 181
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



feature -- Definitions

	Unbounded_value: INTEGER = -1

feature -- Initialization

	make
		do
			make_scanner
			make_parser_skeleton
			create object_nodes.make (0)
			create c_attrs.make (0)
			create time_vc
			create date_vc
			create str.make_empty
			create indent.make_empty
			create rm_attribute_name.make_empty
			create parent_path_str.make_empty
		end

	reset
		do
			precursor
			validator_reset
			accept
		end

	execute (in_text:STRING; a_source_start_line: INTEGER; aca: ARCH_CAT_ARCHETYPE)
		do
			reset

			target_descriptor := aca
			rm_schema := aca.rm_schema
			if target_descriptor.is_specialised then
				flat_ancestor := target_descriptor.specialisation_ancestor.flat_archetype
 			end

			source_start_line := a_source_start_line
			create indent.make_empty

			object_nodes.wipe_out
			c_attrs.wipe_out

			create time_vc
			create date_vc

			fake_code_number := 0

			set_input_buffer (new_string_buffer (in_text))

			compiler_billboard.initialise

			parse
		end

	error_loc: STRING
		do
			create Result.make_empty
			if attached {YY_FILE_BUFFER} input_buffer as f_buffer then
				Result.append (f_buffer.file.name + ", ")
			end
			Result.append ("line " + (in_lineno + source_start_line).out)
			Result.append (" [last token = " + token_name (last_token) + "]")
		end

feature {NONE} -- Implementation

	target_descriptor: detachable ARCH_CAT_ARCHETYPE
		note
			option: stable
		attribute
		end

	flat_ancestor: detachable FLAT_ARCHETYPE
			-- flat version of ancestor archetype, if target is specialised

	rm_schema: BMM_SCHEMA
		attribute
			create Result.default_create
		end

	safe_put_c_attribute_child (an_attr: C_ATTRIBUTE; an_obj: C_OBJECT)
			-- check child object for validity and then put as new child
		require
			Not_already_added: not an_attr.has_child (an_obj)
		do
			debug ("ADL_parse")
				io.put_string (indent + "ATTR_NODE " + an_attr.rm_attribute_name + " put_child (" + 
						an_obj.generating_type + ": " + an_obj.rm_type_name + " [id=" + an_obj.node_id + "])%N") 
			end
			if check_c_attribute_child (an_attr, an_obj) then
				c_attrs.item.put_child (an_obj)
			end
		end

	check_c_attribute_child (an_attr: C_ATTRIBUTE; an_obj: C_OBJECT): BOOLEAN
			-- check a new child node
			-- FIXME: the semantics here should be rationalised with C_ATTRIBUTE.valid_child and related functions
		local
			err_code: STRING
			ar: ARRAYED_LIST[STRING]
		do
			create ar.make (0)
			create err_code.make_empty
			ar.extend (an_obj.generating_type) -- $1
			ar.extend ("node_id=" + an_obj.node_id) -- $2
			ar.extend (an_attr.rm_attribute_name) -- $3

			if an_attr.is_single then
				if an_obj.occurrences /= Void and then (an_obj.occurrences.upper_unbounded or an_obj.occurrences.upper > 1) then
					err_code := ec_VACSO
				elseif an_attr.has_child_with_id (an_obj.node_id) then
					err_code := ec_VACSI
				else
					Result := True
				end
			elseif an_attr.is_multiple then
				if an_attr.has_child_with_id (an_obj.node_id) then
					err_code := ec_VACMM
				elseif (an_attr.cardinality /= Void and then not an_attr.cardinality.interval.upper_unbounded) and 
						(an_obj.occurrences /= Void and then not an_obj.occurrences.upper_unbounded) and
						an_obj.occurrences.upper > an_attr.cardinality.interval.upper then
					err_code := ec_VACMCU
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

	c_attrs: ARRAYED_STACK [C_ATTRIBUTE]
			-- main stack of attributes during construction
		attribute
			create Result.make (0)
		end

	c_diff_attrs: ARRAYED_LIST [C_ATTRIBUTE]
			-- reference list of attributes with differential paths that require a special grafting process
		attribute
			create Result.make (0)
		end

	rm_attribute_name: STRING
	parent_path_str: STRING

	time_vc: TIME_VALIDITY_CHECKER
	date_vc: DATE_VALIDITY_CHECKER

	rm_prop_def: detachable BMM_PROPERTY_DEFINITION

	c_attr_tuple: C_ATTRIBUTE_TUPLE
		attribute
			create Result.make
		end

	c_object_tuple: C_PRIMITIVE_TUPLE
		attribute
			create Result.make
		end

-------------- FOLLOWING TAKEN FROM ODIN_VALIDATOR.Y ---------------
feature {NONE} -- Implementation 

	new_fake_ac_code: STRING
		do
			Result := Fake_adl_14_ac_code_base + fake_code_number.out
			fake_code_number := fake_code_number + 1
		end

	new_fake_at_code: STRING
		do
			Result := Fake_adl_14_at_code_base + fake_code_number.out
			fake_code_number := fake_code_number + 1
		end

	new_fake_node_id: STRING
		do
			Result := Fake_adl_14_node_id_base + fake_code_number.out
			fake_code_number := fake_code_number + 1
		end

	fake_code_number: INTEGER

	at_codes: ARRAYED_LIST [STRING]
		attribute
			create Result.make (0)
		end

	indent: STRING

	str: STRING

	og_path: OG_PATH
		attribute
			create Result.make_root
		end

	archetype_id_parser: ARCHETYPE_HRID_PARSER
		once
			create Result.make
		end

end
