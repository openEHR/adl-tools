indexing
	component:   "openEHR Archetype Project"
	description: "Validating parser for Archetype Description Language (ADL)"
	keywords:	 "ADL"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
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
		end

	yy_clear_value_stacks is
			-- Clear objects in semantic value stacks so that
			-- they can be collected by the garbage collector.
		do
			if yyvs1 /= Void then
				yyvs1.clear_all
			end
			if yyvs2 /= Void then
				yyvs2.clear_all
			end
			if yyvs3 /= Void then
				yyvs3.clear_all
			end
			if yyvs4 /= Void then
				yyvs4.clear_all
			end
			if yyvs5 /= Void then
				yyvs5.clear_all
			end
			if yyvs6 /= Void then
				yyvs6.clear_all
			end
			if yyvs7 /= Void then
				yyvs7.clear_all
			end
			if yyvs8 /= Void then
				yyvs8.clear_all
			end
			if yyvs9 /= Void then
				yyvs9.clear_all
			end
			if yyvs10 /= Void then
				yyvs10.clear_all
			end
			if yyvs11 /= Void then
				yyvs11.clear_all
			end
			if yyvs12 /= Void then
				yyvs12.clear_all
			end
			if yyvs13 /= Void then
				yyvs13.clear_all
			end
			if yyvs14 /= Void then
				yyvs14.clear_all
			end
			if yyvs15 /= Void then
				yyvs15.clear_all
			end
			if yyvs16 /= Void then
				yyvs16.clear_all
			end
			if yyvs17 /= Void then
				yyvs17.clear_all
			end
			if yyvs18 /= Void then
				yyvs18.clear_all
			end
			if yyvs19 /= Void then
				yyvs19.clear_all
			end
			if yyvs20 /= Void then
				yyvs20.clear_all
			end
			if yyvs21 /= Void then
				yyvs21.clear_all
			end
			if yyvs22 /= Void then
				yyvs22.clear_all
			end
			if yyvs23 /= Void then
				yyvs23.clear_all
			end
			if yyvs24 /= Void then
				yyvs24.clear_all
			end
			if yyvs25 /= Void then
				yyvs25.clear_all
			end
			if yyvs26 /= Void then
				yyvs26.clear_all
			end
			if yyvs27 /= Void then
				yyvs27.clear_all
			end
			if yyvs28 /= Void then
				yyvs28.clear_all
			end
			if yyvs29 /= Void then
				yyvs29.clear_all
			end
			if yyvs30 /= Void then
				yyvs30.clear_all
			end
			if yyvs31 /= Void then
				yyvs31.clear_all
			end
			if yyvs32 /= Void then
				yyvs32.clear_all
			end
			if yyvs33 /= Void then
				yyvs33.clear_all
			end
			if yyvs34 /= Void then
				yyvs34.clear_all
			end
			if yyvs35 /= Void then
				yyvs35.clear_all
			end
			if yyvs36 /= Void then
				yyvs36.clear_all
			end
			if yyvs37 /= Void then
				yyvs37.clear_all
			end
			if yyvs38 /= Void then
				yyvs38.clear_all
			end
			if yyvs39 /= Void then
				yyvs39.clear_all
			end
			if yyvs40 /= Void then
				yyvs40.clear_all
			end
			if yyvs41 /= Void then
				yyvs41.clear_all
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
				yyvs2.put (last_integer_value, yyvsp2)
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
				yyvs3.put (last_real_value, yyvsp3)
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
				yyvs4.put (last_string_value, yyvsp4)
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
			yyval9: SIBLING_ORDER
			yyval12: C_PRIMITIVE_OBJECT
			yyval13: C_PRIMITIVE
			yyval8: ARRAYED_LIST [ASSERTION]
			yyval14: EXPR_ITEM
			yyval10: OG_PATH
			yyval23: OG_PATH_ITEM
			yyval11: MULTIPLICITY_INTERVAL
			yyval15: CARDINALITY
			yyval2: INTEGER
			yyval4: STRING
			yyval24: ARRAYED_LIST [STRING]
			yyval25: ARRAYED_LIST [INTEGER]
			yyval36: INTERVAL [INTEGER]
			yyval3: REAL
			yyval26: ARRAYED_LIST [REAL]
			yyval37: INTERVAL [REAL]
			yyval16: BOOLEAN
			yyval17: ISO8601_DATE
			yyval39: INTERVAL [ISO8601_DATE]
			yyval19: ISO8601_TIME
			yyval38: INTERVAL [ISO8601_TIME]
			yyval18: ISO8601_DATE_TIME
			yyval40: INTERVAL [ISO8601_DATE_TIME]
			yyval20: ISO8601_DURATION
			yyval41: INTERVAL [ISO8601_DURATION]
		do
			inspect yy_act
