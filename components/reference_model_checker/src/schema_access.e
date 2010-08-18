note
	component:   "openEHR Archetype Project"
	description: "[
	             Service interface to an object model access for types and attributes defined in a schema representing an 
	             object model, or 'reference model'. One instance of this class corresponds to one model; multiple intances
	             might be created in a system, one for each reference model.
	             ]"
	keywords:    "ADL, archetype, reference model"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2009 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class SCHEMA_ACCESS

inherit
	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make(a_schema_full_path: STRING)
			-- set up model from full path to model file
		require
			schema_full_path_attached: a_schema_full_path /= Void
		local
			model_file: PLAIN_TEXT_FILE
			dt_tree: DT_COMPLEX_OBJECT_NODE
			parser: DADL2_VALIDATOR
		do
			create status.make_empty
			create model_file.make (a_schema_full_path)
			if not model_file.exists or else not model_file.is_readable then
				status := create_message_content ("model_access_e1", <<a_schema_full_path>>)
			else
				model_file.open_read
				model_file.read_stream (model_file.count)
				create parser.make
				parser.execute(model_file.last_string, 1)
				if not parser.syntax_error then
					dt_tree := parser.output
					schema ?= dt_tree.as_object_from_string("BMM_SCHEMA")
					if schema = Void then
						status := create_message_content ("model_access_e4", <<a_schema_full_path>>)
					else
						schema.dt_finalise
						schema.validate
						if schema.passed then
							status.copy (schema.info)
							status.append (schema.warnings)
							is_valid := True
						else
							status.copy (schema.errors)
							status.append (schema.warnings)
						end
					end
				else
					status := create_message_content ("model_access_e2", <<a_schema_full_path, parser.error_text>>)
				end
				model_file.close
			end
		end

feature -- Access

	class_definition (a_type_name: STRING): BMM_CLASS_DEFINITION
			-- definition of  `a_type' has a property named `a_property'
		require
			Model_loaded: is_valid
			Type_name_valid: a_type_name /= Void and then has_class_definition (a_type_name)
		do
			Result := schema.class_definition (a_type_name)
		end

	all_ancestor_classes_of (a_class_name: STRING): ARRAYED_LIST [STRING]
			-- return all ancestor types of `a_class_name' up to root class (usually 'ANY', 'Object' or something similar)
			-- does  not include current class. Returns empty list if none.
		require
			Model_loaded: is_valid
			Type_valid: a_class_name /= Void and then has_class_definition (a_class_name)
		do
			Result := schema.all_ancestor_classes_of(a_class_name)
		ensure
			Result_exists: Result /= Void
		end

	properties_of (a_type_name: STRING): HASH_TABLE [BMM_PROPERTY_DEFINITION, STRING]
			-- return properties defined directly on class.
		require
			Model_loaded: is_valid
			Type_name_valid: a_type_name /= Void and then has_class_definition (a_type_name)
		do
			Result := schema.class_definition (a_type_name).properties
		ensure
			Result_exists: Result /= Void
		end

	flat_properties_of (a_type_name: STRING): HASH_TABLE [BMM_PROPERTY_DEFINITION, STRING]
			-- return all properties of inheritance-flattened class.
		require
			Model_loaded: is_valid
			Type_name_valid: a_type_name /= Void and then has_class_definition (a_type_name)
		do
			Result := schema.class_definition (a_type_name).flat_properties
		ensure
			Result_exists: Result /= Void
		end

	property_type (a_type_name, a_property: STRING): STRING
			-- Type of `an a_property' in class corresponding to `a_type_name'
		require
			Model_loaded: is_valid
			Type_name_valid: a_type_name /= Void and then has_class_definition (a_type_name)
			Property_valid: a_property /= Void and then has_property(a_type_name, a_property)
		do
			Result := schema.property_definition (a_type_name, a_property).type.as_flattened_type_string
		ensure
			Result_exists: Result /= Void
		end

	property_definition (a_type_name, a_property: STRING): BMM_PROPERTY_DEFINITION
			-- definition of  `a_type' has a property named `a_property'
		require
			Model_loaded: is_valid
			Type_name_valid: a_type_name /= Void and then has_class_definition (a_type_name)
			Property_valid: a_property /= Void and then has_property(a_type_name, a_property)
		do
			Result := schema.property_definition(a_type_name, a_property)
		end

	property_definition_at_path (a_type_name, a_property_path: STRING): BMM_PROPERTY_DEFINITION
			-- retrieve the property definition for `a_property_path' in flattened class corresponding to `a_type_name'
		require
			Model_loaded: is_valid
			Type_name_valid: a_type_name /= Void and then has_class_definition (a_type_name)
			Property_path_valid: a_property_path /= Void and then has_property_path(a_type_name, a_property_path)
		do
			Result := schema.property_definition_at_path (a_type_name, a_property_path)
		end

	schema: BMM_SCHEMA
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
			Result.put("DOUBLE", "REAL")
		end

