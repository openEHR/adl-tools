note
	component:   "openEHR Archetype Project"
	description: "Validating parser for Archetype Description Language (ADL)"
	keywords:	 "ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

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

	CONSTRAINT_MODEL_COMMON

	OPERATOR_TYPES
		export
			{NONE} all
		end

	SHARED_CONSTRAINT_MODEL_FACTORY
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
				yyspecial_routines6.force (yyvs6, last_c_domain_type_value, yyvsp6)
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
			yyval1: detachable ANY
			yyval10: C_PRIMITIVE_OBJECT
			yyval11: C_PRIMITIVE
			yyval7: ARRAYED_LIST [ASSERTION]
			yyval12: EXPR_ITEM
			yyval8: OG_PATH
			yyval21: OG_PATH_ITEM
			yyval9: INTERVAL [INTEGER]
			yyval13: CARDINALITY
			yyval3: INTEGER
			yyval2: STRING
			yyval22: ARRAYED_LIST [STRING]
			yyval23: ARRAYED_LIST [INTEGER]
			yyval4: REAL
			yyval24: ARRAYED_LIST [REAL]
			yyval32: INTERVAL [REAL]
			yyval14: BOOLEAN
			yyval15: ISO8601_DATE
			yyval34: INTERVAL [ISO8601_DATE]
			yyval17: ISO8601_TIME
			yyval33: INTERVAL [ISO8601_TIME]
			yyval16: ISO8601_DATE_TIME
			yyval35: INTERVAL [ISO8601_DATE_TIME]
			yyval18: ISO8601_DURATION
			yyval36: INTERVAL [ISO8601_DURATION]
		do
				inspect yy_act
when 1 then
--|#line 136 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 136")
end

			debug("ADL_parse")
				io.put_string("CADL definition parsed%N")
			end

			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 2 then
