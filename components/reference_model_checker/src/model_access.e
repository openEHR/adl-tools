note
	component:   "openEHR Archetype Project"
	description: "Service interface to an object model access for types and attributes mentioned in archetypes"
	keywords:    "ADL, archetype, reference model"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2008 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class MODEL_ACCESS

inherit
	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

	SHARED_RESOURCES
		export
			{NONE} all
		end

feature -- Access

	ancestor_classes_of (a_class_name: STRING): ARRAYED_LIST [STRING]
			-- return all ancestor types of `a_class_name' up to root class (usually 'ANY', 'Object' or something similar)
			-- does  not include current class. Returns empty list if none.
		require
			Type_valid: a_class_name /= Void and then has_class_definition (a_class_name)
		do
			create Result.make(0)
			if rm_checking_on and model_loaded then
				Result := model.ancestor_classes_of(a_class_name)
			end
		ensure
			Result_exists: Result /= Void
		end

	properties_of (a_type_name: STRING): HASH_TABLE [BMM_PROPERTY_DEFINITION, STRING]
			-- return properties defined directly on class.
		require
			Type_name_valid: a_type_name /= Void and then has_class_definition (a_type_name)
		do
			if rm_checking_on and model_loaded then
				Result := model.class_definition (a_type_name).properties
			else
				create Result.make(0)
			end
		ensure
			Result_exists: Result /= Void
		end

	flat_properties_of (a_type_name: STRING): HASH_TABLE [BMM_PROPERTY_DEFINITION, STRING]
			-- return all properties of inheritance-flattened class.
		require
			Type_name_valid: a_type_name /= Void and then has_class_definition (a_type_name)
		do
			if rm_checking_on and model_loaded then
				Result := model.class_definition (a_type_name).flat_properties
			else
				create Result.make(0)
			end
		ensure
			Result_exists: Result /= Void
		end

	property_type (a_type_name, a_property: STRING): STRING
			-- Type of `an a_property' in class corresponding to `a_type_name'
		require
			Type_name_valid: a_type_name /= Void and then has_class_definition (a_type_name)
			Property_valid: a_property /= Void and then has_property(a_type_name, a_property)
		do
			if rm_checking_on and model_loaded then
				Result := model.property_definition (a_type_name, a_property).type.as_flattened_type_string
			end
		ensure
			Result_exists: Result /= Void
		end

	property_definition (a_type_name, a_property: STRING): BMM_PROPERTY_DEFINITION
			-- definition of  `a_type' has a property named `a_property'
		require
			Type_name_valid: a_type_name /= Void and then has_class_definition (a_type_name)
			Property_valid: a_property /= Void and then has_property(a_type_name, a_property)
		do
			if rm_checking_on and model_loaded then
				Result := model.property_definition(a_type_name, a_property)
			end
		end

	model: BMM_MODEL
			-- computable form of model

	substitutions: HASH_TABLE [STRING, STRING]
			-- allowed type substitutions due to archetyping as a table of
			-- allowable substitution keyed by expected type
		once
			create Result.make(0)
			Result.put("STRING", "ISO8601_DURATION")
			Result.put("STRING", "ISO8601_DATE")
			Result.put("STRING", "ISO8601_DATE_TIME")
			Result.put("STRING", "ISO8601_TIME")
		end

feature -- Status Report

	rm_checking_on: BOOLEAN
			-- True if reference model checking turned on

	model_loaded: BOOLEAN
			-- True if a model is available to interrogate
		do
			Result := model /= Void
		end

	status: STRING
			-- status of model loading operation; if successful, includes model details

