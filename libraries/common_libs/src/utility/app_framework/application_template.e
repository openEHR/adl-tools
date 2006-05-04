indexing
	component:   "openEHR Common Libraries"
	description: "[
				 Basic template for any application with access to external resources, event log"
	             ]"
	keywords:    "application, template, config, resources"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
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

	FILE_APP_ENVIRONMENT
		export
			{NONE} all
		end
		
feature -- Template

	application_register is
			-- override in descendants; set `application_registering' appropriately
		do
		end
		
	application_initialise is
			-- effect in descendants; set `application_initialised' appropriately
		do
			application_initialised := True
		end
		
	main is
			-- effect in descendants - the main business of the application
		deferred
		end
		
feature -- Initialisation

	make is
			-- connect app to environment, find resources, open media etc;
			-- Once resources and event log are initialised, call `application_initialise', to be defined by
			-- descendant applications. If that works, open all media.
		do
			application_register
			if not application_registering then
				app_env_initialise
				if app_env_is_valid then
					initialise_event_log
					application_initialise
					if application_initialised then
						main
					else
						io.put_string("Application initialisation failed%N")
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
		
	initialise_event_log is
			-- initialisation the logging facility in SHARED_EVENT_LOG
		local
			app_log_facility:EVENT_LOG_FACILITY
		do
			create app_log_facility.make(application_name, resource_value("logging", "facility_name"), 
										resource_value("logging", "facility_type"),
										resource_value("logging", "severity_threshold"))
			set_log_facility(app_log_facility)
		ensure
			Log_facility_exists: log_facility.item /= Void
		end
		
feature -- Status

	application_initialised: BOOLEAN
			-- result of initialisation

	application_registering: BOOLEAN
			-- result of `application_register'

end
