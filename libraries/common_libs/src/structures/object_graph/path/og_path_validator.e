indexing
	component:   "openEHR Archetype Project"
	description: "parser for Object Graph paths"
	keywords:    "OG_PATH"
	author:      "Thomas Beale <thomas@deepthought.com.au>"
	support:     "Deep Thought Informatics <support@deepthought.com.au>"
	copyright:   "Copyright (c) 2003, 2004 Deep Thought Informatics Pty Ltd"
	license:     "The Eiffel Forum Open Source License version 1"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class OG_PATH_VALIDATOR

inherit

	YY_PARSER_SKELETON
		rename
			make as make_parser_skeleton
		redefine
			report_error
		end

	OG_PATH_SCANNER
		rename
			make as make_eiffel_scanner
		end

	KL_SHARED_EXCEPTIONS
	KL_SHARED_ARGUMENTS

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
				yyvs2.put (last_string_value, yyvsp2)
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
		do
			inspect yy_act
when 1 then
--|#line 47 "og_path_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'og_path_validator.y' at line 47")
end

			output := a_path
			accept
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 2 then
--|#line 52 "og_path_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'og_path_validator.y' at line 52")
end

			debug("OG_PATH_parse")
				io.put_string("OG_PATH NOT validated%N")
			end
			abort
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 3 then
--|#line 62 "og_path_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'og_path_validator.y' at line 62")
end

			debug("OG_PATH_parse")
				io.put_string(" = og_path%N")
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 4 then
--|#line 68 "og_path_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'og_path_validator.y' at line 68")
end

			debug("OG_PATH_parse")
				io.put_string(" = og_path%N")
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 5 then
--|#line 78 "og_path_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'og_path_validator.y' at line 78")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 6 then
--|#line 79 "og_path_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'og_path_validator.y' at line 79")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 7 then
--|#line 84 "og_path_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'og_path_validator.y' at line 84")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 8 then
--|#line 85 "og_path_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'og_path_validator.y' at line 85")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 9 then
--|#line 88 "og_path_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'og_path_validator.y' at line 88")
end

			if a_path = Void then
				create a_path.make_relative(create {OG_PATH_ITEM}.make_attribute(yyvs2.item (yyvsp2)))
			else
				a_path.append_attribute_segment(create {OG_PATH_ITEM}.make_attribute(yyvs2.item (yyvsp2)))
			end
			debug("OG_PATH_parse")
				io.put_string("...attr_path_segment: " + yyvs2.item (yyvsp2))
			end
		
if yy_parsing_status = yyContinue then
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
when 10 then
--|#line 101 "og_path_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'og_path_validator.y' at line 101")
end

			if a_path = Void then
				raise_error
				report_error("Absolute path missing leading '/'")
				abort
			else
				a_path.append_object_segment(create {OG_PATH_ITEM}.make_object(yyvs2.item (yyvsp2)))
			end
			debug("OG_PATH_parse")
				io.put_string("...obj_path_segment: [" + yyvs2.item (yyvsp2) + "]")
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 11 then
--|#line 114 "og_path_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'og_path_validator.y' at line 114")
end

			if a_path /= Void then
				raise_error
				report_error("/[xxx]/ can only appear at head of path")
				abort
			else
				create a_path.make_absolute(create {OG_PATH_ITEM}.make_object(yyvs2.item (yyvsp2)))
			end
			debug("OG_PATH_parse")
				io.put_string("...obj_path_segment: /[" + yyvs2.item (yyvsp2) + "]/")
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 12 then
--|#line 144 "og_path_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'og_path_validator.y' at line 144")
end

			if a_path /= Void then
				raise_error
				report_error("//[xxx]/ can only appear at head of path")
				abort
			else
				create a_path.make_movable(create {OG_PATH_ITEM}.make_object(yyvs2.item (yyvsp2)))
			end
			debug("OG_PATH_parse")
				io.put_string("...obj_path_segment: //[" + yyvs2.item (yyvsp2) + "]/")
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 13 then
--|#line 157 "og_path_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'og_path_validator.y' at line 157")
end

			if a_path /= Void then
				raise_error
				report_error("//[xxx] can only appear at head of path")
				abort
			else
				create a_path.make_movable(create {OG_PATH_ITEM}.make_object(yyvs2.item (yyvsp2)))
			end
			debug("OG_PATH_parse")
				io.put_string("...obj_path_segment: //[" + yyvs2.item (yyvsp2) + "]")
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 14 then
--|#line 170 "og_path_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'og_path_validator.y' at line 170")
end

			if a_path = Void then
				create a_path.make_absolute(create {OG_PATH_ITEM}.make_object_unknown)
			else
				a_path.append_object_segment(create {OG_PATH_ITEM}.make_object_unknown)
			end
			debug("OG_PATH_parse")
				io.put_string("...obj_path_segment(anon)")
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
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
			when 18 then
					-- End-of-file expected action.
				report_eof_expected_error
			else
					-- Default action.
				report_error ("parse error")
			end
		end

