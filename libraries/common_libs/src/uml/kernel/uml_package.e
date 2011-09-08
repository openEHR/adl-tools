note
	component:   "openEHR Resuable Library Project"
	description: "[
			 UML TypedElement abstraction, as defined in OMG UML 2.0 Infrastructure 
			 Specification 2003-09-15.
			 ]"
	keywords:    "UML, introspection, reflection"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

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
