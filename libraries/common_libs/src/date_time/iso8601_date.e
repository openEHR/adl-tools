indexing
	component:   "openEHR re-usable library"
	description: "[
				ISO8601:2004 compliant Date class, including facility to represent 
				partial dates (called 'reduced accuracy' in the standard). This class
				uses  a standard library DATE class to represent the date
				value for the purpose of mathematical operations and validity
				checking.
				]"
	keywords:    "date time"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ISO8601_DATE

inherit
	ISO8601_ROUTINES
		undefine
			is_equal, out
		end
	
	COMPARABLE
		redefine
			out
		end
	
create
	make_from_string, make_y, make_ym, make_ymd
	
feature -- Initialisation

	make_from_string(str: STRING) is
			-- make from any valid ISO date string
		require
			String_valid: str /= Void and is_valid_iso8601_date(str)
		do
			if is_valid_iso8601_date(str) then
				deep_copy(iso8601_parser.cached_iso8601_date)
			end
		end

	make_y(y: INTEGER; is_extended_flag: BOOLEAN) is
			-- make from year only
		require
			Year_valid: y >= 0
		do
			year := y
			month_unknown := True
			day_unknown := True
			is_extended := is_extended_flag
		ensure
			month_unknown
			day_unknown
		end

	make_ym(y, m: INTEGER; is_extended_flag: BOOLEAN) is
			-- make from year, month
		require
			Year_valid: y >= 0
			Valid_month: m >= 1 and m <= Months_in_year
		do
			year := y
			month := m
			day_unknown := True
			is_extended := is_extended_flag
		ensure
			day_unknown
		end

	make_ymd(y, m, d: INTEGER; is_extended_flag: BOOLEAN) is
			-- make from year, month day
		require
			Year_valid: y >= 0
			Valid_month: m >= 1 and m <= Months_in_year
			Valid_day: d >= 1 and d <= days_in_month(m, y)
		do
			year := y
			month := m
			day := d
			is_extended := is_extended_flag
		end
		
feature -- Access

	year: INTEGER
	
	month: INTEGER
	
	day: INTEGER
	
feature -- Status Report

	is_extended: BOOLEAN
			-- True if syntax format uses separators
			
	month_unknown: BOOLEAN
			-- True if month is unknown

	day_unknown: BOOLEAN
			-- True if date is unknown

	is_partial: BOOLEAN is
			-- True if either date or month unknown
		do
			Result := day_unknown
		end

feature -- Comparison

	infix "<" (other: like Current): BOOLEAN is
			-- Is current object less than `other'?
		do
		end

feature -- Output

	as_string: STRING is
			-- express as string of ISO8601 format
		local
			s: STRING
		do
			create Result.make(0)
			Result.append(year.out)

			if not month_unknown then
				if is_extended then
					Result.append_character(Date_separator)			
				end
				s := month.out
				if s.count = 1 then
					Result.append_character ('0')
				end
				Result.append(s)
				
				if not day_unknown then
					if is_extended then
						Result.append_character(Date_separator)			
					end
					s := day.out
					if s.count = 1 then
						Result.append_character ('0')
					end
					Result.append(s)					
				end
			end			
		ensure
			Result_valid: Result /= Void and then is_valid_iso8601_date(Result)				
		end

	out: STRING is
		do
			Result := as_string
		end
		
invariant
	Year_valid: year >= 0
	Month_valid: not month_unknown implies (month >= 1 and month <= Months_in_year)
	Day_valid: not day_unknown implies (day >= 1 and day <= days_in_month(month, year))
	Partial_validity: month_unknown implies day_unknown
		
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
--| The Original Code is date_time_routines.e.
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
