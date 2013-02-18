note
	component:   "openEHR re-usable library"
	description: "ISO 8601 Date/time routines"
	keywords:    "date time"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

class ISO8601_ROUTINES

inherit
	DATE_TIME_CONSTANTS

feature -- Definitions

	Date_separator: CHARACTER = '-'
	Time_separator: CHARACTER = ':'
	Time_leader: CHARACTER = 'T'
	Time_zone_GMT: CHARACTER = 'Z'
	Duration_leader: CHARACTER = 'P'
	Iso8601_decimal_separator: CHARACTER = ','
	Decimal_separator: CHARACTER = '.'

	Iso_class_name_leader: STRING = "ISO8601_"

feature -- Conversion

	date_to_iso8601_string (a_date: DATE): STRING
			-- make into string of ISO8601 format "YYYY-MM-DD"
		do
			Result := (create {ISO8601_DATE}.make_date (a_date)).as_string
		ensure
			Result_valid: valid_iso8601_date(Result)
		end

	iso8601_string_to_date (str: STRING): DATE
			-- make from string using ISO8601 format "YYYY-MM-DD"
		require
			str_valid: valid_iso8601_date(str)
		do
			Result := (create {ISO8601_DATE}.make_from_string(str)).to_date
		end

	time_to_iso8601_string (a_time: TIME): STRING
			-- make into string using ISO8601 format "Thh:mm:ss[.ssss]"
		do
			Result := (create {ISO8601_TIME}.make_time (a_time)).as_string
		ensure
			Result_valid: valid_iso8601_time(Result)
		end

	iso8601_string_to_time (str: STRING): TIME
			-- make from string using ISO8601 format "Thh:mm:ss[.ssss]"
		require
			str_valid: valid_iso8601_time(str)
		do
			Result := (create {ISO8601_TIME}.make_from_string(str)).to_time
		end

	date_time_to_iso8601_string (a_dt: DATE_TIME): STRING
			-- make into string using ISO8601 format "YYYY-MM-DDThh:mm:ss[.ssss]"
		do
			Result := (create {ISO8601_DATE_TIME}.make_date_time(a_dt)).as_string
		ensure
			Result_valid: valid_iso8601_date_time(Result)
		end

	iso8601_string_to_date_time (str: STRING): DATE_TIME
			-- make from string using ISO8601 format "YYYY-MM-DDThh:mm:ss[.ssss]"
		require
			str_valid: valid_iso8601_date_time (str)
		do
			Result := (create {ISO8601_DATE_TIME}.make_from_string(str)).to_date_time
		end

	duration_to_iso8601_string (a_dur: DATE_TIME_DURATION): STRING
			-- make into string using ISO8601 format "PNNDTNNhNNmNNs"
		do
			Result := (create {ISO8601_DURATION}.make_date_time_duration (a_dur)).as_string
		ensure
			Result_valid: valid_iso8601_duration(Result)
		end

	iso8601_string_to_duration (str: STRING): DATE_TIME_DURATION
			-- make from string using ISO8601 format "PNNDTNNhNNmNNs"
		require
			str_valid: valid_iso8601_duration (str)
		do
			Result := (create {ISO8601_DURATION}.make_from_string (str)).to_date_time_duration
		end

	iso8601_string_to_comparable_duration (str: STRING): DATE_TIME_DURATION
			-- make from string using ISO8601 format "PNNDTNNhNNmNNs"
		require
			str_valid: valid_iso8601_duration (str)
		do
			Result := (create {ISO8601_DURATION}.make_from_string (str)).to_definite_date_time_duration
		end

feature -- Validity

--	valid_iso8601_string(str: STRING): BOOLEAN is
--			-- only use this when caller does not know what kind of ISO8601
--			-- string it is supposed to be
--		require
--			Str_valid: str /= Void and then not str.is_empty
--		do
--			Result := iso8601_parser.valid_iso8601_string(str)
--		end

	valid_iso8601_time (str: STRING): BOOLEAN
			-- True if string in one of the forms:
			--	hh
			--	hhmm
			--	hh:mm
			--  hhmmss
			--  hhmmss,sss
			-- 	hh:mm:ss
			-- 	hh:mm:ss,sss
			-- with optional timezone in form:
			--	Z
			--	+hhmm
			--	-hhmm
		do
			Result := iso8601_parser.valid_iso8601_time (str)
		end

	valid_iso8601_date (str: STRING): BOOLEAN
			-- True if string in one of the forms
			--	YYYY
			--	YYYYMM
			--	YYYY-MM
			--	YYYYMMDD
			--	YYYY-MM-DD
		do
			Result := iso8601_parser.valid_iso8601_date(str)
		end

	valid_iso8601_date_time (str: STRING): BOOLEAN
			-- True if string in form "YYYY-MM-DDThh:mm:ss[,sss]"
		do
			Result := iso8601_parser.valid_iso8601_date_time (str)
		end

	valid_iso8601_duration (str: STRING): BOOLEAN
			-- True if string in form "PnDTnHnMnS"
		do
			Result := iso8601_parser.valid_iso8601_duration(str)
		end

	valid_year (y: INTEGER): BOOLEAN
			-- True if year >= 0
		do
			Result := y >= 0
		end

	valid_month (m: INTEGER): BOOLEAN
			-- True if m >= 1 and m <= Months_in_year
		do
			Result := m >= 1 and m <= Months_in_year
		end

	valid_day (y, m, d: INTEGER): BOOLEAN
			-- True if d >= 1 and d <= days_in_month(m, y)
		do
			Result := d >= 1 and d <= days_in_month(m, y)
		end

	valid_hour (h, m, s: INTEGER): BOOLEAN
			-- True if (h >= 0 and h < Hours_in_day) or (h = Hours_in_day and m = 0 and s = 0)
		do
			Result := (h >= 0 and h < Hours_in_day) or (h = Hours_in_day and m = 0 and s = 0)
		end

	valid_minute (m: INTEGER): BOOLEAN
			-- True if m >= 0 and m < Minutes_in_hour
		do
			Result := m >= 0 and m < Minutes_in_hour
		end

	valid_second (s: INTEGER): BOOLEAN
			-- True if s >= 0 and s < Seconds_in_minute
		do
			Result := s >= 0 and s < Seconds_in_minute
		end

	valid_fractional_second (fs: DOUBLE): BOOLEAN
			-- True if fs >= 0.0 and fs < 1.0
		do
			Result := fs >= 0.0 and fs < 1.0
		end

feature {NONE} -- Implementation

	iso8601_parser: ISO8601_PARSER
			-- parser for date/time strings
		once
			create Result.make
		end

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
