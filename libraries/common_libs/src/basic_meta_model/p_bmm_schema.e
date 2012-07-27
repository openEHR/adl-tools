note
	component:   "openEHR re-usable library"
	description: "dADL Persistent form of BMM_SCHEMA"
	keywords:    "Basic meta-model"

	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class P_BMM_SCHEMA

inherit
	BMM_SCHEMA_CORE

	P_BMM_PACKAGE_CONTAINER
		rename
			make as make_package_container
		end

	DT_CONVERTIBLE
		redefine
			finalise_dt
		end

	ANY_VALIDATOR
		redefine
			ready_to_validate
		end

feature -- Definitions

	State_created: INTEGER = 1

	State_validated_created: INTEGER = 2

	State_includes_pending: INTEGER = 3

	State_includes_processed: INTEGER = 4

feature -- Initialisation

	make_dt (make_args: ARRAY[ANY])
			-- make in a safe way for DT building purposes
		do
			reset
			make_core
			create primitive_types.make (0)
			create class_definitions.make (0)
			create packages.make (0)
			create includes.make (0)
			create archetype_rm_closure_packages.make (0)
			archetype_rm_closure_packages.compare_objects
			create includes_to_process.make (0)
			includes_to_process.compare_objects
			create schema_error_table.make (0)
			state := State_created
		end

feature -- Access (attributes from schema)

	bmm_version: STRING
			-- version of BMM model, enabling schema evolution reasoning
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	includes: HASH_TABLE [BMM_INCLUDE_SPEC, STRING]
			-- inclusion list, in the form of a hash of individual include specifications,
			-- each of which at least specifies the id of another schema, and may specify
			-- a namespace via which types from the included schemas are known in this schema
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	primitive_types: HASH_TABLE [P_BMM_CLASS_DEFINITION, STRING]
			-- types like Integer, Boolean etc
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	class_definitions: HASH_TABLE [P_BMM_CLASS_DEFINITION, STRING]
			-- constructed classes
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

feature -- Access (Attributes from schema load post-processing)

	state: INTEGER
			-- state machine state for this schema

	canonical_packages: HASH_TABLE [P_BMM_PACKAGE_DEFINITION, STRING]
			-- package structure in which all top-level qualified package names like xx.yy.zz have been
			-- expanded out to a hierarchy of BMM_PACKAGE_DEFINITION objects

	bmm_schema: BMM_SCHEMA

	includes_to_process: ARRAYED_LIST [STRING]
			-- list of includes to process during setup

	bmm_version_from_schema: BOOLEAN
			-- True if the bmm_version attribute was actually set in the schema; False means
			-- the `assumed_bmm_version' value is used instead. This flag enables the situation to
			-- be reported properly during schema validation.

	ancestors_index: HASH_TABLE [ARRAYED_SET [STRING], STRING]
			-- index of all ancestors of each class

feature -- Access

	class_definition (a_class_name: attached STRING): P_BMM_CLASS_DEFINITION
			-- class definition corresponding to `a_class_name'
		require
			Class_valid: has_class_definition (a_class_name)
		local
			a_key: STRING
		do
			a_key := a_class_name.as_upper
			if primitive_types.has (a_key) then
				Result := primitive_types.item (a_key)
			else
				Result := class_definitions.item (a_key)
			end
		end

feature -- Status Report

	has_class_definition (a_class_name: attached STRING): BOOLEAN
			-- True if `a_class_name' has a class definition or is a primitive type in the model. Note that a_type_name
			-- could be a generic type string; only the root class is considered
		require
			Class_valid: not a_class_name.is_empty
		local
			a_key: STRING
		do
			a_key := a_class_name.as_upper
			Result := primitive_types.has (a_key) or class_definitions.has (a_key)
		end

	has_canonical_package_path (a_path: attached STRING): BOOLEAN
			-- True if there is a package at the path `a_path' under this package
		local
			pkg_names: LIST [STRING]
			pkg_csr: P_BMM_PACKAGE_CONTAINER
		do
			pkg_names := a_path.as_upper.split (Package_name_delimiter)
			pkg_names.start
			if canonical_packages.has (pkg_names.item) then
				pkg_csr := canonical_packages.item (pkg_names.item)
				from pkg_names.forth until pkg_names.off or not pkg_csr.packages.has (pkg_names.item) loop
					pkg_csr := pkg_csr.packages.item (pkg_names.item)
					pkg_names.forth
				end
				Result := pkg_names.off
			end
		end

