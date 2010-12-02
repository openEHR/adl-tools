note
	component:   "openEHR Archetype Project"
	description: "Access to service interface to object model"
	keywords:    "ADL, archetype, reference model"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
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

	Schema_file_extension: STRING = ".dadl"

feature -- Initialisation

	make
		do
			create schemas.make(0)
			create schemas_by_package.make(0)
			create schema_metadata_table.make (0)
		end

	initialise (a_rm_dir: attached STRING; a_schemas_load_list: attached LIST [STRING])
		require
			Rm_dir_valid: directory_exists (a_rm_dir)
		do
			schema_directory := a_rm_dir
			schemas_load_list := a_schemas_load_list
			initialise_schema_metadata_table
		ensure
			Schemas_dir_set: schema_directory = a_rm_dir
			Schemas_load_list_set: schemas_load_list = a_schemas_load_list
		end

feature -- Access

	schemas: attached HASH_TABLE [SCHEMA_ACCESS, STRING]
			-- schemas in use; schemas containing different variants of same model (i.e. model_publisher + model_name)
			-- are considered duplicates. Table is keyed by logical schema_name, i.e. model_publisher '_' model_name, e.g. "openehr_rm"

	schemas_by_package: attached HASH_TABLE [SCHEMA_ACCESS, STRING]
			-- schemas keyed by qualified package name, i.e. model_publisher '-' package_name, e.g. "openehr-ehr";
			-- this matches the qualifide package name part of an ARCHETYPE_ID

	load_count: INTEGER
			-- load counter so other parts of the application can see if anything has changed

	schema_for_package (a_qualified_package_name: STRING): SCHEMA_ACCESS
			-- Return schema containing the package-class key `a_qualified_package_name', e.g. "openEHR-EHR"
		require
			has_schema_for_package (a_qualified_package_name.as_lower)
		do
			Result := schemas_by_package.item (a_qualified_package_name.as_lower)
		end

	schema_directory: STRING

	schema_metadata_table: attached HASH_TABLE [HASH_TABLE [STRING, STRING], STRING]
			-- table of all schemas found in schema directory; format:
			-- table of {schema meta-data items + path}, keyed by schema name
			-- schema_name is created from
			-- 	model_publisher '_' model_name '_' model_release
			-- e.g. openehr_rm_1.0.3, openehr_test_1.0.1, iso_13606-1_2008

feature -- Status Report

	has_schema_for_package (a_qualified_package_name: STRING): BOOLEAN
			-- True if there is a schema containing the qualified package key `a_qualified_package_name', e.g. "openEHR-EHR"
		do
			Result := schemas_by_package.has (a_qualified_package_name.as_lower)
		end

	found_valid_schemas: BOOLEAN
			-- True if any Reference Model schemas were found
		do
			Result := not schemas.is_empty
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
			ma: SCHEMA_ACCESS
			schema_path, model_publisher, model_name, logical_schema_name: STRING
			load_list: LINEAR [STRING]
			metadata_list: HASH_TABLE [STRING, STRING]
			qualified_pkg_name: STRING
			pkgs: HASH_TABLE [BMM_PACKAGE_DEFINITION, STRING]
		do
			-- populate the rm_schemas table first
			schemas.wipe_out
			if not schema_metadata_table.is_empty then
				-- list of schemas to load
				if not schemas_load_list.is_empty then
					load_list := schemas_load_list
				else
					load_list := schema_metadata_table.current_keys.linear_representation
					post_warning (Current, "rm_schemas", "model_access_w6", Void)
				end

				-- parse available schemas, ignoring duplicates
				from load_list.start until load_list.off loop
					if not schema_metadata_table.has(load_list.item) then
						post_warning (Current, "rm_schemas", "model_access_w5", <<load_list.item>>)
					else
						metadata_list := schema_metadata_table.item(load_list.item)
						schema_path := metadata_list.item (Metadata_schema_path)
						model_publisher := metadata_list.item (Metadata_model_publisher)
						model_name := metadata_list.item (Metadata_model_name)
						logical_schema_name := (model_publisher + "_" + model_name).as_lower

						if not schemas.has (logical_schema_name) then
							create ma.make(schema_path)
							if ma.is_valid then
								schemas.put (ma, logical_schema_name)
								post_info (Current, "rm_schemas", "general", <<ma.status>>)
							else
								post_error (Current, "rm_schemas", "general", <<ma.status>>)
							end
						else
							post_warning (Current, "rm_schemas", "model_access_w2", <<logical_schema_name, schema_path>>)
						end
					end
					load_list.forth
				end
			end

			-- now populate the rm_schemas_by_package table
			schemas_by_package.wipe_out
			from schemas.start until schemas.off loop
				model_publisher := schemas.item_for_iteration.schema.model_publisher
				pkgs := schemas.item_for_iteration.schema.packages

				-- put a ref to schema, keyed by the model_publisher-package_name key (lower-case) for later lookup by compiler
				from pkgs.start until pkgs.off loop
					qualified_pkg_name := (model_publisher + {ARCHETYPE_ID}.section_separator.out + pkgs.item_for_iteration.name).as_lower
					if not schemas_by_package.has (qualified_pkg_name) then
						schemas_by_package.put (schemas.item_for_iteration, qualified_pkg_name)
					else
						post_warning (Current, "rm_schemas", "model_access_w3", <<qualified_pkg_name, schemas.item_for_iteration.schema.schema_name>>)
					end
					pkgs.forth
				end

				schemas.forth
			end
			load_count := load_count.item + 1
		end

feature {NONE} -- Implementation

	schemas_load_list: LIST [STRING]
			-- initial load list for this session, set during initialisation

	initialise_schema_metadata_table
			-- initialise `rm_schema_metadata_table'
		local
			dir: DIRECTORY
			dmp: DADL_MINI_PARSER
			schema_name, schema_path: STRING
		do
			create schema_metadata_table.make(0)
			create dir.make_open_read (schema_directory)
			if not (dir.exists and dir.is_readable) then
				post_error (Current, "rm_schemas", "model_access_e5", <<schema_directory>>)
			elseif dir.is_empty then
				post_error (Current, "rm_schemas", "model_access_e6", <<schema_directory>>)
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
							schema_name := create_schema_name (dmp.last_parse_content_item (Metadata_model_publisher), dmp.last_parse_content_item (Metadata_model_name), dmp.last_parse_content_item (Metadata_model_release))

							-- check for two schema files purporting to be the exact same schema (including release)
							if schema_metadata_table.has(schema_name) then
								post_warning (Current, "rm_schemas", "model_access_w2", <<schema_name, schema_path>>)
							else
								schema_metadata_table.put (dmp.last_parse_content, schema_name)
							end
						else
							post_warning (Current, "rm_schemas", "model_access_w4", <<schema_path, dmp.last_parse_fail_reason>>)
						end
					end
					dir.readentry
				end
				if schema_metadata_table.is_empty then
					post_error (Current, "rm_schemas", "model_access_e6", <<schema_directory>>)
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
