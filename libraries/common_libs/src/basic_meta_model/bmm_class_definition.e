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

	make_dt
			-- make in a safe way for DT building purposes
		do
			create properties.make (0)
			create ancestors.make (0)
			create all_ancestors.make (0)
			all_ancestors.compare_objects
			create immediate_descendants.make (0)
		end

feature -- Access

	name: STRING
			-- name of the class FROM SCHEMA
			-- DON'T RENAME THIS ATTRIBUTE

	generic_parameters: HASH_TABLE [BMM_GENERIC_PARAMETER_DEFINITION, STRING]
			-- list of generic parameter definitions
			-- FIXME: this won't function correctly unless ordering is guaranteed;
			-- use DS_HASH_TABLE - but not yet supported by DT_OBJECT_CONVERTER
			-- DON'T RENAME THIS ATTRIBUTE

	ancestors: ARRAYED_LIST [BMM_CLASS_DEFINITION]
			-- list of immediate inheritance parents FROM SCHEMA
			-- DON'T RENAME THIS ATTRIBUTE

	all_ancestors: ARRAYED_LIST [STRING]
			-- list of all inheritance parent class names; derived in port-schema processing

	immediate_descendants: ARRAYED_LIST [BMM_CLASS_DEFINITION]
			-- list of immediate inheritance descendants; set during post processing
			-- by BMM_SCHEMA

	properties: HASH_TABLE [BMM_PROPERTY_DEFINITION, STRING]
			-- list of attributes defined in this class FROM SCHEMA
			-- DON'T RENAME THIS ATTRIBUTE

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
					ftl := properties.item_for_iteration.type.flattened_type_list
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
				create immediate_suppliers_non_primitive_cache.make(0)
				immediate_suppliers_non_primitive_cache.compare_objects
				immediate_suppliers_non_primitive_cache.merge(immediate_suppliers)
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
				from ancestors.start until ancestors.off loop
					flat_properties_cache.merge (ancestors.item.flat_properties)
					ancestors.forth
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
				from generic_parameters.start until generic_parameters.off loop
					Result.append(generic_parameters.item_for_iteration.flattened_type_list)
					generic_parameters.forth
				end
			end
		end

	property_definition_at_path (a_prop_path: OG_PATH): attached BMM_PROPERTY_DEFINITION
			-- retrieve the property definition for `a_prop_path' in flattened class corresponding to `a_type_name'
			-- note that the internal cursor of the path is used to know how much to read - from cursor to end (this allows
			-- recursive evaluation)
		require
			Property_path_valid: a_prop_path /= Void and then has_property_path(a_prop_path)
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
					class_def := bmm_model.class_definition(Result.type.root_class)
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

	property_type (a_class_type_name, a_prop_name: STRING): attached STRING
			-- retrieve the property type for `a_prop_name' in class corresponding to `a_type_name'
			-- same as property_definition.type, except if a_type_name is generic
		require
			Type_name_valid: a_class_type_name /= Void and then is_well_formed_type_name (a_class_type_name)
			Property_valid: a_prop_name /= Void and then has_property(a_prop_name)
		local
			prop_def: BMM_PROPERTY_DEFINITION
			prop_type: BMM_TYPE_SPECIFIER
			gen_param_count: INTEGER
		do
			prop_def := flat_properties.item(a_prop_name)
			prop_type := prop_def.type
			if attached {BMM_GENERIC_PARAMETER_DEFINITION} prop_type as gen_prop_type then
				gen_param_count := 1
				from generic_parameters.start until generic_parameters.off or generic_parameters.item_for_iteration.name.is_equal(gen_prop_type.name) loop
					gen_param_count := gen_param_count + 1
					generic_parameters.forth
				end
				Result := type_name_as_flattened_type_list (a_class_type_name).i_th (gen_param_count)
			else
				Result := prop_type.as_type_string
			end
		end

