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

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class
	APPLICATION

inherit
	ARGUMENTS

	SHARED_REFERENCE_MODEL_ACCESS

	SHARED_RESOURCES
		export
			{NONE} all
		end

	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

	SHARED_MESSAGE_BILLBOARD
		export
			{NONE} all
		end

	BMM_DEFINITIONS
		export
			{NONE} all
		end

create
	make

feature -- Initialization

	make
			-- Run application.
		local
			supps: ARRAYED_SET [STRING]
		do
			initialise
			io.put_string (billboard.content)
			if initialised then
				output_schema_info

				-- now dmonstrate some usage of the schemas
				rm_schema := rm_schemas_access.schema_for_package ("openehr-ehr")

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

				io.put_string ("---------------- rm_schema.rm_schema.immediate_suppliers --------------%N")
				supps := rm_schema.class_definition ("COMPOSITION").immediate_suppliers
				io.put_string ("Immediate supplier classes of COMPOSITION: %N")
				from supps.start until supps.off loop
					io.put_string (supps.item + "%N")
					supps.forth
				end
				io.new_line

				io.put_string ("---------------- rm_schema.rm_schema.all_suppliers --------------%N")
				supps := rm_schema.class_definition ("COMPOSITION").all_suppliers
				io.put_string ("All supplier classes of COMPOSITION: %N")
				from supps.start until supps.off loop
					io.put_string (supps.item + "%N")
					supps.forth
				end
				io.new_line
			end
		end

	output_schema_info
		local
			schema_id: STRING
			i: INTEGER
			schema_meta_data: HASH_TABLE [STRING, STRING]
		do
			-- create row containinng widgets for: check column, name column, status column, edit button column
			from rm_schemas_access.all_schemas.start until rm_schemas_access.all_schemas.off loop
				schema_id := rm_schemas_access.all_schemas.key_for_iteration
				schema_meta_data := rm_schemas_access.all_schemas.item (schema_id).meta_data

				-- column 1 - check box to indicate loaded; only on top-level schemas
				if rm_schemas_access.all_schemas.item_for_iteration.is_top_level then
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

				if rm_schemas_access.all_schemas.item_for_iteration.passed then
					io.put_string ("validated")
				else
					io.put_string ("failed")
				end
				io.put_character ('%N')

				rm_schemas_access.all_schemas.forth
			end
		end

	initialise
		local
			dummy_error_accumulator: ERROR_ACCUMULATOR
		once
			message_db.populate (Error_db_directory, locale_language_short)
			if message_db.database_loaded then

				-- set error reporting level in billboard and all error accumulator objects
				billboard.set_error_reporting_level (Error_type_warning)
				create dummy_error_accumulator.make
				dummy_error_accumulator.set_error_reporting_level (Error_type_warning)

				-- set up the RM schemas
				if directory_exists (rm_schema_directory) then
					rm_schemas_access.initialise (rm_schema_directory)
					rm_schemas_access.load_schemas
					if not rm_schemas_access.found_valid_schemas then
						post_warning (Current, "initialise", "model_access_e6", <<rm_schema_directory, schema_file_extension>>)
					else
						initialised := True
					end
				else
					post_error (Current, "initialise", "model_access_e5", <<rm_schema_directory>>)
				end
			end
		end

feature -- Access

	rm_schema: BMM_SCHEMA
			-- set if this archetype has a valid package-class_name

	Rm_schema_directory: STRING
			-- directory of Reference Model schema files; same as full path to app + "/rm_schemas";
			-- contains schema files in .dadl format e.g.
			-- .../rm_schemas/openehr_rm_102.dadl
		once
			Result := application_startup_directory.twin
			Result.append(os_directory_separator.out + "rm_schemas")
		end

	Error_db_directory: STRING
			-- directory of error database files in .dadl format e.g.
			-- .../error_db/dadl_errors.txt etc
		once
			Result := file_system.pathname(application_startup_directory, "error_db")
		end

feature -- Status Report

	initialised: BOOLEAN

end
