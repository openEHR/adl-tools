%{
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

creation

	make

%}
%token <INTEGER> V_INTEGER 
%token <REAL> V_REAL 
%token <STRING> V_TYPE_IDENTIFIER V_ATTRIBUTE_IDENTIFIER V_FEATURE_CALL_IDENTIFIER V_STRING V_ISO8601_DURATION
%token <STRING> V_LOCAL_CODE V_LOCAL_TERM_CODE_REF V_QUALIFIED_TERM_CODE_REF V_TERM_CODE_CONSTRAINT
%token <STRING> V_REGEXP
%token <CHARACTER> V_CHARACTER
%token <STRING> V_URI
%token <STRING> V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN V_ISO8601_TIME_CONSTRAINT_PATTERN V_ISO8601_DATE_CONSTRAINT_PATTERN
%token <C_DOMAIN_TYPE> V_C_DOMAIN_TYPE

%token SYM_START_CBLOCK SYM_END_CBLOCK	-- constraint block

%token SYM_ANY -- used outside of parser & scanner

%token SYM_INTERVAL_DELIM
%token SYM_TRUE SYM_FALSE 
%token SYM_GE SYM_LE SYM_NE
%token SYM_AND SYM_OR SYM_NOT SYM_XOR SYM_IMPLIES
%token SYM_EXISTS SYM_FORALL
%token SYM_THEN SYM_ELSE

%token SYM_EXISTENCE SYM_OCCURRENCES SYM_CARDINALITY 
%token SYM_UNORDERED SYM_ORDERED SYM_UNIQUE SYM_ELLIPSIS SYM_INFINITY SYM_LIST_CONTINUE
%token SYM_INVARIANT SYM_MATCHES SYM_ALLOW_ARCHETYPE SYM_USE_NODE 
%token SYM_INCLUDE SYM_EXCLUDE
%token SYM_DT_UNKNOWN

%token ERR_CHARACTER ERR_STRING ERR_C_DOMAIN_TYPE ERR_TERM_CODE_CONSTRAINT

%left SYM_IMPLIES
%left SYM_OR SYM_XOR
%left SYM_AND
%left '=' SYM_NE SYM_LT SYM_GT SYM_LE SYM_GE
%left '+' '-'
%left '*' '/' SYM_DIV SYM_MODULO
%right '^'
%right SYM_NOT

%type <ARRAYED_LIST [ASSERTION]> assertions c_includes c_excludes

%type <OG_PATH> absolute_path relative_path
%type <INTEGER> cardinality_limit_value
%type <OE_INTERVAL[INTEGER]> c_occurrences c_existence
%type <C_PRIMITIVE_OBJECT> c_primitive_object
%type <C_PRIMITIVE> c_primitive
%type <EXPR_ITEM> Boolean_expression Boolean_node Boolean_leaf
%type <EXPR_ITEM> Arithmetic_expression Arithmetic_node Arithmetic_leaf
%type <CARDINALITY> c_cardinality

%type <INTEGER> integer_value
%type <REAL> real_value
%type <BOOLEAN> boolean_value
%type <CHARACTER> character_value
%type <DATE> date_value precise_date_value partial_date_value
%type <DATE_TIME> date_time_value precise_date_time_value partial_date_time_value
%type <TIME> time_value precise_time_value partial_time_value
%type <DATE_TIME_DURATION> duration_value, duration_magnitude
%type <CODE_PHRASE> term_code
%type <STRING> any_identifier
%type <STRING> string_value
%type <URI> uri_value
%type <OG_PATH_ITEM> path_segment

%type	<ARRAYED_LIST[STRING]> string_list_value
%type <ARRAYED_LIST[INTEGER_REF]> integer_list_value
%type <ARRAYED_LIST[REAL_REF]> real_list_value
%type <ARRAYED_LIST[CHARACTER_REF]> character_list_value
%type <ARRAYED_LIST[BOOLEAN_REF]> boolean_list_value
%type <ARRAYED_LIST[DATE]> date_list_value
%type <ARRAYED_LIST[TIME]> time_list_value
%type <ARRAYED_LIST[DATE_TIME]> date_time_list_value
%type <ARRAYED_LIST[DATE_TIME_DURATION]> duration_list_value
%type <ARRAYED_LIST[CODE_PHRASE]> term_code_list_value

