note
	component:   "openEHR Resuable Library Project"
	description: "[
			 UML class abstraction, as defined in OMG UML 2.0 Infrastructure 
			 Specification 2003-09-15.
			 ]"
	keywords:    "UML, introspection, reflection"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"


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


--|
--| ***** BEGIN LICENSE BLOCK *****
--| Version: MPL 1.1/GPL 2.0/LGPL 2.1
--|
--| The contents of this file are subject to the Mozilla Public License Version
--| 1.1 (the 'License'); you may not use this file except in compliance with
--| the License. You may obtain a copy of the License at
--| http://www.mozilla.org/MPL/
--|
--| Software distributed under the License is distributed on an 'AS IS' basis,
--| WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
--| for the specific language governing rights and limitations under the
--| License.
--|
--| The Original Code is uml_class.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|
--| Alternatively, the contents of this file may be used under the terms of
--| either the GNU General Public License Version 2 or later (the 'GPL'), or
--| the GNU Lesser General Public License Version 2.1 or later (the 'LGPL'),
--| in which case the provisions of the GPL or the LGPL are applicable instead
--| of those above. If you wish to allow use of your version of this file only
--| under the terms of either the GPL or the LGPL, and not to allow others to
--| use your version of this file under the terms of the MPL, indicate your
--| decision by deleting the provisions above and replace them with the notice
--| and other provisions required by the GPL or the LGPL. If you do not delete
--| the provisions above, a recipient may use your version of this file under
--| the terms of any one of the MPL, the GPL or the LGPL.
--|
--| ***** END LICENSE BLOCK *****
--|
