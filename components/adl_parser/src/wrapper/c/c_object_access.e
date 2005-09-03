indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	C_OBJECT_ACCESS

inherit
	C_ADL_INTERFACE

feature -- C_OBJECT Methods
	c_object_node_id(a_handle: INTEGER): POINTER is
			-- Returns the node id of given C_OBJECT's handler
		local
			obj: ANY
		do
			obj := adl_objects.c_objects.item (a_handle).node_id.to_c
			Result := $obj
		end
	
	c_object_set_object_id(a_handle: INTEGER; an_id: POINTER) is
			-- Sets new node id for given c_object
		local
			c_an_id: C_STRING
		do
			create c_an_id.make_by_pointer (an_id)
			adl_objects.c_objects.item (a_handle).set_object_id (c_an_id.string)
		end
		
	
	c_object_rm_type_name(a_handle: INTEGER): POINTER is
			-- Return the rm type name for specified C_OBJECT
		local
			obj: ANY
		do
			obj := adl_objects.c_objects.item (a_handle).rm_type_name.to_c
			Result := $obj
		end
	
	c_object_generating_type(a_handle: INTEGER): POINTER is
		local
			obj: ANY
		do
			obj := adl_objects.c_objects.item (a_handle).generating_type.to_c
			Result := $obj
		end
	
	c_object_any_allowed(a_handle: INTEGER): BOOLEAN is
			-- returns if c_object can have any value
		do
			Result := adl_objects.c_objects.item (a_handle).any_allowed
		end
	
	c_object_set_any_allowed(a_handle: INTEGER) is
			-- sets if this c_object can have any value
		do
			adl_objects.c_objects.item(a_handle).set_any_allowed
		end
	
	-- At the moment, this could be trivial, on construction, all occurrences for each
	-- c_object share the same handler, so this method is kind of useless, but keeping it
	-- here due to the method below which could change this during editting...
	c_object_occurrences(a_handle: INTEGER): INTEGER is
			-- returns the handler for the occurrences for given c_object handler
		local
			interval1: OE_INTERVAL[INTEGER]
			interval2: OE_INTERVAL[INTEGER]
		do
			interval1 := adl_objects.c_objects.item (a_handle).occurrences
			from
				adl_objects.integer_intervals.start
			until
				adl_objects.integer_intervals.off
			loop
				interval2 := adl_objects.integer_intervals.item_for_iteration
				if interval1 = interval2 then
					Result := adl_objects.integer_intervals.key_for_iteration
				end
				adl_objects.integer_intervals.forth
			end
		end
	
	
	c_object_set_occurrences(a_handle, h_integer_interval: INTEGER) is
			-- set_occurrences for any C_OBJECT
		do
			adl_objects.c_objects.item (a_handle).set_occurrences(adl_objects.integer_intervals.item (h_integer_interval))
		end

feature -- C_COMPLEX_OBJECT Methods

	c_complex_object_attributes_count(a_handle: INTEGER): INTEGER is
			-- Returns the attributes properties size
		do
			Result := adl_objects.c_complex_objects.item (a_handle).attributes.count
		end

	c_complex_object_attributes_get(a_handle, i_th: INTEGER): INTEGER is
			-- Returns the C_ATTRIBUTE handler corresponding to the given index
		local
			attribute1: C_ATTRIBUTE
			attribute2: C_ATTRIBUTE
		do
			attribute1 := adl_objects.c_complex_objects.item (a_handle).attributes.i_th (i_th)
			from
				adl_objects.c_attributes.start
			until
				adl_objects.c_attributes.off
			loop
				attribute2 := adl_objects.c_attributes.item_for_iteration
				if attribute1 = attribute2 then
					Result := adl_objects.c_attributes.key_for_iteration
				end
				adl_objects.c_attributes.forth
			end
		end
	
	c_complex_object_has_attribute(a_handle: INTEGER; an_attribute: POINTER): BOOLEAN is
		local
			c_an_attribute: C_STRING
		do
			create c_an_attribute.make_by_pointer (an_attribute)
			Result := adl_objects.c_complex_objects.item (a_handle).has_attribute (c_an_attribute.string)
		end
	
	c_complex_object_all_paths(a_handle: INTEGER): POINTER is
			-- returns array of all paths for given c_complex_object
		do
			Result := eif_list_string_to_c_array(adl_objects.c_complex_objects.item (a_handle).all_paths)
		end
	
	c_complex_object_all_paths_count(a_handle: INTEGER): INTEGER is
			-- support function
		do
			Result := adl_objects.c_complex_objects.item (a_handle).all_paths.count
		end
		
	
	c_complex_object_attribute_at_path(a_handle: INTEGER; a_path: POINTER): INTEGER is
			-- returns the c_attribute for given path name from given c_complex_object
		local
			c_a_path: C_STRING
			attribute1: C_ATTRIBUTE
			attribute2: C_ATTRIBUTE
		do
			create c_a_path.make_by_pointer (a_path)
			attribute1 := adl_objects.c_complex_objects.item (a_handle).c_attribute_at_path (c_a_path.string)
			from
				adl_objects.c_attributes.start
			until
				adl_objects.c_attributes.off
			loop
				attribute2 := adl_objects.c_attributes.item_for_iteration
				if attribute1 = attribute2 then
					Result := adl_objects.c_attributes.key_for_iteration
				end
				adl_objects.c_attributes.forth
			end
		end
	

