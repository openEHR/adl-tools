note
	component:   "openEHR Archetype Project"
	description: "Validating parser for Archetype Description Language (ADL)"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class ADL_VALIDATOR

inherit
	YY_PARSER_SKELETON
		rename
			make as make_parser_skeleton
		redefine
			report_error
		end

	ADL_SCANNER
		rename
			make as make_eiffel_scanner
		end

	ADL_SYNTAX_CONVERTER

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
		end

	yy_init_value_stacks
			-- Initialize value stacks.
		do
			yyvsp1 := -1
			yyvsp2 := -1
		end

	yy_clear_value_stacks
			-- Clear objects in semantic value stacks so that
			-- they can be collected by the garbage collector.
		do
			yyvs1.keep_head (0)
			yyvs2.keep_head (0)
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
		do
				inspect yy_act
when 1 then
--|#line 52 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 52")
end

			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 2 then
--|#line 56 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 56")
end

			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 3 then
--|#line 62 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 62")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp1 := yyvsp1 -7
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 4 then
--|#line 72 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 72")
end

			create archetype_id.make_from_string(yyvs2.item (yyvsp2)) -- FIXME - should be other make routine
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 5 then
--|#line 76 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 76")
end

			raise_error
			report_error("In 'archetype' clause; expecting archetype id (model_issuer-ref_model-model_class.concept.version)")
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 6 then
--|#line 84 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 84")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 7 then
--|#line 85 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 85")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 8 then
--|#line 88 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 88")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 9 then
--|#line 91 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 91")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 10 then
--|#line 92 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 92")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 11 then
--|#line 95 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 95")
end

			adl_version := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 12 then
