note
	component:   "openEHR ADL Tools"
	description: "[
			 Shared ADL_OBJECTS Object for C wrapper for ADL_INTERFACE. 
			 ]"
	keywords:    "C wrapper"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class SHARED_ADL_OBJECTS

feature {NONE} -- Implementation

	adl_objects: C_ADL_OBJECTS 
		once
			create Result.make			
		end

feature -- Access

	new_handle: INTEGER
		do
			Result := adl_objects.new_handle
		end

	integer_interval(a_handle: INTEGER): INTERVAL[INTEGER]
		require
			has_integer_interval(a_handle)
		do
			Result := adl_objects.integer_intervals.item(a_handle)
		end
	
	real_interval(a_handle: INTEGER): INTERVAL[REAL]
		require
			has_real_interval(a_handle)
		do
			Result := adl_objects.real_intervals.item(a_handle)
		end

	c_primitive(a_handle: INTEGER): C_PRIMITIVE
		require
			has_c_primitive(a_handle)
		do
			Result := adl_objects.c_primitives.item(a_handle)
		end
		
	c_primitive_object(a_handle: INTEGER): C_PRIMITIVE_OBJECT
		require
			has_c_primitive_object(a_handle)
		do
			Result := adl_objects.c_primitive_objects.item(a_handle)
		end
		
	c_attribute(a_handle: INTEGER): C_ATTRIBUTE
		require
			has_c_attribute(a_handle)
		do
			Result := adl_objects.c_attributes.item(a_handle)
		end
		
	c_complex_object(a_handle: INTEGER): C_COMPLEX_OBJECT
		require
			has_c_complex_object(a_handle)
		do
			Result := adl_objects.c_complex_objects.item(a_handle)
		end

	archetype_slot(a_handle: INTEGER): ARCHETYPE_SLOT
		require
			has_archetype_slot(a_handle)
		do
			Result := adl_objects.archetype_slots.item(a_handle)
		end

	assertion(a_handle: INTEGER): ASSERTION
		require
			has_assertion(a_handle)
		do
			Result := adl_objects.assertions.item(a_handle)
		end

	c_ordinal(a_handle: INTEGER): C_DV_ORDINAL
		require
			has_c_ordinal(a_handle)
		do
			Result := adl_objects.c_ordinals.item(a_handle)
		end

	cardinality(a_handle: INTEGER): CARDINALITY
		require
			has_cardinality(a_handle)
		do
			Result := adl_objects.cardinalities.item(a_handle)
		end

	expr_item(a_handle: INTEGER): EXPR_ITEM
		require
			has_expr_item(a_handle)
		do
			Result := adl_objects.expr_items.item(a_handle)
		end

	c_object(a_handle: INTEGER): C_OBJECT
		require
			has_c_object(a_handle)
		do
			Result := adl_objects.c_objects.item(a_handle)
		end
		
feature -- Status Report

	has_integer_interval(a_handle: INTEGER): BOOLEAN
		do
			Result := adl_objects.integer_intervals.has(a_handle)
		end

	has_real_interval(a_handle: INTEGER): BOOLEAN
		do
			Result := adl_objects.real_intervals.has(a_handle)
		end

	has_c_attribute(a_handle: INTEGER): BOOLEAN
		do
			Result := adl_objects.c_attributes.has(a_handle)
		end

	has_archetype_internal_ref(a_handle: INTEGER): BOOLEAN
		do
			Result := adl_objects.archetype_internal_refs.has(a_handle)
		end

	has_archetype_slot(a_handle: INTEGER): BOOLEAN
		do
			Result := adl_objects.archetype_slots.has(a_handle)
		end

	has_assertion(a_handle: INTEGER): BOOLEAN
		do
			Result := adl_objects.assertions.has(a_handle)
		end

	has_c_complex_object(a_handle: INTEGER): BOOLEAN
		do
			Result := adl_objects.c_complex_objects.has(a_handle)
		end

	has_c_primitive(a_handle: INTEGER): BOOLEAN
		do
			Result := adl_objects.c_primitives.has(a_handle)
		end

	has_c_primitive_object(a_handle: INTEGER): BOOLEAN
		do
			Result := adl_objects.c_primitive_objects.has(a_handle)
		end

	has_constraint_ref(a_handle: INTEGER): BOOLEAN
		do
			Result := adl_objects.constraint_refs.has(a_handle)
		end

	has_cardinality(a_handle: INTEGER): BOOLEAN
		do
			Result := adl_objects.cardinalities.has(a_handle)
		end

	has_c_code_phrase(a_handle: INTEGER): BOOLEAN
		do
			Result := adl_objects.c_code_phrases.has(a_handle)
		end

	has_c_ordinal(a_handle: INTEGER): BOOLEAN
		do
			Result := adl_objects.c_ordinals.has(a_handle)
		end

	has_c_quantity(a_handle: INTEGER): BOOLEAN
		do
			Result := adl_objects.c_quantities.has(a_handle)
		end

	has_expr_item(a_handle: INTEGER): BOOLEAN
		do
			Result := adl_objects.expr_items.has(a_handle)
		end

	has_c_object(a_handle: INTEGER): BOOLEAN
		do
			Result := adl_objects.c_objects.has(a_handle)
		end

