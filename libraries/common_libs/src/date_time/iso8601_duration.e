note
	component:   "openEHR re-usable library"
	description: "[
				ISO8601:2004 compliant Duration class. Handles patterns of form:
					PnW			-- duration in weeks
					P[nY][nM][nD][T[nH][nM][nS]]
				Pre-parsed and parsed forms of the date are included as attributes. 
				Typically the string form is required for presistent storage, but the
				parsed attributes are required for computation (and should not be 
				repeatedly recomputed on the fly, due to the amount of work involved).
				]"
	keywords:    "date, time, duration"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006- The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

class ISO8601_DURATION

inherit
	ISO8601_ROUTINES
		export
			{NONE} all;
			{ANY} valid_iso8601_duration
		undefine
			is_equal, default_create, out
		end

	COMPARABLE
		redefine
			default_create, out
		end

create
	make, make_from_string, make_date_time_duration, default_create

convert
	make_date_time_duration ({DATE_TIME_DURATION}),
	to_date_time_duration: {DATE_TIME_DURATION}

feature -- Definitions

	Default_zero_value: STRING = "PT0S"

feature {NONE} -- Initialisation

	default_create
		do
			make_from_string (Default_zero_value)
		end

	make_from_string (str: STRING)
			-- Make from a valid ISO duration string.
		require
			str_valid_duration: valid_iso8601_duration (str)
		do
			if valid_iso8601_duration (str) then
				days := iso8601_parser.cached_iso8601_duration.days
				months := iso8601_parser.cached_iso8601_duration.months
				weeks := iso8601_parser.cached_iso8601_duration.weeks
				years := iso8601_parser.cached_iso8601_duration.years
				seconds := iso8601_parser.cached_iso8601_duration.seconds
				minutes := iso8601_parser.cached_iso8601_duration.minutes
				hours := iso8601_parser.cached_iso8601_duration.hours
				fractional_seconds := iso8601_parser.cached_iso8601_duration.fractional_seconds
				has_time := iso8601_parser.cached_iso8601_duration.has_time
			end

			if is_zero then
				value := str.twin
			else
				value := as_string
			end
		ensure
			value_when_zero: is_zero implies value.is_equal (str)
		end

	make (yr, mo, wk, dy, hr, mi, sec: INTEGER; sec_frac: DOUBLE)
			-- Make from parts; any part can be zero.
		require
			years_valid: yr >= 0
			months_valid: mo >= 0
			weeks_valid: wk >= 0
			days_valid: dy >= 0
			hours_valid: hr >= 0
			minutes_valid: mi >= 0
			seconds_valid: sec >= 0
			seconds_fraction_valid: sec_frac >= 0.0 and sec_frac < 1.0
		do
			years := yr
			months := mo
			weeks := wk
			days := dy
			hours := hr
			minutes := mi
			seconds := sec
			fractional_seconds := sec_frac
			has_time := hours > 0 or minutes > 0 or seconds > 0 or fractional_seconds > 0.0
			value := as_string
		end

	make_date_time_duration (a_dur: DATE_TIME_DURATION)
			-- make from a DATE_TIME_DURATION object
		do
			make (a_dur.year, a_dur.month, 0, a_dur.day, a_dur.hour, a_dur.minute,
				a_dur.second, a_dur.fine_second)
		end

feature -- Access

	value: STRING
			-- ISO8601 string form of duration, always synchronised with as_string

	years: INTEGER
			-- extracted year count

	months: INTEGER
			-- extracted month count

	weeks: INTEGER
			-- extracted week count

	days: INTEGER
			-- extracted day count

	hours: INTEGER
			-- extracted hour count

	minutes: INTEGER
			-- extracted minute count

	seconds: INTEGER
			-- extracted second count

	fractional_seconds: DOUBLE
			-- extracted fractional seconds

	sign: INTEGER
			-- sign of duration; value is +1 or -1

feature -- Status Report

	has_time: BOOLEAN
			-- True if any hms component present

	is_zero: BOOLEAN
			-- True if total value is zero
		do
			Result := weeks = 0 and years + months + days + hours + minutes + seconds = 0 and fractional_seconds = 0.0
		end

feature -- Comparison

	is_less alias "<" (other: like Current): BOOLEAN
			-- Is current object less than `other'?
		do
			Result := to_seconds < other.to_seconds
		end

feature -- Output

	as_string: STRING
			-- output as ISO8601 duration string
		local
			sec_frac_str: STRING
		do
			Result := Duration_leader.out

			if is_zero then
				Result := Default_zero_value
			else
				if years /= 0 then
					Result.append (years.out + "Y")
				end

				if months /= 0 then
					Result.append (months.out + "M")
				end

				if weeks /= 0 then
					Result.append (weeks.out + "W")
				end

				if days /= 0 then
					Result.append (days.out + "D")
				end

				if has_time then
					Result.append_character (Time_leader)

					if hours /= 0 then
						Result.append (hours.out + "H")
					end

					if minutes /= 0 then
						Result.append (minutes.out + "M")
					end

					if seconds /= 0 then
						Result.append (seconds.out)

						if fractional_seconds > 0.0 then
							Result.append_character (iso8601_decimal_separator)
							sec_frac_str := fractional_seconds.out
							Result.append (sec_frac_str.substring (sec_frac_str.index_of (decimal_separator, 1) + 1, sec_frac_str.count))
						end

						Result.append ("S")
					end
				end
			end
		ensure
			valid: valid_iso8601_duration (Result)
		end

	out: STRING
		do
			Result := as_string
		end

feature -- Conversion

	to_seconds: DOUBLE
			-- convert to signed numeric form for comparison. The result is a number of seconds.
			-- If there are months, the value is based on an average number of seconds per month and
			-- is therefore slightly statistical
		do
			Result := (((years  + months/months_in_year) * days_in_4_years/4) + weeks * days_in_week + days) * seconds_in_day +
				hours * seconds_in_hour + minutes * seconds_in_minute + seconds
			Result := Result + fractional_seconds -- (Double-precision fp operation)
		end

	to_date_time_duration: DATE_TIME_DURATION
			-- convert to DATE_TIME_DURATION object
		do
			if weeks > 0 then
				create Result.make_definite (weeks * Days_in_week, 0, 0, 0)
			else
				create Result.make_fine (years, months, days, hours, minutes, seconds + fractional_seconds)
			end
		end

	to_definite_date_time_duration: DATE_TIME_DURATION
			-- convert to definite DATE_TIME_DURATION object (will be slightly approximate)
		do
			if weeks > 0 then
				create Result.make_definite (weeks * Days_in_week, 0, 0, 0)
			else
				create Result.make_definite (years * days_in_year + months * days_in_month (1, 1900) + days, hours, minutes, seconds)
			end
		end

invariant
	years_valid: years >= 0
	months_valid: months >= 0
	weeks_valid: weeks >= 0
	days_valid: days >= 0
	hours_valid: hours >= 0
	minutes_valid: minutes >= 0
	seconds_valid: seconds >= 0
	fractional_second_valid: fractional_seconds >= 0.0 and fractional_seconds < 1.0

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
