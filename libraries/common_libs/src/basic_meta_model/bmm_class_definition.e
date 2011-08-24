note
	component:   "openEHR re-usable library"
	description: "[
				 Definition of a class in an object model. A class is type that may be open 
				 or closed in terms of other types mentioned within.
				 ]"
	keywords:    "model, UML"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2009 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class BMM_CLASS_DEFINITION

inherit
	BMM_TYPE_SPECIFIER

	DT_CONVERTIBLE

feature -- Initialisation

	make_dt  (make_args: ARRAY[ANY])
			-- make in a safe way for DT building purposes
		do
			create properties.make (0)
			create ancestor_defs.make (0)
			create all_ancestors.make (0)
			all_ancestors.compare_objects
			create immediate_descendants.make (0)
		end

feature -- Access (attributes from schema)

	name: attached STRING
			-- name of the class FROM SCHEMA
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	generic_parameter_defs: HASH_TABLE [BMM_GENERIC_PARAMETER_DEFINITION, STRING]
			-- list of generic parameter definitions
			-- FIXME: this won't function correctly unless ordering is guaranteed;
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	ancestors: ARRAYED_LIST [STRING]
			-- list of immediate inheritance parents FROM SCHEMA
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	properties: HASH_TABLE [BMM_PROPERTY_DEFINITION, STRING]
			-- list of attributes defined in this class FROM SCHEMA
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	is_abstract: BOOLEAN
			-- True if this is an abstract type
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	is_generic: BOOLEAN
			-- True if this class is a generic class
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

