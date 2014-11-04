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
			create yyspecial_routines59
			yyvsc59 := yyInitial_yyvs_size
			yyvs59 := yyspecial_routines59.make (yyvsc59)
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
			yyvsp59 := -1
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
			yyvs59.keep_head (0)
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
				yyspecial_routines2.force (yyvs2, last_integer_value, yyvsp2)
			when 3 then
				yyvsp3 := yyvsp3 + 1
				if yyvsp3 >= yyvsc3 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs3")
					end
					yyvsc3 := yyvsc3 + yyInitial_yyvs_size
					yyvs3 := yyspecial_routines3.aliased_resized_area (yyvs3, yyvsc3)
				end
				yyspecial_routines3.force (yyvs3, last_real_value, yyvsp3)
			when 4 then
				yyvsp4 := yyvsp4 + 1
				if yyvsp4 >= yyvsc4 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs4")
					end
					yyvsc4 := yyvsc4 + yyInitial_yyvs_size
					yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
				end
				yyspecial_routines4.force (yyvs4, last_string_value, yyvsp4)
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
			when 59 then
				yyvsp59 := yyvsp59 - 1
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
			yyval18: C_OBJECT
			yyval9: C_ARCHETYPE_ROOT
			yyval10: C_COMPLEX_OBJECT_PROXY
			yyval19: ARCHETYPE_SLOT
			yyval17: C_PRIMITIVE_OBJECT
			yyval20: C_ATTRIBUTE
			yyval7: detachable ARRAYED_LIST [ASSERTION]
			yyval8: ASSERTION
			yyval21: EXPR_ITEM
			yyval23: EXPR_BINARY_OPERATOR
			yyval22: EXPR_UNARY_OPERATOR
			yyval4: STRING
			yyval24: EXPR_LEAF
			yyval14: detachable MULTIPLICITY_INTERVAL
			yyval12: MULTIPLICITY_INTERVAL
			yyval15: detachable CARDINALITY
			yyval13: CARDINALITY
			yyval58: C_INTEGER
			yyval57: C_REAL
			yyval55: C_DATE
			yyval56: C_TIME
			yyval53: C_DATE_TIME
			yyval54: C_DURATION
			yyval52: C_STRING
			yyval59: C_TERMINOLOGY_CODE
			yyval51: C_BOOLEAN
			yyval31: ARRAYED_LIST [STRING]
			yyval2: INTEGER
			yyval32: ARRAYED_LIST [INTEGER]
			yyval39: INTERVAL [INTEGER]
			yyval45: ARRAYED_LIST [INTERVAL [INTEGER]]
			yyval3: REAL
			yyval33: ARRAYED_LIST [REAL]
			yyval40: INTERVAL [REAL]
			yyval46: ARRAYED_LIST [INTERVAL [REAL]]
			yyval25: BOOLEAN
			yyval34: ARRAYED_LIST [BOOLEAN]
			yyval26: ISO8601_DATE
			yyval35: ARRAYED_LIST [ISO8601_DATE]
			yyval42: INTERVAL [ISO8601_DATE]
			yyval48: ARRAYED_LIST [INTERVAL [ISO8601_DATE]]
			yyval28: ISO8601_TIME
			yyval36: ARRAYED_LIST [ISO8601_TIME]
			yyval41: INTERVAL [ISO8601_TIME]
			yyval47: ARRAYED_LIST [INTERVAL [ISO8601_TIME]]
			yyval27: ISO8601_DATE_TIME
			yyval37: ARRAYED_LIST [ISO8601_DATE_TIME]
			yyval43: INTERVAL [ISO8601_DATE_TIME]
			yyval49: ARRAYED_LIST [INTERVAL [ISO8601_DATE_TIME]]
			yyval29: ISO8601_DURATION
			yyval38: ARRAYED_LIST [ISO8601_DURATION]
			yyval44: INTERVAL [ISO8601_DURATION]
			yyval50: ARRAYED_LIST [INTERVAL [ISO8601_DURATION]]
		do
			if not yy_retried then
				inspect yy_act
