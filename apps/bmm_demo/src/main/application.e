note
	component:   "openEHR Components Project"
	description: "[
				 This application demonstrates loading a set of BMM (basic meta-model) schemas into memory and
				 accessing them using the BMM classes.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

class
	APPLICATION

inherit
	ARGUMENTS

	GLOBAL_ERROR_REPORTING_LEVEL

	SHARED_REFERENCE_MODEL_ACCESS

	SHARED_BMM_APP_RESOURCES
		redefine
			Application_developer_name, Default_application_name
		end

	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

	BMM_DEFINITIONS
		export
			{NONE} all
		end

	ANY_VALIDATOR
		rename
			validate as Initialise_app,
			ready_to_validate as ready_to_initialise_app
		redefine
			ready_to_initialise_app
		end

create
	make

feature -- Definitions

	Application_developer_name: STRING = "openEHR"
			-- usually the company or organisation name of the application vendor.

	Default_application_name: STRING = "adl_workbench"

feature -- Initialization

	make
			-- Run application.
		do
			if ready_to_initialise_app then
				Initialise_app
				if not has_errors then
					output_schema_info

					-- now dmonstrate some usage of the schemas
					rm_schema := rm_schemas_access.schema_for_rm_closure ("openehr-ehr")

					io.put_string ("---------------- rm_schema.has_property_path() --------------%N")
					io.put_string ("CARE_ENTRY has /protocol: " + rm_schema.has_property_path ("CARE_ENTRY", "/protocol").out + "%N")
					io.put_string ("CARE_ENTRY has /data/events/data: " + rm_schema.has_property_path ("CARE_ENTRY", "/data/events/data").out + "%N")
					io.put_string ("OBSERVATION has /data/events/data: " + rm_schema.has_property_path ("OBSERVATION", "/data/events/data").out + "%N")
					io.put_string ("OBSERVATION has /data/events/data/items: " + rm_schema.has_property_path ("OBSERVATION", "/data/events/data/items").out + "%N")
					io.put_string ("OBSERVATION has /data/events[at0003]/math_function: " + rm_schema.has_property_path ("OBSERVATION", "/data/events[at0003]/math_function").out + "%N")
					io.put_string ("OBSERVATION has /protocol: " + rm_schema.has_property_path ("OBSERVATION", "/protocol").out + "%N")
					io.put_string ("OBSERVATION has /data/events[at0002]/data/items[at0.76]/items: " + rm_schema.has_property_path ("OBSERVATION", "/data/events[at0002]/data/items[at0.76]/items").out + "%N" + "%N")
					io.put_string ("OBSERVATION not has /data/events[at0002]/data/itemsXX[at0.76]/items: " + (not rm_schema.has_property_path ("OBSERVATION", "/data/events[at0002]/data/itemsXX[at0.76]/items")).out + "%N")
					io.put_string ("COMPOSITION not has /xxxx: " + (not rm_schema.has_property_path ("COMPOSITION", "/xxxx")).out + "%N")
					io.put_string ("CLUSTER has /items/items/items: " + rm_schema.has_property_path ("CLUSTER", "/items/items/items").out + "%N")
					io.new_line

					io.put_string ("---------------- rm_schema.rm_schema.is_descendant_of() --------------%N")
					io.put_string ("COMPOSITION is a subclass of LOCATABLE: " + rm_schema.is_descendant_of ("COMPOSITION", "LOCATABLE").out + "%N")
					io.put_string ("LOCATABLE is not subclass of COMPOSITION" + (not rm_schema.is_descendant_of ("LOCATABLE", "COMPOSITION")).out + "%N")
					io.new_line

					io.put_string ("---------------- rm_schema.rm_schema.suppliers --------------%N")
					io.put_string ("All supplier classes of COMPOSITION: %N")
					across rm_schema.class_definition ("COMPOSITION").suppliers as supps_csr loop
						io.put_string (supps_csr.item + "%N")
					end
					io.new_line
				else
					io.put_string (error_strings)
					io.put_string ("Check .cfg gile " + app_cfg.file_path + "%N")
				end
			end
		end

	output_schema_info
		local
			schema_id: STRING
			schema_meta_data: HASH_TABLE [STRING, STRING]
		do
			-- create row containinng widgets for: check column, name column, status column, edit button column
			across rm_schemas_access.all_schemas as rm_schemas_csr loop
				schema_id := rm_schemas_csr.key
				schema_meta_data := rm_schemas_csr.item.meta_data

				-- column 1 - check box to indicate loaded; only on top-level schemas
				if rm_schemas_csr.item.is_top_level then
					io.put_string ("(top-level)")
				else
					io.put_string ("           ")
				end
				io.put_character ('%T')

				-- column 2 - RM schema name
				io.put_string (schema_id)
				io.put_character ('%T')

				-- column 3 - lifecycle state
				if schema_meta_data.has (Metadata_schema_lifecycle_state) then
					io.put_string (schema_meta_data.item (Metadata_schema_lifecycle_state))
				else
					io.put_string ("(unknown)")
				end
				io.put_character ('%T')

				-- column 4 - validated

				if rm_schemas_csr.item.passed then
					io.put_string ("validated")
				else
					io.put_string ("failed")
				end
				io.put_character ('%N')

			end
		end

	initialise_app
		once
			-- set error reporting level in billboard and all error accumulator objects
			set_global_error_reporting_level (error_reporting_level)

			-- set up the RM schemas
			if rm_schema_directory.is_empty then
				set_rm_schema_directory (Default_rm_schema_directory)
			end
			if file_system.directory_exists (rm_schema_directory) then
				Rm_schemas_access.initialise_all (rm_schema_directory)
				if not Rm_schemas_access.found_valid_schemas then
					add_error (Ec_bmm_schemas_config_not_valid, << rm_schemas_access.schemas_load_list_string, rm_schema_directory >>)
				end
			else
				add_error (Ec_bmm_schema_dir_not_valid, << rm_schema_directory >>)
			end
		end

feature -- Access

	rm_schema: BMM_SCHEMA
			-- set if this archetype has a valid package-class_name

feature -- Status Report

	ready_to_initialise_app: BOOLEAN
		do
			Result := not App_cfg.errors.has_errors
		end

end