%type <OE_INTERVAL[INTEGER_REF]> integer_interval_value
%type <OE_INTERVAL[REAL_REF]> real_interval_value
%type <OE_INTERVAL[TIME]> time_interval_value
%type <OE_INTERVAL[DATE]> date_interval_value
%type <OE_INTERVAL[DATE_TIME]> date_time_interval_value
%type <OE_INTERVAL[DURATION]> duration_interval_value



%%

input: c_complex_object
		{
			debug("ADL_parse")
				io.put_string("CADL definition validated%N")
			end

			accept
		}
	| error
		{
			debug("ADL_parse")
				io.put_string("CADL definition NOT validated%N")
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

c_complex_object_id: V_TYPE_IDENTIFIER
		{
			create complex_obj.make_anonymous($1)
		}
	| V_TYPE_IDENTIFIER V_LOCAL_TERM_CODE_REF
		{
			create complex_obj.make_identified($1, $2)
		}
	;

c_complex_object_body: c_any -- used to indicate that any value of a type is ok
		{
			debug("ADL_parse")
				io.put_string(indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + 
					" [id=" + object_nodes.item.node_id + "] set_any_allowed%N") 
			end
			object_nodes.item.set_any_allowed
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
	| c_coded_term
		{
			debug("ADL_parse")
				io.put_string(indent + "ATTR_NODE " + c_attrs.item.rm_attribute_name + " put_child(c_coded_term LEAF_OBJ)%N") 
			end
			c_attrs.item.put_child(c_coded_term_obj)
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

archetype_internal_ref: SYM_USE_NODE V_TYPE_IDENTIFIER absolute_path 
		{
			str := $3.as_string
			create archetype_internal_ref.make($2, str)

			a_path := Void

			debug("ADL_parse")
				io.put_string(indent + "create ARCHETYPE_INTERNAL_REF " + 
						archetype_internal_ref.rm_type_name + " [path=" + archetype_internal_ref.target_path + "]%N") 
				io.put_string(indent + "C_ATTR " + c_attrs.item.rm_attribute_name + " put_child(ARCHETYPE_INTERNAL_REF)%N") 
			end

			if check_c_attribute_child(c_attrs.item, archetype_internal_ref) then
				c_attrs.item.put_child(archetype_internal_ref)
			end
		}
	| SYM_USE_NODE V_TYPE_IDENTIFIER error 
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

c_archetype_slot_id: SYM_ALLOW_ARCHETYPE V_TYPE_IDENTIFIER
		{
			create archetype_slot.make_anonymous($2)
		}
	| SYM_ALLOW_ARCHETYPE V_TYPE_IDENTIFIER V_LOCAL_TERM_CODE_REF
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
				io.put_string(indent + "ATTR_NODE " + attr_node.rm_attribute_name + " set_any_allowed%N") 
			end
			attr_node.set_any_allowed
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

assertion: any_identifier ':' Boolean_expression
		{
			create assertion.make($3, $1)
		}
	| Boolean_expression
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

Boolean_expression: Boolean_leaf
		{
			$$ := $1
		}
	| Boolean_node
		{
			$$ := $1
		}
	;

Boolean_node: SYM_EXISTS absolute_path
		{
			debug("ADL_invariant")
				io.put_string(indent + "Exists " + $2.as_string + "%N") 
			end
			create expr_unary_operator.make(create {OPERATOR_KIND}.make(op_exists))
			create expr_leaf.make_object_ref(a_path)
			a_path := Void
			expr_unary_operator.set_operand(expr_leaf)
			$$ := expr_unary_operator
		}
	| SYM_EXISTS error 
		{
			raise_error
			report_error("expecting absolute path")
			abort
		}
	| V_ATTRIBUTE_IDENTIFIER SYM_MATCHES SYM_START_CBLOCK c_primitive SYM_END_CBLOCK
		{
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_matches))
			expr_binary_operator.set_left_operand(create {EXPR_LEAF}.make_feature_call($1))
			expr_binary_operator.set_right_operand(create {EXPR_LEAF}.make_constraint($4))
			$$ := expr_binary_operator
		}
	| SYM_NOT Boolean_leaf
		{
			create expr_unary_operator.make(create {OPERATOR_KIND}.make(op_not))
			expr_unary_operator.set_operand($2)
			$$ := expr_unary_operator
		}
	| Arithmetic_expression '=' Arithmetic_leaf
		{
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_eq))
			expr_binary_operator.set_left_operand($1)
			expr_binary_operator.set_right_operand($3)
			$$ := expr_binary_operator
		}
	| Arithmetic_expression SYM_NE Arithmetic_leaf
		{
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_ne))
			expr_binary_operator.set_left_operand($1)
			expr_binary_operator.set_right_operand($3)
			$$ := expr_binary_operator
		}
	| Arithmetic_expression SYM_LT Arithmetic_leaf
		{
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_lt))
			expr_binary_operator.set_left_operand($1)
			expr_binary_operator.set_right_operand($3)
			$$ := expr_binary_operator
		}
	| Arithmetic_expression SYM_GT Arithmetic_leaf
		{
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_gt))
			expr_binary_operator.set_left_operand($1)
			expr_binary_operator.set_right_operand($3)
			$$ := expr_binary_operator
		}
	| Arithmetic_expression SYM_LE Arithmetic_leaf
		{
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_le))
			expr_binary_operator.set_left_operand($1)
			expr_binary_operator.set_right_operand($3)
			$$ := expr_binary_operator
		}
	| Arithmetic_expression SYM_GE Arithmetic_leaf
		{
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_ge))
			expr_binary_operator.set_left_operand($1)
			expr_binary_operator.set_right_operand($3)
			$$ := expr_binary_operator
		}
	| Boolean_expression SYM_AND Boolean_leaf
		{
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_and))
			expr_binary_operator.set_left_operand($1)
			expr_binary_operator.set_right_operand($3)
			$$ := expr_binary_operator
		}
	| Boolean_expression SYM_OR Boolean_leaf
		{
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_or))
			expr_binary_operator.set_left_operand($1)
			expr_binary_operator.set_right_operand($3)
			$$ := expr_binary_operator
		}
	| Boolean_expression SYM_XOR Boolean_leaf
		{
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_xor))
			expr_binary_operator.set_left_operand($1)
			expr_binary_operator.set_right_operand($3)
			$$ := expr_binary_operator
		}
	| Boolean_expression SYM_IMPLIES Boolean_leaf
		{
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_implies))
			expr_binary_operator.set_left_operand($1)
			expr_binary_operator.set_right_operand($3)
			$$ := expr_binary_operator
		}
	;

