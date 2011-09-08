note
	component:   "openEHR re-usable library"
	description: "[
				ISO8601:2004 compliant Timezone class, enabling representation
				of 'Z', '+hhmm' and '-hhmm' time zone forms.
				]"
	keywords:    "date time"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ISO8601_TIMEZONE

inherit
	ISO8601_ROUTINES
	
create
	make_gmt, make
	
feature -- Initialisation

	make_from_string(s: STRING)
			-- make from a time of form: Z|+hhmm|-hhmm
		require
			String_valid: s /= Void 
		do
		end

	make_gmt
			-- 
		do
			is_gmt := True
			sign := 1
		end

	make(a_sign: INTEGER; h, m: INTEGER)
		require
			Sign_valid: a_sign = -1 or a_sign = 1
			Hour_valid: h >= 0 and h <= Max_timezone_hour
			Minute_valid: m >= 0 and m < Minutes_in_hour
		do
			sign := a_sign
			hour := h
			minute := m
		end

feature -- Access

	hour: INTEGER
	
	minute: INTEGER
	
feature -- Status Report

	is_gmt: BOOLEAN
			-- True if 'Z' form

	sign: INTEGER
			-- value of +/- 1 - sign of non-GMT form, or '+' for GMT

feature -- Conversion

	to_seconds: INTEGER
			-- generate signed number of seconds after or before midnight at the 0 meridian
			-- represented by this timezone
		do
			Result := hour * seconds_in_hour + minute * seconds_in_minute
		end
		
feature -- Output

	as_string: STRING
			-- express as ISO8601 format string "Z" or "+hhmm" or "-hhmm"
		local
			s: STRING
		do
			create Result.make(0)
			if is_gmt then
				Result.append_character(Time_zone_GMT)
			else
				if sign > 0 then
					Result.append_character('+')				
				else
					Result.append_character('-')				
				end
				s := hour.out
				if s.count = 1 then
					Result.append_character ('0')
				end
				Result.append(s)
			
				s := minute.out
				if s.count = 1 then
					Result.append_character ('0')
				end
				Result.append(s)
			end	
		end

invariant
	Hour_valid: hour >= 0 and hour <= Max_timezone_hour
	Minute_valid: minute >= 0 and minute < Minutes_in_hour
	Sign_valid: sign = 1 or sign = -1

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