feature -- Status Report

	is_valid: BOOLEAN
			-- True if a model is available to interrogate

	status: STRING
			-- status of model loading operation; if successful, includes model details

	is_descendant_of (a_sub_type, a_parent_type: STRING): BOOLEAN
			-- True if `a_subclass' is a sub-class in the model of `a_parent_type'
		require
			Model_loaded: is_valid
			Sub_type_valid: a_sub_type /= Void and then not a_sub_type.is_empty
			Parent_type_valid: a_parent_type /= Void and then not a_parent_type.is_empty
		do
			Result := schema.has_class_definition (a_parent_type) and then schema.is_descendant_of (a_sub_type, a_parent_type)
		end

	has_property (a_type_name, a_property: STRING): BOOLEAN
			-- True if `a_type_name' has a property named `a_property'
		require
			Model_loaded: is_valid
			Type_name_valid: a_type_name /= Void and then has_class_definition (a_type_name)
			Property_valid: a_property /= Void and then not a_property.is_empty
		do
			Result := schema.has_property(a_type_name, a_property)
		end

	has_class_definition (a_type_name: STRING): BOOLEAN
			-- True if `a_type_name' has a class definition in the model. Note that a_type_name
			-- could be a generic type string; only the root class is considered
		require
			Model_loaded: is_valid
			Type_valid: a_type_name /= Void and then not a_type_name.is_empty
		do
			Result := schema.has_class_definition (a_type_name)
		end

	valid_property_type (a_type_name, a_property_name, a_property_type_name: STRING): BOOLEAN
			-- True if `a_property_type_name' is a valid dynamic type for `a_property' in class `a_type_name'
		require
			Model_loaded: is_valid
			Type_name_valid: a_type_name /= Void and then has_class_definition (a_type_name)
			Property_valid: a_property_name /= Void and then has_property(a_type_name, a_property_name)
			Property_type_name_valid: a_property_type_name /= Void and then has_class_definition (a_property_type_name)
		do
			if schema.valid_type_for_class (a_type_name, a_type_name) and schema.valid_type_for_class(a_property_type_name, a_property_type_name) then
				Result := type_conforms_to (a_property_type_name, schema.property_definition (a_type_name, a_property_name).type.as_flattened_type_string)
			end
		end

	type_conforms_to (type_1, type_2: STRING): BOOLEAN
			-- check conformance of type 1 to type 2
		require
			Model_loaded: is_valid
			Type_1_exists: type_1 /= Void
			Type_2_exists: type_2 /= Void
		do
			Result := schema.type_conforms_to (type_1, type_2)
		end

	has_property_path (an_obj_type, a_path: STRING): BOOLEAN
			-- is `a_path' possible based on this reference model? Path format must be standard forward-slash
			-- delimited path, or Xpath. Any predicates (i.e. [] sections) in an Xpath will be ignored.
		require
			Model_loaded: is_valid
			object_type_attached: an_obj_type /= Void
			path_attached: a_path /= Void
		do
			Result := schema.has_property_path (an_obj_type, a_path)
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
