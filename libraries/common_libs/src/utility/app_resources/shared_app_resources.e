note
	component:   "openEHR Archetype Project"
	description: "Shared application resources for any ADL application, GUI or non-GUI"
	keywords:    "resources, application"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class SHARED_APP_RESOURCES

inherit
	SHARED_RESOURCES

	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

feature -- Definitions

	Application_developer_name: STRING
			-- usually the company or organisation name of the application vendor.
		once
			Result := "unknown_app_dev"
		end

	Default_application_name: STRING
		once
			Result := "unknown_app"
		end

	Default_user_config_file_directory: STRING
			-- Default OS-specific place for user config file(s) for all applications ased on adl_workbench code base.
			-- Follows the model home_path/app_vendor/adl_workbench.
			-- This default directory can be used as a fallback rather than forcing every related app to have its
			-- own .cfg file, with essentially the same information (configured directories etc).
			-- (On Unix/Linux/Macosx(?) systems, we would normally locate this in /etc/adl_workbench)
		do
			if attached execution_environment.home_directory_name as hd then
				Result := file_system.pathname (file_system.pathname (hd, application_developer_name), Default_application_name)
			else
				Result := file_system.current_working_directory
			end
		end

	Default_user_config_file_path: STRING
			-- Full path to resource configuration file.
		do
			Result := file_system.pathname (Default_user_config_file_directory, Default_application_name + User_config_file_extension)
		end

feature -- Access

	app_cfg: DADL_CONFIG_FILE_ACCESS
			-- accessor object for application config file
		once
			if file_system.file_exists (user_config_file_path) then
				create Result.make (user_config_file_path)
			else
				create Result.make (Default_user_config_file_path)
			end
			app_cfg_initialise
		end

	app_cfg_initialise
			-- redefine in descendants, e.g. to add listeners for reload of file
		do
		end

	system_config_file_directory: STRING
			-- place for config files common to multiple applications
			-- UNIX only
		once
			create Result.make(0)
			Result.append (execution_environment.root_directory_name + "etc")
		end

	user_config_file_directory: STRING
			-- OS-specific place for user config file(s) for this application.
			-- Follows the model home_path/app_vendor/app_name.
		do
			check attached execution_environment.home_directory_name as hd then
				Result := file_system.pathname (file_system.pathname (hd, application_developer_name), extension_removed (application_name))
			end
		end

	user_config_file_path: STRING
			-- Full path to resource configuration file.
		do
			Result := file_system.pathname (user_config_file_directory, extension_replaced (application_name, User_config_file_extension))
		end

	application_full_path: STRING
			-- The full path to the application; else, if the application is in an Eiffel project's W_code
			-- or F_code directory, a path within the Eiffel project directory. This must be called before
			-- any change_dir calls are made since there is no easy way to get the startup directory.
		local
			path: KI_PATHNAME
			dir: STRING
		once
			path := file_system.string_to_pathname (file_system.absolute_pathname (execution_environment.command_line.command_name))
			path.set_canonical
			Result := file_system.pathname_to_string (path)

			if path.count > 3 then
				dir := path.item (path.count - 1)
				if dir.is_equal ("W_code") or dir.is_equal ("F_code") then
					if path.item (path.count - 3).is_equal ("EIFGENs") then
						dir := file_system.dirname (file_system.dirname (file_system.dirname (file_system.dirname (Result))))
						Result := file_system.pathname (dir, file_system.basename (Result))
					end
				end
			end
		ensure
			not_empty: not Result.is_empty
	    end

	application_startup_directory: STRING
			-- The directory in which the application is installed; else, if the application is in an Eiffel project's W_code
			-- or F_code directory, the Eiffel project directory. This must be called before any change_dir calls are made
			-- since there is no easy way to get the startup directory.
		once
			Result := file_system.dirname (application_full_path)
		ensure
			not_empty: not Result.is_empty
		end

	application_name: STRING
			-- The name of the application executable, with any leading directory components removed.
	    once
			Result := file_system.basename (application_full_path)
	    end

	locale_language_short: STRING
			-- The ISO 2-char code for the locale language, e.g. "en"
		local
			i18n: I18N_LOCALE_MANAGER
		do
			create i18n.make (application_startup_directory)
			Result := i18n.system_locale.info.id.language.as_string_8
		ensure
			Result_attached: Result /= Void
		end

	locale_language_long: STRING
			-- return the ISO 2-char code for the locale language + 2 char code country variant, where appropriate, e.g. "en-uk", "en-au"
		do
			-- FIXME: to be implemented
			Result := "en-uk"
		ensure
			Result_attached: Result /= Void
		end

feature -- Application Switches

	error_reporting_level: INTEGER
			-- Level of error reporting required; see BILLBOARD_MESSAGE_TYPES for levels
			-- all levels >= the one stored will be displayed; Info is the minimum.
		do
			Result := app_cfg.integer_value ("/general/error_reporting_level")
			if not is_valid_error_type (Result) then
				Result := Error_type_info
			end
		end

	set_error_reporting_level (v: INTEGER)
			-- Set `status_reporting_level'.
		do
			app_cfg.put_value ("/general/error_reporting_level", v)
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
--| The Original Code is shared_ui_resources.e.
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