feature -- Validation

	is_sub_type_of (a_sub_type, a_parent_type: STRING): BOOLEAN
			-- True if `a_subclass' is a sub-class in the model of `a_parent_type'
		require
			Sub_type_valid: a_sub_type /= Void and then not a_sub_type.is_empty
			Parent_type_valid: a_parent_type /= Void and then not a_parent_type.is_empty
		do
			if rm_checking_on and model_loaded then
				Result := model.has_class_definition (a_parent_type) and then model.is_sub_class_of (a_sub_type, a_parent_type)
			else
				Result := True
			end
		end

	has_property (a_type_name, a_property: STRING): BOOLEAN
			-- True if `a_type_name' has a property named `a_property'
		require
			Type_name_valid: a_type_name /= Void and then has_class_definition (a_type_name)
			Property_valid: a_property /= Void and then not a_property.is_empty
		do
			if rm_checking_on and model_loaded then
				Result := model.has_property(a_type_name, a_property)
			else
				Result := True
			end
		end

	has_class_definition (a_type_name: STRING): BOOLEAN
			-- True if `a_type_name' has a class definition in the model. Note that a_type_name
			-- could be a generic type string; only the root class is considered
		require
			Type_valid: a_type_name /= Void and then not a_type_name.is_empty
		do
			if rm_checking_on and model_loaded then
				Result := model.has_class_definition (a_type_name)
			else
				Result := True
			end
		end

	valid_property_type (a_type_name, a_property_name, a_property_type_name: STRING): BOOLEAN
			-- True if `a_property_type_name' is a valid dynamic type for `a_property' in class `a_type_name'
		require
			Type_name_valid: a_type_name /= Void and then has_class_definition (a_type_name)
			Property_valid: a_property_name /= Void and then has_property(a_type_name, a_property_name)
			Property_type_name_valid: a_property_type_name /= Void and then has_class_definition (a_property_type_name)
		do
			if rm_checking_on and model_loaded then
				if model.valid_type_for_class (a_type_name, a_type_name) and model.valid_type_for_class(a_property_type_name, a_property_type_name) then
					Result := type_conforms_to (model.class_definition (a_property_type_name), model.property_definition (a_type_name, a_property_name).type)
				end
			else
				Result := True
			end
		end

	type_conforms_to (type_spec_1, type_spec_2: BMM_TYPE_SPECIFIER): BOOLEAN
			-- check conformance of type 1 to type 2
		require
			Type_spec_1_exists: type_spec_1 /= Void
			Type_spec_2_exists: type_spec_2 /= Void
		local
			tlist1, tlist2: ARRAYED_LIST[STRING]
		do
			if rm_checking_on and model_loaded then
				tlist1 := type_spec_1.flattened_type_list
				tlist2 := type_spec_2.flattened_type_list
				if tlist1.count >= tlist2.count then
					Result := True
					from
						tlist1.start
						tlist2.start
					until
						tlist2.off or not Result or not has_class_definition (tlist1.item) or not has_class_definition (tlist2.item)
					loop
						Result := Result and
							(tlist1.item.is_equal (tlist2.item) or else
							model.class_definition (tlist1.item).has_ancestor(tlist2.item))
						tlist1.forth
						tlist2.forth
					end
				end
			else
				Result := True
			end
		end

feature -- Status Setting

	set_rm_checking_on (flag: BOOLEAN)
			-- turn rm_checking_on on
		do
			rm_checking_on := flag
			initialise
		end

feature -- Commands

	initialise
			-- set up model
		local
			model_file: PLAIN_TEXT_FILE
			dt_tree: DT_COMPLEX_OBJECT_NODE
			parser: DADL2_VALIDATOR
		do
			if rm_checking_on then
				if not model_loaded then
					create model_file.make (default_rm_schema_file_full_path)
					if not model_file.exists or else not model_file.is_readable then
						status := create_message ("model_access_e1", <<model_file.name>>)
					else
						model_file.open_read
						model_file.read_stream (model_file.count)
						create parser.make
						parser.execute(model_file.last_string, 1)
						if not parser.syntax_error then
							dt_tree := parser.output
							model ?= dt_tree.as_object_from_string("BMM_MODEL")
							if model = Void then
								status := create_message ("model_access_e4", Void)
							else
								model.dt_finalise
								status := model.status
							end
						else
							status := create_message ("model_access_e2", <<parser.error_text>>)
						end
						model_file.close
					end
				end
			else
				status := create_message ("model_access_w1", Void)
				model := Void
			end
		end

feature -- Comparison

feature -- Modification

feature {NONE} -- Implementation


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
--| The Original Code is archetype_directory_item.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2006
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
