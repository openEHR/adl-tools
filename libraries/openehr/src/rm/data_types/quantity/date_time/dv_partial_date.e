indexing
	component:   "openEHR Data Types"

	description: "Implementation of DV_PARTIAL_DATE"
	keywords:    "date, time"

	requirements:"ISO 18308 TS V1.0 STR 3.8"
	design:      "openEHR Data Types Reference Model 7.3.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2005 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class DV_PARTIAL_DATE

inherit
	DV_DATE
		redefine
			magnitude, as_string
		end

feature -- Access

	month_known: BOOLEAN
			-- Indicates whether month in year is known. If so, the date 
			-- is of the form y/m/?, if not, it is of the form y/?/

	magnitude: INTEGER_REF is
		do
		ensure then
			Result = enclosing_interval.midpoint.magnitude
		end

	enclosing_interval: DV_INTERVAL[DV_DATE] is
			-- note that midpoint is available from Result.midpoint
		do
		ensure
			month_known implies Result.lower.day = 1 and Result.upper.day = days_in_month(month, year)
			not month_known implies Result.lower.month = 1 and Result.upper.month = Months_in_year and 
				Result.lower.day = 1 and Result.upper.day = days_in_month(Months_in_year, year) 
		end

feature -- Output

	as_string: STRING is
			-- Result has form “yyyy-MM-??” where MM, dd might be “??”	Result = follows ISO 8601
		do
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
