note
	component:   "openEHR Archetype Project"
	description: "Access to service interface to object model"
	keywords:    "ADL, archetype, reference model"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010-2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class REFERENCE_MODEL_ACCESS

inherit
	SHARED_RESOURCES
		export
			{NONE} all;
			{ANY} directory_exists
		end

	BMM_DEFINITIONS
		export
			{NONE} all
		end

	SHARED_MESSAGE_BILLBOARD
		export
			{NONE} all
		end

	EXCEPTIONS
		export
			{NONE} all
		end

create
	make

feature -- Definitions

	Max_inclusion_depth: INTEGER = 10

feature -- Initialisation

	make
		do
			exception_encountered := False
			create all_schemas.make(0)
			create candidate_schemas.make(0)
			create valid_top_level_schemas.make(0)
			create schema_inclusion_map.make(0)
			create schemas_by_rm_closure.make(0)
			create {ARRAYED_LIST[STRING]} schemas_load_list.make(0)
			schemas_load_list.compare_objects
		end

	initialise_with_load_list (an_rm_dir: attached STRING; a_schemas_load_list: attached LIST [STRING])
			-- initialise with a specific schema load list, usually a sub-set of schemas that will be
			-- found in the directory `a_rm_dir'
		require
			Rm_dir_valid: directory_exists (an_rm_dir)
		do
			make
			schema_directory := an_rm_dir
			schemas_load_list.append (a_schemas_load_list)
			reload_schemas
		ensure
			Schemas_dir_set: schema_directory = an_rm_dir
		end

feature -- Access

	schema_directory: STRING
			-- directory where all the schemas loaded here are found

	all_schemas: HASH_TABLE [SCHEMA_DESCRIPTOR, STRING]
			-- all schemas found and loaded from `schema_directory'
			-- Keyed by schema_id, i.e.
			-- 		model_publisher '_' schema_name '_' model_release
			-- e.g. openehr_rm_1.0.3, openehr_test_1.0.1, iso_13606-1_2008
			-- This is the same key as BMM_SCHEMA.schema_id
			-- Does not include schemas that failed to parse (i.e. SCHEMA_ACCESS.passed = False)

	candidate_schemas: HASH_TABLE [SCHEMA_DESCRIPTOR, STRING]
			-- includes only fully validated schemas

	valid_top_level_schemas: attached HASH_TABLE [BMM_SCHEMA, STRING]
			-- top-level (root) schemas in use. Table is keyed by logical schema_name, i.e. model_publisher '_' model_name, e.g. "openehr_rm"
			-- Schemas containing different variants of same model (i.e. model_publisher + model_name) are considered duplicates

	schema_for_rm_closure (a_qualified_rm_closure_name: STRING): BMM_SCHEMA
			-- Return schema containing the model-class key `a_qualified_rm_closure_name', e.g. "openEHR-EHR"
		require
			has_schema_for_rm_closure (a_qualified_rm_closure_name)
		do
			Result := schemas_by_rm_closure.item (a_qualified_rm_closure_name.as_lower)
		end

	schemas_load_list: attached LIST [STRING]
			-- initial load list for this session, set during initialisation. This may initially be empty
			-- or contain invalid entries; it will be modified to correctly list the actual schemas found

	load_count: INTEGER
			-- load counter so other parts of the application can see if anything has changed

	exception_encountered: BOOLEAN
			-- set to True if any processing failed

feature -- Status Report

	has_schema_for_rm_closure (a_qualified_rm_closure_name: STRING): BOOLEAN
			-- True if there is a schema containing the qualified package key `a_qualified_rm_closure_name', e.g. "openEHR-EHR"
		do
			Result := schemas_by_rm_closure.has (a_qualified_rm_closure_name.as_lower)
		end

	found_valid_schemas: BOOLEAN
			-- True if any Reference Model schemas were found
		do
			Result := not exception_encountered and not valid_top_level_schemas.is_empty
		end

feature -- Commands

	set_schema_load_list (a_schemas_load_list: attached LIST [STRING])
		do
			schemas_load_list.wipe_out
			schemas_load_list.append (a_schemas_load_list)
		ensure
			Schemas_load_list_set: schemas_load_list.is_equal (a_schemas_load_list)
		end

	reload_schemas
			-- reload schemas from current schema dir
		do
			load_schema_descriptors
			load_schemas
		end

