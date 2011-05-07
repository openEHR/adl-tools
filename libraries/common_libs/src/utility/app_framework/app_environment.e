note
	component:   "openEHR Common Libraries"
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
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

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