Boolean_leaf: '(' Boolean_expression ')'
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

Arithmetic_expression: Arithmetic_leaf
		{
			$$ := $1
		}
	| Arithmetic_node
		{
			$$ := $1
		}
	;

Arithmetic_node: Arithmetic_expression '+' Arithmetic_leaf
		{
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_plus))
			expr_binary_operator.set_left_operand($1)
			expr_binary_operator.set_right_operand($3)
			$$ := expr_binary_operator
		}
	| Arithmetic_expression '-' Arithmetic_leaf
		{
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_minus))
			expr_binary_operator.set_left_operand($1)
			expr_binary_operator.set_right_operand($3)
			$$ := expr_binary_operator
		}
	| Arithmetic_expression '*' Arithmetic_leaf
		{
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_multiply))
			expr_binary_operator.set_left_operand($1)
			expr_binary_operator.set_right_operand($3)
			$$ := expr_binary_operator
		}
	| Arithmetic_expression '/' Arithmetic_leaf
		{
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_divide))
			expr_binary_operator.set_left_operand($1)
			expr_binary_operator.set_right_operand($3)
			$$ := expr_binary_operator
		}
	| Arithmetic_expression '^' Arithmetic_leaf
		{
			create expr_binary_operator.make(create {OPERATOR_KIND}.make(op_exp))
			expr_binary_operator.set_left_operand($1)
			expr_binary_operator.set_right_operand($3)
			$$ := expr_binary_operator
		}
	;

Arithmetic_leaf:  '(' Arithmetic_expression ')'
		{
			$$ := $2
		}
	| integer_value
		{
			create expr_leaf.make_integer($1)
			$$ := expr_leaf
		}
	| real_value
		{
			create expr_leaf.make_real($1)
			$$ := expr_leaf
		}
	;

--------------------------------------------------------------------------------------------------
--------------- THE FOLLOWING SOURCE TAKEN FROM OG_PATH_VALIDATOR.Y - DO NOT MODIFY  -------------
--------------- except to remove movable_path ----------------------------------------------------
--------------------------------------------------------------------------------------------------

absolute_path: '/' relative_path
		{
			a_path.set_absolute
			debug("OG_PATH_parse")
				io.put_string("....absolute_path; %N")
			end
			$$ := a_path
		}
	;