when 1 then
--|#line 144 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 144")
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
--|#line 152 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 152")
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
--|#line 160 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 160")
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
--|#line 169 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 169")
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
--|#line 179 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 179")
end

			complex_obj.set_occurrences(yyvs11.item (yyvsp11))

			debug("ADL_parse")
				io.put_string(indent + "PUSH create OBJECT_NODE " + complex_obj.rm_type_name + 
						" [id=" + complex_obj.node_id + "]; occurrences=(" + yyvs11.item (yyvsp11).as_string + ")%N") 
				indent.append("%T")
			end
			
			object_nodes.extend(complex_obj)

			-- put it under current attribute, unless it is the root object, in which case it will be returned
			-- via the 'output' attribute of this parser
			if not c_attrs.is_empty then
				safe_put_c_attribute_child(c_attrs.item, complex_obj)
			end

			-- set root node to current node if not already set - guarantees it is set to outermost block
			if output = Void then
				output := object_nodes.item
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp11 := yyvsp11 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 6 then
--|#line 204 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 204")
end

			create complex_obj.make_anonymous(yyvs4.item (yyvsp4))
		
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
when 7 then
--|#line 208 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 208")
end

			create complex_obj.make_identified(yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 + 1
	yyvsp4 := yyvsp4 -2
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
--|#line 212 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 212")
end

			if differential_syntax then
				create complex_obj.make_identified(yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4))
				complex_obj.set_sibling_order(yyvs9.item (yyvsp9))
			else
				raise_error
				report_error(create_message("SDSF", Void))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 + 1
	yyvsp9 := yyvsp9 -1
	yyvsp4 := yyvsp4 -2
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
--|#line 225 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 225")
end

			yyval9 := create {SIBLING_ORDER}.make_after(yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp9 := yyvsp9 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
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
when 10 then
--|#line 229 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 229")
end

			yyval9 := create {SIBLING_ORDER}.make_before(yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp9 := yyvsp9 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
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
when 11 then
--|#line 235 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 235")
end

			debug("ADL_parse")
				io.put_string(indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + 
					" [id=" + object_nodes.item.node_id + "] - any_allowed%N") 
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 12 then
--|#line 242 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 242")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 13 then
--|#line 251 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 251")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 14 then
--|#line 254 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 254")
end

			safe_put_c_attribute_child(c_attrs.item, archetype_internal_ref)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 15 then
--|#line 258 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 258")
end

			safe_put_c_attribute_child(c_attrs.item, archetype_slot)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 16 then
--|#line 262 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 262")
end

			safe_put_c_attribute_child(c_attrs.item, constraint_ref)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 17 then
--|#line 266 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 266")
end

			safe_put_c_attribute_child(c_attrs.item, c_code_phrase_obj)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 18 then
--|#line 270 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 270")
end

			safe_put_c_attribute_child(c_attrs.item, ordinal_node)
			ordinal_node := Void
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 19 then
--|#line 275 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 275")
end

			safe_put_c_attribute_child(c_attrs.item, c_prim_obj)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp12 := yyvsp12 -1
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
--|#line 279 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 279")
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
when 21 then
--|#line 283 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 283")
end

			raise_error
			report_error(create_message("SDINV", <<dadl_parser_error>>))
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 22 then
--|#line 289 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 289")
end

			raise_error
			report_error(create_message("SCCOG", Void))
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 23 then
--|#line 297 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 297")
end

			create archetype_internal_ref.make(yyvs4.item (yyvsp4), yyvs10.item (yyvsp10).as_string)
			if not c_occurrences_default then
				archetype_internal_ref.set_occurrences(yyvs11.item (yyvsp11))
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

			if (c_attrs.item.is_multiple or c_attrs.item.child_count > 1) and not archetype_internal_ref.is_addressable and not yyvs10.item (yyvsp10).last.object_id.is_empty then
				archetype_internal_ref.set_node_id(yyvs10.item (yyvsp10).last.object_id)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp4 := yyvsp4 -1
	yyvsp11 := yyvsp11 -1
	yyvsp10 := yyvsp10 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 24 then
--|#line 319 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 319")
end

			raise_error
			report_error(create_message("SUNPA", Void))
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 25 then
--|#line 327 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 327")
end

			if yyvs8.item (yyvsp8 - 1) /= Void then
				archetype_slot.set_includes(yyvs8.item (yyvsp8 - 1))
			end
			if yyvs8.item (yyvsp8) /= Void then
				archetype_slot.set_excludes(yyvs8.item (yyvsp8))
			end

			debug("ADL_parse")
				io.put_string(indent + "POP ARCHETYPE_SLOT " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "]%N") 
				indent.remove_tail(1)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp1 := yyvsp1 -3
	yyvsp8 := yyvsp8 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 26 then
--|#line 343 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 343")
end

			archetype_slot.set_occurrences(yyvs11.item (yyvsp11))

			debug("ADL_parse")
				io.put_string(indent + "PUSH create ARCHETYPE_SLOT " + archetype_slot.rm_type_name + " [id=" + archetype_slot.node_id + "]; occurrences=(" + yyvs11.item (yyvsp11).as_string + ")%N") 
				indent.append("%T")
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp11 := yyvsp11 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 27 then
--|#line 354 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 354")
end

			create archetype_slot.make_anonymous(yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 28 then
--|#line 358 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 358")
end

			if differential_syntax then
				create archetype_slot.make_anonymous(yyvs4.item (yyvsp4))
				archetype_slot.set_sibling_order(yyvs9.item (yyvsp9))
			else
				raise_error
				report_error(create_message("SDSF", Void))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp9 := yyvsp9 -1
	yyvsp4 := yyvsp4 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 29 then
--|#line 369 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 369")
end

			create archetype_slot.make_identified(yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp4 := yyvsp4 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 30 then
--|#line 373 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 373")
end

			if differential_syntax then
				create archetype_slot.make_identified(yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4))
				archetype_slot.set_sibling_order(yyvs9.item (yyvsp9))
			else
				raise_error
				report_error(create_message("SDSF", Void))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp9 := yyvsp9 -1
	yyvsp4 := yyvsp4 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 31 then
--|#line 384 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 384")
end

			raise_error
			report_error(create_message("SUAS", Void))
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 32 then
--|#line 392 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 392")
end

			create c_prim_obj.make(yyvs13.item (yyvsp13))
			yyval12 := c_prim_obj
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp12 := yyvsp12 + 1
	yyvsp13 := yyvsp13 -1
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
when 33 then
--|#line 399 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 399")
end

			debug("ADL_parse")
				io.put_string(indent + "C_INTEGER: " +  c_integer.as_string + "%N")
			end
			yyval13 := c_integer
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp13 := yyvsp13 + 1
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
when 34 then
--|#line 406 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 406")
end

			debug("ADL_parse")
				io.put_string(indent + "C_REAL: " +  c_real.as_string + "%N")
			end
			yyval13 := c_real
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp13 := yyvsp13 + 1
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
when 35 then
--|#line 413 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 413")
end

			debug("ADL_parse")
				io.put_string(indent + "C_DATE: " +  c_date.as_string + "%N")
			end
			yyval13 := c_date
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp13 := yyvsp13 + 1
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
when 36 then
--|#line 420 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 420")
end

			debug("ADL_parse")
				io.put_string(indent + "C_TIME: " +  c_time.as_string + "%N")
			end
			yyval13 := c_time
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp13 := yyvsp13 + 1
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
when 37 then
--|#line 427 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 427")
end

			debug("ADL_parse")
				io.put_string(indent + "C_DATE_TIME: " +  c_date_time.as_string + "%N")
			end
			yyval13 := c_date_time
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp13 := yyvsp13 + 1
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
when 38 then
--|#line 434 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 434")
end

			debug("ADL_parse")
				io.put_string(indent + "C_DURATION: " +  c_duration.as_string + "%N")
			end
			yyval13 := c_duration
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp13 := yyvsp13 + 1
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
when 39 then
--|#line 441 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 441")
end

			debug("ADL_parse")
				io.put_string(indent + "C_STRING: " +  c_string.as_string + "%N")
			end
			yyval13 := c_string
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp13 := yyvsp13 + 1
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
when 40 then
--|#line 448 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 448")
end

			debug("ADL_parse")
				io.put_string(indent + "C_BOOLEAN: " +  c_boolean.as_string + "%N")
			end
			yyval13 := c_boolean
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp13 := yyvsp13 + 1
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
when 41 then
--|#line 457 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 457")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 42 then
--|#line 464 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 464")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 43 then
--|#line 467 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 467")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 44 then
--|#line 472 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 472")
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
when 45 then
--|#line 480 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 480")
end

			raise_error
			report_error(create_message("SCAS", Void))
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyvs1.put (yyval1, yyvsp1)
end
when 46 then
--|#line 488 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 488")
end

			rm_attribute_name := yyvs4.item (yyvsp4)

			if not object_nodes.item.has_attribute(rm_attribute_name) then
				create attr_node.make_single(rm_attribute_name)
				attr_node.set_existence(yyvs11.item (yyvsp11))
				c_attrs.put(attr_node)
				debug("ADL_parse")
					io.put_string(indent + "PUSH create SINGLE ATTR_NODE " + rm_attribute_name + " existence=(" + yyvs11.item (yyvsp11).as_string + ")%N") 
					io.put_string(indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_child(REL)%N") 
					indent.append("%T")
				end

				object_nodes.item.put_attribute(attr_node)
			else
				raise_error
				report_error(create_message("VCATU", <<rm_attribute_name>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp11 := yyvsp11 -1
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
when 47 then
--|#line 509 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 509")
end

			rm_attribute_name := yyvs4.item (yyvsp4)

			if not object_nodes.item.has_attribute(rm_attribute_name) then
				create attr_node.make_multiple(rm_attribute_name, yyvs15.item (yyvsp15))
				attr_node.set_existence(yyvs11.item (yyvsp11))
				c_attrs.put(attr_node)
				debug("ADL_parse")
					io.put_string(indent + "PUSH create MULTIPLE ATTR_NODE " + rm_attribute_name + " existence=(" + yyvs11.item (yyvsp11).as_string + "); cardinality=(" + yyvs15.item (yyvsp15).as_string + ")%N") 
					io.put_string(indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_child(REL)%N") 
					indent.append("%T")
				end

				object_nodes.item.put_attribute(attr_node)
			else
				raise_error
				report_error(create_message("VCATU", <<rm_attribute_name>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp11 := yyvsp11 -1
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
when 48 then
--|#line 530 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 530")
end

			rm_attribute_name := yyvs10.item (yyvsp10).last.attr_name
			yyvs10.item (yyvsp10).remove_last
			path_str := yyvs10.item (yyvsp10).as_string

			if not object_nodes.item.has_attribute(rm_attribute_name) then
				create attr_node.make_single(rm_attribute_name)
				attr_node.set_compressed_path(path_str)
				attr_node.set_existence(yyvs11.item (yyvsp11))
				c_attrs.put(attr_node)
				debug("ADL_parse")
					io.put_string(indent + "PUSH create SINGLE ATTR_NODE " + path_str + " existence=(" + yyvs11.item (yyvsp11).as_string + ")%N") 
					io.put_string(indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_child(REL)%N") 
					indent.append("%T")
				end

				object_nodes.item.put_attribute(attr_node)
			else
				raise_error
				report_error(create_message("VCATU", <<path_str>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 + 1
	yyvsp10 := yyvsp10 -1
	yyvsp11 := yyvsp11 -1
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
when 49 then
--|#line 554 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 554")
end

			rm_attribute_name := yyvs10.item (yyvsp10).last.attr_name
			yyvs10.item (yyvsp10).remove_last
			path_str := yyvs10.item (yyvsp10).as_string

			if not object_nodes.item.has_attribute(rm_attribute_name) then
				create attr_node.make_multiple(rm_attribute_name, yyvs15.item (yyvsp15))
				attr_node.set_existence(yyvs11.item (yyvsp11))
				attr_node.set_compressed_path(path_str)
				c_attrs.put(attr_node)
				debug("ADL_parse")
					io.put_string(indent + "PUSH create MULTIPLE ATTR_NODE " + path_str + " existence=(" + yyvs11.item (yyvsp11).as_string + "); cardinality=(" + yyvs15.item (yyvsp15).as_string + ")%N") 
					io.put_string(indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_child(REL)%N") 
					indent.append("%T")
				end

				object_nodes.item.put_attribute(attr_node)
			else
				raise_error
				report_error(create_message("VCATU", <<path_str>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 + 1
	yyvsp10 := yyvsp10 -1
	yyvsp11 := yyvsp11 -1
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
when 50 then
--|#line 580 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 580")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 51 then
--|#line 583 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 583")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 52 then
--|#line 586 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 586")
end

			debug("ADL_parse")
				io.put_string(indent + "ATTR_NODE " + attr_node.rm_attribute_name + "  - any_allowed%N") 
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
when 54 then
--|#line 596 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 596")
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
when 55 then
--|#line 606 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 606")
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
when 56 then
--|#line 607 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 607")
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
when 57 then
--|#line 621 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 621")
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
when 58 then
--|#line 628 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 628")
end

			assertion_list.extend(assertion)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs8.put (yyval8, yyvsp8)
end
when 59 then
--|#line 634 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 634")
end

			create assertion.make(yyvs14.item (yyvsp14), yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp4 := yyvsp4 -1
	yyvsp14 := yyvsp14 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 60 then
--|#line 638 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 638")
end

			create assertion.make(yyvs14.item (yyvsp14), Void)
		
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
when 61 then
--|#line 642 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 642")
end

			raise_error
			report_error(create_message("SINVS", <<yyvs4.item (yyvsp4)>>))
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 62 then
--|#line 652 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 652")
end

			yyval14 := yyvs14.item (yyvsp14)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs14.put (yyval14, yyvsp14)
end
when 63 then
--|#line 656 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 656")
end

			yyval14 := yyvs14.item (yyvsp14)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs14.put (yyval14, yyvsp14)
end
when 64 then
--|#line 662 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 662")
end

			debug("ADL_invariant")
				io.put_string(indent + "Exists " + yyvs10.item (yyvsp10).as_string + "%N") 
			end
			create expr_unary_operator.make(create {OPERATOR_KIND}.make(op_exists))
			create expr_leaf.make_archetype_definition_ref(yyvs10.item (yyvsp10).as_string)
			expr_unary_operator.set_operand(expr_leaf)
			yyval14 := expr_unary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp14 := yyvsp14 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp10 := yyvsp10 -1
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
when 65 then
--|#line 672 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 672")
end

			raise_error
			report_error(create_message("SEXPT", Void))
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp14 := yyvsp14 + 1
	yyvsp1 := yyvsp1 -2
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
when 66 then
--|#line 678 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 678")
end

			debug("ADL_invariant")
				io.put_string(indent + "Archetype feature matches {" + yyvs13.item (yyvsp13).as_string + "}%N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_matches))
			expr_binary_operator.set_left_operand(create {EXPR_LEAF}.make_archetype_ref(yyvs10.item (yyvsp10).as_string))
			expr_binary_operator.set_right_operand(create {EXPR_LEAF}.make_constraint(yyvs13.item (yyvsp13)))
			yyval14 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp14 := yyvsp14 + 1
	yyvsp10 := yyvsp10 -1
	yyvsp1 := yyvsp1 -3
	yyvsp13 := yyvsp13 -1
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
when 67 then
--|#line 688 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 688")
end

			debug("ADL_invariant")
				io.put_string(indent + "NOT bool_leaf %N") 
			end
			create expr_unary_operator.make(create {OPERATOR_KIND}.make(op_not))
			expr_unary_operator.set_operand(yyvs14.item (yyvsp14))
			yyval14 := expr_unary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs14.put (yyval14, yyvsp14)
end
when 68 then
--|#line 697 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 697")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_expr = arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_eq))
			expr_binary_operator.set_left_operand(yyvs14.item (yyvsp14 - 1))
			expr_binary_operator.set_right_operand(yyvs14.item (yyvsp14))
			yyval14 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp14 := yyvsp14 -1
	yyvsp1 := yyvsp1 -1
	yyvs14.put (yyval14, yyvsp14)
end
when 69 then
--|#line 707 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 707")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_expr != arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_ne))
			expr_binary_operator.set_left_operand(yyvs14.item (yyvsp14 - 1))
			expr_binary_operator.set_right_operand(yyvs14.item (yyvsp14))
			yyval14 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp14 := yyvsp14 -1
	yyvsp1 := yyvsp1 -1
	yyvs14.put (yyval14, yyvsp14)
end
when 70 then
--|#line 717 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 717")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_expr < arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_lt))
			expr_binary_operator.set_left_operand(yyvs14.item (yyvsp14 - 1))
			expr_binary_operator.set_right_operand(yyvs14.item (yyvsp14))
			yyval14 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp14 := yyvsp14 -1
	yyvsp1 := yyvsp1 -1
	yyvs14.put (yyval14, yyvsp14)
end
when 71 then
--|#line 727 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 727")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_expr > arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_gt))
			expr_binary_operator.set_left_operand(yyvs14.item (yyvsp14 - 1))
			expr_binary_operator.set_right_operand(yyvs14.item (yyvsp14))
			yyval14 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp14 := yyvsp14 -1
	yyvsp1 := yyvsp1 -1
	yyvs14.put (yyval14, yyvsp14)
end
when 72 then
--|#line 737 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 737")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_expr <= arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_le))
			expr_binary_operator.set_left_operand(yyvs14.item (yyvsp14 - 1))
			expr_binary_operator.set_right_operand(yyvs14.item (yyvsp14))
			yyval14 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp14 := yyvsp14 -1
	yyvsp1 := yyvsp1 -1
	yyvs14.put (yyval14, yyvsp14)
end
when 73 then
--|#line 747 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 747")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_expr >= arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_ge))
			expr_binary_operator.set_left_operand(yyvs14.item (yyvsp14 - 1))
			expr_binary_operator.set_right_operand(yyvs14.item (yyvsp14))
			yyval14 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp14 := yyvsp14 -1
	yyvsp1 := yyvsp1 -1
	yyvs14.put (yyval14, yyvsp14)
end
when 74 then
--|#line 757 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 757")
end

			debug("ADL_invariant")
				io.put_string(indent + "bool_expr AND bool_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_and))
			expr_binary_operator.set_left_operand(yyvs14.item (yyvsp14 - 1))
			expr_binary_operator.set_right_operand(yyvs14.item (yyvsp14))
			yyval14 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp14 := yyvsp14 -1
	yyvsp1 := yyvsp1 -1
	yyvs14.put (yyval14, yyvsp14)
end
when 75 then
--|#line 767 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 767")
end

			debug("ADL_invariant")
				io.put_string(indent + "bool_expr OR bool_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_or))
			expr_binary_operator.set_left_operand(yyvs14.item (yyvsp14 - 1))
			expr_binary_operator.set_right_operand(yyvs14.item (yyvsp14))
			yyval14 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp14 := yyvsp14 -1
	yyvsp1 := yyvsp1 -1
	yyvs14.put (yyval14, yyvsp14)
end
when 76 then
--|#line 777 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 777")
end

			debug("ADL_invariant")
				io.put_string(indent + "bool_expr XOR bool_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_xor))
			expr_binary_operator.set_left_operand(yyvs14.item (yyvsp14 - 1))
			expr_binary_operator.set_right_operand(yyvs14.item (yyvsp14))
			yyval14 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp14 := yyvsp14 -1
	yyvsp1 := yyvsp1 -1
	yyvs14.put (yyval14, yyvsp14)
end
when 77 then
--|#line 787 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 787")
end

			debug("ADL_invariant")
				io.put_string(indent + "bool_expr IMPLIES bool_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_implies))
			expr_binary_operator.set_left_operand(yyvs14.item (yyvsp14 - 1))
			expr_binary_operator.set_right_operand(yyvs14.item (yyvsp14))
			yyval14 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp14 := yyvsp14 -1
	yyvsp1 := yyvsp1 -1
	yyvs14.put (yyval14, yyvsp14)
end
when 78 then
--|#line 799 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 799")
end

			yyval14 := yyvs14.item (yyvsp14)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs14.put (yyval14, yyvsp14)
end
when 79 then
--|#line 803 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 803")
end

			create expr_leaf.make_boolean(True)
			yyval14 := expr_leaf
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp1 := yyvsp1 -1
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
when 80 then
--|#line 808 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 808")
end

			create expr_leaf.make_boolean(False)
			yyval14 := expr_leaf
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp1 := yyvsp1 -1
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
when 81 then
--|#line 815 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 815")
end

			yyval14 := yyvs14.item (yyvsp14)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs14.put (yyval14, yyvsp14)
end
when 82 then
--|#line 819 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 819")
end

			yyval14 := yyvs14.item (yyvsp14)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs14.put (yyval14, yyvsp14)
end
when 83 then
--|#line 825 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 825")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_expr + arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_plus))
			expr_binary_operator.set_left_operand(yyvs14.item (yyvsp14 - 1))
			expr_binary_operator.set_right_operand(yyvs14.item (yyvsp14))
			yyval14 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp14 := yyvsp14 -1
	yyvsp1 := yyvsp1 -1
	yyvs14.put (yyval14, yyvsp14)
end
when 84 then
--|#line 835 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 835")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_expr - arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_minus))
			expr_binary_operator.set_left_operand(yyvs14.item (yyvsp14 - 1))
			expr_binary_operator.set_right_operand(yyvs14.item (yyvsp14))
			yyval14 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp14 := yyvsp14 -1
	yyvsp1 := yyvsp1 -1
	yyvs14.put (yyval14, yyvsp14)
end
when 85 then
--|#line 845 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 845")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_expr * arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_multiply))
			expr_binary_operator.set_left_operand(yyvs14.item (yyvsp14 - 1))
			expr_binary_operator.set_right_operand(yyvs14.item (yyvsp14))
			yyval14 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp14 := yyvsp14 -1
	yyvsp1 := yyvsp1 -1
	yyvs14.put (yyval14, yyvsp14)
end
when 86 then
--|#line 855 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 855")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_expr / arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_divide))
			expr_binary_operator.set_left_operand(yyvs14.item (yyvsp14 - 1))
			expr_binary_operator.set_right_operand(yyvs14.item (yyvsp14))
			yyval14 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp14 := yyvsp14 -1
	yyvsp1 := yyvsp1 -1
	yyvs14.put (yyval14, yyvsp14)
end
when 87 then
--|#line 865 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 865")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_expr ^ arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_exp))
			expr_binary_operator.set_left_operand(yyvs14.item (yyvsp14 - 1))
			expr_binary_operator.set_right_operand(yyvs14.item (yyvsp14))
			yyval14 := expr_binary_operator
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp14 := yyvsp14 -1
	yyvsp1 := yyvsp1 -1
	yyvs14.put (yyval14, yyvsp14)
end
when 88 then
--|#line 877 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 877")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_leaf - (expr) %N") 
			end
			yyval14 := yyvs14.item (yyvsp14)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs14.put (yyval14, yyvsp14)
end
when 89 then
--|#line 884 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 884")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_leaf - integer: " + yyvs2.item (yyvsp2).out + "%N") 
			end
			create expr_leaf.make_integer(yyvs2.item (yyvsp2))
			yyval14 := expr_leaf
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp2 := yyvsp2 -1
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
when 90 then
--|#line 892 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 892")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_leaf - real: " + yyvs3.item (yyvsp3).out + "%N") 
			end
			create expr_leaf.make_real(yyvs3.item (yyvsp3))
			yyval14 := expr_leaf
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp3 := yyvsp3 -1
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
when 91 then
--|#line 900 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 900")
end

			debug("ADL_invariant")
				io.put_string(indent + "arith_leaf - path: " + yyvs10.item (yyvsp10).as_string + "%N") 
			end
			create expr_leaf.make_archetype_definition_ref(yyvs10.item (yyvsp10).as_string)
			yyval14 := expr_leaf
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp10 := yyvsp10 -1
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
when 92 then
--|#line 915 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 915")
end

			create yyval10.make_root
			debug("OG_PATH_parse")
				io.put_string("....absolute_path (root); %N")
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp10 := yyvsp10 + 1
	yyvsp1 := yyvsp1 -1
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
when 93 then
--|#line 922 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 922")
end

			yyval10 := yyvs10.item (yyvsp10)
			yyval10.set_absolute
			debug("OG_PATH_parse")
				io.put_string("....absolute_path; %N")
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs10.put (yyval10, yyvsp10)
end
when 94 then
--|#line 930 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 930")
end

			yyval10 := yyvs10.item (yyvsp10 - 1)
			yyval10.append_path(yyvs10.item (yyvsp10))
			debug("OG_PATH_parse")
				io.put_string("....absolute_path (appended relative path); %N")
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp10 := yyvsp10 -1
	yyvsp1 := yyvsp1 -1
	yyvs10.put (yyval10, yyvsp10)
end
when 95 then
--|#line 940 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 940")
end

			create yyval10.make_relative(yyvs23.item (yyvsp23))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp10 := yyvsp10 + 1
	yyvsp23 := yyvsp23 -1
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
when 96 then
--|#line 944 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 944")
end

			yyval10 := yyvs10.item (yyvsp10)
			yyval10.append_segment(yyvs23.item (yyvsp23))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp23 := yyvsp23 -1
	yyvs10.put (yyval10, yyvsp10)
end
when 97 then
--|#line 951 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 951")
end

			create yyval23.make_with_object_id(yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4))
			debug("OG_PATH_parse")
				io.put_string("...path_segment: " + yyvs4.item (yyvsp4 - 1) + "[" + yyvs4.item (yyvsp4) + "]%N")
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp23 := yyvsp23 + 1
	yyvsp4 := yyvsp4 -2
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
when 98 then
--|#line 958 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 958")
end

			create yyval23.make(yyvs4.item (yyvsp4))
			debug("OG_PATH_parse")
				io.put_string("...path_segment: " + yyvs4.item (yyvsp4) + "%N")
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp23 := yyvsp23 + 1
	yyvsp4 := yyvsp4 -1
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
when 99 then
--|#line 974 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 974")
end

			multiplicity_interval := default_existence
			yyval11 := multiplicity_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp11 := yyvsp11 + 1
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
when 100 then
--|#line 979 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 979")
end

			yyval11 := multiplicity_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp11 := yyvsp11 + 1
	yyvsp1 := yyvsp1 -5
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
when 101 then
--|#line 985 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 985")
end

			if yyvs2.item (yyvsp2) = 0 then
				create multiplicity_interval.make_point(0)
			elseif yyvs2.item (yyvsp2) = 1 then
				create multiplicity_interval.make_point(1)
			else
				raise_error
				report_error(create_message("SEXLSG", Void))
				abort
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
when 102 then
--|#line 997 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 997")
end

			if yyvs2.item (yyvsp2 - 1) = 0 then
				if yyvs2.item (yyvsp2) = 0 then
					create multiplicity_interval.make_point(0)
				elseif yyvs2.item (yyvsp2) = 1 then
					create multiplicity_interval.make_bounded(0, 1, True, True)
				else
					raise_error
					report_error(create_message("SEXLU1", Void))
					abort
				end
			elseif yyvs2.item (yyvsp2 - 1) = 1 then
				if yyvs2.item (yyvsp2) = 1 then
					create multiplicity_interval.make_point(1)
				else
					raise_error
					report_error(create_message("SEXLU2", Void))
					abort
				end
			else
				raise_error
				report_error(create_message("SEXLMG", Void))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 103 then
--|#line 1025 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1025")
end

			yyval15 := a_cardinality
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp15 := yyvsp15 + 1
	yyvsp1 := yyvsp1 -5
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
when 104 then
--|#line 1031 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1031")
end

			create a_cardinality.make(multiplicity_interval)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp11 := yyvsp11 -1
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
--|#line 1035 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1035")
end

			create a_cardinality.make(multiplicity_interval)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp11 := yyvsp11 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 106 then
--|#line 1039 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1039")
end

			create a_cardinality.make(multiplicity_interval)
			a_cardinality.set_unordered
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp11 := yyvsp11 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 107 then
--|#line 1044 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1044")
end

			create a_cardinality.make(multiplicity_interval)
			a_cardinality.set_unique
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp11 := yyvsp11 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 108 then
--|#line 1049 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1049")
end

			create a_cardinality.make(multiplicity_interval)
			a_cardinality.set_unique
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp11 := yyvsp11 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 109 then
--|#line 1054 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1054")
end

			create a_cardinality.make(multiplicity_interval)
			a_cardinality.set_unique
			a_cardinality.set_unordered
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp11 := yyvsp11 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 110 then
--|#line 1060 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1060")
end

			create a_cardinality.make(multiplicity_interval)
			a_cardinality.set_unique
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp11 := yyvsp11 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 111 then
--|#line 1065 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1065")
end

			create a_cardinality.make(multiplicity_interval)
			a_cardinality.set_unique
			a_cardinality.set_unordered
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp11 := yyvsp11 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 112 then
--|#line 1073 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1073")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 113 then
--|#line 1077 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1077")
end

			cardinality_limit_pos_infinity := True
		
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
when 114 then
--|#line 1083 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1083")
end

			multiplicity_interval := default_occurrences
			yyval11 := multiplicity_interval
			c_occurrences_default := True
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp11 := yyvsp11 + 1
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
when 115 then
--|#line 1089 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1089")
end

			yyval11 := yyvs11.item (yyvsp11)
			c_occurrences_default := False
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyvs11.put (yyval11, yyvsp11)
end
when 116 then
--|#line 1094 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1094")
end

			raise_error
			report_error(create_message("SOCCF", Void))
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp11 := yyvsp11 + 1
	yyvsp1 := yyvsp1 -2
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
when 117 then
--|#line 1102 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1102")
end

			if not cardinality_limit_pos_infinity then
				create multiplicity_interval.make_point(yyvs2.item (yyvsp2))
			else
				create multiplicity_interval.make_upper_unbounded(0, True)
				cardinality_limit_pos_infinity := False
			end
			yyval11 := multiplicity_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp11 := yyvsp11 + 1
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
when 118 then
--|#line 1112 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1112")
end

			if cardinality_limit_pos_infinity then
				create multiplicity_interval.make_upper_unbounded(yyvs2.item (yyvsp2 - 1), True)
				cardinality_limit_pos_infinity := False
			else
				create multiplicity_interval.make_bounded(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), True, True)
			end
			yyval11 := multiplicity_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp11 := yyvsp11 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp1 := yyvsp1 -1
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
when 119 then
--|#line 1126 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1126")
end

			create int_interval.make_point(yyvs2.item (yyvsp2))
			create c_integer.make_interval(int_interval)
		
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
when 120 then
--|#line 1131 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1131")
end

			create c_integer.make_list(yyvs25.item (yyvsp25))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp25 := yyvsp25 -1
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
when 121 then
--|#line 1135 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1135")
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
	yyvsp36 := yyvsp36 -1
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
when 122 then
--|#line 1151 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1151")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 123 then
--|#line 1152 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1152")
end

			if c_integer.valid_value(yyvs2.item (yyvsp2)) then
				c_integer.set_assumed_value(yyvs2.item (yyvsp2))
			else
				raise_error
				report_error(create_message("VOBAV", <<yyvs2.item (yyvsp2).out>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 124 then
--|#line 1162 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1162")
end

			raise_error
			report_error(create_message("SCIAV", Void))
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 125 then
--|#line 1170 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1170")
end

			create rl_interval.make_point(yyvs3.item (yyvsp3))
			create c_real.make_interval(rl_interval)
		
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
when 126 then
--|#line 1175 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1175")
end

			create c_real.make_list(yyvs26.item (yyvsp26))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp26 := yyvsp26 -1
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
when 127 then
--|#line 1179 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1179")
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
	yyvsp37 := yyvsp37 -1
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
when 128 then
--|#line 1195 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1195")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 129 then
--|#line 1196 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1196")
end

			if c_real.valid_value(yyvs3.item (yyvsp3)) then
				c_real.set_assumed_value(yyvs3.item (yyvsp3))
			else
				raise_error
				report_error(create_message("VOBAV", <<yyvs3.item (yyvsp3).out>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 130 then
--|#line 1206 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1206")
end

			raise_error
			report_error(create_message("SCRAV", Void))
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 131 then
--|#line 1214 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1214")
end

			if valid_iso8601_date_constraint_pattern(yyvs4.item (yyvsp4)) then
				create c_date.make_from_pattern(yyvs4.item (yyvsp4))
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
				report_error(create_message("SCDPT", <<str>>))
				abort
			end
		
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
when 132 then
--|#line 1237 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1237")
end

			create date_interval.make_point(yyvs17.item (yyvsp17))
			create c_date.make_interval(date_interval)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
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
when 133 then
--|#line 1242 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1242")
end

			create c_date.make_interval(date_interval)
		
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
when 134 then
--|#line 1248 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1248")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 135 then
--|#line 1249 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1249")
end

			if c_date.valid_value(yyvs17.item (yyvsp17)) then
				c_date.set_assumed_value(yyvs17.item (yyvsp17))
			else
				raise_error
				report_error(create_message("VOBAV", <<yyvs17.item (yyvsp17).out>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp17 := yyvsp17 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 136 then
--|#line 1259 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1259")
end

			raise_error
			report_error(create_message("SCDAV", Void))
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 137 then
--|#line 1267 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1267")
end

			if valid_iso8601_time_constraint_pattern(yyvs4.item (yyvsp4)) then
				create c_time.make_from_pattern(yyvs4.item (yyvsp4))
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
				report_error(create_message("SCTPT", <<str>>))
				abort
			end
		
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
when 138 then
--|#line 1290 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1290")
end

			create time_interval.make_point(yyvs19.item (yyvsp19))
			create c_time.make_interval(time_interval)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp19 := yyvsp19 -1
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
when 139 then
--|#line 1295 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1295")
end

			create c_time.make_interval(time_interval)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp38 := yyvsp38 -1
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
when 140 then
--|#line 1301 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1301")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 141 then
--|#line 1302 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1302")
end

			if c_time.valid_value(yyvs19.item (yyvsp19)) then
				c_time.set_assumed_value(yyvs19.item (yyvsp19))
			else
				raise_error
				report_error(create_message("VOBAV", <<yyvs19.item (yyvsp19).out>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp19 := yyvsp19 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 142 then
--|#line 1312 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1312")
end

			raise_error
			report_error(create_message("SCTAV", Void))
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 143 then
--|#line 1320 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1320")
end

			if valid_iso8601_date_time_constraint_pattern(yyvs4.item (yyvsp4)) then
				create c_date_time.make_from_pattern(yyvs4.item (yyvsp4))
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
				report_error(create_message("SCDTPT", <<str>>))
				abort
			end
		
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
when 144 then
--|#line 1343 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1343")
end

			create date_time_interval.make_point(yyvs18.item (yyvsp18))
			create c_date_time.make_interval(date_time_interval)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp18 := yyvsp18 -1
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
when 145 then
--|#line 1348 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1348")
end

			create c_date_time.make_interval(date_time_interval)
		
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
when 146 then
--|#line 1354 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1354")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 147 then
--|#line 1355 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1355")
end

			if c_date_time.valid_value(yyvs18.item (yyvsp18)) then
				c_date_time.set_assumed_value(yyvs18.item (yyvsp18))
			else
				raise_error
				report_error(create_message("VOBAV", <<yyvs18.item (yyvsp18).out>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp18 := yyvsp18 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 148 then
--|#line 1365 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1365")
end

			raise_error
			report_error(create_message("SCDTAV", Void))
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 149 then
--|#line 1373 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1373")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 150 then
--|#line 1374 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1374")
end

			create c_duration.make_pattern_with_interval (c_duration.pattern, duration_interval)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp41 := yyvsp41 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 151 then
--|#line 1378 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1378")
end

			create duration_interval.make_point(yyvs20.item (yyvsp20))
			create c_duration.make_interval(duration_interval)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp20 := yyvsp20 -1
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
when 152 then
--|#line 1383 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1383")
end

			create c_duration.make_interval(duration_interval)
		
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
when 153 then
--|#line 1389 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1389")
end

			if valid_iso8601_duration_constraint_pattern (yyvs4.item (yyvsp4)) then
				create c_duration.make_from_pattern (yyvs4.item (yyvsp4))
			else
				raise_error
				report_error(create_message("SCDUPT", Void))
				abort
			end
		
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
when 154 then
--|#line 1401 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1401")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 155 then
--|#line 1402 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1402")
end

			if c_duration.valid_value(yyvs20.item (yyvsp20)) then
				c_duration.set_assumed_value(yyvs20.item (yyvsp20))
			else
				raise_error
				report_error(create_message("VOBAV", <<yyvs20.item (yyvsp20).out>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp20 := yyvsp20 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 156 then
--|#line 1412 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1412")
end

			raise_error
			report_error(create_message("SCDUAV", Void))
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 157 then
--|#line 1420 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1420")
end

			create string_list.make(0)
			string_list.extend(yyvs4.item (yyvsp4))
			create c_string.make_from_string_list(string_list)
			string_list := Void
		
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
when 158 then
--|#line 1427 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1427")
end

			create c_string.make_from_string_list(yyvs24.item (yyvsp24))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp24 := yyvsp24 -1
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
when 159 then
--|#line 1431 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1431")
end

			create c_string.make_from_string_list(yyvs24.item (yyvsp24))
			c_string.set_open
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp24 := yyvsp24 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 160 then
--|#line 1436 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1436")
end

			create c_string.make_from_regexp(yyvs4.item (yyvsp4).substring (2, yyvs4.item (yyvsp4).count - 1), yyvs4.item (yyvsp4).item(1) = '/')
			if c_string.regexp.is_equal(c_string.regexp_compile_error) then
				raise_error
				report_error(create_message("SCSRE", <<yyvs4.item (yyvsp4)>>))
				abort
			end
		
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
when 161 then
--|#line 1447 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1447")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 162 then
--|#line 1448 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1448")
end

			if c_string.valid_value(yyvs4.item (yyvsp4)) then
				c_string.set_assumed_value(yyvs4.item (yyvsp4))
			else
				raise_error
				report_error(create_message("VOBAV", <<yyvs4.item (yyvsp4).out>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 163 then
--|#line 1458 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1458")
end

			raise_error
			report_error(create_message("SCSAV", Void))
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 164 then
--|#line 1466 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1466")
end

			create c_boolean.make_true
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 165 then
--|#line 1470 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1470")
end

			create c_boolean.make_false
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 166 then
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
when 167 then
--|#line 1478 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1478")
end

			create c_boolean.make_true_false
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 168 then
--|#line 1484 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1484")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 169 then
--|#line 1485 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1485")
end

			if c_boolean.valid_value(yyvs16.item (yyvsp16)) then
				c_boolean.set_assumed_value(yyvs16.item (yyvsp16))
			else
				raise_error
				report_error(create_message("VOBAV", <<yyvs16.item (yyvsp16).out>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp16 := yyvsp16 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 170 then
--|#line 1495 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1495")
end

			raise_error
			report_error(create_message("SCBAV", Void))
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 171 then
--|#line 1503 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1503")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 172 then
--|#line 1504 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1504")
end

			if ordinal_node.has_item (yyvs2.item (yyvsp2)) then
				ordinal_node.set_assumed_value_from_integer (yyvs2.item (yyvsp2))
			else
				raise_error
				report_error(create_message("VOBAVL", <<yyvs2.item (yyvsp2).out>>))
				abort
			end
 		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 173 then
--|#line 1514 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1514")
end

 			raise_error
			report_error(create_message("SCOAV", Void))
 			abort
 		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 174 then
--|#line 1522 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1522")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 175 then
--|#line 1523 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1523")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 176 then
--|#line 1526 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1526")
end

			if ordinal_node = Void then
				create ordinal_node.make
			end

			create a_code_phrase.make_from_string (yyvs4.item (yyvsp4))
			create an_ordinal.make (yyvs2.item (yyvsp2), a_code_phrase)

			if ordinal_node.has_item (yyvs2.item (yyvsp2)) then
				raise_error
				report_error(create_message("VCOV", <<yyvs2.item (yyvsp2).out>>))
				abort
			elseif ordinal_node.has_code_phrase (a_code_phrase) then
				raise_error
				report_error(create_message("VCOC", <<yyvs4.item (yyvsp4)>>))
				abort
			else
				ordinal_node.add_item (an_ordinal)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp4 := yyvsp4 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 177 then
--|#line 1549 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1549")
end

			create c_code_phrase_obj

			if c_code_phrase_obj.valid_pattern (yyvs4.item (yyvsp4)) then
				c_code_phrase_obj.make_from_pattern (yyvs4.item (yyvsp4))
			else
				raise_error
				report_error(create_message("SCPCV", <<c_code_phrase_obj.fail_reason>>))
				abort
			end
		
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
when 178 then
--|#line 1561 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1561")
end

			create c_code_phrase_obj.make_from_pattern(yyvs4.item (yyvsp4))
		
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
when 179 then
--|#line 1567 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1567")
end

			create constraint_ref.make(yyvs4.item (yyvsp4))
		
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
when 180 then
--|#line 1573 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1573")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs4.put (yyval4, yyvsp4)
end
when 181 then
--|#line 1577 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1577")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs4.put (yyval4, yyvsp4)
end
when 182 then
--|#line 1589 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1589")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs4.put (yyval4, yyvsp4)
end
when 183 then
--|#line 1593 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1593")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs4.put (yyval4, yyvsp4)
end
when 184 then
--|#line 1597 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1597")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs4.put (yyval4, yyvsp4)
end
when 185 then
--|#line 1601 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1601")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs4.put (yyval4, yyvsp4)
end
when 186 then
--|#line 1607 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1607")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs4.put (yyval4, yyvsp4)
end
when 187 then
--|#line 1613 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1613")
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
when 188 then
--|#line 1619 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1619")
end

			yyvs24.item (yyvsp24).extend(yyvs4.item (yyvsp4))
			yyval24 := yyvs24.item (yyvsp24)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyvs24.put (yyval24, yyvsp24)
end
when 189 then
--|#line 1624 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1624")
end

			create yyval24.make(0)
			yyval24.extend(yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp24 := yyvsp24 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -2
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
when 190 then
--|#line 1631 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1631")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 191 then
--|#line 1634 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1634")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs2.put (yyval2, yyvsp2)
end
when 192 then
--|#line 1637 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1637")
end

			yyval2 := - yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs2.put (yyval2, yyvsp2)
end
when 193 then
--|#line 1642 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1642")
end

			create yyval25.make(0)
			yyval25.extend(yyvs2.item (yyvsp2 - 1))
			yyval25.extend(yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp25 := yyvsp25 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp25 >= yyvsc25 then
		if yyvs25 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs25")
			end
			create yyspecial_routines25
			yyvsc25 := yyInitial_yyvs_size
			yyvs25 := yyspecial_routines25.make (yyvsc25)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs25")
			end
			yyvsc25 := yyvsc25 + yyInitial_yyvs_size
			yyvs25 := yyspecial_routines25.resize (yyvs25, yyvsc25)
		end
	end
	yyvs25.put (yyval25, yyvsp25)
end
when 194 then
--|#line 1648 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1648")
end

			yyvs25.item (yyvsp25).extend(yyvs2.item (yyvsp2))
			yyval25 := yyvs25.item (yyvsp25)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyvs25.put (yyval25, yyvsp25)
end
when 195 then
--|#line 1653 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1653")
end

			create yyval25.make(0)
			yyval25.extend(yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp25 := yyvsp25 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp25 >= yyvsc25 then
		if yyvs25 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs25")
			end
			create yyspecial_routines25
			yyvsc25 := yyInitial_yyvs_size
			yyvs25 := yyspecial_routines25.make (yyvsc25)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs25")
			end
			yyvsc25 := yyvsc25 + yyInitial_yyvs_size
			yyvs25 := yyspecial_routines25.resize (yyvs25, yyvsc25)
		end
	end
	yyvs25.put (yyval25, yyvsp25)
end
when 196 then
--|#line 1660 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1660")
end

			if yyvs2.item (yyvsp2 - 1) <= yyvs2.item (yyvsp2) then
				create integer_interval.make_bounded(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), True, True)
				yyval36 := integer_interval
			else
				raise_error
				report_error(create_message("VIVLO", <<yyvs2.item (yyvsp2 - 1).out, yyvs2.item (yyvsp2).out>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp36 := yyvsp36 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -2
	if yyvsp36 >= yyvsc36 then
		if yyvs36 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs36")
			end
			create yyspecial_routines36
			yyvsc36 := yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.make (yyvsc36)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs36")
			end
			yyvsc36 := yyvsc36 + yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.resize (yyvs36, yyvsc36)
		end
	end
	yyvs36.put (yyval36, yyvsp36)
end
when 197 then
--|#line 1671 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1671")
end

			if yyvs2.item (yyvsp2 - 1) <= yyvs2.item (yyvsp2) then
				create integer_interval.make_bounded(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), False, True)
				yyval36 := integer_interval
			else
				raise_error
				report_error(create_message("VIVLO", <<yyvs2.item (yyvsp2 - 1).out, yyvs2.item (yyvsp2).out>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp36 := yyvsp36 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp2 := yyvsp2 -2
	if yyvsp36 >= yyvsc36 then
		if yyvs36 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs36")
			end
			create yyspecial_routines36
			yyvsc36 := yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.make (yyvsc36)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs36")
			end
			yyvsc36 := yyvsc36 + yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.resize (yyvs36, yyvsc36)
		end
	end
	yyvs36.put (yyval36, yyvsp36)
end
when 198 then
--|#line 1682 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1682")
end

			if yyvs2.item (yyvsp2 - 1) <= yyvs2.item (yyvsp2) then
				create integer_interval.make_bounded(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), True, False)
				yyval36 := integer_interval
			else
				raise_error
				report_error(create_message("VIVLO", <<yyvs2.item (yyvsp2 - 1).out, yyvs2.item (yyvsp2).out>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp36 := yyvsp36 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp2 := yyvsp2 -2
	if yyvsp36 >= yyvsc36 then
		if yyvs36 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs36")
			end
			create yyspecial_routines36
			yyvsc36 := yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.make (yyvsc36)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs36")
			end
			yyvsc36 := yyvsc36 + yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.resize (yyvs36, yyvsc36)
		end
	end
	yyvs36.put (yyval36, yyvsp36)
end
when 199 then
--|#line 1693 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1693")
end

			if yyvs2.item (yyvsp2 - 1) <= yyvs2.item (yyvsp2) then
				create integer_interval.make_bounded(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), False, False)
				yyval36 := integer_interval
			else
				raise_error
				report_error(create_message("VIVLO", <<yyvs2.item (yyvsp2 - 1).out, yyvs2.item (yyvsp2).out>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp36 := yyvsp36 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp2 := yyvsp2 -2
	if yyvsp36 >= yyvsc36 then
		if yyvs36 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs36")
			end
			create yyspecial_routines36
			yyvsc36 := yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.make (yyvsc36)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs36")
			end
			yyvsc36 := yyvsc36 + yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.resize (yyvs36, yyvsc36)
		end
	end
	yyvs36.put (yyval36, yyvsp36)
end
when 200 then
--|#line 1704 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1704")
end

			create integer_interval.make_lower_unbounded(yyvs2.item (yyvsp2), False)
			yyval36 := integer_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp36 := yyvsp36 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -1
	if yyvsp36 >= yyvsc36 then
		if yyvs36 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs36")
			end
			create yyspecial_routines36
			yyvsc36 := yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.make (yyvsc36)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs36")
			end
			yyvsc36 := yyvsc36 + yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.resize (yyvs36, yyvsc36)
		end
	end
	yyvs36.put (yyval36, yyvsp36)
end
when 201 then
--|#line 1709 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1709")
end

			create integer_interval.make_lower_unbounded(yyvs2.item (yyvsp2), True)
			yyval36 := integer_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp36 := yyvsp36 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -1
	if yyvsp36 >= yyvsc36 then
		if yyvs36 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs36")
			end
			create yyspecial_routines36
			yyvsc36 := yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.make (yyvsc36)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs36")
			end
			yyvsc36 := yyvsc36 + yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.resize (yyvs36, yyvsc36)
		end
	end
	yyvs36.put (yyval36, yyvsp36)
end
when 202 then
--|#line 1714 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1714")
end

			create integer_interval.make_upper_unbounded(yyvs2.item (yyvsp2), False)
			yyval36 := integer_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp36 := yyvsp36 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -1
	if yyvsp36 >= yyvsc36 then
		if yyvs36 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs36")
			end
			create yyspecial_routines36
			yyvsc36 := yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.make (yyvsc36)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs36")
			end
			yyvsc36 := yyvsc36 + yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.resize (yyvs36, yyvsc36)
		end
	end
	yyvs36.put (yyval36, yyvsp36)
end
when 203 then
--|#line 1719 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1719")
end

			create integer_interval.make_upper_unbounded(yyvs2.item (yyvsp2), True)
			yyval36 := integer_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp36 := yyvsp36 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -1
	if yyvsp36 >= yyvsc36 then
		if yyvs36 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs36")
			end
			create yyspecial_routines36
			yyvsc36 := yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.make (yyvsc36)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs36")
			end
			yyvsc36 := yyvsc36 + yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.resize (yyvs36, yyvsc36)
		end
	end
	yyvs36.put (yyval36, yyvsp36)
end
when 204 then
--|#line 1724 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1724")
end

			create integer_interval.make_point(yyvs2.item (yyvsp2))
			yyval36 := integer_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp36 := yyvsp36 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -1
	if yyvsp36 >= yyvsc36 then
		if yyvs36 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs36")
			end
			create yyspecial_routines36
			yyvsc36 := yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.make (yyvsc36)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs36")
			end
			yyvsc36 := yyvsc36 + yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.resize (yyvs36, yyvsc36)
		end
	end
	yyvs36.put (yyval36, yyvsp36)
end
when 205 then
--|#line 1731 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1731")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs3.put (yyval3, yyvsp3)
end
when 206 then
--|#line 1735 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1735")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs3.put (yyval3, yyvsp3)
end
when 207 then
--|#line 1739 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1739")
end

			yyval3 := - yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs3.put (yyval3, yyvsp3)
end
when 208 then
--|#line 1745 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1745")
end

			create yyval26.make(0)
			yyval26.extend(yyvs3.item (yyvsp3 - 1))
			yyval26.extend(yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp26 := yyvsp26 + 1
	yyvsp3 := yyvsp3 -2
	yyvsp1 := yyvsp1 -1
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
when 209 then
--|#line 1751 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1751")
end

			yyvs26.item (yyvsp26).extend(yyvs3.item (yyvsp3))
			yyval26 := yyvs26.item (yyvsp26)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyvs26.put (yyval26, yyvsp26)
end
when 210 then
--|#line 1756 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1756")
end

			create yyval26.make(0)
			yyval26.extend(yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp26 := yyvsp26 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -2
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
when 211 then
--|#line 1763 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1763")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create real_interval.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), True, True)
				yyval37 := real_interval
			else
				raise_error
				report_error(create_message("VIVLO", <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp37 := yyvsp37 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -2
	if yyvsp37 >= yyvsc37 then
		if yyvs37 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs37")
			end
			create yyspecial_routines37
			yyvsc37 := yyInitial_yyvs_size
			yyvs37 := yyspecial_routines37.make (yyvsc37)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs37")
			end
			yyvsc37 := yyvsc37 + yyInitial_yyvs_size
			yyvs37 := yyspecial_routines37.resize (yyvs37, yyvsc37)
		end
	end
	yyvs37.put (yyval37, yyvsp37)
end
when 212 then
--|#line 1774 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1774")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create real_interval.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), False, True)
				yyval37 := real_interval
			else
				raise_error
				report_error(create_message("VIVLO", <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp37 := yyvsp37 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp3 := yyvsp3 -2
	if yyvsp37 >= yyvsc37 then
		if yyvs37 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs37")
			end
			create yyspecial_routines37
			yyvsc37 := yyInitial_yyvs_size
			yyvs37 := yyspecial_routines37.make (yyvsc37)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs37")
			end
			yyvsc37 := yyvsc37 + yyInitial_yyvs_size
			yyvs37 := yyspecial_routines37.resize (yyvs37, yyvsc37)
		end
	end
	yyvs37.put (yyval37, yyvsp37)
end
when 213 then
--|#line 1785 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1785")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create real_interval.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), True, False)
				yyval37 := real_interval
			else
				raise_error
				report_error(create_message("VIVLO", <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp37 := yyvsp37 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp3 := yyvsp3 -2
	if yyvsp37 >= yyvsc37 then
		if yyvs37 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs37")
			end
			create yyspecial_routines37
			yyvsc37 := yyInitial_yyvs_size
			yyvs37 := yyspecial_routines37.make (yyvsc37)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs37")
			end
			yyvsc37 := yyvsc37 + yyInitial_yyvs_size
			yyvs37 := yyspecial_routines37.resize (yyvs37, yyvsc37)
		end
	end
	yyvs37.put (yyval37, yyvsp37)
end
when 214 then
--|#line 1796 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1796")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create real_interval.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), False, False)
				yyval37 := real_interval
			else
				raise_error
				report_error(create_message("VIVLO", <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp37 := yyvsp37 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp3 := yyvsp3 -2
	if yyvsp37 >= yyvsc37 then
		if yyvs37 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs37")
			end
			create yyspecial_routines37
			yyvsc37 := yyInitial_yyvs_size
			yyvs37 := yyspecial_routines37.make (yyvsc37)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs37")
			end
			yyvsc37 := yyvsc37 + yyInitial_yyvs_size
			yyvs37 := yyspecial_routines37.resize (yyvs37, yyvsc37)
		end
	end
	yyvs37.put (yyval37, yyvsp37)
end
when 215 then
--|#line 1807 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1807")
end

			create real_interval.make_lower_unbounded(yyvs3.item (yyvsp3), False)
			yyval37 := real_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp37 := yyvsp37 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp37 >= yyvsc37 then
		if yyvs37 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs37")
			end
			create yyspecial_routines37
			yyvsc37 := yyInitial_yyvs_size
			yyvs37 := yyspecial_routines37.make (yyvsc37)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs37")
			end
			yyvsc37 := yyvsc37 + yyInitial_yyvs_size
			yyvs37 := yyspecial_routines37.resize (yyvs37, yyvsc37)
		end
	end
	yyvs37.put (yyval37, yyvsp37)
end
when 216 then
--|#line 1812 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1812")
end

			create real_interval.make_lower_unbounded(yyvs3.item (yyvsp3), True)
			yyval37 := real_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp37 := yyvsp37 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp37 >= yyvsc37 then
		if yyvs37 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs37")
			end
			create yyspecial_routines37
			yyvsc37 := yyInitial_yyvs_size
			yyvs37 := yyspecial_routines37.make (yyvsc37)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs37")
			end
			yyvsc37 := yyvsc37 + yyInitial_yyvs_size
			yyvs37 := yyspecial_routines37.resize (yyvs37, yyvsc37)
		end
	end
	yyvs37.put (yyval37, yyvsp37)
end
when 217 then
--|#line 1817 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1817")
end

			create real_interval.make_upper_unbounded(yyvs3.item (yyvsp3), False)
			yyval37 := real_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp37 := yyvsp37 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp37 >= yyvsc37 then
		if yyvs37 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs37")
			end
			create yyspecial_routines37
			yyvsc37 := yyInitial_yyvs_size
			yyvs37 := yyspecial_routines37.make (yyvsc37)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs37")
			end
			yyvsc37 := yyvsc37 + yyInitial_yyvs_size
			yyvs37 := yyspecial_routines37.resize (yyvs37, yyvsc37)
		end
	end
	yyvs37.put (yyval37, yyvsp37)
end
when 218 then
--|#line 1822 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1822")
end

			create real_interval.make_upper_unbounded(yyvs3.item (yyvsp3), True)
			yyval37 := real_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp37 := yyvsp37 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp37 >= yyvsc37 then
		if yyvs37 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs37")
			end
			create yyspecial_routines37
			yyvsc37 := yyInitial_yyvs_size
			yyvs37 := yyspecial_routines37.make (yyvsc37)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs37")
			end
			yyvsc37 := yyvsc37 + yyInitial_yyvs_size
			yyvs37 := yyspecial_routines37.resize (yyvs37, yyvsc37)
		end
	end
	yyvs37.put (yyval37, yyvsp37)
end
when 219 then
--|#line 1827 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1827")
end

			create real_interval.make_point(yyvs3.item (yyvsp3))
			yyval37 := real_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp37 := yyvsp37 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp3 := yyvsp3 -1
	if yyvsp37 >= yyvsc37 then
		if yyvs37 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs37")
			end
			create yyspecial_routines37
			yyvsc37 := yyInitial_yyvs_size
			yyvs37 := yyspecial_routines37.make (yyvsc37)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs37")
			end
			yyvsc37 := yyvsc37 + yyInitial_yyvs_size
			yyvs37 := yyspecial_routines37.resize (yyvs37, yyvsc37)
		end
	end
	yyvs37.put (yyval37, yyvsp37)
end
when 220 then
--|#line 1834 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1834")
end

			yyval16 := True
		
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
when 221 then
--|#line 1838 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1838")
end

			yyval16 := False
		
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
when 222 then
--|#line 1886 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1886")
end

			if valid_iso8601_date(yyvs4.item (yyvsp4)) then
				create yyval17.make_from_string(yyvs4.item (yyvsp4))
			else
				raise_error
				report_error(create_message("VIDV", <<yyvs4.item (yyvsp4)>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp17 := yyvsp17 + 1
	yyvsp4 := yyvsp4 -1
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
when 223 then
--|#line 1916 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1916")
end

			if yyvs17.item (yyvsp17 - 1) <= yyvs17.item (yyvsp17) then
				create date_interval.make_bounded(yyvs17.item (yyvsp17 - 1), yyvs17.item (yyvsp17), True, True)
				yyval39 := date_interval
			else
				raise_error
				report_error(create_message("VIVLO", <<yyvs17.item (yyvsp17 - 1).out, yyvs17.item (yyvsp17).out>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp17 := yyvsp17 -2
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
when 224 then
--|#line 1927 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1927")
end

			if yyvs17.item (yyvsp17 - 1) <= yyvs17.item (yyvsp17) then
				create date_interval.make_bounded(yyvs17.item (yyvsp17 - 1), yyvs17.item (yyvsp17), False, True)
				yyval39 := date_interval
			else
				raise_error
				report_error(create_message("VIVLO", <<yyvs17.item (yyvsp17 - 1).out, yyvs17.item (yyvsp17).out>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp17 := yyvsp17 -2
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
when 225 then
--|#line 1938 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1938")
end

			if yyvs17.item (yyvsp17 - 1) <= yyvs17.item (yyvsp17) then
				create date_interval.make_bounded(yyvs17.item (yyvsp17 - 1), yyvs17.item (yyvsp17), True, False)
				yyval39 := date_interval
			else
				raise_error
				report_error(create_message("VIVLO", <<yyvs17.item (yyvsp17 - 1).out, yyvs17.item (yyvsp17).out>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp17 := yyvsp17 -2
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
when 226 then
--|#line 1949 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1949")
end

			if yyvs17.item (yyvsp17 - 1) <= yyvs17.item (yyvsp17) then
				create date_interval.make_bounded(yyvs17.item (yyvsp17 - 1), yyvs17.item (yyvsp17), False, False)
				yyval39 := date_interval
			else
				raise_error
				report_error(create_message("VIVLO", <<yyvs17.item (yyvsp17 - 1).out, yyvs17.item (yyvsp17).out>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp17 := yyvsp17 -2
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
when 227 then
--|#line 1960 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1960")
end

			create date_interval.make_lower_unbounded(yyvs17.item (yyvsp17), False)
			yyval39 := date_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp17 := yyvsp17 -1
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
when 228 then
--|#line 1965 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1965")
end

			create date_interval.make_lower_unbounded(yyvs17.item (yyvsp17), True)
			yyval39 := date_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp17 := yyvsp17 -1
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
when 229 then
--|#line 1970 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1970")
end

			create date_interval.make_upper_unbounded(yyvs17.item (yyvsp17), False)
			yyval39 := date_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp17 := yyvsp17 -1
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
when 230 then
--|#line 1975 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1975")
end

			create date_interval.make_upper_unbounded(yyvs17.item (yyvsp17), True)
			yyval39 := date_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp17 := yyvsp17 -1
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
when 231 then
--|#line 1980 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1980")
end

			create date_interval.make_point(yyvs17.item (yyvsp17))
			yyval39 := date_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp17 := yyvsp17 -1
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
when 232 then
--|#line 1987 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 1987")
end

			if valid_iso8601_time(yyvs4.item (yyvsp4)) then
				create yyval19.make_from_string(yyvs4.item (yyvsp4))
			else
				raise_error
				report_error(create_message("VITV", <<yyvs4.item (yyvsp4)>>))
				abort
			end
		
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
when 233 then
--|#line 2017 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2017")
end

			if yyvs19.item (yyvsp19 - 1) <= yyvs19.item (yyvsp19) then
				create time_interval.make_bounded(yyvs19.item (yyvsp19 - 1), yyvs19.item (yyvsp19), True, True)
				yyval38 := time_interval
			else
				raise_error
				report_error(create_message("VIVLO", <<yyvs19.item (yyvsp19 - 1).out, yyvs19.item (yyvsp19).out>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp19 := yyvsp19 -2
	if yyvsp38 >= yyvsc38 then
		if yyvs38 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs38")
			end
			create yyspecial_routines38
			yyvsc38 := yyInitial_yyvs_size
			yyvs38 := yyspecial_routines38.make (yyvsc38)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs38")
			end
			yyvsc38 := yyvsc38 + yyInitial_yyvs_size
			yyvs38 := yyspecial_routines38.resize (yyvs38, yyvsc38)
		end
	end
	yyvs38.put (yyval38, yyvsp38)
end
when 234 then
--|#line 2028 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2028")
end

			if yyvs19.item (yyvsp19 - 1) <= yyvs19.item (yyvsp19) then
				create time_interval.make_bounded(yyvs19.item (yyvsp19 - 1), yyvs19.item (yyvsp19), False, True)
				yyval38 := time_interval
			else
				raise_error
				report_error(create_message("VIVLO", <<yyvs19.item (yyvsp19 - 1).out, yyvs19.item (yyvsp19).out>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp19 := yyvsp19 -2
	if yyvsp38 >= yyvsc38 then
		if yyvs38 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs38")
			end
			create yyspecial_routines38
			yyvsc38 := yyInitial_yyvs_size
			yyvs38 := yyspecial_routines38.make (yyvsc38)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs38")
			end
			yyvsc38 := yyvsc38 + yyInitial_yyvs_size
			yyvs38 := yyspecial_routines38.resize (yyvs38, yyvsc38)
		end
	end
	yyvs38.put (yyval38, yyvsp38)
end
when 235 then
--|#line 2039 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2039")
end

			if yyvs19.item (yyvsp19 - 1) <= yyvs19.item (yyvsp19) then
				create time_interval.make_bounded(yyvs19.item (yyvsp19 - 1), yyvs19.item (yyvsp19), True, False)
				yyval38 := time_interval
			else
				raise_error
				report_error(create_message("VIVLO", <<yyvs19.item (yyvsp19 - 1).out, yyvs19.item (yyvsp19).out>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp19 := yyvsp19 -2
	if yyvsp38 >= yyvsc38 then
		if yyvs38 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs38")
			end
			create yyspecial_routines38
			yyvsc38 := yyInitial_yyvs_size
			yyvs38 := yyspecial_routines38.make (yyvsc38)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs38")
			end
			yyvsc38 := yyvsc38 + yyInitial_yyvs_size
			yyvs38 := yyspecial_routines38.resize (yyvs38, yyvsc38)
		end
	end
	yyvs38.put (yyval38, yyvsp38)
end
when 236 then
--|#line 2050 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2050")
end

			if yyvs19.item (yyvsp19 - 1) <= yyvs19.item (yyvsp19) then
				create time_interval.make_bounded(yyvs19.item (yyvsp19 - 1), yyvs19.item (yyvsp19), False, False)
				yyval38 := time_interval
			else
				raise_error
				report_error(create_message("VIVLO", <<yyvs19.item (yyvsp19 - 1).out, yyvs19.item (yyvsp19).out>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp19 := yyvsp19 -2
	if yyvsp38 >= yyvsc38 then
		if yyvs38 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs38")
			end
			create yyspecial_routines38
			yyvsc38 := yyInitial_yyvs_size
			yyvs38 := yyspecial_routines38.make (yyvsc38)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs38")
			end
			yyvsc38 := yyvsc38 + yyInitial_yyvs_size
			yyvs38 := yyspecial_routines38.resize (yyvs38, yyvsc38)
		end
	end
	yyvs38.put (yyval38, yyvsp38)
end
when 237 then
--|#line 2061 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2061")
end

			create time_interval.make_lower_unbounded(yyvs19.item (yyvsp19), False)
			yyval38 := time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp19 := yyvsp19 -1
	if yyvsp38 >= yyvsc38 then
		if yyvs38 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs38")
			end
			create yyspecial_routines38
			yyvsc38 := yyInitial_yyvs_size
			yyvs38 := yyspecial_routines38.make (yyvsc38)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs38")
			end
			yyvsc38 := yyvsc38 + yyInitial_yyvs_size
			yyvs38 := yyspecial_routines38.resize (yyvs38, yyvsc38)
		end
	end
	yyvs38.put (yyval38, yyvsp38)
end
when 238 then
--|#line 2066 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2066")
end

			create time_interval.make_lower_unbounded(yyvs19.item (yyvsp19), True)
			yyval38 := time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp19 := yyvsp19 -1
	if yyvsp38 >= yyvsc38 then
		if yyvs38 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs38")
			end
			create yyspecial_routines38
			yyvsc38 := yyInitial_yyvs_size
			yyvs38 := yyspecial_routines38.make (yyvsc38)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs38")
			end
			yyvsc38 := yyvsc38 + yyInitial_yyvs_size
			yyvs38 := yyspecial_routines38.resize (yyvs38, yyvsc38)
		end
	end
	yyvs38.put (yyval38, yyvsp38)
end
when 239 then
--|#line 2071 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2071")
end

			create time_interval.make_upper_unbounded(yyvs19.item (yyvsp19), False)
			yyval38 := time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp19 := yyvsp19 -1
	if yyvsp38 >= yyvsc38 then
		if yyvs38 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs38")
			end
			create yyspecial_routines38
			yyvsc38 := yyInitial_yyvs_size
			yyvs38 := yyspecial_routines38.make (yyvsc38)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs38")
			end
			yyvsc38 := yyvsc38 + yyInitial_yyvs_size
			yyvs38 := yyspecial_routines38.resize (yyvs38, yyvsc38)
		end
	end
	yyvs38.put (yyval38, yyvsp38)
end
when 240 then
--|#line 2076 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2076")
end

			create time_interval.make_upper_unbounded(yyvs19.item (yyvsp19), True)
			yyval38 := time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp19 := yyvsp19 -1
	if yyvsp38 >= yyvsc38 then
		if yyvs38 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs38")
			end
			create yyspecial_routines38
			yyvsc38 := yyInitial_yyvs_size
			yyvs38 := yyspecial_routines38.make (yyvsc38)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs38")
			end
			yyvsc38 := yyvsc38 + yyInitial_yyvs_size
			yyvs38 := yyspecial_routines38.resize (yyvs38, yyvsc38)
		end
	end
	yyvs38.put (yyval38, yyvsp38)
end
when 241 then
--|#line 2081 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2081")
end

			create time_interval.make_point(yyvs19.item (yyvsp19))
			yyval38 := time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp19 := yyvsp19 -1
	if yyvsp38 >= yyvsc38 then
		if yyvs38 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs38")
			end
			create yyspecial_routines38
			yyvsc38 := yyInitial_yyvs_size
			yyvs38 := yyspecial_routines38.make (yyvsc38)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs38")
			end
			yyvsc38 := yyvsc38 + yyInitial_yyvs_size
			yyvs38 := yyspecial_routines38.resize (yyvs38, yyvsc38)
		end
	end
	yyvs38.put (yyval38, yyvsp38)
end
when 242 then
--|#line 2088 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2088")
end

			if valid_iso8601_date_time(yyvs4.item (yyvsp4)) then
				create yyval18.make_from_string(yyvs4.item (yyvsp4))
			else
				raise_error
				report_error(create_message("VIDTV", <<yyvs4.item (yyvsp4)>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp18 := yyvsp18 + 1
	yyvsp4 := yyvsp4 -1
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
when 243 then
--|#line 2118 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2118")
end

			if yyvs18.item (yyvsp18 - 1) <= yyvs18.item (yyvsp18) then
				create date_time_interval.make_bounded(yyvs18.item (yyvsp18 - 1), yyvs18.item (yyvsp18), True, True)
				yyval40 := date_time_interval
			else
				raise_error
				report_error(create_message("VIVLO", <<yyvs18.item (yyvsp18 - 1).out, yyvs18.item (yyvsp18).out>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp18 := yyvsp18 -2
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
when 244 then
--|#line 2129 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2129")
end

			if yyvs18.item (yyvsp18 - 1) <= yyvs18.item (yyvsp18) then
				create date_time_interval.make_bounded(yyvs18.item (yyvsp18 - 1), yyvs18.item (yyvsp18), False, True)
				yyval40 := date_time_interval
			else
				raise_error
				report_error(create_message("VIVLO", <<yyvs18.item (yyvsp18 - 1).out, yyvs18.item (yyvsp18).out>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp18 := yyvsp18 -2
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
when 245 then
--|#line 2140 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2140")
end

			if yyvs18.item (yyvsp18 - 1) <= yyvs18.item (yyvsp18) then
				create date_time_interval.make_bounded(yyvs18.item (yyvsp18 - 1), yyvs18.item (yyvsp18), True, False)
				yyval40 := date_time_interval
			else
				raise_error
				report_error(create_message("VIVLO", <<yyvs18.item (yyvsp18 - 1).out, yyvs18.item (yyvsp18).out>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp18 := yyvsp18 -2
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
when 246 then
--|#line 2151 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2151")
end

			if yyvs18.item (yyvsp18 - 1) <= yyvs18.item (yyvsp18) then
				create date_time_interval.make_bounded(yyvs18.item (yyvsp18 - 1), yyvs18.item (yyvsp18), False, False)
				yyval40 := date_time_interval
			else
				raise_error
				report_error(create_message("VIVLO", <<yyvs18.item (yyvsp18 - 1).out, yyvs18.item (yyvsp18).out>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp18 := yyvsp18 -2
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
when 247 then
--|#line 2162 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2162")
end

			create date_time_interval.make_lower_unbounded(yyvs18.item (yyvsp18), False)
			yyval40 := date_time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp18 := yyvsp18 -1
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
when 248 then
--|#line 2167 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2167")
end

			create date_time_interval.make_lower_unbounded(yyvs18.item (yyvsp18), True)
			yyval40 := date_time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp18 := yyvsp18 -1
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
when 249 then
--|#line 2172 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2172")
end

			create date_time_interval.make_upper_unbounded(yyvs18.item (yyvsp18), False)
			yyval40 := date_time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp18 := yyvsp18 -1
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
when 250 then
--|#line 2177 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2177")
end

			create date_time_interval.make_upper_unbounded(yyvs18.item (yyvsp18), True)
			yyval40 := date_time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp18 := yyvsp18 -1
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
when 251 then
--|#line 2182 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2182")
end

			create date_time_interval.make_point(yyvs18.item (yyvsp18))
			yyval40 := date_time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp18 := yyvsp18 -1
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
when 252 then
--|#line 2189 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2189")
end

			if valid_iso8601_duration(yyvs4.item (yyvsp4)) then
				create yyval20.make_from_string(yyvs4.item (yyvsp4))
			else
				raise_error
				report_error(create_message("VIDUV", <<yyvs4.item (yyvsp4)>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp20 := yyvsp20 + 1
	yyvsp4 := yyvsp4 -1
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
when 253 then
--|#line 2219 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2219")
end

			if yyvs20.item (yyvsp20 - 1) <= yyvs20.item (yyvsp20) then
				create duration_interval.make_bounded(yyvs20.item (yyvsp20 - 1), yyvs20.item (yyvsp20), True, True)
				yyval41 := duration_interval
			else
				raise_error
				report_error(create_message("VIVLO", <<yyvs20.item (yyvsp20 - 1).out, yyvs20.item (yyvsp20).out>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp20 := yyvsp20 -2
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
when 254 then
--|#line 2230 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2230")
end

			if yyvs20.item (yyvsp20 - 1) <= yyvs20.item (yyvsp20) then
				create duration_interval.make_bounded(yyvs20.item (yyvsp20 - 1), yyvs20.item (yyvsp20), False, True)
				yyval41 := duration_interval
			else
				raise_error
				report_error(create_message("VIVLO", <<yyvs20.item (yyvsp20 - 1).out, yyvs20.item (yyvsp20).out>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp20 := yyvsp20 -2
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
when 255 then
--|#line 2241 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2241")
end

			if yyvs20.item (yyvsp20 - 1) <= yyvs20.item (yyvsp20) then
				create duration_interval.make_bounded(yyvs20.item (yyvsp20 - 1), yyvs20.item (yyvsp20), True, False)
				yyval41 := duration_interval
			else
				raise_error
				report_error(create_message("VIVLO", <<yyvs20.item (yyvsp20 - 1).out, yyvs20.item (yyvsp20).out>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp20 := yyvsp20 -2
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
when 256 then
--|#line 2252 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2252")
end

			if yyvs20.item (yyvsp20 - 1) <= yyvs20.item (yyvsp20) then
				create duration_interval.make_bounded(yyvs20.item (yyvsp20 - 1), yyvs20.item (yyvsp20), False, False)
				yyval41 := duration_interval
			else
				raise_error
				report_error(create_message("VIVLO", <<yyvs20.item (yyvsp20 - 1).out, yyvs20.item (yyvsp20).out>>))
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp20 := yyvsp20 -2
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
when 257 then
--|#line 2263 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2263")
end

			create duration_interval.make_lower_unbounded(yyvs20.item (yyvsp20), False)
			yyval41 := duration_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp20 := yyvsp20 -1
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
when 258 then
--|#line 2268 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2268")
end

			create duration_interval.make_lower_unbounded(yyvs20.item (yyvsp20), True)
			yyval41 := duration_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp20 := yyvsp20 -1
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
when 259 then
--|#line 2273 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2273")
end

			create duration_interval.make_upper_unbounded(yyvs20.item (yyvsp20), False)
			yyval41 := duration_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp20 := yyvsp20 -1
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
when 260 then
--|#line 2278 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2278")
end

			create duration_interval.make_upper_unbounded(yyvs20.item (yyvsp20), True)
			yyval41 := duration_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp20 := yyvsp20 -1
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
when 261 then
--|#line 2283 "cadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_validator.y' at line 2283")
end

			create duration_interval.make_point(yyvs20.item (yyvsp20))
			yyval41 := duration_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp20 := yyvsp20 -1
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
			when 460 then
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
			   79,   80,   72,   70,   82,   71,    2,   73,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,   78,   81,
			    2,   67,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,   76,    2,    2,    2,    2,    2,

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
			   65,   66,   68,   69,   74,   75,   77, yyDummy>>)
		end

	yyr1_template: SPECIAL [INTEGER] is
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,  122,  122,  122,  123,  124,  126,  126,  126,   87,
			   87,  125,  125,  129,  129,  129,  129,  129,  129,  129,
			  129,  129,  129,  130,  130,  131,  135,  136,  136,  136,
			  136,  136,   94,   95,   95,   95,   95,   95,   95,   95,
			   95,  127,  128,  128,  145,  145,  146,  146,  146,  146,
			  147,  147,  147,   84,   84,   85,   85,   83,   83,  148,
			  148,  148,   96,   96,   97,   97,   97,   97,   97,   97,
			   97,   97,   97,   97,   97,   97,   97,   97,   98,   98,
			   98,   99,   99,  100,  100,  100,  100,  100,  101,  101,
			  101,  101,   88,   88,   88,   89,   89,  112,  112,   92,

			   92,  149,  149,  102,  150,  150,  150,  150,  150,  150,
			  150,  150,   90,   90,   91,   91,   91,   93,   93,  151,
			  151,  151,  137,  137,  137,  152,  152,  152,  138,  138,
			  138,  153,  153,  153,  139,  139,  139,  154,  154,  154,
			  140,  140,  140,  155,  155,  155,  141,  141,  141,  156,
			  156,  156,  156,  157,  142,  142,  142,  158,  158,  158,
			  158,  143,  143,  143,  159,  159,  159,  159,  144,  144,
			  144,  134,  134,  134,  160,  160,  161,  133,  133,  132,
			  110,  110,   86,   86,   86,   86,  111,  113,  113,  113,
			  103,  103,  103,  114,  114,  114,  116,  116,  116,  116,

			  116,  116,  116,  116,  116,  104,  104,  104,  115,  115,
			  115,  117,  117,  117,  117,  117,  117,  117,  117,  117,
			  105,  105,  106,  119,  119,  119,  119,  119,  119,  119,
			  119,  119,  108,  118,  118,  118,  118,  118,  118,  118,
			  118,  118,  107,  120,  120,  120,  120,  120,  120,  120,
			  120,  120,  109,  121,  121,  121,  121,  121,  121,  121,
			  121,  121, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER] is
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    4,    4,    4,    3,    2,    1,    8,    4,    9,
			   10,   10,   14,   14,   14,   14,   14,   14,    2,    3,
			    4,   23,    1,    1,    1,    1,    1,    4,    4,    4,
			   14,   14,    1,   14,   10,    3,    2,    3,    2,    4,
			    4,    1,   10,    4,    4,    1,    4,    1,    4,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			   11,    1,    1,    1,    1,    4,   10,   23,    1,   14,
			   14,   14,   14,    1,   14,   14,   14,   14,   14,   14,

			   14,   14,   14,   14,   14,    1,   14,    1,    1,    1,
			    1,    1,    1,    4,    4,    4,    4,    4,    4,    4,
			    4,    4,    4,   13,    2,    3,   17,   18,   19,   20,
			   24,   25,   26,   36,   37,   38,   39,   40,   41,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,   14,    1,    4,   10,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    3,   17,   18,   19,   20,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,   11,   11,    1,    1,    1,

			    1,    1,    1,    2,    2,   11,    2,    1,    1,    2,
			    3,   17,   18,   19,   20,    2,    3,   17,   18,   19,
			   20,    2,    3,   17,   18,   19,   20,    2,    3,   17,
			   18,   19,   20,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    4,    1,    2,    1,
			    1,    1,    3,    1,    4,    2,    3,    1,    2,    1,
			    3,    1,   17,    1,   19,    1,   18,    1,   20,    1,
			   41,    4,    1,    4,    1,    1,    1,   16,    1,    1,
			   15,   15,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    2,    1,    3,    1,
			   17,    1,   18,    1,   19,    1,   20,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    6,    4,    4,    4,
			    1,    4,    9,   12,   13,    2,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    1,    2,    1,    3,    1,   17,    1,   18,    1,   19,
			    1,   20,    2,    1,    3,    1,   17,    1,   18,    1,
			   19,    1,   20,    1,    2,    1,    1,    4,    1,    4,
			    1,    1,    1,    1,   11,    1,    1,    1,    1,    1,

			    2,    1,    3,    1,   17,    1,   18,    1,   19,    1,
			   20,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			   11,    1,    1,   11,    4,    4,    4,    1,    2,    1,
			    1,    2,    1,    1,    1,    1,    1,    1,    2,    1,
			    1,   10,    4,    1,    8,    1,    1,    1,    8,    1,
			    8,    1,    1,    1,    8,    1,    1,    1,    1,    1,
			    1,    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER] is
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    2,    3,    4,    4,    4,    4,    4,
			    4,    4,    4,    4,    4,    5,    4,    4,    4,    4,
			    4,    4,    4,    4,    4,    6,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER] is
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    0,    0,    0,   92,    0,    0,    0,    0,    0,   80,
			   79,  181,  185,  184,  205,  190,    3,    2,  180,    0,
			   91,    0,   60,   63,   62,    0,   82,   81,   89,   90,
			    0,   95,    1,    0,  114,   57,    0,   98,    0,    0,
			    0,    0,    0,   67,   93,  207,  192,  206,  191,   10,
			    9,   65,   64,   97,  180,   58,    7,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    5,  183,  182,   78,   88,    8,   94,   96,    0,   74,
			   76,   75,   77,    0,   87,   86,   85,   84,   83,   71,

			   70,   68,   69,   72,   73,   61,   59,    0,    0,  116,
			  165,  164,    0,  153,  131,  137,  143,  252,  242,  232,
			  222,  160,  157,    0,  119,  125,  132,  144,  138,  151,
			  158,  120,  126,  121,  127,  139,  133,  145,  152,   33,
			   34,   35,   36,   37,   38,   39,   40,  122,  128,  134,
			  140,  146,  154,  149,  161,  168,    0,   41,   99,   99,
			    0,   11,   12,   42,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   66,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,   46,   48,    4,   43,    0,

			  113,    0,    0,  190,  117,    0,  112,  167,  166,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  204,    0,  219,    0,  231,    0,
			  251,    0,  241,    0,  261,  189,  187,  195,  193,    0,
			    0,  210,  208,  159,  188,  194,  209,  124,  123,  130,
			  129,  136,  135,  142,  141,  148,  147,  156,  155,    0,
			  150,  186,  163,  162,  221,  220,  170,  169,    0,    0,
			   47,   49,    0,    0,  115,    0,  202,    0,  217,    0,
			  229,    0,  249,    0,  239,    0,  259,  200,  215,  227,

			  247,  237,  257,  201,  216,  228,  248,  238,  258,  203,
			  218,  230,  250,  240,  260,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   21,    0,    0,   20,  177,  178,  179,
			   22,    6,    0,   19,   32,  119,   13,   52,   50,   14,
			   15,   16,   17,   18,    0,  114,    0,  171,  174,  118,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  196,    0,  211,    0,  223,    0,  243,
			    0,  233,    0,  253,  101,    0,    0,    0,   31,   27,
			   45,    0,    0,    0,   26,   44,   22,   51,    0,    0,

			    0,  197,    0,  212,    0,  224,    0,  244,    0,  234,
			    0,  254,  198,  213,  225,  245,  235,  255,    0,  100,
			  104,    0,   24,    0,   29,   28,  176,   53,    0,  175,
			  173,  172,  199,  214,  226,  246,  236,  256,  102,    0,
			  103,   23,   30,    0,   55,  107,  105,  106,   54,    0,
			    0,    0,    0,    0,   56,   25,  110,  111,  108,  109,
			    0,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER] is
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			   17,  444,  450,   54,  342,   20,   21,  204,   80,  195,
			  205,  343,  344,   22,   23,   24,   25,   26,   27,  280,
			   28,   29,  277,  126,  127,  128,  129,   30,  273,   31,
			  130,  131,  132,  133,  134,  135,  136,  137,  138,  460,
			  346,   33,  160,   34,  161,  162,  348,  349,  350,  351,
			  352,  353,  354,  355,  139,  140,  141,  142,  143,  144,
			  145,  146,  163,  164,  356,   35,  385,  421,  147,  148,
			  149,  150,  151,  152,  153,  154,  155,  357,  358, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER] is
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			  140,  262,  -13,  599,  387,  378,  604,  602,   21, -32768,
			 -32768,    0, -32768, -32768, -32768, -32768, -32768,  250,   -3,   18,
			  174,  -18,  240, -32768, -32768,  497, -32768, -32768, -32768, -32768,
			  550, -32768, -32768,  563,  383, -32768,  315,  598,  547,  546,
			  401,  481,  315, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768,  174, -32768, -32768, -32768, -32768,  337,  597,  599,
			  599,  575,  315,  315,  315,  315,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,  156,  573,  160,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  473, -32768,
			  545,  545,  -23,   55, -32768, -32768, -32768, -32768, -32768,  504,

			  504,  504,  504,  504,  504, -32768,  240,  198,  572, -32768,
			  541,  539,  453, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768,  538,  570,  536,  535, -32768, -32768, -32768, -32768,
			  532,  528,  525, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768,  524,  523,  522,
			  521,  519,  515,  520,  514,  513,  462, -32768,  553,   35,
			  564, -32768,    6, -32768,  540,  169,  560,  556,  508,  508,
			  508,  508,  335,  311,  302,  281,  279,  271,  203, -32768,
			  103,  181,  142,  126,  154,   53,   67,  152,  272,   26,
			   24,  559,   29,  258,  537,  544,  544, -32768, -32768,  558,

			 -32768,  580,  579,  492, -32768,  483, -32768, -32768, -32768,  267,
			  266,  253,  249,  138,    3,  552,  543,  542,  534,  533,
			  531,  530,  529,  527,  526,  518,  517,  516,  512,  511,
			  510,  507,  480,  190, -32768,  136, -32768,  116, -32768,  147,
			 -32768,  134, -32768,  111, -32768, -32768, -32768, -32768, -32768,  503,
			  502, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  393,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  472,  456,
			 -32768, -32768,  429,  173, -32768,  178, -32768,   -1, -32768,  110,
			 -32768,  146, -32768,  124, -32768,   -8, -32768, -32768, -32768, -32768,

			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768,  126,  460,  154,  449,  405,
			  446,  402,  445,  399,  440,  394,  439,  394,  394,  394,
			  394,  452,  437, -32768,   18,    9, -32768, -32768, -32768, -32768,
			  418,  417,    1, -32768, -32768,   11, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768,  395,  383,  348,  205, -32768, -32768,
			  126,  410,  154,  407,  405,  400,  402,  391,  399,  386,
			  394,  379,  377, -32768,  376, -32768,  375, -32768,  372, -32768,
			  371, -32768,  358, -32768,  329,  357,  169,   25, -32768,  352,
			 -32768,   18,  313,  350, -32768, -32768, -32768, -32768,  126,   33,

			  326, -32768,  309, -32768,  305, -32768,  301, -32768,  299, -32768,
			  288, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  296, -32768,
			  232,  274, -32768,  218, -32768,  268, -32768,  222,  213, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  353,
			 -32768,  174, -32768,  250,  163,  109,   96,   87,  250,  250,
			  127,  194,  120,   91,  250, -32768, -32768, -32768, -32768, -32768,
			   50,   39, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER] is
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -414, -32768, -32768,    2,  635,   -7,   13,  354, -335,  475,
			  247, -32768,  548,  347, -32768,  630,   46, -32768,  450,  434,
			  -84,  -79, -32768,  -55,  -59,  -93, -107, -32768, -32768,  571,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  438, -32768,
			  624, -32768, -32768, -32768,  340, -32768,  269, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768,  454, -32768, -32768,  -17, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  221, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER] is
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   55,   52,   18,   14,  124,  177,   13,   12,   56,  125,
			  388,   53,  117,  158,   13,   12,   44,   10,    9,  176,
			  394,   58,   51,   13,   12,  267,  422,  265,  172,  448,
			  272,   61,  296,  173,  430,  454,   15,   -6,  271,  462,
			  392,   64,   63,   62,  117,  118,   -6,   41,  295,  -98,
			  461,  391,  423,  175,  257,   60,   15,  174,   15,   14,
			  370,  214,  220,  226,  232,   79,   42,  362,  259,  250,
			  249,   14,   86,  -98,  194,  213,  219,  225,  231,    3,
			   57,  206,   41,  268,  209,  215,  221,  227,   57,  210,
			  216,  222,  228,  180,    3,  264,  248,   57, -114,  255,

			  159,  258,  252,  202,  201,  256,   15,  260,   59,  212,
			  218,  224,  230,  211,  217,  223,  229,   99,  100,  101,
			  102,  103,  104,  202,  201,    5,    4,  120,    3,   15,
			  266,  117,  262,  120,   93,  459,  326,  250,  249,  156,
			   14,   16,  119,   15,   14,   13,   12,   11,  324,  316,
			  247,  254,  119,  261,  455,  159,  318,  105,   14,   15,
			   14,  109,  177,   37,  458,  118,  118,  294,  453,  120,
			   10,    9,  203,  202,  201,    8,   15,  452,  364,  325,
			  322,   15,  320,  293,  319,   14,   10,    9,  371,  253,
			  451,    8,  368,   15,    7,    6,  202,  201,  345,  206,

			  369,  361,  323,  125,  317,  158,  250,  249,  363,  108,
			    5,    4,  246,    3,  366,  321,  449,    2,  382,    1,
			  214,  220,  226,  232,  250,  249,    5,    4,  251,    3,
			  380,  372,  367,    2,  365,   36,  457,  456,  374,  202,
			  201,  200,  392,  202,  201,  200,  360,   59,  202,  201,
			  245,  250,  249,   15,   14,   13,   12,   11,  315,  276,
			  202,  201,  378,  410,  376,   15,   14,   39,   38,   37,
			  157,    3,  345,  263,  443,  408,  400,  125,  292,  442,
			   10,    9,  290,  402,  341,    8,  399,  398,  275,  274,
			  119,    3,   10,    9,  291,  288,  286,    8,  289,  438,

			  244,  440,  206,   65,   64,   63,   62,  406,  242,  404,
			  240,  287,  285,  439,  428,  431,  243,  437,   15,   14,
			    5,    4,   37,    3,  241,  426,  239,    2,  436,    1,
			  435,  238,    5,    4,  434,    3,  387,  389,  433,    2,
			  236,   36,   39,   38,   58,   10,    9,  237,   40,  396,
			    8,   15,   14,   13,   12,  432,  235,  122,  341,  339,
			  338,  337,  121,  424,  234,  120,  119,  118,  117,  116,
			  115,  114,  113,  336,  418,  395,  427,  112,  111,  110,
			  233,   48,   47,   40,  419,    5,    4,  417,    3,   40,
			   46,   45,    2,  425,   36,  447,  446,  445,  335,  334,

			  416,  415,    7,    6,  414,  413,  412,  333,  411,   89,
			   90,   91,   92,  117,  117,  409,  441,  119,    5,    4,
			  407,  118,  120,   79,  106,  330,  329,   57,   56,  405,
			  340,   55,   15,   14,   13,   12,  403,   55,  122,  401,
			  339,  338,  337,  121,  393,  390,  120,  119,  118,  117,
			  116,  115,  114,  113,  336,  384,   15,   14,  112,  111,
			  110,  328,  327,  386,   65,   64,   63,   62,  383,  381,
			  120,  119,  118,  117,  379,  377,   15,   14,  375,  335,
			  334,   83,  122,    7,    6,  171,  170,  121,  333,  373,
			  120,  119,  118,  117,  116,  115,  114,  113,  331,    5,

			    4,  157,  112,  111,  110,  332,   47,   45,   57,  314,
			  284,   15,   14,   76,   75,   74,   94,   95,   96,   97,
			   98,  169,  168,    5,    4,  120,  119,  118,  117,   76,
			   75,   74,   70,   69,   68,   67,  313,  283,   66,  312,
			  311,  310,   84,    5,    4,  309,  308,  307,   73,   72,
			   71,   70,   69,   68,   67,  306,  305,   66,  304,  303,
			  302,   84,  301,  300,   73,   72,   71,   70,   69,   68,
			   67,  299,  298,   66,   70,   69,   68,   67,    5,    4,
			   66,  297,   48,   46,  282,  279,  278,  208,  269,  199,
			  207,  197,  194,  191,  193,  192,  190,  179,  165,  107,

			  189,   88,  188,  187,  186,  185,   37,  184,   85,   53,
			  183,   62,   78,   50,  182,   49,  198,  181,  180,  429,
			  178,  167,  347,  166,   32,  397,   82,   81,   77,  270,
			  281,   87,   43,  420,  196,   19,  123,  359, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER] is
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			   17,    8,    0,    4,   88,  112,    5,    6,   11,   88,
			    1,   11,   20,    7,    5,    6,    3,   30,   31,  112,
			  355,   19,    1,    5,    6,    1,    1,    1,  112,  443,
			    1,   49,   29,  112,    1,  449,    3,   40,    9,    0,
			   29,   64,   65,   66,   20,   19,   49,    1,   45,   49,
			    0,   50,  387,  112,    1,   73,    3,  112,    3,    4,
			   68,  168,  169,  170,  171,   40,   79,   68,    1,   70,
			   71,    4,   59,   73,   39,  168,  169,  170,  171,   73,
			   79,  165,   36,  190,  168,  169,  170,  171,   79,  168,
			  169,  170,  171,   82,   73,  188,  180,   79,   73,  183,

			  107,  185,  181,   70,   71,  184,    3,  186,   73,  168,
			  169,  170,  171,  168,  169,  170,  171,   71,   72,   73,
			   74,   75,   76,   70,   71,   70,   71,   17,   73,    3,
			  189,   20,  187,   17,   79,   44,  243,   70,   71,   93,
			    4,    1,   18,    3,    4,    5,    6,    7,  241,  233,
			   47,    9,   18,    1,   27,  162,  235,    1,    4,    3,
			    4,    1,  269,    7,   44,   19,   19,   29,   81,   17,
			   30,   31,    3,   70,   71,   35,    3,   81,   68,   68,
			  239,    3,  237,   45,   68,    4,   30,   31,  295,   47,
			   81,   35,   68,    3,   54,   55,   70,   71,  282,  283,

			  293,  285,   68,  282,   68,    7,   70,   71,  287,   49,
			   70,   71,    9,   73,   68,   68,   53,   77,  325,   79,
			  327,  328,  329,  330,   70,   71,   70,   71,   47,   73,
			  323,  315,  291,   77,  289,   79,   42,   43,  317,   70,
			   71,   72,   29,   70,   71,   72,   68,   73,   70,   71,
			   47,   70,   71,    3,    4,    5,    6,    7,   68,    1,
			   70,   71,  321,  370,  319,    3,    4,    5,    6,    7,
			   72,   73,  356,    1,   52,  368,  360,  356,   29,   11,
			   30,   31,   29,  362,  282,   35,   81,   82,   30,   31,
			   18,   73,   30,   31,   45,   29,   29,   35,   45,    3,

			   29,   27,  386,   63,   64,   65,   66,  366,   29,  364,
			   29,   45,   45,   81,  398,  399,   45,   29,    3,    4,
			   70,   71,    7,   73,   45,   12,   45,   77,   29,   79,
			   29,   29,   70,   71,   29,   73,  334,  335,   29,   77,
			   29,   79,    5,    6,  342,   30,   31,   45,    1,    1,
			   35,    3,    4,    5,    6,   29,   45,    9,  356,   11,
			   12,   13,   14,   11,   29,   17,   18,   19,   20,   21,
			   22,   23,   24,   25,   45,   27,   26,   29,   30,   31,
			   45,    3,    4,   36,   27,   70,   71,   29,   73,   42,
			    3,    4,   77,  391,   79,   42,   43,   44,   50,   51,

			   29,   29,   54,   55,   29,   29,   29,   59,   29,   62,
			   63,   64,   65,   20,   20,   29,  423,   18,   70,   71,
			   29,   19,   17,   40,   77,   32,   33,   79,   11,   29,
			    1,  448,    3,    4,    5,    6,   29,  454,    9,   29,
			   11,   12,   13,   14,   49,   27,   17,   18,   19,   20,
			   21,   22,   23,   24,   25,    3,    3,    4,   29,   30,
			   31,   68,   69,   26,   63,   64,   65,   66,   29,   29,
			   17,   18,   19,   20,   29,   29,    3,    4,   29,   50,
			   51,   80,    9,   54,   55,   32,   33,   14,   59,   29,
			   17,   18,   19,   20,   21,   22,   23,   24,   26,   70,

			   71,   72,   29,   30,   31,   49,    4,    4,   79,   29,
			   27,    3,    4,   32,   33,   34,   66,   67,   68,   69,
			   70,   68,   69,   70,   71,   17,   18,   19,   20,   32,
			   33,   34,   70,   71,   72,   73,   29,   45,   76,   29,
			   29,   29,   80,   70,   71,   29,   29,   29,   67,   68,
			   69,   70,   71,   72,   73,   29,   29,   76,   29,   29,
			   29,   80,   29,   29,   67,   68,   69,   70,   71,   72,
			   73,   29,   29,   76,   70,   71,   72,   73,   70,   71,
			   76,   29,    3,    3,   26,   41,   49,   31,   29,   49,
			   30,   27,   39,   73,   81,   81,   81,   27,   26,   26,

			   81,   26,   81,   81,   81,   81,    7,   82,   11,   11,
			   82,   66,   49,   11,   82,   11,  162,   82,   82,  398,
			   82,   82,  282,   82,    0,  356,   80,   80,   78,  191,
			  196,   60,    2,  386,  159,    0,   88,  283, yyDummy>>)
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

	yyvs9: SPECIAL [SIBLING_ORDER]
			-- Stack for semantic values of type SIBLING_ORDER

	yyvsc9: INTEGER
			-- Capacity of semantic value stack `yyvs9'

	yyvsp9: INTEGER
			-- Top of semantic value stack `yyvs9'

	yyspecial_routines9: KL_SPECIAL_ROUTINES [SIBLING_ORDER]
			-- Routines that ought to be in SPECIAL [SIBLING_ORDER]

	yyvs10: SPECIAL [OG_PATH]
			-- Stack for semantic values of type OG_PATH

	yyvsc10: INTEGER
			-- Capacity of semantic value stack `yyvs10'

	yyvsp10: INTEGER
			-- Top of semantic value stack `yyvs10'

	yyspecial_routines10: KL_SPECIAL_ROUTINES [OG_PATH]
			-- Routines that ought to be in SPECIAL [OG_PATH]

	yyvs11: SPECIAL [MULTIPLICITY_INTERVAL]
			-- Stack for semantic values of type MULTIPLICITY_INTERVAL

	yyvsc11: INTEGER
			-- Capacity of semantic value stack `yyvs11'

	yyvsp11: INTEGER
			-- Top of semantic value stack `yyvs11'

	yyspecial_routines11: KL_SPECIAL_ROUTINES [MULTIPLICITY_INTERVAL]
			-- Routines that ought to be in SPECIAL [MULTIPLICITY_INTERVAL]

	yyvs12: SPECIAL [C_PRIMITIVE_OBJECT]
			-- Stack for semantic values of type C_PRIMITIVE_OBJECT

	yyvsc12: INTEGER
			-- Capacity of semantic value stack `yyvs12'

	yyvsp12: INTEGER
			-- Top of semantic value stack `yyvs12'

	yyspecial_routines12: KL_SPECIAL_ROUTINES [C_PRIMITIVE_OBJECT]
			-- Routines that ought to be in SPECIAL [C_PRIMITIVE_OBJECT]

	yyvs13: SPECIAL [C_PRIMITIVE]
			-- Stack for semantic values of type C_PRIMITIVE

	yyvsc13: INTEGER
			-- Capacity of semantic value stack `yyvs13'

	yyvsp13: INTEGER
			-- Top of semantic value stack `yyvs13'

	yyspecial_routines13: KL_SPECIAL_ROUTINES [C_PRIMITIVE]
			-- Routines that ought to be in SPECIAL [C_PRIMITIVE]

	yyvs14: SPECIAL [EXPR_ITEM]
			-- Stack for semantic values of type EXPR_ITEM

	yyvsc14: INTEGER
			-- Capacity of semantic value stack `yyvs14'

	yyvsp14: INTEGER
			-- Top of semantic value stack `yyvs14'

	yyspecial_routines14: KL_SPECIAL_ROUTINES [EXPR_ITEM]
			-- Routines that ought to be in SPECIAL [EXPR_ITEM]

	yyvs15: SPECIAL [CARDINALITY]
			-- Stack for semantic values of type CARDINALITY

	yyvsc15: INTEGER
			-- Capacity of semantic value stack `yyvs15'

	yyvsp15: INTEGER
			-- Top of semantic value stack `yyvs15'

	yyspecial_routines15: KL_SPECIAL_ROUTINES [CARDINALITY]
			-- Routines that ought to be in SPECIAL [CARDINALITY]

	yyvs16: SPECIAL [BOOLEAN]
			-- Stack for semantic values of type BOOLEAN

	yyvsc16: INTEGER
			-- Capacity of semantic value stack `yyvs16'

	yyvsp16: INTEGER
			-- Top of semantic value stack `yyvs16'

	yyspecial_routines16: KL_SPECIAL_ROUTINES [BOOLEAN]
			-- Routines that ought to be in SPECIAL [BOOLEAN]

	yyvs17: SPECIAL [ISO8601_DATE]
			-- Stack for semantic values of type ISO8601_DATE

	yyvsc17: INTEGER
			-- Capacity of semantic value stack `yyvs17'

	yyvsp17: INTEGER
			-- Top of semantic value stack `yyvs17'

	yyspecial_routines17: KL_SPECIAL_ROUTINES [ISO8601_DATE]
			-- Routines that ought to be in SPECIAL [ISO8601_DATE]

	yyvs18: SPECIAL [ISO8601_DATE_TIME]
			-- Stack for semantic values of type ISO8601_DATE_TIME

	yyvsc18: INTEGER
			-- Capacity of semantic value stack `yyvs18'

	yyvsp18: INTEGER
			-- Top of semantic value stack `yyvs18'

	yyspecial_routines18: KL_SPECIAL_ROUTINES [ISO8601_DATE_TIME]
			-- Routines that ought to be in SPECIAL [ISO8601_DATE_TIME]

	yyvs19: SPECIAL [ISO8601_TIME]
			-- Stack for semantic values of type ISO8601_TIME

	yyvsc19: INTEGER
			-- Capacity of semantic value stack `yyvs19'

	yyvsp19: INTEGER
			-- Top of semantic value stack `yyvs19'

	yyspecial_routines19: KL_SPECIAL_ROUTINES [ISO8601_TIME]
			-- Routines that ought to be in SPECIAL [ISO8601_TIME]

	yyvs20: SPECIAL [ISO8601_DURATION]
			-- Stack for semantic values of type ISO8601_DURATION

	yyvsc20: INTEGER
			-- Capacity of semantic value stack `yyvs20'

	yyvsp20: INTEGER
			-- Top of semantic value stack `yyvs20'

	yyspecial_routines20: KL_SPECIAL_ROUTINES [ISO8601_DURATION]
			-- Routines that ought to be in SPECIAL [ISO8601_DURATION]

	yyvs21: SPECIAL [CODE_PHRASE]
			-- Stack for semantic values of type CODE_PHRASE

	yyvsc21: INTEGER
			-- Capacity of semantic value stack `yyvs21'

	yyvsp21: INTEGER
			-- Top of semantic value stack `yyvs21'

	yyspecial_routines21: KL_SPECIAL_ROUTINES [CODE_PHRASE]
			-- Routines that ought to be in SPECIAL [CODE_PHRASE]

	yyvs22: SPECIAL [URI]
			-- Stack for semantic values of type URI

	yyvsc22: INTEGER
			-- Capacity of semantic value stack `yyvs22'

	yyvsp22: INTEGER
			-- Top of semantic value stack `yyvs22'

	yyspecial_routines22: KL_SPECIAL_ROUTINES [URI]
			-- Routines that ought to be in SPECIAL [URI]

	yyvs23: SPECIAL [OG_PATH_ITEM]
			-- Stack for semantic values of type OG_PATH_ITEM

	yyvsc23: INTEGER
			-- Capacity of semantic value stack `yyvs23'

	yyvsp23: INTEGER
			-- Top of semantic value stack `yyvs23'

	yyspecial_routines23: KL_SPECIAL_ROUTINES [OG_PATH_ITEM]
			-- Routines that ought to be in SPECIAL [OG_PATH_ITEM]

	yyvs24: SPECIAL [ARRAYED_LIST [STRING]]
			-- Stack for semantic values of type ARRAYED_LIST [STRING]

	yyvsc24: INTEGER
			-- Capacity of semantic value stack `yyvs24'

	yyvsp24: INTEGER
			-- Top of semantic value stack `yyvs24'

	yyspecial_routines24: KL_SPECIAL_ROUTINES [ARRAYED_LIST [STRING]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [STRING]]

	yyvs25: SPECIAL [ARRAYED_LIST [INTEGER]]
			-- Stack for semantic values of type ARRAYED_LIST [INTEGER]

	yyvsc25: INTEGER
			-- Capacity of semantic value stack `yyvs25'

	yyvsp25: INTEGER
			-- Top of semantic value stack `yyvs25'

	yyspecial_routines25: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTEGER]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTEGER]]

	yyvs26: SPECIAL [ARRAYED_LIST [REAL]]
			-- Stack for semantic values of type ARRAYED_LIST [REAL]

	yyvsc26: INTEGER
			-- Capacity of semantic value stack `yyvs26'

	yyvsp26: INTEGER
			-- Top of semantic value stack `yyvs26'

	yyspecial_routines26: KL_SPECIAL_ROUTINES [ARRAYED_LIST [REAL]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [REAL]]

	yyvs27: SPECIAL [CHARACTER_REF]
			-- Stack for semantic values of type CHARACTER_REF

	yyvsc27: INTEGER
			-- Capacity of semantic value stack `yyvs27'

	yyvsp27: INTEGER
			-- Top of semantic value stack `yyvs27'

	yyspecial_routines27: KL_SPECIAL_ROUTINES [CHARACTER_REF]
			-- Routines that ought to be in SPECIAL [CHARACTER_REF]

	yyvs28: SPECIAL [ARRAYED_LIST [CHARACTER_REF]]
			-- Stack for semantic values of type ARRAYED_LIST [CHARACTER_REF]

	yyvsc28: INTEGER
			-- Capacity of semantic value stack `yyvs28'

	yyvsp28: INTEGER
			-- Top of semantic value stack `yyvs28'

	yyspecial_routines28: KL_SPECIAL_ROUTINES [ARRAYED_LIST [CHARACTER_REF]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [CHARACTER_REF]]

	yyvs29: SPECIAL [BOOLEAN_REF]
			-- Stack for semantic values of type BOOLEAN_REF

	yyvsc29: INTEGER
			-- Capacity of semantic value stack `yyvs29'

	yyvsp29: INTEGER
			-- Top of semantic value stack `yyvs29'

	yyspecial_routines29: KL_SPECIAL_ROUTINES [BOOLEAN_REF]
			-- Routines that ought to be in SPECIAL [BOOLEAN_REF]

	yyvs30: SPECIAL [ARRAYED_LIST [BOOLEAN_REF]]
			-- Stack for semantic values of type ARRAYED_LIST [BOOLEAN_REF]

	yyvsc30: INTEGER
			-- Capacity of semantic value stack `yyvs30'

	yyvsp30: INTEGER
			-- Top of semantic value stack `yyvs30'

	yyspecial_routines30: KL_SPECIAL_ROUTINES [ARRAYED_LIST [BOOLEAN_REF]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [BOOLEAN_REF]]

	yyvs31: SPECIAL [ARRAYED_LIST [ISO8601_DATE]]
			-- Stack for semantic values of type ARRAYED_LIST [ISO8601_DATE]

	yyvsc31: INTEGER
			-- Capacity of semantic value stack `yyvs31'

	yyvsp31: INTEGER
			-- Top of semantic value stack `yyvs31'

	yyspecial_routines31: KL_SPECIAL_ROUTINES [ARRAYED_LIST [ISO8601_DATE]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ISO8601_DATE]]

	yyvs32: SPECIAL [ARRAYED_LIST [ISO8601_TIME]]
			-- Stack for semantic values of type ARRAYED_LIST [ISO8601_TIME]

	yyvsc32: INTEGER
			-- Capacity of semantic value stack `yyvs32'

	yyvsp32: INTEGER
			-- Top of semantic value stack `yyvs32'

	yyspecial_routines32: KL_SPECIAL_ROUTINES [ARRAYED_LIST [ISO8601_TIME]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ISO8601_TIME]]

	yyvs33: SPECIAL [ARRAYED_LIST [ISO8601_DATE_TIME]]
			-- Stack for semantic values of type ARRAYED_LIST [ISO8601_DATE_TIME]

	yyvsc33: INTEGER
			-- Capacity of semantic value stack `yyvs33'

	yyvsp33: INTEGER
			-- Top of semantic value stack `yyvs33'

	yyspecial_routines33: KL_SPECIAL_ROUTINES [ARRAYED_LIST [ISO8601_DATE_TIME]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ISO8601_DATE_TIME]]

	yyvs34: SPECIAL [ARRAYED_LIST [ISO8601_DURATION]]
			-- Stack for semantic values of type ARRAYED_LIST [ISO8601_DURATION]

	yyvsc34: INTEGER
			-- Capacity of semantic value stack `yyvs34'

	yyvsp34: INTEGER
			-- Top of semantic value stack `yyvs34'

	yyspecial_routines34: KL_SPECIAL_ROUTINES [ARRAYED_LIST [ISO8601_DURATION]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ISO8601_DURATION]]

	yyvs35: SPECIAL [ARRAYED_LIST [CODE_PHRASE]]
			-- Stack for semantic values of type ARRAYED_LIST [CODE_PHRASE]

	yyvsc35: INTEGER
			-- Capacity of semantic value stack `yyvs35'

	yyvsp35: INTEGER
			-- Top of semantic value stack `yyvs35'

	yyspecial_routines35: KL_SPECIAL_ROUTINES [ARRAYED_LIST [CODE_PHRASE]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [CODE_PHRASE]]

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

feature {NONE} -- Constants

	yyFinal: INTEGER is 462
			-- Termination state id

	yyFlag: INTEGER is -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER is 83
			-- Number of tokens

	yyLast: INTEGER is 637
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER is 326
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER is 162
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



feature -- Initialization

	make is
			-- Create a new Eiffel parser.
		do
			make_eiffel_scanner
			make_parser_skeleton
		end

	execute (in_text:STRING; a_source_start_line: INTEGER; differential_flag: BOOLEAN) is
		do
			reset
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

	report_error (a_message: STRING) is
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

	differential_syntax: BOOLEAN
			-- True if the supplied text to parse is differential, in which case it can contain the 
			-- differential syntax variants, i.e. ordering markers and specialisation paths

feature {NONE} -- Implementation

	safe_put_c_attribute_child(an_attr: C_ATTRIBUTE; an_obj: C_OBJECT) is
			-- check child object for validity and then put as new child
		require
			Not_already_added: not an_attr.has_child(an_obj)
		do
			debug("ADL_parse")
				io.put_string(indent + "ATTR_NODE " + an_attr.rm_attribute_name + " put_child(" + 
						an_obj.generating_type + ": " + an_obj.rm_type_name + " [id=" + an_obj.node_id + "])%N") 
				
			end
			if check_c_attribute_child(an_attr, an_obj) then
				c_attrs.item.put_child(an_obj)
			end
		end

	check_c_attribute_child(an_attr: C_ATTRIBUTE; an_obj: C_OBJECT): BOOLEAN is
			-- check a new child node
			-- FIXME: the semantics here should be rationalised with C_ATTRIBUTE.valid_child and related functions
			-- but doing so probably requires splitting out C_SINGLE_ATTRIBUTE and C_MULTIPLE_ATTRIBUTE
		require
			Attribute_exists: an_attr /= Void
			Object_exists: an_obj /= Void
		local
			s: STRING
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
				if an_obj.occurrences.upper_unbounded or an_obj.occurrences.upper > 1 then
					s := create_message("VACSO", ar)
				elseif an_obj.is_addressable and an_attr.has_child_with_id(an_obj.node_id) then
					s := create_message("VACSI", ar)
				elseif not an_obj.is_addressable and an_attr.has_child_with_rm_type_name(an_obj.rm_type_name) then
					s := create_message("VACSIT", ar)
				else
					Result := True
				end
			elseif an_attr.is_multiple then
				if not an_attr.cardinality.interval.upper_unbounded and (an_obj.occurrences.upper_unbounded or 
								an_attr.cardinality.interval.upper < an_obj.occurrences.upper) then
					ar.extend(an_attr.cardinality.interval.as_string)
					ar.extend(an_obj.occurrences.as_string)
					s := create_message("VACMC", ar)
				elseif not an_obj.is_addressable then
					s := create_message("VACMM", ar)
				elseif an_attr.has_child_with_id(an_obj.node_id) then
					s := create_message("VACMI", ar)
				else
					Result := True
				end
			end

			if not Result then
				raise_error
				report_error(s)
				abort
			end
		end

feature {NONE} -- Parse Tree

	object_nodes: ARRAYED_STACK [C_COMPLEX_OBJECT]
	complex_obj: C_COMPLEX_OBJECT

	c_attrs: ARRAYED_STACK [C_ATTRIBUTE]
			-- main stack of attributes during construction

	c_diff_attrs: ARRAYED_LIST [C_ATTRIBUTE]
			-- reference list of attributes with compressed paths that require a special grafting process

	attr_node: C_ATTRIBUTE

	c_prim_obj: C_PRIMITIVE_OBJECT
	c_code_phrase_obj: C_CODE_PHRASE
	constraint_ref: CONSTRAINT_REF
	archetype_internal_ref: ARCHETYPE_INTERNAL_REF
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
	c_date: C_DATE
	c_integer:  C_INTEGER
	c_time: C_TIME
	c_date_time: C_DATE_TIME
	c_duration: C_DURATION

	a_cardinality: CARDINALITY
	cardinality_limit_pos_infinity: BOOLEAN

	rm_attribute_name: STRING
	path_str: STRING
	occurrences: STRING
	c_occurrences_default: BOOLEAN

	invariant_expr: STRING

	time_vc: TIME_VALIDITY_CHECKER
	date_vc: DATE_VALIDITY_CHECKER

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

	indent: STRING
	str: STRING

end
