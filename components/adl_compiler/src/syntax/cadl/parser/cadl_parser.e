note
	component:   "openEHR ADL Tools"
	description: "Validating parser for Archetype Description Language (ADL)"
	keywords:	 "ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class CADL_PARSER

inherit
	PARSER_VALIDATOR
		rename
			reset as validator_reset,
			make as make_parser_skeleton
		end

	CADL_SCANNER
		rename
			make as make_scanner
		redefine
			reset
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

	SHARED_ADL_APP_RESOURCES
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
			create yyspecial_routines60
			yyvsc60 := yyInitial_yyvs_size
			yyvs60 := yyspecial_routines60.make (yyvsc60)
			create yyspecial_routines61
			yyvsc61 := yyInitial_yyvs_size
			yyvs61 := yyspecial_routines61.make (yyvsc61)
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
			yyvsp61 := -1
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
			yyvs61.keep_head (0)
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
				yyspecial_routines5.force (yyvs5, last_character_value, yyvsp5)
			when 6 then
				yyvsp6 := yyvsp6 + 1
				if yyvsp6 >= yyvsc6 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs6")
					end
					yyvsc6 := yyvsc6 + yyInitial_yyvs_size
					yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
				end
				yyspecial_routines6.force (yyvs6, last_c_dv_quantity_value, yyvsp6)
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
			when 61 then
				yyvsp61 := yyvsp61 - 1
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
			yyval9: C_ARCHETYPE_ROOT
			yyval10: ARCHETYPE_INTERNAL_REF
			yyval16: ARCHETYPE_SLOT
			yyval15: C_PRIMITIVE_OBJECT
			yyval17: C_ATTRIBUTE
			yyval7: detachable ARRAYED_LIST [ASSERTION]
			yyval8: ASSERTION
			yyval18: EXPR_ITEM
			yyval20: EXPR_BINARY_OPERATOR
			yyval19: EXPR_UNARY_OPERATOR
			yyval2: STRING
			yyval21: EXPR_LEAF
			yyval12: detachable MULTIPLICITY_INTERVAL
			yyval13: MULTIPLICITY_INTERVAL
			yyval48: detachable CARDINALITY
			yyval49: CARDINALITY
			yyval59: C_INTEGER
			yyval58: C_REAL
			yyval56: C_DATE
			yyval57: C_TIME
			yyval54: C_DATE_TIME
			yyval55: C_DURATION
			yyval53: C_STRING
			yyval60: C_TERMINOLOGY_CODE
			yyval52: C_BOOLEAN
			yyval51: ORDINAL
			yyval50: CONSTRAINT_REF
			yyval28: ARRAYED_LIST [STRING]
			yyval3: INTEGER
			yyval29: ARRAYED_LIST [INTEGER]
			yyval36: INTERVAL [INTEGER]
			yyval42: ARRAYED_LIST [INTERVAL [INTEGER]]
			yyval4: REAL
			yyval30: ARRAYED_LIST [REAL]
			yyval37: INTERVAL [REAL]
			yyval43: ARRAYED_LIST [INTERVAL [REAL]]
			yyval22: BOOLEAN
			yyval31: ARRAYED_LIST [BOOLEAN]
			yyval23: ISO8601_DATE
			yyval32: ARRAYED_LIST [ISO8601_DATE]
			yyval39: INTERVAL [ISO8601_DATE]
			yyval45: ARRAYED_LIST [INTERVAL [ISO8601_DATE]]
			yyval25: ISO8601_TIME
			yyval33: ARRAYED_LIST [ISO8601_TIME]
			yyval38: INTERVAL [ISO8601_TIME]
			yyval44: ARRAYED_LIST [INTERVAL [ISO8601_TIME]]
			yyval24: ISO8601_DATE_TIME
			yyval34: ARRAYED_LIST [ISO8601_DATE_TIME]
			yyval40: INTERVAL [ISO8601_DATE_TIME]
			yyval46: ARRAYED_LIST [INTERVAL [ISO8601_DATE_TIME]]
			yyval26: ISO8601_DURATION
			yyval35: ARRAYED_LIST [ISO8601_DURATION]
			yyval41: INTERVAL [ISO8601_DURATION]
			yyval47: ARRAYED_LIST [INTERVAL [ISO8601_DURATION]]
			yyval61: TERMINOLOGY_CODE
		do
			if not yy_retried then
				inspect yy_act
when 1 then
--|#line 180 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 180")
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
--|#line 188 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 188")
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
--|#line 196 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 196")
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
--|#line 205 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 205")
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
	yyvsp14 := yyvsp14 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 5 then