relative_path: path_segment
		{
			create a_path.make_relative($1)
			$$ := a_path
		}
	| relative_path '/' path_segment
		{
			a_path.append_segment($3)
			$$ := a_path
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
		}
	| SYM_OCCURRENCES SYM_MATCHES SYM_START_CBLOCK occurrence_spec SYM_END_CBLOCK	
		{
			$$ := int_interval
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
		}
	| V_INTEGER SYM_ELLIPSIS cardinality_limit_value 
		{
			if cardinality_limit_pos_infinity then
				create int_interval.make_upper_unbounded($1, True)
				cardinality_limit_pos_infinity := False
			else
				create int_interval.make_bounded($1, $3, True, True)
			end
		}
	;

---------------------- leaf constraint types -----------------------

c_integer_spec: integer_value
		{
			create int_interval.make_point($1)
			create c_integer.make_interval(int_interval)
		}
	| integer_list_value
		{
			create integer_list.make(0)
			from
				integer_ref_list.start
			until
				integer_ref_list.off
			loop
				integer_list.extend(integer_ref_list.item.item)
				integer_ref_list.forth
			end
			create c_integer.make_list(integer_list)
		}
	| integer_interval_value
		{
			if integer_interval.lower_unbounded then
				if integer_interval.upper_unbounded then
					create int_interval.make_unbounded
				else
					create int_interval.make_lower_unbounded(integer_interval.upper.item, integer_interval.upper_included)
				end
			else
				if integer_interval.upper_unbounded then
					create int_interval.make_upper_unbounded(integer_interval.lower.item, integer_interval.lower_included)
				else
					create int_interval.make_bounded(integer_interval.lower.item, integer_interval.upper.item, integer_interval.lower_included, integer_interval.upper_included)
				end
			end

			create c_integer.make_interval(int_interval)
		}
