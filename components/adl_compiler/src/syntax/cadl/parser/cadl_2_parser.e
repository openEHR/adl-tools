note
	component:   "openEHR ADL Tools"
	description: "Validating parser for Archetype Description Language (ADL)"
	keywords:	 "ADL"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class CADL_2_PARSER

inherit
	PARSER_VALIDATOR
		rename
			reset as validator_reset,
			make as make_parser_skeleton
		end

	CADL_2_SCANNER
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
			yyval20: C_OBJECT
			yyval9: C_ARCHETYPE_ROOT
			yyval10: C_COMPLEX_OBJECT_PROXY
			yyval18: ARCHETYPE_SLOT
			yyval17: C_PRIMITIVE_OBJECT
			yyval19: C_ATTRIBUTE
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
--|#line 172 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 172")
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
--|#line 180 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 180")
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
--|#line 188 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 188")
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
--|#line 197 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 197")
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
--|#line 206 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 206")
end

			-- used to: establish a more specific RM type; and for redefinition of occurrences or node_id 
			-- in a specialised archetype or template
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
--|#line 219 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 219")
end

			yyval16 := yyvs16.item (yyvsp16)
			if attached yyvs14.item (yyvsp14) as att_occ then
				yyvs16.item (yyvsp16).set_occurrences (att_occ)
			end

			if ref_model.has_class_definition (yyvs16.item (yyvsp16).rm_type_name) then
				object_nodes.extend (yyvs16.item (yyvsp16))
				if not c_attrs.is_empty then
					safe_put_c_attribute_child (yyvs16.item (yyvsp16))
				end
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
--|#line 245 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 245")
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
--|#line 253 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 253")
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
--|#line 264 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 264")
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
--|#line 283 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 283")
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
--|#line 287 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 287")
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
--|#line 293 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 293")
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
--|#line 300 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 300")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 14 then
--|#line 303 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 303")
end

			abort_with_error (ec_SCOAT, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 15 then
--|#line 312 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 312")
end

			yyval20 := yyvs16.item (yyvsp16)
			-- safe_put_c_attribute_child was called when the C_COMPLEX_OBJECT block was entered
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp20 := yyvsp20 + 1
	yyvsp16 := yyvsp16 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 16 then
--|#line 317 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 317")
end

			yyval20 := yyvs17.item (yyvsp17)
			-- safe_put_c_attribute_child was called when the C_PRIMITIVE_OBJECT block was entered
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp20 := yyvsp20 + 1
	yyvsp17 := yyvsp17 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 17 then
--|#line 322 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 322")
end

			yyval20 := yyvs20.item (yyvsp20)
			safe_put_c_attribute_child (yyval20)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 18 then
--|#line 327 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 327")
end

			yyval20 := yyvs20.item (yyvsp20)
			yyvs20.item (yyvsp20).set_sibling_order (yyvs11.item (yyvsp11))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp11 := yyvsp11 -1
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 19 then
--|#line 332 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 332")
end

			abort_with_error (ec_SCCOG, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp20 := yyvsp20 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 20 then
--|#line 341 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 341")
end

			yyval20 := yyvs9.item (yyvsp9)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp20 := yyvsp20 + 1
	yyvsp9 := yyvsp9 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 21 then
--|#line 345 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 345")
end

			yyval20 := yyvs10.item (yyvsp10)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp20 := yyvsp20 + 1
	yyvsp10 := yyvsp10 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 22 then
--|#line 349 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 349")
end

			yyval20 := yyvs18.item (yyvsp18)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp20 := yyvsp20 + 1
	yyvsp18 := yyvsp18 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 23 then
--|#line 353 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 353")
end

			yyval20 := yyvs17.item (yyvsp17)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp20 := yyvsp20 + 1
	yyvsp17 := yyvsp17 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 24 then
--|#line 367 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 367")
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
when 25 then
--|#line 380 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 380")
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
when 26 then
--|#line 386 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 386")
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
when 27 then
--|#line 409 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 409")
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
when 28 then
--|#line 427 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 427")
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
when 29 then
--|#line 433 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 433")
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
when 30 then
--|#line 447 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 447")
end

			yyval18 := yyvs18.item (yyvsp18)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
when 31 then
--|#line 453 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 453")
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
when 32 then
--|#line 471 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 471")
end

			create yyval18.make (yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp18 := yyvsp18 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -2
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
--|#line 475 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 475")
end

			create yyval18.make (yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4))
			yyval18.set_closed
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp18 := yyvsp18 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp4 := yyvsp4 -2
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
--|#line 483 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 483")
end

			if version_less_than (target_descriptor.file_mgr.adl_version, Adl_id_code_version) and not object_nodes.is_empty then
				create yyval18.make (yyvs4.item (yyvsp4), new_fake_node_id)
			else
				abort_with_error (ec_VCOID, <<yyvs4.item (yyvsp4), c_attrs.item.path>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp18 := yyvsp18 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
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
--|#line 494 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 494")
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
when 36 then
--|#line 504 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 504")
end

			yyval17 := yyvs17.item (yyvsp17)
			yyval17.set_node_id (yyvs4.item (yyvsp4))

			if ref_model.is_enumerated_type (yyvs4.item (yyvsp4 - 1)) then
				yyval17.set_enumerated_type_constraint 
				yyval17.set_rm_type_name (yyvs4.item (yyvsp4 - 1))
			end

			if attached yyvs14.item (yyvsp14) as att_occ then
				yyval17.set_occurrences (att_occ)
			end

			safe_put_c_attribute_child (yyval17)

			debug ("ADL_parse")
				io.put_string (indent + "Regular primitive OBJECT_NODE with constraint " + yyval17.rm_type_name + " [id=" + yyval17.node_id + "]%N") 
				if yyvs14.item (yyvsp14) /= Void then
					io.put_string ("; occurrences=(" + yyvs14.item (yyvsp14).as_string + ")") 
				end
				io.new_line
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp4 := yyvsp4 -2
	yyvsp14 := yyvsp14 -1
	yyvsp1 := yyvsp1 -3
	yyspecial_routines17.force (yyvs17, yyval17, yyvsp17)
end
when 37 then
--|#line 528 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 528")
end

			-- have to figure out which kind of C_PRIMITIVE_OBJECT to create
			if attached aom_profile as aomp and then aomp.has_aom_primitive_type (yyvs4.item (yyvsp4 - 1)) then
				check attached c_primitive_subtype_creator_agents.item (aomp.aom_primitive_type (yyvs4.item (yyvsp4 - 1))) as c_prim_agt then
					yyval17 := c_prim_agt.item ([yyvs4.item (yyvsp4)])
				end
			elseif c_primitive_subtypes.has (yyvs4.item (yyvsp4 - 1).as_upper) then
				check attached c_primitive_subtypes.item (yyvs4.item (yyvsp4 - 1).as_upper) as aomt and then 
					attached c_primitive_subtype_creator_agents.item (aomt) as c_prim_agt 
				then
					yyval17 := c_prim_agt.item ([yyvs4.item (yyvsp4)])
				end
			elseif ref_model.is_enumerated_type (yyvs4.item (yyvsp4 - 1)) then
				bmm_enum := ref_model.enumeration_definition (yyvs4.item (yyvsp4 - 1))
				if attached {BMM_ENUMERATION_INTEGER} bmm_enum then
					create {C_INTEGER} yyval17.make_identified_default (yyvs4.item (yyvsp4))
				elseif attached {BMM_ENUMERATION_STRING} bmm_enum then
					create {C_STRING} yyval17.make_identified_default (yyvs4.item (yyvsp4))
				else
					-- some other enum type not yet supported
				end
				yyval17.set_rm_type_name (yyvs4.item (yyvsp4 - 1))
				yyval17.set_enumerated_type_constraint 
			else
				-- type is unknown as primitive or enumerated; will get picked up
				-- in validator
			end

			if attached yyval17 then
				if attached yyvs14.item (yyvsp14) as att_occ then
					yyval17.set_occurrences (att_occ)
				end

				safe_put_c_attribute_child (yyval17)

				debug ("ADL_parse")
					io.put_string (indent + "Regular primitive OBJECT_NODE " + yyval17.rm_type_name + " [id=" + yyval17.node_id + "]%N") 
					if attached yyvs14.item (yyvsp14) then
						io.put_string ("; occurrences=(" + yyvs14.item (yyvsp14).as_string + ")") 
					end
					io.new_line
				end
			else
				abort_with_error (ec_VCORM, <<yyvs4.item (yyvsp4 - 1), c_attrs.item.path>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp17 := yyvsp17 + 1
	yyvsp4 := yyvsp4 -2
	yyvsp14 := yyvsp14 -1
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
--|#line 581 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 581")
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
when 39 then
--|#line 588 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 588")
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
when 40 then
--|#line 595 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 595")
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
when 41 then
--|#line 602 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 602")
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
when 42 then
--|#line 609 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 609")
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
when 43 then
--|#line 616 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 616")
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
when 44 then
--|#line 623 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 623")
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
when 45 then
--|#line 630 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 630")
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
when 46 then
--|#line 637 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 637")
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
when 47 then
--|#line 646 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 646")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 48 then
--|#line 653 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 653")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 49 then
--|#line 656 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 656")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 50 then
--|#line 661 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 661")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 51 then
--|#line 664 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 664")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 52 then
--|#line 669 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 669")
end

			yyval1 := yyvs19.item (yyvsp19)
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
when 53 then
--|#line 678 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 678")
end

			yyval1 := yyvs19.item (yyvsp19)
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
when 54 then
--|#line 683 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 683")
end

			yyval1 := yyvs19.item (yyvsp19)
			abort_with_error (ec_SCAS, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp19 := yyvsp19 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 55 then
--|#line 690 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 690")
end

			rm_attribute_name := yyvs4.item (yyvsp4)
			if not object_nodes.item.has_attribute (rm_attribute_name) then
				if ref_model.has_property (object_nodes.item.rm_type_name, rm_attribute_name) then
					rm_prop_def := ref_model.property_definition (object_nodes.item.rm_type_name, rm_attribute_name)
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
	yyvsp4 := yyvsp4 -1
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
when 56 then
--|#line 730 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 730")
end

			create og_path.make_from_string (yyvs4.item (yyvsp4))
			rm_attribute_name := og_path.last.attr_name
			parent_path_str := og_path.parent_path.as_string

			if not object_nodes.item.has_attribute (yyvs4.item (yyvsp4)) then
				-- check RM to see if path is valid, and if it is a container
				if ref_model.has_property_path (object_nodes.item.rm_type_name, yyvs4.item (yyvsp4)) then
					rm_prop_def := ref_model.property_definition_at_path (object_nodes.item.rm_type_name, yyvs4.item (yyvsp4))
					if rm_prop_def.is_container then
						create yyval19.make_multiple (rm_attribute_name, yyvs14.item (yyvsp14), yyvs15.item (yyvsp15))
						yyval19.set_differential_path (parent_path_str)
						c_attrs.put (yyval19)
debug ("ADL_parse")
	io.put_string (indent + "PUSH create ATTR_NODE " + yyvs4.item (yyvsp4) + "; container = " + yyval19.is_multiple.out) 
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
	io.put_string (indent + "PUSH create ATTR_NODE " + yyvs4.item (yyvsp4) + "; container = " + yyval19.is_multiple.out) 
	if attached yyvs14.item (yyvsp14) as att_ex then io.put_string (" existence={" + att_ex.as_string + "}") end
	io.new_line
	io.put_string (indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_attribute (REL)%N") 
	indent.append ("%T")
end
						object_nodes.item.put_attribute (yyval19)
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
	yyvsp19 := yyvsp19 + 1
	yyvsp4 := yyvsp4 -1
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
when 57 then
--|#line 778 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 778")
end

		
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
when 58 then
--|#line 781 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 781")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp20 := yyvsp20 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 59 then
--|#line 784 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 784")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 60 then
--|#line 789 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 789")
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
when 61 then
--|#line 810 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 810")
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
when 62 then
--|#line 820 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 820")
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
when 63 then
--|#line 829 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 829")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 64 then
--|#line 832 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 832")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 65 then
--|#line 837 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 837")
end

			debug ("ADL_parse")
				io.put_string (indent + "c_object_tuple - received one tuple %N") 
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 66 then
--|#line 845 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 845")
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
when 67 then
--|#line 858 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 858")
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
when 68 then
--|#line 869 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 869")
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
when 69 then
--|#line 870 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 870")
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
when 70 then
--|#line 879 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 879")
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
when 71 then
--|#line 880 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 880")
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
when 72 then
--|#line 893 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 893")
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
when 73 then
--|#line 898 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 898")
end

			yyvs7.item (yyvsp7).extend (yyvs8.item (yyvsp8))
			yyval7 := yyvs7.item (yyvsp7)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp8 := yyvsp8 -1
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 74 then
--|#line 905 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 905")
end

			create yyval8.make_with_tag (yyvs21.item (yyvsp21), yyvs4.item (yyvsp4))
		
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
when 75 then
--|#line 909 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 909")
end

			create yyval8.make (yyvs21.item (yyvsp21))
		
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
when 76 then
--|#line 917 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 917")
end

			create yyval8.make (yyvs23.item (yyvsp23))
		
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
when 77 then
--|#line 921 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 921")
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
when 78 then
--|#line 929 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 929")
end

			yyval21 := yyvs21.item (yyvsp21)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 79 then
--|#line 933 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 933")
end

			yyval21 := yyvs21.item (yyvsp21)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 80 then
--|#line 939 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 939")
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
when 81 then
--|#line 946 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 946")
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
when 82 then
--|#line 952 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 952")
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
when 83 then
--|#line 956 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 956")
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
when 84 then
--|#line 963 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 963")
end

			yyval21 := yyvs21.item (yyvsp21)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 85 then
--|#line 967 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 967")
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
when 86 then
--|#line 977 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 977")
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
when 87 then
--|#line 988 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 988")
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
when 88 then
--|#line 997 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 997")
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
when 89 then
--|#line 1012 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1012")
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
when 90 then
--|#line 1019 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1019")
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
when 91 then
--|#line 1026 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1026")
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
when 92 then
--|#line 1033 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1033")
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
when 93 then
--|#line 1043 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1043")
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
when 94 then
--|#line 1052 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1052")
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
when 95 then
--|#line 1056 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1056")
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
when 96 then
--|#line 1060 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1060")
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
when 97 then
--|#line 1064 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1064")
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
when 98 then
--|#line 1074 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1074")
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
when 99 then
--|#line 1078 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1078")
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
when 100 then
--|#line 1088 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1088")
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
when 101 then
--|#line 1101 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1101")
end

			yyval21 := yyvs21.item (yyvsp21)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 102 then
--|#line 1105 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1105")
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
when 103 then
--|#line 1111 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1111")
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
when 104 then
--|#line 1115 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1115")
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
when 105 then
--|#line 1128 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1128")
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
when 106 then
--|#line 1141 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1141")
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
when 107 then
--|#line 1148 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1148")
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
when 108 then
--|#line 1155 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1155")
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
when 109 then
--|#line 1164 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1164")
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
when 110 then
--|#line 1168 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1168")
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
when 111 then
--|#line 1172 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1172")
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
when 112 then
--|#line 1176 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1176")
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
when 113 then
--|#line 1180 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1180")
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
when 114 then
--|#line 1184 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1184")
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
when 115 then
--|#line 1190 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1190")
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
when 116 then
--|#line 1194 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1194")
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
when 117 then
--|#line 1198 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1198")
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
when 118 then
--|#line 1202 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1202")
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
when 119 then
--|#line 1206 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1206")
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
when 120 then
--|#line 1215 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1215")
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
when 121 then
--|#line 1216 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1216")
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
when 122 then
--|#line 1222 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1222")
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
when 123 then
--|#line 1232 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1232")
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
when 124 then
--|#line 1254 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1254")
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
when 125 then
--|#line 1255 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1255")
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
when 126 then
--|#line 1261 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1261")
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
when 127 then
--|#line 1265 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1265")
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
when 128 then
--|#line 1269 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1269")
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
when 129 then
--|#line 1274 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1274")
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
when 130 then
--|#line 1279 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1279")
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
when 131 then
--|#line 1284 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1284")
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
when 132 then
--|#line 1290 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1290")
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
when 133 then
--|#line 1295 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1295")
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
when 134 then
--|#line 1303 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1303")
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
when 135 then
--|#line 1304 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1304")
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
when 136 then
--|#line 1308 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1308")
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
when 137 then
--|#line 1314 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1314")
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
when 138 then
--|#line 1318 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1318")
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
when 139 then
--|#line 1322 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1322")
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
when 140 then
--|#line 1326 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1326")
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
when 141 then
--|#line 1334 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1334")
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
when 142 then
--|#line 1338 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1338")
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
when 143 then
--|#line 1342 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1342")
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
when 144 then
--|#line 1346 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1346")
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
when 145 then
--|#line 1350 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1350")
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
when 146 then
--|#line 1359 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1359")
end

			abort_with_error (ec_SCIAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines58.force (yyvs58, yyval58, yyvsp58)
end
when 147 then
--|#line 1365 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1365")
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
when 148 then
--|#line 1369 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1369")
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
when 149 then
--|#line 1373 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1373")
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
when 150 then
--|#line 1377 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1377")
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
when 151 then
--|#line 1381 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1381")
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
when 152 then
--|#line 1390 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1390")
end

			abort_with_error (ec_SCRAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
when 153 then
--|#line 1396 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1396")
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
when 154 then
--|#line 1412 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1412")
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
when 155 then
--|#line 1416 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1416")
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
when 156 then
--|#line 1420 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1420")
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
when 157 then
--|#line 1424 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1424")
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
when 158 then
--|#line 1428 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1428")
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
when 159 then
--|#line 1437 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1437")
end

			abort_with_error (ec_SCDAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
when 160 then
--|#line 1443 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1443")
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
when 161 then
--|#line 1458 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1458")
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
when 162 then
--|#line 1462 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1462")
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
when 163 then
--|#line 1466 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1466")
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
when 164 then
--|#line 1470 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1470")
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
when 165 then
--|#line 1474 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1474")
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
when 166 then
--|#line 1483 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1483")
end

			abort_with_error (ec_SCTAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines56.force (yyvs56, yyval56, yyvsp56)
end
when 167 then
--|#line 1489 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1489")
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
when 168 then
--|#line 1504 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1504")
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
when 169 then
--|#line 1508 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1508")
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
when 170 then
--|#line 1512 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1512")
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
when 171 then
--|#line 1516 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1516")
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
when 172 then
--|#line 1520 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1520")
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
when 173 then
--|#line 1529 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1529")
end

			abort_with_error (ec_SCDTAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines53.force (yyvs53, yyval53, yyvsp53)
end
when 174 then
--|#line 1535 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1535")
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
when 175 then
--|#line 1543 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1543")
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
when 176 then
--|#line 1551 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1551")
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
when 177 then
--|#line 1559 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1559")
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
when 178 then
--|#line 1563 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1563")
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
when 179 then
--|#line 1567 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1567")
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
when 180 then
--|#line 1571 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1571")
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
when 181 then
--|#line 1575 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1575")
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
when 182 then
--|#line 1584 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1584")
end

			abort_with_error (ec_SCDUAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines54.force (yyvs54, yyval54, yyvsp54)
end
when 183 then
--|#line 1589 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1589")
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
when 184 then
--|#line 1595 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1595")
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
when 185 then
--|#line 1599 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1599")
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
when 186 then
--|#line 1603 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1603")
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
when 187 then
--|#line 1610 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1610")
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
when 188 then
--|#line 1619 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1619")
end

			abort_with_error (ec_SCSAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
when 189 then
--|#line 1625 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1625")
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
when 190 then
--|#line 1629 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1629")
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
when 191 then
--|#line 1635 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1635")
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
when 192 then
--|#line 1642 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1642")
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
when 193 then
--|#line 1659 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1659")
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
when 194 then
--|#line 1740 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1740")
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
when 195 then
--|#line 1744 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1744")
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
when 196 then
--|#line 1748 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1748")
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
when 197 then
--|#line 1752 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1752")
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
when 198 then
--|#line 1758 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1758")
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
when 199 then
--|#line 1762 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1762")
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
when 200 then
--|#line 1766 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1766")
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
when 201 then
--|#line 1770 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1770")
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
when 202 then
--|#line 1779 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1779")
end

			abort_with_error (ec_SCBAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
when 203 then
--|#line 1785 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1785")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 204 then
--|#line 1789 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1789")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 205 then
--|#line 1795 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1795")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 206 then
--|#line 1799 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1799")
end

			yyval4 := yyvs4.item (yyvsp4)

			-- add type to type system, if possible
			if not ref_model.has_type_definition (yyval4) and ref_model.candidate_generic_type_name (yyval4) then
				ref_model.add_effective_type_from_name (yyval4)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 207 then
--|#line 1817 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1817")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 208 then
--|#line 1823 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1823")
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
when 209 then
--|#line 1829 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1829")
end

			yyvs31.item (yyvsp31).extend(yyvs4.item (yyvsp4))
			yyval31 := yyvs31.item (yyvsp31)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 210 then
--|#line 1837 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1837")
end

			yyval31 := yyvs31.item (yyvsp31)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 211 then
--|#line 1841 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1841")
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
when 212 then
--|#line 1848 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1848")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 213 then
--|#line 1852 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1852")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 214 then
--|#line 1856 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1856")
end

			yyval2 := - yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 215 then
--|#line 1862 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1862")
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
when 216 then
--|#line 1868 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1868")
end

			yyvs32.item (yyvsp32).extend(yyvs2.item (yyvsp2))
			yyval32 := yyvs32.item (yyvsp32)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 217 then
--|#line 1873 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1873")
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
when 218 then
--|#line 1880 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1880")
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
when 219 then
--|#line 1888 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1888")
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
when 220 then
--|#line 1896 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1896")
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
when 221 then
--|#line 1904 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1904")
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
when 222 then
--|#line 1912 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1912")
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
when 223 then
--|#line 1916 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1916")
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
when 224 then
--|#line 1920 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1920")
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
when 225 then
--|#line 1924 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1924")
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
when 226 then
--|#line 1928 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1928")
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
when 227 then
--|#line 1934 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1934")
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
when 228 then
--|#line 1940 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1940")
end

			yyvs45.item (yyvsp45).extend(yyvs39.item (yyvsp39))
			yyval45 := yyvs45.item (yyvsp45)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp39 := yyvsp39 -1
	yyspecial_routines45.force (yyvs45, yyval45, yyvsp45)
end
when 229 then
--|#line 1945 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1945")
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
when 230 then
--|#line 1952 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1952")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 231 then
--|#line 1956 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1956")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 232 then
--|#line 1960 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1960")
end

			yyval3 := - yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 233 then
--|#line 1966 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1966")
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
when 234 then
--|#line 1972 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1972")
end

			yyvs33.item (yyvsp33).extend(yyvs3.item (yyvsp3))
			yyval33 := yyvs33.item (yyvsp33)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 235 then
--|#line 1977 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1977")
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
when 236 then
--|#line 1984 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1984")
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
when 237 then
--|#line 1992 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1992")
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
when 238 then
--|#line 2000 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2000")
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
when 239 then
--|#line 2008 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2008")
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
when 240 then
--|#line 2016 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2016")
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
when 241 then
--|#line 2020 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2020")
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
when 242 then
--|#line 2024 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2024")
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
when 243 then
--|#line 2028 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2028")
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
when 244 then
--|#line 2032 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2032")
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
when 245 then
--|#line 2038 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2038")
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
when 246 then
--|#line 2044 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2044")
end

			yyvs46.item (yyvsp46).extend(yyvs40.item (yyvsp40))
			yyval46 := yyvs46.item (yyvsp46)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp40 := yyvsp40 -1
	yyspecial_routines46.force (yyvs46, yyval46, yyvsp46)
end
when 247 then
--|#line 2049 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2049")
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
when 248 then
--|#line 2056 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2056")
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
when 249 then
--|#line 2060 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2060")
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
when 250 then
--|#line 2066 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2066")
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
when 251 then
--|#line 2072 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2072")
end

			yyvs34.item (yyvsp34).extend(yyvs25.item (yyvsp25))
			yyval34 := yyvs34.item (yyvsp34)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp25 := yyvsp25 -1
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 252 then
--|#line 2077 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2077")
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
when 253 then
--|#line 2084 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2084")
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
when 254 then
--|#line 2094 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2094")
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
when 255 then
--|#line 2100 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2100")
end

			yyvs35.item (yyvsp35).extend (yyvs26.item (yyvsp26))
			yyval35 := yyvs35.item (yyvsp35)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp26 := yyvsp26 -1
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 256 then
--|#line 2105 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2105")
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
when 257 then
--|#line 2112 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2112")
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
when 258 then
--|#line 2120 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2120")
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
when 259 then
--|#line 2128 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2128")
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
when 260 then
--|#line 2136 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2136")
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
when 261 then
--|#line 2144 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2144")
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
when 262 then
--|#line 2148 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2148")
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
when 263 then
--|#line 2152 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2152")
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
when 264 then
--|#line 2156 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2156")
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
when 265 then
--|#line 2160 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2160")
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
when 266 then
--|#line 2166 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2166")
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
when 267 then
--|#line 2172 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2172")
end

			yyvs48.item (yyvsp48).extend(yyvs42.item (yyvsp42))
			yyval48 := yyvs48.item (yyvsp48)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp42 := yyvsp42 -1
	yyspecial_routines48.force (yyvs48, yyval48, yyvsp48)
end
when 268 then
--|#line 2177 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2177")
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
when 269 then
--|#line 2184 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2184")
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
when 270 then
--|#line 2194 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2194")
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
when 271 then
--|#line 2200 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2200")
end

			yyvs36.item (yyvsp36).extend(yyvs28.item (yyvsp28))
			yyval36 := yyvs36.item (yyvsp36)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp28 := yyvsp28 -1
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
when 272 then
--|#line 2205 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2205")
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
when 273 then
--|#line 2212 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2212")
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
when 274 then
--|#line 2220 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2220")
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
when 275 then
--|#line 2228 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2228")
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
when 276 then
--|#line 2236 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2236")
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
when 277 then
--|#line 2244 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2244")
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
when 278 then
--|#line 2248 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2248")
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
when 279 then
--|#line 2252 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2252")
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
when 280 then
--|#line 2256 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2256")
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
when 281 then
--|#line 2260 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2260")
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
when 282 then
--|#line 2266 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2266")
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
when 283 then
--|#line 2272 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2272")
end

			yyvs47.item (yyvsp47).extend(yyvs41.item (yyvsp41))
			yyval47 := yyvs47.item (yyvsp47)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp41 := yyvsp41 -1
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
when 284 then
--|#line 2277 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2277")
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
when 285 then
--|#line 2284 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2284")
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
when 286 then
--|#line 2294 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2294")
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
when 287 then
--|#line 2300 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2300")
end

			yyvs37.item (yyvsp37).extend(yyvs27.item (yyvsp27))
			yyval37 := yyvs37.item (yyvsp37)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp27 := yyvsp27 -1
	yyspecial_routines37.force (yyvs37, yyval37, yyvsp37)
end
when 288 then
--|#line 2305 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2305")
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
when 289 then
--|#line 2312 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2312")
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
when 290 then
--|#line 2320 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2320")
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
when 291 then
--|#line 2328 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2328")
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
when 292 then
--|#line 2336 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2336")
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
when 293 then
--|#line 2344 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2344")
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
when 294 then
--|#line 2348 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2348")
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
when 295 then
--|#line 2352 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2352")
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
when 296 then
--|#line 2356 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2356")
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
when 297 then
--|#line 2360 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2360")
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
when 298 then
--|#line 2366 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2366")
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
when 299 then
--|#line 2372 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2372")
end

			yyvs49.item (yyvsp49).extend(yyvs43.item (yyvsp43))
			yyval49 := yyvs49.item (yyvsp49)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp43 := yyvsp43 -1
	yyspecial_routines49.force (yyvs49, yyval49, yyvsp49)
end
when 300 then
--|#line 2377 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2377")
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
when 301 then
--|#line 2384 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2384")
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
when 302 then
--|#line 2394 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2394")
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
when 303 then
--|#line 2400 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2400")
end

			yyvs38.item (yyvsp38).extend(yyvs29.item (yyvsp29))
			yyval38 := yyvs38.item (yyvsp38)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp29 := yyvsp29 -1
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 304 then
--|#line 2405 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2405")
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
when 305 then
--|#line 2412 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2412")
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
when 306 then
--|#line 2420 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2420")
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
when 307 then
--|#line 2428 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2428")
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
when 308 then
--|#line 2436 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2436")
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
when 309 then
--|#line 2444 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2444")
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
when 310 then
--|#line 2448 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2448")
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
when 311 then
--|#line 2452 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2452")
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
when 312 then
--|#line 2456 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2456")
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
when 313 then
--|#line 2460 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2460")
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
when 314 then
--|#line 2466 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2466")
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
when 315 then
--|#line 2472 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2472")
end

			yyvs50.item (yyvsp50).extend(yyvs44.item (yyvsp44))
			yyval50 := yyvs50.item (yyvsp50)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp44 := yyvsp44 -1
	yyspecial_routines50.force (yyvs50, yyval50, yyvsp50)
end
when 316 then
--|#line 2477 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2477")
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
			when 564 then
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
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 335)
			yytranslate_template_1 (an_array)
			yytranslate_template_2 (an_array)
			Result := yyfixed_array (an_array)
		end

	yytranslate_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yytranslate'.
		do
			yyarray_subcopy (an_array, <<
			    0,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			   91,   92,   81,   79,   89,   80,    2,   82,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,   90,   93,
			    2,   73,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,   87,    2,   88,   86,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2, yyDummy>>,
			1, 200, 0)
		end

	yytranslate_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yytranslate'.
		do
			yyarray_subcopy (an_array, <<
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
			   65,   66,   67,   68,   69,   70,   71,   72,   74,   75,
			   76,   77,   78,   83,   84,   85, yyDummy>>,
			1, 136, 200)
		end

	yyr1_template: SPECIAL [INTEGER]
			-- Template for `yyr1'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 316)
			yyr1_template_1 (an_array)
			yyr1_template_2 (an_array)
			Result := yyfixed_array (an_array)
		end

	yyr1_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yyr1'.
		do
			yyarray_subcopy (an_array, <<
			    0,  173,  173,  173,  108,  108,  110,  109,  109,  109,
			  101,  101,  174,  174,  174,  117,  117,  117,  117,  117,
			  118,  118,  118,  118,   98,   98,   99,   99,   99,  115,
			  115,  114,  113,  113,  113,  113,  112,  112,  111,  111,
			  111,  111,  111,  111,  111,  111,  111,  175,  176,  176,
			  177,  177,  178,  178,  178,  116,  116,  180,  180,  180,
			  179,  181,  181,  182,  182,  183,  184,  184,   95,   95,
			   96,   96,   94,   94,   97,   97,   97,   97,  119,  119,
			  120,  120,  121,  121,  121,  121,  127,  128,  128,  123,
			  123,  123,  123,  124,  163,  163,  163,  163,  130,  130,

			  125,  131,  131,  122,  122,  126,  129,  129,  129,  162,
			  162,  162,  162,  162,  162,  161,  161,  161,  161,  161,
			  106,  106,  103,  103,  107,  107,  104,  104,  104,  104,
			  104,  104,  104,  104,  105,  105,  105,  102,  102,  102,
			  102,  171,  171,  171,  171,  171,  171,  170,  170,  170,
			  170,  170,  170,  168,  168,  168,  168,  168,  168,  168,
			  169,  169,  169,  169,  169,  169,  169,  166,  166,  166,
			  166,  166,  166,  166,  167,  167,  167,  167,  167,  167,
			  167,  167,  167,  167,  165,  165,  165,  165,  165,  172,
			  172,  172,  172,  172,  172,  172,  172,  172,  164,  164, yyDummy>>,
			1, 200, 0)
		end

	yyr1_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yyr1'.
		do
			yyarray_subcopy (an_array, <<
			  164,  164,  164,  139,  139,  100,  100,  140,  141,  141,
			  141,  141,  132,  132,  132,  142,  142,  142,  149,  149,
			  149,  149,  149,  149,  149,  149,  149,  155,  155,  155,
			  133,  133,  133,  143,  143,  143,  150,  150,  150,  150,
			  150,  150,  150,  150,  150,  156,  156,  156,  134,  134,
			  144,  144,  144,  135,  145,  145,  145,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  158,  158,  158,  137,
			  146,  146,  146,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  157,  157,  157,  136,  147,  147,  147,  153,
			  153,  153,  153,  153,  153,  153,  153,  153,  159,  159,

			  159,  138,  148,  148,  148,  154,  154,  154,  154,  154,
			  154,  154,  154,  154,  160,  160,  160, yyDummy>>,
			1, 117, 200)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 566)
			yytypes1_template_1 (an_array)
			yytypes1_template_2 (an_array)
			yytypes1_template_3 (an_array)
			Result := yyfixed_array (an_array)
		end

	yytypes1_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yytypes1'.
		do
			yyarray_subcopy (an_array, <<
			    1,    1,    1,    1,    1,    1,    1,    1,    4,    4,
			    4,    4,    4,    3,    2,    1,    7,    8,    4,   16,
			   16,   16,   21,   21,   21,   21,   22,   23,   23,   23,
			   23,   23,   24,   24,   21,    2,    3,    4,   21,   21,
			    3,    2,    3,    2,    1,    4,    4,    1,    1,    1,
			    4,    8,    4,    4,    1,   14,    1,    1,    1,    1,
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
			   19,    1,    1,    1,    1,    1,    1,   21,    1,    1,
			    1,    1,    2,    3,   26,   27,   28,   29,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1, yyDummy>>,
			1, 200, 0)
		end

	yytypes1_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yytypes1'.
		do
			yyarray_subcopy (an_array, <<
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
			   29,    1,    1,    1,    1,    1,    1,    1,    1,    1, yyDummy>>,
			1, 200, 200)
		end

	yytypes1_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yytypes1'.
		do
			yyarray_subcopy (an_array, <<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    2,    4,    1,    1,
			    1,    1,    1,    1,    1,    1,    4,    4,    1,    9,
			   10,   11,   16,   17,   17,   18,   18,   18,   20,   20,
			    1,    1,    1,    2,    1,    3,    1,   26,    1,   27,
			    1,   28,    1,   29,    2,    1,    3,    1,   26,    1,
			   27,    1,   28,    1,   29,    1,    1,    2,   12,    1,
			    4,    4,    1,    4,    1,    4,    4,    4,    1,    1,
			   20,   14,    1,    1,   20,    2,    1,    3,    1,   26,
			    1,   27,    1,   28,    1,   29,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,   12,   13,
			    4,   14,    4,    4,    1,   14,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    2,    1,    1,
			   14,    4,    1,   14,    1,    1,    7,   17,    1,    1,
			    1,    1,    1,    1,    4,    1,    7,    1,    7,    1,
			    1,    1,    1,    1,   17,    7,    1,   17,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yyDummy>>,
			1, 167, 400)
		end

	yytypes2_template: SPECIAL [INTEGER]
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    2,    3,    4,    4,    4,    4,    4,
			    4,    4,    4,    4,    4,    4,    4,    4,    5,    5,
			    1,    1,    1,    1,    4,    4,    4,    6,    4,    4,
			    4,    4,    4,    4,    4,    4,    4,    4,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER]
			-- Template for `yydefact'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 566)
			yydefact_template_1 (an_array)
			yydefact_template_2 (an_array)
			yydefact_template_3 (an_array)
			Result := yyfixed_array (an_array)
		end

	yydefact_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yydefact'.
		do
			yyarray_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,   99,   98,    0,  108,
			  204,  206,  205,  230,  212,    3,    2,   72,    9,    1,
			  134,    5,   75,   79,   78,  101,   80,   81,   85,  102,
			   76,   83,  103,   82,    0,  106,  107,    0,    0,    0,
			  232,  214,  231,  213,    0,   90,   89,   92,    0,    0,
			  203,   73,    8,    7,    0,    6,    0,   95,   96,   94,
			   97,    0,  119,  115,  116,  118,  117,  113,  111,  114,
			  112,  110,  109,    0,    0,    0,   84,  104,    0,    0,
			    0,    0,  136,    0,   93,    0,  108,  105,  100,   77,
			   74,   91,  249,  248,    0,  183,  176,  153,  160,  167,

			  301,  285,  269,  253,  186,  197,  195,  194,  196,  193,
			  192,  190,  191,  189,  184,    0,  141,  147,    0,  154,
			  168,  161,  177,  185,  142,  148,  200,  155,  162,  169,
			  178,  143,  149,  163,  156,  170,  179,  144,  150,  164,
			  157,  171,  180,   46,   44,   42,   43,   40,   41,   39,
			   38,   45,    0,    0,    0,    0,   47,  120,  120,   14,
			   53,    0,   12,   13,   48,   50,   51,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			   86,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0, yyDummy>>,
			1, 200, 0)
		end

	yydefact_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yydefact'.
		do
			yyarray_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,   87,   88,  138,    0,
			    0,  212,    0,  137,   61,    0,    0,  124,  124,    0,
			    4,   49,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  226,    0,  244,
			    0,  265,    0,  297,    0,  281,    0,  313,    0,  175,
			  174,  211,  208,  217,  215,    0,    0,  235,  233,  252,
			  249,  248,  250,  256,  254,  288,  286,  272,  270,  304,
			  302,  210,  209,  216,  234,  251,  255,  271,  287,  303,

			  229,    0,  227,  247,    0,  245,  284,    0,  282,  268,
			    0,  266,  300,    0,  298,  316,  314,  228,  246,  283,
			  267,  299,  315,  202,  201,  207,  188,  187,  173,  172,
			  182,  181,  159,  158,  166,  165,  152,  151,  146,  145,
			    0,  135,    0,    0,    0,    0,   56,   55,    0,  225,
			  243,  264,  296,  280,  312,  223,  241,  262,  294,  278,
			  310,    0,  224,    0,  242,    0,  263,    0,  295,    0,
			  279,    0,  311,  222,  240,  261,  293,  277,  309,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0, yyDummy>>,
			1, 200, 200)
		end

	yydefact_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yydefact'.
		do
			yyarray_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  140,  139,   62,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  205,   19,   20,
			   21,    0,   15,   23,   16,  134,   30,   22,   57,   17,
			   59,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  218,    0,  236,    0,  257,
			    0,  289,    0,  273,    0,  305,    0,  122,    0,    0,
			   11,   10,   28,  134,   35,   34,    0,  134,   54,   19,
			   18,   31,    0,   52,   58,    0,  219,    0,  237,    0,
			  258,    0,  290,    0,  274,    0,  306,  220,  238,  259,

			  291,  275,  307,    0,    0,   63,    0,  121,  126,    0,
			  134,    0,   32,  134,   25,   37,   68,  221,  239,  260,
			  292,  276,  308,    0,    0,    0,   60,  123,    0,  125,
			    0,   27,   33,   24,    0,    0,   70,    0,    0,   65,
			   64,  129,  127,  128,   26,    0,   69,    0,    0,   66,
			    0,    0,    0,    0,    0,   71,   29,    0,  132,  133,
			  130,  131,   36,   67,    0,    0,    0, yyDummy>>,
			1, 167, 400)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			   16,  536,  548,   17,  429,  430,   18,  431,  222,  468,
			  509,   55,  227,  346,  432,   20,   21,  433,  434,  435,
			  436,  437,  160,  438,  439,   22,   23,   24,   25,   26,
			   27,   28,   29,   30,   31,   32,   33,   34,   35,   36,
			  118,  119,  120,  121,  122,   37,  327,  123,  124,  125,
			  126,  127,  128,  129,  130,  131,  132,  133,  134,  135,
			  136,  137,  138,  139,  140,  141,  142,   73,   74,   61,
			  143,  144,  145,  146,  147,  148,  149,  150,  151,  564,
			  161,  162,  163,  164,  165,  166,  441,  225,  504,  505,
			  524, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 566)
			yypact_template_1 (an_array)
			yypact_template_2 (an_array)
			yypact_template_3 (an_array)
			Result := yyfixed_array (an_array)
		end

	yypact_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			  196,  355,  547,  439,  -17,  210, -32768, -32768,  813,  760,
			 -32768, -32768,  780, -32768, -32768, -32768,  252, -32768,  427, -32768,
			  431,  751,  435, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768,  382, -32768, -32768,  779,  362,  514,
			 -32768, -32768, -32768, -32768,  355, -32768, -32768, -32768,  828,  797,
			 -32768, -32768, -32768, -32768,   12, -32768,  777, -32768, -32768, -32768,
			 -32768,  202, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768,   38,   38,    8, -32768, -32768,  340,  807,
			  807,  753, -32768,   39, -32768,   38, -32768, -32768,  573, -32768,
			  435, -32768,  542,  476,  342, -32768,  708, -32768, -32768, -32768,

			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768,  776,  750,  775,  774,  773,  772,
			  771,  770,  769,  768,  767,  766,  765,  764,  763,  762,
			  758,  757,  756,  745,  744,  743,  730,  729,  724,  723,
			  705,  704,  703,  716,  715,  714,  713,  711,  710,  707,
			  706, -32768,  749,  748,   53,  778, -32768,  734,  734, -32768,
			  731,  742, -32768,   23, -32768, -32768, -32768,  442,  211,  211,
			  211,  211,  400,  399,  396,  392,  374,  347,  351,   29,
			 -32768,  167,   85,   -7,  134,   71,  124,  160,   24,  173,
			  205,  423,  605,  587,  588,  578,  303,  299,  298,  251, yyDummy>>,
			1, 200, 0)
		end

	yypact_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			  166,    2,  738,  728,  727,  726,  725,  712,  126,  380,
			   52,   36,   20,  161,    6,   21, -32768, -32768, -32768,  747,
			  746,  700,  702, -32768, -32768,  136,  669,  695,  695,  701,
			 -32768, -32768,  699,  697,  696,  693,  692,  688,  687,  686,
			  685,  684,  683,  681,  341,  334,  289,  282,  264,  176,
			  680,  679,  678,  674,  672,  662,   81, -32768,  179, -32768,
			   -3, -32768,   48, -32768,   -5, -32768,    0, -32768,  -18, -32768,
			 -32768, -32768, -32768, -32768, -32768,  698,  682, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,

			 -32768,  233, -32768, -32768,  325, -32768, -32768,  221, -32768, -32768,
			  156, -32768, -32768,  104, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			   68, -32768,  676,  647,  635,  646, -32768, -32768,  608, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768,   78, -32768,  115, -32768,   -6, -32768,   -2, -32768,  -13,
			 -32768,  -14, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  173,
			  642,  205,  636,  605,  634,  588,  633,  587,  631,  578,
			  630,  578,  578,  578,  578,  173,  173,  173,  173,  205, yyDummy>>,
			1, 200, 200)
		end

	yypact_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			  205,  205,  205,  587,  587,  587,  587,  605,  605,  605,
			  605,  588,  588,  588,  588, -32768, -32768, -32768,  632,  664,
			  628,  650,  649,  537,  483,  145,  648, -32768,  619, -32768,
			 -32768,  741, -32768, -32768, -32768,  431,  603, -32768, -32768, -32768,
			 -32768,  675,  173,  615,  205,  595,  605,  592,  588,  579,
			  587,  575,  578,  567,  566, -32768,  564, -32768,  563, -32768,
			  560, -32768,  545, -32768,  541, -32768,  383,  528,  531,   53,
			 -32768, -32768, -32768,    7, -32768,  556,  247,  431, -32768, -32768,
			 -32768, -32768,  529, -32768, -32768,  513, -32768,  512, -32768,  500,
			 -32768,  499, -32768,  494, -32768,  479, -32768, -32768, -32768, -32768,

			 -32768, -32768, -32768,  478,  -24, -32768,  511, -32768,  436,  450,
			  431,  460,  425,  431, -32768,  421,  415, -32768, -32768, -32768,
			 -32768, -32768, -32768,  807,  -44,  383, -32768, -32768,  597, -32768,
			  428, -32768, -32768, -32768,  398,  252,  335,  385,  234, -32768,
			 -32768,  292,  272,  193, -32768,  807,  252,  252,  263, -32768,
			  807,  -22,  218,  216,  128,  252, -32768,  106, -32768, -32768,
			 -32768, -32768, -32768, -32768,  265,  109, -32768, yyDummy>>,
			1, 167, 400)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -181, -32768, -32768,  -16, -32768, -32768,  102, -32768,  407, -32768,
			 -32768, -284,  717,  651,  874, -32768, -32768,  -76, -32768, -32768,
			 -32768, -32768, -32768, -223, -32768,  127, -32768,  812,  799, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768,   51,  -78,  -74,
			   80,    4,  -64,  -27,  -56, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768,  214,  192,  157,  163,  100,
			   72, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  791, -32768,
			 -32768,  520, -32768,  653, -32768, -32768, -32768, -32768, -32768,  270,
			 -32768, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 887)
			yytable_template_1 (an_array)
			yytable_template_2 (an_array)
			yytable_template_3 (an_array)
			yytable_template_4 (an_array)
			yytable_template_5 (an_array)
			Result := yyfixed_array (an_array)
		end

	yytable_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			   51,  116,  116,  115,  152,  117,  117,  336,   45,   89,
			   13,   14,   13,   82,  100,  526,  172,  102,  100,  510,
			  173,  332,  338,  103,   14,  102,  103,  559,  558,  101,
			  175,  158,  100,    9,  292,  281,  280,  330,  177,  272,
			  159,   14,   13,  268,  539,  538,  279,  158,  157,  103,
			    7,    6,   39,  328,   54,  315,  221,  394,  393,  392,
			  391,  452,  450,   86,  157,  525,   81,  176,  100,  446,
			  387,   14,  383,  448,   44,  389,  223,  291,    5,  101,
			    4,   14,  271,  101,   14,  276,  275,    3,    2,   13,
			  232,  238,  244,  250,  233,  239,  245,  251,  174,    1,

			  220,  219,  101,  274,  235,  241,  247,  253,  278,  566,
			  155,  293,  237,  243,  249,  255,  294,    3,    2,   13,
			  156,  286,  269,  385,  285,   88,  155,  323,   38,   85,
			  298,  290,  220,  219,  218,  101,  167,  339,  277,  299,
			  337,  236,  242,  248,  254,  563,  329,  220,  219,  415,
			  427,  481,   11,  442,  102,  331,  379,  220,  219,  288,
			  220,  219,  334,  103,  276,  275,  297,  562,  281,  280,
			   14,   78,  234,  240,  246,  252,   14,  287,  380,  414,
			  413,  412,  411,   13,  382,  103,  335,  283,  284,  511,
			  444,  102,  100,  515,  276,  275,  296,   15,  386,   14, yyDummy>>,
			1, 200, 0)
		end

	yytable_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			   13,   12,   90,   11,   10,   14,   13,  313,  480,   13,
			  390,   47,  177,  289,   14,   13,  333,  372,  484,  312,
			  273,    9,    8,  172,  343,  342,  530,    9,  371,  533,
			  173,  410,  409,  408,  407,   46,   14,  388,    7,    6,
			  103,  102,  101,  100,    7,    6,  220,  219,  514,  175,
			  270,  102,  220,  219,  381,   14,   13,   50,  276,  275,
			   10,  513,  416,  282,  384,  565,    5,  561,    4,  560,
			  116,  295,  550,  316,  117,    3,    2,    9,    8,  322,
			  176,    3,    2,  443,  276,  275,  553,    1,  324,  445,
			    3,    2,  310,    1,    7,    6,  406,  405,  404,  403,

			  314,  454,  556,  449,  309,  370,  321,  456,  398,  397,
			  396,  395,  220,  219,  174,  453,  369,  232,  238,  244,
			  250,  460,    5,  368,    4,  233,  239,  245,  251,   13,
			  366,    3,    2,  464,  367,  237,  243,  249,  255,  307,
			  304,  365,  451,    1,  301,   14,   13,  235,  241,  247,
			  253,  306,  303,  116,  546,  308,  300,  117,   14,   13,
			  462,  319,  311,  116,  485,  552,  555,  117,  320,  447,
			  487,  103,  102,  101,  100,  364,  236,  242,  248,  254,
			    9,  326,  362,  100,  491,  551,  363,  458,  267,  305,
			  325,  223,  268,  361,  547,  318,  495,    7,    6,  266, yyDummy>>,
			1, 200, 200)
		end

	yytable_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  402,  401,  400,  399,  276,  275,   60,   59,   58,   57,
			  302,  234,  240,  246,  252,  265,  317,  171,  170,  169,
			  168,    3,    2,  493,  549,    5,  264,    4,   60,   59,
			   58,   57,   91,  263,    3,    2,  545,  261,   53,   52,
			  259,  257,   43,   42,  262,  116,    1,  537,  260,  117,
			  489,  258,  256,  544,   76,   72,   71,   70,   69,   68,
			   67,   66,   65,   64,   63,  281,  280,  116,   62,  554,
			  503,  117,  116,  535,  557,  534,  117, -198,   54, -198,
			 -198, -198, -198, -198,  474,  531, -198,  532,  427,  529,
			   11, -198, -198, -198, -198, -198, -198, -198, -198, -198,

			 -198,   60,   59,   58,   57, -198, -198, -198, -198, -198,
			 -198, -198, -198, -198,  527, -198,  523, -198, -198, -198,
			  522,   66,   65,   64,   63,  473,  475,  476,   62,  528,
			   51, -198, -198, -198,   77,  521, -198, -198,  472,   51,
			  520,  519,  427, -199,   11, -199, -199, -199, -199, -199,
			   41,   40, -199,  518,  517, -198, -198, -199, -199, -199,
			 -199, -199, -199, -199, -199, -199, -199,  516,  512, -198,
			  507, -199, -199, -199, -199, -199, -199, -199, -199, -199,
			  506, -199,  502, -199, -199, -199,  501,   72,   71,   70,
			   69,   68,   67,   66,   65,   64,   63, -199, -199, -199, yyDummy>>,
			1, 200, 400)
		end

	yytable_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			   62,  500, -199, -199,  499,  498,   77,  497,  496,  428,
			  100,   14,   13,  427,  426,   11,  494,  102,  114,  101,
			  492, -199, -199,  113,  112,  111,  110,  109,  108,  107,
			  106,  105,  104,  490,  103, -199,  488,  103,  102,  101,
			  100,   99,   98,   97,   96,   95,  543,  542,  541,   94,
			   93,   92,   66,   65,   64,   63,  486,  482,  478,   62,
			  477,  471,  470,  425,  424,  423,  469,  467,  422,  421,
			  466,  465,  463,  419,  461,  459,  479,  457,   14,   13,
			  427,  426,   11,  455,  417,  114,   42,    3,    2,  156,
			  113,  112,  111,  110,  109,  108,  107,  106,  105,  104,

			  420,  418,   40,  378,  103,  102,  101,  100,   99,   98,
			   97,   96,   95,  377,  483,  376,   94,   93,   92,  375,
			  374,  373,  360,  344,  359,  358,  357,  356,  355,  354,
			  425,  424,  423,  353,  352,  422,  421,  351,  350,  348,
			  349,  341,  479,  345,   14,   13,  427,  426,   11,   43,
			   41,  114,  340,  268,    3,    2,  113,  112,  111,  110,
			  109,  108,  107,  106,  105,  104,  313,  310,  307,  304,
			  103,  102,  101,  100,   99,   98,   97,   96,   95,  301,
			  226,  230,   94,   93,   92,  229,  224,  217,  216,  180,
			  178,  154,  207,  206,  205,  540,  425,  424,  423,  215, yyDummy>>,
			1, 200, 600)
		end

	yytable_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  214,  422,  421,  213,  212,   56,  211,  210,  209,  208,
			   14,   13,  204,  203,   49,   83,  231,  114,  202,  201,
			    3,    2,  113,  112,  111,  110,  109,  108,  107,  106,
			  105,  104,  200,  199,  198,   80,  103,  102,  101,  100,
			   99,   98,   97,   96,   95,  197,  196,  195,   94,   93,
			   92,  194,  193,  192,  191,  190,  189,  188,  187,  186,
			  185,  184,  183,  182,  181,  179,   79,   48,  440,   75,
			 -203,  153,   87,   84,   19,  228,  508,    0,    0,  347,
			    0,    0,    0,    0,    0,    0,    3,    2, yyDummy>>,
			1, 88, 800)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 887)
			yycheck_template_1 (an_array)
			yycheck_template_2 (an_array)
			yycheck_template_3 (an_array)
			yycheck_template_4 (an_array)
			yycheck_template_5 (an_array)
			Result := yyfixed_array (an_array)
		end

	yycheck_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   16,   79,   80,   79,   80,   79,   80,    1,   25,    1,
			    4,    3,    4,    1,   32,   39,   94,   30,   32,   12,
			   94,    1,    1,   29,    3,   30,   29,   49,   50,   31,
			   94,    8,   32,   25,   10,   42,   43,    1,   94,   10,
			    1,    3,    4,   41,   88,   89,   53,    8,   25,   29,
			   42,   43,    1,    1,   47,   53,    3,   75,   76,   77,
			   78,   75,   75,   25,   25,   89,   54,   94,   32,   75,
			   75,    3,   75,   75,   91,   75,  154,   53,   70,   31,
			   72,    3,   53,   31,    3,   79,   80,   79,   80,    4,
			  168,  169,  170,  171,  168,  169,  170,  171,   94,   91,

			   79,   80,   31,  181,  168,  169,  170,  171,  182,    0,
			   87,  189,  168,  169,  170,  171,  190,   79,   80,    4,
			   81,  185,  178,   75,   53,   74,   87,    1,    1,   91,
			  194,  187,   79,   80,   81,   31,   85,  215,   53,  195,
			  214,  168,  169,  170,  171,   39,  210,   79,   80,   81,
			    5,  435,    7,   75,   30,  211,   75,   79,   80,  186,
			   79,   80,    1,   29,   79,   80,  193,   39,   42,   43,
			    3,   44,  168,  169,  170,  171,    3,   53,  256,   75,
			   76,   77,   78,    4,  258,   29,  213,   53,  184,  473,
			   75,   30,   32,  477,   79,   80,  192,    1,  262,    3, yyDummy>>,
			1, 200, 0)
		end

	yycheck_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			    4,    5,   75,    7,    8,    3,    4,   41,  431,    4,
			  266,    1,  268,   53,    3,    4,  212,   41,  441,   53,
			   53,   25,   26,  301,   88,   89,  510,   25,   52,  513,
			  304,   75,   76,   77,   78,   25,    3,  264,   42,   43,
			   29,   30,   31,   32,   42,   43,   79,   80,    1,  313,
			  178,   30,   79,   80,   75,    3,    4,    5,   79,   80,
			    8,   14,  340,  183,  260,    0,   70,   51,   72,   51,
			  348,  191,   38,  201,  348,   79,   80,   25,   26,  207,
			  307,   79,   80,  361,   79,   80,   93,   91,  208,  363,
			   79,   80,   41,   91,   42,   43,   75,   76,   77,   78,

			  200,  379,   39,  367,   53,   41,  206,  381,   75,   76,
			   77,   78,   79,   80,  310,  371,   52,  395,  396,  397,
			  398,  385,   70,   41,   72,  399,  400,  401,  402,    4,
			   41,   79,   80,  389,   52,  391,  392,  393,  394,   41,
			   41,   52,  369,   91,   41,    3,    4,  411,  412,  413,
			  414,   53,   53,  431,  535,  198,   53,  431,    3,    4,
			  387,  204,  199,  441,  442,   93,  547,  441,  205,  365,
			  444,   29,   30,   31,   32,   41,  403,  404,  405,  406,
			   25,    1,   41,   32,  448,   93,   52,  383,   41,  197,
			   10,  469,   41,   52,   59,  203,  452,   42,   43,   52, yyDummy>>,
			1, 200, 200)
		end

	yycheck_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   75,   76,   77,   78,   79,   80,   66,   67,   68,   69,
			  196,  407,  408,  409,  410,   41,  202,   75,   76,   77,
			   78,   79,   80,  450,   39,   70,   52,   72,   66,   67,
			   68,   69,   92,   41,   79,   80,   38,   41,   11,   12,
			   41,   41,    3,    4,   52,  523,   91,  523,   52,  523,
			  446,   52,   52,   25,   92,   73,   74,   75,   76,   77,
			   78,   79,   80,   81,   82,   42,   43,  545,   86,  545,
			   87,  545,  550,   58,  550,   54,  550,    1,   47,    3,
			    4,    5,    6,    7,    1,   25,   10,   62,    5,   39,
			    7,   15,   16,   17,   18,   19,   20,   21,   22,   23,

			   24,   66,   67,   68,   69,   29,   30,   31,   32,   33,
			   34,   35,   36,   37,    3,   39,   38,   41,   42,   43,
			   41,   79,   80,   81,   82,  423,  424,  425,   86,   93,
			  546,   55,   56,   57,   92,   41,   60,   61,    1,  555,
			   41,   41,    5,    1,    7,    3,    4,    5,    6,    7,
			    3,    4,   10,   41,   41,   79,   80,   15,   16,   17,
			   18,   19,   20,   21,   22,   23,   24,   38,   12,   93,
			   39,   29,   30,   31,   32,   33,   34,   35,   36,   37,
			   52,   39,   41,   41,   42,   43,   41,   73,   74,   75,
			   76,   77,   78,   79,   80,   81,   82,   55,   56,   57, yyDummy>>,
			1, 200, 400)
		end

	yycheck_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   86,   41,   60,   61,   41,   41,   92,   41,   41,    1,
			   32,    3,    4,    5,    6,    7,   41,   30,   10,   31,
			   41,   79,   80,   15,   16,   17,   18,   19,   20,   21,
			   22,   23,   24,   41,   29,   93,   41,   29,   30,   31,
			   32,   33,   34,   35,   36,   37,   49,   50,   51,   41,
			   42,   43,   79,   80,   81,   82,   41,   54,   39,   86,
			   12,   12,   12,   55,   56,   57,   38,    3,   60,   61,
			   38,   41,   41,   38,   41,   41,    1,   41,    3,    4,
			    5,    6,    7,   41,    8,   10,    4,   79,   80,   81,
			   15,   16,   17,   18,   19,   20,   21,   22,   23,   24,

			   54,   54,    4,   41,   29,   30,   31,   32,   33,   34,
			   35,   36,   37,   41,   39,   41,   41,   42,   43,   41,
			   41,   41,   41,   54,   41,   41,   41,   41,   41,   41,
			   55,   56,   57,   41,   41,   60,   61,   41,   41,   38,
			   41,   39,    1,   48,    3,    4,    5,    6,    7,    3,
			    3,   10,   52,   41,   79,   80,   15,   16,   17,   18,
			   19,   20,   21,   22,   23,   24,   41,   41,   41,   41,
			   29,   30,   31,   32,   33,   34,   35,   36,   37,   41,
			   46,   39,   41,   42,   43,   54,    8,   39,   39,   39,
			   82,   38,   89,   89,   89,  525,   55,   56,   57,   93, yyDummy>>,
			1, 200, 600)
		end

	yycheck_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   93,   60,   61,   93,   93,   54,   93,   93,   93,   93,
			    3,    4,   89,   89,   54,   38,  163,   10,   89,   89,
			   79,   80,   15,   16,   17,   18,   19,   20,   21,   22,
			   23,   24,   89,   89,   89,   38,   29,   30,   31,   32,
			   33,   34,   35,   36,   37,   89,   89,   89,   41,   42,
			   43,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,   38,   54,  348,   90,
			   90,   80,   73,   61,    0,  158,  469,   -1,   -1,  228,
			   -1,   -1,   -1,   -1,   -1,   -1,   79,   80, yyDummy>>,
			1, 88, 800)
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

	yyvs20: SPECIAL [C_OBJECT]
			-- Stack for semantic values of type C_OBJECT

	yyvsc20: INTEGER
			-- Capacity of semantic value stack `yyvs20'

	yyvsp20: INTEGER
			-- Top of semantic value stack `yyvs20'

	yyspecial_routines20: KL_SPECIAL_ROUTINES [C_OBJECT]
			-- Routines that ought to be in SPECIAL [C_OBJECT]

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

	yyFinal: INTEGER = 566
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 94
			-- Number of tokens

	yyLast: INTEGER = 887
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 335
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 185
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

	execute (in_text:STRING; a_source_start_line: INTEGER; aca: ARCH_LIB_ARCHETYPE)
		do
			reset

			target_descriptor := aca

			-- set up refs to RM and AOM PROFILE for this archetype
			ref_model := aca.ref_model
			if target_descriptor.is_specialised then
				flat_ancestor := target_descriptor.specialisation_parent.flat_archetype
 			end
			if aom_profiles_access.has_profile_for_rm_schema (ref_model.schema_id) then
				aom_profile := aom_profiles_access.profile_for_rm_schema (ref_model.schema_id)
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

	target_descriptor: detachable ARCH_LIB_ARCHETYPE
		note
			option: stable
		attribute
		end

	flat_ancestor: detachable ARCHETYPE
			-- flat version of ancestor archetype, if target is specialised

	safe_put_c_attribute_child (an_obj: C_OBJECT)
			-- check child object for validity and then put as new child
		require
			Not_already_added: not c_attrs.item.has_child (an_obj)
		do
			if not c_attrs.is_empty then
				debug ("ADL_parse")
					io.put_string (indent + "ATTR_NODE " + c_attrs.item.rm_attribute_name + " put_child (" + 
							an_obj.generating_type.name + ": " + an_obj.rm_type_name + " [id=" + an_obj.node_id + "])%N") 
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
			ar.extend (an_obj.generating_type.name) -- $1
			ar.extend ("node_id=" + an_obj.node_id) -- $2
			ar.extend (an_attr.rm_attribute_name) -- $3

			if an_attr.has_child_with_id (an_obj.node_id) then
				err_code := ec_VCOSU
			elseif an_attr.is_single then
				if attached an_obj.occurrences as att_occ and then (att_occ.upper_unbounded or att_occ.upper > 1) then
					err_code := ec_VACSO
				else
					Result := True
				end
			elseif an_attr.is_multiple then
				if attached an_attr.cardinality as att_card and then not att_card.interval.upper_unbounded and then
						attached an_obj.occurrences as att_occ and then not att_occ.upper_unbounded and then
						att_occ.upper > att_card.interval.upper 
				then
					err_code := ec_VACMCU
					ar.extend (att_occ.upper.out)
					ar.extend (att_card.interval.upper.out)
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

	bmm_enum: BMM_ENUMERATION [COMPARABLE] 
		attribute
			create {BMM_ENUMERATION_INTEGER} Result.make ("XX", void, False)
		end

end
