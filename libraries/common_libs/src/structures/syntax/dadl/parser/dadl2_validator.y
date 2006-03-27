%{
indexing
	component:   "openEHR Archetype Project"
	description: "Validating parser for Archetype Description Language (ADL)"
	keywords:    "ADL, dADL"
	
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004, 2005 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class DADL2_VALIDATOR

inherit
	YY_PARSER_SKELETON
		rename
			make as make_parser_skeleton
		redefine
			report_error
		end

	DATE_TIME_ROUTINES
		export
			{NONE} all
		end

	DADL_SCANNER
		rename
			make as make_eiffel_scanner
		end

	KL_SHARED_EXCEPTIONS
	KL_SHARED_ARGUMENTS

creation
	make

%}

%token <INTEGER> V_INTEGER 
%token <REAL> V_REAL 
%token <STRING> V_TYPE_IDENTIFIER V_ATTRIBUTE_IDENTIFIER V_STRING V_ISO8601_DURATION
%token <STRING> V_CADL_BLOCK
%token <STRING> V_LOCAL_CODE V_QUALIFIED_TERM_CODE_REF V_LOCAL_TERM_CODE_REF
%token <STRING> V_URI
%token <CHARACTER> V_CHARACTER

%token SYM_START_DBLOCK SYM_END_DBLOCK	-- value block
%token SYM_EQ SYM_ELLIPSIS SYM_LIST_CONTINUE SYM_INFINITY SYM_INTERVAL_DELIM
%token SYM_DT_UNKNOWN

-- FIXME: query syntax is obsolete from 01/jun/2005; remove when backward compatibility no longer needed
%token SYM_QUERY_FUNC

%token SYM_TRUE SYM_FALSE 
%left SYM_LT SYM_GT SYM_LE SYM_GE

%token ERR_CHARACTER ERR_STRING

%type <INTEGER> integer_value
%type <REAL> real_value
%type <BOOLEAN> boolean_value
%type <CHARACTER> character_value
%type <DATE> date_value precise_date_value partial_date_value
%type <DATE_TIME> date_time_value precise_date_time_value partial_date_time_value
%type <TIME> time_value precise_time_value partial_time_value
%type <DATE_TIME_DURATION> duration_value, duration_magnitude
%type <CODE_PHRASE> term_code
%type <URI> uri_value

%type <DT_COMPLEX_OBJECT_NODE> single_attr_object_block, untyped_single_attr_object_block
%type <DT_COMPLEX_OBJECT_NODE> multiple_attr_object_block, untyped_multiple_attr_object_block
%type <DT_COMPLEX_OBJECT_NODE> complex_object_block
%type <DT_OBJECT_LEAF> untyped_primitive_object_block, primitive_object_block

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
%type <ARRAYED_LIST[ANY]> simple_list_value

%type <OE_INTERVAL[INTEGER_REF]> integer_interval_value
%type <OE_INTERVAL[REAL_REF]> real_interval_value
%type <OE_INTERVAL[TIME]> time_interval_value
%type <OE_INTERVAL[DATE]> date_interval_value
%type <OE_INTERVAL[DATE_TIME]> date_time_interval_value
%type <OE_INTERVAL[DURATION]> duration_interval_value
%type <OE_INTERVAL[PART_COMPARABLE]> simple_interval_value

%%

input: attr_vals	-- anonymous object
		{
			output := complex_object_nodes.item
			debug("dADL_parse")
				io.put_string("Object data definition validated (non-delimited)%N")
			end
			accept
		}
	| complex_object_block
		{
			output := $1
			debug("dADL_parse")
				io.put_string("Object data definition validated%N")
			end
			accept
		}
	| error
		{
			debug("dADL_parse")
				io.put_string("dADL text NOT validated%N")
			end
			abort
		}
	;


---------------------- body ---------------------

attr_vals: attr_val
		{
			debug("dADL_parse")
				io.put_string(indent + "attr_val complete%N")
			end
		}
	| attr_vals attr_val
		{
			debug("dADL_parse")
				io.put_string(indent + "attr_val complete%N")
			end
		}
	| attr_vals ';' attr_val
		{
			debug("dADL_parse")
				io.put_string(indent + "attr_val complete%N")
			end
		}
	;


attr_val: attr_id SYM_EQ object_block -- could be a single or multiple attr
		{
			debug("dADL_parse")
				io.put_string(indent + "attr_val: POP attr node (" +  attr_nodes.item.rm_attr_name+ ")%N")
				indent.remove_tail(1)
			end
			attr_nodes.remove
		}
	;

