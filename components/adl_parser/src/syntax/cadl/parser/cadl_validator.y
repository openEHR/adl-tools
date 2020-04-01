%{
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
%}

%token <STRING> V_ARCHETYPE_ID
%token <INTEGER> V_INTEGER 
%token <REAL> V_REAL 
%token <STRING> V_TYPE_IDENTIFIER V_GENERIC_TYPE_IDENTIFIER V_ATTRIBUTE_IDENTIFIER V_FEATURE_CALL_IDENTIFIER V_STRING
%token <STRING> V_LOCAL_CODE V_LOCAL_TERM_CODE_REF V_QUALIFIED_TERM_CODE_REF V_TERM_CODE_CONSTRAINT
%token <STRING> V_REGEXP
%token <STRING> V_ABS_PATH V_REL_PATH
%token <CHARACTER> V_CHARACTER
%token <STRING> V_URI
%token <STRING> V_ISO8601_EXTENDED_DATE V_ISO8601_EXTENDED_TIME V_ISO8601_EXTENDED_DATE_TIME V_ISO8601_DURATION
%token <STRING> V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN V_ISO8601_TIME_CONSTRAINT_PATTERN
%token <STRING> V_ISO8601_DATE_CONSTRAINT_PATTERN V_ISO8601_DURATION_CONSTRAINT_PATTERN
%token <C_DOMAIN_TYPE> V_C_DOMAIN_TYPE

%token SYM_START_CBLOCK SYM_END_CBLOCK	-- constraint block

%token SYM_ANY -- used outside of parser & scanner

%token SYM_INTERVAL_DELIM
%token SYM_TRUE SYM_FALSE 
%token SYM_THEN SYM_ELSE

%token SYM_EXISTENCE SYM_OCCURRENCES SYM_CARDINALITY 
%token SYM_UNORDERED SYM_ORDERED SYM_UNIQUE SYM_ELLIPSIS SYM_LIST_CONTINUE
%token SYM_INVARIANT SYM_MATCHES SYM_USE_ARCHETYPE SYM_ALLOW_ARCHETYPE SYM_USE_NODE 
%token SYM_INCLUDE SYM_EXCLUDE
%token SYM_AFTER SYM_BEFORE SYM_CLOSED

%token ERR_CHARACTER ERR_STRING ERR_C_DOMAIN_TYPE ERR_TERM_CODE_CONSTRAINT ERR_V_QUALIFIED_TERM_CODE_REF ERR_V_ISO8601_DURATION

%left SYM_IMPLIES
%left SYM_OR SYM_XOR
%left SYM_AND
%left SYM_EXISTS SYM_FORALL SYM_NOT
%left '=' SYM_NE SYM_LT SYM_GT SYM_LE SYM_GE SYM_MATCHES
%left '+' '-'
%left '*' '/' SYM_DIV SYM_MODULO
%left UNARY_MINUS
%left '^'

%type <ARRAYED_LIST [ASSERTION]> assertions c_includes c_excludes

%type <STRING> type_identifier
%type <OG_PATH> absolute_path relative_path
%type <INTEGER> cardinality_limit_value
%type <INTERVAL[INTEGER]> c_occurrences c_existence occurrence_spec
%type <C_PRIMITIVE_OBJECT> c_primitive_object
%type <C_PRIMITIVE> c_primitive
%type <EXPR_ITEM> boolean_expression boolean_node boolean_leaf
%type <EXPR_ITEM> arithmetic_expression arithmetic_node arithmetic_leaf
%type <CARDINALITY> c_cardinality

%type <INTEGER> integer_value
%type <REAL> real_value
%type <BOOLEAN> boolean_value
%type <CHARACTER> character_value
%type <ISO8601_DATE> date_value
%type <ISO8601_DATE_TIME> date_time_value
%type <ISO8601_TIME> time_value
%type <ISO8601_DURATION> duration_value
%type <CODE_PHRASE> term_code
%type <STRING> any_identifier
%type <STRING> string_value
%type <URI> uri_value
%type <OG_PATH_ITEM> path_segment

%type <ARRAYED_LIST[STRING]> string_list_value
%type <ARRAYED_LIST[INTEGER]> integer_list_value
%type <ARRAYED_LIST[REAL]> real_list_value
%type <ARRAYED_LIST[CHARACTER_REF]> character_list_value
%type <ARRAYED_LIST[BOOLEAN_REF]> boolean_list_value
%type <ARRAYED_LIST[ISO8601_DATE]> date_list_value
%type <ARRAYED_LIST[ISO8601_TIME]> time_list_value
%type <ARRAYED_LIST[ISO8601_DATE_TIME]> date_time_list_value
%type <ARRAYED_LIST[ISO8601_DURATION]> duration_list_value
%type <ARRAYED_LIST[CODE_PHRASE]> term_code_list_value

%type <INTERVAL[INTEGER]> integer_interval_value
%type <INTERVAL[REAL]> real_interval_value
%type <INTERVAL[ISO8601_TIME]> time_interval_value
%type <INTERVAL[ISO8601_DATE]> date_interval_value
%type <INTERVAL[ISO8601_DATE_TIME]> date_time_interval_value
%type <INTERVAL[ISO8601_DURATION]> duration_interval_value

%%

input: c_complex_object
		{
			debug("ADL_parse")
				io.put_string("CADL definition parsed%N")
			end

			accept
		}
	| assertions
		{
			debug("ADL_parse")
				io.put_string("assertion definition parsed%N")
			end

			accept
		}
	| error
		{
			debug("ADL_parse")
				io.put_string("CADL definition NOT parsed%N")
			end
			abort
		}
	;

c_complex_object: c_complex_object_head SYM_MATCHES SYM_START_CBLOCK c_complex_object_body SYM_END_CBLOCK
		{ 
			debug("ADL_parse")
				io.put_string(indent + "POP OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "]%N") 
				indent.remove_tail(1)
			end
			object_nodes.remove
		}
	;

c_complex_object_head: c_complex_object_id c_occurrences 
		{
			complex_obj.set_occurrences($2)

			debug("ADL_parse")
				io.put_string(indent + "PUSH create OBJECT_NODE " + complex_obj.rm_type_name + 
						" [id=" + complex_obj.node_id + "]; occurrences=(" + $2.as_string + ")%N") 
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
		}
	;

c_complex_object_id: type_identifier
		{
			create complex_obj.make_anonymous($1)
		}
	| type_identifier V_LOCAL_TERM_CODE_REF
		{
			create complex_obj.make_identified($1, $2)
		}
	;

c_complex_object_body: c_any -- used to indicate that any value of a type is ok
		{
			debug("ADL_parse")
				io.put_string(indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + 
					" [id=" + object_nodes.item.node_id + "] - any_allowed%N") 
			end
		}
	| c_attributes			
		{
		}
	;



------------------------- node types -----------------------

