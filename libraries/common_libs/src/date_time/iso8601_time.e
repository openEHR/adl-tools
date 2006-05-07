indexing
	component:   "openEHR re-usable library"
	description: "[
				ISO8601:2004 compliant Time class, including facility to represent 
				partial times (called 'reduced accuracy' in the standard). This class
				uses  a standard library TIME class to represent the time
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

class ISO8601_TIME

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
	make_from_string, make_h, make_hm, make_hms, make_hmsf
	
feature -- Initialisation

	make_from_string(str: STRING) is
			-- make from a time of form: 
			-- hhmmss[,sss][Z|+/-hhmm] or 
			-- hh:mm:ss[,sss][,sss][Z|+/-hhmm]
		require
			String_valid: str /= Void and is_valid_iso8601_time(str)
		do
			if is_valid_iso8601_time(str) then
				deep_copy(iso8601_parser.cached_iso8601_time)
			end
		end

	make_h(h: INTEGER; is_extended_flag: BOOLEAN) is
			-- make partial time from hours only
		require
			Hours_valid: h >= 0 and h <= Hours_in_day
		do
			hours := h
			is_extended := is_extended_flag
		end

	make_hm(h, m: INTEGER; is_extended_flag: BOOLEAN) is
			-- make partial time from hours and minutes
		require
			Hours_valid: h >= 0 and h <= Hours_in_day
			Hour_limit_validity: h = Hours_in_day implies m = 0
			Minutes_valid: m >= 0 and m < Minutes_in_hour
		do
			hours := h
			minutes := m
			is_extended := is_extended_flag
		end

	make_hms(h, m, s: INTEGER; is_extended_flag: BOOLEAN) is
			-- make complete time
		require
			Hours_valid: h >= 0 and h <= Hours_in_day
			Hour_limit_validity: h = Hours_in_day implies (m = 0 and s = 0)
			Minutes_valid: m >= 0 and m < Minutes_in_hour
			Seconds_valid: s >= 0 and s < Seconds_in_minute
		do
			hours := h
			minutes := m
			seconds := s
			is_extended := is_extended_flag
		end

	make_hmsf(h, m, s: INTEGER; sf: DOUBLE; is_extended_flag: BOOLEAN) is
			-- make complete time from hours, minutes, seconds and fine seconds
		require
			Hours_valid: h >= 0 and h <= Hours_in_day
			Hour_limit_validity: h = Hours_in_day implies (m = 0 and s = 0)
			Minutes_valid: m >= 0 and m < Minutes_in_hour
			Seconds_valid: s >= 0 and s < Seconds_in_minute
			Fine_seconds_valid: sf >= 0 and sf < 1.0
		do
			hours := h
			minutes := m
			seconds := s
			seconds_fraction := sf
			seconds_fraction_included := True
			is_extended := is_extended_flag
		end
				
feature -- Access

	hours: INTEGER

	minutes: INTEGER

	seconds: INTEGER

	seconds_fraction: DOUBLE
	
	timezone: ISO8601_TIMEZONE
	
feature -- Status Report

	is_extended: BOOLEAN
			-- True if syntax format uses separators
			
	minutes_unknown: BOOLEAN
			-- True if minutes unknown

	seconds_unknown: BOOLEAN
			-- True if seconds unknown

	seconds_fraction_included: BOOLEAN
			-- True if seconds unknown

	is_partial: BOOLEAN is
			-- True if either minutes or second unknown
		do
			Result := seconds_unknown
		end

feature -- Modification

	set_timezone(a_tz: ISO8601_TIMEZONE) is
			-- set timezone
		require
			a_tz /= Void
		do
			timezone := a_tz
		end

feature -- Comparison

	infix "<" (other: like Current): BOOLEAN is
			-- Is current object less than `other'?
		do
		end

feature -- Output

	as_string: STRING is
			-- express as ISO8601 format string "Thh:mm:ss[,ssss]"
		local
			s: STRING
		do
			create Result.make(0)
			Result.append_character(Time_leader)

			s := hours.out
			if s.count = 1 then
				Result.append_character ('0')
			end
			Result.append(s)
			
			if not minutes_unknown then
				if is_extended then
					Result.append_character(Time_separator)			
				end
				s := minutes.out
				if s.count = 1 then
					Result.append_character ('0')
				end
				Result.append(s)
				
				if not seconds_unknown then
					if is_extended then
						Result.append_character(Time_separator)			
					end
					s := seconds.out
					if s.count = 1 then
						Result.append_character ('0')
					end
					Result.append(s)

					if seconds_fraction_included then
						Result.append_character(Decimal_separator)
						s := seconds_fraction.out
						Result.append(s.substring(s.index_of('.', 1) + 1, s.count))
					end
				end
			end
			
			if timezone /= Void then
				Result.append(timezone.as_string)
			end
		ensure
			Result_valid: Result /= Void and then is_valid_iso8601_time(Result)		
		end

	out: STRING is
		do
			Result := as_string
		end
		
invariant
	Hours_valid: hours >= 0 and hours <= Hours_in_day
	Hour_limit_minutes_valid: hours = Hours_in_day and not minutes_unknown implies minutes = 0
	Hour_limit_seconds_valid: hours = Hours_in_day and not seconds_unknown implies (seconds = 0 and seconds_fraction = 0.0)
	Minutes_valid: not minutes_unknown implies (minutes >= 0 and minutes < Minutes_in_hour)
	Seconds_valid: not seconds_unknown implies (seconds >= 0 and seconds < Seconds_in_minute)
	Fine_seconds_valid: seconds_fraction >= 0 and seconds_fraction < 1.0
	Partial_validity: minutes_unknown implies seconds_unknown
		
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
