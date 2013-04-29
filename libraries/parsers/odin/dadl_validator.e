note
	component:   "openEHR Archetype Project"
	description: "Validating parser for data Archetype Description Language (dADL)"
	keywords:    "dADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2004- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class DADL_VALIDATOR

inherit
	PARSER_VALIDATOR
		rename
			reset as validator_reset,
			make as make_parser_skeleton
		redefine
			output
		end

	OG_DEFINITIONS
		export
			{NONE} all
		end

	DATE_TIME_ROUTINES
		export
			{NONE} all
		end

	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

	DADL_SCANNER
		rename
			make as make_scanner
		redefine
			reset
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
		end

	yy_clear_value_stacks
			-- Clear objects in semantic value stacks so that
			-- they can be collected by the garbage collector.
		do
			if yyvs1 /= Void and yyspecial_routines1 /= Void then
				yyspecial_routines1.keep_head (yyvs1, 0, yyvsp1 + 1)
			end
			if yyvs2 /= Void and yyspecial_routines2 /= Void then
				yyspecial_routines2.keep_head (yyvs2, 0, yyvsp2 + 1)
			end
			if yyvs3 /= Void and yyspecial_routines3 /= Void then
				yyspecial_routines3.keep_head (yyvs3, 0, yyvsp3 + 1)
			end
			if yyvs4 /= Void and yyspecial_routines4 /= Void then
				yyspecial_routines4.keep_head (yyvs4, 0, yyvsp4 + 1)
			end
			if yyvs5 /= Void and yyspecial_routines5 /= Void then
				yyspecial_routines5.keep_head (yyvs5, 0, yyvsp5 + 1)
			end
			if yyvs6 /= Void and yyspecial_routines6 /= Void then
				yyspecial_routines6.keep_head (yyvs6, 0, yyvsp6 + 1)
			end
			if yyvs7 /= Void and yyspecial_routines7 /= Void then
				yyspecial_routines7.keep_head (yyvs7, 0, yyvsp7 + 1)
			end
			if yyvs8 /= Void and yyspecial_routines8 /= Void then
				yyspecial_routines8.keep_head (yyvs8, 0, yyvsp8 + 1)
			end
			if yyvs9 /= Void and yyspecial_routines9 /= Void then
				yyspecial_routines9.keep_head (yyvs9, 0, yyvsp9 + 1)
			end
			if yyvs10 /= Void and yyspecial_routines10 /= Void then
				yyspecial_routines10.keep_head (yyvs10, 0, yyvsp10 + 1)
			end
			if yyvs11 /= Void and yyspecial_routines11 /= Void then
				yyspecial_routines11.keep_head (yyvs11, 0, yyvsp11 + 1)
			end
			if yyvs12 /= Void and yyspecial_routines12 /= Void then
				yyspecial_routines12.keep_head (yyvs12, 0, yyvsp12 + 1)
			end
			if yyvs13 /= Void and yyspecial_routines13 /= Void then
				yyspecial_routines13.keep_head (yyvs13, 0, yyvsp13 + 1)
			end
			if yyvs14 /= Void and yyspecial_routines14 /= Void then
				yyspecial_routines14.keep_head (yyvs14, 0, yyvsp14 + 1)
			end
			if yyvs15 /= Void and yyspecial_routines15 /= Void then
				yyspecial_routines15.keep_head (yyvs15, 0, yyvsp15 + 1)
			end
			if yyvs16 /= Void and yyspecial_routines16 /= Void then
				yyspecial_routines16.keep_head (yyvs16, 0, yyvsp16 + 1)
			end
			if yyvs17 /= Void and yyspecial_routines17 /= Void then
				yyspecial_routines17.keep_head (yyvs17, 0, yyvsp17 + 1)
			end
			if yyvs18 /= Void and yyspecial_routines18 /= Void then
				yyspecial_routines18.keep_head (yyvs18, 0, yyvsp18 + 1)
			end
			if yyvs19 /= Void and yyspecial_routines19 /= Void then
				yyspecial_routines19.keep_head (yyvs19, 0, yyvsp19 + 1)
			end
			if yyvs20 /= Void and yyspecial_routines20 /= Void then
				yyspecial_routines20.keep_head (yyvs20, 0, yyvsp20 + 1)
			end
			if yyvs21 /= Void and yyspecial_routines21 /= Void then
				yyspecial_routines21.keep_head (yyvs21, 0, yyvsp21 + 1)
			end
			if yyvs22 /= Void and yyspecial_routines22 /= Void then
				yyspecial_routines22.keep_head (yyvs22, 0, yyvsp22 + 1)
			end
			if yyvs23 /= Void and yyspecial_routines23 /= Void then
				yyspecial_routines23.keep_head (yyvs23, 0, yyvsp23 + 1)
			end
			if yyvs24 /= Void and yyspecial_routines24 /= Void then
				yyspecial_routines24.keep_head (yyvs24, 0, yyvsp24 + 1)
			end
			if yyvs25 /= Void and yyspecial_routines25 /= Void then
				yyspecial_routines25.keep_head (yyvs25, 0, yyvsp25 + 1)
			end
			if yyvs26 /= Void and yyspecial_routines26 /= Void then
				yyspecial_routines26.keep_head (yyvs26, 0, yyvsp26 + 1)
			end
			if yyvs27 /= Void and yyspecial_routines27 /= Void then
				yyspecial_routines27.keep_head (yyvs27, 0, yyvsp27 + 1)
			end
			if yyvs28 /= Void and yyspecial_routines28 /= Void then
				yyspecial_routines28.keep_head (yyvs28, 0, yyvsp28 + 1)
			end
			if yyvs29 /= Void and yyspecial_routines29 /= Void then
				yyspecial_routines29.keep_head (yyvs29, 0, yyvsp29 + 1)
			end
			if yyvs30 /= Void and yyspecial_routines30 /= Void then
				yyspecial_routines30.keep_head (yyvs30, 0, yyvsp30 + 1)
			end
			if yyvs31 /= Void and yyspecial_routines31 /= Void then
				yyspecial_routines31.keep_head (yyvs31, 0, yyvsp31 + 1)
			end
			if yyvs32 /= Void and yyspecial_routines32 /= Void then
				yyspecial_routines32.keep_head (yyvs32, 0, yyvsp32 + 1)
			end
			if yyvs33 /= Void and yyspecial_routines33 /= Void then
				yyspecial_routines33.keep_head (yyvs33, 0, yyvsp33 + 1)
			end
			if yyvs34 /= Void and yyspecial_routines34 /= Void then
				yyspecial_routines34.keep_head (yyvs34, 0, yyvsp34 + 1)
			end
			if yyvs35 /= Void and yyspecial_routines35 /= Void then
				yyspecial_routines35.keep_head (yyvs35, 0, yyvsp35 + 1)
			end
		end

	yy_push_last_value (yychar1: INTEGER)
			-- Push semantic value associated with token `last_token'
			-- (with internal id `yychar1') on top of corresponding
			-- value stack.
		do
			inspect yytypes2.item (yychar1)
			when 1 then
				yyvsp1 := yyvsp1 + 1
				if yyvsp1 >= yyvsc1 or yyvs1 = Void or yyspecial_routines1 = Void then
					if yyvs1 = Void or yyspecial_routines1 = Void then
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
				yyspecial_routines1.force (yyvs1, last_detachable_any_value, yyvsp1)
			when 2 then
				yyvsp2 := yyvsp2 + 1
				if yyvsp2 >= yyvsc2 or yyvs2 = Void or yyspecial_routines2 = Void then
					if yyvs2 = Void or yyspecial_routines2 = Void then
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
				yyspecial_routines2.force (yyvs2, last_integer_value, yyvsp2)
			when 3 then
				yyvsp3 := yyvsp3 + 1
				if yyvsp3 >= yyvsc3 or yyvs3 = Void or yyspecial_routines3 = Void then
					if yyvs3 = Void or yyspecial_routines3 = Void then
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
				yyspecial_routines3.force (yyvs3, last_real_value, yyvsp3)
			when 4 then
				yyvsp4 := yyvsp4 + 1
				if yyvsp4 >= yyvsc4 or yyvs4 = Void or yyspecial_routines4 = Void then
					if yyvs4 = Void or yyspecial_routines4 = Void then
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
				yyspecial_routines4.force (yyvs4, last_string_value, yyvsp4)
			when 5 then
				yyvsp5 := yyvsp5 + 1
				if yyvsp5 >= yyvsc5 or yyvs5 = Void or yyspecial_routines5 = Void then
					if yyvs5 = Void or yyspecial_routines5 = Void then
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
				yyspecial_routines5.force (yyvs5, last_character_value, yyvsp5)
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
			if yyvsp1 >= yyvsc1 or yyvs1 = Void or yyspecial_routines1 = Void then
				if yyvs1 = Void or yyspecial_routines1 = Void then
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
			yyval13: DT_COMPLEX_OBJECT_NODE
			yyval14: DT_OBJECT_LEAF
			yyval28: ARRAYED_LIST [ANY]
			yyval35: INTERVAL [PART_COMPARABLE]
			yyval4: STRING
			yyval18: ARRAYED_LIST [STRING]
			yyval2: INTEGER
			yyval19: ARRAYED_LIST [INTEGER]
			yyval29: INTERVAL [INTEGER]
			yyval3: REAL
			yyval20: ARRAYED_LIST [REAL]
			yyval30: INTERVAL [REAL]
			yyval6: BOOLEAN
			yyval22: ARRAYED_LIST [BOOLEAN]
			yyval5: CHARACTER
			yyval21: ARRAYED_LIST [CHARACTER]
			yyval7: ISO8601_DATE
			yyval23: ARRAYED_LIST [ISO8601_DATE]
			yyval32: INTERVAL [ISO8601_DATE]
			yyval9: ISO8601_TIME
			yyval24: ARRAYED_LIST [ISO8601_TIME]
			yyval31: INTERVAL [ISO8601_TIME]
			yyval8: ISO8601_DATE_TIME
			yyval25: ARRAYED_LIST [ISO8601_DATE_TIME]
			yyval33: INTERVAL [ISO8601_DATE_TIME]
			yyval10: ISO8601_DURATION
			yyval26: ARRAYED_LIST [ISO8601_DURATION]
			yyval34: INTERVAL [ISO8601_DURATION]
			yyval11: TERMINOLOGY_CODE
			yyval27: ARRAYED_LIST [TERMINOLOGY_CODE]
			yyval12: URI
			yyval17: ARRAYED_LIST [OG_PATH]
			yyval15: OG_PATH
			yyval16: OG_PATH_ITEM
		do
			inspect yy_act
when 1 then
--|#line 117 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 117")
end

			output := complex_object_nodes.item
debug("dADL_parse")
	io.put_string("Object data definition validated (non-delimited)%N")
end
			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 2 then
--|#line 125 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 125")
end

			output := yyvs13.item (yyvsp13)
debug("dADL_parse")
	io.put_string("Object data definition validated%N")
end
			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp13 := yyvsp13 -1
	if yyvsp1 >= yyvsc1 or yyvs1 = Void or yyspecial_routines1 = Void then
		if yyvs1 = Void or yyspecial_routines1 = Void then
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
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 3 then
--|#line 133 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 133")
end

debug("dADL_parse")
	io.put_string("dADL text NOT validated%N")
end
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 4 then
--|#line 145 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 145")
end

debug("dADL_parse")
	io.put_string(indent + "attr_val complete%N")
end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 5 then
--|#line 151 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 151")
end

debug("dADL_parse")
	io.put_string(indent + "attr_val complete%N")
end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 6 then
--|#line 157 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 157")
end

debug("dADL_parse")
	io.put_string(indent + "attr_val complete%N")
end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 7 then
--|#line 166 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 166")
end

debug("dADL_parse")
	io.put_string(indent + "attr_val: POP attr node (" +  attr_nodes.item.im_attr_name+ ")%N")
	indent.remove_tail(1)
end
			attr_nodes.remove
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 8 then
--|#line 176 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 176")
end

			-- create first anonymous object
			if complex_object_nodes.is_empty then
debug("dADL_parse")
	io.put_string(indent + "attr_id: create complex_object_node.make_anonymous%N")
	io.put_string(indent + "attr_id: PUSH Object node%N")
	indent.append("%T")
end
				create complex_object_node.make_anonymous
				complex_object_nodes.extend(complex_object_node)
			end

debug("dADL_parse")
	io.put_string(indent + "attr_id: create_attr_node.make_single(<<" + yyvs4.item (yyvsp4) + ">>)%N")
end
			create attr_node.make_single(yyvs4.item (yyvsp4))

debug("dADL_parse")
	io.put_string(indent + "attr_id: complex_object_nodes.item(" + complex_object_nodes.item.id + 
			").put_attribute(<<" + attr_node.im_attr_name + ">>)%N")
end
			if not complex_object_nodes.item.has_attribute(attr_node.im_attr_name) then
				complex_object_nodes.item.put_attribute(attr_node)
			else
				abort_with_error (ec_VDATU, <<attr_node.im_attr_name>>)
			end

debug("dADL_parse")
	io.put_string(indent + "attr_id: PUSH attr node%N")
	indent.append("%T")
