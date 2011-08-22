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
	BMM_DEFINITIONS
		export
			{NONE} all
		end

	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

	ANY_VALIDATOR
		redefine
			ready_to_validate
		end

	DT_CONVERTIBLE

feature -- Initialisation

	make_dt (make_args: ARRAY[ANY])
			-- make in a safe way for DT building purposes
		local
			a: BMM_SINGLE_PROPERTY
			b: BMM_CONTAINER_PROPERTY
			c: BMM_SINGLE_PROPERTY_OPEN
			d: BMM_GENERIC_PROPERTY
		do
			reset
			state := State_created
			create primitive_types.make (0)
			create class_definitions.make (0)
			create packages.make (0)
			create includes.make (0)
			create models.make (0)
			create includes_to_process.make(0)
			includes_to_process.compare_objects
		end

feature -- Definitions

	State_created: INTEGER = 1

	State_loaded: INTEGER = 2

	State_includes_processed: INTEGER = 3

	State_ready_to_validate: INTEGER = 4

	substitutions: attached HASH_TABLE [STRING, STRING]
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

feature -- Identification (Attributes from schema)

	model_publisher: STRING
			-- publisher of model expressed in the schema
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	schema_name: STRING
			-- name of model expressed in schema; a 'schema' usually contains all of the packages of one 'model' of a publisher.
			-- A publisher with more than one model can have multiple schemas.
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	model_release: STRING
			-- release of model expressed in the schema
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	schema_id: STRING
			-- derived name of schema, based on model publisher, model name, model release
		do
			Result := create_schema_id (model_publisher, schema_name, model_release)
		end

feature -- Schema documentation (Attributes from schema)

	schema_revision: STRING
			-- revision of schema
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	schema_lifecycle_state: STRING
			-- lifecycle state of schema
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	schema_description: STRING
			-- description of schema
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

feature -- Access (Attributes from schema)

	includes: HASH_TABLE [BMM_INCLUDE_SPEC, STRING]
			-- inclusion list, in the form of a hash of individual include specifications,
			-- each of which at least specifies the id of another schema, and may specify
			-- a namespace via which types from the included schemas are known in this schema
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	packages: HASH_TABLE [BMM_PACKAGE_DEFINITION, STRING]
			-- hierarchical package structure defined in specifications
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	models: HASH_TABLE [ARRAYED_LIST [STRING], STRING]
			-- semantic model list; equivalent to a list of models included in schema
			-- top-level packages are models on which archteypes are based, and their names correspond to the
			-- second section of the 3-part archetype RM entity identifer, e.g. "EHR" in "openEHR-EHR"
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	primitive_types: HASH_TABLE [BMM_CLASS_DEFINITION, STRING]
			-- types like Integer, Boolean etc
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	class_definitions: HASH_TABLE [BMM_CLASS_DEFINITION, STRING]
			-- constructed classes
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

feature -- Access (Attributes from schema load post-processing)

	canonical_packages: HASH_TABLE [BMM_PACKAGE_DEFINITION, STRING]
			-- package structure in which all top-level qualified package names like xx.yy.zz have been
			-- expanded out to a hierarchy of BMM_PACKAGE_DEFINITION objects

