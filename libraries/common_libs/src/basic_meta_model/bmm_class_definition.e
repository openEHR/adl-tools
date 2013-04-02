note
	component:   "Basic meta-model"
	description: "[
				 Definition of a class in an object model. A class is type that may be open 
				 or closed in terms of other types mentioned within.
				 ]"
	keywords:    "model, Basic meta-model"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2009 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

class BMM_CLASS_DEFINITION

inherit
	BMM_TYPE_SPECIFIER
		export
			{ANY} is_well_formed_type_name
		end

	IDENTIFIED_TOOL_ARTEFACT
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make (a_name: STRING; abstract_flag: BOOLEAN)
		require
			Name_valid: not a_name.is_empty
		do
			name := a_name
			is_abstract := abstract_flag
		end

feature -- Access

	bmm_schema: detachable BMM_SCHEMA
			-- reverse reference to parent schema
		note
			option: stable
		attribute
		end

	name: STRING
			-- name of the class FROM SCHEMA

	semantic_class: BMM_CLASS_DEFINITION
			-- the 'design' class of this type, ignoring containers, multiplicity etc.
		do
			Result := Current
		end

	generic_parameters: detachable HASH_TABLE [BMM_GENERIC_PARAMETER_DEFINITION, STRING]
			-- list of generic parameter definitions, keyed by name of generic parameter;
			-- these are defined either directly on this class or by the addition of an
			-- ancestor class which is generic

	ancestors: HASH_TABLE [BMM_CLASS_DEFINITION, STRING]
			-- list of immediate inheritance parents
		attribute
			create Result.make (0)
		end

	properties: HASH_TABLE [BMM_PROPERTY_DEFINITION, STRING]
			-- list of attributes defined in this class
		attribute
			create Result.make (0)
		end

	package: detachable BMM_PACKAGE_DEFINITION
			-- package this class belongs to

	source_schema_id: STRING
			-- reference to original source schema defining this class
		attribute
			create Result.make_from_string ("(uninitialised)")
		end

	all_ancestors: ARRAYED_SET [STRING]
			-- list of all inheritance parent class names
		do
			if attached all_ancestors_cache as aac then
				Result := aac
			else
				create Result.make (0)
				Result.compare_objects
				across ancestors as ancestors_csr loop
					Result.extend (ancestors_csr.key)
					Result.merge (ancestors_csr.item.all_ancestors)
				end
				all_ancestors_cache := Result
			end
		end

	immediate_descendants: ARRAYED_LIST [BMM_CLASS_DEFINITION]
			-- list of immediate inheritance descendants
		attribute
			create Result.make (0)
		end

	all_descendants: ARRAYED_SET [STRING]
		do
			if attached all_descendants_cache as adc then
				Result := adc
			else
				create Result.make(0)
				Result.compare_objects
				across immediate_descendants as imm_descs_csr loop
					Result.extend (imm_descs_csr.item.name)
					Result.merge (imm_descs_csr.item.type_substitutions)
				end
				all_descendants_cache := Result
			end
		end

	type_category: STRING
			-- generate a type category of main target type from Type_cat_xx values
		do
			if is_primitive_type then
				Result := Type_cat_primitive_class
			elseif is_abstract then
				Result := Type_cat_abstract_class
			elseif has_type_substitutions then
				Result := Type_cat_concrete_class_supertype
			else
				Result := Type_cat_concrete_class
			end
		end

	package_path: STRING
			-- fully qualified package name, of form: 'package.package'
		do
			Result := package.path
		end

	class_path: STRING
			-- fully qualified class name, of form: 'package.package.CLASS'
			-- with package path in lower-case and class in original case
		do
			Result := package_path
			Result.append_character (package_name_delimiter)
			Result.append (name)
		end

	globally_qualified_path: STRING
			-- fully qualified class name prepended with schema id of containing top-level schema, of form:
			-- 'schema_id::package.package.CLASS' to enable identification in situation when a given class/package
			-- has been imported into more than one schema.
		do
			Result := bmm_schema.schema_id + Schema_name_delimiter + class_path
		end

	suppliers: ARRAYED_SET [STRING]
			-- list of names of immediate supplier classes, including concrete generic parameters,
			-- concrete descendants of abstract statically defined types, and inherited suppliers.
			-- (where generics are unconstrained, no class name is added, since logically it would be
			-- 'ANY' and this can always be assumed anyway)
			-- This list includes primitive types
		local
			ftl: ARRAYED_LIST [STRING]
		do
			if attached suppliers_cache as sc then
				Result := sc
			else
				create Result.make(0)
				Result.compare_objects

				-- get the types defined in formal generics
				if is_generic then
					ftl := flattened_type_list
					ftl.go_i_th (1)
					ftl.remove
					Result.merge (ftl)
				end

				-- get the types of all the properties (including inherited)
				across flat_properties as props_csr loop
					-- get the statically defined type(s) of the property (could be >1 due to generics)
					ftl := props_csr.item.type.flattened_type_list
					Result.merge (ftl)
					-- now get the descendant types, since these could be bound at runtime
					across ftl as gen_types_csr loop
						across bmm_schema.class_definition (gen_types_csr.item).immediate_descendants as imm_descs_csr loop
							Result.extend (imm_descs_csr.item.name)
						end
					end
				end

				suppliers_cache := Result
			end
		end

	suppliers_non_primitive: ARRAYED_SET [STRING]
			-- same as `suppliers' minus primitive types, as defined in input schema
		do
			if attached suppliers_non_primitive_cache as snpc then
				Result := snpc
			else
				create Result.make (0)
				Result.compare_objects
				Result.merge (suppliers)
				Result.subtract (bmm_schema.primitive_types)
				suppliers_non_primitive_cache := Result
			end
		end

	supplier_closure: ARRAYED_SET [STRING]
			-- list of names of all classes in full supplier closure, including concrete generic parameters;
			-- (where generics are unconstrained, no class name is added, since logically it would be
			-- 'ANY' and this can always be assumed anyway)
			-- This list includes primitive types
		do
			if attached supplier_closure_cache as scc then
				Result := scc
			else
				closure_types_done.wipe_out
				closure_types_done.extend (name)
				create Result.make(0)
				supplier_closure_cache := Result
				Result.compare_objects
				Result.merge (suppliers)
				across suppliers as suppliers_csr loop
					if not closure_types_done.has (suppliers_csr.item) then
						Result.merge (bmm_schema.class_definition (suppliers_csr.item).supplier_closure)
						closure_types_done.extend (suppliers_csr.item)
					end
				end
			end
		end

	flat_properties: HASH_TABLE [BMM_PROPERTY_DEFINITION, STRING]
			-- list of all properties due to current and ancestor classes, keyed by property name
		do
			if attached flat_properties_cache as fpc then
				Result := fpc
			else
				create Result.make (0)
				Result.compare_objects

				-- merge ancestor properties
				across ancestors as ancestors_csr loop
					Result.merge (ancestors_csr.item.flat_properties)
				end

				-- now merge the current properties - merging afterward will correctly replace ancestor properties of same name
				Result.merge (properties)

				flat_properties_cache := Result
			end
		end

	flattened_type_list: ARRAYED_LIST [STRING]
			-- completely flattened list of type names, flattening out all generic parameters
			-- e.g. "HASH_TABLE <LINKED_LIST <STRING>, STRING>" => <<"HASH_TABLE", "LINKED_LIST", "STRING", "STRING">>
		do
			create Result.make(0)
			Result.compare_objects
			Result.extend (name)
			if is_generic then
				across generic_parameters as gen_parms_csr loop
					Result.append (gen_parms_csr.item.flattened_type_list)
				end
			end
		end

	property_definition_at_path (a_prop_path: OG_PATH): detachable BMM_PROPERTY_DEFINITION
			-- retrieve the property definition for `a_prop_path' in flattened class corresponding to `a_type_name'
			-- note that the internal cursor of the path is used to know how much to read - from cursor to end (this allows
			-- recursive evaluation)
		require
			Property_path_valid: has_property_path (a_prop_path)
		local
			a_path_pos: INTEGER
			i: INTEGER
		do
			a_path_pos := a_prop_path.items.index
			if has_property (a_prop_path.item.attr_name) then
				Result := flat_properties.item (a_prop_path.item.attr_name)
				a_prop_path.forth
				if not a_prop_path.off and then attached bmm_schema.class_definition (Result.type.root_class) as class_def then
					Result := class_def.property_definition_at_path (a_prop_path)
				end
			else -- look in the descendants
				from i := 1 until i > immediate_descendants.count or Result /= Void loop
					if immediate_descendants.i_th(i).has_property_path (a_prop_path) then
						Result := immediate_descendants.i_th(i).property_definition_at_path (a_prop_path)
					end
					i := i + 1
				end
			end
			a_prop_path.go_i_th (a_path_pos)
		end

	property_type (a_class_type_name, a_prop_name: STRING): STRING
			-- retrieve the property type for `a_prop_name' in class corresponding to `a_type_name'
			-- same as property_definition.type, except if a_type_name is generic
		require
			Type_name_valid: is_well_formed_type_name (a_class_type_name)
			Property_valid: has_property (a_prop_name)
		local
			prop_type: BMM_TYPE_SPECIFIER
			gen_param_count: INTEGER
		do
			if attached flat_properties.item (a_prop_name) as prop_def then
				prop_type := prop_def.type
				if attached {BMM_GENERIC_PARAMETER_DEFINITION} prop_type as gen_prop_type then
					gen_param_count := 1
					from generic_parameters.start until generic_parameters.off or generic_parameters.item_for_iteration.name.is_equal (gen_prop_type.name) loop
						gen_param_count := gen_param_count + 1
						generic_parameters.forth
					end
					Result := type_name_as_flat_list (a_class_type_name).i_th (gen_param_count + 1)
				else
					Result := prop_type.as_type_string
				end
			else
				Result := unknown_type_name
			end
		end

	type_substitutions: ARRAYED_SET [STRING]
		do
			Result := all_descendants
		end

	global_artefact_identifier: STRING
			-- tool-wide unique id for this artefact
		do
			Result := globally_qualified_path
		end

	global_artefact_category: STRING
			-- tool-wide category for this artefact, useful for indexing visual type indeicators
			-- like pixmap etc
		do
			Result := type_category
		end

