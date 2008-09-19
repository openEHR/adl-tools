indexing
	component:   "openEHR Archetype Project"
	description: "Validating parser for Archetype Description Language (ADL)"
	keywords:    "ADL, dADL"
	
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class DADL_VALIDATOR

inherit
	DADL_VALIDATOR_PARENT
		redefine
			report_error
		end

creation
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
			yyval27: ARRAYED_LIST [ANY]
			yyval36: INTERVAL [PART_COMPARABLE]
			yyval13: ARRAYED_LIST [STRING]
			yyval2: INTEGER
			yyval15: ARRAYED_LIST [INTEGER_REF]
			yyval28: INTERVAL [INTEGER_REF]
			yyval3: REAL
			yyval17: ARRAYED_LIST [REAL_REF]
			yyval29: INTERVAL [REAL_REF]
			yyval6: BOOLEAN
			yyval21: ARRAYED_LIST [BOOLEAN_REF]
			yyval5: CHARACTER
			yyval19: ARRAYED_LIST [CHARACTER_REF]
			yyval7: DATE
			yyval22: ARRAYED_LIST [DATE]
			yyval31: INTERVAL [DATE]
			yyval9: TIME
			yyval23: ARRAYED_LIST [TIME]
			yyval30: INTERVAL [TIME]
			yyval8: DATE_TIME
			yyval24: ARRAYED_LIST [DATE_TIME]
			yyval32: INTERVAL [DATE_TIME]
			yyval10: DATE_TIME_DURATION
			yyval25: ARRAYED_LIST [DATE_TIME_DURATION]
			yyval34: INTERVAL [DURATION]
			yyval11: CODE_PHRASE
			yyval26: ARRAYED_LIST [CODE_PHRASE]
			yyval12: URI
		do
			inspect yy_act
when 1 then
--|#line 79 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 79")
end

			output := complex_object_nodes.item

			debug("ADL_parse")
				io.put_string("Anonymous object data definition validated%N")
			end
			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 2 then
--|#line 88 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 88")
end

			output := complex_object_nodes.item

			debug("ADL_parse")
				io.put_string("Typed object data definition validated%N")
			end
			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 3 then
--|#line 97 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 97")
end

			debug("ADL_parse")
				io.put_string("dADL text NOT validated%N")
			end
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 4 then
--|#line 109 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 109")
end

			debug("ADL_parse")
				io.put_string(indent + "typed_object_received " +  complex_object_nodes.item.node_id + "%N")
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyvs1.put (yyval1, yyvsp1)
end
when 5 then
--|#line 115 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 115")
end

			debug("ADL_parse")
				io.put_string(indent + "empty typed_object_received " +  complex_object_nodes.item.node_id + "%N")
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 6 then
--|#line 123 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 123")
end

			-- create object root node
			debug("ADL_parse")
				io.put_string(indent + "typed_object_head: create object_node(" + yyvs4.item (yyvsp4) + ")%N")
				io.put_string(indent + "typed_object_head: PUSH Object node%N")
				indent.append("%T")
			end
			create object_node.make_typed(yyvs4.item (yyvsp4))
			complex_object_nodes.extend(object_node)
		
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
--|#line 134 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 134")
end

			-- create object root node
			debug("ADL_parse")
				io.put_string(indent + "typed_identified_object_head: create object_node(" + "[" + yyvs4.item (yyvsp4 - 1) + "] = " + yyvs4.item (yyvsp4) + ")%N")
				io.put_string(indent + "typed_identified_object_head: PUSH Object node%N")
				indent.append("%T")
			end
			create object_node.make_typed_identified(yyvs4.item (yyvsp4), yyvs4.item (yyvsp4 - 1))
			complex_object_nodes.extend(object_node)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp4 := yyvsp4 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 8 then
--|#line 147 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 147")
end

			debug("ADL_parse")
				io.put_string(indent + "attr_val complete%N")
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 9 then
--|#line 153 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 153")
end

			debug("ADL_parse")
				io.put_string(indent + "attr_val complete%N")
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 10 then
--|#line 159 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 159")
end

			debug("ADL_parse")
				io.put_string(indent + "attr_val complete%N")
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 11 then
--|#line 168 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 168")
end

			if not attr_nodes.item.is_multiple then
				debug("ADL_parse")
					io.put_string(indent + "attr_val: POP single attr node (" +  attr_nodes.item.rm_attr_name+ ")%N")
					indent.remove_tail(1)
				end
				attr_nodes.remove
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 12 then
--|#line 180 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 180")
end

			-- create first anonymous object
			if complex_object_nodes.is_empty then
				debug("ADL_parse")
					io.put_string(indent + "attr_id: create object_node.make_anonymous%N")
					io.put_string(indent + "attr_id: PUSH Object node%N")
					indent.append("%T")
				end
				create object_node.make_anonymous
				complex_object_nodes.extend(object_node)
			end

			debug("ADL_parse")
				io.put_string(indent + "attr_id: create_attr_node.make_single(<<" + yyvs4.item (yyvsp4) + ">>)%N")
				io.put_string(indent + "attr_id: PUSH attr node%N")
			end
			create attr_node.make_single(yyvs4.item (yyvsp4))
			attr_nodes.extend(attr_node)

			debug("ADL_parse")
				io.put_string(indent + "attr_id: complex_object_nodes.item(" + complex_object_nodes.item.node_id + 
						").put_attribute(attr_node(" + attr_nodes.item.rm_attr_name + ")%N")
				indent.append("%T")
			end

			if not complex_object_nodes.item.has_attribute(attr_nodes.item.rm_attr_name) then
				complex_object_nodes.item.put_attribute(attr_nodes.item)
			else
				raise_error
				report_error("Duplicate attribute name: " + attr_nodes.item.rm_attr_name)
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
when 13 then
--|#line 214 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 214")
end

			-- create first anonymous object
			if complex_object_nodes.is_empty then
				debug("ADL_parse")
					io.put_string(indent + "attr_id: create object_node.make_anonymous%N")
					io.put_string(indent + "attr_id: PUSH Object node%N")
					indent.append("%T")
				end
				create object_node.make_anonymous
				complex_object_nodes.extend(object_node)
			end

			-- may have to pop last attr node if on a new one of a different name
			if attr_nodes.count = complex_object_nodes.count then
				debug("ADL_parse")
					io.put_string(indent + "attr_id: POP multiple attr node (" +  attr_nodes.item.rm_attr_name + ")%N")
					indent.remove_tail(1)
				end
				attr_nodes.remove
			end

			-- attr node might already be there if we are past the first of a series of "items(1), items(2)" rels
			if not complex_object_nodes.item.has_attribute(yyvs4.item (yyvsp4)) then
				debug("ADL_parse")
					io.put_string(indent + "attr_id: create_attr_node.make_multiple(<<" + yyvs4.item (yyvsp4) + ">>)%N")
					io.put_string(indent + "attr_id: PUSH attr node%N")
					indent.append("%T")
				end

				create attr_node.make_multiple(yyvs4.item (yyvsp4))
				attr_nodes.extend(attr_node)

				debug("ADL_parse")
					io.put_string(indent + "attr_id: complex_object_nodes.item(" + complex_object_nodes.item.node_id + 
							").put_attribute(attr_node(" + attr_node.rm_attr_name + ")%N")
				end
				complex_object_nodes.item.put_attribute(attr_node)
			else
				-- still have to put the attribute on the stack
				debug("ADL_parse")
					indent.append("%T")
				end
				attr_nodes.extend(complex_object_nodes.item.attribute(yyvs4.item (yyvsp4)))
			end

			node_qualifier := yyvs1.item (yyvsp1 - 1).out
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -2
	yyvsp4 := yyvsp4 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 14 then
--|#line 262 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 262")
end

			raise_error
			report_error("Error in qualifier; expecting string, integer, real, character, date/time")
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 15 then
--|#line 270 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 270")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 16 then
--|#line 271 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 271")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 17 then
--|#line 272 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 272")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 18 then
--|#line 275 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 275")
end

			if node_qualifier /= Void then
				debug("ADL_parse")
					io.put_string(indent + "object_complex_head: create object_node_make (" + node_qualifier + ")%N")
				end
				create object_node.make_identified(node_qualifier)
				node_qualifier := Void
			else
				debug("ADL_parse")
					io.put_string(indent + "object_complex_head: create object_node.make_anonymous)%N")
				end
				create object_node.make_anonymous
			end

			debug("ADL_parse")
				io.put_string(indent + "object_complex_head: PUSH Obj node%N")
				indent.append("%T")
			end
			complex_object_nodes.extend(object_node)

			if not attr_nodes.item.has_child(complex_object_nodes.item.node_id) then
				debug("ADL_parse")
					io.put_string(indent + "object_complex_head; attr_nodes(<<" + attr_nodes.item.rm_attr_name + ">>).item.put_child(complex_object_nodes.item(" + complex_object_nodes.item.node_id + "))%N")
				end
				attr_nodes.item.put_child(complex_object_nodes.item)
			else
				raise_error
				report_error("Qualifier must be unique; " + complex_object_nodes.item.node_id 
							+ " already exists under " + attr_nodes.item.rm_attr_name)
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 19 then
--|#line 310 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 310")
end

			-- may have to pop last attr node if it is a multiple one
			if attr_nodes.count > complex_object_nodes.count - 1 and attr_nodes.item.is_multiple then
				debug("ADL_parse")
					io.put_string(indent + "attr_val: POP multiple attr node (" +  attr_nodes.item.rm_attr_name+ ")%N")
					indent.remove_tail(1)
				end
				attr_nodes.remove
			else
				debug("ADL_parse")
					io.put_string(indent + "attr_val: (not popping POP multiple attr node (" +  
							attr_nodes.item.rm_attr_name+ "))%N")
					io.put_string(indent + "%T(attr_nodes.count = " + attr_nodes.count.out + 
							"; complex_object_nodes.count = " + complex_object_nodes.count.out + ")%N")
				end
			end

			debug("ADL_parse")
				io.put_string(indent + "object_complex_body: POP Object node(" + complex_object_nodes.item.node_id + ")%N")
				indent.remove_tail(1)
			end
			complex_object_nodes.remove
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 20 then
--|#line 336 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 336")
end

			debug("ADL_parse")
				io.put_string(indent + "object_basic; attr_nodes(<<" + attr_nodes.item.rm_attr_name + ">>).item.put_child(<<" + object_item.as_string + ">>)%N")
			end
			attr_nodes.item.put_child(object_item)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 21 then