feature -- Access

	state: INTEGER
			-- state machine state for this schema

	any_class_definition: attached BMM_CLASS_DEFINITION
			-- retrieve the class definition corresponding to the top `Any' class
		do
			Result := primitive_types.item (any_type)
		end

	package_definition (a_qualified_pkg_name: attached STRING): attached BMM_PACKAGE_DEFINITION
			-- retrieve the pacakge definition corresponding to `a_qualified_pkg_name'
		require
			Package_name_valid: has_package_definition (a_qualified_pkg_name)
		local
			pkg_names: LIST[STRING]
			pkg_csr: HASH_TABLE [BMM_PACKAGE_DEFINITION, STRING]
		do
			pkg_names := a_qualified_pkg_name.split (package_name_delimiter)
			pkg_csr := canonical_packages
			from pkg_names.start until pkg_names.islast loop
				pkg_csr := pkg_csr.item (pkg_names.item).packages
				pkg_names.forth
			end
			Result := pkg_csr.item (pkg_names.item)
		end

	class_definition (a_type_name: attached STRING): attached BMM_CLASS_DEFINITION
			-- retrieve the class definition corresponding to `a_type_name' (which contain a generic part)
			-- from either `primitive_types' or `classes'
		require
			Type_name_valid: has_class_definition (a_type_name)
		local
			a_class_name: STRING
		do
			a_class_name := type_to_class(a_type_name)
			if primitive_types.has (a_class_name) then
				Result := primitive_types.item (a_class_name)
			else
				Result := class_definitions.item (a_class_name)
			end
		end

	property_definition (a_type_name, a_prop_name: attached STRING): attached BMM_PROPERTY_DEFINITION
			-- retrieve the property definition for `a_prop_name' in flattened class corresponding to `a_type_name'
		require
			Type_name_valid: has_class_definition (a_type_name)
			Property_valid: has_property(a_type_name, a_prop_name)
		local
			class_def: BMM_CLASS_DEFINITION
		do
			class_def := class_definition(type_to_class(a_type_name))
			Result := class_def.flat_properties.item(a_prop_name)
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
			class_def := class_definition(type_to_class(a_type_name))
			Result := class_def.property_type(a_type_name, a_prop_name)
		end

	property_definition_at_path (a_type_name, a_property_path: attached STRING): BMM_PROPERTY_DEFINITION
			-- retrieve the property definition for `a_property_path' in flattened class corresponding to `a_type_name'
		require
			Type_name_valid: has_class_definition (a_type_name)
			Property_path_valid: has_property_path(a_type_name, a_property_path)
		local
			an_og_path: OG_PATH
			class_def: BMM_CLASS_DEFINITION
		do
			class_def := class_definition(type_to_class(a_type_name))
			create an_og_path.make_pure_from_string(a_property_path)
			an_og_path.start
			Result := class_def.property_definition_at_path(an_og_path)
		ensure
			Result_exists: Result /= Void
		end

	all_ancestor_classes_of (a_class_name: attached STRING): attached ARRAYED_LIST [STRING]
			-- return all ancestor types of `a_class_name' up to root class (usually 'ANY', 'Object' or something similar)
			-- does  not include current class. Returns empty list if none.
		require
			Type_valid: has_class_definition (a_class_name)
		do
			Result := class_definition (a_class_name).all_ancestors
		end

	includes_to_process: ARRAYED_LIST [STRING]
			-- list of includes to process during setup

feature -- Status Report

	has_package_definition (a_qualified_pkg_name: attached STRING): BOOLEAN
			-- Return True if there is a pacakge definition corresponding to `a_qualified_pkg_name',
			-- which may be a simple or qualified name
		local
			pkg_names: LIST[STRING]
			pkg_csr: HASH_TABLE [BMM_PACKAGE_DEFINITION, STRING]
		do
			pkg_names := a_qualified_pkg_name.split (package_name_delimiter)
			pkg_csr := canonical_packages
			from pkg_names.start until pkg_names.off or not pkg_csr.has (pkg_names.item) loop
				pkg_csr := pkg_csr.item (pkg_names.item).packages
				pkg_names.forth
			end
			Result := pkg_names.off
		end

	has_class_definition (a_type_name: attached STRING): BOOLEAN
			-- True if `a_type_name' has a class definition or is a primitive type in the model. Note that a_type_name
			-- could be a generic type string; only the root class is considered
		require
			Type_valid: not a_type_name.is_empty
		local
			a_class_name: STRING
		do
			a_class_name := type_to_class(a_type_name)
			Result := primitive_types.has (a_class_name) or class_definitions.has (a_class_name)
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
			-- True if `a_type_name' is valid with respect to `a_class_name'. Will always be true for
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
				type_strs := type_name_as_flattened_list(a_type_name)
				type_strs.compare_objects
				type_strs.start
				if type_strs.item.is_equal (a_class_def.name) or class_definitions.item (type_strs.item).has_ancestor(a_class_def.name)  then
					from
						type_strs.forth
						a_class_def.generic_parameter_defs.start
					until
						type_strs.off or not has_class_definition (type_strs.item) or
							(a_class_def.generic_parameter_defs.item_for_iteration.is_constrained and then not
							class_definitions.item (type_strs.item).has_ancestor (a_class_def.generic_parameter_defs.item_for_iteration.conforms_to_type_def.name))
					loop
						type_strs.forth
						a_class_def.generic_parameter_defs.forth
					end
					Result := type_strs.off
				end
			elseif not a_class_def.is_generic and not is_gen_type then
				Result := a_type_name.is_equal (a_class_def.name)
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
				Result := type_conforms_to (a_property_type_name, property_definition (a_type_name, a_property_name).type_def.as_flattened_type_string)
			end
		end

	type_conforms_to (type_1, type_2: attached STRING): BOOLEAN
			-- check conformance of type 1 to type 2
		local
			tlist1, tlist2: ARRAYED_LIST[STRING]
		do
			tlist1 := type_name_as_flattened_list (type_1)
			tlist2 := type_name_as_flattened_list (type_2)
			Result := True
			from
				tlist1.start
				tlist2.start
			until
				tlist1.off or tlist2.off or not Result or not has_class_definition (tlist1.item) or not has_class_definition (tlist2.item)
			loop
				Result := Result and
					(tlist1.item.is_equal (tlist2.item) or else
					class_definition (tlist1.item).has_ancestor(tlist2.item))
				tlist1.forth
				tlist2.forth
			end
		end

