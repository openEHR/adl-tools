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
			create yyspecial_routines60
			yyvsc60 := yyInitial_yyvs_size
			yyvs60 := yyspecial_routines60.make (yyvsc60)
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
			yyvsp60 := -1
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
			yyvs60.keep_head (0)
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
			when 60 then
				yyvsp60 := yyvsp60 - 1
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
			yyval21: EXPRESSION
			yyval23: EXPR_BINARY_OPERATOR
			yyval22: EXPR_UNARY_OPERATOR
			yyval4: STRING
			yyval24: EXPR_LITERAL
			yyval25: EXPR_LEAF
			yyval14: detachable MULTIPLICITY_INTERVAL
			yyval12: MULTIPLICITY_INTERVAL
			yyval15: detachable CARDINALITY
			yyval13: CARDINALITY
			yyval59: C_INTEGER
			yyval58: C_REAL
			yyval56: C_DATE
			yyval57: C_TIME
			yyval54: C_DATE_TIME
			yyval55: C_DURATION
			yyval53: C_STRING
			yyval60: C_TERMINOLOGY_CODE
			yyval52: C_BOOLEAN
			yyval32: ARRAYED_LIST [STRING]
			yyval2: INTEGER
			yyval33: ARRAYED_LIST [INTEGER]
			yyval40: INTERVAL [INTEGER]
			yyval46: ARRAYED_LIST [INTERVAL [INTEGER]]
			yyval3: REAL
			yyval34: ARRAYED_LIST [REAL]
			yyval41: INTERVAL [REAL]
			yyval47: ARRAYED_LIST [INTERVAL [REAL]]
			yyval26: BOOLEAN
			yyval35: ARRAYED_LIST [BOOLEAN]
			yyval27: ISO8601_DATE
			yyval36: ARRAYED_LIST [ISO8601_DATE]
			yyval43: INTERVAL [ISO8601_DATE]
			yyval49: ARRAYED_LIST [INTERVAL [ISO8601_DATE]]
			yyval29: ISO8601_TIME
			yyval37: ARRAYED_LIST [ISO8601_TIME]
			yyval42: INTERVAL [ISO8601_TIME]
			yyval48: ARRAYED_LIST [INTERVAL [ISO8601_TIME]]
			yyval28: ISO8601_DATE_TIME
			yyval38: ARRAYED_LIST [ISO8601_DATE_TIME]
			yyval44: INTERVAL [ISO8601_DATE_TIME]
			yyval50: ARRAYED_LIST [INTERVAL [ISO8601_DATE_TIME]]
			yyval30: ISO8601_DURATION
			yyval39: ARRAYED_LIST [ISO8601_DURATION]
			yyval45: INTERVAL [ISO8601_DURATION]
			yyval51: ARRAYED_LIST [INTERVAL [ISO8601_DURATION]]
		do
			if not yy_retried then
				inspect yy_act