feature -- Status Report

	is_abstract: BOOLEAN
			-- True if this is an abstract type

	is_generic: BOOLEAN
			-- True if this class is a generic class

	has_property (a_prop_name: STRING): BOOLEAN
			-- True if a_prop_name valid in this type, due to this type definition, or any ancestor
		require
			Attr_name_valid: a_prop_name /= Void and then not a_prop_name.is_empty
		do
			Result := flat_properties.has (a_prop_name)
		end

	has_ancestor (a_class_name: STRING): BOOLEAN
			-- True if a_class_name is among the ancestor classes
		require
			Class_name_valid: a_class_name /= Void and then not a_class_name.is_empty
		do
			from ancestors.start until ancestors.off or Result loop
				Result := ancestors.item.name.is_equal(a_class_name) or else ancestors.item.has_ancestor (a_class_name)
				ancestors.forth
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
				class_def := bmm_model.class_definition(flat_properties.item (a_path.item.attr_name).type.root_class)
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

	dt_finalise (a_bmmm: BMM_SCHEMA)
			-- synchronise structures after creation by DT deserialiser
		do
			bmm_model := a_bmmm

			-- connect attribute defs with parent attribute defs

			-- connect generic parm defs with defs in parent classes if any
			-- first find a direct ancestor that has generic parameters
			if is_generic and ancestors /= Void then
				from ancestors.start until ancestors.off or ancestors.item.is_generic loop
					ancestors.forth
				end
				if not ancestors.off then
					from generic_parameters.start until generic_parameters.off loop
						if ancestors.item.generic_parameters.has (generic_parameters.key_for_iteration) then
							generic_parameters.item_for_iteration.set_inheritance_precursor(ancestors.item.generic_parameters.item(generic_parameters.key_for_iteration))
						end
						generic_parameters.forth
					end
				end
			end
		end

feature -- Traversal

	do_supplier_closure (flat_flag: BOOLEAN; enter_action, exit_action: PROCEDURE [ANY, TUPLE [BMM_PROPERTY_DEFINITION]])
			-- On all nodes in supplier closure of this class, execute `enter_action', then recurse into its subnodes, then execute `exit_action'.
			-- If `flat_flag' = True, use the inheritance-flattened closure
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
				do_property_supplier_closure (props.item_for_iteration, flat_flag, enter_action, exit_action)
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
					generic_parameters.start
					i := 1
				until generic_parameters.off loop
					Result.append(generic_parameters.item_for_iteration.as_type_string)
					if i < generic_parameters.count then
						Result.append_character(generic_separator)
					end
					generic_parameters.forth
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

feature {BMM_SCHEMA} -- Implementation

	add_immediate_descendant(a_bmm_class: BMM_CLASS_DEFINITION)
			-- add a class def to the descendants list
		do
			immediate_descendants.extend (a_bmm_class)
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

	bmm_model: BMM_SCHEMA
			-- reverse reference, set after initialisation from input schema

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: ARRAYED_LIST[STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		do
			-- FIXME: not in use, since no serialisatoin back out at this stage
		end

feature {NONE} -- Implementation

	do_property_supplier_closure (a_prop: BMM_PROPERTY_DEFINITION; flat_flag: BOOLEAN; enter_action, exit_action: PROCEDURE [ANY, TUPLE [BMM_PROPERTY_DEFINITION]])
			-- On all nodes in supplier closure of `a_prop', execute `enter_action', then recurse into its subnodes, then execute `exit_action'.
			-- If `flat_flag' = True, use the inheritance-flattened closure
		require
			propert_attached: a_prop /= Void
			enter_action_attached: enter_action /= Void
		local
			props: attached HASH_TABLE [BMM_PROPERTY_DEFINITION, STRING]
		do
			if not supplier_closure_stack.has(a_prop.type.root_class) then
				supplier_closure_stack.extend(a_prop.type.root_class)

				enter_action.call ([a_prop])

				if not supplier_closure_class_record.has(a_prop.type.root_class) then
					supplier_closure_class_record.extend(a_prop.type.root_class)
					if flat_flag then
						props := bmm_model.class_definition(a_prop.type.root_class).flat_properties
					else
						props := bmm_model.class_definition(a_prop.type.root_class).properties
					end

					from props.start until props.off loop
						do_property_supplier_closure (props.item_for_iteration, flat_flag, enter_action, exit_action)
						props.forth
					end
				end

				if exit_action /= Void then
					exit_action.call ([a_prop])
				end
				supplier_closure_stack.remove
			end
		end

	supplier_closure_stack: ARRAYED_STACK [STRING]
			-- list of classes on this tree branch, to prevent cycling

	supplier_closure_class_record: ARRAYED_LIST [STRING]
			-- list of classes already done, to prevent fully expanded form being generated after first instance

invariant
	Properties_exists: properties /= Void
	Ancestors_exists: ancestors /= Void
	Descendants_exists: immediate_descendants /= Void
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