feature -- C_ATTRIBUTE Methods

	c_attributes_count: INTEGER is
			-- Number of C_ATTRIBUTES
		do
			Result := adl_objects.c_attributes.count
		end
		
	c_attribute_children_count(a_handle:INTEGER): INTEGER is
			-- Returns number of children for C_ATTRIBUTE
		do
			Result := adl_objects.c_attributes.item (a_handle).children.count
		end
	
	c_attribute_children_get(a_handle, i_th: INTEGER): INTEGER is
			-- Returns the C_OBJECT handler corresponding to the given index
		local
			attribute1: C_OBJECT
			attribute2: C_OBJECT
		do
			attribute1 := adl_objects.c_attributes.item (a_handle).children.i_th (i_th)
			from
				adl_objects.c_objects.start
			until
				adl_objects.c_objects.off
			loop
				attribute2 := adl_objects.c_objects.item_for_iteration
				if attribute1 = attribute2 then
					Result := adl_objects.c_objects.key_for_iteration
				end
				adl_objects.c_objects.forth
			end
		end
		
	c_attribute_rm_attribute_name(a_handle: INTEGER): POINTER is		
			-- Returns the RM attribute name for required C_ATTRIBUTE
		local
			obj: ANY
		do
			obj := adl_objects.c_attributes.item (a_handle).rm_attribute_name.to_c
			Result := $obj
		end
	
	c_attribute_set_cardinality(a_handle, cardinality_handle: INTEGER) is
			-- Sets the cardinality for given c_attribute
		local
			card: CARDINALITY
		do
			card := adl_objects.cardinalities.item (cardinality_handle)
			adl_objects.c_attributes.item (a_handle).set_cardinality (card)
		end
	
		
feature -- CARDINALITY Methods
	
	cardinality_set_unordered(a_handle: INTEGER) is
			-- set this cardinality as unordered
		do
			adl_objects.cardinalities.item (a_handle).set_unordered
		end

feature -- INTEGER_INTERVAL Methods
	
	integer_interval_upper_unbounded(a_handle:INTEGER): BOOLEAN is
			-- returns if this cardinality is upper_bounded
		do
			Result := adl_objects.integer_intervals.item (a_handle).upper_unbounded
		end
	
	integer_interval_lower_unbounded(a_handle:INTEGER): BOOLEAN is
			-- returns if this cardinality is lower_bounded
		do
			Result := adl_objects.integer_intervals.item (a_handle).lower_unbounded
		end
	
	integer_interval_upper(a_handle:INTEGER): INTEGER is
			-- returns the cardinality's upper bound
		do
			Result := adl_objects.integer_intervals.item (a_handle).upper
		end
	
	integer_interval_lower(a_handle:INTEGER): INTEGER is
			-- returns the cardinality's lower bound
		do
			Result := adl_objects.integer_intervals.item (a_handle).lower
		end

