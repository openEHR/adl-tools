%{
note
	component:   "openEHR ADL Tools"
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
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


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

%}

%token <INTEGER> V_INTEGER 
%token <STRING> V_IDENTIFIER

%token SYM_OPEN_PAREN SYM_CLOSE_PAREN
%token SYM_START_SUFFIX SYM_END_SUFFIX
%token SYM_START_ANNOT SYM_END_ANNOT

%left '+' '-'
%left '/' '*'
%right '^'

%%

input: units
	| error
	;

units: units_expression {
				create units.make(units_items)
			}
	| units_expression annotation {
				create units.make(units_items)
			}
			;

units_expression: units_item {
				units_items.extend(units_item)
			}
	| units_expression '*' units_item {
				units_items.extend(units_item)
			}
	| units_expression '/' units_item {	-- // make the exponent negative of what it was
				units_items.extend(units_item)
				units_item.set_exponent(- units_item.exponent)
			}
			;

units_item: unit_ref {			-- // meaning is unit with exponent of +1 
				create units_item.make(unit_ref, 1)
				$$ := units_item
			}
	| unit_ref '^' integer_value {	-- // meaning is unit with exponent of +1 
				create units_item.make(unit_ref, int_val)
				$$ := units_item
			}
			;

unit_ref: V_IDENTIFIER {	-- // note - we cannot tell if prefix is included or not - that requires	
							-- // character level parsing, since prefixes are not lexically separate
				str1 := $1
				create_unit_ref (str1, False)
				$$ := unit_ref
			}
	| V_IDENTIFIER suffix {
				str1 := $1
				create_unit_ref (str1, True)
				$$ := unit_ref
			}
	       	;

annotation: SYM_START_ANNOT V_IDENTIFIER SYM_END_ANNOT {
				$$ := $2
				annot := $$.twin
			}
	       	;

suffix: SYM_START_SUFFIX V_IDENTIFIER SYM_END_SUFFIX {
				$$ := $2
				suffix := $$.twin
			}
	       	;

integer_value: V_INTEGER {
				int_val := last_string_value.to_integer
				$$ := int_val
			}
	| '+' V_INTEGER {
				int_val := last_string_value.to_integer
				$$ := int_val
			}
	| '-' V_INTEGER {
				int_val := - last_string_value.to_integer
				$$ := int_val
			}
			;
%%

feature -- Initialization

	make
			-- Create a new Eiffel parser.
		do
			make_eiffel_scanner
			make_parser_skeleton
		end

	execute (unit_text:STRING)
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

	report_error (a_message: STRING)
			-- report errors to do with parsing failure
		do
			error_message.append(a_message)
			error_message.append("; ")
		end

feature -- Access

	units: UNITS
			-- parsing result

	output: STRING
			-- parser output

	error_message: STRING
			-- parsing failure error

feature {NONE} -- Implementation 

	create_unit_ref (a_unit_name: STRING; suffix_flag: BOOLEAN)
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

	str1, str2: STRING
	unit_ref: UNIT_REFERENCE
	units_item: UNITS_ITEM
	units_items: ARRAYED_LIST[UNITS_ITEM]
	annot: STRING
	suffix: STRING

	int_val_str: STRING
	int_val: INTEGER

	pd: PREFIX_DESCRIPTOR
	pf: PREFIXES

end