--	| occurrence_spec	-- to allow intervals written in form {1..*}
--		{
--			create c_integer.make_interval(int_interval)
--		}
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
			create rl_interval.make_point($1)
			create c_real.make_interval(rl_interval)
		}
	| real_list_value
		{
			create real_list.make(0)
			from
				real_ref_list.start
			until
				real_ref_list.off
			loop
				real_list.extend(real_ref_list.item.item)
				real_ref_list.forth
			end
			create c_real.make_list(real_list)
		}
	| real_interval_value
		{
			if real_interval.lower_unbounded then
				if real_interval.upper_unbounded then
					create rl_interval.make_unbounded
				else
					create rl_interval.make_lower_unbounded(real_interval.upper.item, real_interval.upper_included)
				end
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

c_date_spec: V_ISO8601_DATE_CONSTRAINT_PATTERN
		{
			if is_valid_iso8601_date_constraint_pattern($1) then
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

c_date: c_date_spec
	| c_date_spec ';' date_value
		{
			if c_date.valid_value($3) then
				c_date.set_assumed_value($3)
			else
				raise_error
				report_error("assumed value " + $3.out + " not inside constraint")
				abort
			end
		}
	| c_date_spec ';' error
		{
			raise_error
			report_error("invalid assumed value; must be valid ISO8601 date")
			abort
		}
	;

c_time_spec: V_ISO8601_TIME_CONSTRAINT_PATTERN
		{
			if is_valid_iso8601_time_constraint_pattern($1) then
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

c_time: c_time_spec
	| c_time_spec ';' time_value
		{
			if c_time.valid_value($3) then
				c_time.set_assumed_value($3)
			else
				raise_error
				report_error("assumed value " + $3.out + " not inside constraint")
				abort
			end
		}
	| c_time_spec ';' error
		{
			raise_error
			report_error("invalid assumed value; must be valid ISO8601 time")
			abort
		}
	;

c_date_time_spec: V_ISO8601_DATE_TIME_CONSTRAINT_PATTERN
		{
			if is_valid_iso8601_date_time_constraint_pattern($1) then
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

c_date_time: c_date_time_spec
	| c_date_time_spec ';' date_time_value
		{
			if c_date_time.valid_value($3) then
				c_date_time.set_assumed_value($3)
			else
				raise_error
				report_error("assumed value " + $3.out + " not inside constraint")
				abort
			end
		}
	| c_date_time_spec ';' error
		{
			raise_error
			report_error("invalid assumed value; must be valid ISO8601 date_time")
			abort
		}
	;

c_duration_spec: duration_value
		{
			create duration_interval.make_point($1)
			create c_duration.make_interval(duration_interval)
		}
	| duration_interval_value
		{
			create c_duration.make_interval(duration_interval)
		}
	;

c_duration: c_duration_spec
	| c_duration_spec ';' duration_value
		{
			if c_duration.valid_value($3) then
				c_duration.set_assumed_value($3)
			else
				raise_error
				report_error("assumed value " + $3.out + " not inside constraint")
				abort
			end
		}
	| c_duration_spec ';' error
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
			create c_string.make_from_string_list(string_list)
			string_list := Void
		}
	| string_list_value ',' SYM_LIST_CONTINUE -- open list
		{
			create c_string.make_from_string_list(string_list)
			string_list := Void
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
 			ordinal_node.set_assumed_value_from_integer($3)
 		}
 	| c_ordinal_spec ';' error
 		{
 			raise_error
 			report_error("invalid assumed value; must be an ordinal integer value")
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
			create a_code_phrase.make($3)
			ordinal_node.add_item(create {ORDINAL}.make(int_val, a_code_phrase))
		}
	;

c_coded_term: V_TERM_CODE_CONSTRAINT	-- e.g. "[local::at0040, at0041; at0040]"
		{
			create c_coded_term_obj.make_from_pattern($1)
		}
	| V_QUALIFIED_TERM_CODE_REF
		{
			create c_coded_term_obj.make_from_pattern($1)
		}
	;
 
constraint_ref: V_LOCAL_TERM_CODE_REF	-- e.g. "ac0003"
		{
			create constraint_ref.make($1)
		}
	;

any_identifier: V_TYPE_IDENTIFIER
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

---------------------- BASIC DATA VALUES -----------------------

string_value: V_STRING
		{
			$$ := $1
		}
	;

string_list_value: V_STRING ',' V_STRING
		{
			create string_list.make(0)
			string_list.extend($1)
			string_list.extend($3)
			$$ := string_list
		}
	| string_list_value ',' V_STRING
		{
			string_list.extend($3)
			$$ := string_list
		}
	| V_STRING ',' SYM_LIST_CONTINUE
		{
			create string_list.make(0)
			string_list.extend($1)
			$$ := string_list
		}
	;

integer_value: V_INTEGER {
			int_val := $1
			$$ := int_val
		}
	| '+' V_INTEGER {
			int_val := $2
			$$ := int_val
		}
	| '-' V_INTEGER {
			int_val := - $2
			$$ := int_val
		}
	;

integer_list_value: integer_value ',' integer_value
		{
			create integer_ref_list.make(0)
			integer_ref_list.extend($1)
			integer_ref_list.extend($3)
			$$ := integer_ref_list
		}
	| integer_list_value ',' integer_value
		{
			integer_ref_list.extend($3)
			$$ := integer_ref_list
		}
	| integer_value ',' SYM_LIST_CONTINUE
		{
			create integer_ref_list.make(0)
			integer_ref_list.extend($1)
			$$ := integer_ref_list
		}
	;

integer_interval_value: SYM_INTERVAL_DELIM integer_value SYM_ELLIPSIS integer_value SYM_INTERVAL_DELIM
		{
			create integer_interval.make_bounded($2, $4, True, True)
			$$ := integer_interval
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
			real_val := $1
			$$ := real_val
		}
	| '+' V_REAL 
		{
			real_val := $2
			$$ := real_val
		}
	| '-' V_REAL 
		{
			real_val := - $2
			$$ := real_val
		}
	;

real_list_value: real_value ',' real_value
		{
			create real_ref_list.make(0)
			real_ref_list.extend($1)

			real_ref_list.extend($3)
			$$ := real_ref_list
		}
	| real_list_value ',' real_value
		{
			real_ref_list.extend($3)
			$$ := real_ref_list
		}
	| real_value ',' SYM_LIST_CONTINUE
		{
			create real_ref_list.make(0)
			real_ref_list.extend($1)
			$$ := real_ref_list
		}
	;

real_interval_value: SYM_INTERVAL_DELIM real_value SYM_ELLIPSIS real_value SYM_INTERVAL_DELIM
		{
			create real_interval.make_bounded($2, $4, True, True)
			$$ := real_interval
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
			create boolean_list.make(0)
			boolean_list.extend($1)
			boolean_list.extend($3)
			$$ := boolean_list
		}
	| boolean_list_value ',' boolean_value
		{
			boolean_list.extend($3)
			$$ := boolean_list
		}
	| boolean_value ',' SYM_LIST_CONTINUE
		{
			create boolean_list.make(0)
			boolean_list.extend($1)
			$$ := boolean_list
		}
	;

character_value: V_CHARACTER
		{
			$$ := $1
		}
	;

character_list_value: character_value ',' character_value
		{
			create character_list.make(0)
			character_list.extend($1)
			character_list.extend($3)
			$$ := character_list
		}
	| character_list_value ',' character_value
		{
			character_list.extend($3)
			$$ := character_list
		}
	| character_value ',' SYM_LIST_CONTINUE
		{
			create character_list.make(0)
			character_list.extend($1)
			$$ := character_list
		}
	;

date_value: precise_date_value
		{
			$$ := $1
		}
	| partial_date_value
		{
			$$ := $1
		}
	;


precise_date_value: V_INTEGER '-' V_INTEGER '-' V_INTEGER -- in ISO8601 form yyyy-MM-dd
		{
			if date_vc.is_correct_date($1, $3, $5) then
				create a_date.make($1, $3, $5)
				$$ := a_date
			else
				raise_error
				report_error("invalid date: " + $1.out + "-" + $3.out + "-" + $5.out)
				abort
			end
		}
	;

partial_date_value: V_INTEGER '-' V_INTEGER '-' SYM_DT_UNKNOWN -- in ISO8601 form yyyy-MM-??
		{
			if date_vc.is_correct_date($1, $3, 1) then -- FIXME: temporary until PARTIAL_DATE implemented
				create a_date.make($1, $3, 1)
				$$ := a_date
			else
				raise_error
				report_error("invalid date: " + $1.out + "-" + $3.out + "-??")
				abort
			end
		}
	| V_INTEGER '-' SYM_DT_UNKNOWN '-' SYM_DT_UNKNOWN -- in ISO8601 form yyyy-??-??
		{
			if date_vc.is_correct_date($1, 1, 1) then
				create a_date.make($1, 1, 1)
				$$ := a_date
			else
				raise_error
				report_error("invalid date: " + $1.out + "-??-??")
				abort
			end
		}
	;

date_list_value: date_value ',' date_value
		{
			create date_list.make(0)
			date_list.extend($1)
			date_list.extend($3)
			$$ := date_list
		}
	| date_list_value ',' date_value
		{
			date_list.extend($3)
			$$ := date_list
		}
	| date_value ',' SYM_LIST_CONTINUE
		{
			create date_list.make(0)
			date_list.extend($1)
			$$ := date_list
		}
	;

date_interval_value: SYM_INTERVAL_DELIM date_value SYM_ELLIPSIS date_value SYM_INTERVAL_DELIM
		{
			create date_interval.make_bounded($2, $4, True, True)
			$$ := date_interval
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

time_value: precise_time_value
		{
			$$ := a_time
		}
	| precise_time_value time_zone
		{
			$$ := a_time
		}
	| partial_time_value
		{
			$$ := a_time
		}
	| partial_time_value time_zone
		{
			$$ := a_time
		}
	;

precise_time_value: V_INTEGER ':' V_INTEGER ':' V_INTEGER
		{
			if time_vc.is_correct_time($1, $3, $5, False) then
				create a_time.make($1, $3, $5)
				$$ := a_time
			else
				raise_error
				report_error("invalid time: " + $1.out + ":" + $3.out + ":" + $5.out)
				abort
			end
		}
	| V_INTEGER ':' V_INTEGER ':' V_REAL
		{
			if time_vc.is_correct_time($1, $3, $5, False) then
				create a_time.make_fine($1, $3, $5)
				$$ := a_time
			else
				raise_error
				report_error("invalid time: " + $1.out + ":" + $3.out + ":" + $5.out)
				abort
			end
		}
	| V_INTEGER ':' V_INTEGER
		{
			if time_vc.is_correct_time($1, $3, 0, False) then
				create a_time.make($1, $3, 0)
				$$ := a_time
			else
				raise_error
				report_error("invalid time: " + $1.out + ":" + $3.out)
				abort
			end
		}
	;

partial_time_value: V_INTEGER ':' V_INTEGER ':' SYM_DT_UNKNOWN
		{
			if time_vc.is_correct_time($1, $3, 0, False) then
				create a_time.make($1, $3, 0) -- FIXME: hack until PARTIAL_TIME implemented
				$$ := a_time
			else
				raise_error
				report_error("invalid time: " + $1.out + ":" + $2.out + ":??")
				abort
			end
		}
	| V_INTEGER ':' SYM_DT_UNKNOWN ':' SYM_DT_UNKNOWN
		{
			if time_vc.is_correct_time($1, 0, 0, False) then
				create a_time.make($1, 0, 0) -- FIXME: hack until PARTIAL_TIME implemented
				$$ := a_time
			else
				raise_error
				report_error("invalid time: " + $1.out + ":??:??")
				abort
			end
		}
	| V_INTEGER ':' SYM_DT_UNKNOWN
		{
			if time_vc.is_correct_time($1, 0, 0, False) then
				create a_time.make($1, 0, 0) -- FIXME: hack until PARTIAL_TIME implemented
				$$ := a_time
			else
				raise_error
				report_error("invalid time: " + $1.out + ":??:??")
				abort
			end
		}
	;

time_zone: 'Z'
		{
			-- set timezone to Greenwich
		}
	| '+' V_INTEGER
		{
			-- set it to some other meridian
		}
	;

time_list_value: time_value ',' time_value
		{
			create time_list.make(0)
			time_list.extend($1)
			time_list.extend($3)
			$$ := time_list
		}
	| time_list_value ',' time_value
		{
			time_list.extend($3)
			$$ := time_list
		}
	| time_value ',' SYM_LIST_CONTINUE
		{
			create time_list.make(0)
			time_list.extend($1)
			$$ := time_list
		}
	;

time_interval_value: SYM_INTERVAL_DELIM time_value SYM_ELLIPSIS time_value SYM_INTERVAL_DELIM
		{
			create time_interval.make_bounded($2, $4, True, True)
			$$ := time_interval
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

date_time_value:  precise_date_time_value
		{
			$$ := $1
		}
	| partial_date_time_value
		{
			$$ := $1
		}
	;

precise_date_time_value: precise_date_value precise_time_value
		{
			create a_date_time.make_by_date_time($1, $2)
			$$ := a_date_time
		}
	;

partial_date_time_value: precise_date_value partial_time_value
		{
			create a_date_time.make_by_date_time($1, $2)
			$$ := a_date_time
		}
	| precise_date_value SYM_DT_UNKNOWN ':' SYM_DT_UNKNOWN ':' SYM_DT_UNKNOWN
		{
			if time_vc.is_correct_time(0, 0, 0, False) then
				create a_time.make(0, 0, 0) -- FIXME: hack until PARTIAL_TIME implemented
			end
			create a_date_time.make_by_date_time($1, a_time)
			$$ := a_date_time
		}
	| partial_date_value SYM_DT_UNKNOWN ':' SYM_DT_UNKNOWN ':' SYM_DT_UNKNOWN
		{
			if time_vc.is_correct_time(0, 0, 0, False) then
				create a_time.make(0, 0, 0) -- FIXME: hack until PARTIAL_TIME implemented
			end
			create a_date_time.make_by_date_time($1, a_time)
			$$ := a_date_time
		}
	;

date_time_list_value: date_time_value ',' date_time_value
		{
			create date_time_list.make(0)
			date_time_list.extend($1)
			date_time_list.extend($3)
			$$ := date_time_list
		}
	| date_time_list_value ',' date_time_value
		{
			date_time_list.extend($3)
			$$ := date_time_list
		}
	| date_time_value ',' SYM_LIST_CONTINUE
		{
			create date_time_list.make(0)
			date_time_list.extend($1)
			$$ := date_time_list
		}
	;

date_time_interval_value: SYM_INTERVAL_DELIM date_time_value SYM_ELLIPSIS date_time_value  SYM_INTERVAL_DELIM
		{
			create date_time_interval.make_bounded($2, $4, True, True)
			$$ := date_time_interval
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

duration_value: duration_magnitude
		{
			$$ := $1
		}
	| '-' duration_magnitude
		{
			$$ := -$2
		}
	;

duration_magnitude: V_ISO8601_DURATION
		{
			$$ := iso8601_string_to_duration($1)
		}
	;

duration_list_value: duration_value ',' duration_value
		{
			create duration_list.make(0)
			duration_list.extend($1)
			duration_list.extend($3)
			$$ := duration_list
		}
	| duration_list_value ',' duration_value
		{
			duration_list.extend($3)
			$$ := duration_list
		}
	| duration_value ',' SYM_LIST_CONTINUE
		{
			create duration_list.make(0)
			duration_list.extend($1)
			$$ := duration_list
		}
	;

duration_interval_value: SYM_INTERVAL_DELIM duration_value SYM_ELLIPSIS duration_value SYM_INTERVAL_DELIM
		{
			create duration_interval.make_bounded($2, $4, True, True)
			$$ := duration_interval
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
			create term.make($1)
			$$ := term
		}
	;

term_code_list_value: term_code ',' term_code
		{
			create term_list.make(0)
			term_list.extend($1)
			term_list.extend($3)
			$$ := term_list
		}
	| term_code_list_value ',' term_code
		{
			term_list.extend($3)
			$$ := term_list
		}
	| term_code ',' SYM_LIST_CONTINUE
		{
			create term_list.make(0)
			term_list.extend($1)
			$$ := term_list
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

	make is
			-- Create a new Eiffel parser.
		do
			make_eiffel_scanner
			make_parser_skeleton
		end

	execute(in_text:STRING; a_source_start_line: INTEGER) is
		do
			reset
			source_start_line := a_source_start_line

			create indent.make(0)
			create error_text.make(0)

			create object_nodes.make(0)
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

	error_text: STRING

	output: C_COMPLEX_OBJECT
			
	assertion_list: ARRAYED_LIST [ASSERTION]

feature {NONE} -- Implementation

	check_c_attribute_child(an_attr: C_ATTRIBUTE; an_obj: C_OBJECT): BOOLEAN is
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
			elseif an_obj.is_addressable and an_attr.has_child_node(an_obj.node_id) then
				raise_error
				report_error("attribute " + an_attr.rm_attribute_name + " already has child object with id " + an_obj.node_id)
				abort
			else
				Result := True
			end
		end

feature {NONE} -- Parse Tree

	object_nodes: ARRAYED_STACK[C_COMPLEX_OBJECT]
	complex_obj: C_COMPLEX_OBJECT

	c_attrs: ARRAYED_STACK[C_ATTRIBUTE]
	attr_node: C_ATTRIBUTE

	c_prim_obj: C_PRIMITIVE_OBJECT
	c_coded_term_obj: C_CODED_TERM
	constraint_ref: CONSTRAINT_REF
	archetype_internal_ref: ARCHETYPE_INTERNAL_REF
	archetype_slot: ARCHETYPE_SLOT

	ordinal_node: C_ORDINAL
	an_ordinal: ORDINAL
	a_code_phrase: CODE_PHRASE

	expr_tree: EXPR_OPERATOR
	expr_binary_operator: EXPR_BINARY_OPERATOR
	expr_unary_operator: EXPR_UNARY_OPERATOR
	expr_leaf: EXPR_LEAF

	a_path: OG_PATH
	a_path_item: OG_PATH_ITEM

	assertion: ASSERTION

	c_string: OE_C_STRING
	c_boolean: C_BOOLEAN
	c_real: C_REAL
	c_date: OE_C_DATE
	c_integer:  C_INTEGER
	c_time: C_TIME
	c_date_time: C_DATE_TIME
	c_duration: C_DURATION

	cardinality: CARDINALITY
	cardinality_limit_pos_infinity: BOOLEAN

	rm_attribute_name: STRING
	occurrences: STRING
	invariant_expr: STRING

	time_vc: TIME_VALIDITY_CHECKER
	date_vc: DATE_VALIDITY_CHECKER

-------------- FOLLOWING TAKEN FROM DADL_VALIDATOR.Y ---------------
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

	int_interval: OE_INTERVAL [INTEGER]
	rl_interval: OE_INTERVAL [REAL]

	integer_interval: OE_INTERVAL [INTEGER_REF]
	real_interval: OE_INTERVAL [REAL_REF]
	date_interval: OE_INTERVAL [DATE]
	time_interval: OE_INTERVAL [TIME]
	date_time_interval: OE_INTERVAL [DATE_TIME]
	duration_interval: OE_INTERVAL [DATE_TIME_DURATION]

	indent: STRING
	int_val: INTEGER
	real_val: REAL
	str: STRING
	a_date: DATE
	a_time: TIME
	a_date_time: DATE_TIME

end
