indexing
	component:   "openEHR re-usable library"
	description: "[
				ISO8601:2004 compliant Date/Time class, including facility to represent 
				partial date/times (called 'reduced accuracy' in the standard).
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
			String_valid: str /= Void and is_valid_iso8601_date_time(str)
		do
			if is_valid_iso8601_date_time(str) then
				deep_copy(iso8601_parser.cached_iso8601_date_time)
			end
		end

	make_date_time(a_date: ISO8601_DATE; a_time: ISO8601_TIME) is
			-- create from date and time parts
		require
			Date_valid: a_date /= Void
			Partial_validity: a_date.is_partial implies a_time = Void
			Extended_validity: a_time /= Void implies (a_date.is_extended = a_time.is_extended)
		do
			date_part := a_date
			time_part := a_time
		end
		
feature -- Access

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
	
	hours: INTEGER is
		do
			if time_part /= Void then
				Result := time_part.hours
			end
		end

	minutes: INTEGER is
		do
			if time_part /= Void then
				Result := time_part.minutes
			end
		end

	seconds: INTEGER is
		do
			if time_part /= Void then
				Result := time_part.minutes
			end
		end

	seconds_fraction: DOUBLE is
		do
			if time_part /= Void then
				Result := time_part.seconds_fraction
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

	hours_unknown: BOOLEAN is
			-- True if hours unknown
		do
			Result := time_part = Void
		end

	minutes_unknown: BOOLEAN is
			-- True if minutes unknown
		do
			Result := (time_part /= Void and time_part.minutes_unknown)
		end

	seconds_unknown: BOOLEAN is
			-- True if seconds unknown
		do
			Result := (time_part /= Void and time_part.seconds_unknown)
		end

	seconds_fraction_included: BOOLEAN is
			-- True if seconds unknown
		do
			Result := (time_part /= Void and time_part.seconds_fraction_included)
		end

	is_partial: BOOLEAN is
			-- True if either date or month unknown
		do
			Result := seconds_unknown
		end

feature -- Comparison

	infix "<" (other: like Current): BOOLEAN is
			-- Is current object less than `other'?
		do
		end

feature -- Output

	as_string: STRING is
			-- express as ISO8601 format string
		do
			create Result.make(0)
			Result.append(date_part.as_string)
			if time_part /= Void then
				Result.append(time_part.as_string)			
			end
		end
			
	out: STRING is
		do
			Result := as_string
		end
		
feature {NONE} -- Implementation

	date_part: ISO8601_DATE
	
	time_part: ISO8601_TIME
	
invariant
	Year_valid: year >= 0
	Month_valid: month >= 1 and month <= Months_in_year
	Day_valid: day >= 1 and day <= days_in_month(month, year)

	Hours_valid: hours >= 0 and hours <= Hours_in_day
	Hour_limit_minutes_validity: hours = Hours_in_day and not minutes_unknown implies minutes = 0
	Hour_limit_seconds_validity: hours = Hours_in_day and not seconds_unknown implies (seconds = 0 and seconds_fraction = 0.0)
	Minutes_valid: not minutes_unknown implies (minutes >= 0 and minutes < Minutes_in_hour)
	Seconds_valid: not seconds_unknown implies (seconds >= 0 and seconds < Seconds_in_minute)
	Fine_seconds_valid: seconds_fraction >= 0 and seconds_fraction < 1.0
	
	Partial_validity_month: month_unknown implies day_unknown
	Partial_validity_day: day_unknown implies hours_unknown
	Partial_validity_hours: hours_unknown implies minutes_unknown
	Partial_validity_minutes: minutes_unknown implies seconds_unknown
		
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