--|#line 345 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 345")
end

			debug("ADL_parse")
				io.put_string(indent + "object_empty; no child to put)%N")
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 22 then
--|#line 353 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 353")
end

			if node_qualifier /= Void then
				create primitive_object_node.make_identified(yyvs1.item (yyvsp1), node_qualifier)
				node_qualifier := Void
			else
				create primitive_object_node.make_anonymous(yyvs1.item (yyvsp1))
			end
			object_item := primitive_object_node
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 23 then
--|#line 363 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 363")
end

			if node_qualifier /= Void then
				create primitive_object_list_node.make_identified(yyvs27.item (yyvsp27), node_qualifier)
				node_qualifier := Void
			else
				create primitive_object_list_node.make_anonymous(yyvs27.item (yyvsp27))
			end
			object_item := primitive_object_list_node
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp27 := yyvsp27 -1
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
when 24 then
--|#line 373 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 373")
end

			if node_qualifier /= Void then
				create primitive_object_interval_node.make_identified(yyvs36.item (yyvsp36), node_qualifier)
				node_qualifier := Void
			else
				create primitive_object_interval_node.make_anonymous(yyvs36.item (yyvsp36))
			end
			object_item := primitive_object_interval_node
		
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
when 25 then
--|#line 383 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 383")
end

			if node_qualifier /= Void then
				create primitive_object_node.make_identified(yyvs11.item (yyvsp11), node_qualifier)
				node_qualifier := Void
			else
				create primitive_object_node.make_anonymous(yyvs11.item (yyvsp11))
			end
			object_item := primitive_object_node
		
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
when 26 then
--|#line 393 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 393")
end

			if node_qualifier /= Void then
				create primitive_object_list_node.make_identified(yyvs26.item (yyvsp26), node_qualifier)
				node_qualifier := Void
			else
				create primitive_object_list_node.make_anonymous(yyvs26.item (yyvsp26))
			end
			object_item := primitive_object_list_node
		
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
when 27 then
--|#line 405 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 405")
end

			yyval1 := yyvs1.item (yyvsp1)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 28 then
--|#line 409 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 409")
end

			yyval1 := yyvs2.item (yyvsp2)
		
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
when 29 then
--|#line 413 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 413")
end

			yyval1 := yyvs3.item (yyvsp3)
		
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
when 30 then
--|#line 417 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 417")
end

			yyval1 := yyvs6.item (yyvsp6)
		
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
when 31 then
--|#line 421 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 421")
end

			yyval1 := yyvs5.item (yyvsp5)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp5 := yyvsp5 -1
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
when 32 then
--|#line 425 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 425")
end

			yyval1 := yyvs7.item (yyvsp7)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp7 := yyvsp7 -1
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
when 33 then
--|#line 429 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 429")
end

			yyval1 := yyvs9.item (yyvsp9)
		
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
when 34 then
--|#line 433 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 433")
end

			yyval1 := yyvs8.item (yyvsp8)
		
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
when 35 then
--|#line 437 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 437")
end

			yyval1 := yyvs10.item (yyvsp10)
		
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
when 36 then
--|#line 441 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 441")
end

			yyval1 := yyvs12.item (yyvsp12)
		
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
when 37 then
--|#line 447 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 447")
end

			yyval27 := yyvs13.item (yyvsp13)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp27 := yyvsp27 + 1
	yyvsp13 := yyvsp13 -1
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
when 38 then
--|#line 451 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 451")
end

			yyval27 := yyvs15.item (yyvsp15)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp27 := yyvsp27 + 1
	yyvsp15 := yyvsp15 -1
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
when 39 then
--|#line 455 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 455")
end

			yyval27 := yyvs17.item (yyvsp17)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp27 := yyvsp27 + 1
	yyvsp17 := yyvsp17 -1
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
when 40 then
--|#line 459 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 459")
end

			yyval27 := yyvs21.item (yyvsp21)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp27 := yyvsp27 + 1
	yyvsp21 := yyvsp21 -1
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
when 41 then
--|#line 463 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 463")
end

			yyval27 := yyvs19.item (yyvsp19)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp27 := yyvsp27 + 1
	yyvsp19 := yyvsp19 -1
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
when 42 then
--|#line 467 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 467")
end

			yyval27 := yyvs22.item (yyvsp22)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp27 := yyvsp27 + 1
	yyvsp22 := yyvsp22 -1
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
when 43 then
--|#line 471 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 471")
end

			yyval27 := yyvs23.item (yyvsp23)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp27 := yyvsp27 + 1
	yyvsp23 := yyvsp23 -1
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
when 44 then
--|#line 475 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 475")
end

			yyval27 := yyvs24.item (yyvsp24)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp27 := yyvsp27 + 1
	yyvsp24 := yyvsp24 -1
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
when 45 then
--|#line 479 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 479")
end

			yyval27 := yyvs25.item (yyvsp25)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp27 := yyvsp27 + 1
	yyvsp25 := yyvsp25 -1
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
when 46 then
--|#line 485 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 485")
end

			yyval36 := yyvs28.item (yyvsp28)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp36 := yyvsp36 + 1
	yyvsp28 := yyvsp28 -1
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
when 47 then
--|#line 489 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 489")
end

			yyval36 := yyvs29.item (yyvsp29)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp36 := yyvsp36 + 1
	yyvsp29 := yyvsp29 -1
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
when 48 then
--|#line 493 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 493")
end

			yyval36 := yyvs31.item (yyvsp31)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp36 := yyvsp36 + 1
	yyvsp31 := yyvsp31 -1
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
when 49 then
--|#line 497 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 497")
end

			yyval36 := yyvs30.item (yyvsp30)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp36 := yyvsp36 + 1
	yyvsp30 := yyvsp30 -1
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
when 50 then
--|#line 501 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 501")
end

			yyval36 := yyvs32.item (yyvsp32)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp36 := yyvsp36 + 1
	yyvsp32 := yyvsp32 -1
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
when 51 then
--|#line 505 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 505")
end

			yyval36 := yyvs34.item (yyvsp34)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp36 := yyvsp36 + 1
	yyvsp34 := yyvsp34 -1
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
when 52 then
--|#line 513 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 513")
end

			yyval1 := yyvs4.item (yyvsp4)
		
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
when 53 then
--|#line 519 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 519")
end

			create string_list.make(0)
			string_list.extend(yyvs4.item (yyvsp4 - 1))
			string_list.extend(yyvs4.item (yyvsp4))
			yyval13 := string_list
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp13 := yyvsp13 + 1
	yyvsp4 := yyvsp4 -2
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
when 54 then
--|#line 526 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 526")
end

			string_list.extend(yyvs4.item (yyvsp4))
			yyval13 := string_list
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyvs13.put (yyval13, yyvsp13)
end
when 55 then
--|#line 531 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 531")
end

			create string_list.make(0)
			string_list.extend(yyvs4.item (yyvsp4))
			yyval13 := string_list
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp13 := yyvsp13 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -2
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
when 56 then
--|#line 539 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 539")
end

			int_val := yyvs2.item (yyvsp2)
			yyval2 := int_val
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 57 then
--|#line 543 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 543")
end

			int_val := yyvs2.item (yyvsp2)
			yyval2 := int_val
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs2.put (yyval2, yyvsp2)
end
when 58 then
--|#line 547 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 547")
end

			int_val := - yyvs2.item (yyvsp2)
			yyval2 := int_val
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs2.put (yyval2, yyvsp2)
end
when 59 then
--|#line 553 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 553")
end

			create integer_ref_list.make(0)
			create integer_ref
			integer_ref.set_item(yyvs2.item (yyvsp2 - 1))
			integer_ref_list.extend(integer_ref)
			create integer_ref
			integer_ref.set_item(yyvs2.item (yyvsp2))
			integer_ref_list.extend(integer_ref)
			yyval15 := integer_ref_list
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp15 := yyvsp15 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp1 := yyvsp1 -1
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
when 60 then
--|#line 564 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 564")
end

			create integer_ref
			integer_ref.set_item(yyvs2.item (yyvsp2))
			integer_ref_list.extend(integer_ref)
			yyval15 := integer_ref_list
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyvs15.put (yyval15, yyvsp15)
end
when 61 then
--|#line 571 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 571")
end

			create integer_ref_list.make(0)
			create integer_ref
			integer_ref.set_item(yyvs2.item (yyvsp2))
			integer_ref_list.extend(integer_ref)
			yyval15 := integer_ref_list
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp15 := yyvsp15 + 1
	yyvsp2 := yyvsp2 -1
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
when 62 then
--|#line 581 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 581")
end

			create integer_ref
			integer_ref.set_item(yyvs2.item (yyvsp2 - 1))
			create integer_ref_2
			integer_ref_2.set_item(yyvs2.item (yyvsp2))
			create integer_interval.make_bounded(integer_ref, integer_ref_2, True, True)
			yyval28 := integer_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp28 := yyvsp28 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -2
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
when 63 then
--|#line 590 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 590")
end

			create integer_ref
			integer_ref.set_item(yyvs2.item (yyvsp2))
			create integer_interval.make_lower_unbounded(integer_ref, False)
			yyval28 := integer_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp28 := yyvsp28 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -1
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
when 64 then
--|#line 597 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 597")
end

			create integer_ref
			integer_ref.set_item(yyvs2.item (yyvsp2))
			create integer_interval.make_lower_unbounded(integer_ref, True)
			yyval28 := integer_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp28 := yyvsp28 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -1
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
when 65 then
--|#line 604 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 604")
end

			create integer_ref
			integer_ref.set_item(yyvs2.item (yyvsp2))
			create integer_interval.make_upper_unbounded(integer_ref, False)
			yyval28 := integer_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp28 := yyvsp28 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -1
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
when 66 then
--|#line 611 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 611")
end

			create integer_ref
			integer_ref.set_item(yyvs2.item (yyvsp2))
			create integer_interval.make_upper_unbounded(integer_ref, True)
			yyval28 := integer_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp28 := yyvsp28 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -1
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
when 67 then
--|#line 618 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 618")
end

			create integer_ref
			integer_ref.set_item(yyvs2.item (yyvsp2))
			create integer_interval.make_point(integer_ref)
			yyval28 := integer_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp28 := yyvsp28 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -1
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
when 68 then
--|#line 627 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 627")
end

			real_val := yyvs3.item (yyvsp3)
			yyval3 := real_val
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs3.put (yyval3, yyvsp3)
end
when 69 then
--|#line 632 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 632")
end

			real_val := yyvs3.item (yyvsp3)
			yyval3 := real_val
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs3.put (yyval3, yyvsp3)
end
when 70 then
--|#line 637 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 637")
end

			real_val := - yyvs3.item (yyvsp3)
			yyval3 := real_val
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs3.put (yyval3, yyvsp3)
end
when 71 then
--|#line 644 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 644")
end

			create real_ref_list.make(0)
			create real_ref
			real_ref.set_item(yyvs3.item (yyvsp3 - 1))
			real_ref_list.extend(real_ref)

			create real_ref
			real_ref.set_item(yyvs3.item (yyvsp3))
			real_ref_list.extend(real_ref)
			yyval17 := real_ref_list
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp17 := yyvsp17 + 1
	yyvsp3 := yyvsp3 -2
	yyvsp1 := yyvsp1 -1
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
when 72 then
--|#line 656 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 656")
end

			create real_ref
			real_ref.set_item(yyvs3.item (yyvsp3))
			real_ref_list.extend(real_ref)
			yyval17 := real_ref_list
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyvs17.put (yyval17, yyvsp17)
end
when 73 then
--|#line 663 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 663")
end

			create real_ref_list.make(0)
			create real_ref
			real_ref.set_item(yyvs3.item (yyvsp3))
			real_ref_list.extend(real_ref)
			yyval17 := real_ref_list
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp17 := yyvsp17 + 1
	yyvsp3 := yyvsp3 -1
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
when 74 then
--|#line 673 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 673")
end

			create real_ref
			real_ref.set_item(yyvs3.item (yyvsp3 - 1))
			create real_ref_2
			real_ref_2.set_item(yyvs3.item (yyvsp3))
			create real_interval.make_bounded(real_ref, real_ref_2, True, True)
			yyval29 := real_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp29 := yyvsp29 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -2
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
when 75 then
--|#line 682 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 682")
end

			create real_ref
			real_ref.set_item(yyvs3.item (yyvsp3))
			create real_interval.make_lower_unbounded(real_ref, False)
			yyval29 := real_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp29 := yyvsp29 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
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
when 76 then
--|#line 689 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 689")
end

			create real_ref
			real_ref.set_item(yyvs3.item (yyvsp3))
			create real_interval.make_lower_unbounded(real_ref, True)
			yyval29 := real_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp29 := yyvsp29 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
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
when 77 then
--|#line 696 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 696")
end

			create real_ref
			real_ref.set_item(yyvs3.item (yyvsp3))
			create real_interval.make_upper_unbounded(real_ref, False)
			yyval29 := real_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp29 := yyvsp29 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
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
when 78 then
--|#line 703 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 703")
end

			create real_ref
			real_ref.set_item(yyvs3.item (yyvsp3))
			create real_interval.make_upper_unbounded(real_ref, True)
			yyval29 := real_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp29 := yyvsp29 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
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
when 79 then
--|#line 710 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 710")
end

			create real_ref
			real_ref.set_item(yyvs3.item (yyvsp3))
			create real_interval.make_point(real_ref)
			yyval29 := real_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp29 := yyvsp29 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp3 := yyvsp3 -1
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
when 80 then
--|#line 719 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 719")
end

			yyval6 := True
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp6 := yyvsp6 + 1
	yyvsp1 := yyvsp1 -1
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
	yyvs6.put (yyval6, yyvsp6)