feature -- Commands

	set_archetype_definition_handle(a_handle: INTEGER)
			-- record handle of archetype.definition in c_complex_objects hash
		do
			adl_objects.set_archetype_definition_handle(a_handle)
		end
		
	put_archetype_internal_ref(an_item: ARCHETYPE_INTERNAL_REF; a_handle: INTEGER)
		do
			adl_objects.archetype_internal_refs.put(an_item, a_handle)
			adl_objects.c_objects.put(an_item, a_handle)
		end

	put_archetype_slot(an_item: ARCHETYPE_SLOT; a_handle: INTEGER)
		do
			adl_objects.archetype_slots.put(an_item, a_handle)
			adl_objects.c_objects.put(an_item, a_handle)
		end

	put_c_complex_object(an_item: C_COMPLEX_OBJECT; a_handle: INTEGER)
		do
			adl_objects.c_complex_objects.put(an_item, a_handle)
			adl_objects.c_objects.put(an_item, a_handle)
		end

	put_c_attribute(an_item: C_ATTRIBUTE; a_handle: INTEGER)
		do
			adl_objects.c_attributes.put(an_item, a_handle)
		end

	put_constraint_ref(an_item: CONSTRAINT_REF; a_handle: INTEGER)
		do
			adl_objects.constraint_refs.put(an_item, a_handle)
			adl_objects.c_objects.put(an_item, a_handle)
		end

	put_c_primitive(an_item: C_PRIMITIVE; a_handle: INTEGER)
		do
			adl_objects.c_primitives.put(an_item, a_handle)
		end

	put_c_primitive_object(an_item: C_PRIMITIVE_OBJECT; a_handle: INTEGER)
		do
			adl_objects.c_primitive_objects.put(an_item, a_handle)
			adl_objects.c_objects.put(an_item, a_handle)
		end

	put_c_code_phrase(an_item: C_CODE_PHRASE; a_handle: INTEGER)
		do
			adl_objects.c_code_phrases.put(an_item, a_handle)
			adl_objects.c_objects.put(an_item, a_handle)
		end

	put_c_ordinal(an_item: C_DV_ORDINAL; a_handle: INTEGER)
		do
			adl_objects.c_ordinals.put(an_item, a_handle)
			adl_objects.c_objects.put(an_item, a_handle)
		end

	put_c_quantity(an_item: C_DV_QUANTITY; a_handle: INTEGER)
		do
			adl_objects.c_quantities.put(an_item, a_handle)
			adl_objects.c_objects.put(an_item, a_handle)
		end

	put_assertion(an_item: ASSERTION; a_handle: INTEGER)
		do
			adl_objects.assertions.put(an_item, a_handle)
		end

	put_integer_interval(an_item: INTERVAL[INTEGER]; a_handle: INTEGER)
		require
			not has_integer_interval(a_handle)
		do
			adl_objects.integer_intervals.put(an_item, a_handle)
		end

	put_real_interval(an_item: INTERVAL[REAL]; a_handle: INTEGER)
		require
			not has_real_interval(a_handle)
		do
			adl_objects.real_intervals.put(an_item, a_handle)
		end

	put_cardinality(an_item: CARDINALITY; a_handle: INTEGER)
		require
			not has_cardinality(a_handle)
		do
			adl_objects.cardinalities.put(an_item, a_handle)
		end

	put_expr_item(an_item: EXPR_ITEM; a_handle: INTEGER)
		require
			not has_expr_item(a_handle)
		do
			adl_objects.expr_items.put(an_item, a_handle)
		end

end



