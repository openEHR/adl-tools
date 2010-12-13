note
	description: "Summary description for {AOM_VISITOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	AOM_VISITOR
inherit
	C_VISITOR

	redefine
	start_c_complex_object, end_c_complex_object,
	start_c_attribute, end_c_attribute,
	start_archetype_slot, end_archetype_slot,
	start_archetype_internal_ref, end_archetype_internal_ref,
	start_c_archetype_root, end_c_archetype_root,
	start_c_code_phrase, end_c_code_phrase,
	start_c_ordinal, end_c_ordinal,
	start_c_quantity, end_c_quantity,
	start_c_primitive_object, end_c_primitive_object,
	start_c_leaf_object, end_c_leaf_object,
	start_c_reference_object, end_c_reference_object,
	start_constraint_ref, end_constraint_ref,
	start_c_domain_type, end_c_domain_type
	end
create
	make
feature
	make
	do
		create object_attributes.make (0)
		create temp_object_attributes.make (0)
	end
feature
	--internal storage management for visited nodes
	object_attributes: ARRAYED_STACK[C_ATTRIBUTE]

	temp_object_attributes: ARRAYED_STACK[C_ATTRIBUTE]

	backup_and_clear_object_attributes
	do
		temp_object_attributes.wipe_out
		temp_object_attributes.fill (object_attributes.linear_representation)
		object_attributes.wipe_out
	end

	restore_object_attributes_from_backup
	do
		object_attributes.wipe_out
		object_attributes.fill (temp_object_attributes.linear_representation)
		temp_object_attributes.wipe_out
	end

feature
	--visiting features


	start_c_complex_object(a_node: C_COMPLEX_OBJECT; depth: INTEGER)
			-- enter an C_COMPLEX_OBJECT
		do
			io.put_string (depth.out + ": enter ccomplex obj%N")
			backup_and_clear_object_attributes
		end

	end_c_complex_object(a_node: C_COMPLEX_OBJECT; depth: INTEGER)
			-- exit an C_COMPLEX_OBJECT
		local
			attributes:ARRAYED_LIST[C_ATTRIBUTE]
		do
			io.put_string (depth.out + ": exit ccomplex obj%N")
			attributes := object_attributes.linear_representation
			from attributes.start
			until attributes.after
			loop
				io.put_string ("attr in stack: " + attributes.item_for_iteration.rm_attribute_name + "%N")
				attributes.forth
			end
			restore_object_attributes_from_backup
		end


	start_archetype_slot(a_node: ARCHETYPE_SLOT; depth: INTEGER)
			-- enter an ARCHETYPE_SLOT
		do

		end

	end_archetype_slot(a_node: ARCHETYPE_SLOT; depth: INTEGER)
			-- exit an ARCHETYPE_SLOT
		do
		end


	start_c_attribute(a_node: C_ATTRIBUTE; depth: INTEGER)
			-- enter a C_ATTRIBUTE
		do
			io.put_string (depth.out + ": enter cattr%N")
		end

	end_c_attribute(a_node: C_ATTRIBUTE; depth: INTEGER)
			-- exit a C_ATTRIBUTE
		do
			io.put_string (depth.out + ": exit cattr%N")
			object_attributes.put (a_node)
		end


	start_c_leaf_object(a_node: C_LEAF_OBJECT; depth: INTEGER)
			-- enter a C_LEAF_OBJECT
		do
			io.put_string (depth.out + ": enter Cleafobj%N")
		end

	end_c_leaf_object(a_node: C_LEAF_OBJECT; depth: INTEGER)
			-- exit a C_LEAF_OBJECT
		do
			io.put_string (depth.out + ": exit Cleafobj%N")
		end


	start_c_reference_object(a_node: C_REFERENCE_OBJECT; depth: INTEGER)
			-- enter a C_REFERENCE_OBJECT
		do

		end

	end_c_reference_object(a_node: C_REFERENCE_OBJECT; depth: INTEGER)
			-- exit a C_REFERENCE_OBJECT
		do
		end


	start_c_archetype_root(a_node: C_ARCHETYPE_ROOT; depth: INTEGER)
			-- enter a C_ARCHETYPE_ROOT
		do

		end

	end_c_archetype_root(a_node: C_ARCHETYPE_ROOT; depth: INTEGER)
			-- exit a C_ARCHETYPE_ROOT
		do
		end


	start_archetype_internal_ref(a_node: ARCHETYPE_INTERNAL_REF; depth: INTEGER)
			-- enter an ARCHETYPE_INTERNAL_REF
		do

		end

	end_archetype_internal_ref(a_node: ARCHETYPE_INTERNAL_REF; depth: INTEGER)
			-- exit an ARCHETYPE_INTERNAL_REF
		do
		end


	start_constraint_ref(a_node: CONSTRAINT_REF; depth: INTEGER)
			-- enter a CONSTRAINT_REF
		do

		end

	end_constraint_ref(a_node: CONSTRAINT_REF; depth: INTEGER)
			-- exit a CONSTRAINT_REF
		do
		end


	start_c_primitive_object(a_node: C_PRIMITIVE_OBJECT; depth: INTEGER)
			-- enter an C_PRIMITIVE_OBJECT
		do
			io.put_string (depth.out + ": enter cprimitiveOb%N")
			if attached {C_STRING} a_node.item  as c_prim then
				io.put_string (c_prim.regexp)
			end
		end

	end_c_primitive_object(a_node: C_PRIMITIVE_OBJECT; depth: INTEGER)
			-- exit an C_PRIMITIVE_OBJECT
		do
			io.put_string (depth.out + ": exit CprimitiveObj%N")
		end


	start_c_domain_type(a_node: C_DOMAIN_TYPE; depth: INTEGER)
			-- enter an C_DOMAIN_TYPE
		do

		end

	end_c_domain_type(a_node: C_DOMAIN_TYPE; depth: INTEGER)
			-- exit an C_DOMAIN_TYPE
		do
		end


	start_c_code_phrase(a_node: C_CODE_PHRASE; depth: INTEGER)
			-- enter an C_CODE_PHRASE
		do

		end

	end_c_code_phrase(a_node: C_CODE_PHRASE; depth: INTEGER)
			-- exit an C_CODE_PHRASE
		do
		end


	start_c_ordinal(a_node: C_DV_ORDINAL; depth: INTEGER)
			-- enter an C_DV_ORDINAL
		do
			io.put_string (depth.out + ": enter cOrdinal%N")
		end

	end_c_ordinal(a_node: C_DV_ORDINAL; depth: INTEGER)
			-- exit an C_DV_ORDINAL
		do
			io.put_string (depth.out + ": exit COrdinal%N")
		end

	start_c_quantity(a_node: C_DV_QUANTITY; depth: INTEGER)
			-- enter a C_DV_QUANTITY
		do
			io.put_string (depth.out + ": enter cQuantity%N")
		end

	end_c_quantity(a_node: C_DV_QUANTITY; depth: INTEGER)
			-- exit a C_DV_QUANTITY
		do
			io.put_string (depth.out + ": exit cQuantity%N")
		end

end
