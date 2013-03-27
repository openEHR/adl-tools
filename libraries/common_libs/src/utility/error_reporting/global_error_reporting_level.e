note
	component:   "openEHR Project"
	description: "Global shared error reporting level"
	keywords:    "error reporting"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class GLOBAL_ERROR_REPORTING_LEVEL

inherit
	ERROR_SEVERITY_TYPES

feature -- Access

	global_error_reporting_level: INTEGER
			-- at this level and above, list entries are included in `as_string' and any other output function
		do
			Result := global_error_reporting_level_cell.item
		end

feature -- Status Setting

	set_global_error_reporting_level (a_level: INTEGER)
		require
			valid_error_level: is_valid_error_type (a_level)
		do
			global_error_reporting_level_cell.put (a_level)
		end

feature {NONE} -- Implementation

	global_error_reporting_level_cell: CELL [INTEGER]
		once
			create Result.put (Error_type_warning)
		end

invariant
	Valid_severity_reporting_level: is_valid_error_type (global_error_reporting_level)

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
--| The Original Code is error_accumulator.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2007
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