attr_id: V_ATTRIBUTE_IDENTIFIER
		{
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
				io.put_string(indent + "attr_id: create_attr_node.make_single(<<" + $1 + ">>)%N")
			end
			create attr_node.make_single($1)

			debug("dADL_parse")
				io.put_string(indent + "attr_id: complex_object_nodes.item(" + complex_object_nodes.item.node_id + 
						").put_attribute(" + attr_node.rm_attr_name + ")%N")
			end
			if not complex_object_nodes.item.has_attribute(attr_node.rm_attr_name) then
				complex_object_nodes.item.put_attribute(attr_node)
			else
				raise_error
				report_error("Duplicate relationship: " + attr_node.rm_attr_name)
				abort
			end

			debug("dADL_parse")
				io.put_string(indent + "attr_id: PUSH attr node%N")
				indent.append("%T")
			end
			attr_nodes.extend(attr_node)
			obj_id := Void
		}
	| V_ATTRIBUTE_IDENTIFIER error
		{
			raise_error
			report_error("Error in attribute value")
			abort
		}
	;

--
-- An object_block is any block enclosed in <> with optional leading type name
--
object_block: complex_object_block
	| primitive_object_block
	;

complex_object_block: single_attr_object_block
		{
			$$ := $1
		}
	| multiple_attr_object_block
		{
			$$ := $1
		}
	;

--
-- --------------------------- multiple attr objects -------------------------------
--
multiple_attr_object_block: untyped_multiple_attr_object_block 
		{
			$$ := $1
		}
	| V_TYPE_IDENTIFIER untyped_multiple_attr_object_block
		{
			-- probably should set type name on owning attribute - it doesn't belong on each 
			-- object, since it is essentially a constraint
			$$ := $2
		}
	;

--
-- An untyped_multiple_attr_object_block is a block of the form:
--	<
--		[key1] = <...>
--		[key2] = <...>
--		[keyN] = <...>
--	>
--
untyped_multiple_attr_object_block: multiple_attr_object_block_head keyed_objects SYM_END_DBLOCK
		{
			if complex_object_nodes.item.is_addressable and attr_nodes.item.is_generic then
				-- pop the generic attr node
				debug("dADL_parse")
					io.put_string(indent + "multiple_attr_object_block: POP attr node (" +  attr_nodes.item.rm_attr_name+ ")%N")
					indent.remove_tail(1)
				end
				attr_nodes.remove

				debug("dADL_parse")
					io.put_string(indent + "multiple_attr_object_block: POP Object node(" + complex_object_nodes.item.node_id + ")%N")
					indent.remove_tail(1)
				end
				$$ := complex_object_nodes.item
				complex_object_nodes.remove
			end
		}
	;

multiple_attr_object_block_head: SYM_START_DBLOCK
		{
			if obj_id /= Void then
				-- we are in a multi-block which is the value of a keyed object
				-- so create the object with the key id
				create complex_object_node.make_identified(obj_id)
				if not attr_nodes.item.has_child(complex_object_node.node_id) then
					debug("dADL_parse")
						io.put_string(indent + "multiple_attr_object_block_head; attr_nodes(<<" + 
							attr_nodes.item.rm_attr_name + ">>).item.put_child(complex_object_node(" + 
							complex_object_node.node_id + "))%N")
					end
					attr_nodes.item.put_child(complex_object_node)
				else
					raise_error
					report_error("Key must be unique; key [" + complex_object_node.node_id 
							+ "] already exists under attribute %"" + attr_nodes.item.rm_attr_name + "%"")
					abort
				end

				debug("dADL_parse")
					io.put_string(indent + "multiple_attr_object_block_head: PUSH Obj node%N")
					indent.append("%T")
				end
				complex_object_nodes.extend(complex_object_node)

				-- now create a generic attribute node to stand for the hidden attribute of the 
				-- generic object, e.g. it might be List<T>.items or whatever
				debug("dADL_parse")
					io.put_string(indent + "multiple_attr_object_block_head: create_attr_node.make_multiple_generic%N")
				end
				create attr_node.make_multiple_generic

				debug("dADL_parse")
					io.put_string(indent + "multiple_attr_object_block_head: complex_object_node(" + 
							complex_object_node.node_id + ").put_attribute(" + attr_node.rm_attr_name + ")%N")
				end
				if not complex_object_node.has_attribute(attr_node.rm_attr_name) then
					complex_object_node.put_attribute(attr_node)
				else
					raise_error
					report_error("Duplicate relationship: " + attr_node.rm_attr_name)
					abort
				end

				debug("dADL_parse")
					io.put_string(indent + "multiple_attr_object_block_head: PUSH attr node%N")
					indent.append("%T")
				end
				attr_nodes.extend(attr_node)
			end
		}
	;

keyed_objects: keyed_object
		{
		}
	| keyed_objects keyed_object
		{
		}
	;