end
when 81 then
--|#line 723 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 723")
end

			yyval6 := False
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp6 := yyvsp6 + 1
	yyvsp1 := yyvsp1 -1
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
	yyvs6.put (yyval6, yyvsp6)
end
when 82 then
--|#line 729 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 729")
end

			create boolean_list.make(0)
			create boolean_ref
			boolean_ref.set_item(yyvs6.item (yyvsp6 - 1))
			boolean_list.extend(boolean_ref)
			create boolean_ref
			boolean_ref.set_item(yyvs6.item (yyvsp6))
			boolean_list.extend(boolean_ref)
			yyval21 := boolean_list
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp21 := yyvsp21 + 1
	yyvsp6 := yyvsp6 -2
	yyvsp1 := yyvsp1 -1
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
when 83 then
--|#line 740 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 740")
end

			create boolean_ref
			boolean_ref.set_item(yyvs6.item (yyvsp6))
			boolean_list.extend(boolean_ref)
			yyval21 := boolean_list
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp6 := yyvsp6 -1
	yyvs21.put (yyval21, yyvsp21)
end
when 84 then
--|#line 747 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 747")
end

			create boolean_list.make(0)
			create boolean_ref
			boolean_ref.set_item(yyvs6.item (yyvsp6))
			boolean_list.extend(boolean_ref)
			yyval21 := boolean_list
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp21 := yyvsp21 + 1
	yyvsp6 := yyvsp6 -1
	yyvsp1 := yyvsp1 -2
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
when 85 then
--|#line 757 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 757")
end

			yyval5 := yyvs5.item (yyvsp5)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs5.put (yyval5, yyvsp5)
end
when 86 then
--|#line 763 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 763")
end

			create character_list.make(0)
			create character_ref
			character_ref.set_item(yyvs5.item (yyvsp5 - 1))
			character_list.extend(character_ref)
			create character_ref
			character_ref.set_item(yyvs5.item (yyvsp5))
			character_list.extend(character_ref)
			yyval19 := character_list
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp19 := yyvsp19 + 1
	yyvsp5 := yyvsp5 -2
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
when 87 then
--|#line 774 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 774")
end

			create character_ref
			character_ref.set_item(yyvs5.item (yyvsp5))
			character_list.extend(character_ref)
			yyval19 := character_list
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp5 := yyvsp5 -1
	yyvs19.put (yyval19, yyvsp19)
