%{
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
%}

%token <INTEGER> V_INTEGER 
%token <REAL> V_REAL 
%token <STRING> V_TYPE_IDENTIFIER V_GENERIC_TYPE_IDENTIFIER V_ATTRIBUTE_IDENTIFIER V_FEATURE_CALL_IDENTIFIER V_STRING

%token <STRING> V_ROOT_ID_CODE V_ID_CODE V_ID_CODE_STR 
%token <STRING> V_VALUE_SET_REF
%token <TERM_CONSTRAINT_PARSE_STRUCTURE> V_EXPANDED_VALUE_SET_DEF V_EXTERNAL_VALUE_SET_DEF
%token ERR_VALUE_SET_DEF_ASSUMED ERR_VALUE_SET_MISSING_CODES ERR_VALUE_SET_DEF_DUP_CODE ERR_VALUE_SET_DEF

%token <STRING> V_REGEXP
%token <STRING> V_ABS_PATH V_REL_PATH
%token <CHARACTER> V_CHARACTER
%token <STRING> V_URI
%token <STRING> V_ISO8601_EXTENDED_DATE V_ISO8601_EXTENDED_TIME V_ISO8601_EXTENDED_DATE_TIME V_ISO8601_DURATION
%token <STRING> V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN V_ISO8601_TIME_CONSTRAINT_PATTERN
%token <STRING> V_ISO8601_DATE_CONSTRAINT_PATTERN V_ISO8601_DURATION_CONSTRAINT_PATTERN
%token <STRING> V_ISO8601_DURATION_CONSTRAINT_PATTERN_ERR

--
-- LEGACY ADL 1.4 Syntax
--
%token <C_DV_QUANTITY> V_C_DV_QUANTITY
%token ERR_C_DV_QUANTITY
--
-- END LEGACY ADL 1.4 Syntax
--

%token SYM_START_CBLOCK SYM_END_CBLOCK	-- constraint block

%token SYM_ANY -- used outside of parser & scanner

%token SYM_INTERVAL_DELIM
%token SYM_TRUE SYM_FALSE 
%token SYM_THEN SYM_ELSE

%token SYM_EXISTENCE SYM_OCCURRENCES SYM_CARDINALITY 
%token SYM_UNORDERED SYM_ORDERED SYM_UNIQUE SYM_ELLIPSIS SYM_LIST_CONTINUE
%token SYM_MATCHES SYM_ALLOW_ARCHETYPE SYM_USE_NODE 
%token SYM_INCLUDE SYM_EXCLUDE
%token SYM_AFTER SYM_BEFORE SYM_CLOSED

%token ERR_CHARACTER ERR_STRING ERR_V_ISO8601_DURATION

%left SYM_IMPLIES
%left SYM_OR SYM_XOR
%left SYM_AND
%left SYM_EXISTS SYM_FORALL SYM_NOT
%left '=' SYM_NE SYM_LT SYM_GT SYM_LE SYM_GE SYM_MATCHES
%left '+' '-'
%left '*' '/' SYM_DIV SYM_MODULO
%left UNARY_MINUS
%left '^'

%type <detachable ARRAYED_LIST [ASSERTION]> assertions c_includes c_excludes
%type <ASSERTION> assertion

%type <C_COMPLEX_OBJECT_PROXY> c_complex_object_proxy

%type <STRING> type_identifier
%type <SIBLING_ORDER> sibling_order
%type <detachable MULTIPLICITY_INTERVAL> c_occurrences c_existence
%type <MULTIPLICITY_INTERVAL> multiplicity existence
%type <C_COMPLEX_OBJECT> c_complex_object_id c_complex_object_head
%type <C_PRIMITIVE_OBJECT> c_primitive_object
%type <ARCHETYPE_SLOT> c_archetype_slot_id c_archetype_slot_head archetype_slot
%type <C_ATTRIBUTE> c_attr_head

%type <EXPR_ITEM> boolean_node boolean_expr boolean_leaf arithmetic_leaf 
%type <EXPR_UNARY_OPERATOR> boolean_unop_expr
%type <EXPR_BINARY_OPERATOR> boolean_binop_expr arithmetic_relop_expr arithmetic_arith_binop_expr arch_outer_constraint_expr boolean_constraint
%type <EXPR_LEAF> arithmetic_value boolean_literal
%type <EXPR_ITEM> arithmetic_node

%type <INTEGER> integer_value
%type <REAL> real_value
%type <BOOLEAN> boolean_value
%type <ISO8601_DATE> date_value
%type <ISO8601_DATE_TIME> date_time_value
%type <ISO8601_TIME> time_value
%type <ISO8601_DURATION> duration_value
%type <STRING> any_identifier
%type <STRING> string_value

%type <ARRAYED_LIST[STRING]> string_list
%type <ARRAYED_LIST[INTEGER]> integer_list
%type <ARRAYED_LIST[REAL]> real_list
%type <ARRAYED_LIST[BOOLEAN]> boolean_list
%type <ARRAYED_LIST[ISO8601_DATE]> date_list
%type <ARRAYED_LIST[ISO8601_TIME]> time_list
%type <ARRAYED_LIST[ISO8601_DATE_TIME]> date_time_list
%type <ARRAYED_LIST[ISO8601_DURATION]> duration_list

%type <INTERVAL[INTEGER]> integer_interval
%type <INTERVAL[REAL]> real_interval
%type <INTERVAL[ISO8601_TIME]> time_interval
%type <INTERVAL[ISO8601_DATE]> date_interval
%type <INTERVAL[ISO8601_DATE_TIME]> date_time_interval
%type <INTERVAL[ISO8601_DURATION]> duration_interval

%type <ARRAYED_LIST [INTERVAL[INTEGER]]> integer_interval_list
%type <ARRAYED_LIST [INTERVAL[REAL]]> real_interval_list
%type <ARRAYED_LIST [INTERVAL[ISO8601_TIME]]> time_interval_list
%type <ARRAYED_LIST [INTERVAL[ISO8601_DATE]]> date_interval_list
%type <ARRAYED_LIST [INTERVAL[ISO8601_DATE_TIME]]> date_time_interval_list
%type <ARRAYED_LIST [INTERVAL[ISO8601_DURATION]]> duration_interval_list

%type <STRING> arithmetic_binop_symbol
%type <STRING> relational_binop_symbol
%type <STRING> boolean_binop_symbol

%type <detachable CARDINALITY> c_cardinality
%type <CARDINALITY> cardinality

--
-- LEGACY ADL 1.4 Syntax
--
%type <C_COMPLEX_OBJECT> c_ordinal
%type <ORDINAL> ordinal
--
-- END LEGACY ADL 1.4 Syntax
--

%type <C_BOOLEAN> c_boolean
%type <C_STRING> c_string
%type <C_DATE_TIME> c_date_time
%type <C_DURATION> c_duration
%type <C_DATE> c_date
%type <C_TIME> c_time
%type <C_REAL> c_real
%type <C_INTEGER> c_integer
%type <C_TERMINOLOGY_CODE> c_terminology_code

%%

input: c_complex_object
		{
			debug ("ADL_parse")
				io.put_string ("CADL definition parsed%N")
			end
			output := $1
			accept
		}
	| assertions
		{
			debug ("ADL_parse")
				io.put_string ("assertion definition parsed%N")
			end
			output := $1
			accept
		}
	| error
		{
			debug ("ADL_parse")
				io.put_string ("CADL definition NOT parsed%N")
			end
			abort
		}
	;

c_complex_object: c_complex_object_head SYM_MATCHES SYM_START_CBLOCK c_complex_object_body SYM_END_CBLOCK
		{ 
			debug ("ADL_parse")
				io.put_string (indent + "POP OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "]%N") 
				indent.remove_tail (1)
			end
			$$ := object_nodes.item
			object_nodes.remove
		}
	;

c_complex_object_head: c_complex_object_id c_occurrences 
		{
			$$ := $1
			if attached $2 as att_occ then
				$1.set_occurrences (att_occ)
			end

			if rm_schema.has_class_definition ($1.rm_type_name) then
				object_nodes.extend ($1)
debug ("ADL_parse")
	io.put_string (indent + "PUSH create OBJECT_NODE " + $1.rm_type_name + " [id=" + $1.node_id + "] ")
	if $2 /= Void then
		io.put_string ("; occurrences=(" + $2.as_string + ")") 
	end
	io.new_line
	indent.append ("%T")
end

				-- put it under current attribute, unless it is the root object, in which case it will be returned
				-- via the 'output' attribute of this parser
				if not c_attrs.is_empty then
					safe_put_c_attribute_child (c_attrs.item, $1)
				end
			else
				abort_with_error (ec_VCORM, <<$1.rm_type_name, $1.path>>)
			end
		}
	;

