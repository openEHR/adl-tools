note
	component:   "openEHR Reusable Libraries"
	description: "[
			     Enumeration of message types
				 ]"
	keywords:    "error status reporting"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2005- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

deferred class BILLBOARD_MESSAGE_TYPES

feature -- Definitions

	Message_type_debug: INTEGER = 9000
	Message_type_info: INTEGER = 9001
	Message_type_warning: INTEGER = 9002
	Message_type_error: INTEGER = 9003

feature -- Access

	message_type_names: HASH_TABLE [STRING, INTEGER]
			-- names of message types
		once
			create Result.make(0)
			Result.force("ERROR", Message_type_error)
			Result.force("WARNING", Message_type_warning)
			Result.force("INFO", Message_type_info)
			Result.force("DEBUG", Message_type_debug)
		end

	message_type_ids: HASH_TABLE [INTEGER, STRING]
			-- ids of message types
		once
			create Result.make(0)
			Result.force(Message_type_error, "ERROR")
			Result.force(Message_type_warning, "WARNING")
			Result.force(Message_type_info, "INFO")
			Result.force(Message_type_debug, "DEBUG")
		end

feature -- Status Report

	is_valid_message_type(i: INTEGER): BOOLEAN
		do
			Result := i >= Message_type_debug and i <= Message_type_error
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