when 1 then
--|#line 177 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 177")
end

			debug ("ADL_parse")
				io.put_string ("CADL definition parsed%N")
			end
			output := yyvs16.item (yyvsp16)
			accept
		
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
when 2 then
--|#line 185 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 185")
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
--|#line 193 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 193")
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
--|#line 202 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 202")
end

			debug ("ADL_parse")
				io.put_string (indent + "POP OBJECT_NODE " + yyvs16.item (yyvsp16).rm_type_name + " [id=" + yyvs16.item (yyvsp16).node_id + "]%N") 
				indent.remove_tail (1)
			end
			yyval16 := yyvs16.item (yyvsp16)
			object_nodes.remove
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 5 then
--|#line 211 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 211")
end

			-- ok in case where occurrences or node_id is being redefined in a specialised archetype or template
			debug ("ADL_parse")
				io.put_string (indent + "POP OBJECT_NODE " + yyvs16.item (yyvsp16).rm_type_name + " [id=" + yyvs16.item (yyvsp16).node_id + "]%N") 
				indent.remove_tail (1)
			end
			yyval16 := yyvs16.item (yyvsp16)
			object_nodes.remove
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 6 then
--|#line 223 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 223")
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
			else
				abort_with_error (ec_VCORM, <<yyvs16.item (yyvsp16).rm_type_name, yyvs16.item (yyvsp16).path>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp14 := yyvsp14 -1
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 7 then
--|#line 246 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 246")
end

			if object_nodes.is_empty then
				create yyval16.make (yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4))
			else
				abort_with_error (ec_VARND, <<yyvs4.item (yyvsp4), Id_code_regex_pattern>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp16 := yyvsp16 + 1
	yyvsp4 := yyvsp4 -2
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
--|#line 254 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 254")
end

			if not object_nodes.is_empty then
				create yyval16.make (yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4))
			else
				abort_with_error (ec_VARCN, <<yyvs4.item (yyvsp4), Root_id_code_regex_pattern>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp16 := yyvsp16 + 1
	yyvsp4 := yyvsp4 -2
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
--|#line 265 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 265")
end

			if valid_standard_version (target_descriptor.file_mgr.adl_version) and then 
				version_less_than (target_descriptor.file_mgr.adl_version, Adl_id_code_version) and not object_nodes.is_empty 
			then
				create yyval16.make (yyvs4.item (yyvsp4), new_fake_node_id)
			else
				if not object_nodes.is_empty then
					abort_with_error (ec_VCOID, <<yyvs4.item (yyvsp4), c_attrs.item.path>>)
				else
					abort_with_error (ec_VCOID, <<yyvs4.item (yyvsp4), "/">>)
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp4 := yyvsp4 -1
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
--|#line 284 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 284")
end

			yyval11 := create {SIBLING_ORDER}.make_after (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp11 := yyvsp11 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	if yyvsp11 >= yyvsc11 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs11")
		end
		yyvsc11 := yyvsc11 + yyInitial_yyvs_size
		yyvs11 := yyspecial_routines11.aliased_resized_area (yyvs11, yyvsc11)
	end
	yyspecial_routines11.force (yyvs11, yyval11, yyvsp11)
end
when 11 then
--|#line 288 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 288")
end

			yyval11 := create {SIBLING_ORDER}.make_before (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp11 := yyvsp11 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
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
--|#line 294 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 294")
end

			debug ("ADL_parse")
				io.put_string (indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + 
					" [id=" + object_nodes.item.node_id + "] - any_allowed%N") 
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 13 then
--|#line 301 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 301")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 14 then
--|#line 304 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 304")
end

			abort_with_error (ec_SCOAT, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 15 then
--|#line 314 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 314")
end

			safe_put_c_attribute_child (yyvs18.item (yyvsp18))
		
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
when 16 then
--|#line 318 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 318")
end

			yyvs18.item (yyvsp18).set_sibling_order (yyvs11.item (yyvsp11))
			safe_put_c_attribute_child (yyvs18.item (yyvsp18))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 + 1
	yyvsp11 := yyvsp11 -1
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
when 17 then
--|#line 323 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 323")
end

			safe_put_c_attribute_child (yyvs17.item (yyvsp17))
		
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
when 18 then
--|#line 327 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 327")
end

			abort_with_error (ec_SCCOG, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 19 then
--|#line 333 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 333")
end

			yyval18 := yyvs16.item (yyvsp16)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp18 := yyvsp18 + 1
	yyvsp16 := yyvsp16 -1
	if yyvsp18 >= yyvsc18 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs18")
		end
		yyvsc18 := yyvsc18 + yyInitial_yyvs_size
		yyvs18 := yyspecial_routines18.aliased_resized_area (yyvs18, yyvsc18)
	end
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
when 20 then
--|#line 337 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 337")
end

			yyval18 := yyvs9.item (yyvsp9)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp18 := yyvsp18 + 1
	yyvsp9 := yyvsp9 -1
	if yyvsp18 >= yyvsc18 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs18")
		end
		yyvsc18 := yyvsc18 + yyInitial_yyvs_size
		yyvs18 := yyspecial_routines18.aliased_resized_area (yyvs18, yyvsc18)
	end
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
when 21 then
--|#line 341 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 341")
end

			yyval18 := yyvs10.item (yyvsp10)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp18 := yyvsp18 + 1
	yyvsp10 := yyvsp10 -1
	if yyvsp18 >= yyvsc18 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs18")
		end
		yyvsc18 := yyvsc18 + yyInitial_yyvs_size
		yyvs18 := yyspecial_routines18.aliased_resized_area (yyvs18, yyvsc18)
	end
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
when 22 then
--|#line 345 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 345")
end

			yyval18 := yyvs19.item (yyvsp19)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp18 := yyvsp18 + 1
	yyvsp19 := yyvsp19 -1
	if yyvsp18 >= yyvsc18 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs18")
		end
		yyvsc18 := yyvsc18 + yyInitial_yyvs_size
		yyvs18 := yyspecial_routines18.aliased_resized_area (yyvs18, yyvsc18)
	end
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
when 23 then
--|#line 360 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 360")
end

			id_code := yyvs4.item (yyvsp4).substring (1, yyvs4.item (yyvsp4).index_of (',', 1) - 1)
			archetype_ref := yyvs4.item (yyvsp4).substring (yyvs4.item (yyvsp4).index_of (',', 1) + 1, yyvs4.item (yyvsp4).count)
			if archetype_id_checker.valid_id (archetype_ref) then
				create yyval9.make (yyvs4.item (yyvsp4 - 1), id_code, archetype_ref)
				if attached yyvs14.item (yyvsp14) as occ then
					yyval9.set_occurrences (occ)
				end
			else
				abort_with_error (ec_SUAIDI, <<yyvs4.item (yyvsp4)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp9 := yyvsp9 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -2
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
when 24 then
--|#line 373 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 373")
end

			abort_with_error (ec_SUAID, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp9 := yyvsp9 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp4 := yyvsp4 -1
	if yyvsp9 >= yyvsc9 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs9")
		end
		yyvsc9 := yyvsc9 + yyInitial_yyvs_size
		yyvs9 := yyspecial_routines9.aliased_resized_area (yyvs9, yyvsc9)
	end
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
when 25 then
--|#line 379 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 379")
end

			create yyval10.make (yyvs4.item (yyvsp4 - 2), yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4))
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
	yyvsp4 := yyvsp4 -3
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
--|#line 402 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 402")
end

			if version_less_than (target_descriptor.file_mgr.adl_version, Adl_id_code_version) and not object_nodes.is_empty then
				create yyval10.make (yyvs4.item (yyvsp4 - 1), new_fake_node_id, yyvs4.item (yyvsp4))
				if attached yyvs14.item (yyvsp14) as att_occ then
					yyval10.set_occurrences (att_occ)
				end
			else
				abort_with_error (ec_VCOID, <<yyvs4.item (yyvsp4 - 1), c_attrs.item.path>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp10 := yyvsp10 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -2
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
when 27 then
--|#line 420 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 420")
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
when 28 then
--|#line 426 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 426")
end

			if attached yyvs7.item (yyvsp7 - 1) as att_c_incs then
				yyvs19.item (yyvsp19).set_includes (att_c_incs)
			end
			if attached yyvs7.item (yyvsp7) as att_c_excs then
				yyvs19.item (yyvsp19).set_excludes (att_c_excs)
			end

			debug ("ADL_parse")
				indent.remove_tail (1)
			end
			yyval19 := yyvs19.item (yyvsp19)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp1 := yyvsp1 -3
	yyvsp7 := yyvsp7 -2
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 29 then
--|#line 440 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 440")
end

			yyval19 := yyvs19.item (yyvsp19)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 30 then
--|#line 446 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 446")
end

			if attached yyvs14.item (yyvsp14) as att_occ then
				yyvs19.item (yyvsp19).set_occurrences (att_occ)
			end

			debug ("ADL_parse")
				io.put_string (indent + "create ARCHETYPE_SLOT " + yyvs19.item (yyvsp19).rm_type_name + " [id=" + yyvs19.item (yyvsp19).node_id + "]")
				if attached yyvs14.item (yyvsp14) then
					io.put_string ("; occurrences=(" + yyvs14.item (yyvsp14).as_string + ")") 
				end
				io.new_line
				indent.append ("%T")
			end
			yyval19 := yyvs19.item (yyvsp19)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp14 := yyvsp14 -1
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 31 then
--|#line 464 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 464")
end

			create yyval19.make (yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp19 := yyvsp19 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -2
	if yyvsp19 >= yyvsc19 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs19")
		end
		yyvsc19 := yyvsc19 + yyInitial_yyvs_size
		yyvs19 := yyspecial_routines19.aliased_resized_area (yyvs19, yyvsc19)
	end
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 32 then
--|#line 468 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 468")
end

			create yyval19.make (yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4))
			yyval19.set_closed
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp19 := yyvsp19 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp4 := yyvsp4 -2
	if yyvsp19 >= yyvsc19 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs19")
		end
		yyvsc19 := yyvsc19 + yyInitial_yyvs_size
		yyvs19 := yyspecial_routines19.aliased_resized_area (yyvs19, yyvsc19)
	end
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 33 then
--|#line 476 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 476")
end

			if version_less_than (target_descriptor.file_mgr.adl_version, Adl_id_code_version) and not object_nodes.is_empty then
				create yyval19.make (yyvs4.item (yyvsp4), new_fake_node_id)
			else
				abort_with_error (ec_VCOID, <<yyvs4.item (yyvsp4), c_attrs.item.path>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp19 := yyvsp19 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	if yyvsp19 >= yyvsc19 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs19")
		end
		yyvsc19 := yyvsc19 + yyInitial_yyvs_size
		yyvs19 := yyspecial_routines19.aliased_resized_area (yyvs19, yyvsc19)
	end
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 34 then
--|#line 487 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 487")
end

			abort_with_error (ec_SUAS, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp19 := yyvsp19 + 1
	yyvsp1 := yyvsp1 -2
	if yyvsp19 >= yyvsc19 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs19")
		end
		yyvsc19 := yyvsc19 + yyInitial_yyvs_size
		yyvs19 := yyspecial_routines19.aliased_resized_area (yyvs19, yyvsc19)
	end
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 35 then
--|#line 493 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 493")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_INTEGER: " +  yyvs58.item (yyvsp58).as_string + "%N")
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
when 36 then
--|#line 500 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 500")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_REAL: " +  yyvs57.item (yyvsp57).as_string + "%N")
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
when 37 then
--|#line 507 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 507")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_DATE: " +  yyvs55.item (yyvsp55).as_string + "%N")
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
when 38 then
--|#line 514 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 514")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_TIME: " +  yyvs56.item (yyvsp56).as_string + "%N")
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
when 39 then
--|#line 521 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 521")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_DATE_TIME: " +  yyvs53.item (yyvsp53).as_string + "%N")
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
when 40 then
--|#line 528 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 528")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_DURATION: " +  yyvs54.item (yyvsp54).as_string + "%N")
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
when 41 then
--|#line 535 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 535")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_STRING: " +  yyvs52.item (yyvsp52).as_string + "%N")
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
when 42 then
--|#line 542 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 542")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_TERMINOLOGY_CODE: " +  yyvs59.item (yyvsp59).as_string + "%N")
			end
			yyval17 := yyvs59.item (yyvsp59)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp17 := yyvsp17 + 1
	yyvsp59 := yyvsp59 -1
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
--|#line 549 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 549")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_BOOLEAN: " +  yyvs51.item (yyvsp51).as_string + "%N")
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
when 44 then
--|#line 558 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 558")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 45 then
--|#line 565 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 565")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 46 then
--|#line 568 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 568")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 47 then
--|#line 573 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 573")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 48 then
--|#line 576 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 576")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 49 then
--|#line 581 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 581")
end

			yyval1 := yyvs20.item (yyvsp20)
			debug ("ADL_parse")
				io.put_string (indent + "POP ATTR_NODE " + c_attrs.item.rm_attribute_name + "%N") 
				indent.remove_tail (1)
			end
			c_attrs.remove
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp20 := yyvsp20 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 50 then
--|#line 590 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 590")
end

			yyval1 := yyvs20.item (yyvsp20)
			c_attrs.remove
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp20 := yyvsp20 -1
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
--|#line 595 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 595")
end

			yyval1 := yyvs20.item (yyvsp20)
			abort_with_error (ec_SCAS, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp20 := yyvsp20 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 52 then
--|#line 602 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 602")
end

			rm_attribute_name := yyvs4.item (yyvsp4)
			if not object_nodes.item.has_attribute (rm_attribute_name) then
				if rm_schema.has_property (object_nodes.item.rm_type_name, rm_attribute_name) then
					rm_prop_def := rm_schema.property_definition (object_nodes.item.rm_type_name, rm_attribute_name)
					if rm_prop_def.is_container then
						create yyval20.make_multiple (rm_attribute_name, yyvs14.item (yyvsp14), yyvs15.item (yyvsp15))
						c_attrs.put (yyval20)
debug ("ADL_parse")
	io.put_string (indent + "PUSH create ATTR_NODE " + rm_attribute_name + "; container = " + yyval20.is_multiple.out)
	if attached yyvs14.item (yyvsp14) as att_ex then io.put_string (" existence={" + att_ex.as_string + "}") end
	if attached yyvs15.item (yyvsp15) as att_card then io.put_string ("; cardinality=(" + att_card.as_string + ")") end
	io.new_line
	io.put_string (indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_attribute (REL)%N") 
	indent.append ("%T")
end
						object_nodes.item.put_attribute (yyval20)

					elseif not attached yyvs15.item (yyvsp15) then
						create yyval20.make_single (rm_attribute_name, yyvs14.item (yyvsp14))
						c_attrs.put (yyval20)
debug ("ADL_parse")
	io.put_string (indent + "PUSH create ATTR_NODE " + rm_attribute_name + "; container = " + yyval20.is_multiple.out) 
	if attached yyvs14.item (yyvsp14) as att_ex then io.put_string (" existence={" + att_ex.as_string + "}") end
	io.new_line
	io.put_string (indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_attribute (REL)%N") 
	indent.append ("%T")
end
						object_nodes.item.put_attribute (yyval20)
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
	yyvsp20 := yyvsp20 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp14 := yyvsp14 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 53 then
--|#line 642 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 642")
end

			create og_path.make_from_string (yyvs4.item (yyvsp4))
			rm_attribute_name := og_path.last.attr_name
			parent_path_str := og_path.parent_path.as_string

			if not object_nodes.item.has_attribute (yyvs4.item (yyvsp4)) then
				-- check RM to see if path is valid, and if it is a container
				if rm_schema.has_property_path (object_nodes.item.rm_type_name, yyvs4.item (yyvsp4)) then
					rm_prop_def := rm_schema.property_definition_at_path (object_nodes.item.rm_type_name, yyvs4.item (yyvsp4))
					if rm_prop_def.is_container then
						create yyval20.make_multiple (rm_attribute_name, yyvs14.item (yyvsp14), yyvs15.item (yyvsp15))
						yyval20.set_differential_path (parent_path_str)
						c_attrs.put (yyval20)
debug ("ADL_parse")
	io.put_string (indent + "PUSH create ATTR_NODE " + yyvs4.item (yyvsp4) + "; container = " + yyval20.is_multiple.out) 
	if attached yyvs14.item (yyvsp14) as att_ex then io.put_string (" existence={" + att_ex.as_string + "}") end
	if attached yyvs15.item (yyvsp15) as att_card then io.put_string ("; cardinality=(" + att_card.as_string + ")") end
	io.new_line
	io.put_string (indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_attribute (REL)%N") 
	indent.append ("%T")
end
						object_nodes.item.put_attribute (yyval20)

					elseif not attached yyvs15.item (yyvsp15) then
						create yyval20.make_single (rm_attribute_name, yyvs14.item (yyvsp14))
						yyval20.set_differential_path (parent_path_str)
						c_attrs.put (yyval20)
debug ("ADL_parse")
	io.put_string (indent + "PUSH create ATTR_NODE " + yyvs4.item (yyvsp4) + "; container = " + yyval20.is_multiple.out) 
	if attached yyvs14.item (yyvsp14) as att_ex then io.put_string (" existence={" + att_ex.as_string + "}") end
	io.new_line
	io.put_string (indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_attribute (REL)%N") 
	indent.append ("%T")
end
						object_nodes.item.put_attribute (yyval20)
					else -- error - cardinality stated, but on a non-container attribute
						abort_with_error (ec_VSAM2, <<yyvs4.item (yyvsp4)>>)
					end
				else
					abort_with_error (ec_VDIFP2, <<yyvs4.item (yyvsp4)>>)
				end
			else
				abort_with_error (ec_VCATU, <<yyvs4.item (yyvsp4)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp20 := yyvsp20 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp14 := yyvsp14 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 54 then
--|#line 690 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 690")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 55 then
--|#line 693 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 693")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 56 then
--|#line 696 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 696")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 57 then
--|#line 701 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 701")
end

			-- add the tuple's C_ATTRIBUTEs to the current object node's children
			across ca_tuple.members as c_attrs_csr loop
				if not object_nodes.item.has_attribute (c_attrs_csr.item.rm_attribute_name) then
					object_nodes.item.put_attribute (c_attrs_csr.item)
				else
					abort_with_error (ec_VCATU, <<c_attrs_csr.item.rm_attribute_name>>)
				end
			end

			-- add the tuple to the current object node
			object_nodes.item.put_attribute_tuple (ca_tuple)

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
--|#line 722 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 722")
end

			create ca_tuple.make
			ca_tuple.put_member (create {C_ATTRIBUTE}.make_single (yyvs4.item (yyvsp4), Void))
			debug ("ADL_parse")
				io.put_string (indent + "enter C_ATTR_TUPLE%N") 
				indent.append ("%T")
				io.put_string (indent + "add C_ATTR_TUPLE id " + yyvs4.item (yyvsp4) + "%N") 
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp4 := yyvsp4 -1
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
--|#line 732 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 732")
end

			ca_tuple.put_member (create {C_ATTRIBUTE}.make_single (yyvs4.item (yyvsp4), Void))
			debug ("ADL_parse")
				io.put_string (indent + "add C_ATTR_TUPLE id " + yyvs4.item (yyvsp4) + "%N") 
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 60 then
--|#line 741 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 741")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 61 then
--|#line 744 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 744")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 62 then
--|#line 749 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 749")
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
--|#line 757 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 757")
end

			ca_tuple.add_tuple

			-- attach the C_PRIMITIVE_OBJECT under the C_ATTRIBUTE
			ca_tuple.i_th_member (ca_tuple.tuples.last.count + 1).put_child (yyvs17.item (yyvsp17))

			-- attach the C_PRIMITIVE_OBJECT under the new C_PRIMITIVE_TUPLE
			ca_tuple.tuples.last.put_member (yyvs17.item (yyvsp17))
			debug ("ADL_parse")
				io.put_string (indent + "c_tuple values - add C_PRIMITIVE_OBJECT " + ca_tuple.i_th_member (1).rm_attribute_name + " %N")
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp17 := yyvsp17 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 64 then
--|#line 770 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 770")
end

			-- attach the C_PRIMITIVE_OBJECT under the C_ATTRIBUTE
			ca_tuple.i_th_member (ca_tuple.tuples.last.count + 1).put_child (yyvs17.item (yyvsp17))
			ca_tuple.tuples.last.put_member (yyvs17.item (yyvsp17))
			debug ("ADL_parse")
				io.put_string (indent + "c_tuple values - add other C_PRIMITIVE_OBJECT " + ca_tuple.i_th_member (ca_tuple.tuples.last.count + 1).rm_attribute_name + " %N")
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp17 := yyvsp17 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 65 then
--|#line 781 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 781")
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
--|#line 782 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 782")
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
--|#line 791 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 791")
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
--|#line 792 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 792")
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
--|#line 805 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 805")
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
--|#line 810 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 810")
end

			yyvs7.item (yyvsp7).extend (yyvs8.item (yyvsp8))
			yyval7 := yyvs7.item (yyvsp7)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp8 := yyvsp8 -1
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 71 then
--|#line 817 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 817")
end

			create yyval8.make (yyvs21.item (yyvsp21), yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp8 := yyvsp8 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -1
	yyvsp21 := yyvsp21 -1
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
--|#line 821 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 821")
end

			create yyval8.make (yyvs21.item (yyvsp21), Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp8 := yyvsp8 + 1
	yyvsp21 := yyvsp21 -1
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
--|#line 829 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 829")
end

			create yyval8.make (yyvs23.item (yyvsp23), Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp8 := yyvsp8 + 1
	yyvsp23 := yyvsp23 -1
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
--|#line 833 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 833")
end

			abort_with_error (ec_SINVS, <<yyvs4.item (yyvsp4)>>)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp8 := yyvsp8 + 1
	yyvsp4 := yyvsp4 -1
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
--|#line 841 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 841")
end

			yyval21 := yyvs21.item (yyvsp21)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 76 then
--|#line 845 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 845")
end

			yyval21 := yyvs21.item (yyvsp21)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 77 then
--|#line 851 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 851")
end

			debug ("ADL_rule")
				io.put_string (indent + "boolean_expr: REDUCE from boolean_unop_expr: [" + yyvs22.item (yyvsp22).as_string + "]%N") 
			end
			yyval21 := yyvs22.item (yyvsp22)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp21 := yyvsp21 + 1
	yyvsp22 := yyvsp22 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 78 then
--|#line 858 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 858")
end

			yyval21 := yyvs23.item (yyvsp23)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp21 := yyvsp21 + 1
	yyvsp23 := yyvsp23 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 79 then
--|#line 864 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 864")
end

			yyval21 := yyvs24.item (yyvsp24)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp21 := yyvsp21 + 1
	yyvsp24 := yyvsp24 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 80 then
--|#line 868 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 868")
end

			debug ("ADL_rule")
				io.put_string (indent + "boolean_leaf: REDUCE from boolean_constraint: [" + yyvs23.item (yyvsp23).as_string + "]%N") 
			end
			yyval21 := yyvs23.item (yyvsp23)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp21 := yyvsp21 + 1
	yyvsp23 := yyvsp23 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 81 then
--|#line 875 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 875")
end

			yyval21 := yyvs21.item (yyvsp21)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 82 then
--|#line 879 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 879")
end

			yyval21 := yyvs23.item (yyvsp23)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp21 := yyvsp21 + 1
	yyvsp23 := yyvsp23 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 83 then
--|#line 889 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 889")
end

			debug ("ADL_rule")
				io.put_string (indent + "arch_outer_constraint_expr: Archetype outer feature " + yyvs4.item (yyvsp4) + " matches {" + yyvs17.item (yyvsp17).as_string + "}%N") 
			end
			create yyval23.make (create {OPERATOR_KIND}.make (op_matches),
				create {EXPR_LEAF}.make_archetype_ref (yyvs4.item (yyvsp4)),
				create {EXPR_LEAF}.make_constraint (yyvs17.item (yyvsp17)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp23 := yyvsp23 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -3
	yyvsp17 := yyvsp17 -1
	if yyvsp23 >= yyvsc23 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs23")
		end
		yyvsc23 := yyvsc23 + yyInitial_yyvs_size
		yyvs23 := yyspecial_routines23.aliased_resized_area (yyvs23, yyvsc23)
	end
	yyspecial_routines23.force (yyvs23, yyval23, yyvsp23)
end
when 84 then
--|#line 900 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 900")
end

			debug ("ADL_rule")
				io.put_string (indent + "boolean_constraint:" + yyvs4.item (yyvsp4) + " matches {" + yyvs17.item (yyvsp17).as_string + "}%N") 
			end
			create yyval23.make (create {OPERATOR_KIND}.make (op_matches), 
				create {EXPR_LEAF}.make_archetype_definition_ref (yyvs4.item (yyvsp4)),
				create {EXPR_LEAF}.make_constraint (yyvs17.item (yyvsp17)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp23 := yyvsp23 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -3
	yyvsp17 := yyvsp17 -1
	if yyvsp23 >= yyvsc23 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs23")
		end
		yyvsc23 := yyvsc23 + yyInitial_yyvs_size
		yyvs23 := yyspecial_routines23.aliased_resized_area (yyvs23, yyvsc23)
	end
	yyspecial_routines23.force (yyvs23, yyval23, yyvsp23)
end
when 85 then
--|#line 909 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 909")
end

			debug ("ADL_rule")
				io.put_string (indent + "boolean_constraint:" + yyvs4.item (yyvsp4) + " matches {" + yyvs59.item (yyvsp59).as_string + "}%N") 
			end
			create yyval23.make (create {OPERATOR_KIND}.make (op_matches), 
				create {EXPR_LEAF}.make_archetype_definition_ref (yyvs4.item (yyvsp4)),
				create {EXPR_LEAF}.make_coded_term (yyvs59.item (yyvsp59)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp23 := yyvsp23 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -3
	yyvsp59 := yyvsp59 -1
	if yyvsp23 >= yyvsc23 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs23")
		end
		yyvsc23 := yyvsc23 + yyInitial_yyvs_size
		yyvs23 := yyspecial_routines23.aliased_resized_area (yyvs23, yyvsc23)
	end
	yyspecial_routines23.force (yyvs23, yyval23, yyvsp23)
end
when 86 then
--|#line 924 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 924")
end

			debug ("ADL_rule")
				io.put_string (indent + "boolean_unop_expr: exists " + yyvs4.item (yyvsp4) + "%N") 
			end
			create yyval22.make (create {OPERATOR_KIND}.make (op_exists), create {EXPR_LEAF}.make_archetype_definition_ref (yyvs4.item (yyvsp4)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp22 := yyvsp22 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
when 87 then
--|#line 931 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 931")
end

			debug ("ADL_rule")
				io.put_string (indent + "boolean_unop_expr: not " + yyvs4.item (yyvsp4) + "%N") 
			end
			create yyval22.make (create {OPERATOR_KIND}.make (op_not), create {EXPR_LEAF}.make_archetype_definition_ref (yyvs4.item (yyvsp4)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp22 := yyvsp22 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
when 88 then
--|#line 938 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 938")
end

			debug ("ADL_rule")
				io.put_string (indent + "boolean_unop_expr: not [(" + yyvs21.item (yyvsp21).as_string + ")] %N") 
			end
			create yyval22.make (create {OPERATOR_KIND}.make (op_not), yyvs21.item (yyvsp21))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp22 := yyvsp22 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp21 := yyvsp21 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
when 89 then
--|#line 945 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 945")
end

			abort_with_error (ec_SEXPT, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp22 := yyvsp22 + 1
	yyvsp1 := yyvsp1 -2
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
when 90 then
--|#line 955 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 955")
end

			debug ("ADL_rule")
				io.put_string (indent + "boolean_binop_expr: [" + yyvs21.item (yyvsp21 - 1).as_string + "] " + yyvs4.item (yyvsp4) + " [" + yyvs21.item (yyvsp21).as_string + "]%N") 
			end
			create yyval23.make (create {OPERATOR_KIND}.make (operator_ids_from_symbols.item (yyvs4.item (yyvsp4))), yyvs21.item (yyvsp21 - 1), yyvs21.item (yyvsp21))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp23 := yyvsp23 + 1
	yyvsp21 := yyvsp21 -2
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
when 91 then
--|#line 964 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 964")
end

			yyval4 := operator_symbol (op_or)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp4 >= yyvsc4 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs4")
		end
		yyvsc4 := yyvsc4 + yyInitial_yyvs_size
		yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
	end
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 92 then
--|#line 968 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 968")
end

			yyval4 := operator_symbol (op_and)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp4 >= yyvsc4 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs4")
		end
		yyvsc4 := yyvsc4 + yyInitial_yyvs_size
		yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
	end
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 93 then
--|#line 972 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 972")
end

			yyval4 := operator_symbol (op_xor)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp4 >= yyvsc4 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs4")
		end
		yyvsc4 := yyvsc4 + yyInitial_yyvs_size
		yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
	end
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 94 then
--|#line 976 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 976")
end

			yyval4 := operator_symbol (op_implies)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp4 >= yyvsc4 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs4")
		end
		yyvsc4 := yyvsc4 + yyInitial_yyvs_size
		yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
	end
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 95 then
--|#line 986 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 986")
end

			create yyval24.make_boolean (True)
		
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
when 96 then
--|#line 990 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 990")
end

			create yyval24.make_boolean (False)
		
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
when 97 then
--|#line 1000 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1000")
end

			debug ("ADL_rule")
				io.put_string (indent + "arithmetic_relop_expr: [" + yyvs21.item (yyvsp21 - 1).as_string + "] " + yyvs4.item (yyvsp4) + " [" + yyvs21.item (yyvsp21).as_string + "]%N") 
			end
			create yyval23.make (create {OPERATOR_KIND}.make (operator_ids_from_symbols.item (yyvs4.item (yyvsp4))), yyvs21.item (yyvsp21 - 1), yyvs21.item (yyvsp21))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp23 := yyvsp23 + 1
	yyvsp21 := yyvsp21 -2
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
when 98 then
--|#line 1013 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1013")
end

			yyval21 := yyvs21.item (yyvsp21)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 99 then
--|#line 1017 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1017")
end

			yyval21 := yyvs23.item (yyvsp23)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp21 := yyvsp21 + 1
	yyvsp23 := yyvsp23 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 100 then
--|#line 1023 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1023")
end

			yyval21 := yyvs24.item (yyvsp24)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp21 := yyvsp21 + 1
	yyvsp24 := yyvsp24 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 101 then
--|#line 1027 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1027")
end

			debug ("ADL_rule")
				io.put_string (indent + "(expr) %N") 
			end
			yyval21 := yyvs21.item (yyvsp21)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 102 then
--|#line 1040 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1040")
end

			debug ("ADL_rule")
				io.put_string (indent + "arithmetic_arith_binop_expr: [" + yyvs21.item (yyvsp21 - 1).as_string + "] " + yyvs4.item (yyvsp4) + " [" + yyvs21.item (yyvsp21).as_string + "]%N") 
			end
			create yyval23.make (create {OPERATOR_KIND}.make (operator_ids_from_symbols.item (yyvs4.item (yyvsp4))), yyvs21.item (yyvsp21 - 1), yyvs21.item (yyvsp21))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp23 := yyvsp23 + 1
	yyvsp21 := yyvsp21 -2
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
when 103 then
--|#line 1053 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1053")
end

			debug ("ADL_rule")
				io.put_string (indent + "arith_leaf - integer: " + yyvs2.item (yyvsp2).out + "%N") 
			end
			create yyval24.make_integer (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp24 := yyvsp24 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp24 >= yyvsc24 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs24")
		end
		yyvsc24 := yyvsc24 + yyInitial_yyvs_size
		yyvs24 := yyspecial_routines24.aliased_resized_area (yyvs24, yyvsc24)
	end
	yyspecial_routines24.force (yyvs24, yyval24, yyvsp24)
end
when 104 then
--|#line 1060 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1060")
end

			debug ("ADL_rule")
				io.put_string (indent + "arith_leaf - real: " + yyvs3.item (yyvsp3).out + "%N") 
			end
			create yyval24.make_real (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp24 := yyvsp24 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp24 >= yyvsc24 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs24")
		end
		yyvsc24 := yyvsc24 + yyInitial_yyvs_size
		yyvs24 := yyspecial_routines24.aliased_resized_area (yyvs24, yyvsc24)
	end
	yyspecial_routines24.force (yyvs24, yyval24, yyvsp24)
end
when 105 then
--|#line 1067 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1067")
end

			debug ("ADL_rule")
				io.put_string (indent + "arith_leaf - path: " + yyvs4.item (yyvsp4) + "%N") 
			end
			create yyval24.make_archetype_definition_ref (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp24 := yyvsp24 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp24 >= yyvsc24 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs24")
		end
		yyvsc24 := yyvsc24 + yyInitial_yyvs_size
		yyvs24 := yyspecial_routines24.aliased_resized_area (yyvs24, yyvsc24)
	end
	yyspecial_routines24.force (yyvs24, yyval24, yyvsp24)
end
when 106 then
--|#line 1076 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1076")
end

			yyval4 := operator_symbol (op_eq)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp4 >= yyvsc4 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs4")
		end
		yyvsc4 := yyvsc4 + yyInitial_yyvs_size
		yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
	end
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 107 then
--|#line 1080 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1080")
end

			yyval4 := operator_symbol (op_ne)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp4 >= yyvsc4 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs4")
		end
		yyvsc4 := yyvsc4 + yyInitial_yyvs_size
		yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
	end
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 108 then
--|#line 1084 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1084")
end

			yyval4 := operator_symbol (op_le)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp4 >= yyvsc4 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs4")
		end
		yyvsc4 := yyvsc4 + yyInitial_yyvs_size
		yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
	end
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 109 then
--|#line 1088 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1088")
end

			yyval4 := operator_symbol (op_lt)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp4 >= yyvsc4 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs4")
		end
		yyvsc4 := yyvsc4 + yyInitial_yyvs_size
		yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
	end
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 110 then
--|#line 1092 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1092")
end

			yyval4 := operator_symbol (op_ge)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp4 >= yyvsc4 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs4")
		end
		yyvsc4 := yyvsc4 + yyInitial_yyvs_size
		yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
	end
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 111 then
--|#line 1096 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1096")
end

			yyval4 := operator_symbol (op_gt)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp4 >= yyvsc4 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs4")
		end
		yyvsc4 := yyvsc4 + yyInitial_yyvs_size
		yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
	end
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 112 then
--|#line 1102 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1102")
end

			yyval4 := operator_symbol (op_divide)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp4 >= yyvsc4 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs4")
		end
		yyvsc4 := yyvsc4 + yyInitial_yyvs_size
		yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
	end
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 113 then
--|#line 1106 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1106")
end

			yyval4 := operator_symbol (op_multiply)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp4 >= yyvsc4 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs4")
		end
		yyvsc4 := yyvsc4 + yyInitial_yyvs_size
		yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
	end
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 114 then
--|#line 1110 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1110")
end

			yyval4 := operator_symbol (op_plus)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp4 >= yyvsc4 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs4")
		end
		yyvsc4 := yyvsc4 + yyInitial_yyvs_size
		yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
	end
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 115 then
--|#line 1114 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1114")
end

			yyval4 := operator_symbol (op_minus)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp4 >= yyvsc4 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs4")
		end
		yyvsc4 := yyvsc4 + yyInitial_yyvs_size
		yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
	end
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 116 then
--|#line 1118 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1118")
end

			yyval4 := operator_symbol (op_exp)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp4 >= yyvsc4 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs4")
		end
		yyvsc4 := yyvsc4 + yyInitial_yyvs_size
		yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
	end
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 117 then
--|#line 1127 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1127")
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
--|#line 1128 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1128")
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
--|#line 1134 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1134")
end

			if yyvs2.item (yyvsp2) = 0 then
				create yyval12.make_prohibited
			elseif yyvs2.item (yyvsp2) = 1 then
				create yyval12.make_mandatory
			else
				abort_with_error (ec_SEXLSG, Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp12 := yyvsp12 + 1
	yyvsp2 := yyvsp2 -1
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
--|#line 1144 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1144")
end

			if yyvs2.item (yyvsp2 - 1) = 0 then
				if yyvs2.item (yyvsp2) = 0 then
					create yyval12.make_point (0)
				elseif yyvs2.item (yyvsp2) = 1 then
					create yyval12.make_bounded (0, 1)
				else
					abort_with_error (ec_SEXLU1, Void)
				end
			elseif yyvs2.item (yyvsp2 - 1) = 1 then
				if yyvs2.item (yyvsp2) = 1 then
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
	yyvsp2 := yyvsp2 -2
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
--|#line 1166 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1166")
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
--|#line 1167 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1167")
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
--|#line 1173 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1173")
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
--|#line 1177 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1177")
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
--|#line 1181 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1181")
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
--|#line 1186 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1186")
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
--|#line 1191 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1191")
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
--|#line 1196 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1196")
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
--|#line 1202 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1202")
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
--|#line 1207 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1207")
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
--|#line 1215 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1215")
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
--|#line 1216 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1216")
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
--|#line 1220 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1220")
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
--|#line 1226 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1226")
end

			create yyval12.make_point (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp12 := yyvsp12 + 1
	yyvsp2 := yyvsp2 -1
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
--|#line 1230 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1230")
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
--|#line 1234 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1234")
end

			create yyval12.make_bounded (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp12 := yyvsp12 + 1
	yyvsp2 := yyvsp2 -2
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
--|#line 1238 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1238")
end

			create yyval12.make_upper_unbounded (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp12 := yyvsp12 + 1
	yyvsp2 := yyvsp2 -1
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
--|#line 1246 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1246")
end

			create yyval58.make_value (yyvs2.item (yyvsp2))
		
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
when 139 then
--|#line 1250 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1250")
end

			create yyval58.make_value_list (yyvs32.item (yyvsp32))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp58 := yyvsp58 + 1
	yyvsp32 := yyvsp32 -1
	if yyvsp58 >= yyvsc58 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs58")
		end
		yyvsc58 := yyvsc58 + yyInitial_yyvs_size
		yyvs58 := yyspecial_routines58.aliased_resized_area (yyvs58, yyvsc58)
	end
	yyspecial_routines58.force (yyvs58, yyval58, yyvsp58)
end
when 140 then
--|#line 1254 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1254")
end

			create yyval58.make_interval (yyvs39.item (yyvsp39))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp58 := yyvsp58 + 1
	yyvsp39 := yyvsp39 -1
	if yyvsp58 >= yyvsc58 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs58")
		end
		yyvsc58 := yyvsc58 + yyInitial_yyvs_size
		yyvs58 := yyspecial_routines58.aliased_resized_area (yyvs58, yyvsc58)
	end
	yyspecial_routines58.force (yyvs58, yyval58, yyvsp58)
end
when 141 then
--|#line 1258 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1258")
end

			create yyval58.make (yyvs45.item (yyvsp45))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp58 := yyvsp58 + 1
	yyvsp45 := yyvsp45 -1
	if yyvsp58 >= yyvsc58 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs58")
		end
		yyvsc58 := yyvsc58 + yyInitial_yyvs_size
		yyvs58 := yyspecial_routines58.aliased_resized_area (yyvs58, yyvsc58)
	end
	yyspecial_routines58.force (yyvs58, yyval58, yyvsp58)
end
when 142 then
--|#line 1262 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1262")
end

			if yyvs58.item (yyvsp58).valid_value (yyvs2.item (yyvsp2)) then
				yyvs58.item (yyvsp58).set_assumed_value (yyvs2.item (yyvsp2))
				yyval58 := yyvs58.item (yyvsp58)
			else
				abort_with_error (ec_VOBAV, <<yyvs2.item (yyvsp2).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines58.force (yyvs58, yyval58, yyvsp58)
end
when 143 then
--|#line 1271 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1271")
end

			abort_with_error (ec_SCIAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines58.force (yyvs58, yyval58, yyvsp58)
end
when 144 then
--|#line 1277 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1277")
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
when 145 then
--|#line 1281 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1281")
end

			create yyval57.make_value_list (yyvs33.item (yyvsp33))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp57 := yyvsp57 + 1
	yyvsp33 := yyvsp33 -1
	if yyvsp57 >= yyvsc57 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs57")
		end
		yyvsc57 := yyvsc57 + yyInitial_yyvs_size
		yyvs57 := yyspecial_routines57.aliased_resized_area (yyvs57, yyvsc57)
	end
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
when 146 then
--|#line 1285 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1285")
end

			create yyval57.make_interval (yyvs40.item (yyvsp40))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp57 := yyvsp57 + 1
	yyvsp40 := yyvsp40 -1
	if yyvsp57 >= yyvsc57 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs57")
		end
		yyvsc57 := yyvsc57 + yyInitial_yyvs_size
		yyvs57 := yyspecial_routines57.aliased_resized_area (yyvs57, yyvsc57)
	end
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
when 147 then
--|#line 1289 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1289")
end

			create yyval57.make (yyvs46.item (yyvsp46))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp57 := yyvsp57 + 1
	yyvsp46 := yyvsp46 -1
	if yyvsp57 >= yyvsc57 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs57")
		end
		yyvsc57 := yyvsc57 + yyInitial_yyvs_size
		yyvs57 := yyspecial_routines57.aliased_resized_area (yyvs57, yyvsc57)
	end
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
when 148 then
--|#line 1293 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1293")
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
when 149 then
--|#line 1302 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1302")
end

			abort_with_error (ec_SCRAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
when 150 then
--|#line 1308 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1308")
end

			if valid_iso8601_date_constraint_pattern (yyvs4.item (yyvsp4)) then
				create yyval55.make_from_pattern (yyvs4.item (yyvsp4))
			else
				create str.make (0)
				from valid_date_constraint_patterns.start until valid_date_constraint_patterns.off loop
					if not valid_date_constraint_patterns.isfirst then
						str.append (", ")
					end
					str.append (valid_date_constraint_patterns.item)
					valid_date_constraint_patterns.forth
				end
				abort_with_error (ec_SCDPT, <<yyvs4.item (yyvsp4), str>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp55 := yyvsp55 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp55 >= yyvsc55 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs55")
		end
		yyvsc55 := yyvsc55 + yyInitial_yyvs_size
		yyvs55 := yyspecial_routines55.aliased_resized_area (yyvs55, yyvsc55)
	end
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
when 151 then
--|#line 1324 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1324")
end

			create yyval55.make_value (yyvs26.item (yyvsp26))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp55 := yyvsp55 + 1
	yyvsp26 := yyvsp26 -1
	if yyvsp55 >= yyvsc55 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs55")
		end
		yyvsc55 := yyvsc55 + yyInitial_yyvs_size
		yyvs55 := yyspecial_routines55.aliased_resized_area (yyvs55, yyvsc55)
	end
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
when 152 then
--|#line 1328 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1328")
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
when 153 then
--|#line 1332 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1332")
end

			create yyval55.make_interval (yyvs42.item (yyvsp42))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp55 := yyvsp55 + 1
	yyvsp42 := yyvsp42 -1
	if yyvsp55 >= yyvsc55 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs55")
		end
		yyvsc55 := yyvsc55 + yyInitial_yyvs_size
		yyvs55 := yyspecial_routines55.aliased_resized_area (yyvs55, yyvsc55)
	end
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
when 154 then
--|#line 1336 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1336")
end

			create yyval55.make (yyvs48.item (yyvsp48))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp55 := yyvsp55 + 1
	yyvsp48 := yyvsp48 -1
	if yyvsp55 >= yyvsc55 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs55")
		end
		yyvsc55 := yyvsc55 + yyInitial_yyvs_size
		yyvs55 := yyspecial_routines55.aliased_resized_area (yyvs55, yyvsc55)
	end
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
when 155 then
--|#line 1340 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1340")
end

			if yyvs55.item (yyvsp55).valid_value (yyvs26.item (yyvsp26)) then
				yyvs55.item (yyvsp55).set_assumed_value (yyvs26.item (yyvsp26))
				yyval55 := yyvs55.item (yyvsp55)
			else
				abort_with_error (ec_VOBAV, <<yyvs26.item (yyvsp26).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp26 := yyvsp26 -1
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
when 156 then
--|#line 1349 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1349")
end

			abort_with_error (ec_SCDAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
when 157 then
--|#line 1355 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1355")
end

			if valid_iso8601_time_constraint_pattern (yyvs4.item (yyvsp4)) then
				create yyval56.make_from_pattern (yyvs4.item (yyvsp4))
			else
				create str.make (0)
				across valid_time_constraint_patterns as patterns_csr loop
					if patterns_csr.cursor_index > 1 then
						str.append (", ")
					end
					str.append (patterns_csr.item)
				end
				abort_with_error (ec_SCTPT, <<yyvs4.item (yyvsp4), str>>)
			end
		
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
when 158 then
--|#line 1370 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1370")
end

			create yyval56.make_value (yyvs28.item (yyvsp28))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp56 := yyvsp56 + 1
	yyvsp28 := yyvsp28 -1
	if yyvsp56 >= yyvsc56 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs56")
		end
		yyvsc56 := yyvsc56 + yyInitial_yyvs_size
		yyvs56 := yyspecial_routines56.aliased_resized_area (yyvs56, yyvsc56)
	end
	yyspecial_routines56.force (yyvs56, yyval56, yyvsp56)
end
when 159 then
--|#line 1374 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1374")
end

			create yyval56.make_value_list (yyvs36.item (yyvsp36))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp56 := yyvsp56 + 1
	yyvsp36 := yyvsp36 -1
	if yyvsp56 >= yyvsc56 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs56")
		end
		yyvsc56 := yyvsc56 + yyInitial_yyvs_size
		yyvs56 := yyspecial_routines56.aliased_resized_area (yyvs56, yyvsc56)
	end
	yyspecial_routines56.force (yyvs56, yyval56, yyvsp56)
end
when 160 then
--|#line 1378 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1378")
end

			create yyval56.make_interval (yyvs41.item (yyvsp41))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp56 := yyvsp56 + 1
	yyvsp41 := yyvsp41 -1
	if yyvsp56 >= yyvsc56 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs56")
		end
		yyvsc56 := yyvsc56 + yyInitial_yyvs_size
		yyvs56 := yyspecial_routines56.aliased_resized_area (yyvs56, yyvsc56)
	end
	yyspecial_routines56.force (yyvs56, yyval56, yyvsp56)
end
when 161 then
--|#line 1382 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1382")
end

			create yyval56.make (yyvs47.item (yyvsp47))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp56 := yyvsp56 + 1
	yyvsp47 := yyvsp47 -1
	if yyvsp56 >= yyvsc56 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs56")
		end
		yyvsc56 := yyvsc56 + yyInitial_yyvs_size
		yyvs56 := yyspecial_routines56.aliased_resized_area (yyvs56, yyvsc56)
	end
	yyspecial_routines56.force (yyvs56, yyval56, yyvsp56)
end
when 162 then
--|#line 1386 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1386")
end

			if yyvs56.item (yyvsp56).valid_value (yyvs28.item (yyvsp28)) then
				yyvs56.item (yyvsp56).set_assumed_value (yyvs28.item (yyvsp28))
				yyval56 := yyvs56.item (yyvsp56)
			else
				abort_with_error (ec_VOBAV, <<yyvs28.item (yyvsp28).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp28 := yyvsp28 -1
	yyspecial_routines56.force (yyvs56, yyval56, yyvsp56)
end
when 163 then
--|#line 1395 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1395")
end

			abort_with_error (ec_SCTAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines56.force (yyvs56, yyval56, yyvsp56)
end
when 164 then
--|#line 1401 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1401")
end

			if valid_iso8601_date_time_constraint_pattern (yyvs4.item (yyvsp4)) then
				create yyval53.make_from_pattern (yyvs4.item (yyvsp4))
			else
				create str.make (0)
				across valid_date_time_constraint_patterns as patterns_csr loop
					if patterns_csr.cursor_index > 1 then
						str.append (", ")
					end
					str.append (patterns_csr.item)
				end
				abort_with_error (ec_SCDTPT, <<yyvs4.item (yyvsp4), str>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp53 := yyvsp53 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp53 >= yyvsc53 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs53")
		end
		yyvsc53 := yyvsc53 + yyInitial_yyvs_size
		yyvs53 := yyspecial_routines53.aliased_resized_area (yyvs53, yyvsc53)
	end
	yyspecial_routines53.force (yyvs53, yyval53, yyvsp53)
end
when 165 then
--|#line 1416 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1416")
end

			create yyval53.make_value (yyvs27.item (yyvsp27))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp53 := yyvsp53 + 1
	yyvsp27 := yyvsp27 -1
	if yyvsp53 >= yyvsc53 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs53")
		end
		yyvsc53 := yyvsc53 + yyInitial_yyvs_size
		yyvs53 := yyspecial_routines53.aliased_resized_area (yyvs53, yyvsc53)
	end
	yyspecial_routines53.force (yyvs53, yyval53, yyvsp53)
end
when 166 then
--|#line 1420 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1420")
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
when 167 then
--|#line 1424 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1424")
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
when 168 then
--|#line 1428 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1428")
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
when 169 then
--|#line 1432 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1432")
end

			if yyvs53.item (yyvsp53).valid_value (yyvs27.item (yyvsp27)) then
				yyvs53.item (yyvsp53).set_assumed_value (yyvs27.item (yyvsp27))
				yyval53 := yyvs53.item (yyvsp53)
			else
				abort_with_error (ec_VOBAV, <<yyvs27.item (yyvsp27).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp27 := yyvsp27 -1
	yyspecial_routines53.force (yyvs53, yyval53, yyvsp53)
end
when 170 then
--|#line 1441 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1441")
end

			abort_with_error (ec_SCDTAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines53.force (yyvs53, yyval53, yyvsp53)
end
when 171 then
--|#line 1447 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1447")
end

			if valid_iso8601_duration_constraint_pattern (yyvs4.item (yyvsp4)) then
				create yyval54.make_pattern_with_range (yyvs4.item (yyvsp4), yyvs44.item (yyvsp44))
			else
				abort_with_error (ec_SCDUPT, <<yyvs4.item (yyvsp4)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp54 := yyvsp54 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -1
	yyvsp44 := yyvsp44 -1
	if yyvsp54 >= yyvsc54 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs54")
		end
		yyvsc54 := yyvsc54 + yyInitial_yyvs_size
		yyvs54 := yyspecial_routines54.aliased_resized_area (yyvs54, yyvsc54)
	end
	yyspecial_routines54.force (yyvs54, yyval54, yyvsp54)
end
when 172 then
--|#line 1455 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1455")
end

			if valid_iso8601_duration_constraint_pattern (yyvs4.item (yyvsp4)) then
				create yyval54.make_pattern_with_range (yyvs4.item (yyvsp4), create {POINT_INTERVAL [ISO8601_DURATION]}.make (yyvs29.item (yyvsp29)))
			else
				abort_with_error (ec_SCDUPT, <<yyvs4.item (yyvsp4)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp54 := yyvsp54 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -1
	yyvsp29 := yyvsp29 -1
	if yyvsp54 >= yyvsc54 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs54")
		end
		yyvsc54 := yyvsc54 + yyInitial_yyvs_size
		yyvs54 := yyspecial_routines54.aliased_resized_area (yyvs54, yyvsc54)
	end
	yyspecial_routines54.force (yyvs54, yyval54, yyvsp54)
end
when 173 then
--|#line 1463 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1463")
end

			if valid_iso8601_duration_constraint_pattern (yyvs4.item (yyvsp4)) then
				create yyval54.make_from_pattern (yyvs4.item (yyvsp4))
			else
				abort_with_error (ec_SCDUPT, <<yyvs4.item (yyvsp4)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp54 := yyvsp54 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp54 >= yyvsc54 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs54")
		end
		yyvsc54 := yyvsc54 + yyInitial_yyvs_size
		yyvs54 := yyspecial_routines54.aliased_resized_area (yyvs54, yyvsc54)
	end
	yyspecial_routines54.force (yyvs54, yyval54, yyvsp54)
end
when 174 then
--|#line 1471 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1471")
end

			create yyval54.make_value (yyvs29.item (yyvsp29))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp54 := yyvsp54 + 1
	yyvsp29 := yyvsp29 -1
	if yyvsp54 >= yyvsc54 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs54")
		end
		yyvsc54 := yyvsc54 + yyInitial_yyvs_size
		yyvs54 := yyspecial_routines54.aliased_resized_area (yyvs54, yyvsc54)
	end
	yyspecial_routines54.force (yyvs54, yyval54, yyvsp54)
end
when 175 then
--|#line 1475 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1475")
end

			create yyval54.make_value_list (yyvs38.item (yyvsp38))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp54 := yyvsp54 + 1
	yyvsp38 := yyvsp38 -1
	if yyvsp54 >= yyvsc54 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs54")
		end
		yyvsc54 := yyvsc54 + yyInitial_yyvs_size
		yyvs54 := yyspecial_routines54.aliased_resized_area (yyvs54, yyvsc54)
	end
	yyspecial_routines54.force (yyvs54, yyval54, yyvsp54)
end
when 176 then
--|#line 1479 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1479")
end

			create yyval54.make_interval (yyvs44.item (yyvsp44))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp54 := yyvsp54 + 1
	yyvsp44 := yyvsp44 -1
	if yyvsp54 >= yyvsc54 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs54")
		end
		yyvsc54 := yyvsc54 + yyInitial_yyvs_size
		yyvs54 := yyspecial_routines54.aliased_resized_area (yyvs54, yyvsc54)
	end
	yyspecial_routines54.force (yyvs54, yyval54, yyvsp54)
end
when 177 then
--|#line 1483 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1483")
end

			create yyval54.make (yyvs50.item (yyvsp50))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp54 := yyvsp54 + 1
	yyvsp50 := yyvsp50 -1
	if yyvsp54 >= yyvsc54 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs54")
		end
		yyvsc54 := yyvsc54 + yyInitial_yyvs_size
		yyvs54 := yyspecial_routines54.aliased_resized_area (yyvs54, yyvsc54)
	end
	yyspecial_routines54.force (yyvs54, yyval54, yyvsp54)
end
when 178 then
--|#line 1487 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1487")
end

			if yyvs54.item (yyvsp54).valid_value (yyvs29.item (yyvsp29)) then
				yyvs54.item (yyvsp54).set_assumed_value (yyvs29.item (yyvsp29))
				yyval54 := yyvs54.item (yyvsp54)
			else
				abort_with_error (ec_VOBAV, <<yyvs29.item (yyvsp29).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp29 := yyvsp29 -1
	yyspecial_routines54.force (yyvs54, yyval54, yyvsp54)
end
when 179 then
--|#line 1496 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1496")
end

			abort_with_error (ec_SCDUAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines54.force (yyvs54, yyval54, yyvsp54)
end
when 180 then
--|#line 1501 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1501")
end

			abort_with_error (ec_SCDUPT, <<yyvs4.item (yyvsp4).out>>)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp54 := yyvsp54 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp54 >= yyvsc54 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs54")
		end
		yyvsc54 := yyvsc54 + yyInitial_yyvs_size
		yyvs54 := yyspecial_routines54.aliased_resized_area (yyvs54, yyvsc54)
	end
	yyspecial_routines54.force (yyvs54, yyval54, yyvsp54)
end
when 181 then
--|#line 1507 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1507")
end

			create yyval52.make_value (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp52 := yyvsp52 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
when 182 then
--|#line 1511 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1511")
end

			create yyval52.make (yyvs31.item (yyvsp31))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp52 := yyvsp52 + 1
	yyvsp31 := yyvsp31 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
when 183 then
--|#line 1515 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1515")
end

			create yyval52.make_value (yyvs4.item (yyvsp4))
			if yyval52.constraint.first.is_equal ({C_STRING}.Invalid_regex_message) then
				abort_with_error (ec_SCSRE, <<yyvs4.item (yyvsp4)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp52 := yyvsp52 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
when 184 then
--|#line 1522 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1522")
end

			if yyvs52.item (yyvsp52).valid_value (yyvs4.item (yyvsp4)) then
				yyvs52.item (yyvsp52).set_assumed_value (yyvs4.item (yyvsp4))
				yyval52 := yyvs52.item (yyvsp52)
			else
				abort_with_error (ec_VOBAV, <<yyvs4.item (yyvsp4).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
when 185 then
--|#line 1531 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1531")
end

			abort_with_error (ec_SCSAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
when 186 then
--|#line 1537 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1537")
end

			create yyval59.make (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp59 := yyvsp59 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp59 >= yyvsc59 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs59")
		end
		yyvsc59 := yyvsc59 + yyInitial_yyvs_size
		yyvs59 := yyspecial_routines59.aliased_resized_area (yyvs59, yyvsc59)
	end
	yyspecial_routines59.force (yyvs59, yyval59, yyvsp59)
end
when 187 then
--|#line 1541 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1541")
end

			-- note - whitespace is stripped in scanner
			create yyval59.make (yyvs4.item (yyvsp4).substring (1, yyvs4.item (yyvsp4).index_of (';', 1) - 1))
			yyval59.set_assumed_value (yyvs4.item (yyvsp4).substring (yyvs4.item (yyvsp4).index_of (';', 1) + 1, yyvs4.item (yyvsp4).count))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp59 := yyvsp59 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp59 >= yyvsc59 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs59")
		end
		yyvsc59 := yyvsc59 + yyInitial_yyvs_size
		yyvs59 := yyspecial_routines59.aliased_resized_area (yyvs59, yyvsc59)
	end
	yyspecial_routines59.force (yyvs59, yyval59, yyvsp59)
end
when 188 then
--|#line 1547 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1547")
end

			create yyval59.make (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp59 := yyvsp59 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp59 >= yyvsc59 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs59")
		end
		yyvsc59 := yyvsc59 + yyInitial_yyvs_size
		yyvs59 := yyspecial_routines59.aliased_resized_area (yyvs59, yyvsc59)
	end
	yyspecial_routines59.force (yyvs59, yyval59, yyvsp59)
end
when 189 then
--|#line 1554 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1554")
end

			-- e.g. "local::at40"
			if yyvs5.item (yyvsp5).is_single then
				create yyval59.make (yyvs5.item (yyvsp5).codes.first)

			-- e.g. "local::at40, at41; at40"; we have to synthesise an ac-code and convert the inline 
			-- definition to a separate value set
			else
				-- replace by ac-code ref and store value set for addition to terminology
				create yyval59.make (new_fake_ac_code)
				if attached yyvs5.item (yyvsp5).assumed_code as att_ac then
					yyval59.set_assumed_value (att_ac)
				end
				compiler_billboard.value_sets.put (create {VALUE_SET}.make (yyval59.constraint, yyvs5.item (yyvsp5).codes), yyval59.constraint)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp59 := yyvsp59 + 1
	yyvsp5 := yyvsp5 -1
	if yyvsp59 >= yyvsc59 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs59")
		end
		yyvsc59 := yyvsc59 + yyInitial_yyvs_size
		yyvs59 := yyspecial_routines59.aliased_resized_area (yyvs59, yyvsc59)
	end
	yyspecial_routines59.force (yyvs59, yyval59, yyvsp59)
end
when 190 then
--|#line 1571 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1571")
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
					create yyval59.make (flat_anc.terminology.term_binding_key_for_external_code (yyvs5.item (yyvsp5).terminology_id, yyvs5.item (yyvsp5).first_code))

				-- may already have been encountered in this archetype
				elseif attached compiler_billboard.binding_code_map.item (yyvs5.item (yyvsp5).first_code) as att_at_code then
					create yyval59.make (att_at_code)

				-- have to create a new binding
				else
					-- otherwise we use the synthesised code
					check attached yyvs5.item (yyvsp5).last_converted_local as att_tcps then
						create yyval59.make (att_tcps.first_code)
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
				create yyval59.make (new_fake_ac_code)

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
					compiler_billboard.value_sets.put (create {VALUE_SET}.make (yyval59.constraint, at_codes), yyval59.constraint)
				else
					if attached yyvs5.item (yyvsp5).last_converted_local as att_tcps then
						if attached att_tcps.assumed_code as att_ac then
							yyval59.set_assumed_value (att_ac)
						end
						compiler_billboard.value_sets.put (create {VALUE_SET}.make (yyval59.constraint, att_tcps.codes), yyval59.constraint)
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
	yyvsp59 := yyvsp59 + 1
	yyvsp5 := yyvsp5 -1
	if yyvsp59 >= yyvsc59 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs59")
		end
		yyvsc59 := yyvsc59 + yyInitial_yyvs_size
		yyvs59 := yyspecial_routines59.aliased_resized_area (yyvs59, yyvsc59)
	end
	yyspecial_routines59.force (yyvs59, yyval59, yyvsp59)
end
when 191 then
--|#line 1652 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1652")
end

			abort_with_error (ec_STVSI, <<err_str, c_attrs.item.path>>)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp59 := yyvsp59 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp59 >= yyvsc59 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs59")
		end
		yyvsc59 := yyvsc59 + yyInitial_yyvs_size
		yyvs59 := yyspecial_routines59.aliased_resized_area (yyvs59, yyvsc59)
	end
	yyspecial_routines59.force (yyvs59, yyval59, yyvsp59)
end
when 192 then
--|#line 1656 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1656")
end

			abort_with_error (ec_STCDC, <<err_str, c_attrs.item.path>>)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp59 := yyvsp59 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp59 >= yyvsc59 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs59")
		end
		yyvsc59 := yyvsc59 + yyInitial_yyvs_size
		yyvs59 := yyspecial_routines59.aliased_resized_area (yyvs59, yyvsc59)
	end
	yyspecial_routines59.force (yyvs59, yyval59, yyvsp59)
end
when 193 then
--|#line 1660 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1660")
end

			abort_with_error (ec_STCAC, <<err_str, c_attrs.item.path>>)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp59 := yyvsp59 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp59 >= yyvsc59 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs59")
		end
		yyvsc59 := yyvsc59 + yyInitial_yyvs_size
		yyvs59 := yyspecial_routines59.aliased_resized_area (yyvs59, yyvsc59)
	end
	yyspecial_routines59.force (yyvs59, yyval59, yyvsp59)
end
when 194 then
--|#line 1664 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1664")
end

			abort_with_error (ec_STCVA, <<c_attrs.item.path>>)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp59 := yyvsp59 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp59 >= yyvsc59 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs59")
		end
		yyvsc59 := yyvsc59 + yyInitial_yyvs_size
		yyvs59 := yyspecial_routines59.aliased_resized_area (yyvs59, yyvsc59)
	end
	yyspecial_routines59.force (yyvs59, yyval59, yyvsp59)
end
when 195 then
--|#line 1670 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1670")
end

			create yyval51.make_true
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp51 := yyvsp51 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp51 >= yyvsc51 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs51")
		end
		yyvsc51 := yyvsc51 + yyInitial_yyvs_size
		yyvs51 := yyspecial_routines51.aliased_resized_area (yyvs51, yyvsc51)
	end
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
when 196 then
--|#line 1674 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1674")
end

			create yyval51.make_false
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp51 := yyvsp51 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp51 >= yyvsc51 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs51")
		end
		yyvsc51 := yyvsc51 + yyInitial_yyvs_size
		yyvs51 := yyspecial_routines51.aliased_resized_area (yyvs51, yyvsc51)
	end
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
when 197 then
--|#line 1678 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1678")
end

			create yyval51.make (yyvs34.item (yyvsp34))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp51 := yyvsp51 + 1
	yyvsp34 := yyvsp34 -1
	if yyvsp51 >= yyvsc51 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs51")
		end
		yyvsc51 := yyvsc51 + yyInitial_yyvs_size
		yyvs51 := yyspecial_routines51.aliased_resized_area (yyvs51, yyvsc51)
	end
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
when 198 then
--|#line 1682 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1682")
end

			if yyvs51.item (yyvsp51).valid_value (yyvs25.item (yyvsp25)) then
				yyvs51.item (yyvsp51).set_assumed_value (yyvs25.item (yyvsp25))
			else
				abort_with_error (ec_VOBAV, <<yyvs25.item (yyvsp25).out>>)
			end
			yyval51 := yyvs51.item (yyvsp51)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp25 := yyvsp25 -1
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
when 199 then
--|#line 1691 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1691")
end

			abort_with_error (ec_SCBAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
when 200 then
--|#line 1697 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1697")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 201 then
--|#line 1701 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1701")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 202 then
--|#line 1707 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1707")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 203 then
--|#line 1711 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1711")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 204 then
--|#line 1724 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1724")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 205 then
--|#line 1730 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1730")
end

			create yyval31.make(0)
			yyval31.extend(yyvs4.item (yyvsp4 - 1))
			yyval31.extend(yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp31 := yyvsp31 + 1
	yyvsp4 := yyvsp4 -2
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
when 206 then
--|#line 1736 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1736")
end

			yyvs31.item (yyvsp31).extend(yyvs4.item (yyvsp4))
			yyval31 := yyvs31.item (yyvsp31)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 207 then
--|#line 1744 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1744")
end

			yyval31 := yyvs31.item (yyvsp31)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 208 then
--|#line 1748 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1748")
end

			create yyval31.make (0)
			yyval31.extend (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp31 := yyvsp31 + 1
	yyvsp4 := yyvsp4 -1
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
when 209 then
--|#line 1755 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1755")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 210 then
--|#line 1759 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1759")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 211 then
--|#line 1763 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1763")
end

			yyval2 := - yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 212 then
--|#line 1769 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1769")
end

			create yyval32.make(0)
			yyval32.extend(yyvs2.item (yyvsp2 - 1))
			yyval32.extend(yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp32 := yyvsp32 + 1
	yyvsp2 := yyvsp2 -2
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
when 213 then
--|#line 1775 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1775")
end

			yyvs32.item (yyvsp32).extend(yyvs2.item (yyvsp2))
			yyval32 := yyvs32.item (yyvsp32)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 214 then
--|#line 1780 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1780")
end

			create yyval32.make(0)
			yyval32.extend(yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp32 := yyvsp32 + 1
	yyvsp2 := yyvsp2 -1
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
when 215 then
--|#line 1787 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1787")
end

			if yyvs2.item (yyvsp2 - 1) <= yyvs2.item (yyvsp2) then
				create {PROPER_INTERVAL [INTEGER]} yyval39.make_bounded(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs2.item (yyvsp2 - 1).out, yyvs2.item (yyvsp2).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -2
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 216 then
--|#line 1795 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1795")
end

			if yyvs2.item (yyvsp2 - 1) <= yyvs2.item (yyvsp2) then
				create {PROPER_INTERVAL [INTEGER]} yyval39.make_bounded(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs2.item (yyvsp2 - 1).out, yyvs2.item (yyvsp2).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp2 := yyvsp2 -2
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 217 then
--|#line 1803 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1803")
end

			if yyvs2.item (yyvsp2 - 1) <= yyvs2.item (yyvsp2) then
				create {PROPER_INTERVAL [INTEGER]} yyval39.make_bounded(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs2.item (yyvsp2 - 1).out, yyvs2.item (yyvsp2).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp2 := yyvsp2 -2
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 218 then
--|#line 1811 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1811")
end

			if yyvs2.item (yyvsp2 - 1) <= yyvs2.item (yyvsp2) then
				create {PROPER_INTERVAL [INTEGER]} yyval39.make_bounded (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs2.item (yyvsp2 - 1).out, yyvs2.item (yyvsp2).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp2 := yyvsp2 -2
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 219 then
--|#line 1819 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1819")
end

			create {PROPER_INTERVAL [INTEGER]} yyval39.make_lower_unbounded (yyvs2.item (yyvsp2), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -1
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 220 then
--|#line 1823 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1823")
end

			create {PROPER_INTERVAL [INTEGER]} yyval39.make_lower_unbounded (yyvs2.item (yyvsp2), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -1
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 221 then
--|#line 1827 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1827")
end

			create {PROPER_INTERVAL [INTEGER]} yyval39.make_upper_unbounded (yyvs2.item (yyvsp2), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -1
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 222 then
--|#line 1831 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1831")
end

			create {PROPER_INTERVAL [INTEGER]} yyval39.make_upper_unbounded (yyvs2.item (yyvsp2), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -1
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 223 then
--|#line 1835 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1835")
end

			create {POINT_INTERVAL [INTEGER]} yyval39.make (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -1
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 224 then
--|#line 1841 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1841")
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
when 225 then
--|#line 1847 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1847")
end

			yyvs45.item (yyvsp45).extend(yyvs39.item (yyvsp39))
			yyval45 := yyvs45.item (yyvsp45)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp39 := yyvsp39 -1
	yyspecial_routines45.force (yyvs45, yyval45, yyvsp45)
end
when 226 then
--|#line 1852 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1852")
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
when 227 then
--|#line 1859 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1859")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 228 then
--|#line 1863 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1863")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 229 then
--|#line 1867 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1867")
end

			yyval3 := - yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 230 then
--|#line 1873 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1873")
end

			create yyval33.make(0)
			yyval33.extend(yyvs3.item (yyvsp3 - 1))
			yyval33.extend(yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp3 := yyvsp3 -2
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
when 231 then
--|#line 1879 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1879")
end

			yyvs33.item (yyvsp33).extend(yyvs3.item (yyvsp3))
			yyval33 := yyvs33.item (yyvsp33)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 232 then
--|#line 1884 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1884")
end

			create yyval33.make(0)
			yyval33.extend(yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp3 := yyvsp3 -1
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
when 233 then
--|#line 1891 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1891")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create {PROPER_INTERVAL [REAL]} yyval40.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -2
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 234 then
--|#line 1899 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1899")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create {PROPER_INTERVAL [REAL]} yyval40.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp3 := yyvsp3 -2
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 235 then
--|#line 1907 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1907")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create {PROPER_INTERVAL [REAL]} yyval40.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp3 := yyvsp3 -2
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 236 then
--|#line 1915 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1915")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create {PROPER_INTERVAL [REAL]} yyval40.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp3 := yyvsp3 -2
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 237 then
--|#line 1923 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1923")
end

			create {PROPER_INTERVAL [REAL]} yyval40.make_lower_unbounded(yyvs3.item (yyvsp3), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 238 then
--|#line 1927 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1927")
end

			create {PROPER_INTERVAL [REAL]} yyval40.make_lower_unbounded(yyvs3.item (yyvsp3), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 239 then
--|#line 1931 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1931")
end

			create {PROPER_INTERVAL [REAL]} yyval40.make_upper_unbounded(yyvs3.item (yyvsp3), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 240 then
--|#line 1935 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1935")
end

			create {PROPER_INTERVAL [REAL]} yyval40.make_upper_unbounded(yyvs3.item (yyvsp3), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 241 then
--|#line 1939 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1939")
end

			create {POINT_INTERVAL [REAL]} yyval40.make(yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp3 := yyvsp3 -1
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 242 then
--|#line 1945 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1945")
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
when 243 then
--|#line 1951 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1951")
end

			yyvs46.item (yyvsp46).extend(yyvs40.item (yyvsp40))
			yyval46 := yyvs46.item (yyvsp46)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp40 := yyvsp40 -1
	yyspecial_routines46.force (yyvs46, yyval46, yyvsp46)
end
when 244 then
--|#line 1956 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1956")
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
when 245 then
--|#line 1963 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1963")
end

			yyval25 := True
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp25 := yyvsp25 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp25 >= yyvsc25 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs25")
		end
		yyvsc25 := yyvsc25 + yyInitial_yyvs_size
		yyvs25 := yyspecial_routines25.aliased_resized_area (yyvs25, yyvsc25)
	end
	yyspecial_routines25.force (yyvs25, yyval25, yyvsp25)
end
when 246 then
--|#line 1967 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1967")
end

			yyval25 := False
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp25 := yyvsp25 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp25 >= yyvsc25 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs25")
		end
		yyvsc25 := yyvsc25 + yyInitial_yyvs_size
		yyvs25 := yyspecial_routines25.aliased_resized_area (yyvs25, yyvsc25)
	end
	yyspecial_routines25.force (yyvs25, yyval25, yyvsp25)
end
when 247 then
--|#line 1973 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1973")
end

			create yyval34.make(0)
			yyval34.extend(yyvs25.item (yyvsp25 - 1))
			yyval34.extend(yyvs25.item (yyvsp25))
		
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
when 248 then
--|#line 1979 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1979")
end

			yyvs34.item (yyvsp34).extend(yyvs25.item (yyvsp25))
			yyval34 := yyvs34.item (yyvsp34)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp25 := yyvsp25 -1
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 249 then
--|#line 1984 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1984")
end

			create yyval34.make(0)
			yyval34.extend(yyvs25.item (yyvsp25))
		
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
when 250 then
--|#line 1991 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1991")
end

			if valid_iso8601_date(yyvs4.item (yyvsp4)) then
				create yyval26.make_from_string(yyvs4.item (yyvsp4))
			else
				abort_with_error (ec_VIDV, <<yyvs4.item (yyvsp4)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp26 := yyvsp26 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp26 >= yyvsc26 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs26")
		end
		yyvsc26 := yyvsc26 + yyInitial_yyvs_size
		yyvs26 := yyspecial_routines26.aliased_resized_area (yyvs26, yyvsc26)
	end
	yyspecial_routines26.force (yyvs26, yyval26, yyvsp26)
end
when 251 then
--|#line 2001 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2001")
end

			create yyval35.make(0)
			yyval35.extend (yyvs26.item (yyvsp26 - 1))
			yyval35.extend (yyvs26.item (yyvsp26))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp35 := yyvsp35 + 1
	yyvsp26 := yyvsp26 -2
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
when 252 then
--|#line 2007 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2007")
end

			yyvs35.item (yyvsp35).extend (yyvs26.item (yyvsp26))
			yyval35 := yyvs35.item (yyvsp35)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp26 := yyvsp26 -1
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 253 then
--|#line 2012 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2012")
end

			create yyval35.make(0)
			yyval35.extend (yyvs26.item (yyvsp26))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp35 := yyvsp35 + 1
	yyvsp26 := yyvsp26 -1
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
when 254 then
--|#line 2019 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2019")
end

			if yyvs26.item (yyvsp26 - 1) <= yyvs26.item (yyvsp26) then
				create {PROPER_INTERVAL [ISO8601_DATE]} yyval42.make_bounded(yyvs26.item (yyvsp26 - 1), yyvs26.item (yyvsp26), True, True)
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
when 255 then
--|#line 2027 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2027")
end

			if yyvs26.item (yyvsp26 - 1) <= yyvs26.item (yyvsp26) then
				create {PROPER_INTERVAL [ISO8601_DATE]} yyval42.make_bounded(yyvs26.item (yyvsp26 - 1), yyvs26.item (yyvsp26), False, True)
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
when 256 then
--|#line 2035 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2035")
end

			if yyvs26.item (yyvsp26 - 1) <= yyvs26.item (yyvsp26) then
				create {PROPER_INTERVAL [ISO8601_DATE]} yyval42.make_bounded(yyvs26.item (yyvsp26 - 1), yyvs26.item (yyvsp26), True, False)
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
when 257 then
--|#line 2043 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2043")
end

			if yyvs26.item (yyvsp26 - 1) <= yyvs26.item (yyvsp26) then
				create {PROPER_INTERVAL [ISO8601_DATE]} yyval42.make_bounded(yyvs26.item (yyvsp26 - 1), yyvs26.item (yyvsp26), False, False)
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
when 258 then
--|#line 2051 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2051")
end

			create {PROPER_INTERVAL [ISO8601_DATE]} yyval42.make_lower_unbounded(yyvs26.item (yyvsp26), False)
		
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
when 259 then
--|#line 2055 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2055")
end

			create {PROPER_INTERVAL [ISO8601_DATE]} yyval42.make_lower_unbounded(yyvs26.item (yyvsp26), True)
		
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
when 260 then
--|#line 2059 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2059")
end

			create {PROPER_INTERVAL [ISO8601_DATE]} yyval42.make_upper_unbounded(yyvs26.item (yyvsp26), False)
		
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
when 261 then
--|#line 2063 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2063")
end

			create {PROPER_INTERVAL [ISO8601_DATE]} yyval42.make_upper_unbounded(yyvs26.item (yyvsp26), True)
		
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
when 262 then
--|#line 2067 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2067")
end

			create {POINT_INTERVAL [ISO8601_DATE]} yyval42.make (yyvs26.item (yyvsp26))
		
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
when 263 then
--|#line 2073 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2073")
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
when 264 then
--|#line 2079 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2079")
end

			yyvs48.item (yyvsp48).extend(yyvs42.item (yyvsp42))
			yyval48 := yyvs48.item (yyvsp48)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp42 := yyvsp42 -1
	yyspecial_routines48.force (yyvs48, yyval48, yyvsp48)
end
when 265 then
--|#line 2084 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2084")
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
when 266 then
--|#line 2091 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2091")
end

			if valid_iso8601_time(yyvs4.item (yyvsp4)) then
				create yyval28.make_from_string(yyvs4.item (yyvsp4))
			else
				abort_with_error (ec_VITV, <<yyvs4.item (yyvsp4)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp28 := yyvsp28 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp28 >= yyvsc28 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs28")
		end
		yyvsc28 := yyvsc28 + yyInitial_yyvs_size
		yyvs28 := yyspecial_routines28.aliased_resized_area (yyvs28, yyvsc28)
	end
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
when 267 then
--|#line 2101 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2101")
end

			create yyval36.make(0)
			yyval36.extend(yyvs28.item (yyvsp28 - 1))
			yyval36.extend(yyvs28.item (yyvsp28))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp36 := yyvsp36 + 1
	yyvsp28 := yyvsp28 -2
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
when 268 then
--|#line 2107 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2107")
end

			yyvs36.item (yyvsp36).extend(yyvs28.item (yyvsp28))
			yyval36 := yyvs36.item (yyvsp36)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp28 := yyvsp28 -1
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
when 269 then
--|#line 2112 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2112")
end

			create yyval36.make(0)
			yyval36.extend(yyvs28.item (yyvsp28))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp36 := yyvsp36 + 1
	yyvsp28 := yyvsp28 -1
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
when 270 then
--|#line 2119 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2119")
end

			if yyvs28.item (yyvsp28 - 1) <= yyvs28.item (yyvsp28) then
				create {PROPER_INTERVAL [ISO8601_TIME]} yyval41.make_bounded(yyvs28.item (yyvsp28 - 1), yyvs28.item (yyvsp28), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs28.item (yyvsp28 - 1).out, yyvs28.item (yyvsp28).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp28 := yyvsp28 -2
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 271 then
--|#line 2127 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2127")
end

			if yyvs28.item (yyvsp28 - 1) <= yyvs28.item (yyvsp28) then
				create {PROPER_INTERVAL [ISO8601_TIME]} yyval41.make_bounded(yyvs28.item (yyvsp28 - 1), yyvs28.item (yyvsp28), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs28.item (yyvsp28 - 1).out, yyvs28.item (yyvsp28).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp28 := yyvsp28 -2
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 272 then
--|#line 2135 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2135")
end

			if yyvs28.item (yyvsp28 - 1) <= yyvs28.item (yyvsp28) then
				create {PROPER_INTERVAL [ISO8601_TIME]} yyval41.make_bounded(yyvs28.item (yyvsp28 - 1), yyvs28.item (yyvsp28), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs28.item (yyvsp28 - 1).out, yyvs28.item (yyvsp28).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp28 := yyvsp28 -2
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 273 then
--|#line 2143 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2143")
end

			if yyvs28.item (yyvsp28 - 1) <= yyvs28.item (yyvsp28) then
				create {PROPER_INTERVAL [ISO8601_TIME]} yyval41.make_bounded(yyvs28.item (yyvsp28 - 1), yyvs28.item (yyvsp28), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs28.item (yyvsp28 - 1).out, yyvs28.item (yyvsp28).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp28 := yyvsp28 -2
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 274 then
--|#line 2151 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2151")
end

			create {PROPER_INTERVAL [ISO8601_TIME]} yyval41.make_lower_unbounded(yyvs28.item (yyvsp28), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp28 := yyvsp28 -1
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 275 then
--|#line 2155 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2155")
end

			create {PROPER_INTERVAL [ISO8601_TIME]} yyval41.make_lower_unbounded(yyvs28.item (yyvsp28), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp28 := yyvsp28 -1
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 276 then
--|#line 2159 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2159")
end

			create {PROPER_INTERVAL [ISO8601_TIME]} yyval41.make_upper_unbounded(yyvs28.item (yyvsp28), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp28 := yyvsp28 -1
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 277 then
--|#line 2163 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2163")
end

			create {PROPER_INTERVAL [ISO8601_TIME]} yyval41.make_upper_unbounded(yyvs28.item (yyvsp28), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp28 := yyvsp28 -1
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 278 then
--|#line 2167 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2167")
end

			create {POINT_INTERVAL [ISO8601_TIME]} yyval41.make (yyvs28.item (yyvsp28))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp28 := yyvsp28 -1
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 279 then
--|#line 2173 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2173")
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
when 280 then
--|#line 2179 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2179")
end

			yyvs47.item (yyvsp47).extend(yyvs41.item (yyvsp41))
			yyval47 := yyvs47.item (yyvsp47)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp41 := yyvsp41 -1
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
when 281 then
--|#line 2184 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2184")
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
when 282 then
--|#line 2191 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2191")
end

			if valid_iso8601_date_time(yyvs4.item (yyvsp4)) then
				create yyval27.make_from_string(yyvs4.item (yyvsp4))
			else
				abort_with_error (ec_VIDTV, <<yyvs4.item (yyvsp4)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp27 := yyvsp27 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp27 >= yyvsc27 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs27")
		end
		yyvsc27 := yyvsc27 + yyInitial_yyvs_size
		yyvs27 := yyspecial_routines27.aliased_resized_area (yyvs27, yyvsc27)
	end
	yyspecial_routines27.force (yyvs27, yyval27, yyvsp27)
end
when 283 then
--|#line 2201 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2201")
end

			create yyval37.make(0)
			yyval37.extend(yyvs27.item (yyvsp27 - 1))
			yyval37.extend(yyvs27.item (yyvsp27))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp37 := yyvsp37 + 1
	yyvsp27 := yyvsp27 -2
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
when 284 then
--|#line 2207 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2207")
end

			yyvs37.item (yyvsp37).extend(yyvs27.item (yyvsp27))
			yyval37 := yyvs37.item (yyvsp37)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp27 := yyvsp27 -1
	yyspecial_routines37.force (yyvs37, yyval37, yyvsp37)
end
when 285 then
--|#line 2212 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2212")
end

			create yyval37.make(0)
			yyval37.extend(yyvs27.item (yyvsp27))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp37 := yyvsp37 + 1
	yyvsp27 := yyvsp27 -1
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
when 286 then
--|#line 2219 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2219")
end

			if yyvs27.item (yyvsp27 - 1) <= yyvs27.item (yyvsp27) then
				create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval43.make_bounded(yyvs27.item (yyvsp27 - 1), yyvs27.item (yyvsp27), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs27.item (yyvsp27 - 1).out, yyvs27.item (yyvsp27).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp43 := yyvsp43 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp27 := yyvsp27 -2
	if yyvsp43 >= yyvsc43 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs43")
		end
		yyvsc43 := yyvsc43 + yyInitial_yyvs_size
		yyvs43 := yyspecial_routines43.aliased_resized_area (yyvs43, yyvsc43)
	end
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
when 287 then
--|#line 2227 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2227")
end

			if yyvs27.item (yyvsp27 - 1) <= yyvs27.item (yyvsp27) then
				create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval43.make_bounded(yyvs27.item (yyvsp27 - 1), yyvs27.item (yyvsp27), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs27.item (yyvsp27 - 1).out, yyvs27.item (yyvsp27).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp43 := yyvsp43 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp27 := yyvsp27 -2
	if yyvsp43 >= yyvsc43 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs43")
		end
		yyvsc43 := yyvsc43 + yyInitial_yyvs_size
		yyvs43 := yyspecial_routines43.aliased_resized_area (yyvs43, yyvsc43)
	end
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
when 288 then
--|#line 2235 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2235")
end

			if yyvs27.item (yyvsp27 - 1) <= yyvs27.item (yyvsp27) then
				create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval43.make_bounded(yyvs27.item (yyvsp27 - 1), yyvs27.item (yyvsp27), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs27.item (yyvsp27 - 1).out, yyvs27.item (yyvsp27).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp43 := yyvsp43 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp27 := yyvsp27 -2
	if yyvsp43 >= yyvsc43 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs43")
		end
		yyvsc43 := yyvsc43 + yyInitial_yyvs_size
		yyvs43 := yyspecial_routines43.aliased_resized_area (yyvs43, yyvsc43)
	end
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
when 289 then
--|#line 2243 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2243")
end

			if yyvs27.item (yyvsp27 - 1) <= yyvs27.item (yyvsp27) then
				create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval43.make_bounded(yyvs27.item (yyvsp27 - 1), yyvs27.item (yyvsp27), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs27.item (yyvsp27 - 1).out, yyvs27.item (yyvsp27).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp43 := yyvsp43 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp27 := yyvsp27 -2
	if yyvsp43 >= yyvsc43 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs43")
		end
		yyvsc43 := yyvsc43 + yyInitial_yyvs_size
		yyvs43 := yyspecial_routines43.aliased_resized_area (yyvs43, yyvsc43)
	end
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
when 290 then
--|#line 2251 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2251")
end

			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval43.make_lower_unbounded(yyvs27.item (yyvsp27), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp43 := yyvsp43 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp27 := yyvsp27 -1
	if yyvsp43 >= yyvsc43 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs43")
		end
		yyvsc43 := yyvsc43 + yyInitial_yyvs_size
		yyvs43 := yyspecial_routines43.aliased_resized_area (yyvs43, yyvsc43)
	end
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
when 291 then
--|#line 2255 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2255")
end

			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval43.make_lower_unbounded(yyvs27.item (yyvsp27), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp43 := yyvsp43 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp27 := yyvsp27 -1
	if yyvsp43 >= yyvsc43 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs43")
		end
		yyvsc43 := yyvsc43 + yyInitial_yyvs_size
		yyvs43 := yyspecial_routines43.aliased_resized_area (yyvs43, yyvsc43)
	end
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
when 292 then
--|#line 2259 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2259")
end

			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval43.make_upper_unbounded(yyvs27.item (yyvsp27), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp43 := yyvsp43 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp27 := yyvsp27 -1
	if yyvsp43 >= yyvsc43 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs43")
		end
		yyvsc43 := yyvsc43 + yyInitial_yyvs_size
		yyvs43 := yyspecial_routines43.aliased_resized_area (yyvs43, yyvsc43)
	end
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
when 293 then
--|#line 2263 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2263")
end

			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval43.make_upper_unbounded(yyvs27.item (yyvsp27), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp43 := yyvsp43 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp27 := yyvsp27 -1
	if yyvsp43 >= yyvsc43 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs43")
		end
		yyvsc43 := yyvsc43 + yyInitial_yyvs_size
		yyvs43 := yyspecial_routines43.aliased_resized_area (yyvs43, yyvsc43)
	end
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
when 294 then
--|#line 2267 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2267")
end

			create {POINT_INTERVAL [ISO8601_DATE_TIME]} yyval43.make (yyvs27.item (yyvsp27))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp43 := yyvsp43 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp27 := yyvsp27 -1
	if yyvsp43 >= yyvsc43 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs43")
		end
		yyvsc43 := yyvsc43 + yyInitial_yyvs_size
		yyvs43 := yyspecial_routines43.aliased_resized_area (yyvs43, yyvsc43)
	end
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
when 295 then
--|#line 2273 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2273")
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
when 296 then
--|#line 2279 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2279")
end

			yyvs49.item (yyvsp49).extend(yyvs43.item (yyvsp43))
			yyval49 := yyvs49.item (yyvsp49)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp43 := yyvsp43 -1
	yyspecial_routines49.force (yyvs49, yyval49, yyvsp49)
end
when 297 then
--|#line 2284 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2284")
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
when 298 then
--|#line 2291 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2291")
end

			if valid_iso8601_duration(yyvs4.item (yyvsp4)) then
				create yyval29.make_from_string(yyvs4.item (yyvsp4))
			else
				abort_with_error (ec_VIDUV, <<yyvs4.item (yyvsp4)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp29 := yyvsp29 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp29 >= yyvsc29 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs29")
		end
		yyvsc29 := yyvsc29 + yyInitial_yyvs_size
		yyvs29 := yyspecial_routines29.aliased_resized_area (yyvs29, yyvsc29)
	end
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
when 299 then
--|#line 2301 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2301")
end

			create yyval38.make(0)
			yyval38.extend(yyvs29.item (yyvsp29 - 1))
			yyval38.extend(yyvs29.item (yyvsp29))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp38 := yyvsp38 + 1
	yyvsp29 := yyvsp29 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp38 >= yyvsc38 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs38")
		end
		yyvsc38 := yyvsc38 + yyInitial_yyvs_size
		yyvs38 := yyspecial_routines38.aliased_resized_area (yyvs38, yyvsc38)
	end
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 300 then
--|#line 2307 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2307")
end

			yyvs38.item (yyvsp38).extend(yyvs29.item (yyvsp29))
			yyval38 := yyvs38.item (yyvsp38)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp29 := yyvsp29 -1
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 301 then
--|#line 2312 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2312")
end

			create yyval38.make(0)
			yyval38.extend(yyvs29.item (yyvsp29))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp38 := yyvsp38 + 1
	yyvsp29 := yyvsp29 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp38 >= yyvsc38 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs38")
		end
		yyvsc38 := yyvsc38 + yyInitial_yyvs_size
		yyvs38 := yyspecial_routines38.aliased_resized_area (yyvs38, yyvsc38)
	end
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 302 then
--|#line 2319 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2319")
end

			if yyvs29.item (yyvsp29 - 1) <= yyvs29.item (yyvsp29) then
				create {PROPER_INTERVAL [ISO8601_DURATION]} yyval44.make_bounded(yyvs29.item (yyvsp29 - 1), yyvs29.item (yyvsp29), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs29.item (yyvsp29 - 1).out, yyvs29.item (yyvsp29).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp44 := yyvsp44 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp29 := yyvsp29 -2
	if yyvsp44 >= yyvsc44 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs44")
		end
		yyvsc44 := yyvsc44 + yyInitial_yyvs_size
		yyvs44 := yyspecial_routines44.aliased_resized_area (yyvs44, yyvsc44)
	end
	yyspecial_routines44.force (yyvs44, yyval44, yyvsp44)
end
when 303 then
--|#line 2327 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2327")
end

			if yyvs29.item (yyvsp29 - 1) <= yyvs29.item (yyvsp29) then
				create {PROPER_INTERVAL [ISO8601_DURATION]} yyval44.make_bounded(yyvs29.item (yyvsp29 - 1), yyvs29.item (yyvsp29), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs29.item (yyvsp29 - 1).out, yyvs29.item (yyvsp29).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp44 := yyvsp44 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp29 := yyvsp29 -2
	if yyvsp44 >= yyvsc44 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs44")
		end
		yyvsc44 := yyvsc44 + yyInitial_yyvs_size
		yyvs44 := yyspecial_routines44.aliased_resized_area (yyvs44, yyvsc44)
	end
	yyspecial_routines44.force (yyvs44, yyval44, yyvsp44)
end
when 304 then
--|#line 2335 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2335")
end

			if yyvs29.item (yyvsp29 - 1) <= yyvs29.item (yyvsp29) then
				create {PROPER_INTERVAL [ISO8601_DURATION]} yyval44.make_bounded(yyvs29.item (yyvsp29 - 1), yyvs29.item (yyvsp29), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs29.item (yyvsp29 - 1).out, yyvs29.item (yyvsp29).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp44 := yyvsp44 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp29 := yyvsp29 -2
	if yyvsp44 >= yyvsc44 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs44")
		end
		yyvsc44 := yyvsc44 + yyInitial_yyvs_size
		yyvs44 := yyspecial_routines44.aliased_resized_area (yyvs44, yyvsc44)
	end
	yyspecial_routines44.force (yyvs44, yyval44, yyvsp44)
end
when 305 then
--|#line 2343 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2343")
end

			if yyvs29.item (yyvsp29 - 1) <= yyvs29.item (yyvsp29) then
				create {PROPER_INTERVAL [ISO8601_DURATION]} yyval44.make_bounded(yyvs29.item (yyvsp29 - 1), yyvs29.item (yyvsp29), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs29.item (yyvsp29 - 1).out, yyvs29.item (yyvsp29).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp44 := yyvsp44 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp29 := yyvsp29 -2
	if yyvsp44 >= yyvsc44 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs44")
		end
		yyvsc44 := yyvsc44 + yyInitial_yyvs_size
		yyvs44 := yyspecial_routines44.aliased_resized_area (yyvs44, yyvsc44)
	end
	yyspecial_routines44.force (yyvs44, yyval44, yyvsp44)
end
when 306 then
--|#line 2351 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2351")
end

			create {PROPER_INTERVAL [ISO8601_DURATION]} yyval44.make_lower_unbounded(yyvs29.item (yyvsp29), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp44 := yyvsp44 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp29 := yyvsp29 -1
	if yyvsp44 >= yyvsc44 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs44")
		end
		yyvsc44 := yyvsc44 + yyInitial_yyvs_size
		yyvs44 := yyspecial_routines44.aliased_resized_area (yyvs44, yyvsc44)
	end
	yyspecial_routines44.force (yyvs44, yyval44, yyvsp44)
end
when 307 then
--|#line 2355 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2355")
end

			create {PROPER_INTERVAL [ISO8601_DURATION]} yyval44.make_lower_unbounded(yyvs29.item (yyvsp29), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp44 := yyvsp44 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp29 := yyvsp29 -1
	if yyvsp44 >= yyvsc44 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs44")
		end
		yyvsc44 := yyvsc44 + yyInitial_yyvs_size
		yyvs44 := yyspecial_routines44.aliased_resized_area (yyvs44, yyvsc44)
	end
	yyspecial_routines44.force (yyvs44, yyval44, yyvsp44)
end
when 308 then
--|#line 2359 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2359")
end

			create {PROPER_INTERVAL [ISO8601_DURATION]} yyval44.make_upper_unbounded(yyvs29.item (yyvsp29), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp44 := yyvsp44 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp29 := yyvsp29 -1
	if yyvsp44 >= yyvsc44 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs44")
		end
		yyvsc44 := yyvsc44 + yyInitial_yyvs_size
		yyvs44 := yyspecial_routines44.aliased_resized_area (yyvs44, yyvsc44)
	end
	yyspecial_routines44.force (yyvs44, yyval44, yyvsp44)
end
when 309 then
--|#line 2363 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2363")
end

			create {PROPER_INTERVAL [ISO8601_DURATION]} yyval44.make_upper_unbounded(yyvs29.item (yyvsp29), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp44 := yyvsp44 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp29 := yyvsp29 -1
	if yyvsp44 >= yyvsc44 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs44")
		end
		yyvsc44 := yyvsc44 + yyInitial_yyvs_size
		yyvs44 := yyspecial_routines44.aliased_resized_area (yyvs44, yyvsc44)
	end
	yyspecial_routines44.force (yyvs44, yyval44, yyvsp44)
end
when 310 then
--|#line 2367 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2367")
end

			create {POINT_INTERVAL [ISO8601_DURATION]} yyval44.make (yyvs29.item (yyvsp29))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp44 := yyvsp44 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp29 := yyvsp29 -1
	if yyvsp44 >= yyvsc44 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs44")
		end
		yyvsc44 := yyvsc44 + yyInitial_yyvs_size
		yyvs44 := yyspecial_routines44.aliased_resized_area (yyvs44, yyvsc44)
	end
	yyspecial_routines44.force (yyvs44, yyval44, yyvsp44)
end
when 311 then
--|#line 2373 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2373")
end

			create yyval50.make(0)
			yyval50.extend(yyvs44.item (yyvsp44 - 1))
			yyval50.extend(yyvs44.item (yyvsp44))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp50 := yyvsp50 + 1
	yyvsp44 := yyvsp44 -2
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
when 312 then
--|#line 2379 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2379")
end

			yyvs50.item (yyvsp50).extend(yyvs44.item (yyvsp44))
			yyval50 := yyvs50.item (yyvsp50)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp44 := yyvsp44 -1
	yyspecial_routines50.force (yyvs50, yyval50, yyvsp50)
end
when 313 then
--|#line 2384 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2384")
end

			create yyval50.make(0)
			yyval50.extend(yyvs44.item (yyvsp44))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp50 := yyvsp50 + 1
	yyvsp44 := yyvsp44 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp50 >= yyvsc50 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs50")
		end
		yyvsc50 := yyvsc50 + yyInitial_yyvs_size
		yyvs50 := yyspecial_routines50.aliased_resized_area (yyvs50, yyvsc50)
	end
	yyspecial_routines50.force (yyvs50, yyval50, yyvsp50)
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
			when 556 then
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
			   90,   91,   80,   78,   88,   79,    2,   81,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,   89,   92,
			    2,   72,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,   86,    2,   87,   85,    2,    2,    2,    2,    2,

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
			   65,   66,   67,   68,   69,   70,   71,   73,   74,   75,
			   76,   77,   82,   83,   84, yyDummy>>)
		end

	yyr1_template: SPECIAL [INTEGER]
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,  170,  170,  170,  107,  107,  109,  108,  108,  108,
			  100,  100,  171,  171,  171,  174,  174,  174,  174,  111,
			  111,  111,  111,   97,   97,   98,   98,   98,  114,  114,
			  113,  112,  112,  112,  112,  110,  110,  110,  110,  110,
			  110,  110,  110,  110,  172,  173,  173,  175,  175,  176,
			  176,  176,  115,  115,  178,  178,  178,  177,  179,  179,
			  180,  180,  181,  182,  182,   94,   94,   95,   95,   93,
			   93,   96,   96,   96,   96,  116,  116,  117,  117,  118,
			  118,  118,  118,  124,  125,  125,  120,  120,  120,  120,
			  121,  160,  160,  160,  160,  127,  127,  122,  128,  128,

			  119,  119,  123,  126,  126,  126,  159,  159,  159,  159,
			  159,  159,  158,  158,  158,  158,  158,  105,  105,  102,
			  102,  106,  106,  103,  103,  103,  103,  103,  103,  103,
			  103,  104,  104,  104,  101,  101,  101,  101,  168,  168,
			  168,  168,  168,  168,  167,  167,  167,  167,  167,  167,
			  165,  165,  165,  165,  165,  165,  165,  166,  166,  166,
			  166,  166,  166,  166,  163,  163,  163,  163,  163,  163,
			  163,  164,  164,  164,  164,  164,  164,  164,  164,  164,
			  164,  162,  162,  162,  162,  162,  169,  169,  169,  169,
			  169,  169,  169,  169,  169,  161,  161,  161,  161,  161,

			  136,  136,   99,   99,  137,  138,  138,  138,  138,  129,
			  129,  129,  139,  139,  139,  146,  146,  146,  146,  146,
			  146,  146,  146,  146,  152,  152,  152,  130,  130,  130,
			  140,  140,  140,  147,  147,  147,  147,  147,  147,  147,
			  147,  147,  153,  153,  153,  131,  131,  141,  141,  141,
			  132,  142,  142,  142,  149,  149,  149,  149,  149,  149,
			  149,  149,  149,  155,  155,  155,  134,  143,  143,  143,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  154,
			  154,  154,  133,  144,  144,  144,  150,  150,  150,  150,
			  150,  150,  150,  150,  150,  156,  156,  156,  135,  145,

			  145,  145,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  157,  157,  157, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    1,    1,    4,    4,
			    4,    4,    4,    3,    2,    1,    7,    8,    4,   16,
			   16,   16,   21,   21,   21,   21,   22,   23,   23,   23,
			   23,   23,   24,   24,   21,    2,    3,    4,   21,   21,
			    3,    2,    3,    2,    1,    4,    4,    1,    1,    1,
			    8,    4,    4,    4,    1,   14,    1,    1,    1,    1,
			    1,    4,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    4,    4,    1,    1,    1,   21,    1,
			    1,    1,    1,    1,   21,    1,    4,   21,   21,    1,
			   21,    1,    1,    1,    1,    4,    4,    4,    4,    4,

			    4,    4,    4,    4,    4,    1,    1,    1,    1,    5,
			    5,    4,    4,    4,    4,   17,    2,    3,   25,   26,
			   27,   28,   29,   31,   32,   33,   34,   35,   36,   37,
			   38,   39,   40,   41,   42,   43,   44,   45,   46,   47,
			   48,   49,   50,   51,   52,   53,   54,   55,   56,   57,
			   58,   59,   17,   59,    1,    1,    1,    4,    4,    1,
			   20,    1,    1,    1,    1,    1,    1,   21,    1,    1,
			    1,    1,    2,    3,   26,   27,   28,   29,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    2,   12,    2,    4,    1,    1,   14,   14,    1,
			    1,    1,    2,    3,   26,   27,   28,   29,    2,    3,
			   26,   27,   28,   29,    2,    3,   26,   27,   28,   29,
			    2,    3,   26,   27,   28,   29,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,   29,
			   44,    1,    4,    1,    2,    1,    1,    1,    3,    1,
			    1,    1,   25,    1,   26,    1,   27,    1,   28,    1,
			   29,    1,    4,    2,    3,   25,   26,   28,   27,   29,

			    1,    1,   39,    1,    1,   40,    1,    1,   41,    1,
			    1,   42,    1,    1,   43,    1,   44,   39,   40,   41,
			   42,   43,   44,    1,   25,    4,    1,    4,    1,   27,
			    1,   29,    1,   26,    1,   28,    1,    3,    1,    2,
			    1,    1,    1,    1,    1,    1,   15,   15,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    2,    1,    3,    1,   26,    1,   27,    1,   28,    1,
			   29,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    2,    4,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    9,   10,    4,
			   11,   16,   17,   18,   19,   19,   19,    1,    1,    1,
			    1,    2,    1,    3,    1,   26,    1,   27,    1,   28,
			    1,   29,    2,    1,    3,    1,   26,    1,   27,    1,
			   28,    1,   29,    1,    1,    2,   12,    1,    4,    4,
			    1,    4,    1,    4,    4,    1,   18,   14,    1,    1,
			    1,    1,    2,    1,    3,    1,   26,    1,   27,    1,
			   28,    1,   29,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,   12,   13,    4,   14,    4,
			    4,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    2,    1,    1,   14,    4,    1,   14,
			    1,    7,   17,    1,    1,    1,    1,    1,    1,    4,
			    7,    1,    7,    1,    1,    1,    1,    1,    7,    1,
			   17,    1,    1,    1,    1,    1,    1,    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER]
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    2,    3,    4,    4,    4,    4,    4,
			    4,    4,    4,    4,    4,    4,    4,    5,    5,    1,
			    1,    1,    1,    4,    4,    4,    6,    4,    4,    4,
			    4,    4,    4,    4,    4,    4,    4,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER]
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    0,    0,    0,    0,    0,    0,   96,   95,    0,  105,
			  201,  203,  202,  227,  209,    3,    2,   69,  200,    1,
			  131,    5,   72,   76,   75,   98,   77,   78,   82,   99,
			   73,   80,  100,   79,    0,  103,  104,    0,    0,    0,
			  229,  211,  228,  210,    0,   87,   86,   89,    0,    0,
			   70,  200,    8,    7,    0,    6,    0,   92,   93,   91,
			   94,    0,  116,  112,  113,  115,  114,  110,  108,  111,
			  109,  107,  106,    0,    0,    0,   81,  101,    0,    0,
			    0,    0,  133,    0,   90,    0,  105,  102,   97,   74,
			   71,   88,  246,  245,    0,  180,  173,  150,  157,  164,

			  298,  282,  266,  250,  183,  194,  192,  191,  193,  190,
			  189,  187,  188,  186,  181,    0,  138,  144,    0,  151,
			  165,  158,  174,  182,  139,  145,  197,  152,  159,  166,
			  175,  140,  146,  160,  153,  167,  176,  141,  147,  161,
			  154,  168,  177,   43,   41,   39,   40,   37,   38,   36,
			   35,   42,    0,    0,    0,    0,   44,  117,  117,   14,
			   50,    0,   12,   13,   45,   47,   48,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			   83,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,   84,   85,  135,    0,
			    0,  209,    0,  134,   58,    0,    0,  121,  121,    0,
			    4,   46,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  223,    0,  241,
			    0,  262,    0,  294,    0,  278,    0,  310,    0,  172,
			  171,  208,  205,  214,  212,    0,    0,  232,  230,  249,
			  246,  245,  247,  253,  251,  285,  283,  269,  267,  301,
			  299,  207,  206,  213,  231,  248,  252,  268,  284,  300,

			  226,    0,  224,  244,    0,  242,  281,    0,  279,  265,
			    0,  263,  297,    0,  295,  313,  311,  225,  243,  280,
			  264,  296,  312,  199,  198,  204,  185,  184,  170,  169,
			  179,  178,  156,  155,  163,  162,  149,  148,  143,  142,
			    0,  132,    0,    0,    0,    0,   53,   52,    0,  222,
			  240,  261,  293,  277,  309,  220,  238,  259,  291,  275,
			  307,    0,  221,    0,  239,    0,  260,    0,  292,    0,
			  276,    0,  308,  219,  237,  258,  290,  274,  306,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  137,  136,   59,    0,    0,
			    0,    0,    0,    0,    0,    0,   18,   20,   21,    9,
			    0,   19,   17,   15,  131,   29,   22,   56,   54,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  215,    0,  233,    0,  254,    0,  286,
			    0,  270,    0,  302,    0,  119,    0,    0,   11,   10,
			   27,  131,   34,   33,    0,   51,   16,   30,    0,   49,
			   18,   55,    0,  216,    0,  234,    0,  255,    0,  287,
			    0,  271,    0,  303,  217,  235,  256,  288,  272,  304,

			    0,    0,   60,    0,  118,  123,    0,  131,    0,   31,
			  131,   24,   65,  218,  236,  257,  289,  273,  305,    0,
			    0,    0,   57,  120,    0,  122,    0,   26,   32,   23,
			    0,   67,    0,    0,   62,   61,  126,  124,  125,   25,
			   66,    0,    0,   63,    0,    0,    0,    0,   68,   28,
			    0,  129,  130,  127,  128,   64,    0,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			   16,  531,  542,   17,  427,  428,   51,  430,  222,  466,
			  506,   55,  227,  346,  431,   20,   21,  432,  433,  434,
			  435,  436,  160,   22,   23,   24,   25,   26,   27,   28,
			   29,   30,   31,   32,   33,   34,   35,   36,  118,  119,
			  120,  121,  122,   37,  327,  123,  124,  125,  126,  127,
			  128,  129,  130,  131,  132,  133,  134,  135,  136,  137,
			  138,  139,  140,  141,  142,   73,   74,   61,  143,  144,
			  145,  146,  147,  148,  149,  150,  151,  556,  161,  162,
			  163,  438,  164,  165,  166,  439,  225,  501,  502,  520, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			  176,   78,  660,  651,   37,  272, -32768, -32768,  805,  794,
			 -32768, -32768, -32768, -32768, -32768, -32768,  200, -32768,  590, -32768,
			  334,  768,  572, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768,  496, -32768, -32768,  787,  332,  430,
			 -32768, -32768, -32768, -32768,   78, -32768, -32768, -32768,  799,  798,
			 -32768, -32768, -32768, -32768,   13, -32768,  796, -32768, -32768, -32768,
			 -32768,  216, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768,   39,   39,    9, -32768, -32768,  305,  777,
			  777,  791, -32768,   46, -32768,   39, -32768, -32768,  507, -32768,
			  572, -32768,  524,  458,  328, -32768,  741, -32768, -32768, -32768,

			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768,  786,  788,  785,  784,  783,  781,
			  780,  779,  776,  775,  774,  773,  772,  769,  766,  765,
			  764,  763,  762,  761,  760,  758,  757,  756,  755,  754,
			  753,  751,  746,  740,  739,  738,  737,  735,  733,  732,
			  731, -32768,  782,  778,    5,  807, -32768,  759,  759, -32768,
			  750,  752, -32768,   15, -32768, -32768, -32768,  337,  405,  405,
			  405,  405,  480,  431,  414,  409,  407,  404,    0,  145,
			 -32768,  182,  198,  302,  220,  201,  138,  250,   27,   72,
			  207,  606,  639,  627,  636,  596,  300,  289,  282,  253,

			  252,  235,  749,  748,  747,  745,  744,  736,  194,   36,
			  226,  221,   20,  186,   45,   31, -32768, -32768, -32768,  771,
			  770,  724,  734, -32768, -32768,  554,  718,  703,  703,  686,
			 -32768, -32768,  730,  729,  728,  727,  726,  722,  720,  709,
			  708,  707,  693,  691,  402,  399,  389,  387,  323,  313,
			  690,  685,  682,  681,  680,  679,  135, -32768,  165, -32768,
			   -9, -32768,  115, -32768,  -12, -32768,   97, -32768,  -20, -32768,
			 -32768, -32768, -32768, -32768, -32768,  714,  700, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,

			 -32768,   86, -32768, -32768,  234, -32768, -32768,  316, -32768, -32768,
			  223, -32768, -32768,  309, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			   55, -32768,  710,  661,  676,  649, -32768, -32768,  656, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768,   74, -32768,  154, -32768,  -10, -32768,   -3, -32768,  -14,
			 -32768,   -6, -32768, -32768, -32768, -32768, -32768, -32768, -32768,   72,
			  669,  207,  668,  639,  667,  636,  666,  627,  665,  596,
			  663,  596,  596,  596,  596,   72,   72,   72,   72,  207,

			  207,  207,  207,  627,  627,  627,  627,  639,  639,  639,
			  639,  636,  636,  636,  636, -32768, -32768, -32768,  664,  697,
			  662,  684,  683,  628,  451,  609,  655, -32768, -32768,  587,
			   18, -32768, -32768, -32768,  334,  630, -32768, -32768, -32768,  723,
			   72,  642,  207,  641,  639,  640,  636,  618,  627,  595,
			  596,  577,  549, -32768,  542, -32768,  527, -32768,  523, -32768,
			  521, -32768,  511, -32768,  260,  484,  488,    5, -32768, -32768,
			 -32768,  180, -32768,  415,   28, -32768, -32768, -32768,  464, -32768,
			 -32768, -32768,  482, -32768,  479, -32768,  476, -32768,  457, -32768,
			  455, -32768,  445, -32768, -32768, -32768, -32768, -32768, -32768, -32768,

			  432,  -29, -32768,  421, -32768,  359,  382,  334,  386,  327,
			  334, -32768,  294, -32768, -32768, -32768, -32768, -32768, -32768,  777,
			  461,  260, -32768, -32768,  603, -32768,  299, -32768, -32768, -32768,
			  200,  233,  278,  209, -32768, -32768,  171,  129,  116, -32768,
			  200,  200,  156, -32768,  777,  318,  126,  -22,  200, -32768,
			   48, -32768, -32768, -32768, -32768, -32768,   44,   35, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			   -7, -32768, -32768,  -16, -32768, -32768,    7, -32768,  412, -32768,
			 -32768, -242,  719,  650,  866, -32768, -32768,  -76,  429, -32768,
			 -32768, -32768, -32768,   25, -32768,  814,  792, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768,   51,  -78,  -74,   76,    4,
			  -64,  -27,  -56, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768,  199,  222,  177,  125,   82,   -8, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768,  790, -32768, -32768,  492,
			 -32768,  398,  652, -32768, -32768, -32768, -32768, -32768,  317, -32768, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   50,  116,  116,  115,  152,  117,  117,   18,  221,  522,
			   89,  100,   14,   13,   82,  102,  172,  102,  103,  103,
			  173,  332,  158,   12,   11,  100,   38,  101,  554,  511,
			  175,  100,  338,    9,   14,  558,  292,  326,  177,  157,
			  268,  510,   14,   13,  557,  325,  336,  159,  103,   13,
			    7,    6,   39,  158,  394,  393,  392,  391,   14,  521,
			  448,   45,  387,   86,  444,  383,   81,  176,  450,   78,
			  157,  446,  425,  424,  423,   14,  223,   14,    5,  291,
			    4,   14,   13,  220,  219,  218,  555,    3,    2,   14,
			  232,  238,  244,  250,  233,  239,  245,  251,  174,    1,

			   90,  155,    9,  274,  235,  241,  247,  253,  278,  220,
			  219,  293,  237,  243,  249,  255,  294,    3,    2,    7,
			    6,  286,  269,  276,  275,   88,  156,   44,  100,   85,
			  298,  290,  155,  220,  219,  415,  167,  339,   14,  299,
			  337,  236,  242,  248,  254,  101,  329,    5,  440,    4,
			  220,  219,  220,  219,  272,  331,    3,    2,   13,  288,
			  398,  397,  396,  395,  220,  219,  297,  102,    1,   13,
			  270,  389,  234,  240,  246,  252,  553,   15,  380,   14,
			   13,   12,   11,   10,  382,   14,  335,  334,  284,  385,
			  287,  507,  477,  316,  549,  323,  296,  271,  386,  322,

			    9,    8,   13,   14,   13,   12,   11,   10,  547,  379,
			  390,   13,  177,  220,  219,  102,  333,    7,    6,   14,
			   13,  546,  330,  172,    9,    8,   54,  328,  442,  508,
			  173,  101,  276,  275,  273,  281,  280,  388,   13,  381,
			    9,    7,    6,  276,  275,    5,  544,    4,  103,  175,
			  277,  103,  100,  285,    3,    2,  101,    7,    6,  282,
			  220,  219,  416,  545,  384,  526,    1,  295,  529,    5,
			  116,    4,  283,   47,  117,  268,  276,  275,    3,    2,
			  176,  100,  314,  441,  324,  276,  275,  315,  321,  443,
			    1,  541,  313,  310,    3,    2,   46,  410,  409,  408,

			  407,  452,  289,  447,  312,  309,    1,  454,  402,  401,
			  400,  399,  276,  275,  174,  451,  543,  232,  238,  244,
			  250,  458,  307,  539,  311,  233,  239,  245,  251,  304,
			  320,   14,   13,  462,  306,  237,  243,  249,  255,  101,
			  301,  303,  449,  281,  280,  102,  500,  235,  241,  247,
			  253,  530,  300,  372,  279,  429,  103,  102,  101,  100,
			  460,  116,  482,  370,  371,  117,  552,  551,  484,  445,
			   60,   59,   58,   57,  369,  308,  236,  242,  248,  254,
			   54,  319,  488,  414,  413,  412,  411,  456,  528,  223,
			  406,  405,  404,  403,  492,  302,   91,   60,   59,   58,

			   57,  317,  171,  170,  169,  168,    3,    2,   14,   13,
			  527,  234,  240,  246,  252,   66,   65,   64,   63,  305,
			  525,  490,   62,   76,  523,  318,  509,  368,   77,  366,
			  471,  473,  474,  103,  102,  101,  100,  429,  367,  364,
			  365,  116,  362,  532,  267,  117,  429,  265,  486,  263,
			  363,  524,  472,  361,  261,  266,   12,   11,  264, -195,
			  262, -195, -195, -195, -195,  260,  116, -195,  550,  519,
			  117,  259, -195, -195, -195, -195, -195, -195, -195, -195,
			 -195, -195,  258,    3,    2,  518, -195, -195, -195, -195,
			 -195, -195, -195, -195, -195,  517, -195,  516, -195, -195,

			 -195,  512,   72,   71,   70,   69,   68,   67,   66,   65,
			   64,   63, -195, -195, -195,   62,  515, -195, -195,  514,
			  257,   77,  513,  540,   50, -196,  504, -196, -196, -196,
			 -196,  256,   50, -196,  548,  503, -195, -195, -196, -196,
			 -196, -196, -196, -196, -196, -196, -196, -196,  534,  533,
			 -195,  499, -196, -196, -196, -196, -196, -196, -196, -196,
			 -196,  498, -196,  497, -196, -196, -196,  496,   72,   71,
			   70,   69,   68,   67,   66,   65,   64,   63, -196, -196,
			 -196,   62,  495, -196, -196,   66,   65,   64,   63,  494,
			   -9,   -9,   62,   -9,   -9,   -9,   -9,   53,   52,   -9,

			   53,   52, -196, -196,   -9,   -9,   -9,   -9,   -9,   -9,
			   -9,   -9,   -9,   -9,   12,   11, -196,  493,   -9,   -9,
			   -9,   -9,   -9,   -9,   -9,   -9,   -9,  100,   -9,  470,
			   -9,   -9,   -9,   12,   11,  491,   -9,   60,   59,   58,
			   57,  343,  342,   -9,   -9,   -9,   -9,  281,  280,   -9,
			   -9,  538,  537,  536,   43,   42,  102,  426,  489,   14,
			   13,   12,   11,   41,   40,  114,  101,  103,   -9,   -9,
			  113,  112,  111,  110,  109,  108,  107,  106,  105,  104,
			  487,  485,  483,  478,  103,  102,  101,  100,   99,   98,
			   97,   96,   95,  475,  469,  468,   94,   93,   92,  467,

			  465,  464,  420,  463,   42,  461,  459,  457,  455,  453,
			  425,  424,  423,  419,  418,  422,  421,  417,   40,  378,
			  377,  376,  375,  348,  480,  374,   14,   13,   12,   11,
			  373,  360,  114,  359,    3,    2,  156,  113,  112,  111,
			  110,  109,  108,  107,  106,  105,  104,  358,  357,  356,
			  345,  103,  102,  101,  100,   99,   98,   97,   96,   95,
			  355,  479,  354,   94,   93,   92,  353,  352,  351,  350,
			  349,  344,  341,   43,   41,  340,  268,  425,  424,  423,
			   14,   13,  422,  421,  313,  310,  114,  307,  304,  301,
			  230,  113,  112,  111,  110,  109,  108,  107,  106,  105,

			  104,    3,    2,  229,  226,  103,  102,  101,  100,   99,
			   98,   97,   96,   95,  224,  231,  217,   94,   93,   92,
			  216,   56,  178,  215,  214,  213,  180,  212,  154,  211,
			  210,  209,  208,   83,  207,   80,   79,  481,  535,  206,
			  437,  205,  204,  203,  202,  201,  200,   49,  199,  198,
			  197,  196,  195,  194,  193,    3,    2,  192,   48,  476,
			  191,  190,  189,  188,  187,   87,   19,  186,  185,  184,
			  153,  183,  182,  181,  179,   84,   75,  228,  347,  505, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			   16,   79,   80,   79,   80,   79,   80,    0,    3,   38,
			    1,   31,    3,    4,    1,   29,   94,   29,   28,   28,
			   94,    1,    7,    5,    6,   31,    1,   30,   50,    1,
			   94,   31,    1,   24,    3,    0,    9,    1,   94,   24,
			   40,   13,    3,    4,    0,    9,    1,    1,   28,    4,
			   41,   42,    1,    7,   74,   75,   76,   77,    3,   88,
			   74,   24,   74,   24,   74,   74,   53,   94,   74,   44,
			   24,   74,   54,   55,   56,    3,  154,    3,   69,   52,
			   71,    3,    4,   78,   79,   80,   38,   78,   79,    3,
			  168,  169,  170,  171,  168,  169,  170,  171,   94,   90,

			   75,   86,   24,  181,  168,  169,  170,  171,  182,   78,
			   79,  189,  168,  169,  170,  171,  190,   78,   79,   41,
			   42,  185,  178,   78,   79,   74,   80,   90,   31,   90,
			  194,  187,   86,   78,   79,   80,   85,  215,    3,  195,
			  214,  168,  169,  170,  171,   30,  210,   69,   74,   71,
			   78,   79,   78,   79,    9,  211,   78,   79,    4,  186,
			   74,   75,   76,   77,   78,   79,  193,   29,   90,    4,
			  178,   74,  168,  169,  170,  171,   50,    1,  256,    3,
			    4,    5,    6,    7,  258,    3,  213,    1,  184,   74,
			   52,   11,  434,  201,   38,    1,  192,   52,  262,  207,

			   24,   25,    4,    3,    4,    5,    6,    7,   92,   74,
			  266,    4,  268,   78,   79,   29,  212,   41,   42,    3,
			    4,   92,    1,  301,   24,   25,   46,    1,   74,  471,
			  304,   30,   78,   79,   52,   41,   42,  264,    4,   74,
			   24,   41,   42,   78,   79,   69,   37,   71,   28,  313,
			   52,   28,   31,   52,   78,   79,   30,   41,   42,  183,
			   78,   79,  340,   92,  260,  507,   90,  191,  510,   69,
			  348,   71,   52,    1,  348,   40,   78,   79,   78,   79,
			  307,   31,  200,  361,  208,   78,   79,   52,  206,  363,
			   90,   58,   40,   40,   78,   79,   24,   74,   75,   76,

			   77,  379,   52,  367,   52,   52,   90,  381,   74,   75,
			   76,   77,   78,   79,  310,  371,   38,  395,  396,  397,
			  398,  385,   40,   24,  199,  399,  400,  401,  402,   40,
			  205,    3,    4,  389,   52,  391,  392,  393,  394,   30,
			   40,   52,  369,   41,   42,   29,   86,  411,  412,  413,
			  414,   57,   52,   40,   52,  348,   28,   29,   30,   31,
			  387,  439,  440,   40,   51,  439,   48,   49,  442,  365,
			   65,   66,   67,   68,   51,  198,  403,  404,  405,  406,
			   46,  204,  446,   74,   75,   76,   77,  383,   61,  467,
			   74,   75,   76,   77,  450,  196,   91,   65,   66,   67,

			   68,  202,   74,   75,   76,   77,   78,   79,    3,    4,
			   24,  407,  408,  409,  410,   78,   79,   80,   81,  197,
			   38,  448,   85,   91,    3,  203,   11,   40,   91,   40,
			  423,  424,  425,   28,   29,   30,   31,  430,   51,   40,
			   51,  519,   40,  519,   40,  519,  439,   40,  444,   40,
			   51,   92,    1,   51,   40,   51,    5,    6,   51,    1,
			   51,    3,    4,    5,    6,   51,  544,    9,  544,   37,
			  544,   40,   14,   15,   16,   17,   18,   19,   20,   21,
			   22,   23,   51,   78,   79,   40,   28,   29,   30,   31,
			   32,   33,   34,   35,   36,   40,   38,   40,   40,   41,

			   42,   37,   72,   73,   74,   75,   76,   77,   78,   79,
			   80,   81,   54,   55,   56,   85,   40,   59,   60,   40,
			   40,   91,   40,  530,  540,    1,   38,    3,    4,    5,
			    6,   51,  548,    9,  541,   51,   78,   79,   14,   15,
			   16,   17,   18,   19,   20,   21,   22,   23,   87,   88,
			   92,   40,   28,   29,   30,   31,   32,   33,   34,   35,
			   36,   40,   38,   40,   40,   41,   42,   40,   72,   73,
			   74,   75,   76,   77,   78,   79,   80,   81,   54,   55,
			   56,   85,   40,   59,   60,   78,   79,   80,   81,   40,
			    0,    1,   85,    3,    4,    5,    6,   10,   11,    9,

			   10,   11,   78,   79,   14,   15,   16,   17,   18,   19,
			   20,   21,   22,   23,    5,    6,   92,   40,   28,   29,
			   30,   31,   32,   33,   34,   35,   36,   31,   38,    1,
			   40,   41,   42,    5,    6,   40,   46,   65,   66,   67,
			   68,   87,   88,   53,   54,   55,   56,   41,   42,   59,
			   60,   48,   49,   50,    3,    4,   29,    1,   40,    3,
			    4,    5,    6,    3,    4,    9,   30,   28,   78,   79,
			   14,   15,   16,   17,   18,   19,   20,   21,   22,   23,
			   40,   40,   40,   53,   28,   29,   30,   31,   32,   33,
			   34,   35,   36,   38,   11,   11,   40,   41,   42,   37,

			    3,   37,   53,   40,    4,   40,   40,   40,   40,   40,
			   54,   55,   56,   37,   53,   59,   60,    7,    4,   40,
			   40,   40,   40,   37,    1,   40,    3,    4,    5,    6,
			   40,   40,    9,   40,   78,   79,   80,   14,   15,   16,
			   17,   18,   19,   20,   21,   22,   23,   40,   40,   40,
			   47,   28,   29,   30,   31,   32,   33,   34,   35,   36,
			   40,   38,   40,   40,   41,   42,   40,   40,   40,   40,
			   40,   53,   38,    3,    3,   51,   40,   54,   55,   56,
			    3,    4,   59,   60,   40,   40,    9,   40,   40,   40,
			   38,   14,   15,   16,   17,   18,   19,   20,   21,   22,

			   23,   78,   79,   53,   45,   28,   29,   30,   31,   32,
			   33,   34,   35,   36,    7,  163,   38,   40,   41,   42,
			   38,   53,   81,   92,   92,   92,   38,   92,   37,   92,
			   92,   92,   92,   37,   88,   37,   37,  439,  521,   88,
			  348,   88,   88,   88,   88,   88,   88,   53,   88,   88,
			   88,   88,   88,   88,   88,   78,   79,   88,   53,  430,
			   88,   88,   88,   88,   88,   73,    0,   88,   88,   88,
			   80,   88,   88,   88,   88,   61,   89,  158,  228,  467, yyDummy>>)
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

	yyvs2: SPECIAL [INTEGER]
			-- Stack for semantic values of type INTEGER

	yyvsc2: INTEGER
			-- Capacity of semantic value stack `yyvs2'

	yyvsp2: INTEGER
			-- Top of semantic value stack `yyvs2'

	yyspecial_routines2: KL_SPECIAL_ROUTINES [INTEGER]
			-- Routines that ought to be in SPECIAL [INTEGER]

	yyvs3: SPECIAL [REAL]
			-- Stack for semantic values of type REAL

	yyvsc3: INTEGER
			-- Capacity of semantic value stack `yyvs3'

	yyvsp3: INTEGER
			-- Top of semantic value stack `yyvs3'

	yyspecial_routines3: KL_SPECIAL_ROUTINES [REAL]
			-- Routines that ought to be in SPECIAL [REAL]

	yyvs4: SPECIAL [STRING]
			-- Stack for semantic values of type STRING

	yyvsc4: INTEGER
			-- Capacity of semantic value stack `yyvs4'

	yyvsp4: INTEGER
			-- Top of semantic value stack `yyvs4'

	yyspecial_routines4: KL_SPECIAL_ROUTINES [STRING]
			-- Routines that ought to be in SPECIAL [STRING]

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

	yyvs18: SPECIAL [C_OBJECT]
			-- Stack for semantic values of type C_OBJECT

	yyvsc18: INTEGER
			-- Capacity of semantic value stack `yyvs18'

	yyvsp18: INTEGER
			-- Top of semantic value stack `yyvs18'

	yyspecial_routines18: KL_SPECIAL_ROUTINES [C_OBJECT]
			-- Routines that ought to be in SPECIAL [C_OBJECT]

	yyvs19: SPECIAL [ARCHETYPE_SLOT]
			-- Stack for semantic values of type ARCHETYPE_SLOT

	yyvsc19: INTEGER
			-- Capacity of semantic value stack `yyvs19'

	yyvsp19: INTEGER
			-- Top of semantic value stack `yyvs19'

	yyspecial_routines19: KL_SPECIAL_ROUTINES [ARCHETYPE_SLOT]
			-- Routines that ought to be in SPECIAL [ARCHETYPE_SLOT]

	yyvs20: SPECIAL [C_ATTRIBUTE]
			-- Stack for semantic values of type C_ATTRIBUTE

	yyvsc20: INTEGER
			-- Capacity of semantic value stack `yyvs20'

	yyvsp20: INTEGER
			-- Top of semantic value stack `yyvs20'

	yyspecial_routines20: KL_SPECIAL_ROUTINES [C_ATTRIBUTE]
			-- Routines that ought to be in SPECIAL [C_ATTRIBUTE]

	yyvs21: SPECIAL [EXPR_ITEM]
			-- Stack for semantic values of type EXPR_ITEM

	yyvsc21: INTEGER
			-- Capacity of semantic value stack `yyvs21'

	yyvsp21: INTEGER
			-- Top of semantic value stack `yyvs21'

	yyspecial_routines21: KL_SPECIAL_ROUTINES [EXPR_ITEM]
			-- Routines that ought to be in SPECIAL [EXPR_ITEM]

	yyvs22: SPECIAL [EXPR_UNARY_OPERATOR]
			-- Stack for semantic values of type EXPR_UNARY_OPERATOR

	yyvsc22: INTEGER
			-- Capacity of semantic value stack `yyvs22'

	yyvsp22: INTEGER
			-- Top of semantic value stack `yyvs22'

	yyspecial_routines22: KL_SPECIAL_ROUTINES [EXPR_UNARY_OPERATOR]
			-- Routines that ought to be in SPECIAL [EXPR_UNARY_OPERATOR]

	yyvs23: SPECIAL [EXPR_BINARY_OPERATOR]
			-- Stack for semantic values of type EXPR_BINARY_OPERATOR

	yyvsc23: INTEGER
			-- Capacity of semantic value stack `yyvs23'

	yyvsp23: INTEGER
			-- Top of semantic value stack `yyvs23'

	yyspecial_routines23: KL_SPECIAL_ROUTINES [EXPR_BINARY_OPERATOR]
			-- Routines that ought to be in SPECIAL [EXPR_BINARY_OPERATOR]

	yyvs24: SPECIAL [EXPR_LEAF]
			-- Stack for semantic values of type EXPR_LEAF

	yyvsc24: INTEGER
			-- Capacity of semantic value stack `yyvs24'

	yyvsp24: INTEGER
			-- Top of semantic value stack `yyvs24'

	yyspecial_routines24: KL_SPECIAL_ROUTINES [EXPR_LEAF]
			-- Routines that ought to be in SPECIAL [EXPR_LEAF]

	yyvs25: SPECIAL [BOOLEAN]
			-- Stack for semantic values of type BOOLEAN

	yyvsc25: INTEGER
			-- Capacity of semantic value stack `yyvs25'

	yyvsp25: INTEGER
			-- Top of semantic value stack `yyvs25'

	yyspecial_routines25: KL_SPECIAL_ROUTINES [BOOLEAN]
			-- Routines that ought to be in SPECIAL [BOOLEAN]

	yyvs26: SPECIAL [ISO8601_DATE]
			-- Stack for semantic values of type ISO8601_DATE

	yyvsc26: INTEGER
			-- Capacity of semantic value stack `yyvs26'

	yyvsp26: INTEGER
			-- Top of semantic value stack `yyvs26'

	yyspecial_routines26: KL_SPECIAL_ROUTINES [ISO8601_DATE]
			-- Routines that ought to be in SPECIAL [ISO8601_DATE]

	yyvs27: SPECIAL [ISO8601_DATE_TIME]
			-- Stack for semantic values of type ISO8601_DATE_TIME

	yyvsc27: INTEGER
			-- Capacity of semantic value stack `yyvs27'

	yyvsp27: INTEGER
			-- Top of semantic value stack `yyvs27'

	yyspecial_routines27: KL_SPECIAL_ROUTINES [ISO8601_DATE_TIME]
			-- Routines that ought to be in SPECIAL [ISO8601_DATE_TIME]

	yyvs28: SPECIAL [ISO8601_TIME]
			-- Stack for semantic values of type ISO8601_TIME

	yyvsc28: INTEGER
			-- Capacity of semantic value stack `yyvs28'

	yyvsp28: INTEGER
			-- Top of semantic value stack `yyvs28'

	yyspecial_routines28: KL_SPECIAL_ROUTINES [ISO8601_TIME]
			-- Routines that ought to be in SPECIAL [ISO8601_TIME]

	yyvs29: SPECIAL [ISO8601_DURATION]
			-- Stack for semantic values of type ISO8601_DURATION

	yyvsc29: INTEGER
			-- Capacity of semantic value stack `yyvs29'

	yyvsp29: INTEGER
			-- Top of semantic value stack `yyvs29'

	yyspecial_routines29: KL_SPECIAL_ROUTINES [ISO8601_DURATION]
			-- Routines that ought to be in SPECIAL [ISO8601_DURATION]

	yyvs30: SPECIAL [URI]
			-- Stack for semantic values of type URI

	yyvsc30: INTEGER
			-- Capacity of semantic value stack `yyvs30'

	yyvsp30: INTEGER
			-- Top of semantic value stack `yyvs30'

	yyspecial_routines30: KL_SPECIAL_ROUTINES [URI]
			-- Routines that ought to be in SPECIAL [URI]

	yyvs31: SPECIAL [ARRAYED_LIST [STRING]]
			-- Stack for semantic values of type ARRAYED_LIST [STRING]

	yyvsc31: INTEGER
			-- Capacity of semantic value stack `yyvs31'

	yyvsp31: INTEGER
			-- Top of semantic value stack `yyvs31'

	yyspecial_routines31: KL_SPECIAL_ROUTINES [ARRAYED_LIST [STRING]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [STRING]]

	yyvs32: SPECIAL [ARRAYED_LIST [INTEGER]]
			-- Stack for semantic values of type ARRAYED_LIST [INTEGER]

	yyvsc32: INTEGER
			-- Capacity of semantic value stack `yyvs32'

	yyvsp32: INTEGER
			-- Top of semantic value stack `yyvs32'

	yyspecial_routines32: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTEGER]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTEGER]]

	yyvs33: SPECIAL [ARRAYED_LIST [REAL]]
			-- Stack for semantic values of type ARRAYED_LIST [REAL]

	yyvsc33: INTEGER
			-- Capacity of semantic value stack `yyvs33'

	yyvsp33: INTEGER
			-- Top of semantic value stack `yyvs33'

	yyspecial_routines33: KL_SPECIAL_ROUTINES [ARRAYED_LIST [REAL]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [REAL]]

	yyvs34: SPECIAL [ARRAYED_LIST [BOOLEAN]]
			-- Stack for semantic values of type ARRAYED_LIST [BOOLEAN]

	yyvsc34: INTEGER
			-- Capacity of semantic value stack `yyvs34'

	yyvsp34: INTEGER
			-- Top of semantic value stack `yyvs34'

	yyspecial_routines34: KL_SPECIAL_ROUTINES [ARRAYED_LIST [BOOLEAN]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [BOOLEAN]]

	yyvs35: SPECIAL [ARRAYED_LIST [ISO8601_DATE]]
			-- Stack for semantic values of type ARRAYED_LIST [ISO8601_DATE]

	yyvsc35: INTEGER
			-- Capacity of semantic value stack `yyvs35'

	yyvsp35: INTEGER
			-- Top of semantic value stack `yyvs35'

	yyspecial_routines35: KL_SPECIAL_ROUTINES [ARRAYED_LIST [ISO8601_DATE]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ISO8601_DATE]]

	yyvs36: SPECIAL [ARRAYED_LIST [ISO8601_TIME]]
			-- Stack for semantic values of type ARRAYED_LIST [ISO8601_TIME]

	yyvsc36: INTEGER
			-- Capacity of semantic value stack `yyvs36'

	yyvsp36: INTEGER
			-- Top of semantic value stack `yyvs36'

	yyspecial_routines36: KL_SPECIAL_ROUTINES [ARRAYED_LIST [ISO8601_TIME]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ISO8601_TIME]]

	yyvs37: SPECIAL [ARRAYED_LIST [ISO8601_DATE_TIME]]
			-- Stack for semantic values of type ARRAYED_LIST [ISO8601_DATE_TIME]

	yyvsc37: INTEGER
			-- Capacity of semantic value stack `yyvs37'

	yyvsp37: INTEGER
			-- Top of semantic value stack `yyvs37'

	yyspecial_routines37: KL_SPECIAL_ROUTINES [ARRAYED_LIST [ISO8601_DATE_TIME]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ISO8601_DATE_TIME]]

	yyvs38: SPECIAL [ARRAYED_LIST [ISO8601_DURATION]]
			-- Stack for semantic values of type ARRAYED_LIST [ISO8601_DURATION]

	yyvsc38: INTEGER
			-- Capacity of semantic value stack `yyvs38'

	yyvsp38: INTEGER
			-- Top of semantic value stack `yyvs38'

	yyspecial_routines38: KL_SPECIAL_ROUTINES [ARRAYED_LIST [ISO8601_DURATION]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ISO8601_DURATION]]

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

	yyvs45: SPECIAL [ARRAYED_LIST [INTERVAL [INTEGER]]]
			-- Stack for semantic values of type ARRAYED_LIST [INTERVAL [INTEGER]]

	yyvsc45: INTEGER
			-- Capacity of semantic value stack `yyvs45'

	yyvsp45: INTEGER
			-- Top of semantic value stack `yyvs45'

	yyspecial_routines45: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTERVAL [INTEGER]]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTERVAL [INTEGER]]]

	yyvs46: SPECIAL [ARRAYED_LIST [INTERVAL [REAL]]]
			-- Stack for semantic values of type ARRAYED_LIST [INTERVAL [REAL]]

	yyvsc46: INTEGER
			-- Capacity of semantic value stack `yyvs46'

	yyvsp46: INTEGER
			-- Top of semantic value stack `yyvs46'

	yyspecial_routines46: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTERVAL [REAL]]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTERVAL [REAL]]]

	yyvs47: SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_TIME]]]
			-- Stack for semantic values of type ARRAYED_LIST [INTERVAL [ISO8601_TIME]]

	yyvsc47: INTEGER
			-- Capacity of semantic value stack `yyvs47'

	yyvsp47: INTEGER
			-- Top of semantic value stack `yyvs47'

	yyspecial_routines47: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTERVAL [ISO8601_TIME]]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_TIME]]]

	yyvs48: SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_DATE]]]
			-- Stack for semantic values of type ARRAYED_LIST [INTERVAL [ISO8601_DATE]]

	yyvsc48: INTEGER
			-- Capacity of semantic value stack `yyvs48'

	yyvsp48: INTEGER
			-- Top of semantic value stack `yyvs48'

	yyspecial_routines48: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTERVAL [ISO8601_DATE]]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_DATE]]]

	yyvs49: SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_DATE_TIME]]]
			-- Stack for semantic values of type ARRAYED_LIST [INTERVAL [ISO8601_DATE_TIME]]

	yyvsc49: INTEGER
			-- Capacity of semantic value stack `yyvs49'

	yyvsp49: INTEGER
			-- Top of semantic value stack `yyvs49'

	yyspecial_routines49: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTERVAL [ISO8601_DATE_TIME]]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_DATE_TIME]]]

	yyvs50: SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_DURATION]]]
			-- Stack for semantic values of type ARRAYED_LIST [INTERVAL [ISO8601_DURATION]]

	yyvsc50: INTEGER
			-- Capacity of semantic value stack `yyvs50'

	yyvsp50: INTEGER
			-- Top of semantic value stack `yyvs50'

	yyspecial_routines50: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTERVAL [ISO8601_DURATION]]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_DURATION]]]

	yyvs51: SPECIAL [C_BOOLEAN]
			-- Stack for semantic values of type C_BOOLEAN

	yyvsc51: INTEGER
			-- Capacity of semantic value stack `yyvs51'

	yyvsp51: INTEGER
			-- Top of semantic value stack `yyvs51'

	yyspecial_routines51: KL_SPECIAL_ROUTINES [C_BOOLEAN]
			-- Routines that ought to be in SPECIAL [C_BOOLEAN]

	yyvs52: SPECIAL [C_STRING]
			-- Stack for semantic values of type C_STRING

	yyvsc52: INTEGER
			-- Capacity of semantic value stack `yyvs52'

	yyvsp52: INTEGER
			-- Top of semantic value stack `yyvs52'

	yyspecial_routines52: KL_SPECIAL_ROUTINES [C_STRING]
			-- Routines that ought to be in SPECIAL [C_STRING]

	yyvs53: SPECIAL [C_DATE_TIME]
			-- Stack for semantic values of type C_DATE_TIME

	yyvsc53: INTEGER
			-- Capacity of semantic value stack `yyvs53'

	yyvsp53: INTEGER
			-- Top of semantic value stack `yyvs53'

	yyspecial_routines53: KL_SPECIAL_ROUTINES [C_DATE_TIME]
			-- Routines that ought to be in SPECIAL [C_DATE_TIME]

	yyvs54: SPECIAL [C_DURATION]
			-- Stack for semantic values of type C_DURATION

	yyvsc54: INTEGER
			-- Capacity of semantic value stack `yyvs54'

	yyvsp54: INTEGER
			-- Top of semantic value stack `yyvs54'

	yyspecial_routines54: KL_SPECIAL_ROUTINES [C_DURATION]
			-- Routines that ought to be in SPECIAL [C_DURATION]

	yyvs55: SPECIAL [C_DATE]
			-- Stack for semantic values of type C_DATE

	yyvsc55: INTEGER
			-- Capacity of semantic value stack `yyvs55'

	yyvsp55: INTEGER
			-- Top of semantic value stack `yyvs55'

	yyspecial_routines55: KL_SPECIAL_ROUTINES [C_DATE]
			-- Routines that ought to be in SPECIAL [C_DATE]

	yyvs56: SPECIAL [C_TIME]
			-- Stack for semantic values of type C_TIME

	yyvsc56: INTEGER
			-- Capacity of semantic value stack `yyvs56'

	yyvsp56: INTEGER
			-- Top of semantic value stack `yyvs56'

	yyspecial_routines56: KL_SPECIAL_ROUTINES [C_TIME]
			-- Routines that ought to be in SPECIAL [C_TIME]

	yyvs57: SPECIAL [C_REAL]
			-- Stack for semantic values of type C_REAL

	yyvsc57: INTEGER
			-- Capacity of semantic value stack `yyvs57'

	yyvsp57: INTEGER
			-- Top of semantic value stack `yyvs57'

	yyspecial_routines57: KL_SPECIAL_ROUTINES [C_REAL]
			-- Routines that ought to be in SPECIAL [C_REAL]

	yyvs58: SPECIAL [C_INTEGER]
			-- Stack for semantic values of type C_INTEGER

	yyvsc58: INTEGER
			-- Capacity of semantic value stack `yyvs58'

	yyvsp58: INTEGER
			-- Top of semantic value stack `yyvs58'

	yyspecial_routines58: KL_SPECIAL_ROUTINES [C_INTEGER]
			-- Routines that ought to be in SPECIAL [C_INTEGER]

	yyvs59: SPECIAL [C_TERMINOLOGY_CODE]
			-- Stack for semantic values of type C_TERMINOLOGY_CODE

	yyvsc59: INTEGER
			-- Capacity of semantic value stack `yyvs59'

	yyvsp59: INTEGER
			-- Top of semantic value stack `yyvs59'

	yyspecial_routines59: KL_SPECIAL_ROUTINES [C_TERMINOLOGY_CODE]
			-- Routines that ought to be in SPECIAL [C_TERMINOLOGY_CODE]

feature {NONE} -- Constants

	yyFinal: INTEGER = 558
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 93
			-- Number of tokens

	yyLast: INTEGER = 879
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 334
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 183
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

	execute (in_text:STRING; a_source_start_line: INTEGER; aca: ARCH_LIB_ARCHETYPE_ITEM)
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

	target_descriptor: detachable ARCH_LIB_ARCHETYPE_ITEM
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

	safe_put_c_attribute_child (an_obj: C_OBJECT)
			-- check child object for validity and then put as new child
		require
			Not_already_added: not c_attrs.item.has_child (an_obj)
		do
			if not c_attrs.is_empty then
				debug ("ADL_parse")
					io.put_string (indent + "ATTR_NODE " + c_attrs.item.rm_attribute_name + " put_child (" + 
							an_obj.generating_type + ": " + an_obj.rm_type_name + " [id=" + an_obj.node_id + "])%N") 
				end

				if check_c_attribute_child (c_attrs.item, an_obj) then
					c_attrs.item.put_child (an_obj)
				end
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

			if an_attr.has_child_with_id (an_obj.node_id) then
				err_code := ec_VCOSU
			elseif an_attr.is_single then
				if an_obj.occurrences /= Void and then (an_obj.occurrences.upper_unbounded or an_obj.occurrences.upper > 1) then
					err_code := ec_VACSO
				else
					Result := True
				end
			elseif an_attr.is_multiple then
				if (an_attr.cardinality /= Void and then not an_attr.cardinality.interval.upper_unbounded) and 
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

	rm_prop_def: detachable BMM_PROPERTY [BMM_TYPE]

	ca_tuple: C_ATTRIBUTE_TUPLE
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

	archetype_ref: STRING
		attribute
			create Result.make (0)
		end

	id_code: STRING
		attribute
			create Result.make (0)
		end

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

end