c_complex_object_id: type_identifier V_ROOT_ID_CODE
		{
			if object_nodes.is_empty then
				create $$.make ($1, $2)
			else
				abort_with_error (ec_VARND, <<$2, Id_code_regex_pattern>>)
			end
		}
	| type_identifier V_ID_CODE
		{
			if not object_nodes.is_empty then
				create $$.make ($1, $2)
			else
				abort_with_error (ec_VARCN, <<$2, Root_id_code_regex_pattern>>)
			end
		}
	| sibling_order type_identifier V_ID_CODE
		{
			create $$.make ($2, $3)
			$$.set_sibling_order ($1)
		}
----------------------------------------------------------------------------
-- START Support transitional ADL 1.5 archetypes containing nodes with no codes
--
	| type_identifier
		{
			if object_nodes.is_empty then
				abort_with_error (ec_VARCN, <<"(none)", Root_id_code_regex_pattern>>)
			else
				create $$.make ($1, new_fake_node_id)
			end
		}
--
-- END Support transitional ADL 1.5 archetypes containing nodes with no codes
----------------------------------------------------------------------------
	;

sibling_order: SYM_AFTER V_ID_CODE
		{
			$$ := create {SIBLING_ORDER}.make_after ($2)
		}
	| SYM_BEFORE V_ID_CODE
		{
			$$ := create {SIBLING_ORDER}.make_before ($2)
		}
	;

c_complex_object_body: c_any -- used to indicate that any value of a type is ok
		{
			debug ("ADL_parse")
				io.put_string (indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + 
					" [id=" + object_nodes.item.node_id + "] - any_allowed%N") 
			end
		}
	| c_attribute_defs
		{
		}
	| error
		{
			abort_with_error (ec_SCOAT, Void)
		}
	;



------------------------- node types -----------------------

c_object: c_complex_object 
		{
		}
	| c_complex_object_proxy 
		{
			safe_put_c_attribute_child (c_attrs.item, $1)
		}
	| archetype_slot
		{
			safe_put_c_attribute_child (c_attrs.item, $1)
		}
	| c_primitive_object
		{
			safe_put_c_attribute_child (c_attrs.item, $1)
		}
--
-- LEGACY ADL 1.4 Syntax
--
	| c_ordinal 
		{
			safe_put_c_attribute_child (c_attrs.item, $1)
		}
	| V_C_DV_QUANTITY
		{
			if attached last_c_dv_quantity_value.property as att_prop then
				-- may already have been encountered in this archetype
				if attached compiler_billboard.binding_code_map.item (att_prop.code_string) as att_at_code then
					c_dv_q_prop_code := att_at_code
				else
					c_dv_q_prop_code := new_fake_at_code
				end
				last_c_dv_quantity_value.set_property (create {TERMINOLOGY_CODE}.make (Local_terminology_id, c_dv_q_prop_code))

				-- add term binding
				if not compiler_billboard.term_bindings.has (att_prop.terminology_id) then
					compiler_billboard.term_bindings.put (create {HASH_TABLE [URI, STRING]}.make (0), att_prop.terminology_id)
				end
				check attached compiler_billboard.term_bindings.item (att_prop.terminology_id) as att_bindings_for_terminology then
					str := uri_for_terminology_code (att_prop)
					att_bindings_for_terminology.put (create {URI}.make_from_string (str), c_dv_q_prop_code)
					compiler_billboard.binding_code_map.put (c_dv_q_prop_code, att_prop.code_string)
				end
			end
			safe_put_c_attribute_child (c_attrs.item, last_c_dv_quantity_value.standard_equivalent (new_fake_node_id))
		}
	| ERR_C_DV_QUANTITY
		{
			abort_with_error (ec_SDINV, <<odin_parser_error.as_string>>)
		}
--
-- END LEGACY ADL 1.4 Syntax
--
	| error		
		{
			abort_with_error (ec_SCCOG, Void)
		}
	;


c_complex_object_proxy: SYM_USE_NODE type_identifier V_ID_CODE c_occurrences V_ABS_PATH
		{
			create $$.make ($2, $3, $5)
			if attached $4 as att_occ then
				$$.set_occurrences (att_occ)
			end

			debug ("ADL_parse")
				io.put_string (indent + "create C_COMPLEX_OBJECT_PROXY ")
				io.put_string ($$.rm_type_name) 
				io.put_string ("[" + $$.node_id + "] ")
				if $$.use_target_occurrences then
					io.put_string ("occurrences=(use target) ")
				elseif $4 /= Void then
					io.put_string ("occurrences=" + $$.occurrences.as_string + " ")
				end
				io.put_string (" => " + $$.target_path + "%N") 
				io.put_string (indent + "C_ATTR " + c_attrs.item.rm_attribute_name + " safe_put_c_attribute_child (C_COMPLEX_OBJECT_PROXY)%N") 
			end
		}
	| SYM_USE_NODE type_identifier c_occurrences V_ABS_PATH
		{
			create $$.make ($2, new_fake_node_id, $4)
			if attached $3 as att_occ then
				$$.set_occurrences (att_occ)
			end
		}
	| SYM_USE_NODE error 
		{
			abort_with_error (ec_SUNPA, Void)
		}
	;

archetype_slot: c_archetype_slot_head SYM_MATCHES SYM_START_CBLOCK c_includes c_excludes SYM_END_CBLOCK
		{
			if attached $4 as att_c_incs then
				$1.set_includes (att_c_incs)
			end
			if attached $5 as att_c_excs then
				$1.set_excludes (att_c_excs)
			end

			debug ("ADL_parse")
				indent.remove_tail (1)
			end
			$$ := $1
		}
	| c_archetype_slot_head -- if closed or occurrences = 0
		{
			if not ($1.is_closed or $1.is_prohibited) then
				abort_with_error (ec_VASMD, <<$1.rm_type_name, c_attrs.item.path>>)
			end
			$$ := $1
		}
	;

c_archetype_slot_head: c_archetype_slot_id c_occurrences 
		{
			if attached $2 as att_occ then
				$1.set_occurrences (att_occ)
			end

			debug ("ADL_parse")
				io.put_string (indent + "create ARCHETYPE_SLOT " + $1.rm_type_name + " [id=" + $1.node_id + "]")
				if attached $2 then
					io.put_string ("; occurrences=(" + $2.as_string + ")") 
				end
				io.new_line
				indent.append ("%T")
			end
			$$ := $1
		}
	;

c_archetype_slot_id: SYM_ALLOW_ARCHETYPE type_identifier V_ID_CODE
		{
			create $$.make ($2, $3)
		}
	| SYM_ALLOW_ARCHETYPE type_identifier V_ID_CODE SYM_CLOSED
		{
			create $$.make ($2, $3)
			$$.set_closed
		}
	| SYM_ALLOW_ARCHETYPE type_identifier
		{
			create $$.make ($2, new_fake_node_id)
		}
	| SYM_ALLOW_ARCHETYPE error
		{
			abort_with_error (ec_SUAS, Void)
		}
	;

c_primitive_object: c_integer 
		{
			debug ("ADL_parse")
				io.put_string (indent + "C_INTEGER: " +  $1.as_string + "%N")
			end
			$$ := $1
		}
	| c_real
		{
			debug ("ADL_parse")
				io.put_string (indent + "C_REAL: " +  $1.as_string + "%N")
			end
			$$ := $1
		}
	| c_date
		{
			debug ("ADL_parse")
				io.put_string (indent + "C_DATE: " +  $1.as_string + "%N")
			end
			$$ := $1
		}
	| c_time
		{
			debug ("ADL_parse")
				io.put_string (indent + "C_TIME: " +  $1.as_string + "%N")
			end
			$$ := $1
		}
	| c_date_time
		{
			debug ("ADL_parse")
				io.put_string (indent + "C_DATE_TIME: " +  $1.as_string + "%N")
			end
			$$ := $1
		}
	| c_duration
		{
			debug ("ADL_parse")
				io.put_string (indent + "C_DURATION: " +  $1.as_string + "%N")
			end
			$$ := $1
		}
	| c_string
		{
			debug ("ADL_parse")
				io.put_string (indent + "C_STRING: " +  $1.as_string + "%N")
			end
			$$ := $1
		}
	| c_terminology_code
		{
			debug ("ADL_parse")
				io.put_string (indent + "C_TERMINOLOGY_CODE: " +  $1.as_string + "%N")
			end
			$$ := $1
		}
	| c_boolean
		{
			debug ("ADL_parse")
				io.put_string (indent + "C_BOOLEAN: " +  $1.as_string + "%N")
			end
			$$ := $1
		}
	;

c_any: '*' 
		{
		}
	;

---------------- BODY - relationships ----------------

c_attribute_defs: c_attribute
		{
		}
	| c_attribute_defs c_attribute
		{
		}
	;

c_attribute: c_attr_head SYM_MATCHES SYM_START_CBLOCK c_attr_values SYM_END_CBLOCK	
		{
			debug ("ADL_parse")
				io.put_string (indent + "POP ATTR_NODE " + c_attrs.item.rm_attribute_name + "%N") 
				indent.remove_tail (1)
			end
			c_attrs.remove
		}
	| c_attr_head -- ok if existence is being changed in specialised archetype
		{
			abort_with_error (ec_SCAS, Void)
		}
	| c_attr_head SYM_MATCHES SYM_START_CBLOCK error SYM_END_CBLOCK	
		{
			abort_with_error (ec_SCAS, Void)
		}
	;