feature -- Status Report

	is_abstract: BOOLEAN
			-- True if this is an abstract type

	is_generic: BOOLEAN
			-- True if this class is a generic class
		do
			Result := attached generic_parameters
		end

	is_primitive_type: BOOLEAN
			-- True if this class is designated a primitive type within the overall type system of the schema

	is_override: BOOLEAN
			-- True if this definition overrides a class of the same name in an included schema

	has_type_substitutions: BOOLEAN
		do
			Result := is_abstract or else not immediate_descendants.is_empty
		end

	has_property (a_prop_name: STRING): BOOLEAN
			-- True if a_prop_name valid in this type, due to this type definition, or any ancestor
		require
			Attr_name_valid: not a_prop_name.is_empty
		do
			Result := flat_properties.has (a_prop_name)
		end

	has_ancestor (a_class_name: STRING): BOOLEAN
			-- True if a_class_name is among the ancestor classes
		require
			Class_name_valid: not a_class_name.is_empty
		do
			Result := a_class_name.is_equal (any_type) or else ancestors.has (a_class_name.as_upper) or else all_ancestors.has (a_class_name.as_upper)
		end

	has_generic_parameter (a_gen_parm_name: STRING): BOOLEAN
			-- True if `a_gen_parm_name' is among the generic parameters, if any exist
		require
			Generic_parameter_name_valid: not a_gen_parm_name.is_empty
		do
			Result := attached generic_parameters and then generic_parameters.has (a_gen_parm_name.as_upper)
		end

	has_immediate_descendant (a_class_name: STRING): BOOLEAN
			-- True if a_class_name is among the immediate descendant classes
		require
			Class_name_valid: not a_class_name.is_empty
		do
			Result := across immediate_descendants as descs_csr some descs_csr.item.name.is_equal (a_class_name) end
		end

	has_property_path (a_path: OG_PATH): BOOLEAN
			-- is `a_path' possible based on this reference model?
			-- note that the internal cursor of the path is used to know how much to read - from cursor to end (this allows
			-- recursive evaluation)
		local
			a_path_pos: INTEGER
			i: INTEGER
		do
			a_path_pos := a_path.items.index
			if has_property (a_path.item.attr_name) and then attached flat_properties.item (a_path.item.attr_name) as flat_prop then
				if attached bmm_schema.class_definition (flat_prop.type.root_class) as class_def then
					a_path.forth
					if not a_path.off then
						Result := class_def.has_property_path (a_path)
					else
						Result := True
					end
				end
			else -- look in the descendants
				from i := 1 until i > immediate_descendants.count or Result loop
					Result := immediate_descendants.i_th(i).has_property_path(a_path)
					i := i + 1
				end
			end
			a_path.go_i_th (a_path_pos)
		end

	valid_candidate_property (a_prop_def: BMM_PROPERTY_DEFINITION): BOOLEAN
			-- True if `a_prop_def' is a valid candidate for adding as a new property:
			-- either it does not exist in the current flat properties (i.e. inherited properties)
			-- or if it does, it is conformant to the inherited property
		do
			if flat_properties.has (a_prop_def.name) and then attached flat_properties.item (a_prop_def.name) as flat_prop then
				Result := a_prop_def.bmm_conforms_to (flat_prop)
			else
				Result := True
			end
		end

feature -- Traversal

	do_supplier_closure (flat_flag: BOOLEAN; continue_action: FUNCTION [ANY, TUPLE [BMM_PROPERTY_DEFINITION], BOOLEAN];
				enter_action: PROCEDURE [ANY, TUPLE [BMM_PROPERTY_DEFINITION, INTEGER]];
				exit_action: detachable PROCEDURE [ANY, TUPLE [BMM_PROPERTY_DEFINITION]])
			-- On all nodes in supplier closure of this class, execute `enter_action', then recurse into its subnodes, then execute `exit_action'.
			-- If `flat_flag' = True, use the inheritance-flattened closure
			-- THIS CAN BE AN EXPENSIVE COMPUTATION, so it is limited by the max_depth argument
		local
			props: HASH_TABLE [BMM_PROPERTY_DEFINITION, STRING]
		do
			supplier_closure_stack.wipe_out
			supplier_closure_stack.extend (name)

			supplier_closure_class_record.wipe_out
			supplier_closure_class_record.extend (name)

			if flat_flag then
				props := flat_properties
			else
				props := properties
			end

			across props as props_csr loop
				do_property_supplier_closure (props_csr.item, flat_flag, continue_action, enter_action, exit_action, 0)
			end
		end

feature -- Output

	as_type_string: STRING
			-- name of the type
		do
			create Result.make_empty
			Result.append (name)
			if is_generic then
				Result.append_character (generic_left_delim)
				across generic_parameters as gen_parms_csr loop
					Result.append (gen_parms_csr.item.as_type_string)
					if gen_parms_csr.cursor_index < generic_parameters.count then
						Result.append_character (generic_separator)
					end
				end
				Result.append_character (generic_right_delim)
			end
		end

	description: STRING
			-- output a description of this class for use in e.g. tooltips, other places in the UI
		do
	 	 	create Result.make_empty
	 	 	Result.append (class_path)
	 	 	Result.append ("%NSource schema: " + source_schema_id)
	 	 	if is_override then
	 	 		Result.append ("%N(overrides previous definition)")
	 	 	end
	 	 end

feature -- Modification

	set_bmm_schema (a_bmm_schema: BMM_SCHEMA)
		do
			bmm_schema := a_bmm_schema
		end

	set_package (a_package: BMM_PACKAGE_DEFINITION)
			-- put this class into the package
		do
			package := a_package
		end

	set_primitive_type
		do
			is_primitive_type := True
		ensure
			is_primitive_type
		end

	set_source_schema_id (an_id: STRING)
			-- set source schema id
		do
			source_schema_id := an_id
		end

	add_ancestor (an_anc_class: BMM_CLASS_DEFINITION)
			-- add an ancestor class
		require
			New_ancestor: not ancestors.has_item (an_anc_class)
		do
			ancestors.put (an_anc_class, an_anc_class.name.as_upper)
			an_anc_class.add_immediate_descendant (Current)
			all_ancestors_cache := Void
			reset_flat_properties_cache
		ensure
			Ancestor_added: ancestors.item (an_anc_class.name.as_upper) = an_anc_class
			Ancestor_descendant_added: an_anc_class.immediate_descendants.has (Current)
		end

	add_generic_parameter (a_gen_parm_def: BMM_GENERIC_PARAMETER_DEFINITION)
			-- add a generic parameter, and link it to the corresponding definition
			-- in any generic ancestor
		require
			New_gen_parm_def: not has_generic_parameter (a_gen_parm_def.name)
		do
			if not attached generic_parameters then
				create generic_parameters.make (0)
			end
			generic_parameters.put (a_gen_parm_def, a_gen_parm_def.name.as_upper)

			-- connect generic parm def with matching def in parent classes if any
			-- first find a direct ancestor that has generic parameters
			if not ancestors.is_empty then
				from ancestors.start until ancestors.off or ancestors.item_for_iteration.is_generic loop
					ancestors.forth
				end
				if not ancestors.off and then ancestors.item_for_iteration.has_generic_parameter (a_gen_parm_def.name) and then
					attached ancestors.item_for_iteration.generic_parameters as gen_parms and then
					attached gen_parms.item (a_gen_parm_def.name.as_upper) as gen_parm
				then
					a_gen_parm_def.set_inheritance_precursor (gen_parm)
				end
			end

			suppliers_cache := Void
			supplier_closure_cache := Void
			suppliers_non_primitive_cache := Void
		ensure
			generic_parameters.item (a_gen_parm_def.name.as_upper) = a_gen_parm_def
		end

	set_is_override
			-- set `is_override'
		do
			is_override := True
		end

	add_property (a_prop_def: BMM_PROPERTY_DEFINITION)
		require
			Valid_property: valid_candidate_property (a_prop_def)
		do
			properties.put (a_prop_def, a_prop_def.name)

			suppliers_cache := Void
			supplier_closure_cache := Void
			suppliers_non_primitive_cache := Void
			reset_flat_properties_cache
		end

