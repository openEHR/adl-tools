indexing
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

class UML_MODEL

inherit
	UML_SERIALISABLE
		redefine
			synchronise_to_tree
		end
	
create
	make

feature -- Initialisation

	make is
		do
		end

feature -- Access

	root: UML_PACKAGEABLE_ELEMENT

	current_package: UML_PACKAGE
			-- last element added

feature -- modification
	
	set_root(a_pkg_el: UML_PACKAGEABLE_ELEMENT) is
		require
			a_pkg_el /= Void
		do
			root := a_pkg_el
		end

	set_current_package(a_pkg: UML_PACKAGE) is
		require
			a_pkg /= Void
		do
			if root = Void then
				set_root(a_pkg)
			else
				current_package.add_nested_package(a_pkg)
			end
			current_package := a_pkg
		end

	set_current_package_to_parent is
			-- back up one level
		do
			current_package := current_package.nesting_package
		end

feature -- Serialisation

	synchronise_to_tree is
		do
			-- object representing model
			set_model_rep(create {DT_COMPLEX_OBJECT_NODE}.make_anonymous)

			-- create node for this object and put on stack
			object_node_stack.extend(model_rep)
			
			-- create attr node for nested_package list
			attribute_node_stack.extend(create_attribute_node (model_rep, "root", False))
			
			root.synchronise_to_tree
			
			-- pop attribute 
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