--|#line 214 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 214")
end

			-- ok in case where occurrences or node_id is being redefined in a specialised archetype or template
			if differential_syntax then
				debug ("ADL_parse")
					io.put_string (indent + "POP OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "]%N") 
					indent.remove_tail (1)
				end
				yyval1 := object_nodes.item
				object_nodes.remove
			else
				abort_with_error (ec_VCOCDocc, <<yyvs14.item (yyvsp14).rm_type_name, yyvs14.item (yyvsp14).path>>)
			end
		
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
when 6 then
--|#line 230 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 230")
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

				-- put it under current attribute, unless it is the root object, in which case it will be returned
				-- via the 'output' attribute of this parser
				if not c_attrs.is_empty then
					safe_put_c_attribute_child (c_attrs.item, yyvs14.item (yyvsp14))
				end
			else
				abort_with_error (ec_VCORM, <<yyvs14.item (yyvsp14).rm_type_name, yyvs14.item (yyvsp14).path>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp12 := yyvsp12 -1
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 7 then
--|#line 259 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 259")
end

			create yyval14.make_anonymous (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp2 := yyvsp2 -1
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
--|#line 263 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 263")
end

			create yyval14.make_identified (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp14 := yyvsp14 + 1
	yyvsp2 := yyvsp2 -2
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
--|#line 267 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 267")
end

			if differential_syntax then
				create yyval14.make_identified (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
				yyval14.set_sibling_order (yyvs11.item (yyvsp11))
			else
				abort_with_error (ec_SDSF, Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp14 := yyvsp14 + 1
	yyvsp11 := yyvsp11 -1
	yyvsp2 := yyvsp2 -2
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
--|#line 278 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 278")
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
when 11 then
--|#line 282 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 282")
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
when 12 then
--|#line 288 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 288")
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
--|#line 295 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 295")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 14 then
--|#line 298 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 298")
end

			abort_with_error (ec_SCOAT, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 15 then
--|#line 308 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 308")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 16 then
--|#line 311 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 311")
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
when 17 then
--|#line 315 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 315")
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
when 18 then
--|#line 319 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 319")
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
when 19 then
--|#line 323 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 323")
end

			safe_put_c_attribute_child (c_attrs.item, yyvs50.item (yyvsp50))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp50 := yyvsp50 -1
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
--|#line 327 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 327")
end

			safe_put_c_attribute_child (c_attrs.item, yyvs14.item (yyvsp14))
		
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
when 21 then
--|#line 331 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 331")
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
when 22 then
--|#line 335 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 335")
end

			safe_put_c_attribute_child (c_attrs.item, last_c_dv_quantity_value.standard_equivalent)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp6 := yyvsp6 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 23 then
--|#line 339 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 339")
end

			abort_with_error (ec_SDINV, <<odin_parser_error.as_string>>)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 24 then
--|#line 343 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 343")
end

			abort_with_error (ec_SCCOG, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 25 then
--|#line 354 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 354")
end

			if archetype_id_parser.valid_id (yyvs2.item (yyvsp2)) then
				create yyval9.make_external_ref (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
				if attached yyvs12.item (yyvsp12) as occ then
					yyval9.set_occurrences (occ)
				end
			else
				abort_with_error (ec_SUAIDI, <<yyvs2.item (yyvsp2)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp9 := yyvsp9 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
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
--|#line 365 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 365")
end

			if archetype_id_parser.valid_id (yyvs2.item (yyvsp2)) then
				create yyval9.make_slot_filler (yyvs2.item (yyvsp2 - 2), yyvs2.item (yyvsp2), yyvs2.item (yyvsp2 - 1))
				if attached yyvs12.item (yyvsp12) as occ then
					yyval9.set_occurrences (occ)
				end
			else
				abort_with_error (ec_SUAIDI, <<yyvs2.item (yyvsp2 - 1)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp9 := yyvsp9 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp2 := yyvsp2 -3
	yyvsp12 := yyvsp12 -1
	if yyvsp9 >= yyvsc9 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs9")
		end
		yyvsc9 := yyvsc9 + yyInitial_yyvs_size
		yyvs9 := yyspecial_routines9.aliased_resized_area (yyvs9, yyvsc9)
	end
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
when 27 then
--|#line 376 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 376")
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
when 28 then
--|#line 382 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 382")
end

			create og_path.make_from_string (yyvs2.item (yyvsp2))
			if attached arch_internal_ref_node_id as air_node_id then
				create yyval10.make_identified (arch_internal_ref_rm_type_name, air_node_id, yyvs2.item (yyvsp2))
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
			if attached yyvs12.item (yyvsp12) as att_occ then
				yyval10.set_occurrences (att_occ)
			end

			debug ("ADL_parse")
				io.put_string (indent + "create ARCHETYPE_INTERNAL_REF ")
				io.put_string (yyval10.rm_type_name) 
				if yyval10.is_addressable then
					io.put_string ("[" + yyval10.node_id + "] ")
				else
					io.put_string (" ")
				end
				if yyval10.use_target_occurrences then
					io.put_string ("occurrences=(use target) ")
				elseif yyvs12.item (yyvsp12) /= Void then
					io.put_string ("occurrences=" + yyval10.occurrences.as_string + " ")
				end
				io.put_string (" => " + yyval10.target_path + "%N") 
				io.put_string (indent + "C_ATTR " + c_attrs.item.rm_attribute_name + " safe_put_c_attribute_child (ARCHETYPE_INTERNAL_REF)%N") 
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp10 := yyvsp10 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp12 := yyvsp12 -1
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
when 29 then
--|#line 422 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 422")
end

			abort_with_error (ec_SUNPA, Void)
		
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
when 30 then
--|#line 428 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 428")
end

			arch_internal_ref_rm_type_name := yyvs2.item (yyvsp2)
			arch_internal_ref_node_id := Void
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 31 then
--|#line 433 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 433")
end

			arch_internal_ref_rm_type_name := yyvs2.item (yyvsp2 - 1)
			arch_internal_ref_node_id := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 32 then
--|#line 440 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 440")
end

			if attached yyvs7.item (yyvsp7 - 1) as att_c_incs then
				yyvs16.item (yyvsp16).set_includes (att_c_incs)
			end
			if attached yyvs7.item (yyvsp7) as att_c_excs then
				yyvs16.item (yyvsp16).set_excludes (att_c_excs)
			end

			debug ("ADL_parse")
				indent.remove_tail (1)
			end
			yyval16 := yyvs16.item (yyvsp16)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp1 := yyvsp1 -3
	yyvsp7 := yyvsp7 -2
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 33 then
--|#line 454 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 454")
end

			if not (yyvs16.item (yyvsp16).is_closed or yyvs16.item (yyvsp16).is_prohibited) then
				abort_with_error (ec_VASMD, <<yyvs16.item (yyvsp16).rm_type_name, c_attrs.item.path>>)
			end
			yyval16 := yyvs16.item (yyvsp16)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 34 then
--|#line 463 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 463")
end

			if attached yyvs12.item (yyvsp12) as att_occ then
				yyvs16.item (yyvsp16).set_occurrences (att_occ)
			end

			debug ("ADL_parse")
				io.put_string (indent + "create ARCHETYPE_SLOT " + yyvs16.item (yyvsp16).rm_type_name + " [id=" + yyvs16.item (yyvsp16).node_id + "]")
				if attached yyvs12.item (yyvsp12) then
					io.put_string ("; occurrences=(" + yyvs12.item (yyvsp12).as_string + ")") 
				end
				io.new_line
				indent.append ("%T")
			end
			yyval16 := yyvs16.item (yyvsp16)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp12 := yyvsp12 -1
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 35 then
--|#line 481 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 481")
end

			create yyval16.make_anonymous (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp16 := yyvsp16 + 1
	yyvsp1 := yyvsp1 -1
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
when 36 then
--|#line 485 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 485")
end

			if differential_syntax then
				create yyval16.make_anonymous (yyvs2.item (yyvsp2))
				yyval16.set_sibling_order (yyvs11.item (yyvsp11))
			else
				abort_with_error (ec_SDSF, Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp16 := yyvsp16 + 1
	yyvsp11 := yyvsp11 -1
	yyvsp1 := yyvsp1 -1
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
when 37 then
--|#line 494 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 494")
end

			create yyval16.make_identified (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp16 := yyvsp16 + 1
	yyvsp1 := yyvsp1 -1
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
when 38 then
--|#line 498 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 498")
end

			if differential_syntax then
				create yyval16.make_identified (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
				yyval16.set_sibling_order (yyvs11.item (yyvsp11))
			else
				abort_with_error (ec_SDSF, Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp16 := yyvsp16 + 1
	yyvsp11 := yyvsp11 -1
	yyvsp1 := yyvsp1 -1
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
when 39 then
--|#line 507 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 507")
end

			create yyval16.make_anonymous (yyvs2.item (yyvsp2))
			yyval16.set_closed
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp16 := yyvsp16 + 1
	yyvsp1 := yyvsp1 -2
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
when 40 then
--|#line 512 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 512")
end

			create yyval16.make_identified (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
			yyval16.set_closed
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp16 := yyvsp16 + 1
	yyvsp1 := yyvsp1 -2
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
when 41 then
--|#line 517 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 517")
end

			abort_with_error (ec_SUAS, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp16 := yyvsp16 + 1
	yyvsp1 := yyvsp1 -2
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
--|#line 523 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 523")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_INTEGER: " +  yyvs59.item (yyvsp59).as_string + "%N")
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
--|#line 530 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 530")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_REAL: " +  yyvs58.item (yyvsp58).as_string + "%N")
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
when 44 then
--|#line 537 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 537")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_DATE: " +  yyvs56.item (yyvsp56).as_string + "%N")
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
when 45 then
--|#line 544 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 544")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_TIME: " +  yyvs57.item (yyvsp57).as_string + "%N")
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
when 46 then
--|#line 551 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 551")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_DATE_TIME: " +  yyvs54.item (yyvsp54).as_string + "%N")
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
when 47 then
--|#line 558 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 558")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_DURATION: " +  yyvs55.item (yyvsp55).as_string + "%N")
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
when 48 then
--|#line 565 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 565")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_STRING: " +  yyvs53.item (yyvsp53).as_string + "%N")
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
when 49 then
--|#line 572 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 572")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_TERMINOLOGY_CODE: " +  yyvs60.item (yyvsp60).as_string + "%N")
			end
			yyval15 := yyvs60.item (yyvsp60)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp15 := yyvsp15 + 1
	yyvsp60 := yyvsp60 -1
	if yyvsp15 >= yyvsc15 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs15")
		end
		yyvsc15 := yyvsc15 + yyInitial_yyvs_size
		yyvs15 := yyspecial_routines15.aliased_resized_area (yyvs15, yyvsc15)
	end
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 50 then
--|#line 579 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 579")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_BOOLEAN: " +  yyvs52.item (yyvsp52).as_string + "%N")
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
when 51 then
--|#line 588 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 588")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 52 then
--|#line 595 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 595")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 53 then
--|#line 598 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 598")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 54 then
--|#line 603 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 603")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 55 then
--|#line 606 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 606")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 56 then
--|#line 611 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 611")
end

			debug ("ADL_parse")
				io.put_string (indent + "POP ATTR_NODE " + c_attrs.item.rm_attribute_name + "%N") 
				indent.remove_tail (1)
			end
			c_attrs.remove
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp17 := yyvsp17 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 57 then
--|#line 619 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 619")
end

			if differential_syntax then
				c_attrs.remove
			else
				abort_with_error (ec_SCAS, Void)
			end
		
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
when 58 then
--|#line 627 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 627")
end

			abort_with_error (ec_SCAS, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp17 := yyvsp17 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 59 then
--|#line 633 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 633")
end

			rm_attribute_name := yyvs2.item (yyvsp2)
			if not object_nodes.item.has_attribute (rm_attribute_name) then
				if rm_schema.has_property (object_nodes.item.rm_type_name, rm_attribute_name) then
					bmm_prop_def := rm_schema.property_definition (object_nodes.item.rm_type_name, rm_attribute_name)
					if bmm_prop_def.is_container then
						create yyval17.make_multiple (rm_attribute_name, yyvs12.item (yyvsp12), yyvs48.item (yyvsp48))
						c_attrs.put (yyval17)
debug ("ADL_parse")
	io.put_string (indent + "PUSH create ATTR_NODE " + rm_attribute_name + "; container = " + yyval17.is_multiple.out)
	if attached yyvs12.item (yyvsp12) as att_ex then io.put_string (" existence={" + att_ex.as_string + "}") end
	if attached yyvs48.item (yyvsp48) as att_card then io.put_string ("; cardinality=(" + att_card.as_string + ")") end
	io.new_line
	io.put_string (indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_attribute (REL)%N") 
	indent.append ("%T")
end
						object_nodes.item.put_attribute (yyval17)
					elseif yyvs48.item (yyvsp48) = Void then
						create yyval17.make_single (rm_attribute_name, yyvs12.item (yyvsp12))
						c_attrs.put (yyval17)
debug ("ADL_parse")
	io.put_string (indent + "PUSH create ATTR_NODE " + rm_attribute_name + "; container = " + yyval17.is_multiple.out) 
	if attached yyvs12.item (yyvsp12) as att_ex then io.put_string (" existence={" + att_ex.as_string + "}") end
	io.new_line
	io.put_string (indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_attribute (REL)%N") 
	indent.append ("%T")
end
						object_nodes.item.put_attribute (yyval17)
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
	yyvsp17 := yyvsp17 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp48 := yyvsp48 -1
	if yyvsp17 >= yyvsc17 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs17")
		end
		yyvsc17 := yyvsc17 + yyInitial_yyvs_size
		yyvs17 := yyspecial_routines17.aliased_resized_area (yyvs17, yyvsc17)
	end
	yyspecial_routines17.force (yyvs17, yyval17, yyvsp17)
end
when 60 then
--|#line 672 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 672")
end

			create og_path.make_from_string (yyvs2.item (yyvsp2))
			rm_attribute_name := og_path.last.attr_name
			parent_path_str := og_path.parent_path.as_string

			if not object_nodes.item.has_attribute (yyvs2.item (yyvsp2)) then
				-- check RM to see if path is valid, and if it is a container
				if rm_schema.has_property_path (object_nodes.item.rm_type_name, yyvs2.item (yyvsp2)) then
					bmm_prop_def := rm_schema.property_definition_at_path (object_nodes.item.rm_type_name, yyvs2.item (yyvsp2))
					if bmm_prop_def.is_container then
						create yyval17.make_multiple (rm_attribute_name, yyvs12.item (yyvsp12), yyvs48.item (yyvsp48))
						yyval17.set_differential_path (parent_path_str)
						c_attrs.put (yyval17)
debug ("ADL_parse")
	io.put_string (indent + "PUSH create ATTR_NODE " + yyvs2.item (yyvsp2) + "; container = " + yyval17.is_multiple.out) 
	if attached yyvs12.item (yyvsp12) as att_ex then io.put_string (" existence={" + att_ex.as_string + "}") end
	if attached yyvs48.item (yyvsp48) as att_card then io.put_string ("; cardinality=(" + att_card.as_string + ")") end
	io.new_line
	io.put_string (indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_attribute (REL)%N") 
	indent.append ("%T")
end
						object_nodes.item.put_attribute (yyval17)

					elseif yyvs48.item (yyvsp48) = Void then
						create yyval17.make_single (rm_attribute_name, yyvs12.item (yyvsp12))
						yyval17.set_differential_path (parent_path_str)
						c_attrs.put (yyval17)
debug ("ADL_parse")
	io.put_string (indent + "PUSH create ATTR_NODE " + yyvs2.item (yyvsp2) + "; container = " + yyval17.is_multiple.out) 
	if attached yyvs12.item (yyvsp12) as att_ex then io.put_string (" existence={" + att_ex.as_string + "}") end
	io.new_line
	io.put_string (indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_attribute (REL)%N") 
	indent.append ("%T")
end
						object_nodes.item.put_attribute (yyval17)
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
	yyvsp17 := yyvsp17 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp48 := yyvsp48 -1
	if yyvsp17 >= yyvsc17 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs17")
		end
		yyvsc17 := yyvsc17 + yyInitial_yyvs_size
		yyvs17 := yyspecial_routines17.aliased_resized_area (yyvs17, yyvsc17)
	end
	yyspecial_routines17.force (yyvs17, yyval17, yyvsp17)
end
when 61 then
--|#line 720 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 720")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 62 then
--|#line 723 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 723")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 63 then
--|#line 726 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 726")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 64 then
--|#line 731 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 731")
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
when 65 then
--|#line 754 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 754")
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
when 66 then
--|#line 764 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 764")
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
when 67 then
--|#line 773 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 773")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 68 then
--|#line 776 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 776")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 69 then
--|#line 781 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 781")
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
when 70 then
--|#line 790 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 790")
end

			c_attr_tuple_item := 1
			if c_attr_tuple_count = 0 then
				c_attr_tuple.i_th_member (c_attr_tuple_item).put_child (yyvs15.item (yyvsp15))
			elseif attached {C_PRIMITIVE_OBJECT} c_attr_tuple.i_th_member (c_attr_tuple_item).children.first as cpo then
				cpo.merge_tuple (yyvs15.item (yyvsp15))
			end
			debug ("ADL_parse")
				io.put_string (indent + "c_tuple values - add C_PRIMITIVE_OBJECT " + c_attr_tuple.i_th_member (1).rm_attribute_name + " %N")
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp15 := yyvsp15 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 71 then
--|#line 802 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 802")
end

			c_attr_tuple_item := c_attr_tuple_item + 1
			if c_attr_tuple_count = 0 then
				c_attr_tuple.i_th_member (c_attr_tuple_item).put_child (yyvs15.item (yyvsp15))
			elseif attached {C_PRIMITIVE_OBJECT} c_attr_tuple.i_th_member (c_attr_tuple_item).children.first as cpo then
				cpo.merge_tuple (yyvs15.item (yyvsp15))
			end
			debug ("ADL_parse")
				io.put_string (indent + "c_tuple values - add other C_PRIMITIVE_OBJECT " + c_attr_tuple.i_th_member (c_attr_tuple_item).rm_attribute_name + " %N")
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp15 := yyvsp15 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 72 then
--|#line 816 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 816")
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
when 73 then
--|#line 817 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 817")
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
when 74 then
--|#line 826 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 826")
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
when 75 then
--|#line 827 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 827")
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
when 76 then
--|#line 840 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 840")
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
when 77 then
--|#line 845 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 845")
end

			yyvs7.item (yyvsp7).extend (yyvs8.item (yyvsp8))
			yyval7 := yyvs7.item (yyvsp7)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp8 := yyvsp8 -1
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 78 then
--|#line 852 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 852")
end

			create yyval8.make (yyvs18.item (yyvsp18), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp8 := yyvsp8 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyvsp18 := yyvsp18 -1
	if yyvsp8 >= yyvsc8 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs8")
		end
		yyvsc8 := yyvsc8 + yyInitial_yyvs_size
		yyvs8 := yyspecial_routines8.aliased_resized_area (yyvs8, yyvsc8)
	end
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 79 then
--|#line 856 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 856")
end

			create yyval8.make (yyvs18.item (yyvsp18), Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp8 := yyvsp8 + 1
	yyvsp18 := yyvsp18 -1
	if yyvsp8 >= yyvsc8 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs8")
		end
		yyvsc8 := yyvsc8 + yyInitial_yyvs_size
		yyvs8 := yyspecial_routines8.aliased_resized_area (yyvs8, yyvsc8)
	end
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 80 then
--|#line 864 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 864")
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
when 81 then
--|#line 868 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 868")
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
when 82 then
--|#line 876 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 876")
end

			yyval18 := yyvs18.item (yyvsp18)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
when 83 then
--|#line 880 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 880")
end

			yyval18 := yyvs18.item (yyvsp18)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
when 84 then
--|#line 886 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 886")
end

			debug ("ADL_invariant")
				io.put_string (indent + "boolean_expr: REDUCE from boolean_unop_expr: [" + yyvs19.item (yyvsp19).as_string + "]%N") 
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
when 85 then
--|#line 893 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 893")
end

			yyval18 := yyvs20.item (yyvsp20)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp18 := yyvsp18 + 1
	yyvsp20 := yyvsp20 -1
	if yyvsp18 >= yyvsc18 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs18")
		end
		yyvsc18 := yyvsc18 + yyInitial_yyvs_size
		yyvs18 := yyspecial_routines18.aliased_resized_area (yyvs18, yyvsc18)
	end
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
when 86 then
--|#line 899 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 899")
end

			yyval18 := yyvs21.item (yyvsp21)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp18 := yyvsp18 + 1
	yyvsp21 := yyvsp21 -1
	if yyvsp18 >= yyvsc18 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs18")
		end
		yyvsc18 := yyvsc18 + yyInitial_yyvs_size
		yyvs18 := yyspecial_routines18.aliased_resized_area (yyvs18, yyvsc18)
	end
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
when 87 then
--|#line 903 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 903")
end

			debug ("ADL_invariant")
				io.put_string (indent + "boolean_leaf: REDUCE from boolean_constraint: [" + yyvs20.item (yyvsp20).as_string + "]%N") 
			end
			yyval18 := yyvs20.item (yyvsp20)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp18 := yyvsp18 + 1
	yyvsp20 := yyvsp20 -1
	if yyvsp18 >= yyvsc18 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs18")
		end
		yyvsc18 := yyvsc18 + yyInitial_yyvs_size
		yyvs18 := yyspecial_routines18.aliased_resized_area (yyvs18, yyvsc18)
	end
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
when 88 then
--|#line 910 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 910")
end

			yyval18 := yyvs18.item (yyvsp18)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
when 89 then
--|#line 914 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 914")
end

			yyval18 := yyvs20.item (yyvsp20)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp18 := yyvsp18 + 1
	yyvsp20 := yyvsp20 -1
	if yyvsp18 >= yyvsc18 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs18")
		end
		yyvsc18 := yyvsc18 + yyInitial_yyvs_size
		yyvs18 := yyspecial_routines18.aliased_resized_area (yyvs18, yyvsc18)
	end
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
when 90 then
--|#line 924 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 924")
end

			debug ("ADL_invariant")
				io.put_string (indent + "arch_outer_constraint_expr: Archetype outer feature " + yyvs2.item (yyvsp2) + " matches {" + yyvs15.item (yyvsp15).as_string + "}%N") 
			end
			create yyval20.make (create {OPERATOR_KIND}.make (op_matches),
				create {EXPR_LEAF}.make_archetype_ref (yyvs2.item (yyvsp2)),
				create {EXPR_LEAF}.make_constraint (yyvs15.item (yyvsp15)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp20 := yyvsp20 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -3
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
when 91 then
--|#line 935 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 935")
end

			debug ("ADL_invariant")
				io.put_string (indent + "boolean_constraint:" + yyvs2.item (yyvsp2) + " matches {" + yyvs15.item (yyvsp15).as_string + "}%N") 
			end
			create yyval20.make (create {OPERATOR_KIND}.make (op_matches), 
				create {EXPR_LEAF}.make_archetype_definition_ref (yyvs2.item (yyvsp2)),
				create {EXPR_LEAF}.make_constraint (yyvs15.item (yyvsp15)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp20 := yyvsp20 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -3
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
when 92 then
--|#line 944 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 944")
end

			debug ("ADL_invariant")
				io.put_string (indent + "boolean_constraint:" + yyvs2.item (yyvsp2) + " matches {" + yyvs60.item (yyvsp60).as_string + "}%N") 
			end
			create yyval20.make (create {OPERATOR_KIND}.make (op_matches), 
				create {EXPR_LEAF}.make_archetype_definition_ref (yyvs2.item (yyvsp2)),
				create {EXPR_LEAF}.make_coded_term (yyvs60.item (yyvsp60)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp20 := yyvsp20 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -3
	yyvsp60 := yyvsp60 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 93 then
--|#line 959 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 959")
end

			debug ("ADL_invariant")
				io.put_string (indent + "boolean_unop_expr: exists " + yyvs2.item (yyvsp2) + "%N") 
			end
			create yyval19.make (create {OPERATOR_KIND}.make (op_exists), create {EXPR_LEAF}.make_archetype_definition_ref (yyvs2.item (yyvsp2)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp19 := yyvsp19 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp19 >= yyvsc19 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs19")
		end
		yyvsc19 := yyvsc19 + yyInitial_yyvs_size
		yyvs19 := yyspecial_routines19.aliased_resized_area (yyvs19, yyvsc19)
	end
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 94 then
--|#line 966 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 966")
end

			debug ("ADL_invariant")
				io.put_string (indent + "boolean_unop_expr: not " + yyvs2.item (yyvsp2) + "%N") 
			end
			create yyval19.make (create {OPERATOR_KIND}.make (op_not), create {EXPR_LEAF}.make_archetype_definition_ref (yyvs2.item (yyvsp2)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp19 := yyvsp19 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp19 >= yyvsc19 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs19")
		end
		yyvsc19 := yyvsc19 + yyInitial_yyvs_size
		yyvs19 := yyspecial_routines19.aliased_resized_area (yyvs19, yyvsc19)
	end
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 95 then
--|#line 973 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 973")
end

			debug ("ADL_invariant")
				io.put_string (indent + "boolean_unop_expr: not [(" + yyvs18.item (yyvsp18).as_string + ")] %N") 
			end
			create yyval19.make (create {OPERATOR_KIND}.make (op_not), yyvs18.item (yyvsp18))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp19 := yyvsp19 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp18 := yyvsp18 -1
	if yyvsp19 >= yyvsc19 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs19")
		end
		yyvsc19 := yyvsc19 + yyInitial_yyvs_size
		yyvs19 := yyspecial_routines19.aliased_resized_area (yyvs19, yyvsc19)
	end
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 96 then
--|#line 980 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 980")
end

			abort_with_error (ec_SEXPT, Void)
		
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
when 97 then
--|#line 990 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 990")
end

			debug ("ADL_invariant")
				io.put_string (indent + "boolean_binop_expr: [" + yyvs18.item (yyvsp18 - 1).as_string + "] " + yyvs2.item (yyvsp2) + " [" + yyvs18.item (yyvsp18).as_string + "]%N") 
			end
			create yyval20.make (create {OPERATOR_KIND}.make (operator_ids_from_symbols.item (yyvs2.item (yyvsp2))), yyvs18.item (yyvsp18 - 1), yyvs18.item (yyvsp18))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp20 := yyvsp20 + 1
	yyvsp18 := yyvsp18 -2
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
when 98 then
--|#line 999 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 999")
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
when 99 then
--|#line 1003 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1003")
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
when 100 then
--|#line 1007 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1007")
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
when 101 then
--|#line 1011 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1011")
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
when 102 then
--|#line 1021 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1021")
end

			create yyval21.make_boolean (True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp21 := yyvsp21 + 1
	yyvsp1 := yyvsp1 -1
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
--|#line 1025 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1025")
end

			create yyval21.make_boolean (False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp21 := yyvsp21 + 1
	yyvsp1 := yyvsp1 -1
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
--|#line 1035 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1035")
end

			debug ("ADL_invariant")
				io.put_string (indent + "arithmetic_relop_expr: [" + yyvs18.item (yyvsp18 - 1).as_string + "] " + yyvs2.item (yyvsp2) + " [" + yyvs18.item (yyvsp18).as_string + "]%N") 
			end
			create yyval20.make (create {OPERATOR_KIND}.make (operator_ids_from_symbols.item (yyvs2.item (yyvsp2))), yyvs18.item (yyvsp18 - 1), yyvs18.item (yyvsp18))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp20 := yyvsp20 + 1
	yyvsp18 := yyvsp18 -2
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
when 105 then
--|#line 1048 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1048")
end

			yyval18 := yyvs18.item (yyvsp18)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
when 106 then
--|#line 1052 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1052")
end

			yyval18 := yyvs20.item (yyvsp20)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp18 := yyvsp18 + 1
	yyvsp20 := yyvsp20 -1
	if yyvsp18 >= yyvsc18 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs18")
		end
		yyvsc18 := yyvsc18 + yyInitial_yyvs_size
		yyvs18 := yyspecial_routines18.aliased_resized_area (yyvs18, yyvsc18)
	end
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
when 107 then
--|#line 1058 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1058")
end

			yyval18 := yyvs21.item (yyvsp21)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp18 := yyvsp18 + 1
	yyvsp21 := yyvsp21 -1
	if yyvsp18 >= yyvsc18 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs18")
		end
		yyvsc18 := yyvsc18 + yyInitial_yyvs_size
		yyvs18 := yyspecial_routines18.aliased_resized_area (yyvs18, yyvsc18)
	end
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
when 108 then
--|#line 1062 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1062")
end

			debug ("ADL_invariant")
				io.put_string (indent + "(expr) %N") 
			end
			yyval18 := yyvs18.item (yyvsp18)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
when 109 then
--|#line 1075 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1075")
end

			debug ("ADL_invariant")
				io.put_string (indent + "arithmetic_arith_binop_expr: [" + yyvs18.item (yyvsp18 - 1).as_string + "] " + yyvs2.item (yyvsp2) + " [" + yyvs18.item (yyvsp18).as_string + "]%N") 
			end
			create yyval20.make (create {OPERATOR_KIND}.make (operator_ids_from_symbols.item (yyvs2.item (yyvsp2))), yyvs18.item (yyvsp18 - 1), yyvs18.item (yyvsp18))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp20 := yyvsp20 + 1
	yyvsp18 := yyvsp18 -2
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
when 110 then
--|#line 1088 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1088")
end

			debug ("ADL_invariant")
				io.put_string (indent + "arith_leaf - integer: " + yyvs3.item (yyvsp3).out + "%N") 
			end
			create yyval21.make_integer (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp21 := yyvsp21 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 111 then
--|#line 1095 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1095")
end

			debug ("ADL_invariant")
				io.put_string (indent + "arith_leaf - real: " + yyvs4.item (yyvsp4).out + "%N") 
			end
			create yyval21.make_real (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp21 := yyvsp21 + 1
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
when 112 then
--|#line 1102 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1102")
end

			debug ("ADL_invariant")
				io.put_string (indent + "arith_leaf - path: " + yyvs2.item (yyvsp2) + "%N") 
			end
			create yyval21.make_archetype_definition_ref (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp21 := yyvsp21 + 1
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
when 113 then
--|#line 1111 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1111")
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
when 114 then
--|#line 1115 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1115")
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
when 115 then
--|#line 1119 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1119")
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
when 116 then
--|#line 1123 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1123")
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
when 117 then
--|#line 1127 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1127")
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
when 118 then
--|#line 1131 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1131")
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
when 119 then
--|#line 1137 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1137")
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
when 120 then
--|#line 1141 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1141")
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
when 121 then
--|#line 1145 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1145")
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
when 122 then
--|#line 1149 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1149")
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
when 123 then
--|#line 1153 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1153")
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
when 124 then
--|#line 1162 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1162")
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
when 125 then
--|#line 1163 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1163")
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
when 126 then
--|#line 1169 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1169")
end

			if yyvs3.item (yyvsp3) = 0 then
				create yyval13.make_prohibited
			elseif yyvs3.item (yyvsp3) = 1 then
				create yyval13.make_mandatory
			else
				abort_with_error (ec_SEXLSG, Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp13 := yyvsp13 + 1
	yyvsp3 := yyvsp3 -1
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
--|#line 1179 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1179")
end

			if yyvs3.item (yyvsp3 - 1) = 0 then
				if yyvs3.item (yyvsp3) = 0 then
					create yyval13.make_point (0)
				elseif yyvs3.item (yyvsp3) = 1 then
					create yyval13.make_bounded (0, 1)
				else
					abort_with_error (ec_SEXLU1, Void)
				end
			elseif yyvs3.item (yyvsp3 - 1) = 1 then
				if yyvs3.item (yyvsp3) = 1 then
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
	yyvsp3 := yyvsp3 -2
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
when 128 then
--|#line 1201 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1201")
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
when 129 then
--|#line 1202 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1202")
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
when 130 then
--|#line 1208 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1208")
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
when 131 then
--|#line 1212 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1212")
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
when 132 then
--|#line 1216 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1216")
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
when 133 then
--|#line 1221 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1221")
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
when 134 then
--|#line 1226 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1226")
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
when 135 then
--|#line 1231 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1231")
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
when 136 then
--|#line 1237 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1237")
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
when 137 then
--|#line 1242 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1242")
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
when 138 then
--|#line 1250 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1250")
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
when 139 then
--|#line 1251 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1251")
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
when 140 then
--|#line 1255 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1255")
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
when 141 then
--|#line 1261 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1261")
end

			create yyval13.make_point (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp13 := yyvsp13 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp13 >= yyvsc13 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs13")
		end
		yyvsc13 := yyvsc13 + yyInitial_yyvs_size
		yyvs13 := yyspecial_routines13.aliased_resized_area (yyvs13, yyvsc13)
	end
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 142 then
--|#line 1265 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1265")
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
when 143 then
--|#line 1269 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1269")
end

			create yyval13.make_bounded (yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp13 := yyvsp13 + 1
	yyvsp3 := yyvsp3 -2
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
when 144 then
--|#line 1273 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1273")
end

			create yyval13.make_upper_unbounded (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp13 := yyvsp13 + 1
	yyvsp3 := yyvsp3 -1
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
when 145 then
--|#line 1281 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1281")
end

			create yyval59.make_simple (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp59 := yyvsp59 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp59 >= yyvsc59 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs59")
		end
		yyvsc59 := yyvsc59 + yyInitial_yyvs_size
		yyvs59 := yyspecial_routines59.aliased_resized_area (yyvs59, yyvsc59)
	end
	yyspecial_routines59.force (yyvs59, yyval59, yyvsp59)
end
when 146 then
--|#line 1285 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1285")
end

			create yyval59.make_list_simple (yyvs29.item (yyvsp29))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp59 := yyvsp59 + 1
	yyvsp29 := yyvsp29 -1
	if yyvsp59 >= yyvsc59 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs59")
		end
		yyvsc59 := yyvsc59 + yyInitial_yyvs_size
		yyvs59 := yyspecial_routines59.aliased_resized_area (yyvs59, yyvsc59)
	end
	yyspecial_routines59.force (yyvs59, yyval59, yyvsp59)
end
when 147 then
--|#line 1289 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1289")
end

			create yyval59.make_interval (yyvs36.item (yyvsp36))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp59 := yyvsp59 + 1
	yyvsp36 := yyvsp36 -1
	if yyvsp59 >= yyvsc59 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs59")
		end
		yyvsc59 := yyvsc59 + yyInitial_yyvs_size
		yyvs59 := yyspecial_routines59.aliased_resized_area (yyvs59, yyvsc59)
	end
	yyspecial_routines59.force (yyvs59, yyval59, yyvsp59)
end
when 148 then
--|#line 1293 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1293")
end

			create yyval59.make_list (yyvs42.item (yyvsp42))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp59 := yyvsp59 + 1
	yyvsp42 := yyvsp42 -1
	if yyvsp59 >= yyvsc59 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs59")
		end
		yyvsc59 := yyvsc59 + yyInitial_yyvs_size
		yyvs59 := yyspecial_routines59.aliased_resized_area (yyvs59, yyvsc59)
	end
	yyspecial_routines59.force (yyvs59, yyval59, yyvsp59)
end
when 149 then
--|#line 1297 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1297")
end

			if yyvs59.item (yyvsp59).valid_value (yyvs3.item (yyvsp3)) then
				yyvs59.item (yyvsp59).set_assumed_value (yyvs3.item (yyvsp3))
				yyval59 := yyvs59.item (yyvsp59)
			else
				abort_with_error (ec_VOBAV, <<yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyspecial_routines59.force (yyvs59, yyval59, yyvsp59)
end
when 150 then
--|#line 1306 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1306")
end

			abort_with_error (ec_SCIAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines59.force (yyvs59, yyval59, yyvsp59)
end
when 151 then
--|#line 1312 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1312")
end

			create yyval58.make_simple (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp58 := yyvsp58 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp58 >= yyvsc58 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs58")
		end
		yyvsc58 := yyvsc58 + yyInitial_yyvs_size
		yyvs58 := yyspecial_routines58.aliased_resized_area (yyvs58, yyvsc58)
	end
	yyspecial_routines58.force (yyvs58, yyval58, yyvsp58)
end
when 152 then
--|#line 1316 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1316")
end

			create yyval58.make_list_simple (yyvs30.item (yyvsp30))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp58 := yyvsp58 + 1
	yyvsp30 := yyvsp30 -1
	if yyvsp58 >= yyvsc58 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs58")
		end
		yyvsc58 := yyvsc58 + yyInitial_yyvs_size
		yyvs58 := yyspecial_routines58.aliased_resized_area (yyvs58, yyvsc58)
	end
	yyspecial_routines58.force (yyvs58, yyval58, yyvsp58)
end
when 153 then
--|#line 1320 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1320")
end

			create yyval58.make_interval (yyvs37.item (yyvsp37))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp58 := yyvsp58 + 1
	yyvsp37 := yyvsp37 -1
	if yyvsp58 >= yyvsc58 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs58")
		end
		yyvsc58 := yyvsc58 + yyInitial_yyvs_size
		yyvs58 := yyspecial_routines58.aliased_resized_area (yyvs58, yyvsc58)
	end
	yyspecial_routines58.force (yyvs58, yyval58, yyvsp58)
end
when 154 then
--|#line 1324 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1324")
end

			create yyval58.make_list (yyvs43.item (yyvsp43))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp58 := yyvsp58 + 1
	yyvsp43 := yyvsp43 -1
	if yyvsp58 >= yyvsc58 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs58")
		end
		yyvsc58 := yyvsc58 + yyInitial_yyvs_size
		yyvs58 := yyspecial_routines58.aliased_resized_area (yyvs58, yyvsc58)
	end
	yyspecial_routines58.force (yyvs58, yyval58, yyvsp58)
end
when 155 then
--|#line 1328 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1328")
end

			if yyvs58.item (yyvsp58).valid_value (yyvs4.item (yyvsp4)) then
				yyvs58.item (yyvsp58).set_assumed_value (yyvs4.item (yyvsp4))
				yyval58 := yyvs58.item (yyvsp58)
			else
				abort_with_error (ec_VOBAV, <<yyvs4.item (yyvsp4).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyspecial_routines58.force (yyvs58, yyval58, yyvsp58)
end
when 156 then
--|#line 1337 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1337")
end

			abort_with_error (ec_SCRAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines58.force (yyvs58, yyval58, yyvsp58)
end
when 157 then
--|#line 1343 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1343")
end

			if valid_iso8601_date_constraint_pattern (yyvs2.item (yyvsp2)) then
				create yyval56.make_from_pattern (yyvs2.item (yyvsp2))
			else
				create str.make (0)
				from valid_date_constraint_patterns.start until valid_date_constraint_patterns.off loop
					if not valid_date_constraint_patterns.isfirst then
						str.append (", ")
					end
					str.append (valid_date_constraint_patterns.item)
					valid_date_constraint_patterns.forth
				end
				abort_with_error (ec_SCDPT, <<str>>)
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
--|#line 1359 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1359")
end

			create yyval56.make_simple (yyvs23.item (yyvsp23))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp56 := yyvsp56 + 1
	yyvsp23 := yyvsp23 -1
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
--|#line 1363 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1363")
end

			create yyval56.make_list_simple (yyvs32.item (yyvsp32))
		
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
when 160 then
--|#line 1367 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1367")
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
when 161 then
--|#line 1371 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1371")
end

			create yyval56.make_list (yyvs45.item (yyvsp45))
		
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
when 162 then
--|#line 1375 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1375")
end

			if yyvs56.item (yyvsp56).valid_value (yyvs23.item (yyvsp23)) then
				yyvs56.item (yyvsp56).set_assumed_value (yyvs23.item (yyvsp23))
				yyval56 := yyvs56.item (yyvsp56)
			else
				abort_with_error (ec_VOBAV, <<yyvs23.item (yyvsp23).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp23 := yyvsp23 -1
	yyspecial_routines56.force (yyvs56, yyval56, yyvsp56)
end
when 163 then
--|#line 1384 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1384")
end

			abort_with_error (ec_SCDAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines56.force (yyvs56, yyval56, yyvsp56)
end
when 164 then
--|#line 1390 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1390")
end

			if valid_iso8601_time_constraint_pattern (yyvs2.item (yyvsp2)) then
				create yyval57.make_from_pattern (yyvs2.item (yyvsp2))
			else
				create str.make (0)
				across valid_time_constraint_patterns as patterns_csr loop
					if patterns_csr.cursor_index > 1 then
						str.append (", ")
					end
					str.append (patterns_csr.item)
				end
				abort_with_error (ec_SCTPT, <<str>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp57 := yyvsp57 + 1
	yyvsp2 := yyvsp2 -1
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
--|#line 1405 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1405")
end

			create yyval57.make_simple (yyvs25.item (yyvsp25))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp57 := yyvsp57 + 1
	yyvsp25 := yyvsp25 -1
	if yyvsp57 >= yyvsc57 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs57")
		end
		yyvsc57 := yyvsc57 + yyInitial_yyvs_size
		yyvs57 := yyspecial_routines57.aliased_resized_area (yyvs57, yyvsc57)
	end
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
when 166 then
--|#line 1409 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1409")
end

			create yyval57.make_list_simple (yyvs33.item (yyvsp33))
		
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
when 167 then
--|#line 1413 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1413")
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
when 168 then
--|#line 1417 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1417")
end

			create yyval57.make_list (yyvs44.item (yyvsp44))
		
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
when 169 then
--|#line 1421 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1421")
end

			if yyvs57.item (yyvsp57).valid_value (yyvs25.item (yyvsp25)) then
				yyvs57.item (yyvsp57).set_assumed_value (yyvs25.item (yyvsp25))
				yyval57 := yyvs57.item (yyvsp57)
			else
				abort_with_error (ec_VOBAV, <<yyvs25.item (yyvsp25).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp25 := yyvsp25 -1
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
when 170 then
--|#line 1430 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1430")
end

			abort_with_error (ec_SCTAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
when 171 then
--|#line 1436 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1436")
end

			if valid_iso8601_date_time_constraint_pattern (yyvs2.item (yyvsp2)) then
				create yyval54.make_from_pattern (yyvs2.item (yyvsp2))
			else
				create str.make (0)
				across valid_date_time_constraint_patterns as patterns_csr loop
					if patterns_csr.cursor_index > 1 then
						str.append (", ")
					end
					str.append (patterns_csr.item)
				end
				abort_with_error (ec_SCDTPT, <<str>>)
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
when 172 then
--|#line 1451 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1451")
end

			create yyval54.make_simple (yyvs24.item (yyvsp24))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp54 := yyvsp54 + 1
	yyvsp24 := yyvsp24 -1
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
--|#line 1455 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1455")
end

			create yyval54.make_list_simple (yyvs34.item (yyvsp34))
		
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
when 174 then
--|#line 1459 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1459")
end

			create yyval54.make_interval (yyvs40.item (yyvsp40))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp54 := yyvsp54 + 1
	yyvsp40 := yyvsp40 -1
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
--|#line 1463 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1463")
end

			create yyval54.make_list (yyvs46.item (yyvsp46))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp54 := yyvsp54 + 1
	yyvsp46 := yyvsp46 -1
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
--|#line 1467 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1467")
end

			if yyvs54.item (yyvsp54).valid_value (yyvs24.item (yyvsp24)) then
				yyvs54.item (yyvsp54).set_assumed_value (yyvs24.item (yyvsp24))
				yyval54 := yyvs54.item (yyvsp54)
			else
				abort_with_error (ec_VOBAV, <<yyvs24.item (yyvsp24).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp24 := yyvsp24 -1
	yyspecial_routines54.force (yyvs54, yyval54, yyvsp54)
end
when 177 then
--|#line 1476 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1476")
end

			abort_with_error (ec_SCDTAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines54.force (yyvs54, yyval54, yyvsp54)
end
when 178 then
--|#line 1482 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1482")
end

			if valid_iso8601_duration_constraint_pattern (yyvs2.item (yyvsp2)) then
				create yyval55.make_pattern_with_range (yyvs2.item (yyvsp2), yyvs41.item (yyvsp41))
			else
				abort_with_error (ec_SCDUPT, Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp55 := yyvsp55 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyvsp41 := yyvsp41 -1
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
--|#line 1490 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1490")
end

			if valid_iso8601_duration_constraint_pattern (yyvs2.item (yyvsp2)) then
				create yyval55.make_from_pattern (yyvs2.item (yyvsp2))
			else
				abort_with_error (ec_SCDUPT, Void)
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
when 180 then
--|#line 1498 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1498")
end

			create yyval55.make_simple (yyvs26.item (yyvsp26))
		
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
when 181 then
--|#line 1502 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1502")
end

			create yyval55.make_list_simple (yyvs35.item (yyvsp35))
		
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
when 182 then
--|#line 1506 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1506")
end

			create yyval55.make_interval (yyvs41.item (yyvsp41))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp55 := yyvsp55 + 1
	yyvsp41 := yyvsp41 -1
	if yyvsp55 >= yyvsc55 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs55")
		end
		yyvsc55 := yyvsc55 + yyInitial_yyvs_size
		yyvs55 := yyspecial_routines55.aliased_resized_area (yyvs55, yyvsc55)
	end
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
when 183 then
--|#line 1510 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1510")
end

			create yyval55.make_list (yyvs47.item (yyvsp47))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp55 := yyvsp55 + 1
	yyvsp47 := yyvsp47 -1
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
--|#line 1514 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1514")
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
when 185 then
--|#line 1523 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1523")
end

			abort_with_error (ec_SCDUAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
when 186 then
--|#line 1528 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1528")
end

			abort_with_error (ec_SCDUPT, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp55 := yyvsp55 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp55 >= yyvsc55 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs55")
		end
		yyvsc55 := yyvsc55 + yyInitial_yyvs_size
		yyvs55 := yyspecial_routines55.aliased_resized_area (yyvs55, yyvsc55)
	end
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
when 187 then
--|#line 1534 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1534")
end

			create yyval53.make_simple (yyvs2.item (yyvsp2))
		
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
when 188 then
--|#line 1538 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1538")
end

			create yyval53.make_list (yyvs28.item (yyvsp28))
		
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
when 189 then
--|#line 1542 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1542")
end

			create yyval53.make_from_regexp (yyvs2.item (yyvsp2).substring (2, yyvs2.item (yyvsp2).count - 1), yyvs2.item (yyvsp2).item (1) = '/')
			if yyval53.regexp.is_equal ({C_STRING}.Invalid_regex_message) then
				abort_with_error (ec_SCSRE, <<yyvs2.item (yyvsp2)>>)
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
when 190 then
--|#line 1549 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1549")
end

			if yyvs53.item (yyvsp53).valid_value (yyvs2.item (yyvsp2)) then
				yyvs53.item (yyvsp53).set_assumed_value (yyvs2.item (yyvsp2))
				yyval53 := yyvs53.item (yyvsp53)
			else
				abort_with_error (ec_VOBAV, <<yyvs2.item (yyvsp2).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines53.force (yyvs53, yyval53, yyvsp53)
end
when 191 then
--|#line 1558 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1558")
end

			abort_with_error (ec_SCSAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines53.force (yyvs53, yyval53, yyvsp53)
end
when 192 then
--|#line 1564 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1564")
end

			if constraint_model_factory.valid_c_terminology_code_string (yyvs2.item (yyvsp2)) then
				yyval60 := constraint_model_factory.create_c_terminology_code (yyvs2.item (yyvsp2))
			else
				abort_with_errors (constraint_model_factory.errors)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp60 := yyvsp60 + 1
	yyvsp2 := yyvsp2 -1
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
--|#line 1572 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1572")
end

			yyval60 := constraint_model_factory.create_c_terminology_code (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp60 := yyvsp60 + 1
	yyvsp2 := yyvsp2 -1
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
--|#line 1578 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1578")
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
when 195 then
--|#line 1582 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1582")
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
when 196 then
--|#line 1586 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1586")
end

			create yyval52.make_list (yyvs31.item (yyvsp31))
		
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
when 197 then
--|#line 1590 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1590")
end

			if yyvs52.item (yyvsp52).valid_value (yyvs22.item (yyvsp22)) then
				yyvs52.item (yyvsp52).set_assumed_value (yyvs22.item (yyvsp22))
			else
				abort_with_error (ec_VOBAV, <<yyvs22.item (yyvsp22).out>>)
			end
			yyval52 := yyvs52.item (yyvsp52)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp22 := yyvsp22 -1
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
when 198 then
--|#line 1599 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1599")
end

			abort_with_error (ec_SCBAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
when 199 then
--|#line 1610 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1610")
end

			create yyval14.make_anonymous ("DV_ORDINAL")

			-- create a C_ATTR_TUPLE and connect the received C_OBJ_TUPLE to it
			yyval14.put_attribute_tuple (create {C_ATTRIBUTE_TUPLE}.make)

			-- create 'value' C_ATTRIBUTE and attach both to C_C_O and to C_ATTR_TUPLE
			yyval14.put_attribute (create {C_ATTRIBUTE}.make_single ("value", Void))
			yyval14.attribute_tuples.first.put_member (yyval14.c_attribute ("value"))
			yyval14.c_attribute ("value").put_child (create {C_INTEGER}.make_simple (yyvs51.item (yyvsp51).value))

			-- create 'symbol' C_ATTRIBUTE and attach both to C_C_O and to C_ATTR_TUPLE
			yyval14.put_attribute (create {C_ATTRIBUTE}.make_single ("symbol", Void))
			yyval14.attribute_tuples.first.put_member (yyval14.c_attribute ("symbol"))
			yyval14.c_attribute ("symbol").put_child (create {C_TERMINOLOGY_CODE}.make_from_terminology_code (yyvs51.item (yyvsp51).symbol))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp51 := yyvsp51 -1
	if yyvsp14 >= yyvsc14 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs14")
		end
		yyvsc14 := yyvsc14 + yyInitial_yyvs_size
		yyvs14 := yyspecial_routines14.aliased_resized_area (yyvs14, yyvsc14)
	end
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 200 then
--|#line 1627 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1627")
end

			yyval14 := yyvs14.item (yyvsp14)

			if yyval14.c_attribute ("value").children.there_exists (
					agent (co: C_OBJECT; a_val: INTEGER): BOOLEAN
						do
							Result := attached {C_INTEGER} co as ci and then ci.valid_value (a_val)
						end (?, yyvs51.item (yyvsp51).value)
				)
			then
				abort_with_error (ec_VCOV, <<yyvs51.item (yyvsp51).value.out>>)

			elseif yyval14.c_attribute ("symbol").children.there_exists (
					agent (co: C_OBJECT; a_sym: TERMINOLOGY_CODE): BOOLEAN
						do
							Result := attached {C_TERMINOLOGY_CODE} co as ci and then ci.valid_value (a_sym)
						end (?, yyvs51.item (yyvsp51).symbol)
				)
			then
				abort_with_error (ec_VCOC, <<yyvs51.item (yyvsp51).symbol.out>>)

			elseif attached {C_INTEGER} yyval14.c_attribute ("value").children.first as ci and 
				attached {C_TERMINOLOGY_CODE} yyval14.c_attribute ("symbol").children.first as ctc 
			then
				ci.add_value (yyvs51.item (yyvsp51).value)
				ctc.add_code (yyvs51.item (yyvsp51).symbol.code_string)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp51 := yyvsp51 -1
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 201 then
--|#line 1656 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1656")
end

			yyval14 := yyvs14.item (yyvsp14)

			-- assumed value for C_DV_ORDINAL not supported
			add_warning (ec_WDTOAV, Void)
 		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 202 then
--|#line 1663 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1663")
end

			abort_with_error (ec_SCOAV, Void)
 		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 203 then
--|#line 1669 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1669")
end

			-- create ORDINAL
			create yyval51.make (yyvs3.item (yyvsp3), yyvs61.item (yyvsp61))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp51 := yyvsp51 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -1
	yyvsp61 := yyvsp61 -1
	if yyvsp51 >= yyvsc51 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs51")
		end
		yyvsc51 := yyvsc51 + yyInitial_yyvs_size
		yyvs51 := yyspecial_routines51.aliased_resized_area (yyvs51, yyvsc51)
	end
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
when 204 then
--|#line 1681 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1681")
end

			create yyval50.make (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp50 := yyvsp50 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp50 >= yyvsc50 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs50")
		end
		yyvsc50 := yyvsc50 + yyInitial_yyvs_size
		yyvs50 := yyspecial_routines50.aliased_resized_area (yyvs50, yyvsc50)
	end
	yyspecial_routines50.force (yyvs50, yyval50, yyvsp50)
end
when 205 then
--|#line 1687 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1687")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 206 then
--|#line 1691 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1691")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 207 then
--|#line 1697 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1697")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 208 then
--|#line 1701 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1701")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 209 then
--|#line 1714 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1714")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 210 then
--|#line 1720 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1720")
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
when 211 then
--|#line 1726 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1726")
end

			yyvs28.item (yyvsp28).extend(yyvs2.item (yyvsp2))
			yyval28 := yyvs28.item (yyvsp28)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
when 212 then
--|#line 1734 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1734")
end

			yyval28 := yyvs28.item (yyvsp28)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
when 213 then
--|#line 1738 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1738")
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
when 214 then
--|#line 1745 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1745")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 215 then
--|#line 1748 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1748")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 216 then
--|#line 1751 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1751")
end

			yyval3 := - yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 217 then
--|#line 1756 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1756")
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
when 218 then
--|#line 1762 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1762")
end

			yyvs29.item (yyvsp29).extend(yyvs3.item (yyvsp3))
			yyval29 := yyvs29.item (yyvsp29)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
when 219 then
--|#line 1767 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1767")
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
when 220 then
--|#line 1774 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1774")
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
when 221 then
--|#line 1782 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1782")
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
when 222 then
--|#line 1790 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1790")
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
when 223 then
--|#line 1798 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1798")
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
when 224 then
--|#line 1806 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1806")
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
when 225 then
--|#line 1810 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1810")
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
when 226 then
--|#line 1814 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1814")
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
when 227 then
--|#line 1818 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1818")
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
when 228 then
--|#line 1822 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1822")
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
when 229 then
--|#line 1828 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1828")
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
when 230 then
--|#line 1834 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1834")
end

			yyvs42.item (yyvsp42).extend(yyvs36.item (yyvsp36))
			yyval42 := yyvs42.item (yyvsp42)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp36 := yyvsp36 -1
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
when 231 then
--|#line 1839 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1839")
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
when 232 then
--|#line 1846 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1846")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 233 then
--|#line 1850 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1850")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 234 then
--|#line 1854 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1854")
end

			yyval4 := - yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 235 then
--|#line 1860 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1860")
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
when 236 then
--|#line 1866 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1866")
end

			yyvs30.item (yyvsp30).extend(yyvs4.item (yyvsp4))
			yyval30 := yyvs30.item (yyvsp30)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
when 237 then
--|#line 1871 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1871")
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
when 238 then
--|#line 1878 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1878")
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
when 239 then
--|#line 1886 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1886")
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
when 240 then
--|#line 1894 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1894")
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
when 241 then
--|#line 1902 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1902")
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
when 242 then
--|#line 1910 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1910")
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
when 243 then
--|#line 1914 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1914")
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
when 244 then
--|#line 1918 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1918")
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
when 245 then
--|#line 1922 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1922")
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
when 246 then
--|#line 1926 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1926")
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
when 247 then
--|#line 1932 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1932")
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
when 248 then
--|#line 1938 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1938")
end

			yyvs43.item (yyvsp43).extend(yyvs37.item (yyvsp37))
			yyval43 := yyvs43.item (yyvsp43)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp37 := yyvsp37 -1
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
when 249 then
--|#line 1943 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1943")
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
when 250 then
--|#line 1950 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1950")
end

			yyval22 := True
		
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
when 251 then
--|#line 1954 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1954")
end

			yyval22 := False
		
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
when 252 then
--|#line 1960 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1960")
end

			create yyval31.make(0)
			yyval31.extend(yyvs22.item (yyvsp22 - 1))
			yyval31.extend(yyvs22.item (yyvsp22))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp31 := yyvsp31 + 1
	yyvsp22 := yyvsp22 -2
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
when 253 then
--|#line 1966 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1966")
end

			yyvs31.item (yyvsp31).extend(yyvs22.item (yyvsp22))
			yyval31 := yyvs31.item (yyvsp31)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp22 := yyvsp22 -1
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 254 then
--|#line 1971 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1971")
end

			create yyval31.make(0)
			yyval31.extend(yyvs22.item (yyvsp22))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp31 := yyvsp31 + 1
	yyvsp22 := yyvsp22 -1
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
when 255 then
--|#line 1978 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1978")
end

			if valid_iso8601_date(yyvs2.item (yyvsp2)) then
				create yyval23.make_from_string(yyvs2.item (yyvsp2))
			else
				abort_with_error (ec_VIDV, <<yyvs2.item (yyvsp2)>>)
			end
		
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
when 256 then
--|#line 1988 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1988")
end

			create yyval32.make(0)
			yyval32.extend (yyvs23.item (yyvsp23 - 1))
			yyval32.extend (yyvs23.item (yyvsp23))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp32 := yyvsp32 + 1
	yyvsp23 := yyvsp23 -2
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
when 257 then
--|#line 1994 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1994")
end

			yyvs32.item (yyvsp32).extend (yyvs23.item (yyvsp23))
			yyval32 := yyvs32.item (yyvsp32)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp23 := yyvsp23 -1
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 258 then
--|#line 1999 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 1999")
end

			create yyval32.make(0)
			yyval32.extend (yyvs23.item (yyvsp23))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp32 := yyvsp32 + 1
	yyvsp23 := yyvsp23 -1
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
when 259 then
--|#line 2006 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2006")
end

			if yyvs23.item (yyvsp23 - 1) <= yyvs23.item (yyvsp23) then
				create {PROPER_INTERVAL [ISO8601_DATE]} yyval39.make_bounded(yyvs23.item (yyvsp23 - 1), yyvs23.item (yyvsp23), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs23.item (yyvsp23 - 1).out, yyvs23.item (yyvsp23).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp23 := yyvsp23 -2
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
--|#line 2014 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2014")
end

			if yyvs23.item (yyvsp23 - 1) <= yyvs23.item (yyvsp23) then
				create {PROPER_INTERVAL [ISO8601_DATE]} yyval39.make_bounded(yyvs23.item (yyvsp23 - 1), yyvs23.item (yyvsp23), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs23.item (yyvsp23 - 1).out, yyvs23.item (yyvsp23).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp23 := yyvsp23 -2
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
--|#line 2022 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2022")
end

			if yyvs23.item (yyvsp23 - 1) <= yyvs23.item (yyvsp23) then
				create {PROPER_INTERVAL [ISO8601_DATE]} yyval39.make_bounded(yyvs23.item (yyvsp23 - 1), yyvs23.item (yyvsp23), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs23.item (yyvsp23 - 1).out, yyvs23.item (yyvsp23).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp23 := yyvsp23 -2
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
--|#line 2030 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2030")
end

			if yyvs23.item (yyvsp23 - 1) <= yyvs23.item (yyvsp23) then
				create {PROPER_INTERVAL [ISO8601_DATE]} yyval39.make_bounded(yyvs23.item (yyvsp23 - 1), yyvs23.item (yyvsp23), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs23.item (yyvsp23 - 1).out, yyvs23.item (yyvsp23).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp23 := yyvsp23 -2
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
--|#line 2038 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2038")
end

			create {PROPER_INTERVAL [ISO8601_DATE]} yyval39.make_lower_unbounded(yyvs23.item (yyvsp23), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp23 := yyvsp23 -1
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
--|#line 2042 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2042")
end

			create {PROPER_INTERVAL [ISO8601_DATE]} yyval39.make_lower_unbounded(yyvs23.item (yyvsp23), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp23 := yyvsp23 -1
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
--|#line 2046 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2046")
end

			create {PROPER_INTERVAL [ISO8601_DATE]} yyval39.make_upper_unbounded(yyvs23.item (yyvsp23), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp23 := yyvsp23 -1
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 266 then
--|#line 2050 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2050")
end

			create {PROPER_INTERVAL [ISO8601_DATE]} yyval39.make_upper_unbounded(yyvs23.item (yyvsp23), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp23 := yyvsp23 -1
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 267 then
--|#line 2054 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2054")
end

			create {POINT_INTERVAL [ISO8601_DATE]} yyval39.make (yyvs23.item (yyvsp23))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp23 := yyvsp23 -1
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 268 then
--|#line 2060 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2060")
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
when 269 then
--|#line 2066 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2066")
end

			yyvs45.item (yyvsp45).extend(yyvs39.item (yyvsp39))
			yyval45 := yyvs45.item (yyvsp45)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp39 := yyvsp39 -1
	yyspecial_routines45.force (yyvs45, yyval45, yyvsp45)
end
when 270 then
--|#line 2071 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2071")
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
when 271 then
--|#line 2078 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2078")
end

			if valid_iso8601_time(yyvs2.item (yyvsp2)) then
				create yyval25.make_from_string(yyvs2.item (yyvsp2))
			else
				abort_with_error (ec_VITV, <<yyvs2.item (yyvsp2)>>)
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
when 272 then
--|#line 2088 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2088")
end

			create yyval33.make(0)
			yyval33.extend(yyvs25.item (yyvsp25 - 1))
			yyval33.extend(yyvs25.item (yyvsp25))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp25 := yyvsp25 -2
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
when 273 then
--|#line 2094 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2094")
end

			yyvs33.item (yyvsp33).extend(yyvs25.item (yyvsp25))
			yyval33 := yyvs33.item (yyvsp33)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp25 := yyvsp25 -1
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 274 then
--|#line 2099 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2099")
end

			create yyval33.make(0)
			yyval33.extend(yyvs25.item (yyvsp25))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp25 := yyvsp25 -1
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
when 275 then
--|#line 2106 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2106")
end

			if yyvs25.item (yyvsp25 - 1) <= yyvs25.item (yyvsp25) then
				create {PROPER_INTERVAL [ISO8601_TIME]} yyval38.make_bounded(yyvs25.item (yyvsp25 - 1), yyvs25.item (yyvsp25), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs25.item (yyvsp25 - 1).out, yyvs25.item (yyvsp25).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp25 := yyvsp25 -2
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
--|#line 2114 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2114")
end

			if yyvs25.item (yyvsp25 - 1) <= yyvs25.item (yyvsp25) then
				create {PROPER_INTERVAL [ISO8601_TIME]} yyval38.make_bounded(yyvs25.item (yyvsp25 - 1), yyvs25.item (yyvsp25), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs25.item (yyvsp25 - 1).out, yyvs25.item (yyvsp25).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp25 := yyvsp25 -2
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
--|#line 2122 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2122")
end

			if yyvs25.item (yyvsp25 - 1) <= yyvs25.item (yyvsp25) then
				create {PROPER_INTERVAL [ISO8601_TIME]} yyval38.make_bounded(yyvs25.item (yyvsp25 - 1), yyvs25.item (yyvsp25), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs25.item (yyvsp25 - 1).out, yyvs25.item (yyvsp25).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp25 := yyvsp25 -2
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
--|#line 2130 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2130")
end

			if yyvs25.item (yyvsp25 - 1) <= yyvs25.item (yyvsp25) then
				create {PROPER_INTERVAL [ISO8601_TIME]} yyval38.make_bounded(yyvs25.item (yyvsp25 - 1), yyvs25.item (yyvsp25), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs25.item (yyvsp25 - 1).out, yyvs25.item (yyvsp25).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp25 := yyvsp25 -2
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
--|#line 2138 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2138")
end

			create {PROPER_INTERVAL [ISO8601_TIME]} yyval38.make_lower_unbounded(yyvs25.item (yyvsp25), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp25 := yyvsp25 -1
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
--|#line 2142 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2142")
end

			create {PROPER_INTERVAL [ISO8601_TIME]} yyval38.make_lower_unbounded(yyvs25.item (yyvsp25), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp25 := yyvsp25 -1
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
--|#line 2146 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2146")
end

			create {PROPER_INTERVAL [ISO8601_TIME]} yyval38.make_upper_unbounded(yyvs25.item (yyvsp25), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp25 := yyvsp25 -1
	if yyvsp38 >= yyvsc38 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs38")
		end
		yyvsc38 := yyvsc38 + yyInitial_yyvs_size
		yyvs38 := yyspecial_routines38.aliased_resized_area (yyvs38, yyvsc38)
	end
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 282 then
--|#line 2150 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2150")
end

			create {PROPER_INTERVAL [ISO8601_TIME]} yyval38.make_upper_unbounded(yyvs25.item (yyvsp25), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp25 := yyvsp25 -1
	if yyvsp38 >= yyvsc38 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs38")
		end
		yyvsc38 := yyvsc38 + yyInitial_yyvs_size
		yyvs38 := yyspecial_routines38.aliased_resized_area (yyvs38, yyvsc38)
	end
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 283 then
--|#line 2154 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2154")
end

			create {POINT_INTERVAL [ISO8601_TIME]} yyval38.make (yyvs25.item (yyvsp25))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp25 := yyvsp25 -1
	if yyvsp38 >= yyvsc38 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs38")
		end
		yyvsc38 := yyvsc38 + yyInitial_yyvs_size
		yyvs38 := yyspecial_routines38.aliased_resized_area (yyvs38, yyvsc38)
	end
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 284 then
--|#line 2160 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2160")
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
when 285 then
--|#line 2166 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2166")
end

			yyvs44.item (yyvsp44).extend(yyvs38.item (yyvsp38))
			yyval44 := yyvs44.item (yyvsp44)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp38 := yyvsp38 -1
	yyspecial_routines44.force (yyvs44, yyval44, yyvsp44)
end
when 286 then
--|#line 2171 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2171")
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
when 287 then
--|#line 2178 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2178")
end

			if valid_iso8601_date_time(yyvs2.item (yyvsp2)) then
				create yyval24.make_from_string(yyvs2.item (yyvsp2))
			else
				abort_with_error (ec_VIDTV, <<yyvs2.item (yyvsp2)>>)
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
when 288 then
--|#line 2188 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2188")
end

			create yyval34.make(0)
			yyval34.extend(yyvs24.item (yyvsp24 - 1))
			yyval34.extend(yyvs24.item (yyvsp24))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp34 := yyvsp34 + 1
	yyvsp24 := yyvsp24 -2
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
when 289 then
--|#line 2194 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2194")
end

			yyvs34.item (yyvsp34).extend(yyvs24.item (yyvsp24))
			yyval34 := yyvs34.item (yyvsp34)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp24 := yyvsp24 -1
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 290 then
--|#line 2199 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2199")
end

			create yyval34.make(0)
			yyval34.extend(yyvs24.item (yyvsp24))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp34 := yyvsp34 + 1
	yyvsp24 := yyvsp24 -1
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
when 291 then
--|#line 2206 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2206")
end

			if yyvs24.item (yyvsp24 - 1) <= yyvs24.item (yyvsp24) then
				create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval40.make_bounded(yyvs24.item (yyvsp24 - 1), yyvs24.item (yyvsp24), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs24.item (yyvsp24 - 1).out, yyvs24.item (yyvsp24).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp24 := yyvsp24 -2
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
--|#line 2214 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2214")
end

			if yyvs24.item (yyvsp24 - 1) <= yyvs24.item (yyvsp24) then
				create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval40.make_bounded(yyvs24.item (yyvsp24 - 1), yyvs24.item (yyvsp24), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs24.item (yyvsp24 - 1).out, yyvs24.item (yyvsp24).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp24 := yyvsp24 -2
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
--|#line 2222 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2222")
end

			if yyvs24.item (yyvsp24 - 1) <= yyvs24.item (yyvsp24) then
				create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval40.make_bounded(yyvs24.item (yyvsp24 - 1), yyvs24.item (yyvsp24), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs24.item (yyvsp24 - 1).out, yyvs24.item (yyvsp24).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp24 := yyvsp24 -2
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
--|#line 2230 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2230")
end

			if yyvs24.item (yyvsp24 - 1) <= yyvs24.item (yyvsp24) then
				create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval40.make_bounded(yyvs24.item (yyvsp24 - 1), yyvs24.item (yyvsp24), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs24.item (yyvsp24 - 1).out, yyvs24.item (yyvsp24).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp24 := yyvsp24 -2
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
--|#line 2238 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2238")
end

			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval40.make_lower_unbounded(yyvs24.item (yyvsp24), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp24 := yyvsp24 -1
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
--|#line 2242 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2242")
end

			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval40.make_lower_unbounded(yyvs24.item (yyvsp24), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp24 := yyvsp24 -1
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
--|#line 2246 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2246")
end

			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval40.make_upper_unbounded(yyvs24.item (yyvsp24), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp24 := yyvsp24 -1
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 298 then
--|#line 2250 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2250")
end

			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval40.make_upper_unbounded(yyvs24.item (yyvsp24), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp24 := yyvsp24 -1
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 299 then
--|#line 2254 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2254")
end

			create {POINT_INTERVAL [ISO8601_DATE_TIME]} yyval40.make (yyvs24.item (yyvsp24))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp24 := yyvsp24 -1
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 300 then
--|#line 2260 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2260")
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
when 301 then
--|#line 2266 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2266")
end

			yyvs46.item (yyvsp46).extend(yyvs40.item (yyvsp40))
			yyval46 := yyvs46.item (yyvsp46)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp40 := yyvsp40 -1
	yyspecial_routines46.force (yyvs46, yyval46, yyvsp46)
end
when 302 then
--|#line 2271 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2271")
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
when 303 then
--|#line 2278 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2278")
end

			if valid_iso8601_duration(yyvs2.item (yyvsp2)) then
				create yyval26.make_from_string(yyvs2.item (yyvsp2))
			else
				abort_with_error (ec_VIDUV, <<yyvs2.item (yyvsp2)>>)
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
when 304 then
--|#line 2288 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2288")
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
when 305 then
--|#line 2294 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2294")
end

			yyvs35.item (yyvsp35).extend(yyvs26.item (yyvsp26))
			yyval35 := yyvs35.item (yyvsp35)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp26 := yyvsp26 -1
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 306 then
--|#line 2299 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2299")
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
when 307 then
--|#line 2306 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2306")
end

			if yyvs26.item (yyvsp26 - 1) <= yyvs26.item (yyvsp26) then
				create {PROPER_INTERVAL [ISO8601_DURATION]} yyval41.make_bounded(yyvs26.item (yyvsp26 - 1), yyvs26.item (yyvsp26), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs26.item (yyvsp26 - 1).out, yyvs26.item (yyvsp26).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp26 := yyvsp26 -2
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
--|#line 2314 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2314")
end

			if yyvs26.item (yyvsp26 - 1) <= yyvs26.item (yyvsp26) then
				create {PROPER_INTERVAL [ISO8601_DURATION]} yyval41.make_bounded(yyvs26.item (yyvsp26 - 1), yyvs26.item (yyvsp26), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs26.item (yyvsp26 - 1).out, yyvs26.item (yyvsp26).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp26 := yyvsp26 -2
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
--|#line 2322 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2322")
end

			if yyvs26.item (yyvsp26 - 1) <= yyvs26.item (yyvsp26) then
				create {PROPER_INTERVAL [ISO8601_DURATION]} yyval41.make_bounded(yyvs26.item (yyvsp26 - 1), yyvs26.item (yyvsp26), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs26.item (yyvsp26 - 1).out, yyvs26.item (yyvsp26).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp26 := yyvsp26 -2
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
--|#line 2330 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2330")
end

			if yyvs26.item (yyvsp26 - 1) <= yyvs26.item (yyvsp26) then
				create {PROPER_INTERVAL [ISO8601_DURATION]} yyval41.make_bounded(yyvs26.item (yyvsp26 - 1), yyvs26.item (yyvsp26), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs26.item (yyvsp26 - 1).out, yyvs26.item (yyvsp26).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp26 := yyvsp26 -2
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
--|#line 2338 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2338")
end

			create {PROPER_INTERVAL [ISO8601_DURATION]} yyval41.make_lower_unbounded(yyvs26.item (yyvsp26), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp26 := yyvsp26 -1
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
--|#line 2342 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2342")
end

			create {PROPER_INTERVAL [ISO8601_DURATION]} yyval41.make_lower_unbounded(yyvs26.item (yyvsp26), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp26 := yyvsp26 -1
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
--|#line 2346 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2346")
end

			create {PROPER_INTERVAL [ISO8601_DURATION]} yyval41.make_upper_unbounded(yyvs26.item (yyvsp26), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp26 := yyvsp26 -1
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 314 then
--|#line 2350 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2350")
end

			create {PROPER_INTERVAL [ISO8601_DURATION]} yyval41.make_upper_unbounded(yyvs26.item (yyvsp26), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp26 := yyvsp26 -1
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 315 then
--|#line 2354 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2354")
end

			create {POINT_INTERVAL [ISO8601_DURATION]} yyval41.make (yyvs26.item (yyvsp26))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp26 := yyvsp26 -1
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 316 then
--|#line 2360 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2360")
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
when 317 then
--|#line 2366 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2366")
end

			yyvs47.item (yyvsp47).extend(yyvs41.item (yyvsp41))
			yyval47 := yyvs47.item (yyvsp47)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp41 := yyvsp41 -1
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
when 318 then
--|#line 2371 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2371")
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
when 319 then
--|#line 2382 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2382")
end

			create yyval61.make_from_string (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp61 := yyvsp61 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp61 >= yyvsc61 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs61")
		end
		yyvsc61 := yyvsc61 + yyInitial_yyvs_size
		yyvs61 := yyspecial_routines61.aliased_resized_area (yyvs61, yyvsc61)
	end
	yyspecial_routines61.force (yyvs61, yyval61, yyvsp61)
end
when 320 then
--|#line 2386 "cadl_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_parser.y' at line 2386")
end

			abort_with_error (ec_STCV, <<yyvs2.item (yyvsp2)>>)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp61 := yyvsp61 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp61 >= yyvsc61 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs61")
		end
		yyvsc61 := yyvsc61 + yyInitial_yyvs_size
		yyvs61 := yyspecial_routines61.aliased_resized_area (yyvs61, yyvsc61)
	end
	yyspecial_routines61.force (yyvs61, yyval61, yyvsp61)
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
			when 575 then
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
			   86,   87,   76,   74,   84,   75,    2,   77,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,   85,   88,
			    2,   68,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,   82,    2,   83,   81,    2,    2,    2,    2,    2,

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
			   65,   66,   67,   69,   70,   71,   72,   73,   78,   79,
			   80, yyDummy>>)
		end

	yyr1_template: SPECIAL [INTEGER]
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,  168,  168,  168,  169,  169,  102,  101,  101,  101,
			   96,   96,  170,  170,  170,  173,  173,  173,  173,  173,
			  173,  173,  173,  173,  173,   93,   93,   93,   94,   94,
			  174,  174,  106,  106,  105,  104,  104,  104,  104,  104,
			  104,  104,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  171,  172,  172,  175,  175,  176,  176,  176,  107,
			  107,  178,  178,  178,  177,  179,  179,  180,  180,  181,
			  182,  182,   90,   90,   91,   91,   89,   89,   92,   92,
			   92,   92,  108,  108,  109,  109,  110,  110,  110,  110,
			  116,  117,  117,  112,  112,  112,  112,  113,  152,  152,

			  152,  152,  119,  119,  114,  120,  120,  111,  111,  115,
			  118,  118,  118,  151,  151,  151,  151,  151,  151,  150,
			  150,  150,  150,  150,   98,   98,  100,  100,  153,  153,
			  154,  154,  154,  154,  154,  154,  154,  154,   97,   97,
			   97,   99,   99,   99,   99,  165,  165,  165,  165,  165,
			  165,  164,  164,  164,  164,  164,  164,  162,  162,  162,
			  162,  162,  162,  162,  163,  163,  163,  163,  163,  163,
			  163,  160,  160,  160,  160,  160,  160,  160,  161,  161,
			  161,  161,  161,  161,  161,  161,  161,  159,  159,  159,
			  159,  159,  166,  166,  158,  158,  158,  158,  158,  156,

			  156,  156,  156,  157,  155,  128,  128,   95,   95,  129,
			  130,  130,  130,  130,  121,  121,  121,  131,  131,  131,
			  138,  138,  138,  138,  138,  138,  138,  138,  138,  144,
			  144,  144,  122,  122,  122,  132,  132,  132,  139,  139,
			  139,  139,  139,  139,  139,  139,  139,  145,  145,  145,
			  123,  123,  133,  133,  133,  124,  134,  134,  134,  141,
			  141,  141,  141,  141,  141,  141,  141,  141,  147,  147,
			  147,  126,  135,  135,  135,  140,  140,  140,  140,  140,
			  140,  140,  140,  140,  146,  146,  146,  125,  136,  136,
			  136,  142,  142,  142,  142,  142,  142,  142,  142,  142,

			  148,  148,  148,  127,  137,  137,  137,  143,  143,  143,
			  143,  143,  143,  143,  143,  143,  149,  149,  149,  167,
			  167, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    2,    2,    2,    2,    2,    4,    3,    1,    7,    8,
			    2,   11,   14,   14,   18,   18,   18,   18,   19,   20,
			   20,   20,   20,   20,   21,   21,   18,    3,    4,    2,
			    1,   18,   18,    4,    3,    4,    3,    1,    2,    2,
			    1,    2,    2,    1,    1,    8,    2,    2,    2,    1,
			   12,    1,    1,    1,    1,    1,    2,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    2,    2,
			    1,    1,    1,   18,    1,    1,    2,    1,    1,    1,
			   18,    1,    2,   18,   18,    1,   18,    1,    1,    1,

			    1,    1,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,   15,    3,    4,   22,   23,   24,
			   25,   26,   28,   29,   30,   31,   32,   33,   34,   35,
			   36,   37,   38,   39,   40,   41,   42,   43,   44,   45,
			   46,   47,   52,   53,   54,   55,   56,   57,   58,   59,
			   60,   15,   60,    1,    1,    1,    2,    2,    1,   17,
			    1,    1,    1,    1,    1,    1,   18,    1,    1,    1,
			    1,    3,    4,   23,   24,   25,   26,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    3,   13,    3,    2,    1,    1,   12,   12,    1,    1,
			    1,    3,    4,   23,   24,   25,   26,    3,    4,   23,
			   24,   25,   26,    3,    4,   23,   24,   25,   26,    3,
			    4,   23,   24,   25,   26,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,   41,    1,
			    2,    1,    3,    1,    1,    1,    4,    1,    1,    1,
			   22,    1,   23,    1,   24,    1,   25,    1,   26,    1,
			    2,    3,    4,   22,   23,   25,   24,   26,    1,    1,

			   36,    1,    1,   37,    1,    1,   38,    1,    1,   39,
			    1,    1,   40,    1,   41,   36,   37,   38,   39,   40,
			   41,    1,   22,    2,    1,    2,    1,   24,    1,   26,
			    1,   23,    1,   25,    1,    4,    1,    3,    1,    1,
			    1,    1,    1,    1,   48,   48,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    3,    1,
			    4,    1,   23,    1,   24,    1,   25,    1,   26,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    3,    2,    1,    1,    1,    1,
			    1,    1,    1,    6,    2,    1,    9,   10,    2,   11,
			   15,   16,   16,   16,    3,   50,   14,   51,    1,    1,
			    1,    1,    1,    1,    3,    1,    4,    1,   23,    1,
			   24,    1,   25,    1,   26,    3,    1,    4,    1,   23,
			    1,   24,    1,   25,    1,   26,    1,    1,    3,   13,
			    1,    2,    1,    2,    2,    1,    1,   12,    1,    1,
			    1,    1,   12,    1,    1,    1,    3,    1,    4,    1,
			   23,    1,   24,    1,   25,    1,   26,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,   13,
			   49,    2,    1,    1,    2,    1,    1,    2,    1,    2,
			    2,   61,    1,    3,    3,   51,    2,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    3,    1,    1,
			    1,    2,    2,    2,    1,    7,   15,    1,    1,    1,
			    1,    1,    1,    1,    1,    7,    1,    7,    1,    1,
			    1,    1,    1,    2,   12,    7,    1,   15,    1,    1,
			    1,    1,    1,    1,   12,    1,    1,    1, yyDummy>>)
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
			    2,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER]
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,  103,  102,
			    0,  112,  206,  208,  207,  232,  214,    3,    2,   76,
			  205,    0,  138,    5,   79,   83,   82,  105,   84,   85,
			   89,  106,   80,   87,  107,   86,    0,  110,  111,    0,
			    1,    0,    0,  234,  216,  233,  215,    0,   94,   93,
			   96,   11,   10,    0,    0,   77,  205,    8,    0,    0,
			    6,    0,   99,  100,   98,  101,    0,  123,  119,  120,
			  122,  121,  117,  115,  118,  116,  114,  113,    0,    0,
			    0,   88,  108,    0,    0,    0,    9,    0,  140,    0,
			   97,    0,  112,  109,  104,   81,   78,   95,  251,  250,

			    0,  186,  179,  157,  164,  171,  303,  287,  271,  255,
			  189,  192,  193,  187,    0,  145,  151,    0,  158,  172,
			  165,  180,  188,  146,  152,  196,  159,  166,  173,  181,
			  147,  153,  167,  160,  174,  182,  148,  154,  168,  161,
			  175,  183,   50,   48,   46,   47,   44,   45,   43,   42,
			   49,    0,    0,    0,    0,   51,  124,  124,   14,   57,
			    0,   12,   13,   52,   54,   55,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   90,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,   91,   92,  142,    0,    0,
			  214,    0,  141,   65,    0,    0,  128,  128,    0,    4,
			   53,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,  228,    0,  246,    0,
			  267,    0,  299,    0,  283,    0,  315,    0,  178,  213,
			  210,  219,  217,    0,    0,  237,  235,  254,  251,  250,
			  252,  258,  256,  290,  288,  274,  272,  306,  304,  212,
			  211,  218,  236,  253,  257,  273,  289,  305,  231,    0,

			  229,  249,    0,  247,  286,    0,  284,  270,    0,  268,
			  302,    0,  300,  318,  316,  230,  248,  285,  269,  301,
			  317,  198,  197,  209,  191,  190,  177,  176,  185,  184,
			  163,  162,  170,  169,  156,  155,  150,  149,    0,  139,
			    0,    0,    0,    0,   60,   59,    0,  227,  245,  266,
			  298,  282,  314,  225,  243,  264,  296,  280,  312,    0,
			  226,    0,  244,    0,  265,    0,  297,    0,  281,    0,
			  313,  224,  242,  263,  295,  279,  311,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  144,  143,   66,    0,    0,    0,   23,
			    0,    0,    0,   22,  204,   24,   16,   17,    7,    0,
			   21,  138,   33,   18,  145,   19,   20,  199,   15,   63,
			   61,  138,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,  220,    0,  238,    0,
			  259,    0,  291,    0,  275,    0,  307,    0,  126,    0,
			    0,    0,   41,   35,    0,   58,    0,   34,    0,    0,
			    0,    0,    0,   56,   24,   62,    0,  221,    0,  239,
			    0,  260,    0,  292,    0,  276,    0,  308,  222,  240,

			  261,  293,  277,  309,    0,    0,   67,    0,  125,  130,
			    0,   31,   29,   39,   37,    0,   27,   36,   72,  320,
			  319,  203,  202,  201,    0,  200,   28,  223,  241,  262,
			  294,  278,  310,    0,    0,    0,   64,  127,    0,  129,
			   40,    0,    0,   38,    0,   74,    0,    0,   69,   68,
			  133,  131,  132,    0,  138,   73,    0,    0,   70,    0,
			    0,    0,    0,    0,   25,   75,   32,    0,  136,  137,
			  134,  135,  138,   71,   26,    0,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			   18,  545,  557,   19,  426,  427,   56,  429,   60,  226,
			  221,  469,   22,   23,  430,  431,  432,  433,  159,   24,
			   25,   26,   27,   28,   29,   30,   31,   32,   33,   34,
			   35,   36,   37,   38,  117,  118,  119,  120,  121,   39,
			  325,  122,  123,  124,  125,  126,  127,  128,  129,  130,
			  131,  132,  133,  134,  135,  136,  137,  138,  139,  140,
			  141,   78,   79,   66,  344,  510,  435,  436,  437,  142,
			  143,  144,  145,  146,  147,  148,  149,  150,  521,  575,
			  438,  160,  161,  162,  440,  441,  163,  164,  165,  442,
			  224,  505,  506,  534, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			  133,  212,  590,  567,   30,   31,  818,  816, -32768, -32768,
			  800,  781, -32768, -32768, -32768, -32768, -32768, -32768,  189, -32768,
			  612,  427,  231,  777,  591, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768,  451, -32768, -32768,  776,
			 -32768,  351,  389, -32768, -32768, -32768, -32768,  212, -32768, -32768,
			 -32768, -32768, -32768,  792,  791, -32768, -32768, -32768,  778,  153,
			 -32768,  790, -32768, -32768, -32768, -32768,   23, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,   40,   40,
			   36, -32768, -32768,  329,  782,  782, -32768,  784, -32768,  144,
			 -32768,   40, -32768, -32768,  516, -32768,  591, -32768,  554,  482,

			  374, -32768,  712, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768,  775,  779,  774,  771,  770,  769,  768,
			  767,  766,  765,  764,  761,  760,  759,  758,  757,  756,
			  755,  752,  751,  750,  749,  748,  747,  745,  742,  741,
			  740,  729,  731,  730,  724,  711,  710,  706,  705,  700,
			 -32768,  754,  753,  127,  773, -32768,  744,  744, -32768,  734,
			  746, -32768,   13, -32768, -32768, -32768,  398,  336,  336,  336,
			  336,  507,  505,  500,  457,  409,  407,  735,   10, -32768,
			  207,  217,  255,    6,  142,    9,    8,    3,  168,  253,
			  528,  637,  589,  628,  600,  387,  386,  353,  340,  301,

			  299,  743,  739,  738,  737,  736,  735,  341,   32,  266,
			  249,  265,  252,  156,  101, -32768, -32768, -32768,  763,  762,
			  721,  733, -32768, -32768,  462,  717,  722,  722,  707, -32768,
			 -32768,  725,  723,  709,  702,  701,  696,  695,  692,  691,
			  690,  687,  686,  406,  344,  330,  322,  306,  304,  682,
			  681,  680,  679,  678,  677,  174, -32768,  256, -32768,  103,
			 -32768,  229, -32768,  145, -32768,  204, -32768,  310, -32768, -32768,
			 -32768, -32768, -32768,  704,  703, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  166,

			 -32768, -32768,  333, -32768, -32768,   -4, -32768, -32768,   -9, -32768,
			 -32768,  237, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  159, -32768,
			  693,  661,  658,  634, -32768, -32768,  669, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,   81,
			 -32768,    4, -32768,    5, -32768,  223, -32768,  -11, -32768,   -5,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768,  168,  673,  253,
			  672,  637,  667,  628,  666,  589,  652,  600,  645,  600,
			  600,  600,  600,  168,  168,  168,  168,  253,  253,  253,

			  253,  589,  589,  589,  589,  637,  637,  637,  637,  628,
			  628,  628,  628, -32768, -32768, -32768,  647,  668,  638, -32768,
			  427,  492,  427, -32768, -32768,  640, -32768, -32768,  655,  288,
			 -32768,  231,  620, -32768,   99, -32768,  126, -32768, -32768, -32768,
			 -32768,  231,  726,  168,  630,  253,  629,  637,  623,  628,
			  616,  589,  615,  600,  611,  598, -32768,  597, -32768,  588,
			 -32768,  587, -32768,  582, -32768,  576, -32768,  418,  570,  577,
			  127,  348, -32768,  264,   14, -32768,  427, -32768,  575,  169,
			   72,  168,  584, -32768, -32768, -32768,  571, -32768,  566, -32768,
			  565, -32768,  563, -32768,  553, -32768,  551, -32768, -32768, -32768,

			 -32768, -32768, -32768, -32768,  543,   -7, -32768,  546, -32768,  477,
			  512, -32768, -32768, -32768,  487,  257, -32768,  524,  464, -32768,
			 -32768, -32768, -32768, -32768,  458, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768,  782,  334,  418, -32768, -32768,  511, -32768,
			 -32768,  397,  401, -32768,  189,  420,  438,  437, -32768, -32768,
			  367,  349,  337,  342,  231,  189,  189,  293, -32768,  782,
			   -6,  276,  273,  214, -32768,  189, -32768,  280, -32768, -32768,
			 -32768, -32768,  231, -32768, -32768,  158,   38, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -120, -32768, -32768,  -18, -32768, -32768,    1,  868, -429,  713,
			  396, -32768, -32768, -32768,  -79, -32768, -32768, -32768, -32768,   33,
			 -32768,  801,  786, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768,   15,  -81,  -77,    2,   21,  -40,  -50,  -86, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  347,
			  316,  238,  -39, -156,  -29, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768,  636, -32768, -32768, -32768,  381, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768,  780, -32768, -32768,
			  860, -32768,  445, -32768,  405, -32768,  676, -32768, -32768, -32768,
			 -32768, -32768,  302, -32768, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   55,   20,  477,  115,  115,  114,  151,  116,  116,   15,
			  108,  109,  482,  290,  176,  516,   42,  108,  106,  171,
			  270,  157,   58,  172,  536,  109,  109,   16,   15,  156,
			  108,  106,   50,  324,   41,  569,  568,   95,  577,   11,
			   16,   15,  323,  312,   16,   15,   48,   49,  289,  319,
			  175,  281,   11,  287,  285,  269,   92,    9,    8,  451,
			  174,  408,  407,  406,  405,  453,  404,  403,  402,  401,
			    9,    8,  222,  522,  445,  447,   16,  535,  274,  273,
			   83,  236,  242,  248,  254,   16,  231,  237,  243,  249,
			  232,  238,  244,  250,   94,  154,  515,    3,    2,  272,

			  288,    5,  336,    4,  276,   16,  166,  291,  297,    1,
			    3,    2,  292,   96,    3,    2,   47,  235,  241,  247,
			  253,  173,    1,  109,  329,  564,   91,  234,  240,  246,
			  252,  220,  479,  337,   17,  286,  335,   16,   15,   14,
			   13,   12,  295,  574,  284,  158,  219,  218,  268,   11,
			   10,  443,  157,  296,   88,  219,  218,  334,  576,  309,
			  156,   15,  333,   16,  107,  318,  108,    9,    8,  327,
			   16,  314,   16,  381,  378,  219,  218,  320,   16,  388,
			  380,  176,  520,  180,  280,    7,    6,  283,  233,  239,
			  245,  251,  293,   16,   15,   14,   13,   12,    5,   87,

			    4,  219,  218,  217,  282,   11,   10,    3,    2,  322,
			  481,   16,  294,  386,  480,  385,   16,   15,  171,    1,
			  155,  384,   15,    9,    8,  172,  154,  106,   11,  519,
			  274,  273,  331,  219,  218,  413,  396,  395,  394,  393,
			  219,  218,  219,  218,  377,  107,    9,    8,  219,  218,
			  328,  107,  271,  332,    5,  175,    4,  414,   15,  107,
			  542,   15,  275,    3,    2,  434,  330,  326,  541,  116,
			   59,  174,  106,  108,  387,    1,  514,    5,  444,    4,
			  382,  219,  218,  454,  446,  109,    3,    2,  107,  279,
			  278,  274,  273,  449,   14,   13,  455,  572,    1,  383,

			  277,  465,  457,  236,  242,  248,  254,  412,  411,  410,
			  409,  573,  231,  237,  243,  249,  571,  452,  513,  570,
			  232,  238,  244,  250,  566,  450,  379,  274,  273,  173,
			  274,  273,  267,  106,  311,  463,  476,  370,   15,  368,
			   16,   15,  321,  461,  313,  563,  310,  428,  369,  512,
			  367,  235,  241,  247,  253,  366,  109,  108,  107,  106,
			  511,  434,  486,  364,  -30,  116,  365,  496,  488,  234,
			  240,  246,  252,  308,  363,  279,  278,  362,   16,   15,
			  392,  391,  390,  389,  448,  307,  305,  -30,  361,  222,
			   65,   64,   63,   62,  109,  108,  107,  106,  304,  523,

			  524,  494,  459,  400,  399,  398,  397,  274,  273,  492,
			    3,    2,   65,   64,   63,   62,   97,  548,  547,  302,
			  299,  471,  473,  474,  555,  562,  233,  239,  245,  251,
			   58,  301,  298,   14,   13,  306,  565,  561,   81,  360,
			  266,  317,  264,  428,  170,  169,  168,  167,    3,    2,
			  359,  265,  115,  263,  546,  560,  116,   77,   76,   75,
			   74,   73,   72,   71,   70,   69,   68,  559,  490,  558,
			   67,  556,   71,   70,   69,   68,   82,  517,  115,   67,
			  567,  553,  116, -194,  554,   82, -194, -194, -194, -194,
			  262,  479, -194,  472, -194, -194, -194, -194,   14,   13,

			  504,  261, -194, -194, -194, -194, -194, -194, -194, -194,
			 -194, -194,  303, -194,  544, -194, -194, -194,  316,   77,
			   76,   75,   74,   73,   72,   71,   70,   69,   68, -194,
			 -194, -194,   67,  260, -194, -194,  543,   55,  258, -194,
			  256,  540,  300,  539,  259,  341,  340,   55,  315,  257,
			  537,  255,  552,  551,  550, -195, -194, -194, -195, -195,
			 -195, -195,  279,  278, -195,  538, -195, -195, -195, -195,
			 -194,   46,   45,  533, -195, -195, -195, -195, -195, -195,
			 -195, -195, -195, -195,  532, -195,  531, -195, -195, -195,
			   71,   70,   69,   68,   44,   43,  530,   67,  529,  528,

			  526, -195, -195, -195,  527,  518, -195, -195,  508,  503,
			  108, -195,   -7,   -7,  507,  502,   -7,   -7,   -7,   -7,
			  501,  500,   -7,  106,   57,   -7,   -7,   -7, -195, -195,
			  499,  498,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,
			   -7,   -7, -195,   -7,  497,   -7,   -7,   -7,  495,  493,
			  107,   -7,   65,   64,   63,   62,  491,  109,   -7,   -7,
			   -7,   -7,  489,  487,   -7,   -7,  478,   57,  470,   -7,
			  425,  475,  468,   16,   15,   14,   13,  467,  466,  113,
			  418,  424,  112,  111,  110,  464,   -7,   -7,  417,  109,
			  108,  107,  106,  105,  104,  103,  102,  423,  101,  462,

			  460,  415,  100,   99,   98,  458,  456,  416,   45,   43,
			  376,  375,  374,  373,  372,  371,  422,  421,  420,  358,
			  357,    7,    6,  356,  355,  354,  419,  484,  353,  352,
			   16,   15,   14,   13,  351,  350,  113,  346,  424,  112,
			  111,  110,  349,    3,    2,  155,  109,  108,  107,  106,
			  105,  104,  103,  102,  423,  101,  348,  483,  347,  100,
			   99,   98,  343,  342,  339,  338,   46,   44,  267,  311,
			  308,  305,  302,  422,  421,  420,  299,  229,    7,    6,
			  228,  223,  225,  419,  216,  215,   16,   15,  214,  177,
			   86,  439,  113,  213,  212,  112,  111,  110,  211,  210,

			    3,    2,  109,  108,  107,  106,  105,  104,  103,  102,
			  179,  101,  209,  206,  153,  100,   99,   98,  208,  207,
			   89,   85,   84,   61,  205,  204,  203,   54,   52,  202,
			   51,  201,  200,  199,  198,  197,  196,  549,  230,  195,
			  194,  193,  192,  191,  190,  189,   53,  485,  188,  187,
			  186,  185,  184,  183,  182,  181,    3,    2,  180,  178,
			   40,   80,  525,  345,   93,  152,  509,   90,   21,    0,
			  227, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			   18,    0,  431,   84,   85,   84,   85,   84,   85,    5,
			   21,   20,  441,   10,  100,    1,    1,   21,   23,  100,
			   10,    8,   21,  100,   31,   20,   20,    4,    5,   16,
			   21,   23,    1,    1,    1,   41,   42,    1,    0,   16,
			    4,    5,   10,  199,    4,    5,   16,   16,   45,  205,
			  100,   45,   16,   45,   45,   45,   16,   34,   35,   70,
			  100,   70,   71,   72,   73,   70,   70,   71,   72,   73,
			   34,   35,  153,    1,   70,   70,    4,   84,   74,   75,
			   47,  167,  168,  169,  170,    4,  167,  168,  169,  170,
			  167,  168,  169,  170,   79,   82,   82,   74,   75,  180,

			  186,   65,    1,   67,  181,    4,   91,  188,  194,   86,
			   74,   75,  189,   80,   74,   75,   86,  167,  168,  169,
			  170,  100,   86,   20,  210,  554,   86,  167,  168,  169,
			  170,    4,   33,  214,    1,  185,  213,    4,    5,    6,
			    7,    8,  192,  572,  184,    1,   74,   75,  177,   16,
			   17,   70,    8,  193,    1,   74,   75,    1,    0,  198,
			   16,    5,  212,    4,   22,  204,   21,   34,   35,  209,
			    4,  200,    4,   70,  255,   74,   75,  206,    4,  265,
			  257,  267,   13,   84,  182,   52,   53,   45,  167,  168,
			  169,  170,  190,    4,    5,    6,    7,    8,   65,   46,

			   67,   74,   75,   76,  183,   16,   17,   74,   75,  207,
			   84,    4,  191,  263,   88,   70,    4,    5,  299,   86,
			   76,  261,    5,   34,   35,  302,   82,   23,   16,   60,
			   74,   75,  211,   74,   75,   76,   70,   71,   72,   73,
			   74,   75,   74,   75,   70,   22,   34,   35,   74,   75,
			    1,   22,   45,    1,   65,  305,   67,  338,    5,   22,
			    3,    5,   45,   74,   75,  346,    1,    1,   11,  346,
			   39,  311,   23,   21,   70,   86,   12,   65,  359,   67,
			  259,   74,   75,  369,  361,   20,   74,   75,   22,   34,
			   35,   74,   75,   70,    6,    7,  377,   83,   86,   70,

			   45,  387,  379,  389,  390,  391,  392,   70,   71,   72,
			   73,   31,  393,  394,  395,  396,   43,  367,   54,   43,
			  397,  398,  399,  400,   31,  365,   70,   74,   75,  308,
			   74,   75,   33,   23,   33,  385,   48,   33,    5,   33,
			    4,    5,    1,  383,   45,    3,   45,  346,   44,    1,
			   44,  401,  402,  403,  404,   33,   20,   21,   22,   23,
			   12,  442,  443,   33,   16,  442,   44,  453,  445,  409,
			  410,  411,  412,   33,   44,   34,   35,   33,    4,    5,
			   70,   71,   72,   73,  363,   45,   33,   39,   44,  470,
			   61,   62,   63,   64,   20,   21,   22,   23,   45,  480,

			  481,  451,  381,   70,   71,   72,   73,   74,   75,  449,
			   74,   75,   61,   62,   63,   64,   87,   83,   84,   33,
			   33,  420,  421,  422,  544,   88,  405,  406,  407,  408,
			  429,   45,   45,    6,    7,  197,  556,   88,   87,   33,
			   33,  203,   33,  442,   70,   71,   72,   73,   74,   75,
			   44,   44,  533,   44,  533,   88,  533,   68,   69,   70,
			   71,   72,   73,   74,   75,   76,   77,   30,  447,   31,
			   81,   51,   74,   75,   76,   77,   87,  476,  559,   81,
			  559,   84,  559,    1,   83,   87,    4,    5,    6,    7,
			   33,   33,   10,    1,   12,   13,   14,   15,    6,    7,

			   82,   44,   20,   21,   22,   23,   24,   25,   26,   27,
			   28,   29,  196,   31,   50,   33,   34,   35,  202,   68,
			   69,   70,   71,   72,   73,   74,   75,   76,   77,   47,
			   48,   49,   81,   33,   52,   53,   12,  555,   33,   57,
			   33,   54,  195,   31,   44,   83,   84,  565,  201,   44,
			    4,   44,   41,   42,   43,    1,   74,   75,    4,    5,
			    6,    7,   34,   35,   10,   88,   12,   13,   14,   15,
			   88,    4,    5,   30,   20,   21,   22,   23,   24,   25,
			   26,   27,   28,   29,   33,   31,   33,   33,   34,   35,
			   74,   75,   76,   77,    4,    5,   33,   81,   33,   33,

			   16,   47,   48,   49,   33,   30,   52,   53,   31,   33,
			   21,   57,    0,    1,   44,   33,    4,    5,    6,    7,
			   33,   33,   10,   23,   12,   13,   14,   15,   74,   75,
			   33,   33,   20,   21,   22,   23,   24,   25,   26,   27,
			   28,   29,   88,   31,   33,   33,   34,   35,   33,   33,
			   22,   39,   61,   62,   63,   64,   33,   20,   46,   47,
			   48,   49,   33,   33,   52,   53,   46,   12,   30,   57,
			    1,   31,    4,    4,    5,    6,    7,   30,   33,   10,
			   46,   12,   13,   14,   15,   33,   74,   75,   30,   20,
			   21,   22,   23,   24,   25,   26,   27,   28,   29,   33,

			   33,    8,   33,   34,   35,   33,   33,   46,    5,    5,
			   33,   33,   33,   33,   33,   33,   47,   48,   49,   33,
			   33,   52,   53,   33,   33,   33,   57,    1,   33,   33,
			    4,    5,    6,    7,   33,   33,   10,   30,   12,   13,
			   14,   15,   33,   74,   75,   76,   20,   21,   22,   23,
			   24,   25,   26,   27,   28,   29,   33,   31,   33,   33,
			   34,   35,   40,   46,   31,   44,    4,    4,   33,   33,
			   33,   33,   33,   47,   48,   49,   33,   31,   52,   53,
			   46,    8,   38,   57,   31,   31,    4,    5,   88,   77,
			   12,  346,   10,   88,   88,   13,   14,   15,   88,   88,

			   74,   75,   20,   21,   22,   23,   24,   25,   26,   27,
			   31,   29,   88,   84,   30,   33,   34,   35,   88,   88,
			   30,   30,   30,   46,   84,   84,   84,   46,   12,   84,
			   12,   84,   84,   84,   84,   84,   84,  535,  162,   84,
			   84,   84,   84,   84,   84,   84,   46,  442,   84,   84,
			   84,   84,   84,   84,   84,   84,   74,   75,   84,   84,
			    0,   85,  481,  227,   78,   85,  470,   66,    0,   -1,
			  157, yyDummy>>)
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

	yyvs5: SPECIAL [CHARACTER]
			-- Stack for semantic values of type CHARACTER

	yyvsc5: INTEGER
			-- Capacity of semantic value stack `yyvs5'

	yyvsp5: INTEGER
			-- Top of semantic value stack `yyvs5'

	yyspecial_routines5: KL_SPECIAL_ROUTINES [CHARACTER]
			-- Routines that ought to be in SPECIAL [CHARACTER]

	yyvs6: SPECIAL [C_DV_QUANTITY]
			-- Stack for semantic values of type C_DV_QUANTITY

	yyvsc6: INTEGER
			-- Capacity of semantic value stack `yyvs6'

	yyvsp6: INTEGER
			-- Top of semantic value stack `yyvs6'

	yyspecial_routines6: KL_SPECIAL_ROUTINES [C_DV_QUANTITY]
			-- Routines that ought to be in SPECIAL [C_DV_QUANTITY]

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

	yyvs16: SPECIAL [ARCHETYPE_SLOT]
			-- Stack for semantic values of type ARCHETYPE_SLOT

	yyvsc16: INTEGER
			-- Capacity of semantic value stack `yyvs16'

	yyvsp16: INTEGER
			-- Top of semantic value stack `yyvs16'

	yyspecial_routines16: KL_SPECIAL_ROUTINES [ARCHETYPE_SLOT]
			-- Routines that ought to be in SPECIAL [ARCHETYPE_SLOT]

	yyvs17: SPECIAL [C_ATTRIBUTE]
			-- Stack for semantic values of type C_ATTRIBUTE

	yyvsc17: INTEGER
			-- Capacity of semantic value stack `yyvs17'

	yyvsp17: INTEGER
			-- Top of semantic value stack `yyvs17'

	yyspecial_routines17: KL_SPECIAL_ROUTINES [C_ATTRIBUTE]
			-- Routines that ought to be in SPECIAL [C_ATTRIBUTE]

	yyvs18: SPECIAL [EXPR_ITEM]
			-- Stack for semantic values of type EXPR_ITEM

	yyvsc18: INTEGER
			-- Capacity of semantic value stack `yyvs18'

	yyvsp18: INTEGER
			-- Top of semantic value stack `yyvs18'

	yyspecial_routines18: KL_SPECIAL_ROUTINES [EXPR_ITEM]
			-- Routines that ought to be in SPECIAL [EXPR_ITEM]

	yyvs19: SPECIAL [EXPR_UNARY_OPERATOR]
			-- Stack for semantic values of type EXPR_UNARY_OPERATOR

	yyvsc19: INTEGER
			-- Capacity of semantic value stack `yyvs19'

	yyvsp19: INTEGER
			-- Top of semantic value stack `yyvs19'

	yyspecial_routines19: KL_SPECIAL_ROUTINES [EXPR_UNARY_OPERATOR]
			-- Routines that ought to be in SPECIAL [EXPR_UNARY_OPERATOR]

	yyvs20: SPECIAL [EXPR_BINARY_OPERATOR]
			-- Stack for semantic values of type EXPR_BINARY_OPERATOR

	yyvsc20: INTEGER
			-- Capacity of semantic value stack `yyvs20'

	yyvsp20: INTEGER
			-- Top of semantic value stack `yyvs20'

	yyspecial_routines20: KL_SPECIAL_ROUTINES [EXPR_BINARY_OPERATOR]
			-- Routines that ought to be in SPECIAL [EXPR_BINARY_OPERATOR]

	yyvs21: SPECIAL [EXPR_LEAF]
			-- Stack for semantic values of type EXPR_LEAF

	yyvsc21: INTEGER
			-- Capacity of semantic value stack `yyvs21'

	yyvsp21: INTEGER
			-- Top of semantic value stack `yyvs21'

	yyspecial_routines21: KL_SPECIAL_ROUTINES [EXPR_LEAF]
			-- Routines that ought to be in SPECIAL [EXPR_LEAF]

	yyvs22: SPECIAL [BOOLEAN]
			-- Stack for semantic values of type BOOLEAN

	yyvsc22: INTEGER
			-- Capacity of semantic value stack `yyvs22'

	yyvsp22: INTEGER
			-- Top of semantic value stack `yyvs22'

	yyspecial_routines22: KL_SPECIAL_ROUTINES [BOOLEAN]
			-- Routines that ought to be in SPECIAL [BOOLEAN]

	yyvs23: SPECIAL [ISO8601_DATE]
			-- Stack for semantic values of type ISO8601_DATE

	yyvsc23: INTEGER
			-- Capacity of semantic value stack `yyvs23'

	yyvsp23: INTEGER
			-- Top of semantic value stack `yyvs23'

	yyspecial_routines23: KL_SPECIAL_ROUTINES [ISO8601_DATE]
			-- Routines that ought to be in SPECIAL [ISO8601_DATE]

	yyvs24: SPECIAL [ISO8601_DATE_TIME]
			-- Stack for semantic values of type ISO8601_DATE_TIME

	yyvsc24: INTEGER
			-- Capacity of semantic value stack `yyvs24'

	yyvsp24: INTEGER
			-- Top of semantic value stack `yyvs24'

	yyspecial_routines24: KL_SPECIAL_ROUTINES [ISO8601_DATE_TIME]
			-- Routines that ought to be in SPECIAL [ISO8601_DATE_TIME]

	yyvs25: SPECIAL [ISO8601_TIME]
			-- Stack for semantic values of type ISO8601_TIME

	yyvsc25: INTEGER
			-- Capacity of semantic value stack `yyvs25'

	yyvsp25: INTEGER
			-- Top of semantic value stack `yyvs25'

	yyspecial_routines25: KL_SPECIAL_ROUTINES [ISO8601_TIME]
			-- Routines that ought to be in SPECIAL [ISO8601_TIME]

	yyvs26: SPECIAL [ISO8601_DURATION]
			-- Stack for semantic values of type ISO8601_DURATION

	yyvsc26: INTEGER
			-- Capacity of semantic value stack `yyvs26'

	yyvsp26: INTEGER
			-- Top of semantic value stack `yyvs26'

	yyspecial_routines26: KL_SPECIAL_ROUTINES [ISO8601_DURATION]
			-- Routines that ought to be in SPECIAL [ISO8601_DURATION]

	yyvs27: SPECIAL [URI]
			-- Stack for semantic values of type URI

	yyvsc27: INTEGER
			-- Capacity of semantic value stack `yyvs27'

	yyvsp27: INTEGER
			-- Top of semantic value stack `yyvs27'

	yyspecial_routines27: KL_SPECIAL_ROUTINES [URI]
			-- Routines that ought to be in SPECIAL [URI]

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

	yyvs50: SPECIAL [CONSTRAINT_REF]
			-- Stack for semantic values of type CONSTRAINT_REF

	yyvsc50: INTEGER
			-- Capacity of semantic value stack `yyvs50'

	yyvsp50: INTEGER
			-- Top of semantic value stack `yyvs50'

	yyspecial_routines50: KL_SPECIAL_ROUTINES [CONSTRAINT_REF]
			-- Routines that ought to be in SPECIAL [CONSTRAINT_REF]

	yyvs51: SPECIAL [ORDINAL]
			-- Stack for semantic values of type ORDINAL

	yyvsc51: INTEGER
			-- Capacity of semantic value stack `yyvs51'

	yyvsp51: INTEGER
			-- Top of semantic value stack `yyvs51'

	yyspecial_routines51: KL_SPECIAL_ROUTINES [ORDINAL]
			-- Routines that ought to be in SPECIAL [ORDINAL]

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

	yyvs61: SPECIAL [TERMINOLOGY_CODE]
			-- Stack for semantic values of type TERMINOLOGY_CODE

	yyvsc61: INTEGER
			-- Capacity of semantic value stack `yyvs61'

	yyvsp61: INTEGER
			-- Top of semantic value stack `yyvs61'

	yyspecial_routines61: KL_SPECIAL_ROUTINES [TERMINOLOGY_CODE]
			-- Routines that ought to be in SPECIAL [TERMINOLOGY_CODE]

feature {NONE} -- Constants

	yyFinal: INTEGER = 577
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 89
			-- Number of tokens

	yyLast: INTEGER = 870
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 330
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
			create arch_internal_ref_rm_type_name.make_empty
			create parent_path_str.make_empty
		end

	reset
		do
			precursor
			validator_reset
			accept
		end

	execute (in_text:STRING; a_source_start_line: INTEGER; differential_flag: BOOLEAN; an_rm_schema: BMM_SCHEMA)
		do
			reset
			rm_schema := an_rm_schema
			source_start_line := a_source_start_line
			differential_syntax := differential_flag

			create indent.make_empty

			object_nodes.wipe_out
			c_attrs.wipe_out

			create time_vc
			create date_vc
	
			set_input_buffer (new_string_buffer (in_text))
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

feature -- Access

	differential_syntax: BOOLEAN
			-- True if the supplied text to parse is differential, in which case it can contain the 
			-- differential syntax variants, i.e. ordering markers and specialisation paths

feature {NONE} -- Implementation

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
			if an_obj.is_addressable then
				ar.extend ("node_id=" + an_obj.node_id) -- $2
			else
				ar.extend ("rm_type_name=" + an_obj.rm_type_name) -- $2
			end
			ar.extend (an_attr.rm_attribute_name) -- $3

			if an_attr.is_single then
				if an_obj.occurrences /= Void and then (an_obj.occurrences.upper_unbounded or an_obj.occurrences.upper > 1) then
					err_code := ec_VACSO
				elseif an_obj.is_addressable and an_attr.has_child_with_id (an_obj.node_id) then
					err_code := ec_VACSI
				elseif not an_obj.is_addressable and an_attr.has_child_with_rm_type_name (an_obj.rm_type_name) then
					err_code := ec_VACSIT
				else
					Result := True
				end
			elseif an_attr.is_multiple then
				if not an_obj.is_addressable then
					err_code := ec_VACMI
				elseif an_attr.has_child_with_id (an_obj.node_id) then
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

	bmm_prop_def: detachable BMM_PROPERTY_DEFINITION

	c_attr_tuple: C_ATTRIBUTE_TUPLE
		attribute
			create Result.make
		end

	c_attr_tuple_item: INTEGER

	c_attr_tuple_count: INTEGER

-------------- FOLLOWING TAKEN FROM ODIN_VALIDATOR.Y ---------------
feature {NONE} -- Implementation 

	arch_internal_ref_rm_type_name: STRING
	arch_internal_ref_node_id: detachable STRING

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
