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

class BMM_MODEL

inherit
	BMM_DEFINITIONS
		export
			{NONE} all
		end

	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

	DT_CONVERTIBLE

feature -- Initialisation

	make_dt
			-- make in a safe way for DT building purposes
		local
			a: BMM_SINGLE_PROPERTY
			b: BMM_CONTAINER_PROPERTY
			c: BMM_SINGLE_PROPERTY_OPEN
			d: BMM_GENERIC_PROPERTY
		do

		end

feature -- Access

	model_name: STRING
			-- name of the model

	model_release: STRING
			-- release identifier of the model

	primitive_types: HASH_TABLE [BMM_CLASS_DEFINITION, STRING]
			-- types like Integer, Boolean etc

	class_definitions: HASH_TABLE [BMM_CLASS_DEFINITION, STRING]
			-- constructed classes

	class_definition (a_type_name: STRING): BMM_CLASS_DEFINITION
			-- retrieve the class definition corresponding to `a_type_name' (which contain a generic part)
			-- from either `primitive_types' or `classes'
		require
			Type_name_valid: a_type_name /= Void and then has_class_definition (a_type_name)
		local
			a_class_name: STRING
		do
			a_class_name := type_to_class(a_type_name)
			if primitive_types.has (a_class_name) then
				Result := primitive_types.item (a_class_name)
			else
				Result := class_definitions.item (a_class_name)
			end
		ensure
			Result_exists: Result /= Void
		end

	property_definition (a_type_name, a_prop_name: STRING): BMM_PROPERTY_DEFINITION
			-- retrieve the property definition for `a_prop_name' in flattened class corresponding to `a_type_name'
		require
			Type_name_valid: a_type_name /= Void and then has_class_definition (a_type_name)
			Property_valid: a_prop_name /= Void and then has_property(a_type_name, a_prop_name)
		local
			class_def: BMM_CLASS_DEFINITION
		do
			class_def := class_definition(type_to_class(a_type_name))
			Result := class_def.flat_properties.item(a_prop_name)
		ensure
			Result_exists: Result /= Void
		end

	status: STRING
			-- status report on model
		do
			create Result.make(0)
			Result.append (create_message ("model_access_i1", << model_name, model_release, primitive_types.count.out, class_definitions.count.out >>))
		end

	ancestor_classes_of (a_class_name: STRING): ARRAYED_LIST [STRING]
			-- return all ancestor types of `a_class_name' up to root class (usually 'ANY', 'Object' or something similar)
			-- does  not include current class. Returns empty list if none.
		require
			Type_valid: a_class_name /= Void and then has_class_definition (a_class_name)
		local
			anc: ARRAYED_LIST[BMM_CLASS_DEFINITION]
		do
			create Result.make(0)
			anc := class_definition (a_class_name).ancestors
			from anc.start until anc.off loop
				Result.extend(anc.item.name)
				anc.forth
			end
		ensure
			Result_exists: Result /= Void
		end

feature -- Status Report

	has_class_definition (a_type_name: STRING): BOOLEAN
			-- True if `a_type_name' has a class definition in the model. Note that a_type_name
			-- could be a generic type string; only the root class is considered
		require
			Type_valid: a_type_name /= Void and then not a_type_name.is_empty
		local
			a_class_name: STRING
		do
			a_class_name := type_to_class(a_type_name)
			Result := primitive_types.has (a_class_name) or class_definitions.has (a_class_name)
		end

	has_property (a_type_name, a_prop_name: STRING): BOOLEAN
			-- True if `a_type_name'  (which contain a generic part) has an property named `a_prop_name'
		require
			Type_name_valid: a_type_name /= Void and then has_class_definition (a_type_name)
			Property_valid: a_prop_name /= Void and then not a_prop_name.is_empty
		do
			Result := class_definition (a_type_name).has_property(a_prop_name)
		end

	is_sub_class_of (a_class, a_parent_class: STRING): BOOLEAN
			-- True if `a_class' is a sub-class in the model of `a_parent_class'
		require
			Sub_class_valid: a_class /= Void not a_class.is_empty
			Parent_class_valid: a_parent_class /= Void and then has_class_definition (a_parent_class)
		do
			Result := True
		end

	valid_type_for_class(a_class_name, a_type_name: STRING): BOOLEAN
			-- True if `a_type_name' is valid with respect to this class. Will always be true for
			-- non-generic types, but needs to be checked for generic / container types
		require
			A_class_name_valid: a_class_name /= Void and then not a_class_name.is_empty
			A_type_name_valid: a_type_name /= Void and then not a_type_name.is_empty
		local
			is_gen_type: BOOLEAN
			type_strs: ARRAYED_LIST [STRING]
			a_class_def: BMM_CLASS_DEFINITION
		do
			is_gen_type := is_well_formed_generic_type_name (a_type_name)
			a_class_def := class_definition (a_class_name)
			if a_class_def.is_generic then
				type_strs := type_name_as_flattened_type_list(a_type_name)
				type_strs.compare_objects
				type_strs.start
				if type_strs.item.is_equal (a_class_def.name) or class_definitions.item (type_strs.item).has_ancestor(a_class_def.name)  then
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
				Result := a_type_name.is_equal (a_class_def.name)
			end
		end

	has_path (a_path, an_obj_type: STRING): BOOLEAN
			-- is `a_path' possible based on this reference model? Path format must be standard forward-slash
			-- delimited path, or Xpath. Any predicates (i.e. [] sections) in an Xpath will be ignored.
		require
			path_attached: a_path /= Void
			object_type_attached: an_obj_type /= Void
		local
			an_og_path: OG_PATH
		do
			create an_og_path.make_pure_from_string(a_path)
			an_og_path.start
			if has_class_definition (an_obj_type) then
				Result := class_definition (an_obj_type).has_path(an_og_path)
			end
		end

