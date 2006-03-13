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
	
feature -- Conversion

	date_to_iso8601_string (a_date: DATE): STRING is
			-- make into string of ISO8601 format "yyyy-MM-dd"
		require
			a_date /= Void
		local
			s: STRING
		do
			create Result.make(0)
			Result.append(a_date.year.out + "-")
			
			s := a_date.month.out
			if s.count = 1 then
				Result.append_character ('0')
			end
			Result.append(s + "-")

			s := a_date.day.out
			if s.count = 1 then
				Result.append_character ('0')
			end
			Result.append(s)
		ensure
			Result_valid: Result /= Void and then is_valid_iso8601_date(Result)				
		end
		
	iso8601_string_to_date (str: STRING): DATE is
			-- make from string using ISO8601 format "yyyy-MM-dd"
		require
			str_valid: str /= Void and then is_valid_iso8601_date(str)
		local
			y, m, d: INTEGER
		do
			y := str.substring(1,4).to_integer
			m := str.substring(6,7).to_integer
			d := str.substring(9,10).to_integer
			create Result.make(y, m, d)
		ensure
			Result /= Void
		end

	time_to_iso8601_string (a_time: TIME): STRING is
			-- make into string using ISO8601 format "hh:mm:ss[.ssss]"
		require
			a_time /= Void
		local
			s: STRING
		do
			create Result.make(0)
			
			s := a_time.hour.out
			if s.count = 1 then
				Result.append_character ('0')
			end
			Result.append(s)
			
			s := a_time.minute.out
			if s.count = 1 then
				Result.append_character ('0')
			end
			Result.append(s)
			
			s := a_time.second.out
			if s.count = 1 then
				Result.append_character ('0')
			end
			Result.append(s)			
		ensure
			Result_valid: Result /= Void and then is_valid_iso8601_time(Result)		
		end
		
	iso8601_string_to_time (str: STRING): TIME is
			-- make from string using ISO8601 format "hh:mm:ss[.ssss]"
		require
			str_valid: str /= Void and then is_valid_iso8601_time(str)
		local
			h, m, s: INTEGER
			fs: DOUBLE
			sec_str: STRING
		do
			h := str.substring(1,2).to_integer
			m := str.substring(4,5).to_integer
			sec_str := str.substring(6,str.count)
			if sec_str.is_integer then
				s := sec_str.to_integer
				create Result.make(h, m, s)
			else
				fs := sec_str.to_double
				create Result.make_fine(h, m, fs)
			end
		ensure
			Result /= Void
		end

	date_time_to_iso8601_string (a_dt: DATE_TIME): STRING is
			-- make into string using ISO8601 format "yyyy-MM-dd hh:mm:ss[.ssss]"
		require
			a_dt /= Void
		do
			create Result.make(0)
			Result.append(date_to_iso8601_string(a_dt.date))
			Result.append(" ")
			Result.append(time_to_iso8601_string(a_dt.time))
		ensure
			Result_valid: Result /= Void and then is_valid_iso8601_date_time(Result)
		end
		
	iso8601_string_to_date_time (str: STRING): DATE_TIME is
			-- make from string using ISO8601 format "yyyy-MM-dd hh:mm:ss[.ssss]"
		require
			str_valid: str /= Void and then is_valid_iso8601_date_time(str)
		local
			dt: DATE
			tm: TIME
			spc_pos: INTEGER
		do
			spc_pos := str.index_of(' ', 1)
			dt := iso8601_string_to_date(str.substring(1, spc_pos-1))
			tm := iso8601_string_to_time(str.substring(spc_pos+1, str.count))
		ensure
			Result /= Void
		end

	duration_to_iso8601_string (a_dur: DATE_TIME_DURATION): STRING is
			-- make into string using ISO8601 format "PNNdNNhNNmNNs"
		require
			a_dur /= Void
		do
			create Result.make(0)
			if a_dur.is_negative then
				Result.append_character('-')
			end
			
			Result.append_character('P')

			if a_dur.day /= 0 then
				Result.append(a_dur.day.abs.out + "d")
			end

			if a_dur.hour /= 0 then
				Result.append(a_dur.hour.abs.out + "h")
			end

			if a_dur.minute /= 0 then
				Result.append(a_dur.minute.abs.out + "m")
			end

			if a_dur.second /= 0 or else Result.count = 1 then
				Result.append(a_dur.second.abs.out + "s")
			end
		ensure
			Result_valid: Result /= Void and then is_valid_iso8601_duration(Result)
		end
		
	iso8601_string_to_duration (str: STRING): DATE_TIME_DURATION is
			-- make from string using ISO8601 format "PNNdNNhNNmNNs"
		require
			str_valid: str /= Void and then is_valid_iso8601_duration(str)
		local
			str1: STRING
			d,h,m,s:INTEGER
			left, right: INTEGER
		do
			-- get d h m s from string
			-- extract dhms pieces from ISO8601 string of form PnDnnHnnMnnS
			create str1.make(0)
			str1.append(str)
			str1.to_lower
			left := 2
			d := 0
			h := 0
			m := 0
			s := 0

			right := str1.index_of('d', left)
			if right > 0 then
				d := str1.substring(left, right-1).to_integer
				left := right + 1
			end

			right := str1.index_of('h', left)
			if right > 0 then
				h := str1.substring(left, right-1).to_integer
				left := right + 1
			end

			right := str1.index_of('m', left)
			if right > 0 then
				m := str1.substring(left, right-1).to_integer
				left := right + 1
			end

			right := str1.index_of('s', left)
			if right > 0 then
				s := str1.substring(left, right-1).to_integer
				left := right + 1
			end

			create Result.make_definite(d, h, m, s)
		ensure
			Result /= Void
		end
					
feature -- Status Report

	is_valid_iso8601_time(s: STRING): BOOLEAN is
			-- True if string in form "hh:mm:ss[.ssss]"
		require
			s /= Void
		do
			Result := True -- FIXME: to be implemented
		end
		
	is_valid_iso8601_date(s: STRING): BOOLEAN is
			-- True if string in form "yyyy-MM-dd"
		require
			s /= Void
		do
			Result := True -- FIXME: to be implemented
		end
		
	is_valid_iso8601_date_time(s: STRING): BOOLEAN is
			-- True if string in form "yyyy-MM-dd hh:mm:ss[.ssss]"
		require
			s /= Void
		do
			Result := True -- FIXME: to be implemented
		end
		
	is_valid_iso8601_duration(s: STRING): BOOLEAN is
			-- True if string in form "PnDnHnMnS"
		require
			s /= Void
		do
			Result := True -- FIXME: to be implemented
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
