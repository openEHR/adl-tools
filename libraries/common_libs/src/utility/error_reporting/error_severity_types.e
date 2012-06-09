note
	component:   "openEHR Reusable Libraries"
	description: "[
			     Enumeration of message types
				 ]"
	keywords:    "error status reporting"

	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class ERROR_SEVERITY_TYPES

feature -- Definitions

	Error_type_debug: INTEGER = 9000
	Error_type_info: INTEGER = 9001
	Error_type_warning: INTEGER = 9002
	Error_type_error: INTEGER = 9003

	Error_type_debug_name: STRING = "DEBUG"
	Error_type_info_name: STRING = "INFO"
	Error_type_warning_name: STRING = "WARNING"
	Error_type_error_name: STRING = "ERROR"

feature -- Access

	error_type_name_table: HASH_TABLE [STRING, INTEGER]
			-- names of message types keyed by error type code
		once
			create Result.make(0)
			Result.force (Error_type_error_name, Error_type_error)
			Result.force (Error_type_warning_name, Error_type_warning)
			Result.force (Error_type_info_name, Error_type_info)
			Result.force (Error_type_debug_name, Error_type_debug)
		end

	error_type_id_table: HASH_TABLE [INTEGER, STRING]
			-- codes of message types keyed by message type name
		once
			create Result.make(0)
			Result.force (Error_type_error, Error_type_error_name)
			Result.force (Error_type_warning, Error_type_warning_name)
			Result.force (Error_type_info, Error_type_info_name)
			Result.force (Error_type_debug, Error_type_debug_name)
		end

	error_type_names: ARRAYED_LIST [STRING]
			-- names of message types
		once
			create Result.make(0)
			Result.compare_objects
			Result.force (Error_type_error_name)
			Result.force (Error_type_warning_name)
			Result.force (Error_type_info_name)
			Result.force (Error_type_debug_name)
		end

feature -- Status Report

	is_valid_error_type (i: INTEGER): BOOLEAN
		do
			Result := i >= Error_type_debug and i <= Error_type_error
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
--| The Original Code is error_status.e.
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


