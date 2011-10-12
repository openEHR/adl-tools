note
	component:   "openEHR re-usable library"
	description: "Basic Meta-model model abstraction"
	keywords:    "model, UML"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2009 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class BMM_SCHEMA

inherit
	BMM_PACKAGE_CONTAINER
		rename
			make as make_package_container
		redefine
			add_package
		end

	BMM_SCHEMA_CORE
		redefine
			make
		end

	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make (a_model_publisher, a_schema_name, a_model_release: attached STRING)
		do
			make_package_container
			create class_definitions.make (0)
			model_publisher := a_model_publisher
			schema_name := a_schema_name
			model_release := a_model_release
		end

feature -- Definitions

	substitutions: attached HASH_TABLE [STRING, STRING]
			-- allowed type substitutions due to archetyping as a table of
			-- allowable substitution keyed by expected type
		once
			create Result.make(0)
			Result.put("String", "ISO8601_DURATION")
			Result.put("String", "ISO8601_DATE")
			Result.put("String", "ISO8601_DATE_TIME")
			Result.put("String", "ISO8601_TIME")
			Result.put("Double", "REAL")
		end

feature -- Access

	class_definitions: HASH_TABLE [BMM_CLASS_DEFINITION, STRING]
			-- all classes in this schema

	archetype_parent_class: detachable STRING
			-- name of a class within the schema that all archetypable classes inherit from

	primitive_types: attached ARRAYED_SET [STRING]
			-- list of keys in `class_definitions' of items marked as primitive types, as defined in input schema
		do
			create Result.make (0)
			Result.compare_objects
			from class_definitions.start until class_definitions.off loop
				if class_definitions.item_for_iteration.is_primitive_type then
					Result.extend (class_definitions.item_for_iteration.name)
				end
				class_definitions.forth
			end
		ensure
			Result.object_comparison
		end

	any_class_definition: attached BMM_CLASS_DEFINITION
			-- retrieve the class definition corresponding to the top `Any' class
		do
			Result := class_definition (any_type)
		end

	class_definition (a_type_name: attached STRING): attached BMM_CLASS_DEFINITION
			-- retrieve the class definition corresponding to `a_type_name' (which may contain a generic part)
		require
			Type_name_valid: has_class_definition (a_type_name)
		local
			a_class_name: STRING
		do
			a_class_name := type_to_class (a_type_name)
			Result := class_definitions.item (a_class_name)
		end

	property_definition (a_type_name, a_prop_name: attached STRING): attached BMM_PROPERTY_DEFINITION
			-- retrieve the property definition for `a_prop_name' in flattened class corresponding to `a_type_name'
		require
			Type_name_valid: has_class_definition (a_type_name)
			Property_valid: has_property (a_type_name, a_prop_name)
		do
			Result := class_definition (type_to_class (a_type_name)).flat_properties.item (a_prop_name)
		end

	property_type (a_type_name, a_prop_name: attached STRING): attached STRING
			-- retrieve the property type for `a_prop_name' in flattened class corresponding to `a_type_name'
			-- same as property_definition.type, except if a_type_name is generic
		require
			Type_name_valid: has_class_definition (a_type_name)
			Property_valid: has_property(a_type_name, a_prop_name)
		local
			class_def: BMM_CLASS_DEFINITION
		do
			class_def := class_definition (type_to_class (a_type_name))
			Result := class_def.property_type(a_type_name, a_prop_name)
		end

	property_definition_at_path (a_type_name, a_property_path: attached STRING): attached BMM_PROPERTY_DEFINITION
			-- retrieve the property definition for `a_property_path' in flattened class corresponding to `a_type_name'
		require
			Type_name_valid: has_class_definition (a_type_name)
			Property_path_valid: has_property_path(a_type_name, a_property_path)
		local
			an_og_path: OG_PATH
			class_def: BMM_CLASS_DEFINITION
		do
			class_def := class_definition (type_to_class (a_type_name))
			create an_og_path.make_pure_from_string(a_property_path)
			an_og_path.start
			Result := class_def.property_definition_at_path(an_og_path)
		end

	all_ancestor_classes_of (a_class_name: attached STRING): attached ARRAYED_LIST [STRING]
			-- return all ancestor types of `a_class_name' up to root class (usually 'ANY', 'Object' or something similar)
			-- does  not include current class. Returns empty list if none.
		require
			Type_valid: has_class_definition (a_class_name)
		do
			Result := class_definition (a_class_name).all_ancestors
		end

feature -- Status Report

	has_archetype_parent_class: BOOLEAN
			-- True if this schema has an archetype_parent_class
		do
			Result := attached archetype_parent_class
		end

	has_class_definition (a_type_name: attached STRING): BOOLEAN
			-- True if `a_type_name' has a class definition or is a primitive type in the model. Note that a_type_name
			-- could be a generic type string; only the root class is considered
		require
			Type_valid: not a_type_name.is_empty
		do
			Result := class_definitions.has (type_to_class (a_type_name))
		end

	has_property (a_type_name, a_prop_name: attached STRING): BOOLEAN
			-- True if `a_type_name'  (which contain a generic part) has an property named `a_prop_name'
		require
			Type_name_valid: has_class_definition (a_type_name)
			Property_valid: not a_prop_name.is_empty
		do
			Result := class_definition (a_type_name).has_property(a_prop_name)
		end

	is_descendant_of (a_class, a_parent_class: attached STRING): BOOLEAN
			-- True if `a_class' is a descendant in the model of `a_parent_class'
		require
			Sub_class_valid: not a_class.is_empty
			Parent_class_valid: has_class_definition (a_parent_class)
		do
			Result := class_definition (a_class).all_ancestors.has (a_parent_class)
		end

	has_property_path (an_obj_type, a_property_path: attached STRING): BOOLEAN
			-- is `a_property_path' possible based on this reference model? Path format must be standard forward-slash
			-- delimited path, or Xpath. Any predicates (i.e. [] sections) in an Xpath will be ignored.
		local
			an_og_path: OG_PATH
		do
			create an_og_path.make_pure_from_string(a_property_path)
			an_og_path.start
			if has_class_definition (an_obj_type) then
				Result := class_definition (an_obj_type).has_property_path(an_og_path)
			end
		end

	valid_type_for_class (a_class_name, a_type_name: attached STRING): BOOLEAN
			-- True if `a_type_name' is a valid type for the class definition of `a_class_name'. Will always be true for
			-- non-generic types, but needs to be checked for generic / container types
		require
			A_class_name_valid: not a_class_name.is_empty
			A_type_name_valid: not a_type_name.is_empty
		local
			is_gen_type: BOOLEAN
			type_strs: ARRAYED_LIST [STRING]
			a_class_def: BMM_CLASS_DEFINITION
		do
			is_gen_type := is_well_formed_generic_type_name (a_type_name)
			a_class_def := class_definition (a_class_name)
			if a_class_def.is_generic then
				type_strs := type_name_as_flat_list (a_type_name)
				type_strs.compare_objects
				type_strs.start
				if type_strs.item.is_case_insensitive_equal (a_class_def.name) or class_definitions.item (type_strs.item).has_ancestor (a_class_def.name)  then
					from
						type_strs.forth
						a_class_def.generic_parameters.start
					until
						type_strs.off or not has_class_definition (type_strs.item) or
							(a_class_def.generic_parameters.item_for_iteration.is_constrained and then not
							class_definitions.item (type_strs.item).has_ancestor (a_class_def.generic_parameters.item_for_iteration.conforms_to_type.name))
					loop
						type_strs.forth
						a_class_def.generic_parameters.forth
					end
					Result := type_strs.off
				end
			elseif not a_class_def.is_generic and not is_gen_type then
				Result := a_type_name.is_case_insensitive_equal (a_class_def.name)
			end
		end

	valid_property_type (a_type_name, a_property_name, a_property_type_name: attached STRING): BOOLEAN
			-- True if `a_property_type_name' is a valid dynamic type for `a_property' in class `a_type_name'
		require
			Type_name_valid: has_class_definition (a_type_name)
			Property_valid: has_property(a_type_name, a_property_name)
			Property_type_name_valid: has_class_definition (a_property_type_name)
		do
			if valid_type_for_class (a_type_name, a_type_name) and valid_type_for_class(a_property_type_name, a_property_type_name) then
				Result := type_conforms_to (a_property_type_name, property_definition (a_type_name, a_property_name).type.as_flattened_type_string)
			end
		end

	type_conforms_to (type_1, type_2: attached STRING): BOOLEAN
			-- check conformance of type 1 to type 2
		local
			tlist1, tlist2: ARRAYED_LIST[STRING]
		do
			tlist1 := type_name_as_flat_list (type_1)
			tlist2 := type_name_as_flat_list (type_2)
			Result := True
			from
				tlist1.start
				tlist2.start
			until
				tlist1.off or tlist2.off or not Result or not has_class_definition (tlist1.item) or not has_class_definition (tlist2.item)
			loop
				Result := Result and
					(tlist1.item.is_case_insensitive_equal (tlist2.item) or else
					class_definition (tlist1.item).has_ancestor (tlist2.item))
				tlist1.forth
				tlist2.forth
			end
		end

