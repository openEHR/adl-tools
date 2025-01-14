note
	component:   "openEHR ADL Tools"
	description: "visitor class to generate P_C_XXX obects from corresponding C_XXX objects"
	keywords:    "visitor, constraint model"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2025- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_P_FACTORY

inherit
	C_VISITOR
		redefine
			end_c_complex_object, end_c_archetype_root, end_c_attribute,
			start_c_terminology_code, start_c_boolean, start_c_integer, start_c_real, start_c_date, start_c_time, start_c_date_time, start_c_duration, start_c_string
		end

create
	make

feature -- Initialisation

	make (an_archetype: ARCHETYPE)
		do
			create p_c_obj_node_stack.make (0)
			create p_c_attr_node_stack.make (0)
			initialise (an_archetype)
		end

feature -- Access

	p_c_object: detachable P_C_COMPLEX_OBJECT

feature -- Visitor

	start_c_complex_object (a_node: C_COMPLEX_OBJECT; depth: INTEGER)
		local
			p_co: P_C_COMPLEX_OBJECT
		do
			create p_co.make (a_node)
			p_c_obj_node_stack.extend (p_co)
			if a_node.is_root then
				p_c_object := p_co
			else
				p_c_attr_node_stack.item.add_child (p_co)
			end
		end

	end_c_complex_object (a_node: C_COMPLEX_OBJECT; depth: INTEGER)
		do
			-- deal with attribute tuples
			if not a_node.is_prohibited and not a_node.any_allowed then
				if attached a_node.attribute_tuples as att_tuples then
					across att_tuples as att_tuples_csr loop
						p_c_obj_node_stack.item.add_attribute_tuple (create {P_C_ATTRIBUTE_TUPLE}.make (att_tuples_csr.item))
					end
				end
			end
			p_c_obj_node_stack.remove
		end

	start_archetype_slot (a_node: ARCHETYPE_SLOT; depth: INTEGER)
		do
			p_c_attr_node_stack.item.add_child (create {P_ARCHETYPE_SLOT}.make(a_node))
		end

	start_c_attribute (a_node: C_ATTRIBUTE; depth: INTEGER)
		local
			p_c_attr: P_C_ATTRIBUTE
		do
			create p_c_attr.make (a_node)
			p_c_attr_node_stack.extend (p_c_attr)
			p_c_obj_node_stack.item.add_attribute (p_c_attr)
		end

	end_c_attribute (a_node: C_ATTRIBUTE; depth: INTEGER)
		do
			p_c_attr_node_stack.remove
		end

	start_c_leaf_object (a_node: C_LEAF_OBJECT; depth: INTEGER)
		do
		end

	start_c_archetype_root (a_node: C_ARCHETYPE_ROOT; depth: INTEGER)
		local
			p_as:P_C_ARCHETYPE_ROOT
		do
			create p_as.make(a_node)
			p_c_attr_node_stack.item.add_child (p_as)
			if a_node.has_attributes then
				p_c_obj_node_stack.extend (p_as)
			end
		end

	end_c_archetype_root (a_node: C_ARCHETYPE_ROOT; depth: INTEGER)
		do
			if a_node.has_attributes then
				p_c_obj_node_stack.remove
			end
		end

	start_c_complex_object_proxy (a_node: C_COMPLEX_OBJECT_PROXY; depth: INTEGER)
		do
			p_c_attr_node_stack.item.add_child (create {P_C_COMPLEX_OBJECT_PROXY}.make(a_node))
		end

	start_c_primitive_object (a_node: C_PRIMITIVE_OBJECT; depth: INTEGER)
		do
		end

	start_c_boolean (a_node: C_BOOLEAN; depth: INTEGER)
		do
			p_c_attr_node_stack.item.add_child (create {P_C_BOOLEAN}.make(a_node))
		end

	start_c_integer (a_node: C_INTEGER; depth: INTEGER)
		do
			p_c_attr_node_stack.item.add_child (create {P_C_INTEGER}.make(a_node))
		end

	start_c_real (a_node: C_REAL; depth: INTEGER)
		do
			p_c_attr_node_stack.item.add_child (create {P_C_REAL}.make(a_node))
		end

	start_c_date (a_node: C_DATE; depth: INTEGER)
		do
			p_c_attr_node_stack.item.add_child (create {P_C_DATE}.make(a_node))
		end

	start_c_date_time (a_node: C_DATE_TIME; depth: INTEGER)
		do
			p_c_attr_node_stack.item.add_child (create {P_C_DATE_TIME}.make(a_node))
		end

	start_c_time (a_node: C_TIME; depth: INTEGER)
		do
			p_c_attr_node_stack.item.add_child (create {P_C_TIME}.make(a_node))
		end

	start_c_duration (a_node: C_DURATION; depth: INTEGER)
		do
			p_c_attr_node_stack.item.add_child (create {P_C_DURATION}.make(a_node))
		end

	start_c_string (a_node: C_STRING; depth: INTEGER)
		do
			p_c_attr_node_stack.item.add_child (create {P_C_STRING}.make(a_node))
		end

	start_c_terminology_code (a_node: C_TERMINOLOGY_CODE; depth: INTEGER)
		do
			p_c_attr_node_stack.item.add_child (create {P_C_TERMINOLOGY_CODE}.make(a_node))
		end

feature {NONE} -- Implementation

	p_c_obj_node_stack: ARRAYED_STACK [P_C_COMPLEX_OBJECT]

	p_c_attr_node_stack: ARRAYED_STACK [P_C_ATTRIBUTE]

end


