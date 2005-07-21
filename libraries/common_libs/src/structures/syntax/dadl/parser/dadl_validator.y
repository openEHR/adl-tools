%{
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
%token SYM_QUERY_FUNC

%token SYM_TRUE SYM_FALSE 
%left SYM_LT SYM_GT SYM_LE SYM_GE

%token ERR_CHARACTER ERR_STRING

%type <INTEGER> integer_value
%type <REAL> real_value
%type <BOOLEAN> boolean_value
%type <CHARACTER> character_value
%type <DATE> date_value
%type <DATE_TIME> date_time_value
%type <TIME> time_value
%type <DATE_TIME_DURATION> duration_value, duration_magnitude
%type <CODE_PHRASE> term_code
%type <URI> uri_value

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

			debug("ADL_parse")
				io.put_string("Anonymous object data definition validated%N")
			end
			accept
		}
	| typed_object
		{
			output := complex_object_nodes.item

			debug("ADL_parse")
				io.put_string("Typed object data definition validated%N")
			end
			accept
		}
	| error
		{
			debug("ADL_parse")
				io.put_string("dADL text NOT validated%N")
			end
			abort
		}
	;


---------------------- body ---------------------

typed_object: typed_object_head SYM_START_DBLOCK attr_vals SYM_END_DBLOCK
		{
			debug("ADL_parse")
				io.put_string(indent + "typed_object_received " +  complex_object_nodes.item.node_id + "%N")
			end
		}
	| typed_object_head SYM_START_DBLOCK SYM_END_DBLOCK
		{
			debug("ADL_parse")
				io.put_string(indent + "empty typed_object_received " +  complex_object_nodes.item.node_id + "%N")
			end
		}
	;

typed_object_head: V_TYPE_IDENTIFIER
		{
			-- create object root node
			debug("ADL_parse")
				io.put_string(indent + "typed_object_head: create object_node(" + $1 + ")%N")
				io.put_string(indent + "typed_object_head: PUSH Object node%N")
				indent.append("%T")
			end
			create object_node.make_typed($1)
			complex_object_nodes.extend(object_node)
		}
	| V_LOCAL_TERM_CODE_REF SYM_EQ V_TYPE_IDENTIFIER
		{
			-- create object root node
			debug("ADL_parse")
				io.put_string(indent + "typed_identified_object_head: create object_node(" + "[" + $1 + "] = " + $3 + ")%N")
				io.put_string(indent + "typed_identified_object_head: PUSH Object node%N")
				indent.append("%T")
			end
			create object_node.make_typed_identified($3, $1)
			complex_object_nodes.extend(object_node)
		}
	;

attr_vals: attr_val
		{
			debug("ADL_parse")
				io.put_string(indent + "attr_val complete%N")
			end
		}
	| attr_vals attr_val
		{
			debug("ADL_parse")
				io.put_string(indent + "attr_val complete%N")
			end
		}
	| attr_vals ';' attr_val
		{
			debug("ADL_parse")
				io.put_string(indent + "attr_val complete%N")
			end
		}
	;


attr_val: attr_id SYM_EQ attr_val_body
		{
			if not attr_nodes.item.is_multiple then
				debug("ADL_parse")
					io.put_string(indent + "attr_val: POP single attr node (" +  attr_nodes.item.rm_attr_name+ ")%N")
					indent.remove_tail(1)
				end
				attr_nodes.remove
			end
		}
	;

attr_id: V_ATTRIBUTE_IDENTIFIER
		{
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
				io.put_string(indent + "attr_id: create_attr_node.make_single(<<" + $1 + ">>)%N")
				io.put_string(indent + "attr_id: PUSH attr node%N")
			end
			create attr_node.make_single($1)
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
		}
	| V_ATTRIBUTE_IDENTIFIER '(' simple_value ')'
		{
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
			if not complex_object_nodes.item.has_attribute($1) then
				debug("ADL_parse")
					io.put_string(indent + "attr_id: create_attr_node.make_multiple(<<" + $1 + ">>)%N")
					io.put_string(indent + "attr_id: PUSH attr node%N")
					indent.append("%T")
				end

				create attr_node.make_multiple($1)
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
				attr_nodes.extend(complex_object_nodes.item.attribute($1))
			end

			node_qualifier := $3.out
		}
	| V_ATTRIBUTE_IDENTIFIER '(' error
		{
			raise_error
			report_error("Error in qualifier; expecting string, integer, real, character, date/time")
			abort
		}
	;

