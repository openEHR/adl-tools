indexing
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

	make_dt is
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

	class_definition (a_type_name: STRING): BMM_CLASS_DEFINITION is
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

	property_definition (a_type_name, a_prop_name: STRING): BMM_PROPERTY_DEFINITION is
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

	status: STRING is
			-- status report on model
		do
			create Result.make(0)
			Result.append (create_message ("model_access_i1", << model_name, model_release, primitive_types.count.out, class_definitions.count.out >>))
		end

feature -- Status Report

	has_class_definition (a_type_name: STRING): BOOLEAN is
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

	has_property (a_type_name, a_prop_name: STRING): BOOLEAN is
			-- True if `a_type_name'  (which contain a generic part) has an property named `a_prop_name'
		require
			Type_name_valid: a_type_name /= Void and then has_class_definition (a_type_name)
			Property_valid: a_prop_name /= Void and then not a_prop_name.is_empty
		do
			Result := class_definition (a_type_name).has_property(a_prop_name)
		end

	is_sub_class_of (a_class, a_parent_class: STRING): BOOLEAN is
			-- True if `a_class' is a sub-class in the model of `a_parent_class'
		require
			Sub_class_valid: a_class /= Void not a_class.is_empty
			Parent_class_valid: a_parent_class /= Void and then has_class_definition (a_parent_class)
		do
			Result := True
		end

feature -- Commands

	dt_finalise
			-- clean up after build of model
		local
			keys: ARRAY [STRING]
			i: INTEGER
		do
			-- convert primitive type names of the form 'Integer' to all uppercase; has to be done in
			-- two goes, because changing keys messs with the table structure if done in one pass
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
				primitive_types.item_for_iteration.dt_finalise
				primitive_types.forth
			end
			from class_definitions.start until class_definitions.off loop
				class_definitions.item_for_iteration.dt_finalise
				class_definitions.forth
			end
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: ARRAYED_LIST[STRING] is
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		do
		end

feature {NONE} -- Implementation

	type_to_class (a_type_name: STRING): STRING is
			-- convert a type name which might have a generic part to a simple class name
		require
			Type_valid: a_type_name /= Void and then not a_type_name.is_empty
		local
			gen_pos: INTEGER
		do
			gen_pos := a_type_name.substring_index (generic_left_delim, 1)
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
