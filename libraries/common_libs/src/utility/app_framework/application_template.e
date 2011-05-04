note
	component:   "openEHR Common Libraries"
	description: "[
				 Basic template for any application with access to external resources, event log.
	             ]"
	keywords:    "application, template, config, resources"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2005,2006 openEHR Foundation"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class APPLICATION_TEMPLATE

inherit
	ERROR_STATUS
		export
			{NONE} all;
			{ANY} fail_reason, last_op_fail
		end

	SHARED_RESOURCES
		export
			{ANY} os_directory_separator
		end

	INI_CONFIG_FILE_ACCESS
		rename
			make as config_file_make,
			file_name as config_file_name,
			writable as config_file_writable,
			is_valid as config_file_is_valid
		undefine
			execution_environment
		end

	SHARED_EVENT_LOG
		export
			{NONE} all
		end

feature -- Template

	app_env_initialise
		do
		end

	application_register
			-- override in descendants; set `application_registering' appropriately
		do
		end

	application_initialise
			-- effect in descendants; set `application_initialised' appropriately
		do
			application_initialised := True
		end

	persistence_initialise
			-- effect in descendants; set `persistence_initialised' appropriately
		do
			persistence_initialised := True
		end

	persistence_finalise
			-- effect in descendants
		do

		end

	main
			-- effect in descendants - the main business of the application
		deferred
		end

feature -- Initialisation

	make
			-- connect app to environment, find resources, open media etc;
			-- Once resources and event log are initialised, call `application_initialise', to be defined by
			-- descendant applications. If that works, open all media.
		do
			config_file_make (user_config_file_path)
			application_register

			if not application_registering then
				app_env_initialise
				if app_env_is_valid then
					initialise_event_log
					if event_log_initialised then
						persistence_initialise
						if persistence_initialised then
							application_initialise
							if application_initialised then
								main
							else
								io.put_string("Application initialisation failed%N")
							end
							persistence_finalise
						end
					else
						io.put_string("Event log initialisation failed%N")
					end
				else
					io.put_string("Environment initialisation failed; reason: " + app_env_fail_reason + "%N")
					application_initialised := False
				end
			else
				io.put_string("Application registration only%N")
			end
		end

feature {NONE} -- Implementation

	initialise_event_log
			-- initialisation the logging facility in SHARED_EVENT_LOG
		local
			app_log_facility: EVENT_LOG_FACILITY
		do
			create app_log_facility.make(application_name, resource_value("logging", "facility_name"),
										resource_value("logging", "facility_type"),
										resource_value("logging", "severity_threshold"))
			if app_log_facility.exists then
				set_log_facility(app_log_facility)
				event_log_initialised := True
			end
		end

feature -- Status

	application_initialised: BOOLEAN
			-- result of initialisation

	application_registering: BOOLEAN
			-- result of `application_register'

	persistence_initialised: BOOLEAN
			-- result of persistence_initialise

	event_log_initialised: BOOLEAN
			-- result of initialise_event_log

feature -- Environment Status

	app_env_is_valid: BOOLEAN
	        -- if not True, look at app_init_fail_reason
	    do
	        Result := app_env_fail_reason.is_empty
	    end

	app_env_fail_reason: STRING
 	    once
	        create Result.make(0)
	    end

end
