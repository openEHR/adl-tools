note
	component:   "openEHR Archetype Project"
	description: "Shared application resources for any ADL application, GUI or non-GUI"
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class SHARED_APP_RESOURCES

inherit
	SHARED_APP_CONFIG_FILE_ACCESS

	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

feature -- Definitions

	Error_db_directory: STRING
			-- directory of error database files in .dadl format e.g.
			-- .../error_db/dadl_errors.txt etc
		once
			Result := file_system.pathname (application_startup_directory, "error_db")
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
