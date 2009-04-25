indexing
	component:   "openEHR re-usable library"
	description: "[
				ISO8601:2004 compliant Time class, including facility to represent 
				partial times (called 'reduced accuracy' in the standard). This class
				uses  a standard library TIME class to represent the time
				value for the purpose of mathematical operations and validity
				checking.
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

class ISO8601_TIME

inherit
	ISO8601_ROUTINES
		export
			{NONE} all;
			{ANY} valid_iso8601_time, valid_hour, valid_minute, valid_second, valid_fractional_second
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
			String_valid: str /= Void and valid_iso8601_time(str)
		do
			if valid_iso8601_time(str) then
				deep_copy(iso8601_parser.cached_iso8601_time)
			end
			value := as_string
		end

	make_h(h: INTEGER; is_extended_flag: BOOLEAN) is
			-- make partial time from hour only
		require
			Hours_valid: valid_hour(h, 0, 0)
		do
			hour := h
			is_extended := is_extended_flag
			minute_unknown := True
			second_unknown := True
			value := as_string
		end

	make_hm(h, m: INTEGER; is_extended_flag: BOOLEAN) is
			-- make partial time from hour and minute
		require
			Hours_valid: valid_hour(h, m, 0)
			Minutes_valid: valid_minute(m)
		do
			hour := h
			minute := m
			second_unknown := True
			is_extended := is_extended_flag
			value := as_string
		end

	make_hms(h, m, s: INTEGER; is_extended_flag: BOOLEAN) is
			-- make complete time
		require
			Hours_valid: valid_hour(h, m, s)
			Minutes_valid: valid_minute(m)
			Seconds_valid: valid_second(s)
		do
			hour := h
			minute := m
			second := s
			is_extended := is_extended_flag
			value := as_string
		end

	make_hmsf(h, m, s: INTEGER; sf: DOUBLE; is_extended_flag: BOOLEAN) is
			-- make complete time from hour, minute, second and fine second
		require
			Hours_valid: valid_hour(h, m, s)
			Minutes_valid: valid_minute(m)
			Seconds_valid: valid_second(s)
			Fractional_second_valid: valid_fractional_second(sf)
		do
			hour := h
			minute := m
			second := s
			fractional_second := sf
			has_fractional_second := True
			is_extended := is_extended_flag
			value := as_string
		end

feature -- Access

	value: STRING
			-- ISO8601 string for time; always equal to result of as_string

	hour: INTEGER
			-- extracted hour

	minute: INTEGER
			-- extracted minute

	second: INTEGER
			-- extracted second

	fractional_second: DOUBLE
			-- extracted fractional second

	timezone: ISO8601_TIMEZONE
			-- extracted timezone

feature -- Status Report

	is_extended: BOOLEAN
			-- True if syntax format uses separators

	minute_unknown: BOOLEAN
			-- True if minute unknown

	second_unknown: BOOLEAN
			-- True if second unknown

	has_fractional_second: BOOLEAN
			-- True if second unknown

	is_partial: BOOLEAN is
			-- True if either minute or second unknown
		do
			Result := second_unknown
		end

feature -- Modification

	set_timezone(a_tz: ISO8601_TIMEZONE) is
			-- set timezone
		require
			a_tz /= Void
		do
			timezone := a_tz
			value := as_string
		end

	set_extended is
			-- set is_extended
		do
			is_extended := True
			value := as_string
		end

feature -- Comparison

	is_less alias "<" (other: like Current): BOOLEAN is
			-- Is current time less than `other', i.e. earlier? This comparison takes
			-- into account timezone, i.e. it compares actual instants in world time, not
			-- numeric values.
		do
			Result := to_seconds < other.to_seconds
		end

feature -- Conversion

	to_seconds: DOUBLE is
			-- convert to signed numeric form for comparison. The result is the number of
			-- seconds since midnight at the 0000 meridian, and may be negative if the timezone is negative.
			-- Timezone is taken into account, so that 00:00:00+0100 gives 3600, not 0. For missing parts,
			-- substitute mid point values, creating a statistical approximation for
			-- sorting purposes.
		local
			m, s, tz: INTEGER
			fs: DOUBLE
		do
			if second_unknown then
				if minute_unknown then
					m := middle_minute_in_hour
					s := seconds_in_minute
				else
					m := minute
					s := middle_second_in_minute
				end
			else
				s := second
			end
			if has_fractional_second then
				fs := fractional_second
			end
			if timezone /= Void then
				tz := timezone.to_seconds
			end
			Result := hour * seconds_in_hour + m * seconds_in_minute + s + fs + tz
		end

feature -- Output

	as_string: STRING is
			-- express as ISO8601 format string "hh:mm:ss[,ssss]"
		local
			s: STRING
		do
			create Result.make(0)

			s := hour.out
			if s.count = 1 then
				Result.append_character ('0')
			end
			Result.append(s)

			if not minute_unknown then
				if is_extended then
					Result.append_character(Time_separator)
				end
				s := minute.out
				if s.count = 1 then
					Result.append_character ('0')
				end
				Result.append(s)

				if not second_unknown then
					if is_extended then
						Result.append_character(Time_separator)
					end
					s := second.out
					if s.count = 1 then
						Result.append_character ('0')
					end
					Result.append(s)

					if has_fractional_second then
						Result.append_character(Iso8601_decimal_separator)
						s := fractional_second.out
						Result.append(s.substring(s.index_of('.', 1) + 1, s.count))
					end
				end
			end

			if timezone /= Void then
				Result.append(timezone.as_string)
			end
		ensure
			Result_valid: Result /= Void and then valid_iso8601_time(Result)
		end

	out: STRING is
		do
			Result := as_string
		end

invariant
	Hour_valid: valid_hour(hour, minute, second)
	Minute_valid: not minute_unknown implies valid_minute(minute)
	Second_valid: not second_unknown implies valid_second(second)
	Fractional_second_valid: has_fractional_second implies (not second_unknown and valid_fractional_second(fractional_second))
	Partial_validity: minute_unknown implies second_unknown

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