feature -- REAL_INTERVAL Methods
	
	real_interval_upper_unbounded(a_handle:INTEGER): BOOLEAN is
			-- returns if this cardinality is upper_bounded
		do
			Result := adl_objects.real_intervals.item (a_handle).upper_unbounded
		end
	
	real_interval_lower_unbounded(a_handle:INTEGER): BOOLEAN is
			-- returns if this cardinality is lower_bounded
		do
			Result := adl_objects.real_intervals.item (a_handle).lower_unbounded
		end
	
	real_interval_upper(a_handle:INTEGER): REAL is
			-- returns the cardinality's upper bound
		do
			Result := adl_objects.real_intervals.item (a_handle).upper
		end
	
	real_interval_lower(a_handle:INTEGER): REAL is
			-- returns the cardinality's lower bound
		do
			Result := adl_objects.real_intervals.item (a_handle).lower
		end

feature -- ARCHETYPE_INTERNAL_REF Methods

	archetype_internal_ref_target_path(a_handle: INTEGER): POINTER is
			-- returns the internal ref's target path
		local
			obj : ANY
		do
			obj := adl_objects.archetype_internal_refs.item (a_handle).target_path.to_c
			Result := $obj
		end

feature -- C_PRIMITIVE Methods
	
	c_primitive_item(a_handle: INTEGER): INTEGER is
			-- returns the handle for the item tied to the primitive item
			-- From loading archetype, this may not work as primitives not populated as of yet
		local
			primitive1: C_PRIMITIVE
			primitive2: C_PRIMITIVE
		do
			primitive1 := adl_objects.c_primitive_objects.item (a_handle).item
			from
				adl_objects.c_primitives.start
			until
				adl_objects.c_primitives.off
			loop
				primitive2 := adl_objects.c_primitives.item_for_iteration
				if primitive1 = primitive2 then
					Result := adl_objects.c_primitives.key_for_iteration
				end
				adl_objects.c_primitives.forth
			end
		end
	
	c_primitive_item_as_string(a_handle: INTEGER): POINTER is
			-- returns the c_primitive as a string...
		local
			obj: ANY
		do
			obj := adl_objects.c_primitive_objects.item(a_handle).item.as_string.to_c
			Result := $obj
		end

feature -- C_INTEGER Methods
	
	c_integer_interval(a_handle: INTEGER): INTEGER is		
			-- returns the handle for the interval tied to c_integer type
			-- issue here is whether specific integer intervals have been
			-- populated or not, in addition to C_INTEGER primitive
		local
			c_int : C_INTEGER
			interval1: OE_INTERVAL[INTEGER]
			interval2: OE_INTERVAL[INTEGER]
		do
			c_int ?= adl_objects.c_primitives.item (a_handle)
			if c_int /= Void then
				interval1 := c_int.interval
				from
					adl_objects.integer_intervals.start
				until
					adl_objects.integer_intervals.off
				loop
					interval2 := adl_objects.integer_intervals.item_for_iteration
					if interval1 = interval2 then
						Result := adl_objects.integer_intervals.key_for_iteration	
					end
					adl_objects.integer_intervals.forth
				end
			end
		end
		

feature -- C_STRING Methods

	c_string_add_string(a_handle: INTEGER; a_string: POINTER) is
			-- adds a string to the specified c_string
		local
			c_a_string : C_STRING
			string : OE_C_STRING
		do
			create c_a_string.make_by_pointer(a_string)
			--string ?= adl_objects.c_objects.item (a_handle)
			string ?= adl_objects.c_primitives.item (a_handle)
			if string /= Void then
				string.add_string (c_a_string.string)
			end
		end
	
	c_string_strings_count(a_handle: INTEGER): INTEGER is
			-- returns number of strings within strings array for C_STRING object
		local
			string: OE_C_STRING
		do
			-- Using cast for time being
			string ?= adl_objects.c_primitives.item (a_handle)
			if string /= Void then
				Result := string.strings.count
			end
		end
	
	c_string_strings(a_handle: INTEGER): POINTER is
			-- returns the array of strings for C_STRING object
		local
			string : OE_C_STRING
		do
			string ?= adl_objects.c_primitives.item (a_handle)
			if string /= Void then
				Result := eif_list_string_to_c_array(string.strings)
			end
		end
		
		

feature -- C_QUANTITY Methods