keyed_object: object_key SYM_EQ object_block
		{
		}
	;

object_key: '[' simple_value ']'
		{
			obj_id := $2.out

			debug("dADL_parse")
				io.put_string(indent + "object_key: " + obj_id + 
					" (setting " + attr_nodes.item.rm_attr_name + " to Multiple)%N")
			end
			if not attr_nodes.is_empty then
				attr_nodes.item.set_multiple
			else
				raise_error
				report_error("generic object not enclosed by normal object not allowed")
				abort
			end
		}
	;

--
-- --------------------------- single attr objects -------------------------------
--

single_attr_object_block: untyped_single_attr_object_block
		{
			debug("dADL_parse")
				io.put_string(indent + "untyped single_attr_object_block%N")
			end
			$$ := $1
		}
	| V_TYPE_IDENTIFIER untyped_single_attr_object_block
		{
			debug("dADL_parse")
				io.put_string(indent + "typed single_attr_object_block; type = " + $1 + "%N")
			end
			$2.set_type_name($1)
			$$ := $2
		}
	;

--
-- An untyped_single_attr_object_block is any block of the form:
--	<
--		attr1 = <...>
--		attr2 = <...>
--		attrN = <...>
--	>
--
untyped_single_attr_object_block: single_attr_object_complex_head SYM_END_DBLOCK
		{
			debug("dADL_parse")
				io.put_string(indent + "empty_object_complex_body: POP Object node(" + 
					complex_object_nodes.item.node_id + ")%N")
				indent.remove_tail(1)
			end
			$$ := complex_object_nodes.item
			complex_object_nodes.remove
		}
	| single_attr_object_complex_head attr_vals SYM_END_DBLOCK
		{
			debug("dADL_parse")
				io.put_string(indent + "single_attr_object_complex_body: POP Object node(" + 
					complex_object_nodes.item.node_id + ")%N")
				indent.remove_tail(1)
			end
			$$ := complex_object_nodes.item
			complex_object_nodes.remove
		}
	;

single_attr_object_complex_head: SYM_START_DBLOCK
		{
			-- if parent attr is not multiple, create an anon object; else an object identified by a key
			if attr_nodes.is_empty or else not attr_nodes.item.is_multiple then
				debug("dADL_parse")
					io.put_string(indent + "single_attr_object_complex_head: create complex_object_node.make_anonymous%N")
				end
				create complex_object_node.make_anonymous
			else
				debug("dADL_parse")
					io.put_string(indent + "single_attr_object_complex_head: create complex_object_node.make (" + obj_id + ")%N")
				end
				create complex_object_node.make_identified(obj_id)
				obj_id := Void
			end

			-- now put the new object under its attribute, if one exists
			if not attr_nodes.is_empty then
				if not attr_nodes.item.has_child(complex_object_node.node_id) then
					debug("dADL_parse")
						io.put_string(indent + "single_attr_object_complex_head; attr_nodes(<<" + 
							attr_nodes.item.rm_attr_name + ">>).item.put_child(complex_object_node(" + 
							complex_object_node.node_id + "))%N")
					end
					attr_nodes.item.put_child(complex_object_node)
				else
					raise_error
					report_error("Key must be unique; key [" + complex_object_nodes.item.node_id 
								+ "] already exists under attribute %"" + attr_nodes.item.rm_attr_name + "%"")
					abort
				end
			end

			-- finally, put the new object on the object stack
			debug("dADL_parse")
				io.put_string(indent + "single_attr_object_complex_head: PUSH Obj node%N")
				indent.append("%T")
			end
			complex_object_nodes.extend(complex_object_node)
		}
	;


--
-- ------------------------- primitive objects ---------------------
--
primitive_object_block: untyped_primitive_object_block
		{
			debug("dADL_parse")
				io.put_string(indent + "untyped primitive_object_block%N")
			end
			$$ := $1
		}
	| V_TYPE_IDENTIFIER untyped_primitive_object_block
		{
			debug("dADL_parse")
				io.put_string(indent + "typed primitive_object_block; type = " + $1 + "%N")
			end
			$2.set_type_name($1)
			$$ := $2
		}
	;

untyped_primitive_object_block: SYM_START_DBLOCK primitive_object_value SYM_END_DBLOCK
		{
			debug("dADL_parse")
				io.put_string(indent + "untyped_primitive_object_block; attr_nodes(<<" + 
						attr_nodes.item.rm_attr_name + ">>).item.put_child(<<" + 
						leaf_object_node.as_string + ">>)%N")
			end
			if not attr_nodes.item.has_child(leaf_object_node.node_id) then
				attr_nodes.item.put_child(leaf_object_node)
				$$ := leaf_object_node
			else
				raise_error
				report_error("Key must be unique; key [" + leaf_object_node.node_id 
						+ "] already exists under attribute %"" + attr_nodes.item.rm_attr_name + "%"")
				abort
			end
		}
	;