c_attr_head: V_ATTRIBUTE_IDENTIFIER c_existence c_cardinality
		{
			rm_attribute_name := $1
			if not object_nodes.item.has_attribute (rm_attribute_name) then
				if rm_schema.has_property (object_nodes.item.rm_type_name, rm_attribute_name) then
					rm_prop_def := rm_schema.property_definition (object_nodes.item.rm_type_name, rm_attribute_name)
					if rm_prop_def.is_container then

						-- for ADL 1.4 archetypes, remove existence and cardinality if it is a duplicate of the RM constraint
						if attached $2 as ivl and then ivl.is_equal (rm_prop_def.existence) then
							add_warning (ec_WCAEX14, <<rm_attribute_name, parent_path_str, ivl.as_string, rm_prop_def.existence.as_string>>)
							$2 := Void
						end
						if attached {BMM_CONTAINER_PROPERTY} rm_prop_def as rm_cont_prop_def and then
							attached $3 as ivl and then (ivl.interval.is_equal (rm_cont_prop_def.cardinality) or else
							ivl.interval.contains (rm_cont_prop_def.cardinality))
						then
							add_warning (ec_WCACA14, <<rm_attribute_name, parent_path_str, ivl.interval.as_string, rm_cont_prop_def.cardinality.as_string>>)
							$3 := Void
						end

						-- make the node
						create $$.make_multiple (rm_attribute_name, $2, $3)
						c_attrs.put ($$)
debug ("ADL_parse")
	io.put_string (indent + "PUSH create ATTR_NODE " + rm_attribute_name + "; container = " + $$.is_multiple.out)
	if attached $2 as att_ex then io.put_string (" existence={" + att_ex.as_string + "}") end
	if attached $3 as att_card then io.put_string ("; cardinality=(" + att_card.as_string + ")") end
	io.new_line
	io.put_string (indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_attribute (REL)%N") 
	indent.append ("%T")
end
						object_nodes.item.put_attribute ($$)

					elseif not attached $3 then
						-- for ADL 1.4 archetypes, remove existence and cardinality if it is a duplicate of the RM constraint
						if attached $2 as ivl and then ivl.is_equal (rm_prop_def.existence) then
							add_warning (ec_WCAEX14, <<rm_attribute_name, parent_path_str, ivl.as_string, rm_prop_def.existence.as_string>>)
							$2 := Void
						end

						-- make the node
						create $$.make_single (rm_attribute_name, $2)
						c_attrs.put ($$)
debug ("ADL_parse")
	io.put_string (indent + "PUSH create ATTR_NODE " + rm_attribute_name + "; container = " + $$.is_multiple.out) 
	if attached $2 as att_ex then io.put_string (" existence={" + att_ex.as_string + "}") end
	io.new_line
	io.put_string (indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_attribute (REL)%N") 
	indent.append ("%T")
end
						object_nodes.item.put_attribute ($$)
					else -- error - cardinality stated, but on a non-container attribute
						abort_with_error (ec_VSAM2, <<rm_attribute_name>>)
					end
				else
					abort_with_error (ec_VCARM, <<rm_attribute_name, object_nodes.item.path, object_nodes.item.rm_type_name>>)
				end
			else
				abort_with_error (ec_VCATU, <<rm_attribute_name>>)
			end
		}
	;

c_attr_values: c_object
		{
		}
	| c_attr_values c_object
		{
		} 
	| c_any	-- to allow a property to have any value
		{
		}
	;

c_includes: -- Empty
	| SYM_INCLUDE assertions
		{
			debug ("include list")
				io.put_string (indent + "[---assertion expression---] %N")
			end
			$$ := $2
		}
	;

c_excludes: -- Empty
	| SYM_EXCLUDE assertions
		{
			debug ("exclude list")
				io.put_string (indent + "[---assertion expression---] %N")
			end
			$$ := $2
		}
	;

----------------------------------------------------------
---------------------- ASSERTIONS ------------------------
----------------------------------------------------------

assertions: assertion
		{
			create $$.make (0)
			$$.extend ($1)
		}
	| assertions assertion
		{
			$1.extend ($2)
			$$ := $1
		}
	;

assertion: any_identifier ':' boolean_node
		{
			create $$.make ($3, $1)
		}
	| boolean_node
		{
			create $$.make ($1, Void)
		}
	-- 
	-- TODO: redesign path referencing mechanism for constraints on archetype
	-- elements outside the definition
	--
	| arch_outer_constraint_expr
		{
			create $$.make ($1, Void)
		}
	| any_identifier ':' error
		{
			abort_with_error (ec_SINVS, <<$1>>)
		}
	;

---------------------- expressions ---------------------

boolean_node: boolean_leaf
		{
			$$ := $1
		}
	| boolean_expr
		{
			$$ := $1
		}
	;
		
boolean_expr: boolean_unop_expr
		{
			debug ("ADL_invariant")
				io.put_string (indent + "boolean_expr: REDUCE from boolean_unop_expr: [" + $1.as_string + "]%N") 
			end
			$$ := $1
		}
	| boolean_binop_expr
		{
			$$ := $1
		}
	;
		
boolean_leaf: boolean_literal
		{
			$$ := $1
		}
	| boolean_constraint
		{
			debug ("ADL_invariant")
				io.put_string (indent + "boolean_leaf: REDUCE from boolean_constraint: [" + $1.as_string + "]%N") 
			end
			$$ := $1
		}
	| '(' boolean_node ')'
		{
			$$ := $2
		}
	| arithmetic_relop_expr
		{
			$$ := $1
		}
	;
		
--
-- the following form of expression has a relative path which is only allowed with Slot definitions.
-- The absolute path form is for assertions in the rules section
--
arch_outer_constraint_expr: V_REL_PATH SYM_MATCHES SYM_START_CBLOCK c_primitive_object SYM_END_CBLOCK
		{
			debug ("ADL_invariant")
				io.put_string (indent + "arch_outer_constraint_expr: Archetype outer feature " + $1 + " matches {" + $4.as_string + "}%N") 
			end
			create $$.make (create {OPERATOR_KIND}.make (op_matches),
				create {EXPR_LEAF}.make_archetype_ref ($1),
				create {EXPR_LEAF}.make_constraint ($4))
		}
	;

boolean_constraint: V_ABS_PATH SYM_MATCHES SYM_START_CBLOCK c_primitive_object SYM_END_CBLOCK
		{
			debug ("ADL_invariant")
				io.put_string (indent + "boolean_constraint:" + $1 + " matches {" + $4.as_string + "}%N") 
			end
			create $$.make (create {OPERATOR_KIND}.make (op_matches), 
				create {EXPR_LEAF}.make_archetype_definition_ref ($1),
				create {EXPR_LEAF}.make_constraint ($4))
		}
	| V_ABS_PATH SYM_MATCHES SYM_START_CBLOCK c_terminology_code SYM_END_CBLOCK
		{
			debug ("ADL_invariant")
				io.put_string (indent + "boolean_constraint:" + $1 + " matches {" + $4.as_string + "}%N") 
			end
			create $$.make (create {OPERATOR_KIND}.make (op_matches), 
				create {EXPR_LEAF}.make_archetype_definition_ref ($1),
				create {EXPR_LEAF}.make_coded_term ($4))
		}
	;

--
-- expressions with signature
--	OP BOOLEAN: BOOLEAN
--
boolean_unop_expr: SYM_EXISTS V_ABS_PATH
		{
			debug ("ADL_invariant")
				io.put_string (indent + "boolean_unop_expr: exists " + $2 + "%N") 
			end
			create $$.make (create {OPERATOR_KIND}.make (op_exists), create {EXPR_LEAF}.make_archetype_definition_ref ($2))
		}
	| SYM_NOT V_ABS_PATH
		{
			debug ("ADL_invariant")
				io.put_string (indent + "boolean_unop_expr: not " + $2 + "%N") 
			end
			create $$.make (create {OPERATOR_KIND}.make (op_not), create {EXPR_LEAF}.make_archetype_definition_ref ($2))
		}
	| SYM_NOT '(' boolean_node ')'
		{
			debug ("ADL_invariant")
				io.put_string (indent + "boolean_unop_expr: not [(" + $3.as_string + ")] %N") 
			end
			create $$.make (create {OPERATOR_KIND}.make (op_not), $3)
		}
	| SYM_EXISTS error 
		{
			abort_with_error (ec_SEXPT, Void)
		}
	;

--
-- expressions with signature
--	BOOLEAN OP BOOLEAN: BOOLEAN
--
boolean_binop_expr: boolean_node boolean_binop_symbol boolean_leaf
		{
			debug ("ADL_invariant")
				io.put_string (indent + "boolean_binop_expr: [" + $1.as_string + "] " + $2 + " [" + $3.as_string + "]%N") 
			end
			create $$.make (create {OPERATOR_KIND}.make (operator_ids_from_symbols.item ($2)), $1, $3)
		}
	;

boolean_binop_symbol: SYM_OR
		{
			$$ := operator_symbol (op_or)
		}
	| SYM_AND
		{
			$$ := operator_symbol (op_and)
		}
	| SYM_XOR
		{
			$$ := operator_symbol (op_xor)
		}
	| SYM_IMPLIES
		{
			$$ := operator_symbol (op_implies)
		}
	;

--
-- leaves with signature
--	BOOLEAN
--
boolean_literal: SYM_TRUE
		{
			create $$.make_boolean (True)
		}
	| SYM_FALSE
		{
			create $$.make_boolean (False)
		}
	;

--
-- expressions with signature
--	ARITHMETIC OP ARITHMETIC: BOOLEAN
--
arithmetic_relop_expr: arithmetic_node relational_binop_symbol arithmetic_node
		{
			debug ("ADL_invariant")
				io.put_string (indent + "arithmetic_relop_expr: [" + $1.as_string + "] " + $2 + " [" + $3.as_string + "]%N") 
			end
			create $$.make (create {OPERATOR_KIND}.make (operator_ids_from_symbols.item ($2)), $1, $3)
		}
	;

--
-- nodes with signature
--	ARITHMETIC
--
arithmetic_node: arithmetic_leaf
		{
			$$ := $1
		}
	| arithmetic_arith_binop_expr
		{
			$$ := $1
		}
	;

arithmetic_leaf: arithmetic_value
		{
			$$ := $1
		}
	| '(' arithmetic_node ')'
		{
			debug ("ADL_invariant")
				io.put_string (indent + "(expr) %N") 
			end
			$$ := $2
		}
	;

--
-- expressions with signature
--	ARITHMETIC OP ARITHMETIC: ARITHMETIC
--
arithmetic_arith_binop_expr: arithmetic_node arithmetic_binop_symbol arithmetic_leaf
		{
			debug ("ADL_invariant")
				io.put_string (indent + "arithmetic_arith_binop_expr: [" + $1.as_string + "] " + $2 + " [" + $3.as_string + "]%N") 
			end
			create $$.make (create {OPERATOR_KIND}.make (operator_ids_from_symbols.item ($2)), $1, $3)
		}
	;

--
-- leaves with signature
--	ARITHMETIC
--
arithmetic_value:  integer_value
		{
			debug ("ADL_invariant")
				io.put_string (indent + "arith_leaf - integer: " + $1.out + "%N") 
			end
			create $$.make_integer ($1)
		}
	| real_value
		{
			debug ("ADL_invariant")
				io.put_string (indent + "arith_leaf - real: " + $1.out + "%N") 
			end
			create $$.make_real ($1)
		}
	| V_ABS_PATH
		{
			debug ("ADL_invariant")
				io.put_string (indent + "arith_leaf - path: " + $1 + "%N") 
			end
			create $$.make_archetype_definition_ref ($1)
		}
	;

relational_binop_symbol: '='
		{
			$$ := operator_symbol (op_eq)
		}
	| SYM_NE
		{
			$$ := operator_symbol (op_ne)
		}
	| SYM_LE
		{
			$$ := operator_symbol (op_le)
		}
	| SYM_LT
		{
			$$ := operator_symbol (op_lt)
		}
	| SYM_GE
		{
			$$ := operator_symbol (op_ge)
		}
	| SYM_GT
		{
			$$ := operator_symbol (op_gt)
		}
	;

arithmetic_binop_symbol: '/'
		{
			$$ := operator_symbol (op_divide)
		}
	| '*'
		{
			$$ := operator_symbol (op_multiply)
		}
	| '+'
		{
			$$ := operator_symbol (op_plus)
		}
	| '-'
		{
			$$ := operator_symbol (op_minus)
		}
	| '^'
		{
			$$ := operator_symbol (op_exp)
		}
	;


---------------- existence, occurrences, cardinality ----------------

c_existence:  	-- empty is ok
	| SYM_EXISTENCE SYM_MATCHES SYM_START_CBLOCK existence SYM_END_CBLOCK	
		{
			$$ := $4
		}
	;

existence:  V_INTEGER -- can only be 0 or 1
		{
			if $1 = 0 then
				create $$.make_prohibited
			elseif $1 = 1 then
				create $$.make_mandatory
			else
				abort_with_error (ec_SEXLSG, Void)
			end
		}
	| V_INTEGER SYM_ELLIPSIS V_INTEGER -- can only be 0..0, 0..1, 1..1
		{
			if $1 = 0 then
				if $3 = 0 then
					create $$.make_point (0)
				elseif $3 = 1 then
					create $$.make_bounded (0, 1)
				else
					abort_with_error (ec_SEXLU1, Void)
				end
			elseif $1 = 1 then
				if $3 = 1 then
					create $$.make_point (1)
				else
					abort_with_error (ec_SEXLU2, Void)
				end
			else
				abort_with_error (ec_SEXLMG, Void)
			end
		}
	;

c_cardinality: -- empty is ok
	| SYM_CARDINALITY SYM_MATCHES SYM_START_CBLOCK cardinality SYM_END_CBLOCK	
		{
			$$ := $4
		}
	;

cardinality: multiplicity
		{
			create $$.make ($1)
		}
	| multiplicity ';' SYM_ORDERED
		{
			create $$.make ($1)
		}
	| multiplicity ';' SYM_UNORDERED
		{
			create $$.make ($1)
			$$.set_unordered
		}
	| multiplicity ';' SYM_UNIQUE
		{
			create $$.make ($1)
			$$.set_unique
		}
	| multiplicity ';' SYM_ORDERED ';' SYM_UNIQUE
		{
			create $$.make ($1)
			$$.set_unique
		}
	| multiplicity ';' SYM_UNORDERED ';' SYM_UNIQUE
		{
			create $$.make ($1)
			$$.set_unique
			$$.set_unordered
		}
	| multiplicity ';' SYM_UNIQUE ';' SYM_ORDERED
		{
			create $$.make ($1)
			$$.set_unique
		}
	| multiplicity ';' SYM_UNIQUE ';' SYM_UNORDERED
		{
			create $$.make ($1)
			$$.set_unique
			$$.set_unordered
		}
	;

c_occurrences:  -- empty is ok
	| SYM_OCCURRENCES SYM_MATCHES SYM_START_CBLOCK multiplicity SYM_END_CBLOCK	
		{
			$$ := $4
		}
	| SYM_OCCURRENCES error
		{
			abort_with_error (ec_SOCCF, Void)
		}
	;

multiplicity: integer_value
		{
			create $$.make_point ($1)
		}
	| '*'
		{
			create $$.make_upper_unbounded (0)
		}
	| V_INTEGER SYM_ELLIPSIS integer_value 
		{
			create $$.make_bounded ($1, $3)
		}
	| V_INTEGER SYM_ELLIPSIS '*' 
		{
			create $$.make_upper_unbounded ($1)
		}
	;

---------------------- leaf constraint types -----------------------

c_integer: integer_value
		{
			create $$.make_value ($1)
		}
	| integer_list
		{
			create $$.make_value_list ($1)
		}
	| integer_interval
		{
			create $$.make_interval ($1)
		}
	| integer_interval_list
		{
			create $$.make ($1)
		}
	| c_integer ';' integer_value
		{
			if $1.valid_value ($3) then
				$1.set_assumed_value ($3)
				$$ := $1
			else
				abort_with_error (ec_VOBAV, <<$3.out>>)
			end
		}
	| c_integer ';' error
		{
			abort_with_error (ec_SCIAV, Void)
		}
	;

c_real: real_value
		{
			create $$.make_value ($1)
		}
	| real_list
		{
			create $$.make_value_list ($1)
		}
	| real_interval
		{
			create $$.make_interval ($1)
		}
	| real_interval_list
		{
			create $$.make ($1)
		}
	| c_real ';' real_value
		{
			if $1.valid_value ($3) then
				$1.set_assumed_value ($3)
				$$ := $1
			else
				abort_with_error (ec_VOBAV, <<$3.out>>)
			end
		}
	| c_real ';' error
		{
			abort_with_error (ec_SCRAV, Void)
		}
	;

c_date: V_ISO8601_DATE_CONSTRAINT_PATTERN
		{
			if valid_iso8601_date_constraint_pattern ($1) then
				create $$.make_from_pattern ($1)
			else
				create str.make (0)
				from valid_date_constraint_patterns.start until valid_date_constraint_patterns.off loop
					if not valid_date_constraint_patterns.isfirst then
						str.append (", ")
					end
					str.append (valid_date_constraint_patterns.item)
					valid_date_constraint_patterns.forth
				end
				abort_with_error (ec_SCDPT, <<$1, str>>)
			end
		}
	| date_value
		{
			create $$.make_value ($1)
		}
	| date_list
		{
			create $$.make_value_list ($1)
		}
	| date_interval
		{
			create $$.make_interval ($1)
		}
	| date_interval_list
		{
			create $$.make ($1)
		}
	| c_date ';' date_value
		{
			if $1.valid_value ($3) then
				$1.set_assumed_value ($3)
				$$ := $1
			else
				abort_with_error (ec_VOBAV, <<$3.out>>)
			end
		}
	| c_date ';' error
		{
			abort_with_error (ec_SCDAV, Void)
		}
	;

c_time: V_ISO8601_TIME_CONSTRAINT_PATTERN
		{
			if valid_iso8601_time_constraint_pattern ($1) then
				create $$.make_from_pattern ($1)
			else
				create str.make (0)
				across valid_time_constraint_patterns as patterns_csr loop
					if patterns_csr.cursor_index > 1 then
						str.append (", ")
					end
					str.append (patterns_csr.item)
				end
				abort_with_error (ec_SCTPT, <<$1, str>>)
			end
		}
	| time_value
		{
			create $$.make_value ($1)
		}
	| time_list
		{
			create $$.make_value_list ($1)
		}
	| time_interval
		{
			create $$.make_interval ($1)
		}
	| time_interval_list
		{
			create $$.make ($1)
		}
	| c_time ';' time_value
		{
			if $1.valid_value ($3) then
				$1.set_assumed_value ($3)
				$$ := $1
			else
				abort_with_error (ec_VOBAV, <<$3.out>>)
			end
		}
	| c_time ';' error
		{
			abort_with_error (ec_SCTAV, Void)
		}
	;

c_date_time: V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
		{
			if valid_iso8601_date_time_constraint_pattern ($1) then
				create $$.make_from_pattern ($1)
			else
				create str.make (0)
				across valid_date_time_constraint_patterns as patterns_csr loop
					if patterns_csr.cursor_index > 1 then
						str.append (", ")
					end
					str.append (patterns_csr.item)
				end
				abort_with_error (ec_SCDTPT, <<$1, str>>)
			end
		}
	| date_time_value
		{
			create $$.make_value ($1)
		}
	| date_time_list
		{
			create $$.make_value_list ($1)
		}
	| date_time_interval
		{
			create $$.make_interval ($1)
		}
	| date_time_interval_list
		{
			create $$.make ($1)
		}
	| c_date_time ';' date_time_value
		{
			if $1.valid_value ($3) then
				$1.set_assumed_value ($3)
				$$ := $1
			else
				abort_with_error (ec_VOBAV, <<$3.out>>)
			end
		}
	| c_date_time ';' error
		{
			abort_with_error (ec_SCDTAV, Void)
		}
	;

c_duration: V_ISO8601_DURATION_CONSTRAINT_PATTERN '/' duration_interval
		{
			if valid_iso8601_duration_constraint_pattern ($1) then
				create $$.make_pattern_with_range ($1, $3)
			else
				abort_with_error (ec_SCDUPT, <<$1>>)
			end
		}
	| V_ISO8601_DURATION_CONSTRAINT_PATTERN
		{
			if valid_iso8601_duration_constraint_pattern ($1) then
				create $$.make_from_pattern ($1)
			else
				abort_with_error (ec_SCDUPT, <<$1>>)
			end
		}
	| duration_value
		{
			create $$.make_value ($1)
		}
	| duration_list
		{
			create $$.make_value_list ($1)
		}
	| duration_interval
		{
			create $$.make_interval ($1)
		}
	| duration_interval_list
		{
			create $$.make ($1)
		}
	| c_duration ';' duration_value
		{
			if $1.valid_value ($3) then
				$1.set_assumed_value ($3)
				$$ := $1
			else
				abort_with_error (ec_VOBAV, <<$3.out>>)
			end
		}
	| c_duration ';' error
		{
			abort_with_error (ec_SCDUAV, Void)
		}

	| V_ISO8601_DURATION_CONSTRAINT_PATTERN_ERR
		{
			abort_with_error (ec_SCDUPT, <<$1.out>>)
		}
	;

c_string: V_STRING 	-- single value, generates closed list
		{
			create $$.make_value ($1)
		}
	| string_list
		{
			create $$.make ($1)
		}
	| V_REGEXP -- regular expression with "//" or "^^" delimiters
		{
			create $$.make_value ($1)
			if $$.constraint.first.is_equal ({C_STRING}.Invalid_regex_message) then
				abort_with_error (ec_SCSRE, <<$1>>)
			end
		}
	| c_string ';' string_value
		{
			if $1.valid_value ($3) then
				$1.set_assumed_value ($3)
				$$ := $1
			else
				abort_with_error (ec_VOBAV, <<$3.out>>)
			end
		}
	| c_string ';' error
		{
			abort_with_error (ec_SCSAV, Void)
		}
	;

c_terminology_code: V_VALUE_SET_REF	-- e.g. "ac3"
		{
			create $$.make ($1)
		}
-------------------------------------------------------------------------------------------------------------
--- START Legacy ADL 1.4 inline term set
---
	| V_EXPANDED_VALUE_SET_DEF	
		{
			-- e.g. "local::at40"
			if $1.is_single then
				create $$.make ($1.codes.first)

			-- e.g. "local::at40, at41; at40"; we have to synthesise an ac-code and convert the inline to a separate value set
			else
				-- replace by ac-code ref and store value set for addition to terminology
				create $$.make (new_fake_ac_code)
				if attached $1.assumed_code as att_ac then
					$$.set_assumed_value (att_ac)
				end
				compiler_billboard.value_sets.put (create {VALUE_SET_RELATION}.make ($$.constraint, $1.codes), $$.constraint)
			end
		}
	| V_EXTERNAL_VALUE_SET_DEF	
		{
			-- the following statement generates an at-coded equivalent of the value-set just scanned, 
			-- and also the appropriate term_binding structure for it
			$1.convert_to_local (agent new_fake_at_code)

			-- e.g. "openehr::250"; here we have to synthesise an at-code and binding
			-- the at-code definition is synthesised later when the proper at-code is substituted
			if $1.is_single then
				-- first of all, if this is a specialised archetype, see if this external code has been seen in the parent, 
				-- and if there is an at-code and binding we can use
				if target_descriptor.is_specialised and then attached flat_ancestor as flat_anc and then
					flat_anc.terminology.has_term_binding_for_external_code ($1.terminology_id, $1.first_code) 
				then
					create $$.make (flat_anc.terminology.term_binding_key_for_external_code ($1.terminology_id, $1.first_code))

				-- may already have been encountered in this archetype
				elseif attached compiler_billboard.binding_code_map.item ($1.first_code) as att_at_code then
					create $$.make (att_at_code)

				else
					-- otherwise we use the synthesised code
					check attached $1.last_converted_local as att_tcps then
						create $$.make (att_tcps.first_code)
					end

					-- add a binding to be processed by the parse post-processor
					if not compiler_billboard.term_bindings.has ($1.terminology_id.as_lower) then
						compiler_billboard.term_bindings.put (create {HASH_TABLE [URI, STRING]}.make (0), $1.terminology_id.as_lower)
					end
					check attached compiler_billboard.term_bindings.item ($1.terminology_id) as att_bindings_for_terminology and then
						attached $1.last_converted_local_bindings as att_b
					then
						att_bindings_for_terminology.merge (att_b)
						if attached $1.last_converted_binding_map as att_bmap then
							compiler_billboard.binding_code_map.merge (att_bmap)
						end
					end
				end
				
			-- e.g. "openehr::250, 251, 249"; here we have to synthesise at-codes and bindings and value set
			-- the at-code definitions are synthesised later when the proper at-codes are substituted
			else
				create $$.make (new_fake_ac_code)

				-- if this is a specialised archetype, see if this external code has been seen in the parent, 
				-- if so, the at-codes and bindings are inherited, we only have to re-construct the value set def
				if target_descriptor.is_specialised and then attached flat_ancestor as flat_anc and then
					flat_anc.terminology.has_term_binding_for_external_code ($1.terminology_id, $1.first_code) 
				then
					create at_codes.make (0)
					across $1.codes as ext_code_csr loop
						if flat_anc.terminology.has_term_binding_for_external_code ($1.terminology_id, ext_code_csr.item) then
							at_codes.extend (flat_anc.terminology.term_binding_key_for_external_code ($1.terminology_id, ext_code_csr.item))
						end
					end
					compiler_billboard.value_sets.put (create {VALUE_SET_RELATION}.make ($$.constraint, at_codes), $$.constraint)
				else
					if attached $1.last_converted_local as att_tcps then
						if attached att_tcps.assumed_code as att_ac then
							$$.set_assumed_value (att_ac)
						end
						compiler_billboard.value_sets.put (create {VALUE_SET_RELATION}.make ($$.constraint, att_tcps.codes), $$.constraint)
					end

					-- add term bindings
					if not compiler_billboard.term_bindings.has ($1.terminology_id.as_lower) then
						compiler_billboard.term_bindings.put (create {HASH_TABLE [URI, STRING]}.make (0), $1.terminology_id.as_lower)
					end
					check attached compiler_billboard.term_bindings.item ($1.terminology_id.as_lower) as att_bindings_for_terminology and then
						attached $1.last_converted_local_bindings as att_b
					then
						att_bindings_for_terminology.merge (att_b)
					end
				end
			end
		}
---
--- END Legacy ADL 1.4 inline term set
-------------------------------------------------------------------------------------------------------------
	| ERR_VALUE_SET_MISSING_CODES
		{
			abort_with_error (ec_STVSI, <<err_str, c_attrs.item.path>>)
		}
	| ERR_VALUE_SET_DEF_DUP_CODE
		{
			abort_with_error (ec_STCDC, <<err_str, c_attrs.item.path>>)
		}
	| ERR_VALUE_SET_DEF_ASSUMED
		{
			abort_with_error (ec_STCAC, <<err_str, c_attrs.item.path>>)
		}
	| ERR_VALUE_SET_DEF
		{
			abort_with_error (ec_STCV, <<c_attrs.item.path>>)
		}
	;

c_boolean: SYM_TRUE
		{
			create $$.make_true
		}
	| SYM_FALSE 
		{
			create $$.make_false
		}
	| boolean_list
		{
			create $$.make ($1)
		}
	| c_boolean ';' boolean_value
		{
			if $1.valid_value ($3) then
				$1.set_assumed_value ($3)
			else
				abort_with_error (ec_VOBAV, <<$3.out>>)
			end
			$$ := $1
		}
	| c_boolean ';' error
		{
			abort_with_error (ec_SCBAV, Void)
		}
	;

----------------------------------------------------------------------------------------
--
-- LEGACY ADL 1.4 Ordinal Syntax; converted here to C_ATTRIBUTE_TUPLE structure
--

c_ordinal: ordinal
		{
			create $$.make ("DV_ORDINAL", new_fake_node_id)

			-- create a C_ATTR_TUPLE and connect the received C_OBJ_TUPLE to it
			$$.put_attribute_tuple (create {C_ATTRIBUTE_TUPLE}.make)

			-- create 'value' C_ATTRIBUTE and attach both to C_C_O and to C_ATTR_TUPLE
			$$.put_attribute (create {C_ATTRIBUTE}.make_single ("value", Void))
			$$.attribute_tuples.first.put_member ($$.attribute_with_name ("value"))
			create ordinal_integer.make_value ($1.value)
			$$.attribute_with_name ("value").put_child (ordinal_integer)

			-- create 'symbol' C_ATTRIBUTE and attach both to C_C_O and to C_ATTR_TUPLE
			$$.put_attribute (create {C_ATTRIBUTE}.make_single ("symbol", Void))
			$$.attribute_tuples.first.put_member ($$.attribute_with_name ("symbol"))
			create ordinal_symbol.make ($1.symbol)
			$$.attribute_with_name ("symbol").put_child (ordinal_symbol)

			-- add object tuple and connect between C_ATTRIBUTE_TUPLE and C_P_Os
			$$.attribute_tuples.first.add_tuple
			$$.attribute_tuples.first.tuples.last.put_member (ordinal_integer)
			$$.attribute_tuples.first.tuples.last.put_member (ordinal_symbol)
		}
	| c_ordinal ',' ordinal
		{
			$$ := $1

			if $$.attribute_with_name ("value").children.there_exists (
					agent (co: C_OBJECT; a_val: INTEGER): BOOLEAN
						do
							Result := attached {C_INTEGER} co as ci and then ci.valid_value (a_val)
						end (?, $3.value)
				)
			then
				abort_with_error (ec_VCOV, <<$3.value.out>>)

			elseif $$.attribute_with_name ("symbol").children.there_exists (
					agent (co: C_OBJECT; a_sym: TERMINOLOGY_CODE): BOOLEAN
						do
							Result := attached {C_TERMINOLOGY_CODE} co as ctc and then ctc.valid_value (a_sym)
						end (?, create {TERMINOLOGY_CODE}.make (Local_terminology_id, $3.symbol))
				)
			then
				abort_with_error (ec_VCOC, <<$3.symbol>>)

			else
				create ordinal_integer.make_value ($3.value)
				$$.attribute_with_name ("value").put_child (ordinal_integer)
				create ordinal_symbol.make ($3.symbol)
				$$.attribute_with_name ("symbol").put_child (ordinal_symbol)

				-- add object tuple and connect between C_ATTRIBUTE_TUPLE and C_P_Os
				$$.attribute_tuples.first.add_tuple
				$$.attribute_tuples.first.tuples.last.put_member (ordinal_integer)
				$$.attribute_tuples.first.tuples.last.put_member (ordinal_symbol)

			end
		}
 	| c_ordinal ';' integer_value
 		{
			$$ := $1

			-- assumed value for C_DV_ORDINAL not supported
			add_warning (ec_WDTOAV, Void)
 		}
 	| c_ordinal ';' error
 		{
			abort_with_error (ec_SCOAV, Void)
 		}
	;

ordinal: integer_value SYM_INTERVAL_DELIM V_EXPANDED_VALUE_SET_DEF
		{
			create $$.make ($1, $3.first_code)
		}
	| integer_value SYM_INTERVAL_DELIM ERR_VALUE_SET_DEF
		{
			abort_with_error (ec_STCV, <<c_attrs.item.path>>)
		}
	;

--
-- END LEGACY ADL 1.4 Ordinal Syntax; converted here to C_ATTRIBUTE_TUPLE structure
--
----------------------------------------------------------------------------------------

any_identifier: type_identifier
		{
			$$ := $1
		}
	| V_ATTRIBUTE_IDENTIFIER
		{
			$$ := $1
		}
	;
		
type_identifier: V_TYPE_IDENTIFIER
		{
			$$ := $1
		}
	| V_GENERIC_TYPE_IDENTIFIER
		{
			$$ := $1
		}
	;

-----------------------------------------------------------------
----------------- TAKEN FROM ODIN_VALIDATOR.Y -------------------
-----------------        DO NOT MODIFY        -------------------
-----------------------------------------------------------------
---------------------- BASIC DATA VALUES -----------------------


string_value: V_STRING
		{
			$$ := $1
		}
	;

string_list: V_STRING ',' V_STRING
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| string_list ',' V_STRING
		{
			$1.extend($3)
			$$ := $1
		}
	--
	-- FIXME: the following only for badly formed lists with superfluous continue marks
	--
	| string_list ',' SYM_LIST_CONTINUE
		{
			$$ := $1
		}
	| V_STRING ',' SYM_LIST_CONTINUE
		{
			create $$.make (0)
			$$.extend ($1)
		}
	;

integer_value: V_INTEGER {
			$$ := $1
		}
	| '+' V_INTEGER {
			$$ := $2
		}
	| '-' V_INTEGER {
			$$ := - $2
		}
	;

integer_list: integer_value ',' integer_value
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| integer_list ',' integer_value
		{
			$1.extend($3)
			$$ := $1
		}
	| integer_value ',' SYM_LIST_CONTINUE
		{
			create $$.make(0)
			$$.extend($1)
		}
	;

integer_interval: SYM_INTERVAL_DELIM integer_value SYM_ELLIPSIS integer_value SYM_INTERVAL_DELIM
		{
			if $2 <= $4 then
				create {PROPER_INTERVAL [INTEGER]} $$.make_bounded($2, $4, True, True)
			else
				abort_with_error (ec_VIVLO, <<$2.out, $4.out>>)
			end
		}
	| SYM_INTERVAL_DELIM SYM_GT integer_value SYM_ELLIPSIS integer_value SYM_INTERVAL_DELIM
		{
			if $3 <= $5 then
				create {PROPER_INTERVAL [INTEGER]} $$.make_bounded($3, $5, False, True)
			else
				abort_with_error (ec_VIVLO, <<$3.out, $5.out>>)
			end
		}
	| SYM_INTERVAL_DELIM integer_value SYM_ELLIPSIS SYM_LT integer_value SYM_INTERVAL_DELIM
		{
			if $2 <= $5 then
				create {PROPER_INTERVAL [INTEGER]} $$.make_bounded($2, $5, True, False)
			else
				abort_with_error (ec_VIVLO, <<$2.out, $5.out>>)
			end
		}
	| SYM_INTERVAL_DELIM SYM_GT integer_value SYM_ELLIPSIS SYM_LT integer_value SYM_INTERVAL_DELIM
		{
			if $3 <= $6 then
				create {PROPER_INTERVAL [INTEGER]} $$.make_bounded ($3, $6, False, False)
			else
				abort_with_error (ec_VIVLO, <<$3.out, $6.out>>)
			end
		}
	| SYM_INTERVAL_DELIM SYM_LT integer_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [INTEGER]} $$.make_lower_unbounded ($3, False)
		}
	| SYM_INTERVAL_DELIM SYM_LE integer_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [INTEGER]} $$.make_lower_unbounded ($3, True)
		}
	| SYM_INTERVAL_DELIM SYM_GT integer_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [INTEGER]} $$.make_upper_unbounded ($3, False)
		}
	| SYM_INTERVAL_DELIM SYM_GE integer_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [INTEGER]} $$.make_upper_unbounded ($3, True)
		}
	| SYM_INTERVAL_DELIM integer_value SYM_INTERVAL_DELIM
		{
			create {POINT_INTERVAL [INTEGER]} $$.make ($2)
		}
	;