-- This could get iffy, within C_QUANTITY objects is a list of C_QUANTITY_ITEMS which at the moment has
-- no hash table of handles for it, at the moment, would have to be done through each c_quantity item
-- This could get ugly...

	c_quantity_add_unit_constraint(a_handle: INTEGER; a_string: POINTER; interval_handle: INTEGER) is
			-- adds a unit constraint to the specified c_quantity
			-- interval handler must point to a OE_INTERVAL[REAL]
		local
			c_a_string: C_STRING
			interval: OE_INTERVAL[REAL]
		do
			create c_a_string.make_by_pointer(a_string)
			interval := adl_objects.real_intervals.item (interval_handle)
			adl_objects.c_quantities.item (a_handle).add_unit_constraint (c_a_string.string, interval)
		end

	c_quantity_property(a_handle: INTEGER): POINTER is
			-- returns the property for given c_quantity
		local
			obj: ANY
		do
			obj := adl_objects.c_quantities.item (a_handle).property.to_c
			Result := $obj
		end
		
	c_quantity_set_property(a_handler: INTEGER; a_property: POINTER) is
			-- sets the property for given c_quantity
		local
			c_a_property: C_STRING
		do
			create c_a_property.make_by_pointer (a_property)
			adl_objects.c_quantities.item (a_handler).set_property (c_a_property.string)
		end
	
	c_quantity_list_count(a_handle: INTEGER): INTEGER is
			-- returns the number of elements in list property of C_QUANTITY
		local
			quantity: C_QUANTITY
		do
			-- Temporarily accessing through c_objects hash table
			--Result := adl_objects.c_quantities.item (a_handle).list.count
			quantity ?= adl_objects.c_objects.item (a_handle)
			if quantity /= Void then
				Result := quantity.list.count
			end
		end
	
	c_quantity_list_get(a_handle, i_th: INTEGER): INTEGER is
			-- returns the C_QUANTITY_ITEM handle for given list element in C_QUANTITY
		local
			qi1 : C_QUANTITY_ITEM
			qi2 : C_QUANTITY_ITEM
		do
			qi1 := adl_objects.c_quantities.item (a_handle).list.i_th (i_th)
			from
				adl_objects.c_quantity_items.start
			until
				adl_objects.c_quantity_items.off
			loop
				qi2 := adl_objects.c_quantity_items.item_for_iteration
				if qi1 = qi2 then
					Result := adl_objects.c_quantity_items.key_for_iteration
				end
				adl_objects.c_quantity_items.forth
			end
		end
	
	c_quantity_has_assumed_value(a_handle: INTEGER): BOOLEAN is
			-- returns if this C_QUANTITY has an assumed value
		do
			Result := adl_objects.c_quantities.item (a_handle).has_assumed_value
		end

	c_quantity_assumed_value_units(a_handle: INTEGER): POINTER is
			-- returns if this C_QUANTITY has an assumed value
		local
			obj : ANY
		do
			obj := adl_objects.c_quantities.item (a_handle).assumed_value.units.to_c
			Result := $obj
		end
	
	c_quantity_assumed_value_magnitude(a_handle: INTEGER): REAL is
			-- returns this C_QUANTITY's assumed magnitude
		do
			Result := adl_objects.c_quantities.item (a_handle).assumed_value.magnitude
		end
		

feature -- C_QUANTITY_ITEM Methods
	
	c_quantity_item_any_magnitude_allowed(a_handle: INTEGER): BOOLEAN is
			-- returns if this C_QUANTITY_ITEM allows any magnitude
		do
			Result := adl_objects.c_quantity_items.item (a_handle).any_magnitude_allowed
		end
	
	c_quantity_item_units(a_handle: INTEGER): POINTER is
			-- retusn this C_QUANTITY_ITEM's unit property
		local
			obj : ANY
		do
			obj := adl_objects.c_quantity_items.item (a_handle).units.to_c
			Result := $obj
		end
	
	c_quantity_item_magnitude(a_handle: INTEGER): INTEGER is		
			-- return the handle for the magnitude for given C_QUANTITY_ITEM
		local
			magnitude1: OE_INTERVAL[REAL]
			magnitude2: OE_INTERVAL[REAL]
		do
			magnitude1 := adl_objects.c_quantity_items.item (a_handle).magnitude
			from
				adl_objects.real_intervals.start
			until
				adl_objects.real_intervals.off
			loop
				magnitude2 := adl_objects.real_intervals.item_for_iteration
				if magnitude1 = magnitude2 then
					Result := adl_objects.real_intervals.key_for_iteration
				end
				adl_objects.real_intervals.forth
			end
		end
		