feature -- Modification

	add_class_definition (a_class_def: attached BMM_CLASS_DEFINITION; a_package_def: attached BMM_PACKAGE_DEFINITION)
			-- add `a_class_def' to this schema, in package `a_package_def', which must exist in the schema
		require
			Valid_class: not has_class_definition (a_class_def.name)
			Valid_package: recursive_has_package (a_package_def)
		do
			class_definitions.put (a_class_def, a_class_def.name.as_upper)
			a_package_def.add_class (a_class_def)
			a_class_def.set_bmm_schema (Current)
		ensure
			Class_added: class_definition (a_class_def.name) = a_class_def
			Schema_set_in_class: a_class_def.bmm_schema = Current
		end

	add_package (a_pkg: attached BMM_PACKAGE_DEFINITION)
		do
			precursor (a_pkg)
			a_pkg.set_bmm_schema (Current)
			a_pkg.do_recursive_packages (agent (a_bmm_pkg: BMM_PACKAGE_DEFINITION) do a_bmm_pkg.set_bmm_schema (Current) end)
		ensure then
			Schema_set_in_package: a_pkg.bmm_schema = Current
		end

	set_archetype_parent_class (a_class_name: attached STRING)
		require
			has_class_definition (a_class_name)
		do
			archetype_parent_class := a_class_name
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
--| The Original Code is bmm_model.e.
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
