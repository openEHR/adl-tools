note
	component:   "Basic meta-model"
	description: "Basic Meta-model model abstraction"
	keywords:    "model, UML"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2009- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class BMM_SCHEMA

inherit
	BMM_PACKAGE_CONTAINER
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

	make (a_rm_publisher, a_schema_name, a_rm_release: STRING)
		do
			precursor (a_rm_publisher, a_schema_name, a_rm_release)
		end

feature -- Definitions

	substitutions: HASH_TABLE [STRING, STRING]
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
		attribute
			create Result.make (0)
		end

	primitive_types: ARRAYED_SET [STRING]
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

	any_class_definition: BMM_CLASS_DEFINITION
			-- retrieve the class definition corresponding to the top `Any' class
		do
			if attached class_definition (any_type) as class_def then
				Result := class_def
			else
				create Result.make (any_type, True)
			end
		end

	class_definition (a_type_name: STRING): BMM_CLASS_DEFINITION
			-- retrieve the class definition corresponding to `a_type_name' (which may contain a generic part)
		require
			Type_name_valid: has_class_definition (a_type_name)
		do
			check attached class_definitions.item (type_to_class (a_type_name)) as class_def then
				Result := class_def
			end
		end

	property_definition (a_type_name, a_prop_name: STRING): BMM_PROPERTY_DEFINITION
			-- retrieve the property definition for `a_prop_name' in flattened class corresponding to `a_type_name'
		require
			Type_name_valid: has_class_definition (a_type_name)
			Property_valid: has_property (a_type_name, a_prop_name)
		do
			check attached class_definition (type_to_class (a_type_name)).flat_properties.item (a_prop_name) as prop_def then
				Result := prop_def
			end
		end

	property_type (a_type_name, a_prop_name: STRING): STRING
			-- retrieve the property type for `a_prop_name' in flattened class corresponding to `a_type_name'
			-- same as property_definition.type, except if a_type_name is generic
		require
			Type_name_valid: has_class_definition (a_type_name)
			Property_valid: has_property(a_type_name, a_prop_name)
		do
			if attached class_definition (type_to_class (a_type_name)) as class_def then
				Result := class_def.property_type (a_type_name, a_prop_name)
			else
				Result := unknown_type_name
			end
		end

	property_definition_at_path (a_type_name, a_property_path: STRING): detachable BMM_PROPERTY_DEFINITION
			-- retrieve the property definition for `a_property_path' in flattened class corresponding to `a_type_name'
		require
			Type_name_valid: has_class_definition (a_type_name)
			Property_path_valid: has_property_path (a_type_name, a_property_path)
		local
			an_og_path: OG_PATH
		do
			create an_og_path.make_pure_from_string (a_property_path)
			an_og_path.start
			Result := class_definition (type_to_class (a_type_name)).property_definition_at_path (an_og_path)
		end

	all_ancestor_classes_of (a_class_name: STRING): ARRAYED_LIST [STRING]
			-- return all ancestor types of `a_class_name' up to root class (usually 'ANY', 'Object' or something similar)
			-- does  not include current class. Returns empty list if none.
		require
			Type_valid: has_class_definition (a_class_name)
		do
			Result := class_definition (a_class_name).all_ancestors
		end

feature -- Status Report

	has_class_definition (a_type_name: STRING): BOOLEAN
			-- True if `a_type_name' has a class definition or is a primitive type in the model. Note that a_type_name
			-- could be a generic type string; only the root class is considered
		require
			Type_valid: not a_type_name.is_empty
		do
			Result := class_definitions.has (type_to_class (a_type_name))
		end

	has_property (a_type_name, a_prop_name: STRING): BOOLEAN
			-- True if `a_type_name'  (which contain a generic part) has an property named `a_prop_name'
		require
			Type_name_valid: has_class_definition (a_type_name)
			Property_valid: not a_prop_name.is_empty
		do
			Result := class_definition (a_type_name).has_property(a_prop_name)
		end

	is_primitive_type (a_type_name: STRING): BOOLEAN
		require
			has_class_definition (a_type_name)
		do
			Result := class_definition (a_type_name).is_primitive_type
		end

	is_descendant_of (a_class, a_parent_class: STRING): BOOLEAN
			-- True if `a_class' is a descendant in the model of `a_parent_class'
			-- Use `type_conforms_to' for full type names
		require
			Sub_class_valid: not a_class.is_empty
			Parent_class_valid: has_class_definition (a_parent_class)
		do
			Result := class_definition (a_class).all_ancestors.has (a_parent_class)
		end

	has_property_path (an_obj_type, a_property_path: STRING): BOOLEAN
			-- is `a_property_path' possible based on this reference model? Path format must be standard forward-slash
			-- delimited path, or Xpath. Any predicates (i.e. [] sections) in an Xpath will be ignored.
		local
			an_og_path: OG_PATH
		do
			create an_og_path.make_pure_from_string(a_property_path)
			an_og_path.start
			if has_class_definition (an_obj_type) then
				Result := class_definition (an_obj_type).has_property_path (an_og_path)
			end
		end

	valid_type_for_class (a_class_name, a_type_name: STRING): BOOLEAN
			-- True if `a_type_name' is a valid type for the class definition of `a_class_name'. Will always be true for
			-- non-generic types, but needs to be checked for generic / container types
		require
			A_class_name_valid: not a_class_name.is_empty
			A_type_name_valid: not a_type_name.is_empty
		local
			is_gen_type: BOOLEAN
			type_strs: ARRAYED_LIST [STRING]
		do
			is_gen_type := is_well_formed_generic_type_name (a_type_name)
			if attached class_definition (a_class_name) as class_def then
				if class_def.is_generic then
					type_strs := type_name_as_flat_list (a_type_name)
					type_strs.compare_objects
					type_strs.start
					if type_strs.item.is_case_insensitive_equal (class_def.name) or class_definitions.item (type_strs.item).has_ancestor (class_def.name)  then
						from
							type_strs.forth
							class_def.generic_parameters.start
						until
							-- a) illegal class as generic parameter OR
							-- b) gen parm class in that position in the defining class is constrained AND THEN NOT has among its ancestors the constrainer class
							type_strs.off or not has_class_definition (type_strs.item) or
								(class_def.generic_parameters.item_for_iteration.is_constrained and then not
								class_definitions.item (type_strs.item).has_ancestor (class_def.generic_parameters.item_for_iteration.conforms_to_type.name))
						loop
							type_strs.forth
							class_def.generic_parameters.forth
						end
						Result := type_strs.off
					end
				elseif not class_def.is_generic and not is_gen_type then
					Result := a_type_name.is_case_insensitive_equal (class_def.name)
				end
			end
		end

	valid_property_type (a_type_name, a_property_name, a_property_type_name: STRING): BOOLEAN
			-- True if `a_property_type_name' is a valid dynamic type for `a_property' in class `a_type_name'
		require
			Type_name_valid: has_class_definition (a_type_name)
			Property_valid: has_property (a_type_name, a_property_name)
			Property_type_name_valid: has_class_definition (a_property_type_name)
		do
			if valid_type_for_class (a_type_name, a_type_name) and valid_type_for_class (a_property_type_name, a_property_type_name) then
				Result := type_name_conforms_to (a_property_type_name, property_definition (a_type_name, a_property_name).type.as_conformance_type_string)
			end
		end

	type_name_conforms_to (type_1, type_2: STRING): BOOLEAN
			-- check conformance of type 1 to type 2; the types may be generic
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

	is_archetype_data_value_type (a_type: STRING): BOOLEAN
			-- True if `has_archetype_data_value_parent_class' and then root type of `a_type'
			-- conforms to `archetype_data_value_parent_class'
		do
			if attached archetype_data_value_parent_class as advp_class  then
				Result := type_name_conforms_to (a_type, advp_class)
			end
		end

feature -- Modification

	add_class_definition (a_class_def: BMM_CLASS_DEFINITION; a_package_def: BMM_PACKAGE_DEFINITION)
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

	add_package (a_pkg: BMM_PACKAGE_DEFINITION)
		do
			precursor (a_pkg)
			a_pkg.set_bmm_schema (Current)
			a_pkg.do_recursive_packages (agent (a_bmm_pkg: BMM_PACKAGE_DEFINITION) do a_bmm_pkg.set_bmm_schema (Current) end)
		ensure then
			Schema_set_in_package: a_pkg.bmm_schema = Current
		end

	set_archetype_parent_class (a_class_name: STRING)
		require
			has_class_definition (a_class_name)
		do
			archetype_parent_class := a_class_name
		end

	set_archetype_data_value_parent_class (a_class_name: STRING)
		require
			has_class_definition (a_class_name)
		do
			archetype_data_value_parent_class := a_class_name
		end

	set_archetype_visualise_descendants_of (a_class_name: STRING)
		require
			has_class_definition (a_class_name)
		do
			archetype_visualise_descendants_of := a_class_name
		end

feature -- Statistics

	generate_statistics
		local
			arch_parent_key, data_value_parent_key: detachable STRING
			class_count_key, primitive_key, abstract_key, generic_key, package_key: STRING
		do
			statistics_table.wipe_out
			package_key := "Package count"
			package_count := 0
			do_recursive_packages (
				agent (a_pkg: BMM_PACKAGE_DEFINITION)
					do
						package_count :=  package_count + 1
					end
			)
			statistics_table.put (package_count, package_key)

			class_count_key := "Classes"
			statistics_table.put (0, class_count_key)

			primitive_key := "Primitive classes"
			statistics_table.put (0, primitive_key)

			abstract_key := "Abstract classes"
			statistics_table.put (0, abstract_key)

			generic_key := "Generic classes"
			statistics_table.put (0, generic_key)

			if attached archetype_parent_class as ap_class then
				arch_parent_key := ap_class + " classes"
				statistics_table.put (0, arch_parent_key)
			end
			if attached archetype_data_value_parent_class as adv_class then
				data_value_parent_key := adv_class + " classes"
				statistics_table.put (0, data_value_parent_key)
			end
			across class_definitions as class_defs_csr loop
				statistics_table.force (statistics_table.item (class_count_key) + 1, class_count_key)
				if class_defs_csr.item.is_primitive_type then
					statistics_table.force (statistics_table.item (primitive_key) + 1, primitive_key)
				end
				if class_defs_csr.item.is_abstract then
					statistics_table.force (statistics_table.item (abstract_key) + 1, abstract_key)
				end
				if class_defs_csr.item.is_generic then
					statistics_table.force (statistics_table.item (generic_key) + 1, generic_key)
				end
				if attached archetype_parent_class as ap_class and attached arch_parent_key as ap_key then
					if class_defs_csr.item.has_ancestor (ap_class) then
						statistics_table.force (statistics_table.item (ap_key) + 1, ap_key)
					end
				end
				if attached archetype_data_value_parent_class as adv_class and attached data_value_parent_key as dvp_key then
					if class_defs_csr.item.has_ancestor (adv_class) then
						statistics_table.force (statistics_table.item (dvp_key) + 1, dvp_key)
					end
				end
			end
		end

	statistics_table: HASH_TABLE [INTEGER, STRING]
		attribute
			create Result.make (0)
		end

feature {NONE} -- Implementation

	package_count: INTEGER

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
