indexing
	component:   "openEHR re-usable library"
	description: "ISO 8601 Date/time routines"
	keywords:    "date time"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ISO8601_ROUTINES

inherit
	DATE_TIME_CONSTANTS
	
feature -- Definitions

	Date_separator: CHARACTER is '-'
	Time_separator: CHARACTER is ':'
	Time_leader: CHARACTER is 'T'
	Time_zone_GMT: CHARACTER is 'Z'
	Duration_leader: CHARACTER is 'P'
	Iso8601_decimal_separator: CHARACTER is ','
	Decimal_separator: CHARACTER is '.'
	
feature -- Conversion

	date_to_iso8601_string (a_date: DATE): STRING is
			-- make into string of ISO8601 format "YYYY-MM-DD"
		require
			a_date /= Void
		local
			s: STRING
			an_iso_date: ISO8601_DATE			
		do
			create an_iso_date.make_ymd (a_date.year, a_date.month, a_date.day, True)
			Result := an_iso_date.as_string
		ensure
			Result_valid: Result /= Void and then is_valid_iso8601_date(Result)				
		end
		
	iso8601_string_to_date (str: STRING): DATE is
			-- make from string using ISO8601 format "YYYY-MM-DD"
		require
			str_valid: str /= Void and then is_valid_iso8601_date(str)
		local
			y, m, d: INTEGER
			an_iso_date: ISO8601_DATE
		do
			create an_iso_date.make_from_string(str)
			y := an_iso_date.year
			if an_iso_date.day_unknown then
				if an_iso_date.month_unknown then
					m := Middle_month_of_year
					d := Last_day_of_middle_month
				else
					m := an_iso_date.month
					d := Middle_day_of_month
				end
			else
				m := an_iso_date.month
				d := an_iso_date.day
			end
			create Result.make(y, m, d)
		ensure
			Result /= Void
		end

	time_to_iso8601_string (a_time: TIME): STRING is
			-- make into string using ISO8601 format "Thh:mm:ss[.ssss]"
		require
			a_time /= Void
		local
			s: STRING
			an_iso_time: ISO8601_TIME
		do
			create an_iso_time.make_hmsf (a_time.hour, a_time.minute, a_time.second, a_time.fine_second, True)
			Result := an_iso_time.as_string
		ensure
			Result_valid: Result /= Void and then is_valid_iso8601_time(Result)		
		end
		
	iso8601_string_to_time (str: STRING): TIME is
			-- make from string using ISO8601 format "Thh:mm:ss[.ssss]"
		require
			str_valid: str /= Void and then is_valid_iso8601_time(str)
		local
			h, m, s: INTEGER
			fs: DOUBLE
			an_iso_time: ISO8601_TIME
		do
			create an_iso_time.make_from_string(str)
			h := an_iso_time.hours
			if an_iso_time.seconds_unknown then
				if an_iso_time.minutes_unknown then
					m := (Minutes_in_hour / 2).truncated_to_integer
					s := Seconds_in_hour - 1
				else
					m := an_iso_time.minutes
					s := (Seconds_in_hour / 2).truncated_to_integer
				end
			else
				m := an_iso_time.minutes
				s := an_iso_time.seconds
				fs := an_iso_time.seconds_fraction
			end
			create Result.make_fine(h, m, s + fs)
		ensure
			Result /= Void
		end

	date_time_to_iso8601_string (a_dt: DATE_TIME): STRING is
			-- make into string using ISO8601 format "YYYY-MM-DDThh:mm:ss[.ssss]"
		require
			a_dt /= Void
		do
			create Result.make(0)
			Result.append(date_to_iso8601_string(a_dt.date))
			Result.append_character(Time_leader)
			Result.append(time_to_iso8601_string(a_dt.time))
		ensure
			Result_valid: Result /= Void and then is_valid_iso8601_date_time(Result)
		end
		
	iso8601_string_to_date_time (str: STRING): DATE_TIME is
			-- make from string using ISO8601 format "YYYY-MM-DDThh:mm:ss[.ssss]"
		require
			str_valid: str /= Void and then is_valid_iso8601_date_time(str)
		local
			dt: DATE
			tm: TIME
			sep_pos: INTEGER
		do
			sep_pos := str.index_of(Time_leader, 1)
			dt := iso8601_string_to_date(str.substring(1, sep_pos-1))
			tm := iso8601_string_to_time(str.substring(sep_pos+1, str.count))
		ensure
			Result /= Void
		end

	duration_to_iso8601_string (a_dur: DATE_TIME_DURATION): STRING is
			-- make into string using ISO8601 format "PNNDTNNhNNmNNs"
		require
			a_dur /= Void
		local
			an_iso_dur: ISO8601_DURATION
		do
			create an_iso_dur.make (a_dur.year, a_dur.month, 0, a_dur.day, a_dur.hour, a_dur.minute,
				a_dur.second, a_dur.fine_second)
			Result := an_iso_dur.as_string
		ensure
			Result_valid: Result /= Void and then is_valid_iso8601_duration(Result)
		end
		
	iso8601_string_to_duration (str: STRING): DATE_TIME_DURATION is
			-- make from string using ISO8601 format "PNNDTNNhNNmNNs"
		require
			str_valid: str /= Void and then is_valid_iso8601_duration(str)
		local
			an_iso_dur: ISO8601_DURATION
		do
			create an_iso_dur.make_from_string (str)				
			create Result.make_fine (an_iso_dur.years, an_iso_dur.months, an_iso_dur.days + 
				an_iso_dur.weeks * Days_in_week, an_iso_dur.hours, an_iso_dur.minutes, 
				an_iso_dur.seconds + an_iso_dur.seconds_fraction)
		ensure
			Result /= Void
		end

feature -- Status Report

	is_valid_iso8601_string(str: STRING): BOOLEAN is
			-- only use this when caller does not know what kind of ISO8601
			-- string it is supposed to be
		require
			Str_valid: str /= Void and then not str.is_empty
		do
			Result := iso8601_parser.is_valid_iso8601_string(str)
		end

	is_valid_iso8601_time(str: STRING): BOOLEAN is
			-- True if string in one of the forms:
			--	Thh
			--	Thhmm
			--	Thh:mm
			--  Thhmmss
			--  Thhmmss,sss
			-- 	Thh:mm:ss
			-- 	Thh:mm:ss,sss
			-- with optional timezone in form:
			--	Z
			--	+hhmm
			--	-hhmm
		require
			str /= Void
		do
			Result := iso8601_parser.is_valid_iso8601_time(str)
		end		
		
	is_valid_iso8601_date(str: STRING): BOOLEAN is
			-- True if string in one of the forms
			--	YYYY
			--	YYYYMM
			--	YYYY-MM
			--	YYYYMMDD
			--	YYYY-MM-DD
		require
			str /= Void
		do
			Result := iso8601_parser.is_valid_iso8601_date(str)
		end
		
	is_valid_iso8601_date_time(str: STRING): BOOLEAN is
			-- True if string in form "YYYY-MM-DDThh:mm:ss[,sss]"
		require
			str /= Void
		do
			Result := iso8601_parser.is_valid_iso8601_date_time(str)
		end
		
	is_valid_iso8601_duration(str: STRING): BOOLEAN is
			-- True if string in form "PnDTnHnMnS"
		require
			str /= Void
		do
			Result := iso8601_parser.is_valid_iso8601_duration(str)
		end
					
feature {NONE} -- Implementation

	iso8601_parser: ISO8601_PARSER is
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