end
when 88 then
--|#line 781 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 781")
end

			create character_list.make(0)
			create character_ref
			character_ref.set_item(yyvs5.item (yyvsp5))
			character_list.extend(character_ref)
			yyval19 := character_list
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp19 := yyvsp19 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -2
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
when 89 then
--|#line 791 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 791")
end

			if date_vc.is_correct_date(yyvs2.item (yyvsp2 - 2), yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)) then
				create a_date.make(yyvs2.item (yyvsp2 - 2), yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
				yyval7 := a_date
			else
				raise_error
				report_error("invalid date: " + yyvs2.item (yyvsp2 - 2).out + "-" + yyvs2.item (yyvsp2 - 1).out + "-" + yyvs2.item (yyvsp2).out)
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp7 := yyvsp7 + 1
	yyvsp2 := yyvsp2 -3
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
when 90 then
--|#line 804 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 804")
end

			create date_list.make(0)
			date_list.extend(yyvs7.item (yyvsp7 - 1))
			date_list.extend(yyvs7.item (yyvsp7))
			yyval22 := date_list
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp22 := yyvsp22 + 1
	yyvsp7 := yyvsp7 -2
	yyvsp1 := yyvsp1 -1
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
when 91 then
--|#line 811 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 811")
end

			date_list.extend(yyvs7.item (yyvsp7))
			yyval22 := date_list
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp7 := yyvsp7 -1
	yyvs22.put (yyval22, yyvsp22)
end
when 92 then
--|#line 816 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 816")
end

			create date_list.make(0)
			date_list.extend(yyvs7.item (yyvsp7))
			yyval22 := date_list
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp22 := yyvsp22 + 1
	yyvsp7 := yyvsp7 -1
	yyvsp1 := yyvsp1 -2
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
when 93 then
--|#line 824 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 824")
end

			create date_interval.make_bounded(yyvs7.item (yyvsp7 - 1), yyvs7.item (yyvsp7), True, True)
			yyval31 := date_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp31 := yyvsp31 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp7 := yyvsp7 -2
	if yyvsp31 >= yyvsc31 then
		if yyvs31 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs31")
			end
			create yyspecial_routines31
			yyvsc31 := yyInitial_yyvs_size
			yyvs31 := yyspecial_routines31.make (yyvsc31)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs31")
			end
			yyvsc31 := yyvsc31 + yyInitial_yyvs_size
			yyvs31 := yyspecial_routines31.resize (yyvs31, yyvsc31)
		end
	end
	yyvs31.put (yyval31, yyvsp31)
end
when 94 then
--|#line 829 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 829")
end

			create date_interval.make_lower_unbounded(yyvs7.item (yyvsp7), False)
			yyval31 := date_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp31 := yyvsp31 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp7 := yyvsp7 -1
	if yyvsp31 >= yyvsc31 then
		if yyvs31 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs31")
			end
			create yyspecial_routines31
			yyvsc31 := yyInitial_yyvs_size
			yyvs31 := yyspecial_routines31.make (yyvsc31)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs31")
			end
			yyvsc31 := yyvsc31 + yyInitial_yyvs_size
			yyvs31 := yyspecial_routines31.resize (yyvs31, yyvsc31)
		end
	end
	yyvs31.put (yyval31, yyvsp31)
end
when 95 then
--|#line 834 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 834")
end

			create date_interval.make_lower_unbounded(yyvs7.item (yyvsp7), True)
			yyval31 := date_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp31 := yyvsp31 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp7 := yyvsp7 -1
	if yyvsp31 >= yyvsc31 then
		if yyvs31 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs31")
			end
			create yyspecial_routines31
			yyvsc31 := yyInitial_yyvs_size
			yyvs31 := yyspecial_routines31.make (yyvsc31)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs31")
			end
			yyvsc31 := yyvsc31 + yyInitial_yyvs_size
			yyvs31 := yyspecial_routines31.resize (yyvs31, yyvsc31)
		end
	end
	yyvs31.put (yyval31, yyvsp31)
end
when 96 then
--|#line 839 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 839")
end

			create date_interval.make_upper_unbounded(yyvs7.item (yyvsp7), False)
			yyval31 := date_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp31 := yyvsp31 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp7 := yyvsp7 -1
	if yyvsp31 >= yyvsc31 then
		if yyvs31 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs31")
			end
			create yyspecial_routines31
			yyvsc31 := yyInitial_yyvs_size
			yyvs31 := yyspecial_routines31.make (yyvsc31)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs31")
			end
			yyvsc31 := yyvsc31 + yyInitial_yyvs_size
			yyvs31 := yyspecial_routines31.resize (yyvs31, yyvsc31)
		end
	end
	yyvs31.put (yyval31, yyvsp31)
end
when 97 then
--|#line 844 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 844")
end

			create date_interval.make_upper_unbounded(yyvs7.item (yyvsp7), True)
			yyval31 := date_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp31 := yyvsp31 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp7 := yyvsp7 -1
	if yyvsp31 >= yyvsc31 then
		if yyvs31 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs31")
			end
			create yyspecial_routines31
			yyvsc31 := yyInitial_yyvs_size
			yyvs31 := yyspecial_routines31.make (yyvsc31)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs31")
			end
			yyvsc31 := yyvsc31 + yyInitial_yyvs_size
			yyvs31 := yyspecial_routines31.resize (yyvs31, yyvsc31)
		end
	end
	yyvs31.put (yyval31, yyvsp31)
end
when 98 then
--|#line 849 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 849")
end

			create date_interval.make_point(yyvs7.item (yyvsp7))
			yyval31 := date_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp31 := yyvsp31 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp7 := yyvsp7 -1
	if yyvsp31 >= yyvsc31 then
		if yyvs31 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs31")
			end
			create yyspecial_routines31
			yyvsc31 := yyInitial_yyvs_size
			yyvs31 := yyspecial_routines31.make (yyvsc31)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs31")
			end
			yyvsc31 := yyvsc31 + yyInitial_yyvs_size
			yyvs31 := yyspecial_routines31.resize (yyvs31, yyvsc31)
		end
	end
	yyvs31.put (yyval31, yyvsp31)
end
when 99 then
--|#line 856 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 856")
end

			yyval9 := a_time
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp9 := yyvsp9 + 1
	yyvsp1 := yyvsp1 -1
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
when 100 then
--|#line 860 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 860")
end

			yyval9 := a_time
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp9 := yyvsp9 + 1
	yyvsp1 := yyvsp1 -2
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
when 101 then
--|#line 866 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 866")
end

			if time_vc.is_correct_time(yyvs2.item (yyvsp2 - 2), yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), False) then
				create a_time.make(yyvs2.item (yyvsp2 - 2), yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
				yyval1 := a_time
			else
				raise_error
				report_error("invalid time: " + yyvs2.item (yyvsp2 - 2).out + ":" + yyvs2.item (yyvsp2 - 1).out + ":" + yyvs2.item (yyvsp2).out)
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -3
	yyvs1.put (yyval1, yyvsp1)
end
when 102 then
--|#line 877 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 877")
end

			if time_vc.is_correct_time(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs3.item (yyvsp3), False) then
				create a_time.make_fine(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs3.item (yyvsp3))
				yyval1 := a_time
			else
				raise_error
				report_error("invalid time: " + yyvs2.item (yyvsp2 - 1).out + ":" + yyvs2.item (yyvsp2).out + ":" + yyvs3.item (yyvsp3).out)
				abort
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -2
	yyvsp3 := yyvsp3 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 103 then
--|#line 890 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 890")
end

			-- set timezone to Greenwich
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 104 then
--|#line 894 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 894")
end

			-- set it to some other meridian
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 105 then
--|#line 900 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 900")
end

			create time_list.make(0)
			time_list.extend(yyvs9.item (yyvsp9 - 1))
			time_list.extend(yyvs9.item (yyvsp9))
			yyval23 := time_list
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp23 := yyvsp23 + 1
	yyvsp9 := yyvsp9 -2
	yyvsp1 := yyvsp1 -1
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
when 106 then
--|#line 907 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 907")
end

			time_list.extend(yyvs9.item (yyvsp9))
			yyval23 := time_list
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp9 := yyvsp9 -1
	yyvs23.put (yyval23, yyvsp23)
end
when 107 then
--|#line 912 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 912")
end

			create time_list.make(0)
			time_list.extend(yyvs9.item (yyvsp9))
			yyval23 := time_list
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp23 := yyvsp23 + 1
	yyvsp9 := yyvsp9 -1
	yyvsp1 := yyvsp1 -2
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
when 108 then
--|#line 920 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 920")
end

			create time_interval.make_bounded(yyvs9.item (yyvsp9 - 1), yyvs9.item (yyvsp9), True, True)
			yyval30 := time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp30 := yyvsp30 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp9 := yyvsp9 -2
	if yyvsp30 >= yyvsc30 then
		if yyvs30 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs30")
			end
			create yyspecial_routines30
			yyvsc30 := yyInitial_yyvs_size
			yyvs30 := yyspecial_routines30.make (yyvsc30)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs30")
			end
			yyvsc30 := yyvsc30 + yyInitial_yyvs_size
			yyvs30 := yyspecial_routines30.resize (yyvs30, yyvsc30)
		end
	end
	yyvs30.put (yyval30, yyvsp30)
end
when 109 then
--|#line 925 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 925")
end

			create time_interval.make_lower_unbounded(yyvs9.item (yyvsp9), False)
			yyval30 := time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp30 := yyvsp30 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp9 := yyvsp9 -1
	if yyvsp30 >= yyvsc30 then
		if yyvs30 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs30")
			end
			create yyspecial_routines30
			yyvsc30 := yyInitial_yyvs_size
			yyvs30 := yyspecial_routines30.make (yyvsc30)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs30")
			end
			yyvsc30 := yyvsc30 + yyInitial_yyvs_size
			yyvs30 := yyspecial_routines30.resize (yyvs30, yyvsc30)
		end
	end
	yyvs30.put (yyval30, yyvsp30)
end
when 110 then
--|#line 930 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 930")
end

			create time_interval.make_lower_unbounded(yyvs9.item (yyvsp9), True)
			yyval30 := time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp30 := yyvsp30 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp9 := yyvsp9 -1
	if yyvsp30 >= yyvsc30 then
		if yyvs30 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs30")
			end
			create yyspecial_routines30
			yyvsc30 := yyInitial_yyvs_size
			yyvs30 := yyspecial_routines30.make (yyvsc30)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs30")
			end
			yyvsc30 := yyvsc30 + yyInitial_yyvs_size
			yyvs30 := yyspecial_routines30.resize (yyvs30, yyvsc30)
		end
	end
	yyvs30.put (yyval30, yyvsp30)
end
when 111 then
--|#line 935 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 935")
end

			create time_interval.make_upper_unbounded(yyvs9.item (yyvsp9), False)
			yyval30 := time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp30 := yyvsp30 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp9 := yyvsp9 -1
	if yyvsp30 >= yyvsc30 then
		if yyvs30 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs30")
			end
			create yyspecial_routines30
			yyvsc30 := yyInitial_yyvs_size
			yyvs30 := yyspecial_routines30.make (yyvsc30)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs30")
			end
			yyvsc30 := yyvsc30 + yyInitial_yyvs_size
			yyvs30 := yyspecial_routines30.resize (yyvs30, yyvsc30)
		end
	end
	yyvs30.put (yyval30, yyvsp30)
end
when 112 then
--|#line 940 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 940")
end

			create time_interval.make_upper_unbounded(yyvs9.item (yyvsp9), True)
			yyval30 := time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp30 := yyvsp30 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp9 := yyvsp9 -1
	if yyvsp30 >= yyvsc30 then
		if yyvs30 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs30")
			end
			create yyspecial_routines30
			yyvsc30 := yyInitial_yyvs_size
			yyvs30 := yyspecial_routines30.make (yyvsc30)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs30")
			end
			yyvsc30 := yyvsc30 + yyInitial_yyvs_size
			yyvs30 := yyspecial_routines30.resize (yyvs30, yyvsc30)
		end
	end
	yyvs30.put (yyval30, yyvsp30)
end
when 113 then
--|#line 945 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 945")
end

			create time_interval.make_point(yyvs9.item (yyvsp9))
			yyval30 := time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp30 := yyvsp30 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp9 := yyvsp9 -1
	if yyvsp30 >= yyvsc30 then
		if yyvs30 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs30")
			end
			create yyspecial_routines30
			yyvsc30 := yyInitial_yyvs_size
			yyvs30 := yyspecial_routines30.make (yyvsc30)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs30")
			end
			yyvsc30 := yyvsc30 + yyInitial_yyvs_size
			yyvs30 := yyspecial_routines30.resize (yyvs30, yyvsc30)
		end
	end
	yyvs30.put (yyval30, yyvsp30)
end
when 114 then
--|#line 952 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 952")
end

			create a_date_time.make_by_date_time(yyvs7.item (yyvsp7), yyvs9.item (yyvsp9))
			yyval8 := a_date_time
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp8 := yyvsp8 + 1
	yyvsp7 := yyvsp7 -1
	yyvsp9 := yyvsp9 -1
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
when 115 then
--|#line 959 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 959")
end

			create date_time_list.make(0)
			date_time_list.extend(yyvs8.item (yyvsp8 - 1))
			date_time_list.extend(yyvs8.item (yyvsp8))
			yyval24 := date_time_list
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp24 := yyvsp24 + 1
	yyvsp8 := yyvsp8 -2
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
when 116 then
--|#line 966 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 966")
end

			date_time_list.extend(yyvs8.item (yyvsp8))
			yyval24 := date_time_list
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp8 := yyvsp8 -1
	yyvs24.put (yyval24, yyvsp24)
end
when 117 then
--|#line 971 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 971")
end

			create date_time_list.make(0)
			date_time_list.extend(yyvs8.item (yyvsp8))
			yyval24 := date_time_list
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp24 := yyvsp24 + 1
	yyvsp8 := yyvsp8 -1
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
when 118 then
--|#line 979 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 979")
end

			create date_time_interval.make_bounded(yyvs8.item (yyvsp8 - 1), yyvs8.item (yyvsp8), True, True)
			yyval32 := date_time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp8 := yyvsp8 -2
	if yyvsp32 >= yyvsc32 then
		if yyvs32 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs32")
			end
			create yyspecial_routines32
			yyvsc32 := yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.make (yyvsc32)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs32")
			end
			yyvsc32 := yyvsc32 + yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.resize (yyvs32, yyvsc32)
		end
	end
	yyvs32.put (yyval32, yyvsp32)
end
when 119 then
--|#line 984 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 984")
end

			create date_time_interval.make_lower_unbounded(yyvs8.item (yyvsp8), False)
			yyval32 := date_time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp8 := yyvsp8 -1
	if yyvsp32 >= yyvsc32 then
		if yyvs32 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs32")
			end
			create yyspecial_routines32
			yyvsc32 := yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.make (yyvsc32)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs32")
			end
			yyvsc32 := yyvsc32 + yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.resize (yyvs32, yyvsc32)
		end
	end
	yyvs32.put (yyval32, yyvsp32)
end
when 120 then
--|#line 989 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 989")
end

			create date_time_interval.make_lower_unbounded(yyvs8.item (yyvsp8), True)
			yyval32 := date_time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp8 := yyvsp8 -1
	if yyvsp32 >= yyvsc32 then
		if yyvs32 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs32")
			end
			create yyspecial_routines32
			yyvsc32 := yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.make (yyvsc32)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs32")
			end
			yyvsc32 := yyvsc32 + yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.resize (yyvs32, yyvsc32)
		end
	end
	yyvs32.put (yyval32, yyvsp32)
end
when 121 then
--|#line 994 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 994")
end

			create date_time_interval.make_upper_unbounded(yyvs8.item (yyvsp8), False)
			yyval32 := date_time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp8 := yyvsp8 -1
	if yyvsp32 >= yyvsc32 then
		if yyvs32 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs32")
			end
			create yyspecial_routines32
			yyvsc32 := yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.make (yyvsc32)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs32")
			end
			yyvsc32 := yyvsc32 + yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.resize (yyvs32, yyvsc32)
		end
	end
	yyvs32.put (yyval32, yyvsp32)
end
when 122 then
--|#line 999 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 999")
end

			create date_time_interval.make_upper_unbounded(yyvs8.item (yyvsp8), True)
			yyval32 := date_time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp8 := yyvsp8 -1
	if yyvsp32 >= yyvsc32 then
		if yyvs32 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs32")
			end
			create yyspecial_routines32
			yyvsc32 := yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.make (yyvsc32)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs32")
			end
			yyvsc32 := yyvsc32 + yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.resize (yyvs32, yyvsc32)
		end
	end
	yyvs32.put (yyval32, yyvsp32)
end
when 123 then
--|#line 1004 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1004")
end

			create date_time_interval.make_point(yyvs8.item (yyvsp8))
			yyval32 := date_time_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp8 := yyvsp8 -1
	if yyvsp32 >= yyvsc32 then
		if yyvs32 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs32")
			end
			create yyspecial_routines32
			yyvsc32 := yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.make (yyvsc32)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs32")
			end
			yyvsc32 := yyvsc32 + yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.resize (yyvs32, yyvsc32)
		end
	end
	yyvs32.put (yyval32, yyvsp32)
end
when 124 then
--|#line 1011 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1011")
end

			yyval10 := yyvs10.item (yyvsp10)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs10.put (yyval10, yyvsp10)
end
when 125 then
--|#line 1015 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1015")
end

			yyval10 := -yyvs10.item (yyvsp10)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs10.put (yyval10, yyvsp10)
end
when 126 then
--|#line 1021 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1021")
end

			yyval10 := iso8601_string_to_duration(yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp10 := yyvsp10 + 1
	yyvsp4 := yyvsp4 -1
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
when 127 then
--|#line 1027 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1027")
end

			create duration_list.make(0)
			duration_list.extend(yyvs10.item (yyvsp10 - 1))
			duration_list.extend(yyvs10.item (yyvsp10))
			yyval25 := duration_list
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp25 := yyvsp25 + 1
	yyvsp10 := yyvsp10 -2
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
when 128 then
--|#line 1034 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1034")
end

			duration_list.extend(yyvs10.item (yyvsp10))
			yyval25 := duration_list
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp10 := yyvsp10 -1
	yyvs25.put (yyval25, yyvsp25)
end
when 129 then
--|#line 1039 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1039")
end

			create duration_list.make(0)
			duration_list.extend(yyvs10.item (yyvsp10))
			yyval25 := duration_list
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp25 := yyvsp25 + 1
	yyvsp10 := yyvsp10 -1
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
when 130 then
--|#line 1047 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1047")
end

			create duration_interval.make_bounded(yyvs10.item (yyvsp10 - 1), yyvs10.item (yyvsp10), True, True)
			yyval34 := duration_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp10 := yyvsp10 -2
	if yyvsp34 >= yyvsc34 then
		if yyvs34 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs34")
			end
			create yyspecial_routines34
			yyvsc34 := yyInitial_yyvs_size
			yyvs34 := yyspecial_routines34.make (yyvsc34)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs34")
			end
			yyvsc34 := yyvsc34 + yyInitial_yyvs_size
			yyvs34 := yyspecial_routines34.resize (yyvs34, yyvsc34)
		end
	end
	yyvs34.put (yyval34, yyvsp34)
end
when 131 then
--|#line 1052 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1052")
end

			create duration_interval.make_lower_unbounded(yyvs10.item (yyvsp10), False)
			yyval34 := duration_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp10 := yyvsp10 -1
	if yyvsp34 >= yyvsc34 then
		if yyvs34 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs34")
			end
			create yyspecial_routines34
			yyvsc34 := yyInitial_yyvs_size
			yyvs34 := yyspecial_routines34.make (yyvsc34)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs34")
			end
			yyvsc34 := yyvsc34 + yyInitial_yyvs_size
			yyvs34 := yyspecial_routines34.resize (yyvs34, yyvsc34)
		end
	end
	yyvs34.put (yyval34, yyvsp34)
end
when 132 then
--|#line 1057 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1057")
end

			create duration_interval.make_lower_unbounded(yyvs10.item (yyvsp10), True)
			yyval34 := duration_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp10 := yyvsp10 -1
	if yyvsp34 >= yyvsc34 then
		if yyvs34 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs34")
			end
			create yyspecial_routines34
			yyvsc34 := yyInitial_yyvs_size
			yyvs34 := yyspecial_routines34.make (yyvsc34)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs34")
			end
			yyvsc34 := yyvsc34 + yyInitial_yyvs_size
			yyvs34 := yyspecial_routines34.resize (yyvs34, yyvsc34)
		end
	end
	yyvs34.put (yyval34, yyvsp34)
end
when 133 then
--|#line 1062 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1062")
end

			create duration_interval.make_upper_unbounded(yyvs10.item (yyvsp10), False)
			yyval34 := duration_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp10 := yyvsp10 -1
	if yyvsp34 >= yyvsc34 then
		if yyvs34 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs34")
			end
			create yyspecial_routines34
			yyvsc34 := yyInitial_yyvs_size
			yyvs34 := yyspecial_routines34.make (yyvsc34)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs34")
			end
			yyvsc34 := yyvsc34 + yyInitial_yyvs_size
			yyvs34 := yyspecial_routines34.resize (yyvs34, yyvsc34)
		end
	end
	yyvs34.put (yyval34, yyvsp34)
end
when 134 then
--|#line 1067 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1067")
end

			create duration_interval.make_upper_unbounded(yyvs10.item (yyvsp10), True)
			yyval34 := duration_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp10 := yyvsp10 -1
	if yyvsp34 >= yyvsc34 then
		if yyvs34 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs34")
			end
			create yyspecial_routines34
			yyvsc34 := yyInitial_yyvs_size
			yyvs34 := yyspecial_routines34.make (yyvsc34)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs34")
			end
			yyvsc34 := yyvsc34 + yyInitial_yyvs_size
			yyvs34 := yyspecial_routines34.resize (yyvs34, yyvsc34)
		end
	end
	yyvs34.put (yyval34, yyvsp34)
end
when 135 then
--|#line 1072 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1072")
end

			create duration_interval.make_point(yyvs10.item (yyvsp10))
			yyval34 := duration_interval
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp10 := yyvsp10 -1
	if yyvsp34 >= yyvsc34 then
		if yyvs34 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs34")
			end
			create yyspecial_routines34
			yyvsc34 := yyInitial_yyvs_size
			yyvs34 := yyspecial_routines34.make (yyvsc34)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs34")
			end
			yyvsc34 := yyvsc34 + yyInitial_yyvs_size
			yyvs34 := yyspecial_routines34.resize (yyvs34, yyvsc34)
		end
	end
	yyvs34.put (yyval34, yyvsp34)
end
when 136 then
--|#line 1079 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1079")
end

			create term.make(yyvs4.item (yyvsp4))
			yyval11 := term
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp11 := yyvsp11 + 1
	yyvsp4 := yyvsp4 -1
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
when 137 then
--|#line 1086 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1086")
end

			create term_list.make(0)
			term_list.extend(yyvs11.item (yyvsp11 - 1))
			term_list.extend(yyvs11.item (yyvsp11))
			yyval26 := term_list
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp26 := yyvsp26 + 1
	yyvsp11 := yyvsp11 -2
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
when 138 then
--|#line 1093 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1093")
end

			term_list.extend(yyvs11.item (yyvsp11))
			yyval26 := term_list
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp11 := yyvsp11 -1
	yyvs26.put (yyval26, yyvsp26)
end
when 139 then
--|#line 1098 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1098")
end

			create term_list.make(0)
			term_list.extend(yyvs11.item (yyvsp11))
			yyval26 := term_list
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp26 := yyvsp26 + 1
	yyvsp11 := yyvsp11 -1
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
when 140 then
--|#line 1106 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1106")
end

			create a_uri.make_from_string(yyvs4.item (yyvsp4))
			yyval12 := a_uri
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp12 := yyvsp12 + 1
	yyvsp4 := yyvsp4 -1
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
			when 248 then
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
			   32,   33,    2,   35,   34,   36,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,   37,   31,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			   38,    2,    2,    2,    2,    2,    2,    2,    2,    2,

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
			   25,   26,   27,   28,   29,   30, yyDummy>>)
		end

	yyr1_template: SPECIAL [INTEGER] is
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,   68,   68,   68,   70,   70,   71,   71,   69,   69,
			   69,   72,   73,   73,   73,   74,   74,   74,   77,   78,
			   79,   76,   80,   80,   80,   80,   80,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   60,   60,   60,
			   60,   60,   60,   60,   60,   60,   67,   67,   67,   67,
			   67,   67,   81,   50,   50,   50,   39,   39,   39,   51,
			   51,   51,   61,   61,   61,   61,   61,   61,   40,   40,
			   40,   52,   52,   52,   62,   62,   62,   62,   62,   62,
			   41,   41,   54,   54,   54,   42,   53,   53,   53,   43,
			   55,   55,   55,   64,   64,   64,   64,   64,   64,   45,

			   45,   82,   82,   83,   83,   56,   56,   56,   63,   63,
			   63,   63,   63,   63,   44,   57,   57,   57,   65,   65,
			   65,   65,   65,   65,   46,   46,   47,   58,   58,   58,
			   66,   66,   66,   66,   66,   66,   48,   59,   59,   59,
			   49, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER] is
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    4,    4,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    4,    1,    1,    1,
			    1,    5,    4,    4,    4,    3,    2,    1,    2,    3,
			    6,    5,    7,    8,    9,   10,   10,   12,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    3,
			    2,   10,    3,    2,    1,    1,    2,    9,    1,    1,
			    1,    1,    1,    1,    1,    4,    4,    2,    3,    6,
			    5,    7,    8,    9,   10,   11,   13,   15,   17,   19,
			   21,   22,   23,   24,   25,   26,   27,   28,   29,   30,
			   31,   32,   34,   36,    1,    1,    1,    1,    2,    2,

			    2,    1,    1,    1,    1,    2,    3,    7,    8,    9,
			   10,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    2,    3,    7,    8,    9,
			   10,    2,    3,    7,    8,    9,   10,    2,    3,    7,
			    8,    9,   10,    2,    3,    7,    8,    9,   10,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    4,    1,    1,    1,    2,    2,    1,    1,
			    1,    3,    1,    6,    1,    5,    1,    2,    7,    1,
			    7,    8,    1,    9,    1,    1,   10,    1,   11,    4,

			    2,    3,    5,    6,    7,    9,    8,   10,   11,    3,
			    2,    2,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    2,    3,    7,    8,
			    9,   10,    1,    1,    1,    1,    1,    1,    1,    1,
			    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER] is
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    2,    3,    4,    4,    4,    4,    4,
			    4,    4,    4,    4,    5,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER] is
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    0,    0,   12,    6,    3,    1,    2,    0,    8,    0,
			    0,    0,    0,    9,    0,    0,    7,    0,    0,   81,
			   80,   85,  140,  126,   52,   68,   56,   14,   28,   29,
			   30,   31,   32,   34,   33,   35,  124,   36,    0,   27,
			   99,   10,    5,    0,   18,   11,   15,    0,   17,   70,
			   58,  125,   69,   57,    0,    0,    0,  114,   13,  103,
			    0,  100,    4,    0,   21,  136,   52,   28,   29,   30,
			   31,   32,   34,   33,   35,   25,   37,   38,   39,   41,
			   40,   42,   43,   44,   45,   26,   23,   46,   47,   49,
			   48,   50,   51,   24,   22,    0,    0,   16,    0,    0,

			  104,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,   20,   19,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   67,
			    0,   79,    0,   98,    0,  123,    0,  113,    0,  135,
			    0,   55,   53,    0,    0,   61,   56,   59,    0,    0,
			   73,   71,   84,   82,   88,   86,   92,    0,   90,  117,
			    0,  115,  107,  105,    0,  129,  127,  139,  137,   54,

			   60,   72,   87,   83,   91,  106,  116,  128,  138,  102,
			  101,   89,   66,   78,   97,  122,  112,  134,   64,   76,
			   95,  120,  110,  132,   65,   77,   96,  121,  111,  133,
			   63,   75,   94,  119,  109,  131,    0,    0,    0,    0,
			    0,    0,   62,   74,   93,  118,  108,  130,    0,    0,
			    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER] is
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			   28,   29,   30,   31,  190,   33,   57,   35,   36,   75,
			   37,   76,   77,   78,   79,   80,   81,   82,   83,   84,
			   85,   86,   87,   88,   89,   90,   91,   92,   93,  248,
			    5,    6,    7,    8,    9,   45,   38,   46,   47,   97,
			   48,   95,   39,   40,   61, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER] is
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			  159,  260,  248, -32768, -32768,   57, -32768,  261, -32768,  258,
			  247,  106,  244, -32768,  157,  245, -32768,  177,  198, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768,  163, -32768, -32768, -32768,
			 -32768, -32768,  200, -32768, -32768, -32768, -32768, -32768,  246, -32768,
			  160, -32768, -32768,  121,  132, -32768, -32768,  244, -32768, -32768,
			 -32768, -32768, -32768, -32768,  243,  242,  241, -32768, -32768, -32768,
			  220, -32768, -32768,   10, -32768, -32768,  240,  239,  238,  237,
			  236,   44,  235,  234,  233,  232,  231,  230,  229,  228,
			  227,  225,  222,  221,  219,  188, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768,  223,  116, -32768,  217,  185,

			 -32768,   16,   16,   16,   16,  172,  171,  151,  170,  166,
			  165,  143,   37,    8,  155,  -11,   86,   12,    6,  115,
			   31,  218,   80,   19,  224,  173,  206,  200,  206,   -3,
			  226, -32768, -32768,   25,  216,  215,  214,  128,  213,  212,
			  211,  210,  209,  123,  208,  207,  203,  199,  197,  103,
			  196,  195,  194,  193,  192,   54,  191,  190,  189, -32768,
			   80, -32768,   19, -32768,  206, -32768,  206, -32768,  200, -32768,
			   -3, -32768, -32768,  205,  204, -32768, -32768, -32768,  202,  201,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768,  168, -32768, -32768,
			  200, -32768, -32768, -32768,  186, -32768, -32768, -32768, -32768, -32768,

			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768,  161,  154,  149,  140,
			  136,   97, -32768, -32768, -32768, -32768, -32768, -32768,  104,  102,
			 -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER] is
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			  -22,  -37,  -40,  -12,   -5,  -33,  -10,  -42,  -17,   46,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			    2, -32768, -32768,    5, -32768, -32768,  182, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER] is
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   51,   34,   74,   21,   69,   23,   32,   68,  184,   56,
			   13,   72,   25,   26,   25,  187,   43,   41,   23,   26,
			   25,  110,   67,   25,   23,  192,  106,  180,  210,  209,
			  108,  189,   70,  194,   73,  104,  103,  102,  101,   71,
			  176,  105,   65,  179,  178,   18,   17,   56,   13,   96,
			  197,   18,   17,  109,  179,  178,  175,   56,  107,  140,
			  146,  152,  158,    2,  136,  142,  148,  154,  138,  144,
			  150,  156,  174,  173,  183,  232,  181,  196,  116,  135,
			  141,  147,  153,  176,  191,  203,  201,  207,   12,  187,
			  177,  139,  145,  151,  157,  206,  137,  143,  149,  155,

			  200,   13,  250,  185,  249,  186,   56,   27,  193,   26,
			   25,  188,  202,   24,   23,  174,  173,  205,  247,   22,
			   21,  204,    2,   23,  226,  237,   56,    2,  241,   20,
			   19,   56,  132,  239,  195,   26,   25,   62,  236,   66,
			   23,   18,   17,   65,  220,   22,   21,   12,   64,  214,
			  172,  194,   12,   63,   56,   20,   19,  246,  240,  238,
			    4,  245,  171,    2,    3,    2,  198,   18,   17,  164,
			  244,    1,  163,   42,  182,  243,  208,   51,   20,   19,
			   50,   49,  242,  170,  168,   23,  169,  167,  166,  162,
			  160,  165,  161,  159,   23,   60,   20,   19,   59,   55,

			   54,   53,   52,   56,   55,   52,   49,   53,   50,  187,
			  235,  234,  233,  231,  230,  229,  228,  227,  225,  211,
			  224,  134,  130,  100,  223,  199,   94,    0,  222,  221,
			  219,  218,  217,  216,  215,  213,  212,   65,   21,  131,
			    0,    0,    0,    0,    0,   99,   98,    0,    0,    0,
			    2,    0,   16,  129,  133,  128,  127,    0,    0,  126,
			   44,  125,  124,  123,  122,  121,  120,  119,  118,  117,
			  115,  114,  113,  112,  111,   15,   14,   10,   54,   58,
			   11, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER] is
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			   17,   11,   44,   14,   44,    8,   11,   44,   19,    3,
			    5,   44,    4,    3,    4,    3,   14,   12,    8,    3,
			    4,   63,   44,    4,    8,   19,   63,   19,    3,    4,
			   63,   19,   44,   36,   44,   25,   26,   27,   28,   44,
			    3,   63,   11,   35,   36,   35,   36,    3,   43,   47,
			   19,   35,   36,   63,   35,   36,   19,    3,   63,  101,
			  102,  103,  104,    6,  101,  102,  103,  104,  101,  102,
			  103,  104,   35,   36,  114,   21,  113,  119,   34,  101,
			  102,  103,  104,    3,  117,  125,  123,  129,   31,    3,
			  112,  101,  102,  103,  104,  128,  101,  102,  103,  104,

			  122,   96,    0,  115,    0,   19,    3,    1,  118,    3,
			    4,  116,  124,    7,    8,   35,   36,  127,   21,   13,
			   14,  126,    6,    8,   21,  162,    3,    6,  170,   23,
			   24,    3,   16,  166,   19,    3,    4,   16,  160,    7,
			    8,   35,   36,   11,   21,   13,   14,   31,   16,   21,
			    7,   36,   31,   21,    3,   23,   24,   21,  168,  164,
			    1,   21,   19,    6,    5,    6,  120,   35,   36,   18,
			   21,   12,   21,   16,   19,   21,  130,  194,   23,   24,
			    3,    4,   21,   18,   18,    8,   21,   21,   18,   18,
			   18,   21,   21,   21,    8,   35,   23,   24,   38,   36,

			   37,    3,    4,    3,   36,    4,    4,    3,    3,    3,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,    3,
			   21,   36,   34,    3,   21,    7,   44,   -1,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   11,   14,   16,
			   -1,   -1,   -1,   -1,   -1,    3,    3,   -1,   -1,   -1,
			    6,   -1,    5,   34,   37,   34,   34,   -1,   -1,   34,
			   15,   34,   34,   34,   34,   34,   34,   34,   34,   34,
			   34,   34,   34,   34,   34,   17,   15,   17,   37,   33,
			   32, yyDummy>>)
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

	yyvs6: SPECIAL [BOOLEAN]
			-- Stack for semantic values of type BOOLEAN

	yyvsc6: INTEGER
			-- Capacity of semantic value stack `yyvs6'

	yyvsp6: INTEGER
			-- Top of semantic value stack `yyvs6'

	yyspecial_routines6: KL_SPECIAL_ROUTINES [BOOLEAN]
			-- Routines that ought to be in SPECIAL [BOOLEAN]

	yyvs7: SPECIAL [DATE]
			-- Stack for semantic values of type DATE

	yyvsc7: INTEGER
			-- Capacity of semantic value stack `yyvs7'

	yyvsp7: INTEGER
			-- Top of semantic value stack `yyvs7'

	yyspecial_routines7: KL_SPECIAL_ROUTINES [DATE]
			-- Routines that ought to be in SPECIAL [DATE]

	yyvs8: SPECIAL [DATE_TIME]
			-- Stack for semantic values of type DATE_TIME

	yyvsc8: INTEGER
			-- Capacity of semantic value stack `yyvs8'

	yyvsp8: INTEGER
			-- Top of semantic value stack `yyvs8'

	yyspecial_routines8: KL_SPECIAL_ROUTINES [DATE_TIME]
			-- Routines that ought to be in SPECIAL [DATE_TIME]

	yyvs9: SPECIAL [TIME]
			-- Stack for semantic values of type TIME

	yyvsc9: INTEGER
			-- Capacity of semantic value stack `yyvs9'

	yyvsp9: INTEGER
			-- Top of semantic value stack `yyvs9'

	yyspecial_routines9: KL_SPECIAL_ROUTINES [TIME]
			-- Routines that ought to be in SPECIAL [TIME]

	yyvs10: SPECIAL [DATE_TIME_DURATION]
			-- Stack for semantic values of type DATE_TIME_DURATION

	yyvsc10: INTEGER
			-- Capacity of semantic value stack `yyvs10'

	yyvsp10: INTEGER
			-- Top of semantic value stack `yyvs10'

	yyspecial_routines10: KL_SPECIAL_ROUTINES [DATE_TIME_DURATION]
			-- Routines that ought to be in SPECIAL [DATE_TIME_DURATION]

	yyvs11: SPECIAL [CODE_PHRASE]
			-- Stack for semantic values of type CODE_PHRASE

	yyvsc11: INTEGER
			-- Capacity of semantic value stack `yyvs11'

	yyvsp11: INTEGER
			-- Top of semantic value stack `yyvs11'

	yyspecial_routines11: KL_SPECIAL_ROUTINES [CODE_PHRASE]
			-- Routines that ought to be in SPECIAL [CODE_PHRASE]

	yyvs12: SPECIAL [URI]
			-- Stack for semantic values of type URI

	yyvsc12: INTEGER
			-- Capacity of semantic value stack `yyvs12'

	yyvsp12: INTEGER
			-- Top of semantic value stack `yyvs12'

	yyspecial_routines12: KL_SPECIAL_ROUTINES [URI]
			-- Routines that ought to be in SPECIAL [URI]

	yyvs13: SPECIAL [ARRAYED_LIST [STRING]]
			-- Stack for semantic values of type ARRAYED_LIST [STRING]

	yyvsc13: INTEGER
			-- Capacity of semantic value stack `yyvs13'

	yyvsp13: INTEGER
			-- Top of semantic value stack `yyvs13'

	yyspecial_routines13: KL_SPECIAL_ROUTINES [ARRAYED_LIST [STRING]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [STRING]]

	yyvs14: SPECIAL [INTEGER_REF]
			-- Stack for semantic values of type INTEGER_REF

	yyvsc14: INTEGER
			-- Capacity of semantic value stack `yyvs14'

	yyvsp14: INTEGER
			-- Top of semantic value stack `yyvs14'

	yyspecial_routines14: KL_SPECIAL_ROUTINES [INTEGER_REF]
			-- Routines that ought to be in SPECIAL [INTEGER_REF]

	yyvs15: SPECIAL [ARRAYED_LIST [INTEGER_REF]]
			-- Stack for semantic values of type ARRAYED_LIST [INTEGER_REF]

	yyvsc15: INTEGER
			-- Capacity of semantic value stack `yyvs15'

	yyvsp15: INTEGER
			-- Top of semantic value stack `yyvs15'

	yyspecial_routines15: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTEGER_REF]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTEGER_REF]]

	yyvs16: SPECIAL [REAL_REF]
			-- Stack for semantic values of type REAL_REF

	yyvsc16: INTEGER
			-- Capacity of semantic value stack `yyvs16'

	yyvsp16: INTEGER
			-- Top of semantic value stack `yyvs16'

	yyspecial_routines16: KL_SPECIAL_ROUTINES [REAL_REF]
			-- Routines that ought to be in SPECIAL [REAL_REF]

	yyvs17: SPECIAL [ARRAYED_LIST [REAL_REF]]
			-- Stack for semantic values of type ARRAYED_LIST [REAL_REF]

	yyvsc17: INTEGER
			-- Capacity of semantic value stack `yyvs17'

	yyvsp17: INTEGER
			-- Top of semantic value stack `yyvs17'

	yyspecial_routines17: KL_SPECIAL_ROUTINES [ARRAYED_LIST [REAL_REF]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [REAL_REF]]

	yyvs18: SPECIAL [CHARACTER_REF]
			-- Stack for semantic values of type CHARACTER_REF

	yyvsc18: INTEGER
			-- Capacity of semantic value stack `yyvs18'

	yyvsp18: INTEGER
			-- Top of semantic value stack `yyvs18'

	yyspecial_routines18: KL_SPECIAL_ROUTINES [CHARACTER_REF]
			-- Routines that ought to be in SPECIAL [CHARACTER_REF]

	yyvs19: SPECIAL [ARRAYED_LIST [CHARACTER_REF]]
			-- Stack for semantic values of type ARRAYED_LIST [CHARACTER_REF]

	yyvsc19: INTEGER
			-- Capacity of semantic value stack `yyvs19'

	yyvsp19: INTEGER
			-- Top of semantic value stack `yyvs19'

	yyspecial_routines19: KL_SPECIAL_ROUTINES [ARRAYED_LIST [CHARACTER_REF]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [CHARACTER_REF]]

	yyvs20: SPECIAL [BOOLEAN_REF]
			-- Stack for semantic values of type BOOLEAN_REF

	yyvsc20: INTEGER
			-- Capacity of semantic value stack `yyvs20'

	yyvsp20: INTEGER
			-- Top of semantic value stack `yyvs20'

	yyspecial_routines20: KL_SPECIAL_ROUTINES [BOOLEAN_REF]
			-- Routines that ought to be in SPECIAL [BOOLEAN_REF]

	yyvs21: SPECIAL [ARRAYED_LIST [BOOLEAN_REF]]
			-- Stack for semantic values of type ARRAYED_LIST [BOOLEAN_REF]

	yyvsc21: INTEGER
			-- Capacity of semantic value stack `yyvs21'

	yyvsp21: INTEGER
			-- Top of semantic value stack `yyvs21'

	yyspecial_routines21: KL_SPECIAL_ROUTINES [ARRAYED_LIST [BOOLEAN_REF]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [BOOLEAN_REF]]

	yyvs22: SPECIAL [ARRAYED_LIST [DATE]]
			-- Stack for semantic values of type ARRAYED_LIST [DATE]

	yyvsc22: INTEGER
			-- Capacity of semantic value stack `yyvs22'

	yyvsp22: INTEGER
			-- Top of semantic value stack `yyvs22'

	yyspecial_routines22: KL_SPECIAL_ROUTINES [ARRAYED_LIST [DATE]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [DATE]]

	yyvs23: SPECIAL [ARRAYED_LIST [TIME]]
			-- Stack for semantic values of type ARRAYED_LIST [TIME]

	yyvsc23: INTEGER
			-- Capacity of semantic value stack `yyvs23'

	yyvsp23: INTEGER
			-- Top of semantic value stack `yyvs23'

	yyspecial_routines23: KL_SPECIAL_ROUTINES [ARRAYED_LIST [TIME]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [TIME]]

	yyvs24: SPECIAL [ARRAYED_LIST [DATE_TIME]]
			-- Stack for semantic values of type ARRAYED_LIST [DATE_TIME]

	yyvsc24: INTEGER
			-- Capacity of semantic value stack `yyvs24'

	yyvsp24: INTEGER
			-- Top of semantic value stack `yyvs24'

	yyspecial_routines24: KL_SPECIAL_ROUTINES [ARRAYED_LIST [DATE_TIME]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [DATE_TIME]]

	yyvs25: SPECIAL [ARRAYED_LIST [DATE_TIME_DURATION]]
			-- Stack for semantic values of type ARRAYED_LIST [DATE_TIME_DURATION]

	yyvsc25: INTEGER
			-- Capacity of semantic value stack `yyvs25'

	yyvsp25: INTEGER
			-- Top of semantic value stack `yyvs25'

	yyspecial_routines25: KL_SPECIAL_ROUTINES [ARRAYED_LIST [DATE_TIME_DURATION]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [DATE_TIME_DURATION]]

	yyvs26: SPECIAL [ARRAYED_LIST [CODE_PHRASE]]
			-- Stack for semantic values of type ARRAYED_LIST [CODE_PHRASE]

	yyvsc26: INTEGER
			-- Capacity of semantic value stack `yyvs26'

	yyvsp26: INTEGER
			-- Top of semantic value stack `yyvs26'

	yyspecial_routines26: KL_SPECIAL_ROUTINES [ARRAYED_LIST [CODE_PHRASE]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [CODE_PHRASE]]

	yyvs27: SPECIAL [ARRAYED_LIST [ANY]]
			-- Stack for semantic values of type ARRAYED_LIST [ANY]

	yyvsc27: INTEGER
			-- Capacity of semantic value stack `yyvs27'

	yyvsp27: INTEGER
			-- Top of semantic value stack `yyvs27'

	yyspecial_routines27: KL_SPECIAL_ROUTINES [ARRAYED_LIST [ANY]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ANY]]

	yyvs28: SPECIAL [INTERVAL [INTEGER_REF]]
			-- Stack for semantic values of type INTERVAL [INTEGER_REF]

	yyvsc28: INTEGER
			-- Capacity of semantic value stack `yyvs28'

	yyvsp28: INTEGER
			-- Top of semantic value stack `yyvs28'

	yyspecial_routines28: KL_SPECIAL_ROUTINES [INTERVAL [INTEGER_REF]]
			-- Routines that ought to be in SPECIAL [INTERVAL [INTEGER_REF]]

	yyvs29: SPECIAL [INTERVAL [REAL_REF]]
			-- Stack for semantic values of type INTERVAL [REAL_REF]

	yyvsc29: INTEGER
			-- Capacity of semantic value stack `yyvs29'

	yyvsp29: INTEGER
			-- Top of semantic value stack `yyvs29'

	yyspecial_routines29: KL_SPECIAL_ROUTINES [INTERVAL [REAL_REF]]
			-- Routines that ought to be in SPECIAL [INTERVAL [REAL_REF]]

	yyvs30: SPECIAL [INTERVAL [TIME]]
			-- Stack for semantic values of type INTERVAL [TIME]

	yyvsc30: INTEGER
			-- Capacity of semantic value stack `yyvs30'

	yyvsp30: INTEGER
			-- Top of semantic value stack `yyvs30'

	yyspecial_routines30: KL_SPECIAL_ROUTINES [INTERVAL [TIME]]
			-- Routines that ought to be in SPECIAL [INTERVAL [TIME]]

	yyvs31: SPECIAL [INTERVAL [DATE]]
			-- Stack for semantic values of type INTERVAL [DATE]

	yyvsc31: INTEGER
			-- Capacity of semantic value stack `yyvs31'

	yyvsp31: INTEGER
			-- Top of semantic value stack `yyvs31'

	yyspecial_routines31: KL_SPECIAL_ROUTINES [INTERVAL [DATE]]
			-- Routines that ought to be in SPECIAL [INTERVAL [DATE]]

	yyvs32: SPECIAL [INTERVAL [DATE_TIME]]
			-- Stack for semantic values of type INTERVAL [DATE_TIME]

	yyvsc32: INTEGER
			-- Capacity of semantic value stack `yyvs32'

	yyvsp32: INTEGER
			-- Top of semantic value stack `yyvs32'

	yyspecial_routines32: KL_SPECIAL_ROUTINES [INTERVAL [DATE_TIME]]
			-- Routines that ought to be in SPECIAL [INTERVAL [DATE_TIME]]

	yyvs33: SPECIAL [DURATION]
			-- Stack for semantic values of type DURATION

	yyvsc33: INTEGER
			-- Capacity of semantic value stack `yyvs33'

	yyvsp33: INTEGER
			-- Top of semantic value stack `yyvs33'

	yyspecial_routines33: KL_SPECIAL_ROUTINES [DURATION]
			-- Routines that ought to be in SPECIAL [DURATION]

	yyvs34: SPECIAL [INTERVAL [DURATION]]
			-- Stack for semantic values of type INTERVAL [DURATION]

	yyvsc34: INTEGER
			-- Capacity of semantic value stack `yyvs34'

	yyvsp34: INTEGER
			-- Top of semantic value stack `yyvs34'

	yyspecial_routines34: KL_SPECIAL_ROUTINES [INTERVAL [DURATION]]
			-- Routines that ought to be in SPECIAL [INTERVAL [DURATION]]

	yyvs35: SPECIAL [PART_COMPARABLE]
			-- Stack for semantic values of type PART_COMPARABLE

	yyvsc35: INTEGER
			-- Capacity of semantic value stack `yyvs35'

	yyvsp35: INTEGER
			-- Top of semantic value stack `yyvs35'

	yyspecial_routines35: KL_SPECIAL_ROUTINES [PART_COMPARABLE]
			-- Routines that ought to be in SPECIAL [PART_COMPARABLE]

	yyvs36: SPECIAL [INTERVAL [PART_COMPARABLE]]
			-- Stack for semantic values of type INTERVAL [PART_COMPARABLE]

	yyvsc36: INTEGER
			-- Capacity of semantic value stack `yyvs36'

	yyvsp36: INTEGER
			-- Top of semantic value stack `yyvs36'

	yyspecial_routines36: KL_SPECIAL_ROUTINES [INTERVAL [PART_COMPARABLE]]
			-- Routines that ought to be in SPECIAL [INTERVAL [PART_COMPARABLE]]

