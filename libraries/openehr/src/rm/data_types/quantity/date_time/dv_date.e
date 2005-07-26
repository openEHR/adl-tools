indexing
	component:   "openEHR Data Types"

	description: "Implementation of DV_DATE"
	keywords:    "date, time"

	requirements:"ISO 18308 TS V1.0 STR 3.7"
	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class DV_DATE

inherit
	DV_CUSTOMARY_QUANTITY
		redefine
			default_create, is_equal, infix "<"
		end
		
	DATE_TIME_CONSTANTS
		export
			{NONE} all
		undefine
			default_create, is_equal
		end

create 
	default_create,
	make_now,
	make_from_string,
	make_from_canonical_string,
	make_day_month_year

feature -- Initialization

	default_create is
			-- create the date "1800-01-01"
		do
			create impl.make_from_string ("1800-01-01", Default_date_format)
		ensure then
			default: as_string.is_equal ("1800-10-01")
		end

	make_now is
		do
			create impl.make_now
		end
		
	make_day_month_year (d, m, y: INTEGER) is
			-- Set `day', `month' and `year' to `d', `m' and `y' respectively.
		do
			create impl.make (y, m, d)
		end


	make_from_string (str: STRING) is
			-- make from string using specified format
		do
			create impl.make_from_string (str, Default_date_format)
		end

	make_from_canonical_string (str: STRING) is
			-- make from string from canonical form
		do
		end

feature -- Status Report

	valid_canonical_string(str: STRING): BOOLEAN is
			-- True if str contains required tags
		do
		end

feature -- Access

	magnitude: INTEGER_REF is
			-- numeric value of the quantity
		do
			create Result
			Result.set_item(impl.duration.days_count * Seconds_in_day)
		end

	day: INTEGER is
		do
			Result := impl.day
		end

	month: INTEGER is
		do
			Result := impl.month
		end

	year: INTEGER is
		do
			Result := impl.year
		end
		
	diff_type: DV_DURATION
		
feature -- Comparison

	infix "<" (other: like Current): BOOLEAN is
			-- Is the current duration smaller than `other'?
		do
			Result := impl < other.impl
		end

	is_equal (other: like Current): BOOLEAN is
			-- Are the current duration an `other' equal?
		do
			Result := impl.is_equal (other.impl)
		end

	is_valid_date(y, m, d:INTEGER):BOOLEAN is
			-- is time valid in gregorian calendar?
		do
			Result := impl.is_correct_date(y, m, d)
		end

	is_strictly_comparable_to (other: like Current): BOOLEAN is
		do
			Result := True
		end

feature -- Basic Operations

	infix "+" (other: like diff_type): like Current is
		do
			impl := impl + other.impl.date
		end

	infix "-" (other: like diff_type): like Current is
		do
			-- impl := impl - other.impl.date
		end

feature -- Conversion

	to_quantity: DV_QUANTITY is
			-- convert to a number of days
		do
		end

feature -- Output

	as_string: STRING is
		do
			Result := impl.formatted_out (Default_date_format)
		end

	as_canonical_string: STRING is
		do
			Result := as_string
		end

feature {DV_DATE, DV_DATE_TIME} -- Implementation

	impl: DATE
	
invariant
	
	Validity: is_valid_date(year, month, day)
	
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
--| The Original Code is dv_date.e.
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