--|#line 144 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 144")
end

			debug("ADL_parse")
				io.put_string("assertion definition parsed%N")
			end

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
--|#line 152 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 152")
end

			debug("ADL_parse")
				io.put_string("CADL definition NOT parsed%N")
			end
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 4 then
--|#line 161 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 161")
end

			debug("ADL_parse")
				io.put_string(indent + "POP OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "]%N") 
				indent.remove_tail(1)
			end
			object_nodes.remove
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 5 then
--|#line 171 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 171")
end

			complex_obj.set_occurrences(yyvs9.item (yyvsp9))

			debug("ADL_parse")
				io.put_string(indent + "PUSH create OBJECT_NODE " + complex_obj.rm_type_name + 
						" [id=" + complex_obj.node_id + "]; occurrences=(" + yyvs9.item (yyvsp9).as_string + ")%N") 
				indent.append("%T")
			end
			
			object_nodes.extend(complex_obj)

			if not c_attrs.is_empty then
				debug("ADL_parse")
					io.put_string(indent + "ATTR_NODE " + c_attrs.item.rm_attribute_name + " put_child(OBJ)%N") 
				end
				if check_c_attribute_child(c_attrs.item, complex_obj) then
					c_attrs.item.put_child(complex_obj)
				end
			end

			-- set root node to current node if not already set - guarantees it is set to outermost block
			if output = Void then
				output := object_nodes.item
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp9 := yyvsp9 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 6 then
--|#line 199 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 199")
end

			create complex_obj.make_anonymous(yyvs2.item (yyvsp2))
		
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
when 7 then
--|#line 203 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 203")
end

			create complex_obj.make_identified(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 + 1
	yyvsp2 := yyvsp2 -2
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 8 then
--|#line 209 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 209")
end

			debug("ADL_parse")
				io.put_string(indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + 
					" [id=" + object_nodes.item.node_id + "] - any_allowed%N") 
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 9 then
--|#line 216 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 216")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 10 then
--|#line 225 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 225")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 11 then
--|#line 228 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 228")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 12 then
--|#line 231 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 231")
end

			debug("ADL_parse")
				io.put_string(indent + "ARCHETYPE_SLOT " + archetype_slot.rm_type_name + " [id=" + archetype_slot.node_id + "]%N") 
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 13 then
--|#line 237 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 237")
end

			debug("ADL_parse")
				io.put_string(indent + "ATTR_NODE " + c_attrs.item.rm_attribute_name + " put_child(constraint_ref LEAF_OBJ)%N") 
			end
			c_attrs.item.put_child(constraint_ref)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 14 then
--|#line 244 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 244")
end

			debug("ADL_parse")
				io.put_string(indent + "ATTR_NODE " + c_attrs.item.rm_attribute_name + " put_child(c_code_phrase LEAF_OBJ)%N") 
			end
			c_attrs.item.put_child(c_code_phrase_obj)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 15 then
--|#line 251 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 251")
end

			create ordinal_node.make

			across scale_node.items as scale_csr loop
				if ordinal_node /= Void then
					if scale_csr.item.value_text.has ('.') then
						ordinal_node := Void
					else
						create an_ordinal.make (scale_csr.item.value.rounded, scale_csr.item.symbol)
						ordinal_node.add_item (an_ordinal)
					end
				end
			end

			if ordinal_node /= Void then
				if scale_node.assumed_value /= Void then
					ordinal_node.set_assumed_value_from_integer (scale_node.assumed_value.value.rounded)
				end

				debug("ADL_parse")
					io.put_string(indent + "ATTR_NODE " + c_attrs.item.rm_attribute_name + " put_child(c_ordinal LEAF_OBJ)%N") 
				end

				c_attrs.item.put_child(ordinal_node)
			else
				debug("ADL_parse")
					io.put_string(indent + "ATTR_NODE " + c_attrs.item.rm_attribute_name + " put_child(c_scale LEAF_OBJ)%N") 
				end

				c_attrs.item.put_child(scale_node)
			end

			ordinal_node := Void
			scale_node := Void
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 16 then
--|#line 287 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 287")
end

			debug("ADL_parse")
				io.put_string(indent + "ATTR_NODE " + c_attrs.item.rm_attribute_name + " put_child(c_primitive LEAF_OBJ)%N") 
			end
			c_attrs.item.put_child(c_prim_obj)
		
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
--|#line 294 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 294")
end

			debug("ADL_parse")
				io.put_string(indent + "ATTR_NODE " + c_attrs.item.rm_attribute_name + " put_child(c_domain_type)%N") 
			end
			c_attrs.item.put_child(c_domain_type)
		
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
when 18 then
--|#line 301 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 301")
end

			raise_error
			report_error("invalid dADL section; error: " + dadl_parser_error)
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 19 then
--|#line 307 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 307")
end

			raise_error
			report_error("expecting a new node definition, primitive node definition, 'use' path, or 'archetype' reference")
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 20 then
--|#line 315 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 315")
end

			create archetype_internal_ref.make(yyvs2.item (yyvsp2), yyvs8.item (yyvsp8).as_string)
			if not c_occurrences_default then
				archetype_internal_ref.set_occurrences(yyvs9.item (yyvsp9))
			end

			debug("ADL_parse")
				io.put_string(indent + "create ARCHETYPE_INTERNAL_REF ")
				if archetype_internal_ref.use_target_occurrences then
					io.put_string("occurrences=(use target) ")
				else
					io.put_string("occurrences=" + archetype_internal_ref.occurrences.as_string + " ")
				end
				io.put_string(archetype_internal_ref.rm_type_name + " path=" + archetype_internal_ref.target_path + "%N") 
				io.put_string(indent + "C_ATTR " + c_attrs.item.rm_attribute_name + " put_child(ARCHETYPE_INTERNAL_REF)%N") 
			end

			if check_c_attribute_child(c_attrs.item, archetype_internal_ref) then
				c_attrs.item.put_child(archetype_internal_ref)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp2 := yyvsp2 -1
	yyvsp9 := yyvsp9 -1
	yyvsp8 := yyvsp8 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 21 then
--|#line 337 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 337")
end

			raise_error
			report_error("expecting absolute path")
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 22 then
--|#line 345 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 345")
end

			if yyvs7.item (yyvsp7 - 1) /= Void then
				archetype_slot.set_includes(yyvs7.item (yyvsp7 - 1))
			end
			if yyvs7.item (yyvsp7) /= Void then
				archetype_slot.set_excludes(yyvs7.item (yyvsp7))
			end

			debug("ADL_parse")
				io.put_string(indent + "POP ARCHETYPE_SLOT " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "]%N") 
				indent.remove_tail(1)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp1 := yyvsp1 -3
	yyvsp7 := yyvsp7 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 23 then
--|#line 361 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 361")
end

			archetype_slot.set_occurrences(yyvs9.item (yyvsp9))

			debug("ADL_parse")
				io.put_string(indent + "PUSH create ARCHETYPE_SLOT " + archetype_slot.rm_type_name + " [id=" + archetype_slot.node_id + "]; occurrences=(" + yyvs9.item (yyvsp9).as_string + ")%N") 
				indent.append("%T")
			end
			
			if not c_attrs.is_empty then
				debug("ADL_parse")
					io.put_string(indent + "C_ATTR " + c_attrs.item.rm_attribute_name + " put_child(ARCHETYPE_SLOT)%N") 
				end
				if check_c_attribute_child(c_attrs.item, archetype_slot) then
					c_attrs.item.put_child(archetype_slot)
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp9 := yyvsp9 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 24 then
--|#line 381 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 381")
end

			create archetype_slot.make_anonymous(yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 25 then
--|#line 385 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 385")
end

			create archetype_slot.make_identified(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 26 then
--|#line 389 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 389")
end

			raise_error
			report_error("error after 'use_archetype' keyword; expecting Object node definition")
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 27 then
--|#line 397 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 397")
end

			create c_prim_obj.make(yyvs11.item (yyvsp11))
			yyval10 := c_prim_obj
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp10 := yyvsp10 + 1
	yyvsp11 := yyvsp11 -1
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
--|#line 404 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 404")
end

			debug("ADL_parse")
				io.put_string(indent + "C_INTEGER: " +  c_integer.as_string + "%N")
			end
			yyval11 := c_integer
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp11 := yyvsp11 + 1
	yyvsp1 := yyvsp1 -1
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
--|#line 411 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 411")
end

			debug("ADL_parse")
				io.put_string(indent + "C_REAL: " +  c_real.as_string + "%N")
			end
			yyval11 := c_real
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp11 := yyvsp11 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp11 >= yyvsc11 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs11")
		end
		yyvsc11 := yyvsc11 + yyInitial_yyvs_size
		yyvs11 := yyspecial_routines11.aliased_resized_area (yyvs11, yyvsc11)
	end
	yyspecial_routines11.force (yyvs11, yyval11, yyvsp11)
end
when 30 then
--|#line 418 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 418")
end

			debug("ADL_parse")
				io.put_string(indent + "C_DATE: " +  c_date.as_string + "%N")
			end
			yyval11 := c_date
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp11 := yyvsp11 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp11 >= yyvsc11 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs11")
		end
		yyvsc11 := yyvsc11 + yyInitial_yyvs_size
		yyvs11 := yyspecial_routines11.aliased_resized_area (yyvs11, yyvsc11)
	end
	yyspecial_routines11.force (yyvs11, yyval11, yyvsp11)
end
when 31 then
--|#line 425 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 425")
end

			debug("ADL_parse")
				io.put_string(indent + "C_TIME: " +  c_time.as_string + "%N")
			end
			yyval11 := c_time
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp11 := yyvsp11 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp11 >= yyvsc11 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs11")
		end
		yyvsc11 := yyvsc11 + yyInitial_yyvs_size
		yyvs11 := yyspecial_routines11.aliased_resized_area (yyvs11, yyvsc11)
	end
	yyspecial_routines11.force (yyvs11, yyval11, yyvsp11)
end
when 32 then
--|#line 432 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 432")
end

			debug("ADL_parse")
				io.put_string(indent + "C_DATE_TIME: " +  c_date_time.as_string + "%N")
			end
			yyval11 := c_date_time
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp11 := yyvsp11 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp11 >= yyvsc11 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs11")
		end
		yyvsc11 := yyvsc11 + yyInitial_yyvs_size
		yyvs11 := yyspecial_routines11.aliased_resized_area (yyvs11, yyvsc11)
	end
	yyspecial_routines11.force (yyvs11, yyval11, yyvsp11)
end
when 33 then
--|#line 439 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 439")
end

			debug("ADL_parse")
				io.put_string(indent + "C_DURATION: " +  c_duration.as_string + "%N")
			end
			yyval11 := c_duration
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp11 := yyvsp11 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp11 >= yyvsc11 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs11")
		end
		yyvsc11 := yyvsc11 + yyInitial_yyvs_size
		yyvs11 := yyspecial_routines11.aliased_resized_area (yyvs11, yyvsc11)
	end
	yyspecial_routines11.force (yyvs11, yyval11, yyvsp11)
end
when 34 then
--|#line 446 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 446")
end

			debug("ADL_parse")
				io.put_string(indent + "C_STRING: " +  c_string.as_string + "%N")
			end
			yyval11 := c_string
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp11 := yyvsp11 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp11 >= yyvsc11 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs11")
		end
		yyvsc11 := yyvsc11 + yyInitial_yyvs_size
		yyvs11 := yyspecial_routines11.aliased_resized_area (yyvs11, yyvsc11)
	end
	yyspecial_routines11.force (yyvs11, yyval11, yyvsp11)
end
when 35 then
--|#line 453 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 453")
end

			debug("ADL_parse")
				io.put_string(indent + "C_BOOLEAN: " +  c_boolean.as_string + "%N")
			end
			yyval11 := c_boolean
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp11 := yyvsp11 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp11 >= yyvsc11 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs11")
		end
		yyvsc11 := yyvsc11 + yyInitial_yyvs_size
		yyvs11 := yyspecial_routines11.aliased_resized_area (yyvs11, yyvsc11)
	end
	yyspecial_routines11.force (yyvs11, yyval11, yyvsp11)
end
when 36 then
--|#line 462 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 462")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 37 then
--|#line 469 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 469")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 38 then
--|#line 472 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 472")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 39 then
--|#line 477 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 477")
end

			debug("ADL_parse")
				io.put_string(indent + "POP ATTR_NODE " + c_attrs.item.rm_attribute_name + "%N") 
				indent.remove_tail(1)
			end
			c_attrs.remove
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 40 then
--|#line 485 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 485")
end

			raise_error
			report_error("expecting a 'any' node, 'leaf' node, or new node definition")
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 41 then
--|#line 493 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 493")
end

			rm_attribute_name := yyvs2.item (yyvsp2)

			if not object_nodes.item.has_attribute(rm_attribute_name) then
				create attr_node.make_single(rm_attribute_name)
				attr_node.set_existence(yyvs9.item (yyvsp9))
				c_attrs.put(attr_node)
				debug("ADL_parse")
					io.put_string(indent + "PUSH create ATTR_NODE " + attr_node.rm_attribute_name + " existence=(" + yyvs9.item (yyvsp9).as_string + ")%N") 
				

					io.put_string(indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_child(REL)%N") 
					indent.append("%T")
				end

				object_nodes.item.put_attribute(attr_node)
			else
				raise_error
				report_error("duplicate attribute " + rm_attribute_name)
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 + 1
	yyvsp2 := yyvsp2 -1
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
when 42 then
--|#line 516 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 516")
end

			rm_attribute_name := yyvs2.item (yyvsp2)

			if not object_nodes.item.has_attribute(rm_attribute_name) then
				create attr_node.make_multiple(rm_attribute_name, yyvs13.item (yyvsp13))
				attr_node.set_existence(yyvs9.item (yyvsp9))
				c_attrs.put(attr_node)
				debug("ADL_parse")
					io.put_string(indent + "PUSH create ATTR_NODE " + attr_node.rm_attribute_name + " existence=(" + yyvs9.item (yyvsp9).as_string + "); cardinality=(" + yyvs13.item (yyvsp13).as_string + ")%N") 
				

					io.put_string(indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_child(REL)%N") 
					indent.append("%T")
				end

				object_nodes.item.put_attribute(attr_node)
			else
				raise_error
				report_error("duplicate attribute " + rm_attribute_name)
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp9 := yyvsp9 -1
	yyvsp13 := yyvsp13 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 43 then
--|#line 541 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 541")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 44 then
--|#line 544 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 544")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 45 then
--|#line 547 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 547")
end

			debug("ADL_parse")
				io.put_string(indent + "ATTR_NODE " + attr_node.rm_attribute_name + "  - any_allowed%N") 
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 46 then
--|#line 556 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 556")
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
when 47 then
--|#line 557 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 557")
end

			debug("include list")
				io.put_string(indent + "[---assertion expression---] %N")
			end
			yyval7 := assertion_list
			assertion_list := Void
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 48 then
--|#line 567 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 567")
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
when 49 then
--|#line 568 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 568")
end

			debug("exclude list")
				io.put_string(indent + "[---assertion expression---] %N")
			end
			yyval7 := assertion_list
			assertion_list := Void
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 50 then
--|#line 582 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 582")
end

			if assertion_list = Void then 
				create assertion_list.make(0)
			end
			assertion_list.extend(assertion)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp7 := yyvsp7 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp7 >= yyvsc7 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs7")
		end
		yyvsc7 := yyvsc7 + yyInitial_yyvs_size
		yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
	end
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 51 then
--|#line 589 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 589")
end

			assertion_list.extend(assertion)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 52 then
--|#line 595 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 595")
end

			create assertion.make(yyvs12.item (yyvsp12), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 53 then
--|#line 599 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 599")
end

			create assertion.make(yyvs12.item (yyvsp12), Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp12 := yyvsp12 -1
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
--|#line 603 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 603")
end

			raise_error
			report_error("illegal invariant expression at identifier " + yyvs2.item (yyvsp2))
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 55 then
--|#line 613 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 613")
end

			yyval12 := yyvs12.item (yyvsp12)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 56 then
--|#line 617 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 617")
end

			yyval12 := yyvs12.item (yyvsp12)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 57 then
--|#line 623 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 623")
end

			debug("ADL_invariant")
				io.put_string(indent + "Exists " + yyvs8.item (yyvsp8).as_string + "%N") 
			end
			create expr_unary_operator.make(create {OPERATOR_KIND}.make(op_exists))
			create expr_leaf.make_archetype_definition_ref(yyvs8.item (yyvsp8).as_string)
			expr_unary_operator.set_operand(expr_leaf)
			yyval12 := expr_unary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp12 := yyvsp12 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp8 := yyvsp8 -1
	if yyvsp12 >= yyvsc12 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs12")
		end
		yyvsc12 := yyvsc12 + yyInitial_yyvs_size
		yyvs12 := yyspecial_routines12.aliased_resized_area (yyvs12, yyvsc12)
	end
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 58 then
--|#line 633 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 633")
end

			raise_error
			report_error("expecting absolute path")
			abort
		
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
when 59 then
--|#line 639 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 639")
end

			debug("ADL_invariant")
				io.put_string(indent + "Archetype feature matches {" + yyvs11.item (yyvsp11).as_string + "}%N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_matches))
			expr_binary_operator.set_left_operand(create {EXPR_LEAF}.make_archetype_ref(yyvs8.item (yyvsp8).as_string))
			expr_binary_operator.set_right_operand(create {EXPR_LEAF}.make_constraint(yyvs11.item (yyvsp11)))
			yyval12 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp12 := yyvsp12 + 1
	yyvsp8 := yyvsp8 -1
	yyvsp1 := yyvsp1 -3
	yyvsp11 := yyvsp11 -1
	if yyvsp12 >= yyvsc12 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs12")
		end
		yyvsc12 := yyvsc12 + yyInitial_yyvs_size
		yyvs12 := yyspecial_routines12.aliased_resized_area (yyvs12, yyvsc12)
	end
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 60 then
--|#line 649 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 649")
end

			debug("ADL_invariant")
				io.put_string(indent + "NOT bool_leaf %N") 
			end
			create expr_unary_operator.make(create {OPERATOR_KIND}.make(op_not))
			expr_unary_operator.set_operand(yyvs12.item (yyvsp12))
			yyval12 := expr_unary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 61 then
--|#line 658 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 658")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_expr = arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_eq))
			expr_binary_operator.set_left_operand(yyvs12.item (yyvsp12 - 1))
			expr_binary_operator.set_right_operand(yyvs12.item (yyvsp12))
			yyval12 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp12 := yyvsp12 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 62 then
--|#line 668 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 668")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_expr != arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_ne))
			expr_binary_operator.set_left_operand(yyvs12.item (yyvsp12 - 1))
			expr_binary_operator.set_right_operand(yyvs12.item (yyvsp12))
			yyval12 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp12 := yyvsp12 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 63 then
--|#line 678 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 678")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_expr < arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_lt))
			expr_binary_operator.set_left_operand(yyvs12.item (yyvsp12 - 1))
			expr_binary_operator.set_right_operand(yyvs12.item (yyvsp12))
			yyval12 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp12 := yyvsp12 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 64 then
--|#line 688 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 688")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_expr > arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_gt))
			expr_binary_operator.set_left_operand(yyvs12.item (yyvsp12 - 1))
			expr_binary_operator.set_right_operand(yyvs12.item (yyvsp12))
			yyval12 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp12 := yyvsp12 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 65 then
--|#line 698 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 698")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_expr <= arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_le))
			expr_binary_operator.set_left_operand(yyvs12.item (yyvsp12 - 1))
			expr_binary_operator.set_right_operand(yyvs12.item (yyvsp12))
			yyval12 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp12 := yyvsp12 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 66 then
--|#line 708 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 708")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_expr >= arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_ge))
			expr_binary_operator.set_left_operand(yyvs12.item (yyvsp12 - 1))
			expr_binary_operator.set_right_operand(yyvs12.item (yyvsp12))
			yyval12 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp12 := yyvsp12 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 67 then
--|#line 718 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 718")
end

			debug("ADL_invariant")
				io.put_string(indent + "bool_expr AND bool_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_and))
			expr_binary_operator.set_left_operand(yyvs12.item (yyvsp12 - 1))
			expr_binary_operator.set_right_operand(yyvs12.item (yyvsp12))
			yyval12 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp12 := yyvsp12 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 68 then
--|#line 728 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 728")
end

			debug("ADL_invariant")
				io.put_string(indent + "bool_expr OR bool_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_or))
			expr_binary_operator.set_left_operand(yyvs12.item (yyvsp12 - 1))
			expr_binary_operator.set_right_operand(yyvs12.item (yyvsp12))
			yyval12 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp12 := yyvsp12 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 69 then
--|#line 738 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 738")
end

			debug("ADL_invariant")
				io.put_string(indent + "bool_expr XOR bool_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_xor))
			expr_binary_operator.set_left_operand(yyvs12.item (yyvsp12 - 1))
			expr_binary_operator.set_right_operand(yyvs12.item (yyvsp12))
			yyval12 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp12 := yyvsp12 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 70 then
--|#line 748 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 748")
end

			debug("ADL_invariant")
				io.put_string(indent + "bool_expr IMPLIES bool_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_implies))
			expr_binary_operator.set_left_operand(yyvs12.item (yyvsp12 - 1))
			expr_binary_operator.set_right_operand(yyvs12.item (yyvsp12))
			yyval12 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp12 := yyvsp12 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 71 then
--|#line 760 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 760")
end

			yyval12 := yyvs12.item (yyvsp12)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 72 then
--|#line 764 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 764")
end

			create expr_leaf.make_boolean(True)
			yyval12 := expr_leaf
		
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
when 73 then
--|#line 769 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 769")
end

			create expr_leaf.make_boolean(False)
			yyval12 := expr_leaf
		
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
when 74 then
--|#line 776 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 776")
end

			yyval12 := yyvs12.item (yyvsp12)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 75 then
--|#line 780 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 780")
end

			yyval12 := yyvs12.item (yyvsp12)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 76 then
--|#line 786 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 786")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_expr + arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_plus))
			expr_binary_operator.set_left_operand(yyvs12.item (yyvsp12 - 1))
			expr_binary_operator.set_right_operand(yyvs12.item (yyvsp12))
			yyval12 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp12 := yyvsp12 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 77 then
--|#line 796 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 796")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_expr - arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_minus))
			expr_binary_operator.set_left_operand(yyvs12.item (yyvsp12 - 1))
			expr_binary_operator.set_right_operand(yyvs12.item (yyvsp12))
			yyval12 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp12 := yyvsp12 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 78 then
--|#line 806 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 806")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_expr * arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_multiply))
			expr_binary_operator.set_left_operand(yyvs12.item (yyvsp12 - 1))
			expr_binary_operator.set_right_operand(yyvs12.item (yyvsp12))
			yyval12 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp12 := yyvsp12 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 79 then
--|#line 816 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 816")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_expr / arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_divide))
			expr_binary_operator.set_left_operand(yyvs12.item (yyvsp12 - 1))
			expr_binary_operator.set_right_operand(yyvs12.item (yyvsp12))
			yyval12 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp12 := yyvsp12 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 80 then
--|#line 826 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 826")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_expr ^ arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_exp))
			expr_binary_operator.set_left_operand(yyvs12.item (yyvsp12 - 1))
			expr_binary_operator.set_right_operand(yyvs12.item (yyvsp12))
			yyval12 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp12 := yyvsp12 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 81 then
--|#line 838 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 838")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_leaf - (expr) %N") 
			end
			yyval12 := yyvs12.item (yyvsp12)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 82 then
--|#line 845 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 845")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_leaf - integer: " + yyvs3.item (yyvsp3).out + "%N") 
			end
			create expr_leaf.make_integer(yyvs3.item (yyvsp3))
			yyval12 := expr_leaf
		
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
when 83 then
--|#line 853 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 853")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_leaf - real: " + yyvs4.item (yyvsp4).out + "%N") 
			end
			create expr_leaf.make_real(yyvs4.item (yyvsp4))
			yyval12 := expr_leaf
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp12 := yyvsp12 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp12 >= yyvsc12 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs12")
		end
		yyvsc12 := yyvsc12 + yyInitial_yyvs_size
		yyvs12 := yyspecial_routines12.aliased_resized_area (yyvs12, yyvsc12)
	end
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 84 then
--|#line 861 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 861")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_leaf - path: " + yyvs8.item (yyvsp8).as_string + "%N") 
			end
			create expr_leaf.make_archetype_definition_ref(yyvs8.item (yyvsp8).as_string)
			yyval12 := expr_leaf
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp12 := yyvsp12 + 1
	yyvsp8 := yyvsp8 -1
	if yyvsp12 >= yyvsc12 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs12")
		end
		yyvsc12 := yyvsc12 + yyInitial_yyvs_size
		yyvs12 := yyspecial_routines12.aliased_resized_area (yyvs12, yyvsc12)
	end
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 85 then
--|#line 876 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 876")
end

			create yyval8.make_root
			debug("OG_PATH_parse")
				io.put_string("....absolute_path (root); %N")
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp8 := yyvsp8 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp8 >= yyvsc8 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs8")
		end
		yyvsc8 := yyvsc8 + yyInitial_yyvs_size
		yyvs8 := yyspecial_routines8.aliased_resized_area (yyvs8, yyvsc8)
	end
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 86 then
--|#line 883 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 883")
end

			yyval8 := yyvs8.item (yyvsp8)
			yyval8.set_absolute
			debug("OG_PATH_parse")
				io.put_string("....absolute_path; %N")
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 87 then
--|#line 891 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 891")
end

			yyval8 := yyvs8.item (yyvsp8 - 1)
			yyval8.append_path(yyvs8.item (yyvsp8))
			debug("OG_PATH_parse")
				io.put_string("....absolute_path (appended relative path); %N")
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp8 := yyvsp8 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 88 then
--|#line 901 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 901")
end

			create yyval8.make_relative(yyvs21.item (yyvsp21))
		
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
when 89 then
--|#line 905 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 905")
end

			yyval8 := yyvs8.item (yyvsp8)
			yyval8.append_segment(yyvs21.item (yyvsp21))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp21 := yyvsp21 -1
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 90 then
--|#line 912 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 912")
end

			create yyval21.make_with_object_id(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
			debug("OG_PATH_parse")
				io.put_string("...path_segment: " + yyvs2.item (yyvsp2 - 1) + "[" + yyvs2.item (yyvsp2) + "]%N")
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp21 := yyvsp21 + 1
	yyvsp2 := yyvsp2 -2
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
--|#line 919 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 919")
end

			create yyval21.make(yyvs2.item (yyvsp2))
			debug("OG_PATH_parse")
				io.put_string("...path_segment: " + yyvs2.item (yyvsp2) + "%N")
			end
		
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
when 92 then
--|#line 935 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 935")
end

			int_interval := default_existence
			yyval9 := int_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp9 := yyvsp9 + 1
	if yyvsp9 >= yyvsc9 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs9")
		end
		yyvsc9 := yyvsc9 + yyInitial_yyvs_size
		yyvs9 := yyspecial_routines9.aliased_resized_area (yyvs9, yyvsc9)
	end
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
when 93 then
--|#line 940 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 940")
end

			yyval9 := int_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp9 := yyvsp9 + 1
	yyvsp1 := yyvsp1 -5
	if yyvsp9 >= yyvsc9 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs9")
		end
		yyvsc9 := yyvsc9 + yyInitial_yyvs_size
		yyvs9 := yyspecial_routines9.aliased_resized_area (yyvs9, yyvsc9)
	end
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
when 94 then
--|#line 946 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 946")
end

			if yyvs3.item (yyvsp3) = 0 then
				create int_interval.make_point(0)
			elseif yyvs3.item (yyvsp3) = 1 then
				create int_interval.make_point(1)
			else
				raise_error
				report_error("In existence; expecting 0 or 1")
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 95 then
--|#line 958 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 958")
end

			if yyvs3.item (yyvsp3 - 1) = 0 then
				if yyvs3.item (yyvsp3) = 0 then
					create int_interval.make_point(0)
				elseif yyvs3.item (yyvsp3) = 1 then
					create int_interval.make_bounded(0, 1, True, True)
				else
					raise_error
					report_error("In existence; upper value must be 0 or 1")
					abort
				end
			elseif yyvs3.item (yyvsp3 - 1) = 1 then
				if yyvs3.item (yyvsp3) = 1 then
					create int_interval.make_point(1)
				else
					raise_error
					report_error("In existence; upper value must be 1")
					abort
				end
			else
				raise_error
				report_error("In existence; expecting 0..0, 0..1, or 1..1")
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp3 := yyvsp3 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 96 then
--|#line 986 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 986")
end

			yyval13 := cardinality
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp13 := yyvsp13 + 1
	yyvsp1 := yyvsp1 -5
	if yyvsp13 >= yyvsc13 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs13")
		end
		yyvsc13 := yyvsc13 + yyInitial_yyvs_size
		yyvs13 := yyspecial_routines13.aliased_resized_area (yyvs13, yyvsc13)
	end
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 97 then
--|#line 992 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 992")
end

			create cardinality.make(int_interval)
		
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
when 98 then
--|#line 996 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 996")
end

			create cardinality.make(int_interval)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp9 := yyvsp9 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 99 then
--|#line 1000 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1000")
end

			create cardinality.make(int_interval)
			cardinality.set_unordered
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp9 := yyvsp9 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 100 then
--|#line 1005 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1005")
end

			create cardinality.make(int_interval)
			cardinality.set_unique
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp9 := yyvsp9 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 101 then
--|#line 1010 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1010")
end

			create cardinality.make(int_interval)
			cardinality.set_unique
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp9 := yyvsp9 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 102 then
--|#line 1015 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1015")
end

			create cardinality.make(int_interval)
			cardinality.set_unique
			cardinality.set_unordered
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp9 := yyvsp9 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 103 then
--|#line 1021 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1021")
end

			create cardinality.make(int_interval)
			cardinality.set_unique
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp9 := yyvsp9 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 104 then
--|#line 1026 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1026")
end

			create cardinality.make(int_interval)
			cardinality.set_unique
			cardinality.set_unordered
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp9 := yyvsp9 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 105 then
--|#line 1034 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1034")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 106 then
--|#line 1038 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1038")
end

			cardinality_limit_pos_infinity := True
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp3 := yyvsp3 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp3 >= yyvsc3 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs3")
		end
		yyvsc3 := yyvsc3 + yyInitial_yyvs_size
		yyvs3 := yyspecial_routines3.aliased_resized_area (yyvs3, yyvsc3)
	end
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 107 then
--|#line 1044 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1044")
end

			int_interval := default_occurrences
			yyval9 := int_interval
			c_occurrences_default := True
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp9 := yyvsp9 + 1
	if yyvsp9 >= yyvsc9 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs9")
		end
		yyvsc9 := yyvsc9 + yyInitial_yyvs_size
		yyvs9 := yyspecial_routines9.aliased_resized_area (yyvs9, yyvsc9)
	end
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
when 108 then
--|#line 1050 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1050")
end

			yyval9 := yyvs9.item (yyvsp9)
			c_occurrences_default := False
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
when 109 then
--|#line 1055 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1055")
end

			raise_error
			report_error("expecting an 'occurrences expression', e.g. 'occurrences matches {n..m}'")
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp9 := yyvsp9 + 1
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
when 110 then
--|#line 1063 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1063")
end

			if not cardinality_limit_pos_infinity then
				create int_interval.make_point(yyvs3.item (yyvsp3))
			else
				create int_interval.make_upper_unbounded(0, True)
				cardinality_limit_pos_infinity := False
			end
			yyval9 := int_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp9 := yyvsp9 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp9 >= yyvsc9 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs9")
		end
		yyvsc9 := yyvsc9 + yyInitial_yyvs_size
		yyvs9 := yyspecial_routines9.aliased_resized_area (yyvs9, yyvsc9)
	end
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
when 111 then
--|#line 1073 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1073")
end

			if cardinality_limit_pos_infinity then
				create int_interval.make_upper_unbounded(yyvs3.item (yyvsp3 - 1), True)
				cardinality_limit_pos_infinity := False
			else
				create int_interval.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), True, True)
			end
			yyval9 := int_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp9 := yyvsp9 + 1
	yyvsp3 := yyvsp3 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp9 >= yyvsc9 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs9")
		end
		yyvsc9 := yyvsc9 + yyInitial_yyvs_size
		yyvs9 := yyspecial_routines9.aliased_resized_area (yyvs9, yyvsc9)
	end
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
when 112 then
--|#line 1087 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1087")
end

			create int_list.make(0)
			int_list.extend(yyvs3.item (yyvsp3))
			create c_integer.make_list(int_list)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 113 then
--|#line 1093 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1093")
end

			create c_integer.make_list(yyvs23.item (yyvsp23))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp23 := yyvsp23 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 114 then
--|#line 1097 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1097")
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

			create c_integer.make_interval(int_interval)
		
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
when 115 then
--|#line 1113 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1113")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 116 then
--|#line 1114 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1114")
end

			if c_integer.valid_value(yyvs3.item (yyvsp3)) then
				c_integer.set_assumed_value(yyvs3.item (yyvsp3))
			else
				raise_error
				report_error("assumed value " + yyvs3.item (yyvsp3).out + " not inside constraint")
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 117 then
--|#line 1124 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1124")
end

			raise_error
			report_error("invalid assumed value; must be an integer")
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 118 then
--|#line 1132 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1132")
end

			create real_list.make(0)
			real_list.extend(yyvs4.item (yyvsp4))
			create c_real.make_list(real_list)
		
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
when 119 then
--|#line 1138 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1138")
end

			create c_real.make_list(yyvs24.item (yyvsp24))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp24 := yyvsp24 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 120 then
--|#line 1142 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1142")
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

			create c_real.make_interval(rl_interval)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp32 := yyvsp32 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 121 then
--|#line 1158 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1158")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 122 then
--|#line 1159 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1159")
end

			if c_real.valid_value(yyvs4.item (yyvsp4)) then
				c_real.set_assumed_value(yyvs4.item (yyvsp4))
			else
				raise_error
				report_error("assumed value " + yyvs4.item (yyvsp4).out + " not inside constraint")
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 123 then
--|#line 1169 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1169")
end

			raise_error
			report_error("invalid assumed value; must be a real number")
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 124 then
--|#line 1177 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1177")
end

			if valid_iso8601_date_constraint_pattern(yyvs2.item (yyvsp2)) then
				create c_date.make_from_pattern(yyvs2.item (yyvsp2))
			else
				create str.make(0)
				from 
					valid_date_constraint_patterns.start
				until
					valid_date_constraint_patterns.off
				loop
					if not valid_date_constraint_patterns.isfirst then
						str.append(", ")
					end
					str.append(valid_date_constraint_patterns.item)
					valid_date_constraint_patterns.forth
				end

				raise_error
				report_error("invalid date constraint pattern; allowed patterns: " + str)
				abort
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
when 125 then
--|#line 1200 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1200")
end

			create date_interval.make_point(yyvs15.item (yyvsp15))
			create c_date.make_interval(date_interval)
		
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
when 126 then
--|#line 1205 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1205")
end

			create c_date.make_interval(date_interval)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp34 := yyvsp34 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 127 then
--|#line 1211 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1211")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 128 then
--|#line 1212 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1212")
end

			if c_date.valid_value(yyvs15.item (yyvsp15)) then
				c_date.set_assumed_value(yyvs15.item (yyvsp15))
			else
				raise_error
				report_error("assumed value " + yyvs15.item (yyvsp15).out + " not inside constraint")
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp15 := yyvsp15 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 129 then
--|#line 1222 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1222")
end

			raise_error
			report_error("invalid assumed value; must be valid ISO8601 date")
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 130 then
--|#line 1230 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1230")
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

				raise_error
				report_error("invalid time constraint pattern; allowed patterns: " + str)
				abort
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
when 131 then
--|#line 1253 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1253")
end

			create time_interval.make_point(yyvs17.item (yyvsp17))
			create c_time.make_interval(time_interval)
		
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
when 132 then
--|#line 1258 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1258")
end

			create c_time.make_interval(time_interval)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp33 := yyvsp33 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 133 then
--|#line 1264 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1264")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 134 then
--|#line 1265 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1265")
end

			if c_time.valid_value(yyvs17.item (yyvsp17)) then
				c_time.set_assumed_value(yyvs17.item (yyvsp17))
			else
				raise_error
				report_error("assumed value " + yyvs17.item (yyvsp17).out + " not inside constraint")
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp17 := yyvsp17 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 135 then
--|#line 1275 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1275")
end

			raise_error
			report_error("invalid assumed value; must be valid ISO8601 time")
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 136 then
--|#line 1283 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1283")
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

				raise_error
				report_error("invalid date/time constraint pattern; allowed patterns: " + str)
				abort
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
when 137 then
--|#line 1306 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1306")
end

			create date_time_interval.make_point(yyvs16.item (yyvsp16))
			create c_date_time.make_interval(date_time_interval)
		
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
when 138 then
--|#line 1311 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1311")
end

			create c_date_time.make_interval(date_time_interval)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp35 := yyvsp35 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 139 then
--|#line 1317 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1317")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 140 then
--|#line 1318 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1318")
end

			if c_date_time.valid_value(yyvs16.item (yyvsp16)) then
				c_date_time.set_assumed_value(yyvs16.item (yyvsp16))
			else
				raise_error
				report_error("assumed value " + yyvs16.item (yyvsp16).out + " not inside constraint")
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp16 := yyvsp16 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 141 then
--|#line 1328 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1328")
end

			raise_error
			report_error("invalid assumed value; must be valid ISO8601 date_time")
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 142 then
--|#line 1336 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1336")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 143 then
--|#line 1337 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1337")
end

			create c_duration.make_pattern_with_interval (c_duration.pattern, duration_interval)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp36 := yyvsp36 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 144 then
--|#line 1341 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1341")
end

			create duration_interval.make_point(yyvs18.item (yyvsp18))
			create c_duration.make_interval(duration_interval)
		
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
when 145 then
--|#line 1346 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1346")
end

			create c_duration.make_interval(duration_interval)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp36 := yyvsp36 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 146 then
--|#line 1352 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1352")
end

			if valid_iso8601_duration_constraint_pattern (yyvs2.item (yyvsp2)) then
				create c_duration.make_from_pattern (yyvs2.item (yyvsp2))
			else
				raise_error
				report_error ("invalid duration constraint pattern; legal pattern: -P[Y|y][M|m][W|w][D|d][T[H|h][M|m][S|s]] or -P[W|w]")
				abort
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
when 147 then
--|#line 1364 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1364")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 148 then
--|#line 1365 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1365")
end

			if c_duration.valid_value(yyvs18.item (yyvsp18)) then
				c_duration.set_assumed_value(yyvs18.item (yyvsp18))
			else
				raise_error
				report_error("assumed value " + yyvs18.item (yyvsp18).out + " not inside constraint")
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp18 := yyvsp18 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 149 then
--|#line 1375 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1375")
end

			raise_error
			report_error("invalid assumed value; must be valid ISO8601 duration")
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 150 then
--|#line 1383 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1383")
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
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 151 then
--|#line 1390 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1390")
end

			create c_string.make_from_string_list(yyvs22.item (yyvsp22))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp22 := yyvsp22 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 152 then
--|#line 1394 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1394")
end

			create c_string.make_from_string_list(yyvs22.item (yyvsp22))
			c_string.set_open
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp22 := yyvsp22 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 153 then
--|#line 1399 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1399")
end

			create c_string.make_from_regexp(yyvs2.item (yyvsp2).substring (2, yyvs2.item (yyvsp2).count - 1), yyvs2.item (yyvsp2).item(1) = '/')
			if c_string.regexp.is_equal(c_string.regexp_compile_error) then
				raise_error
				report_error("Regular expression compile error " + yyvs2.item (yyvsp2) + " is not a valid regular expression")
				abort
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
when 154 then
--|#line 1410 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1410")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 155 then
--|#line 1411 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1411")
end

			if c_string.valid_value(yyvs2.item (yyvsp2)) then
				c_string.set_assumed_value(yyvs2.item (yyvsp2))
			else
				raise_error
				report_error("assumed value " + yyvs2.item (yyvsp2).out + " not inside constraint")
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 156 then
--|#line 1421 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1421")
end

			raise_error
			report_error("invalid assumed value; must be a string")
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 157 then
--|#line 1429 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1429")
end

			create c_boolean.make_true
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 158 then
--|#line 1433 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1433")
end

			create c_boolean.make_false
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 159 then
--|#line 1437 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1437")
end

			create c_boolean.make_true_false
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 160 then
--|#line 1441 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1441")
end

			create c_boolean.make_true_false
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 161 then
--|#line 1447 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1447")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 162 then
--|#line 1448 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1448")
end

			if c_boolean.valid_value(yyvs14.item (yyvsp14)) then
				c_boolean.set_assumed_value(yyvs14.item (yyvsp14))
			else
				raise_error
				report_error("assumed value " + yyvs14.item (yyvsp14).out + " not inside constraint")
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp14 := yyvsp14 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 163 then
--|#line 1458 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1458")
end

			raise_error
			report_error("invalid assumed value; must be %"True%" or %"False%"")
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 164 then
--|#line 1466 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1466")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 165 then
--|#line 1467 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1467")
end

			if scale_node.has_item (yyvs3.item (yyvsp3)) then
				scale_node.set_assumed_value_from_real (yyvs3.item (yyvsp3))
			else
				raise_error
				report_error ("invalid assumed value " + yyvs3.item (yyvsp3).out + " not in list")
				abort
			end
 		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 166 then
--|#line 1477 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1477")
end

			if scale_node.has_item (yyvs4.item (yyvsp4)) then
				scale_node.set_assumed_value_from_real (yyvs4.item (yyvsp4))
			else
				raise_error
				report_error ("invalid assumed value " + yyvs4.item (yyvsp4).out + " not in list")
				abort
			end
 		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 167 then
--|#line 1487 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1487")
end

 			raise_error
 			report_error ("invalid assumed value; must be an ordinal integer or a scale real value")
 			abort
 		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 168 then
--|#line 1495 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1495")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 169 then
--|#line 1496 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1496")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 170 then
--|#line 1499 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1499")
end

			if scale_node = Void then
				create scale_node.make
			end

			create a_code_phrase.make_from_string (yyvs2.item (yyvsp2))

			if scale_node.has_code_phrase (a_code_phrase) then
				raise_error
				report_error ("invalid ordinal or scale constraint: duplicated code term " + yyvs2.item (yyvsp2))
				abort
			else
				create a_scale.make (yyvs3.item (yyvsp3), a_code_phrase, last_numeric_text)
				scale_node.add_item (a_scale)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp3 := yyvsp3 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 171 then
--|#line 1516 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1516")
end

			if scale_node = Void then
				create scale_node.make
			end

			create a_code_phrase.make_from_string (yyvs2.item (yyvsp2))

			if scale_node.has_code_phrase (a_code_phrase) then
				raise_error
				report_error ("invalid ordinal or scale constraint: duplicated code term " + yyvs2.item (yyvsp2))
				abort
			else
				create a_scale.make (yyvs4.item (yyvsp4), a_code_phrase, last_numeric_text)
				scale_node.add_item (a_scale)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp4 := yyvsp4 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 172 then
--|#line 1535 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1535")
end

			create c_code_phrase_obj

			if c_code_phrase_obj.valid_pattern (yyvs2.item (yyvsp2)) then
				c_code_phrase_obj.make_from_pattern (yyvs2.item (yyvsp2))
			else
				raise_error
				report_error ("invalid term code constraint: " + c_code_phrase_obj.fail_reason)
				abort
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
when 173 then
--|#line 1547 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1547")
end

			create c_code_phrase_obj.make_from_pattern(yyvs2.item (yyvsp2))
		
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
when 174 then
--|#line 1553 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1553")
end

			create constraint_ref.make(yyvs2.item (yyvsp2))
		
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
when 175 then
--|#line 1559 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1559")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 176 then
--|#line 1563 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1563")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 177 then
--|#line 1575 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1575")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 178 then
--|#line 1579 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1579")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 179 then
--|#line 1583 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1583")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 180 then
--|#line 1587 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1587")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 181 then
--|#line 1593 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1593")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 182 then
--|#line 1599 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1599")
end

			create yyval22.make(0)
			yyval22.extend(yyvs2.item (yyvsp2 - 1))
			yyval22.extend(yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp22 := yyvsp22 + 1
	yyvsp2 := yyvsp2 -2
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
when 183 then
--|#line 1605 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1605")
end

			yyvs22.item (yyvsp22).extend(yyvs2.item (yyvsp2))
			yyval22 := yyvs22.item (yyvsp22)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
when 184 then
--|#line 1610 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1610")
end

			create yyval22.make(0)
			yyval22.extend(yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp22 := yyvsp22 + 1
	yyvsp2 := yyvsp2 -1
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
when 185 then
--|#line 1617 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1617")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 186 then
--|#line 1620 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1620")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 187 then
--|#line 1623 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1623")
end

			yyval3 := - yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 188 then
--|#line 1628 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1628")
end

			create yyval23.make(0)
			yyval23.extend(yyvs3.item (yyvsp3 - 1))
			yyval23.extend(yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp23 := yyvsp23 + 1
	yyvsp3 := yyvsp3 -2
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
when 189 then
--|#line 1634 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1634")
end

			yyvs23.item (yyvsp23).extend(yyvs3.item (yyvsp3))
			yyval23 := yyvs23.item (yyvsp23)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyspecial_routines23.force (yyvs23, yyval23, yyvsp23)
end
when 190 then
--|#line 1639 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1639")
end

			create yyval23.make(0)
			yyval23.extend(yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp23 := yyvsp23 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp23 >= yyvsc23 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs23")
		end
		yyvsc23 := yyvsc23 + yyInitial_yyvs_size
		yyvs23 := yyspecial_routines23.aliased_resized_area (yyvs23, yyvsc23)
	end
	yyspecial_routines23.force (yyvs23, yyval23, yyvsp23)
end
when 191 then
--|#line 1646 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1646")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create integer_interval.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), True, True)
				yyval9 := integer_interval
			else
				raise_error
				report_error("Invalid interval: " + yyvs3.item (yyvsp3 - 1).out + " must be <= " + yyvs3.item (yyvsp3).out)
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp9 := yyvsp9 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -2
	if yyvsp9 >= yyvsc9 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs9")
		end
		yyvsc9 := yyvsc9 + yyInitial_yyvs_size
		yyvs9 := yyspecial_routines9.aliased_resized_area (yyvs9, yyvsc9)
	end
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
when 192 then
--|#line 1657 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1657")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create integer_interval.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), False, True)
				yyval9 := integer_interval
			else
				raise_error
				report_error("Invalid interval: " + yyvs3.item (yyvsp3 - 1).out + " must be <= " + yyvs3.item (yyvsp3).out)
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp9 := yyvsp9 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp3 := yyvsp3 -2
	if yyvsp9 >= yyvsc9 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs9")
		end
		yyvsc9 := yyvsc9 + yyInitial_yyvs_size
		yyvs9 := yyspecial_routines9.aliased_resized_area (yyvs9, yyvsc9)
	end
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
when 193 then
--|#line 1668 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1668")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create integer_interval.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), True, False)
				yyval9 := integer_interval
			else
				raise_error
				report_error("Invalid interval: " + yyvs3.item (yyvsp3 - 1).out + " must be <= " + yyvs3.item (yyvsp3).out)
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp9 := yyvsp9 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp3 := yyvsp3 -2
	if yyvsp9 >= yyvsc9 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs9")
		end
		yyvsc9 := yyvsc9 + yyInitial_yyvs_size
		yyvs9 := yyspecial_routines9.aliased_resized_area (yyvs9, yyvsc9)
	end
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
when 194 then
--|#line 1679 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1679")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create integer_interval.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), False, False)
				yyval9 := integer_interval
			else
				raise_error
				report_error("Invalid interval: " + yyvs3.item (yyvsp3 - 1).out + " must be <= " + yyvs3.item (yyvsp3).out)
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp9 := yyvsp9 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp3 := yyvsp3 -2
	if yyvsp9 >= yyvsc9 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs9")
		end
		yyvsc9 := yyvsc9 + yyInitial_yyvs_size
		yyvs9 := yyspecial_routines9.aliased_resized_area (yyvs9, yyvsc9)
	end
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
when 195 then
--|#line 1690 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1690")
end

			create integer_interval.make_lower_unbounded(yyvs3.item (yyvsp3), False)
			yyval9 := integer_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp9 := yyvsp9 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp9 >= yyvsc9 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs9")
		end
		yyvsc9 := yyvsc9 + yyInitial_yyvs_size
		yyvs9 := yyspecial_routines9.aliased_resized_area (yyvs9, yyvsc9)
	end
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
when 196 then
--|#line 1695 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1695")
end

			create integer_interval.make_lower_unbounded(yyvs3.item (yyvsp3), True)
			yyval9 := integer_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp9 := yyvsp9 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp9 >= yyvsc9 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs9")
		end
		yyvsc9 := yyvsc9 + yyInitial_yyvs_size
		yyvs9 := yyspecial_routines9.aliased_resized_area (yyvs9, yyvsc9)
	end
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
when 197 then
--|#line 1700 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1700")
end

			create integer_interval.make_upper_unbounded(yyvs3.item (yyvsp3), False)
			yyval9 := integer_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp9 := yyvsp9 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp9 >= yyvsc9 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs9")
		end
		yyvsc9 := yyvsc9 + yyInitial_yyvs_size
		yyvs9 := yyspecial_routines9.aliased_resized_area (yyvs9, yyvsc9)
	end
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
when 198 then
--|#line 1705 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1705")
end

			create integer_interval.make_upper_unbounded(yyvs3.item (yyvsp3), True)
			yyval9 := integer_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp9 := yyvsp9 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp9 >= yyvsc9 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs9")
		end
		yyvsc9 := yyvsc9 + yyInitial_yyvs_size
		yyvs9 := yyspecial_routines9.aliased_resized_area (yyvs9, yyvsc9)
	end
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
when 199 then
--|#line 1710 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1710")
end

			create integer_interval.make_point(yyvs3.item (yyvsp3))
			yyval9 := integer_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp9 := yyvsp9 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp3 := yyvsp3 -1
	if yyvsp9 >= yyvsc9 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs9")
		end
		yyvsc9 := yyvsc9 + yyInitial_yyvs_size
		yyvs9 := yyspecial_routines9.aliased_resized_area (yyvs9, yyvsc9)
	end
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
when 200 then
--|#line 1717 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1717")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 201 then
--|#line 1721 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1721")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 202 then
--|#line 1725 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1725")
end

			yyval4 := - yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 203 then
--|#line 1731 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1731")
end

			create yyval24.make(0)
			yyval24.extend(yyvs4.item (yyvsp4 - 1))
			yyval24.extend(yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp24 := yyvsp24 + 1
	yyvsp4 := yyvsp4 -2
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
when 204 then
--|#line 1737 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1737")
end

			yyvs24.item (yyvsp24).extend(yyvs4.item (yyvsp4))
			yyval24 := yyvs24.item (yyvsp24)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyspecial_routines24.force (yyvs24, yyval24, yyvsp24)
end
when 205 then
--|#line 1742 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1742")
end

			create yyval24.make(0)
			yyval24.extend(yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp24 := yyvsp24 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp24 >= yyvsc24 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs24")
		end
		yyvsc24 := yyvsc24 + yyInitial_yyvs_size
		yyvs24 := yyspecial_routines24.aliased_resized_area (yyvs24, yyvsc24)
	end
	yyspecial_routines24.force (yyvs24, yyval24, yyvsp24)
end
when 206 then
--|#line 1749 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1749")
end

			if yyvs4.item (yyvsp4 - 1) <= yyvs4.item (yyvsp4) then
				create real_interval.make_bounded(yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4), True, True)
				yyval32 := real_interval
			else
				raise_error
				report_error("Invalid interval: " + yyvs4.item (yyvsp4 - 1).out + " must be <= " + yyvs4.item (yyvsp4).out)
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp4 := yyvsp4 -2
	if yyvsp32 >= yyvsc32 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs32")
		end
		yyvsc32 := yyvsc32 + yyInitial_yyvs_size
		yyvs32 := yyspecial_routines32.aliased_resized_area (yyvs32, yyvsc32)
	end
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 207 then
--|#line 1760 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1760")
end

			if yyvs4.item (yyvsp4 - 1) <= yyvs4.item (yyvsp4) then
				create real_interval.make_bounded(yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4), False, True)
				yyval32 := real_interval
			else
				raise_error
				report_error("Invalid interval: " + yyvs4.item (yyvsp4 - 1).out + " must be <= " + yyvs4.item (yyvsp4).out)
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp4 := yyvsp4 -2
	if yyvsp32 >= yyvsc32 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs32")
		end
		yyvsc32 := yyvsc32 + yyInitial_yyvs_size
		yyvs32 := yyspecial_routines32.aliased_resized_area (yyvs32, yyvsc32)
	end
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 208 then
--|#line 1771 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1771")
end

			if yyvs4.item (yyvsp4 - 1) <= yyvs4.item (yyvsp4) then
				create real_interval.make_bounded(yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4), True, False)
				yyval32 := real_interval
			else
				raise_error
				report_error("Invalid interval: " + yyvs4.item (yyvsp4 - 1).out + " must be <= " + yyvs4.item (yyvsp4).out)
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp4 := yyvsp4 -2
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
--|#line 1782 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1782")
end

			if yyvs4.item (yyvsp4 - 1) <= yyvs4.item (yyvsp4) then
				create real_interval.make_bounded(yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4), False, False)
				yyval32 := real_interval
			else
				raise_error
				report_error("Invalid interval: " + yyvs4.item (yyvsp4 - 1).out + " must be <= " + yyvs4.item (yyvsp4).out)
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp4 := yyvsp4 -2
	if yyvsp32 >= yyvsc32 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs32")
		end
		yyvsc32 := yyvsc32 + yyInitial_yyvs_size
		yyvs32 := yyspecial_routines32.aliased_resized_area (yyvs32, yyvsc32)
	end
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 210 then
--|#line 1793 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1793")
end

			create real_interval.make_lower_unbounded(yyvs4.item (yyvsp4), False)
			yyval32 := real_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp4 := yyvsp4 -1
	if yyvsp32 >= yyvsc32 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs32")
		end
		yyvsc32 := yyvsc32 + yyInitial_yyvs_size
		yyvs32 := yyspecial_routines32.aliased_resized_area (yyvs32, yyvsc32)
	end
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 211 then
--|#line 1798 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1798")
end

			create real_interval.make_lower_unbounded(yyvs4.item (yyvsp4), True)
			yyval32 := real_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp4 := yyvsp4 -1
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
--|#line 1803 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1803")
end

			create real_interval.make_upper_unbounded(yyvs4.item (yyvsp4), False)
			yyval32 := real_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp4 := yyvsp4 -1
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
--|#line 1808 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1808")
end

			create real_interval.make_upper_unbounded(yyvs4.item (yyvsp4), True)
			yyval32 := real_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp4 := yyvsp4 -1
	if yyvsp32 >= yyvsc32 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs32")
		end
		yyvsc32 := yyvsc32 + yyInitial_yyvs_size
		yyvs32 := yyspecial_routines32.aliased_resized_area (yyvs32, yyvsc32)
	end
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 214 then
--|#line 1813 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1813")
end

			create real_interval.make_point(yyvs4.item (yyvsp4))
			yyval32 := real_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp4 := yyvsp4 -1
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
--|#line 1820 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1820")
end

			yyval14 := True
		
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
when 216 then
--|#line 1824 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1824")
end

			yyval14 := False
		
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
when 217 then
--|#line 1872 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1872")
end

			if valid_iso8601_date(yyvs2.item (yyvsp2)) then
				create yyval15.make_from_string(yyvs2.item (yyvsp2))
			else
				raise_error
				report_error("invalid ISO8601 date: " + yyvs2.item (yyvsp2))
				abort
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
when 218 then
--|#line 1902 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1902")
end

			if yyvs15.item (yyvsp15 - 1) <= yyvs15.item (yyvsp15) then
				create date_interval.make_bounded(yyvs15.item (yyvsp15 - 1), yyvs15.item (yyvsp15), True, True)
				yyval34 := date_interval
			else
				raise_error
				report_error("Invalid interval: " + yyvs15.item (yyvsp15 - 1).out + " must be <= " + yyvs15.item (yyvsp15).out)
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp15 := yyvsp15 -2
	if yyvsp34 >= yyvsc34 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs34")
		end
		yyvsc34 := yyvsc34 + yyInitial_yyvs_size
		yyvs34 := yyspecial_routines34.aliased_resized_area (yyvs34, yyvsc34)
	end
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 219 then
--|#line 1913 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1913")
end

			if yyvs15.item (yyvsp15 - 1) <= yyvs15.item (yyvsp15) then
				create date_interval.make_bounded(yyvs15.item (yyvsp15 - 1), yyvs15.item (yyvsp15), False, True)
				yyval34 := date_interval
			else
				raise_error
				report_error("Invalid interval: " + yyvs15.item (yyvsp15 - 1).out + " must be <= " + yyvs15.item (yyvsp15).out)
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp15 := yyvsp15 -2
	if yyvsp34 >= yyvsc34 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs34")
		end
		yyvsc34 := yyvsc34 + yyInitial_yyvs_size
		yyvs34 := yyspecial_routines34.aliased_resized_area (yyvs34, yyvsc34)
	end
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 220 then
--|#line 1924 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1924")
end

			if yyvs15.item (yyvsp15 - 1) <= yyvs15.item (yyvsp15) then
				create date_interval.make_bounded(yyvs15.item (yyvsp15 - 1), yyvs15.item (yyvsp15), True, False)
				yyval34 := date_interval
			else
				raise_error
				report_error("Invalid interval: " + yyvs15.item (yyvsp15 - 1).out + " must be <= " + yyvs15.item (yyvsp15).out)
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp15 := yyvsp15 -2
	if yyvsp34 >= yyvsc34 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs34")
		end
		yyvsc34 := yyvsc34 + yyInitial_yyvs_size
		yyvs34 := yyspecial_routines34.aliased_resized_area (yyvs34, yyvsc34)
	end
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 221 then
--|#line 1935 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1935")
end

			if yyvs15.item (yyvsp15 - 1) <= yyvs15.item (yyvsp15) then
				create date_interval.make_bounded(yyvs15.item (yyvsp15 - 1), yyvs15.item (yyvsp15), False, False)
				yyval34 := date_interval
			else
				raise_error
				report_error("Invalid interval: " + yyvs15.item (yyvsp15 - 1).out + " must be <= " + yyvs15.item (yyvsp15).out)
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp15 := yyvsp15 -2
	if yyvsp34 >= yyvsc34 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs34")
		end
		yyvsc34 := yyvsc34 + yyInitial_yyvs_size
		yyvs34 := yyspecial_routines34.aliased_resized_area (yyvs34, yyvsc34)
	end
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 222 then
--|#line 1946 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1946")
end

			create date_interval.make_lower_unbounded(yyvs15.item (yyvsp15), False)
			yyval34 := date_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp15 := yyvsp15 -1
	if yyvsp34 >= yyvsc34 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs34")
		end
		yyvsc34 := yyvsc34 + yyInitial_yyvs_size
		yyvs34 := yyspecial_routines34.aliased_resized_area (yyvs34, yyvsc34)
	end
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 223 then
--|#line 1951 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1951")
end

			create date_interval.make_lower_unbounded(yyvs15.item (yyvsp15), True)
			yyval34 := date_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp15 := yyvsp15 -1
	if yyvsp34 >= yyvsc34 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs34")
		end
		yyvsc34 := yyvsc34 + yyInitial_yyvs_size
		yyvs34 := yyspecial_routines34.aliased_resized_area (yyvs34, yyvsc34)
	end
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 224 then
--|#line 1956 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1956")
end

			create date_interval.make_upper_unbounded(yyvs15.item (yyvsp15), False)
			yyval34 := date_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp15 := yyvsp15 -1
	if yyvsp34 >= yyvsc34 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs34")
		end
		yyvsc34 := yyvsc34 + yyInitial_yyvs_size
		yyvs34 := yyspecial_routines34.aliased_resized_area (yyvs34, yyvsc34)
	end
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 225 then
--|#line 1961 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1961")
end

			create date_interval.make_upper_unbounded(yyvs15.item (yyvsp15), True)
			yyval34 := date_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp15 := yyvsp15 -1
	if yyvsp34 >= yyvsc34 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs34")
		end
		yyvsc34 := yyvsc34 + yyInitial_yyvs_size
		yyvs34 := yyspecial_routines34.aliased_resized_area (yyvs34, yyvsc34)
	end
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 226 then
--|#line 1966 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1966")
end

			create date_interval.make_point(yyvs15.item (yyvsp15))
			yyval34 := date_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp15 := yyvsp15 -1
	if yyvsp34 >= yyvsc34 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs34")
		end
		yyvsc34 := yyvsc34 + yyInitial_yyvs_size
		yyvs34 := yyspecial_routines34.aliased_resized_area (yyvs34, yyvsc34)
	end
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 227 then
--|#line 1973 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1973")
end

			if valid_iso8601_time(yyvs2.item (yyvsp2)) then
				create yyval17.make_from_string(yyvs2.item (yyvsp2))
			else
				raise_error
				report_error("invalid ISO8601 time: " + yyvs2.item (yyvsp2))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp17 := yyvsp17 + 1
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
when 228 then
--|#line 2003 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2003")
end

			if yyvs17.item (yyvsp17 - 1) <= yyvs17.item (yyvsp17) then
				create time_interval.make_bounded(yyvs17.item (yyvsp17 - 1), yyvs17.item (yyvsp17), True, True)
				yyval33 := time_interval
			else
				raise_error
				report_error("Invalid interval: " + yyvs17.item (yyvsp17 - 1).out + " must be <= " + yyvs17.item (yyvsp17).out)
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp33 := yyvsp33 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp17 := yyvsp17 -2
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 229 then
--|#line 2014 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2014")
end

			if yyvs17.item (yyvsp17 - 1) <= yyvs17.item (yyvsp17) then
				create time_interval.make_bounded(yyvs17.item (yyvsp17 - 1), yyvs17.item (yyvsp17), False, True)
				yyval33 := time_interval
			else
				raise_error
				report_error("Invalid interval: " + yyvs17.item (yyvsp17 - 1).out + " must be <= " + yyvs17.item (yyvsp17).out)
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp33 := yyvsp33 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp17 := yyvsp17 -2
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 230 then
--|#line 2025 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2025")
end

			if yyvs17.item (yyvsp17 - 1) <= yyvs17.item (yyvsp17) then
				create time_interval.make_bounded(yyvs17.item (yyvsp17 - 1), yyvs17.item (yyvsp17), True, False)
				yyval33 := time_interval
			else
				raise_error
				report_error("Invalid interval: " + yyvs17.item (yyvsp17 - 1).out + " must be <= " + yyvs17.item (yyvsp17).out)
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp33 := yyvsp33 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp17 := yyvsp17 -2
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
--|#line 2036 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2036")
end

			if yyvs17.item (yyvsp17 - 1) <= yyvs17.item (yyvsp17) then
				create time_interval.make_bounded(yyvs17.item (yyvsp17 - 1), yyvs17.item (yyvsp17), False, False)
				yyval33 := time_interval
			else
				raise_error
				report_error("Invalid interval: " + yyvs17.item (yyvsp17 - 1).out + " must be <= " + yyvs17.item (yyvsp17).out)
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp33 := yyvsp33 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp17 := yyvsp17 -2
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 232 then
--|#line 2047 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2047")
end

			create time_interval.make_lower_unbounded(yyvs17.item (yyvsp17), False)
			yyval33 := time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp33 := yyvsp33 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp17 := yyvsp17 -1
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
--|#line 2052 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2052")
end

			create time_interval.make_lower_unbounded(yyvs17.item (yyvsp17), True)
			yyval33 := time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp33 := yyvsp33 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp17 := yyvsp17 -1
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
--|#line 2057 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2057")
end

			create time_interval.make_upper_unbounded(yyvs17.item (yyvsp17), False)
			yyval33 := time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp33 := yyvsp33 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp17 := yyvsp17 -1
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 235 then
--|#line 2062 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2062")
end

			create time_interval.make_upper_unbounded(yyvs17.item (yyvsp17), True)
			yyval33 := time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp33 := yyvsp33 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp17 := yyvsp17 -1
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
--|#line 2067 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2067")
end

			create time_interval.make_point(yyvs17.item (yyvsp17))
			yyval33 := time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp17 := yyvsp17 -1
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 237 then
--|#line 2074 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2074")
end

			if valid_iso8601_date_time(yyvs2.item (yyvsp2)) then
				create yyval16.make_from_string(yyvs2.item (yyvsp2))
			else
				raise_error
				report_error("invalid ISO8601 date/time: " + yyvs2.item (yyvsp2))
				abort
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
when 238 then
--|#line 2104 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2104")
end

			if yyvs16.item (yyvsp16 - 1) <= yyvs16.item (yyvsp16) then
				create date_time_interval.make_bounded(yyvs16.item (yyvsp16 - 1), yyvs16.item (yyvsp16), True, True)
				yyval35 := date_time_interval
			else
				raise_error
				report_error("Invalid interval: " + yyvs16.item (yyvsp16 - 1).out + " must be <= " + yyvs16.item (yyvsp16).out)
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp35 := yyvsp35 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp16 := yyvsp16 -2
	if yyvsp35 >= yyvsc35 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs35")
		end
		yyvsc35 := yyvsc35 + yyInitial_yyvs_size
		yyvs35 := yyspecial_routines35.aliased_resized_area (yyvs35, yyvsc35)
	end
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 239 then
--|#line 2115 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2115")
end

			if yyvs16.item (yyvsp16 - 1) <= yyvs16.item (yyvsp16) then
				create date_time_interval.make_bounded(yyvs16.item (yyvsp16 - 1), yyvs16.item (yyvsp16), False, True)
				yyval35 := date_time_interval
			else
				raise_error
				report_error("Invalid interval: " + yyvs16.item (yyvsp16 - 1).out + " must be <= " + yyvs16.item (yyvsp16).out)
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp35 := yyvsp35 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp16 := yyvsp16 -2
	if yyvsp35 >= yyvsc35 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs35")
		end
		yyvsc35 := yyvsc35 + yyInitial_yyvs_size
		yyvs35 := yyspecial_routines35.aliased_resized_area (yyvs35, yyvsc35)
	end
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 240 then
--|#line 2126 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2126")
end

			if yyvs16.item (yyvsp16 - 1) <= yyvs16.item (yyvsp16) then
				create date_time_interval.make_bounded(yyvs16.item (yyvsp16 - 1), yyvs16.item (yyvsp16), True, False)
				yyval35 := date_time_interval
			else
				raise_error
				report_error("Invalid interval: " + yyvs16.item (yyvsp16 - 1).out + " must be <= " + yyvs16.item (yyvsp16).out)
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp35 := yyvsp35 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp16 := yyvsp16 -2
	if yyvsp35 >= yyvsc35 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs35")
		end
		yyvsc35 := yyvsc35 + yyInitial_yyvs_size
		yyvs35 := yyspecial_routines35.aliased_resized_area (yyvs35, yyvsc35)
	end
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 241 then
--|#line 2137 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2137")
end

			if yyvs16.item (yyvsp16 - 1) <= yyvs16.item (yyvsp16) then
				create date_time_interval.make_bounded(yyvs16.item (yyvsp16 - 1), yyvs16.item (yyvsp16), False, False)
				yyval35 := date_time_interval
			else
				raise_error
				report_error("Invalid interval: " + yyvs16.item (yyvsp16 - 1).out + " must be <= " + yyvs16.item (yyvsp16).out)
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp35 := yyvsp35 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp16 := yyvsp16 -2
	if yyvsp35 >= yyvsc35 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs35")
		end
		yyvsc35 := yyvsc35 + yyInitial_yyvs_size
		yyvs35 := yyspecial_routines35.aliased_resized_area (yyvs35, yyvsc35)
	end
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 242 then
--|#line 2148 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2148")
end

			create date_time_interval.make_lower_unbounded(yyvs16.item (yyvsp16), False)
			yyval35 := date_time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp35 := yyvsp35 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp16 := yyvsp16 -1
	if yyvsp35 >= yyvsc35 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs35")
		end
		yyvsc35 := yyvsc35 + yyInitial_yyvs_size
		yyvs35 := yyspecial_routines35.aliased_resized_area (yyvs35, yyvsc35)
	end
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 243 then
--|#line 2153 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2153")
end

			create date_time_interval.make_lower_unbounded(yyvs16.item (yyvsp16), True)
			yyval35 := date_time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp35 := yyvsp35 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp16 := yyvsp16 -1
	if yyvsp35 >= yyvsc35 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs35")
		end
		yyvsc35 := yyvsc35 + yyInitial_yyvs_size
		yyvs35 := yyspecial_routines35.aliased_resized_area (yyvs35, yyvsc35)
	end
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 244 then
--|#line 2158 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2158")
end

			create date_time_interval.make_upper_unbounded(yyvs16.item (yyvsp16), False)
			yyval35 := date_time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp35 := yyvsp35 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp16 := yyvsp16 -1
	if yyvsp35 >= yyvsc35 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs35")
		end
		yyvsc35 := yyvsc35 + yyInitial_yyvs_size
		yyvs35 := yyspecial_routines35.aliased_resized_area (yyvs35, yyvsc35)
	end
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 245 then
--|#line 2163 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2163")
end

			create date_time_interval.make_upper_unbounded(yyvs16.item (yyvsp16), True)
			yyval35 := date_time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp35 := yyvsp35 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp16 := yyvsp16 -1
	if yyvsp35 >= yyvsc35 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs35")
		end
		yyvsc35 := yyvsc35 + yyInitial_yyvs_size
		yyvs35 := yyspecial_routines35.aliased_resized_area (yyvs35, yyvsc35)
	end
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 246 then
--|#line 2168 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2168")
end

			create date_time_interval.make_point(yyvs16.item (yyvsp16))
			yyval35 := date_time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp35 := yyvsp35 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp16 := yyvsp16 -1
	if yyvsp35 >= yyvsc35 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs35")
		end
		yyvsc35 := yyvsc35 + yyInitial_yyvs_size
		yyvs35 := yyspecial_routines35.aliased_resized_area (yyvs35, yyvsc35)
	end
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 247 then
--|#line 2175 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2175")
end

			if valid_iso8601_duration(yyvs2.item (yyvsp2)) then
				create yyval18.make_from_string(yyvs2.item (yyvsp2))
			else
				raise_error
				report_error("invalid ISO8601 duration: " + yyvs2.item (yyvsp2))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp18 := yyvsp18 + 1
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
when 248 then
--|#line 2205 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2205")
end

			if yyvs18.item (yyvsp18 - 1) <= yyvs18.item (yyvsp18) then
				create duration_interval.make_bounded(yyvs18.item (yyvsp18 - 1), yyvs18.item (yyvsp18), True, True)
				yyval36 := duration_interval
			else
				raise_error
				report_error("Invalid interval: " + yyvs18.item (yyvsp18 - 1).out + " must be <= " + yyvs18.item (yyvsp18).out)
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp36 := yyvsp36 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp18 := yyvsp18 -2
	if yyvsp36 >= yyvsc36 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs36")
		end
		yyvsc36 := yyvsc36 + yyInitial_yyvs_size
		yyvs36 := yyspecial_routines36.aliased_resized_area (yyvs36, yyvsc36)
	end
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
when 249 then
--|#line 2216 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2216")
end

			if yyvs18.item (yyvsp18 - 1) <= yyvs18.item (yyvsp18) then
				create duration_interval.make_bounded(yyvs18.item (yyvsp18 - 1), yyvs18.item (yyvsp18), False, True)
				yyval36 := duration_interval
			else
				raise_error
				report_error("Invalid interval: " + yyvs18.item (yyvsp18 - 1).out + " must be <= " + yyvs18.item (yyvsp18).out)
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp36 := yyvsp36 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp18 := yyvsp18 -2
	if yyvsp36 >= yyvsc36 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs36")
		end
		yyvsc36 := yyvsc36 + yyInitial_yyvs_size
		yyvs36 := yyspecial_routines36.aliased_resized_area (yyvs36, yyvsc36)
	end
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
when 250 then
--|#line 2227 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2227")
end

			if yyvs18.item (yyvsp18 - 1) <= yyvs18.item (yyvsp18) then
				create duration_interval.make_bounded(yyvs18.item (yyvsp18 - 1), yyvs18.item (yyvsp18), True, False)
				yyval36 := duration_interval
			else
				raise_error
				report_error("Invalid interval: " + yyvs18.item (yyvsp18 - 1).out + " must be <= " + yyvs18.item (yyvsp18).out)
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp36 := yyvsp36 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp18 := yyvsp18 -2
	if yyvsp36 >= yyvsc36 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs36")
		end
		yyvsc36 := yyvsc36 + yyInitial_yyvs_size
		yyvs36 := yyspecial_routines36.aliased_resized_area (yyvs36, yyvsc36)
	end
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
when 251 then
--|#line 2238 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2238")
end

			if yyvs18.item (yyvsp18 - 1) <= yyvs18.item (yyvsp18) then
				create duration_interval.make_bounded(yyvs18.item (yyvsp18 - 1), yyvs18.item (yyvsp18), False, False)
				yyval36 := duration_interval
			else
				raise_error
				report_error("Invalid interval: " + yyvs18.item (yyvsp18 - 1).out + " must be <= " + yyvs18.item (yyvsp18).out)
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp36 := yyvsp36 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp18 := yyvsp18 -2
	if yyvsp36 >= yyvsc36 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs36")
		end
		yyvsc36 := yyvsc36 + yyInitial_yyvs_size
		yyvs36 := yyspecial_routines36.aliased_resized_area (yyvs36, yyvsc36)
	end
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
when 252 then
--|#line 2249 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2249")
end

			create duration_interval.make_lower_unbounded(yyvs18.item (yyvsp18), False)
			yyval36 := duration_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp36 := yyvsp36 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp18 := yyvsp18 -1
	if yyvsp36 >= yyvsc36 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs36")
		end
		yyvsc36 := yyvsc36 + yyInitial_yyvs_size
		yyvs36 := yyspecial_routines36.aliased_resized_area (yyvs36, yyvsc36)
	end
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
when 253 then
--|#line 2254 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2254")
end

			create duration_interval.make_lower_unbounded(yyvs18.item (yyvsp18), True)
			yyval36 := duration_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp36 := yyvsp36 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp18 := yyvsp18 -1
	if yyvsp36 >= yyvsc36 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs36")
		end
		yyvsc36 := yyvsc36 + yyInitial_yyvs_size
		yyvs36 := yyspecial_routines36.aliased_resized_area (yyvs36, yyvsc36)
	end
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
when 254 then
--|#line 2259 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2259")
end

			create duration_interval.make_upper_unbounded(yyvs18.item (yyvsp18), False)
			yyval36 := duration_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp36 := yyvsp36 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp18 := yyvsp18 -1
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
--|#line 2264 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2264")
end

			create duration_interval.make_upper_unbounded(yyvs18.item (yyvsp18), True)
			yyval36 := duration_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp36 := yyvsp36 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp18 := yyvsp18 -1
	if yyvsp36 >= yyvsc36 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs36")
		end
		yyvsc36 := yyvsc36 + yyInitial_yyvs_size
		yyvs36 := yyspecial_routines36.aliased_resized_area (yyvs36, yyvsc36)
	end
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
when 256 then
--|#line 2269 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2269")
end

			create duration_interval.make_point(yyvs18.item (yyvsp18))
			yyval36 := duration_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp36 := yyvsp36 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp18 := yyvsp18 -1
	if yyvsp36 >= yyvsc36 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs36")
		end
		yyvsc36 := yyvsc36 + yyInitial_yyvs_size
		yyvs36 := yyspecial_routines36.aliased_resized_area (yyvs36, yyvsc36)
	end
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
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
			when 451 then
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
			   83,   84,   76,   74,   86,   75,    2,   77,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,   82,   85,
			    2,   68,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,   81,    2,    2,    2,    2,    2,

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
			    0,  125,  125,  125,  126,  127,  129,  129,  128,  128,
			  132,  132,  132,  132,  132,  132,  132,  132,  132,  132,
			  133,  133,  134,  138,  139,  139,  139,   97,   98,   98,
			   98,   98,   98,   98,   98,   98,  130,  131,  131,  148,
			  148,  149,  149,  150,  150,  150,   88,   88,   89,   89,
			   87,   87,  151,  151,  151,   99,   99,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  101,  101,  101,  102,  102,  103,  103,  103,  103,
			  103,  104,  104,  104,  104,   91,   91,   91,   92,   92,
			  115,  115,   95,   95,  152,  152,  105,  153,  153,  153,

			  153,  153,  153,  153,  153,   93,   93,   94,   94,   94,
			   96,   96,  154,  154,  154,  140,  140,  140,  155,  155,
			  155,  141,  141,  141,  156,  156,  156,  142,  142,  142,
			  157,  157,  157,  143,  143,  143,  158,  158,  158,  144,
			  144,  144,  159,  159,  159,  159,  160,  145,  145,  145,
			  161,  161,  161,  161,  146,  146,  146,  162,  162,  162,
			  162,  147,  147,  147,  137,  137,  137,  137,  163,  163,
			  164,  164,  136,  136,  135,  113,  113,   90,   90,   90,
			   90,  114,  116,  116,  116,  106,  106,  106,  117,  117,
			  117,  119,  119,  119,  119,  119,  119,  119,  119,  119,

			  107,  107,  107,  118,  118,  118,  120,  120,  120,  120,
			  120,  120,  120,  120,  120,  108,  108,  109,  122,  122,
			  122,  122,  122,  122,  122,  122,  122,  111,  121,  121,
			  121,  121,  121,  121,  121,  121,  121,  110,  123,  123,
			  123,  123,  123,  123,  123,  123,  123,  112,  124,  124,
			  124,  124,  124,  124,  124,  124,  124, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    2,    2,    4,    3,    1,    7,    2,    8,    8,   12,
			   12,   12,   12,   12,   12,    3,    4,    2,   21,    1,
			    1,    1,    1,    1,    2,    2,    2,   12,   12,    8,
			    4,    3,    4,    3,    1,   12,    1,    8,    2,    2,
			    1,    2,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    9,    1,    1,    1,    1,    8,   21,
			    1,   12,   12,   12,   12,    1,   12,   12,   12,   12,
			   12,   12,   12,   12,   12,   12,   12,    1,   12,    1,

			    1,    1,    1,    1,    1,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,   11,    3,    4,   15,   16,
			   17,   18,   22,   23,   24,    9,   32,   33,   34,   35,
			   36,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,   12,    1,
			    2,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    3,    4,   15,   16,   17,   18,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    9,    1,    1,    1,
			    1,    1,    1,    3,    3,    9,    3,    1,    1,    3,

			    4,   15,   16,   17,   18,    3,    4,   15,   16,   17,
			   18,    3,    4,   15,   16,   17,   18,    3,    4,   15,
			   16,   17,   18,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    2,    1,    3,    1,
			    1,    1,    4,    1,    2,    3,    4,    1,    3,    1,
			    4,    1,   15,    1,   17,    1,   16,    1,   18,    1,
			   36,    2,    1,    2,    1,    1,    1,   14,    1,    1,
			   13,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    3,    1,    4,    1,   15,
			    1,   16,    1,   17,    1,   18,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    6,    2,    2,    2,
			    1,    2,   10,   11,    3,    4,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    3,
			    1,    3,    1,    4,    1,   15,    1,   16,    1,   17,
			    1,   18,    3,    1,    4,    1,   15,    1,   16,    1,
			   17,    1,   18,    1,    3,    1,    1,    2,    1,    2,
			    1,    1,    1,    1,    9,    1,    1,    1,    1,    1,
			    3,    1,    4,    1,   15,    1,   16,    1,   17,    1,

			   18,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    9,    1,    1,    9,    2,    2,    2,    1,    3,    4,
			    1,    1,    3,    4,    1,    1,    1,    1,    1,    1,
			    3,    1,    1,    8,    1,    7,    1,    1,    1,    7,
			    1,    7,    1,    1,    1,    7,    1,    1,    1,    1,
			    1,    1,    1,    1, yyDummy>>)
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
			    1,    1,    1,    1,    1,    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER]
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    0,    0,   85,    0,    0,    0,    0,   73,   72,  176,
			  180,  179,  200,  185,    3,    2,  175,   84,    0,   53,
			   56,   55,    0,   75,   74,   82,   83,    0,   88,    1,
			    0,  107,   50,    0,   91,    0,    0,    0,    0,   86,
			  202,  187,  201,  186,    0,   60,   58,   57,   90,  175,
			   51,    7,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    5,  178,  177,   71,   81,   87,   89,
			    0,   67,   69,   68,   70,    0,   80,   79,   78,   77,
			   76,   66,   65,   64,   63,   62,   61,   54,   52,    0,

			    0,  109,  158,  157,    0,  146,  124,  130,  136,  247,
			  237,  227,  217,  153,  150,    0,  112,  118,  125,  137,
			  131,  144,  151,  113,  119,  114,  120,  132,  126,  138,
			  145,   28,   29,   30,   31,   32,   33,   34,   35,  115,
			  121,  127,  133,  139,  147,  142,  154,  161,    0,   36,
			   92,    0,    8,    9,   37,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			   59,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,   41,    4,   38,    0,
			  106,    0,    0,  185,  110,    0,  105,  160,  159,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  199,    0,  214,    0,  226,    0,
			  246,    0,  236,    0,  256,  184,  182,  190,  188,    0,
			    0,  205,  203,  152,  183,  189,  204,  117,  116,  123,
			  122,  129,  128,  135,  134,  141,  140,  149,  148,    0,
			  143,  181,  156,  155,  216,  215,  163,  162,    0,    0,
			   42,    0,    0,  108,  198,  213,  225,  245,  235,  255,
			  196,  211,  223,  243,  233,  253,    0,  197,    0,  212,
			    0,  224,    0,  244,    0,  234,    0,  254,  195,  210,

			  222,  242,  232,  252,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   18,    0,    0,   17,  172,  173,  174,
			   19,    6,   16,   27,  112,  118,   10,   45,   43,   11,
			   12,   13,   14,   15,    0,  107,    0,  164,  168,  111,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  191,    0,  206,    0,  218,    0,  238,
			    0,  228,    0,  248,   94,    0,    0,    0,   26,   24,
			   40,    0,    0,    0,   23,   39,   19,   44,    0,    0,
			    0,  192,    0,  207,    0,  219,    0,  239,    0,  229,

			    0,  249,  193,  208,  220,  240,  230,  250,    0,   93,
			   97,    0,   21,    0,   25,  170,  171,   46,    0,    0,
			  169,  167,  165,  166,  194,  209,  221,  241,  231,  251,
			   95,    0,   96,   20,    0,   48,  100,   98,   99,   47,
			    0,    0,    0,    0,    0,   49,   22,  103,  104,  101,
			  102,    0,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			   15,  435,  441,   49,   17,   18,  194,   73,  186,  195,
			  332,  333,   19,   20,   21,   22,   23,   24,  270,   25,
			   26,  267,  118,  119,  120,  121,   27,  263,   28,  122,
			  123,  124,  125,  126,  127,  128,  129,  130,  451,  336,
			   30,  151,   31,  152,  153,  338,  339,  340,  341,  342,
			  343,  344,  345,  131,  132,  133,  134,  135,  136,  137,
			  138,  154,  155,  346,   32,  375,  411,  139,  140,  141,
			  142,  143,  144,  145,  146,  147,  347,  348, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			  447,  467,  581,  327,  320,  118,   34, -32768, -32768,  117,
			 -32768, -32768, -32768, -32768, -32768,  452,  143,  182,  -26,  189,
			 -32768, -32768,  319, -32768, -32768, -32768, -32768,  528, -32768, -32768,
			  546,  394, -32768,  222,  579,  525,  521,  201,  298, -32768,
			 -32768, -32768, -32768, -32768,  222, -32768, -32768,  182, -32768, -32768,
			 -32768, -32768,  581,  581,  559,  222,  222,  222,  222,   22,
			   22,   22,   22,   22,   22,   22,   22,   22,   22,   22,
			  171,  557,  168, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			  533, -32768,  520,  520,  120,   22, -32768, -32768, -32768, -32768,
			 -32768,  402,  402,  402,  402,  402,  402, -32768,  189,    5,

			  554, -32768,  517,  516,  541, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768,  515,  548,  514,  512, -32768, -32768,
			 -32768, -32768,  511,  495,  490, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  509,
			  508,  505,  502,  500,  497,  503,  494,  492,  418, -32768,
			  538,  544, -32768,  565, -32768,  524,   46,  539,  537,  138,
			  138,  138,  138,  315,  297,  271,  266,  252,  247,  147,
			 -32768,  123,  141,    4,   60,  157,   28,   44,  170,   33,
			   20,   18,  536,   21,  208,  523,  513, -32768, -32768,  522,
			 -32768,  543,  527,  506, -32768,  510, -32768, -32768, -32768,  507,

			  504,  501,  496,  493,  491,  488,  486,  484,  483,  481,
			  479,  245,  239,  235,  217,  156,   -7,  478,  477,  476,
			  475,  474,  473,   75, -32768,  159, -32768,  148, -32768,  122,
			 -32768,  149, -32768,  216, -32768, -32768, -32768, -32768, -32768,  499,
			  498, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  249,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  469,  438,
			 -32768,  413,   49, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768,   66, -32768,  133, -32768,
			  136, -32768,  104, -32768,  -14, -32768,  198, -32768, -32768, -32768,

			 -32768, -32768, -32768, -32768,   60,  465,  157,  459,  396,  458,
			  380,  450,  384,  437,  376,  436,  376,  376,  376,  376,
			  446,  414,  309, -32768,   -1,   10, -32768, -32768, -32768, -32768,
			  419,  430, -32768, -32768,   -9,  -17, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768,  398,  394,  329,  225, -32768, -32768,
			   60,  399,  157,  397,  396,  390,  380,  389,  384,  383,
			  376,  381,  379, -32768,  378, -32768,  377, -32768,  375, -32768,
			  374, -32768,  369, -32768,  355,  367,   46,   17, -32768,  373,
			 -32768,  371,  370,  352, -32768, -32768, -32768, -32768,   58,   42,
			  348, -32768,  344, -32768,  333, -32768,  332, -32768,  328, -32768,

			  314, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  341, -32768,
			  253,  307, -32768,  251, -32768, -32768, -32768,  273,  276,  244,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768,   -3, -32768,  182,  452,  232,  162,  101,   93,  452,
			  452,  214,  261,  131,  106,  452, -32768, -32768, -32768, -32768,
			 -32768,  166,  153, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -410, -32768, -32768,    2,   -5,  135,  349, -333, -32768,  246,
			 -32768,  540,  236, -32768,  613,    7, -32768,  404, -32768,  -76,
			  -71, -32768,  -47,  -52, -101,  -94, -32768, -32768,  566, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768,  435, -32768,  599,
			 -32768, -32768, -32768,  335, -32768,  258, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768,  443, -32768, -32768,  -15, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768,  207, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   50,   47,   16,  167,  116,   11,   10,  111,   38,  117,
			  168,  378,  384,  150,  244,  382,   11,   10,  412,  257,
			   54,  255,  262,  381,  439,  297,   13,   12,  163,  247,
			  445,  261,   13,  164,  253,   46,  296,  438,  437,  436,
			   38,  109,  110,  421,  413,  249,   13,   12,  243,   12,
			  193,   53,  166,   13,  111,   72,  358,  165,  203,  209,
			  215,  221,   13,   12,   13,  204,  210,  216,  222,  172,
			   13,   91,   92,   93,   94,   95,   96,  171,  254,   13,
			  196,  149,  322,  199,  205,  211,  217,  258,  200,  206,
			  212,  218,  148,  322, -107,  238,    4,    3,  245,    2,

			  248,  242,  192,  191,  246,   85,  250,  202,  208,  214,
			  220,    2,  201,  207,  213,  219,    4,    3,  240,  239,
			  192,  191,  190,  192,  191,  190,  110,   13,  256,   48,
			  313,  252,    4,    3,  192,  191,  350,   39,   12,  315,
			  192,  191,   13,   12,  110,  304,   12,  305,  450,  192,
			  191,    8,    7,  453,  307,   51,  112,  236,  112,  111,
			  110,  109,   12,  -91,   12,  168,  452,  237,  112,  101,
			  111,  251,   97,  449,  356,   13,   12,  311,  444,   34,
			  309,   -6,   57,   56,   55,  241,  443,   78,  295,   -6,
			  112,  235,  310,  359,  -91,  334,  196,  192,  191,  294,

			  335,   44,  361,  352,    8,    7,  354,  240,  239,  266,
			  351,  370,    4,    3,  100,  240,  239,  353,  308,  312,
			  372,  109,  204,  210,  216,  222,   13,   12,  362,  306,
			   34,  240,  239,  240,  239,  364,    6,   37,    5,  109,
			  357,  265,  264,  355,  446,    4,    3,  442,    2,  293,
			   58,   57,   56,   55,   33,    8,    7,  398,  368,   52,
			  292,  366,   58,   57,   56,   55,  400,  291,  360,   37,
			  334,  289,  109,  331,  390,  335,  382,  287,  290,  234,
			   37,  392,  288,  440,  232,   76,  314,    6,  286,    5,
			  233,   81,   82,   83,   84,  231,    4,    3,  230,    2,

			  196,  448,  447,  228,  396,   33,   98,  394,  381,  229,
			  389,  388,  418,  422,  227,   36,   35,  419,  423,  319,
			  318,  317,  316,  434,   43,   42,  377,  379,    2,  226,
			  386,   41,   40,   13,   12,   11,   10,  432,  431,  114,
			  225,  329,  328,  327,  113,  430,  429,  224,  331,  112,
			  111,  110,  109,  108,  107,  106,  105,  326,  223,  385,
			  428,  104,  103,  102,  427,  426,   69,   68,   67,   66,
			   65,   64,   63,   62,   61,   60,  425,  325,  324,   59,
			  424,  417,   77,  416,  415,  414,  323,   69,   68,   67,
			   66,   65,   64,   63,   62,   61,   60,  409,  408,  109,

			   59,  407,  110,    4,    3,  111,  406,  405,  433,  404,
			  403,  402,  322,  401,  330,  399,  112,   13,   12,   11,
			   10,  397,  395,  114,   50,  329,  328,  327,  113,  393,
			   50,  391,   72,  112,  111,  110,  109,  108,  107,  106,
			  105,  326,   51,  376,  383,  104,  103,  102,   14,  380,
			  374,   13,   12,   11,   10,    9,   13,   12,   11,   10,
			    9,  325,  324,   86,   87,   88,   89,   90,  373,  371,
			  323,   13,   12,   36,   35,   34,   63,   62,   61,   60,
			    8,    7,  369,   59,  321,    8,    7,    4,    3,  149,
			  367,  365,   63,   62,   61,   60,  322,  363,  320,   59,

			    8,    7,   77,   42,   40,  303,  302,  301,  300,  299,
			  298,  285,    6,  284,    5,  283,  282,    6,  281,    5,
			  280,    4,    3,  279,    2,  278,    4,    3,  277,    2,
			    1,   43,    6,  276,    5,    1,  275,   13,   12,  274,
			  273,    4,    3,  114,    2,   13,   12,   41,  113,  272,
			   33,  271,  269,  112,  111,  110,  109,  108,  107,  106,
			  105,  112,  111,  110,  109,  104,  103,  102,  259,  268,
			  189,  198,  197,  150,  187,  185,  175,  184,  170,  183,
			  182,  174,  181,  156,   55,  180,   99,  179,   80,   34,
			  178,   48,   71,  177,  176,  420,  188,  173,  172,   29,

			  171,  169,  158,  157,  387,   75,  337,    4,    3,   74,
			   70,  162,  161,  160,  159,    4,    3,  260,   45,   79,
			  115,  349,  410, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			   15,    6,    0,  104,   80,    6,    7,   21,    1,   80,
			  104,    1,  345,    8,   10,   32,    6,    7,    1,    1,
			   46,    1,    1,   32,  434,   32,    4,    5,  104,    1,
			  440,   10,    4,  104,    1,    1,   43,   40,   41,   42,
			   33,   23,   22,    1,  377,    1,    4,    5,   44,    5,
			    4,   77,  104,    4,   21,   38,   70,  104,  159,  160,
			  161,  162,    4,    5,    4,  159,  160,  161,  162,   86,
			    4,   64,   65,   66,   67,   68,   69,   86,  179,    4,
			  156,   76,   83,  159,  160,  161,  162,  181,  159,  160,
			  161,  162,   85,   83,   77,  171,   74,   75,  174,   77,

			  176,  172,   74,   75,  175,   83,  177,  159,  160,  161,
			  162,   77,  159,  160,  161,  162,   74,   75,   74,   75,
			   74,   75,   76,   74,   75,   76,   22,    4,  180,   12,
			  231,  178,   74,   75,   74,   75,   70,    2,    5,  233,
			   74,   75,    4,    5,   22,   70,    5,  223,   42,   74,
			   75,   33,   34,    0,  225,   12,   20,   10,   20,   21,
			   22,   23,    5,   46,    5,  259,    0,   44,   20,    1,
			   21,    1,    1,   42,   70,    4,    5,  229,   85,    8,
			  227,   38,   62,   63,   64,   44,   85,   52,   32,   46,
			   20,   44,   70,  294,   77,  271,  272,   74,   75,   43,

			  271,   83,  296,   70,   33,   34,   70,   74,   75,    1,
			  286,  312,   74,   75,   46,   74,   75,  288,   70,   70,
			  314,   23,  316,  317,  318,  319,    4,    5,  304,   70,
			    8,   74,   75,   74,   75,  306,   65,    1,   67,   23,
			  292,   33,   34,  290,   30,   74,   75,   85,   77,   32,
			   61,   62,   63,   64,   83,   33,   34,  358,  310,   77,
			   43,  308,   61,   62,   63,   64,  360,   32,   70,   33,
			  346,   32,   23,  271,  350,  346,   32,   32,   43,   32,
			   44,  352,   43,   51,   32,   84,   70,   65,   43,   67,
			   43,   55,   56,   57,   58,   43,   74,   75,   32,   77,

			  376,   40,   41,   32,  356,   83,   70,  354,   32,   43,
			   85,   86,  388,  389,   43,    6,    7,  388,  389,   70,
			   71,   72,   73,   50,    4,    5,  324,  325,   77,   32,
			    1,    4,    5,    4,    5,    6,    7,   30,   85,   10,
			   43,   12,   13,   14,   15,    4,   32,   32,  346,   20,
			   21,   22,   23,   24,   25,   26,   27,   28,   43,   30,
			   32,   32,   33,   34,   32,   32,   68,   69,   70,   71,
			   72,   73,   74,   75,   76,   77,   32,   48,   49,   81,
			   32,   29,   84,   13,   13,   12,   57,   68,   69,   70,
			   71,   72,   73,   74,   75,   76,   77,   30,   43,   23,

			   81,   32,   22,   74,   75,   21,   32,   32,  413,   32,
			   32,   32,   83,   32,    1,   32,   20,    4,    5,    6,
			    7,   32,   32,   10,  439,   12,   13,   14,   15,   32,
			  445,   32,   38,   20,   21,   22,   23,   24,   25,   26,
			   27,   28,   12,   29,   46,   32,   33,   34,    1,   30,
			    4,    4,    5,    6,    7,    8,    4,    5,    6,    7,
			    8,   48,   49,   59,   60,   61,   62,   63,   32,   32,
			   57,    4,    5,    6,    7,    8,   74,   75,   76,   77,
			   33,   34,   32,   81,   46,   33,   34,   74,   75,   76,
			   32,   32,   74,   75,   76,   77,   83,   32,   29,   81,

			   33,   34,   84,    5,    5,   32,   32,   32,   32,   32,
			   32,   32,   65,   32,   67,   32,   32,   65,   32,   67,
			   32,   74,   75,   32,   77,   32,   74,   75,   32,   77,
			   83,    4,   65,   32,   67,   83,   32,    4,    5,   32,
			   30,   74,   75,   10,   77,    4,    5,    4,   15,   43,
			   83,   29,   39,   20,   21,   22,   23,   24,   25,   26,
			   27,   20,   21,   22,   23,   32,   33,   34,   32,   46,
			   46,   34,   33,    8,   30,   37,   86,   85,   30,   85,
			   77,   86,   85,   29,   64,   85,   29,   85,   29,    8,
			   85,   12,   46,   85,   85,  388,  153,   86,   86,    0,

			   86,   86,   86,   86,  346,   84,  271,   74,   75,   84,
			   82,   70,   71,   72,   73,   74,   75,  182,    5,   53,
			   80,  272,  376, yyDummy>>)
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

	yyvs6: SPECIAL [C_DOMAIN_TYPE]
			-- Stack for semantic values of type C_DOMAIN_TYPE

	yyvsc6: INTEGER
			-- Capacity of semantic value stack `yyvs6'

	yyvsp6: INTEGER
			-- Top of semantic value stack `yyvs6'

	yyspecial_routines6: KL_SPECIAL_ROUTINES [C_DOMAIN_TYPE]
			-- Routines that ought to be in SPECIAL [C_DOMAIN_TYPE]

	yyvs7: SPECIAL [ARRAYED_LIST [ASSERTION]]
			-- Stack for semantic values of type ARRAYED_LIST [ASSERTION]

	yyvsc7: INTEGER
			-- Capacity of semantic value stack `yyvs7'

	yyvsp7: INTEGER
			-- Top of semantic value stack `yyvs7'

	yyspecial_routines7: KL_SPECIAL_ROUTINES [ARRAYED_LIST [ASSERTION]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ASSERTION]]

	yyvs8: SPECIAL [OG_PATH]
			-- Stack for semantic values of type OG_PATH

	yyvsc8: INTEGER
			-- Capacity of semantic value stack `yyvs8'

	yyvsp8: INTEGER
			-- Top of semantic value stack `yyvs8'

	yyspecial_routines8: KL_SPECIAL_ROUTINES [OG_PATH]
			-- Routines that ought to be in SPECIAL [OG_PATH]

	yyvs9: SPECIAL [INTERVAL [INTEGER]]
			-- Stack for semantic values of type INTERVAL [INTEGER]

	yyvsc9: INTEGER
			-- Capacity of semantic value stack `yyvs9'

	yyvsp9: INTEGER
			-- Top of semantic value stack `yyvs9'

	yyspecial_routines9: KL_SPECIAL_ROUTINES [INTERVAL [INTEGER]]
			-- Routines that ought to be in SPECIAL [INTERVAL [INTEGER]]

	yyvs10: SPECIAL [C_PRIMITIVE_OBJECT]
			-- Stack for semantic values of type C_PRIMITIVE_OBJECT

	yyvsc10: INTEGER
			-- Capacity of semantic value stack `yyvs10'

	yyvsp10: INTEGER
			-- Top of semantic value stack `yyvs10'

	yyspecial_routines10: KL_SPECIAL_ROUTINES [C_PRIMITIVE_OBJECT]
			-- Routines that ought to be in SPECIAL [C_PRIMITIVE_OBJECT]

	yyvs11: SPECIAL [C_PRIMITIVE]
			-- Stack for semantic values of type C_PRIMITIVE

	yyvsc11: INTEGER
			-- Capacity of semantic value stack `yyvs11'

	yyvsp11: INTEGER
			-- Top of semantic value stack `yyvs11'

	yyspecial_routines11: KL_SPECIAL_ROUTINES [C_PRIMITIVE]
			-- Routines that ought to be in SPECIAL [C_PRIMITIVE]

	yyvs12: SPECIAL [EXPR_ITEM]
			-- Stack for semantic values of type EXPR_ITEM

	yyvsc12: INTEGER
			-- Capacity of semantic value stack `yyvs12'

	yyvsp12: INTEGER
			-- Top of semantic value stack `yyvs12'

	yyspecial_routines12: KL_SPECIAL_ROUTINES [EXPR_ITEM]
			-- Routines that ought to be in SPECIAL [EXPR_ITEM]

	yyvs13: SPECIAL [CARDINALITY]
			-- Stack for semantic values of type CARDINALITY

	yyvsc13: INTEGER
			-- Capacity of semantic value stack `yyvs13'

	yyvsp13: INTEGER
			-- Top of semantic value stack `yyvs13'

	yyspecial_routines13: KL_SPECIAL_ROUTINES [CARDINALITY]
			-- Routines that ought to be in SPECIAL [CARDINALITY]

	yyvs14: SPECIAL [BOOLEAN]
			-- Stack for semantic values of type BOOLEAN

	yyvsc14: INTEGER
			-- Capacity of semantic value stack `yyvs14'

	yyvsp14: INTEGER
			-- Top of semantic value stack `yyvs14'

	yyspecial_routines14: KL_SPECIAL_ROUTINES [BOOLEAN]
			-- Routines that ought to be in SPECIAL [BOOLEAN]

	yyvs15: SPECIAL [ISO8601_DATE]
			-- Stack for semantic values of type ISO8601_DATE

	yyvsc15: INTEGER
			-- Capacity of semantic value stack `yyvs15'

	yyvsp15: INTEGER
			-- Top of semantic value stack `yyvs15'

	yyspecial_routines15: KL_SPECIAL_ROUTINES [ISO8601_DATE]
			-- Routines that ought to be in SPECIAL [ISO8601_DATE]

	yyvs16: SPECIAL [ISO8601_DATE_TIME]
			-- Stack for semantic values of type ISO8601_DATE_TIME

	yyvsc16: INTEGER
			-- Capacity of semantic value stack `yyvs16'

	yyvsp16: INTEGER
			-- Top of semantic value stack `yyvs16'

	yyspecial_routines16: KL_SPECIAL_ROUTINES [ISO8601_DATE_TIME]
			-- Routines that ought to be in SPECIAL [ISO8601_DATE_TIME]

	yyvs17: SPECIAL [ISO8601_TIME]
			-- Stack for semantic values of type ISO8601_TIME

	yyvsc17: INTEGER
			-- Capacity of semantic value stack `yyvs17'

	yyvsp17: INTEGER
			-- Top of semantic value stack `yyvs17'

	yyspecial_routines17: KL_SPECIAL_ROUTINES [ISO8601_TIME]
			-- Routines that ought to be in SPECIAL [ISO8601_TIME]

	yyvs18: SPECIAL [ISO8601_DURATION]
			-- Stack for semantic values of type ISO8601_DURATION

	yyvsc18: INTEGER
			-- Capacity of semantic value stack `yyvs18'

	yyvsp18: INTEGER
			-- Top of semantic value stack `yyvs18'

	yyspecial_routines18: KL_SPECIAL_ROUTINES [ISO8601_DURATION]
			-- Routines that ought to be in SPECIAL [ISO8601_DURATION]

	yyvs19: SPECIAL [CODE_PHRASE]
			-- Stack for semantic values of type CODE_PHRASE

	yyvsc19: INTEGER
			-- Capacity of semantic value stack `yyvs19'

	yyvsp19: INTEGER
			-- Top of semantic value stack `yyvs19'

	yyspecial_routines19: KL_SPECIAL_ROUTINES [CODE_PHRASE]
			-- Routines that ought to be in SPECIAL [CODE_PHRASE]

	yyvs20: SPECIAL [URI]
			-- Stack for semantic values of type URI

	yyvsc20: INTEGER
			-- Capacity of semantic value stack `yyvs20'

	yyvsp20: INTEGER
			-- Top of semantic value stack `yyvs20'

	yyspecial_routines20: KL_SPECIAL_ROUTINES [URI]
			-- Routines that ought to be in SPECIAL [URI]

	yyvs21: SPECIAL [OG_PATH_ITEM]
			-- Stack for semantic values of type OG_PATH_ITEM

	yyvsc21: INTEGER
			-- Capacity of semantic value stack `yyvs21'

	yyvsp21: INTEGER
			-- Top of semantic value stack `yyvs21'

	yyspecial_routines21: KL_SPECIAL_ROUTINES [OG_PATH_ITEM]
			-- Routines that ought to be in SPECIAL [OG_PATH_ITEM]

	yyvs22: SPECIAL [ARRAYED_LIST [STRING]]
			-- Stack for semantic values of type ARRAYED_LIST [STRING]

	yyvsc22: INTEGER
			-- Capacity of semantic value stack `yyvs22'

	yyvsp22: INTEGER
			-- Top of semantic value stack `yyvs22'

	yyspecial_routines22: KL_SPECIAL_ROUTINES [ARRAYED_LIST [STRING]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [STRING]]

	yyvs23: SPECIAL [ARRAYED_LIST [INTEGER]]
			-- Stack for semantic values of type ARRAYED_LIST [INTEGER]

	yyvsc23: INTEGER
			-- Capacity of semantic value stack `yyvs23'

	yyvsp23: INTEGER
			-- Top of semantic value stack `yyvs23'

	yyspecial_routines23: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTEGER]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTEGER]]

	yyvs24: SPECIAL [ARRAYED_LIST [REAL]]
			-- Stack for semantic values of type ARRAYED_LIST [REAL]

	yyvsc24: INTEGER
			-- Capacity of semantic value stack `yyvs24'

	yyvsp24: INTEGER
			-- Top of semantic value stack `yyvs24'

	yyspecial_routines24: KL_SPECIAL_ROUTINES [ARRAYED_LIST [REAL]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [REAL]]

	yyvs25: SPECIAL [ARRAYED_LIST [CHARACTER_REF]]
			-- Stack for semantic values of type ARRAYED_LIST [CHARACTER_REF]

	yyvsc25: INTEGER
			-- Capacity of semantic value stack `yyvs25'

	yyvsp25: INTEGER
			-- Top of semantic value stack `yyvs25'

	yyspecial_routines25: KL_SPECIAL_ROUTINES [ARRAYED_LIST [CHARACTER_REF]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [CHARACTER_REF]]

	yyvs26: SPECIAL [ARRAYED_LIST [BOOLEAN_REF]]
			-- Stack for semantic values of type ARRAYED_LIST [BOOLEAN_REF]

	yyvsc26: INTEGER
			-- Capacity of semantic value stack `yyvs26'

	yyvsp26: INTEGER
			-- Top of semantic value stack `yyvs26'

	yyspecial_routines26: KL_SPECIAL_ROUTINES [ARRAYED_LIST [BOOLEAN_REF]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [BOOLEAN_REF]]

	yyvs27: SPECIAL [ARRAYED_LIST [ISO8601_DATE]]
			-- Stack for semantic values of type ARRAYED_LIST [ISO8601_DATE]

	yyvsc27: INTEGER
			-- Capacity of semantic value stack `yyvs27'

	yyvsp27: INTEGER
			-- Top of semantic value stack `yyvs27'

	yyspecial_routines27: KL_SPECIAL_ROUTINES [ARRAYED_LIST [ISO8601_DATE]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ISO8601_DATE]]

	yyvs28: SPECIAL [ARRAYED_LIST [ISO8601_TIME]]
			-- Stack for semantic values of type ARRAYED_LIST [ISO8601_TIME]

	yyvsc28: INTEGER
			-- Capacity of semantic value stack `yyvs28'

	yyvsp28: INTEGER
			-- Top of semantic value stack `yyvs28'

	yyspecial_routines28: KL_SPECIAL_ROUTINES [ARRAYED_LIST [ISO8601_TIME]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ISO8601_TIME]]

	yyvs29: SPECIAL [ARRAYED_LIST [ISO8601_DATE_TIME]]
			-- Stack for semantic values of type ARRAYED_LIST [ISO8601_DATE_TIME]

	yyvsc29: INTEGER
			-- Capacity of semantic value stack `yyvs29'

	yyvsp29: INTEGER
			-- Top of semantic value stack `yyvs29'

	yyspecial_routines29: KL_SPECIAL_ROUTINES [ARRAYED_LIST [ISO8601_DATE_TIME]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ISO8601_DATE_TIME]]

	yyvs30: SPECIAL [ARRAYED_LIST [ISO8601_DURATION]]
			-- Stack for semantic values of type ARRAYED_LIST [ISO8601_DURATION]

	yyvsc30: INTEGER
			-- Capacity of semantic value stack `yyvs30'

	yyvsp30: INTEGER
			-- Top of semantic value stack `yyvs30'

	yyspecial_routines30: KL_SPECIAL_ROUTINES [ARRAYED_LIST [ISO8601_DURATION]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ISO8601_DURATION]]

	yyvs31: SPECIAL [ARRAYED_LIST [CODE_PHRASE]]
			-- Stack for semantic values of type ARRAYED_LIST [CODE_PHRASE]

	yyvsc31: INTEGER
			-- Capacity of semantic value stack `yyvs31'

	yyvsp31: INTEGER
			-- Top of semantic value stack `yyvs31'

	yyspecial_routines31: KL_SPECIAL_ROUTINES [ARRAYED_LIST [CODE_PHRASE]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [CODE_PHRASE]]

	yyvs32: SPECIAL [INTERVAL [REAL]]
			-- Stack for semantic values of type INTERVAL [REAL]

	yyvsc32: INTEGER
			-- Capacity of semantic value stack `yyvs32'

	yyvsp32: INTEGER
			-- Top of semantic value stack `yyvs32'

	yyspecial_routines32: KL_SPECIAL_ROUTINES [INTERVAL [REAL]]
			-- Routines that ought to be in SPECIAL [INTERVAL [REAL]]

	yyvs33: SPECIAL [INTERVAL [ISO8601_TIME]]
			-- Stack for semantic values of type INTERVAL [ISO8601_TIME]

	yyvsc33: INTEGER
			-- Capacity of semantic value stack `yyvs33'

	yyvsp33: INTEGER
			-- Top of semantic value stack `yyvs33'

	yyspecial_routines33: KL_SPECIAL_ROUTINES [INTERVAL [ISO8601_TIME]]
			-- Routines that ought to be in SPECIAL [INTERVAL [ISO8601_TIME]]

	yyvs34: SPECIAL [INTERVAL [ISO8601_DATE]]
			-- Stack for semantic values of type INTERVAL [ISO8601_DATE]

	yyvsc34: INTEGER
			-- Capacity of semantic value stack `yyvs34'

	yyvsp34: INTEGER
			-- Top of semantic value stack `yyvs34'

	yyspecial_routines34: KL_SPECIAL_ROUTINES [INTERVAL [ISO8601_DATE]]
			-- Routines that ought to be in SPECIAL [INTERVAL [ISO8601_DATE]]

	yyvs35: SPECIAL [INTERVAL [ISO8601_DATE_TIME]]
			-- Stack for semantic values of type INTERVAL [ISO8601_DATE_TIME]

	yyvsc35: INTEGER
			-- Capacity of semantic value stack `yyvs35'

	yyvsp35: INTEGER
			-- Top of semantic value stack `yyvs35'

	yyspecial_routines35: KL_SPECIAL_ROUTINES [INTERVAL [ISO8601_DATE_TIME]]
			-- Routines that ought to be in SPECIAL [INTERVAL [ISO8601_DATE_TIME]]

	yyvs36: SPECIAL [INTERVAL [ISO8601_DURATION]]
			-- Stack for semantic values of type INTERVAL [ISO8601_DURATION]

	yyvsc36: INTEGER
			-- Capacity of semantic value stack `yyvs36'

	yyvsp36: INTEGER
			-- Top of semantic value stack `yyvs36'

	yyspecial_routines36: KL_SPECIAL_ROUTINES [INTERVAL [ISO8601_DURATION]]
			-- Routines that ought to be in SPECIAL [INTERVAL [ISO8601_DURATION]]

feature {NONE} -- Constants

	yyFinal: INTEGER = 453
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 87
			-- Number of tokens

	yyLast: INTEGER = 622
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 330
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 165
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

	execute (in_text:STRING; a_source_start_line: INTEGER)
		do
			reset
			source_start_line := a_source_start_line

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

feature -- Access

	error_text: STRING

	output: C_COMPLEX_OBJECT
			
	assertion_list: ARRAYED_LIST [ASSERTION]

feature {NONE} -- Implementation

	check_c_attribute_child(an_attr: C_ATTRIBUTE; an_obj: C_OBJECT): BOOLEAN
			-- check a new child node
		require
			Attribute_exists: an_attr /= Void
			Object_exists: an_obj /= Void
		do
			if an_obj.occurrences.upper > 1 and not an_attr.is_multiple then
				raise_error
				report_error("attribute " + an_attr.rm_attribute_name + " must have cardinality > 1 for object with id " + 
							an_obj.node_id + " to have occurrences > 1")
				abort
			elseif an_obj.is_addressable and an_attr.has_child_with_id(an_obj.node_id) then
				raise_error
				report_error("attribute " + an_attr.rm_attribute_name + " already has child object with id " + an_obj.node_id)
				abort
			else
				Result := True
			end
		end

feature {NONE} -- Parse Tree

	object_nodes: ARRAYED_STACK [C_COMPLEX_OBJECT]
	complex_obj: C_COMPLEX_OBJECT

	c_attrs: ARRAYED_STACK [C_ATTRIBUTE]
	attr_node: C_ATTRIBUTE

	c_prim_obj: C_PRIMITIVE_OBJECT
	c_code_phrase_obj: C_CODE_PHRASE
	constraint_ref: CONSTRAINT_REF
	archetype_internal_ref: ARCHETYPE_INTERNAL_REF
	archetype_slot: ARCHETYPE_SLOT

	ordinal_node: C_DV_ORDINAL
	an_ordinal: ORDINAL
	scale_node: C_DV_SCALE
	a_scale: SCALE
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
	c_date: C_DATE
	c_integer:  C_INTEGER
	c_time: C_TIME
	c_date_time: C_DATE_TIME
	c_duration: C_DURATION

	cardinality: CARDINALITY
	cardinality_limit_pos_infinity: BOOLEAN

	rm_attribute_name: STRING
	occurrences: STRING
	c_occurrences_default: BOOLEAN

	invariant_expr: STRING

	time_vc: TIME_VALIDITY_CHECKER
	date_vc: DATE_VALIDITY_CHECKER

-------------- FOLLOWING TAKEN FROM DADL_VALIDATOR.Y ---------------
feature {NONE} -- Implementation 

	term: CODE_PHRASE
	a_uri: URI

	int_interval: INTERVAL [INTEGER]
	rl_interval: INTERVAL [REAL]

	integer_interval: INTERVAL [INTEGER]
	real_interval: INTERVAL [REAL]
	date_interval: INTERVAL [ISO8601_DATE]
	time_interval: INTERVAL [ISO8601_TIME]
	date_time_interval: INTERVAL [ISO8601_DATE_TIME]
	duration_interval: INTERVAL [ISO8601_DURATION]

	int_list: ARRAYED_LIST[INTEGER]
	real_list: ARRAYED_LIST[REAL]

	indent: STRING
	str: STRING

end