feature {NONE} -- Constants

	yyFinal: INTEGER is 250
			-- Termination state id

	yyFlag: INTEGER is -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER is 39
			-- Number of tokens

	yyLast: INTEGER is 280
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER is 285
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER is 84
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

	execute(in_text:STRING; a_source_start_line: INTEGER) is
		do
			reset
			recover

			source_start_line := a_source_start_line

			create indent.make(0)
			create error_text.make(0)

			create complex_object_nodes.make(0)
			create attr_nodes.make(0)

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
				error_text.append (f_buffer.file.name)
				error_text.append (", line ")
			else
				error_text.append ("line ")
			end
			error_text.append_integer (in_lineno + source_start_line - 1)
			error_text.append (": ")
			error_text.append (a_message)
			error_text.append (" [last token = " + token_name(last_token) + "]")
			error_text.append_character ('%N')
		end

feature -- Access

	-- error_text: STRING

	-- source_start_line: INTEGER
			-- offset of source in other document, else 0

	-- output: DT_COMPLEX_OBJECT_NODE
			-- parsed structure

feature {NONE} -- Parse Tree

	complex_object_nodes: ARRAYED_STACK[DT_COMPLEX_OBJECT_NODE]
	object_node: DT_COMPLEX_OBJECT_NODE

	attr_nodes: ARRAYED_STACK[DT_ATTRIBUTE_NODE]
	attr_node: DT_ATTRIBUTE_NODE

	primitive_object_node: DT_PRIMITIVE_OBJECT
	primitive_object_list_node: DT_PRIMITIVE_OBJECT_LIST
	primitive_object_interval_node: DT_PRIMITIVE_OBJECT_INTERVAL

	primitive_object_query: DT_OBJECT_QUERY
	object_item: DT_OBJECT_LEAF

	node_qualifier: STRING
			-- qualifier of last rel name; use for next object creation

	rm_attr_name: STRING
	node_type: STRING
	node_id: STRING

	time_vc: TIME_VALIDITY_CHECKER
	date_vc: DATE_VALIDITY_CHECKER

