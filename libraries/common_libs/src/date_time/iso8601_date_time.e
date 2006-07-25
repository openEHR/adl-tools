indexing
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

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ISO8601_DATE_TIME

inherit
	ISO8601_ROUTINES
		export
			{NONE} all;
			{ANY} valid_iso8601_date_time
		undefine
			is_equal, out
		end
	
	COMPARABLE
		redefine
			out
		end
	
create
	make_from_string, make_date_time
	
feature -- Initialisation

	make_from_string(str: STRING) is
			-- make from any valid ISO date/time string
		require
			String_valid: str /= Void and valid_iso8601_date_time(str)
		do
			if valid_iso8601_date_time(str) then
				deep_copy(iso8601_parser.cached_iso8601_date_time)
			end
			value := as_string
		end

	make_date_time(a_date: ISO8601_DATE; a_time: ISO8601_TIME) is
			-- create from date and time parts
		require
			Date_valid: a_date /= Void
			Partial_validity: not a_date.is_partial
			Extended_validity: a_time /= Void implies (a_date.is_extended = a_time.is_extended)
		do
			date_part := a_date
			time_part := a_time
			value := as_string
		end
		
feature -- Access

	value: STRING
			-- ISO8601 string for date/time; always equal to result of as_string

	year: INTEGER is
		do
			Result := date_part.year
		end
	
	month: INTEGER is
		do
			Result := date_part.month
		end
	
	day: INTEGER is
		do
			Result := date_part.day
		end
	
	hour: INTEGER is
		do
			if time_part /= Void then
				Result := time_part.hour
			end
		end

	minute: INTEGER is
		do
			if time_part /= Void then
				Result := time_part.minute
			end
		end

	second: INTEGER is
		do
			if time_part /= Void then
				Result := time_part.minute
			end
		end

	fractional_second: DOUBLE is
		do
			if time_part /= Void then
				Result := time_part.fractional_second
			end
		end
	
	timezone: ISO8601_TIMEZONE is
		do
			if time_part /= Void then
				Result := time_part.timezone
			end
		end
			
feature -- Status Report

	is_extended: BOOLEAN
			-- True if syntax format uses separators
			
	month_unknown: BOOLEAN is
			-- True if month is unknown
		do
			Result := date_part.month_unknown
		end

	day_unknown: BOOLEAN is
			-- True if date is unknown
		do
			Result := date_part.day_unknown
		end

	hour_unknown: BOOLEAN is
			-- True if hour unknown
		do
			Result := time_part = Void
		end

	minute_unknown: BOOLEAN is
			-- True if minute unknown
		do
			Result := (time_part /= Void and time_part.minute_unknown)
		end

	second_unknown: BOOLEAN is
			-- True if second unknown
		do
			Result := (time_part /= Void and time_part.second_unknown)
		end

	has_fractional_second: BOOLEAN is
			-- True if second fraction incuded
		do
			Result := (time_part /= Void and time_part.has_fractional_second)
		end

	is_partial: BOOLEAN is
			-- True if either date or month unknown
		do
			Result := second_unknown
		end

feature -- Comparison
	
	infix "<" (other: like Current): BOOLEAN is
			-- Is current object less than `other'?
		do
			Result := to_seconds < other.to_seconds
		end

feature -- Conversion

	to_seconds: DOUBLE is
			-- date/time as a number of days since origin point of 1600-01-01
		do
			Result := date_part.to_days * seconds_in_day + time_part.to_seconds
		end

feature -- Output

	as_string: STRING is
			-- express as ISO8601 format string
		do
			create Result.make(0)
			Result.append(date_part.as_string)
			if time_part /= Void then
				Result.append_character(Time_leader)
				Result.append(time_part.as_string)			
			end
		ensure
			valid_iso8601_date_time(Result)
		end
			
	out: STRING is
		do
			Result := as_string
		end
		
feature {ISO8601_DATE_TIME} -- Implementation

	date_part: ISO8601_DATE
	
	time_part: ISO8601_TIME
	
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