feature -- Access (attributes derived in post-schema processing)

	ancestor_defs: ARRAYED_LIST [BMM_CLASS_DEFINITION]
			-- list of immediate inheritance parents derived from `ancestors'in post-schema processing
			-- by BMM_SCHEMA

	all_ancestors: ARRAYED_LIST [STRING]
			-- list of all inheritance parent class names; derived in post-schema processing
			-- by BMM_SCHEMA

	immediate_descendants: ARRAYED_LIST [BMM_CLASS_DEFINITION]
			-- list of immediate inheritance descendants; set during post processing
			-- by BMM_SCHEMA

	type_category: STRING
			-- generate a type category of main target type from Type_cat_xx values
		do
			if is_abstract then
				Result := Type_cat_abstract_class
			elseif has_type_substitutions then
				Result := Type_cat_concrete_class_supertype
			else
				Result := Type_cat_concrete_class
			end
		end

	qualified_package_name: STRING
			-- fully qualified package name

feature -- Access

	immediate_suppliers: attached ARRAYED_SET [STRING]
			-- list of names of immediate supplier classes, including concrete generic parameters and
			-- concrete descendants of abstract statically defined types.
			-- (where generics are unconstrained, no class name is added, since logically it would be
			-- 'ANY' and this can always be assumed anyway)
			-- This list includes primitive types
		local
			ftl: ARRAYED_LIST [STRING]
			imm_descs: ARRAYED_LIST [BMM_CLASS_DEFINITION]
		do
			if immediate_suppliers_cache = Void then
				create immediate_suppliers_cache.make(0)
				immediate_suppliers_cache.compare_objects
				if is_generic then
					ftl := flattened_type_list
					ftl.go_i_th (1)
					ftl.remove
					immediate_suppliers_cache.merge (ftl)
				end
				from properties.start until properties.off loop
					-- get the statically defined type(s) of the property (could be >1 due to generics)
					ftl := properties.item_for_iteration.type_def.flattened_type_list
					immediate_suppliers_cache.merge (ftl)

					-- now get the descendant types
					from ftl.start until ftl.off loop
						imm_descs := bmm_model.class_definition (ftl.item).immediate_descendants
						from imm_descs.start until imm_descs.off loop
							immediate_suppliers_cache.extend(imm_descs.item.name)
							imm_descs.forth
						end
						ftl.forth
					end
					properties.forth
				end
			end
			Result := immediate_suppliers_cache
		end

	immediate_suppliers_non_primitive: attached ARRAYED_SET [STRING]
			-- same as `suppliers' minus primitive types, as defined in input schema
		local
			prim_types: ARRAYED_SET [STRING]
		do
			if immediate_suppliers_non_primitive_cache = Void then
				create prim_types.make (0)
				prim_types.compare_objects
				prim_types.merge (bmm_model.primitive_types.current_keys)
				create immediate_suppliers_non_primitive_cache.make (0)
				immediate_suppliers_non_primitive_cache.compare_objects
				immediate_suppliers_non_primitive_cache.merge (immediate_suppliers)
				immediate_suppliers_non_primitive_cache.subtract (prim_types)
			end
			Result := immediate_suppliers_non_primitive_cache
		end

	all_suppliers: attached ARRAYED_SET [STRING]
			-- list of names of all classes in supplier closure, including concrete generic parameters;
			-- (where generics are unconstrained, no class name is added, since logically it would be
			-- 'ANY' and this can always be assumed anyway)
			-- This list includes primitive types
		do
			if all_suppliers_cache = Void then
				create all_suppliers_cache.make(0)
				all_suppliers_cache.compare_objects
				all_suppliers_cache.merge (immediate_suppliers)
				from immediate_suppliers.start until immediate_suppliers.off loop
					all_suppliers_cache.merge (bmm_model.class_definition (immediate_suppliers.item).all_suppliers)
					immediate_suppliers.forth
				end
			end
			Result := all_suppliers_cache
		end

	flat_properties: attached HASH_TABLE [BMM_PROPERTY_DEFINITION, STRING]
			-- list of all propertoes due to current and ancestor classes, keyed by property name
		do
			if flat_properties_cache = Void then
				create flat_properties_cache.make(0)
				flat_properties_cache.compare_objects
				from ancestor_defs.start until ancestor_defs.off loop
					flat_properties_cache.merge (ancestor_defs.item.flat_properties)
					ancestor_defs.forth
				end
				flat_properties_cache.merge (properties)
			end
			Result := flat_properties_cache
		end

	flattened_type_list: attached ARRAYED_LIST [STRING]
			-- completely flattened list of type names, flattening out all generic parameters
			-- e.g. "HASH_TABLE [LINKED_LIST[STRING], STRING]" => <<"HASH_TABLE", "LINKED_LIST", "STRING", "STRING">>
		do
			create Result.make(0)
			Result.compare_objects
			Result.extend (name)
			if is_generic then
				from generic_parameter_defs.start until generic_parameter_defs.off loop
					Result.append(generic_parameter_defs.item_for_iteration.flattened_type_list)
					generic_parameter_defs.forth
				end
			end
		end

	property_definition_at_path (a_prop_path: attached OG_PATH): attached BMM_PROPERTY_DEFINITION
			-- retrieve the property definition for `a_prop_path' in flattened class corresponding to `a_type_name'
			-- note that the internal cursor of the path is used to know how much to read - from cursor to end (this allows
			-- recursive evaluation)
		require
			Property_path_valid: has_property_path(a_prop_path)
		local
			a_path_pos: INTEGER
			class_def: BMM_CLASS_DEFINITION
			i: INTEGER
		do
			a_path_pos := a_prop_path.items.index
			if has_property (a_prop_path.item.attr_name) then
				Result := flat_properties.item (a_prop_path.item.attr_name)
				a_prop_path.forth
				if not a_prop_path.off then
					class_def := bmm_model.class_definition(Result.type_def.root_class)
					Result := class_def.property_definition_at_path(a_prop_path)
				end
			else -- look in the descendants
				from i := 1 until i > immediate_descendants.count or Result /= Void loop
					if immediate_descendants.i_th(i).has_property_path(a_prop_path) then
						Result := immediate_descendants.i_th(i).property_definition_at_path(a_prop_path)
					end
					i := i + 1
				end
			end
			a_prop_path.go_i_th (a_path_pos)
		end

	property_type (a_class_type_name, a_prop_name: attached STRING): attached STRING
			-- retrieve the property type for `a_prop_name' in class corresponding to `a_type_name'
			-- same as property_definition.type, except if a_type_name is generic
		require
			Type_name_valid: is_well_formed_type_name (a_class_type_name)
			Property_valid: has_property(a_prop_name)
		local
			prop_def: BMM_PROPERTY_DEFINITION
			prop_type: BMM_TYPE_SPECIFIER
			gen_param_count: INTEGER
		do
			prop_def := flat_properties.item(a_prop_name)
			prop_type := prop_def.type_def
			if attached {BMM_GENERIC_PARAMETER_DEFINITION} prop_type as gen_prop_type then
				gen_param_count := 1
				from generic_parameter_defs.start until generic_parameter_defs.off or generic_parameter_defs.item_for_iteration.name.is_equal(gen_prop_type.name) loop
					gen_param_count := gen_param_count + 1
					generic_parameter_defs.forth
				end
				Result := type_name_as_flattened_list (a_class_type_name).i_th (gen_param_count)
			else
				Result := prop_type.as_type_string
			end
		end

	type_substitutions: ARRAYED_SET [STRING]
		do
			create Result.make(0)
			from immediate_descendants.start until immediate_descendants.off loop
				Result.extend (immediate_descendants.item.name)
				Result.merge (immediate_descendants.item.type_substitutions)
				immediate_descendants.forth
			end
		end