integer_interval_list: integer_interval ',' integer_interval
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| integer_interval_list ',' integer_interval
		{
			$1.extend($3)
			$$ := $1
		}
	| integer_interval ',' SYM_LIST_CONTINUE
		{
			create $$.make(0)
			$$.extend($1)
		}
	;

real_value: V_REAL 
		{
			$$ := $1
		}
	| '+' V_REAL %prec UNARY_MINUS
		{
			$$ := $2
		}
	| '-' V_REAL %prec UNARY_MINUS
		{
			$$ := - $2
		}
	;

real_list: real_value ',' real_value
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| real_list ',' real_value
		{
			$1.extend($3)
			$$ := $1
		}
	| real_value ',' SYM_LIST_CONTINUE
		{
			create $$.make(0)
			$$.extend($1)
		}
	;

real_interval: SYM_INTERVAL_DELIM real_value SYM_ELLIPSIS real_value SYM_INTERVAL_DELIM
		{
			if $2 <= $4 then
				create {PROPER_INTERVAL [REAL]} $$.make_bounded($2, $4, True, True)
			else
				abort_with_error (ec_VIVLO, <<$2.out, $4.out>>)
			end
		}
	| SYM_INTERVAL_DELIM SYM_GT real_value SYM_ELLIPSIS real_value SYM_INTERVAL_DELIM
		{
			if $3 <= $5 then
				create {PROPER_INTERVAL [REAL]} $$.make_bounded($3, $5, False, True)
			else
				abort_with_error (ec_VIVLO, <<$3.out, $5.out>>)
			end
		}
	| SYM_INTERVAL_DELIM real_value SYM_ELLIPSIS SYM_LT real_value SYM_INTERVAL_DELIM
		{
			if $2 <= $5 then
				create {PROPER_INTERVAL [REAL]} $$.make_bounded($2, $5, True, False)
			else
				abort_with_error (ec_VIVLO, <<$2.out, $5.out>>)
			end
		}
	| SYM_INTERVAL_DELIM SYM_GT real_value SYM_ELLIPSIS SYM_LT real_value SYM_INTERVAL_DELIM
		{
			if $3 <= $6 then
				create {PROPER_INTERVAL [REAL]} $$.make_bounded($3, $6, False, False)
			else
				abort_with_error (ec_VIVLO, <<$3.out, $6.out>>)
			end
		}
	| SYM_INTERVAL_DELIM SYM_LT real_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [REAL]} $$.make_lower_unbounded($3, False)
		}
	| SYM_INTERVAL_DELIM SYM_LE real_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [REAL]} $$.make_lower_unbounded($3, True)
		}
	| SYM_INTERVAL_DELIM SYM_GT real_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [REAL]} $$.make_upper_unbounded($3, False)
		}
	| SYM_INTERVAL_DELIM SYM_GE real_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [REAL]} $$.make_upper_unbounded($3, True)
		}
	| SYM_INTERVAL_DELIM real_value SYM_INTERVAL_DELIM
		{
			create {POINT_INTERVAL [REAL]} $$.make($2)
		}
	;

