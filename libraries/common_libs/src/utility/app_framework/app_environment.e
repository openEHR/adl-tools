indexing
	component:   "Deep Thought Reusable libraries"
	description: "[
				 Common access point operating environment resources.
	             Sources of resource settings are as follows:
	             	* environment variables
	             	* local $DEEP_HOME/xxx.cfg file
	             	* server host configuration server
	             These are all gathered at initialisation time and made available
	             through the app_resource_value() interface.
	             ]"
	keywords:    "config, resources"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"
	
deferred class APP_ENVIRONMENT

inherit
	SHARED_ACCESS

feature -- Definitions

	Default_cmd_line_option_sign:CHARACTER is '-'

	Default_home_env_varname:STRING is "DEEP_HOME"

	Default_cfg_file_name:STRING is "default.cfg"
			-- default config filename is name of app + ".cfg"

	Default_cfg_file_cmt_char:CHARACTER is ';'

feature --- Initiatialisation

	app_env_initialise is
			-- initialise the application environment; set
			-- 'app_env_fail_reason' if encountered problems
		deferred
		ensure
			Status_recorded: not app_env_is_valid implies not app_env_fail_reason.is_empty
		end

feature -- Application Resources

	app_cfg_file_name:STRING is 
			-- application config file full pathname
		deferred 
		end

	app_name:STRING is
			-- name of application (no path or ".exe")
		local
			startpos, endpos:INTEGER
		once
			Result := execution_environment.command_line.command_name
			endpos := Result.substring_index(".exe", 1) - 1
			if endpos < 0 then
				endpos := Result.count
			end
			startpos := Result.last_index_of(os_directory_separator, endpos) + 1
			Result := Result.substring(startpos, endpos)
		ensure
			Result_exists: Result /= Void
		end

feature -- Resource Configuration

	app_cmd_line_option_sign:CHARACTER is 
		deferred
		end

	app_home_env_varname:STRING is 
		deferred
		end

	app_cfg_file_cmt_char:CHARACTER is 
		deferred 
		end

feature -- Environment Status

	app_env_is_valid: BOOLEAN is
	        -- if not True, look at app_init_fail_reason
	    do
	        Result := app_env_fail_reason.is_empty
	    end

	app_env_fail_reason: STRING is
 	    once
	        create Result.make(0)
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
--| The Original Code is app_environment.e.
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