--|#line 100 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 100")
end

			create uid.make_from_string (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 13 then
--|#line 105 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 105")
end

			create uid.make_from_string (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 14 then
--|#line 109 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 109")
end

			is_controlled := True
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 15 then
--|#line 113 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 113")
end

			is_generated := True
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 16 then
--|#line 119 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 119")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
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
when 17 then
--|#line 120 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 120")
end

			create parent_archetype_id.make_from_string(yyvs2.item (yyvsp2)) -- FIXME - should be other make routine
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 18 then
--|#line 124 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 124")
end

			raise_error
			report_error("In 'specialise' clause; expecting parent archetype id (model_issuer-ref_model-model_class.concept.version)")
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 19 then
--|#line 132 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 132")
end

			concept := yyvs2.item (yyvsp2)
			debug("ADL_parse")
				io.put_string("concept = " + concept + "%N")
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 20 then
--|#line 139 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 139")
end

			raise_error
			report_error("In 'concept' clause; expecting TERM_CODE reference")
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 21 then
--|#line 147 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 147")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
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
when 22 then
--|#line 148 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 148")
end

			convert_dadl_language(yyvs2.item (yyvsp2))
			language_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 23 then
--|#line 153 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 153")
end

			raise_error
			report_error("Error in language section")
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 24 then
--|#line 161 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 161")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
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
when 25 then
--|#line 162 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 162")
end

			convert_dadl_language(yyvs2.item (yyvsp2))
			description_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 26 then
--|#line 167 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 167")
end

			raise_error
			report_error("Error in description section")
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 27 then
--|#line 176 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 176")
end

			definition_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 28 then
--|#line 180 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 180")
end

			raise_error
			report_error("Error in definition section")
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 29 then
--|#line 188 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 188")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
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
when 30 then
--|#line 189 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 189")
end

			invariant_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 31 then
--|#line 193 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 193")
end

			raise_error
			report_error("Error in invariant section")
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 32 then
--|#line 201 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 201")
end

			ontology_text := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 33 then
--|#line 205 "adl_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'adl_validator.y' at line 205")
end

			raise_error
			report_error("Error in ontology section")
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
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
			when 52 then
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
			   28,   29,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,   30,
			    2,   31,    2,    2,    2,    2,    2,    2,    2,    2,
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
			    5,    6,    7,    8,    9,   10,   11,   12,   13,   14,
			   15,   16,   17,   18,   19,   20,   21,   22,   23,   24,
			   25,   26,   27, yyDummy>>)
		end

	yyr1_template: SPECIAL [INTEGER]
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,   32,   32,   33,   34,   34,   42,   42,   43,   44,
			   44,   45,   45,   45,   45,   45,   35,   35,   35,   36,
			   36,   37,   37,   37,   38,   38,   38,   39,   39,   40,
			   40,   40,   41,   41, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    2,    1,    1,    1,    1,    1,    1,    2,    1,
			    1,    1,    1,    1,    1,    1,    2,    1,    1,    1,
			    2,    2,    2,    1,    2,    1,    1,    1,    2,    1,
			    1,    1,    2,    1,    1,    1,    2,    1,    1,    1,
			    2,    1,    1,    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER]
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    2,    2,    2,    2,    2,    2,    2,
			    2,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER]
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    0,    0,    2,    1,   16,    0,    0,    5,    7,    0,
			    0,    4,    0,   15,   14,    0,    0,    9,   17,   18,
			    0,   21,    0,    0,    0,    8,   19,   20,    0,   24,
			   13,   12,   11,   10,   22,   23,    0,    0,   25,   26,
			    0,   29,   27,   28,    0,    0,   30,   31,    0,    3,
			   32,   33,    0,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			   52,    3,    4,   10,   21,   29,   37,   41,   45,   49,
			    5,    8,   16,   17, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			    0,   -1, -32768, -32768,   21,   32,   -3, -32768, -32768,   14,
			   20, -32768,   10, -32768, -32768,    8,    2, -32768, -32768, -32768,
			   15,   16,   -4,   24,   -3, -32768, -32768, -32768,   13,    9,
			 -32768, -32768, -32768, -32768, -32768, -32768,    7,   12, -32768, -32768,
			    3,    5, -32768, -32768,    1,    4, -32768, -32768,    6, -32768,
			 -32768, -32768,   25,   17, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768,   18, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			    7,    2,   47,   -6,   43,   31,   30,   51,   39,   46,
			   42,    1,   50,   38,   35,   19,   27,   54,   18,   34,
			   26,   15,   14,   13,   12,   53,   48,    6,   44,   40,
			   36,   25,   24,   32,   28,   20,   11,    9,    0,   23,
			    0,   22,   33, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    4,    1,    9,   10,    1,    1,    8,
			    7,   11,    6,    6,    1,    1,    1,    0,    4,    6,
			    5,   24,   25,   26,   27,    0,   22,   28,   23,   17,
			   21,   29,   30,    9,   18,   15,    4,   16,   -1,   31,
			   -1,   31,   24, yyDummy>>)
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

feature {NONE} -- Constants

	yyFinal: INTEGER = 54
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 32
			-- Number of tokens

	yyLast: INTEGER = 42
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 282
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 46
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
		local
			f_buffer: YY_FILE_BUFFER
		do
			f_buffer ?= input_buffer
			if f_buffer /= Void then
				error_text.append (f_buffer.file.name + ", line ")
			else
				error_text.append ("line ")
			end
			error_text.append (in_lineno.out + ": " + a_message + " [last token = " + token_name(last_token) + "]%N")
		end

feature -- Parse Output

	archetype_id: ARCHETYPE_ID

	adl_version: STRING

	uid: HIER_OBJECT_ID

	is_controlled: BOOLEAN

	is_generated: BOOLEAN

	parent_archetype_id: ARCHETYPE_ID

	concept: STRING

	language_text: STRING

	description_text: STRING

	definition_text: STRING

	invariant_text: STRING
	
	ontology_text: STRING

	annotations_text: STRING

	component_ontologies_text: STRING

feature -- Access

	error_text: STRING

feature {NONE} -- Implementation 

	str: STRING

end