real_interval_list: real_interval ',' real_interval
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| real_interval_list ',' real_interval
		{
			$1.extend($3)
			$$ := $1
		}
	| real_interval ',' SYM_LIST_CONTINUE
		{
			create $$.make(0)
			$$.extend($1)
		}
	;

boolean_value: SYM_TRUE
		{
			$$ := True
		}
	| SYM_FALSE
		{
			$$ := False
		}
	;

boolean_list: boolean_value ',' boolean_value
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| boolean_list ',' boolean_value
		{
			$1.extend($3)
			$$ := $1
		}
	| boolean_value ',' SYM_LIST_CONTINUE
		{
			create $$.make(0)
			$$.extend($1)
		}
	;

date_value: V_ISO8601_EXTENDED_DATE -- in ISO8601 form yyyy-MM-dd
		{
			if valid_iso8601_date($1) then
				create $$.make_from_string($1)
			else
				abort_with_error (ec_VIDV, <<$1>>)
			end
		}
	;

date_list: date_value ',' date_value
		{
			create $$.make(0)
			$$.extend ($1)
			$$.extend ($3)
		}
	| date_list ',' date_value
		{
			$1.extend ($3)
			$$ := $1
		}
	| date_value ',' SYM_LIST_CONTINUE
		{
			create $$.make(0)
			$$.extend ($1)
		}
	;