feature -- Commands

	dt_finalise
			-- clean up after build of model
		local
			keys: ARRAY [STRING]
			i: INTEGER
			anc_list: ARRAYED_LIST [BMM_CLASS_DEFINITION]
		do
			-- convert primitive type names of the form 'Integer' to all uppercase; has to be done in
			-- two gos, because changing keys messs with the table structure if done in one pass
			from primitive_types.start until primitive_types.off loop
				primitive_types.item_for_iteration.name.to_upper
				primitive_types.forth
			end
			keys := primitive_types.current_keys
			from i := 1 until i > keys.count loop
				primitive_types.replace_key (keys.item(i).as_upper, keys.item(i))
				i := i + 1
			end

			-- now finalise all classes
			from primitive_types.start until primitive_types.off loop
				primitive_types.item_for_iteration.dt_finalise(Current)
				anc_list := primitive_types.item_for_iteration.ancestors

				-- set all class def descendants property
				from anc_list.start until anc_list.off loop
					anc_list.item.add_immediate_descendant (primitive_types.item_for_iteration)
					anc_list.forth
				end
				primitive_types.forth
			end
			from class_definitions.start until class_definitions.off loop
				class_definitions.item_for_iteration.dt_finalise(Current)

				-- set all class def descendants property
				anc_list := class_definitions.item_for_iteration.ancestors
				from anc_list.start until anc_list.off loop
					anc_list.item.add_immediate_descendant (class_definitions.item_for_iteration)
					anc_list.forth
				end
				class_definitions.forth
			end
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: ARRAYED_LIST[STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		do
		end

feature {NONE} -- Implementation

	type_to_class (a_type_name: STRING): STRING
			-- convert a type name which might have a generic part to a simple class name
		require
			Type_valid: a_type_name /= Void and then not a_type_name.is_empty
		local
			gen_pos: INTEGER
		do
			gen_pos := a_type_name.substring_index (generic_left_delim.out, 1)
			if gen_pos > 0 then
				Result := a_type_name.substring (1, gen_pos-1)
				Result.right_adjust
			else
				Result := a_type_name
			end
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