c_object: c_complex_object 
		{
		}
	| archetype_internal_ref 
		{
		}
	| archetype_slot
		{
			debug("ADL_parse")
				io.put_string(indent + "ARCHETYPE_SLOT " + archetype_slot.rm_type_name + " [id=" + archetype_slot.node_id + "]%N") 
			end
		}
	| constraint_ref
		{
			debug("ADL_parse")
				io.put_string(indent + "ATTR_NODE " + c_attrs.item.rm_attribute_name + " put_child(constraint_ref LEAF_OBJ)%N") 
			end
			c_attrs.item.put_child(constraint_ref)
		}
	| c_code_phrase
		{
			debug("ADL_parse")
				io.put_string(indent + "ATTR_NODE " + c_attrs.item.rm_attribute_name + " put_child(c_code_phrase LEAF_OBJ)%N") 
			end
			c_attrs.item.put_child(c_code_phrase_obj)
		}
	| c_ordinal 
		{
			debug("ADL_parse")
				io.put_string(indent + "ATTR_NODE " + c_attrs.item.rm_attribute_name + " put_child(c_ordinal LEAF_OBJ)%N") 
			end
			c_attrs.item.put_child(ordinal_node)
			ordinal_node := Void
		}
	| c_primitive_object
		{
			debug("ADL_parse")
				io.put_string(indent + "ATTR_NODE " + c_attrs.item.rm_attribute_name + " put_child(c_primitive LEAF_OBJ)%N") 
			end
			c_attrs.item.put_child(c_prim_obj)
		}
	| V_C_DOMAIN_TYPE
		{
			debug("ADL_parse")
				io.put_string(indent + "ATTR_NODE " + c_attrs.item.rm_attribute_name + " put_child(c_domain_type)%N") 
			end
			c_attrs.item.put_child(c_domain_type)
		}
	| ERR_C_DOMAIN_TYPE
		{
			raise_error
			report_error("invalid dADL section; error: " + dadl_parser_error)
			abort
		}
	| error		
		{
			raise_error
			report_error("expecting a new node definition, primitive node definition, 'use' path, or 'archetype' reference")
			abort
		}
	;

archetype_internal_ref: SYM_USE_NODE type_identifier c_occurrences absolute_path 
		{
			create archetype_internal_ref.make($2, $4.as_string)
			if not c_occurrences_default then
				archetype_internal_ref.set_occurrences($3)
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
		}
	| SYM_USE_NODE type_identifier error 
		{
			raise_error
			report_error("expecting absolute path")
			abort
		}
	;

archetype_slot: c_archetype_slot_head SYM_MATCHES SYM_START_CBLOCK c_includes c_excludes SYM_END_CBLOCK
		{
			if $4 /= Void then
				archetype_slot.set_includes($4)
			end
			if $5 /= Void then
				archetype_slot.set_excludes($5)
			end

			debug("ADL_parse")
				io.put_string(indent + "POP ARCHETYPE_SLOT " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "]%N") 
				indent.remove_tail(1)
			end
		}
	;

c_archetype_slot_head: c_archetype_slot_id c_occurrences 
		{
			archetype_slot.set_occurrences($2)

			debug("ADL_parse")
				io.put_string(indent + "PUSH create ARCHETYPE_SLOT " + archetype_slot.rm_type_name + " [id=" + archetype_slot.node_id + "]; occurrences=(" + $2.as_string + ")%N") 
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
		}
	;

c_archetype_slot_id: SYM_ALLOW_ARCHETYPE type_identifier
		{
			create archetype_slot.make_anonymous($2)
		}
	| SYM_ALLOW_ARCHETYPE type_identifier V_LOCAL_TERM_CODE_REF
		{
			create archetype_slot.make_identified($2, $3)
		}
	| SYM_ALLOW_ARCHETYPE error
		{
			raise_error
			report_error("error after 'use_archetype' keyword; expecting Object node definition")
			abort
		}
	;

c_primitive_object: c_primitive
		{
			create c_prim_obj.make($1)
			$$ := c_prim_obj
		}
	;

c_primitive: c_integer 
		{
			debug("ADL_parse")
				io.put_string(indent + "C_INTEGER: " +  c_integer.as_string + "%N")
			end
			$$ := c_integer
		}
	| c_real
		{
			debug("ADL_parse")
				io.put_string(indent + "C_REAL: " +  c_real.as_string + "%N")
			end
			$$ := c_real
		}
	| c_date
		{
			debug("ADL_parse")
				io.put_string(indent + "C_DATE: " +  c_date.as_string + "%N")
			end
			$$ := c_date
		}
	| c_time
		{
			debug("ADL_parse")
				io.put_string(indent + "C_TIME: " +  c_time.as_string + "%N")
			end
			$$ := c_time
		}
	| c_date_time
		{
			debug("ADL_parse")
				io.put_string(indent + "C_DATE_TIME: " +  c_date_time.as_string + "%N")
			end
			$$ := c_date_time
		}
	| c_duration
		{
			debug("ADL_parse")
				io.put_string(indent + "C_DURATION: " +  c_duration.as_string + "%N")
			end
			$$ := c_duration
		}
	| c_string
		{
			debug("ADL_parse")
				io.put_string(indent + "C_STRING: " +  c_string.as_string + "%N")
			end
			$$ := c_string
		}
	| c_boolean
		{
			debug("ADL_parse")
				io.put_string(indent + "C_BOOLEAN: " +  c_boolean.as_string + "%N")
			end
			$$ := c_boolean
		}
	;

c_any: '*' 
		{
		}
	;

---------------- BODY - relationships ----------------

c_attributes: c_attribute			
		{
		}
	| c_attributes c_attribute		
		{
		}
	;

c_attribute: c_attr_head SYM_MATCHES SYM_START_CBLOCK c_attr_values SYM_END_CBLOCK	
		{
			debug("ADL_parse")
				io.put_string(indent + "POP ATTR_NODE " + c_attrs.item.rm_attribute_name + "%N") 
				indent.remove_tail(1)
			end
			c_attrs.remove
		}
	| c_attr_head SYM_MATCHES SYM_START_CBLOCK error SYM_END_CBLOCK	
		{
			raise_error
			report_error("expecting a 'any' node, 'leaf' node, or new node definition")
			abort
		}
	;