date_interval: SYM_INTERVAL_DELIM date_value SYM_ELLIPSIS date_value SYM_INTERVAL_DELIM
		{
			if $2 <= $4 then
				create {PROPER_INTERVAL [ISO8601_DATE]} $$.make_bounded($2, $4, True, True)
			else
				abort_with_error (ec_VIVLO, <<$2.out, $4.out>>)
			end
		}
	| SYM_INTERVAL_DELIM SYM_GT date_value SYM_ELLIPSIS date_value SYM_INTERVAL_DELIM
		{
			if $3 <= $5 then
				create {PROPER_INTERVAL [ISO8601_DATE]} $$.make_bounded($3, $5, False, True)
			else
				abort_with_error (ec_VIVLO, <<$3.out, $5.out>>)
			end
		}
	| SYM_INTERVAL_DELIM date_value SYM_ELLIPSIS SYM_LT date_value SYM_INTERVAL_DELIM
		{
			if $2 <= $5 then
				create {PROPER_INTERVAL [ISO8601_DATE]} $$.make_bounded($2, $5, True, False)
			else
				abort_with_error (ec_VIVLO, <<$2.out, $5.out>>)
			end
		}
	| SYM_INTERVAL_DELIM SYM_GT date_value SYM_ELLIPSIS SYM_LT date_value SYM_INTERVAL_DELIM
		{
			if $3 <= $6 then
				create {PROPER_INTERVAL [ISO8601_DATE]} $$.make_bounded($3, $6, False, False)
			else
				abort_with_error (ec_VIVLO, <<$3.out, $6.out>>)
			end
		}
	| SYM_INTERVAL_DELIM SYM_LT date_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [ISO8601_DATE]} $$.make_lower_unbounded($3, False)
		}
	| SYM_INTERVAL_DELIM SYM_LE date_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [ISO8601_DATE]} $$.make_lower_unbounded($3, True)
		}
	| SYM_INTERVAL_DELIM SYM_GT date_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [ISO8601_DATE]} $$.make_upper_unbounded($3, False)
		}
	| SYM_INTERVAL_DELIM SYM_GE date_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [ISO8601_DATE]} $$.make_upper_unbounded($3, True)
		}
	| SYM_INTERVAL_DELIM date_value SYM_INTERVAL_DELIM
		{
			create {POINT_INTERVAL [ISO8601_DATE]} $$.make ($2)
		}
	;