feature -- ARCHETYPE_SLOT Methods
	-- Other methods add_include and add_exclude are under C_ADL_FACTORY
	archetype_slot_has_includes(a_handle: INTEGER): BOOLEAN is
			-- returns if slot has any includes
		do
			Result := adl_objects.archetype_slots.item (a_handle).has_includes
		end
	
	archetype_slot_has_excludes(a_handle: INTEGER): BOOLEAN is
			-- returns if slot has any excludes
		do
			Result := adl_objects.archetype_slots.item (a_handle).has_excludes
		end
	
	archetype_slot_includes_count(a_handle: INTEGER): INTEGER is
			-- returns number of includes for given slot
		do
			Result := adl_objects.archetype_slots.item (a_handle).includes.count
		end
		
	archetype_slot_includes_get(a_handle, i_th: INTEGER): INTEGER is
			-- returns the handle for specific assertion in includes of slot
		local
			expr1: ASSERTION
			expr2: ASSERTION
		do
			expr1 := adl_objects.archetype_slots.item (a_handle).includes.i_th (i_th)
			from
				adl_objects.assertions.start
			until
				adl_objects.assertions.off
			loop
				expr2 := adl_objects.assertions.item_for_iteration
				if expr1 = expr2 then
					Result := adl_objects.assertions.key_for_iteration
				end
				adl_objects.assertions.forth
			end
		end

	archetype_slot_excludes_count(a_handle: INTEGER): INTEGER is
			-- returns number of excludes for given slot
		do
			Result := adl_objects.archetype_slots.item (a_handle).excludes.count
		end

	archetype_slot_excludes_get(a_handle, i_th: INTEGER): INTEGER is
			-- returns the handle for specific assertion in excludes of slot
		local
			expr1: ASSERTION
			expr2: ASSERTION
		do
			expr1 := adl_objects.archetype_slots.item (a_handle).excludes.i_th (i_th)
			from
				adl_objects.assertions.start
			until
				adl_objects.assertions.off
			loop
				expr2 := adl_objects.assertions.item_for_iteration
				if expr1 = expr2 then
					Result := adl_objects.assertions.key_for_iteration
				end
				adl_objects.assertions.forth
			end
		end

feature -- C_CODED_TERM Methods

	c_coded_term_as_string(a_handle: INTEGER): POINTER is
			-- returns the c_coded_term as a string
		local
			obj : ANY
			coded_term : C_CODED_TERM
		do
			coded_term?=adl_objects.c_objects.item(a_handle)
			if coded_term /= Void then
				obj := coded_term.as_string.to_c
				Result := $obj
			end
			--obj := adl_objects.c_coded_terms.item (a_handler).as_string.to_c
			
		end
	
	c_coded_term_has_assumed_value(a_handle: INTEGER): BOOLEAN is
			-- 
		local
			coded_term : C_CODED_TERM
		do
			coded_term ?= adl_objects.c_objects.item (a_handle)
			if coded_term /= Void then
				Result := coded_term.has_assumed_value
			end
		end
	
	c_coded_term_assumed_value(a_handle: INTEGER): POINTER is
			-- returns the c_coded_terms assumed value
			-- takes data from c_object hash table, as c_coded_term not populated as of yet
		local
			coded_term: C_CODED_TERM
			obj: ANY
		do
			coded_term ?= adl_objects.c_objects.item (a_handle)
			if coded_term /= Void then
				obj:=coded_term.assumed_value.to_c
				Result := $obj
			end
		end
		
	
feature -- ASSERTION Methods

	assertion_get_expression(a_handle: INTEGER): INTEGER is
		local
			expr1: EXPR_ITEM
			expr2: EXPR_ITEM
		do
			expr1 := adl_objects.assertions.item (a_handle).expression
			from
				adl_objects.expr_items.start
			until
				adl_objects.expr_items.off
			loop
				expr2 := adl_objects.expr_items.item_for_iteration
				if expr1 = expr2 then
					Result := adl_objects.expr_items.key_for_iteration
				end
				adl_objects.expr_items.forth
			end
		end

feature -- EXPR_ITEM Methods

	-- from what i can tell from the code, any expr_item types that are put into the
	-- hash table are not concurrently placed into c_object hash table so need these
	-- separate accessor methods
	
	expr_item_generating_type(a_handle: INTEGER): POINTER is
			-- returns the generating type for this EXPR_ITEM
		local	
			obj: ANY
		do
			obj := adl_objects.expr_items.item (a_handle).generating_type.to_c
			Result := $obj
		end