primitive_object_value: simple_value
		{
			if obj_id /= Void then
				create {DT_PRIMITIVE_OBJECT} leaf_object_node.make_identified($1, obj_id)
				obj_id := Void
			else
				create {DT_PRIMITIVE_OBJECT} leaf_object_node.make_anonymous($1)
			end
		}
	| simple_list_value
		{
			if obj_id /= Void then
				create {DT_PRIMITIVE_OBJECT_LIST} leaf_object_node.make_identified($1, obj_id)
				obj_id := Void
			else
				create {DT_PRIMITIVE_OBJECT_LIST} leaf_object_node.make_anonymous($1)
			end
		}
	| simple_interval_value
		{
			if obj_id /= Void then
				create {DT_PRIMITIVE_OBJECT_INTERVAL} leaf_object_node.make_identified($1, obj_id)
				obj_id := Void
			else
				create {DT_PRIMITIVE_OBJECT_INTERVAL} leaf_object_node.make_anonymous($1)
			end
		}
	| term_code
		{
			if obj_id /= Void then
				create {DT_PRIMITIVE_OBJECT} leaf_object_node.make_identified($1, obj_id)
				obj_id := Void
			else
				create {DT_PRIMITIVE_OBJECT} leaf_object_node.make_anonymous($1)
			end
		}
	| term_code_list_value
		{
			if obj_id /= Void then
				create {DT_PRIMITIVE_OBJECT_LIST} leaf_object_node.make_identified($1, obj_id)
				obj_id := Void
			else
				create {DT_PRIMITIVE_OBJECT_LIST} leaf_object_node.make_anonymous($1)
			end
		}
-- FIXME: query syntax is obsolete from 01/jun/2005; remove when backward compatibility no longer needed
	| query
	;

-- FIXME: query syntax is obsolete from 01/jun/2005; remove when backward compatibility no longer needed
query: SYM_QUERY_FUNC '(' V_STRING ',' V_STRING ')'
		{
			raise_error
			report_error("query syntax is obsolete: use a URI instead e.g. [1234] = <http://free.terminology.org?terminology='snomed'&&is-a[94859384]>")
			abort
		}
	;

simple_value: string_value
		{ 
			$$ := $1
		}
	| integer_value
		{ 
			$$ := $1
		}
	| real_value
		{ 
			$$ := $1
		}
	| boolean_value
		{ 
			$$ := $1
		}
	| character_value
		{ 
			$$ := $1
		}
	| date_value
		{ 
			$$ := $1
		}
	| time_value
		{ 
			$$ := $1
		}
	| date_time_value
		{ 
			$$ := $1
		}
	| duration_value
		{ 
			$$ := $1
		}
	| uri_value
		{ 
			$$ := $1
		}
	;

simple_list_value: string_list_value
		{ 
			$$ := $1
		}
	| integer_list_value
		{ 
			$$ := $1
		}
	| real_list_value
		{ 
			$$ := $1
		}
	| boolean_list_value
		{ 
			$$ := $1
		}
	| character_list_value
		{ 
			$$ := $1
		}
	| date_list_value
		{ 
			$$ := $1
		}
	| time_list_value
		{ 
			$$ := $1
		}
	| date_time_list_value
		{ 
			$$ := $1
		}
	| duration_list_value
		{ 
			$$ := $1
		}
	;

simple_interval_value: integer_interval_value
		{ 
			$$ := $1
		}
	| real_interval_value
		{ 
			$$ := $1
		}
	| date_interval_value
		{ 
			$$ := $1
		}
	| time_interval_value
		{ 
			$$ := $1
		}
	| date_time_interval_value
		{ 
			$$ := $1
		}
	| duration_interval_value
		{ 
			$$ := $1
		}
	;

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

	error_text: STRING

	source_start_line: INTEGER
			-- offset of source in other document, else 0

	output: DT_COMPLEX_OBJECT_NODE
			-- parsed structure

feature {NONE} -- Parse Tree

	complex_object_nodes: ARRAYED_STACK[DT_COMPLEX_OBJECT_NODE]
	complex_object_node: DT_COMPLEX_OBJECT_NODE
	leaf_object_node: DT_OBJECT_LEAF
	last_object_node: DT_OBJECT_ITEM

	attr_nodes: ARRAYED_STACK[DT_ATTRIBUTE_NODE]
	attr_node: DT_ATTRIBUTE_NODE

	obj_id: STRING
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
