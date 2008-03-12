indexing
	component:   "openEHR Reusable Libraries"
	description: "[
			 Parser for unit strings conforming to the Unified Code for Units 
	             of Measure (UCUM), developed by Gunther Schadow and Clement J. McDonald 
	             of The Regenstrief Institute For Health Care, Indianapolis. Published at 
	             http://aurora.rg.iupui.edu/UCUM. 
			 ]"
	keywords:    "units, UCUM"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class UNITS_PARSER

inherit
	YY_PARSER_SKELETON
		rename
			make as make_parser_skeleton
		redefine
			report_error
		end

	UNITS_SCANNER
		rename
			make as make_eiffel_scanner
		end

	SHARED_UNIT_DATABASE
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
				yyvs3.put (last_string_value, yyvsp3)
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
--|#line 62 "units_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'units_parser.y' at line 62")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 2 then
--|#line 63 "units_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'units_parser.y' at line 63")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 3 then
--|#line 66 "units_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'units_parser.y' at line 66")
end

				create units.make(units_items)
			
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 4 then
--|#line 69 "units_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'units_parser.y' at line 69")
end

				create units.make(units_items)
			
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 5 then
--|#line 74 "units_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'units_parser.y' at line 74")
end

				units_items.extend(units_item)
			
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 6 then
--|#line 77 "units_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'units_parser.y' at line 77")
end

				units_items.extend(units_item)
			
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 7 then
--|#line 80 "units_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'units_parser.y' at line 80")
end

-- // make the exponent negative of what it was
				units_items.extend(units_item)
				units_item.set_exponent(- units_item.exponent)
			
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 8 then
--|#line 86 "units_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'units_parser.y' at line 86")
end

-- // meaning is unit with exponent of +1 
				create units_item.make(unit_ref, 1)
				yyval1 := units_item
			
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 9 then
--|#line 90 "units_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'units_parser.y' at line 90")
end

-- // meaning is unit with exponent of +1 
				create units_item.make(unit_ref, int_val)
				yyval1 := units_item
			
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 10 then
--|#line 96 "units_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'units_parser.y' at line 96")
end

-- // note - we cannot tell if prefix is included or not - that requires	
					-- // character level parsing, since prefixes are not lexically separate
				str1 ?= yyvs3.item (yyvsp3)
				create_unit_ref(str1, False)
				yyval1 := unit_ref
			
if yy_parsing_status = yyContinue then
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
when 11 then
--|#line 102 "units_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'units_parser.y' at line 102")
end

				str1 ?= yyvs3.item (yyvsp3)
				create_unit_ref(str1, True)
				yyval1 := unit_ref
			
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 12 then
--|#line 109 "units_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'units_parser.y' at line 109")
end

				str1 ?= yyvs3.item (yyvsp3)
				annot := str1.twin
				yyval1 := annot
			
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 13 then
--|#line 116 "units_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'units_parser.y' at line 116")
end

				str1 ?= yyvs3.item (yyvsp3)
				suffix := str1.twin
				yyval1 := suffix
			
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 14 then
--|#line 123 "units_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'units_parser.y' at line 123")
end

				int_val := last_string_value.to_integer
				yyval1 := int_val
			
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
when 15 then
--|#line 127 "units_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'units_parser.y' at line 127")
end

				int_val := last_string_value.to_integer
				yyval1 := int_val
			
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 16 then
--|#line 131 "units_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'units_parser.y' at line 131")
end

				int_val := - last_string_value.to_integer
				yyval1 := int_val
			
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
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
			when 26 then
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
			    2,    2,   14,   11,    2,   12,    2,   13,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,   15,    2,    2,    2,    2,    2,

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
			    5,    6,    7,    8,    9,   10, yyDummy>>)
		end

	yyr1_template: SPECIAL [INTEGER] is
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,   16,   16,   17,   17,   18,   18,   18,   20,   20,
			   21,   21,   19,   23,   22,   22,   22, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER] is
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    3,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    3,    1,    1,    3,    1,    1,
			    2,    1,    1,    1,    2,    2,    1,    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER] is
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    2,    3,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER] is
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    0,   10,    2,    1,    3,    5,    8,    0,   11,    0,
			    0,    0,    4,    0,    0,    6,    7,    0,    0,    0,
			   14,    9,   13,   12,   16,   15,    0,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER] is
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			   26,    3,    4,   12,    5,    6,   21,    8, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER] is
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			    3,   16, -32768, -32768,   -8, -32768,    1,   15, -32768,   14,
			   14,   13, -32768,   -3,    5, -32768, -32768,    4,   12,    9,
			 -32768, -32768, -32768, -32768, -32768, -32768,   11,   10, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER] is
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -32768, -32768, -32768, -32768,   -7, -32768, -32768, -32768, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER] is
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   20,   11,   15,   16,    2,   10,    9,    1,   19,   18,
			   28,   27,   25,   22,   23,   24,   13,   17,    1,   14,
			    0,    0,    0,    7, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER] is
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			    3,    9,    9,   10,    1,   13,   14,    4,   11,   12,
			    0,    0,    3,    8,   10,    3,   15,    4,    4,    4,
			   -1,   -1,   -1,    7, yyDummy>>)
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

	yyvs3: SPECIAL [STRING]
			-- Stack for semantic values of type STRING

	yyvsc3: INTEGER
			-- Capacity of semantic value stack `yyvs3'

	yyvsp3: INTEGER
			-- Top of semantic value stack `yyvs3'

	yyspecial_routines3: KL_SPECIAL_ROUTINES [STRING]
			-- Routines that ought to be in SPECIAL [STRING]

