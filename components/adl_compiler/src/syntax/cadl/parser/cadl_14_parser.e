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
			yyval15: C_COMPLEX_OBJECT
			yyval12: SIBLING_ORDER
			yyval10: C_ARCHETYPE_ROOT
			yyval11: C_COMPLEX_OBJECT_PROXY
			yyval17: ARCHETYPE_SLOT
			yyval16: C_PRIMITIVE_OBJECT
			yyval18: C_ATTRIBUTE
			yyval8: detachable ARRAYED_LIST [ASSERTION]
			yyval9: ASSERTION
			yyval19: EXPR_ITEM
			yyval21: EXPR_BINARY_OPERATOR
			yyval20: EXPR_UNARY_OPERATOR
			yyval2: STRING
			yyval22: EXPR_LEAF
			yyval13: detachable MULTIPLICITY_INTERVAL
			yyval14: MULTIPLICITY_INTERVAL
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
			yyval3: INTEGER
			yyval29: ARRAYED_LIST [INTEGER]
			yyval36: INTERVAL [INTEGER]
			yyval42: ARRAYED_LIST [INTERVAL [INTEGER]]
			yyval4: REAL
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
--|#line 197 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 197")
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
--|#line 205 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 205")
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
--|#line 213 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 213")
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
--|#line 222 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 222")
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
	yyvsp15 := yyvsp15 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 5 then
--|#line 233 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 233")
end

			yyval15 := yyvs15.item (yyvsp15)
			if attached yyvs13.item (yyvsp13) as att_occ then
				yyvs15.item (yyvsp15).set_occurrences (att_occ)
			end

			if rm_schema.has_class_definition (yyvs15.item (yyvsp15).rm_type_name) then
				object_nodes.extend (yyvs15.item (yyvsp15))
debug ("ADL_parse")
	io.put_string (indent + "PUSH create OBJECT_NODE " + yyvs15.item (yyvsp15).rm_type_name + " [id=" + yyvs15.item (yyvsp15).node_id + "] ")
	if yyvs13.item (yyvsp13) /= Void then
		io.put_string ("; occurrences=(" + yyvs13.item (yyvsp13).as_string + ")") 
	end
	io.new_line
	indent.append ("%T")
