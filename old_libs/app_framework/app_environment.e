note
	component:   "openEHR ADL Tools"
	description: "[
				 Common access point operating environment resources.
	             Sources of resource settings are a .cfg file named after the
				 application and by default, found in its startup directory.
	             The resource values are available via the resource_value() interface.
	             ]"
	keywords:    "config, resources"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005,2006 openEHR Foundation"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


deferred class APP_ENVIRONMENT

inherit
	SHARED_ACCESS

feature -- Definitions

	Default_cmd_line_option_sign: CHARACTER = '-'

	Default_cfg_file_cmt_char: CHARACTER = ';'

feature --- Initiatialisation

	app_env_initialise
			-- initialise the application environment; set `app_env_fail_reason' if encountered problems
		deferred
		end

feature -- Resource Configuration

	app_cmd_line_option_sign: CHARACTER
		once
			Result := Default_cmd_line_option_sign
		end

	app_cfg_file_cmt_char: CHARACTER
		once
			Result := Default_cfg_file_cmt_char
		end

feature -- Environment Status

	app_env_is_valid: BOOLEAN
			-- if not True, look at `app_env_fail_reason'.
		do
			Result := app_env_fail_reason.is_empty
		end

	app_env_fail_reason: STRING
		once
			create Result.make (0)
		end

feature -- Miscellaneous

	close_console: BOOLEAN
		external
			"C | <wincon.h> , <wtypes.h>"
		alias
			"FreeConsole"
		end

end

