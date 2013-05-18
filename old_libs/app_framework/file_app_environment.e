note
	component:   "openEHR ADL Tools"
	description: "Implementation of APP_ENVIRONMENT using text config file."
	keywords:    "framework"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005,2006 openEHR Foundation"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class FILE_APP_ENVIRONMENT

inherit
	APP_ENVIRONMENT

feature --- Initiatialisation

	app_env_initialise
		local
			path: STRING
			file: PLAIN_TEXT_FILE
		do
			-- set command line args option switch
			execution_environment.command_line.set_option_sign (app_cmd_line_option_sign)

			-- search for config file as follows:
			-- in a place specified on command line with -cfg option
			-- else in .exe startup directory
			path := execution_environment.command_line.separate_word_option_value ("cfg")

			if path = Void or else path.is_empty then
				-- try application startup directory
				path := extension_replaced (application_full_path, User_config_file_extension)
			end

			create file.make (path)

			if not (file.exists and file.is_readable) then
				app_env_fail_reason.append ("Config file " + path + " does not exist or is not readable")
			else
				resource_config_file_implementation.put (create {INI_CONFIG_FILE_ACCESS}.make (path))

				if not resource_config_file.is_valid then
					app_env_fail_reason.append (resource_config_file.fail_reason)
				end
			end
		ensure then
			resource_config_file_else_fail: attached resource_config_file xor not app_env_is_valid
		end

feature -- Resource Configuration

	resource_config_file: INI_CONFIG_FILE_ACCESS
			-- The application configuration file.
		do
			Result := resource_config_file_implementation.item
		end

feature {NONE} -- Implementation

	resource_config_file_implementation: CELL [INI_CONFIG_FILE_ACCESS]
			-- Access to the shared instance of the application configuration file.
		once
	        create Result.put (Void)
		end

end

