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


class UML_MODEL

inherit
	UML_SERIALISABLE
		redefine
			synchronise_to_tree
		end
	
create
	make

feature -- Initialisation

	make
		do
		end

feature -- Access

	root: UML_PACKAGEABLE_ELEMENT

	current_package: UML_PACKAGE
			-- last element added

feature -- modification
	
	set_root(a_pkg_el: UML_PACKAGEABLE_ELEMENT)
		require
			a_pkg_el /= Void
		do
			root := a_pkg_el
		end

	set_current_package(a_pkg: UML_PACKAGE)
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

	set_current_package_to_parent
			-- back up one level
		do
			current_package := current_package.nesting_package
		end

feature -- Serialisation

	synchronise_to_tree
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