feature {BMM_CLASS_DEFINITION} -- Implementation

	add_immediate_descendant (a_class: BMM_CLASS_DEFINITION)
			-- add a class def to the descendants list
		do
			immediate_descendants.extend (a_class)

			all_descendants_cache := Void
			suppliers_cache := Void
			supplier_closure_cache := Void
			suppliers_non_primitive_cache := Void
		end

	flat_properties_cache: detachable HASH_TABLE [BMM_PROPERTY_DEFINITION, STRING]
			-- reference list of all attributes due to inheritance flattening of this type

	suppliers_cache: detachable ARRAYED_SET [STRING]
			-- cache for `suppliers'

	suppliers_non_primitive_cache: detachable ARRAYED_SET [STRING]
			-- cache for `suppliers_non_primitive'

	supplier_closure_cache: detachable ARRAYED_SET [STRING]
			-- cache for `supplier_closure'

	all_ancestors_cache: detachable ARRAYED_SET [STRING]
			-- cache for `all_ancestors'

	all_descendants_cache: detachable ARRAYED_SET [STRING]
			-- cache for `all_descendants'

	reset_flat_properties_cache
			-- recusively clear current and all descendant flat_property caches
		do
			flat_properties_cache := Void
			immediate_descendants.do_all (
				agent (a_desc: BMM_CLASS_DEFINITION)
					do
						a_desc.reset_flat_properties_cache
					end
			)
		end

feature {NONE} -- Implementation

	do_property_supplier_closure (a_prop: BMM_PROPERTY_DEFINITION; flat_flag: BOOLEAN;
				continue_action: FUNCTION [ANY, TUPLE [BMM_PROPERTY_DEFINITION], BOOLEAN];
				enter_action: PROCEDURE [ANY, TUPLE [BMM_PROPERTY_DEFINITION, INTEGER]];
				exit_action: detachable PROCEDURE [ANY, TUPLE [BMM_PROPERTY_DEFINITION]];
				depth: INTEGER)
			-- On all nodes in supplier closure of `a_prop', execute `enter_action', then recurse into its subnodes, then execute `exit_action'.
			-- If `flat_flag' = True, use the inheritance-flattened closure
			-- THIS CAN BE AN EXPENSIVE COMPUTATION, so it is limited by the max_depth argument
		local
			props: HASH_TABLE [BMM_PROPERTY_DEFINITION, STRING]
		do
			if not supplier_closure_stack.has (a_prop.type.root_class) then
				supplier_closure_stack.extend (a_prop.type.root_class)

				enter_action.call ([a_prop, depth])

		--		if not supplier_closure_class_record.has (a_prop.type.root_class) then
		--			supplier_closure_class_record.extend (a_prop.type.root_class)
					if continue_action.item ([a_prop, depth]) then
						if flat_flag then
							props := bmm_schema.class_definition (a_prop.type.root_class).flat_properties
						else
							props := bmm_schema.class_definition (a_prop.type.root_class).properties
						end

						across props as props_csr loop
							do_property_supplier_closure (props_csr.item, flat_flag, continue_action, enter_action, exit_action, depth + 1)
						end
					end
		--		end

				if attached exit_action then
					exit_action.call ([a_prop])
				end
				supplier_closure_stack.remove
			end
		end

	supplier_closure_stack: ARRAYED_STACK [STRING]
			-- list of classes on this tree branch, to prevent cycling
		attribute
			create Result.make (0)
			Result.compare_objects
		end

	supplier_closure_class_record: ARRAYED_LIST [STRING]
			-- list of classes already done, to prevent fully expanded form of each class being generated after its first occurrence
		attribute
			create Result.make (0)
			Result.compare_objects
		end

	closure_types_done: ARRAYED_SET [STRING]
			-- list of types for which supplier_closure has already been called, used to avoid doing rework
		attribute
			create Result.make (0)
			Result.compare_objects
		end

invariant
	Generic_validity: is_generic implies generic_parameters /= Void and then not generic_parameters.is_empty

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