when 1 then
--|#line 173 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 173")
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
--|#line 181 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 181")
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
--|#line 189 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 189")
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
--|#line 198 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 198")
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
--|#line 207 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 207")
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
--|#line 220 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 220")
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
				abort_with_error ({ADL_MESSAGES_IDS}.ec_VCORM, <<yyvs16.item (yyvsp16).rm_type_name, yyvs16.item (yyvsp16).path>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp14 := yyvsp14 -1
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 7 then
--|#line 246 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 246")
end

			if object_nodes.is_empty then
				create yyval16.make (yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4))
			else
				abort_with_error ({ADL_MESSAGES_IDS}.ec_VARND, <<yyvs4.item (yyvsp4), Id_code_regex_pattern>>)
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
--|#line 254 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 254")
end

			if not object_nodes.is_empty then
				create yyval16.make (yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4))
			else
				abort_with_error ({ADL_MESSAGES_IDS}.ec_VARCN, <<yyvs4.item (yyvsp4), Root_id_code_regex_pattern>>)
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
--|#line 265 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 265")
end

			if valid_standard_version (target_descriptor.file_mgr.adl_version) and then 
				version_less_than (target_descriptor.file_mgr.adl_version, Adl_id_code_version) and not object_nodes.is_empty 
			then
				create yyval16.make (yyvs4.item (yyvsp4), new_fake_node_id)
			else
				if not object_nodes.is_empty then
					abort_with_error ({ADL_MESSAGES_IDS}.ec_VCOID, <<yyvs4.item (yyvsp4), c_attrs.item.path>>)
				else
					abort_with_error ({ADL_MESSAGES_IDS}.ec_VCOID, <<yyvs4.item (yyvsp4), "/">>)
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
--|#line 284 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 284")
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
--|#line 288 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 288")
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
--|#line 294 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 294")
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
--|#line 301 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 301")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 14 then
--|#line 304 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 304")
end

			abort_with_error ({ADL_MESSAGES_IDS}.ec_SCOAT, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 15 then
--|#line 313 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 313")
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
--|#line 318 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 318")
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
--|#line 323 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 323")
end

			yyval20 := yyvs20.item (yyvsp20)
			safe_put_c_attribute_child (yyval20)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 18 then
--|#line 328 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 328")
end

			yyval20 := yyvs20.item (yyvsp20)
			yyvs20.item (yyvsp20).set_sibling_order (yyvs11.item (yyvsp11))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp11 := yyvsp11 -1
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 19 then
--|#line 333 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 333")
end

			abort_with_error ({ADL_MESSAGES_IDS}.ec_SCCOG, Void)
		
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
--|#line 342 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 342")
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
--|#line 346 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 346")
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
--|#line 350 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 350")
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
--|#line 354 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 354")
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
--|#line 368 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 368")
end

			id_code := yyvs4.item (yyvsp4).substring (1, yyvs4.item (yyvsp4).index_of (',', 1) - 1)
			archetype_ref := yyvs4.item (yyvsp4).substring (yyvs4.item (yyvsp4).index_of (',', 1) + 1, yyvs4.item (yyvsp4).count)
			if archetype_id_checker.valid_adl2_archetype_open_ref (archetype_ref) then
				create yyval9.make (yyvs4.item (yyvsp4 - 1), id_code, archetype_ref)
				if attached yyvs14.item (yyvsp14) as occ then
					yyval9.set_occurrences (occ)
				end
			else
				abort_with_error ({ADL_MESSAGES_IDS}.ec_SUAIDI, <<yyvs4.item (yyvsp4)>>)
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
--|#line 381 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 381")
end

			abort_with_error ({ADL_MESSAGES_IDS}.ec_SUAID, Void)
		
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
--|#line 387 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 387")
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
--|#line 410 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 410")
end

			if version_less_than (target_descriptor.file_mgr.adl_version, Adl_id_code_version) and not object_nodes.is_empty then
				create yyval10.make (yyvs4.item (yyvsp4 - 1), new_fake_node_id, yyvs4.item (yyvsp4))
				if attached yyvs14.item (yyvsp14) as att_occ then
					yyval10.set_occurrences (att_occ)
				end
			else
				abort_with_error ({ADL_MESSAGES_IDS}.ec_VCOID, <<yyvs4.item (yyvsp4 - 1), c_attrs.item.path>>)
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
--|#line 428 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 428")
end

			abort_with_error ({ADL_MESSAGES_IDS}.ec_SUNPA, Void)
		
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
--|#line 434 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 434")
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
--|#line 448 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 448")
end

			yyval18 := yyvs18.item (yyvsp18)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
when 31 then
--|#line 454 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 454")
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
--|#line 472 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 472")
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
--|#line 476 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 476")
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
--|#line 484 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 484")
end

			if version_less_than (target_descriptor.file_mgr.adl_version, Adl_id_code_version) and not object_nodes.is_empty then
				create yyval18.make (yyvs4.item (yyvsp4), new_fake_node_id)
			else
				abort_with_error ({ADL_MESSAGES_IDS}.ec_VCOID, <<yyvs4.item (yyvsp4), c_attrs.item.path>>)
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
--|#line 495 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 495")
end

			abort_with_error ({ADL_MESSAGES_IDS}.ec_SUAS, Void)
		
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
--|#line 505 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 505")
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
--|#line 529 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 529")
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
				abort_with_error ({ADL_MESSAGES_IDS}.ec_VCORM, <<yyvs4.item (yyvsp4 - 1), c_attrs.item.path>>)
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
--|#line 582 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 582")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_INTEGER: " +  yyvs59.item (yyvsp59).as_string + "%N")
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
when 39 then
--|#line 589 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 589")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_REAL: " +  yyvs58.item (yyvsp58).as_string + "%N")
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
when 40 then
--|#line 596 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 596")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_DATE: " +  yyvs56.item (yyvsp56).as_string + "%N")
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
when 41 then
--|#line 603 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 603")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_TIME: " +  yyvs57.item (yyvsp57).as_string + "%N")
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
when 42 then
--|#line 610 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 610")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_DATE_TIME: " +  yyvs54.item (yyvsp54).as_string + "%N")
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
when 43 then
--|#line 617 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 617")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_DURATION: " +  yyvs55.item (yyvsp55).as_string + "%N")
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
when 44 then
--|#line 624 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 624")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_STRING: " +  yyvs53.item (yyvsp53).as_string + "%N")
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
when 45 then
--|#line 631 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 631")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_TERMINOLOGY_CODE: " +  yyvs60.item (yyvsp60).as_string + "%N")
			end
			yyval17 := yyvs60.item (yyvsp60)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp17 := yyvsp17 + 1
	yyvsp60 := yyvsp60 -1
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
--|#line 638 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 638")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_BOOLEAN: " +  yyvs52.item (yyvsp52).as_string + "%N")
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
when 47 then
--|#line 647 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 647")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 48 then
--|#line 654 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 654")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 49 then
--|#line 657 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 657")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 50 then
--|#line 662 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 662")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 51 then
--|#line 665 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 665")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 52 then
--|#line 670 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 670")
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
--|#line 679 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 679")
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
--|#line 684 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 684")
end

			yyval1 := yyvs19.item (yyvsp19)
			abort_with_error ({ADL_MESSAGES_IDS}.ec_SCAS, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp19 := yyvsp19 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 55 then
--|#line 691 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 691")
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
						abort_with_error ({ADL_MESSAGES_IDS}.ec_VSAM2, <<rm_attribute_name>>)
					end
				else
					abort_with_error ({ADL_MESSAGES_IDS}.ec_VCARM, <<rm_attribute_name, object_nodes.item.path, object_nodes.item.rm_type_name>>)
				end
			else
				abort_with_error ({ADL_MESSAGES_IDS}.ec_VCATU, <<rm_attribute_name>>)
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
--|#line 731 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 731")
end

			create og_path.make_from_string (yyvs4.item (yyvsp4))
			rm_attribute_name := og_path.last.attr_name
			parent_path_str := og_path.parent_path.as_string

			if not object_nodes.item.has_attribute (yyvs4.item (yyvsp4)) then
				-- check RM to see if path is valid, and if it is a container
				if ref_model.has_property_path (object_nodes.item.rm_type_name, yyvs4.item (yyvsp4)) then
					rm_prop_def := ref_model.property_at_path (object_nodes.item.rm_type_name, yyvs4.item (yyvsp4))
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
						abort_with_error ({ADL_MESSAGES_IDS}.ec_VSAM2, <<yyvs4.item (yyvsp4)>>)
					end
				else
					abort_with_error ({ADL_MESSAGES_IDS}.ec_VDIFP2, <<yyvs4.item (yyvsp4)>>)
				end
			else
				abort_with_error ({ADL_MESSAGES_IDS}.ec_VCATU, <<yyvs4.item (yyvsp4)>>)
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
--|#line 779 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 779")
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
--|#line 782 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 782")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp20 := yyvsp20 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 59 then
--|#line 785 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 785")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 60 then
--|#line 790 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 790")
end

			-- add the tuple's C_ATTRIBUTEs to the current object node's children
			across ca_tuple.members as c_attrs_csr loop
				if not object_nodes.item.has_attribute (c_attrs_csr.item.rm_attribute_name) then
					object_nodes.item.put_attribute (c_attrs_csr.item)
				else
					abort_with_error ({ADL_MESSAGES_IDS}.ec_VCATU, <<c_attrs_csr.item.rm_attribute_name>>)
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
--|#line 811 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 811")
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
--|#line 821 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 821")
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
--|#line 830 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 830")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 64 then
--|#line 833 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 833")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 65 then
--|#line 838 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 838")
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
--|#line 846 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 846")
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
--|#line 859 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 859")
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
--|#line 870 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 870")
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
--|#line 871 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 871")
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
--|#line 880 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 880")
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
--|#line 881 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 881")
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
--|#line 894 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 894")
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
--|#line 899 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 899")
end

			yyvs7.item (yyvsp7).extend (yyvs8.item (yyvsp8))
			yyval7 := yyvs7.item (yyvsp7)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp8 := yyvsp8 -1
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 74 then
--|#line 906 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 906")
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
--|#line 910 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 910")
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
--|#line 918 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 918")
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
--|#line 922 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 922")
end

			abort_with_error ({ADL_MESSAGES_IDS}.ec_SINVS, <<yyvs4.item (yyvsp4)>>)
		
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
--|#line 930 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 930")
end

			yyval21 := yyvs21.item (yyvsp21)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 79 then
--|#line 934 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 934")
end

			yyval21 := yyvs21.item (yyvsp21)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 80 then
--|#line 940 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 940")
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
--|#line 947 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 947")
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
--|#line 953 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 953")
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
--|#line 957 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 957")
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
--|#line 964 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 964")
end

			yyval21 := yyvs21.item (yyvsp21)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 85 then
--|#line 968 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 968")
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
--|#line 978 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 978")
end

			debug ("ADL_rule")
				io.put_string (indent + "arch_outer_constraint_expr: Archetype ID constraint " + yyvs4.item (yyvsp4) + " matches {" + yyvs53.item (yyvsp53).as_string + "}%N") 
			end
			create yyval23.make (create {OPERATOR_KIND}.make (op_matches),
				create {EXPR_ARCHETYPE_REF}.make (yyvs4.item (yyvsp4)),
				create {EXPR_ARCHETYPE_ID_CONSTRAINT}.make (yyvs53.item (yyvsp53)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp23 := yyvsp23 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -3
	yyvsp53 := yyvsp53 -1
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
--|#line 989 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 989")
end

			debug ("ADL_rule")
				io.put_string (indent + "boolean_constraint:" + yyvs4.item (yyvsp4) + " matches {" + yyvs17.item (yyvsp17).as_string + "}%N") 
			end
			create yyval23.make (create {OPERATOR_KIND}.make (op_matches), 
				create {EXPR_ARCHETYPE_REF}.make_definition (yyvs4.item (yyvsp4)),
				create {EXPR_CONSTRAINT}.make (yyvs17.item (yyvsp17)))
		
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
--|#line 998 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 998")
end

			debug ("ADL_rule")
				io.put_string (indent + "boolean_constraint:" + yyvs4.item (yyvsp4) + " matches {" + yyvs60.item (yyvsp60).as_string + "}%N") 
			end
			create yyval23.make (create {OPERATOR_KIND}.make (op_matches), 
				create {EXPR_ARCHETYPE_REF}.make_definition (yyvs4.item (yyvsp4)),
				create {EXPR_CONSTRAINT}.make_coded_term (yyvs60.item (yyvsp60)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp23 := yyvsp23 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -3
	yyvsp60 := yyvsp60 -1
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
--|#line 1013 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1013")
end

			debug ("ADL_rule")
				io.put_string (indent + "boolean_unop_expr: exists " + yyvs4.item (yyvsp4) + "%N") 
			end
			create yyval22.make (create {OPERATOR_KIND}.make (op_exists), create {EXPR_ARCHETYPE_REF}.make_definition (yyvs4.item (yyvsp4)))
		
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
--|#line 1020 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1020")
end

			debug ("ADL_rule")
				io.put_string (indent + "boolean_unop_expr: not " + yyvs4.item (yyvsp4) + "%N") 
			end
			create yyval22.make (create {OPERATOR_KIND}.make (op_not), create {EXPR_ARCHETYPE_REF}.make_definition (yyvs4.item (yyvsp4)))
		
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
--|#line 1027 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1027")
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
--|#line 1034 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1034")
end

			abort_with_error ({ADL_MESSAGES_IDS}.ec_SEXPT, Void)
		
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
--|#line 1044 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1044")
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
--|#line 1053 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1053")
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
--|#line 1057 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1057")
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
--|#line 1061 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1061")
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
--|#line 1065 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1065")
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
--|#line 1075 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1075")
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
--|#line 1079 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1079")
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
--|#line 1089 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1089")
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
--|#line 1102 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1102")
end

			yyval21 := yyvs21.item (yyvsp21)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 102 then
--|#line 1106 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1106")
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
--|#line 1112 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1112")
end

			yyval21 := yyvs25.item (yyvsp25)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp21 := yyvsp21 + 1
	yyvsp25 := yyvsp25 -1
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
--|#line 1116 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1116")
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
--|#line 1129 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1129")
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
--|#line 1142 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1142")
end

			debug ("ADL_rule")
				io.put_string (indent + "arith_leaf - integer: " + yyvs2.item (yyvsp2).out + "%N") 
			end
			create {EXPR_LITERAL} yyval25.make_integer (yyvs2.item (yyvsp2))
		
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
when 107 then
--|#line 1149 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1149")
end

			debug ("ADL_rule")
				io.put_string (indent + "arith_leaf - real: " + yyvs3.item (yyvsp3).out + "%N") 
			end
			create {EXPR_LITERAL} yyval25.make_real (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp25 := yyvsp25 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp25 >= yyvsc25 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs25")
		end
		yyvsc25 := yyvsc25 + yyInitial_yyvs_size
		yyvs25 := yyspecial_routines25.aliased_resized_area (yyvs25, yyvsc25)
	end
	yyspecial_routines25.force (yyvs25, yyval25, yyvsp25)
end
when 108 then
--|#line 1156 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1156")
end

			debug ("ADL_rule")
				io.put_string (indent + "arith_leaf - path: " + yyvs4.item (yyvsp4) + "%N") 
			end
			create {EXPR_ARCHETYPE_REF} yyval25.make_definition (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp25 := yyvsp25 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp25 >= yyvsc25 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs25")
		end
		yyvsc25 := yyvsc25 + yyInitial_yyvs_size
		yyvs25 := yyspecial_routines25.aliased_resized_area (yyvs25, yyvsc25)
	end
	yyspecial_routines25.force (yyvs25, yyval25, yyvsp25)
end
when 109 then
--|#line 1165 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1165")
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
--|#line 1169 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1169")
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
--|#line 1173 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1173")
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
--|#line 1177 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1177")
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
--|#line 1181 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1181")
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
--|#line 1185 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1185")
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
--|#line 1191 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1191")
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
--|#line 1195 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1195")
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
--|#line 1199 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1199")
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
--|#line 1203 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1203")
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
--|#line 1207 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1207")
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
--|#line 1216 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1216")
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
--|#line 1217 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1217")
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
--|#line 1223 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1223")
end

			if yyvs2.item (yyvsp2) = 0 then
				create yyval12.make_prohibited
			elseif yyvs2.item (yyvsp2) = 1 then
				create yyval12.make_mandatory
			else
				abort_with_error ({ADL_MESSAGES_IDS}.ec_SEXLSG, Void)
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
--|#line 1233 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1233")
end

			if yyvs2.item (yyvsp2 - 1) = 0 then
				if yyvs2.item (yyvsp2) = 0 then
					create yyval12.make_point (0)
				elseif yyvs2.item (yyvsp2) = 1 then
					create yyval12.make_bounded (0, 1)
				else
					abort_with_error ({ADL_MESSAGES_IDS}.ec_SEXLU1, Void)
				end
			elseif yyvs2.item (yyvsp2 - 1) = 1 then
				if yyvs2.item (yyvsp2) = 1 then
					create yyval12.make_point (1)
				else
					abort_with_error ({ADL_MESSAGES_IDS}.ec_SEXLU2, Void)
				end
			else
				abort_with_error ({ADL_MESSAGES_IDS}.ec_SEXLMG, Void)
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
--|#line 1255 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1255")
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
--|#line 1256 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1256")
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
--|#line 1262 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1262")
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
--|#line 1266 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1266")
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
--|#line 1270 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1270")
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
--|#line 1275 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1275")
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
--|#line 1280 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1280")
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
--|#line 1285 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1285")
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
--|#line 1291 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1291")
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
--|#line 1296 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1296")
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
--|#line 1304 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1304")
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
--|#line 1305 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1305")
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
--|#line 1309 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1309")
end

			abort_with_error ({ADL_MESSAGES_IDS}.ec_SOCCF, Void)
		
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
--|#line 1315 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1315")
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
--|#line 1319 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1319")
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
--|#line 1323 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1323")
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
--|#line 1327 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1327")
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
--|#line 1335 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1335")
end

			create yyval59.make_value (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp59 := yyvsp59 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp59 >= yyvsc59 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs59")
		end
		yyvsc59 := yyvsc59 + yyInitial_yyvs_size
		yyvs59 := yyspecial_routines59.aliased_resized_area (yyvs59, yyvsc59)
	end
	yyspecial_routines59.force (yyvs59, yyval59, yyvsp59)
end
when 142 then
--|#line 1339 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1339")
end

			create yyval59.make_value_list (yyvs33.item (yyvsp33))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp59 := yyvsp59 + 1
	yyvsp33 := yyvsp33 -1
	if yyvsp59 >= yyvsc59 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs59")
		end
		yyvsc59 := yyvsc59 + yyInitial_yyvs_size
		yyvs59 := yyspecial_routines59.aliased_resized_area (yyvs59, yyvsc59)
	end
	yyspecial_routines59.force (yyvs59, yyval59, yyvsp59)
end
when 143 then
--|#line 1343 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1343")
end

			create yyval59.make_interval (yyvs40.item (yyvsp40))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp59 := yyvsp59 + 1
	yyvsp40 := yyvsp40 -1
	if yyvsp59 >= yyvsc59 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs59")
		end
		yyvsc59 := yyvsc59 + yyInitial_yyvs_size
		yyvs59 := yyspecial_routines59.aliased_resized_area (yyvs59, yyvsc59)
	end
	yyspecial_routines59.force (yyvs59, yyval59, yyvsp59)
end
when 144 then
--|#line 1347 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1347")
end

			create yyval59.make (yyvs46.item (yyvsp46))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp59 := yyvsp59 + 1
	yyvsp46 := yyvsp46 -1
	if yyvsp59 >= yyvsc59 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs59")
		end
		yyvsc59 := yyvsc59 + yyInitial_yyvs_size
		yyvs59 := yyspecial_routines59.aliased_resized_area (yyvs59, yyvsc59)
	end
	yyspecial_routines59.force (yyvs59, yyval59, yyvsp59)
end
when 145 then
--|#line 1351 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1351")
end

			if yyvs59.item (yyvsp59).valid_value (yyvs2.item (yyvsp2)) then
				yyvs59.item (yyvsp59).set_assumed_value (yyvs2.item (yyvsp2))
				yyval59 := yyvs59.item (yyvsp59)
			else
				abort_with_error ({ODIN_MESSAGES_IDS}.ec_VOBAV, <<yyvs2.item (yyvsp2).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines59.force (yyvs59, yyval59, yyvsp59)
end
when 146 then
--|#line 1360 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1360")
end

			abort_with_error ({ADL_MESSAGES_IDS}.ec_SCIAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines59.force (yyvs59, yyval59, yyvsp59)
end
when 147 then
--|#line 1366 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1366")
end

			create yyval58.make_value (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp58 := yyvsp58 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp58 >= yyvsc58 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs58")
		end
		yyvsc58 := yyvsc58 + yyInitial_yyvs_size
		yyvs58 := yyspecial_routines58.aliased_resized_area (yyvs58, yyvsc58)
	end
	yyspecial_routines58.force (yyvs58, yyval58, yyvsp58)
end
when 148 then
--|#line 1370 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1370")
end

			create yyval58.make_value_list (yyvs34.item (yyvsp34))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp58 := yyvsp58 + 1
	yyvsp34 := yyvsp34 -1
	if yyvsp58 >= yyvsc58 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs58")
		end
		yyvsc58 := yyvsc58 + yyInitial_yyvs_size
		yyvs58 := yyspecial_routines58.aliased_resized_area (yyvs58, yyvsc58)
	end
	yyspecial_routines58.force (yyvs58, yyval58, yyvsp58)
end
when 149 then
--|#line 1374 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1374")
end

			create yyval58.make_interval (yyvs41.item (yyvsp41))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp58 := yyvsp58 + 1
	yyvsp41 := yyvsp41 -1
	if yyvsp58 >= yyvsc58 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs58")
		end
		yyvsc58 := yyvsc58 + yyInitial_yyvs_size
		yyvs58 := yyspecial_routines58.aliased_resized_area (yyvs58, yyvsc58)
	end
	yyspecial_routines58.force (yyvs58, yyval58, yyvsp58)
end
when 150 then
--|#line 1378 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1378")
end

			create yyval58.make (yyvs47.item (yyvsp47))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp58 := yyvsp58 + 1
	yyvsp47 := yyvsp47 -1
	if yyvsp58 >= yyvsc58 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs58")
		end
		yyvsc58 := yyvsc58 + yyInitial_yyvs_size
		yyvs58 := yyspecial_routines58.aliased_resized_area (yyvs58, yyvsc58)
	end
	yyspecial_routines58.force (yyvs58, yyval58, yyvsp58)
end
when 151 then
--|#line 1382 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1382")
end

			if yyvs58.item (yyvsp58).valid_value (yyvs3.item (yyvsp3)) then
				yyvs58.item (yyvsp58).set_assumed_value (yyvs3.item (yyvsp3))
				yyval58 := yyvs58.item (yyvsp58)
			else
				abort_with_error ({ODIN_MESSAGES_IDS}.ec_VOBAV, <<yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyspecial_routines58.force (yyvs58, yyval58, yyvsp58)
end
when 152 then
--|#line 1391 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1391")
end

			abort_with_error ({ADL_MESSAGES_IDS}.ec_SCRAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines58.force (yyvs58, yyval58, yyvsp58)
end
when 153 then
--|#line 1397 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1397")
end

			if valid_iso8601_date_constraint_pattern (yyvs4.item (yyvsp4)) then
				create yyval56.make_from_pattern (yyvs4.item (yyvsp4))
			else
				create str.make (0)
				from valid_date_constraint_patterns.start until valid_date_constraint_patterns.off loop
					if not valid_date_constraint_patterns.isfirst then
						str.append (", ")
					end
					str.append (valid_date_constraint_patterns.item)
					valid_date_constraint_patterns.forth
				end
				abort_with_error ({ADL_MESSAGES_IDS}.ec_SCDPT, <<yyvs4.item (yyvsp4), str>>)
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
when 154 then
--|#line 1413 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1413")
end

			create yyval56.make_value (yyvs27.item (yyvsp27))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp56 := yyvsp56 + 1
	yyvsp27 := yyvsp27 -1
	if yyvsp56 >= yyvsc56 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs56")
		end
		yyvsc56 := yyvsc56 + yyInitial_yyvs_size
		yyvs56 := yyspecial_routines56.aliased_resized_area (yyvs56, yyvsc56)
	end
	yyspecial_routines56.force (yyvs56, yyval56, yyvsp56)
end
when 155 then
--|#line 1417 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1417")
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
when 156 then
--|#line 1421 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1421")
end

			create yyval56.make_interval (yyvs43.item (yyvsp43))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp56 := yyvsp56 + 1
	yyvsp43 := yyvsp43 -1
	if yyvsp56 >= yyvsc56 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs56")
		end
		yyvsc56 := yyvsc56 + yyInitial_yyvs_size
		yyvs56 := yyspecial_routines56.aliased_resized_area (yyvs56, yyvsc56)
	end
	yyspecial_routines56.force (yyvs56, yyval56, yyvsp56)
end
when 157 then
--|#line 1425 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1425")
end

			create yyval56.make (yyvs49.item (yyvsp49))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp56 := yyvsp56 + 1
	yyvsp49 := yyvsp49 -1
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
--|#line 1429 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1429")
end

			if yyvs56.item (yyvsp56).valid_value (yyvs27.item (yyvsp27)) then
				yyvs56.item (yyvsp56).set_assumed_value (yyvs27.item (yyvsp27))
				yyval56 := yyvs56.item (yyvsp56)
			else
				abort_with_error ({ODIN_MESSAGES_IDS}.ec_VOBAV, <<yyvs27.item (yyvsp27).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp27 := yyvsp27 -1
	yyspecial_routines56.force (yyvs56, yyval56, yyvsp56)
end
when 159 then
--|#line 1438 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1438")
end

			abort_with_error ({ADL_MESSAGES_IDS}.ec_SCDAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines56.force (yyvs56, yyval56, yyvsp56)
end
when 160 then
--|#line 1444 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1444")
end

			if valid_iso8601_time_constraint_pattern (yyvs4.item (yyvsp4)) then
				create yyval57.make_from_pattern (yyvs4.item (yyvsp4))
			else
				create str.make (0)
				across valid_time_constraint_patterns as patterns_csr loop
					if patterns_csr.cursor_index > 1 then
						str.append (", ")
					end
					str.append (patterns_csr.item)
				end
				abort_with_error ({ADL_MESSAGES_IDS}.ec_SCTPT, <<yyvs4.item (yyvsp4), str>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp57 := yyvsp57 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp57 >= yyvsc57 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs57")
		end
		yyvsc57 := yyvsc57 + yyInitial_yyvs_size
		yyvs57 := yyspecial_routines57.aliased_resized_area (yyvs57, yyvsc57)
	end
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
when 161 then
--|#line 1459 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1459")
end

			create yyval57.make_value (yyvs29.item (yyvsp29))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp57 := yyvsp57 + 1
	yyvsp29 := yyvsp29 -1
	if yyvsp57 >= yyvsc57 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs57")
		end
		yyvsc57 := yyvsc57 + yyInitial_yyvs_size
		yyvs57 := yyspecial_routines57.aliased_resized_area (yyvs57, yyvsc57)
	end
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
when 162 then
--|#line 1463 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1463")
end

			create yyval57.make_value_list (yyvs37.item (yyvsp37))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp57 := yyvsp57 + 1
	yyvsp37 := yyvsp37 -1
	if yyvsp57 >= yyvsc57 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs57")
		end
		yyvsc57 := yyvsc57 + yyInitial_yyvs_size
		yyvs57 := yyspecial_routines57.aliased_resized_area (yyvs57, yyvsc57)
	end
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
when 163 then
--|#line 1467 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1467")
end

			create yyval57.make_interval (yyvs42.item (yyvsp42))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp57 := yyvsp57 + 1
	yyvsp42 := yyvsp42 -1
	if yyvsp57 >= yyvsc57 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs57")
		end
		yyvsc57 := yyvsc57 + yyInitial_yyvs_size
		yyvs57 := yyspecial_routines57.aliased_resized_area (yyvs57, yyvsc57)
	end
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
when 164 then
--|#line 1471 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1471")
end

			create yyval57.make (yyvs48.item (yyvsp48))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp57 := yyvsp57 + 1
	yyvsp48 := yyvsp48 -1
	if yyvsp57 >= yyvsc57 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs57")
		end
		yyvsc57 := yyvsc57 + yyInitial_yyvs_size
		yyvs57 := yyspecial_routines57.aliased_resized_area (yyvs57, yyvsc57)
	end
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
when 165 then
--|#line 1475 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1475")
end

			if yyvs57.item (yyvsp57).valid_value (yyvs29.item (yyvsp29)) then
				yyvs57.item (yyvsp57).set_assumed_value (yyvs29.item (yyvsp29))
				yyval57 := yyvs57.item (yyvsp57)
			else
				abort_with_error ({ODIN_MESSAGES_IDS}.ec_VOBAV, <<yyvs29.item (yyvsp29).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp29 := yyvsp29 -1
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
when 166 then
--|#line 1484 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1484")
end

			abort_with_error ({ADL_MESSAGES_IDS}.ec_SCTAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
when 167 then
--|#line 1490 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1490")
end

			if valid_iso8601_date_time_constraint_pattern (yyvs4.item (yyvsp4)) then
				create yyval54.make_from_pattern (yyvs4.item (yyvsp4))
			else
				create str.make (0)
				across valid_date_time_constraint_patterns as patterns_csr loop
					if patterns_csr.cursor_index > 1 then
						str.append (", ")
					end
					str.append (patterns_csr.item)
				end
				abort_with_error ({ADL_MESSAGES_IDS}.ec_SCDTPT, <<yyvs4.item (yyvsp4), str>>)
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
when 168 then
--|#line 1505 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1505")
end

			create yyval54.make_value (yyvs28.item (yyvsp28))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp54 := yyvsp54 + 1
	yyvsp28 := yyvsp28 -1
	if yyvsp54 >= yyvsc54 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs54")
		end
		yyvsc54 := yyvsc54 + yyInitial_yyvs_size
		yyvs54 := yyspecial_routines54.aliased_resized_area (yyvs54, yyvsc54)
	end
	yyspecial_routines54.force (yyvs54, yyval54, yyvsp54)
end
when 169 then
--|#line 1509 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1509")
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
when 170 then
--|#line 1513 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1513")
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
when 171 then
--|#line 1517 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1517")
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
when 172 then
--|#line 1521 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1521")
end

			if yyvs54.item (yyvsp54).valid_value (yyvs28.item (yyvsp28)) then
				yyvs54.item (yyvsp54).set_assumed_value (yyvs28.item (yyvsp28))
				yyval54 := yyvs54.item (yyvsp54)
			else
				abort_with_error ({ODIN_MESSAGES_IDS}.ec_VOBAV, <<yyvs28.item (yyvsp28).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp28 := yyvsp28 -1
	yyspecial_routines54.force (yyvs54, yyval54, yyvsp54)
end
when 173 then
--|#line 1530 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1530")
end

			abort_with_error ({ADL_MESSAGES_IDS}.ec_SCDTAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines54.force (yyvs54, yyval54, yyvsp54)
end
when 174 then
--|#line 1536 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1536")
end

			if valid_iso8601_duration_constraint_pattern (yyvs4.item (yyvsp4)) then
				create yyval55.make_pattern_with_range (yyvs4.item (yyvsp4), yyvs45.item (yyvsp45))
			else
				abort_with_error ({ADL_MESSAGES_IDS}.ec_SCDUPT, <<yyvs4.item (yyvsp4)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp55 := yyvsp55 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -1
	yyvsp45 := yyvsp45 -1
	if yyvsp55 >= yyvsc55 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs55")
		end
		yyvsc55 := yyvsc55 + yyInitial_yyvs_size
		yyvs55 := yyspecial_routines55.aliased_resized_area (yyvs55, yyvsc55)
	end
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
when 175 then
--|#line 1544 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1544")
end

			if valid_iso8601_duration_constraint_pattern (yyvs4.item (yyvsp4)) then
				create yyval55.make_pattern_with_range (yyvs4.item (yyvsp4), create {POINT_INTERVAL [ISO8601_DURATION]}.make (yyvs30.item (yyvsp30)))
			else
				abort_with_error ({ADL_MESSAGES_IDS}.ec_SCDUPT, <<yyvs4.item (yyvsp4)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp55 := yyvsp55 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -1
	yyvsp30 := yyvsp30 -1
	if yyvsp55 >= yyvsc55 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs55")
		end
		yyvsc55 := yyvsc55 + yyInitial_yyvs_size
		yyvs55 := yyspecial_routines55.aliased_resized_area (yyvs55, yyvsc55)
	end
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
when 176 then
--|#line 1552 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1552")
end

			if valid_iso8601_duration_constraint_pattern (yyvs4.item (yyvsp4)) then
				create yyval55.make_from_pattern (yyvs4.item (yyvsp4))
			else
				abort_with_error ({ADL_MESSAGES_IDS}.ec_SCDUPT, <<yyvs4.item (yyvsp4)>>)
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
when 177 then
--|#line 1560 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1560")
end

			create yyval55.make_value (yyvs30.item (yyvsp30))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp55 := yyvsp55 + 1
	yyvsp30 := yyvsp30 -1
	if yyvsp55 >= yyvsc55 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs55")
		end
		yyvsc55 := yyvsc55 + yyInitial_yyvs_size
		yyvs55 := yyspecial_routines55.aliased_resized_area (yyvs55, yyvsc55)
	end
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
when 178 then
--|#line 1564 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1564")
end

			create yyval55.make_value_list (yyvs39.item (yyvsp39))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp55 := yyvsp55 + 1
	yyvsp39 := yyvsp39 -1
	if yyvsp55 >= yyvsc55 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs55")
		end
		yyvsc55 := yyvsc55 + yyInitial_yyvs_size
		yyvs55 := yyspecial_routines55.aliased_resized_area (yyvs55, yyvsc55)
	end
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
when 179 then
--|#line 1568 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1568")
end

			create yyval55.make_interval (yyvs45.item (yyvsp45))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp55 := yyvsp55 + 1
	yyvsp45 := yyvsp45 -1
	if yyvsp55 >= yyvsc55 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs55")
		end
		yyvsc55 := yyvsc55 + yyInitial_yyvs_size
		yyvs55 := yyspecial_routines55.aliased_resized_area (yyvs55, yyvsc55)
	end
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
when 180 then
--|#line 1572 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1572")
end

			create yyval55.make (yyvs51.item (yyvsp51))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp55 := yyvsp55 + 1
	yyvsp51 := yyvsp51 -1
	if yyvsp55 >= yyvsc55 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs55")
		end
		yyvsc55 := yyvsc55 + yyInitial_yyvs_size
		yyvs55 := yyspecial_routines55.aliased_resized_area (yyvs55, yyvsc55)
	end
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
when 181 then
--|#line 1576 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1576")
end

			if yyvs55.item (yyvsp55).valid_value (yyvs30.item (yyvsp30)) then
				yyvs55.item (yyvsp55).set_assumed_value (yyvs30.item (yyvsp30))
				yyval55 := yyvs55.item (yyvsp55)
			else
				abort_with_error ({ODIN_MESSAGES_IDS}.ec_VOBAV, <<yyvs30.item (yyvsp30).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp30 := yyvsp30 -1
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
when 182 then
--|#line 1585 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1585")
end

			abort_with_error ({ADL_MESSAGES_IDS}.ec_SCDUAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
when 183 then
--|#line 1590 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1590")
end

			abort_with_error ({ADL_MESSAGES_IDS}.ec_SCDUPT, <<yyvs4.item (yyvsp4).out>>)
		
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
when 184 then
--|#line 1596 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1596")
end

			create yyval53.make_value (yyvs4.item (yyvsp4))
		
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
when 185 then
--|#line 1600 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1600")
end

			create yyval53.make (yyvs32.item (yyvsp32))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp53 := yyvsp53 + 1
	yyvsp32 := yyvsp32 -1
	if yyvsp53 >= yyvsc53 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs53")
		end
		yyvsc53 := yyvsc53 + yyInitial_yyvs_size
		yyvs53 := yyspecial_routines53.aliased_resized_area (yyvs53, yyvsc53)
	end
	yyspecial_routines53.force (yyvs53, yyval53, yyvsp53)
end
when 186 then
--|#line 1604 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1604")
end

			create yyval53.make_value (yyvs4.item (yyvsp4))
			if yyval53.constraint.first.is_equal ({C_STRING}.Invalid_regex_message) then
				abort_with_error ({ADL_MESSAGES_IDS}.ec_SCSRE, <<yyvs4.item (yyvsp4)>>)
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
when 187 then
--|#line 1611 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1611")
end

			if yyvs53.item (yyvsp53).valid_value (yyvs4.item (yyvsp4)) then
				yyvs53.item (yyvsp53).set_assumed_value (yyvs4.item (yyvsp4))
				yyval53 := yyvs53.item (yyvsp53)
			else
				abort_with_error ({ODIN_MESSAGES_IDS}.ec_VOBAV, <<yyvs4.item (yyvsp4).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyspecial_routines53.force (yyvs53, yyval53, yyvsp53)
end
when 188 then
--|#line 1620 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1620")
end

			abort_with_error ({ADL_MESSAGES_IDS}.ec_SCSAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines53.force (yyvs53, yyval53, yyvsp53)
end
when 189 then
--|#line 1626 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1626")
end

			create yyval60.make (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp60 := yyvsp60 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp60 >= yyvsc60 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs60")
		end
		yyvsc60 := yyvsc60 + yyInitial_yyvs_size
		yyvs60 := yyspecial_routines60.aliased_resized_area (yyvs60, yyvsc60)
	end
	yyspecial_routines60.force (yyvs60, yyval60, yyvsp60)
end
when 190 then
--|#line 1630 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1630")
end

			-- note - whitespace is stripped in scanner
			create yyval60.make (yyvs4.item (yyvsp4).substring (1, yyvs4.item (yyvsp4).index_of (';', 1) - 1))
			yyval60.set_assumed_value (yyvs4.item (yyvsp4).substring (yyvs4.item (yyvsp4).index_of (';', 1) + 1, yyvs4.item (yyvsp4).count))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp60 := yyvsp60 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp60 >= yyvsc60 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs60")
		end
		yyvsc60 := yyvsc60 + yyInitial_yyvs_size
		yyvs60 := yyspecial_routines60.aliased_resized_area (yyvs60, yyvsc60)
	end
	yyspecial_routines60.force (yyvs60, yyval60, yyvsp60)
end
when 191 then
--|#line 1636 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1636")
end

			create yyval60.make (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp60 := yyvsp60 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp60 >= yyvsc60 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs60")
		end
		yyvsc60 := yyvsc60 + yyInitial_yyvs_size
		yyvs60 := yyspecial_routines60.aliased_resized_area (yyvs60, yyvsc60)
	end
	yyspecial_routines60.force (yyvs60, yyval60, yyvsp60)
end
when 192 then
--|#line 1643 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1643")
end

			-- e.g. "local::at40"
			if yyvs5.item (yyvsp5).is_single then
				create yyval60.make (yyvs5.item (yyvsp5).codes.first)

			-- e.g. "local::at40, at41; at40"; we have to synthesise an ac-code and convert the inline 
			-- definition to a separate value set
			else
				-- replace by ac-code ref and store value set for addition to terminology
				create yyval60.make (new_fake_ac_code)
				if attached yyvs5.item (yyvsp5).assumed_code as att_ac then
					yyval60.set_assumed_value (att_ac)
				end
				compiler_billboard.value_sets.put (create {VALUE_SET}.make (yyval60.constraint, yyvs5.item (yyvsp5).codes), yyval60.constraint)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp60 := yyvsp60 + 1
	yyvsp5 := yyvsp5 -1
	if yyvsp60 >= yyvsc60 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs60")
		end
		yyvsc60 := yyvsc60 + yyInitial_yyvs_size
		yyvs60 := yyspecial_routines60.aliased_resized_area (yyvs60, yyvsc60)
	end
	yyspecial_routines60.force (yyvs60, yyval60, yyvsp60)
end
when 193 then
--|#line 1660 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1660")
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
					create yyval60.make (flat_anc.terminology.term_binding_key_for_external_code (yyvs5.item (yyvsp5).terminology_id, yyvs5.item (yyvsp5).first_code))

				-- may already have been encountered in this archetype
				elseif attached compiler_billboard.binding_code_map.item (yyvs5.item (yyvsp5).first_code) as att_at_code then
					create yyval60.make (att_at_code)

				-- have to create a new binding
				else
					-- otherwise we use the synthesised code
					check attached yyvs5.item (yyvsp5).last_converted_local as att_tcps then
						create yyval60.make (att_tcps.first_code)
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
				create yyval60.make (new_fake_ac_code)

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
					compiler_billboard.value_sets.put (create {VALUE_SET}.make (yyval60.constraint, at_codes), yyval60.constraint)
				else
					if attached yyvs5.item (yyvsp5).last_converted_local as att_tcps then
						if attached att_tcps.assumed_code as att_ac then
							yyval60.set_assumed_value (att_ac)
						end
						compiler_billboard.value_sets.put (create {VALUE_SET}.make (yyval60.constraint, att_tcps.codes), yyval60.constraint)
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
	yyvsp60 := yyvsp60 + 1
	yyvsp5 := yyvsp5 -1
	if yyvsp60 >= yyvsc60 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs60")
		end
		yyvsc60 := yyvsc60 + yyInitial_yyvs_size
		yyvs60 := yyspecial_routines60.aliased_resized_area (yyvs60, yyvsc60)
	end
	yyspecial_routines60.force (yyvs60, yyval60, yyvsp60)
end
when 194 then
--|#line 1741 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1741")
end

			abort_with_error ({ADL_MESSAGES_IDS}.ec_STVSI, <<err_str, c_attrs.item.path>>)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp60 := yyvsp60 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp60 >= yyvsc60 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs60")
		end
		yyvsc60 := yyvsc60 + yyInitial_yyvs_size
		yyvs60 := yyspecial_routines60.aliased_resized_area (yyvs60, yyvsc60)
	end
	yyspecial_routines60.force (yyvs60, yyval60, yyvsp60)
end
when 195 then
--|#line 1745 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1745")
end

			abort_with_error ({ADL_MESSAGES_IDS}.ec_STCDC, <<err_str, c_attrs.item.path>>)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp60 := yyvsp60 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp60 >= yyvsc60 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs60")
		end
		yyvsc60 := yyvsc60 + yyInitial_yyvs_size
		yyvs60 := yyspecial_routines60.aliased_resized_area (yyvs60, yyvsc60)
	end
	yyspecial_routines60.force (yyvs60, yyval60, yyvsp60)
end
when 196 then
--|#line 1749 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1749")
end

			abort_with_error ({ADL_MESSAGES_IDS}.ec_STCAC, <<err_str, c_attrs.item.path>>)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp60 := yyvsp60 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp60 >= yyvsc60 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs60")
		end
		yyvsc60 := yyvsc60 + yyInitial_yyvs_size
		yyvs60 := yyspecial_routines60.aliased_resized_area (yyvs60, yyvsc60)
	end
	yyspecial_routines60.force (yyvs60, yyval60, yyvsp60)
end
when 197 then
--|#line 1753 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1753")
end

			abort_with_error ({ADL_MESSAGES_IDS}.ec_STCVA, <<c_attrs.item.path>>)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp60 := yyvsp60 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp60 >= yyvsc60 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs60")
		end
		yyvsc60 := yyvsc60 + yyInitial_yyvs_size
		yyvs60 := yyspecial_routines60.aliased_resized_area (yyvs60, yyvsc60)
	end
	yyspecial_routines60.force (yyvs60, yyval60, yyvsp60)
end
when 198 then
--|#line 1759 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1759")
end

			create yyval52.make_true
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp52 := yyvsp52 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
when 199 then
--|#line 1763 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1763")
end

			create yyval52.make_false
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp52 := yyvsp52 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
when 200 then
--|#line 1767 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1767")
end

			create yyval52.make (yyvs35.item (yyvsp35))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp52 := yyvsp52 + 1
	yyvsp35 := yyvsp35 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
when 201 then
--|#line 1771 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1771")
end

			if yyvs52.item (yyvsp52).valid_value (yyvs26.item (yyvsp26)) then
				yyvs52.item (yyvsp52).set_assumed_value (yyvs26.item (yyvsp26))
			else
				abort_with_error ({ODIN_MESSAGES_IDS}.ec_VOBAV, <<yyvs26.item (yyvsp26).out>>)
			end
			yyval52 := yyvs52.item (yyvsp52)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp26 := yyvsp26 -1
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
when 202 then
--|#line 1780 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1780")
end

			abort_with_error ({ADL_MESSAGES_IDS}.ec_SCBAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
when 203 then
--|#line 1786 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1786")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 204 then
--|#line 1790 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1790")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 205 then
--|#line 1796 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1796")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 206 then
--|#line 1800 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1800")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 207 then
--|#line 1813 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1813")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 208 then
--|#line 1819 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1819")
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
when 209 then
--|#line 1825 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1825")
end

			yyvs32.item (yyvsp32).extend(yyvs4.item (yyvsp4))
			yyval32 := yyvs32.item (yyvsp32)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 210 then
--|#line 1833 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1833")
end

			yyval32 := yyvs32.item (yyvsp32)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 211 then
--|#line 1837 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1837")
end

			create yyval32.make (0)
			yyval32.extend (yyvs4.item (yyvsp4))
		
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
when 212 then
--|#line 1844 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1844")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 213 then
--|#line 1848 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1848")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 214 then
--|#line 1852 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1852")
end

			yyval2 := - yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 215 then
--|#line 1858 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1858")
end

			create yyval33.make(0)
			yyval33.extend(yyvs2.item (yyvsp2 - 1))
			yyval33.extend(yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -2
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
when 216 then
--|#line 1864 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1864")
end

			yyvs33.item (yyvsp33).extend(yyvs2.item (yyvsp2))
			yyval33 := yyvs33.item (yyvsp33)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 217 then
--|#line 1869 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1869")
end

			create yyval33.make(0)
			yyval33.extend(yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -1
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
when 218 then
--|#line 1876 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1876")
end

			if yyvs2.item (yyvsp2 - 1) <= yyvs2.item (yyvsp2) then
				create {PROPER_INTERVAL [INTEGER]} yyval40.make_bounded(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), True, True)
			else
				abort_with_error ({ODIN_MESSAGES_IDS}.ec_VIVLO, <<yyvs2.item (yyvsp2 - 1).out, yyvs2.item (yyvsp2).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -2
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 219 then
--|#line 1884 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1884")
end

			if yyvs2.item (yyvsp2 - 1) <= yyvs2.item (yyvsp2) then
				create {PROPER_INTERVAL [INTEGER]} yyval40.make_bounded(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), False, True)
			else
				abort_with_error ({ODIN_MESSAGES_IDS}.ec_VIVLO, <<yyvs2.item (yyvsp2 - 1).out, yyvs2.item (yyvsp2).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp2 := yyvsp2 -2
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 220 then
--|#line 1892 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1892")
end

			if yyvs2.item (yyvsp2 - 1) <= yyvs2.item (yyvsp2) then
				create {PROPER_INTERVAL [INTEGER]} yyval40.make_bounded(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), True, False)
			else
				abort_with_error ({ODIN_MESSAGES_IDS}.ec_VIVLO, <<yyvs2.item (yyvsp2 - 1).out, yyvs2.item (yyvsp2).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp2 := yyvsp2 -2
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 221 then
--|#line 1900 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1900")
end

			if yyvs2.item (yyvsp2 - 1) <= yyvs2.item (yyvsp2) then
				create {PROPER_INTERVAL [INTEGER]} yyval40.make_bounded (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), False, False)
			else
				abort_with_error ({ODIN_MESSAGES_IDS}.ec_VIVLO, <<yyvs2.item (yyvsp2 - 1).out, yyvs2.item (yyvsp2).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp2 := yyvsp2 -2
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 222 then
--|#line 1908 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1908")
end

			create {PROPER_INTERVAL [INTEGER]} yyval40.make_lower_unbounded (yyvs2.item (yyvsp2), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -1
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 223 then
--|#line 1912 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1912")
end

			create {PROPER_INTERVAL [INTEGER]} yyval40.make_lower_unbounded (yyvs2.item (yyvsp2), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -1
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 224 then
--|#line 1916 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1916")
end

			create {PROPER_INTERVAL [INTEGER]} yyval40.make_upper_unbounded (yyvs2.item (yyvsp2), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -1
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 225 then
--|#line 1920 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1920")
end

			create {PROPER_INTERVAL [INTEGER]} yyval40.make_upper_unbounded (yyvs2.item (yyvsp2), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -1
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 226 then
--|#line 1924 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1924")
end

			create {POINT_INTERVAL [INTEGER]} yyval40.make (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -1
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 227 then
--|#line 1930 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1930")
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
when 228 then
--|#line 1936 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1936")
end

			yyvs46.item (yyvsp46).extend(yyvs40.item (yyvsp40))
			yyval46 := yyvs46.item (yyvsp46)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp40 := yyvsp40 -1
	yyspecial_routines46.force (yyvs46, yyval46, yyvsp46)
end
when 229 then
--|#line 1941 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1941")
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
when 230 then
--|#line 1948 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1948")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 231 then
--|#line 1952 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1952")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 232 then
--|#line 1956 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1956")
end

			yyval3 := - yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 233 then
--|#line 1962 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1962")
end

			create yyval34.make(0)
			yyval34.extend(yyvs3.item (yyvsp3 - 1))
			yyval34.extend(yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp34 := yyvsp34 + 1
	yyvsp3 := yyvsp3 -2
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
when 234 then
--|#line 1968 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1968")
end

			yyvs34.item (yyvsp34).extend(yyvs3.item (yyvsp3))
			yyval34 := yyvs34.item (yyvsp34)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 235 then
--|#line 1973 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1973")
end

			create yyval34.make(0)
			yyval34.extend(yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp34 := yyvsp34 + 1
	yyvsp3 := yyvsp3 -1
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
when 236 then
--|#line 1980 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1980")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create {PROPER_INTERVAL [REAL]} yyval41.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), True, True)
			else
				abort_with_error ({ODIN_MESSAGES_IDS}.ec_VIVLO, <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -2
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 237 then
--|#line 1988 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1988")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create {PROPER_INTERVAL [REAL]} yyval41.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), False, True)
			else
				abort_with_error ({ODIN_MESSAGES_IDS}.ec_VIVLO, <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp3 := yyvsp3 -2
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 238 then
--|#line 1996 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 1996")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create {PROPER_INTERVAL [REAL]} yyval41.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), True, False)
			else
				abort_with_error ({ODIN_MESSAGES_IDS}.ec_VIVLO, <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp3 := yyvsp3 -2
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 239 then
--|#line 2004 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2004")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create {PROPER_INTERVAL [REAL]} yyval41.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), False, False)
			else
				abort_with_error ({ODIN_MESSAGES_IDS}.ec_VIVLO, <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp3 := yyvsp3 -2
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 240 then
--|#line 2012 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2012")
end

			create {PROPER_INTERVAL [REAL]} yyval41.make_lower_unbounded(yyvs3.item (yyvsp3), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 241 then
--|#line 2016 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2016")
end

			create {PROPER_INTERVAL [REAL]} yyval41.make_lower_unbounded(yyvs3.item (yyvsp3), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 242 then
--|#line 2020 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2020")
end

			create {PROPER_INTERVAL [REAL]} yyval41.make_upper_unbounded(yyvs3.item (yyvsp3), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 243 then
--|#line 2024 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2024")
end

			create {PROPER_INTERVAL [REAL]} yyval41.make_upper_unbounded(yyvs3.item (yyvsp3), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 244 then
--|#line 2028 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2028")
end

			create {POINT_INTERVAL [REAL]} yyval41.make(yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp3 := yyvsp3 -1
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 245 then
--|#line 2034 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2034")
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
when 246 then
--|#line 2040 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2040")
end

			yyvs47.item (yyvsp47).extend(yyvs41.item (yyvsp41))
			yyval47 := yyvs47.item (yyvsp47)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp41 := yyvsp41 -1
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
when 247 then
--|#line 2045 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2045")
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
when 248 then
--|#line 2052 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2052")
end

			yyval26 := True
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp26 := yyvsp26 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp26 >= yyvsc26 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs26")
		end
		yyvsc26 := yyvsc26 + yyInitial_yyvs_size
		yyvs26 := yyspecial_routines26.aliased_resized_area (yyvs26, yyvsc26)
	end
	yyspecial_routines26.force (yyvs26, yyval26, yyvsp26)
end
when 249 then
--|#line 2056 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2056")
end

			yyval26 := False
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp26 := yyvsp26 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp26 >= yyvsc26 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs26")
		end
		yyvsc26 := yyvsc26 + yyInitial_yyvs_size
		yyvs26 := yyspecial_routines26.aliased_resized_area (yyvs26, yyvsc26)
	end
	yyspecial_routines26.force (yyvs26, yyval26, yyvsp26)
end
when 250 then
--|#line 2062 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2062")
end

			create yyval35.make(0)
			yyval35.extend(yyvs26.item (yyvsp26 - 1))
			yyval35.extend(yyvs26.item (yyvsp26))
		
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
when 251 then
--|#line 2068 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2068")
end

			yyvs35.item (yyvsp35).extend(yyvs26.item (yyvsp26))
			yyval35 := yyvs35.item (yyvsp35)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp26 := yyvsp26 -1
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 252 then
--|#line 2073 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2073")
end

			create yyval35.make(0)
			yyval35.extend(yyvs26.item (yyvsp26))
		
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
when 253 then
--|#line 2080 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2080")
end

			if valid_iso8601_date(yyvs4.item (yyvsp4)) then
				create yyval27.make_from_string(yyvs4.item (yyvsp4))
			else
				abort_with_error ({ODIN_MESSAGES_IDS}.ec_VIDV, <<yyvs4.item (yyvsp4)>>)
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
when 254 then
--|#line 2090 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2090")
end

			create yyval36.make(0)
			yyval36.extend (yyvs27.item (yyvsp27 - 1))
			yyval36.extend (yyvs27.item (yyvsp27))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp36 := yyvsp36 + 1
	yyvsp27 := yyvsp27 -2
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
when 255 then
--|#line 2096 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2096")
end

			yyvs36.item (yyvsp36).extend (yyvs27.item (yyvsp27))
			yyval36 := yyvs36.item (yyvsp36)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp27 := yyvsp27 -1
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
when 256 then
--|#line 2101 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2101")
end

			create yyval36.make(0)
			yyval36.extend (yyvs27.item (yyvsp27))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp36 := yyvsp36 + 1
	yyvsp27 := yyvsp27 -1
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
when 257 then
--|#line 2108 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2108")
end

			if yyvs27.item (yyvsp27 - 1) <= yyvs27.item (yyvsp27) then
				create {PROPER_INTERVAL [ISO8601_DATE]} yyval43.make_bounded(yyvs27.item (yyvsp27 - 1), yyvs27.item (yyvsp27), True, True)
			else
				abort_with_error ({ODIN_MESSAGES_IDS}.ec_VIVLO, <<yyvs27.item (yyvsp27 - 1).out, yyvs27.item (yyvsp27).out>>)
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
when 258 then
--|#line 2116 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2116")
end

			if yyvs27.item (yyvsp27 - 1) <= yyvs27.item (yyvsp27) then
				create {PROPER_INTERVAL [ISO8601_DATE]} yyval43.make_bounded(yyvs27.item (yyvsp27 - 1), yyvs27.item (yyvsp27), False, True)
			else
				abort_with_error ({ODIN_MESSAGES_IDS}.ec_VIVLO, <<yyvs27.item (yyvsp27 - 1).out, yyvs27.item (yyvsp27).out>>)
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
when 259 then
--|#line 2124 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2124")
end

			if yyvs27.item (yyvsp27 - 1) <= yyvs27.item (yyvsp27) then
				create {PROPER_INTERVAL [ISO8601_DATE]} yyval43.make_bounded(yyvs27.item (yyvsp27 - 1), yyvs27.item (yyvsp27), True, False)
			else
				abort_with_error ({ODIN_MESSAGES_IDS}.ec_VIVLO, <<yyvs27.item (yyvsp27 - 1).out, yyvs27.item (yyvsp27).out>>)
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
when 260 then
--|#line 2132 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2132")
end

			if yyvs27.item (yyvsp27 - 1) <= yyvs27.item (yyvsp27) then
				create {PROPER_INTERVAL [ISO8601_DATE]} yyval43.make_bounded(yyvs27.item (yyvsp27 - 1), yyvs27.item (yyvsp27), False, False)
			else
				abort_with_error ({ODIN_MESSAGES_IDS}.ec_VIVLO, <<yyvs27.item (yyvsp27 - 1).out, yyvs27.item (yyvsp27).out>>)
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
when 261 then
--|#line 2140 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2140")
end

			create {PROPER_INTERVAL [ISO8601_DATE]} yyval43.make_lower_unbounded(yyvs27.item (yyvsp27), False)
		
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
when 262 then
--|#line 2144 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2144")
end

			create {PROPER_INTERVAL [ISO8601_DATE]} yyval43.make_lower_unbounded(yyvs27.item (yyvsp27), True)
		
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
when 263 then
--|#line 2148 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2148")
end

			create {PROPER_INTERVAL [ISO8601_DATE]} yyval43.make_upper_unbounded(yyvs27.item (yyvsp27), False)
		
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
when 264 then
--|#line 2152 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2152")
end

			create {PROPER_INTERVAL [ISO8601_DATE]} yyval43.make_upper_unbounded(yyvs27.item (yyvsp27), True)
		
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
when 265 then
--|#line 2156 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2156")
end

			create {POINT_INTERVAL [ISO8601_DATE]} yyval43.make (yyvs27.item (yyvsp27))
		
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
when 266 then
--|#line 2162 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2162")
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
when 267 then
--|#line 2168 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2168")
end

			yyvs49.item (yyvsp49).extend(yyvs43.item (yyvsp43))
			yyval49 := yyvs49.item (yyvsp49)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp43 := yyvsp43 -1
	yyspecial_routines49.force (yyvs49, yyval49, yyvsp49)
end
when 268 then
--|#line 2173 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2173")
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
when 269 then
--|#line 2180 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2180")
end

			if valid_iso8601_time(yyvs4.item (yyvsp4)) then
				create yyval29.make_from_string(yyvs4.item (yyvsp4))
			else
				abort_with_error ({ODIN_MESSAGES_IDS}.ec_VITV, <<yyvs4.item (yyvsp4)>>)
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
when 270 then
--|#line 2190 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2190")
end

			create yyval37.make(0)
			yyval37.extend(yyvs29.item (yyvsp29 - 1))
			yyval37.extend(yyvs29.item (yyvsp29))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp37 := yyvsp37 + 1
	yyvsp29 := yyvsp29 -2
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
when 271 then
--|#line 2196 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2196")
end

			yyvs37.item (yyvsp37).extend(yyvs29.item (yyvsp29))
			yyval37 := yyvs37.item (yyvsp37)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp29 := yyvsp29 -1
	yyspecial_routines37.force (yyvs37, yyval37, yyvsp37)
end
when 272 then
--|#line 2201 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2201")
end

			create yyval37.make(0)
			yyval37.extend(yyvs29.item (yyvsp29))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp37 := yyvsp37 + 1
	yyvsp29 := yyvsp29 -1
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
when 273 then
--|#line 2208 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2208")
end

			if yyvs29.item (yyvsp29 - 1) <= yyvs29.item (yyvsp29) then
				create {PROPER_INTERVAL [ISO8601_TIME]} yyval42.make_bounded(yyvs29.item (yyvsp29 - 1), yyvs29.item (yyvsp29), True, True)
			else
				abort_with_error ({ODIN_MESSAGES_IDS}.ec_VIVLO, <<yyvs29.item (yyvsp29 - 1).out, yyvs29.item (yyvsp29).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp29 := yyvsp29 -2
	if yyvsp42 >= yyvsc42 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs42")
		end
		yyvsc42 := yyvsc42 + yyInitial_yyvs_size
		yyvs42 := yyspecial_routines42.aliased_resized_area (yyvs42, yyvsc42)
	end
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
when 274 then
--|#line 2216 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2216")
end

			if yyvs29.item (yyvsp29 - 1) <= yyvs29.item (yyvsp29) then
				create {PROPER_INTERVAL [ISO8601_TIME]} yyval42.make_bounded(yyvs29.item (yyvsp29 - 1), yyvs29.item (yyvsp29), False, True)
			else
				abort_with_error ({ODIN_MESSAGES_IDS}.ec_VIVLO, <<yyvs29.item (yyvsp29 - 1).out, yyvs29.item (yyvsp29).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp29 := yyvsp29 -2
	if yyvsp42 >= yyvsc42 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs42")
		end
		yyvsc42 := yyvsc42 + yyInitial_yyvs_size
		yyvs42 := yyspecial_routines42.aliased_resized_area (yyvs42, yyvsc42)
	end
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
when 275 then
--|#line 2224 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2224")
end

			if yyvs29.item (yyvsp29 - 1) <= yyvs29.item (yyvsp29) then
				create {PROPER_INTERVAL [ISO8601_TIME]} yyval42.make_bounded(yyvs29.item (yyvsp29 - 1), yyvs29.item (yyvsp29), True, False)
			else
				abort_with_error ({ODIN_MESSAGES_IDS}.ec_VIVLO, <<yyvs29.item (yyvsp29 - 1).out, yyvs29.item (yyvsp29).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp29 := yyvsp29 -2
	if yyvsp42 >= yyvsc42 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs42")
		end
		yyvsc42 := yyvsc42 + yyInitial_yyvs_size
		yyvs42 := yyspecial_routines42.aliased_resized_area (yyvs42, yyvsc42)
	end
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
when 276 then
--|#line 2232 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2232")
end

			if yyvs29.item (yyvsp29 - 1) <= yyvs29.item (yyvsp29) then
				create {PROPER_INTERVAL [ISO8601_TIME]} yyval42.make_bounded(yyvs29.item (yyvsp29 - 1), yyvs29.item (yyvsp29), False, False)
			else
				abort_with_error ({ODIN_MESSAGES_IDS}.ec_VIVLO, <<yyvs29.item (yyvsp29 - 1).out, yyvs29.item (yyvsp29).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp29 := yyvsp29 -2
	if yyvsp42 >= yyvsc42 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs42")
		end
		yyvsc42 := yyvsc42 + yyInitial_yyvs_size
		yyvs42 := yyspecial_routines42.aliased_resized_area (yyvs42, yyvsc42)
	end
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
when 277 then
--|#line 2240 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2240")
end

			create {PROPER_INTERVAL [ISO8601_TIME]} yyval42.make_lower_unbounded(yyvs29.item (yyvsp29), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp29 := yyvsp29 -1
	if yyvsp42 >= yyvsc42 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs42")
		end
		yyvsc42 := yyvsc42 + yyInitial_yyvs_size
		yyvs42 := yyspecial_routines42.aliased_resized_area (yyvs42, yyvsc42)
	end
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
when 278 then
--|#line 2244 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2244")
end

			create {PROPER_INTERVAL [ISO8601_TIME]} yyval42.make_lower_unbounded(yyvs29.item (yyvsp29), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp29 := yyvsp29 -1
	if yyvsp42 >= yyvsc42 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs42")
		end
		yyvsc42 := yyvsc42 + yyInitial_yyvs_size
		yyvs42 := yyspecial_routines42.aliased_resized_area (yyvs42, yyvsc42)
	end
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
when 279 then
--|#line 2248 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2248")
end

			create {PROPER_INTERVAL [ISO8601_TIME]} yyval42.make_upper_unbounded(yyvs29.item (yyvsp29), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp29 := yyvsp29 -1
	if yyvsp42 >= yyvsc42 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs42")
		end
		yyvsc42 := yyvsc42 + yyInitial_yyvs_size
		yyvs42 := yyspecial_routines42.aliased_resized_area (yyvs42, yyvsc42)
	end
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
when 280 then
--|#line 2252 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2252")
end

			create {PROPER_INTERVAL [ISO8601_TIME]} yyval42.make_upper_unbounded(yyvs29.item (yyvsp29), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp29 := yyvsp29 -1
	if yyvsp42 >= yyvsc42 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs42")
		end
		yyvsc42 := yyvsc42 + yyInitial_yyvs_size
		yyvs42 := yyspecial_routines42.aliased_resized_area (yyvs42, yyvsc42)
	end
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
when 281 then
--|#line 2256 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2256")
end

			create {POINT_INTERVAL [ISO8601_TIME]} yyval42.make (yyvs29.item (yyvsp29))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp29 := yyvsp29 -1
	if yyvsp42 >= yyvsc42 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs42")
		end
		yyvsc42 := yyvsc42 + yyInitial_yyvs_size
		yyvs42 := yyspecial_routines42.aliased_resized_area (yyvs42, yyvsc42)
	end
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
when 282 then
--|#line 2262 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2262")
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
when 283 then
--|#line 2268 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2268")
end

			yyvs48.item (yyvsp48).extend(yyvs42.item (yyvsp42))
			yyval48 := yyvs48.item (yyvsp48)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp42 := yyvsp42 -1
	yyspecial_routines48.force (yyvs48, yyval48, yyvsp48)
end
when 284 then
--|#line 2273 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2273")
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
when 285 then
--|#line 2280 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2280")
end

			if valid_iso8601_date_time(yyvs4.item (yyvsp4)) then
				create yyval28.make_from_string(yyvs4.item (yyvsp4))
			else
				abort_with_error ({ODIN_MESSAGES_IDS}.ec_VIDTV, <<yyvs4.item (yyvsp4)>>)
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
when 286 then
--|#line 2290 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2290")
end

			create yyval38.make(0)
			yyval38.extend(yyvs28.item (yyvsp28 - 1))
			yyval38.extend(yyvs28.item (yyvsp28))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp38 := yyvsp38 + 1
	yyvsp28 := yyvsp28 -2
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
when 287 then
--|#line 2296 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2296")
end

			yyvs38.item (yyvsp38).extend(yyvs28.item (yyvsp28))
			yyval38 := yyvs38.item (yyvsp38)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp28 := yyvsp28 -1
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 288 then
--|#line 2301 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2301")
end

			create yyval38.make(0)
			yyval38.extend(yyvs28.item (yyvsp28))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp38 := yyvsp38 + 1
	yyvsp28 := yyvsp28 -1
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
when 289 then
--|#line 2308 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2308")
end

			if yyvs28.item (yyvsp28 - 1) <= yyvs28.item (yyvsp28) then
				create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval44.make_bounded(yyvs28.item (yyvsp28 - 1), yyvs28.item (yyvsp28), True, True)
			else
				abort_with_error ({ODIN_MESSAGES_IDS}.ec_VIVLO, <<yyvs28.item (yyvsp28 - 1).out, yyvs28.item (yyvsp28).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp44 := yyvsp44 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp28 := yyvsp28 -2
	if yyvsp44 >= yyvsc44 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs44")
		end
		yyvsc44 := yyvsc44 + yyInitial_yyvs_size
		yyvs44 := yyspecial_routines44.aliased_resized_area (yyvs44, yyvsc44)
	end
	yyspecial_routines44.force (yyvs44, yyval44, yyvsp44)
end
when 290 then
--|#line 2316 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2316")
end

			if yyvs28.item (yyvsp28 - 1) <= yyvs28.item (yyvsp28) then
				create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval44.make_bounded(yyvs28.item (yyvsp28 - 1), yyvs28.item (yyvsp28), False, True)
			else
				abort_with_error ({ODIN_MESSAGES_IDS}.ec_VIVLO, <<yyvs28.item (yyvsp28 - 1).out, yyvs28.item (yyvsp28).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp44 := yyvsp44 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp28 := yyvsp28 -2
	if yyvsp44 >= yyvsc44 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs44")
		end
		yyvsc44 := yyvsc44 + yyInitial_yyvs_size
		yyvs44 := yyspecial_routines44.aliased_resized_area (yyvs44, yyvsc44)
	end
	yyspecial_routines44.force (yyvs44, yyval44, yyvsp44)
end
when 291 then
--|#line 2324 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2324")
end

			if yyvs28.item (yyvsp28 - 1) <= yyvs28.item (yyvsp28) then
				create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval44.make_bounded(yyvs28.item (yyvsp28 - 1), yyvs28.item (yyvsp28), True, False)
			else
				abort_with_error ({ODIN_MESSAGES_IDS}.ec_VIVLO, <<yyvs28.item (yyvsp28 - 1).out, yyvs28.item (yyvsp28).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp44 := yyvsp44 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp28 := yyvsp28 -2
	if yyvsp44 >= yyvsc44 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs44")
		end
		yyvsc44 := yyvsc44 + yyInitial_yyvs_size
		yyvs44 := yyspecial_routines44.aliased_resized_area (yyvs44, yyvsc44)
	end
	yyspecial_routines44.force (yyvs44, yyval44, yyvsp44)
end
when 292 then
--|#line 2332 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2332")
end

			if yyvs28.item (yyvsp28 - 1) <= yyvs28.item (yyvsp28) then
				create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval44.make_bounded(yyvs28.item (yyvsp28 - 1), yyvs28.item (yyvsp28), False, False)
			else
				abort_with_error ({ODIN_MESSAGES_IDS}.ec_VIVLO, <<yyvs28.item (yyvsp28 - 1).out, yyvs28.item (yyvsp28).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp44 := yyvsp44 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp28 := yyvsp28 -2
	if yyvsp44 >= yyvsc44 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs44")
		end
		yyvsc44 := yyvsc44 + yyInitial_yyvs_size
		yyvs44 := yyspecial_routines44.aliased_resized_area (yyvs44, yyvsc44)
	end
	yyspecial_routines44.force (yyvs44, yyval44, yyvsp44)
end
when 293 then
--|#line 2340 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2340")
end

			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval44.make_lower_unbounded(yyvs28.item (yyvsp28), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp44 := yyvsp44 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp28 := yyvsp28 -1
	if yyvsp44 >= yyvsc44 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs44")
		end
		yyvsc44 := yyvsc44 + yyInitial_yyvs_size
		yyvs44 := yyspecial_routines44.aliased_resized_area (yyvs44, yyvsc44)
	end
	yyspecial_routines44.force (yyvs44, yyval44, yyvsp44)
end
when 294 then
--|#line 2344 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2344")
end

			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval44.make_lower_unbounded(yyvs28.item (yyvsp28), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp44 := yyvsp44 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp28 := yyvsp28 -1
	if yyvsp44 >= yyvsc44 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs44")
		end
		yyvsc44 := yyvsc44 + yyInitial_yyvs_size
		yyvs44 := yyspecial_routines44.aliased_resized_area (yyvs44, yyvsc44)
	end
	yyspecial_routines44.force (yyvs44, yyval44, yyvsp44)
end
when 295 then
--|#line 2348 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2348")
end

			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval44.make_upper_unbounded(yyvs28.item (yyvsp28), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp44 := yyvsp44 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp28 := yyvsp28 -1
	if yyvsp44 >= yyvsc44 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs44")
		end
		yyvsc44 := yyvsc44 + yyInitial_yyvs_size
		yyvs44 := yyspecial_routines44.aliased_resized_area (yyvs44, yyvsc44)
	end
	yyspecial_routines44.force (yyvs44, yyval44, yyvsp44)
end
when 296 then
--|#line 2352 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2352")
end

			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval44.make_upper_unbounded(yyvs28.item (yyvsp28), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp44 := yyvsp44 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp28 := yyvsp28 -1
	if yyvsp44 >= yyvsc44 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs44")
		end
		yyvsc44 := yyvsc44 + yyInitial_yyvs_size
		yyvs44 := yyspecial_routines44.aliased_resized_area (yyvs44, yyvsc44)
	end
	yyspecial_routines44.force (yyvs44, yyval44, yyvsp44)
end
when 297 then
--|#line 2356 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2356")
end

			create {POINT_INTERVAL [ISO8601_DATE_TIME]} yyval44.make (yyvs28.item (yyvsp28))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp44 := yyvsp44 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp28 := yyvsp28 -1
	if yyvsp44 >= yyvsc44 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs44")
		end
		yyvsc44 := yyvsc44 + yyInitial_yyvs_size
		yyvs44 := yyspecial_routines44.aliased_resized_area (yyvs44, yyvsc44)
	end
	yyspecial_routines44.force (yyvs44, yyval44, yyvsp44)
end
when 298 then
--|#line 2362 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2362")
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
when 299 then
--|#line 2368 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2368")
end

			yyvs50.item (yyvsp50).extend(yyvs44.item (yyvsp44))
			yyval50 := yyvs50.item (yyvsp50)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp44 := yyvsp44 -1
	yyspecial_routines50.force (yyvs50, yyval50, yyvsp50)
end
when 300 then
--|#line 2373 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2373")
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
when 301 then
--|#line 2380 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2380")
end

			if valid_iso8601_duration(yyvs4.item (yyvsp4)) then
				create yyval30.make_from_string(yyvs4.item (yyvsp4))
			else
				abort_with_error ({ODIN_MESSAGES_IDS}.ec_VIDUV, <<yyvs4.item (yyvsp4)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp30 := yyvsp30 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp30 >= yyvsc30 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs30")
		end
		yyvsc30 := yyvsc30 + yyInitial_yyvs_size
		yyvs30 := yyspecial_routines30.aliased_resized_area (yyvs30, yyvsc30)
	end
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
when 302 then
--|#line 2390 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2390")
end

			create yyval39.make(0)
			yyval39.extend(yyvs30.item (yyvsp30 - 1))
			yyval39.extend(yyvs30.item (yyvsp30))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp39 := yyvsp39 + 1
	yyvsp30 := yyvsp30 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 303 then
--|#line 2396 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2396")
end

			yyvs39.item (yyvsp39).extend(yyvs30.item (yyvsp30))
			yyval39 := yyvs39.item (yyvsp39)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp30 := yyvsp30 -1
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 304 then
--|#line 2401 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2401")
end

			create yyval39.make(0)
			yyval39.extend(yyvs30.item (yyvsp30))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp39 := yyvsp39 + 1
	yyvsp30 := yyvsp30 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 305 then
--|#line 2408 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2408")
end

			if yyvs30.item (yyvsp30 - 1) <= yyvs30.item (yyvsp30) then
				create {PROPER_INTERVAL [ISO8601_DURATION]} yyval45.make_bounded(yyvs30.item (yyvsp30 - 1), yyvs30.item (yyvsp30), True, True)
			else
				abort_with_error ({ODIN_MESSAGES_IDS}.ec_VIVLO, <<yyvs30.item (yyvsp30 - 1).out, yyvs30.item (yyvsp30).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp45 := yyvsp45 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp30 := yyvsp30 -2
	if yyvsp45 >= yyvsc45 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs45")
		end
		yyvsc45 := yyvsc45 + yyInitial_yyvs_size
		yyvs45 := yyspecial_routines45.aliased_resized_area (yyvs45, yyvsc45)
	end
	yyspecial_routines45.force (yyvs45, yyval45, yyvsp45)
end
when 306 then
--|#line 2416 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2416")
end

			if yyvs30.item (yyvsp30 - 1) <= yyvs30.item (yyvsp30) then
				create {PROPER_INTERVAL [ISO8601_DURATION]} yyval45.make_bounded(yyvs30.item (yyvsp30 - 1), yyvs30.item (yyvsp30), False, True)
			else
				abort_with_error ({ODIN_MESSAGES_IDS}.ec_VIVLO, <<yyvs30.item (yyvsp30 - 1).out, yyvs30.item (yyvsp30).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp45 := yyvsp45 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp30 := yyvsp30 -2
	if yyvsp45 >= yyvsc45 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs45")
		end
		yyvsc45 := yyvsc45 + yyInitial_yyvs_size
		yyvs45 := yyspecial_routines45.aliased_resized_area (yyvs45, yyvsc45)
	end
	yyspecial_routines45.force (yyvs45, yyval45, yyvsp45)
end
when 307 then
--|#line 2424 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2424")
end

			if yyvs30.item (yyvsp30 - 1) <= yyvs30.item (yyvsp30) then
				create {PROPER_INTERVAL [ISO8601_DURATION]} yyval45.make_bounded(yyvs30.item (yyvsp30 - 1), yyvs30.item (yyvsp30), True, False)
			else
				abort_with_error ({ODIN_MESSAGES_IDS}.ec_VIVLO, <<yyvs30.item (yyvsp30 - 1).out, yyvs30.item (yyvsp30).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp45 := yyvsp45 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp30 := yyvsp30 -2
	if yyvsp45 >= yyvsc45 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs45")
		end
		yyvsc45 := yyvsc45 + yyInitial_yyvs_size
		yyvs45 := yyspecial_routines45.aliased_resized_area (yyvs45, yyvsc45)
	end
	yyspecial_routines45.force (yyvs45, yyval45, yyvsp45)
end
when 308 then
--|#line 2432 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2432")
end

			if yyvs30.item (yyvsp30 - 1) <= yyvs30.item (yyvsp30) then
				create {PROPER_INTERVAL [ISO8601_DURATION]} yyval45.make_bounded(yyvs30.item (yyvsp30 - 1), yyvs30.item (yyvsp30), False, False)
			else
				abort_with_error ({ODIN_MESSAGES_IDS}.ec_VIVLO, <<yyvs30.item (yyvsp30 - 1).out, yyvs30.item (yyvsp30).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp45 := yyvsp45 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp30 := yyvsp30 -2
	if yyvsp45 >= yyvsc45 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs45")
		end
		yyvsc45 := yyvsc45 + yyInitial_yyvs_size
		yyvs45 := yyspecial_routines45.aliased_resized_area (yyvs45, yyvsc45)
	end
	yyspecial_routines45.force (yyvs45, yyval45, yyvsp45)
end
when 309 then
--|#line 2440 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2440")
end

			create {PROPER_INTERVAL [ISO8601_DURATION]} yyval45.make_lower_unbounded(yyvs30.item (yyvsp30), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp45 := yyvsp45 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp30 := yyvsp30 -1
	if yyvsp45 >= yyvsc45 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs45")
		end
		yyvsc45 := yyvsc45 + yyInitial_yyvs_size
		yyvs45 := yyspecial_routines45.aliased_resized_area (yyvs45, yyvsc45)
	end
	yyspecial_routines45.force (yyvs45, yyval45, yyvsp45)
end
when 310 then
--|#line 2444 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2444")
end

			create {PROPER_INTERVAL [ISO8601_DURATION]} yyval45.make_lower_unbounded(yyvs30.item (yyvsp30), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp45 := yyvsp45 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp30 := yyvsp30 -1
	if yyvsp45 >= yyvsc45 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs45")
		end
		yyvsc45 := yyvsc45 + yyInitial_yyvs_size
		yyvs45 := yyspecial_routines45.aliased_resized_area (yyvs45, yyvsc45)
	end
	yyspecial_routines45.force (yyvs45, yyval45, yyvsp45)
end
when 311 then
--|#line 2448 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2448")
end

			create {PROPER_INTERVAL [ISO8601_DURATION]} yyval45.make_upper_unbounded(yyvs30.item (yyvsp30), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp45 := yyvsp45 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp30 := yyvsp30 -1
	if yyvsp45 >= yyvsc45 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs45")
		end
		yyvsc45 := yyvsc45 + yyInitial_yyvs_size
		yyvs45 := yyspecial_routines45.aliased_resized_area (yyvs45, yyvsc45)
	end
	yyspecial_routines45.force (yyvs45, yyval45, yyvsp45)
end
when 312 then
--|#line 2452 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2452")
end

			create {PROPER_INTERVAL [ISO8601_DURATION]} yyval45.make_upper_unbounded(yyvs30.item (yyvsp30), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp45 := yyvsp45 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp30 := yyvsp30 -1
	if yyvsp45 >= yyvsc45 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs45")
		end
		yyvsc45 := yyvsc45 + yyInitial_yyvs_size
		yyvs45 := yyspecial_routines45.aliased_resized_area (yyvs45, yyvsc45)
	end
	yyspecial_routines45.force (yyvs45, yyval45, yyvsp45)
end
when 313 then
--|#line 2456 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2456")
end

			create {POINT_INTERVAL [ISO8601_DURATION]} yyval45.make (yyvs30.item (yyvsp30))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp45 := yyvsp45 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp30 := yyvsp30 -1
	if yyvsp45 >= yyvsc45 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs45")
		end
		yyvsc45 := yyvsc45 + yyInitial_yyvs_size
		yyvs45 := yyspecial_routines45.aliased_resized_area (yyvs45, yyvsc45)
	end
	yyspecial_routines45.force (yyvs45, yyval45, yyvsp45)
end
when 314 then
--|#line 2462 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2462")
end

			create yyval51.make(0)
			yyval51.extend(yyvs45.item (yyvsp45 - 1))
			yyval51.extend(yyvs45.item (yyvsp45))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp51 := yyvsp51 + 1
	yyvsp45 := yyvsp45 -2
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
when 315 then
--|#line 2468 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2468")
end

			yyvs51.item (yyvsp51).extend(yyvs45.item (yyvsp45))
			yyval51 := yyvs51.item (yyvsp51)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp45 := yyvsp45 -1
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
when 316 then
--|#line 2473 "cadl_2_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_2_parser.y' at line 2473")
end

			create yyval51.make(0)
			yyval51.extend(yyvs45.item (yyvsp45))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp51 := yyvsp51 + 1
	yyvsp45 := yyvsp45 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp51 >= yyvsc51 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs51")
		end
		yyvsc51 := yyvsc51 + yyInitial_yyvs_size
		yyvs51 := yyspecial_routines51.aliased_resized_area (yyvs51, yyvsc51)
	end
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
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
			  123,  123,  123,  124,  163,  163,  163,  163,  129,  129,

			  125,  131,  131,  122,  122,  126,  130,  130,  130,  162,
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
			   23,   23,   24,   25,   21,    2,    3,    4,   21,   21,
			    3,    2,    3,    2,    1,    4,    4,    1,    1,    1,
			    4,    8,    4,    4,    1,   14,    1,    1,    1,    1,
			    1,    4,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    4,    4,    1,    1,    1,   21,    1,
			    1,    1,    1,    1,   21,    1,    4,   21,   21,    1,
			   21,    1,    4,    4,   32,   53,    1,    1,    1,    4,

			    4,    4,    4,    4,    4,    4,    4,    4,    1,    1,
			    1,    1,    5,    5,    4,    4,    4,   17,    2,    3,
			   26,   27,   28,   29,   30,   33,   34,   35,   36,   37,
			   38,   39,   40,   41,   42,   43,   44,   45,   46,   47,
			   48,   49,   50,   51,   52,   53,   54,   55,   56,   57,
			   58,   59,   60,    1,    1,    1,    4,    4,    1,   19,
			    1,    1,    1,    1,    1,    1,   21,    1,    1,    1,
			    1,    1,    1,    1,    1,    2,    3,   27,   28,   29,
			   30,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1, yyDummy>>,
			1, 200, 0)
		end

	yytypes1_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yytypes1'.
		do
			yyarray_subcopy (an_array, <<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    2,   12,    2,    4,    1,    1,   14,   14,    1,    1,
			    1,    1,    4,    1,    4,    4,    1,    4,    2,    3,
			   27,   28,   29,   30,    2,    3,   27,   28,   29,   30,
			    2,    3,   27,   28,   29,   30,    2,    3,   27,   28,
			   29,   30,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,   30,   45,    1,    2,    1,
			    1,    1,    3,    1,    1,    1,   26,    1,   27,    1,
			   28,    1,   29,    1,   30,    2,    3,   26,   27,   29,

			   28,   30,    1,    1,   40,    1,    1,   41,    1,    1,
			   42,    1,    1,   43,    1,    1,   44,    1,   45,   40,
			   41,   42,   43,   44,   45,    1,   26,    1,   28,    1,
			   30,    1,   27,    1,   29,    1,    3,    1,    2,    1,
			    1,    1,    1,    1,    1,   15,   15,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    1,    3,    1,   27,    1,   28,    1,   29,    1,   30,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1, yyDummy>>,
			1, 200, 200)
		end

	yytypes1_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yytypes1'.
		do
			yyarray_subcopy (an_array, <<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    2,    4,    1,    1,    1,
			    1,    1,    1,    1,    1,    4,    4,    1,    9,   10,
			   11,   16,   17,   17,   18,   18,   18,   20,   20,   60,
			    1,    1,    1,    2,    1,    3,    1,   27,    1,   28,
			    1,   29,    1,   30,    2,    1,    3,    1,   27,    1,
			   28,    1,   29,    1,   30,    1,    1,    2,   12,    1,
			    4,    4,    1,    4,    1,    4,    4,    4,    1,    1,
			   20,   14,    1,    1,   20,    2,    1,    3,    1,   27,
			    1,   28,    1,   29,    1,   30,    1,    1,    1,    1,

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
			   76,   83,   82,  103,    0,  106,  107,    0,    0,    0,
			  232,  214,  231,  213,    0,   90,   89,   92,    0,    0,
			  203,   73,    8,    7,    0,    6,    0,   95,   96,   94,
			   97,    0,  119,  115,  116,  118,  117,  113,  111,  114,
			  112,  110,  109,    0,    0,    0,   84,  104,    0,    0,
			    0,    0,  136,    0,   93,    0,  108,  105,  100,   77,
			   74,   91,  186,  184,  185,    0,  249,  248,    0,  183,

			  176,  153,  160,  167,  301,  285,  269,  253,  197,  195,
			  194,  196,  193,  192,  190,  191,  189,    0,  141,  147,
			    0,  154,  168,  161,  177,  142,  148,  200,  155,  162,
			  169,  178,  143,  149,  163,  156,  170,  179,  144,  150,
			  164,  157,  171,  180,   46,   44,   42,   43,   40,   41,
			   39,   38,    0,    0,    0,   47,  120,  120,   14,   53,
			    0,   12,   13,   48,   50,   51,    0,    0,    0,    0,
			   86,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,   87,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0, yyDummy>>,
			1, 200, 0)
		end

	yydefact_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yydefact'.
		do
			yyarray_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,   88,  138,    0,    0,
			  212,    0,  137,   61,    0,    0,  124,  124,    0,    4,
			   49,  211,  208,  210,  209,  207,  188,  187,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  226,    0,  244,    0,  265,    0,  297,
			    0,  281,    0,  313,    0,  175,  174,  217,  215,    0,
			    0,  235,  233,  252,  249,  248,  250,  256,  254,  288,
			  286,  272,  270,  304,  302,  216,  234,  251,  255,  271,

			  287,  303,  229,    0,  227,  247,    0,  245,  284,    0,
			  282,  268,    0,  266,  300,    0,  298,  316,  314,  228,
			  246,  283,  267,  299,  315,  202,  201,  173,  172,  182,
			  181,  159,  158,  166,  165,  152,  151,  146,  145,    0,
			  135,    0,    0,    0,    0,   56,   55,    0,  225,  243,
			  264,  296,  280,  312,  223,  241,  262,  294,  278,  310,
			    0,  224,    0,  242,    0,  263,    0,  295,    0,  279,
			    0,  311,  222,  240,  261,  293,  277,  309,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0, yyDummy>>,
			1, 200, 200)
		end

	yydefact_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yydefact'.
		do
			yyarray_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  140,  139,   62,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,  205,   19,   20,   21,
			    0,   15,   23,   16,  134,   30,   22,   57,   17,   45,
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
			   16,  536,  548,   17,  428,  429,   18,  430,  221,  468,
			  509,   55,  226,  345,  431,   20,   21,  432,  433,  434,
			  435,  436,  159,  437,  438,   22,   23,   24,   25,   26,
			   27,   28,   29,   30,   31,   32,   33,   34,   35,   36,
			  120,  121,  122,  123,  124,   37,  237,   94,  125,  126,
			  127,  128,  129,  130,  131,  132,  133,  134,  135,  136,
			  137,  138,  139,  140,  141,  142,  143,   73,   74,   61,
			  144,  145,  146,  147,  148,  149,  150,  151,  439,  564,
			  160,  161,  162,  163,  164,  165,  441,  224,  504,  505,
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
			    9,  125,  592,  590,  -19,  297, -32768, -32768,  814,  813,
			 -32768, -32768,  780, -32768, -32768, -32768,  183, -32768,  556, -32768,
			  422,  734,  523, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768,  382, -32768, -32768,  776,  332,  354,
			 -32768, -32768, -32768, -32768,  125, -32768, -32768, -32768,  827,  826,
			 -32768, -32768, -32768, -32768,    6, -32768,  778, -32768, -32768, -32768,
			 -32768,   28, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768,   41,   41,   81, -32768, -32768,  328,  182,
			  807,  777, -32768,   53, -32768,   41, -32768, -32768,  441, -32768,
			  523, -32768, -32768,  774,  773,  -31,  542,  476,  217, -32768,

			  709, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768,  751,  772,  771,
			  770,  769,  768,  767,  766,  765,  764,  763,  762,  758,
			  757,  756,  746,  745,  744,  743,  730,  729,  725,  724,
			  718,  705,  704,  703,  719,  716,  715,  713,  711,  707,
			  706,  702,  750,   46,  779, -32768,  740,  740, -32768,  731,
			  742, -32768,    3, -32768, -32768, -32768,  325,  146,  145,  163,
			 -32768,  198,  198,  198,  198,  449,  437,  433,  432,  424,
			  402,  410, -32768,   38,  233,  366,  238,  143,  141,   -3,
			  138,   97,  499,  627,  622,  623,  601,  350,  317,  315, yyDummy>>,
			1, 200, 0)
		end

	yypact_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			  311,  308,   -5,  739,  738,  728,  727,  726,  712,  209,
			   32,   45,  109,   26,  153,   23, -32768, -32768,  749,  747,
			  714,  710, -32768, -32768,  465,  669,  695,  695,  701, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  700,  699,
			  697,  696,  693,  692,  688,  687,  686,  685,  684,  683,
			  400,  398,  397,  385,  331,  313,  681,  680,  679,  678,
			  674,  662,  179, -32768,  186, -32768,   -8, -32768,  100, -32768,
			    0, -32768,   -7, -32768,  232, -32768, -32768, -32768, -32768,  698,
			  682, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,

			 -32768, -32768, -32768,  267, -32768, -32768,  302, -32768, -32768,  226,
			 -32768, -32768,  260, -32768, -32768,  207, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  155,
			 -32768,  666,  659,  663,  646, -32768, -32768,  608, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			  132, -32768,  165, -32768,  -11, -32768,   11, -32768,  -10, -32768,
			  -17, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  138,  643,
			   97,  642,  627,  636,  623,  634,  622,  632,  601,  631,
			  601,  601,  601,  601,  138,  138,  138,  138,   97,   97, yyDummy>>,
			1, 200, 200)
		end

	yypact_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			   97,   97,  622,  622,  622,  622,  627,  627,  627,  627,
			  623,  623,  623,  623, -32768, -32768, -32768,  633,  667,  628,
			  650,  649,  581,  533,   33,  648, -32768,  620, -32768, -32768,
			  741, -32768, -32768, -32768,  422,  613, -32768, -32768, -32768, -32768,
			 -32768,  675,  138,  617,   97,  616,  627,  614,  623,  612,
			  622,  607,  601,  606,  605, -32768,  595, -32768,  593, -32768,
			  578, -32768,  576, -32768,  575, -32768,  305,  568,  571,   46,
			 -32768, -32768, -32768,   10, -32768,  596,  339,  422, -32768, -32768,
			 -32768, -32768,  569, -32768, -32768,  565, -32768,  564, -32768,  563,
			 -32768,  560, -32768,  559, -32768,  539, -32768, -32768, -32768, -32768,

			 -32768, -32768, -32768,  549,  -30, -32768,  567, -32768,  458,  489,
			  422,  491,  452,  422, -32768,  393,  367, -32768, -32768, -32768,
			 -32768, -32768, -32768,  807,  399,  305, -32768, -32768,  453, -32768,
			  251, -32768, -32768, -32768,  364,  183,  291,  309,  241, -32768,
			 -32768,  237,  235,  178, -32768,  807,  183,  183,  203, -32768,
			  807,  173,  152,  115,  124,  183, -32768,   94, -32768, -32768,
			 -32768, -32768, -32768, -32768,   55,   37, -32768, yyDummy>>,
			1, 167, 400)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -125, -32768, -32768,  -16, -32768, -32768,  102, -32768,  406, -32768,
			 -32768, -430,  720,  651,  874, -32768, -32768,  -78, -32768, -32768,
			 -32768, -32768, -32768, -191, -32768,  213, -32768,  812,  732, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768,    2,  -79,  -75,
			  175,    7,  -25,  -29,  -59, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768,  347,  214,  330,  114,   68,
			  119, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768,  793, -32768, -32768, -32768, -32768, -32768, -32768,  791, -32768,
			 -32768,  522, -32768,  717, -32768, -32768, -32768, -32768, -32768,  278,
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
			   51,  118,  117,   39,  481,  119,   45,   82,  170,  526,
			   15,  157,   14,   13,   12,  104,   11,   10,  107,  175,
			  106,  107,  510,  176,  337,  104,   14,  333,  156,  104,
			  106,   14,   13,  327,    9,    8,  274,  566,  426,  180,
			   11,   14,  105,  511,   14,   13,  329,  515,  317,  220,
			  293,    7,    6,    9,  158,  565,  106,   54,  452,  525,
			   81,  157,  169,  105,  446,  450,   86,  382,  388,  179,
			    7,    6,   44,  178,  222,  386,   88,  104,  156,    5,
			  530,    4,   89,  533,   14,   13,  448,  166,    3,    2,
			  154,  277,  238,  244,  250,  256,  239,  245,  251,  257,

			    1,   13,  219,  218,  278,  177,    9,    3,    2,  282,
			  331,  295,  243,  249,  255,  261,  296,  219,  218,    1,
			    3,    2,  275,    7,    6,  219,  218,  217,   14,   13,
			  294,  105,   85,  563,  155,   14,  338,  301,  107,  336,
			  154,   14,  242,  248,  254,  260,  241,  247,  253,  259,
			    9,    5,  330,    4,  335,  234,  232,   13,   14,  292,
			    3,    2,  290,  562,  236,  299,  561,    7,    6,   13,
			  300,  106,    1,  235,  105,  384,  280,  279,  240,  246,
			  252,  258,   14,  379,  334,  328,   14,   13,   50,  381,
			   13,   10,   93,  288,  291,    5,  289,    4,  233,  231, yyDummy>>,
			1, 200, 0)
		end

	yytable_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  298,   14,   13,  560,    3,    2,   92,  442,    9,    8,
			  325,  219,  218,  389,   38,  180,    1,  219,  218,  332,
			   14,   13,  559,  558,  175,    7,    6,  107,  106,  105,
			  104,  176,  280,  279,  219,  218,  414,   13,  105,  480,
			  444,  387,  556,  385,  280,  279,  107,  106,  105,  104,
			  484,  285,  284,    5,  378,    4,  106,   78,  219,  218,
			  415,  380,    3,    2,  104,  280,  279,  107,  118,  316,
			   14,  553,  119,  383,    1,  323,  544,    3,    2,  550,
			  179,  443,  413,  412,  411,  410,  281,  445,   90,  107,
			  178,  287,  174,  173,  172,  171,    3,    2,   47,  454,

			  276,  405,  404,  403,  402,  456,   13,  393,  392,  391,
			  390,  453,  280,  279,  313,  238,  244,  250,  256,  177,
			  322,  318,   46,  239,  245,  251,  257,  324,  552,  464,
			  551,  243,  249,  255,  261,  409,  408,  407,  406,  451,
			  514,  449,  397,  396,  395,  394,  219,  218,  549,  315,
			  547,  118,  312,  513,  371,  119,  309,  462,  306,  460,
			  286,  314,  118,  485,  311,  370,  119,  297,  308,  487,
			  305,  447,  369,  242,  248,  254,  260,  401,  400,  399,
			  398,  280,  279,  368,  326,  241,  247,  253,  259,  458,
			  222,  303,  503,  495,   60,   59,   58,   57,   60,   59, yyDummy>>,
			1, 200, 200)
		end

	yytable_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			   58,   57,  545,  302,   66,   65,   64,   63,  285,  284,
			  546,   62,  307,  240,  246,  252,  258,   77,  320,  283,
			   91,  493,  555,  491,   76,  535,  367,   72,   71,   70,
			   69,   68,   67,   66,   65,   64,   63,  366,  365,  363,
			   62,  361,  104,  273,  118,  537,   77,  534,  119,  364,
			  362,  274,  360,  489,  272,   72,   71,   70,   69,   68,
			   67,   66,   65,   64,   63,  271,  118,  554,   62,   54,
			  119,  118,  557,  269,  267,  119,  270, -198,  265, -198,
			 -198, -198, -198, -198,  268,  266, -198,  539,  538,  264,
			  263, -198, -198, -198, -198, -198, -198, -198, -198, -198,

			 -198,  262,  543,  542,  541, -198, -198, -198, -198, -198,
			 -198, -198, -198, -198,  532, -198,  531, -198, -198, -198,
			   66,   65,   64,   63,  473,  475,  476,   62,  529,  310,
			   51, -198, -198, -198,  474,  321, -198, -198,  426,   51,
			   11,  285,  284, -199,  304, -199, -199, -199, -199, -199,
			  319,  528, -199,  342,  341, -198, -198, -199, -199, -199,
			 -199, -199, -199, -199, -199, -199, -199,   53,   52, -198,
			  527, -199, -199, -199, -199, -199, -199, -199, -199, -199,
			  522, -199,  472, -199, -199, -199,  426,  523,   11,   60,
			   59,   58,   57,   43,   42,   41,   40, -199, -199, -199, yyDummy>>,
			1, 200, 400)
		end

	yytable_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  521,  520, -199, -199,  519,  518,  517,  516,  512,  427,
			  507,   14,   13,  426,  425,   11,  502,  501,   93,  500,
			  506, -199, -199,  116,  115,  114,  113,  112,  111,  110,
			  109,  108,   92,  104,  499, -199,  498,  107,  106,  105,
			  104,  103,  102,  101,  100,   99,  497,  496,  494,   98,
			   97,   96,  106,  492,  105,  490,  107,  488,  486,  478,
			  477,  471,  470,  424,  423,  422,  469,  482,  421,  420,
			  467,  466,  465,  463,  416,  461,  479,  459,   14,   13,
			  426,  425,   11,  457,  455,   93,   42,    3,    2,  155,
			  116,  115,  114,  113,  112,  111,  110,  109,  108,   92,

			  419,  418,   40,  377,  107,  106,  105,  104,  103,  102,
			  101,  100,   99,  417,  483,  376,   98,   97,   96,  375,
			  374,  373,  372,  343,  359,  358,  357,  356,  355,  354,
			  424,  423,  422,  353,  352,  421,  420,  351,  350,  347,
			  349,  348,  479,  344,   14,   13,  426,  425,   11,  340,
			   43,   93,   41,  274,    3,    2,  116,  115,  114,  113,
			  112,  111,  110,  109,  108,   92,  339,  315,  312,  309,
			  107,  106,  105,  104,  103,  102,  101,  100,   99,  306,
			  303,  229,   98,   97,   96,  228,  225,  223,   56,  216,
			  182,  181,  208,  207,  206,  215,  424,  423,  422,  214, yyDummy>>,
			1, 200, 600)
		end

	yytable_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  213,  421,  420,  540,  212,   87,  211,  205,  210,  169,
			   14,   13,  209,  204,  203,  153,   83,   93,  202,  201,
			    3,    2,  116,  115,  114,  113,  112,  111,  110,  109,
			  108,   92,  200,  199,  198,  197,  107,  106,  105,  104,
			  103,  102,  101,  100,   99,  196,  195,  194,   98,   97,
			   96,  193,  192,  191,  190,  189,  188,  187,  186,  185,
			  184,  183,  168,  167,   80,   79,   75,   49,   48,  440,
			 -203,  152,   95,   84,   19,  508,    0,  227,  346,  230,
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
			   16,   80,   80,    1,  434,   80,   25,    1,   39,   39,
			    1,    8,    3,    4,    5,   32,    7,    8,   29,   98,
			   30,   29,   12,   98,    1,   32,    3,    1,   25,   32,
			   30,    3,    4,    1,   25,   26,   41,    0,    5,   98,
			    7,    3,   31,  473,    3,    4,    1,  477,   53,    3,
			   53,   42,   43,   25,    1,    0,   30,   47,   75,   89,
			   54,    8,   93,   31,   75,   75,   25,   75,   75,   98,
			   42,   43,   91,   98,  153,   75,   74,   32,   25,   70,
			  510,   72,    1,  513,    3,    4,   75,   85,   79,   80,
			   87,   53,  171,  172,  173,  174,  171,  172,  173,  174,

			   91,    4,   79,   80,  183,   98,   25,   79,   80,  184,
			    1,  190,  171,  172,  173,  174,  191,   79,   80,   91,
			   79,   80,  181,   42,   43,   79,   80,   81,    3,    4,
			  189,   31,   91,   39,   81,    3,  215,  196,   29,  214,
			   87,    3,  171,  172,  173,  174,  171,  172,  173,  174,
			   25,   70,  211,   72,    1,   10,   10,    4,    3,  188,
			   79,   80,  187,   39,    1,  194,   51,   42,   43,    4,
			  195,   30,   91,   10,   31,   75,   79,   80,  171,  172,
			  173,  174,    3,  262,  213,  210,    3,    4,    5,  264,
			    4,    8,   10,  186,   53,   70,   53,   72,   53,   53, yyDummy>>,
			1, 200, 0)
		end

	yycheck_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			  193,    3,    4,   51,   79,   80,   24,   75,   25,   26,
			    1,   79,   80,  272,    1,  274,   91,   79,   80,  212,
			    3,    4,   49,   50,  303,   42,   43,   29,   30,   31,
			   32,  306,   79,   80,   79,   80,   81,    4,   31,  430,
			   75,  270,   39,  268,   79,   80,   29,   30,   31,   32,
			  441,   42,   43,   70,   75,   72,   30,   44,   79,   80,
			  339,   75,   79,   80,   32,   79,   80,   29,  347,  201,
			    3,   93,  347,  266,   91,  207,   25,   79,   80,   38,
			  309,  360,   75,   76,   77,   78,   53,  362,   75,   29,
			  315,   53,   75,   76,   77,   78,   79,   80,    1,  378,

			  181,   75,   76,   77,   78,  380,    4,   75,   76,   77,
			   78,  370,   79,   80,  200,  394,  395,  396,  397,  312,
			  206,  202,   25,  398,  399,  400,  401,  208,   93,  388,
			   93,  390,  391,  392,  393,   75,   76,   77,   78,  368,
			    1,  366,   75,   76,   77,   78,   79,   80,   39,   41,
			   59,  430,   41,   14,   41,  430,   41,  386,   41,  384,
			  185,   53,  441,  442,   53,   52,  441,  192,   53,  444,
			   53,  364,   41,  402,  403,  404,  405,   75,   76,   77,
			   78,   79,   80,   52,  209,  410,  411,  412,  413,  382,
			  469,   41,   87,  452,   66,   67,   68,   69,   66,   67, yyDummy>>,
			1, 200, 200)
		end

	yycheck_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   68,   69,   38,   53,   79,   80,   81,   82,   42,   43,
			  535,   86,  198,  406,  407,  408,  409,   92,  204,   53,
			   92,  450,  547,  448,   92,   58,   41,   73,   74,   75,
			   76,   77,   78,   79,   80,   81,   82,   52,   41,   41,
			   86,   41,   32,   41,  523,  523,   92,   54,  523,   52,
			   52,   41,   52,  446,   52,   73,   74,   75,   76,   77,
			   78,   79,   80,   81,   82,   41,  545,  545,   86,   47,
			  545,  550,  550,   41,   41,  550,   52,    1,   41,    3,
			    4,    5,    6,    7,   52,   52,   10,   88,   89,   52,
			   41,   15,   16,   17,   18,   19,   20,   21,   22,   23,

			   24,   52,   49,   50,   51,   29,   30,   31,   32,   33,
			   34,   35,   36,   37,   62,   39,   25,   41,   42,   43,
			   79,   80,   81,   82,  422,  423,  424,   86,   39,  199,
			  546,   55,   56,   57,    1,  205,   60,   61,    5,  555,
			    7,   42,   43,    1,  197,    3,    4,    5,    6,    7,
			  203,   93,   10,   88,   89,   79,   80,   15,   16,   17,
			   18,   19,   20,   21,   22,   23,   24,   11,   12,   93,
			    3,   29,   30,   31,   32,   33,   34,   35,   36,   37,
			   41,   39,    1,   41,   42,   43,    5,   38,    7,   66,
			   67,   68,   69,    3,    4,    3,    4,   55,   56,   57, yyDummy>>,
			1, 200, 400)
		end

	yycheck_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   41,   41,   60,   61,   41,   41,   41,   38,   12,    1,
			   39,    3,    4,    5,    6,    7,   41,   41,   10,   41,
			   52,   79,   80,   15,   16,   17,   18,   19,   20,   21,
			   22,   23,   24,   32,   41,   93,   41,   29,   30,   31,
			   32,   33,   34,   35,   36,   37,   41,   41,   41,   41,
			   42,   43,   30,   41,   31,   41,   29,   41,   41,   39,
			   12,   12,   12,   55,   56,   57,   38,   54,   60,   61,
			    3,   38,   41,   41,    8,   41,    1,   41,    3,    4,
			    5,    6,    7,   41,   41,   10,    4,   79,   80,   81,
			   15,   16,   17,   18,   19,   20,   21,   22,   23,   24,

			   54,   38,    4,   41,   29,   30,   31,   32,   33,   34,
			   35,   36,   37,   54,   39,   41,   41,   42,   43,   41,
			   41,   41,   41,   54,   41,   41,   41,   41,   41,   41,
			   55,   56,   57,   41,   41,   60,   61,   41,   41,   38,
			   41,   41,    1,   48,    3,    4,    5,    6,    7,   39,
			    3,   10,    3,   41,   79,   80,   15,   16,   17,   18,
			   19,   20,   21,   22,   23,   24,   52,   41,   41,   41,
			   29,   30,   31,   32,   33,   34,   35,   36,   37,   41,
			   41,   39,   41,   42,   43,   54,   46,    8,   54,   39,
			   39,   82,   89,   89,   89,   93,   55,   56,   57,   93, yyDummy>>,
			1, 200, 600)
		end

	yycheck_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   93,   60,   61,  525,   93,   73,   93,   89,   93,   93,
			    3,    4,   93,   89,   89,   38,   38,   10,   89,   89,
			   79,   80,   15,   16,   17,   18,   19,   20,   21,   22,
			   23,   24,   89,   89,   89,   89,   29,   30,   31,   32,
			   33,   34,   35,   36,   37,   89,   89,   89,   41,   42,
			   43,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   38,   38,   90,   54,   54,  347,
			   90,   80,   79,   61,    0,  469,   -1,  157,  227,  162,
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

	yyvs21: SPECIAL [EXPRESSION]
			-- Stack for semantic values of type EXPRESSION

	yyvsc21: INTEGER
			-- Capacity of semantic value stack `yyvs21'

	yyvsp21: INTEGER
			-- Top of semantic value stack `yyvs21'

	yyspecial_routines21: KL_SPECIAL_ROUTINES [EXPRESSION]
			-- Routines that ought to be in SPECIAL [EXPRESSION]

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

	yyvs24: SPECIAL [EXPR_LITERAL]
			-- Stack for semantic values of type EXPR_LITERAL

	yyvsc24: INTEGER
			-- Capacity of semantic value stack `yyvs24'

	yyvsp24: INTEGER
			-- Top of semantic value stack `yyvs24'

	yyspecial_routines24: KL_SPECIAL_ROUTINES [EXPR_LITERAL]
			-- Routines that ought to be in SPECIAL [EXPR_LITERAL]

	yyvs25: SPECIAL [EXPR_LEAF]
			-- Stack for semantic values of type EXPR_LEAF

	yyvsc25: INTEGER
			-- Capacity of semantic value stack `yyvs25'

	yyvsp25: INTEGER
			-- Top of semantic value stack `yyvs25'

	yyspecial_routines25: KL_SPECIAL_ROUTINES [EXPR_LEAF]
			-- Routines that ought to be in SPECIAL [EXPR_LEAF]

	yyvs26: SPECIAL [BOOLEAN]
			-- Stack for semantic values of type BOOLEAN

	yyvsc26: INTEGER
			-- Capacity of semantic value stack `yyvs26'

	yyvsp26: INTEGER
			-- Top of semantic value stack `yyvs26'

	yyspecial_routines26: KL_SPECIAL_ROUTINES [BOOLEAN]
			-- Routines that ought to be in SPECIAL [BOOLEAN]

	yyvs27: SPECIAL [ISO8601_DATE]
			-- Stack for semantic values of type ISO8601_DATE

	yyvsc27: INTEGER
			-- Capacity of semantic value stack `yyvs27'

	yyvsp27: INTEGER
			-- Top of semantic value stack `yyvs27'

	yyspecial_routines27: KL_SPECIAL_ROUTINES [ISO8601_DATE]
			-- Routines that ought to be in SPECIAL [ISO8601_DATE]

	yyvs28: SPECIAL [ISO8601_DATE_TIME]
			-- Stack for semantic values of type ISO8601_DATE_TIME

	yyvsc28: INTEGER
			-- Capacity of semantic value stack `yyvs28'

	yyvsp28: INTEGER
			-- Top of semantic value stack `yyvs28'

	yyspecial_routines28: KL_SPECIAL_ROUTINES [ISO8601_DATE_TIME]
			-- Routines that ought to be in SPECIAL [ISO8601_DATE_TIME]

	yyvs29: SPECIAL [ISO8601_TIME]
			-- Stack for semantic values of type ISO8601_TIME

	yyvsc29: INTEGER
			-- Capacity of semantic value stack `yyvs29'

	yyvsp29: INTEGER
			-- Top of semantic value stack `yyvs29'

	yyspecial_routines29: KL_SPECIAL_ROUTINES [ISO8601_TIME]
			-- Routines that ought to be in SPECIAL [ISO8601_TIME]

	yyvs30: SPECIAL [ISO8601_DURATION]
			-- Stack for semantic values of type ISO8601_DURATION

	yyvsc30: INTEGER
			-- Capacity of semantic value stack `yyvs30'

	yyvsp30: INTEGER
			-- Top of semantic value stack `yyvs30'

	yyspecial_routines30: KL_SPECIAL_ROUTINES [ISO8601_DURATION]
			-- Routines that ought to be in SPECIAL [ISO8601_DURATION]

	yyvs31: SPECIAL [URI]
			-- Stack for semantic values of type URI

	yyvsc31: INTEGER
			-- Capacity of semantic value stack `yyvs31'

	yyvsp31: INTEGER
			-- Top of semantic value stack `yyvs31'

	yyspecial_routines31: KL_SPECIAL_ROUTINES [URI]
			-- Routines that ought to be in SPECIAL [URI]

	yyvs32: SPECIAL [ARRAYED_LIST [STRING]]
			-- Stack for semantic values of type ARRAYED_LIST [STRING]

	yyvsc32: INTEGER
			-- Capacity of semantic value stack `yyvs32'

	yyvsp32: INTEGER
			-- Top of semantic value stack `yyvs32'

	yyspecial_routines32: KL_SPECIAL_ROUTINES [ARRAYED_LIST [STRING]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [STRING]]

	yyvs33: SPECIAL [ARRAYED_LIST [INTEGER]]
			-- Stack for semantic values of type ARRAYED_LIST [INTEGER]

	yyvsc33: INTEGER
			-- Capacity of semantic value stack `yyvs33'

	yyvsp33: INTEGER
			-- Top of semantic value stack `yyvs33'

	yyspecial_routines33: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTEGER]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTEGER]]

	yyvs34: SPECIAL [ARRAYED_LIST [REAL]]
			-- Stack for semantic values of type ARRAYED_LIST [REAL]

	yyvsc34: INTEGER
			-- Capacity of semantic value stack `yyvs34'

	yyvsp34: INTEGER
			-- Top of semantic value stack `yyvs34'

	yyspecial_routines34: KL_SPECIAL_ROUTINES [ARRAYED_LIST [REAL]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [REAL]]

	yyvs35: SPECIAL [ARRAYED_LIST [BOOLEAN]]
			-- Stack for semantic values of type ARRAYED_LIST [BOOLEAN]

	yyvsc35: INTEGER
			-- Capacity of semantic value stack `yyvs35'

	yyvsp35: INTEGER
			-- Top of semantic value stack `yyvs35'

	yyspecial_routines35: KL_SPECIAL_ROUTINES [ARRAYED_LIST [BOOLEAN]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [BOOLEAN]]

	yyvs36: SPECIAL [ARRAYED_LIST [ISO8601_DATE]]
			-- Stack for semantic values of type ARRAYED_LIST [ISO8601_DATE]

	yyvsc36: INTEGER
			-- Capacity of semantic value stack `yyvs36'

	yyvsp36: INTEGER
			-- Top of semantic value stack `yyvs36'

	yyspecial_routines36: KL_SPECIAL_ROUTINES [ARRAYED_LIST [ISO8601_DATE]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ISO8601_DATE]]

	yyvs37: SPECIAL [ARRAYED_LIST [ISO8601_TIME]]
			-- Stack for semantic values of type ARRAYED_LIST [ISO8601_TIME]

	yyvsc37: INTEGER
			-- Capacity of semantic value stack `yyvs37'

	yyvsp37: INTEGER
			-- Top of semantic value stack `yyvs37'

	yyspecial_routines37: KL_SPECIAL_ROUTINES [ARRAYED_LIST [ISO8601_TIME]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ISO8601_TIME]]

	yyvs38: SPECIAL [ARRAYED_LIST [ISO8601_DATE_TIME]]
			-- Stack for semantic values of type ARRAYED_LIST [ISO8601_DATE_TIME]

	yyvsc38: INTEGER
			-- Capacity of semantic value stack `yyvs38'

	yyvsp38: INTEGER
			-- Top of semantic value stack `yyvs38'

	yyspecial_routines38: KL_SPECIAL_ROUTINES [ARRAYED_LIST [ISO8601_DATE_TIME]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ISO8601_DATE_TIME]]

	yyvs39: SPECIAL [ARRAYED_LIST [ISO8601_DURATION]]
			-- Stack for semantic values of type ARRAYED_LIST [ISO8601_DURATION]

	yyvsc39: INTEGER
			-- Capacity of semantic value stack `yyvs39'

	yyvsp39: INTEGER
			-- Top of semantic value stack `yyvs39'

	yyspecial_routines39: KL_SPECIAL_ROUTINES [ARRAYED_LIST [ISO8601_DURATION]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ISO8601_DURATION]]

	yyvs40: SPECIAL [INTERVAL [INTEGER]]
			-- Stack for semantic values of type INTERVAL [INTEGER]

	yyvsc40: INTEGER
			-- Capacity of semantic value stack `yyvs40'

	yyvsp40: INTEGER
			-- Top of semantic value stack `yyvs40'

	yyspecial_routines40: KL_SPECIAL_ROUTINES [INTERVAL [INTEGER]]
			-- Routines that ought to be in SPECIAL [INTERVAL [INTEGER]]

	yyvs41: SPECIAL [INTERVAL [REAL]]
			-- Stack for semantic values of type INTERVAL [REAL]

	yyvsc41: INTEGER
			-- Capacity of semantic value stack `yyvs41'

	yyvsp41: INTEGER
			-- Top of semantic value stack `yyvs41'

	yyspecial_routines41: KL_SPECIAL_ROUTINES [INTERVAL [REAL]]
			-- Routines that ought to be in SPECIAL [INTERVAL [REAL]]

	yyvs42: SPECIAL [INTERVAL [ISO8601_TIME]]
			-- Stack for semantic values of type INTERVAL [ISO8601_TIME]

	yyvsc42: INTEGER
			-- Capacity of semantic value stack `yyvs42'

	yyvsp42: INTEGER
			-- Top of semantic value stack `yyvs42'

	yyspecial_routines42: KL_SPECIAL_ROUTINES [INTERVAL [ISO8601_TIME]]
			-- Routines that ought to be in SPECIAL [INTERVAL [ISO8601_TIME]]

	yyvs43: SPECIAL [INTERVAL [ISO8601_DATE]]
			-- Stack for semantic values of type INTERVAL [ISO8601_DATE]

	yyvsc43: INTEGER
			-- Capacity of semantic value stack `yyvs43'

	yyvsp43: INTEGER
			-- Top of semantic value stack `yyvs43'

	yyspecial_routines43: KL_SPECIAL_ROUTINES [INTERVAL [ISO8601_DATE]]
			-- Routines that ought to be in SPECIAL [INTERVAL [ISO8601_DATE]]

	yyvs44: SPECIAL [INTERVAL [ISO8601_DATE_TIME]]
			-- Stack for semantic values of type INTERVAL [ISO8601_DATE_TIME]

	yyvsc44: INTEGER
			-- Capacity of semantic value stack `yyvs44'

	yyvsp44: INTEGER
			-- Top of semantic value stack `yyvs44'

	yyspecial_routines44: KL_SPECIAL_ROUTINES [INTERVAL [ISO8601_DATE_TIME]]
			-- Routines that ought to be in SPECIAL [INTERVAL [ISO8601_DATE_TIME]]

	yyvs45: SPECIAL [INTERVAL [ISO8601_DURATION]]
			-- Stack for semantic values of type INTERVAL [ISO8601_DURATION]

	yyvsc45: INTEGER
			-- Capacity of semantic value stack `yyvs45'

	yyvsp45: INTEGER
			-- Top of semantic value stack `yyvs45'

	yyspecial_routines45: KL_SPECIAL_ROUTINES [INTERVAL [ISO8601_DURATION]]
			-- Routines that ought to be in SPECIAL [INTERVAL [ISO8601_DURATION]]

	yyvs46: SPECIAL [ARRAYED_LIST [INTERVAL [INTEGER]]]
			-- Stack for semantic values of type ARRAYED_LIST [INTERVAL [INTEGER]]

	yyvsc46: INTEGER
			-- Capacity of semantic value stack `yyvs46'

	yyvsp46: INTEGER
			-- Top of semantic value stack `yyvs46'

	yyspecial_routines46: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTERVAL [INTEGER]]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTERVAL [INTEGER]]]

	yyvs47: SPECIAL [ARRAYED_LIST [INTERVAL [REAL]]]
			-- Stack for semantic values of type ARRAYED_LIST [INTERVAL [REAL]]

	yyvsc47: INTEGER
			-- Capacity of semantic value stack `yyvs47'

	yyvsp47: INTEGER
			-- Top of semantic value stack `yyvs47'

	yyspecial_routines47: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTERVAL [REAL]]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTERVAL [REAL]]]

	yyvs48: SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_TIME]]]
			-- Stack for semantic values of type ARRAYED_LIST [INTERVAL [ISO8601_TIME]]

	yyvsc48: INTEGER
			-- Capacity of semantic value stack `yyvs48'

	yyvsp48: INTEGER
			-- Top of semantic value stack `yyvs48'

	yyspecial_routines48: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTERVAL [ISO8601_TIME]]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_TIME]]]

	yyvs49: SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_DATE]]]
			-- Stack for semantic values of type ARRAYED_LIST [INTERVAL [ISO8601_DATE]]

	yyvsc49: INTEGER
			-- Capacity of semantic value stack `yyvs49'

	yyvsp49: INTEGER
			-- Top of semantic value stack `yyvs49'

	yyspecial_routines49: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTERVAL [ISO8601_DATE]]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_DATE]]]

	yyvs50: SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_DATE_TIME]]]
			-- Stack for semantic values of type ARRAYED_LIST [INTERVAL [ISO8601_DATE_TIME]]

	yyvsc50: INTEGER
			-- Capacity of semantic value stack `yyvs50'

	yyvsp50: INTEGER
			-- Top of semantic value stack `yyvs50'

	yyspecial_routines50: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTERVAL [ISO8601_DATE_TIME]]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_DATE_TIME]]]

	yyvs51: SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_DURATION]]]
			-- Stack for semantic values of type ARRAYED_LIST [INTERVAL [ISO8601_DURATION]]

	yyvsc51: INTEGER
			-- Capacity of semantic value stack `yyvs51'

	yyvsp51: INTEGER
			-- Top of semantic value stack `yyvs51'

	yyspecial_routines51: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTERVAL [ISO8601_DURATION]]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_DURATION]]]

	yyvs52: SPECIAL [C_BOOLEAN]
			-- Stack for semantic values of type C_BOOLEAN

	yyvsc52: INTEGER
			-- Capacity of semantic value stack `yyvs52'

	yyvsp52: INTEGER
			-- Top of semantic value stack `yyvs52'

	yyspecial_routines52: KL_SPECIAL_ROUTINES [C_BOOLEAN]
			-- Routines that ought to be in SPECIAL [C_BOOLEAN]

	yyvs53: SPECIAL [C_STRING]
			-- Stack for semantic values of type C_STRING

	yyvsc53: INTEGER
			-- Capacity of semantic value stack `yyvs53'

	yyvsp53: INTEGER
			-- Top of semantic value stack `yyvs53'

	yyspecial_routines53: KL_SPECIAL_ROUTINES [C_STRING]
			-- Routines that ought to be in SPECIAL [C_STRING]

	yyvs54: SPECIAL [C_DATE_TIME]
			-- Stack for semantic values of type C_DATE_TIME

	yyvsc54: INTEGER
			-- Capacity of semantic value stack `yyvs54'

	yyvsp54: INTEGER
			-- Top of semantic value stack `yyvs54'

	yyspecial_routines54: KL_SPECIAL_ROUTINES [C_DATE_TIME]
			-- Routines that ought to be in SPECIAL [C_DATE_TIME]

	yyvs55: SPECIAL [C_DURATION]
			-- Stack for semantic values of type C_DURATION

	yyvsc55: INTEGER
			-- Capacity of semantic value stack `yyvs55'

	yyvsp55: INTEGER
			-- Top of semantic value stack `yyvs55'

	yyspecial_routines55: KL_SPECIAL_ROUTINES [C_DURATION]
			-- Routines that ought to be in SPECIAL [C_DURATION]

	yyvs56: SPECIAL [C_DATE]
			-- Stack for semantic values of type C_DATE

	yyvsc56: INTEGER
			-- Capacity of semantic value stack `yyvs56'

	yyvsp56: INTEGER
			-- Top of semantic value stack `yyvs56'

	yyspecial_routines56: KL_SPECIAL_ROUTINES [C_DATE]
			-- Routines that ought to be in SPECIAL [C_DATE]

	yyvs57: SPECIAL [C_TIME]
			-- Stack for semantic values of type C_TIME

	yyvsc57: INTEGER
			-- Capacity of semantic value stack `yyvs57'

	yyvsp57: INTEGER
			-- Top of semantic value stack `yyvs57'

	yyspecial_routines57: KL_SPECIAL_ROUTINES [C_TIME]
			-- Routines that ought to be in SPECIAL [C_TIME]

	yyvs58: SPECIAL [C_REAL]
			-- Stack for semantic values of type C_REAL

	yyvsc58: INTEGER
			-- Capacity of semantic value stack `yyvs58'

	yyvsp58: INTEGER
			-- Top of semantic value stack `yyvs58'

	yyspecial_routines58: KL_SPECIAL_ROUTINES [C_REAL]
			-- Routines that ought to be in SPECIAL [C_REAL]

	yyvs59: SPECIAL [C_INTEGER]
			-- Stack for semantic values of type C_INTEGER

	yyvsc59: INTEGER
			-- Capacity of semantic value stack `yyvs59'

	yyvsp59: INTEGER
			-- Top of semantic value stack `yyvs59'

	yyspecial_routines59: KL_SPECIAL_ROUTINES [C_INTEGER]
			-- Routines that ought to be in SPECIAL [C_INTEGER]

	yyvs60: SPECIAL [C_TERMINOLOGY_CODE]
			-- Stack for semantic values of type C_TERMINOLOGY_CODE

	yyvsc60: INTEGER
			-- Capacity of semantic value stack `yyvs60'

	yyvsp60: INTEGER
			-- Top of semantic value stack `yyvs60'

	yyspecial_routines60: KL_SPECIAL_ROUTINES [C_TERMINOLOGY_CODE]
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
			if aom_profiles_access.has_profile_for_rm_schema (ref_model.model_id) then
				aom_profile := aom_profiles_access.profile_for_rm_schema (ref_model.model_id)
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
				err_code := {ADL_MESSAGES_IDS}.ec_VCOSU
			elseif an_attr.is_single then
				if attached an_obj.occurrences as att_occ and then (att_occ.upper_unbounded or att_occ.upper > 1) then
					err_code := {ADL_MESSAGES_IDS}.ec_VACSO
				else
					Result := True
				end
			elseif an_attr.is_multiple then
				if attached an_attr.cardinality as att_card and then not att_card.interval.upper_unbounded and then
						attached an_obj.occurrences as att_occ and then not att_occ.upper_unbounded and then
						att_occ.upper > att_card.interval.upper 
				then
					err_code := {ADL_MESSAGES_IDS}.ec_VACMCU
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

	rm_prop_def: detachable BMM_PROPERTY

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

	bmm_enum: BMM_ENUMERATION
		attribute
			create {BMM_ENUMERATION_INTEGER} Result.make ("XX", void, False)
		end

end