date_interval_list: date_interval ',' date_interval
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| date_interval_list ',' date_interval
		{
			$1.extend($3)
			$$ := $1
		}
	| date_interval ',' SYM_LIST_CONTINUE
		{
			create $$.make(0)
			$$.extend($1)
		}
	;

time_value: V_ISO8601_EXTENDED_TIME
		{
			if valid_iso8601_time($1) then
				create $$.make_from_string($1)
			else
				abort_with_error (ec_VITV, <<$1>>)
			end
		}
	;

time_list: time_value ',' time_value
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| time_list ',' time_value
		{
			$1.extend($3)
			$$ := $1
		}
	| time_value ',' SYM_LIST_CONTINUE
		{
			create $$.make(0)
			$$.extend($1)
		}
	;

time_interval: SYM_INTERVAL_DELIM time_value SYM_ELLIPSIS time_value SYM_INTERVAL_DELIM
		{
			if $2 <= $4 then
				create {PROPER_INTERVAL [ISO8601_TIME]} $$.make_bounded($2, $4, True, True)
			else
				abort_with_error (ec_VIVLO, <<$2.out, $4.out>>)
			end
		}
	| SYM_INTERVAL_DELIM SYM_GT time_value SYM_ELLIPSIS time_value SYM_INTERVAL_DELIM
		{
			if $3 <= $5 then
				create {PROPER_INTERVAL [ISO8601_TIME]} $$.make_bounded($3, $5, False, True)
			else
				abort_with_error (ec_VIVLO, <<$3.out, $5.out>>)
			end
		}
	| SYM_INTERVAL_DELIM time_value SYM_ELLIPSIS SYM_LT time_value SYM_INTERVAL_DELIM
		{
			if $2 <= $5 then
				create {PROPER_INTERVAL [ISO8601_TIME]} $$.make_bounded($2, $5, True, False)
			else
				abort_with_error (ec_VIVLO, <<$2.out, $5.out>>)
			end
		}
	| SYM_INTERVAL_DELIM SYM_GT time_value SYM_ELLIPSIS SYM_LT time_value SYM_INTERVAL_DELIM
		{
			if $3 <= $6 then
				create {PROPER_INTERVAL [ISO8601_TIME]} $$.make_bounded($3, $6, False, False)
			else
				abort_with_error (ec_VIVLO, <<$3.out, $6.out>>)
			end
		}
	| SYM_INTERVAL_DELIM SYM_LT time_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [ISO8601_TIME]} $$.make_lower_unbounded($3, False)
		}
	| SYM_INTERVAL_DELIM SYM_LE time_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [ISO8601_TIME]} $$.make_lower_unbounded($3, True)
		}
	| SYM_INTERVAL_DELIM SYM_GT time_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [ISO8601_TIME]} $$.make_upper_unbounded($3, False)
		}
	| SYM_INTERVAL_DELIM SYM_GE time_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [ISO8601_TIME]} $$.make_upper_unbounded($3, True)
		}
	| SYM_INTERVAL_DELIM time_value SYM_INTERVAL_DELIM
		{
			create {POINT_INTERVAL [ISO8601_TIME]} $$.make ($2)
		}
	;

