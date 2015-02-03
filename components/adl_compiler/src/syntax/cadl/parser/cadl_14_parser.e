note
	component:   "openEHR ADL Tools"
	description: "Validating parser for Archetype Description Language (ADL)"
	keywords:	 "ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class CADL_14_PARSER

inherit
	PARSER_VALIDATOR
		rename
			reset as validator_reset,
			make as make_parser_skeleton
		end

	CADL_14_SCANNER
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
			when 7 then
				yyvsp7 := yyvsp7 + 1
				if yyvsp7 >= yyvsc7 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs7")
					end
					yyvsc7 := yyvsc7 + yyInitial_yyvs_size
					yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
				end
				yyspecial_routines7.force (yyvs7, last_c_dv_quantity_value, yyvsp7)
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
			yyval14: C_COMPLEX_OBJECT
			yyval11: SIBLING_ORDER
			yyval16: C_OBJECT
			yyval10: C_COMPLEX_OBJECT_PROXY
			yyval17: ARCHETYPE_SLOT
			yyval15: C_PRIMITIVE_OBJECT
			yyval18: C_ATTRIBUTE
			yyval8: detachable ARRAYED_LIST [ASSERTION]
			yyval9: ASSERTION
			yyval19: EXPR_ITEM
			yyval21: EXPR_BINARY_OPERATOR
			yyval20: EXPR_UNARY_OPERATOR
			yyval4: STRING
			yyval22: EXPR_LEAF
			yyval12: detachable MULTIPLICITY_INTERVAL
			yyval13: MULTIPLICITY_INTERVAL
			yyval48: detachable CARDINALITY
			yyval49: CARDINALITY
			yyval58: C_INTEGER
			yyval57: C_REAL
			yyval55: C_DATE
			yyval56: C_TIME
			yyval53: C_DATE_TIME
			yyval54: C_DURATION
			yyval52: C_STRING
			yyval59: C_TERMINOLOGY_CODE
			yyval51: C_BOOLEAN
			yyval50: ORDINAL
			yyval28: ARRAYED_LIST [STRING]
			yyval2: INTEGER
			yyval29: ARRAYED_LIST [INTEGER]
			yyval36: INTERVAL [INTEGER]
			yyval42: ARRAYED_LIST [INTERVAL [INTEGER]]
			yyval3: REAL
			yyval30: ARRAYED_LIST [REAL]
			yyval37: INTERVAL [REAL]
			yyval43: ARRAYED_LIST [INTERVAL [REAL]]
			yyval23: BOOLEAN
			yyval31: ARRAYED_LIST [BOOLEAN]
			yyval24: ISO8601_DATE
			yyval32: ARRAYED_LIST [ISO8601_DATE]
			yyval39: INTERVAL [ISO8601_DATE]
			yyval45: ARRAYED_LIST [INTERVAL [ISO8601_DATE]]
			yyval26: ISO8601_TIME
			yyval33: ARRAYED_LIST [ISO8601_TIME]
			yyval38: INTERVAL [ISO8601_TIME]
			yyval44: ARRAYED_LIST [INTERVAL [ISO8601_TIME]]
			yyval25: ISO8601_DATE_TIME
			yyval34: ARRAYED_LIST [ISO8601_DATE_TIME]
			yyval40: INTERVAL [ISO8601_DATE_TIME]
			yyval46: ARRAYED_LIST [INTERVAL [ISO8601_DATE_TIME]]
			yyval27: ISO8601_DURATION
			yyval35: ARRAYED_LIST [ISO8601_DURATION]
			yyval41: INTERVAL [ISO8601_DURATION]
			yyval47: ARRAYED_LIST [INTERVAL [ISO8601_DURATION]]
		do
			if not yy_retried then
				inspect yy_act
when 1 then
--|#line 193 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 193")
end

			debug ("ADL_parse")
				io.put_string ("CADL definition parsed%N")
			end
			output := yyvs14.item (yyvsp14)
			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp14 := yyvsp14 -1
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
--|#line 201 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 201")
end

			debug ("ADL_parse")
				io.put_string ("assertion definition parsed%N")
			end
			output := yyvs8.item (yyvsp8)
			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp8 := yyvsp8 -1
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
--|#line 209 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 209")
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
--|#line 218 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 218")
end

			debug ("ADL_parse")
				io.put_string (indent + "POP OBJECT_NODE " + yyvs14.item (yyvsp14).rm_type_name + " [id=" + yyvs14.item (yyvsp14).node_id + "]%N") 
				indent.remove_tail (1)
			end
			yyval14 := yyvs14.item (yyvsp14)
			object_nodes.remove
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 5 then
--|#line 229 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 229")
end

			yyval14 := yyvs14.item (yyvsp14)
			if attached yyvs12.item (yyvsp12) as att_occ then
				yyvs14.item (yyvsp14).set_occurrences (att_occ)
			end

			if rm_schema.has_class_definition (yyvs14.item (yyvsp14).rm_type_name) then
				object_nodes.extend (yyvs14.item (yyvsp14))
debug ("ADL_parse")
	io.put_string (indent + "PUSH create OBJECT_NODE " + yyvs14.item (yyvsp14).rm_type_name + " [id=" + yyvs14.item (yyvsp14).node_id + "] ")
	if yyvs12.item (yyvsp12) /= Void then
		io.put_string ("; occurrences=(" + yyvs12.item (yyvsp12).as_string + ")") 
	end
	io.new_line
	indent.append ("%T")
