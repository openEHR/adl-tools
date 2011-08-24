note
	component:   "openEHR Archetype Project"
	description: "Access to service interface to object model"
	keywords:    "ADL, archetype, reference model"
	author:      "Thomas Beale"
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

create
	make

feature -- Definitions

	Max_inclusion_depth: INTEGER = 10

feature -- Initialisation

	make
		do
			create all_schemas.make(0)
			create top_level_schemas.make(0)
			create schema_inclusion_map.make(0)
			create schemas_by_model.make(0)
			create {ARRAYED_LIST[STRING]} schemas_load_list.make(0)
			schemas_load_list.compare_objects
		end

	initialise (a_rm_dir: attached STRING)
		require
			Rm_dir_valid: directory_exists (a_rm_dir)
		do
			schema_directory := a_rm_dir
			load_schema_descriptors
		ensure
			Schemas_dir_set: schema_directory = a_rm_dir
		end

	initialise_with_load_list (a_rm_dir: attached STRING; a_schemas_load_list: attached LIST [STRING])
			-- initialise with a specific schema load list, usually a sub-set of schemas that will be
			-- found in the directory `a_rm_dir'
		require
			Rm_dir_valid: directory_exists (a_rm_dir)
		do
			schema_directory := a_rm_dir
			schemas_load_list := a_schemas_load_list
			schemas_load_list.compare_objects
			load_schema_descriptors
		ensure
			Schemas_dir_set: schema_directory = a_rm_dir
			Schemas_load_list_set: schemas_load_list = a_schemas_load_list
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

	top_level_schemas: attached HASH_TABLE [SCHEMA_DESCRIPTOR, STRING]
			-- top-level (root) schemas in use. Table is keyed by logical schema_name, i.e. model_publisher '_' model_name, e.g. "openehr_rm"
			-- Schemas containing different variants of same model (i.e. model_publisher + model_name) are considered duplicates

	schema_for_model (a_qualified_model_name: STRING): BMM_SCHEMA
			-- Return schema containing the model-class key `a_qualified_model_name', e.g. "openEHR-EHR"
		require
			has_schema_for_model (a_qualified_model_name.as_lower)
		do
			Result := schemas_by_model.item (a_qualified_model_name.as_lower).schema
		end

	schemas_load_list: attached LIST [STRING]
			-- initial load list for this session, set during initialisation. This may initially be empty
			-- or contain invalid entries; it will be modified to correctly list the actual schemas found

	load_count: INTEGER
			-- load counter so other parts of the application can see if anything has changed

