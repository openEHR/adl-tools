note
	description: "Summary description for {BOSPHORUS_VISITOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BOSPHORUS_VISITOR

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

feature
	--cpp fields
	cpp_visitor: POINTER

	set_cpp_visitor (p_cpp_visitor: POINTER)
		--save cpp object to field
	do
		cpp_visitor := p_cpp_visitor
	end

feature
	--logging
	logger: LOGGER

	set_logger(p_logger: LOGGER)
	do
		logger := p_logger
	end

feature
	--visiting features
	call_start_c_complex_object_on_cpp_obj (cpp_obj_to_use: POINTER; c_complex_object_pointer: POINTER; depth: INTEGER)
	external
		"C++ inline use %"IArchetypeVisitor.h%""
	alias
		"[
			IArchetypeVisitor *implementation = (IArchetypeVisitor *)$cpp_obj_to_use;
			implementation->startCComplexObject((EIF_REFERENCE)$c_complex_object_pointer, (EIF_INTEGER)$depth );
		]"
	end

	start_c_complex_object(a_node: C_COMPLEX_OBJECT; depth: INTEGER)
			-- enter an C_COMPLEX_OBJECT
		do
			logger.log("C complex obj node id: " + a_node.node_id )
			call_start_c_complex_object_on_cpp_obj(cpp_visitor, $a_node, depth)
		end

	call_end_c_complex_object_on_cpp_obj (cpp_obj_to_use: POINTER; c_complex_object_pointer: POINTER; depth: INTEGER)
	external
		"C++ inline use %"IArchetypeVisitor.h%""
	alias
		"[
			IArchetypeVisitor *implementation = (IArchetypeVisitor *)$cpp_obj_to_use;
			implementation->endCComplexObject((EIF_REFERENCE)$c_complex_object_pointer, (EIF_INTEGER)$depth );
		]"
	end

	end_c_complex_object(a_node: C_COMPLEX_OBJECT; depth: INTEGER)
			-- exit an C_COMPLEX_OBJECT
		do
			call_end_c_complex_object_on_cpp_obj(cpp_visitor, $a_node, depth)
		end

	call_start_archeytpe_slot_on_cpp_obj(cpp_obj_to_use:POINTER; a_node: POINTER; depth: INTEGER)
	external
		"C++ inline use %"IArchetypeVisitor.h%""
	alias
		"[
			IArchetypeVisitor *implementation = (IArchetypeVisitor *)$cpp_obj_to_use;
			implementation->startArchetypeSlot((EIF_REFERENCE)$a_node, (EIF_INTEGER)$depth );
		]"
	end

	start_archetype_slot(a_node: ARCHETYPE_SLOT; depth: INTEGER)
			-- enter an ARCHETYPE_SLOT
		do
			call_start_archeytpe_slot_on_cpp_obj (cpp_visitor, $a_node, depth)
		end

	end_archetype_slot(a_node: ARCHETYPE_SLOT; depth: INTEGER)
			-- exit an ARCHETYPE_SLOT
		do
		end

	call_start_c_attribute_on_cpp_obj(cpp_obj_to_use:POINTER; a_node:POINTER; depth: INTEGER)
	external
		"C++ inline use %"IArchetypeVisitor.h%""
	alias
		"[
			IArchetypeVisitor *implementation = (IArchetypeVisitor *)$cpp_obj_to_use;
			implementation->startCAttribute((EIF_REFERENCE)$a_node, (EIF_INTEGER)$depth );
		]"
	end

	start_c_attribute(a_node: C_ATTRIBUTE; depth: INTEGER)
			-- enter a C_ATTRIBUTE
		do
			--TODO: first call cpp here, then continue..			
			call_start_c_attribute_on_cpp_obj (cpp_visitor, $a_node, depth)
		end

	call_end_c_attribute_on_cpp_obj(cpp_obj_to_use:POINTER; a_node:POINTER; depth: INTEGER)
	external
		"C++ inline use %"IArchetypeVisitor.h%""
	alias
		"[
			IArchetypeVisitor *implementation = (IArchetypeVisitor *)$cpp_obj_to_use;
			implementation->endCAttribute((EIF_REFERENCE)$a_node, (EIF_INTEGER)$depth );
		]"
	end

	end_c_attribute(a_node: C_ATTRIBUTE; depth: INTEGER)
			-- exit a C_ATTRIBUTE
		do
			call_end_c_attribute_on_cpp_obj(cpp_visitor, $a_node, depth)
		end

	call_start_c_leaf_object_on_cpp_obj(cpp_obj_to_use:POINTER; a_node:POINTER; depth: INTEGER)
	external
		"C++ inline use %"IArchetypeVisitor.h%""
	alias
		"[
			IArchetypeVisitor *implementation = (IArchetypeVisitor *)$cpp_obj_to_use;
			implementation->startCLeafObject((EIF_REFERENCE)$a_node, (EIF_INTEGER)$depth );
		]"
	end

	start_c_leaf_object(a_node: C_LEAF_OBJECT; depth: INTEGER)
			-- enter a C_LEAF_OBJECT
		do
			call_start_c_leaf_object_on_cpp_obj (cpp_visitor, $a_node, depth)
		end

	end_c_leaf_object(a_node: C_LEAF_OBJECT; depth: INTEGER)
			-- exit a C_LEAF_OBJECT
		do
		end

	call_start_c_reference_object_on_cpp_obj(cpp_obj_to_use:POINTER; a_node:POINTER; depth: INTEGER)
	external
		"C++ inline use %"IArchetypeVisitor.h%""
	alias
		"[
			IArchetypeVisitor *implementation = (IArchetypeVisitor *)$cpp_obj_to_use;
			implementation->startCReferenceObject((EIF_REFERENCE)$a_node, (EIF_INTEGER)$depth );
		]"
	end

	start_c_reference_object(a_node: C_REFERENCE_OBJECT; depth: INTEGER)
			-- enter a C_REFERENCE_OBJECT
		do
			call_start_c_reference_object_on_cpp_obj (cpp_visitor, $a_node, depth)
		end

	end_c_reference_object(a_node: C_REFERENCE_OBJECT; depth: INTEGER)
			-- exit a C_REFERENCE_OBJECT
		do
		end

	call_start_c_archetype_root_on_cpp_obj(cpp_obj_to_use:POINTER; a_node:POINTER; depth: INTEGER)
	external
		"C++ inline use %"IArchetypeVisitor.h%""
	alias
		"[
			IArchetypeVisitor *implementation = (IArchetypeVisitor *)$cpp_obj_to_use;
			implementation->startCArchetypeRoot((EIF_REFERENCE)$a_node, (EIF_INTEGER)$depth );
		]"
	end

	start_c_archetype_root(a_node: C_ARCHETYPE_ROOT; depth: INTEGER)
			-- enter a C_ARCHETYPE_ROOT
		do
			call_start_c_archetype_root_on_cpp_obj (cpp_visitor, $a_node, depth)
		end

	end_c_archetype_root(a_node: C_ARCHETYPE_ROOT; depth: INTEGER)
			-- exit a C_ARCHETYPE_ROOT
		do
		end

	call_start_archetype_internal_ref_on_cpp_obj(cpp_obj_to_use:POINTER; a_node:POINTER; depth: INTEGER)
	external
		"C++ inline use %"IArchetypeVisitor.h%""
	alias
		"[
			IArchetypeVisitor *implementation = (IArchetypeVisitor *)$cpp_obj_to_use;
			implementation->startArchetypeInternalRef((EIF_REFERENCE)$a_node, (EIF_INTEGER)$depth );
		]"
	end

	start_archetype_internal_ref(a_node: ARCHETYPE_INTERNAL_REF; depth: INTEGER)
			-- enter an ARCHETYPE_INTERNAL_REF
		do
			call_start_archetype_internal_ref_on_cpp_obj (cpp_visitor, $a_node, depth)
		end

	end_archetype_internal_ref(a_node: ARCHETYPE_INTERNAL_REF; depth: INTEGER)
			-- exit an ARCHETYPE_INTERNAL_REF
		do
		end

	call_start_constraint_ref_on_cpp_obj(cpp_obj_to_use:POINTER; a_node:POINTER; depth: INTEGER)
	external
		"C++ inline use %"IArchetypeVisitor.h%""
	alias
		"[
			IArchetypeVisitor *implementation = (IArchetypeVisitor *)$cpp_obj_to_use;
			implementation->startConstraintRef((EIF_REFERENCE)$a_node, (EIF_INTEGER)$depth );
		]"
	end

	start_constraint_ref(a_node: CONSTRAINT_REF; depth: INTEGER)
			-- enter a CONSTRAINT_REF
		do
			call_start_constraint_ref_on_cpp_obj (cpp_visitor, $a_node, depth)
		end

	end_constraint_ref(a_node: CONSTRAINT_REF; depth: INTEGER)
			-- exit a CONSTRAINT_REF
		do
		end

	call_start_c_primitive_object_on_cpp_obj(cpp_obj_to_use:POINTER; a_node:POINTER; depth: INTEGER)
	external
		"C++ inline use %"IArchetypeVisitor.h%""
	alias
		"[
			IArchetypeVisitor *implementation = (IArchetypeVisitor *)$cpp_obj_to_use;
			implementation->startCPrimitiveObject((EIF_REFERENCE)$a_node, (EIF_INTEGER)$depth );
		]"
	end

	start_c_primitive_object(a_node: C_PRIMITIVE_OBJECT; depth: INTEGER)
			-- enter an C_PRIMITIVE_OBJECT
		do
			logger.log ("RM Type Name: " + a_node.rm_type_name + "%N")
			print("cprimitiveobject node id : " + a_node.node_id + "%N")
			if a_node.occurrences = Void then
				print("occurences is null in cprimitiveobject%N")
			else
				print("occurences not null in cprimitiveobject%N")
			end
			call_start_c_primitive_object_on_cpp_obj (cpp_visitor, $a_node, depth)
		end

	end_c_primitive_object(a_node: C_PRIMITIVE_OBJECT; depth: INTEGER)
			-- exit an C_PRIMITIVE_OBJECT
		do
		end

	call_start_c_domain_type_on_cpp_obj(cpp_obj_to_use:POINTER; a_node:POINTER; depth: INTEGER)
	external
		"C++ inline use %"IArchetypeVisitor.h%""
	alias
		"[
			IArchetypeVisitor *implementation = (IArchetypeVisitor *)$cpp_obj_to_use;
			implementation->startCDomainType((EIF_REFERENCE)$a_node, (EIF_INTEGER)$depth );
		]"
	end

	start_c_domain_type(a_node: C_DOMAIN_TYPE; depth: INTEGER)
			-- enter an C_DOMAIN_TYPE
		do
			call_start_c_domain_type_on_cpp_obj (cpp_visitor, $a_node, depth)
		end

	end_c_domain_type(a_node: C_DOMAIN_TYPE; depth: INTEGER)
			-- exit an C_DOMAIN_TYPE
		do
		end

	call_start_c_code_phrase_on_cpp_obj(cpp_obj_to_use:POINTER; a_node:POINTER; depth: INTEGER)
	external
		"C++ inline use %"IArchetypeVisitor.h%""
	alias
		"[
			IArchetypeVisitor *implementation = (IArchetypeVisitor *)$cpp_obj_to_use;
			implementation->startCCodePhrase((EIF_REFERENCE)$a_node, (EIF_INTEGER)$depth );
		]"
	end

	start_c_code_phrase(a_node: C_CODE_PHRASE; depth: INTEGER)
			-- enter an C_CODE_PHRASE
		do
			call_start_c_code_phrase_on_cpp_obj (cpp_visitor, $a_node, depth)
		end

	end_c_code_phrase(a_node: C_CODE_PHRASE; depth: INTEGER)
			-- exit an C_CODE_PHRASE
		do
		end

	call_start_c_ordinal_on_cpp_obj(cpp_obj_to_use:POINTER; a_node:POINTER; depth: INTEGER)
	external
		"C++ inline use %"IArchetypeVisitor.h%""
	alias
		"[
			IArchetypeVisitor *implementation = (IArchetypeVisitor *)$cpp_obj_to_use;
			implementation->startCOrdinal((EIF_REFERENCE)$a_node, (EIF_INTEGER)$depth );
		]"
	end

	start_c_ordinal(a_node: C_DV_ORDINAL; depth: INTEGER)
			-- enter an C_DV_ORDINAL
		do
			call_start_c_ordinal_on_cpp_obj (cpp_visitor, $a_node, depth)
		end

	end_c_ordinal(a_node: C_DV_ORDINAL; depth: INTEGER)
			-- exit an C_DV_ORDINAL
		do
		end

	call_start_c_quantity_on_cpp_obj(cpp_obj_to_use:POINTER; a_node:POINTER; depth: INTEGER)
	external
		"C++ inline use %"IArchetypeVisitor.h%""
	alias
		"[
			IArchetypeVisitor *implementation = (IArchetypeVisitor *)$cpp_obj_to_use;
			implementation->startCQuantity((EIF_REFERENCE)$a_node, (EIF_INTEGER)$depth );
		]"
	end

	start_c_quantity(a_node: C_DV_QUANTITY; depth: INTEGER)
			-- enter a C_DV_QUANTITY
		do
			call_start_c_quantity_on_cpp_obj (cpp_visitor, $a_node, depth)
		end

	end_c_quantity(a_node: C_DV_QUANTITY; depth: INTEGER)
			-- exit a C_DV_QUANTITY
		do
		end
end
