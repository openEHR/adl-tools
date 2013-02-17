note
	component:   "openEHR Reusable Libraries"
	description: "Error descriptor abstraction"
	keywords:    "error status reporting"

	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class ERROR_DESCRIPTOR

inherit
	ERROR_SEVERITY_TYPES

create
	make, make_error, make_warning, make_info, make_debug

feature -- Initialisation

	make_error (a_code, a_message: STRING; a_loc: detachable STRING)
		do
			make (a_code, error_type_error, a_message, a_loc)
		end

	make_warning (a_code, a_message: STRING; a_loc: detachable STRING)
		do
			make (a_code, error_type_warning, a_message, a_loc)
		end

	make_info (a_code, a_message: STRING; a_loc: detachable STRING)
		do
			make (a_code, error_type_info, a_message, a_loc)
		end

	make_debug (a_message: STRING; a_loc: detachable STRING)
		do
			make ("", error_type_debug, a_message, a_loc)
		end

	make (a_code: STRING; a_severity: INTEGER; a_message: STRING; a_loc: detachable STRING)
		require
			Severity_valid: is_valid_error_type (a_severity)
		do
			code := a_code
			severity := a_severity
			message := a_message
			location := a_loc
		end

feature -- Access

	code: STRING

	severity: INTEGER

	message: STRING

	location: detachable STRING

feature -- Output

	as_string: STRING
		do
			create Result.make_empty
			Result.append (error_type_name_table.item (severity) + " ")
			if attached location and not location.is_empty then
				Result.append (location + ": ")
			end
			Result.append ("(" + code + ") " + message)
		end

invariant
	is_valid_error_type (severity)

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
--| The Original Code is error_descriptor.e.
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


