note
	component:   "openEHR re-usable library"
	description: "[
				ISO8601:2004 compliant Date class, including facility to represent 
				partial dates (called 'reduced accuracy' in the standard). This class
				uses  a standard library DATE class to represent the date
				value for the purpose of mathematical operations and validity
				checking.
				Pre-parsed and parsed forms of the date are included as attributes. 
				Typically the string form is required for presistent storage, but the
				parsed attributes are required for computation (and should not be 
				repeatedly recomputed on the fly, due to the amount of work involved).
				]"
	keywords:    "date time"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006- The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

class ISO8601_DATE

inherit
	ISO8601_ROUTINES
		export
			{NONE} all;
			{ANY} valid_iso8601_date, valid_year, valid_month, valid_day
		undefine
			is_equal, out, default_create
		end

	COMPARABLE
		redefine
			out, default_create
		end

create
	make_from_string, make_y, make_ym, make_ymd, make_date, default_create

convert
	make_date ({DATE}),
	to_date: {DATE}

feature -- Initialisation

	default_create
		do
			make_date (create {DATE}.make_now)
		end

	make_from_string (str: STRING)
			-- make from any valid ISO date string
		require
			String_valid: valid_iso8601_date(str)
		do
			make_date (create {DATE}.make_now)
			if valid_iso8601_date (str) and then attached iso8601_parser.cached_iso8601_date as dt then
				deep_copy (dt)
			end
		end

	make_y (y: INTEGER; is_extended_flag: BOOLEAN)
			-- make from year only
		require
			Year_valid: valid_year(y)
		do
			year := y
			month_unknown := True
			day_unknown := True
			is_extended := is_extended_flag
			value := as_string
		ensure
			month_unknown
			day_unknown
		end

	make_ym (y, m: INTEGER; is_extended_flag: BOOLEAN)
			-- make from year, month
		require
			Year_valid: valid_year(y)
			Valid_month: valid_month(m)
		do
			year := y
			month := m
			day_unknown := True
			is_extended := is_extended_flag
			value := as_string
		ensure
			day_unknown
		end

	make_ymd (y, m, d: INTEGER; is_extended_flag: BOOLEAN)
			-- make from year, month day
		require
			Year_valid: valid_year(y)
			Valid_month: valid_month(m)
			Valid_day: valid_day(y, m, d)
		do
			year := y
			month := m
			day := d
			is_extended := is_extended_flag
			value := as_string
		end

	make_date (a_date: DATE)
			-- make into string of ISO8601 format "YYYY-MM-DD"
		do
			make_ymd (a_date.year, a_date.month, a_date.day, True)
		end

feature -- Access

	value: STRING
			-- ISO8601 string for date; always equal to result of as_string

	year: INTEGER
			-- extracted year

	month: INTEGER
			-- extracted month

	day: INTEGER
			-- extracted day

feature -- Status Report

	is_extended: BOOLEAN
			-- True if syntax format uses separators

	month_unknown: BOOLEAN
			-- True if month is unknown

	day_unknown: BOOLEAN
			-- True if date is unknown

	is_partial: BOOLEAN
			-- True if either date or month unknown
		do
			Result := day_unknown
		end

feature -- Comparison

	is_less alias "<" (other: like Current): BOOLEAN
			-- Is current object less than `other'?
		do
			Result := to_days < other.to_days
		end

feature -- Conversion

	to_days: INTEGER
			-- convert to numeric form for comparison. Value is days since 1600-01-01, and
			-- may be negative. Uses Eiffel Software DATE.days to compute.
			-- For other alternative, see gobo KL_GREGORIAN_CALENDAR, but this uses 1970-01-01
			-- as origin and is not flexible!
			-- For missing parts, substitute mid point values.			
		local
			m, d: INTEGER
		do
			if day_unknown then
				if month_unknown then
					d := Last_day_of_middle_month
					m := middle_month_of_year
				else
					m := month
					d := middle_day_of_month
				end
			else
				d := day
				m := month
			end

			Result := (create {DATE}.make(year, m, d)).days
		end

	to_date: DATE
			-- convert to DATE type
		local
			y, m, d: INTEGER
		do
			y := year
			if day_unknown then
				if month_unknown then
					m := Middle_month_of_year
					d := Last_day_of_middle_month
				else
					m := month
					d := Middle_day_of_month
				end
			else
				m := month
				d := day
			end
			create Result.make(y, m, d)
		end

feature -- Output

	as_string: STRING
			-- express as string of ISO8601 format
		local
			s: STRING
		do
			create Result.make(0)
			Result.append (year.out)

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
			Result_valid: valid_iso8601_date(Result)
		end

	out: STRING
		do
			Result := as_string
		end

invariant
	Year_valid: valid_year (year)
	Month_valid: not month_unknown implies valid_month (month)
	Day_valid: not day_unknown implies valid_day (year, month, day)

	Partial_validity: month_unknown implies day_unknown

	Value_validity: value.is_equal (as_string)

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