feature {NONE} -- Implementation 
	
	integer_ref, integer_ref_2: INTEGER_REF
	real_ref, real_ref_2: REAL_REF
	character_ref: CHARACTER_REF
	boolean_ref: BOOLEAN_REF
	term: CODE_PHRASE
	a_uri: URI

	term_list: ARRAYED_LIST[CODE_PHRASE]
	string_list: ARRAYED_LIST[STRING]
	integer_ref_list: ARRAYED_LIST[INTEGER_REF]
	integer_list: ARRAYED_LIST[INTEGER]
	real_ref_list: ARRAYED_LIST[REAL_REF]
	real_list: ARRAYED_LIST[REAL]
	character_list: ARRAYED_LIST[CHARACTER_REF]
	boolean_list: ARRAYED_LIST[BOOLEAN_REF]
	date_list: ARRAYED_LIST[DATE]
	time_list: ARRAYED_LIST[TIME]
	date_time_list: ARRAYED_LIST[DATE_TIME]
	duration_list: ARRAYED_LIST[DATE_TIME_DURATION]

	integer_interval: INTERVAL [INTEGER_REF]
	real_interval: INTERVAL [REAL_REF]
	date_interval: INTERVAL [DATE]
	time_interval: INTERVAL [TIME]
	date_time_interval: INTERVAL [DATE_TIME]
	duration_interval: INTERVAL [DATE_TIME_DURATION]

	indent: STRING
	int_val: INTEGER
	real_val: REAL
	str: STRING
	a_date: DATE
	a_time: TIME
	a_date_time: DATE_TIME

end