attr_val_body: object_empty
	| object_complex_head object_complex_body -- have a anonymous OBJECT_NODE, connected to parent rel
	| object_basic -- have a simple OBJECT_NODE, connected to parent rel
	;

object_complex_head: SYM_START_DBLOCK
		{
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
		}
	;

object_complex_body: attr_vals SYM_END_DBLOCK
		{
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
		}
	;

object_basic: SYM_START_DBLOCK basic_object_val SYM_END_DBLOCK
		{
			debug("ADL_parse")
				io.put_string(indent + "object_basic; attr_nodes(<<" + attr_nodes.item.rm_attr_name + ">>).item.put_child(<<" + object_item.as_string + ">>)%N")
			end
			attr_nodes.item.put_child(object_item)
		}
	;

object_empty: SYM_START_DBLOCK SYM_END_DBLOCK
		{
			debug("ADL_parse")
				io.put_string(indent + "object_empty; no child to put)%N")
			end
		}
	;

basic_object_val: simple_value
		{
			if node_qualifier /= Void then
				create primitive_object_node.make_identified($1, node_qualifier)
				node_qualifier := Void
			else
				create primitive_object_node.make_anonymous($1)
			end
			object_item := primitive_object_node
		}
	| simple_list_value
		{
			if node_qualifier /= Void then
				create primitive_object_list_node.make_identified($1, node_qualifier)
				node_qualifier := Void
			else
				create primitive_object_list_node.make_anonymous($1)
			end
			object_item := primitive_object_list_node
		}
	| simple_interval_value
		{
			if node_qualifier /= Void then
				create primitive_object_interval_node.make_identified($1, node_qualifier)
				node_qualifier := Void
			else
				create primitive_object_interval_node.make_anonymous($1)
			end
			object_item := primitive_object_interval_node
		}
	| term_code
		{
			if node_qualifier /= Void then
				create primitive_object_node.make_identified($1, node_qualifier)
				node_qualifier := Void
			else
				create primitive_object_node.make_anonymous($1)
			end
			object_item := primitive_object_node
		}
	| term_code_list_value
		{
			if node_qualifier /= Void then
				create primitive_object_list_node.make_identified($1, node_qualifier)
				node_qualifier := Void
			else
				create primitive_object_list_node.make_anonymous($1)
			end
			object_item := primitive_object_list_node
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
			create integer_ref
			integer_ref.set_item($1)
			integer_ref_list.extend(integer_ref)
			create integer_ref
			integer_ref.set_item($3)
			integer_ref_list.extend(integer_ref)
			$$ := integer_ref_list
		}
	| integer_list_value ',' integer_value
		{
			create integer_ref
			integer_ref.set_item($3)
			integer_ref_list.extend(integer_ref)
			$$ := integer_ref_list
		}
	| integer_value ',' SYM_LIST_CONTINUE
		{
			create integer_ref_list.make(0)
			create integer_ref
			integer_ref.set_item($1)
			integer_ref_list.extend(integer_ref)
			$$ := integer_ref_list
		}
	;

integer_interval_value: SYM_INTERVAL_DELIM integer_value SYM_ELLIPSIS integer_value SYM_INTERVAL_DELIM
		{
			create integer_ref
			integer_ref.set_item($2)
			create integer_ref_2
			integer_ref_2.set_item($4)
			create integer_interval.make_bounded(integer_ref, integer_ref_2, True, True)
			$$ := integer_interval
		}
	| SYM_INTERVAL_DELIM SYM_LT integer_value SYM_INTERVAL_DELIM
		{
			create integer_ref
			integer_ref.set_item($3)
			create integer_interval.make_lower_unbounded(integer_ref, False)
			$$ := integer_interval
		}
	| SYM_INTERVAL_DELIM SYM_LE integer_value SYM_INTERVAL_DELIM
		{
			create integer_ref
			integer_ref.set_item($3)
			create integer_interval.make_lower_unbounded(integer_ref, True)
			$$ := integer_interval
		}
	| SYM_INTERVAL_DELIM SYM_GT integer_value SYM_INTERVAL_DELIM
		{
			create integer_ref
			integer_ref.set_item($3)
			create integer_interval.make_upper_unbounded(integer_ref, False)
			$$ := integer_interval
		}
	| SYM_INTERVAL_DELIM SYM_GE integer_value SYM_INTERVAL_DELIM
		{
			create integer_ref
			integer_ref.set_item($3)
			create integer_interval.make_upper_unbounded(integer_ref, True)
			$$ := integer_interval
		}
	| SYM_INTERVAL_DELIM integer_value SYM_INTERVAL_DELIM
		{
			create integer_ref
			integer_ref.set_item($2)
			create integer_interval.make_point(integer_ref)
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
			create real_ref
			real_ref.set_item($1)
			real_ref_list.extend(real_ref)

			create real_ref
			real_ref.set_item($3)
			real_ref_list.extend(real_ref)
			$$ := real_ref_list
		}
	| real_list_value ',' real_value
		{
			create real_ref
			real_ref.set_item($3)
			real_ref_list.extend(real_ref)
			$$ := real_ref_list
		}
	| real_value ',' SYM_LIST_CONTINUE
		{
			create real_ref_list.make(0)
			create real_ref
			real_ref.set_item($1)
			real_ref_list.extend(real_ref)
			$$ := real_ref_list
		}
	;

