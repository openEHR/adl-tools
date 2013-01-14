note
	component:   "openEHR re-usable library"
	description: "[
				ISO8601:2004 compliant Date/Time class, including facility to represent 
				partial date/times (called 'reduced accuracy' in the standard).
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

class ISO8601_DATE_TIME

inherit
	ISO8601_ROUTINES
		export
			{NONE} all;
			{ANY} valid_iso8601_date_time
		undefine
			is_equal, out, default_create
		end

	COMPARABLE
		redefine
			out, default_create
		end

create
	make_from_string, make_date_and_time, make_date_time, default_create

convert
	make_date_time ({DATE_TIME}),
	to_date_time: {DATE_TIME}

feature -- Initialisation

	default_create
		do
			make_date_time (create {DATE_TIME}.make_now)
		end

	make_from_string (str: STRING)
			-- make from any valid ISO date/time string
		require
			String_valid: valid_iso8601_date_time(str)
		do
			make_date_time (create {DATE_TIME}.make_now)
			if valid_iso8601_date_time(str) then
				date_part := iso8601_parser.cached_iso8601_date_time.date_part.deep_twin
				time_part := iso8601_parser.cached_iso8601_date_time.time_part.deep_twin
			end
		end

	make_date_and_time (a_date: ISO8601_DATE; a_time: detachable ISO8601_TIME)
			-- create from date and time parts
		require
			Date_validity: not a_date.is_partial
			Extended_validity: attached a_time as tm implies (a_date.is_extended = tm.is_extended)
		do
			date_part := a_date
			time_part := a_time
			value := as_string
		end

	make_date_time (a_dt: DATE_TIME)
			-- make from a DATE_TIME object
		do
			make_date_and_time (create {ISO8601_DATE}.make_date(a_dt.date), create {ISO8601_TIME}.make_time(a_dt.time))
		end

feature -- Access

	value: STRING
			-- ISO8601 string for date/time; always equal to result of as_string

	year: INTEGER
		do
			Result := date_part.year
		end

	month: INTEGER
		do
			Result := date_part.month
		end

	day: INTEGER
		do
			Result := date_part.day
		end

	hour: INTEGER
		do
			if attached time_part as tp then
				Result := tp.hour
			end
		end

	minute: INTEGER
		do
			if attached time_part as tp then
				Result := tp.minute
			end
		end

	second: INTEGER
		do
			if attached time_part as tp then
				Result := tp.minute
			end
		end

	fractional_second: DOUBLE
		do
			if attached time_part as tp then
				Result := tp.fractional_second
			end
		end

	timezone: detachable ISO8601_TIMEZONE
		do
			if attached time_part as tp then
				Result := tp.timezone
			end
		end

feature -- Status Report

	is_extended: BOOLEAN
			-- True if syntax format uses separators

	month_unknown: BOOLEAN
			-- True if month is unknown
		do
			Result := date_part.month_unknown
		end

	day_unknown: BOOLEAN
			-- True if date is unknown
		do
			Result := date_part.day_unknown
		end

	hour_unknown: BOOLEAN
			-- True if hour unknown
		do
			Result := time_part = Void
		end

	minute_unknown: BOOLEAN
			-- True if minute unknown
		do
			Result := attached time_part as tp and then tp.minute_unknown
		end

	second_unknown: BOOLEAN
			-- True if second unknown
		do
			Result := attached time_part as tp and then tp.second_unknown
		end

	has_fractional_second: BOOLEAN
			-- True if second fraction incuded
		do
			Result := attached time_part as tp and then tp.has_fractional_second
		end

	is_partial: BOOLEAN
			-- True if either date or month unknown
		do
			Result := second_unknown
		end

feature -- Comparison

	is_less alias "<" (other: like Current): BOOLEAN
			-- Is current object less than `other'?
		do
			Result := to_seconds < other.to_seconds
		end

feature -- Conversion

	to_seconds: DOUBLE
			-- date/time as a number of days since origin point of 1600-01-01
		do
			Result := date_part.to_days * seconds_in_day + time_part.to_seconds
		end

	to_date_time: DATE_TIME
			-- convert to DATE_TIME object
		do
			create Result.make_by_date_time (date_part.to_date, time_part.to_time)
		end

feature -- Output

	as_string: STRING
			-- express as ISO8601 format string
		do
			create Result.make(0)
			Result.append (date_part.as_string)
			if attached time_part as tp then
				Result.append_character (Time_leader)
				Result.append (tp.as_string)
			end
		ensure
			valid_iso8601_date_time (Result)
		end

	out: STRING
		do
			Result := as_string
		end

feature {ISO8601_DATE_TIME} -- Implementation

	date_part: ISO8601_DATE
		attribute
			create Result.make_date (create {DATE}.make_now)
		end

	time_part: detachable ISO8601_TIME

invariant
	Year_valid: valid_year(year)
	Month_valid: valid_month(month)
	Day_valid: valid_day(year, month, day)

	Hour_valid: valid_hour(hour, minute, second)
	Minute_valid: not minute_unknown implies valid_minute(minute)
	Seconds_valid: not second_unknown implies valid_second(second)
	Fractional_second_valid: has_fractional_second implies (not second_unknown and valid_fractional_second(fractional_second))

	Partial_validity_month: not month_unknown
	Partial_validity_day: not day_unknown
	Partial_validity_hour: not hour_unknown
	Partial_validity_minute: minute_unknown implies second_unknown

	Value_validity: value.is_equal(as_string)

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
