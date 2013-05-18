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


class UML_PROPERTY

inherit
	UML_STRUCTURAL_FEATURE
		redefine
			synchronise_to_tree
		end

create
	make, make_single_relationship, make_multiple_relationship

feature -- Initialisation

	make(a_name: STRING)
		require
			Name_exists: a_name /= Void and then not a_name.is_empty
		do
			name := a_name
		end
		
	make_single_relationship(a_name: STRING; target: UML_CLASS; is_mandatory: BOOLEAN)
			-- make a single relationship
		require
			Name_valid: a_name /= Void and then not a_name.is_empty
			Target_exists: target /= Void			
		do
			create association.make(a_name, target)
			name := a_name
			set_single_multiplicity(is_mandatory)
		end

	make_multiple_relationship(a_name: STRING; target: UML_CLASS; 
							min_cardinality, max_cardinality: INTEGER; 
							max_cardinality_infinite, ordered, unique_flag: BOOLEAN)
			-- make a multiple relationship
		require
			Name_valid: a_name /= Void and then not a_name.is_empty
			Target_exists: target /= Void
			Min_cardinality_valid: min_cardinality >= 0 
			Max_cardinality_valid:  not max_cardinality_infinite implies max_cardinality >= 1
		do
			create association.make(a_name, target)
			name := a_name
			set_multiple_multiplicity(min_cardinality, max_cardinality, max_cardinality_infinite, ordered, unique_flag)
		end

feature -- Access

	default_value: UML_VALUE_SPECIFICATION

	is_composite: BOOLEAN

	is_derived: BOOLEAN

	is_derived_union: BOOLEAN

	opposite: UML_PROPERTY

	redefined_property: SET [UML_PROPERTY]

	subsetted_property: SET [UML_PROPERTY]

	association: UML_ASSOCIATION

feature -- Modification
	
feature -- Serialisation

	synchronise_to_tree
		local
			an_attr_node: DT_ATTRIBUTE_NODE
			dummy_node: DT_OBJECT_ITEM
			super_classes: ARRAYED_LIST[STRING]
		do
			-- create node for this object and put on stack
			object_node_stack.extend(create_complex_object_node (attribute_node_stack.item, name))

			-- do self: name
			an_attr_node := create_attribute_node (object_node_stack.item, "name", False)
			dummy_node := create_primitive_object (an_attr_node, name, Void)
						
			-- do self: type
			an_attr_node := create_attribute_node (object_node_stack.item, "type", False)
			dummy_node := create_primitive_object (an_attr_node, type, Void)
						
			-- do self: is_ordered
			an_attr_node := create_attribute_node (object_node_stack.item, "is_ordered", False)
			dummy_node := create_primitive_object (an_attr_node, is_ordered, Void)
						
			-- do self: is_unique
			an_attr_node := create_attribute_node (object_node_stack.item, "is_unique", False)
			dummy_node := create_primitive_object (an_attr_node, is_unique, Void)

			-- do self: lower
			an_attr_node := create_attribute_node (object_node_stack.item, "lower", False)
			dummy_node := create_primitive_object (an_attr_node, lower, Void)

			-- do self: upper
			an_attr_node := create_attribute_node (object_node_stack.item, "upper", False)
			if not upper_infinite then
				dummy_node := create_primitive_object (attribute_node_stack.item, upper, Void)
			else
				dummy_node := create_primitive_object (attribute_node_stack.item, '*', Void)
			end
			
			-- pop this object
			object_node_stack.remove
		end

end