end
			attr_nodes.extend(attr_node)
			obj_key := Void
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp1 >= yyvsc1 or yyvs1 = Void or yyspecial_routines1 = Void then
		if yyvs1 = Void or yyspecial_routines1 = Void then
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
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 9 then
--|#line 211 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 211")
end

			abort_with_error (ec_SDAT, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 10 then
--|#line 220 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 220")
end

			-- if object_block was an empty object then get rid of it from parent attribute
			if complex_object_nodes.item.is_empty then
				attr_nodes.item.remove_child (complex_object_nodes.item)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp13 := yyvsp13 -1
	if yyvsp1 >= yyvsc1 or yyvs1 = Void or yyspecial_routines1 = Void then
		if yyvs1 = Void or yyspecial_routines1 = Void then
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
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 11 then
--|#line 227 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 227")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp14 := yyvsp14 -1
	if yyvsp1 >= yyvsc1 or yyvs1 = Void or yyspecial_routines1 = Void then
		if yyvs1 = Void or yyspecial_routines1 = Void then
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
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 12 then
--|#line 228 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 228")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp14 := yyvsp14 -1
	if yyvsp1 >= yyvsc1 or yyvs1 = Void or yyspecial_routines1 = Void then
		if yyvs1 = Void or yyspecial_routines1 = Void then
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
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 13 then
--|#line 229 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 229")
end

			-- for single-valued attributes, remove the attribute
			if obj_key = Void then
				complex_object_nodes.item.remove_attribute(attr_node.im_attr_name)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 14 then
--|#line 238 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 238")
end

			yyval13 := yyvs13.item (yyvsp13)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 15 then
--|#line 242 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 242")
end

			yyval13 := yyvs13.item (yyvsp13)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 16 then
--|#line 251 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 251")
end

			yyval13 := yyvs13.item (yyvsp13)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 17 then
--|#line 255 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 255")
end

			-- probably should set type name on owning attribute - it doesn't belong on each 
			-- object, since it is essentially a constraint
			yyval13 := yyvs13.item (yyvsp13)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 -1
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 18 then
--|#line 274 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 274")
end

			-- if the keyed_objects were all empty, then the attribute can be thrown away 
			-- as well, since we don't create void object structures
			if attr_nodes.item.is_empty then
				attr_nodes.item.parent.remove_attribute (attr_nodes.item.im_attr_name)
			end

			-- if the current C_ATTRIBUTE_NODE is a synthesised one, under a keyed object,
			-- then pop it off the attribute stack, and also pop off its parent object
			if complex_object_nodes.item.is_addressable and attr_nodes.item.is_nested then
				-- pop the generic attr node
debug("dADL_parse")
	io.put_string(indent + "container_attr_object_block: POP attr node (" +  
		attr_nodes.item.im_attr_name+ ")%N")
	indent.remove_tail(1)
end
				attr_nodes.remove

debug("dADL_parse")
	io.put_string(indent + "container_attr_object_block: POP Object node(" + 
		complex_object_nodes.item.id + ")%N")
	indent.remove_tail(1)
end
				yyval13 := complex_object_nodes.item
				complex_object_nodes.remove
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp13 := yyvsp13 + 1
	yyvsp1 := yyvsp1 -3
	if yyvsp13 >= yyvsc13 or yyvs13 = Void or yyspecial_routines13 = Void then
		if yyvs13 = Void or yyspecial_routines13 = Void then
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
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 19 then
--|#line 326 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 326")
end

			-- if obj_key is set, it means we are inside a keyed object, and we have hit more keyed objects
			if obj_key /= Void then
				create complex_object_node.make_identified(obj_key)
				if not attr_nodes.item.has_child_with_id(complex_object_node.id) then
debug("dADL_parse")
	io.put_string(indent + "container_attr_object_block_head; attr_nodes(<<" + 
		attr_nodes.item.im_attr_name + ">>).item.put_child(complex_object_node(" + 
		complex_object_node.id + "))%N")
end
					attr_nodes.item.put_child(complex_object_node)
				else
					abort_with_error (ec_VOKU, <<complex_object_node.id, attr_nodes.item.im_attr_name >>)
				end

debug("dADL_parse")
	io.put_string(indent + "container_attr_object_block_head: PUSH Obj node%N")
	indent.append("%T")
end
				complex_object_nodes.extend(complex_object_node)

				-- now create a generic attribute node to stand for the hidden attribute of the 
				-- generic object, e.g. it might be List<T>.items or whatever
debug("dADL_parse")
	io.put_string(indent + "container_attr_object_block_head: create_attr_node.make_nested_container%N")
end
				create attr_node.make_nested_container

debug("dADL_parse")
	io.put_string(indent + "container_attr_object_block_head: complex_object_node(" + 
			complex_object_node.id + ").put_attribute(" + attr_node.im_attr_name + ")%N")
end
				complex_object_node.put_attribute(attr_node)

debug("dADL_parse")
	io.put_string(indent + "container_attr_object_block_head: PUSH attr node%N")
	indent.append("%T")
end
				attr_nodes.extend(attr_node)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 20 then
--|#line 370 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 370")
end

debug("dADL_parse")
	io.put_string(indent + "one keyed object%N")
end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 21 then
--|#line 376 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 376")
end

debug("dADL_parse")
	io.put_string(indent + "multiple keyed objects%N")
end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 22 then
--|#line 384 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 384")
end

debug("dADL_parse")
	io.put_string(indent + "(keyed object)%N")
end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 23 then
--|#line 392 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 392")
end

			obj_key := yyvs1.item (yyvsp1 - 1).out

debug("dADL_parse")
	io.put_string(indent + "object_key: " + obj_key + 
		" (setting " + attr_nodes.item.im_attr_name + " to Multiple)%N")
end
			if not attr_nodes.is_empty then
				attr_nodes.item.set_container_type
			else
				abort_with_error (ec_SGEE, <<attr_node.im_attr_name>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 24 then
--|#line 412 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 412")
end

debug("dADL_parse")
	io.put_string(indent + "untyped single_attr_object_block%N")
end
			yyval13 := yyvs13.item (yyvsp13)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 25 then
--|#line 419 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 419")
end

debug("dADL_parse")
	io.put_string(indent + "typed single_attr_object_block; type = " + yyvs4.item (yyvsp4) + "%N")
end
			yyvs13.item (yyvsp13).set_visible_type_name(yyvs4.item (yyvsp4))
			yyval13 := yyvs13.item (yyvsp13)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 -1
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 26 then
--|#line 437 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 437")
end

debug("dADL_parse")
	io.put_string(indent + "single_attr_object_complex_block: POP Object node(" + 
		complex_object_nodes.item.id + ")%N")
	indent.remove_tail(1)
end
			yyval13 := complex_object_nodes.item
			complex_object_nodes.remove
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp13 := yyvsp13 + 1
	yyvsp1 := yyvsp1 -3
	if yyvsp13 >= yyvsc13 or yyvs13 = Void or yyspecial_routines13 = Void then
		if yyvs13 = Void or yyspecial_routines13 = Void then
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
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 27 then
--|#line 449 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 449")
end

			-- if parent attr is not multiple, create an anon object; else an object identified by a key
			if attr_nodes.is_empty or else not attr_nodes.item.is_container_type then
debug("dADL_parse")
	io.put_string(indent + "single_attr_object_complex_head: create complex_object_node.make_anonymous%N")
end
				create complex_object_node.make_anonymous
			else
debug("dADL_parse")
	io.put_string(indent + "single_attr_object_complex_head: create complex_object_node.make (" + obj_key + ")%N")
end
				create complex_object_node.make_identified(obj_key)
				obj_key := Void
			end

			-- now put the new object under its attribute, if one exists
			if not attr_nodes.is_empty then
				if not attr_nodes.item.has_child_with_id(complex_object_node.id) then
debug("dADL_parse")
	io.put_string(indent + "single_attr_object_complex_head: attr_nodes(<<" + 
		attr_nodes.item.im_attr_name + ">>).item.put_child(complex_object_node(" + 
		complex_object_node.id + "))%N")
end
					attr_nodes.item.put_child(complex_object_node)
				else
					abort_with_error (ec_VOKU, <<complex_object_node.id, attr_nodes.item.im_attr_name >>)
				end
			end

			-- finally, put the new object on the object stack
debug("dADL_parse")
	io.put_string(indent + "single_attr_object_complex_head: PUSH Obj node%N")
	indent.append("%T")
end
			complex_object_nodes.extend(complex_object_node)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 28 then
--|#line 491 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 491")
end

debug("dADL_parse")
	io.put_string(indent + "untyped primitive_object_block%N")
end
			yyval14 := yyvs14.item (yyvsp14)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 29 then
--|#line 498 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 498")
end

debug("dADL_parse")
	io.put_string(indent + "typed primitive_object_block; type = " + yyvs4.item (yyvsp4) + "%N")
end
			yyvs14.item (yyvsp14).set_visible_type_name(yyvs4.item (yyvsp4))
			yyval14 := yyvs14.item (yyvsp14)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 -1
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 30 then
--|#line 512 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 512")
end

debug("dADL_parse")
	io.put_string(indent + "untyped_primitive_object_block; attr_nodes(<<" + 
			attr_nodes.item.im_attr_name + ">>).item.put_child(<<" + 
			yyvs14.item (yyvsp14).as_string + ">>)%N")
end
			if not attr_nodes.item.has_child_with_id(yyvs14.item (yyvsp14).id) then
				attr_nodes.item.put_child(yyvs14.item (yyvsp14))
				yyval14 := yyvs14.item (yyvsp14)
			else
				abort_with_error (ec_VOKU, <<yyvs14.item (yyvsp14).id, attr_nodes.item.im_attr_name >>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 31 then
--|#line 528 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 528")
end

			if obj_key /= Void then
				create {DT_PRIMITIVE_OBJECT} yyval14.make_identified (yyvs1.item (yyvsp1), obj_key)
				obj_key := Void
			else
				create {DT_PRIMITIVE_OBJECT} yyval14.make_anonymous (yyvs1.item (yyvsp1))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp14 >= yyvsc14 or yyvs14 = Void or yyspecial_routines14 = Void then
		if yyvs14 = Void or yyspecial_routines14 = Void then
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
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 32 then
--|#line 537 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 537")
end

			if obj_key /= Void then
				create {DT_PRIMITIVE_OBJECT_LIST} yyval14.make_identified (yyvs28.item (yyvsp28), obj_key)
				obj_key := Void
			else
				create {DT_PRIMITIVE_OBJECT_LIST} yyval14.make_anonymous (yyvs28.item (yyvsp28))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp28 := yyvsp28 -1
	if yyvsp14 >= yyvsc14 or yyvs14 = Void or yyspecial_routines14 = Void then
		if yyvs14 = Void or yyspecial_routines14 = Void then
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
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 33 then
--|#line 546 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 546")
end

			if obj_key /= Void then
				create {DT_PRIMITIVE_OBJECT_INTERVAL} yyval14.make_identified (yyvs35.item (yyvsp35), obj_key)
				obj_key := Void
			else
				create {DT_PRIMITIVE_OBJECT_INTERVAL} yyval14.make_anonymous (yyvs35.item (yyvsp35))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp35 := yyvsp35 -1
	if yyvsp14 >= yyvsc14 or yyvs14 = Void or yyspecial_routines14 = Void then
		if yyvs14 = Void or yyspecial_routines14 = Void then
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
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 34 then
--|#line 555 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 555")
end

			if obj_key /= Void then
				create {DT_PRIMITIVE_OBJECT} yyval14.make_identified (yyvs11.item (yyvsp11), obj_key)
				obj_key := Void
			else
				create {DT_PRIMITIVE_OBJECT} yyval14.make_anonymous (yyvs11.item (yyvsp11))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp11 := yyvsp11 -1
	if yyvsp14 >= yyvsc14 or yyvs14 = Void or yyspecial_routines14 = Void then
		if yyvs14 = Void or yyspecial_routines14 = Void then
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
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 35 then
--|#line 564 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 564")
end

			if obj_key /= Void then
				create {DT_PRIMITIVE_OBJECT_LIST} yyval14.make_identified (yyvs27.item (yyvsp27), obj_key)
				obj_key := Void
			else
				create {DT_PRIMITIVE_OBJECT_LIST} yyval14.make_anonymous (yyvs27.item (yyvsp27))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp27 := yyvsp27 -1
	if yyvsp14 >= yyvsc14 or yyvs14 = Void or yyspecial_routines14 = Void then
		if yyvs14 = Void or yyspecial_routines14 = Void then
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
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 36 then
--|#line 575 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 575")
end

			yyval1 := yyvs1.item (yyvsp1)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 37 then
--|#line 579 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 579")
end

			yyval1 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp1 >= yyvsc1 or yyvs1 = Void or yyspecial_routines1 = Void then
		if yyvs1 = Void or yyspecial_routines1 = Void then
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
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 38 then
--|#line 583 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 583")
end

			yyval1 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp1 >= yyvsc1 or yyvs1 = Void or yyspecial_routines1 = Void then
		if yyvs1 = Void or yyspecial_routines1 = Void then
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
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 39 then
--|#line 587 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 587")
end

			yyval1 := yyvs6.item (yyvsp6)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp6 := yyvsp6 -1
	if yyvsp1 >= yyvsc1 or yyvs1 = Void or yyspecial_routines1 = Void then
		if yyvs1 = Void or yyspecial_routines1 = Void then
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
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 40 then
--|#line 591 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 591")
end

			yyval1 := yyvs5.item (yyvsp5)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp5 := yyvsp5 -1
	if yyvsp1 >= yyvsc1 or yyvs1 = Void or yyspecial_routines1 = Void then
		if yyvs1 = Void or yyspecial_routines1 = Void then
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
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 41 then
--|#line 595 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 595")
end

			yyval1 := yyvs7.item (yyvsp7)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp7 := yyvsp7 -1
	if yyvsp1 >= yyvsc1 or yyvs1 = Void or yyspecial_routines1 = Void then
		if yyvs1 = Void or yyspecial_routines1 = Void then
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
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 42 then
--|#line 599 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 599")
end

			yyval1 := yyvs9.item (yyvsp9)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp9 := yyvsp9 -1
	if yyvsp1 >= yyvsc1 or yyvs1 = Void or yyspecial_routines1 = Void then
		if yyvs1 = Void or yyspecial_routines1 = Void then
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
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 43 then
--|#line 603 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 603")
end

			yyval1 := yyvs8.item (yyvsp8)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp8 := yyvsp8 -1
	if yyvsp1 >= yyvsc1 or yyvs1 = Void or yyspecial_routines1 = Void then
		if yyvs1 = Void or yyspecial_routines1 = Void then
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
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 44 then
--|#line 607 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 607")
end

			yyval1 := yyvs10.item (yyvsp10)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp10 := yyvsp10 -1
	if yyvsp1 >= yyvsc1 or yyvs1 = Void or yyspecial_routines1 = Void then
		if yyvs1 = Void or yyspecial_routines1 = Void then
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
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 45 then
--|#line 611 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 611")
end

			yyval1 := yyvs12.item (yyvsp12)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp12 := yyvsp12 -1
	if yyvsp1 >= yyvsc1 or yyvs1 = Void or yyspecial_routines1 = Void then
		if yyvs1 = Void or yyspecial_routines1 = Void then
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
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 46 then
--|#line 617 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 617")
end

			yyval28 := yyvs18.item (yyvsp18)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp28 := yyvsp28 + 1
	yyvsp18 := yyvsp18 -1
	if yyvsp28 >= yyvsc28 or yyvs28 = Void or yyspecial_routines28 = Void then
		if yyvs28 = Void or yyspecial_routines28 = Void then
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
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
when 47 then
--|#line 621 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 621")
end

			yyval28 := yyvs19.item (yyvsp19)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp28 := yyvsp28 + 1
	yyvsp19 := yyvsp19 -1
	if yyvsp28 >= yyvsc28 or yyvs28 = Void or yyspecial_routines28 = Void then
		if yyvs28 = Void or yyspecial_routines28 = Void then
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
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
when 48 then
--|#line 625 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 625")
end

			yyval28 := yyvs20.item (yyvsp20)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp28 := yyvsp28 + 1
	yyvsp20 := yyvsp20 -1
	if yyvsp28 >= yyvsc28 or yyvs28 = Void or yyspecial_routines28 = Void then
		if yyvs28 = Void or yyspecial_routines28 = Void then
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
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
when 49 then
--|#line 629 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 629")
end

			yyval28 := yyvs22.item (yyvsp22)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp28 := yyvsp28 + 1
	yyvsp22 := yyvsp22 -1
	if yyvsp28 >= yyvsc28 or yyvs28 = Void or yyspecial_routines28 = Void then
		if yyvs28 = Void or yyspecial_routines28 = Void then
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
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
when 50 then
--|#line 633 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 633")
end

			yyval28 := yyvs21.item (yyvsp21)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp28 := yyvsp28 + 1
	yyvsp21 := yyvsp21 -1
	if yyvsp28 >= yyvsc28 or yyvs28 = Void or yyspecial_routines28 = Void then
		if yyvs28 = Void or yyspecial_routines28 = Void then
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
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
when 51 then
--|#line 637 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 637")
end

			yyval28 := yyvs23.item (yyvsp23)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp28 := yyvsp28 + 1
	yyvsp23 := yyvsp23 -1
	if yyvsp28 >= yyvsc28 or yyvs28 = Void or yyspecial_routines28 = Void then
		if yyvs28 = Void or yyspecial_routines28 = Void then
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
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
when 52 then
--|#line 641 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 641")
end

			yyval28 := yyvs24.item (yyvsp24)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp28 := yyvsp28 + 1
	yyvsp24 := yyvsp24 -1
	if yyvsp28 >= yyvsc28 or yyvs28 = Void or yyspecial_routines28 = Void then
		if yyvs28 = Void or yyspecial_routines28 = Void then
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
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
when 53 then
--|#line 645 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 645")
end

			yyval28 := yyvs25.item (yyvsp25)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp28 := yyvsp28 + 1
	yyvsp25 := yyvsp25 -1
	if yyvsp28 >= yyvsc28 or yyvs28 = Void or yyspecial_routines28 = Void then
		if yyvs28 = Void or yyspecial_routines28 = Void then
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
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
when 54 then
--|#line 649 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 649")
end

			yyval28 := yyvs26.item (yyvsp26)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp28 := yyvsp28 + 1
	yyvsp26 := yyvsp26 -1
	if yyvsp28 >= yyvsc28 or yyvs28 = Void or yyspecial_routines28 = Void then
		if yyvs28 = Void or yyspecial_routines28 = Void then
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
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
when 55 then
--|#line 655 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 655")
end

			yyval35 := yyvs29.item (yyvsp29)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp35 := yyvsp35 + 1
	yyvsp29 := yyvsp29 -1
	if yyvsp35 >= yyvsc35 or yyvs35 = Void or yyspecial_routines35 = Void then
		if yyvs35 = Void or yyspecial_routines35 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs35")
			end
			create yyspecial_routines35
			yyvsc35 := yyInitial_yyvs_size
			yyvs35 := yyspecial_routines35.make (yyvsc35)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs35")
			end
			yyvsc35 := yyvsc35 + yyInitial_yyvs_size
			yyvs35 := yyspecial_routines35.resize (yyvs35, yyvsc35)
		end
	end
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 56 then
--|#line 659 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 659")
end

			yyval35 := yyvs30.item (yyvsp30)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp35 := yyvsp35 + 1
	yyvsp30 := yyvsp30 -1
	if yyvsp35 >= yyvsc35 or yyvs35 = Void or yyspecial_routines35 = Void then
		if yyvs35 = Void or yyspecial_routines35 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs35")
			end
			create yyspecial_routines35
			yyvsc35 := yyInitial_yyvs_size
			yyvs35 := yyspecial_routines35.make (yyvsc35)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs35")
			end
			yyvsc35 := yyvsc35 + yyInitial_yyvs_size
			yyvs35 := yyspecial_routines35.resize (yyvs35, yyvsc35)
		end
	end
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 57 then
--|#line 663 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 663")
end

			yyval35 := yyvs32.item (yyvsp32)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp35 := yyvsp35 + 1
	yyvsp32 := yyvsp32 -1
	if yyvsp35 >= yyvsc35 or yyvs35 = Void or yyspecial_routines35 = Void then
		if yyvs35 = Void or yyspecial_routines35 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs35")
			end
			create yyspecial_routines35
			yyvsc35 := yyInitial_yyvs_size
			yyvs35 := yyspecial_routines35.make (yyvsc35)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs35")
			end
			yyvsc35 := yyvsc35 + yyInitial_yyvs_size
			yyvs35 := yyspecial_routines35.resize (yyvs35, yyvsc35)
		end
	end
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 58 then
--|#line 667 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 667")
end

			yyval35 := yyvs31.item (yyvsp31)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp35 := yyvsp35 + 1
	yyvsp31 := yyvsp31 -1
	if yyvsp35 >= yyvsc35 or yyvs35 = Void or yyspecial_routines35 = Void then
		if yyvs35 = Void or yyspecial_routines35 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs35")
			end
			create yyspecial_routines35
			yyvsc35 := yyInitial_yyvs_size
			yyvs35 := yyspecial_routines35.make (yyvsc35)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs35")
			end
			yyvsc35 := yyvsc35 + yyInitial_yyvs_size
			yyvs35 := yyspecial_routines35.resize (yyvs35, yyvsc35)
		end
	end
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 59 then
--|#line 671 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 671")
end

			yyval35 := yyvs33.item (yyvsp33)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp35 := yyvsp35 + 1
	yyvsp33 := yyvsp33 -1
	if yyvsp35 >= yyvsc35 or yyvs35 = Void or yyspecial_routines35 = Void then
		if yyvs35 = Void or yyspecial_routines35 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs35")
			end
			create yyspecial_routines35
			yyvsc35 := yyInitial_yyvs_size
			yyvs35 := yyspecial_routines35.make (yyvsc35)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs35")
			end
			yyvsc35 := yyvsc35 + yyInitial_yyvs_size
			yyvs35 := yyspecial_routines35.resize (yyvs35, yyvsc35)
		end
	end
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 60 then
--|#line 675 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 675")
end

			yyval35 := yyvs34.item (yyvsp34)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp35 := yyvsp35 + 1
	yyvsp34 := yyvsp34 -1
	if yyvsp35 >= yyvsc35 or yyvs35 = Void or yyspecial_routines35 = Void then
		if yyvs35 = Void or yyspecial_routines35 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs35")
			end
			create yyspecial_routines35
			yyvsc35 := yyInitial_yyvs_size
			yyvs35 := yyspecial_routines35.make (yyvsc35)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs35")
			end
			yyvsc35 := yyvsc35 + yyInitial_yyvs_size
			yyvs35 := yyspecial_routines35.resize (yyvs35, yyvsc35)
		end
	end
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 61 then
--|#line 684 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 684")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 62 then
--|#line 688 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 688")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 63 then
--|#line 692 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 692")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 64 then
--|#line 696 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 696")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 65 then
--|#line 702 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 702")
end

			yyval1 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp1 >= yyvsc1 or yyvs1 = Void or yyspecial_routines1 = Void then
		if yyvs1 = Void or yyspecial_routines1 = Void then
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
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 66 then
--|#line 708 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 708")
end

			create yyval18.make(0)
			yyval18.extend(yyvs4.item (yyvsp4 - 1))
			yyval18.extend(yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp18 := yyvsp18 + 1
	yyvsp4 := yyvsp4 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp18 >= yyvsc18 or yyvs18 = Void or yyspecial_routines18 = Void then
		if yyvs18 = Void or yyspecial_routines18 = Void then
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
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
when 67 then
--|#line 714 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 714")
end

			yyvs18.item (yyvsp18).extend(yyvs4.item (yyvsp4))
			yyval18 := yyvs18.item (yyvsp18)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
when 68 then
--|#line 722 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 722")
end

			yyval18 := yyvs18.item (yyvsp18)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
when 69 then
--|#line 726 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 726")
end

			create yyval18.make (0)
			yyval18.extend (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp18 := yyvsp18 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp18 >= yyvsc18 or yyvs18 = Void or yyspecial_routines18 = Void then
		if yyvs18 = Void or yyspecial_routines18 = Void then
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
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
when 70 then
--|#line 733 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 733")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 71 then
--|#line 736 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 736")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 72 then
--|#line 739 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 739")
end

			yyval2 := - yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 73 then
--|#line 744 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 744")
end

			create yyval19.make(0)
			yyval19.extend(yyvs2.item (yyvsp2 - 1))
			yyval19.extend(yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp19 := yyvsp19 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp19 >= yyvsc19 or yyvs19 = Void or yyspecial_routines19 = Void then
		if yyvs19 = Void or yyspecial_routines19 = Void then
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
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 74 then
--|#line 750 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 750")
end

			yyvs19.item (yyvsp19).extend(yyvs2.item (yyvsp2))
			yyval19 := yyvs19.item (yyvsp19)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 75 then
--|#line 755 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 755")
end

			create yyval19.make(0)
			yyval19.extend(yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp19 := yyvsp19 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp19 >= yyvsc19 or yyvs19 = Void or yyspecial_routines19 = Void then
		if yyvs19 = Void or yyspecial_routines19 = Void then
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
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 76 then
--|#line 762 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 762")
end

			if yyvs2.item (yyvsp2 - 1) <= yyvs2.item (yyvsp2) then
				create yyval29.make_bounded(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs2.item (yyvsp2 - 1).out, yyvs2.item (yyvsp2).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp29 := yyvsp29 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -2
	if yyvsp29 >= yyvsc29 or yyvs29 = Void or yyspecial_routines29 = Void then
		if yyvs29 = Void or yyspecial_routines29 = Void then
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
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
when 77 then
--|#line 770 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 770")
end

			if yyvs2.item (yyvsp2 - 1) <= yyvs2.item (yyvsp2) then
				create yyval29.make_bounded(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs2.item (yyvsp2 - 1).out, yyvs2.item (yyvsp2).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp29 := yyvsp29 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp2 := yyvsp2 -2
	if yyvsp29 >= yyvsc29 or yyvs29 = Void or yyspecial_routines29 = Void then
		if yyvs29 = Void or yyspecial_routines29 = Void then
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
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
when 78 then
--|#line 778 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 778")
end

			if yyvs2.item (yyvsp2 - 1) <= yyvs2.item (yyvsp2) then
				create yyval29.make_bounded(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs2.item (yyvsp2 - 1).out, yyvs2.item (yyvsp2).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp29 := yyvsp29 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp2 := yyvsp2 -2
	if yyvsp29 >= yyvsc29 or yyvs29 = Void or yyspecial_routines29 = Void then
		if yyvs29 = Void or yyspecial_routines29 = Void then
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
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
when 79 then
--|#line 786 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 786")
end

			if yyvs2.item (yyvsp2 - 1) <= yyvs2.item (yyvsp2) then
				create yyval29.make_bounded(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs2.item (yyvsp2 - 1).out, yyvs2.item (yyvsp2).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp29 := yyvsp29 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp2 := yyvsp2 -2
	if yyvsp29 >= yyvsc29 or yyvs29 = Void or yyspecial_routines29 = Void then
		if yyvs29 = Void or yyspecial_routines29 = Void then
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
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
when 80 then
--|#line 794 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 794")
end

			create yyval29.make_lower_unbounded(yyvs2.item (yyvsp2), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp29 := yyvsp29 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -1
	if yyvsp29 >= yyvsc29 or yyvs29 = Void or yyspecial_routines29 = Void then
		if yyvs29 = Void or yyspecial_routines29 = Void then
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
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
when 81 then
--|#line 798 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 798")
end

			create yyval29.make_lower_unbounded(yyvs2.item (yyvsp2), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp29 := yyvsp29 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -1
	if yyvsp29 >= yyvsc29 or yyvs29 = Void or yyspecial_routines29 = Void then
		if yyvs29 = Void or yyspecial_routines29 = Void then
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
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
when 82 then
--|#line 802 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 802")
end

			create yyval29.make_upper_unbounded(yyvs2.item (yyvsp2), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp29 := yyvsp29 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -1
	if yyvsp29 >= yyvsc29 or yyvs29 = Void or yyspecial_routines29 = Void then
		if yyvs29 = Void or yyspecial_routines29 = Void then
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
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
when 83 then
--|#line 806 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 806")
end

			create yyval29.make_upper_unbounded(yyvs2.item (yyvsp2), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp29 := yyvsp29 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -1
	if yyvsp29 >= yyvsc29 or yyvs29 = Void or yyspecial_routines29 = Void then
		if yyvs29 = Void or yyspecial_routines29 = Void then
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
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
when 84 then
--|#line 810 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 810")
end

			create yyval29.make_point(yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp29 := yyvsp29 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -1
	if yyvsp29 >= yyvsc29 or yyvs29 = Void or yyspecial_routines29 = Void then
		if yyvs29 = Void or yyspecial_routines29 = Void then
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
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
when 85 then
--|#line 816 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 816")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 86 then
--|#line 820 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 820")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 87 then
--|#line 824 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 824")
end

			yyval3 := - yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 88 then
--|#line 830 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 830")
end

			create yyval20.make(0)
			yyval20.extend(yyvs3.item (yyvsp3 - 1))
			yyval20.extend(yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp20 := yyvsp20 + 1
	yyvsp3 := yyvsp3 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp20 >= yyvsc20 or yyvs20 = Void or yyspecial_routines20 = Void then
		if yyvs20 = Void or yyspecial_routines20 = Void then
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
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 89 then
--|#line 836 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 836")
end

			yyvs20.item (yyvsp20).extend(yyvs3.item (yyvsp3))
			yyval20 := yyvs20.item (yyvsp20)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 90 then
--|#line 841 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 841")
end

			create yyval20.make(0)
			yyval20.extend(yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp20 := yyvsp20 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp20 >= yyvsc20 or yyvs20 = Void or yyspecial_routines20 = Void then
		if yyvs20 = Void or yyspecial_routines20 = Void then
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
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 91 then
--|#line 848 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 848")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create yyval30.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp30 := yyvsp30 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -2
	if yyvsp30 >= yyvsc30 or yyvs30 = Void or yyspecial_routines30 = Void then
		if yyvs30 = Void or yyspecial_routines30 = Void then
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
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
when 92 then
--|#line 856 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 856")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create yyval30.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp30 := yyvsp30 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp3 := yyvsp3 -2
	if yyvsp30 >= yyvsc30 or yyvs30 = Void or yyspecial_routines30 = Void then
		if yyvs30 = Void or yyspecial_routines30 = Void then
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
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
when 93 then
--|#line 864 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 864")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create yyval30.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp30 := yyvsp30 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp3 := yyvsp3 -2
	if yyvsp30 >= yyvsc30 or yyvs30 = Void or yyspecial_routines30 = Void then
		if yyvs30 = Void or yyspecial_routines30 = Void then
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
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
when 94 then
--|#line 872 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 872")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create yyval30.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp30 := yyvsp30 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp3 := yyvsp3 -2
	if yyvsp30 >= yyvsc30 or yyvs30 = Void or yyspecial_routines30 = Void then
		if yyvs30 = Void or yyspecial_routines30 = Void then
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
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
when 95 then
--|#line 880 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 880")
end

			create yyval30.make_lower_unbounded(yyvs3.item (yyvsp3), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp30 := yyvsp30 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp30 >= yyvsc30 or yyvs30 = Void or yyspecial_routines30 = Void then
		if yyvs30 = Void or yyspecial_routines30 = Void then
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
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
when 96 then
--|#line 884 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 884")
end

			create yyval30.make_lower_unbounded(yyvs3.item (yyvsp3), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp30 := yyvsp30 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp30 >= yyvsc30 or yyvs30 = Void or yyspecial_routines30 = Void then
		if yyvs30 = Void or yyspecial_routines30 = Void then
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
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
when 97 then
--|#line 888 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 888")
end

			create yyval30.make_upper_unbounded(yyvs3.item (yyvsp3), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp30 := yyvsp30 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp30 >= yyvsc30 or yyvs30 = Void or yyspecial_routines30 = Void then
		if yyvs30 = Void or yyspecial_routines30 = Void then
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
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
when 98 then
--|#line 892 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 892")
end

			create yyval30.make_upper_unbounded(yyvs3.item (yyvsp3), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp30 := yyvsp30 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp30 >= yyvsc30 or yyvs30 = Void or yyspecial_routines30 = Void then
		if yyvs30 = Void or yyspecial_routines30 = Void then
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
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
when 99 then
--|#line 896 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 896")
end

			create yyval30.make_point(yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp30 := yyvsp30 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp3 := yyvsp3 -1
	if yyvsp30 >= yyvsc30 or yyvs30 = Void or yyspecial_routines30 = Void then
		if yyvs30 = Void or yyspecial_routines30 = Void then
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
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
when 100 then
--|#line 902 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 902")
end

			yyval6 := True
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp6 := yyvsp6 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp6 >= yyvsc6 or yyvs6 = Void or yyspecial_routines6 = Void then
		if yyvs6 = Void or yyspecial_routines6 = Void then
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
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 101 then
--|#line 906 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 906")
end

			yyval6 := False
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp6 := yyvsp6 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp6 >= yyvsc6 or yyvs6 = Void or yyspecial_routines6 = Void then
		if yyvs6 = Void or yyspecial_routines6 = Void then
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
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 102 then
--|#line 912 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 912")
end

			create yyval22.make(0)
			yyval22.extend(yyvs6.item (yyvsp6 - 1))
			yyval22.extend(yyvs6.item (yyvsp6))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp22 := yyvsp22 + 1
	yyvsp6 := yyvsp6 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp22 >= yyvsc22 or yyvs22 = Void or yyspecial_routines22 = Void then
		if yyvs22 = Void or yyspecial_routines22 = Void then
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
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
when 103 then
--|#line 918 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 918")
end

			yyvs22.item (yyvsp22).extend(yyvs6.item (yyvsp6))
			yyval22 := yyvs22.item (yyvsp22)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp6 := yyvsp6 -1
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
when 104 then
--|#line 923 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 923")
end

			create yyval22.make(0)
			yyval22.extend(yyvs6.item (yyvsp6))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp22 := yyvsp22 + 1
	yyvsp6 := yyvsp6 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp22 >= yyvsc22 or yyvs22 = Void or yyspecial_routines22 = Void then
		if yyvs22 = Void or yyspecial_routines22 = Void then
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
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
when 105 then
--|#line 930 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 930")
end

			yyval5 := yyvs5.item (yyvsp5)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 106 then
--|#line 936 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 936")
end

			create yyval21.make(0)
			yyval21.extend(yyvs5.item (yyvsp5 - 1))
			yyval21.extend(yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp21 := yyvsp21 + 1
	yyvsp5 := yyvsp5 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp21 >= yyvsc21 or yyvs21 = Void or yyspecial_routines21 = Void then
		if yyvs21 = Void or yyspecial_routines21 = Void then
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
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 107 then
--|#line 942 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 942")
end

			yyvs21.item (yyvsp21).extend(yyvs5.item (yyvsp5))
			yyval21 := yyvs21.item (yyvsp21)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 108 then
--|#line 947 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 947")
end

			create yyval21.make(0)
			yyval21.extend(yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp21 := yyvsp21 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp21 >= yyvsc21 or yyvs21 = Void or yyspecial_routines21 = Void then
		if yyvs21 = Void or yyspecial_routines21 = Void then
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
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 109 then
--|#line 954 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 954")
end

			if valid_iso8601_date(yyvs4.item (yyvsp4)) then
				create yyval7.make_from_string(yyvs4.item (yyvsp4))
			else
				abort_with_error (ec_VIDV, <<yyvs4.item (yyvsp4)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp7 := yyvsp7 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp7 >= yyvsc7 or yyvs7 = Void or yyspecial_routines7 = Void then
		if yyvs7 = Void or yyspecial_routines7 = Void then
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
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 110 then
--|#line 964 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 964")
end

			create yyval23.make(0)
			yyval23.extend(yyvs7.item (yyvsp7 - 1))
			yyval23.extend(yyvs7.item (yyvsp7))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp23 := yyvsp23 + 1
	yyvsp7 := yyvsp7 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp23 >= yyvsc23 or yyvs23 = Void or yyspecial_routines23 = Void then
		if yyvs23 = Void or yyspecial_routines23 = Void then
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
	yyspecial_routines23.force (yyvs23, yyval23, yyvsp23)
end
when 111 then
--|#line 970 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 970")
end

			yyvs23.item (yyvsp23).extend(yyvs7.item (yyvsp7))
			yyval23 := yyvs23.item (yyvsp23)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp7 := yyvsp7 -1
	yyspecial_routines23.force (yyvs23, yyval23, yyvsp23)
end
when 112 then
--|#line 975 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 975")
end

			create yyval23.make(0)
			yyval23.extend(yyvs7.item (yyvsp7))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp23 := yyvsp23 + 1
	yyvsp7 := yyvsp7 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp23 >= yyvsc23 or yyvs23 = Void or yyspecial_routines23 = Void then
		if yyvs23 = Void or yyspecial_routines23 = Void then
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
	yyspecial_routines23.force (yyvs23, yyval23, yyvsp23)
end
when 113 then
--|#line 982 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 982")
end

			if yyvs7.item (yyvsp7 - 1) <= yyvs7.item (yyvsp7) then
				create yyval32.make_bounded(yyvs7.item (yyvsp7 - 1), yyvs7.item (yyvsp7), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs7.item (yyvsp7 - 1).out, yyvs7.item (yyvsp7).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp7 := yyvsp7 -2
	if yyvsp32 >= yyvsc32 or yyvs32 = Void or yyspecial_routines32 = Void then
		if yyvs32 = Void or yyspecial_routines32 = Void then
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
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 114 then
--|#line 990 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 990")
end

			if yyvs7.item (yyvsp7 - 1) <= yyvs7.item (yyvsp7) then
				create yyval32.make_bounded(yyvs7.item (yyvsp7 - 1), yyvs7.item (yyvsp7), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs7.item (yyvsp7 - 1).out, yyvs7.item (yyvsp7).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp7 := yyvsp7 -2
	if yyvsp32 >= yyvsc32 or yyvs32 = Void or yyspecial_routines32 = Void then
		if yyvs32 = Void or yyspecial_routines32 = Void then
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
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 115 then
--|#line 998 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 998")
end

			if yyvs7.item (yyvsp7 - 1) <= yyvs7.item (yyvsp7) then
				create yyval32.make_bounded(yyvs7.item (yyvsp7 - 1), yyvs7.item (yyvsp7), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs7.item (yyvsp7 - 1).out, yyvs7.item (yyvsp7).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp7 := yyvsp7 -2
	if yyvsp32 >= yyvsc32 or yyvs32 = Void or yyspecial_routines32 = Void then
		if yyvs32 = Void or yyspecial_routines32 = Void then
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
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 116 then
--|#line 1006 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1006")
end

			if yyvs7.item (yyvsp7 - 1) <= yyvs7.item (yyvsp7) then
				create yyval32.make_bounded(yyvs7.item (yyvsp7 - 1), yyvs7.item (yyvsp7), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs7.item (yyvsp7 - 1).out, yyvs7.item (yyvsp7).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp7 := yyvsp7 -2
	if yyvsp32 >= yyvsc32 or yyvs32 = Void or yyspecial_routines32 = Void then
		if yyvs32 = Void or yyspecial_routines32 = Void then
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
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 117 then
--|#line 1014 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1014")
end

			create yyval32.make_lower_unbounded(yyvs7.item (yyvsp7), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp7 := yyvsp7 -1
	if yyvsp32 >= yyvsc32 or yyvs32 = Void or yyspecial_routines32 = Void then
		if yyvs32 = Void or yyspecial_routines32 = Void then
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
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 118 then
--|#line 1018 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1018")
end

			create yyval32.make_lower_unbounded(yyvs7.item (yyvsp7), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp7 := yyvsp7 -1
	if yyvsp32 >= yyvsc32 or yyvs32 = Void or yyspecial_routines32 = Void then
		if yyvs32 = Void or yyspecial_routines32 = Void then
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
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 119 then
--|#line 1022 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1022")
end

			create yyval32.make_upper_unbounded(yyvs7.item (yyvsp7), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp7 := yyvsp7 -1
	if yyvsp32 >= yyvsc32 or yyvs32 = Void or yyspecial_routines32 = Void then
		if yyvs32 = Void or yyspecial_routines32 = Void then
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
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 120 then
--|#line 1026 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1026")
end

			create yyval32.make_upper_unbounded(yyvs7.item (yyvsp7), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp7 := yyvsp7 -1
	if yyvsp32 >= yyvsc32 or yyvs32 = Void or yyspecial_routines32 = Void then
		if yyvs32 = Void or yyspecial_routines32 = Void then
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
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 121 then
--|#line 1030 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1030")
end

			create yyval32.make_point(yyvs7.item (yyvsp7))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp7 := yyvsp7 -1
	if yyvsp32 >= yyvsc32 or yyvs32 = Void or yyspecial_routines32 = Void then
		if yyvs32 = Void or yyspecial_routines32 = Void then
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
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 122 then
--|#line 1036 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1036")
end

			if valid_iso8601_time(yyvs4.item (yyvsp4)) then
				create yyval9.make_from_string(yyvs4.item (yyvsp4))
			else
				abort_with_error (ec_VITV, <<yyvs4.item (yyvsp4)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp9 := yyvsp9 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp9 >= yyvsc9 or yyvs9 = Void or yyspecial_routines9 = Void then
		if yyvs9 = Void or yyspecial_routines9 = Void then
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
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
when 123 then
--|#line 1046 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1046")
end

			create yyval24.make(0)
			yyval24.extend(yyvs9.item (yyvsp9 - 1))
			yyval24.extend(yyvs9.item (yyvsp9))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp24 := yyvsp24 + 1
	yyvsp9 := yyvsp9 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp24 >= yyvsc24 or yyvs24 = Void or yyspecial_routines24 = Void then
		if yyvs24 = Void or yyspecial_routines24 = Void then
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
	yyspecial_routines24.force (yyvs24, yyval24, yyvsp24)
end
when 124 then
--|#line 1052 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1052")
end

			yyvs24.item (yyvsp24).extend(yyvs9.item (yyvsp9))
			yyval24 := yyvs24.item (yyvsp24)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp9 := yyvsp9 -1
	yyspecial_routines24.force (yyvs24, yyval24, yyvsp24)
end
when 125 then
--|#line 1057 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1057")
end

			create yyval24.make(0)
			yyval24.extend(yyvs9.item (yyvsp9))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp24 := yyvsp24 + 1
	yyvsp9 := yyvsp9 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp24 >= yyvsc24 or yyvs24 = Void or yyspecial_routines24 = Void then
		if yyvs24 = Void or yyspecial_routines24 = Void then
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
	yyspecial_routines24.force (yyvs24, yyval24, yyvsp24)
end
when 126 then
--|#line 1064 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1064")
end

			if yyvs9.item (yyvsp9 - 1) <= yyvs9.item (yyvsp9) then
				create yyval31.make_bounded(yyvs9.item (yyvsp9 - 1), yyvs9.item (yyvsp9), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs9.item (yyvsp9 - 1).out, yyvs9.item (yyvsp9).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp31 := yyvsp31 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp9 := yyvsp9 -2
	if yyvsp31 >= yyvsc31 or yyvs31 = Void or yyspecial_routines31 = Void then
		if yyvs31 = Void or yyspecial_routines31 = Void then
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
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 127 then
--|#line 1072 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1072")
end

			if yyvs9.item (yyvsp9 - 1) <= yyvs9.item (yyvsp9) then
				create yyval31.make_bounded(yyvs9.item (yyvsp9 - 1), yyvs9.item (yyvsp9), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs9.item (yyvsp9 - 1).out, yyvs9.item (yyvsp9).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp31 := yyvsp31 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp9 := yyvsp9 -2
	if yyvsp31 >= yyvsc31 or yyvs31 = Void or yyspecial_routines31 = Void then
		if yyvs31 = Void or yyspecial_routines31 = Void then
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
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 128 then
--|#line 1080 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1080")
end

			if yyvs9.item (yyvsp9 - 1) <= yyvs9.item (yyvsp9) then
				create yyval31.make_bounded(yyvs9.item (yyvsp9 - 1), yyvs9.item (yyvsp9), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs9.item (yyvsp9 - 1).out, yyvs9.item (yyvsp9).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp31 := yyvsp31 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp9 := yyvsp9 -2
	if yyvsp31 >= yyvsc31 or yyvs31 = Void or yyspecial_routines31 = Void then
		if yyvs31 = Void or yyspecial_routines31 = Void then
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
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 129 then
--|#line 1088 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1088")
end

			if yyvs9.item (yyvsp9 - 1) <= yyvs9.item (yyvsp9) then
				create yyval31.make_bounded(yyvs9.item (yyvsp9 - 1), yyvs9.item (yyvsp9), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs9.item (yyvsp9 - 1).out, yyvs9.item (yyvsp9).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp31 := yyvsp31 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp9 := yyvsp9 -2
	if yyvsp31 >= yyvsc31 or yyvs31 = Void or yyspecial_routines31 = Void then
		if yyvs31 = Void or yyspecial_routines31 = Void then
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
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 130 then
--|#line 1096 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1096")
end

			create yyval31.make_lower_unbounded(yyvs9.item (yyvsp9), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp31 := yyvsp31 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp9 := yyvsp9 -1
	if yyvsp31 >= yyvsc31 or yyvs31 = Void or yyspecial_routines31 = Void then
		if yyvs31 = Void or yyspecial_routines31 = Void then
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
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 131 then
--|#line 1100 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1100")
end

			create yyval31.make_lower_unbounded(yyvs9.item (yyvsp9), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp31 := yyvsp31 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp9 := yyvsp9 -1
	if yyvsp31 >= yyvsc31 or yyvs31 = Void or yyspecial_routines31 = Void then
		if yyvs31 = Void or yyspecial_routines31 = Void then
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
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 132 then
--|#line 1104 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1104")
end

			create yyval31.make_upper_unbounded(yyvs9.item (yyvsp9), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp31 := yyvsp31 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp9 := yyvsp9 -1
	if yyvsp31 >= yyvsc31 or yyvs31 = Void or yyspecial_routines31 = Void then
		if yyvs31 = Void or yyspecial_routines31 = Void then
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
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 133 then
--|#line 1108 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1108")
end

			create yyval31.make_upper_unbounded(yyvs9.item (yyvsp9), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp31 := yyvsp31 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp9 := yyvsp9 -1
	if yyvsp31 >= yyvsc31 or yyvs31 = Void or yyspecial_routines31 = Void then
		if yyvs31 = Void or yyspecial_routines31 = Void then
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
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 134 then
--|#line 1112 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1112")
end

			create yyval31.make_point(yyvs9.item (yyvsp9))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp31 := yyvsp31 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp9 := yyvsp9 -1
	if yyvsp31 >= yyvsc31 or yyvs31 = Void or yyspecial_routines31 = Void then
		if yyvs31 = Void or yyspecial_routines31 = Void then
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
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 135 then
--|#line 1118 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1118")
end

			if valid_iso8601_date_time(yyvs4.item (yyvsp4)) then
				create yyval8.make_from_string(yyvs4.item (yyvsp4))
			else
				abort_with_error (ec_VIDTV, <<yyvs4.item (yyvsp4)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp8 := yyvsp8 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp8 >= yyvsc8 or yyvs8 = Void or yyspecial_routines8 = Void then
		if yyvs8 = Void or yyspecial_routines8 = Void then
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
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 136 then
--|#line 1128 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1128")
end

			create yyval25.make(0)
			yyval25.extend(yyvs8.item (yyvsp8 - 1))
			yyval25.extend(yyvs8.item (yyvsp8))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp25 := yyvsp25 + 1
	yyvsp8 := yyvsp8 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp25 >= yyvsc25 or yyvs25 = Void or yyspecial_routines25 = Void then
		if yyvs25 = Void or yyspecial_routines25 = Void then
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
	yyspecial_routines25.force (yyvs25, yyval25, yyvsp25)
end
when 137 then
--|#line 1134 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1134")
end

			yyvs25.item (yyvsp25).extend(yyvs8.item (yyvsp8))
			yyval25 := yyvs25.item (yyvsp25)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp8 := yyvsp8 -1
	yyspecial_routines25.force (yyvs25, yyval25, yyvsp25)
end
when 138 then
--|#line 1139 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1139")
end

			create yyval25.make(0)
			yyval25.extend(yyvs8.item (yyvsp8))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp25 := yyvsp25 + 1
	yyvsp8 := yyvsp8 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp25 >= yyvsc25 or yyvs25 = Void or yyspecial_routines25 = Void then
		if yyvs25 = Void or yyspecial_routines25 = Void then
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
	yyspecial_routines25.force (yyvs25, yyval25, yyvsp25)
end
when 139 then
--|#line 1146 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1146")
end

			if yyvs8.item (yyvsp8 - 1) <= yyvs8.item (yyvsp8) then
				create yyval33.make_bounded(yyvs8.item (yyvsp8 - 1), yyvs8.item (yyvsp8), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs8.item (yyvsp8 - 1).out, yyvs8.item (yyvsp8).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp33 := yyvsp33 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp8 := yyvsp8 -2
	if yyvsp33 >= yyvsc33 or yyvs33 = Void or yyspecial_routines33 = Void then
		if yyvs33 = Void or yyspecial_routines33 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs33")
			end
			create yyspecial_routines33
			yyvsc33 := yyInitial_yyvs_size
			yyvs33 := yyspecial_routines33.make (yyvsc33)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs33")
			end
			yyvsc33 := yyvsc33 + yyInitial_yyvs_size
			yyvs33 := yyspecial_routines33.resize (yyvs33, yyvsc33)
		end
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 140 then
--|#line 1154 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1154")
end

			if yyvs8.item (yyvsp8 - 1) <= yyvs8.item (yyvsp8) then
				create yyval33.make_bounded(yyvs8.item (yyvsp8 - 1), yyvs8.item (yyvsp8), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs8.item (yyvsp8 - 1).out, yyvs8.item (yyvsp8).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp33 := yyvsp33 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp8 := yyvsp8 -2
	if yyvsp33 >= yyvsc33 or yyvs33 = Void or yyspecial_routines33 = Void then
		if yyvs33 = Void or yyspecial_routines33 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs33")
			end
			create yyspecial_routines33
			yyvsc33 := yyInitial_yyvs_size
			yyvs33 := yyspecial_routines33.make (yyvsc33)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs33")
			end
			yyvsc33 := yyvsc33 + yyInitial_yyvs_size
			yyvs33 := yyspecial_routines33.resize (yyvs33, yyvsc33)
		end
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 141 then
--|#line 1162 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1162")
end

			if yyvs8.item (yyvsp8 - 1) <= yyvs8.item (yyvsp8) then
				create yyval33.make_bounded(yyvs8.item (yyvsp8 - 1), yyvs8.item (yyvsp8), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs8.item (yyvsp8 - 1).out, yyvs8.item (yyvsp8).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp33 := yyvsp33 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp8 := yyvsp8 -2
	if yyvsp33 >= yyvsc33 or yyvs33 = Void or yyspecial_routines33 = Void then
		if yyvs33 = Void or yyspecial_routines33 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs33")
			end
			create yyspecial_routines33
			yyvsc33 := yyInitial_yyvs_size
			yyvs33 := yyspecial_routines33.make (yyvsc33)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs33")
			end
			yyvsc33 := yyvsc33 + yyInitial_yyvs_size
			yyvs33 := yyspecial_routines33.resize (yyvs33, yyvsc33)
		end
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 142 then
--|#line 1170 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1170")
end

			if yyvs8.item (yyvsp8 - 1) <= yyvs8.item (yyvsp8) then
				create yyval33.make_bounded(yyvs8.item (yyvsp8 - 1), yyvs8.item (yyvsp8), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs8.item (yyvsp8 - 1).out, yyvs8.item (yyvsp8).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp33 := yyvsp33 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp8 := yyvsp8 -2
	if yyvsp33 >= yyvsc33 or yyvs33 = Void or yyspecial_routines33 = Void then
		if yyvs33 = Void or yyspecial_routines33 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs33")
			end
			create yyspecial_routines33
			yyvsc33 := yyInitial_yyvs_size
			yyvs33 := yyspecial_routines33.make (yyvsc33)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs33")
			end
			yyvsc33 := yyvsc33 + yyInitial_yyvs_size
			yyvs33 := yyspecial_routines33.resize (yyvs33, yyvsc33)
		end
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 143 then
--|#line 1178 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1178")
end

			create yyval33.make_lower_unbounded(yyvs8.item (yyvsp8), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp33 := yyvsp33 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp8 := yyvsp8 -1
	if yyvsp33 >= yyvsc33 or yyvs33 = Void or yyspecial_routines33 = Void then
		if yyvs33 = Void or yyspecial_routines33 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs33")
			end
			create yyspecial_routines33
			yyvsc33 := yyInitial_yyvs_size
			yyvs33 := yyspecial_routines33.make (yyvsc33)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs33")
			end
			yyvsc33 := yyvsc33 + yyInitial_yyvs_size
			yyvs33 := yyspecial_routines33.resize (yyvs33, yyvsc33)
		end
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 144 then
--|#line 1182 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1182")
end

			create yyval33.make_lower_unbounded(yyvs8.item (yyvsp8), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp33 := yyvsp33 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp8 := yyvsp8 -1
	if yyvsp33 >= yyvsc33 or yyvs33 = Void or yyspecial_routines33 = Void then
		if yyvs33 = Void or yyspecial_routines33 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs33")
			end
			create yyspecial_routines33
			yyvsc33 := yyInitial_yyvs_size
			yyvs33 := yyspecial_routines33.make (yyvsc33)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs33")
			end
			yyvsc33 := yyvsc33 + yyInitial_yyvs_size
			yyvs33 := yyspecial_routines33.resize (yyvs33, yyvsc33)
		end
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 145 then
--|#line 1186 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1186")
end

			create yyval33.make_upper_unbounded(yyvs8.item (yyvsp8), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp33 := yyvsp33 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp8 := yyvsp8 -1
	if yyvsp33 >= yyvsc33 or yyvs33 = Void or yyspecial_routines33 = Void then
		if yyvs33 = Void or yyspecial_routines33 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs33")
			end
			create yyspecial_routines33
			yyvsc33 := yyInitial_yyvs_size
			yyvs33 := yyspecial_routines33.make (yyvsc33)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs33")
			end
			yyvsc33 := yyvsc33 + yyInitial_yyvs_size
			yyvs33 := yyspecial_routines33.resize (yyvs33, yyvsc33)
		end
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 146 then
--|#line 1190 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1190")
end

			create yyval33.make_upper_unbounded(yyvs8.item (yyvsp8), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp33 := yyvsp33 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp8 := yyvsp8 -1
	if yyvsp33 >= yyvsc33 or yyvs33 = Void or yyspecial_routines33 = Void then
		if yyvs33 = Void or yyspecial_routines33 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs33")
			end
			create yyspecial_routines33
			yyvsc33 := yyInitial_yyvs_size
			yyvs33 := yyspecial_routines33.make (yyvsc33)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs33")
			end
			yyvsc33 := yyvsc33 + yyInitial_yyvs_size
			yyvs33 := yyspecial_routines33.resize (yyvs33, yyvsc33)
		end
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 147 then
--|#line 1194 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1194")
end

			create yyval33.make_point(yyvs8.item (yyvsp8))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp8 := yyvsp8 -1
	if yyvsp33 >= yyvsc33 or yyvs33 = Void or yyspecial_routines33 = Void then
		if yyvs33 = Void or yyspecial_routines33 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs33")
			end
			create yyspecial_routines33
			yyvsc33 := yyInitial_yyvs_size
			yyvs33 := yyspecial_routines33.make (yyvsc33)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs33")
			end
			yyvsc33 := yyvsc33 + yyInitial_yyvs_size
			yyvs33 := yyspecial_routines33.resize (yyvs33, yyvsc33)
		end
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 148 then
--|#line 1200 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1200")
end

			if valid_iso8601_duration(yyvs4.item (yyvsp4)) then
				create yyval10.make_from_string(yyvs4.item (yyvsp4))
			else
				abort_with_error (ec_VIDUV, <<yyvs4.item (yyvsp4)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp10 := yyvsp10 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp10 >= yyvsc10 or yyvs10 = Void or yyspecial_routines10 = Void then
		if yyvs10 = Void or yyspecial_routines10 = Void then
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
	yyspecial_routines10.force (yyvs10, yyval10, yyvsp10)
end
when 149 then
--|#line 1210 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1210")
end

			create yyval26.make(0)
			yyval26.extend(yyvs10.item (yyvsp10 - 1))
			yyval26.extend(yyvs10.item (yyvsp10))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp26 := yyvsp26 + 1
	yyvsp10 := yyvsp10 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp26 >= yyvsc26 or yyvs26 = Void or yyspecial_routines26 = Void then
		if yyvs26 = Void or yyspecial_routines26 = Void then
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
	yyspecial_routines26.force (yyvs26, yyval26, yyvsp26)
end
when 150 then
--|#line 1216 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1216")
end

			yyvs26.item (yyvsp26).extend(yyvs10.item (yyvsp10))
			yyval26 := yyvs26.item (yyvsp26)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp10 := yyvsp10 -1
	yyspecial_routines26.force (yyvs26, yyval26, yyvsp26)
end
when 151 then
--|#line 1221 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1221")
end

			create yyval26.make(0)
			yyval26.extend(yyvs10.item (yyvsp10))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp26 := yyvsp26 + 1
	yyvsp10 := yyvsp10 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp26 >= yyvsc26 or yyvs26 = Void or yyspecial_routines26 = Void then
		if yyvs26 = Void or yyspecial_routines26 = Void then
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
	yyspecial_routines26.force (yyvs26, yyval26, yyvsp26)
end
when 152 then
--|#line 1228 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1228")
end

			if yyvs10.item (yyvsp10 - 1) <= yyvs10.item (yyvsp10) then
				create yyval34.make_bounded(yyvs10.item (yyvsp10 - 1), yyvs10.item (yyvsp10), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs10.item (yyvsp10 - 1).out, yyvs10.item (yyvsp10).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp10 := yyvsp10 -2
	if yyvsp34 >= yyvsc34 or yyvs34 = Void or yyspecial_routines34 = Void then
		if yyvs34 = Void or yyspecial_routines34 = Void then
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
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 153 then
--|#line 1236 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1236")
end

			if yyvs10.item (yyvsp10 - 1) <= yyvs10.item (yyvsp10) then
				create yyval34.make_bounded(yyvs10.item (yyvsp10 - 1), yyvs10.item (yyvsp10), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs10.item (yyvsp10 - 1).out, yyvs10.item (yyvsp10).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp10 := yyvsp10 -2
	if yyvsp34 >= yyvsc34 or yyvs34 = Void or yyspecial_routines34 = Void then
		if yyvs34 = Void or yyspecial_routines34 = Void then
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
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 154 then
--|#line 1244 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1244")
end

			if yyvs10.item (yyvsp10 - 1) <= yyvs10.item (yyvsp10) then
				create yyval34.make_bounded(yyvs10.item (yyvsp10 - 1), yyvs10.item (yyvsp10), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs10.item (yyvsp10 - 1).out, yyvs10.item (yyvsp10).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp10 := yyvsp10 -2
	if yyvsp34 >= yyvsc34 or yyvs34 = Void or yyspecial_routines34 = Void then
		if yyvs34 = Void or yyspecial_routines34 = Void then
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
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 155 then
--|#line 1252 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1252")
end

			if yyvs10.item (yyvsp10 - 1) <= yyvs10.item (yyvsp10) then
				create yyval34.make_bounded(yyvs10.item (yyvsp10 - 1), yyvs10.item (yyvsp10), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs10.item (yyvsp10 - 1).out, yyvs10.item (yyvsp10).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp10 := yyvsp10 -2
	if yyvsp34 >= yyvsc34 or yyvs34 = Void or yyspecial_routines34 = Void then
		if yyvs34 = Void or yyspecial_routines34 = Void then
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
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 156 then
--|#line 1260 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1260")
end

			create yyval34.make_lower_unbounded(yyvs10.item (yyvsp10), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp10 := yyvsp10 -1
	if yyvsp34 >= yyvsc34 or yyvs34 = Void or yyspecial_routines34 = Void then
		if yyvs34 = Void or yyspecial_routines34 = Void then
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
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 157 then
--|#line 1264 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1264")
end

			create yyval34.make_lower_unbounded(yyvs10.item (yyvsp10), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp10 := yyvsp10 -1
	if yyvsp34 >= yyvsc34 or yyvs34 = Void or yyspecial_routines34 = Void then
		if yyvs34 = Void or yyspecial_routines34 = Void then
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
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 158 then
--|#line 1268 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1268")
end

			create yyval34.make_upper_unbounded(yyvs10.item (yyvsp10), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp10 := yyvsp10 -1
	if yyvsp34 >= yyvsc34 or yyvs34 = Void or yyspecial_routines34 = Void then
		if yyvs34 = Void or yyspecial_routines34 = Void then
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
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 159 then
--|#line 1272 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1272")
end

			create yyval34.make_upper_unbounded(yyvs10.item (yyvsp10), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp10 := yyvsp10 -1
	if yyvsp34 >= yyvsc34 or yyvs34 = Void or yyspecial_routines34 = Void then
		if yyvs34 = Void or yyspecial_routines34 = Void then
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
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 160 then
--|#line 1276 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1276")
end

			create yyval34.make_point(yyvs10.item (yyvsp10))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp10 := yyvsp10 -1
	if yyvsp34 >= yyvsc34 or yyvs34 = Void or yyspecial_routines34 = Void then
		if yyvs34 = Void or yyspecial_routines34 = Void then
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
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 161 then
--|#line 1282 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1282")
end

			create yyval11.make_from_string (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp11 := yyvsp11 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp11 >= yyvsc11 or yyvs11 = Void or yyspecial_routines11 = Void then
		if yyvs11 = Void or yyspecial_routines11 = Void then
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
	yyspecial_routines11.force (yyvs11, yyval11, yyvsp11)
end
when 162 then
--|#line 1286 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1286")
end

			abort_with_error (ec_STCV, <<yyvs4.item (yyvsp4)>>)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp11 := yyvsp11 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp11 >= yyvsc11 or yyvs11 = Void or yyspecial_routines11 = Void then
		if yyvs11 = Void or yyspecial_routines11 = Void then
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
	yyspecial_routines11.force (yyvs11, yyval11, yyvsp11)
end
when 163 then
--|#line 1292 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1292")
end

			create yyval27.make(0)
			yyval27.extend(yyvs11.item (yyvsp11 - 1))
			yyval27.extend(yyvs11.item (yyvsp11))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp27 := yyvsp27 + 1
	yyvsp11 := yyvsp11 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp27 >= yyvsc27 or yyvs27 = Void or yyspecial_routines27 = Void then
		if yyvs27 = Void or yyspecial_routines27 = Void then
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
	yyspecial_routines27.force (yyvs27, yyval27, yyvsp27)
end
when 164 then
--|#line 1298 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1298")
end

			yyvs27.item (yyvsp27).extend(yyvs11.item (yyvsp11))
			yyval27 := yyvs27.item (yyvsp27)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp11 := yyvsp11 -1
	yyspecial_routines27.force (yyvs27, yyval27, yyvsp27)
end
when 165 then
--|#line 1303 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1303")
end

			create yyval27.make(0)
			yyval27.extend(yyvs11.item (yyvsp11))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp27 := yyvsp27 + 1
	yyvsp11 := yyvsp11 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp27 >= yyvsc27 or yyvs27 = Void or yyspecial_routines27 = Void then
		if yyvs27 = Void or yyspecial_routines27 = Void then
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
	yyspecial_routines27.force (yyvs27, yyval27, yyvsp27)
end
when 166 then
--|#line 1310 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1310")
end

			create yyval12.make_from_string(yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp12 := yyvsp12 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp12 >= yyvsc12 or yyvs12 = Void or yyspecial_routines12 = Void then
		if yyvs12 = Void or yyspecial_routines12 = Void then
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
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 167 then
--|#line 1320 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1320")
end

debug("dADL_parse")
	io.put_string(indent + "object_reference_block; attr_nodes(<<" + 
			attr_nodes.item.im_attr_name + ">>).item.put_child(<<" + 
			yyvs14.item (yyvsp14).as_string + ">>)%N")
end
			if not attr_nodes.item.has_child_with_id(yyvs14.item (yyvsp14).id) then
				attr_nodes.item.put_child(yyvs14.item (yyvsp14))
				yyval14 := yyvs14.item (yyvsp14)
			else
				abort_with_error (ec_VOKU, <<yyvs14.item (yyvsp14).id, attr_nodes.item.im_attr_name >>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 168 then
--|#line 1336 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1336")
end

			if obj_key /= Void then
				create {DT_OBJECT_REFERENCE} yyval14.make_identified(yyvs15.item (yyvsp15), obj_key)
				obj_key := Void
			else
				create {DT_OBJECT_REFERENCE} yyval14.make_anonymous(yyvs15.item (yyvsp15))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp15 := yyvsp15 -1
	if yyvsp14 >= yyvsc14 or yyvs14 = Void or yyspecial_routines14 = Void then
		if yyvs14 = Void or yyspecial_routines14 = Void then
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
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 169 then
--|#line 1345 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1345")
end

			if obj_key /= Void then
				create {DT_OBJECT_REFERENCE_LIST} yyval14.make_identified(yyvs17.item (yyvsp17), obj_key)
				obj_key := Void
			else
				create {DT_OBJECT_REFERENCE_LIST} yyval14.make_anonymous(yyvs17.item (yyvsp17))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp17 := yyvsp17 -1
	if yyvsp14 >= yyvsc14 or yyvs14 = Void or yyspecial_routines14 = Void then
		if yyvs14 = Void or yyspecial_routines14 = Void then
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
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 170 then
--|#line 1357 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1357")
end

			create yyval17.make(0)
			yyval17.extend(yyvs15.item (yyvsp15 - 1))
			yyval17.extend(yyvs15.item (yyvsp15))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp17 := yyvsp17 + 1
	yyvsp15 := yyvsp15 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp17 >= yyvsc17 or yyvs17 = Void or yyspecial_routines17 = Void then
		if yyvs17 = Void or yyspecial_routines17 = Void then
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
	yyspecial_routines17.force (yyvs17, yyval17, yyvsp17)
end
when 171 then
--|#line 1363 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1363")
end

			yyvs17.item (yyvsp17).extend(yyvs15.item (yyvsp15))
			yyval17 := yyvs17.item (yyvsp17)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp15 := yyvsp15 -1
	yyspecial_routines17.force (yyvs17, yyval17, yyvsp17)
end
when 172 then
--|#line 1368 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1368")
end

			create yyval17.make(0)
			yyval17.extend(yyvs15.item (yyvsp15))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp17 := yyvsp17 + 1
	yyvsp15 := yyvsp15 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp17 >= yyvsc17 or yyvs17 = Void or yyspecial_routines17 = Void then
		if yyvs17 = Void or yyspecial_routines17 = Void then
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
	yyspecial_routines17.force (yyvs17, yyval17, yyvsp17)
end
when 173 then
--|#line 1380 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1380")
end

			create yyval15.make_root
debug("OG_PATH_parse")
	io.put_string("....absolute_path (root); %N")
end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp15 := yyvsp15 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp15 >= yyvsc15 or yyvs15 = Void or yyspecial_routines15 = Void then
		if yyvs15 = Void or yyspecial_routines15 = Void then
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
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 174 then
--|#line 1387 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1387")
end

			yyval15 := yyvs15.item (yyvsp15)
			yyval15.set_absolute
debug("OG_PATH_parse")
	io.put_string("....absolute_path; %N")
end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 175 then
--|#line 1395 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1395")
end

			yyval15 := yyvs15.item (yyvsp15 - 1)
			yyval15.append_path(yyvs15.item (yyvsp15))
debug("OG_PATH_parse")
	io.put_string("....absolute_path (appended relative path); %N")
end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp15 := yyvsp15 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 176 then
--|#line 1405 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1405")
end

			create yyval15.make_relative(yyvs16.item (yyvsp16))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp15 := yyvsp15 + 1
	yyvsp16 := yyvsp16 -1
	if yyvsp15 >= yyvsc15 or yyvs15 = Void or yyspecial_routines15 = Void then
		if yyvs15 = Void or yyspecial_routines15 = Void then
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
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 177 then
--|#line 1409 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1409")
end

			yyval15 := yyvs15.item (yyvsp15)
			yyval15.append_segment(yyvs16.item (yyvsp16))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp16 := yyvsp16 -1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 178 then
--|#line 1416 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1416")
end

			create yyval16.make_with_object_id(yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4))
debug("OG_PATH_parse")
	io.put_string("...path_segment: " + yyvs4.item (yyvsp4 - 1) + "[" + yyvs4.item (yyvsp4) + "]%N")
end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp16 := yyvsp16 + 1
	yyvsp4 := yyvsp4 -2
	yyvsp1 := yyvsp1 -2
	if yyvsp16 >= yyvsc16 or yyvs16 = Void or yyspecial_routines16 = Void then
		if yyvs16 = Void or yyspecial_routines16 = Void then
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
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 179 then
--|#line 1423 "dadl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'dadl_validator.y' at line 1423")
end

			create yyval16.make(yyvs4.item (yyvsp4))
debug("OG_PATH_parse")
	io.put_string("...path_segment: " + yyvs4.item (yyvsp4) + "%N")
end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp16 >= yyvsc16 or yyvs16 = Void or yyspecial_routines16 = Void then
		if yyvs16 = Void or yyspecial_routines16 = Void then
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
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
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
			when 323 then
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
			   42,   43,    2,   45,   44,   46,    2,   47,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,   39,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,   40,    2,   41,    2,    2,    2,    2,    2,    2,

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
			   35,   36,   37,   38, yyDummy>>)
		end

	yyr1_template: SPECIAL [INTEGER]
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,   91,   91,   91,   92,   92,   92,   93,   94,   94,
			   95,   95,   95,   95,   63,   63,   61,   61,   62,   96,
			   97,   97,   98,   99,   59,   59,   60,  101,   65,   65,
			   64,   67,   67,   67,   67,   67,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   90,   90,   90,   90,   90,
			   90,   48,   48,   48,   48,  102,   73,   73,   73,   73,
			   49,   49,   49,   74,   74,   74,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   50,   50,   50,   75,   75,
			   75,   85,   85,   85,   85,   85,   85,   85,   85,   85,

			   51,   51,   77,   77,   77,   52,   76,   76,   76,   53,
			   78,   78,   78,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   55,   79,   79,   79,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   54,   80,   80,   80,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   56,   81,
			   81,   81,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   57,   57,   82,   82,   82,   58,   66,   68,   68,
			   72,   72,   72,   69,   69,   69,   70,   70,   71,   71, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    4,    4,    4,    1,    4,   13,   13,
			   13,   13,   13,    1,    1,    1,    1,    1,    4,    4,
			    1,   13,   13,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    4,   13,   14,   14,   14,
			    1,    1,    1,    1,    1,    5,    4,    4,    4,    4,
			    4,    4,    3,    2,    2,    3,    6,    5,    7,    8,
			    9,   10,   12,    1,    1,    1,    1,    1,    1,    1,
			    4,    1,    1,    4,    4,    2,    3,    6,    5,    7,
			    8,    9,   10,   11,   14,   14,   15,   17,   18,   19,
			   20,   21,   22,   23,   24,   25,   26,   27,   28,   29,

			   30,   31,   32,   33,   34,   35,    1,    1,   14,    3,
			    2,    3,    2,    1,    1,    4,   15,   16,    1,    1,
			    1,    1,    2,    3,    7,    8,    9,   10,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    2,    3,    7,    8,    9,
			   10,    2,    3,    7,    8,    9,   10,    2,    3,    7,
			    8,    9,   10,    2,    3,    7,    8,    9,   10,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    4,    1,    1,    1,    2,    1,    1,    1,

			    3,    1,    6,    1,    5,    1,    7,    1,    8,    1,
			    9,    1,   10,    1,   11,   15,    1,   15,   15,    1,
			    4,    2,    3,    5,    6,    7,    9,    8,   10,   11,
			    4,   16,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    2,    1,    3,    1,    7,    1,    8,
			    1,    9,    1,   10,    1,    1,    2,    1,    3,    1,
			    7,    1,    8,    1,    9,    1,   10,    2,    1,    3,
			    1,    7,    1,    8,    1,    9,    1,   10,    1,    2,

			    1,    3,    1,    7,    1,    8,    1,    9,    1,   10,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER]
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    2,    3,    4,    4,    4,    4,    4,
			    4,    4,    4,    4,    4,    4,    4,    4,    5,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    4,    4,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER]
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    0,    0,   27,    0,   64,   63,    3,    0,   14,   24,
			   15,   16,    2,    1,    4,    0,    0,    0,    0,    0,
			    9,   25,   17,    0,    5,    0,    0,    0,   20,    0,
			    0,   62,   61,    6,   27,    0,   10,   28,   11,   12,
			    7,    0,    0,  101,  100,  105,  166,  148,  135,  122,
			  109,   65,   85,   70,   37,   38,   39,   40,   41,   43,
			   42,   44,   45,    0,   36,   18,   21,    0,   26,  173,
			  162,    0,   13,  161,   65,   37,   38,   39,   40,   41,
			   43,   42,   44,   34,    0,    0,  168,  169,   46,   47,
			   48,   50,   49,   51,   52,   53,   54,   35,   32,   55,

			   56,   58,   57,   59,   60,   33,   31,   27,   29,   87,
			   72,   86,   71,   23,   22,  179,  174,  176,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,   30,  167,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   84,
			    0,   99,    0,  121,    0,  147,    0,  134,    0,  160,
			    0,   69,   66,    0,    0,   75,   73,    0,    0,   90,

			   88,  104,  102,  108,  106,  112,  110,  138,  136,  125,
			  123,  151,  149,  165,  163,  175,  172,  170,  171,   68,
			   67,   74,   89,  107,  103,  111,  124,  137,  150,  164,
			    0,  177,   83,   98,  120,  146,  133,  159,   81,   96,
			  118,  144,  131,  157,   82,    0,   97,    0,  119,    0,
			  145,    0,  132,    0,  158,    0,   80,   95,  117,  143,
			  130,  156,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  178,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,   76,    0,
			   91,    0,  113,    0,  139,    0,  126,    0,  152,    0,

			   77,    0,   92,    0,  114,    0,  140,    0,  127,    0,
			  153,   78,   93,  115,  141,  128,  154,   79,   94,  116,
			  142,  129,  155,    0,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			   35,   75,   76,   77,   78,   79,   80,   81,   82,   83,
			   62,    8,    9,   10,   11,   36,   37,   38,   39,   84,
			   85,   86,  116,  117,   87,   88,   89,   90,   91,   92,
			   93,   94,   95,   96,   97,   98,   99,  100,  101,  102,
			  103,  104,  105,  323,   13,   14,   15,   40,   16,   27,
			   28,   29,  106,   17,   64, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			  183,  296,  353,  132, -32768, -32768, -32768,  351, -32768, -32768,
			 -32768, -32768, -32768,   -2, -32768,  354,  350,  348,  349,  345,
			 -32768, -32768, -32768,  348, -32768,   -4,  272,  103, -32768,  347,
			  134, -32768, -32768, -32768,   14,  343, -32768, -32768, -32768, -32768,
			 -32768,  292,  274, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768,  346, -32768, -32768, -32768,   -4, -32768,  324,
			 -32768,  208, -32768, -32768,  342,  341,  340,  339,  338,  337,
			  336,  335,  334,  333,  332,  331,  247,  330,  329,  328,
			  327,  325,  323,  322,  321,  320,  319,  317, -32768, -32768,

			 -32768, -32768, -32768, -32768, -32768, -32768, -32768,  168, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768,  316,  265, -32768,   75,   75,
			   75,   75,  263,  248,  246,  244,  242,  233,  198,   25,
			   23,  200,  187,   67,   54,   -3,  175,  124, -32768, -32768,
			  324,   33,  290,  192,   27,  105,  318,   39,  277,  155,
			  245,  137,    4,  326,  324,  315,  314,  313,  310,  308,
			  307,  305,  304,  303,  302,  301,  300,  220,  219,  169,
			   93,  -11,  -12,  299,  298,  297,  295,  294,  291, -32768,
			   18, -32768,  113, -32768,   82, -32768,  152, -32768,  146, -32768,
			  145, -32768, -32768,  312,  311, -32768, -32768,  309,  306, -32768,

			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768,  265, -32768,  264,  264, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			  231, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768,    6, -32768,   29, -32768,   53,
			 -32768,  133, -32768,  138, -32768,  140, -32768, -32768, -32768, -32768,
			 -32768, -32768,   27,  284,  105,  283,  277,  282,  245,  281,
			  155,  280,  137,  279, -32768,   27,  278,  105,  268,  277,
			  235,  245,  226,  155,  224,  137,  222,  218, -32768,  211,
			 -32768,  209, -32768,  207, -32768,  205, -32768,  201, -32768,  199,

			 -32768,  178, -32768,  176, -32768,  157, -32768,  120, -32768,   97,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768,  114,   89, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			  357,   17,   10,  -23,  -20,  -14,  -18,  -22,  -26,   70,
			 -32768, -32768,   48, -32768,    9,  344,  360, -32768, -32768, -32768,
			 -32768,  156,  203,  188, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768,  359,  186, -32768,  254, -32768, -32768,
			  364, -32768,  363, -32768, -32768, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   61,    5,    4,   56,   60,    3,   57,   49,   59,   53,
			  255,  253,   58,  254,  252,   34,   22,   53,   52,   73,
			  209,   53,   74,   50,   49,   48,   47,   52,   53,   73,
			   53,   46,   45,   52,   72,  275,   55,   23,    1,   71,
			   70,   44,   43,   54,   22,  127,  199,  262,  195,  126,
			   70,  194,  193,  125,  -19,   21,  216,  124,  277,   42,
			   41,   69,   50,  194,  193,   48,   44,   43,  198,  197,
			  194,  193,  194,  193,  198,  197,   50,  207,   53,   52,
			   69,  123,  279,   21,   50,   49,   48,   47,  122,  325,
			  205,   50,  160,  166,  172,  178,  159,  165,  171,  177,

			  158,  164,  170,  176,  157,  163,  169,  175,  202,   52,
			  212,  266,  204,  210,  324,  251,  208,   52,  250,  206,
			   42,   41,  322,   65,  224,  228,  223,  226,  156,  162,
			  168,  174,  227,   20,  225,  155,  161,  167,  173,   73,
			  200,    3,  264,   26,   48,  321,  196,  213,   49,   47,
			  198,  197,   47,   -8,   68,  222,   49,   47,  198,  197,
			   70,  221,  281,   48,  273,   49,  271,  283,  269,  285,
			  267,   53,   52,   23,  272,  270,   74,   50,   49,   48,
			   47,  268,  320,   73,    6,   46,   45,   47,    5,    4,
			    3,  249,  265,   71,  248,   44,   43,  263,  211,   24,

			  220,  319,    2,  318,   70,   45,  192,  214,  -19,   33,
			  203,   53,   52,   42,   41,  219,   24,   50,   49,   48,
			   47,  191,  229,  201,  317,    1,  316,   44,   43,  286,
			  315,  284,  314,  282,  313,  280,  312,  121,  120,  119,
			  118,  247,  245,  311,  246,  244,  297,  310,  295,  308,
			  293,  306,  291,   42,   41,  190,   48,  278,  189,  309,
			  304,  307,  276,  305,  188,  303,  186,  187,  184,  185,
			  182,  183,  274,  181,  289,   53,   52,  112,  111,  287,
			   51,   50,   49,   48,   47,  180,   50,  301,  179,   46,
			   45,  141,  299,  302,  140,  110,  109,  217,  218,   44,

			   43,   19,   18,  300,  298,  296,  294,  292,  290,  288,
			  111,  140,  154,  109,  112,  110,  261,   42,   41,  260,
			  259,  114,  258,  257,  256,  243,  242,  241,  240,  239,
			  238,  115,  237,  236,  230,  235,   45,   69,  234,  233,
			  232,    0,  231,  215,   12,    0,    0,    0,    0,    0,
			    0,  139,  138,    0,    0,    3,  153,    7,    0,    0,
			    0,  152,  107,  151,  150,  149,  148,  147,   67,  146,
			    2,  145,  144,  143,  142,   25,   30,  137,  136,  135,
			  134,  133,  132,  131,  130,  129,  128,  113,   32,   63,
			   26,   66,   31,  -19,    0,  108, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			   26,    5,    6,   26,   26,    7,   26,   10,   26,    3,
			   22,   22,   26,   25,   25,   19,    7,    3,    4,   15,
			   23,    3,    8,    9,   10,   11,   12,    4,    3,   15,
			    3,   17,   18,    4,   20,   29,   26,   39,   42,   25,
			   36,   27,   28,   26,   35,   71,   23,   29,   23,   71,
			   36,   45,   46,   71,   40,    7,   23,   71,   29,   45,
			   46,   47,    9,   45,   46,   11,   27,   28,   45,   46,
			   45,   46,   45,   46,   45,   46,    9,   23,    3,    4,
			   47,   71,   29,   35,    9,   10,   11,   12,   71,    0,
			   23,    9,  118,  119,  120,  121,  118,  119,  120,  121,

			  118,  119,  120,  121,  118,  119,  120,  121,  131,    4,
			  136,   29,  132,  135,    0,   22,  134,    4,   25,  133,
			   45,   46,   25,   20,  147,  151,  146,  149,  118,  119,
			  120,  121,  150,    1,  148,  118,  119,  120,  121,   15,
			  130,    7,   29,   40,   11,   25,  129,   23,   10,   12,
			   45,   46,   12,   21,   20,  145,   10,   12,   45,   46,
			   36,  144,   29,   11,  190,   10,  188,   29,  186,   29,
			  184,    3,    4,   39,   29,   29,    8,    9,   10,   11,
			   12,   29,   25,   15,    1,   17,   18,   12,    5,    6,
			    7,   22,  182,   25,   25,   27,   28,  180,   23,   13,

			    8,   25,   19,   25,   36,   18,    8,  137,   40,   23,
			   23,    3,    4,   45,   46,   23,   30,    9,   10,   11,
			   12,   23,  152,   23,   25,   42,   25,   27,   28,  255,
			   25,  253,   25,  251,   25,  249,   25,   29,   30,   31,
			   32,   22,   22,   25,   25,   25,  272,   25,  270,   25,
			  268,   25,  266,   45,   46,   22,   11,  247,   25,  285,
			   25,  283,  245,  281,   22,  279,   22,   25,   22,   25,
			   22,   25,   41,   25,  264,    3,    4,    3,    4,  262,
			    8,    9,   10,   11,   12,   22,    9,  277,   25,   17,
			   18,   44,  275,   25,   47,    3,    4,  141,  142,   27,

			   28,    5,    6,   25,   25,   25,   25,   25,   25,   25,
			    4,   47,   47,    4,    3,    3,   25,   45,   46,   25,
			   25,   67,   25,   25,   25,   25,   25,   25,   25,   25,
			   25,    7,   25,   25,    8,   25,   18,   47,   25,   25,
			   25,   -1,  154,  140,    0,   -1,   -1,   -1,   -1,   -1,
			   -1,   20,   20,   -1,   -1,    7,   40,    0,   -1,   -1,
			   -1,   44,   19,   44,   44,   44,   44,   44,   21,   44,
			   19,   44,   44,   44,   44,   21,   17,   44,   44,   44,
			   44,   44,   44,   44,   44,   44,   44,   41,   43,   26,
			   40,   27,   43,   40,   -1,   35, yyDummy>>)
		end

feature {NONE} -- Semantic value stacks

	yyvs1: SPECIAL [detachable ANY]
			-- Stack for semantic values of type detachable ANY

	yyvsc1: INTEGER
			-- Capacity of semantic value stack `yyvs1'

	yyvsp1: INTEGER
			-- Top of semantic value stack `yyvs1'

	yyspecial_routines1: detachable KL_SPECIAL_ROUTINES [detachable ANY] note option: stable attribute end
			-- Routines that ought to be in SPECIAL [detachable ANY]

	yyvs2: SPECIAL [INTEGER]
			-- Stack for semantic values of type INTEGER

	yyvsc2: INTEGER
			-- Capacity of semantic value stack `yyvs2'

	yyvsp2: INTEGER
			-- Top of semantic value stack `yyvs2'

	yyspecial_routines2: detachable KL_SPECIAL_ROUTINES [INTEGER] note option: stable attribute end
			-- Routines that ought to be in SPECIAL [INTEGER]

	yyvs3: SPECIAL [REAL]
			-- Stack for semantic values of type REAL

	yyvsc3: INTEGER
			-- Capacity of semantic value stack `yyvs3'

	yyvsp3: INTEGER
			-- Top of semantic value stack `yyvs3'

	yyspecial_routines3: detachable KL_SPECIAL_ROUTINES [REAL] note option: stable attribute end
			-- Routines that ought to be in SPECIAL [REAL]

	yyvs4: SPECIAL [STRING]
			-- Stack for semantic values of type STRING

	yyvsc4: INTEGER
			-- Capacity of semantic value stack `yyvs4'

	yyvsp4: INTEGER
			-- Top of semantic value stack `yyvs4'

	yyspecial_routines4: detachable KL_SPECIAL_ROUTINES [STRING] note option: stable attribute end
			-- Routines that ought to be in SPECIAL [STRING]

	yyvs5: SPECIAL [CHARACTER]
			-- Stack for semantic values of type CHARACTER

	yyvsc5: INTEGER
			-- Capacity of semantic value stack `yyvs5'

	yyvsp5: INTEGER
			-- Top of semantic value stack `yyvs5'

	yyspecial_routines5: detachable KL_SPECIAL_ROUTINES [CHARACTER] note option: stable attribute end
			-- Routines that ought to be in SPECIAL [CHARACTER]

	yyvs6: SPECIAL [BOOLEAN]
			-- Stack for semantic values of type BOOLEAN

	yyvsc6: INTEGER
			-- Capacity of semantic value stack `yyvs6'

	yyvsp6: INTEGER
			-- Top of semantic value stack `yyvs6'

	yyspecial_routines6: detachable KL_SPECIAL_ROUTINES [BOOLEAN] note option: stable attribute end
			-- Routines that ought to be in SPECIAL [BOOLEAN]

	yyvs7: SPECIAL [ISO8601_DATE]
			-- Stack for semantic values of type ISO8601_DATE

	yyvsc7: INTEGER
			-- Capacity of semantic value stack `yyvs7'

	yyvsp7: INTEGER
			-- Top of semantic value stack `yyvs7'

	yyspecial_routines7: detachable KL_SPECIAL_ROUTINES [ISO8601_DATE] note option: stable attribute end
			-- Routines that ought to be in SPECIAL [ISO8601_DATE]

	yyvs8: SPECIAL [ISO8601_DATE_TIME]
			-- Stack for semantic values of type ISO8601_DATE_TIME

	yyvsc8: INTEGER
			-- Capacity of semantic value stack `yyvs8'

	yyvsp8: INTEGER
			-- Top of semantic value stack `yyvs8'

	yyspecial_routines8: detachable KL_SPECIAL_ROUTINES [ISO8601_DATE_TIME] note option: stable attribute end
			-- Routines that ought to be in SPECIAL [ISO8601_DATE_TIME]

	yyvs9: SPECIAL [ISO8601_TIME]
			-- Stack for semantic values of type ISO8601_TIME

	yyvsc9: INTEGER
			-- Capacity of semantic value stack `yyvs9'

	yyvsp9: INTEGER
			-- Top of semantic value stack `yyvs9'

	yyspecial_routines9: detachable KL_SPECIAL_ROUTINES [ISO8601_TIME] note option: stable attribute end
			-- Routines that ought to be in SPECIAL [ISO8601_TIME]

	yyvs10: SPECIAL [ISO8601_DURATION]
			-- Stack for semantic values of type ISO8601_DURATION

	yyvsc10: INTEGER
			-- Capacity of semantic value stack `yyvs10'

	yyvsp10: INTEGER
			-- Top of semantic value stack `yyvs10'

	yyspecial_routines10: detachable KL_SPECIAL_ROUTINES [ISO8601_DURATION] note option: stable attribute end
			-- Routines that ought to be in SPECIAL [ISO8601_DURATION]

	yyvs11: SPECIAL [TERMINOLOGY_CODE]
			-- Stack for semantic values of type TERMINOLOGY_CODE

	yyvsc11: INTEGER
			-- Capacity of semantic value stack `yyvs11'

	yyvsp11: INTEGER
			-- Top of semantic value stack `yyvs11'

	yyspecial_routines11: detachable KL_SPECIAL_ROUTINES [TERMINOLOGY_CODE] note option: stable attribute end
			-- Routines that ought to be in SPECIAL [TERMINOLOGY_CODE]

	yyvs12: SPECIAL [URI]
			-- Stack for semantic values of type URI

	yyvsc12: INTEGER
			-- Capacity of semantic value stack `yyvs12'

	yyvsp12: INTEGER
			-- Top of semantic value stack `yyvs12'

	yyspecial_routines12: detachable KL_SPECIAL_ROUTINES [URI] note option: stable attribute end
			-- Routines that ought to be in SPECIAL [URI]

	yyvs13: SPECIAL [DT_COMPLEX_OBJECT_NODE]
			-- Stack for semantic values of type DT_COMPLEX_OBJECT_NODE

	yyvsc13: INTEGER
			-- Capacity of semantic value stack `yyvs13'

	yyvsp13: INTEGER
			-- Top of semantic value stack `yyvs13'

	yyspecial_routines13: detachable KL_SPECIAL_ROUTINES [DT_COMPLEX_OBJECT_NODE] note option: stable attribute end
			-- Routines that ought to be in SPECIAL [DT_COMPLEX_OBJECT_NODE]

	yyvs14: SPECIAL [DT_OBJECT_LEAF]
			-- Stack for semantic values of type DT_OBJECT_LEAF

	yyvsc14: INTEGER
			-- Capacity of semantic value stack `yyvs14'

	yyvsp14: INTEGER
			-- Top of semantic value stack `yyvs14'

	yyspecial_routines14: detachable KL_SPECIAL_ROUTINES [DT_OBJECT_LEAF] note option: stable attribute end
			-- Routines that ought to be in SPECIAL [DT_OBJECT_LEAF]

	yyvs15: SPECIAL [OG_PATH]
			-- Stack for semantic values of type OG_PATH

	yyvsc15: INTEGER
			-- Capacity of semantic value stack `yyvs15'

	yyvsp15: INTEGER
			-- Top of semantic value stack `yyvs15'

	yyspecial_routines15: detachable KL_SPECIAL_ROUTINES [OG_PATH] note option: stable attribute end
			-- Routines that ought to be in SPECIAL [OG_PATH]

	yyvs16: SPECIAL [OG_PATH_ITEM]
			-- Stack for semantic values of type OG_PATH_ITEM

	yyvsc16: INTEGER
			-- Capacity of semantic value stack `yyvs16'

	yyvsp16: INTEGER
			-- Top of semantic value stack `yyvs16'

	yyspecial_routines16: detachable KL_SPECIAL_ROUTINES [OG_PATH_ITEM] note option: stable attribute end
			-- Routines that ought to be in SPECIAL [OG_PATH_ITEM]

	yyvs17: SPECIAL [ARRAYED_LIST [OG_PATH]]
			-- Stack for semantic values of type ARRAYED_LIST [OG_PATH]

	yyvsc17: INTEGER
			-- Capacity of semantic value stack `yyvs17'

	yyvsp17: INTEGER
			-- Top of semantic value stack `yyvs17'

	yyspecial_routines17: detachable KL_SPECIAL_ROUTINES [ARRAYED_LIST [OG_PATH]] note option: stable attribute end
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [OG_PATH]]

	yyvs18: SPECIAL [ARRAYED_LIST [STRING]]
			-- Stack for semantic values of type ARRAYED_LIST [STRING]

	yyvsc18: INTEGER
			-- Capacity of semantic value stack `yyvs18'

	yyvsp18: INTEGER
			-- Top of semantic value stack `yyvs18'

	yyspecial_routines18: detachable KL_SPECIAL_ROUTINES [ARRAYED_LIST [STRING]] note option: stable attribute end
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [STRING]]

	yyvs19: SPECIAL [ARRAYED_LIST [INTEGER]]
			-- Stack for semantic values of type ARRAYED_LIST [INTEGER]

	yyvsc19: INTEGER
			-- Capacity of semantic value stack `yyvs19'

	yyvsp19: INTEGER
			-- Top of semantic value stack `yyvs19'

	yyspecial_routines19: detachable KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTEGER]] note option: stable attribute end
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTEGER]]

	yyvs20: SPECIAL [ARRAYED_LIST [REAL]]
			-- Stack for semantic values of type ARRAYED_LIST [REAL]

	yyvsc20: INTEGER
			-- Capacity of semantic value stack `yyvs20'

	yyvsp20: INTEGER
			-- Top of semantic value stack `yyvs20'

	yyspecial_routines20: detachable KL_SPECIAL_ROUTINES [ARRAYED_LIST [REAL]] note option: stable attribute end
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [REAL]]

	yyvs21: SPECIAL [ARRAYED_LIST [CHARACTER]]
			-- Stack for semantic values of type ARRAYED_LIST [CHARACTER]

	yyvsc21: INTEGER
			-- Capacity of semantic value stack `yyvs21'

	yyvsp21: INTEGER
			-- Top of semantic value stack `yyvs21'

	yyspecial_routines21: detachable KL_SPECIAL_ROUTINES [ARRAYED_LIST [CHARACTER]] note option: stable attribute end
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [CHARACTER]]

	yyvs22: SPECIAL [ARRAYED_LIST [BOOLEAN]]
			-- Stack for semantic values of type ARRAYED_LIST [BOOLEAN]

	yyvsc22: INTEGER
			-- Capacity of semantic value stack `yyvs22'

	yyvsp22: INTEGER
			-- Top of semantic value stack `yyvs22'

	yyspecial_routines22: detachable KL_SPECIAL_ROUTINES [ARRAYED_LIST [BOOLEAN]] note option: stable attribute end
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [BOOLEAN]]

	yyvs23: SPECIAL [ARRAYED_LIST [ISO8601_DATE]]
			-- Stack for semantic values of type ARRAYED_LIST [ISO8601_DATE]

	yyvsc23: INTEGER
			-- Capacity of semantic value stack `yyvs23'

	yyvsp23: INTEGER
			-- Top of semantic value stack `yyvs23'

	yyspecial_routines23: detachable KL_SPECIAL_ROUTINES [ARRAYED_LIST [ISO8601_DATE]] note option: stable attribute end
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ISO8601_DATE]]

	yyvs24: SPECIAL [ARRAYED_LIST [ISO8601_TIME]]
			-- Stack for semantic values of type ARRAYED_LIST [ISO8601_TIME]

	yyvsc24: INTEGER
			-- Capacity of semantic value stack `yyvs24'

	yyvsp24: INTEGER
			-- Top of semantic value stack `yyvs24'

	yyspecial_routines24: detachable KL_SPECIAL_ROUTINES [ARRAYED_LIST [ISO8601_TIME]] note option: stable attribute end
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ISO8601_TIME]]

	yyvs25: SPECIAL [ARRAYED_LIST [ISO8601_DATE_TIME]]
			-- Stack for semantic values of type ARRAYED_LIST [ISO8601_DATE_TIME]

	yyvsc25: INTEGER
			-- Capacity of semantic value stack `yyvs25'

	yyvsp25: INTEGER
			-- Top of semantic value stack `yyvs25'

	yyspecial_routines25: detachable KL_SPECIAL_ROUTINES [ARRAYED_LIST [ISO8601_DATE_TIME]] note option: stable attribute end
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ISO8601_DATE_TIME]]

	yyvs26: SPECIAL [ARRAYED_LIST [ISO8601_DURATION]]
			-- Stack for semantic values of type ARRAYED_LIST [ISO8601_DURATION]

	yyvsc26: INTEGER
			-- Capacity of semantic value stack `yyvs26'

	yyvsp26: INTEGER
			-- Top of semantic value stack `yyvs26'

	yyspecial_routines26: detachable KL_SPECIAL_ROUTINES [ARRAYED_LIST [ISO8601_DURATION]] note option: stable attribute end
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ISO8601_DURATION]]

	yyvs27: SPECIAL [ARRAYED_LIST [TERMINOLOGY_CODE]]
			-- Stack for semantic values of type ARRAYED_LIST [TERMINOLOGY_CODE]

	yyvsc27: INTEGER
			-- Capacity of semantic value stack `yyvs27'

	yyvsp27: INTEGER
			-- Top of semantic value stack `yyvs27'

	yyspecial_routines27: detachable KL_SPECIAL_ROUTINES [ARRAYED_LIST [TERMINOLOGY_CODE]] note option: stable attribute end
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [TERMINOLOGY_CODE]]

	yyvs28: SPECIAL [ARRAYED_LIST [ANY]]
			-- Stack for semantic values of type ARRAYED_LIST [ANY]

	yyvsc28: INTEGER
			-- Capacity of semantic value stack `yyvs28'

	yyvsp28: INTEGER
			-- Top of semantic value stack `yyvs28'

	yyspecial_routines28: detachable KL_SPECIAL_ROUTINES [ARRAYED_LIST [ANY]] note option: stable attribute end
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ANY]]

	yyvs29: SPECIAL [INTERVAL [INTEGER]]
			-- Stack for semantic values of type INTERVAL [INTEGER]

	yyvsc29: INTEGER
			-- Capacity of semantic value stack `yyvs29'

	yyvsp29: INTEGER
			-- Top of semantic value stack `yyvs29'

	yyspecial_routines29: detachable KL_SPECIAL_ROUTINES [INTERVAL [INTEGER]] note option: stable attribute end
			-- Routines that ought to be in SPECIAL [INTERVAL [INTEGER]]

	yyvs30: SPECIAL [INTERVAL [REAL]]
			-- Stack for semantic values of type INTERVAL [REAL]

	yyvsc30: INTEGER
			-- Capacity of semantic value stack `yyvs30'

	yyvsp30: INTEGER
			-- Top of semantic value stack `yyvs30'

	yyspecial_routines30: detachable KL_SPECIAL_ROUTINES [INTERVAL [REAL]] note option: stable attribute end
			-- Routines that ought to be in SPECIAL [INTERVAL [REAL]]

	yyvs31: SPECIAL [INTERVAL [ISO8601_TIME]]
			-- Stack for semantic values of type INTERVAL [ISO8601_TIME]

	yyvsc31: INTEGER
			-- Capacity of semantic value stack `yyvs31'

	yyvsp31: INTEGER
			-- Top of semantic value stack `yyvs31'

	yyspecial_routines31: detachable KL_SPECIAL_ROUTINES [INTERVAL [ISO8601_TIME]] note option: stable attribute end
			-- Routines that ought to be in SPECIAL [INTERVAL [ISO8601_TIME]]

	yyvs32: SPECIAL [INTERVAL [ISO8601_DATE]]
			-- Stack for semantic values of type INTERVAL [ISO8601_DATE]

	yyvsc32: INTEGER
			-- Capacity of semantic value stack `yyvs32'

	yyvsp32: INTEGER
			-- Top of semantic value stack `yyvs32'

	yyspecial_routines32: detachable KL_SPECIAL_ROUTINES [INTERVAL [ISO8601_DATE]] note option: stable attribute end
			-- Routines that ought to be in SPECIAL [INTERVAL [ISO8601_DATE]]

	yyvs33: SPECIAL [INTERVAL [ISO8601_DATE_TIME]]
			-- Stack for semantic values of type INTERVAL [ISO8601_DATE_TIME]

	yyvsc33: INTEGER
			-- Capacity of semantic value stack `yyvs33'

	yyvsp33: INTEGER
			-- Top of semantic value stack `yyvs33'

	yyspecial_routines33: detachable KL_SPECIAL_ROUTINES [INTERVAL [ISO8601_DATE_TIME]] note option: stable attribute end
			-- Routines that ought to be in SPECIAL [INTERVAL [ISO8601_DATE_TIME]]

	yyvs34: SPECIAL [INTERVAL [ISO8601_DURATION]]
			-- Stack for semantic values of type INTERVAL [ISO8601_DURATION]

	yyvsc34: INTEGER
			-- Capacity of semantic value stack `yyvs34'

	yyvsp34: INTEGER
			-- Top of semantic value stack `yyvs34'

	yyspecial_routines34: detachable KL_SPECIAL_ROUTINES [INTERVAL [ISO8601_DURATION]] note option: stable attribute end
			-- Routines that ought to be in SPECIAL [INTERVAL [ISO8601_DURATION]]

	yyvs35: SPECIAL [INTERVAL [PART_COMPARABLE]]
			-- Stack for semantic values of type INTERVAL [PART_COMPARABLE]

	yyvsc35: INTEGER
			-- Capacity of semantic value stack `yyvs35'

	yyvsp35: INTEGER
			-- Top of semantic value stack `yyvs35'

	yyspecial_routines35: detachable KL_SPECIAL_ROUTINES [INTERVAL [PART_COMPARABLE]] note option: stable attribute end
			-- Routines that ought to be in SPECIAL [INTERVAL [PART_COMPARABLE]]

feature {NONE} -- Constants

	yyFinal: INTEGER = 325
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 48
			-- Number of tokens

	yyLast: INTEGER = 395
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 293
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 103
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



feature {NONE} -- Initialization

	make
			-- Create a new parser.
		do
			make_scanner
			make_parser_skeleton
			create time_vc
			create date_vc
			create complex_object_nodes.make(0)
			create attr_nodes.make(0)
			create indent.make(0)
		end

feature -- Commands

	reset
		do
			precursor
			validator_reset
			accept -- ensure no syntax errors lying around from previous invocation
		end

	execute (in_text:STRING; a_source_start_line: INTEGER)
		do
			reset

			source_start_line := a_source_start_line

			indent.wipe_out
			complex_object_nodes.wipe_out
			attr_nodes.wipe_out

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
			Result.append(" [last token = " + token_name (last_token) + "]")
		end

feature -- Access

	source_start_line: INTEGER
			-- offset of source in other document, else 0

	output: detachable DT_COMPLEX_OBJECT_NODE
			-- parsed structure

feature {NONE} -- Parse Tree

	complex_object_nodes: ARRAYED_STACK [DT_COMPLEX_OBJECT_NODE]
	complex_object_node: detachable DT_COMPLEX_OBJECT_NODE

	attr_nodes: ARRAYED_STACK [DT_ATTRIBUTE_NODE]
	attr_node: detachable DT_ATTRIBUTE_NODE

	obj_key: detachable STRING
			-- qualifier of last rel name; use for next object creation

	time_vc: TIME_VALIDITY_CHECKER
	date_vc: DATE_VALIDITY_CHECKER

feature {NONE} -- Implementation 
	
	indent: STRING
	str: STRING

end