end
			else
				abort_with_error (ec_VCORM, <<yyvs14.item (yyvsp14).rm_type_name, yyvs14.item (yyvsp14).path>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp12 := yyvsp12 -1
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 6 then
--|#line 252 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 252")
end

			if object_nodes.is_empty then
				create yyval14.make (yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4))
			else
				abort_with_error (ec_VARND, <<yyvs4.item (yyvsp4), Id_code_regex_pattern>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp14 := yyvsp14 + 1
	yyvsp4 := yyvsp4 -2
	if yyvsp14 >= yyvsc14 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs14")
		end
		yyvsc14 := yyvsc14 + yyInitial_yyvs_size
		yyvs14 := yyspecial_routines14.aliased_resized_area (yyvs14, yyvsc14)
	end
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 7 then
--|#line 260 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 260")
end

			if not object_nodes.is_empty then
				create yyval14.make (yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4))
			else
				abort_with_error (ec_VARCN, <<yyvs4.item (yyvsp4), Root_id_code_regex_pattern>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp14 := yyvsp14 + 1
	yyvsp4 := yyvsp4 -2
	if yyvsp14 >= yyvsc14 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs14")
		end
		yyvsc14 := yyvsc14 + yyInitial_yyvs_size
		yyvs14 := yyspecial_routines14.aliased_resized_area (yyvs14, yyvsc14)
	end
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 8 then
--|#line 268 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 268")
end

			create yyval14.make (yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4))
			yyval14.set_sibling_order (yyvs11.item (yyvsp11))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp14 := yyvsp14 + 1
	yyvsp11 := yyvsp11 -1
	yyvsp4 := yyvsp4 -2
	if yyvsp14 >= yyvsc14 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs14")
		end
		yyvsc14 := yyvsc14 + yyInitial_yyvs_size
		yyvs14 := yyspecial_routines14.aliased_resized_area (yyvs14, yyvsc14)
	end
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 9 then
--|#line 276 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 276")
end

			if object_nodes.is_empty then
				abort_with_error (ec_VARCN, <<"(none)", Root_id_code_regex_pattern>>)
			else
				create yyval14.make (yyvs4.item (yyvsp4), new_fake_node_id)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp14 >= yyvsc14 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs14")
		end
		yyvsc14 := yyvsc14 + yyInitial_yyvs_size
		yyvs14 := yyspecial_routines14.aliased_resized_area (yyvs14, yyvsc14)
	end
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 10 then
--|#line 289 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 289")
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
--|#line 293 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 293")
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
--|#line 299 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 299")
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
--|#line 306 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 306")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 14 then
--|#line 309 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 309")
end

			abort_with_error (ec_SCOAT, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 15 then
--|#line 319 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 319")
end

			safe_put_c_attribute_child (yyvs16.item (yyvsp16))
		
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
when 16 then
--|#line 323 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 323")
end

			yyvs16.item (yyvsp16).set_sibling_order (yyvs11.item (yyvsp11))
			safe_put_c_attribute_child (yyvs16.item (yyvsp16))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 + 1
	yyvsp11 := yyvsp11 -1
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
when 17 then
--|#line 328 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 328")
end

			if attached {C_TERMINOLOGY_CODE} yyvs15.item (yyvsp15) as ctc and then ctc.constraint.is_equal (Missing_codes) then
				-- ignore
			else
				safe_put_c_attribute_child (yyvs15.item (yyvsp15))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp15 := yyvsp15 -1
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
--|#line 336 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 336")
end

			abort_with_error (ec_SCCOG, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 19 then
--|#line 342 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 342")
end

			yyval16 := yyvs14.item (yyvsp14)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp14 := yyvsp14 -1
	if yyvsp16 >= yyvsc16 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs16")
		end
		yyvsc16 := yyvsc16 + yyInitial_yyvs_size
		yyvs16 := yyspecial_routines16.aliased_resized_area (yyvs16, yyvsc16)
	end
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 20 then
--|#line 346 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 346")
end

			yyval16 := yyvs10.item (yyvsp10)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp10 := yyvsp10 -1
	if yyvsp16 >= yyvsc16 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs16")
		end
		yyvsc16 := yyvsc16 + yyInitial_yyvs_size
		yyvs16 := yyspecial_routines16.aliased_resized_area (yyvs16, yyvsc16)
	end
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 21 then
--|#line 350 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 350")
end

			yyval16 := yyvs17.item (yyvsp17)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp17 := yyvsp17 -1
	if yyvsp16 >= yyvsc16 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs16")
		end
		yyvsc16 := yyvsc16 + yyInitial_yyvs_size
		yyvs16 := yyspecial_routines16.aliased_resized_area (yyvs16, yyvsc16)
	end
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 22 then
--|#line 357 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 357")
end

			yyval16 := yyvs14.item (yyvsp14)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp14 := yyvsp14 -1
	if yyvsp16 >= yyvsc16 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs16")
		end
		yyvsc16 := yyvsc16 + yyInitial_yyvs_size
		yyvs16 := yyspecial_routines16.aliased_resized_area (yyvs16, yyvsc16)
	end
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 23 then
--|#line 361 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 361")
end

			if attached last_c_dv_quantity_value.property as att_prop then
				-- may already have been encountered in this archetype

				if target_descriptor.is_specialised and then attached flat_ancestor as flat_anc and then
					flat_anc.terminology.has_term_binding_for_external_code (att_prop.terminology_id, att_prop.code_string) 
				then
					c_dv_q_prop_code := flat_anc.terminology.term_binding_key_for_external_code (att_prop.terminology_id, att_prop.code_string)
				elseif attached compiler_billboard.binding_code_map.item (att_prop.code_string) as att_at_code then
					c_dv_q_prop_code := att_at_code
				else
					c_dv_q_prop_code := new_fake_at_code
				end
				last_c_dv_quantity_value.set_property (create {TERMINOLOGY_CODE}.make (Local_terminology_id, c_dv_q_prop_code))

				-- add term binding
				if not compiler_billboard.term_bindings.has (att_prop.terminology_id) then
					compiler_billboard.term_bindings.put (create {HASH_TABLE [URI, STRING]}.make (0), att_prop.terminology_id)
				end
				check attached compiler_billboard.term_bindings.item (att_prop.terminology_id) as att_bindings_for_terminology then
					str := uri_for_terminology_code (att_prop)
					att_bindings_for_terminology.put (create {URI}.make_from_string (str), c_dv_q_prop_code)
					compiler_billboard.binding_code_map.put (c_dv_q_prop_code, att_prop.code_string)
				end
			end
			yyval16 := last_c_dv_quantity_value.standard_equivalent (new_fake_node_id)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp7 := yyvsp7 -1
	if yyvsp16 >= yyvsc16 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs16")
		end
		yyvsc16 := yyvsc16 + yyInitial_yyvs_size
		yyvs16 := yyspecial_routines16.aliased_resized_area (yyvs16, yyvsc16)
	end
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 24 then
--|#line 389 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 389")
end

			abort_with_error (ec_SDINV, <<odin_parser_error.as_string>>)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp16 >= yyvsc16 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs16")
		end
		yyvsc16 := yyvsc16 + yyInitial_yyvs_size
		yyvs16 := yyspecial_routines16.aliased_resized_area (yyvs16, yyvsc16)
	end
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 25 then
--|#line 398 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 398")
end

			create yyval10.make (yyvs4.item (yyvsp4 - 2), yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4))
			if attached yyvs12.item (yyvsp12) as att_occ then
				yyval10.set_occurrences (att_occ)
			end

			debug ("ADL_parse")
				io.put_string (indent + "create C_COMPLEX_OBJECT_PROXY ")
				io.put_string (yyval10.rm_type_name) 
				io.put_string ("[" + yyval10.node_id + "] ")
				if yyval10.use_target_occurrences then
					io.put_string ("occurrences=(use target) ")
				elseif yyvs12.item (yyvsp12) /= Void then
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
	yyvsp12 := yyvsp12 -1
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
--|#line 418 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 418")
end

			create yyval10.make (yyvs4.item (yyvsp4 - 1), new_fake_node_id, yyvs4.item (yyvsp4))
			if attached yyvs12.item (yyvsp12) as att_occ then
				yyval10.set_occurrences (att_occ)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp10 := yyvsp10 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -2
	yyvsp12 := yyvsp12 -1
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
--|#line 425 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 425")
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
--|#line 431 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 431")
end

			if attached yyvs8.item (yyvsp8 - 1) as att_c_incs then
				yyvs17.item (yyvsp17).set_includes (att_c_incs)
			end
			if attached yyvs8.item (yyvsp8) as att_c_excs then
				yyvs17.item (yyvsp17).set_excludes (att_c_excs)
			end

			debug ("ADL_parse")
				indent.remove_tail (1)
			end
			yyval17 := yyvs17.item (yyvsp17)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp1 := yyvsp1 -3
	yyvsp8 := yyvsp8 -2
	yyspecial_routines17.force (yyvs17, yyval17, yyvsp17)
end
when 29 then
--|#line 445 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 445")
end

			yyval17 := yyvs17.item (yyvsp17)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines17.force (yyvs17, yyval17, yyvsp17)
end
when 30 then
--|#line 451 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 451")
end

			if attached yyvs12.item (yyvsp12) as att_occ then
				yyvs17.item (yyvsp17).set_occurrences (att_occ)
			end

			debug ("ADL_parse")
				io.put_string (indent + "create ARCHETYPE_SLOT " + yyvs17.item (yyvsp17).rm_type_name + " [id=" + yyvs17.item (yyvsp17).node_id + "]")
				if attached yyvs12.item (yyvsp12) then
					io.put_string ("; occurrences=(" + yyvs12.item (yyvsp12).as_string + ")") 
				end
				io.new_line
				indent.append ("%T")
			end
			yyval17 := yyvs17.item (yyvsp17)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp12 := yyvsp12 -1
	yyspecial_routines17.force (yyvs17, yyval17, yyvsp17)
end
when 31 then
--|#line 469 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 469")
end

			create yyval17.make (yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp17 := yyvsp17 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -2
	if yyvsp17 >= yyvsc17 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs17")
		end
		yyvsc17 := yyvsc17 + yyInitial_yyvs_size
		yyvs17 := yyspecial_routines17.aliased_resized_area (yyvs17, yyvsc17)
	end
	yyspecial_routines17.force (yyvs17, yyval17, yyvsp17)
end
when 32 then
--|#line 473 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 473")
end

			create yyval17.make (yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4))
			yyval17.set_closed
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp17 := yyvsp17 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp4 := yyvsp4 -2
	if yyvsp17 >= yyvsc17 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs17")
		end
		yyvsc17 := yyvsc17 + yyInitial_yyvs_size
		yyvs17 := yyspecial_routines17.aliased_resized_area (yyvs17, yyvsc17)
	end
	yyspecial_routines17.force (yyvs17, yyval17, yyvsp17)
end
when 33 then
--|#line 478 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 478")
end

			create yyval17.make (yyvs4.item (yyvsp4), new_fake_node_id)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp17 := yyvsp17 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	if yyvsp17 >= yyvsc17 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs17")
		end
		yyvsc17 := yyvsc17 + yyInitial_yyvs_size
		yyvs17 := yyspecial_routines17.aliased_resized_area (yyvs17, yyvsc17)
	end
	yyspecial_routines17.force (yyvs17, yyval17, yyvsp17)
end
when 34 then
--|#line 482 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 482")
end

			abort_with_error (ec_SUAS, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp17 := yyvsp17 + 1
	yyvsp1 := yyvsp1 -2
	if yyvsp17 >= yyvsc17 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs17")
		end
		yyvsc17 := yyvsc17 + yyInitial_yyvs_size
		yyvs17 := yyspecial_routines17.aliased_resized_area (yyvs17, yyvsc17)
	end
	yyspecial_routines17.force (yyvs17, yyval17, yyvsp17)
end
when 35 then
--|#line 488 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 488")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_INTEGER: " +  yyvs58.item (yyvsp58).as_string + "%N")
			end
			yyval15 := yyvs58.item (yyvsp58)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp15 := yyvsp15 + 1
	yyvsp58 := yyvsp58 -1
	if yyvsp15 >= yyvsc15 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs15")
		end
		yyvsc15 := yyvsc15 + yyInitial_yyvs_size
		yyvs15 := yyspecial_routines15.aliased_resized_area (yyvs15, yyvsc15)
	end
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 36 then
--|#line 495 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 495")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_REAL: " +  yyvs57.item (yyvsp57).as_string + "%N")
			end
			yyval15 := yyvs57.item (yyvsp57)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp15 := yyvsp15 + 1
	yyvsp57 := yyvsp57 -1
	if yyvsp15 >= yyvsc15 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs15")
		end
		yyvsc15 := yyvsc15 + yyInitial_yyvs_size
		yyvs15 := yyspecial_routines15.aliased_resized_area (yyvs15, yyvsc15)
	end
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 37 then
--|#line 502 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 502")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_DATE: " +  yyvs55.item (yyvsp55).as_string + "%N")
			end
			yyval15 := yyvs55.item (yyvsp55)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp15 := yyvsp15 + 1
	yyvsp55 := yyvsp55 -1
	if yyvsp15 >= yyvsc15 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs15")
		end
		yyvsc15 := yyvsc15 + yyInitial_yyvs_size
		yyvs15 := yyspecial_routines15.aliased_resized_area (yyvs15, yyvsc15)
	end
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 38 then
--|#line 509 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 509")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_TIME: " +  yyvs56.item (yyvsp56).as_string + "%N")
			end
			yyval15 := yyvs56.item (yyvsp56)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp15 := yyvsp15 + 1
	yyvsp56 := yyvsp56 -1
	if yyvsp15 >= yyvsc15 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs15")
		end
		yyvsc15 := yyvsc15 + yyInitial_yyvs_size
		yyvs15 := yyspecial_routines15.aliased_resized_area (yyvs15, yyvsc15)
	end
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 39 then
--|#line 516 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 516")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_DATE_TIME: " +  yyvs53.item (yyvsp53).as_string + "%N")
			end
			yyval15 := yyvs53.item (yyvsp53)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp15 := yyvsp15 + 1
	yyvsp53 := yyvsp53 -1
	if yyvsp15 >= yyvsc15 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs15")
		end
		yyvsc15 := yyvsc15 + yyInitial_yyvs_size
		yyvs15 := yyspecial_routines15.aliased_resized_area (yyvs15, yyvsc15)
	end
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 40 then
--|#line 523 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 523")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_DURATION: " +  yyvs54.item (yyvsp54).as_string + "%N")
			end
			yyval15 := yyvs54.item (yyvsp54)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp15 := yyvsp15 + 1
	yyvsp54 := yyvsp54 -1
	if yyvsp15 >= yyvsc15 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs15")
		end
		yyvsc15 := yyvsc15 + yyInitial_yyvs_size
		yyvs15 := yyspecial_routines15.aliased_resized_area (yyvs15, yyvsc15)
	end
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 41 then
--|#line 530 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 530")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_STRING: " +  yyvs52.item (yyvsp52).as_string + "%N")
			end
			yyval15 := yyvs52.item (yyvsp52)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp15 := yyvsp15 + 1
	yyvsp52 := yyvsp52 -1
	if yyvsp15 >= yyvsc15 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs15")
		end
		yyvsc15 := yyvsc15 + yyInitial_yyvs_size
		yyvs15 := yyspecial_routines15.aliased_resized_area (yyvs15, yyvsc15)
	end
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 42 then
--|#line 537 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 537")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_TERMINOLOGY_CODE: " +  yyvs59.item (yyvsp59).as_string + "%N")
			end
			yyval15 := yyvs59.item (yyvsp59)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp15 := yyvsp15 + 1
	yyvsp59 := yyvsp59 -1
	if yyvsp15 >= yyvsc15 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs15")
		end
		yyvsc15 := yyvsc15 + yyInitial_yyvs_size
		yyvs15 := yyspecial_routines15.aliased_resized_area (yyvs15, yyvsc15)
	end
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 43 then
--|#line 544 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 544")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_BOOLEAN: " +  yyvs51.item (yyvsp51).as_string + "%N")
			end
			yyval15 := yyvs51.item (yyvsp51)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp15 := yyvsp15 + 1
	yyvsp51 := yyvsp51 -1
	if yyvsp15 >= yyvsc15 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs15")
		end
		yyvsc15 := yyvsc15 + yyInitial_yyvs_size
		yyvs15 := yyspecial_routines15.aliased_resized_area (yyvs15, yyvsc15)
	end
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 44 then
--|#line 553 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 553")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 45 then
--|#line 560 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 560")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 46 then
--|#line 563 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 563")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 47 then
--|#line 568 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 568")
end

			debug ("ADL_parse")
				io.put_string (indent + "POP ATTR_NODE " + c_attrs.item.rm_attribute_name + "%N") 
				indent.remove_tail (1)
			end
			c_attrs.remove
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp18 := yyvsp18 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 48 then
--|#line 576 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 576")
end

			abort_with_error (ec_SCAS, Void)
		
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
when 49 then
--|#line 580 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 580")
end

			abort_with_error (ec_SCAS, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp18 := yyvsp18 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 50 then
--|#line 586 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 586")
end

			rm_attribute_name := yyvs4.item (yyvsp4)
			if not object_nodes.item.has_attribute (rm_attribute_name) then
				if rm_schema.has_property (object_nodes.item.rm_type_name, rm_attribute_name) then
					rm_prop_def := rm_schema.property_definition (object_nodes.item.rm_type_name, rm_attribute_name)
					if rm_prop_def.is_container then

						-- for ADL 1.4 archetypes, remove existence and cardinality if it is a duplicate of the RM constraint
						if attached yyvs12.item (yyvsp12) as ivl and then ivl.is_equal (rm_prop_def.existence) then
							add_warning (ec_WCAEX14, <<rm_attribute_name, object_nodes.item.path, ivl.as_string, rm_prop_def.existence.as_string>>)
							yyvs12.item (yyvsp12) := Void
						end
						if attached {BMM_CONTAINER_PROPERTY} rm_prop_def as rm_cont_prop_def and then
							attached yyvs48.item (yyvsp48) as ivl and then (ivl.interval.is_equal (rm_cont_prop_def.cardinality) or else
							ivl.interval.contains (rm_cont_prop_def.cardinality))
						then
							add_warning (ec_WCACA14, <<rm_attribute_name, object_nodes.item.path, ivl.interval.as_string, rm_cont_prop_def.cardinality.as_string>>)
							yyvs48.item (yyvsp48) := Void
						end

						-- make the node
						create yyval18.make_multiple (rm_attribute_name, yyvs12.item (yyvsp12), yyvs48.item (yyvsp48))
						c_attrs.put (yyval18)
debug ("ADL_parse")
	io.put_string (indent + "PUSH create ATTR_NODE " + rm_attribute_name + "; container = " + yyval18.is_multiple.out)
	if attached yyvs12.item (yyvsp12) as att_ex then io.put_string (" existence={" + att_ex.as_string + "}") end
	if attached yyvs48.item (yyvsp48) as att_card then io.put_string ("; cardinality=(" + att_card.as_string + ")") end
	io.new_line
	io.put_string (indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_attribute (REL)%N") 
	indent.append ("%T")
end
						object_nodes.item.put_attribute (yyval18)

					elseif not attached yyvs48.item (yyvsp48) then
						-- for ADL 1.4 archetypes, remove existence and cardinality if it is a duplicate of the RM constraint
						if attached yyvs12.item (yyvsp12) as ivl and then ivl.is_equal (rm_prop_def.existence) then
							add_warning (ec_WCAEX14, <<rm_attribute_name, object_nodes.item.path, ivl.as_string, rm_prop_def.existence.as_string>>)
							yyvs12.item (yyvsp12) := Void
						end

						-- make the node
						create yyval18.make_single (rm_attribute_name, yyvs12.item (yyvsp12))
						c_attrs.put (yyval18)
debug ("ADL_parse")
	io.put_string (indent + "PUSH create ATTR_NODE " + rm_attribute_name + "; container = " + yyval18.is_multiple.out) 
	if attached yyvs12.item (yyvsp12) as att_ex then io.put_string (" existence={" + att_ex.as_string + "}") end
	io.new_line
	io.put_string (indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_attribute (REL)%N") 
	indent.append ("%T")
end
						object_nodes.item.put_attribute (yyval18)
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
	yyvsp18 := yyvsp18 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp12 := yyvsp12 -1
	yyvsp48 := yyvsp48 -1
	if yyvsp18 >= yyvsc18 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs18")
		end
		yyvsc18 := yyvsc18 + yyInitial_yyvs_size
		yyvs18 := yyspecial_routines18.aliased_resized_area (yyvs18, yyvsc18)
	end
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
when 51 then
--|#line 650 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 650")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 52 then
--|#line 653 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 653")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 53 then
--|#line 656 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 656")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 54 then
--|#line 661 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 661")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp8 := yyvsp8 + 1
	if yyvsp8 >= yyvsc8 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs8")
		end
		yyvsc8 := yyvsc8 + yyInitial_yyvs_size
		yyvs8 := yyspecial_routines8.aliased_resized_area (yyvs8, yyvsc8)
	end
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 55 then
--|#line 662 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 662")
end

			debug ("include list")
				io.put_string (indent + "[---assertion expression---] %N")
			end
			yyval8 := yyvs8.item (yyvsp8)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 56 then
--|#line 671 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 671")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp8 := yyvsp8 + 1
	if yyvsp8 >= yyvsc8 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs8")
		end
		yyvsc8 := yyvsc8 + yyInitial_yyvs_size
		yyvs8 := yyspecial_routines8.aliased_resized_area (yyvs8, yyvsc8)
	end
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 57 then
--|#line 672 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 672")
end

			debug ("exclude list")
				io.put_string (indent + "[---assertion expression---] %N")
			end
			yyval8 := yyvs8.item (yyvsp8)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 58 then
--|#line 685 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 685")
end

			create yyval8.make (0)
			yyval8.extend (yyvs9.item (yyvsp9))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp8 := yyvsp8 + 1
	yyvsp9 := yyvsp9 -1
	if yyvsp8 >= yyvsc8 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs8")
		end
		yyvsc8 := yyvsc8 + yyInitial_yyvs_size
		yyvs8 := yyspecial_routines8.aliased_resized_area (yyvs8, yyvsc8)
	end
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 59 then
--|#line 690 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 690")
end

			yyvs8.item (yyvsp8).extend (yyvs9.item (yyvsp9))
			yyval8 := yyvs8.item (yyvsp8)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp9 := yyvsp9 -1
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 60 then
--|#line 697 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 697")
end

			create yyval9.make (yyvs19.item (yyvsp19), yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp9 := yyvsp9 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp9 >= yyvsc9 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs9")
		end
		yyvsc9 := yyvsc9 + yyInitial_yyvs_size
		yyvs9 := yyspecial_routines9.aliased_resized_area (yyvs9, yyvsc9)
	end
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
when 61 then
--|#line 701 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 701")
end

			create yyval9.make (yyvs19.item (yyvsp19), Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp9 := yyvsp9 + 1
	yyvsp19 := yyvsp19 -1
	if yyvsp9 >= yyvsc9 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs9")
		end
		yyvsc9 := yyvsc9 + yyInitial_yyvs_size
		yyvs9 := yyspecial_routines9.aliased_resized_area (yyvs9, yyvsc9)
	end
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
when 62 then
--|#line 709 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 709")
end

			create yyval9.make (yyvs21.item (yyvsp21), Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp9 := yyvsp9 + 1
	yyvsp21 := yyvsp21 -1
	if yyvsp9 >= yyvsc9 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs9")
		end
		yyvsc9 := yyvsc9 + yyInitial_yyvs_size
		yyvs9 := yyspecial_routines9.aliased_resized_area (yyvs9, yyvsc9)
	end
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
when 63 then
--|#line 713 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 713")
end

			abort_with_error (ec_SINVS, <<yyvs4.item (yyvsp4)>>)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp9 := yyvsp9 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp9 >= yyvsc9 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs9")
		end
		yyvsc9 := yyvsc9 + yyInitial_yyvs_size
		yyvs9 := yyspecial_routines9.aliased_resized_area (yyvs9, yyvsc9)
	end
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
when 64 then
--|#line 721 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 721")
end

			yyval19 := yyvs19.item (yyvsp19)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 65 then
--|#line 725 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 725")
end

			yyval19 := yyvs19.item (yyvsp19)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 66 then
--|#line 731 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 731")
end

			debug ("ADL_invariant")
				io.put_string (indent + "boolean_expr: REDUCE from boolean_unop_expr: [" + yyvs20.item (yyvsp20).as_string + "]%N") 
			end
			yyval19 := yyvs20.item (yyvsp20)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp19 := yyvsp19 + 1
	yyvsp20 := yyvsp20 -1
	if yyvsp19 >= yyvsc19 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs19")
		end
		yyvsc19 := yyvsc19 + yyInitial_yyvs_size
		yyvs19 := yyspecial_routines19.aliased_resized_area (yyvs19, yyvsc19)
	end
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 67 then
--|#line 738 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 738")
end

			yyval19 := yyvs21.item (yyvsp21)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp19 := yyvsp19 + 1
	yyvsp21 := yyvsp21 -1
	if yyvsp19 >= yyvsc19 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs19")
		end
		yyvsc19 := yyvsc19 + yyInitial_yyvs_size
		yyvs19 := yyspecial_routines19.aliased_resized_area (yyvs19, yyvsc19)
	end
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 68 then
--|#line 744 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 744")
end

			yyval19 := yyvs22.item (yyvsp22)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp19 := yyvsp19 + 1
	yyvsp22 := yyvsp22 -1
	if yyvsp19 >= yyvsc19 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs19")
		end
		yyvsc19 := yyvsc19 + yyInitial_yyvs_size
		yyvs19 := yyspecial_routines19.aliased_resized_area (yyvs19, yyvsc19)
	end
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 69 then
--|#line 748 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 748")
end

			debug ("ADL_invariant")
				io.put_string (indent + "boolean_leaf: REDUCE from boolean_constraint: [" + yyvs21.item (yyvsp21).as_string + "]%N") 
			end
			yyval19 := yyvs21.item (yyvsp21)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp19 := yyvsp19 + 1
	yyvsp21 := yyvsp21 -1
	if yyvsp19 >= yyvsc19 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs19")
		end
		yyvsc19 := yyvsc19 + yyInitial_yyvs_size
		yyvs19 := yyspecial_routines19.aliased_resized_area (yyvs19, yyvsc19)
	end
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 70 then
--|#line 755 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 755")
end

			yyval19 := yyvs19.item (yyvsp19)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 71 then
--|#line 759 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 759")
end

			yyval19 := yyvs21.item (yyvsp21)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp19 := yyvsp19 + 1
	yyvsp21 := yyvsp21 -1
	if yyvsp19 >= yyvsc19 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs19")
		end
		yyvsc19 := yyvsc19 + yyInitial_yyvs_size
		yyvs19 := yyspecial_routines19.aliased_resized_area (yyvs19, yyvsc19)
	end
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 72 then
--|#line 769 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 769")
end

			debug ("ADL_invariant")
				io.put_string (indent + "arch_outer_constraint_expr: Archetype outer feature " + yyvs4.item (yyvsp4) + " matches {" + yyvs15.item (yyvsp15).as_string + "}%N") 
			end
			create yyval21.make (create {OPERATOR_KIND}.make (op_matches),
				create {EXPR_LEAF}.make_archetype_ref (yyvs4.item (yyvsp4)),
				create {EXPR_LEAF}.make_constraint (yyvs15.item (yyvsp15)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp21 := yyvsp21 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -3
	yyvsp15 := yyvsp15 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 73 then
--|#line 780 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 780")
end

			debug ("ADL_invariant")
				io.put_string (indent + "boolean_constraint:" + yyvs4.item (yyvsp4) + " matches {" + yyvs15.item (yyvsp15).as_string + "}%N") 
			end
			create yyval21.make (create {OPERATOR_KIND}.make (op_matches), 
				create {EXPR_LEAF}.make_archetype_definition_ref (yyvs4.item (yyvsp4)),
				create {EXPR_LEAF}.make_constraint (yyvs15.item (yyvsp15)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp21 := yyvsp21 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -3
	yyvsp15 := yyvsp15 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 74 then
--|#line 789 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 789")
end

			debug ("ADL_invariant")
				io.put_string (indent + "boolean_constraint:" + yyvs4.item (yyvsp4) + " matches {" + yyvs59.item (yyvsp59).as_string + "}%N") 
			end
			create yyval21.make (create {OPERATOR_KIND}.make (op_matches), 
				create {EXPR_LEAF}.make_archetype_definition_ref (yyvs4.item (yyvsp4)),
				create {EXPR_LEAF}.make_coded_term (yyvs59.item (yyvsp59)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp21 := yyvsp21 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -3
	yyvsp59 := yyvsp59 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 75 then
--|#line 804 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 804")
end

			debug ("ADL_invariant")
				io.put_string (indent + "boolean_unop_expr: exists " + yyvs4.item (yyvsp4) + "%N") 
			end
			create yyval20.make (create {OPERATOR_KIND}.make (op_exists), create {EXPR_LEAF}.make_archetype_definition_ref (yyvs4.item (yyvsp4)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp20 := yyvsp20 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 76 then
--|#line 811 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 811")
end

			debug ("ADL_invariant")
				io.put_string (indent + "boolean_unop_expr: not " + yyvs4.item (yyvsp4) + "%N") 
			end
			create yyval20.make (create {OPERATOR_KIND}.make (op_not), create {EXPR_LEAF}.make_archetype_definition_ref (yyvs4.item (yyvsp4)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp20 := yyvsp20 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 77 then
--|#line 818 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 818")
end

			debug ("ADL_invariant")
				io.put_string (indent + "boolean_unop_expr: not [(" + yyvs19.item (yyvsp19).as_string + ")] %N") 
			end
			create yyval20.make (create {OPERATOR_KIND}.make (op_not), yyvs19.item (yyvsp19))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp20 := yyvsp20 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp19 := yyvsp19 -1
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
--|#line 825 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 825")
end

			abort_with_error (ec_SEXPT, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp20 := yyvsp20 + 1
	yyvsp1 := yyvsp1 -2
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
--|#line 835 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 835")
end

			debug ("ADL_invariant")
				io.put_string (indent + "boolean_binop_expr: [" + yyvs19.item (yyvsp19 - 1).as_string + "] " + yyvs4.item (yyvsp4) + " [" + yyvs19.item (yyvsp19).as_string + "]%N") 
			end
			create yyval21.make (create {OPERATOR_KIND}.make (operator_ids_from_symbols.item (yyvs4.item (yyvsp4))), yyvs19.item (yyvsp19 - 1), yyvs19.item (yyvsp19))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp21 := yyvsp21 + 1
	yyvsp19 := yyvsp19 -2
	yyvsp4 := yyvsp4 -1
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
--|#line 844 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 844")
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
when 81 then
--|#line 848 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 848")
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
when 82 then
--|#line 852 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 852")
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
when 83 then
--|#line 856 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 856")
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
when 84 then
--|#line 866 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 866")
end

			create yyval22.make_boolean (True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp22 := yyvsp22 + 1
	yyvsp1 := yyvsp1 -1
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
--|#line 870 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 870")
end

			create yyval22.make_boolean (False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp22 := yyvsp22 + 1
	yyvsp1 := yyvsp1 -1
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
--|#line 880 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 880")
end

			debug ("ADL_invariant")
				io.put_string (indent + "arithmetic_relop_expr: [" + yyvs19.item (yyvsp19 - 1).as_string + "] " + yyvs4.item (yyvsp4) + " [" + yyvs19.item (yyvsp19).as_string + "]%N") 
			end
			create yyval21.make (create {OPERATOR_KIND}.make (operator_ids_from_symbols.item (yyvs4.item (yyvsp4))), yyvs19.item (yyvsp19 - 1), yyvs19.item (yyvsp19))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp21 := yyvsp21 + 1
	yyvsp19 := yyvsp19 -2
	yyvsp4 := yyvsp4 -1
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
--|#line 893 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 893")
end

			yyval19 := yyvs19.item (yyvsp19)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 88 then
--|#line 897 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 897")
end

			yyval19 := yyvs21.item (yyvsp21)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp19 := yyvsp19 + 1
	yyvsp21 := yyvsp21 -1
	if yyvsp19 >= yyvsc19 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs19")
		end
		yyvsc19 := yyvsc19 + yyInitial_yyvs_size
		yyvs19 := yyspecial_routines19.aliased_resized_area (yyvs19, yyvsc19)
	end
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 89 then
--|#line 903 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 903")
end

			yyval19 := yyvs22.item (yyvsp22)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp19 := yyvsp19 + 1
	yyvsp22 := yyvsp22 -1
	if yyvsp19 >= yyvsc19 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs19")
		end
		yyvsc19 := yyvsc19 + yyInitial_yyvs_size
		yyvs19 := yyspecial_routines19.aliased_resized_area (yyvs19, yyvsc19)
	end
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 90 then
--|#line 907 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 907")
end

			debug ("ADL_invariant")
				io.put_string (indent + "(expr) %N") 
			end
			yyval19 := yyvs19.item (yyvsp19)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 91 then
--|#line 920 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 920")
end

			debug ("ADL_invariant")
				io.put_string (indent + "arithmetic_arith_binop_expr: [" + yyvs19.item (yyvsp19 - 1).as_string + "] " + yyvs4.item (yyvsp4) + " [" + yyvs19.item (yyvsp19).as_string + "]%N") 
			end
			create yyval21.make (create {OPERATOR_KIND}.make (operator_ids_from_symbols.item (yyvs4.item (yyvsp4))), yyvs19.item (yyvsp19 - 1), yyvs19.item (yyvsp19))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp21 := yyvsp21 + 1
	yyvsp19 := yyvsp19 -2
	yyvsp4 := yyvsp4 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 92 then
--|#line 933 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 933")
end

			debug ("ADL_invariant")
				io.put_string (indent + "arith_leaf - integer: " + yyvs2.item (yyvsp2).out + "%N") 
			end
			create yyval22.make_integer (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp22 := yyvsp22 + 1
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
when 93 then
--|#line 940 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 940")
end

			debug ("ADL_invariant")
				io.put_string (indent + "arith_leaf - real: " + yyvs3.item (yyvsp3).out + "%N") 
			end
			create yyval22.make_real (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp22 := yyvsp22 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
when 94 then
--|#line 947 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 947")
end

			debug ("ADL_invariant")
				io.put_string (indent + "arith_leaf - path: " + yyvs4.item (yyvsp4) + "%N") 
			end
			create yyval22.make_archetype_definition_ref (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp22 := yyvsp22 + 1
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
when 95 then
--|#line 956 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 956")
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
when 96 then
--|#line 960 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 960")
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
when 97 then
--|#line 964 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 964")
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
when 98 then
--|#line 968 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 968")
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
when 99 then
--|#line 972 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 972")
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
when 100 then
--|#line 976 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 976")
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
when 101 then
--|#line 982 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 982")
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
when 102 then
--|#line 986 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 986")
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
when 103 then
--|#line 990 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 990")
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
when 104 then
--|#line 994 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 994")
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
when 105 then
--|#line 998 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 998")
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
when 106 then
--|#line 1007 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1007")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp12 := yyvsp12 + 1
	if yyvsp12 >= yyvsc12 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs12")
		end
		yyvsc12 := yyvsc12 + yyInitial_yyvs_size
		yyvs12 := yyspecial_routines12.aliased_resized_area (yyvs12, yyvsc12)
	end
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 107 then
--|#line 1008 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1008")
end

			yyval12 := yyvs13.item (yyvsp13)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp12 := yyvsp12 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp13 := yyvsp13 -1
	if yyvsp12 >= yyvsc12 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs12")
		end
		yyvsc12 := yyvsc12 + yyInitial_yyvs_size
		yyvs12 := yyspecial_routines12.aliased_resized_area (yyvs12, yyvsc12)
	end
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 108 then
--|#line 1014 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1014")
end

			if yyvs2.item (yyvsp2) = 0 then
				create yyval13.make_prohibited
			elseif yyvs2.item (yyvsp2) = 1 then
				create yyval13.make_mandatory
			else
				abort_with_error (ec_SEXLSG, Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp13 := yyvsp13 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp13 >= yyvsc13 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs13")
		end
		yyvsc13 := yyvsc13 + yyInitial_yyvs_size
		yyvs13 := yyspecial_routines13.aliased_resized_area (yyvs13, yyvsc13)
	end
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 109 then
--|#line 1024 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1024")
end

			if yyvs2.item (yyvsp2 - 1) = 0 then
				if yyvs2.item (yyvsp2) = 0 then
					create yyval13.make_point (0)
				elseif yyvs2.item (yyvsp2) = 1 then
					create yyval13.make_bounded (0, 1)
				else
					abort_with_error (ec_SEXLU1, Void)
				end
			elseif yyvs2.item (yyvsp2 - 1) = 1 then
				if yyvs2.item (yyvsp2) = 1 then
					create yyval13.make_point (1)
				else
					abort_with_error (ec_SEXLU2, Void)
				end
			else
				abort_with_error (ec_SEXLMG, Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp13 := yyvsp13 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp13 >= yyvsc13 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs13")
		end
		yyvsc13 := yyvsc13 + yyInitial_yyvs_size
		yyvs13 := yyspecial_routines13.aliased_resized_area (yyvs13, yyvsc13)
	end
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 110 then
--|#line 1046 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1046")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp48 := yyvsp48 + 1
	if yyvsp48 >= yyvsc48 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs48")
		end
		yyvsc48 := yyvsc48 + yyInitial_yyvs_size
		yyvs48 := yyspecial_routines48.aliased_resized_area (yyvs48, yyvsc48)
	end
	yyspecial_routines48.force (yyvs48, yyval48, yyvsp48)
end
when 111 then
--|#line 1047 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1047")
end

			yyval48 := yyvs49.item (yyvsp49)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp48 := yyvsp48 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp49 := yyvsp49 -1
	if yyvsp48 >= yyvsc48 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs48")
		end
		yyvsc48 := yyvsc48 + yyInitial_yyvs_size
		yyvs48 := yyspecial_routines48.aliased_resized_area (yyvs48, yyvsc48)
	end
	yyspecial_routines48.force (yyvs48, yyval48, yyvsp48)
end
when 112 then
--|#line 1053 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1053")
end

			create yyval49.make (yyvs13.item (yyvsp13))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp49 := yyvsp49 + 1
	yyvsp13 := yyvsp13 -1
	if yyvsp49 >= yyvsc49 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs49")
		end
		yyvsc49 := yyvsc49 + yyInitial_yyvs_size
		yyvs49 := yyspecial_routines49.aliased_resized_area (yyvs49, yyvsc49)
	end
	yyspecial_routines49.force (yyvs49, yyval49, yyvsp49)
end
when 113 then
--|#line 1057 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1057")
end

			create yyval49.make (yyvs13.item (yyvsp13))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp49 := yyvsp49 + 1
	yyvsp13 := yyvsp13 -1
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
when 114 then
--|#line 1061 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1061")
end

			create yyval49.make (yyvs13.item (yyvsp13))
			yyval49.set_unordered
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp49 := yyvsp49 + 1
	yyvsp13 := yyvsp13 -1
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
when 115 then
--|#line 1066 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1066")
end

			create yyval49.make (yyvs13.item (yyvsp13))
			yyval49.set_unique
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp49 := yyvsp49 + 1
	yyvsp13 := yyvsp13 -1
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
when 116 then
--|#line 1071 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1071")
end

			create yyval49.make (yyvs13.item (yyvsp13))
			yyval49.set_unique
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp49 := yyvsp49 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp1 := yyvsp1 -4
	if yyvsp49 >= yyvsc49 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs49")
		end
		yyvsc49 := yyvsc49 + yyInitial_yyvs_size
		yyvs49 := yyspecial_routines49.aliased_resized_area (yyvs49, yyvsc49)
	end
	yyspecial_routines49.force (yyvs49, yyval49, yyvsp49)
end
when 117 then
--|#line 1076 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1076")
end

			create yyval49.make (yyvs13.item (yyvsp13))
			yyval49.set_unique
			yyval49.set_unordered
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp49 := yyvsp49 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp1 := yyvsp1 -4
	if yyvsp49 >= yyvsc49 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs49")
		end
		yyvsc49 := yyvsc49 + yyInitial_yyvs_size
		yyvs49 := yyspecial_routines49.aliased_resized_area (yyvs49, yyvsc49)
	end
	yyspecial_routines49.force (yyvs49, yyval49, yyvsp49)
end
when 118 then
--|#line 1082 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1082")
end

			create yyval49.make (yyvs13.item (yyvsp13))
			yyval49.set_unique
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp49 := yyvsp49 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp1 := yyvsp1 -4
	if yyvsp49 >= yyvsc49 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs49")
		end
		yyvsc49 := yyvsc49 + yyInitial_yyvs_size
		yyvs49 := yyspecial_routines49.aliased_resized_area (yyvs49, yyvsc49)
	end
	yyspecial_routines49.force (yyvs49, yyval49, yyvsp49)
end
when 119 then
--|#line 1087 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1087")
end

			create yyval49.make (yyvs13.item (yyvsp13))
			yyval49.set_unique
			yyval49.set_unordered
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp49 := yyvsp49 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp1 := yyvsp1 -4
	if yyvsp49 >= yyvsc49 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs49")
		end
		yyvsc49 := yyvsc49 + yyInitial_yyvs_size
		yyvs49 := yyspecial_routines49.aliased_resized_area (yyvs49, yyvsc49)
	end
	yyspecial_routines49.force (yyvs49, yyval49, yyvsp49)
end
when 120 then
--|#line 1095 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1095")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp12 := yyvsp12 + 1
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
--|#line 1096 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1096")
end

			yyval12 := yyvs13.item (yyvsp13)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp12 := yyvsp12 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp13 := yyvsp13 -1
	if yyvsp12 >= yyvsc12 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs12")
		end
		yyvsc12 := yyvsc12 + yyInitial_yyvs_size
		yyvs12 := yyspecial_routines12.aliased_resized_area (yyvs12, yyvsc12)
	end
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 122 then
--|#line 1100 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1100")
end

			abort_with_error (ec_SOCCF, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp12 := yyvsp12 + 1
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
when 123 then
--|#line 1106 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1106")
end

			create yyval13.make_point (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp13 := yyvsp13 + 1
	yyvsp2 := yyvsp2 -1
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
--|#line 1110 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1110")
end

			create yyval13.make_upper_unbounded (0)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp13 := yyvsp13 + 1
	yyvsp1 := yyvsp1 -1
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
--|#line 1114 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1114")
end

			create yyval13.make_bounded (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp13 := yyvsp13 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp1 := yyvsp1 -1
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
--|#line 1118 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1118")
end

			create yyval13.make_upper_unbounded (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp13 := yyvsp13 + 1
	yyvsp2 := yyvsp2 -1
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
--|#line 1126 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1126")
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
when 128 then
--|#line 1130 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1130")
end

			create yyval58.make_value_list (yyvs29.item (yyvsp29))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp58 := yyvsp58 + 1
	yyvsp29 := yyvsp29 -1
	if yyvsp58 >= yyvsc58 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs58")
		end
		yyvsc58 := yyvsc58 + yyInitial_yyvs_size
		yyvs58 := yyspecial_routines58.aliased_resized_area (yyvs58, yyvsc58)
	end
	yyspecial_routines58.force (yyvs58, yyval58, yyvsp58)
end
when 129 then
--|#line 1134 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1134")
end

			create yyval58.make_interval (yyvs36.item (yyvsp36))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp58 := yyvsp58 + 1
	yyvsp36 := yyvsp36 -1
	if yyvsp58 >= yyvsc58 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs58")
		end
		yyvsc58 := yyvsc58 + yyInitial_yyvs_size
		yyvs58 := yyspecial_routines58.aliased_resized_area (yyvs58, yyvsc58)
	end
	yyspecial_routines58.force (yyvs58, yyval58, yyvsp58)
end
when 130 then
--|#line 1138 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1138")
end

			create yyval58.make (yyvs42.item (yyvsp42))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp58 := yyvsp58 + 1
	yyvsp42 := yyvsp42 -1
	if yyvsp58 >= yyvsc58 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs58")
		end
		yyvsc58 := yyvsc58 + yyInitial_yyvs_size
		yyvs58 := yyspecial_routines58.aliased_resized_area (yyvs58, yyvsc58)
	end
	yyspecial_routines58.force (yyvs58, yyval58, yyvsp58)
end
when 131 then
--|#line 1142 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1142")
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
when 132 then
--|#line 1151 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1151")
end

			abort_with_error (ec_SCIAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines58.force (yyvs58, yyval58, yyvsp58)
end
when 133 then
--|#line 1157 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1157")
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
when 134 then
--|#line 1161 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1161")
end

			create yyval57.make_value_list (yyvs30.item (yyvsp30))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp57 := yyvsp57 + 1
	yyvsp30 := yyvsp30 -1
	if yyvsp57 >= yyvsc57 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs57")
		end
		yyvsc57 := yyvsc57 + yyInitial_yyvs_size
		yyvs57 := yyspecial_routines57.aliased_resized_area (yyvs57, yyvsc57)
	end
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
when 135 then
--|#line 1165 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1165")
end

			create yyval57.make_interval (yyvs37.item (yyvsp37))
		
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
when 136 then
--|#line 1169 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1169")
end

			create yyval57.make (yyvs43.item (yyvsp43))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp57 := yyvsp57 + 1
	yyvsp43 := yyvsp43 -1
	if yyvsp57 >= yyvsc57 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs57")
		end
		yyvsc57 := yyvsc57 + yyInitial_yyvs_size
		yyvs57 := yyspecial_routines57.aliased_resized_area (yyvs57, yyvsc57)
	end
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
when 137 then
--|#line 1173 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1173")
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
when 138 then
--|#line 1182 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1182")
end

			abort_with_error (ec_SCRAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
when 139 then
--|#line 1188 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1188")
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
when 140 then
--|#line 1204 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1204")
end

			create yyval55.make_value (yyvs24.item (yyvsp24))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp55 := yyvsp55 + 1
	yyvsp24 := yyvsp24 -1
	if yyvsp55 >= yyvsc55 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs55")
		end
		yyvsc55 := yyvsc55 + yyInitial_yyvs_size
		yyvs55 := yyspecial_routines55.aliased_resized_area (yyvs55, yyvsc55)
	end
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
when 141 then
--|#line 1208 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1208")
end

			create yyval55.make_value_list (yyvs32.item (yyvsp32))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp55 := yyvsp55 + 1
	yyvsp32 := yyvsp32 -1
	if yyvsp55 >= yyvsc55 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs55")
		end
		yyvsc55 := yyvsc55 + yyInitial_yyvs_size
		yyvs55 := yyspecial_routines55.aliased_resized_area (yyvs55, yyvsc55)
	end
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
when 142 then
--|#line 1212 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1212")
end

			create yyval55.make_interval (yyvs39.item (yyvsp39))
		
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
when 143 then
--|#line 1216 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1216")
end

			create yyval55.make (yyvs45.item (yyvsp45))
		
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
when 144 then
--|#line 1220 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1220")
end

			if yyvs55.item (yyvsp55).valid_value (yyvs24.item (yyvsp24)) then
				yyvs55.item (yyvsp55).set_assumed_value (yyvs24.item (yyvsp24))
				yyval55 := yyvs55.item (yyvsp55)
			else
				abort_with_error (ec_VOBAV, <<yyvs24.item (yyvsp24).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp24 := yyvsp24 -1
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
when 145 then
--|#line 1229 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1229")
end

			abort_with_error (ec_SCDAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
when 146 then
--|#line 1235 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1235")
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
when 147 then
--|#line 1250 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1250")
end

			create yyval56.make_value (yyvs26.item (yyvsp26))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp56 := yyvsp56 + 1
	yyvsp26 := yyvsp26 -1
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
--|#line 1254 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1254")
end

			create yyval56.make_value_list (yyvs33.item (yyvsp33))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp56 := yyvsp56 + 1
	yyvsp33 := yyvsp33 -1
	if yyvsp56 >= yyvsc56 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs56")
		end
		yyvsc56 := yyvsc56 + yyInitial_yyvs_size
		yyvs56 := yyspecial_routines56.aliased_resized_area (yyvs56, yyvsc56)
	end
	yyspecial_routines56.force (yyvs56, yyval56, yyvsp56)
end
when 149 then
--|#line 1258 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1258")
end

			create yyval56.make_interval (yyvs38.item (yyvsp38))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp56 := yyvsp56 + 1
	yyvsp38 := yyvsp38 -1
	if yyvsp56 >= yyvsc56 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs56")
		end
		yyvsc56 := yyvsc56 + yyInitial_yyvs_size
		yyvs56 := yyspecial_routines56.aliased_resized_area (yyvs56, yyvsc56)
	end
	yyspecial_routines56.force (yyvs56, yyval56, yyvsp56)
end
when 150 then
--|#line 1262 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1262")
end

			create yyval56.make (yyvs44.item (yyvsp44))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp56 := yyvsp56 + 1
	yyvsp44 := yyvsp44 -1
	if yyvsp56 >= yyvsc56 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs56")
		end
		yyvsc56 := yyvsc56 + yyInitial_yyvs_size
		yyvs56 := yyspecial_routines56.aliased_resized_area (yyvs56, yyvsc56)
	end
	yyspecial_routines56.force (yyvs56, yyval56, yyvsp56)
end
when 151 then
--|#line 1266 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1266")
end

			if yyvs56.item (yyvsp56).valid_value (yyvs26.item (yyvsp26)) then
				yyvs56.item (yyvsp56).set_assumed_value (yyvs26.item (yyvsp26))
				yyval56 := yyvs56.item (yyvsp56)
			else
				abort_with_error (ec_VOBAV, <<yyvs26.item (yyvsp26).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp26 := yyvsp26 -1
	yyspecial_routines56.force (yyvs56, yyval56, yyvsp56)
end
when 152 then
--|#line 1275 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1275")
end

			abort_with_error (ec_SCTAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines56.force (yyvs56, yyval56, yyvsp56)
end
when 153 then
--|#line 1281 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1281")
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
when 154 then
--|#line 1296 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1296")
end

			create yyval53.make_value (yyvs25.item (yyvsp25))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp53 := yyvsp53 + 1
	yyvsp25 := yyvsp25 -1
	if yyvsp53 >= yyvsc53 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs53")
		end
		yyvsc53 := yyvsc53 + yyInitial_yyvs_size
		yyvs53 := yyspecial_routines53.aliased_resized_area (yyvs53, yyvsc53)
	end
	yyspecial_routines53.force (yyvs53, yyval53, yyvsp53)
end
when 155 then
--|#line 1300 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1300")
end

			create yyval53.make_value_list (yyvs34.item (yyvsp34))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp53 := yyvsp53 + 1
	yyvsp34 := yyvsp34 -1
	if yyvsp53 >= yyvsc53 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs53")
		end
		yyvsc53 := yyvsc53 + yyInitial_yyvs_size
		yyvs53 := yyspecial_routines53.aliased_resized_area (yyvs53, yyvsc53)
	end
	yyspecial_routines53.force (yyvs53, yyval53, yyvsp53)
end
when 156 then
--|#line 1304 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1304")
end

			create yyval53.make_interval (yyvs40.item (yyvsp40))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp53 := yyvsp53 + 1
	yyvsp40 := yyvsp40 -1
	if yyvsp53 >= yyvsc53 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs53")
		end
		yyvsc53 := yyvsc53 + yyInitial_yyvs_size
		yyvs53 := yyspecial_routines53.aliased_resized_area (yyvs53, yyvsc53)
	end
	yyspecial_routines53.force (yyvs53, yyval53, yyvsp53)
end
when 157 then
--|#line 1308 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1308")
end

			create yyval53.make (yyvs46.item (yyvsp46))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp53 := yyvsp53 + 1
	yyvsp46 := yyvsp46 -1
	if yyvsp53 >= yyvsc53 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs53")
		end
		yyvsc53 := yyvsc53 + yyInitial_yyvs_size
		yyvs53 := yyspecial_routines53.aliased_resized_area (yyvs53, yyvsc53)
	end
	yyspecial_routines53.force (yyvs53, yyval53, yyvsp53)
end
when 158 then
--|#line 1312 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1312")
end

			if yyvs53.item (yyvsp53).valid_value (yyvs25.item (yyvsp25)) then
				yyvs53.item (yyvsp53).set_assumed_value (yyvs25.item (yyvsp25))
				yyval53 := yyvs53.item (yyvsp53)
			else
				abort_with_error (ec_VOBAV, <<yyvs25.item (yyvsp25).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp25 := yyvsp25 -1
	yyspecial_routines53.force (yyvs53, yyval53, yyvsp53)
end
when 159 then
--|#line 1321 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1321")
end

			abort_with_error (ec_SCDTAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines53.force (yyvs53, yyval53, yyvsp53)
end
when 160 then
--|#line 1327 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1327")
end

			if valid_iso8601_duration_constraint_pattern (yyvs4.item (yyvsp4)) then
				create yyval54.make_pattern_with_range (yyvs4.item (yyvsp4), yyvs41.item (yyvsp41))
			else
				abort_with_error (ec_SCDUPT, <<yyvs4.item (yyvsp4)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp54 := yyvsp54 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -1
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
when 161 then
--|#line 1335 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1335")
end

			if valid_iso8601_duration_constraint_pattern (yyvs4.item (yyvsp4)) then
				create yyval54.make_pattern_with_range (yyvs4.item (yyvsp4), create {POINT_INTERVAL [ISO8601_DURATION]}.make (yyvs27.item (yyvsp27)))
			else
				abort_with_error (ec_SCDUPT, <<yyvs4.item (yyvsp4)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp54 := yyvsp54 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -1
	yyvsp27 := yyvsp27 -1
	if yyvsp54 >= yyvsc54 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs54")
		end
		yyvsc54 := yyvsc54 + yyInitial_yyvs_size
		yyvs54 := yyspecial_routines54.aliased_resized_area (yyvs54, yyvsc54)
	end
	yyspecial_routines54.force (yyvs54, yyval54, yyvsp54)
end
when 162 then
--|#line 1343 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1343")
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
when 163 then
--|#line 1351 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1351")
end

			create yyval54.make_value (yyvs27.item (yyvsp27))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp54 := yyvsp54 + 1
	yyvsp27 := yyvsp27 -1
	if yyvsp54 >= yyvsc54 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs54")
		end
		yyvsc54 := yyvsc54 + yyInitial_yyvs_size
		yyvs54 := yyspecial_routines54.aliased_resized_area (yyvs54, yyvsc54)
	end
	yyspecial_routines54.force (yyvs54, yyval54, yyvsp54)
end
when 164 then
--|#line 1355 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1355")
end

			create yyval54.make_value_list (yyvs35.item (yyvsp35))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp54 := yyvsp54 + 1
	yyvsp35 := yyvsp35 -1
	if yyvsp54 >= yyvsc54 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs54")
		end
		yyvsc54 := yyvsc54 + yyInitial_yyvs_size
		yyvs54 := yyspecial_routines54.aliased_resized_area (yyvs54, yyvsc54)
	end
	yyspecial_routines54.force (yyvs54, yyval54, yyvsp54)
end
when 165 then
--|#line 1359 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1359")
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
when 166 then
--|#line 1363 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1363")
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
when 167 then
--|#line 1367 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1367")
end

			if yyvs54.item (yyvsp54).valid_value (yyvs27.item (yyvsp27)) then
				yyvs54.item (yyvsp54).set_assumed_value (yyvs27.item (yyvsp27))
				yyval54 := yyvs54.item (yyvsp54)
			else
				abort_with_error (ec_VOBAV, <<yyvs27.item (yyvsp27).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp27 := yyvsp27 -1
	yyspecial_routines54.force (yyvs54, yyval54, yyvsp54)
end
when 168 then
--|#line 1376 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1376")
end

			abort_with_error (ec_SCDUAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines54.force (yyvs54, yyval54, yyvsp54)
end
when 169 then
--|#line 1381 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1381")
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
when 170 then
--|#line 1387 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1387")
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
when 171 then
--|#line 1391 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1391")
end

			create yyval52.make (yyvs28.item (yyvsp28))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp52 := yyvsp52 + 1
	yyvsp28 := yyvsp28 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
when 172 then
--|#line 1395 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1395")
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
when 173 then
--|#line 1402 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1402")
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
when 174 then
--|#line 1411 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1411")
end

			abort_with_error (ec_SCSAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
when 175 then
--|#line 1417 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1417")
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
when 176 then
--|#line 1424 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1424")
end

			-- e.g. [local::idN] due to reuse of at-code as value code in original 1.4 archetype
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
when 177 then
--|#line 1429 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1429")
end

			-- e.g. "local::at40"
			if yyvs5.item (yyvsp5).is_single then
				create yyval59.make (yyvs5.item (yyvsp5).codes.first)

			-- e.g. "local::at40, at41; at40"; we have to synthesise an ac-code and convert the inline to a separate value set
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
when 178 then
--|#line 1445 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1445")
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
when 179 then
--|#line 1525 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1525")
end

			create yyval59.make (Missing_codes)
			-- abort_with_error (ec_STVSI, <<err_str, c_attrs.item.path>>)
		
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
when 180 then
--|#line 1530 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1530")
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
when 181 then
--|#line 1534 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1534")
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
when 182 then
--|#line 1538 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1538")
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
when 183 then
--|#line 1544 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1544")
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
when 184 then
--|#line 1548 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1548")
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
when 185 then
--|#line 1552 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1552")
end

			create yyval51.make (yyvs31.item (yyvsp31))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp51 := yyvsp51 + 1
	yyvsp31 := yyvsp31 -1
	if yyvsp51 >= yyvsc51 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs51")
		end
		yyvsc51 := yyvsc51 + yyInitial_yyvs_size
		yyvs51 := yyspecial_routines51.aliased_resized_area (yyvs51, yyvsc51)
	end
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
when 186 then
--|#line 1556 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1556")
end

			if yyvs51.item (yyvsp51).valid_value (yyvs23.item (yyvsp23)) then
				yyvs51.item (yyvsp51).set_assumed_value (yyvs23.item (yyvsp23))
			else
				abort_with_error (ec_VOBAV, <<yyvs23.item (yyvsp23).out>>)
			end
			yyval51 := yyvs51.item (yyvsp51)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp23 := yyvsp23 -1
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
when 187 then
--|#line 1565 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1565")
end

			abort_with_error (ec_SCBAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
when 188 then
--|#line 1576 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1576")
end

			create yyval14.make ("DV_ORDINAL", new_fake_node_id)

			-- create a C_ATTR_TUPLE and connect the received C_OBJ_TUPLE to it
			yyval14.put_attribute_tuple (create {C_ATTRIBUTE_TUPLE}.make)

			-- create 'value' C_ATTRIBUTE and attach both to C_C_O and to C_ATTR_TUPLE
			yyval14.put_attribute (create {C_ATTRIBUTE}.make_single ("value", Void))
			yyval14.attribute_tuples.first.put_member (yyval14.attribute_with_name ("value"))
			create ordinal_integer.make_value (yyvs50.item (yyvsp50).value)
			yyval14.attribute_with_name ("value").put_child (ordinal_integer)

			-- create 'symbol' C_ATTRIBUTE and attach both to C_C_O and to C_ATTR_TUPLE
			yyval14.put_attribute (create {C_ATTRIBUTE}.make_single ("symbol", Void))
			yyval14.attribute_tuples.first.put_member (yyval14.attribute_with_name ("symbol"))
			create ordinal_symbol.make (yyvs50.item (yyvsp50).symbol)
			yyval14.attribute_with_name ("symbol").put_child (ordinal_symbol)

			-- add object tuple and connect between C_ATTRIBUTE_TUPLE and C_P_Os
			yyval14.attribute_tuples.first.add_tuple
			yyval14.attribute_tuples.first.tuples.last.put_member (ordinal_integer)
			yyval14.attribute_tuples.first.tuples.last.put_member (ordinal_symbol)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp50 := yyvsp50 -1
	if yyvsp14 >= yyvsc14 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs14")
		end
		yyvsc14 := yyvsc14 + yyInitial_yyvs_size
		yyvs14 := yyspecial_routines14.aliased_resized_area (yyvs14, yyvsc14)
	end
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 189 then
--|#line 1600 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1600")
end

			yyval14 := yyvs14.item (yyvsp14)

			if yyval14.attribute_with_name ("value").children.there_exists (
					agent (co: C_OBJECT; a_val: INTEGER): BOOLEAN
						do
							Result := attached {C_INTEGER} co as ci and then ci.valid_value (a_val)
						end (?, yyvs50.item (yyvsp50).value)
				)
			then
				abort_with_error (ec_VCOV, <<yyvs50.item (yyvsp50).value.out>>)

			elseif yyval14.attribute_with_name ("symbol").children.there_exists (
					agent (co: C_OBJECT; a_sym: TERMINOLOGY_CODE): BOOLEAN
						do
							Result := attached {C_TERMINOLOGY_CODE} co as ctc and then ctc.valid_value (a_sym)
						end (?, create {TERMINOLOGY_CODE}.make (Local_terminology_id, yyvs50.item (yyvsp50).symbol))
				)
			then
				abort_with_error (ec_VCOC, <<yyvs50.item (yyvsp50).symbol>>)

			else
				create ordinal_integer.make_value (yyvs50.item (yyvsp50).value)
				yyval14.attribute_with_name ("value").put_child (ordinal_integer)
				create ordinal_symbol.make (yyvs50.item (yyvsp50).symbol)
				yyval14.attribute_with_name ("symbol").put_child (ordinal_symbol)

				-- add object tuple and connect between C_ATTRIBUTE_TUPLE and C_P_Os
				yyval14.attribute_tuples.first.add_tuple
				yyval14.attribute_tuples.first.tuples.last.put_member (ordinal_integer)
				yyval14.attribute_tuples.first.tuples.last.put_member (ordinal_symbol)

			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp50 := yyvsp50 -1
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 190 then
--|#line 1635 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1635")
end

			yyval14 := yyvs14.item (yyvsp14)

			-- assumed value for C_DV_ORDINAL not supported
			add_warning (ec_WDTOAV, Void)
 		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 191 then
--|#line 1642 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1642")
end

			abort_with_error (ec_SCOAV, Void)
 		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 192 then
--|#line 1648 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1648")
end

			create yyval50.make (yyvs2.item (yyvsp2), yyvs5.item (yyvsp5).first_code)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp50 := yyvsp50 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp50 >= yyvsc50 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs50")
		end
		yyvsc50 := yyvsc50 + yyInitial_yyvs_size
		yyvs50 := yyspecial_routines50.aliased_resized_area (yyvs50, yyvsc50)
	end
	yyspecial_routines50.force (yyvs50, yyval50, yyvsp50)
end
when 193 then
--|#line 1655 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1655")
end

			create yyval50.make (yyvs2.item (yyvsp2), yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp50 := yyvsp50 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
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
--|#line 1659 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1659")
end

			abort_with_error (ec_STCV, <<c_attrs.item.path>>)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp50 := yyvsp50 + 1
	yyvsp2 := yyvsp2 -1
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
when 195 then
--|#line 1670 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1670")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 196 then
--|#line 1674 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1674")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 197 then
--|#line 1680 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1680")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 198 then
--|#line 1684 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1684")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 199 then
--|#line 1697 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1697")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 200 then
--|#line 1703 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1703")
end

			create yyval28.make(0)
			yyval28.extend(yyvs4.item (yyvsp4 - 1))
			yyval28.extend(yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp28 := yyvsp28 + 1
	yyvsp4 := yyvsp4 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp28 >= yyvsc28 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs28")
		end
		yyvsc28 := yyvsc28 + yyInitial_yyvs_size
		yyvs28 := yyspecial_routines28.aliased_resized_area (yyvs28, yyvsc28)
	end
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
when 201 then
--|#line 1709 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1709")
end

			yyvs28.item (yyvsp28).extend(yyvs4.item (yyvsp4))
			yyval28 := yyvs28.item (yyvsp28)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
when 202 then
--|#line 1717 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1717")
end

			yyval28 := yyvs28.item (yyvsp28)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
when 203 then
--|#line 1721 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1721")
end

			create yyval28.make (0)
			yyval28.extend (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp28 := yyvsp28 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp28 >= yyvsc28 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs28")
		end
		yyvsc28 := yyvsc28 + yyInitial_yyvs_size
		yyvs28 := yyspecial_routines28.aliased_resized_area (yyvs28, yyvsc28)
	end
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
when 204 then
--|#line 1728 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1728")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 205 then
--|#line 1731 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1731")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 206 then
--|#line 1734 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1734")
end

			yyval2 := - yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 207 then
--|#line 1739 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1739")
end

			create yyval29.make(0)
			yyval29.extend(yyvs2.item (yyvsp2 - 1))
			yyval29.extend(yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp29 := yyvsp29 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp29 >= yyvsc29 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs29")
		end
		yyvsc29 := yyvsc29 + yyInitial_yyvs_size
		yyvs29 := yyspecial_routines29.aliased_resized_area (yyvs29, yyvsc29)
	end
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
when 208 then
--|#line 1745 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1745")
end

			yyvs29.item (yyvsp29).extend(yyvs2.item (yyvsp2))
			yyval29 := yyvs29.item (yyvsp29)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
when 209 then
--|#line 1750 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1750")
end

			create yyval29.make(0)
			yyval29.extend(yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp29 := yyvsp29 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp29 >= yyvsc29 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs29")
		end
		yyvsc29 := yyvsc29 + yyInitial_yyvs_size
		yyvs29 := yyspecial_routines29.aliased_resized_area (yyvs29, yyvsc29)
	end
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
when 210 then
--|#line 1757 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1757")
end

			if yyvs2.item (yyvsp2 - 1) <= yyvs2.item (yyvsp2) then
				create {PROPER_INTERVAL [INTEGER]} yyval36.make_bounded(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs2.item (yyvsp2 - 1).out, yyvs2.item (yyvsp2).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp36 := yyvsp36 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -2
	if yyvsp36 >= yyvsc36 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs36")
		end
		yyvsc36 := yyvsc36 + yyInitial_yyvs_size
		yyvs36 := yyspecial_routines36.aliased_resized_area (yyvs36, yyvsc36)
	end
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
when 211 then
--|#line 1765 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1765")
end

			if yyvs2.item (yyvsp2 - 1) <= yyvs2.item (yyvsp2) then
				create {PROPER_INTERVAL [INTEGER]} yyval36.make_bounded(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs2.item (yyvsp2 - 1).out, yyvs2.item (yyvsp2).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp36 := yyvsp36 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp2 := yyvsp2 -2
	if yyvsp36 >= yyvsc36 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs36")
		end
		yyvsc36 := yyvsc36 + yyInitial_yyvs_size
		yyvs36 := yyspecial_routines36.aliased_resized_area (yyvs36, yyvsc36)
	end
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
when 212 then
--|#line 1773 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1773")
end

			if yyvs2.item (yyvsp2 - 1) <= yyvs2.item (yyvsp2) then
				create {PROPER_INTERVAL [INTEGER]} yyval36.make_bounded(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs2.item (yyvsp2 - 1).out, yyvs2.item (yyvsp2).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp36 := yyvsp36 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp2 := yyvsp2 -2
	if yyvsp36 >= yyvsc36 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs36")
		end
		yyvsc36 := yyvsc36 + yyInitial_yyvs_size
		yyvs36 := yyspecial_routines36.aliased_resized_area (yyvs36, yyvsc36)
	end
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
when 213 then
--|#line 1781 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1781")
end

			if yyvs2.item (yyvsp2 - 1) <= yyvs2.item (yyvsp2) then
				create {PROPER_INTERVAL [INTEGER]} yyval36.make_bounded (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs2.item (yyvsp2 - 1).out, yyvs2.item (yyvsp2).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp36 := yyvsp36 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp2 := yyvsp2 -2
	if yyvsp36 >= yyvsc36 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs36")
		end
		yyvsc36 := yyvsc36 + yyInitial_yyvs_size
		yyvs36 := yyspecial_routines36.aliased_resized_area (yyvs36, yyvsc36)
	end
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
when 214 then
--|#line 1789 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1789")
end

			create {PROPER_INTERVAL [INTEGER]} yyval36.make_lower_unbounded (yyvs2.item (yyvsp2), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp36 := yyvsp36 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -1
	if yyvsp36 >= yyvsc36 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs36")
		end
		yyvsc36 := yyvsc36 + yyInitial_yyvs_size
		yyvs36 := yyspecial_routines36.aliased_resized_area (yyvs36, yyvsc36)
	end
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
when 215 then
--|#line 1793 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1793")
end

			create {PROPER_INTERVAL [INTEGER]} yyval36.make_lower_unbounded (yyvs2.item (yyvsp2), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp36 := yyvsp36 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -1
	if yyvsp36 >= yyvsc36 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs36")
		end
		yyvsc36 := yyvsc36 + yyInitial_yyvs_size
		yyvs36 := yyspecial_routines36.aliased_resized_area (yyvs36, yyvsc36)
	end
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
when 216 then
--|#line 1797 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1797")
end

			create {PROPER_INTERVAL [INTEGER]} yyval36.make_upper_unbounded (yyvs2.item (yyvsp2), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp36 := yyvsp36 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -1
	if yyvsp36 >= yyvsc36 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs36")
		end
		yyvsc36 := yyvsc36 + yyInitial_yyvs_size
		yyvs36 := yyspecial_routines36.aliased_resized_area (yyvs36, yyvsc36)
	end
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
when 217 then
--|#line 1801 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1801")
end

			create {PROPER_INTERVAL [INTEGER]} yyval36.make_upper_unbounded (yyvs2.item (yyvsp2), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp36 := yyvsp36 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -1
	if yyvsp36 >= yyvsc36 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs36")
		end
		yyvsc36 := yyvsc36 + yyInitial_yyvs_size
		yyvs36 := yyspecial_routines36.aliased_resized_area (yyvs36, yyvsc36)
	end
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
when 218 then
--|#line 1805 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1805")
end

			create {POINT_INTERVAL [INTEGER]} yyval36.make (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp36 := yyvsp36 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -1
	if yyvsp36 >= yyvsc36 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs36")
		end
		yyvsc36 := yyvsc36 + yyInitial_yyvs_size
		yyvs36 := yyspecial_routines36.aliased_resized_area (yyvs36, yyvsc36)
	end
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
when 219 then
--|#line 1811 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1811")
end

			create yyval42.make(0)
			yyval42.extend(yyvs36.item (yyvsp36 - 1))
			yyval42.extend(yyvs36.item (yyvsp36))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp42 := yyvsp42 + 1
	yyvsp36 := yyvsp36 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp42 >= yyvsc42 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs42")
		end
		yyvsc42 := yyvsc42 + yyInitial_yyvs_size
		yyvs42 := yyspecial_routines42.aliased_resized_area (yyvs42, yyvsc42)
	end
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
when 220 then
--|#line 1817 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1817")
end

			yyvs42.item (yyvsp42).extend(yyvs36.item (yyvsp36))
			yyval42 := yyvs42.item (yyvsp42)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp36 := yyvsp36 -1
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
when 221 then
--|#line 1822 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1822")
end

			create yyval42.make(0)
			yyval42.extend(yyvs36.item (yyvsp36))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp42 := yyvsp42 + 1
	yyvsp36 := yyvsp36 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp42 >= yyvsc42 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs42")
		end
		yyvsc42 := yyvsc42 + yyInitial_yyvs_size
		yyvs42 := yyspecial_routines42.aliased_resized_area (yyvs42, yyvsc42)
	end
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
when 222 then
--|#line 1829 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1829")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 223 then
--|#line 1833 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1833")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 224 then
--|#line 1837 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1837")
end

			yyval3 := - yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 225 then
--|#line 1843 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1843")
end

			create yyval30.make(0)
			yyval30.extend(yyvs3.item (yyvsp3 - 1))
			yyval30.extend(yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp30 := yyvsp30 + 1
	yyvsp3 := yyvsp3 -2
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
when 226 then
--|#line 1849 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1849")
end

			yyvs30.item (yyvsp30).extend(yyvs3.item (yyvsp3))
			yyval30 := yyvs30.item (yyvsp30)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
when 227 then
--|#line 1854 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1854")
end

			create yyval30.make(0)
			yyval30.extend(yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp30 := yyvsp30 + 1
	yyvsp3 := yyvsp3 -1
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
when 228 then
--|#line 1861 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1861")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create {PROPER_INTERVAL [REAL]} yyval37.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp37 := yyvsp37 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -2
	if yyvsp37 >= yyvsc37 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs37")
		end
		yyvsc37 := yyvsc37 + yyInitial_yyvs_size
		yyvs37 := yyspecial_routines37.aliased_resized_area (yyvs37, yyvsc37)
	end
	yyspecial_routines37.force (yyvs37, yyval37, yyvsp37)
end
when 229 then
--|#line 1869 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1869")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create {PROPER_INTERVAL [REAL]} yyval37.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp37 := yyvsp37 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp3 := yyvsp3 -2
	if yyvsp37 >= yyvsc37 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs37")
		end
		yyvsc37 := yyvsc37 + yyInitial_yyvs_size
		yyvs37 := yyspecial_routines37.aliased_resized_area (yyvs37, yyvsc37)
	end
	yyspecial_routines37.force (yyvs37, yyval37, yyvsp37)
end
when 230 then
--|#line 1877 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1877")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create {PROPER_INTERVAL [REAL]} yyval37.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp37 := yyvsp37 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp3 := yyvsp3 -2
	if yyvsp37 >= yyvsc37 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs37")
		end
		yyvsc37 := yyvsc37 + yyInitial_yyvs_size
		yyvs37 := yyspecial_routines37.aliased_resized_area (yyvs37, yyvsc37)
	end
	yyspecial_routines37.force (yyvs37, yyval37, yyvsp37)
end
when 231 then
--|#line 1885 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1885")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create {PROPER_INTERVAL [REAL]} yyval37.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp37 := yyvsp37 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp3 := yyvsp3 -2
	if yyvsp37 >= yyvsc37 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs37")
		end
		yyvsc37 := yyvsc37 + yyInitial_yyvs_size
		yyvs37 := yyspecial_routines37.aliased_resized_area (yyvs37, yyvsc37)
	end
	yyspecial_routines37.force (yyvs37, yyval37, yyvsp37)
end
when 232 then
--|#line 1893 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1893")
end

			create {PROPER_INTERVAL [REAL]} yyval37.make_lower_unbounded(yyvs3.item (yyvsp3), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp37 := yyvsp37 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp37 >= yyvsc37 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs37")
		end
		yyvsc37 := yyvsc37 + yyInitial_yyvs_size
		yyvs37 := yyspecial_routines37.aliased_resized_area (yyvs37, yyvsc37)
	end
	yyspecial_routines37.force (yyvs37, yyval37, yyvsp37)
end
when 233 then
--|#line 1897 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1897")
end

			create {PROPER_INTERVAL [REAL]} yyval37.make_lower_unbounded(yyvs3.item (yyvsp3), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp37 := yyvsp37 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp37 >= yyvsc37 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs37")
		end
		yyvsc37 := yyvsc37 + yyInitial_yyvs_size
		yyvs37 := yyspecial_routines37.aliased_resized_area (yyvs37, yyvsc37)
	end
	yyspecial_routines37.force (yyvs37, yyval37, yyvsp37)
end
when 234 then
--|#line 1901 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1901")
end

			create {PROPER_INTERVAL [REAL]} yyval37.make_upper_unbounded(yyvs3.item (yyvsp3), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp37 := yyvsp37 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp37 >= yyvsc37 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs37")
		end
		yyvsc37 := yyvsc37 + yyInitial_yyvs_size
		yyvs37 := yyspecial_routines37.aliased_resized_area (yyvs37, yyvsc37)
	end
	yyspecial_routines37.force (yyvs37, yyval37, yyvsp37)
end
when 235 then
--|#line 1905 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1905")
end

			create {PROPER_INTERVAL [REAL]} yyval37.make_upper_unbounded(yyvs3.item (yyvsp3), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp37 := yyvsp37 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp37 >= yyvsc37 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs37")
		end
		yyvsc37 := yyvsc37 + yyInitial_yyvs_size
		yyvs37 := yyspecial_routines37.aliased_resized_area (yyvs37, yyvsc37)
	end
	yyspecial_routines37.force (yyvs37, yyval37, yyvsp37)
end
when 236 then
--|#line 1909 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1909")
end

			create {POINT_INTERVAL [REAL]} yyval37.make(yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp37 := yyvsp37 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp3 := yyvsp3 -1
	if yyvsp37 >= yyvsc37 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs37")
		end
		yyvsc37 := yyvsc37 + yyInitial_yyvs_size
		yyvs37 := yyspecial_routines37.aliased_resized_area (yyvs37, yyvsc37)
	end
	yyspecial_routines37.force (yyvs37, yyval37, yyvsp37)
end
when 237 then
--|#line 1915 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1915")
end

			create yyval43.make(0)
			yyval43.extend(yyvs37.item (yyvsp37 - 1))
			yyval43.extend(yyvs37.item (yyvsp37))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp43 := yyvsp43 + 1
	yyvsp37 := yyvsp37 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp43 >= yyvsc43 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs43")
		end
		yyvsc43 := yyvsc43 + yyInitial_yyvs_size
		yyvs43 := yyspecial_routines43.aliased_resized_area (yyvs43, yyvsc43)
	end
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
when 238 then
--|#line 1921 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1921")
end

			yyvs43.item (yyvsp43).extend(yyvs37.item (yyvsp37))
			yyval43 := yyvs43.item (yyvsp43)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp37 := yyvsp37 -1
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
when 239 then
--|#line 1926 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1926")
end

			create yyval43.make(0)
			yyval43.extend(yyvs37.item (yyvsp37))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp43 := yyvsp43 + 1
	yyvsp37 := yyvsp37 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp43 >= yyvsc43 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs43")
		end
		yyvsc43 := yyvsc43 + yyInitial_yyvs_size
		yyvs43 := yyspecial_routines43.aliased_resized_area (yyvs43, yyvsc43)
	end
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
when 240 then
--|#line 1933 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1933")
end

			yyval23 := True
		
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
when 241 then
--|#line 1937 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1937")
end

			yyval23 := False
		
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
when 242 then
--|#line 1943 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1943")
end

			create yyval31.make(0)
			yyval31.extend(yyvs23.item (yyvsp23 - 1))
			yyval31.extend(yyvs23.item (yyvsp23))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp31 := yyvsp31 + 1
	yyvsp23 := yyvsp23 -2
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
when 243 then
--|#line 1949 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1949")
end

			yyvs31.item (yyvsp31).extend(yyvs23.item (yyvsp23))
			yyval31 := yyvs31.item (yyvsp31)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp23 := yyvsp23 -1
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 244 then
--|#line 1954 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1954")
end

			create yyval31.make(0)
			yyval31.extend(yyvs23.item (yyvsp23))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp31 := yyvsp31 + 1
	yyvsp23 := yyvsp23 -1
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
when 245 then
--|#line 1961 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1961")
end

			if valid_iso8601_date(yyvs4.item (yyvsp4)) then
				create yyval24.make_from_string(yyvs4.item (yyvsp4))
			else
				abort_with_error (ec_VIDV, <<yyvs4.item (yyvsp4)>>)
			end
		
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
when 246 then
--|#line 1971 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1971")
end

			create yyval32.make(0)
			yyval32.extend (yyvs24.item (yyvsp24 - 1))
			yyval32.extend (yyvs24.item (yyvsp24))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp32 := yyvsp32 + 1
	yyvsp24 := yyvsp24 -2
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
when 247 then
--|#line 1977 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1977")
end

			yyvs32.item (yyvsp32).extend (yyvs24.item (yyvsp24))
			yyval32 := yyvs32.item (yyvsp32)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp24 := yyvsp24 -1
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 248 then
--|#line 1982 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1982")
end

			create yyval32.make(0)
			yyval32.extend (yyvs24.item (yyvsp24))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp32 := yyvsp32 + 1
	yyvsp24 := yyvsp24 -1
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
when 249 then
--|#line 1989 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1989")
end

			if yyvs24.item (yyvsp24 - 1) <= yyvs24.item (yyvsp24) then
				create {PROPER_INTERVAL [ISO8601_DATE]} yyval39.make_bounded(yyvs24.item (yyvsp24 - 1), yyvs24.item (yyvsp24), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs24.item (yyvsp24 - 1).out, yyvs24.item (yyvsp24).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp24 := yyvsp24 -2
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 250 then
--|#line 1997 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1997")
end

			if yyvs24.item (yyvsp24 - 1) <= yyvs24.item (yyvsp24) then
				create {PROPER_INTERVAL [ISO8601_DATE]} yyval39.make_bounded(yyvs24.item (yyvsp24 - 1), yyvs24.item (yyvsp24), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs24.item (yyvsp24 - 1).out, yyvs24.item (yyvsp24).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp24 := yyvsp24 -2
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 251 then
--|#line 2005 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2005")
end

			if yyvs24.item (yyvsp24 - 1) <= yyvs24.item (yyvsp24) then
				create {PROPER_INTERVAL [ISO8601_DATE]} yyval39.make_bounded(yyvs24.item (yyvsp24 - 1), yyvs24.item (yyvsp24), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs24.item (yyvsp24 - 1).out, yyvs24.item (yyvsp24).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp24 := yyvsp24 -2
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 252 then
--|#line 2013 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2013")
end

			if yyvs24.item (yyvsp24 - 1) <= yyvs24.item (yyvsp24) then
				create {PROPER_INTERVAL [ISO8601_DATE]} yyval39.make_bounded(yyvs24.item (yyvsp24 - 1), yyvs24.item (yyvsp24), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs24.item (yyvsp24 - 1).out, yyvs24.item (yyvsp24).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp24 := yyvsp24 -2
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 253 then
--|#line 2021 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2021")
end

			create {PROPER_INTERVAL [ISO8601_DATE]} yyval39.make_lower_unbounded(yyvs24.item (yyvsp24), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp24 := yyvsp24 -1
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 254 then
--|#line 2025 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2025")
end

			create {PROPER_INTERVAL [ISO8601_DATE]} yyval39.make_lower_unbounded(yyvs24.item (yyvsp24), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp24 := yyvsp24 -1
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 255 then
--|#line 2029 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2029")
end

			create {PROPER_INTERVAL [ISO8601_DATE]} yyval39.make_upper_unbounded(yyvs24.item (yyvsp24), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp24 := yyvsp24 -1
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 256 then
--|#line 2033 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2033")
end

			create {PROPER_INTERVAL [ISO8601_DATE]} yyval39.make_upper_unbounded(yyvs24.item (yyvsp24), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp24 := yyvsp24 -1
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 257 then
--|#line 2037 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2037")
end

			create {POINT_INTERVAL [ISO8601_DATE]} yyval39.make (yyvs24.item (yyvsp24))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp24 := yyvsp24 -1
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 258 then
--|#line 2043 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2043")
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
when 259 then
--|#line 2049 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2049")
end

			yyvs45.item (yyvsp45).extend(yyvs39.item (yyvsp39))
			yyval45 := yyvs45.item (yyvsp45)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp39 := yyvsp39 -1
	yyspecial_routines45.force (yyvs45, yyval45, yyvsp45)
end
when 260 then
--|#line 2054 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2054")
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
when 261 then
--|#line 2061 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2061")
end

			if valid_iso8601_time(yyvs4.item (yyvsp4)) then
				create yyval26.make_from_string(yyvs4.item (yyvsp4))
			else
				abort_with_error (ec_VITV, <<yyvs4.item (yyvsp4)>>)
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
when 262 then
--|#line 2071 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2071")
end

			create yyval33.make(0)
			yyval33.extend(yyvs26.item (yyvsp26 - 1))
			yyval33.extend(yyvs26.item (yyvsp26))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp26 := yyvsp26 -2
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
when 263 then
--|#line 2077 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2077")
end

			yyvs33.item (yyvsp33).extend(yyvs26.item (yyvsp26))
			yyval33 := yyvs33.item (yyvsp33)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp26 := yyvsp26 -1
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 264 then
--|#line 2082 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2082")
end

			create yyval33.make(0)
			yyval33.extend(yyvs26.item (yyvsp26))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp26 := yyvsp26 -1
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
when 265 then
--|#line 2089 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2089")
end

			if yyvs26.item (yyvsp26 - 1) <= yyvs26.item (yyvsp26) then
				create {PROPER_INTERVAL [ISO8601_TIME]} yyval38.make_bounded(yyvs26.item (yyvsp26 - 1), yyvs26.item (yyvsp26), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs26.item (yyvsp26 - 1).out, yyvs26.item (yyvsp26).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp26 := yyvsp26 -2
	if yyvsp38 >= yyvsc38 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs38")
		end
		yyvsc38 := yyvsc38 + yyInitial_yyvs_size
		yyvs38 := yyspecial_routines38.aliased_resized_area (yyvs38, yyvsc38)
	end
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 266 then
--|#line 2097 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2097")
end

			if yyvs26.item (yyvsp26 - 1) <= yyvs26.item (yyvsp26) then
				create {PROPER_INTERVAL [ISO8601_TIME]} yyval38.make_bounded(yyvs26.item (yyvsp26 - 1), yyvs26.item (yyvsp26), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs26.item (yyvsp26 - 1).out, yyvs26.item (yyvsp26).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp26 := yyvsp26 -2
	if yyvsp38 >= yyvsc38 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs38")
		end
		yyvsc38 := yyvsc38 + yyInitial_yyvs_size
		yyvs38 := yyspecial_routines38.aliased_resized_area (yyvs38, yyvsc38)
	end
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 267 then
--|#line 2105 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2105")
end

			if yyvs26.item (yyvsp26 - 1) <= yyvs26.item (yyvsp26) then
				create {PROPER_INTERVAL [ISO8601_TIME]} yyval38.make_bounded(yyvs26.item (yyvsp26 - 1), yyvs26.item (yyvsp26), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs26.item (yyvsp26 - 1).out, yyvs26.item (yyvsp26).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp26 := yyvsp26 -2
	if yyvsp38 >= yyvsc38 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs38")
		end
		yyvsc38 := yyvsc38 + yyInitial_yyvs_size
		yyvs38 := yyspecial_routines38.aliased_resized_area (yyvs38, yyvsc38)
	end
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 268 then
--|#line 2113 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2113")
end

			if yyvs26.item (yyvsp26 - 1) <= yyvs26.item (yyvsp26) then
				create {PROPER_INTERVAL [ISO8601_TIME]} yyval38.make_bounded(yyvs26.item (yyvsp26 - 1), yyvs26.item (yyvsp26), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs26.item (yyvsp26 - 1).out, yyvs26.item (yyvsp26).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp26 := yyvsp26 -2
	if yyvsp38 >= yyvsc38 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs38")
		end
		yyvsc38 := yyvsc38 + yyInitial_yyvs_size
		yyvs38 := yyspecial_routines38.aliased_resized_area (yyvs38, yyvsc38)
	end
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 269 then
--|#line 2121 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2121")
end

			create {PROPER_INTERVAL [ISO8601_TIME]} yyval38.make_lower_unbounded(yyvs26.item (yyvsp26), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp26 := yyvsp26 -1
	if yyvsp38 >= yyvsc38 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs38")
		end
		yyvsc38 := yyvsc38 + yyInitial_yyvs_size
		yyvs38 := yyspecial_routines38.aliased_resized_area (yyvs38, yyvsc38)
	end
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 270 then
--|#line 2125 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2125")
end

			create {PROPER_INTERVAL [ISO8601_TIME]} yyval38.make_lower_unbounded(yyvs26.item (yyvsp26), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp26 := yyvsp26 -1
	if yyvsp38 >= yyvsc38 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs38")
		end
		yyvsc38 := yyvsc38 + yyInitial_yyvs_size
		yyvs38 := yyspecial_routines38.aliased_resized_area (yyvs38, yyvsc38)
	end
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 271 then
--|#line 2129 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2129")
end

			create {PROPER_INTERVAL [ISO8601_TIME]} yyval38.make_upper_unbounded(yyvs26.item (yyvsp26), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp26 := yyvsp26 -1
	if yyvsp38 >= yyvsc38 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs38")
		end
		yyvsc38 := yyvsc38 + yyInitial_yyvs_size
		yyvs38 := yyspecial_routines38.aliased_resized_area (yyvs38, yyvsc38)
	end
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 272 then
--|#line 2133 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2133")
end

			create {PROPER_INTERVAL [ISO8601_TIME]} yyval38.make_upper_unbounded(yyvs26.item (yyvsp26), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp26 := yyvsp26 -1
	if yyvsp38 >= yyvsc38 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs38")
		end
		yyvsc38 := yyvsc38 + yyInitial_yyvs_size
		yyvs38 := yyspecial_routines38.aliased_resized_area (yyvs38, yyvsc38)
	end
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 273 then
--|#line 2137 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2137")
end

			create {POINT_INTERVAL [ISO8601_TIME]} yyval38.make (yyvs26.item (yyvsp26))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp26 := yyvsp26 -1
	if yyvsp38 >= yyvsc38 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs38")
		end
		yyvsc38 := yyvsc38 + yyInitial_yyvs_size
		yyvs38 := yyspecial_routines38.aliased_resized_area (yyvs38, yyvsc38)
	end
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 274 then
--|#line 2143 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2143")
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
when 275 then
--|#line 2149 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2149")
end

			yyvs44.item (yyvsp44).extend(yyvs38.item (yyvsp38))
			yyval44 := yyvs44.item (yyvsp44)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp38 := yyvsp38 -1
	yyspecial_routines44.force (yyvs44, yyval44, yyvsp44)
end
when 276 then
--|#line 2154 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2154")
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
when 277 then
--|#line 2161 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2161")
end

			if valid_iso8601_date_time(yyvs4.item (yyvsp4)) then
				create yyval25.make_from_string(yyvs4.item (yyvsp4))
			else
				abort_with_error (ec_VIDTV, <<yyvs4.item (yyvsp4)>>)
			end
		
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
when 278 then
--|#line 2171 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2171")
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
when 279 then
--|#line 2177 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2177")
end

			yyvs34.item (yyvsp34).extend(yyvs25.item (yyvsp25))
			yyval34 := yyvs34.item (yyvsp34)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp25 := yyvsp25 -1
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 280 then
--|#line 2182 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2182")
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
when 281 then
--|#line 2189 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2189")
end

			if yyvs25.item (yyvsp25 - 1) <= yyvs25.item (yyvsp25) then
				create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval40.make_bounded(yyvs25.item (yyvsp25 - 1), yyvs25.item (yyvsp25), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs25.item (yyvsp25 - 1).out, yyvs25.item (yyvsp25).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp25 := yyvsp25 -2
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 282 then
--|#line 2197 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2197")
end

			if yyvs25.item (yyvsp25 - 1) <= yyvs25.item (yyvsp25) then
				create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval40.make_bounded(yyvs25.item (yyvsp25 - 1), yyvs25.item (yyvsp25), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs25.item (yyvsp25 - 1).out, yyvs25.item (yyvsp25).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp25 := yyvsp25 -2
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 283 then
--|#line 2205 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2205")
end

			if yyvs25.item (yyvsp25 - 1) <= yyvs25.item (yyvsp25) then
				create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval40.make_bounded(yyvs25.item (yyvsp25 - 1), yyvs25.item (yyvsp25), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs25.item (yyvsp25 - 1).out, yyvs25.item (yyvsp25).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp25 := yyvsp25 -2
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 284 then
--|#line 2213 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2213")
end

			if yyvs25.item (yyvsp25 - 1) <= yyvs25.item (yyvsp25) then
				create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval40.make_bounded(yyvs25.item (yyvsp25 - 1), yyvs25.item (yyvsp25), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs25.item (yyvsp25 - 1).out, yyvs25.item (yyvsp25).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp25 := yyvsp25 -2
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 285 then
--|#line 2221 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2221")
end

			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval40.make_lower_unbounded(yyvs25.item (yyvsp25), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp25 := yyvsp25 -1
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 286 then
--|#line 2225 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2225")
end

			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval40.make_lower_unbounded(yyvs25.item (yyvsp25), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp25 := yyvsp25 -1
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 287 then
--|#line 2229 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2229")
end

			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval40.make_upper_unbounded(yyvs25.item (yyvsp25), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp25 := yyvsp25 -1
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 288 then
--|#line 2233 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2233")
end

			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval40.make_upper_unbounded(yyvs25.item (yyvsp25), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp25 := yyvsp25 -1
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 289 then
--|#line 2237 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2237")
end

			create {POINT_INTERVAL [ISO8601_DATE_TIME]} yyval40.make (yyvs25.item (yyvsp25))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp25 := yyvsp25 -1
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 290 then
--|#line 2243 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2243")
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
when 291 then
--|#line 2249 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2249")
end

			yyvs46.item (yyvsp46).extend(yyvs40.item (yyvsp40))
			yyval46 := yyvs46.item (yyvsp46)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp40 := yyvsp40 -1
	yyspecial_routines46.force (yyvs46, yyval46, yyvsp46)
end
when 292 then
--|#line 2254 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2254")
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
when 293 then
--|#line 2261 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2261")
end

			if valid_iso8601_duration(yyvs4.item (yyvsp4)) then
				create yyval27.make_from_string(yyvs4.item (yyvsp4))
			else
				abort_with_error (ec_VIDUV, <<yyvs4.item (yyvsp4)>>)
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
when 294 then
--|#line 2271 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2271")
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
when 295 then
--|#line 2277 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2277")
end

			yyvs35.item (yyvsp35).extend(yyvs27.item (yyvsp27))
			yyval35 := yyvs35.item (yyvsp35)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp27 := yyvsp27 -1
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 296 then
--|#line 2282 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2282")
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
when 297 then
--|#line 2289 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2289")
end

			if yyvs27.item (yyvsp27 - 1) <= yyvs27.item (yyvsp27) then
				create {PROPER_INTERVAL [ISO8601_DURATION]} yyval41.make_bounded(yyvs27.item (yyvsp27 - 1), yyvs27.item (yyvsp27), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs27.item (yyvsp27 - 1).out, yyvs27.item (yyvsp27).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp27 := yyvsp27 -2
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 298 then
--|#line 2297 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2297")
end

			if yyvs27.item (yyvsp27 - 1) <= yyvs27.item (yyvsp27) then
				create {PROPER_INTERVAL [ISO8601_DURATION]} yyval41.make_bounded(yyvs27.item (yyvsp27 - 1), yyvs27.item (yyvsp27), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs27.item (yyvsp27 - 1).out, yyvs27.item (yyvsp27).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp27 := yyvsp27 -2
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 299 then
--|#line 2305 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2305")
end

			if yyvs27.item (yyvsp27 - 1) <= yyvs27.item (yyvsp27) then
				create {PROPER_INTERVAL [ISO8601_DURATION]} yyval41.make_bounded(yyvs27.item (yyvsp27 - 1), yyvs27.item (yyvsp27), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs27.item (yyvsp27 - 1).out, yyvs27.item (yyvsp27).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp27 := yyvsp27 -2
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 300 then
--|#line 2313 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2313")
end

			if yyvs27.item (yyvsp27 - 1) <= yyvs27.item (yyvsp27) then
				create {PROPER_INTERVAL [ISO8601_DURATION]} yyval41.make_bounded(yyvs27.item (yyvsp27 - 1), yyvs27.item (yyvsp27), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs27.item (yyvsp27 - 1).out, yyvs27.item (yyvsp27).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp27 := yyvsp27 -2
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 301 then
--|#line 2321 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2321")
end

			create {PROPER_INTERVAL [ISO8601_DURATION]} yyval41.make_lower_unbounded(yyvs27.item (yyvsp27), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp27 := yyvsp27 -1
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 302 then
--|#line 2325 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2325")
end

			create {PROPER_INTERVAL [ISO8601_DURATION]} yyval41.make_lower_unbounded(yyvs27.item (yyvsp27), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp27 := yyvsp27 -1
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 303 then
--|#line 2329 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2329")
end

			create {PROPER_INTERVAL [ISO8601_DURATION]} yyval41.make_upper_unbounded(yyvs27.item (yyvsp27), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp27 := yyvsp27 -1
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 304 then
--|#line 2333 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2333")
end

			create {PROPER_INTERVAL [ISO8601_DURATION]} yyval41.make_upper_unbounded(yyvs27.item (yyvsp27), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp27 := yyvsp27 -1
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 305 then
--|#line 2337 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2337")
end

			create {POINT_INTERVAL [ISO8601_DURATION]} yyval41.make (yyvs27.item (yyvsp27))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp27 := yyvsp27 -1
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 306 then
--|#line 2343 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2343")
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
when 307 then
--|#line 2349 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2349")
end

			yyvs47.item (yyvsp47).extend(yyvs41.item (yyvsp41))
			yyval47 := yyvs47.item (yyvsp47)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp41 := yyvsp41 -1
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
when 308 then
--|#line 2354 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2354")
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
			when 541 then
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
			   86,   87,   79,   77,   89,   78,    2,   80,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,   85,   88,
			    2,   71,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,   84,    2,    2,    2,    2,    2,

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
			    0,  168,  168,  168,  101,  103,  102,  102,  102,  102,
			   96,   96,  169,  169,  169,  172,  172,  172,  172,  105,
			  105,  105,  105,  105,  105,   94,   94,   94,  108,  108,
			  107,  106,  106,  106,  106,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  170,  171,  171,  173,  173,  173,
			  109,  174,  174,  174,   91,   91,   92,   92,   90,   90,
			   93,   93,   93,   93,  110,  110,  111,  111,  112,  112,
			  112,  112,  118,  119,  119,  114,  114,  114,  114,  115,
			  154,  154,  154,  154,  121,  121,  116,  122,  122,  113,
			  113,  117,  120,  120,  120,  153,  153,  153,  153,  153,

			  153,  152,  152,  152,  152,  152,   98,   98,  100,  100,
			  155,  155,  156,  156,  156,  156,  156,  156,  156,  156,
			   97,   97,   97,   99,   99,   99,   99,  166,  166,  166,
			  166,  166,  166,  165,  165,  165,  165,  165,  165,  163,
			  163,  163,  163,  163,  163,  163,  164,  164,  164,  164,
			  164,  164,  164,  161,  161,  161,  161,  161,  161,  161,
			  162,  162,  162,  162,  162,  162,  162,  162,  162,  162,
			  160,  160,  160,  160,  160,  167,  167,  167,  167,  167,
			  167,  167,  167,  159,  159,  159,  159,  159,  157,  157,
			  157,  157,  158,  158,  158,  130,  130,   95,   95,  131,

			  132,  132,  132,  132,  123,  123,  123,  133,  133,  133,
			  140,  140,  140,  140,  140,  140,  140,  140,  140,  146,
			  146,  146,  124,  124,  124,  134,  134,  134,  141,  141,
			  141,  141,  141,  141,  141,  141,  141,  147,  147,  147,
			  125,  125,  135,  135,  135,  126,  136,  136,  136,  143,
			  143,  143,  143,  143,  143,  143,  143,  143,  149,  149,
			  149,  128,  137,  137,  137,  142,  142,  142,  142,  142,
			  142,  142,  142,  142,  148,  148,  148,  127,  138,  138,
			  138,  144,  144,  144,  144,  144,  144,  144,  144,  144,
			  150,  150,  150,  129,  139,  139,  139,  145,  145,  145,

			  145,  145,  145,  145,  145,  145,  151,  151,  151, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    4,    4,    4,    4,    4,    3,    2,    1,    8,    9,
			    4,   11,   14,   14,   14,   19,   19,   19,   19,   20,
			   21,   21,   21,   21,   21,   22,   22,   19,    2,    3,
			    4,   19,   19,    3,    2,    3,    2,    1,    4,    4,
			    1,    4,    4,    1,    1,    9,    4,    4,    4,    4,
			    1,   12,    1,    1,    1,    1,    1,    4,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    4,
			    4,    1,    1,    1,   19,    1,    1,    4,    1,    1,
			    1,   19,    1,    4,   19,   19,    1,   19,    1,    1,

			    1,    1,    4,    4,    4,    4,    4,    4,    4,    4,
			    4,    4,    1,    1,    1,    1,    5,    5,    4,    4,
			    4,   15,    2,    3,   23,   24,   25,   26,   27,   28,
			   29,   30,   31,   32,   33,   34,   35,   36,   37,   38,
			   39,   40,   41,   42,   43,   44,   45,   46,   47,   51,
			   52,   53,   54,   55,   56,   57,   58,   59,   15,   59,
			    1,    1,    4,    1,   18,    1,    1,    1,    1,   19,
			    1,    1,    1,    1,    2,    3,   24,   25,   26,   27,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    2,   13,    2,    1,   12,    1,    1,
			    1,    2,    3,   24,   25,   26,   27,    2,    3,   24,
			   25,   26,   27,    2,    3,   24,   25,   26,   27,    2,
			    3,   24,   25,   26,   27,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,   27,   41,
			    1,    4,    1,    2,    1,    1,    1,    3,    1,    1,
			    1,   23,    1,   24,    1,   25,    1,   26,    1,   27,
			    1,    4,    2,    3,   23,   24,   26,   25,   27,    1,

			    1,   36,    1,    1,   37,    1,    1,   38,    1,    1,
			   39,    1,    1,   40,    1,   41,   36,   37,   38,   39,
			   40,   41,    1,   23,    4,    1,    4,    1,   25,    1,
			   27,    1,   24,    1,   26,    1,    3,    1,    2,    1,
			    1,    1,    1,   48,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    2,    1,    3,    1,
			   24,    1,   25,    1,   26,    1,   27,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    1,    1,    1,    1,    1,    7,    1,
			   10,    4,   11,   14,   15,   16,   17,   17,   17,    2,
			   14,   50,    1,    1,    1,    1,    2,    1,    3,    1,
			   24,    1,   25,    1,   26,    1,   27,    2,    1,    3,
			    1,   24,    1,   25,    1,   26,    1,   27,    1,    2,
			   13,    1,    1,    4,    1,    4,    1,    4,   16,    2,
			   12,    1,    1,    1,    1,    1,    1,    1,    2,    1,
			    3,    1,   24,    1,   25,    1,   26,    1,   27,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,   13,   49,

			    4,   12,    4,    4,    1,    1,    5,    4,   50,    1,
			    2,    1,    1,    1,    1,    1,    1,    2,    1,    1,
			   12,    4,    1,    1,    8,    1,    1,    1,    4,    8,
			    1,    8,    1,    1,    1,    8,    1,    1,    1,    1,
			    1,    1,    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER]
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    2,    3,    4,    4,    4,    4,    4,
			    4,    4,    4,    4,    4,    5,    5,    1,    1,    1,
			    1,    4,    4,    4,    6,    4,    4,    4,    4,    4,
			    4,    4,    4,    4,    4,    7,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER]
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,   85,   84,
			    0,   94,  196,  198,  197,  222,  204,    3,    2,   58,
			  195,    0,    1,  120,    0,   61,   65,   64,   87,   66,
			   67,   71,   88,   62,   69,   89,   68,    0,   92,   93,
			    0,    0,    0,  224,  206,  223,  205,    0,   76,   75,
			   78,   11,   10,    0,    0,   59,  195,    7,    6,    0,
			    0,    5,    0,   81,   82,   80,   83,    0,  105,  101,
			  102,  104,  103,   99,   97,  100,   98,   96,   95,    0,
			    0,    0,   70,   90,    0,    0,    0,    8,    0,  122,
			    0,   79,    0,   94,   91,   86,   63,   60,   77,  241,

			  240,    0,  169,  162,  139,  146,  153,  293,  277,  261,
			  245,  172,  182,  180,  179,  181,  178,  177,  176,  175,
			  170,    0,  127,  133,    0,  140,  154,  147,  163,  171,
			  128,  134,  185,  141,  148,  155,  164,  129,  135,  149,
			  142,  156,  165,  130,  136,  150,  143,  157,  166,   43,
			   41,   39,   40,   37,   38,   36,   35,   42,    0,    0,
			    0,   44,  106,   14,   48,    0,   12,   13,   45,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,   72,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,   73,   74,
			  124,    0,    0,  204,    0,  123,    0,  110,    0,    4,
			   46,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,  218,    0,  236,    0,
			  257,    0,  289,    0,  273,    0,  305,    0,  161,  160,
			  203,  200,  209,  207,    0,    0,  227,  225,  244,  241,
			  240,  242,  248,  246,  280,  278,  264,  262,  296,  294,
			  202,  201,  208,  226,  243,  247,  263,  279,  295,  221,

			    0,  219,  239,    0,  237,  276,    0,  274,  260,    0,
			  258,  292,    0,  290,  308,  306,  220,  238,  275,  259,
			  291,  307,  187,  186,  199,  174,  173,  159,  158,  168,
			  167,  145,  144,  152,  151,  138,  137,  132,  131,    0,
			  121,    0,    0,   50,    0,  217,  235,  256,  288,  272,
			  304,  215,  233,  254,  286,  270,  302,    0,  216,    0,
			  234,    0,  255,    0,  287,    0,  271,    0,  303,  214,
			  232,  253,  285,  269,  301,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  126,  125,    0,    0,    0,    0,   24,   23,   18,
			   20,    9,    0,   19,   17,   15,  120,   29,   21,  127,
			   22,  188,   53,   51,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  210,    0,
			  228,    0,  249,    0,  281,    0,  265,    0,  297,  108,
			    0,    0,   27,  120,   34,   33,   49,    9,   16,    0,
			   30,    0,    0,    0,    0,   47,   18,   52,    0,  211,
			    0,  229,    0,  250,    0,  282,    0,  266,    0,  298,
			  212,  230,  251,  283,  267,  299,    0,  107,  112,    0,

			  120,    0,   31,    7,   54,  194,  192,  193,  189,  191,
			  190,  213,  231,  252,  284,  268,  300,  109,    0,  111,
			    0,   26,   32,    0,   56,  115,  113,  114,   25,   55,
			    0,    0,    0,    0,    0,   57,   28,  118,  119,  116,
			  117,    0,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			   18,  524,  531,   19,  420,   56,   21,   61,  227,  224,
			  460,  423,   23,   24,  424,  425,  426,  427,  428,  164,
			   25,   26,   27,   28,   29,   30,   31,   32,   33,   34,
			   35,   36,   37,   38,   39,  124,  125,  126,  127,  128,
			   40,  326,  129,  130,  131,  132,  133,  134,  135,  136,
			  137,  138,  139,  140,  141,  142,  143,  144,  145,  146,
			  147,  148,   79,   80,   67,  343,  499,  430,  431,  149,
			  150,  151,  152,  153,  154,  155,  156,  157,  541,  165,
			  166,  167,  433,  168,  434, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			  557,  117,  591,  587,   -8,   43,  736,  711, -32768, -32768,
			  777,  774, -32768, -32768, -32768, -32768, -32768, -32768,  578, -32768,
			  197,  583, -32768,  311,  773,  473, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768,  353, -32768, -32768,
			  645,  277,  408, -32768, -32768, -32768, -32768,  117, -32768, -32768,
			 -32768, -32768, -32768,  788,  787, -32768, -32768, -32768, -32768,  707,
			   10, -32768,  775, -32768, -32768, -32768, -32768,  158, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,   64,
			   64,  142, -32768, -32768,  271,  776,  776, -32768,  751, -32768,
			   23, -32768,   64, -32768, -32768,  421, -32768,  473, -32768,  515,

			  435,  220, -32768,  636, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			  734,  693,  733,  732,  731,  730,  726,  725,  724,  722,
			  710,  709,  698,  697,  695,  694,  687,  686,  685,  684,
			  683,  682,  681,  680,  679,  678,  677,  673,  659,  658,
			  657,  637,  635,  633,  632,  631,  629, -32768,  675,  671,
			    2, -32768,  667, -32768,  655,  669, -32768,  699, -32768,  488,
			  212,  212,  212,  212,  457,  456,  451,  407,  406,  394,
			    3,  161, -32768,  175,    6,  273,  111,  141,  215,  255,
			  159,  104,  144,  545,  592,  584,  585,  577,  115,   95,

			   61,   -2,   -5,   -6,  665,  664,  663,  662,  661,  660,
			  231,   36,   27,   20,  236,   25,   52,   38, -32768, -32768,
			 -32768,  696,  692,  642,  643, -32768,  641,  616,  630, -32768,
			 -32768,  640,  639,  638,  628,  626,  618,  614,  613,  612,
			  611,  610,  609,  364,  355,  345,  341,  261,  218,  605,
			  604,  602,  601,  600,  599,  153, -32768,  182, -32768,   -9,
			 -32768,  129, -32768,    9, -32768,   98, -32768,   -4, -32768, -32768,
			 -32768, -32768, -32768, -32768,  634,  627, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,

			  202, -32768, -32768,  296, -32768, -32768,  313, -32768, -32768,  257,
			 -32768, -32768,  338, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,   54,
			 -32768,  595,  594, -32768,  656, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768,  119, -32768,  156,
			 -32768,  -13, -32768,  116, -32768,   -7, -32768,  -14, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768,  104,  597,  144,  596,  592,
			  593,  585,  590,  584,  589,  577,  588,  577,  577,  577,
			  577,  104,  104,  104,  104,  144,  144,  144,  144,  584,

			  584,  584,  584,  592,  592,  592,  592,  585,  585,  585,
			  585, -32768, -32768,  623,  586,  521,  509, -32768, -32768,  579,
			 -32768,  566,  344, -32768, -32768, -32768,  311,  571, -32768,  -28,
			  371, -32768, -32768, -32768,  723,  104,  582,  144,  581,  592,
			  574,  585,  572,  584,  570,  577,  569,  568, -32768,  567,
			 -32768,  565, -32768,  564, -32768,  562, -32768,  538, -32768,  508,
			  533,    2, -32768,  276, -32768,  541, -32768,  390, -32768,  485,
			 -32768,  517,  489,  104,   26, -32768, -32768, -32768,  466, -32768,
			  434, -32768,  402, -32768,  365, -32768,  357, -32768,  342, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768,  374, -32768,  287,  329,

			  311,  333,  293, -32768,  267, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  370, -32768,
			  151, -32768, -32768,  578,  264,  166,  113,  100, -32768,  578,
			  578,   13,  222,  103,  101,  578, -32768, -32768, -32768, -32768,
			 -32768,   33,   31, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -266, -32768, -32768,  -18, -32768,    1, -335, -309, -32768,  376,
			 -32768,  836, -32768, -32768,  511,  413, -32768, -32768, -32768, -32768,
			   15, -32768,  767,  753, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768,    5,  -83,  -78,  183,    4,  -47,  -97,  -61,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			  274,  149,   85,   44,   80, -161, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  358, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768,  743, -32768, -32768,
			  484, -32768,  326,  666, -32768, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   55,   20,  122,  122,  178,  223,   42,  123,  123,  422,
			   15,   89,  472,  110,   48,  107,   41,  110,  174,  269,
			  109,  329,   59,  175,  163,  107,  333,  509,  327,   16,
			  162,  543,  107,  542,  267,  312,  109,  325,  309,  337,
			  179,   16,  315,  267,   50,  324,  314,  311,  321,  107,
			  308,  536,  109,  335,  177,  108,   15,   16,  276,  445,
			  439,  183,   84,   88,  379,   49,  443,   16,   15,  390,
			  389,  388,  387,  235,  241,  247,  253,  225,   47,  222,
			  221,  220,  383,  275,  274,   95,   93,  231,  237,  243,
			  249,  287,  232,  238,  244,  250,   97,  169,  296,  422,

			  273,  306,  161,  222,  221,  176,  277,   16,  292,  236,
			  242,  248,  254,  305,  293,  222,  221,  470,  334,  268,
			   16,   15,   16,  234,  240,  246,  252,  107,  289,  275,
			  274,  222,  221,  411,  338,  303,  298,  110,  336,   11,
			  285,    3,    2,   96,  108,   16,   15,  302,   15,  297,
			   92,  540,  330,  539,  501,  300,   16,  108,    9,    8,
			   15,   16,   15,  282,   11,  328,  384,  299,  291,  108,
			  271,  385,  376,  528,  233,  239,  245,  251,   16,  378,
			   11,  222,  221,    9,    8,    5,   15,    4,  534,  441,
			  283,  520,  435,  284,    3,    2,  222,  221,  295,    9,

			    8,  533,  381,    1,  386,   16,  179,   58,   57,  178,
			    5,  290,    4,  270,  382,   16,   15,  174,  332,    3,
			    2,  275,  274,   16,   15,  175,  375,  272,    1,  437,
			  222,  221,  322,  275,  274,    3,    2,  331,  110,  109,
			  108,  107,  109,   -9,    1,  310,  110,  109,  108,  107,
			   -9,  319,  222,  221,  532,  377,  412,  529,  368,  275,
			  274,  429,  110,  380,  535,  177,  123,  286,  444,  367,
			  538,  537,  280,  279,  436,  394,  393,  392,  391,  222,
			  221,  438,  313,  110,  107,  307,  455,  500,  320,    3,
			    2,  318,  447,  173,  172,  171,  170,    3,    2,  449,

			   15,  366,  235,  241,  247,  253,  446,  288,  231,  237,
			  243,  249,  365,  176,  280,  279,  442,  232,  238,  244,
			  250,  530,   60,  523,  457,  278,  236,  242,  248,  254,
			  406,  405,  404,  403,  453,   66,   65,   64,   63,  469,
			  109,   66,   65,   64,   63,  421,  486,   16,  304,   14,
			   13,  429,  478,  522,  317,  521,  123,   60,   98,  480,
			  234,  240,  246,  252,   82,  440,  108,  519,  281,  398,
			  397,  396,  395,  275,  274,  518,  294,  517,  225,  418,
			  417,  364,  516,  451,  488,  362,  402,  401,  400,  399,
			  469,  510,  363,  323,  484,  360,  361,  515,  416,  415,

			   58,  503,    7,    6,  358,  514,  359,  233,  239,  245,
			  251,  410,  409,  408,  407,  357,  463,  465,  527,  526,
			  525,  222,  221,  467,   78,   77,   76,   75,   74,   73,
			   72,   71,   70,   69,  266,  421, -183,   68, -183, -183,
			 -183, -183,  513,  482, -183,  265,  264,  262, -183, -183,
			 -183, -183, -183, -183, -183, -183, -183,  263,  261,  474,
			  473, -183, -183, -183, -183, -183, -183, -183, -183, -183,
			 -183, -183,  301, -183,  512, -183, -183, -183,  316,   78,
			   77,   76,   75,   74,   73,   72,   71,   70,   69, -183,
			 -183,  260,   68, -183, -183,   83,  258,  256,   72,   71,

			   70,   69,  259,  507,  506,   68,  511,  257,  255,  505,
			  464,   55, -183, -183,   14,   13, -184,   55, -184, -184,
			 -184, -184,  462, -183, -184,  472,   14,   13, -184, -184,
			 -184, -184, -184, -184, -184, -184, -184,   66,   65,   64,
			   63, -184, -184, -184, -184, -184, -184, -184, -184, -184,
			 -184, -184,  502, -184,  504, -184, -184, -184,   17,  496,
			   16,   15,   14,   13,   12,   72,   71,   70,   69, -184,
			 -184,  497,   68, -184, -184,   83,   58,   57,  495,   11,
			   10,   16,   15,   14,   13,   12,  280,  279,   14,   13,
			   46,   45, -184, -184,   44,   43,  121,  158,    9,    8,

			   11,   10,  494, -184,  493,  492,  107,  491,  490,  489,
			  487,  109,  485,  108,  483,    7,    6,  466,  110,    9,
			    8,  481,  479,  461,  471,    5,  459,    4,  458,  456,
			  454,   45,  413,  452,    3,    2,  450,  448,   43,  374,
			  373,  372,  371,    1,  370,  369,    5,  414,    4,  356,
			  355,  354,  353,  352,  351,    3,    2,  419,  350,   16,
			   15,   14,   13,  342,    1,  120,  349,  344,  348,  119,
			  118,  117,  116,  115,  114,  113,  112,  111,  347,  346,
			  345,  340,  110,  109,  108,  107,  106,  105,  104,  103,
			  102,  418,  417,  339,  341,   46,  101,  100,   99,   44,

			  267,  312,  309,  306,  303,  300,  162,  229,  228,  219,
			  416,  415,  226,  218,    7,    6,  180,  217,   87,  216,
			  215,  214,   52,  213,  476,  212,   16,   15,   14,   13,
			   81,  182,  120,    3,    2,  161,  119,  118,  117,  116,
			  115,  114,  113,  112,  111,  211,  210,   51,  209,  110,
			  109,  108,  107,  106,  105,  104,  103,  102,  418,  417,
			  477,  475,  208,  101,  100,   99,  207,  206,  205,  204,
			  203,  202,  201,  200,  199,  198,  197,  416,  415,   16,
			   15,    7,    6,  196,  195,  120,  194,  193,  160,  119,
			  118,  117,  116,  115,  114,  113,  112,  111,  192,  191,

			    3,    2,  110,  109,  108,  107,  106,  105,  104,  103,
			  102,  190,   90,  189,  188,  187,  101,  100,   99,  186,
			  185,  184,  183,  181,   86,   85,   62,   54,  432,  159,
			   53,  508,   94,  230,   91,  468,   22,  498,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    3,    2, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			   18,    0,   85,   86,  101,    3,    1,   85,   86,  344,
			    4,    1,   40,   26,   22,   29,    1,   26,  101,  180,
			   27,    1,   21,  101,    1,   29,    1,    1,    1,    3,
			    7,    0,   29,    0,   40,   40,   27,    1,   40,    1,
			  101,    3,  203,   40,    1,    9,   52,   52,  209,   29,
			   52,   38,   27,    1,  101,   28,    4,    3,   52,   73,
			   73,   89,   47,   53,   73,   22,   73,    3,    4,   73,
			   74,   75,   76,  170,  171,  172,  173,  160,   86,   77,
			   78,   79,   73,   77,   78,   80,   22,  170,  171,  172,
			  173,  188,  170,  171,  172,  173,   81,   92,  195,  434,

			  183,   40,   79,   77,   78,  101,  184,    3,  191,  170,
			  171,  172,  173,   52,  192,   77,   78,  426,  215,  180,
			    3,    4,    3,  170,  171,  172,  173,   29,  189,   77,
			   78,   77,   78,   79,  217,   40,  197,   26,  216,   22,
			  187,   77,   78,    1,   28,    3,    4,   52,    4,  196,
			   86,   50,  213,   50,  463,   40,    3,   28,   41,   42,
			    4,    3,    4,   52,   22,  212,  263,   52,    9,   28,
			    9,   73,  255,   22,  170,  171,  172,  173,    3,  257,
			   22,   77,   78,   41,   42,   68,    4,   70,   88,   73,
			  186,  500,   73,   52,   77,   78,   77,   78,  194,   41,

			   42,   88,   73,   86,  265,    3,  267,   10,   11,  306,
			   68,   52,   70,   52,  261,    3,    4,  300,  214,   77,
			   78,   77,   78,    3,    4,  303,   73,   52,   86,   73,
			   77,   78,    1,   77,   78,   77,   78,    1,   26,   27,
			   28,   29,   27,   46,   86,  201,   26,   27,   28,   29,
			   53,  207,   77,   78,   88,   73,  339,  523,   40,   77,
			   78,  344,   26,  259,  530,  312,  344,   52,  365,   51,
			   48,   49,   41,   42,  357,   73,   74,   75,   76,   77,
			   78,  359,  202,   26,   29,  200,  383,   11,  208,   77,
			   78,  206,  375,   73,   74,   75,   76,   77,   78,  377,

			    4,   40,  399,  400,  401,  402,  367,   52,  391,  392,
			  393,  394,   51,  309,   41,   42,  363,  395,  396,  397,
			  398,   57,   46,   56,  385,   52,  387,  388,  389,  390,
			   73,   74,   75,   76,  381,   64,   65,   66,   67,  422,
			   27,   64,   65,   66,   67,  344,  443,    3,  199,    5,
			    6,  434,  435,   60,  205,   22,  434,   46,   87,  437,
			  407,  408,  409,  410,   87,  361,   28,   38,  185,   73,
			   74,   75,   76,   77,   78,   88,  193,    3,  461,   35,
			   36,   40,   40,  379,  445,   40,   73,   74,   75,   76,
			  473,  474,   51,  210,  441,   40,   51,   40,   54,   55,

			   10,   11,   58,   59,   40,   40,   51,  403,  404,  405,
			  406,   73,   74,   75,   76,   51,  415,  416,   48,   49,
			   50,   77,   78,  422,   71,   72,   73,   74,   75,   76,
			   77,   78,   79,   80,   40,  434,    1,   84,    3,    4,
			    5,    6,   40,  439,    9,   51,   40,   40,   13,   14,
			   15,   16,   17,   18,   19,   20,   21,   51,   51,   88,
			   89,   26,   27,   28,   29,   30,   31,   32,   33,   34,
			   35,   36,  198,   38,   40,   40,   41,   42,  204,   71,
			   72,   73,   74,   75,   76,   77,   78,   79,   80,   54,
			   55,   40,   84,   58,   59,   87,   40,   40,   77,   78,

			   79,   80,   51,   14,   15,   84,   40,   51,   51,   20,
			    1,  529,   77,   78,    5,    6,    1,  535,    3,    4,
			    5,    6,    1,   88,    9,   40,    5,    6,   13,   14,
			   15,   16,   17,   18,   19,   20,   21,   64,   65,   66,
			   67,   26,   27,   28,   29,   30,   31,   32,   33,   34,
			   35,   36,   11,   38,   37,   40,   41,   42,    1,   51,
			    3,    4,    5,    6,    7,   77,   78,   79,   80,   54,
			   55,   38,   84,   58,   59,   87,   10,   11,   40,   22,
			   23,    3,    4,    5,    6,    7,   41,   42,    5,    6,
			    3,    4,   77,   78,    3,    4,   85,   86,   41,   42,

			   22,   23,   40,   88,   40,   40,   29,   40,   40,   40,
			   40,   27,   40,   28,   40,   58,   59,   38,   26,   41,
			   42,   40,   40,   37,   53,   68,    3,   70,   40,   40,
			   40,    4,   37,   40,   77,   78,   40,   40,    4,   40,
			   40,   40,   40,   86,   40,   40,   68,   53,   70,   40,
			   40,   40,   40,   40,   40,   77,   78,    1,   40,    3,
			    4,    5,    6,   47,   86,    9,   40,   37,   40,   13,
			   14,   15,   16,   17,   18,   19,   20,   21,   40,   40,
			   40,   38,   26,   27,   28,   29,   30,   31,   32,   33,
			   34,   35,   36,   51,   53,    3,   40,   41,   42,    3,

			   40,   40,   40,   40,   40,   40,    7,   38,   53,   38,
			   54,   55,   45,   38,   58,   59,   80,   88,   11,   88,
			   88,   88,   11,   88,    1,   88,    3,    4,    5,    6,
			   85,   38,    9,   77,   78,   79,   13,   14,   15,   16,
			   17,   18,   19,   20,   21,   88,   88,   11,   89,   26,
			   27,   28,   29,   30,   31,   32,   33,   34,   35,   36,
			  434,   38,   89,   40,   41,   42,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,   89,   54,   55,    3,
			    4,   58,   59,   89,   89,    9,   89,   89,   37,   13,
			   14,   15,   16,   17,   18,   19,   20,   21,   89,   89,

			   77,   78,   26,   27,   28,   29,   30,   31,   32,   33,
			   34,   89,   37,   89,   89,   89,   40,   41,   42,   89,
			   89,   89,   89,   89,   37,   37,   53,   53,  344,   86,
			   53,  473,   79,  167,   67,  422,    0,  461,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   77,   78, yyDummy>>)
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

	yyvs7: SPECIAL [C_DV_QUANTITY]
			-- Stack for semantic values of type C_DV_QUANTITY

	yyvsc7: INTEGER
			-- Capacity of semantic value stack `yyvs7'

	yyvsp7: INTEGER
			-- Top of semantic value stack `yyvs7'

	yyspecial_routines7: KL_SPECIAL_ROUTINES [C_DV_QUANTITY]
			-- Routines that ought to be in SPECIAL [C_DV_QUANTITY]

	yyvs8: SPECIAL [detachable ARRAYED_LIST [ASSERTION]]
			-- Stack for semantic values of type detachable ARRAYED_LIST [ASSERTION]

	yyvsc8: INTEGER
			-- Capacity of semantic value stack `yyvs8'

	yyvsp8: INTEGER
			-- Top of semantic value stack `yyvs8'

	yyspecial_routines8: KL_SPECIAL_ROUTINES [detachable ARRAYED_LIST [ASSERTION]]
			-- Routines that ought to be in SPECIAL [detachable ARRAYED_LIST [ASSERTION]]

	yyvs9: SPECIAL [ASSERTION]
			-- Stack for semantic values of type ASSERTION

	yyvsc9: INTEGER
			-- Capacity of semantic value stack `yyvs9'

	yyvsp9: INTEGER
			-- Top of semantic value stack `yyvs9'

	yyspecial_routines9: KL_SPECIAL_ROUTINES [ASSERTION]
			-- Routines that ought to be in SPECIAL [ASSERTION]

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

	yyvs12: SPECIAL [detachable MULTIPLICITY_INTERVAL]
			-- Stack for semantic values of type detachable MULTIPLICITY_INTERVAL

	yyvsc12: INTEGER
			-- Capacity of semantic value stack `yyvs12'

	yyvsp12: INTEGER
			-- Top of semantic value stack `yyvs12'

	yyspecial_routines12: KL_SPECIAL_ROUTINES [detachable MULTIPLICITY_INTERVAL]
			-- Routines that ought to be in SPECIAL [detachable MULTIPLICITY_INTERVAL]

	yyvs13: SPECIAL [MULTIPLICITY_INTERVAL]
			-- Stack for semantic values of type MULTIPLICITY_INTERVAL

	yyvsc13: INTEGER
			-- Capacity of semantic value stack `yyvs13'

	yyvsp13: INTEGER
			-- Top of semantic value stack `yyvs13'

	yyspecial_routines13: KL_SPECIAL_ROUTINES [MULTIPLICITY_INTERVAL]
			-- Routines that ought to be in SPECIAL [MULTIPLICITY_INTERVAL]

	yyvs14: SPECIAL [C_COMPLEX_OBJECT]
			-- Stack for semantic values of type C_COMPLEX_OBJECT

	yyvsc14: INTEGER
			-- Capacity of semantic value stack `yyvs14'

	yyvsp14: INTEGER
			-- Top of semantic value stack `yyvs14'

	yyspecial_routines14: KL_SPECIAL_ROUTINES [C_COMPLEX_OBJECT]
			-- Routines that ought to be in SPECIAL [C_COMPLEX_OBJECT]

	yyvs15: SPECIAL [C_PRIMITIVE_OBJECT]
			-- Stack for semantic values of type C_PRIMITIVE_OBJECT

	yyvsc15: INTEGER
			-- Capacity of semantic value stack `yyvs15'

	yyvsp15: INTEGER
			-- Top of semantic value stack `yyvs15'

	yyspecial_routines15: KL_SPECIAL_ROUTINES [C_PRIMITIVE_OBJECT]
			-- Routines that ought to be in SPECIAL [C_PRIMITIVE_OBJECT]

	yyvs16: SPECIAL [C_OBJECT]
			-- Stack for semantic values of type C_OBJECT

	yyvsc16: INTEGER
			-- Capacity of semantic value stack `yyvs16'

	yyvsp16: INTEGER
			-- Top of semantic value stack `yyvs16'

	yyspecial_routines16: KL_SPECIAL_ROUTINES [C_OBJECT]
			-- Routines that ought to be in SPECIAL [C_OBJECT]

	yyvs17: SPECIAL [ARCHETYPE_SLOT]
			-- Stack for semantic values of type ARCHETYPE_SLOT

	yyvsc17: INTEGER
			-- Capacity of semantic value stack `yyvs17'

	yyvsp17: INTEGER
			-- Top of semantic value stack `yyvs17'

	yyspecial_routines17: KL_SPECIAL_ROUTINES [ARCHETYPE_SLOT]
			-- Routines that ought to be in SPECIAL [ARCHETYPE_SLOT]

	yyvs18: SPECIAL [C_ATTRIBUTE]
			-- Stack for semantic values of type C_ATTRIBUTE

	yyvsc18: INTEGER
			-- Capacity of semantic value stack `yyvs18'

	yyvsp18: INTEGER
			-- Top of semantic value stack `yyvs18'

	yyspecial_routines18: KL_SPECIAL_ROUTINES [C_ATTRIBUTE]
			-- Routines that ought to be in SPECIAL [C_ATTRIBUTE]

	yyvs19: SPECIAL [EXPR_ITEM]
			-- Stack for semantic values of type EXPR_ITEM

	yyvsc19: INTEGER
			-- Capacity of semantic value stack `yyvs19'

	yyvsp19: INTEGER
			-- Top of semantic value stack `yyvs19'

	yyspecial_routines19: KL_SPECIAL_ROUTINES [EXPR_ITEM]
			-- Routines that ought to be in SPECIAL [EXPR_ITEM]

	yyvs20: SPECIAL [EXPR_UNARY_OPERATOR]
			-- Stack for semantic values of type EXPR_UNARY_OPERATOR

	yyvsc20: INTEGER
			-- Capacity of semantic value stack `yyvs20'

	yyvsp20: INTEGER
			-- Top of semantic value stack `yyvs20'

	yyspecial_routines20: KL_SPECIAL_ROUTINES [EXPR_UNARY_OPERATOR]
			-- Routines that ought to be in SPECIAL [EXPR_UNARY_OPERATOR]

	yyvs21: SPECIAL [EXPR_BINARY_OPERATOR]
			-- Stack for semantic values of type EXPR_BINARY_OPERATOR

	yyvsc21: INTEGER
			-- Capacity of semantic value stack `yyvs21'

	yyvsp21: INTEGER
			-- Top of semantic value stack `yyvs21'

	yyspecial_routines21: KL_SPECIAL_ROUTINES [EXPR_BINARY_OPERATOR]
			-- Routines that ought to be in SPECIAL [EXPR_BINARY_OPERATOR]

	yyvs22: SPECIAL [EXPR_LEAF]
			-- Stack for semantic values of type EXPR_LEAF

	yyvsc22: INTEGER
			-- Capacity of semantic value stack `yyvs22'

	yyvsp22: INTEGER
			-- Top of semantic value stack `yyvs22'

	yyspecial_routines22: KL_SPECIAL_ROUTINES [EXPR_LEAF]
			-- Routines that ought to be in SPECIAL [EXPR_LEAF]

	yyvs23: SPECIAL [BOOLEAN]
			-- Stack for semantic values of type BOOLEAN

	yyvsc23: INTEGER
			-- Capacity of semantic value stack `yyvs23'

	yyvsp23: INTEGER
			-- Top of semantic value stack `yyvs23'

	yyspecial_routines23: KL_SPECIAL_ROUTINES [BOOLEAN]
			-- Routines that ought to be in SPECIAL [BOOLEAN]

	yyvs24: SPECIAL [ISO8601_DATE]
			-- Stack for semantic values of type ISO8601_DATE

	yyvsc24: INTEGER
			-- Capacity of semantic value stack `yyvs24'

	yyvsp24: INTEGER
			-- Top of semantic value stack `yyvs24'

	yyspecial_routines24: KL_SPECIAL_ROUTINES [ISO8601_DATE]
			-- Routines that ought to be in SPECIAL [ISO8601_DATE]

	yyvs25: SPECIAL [ISO8601_DATE_TIME]
			-- Stack for semantic values of type ISO8601_DATE_TIME

	yyvsc25: INTEGER
			-- Capacity of semantic value stack `yyvs25'

	yyvsp25: INTEGER
			-- Top of semantic value stack `yyvs25'

	yyspecial_routines25: KL_SPECIAL_ROUTINES [ISO8601_DATE_TIME]
			-- Routines that ought to be in SPECIAL [ISO8601_DATE_TIME]

	yyvs26: SPECIAL [ISO8601_TIME]
			-- Stack for semantic values of type ISO8601_TIME

	yyvsc26: INTEGER
			-- Capacity of semantic value stack `yyvs26'

	yyvsp26: INTEGER
			-- Top of semantic value stack `yyvs26'

	yyspecial_routines26: KL_SPECIAL_ROUTINES [ISO8601_TIME]
			-- Routines that ought to be in SPECIAL [ISO8601_TIME]

	yyvs27: SPECIAL [ISO8601_DURATION]
			-- Stack for semantic values of type ISO8601_DURATION

	yyvsc27: INTEGER
			-- Capacity of semantic value stack `yyvs27'

	yyvsp27: INTEGER
			-- Top of semantic value stack `yyvs27'

	yyspecial_routines27: KL_SPECIAL_ROUTINES [ISO8601_DURATION]
			-- Routines that ought to be in SPECIAL [ISO8601_DURATION]

	yyvs28: SPECIAL [ARRAYED_LIST [STRING]]
			-- Stack for semantic values of type ARRAYED_LIST [STRING]

	yyvsc28: INTEGER
			-- Capacity of semantic value stack `yyvs28'

	yyvsp28: INTEGER
			-- Top of semantic value stack `yyvs28'

	yyspecial_routines28: KL_SPECIAL_ROUTINES [ARRAYED_LIST [STRING]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [STRING]]

	yyvs29: SPECIAL [ARRAYED_LIST [INTEGER]]
			-- Stack for semantic values of type ARRAYED_LIST [INTEGER]

	yyvsc29: INTEGER
			-- Capacity of semantic value stack `yyvs29'

	yyvsp29: INTEGER
			-- Top of semantic value stack `yyvs29'

	yyspecial_routines29: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTEGER]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTEGER]]

	yyvs30: SPECIAL [ARRAYED_LIST [REAL]]
			-- Stack for semantic values of type ARRAYED_LIST [REAL]

	yyvsc30: INTEGER
			-- Capacity of semantic value stack `yyvs30'

	yyvsp30: INTEGER
			-- Top of semantic value stack `yyvs30'

	yyspecial_routines30: KL_SPECIAL_ROUTINES [ARRAYED_LIST [REAL]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [REAL]]

	yyvs31: SPECIAL [ARRAYED_LIST [BOOLEAN]]
			-- Stack for semantic values of type ARRAYED_LIST [BOOLEAN]

	yyvsc31: INTEGER
			-- Capacity of semantic value stack `yyvs31'

	yyvsp31: INTEGER
			-- Top of semantic value stack `yyvs31'

	yyspecial_routines31: KL_SPECIAL_ROUTINES [ARRAYED_LIST [BOOLEAN]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [BOOLEAN]]

	yyvs32: SPECIAL [ARRAYED_LIST [ISO8601_DATE]]
			-- Stack for semantic values of type ARRAYED_LIST [ISO8601_DATE]

	yyvsc32: INTEGER
			-- Capacity of semantic value stack `yyvs32'

	yyvsp32: INTEGER
			-- Top of semantic value stack `yyvs32'

	yyspecial_routines32: KL_SPECIAL_ROUTINES [ARRAYED_LIST [ISO8601_DATE]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ISO8601_DATE]]

	yyvs33: SPECIAL [ARRAYED_LIST [ISO8601_TIME]]
			-- Stack for semantic values of type ARRAYED_LIST [ISO8601_TIME]

	yyvsc33: INTEGER
			-- Capacity of semantic value stack `yyvs33'

	yyvsp33: INTEGER
			-- Top of semantic value stack `yyvs33'

	yyspecial_routines33: KL_SPECIAL_ROUTINES [ARRAYED_LIST [ISO8601_TIME]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ISO8601_TIME]]

	yyvs34: SPECIAL [ARRAYED_LIST [ISO8601_DATE_TIME]]
			-- Stack for semantic values of type ARRAYED_LIST [ISO8601_DATE_TIME]

	yyvsc34: INTEGER
			-- Capacity of semantic value stack `yyvs34'

	yyvsp34: INTEGER
			-- Top of semantic value stack `yyvs34'

	yyspecial_routines34: KL_SPECIAL_ROUTINES [ARRAYED_LIST [ISO8601_DATE_TIME]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ISO8601_DATE_TIME]]

	yyvs35: SPECIAL [ARRAYED_LIST [ISO8601_DURATION]]
			-- Stack for semantic values of type ARRAYED_LIST [ISO8601_DURATION]

	yyvsc35: INTEGER
			-- Capacity of semantic value stack `yyvs35'

	yyvsp35: INTEGER
			-- Top of semantic value stack `yyvs35'

	yyspecial_routines35: KL_SPECIAL_ROUTINES [ARRAYED_LIST [ISO8601_DURATION]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ISO8601_DURATION]]

	yyvs36: SPECIAL [INTERVAL [INTEGER]]
			-- Stack for semantic values of type INTERVAL [INTEGER]

	yyvsc36: INTEGER
			-- Capacity of semantic value stack `yyvs36'

	yyvsp36: INTEGER
			-- Top of semantic value stack `yyvs36'

	yyspecial_routines36: KL_SPECIAL_ROUTINES [INTERVAL [INTEGER]]
			-- Routines that ought to be in SPECIAL [INTERVAL [INTEGER]]

	yyvs37: SPECIAL [INTERVAL [REAL]]
			-- Stack for semantic values of type INTERVAL [REAL]

	yyvsc37: INTEGER
			-- Capacity of semantic value stack `yyvs37'

	yyvsp37: INTEGER
			-- Top of semantic value stack `yyvs37'

	yyspecial_routines37: KL_SPECIAL_ROUTINES [INTERVAL [REAL]]
			-- Routines that ought to be in SPECIAL [INTERVAL [REAL]]

	yyvs38: SPECIAL [INTERVAL [ISO8601_TIME]]
			-- Stack for semantic values of type INTERVAL [ISO8601_TIME]

	yyvsc38: INTEGER
			-- Capacity of semantic value stack `yyvs38'

	yyvsp38: INTEGER
			-- Top of semantic value stack `yyvs38'

	yyspecial_routines38: KL_SPECIAL_ROUTINES [INTERVAL [ISO8601_TIME]]
			-- Routines that ought to be in SPECIAL [INTERVAL [ISO8601_TIME]]

	yyvs39: SPECIAL [INTERVAL [ISO8601_DATE]]
			-- Stack for semantic values of type INTERVAL [ISO8601_DATE]

	yyvsc39: INTEGER
			-- Capacity of semantic value stack `yyvs39'

	yyvsp39: INTEGER
			-- Top of semantic value stack `yyvs39'

	yyspecial_routines39: KL_SPECIAL_ROUTINES [INTERVAL [ISO8601_DATE]]
			-- Routines that ought to be in SPECIAL [INTERVAL [ISO8601_DATE]]

	yyvs40: SPECIAL [INTERVAL [ISO8601_DATE_TIME]]
			-- Stack for semantic values of type INTERVAL [ISO8601_DATE_TIME]

	yyvsc40: INTEGER
			-- Capacity of semantic value stack `yyvs40'

	yyvsp40: INTEGER
			-- Top of semantic value stack `yyvs40'

	yyspecial_routines40: KL_SPECIAL_ROUTINES [INTERVAL [ISO8601_DATE_TIME]]
			-- Routines that ought to be in SPECIAL [INTERVAL [ISO8601_DATE_TIME]]

	yyvs41: SPECIAL [INTERVAL [ISO8601_DURATION]]
			-- Stack for semantic values of type INTERVAL [ISO8601_DURATION]

	yyvsc41: INTEGER
			-- Capacity of semantic value stack `yyvs41'

	yyvsp41: INTEGER
			-- Top of semantic value stack `yyvs41'

	yyspecial_routines41: KL_SPECIAL_ROUTINES [INTERVAL [ISO8601_DURATION]]
			-- Routines that ought to be in SPECIAL [INTERVAL [ISO8601_DURATION]]

	yyvs42: SPECIAL [ARRAYED_LIST [INTERVAL [INTEGER]]]
			-- Stack for semantic values of type ARRAYED_LIST [INTERVAL [INTEGER]]

	yyvsc42: INTEGER
			-- Capacity of semantic value stack `yyvs42'

	yyvsp42: INTEGER
			-- Top of semantic value stack `yyvs42'

	yyspecial_routines42: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTERVAL [INTEGER]]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTERVAL [INTEGER]]]

	yyvs43: SPECIAL [ARRAYED_LIST [INTERVAL [REAL]]]
			-- Stack for semantic values of type ARRAYED_LIST [INTERVAL [REAL]]

	yyvsc43: INTEGER
			-- Capacity of semantic value stack `yyvs43'

	yyvsp43: INTEGER
			-- Top of semantic value stack `yyvs43'

	yyspecial_routines43: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTERVAL [REAL]]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTERVAL [REAL]]]

	yyvs44: SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_TIME]]]
			-- Stack for semantic values of type ARRAYED_LIST [INTERVAL [ISO8601_TIME]]

	yyvsc44: INTEGER
			-- Capacity of semantic value stack `yyvs44'

	yyvsp44: INTEGER
			-- Top of semantic value stack `yyvs44'

	yyspecial_routines44: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTERVAL [ISO8601_TIME]]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_TIME]]]

	yyvs45: SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_DATE]]]
			-- Stack for semantic values of type ARRAYED_LIST [INTERVAL [ISO8601_DATE]]

	yyvsc45: INTEGER
			-- Capacity of semantic value stack `yyvs45'

	yyvsp45: INTEGER
			-- Top of semantic value stack `yyvs45'

	yyspecial_routines45: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTERVAL [ISO8601_DATE]]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_DATE]]]

	yyvs46: SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_DATE_TIME]]]
			-- Stack for semantic values of type ARRAYED_LIST [INTERVAL [ISO8601_DATE_TIME]]

	yyvsc46: INTEGER
			-- Capacity of semantic value stack `yyvs46'

	yyvsp46: INTEGER
			-- Top of semantic value stack `yyvs46'

	yyspecial_routines46: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTERVAL [ISO8601_DATE_TIME]]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_DATE_TIME]]]

	yyvs47: SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_DURATION]]]
			-- Stack for semantic values of type ARRAYED_LIST [INTERVAL [ISO8601_DURATION]]

	yyvsc47: INTEGER
			-- Capacity of semantic value stack `yyvs47'

	yyvsp47: INTEGER
			-- Top of semantic value stack `yyvs47'

	yyspecial_routines47: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTERVAL [ISO8601_DURATION]]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_DURATION]]]

	yyvs48: SPECIAL [detachable CARDINALITY]
			-- Stack for semantic values of type detachable CARDINALITY

	yyvsc48: INTEGER
			-- Capacity of semantic value stack `yyvs48'

	yyvsp48: INTEGER
			-- Top of semantic value stack `yyvs48'

	yyspecial_routines48: KL_SPECIAL_ROUTINES [detachable CARDINALITY]
			-- Routines that ought to be in SPECIAL [detachable CARDINALITY]

	yyvs49: SPECIAL [CARDINALITY]
			-- Stack for semantic values of type CARDINALITY

	yyvsc49: INTEGER
			-- Capacity of semantic value stack `yyvs49'

	yyvsp49: INTEGER
			-- Top of semantic value stack `yyvs49'

	yyspecial_routines49: KL_SPECIAL_ROUTINES [CARDINALITY]
			-- Routines that ought to be in SPECIAL [CARDINALITY]

	yyvs50: SPECIAL [ORDINAL]
			-- Stack for semantic values of type ORDINAL

	yyvsc50: INTEGER
			-- Capacity of semantic value stack `yyvs50'

	yyvsp50: INTEGER
			-- Top of semantic value stack `yyvs50'

	yyspecial_routines50: KL_SPECIAL_ROUTINES [ORDINAL]
			-- Routines that ought to be in SPECIAL [ORDINAL]

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

	yyFinal: INTEGER = 543
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 90
			-- Number of tokens

	yyLast: INTEGER = 854
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 333
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 175
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
			rm_schema := aca.rm_schema
			if target_descriptor.is_specialised then
				flat_ancestor := target_descriptor.specialisation_parent.flat_archetype
 			end

			source_start_line := a_source_start_line
			create indent.make_empty

			object_nodes.wipe_out
			c_attrs.wipe_out

			fake_code_number := 0

			create time_vc
			create date_vc
	
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

	invariant_expr: detachable STRING

	time_vc: TIME_VALIDITY_CHECKER
	date_vc: DATE_VALIDITY_CHECKER

	rm_prop_def: detachable BMM_PROPERTY [BMM_TYPE]

	c_attr_tuple: C_ATTRIBUTE_TUPLE
		attribute
			create Result.make
		end

	c_attr_tuple_item: INTEGER

	c_attr_tuple_count: INTEGER

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
			last_fake_at_code := Result
			fake_code_number := fake_code_number + 1
		end

	last_fake_at_code: STRING
		attribute
			create Result.make_empty
		end

	c_dv_q_prop_code: STRING
		attribute
			create Result.make_empty
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

	ordinal_integer: C_INTEGER
		attribute
			create Result.default_create
		end

	ordinal_symbol: C_TERMINOLOGY_CODE
		attribute
			create Result.default_create
		end

	Missing_codes: STRING = "missing"

end