feature {NONE} -- Table templates

	yytranslate_template: SPECIAL [INTEGER] is
		once
			Result := yyfixed_array (<<
			    0,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,   10,    9,    2,    2,
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

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    1,    2,    3,    4,
			    5,    6,    7,    8, yyDummy>>)
		end

	yyr1_template: SPECIAL [INTEGER] is
		once
			Result := yyfixed_array (<<
			    0,   11,   11,   12,   12,   14,   14,   13,   13,   15,
			   16,   16,   16,   16,   16, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER] is
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    2,    2,    1,    1,    1,    1,    1,
			    1,    2,    2,    1,    1,    1,    1,    1,    1,    1,
			    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER] is
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    2,    2,    2,    2,    1,    1,    1,
			    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER] is
		once
			Result := yyfixed_array (<<
			    0,   14,    0,    0,    9,    2,    1,    3,    4,    5,
			    7,    0,   13,   10,    6,    8,   11,   12,    0,    0,
			    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER] is
		once
			Result := yyfixed_array (<<
			   18,    6,    7,    8,    9,   10, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER] is
		once
			Result := yyfixed_array (<<
			   -1,    9,    8,    4, -32768, -32768, -32768,    6,    3, -32768,
			 -32768,   -3,   -5, -32768, -32768, -32768, -32768, -32768,    2,    1,
			 -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER] is
		once
			Result := yyfixed_array (<<
			 -32768, -32768, -32768, -32768,   12,   10, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER] is
		once
			Result := yyfixed_array (<<
			    5,   20,   19,    4,   17,    3,   16,    2,    1,    3,
			    4,    2,    1,   13,   12,   11,    0,    0,   15,   14, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER] is
		once
			Result := yyfixed_array (<<
			    1,    0,    0,    4,    9,    6,    9,    8,    9,    6,
			    4,    8,    9,    9,    6,    6,   -1,   -1,    8,    7, yyDummy>>)
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

	yyvs2: SPECIAL [STRING]
			-- Stack for semantic values of type STRING

	yyvsc2: INTEGER
			-- Capacity of semantic value stack `yyvs2'

	yyvsp2: INTEGER
			-- Top of semantic value stack `yyvs2'

	yyspecial_routines2: KL_SPECIAL_ROUTINES [STRING]
			-- Routines that ought to be in SPECIAL [STRING]

feature {NONE} -- Constants

	yyFinal: INTEGER is 20
			-- Termination state id

	yyFlag: INTEGER is -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER is 11
			-- Number of tokens

	yyLast: INTEGER is 19
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER is 263
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER is 17
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



feature -- Initialization

	make is
			-- Create a new Eiffel parser.
		do
			make_eiffel_scanner
			make_parser_skeleton
			create indent.make(0)
		end

	execute(in_text:STRING) is
		do
			reset
			create error_text.make(0)
			set_input_buffer (new_string_buffer (in_text))
			parse
		end

feature {YY_PARSER_ACTION} -- Basic Operations

	report_error (a_message: STRING) is
			-- Print error message.
		do
			error_text.append (a_message)
			error_text.append (" [last token = " + token_name(last_token) + "]")
			error_text.append_character ('%N')
		end

feature -- Access

	error_text: STRING

	output: OG_PATH

feature {NONE} -- Implementation

	a_path: OG_PATH
	a_path_item: OG_PATH_ITEM

	indent: STRING

end