real_interval_value: SYM_INTERVAL_DELIM real_value SYM_ELLIPSIS real_value SYM_INTERVAL_DELIM
		{
			create real_ref
			real_ref.set_item($2)
			create real_ref_2
			real_ref_2.set_item($4)
			create real_interval.make_bounded(real_ref, real_ref_2, True, True)
			$$ := real_interval
		}
	| SYM_INTERVAL_DELIM SYM_LT real_value SYM_INTERVAL_DELIM
		{
			create real_ref
			real_ref.set_item($3)
			create real_interval.make_lower_unbounded(real_ref, False)
			$$ := real_interval
		}
	| SYM_INTERVAL_DELIM SYM_LE real_value SYM_INTERVAL_DELIM
		{
			create real_ref
			real_ref.set_item($3)
			create real_interval.make_lower_unbounded(real_ref, True)
			$$ := real_interval
		}
	| SYM_INTERVAL_DELIM SYM_GT real_value SYM_INTERVAL_DELIM
		{
			create real_ref
			real_ref.set_item($3)
			create real_interval.make_upper_unbounded(real_ref, False)
			$$ := real_interval
		}
	| SYM_INTERVAL_DELIM SYM_GE real_value SYM_INTERVAL_DELIM
		{
			create real_ref
			real_ref.set_item($3)
			create real_interval.make_upper_unbounded(real_ref, True)
			$$ := real_interval
		}
	| SYM_INTERVAL_DELIM real_value SYM_INTERVAL_DELIM
		{
			create real_ref
			real_ref.set_item($2)
			create real_interval.make_point(real_ref)
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
			create boolean_ref
			boolean_ref.set_item($1)
			boolean_list.extend(boolean_ref)
			create boolean_ref
			boolean_ref.set_item($3)
			boolean_list.extend(boolean_ref)
			$$ := boolean_list
		}
	| boolean_list_value ',' boolean_value
		{
			create boolean_ref
			boolean_ref.set_item($3)
			boolean_list.extend(boolean_ref)
			$$ := boolean_list
		}
	| boolean_value ',' SYM_LIST_CONTINUE
		{
			create boolean_list.make(0)
			create boolean_ref
			boolean_ref.set_item($1)
			boolean_list.extend(boolean_ref)
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
			create character_ref
			character_ref.set_item($1)
			character_list.extend(character_ref)
			create character_ref
			character_ref.set_item($3)
			character_list.extend(character_ref)
			$$ := character_list
		}
	| character_list_value ',' character_value
		{
			create character_ref
			character_ref.set_item($3)
			character_list.extend(character_ref)
			$$ := character_list
		}
	| character_value ',' SYM_LIST_CONTINUE
		{
			create character_list.make(0)
			create character_ref
			character_ref.set_item($1)
			character_list.extend(character_ref)
			$$ := character_list
		}
	;

date_value: V_INTEGER '-' V_INTEGER '-' V_INTEGER -- in ISO8601 form yyyy-MM-dd
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

time_value: time_point
		{
			$$ := a_time
		}
	| time_point time_zone
		{
			$$ := a_time
		}
	;

time_point: V_INTEGER ':' V_INTEGER ':' V_INTEGER
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

date_time_value: date_value time_value
		{
			create a_date_time.make_by_date_time($1, $2)
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
