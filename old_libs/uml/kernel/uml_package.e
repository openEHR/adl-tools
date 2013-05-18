note
	component:   "openEHR ADL Tools"
	description: "[
			 UML TypedElement abstraction, as defined in OMG UML 2.0 Infrastructure 
			 Specification 2003-09-15.
			 ]"
	keywords:    "UML, introspection, reflection"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class UML_PACKAGE

inherit
	UML_PACKAGEABLE_ELEMENT
		undefine
			synchronise_to_tree
		end
	
	UML_NAMESPACE
		redefine
			owned_member, synchronise_to_tree
		end

create
	make

feature -- Initialisation

	make(a_name: STRING)
		require
			Name_valid: a_name /= Void and then not a_name.is_empty
		do
			name := a_name
			create owned_member.make
			create owned_classifier.make
			create nested_package.make
		end

feature -- Access

	owned_member: LINKED_SET [UML_PACKAGEABLE_ELEMENT]
			-- reference list of classes and packages and whatever else

	owned_classifier: LINKED_SET [UML_TYPE]
			-- classes (and other 'types'?

	nested_package: LINKED_SET [UML_PACKAGEABLE_ELEMENT]
			-- sub packages
			
	nesting_package: UML_PACKAGE
			-- parent pointer

feature -- Modification

	add_nested_package(a_pkg: UML_PACKAGE)
			-- add another child package
		require
			a_package_exists: a_pkg /= Void
		do
			nested_package.extend(a_pkg)
			a_pkg.set_nesting_package(Current)
			owned_member.extend(a_pkg)
		end

	add_class(a_class: UML_CLASS)
			-- add another class
		require
			a_class_exists: a_class /= Void
		do
			owned_classifier.extend(a_class)
			owned_member.extend(a_class)
		end

	set_nesting_package(a_pkg: UML_PACKAGE)
			-- set parent
		require
			a_package_exists: a_pkg /= Void
		do
			nesting_package := a_pkg
		end

feature -- Serialisation

	synchronise_to_tree
		local
			an_attr_node: DT_ATTRIBUTE_NODE
			dummy_node: DT_OBJECT_ITEM
		do
			-- create node for this object and put on stack
			object_node_stack.extend(create_complex_object_node (attribute_node_stack.item, name))

			-- do self: name
			an_attr_node := create_attribute_node (object_node_stack.item, "name", False)
			dummy_node := create_primitive_object (an_attr_node, name, Void)
						
			-- do packages
			attribute_node_stack.extend(create_attribute_node (object_node_stack.item, "nested_package", True))
			from 
				nested_package.start
			until 
				nested_package.off
			loop 
				nested_package.item.synchronise_to_tree
				nested_package.forth
			end
			attribute_node_stack.remove
			
			-- do classes
			attribute_node_stack.extend(create_attribute_node (object_node_stack.item, "classes", True))	
			from 
				owned_classifier.start
			until 
				owned_classifier.off
			loop 
				owned_classifier.item.synchronise_to_tree
				owned_classifier.forth
			end
			attribute_node_stack.remove
			
			-- pop this object
			object_node_stack.remove
		end
		
end