time_interval_list: time_interval ',' time_interval
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| time_interval_list ',' time_interval
		{
			$1.extend($3)
			$$ := $1
		}
	| time_interval ',' SYM_LIST_CONTINUE
		{
			create $$.make(0)
			$$.extend($1)
		}
	;

date_time_value: V_ISO8601_EXTENDED_DATE_TIME
		{
			if valid_iso8601_date_time($1) then
				create $$.make_from_string($1)
			else
				abort_with_error (ec_VIDTV, <<$1>>)
			end
		}
	;

date_time_list: date_time_value ',' date_time_value
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| date_time_list ',' date_time_value
		{
			$1.extend($3)
			$$ := $1
		}
	| date_time_value ',' SYM_LIST_CONTINUE
		{
			create $$.make(0)
			$$.extend($1)
		}
	;

date_time_interval: SYM_INTERVAL_DELIM date_time_value SYM_ELLIPSIS date_time_value  SYM_INTERVAL_DELIM
		{
			if $2 <= $4 then
				create {PROPER_INTERVAL [ISO8601_DATE_TIME]} $$.make_bounded($2, $4, True, True)
			else
				abort_with_error (ec_VIVLO, <<$2.out, $4.out>>)
			end
		}
	| SYM_INTERVAL_DELIM SYM_GT date_time_value SYM_ELLIPSIS date_time_value SYM_INTERVAL_DELIM
		{
			if $3 <= $5 then
				create {PROPER_INTERVAL [ISO8601_DATE_TIME]} $$.make_bounded($3, $5, False, True)
			else
				abort_with_error (ec_VIVLO, <<$3.out, $5.out>>)
			end
		}
	| SYM_INTERVAL_DELIM date_time_value SYM_ELLIPSIS SYM_LT date_time_value SYM_INTERVAL_DELIM
		{
			if $2 <= $5 then
				create {PROPER_INTERVAL [ISO8601_DATE_TIME]} $$.make_bounded($2, $5, True, False)
			else
				abort_with_error (ec_VIVLO, <<$2.out, $5.out>>)
			end
		}
	| SYM_INTERVAL_DELIM SYM_GT date_time_value SYM_ELLIPSIS SYM_LT date_time_value SYM_INTERVAL_DELIM
		{
			if $3 <= $6 then
				create {PROPER_INTERVAL [ISO8601_DATE_TIME]} $$.make_bounded($3, $6, False, False)
			else
				abort_with_error (ec_VIVLO, <<$3.out, $6.out>>)
			end
		}
	| SYM_INTERVAL_DELIM SYM_LT date_time_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} $$.make_lower_unbounded($3, False)
		}
	| SYM_INTERVAL_DELIM SYM_LE date_time_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} $$.make_lower_unbounded($3, True)
		}
	| SYM_INTERVAL_DELIM SYM_GT date_time_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} $$.make_upper_unbounded($3, False)
		}
	| SYM_INTERVAL_DELIM SYM_GE date_time_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} $$.make_upper_unbounded($3, True)
		}
	| SYM_INTERVAL_DELIM date_time_value SYM_INTERVAL_DELIM
		{
			create {POINT_INTERVAL [ISO8601_DATE_TIME]} $$.make ($2)
		}
	;

date_time_interval_list: date_time_interval ',' date_time_interval
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| date_time_interval_list ',' date_time_interval
		{
			$1.extend($3)
			$$ := $1
		}
	| date_time_interval ',' SYM_LIST_CONTINUE
		{
			create $$.make(0)
			$$.extend($1)
		}
	;

duration_value: V_ISO8601_DURATION
		{
			if valid_iso8601_duration($1) then
				create $$.make_from_string($1)
			else
				abort_with_error (ec_VIDUV, <<$1>>)
			end
		}
	;

duration_list: duration_value ',' duration_value
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| duration_list ',' duration_value
		{
			$1.extend($3)
			$$ := $1
		}
	| duration_value ',' SYM_LIST_CONTINUE
		{
			create $$.make(0)
			$$.extend($1)
		}
	;

duration_interval: SYM_INTERVAL_DELIM duration_value SYM_ELLIPSIS duration_value SYM_INTERVAL_DELIM
		{
			if $2 <= $4 then
				create {PROPER_INTERVAL [ISO8601_DURATION]} $$.make_bounded($2, $4, True, True)
			else
				abort_with_error (ec_VIVLO, <<$2.out, $4.out>>)
			end
		}
	| SYM_INTERVAL_DELIM SYM_GT duration_value SYM_ELLIPSIS duration_value SYM_INTERVAL_DELIM
		{
			if $3 <= $5 then
				create {PROPER_INTERVAL [ISO8601_DURATION]} $$.make_bounded($3, $5, False, True)
			else
				abort_with_error (ec_VIVLO, <<$3.out, $5.out>>)
			end
		}
	| SYM_INTERVAL_DELIM duration_value SYM_ELLIPSIS SYM_LT duration_value SYM_INTERVAL_DELIM
		{
			if $2 <= $5 then
				create {PROPER_INTERVAL [ISO8601_DURATION]} $$.make_bounded($2, $5, True, False)
			else
				abort_with_error (ec_VIVLO, <<$2.out, $5.out>>)
			end
		}
	| SYM_INTERVAL_DELIM SYM_GT duration_value SYM_ELLIPSIS SYM_LT duration_value SYM_INTERVAL_DELIM
		{
			if $3 <= $6 then
				create {PROPER_INTERVAL [ISO8601_DURATION]} $$.make_bounded($3, $6, False, False)
			else
				abort_with_error (ec_VIVLO, <<$3.out, $6.out>>)
			end
		}
	| SYM_INTERVAL_DELIM SYM_LT duration_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [ISO8601_DURATION]} $$.make_lower_unbounded($3, False)
		}
	| SYM_INTERVAL_DELIM SYM_LE duration_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [ISO8601_DURATION]} $$.make_lower_unbounded($3, True)
		}
	| SYM_INTERVAL_DELIM SYM_GT duration_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [ISO8601_DURATION]} $$.make_upper_unbounded($3, False)
		}
	| SYM_INTERVAL_DELIM SYM_GE duration_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [ISO8601_DURATION]} $$.make_upper_unbounded($3, True)
		}
	| SYM_INTERVAL_DELIM duration_value SYM_INTERVAL_DELIM
		{
			create {POINT_INTERVAL [ISO8601_DURATION]} $$.make ($2)
		}
	;

duration_interval_list: duration_interval ',' duration_interval
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| duration_interval_list ',' duration_interval
		{
			$1.extend($3)
			$$ := $1
		}
	| duration_interval ',' SYM_LIST_CONTINUE
		{
			create $$.make(0)
			$$.extend($1)
		}
	;

-----------------------------------------------------------------
------------- END TAKEN FROM ODIN_VALIDATOR.Y -------------------
-----------------------------------------------------------------

%%

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

			if an_attr.has_child_with_id (an_obj.node_id) then
				err_code := ec_VCOSU
			elseif an_attr.is_single then
				if an_obj.occurrences /= Void and then (an_obj.occurrences.upper_unbounded or an_obj.occurrences.upper > 1) then
					err_code := ec_VACSO
				else
					Result := True
				end
			elseif an_attr.is_multiple then
				if (an_attr.cardinality /= Void and then not an_attr.cardinality.interval.upper_unbounded) and 
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

	c_dv_q_prop_code: STRING
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

	ordinal_integer: C_INTEGER
		attribute
			create Result.default_create
		end

	ordinal_symbol: C_TERMINOLOGY_CODE
		attribute
			create Result.default_create
		end

end
