note
	component:   "openEHR ADL Tools"
	description: "[
			 Storage on Eiffel side for objects created by factory and other routines.
			 An integer handle is created for each new object.
			 ]"
	keywords:    "C wrapper"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class C_ADL_OBJECTS

create
	make

feature -- Initialisation

	make
		do
			-- C_OBJECTs
			create c_objects.make(0) -- used for routines which are defined on C_OBJECT
			create archetype_internal_refs.make(0)
			create archetype_slots.make(0)
			create c_complex_objects.make(0)
			create c_attributes.make(0)
			create constraint_refs.make(0)
			create c_code_phrases.make(0)
			create c_ordinals.make(0)
			create c_quantities.make(0)
			create c_primitive_objects.make(0)

			-- ASSERTIONs
			create assertions.make(0)
			create expr_items.make(0)

			-- C_PRIMITIVEs
			create c_primitives.make(0)

			-- misc
			create integer_intervals.make(0)
			create real_intervals.make(0)
			create cardinalities.make(0)
		end

feature -- Access

	new_handle: INTEGER
		do
			last_handle := last_handle + 1
			Result := last_handle
		end

	set_archetype_definition_handle(a_handle: INTEGER)
			-- record handle of archetype.definition in c_complex_objects hash
		do
			archetype_definition_handle := a_handle
		end

feature {SHARED_ADL_OBJECTS} -- Handles

	archetype_definition_handle: INTEGER
			-- C interface handle of archetype.definition

	c_objects: HASH_TABLE[C_OBJECT, INTEGER]

	archetype_internal_refs: HASH_TABLE[ARCHETYPE_INTERNAL_REF, INTEGER]

	archetype_slots: HASH_TABLE[ARCHETYPE_SLOT, INTEGER]

	c_complex_objects: HASH_TABLE[C_COMPLEX_OBJECT, INTEGER]

	c_attributes: HASH_TABLE[C_ATTRIBUTE, INTEGER]

	constraint_refs: HASH_TABLE[CONSTRAINT_REF, INTEGER]

	assertions: HASH_TABLE[ASSERTION, INTEGER]

	expr_items: HASH_TABLE[EXPR_ITEM, INTEGER]

	cardinalities: HASH_TABLE[CARDINALITY, INTEGER]

	c_code_phrases: HASH_TABLE[C_CODE_PHRASE, INTEGER]

	c_ordinals: HASH_TABLE[C_DV_ORDINAL, INTEGER]

	c_quantities: HASH_TABLE[C_DV_QUANTITY, INTEGER]

	c_primitives: HASH_TABLE[C_PRIMITIVE, INTEGER]

	c_primitive_objects: HASH_TABLE[C_PRIMITIVE_OBJECT, INTEGER]

	real_intervals: HASH_TABLE[INTERVAL[REAL], INTEGER]

	integer_intervals: HASH_TABLE[INTERVAL[INTEGER], INTEGER]

	last_handle: INTEGER

end



