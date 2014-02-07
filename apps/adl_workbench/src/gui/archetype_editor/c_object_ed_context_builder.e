note
	component:   "openEHR ADL Tools"
	description: "Visitor to generate editor context tree from C_XX structure"
	keywords:    "visitor, constraint model"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_OBJECT_ED_CONTEXT_BUILDER

inherit
	C_VISITOR
		redefine
			end_c_archetype_root,
			end_c_complex_object,
			end_c_attribute
		end

	SHARED_ARCHETYPE_CATALOGUES
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make (an_ed_context: ARCH_ED_CONTEXT_STATE)
		do
			initialise (an_ed_context.archetype)
			create obj_node_stack.make (0)
			create attr_node_stack.make (0)
			create ed_context_stack.make (0)

			-- we have a stack of contexts because the flat_ontology can vary if this is a template, i.e. contains C_ARCHETYPE_ROOTs
			ed_context_stack.extend (an_ed_context)
		end

feature -- Access

	root_node: detachable C_COMPLEX_OBJECT_ED_CONTEXT
		note
			option: stable
		attribute
		end

	ed_context: ARCH_ED_CONTEXT_STATE
			-- access to ed context with current archetype flat ontology
		do
			Result := ed_context_stack.item
		end

feature -- Visitor

	start_c_complex_object (a_node: C_COMPLEX_OBJECT; depth: INTEGER)
			-- enter n C_COMPLEX_OBJECT
		local
			ed_node: C_COMPLEX_OBJECT_ED_CONTEXT
		do
			create ed_node.make (a_node, ed_context)
			obj_node_stack.extend (ed_node)
			if a_node.is_root then
				root_node := ed_node
			else
				attr_node_stack.item.pre_attach_child_context (ed_node)
			end
		end

	end_c_complex_object (a_node: C_COMPLEX_OBJECT; depth: INTEGER)
			-- exit a C_COMPLEX_OBJECT
		do
			-- deal with attribute tuples
			if attached a_node.attribute_tuples as att_tuples then
				across att_tuples as att_tuples_csr loop
					start_c_attribute_tuple (att_tuples_csr.item, depth + 1)
				end
			end

			obj_node_stack.remove
		end

	start_c_archetype_root (a_node: C_ARCHETYPE_ROOT; depth: INTEGER)
			-- enter a C_ARCHETYPE_ROOT
		local
			ed_node: C_ARCHETYPE_ROOT_ED_CONTEXT
			new_ed_context: ARCH_ED_CONTEXT_STATE
		do
			if attached ed_context.archetype as arch and then arch.is_template then
				new_ed_context := ed_context.twin
				new_ed_context.set_flat_terminology (current_arch_cat.matching_archetype (a_node.node_id).flat_archetype.terminology)
				ed_context_stack.extend (new_ed_context)
			end
			create ed_node.make (a_node, ed_context)
			obj_node_stack.extend (ed_node)
			attr_node_stack.item.pre_attach_child_context (ed_node)
		end

	end_c_archetype_root (a_node: C_ARCHETYPE_ROOT; depth: INTEGER)
			-- exit a C_ARCHETYPE_ROOT
		do
			obj_node_stack.remove
			if attached ed_context.archetype as arch and then arch.is_template then
				ed_context_stack.remove
			end
		end

	start_archetype_slot (a_node: ARCHETYPE_SLOT; depth: INTEGER)
			-- enter an ARCHETYPE_SLOT
		local
			ed_node: ARCHETYPE_SLOT_ED_CONTEXT
		do
			create ed_node.make (a_node, ed_context)
			attr_node_stack.item.pre_attach_child_context (ed_node)
		end

	start_c_attribute (a_node: C_ATTRIBUTE; depth: INTEGER)
			-- enter a C_ATTRIBUTE
		local
			ed_node: C_ATTRIBUTE_ED_CONTEXT
		do
			-- ignore attrs whose object is a C_PRIM_OBJ and which are in c_attribute_tuples
			if not a_node.is_second_order_constrained then
				create ed_node.make (a_node, ed_context)
				obj_node_stack.item.put_c_attribute (ed_node)
				attr_node_stack.extend (ed_node)
			end
		end

	end_c_attribute (a_node: C_ATTRIBUTE; depth: INTEGER)
			-- exit a C_ATTRIBUTE
		do
			if not a_node.is_second_order_constrained then
				attr_node_stack.remove
			end
		end

	start_c_attribute_tuple (a_node: C_ATTRIBUTE_TUPLE; depth: INTEGER)
			-- enter a C_ATTRIBUTE_TUPLE
		local
			ed_node: C_ATTRIBUTE_TUPLE_ED_CONTEXT
		do
			create ed_node.make (a_node, ed_context)
			obj_node_stack.item.put_c_attribute_tuple (ed_node)
		end

	start_c_leaf_object (a_node: C_LEAF_OBJECT; depth: INTEGER)
			-- enter a C_LEAF_OBJECT
		do
		end

	start_c_complex_object_proxy (a_node: C_COMPLEX_OBJECT_PROXY; depth: INTEGER)
			-- enter an ARCHETYPE_INTERNAL_REF
		local
			ed_node: C_COMPLEX_OBJECT_PROXY_ED_CONTEXT
		do
			create ed_node.make (a_node, ed_context)
			attr_node_stack.item.pre_attach_child_context (ed_node)
		end

	start_c_primitive_object (a_node: C_PRIMITIVE_OBJECT; depth: INTEGER)
			-- enter an C_PRIMITIVE_OBJECT
		local
			ed_node: C_PRIMITIVE_OBJECT_ED_CONTEXT
		do
			-- ignore objs which are under c_attribute_tuples
			if not a_node.is_second_order_constrained then
				create ed_node.make (a_node, ed_context)
				attr_node_stack.item.pre_attach_child_context (ed_node)
			end
		end

feature {NONE} -- Implementation

	obj_node_stack: ARRAYED_STACK [C_COMPLEX_OBJECT_ED_CONTEXT]

	attr_node_stack: ARRAYED_STACK [C_ATTRIBUTE_ED_CONTEXT]

	ed_context_stack: ARRAYED_STACK [ARCH_ED_CONTEXT_STATE]

end