feature -- Status Report

	has_schema_for_model (a_qualified_model_name: STRING): BOOLEAN
			-- True if there is a schema containing the qualified package key `a_qualified_model_name', e.g. "openEHR-EHR"
		do
			Result := schemas_by_model.has (a_qualified_model_name.as_lower)
		end

	found_valid_schemas: BOOLEAN
			-- True if any Reference Model schemas were found
		do
			Result := not top_level_schemas.is_empty
		end

feature -- Commands

	set_schema_load_list (a_schemas_load_list: attached LIST [STRING])
		do
			schemas_load_list := a_schemas_load_list
		ensure
			Schemas_load_list_set: schemas_load_list = a_schemas_load_list
		end

	load_schemas
			-- populate the rm_schemas table by reading in schemas either specified in the 'rm_schemas_load_list'
			-- config variable, or by reading all schemas found in the schema directory
		local
			model_publisher: STRING
			qualified_model_name: STRING
			models: HASH_TABLE [ARRAYED_LIST [STRING], STRING]
			included_schema: BMM_SCHEMA
			sd: SCHEMA_DESCRIPTOR
			i: INTEGER
			finished: BOOLEAN
		do
			-- populate the rm_schemas table first
			top_level_schemas.wipe_out
			schema_inclusion_map.wipe_out
			if not all_schemas.is_empty then

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

				-- initial load of all schemas & populate `schema_inclusion_map'
				from all_schemas.start until all_schemas.off loop
					load_schema_include_closure (all_schemas.key_for_iteration)
					all_schemas.forth
				end

				-- mark the top level schemas
				from all_schemas.start until all_schemas.off loop
					if all_schemas.item_for_iteration.passed and not schema_inclusion_map.has (all_schemas.item_for_iteration.schema.schema_id) then
						all_schemas.item_for_iteration.set_top_level
					end
					all_schemas.forth
				end

				-- At this point, all schemas that parsed successfully are in `all_schemas' - consists of a set of
				-- SCHEMA_ACCESS objects each containing a BMM_SCHEMA containing only the classes defined in that
				-- schema file. Also at this point, the `schema_inclusion_map' is populated.
				-- Now we process the include relations, in order to add the packages and classes from included schemas to the
				-- top-level schemas.
				-- We iterate again repeatedly until all includes have been processed.
				from i := 1 until finished or i > Max_inclusion_depth loop
					finished := True
					from schema_inclusion_map.start until schema_inclusion_map.off loop
						if all_schemas.has (schema_inclusion_map.key_for_iteration) and then all_schemas.item (schema_inclusion_map.key_for_iteration).passed then
							included_schema := all_schemas.item (schema_inclusion_map.key_for_iteration).schema
							-- only process current schema if its lower level includes have already been copied into it,
							-- or if it had no includes, since only then is it ready to be itself included in the next one up the chain
							-- If this included schema is in this state, merge its contents into each schema that includes it
							if included_schema.state = {BMM_SCHEMA}.State_includes_processed then
								from schema_inclusion_map.item_for_iteration.start until schema_inclusion_map.item_for_iteration.off loop
									if all_schemas.item (schema_inclusion_map.item_for_iteration.item).schema.state /= {BMM_SCHEMA}.State_includes_processed then
										all_schemas.item (schema_inclusion_map.item_for_iteration.item).schema.merge_included_schema(included_schema)
										post_info (Current, "load_schemas", "model_access_i2", <<included_schema.schema_id, all_schemas.item (schema_inclusion_map.item_for_iteration.item).schema_id>>)
										finished := False
									end
									schema_inclusion_map.item_for_iteration.forth
								end
							end
						else
							post_error (Current, "load_schemas", "model_access_e10", <<schema_inclusion_map.key_for_iteration>>)
						end
						schema_inclusion_map.forth
					end
					i := i + 1
				end

				-- finalise the top-level schemas on the load list (if there is one)
				from all_schemas.start until all_schemas.off loop
					sd := all_schemas.item_for_iteration
					if sd.is_top_level and sd.passed and schemas_load_list.has (sd.schema_id) then
						if sd.schema.state = {BMM_SCHEMA}.State_includes_processed then
							sd.schema.finalise_schema
							if sd.schema.state = {BMM_SCHEMA}.State_ready_to_validate then
								-- validate the schema & if passed, put it into `top_level_schemas'
								sd.validate
								if sd.passed then
									top_level_schemas.extend (sd, sd.schema_id)
								else
									post_error (Current, "load_schemas", "model_access_e9", <<sd.schema_id, sd.errors.as_string>>)
								end
							end
						else
							sd.signal_load_include_error
						end
					end
					all_schemas.forth
				end
			end

			-- now populate the rm_schemas_by_package table
			schemas_by_model.wipe_out
			from top_level_schemas.start until top_level_schemas.off loop
				model_publisher := top_level_schemas.item_for_iteration.schema.model_publisher
				models := top_level_schemas.item_for_iteration.schema.models

				-- put a ref to schema, keyed by the model_publisher-package_name key (lower-case) for later lookup by compiler
				from models.start until models.off loop
					qualified_model_name := publisher_qualified_library_name (model_publisher, models.key_for_iteration)
					if not schemas_by_model.has (qualified_model_name) then
						schemas_by_model.put (top_level_schemas.item_for_iteration, qualified_model_name)
					else
						post_info (Current, "rm_schemas", "model_access_w3", <<qualified_model_name, schemas_by_model.item (qualified_model_name).schema.schema_id,
							top_level_schemas.item_for_iteration.schema.schema_id>>)
					end
					models.forth
				end
				top_level_schemas.forth
			end
			load_count := load_count.item + 1

		rescue
			io.putstring (billboard.content)
			io.new_line
		end

feature {NONE} -- Implementation

	schema_inclusion_map: attached HASH_TABLE [ARRAYED_LIST[STRING], STRING]
			-- map of inclusions among schemas found in the directory; structure:
			-- {key = schema_id; {list of schemas that 'include' key}}
			-- Schemas not included by other schemas have NO ENTRY in this list
			-- this is detected and used to populate `top_level_schemas'

	schemas_by_model: attached HASH_TABLE [SCHEMA_DESCRIPTOR, STRING]
			-- schemas keyed by qualified package name, i.e. model_publisher '-' package_name, e.g. "openehr-ehr";
			-- this matches the qualifide package name part of an ARCHETYPE_ID

	load_schema_descriptors
			-- initialise `rm_schema_metadata_table'
		local
			dir: DIRECTORY
			dmp: DADL_MINI_PARSER
			schema_path: STRING
			sd: SCHEMA_DESCRIPTOR
		do
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
							if all_schemas.has (sd.schema_id) then
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

	load_schema_include_closure (a_schema_id: attached STRING)
			-- process the include directives for a given schema & build the `schema_inclusion_map' reverse reference table
		local
			includes: HASH_TABLE [BMM_INCLUDE_SPEC, STRING]
			includers: ARRAYED_SET[STRING]
		do
			all_schemas.item (a_schema_id).load
			if all_schemas.item (a_schema_id).passed then
				post_info (Current, "load_schema_include_closure", "model_access_i1", <<a_schema_id,
					all_schemas.item (a_schema_id).schema.primitive_types.count.out, all_schemas.item (a_schema_id).schema.class_definitions.count.out>>)
				includes := all_schemas.item (a_schema_id).schema.includes
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
				post_error (Current, "load_schemas", "model_access_e8", <<a_schema_id, all_schemas.item (a_schema_id).errors.as_string>>)
			end
		end

invariant
	-- all_schemas_basic_validity: all_schemas.for_all (agent (sch: SCHEMA_ACCESS):BOOLEAN do Result := sch.passed end)

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
