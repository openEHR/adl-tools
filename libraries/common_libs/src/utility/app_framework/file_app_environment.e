note
	component:   "openEHR Common Library"
	description: "Implementation of APP_ENVIRONMENT using text config file."
	keywords:    "framework"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005,2006 openEHR Foundation"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

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
				create resource_config_file.make (path)

				if not resource_config_file.is_valid then
					app_env_fail_reason.append (resource_config_file.fail_reason)
				end
			end
		end

feature {NONE} -- Resource Configuration

	resource_config_file: INI_CONFIG_FILE_ACCESS

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
