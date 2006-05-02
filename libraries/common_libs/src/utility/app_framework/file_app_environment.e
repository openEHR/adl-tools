indexing
	component:   "OSTORE Object Persistence Library for Eiffel"
	description: "Implementation of APP_ENVIRONMENT using text config file."
	keywords:    "framework"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class FILE_APP_ENVIRONMENT

inherit
	APP_ENVIRONMENT

feature --- Initiatialisation

	app_env_initialise is
		local
			fname,home:STRING
			a_dir:DIRECTORY
			cfg_name:STRING
			a_file:PLAIN_TEXT_FILE
		do
			-- setup command line args
			execution_environment.command_line.set_option_sign(app_cmd_line_option_sign)

			-- get value of XXX_HOME env var
			home := execution_environment.get(app_home_env_varname)
			if home = Void then
				app_env_fail_reason.append(app_home_env_varname) 
				app_env_fail_reason.append(" environment variable not specified")
			else
				-- find XXX_HOME directory
				application_home_directory.copy(home)

				-- see if home dir is a valid directory
				create a_dir.make_open_read(application_home_directory)
				if not a_dir.exists then
					app_env_fail_reason.append("Application HOME directory does not exist or not readable: ") 
					app_env_fail_reason.append(application_home_directory)
				else
					-- find config file in home directory (defaults to current dir)
					-- config file name "name_of_app.cfg" unless alternatively specified with "-cfg" option
					fname := application_home_directory.twin
					if fname.item(fname.count) /= os_directory_separator then
						fname.extend(os_directory_separator)
					end

					-- see if a config file name was supplied on the command line
					cfg_name := execution_environment.command_line.separate_word_option_value("cfg")
					if cfg_name = Void or else cfg_name.is_empty then
						-- try file named after this app
						create a_file.make(fname + app_name + ".cfg")
						if a_file.exists then
							fname.append(app_name + ".cfg")
						else
							fname.append(Default_cfg_file_name)
						end
					end

					debug("app")
						io.put_string("Using config file " + fname + "%N")
					end
		    
					app_cfg_file_name.copy(fname)
	
					-- read in resources
					initialise_resource_config_file_name(app_cfg_file_name)
					if not resource_config_file.is_valid then
						app_env_fail_reason.append(resource_config_file.fail_reason)
					end
				end
			end
		end

feature -- Application Resources

	app_cfg_file_name:STRING is 
		once 
			create Result.make(0)
			Result.append(Default_cfg_file_name)
		end

feature -- Resource Configuration

	app_cmd_line_option_sign:CHARACTER is 
		once
			Result := Default_cmd_line_option_sign
		end

	app_home_env_varname:STRING is 
		once
			create Result.make(0)
			Result.append(Default_home_env_varname)
		end

	app_cfg_file_cmt_char:CHARACTER is 
		once 
			Result := Default_cfg_file_cmt_char
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
--| The Original Code is file_app_environment.e.
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
