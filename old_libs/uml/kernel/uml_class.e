note
	component:   "openEHR ADL Tools"
	description: "[
			 UML class abstraction, as defined in OMG UML 2.0 Infrastructure 
			 Specification 2003-09-15.
			 ]"
	keywords:    "UML, introspection, reflection"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class UML_CLASS

inherit
	UML_CLASSIFIER
		rename
			generalization as super_class, add_generalization as add_super_class,
			make as make_classifier
		redefine
			synchronise_to_tree
		end

create
	make

feature -- Initialisation

	make(a_name: STRING)
		require
			Name_exists: a_name /= Void and then not a_name.is_empty
		do
			make_classifier
			name := a_name
			create owned_comment.make(0)
			create owned_element.make(0)
			create owned_attribute.make(0)
			create owned_operation.make(0)
		end

feature -- Access

	owned_attribute: ARRAYED_LIST[UML_PROPERTY]

	owned_operation: ARRAYED_LIST[UML_OPERATION]

	nested_classifier: LIST [UML_CLASSIFIER]
	
feature -- Modification

	add_attribute (a_property: UML_PROPERTY)
			-- add an attribute
		require
			a_property /= Void
		do
			owned_attribute.extend(a_property)
			owned_element.extend(a_property)
		end

	add_operation (a_property: UML_OPERATION)
			-- add an operation
		require
			a_property /= Void
		do
			owned_operation.extend(a_property)
			owned_element.extend(a_property)
		end

	add_parent(a_parent: UML_CLASS)
			-- 
		require
			A_parent_exists: a_parent /= Void
		do
			super_class.extend(create {UML_GENERALIZATION}.make_substitutable(a_parent))
		end
	
feature -- Serialisation

	synchronise_to_tree
		local
			dummy_node: DT_OBJECT_ITEM
			super_classes: ARRAYED_LIST[STRING]
			an_attr_node: DT_ATTRIBUTE_NODE
		do
			-- create node for this object and put on stack
			object_node_stack.extend(create_complex_object_node (attribute_node_stack.item, name))

			-- do self: name
			an_attr_node := create_attribute_node (object_node_stack.item, "name", False)
			dummy_node := create_primitive_object (an_attr_node, name, Void)
						
			-- do self: is_abstract
			an_attr_node := create_attribute_node (object_node_stack.item, "is_abstract", False)
			dummy_node := create_primitive_object (an_attr_node, is_abstract, Void)
						
			-- do superclasses
			if not super_class.is_empty then
				attribute_node_stack.extend(create_attribute_node (object_node_stack.item, "super_class", False))
				from 
					create super_classes.make(0)
					super_class.start
				until 
					super_class.off
				loop 
					super_classes.extend(super_class.item.general.name)
					super_class.forth
				end
				dummy_node := create_primitive_object_list (attribute_node_stack.item, super_classes, Void)
				attribute_node_stack.remove				
			end
			
			-- do attributes
			attribute_node_stack.extend(create_attribute_node (object_node_stack.item, "owned_attribute", True))
			from 
				owned_attribute.start
			until 
				owned_attribute.off
			loop 
				owned_attribute.item.synchronise_to_tree
				owned_attribute.forth
			end
			attribute_node_stack.remove
			
			-- pop this object
			object_node_stack.remove
		end

invariant
	-- Owned_attribute_valid: owned_attribute /= Void and then owned_attribute.for_all(agent owned_element.has({UML_PROPERTY}))
	-- Owned_operation_valid: owned_operation /= Void and then owned_operation.for_all(agent owned_element.has({UML_OPERATION}))

end