feature -- Commands

	dt_finalise
			-- steps after load of this model, but before 'includes' processing
			-- 1. convert primitive type names of the form 'Integer' to all uppercase
			-- 2. canonicalise the package structure so tha the top-level qualified package
			--    names like 'rm.data_types.quantity' are turned into true hierarchical
			--	  structure in order to aid merging of package structures of multiple schemas
		require
			state = State_created
		local
			keys: ARRAY [STRING]
			i: INTEGER
			top_pkg, child_pkg: BMM_PACKAGE_DEFINITION
			child_pkg_names: LIST [STRING]
			pkg_csr: like packages
		do
			-- Do name case conversion on classes
			-- has to be done in two gos, because changing keys messs with the table structure
			-- if done in one pass			
			from primitive_types.start until primitive_types.off loop
				primitive_types.item_for_iteration.name.to_upper
				primitive_types.forth
			end
			keys := primitive_types.current_keys
			from i := 1 until i > keys.count loop
				primitive_types.replace_key (keys.item(i).as_upper, keys.item(i))
				i := i + 1
			end
			if includes.is_empty then
				state := State_includes_processed
			else
				from includes.start until includes.off loop
					includes_to_process.extend (includes.item_for_iteration.id)
					includes.forth
				end
				state := State_loaded
			end

			-- top-level package canonicalisation: the result is that in each BMM_SCHEMA, the
			-- attribute `canonical_packages' contains the mergeable structure
			create canonical_packages.make (0)
			from packages.start until packages.off loop
				top_pkg := packages.item_for_iteration
				if top_pkg.name.has (package_name_delimiter) then

					-- iterate over qualified name, inserting new packages for each of these names.
					-- E.g. 'rm.composition.content' causes three new packages 'rm', 'composition'
					-- and 'content' to be created and linked, with the 'rm' one being put in
					-- `canonical_packages'
					pkg_csr := canonical_packages
					child_pkg_names := top_pkg.name.split (Package_name_delimiter)
					from child_pkg_names.start until child_pkg_names.off loop
						if not pkg_csr.has (child_pkg_names.item) then
							create child_pkg.make (child_pkg_names.item)
							pkg_csr.put (child_pkg, child_pkg_names.item)
						else
							child_pkg := pkg_csr.item (child_pkg_names.item)
						end
						pkg_csr := child_pkg.packages
						child_pkg_names.forth
					end

					-- now we need to make the final package in the chain created above contain
					-- the same references as the original package with the qualified name
					child_pkg.make_from_other (top_pkg)

				else
					 -- just create a reference in the canonical packages; note that this precludes
					 -- the situation where top-level packages like 'rm' and 'rm.composition.content'
					 -- co-exist - this would be bad structure
					canonical_packages.put (top_pkg, top_pkg.name)
				end
				packages.forth
			end
		ensure
			state = State_loaded or state = State_includes_processed
		end

	finalise_schema
			-- steps after 'includes' processing, which require all class definitions to be in place
		require
			state = State_includes_processed
		do
			finalise_classes (primitive_types)
			finalise_classes (class_definitions)
			state := State_ready_to_validate
		ensure
			state = State_ready_to_validate
		end

	validate
			-- do some basic validation:
			-- check that all properties in every class have a type set and that the type is defined somewhere else in the schema,
			-- i.e. this checks that the schema is at least completely specified
		local
			class_def: BMM_CLASS_DEFINITION
		do
			if passed then
				from primitive_types.start until primitive_types.off loop
					class_def := primitive_types.item_for_iteration
					from class_def.properties.start until class_def.properties.off loop
						if class_def.properties.item_for_iteration.type_def = Void then
							passed := False
							add_error("BMM_PTV", <<schema_id, class_def.name, class_def.properties.item_for_iteration.name>>)
						end
						class_def.properties.forth
					end
					primitive_types.forth
				end
				from class_definitions.start until class_definitions.off loop
					class_def := class_definitions.item_for_iteration
					from class_def.properties.start until class_def.properties.off loop
						if class_def.properties.item_for_iteration.type_def = Void then
							passed := False
							add_error("BMM_PTV", <<schema_id, class_def.name, class_def.properties.item_for_iteration.name>>)
						end
						class_def.properties.forth
					end
					class_definitions.forth
				end
			end

			if passed then
				from packages.start until packages.off loop
					validate_package (packages.item_for_iteration)
					packages.forth
				end
			end

			if passed then
				add_info ("model_access_i1", << schema_id, primitive_types.count.out, class_definitions.count.out >>)
			end
		end

	validate_package (a_pkg: attached BMM_PACKAGE_DEFINITION)
		do
			if a_pkg.has_classes then
				from a_pkg.classes.start until a_pkg.classes.off loop
					if not has_class_definition (a_pkg.classes.item) then
						passed := False
						add_error ("BMM_PKGCL", <<schema_id, a_pkg.classes.item, a_pkg.name>>)
					end
					a_pkg.classes.forth
				end
			end
			if a_pkg.has_packages then
				from a_pkg.packages.start until a_pkg.packages.off loop
					validate_package (a_pkg.packages.item_for_iteration)
					a_pkg.packages.forth
				end
			end
		end

	ready_to_validate: BOOLEAN
		do
			Result := precursor and state = State_ready_to_validate
		end

	merge_included_schema (other: attached BMM_SCHEMA)
			-- merge in class and package definitions from `other', except where the current schema already has
			-- a definition for the given type or package
		require
			includes_to_process.has (other.schema_id)
		do
			-- primitive types
			from other.primitive_types.start until other.primitive_types.after loop
				-- note that `put' only puts the class defintion from the included schema only if the current one does not already
				-- have a definition for that class name. Since higher-level schemas are processed first, any over-rides they
				-- contain will stay, with the classes being overridden being ignored - which is the desired behaviour.
				primitive_types.put (other.primitive_types.item_for_iteration.deep_twin, other.primitive_types.key_for_iteration)
				other.primitive_types.forth
			end

			-- classes
			from other.class_definitions.start until other.class_definitions.after loop
				-- note that `put' only puts the class defintion from the included schema only if the current one does not already
				-- have a definition for that class name. Since higher-level schemas are processed first, any over-rides they
				-- contain will stay, with the classes being overridden being ignored - which is the desired behaviour.
				class_definitions.put (other.class_definitions.item_for_iteration.deep_twin, other.class_definitions.key_for_iteration)
				other.class_definitions.forth
			end

			-- packages
			-- merge from other.canonical_packages, because that's where the proper hierarchically structured packages are
			from other.canonical_packages.start until other.canonical_packages.off loop
				if canonical_packages.has (other.canonical_packages.key_for_iteration) then
					canonical_packages.item (other.canonical_packages.key_for_iteration).merge (other.canonical_packages.item_for_iteration)
				else
					canonical_packages.put (other.canonical_packages.item_for_iteration, other.canonical_packages.key_for_iteration)
				end
				other.canonical_packages.forth
			end

			-- now finalise packages build, creating `all_classes' property at each level
			from canonical_packages.start until canonical_packages.off loop
				canonical_packages.item_for_iteration.finalise_build (Current, errors)
				canonical_packages.forth
			end

			-- remove other schema from remaining list of included schemas to process
			includes_to_process.prune_all (other.schema_id)
			if includes_to_process.is_empty then
				state := State_includes_processed
			end

			-- semantic models
			from other.models.start until other.models.off loop
				models.put (other.models.item_for_iteration, other.models.key_for_iteration)
				other.models.forth
			end
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: ARRAYED_LIST[STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		do
		end

feature {NONE} -- Implementation

	type_to_class (a_type_name: attached STRING): STRING
			-- convert a type name which might have a generic part to a simple class name
		require
			Type_valid: not a_type_name.is_empty
		local
			gen_pos: INTEGER
		do
			gen_pos := a_type_name.substring_index (generic_left_delim.out, 1)
			if gen_pos > 0 then
				Result := a_type_name.substring (1, gen_pos-1)
				Result.right_adjust
				Result.to_upper
			else
				Result := a_type_name.as_upper
			end
		end

	finalise_classes (class_list: attached HASH_TABLE [BMM_CLASS_DEFINITION, STRING])
			-- build `immediate_descendants' and `all_ancestors' properties for each class in `class_list'
		require
			state = State_includes_processed
		local
			imm_ancs: ARRAYED_LIST [BMM_CLASS_DEFINITION]
			all_ancs: ARRAYED_LIST [STRING]
		do
			from class_list.start until class_list.off loop
				class_list.item_for_iteration.finalise_build (Current, errors)

				-- populate class's immediate_descendants and all_ancestors lists
				imm_ancs := class_list.item_for_iteration.ancestor_defs
				all_ancs := class_list.item_for_iteration.all_ancestors
				from imm_ancs.start until imm_ancs.off loop
					-- add this class to the immediate ancestor's `immediate_descendant' list
					imm_ancs.item.add_immediate_descendant (class_list.item_for_iteration)

					-- add immediate ancestors to the `all_ancestors' list of this class
					if not all_ancs.has (imm_ancs.item.name) then
						all_ancs.extend (imm_ancs.item.name)
					end

					-- add non-immediate ancestors to the `all_ancestors' list of this class
					from imm_ancs.item.ancestor_defs.start until imm_ancs.item.ancestor_defs.off loop
						if not all_ancs.has (imm_ancs.item.ancestor_defs.item.name) then
							all_ancs.extend (imm_ancs.item.ancestor_defs.item.name)
						end
						imm_ancs.item.ancestor_defs.forth
					end
					imm_ancs.forth
				end
				class_list.forth
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