c_attr_head: V_ATTRIBUTE_IDENTIFIER c_existence
		{
			rm_attribute_name := $1

			if not object_nodes.item.has_attribute(rm_attribute_name) then
				create attr_node.make_single(rm_attribute_name)
				attr_node.set_existence($2)
				c_attrs.put(attr_node)
				debug("ADL_parse")
					io.put_string(indent + "PUSH create ATTR_NODE " + attr_node.rm_attribute_name + " existence=(" + $2.as_string + ")%N") 
				

					io.put_string(indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_child(REL)%N") 
					indent.append("%T")
				end

				object_nodes.item.put_attribute(attr_node)
			else
				raise_error
				report_error("duplicate attribute " + rm_attribute_name)
				abort
			end
		}
	| V_ATTRIBUTE_IDENTIFIER c_existence c_cardinality
		{
			rm_attribute_name := $1

			if not object_nodes.item.has_attribute(rm_attribute_name) then
				create attr_node.make_multiple(rm_attribute_name, $3)
				attr_node.set_existence($2)
				c_attrs.put(attr_node)
				debug("ADL_parse")
					io.put_string(indent + "PUSH create ATTR_NODE " + attr_node.rm_attribute_name + " existence=(" + $2.as_string + "); cardinality=(" + $3.as_string + ")%N") 
				

					io.put_string(indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_child(REL)%N") 
					indent.append("%T")
				end

				object_nodes.item.put_attribute(attr_node)
			else
				raise_error
				report_error("duplicate attribute " + rm_attribute_name)
				abort
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
			debug("ADL_parse")
				io.put_string(indent + "ATTR_NODE " + attr_node.rm_attribute_name + "  - any_allowed%N") 
			end
		}
	;


c_includes: -- Empty
	| SYM_INCLUDE assertions
		{
			debug("include list")
				io.put_string(indent + "[---assertion expression---] %N")
			end
			$$ := assertion_list
			assertion_list := Void
		}
	;

c_excludes: -- Empty
	| SYM_EXCLUDE assertions
		{
			debug("exclude list")
				io.put_string(indent + "[---assertion expression---] %N")
			end
			$$ := assertion_list
			assertion_list := Void
		}
	;

----------------------------------------------------------
---------------------- ASSERTIONS ------------------------
----------------------------------------------------------

assertions: assertion
		{
			if assertion_list = Void then 
				create assertion_list.make(0)
			end
			assertion_list.extend(assertion)
		}
	| assertions assertion
		{
			assertion_list.extend(assertion)
		}
	;

assertion: any_identifier ':' boolean_expression
		{
			create assertion.make($3, $1)
		}
	| boolean_expression
		{
			create assertion.make($1, Void)
		}
	| any_identifier ':' error
		{
			raise_error
			report_error("illegal invariant expression at identifier " + $1)
			abort
		}
	;

---------------------- expressions ---------------------

boolean_expression: boolean_leaf
		{
			$$ := $1
		}
	| boolean_node
		{
			$$ := $1
		}
	;

boolean_node: SYM_EXISTS absolute_path
		{
			debug("ADL_invariant")
				io.put_string(indent + "Exists " + $2.as_string + "%N") 
			end
			create expr_unary_operator.make(create {OPERATOR_KIND}.make(op_exists))
			create expr_leaf.make_archetype_definition_ref($2.as_string)
			expr_unary_operator.set_operand(expr_leaf)
			$$ := expr_unary_operator
		}
	| SYM_EXISTS error 
		{
			raise_error
			report_error("expecting absolute path")
			abort
		}
	| relative_path SYM_MATCHES SYM_START_CBLOCK c_primitive SYM_END_CBLOCK
		{
			debug("ADL_invariant")
				io.put_string(indent + "Archetype feature matches {" + $4.as_string + "}%N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_matches))
			expr_binary_operator.set_left_operand(create {EXPR_LEAF}.make_archetype_ref($1.as_string))
			expr_binary_operator.set_right_operand(create {EXPR_LEAF}.make_constraint($4))
			$$ := expr_binary_operator
		}
	| SYM_NOT boolean_leaf
		{
			debug("ADL_invariant")
				io.put_string(indent + "NOT bool_leaf %N") 
			end
			create expr_unary_operator.make(create {OPERATOR_KIND}.make(op_not))
			expr_unary_operator.set_operand($2)
			$$ := expr_unary_operator
		}
	| arithmetic_expression '=' arithmetic_expression
		{
			debug("ADL_invariant")
				io.put_string(indent + "arith_expr = arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_eq))
			expr_binary_operator.set_left_operand($1)
			expr_binary_operator.set_right_operand($3)
			$$ := expr_binary_operator
		}
	| arithmetic_expression SYM_NE arithmetic_expression
		{
			debug("ADL_invariant")
				io.put_string(indent + "arith_expr != arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_ne))
			expr_binary_operator.set_left_operand($1)
			expr_binary_operator.set_right_operand($3)
			$$ := expr_binary_operator
		}
	| arithmetic_expression SYM_LT arithmetic_expression
		{
			debug("ADL_invariant")
				io.put_string(indent + "arith_expr < arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_lt))
			expr_binary_operator.set_left_operand($1)
			expr_binary_operator.set_right_operand($3)
			$$ := expr_binary_operator
		}
	| arithmetic_expression SYM_GT arithmetic_expression
		{
			debug("ADL_invariant")
				io.put_string(indent + "arith_expr > arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_gt))
			expr_binary_operator.set_left_operand($1)
			expr_binary_operator.set_right_operand($3)
			$$ := expr_binary_operator
		}
	| arithmetic_expression SYM_LE arithmetic_expression
		{
			debug("ADL_invariant")
				io.put_string(indent + "arith_expr <= arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_le))
			expr_binary_operator.set_left_operand($1)
			expr_binary_operator.set_right_operand($3)
			$$ := expr_binary_operator
		}
	| arithmetic_expression SYM_GE arithmetic_expression
		{
			debug("ADL_invariant")
				io.put_string(indent + "arith_expr >= arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_ge))
			expr_binary_operator.set_left_operand($1)
			expr_binary_operator.set_right_operand($3)
			$$ := expr_binary_operator
		}
	| boolean_expression SYM_AND boolean_expression
		{
			debug("ADL_invariant")
				io.put_string(indent + "bool_expr AND bool_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_and))
			expr_binary_operator.set_left_operand($1)
			expr_binary_operator.set_right_operand($3)
			$$ := expr_binary_operator
		}
	| boolean_expression SYM_OR boolean_expression
		{
			debug("ADL_invariant")
				io.put_string(indent + "bool_expr OR bool_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_or))
			expr_binary_operator.set_left_operand($1)
			expr_binary_operator.set_right_operand($3)
			$$ := expr_binary_operator
		}
	| boolean_expression SYM_XOR boolean_expression
		{
			debug("ADL_invariant")
				io.put_string(indent + "bool_expr XOR bool_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_xor))
			expr_binary_operator.set_left_operand($1)
			expr_binary_operator.set_right_operand($3)
			$$ := expr_binary_operator
		}
	| boolean_expression SYM_IMPLIES boolean_expression
		{
			debug("ADL_invariant")
				io.put_string(indent + "bool_expr IMPLIES bool_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_implies))
			expr_binary_operator.set_left_operand($1)
			expr_binary_operator.set_right_operand($3)
			$$ := expr_binary_operator
		}
	;

boolean_leaf: '(' boolean_expression ')'
		{
			$$ := $2
		}
	| SYM_TRUE
		{
			create expr_leaf.make_boolean(True)
			$$ := expr_leaf
		}
	| SYM_FALSE
		{
			create expr_leaf.make_boolean(False)
			$$ := expr_leaf
		}
	;

arithmetic_expression: arithmetic_leaf
		{
			$$ := $1
		}
	| arithmetic_node
		{
			$$ := $1
		}
	;

arithmetic_node: arithmetic_expression '+' arithmetic_leaf
		{
			debug("ADL_invariant")
				io.put_string(indent + "arith_expr + arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_plus))
			expr_binary_operator.set_left_operand($1)
			expr_binary_operator.set_right_operand($3)
			$$ := expr_binary_operator
		}
	| arithmetic_expression '-' arithmetic_leaf
		{
			debug("ADL_invariant")
				io.put_string(indent + "arith_expr - arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_minus))
			expr_binary_operator.set_left_operand($1)
			expr_binary_operator.set_right_operand($3)
			$$ := expr_binary_operator
		}
	| arithmetic_expression '*' arithmetic_leaf
		{
			debug("ADL_invariant")
				io.put_string(indent + "arith_expr * arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_multiply))
			expr_binary_operator.set_left_operand($1)
			expr_binary_operator.set_right_operand($3)
			$$ := expr_binary_operator
		}
	| arithmetic_expression '/' arithmetic_leaf
		{
			debug("ADL_invariant")
				io.put_string(indent + "arith_expr / arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_divide))
			expr_binary_operator.set_left_operand($1)
			expr_binary_operator.set_right_operand($3)
			$$ := expr_binary_operator
		}
	| arithmetic_expression '^' arithmetic_leaf
		{
			debug("ADL_invariant")
				io.put_string(indent + "arith_expr ^ arith_leaf %N") 
			end
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_exp))
			expr_binary_operator.set_left_operand($1)
			expr_binary_operator.set_right_operand($3)
			$$ := expr_binary_operator
		}
	;

arithmetic_leaf:  '(' arithmetic_expression ')'
		{
			debug("ADL_invariant")
				io.put_string(indent + "arith_leaf - (expr) %N") 
			end
			$$ := $2
		}
	| integer_value
		{
			debug("ADL_invariant")
				io.put_string(indent + "arith_leaf - integer: " + $1.out + "%N") 
			end
			create expr_leaf.make_integer($1)
			$$ := expr_leaf
		}
	| real_value
		{
			debug("ADL_invariant")
				io.put_string(indent + "arith_leaf - real: " + $1.out + "%N") 
			end
			create expr_leaf.make_real($1)
			$$ := expr_leaf
		}
	| absolute_path
		{
			debug("ADL_invariant")
				io.put_string(indent + "arith_leaf - path: " + $1.as_string + "%N") 
			end
			create expr_leaf.make_archetype_definition_ref($1.as_string)
			$$ := expr_leaf
		}
	;

--------------------------------------------------------------------------------------------------
--------------- THE FOLLOWING SOURCE TAKEN FROM OG_PATH_VALIDATOR.Y - DO NOT MODIFY  -------------
--------------- except to remove movable_path ----------------------------------------------------
--------------------------------------------------------------------------------------------------

absolute_path: '/'
		{
			create $$.make_root
			debug("OG_PATH_parse")
				io.put_string("....absolute_path (root); %N")
			end
		}
	|'/' relative_path
		{
			$$ := $2
			$$.set_absolute
			debug("OG_PATH_parse")
				io.put_string("....absolute_path; %N")
			end
		}
	| absolute_path '/' relative_path
		{
			$$ := $1
			$$.append_path($3)
			debug("OG_PATH_parse")
				io.put_string("....absolute_path (appended relative path); %N")
			end
		}
	;

relative_path: path_segment
		{
			create $$.make_relative($1)
		}
	| relative_path '/' path_segment
		{
			$$ := $1
			$$.append_segment($3)
		}
	;

path_segment: V_ATTRIBUTE_IDENTIFIER V_LOCAL_TERM_CODE_REF
		{
			create $$.make_with_object_id($1, $2)
			debug("OG_PATH_parse")
				io.put_string("...path_segment: " + $1 + "[" + $2 + "]%N")
			end
		}
	| V_ATTRIBUTE_IDENTIFIER
		{
			create $$.make($1)
			debug("OG_PATH_parse")
				io.put_string("...path_segment: " + $1 + "%N")
			end
		}
	;

--------------------------------------------------------------------------------------------------
-------------------------------- END SOURCE TAKEN FROM OG_PATH_VALIDATOR.Y ----------------------
--------------------------------------------------------------------------------------------------


---------------- existence, occurrences, cardinality ----------------

c_existence:  	-- default to 1..1
		{
			int_interval := default_existence
			$$ := int_interval
		}
	| SYM_EXISTENCE SYM_MATCHES SYM_START_CBLOCK existence_spec SYM_END_CBLOCK	
		{
			$$ := int_interval
		}
	;

existence_spec:  V_INTEGER -- can only be 0 or 1
		{
			if $1 = 0 then
				create int_interval.make_point(0)
			elseif $1 = 1 then
				create int_interval.make_point(1)
			else
				raise_error
				report_error("In existence; expecting 0 or 1")
				abort
			end
		}
	| V_INTEGER SYM_ELLIPSIS V_INTEGER -- can only be 0..0, 0..1, 1..1
		{
			if $1 = 0 then
				if $3 = 0 then
					create int_interval.make_point(0)
				elseif $3 = 1 then
					create int_interval.make_bounded(0, 1, True, True)
				else
					raise_error
					report_error("In existence; upper value must be 0 or 1")
					abort
				end
			elseif $1 = 1 then
				if $3 = 1 then
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
		}
	;

c_cardinality: SYM_CARDINALITY SYM_MATCHES SYM_START_CBLOCK cardinality_spec SYM_END_CBLOCK	
		{
			$$ := cardinality
		}
	;

cardinality_spec: occurrence_spec
		{
			create cardinality.make(int_interval)
		}
	| occurrence_spec ';' SYM_ORDERED
		{
			create cardinality.make(int_interval)
		}
	| occurrence_spec ';' SYM_UNORDERED
		{
			create cardinality.make(int_interval)
			cardinality.set_unordered
		}
	| occurrence_spec ';' SYM_UNIQUE
		{
			create cardinality.make(int_interval)
			cardinality.set_unique
		}
	| occurrence_spec ';' SYM_ORDERED ';' SYM_UNIQUE
		{
			create cardinality.make(int_interval)
			cardinality.set_unique
		}
	| occurrence_spec ';' SYM_UNORDERED ';' SYM_UNIQUE
		{
			create cardinality.make(int_interval)
			cardinality.set_unique
			cardinality.set_unordered
		}
	| occurrence_spec ';' SYM_UNIQUE ';' SYM_ORDERED
		{
			create cardinality.make(int_interval)
			cardinality.set_unique
		}
	| occurrence_spec ';' SYM_UNIQUE ';' SYM_UNORDERED
		{
			create cardinality.make(int_interval)
			cardinality.set_unique
			cardinality.set_unordered
		}
	;

cardinality_limit_value: integer_value 
		{
			$$ := $1
		}
	| '*' 
		{
			cardinality_limit_pos_infinity := True
		}
	;

c_occurrences:  -- default to 1..1 
		{
			int_interval := default_occurrences
			$$ := int_interval
			c_occurrences_default := True
		}
	| SYM_OCCURRENCES SYM_MATCHES SYM_START_CBLOCK occurrence_spec SYM_END_CBLOCK	
		{
			$$ := $4
			c_occurrences_default := False
		}
	| SYM_OCCURRENCES error
		{
			raise_error
			report_error("expecting an 'occurrences expression', e.g. 'occurrences matches {n..m}'")
			abort
		}
	;

occurrence_spec: cardinality_limit_value 	-- single integer or '*'
		{
			if not cardinality_limit_pos_infinity then
				create int_interval.make_point($1)
			else
				create int_interval.make_upper_unbounded(0, True)
				cardinality_limit_pos_infinity := False
			end
			$$ := int_interval
		}
	| V_INTEGER SYM_ELLIPSIS cardinality_limit_value 
		{
			if cardinality_limit_pos_infinity then
				create int_interval.make_upper_unbounded($1, True)
				cardinality_limit_pos_infinity := False
			else
				create int_interval.make_bounded($1, $3, True, True)
			end
			$$ := int_interval
		}
	;

---------------------- leaf constraint types -----------------------

c_integer_spec: integer_value
		{
			create int_list.make(0)
			int_list.extend($1)
			create c_integer.make_list(int_list)
		}
	| integer_list_value
		{
			create c_integer.make_list($1)
		}
	| integer_interval_value
		{
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
		}
	;

c_integer: c_integer_spec
	| c_integer_spec ';' integer_value
		{
			if c_integer.valid_value($3) then
				c_integer.set_assumed_value($3)
			else
				raise_error
				report_error("assumed value " + $3.out + " not inside constraint")
				abort
			end
		}
	| c_integer_spec ';' error
		{
			raise_error
			report_error("invalid assumed value; must be an integer")
			abort
		}
	;

c_real_spec: real_value
		{
			create real_list.make(0)
			real_list.extend($1)
			create c_real.make_list(real_list)
		}
	| real_list_value
		{
			create c_real.make_list($1)
		}
	| real_interval_value
		{
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
		}
	;

c_real: c_real_spec
	| c_real_spec ';' real_value
		{
			if c_real.valid_value($3) then
				c_real.set_assumed_value($3)
			else
				raise_error
				report_error("assumed value " + $3.out + " not inside constraint")
				abort
			end
		}
	| c_real_spec ';' error
		{
			raise_error
			report_error("invalid assumed value; must be a real number")
			abort
		}
	;

c_date_constraint: V_ISO8601_DATE_CONSTRAINT_PATTERN
		{
			if valid_iso8601_date_constraint_pattern($1) then
				create c_date.make_from_pattern($1)
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
		}
	| date_value
		{
			create date_interval.make_point($1)
			create c_date.make_interval(date_interval)
		}
	| date_interval_value
		{
			create c_date.make_interval(date_interval)
		}
	;

c_date: c_date_constraint
	| c_date_constraint ';' date_value
		{
			if c_date.valid_value($3) then
				c_date.set_assumed_value($3)
			else
				raise_error
				report_error("assumed value " + $3.out + " not inside constraint")
				abort
			end
		}
	| c_date_constraint ';' error
		{
			raise_error
			report_error("invalid assumed value; must be valid ISO8601 date")
			abort
		}
	;

c_time_constraint: V_ISO8601_TIME_CONSTRAINT_PATTERN
		{
			if valid_iso8601_time_constraint_pattern($1) then
				create c_time.make_from_pattern($1)
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
		}
	| time_value
		{
			create time_interval.make_point($1)
			create c_time.make_interval(time_interval)
		}
	| time_interval_value
		{
			create c_time.make_interval(time_interval)
		}
	;

c_time: c_time_constraint
	| c_time_constraint ';' time_value
		{
			if c_time.valid_value($3) then
				c_time.set_assumed_value($3)
			else
				raise_error
				report_error("assumed value " + $3.out + " not inside constraint")
				abort
			end
		}
	| c_time_constraint ';' error
		{
			raise_error
			report_error("invalid assumed value; must be valid ISO8601 time")
			abort
		}
	;

c_date_time_constraint: V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
		{
			if valid_iso8601_date_time_constraint_pattern($1) then
				create c_date_time.make_from_pattern($1)
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
		}
	| date_time_value
		{
			create date_time_interval.make_point($1)
			create c_date_time.make_interval(date_time_interval)
		}
	| date_time_interval_value
		{
			create c_date_time.make_interval(date_time_interval)
		}
	;

c_date_time: c_date_time_constraint
	| c_date_time_constraint ';' date_time_value
		{
			if c_date_time.valid_value($3) then
				c_date_time.set_assumed_value($3)
			else
				raise_error
				report_error("assumed value " + $3.out + " not inside constraint")
				abort
			end
		}
	| c_date_time_constraint ';' error
		{
			raise_error
			report_error("invalid assumed value; must be valid ISO8601 date_time")
			abort
		}
	;

c_duration_constraint: duration_pattern
	| duration_pattern '/' duration_interval_value
		{
			create c_duration.make_pattern_with_interval (c_duration.pattern, duration_interval)
		}
	| duration_value
		{
			create duration_interval.make_point($1)
			create c_duration.make_interval(duration_interval)
		}
	| duration_interval_value
		{
			create c_duration.make_interval(duration_interval)
		}
	;

duration_pattern: V_ISO8601_DURATION_CONSTRAINT_PATTERN
		{
			if valid_iso8601_duration_constraint_pattern ($1) then
				create c_duration.make_from_pattern ($1)
			else
				raise_error
				report_error ("invalid duration constraint pattern; legal pattern: P[Y|y][M|m][W|w][D|d][T[H|h][M|m][S|s]] or P[W|w]")
				abort
			end
		}
	;

c_duration: c_duration_constraint
	| c_duration_constraint ';' duration_value
		{
			if c_duration.valid_value($3) then
				c_duration.set_assumed_value($3)
			else
				raise_error
				report_error("assumed value " + $3.out + " not inside constraint")
				abort
			end
		}
	| c_duration_constraint ';' error
		{
			raise_error
			report_error("invalid assumed value; must be valid ISO8601 duration")
			abort
		}
	;

c_string_spec:  V_STRING 	-- single value, generates closed list
		{
			create string_list.make(0)
			string_list.extend($1)
			create c_string.make_from_string_list(string_list)
			string_list := Void
		}
	| string_list_value	-- closed list
		{
			create c_string.make_from_string_list($1)
		}
	| string_list_value ',' SYM_LIST_CONTINUE -- open list
		{
			create c_string.make_from_string_list($1)
			c_string.set_open
		}
	| V_REGEXP -- regular expression with "//" or "^^" delimiters
		{
			create c_string.make_from_regexp($1.substring (2, $1.count - 1), $1.item(1) = '/')
			if c_string.regexp.is_equal(c_string.regexp_compile_error) then
				raise_error
				report_error("Regular expression compile error " + $1 + " is not a valid regular expression")
				abort
			end
		}
	;

c_string: c_string_spec
	| c_string_spec ';' string_value
		{
			if c_string.valid_value($3) then
				c_string.set_assumed_value($3)
			else
				raise_error
				report_error("assumed value " + $3.out + " not inside constraint")
				abort
			end
		}
	| c_string_spec ';' error
		{
			raise_error
			report_error("invalid assumed value; must be a string")
			abort
		}
	;

c_boolean_spec: SYM_TRUE
		{
			create c_boolean.make_true
		}
	| SYM_FALSE 
		{
			create c_boolean.make_false
		}
	| SYM_TRUE ',' SYM_FALSE 
		{
			create c_boolean.make_true_false
		}
	| SYM_FALSE ',' SYM_TRUE 
		{
			create c_boolean.make_true_false
		}
	;

c_boolean: c_boolean_spec
	| c_boolean_spec ';' boolean_value
		{
			if c_boolean.valid_value($3) then
				c_boolean.set_assumed_value($3)
			else
				raise_error
				report_error("assumed value " + $3.out + " not inside constraint")
				abort
			end
		}
	| c_boolean_spec ';' error
		{
			raise_error
			report_error("invalid assumed value; must be %"True%" or %"False%"")
			abort
		}
	;

c_ordinal: c_ordinal_spec
 	| c_ordinal_spec ';' integer_value
 		{
			if ordinal_node.has_item ($3) then
				ordinal_node.set_assumed_value_from_integer ($3)
			else
				raise_error
				report_error ("invalid assumed value " + $3.out + " not in list")
				abort
			end
 		}
 	| c_ordinal_spec ';' error
 		{
 			raise_error
 			report_error ("invalid assumed value; must be an ordinal integer value")
 			abort
 		}
	;

c_ordinal_spec: ordinal
	| c_ordinal_spec ',' ordinal
	;

ordinal: integer_value SYM_INTERVAL_DELIM V_QUALIFIED_TERM_CODE_REF
		{
			if ordinal_node = Void then
				create ordinal_node.make
			end

			create a_code_phrase.make_from_string ($3)
			create an_ordinal.make ($1, a_code_phrase)

			if ordinal_node.has_code_phrase (a_code_phrase) then
				raise_error
				report_error ("invalid ordinal constraint: duplicated code term " + $3)
				abort
			else
				ordinal_node.add_item (an_ordinal)
			end
		}
	;

c_code_phrase: V_TERM_CODE_CONSTRAINT	-- e.g. "[local::at0040, at0041; at0040]"
		{
			create c_code_phrase_obj

			if c_code_phrase_obj.valid_pattern ($1) then
				c_code_phrase_obj.make_from_pattern ($1)
			else
				raise_error
				report_error ("invalid term code constraint: " + c_code_phrase_obj.fail_reason)
				abort
			end
		}
	| V_QUALIFIED_TERM_CODE_REF
		{
			create c_code_phrase_obj.make_from_pattern($1)
		}
	;
 
constraint_ref: V_LOCAL_TERM_CODE_REF	-- e.g. "ac0003"
		{
			create constraint_ref.make($1)
		}
	;

any_identifier: type_identifier
		{
			$$ := $1
		}
	| V_ATTRIBUTE_IDENTIFIER
		{
			$$ := $1
		}
	;
		
-----------------------------------------------------------------
----------------- TAKEN FROM DADL_VALIDATOR.Y -------------------
-----------------        DO NOT MODIFY        -------------------
-----------------------------------------------------------------
---------------------- BASIC DATA VALUES -----------------------

type_identifier: '(' V_TYPE_IDENTIFIER ')'
		{
			$$ := $2
		}
	| '(' V_GENERIC_TYPE_IDENTIFIER ')'
		{
			$$ := $2
		}
	| V_TYPE_IDENTIFIER
		{
			$$ := $1
		}
	| V_GENERIC_TYPE_IDENTIFIER
		{
			$$ := $1
		}
	;

string_value: V_STRING
		{
			$$ := $1
		}
	;

string_list_value: V_STRING ',' V_STRING
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| string_list_value ',' V_STRING
		{
			$1.extend($3)
			$$ := $1
		}
	| V_STRING ',' SYM_LIST_CONTINUE
		{
			create $$.make(0)
			$$.extend($1)
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

integer_list_value: integer_value ',' integer_value
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| integer_list_value ',' integer_value
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

integer_interval_value: SYM_INTERVAL_DELIM integer_value SYM_ELLIPSIS integer_value SYM_INTERVAL_DELIM
		{
			if $2 <= $4 then
				create integer_interval.make_bounded($2, $4, True, True)
				$$ := integer_interval
			else
				raise_error
				report_error("Invalid interval: " + $2.out + " must be <= " + $4.out)
				abort
			end
		}
	| SYM_INTERVAL_DELIM SYM_GT integer_value SYM_ELLIPSIS integer_value SYM_INTERVAL_DELIM
		{
			if $3 <= $5 then
				create integer_interval.make_bounded($3, $5, False, True)
				$$ := integer_interval
			else
				raise_error
				report_error("Invalid interval: " + $3.out + " must be <= " + $5.out)
				abort
			end
		}
	| SYM_INTERVAL_DELIM integer_value SYM_ELLIPSIS SYM_LT integer_value SYM_INTERVAL_DELIM
		{
			if $2 <= $5 then
				create integer_interval.make_bounded($2, $5, True, False)
				$$ := integer_interval
			else
				raise_error
				report_error("Invalid interval: " + $2.out + " must be <= " + $5.out)
				abort
			end
		}
	| SYM_INTERVAL_DELIM SYM_GT integer_value SYM_ELLIPSIS SYM_LT integer_value SYM_INTERVAL_DELIM
		{
			if $3 <= $6 then
				create integer_interval.make_bounded($3, $6, False, False)
				$$ := integer_interval
			else
				raise_error
				report_error("Invalid interval: " + $3.out + " must be <= " + $6.out)
				abort
			end
		}
	| SYM_INTERVAL_DELIM SYM_LT integer_value SYM_INTERVAL_DELIM
		{
			create integer_interval.make_lower_unbounded($3, False)
			$$ := integer_interval
		}
	| SYM_INTERVAL_DELIM SYM_LE integer_value SYM_INTERVAL_DELIM
		{
			create integer_interval.make_lower_unbounded($3, True)
			$$ := integer_interval
		}
	| SYM_INTERVAL_DELIM SYM_GT integer_value SYM_INTERVAL_DELIM
		{
			create integer_interval.make_upper_unbounded($3, False)
			$$ := integer_interval
		}
	| SYM_INTERVAL_DELIM SYM_GE integer_value SYM_INTERVAL_DELIM
		{
			create integer_interval.make_upper_unbounded($3, True)
			$$ := integer_interval
		}
	| SYM_INTERVAL_DELIM integer_value SYM_INTERVAL_DELIM
		{
			create integer_interval.make_point($2)
			$$ := integer_interval
		}
	;

real_value: V_REAL 
		{
			$$ := $1
		}
	| '+' V_REAL 
		{
			$$ := $2
		}
	| '-' V_REAL 
		{
			$$ := - $2
		}
	;

real_list_value: real_value ',' real_value
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| real_list_value ',' real_value
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

real_interval_value: SYM_INTERVAL_DELIM real_value SYM_ELLIPSIS real_value SYM_INTERVAL_DELIM
		{
			if $2 <= $4 then
				create real_interval.make_bounded($2, $4, True, True)
				$$ := real_interval
			else
				raise_error
				report_error("Invalid interval: " + $2.out + " must be <= " + $4.out)
				abort
			end
		}
	| SYM_INTERVAL_DELIM SYM_GT real_value SYM_ELLIPSIS real_value SYM_INTERVAL_DELIM
		{
			if $3 <= $5 then
				create real_interval.make_bounded($3, $5, False, True)
				$$ := real_interval
			else
				raise_error
				report_error("Invalid interval: " + $3.out + " must be <= " + $5.out)
				abort
			end
		}
	| SYM_INTERVAL_DELIM real_value SYM_ELLIPSIS SYM_LT real_value SYM_INTERVAL_DELIM
		{
			if $2 <= $5 then
				create real_interval.make_bounded($2, $5, True, False)
				$$ := real_interval
			else
				raise_error
				report_error("Invalid interval: " + $2.out + " must be <= " + $5.out)
				abort
			end
		}
	| SYM_INTERVAL_DELIM SYM_GT real_value SYM_ELLIPSIS SYM_LT real_value SYM_INTERVAL_DELIM
		{
			if $3 <= $6 then
				create real_interval.make_bounded($3, $6, False, False)
				$$ := real_interval
			else
				raise_error
				report_error("Invalid interval: " + $3.out + " must be <= " + $6.out)
				abort
			end
		}
	| SYM_INTERVAL_DELIM SYM_LT real_value SYM_INTERVAL_DELIM
		{
			create real_interval.make_lower_unbounded($3, False)
			$$ := real_interval
		}
	| SYM_INTERVAL_DELIM SYM_LE real_value SYM_INTERVAL_DELIM
		{
			create real_interval.make_lower_unbounded($3, True)
			$$ := real_interval
		}
	| SYM_INTERVAL_DELIM SYM_GT real_value SYM_INTERVAL_DELIM
		{
			create real_interval.make_upper_unbounded($3, False)
			$$ := real_interval
		}
	| SYM_INTERVAL_DELIM SYM_GE real_value SYM_INTERVAL_DELIM
		{
			create real_interval.make_upper_unbounded($3, True)
			$$ := real_interval
		}
	| SYM_INTERVAL_DELIM real_value SYM_INTERVAL_DELIM
		{
			create real_interval.make_point($2)
			$$ := real_interval
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

boolean_list_value: boolean_value ',' boolean_value
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| boolean_list_value ',' boolean_value
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

character_value: V_CHARACTER
		{
			$$ := $1
		}
	;

character_list_value: character_value ',' character_value
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| character_list_value ',' character_value
		{
			$1.extend($3)
			$$ := $1
		}
	| character_value ',' SYM_LIST_CONTINUE
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
				raise_error
				report_error("invalid ISO8601 date: " + $1)
				abort
			end
		}
	;

date_list_value: date_value ',' date_value
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| date_list_value ',' date_value
		{
			$1.extend($3)
			$$ := $1
		}
	| date_value ',' SYM_LIST_CONTINUE
		{
			create $$.make(0)
			$$.extend($1)
		}
	;

date_interval_value: SYM_INTERVAL_DELIM date_value SYM_ELLIPSIS date_value SYM_INTERVAL_DELIM
		{
			if $2 <= $4 then
				create date_interval.make_bounded($2, $4, True, True)
				$$ := date_interval
			else
				raise_error
				report_error("Invalid interval: " + $2.out + " must be <= " + $4.out)
				abort
			end
		}
	| SYM_INTERVAL_DELIM SYM_GT date_value SYM_ELLIPSIS date_value SYM_INTERVAL_DELIM
		{
			if $3 <= $5 then
				create date_interval.make_bounded($3, $5, False, True)
				$$ := date_interval
			else
				raise_error
				report_error("Invalid interval: " + $3.out + " must be <= " + $5.out)
				abort
			end
		}
	| SYM_INTERVAL_DELIM date_value SYM_ELLIPSIS SYM_LT date_value SYM_INTERVAL_DELIM
		{
			if $2 <= $5 then
				create date_interval.make_bounded($2, $5, True, False)
				$$ := date_interval
			else
				raise_error
				report_error("Invalid interval: " + $2.out + " must be <= " + $5.out)
				abort
			end
		}
	| SYM_INTERVAL_DELIM SYM_GT date_value SYM_ELLIPSIS SYM_LT date_value SYM_INTERVAL_DELIM
		{
			if $3 <= $6 then
				create date_interval.make_bounded($3, $6, False, False)
				$$ := date_interval
			else
				raise_error
				report_error("Invalid interval: " + $3.out + " must be <= " + $6.out)
				abort
			end
		}
	| SYM_INTERVAL_DELIM SYM_LT date_value SYM_INTERVAL_DELIM
		{
			create date_interval.make_lower_unbounded($3, False)
			$$ := date_interval
		}
	| SYM_INTERVAL_DELIM SYM_LE date_value SYM_INTERVAL_DELIM
		{
			create date_interval.make_lower_unbounded($3, True)
			$$ := date_interval
		}
	| SYM_INTERVAL_DELIM SYM_GT date_value SYM_INTERVAL_DELIM
		{
			create date_interval.make_upper_unbounded($3, False)
			$$ := date_interval
		}
	| SYM_INTERVAL_DELIM SYM_GE date_value SYM_INTERVAL_DELIM
		{
			create date_interval.make_upper_unbounded($3, True)
			$$ := date_interval
		}
	| SYM_INTERVAL_DELIM date_value SYM_INTERVAL_DELIM
		{
			create date_interval.make_point($2)
			$$ := date_interval
		}
	;

time_value: V_ISO8601_EXTENDED_TIME
		{
			if valid_iso8601_time($1) then
				create $$.make_from_string($1)
			else
				raise_error
				report_error("invalid ISO8601 time: " + $1)
				abort
			end
		}
	;

time_list_value: time_value ',' time_value
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| time_list_value ',' time_value
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

time_interval_value: SYM_INTERVAL_DELIM time_value SYM_ELLIPSIS time_value SYM_INTERVAL_DELIM
		{
			if $2 <= $4 then
				create time_interval.make_bounded($2, $4, True, True)
				$$ := time_interval
			else
				raise_error
				report_error("Invalid interval: " + $2.out + " must be <= " + $4.out)
				abort
			end
		}
	| SYM_INTERVAL_DELIM SYM_GT time_value SYM_ELLIPSIS time_value SYM_INTERVAL_DELIM
		{
			if $3 <= $5 then
				create time_interval.make_bounded($3, $5, False, True)
				$$ := time_interval
			else
				raise_error
				report_error("Invalid interval: " + $3.out + " must be <= " + $5.out)
				abort
			end
		}
	| SYM_INTERVAL_DELIM time_value SYM_ELLIPSIS SYM_LT time_value SYM_INTERVAL_DELIM
		{
			if $2 <= $5 then
				create time_interval.make_bounded($2, $5, True, False)
				$$ := time_interval
			else
				raise_error
				report_error("Invalid interval: " + $2.out + " must be <= " + $5.out)
				abort
			end
		}
	| SYM_INTERVAL_DELIM SYM_GT time_value SYM_ELLIPSIS SYM_LT time_value SYM_INTERVAL_DELIM
		{
			if $3 <= $6 then
				create time_interval.make_bounded($3, $6, False, False)
				$$ := time_interval
			else
				raise_error
				report_error("Invalid interval: " + $3.out + " must be <= " + $6.out)
				abort
			end
		}
	| SYM_INTERVAL_DELIM SYM_LT time_value SYM_INTERVAL_DELIM
		{
			create time_interval.make_lower_unbounded($3, False)
			$$ := time_interval
		}
	| SYM_INTERVAL_DELIM SYM_LE time_value SYM_INTERVAL_DELIM
		{
			create time_interval.make_lower_unbounded($3, True)
			$$ := time_interval
		}
	| SYM_INTERVAL_DELIM SYM_GT time_value SYM_INTERVAL_DELIM
		{
			create time_interval.make_upper_unbounded($3, False)
			$$ := time_interval
		}
	| SYM_INTERVAL_DELIM SYM_GE time_value SYM_INTERVAL_DELIM
		{
			create time_interval.make_upper_unbounded($3, True)
			$$ := time_interval
		}
	| SYM_INTERVAL_DELIM time_value SYM_INTERVAL_DELIM
		{
			create time_interval.make_point($2)
			$$ := time_interval
		}
	;

date_time_value: V_ISO8601_EXTENDED_DATE_TIME
		{
			if valid_iso8601_date_time($1) then
				create $$.make_from_string($1)
			else
				raise_error
				report_error("invalid ISO8601 date/time: " + $1)
				abort
			end
		}
	;

date_time_list_value: date_time_value ',' date_time_value
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| date_time_list_value ',' date_time_value
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

date_time_interval_value: SYM_INTERVAL_DELIM date_time_value SYM_ELLIPSIS date_time_value  SYM_INTERVAL_DELIM
		{
			if $2 <= $4 then
				create date_time_interval.make_bounded($2, $4, True, True)
				$$ := date_time_interval
			else
				raise_error
				report_error("Invalid interval: " + $2.out + " must be <= " + $4.out)
				abort
			end
		}
	| SYM_INTERVAL_DELIM SYM_GT date_time_value SYM_ELLIPSIS date_time_value SYM_INTERVAL_DELIM
		{
			if $3 <= $5 then
				create date_time_interval.make_bounded($3, $5, False, True)
				$$ := date_time_interval
			else
				raise_error
				report_error("Invalid interval: " + $3.out + " must be <= " + $5.out)
				abort
			end
		}
	| SYM_INTERVAL_DELIM date_time_value SYM_ELLIPSIS SYM_LT date_time_value SYM_INTERVAL_DELIM
		{
			if $2 <= $5 then
				create date_time_interval.make_bounded($2, $5, True, False)
				$$ := date_time_interval
			else
				raise_error
				report_error("Invalid interval: " + $2.out + " must be <= " + $5.out)
				abort
			end
		}
	| SYM_INTERVAL_DELIM SYM_GT date_time_value SYM_ELLIPSIS SYM_LT date_time_value SYM_INTERVAL_DELIM
		{
			if $3 <= $6 then
				create date_time_interval.make_bounded($3, $6, False, False)
				$$ := date_time_interval
			else
				raise_error
				report_error("Invalid interval: " + $3.out + " must be <= " + $6.out)
				abort
			end
		}
	| SYM_INTERVAL_DELIM SYM_LT date_time_value SYM_INTERVAL_DELIM
		{
			create date_time_interval.make_lower_unbounded($3, False)
			$$ := date_time_interval
		}
	| SYM_INTERVAL_DELIM SYM_LE date_time_value SYM_INTERVAL_DELIM
		{
			create date_time_interval.make_lower_unbounded($3, True)
			$$ := date_time_interval
		}
	| SYM_INTERVAL_DELIM SYM_GT date_time_value SYM_INTERVAL_DELIM
		{
			create date_time_interval.make_upper_unbounded($3, False)
			$$ := date_time_interval
		}
	| SYM_INTERVAL_DELIM SYM_GE date_time_value SYM_INTERVAL_DELIM
		{
			create date_time_interval.make_upper_unbounded($3, True)
			$$ := date_time_interval
		}
	| SYM_INTERVAL_DELIM date_time_value SYM_INTERVAL_DELIM
		{
			create date_time_interval.make_point($2)
			$$ := date_time_interval
		}
	;

duration_value: V_ISO8601_DURATION
		{
			if valid_iso8601_duration($1) then
				create $$.make_from_string($1)
			else
				raise_error
				report_error("invalid ISO8601 duration: " + $1)
				abort
			end
		}
	;

duration_list_value: duration_value ',' duration_value
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| duration_list_value ',' duration_value
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

duration_interval_value: SYM_INTERVAL_DELIM duration_value SYM_ELLIPSIS duration_value SYM_INTERVAL_DELIM
		{
			if $2 <= $4 then
				create duration_interval.make_bounded($2, $4, True, True)
				$$ := duration_interval
			else
				raise_error
				report_error("Invalid interval: " + $2.out + " must be <= " + $4.out)
				abort
			end
		}
	| SYM_INTERVAL_DELIM SYM_GT duration_value SYM_ELLIPSIS duration_value SYM_INTERVAL_DELIM
		{
			if $3 <= $5 then
				create duration_interval.make_bounded($3, $5, False, True)
				$$ := duration_interval
			else
				raise_error
				report_error("Invalid interval: " + $3.out + " must be <= " + $5.out)
				abort
			end
		}
	| SYM_INTERVAL_DELIM duration_value SYM_ELLIPSIS SYM_LT duration_value SYM_INTERVAL_DELIM
		{
			if $2 <= $5 then
				create duration_interval.make_bounded($2, $5, True, False)
				$$ := duration_interval
			else
				raise_error
				report_error("Invalid interval: " + $2.out + " must be <= " + $5.out)
				abort
			end
		}
	| SYM_INTERVAL_DELIM SYM_GT duration_value SYM_ELLIPSIS SYM_LT duration_value SYM_INTERVAL_DELIM
		{
			if $3 <= $6 then
				create duration_interval.make_bounded($3, $6, False, False)
				$$ := duration_interval
			else
				raise_error
				report_error("Invalid interval: " + $3.out + " must be <= " + $6.out)
				abort
			end
		}
	| SYM_INTERVAL_DELIM SYM_LT duration_value SYM_INTERVAL_DELIM
		{
			create duration_interval.make_lower_unbounded($3, False)
			$$ := duration_interval
		}
	| SYM_INTERVAL_DELIM SYM_LE duration_value SYM_INTERVAL_DELIM
		{
			create duration_interval.make_lower_unbounded($3, True)
			$$ := duration_interval
		}
	| SYM_INTERVAL_DELIM SYM_GT duration_value SYM_INTERVAL_DELIM
		{
			create duration_interval.make_upper_unbounded($3, False)
			$$ := duration_interval
		}
	| SYM_INTERVAL_DELIM SYM_GE duration_value SYM_INTERVAL_DELIM
		{
			create duration_interval.make_upper_unbounded($3, True)
			$$ := duration_interval
		}
	| SYM_INTERVAL_DELIM duration_value SYM_INTERVAL_DELIM
		{
			create duration_interval.make_point($2)
			$$ := duration_interval
		}
	;

term_code: V_QUALIFIED_TERM_CODE_REF
		{
			create term.make_from_string($1)
			$$ := term
		}
	| ERR_V_QUALIFIED_TERM_CODE_REF
		{
			raise_error
			report_error("Invalid term code reference: %"" + $1 + "%"; spaces not allowed in code string")
			abort
		}
	;

term_code_list_value: term_code ',' term_code
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| term_code_list_value ',' term_code
		{
			$1.extend($3)
			$$ := $1
		}
	| term_code ',' SYM_LIST_CONTINUE
		{
			create $$.make(0)
			$$.extend($1)
		}
	;

uri_value: V_URI
		{
			create a_uri.make_from_string($1)
			$$ := a_uri
		}
	;

-----------------------------------------------------------------
------------- END TAKEN FROM DADL_VALIDATOR.Y -------------------
-----------------------------------------------------------------

%%

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
