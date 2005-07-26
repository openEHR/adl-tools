indexing
	component:   "openEHR Data Types"

	description: "Implementation of DV_PARTIAL_DATE_TIME"
	keywords:    "date, time"

	requirements:"ISO 18308 TS V1.0 STR 3.8"
	design:      "openEHR Data Types Reference Model 1.8"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class DV_PARTIAL_DATE_TIME

inherit
	DV_DATE_TIME
		redefine
			magnitude, as_string
		end

feature -- Access

	month_known: BOOLEAN	
			-- Indicates whether month in year is known.

	day_known: BOOLEAN	
			-- Indicates whether day in month is known.

	hour_known: BOOLEAN	
			-- Indicates whether hour in day is known.

	minute_known: BOOLEAN	
			-- Indicates whether minute in hour is known.

	magnitude: DOUBLE_REF is	
			-- canonical value of enclosing_interval.midpoint.
		do
		ensure then
			Result = enclosing_interval.midpoint.magnitude
		end

	enclosing_interval: DV_INTERVAL[DV_DATE_TIME] is
		do
		end

feature -- Output

	as_string: STRING is
			-- Result has form “yyyy-MM-dd hh:mm:??” where MM, dd, hh and mm might be “??”	Result = follows ISO 8601
		do
		end

invariant
	Month_known_validity: not month_known implies not day_known
	Day_known_validity: not day_known implies not hour_known
	Hour_known_validity: not hour_known implies not minute_known
	Enclosing_interval: month_known implies enclosing_interval.lower.day = 1 and 
		enclosing_interval.upper.day = days_in_month(month, year) and 
		not month_known implies enclosing_interval.lower.month = 1 and 
		enclosing_interval.upper.month = Months_in_year and 
		enclosing_interval.lower.day = 1 and 
		enclosing_interval.upper.day = days_in_month(Months_in_year, year) and
		minute_known implies enclosing_interval.lower.second = 1 and 
		enclosing_interval.upper.second = Seconds_in_minute and
		not minute_known implies enclosing_interval.lower.minute = 1 and 
		enclosing_interval.upper.minute = Minutes_in_hour and 
		enclosing_interval.lower.second = 1 and 
		enclosing_interval.upper.second = Seconds_in_minute	

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
--| The Original Code is dv_partial_date.e.
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