feature {NONE} -- Implementation

	schema_inclusion_map: attached HASH_TABLE [ARRAYED_LIST [STRING], STRING]
			-- map of inclusions among schemas found in the directory; structure:
			-- {key = schema_id; {list of schemas that 'include' key}}
			-- Schemas not included by other schemas have NO ENTRY in this list
			-- this is detected and used to populate `top_level_schemas'

	schemas_by_rm_closure: attached HASH_TABLE [BMM_SCHEMA, STRING]
			-- schemas keyed by lower-case qualified package name, i.e. model_publisher '-' package_name, e.g. "openehr-ehr";
			-- this matches the qualifide package name part of an ARCHETYPE_ID

	load_schema_descriptors
			-- initialise `rm_schema_metadata_table'
		local
			dir: DIRECTORY
			dmp: DADL_MINI_PARSER
			schema_path: STRING
			sd: SCHEMA_DESCRIPTOR
		do
			if not exception_encountered then
				all_schemas.wipe_out
				create dir.make_open_read (schema_directory)
				if not (dir.exists and dir.is_readable) then
					post_error (Current, "load_schema_descriptors", "model_access_e5", <<schema_directory>>)
				elseif dir.is_empty then
					post_error (Current, "load_schema_descriptors", "model_access_e6", <<schema_directory, Schema_file_extension>>)
				else
					create dmp
					from
						dir.start
						dir.readentry
					until
						dir.lastentry = Void
					loop
						if dir.lastentry.ends_with (schema_file_extension) then
							schema_path := schema_directory + os_directory_separator.out + dir.lastentry
							dmp.extract_attr_values (schema_path, Schema_fast_parse_attrs)
							if dmp.last_parse_valid then
								dmp.last_parse_content.put (schema_path, Metadata_schema_path)
								create sd.make (dmp.last_parse_content)

								-- check for two schema files purporting to be the exact same schema (including release)
								if sd.errors.has_errors then
									post_error (Current, "load_schema_descriptors", "model_access_e2", <<sd.schema_id, sd.errors.as_string>>)
								elseif all_schemas.has (sd.schema_id) then
									post_warning (Current, "load_schema_descriptors", "model_access_w2", <<sd.schema_id, schema_path>>)
								else
									all_schemas.put (sd, sd.schema_id)
								end
							else
								post_warning (Current, "load_schema_descriptors", "model_access_w4", <<schema_path, dmp.last_parse_fail_reason>>)
							end
						end
						dir.readentry
					end
					if all_schemas.is_empty then
						post_error (Current, "load_schema_descriptors", "model_access_e6", <<schema_directory, Schema_file_extension>>)
					end
				end
			end
		rescue
			exception_encountered := True
			post_error (Current, "load_schemas", "model_access_e14", Void)
			retry
		end

	load_schemas
			-- populate the rm_schemas table by reading in schemas either specified in the 'rm_schemas_load_list'
			-- config variable, or by reading all schemas found in the schema directory
		local
			model_publisher: STRING
			qualified_rm_closure_name: STRING
			rm_closures: ARRAYED_LIST [STRING]
			included_schema: P_BMM_SCHEMA
			i: INTEGER
			finished, incompatible_schema_detected: BOOLEAN
		do
			if not exception_encountered then
				-- populate the rm_schemas table first
				valid_top_level_schemas.wipe_out
				schema_inclusion_map.wipe_out
				candidate_schemas.wipe_out

				if not all_schemas.is_empty then
					-- reset all schemas error logs
					across all_schemas as all_schemas_csr loop
						all_schemas_csr.item.reset
					end

					-- set list of schemas to load; used later to determine what to put in `top_level_schemas'
					if not schemas_load_list.is_empty then
						from schemas_load_list.start until schemas_load_list.off loop
							if not all_schemas.has (schemas_load_list.item) then
								post_warning (Current, "load_schemas", "model_access_w7", <<schemas_load_list.item>>)
								schemas_load_list.remove
							else
								schemas_load_list.forth
							end
						end
					else
						create {ARRAYED_LIST[STRING]} schemas_load_list.make_from_array (all_schemas.current_keys)
						schemas_load_list.compare_objects
						post_warning (Current, "load_schemas", "model_access_w6", Void)
					end

					-- initial load of all schemas, which populates `schema_inclusion_map';
					across all_schemas as all_schemas_csr loop
						if all_schemas_csr.item.passed then
							load_schema_include_closure (all_schemas_csr.key)
							if all_schemas_csr.item.errors.has_warnings then
								post_warning (Current, "load_schemas", "model_access_w8", <<all_schemas_csr.key, all_schemas_csr.item.errors.as_string>>)
							end
						else
							post_error (Current, "load_schemas", "model_access_e12", <<all_schemas_csr.key, all_schemas_csr.item.errors.as_string>>)
							if not all_schemas_csr.item.is_bmm_compatible then
								incompatible_schema_detected := True
							end
						end
					end
					if incompatible_schema_detected then
						post_error (Current, "load_schemas", "model_access_e16", <<schema_directory>>)
					end

					-- propagate errors found so far
					-- Also here: mark the 'top-level' schemas, inferred from the inclusion maps in each schema
					across all_schemas as all_schemas_csr loop
						if not all_schemas_csr.item.passed then
							merge_validation_errors (all_schemas_csr.item)
						end
						if not schema_inclusion_map.has (all_schemas_csr.item.schema_id) then
							all_schemas_csr.item.set_top_level
						end
					end

					-- Copy all SCHEMA_DESCRIPTORs validated to this point to `validated_schemas'
					-- we do this in a separate pass, because each iteration of the previous loop can result in a closure
					-- of schemas being loaded
					across all_schemas as all_schemas_csr loop
						if all_schemas_csr.item.passed then
							candidate_schemas.put (all_schemas_csr.item, all_schemas_csr.key)
						end
					end

					-- Now we process the include relations on the P_BMM top-level schemas, creating fully populated schemas
					from i := 1 until finished or i > Max_inclusion_depth loop
						finished := True
						across schema_inclusion_map as map_csr loop
							if candidate_schemas.has (map_csr.key) then
								included_schema := candidate_schemas.item (map_csr.key).p_schema
								-- only process current schema if its lower level includes have already been copied into it,
								-- or if it had no includes, since only then is it ready to be itself included in the next one up the chain
								-- If this included schema is in this state, merge its contents into each schema that includes it
								if included_schema.state = {P_BMM_SCHEMA}.State_includes_processed then
									-- iterate over the schemas that include `included_schema' and process the inclusion
									across map_csr.item as schemas_csr loop
										if candidate_schemas.item (schemas_csr.item).p_schema.state = {P_BMM_SCHEMA}.State_includes_pending then
											candidate_schemas.item (schemas_csr.item).p_schema.merge (included_schema)
											post_info (Current, "load_schemas", "model_access_i2", <<included_schema.schema_id, candidate_schemas.item (schemas_csr.item).schema_id>>)
											finished := False
										end
									end
								end
							else
								post_error (Current, "load_schemas", "model_access_e10", <<schema_inclusion_map.key_for_iteration>>)
							end
						end
						i := i + 1
					end

					-- By this point the P_BMM schemas have been merged, and the top-level P_BMM schemas can be validated
					-- This will cause each schema to potentially create errors to do with included schemas as well as itself
					-- These errors then need to be integrated with the original schemas, so as to be reported correctly
					across candidate_schemas as schemas_csr loop
						if schemas_csr.item.is_top_level and schemas_load_list.has (schemas_csr.item.schema_id) then
							if schemas_csr.item.passed and schemas_csr.item.p_schema.state = {P_BMM_SCHEMA}.State_includes_processed then
								-- validate the schema & if passed, put it into `top_level_schemas'
								schemas_csr.item.validate
								merge_validation_errors (schemas_csr.item)
								if schemas_csr.item.passed then
									schemas_csr.item.create_schema
									valid_top_level_schemas.extend (schemas_csr.item.schema, schemas_csr.item.schema_id)
									if schemas_csr.item.errors.has_warnings then
										post_warning (Current, "load_schemas", "model_access_w8", <<schemas_csr.item.schema_id, schemas_csr.item.errors.as_string>>)
									end
								else
									post_error (Current, "load_schemas", "model_access_e9", <<schemas_csr.item.schema_id, schemas_csr.item.errors.as_string>>)
								end
							end
						end
					end
				end

				-- now populate the `schemas_by_rm_closure' table
				schemas_by_rm_closure.wipe_out
				across valid_top_level_schemas as schemas_csr loop
					model_publisher := schemas_csr.item.rm_publisher
					rm_closures := schemas_csr.item.archetype_rm_closure_packages

					-- put a ref to schema, keyed by the model_publisher-package_name key (lower-case) for later lookup by compiler
					across rm_closures as rm_closures_csr loop
						qualified_rm_closure_name := publisher_qualified_rm_closure_key (model_publisher, rm_closures_csr.item)
						if not schemas_by_rm_closure.has (qualified_rm_closure_name) then
							schemas_by_rm_closure.put (schemas_csr.item, qualified_rm_closure_name.as_lower)
						else
							post_info (Current, "load_schemas", "model_access_w3", <<qualified_rm_closure_name, schemas_by_rm_closure.item (qualified_rm_closure_name).schema_id,
								schemas_csr.key>>)
						end
					end
				end
				load_count := load_count.item + 1
			end

		rescue
			exception_encountered := True
			if assertion_violation then
				post_error (Current, "load_schemas", "model_access_e14a", <<original_class_name + "." + original_recipient_name + "%N" + exception_trace>>)
			else
				post_error (Current, "load_schemas", "model_access_e14", Void)
			end
			retry
		end

	load_schema_include_closure (a_schema_id: attached STRING)
			-- process the include directives for a given schema & build the `schema_inclusion_map' reverse reference table
		local
			includes: HASH_TABLE [BMM_INCLUDE_SPEC, STRING]
			includers: ARRAYED_SET[STRING]
		do
			all_schemas.item (a_schema_id).load
			if all_schemas.item (a_schema_id).passed then
				all_schemas.item (a_schema_id).validate_includes (all_schemas.current_keys)
				if all_schemas.item (a_schema_id).passed then
					post_info (Current, "load_schema_include_closure", "model_access_i1", <<a_schema_id,
						all_schemas.item (a_schema_id).p_schema.primitive_types.count.out, all_schemas.item (a_schema_id).p_schema.class_definitions.count.out>>)
					includes := all_schemas.item (a_schema_id).p_schema.includes
					if not includes.is_empty then
						from includes.start until includes.off loop
							if not schema_inclusion_map.has (includes.item_for_iteration.id) then
								create includers.make (0)
								schema_inclusion_map.put (includers, includes.item_for_iteration.id)
							end
							schema_inclusion_map.item (includes.item_for_iteration.id).extend (a_schema_id)
							if not all_schemas.has (includes.item_for_iteration.id) then
								load_schema_include_closure (includes.item_for_iteration.id)
							end
							includes.forth
						end
					end
				else
					post_error (Current, "load_schemas", "model_access_e15", <<a_schema_id, all_schemas.item (a_schema_id).errors.as_string>>)
				end
			else
				post_error (Current, "load_schemas", "model_access_e8", <<a_schema_id, all_schemas.item (a_schema_id).errors.as_string>>)
			end
		end

	merge_validation_errors (sd: SCHEMA_DESCRIPTOR)
			-- merge all errors recorded during validation of `sd' - this includes errors that
			-- may be for included schemas, so we use the inclusion map to mark all schemas
			-- up the hierarchy with the knock-on effect of these errors
		local
			err_table: HASH_TABLE [ERROR_ACCUMULATOR, STRING]
			errors_to_propagate: BOOLEAN
			targ_sd, client_sd: SCHEMA_DESCRIPTOR
		do
			if attached sd.p_schema then
				err_table := sd.p_schema.schema_error_table
				across err_table as err_table_csr loop
					-- merge errors into the offending schema error accumulator
					all_schemas.item (err_table_csr.key).merge_errors (err_table_csr.item)

					-- iterate through all schemas including err_table.key_for_iteration, except for `sd' since it will already have been marked
					-- Note that there will be an entry in err_table for warnings as well as errors, so we have to process these properly
					if schema_inclusion_map.has (err_table_csr.key) then
						schema_inclusion_map.item (err_table_csr.key).do_all (
							agent (a_client_schema, a_source_schema: STRING; err_accum: ERROR_ACCUMULATOR)
								do
									if err_accum.has_errors then
										all_schemas.item (a_client_schema).add_error ("BMM_INCERR", <<a_client_schema, a_source_schema>>)
									else
										all_schemas.item (a_client_schema).add_warning ("BMM_INCWARN", <<a_client_schema, a_source_schema>>)
									end
								end (?, err_table_csr.key, err_table_csr.item)
						)
					end
				end
			end

			-- propagate a BMM_INCERR or BMM_INCWARN to all schemas in the inclusion hierarchy from source schemas
			from errors_to_propagate := True until not errors_to_propagate loop
				errors_to_propagate := False
				across schema_inclusion_map as schema_inclusion_map_csr loop
					targ_sd := all_schemas.item (schema_inclusion_map_csr.key)
					if not targ_sd.passed or else targ_sd.errors.has_warnings then
						across schema_inclusion_map_csr.item as client_schemas_csr loop
							client_sd := all_schemas.item (client_schemas_csr.item)
							if client_sd.passed and not client_sd.errors.has_warnings then
								if not targ_sd.passed then
									client_sd.add_error ("BMM_INCERR", <<client_schemas_csr.item, schema_inclusion_map_csr.key>>)
								else
									client_sd.add_warning ("BMM_INCWARN", <<client_schemas_csr.item, schema_inclusion_map_csr.key>>)
								end
								errors_to_propagate := True
							end
						end
					end
				end
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
--| The Original Code is reference_model_access.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2010
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