feature -- EXPR_BINARY_OPERATOR
	
	expr_binary_operator_right_operand_out(a_handle: INTEGER): POINTER is
			-- returns the right operand's out method for given EXPR_BINARY_OPERATOR
			-- called by the editor's ADL_Tools class
		local
			l_binary_operator: EXPR_BINARY_OPERATOR
			l_operand: EXPR_LEAF
			obj: ANY
		do
			l_binary_operator ?= adl_objects.expr_items.item (a_handle)
			if l_binary_operator /= Void then
				l_operand ?= l_binary_operator.right_operand
				if l_operand /= Void then
					obj := l_operand.out.to_c
					Result := $obj
				end
			end
		end

feature -- CONSTRAINT_REF Methods

	constraint_ref_target(a_handle: INTEGER): POINTER is
			-- Returns the target of given constraint_ref
			-- Note: no constraint refs are populated at the moment, so this could crash
			-- alternative is to to access via c_objects
		local
			obj: ANY
			ref: CONSTRAINT_REF
		do
			ref ?= adl_objects.c_objects.item (a_handle)
			if ref /= Void then
				obj:= ref.target.to_c
			end
			--obj := adl_objects.constraint_refs.item (a_handler).target.to_c
			Result := $obj
		end

feature --C_DATE_TIME Methods

c_date_time_pattern(a_handle: INTEGER): POINTER is
			-- returns the pattern for this c_date
		local
			obj: ANY
			datetime: C_DATE_TIME
		do
			datetime ?= adl_objects.c_primitives.item (a_handle)
			if datetime /= Void then
				obj := datetime.pattern.to_c
				Result := $obj
			end
		end

feature -- C_TIME Methods

c_time_pattern(a_handle: INTEGER): POINTER is
			-- returns the pattern for this c_date
		local
			obj: ANY
			time: C_TIME
		do
			time ?= adl_objects.c_primitives.item (a_handle)
			if time /= Void then
				obj := time.pattern.to_c
				Result := $obj
			end
		end

feature -- OE_C_DATE Methods

	c_date_pattern(a_handle: INTEGER): POINTER is
			-- returns the pattern for this c_date
		local
			obj: ANY
			date: OE_C_DATE
		do
			date ?= adl_objects.c_primitives.item (a_handle)
			if date /= Void then
				obj := date.pattern.to_c
				Result := $obj
			end
		end

feature -- C_BOOLEAN Methods

	c_boolean_true_valid(a_handle: INTEGER): BOOLEAN is
			-- returns the true_valid property of the C_BOOLEAN
		local
			bool: C_BOOLEAN
		do
			bool ?= adl_objects.c_primitives.item (a_handle)
			if bool /= Void then
				Result := bool.true_valid
			end
		end

	c_boolean_false_valid(a_handle: INTEGER): BOOLEAN is
			-- returns the true_valid property of the C_BOOLEAN
		local
			bool: C_BOOLEAN
		do
			bool ?= adl_objects.c_primitives.item (a_handle)
			if bool /= Void then
				Result := bool.false_valid
			end
		end

feature -- C_ORDINAL Methods
-- descendant of C_DOMAIN_TYPE as is C_QUANTITY...

	c_ordinal_items_count(a_handle: INTEGER): INTEGER is
		do
			Result := adl_objects.c_ordinals.item (a_handle).items.count
		end
		
	
	c_ordinal_items_get(a_handle, i_th: INTEGER): INTEGER is
		local
			ordinal1: ORDINAL
			ordinal2: ORDINAL
		do
			ordinal1 := adl_objects.c_ordinals.item (a_handle).items.i_th (i_th)
			from
				adl_objects.ordinals.start
			until
				adl_objects.ordinals.off
			loop
				ordinal2 := adl_objects.ordinals.item_for_iteration
				if ordinal1 = ordinal2 then
					Result := adl_objects.ordinals.key_for_iteration
				end
				adl_objects.ordinals.forth
			end
		end

feature -- ORDINAL Methods
	
	ordinal_value(a_handle: INTEGER): INTEGER is
		do
			Result := adl_objects.ordinals.item (a_handle).value
		end
		
	ordinal_symbol_as_string(a_handle: INTEGER): POINTER is
		local
			obj : ANY
		do
			obj := adl_objects.ordinals.item (a_handle).symbol.as_string.to_c
			Result := $obj
		end

end