end

				-- put it under current attribute, unless it is the root object, in which case it will be returned
				-- via the 'output' attribute of this parser
				if not c_attrs.is_empty then
					safe_put_c_attribute_child (c_attrs.item, yyvs15.item (yyvsp15))
				end
			else
				abort_with_error (ec_VCORM, <<yyvs15.item (yyvsp15).rm_type_name, yyvs15.item (yyvsp15).path>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp13 := yyvsp13 -1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 6 then
--|#line 262 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 262")
end

			if object_nodes.is_empty then
				create yyval15.make (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
			else
				abort_with_error (ec_VARND, <<yyvs2.item (yyvsp2), Id_code_regex_pattern>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp15 := yyvsp15 + 1
	yyvsp2 := yyvsp2 -2
	if yyvsp15 >= yyvsc15 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs15")
		end
		yyvsc15 := yyvsc15 + yyInitial_yyvs_size
		yyvs15 := yyspecial_routines15.aliased_resized_area (yyvs15, yyvsc15)
	end
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 7 then
--|#line 270 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 270")
end

			if not object_nodes.is_empty then
				create yyval15.make (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
			else
				abort_with_error (ec_VARCN, <<yyvs2.item (yyvsp2), Root_id_code_regex_pattern>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp15 := yyvsp15 + 1
	yyvsp2 := yyvsp2 -2
	if yyvsp15 >= yyvsc15 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs15")
		end
		yyvsc15 := yyvsc15 + yyInitial_yyvs_size
		yyvs15 := yyspecial_routines15.aliased_resized_area (yyvs15, yyvsc15)
	end
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 8 then
--|#line 278 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 278")
end

			create yyval15.make (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
			yyval15.set_sibling_order (yyvs12.item (yyvsp12))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp15 := yyvsp15 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp2 := yyvsp2 -2
	if yyvsp15 >= yyvsc15 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs15")
		end
		yyvsc15 := yyvsc15 + yyInitial_yyvs_size
		yyvs15 := yyspecial_routines15.aliased_resized_area (yyvs15, yyvsc15)
	end
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 9 then
--|#line 286 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 286")
end

			if object_nodes.is_empty then
				abort_with_error (ec_VARCN, <<"(none)", Root_id_code_regex_pattern>>)
			else
				create yyval15.make (yyvs2.item (yyvsp2), new_fake_node_id)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp15 := yyvsp15 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp15 >= yyvsc15 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs15")
		end
		yyvsc15 := yyvsc15 + yyInitial_yyvs_size
		yyvs15 := yyspecial_routines15.aliased_resized_area (yyvs15, yyvsc15)
	end
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 10 then
--|#line 299 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 299")
end

			yyval12 := create {SIBLING_ORDER}.make_after (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp12 := yyvsp12 + 1
	yyvsp1 := yyvsp1 -1
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
when 11 then
--|#line 303 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 303")
end

			yyval12 := create {SIBLING_ORDER}.make_before (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp12 := yyvsp12 + 1
	yyvsp1 := yyvsp1 -1
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
when 12 then
--|#line 309 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 309")
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
--|#line 316 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 316")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 14 then
--|#line 319 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 319")
end

			abort_with_error (ec_SCOAT, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 15 then
--|#line 329 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 329")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 16 then
--|#line 332 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 332")
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
when 17 then
--|#line 336 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 336")
end

			safe_put_c_attribute_child (c_attrs.item, yyvs11.item (yyvsp11))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp11 := yyvsp11 -1
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
--|#line 340 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 340")
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
when 19 then
--|#line 344 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 344")
end

			safe_put_c_attribute_child (c_attrs.item, yyvs16.item (yyvsp16))
		
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
when 20 then
--|#line 351 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 351")
end

			safe_put_c_attribute_child (c_attrs.item, yyvs15.item (yyvsp15))
		
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
when 21 then
--|#line 355 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 355")
end

			if attached last_c_dv_quantity_value.property as att_prop then
				last_c_dv_quantity_value.set_property (create {TERMINOLOGY_CODE}.make (Local_terminology_id, new_fake_at_code))

				-- add term binding
				if not compiler_billboard.term_bindings.has (att_prop.terminology_id) then
					compiler_billboard.term_bindings.put (create {HASH_TABLE [URI, STRING]}.make (0), att_prop.terminology_id)
				end
				check attached compiler_billboard.term_bindings.item (att_prop.terminology_id) as att_bindings_for_terminology then
					str := uri_for_terminology_code (att_prop)
					att_bindings_for_terminology.put (create {URI}.make_from_string (str), last_fake_at_code)
				end
			end
			safe_put_c_attribute_child (c_attrs.item, last_c_dv_quantity_value.standard_equivalent (new_fake_node_id))
		
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
when 22 then
--|#line 371 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 371")
end

			abort_with_error (ec_SDINV, <<odin_parser_error.as_string>>)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 23 then
--|#line 378 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 378")
end

			abort_with_error (ec_SCCOG, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 24 then
--|#line 389 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 389")
end

			if archetype_id_parser.valid_id (yyvs2.item (yyvsp2)) then
				create yyval10.make (yyvs2.item (yyvsp2 - 2), yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
				if attached yyvs13.item (yyvsp13) as occ then
					yyval10.set_occurrences (occ)
				end
			else
				abort_with_error (ec_SUAIDI, <<yyvs2.item (yyvsp2 - 1)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp10 := yyvsp10 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -3
	yyvsp13 := yyvsp13 -1
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
--|#line 400 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 400")
end

			abort_with_error (ec_SUAID, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp10 := yyvsp10 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -1
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
--|#line 406 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 406")
end

			create yyval11.make (yyvs2.item (yyvsp2 - 2), yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
			if attached yyvs13.item (yyvsp13) as att_occ then
				yyval11.set_occurrences (att_occ)
			end

			debug ("ADL_parse")
				io.put_string (indent + "create C_COMPLEX_OBJECT_PROXY ")
				io.put_string (yyval11.rm_type_name) 
				io.put_string ("[" + yyval11.node_id + "] ")
				if yyval11.use_target_occurrences then
					io.put_string ("occurrences=(use target) ")
				elseif yyvs13.item (yyvsp13) /= Void then
					io.put_string ("occurrences=" + yyval11.occurrences.as_string + " ")
				end
				io.put_string (" => " + yyval11.target_path + "%N") 
				io.put_string (indent + "C_ATTR " + c_attrs.item.rm_attribute_name + " safe_put_c_attribute_child (C_COMPLEX_OBJECT_PROXY)%N") 
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp11 := yyvsp11 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -3
	yyvsp13 := yyvsp13 -1
	if yyvsp11 >= yyvsc11 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs11")
		end
		yyvsc11 := yyvsc11 + yyInitial_yyvs_size
		yyvs11 := yyspecial_routines11.aliased_resized_area (yyvs11, yyvsc11)
	end
	yyspecial_routines11.force (yyvs11, yyval11, yyvsp11)
end
when 27 then
--|#line 426 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 426")
end

			create yyval11.make (yyvs2.item (yyvsp2 - 1), new_fake_node_id, yyvs2.item (yyvsp2))
			if attached yyvs13.item (yyvsp13) as att_occ then
				yyval11.set_occurrences (att_occ)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp11 := yyvsp11 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -2
	yyvsp13 := yyvsp13 -1
	if yyvsp11 >= yyvsc11 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs11")
		end
		yyvsc11 := yyvsc11 + yyInitial_yyvs_size
		yyvs11 := yyspecial_routines11.aliased_resized_area (yyvs11, yyvsc11)
	end
	yyspecial_routines11.force (yyvs11, yyval11, yyvsp11)
end
when 28 then
--|#line 433 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 433")
end

			abort_with_error (ec_SUNPA, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp11 := yyvsp11 + 1
	yyvsp1 := yyvsp1 -2
	if yyvsp11 >= yyvsc11 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs11")
		end
		yyvsc11 := yyvsc11 + yyInitial_yyvs_size
		yyvs11 := yyspecial_routines11.aliased_resized_area (yyvs11, yyvsc11)
	end
	yyspecial_routines11.force (yyvs11, yyval11, yyvsp11)
end
when 29 then
--|#line 439 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 439")
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
when 30 then
--|#line 453 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 453")
end

			if not (yyvs17.item (yyvsp17).is_closed or yyvs17.item (yyvsp17).is_prohibited) then
				abort_with_error (ec_VASMD, <<yyvs17.item (yyvsp17).rm_type_name, c_attrs.item.path>>)
			end
			yyval17 := yyvs17.item (yyvsp17)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines17.force (yyvs17, yyval17, yyvsp17)
end
when 31 then
--|#line 462 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 462")
end

			if attached yyvs13.item (yyvsp13) as att_occ then
				yyvs17.item (yyvsp17).set_occurrences (att_occ)
			end

			debug ("ADL_parse")
				io.put_string (indent + "create ARCHETYPE_SLOT " + yyvs17.item (yyvsp17).rm_type_name + " [id=" + yyvs17.item (yyvsp17).node_id + "]")
				if attached yyvs13.item (yyvsp13) then
					io.put_string ("; occurrences=(" + yyvs13.item (yyvsp13).as_string + ")") 
				end
				io.new_line
				indent.append ("%T")
			end
			yyval17 := yyvs17.item (yyvsp17)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp13 := yyvsp13 -1
	yyspecial_routines17.force (yyvs17, yyval17, yyvsp17)
end
when 32 then
--|#line 480 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 480")
end

			create yyval17.make (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp17 := yyvsp17 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -2
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
--|#line 484 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 484")
end

			create yyval17.make (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
			yyval17.set_closed
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp17 := yyvsp17 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -2
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
--|#line 489 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 489")
end

			create yyval17.make (yyvs2.item (yyvsp2), new_fake_node_id)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp17 := yyvsp17 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
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
--|#line 493 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 493")
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
when 36 then
--|#line 499 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 499")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_INTEGER: " +  yyvs58.item (yyvsp58).as_string + "%N")
			end
			yyval16 := yyvs58.item (yyvsp58)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp58 := yyvsp58 -1
	if yyvsp16 >= yyvsc16 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs16")
		end
		yyvsc16 := yyvsc16 + yyInitial_yyvs_size
		yyvs16 := yyspecial_routines16.aliased_resized_area (yyvs16, yyvsc16)
	end
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 37 then
--|#line 506 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 506")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_REAL: " +  yyvs57.item (yyvsp57).as_string + "%N")
			end
			yyval16 := yyvs57.item (yyvsp57)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp57 := yyvsp57 -1
	if yyvsp16 >= yyvsc16 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs16")
		end
		yyvsc16 := yyvsc16 + yyInitial_yyvs_size
		yyvs16 := yyspecial_routines16.aliased_resized_area (yyvs16, yyvsc16)
	end
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 38 then
--|#line 513 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 513")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_DATE: " +  yyvs55.item (yyvsp55).as_string + "%N")
			end
			yyval16 := yyvs55.item (yyvsp55)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp55 := yyvsp55 -1
	if yyvsp16 >= yyvsc16 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs16")
		end
		yyvsc16 := yyvsc16 + yyInitial_yyvs_size
		yyvs16 := yyspecial_routines16.aliased_resized_area (yyvs16, yyvsc16)
	end
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 39 then
--|#line 520 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 520")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_TIME: " +  yyvs56.item (yyvsp56).as_string + "%N")
			end
			yyval16 := yyvs56.item (yyvsp56)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp56 := yyvsp56 -1
	if yyvsp16 >= yyvsc16 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs16")
		end
		yyvsc16 := yyvsc16 + yyInitial_yyvs_size
		yyvs16 := yyspecial_routines16.aliased_resized_area (yyvs16, yyvsc16)
	end
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 40 then
--|#line 527 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 527")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_DATE_TIME: " +  yyvs53.item (yyvsp53).as_string + "%N")
			end
			yyval16 := yyvs53.item (yyvsp53)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp53 := yyvsp53 -1
	if yyvsp16 >= yyvsc16 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs16")
		end
		yyvsc16 := yyvsc16 + yyInitial_yyvs_size
		yyvs16 := yyspecial_routines16.aliased_resized_area (yyvs16, yyvsc16)
	end
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 41 then
--|#line 534 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 534")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_DURATION: " +  yyvs54.item (yyvsp54).as_string + "%N")
			end
			yyval16 := yyvs54.item (yyvsp54)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp54 := yyvsp54 -1
	if yyvsp16 >= yyvsc16 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs16")
		end
		yyvsc16 := yyvsc16 + yyInitial_yyvs_size
		yyvs16 := yyspecial_routines16.aliased_resized_area (yyvs16, yyvsc16)
	end
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 42 then
--|#line 541 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 541")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_STRING: " +  yyvs52.item (yyvsp52).as_string + "%N")
			end
			yyval16 := yyvs52.item (yyvsp52)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp52 := yyvsp52 -1
	if yyvsp16 >= yyvsc16 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs16")
		end
		yyvsc16 := yyvsc16 + yyInitial_yyvs_size
		yyvs16 := yyspecial_routines16.aliased_resized_area (yyvs16, yyvsc16)
	end
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 43 then
--|#line 548 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 548")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_TERMINOLOGY_CODE: " +  yyvs59.item (yyvsp59).as_string + "%N")
			end
			yyval16 := yyvs59.item (yyvsp59)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp59 := yyvsp59 -1
	if yyvsp16 >= yyvsc16 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs16")
		end
		yyvsc16 := yyvsc16 + yyInitial_yyvs_size
		yyvs16 := yyspecial_routines16.aliased_resized_area (yyvs16, yyvsc16)
	end
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 44 then
--|#line 555 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 555")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_BOOLEAN: " +  yyvs51.item (yyvsp51).as_string + "%N")
			end
			yyval16 := yyvs51.item (yyvsp51)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp51 := yyvsp51 -1
	if yyvsp16 >= yyvsc16 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs16")
		end
		yyvsc16 := yyvsc16 + yyInitial_yyvs_size
		yyvs16 := yyspecial_routines16.aliased_resized_area (yyvs16, yyvsc16)
	end
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 45 then
--|#line 564 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 564")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 46 then
--|#line 571 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 571")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 47 then
--|#line 574 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 574")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 48 then
--|#line 579 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 579")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 49 then
--|#line 582 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 582")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 50 then
--|#line 587 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 587")
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
when 51 then
--|#line 595 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 595")
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
when 52 then
--|#line 599 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 599")
end

			abort_with_error (ec_SCAS, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp18 := yyvsp18 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 53 then
--|#line 605 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 605")
end

			rm_attribute_name := yyvs2.item (yyvsp2)
			if not object_nodes.item.has_attribute (rm_attribute_name) then
				if rm_schema.has_property (object_nodes.item.rm_type_name, rm_attribute_name) then
					rm_prop_def := rm_schema.property_definition (object_nodes.item.rm_type_name, rm_attribute_name)
					if rm_prop_def.is_container then

						-- for ADL 1.4 archetypes, remove existence and cardinality if it is a duplicate of the RM constraint
						if attached yyvs13.item (yyvsp13) as ivl and then ivl.is_equal (rm_prop_def.existence) then
							add_warning (ec_WCAEX14, <<rm_attribute_name, parent_path_str, ivl.as_string, rm_prop_def.existence.as_string>>)
							yyvs13.item (yyvsp13) := Void
						end
						if attached {BMM_CONTAINER_PROPERTY} rm_prop_def as rm_cont_prop_def and then
							attached yyvs48.item (yyvsp48) as ivl and then (ivl.interval.is_equal (rm_cont_prop_def.cardinality) or else
							ivl.interval.contains (rm_cont_prop_def.cardinality))
						then
							add_warning (ec_WCACA14, <<rm_attribute_name, parent_path_str, ivl.interval.as_string, rm_cont_prop_def.cardinality.as_string>>)
							yyvs48.item (yyvsp48) := Void
						end

						-- make the node
						create yyval18.make_multiple (rm_attribute_name, yyvs13.item (yyvsp13), yyvs48.item (yyvsp48))
						c_attrs.put (yyval18)
debug ("ADL_parse")
	io.put_string (indent + "PUSH create ATTR_NODE " + rm_attribute_name + "; container = " + yyval18.is_multiple.out)
	if attached yyvs13.item (yyvsp13) as att_ex then io.put_string (" existence={" + att_ex.as_string + "}") end
	if attached yyvs48.item (yyvsp48) as att_card then io.put_string ("; cardinality=(" + att_card.as_string + ")") end
	io.new_line
	io.put_string (indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_attribute (REL)%N") 
	indent.append ("%T")
end
						object_nodes.item.put_attribute (yyval18)

					elseif not attached yyvs48.item (yyvsp48) then
						-- for ADL 1.4 archetypes, remove existence and cardinality if it is a duplicate of the RM constraint
						if attached yyvs13.item (yyvsp13) as ivl and then ivl.is_equal (rm_prop_def.existence) then
							add_warning (ec_WCAEX14, <<rm_attribute_name, parent_path_str, ivl.as_string, rm_prop_def.existence.as_string>>)
							yyvs13.item (yyvsp13) := Void
						end

						-- make the node
						create yyval18.make_single (rm_attribute_name, yyvs13.item (yyvsp13))
						c_attrs.put (yyval18)
debug ("ADL_parse")
	io.put_string (indent + "PUSH create ATTR_NODE " + rm_attribute_name + "; container = " + yyval18.is_multiple.out) 
	if attached yyvs13.item (yyvsp13) as att_ex then io.put_string (" existence={" + att_ex.as_string + "}") end
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
	yyvsp2 := yyvsp2 -1
	yyvsp13 := yyvsp13 -1
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
when 54 then
--|#line 669 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 669")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 55 then
--|#line 672 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 672")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 56 then
--|#line 675 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 675")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 57 then
--|#line 680 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 680")
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

			c_attr_tuple_count := 0

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
--|#line 703 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 703")
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
--|#line 713 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 713")
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
--|#line 722 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 722")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 61 then
--|#line 725 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 725")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 62 then
--|#line 730 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 730")
end

			debug ("ADL_parse")
				io.put_string (indent + "c_attr_tuple_value - received one tuple %N") 
			end
			c_attr_tuple_count := c_attr_tuple_count + 1
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 63 then
--|#line 739 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 739")
end

			c_attr_tuple_item := 1
			if c_attr_tuple_count = 0 then
				c_attr_tuple.i_th_member (c_attr_tuple_item).put_child (yyvs16.item (yyvsp16))
			elseif attached {C_PRIMITIVE_OBJECT} c_attr_tuple.i_th_member (c_attr_tuple_item).children.first as cpo then
				cpo.merge_tuple (yyvs16.item (yyvsp16))
			end
			debug ("ADL_parse")
				io.put_string (indent + "c_tuple values - add C_PRIMITIVE_OBJECT " + c_attr_tuple.i_th_member (1).rm_attribute_name + " %N")
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp16 := yyvsp16 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 64 then
--|#line 751 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 751")
end

			c_attr_tuple_item := c_attr_tuple_item + 1
			if c_attr_tuple_count = 0 then
				c_attr_tuple.i_th_member (c_attr_tuple_item).put_child (yyvs16.item (yyvsp16))
			elseif attached {C_PRIMITIVE_OBJECT} c_attr_tuple.i_th_member (c_attr_tuple_item).children.first as cpo then
				cpo.merge_tuple (yyvs16.item (yyvsp16))
			end
			debug ("ADL_parse")
				io.put_string (indent + "c_tuple values - add other C_PRIMITIVE_OBJECT " + c_attr_tuple.i_th_member (c_attr_tuple_item).rm_attribute_name + " %N")
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp16 := yyvsp16 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 65 then
--|#line 765 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 765")
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
when 66 then
--|#line 766 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 766")
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
when 67 then
--|#line 775 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 775")
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
when 68 then
--|#line 776 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 776")
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
when 69 then
--|#line 789 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 789")
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
when 70 then
--|#line 794 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 794")
end

			yyvs8.item (yyvsp8).extend (yyvs9.item (yyvsp9))
			yyval8 := yyvs8.item (yyvsp8)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp9 := yyvsp9 -1
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 71 then
--|#line 801 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 801")
end

			create yyval9.make (yyvs19.item (yyvsp19), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp9 := yyvsp9 + 1
	yyvsp2 := yyvsp2 -1
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
when 72 then
--|#line 805 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 805")
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
when 73 then
--|#line 813 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 813")
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
when 74 then
--|#line 817 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 817")
end

			abort_with_error (ec_SINVS, <<yyvs2.item (yyvsp2)>>)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp9 := yyvsp9 + 1
	yyvsp2 := yyvsp2 -1
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
when 75 then
--|#line 825 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 825")
end

			yyval19 := yyvs19.item (yyvsp19)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 76 then
--|#line 829 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 829")
end

			yyval19 := yyvs19.item (yyvsp19)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 77 then
--|#line 835 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 835")
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
when 78 then
--|#line 842 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 842")
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
when 79 then
--|#line 848 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 848")
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
when 80 then
--|#line 852 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 852")
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
when 81 then
--|#line 859 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 859")
end

			yyval19 := yyvs19.item (yyvsp19)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 82 then
--|#line 863 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 863")
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
when 83 then
--|#line 873 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 873")
end

			debug ("ADL_invariant")
				io.put_string (indent + "arch_outer_constraint_expr: Archetype outer feature " + yyvs2.item (yyvsp2) + " matches {" + yyvs16.item (yyvsp16).as_string + "}%N") 
			end
			create yyval21.make (create {OPERATOR_KIND}.make (op_matches),
				create {EXPR_LEAF}.make_archetype_ref (yyvs2.item (yyvsp2)),
				create {EXPR_LEAF}.make_constraint (yyvs16.item (yyvsp16)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp21 := yyvsp21 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -3
	yyvsp16 := yyvsp16 -1
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
--|#line 884 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 884")
end

			debug ("ADL_invariant")
				io.put_string (indent + "boolean_constraint:" + yyvs2.item (yyvsp2) + " matches {" + yyvs16.item (yyvsp16).as_string + "}%N") 
			end
			create yyval21.make (create {OPERATOR_KIND}.make (op_matches), 
				create {EXPR_LEAF}.make_archetype_definition_ref (yyvs2.item (yyvsp2)),
				create {EXPR_LEAF}.make_constraint (yyvs16.item (yyvsp16)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp21 := yyvsp21 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -3
	yyvsp16 := yyvsp16 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 85 then
--|#line 893 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 893")
end

			debug ("ADL_invariant")
				io.put_string (indent + "boolean_constraint:" + yyvs2.item (yyvsp2) + " matches {" + yyvs59.item (yyvsp59).as_string + "}%N") 
			end
			create yyval21.make (create {OPERATOR_KIND}.make (op_matches), 
				create {EXPR_LEAF}.make_archetype_definition_ref (yyvs2.item (yyvsp2)),
				create {EXPR_LEAF}.make_coded_term (yyvs59.item (yyvsp59)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp21 := yyvsp21 + 1
	yyvsp2 := yyvsp2 -1
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
when 86 then
--|#line 908 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 908")
end

			debug ("ADL_invariant")
				io.put_string (indent + "boolean_unop_expr: exists " + yyvs2.item (yyvsp2) + "%N") 
			end
			create yyval20.make (create {OPERATOR_KIND}.make (op_exists), create {EXPR_LEAF}.make_archetype_definition_ref (yyvs2.item (yyvsp2)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp20 := yyvsp20 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 87 then
--|#line 915 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 915")
end

			debug ("ADL_invariant")
				io.put_string (indent + "boolean_unop_expr: not " + yyvs2.item (yyvsp2) + "%N") 
			end
			create yyval20.make (create {OPERATOR_KIND}.make (op_not), create {EXPR_LEAF}.make_archetype_definition_ref (yyvs2.item (yyvsp2)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp20 := yyvsp20 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 88 then
--|#line 922 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 922")
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
when 89 then
--|#line 929 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 929")
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
when 90 then
--|#line 939 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 939")
end

			debug ("ADL_invariant")
				io.put_string (indent + "boolean_binop_expr: [" + yyvs19.item (yyvsp19 - 1).as_string + "] " + yyvs2.item (yyvsp2) + " [" + yyvs19.item (yyvsp19).as_string + "]%N") 
			end
			create yyval21.make (create {OPERATOR_KIND}.make (operator_ids_from_symbols.item (yyvs2.item (yyvsp2))), yyvs19.item (yyvsp19 - 1), yyvs19.item (yyvsp19))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp21 := yyvsp21 + 1
	yyvsp19 := yyvsp19 -2
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
when 91 then
--|#line 948 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 948")
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
--|#line 952 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 952")
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
--|#line 956 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 956")
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
--|#line 960 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 960")
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
--|#line 970 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 970")
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
when 96 then
--|#line 974 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 974")
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
when 97 then
--|#line 984 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 984")
end

			debug ("ADL_invariant")
				io.put_string (indent + "arithmetic_relop_expr: [" + yyvs19.item (yyvsp19 - 1).as_string + "] " + yyvs2.item (yyvsp2) + " [" + yyvs19.item (yyvsp19).as_string + "]%N") 
			end
			create yyval21.make (create {OPERATOR_KIND}.make (operator_ids_from_symbols.item (yyvs2.item (yyvsp2))), yyvs19.item (yyvsp19 - 1), yyvs19.item (yyvsp19))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp21 := yyvsp21 + 1
	yyvsp19 := yyvsp19 -2
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
when 98 then
--|#line 997 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 997")
end

			yyval19 := yyvs19.item (yyvsp19)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 99 then
--|#line 1001 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1001")
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
when 100 then
--|#line 1007 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1007")
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
when 101 then
--|#line 1011 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1011")
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
when 102 then
--|#line 1024 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1024")
end

			debug ("ADL_invariant")
				io.put_string (indent + "arithmetic_arith_binop_expr: [" + yyvs19.item (yyvsp19 - 1).as_string + "] " + yyvs2.item (yyvsp2) + " [" + yyvs19.item (yyvsp19).as_string + "]%N") 
			end
			create yyval21.make (create {OPERATOR_KIND}.make (operator_ids_from_symbols.item (yyvs2.item (yyvsp2))), yyvs19.item (yyvsp19 - 1), yyvs19.item (yyvsp19))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp21 := yyvsp21 + 1
	yyvsp19 := yyvsp19 -2
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
when 103 then
--|#line 1037 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1037")
end

			debug ("ADL_invariant")
				io.put_string (indent + "arith_leaf - integer: " + yyvs3.item (yyvsp3).out + "%N") 
			end
			create yyval22.make_integer (yyvs3.item (yyvsp3))
		
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
when 104 then
--|#line 1044 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1044")
end

			debug ("ADL_invariant")
				io.put_string (indent + "arith_leaf - real: " + yyvs4.item (yyvsp4).out + "%N") 
			end
			create yyval22.make_real (yyvs4.item (yyvsp4))
		
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
when 105 then
--|#line 1051 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1051")
end

			debug ("ADL_invariant")
				io.put_string (indent + "arith_leaf - path: " + yyvs2.item (yyvsp2) + "%N") 
			end
			create yyval22.make_archetype_definition_ref (yyvs2.item (yyvsp2))
		
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
when 106 then
--|#line 1060 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1060")
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
--|#line 1064 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1064")
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
--|#line 1068 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1068")
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
--|#line 1072 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1072")
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
--|#line 1076 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1076")
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
--|#line 1080 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1080")
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
--|#line 1086 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1086")
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
--|#line 1090 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1090")
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
--|#line 1094 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1094")
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
--|#line 1098 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1098")
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
--|#line 1102 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1102")
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
--|#line 1111 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1111")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp13 := yyvsp13 + 1
	if yyvsp13 >= yyvsc13 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs13")
		end
		yyvsc13 := yyvsc13 + yyInitial_yyvs_size
		yyvs13 := yyspecial_routines13.aliased_resized_area (yyvs13, yyvsc13)
	end
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 118 then
--|#line 1112 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1112")
end

			yyval13 := yyvs14.item (yyvsp14)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp13 := yyvsp13 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp14 := yyvsp14 -1
	if yyvsp13 >= yyvsc13 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs13")
		end
		yyvsc13 := yyvsc13 + yyInitial_yyvs_size
		yyvs13 := yyspecial_routines13.aliased_resized_area (yyvs13, yyvsc13)
	end
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 119 then
--|#line 1118 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1118")
end

			if yyvs3.item (yyvsp3) = 0 then
				create yyval14.make_prohibited
			elseif yyvs3.item (yyvsp3) = 1 then
				create yyval14.make_mandatory
			else
				abort_with_error (ec_SEXLSG, Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp14 >= yyvsc14 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs14")
		end
		yyvsc14 := yyvsc14 + yyInitial_yyvs_size
		yyvs14 := yyspecial_routines14.aliased_resized_area (yyvs14, yyvsc14)
	end
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 120 then
--|#line 1128 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1128")
end

			if yyvs3.item (yyvsp3 - 1) = 0 then
				if yyvs3.item (yyvsp3) = 0 then
					create yyval14.make_point (0)
				elseif yyvs3.item (yyvsp3) = 1 then
					create yyval14.make_bounded (0, 1)
				else
					abort_with_error (ec_SEXLU1, Void)
				end
			elseif yyvs3.item (yyvsp3 - 1) = 1 then
				if yyvs3.item (yyvsp3) = 1 then
					create yyval14.make_point (1)
				else
					abort_with_error (ec_SEXLU2, Void)
				end
			else
				abort_with_error (ec_SEXLMG, Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp14 := yyvsp14 + 1
	yyvsp3 := yyvsp3 -2
	yyvsp1 := yyvsp1 -1
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
--|#line 1150 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1150")
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
when 122 then
--|#line 1151 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1151")
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
when 123 then
--|#line 1157 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1157")
end

			create yyval49.make (yyvs14.item (yyvsp14))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp49 := yyvsp49 + 1
	yyvsp14 := yyvsp14 -1
	if yyvsp49 >= yyvsc49 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs49")
		end
		yyvsc49 := yyvsc49 + yyInitial_yyvs_size
		yyvs49 := yyspecial_routines49.aliased_resized_area (yyvs49, yyvsc49)
	end
	yyspecial_routines49.force (yyvs49, yyval49, yyvsp49)
end
when 124 then
--|#line 1161 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1161")
end

			create yyval49.make (yyvs14.item (yyvsp14))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp49 := yyvsp49 + 1
	yyvsp14 := yyvsp14 -1
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
when 125 then
--|#line 1165 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1165")
end

			create yyval49.make (yyvs14.item (yyvsp14))
			yyval49.set_unordered
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp49 := yyvsp49 + 1
	yyvsp14 := yyvsp14 -1
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
when 126 then
--|#line 1170 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1170")
end

			create yyval49.make (yyvs14.item (yyvsp14))
			yyval49.set_unique
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp49 := yyvsp49 + 1
	yyvsp14 := yyvsp14 -1
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
when 127 then
--|#line 1175 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1175")
end

			create yyval49.make (yyvs14.item (yyvsp14))
			yyval49.set_unique
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp49 := yyvsp49 + 1
	yyvsp14 := yyvsp14 -1
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
when 128 then
--|#line 1180 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1180")
end

			create yyval49.make (yyvs14.item (yyvsp14))
			yyval49.set_unique
			yyval49.set_unordered
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp49 := yyvsp49 + 1
	yyvsp14 := yyvsp14 -1
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
when 129 then
--|#line 1186 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1186")
end

			create yyval49.make (yyvs14.item (yyvsp14))
			yyval49.set_unique
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp49 := yyvsp49 + 1
	yyvsp14 := yyvsp14 -1
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
when 130 then
--|#line 1191 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1191")
end

			create yyval49.make (yyvs14.item (yyvsp14))
			yyval49.set_unique
			yyval49.set_unordered
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp49 := yyvsp49 + 1
	yyvsp14 := yyvsp14 -1
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
when 131 then
--|#line 1199 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1199")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp13 := yyvsp13 + 1
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
--|#line 1200 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1200")
end

			yyval13 := yyvs14.item (yyvsp14)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp13 := yyvsp13 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp14 := yyvsp14 -1
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
--|#line 1204 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1204")
end

			abort_with_error (ec_SOCCF, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp13 := yyvsp13 + 1
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
when 134 then
--|#line 1210 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1210")
end

			create yyval14.make_point (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp3 := yyvsp3 -1
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
--|#line 1214 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1214")
end

			create yyval14.make_upper_unbounded (0)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp1 := yyvsp1 -1
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
--|#line 1218 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1218")
end

			create yyval14.make_bounded (yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp14 := yyvsp14 + 1
	yyvsp3 := yyvsp3 -2
	yyvsp1 := yyvsp1 -1
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
--|#line 1222 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1222")
end

			create yyval14.make_upper_unbounded (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp14 := yyvsp14 + 1
	yyvsp3 := yyvsp3 -1
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
when 138 then
--|#line 1230 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1230")
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
when 139 then
--|#line 1234 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1234")
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
when 140 then
--|#line 1238 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1238")
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
when 141 then
--|#line 1242 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1242")
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
when 142 then
--|#line 1246 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1246")
end

			if yyvs58.item (yyvsp58).valid_value (yyvs3.item (yyvsp3)) then
				yyvs58.item (yyvsp58).set_assumed_value (yyvs3.item (yyvsp3))
				yyval58 := yyvs58.item (yyvsp58)
			else
				abort_with_error (ec_VOBAV, <<yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyspecial_routines58.force (yyvs58, yyval58, yyvsp58)
end
when 143 then
--|#line 1255 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1255")
end

			abort_with_error (ec_SCIAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines58.force (yyvs58, yyval58, yyvsp58)
end
when 144 then
--|#line 1261 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1261")
end

			create yyval57.make_value (yyvs4.item (yyvsp4))
		
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
when 145 then
--|#line 1265 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1265")
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
when 146 then
--|#line 1269 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1269")
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
when 147 then
--|#line 1273 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1273")
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
when 148 then
--|#line 1277 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1277")
end

			if yyvs57.item (yyvsp57).valid_value (yyvs4.item (yyvsp4)) then
				yyvs57.item (yyvsp57).set_assumed_value (yyvs4.item (yyvsp4))
				yyval57 := yyvs57.item (yyvsp57)
			else
				abort_with_error (ec_VOBAV, <<yyvs4.item (yyvsp4).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
when 149 then
--|#line 1286 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1286")
end

			abort_with_error (ec_SCRAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
when 150 then
--|#line 1292 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1292")
end

			if valid_iso8601_date_constraint_pattern (yyvs2.item (yyvsp2)) then
				create yyval55.make_from_pattern (yyvs2.item (yyvsp2))
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
when 151 then
--|#line 1308 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1308")
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
when 152 then
--|#line 1312 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1312")
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
when 153 then
--|#line 1316 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1316")
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
when 154 then
--|#line 1320 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1320")
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
when 155 then
--|#line 1324 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1324")
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
when 156 then
--|#line 1333 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1333")
end

			abort_with_error (ec_SCDAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
when 157 then
--|#line 1339 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1339")
end

			if valid_iso8601_time_constraint_pattern (yyvs2.item (yyvsp2)) then
				create yyval56.make_from_pattern (yyvs2.item (yyvsp2))
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
	yyvsp56 := yyvsp56 + 1
	yyvsp2 := yyvsp2 -1
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
--|#line 1354 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1354")
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
when 159 then
--|#line 1358 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1358")
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
when 160 then
--|#line 1362 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1362")
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
when 161 then
--|#line 1366 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1366")
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
when 162 then
--|#line 1370 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1370")
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
when 163 then
--|#line 1379 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1379")
end

			abort_with_error (ec_SCTAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines56.force (yyvs56, yyval56, yyvsp56)
end
when 164 then
--|#line 1385 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1385")
end

			if valid_iso8601_date_time_constraint_pattern (yyvs2.item (yyvsp2)) then
				create yyval53.make_from_pattern (yyvs2.item (yyvsp2))
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
when 165 then
--|#line 1400 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1400")
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
when 166 then
--|#line 1404 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1404")
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
when 167 then
--|#line 1408 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1408")
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
when 168 then
--|#line 1412 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1412")
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
when 169 then
--|#line 1416 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1416")
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
when 170 then
--|#line 1425 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1425")
end

			abort_with_error (ec_SCDTAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines53.force (yyvs53, yyval53, yyvsp53)
end
when 171 then
--|#line 1431 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1431")
end

			if valid_iso8601_duration_constraint_pattern (yyvs2.item (yyvsp2)) then
				create yyval54.make_pattern_with_range (yyvs2.item (yyvsp2), yyvs41.item (yyvsp41))
			else
				abort_with_error (ec_SCDUPT, <<yyvs2.item (yyvsp2)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp54 := yyvsp54 + 1
	yyvsp2 := yyvsp2 -1
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
when 172 then
--|#line 1439 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1439")
end

			if valid_iso8601_duration_constraint_pattern (yyvs2.item (yyvsp2)) then
				create yyval54.make_from_pattern (yyvs2.item (yyvsp2))
			else
				abort_with_error (ec_SCDUPT, <<yyvs2.item (yyvsp2)>>)
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
when 173 then
--|#line 1447 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1447")
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
when 174 then
--|#line 1451 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1451")
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
when 175 then
--|#line 1455 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1455")
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
when 176 then
--|#line 1459 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1459")
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
when 177 then
--|#line 1463 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1463")
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
when 178 then
--|#line 1472 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1472")
end

			abort_with_error (ec_SCDUAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines54.force (yyvs54, yyval54, yyvsp54)
end
when 179 then
--|#line 1477 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1477")
end

			abort_with_error (ec_SCDUPT, <<yyvs2.item (yyvsp2).out>>)
		
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
when 180 then
--|#line 1483 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1483")
end

			create yyval52.make_value (yyvs2.item (yyvsp2))
		
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
when 181 then
--|#line 1487 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1487")
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
when 182 then
--|#line 1491 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1491")
end

			create yyval52.make_value (yyvs2.item (yyvsp2))
			if yyval52.constraint.first.is_equal ({C_STRING}.Invalid_regex_message) then
				abort_with_error (ec_SCSRE, <<yyvs2.item (yyvsp2)>>)
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
when 183 then
--|#line 1498 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1498")
end

			if yyvs52.item (yyvsp52).valid_value (yyvs2.item (yyvsp2)) then
				yyvs52.item (yyvsp52).set_assumed_value (yyvs2.item (yyvsp2))
				yyval52 := yyvs52.item (yyvsp52)
			else
				abort_with_error (ec_VOBAV, <<yyvs2.item (yyvsp2).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
when 184 then
--|#line 1507 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1507")
end

			abort_with_error (ec_SCSAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
when 185 then
--|#line 1513 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1513")
end

			create yyval59.make (yyvs2.item (yyvsp2))
		
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
when 186 then
--|#line 1520 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1520")
end

			-- e.g. "local::at40"
			if yyvs5.item (yyvsp5).is_single then
				create yyval59.make (yyvs5.item (yyvsp5).codes.first)

			-- e.g. "local::at40, at41; at40"; we have to synthesise an ac-code and convert the inline to a separate value set
			else
				-- replace by ac-code ref and store value set for addition to terminology
				create yyval59.make (new_fake_ac_code)
				if attached yyvs5.item (yyvsp5).assumed_code as att_ac then
					yyval59.set_assumed_value (create {TERMINOLOGY_CODE}.make (Local_terminology_id, att_ac))
				end
				compiler_billboard.value_sets.put (create {VALUE_SET_RELATION}.make (yyval59.constraint, yyvs5.item (yyvsp5).codes), yyval59.constraint)
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
when 187 then
--|#line 1536 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1536")
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
					compiler_billboard.value_sets.put (create {VALUE_SET_RELATION}.make (yyval59.constraint, at_codes), yyval59.constraint)
				else
					if attached yyvs5.item (yyvsp5).last_converted_local as att_tcps then
						if attached att_tcps.assumed_code as att_ac then
							yyval59.set_assumed_value (create {TERMINOLOGY_CODE}.make (Local_terminology_id, att_ac))
						end
						compiler_billboard.value_sets.put (create {VALUE_SET_RELATION}.make (yyval59.constraint, att_tcps.codes), yyval59.constraint)
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
when 188 then
--|#line 1611 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1611")
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
when 189 then
--|#line 1615 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1615")
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
when 190 then
--|#line 1619 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1619")
end

			abort_with_error (ec_STCV, <<c_attrs.item.path>>)
		
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
when 191 then
--|#line 1625 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1625")
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
when 192 then
--|#line 1629 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1629")
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
when 193 then
--|#line 1633 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1633")
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
when 194 then
--|#line 1637 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1637")
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
when 195 then
--|#line 1646 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1646")
end

			abort_with_error (ec_SCBAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
when 196 then
--|#line 1657 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1657")
end

			create yyval15.make ("DV_ORDINAL", new_fake_node_id)

			-- create a C_ATTR_TUPLE and connect the received C_OBJ_TUPLE to it
			yyval15.put_attribute_tuple (create {C_ATTRIBUTE_TUPLE}.make)

			-- create 'value' C_ATTRIBUTE and attach both to C_C_O and to C_ATTR_TUPLE
			yyval15.put_attribute (create {C_ATTRIBUTE}.make_single ("value", Void))
			yyval15.attribute_tuples.first.put_member (yyval15.attribute_with_name ("value"))
			yyval15.attribute_with_name ("value").put_child (create {C_INTEGER}.make_value (yyvs50.item (yyvsp50).value))

			-- create 'symbol' C_ATTRIBUTE and attach both to C_C_O and to C_ATTR_TUPLE
			yyval15.put_attribute (create {C_ATTRIBUTE}.make_single ("symbol", Void))
			yyval15.attribute_tuples.first.put_member (yyval15.attribute_with_name ("symbol"))
			yyval15.attribute_with_name ("symbol").put_child (create {C_TERMINOLOGY_CODE}.make (yyvs50.item (yyvsp50).symbol))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp15 := yyvsp15 + 1
	yyvsp50 := yyvsp50 -1
	if yyvsp15 >= yyvsc15 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs15")
		end
		yyvsc15 := yyvsc15 + yyInitial_yyvs_size
		yyvs15 := yyspecial_routines15.aliased_resized_area (yyvs15, yyvsc15)
	end
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 197 then
--|#line 1674 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1674")
end

			yyval15 := yyvs15.item (yyvsp15)

			if yyval15.attribute_with_name ("value").children.there_exists (
					agent (co: C_OBJECT; a_val: INTEGER): BOOLEAN
						do
							Result := attached {C_INTEGER} co as ci and then ci.valid_value (a_val)
						end (?, yyvs50.item (yyvsp50).value)
				)
			then
				abort_with_error (ec_VCOV, <<yyvs50.item (yyvsp50).value.out>>)

			elseif yyval15.attribute_with_name ("symbol").children.there_exists (
					agent (co: C_OBJECT; a_sym: TERMINOLOGY_CODE): BOOLEAN
						do
							Result := attached {C_TERMINOLOGY_CODE} co as ctc and then ctc.valid_value (a_sym)
						end (?, create {TERMINOLOGY_CODE}.make (Local_terminology_id, yyvs50.item (yyvsp50).symbol))
				)
			then
				abort_with_error (ec_VCOC, <<yyvs50.item (yyvsp50).symbol>>)

			elseif attached {C_INTEGER} yyval15.attribute_with_name ("value").children.first as ci and 
				attached {C_TERMINOLOGY_CODE} yyval15.attribute_with_name ("symbol").children.first as ctc 
			then
				ci.add_value (yyvs50.item (yyvsp50).value)
				ctc.add_tuple_code (yyvs50.item (yyvsp50).symbol)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp50 := yyvsp50 -1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 198 then
--|#line 1703 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1703")
end

			yyval15 := yyvs15.item (yyvsp15)

			-- assumed value for C_DV_ORDINAL not supported
			add_warning (ec_WDTOAV, Void)
 		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 199 then
--|#line 1710 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1710")
end

			abort_with_error (ec_SCOAV, Void)
 		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 200 then
--|#line 1716 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1716")
end

			create yyval50.make (yyvs3.item (yyvsp3), yyvs5.item (yyvsp5).first_code)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp50 := yyvsp50 + 1
	yyvsp3 := yyvsp3 -1
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
when 201 then
--|#line 1720 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1720")
end

			abort_with_error (ec_STCV, <<c_attrs.item.path>>)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp50 := yyvsp50 + 1
	yyvsp3 := yyvsp3 -1
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
when 202 then
--|#line 1731 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1731")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 203 then
--|#line 1735 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1735")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 204 then
--|#line 1741 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1741")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 205 then
--|#line 1745 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1745")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 206 then
--|#line 1758 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1758")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 207 then
--|#line 1764 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1764")
end

			create yyval28.make(0)
			yyval28.extend(yyvs2.item (yyvsp2 - 1))
			yyval28.extend(yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp28 := yyvsp28 + 1
	yyvsp2 := yyvsp2 -2
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
when 208 then
--|#line 1770 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1770")
end

			yyvs28.item (yyvsp28).extend(yyvs2.item (yyvsp2))
			yyval28 := yyvs28.item (yyvsp28)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
when 209 then
--|#line 1778 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1778")
end

			yyval28 := yyvs28.item (yyvsp28)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
when 210 then
--|#line 1782 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1782")
end

			create yyval28.make (0)
			yyval28.extend (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp28 := yyvsp28 + 1
	yyvsp2 := yyvsp2 -1
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
when 211 then
--|#line 1789 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1789")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 212 then
--|#line 1792 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1792")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 213 then
--|#line 1795 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1795")
end

			yyval3 := - yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 214 then
--|#line 1800 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1800")
end

			create yyval29.make(0)
			yyval29.extend(yyvs3.item (yyvsp3 - 1))
			yyval29.extend(yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp29 := yyvsp29 + 1
	yyvsp3 := yyvsp3 -2
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
when 215 then
--|#line 1806 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1806")
end

			yyvs29.item (yyvsp29).extend(yyvs3.item (yyvsp3))
			yyval29 := yyvs29.item (yyvsp29)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
when 216 then
--|#line 1811 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1811")
end

			create yyval29.make(0)
			yyval29.extend(yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp29 := yyvsp29 + 1
	yyvsp3 := yyvsp3 -1
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
when 217 then
--|#line 1818 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1818")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create {PROPER_INTERVAL [INTEGER]} yyval36.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp36 := yyvsp36 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -2
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
--|#line 1826 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1826")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create {PROPER_INTERVAL [INTEGER]} yyval36.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp36 := yyvsp36 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp3 := yyvsp3 -2
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
--|#line 1834 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1834")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create {PROPER_INTERVAL [INTEGER]} yyval36.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp36 := yyvsp36 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp3 := yyvsp3 -2
	if yyvsp36 >= yyvsc36 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs36")
		end
		yyvsc36 := yyvsc36 + yyInitial_yyvs_size
		yyvs36 := yyspecial_routines36.aliased_resized_area (yyvs36, yyvsc36)
	end
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
when 220 then
--|#line 1842 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1842")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create {PROPER_INTERVAL [INTEGER]} yyval36.make_bounded (yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp36 := yyvsp36 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp3 := yyvsp3 -2
	if yyvsp36 >= yyvsc36 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs36")
		end
		yyvsc36 := yyvsc36 + yyInitial_yyvs_size
		yyvs36 := yyspecial_routines36.aliased_resized_area (yyvs36, yyvsc36)
	end
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
when 221 then
--|#line 1850 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1850")
end

			create {PROPER_INTERVAL [INTEGER]} yyval36.make_lower_unbounded (yyvs3.item (yyvsp3), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp36 := yyvsp36 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp36 >= yyvsc36 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs36")
		end
		yyvsc36 := yyvsc36 + yyInitial_yyvs_size
		yyvs36 := yyspecial_routines36.aliased_resized_area (yyvs36, yyvsc36)
	end
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
when 222 then
--|#line 1854 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1854")
end

			create {PROPER_INTERVAL [INTEGER]} yyval36.make_lower_unbounded (yyvs3.item (yyvsp3), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp36 := yyvsp36 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp36 >= yyvsc36 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs36")
		end
		yyvsc36 := yyvsc36 + yyInitial_yyvs_size
		yyvs36 := yyspecial_routines36.aliased_resized_area (yyvs36, yyvsc36)
	end
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
when 223 then
--|#line 1858 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1858")
end

			create {PROPER_INTERVAL [INTEGER]} yyval36.make_upper_unbounded (yyvs3.item (yyvsp3), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp36 := yyvsp36 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp36 >= yyvsc36 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs36")
		end
		yyvsc36 := yyvsc36 + yyInitial_yyvs_size
		yyvs36 := yyspecial_routines36.aliased_resized_area (yyvs36, yyvsc36)
	end
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
when 224 then
--|#line 1862 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1862")
end

			create {PROPER_INTERVAL [INTEGER]} yyval36.make_upper_unbounded (yyvs3.item (yyvsp3), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp36 := yyvsp36 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp36 >= yyvsc36 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs36")
		end
		yyvsc36 := yyvsc36 + yyInitial_yyvs_size
		yyvs36 := yyspecial_routines36.aliased_resized_area (yyvs36, yyvsc36)
	end
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
when 225 then
--|#line 1866 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1866")
end

			create {POINT_INTERVAL [INTEGER]} yyval36.make (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp36 := yyvsp36 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp3 := yyvsp3 -1
	if yyvsp36 >= yyvsc36 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs36")
		end
		yyvsc36 := yyvsc36 + yyInitial_yyvs_size
		yyvs36 := yyspecial_routines36.aliased_resized_area (yyvs36, yyvsc36)
	end
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
when 226 then
--|#line 1872 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1872")
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
when 227 then
--|#line 1878 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1878")
end

			yyvs42.item (yyvsp42).extend(yyvs36.item (yyvsp36))
			yyval42 := yyvs42.item (yyvsp42)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp36 := yyvsp36 -1
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
when 228 then
--|#line 1883 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1883")
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
when 229 then
--|#line 1890 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1890")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 230 then
--|#line 1894 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1894")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 231 then
--|#line 1898 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1898")
end

			yyval4 := - yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 232 then
--|#line 1904 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1904")
end

			create yyval30.make(0)
			yyval30.extend(yyvs4.item (yyvsp4 - 1))
			yyval30.extend(yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp30 := yyvsp30 + 1
	yyvsp4 := yyvsp4 -2
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
when 233 then
--|#line 1910 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1910")
end

			yyvs30.item (yyvsp30).extend(yyvs4.item (yyvsp4))
			yyval30 := yyvs30.item (yyvsp30)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
when 234 then
--|#line 1915 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1915")
end

			create yyval30.make(0)
			yyval30.extend(yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp30 := yyvsp30 + 1
	yyvsp4 := yyvsp4 -1
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
when 235 then
--|#line 1922 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1922")
end

			if yyvs4.item (yyvsp4 - 1) <= yyvs4.item (yyvsp4) then
				create {PROPER_INTERVAL [REAL]} yyval37.make_bounded(yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs4.item (yyvsp4 - 1).out, yyvs4.item (yyvsp4).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp37 := yyvsp37 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp4 := yyvsp4 -2
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
--|#line 1930 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1930")
end

			if yyvs4.item (yyvsp4 - 1) <= yyvs4.item (yyvsp4) then
				create {PROPER_INTERVAL [REAL]} yyval37.make_bounded(yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs4.item (yyvsp4 - 1).out, yyvs4.item (yyvsp4).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp37 := yyvsp37 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp4 := yyvsp4 -2
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
--|#line 1938 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1938")
end

			if yyvs4.item (yyvsp4 - 1) <= yyvs4.item (yyvsp4) then
				create {PROPER_INTERVAL [REAL]} yyval37.make_bounded(yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs4.item (yyvsp4 - 1).out, yyvs4.item (yyvsp4).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp37 := yyvsp37 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp4 := yyvsp4 -2
	if yyvsp37 >= yyvsc37 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs37")
		end
		yyvsc37 := yyvsc37 + yyInitial_yyvs_size
		yyvs37 := yyspecial_routines37.aliased_resized_area (yyvs37, yyvsc37)
	end
	yyspecial_routines37.force (yyvs37, yyval37, yyvsp37)
end
when 238 then
--|#line 1946 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1946")
end

			if yyvs4.item (yyvsp4 - 1) <= yyvs4.item (yyvsp4) then
				create {PROPER_INTERVAL [REAL]} yyval37.make_bounded(yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs4.item (yyvsp4 - 1).out, yyvs4.item (yyvsp4).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp37 := yyvsp37 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp4 := yyvsp4 -2
	if yyvsp37 >= yyvsc37 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs37")
		end
		yyvsc37 := yyvsc37 + yyInitial_yyvs_size
		yyvs37 := yyspecial_routines37.aliased_resized_area (yyvs37, yyvsc37)
	end
	yyspecial_routines37.force (yyvs37, yyval37, yyvsp37)
end
when 239 then
--|#line 1954 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1954")
end

			create {PROPER_INTERVAL [REAL]} yyval37.make_lower_unbounded(yyvs4.item (yyvsp4), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp37 := yyvsp37 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp4 := yyvsp4 -1
	if yyvsp37 >= yyvsc37 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs37")
		end
		yyvsc37 := yyvsc37 + yyInitial_yyvs_size
		yyvs37 := yyspecial_routines37.aliased_resized_area (yyvs37, yyvsc37)
	end
	yyspecial_routines37.force (yyvs37, yyval37, yyvsp37)
end
when 240 then
--|#line 1958 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1958")
end

			create {PROPER_INTERVAL [REAL]} yyval37.make_lower_unbounded(yyvs4.item (yyvsp4), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp37 := yyvsp37 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp4 := yyvsp4 -1
	if yyvsp37 >= yyvsc37 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs37")
		end
		yyvsc37 := yyvsc37 + yyInitial_yyvs_size
		yyvs37 := yyspecial_routines37.aliased_resized_area (yyvs37, yyvsc37)
	end
	yyspecial_routines37.force (yyvs37, yyval37, yyvsp37)
end
when 241 then
--|#line 1962 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1962")
end

			create {PROPER_INTERVAL [REAL]} yyval37.make_upper_unbounded(yyvs4.item (yyvsp4), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp37 := yyvsp37 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp4 := yyvsp4 -1
	if yyvsp37 >= yyvsc37 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs37")
		end
		yyvsc37 := yyvsc37 + yyInitial_yyvs_size
		yyvs37 := yyspecial_routines37.aliased_resized_area (yyvs37, yyvsc37)
	end
	yyspecial_routines37.force (yyvs37, yyval37, yyvsp37)
end
when 242 then
--|#line 1966 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1966")
end

			create {PROPER_INTERVAL [REAL]} yyval37.make_upper_unbounded(yyvs4.item (yyvsp4), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp37 := yyvsp37 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp4 := yyvsp4 -1
	if yyvsp37 >= yyvsc37 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs37")
		end
		yyvsc37 := yyvsc37 + yyInitial_yyvs_size
		yyvs37 := yyspecial_routines37.aliased_resized_area (yyvs37, yyvsc37)
	end
	yyspecial_routines37.force (yyvs37, yyval37, yyvsp37)
end
when 243 then
--|#line 1970 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1970")
end

			create {POINT_INTERVAL [REAL]} yyval37.make(yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp37 := yyvsp37 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp4 := yyvsp4 -1
	if yyvsp37 >= yyvsc37 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs37")
		end
		yyvsc37 := yyvsc37 + yyInitial_yyvs_size
		yyvs37 := yyspecial_routines37.aliased_resized_area (yyvs37, yyvsc37)
	end
	yyspecial_routines37.force (yyvs37, yyval37, yyvsp37)
end
when 244 then
--|#line 1976 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1976")
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
when 245 then
--|#line 1982 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1982")
end

			yyvs43.item (yyvsp43).extend(yyvs37.item (yyvsp37))
			yyval43 := yyvs43.item (yyvsp43)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp37 := yyvsp37 -1
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
when 246 then
--|#line 1987 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1987")
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
when 247 then
--|#line 1994 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1994")
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
when 248 then
--|#line 1998 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 1998")
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
when 249 then
--|#line 2004 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2004")
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
when 250 then
--|#line 2010 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2010")
end

			yyvs31.item (yyvsp31).extend(yyvs23.item (yyvsp23))
			yyval31 := yyvs31.item (yyvsp31)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp23 := yyvsp23 -1
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 251 then
--|#line 2015 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2015")
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
when 252 then
--|#line 2022 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2022")
end

			if valid_iso8601_date(yyvs2.item (yyvsp2)) then
				create yyval24.make_from_string(yyvs2.item (yyvsp2))
			else
				abort_with_error (ec_VIDV, <<yyvs2.item (yyvsp2)>>)
			end
		
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
when 253 then
--|#line 2032 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2032")
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
when 254 then
--|#line 2038 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2038")
end

			yyvs32.item (yyvsp32).extend (yyvs24.item (yyvsp24))
			yyval32 := yyvs32.item (yyvsp32)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp24 := yyvsp24 -1
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 255 then
--|#line 2043 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2043")
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
when 256 then
--|#line 2050 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2050")
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
when 257 then
--|#line 2058 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2058")
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
when 258 then
--|#line 2066 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2066")
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
when 259 then
--|#line 2074 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2074")
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
when 260 then
--|#line 2082 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2082")
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
when 261 then
--|#line 2086 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2086")
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
when 262 then
--|#line 2090 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2090")
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
when 263 then
--|#line 2094 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2094")
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
when 264 then
--|#line 2098 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2098")
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
when 265 then
--|#line 2104 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2104")
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
when 266 then
--|#line 2110 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2110")
end

			yyvs45.item (yyvsp45).extend(yyvs39.item (yyvsp39))
			yyval45 := yyvs45.item (yyvsp45)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp39 := yyvsp39 -1
	yyspecial_routines45.force (yyvs45, yyval45, yyvsp45)
end
when 267 then
--|#line 2115 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2115")
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
when 268 then
--|#line 2122 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2122")
end

			if valid_iso8601_time(yyvs2.item (yyvsp2)) then
				create yyval26.make_from_string(yyvs2.item (yyvsp2))
			else
				abort_with_error (ec_VITV, <<yyvs2.item (yyvsp2)>>)
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
when 269 then
--|#line 2132 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2132")
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
when 270 then
--|#line 2138 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2138")
end

			yyvs33.item (yyvsp33).extend(yyvs26.item (yyvsp26))
			yyval33 := yyvs33.item (yyvsp33)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp26 := yyvsp26 -1
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 271 then
--|#line 2143 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2143")
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
when 272 then
--|#line 2150 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2150")
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
when 273 then
--|#line 2158 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2158")
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
when 274 then
--|#line 2166 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2166")
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
when 275 then
--|#line 2174 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2174")
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
when 276 then
--|#line 2182 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2182")
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
when 277 then
--|#line 2186 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2186")
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
when 278 then
--|#line 2190 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2190")
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
when 279 then
--|#line 2194 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2194")
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
when 280 then
--|#line 2198 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2198")
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
when 281 then
--|#line 2204 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2204")
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
when 282 then
--|#line 2210 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2210")
end

			yyvs44.item (yyvsp44).extend(yyvs38.item (yyvsp38))
			yyval44 := yyvs44.item (yyvsp44)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp38 := yyvsp38 -1
	yyspecial_routines44.force (yyvs44, yyval44, yyvsp44)
end
when 283 then
--|#line 2215 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2215")
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
when 284 then
--|#line 2222 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2222")
end

			if valid_iso8601_date_time(yyvs2.item (yyvsp2)) then
				create yyval25.make_from_string(yyvs2.item (yyvsp2))
			else
				abort_with_error (ec_VIDTV, <<yyvs2.item (yyvsp2)>>)
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
when 285 then
--|#line 2232 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2232")
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
when 286 then
--|#line 2238 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2238")
end

			yyvs34.item (yyvsp34).extend(yyvs25.item (yyvsp25))
			yyval34 := yyvs34.item (yyvsp34)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp25 := yyvsp25 -1
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 287 then
--|#line 2243 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2243")
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
when 288 then
--|#line 2250 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2250")
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
when 289 then
--|#line 2258 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2258")
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
when 290 then
--|#line 2266 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2266")
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
when 291 then
--|#line 2274 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2274")
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
when 292 then
--|#line 2282 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2282")
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
when 293 then
--|#line 2286 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2286")
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
when 294 then
--|#line 2290 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2290")
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
when 295 then
--|#line 2294 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2294")
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
when 296 then
--|#line 2298 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2298")
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
when 297 then
--|#line 2304 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2304")
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
when 298 then
--|#line 2310 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2310")
end

			yyvs46.item (yyvsp46).extend(yyvs40.item (yyvsp40))
			yyval46 := yyvs46.item (yyvsp46)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp40 := yyvsp40 -1
	yyspecial_routines46.force (yyvs46, yyval46, yyvsp46)
end
when 299 then
--|#line 2315 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2315")
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
when 300 then
--|#line 2322 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2322")
end

			if valid_iso8601_duration(yyvs2.item (yyvsp2)) then
				create yyval27.make_from_string(yyvs2.item (yyvsp2))
			else
				abort_with_error (ec_VIDUV, <<yyvs2.item (yyvsp2)>>)
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
when 301 then
--|#line 2332 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2332")
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
when 302 then
--|#line 2338 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2338")
end

			yyvs35.item (yyvsp35).extend(yyvs27.item (yyvsp27))
			yyval35 := yyvs35.item (yyvsp35)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp27 := yyvsp27 -1
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 303 then
--|#line 2343 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2343")
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
when 304 then
--|#line 2350 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2350")
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
when 305 then
--|#line 2358 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2358")
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
when 306 then
--|#line 2366 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2366")
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
when 307 then
--|#line 2374 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2374")
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
when 308 then
--|#line 2382 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2382")
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
when 309 then
--|#line 2386 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2386")
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
when 310 then
--|#line 2390 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2390")
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
when 311 then
--|#line 2394 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2394")
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
when 312 then
--|#line 2398 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2398")
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
when 313 then
--|#line 2404 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2404")
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
when 314 then
--|#line 2410 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2410")
end

			yyvs47.item (yyvsp47).extend(yyvs41.item (yyvsp41))
			yyval47 := yyvs47.item (yyvsp47)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp41 := yyvsp41 -1
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
when 315 then
--|#line 2415 "cadl_14_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_14_parser.y' at line 2415")
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
			    0,  169,  169,  169,  170,  105,  104,  104,  104,  104,
			   99,   99,  171,  171,  171,  174,  174,  174,  174,  174,
			  174,  174,  174,  174,   96,   96,   97,   97,   97,  109,
			  109,  108,  107,  107,  107,  107,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  172,  173,  173,  175,  175,
			  176,  176,  176,  110,  178,  178,  178,  177,  179,  179,
			  180,  180,  181,  182,  182,   93,   93,   94,   94,   92,
			   92,   95,   95,   95,   95,  111,  111,  112,  112,  113,
			  113,  113,  113,  119,  120,  120,  115,  115,  115,  115,
			  116,  155,  155,  155,  155,  122,  122,  117,  123,  123,

			  114,  114,  118,  121,  121,  121,  154,  154,  154,  154,
			  154,  154,  153,  153,  153,  153,  153,  101,  101,  103,
			  103,  156,  156,  157,  157,  157,  157,  157,  157,  157,
			  157,  100,  100,  100,  102,  102,  102,  102,  167,  167,
			  167,  167,  167,  167,  166,  166,  166,  166,  166,  166,
			  164,  164,  164,  164,  164,  164,  164,  165,  165,  165,
			  165,  165,  165,  165,  162,  162,  162,  162,  162,  162,
			  162,  163,  163,  163,  163,  163,  163,  163,  163,  163,
			  161,  161,  161,  161,  161,  168,  168,  168,  168,  168,
			  168,  160,  160,  160,  160,  160,  158,  158,  158,  158,

			  159,  159,  131,  131,   98,   98,  132,  133,  133,  133,
			  133,  124,  124,  124,  134,  134,  134,  141,  141,  141,
			  141,  141,  141,  141,  141,  141,  147,  147,  147,  125,
			  125,  125,  135,  135,  135,  142,  142,  142,  142,  142,
			  142,  142,  142,  142,  148,  148,  148,  126,  126,  136,
			  136,  136,  127,  137,  137,  137,  144,  144,  144,  144,
			  144,  144,  144,  144,  144,  150,  150,  150,  129,  138,
			  138,  138,  143,  143,  143,  143,  143,  143,  143,  143,
			  143,  149,  149,  149,  128,  139,  139,  139,  145,  145,
			  145,  145,  145,  145,  145,  145,  145,  151,  151,  151,

			  130,  140,  140,  140,  146,  146,  146,  146,  146,  146,
			  146,  146,  146,  152,  152,  152, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    2,    2,    2,    2,    2,    4,    3,    1,    8,    9,
			    2,   12,   15,   15,   19,   19,   19,   19,   20,   21,
			   21,   21,   21,   21,   22,   22,   19,    3,    4,    2,
			    1,   19,   19,    4,    3,    4,    3,    1,    2,    2,
			    1,    2,    2,    1,    1,    9,    2,    2,    2,    2,
			    1,   13,    1,    1,    1,    1,    1,    2,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    2,    1,    1,    1,   19,    1,    1,    2,    1,    1,
			    1,   19,    1,    2,   19,   19,    1,   19,    1,    1,

			    1,    1,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    1,    1,    1,    5,    5,    2,    2,   16,
			    3,    4,   23,   24,   25,   26,   27,   28,   29,   30,
			   31,   32,   33,   34,   35,   36,   37,   38,   39,   40,
			   41,   42,   43,   44,   45,   46,   47,   51,   52,   53,
			   54,   55,   56,   57,   58,   59,   16,   59,    1,    1,
			    1,    2,    1,   18,    1,    1,    1,    1,    1,    1,
			   19,    1,    1,    1,    1,    3,    4,   24,   25,   26,
			   27,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    3,   14,    3,    2,    1,    1,
			   13,    1,    1,    1,    3,    4,   24,   25,   26,   27,
			    3,    4,   24,   25,   26,   27,    3,    4,   24,   25,
			   26,   27,    3,    4,   24,   25,   26,   27,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,   41,    1,    2,    1,    3,    1,    1,    1,    4,
			    1,    1,    1,   23,    1,   24,    1,   25,    1,   26,
			    1,   27,    1,    2,    3,    4,   23,   24,   26,   25,

			   27,    1,    1,   36,    1,    1,   37,    1,    1,   38,
			    1,    1,   39,    1,    1,   40,    1,   41,   36,   37,
			   38,   39,   40,   41,    1,   23,    2,    1,    2,    1,
			   25,    1,   27,    1,   24,    1,   26,    1,    4,    1,
			    3,    1,    1,    1,    1,    1,    1,   48,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    3,    1,    4,    1,   24,    1,   25,    1,   26,    1,
			   27,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    3,    2,    1,    1,
			    1,    1,    1,    1,    1,    7,    1,   10,   11,    2,
			   16,   17,   17,   17,    3,   15,   50,    1,    1,    1,
			    1,    1,    3,    1,    4,    1,   24,    1,   25,    1,
			   26,    1,   27,    3,    1,    4,    1,   24,    1,   25,
			    1,   26,    1,   27,    1,    1,    3,   14,    1,    1,
			    2,    1,    2,    2,    1,   13,    1,    1,    1,    1,
			    1,    1,    1,    3,    1,    4,    1,   24,    1,   25,
			    1,   26,    1,   27,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,   14,   49,    2,   13,
			    2,    2,    1,    1,    1,    5,    1,    3,    3,   50,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    3,    1,    1,   13,    2,    1,   13,    1,    8,   16,
			    1,    1,    1,    1,    1,    1,    2,    2,    8,    1,
			    8,    1,    1,    1,    1,    1,    8,    1,   16,    1,
			    1,    1,    1,    1,    1,    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER]
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    2,    3,    4,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    5,    5,    1,    1,    1,
			    2,    2,    2,    6,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    7,    1,    1,    1,    1,    1,
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
			    0,  105,  203,  205,  204,  229,  211,    3,    2,   69,
			  202,    0,  131,    0,   72,   76,   75,   98,   77,   78,
			   82,   99,   73,   80,  100,   79,    0,  103,  104,    0,
			    1,    0,    0,  231,  213,  230,  212,    0,   87,   86,
			   89,   11,   10,    0,    0,   70,  202,    7,    6,    0,
			    0,    5,    0,   92,   93,   91,   94,    0,  116,  112,
			  113,  115,  114,  110,  108,  111,  109,  107,  106,    0,
			    0,    0,   81,  101,    0,    0,    0,    8,    0,  133,
			    0,   90,    0,  105,  102,   97,   74,   71,   88,  248,

			  247,    0,  179,  172,  150,  157,  164,  300,  284,  268,
			  252,  182,  190,  188,  189,  187,  186,  185,  180,    0,
			  138,  144,    0,  151,  165,  158,  173,  181,  139,  145,
			  193,  152,  159,  166,  174,  140,  146,  160,  153,  167,
			  175,  141,  147,  161,  154,  168,  176,   44,   42,   40,
			   41,   38,   39,   37,   36,   43,    0,    0,    0,    0,
			   45,  117,   14,   51,    0,   12,   13,   46,   48,   49,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   83,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   84,
			   85,  135,    0,    0,  211,    0,  134,   58,    0,    0,
			  121,    0,    4,   47,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  225,
			    0,  243,    0,  264,    0,  296,    0,  280,    0,  312,
			    0,  171,  210,  207,  216,  214,    0,    0,  234,  232,
			  251,  248,  247,  249,  255,  253,  287,  285,  271,  269,
			  303,  301,  209,  208,  215,  233,  250,  254,  270,  286,

			  302,  228,    0,  226,  246,    0,  244,  283,    0,  281,
			  267,    0,  265,  299,    0,  297,  315,  313,  227,  245,
			  282,  266,  298,  314,  195,  194,  206,  184,  183,  170,
			  169,  178,  177,  156,  155,  163,  162,  149,  148,  143,
			  142,    0,  132,    0,    0,    0,    0,   53,    0,  224,
			  242,  263,  295,  279,  311,  222,  240,  261,  293,  277,
			  309,    0,  223,    0,  241,    0,  262,    0,  294,    0,
			  278,    0,  310,  221,  239,  260,  292,  276,  308,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  137,  136,   59,    0,    0,
			    0,    0,    0,    0,   22,   21,   23,   16,   17,    9,
			   19,  131,   30,   18,  138,   20,  196,   15,   56,   54,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  217,    0,  235,    0,  256,    0,
			  288,    0,  272,    0,  304,    0,  119,    0,    0,   28,
			  131,   35,   34,    0,   52,   31,    0,    0,    0,    0,
			   50,   23,   55,    0,  218,    0,  236,    0,  257,    0,
			  289,    0,  273,    0,  305,  219,  237,  258,  290,  274,

			  306,    0,    0,   60,    0,  118,  123,    0,  131,    0,
			   32,  131,   25,   65,  201,  200,  199,  198,    0,  197,
			  220,  238,  259,  291,  275,  307,    0,    0,    0,   57,
			  120,    0,  122,    0,   27,   33,    0,    0,   67,    0,
			    0,   62,   61,  126,  124,  125,   26,   24,   66,    0,
			    0,   63,    0,    0,    0,    0,   68,   29,    0,  129,
			  130,  127,  128,   64,    0,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			   18,  538,  550,   19,  427,  428,   56,   21,   61,  230,
			  225,  467,   22,   23,  430,  431,  432,  433,  163,   24,
			   25,   26,   27,   28,   29,   30,   31,   32,   33,   34,
			   35,   36,   37,   38,  122,  123,  124,  125,  126,   39,
			  328,  127,  128,  129,  130,  131,  132,  133,  134,  135,
			  136,  137,  138,  139,  140,  141,  142,  143,  144,  145,
			  146,   79,   80,   67,  347,  507,  435,  436,  147,  148,
			  149,  150,  151,  152,  153,  154,  155,  564,  437,  164,
			  165,  166,  439,  167,  168,  169,  440,  228,  502,  503,
			  527, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			  183,  304,  604,  600,  -13,   31,  816,  751, -32768, -32768,
			  775,  774, -32768, -32768, -32768, -32768, -32768, -32768,  577, -32768,
			   26,  474,  396,  707,  352, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768,  431, -32768, -32768,  737,
			 -32768,  344,  377, -32768, -32768, -32768, -32768,  304, -32768, -32768,
			 -32768, -32768, -32768,  788,  766, -32768, -32768, -32768, -32768,  746,
			   12, -32768,  721, -32768, -32768, -32768, -32768,   21, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,   25,
			   25,  258, -32768, -32768,  325,  767,  767, -32768,  720, -32768,
			   32, -32768,   25, -32768, -32768,  523, -32768,  352, -32768,  538,

			  459,  171, -32768,  675, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  736,  712,
			  735,  734,  733,  732,  731,  730,  729,  728,  727,  726,
			  725,  724,  723,  722,  718,  717,  716,  714,  704,  703,
			  693,  692,  691,  689,  686,  680,  674,  684,  683,  677,
			  671,  669,  663,  662,  644, -32768,  710,  687,   62,  715,
			 -32768,  676, -32768,  670,  682, -32768,    1, -32768, -32768, -32768,
			  442,  203,  203,  203,  203,  510,  490,  485,  484,  477,
			  432,  664,   45, -32768,  108,  117,  121,  131,  205,  188,
			  132,   24,   77,  207,  546,  601,  595,  596,  591,  374,

			  278,  276,  267,  215,  127,  672,  668,  667,  666,  665,
			  664,   13,   35,   22,  130,  225,  166,   38,   55, -32768,
			 -32768, -32768,  698,  697,  650,  606, -32768, -32768,  475,  647,
			  622,  615, -32768, -32768,  659,  658,  654,  653,  652,  640,
			  639,  638,  637,  628,  625,  624,  388,  385,  383,  382,
			  309,  247,  619,  618,  614,  613,  611,  610,  144, -32768,
			  198, -32768,   -5, -32768,    4, -32768,   -4, -32768,  129, -32768,
			  326, -32768, -32768, -32768, -32768, -32768,  635,  630, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,

			 -32768, -32768,  160, -32768, -32768,  302, -32768, -32768,  264, -32768,
			 -32768,  218, -32768, -32768,  331, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768,   68, -32768,  629,  587,  612,  584, -32768,  655, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768,  138, -32768,  196, -32768,   -6, -32768,    0, -32768,   -8,
			 -32768,   98, -32768, -32768, -32768, -32768, -32768, -32768, -32768,   77,
			  607,  207,  605,  601,  603,  596,  602,  595,  599,  591,
			  593,  591,  591,  591,  591,   77,   77,   77,   77,  207,

			  207,  207,  207,  595,  595,  595,  595,  601,  601,  601,
			  601,  596,  596,  596,  596, -32768, -32768, -32768,  598,  627,
			  597,  588,  540,  474, -32768, -32768,  590, -32768, -32768,  386,
			 -32768,  396,  578, -32768,  -24,  371, -32768, -32768, -32768, -32768,
			  711,   77,  589,  207,  586,  601,  585,  596,  583,  595,
			  581,  591,  575,  574, -32768,  573, -32768,  572, -32768,  571,
			 -32768,  551, -32768,  549, -32768,  288,  556,  539,   62, -32768,
			   -1, -32768,  562,  266, -32768, -32768,  544,  421,   46,   77,
			 -32768, -32768, -32768,  520, -32768,  512, -32768,  494, -32768,  492,
			 -32768,  489, -32768,  486, -32768, -32768, -32768, -32768, -32768, -32768,

			 -32768,  465,  -27, -32768,  493, -32768,  404,  446,  396,  422,
			  399,  396, -32768,  327, -32768, -32768, -32768, -32768,  392, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768,  767,  201,  288, -32768,
			 -32768,  284, -32768,  345, -32768, -32768,  361,  577,  289,  312,
			  260, -32768, -32768,  219,  174,  136, -32768, -32768,  577,  577,
			  133, -32768,  767,  162,  170,  128,  577, -32768,   14, -32768,
			 -32768, -32768, -32768, -32768,  106,   80, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -123, -32768, -32768,  -18, -32768, -32768,    7, -32768, -373, -32768,
			  369, -32768, -32768, -32768,  -82, -32768, -32768, -32768, -32768,   23,
			 -32768,  769,  756, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768,   15,  -84,  -80,  226,  -22,  -44,  -53,  -89, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  240,
			  124,   51,   -2, -168,  161, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768,  355, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768,  747, -32768,  832, -32768,
			  483, -32768,  390,  673, -32768, -32768, -32768, -32768, -32768,  301,
			 -32768, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   55,  120,  120,  119,  156,  121,  121,   20,   48,  161,
			  529,  508,  180,   89,  324,  477,   42,  175,  109,  110,
			  110,  176,  109,  329,   41,   16,   15,  108,   59,   16,
			   15,  108,   50,  162,  293,  315,  327,   58,   57,  337,
			  161,  322,   11,   15,   60,  326,   93,  516,  179,  108,
			   16,  563,   49,  282,  281,  273,  339,  178,  475,   16,
			  528,    9,    8,  184,   88,  449,  224,  445,  383,  387,
			   84,   -9,   16,  447,  226,  292,   47,  385,   -9,  177,
			  566,   16,  239,  245,  251,  257,  159,  234,  240,  246,
			  252,  235,  241,  247,  253,   95,  272,  509,    3,    2,

			  275,  291,    3,    2,   97,  279,  565,  170,  294,  300,
			    1,  160,   16,  295,   92,  277,  276,  159,  238,  244,
			  250,  256,   15,  223,  222,  332,  107,  237,  243,  249,
			  255,  331,  223,  222,  340,  533,  289,  338,  536,  223,
			  222,  221,   16,  298,  287,  223,  222,  415,   16,  236,
			  242,  248,  254,  299,  223,  222,  110,  107,  107,  274,
			  107,  282,  281,  336,   16,  285,  270,  335,  278,  330,
			  557,  451,  280,  297,  380,   16,   15,  562,  316,  390,
			  382,  180,  284,  290,   17,  223,  222,   16,   15,   14,
			   13,   12,  109,  334,  277,  276,  110,  109,  108,  107,

			  312,   15,  389,   15,   11,   10,  321,   16,   15,  560,
			  559,  441,   15,  388,  109,  223,  222,  379,  175,  561,
			  386,  223,  222,    9,    8,  176,  333,  555,  110,  109,
			  108,  107,  108,  398,  397,  396,  395,  223,  222,  288,
			  384,    7,    6,  110,  174,  173,  172,  171,    3,    2,
			  110,    5,  309,    4,  314,  179,  286,  416,  320,   96,
			    3,    2,   16,   15,  434,  554,  313,  512,  121,  443,
			  178,  381,    1,  277,  276,  277,  276,  442,  511,   11,
			    3,    2,  452,  444,  277,  276,  372,  541,  540,  177,
			  109,  410,  409,  408,  407,  453,  552,  371,    9,    8,

			  463,  455,  239,  245,  251,  257,  311,   15,   16,   15,
			  553,  234,  240,  246,  252,  308,  450,  305,  310,  235,
			  241,  247,  253,  448,  306,   11,    5,  307,    4,  304,
			  319,  545,  544,  543,  461,    3,    2,  406,  405,  404,
			  403,  459,  271,  446,    9,    8,  549,    1,  370,  551,
			  238,  244,  250,  256,  107,  429,  434,  483,  108,  369,
			  121,  457,  493,  485,  547,  317,  546,  237,  243,  249,
			  255,  323,    5,  501,    4,  402,  401,  400,  399,  277,
			  276,    3,    2,  537,  226,  236,  242,  248,  254,   66,
			   65,   64,   63,    1,  517,  518,  491,   58,   57,  394,

			  393,  392,  391,  489,  414,  413,  412,  411,   66,   65,
			   64,   63,  283,  302,  548,   98,   66,   65,   64,   63,
			  296,  368,  366,  487,  364,  301,  556,  362,  470,  472,
			  473,  477,  367,  365,   82,  363,  515,  325,  361,  303,
			  514,   60,  120,  534,  539,  318,  121,  429,   78,   77,
			   76,   75,   74,   73,   72,   71,   70,   69,  479,  535,
			 -191,   68,  478, -191, -191, -191, -191,   83,  120, -191,
			  558,  269,  121, -191, -191, -191, -191, -191, -191, -191,
			   14,   13,  268,  532, -191, -191, -191, -191, -191, -191,
			 -191, -191, -191, -191, -191,  531, -191,  530, -191, -191,

			 -191,  526,   78,   77,   76,   75,   74,   73,   72,   71,
			   70,   69, -191, -191, -191,   68,  267, -191, -191,   72,
			   71,   70,   69,  265,  263,  525,   68,  266,  524,  261,
			   55,  523,   83,  522,  264,  262, -191, -191,   55, -192,
			  260,  471, -192, -192, -192, -192,   14,   13, -192,  259,
			 -191,  521, -192, -192, -192, -192, -192, -192, -192,  520,
			  258,  344,  343, -192, -192, -192, -192, -192, -192, -192,
			 -192, -192, -192, -192,  510, -192,  505, -192, -192, -192,
			  513,   16,   15,   14,   13,   12,  282,  281,  500,  469,
			  499, -192, -192, -192,   14,   13, -192, -192,   11,   10,

			   72,   71,   70,   69,   46,   45,  504,   68,   44,   43,
			  498,  497,  496,  495,  494, -192, -192,    9,    8,  107,
			  492,  109,  490,  108,  488,  486,  110,  474,  484, -192,
			  476,  466,  464,  468,  465,   45,  420,  417,  462,  418,
			   43,  460,  458,  342,  456,    5,  454,    4,  419,  378,
			  377,  348,  376,  375,    3,    2,  426,  374,  373,   16,
			   15,   14,   13,  360,  359,  118,    1,  358,  346,  117,
			  116,  115,  114,  113,  112,  111,  357,  356,  355,  354,
			  110,  109,  108,  107,  106,  105,  104,  103,  102,  425,
			  424,  353,  352,  351,  101,  100,   99,  350,  349,  345,

			  341,   46,   44,  270,  314,  311,  308,  305,  423,  422,
			  421,  302,  481,    7,    6,   16,   15,   14,   13,  232,
			  229,  118,  231,  227,  220,  117,  116,  115,  114,  113,
			  112,  111,    3,    2,  160,  218,  110,  109,  108,  107,
			  106,  105,  104,  103,  102,  425,  424,  219,  480,  183,
			  101,  100,   99,  217,  216,  181,  158,   90,   87,   62,
			  215,  210,  214,   52,  423,  422,  421,  209,  213,    7,
			    6,   16,   15,  208,  212,  211,  207,  118,  206,  205,
			  204,  117,  116,  115,  114,  113,  112,  111,    3,    2,
			  203,  202,  110,  109,  108,  107,  106,  105,  104,  103,

			  102,  201,   86,  200,  199,  198,  101,  100,   99,  197,
			  196,  195,  194,  193,  192,  191,  190,  189,  188,  187,
			  186,  185,  184,  182,   85,   81,   54,   53,   51,  542,
			  482,  438,   40,  157,  519,   94,   91,  506,    0,  233,
			    0,    0,    0,    0,    3,    2, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			   18,   85,   86,   85,   86,   85,   86,    0,   21,    8,
			   37,   12,  101,    1,    1,   39,    1,  101,   26,   25,
			   25,  101,   26,    1,    1,    4,    5,   27,   21,    4,
			    5,   27,    1,    1,   10,  203,    1,   11,   12,    1,
			    8,  209,   21,    5,   45,   10,   21,    1,  101,   27,
			    4,   37,   21,   40,   41,   10,    1,  101,  431,    4,
			   87,   40,   41,   87,   52,   73,    4,   73,   73,   73,
			   47,   45,    4,   73,  158,   51,   89,   73,   52,  101,
			    0,    4,  171,  172,  173,  174,   85,  171,  172,  173,
			  174,  171,  172,  173,  174,   80,   51,  470,   77,   78,

			  184,  190,   77,   78,   81,  185,    0,   92,  192,  198,
			   89,   79,    4,  193,   89,   77,   78,   85,  171,  172,
			  173,  174,    5,   77,   78,  214,   28,  171,  172,  173,
			  174,    1,   77,   78,  218,  508,  189,  217,  511,   77,
			   78,   79,    4,  196,  188,   77,   78,   79,    4,  171,
			  172,  173,  174,  197,   77,   78,   25,   28,   28,   51,
			   28,   40,   41,  216,    4,  187,   39,    1,   51,  213,
			   37,   73,   51,  195,  258,    4,    5,   49,   51,  268,
			  260,  270,   51,   51,    1,   77,   78,    4,    5,    6,
			    7,    8,   26,  215,   77,   78,   25,   26,   27,   28,

			  202,    5,   73,    5,   21,   22,  208,    4,    5,   47,
			   48,   73,    5,  266,   26,   77,   78,   73,  302,   49,
			  264,   77,   78,   40,   41,  305,    1,   91,   25,   26,
			   27,   28,   27,   73,   74,   75,   76,   77,   78,   51,
			  262,   58,   59,   25,   73,   74,   75,   76,   77,   78,
			   25,   68,  201,   70,   39,  308,   51,  341,  207,    1,
			   77,   78,    4,    5,  348,   91,   51,    1,  348,   73,
			  314,   73,   89,   77,   78,   77,   78,  361,   12,   21,
			   77,   78,  371,  363,   77,   78,   39,   86,   87,  311,
			   26,   73,   74,   75,   76,  379,   36,   50,   40,   41,

			  389,  381,  391,  392,  393,  394,   39,    5,    4,    5,
			   91,  395,  396,  397,  398,   39,  369,   39,   51,  399,
			  400,  401,  402,  367,  200,   21,   68,   51,   70,   51,
			  206,   47,   48,   49,  387,   77,   78,   73,   74,   75,
			   76,  385,  181,  365,   40,   41,   57,   89,   39,   37,
			  403,  404,  405,  406,   28,  348,  440,  441,   27,   50,
			  440,  383,  451,  443,    3,  204,   21,  411,  412,  413,
			  414,  210,   68,   85,   70,   73,   74,   75,   76,   77,
			   78,   77,   78,   56,  468,  407,  408,  409,  410,   64,
			   65,   66,   67,   89,  478,  479,  449,   11,   12,   73,

			   74,   75,   76,  447,   73,   74,   75,   76,   64,   65,
			   66,   67,  186,   39,  537,   90,   64,   65,   66,   67,
			  194,   39,   39,  445,   39,   51,  549,   39,  421,  422,
			  423,   39,   50,   50,   90,   50,   15,  211,   50,  199,
			   19,   45,  526,   21,  526,  205,  526,  440,   71,   72,
			   73,   74,   75,   76,   77,   78,   79,   80,   87,   60,
			    1,   84,   91,    4,    5,    6,    7,   90,  552,   10,
			  552,   39,  552,   14,   15,   16,   17,   18,   19,   20,
			    6,    7,   50,   37,   25,   26,   27,   28,   29,   30,
			   31,   32,   33,   34,   35,   91,   37,    4,   39,   40,

			   41,   36,   71,   72,   73,   74,   75,   76,   77,   78,
			   79,   80,   53,   54,   55,   84,   39,   58,   59,   77,
			   78,   79,   80,   39,   39,   39,   84,   50,   39,   39,
			  548,   39,   90,   39,   50,   50,   77,   78,  556,    1,
			   50,    1,    4,    5,    6,    7,    6,    7,   10,   39,
			   91,   39,   14,   15,   16,   17,   18,   19,   20,   39,
			   50,   86,   87,   25,   26,   27,   28,   29,   30,   31,
			   32,   33,   34,   35,   12,   37,   37,   39,   40,   41,
			   36,    4,    5,    6,    7,    8,   40,   41,   39,    1,
			   39,   53,   54,   55,    6,    7,   58,   59,   21,   22,

			   77,   78,   79,   80,    4,    5,   50,   84,    4,    5,
			   39,   39,   39,   39,   39,   77,   78,   40,   41,   28,
			   39,   26,   39,   27,   39,   39,   25,   37,   39,   91,
			   52,    4,   39,   36,   36,    5,   52,    8,   39,   52,
			    5,   39,   39,   37,   39,   68,   39,   70,   36,   39,
			   39,   36,   39,   39,   77,   78,    1,   39,   39,    4,
			    5,    6,    7,   39,   39,   10,   89,   39,   46,   14,
			   15,   16,   17,   18,   19,   20,   39,   39,   39,   39,
			   25,   26,   27,   28,   29,   30,   31,   32,   33,   34,
			   35,   39,   39,   39,   39,   40,   41,   39,   39,   52,

			   50,    4,    4,   39,   39,   39,   39,   39,   53,   54,
			   55,   39,    1,   58,   59,    4,    5,    6,    7,   37,
			   44,   10,   52,    8,   37,   14,   15,   16,   17,   18,
			   19,   20,   77,   78,   79,   91,   25,   26,   27,   28,
			   29,   30,   31,   32,   33,   34,   35,   37,   37,   37,
			   39,   40,   41,   91,   91,   80,   36,   36,   12,   52,
			   91,   87,   91,   12,   53,   54,   55,   87,   91,   58,
			   59,    4,    5,   87,   91,   91,   87,   10,   87,   87,
			   87,   14,   15,   16,   17,   18,   19,   20,   77,   78,
			   87,   87,   25,   26,   27,   28,   29,   30,   31,   32,

			   33,   87,   36,   87,   87,   87,   39,   40,   41,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   36,   88,   52,   52,   12,  528,
			  440,  348,    0,   86,  479,   79,   67,  468,   -1,  166,
			   -1,   -1,   -1,   -1,   77,   78, yyDummy>>)
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

	yyvs10: SPECIAL [C_ARCHETYPE_ROOT]
			-- Stack for semantic values of type C_ARCHETYPE_ROOT

	yyvsc10: INTEGER
			-- Capacity of semantic value stack `yyvs10'

	yyvsp10: INTEGER
			-- Top of semantic value stack `yyvs10'

	yyspecial_routines10: KL_SPECIAL_ROUTINES [C_ARCHETYPE_ROOT]
			-- Routines that ought to be in SPECIAL [C_ARCHETYPE_ROOT]

	yyvs11: SPECIAL [C_COMPLEX_OBJECT_PROXY]
			-- Stack for semantic values of type C_COMPLEX_OBJECT_PROXY

	yyvsc11: INTEGER
			-- Capacity of semantic value stack `yyvs11'

	yyvsp11: INTEGER
			-- Top of semantic value stack `yyvs11'

	yyspecial_routines11: KL_SPECIAL_ROUTINES [C_COMPLEX_OBJECT_PROXY]
			-- Routines that ought to be in SPECIAL [C_COMPLEX_OBJECT_PROXY]

	yyvs12: SPECIAL [SIBLING_ORDER]
			-- Stack for semantic values of type SIBLING_ORDER

	yyvsc12: INTEGER
			-- Capacity of semantic value stack `yyvs12'

	yyvsp12: INTEGER
			-- Top of semantic value stack `yyvs12'

	yyspecial_routines12: KL_SPECIAL_ROUTINES [SIBLING_ORDER]
			-- Routines that ought to be in SPECIAL [SIBLING_ORDER]

	yyvs13: SPECIAL [detachable MULTIPLICITY_INTERVAL]
			-- Stack for semantic values of type detachable MULTIPLICITY_INTERVAL

	yyvsc13: INTEGER
			-- Capacity of semantic value stack `yyvs13'

	yyvsp13: INTEGER
			-- Top of semantic value stack `yyvs13'

	yyspecial_routines13: KL_SPECIAL_ROUTINES [detachable MULTIPLICITY_INTERVAL]
			-- Routines that ought to be in SPECIAL [detachable MULTIPLICITY_INTERVAL]

	yyvs14: SPECIAL [MULTIPLICITY_INTERVAL]
			-- Stack for semantic values of type MULTIPLICITY_INTERVAL

	yyvsc14: INTEGER
			-- Capacity of semantic value stack `yyvs14'

	yyvsp14: INTEGER
			-- Top of semantic value stack `yyvs14'

	yyspecial_routines14: KL_SPECIAL_ROUTINES [MULTIPLICITY_INTERVAL]
			-- Routines that ought to be in SPECIAL [MULTIPLICITY_INTERVAL]

	yyvs15: SPECIAL [C_COMPLEX_OBJECT]
			-- Stack for semantic values of type C_COMPLEX_OBJECT

	yyvsc15: INTEGER
			-- Capacity of semantic value stack `yyvs15'

	yyvsp15: INTEGER
			-- Top of semantic value stack `yyvs15'

	yyspecial_routines15: KL_SPECIAL_ROUTINES [C_COMPLEX_OBJECT]
			-- Routines that ought to be in SPECIAL [C_COMPLEX_OBJECT]

	yyvs16: SPECIAL [C_PRIMITIVE_OBJECT]
			-- Stack for semantic values of type C_PRIMITIVE_OBJECT

	yyvsc16: INTEGER
			-- Capacity of semantic value stack `yyvs16'

	yyvsp16: INTEGER
			-- Top of semantic value stack `yyvs16'

	yyspecial_routines16: KL_SPECIAL_ROUTINES [C_PRIMITIVE_OBJECT]
			-- Routines that ought to be in SPECIAL [C_PRIMITIVE_OBJECT]

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

	yyFinal: INTEGER = 566
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 92
			-- Number of tokens

	yyLast: INTEGER = 845
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 333
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

	invariant_expr: detachable STRING

	time_vc: TIME_VALIDITY_CHECKER
	date_vc: DATE_VALIDITY_CHECKER

	rm_prop_def: detachable BMM_PROPERTY_DEFINITION

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
