indexing
	component:   "openEHR re-usable library"
	description: "[
				ISO8601:2004 compliant Duration class.
				]"
	keywords:    "date, time, duration"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ISO8601_DURATION

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
	make, make_from_string
	
feature -- Initialisation

	make_from_string(str: STRING) is
			-- make from a valid ISO duration string
		require
			String_valid: str /= Void and is_valid_iso8601_duration(str)
		do
			if is_valid_iso8601_duration(str) then
				deep_copy(iso8601_parser.cached_iso8601_duration)
			end
		end

	make(yr, mo, wk, dy, hr, mi, sec: INTEGER; sec_frac: DOUBLE) is
			-- make from parts; any part can be zero; at least one part must be non-zero
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
			seconds_fraction := sec_frac
		end
	
feature -- Access Control

	years: INTEGER
	
	months: INTEGER
	
	weeks: INTEGER
	
	days: INTEGER
	
	hours: INTEGER
	
	minutes: INTEGER
	
	seconds: INTEGER
	
	seconds_fraction: DOUBLE
	
	sign: CHARACTER
	
feature -- Comparison

	infix "<" (other: like Current): BOOLEAN is
			-- Is current object less than `other'?
		do
		end

feature -- Modification

	set_sign_negative is
			-- set sign to '-'
		do
			sign := '-'
		end
		
feature -- Output

	as_string: STRING is
			-- output as ISO8601 duration string
		local
			sec_frac_str: STRING
		do
			create Result.make(0)
			if sign = '-' then
				Result.append_character(sign)
			end
			
			Result.append_character(Duration_leader)

			if years /= 0 then
				Result.append(years.out + "Y")
			end

			if months /= 0 then
				Result.append(months.out + "M")
			end

			if weeks /= 0 then
				Result.append(weeks.out + "W")
			end

			if days /= 0 then
				Result.append(days.out + "D")
			end

			Result.append_character(Time_leader)
			
			if hours /= 0 then
				Result.append(hours.out + "h")
			end

			if minutes /= 0 then
				Result.append(minutes.out + "m")
			end

			if seconds /= 0 then
				Result.append(seconds.out)
				if seconds_fraction > 0.0 then
					Result.append_character(Decimal_separator)
					sec_frac_str := seconds_fraction.out
					Result.append(sec_frac_str.substring(sec_frac_str.index_of('.', 1)+1, sec_frac_str.count))
				end
				Result.append(seconds.out + "s")
			end
		end
		
	out: STRING is
		do
			Result := as_string
		end
		
invariant		
	years_valid: years >= 0
	months_valid: months >= 0
	weeks_valid: weeks >= 0
	days_valid: days >= 0
	hours_valid: hours >= 0
	minutes_valid: minutes >= 0
	seconds_valid: seconds >= 0
	seconds_fraction_valid: seconds_fraction >= 0.0 and seconds_fraction < 1.0

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
