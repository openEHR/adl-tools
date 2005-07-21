indexing
	component:   "openEHR re-usable library"
	description: "Date/time constants"
	keywords:    "date time"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class DATE_TIME_CONSTANTS

inherit
	DATE_CONSTANTS
	TIME_CONSTANTS
	
feature -- Definitions

	Default_time_format: STRING is "[0]hh:[0]mi:[0]ss"
			-- Example: "22:03:10"
	
	Default_date_format: STRING is "yyyy-[0]mm-[0]dd"
			-- Example: "1998-08-25"

	Middle_second_in_minute:INTEGER is 30

	Middle_minute_in_hour:INTEGER is 30

	Days_in_year: INTEGER is 365

	Middle_day_of_month: INTEGER is 15

	Middle_month_of_year: INTEGER is 6
	
	Last_day_of_middle_month: INTEGER is 30

	days_in_month(a_month, a_year:INTEGER):INTEGER is
			-- days in nth month
		require
			a_month > 0 and a_month < 12
		do
			Result := days_in_i_th_month(a_month, a_year)
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
--| The Original Code is date_time_constants.e.
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