feature {NONE} -- Constants

	yyFinal: INTEGER is 28
			-- Termination state id

	yyFlag: INTEGER is -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER is 16
			-- Number of tokens

	yyLast: INTEGER is 23
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER is 265
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER is 24
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

	execute(unit_text:STRING) is
		require
			Units_exist: unit_text /= Void and then not unit_text.is_empty
		do
			reset
			create units_items.make(0)
			set_input_buffer (new_string_buffer (unit_text + ";"))
			create error_message.make(0)
			create output.make(0)
			parse
		end

feature {YY_PARSER_ACTION} -- Basic Operations

	report_error (a_message: STRING) is
			-- report errors to do with parsing failure
		do
			error_message.append(a_message)
			error_message.append("; ")
		end

feature -- Access

	units:UNITS
			-- parsing result

	output:STRING
			-- parser output

	error_message: STRING
			-- parsing failure error

feature {NONE} -- Implementation 

	create_unit_ref(a_unit_name:STRING; suffix_flag:BOOLEAN) is
			-- try and create a simple unit from a_unit_name, using unit database.
			-- nothing created if unit not found
		require
			Unit_name_exists: a_unit_name /= Void and then not a_unit_name.is_empty
		local
			good_ud, ud:UNIT_DESCRIPTOR
			i:INTEGER
			good_symbol, u_symbol:STRING
			pfx:STRING
		do
			from 
				i := 1
			until 
				i > a_unit_name.count or else good_ud /= Void 
			loop
				u_symbol := a_unit_name.substring(i, a_unit_name.count)
				ud := unit_database.unit_descriptor_for_symbol(u_symbol)
				if ud /= Void then
					good_ud := ud
					good_symbol := u_symbol.twin
					if i > 1 then
						pfx := a_unit_name.substring(1, i-1)
					end
				end
				i := i + 1	
			end

			if good_ud /= Void then
				create unit_ref.make(good_symbol, good_ud.property, good_ud.group_name)
				if pfx /= Void then
					if good_ud.is_metric then
						if unit_database.has_prefix_symbol(pfx) then
							unit_ref.set_metric_prefix(pfx)
						else
							report_error("unit symbol " + a_unit_name + " prefix " + pfx + " not found")
							raise_error
						end
					else
						report_error("unit symbol " + a_unit_name + " includes prefix " + pfx + " but is not metric")
						raise_error
					end
				end
				if suffix_flag then
					unit_ref.set_suffix(suffix)
				end
			else
				report_error("unit symbol " + a_unit_name + " not found in unit database")
				raise_error
			end
		end

	str1, str2:STRING
	unit_ref:UNIT_REFERENCE
	units_item:UNITS_ITEM
	units_items:ARRAYED_LIST[UNITS_ITEM]
	annot:STRING
	suffix:STRING

	int_val_str:STRING
	int_val:INTEGER

	pd:PREFIX_DESCRIPTOR
	pf:PREFIXES

end

--|
--| ***** BEGIN LICENSE BLOCK *****
--| Version: MPL 1.1/GPL 2.0/LGPL 2.1
--|
--| The contents of this file are subject to the Mozilla Public License Version
--| 1.1 (the 'License'); you may not use this file except in compliance with
--| the License. You may obtain a copy of the License at
--| http://www.mozilla.org/MPL/
--|
--| Software distributed under the License is distributed on an 'AS IS' basis,
--| WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
--| for the specific language governing rights and limitations under the
--| License.
--|
--| The Original Code is units_parser.y
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|
--| Alternatively, the contents of this file may be used under the terms of
--| either the GNU General Public License Version 2 or later (the 'GPL'), or
--| the GNU Lesser General Public License Version 2.1 or later (the 'LGPL'),
--| in which case the provisions of the GPL or the LGPL are applicable instead
--| of those above. If you wish to allow use of your version of this file only
--| under the terms of either the GPL or the LGPL, and not to allow others to
--| use your version of this file under the terms of the MPL, indicate your
--| decision by deleting the provisions above and replace them with the notice
--| and other provisions required by the GPL or the LGPL. If you do not delete
--| the provisions above, a recipient may use your version of this file under
--| the terms of any one of the MPL, the GPL or the LGPL.
--|
--| ***** END LICENSE BLOCK *****
--|