feature -- Comparison

	property_conforms_to (a_class_def: attached P_BMM_CLASS_DEFINITION; a_child_prop_def, a_parent_prop_def: attached P_BMM_PROPERTY_DEFINITION): BOOLEAN
			-- True if this property conforms to `other' such that it could be used to override it; same types are not considered conforming
		do
			-- check basics first
			if attached {P_BMM_SINGLE_PROPERTY} a_parent_prop_def and then a_parent_prop_def.type.same_string (any_type) then
				Result := True
			elseif a_child_prop_def.name.same_string (a_parent_prop_def.name) then -- same names
				if attached {P_BMM_SINGLE_PROPERTY} a_child_prop_def and attached {P_BMM_SINGLE_PROPERTY} a_parent_prop_def then
					Result := type_strictly_conforms_to (a_child_prop_def.type, a_parent_prop_def.type)

				elseif attached {P_BMM_SINGLE_PROPERTY_OPEN} a_parent_prop_def as a_parent_single_prop_def_open then
					if attached {P_BMM_SINGLE_PROPERTY_OPEN} a_child_prop_def as a_child_single_prop_def_open then
						Result := False
					elseif attached {P_BMM_SINGLE_PROPERTY} a_child_prop_def as a_child_single_prop_def then
						Result := True
						-- FIXME: proper type conformance to constraining generic type needs to be checked here
					end

				elseif attached {P_BMM_CONTAINER_PROPERTY} a_child_prop_def as a_child_cont_prop_def and attached {P_BMM_CONTAINER_PROPERTY} a_parent_prop_def as a_parent_cont_prop_def then
					Result := type_strictly_conforms_to (a_child_cont_prop_def.type_def.as_type_string, a_parent_cont_prop_def.type_def.as_type_string)

				elseif attached {P_BMM_GENERIC_PROPERTY} a_child_prop_def as a_child_gen_prop_def and attached {P_BMM_GENERIC_PROPERTY} a_parent_prop_def as a_parent_gen_prop_def then
					Result := type_strictly_conforms_to (a_child_gen_prop_def.type_def.as_type_string, a_parent_gen_prop_def.type_def.as_type_string)
				end
			end
		end

	type_conforms_to (type_1, type_2: attached STRING): BOOLEAN
			-- check conformance of type 1 to type 2 for substitutability; each type may be generic
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
				Result := Result and (tlist1.item.is_equal (tlist2.item) or else ancestors_index.item (tlist1.item).has (tlist2.item))
				tlist1.forth
				tlist2.forth
			end
		end

	type_strictly_conforms_to (type_1, type_2: attached STRING): BOOLEAN
			-- check conformance of type 1 to type 2 for redefinition; each type may be generic
		do
			Result := not type_same_as (type_1, type_2) and then type_conforms_to (type_1, type_2)
		end

	type_same_as (type_1, type_2: attached STRING): BOOLEAN
			-- check if type 1 and type 2 are identical; each type may be generic
		do
			Result := type_name_as_flat_list (type_1).is_equal (type_name_as_flat_list (type_2))
		end

feature {SCHEMA_DESCRIPTOR, REFERENCE_MODEL_ACCESS} -- Schema Processing

	validate_created
			-- do some basic validation post initial creation
			-- 1. check that package structure is regular:
			--    a) only top-level packages can have qualified names
			--    b) no top-level package name can be a direct parent or child of another
			--		 (child package must be declared under the parent)
			-- 2. check that all classes are mentioned in the package structure
			-- 3. check that all models refer to valid packages
		require
			state = State_created
		local
			pkg_names: ARRAY [STRING]
		do
			-- check top-level names - package names cannot contain each other and be siblings
			pkg_names := packages.current_keys
			across packages as packages_csr loop
				if pkg_names.there_exists (
					agent (nm, pkg_name: STRING): BOOLEAN
						do
							Result := not pkg_name.same_string (nm) and then
								(pkg_name.starts_with (nm) or nm.starts_with (pkg_name))
						end (?, packages_csr.item.name)
					)
				then
					add_error ("BMM_PKGTL", <<schema_id>>)
				end
			end

			-- check no duplicate properties
			do_all_classes (
				agent (a_class_def: P_BMM_CLASS_DEFINITION)
					local
						prop_list: ARRAYED_SET [STRING]
					do
						create prop_list.make (0)
						prop_list.compare_objects
						across a_class_def.properties as props_csr loop
							if prop_list.has (props_csr.item.name) then
								add_error ("BMM_PRDUP", <<schema_id, a_class_def.name, props_csr.item.name>>)
							else
								prop_list.extend (props_csr.item.name)
							end
						end
					end
			)

			-- validate package & class structure
			do_recursive_packages (
				agent (a_pkg: P_BMM_PACKAGE_DEFINITION)
					do
						-- check for lower-down qualified names
						if not packages.has_item (a_pkg) and a_pkg.name.has (package_name_delimiter) then
							add_error("BMM_PKGQN", <<schema_id, a_pkg.name>>)
						end

						-- check if all classes mentioned in each package exist in the local schema
						from a_pkg.classes.start until a_pkg.classes.off loop
							if not has_class_definition (a_pkg.classes.item) then
								add_error ("BMM_PKGCL", <<schema_id, a_pkg.classes.item, a_pkg.name>>)
							end
							a_pkg.classes.forth
						end
					end
			)

			if passed then
				add_info ("model_access_i1", << schema_id, primitive_types.count.out, class_definitions.count.out >>)
				state := State_validated_created
			end
		end

	load_finalise
			-- Finalisation work:
			-- 1. convert packages to canonical form, i.e. full hierarchy with no packages with names like aa.bb.cc
			-- 2. set up include processing list
		require
			state = State_validated_created
		local
			child_pkg: P_BMM_PACKAGE_DEFINITION
			child_pkg_names: LIST [STRING]
			pkg_csr: like packages
			child_pkg_key: STRING
		do
			-- top-level package canonicalisation: the result is that in each P_BMM_SCHEMA, the
			-- attribute `canonical_packages' contains the mergeable structure
			create canonical_packages.make(0)
			across packages as top_packages_csr loop
				if top_packages_csr.item.name.has (package_name_delimiter) then
					-- iterate over qualified name, inserting new packages for each of these names.
					-- E.g. 'rm.composition.content' causes three new packages 'rm', 'composition'
					-- and 'content' to be created and linked, with the 'rm' one being put in
					-- `canonical_packages'
					pkg_csr := canonical_packages
					child_pkg_names := top_packages_csr.item.name.split (Package_name_delimiter)
					across child_pkg_names as child_pkg_names_csr loop
						child_pkg_key := child_pkg_names_csr.item.as_upper
						if not pkg_csr.has (child_pkg_key) then
							create child_pkg.make (child_pkg_names_csr.item)
							pkg_csr.put (child_pkg, child_pkg_key)
						else
							child_pkg := pkg_csr.item (child_pkg_key)
						end
						pkg_csr := child_pkg.packages
					end

					-- now we need to make the final package in the chain created above contain
					-- the same references as the original package with the qualified name
					child_pkg.make_from_other (top_packages_csr.item)
				else
					-- just create a reference in the canonical packages; note that this precludes
					-- the situation where top-level packages like 'rm' and 'rm.composition.content'
					-- co-exist - this would be bad structure
					canonical_packages.put (top_packages_csr.item, top_packages_csr.item.name.as_upper)
				end
			end

			-- set up the includes processing list
			if includes.is_empty then
				state := State_includes_processed
			else
				from includes.start until includes.off loop
					includes_to_process.extend (includes.item_for_iteration.id)
					includes.forth
				end
				state := State_includes_pending
			end
		end

	merge (other: attached P_BMM_SCHEMA)
			-- merge in class and package definitions from `other', except where the current schema already has
			-- a definition for the given type or package
		require
			Loaded: state = State_includes_pending
			Other_valid: includes_to_process.has (other.schema_id)
		do
			-- archetype parent class: only merge if nothing already in the higher-level schema
			if attached other.archetype_parent_class and not attached archetype_parent_class then
				archetype_parent_class := other.archetype_parent_class
			end
			-- archetype data value parent class: only merge if nothing already in the higher-level schema
			if attached other.archetype_data_value_parent_class and not attached archetype_data_value_parent_class then
				archetype_data_value_parent_class := other.archetype_data_value_parent_class
			end
			-- archetype closures
			archetype_rm_closure_packages.merge (other.archetype_rm_closure_packages)


			-- primitive types
			across other.primitive_types as other_prim_types_csr loop
				-- note that `put' only puts the class defintion from the included schema only if the current one does not already
				-- have a definition for that class name. Since higher-level schemas are processed first, any over-rides they
				-- contain will stay, with the classes being overridden being ignored - which is the desired behaviour.
				if primitive_types.has (other_prim_types_csr.key) then
					if primitive_types.item (other_prim_types_csr.key).uid /= other_prim_types_csr.item.uid then
						primitive_types.item (other_prim_types_csr.key).set_is_override
					end
				else
					primitive_types.put (other_prim_types_csr.item.deep_twin, other_prim_types_csr.key)
				end
			end

			-- classes
			across other.class_definitions as other_classes_csr loop
				-- note that `put' only puts the class definition from the included schema only if the current one does not already
				-- have a definition for that class name. Since higher-level schemas are processed first, any over-rides they
				-- contain will stay, with the classes being overridden being ignored - which is the desired behaviour.
				if class_definitions.has (other_classes_csr.key) then
					if class_definitions.item (other_classes_csr.key).uid /= other_classes_csr.item.uid then
						class_definitions.item (other_classes_csr.key).set_is_override
					end
				else
					class_definitions.put (other_classes_csr.item.deep_twin, other_classes_csr.key)
				end
			end

			-- compute ancestors index:
			-- pass 1: add class direct ancestors
			create ancestors_index.make(0)
			do_all_classes (
				agent (a_class_def: P_BMM_CLASS_DEFINITION)
					local
						anc_list: ARRAYED_SET [STRING]
					do
						create anc_list.make (0)
						anc_list.compare_objects
						anc_list.merge (a_class_def.ancestors)
						ancestors_index.put (anc_list, a_class_def.name.as_upper)
					end
			)
			-- pass 2: add indirect ancestors
			do_all_classes (
				agent (a_class_def: P_BMM_CLASS_DEFINITION)
					local
						anc_copy: ARRAYED_SET [STRING]
					do
						anc_copy := ancestors_index.item (a_class_def.name.as_upper).deep_twin -- create a copy for iteration purposes
						across anc_copy as anc_copy_csr loop
							ancestors_index.item (a_class_def.name.as_upper).merge (ancestors_index.item (anc_copy_csr.item.as_upper))
						end
					end
			)

			-- packages
			-- merge from other.packages, because that's where the proper hierarchically structured packages are
			across other.canonical_packages as other_pkgs_csr loop
				if canonical_packages.has (other_pkgs_csr.key) then
					canonical_packages.item (other_pkgs_csr.key).merge (other_pkgs_csr.item)
				else
					canonical_packages.put (other_pkgs_csr.item, other_pkgs_csr.key)
				end
			end

			-- remove other schema from remaining list of included schemas to process
			includes_to_process.prune_all (other.schema_id)
			if includes_to_process.is_empty then
				state := State_includes_processed
			end
		end

	ready_to_validate: BOOLEAN
		do
			Result := state = State_includes_processed
		end

	validate
			-- main validation prior to generation of BMM_SCHEMA; access to `all_schemas' allows errors to be allocated to
			-- correct schema
		local
			package_classes: HASH_TABLE [STRING, STRING]
		do
			-- check archetype parent class in list of class names
			if attached archetype_parent_class and then not has_class_definition (archetype_parent_class) then
				add_error ("BMM_ARPAR", <<schema_id, archetype_parent_class>>)
			end

			-- check that all models refer to declared packages
			across archetype_rm_closure_packages as pkgs_csr loop
				if not has_canonical_package_path (pkgs_csr.item) then
					add_error ("BMM_MDLPK", <<schema_id, pkgs_csr.item>>)
				end
			end

			-- check that no duplicate classes are found in packages
			create package_classes.make (0)
			across canonical_packages as pkgs_csr loop
				pkgs_csr.item.do_recursive_classes (
					agent (a_pkg: P_BMM_PACKAGE_DEFINITION; a_class_name: STRING; class_list: HASH_TABLE [STRING, STRING])
						do
							if class_list.has (a_class_name) then
								add_error ("BMM_CLDUP", <<schema_id, a_class_name, a_pkg.name, class_list.item (a_class_name)>>)
							else
								class_list.put (a_pkg.name, a_class_name)
							end
						end (?, ?, package_classes)
				)
			end

			-- for all classes, validate all properties
			do_all_classes (agent (a_class_def: P_BMM_CLASS_DEFINITION) do validate_class (a_class_def) end)
		end

	validate_class (a_class_def: P_BMM_CLASS_DEFINITION)
		do
			-- check that all ancestors exist
			across a_class_def.ancestors as ancs_csr loop
				if not has_class_definition (ancs_csr.item) then
					add_validity_error (a_class_def.source_schema_id, "BMM_ANC", <<a_class_def.source_schema_id, a_class_def.name, ancs_csr.item>>)
				end
			end

			-- check that all generic parameter.conforms_to_type exist exists
			if a_class_def.is_generic then
				across a_class_def.generic_parameter_defs as gen_param_defs_csr loop
					if attached gen_param_defs_csr.item.conforms_to_type and then not has_class_definition (gen_param_defs_csr.item.conforms_to_type) then
						add_validity_error (a_class_def.source_schema_id, "BMM_GPCT", <<a_class_def.source_schema_id, a_class_def.name, gen_param_defs_csr.item.name, gen_param_defs_csr.item.conforms_to_type>>)
					end
				end
			end

			-- validate the properties
			across a_class_def.properties as props_csr loop
				validate_property (a_class_def, props_csr.item)
			end
		end

	validate_property (a_class_def: P_BMM_CLASS_DEFINITION; a_prop_def: P_BMM_PROPERTY_DEFINITION)
		local
			gen_parm_type_name: STRING
		do
			-- first check if any property replicates a property from a parent class
			across a_class_def.ancestors as ancs_csr loop
				if class_definition (ancs_csr.item).properties.has (a_prop_def.name) and then not
					property_conforms_to (a_class_def, a_prop_def, class_definition (ancs_csr.item).properties.item (a_prop_def.name))
				then
					add_validity_error (a_class_def.source_schema_id, "BMM_PRNCF", <<a_class_def.source_schema_id, a_class_def.name, a_prop_def.name, ancs_csr.item>>)
				end
			end

			if attached {P_BMM_SINGLE_PROPERTY} a_prop_def as a_single_prop_def then
				if not has_class_definition (a_single_prop_def.type) then
					add_validity_error (a_class_def.source_schema_id, "BMM_SPT", <<a_class_def.source_schema_id, a_class_def.name, a_single_prop_def.name, a_single_prop_def.type>>)
				end
			elseif attached {P_BMM_SINGLE_PROPERTY_OPEN} a_prop_def as a_single_prop_def_open then
				if not a_class_def.generic_parameter_defs.has (a_single_prop_def_open.type) then
					add_validity_error (a_class_def.source_schema_id, "BMM_SPOT", <<a_class_def.source_schema_id, a_class_def.name, a_single_prop_def_open.name, a_single_prop_def_open.type>>)
				end

			elseif attached {P_BMM_CONTAINER_PROPERTY} a_prop_def as a_cont_prop_def then
				if not attached a_cont_prop_def.type_def then
					add_validity_error (a_class_def.source_schema_id, "BMM_CPT", <<a_class_def.source_schema_id, a_class_def.name, a_cont_prop_def.name>>)
				elseif not attached a_cont_prop_def.cardinality then
					add_validity_warning (a_class_def.source_schema_id, "BMM_CPTNC", <<a_class_def.source_schema_id, a_class_def.name, a_cont_prop_def.name>>)
				elseif not has_class_definition (a_cont_prop_def.type_def.type) then
					add_validity_error (a_class_def.source_schema_id, "BMM_CPTV", <<a_class_def.source_schema_id, a_class_def.name, a_cont_prop_def.name, a_cont_prop_def.type_def.type>>)
				elseif not has_class_definition (a_cont_prop_def.type_def.container_type) then
					add_validity_error (a_class_def.source_schema_id, "BMM_CPCT", <<a_class_def.source_schema_id, a_class_def.name, a_cont_prop_def.name, a_cont_prop_def.type_def.container_type>>)
				end

			elseif attached {P_BMM_GENERIC_PROPERTY} a_prop_def as a_gen_prop_def then
				if not attached a_gen_prop_def.type_def then
					add_validity_error (a_class_def.source_schema_id, "BMM_GPT", <<a_class_def.source_schema_id, a_class_def.name, a_gen_prop_def.name>>)
				elseif not has_class_definition (a_gen_prop_def.type_def.root_type) then
					add_validity_error (a_class_def.source_schema_id, "BMM_GPRT", <<a_class_def.source_schema_id, a_class_def.name, a_gen_prop_def.name, a_gen_prop_def.type_def.root_type>>)
				else
					from a_gen_prop_def.type_def.generic_parameters.start until a_gen_prop_def.type_def.generic_parameters.off loop
						gen_parm_type_name := a_gen_prop_def.type_def.generic_parameters.item
						if not has_class_definition (gen_parm_type_name) then
							if a_class_def.is_generic then -- it might be a formal parameter, to be matched against those of enclosing class
								if not a_class_def.generic_parameter_defs.has (gen_parm_type_name) then
									add_validity_error (a_class_def.source_schema_id, "BMM_GPGPU", <<a_class_def.source_schema_id, a_class_def.name, a_gen_prop_def.name, a_class_def.name, gen_parm_type_name>>)
								end
							else
								add_validity_error (a_class_def.source_schema_id, "BMM_GPGPT", <<a_class_def.source_schema_id, a_class_def.name, a_gen_prop_def.name, gen_parm_type_name>>)
							end
						end
						a_gen_prop_def.type_def.generic_parameters.forth
					end
				end
			end
		end

feature -- Factory

	create_bmm_schema
			-- generate a BMM_SCHEMA object
		require
			state = State_includes_processed
		do
			--------- PASS 1 ----------
			create bmm_schema.make (rm_publisher, schema_name, rm_release)
			bmm_schema.set_schema_author (schema_author)
			if not schema_contributors.is_empty then
				bmm_schema.set_schema_contributors (schema_contributors)
			end
			bmm_schema.set_schema_lifecycle_state (schema_lifecycle_state)
			bmm_schema.set_schema_revision (schema_revision)
			bmm_schema.set_schema_description (schema_description)

			-- packages - add package structure only, no classes yet
			across canonical_packages as pkgs_csr loop
				pkgs_csr.item.create_bmm_package_definition
				bmm_schema.add_package (pkgs_csr.item.bmm_package_definition)
			end

			-- now add classes
			across canonical_packages as pkgs_csr loop
				pkgs_csr.item.do_recursive_classes (agent add_bmm_schema_class_definition)
			end

			-- set the archetype root class
			if attached archetype_parent_class then
				bmm_schema.set_archetype_parent_class (archetype_parent_class)
			end
			-- set the archetype data value root class
			if attached archetype_data_value_parent_class then
				bmm_schema.set_archetype_data_value_parent_class (archetype_data_value_parent_class)
			end
			-- set the archetype data value root class
			if attached archetype_visualise_descendants_of then
				bmm_schema.set_archetype_visualise_descendants_of (archetype_visualise_descendants_of)
			end
			-- add RM closure packages - clone because merging will change the structure in the BMM_SCHEMA
			bmm_schema.set_archetype_rm_closure_packages (archetype_rm_closure_packages.deep_twin)

			--------- PASS 2 ----------
			-- populate BMM_CLASS_DEFINITION objects
			do_all_classes (agent (a_class_def: P_BMM_CLASS_DEFINITION) do a_class_def.populate_bmm_class_definition (bmm_schema) end)
		end

	add_bmm_schema_class_definition (a_pkg: P_BMM_PACKAGE_DEFINITION; a_class_name: STRING)
			-- create the BMM_CLASS_DEFINITION object, add it to the BMM_SCHEMA;
			-- set its source_schema_id; set its primitive_type flag; its BMM_SCHEMA link will also be set
		local
			bmm_class_def: BMM_CLASS_DEFINITION
		do
			class_definition (a_class_name).create_bmm_class_definition
			bmm_class_def := class_definition (a_class_name).bmm_class_definition
			if primitive_types.has (a_class_name.as_upper) then
				bmm_class_def.set_primitive_type
			end
			if class_definition (a_class_name).is_override then
				bmm_class_def.set_is_override
			end
			bmm_schema.add_class_definition (bmm_class_def, a_pkg.bmm_package_definition)
		end

feature {DT_OBJECT_CONVERTER} -- Persistence

	persistent_attributes: ARRAYED_LIST[STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		do
		end

	finalise_dt
			-- Finalisation work:
			-- 1. Do name case conversion on primitive classes
		local
			keys: ARRAY [STRING]
			i: INTEGER
		do
			-- set bmm_version if not found in schema
			if attached bmm_version then
				bmm_version_from_schema := True
			else
				bmm_version := Assumed_bmm_version
			end

			-- has to be done in two gos, because changing keys messs with the table structure
			-- if done in one pass			
			keys := primitive_types.current_keys
			from i := 1 until i > keys.count loop
				primitive_types.replace_key (keys.item(i).as_upper, keys.item(i))
				i := i + 1
			end

			-- set all packages keys to upper case
			correct_packages_keys

			-- assign unique ids to all class objects, to enable collision detection during merging
			do_all_classes (
				agent (a_class_def: P_BMM_CLASS_DEFINITION)
					do
						a_class_def.set_uid (uid_counter.item)
						uid_counter.put (uid_counter.item + 1)
						a_class_def.set_source_schema_id (schema_id)
					end
			)
		end

feature {REFERENCE_MODEL_ACCESS} -- Implementation

	schema_error_table: HASH_TABLE [ERROR_ACCUMULATOR, STRING]
			-- set of error accumulators for other schemas, keyed by schema id

feature {NONE} -- Implementation

	uid_counter: CELL [INTEGER]
		once
			create Result.put (1)
		end

	do_all_classes (action: PROCEDURE [ANY, TUPLE [P_BMM_CLASS_DEFINITION]])
			-- do some action to all primitive type and class objects
		do
			across primitive_types as prim_types_csr loop
				action.call ([prim_types_csr.item])
			end
			across class_definitions as class_defs_csr loop
				action.call ([class_defs_csr.item])
			end
		end

	add_validity_error (source_schema_id, a_key: STRING; args: ARRAY [STRING])
			-- append an error with key `a_key' and `args' array to the `errors' string to the
			-- error list for schema with `a_schema_id'
		do
			if source_schema_id.same_string (schema_id) then
				add_error (a_key, args)
			else
				if not schema_error_table.has (source_schema_id) then
					schema_error_table.put (create {ERROR_ACCUMULATOR}.make, source_schema_id)
				end
				schema_error_table.item (source_schema_id).add_error (a_key, args, "")
				add_error ("BMM_INCERR", <<schema_id, source_schema_id>>)
			end
		end

	add_validity_warning (source_schema_id, a_key: STRING; args: ARRAY [STRING])
			-- append a warning with key `a_key' and `args' array to the `errors' string to the
			-- error list for schema with `a_schema_id'
		do
			if source_schema_id.same_string (schema_id) then
				add_warning (a_key, args)
			else
				if not schema_error_table.has (source_schema_id) then
					schema_error_table.put (create {ERROR_ACCUMULATOR}.make, source_schema_id)
				end
				schema_error_table.item (source_schema_id).add_warning (a_key, args, "")
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