feature -- Status Report

	has_type_substitutions: BOOLEAN
		do
			Result := is_abstract or else not immediate_descendants.is_empty
		end

	has_property (a_prop_name: STRING): BOOLEAN
			-- True if a_prop_name valid in this type, due to this type definition, or any ancestor
		require
			Attr_name_valid: a_prop_name /= Void and then not a_prop_name.is_empty
		do
			Result := flat_properties.has (a_prop_name)
		end

	has_ancestor (a_class_name: attached STRING): BOOLEAN
			-- True if a_class_name is among the ancestor classes
		require
			Class_name_valid: not a_class_name.is_empty
		do
			from ancestor_defs.start until ancestor_defs.off or Result loop
				Result := ancestor_defs.item.name.is_equal(a_class_name) or else ancestor_defs.item.has_ancestor (a_class_name)
				ancestor_defs.forth
			end
		end

	has_immediate_descendant (a_class_name: STRING): BOOLEAN
			-- True if a_class_name is among the immediate descendant classes
		require
			Class_name_valid: a_class_name /= Void and then not a_class_name.is_empty
		do
			from immediate_descendants.start until immediate_descendants.off or Result loop
				Result := immediate_descendants.item.name.is_equal(a_class_name)
				immediate_descendants.forth
			end
		end

	has_property_path (a_path: OG_PATH): BOOLEAN
			-- is `a_path' possible based on this reference model?
			-- note that the internal cursor of the path is used to know how much to read - from cursor to end (this allows
			-- recursive evaluation)
		require
			path_attached: a_path /= Void
		local
			a_path_pos: INTEGER
			class_def: BMM_CLASS_DEFINITION
			i: INTEGER
		do
			a_path_pos := a_path.items.index
			if has_property (a_path.item.attr_name) then
				class_def := bmm_model.class_definition(flat_properties.item (a_path.item.attr_name).type_def.root_class)
				a_path.forth
				if not a_path.off then
					Result := class_def.has_property_path(a_path)
				else
					Result := True
				end
			else -- look in the descendants
				from i := 1 until i > immediate_descendants.count or Result loop
					Result := immediate_descendants.i_th(i).has_property_path(a_path)
					i := i + 1
				end
			end
			a_path.go_i_th (a_path_pos)
		end

feature -- Commands

	finalise_build (a_bmmm: attached BMM_SCHEMA; errors: ERROR_ACCUMULATOR)
			-- synchronise structures after creation by DT deserialiser
		do
			bmm_model := a_bmmm

			-- populate references to ancestor classes; should be every class except Any
			if attached ancestors then
				from ancestors.start until ancestors.off loop
					if bmm_model.has_class_definition (ancestors.item) then
						ancestor_defs.extend (bmm_model.class_definition (ancestors.item))
					end
					ancestors.forth
				end
			end

			-- post-process generic parameters if any
			if is_generic then
				if attached generic_parameter_defs then
					from generic_parameter_defs.start until generic_parameter_defs.off loop
						generic_parameter_defs.item_for_iteration.finalise_build (a_bmmm, Current, errors)
						generic_parameter_defs.forth
					end

					-- connect generic parm defs with defs in parent classes if any
					-- first find a direct ancestor that has generic parameters
					if not ancestor_defs.is_empty then
						from ancestor_defs.start until ancestor_defs.off or ancestor_defs.item.is_generic loop
							ancestor_defs.forth
						end
						if not ancestor_defs.off then
							from generic_parameter_defs.start until generic_parameter_defs.off loop
								if ancestor_defs.item.generic_parameter_defs.has (generic_parameter_defs.key_for_iteration) then
									generic_parameter_defs.item_for_iteration.set_inheritance_precursor (ancestor_defs.item.generic_parameter_defs.item (generic_parameter_defs.key_for_iteration))
								end
								generic_parameter_defs.forth
							end
						end
					end
				else
					errors.add_error ("BMM_GPGPM", <<a_bmmm.schema_id, name>>, Void)
				end
			end

			-- post-process properties
			from properties.start until properties.off loop
				properties.item_for_iteration.finalise_build (a_bmmm, Current, errors)
				properties.forth
			end

			-- connect attribute defs with parent attribute defs
		end

feature -- Traversal

	do_supplier_closure (flat_flag: BOOLEAN; max_depth: INTEGER;
		enter_action: PROCEDURE [ANY, TUPLE [BMM_PROPERTY_DEFINITION, INTEGER]]; exit_action: PROCEDURE [ANY, TUPLE [BMM_PROPERTY_DEFINITION]])
			-- On all nodes in supplier closure of this class, execute `enter_action', then recurse into its subnodes, then execute `exit_action'.
			-- If `flat_flag' = True, use the inheritance-flattened closure
			-- THIS CAN BE AN EXPENSIVE COMPUTATION, so it is limited by the max_depth argument
		require
			enter_action_attached: enter_action /= Void
		local
			props: attached HASH_TABLE [BMM_PROPERTY_DEFINITION, STRING]
		do
			create supplier_closure_stack.make(0)
			supplier_closure_stack.compare_objects
			supplier_closure_stack.extend(name)

			create supplier_closure_class_record.make(0)
			supplier_closure_class_record.compare_objects
			supplier_closure_class_record.extend(name)

			if flat_flag then
				props := flat_properties
			else
				props := properties
			end

			from props.start until props.off loop
				do_property_supplier_closure (props.item_for_iteration, flat_flag, max_depth, enter_action, exit_action)
				props.forth
			end
		end

feature -- Output

	as_type_string: STRING
			-- name of the type
		local
			i: INTEGER
		do
			create Result.make(0)
			Result.append(name)
			if is_generic then
				Result.append_character (generic_left_delim)
				from
					generic_parameter_defs.start
					i := 1
				until generic_parameter_defs.off loop
					Result.append(generic_parameter_defs.item_for_iteration.as_type_string)
					if i < generic_parameter_defs.count then
						Result.append_character(generic_separator)
					end
					generic_parameter_defs.forth
					i := i + 1
				end
				Result.append_character (generic_right_delim)
			end
		end

	as_flattened_type_string: STRING
			-- name of the type
		do
			Result := as_type_string
		end

feature {BMM_SCHEMA} -- Modification

	add_immediate_descendant(a_bmm_class: BMM_CLASS_DEFINITION)
			-- add a class def to the descendants list
		do
			immediate_descendants.extend (a_bmm_class)
		end

	set_qualified_package_name (a_name: attached STRING)
		do
			qualified_package_name := a_name
		end

feature {BMM_CLASS_DEFINITION} -- Implementation

	flat_properties_cache: HASH_TABLE [BMM_PROPERTY_DEFINITION, STRING]
			-- reference list of all attributes due to inheritance flattening of this type

	immediate_suppliers_cache: ARRAYED_SET [STRING]
			-- cache for `suppliers'

	immediate_suppliers_non_primitive_cache: ARRAYED_SET [STRING]
			-- cache for `suppliers_non_primitive'

	all_suppliers_cache: ARRAYED_SET [STRING]
			-- cache for `suppliers'

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: ARRAYED_LIST[STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		do
			-- FIXME: not in use, since no serialisatoin back out at this stage
		end

feature {NONE} -- Implementation

	do_property_supplier_closure (a_prop: attached BMM_PROPERTY_DEFINITION; flat_flag: BOOLEAN; max_depth: INTEGER;
		enter_action: attached PROCEDURE [ANY, TUPLE [BMM_PROPERTY_DEFINITION, INTEGER]]; exit_action: PROCEDURE [ANY, TUPLE [BMM_PROPERTY_DEFINITION]])
			-- On all nodes in supplier closure of `a_prop', execute `enter_action', then recurse into its subnodes, then execute `exit_action'.
			-- If `flat_flag' = True, use the inheritance-flattened closure
			-- THIS CAN BE AN EXPENSIVE COMPUTATION, so it is limited by the max_depth argument
		local
			props: attached HASH_TABLE [BMM_PROPERTY_DEFINITION, STRING]
		do
			if not supplier_closure_stack.has (a_prop.type_def.root_class) then
				supplier_closure_stack.extend (a_prop.type_def.root_class)

				enter_action.call ([a_prop, max_depth])

		--		if not supplier_closure_class_record.has (a_prop.type_def.root_class) then
		--			supplier_closure_class_record.extend (a_prop.type_def.root_class)
					if max_depth > 0 then
						if flat_flag then
							props := bmm_model.class_definition (a_prop.type_def.root_class).flat_properties
						else
							props := bmm_model.class_definition (a_prop.type_def.root_class).properties
						end

						from props.start until props.off loop
							do_property_supplier_closure (props.item_for_iteration, flat_flag, max_depth - 1, enter_action, exit_action)
							props.forth
						end
					end
		--		end

				if exit_action /= Void then
					exit_action.call ([a_prop])
				end
				supplier_closure_stack.remove
			end
		end

	supplier_closure_stack: ARRAYED_STACK [STRING]
			-- list of classes on this tree branch, to prevent cycling

	supplier_closure_class_record: ARRAYED_LIST [STRING]
			-- list of classes already done, to prevent fully expanded form of each class being generated after its first occurrence

invariant
	Generic_validity: is_generic implies generic_parameter_defs /= Void and then not generic_parameter_defs.is_empty

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
