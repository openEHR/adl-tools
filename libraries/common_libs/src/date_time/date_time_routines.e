indexing
	component:   "openEHR re-usable library"
	description: "Date/time routines"
	keywords:    "date time"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class DATE_TIME_ROUTINES

inherit
	ISO8601_ROUTINES
	
feature -- Definitions

	valid_date_constraint_patterns: ARRAYED_LIST [STRING] is
			-- list of allowed date constraints
		once
			create Result.make(0)
			Result.compare_objects
			Result.extend ("YYYY-MM-DD")	-- full date required
			Result.extend ("YYYY-MM-??")	-- day optional
			Result.extend ("YYYY-??-??")	-- any date ok
			Result.extend ("YYYY-??-XX")	-- day not allowed
			Result.extend ("YYYY-XX-XX")	-- neither month nor day allowed
		end
		
	valid_time_constraint_patterns: ARRAYED_LIST [STRING] is
			-- list of allowed time constraints
		once
			create Result.make(0)
			Result.compare_objects
			Result.extend ("THH:MM:SS")	-- full time required
			Result.extend ("THH:??:XX")	-- seconds optional
			Result.extend ("THH:??:??")	-- any time ok
			Result.extend ("THH:MM:XX")	-- seconds not allowed
		end
		
	obsolete_time_constraint_patterns: ARRAYED_LIST [STRING] is
			-- FIXME: remove one day 
		once
			create Result.make(0)
			Result.compare_objects
			Result.extend ("HH:MM:SS")	-- full time required
			Result.extend ("HH:??:XX")	-- seconds optional
			Result.extend ("HH:??:??")	-- any time ok
			Result.extend ("HH:MM:XX")	-- seconds not allowed
		end
		
	valid_date_time_constraint_patterns: ARRAYED_LIST [STRING] is
			-- list of allowed date/time constraints
		once
			create Result.make(0)
			Result.compare_objects
			Result.extend ("YYYY-MM-DDTHH:MM:SS")	-- full date/time required
			Result.extend ("YYYY-MM-DDTHH:MM:??")	-- seconds optional
			Result.extend ("YYYY-??-??T??:??:??")	-- any date/time ok
			Result.extend ("YYYY-MM-DDTHH:??:XX")	-- seconds not allowed, minutes optional
			Result.extend ("YYYY-MM-DDTHH:MM:XX")	-- seconds not allowed
		end

	obsolete_date_time_constraint_patterns: ARRAYED_LIST [STRING] is
			-- list of allowed date/time constraints
		once
			create Result.make(0)
			Result.compare_objects
			Result.extend ("YYYY-MM-DD HH:MM:SS")	-- full date/time required
			Result.extend ("YYYY-MM-DD HH:MM:??")	-- seconds optional
			Result.extend ("YYYY-??-?? ??:??:??")	-- any date/time ok
			Result.extend ("YYYY-MM-DD HH:??:XX")	-- seconds not allowed, minutes optional
			Result.extend ("YYYY-MM-DD HH:MM:XX")	-- seconds not allowed
		end
		
feature -- Status Report

	valid_iso8601_time_constraint_pattern(s: STRING): BOOLEAN is
			-- True if string literal like "hh:mm:ss[.ssss]" 
			-- with XX or ?? allowed in mm or ss slots
		require
			s /= Void
		local
			str: STRING
		do
			str := s.twin
			str.to_upper
			Result := valid_time_constraint_patterns.has(str) or obsolete_time_constraint_patterns.has(str)
		end
		
	valid_iso8601_date_constraint_pattern(s: STRING): BOOLEAN is
			-- True if string literal like "yyyy-MM-dd"
			-- with XX or ?? allowed in MM or dd slots
		require
			s /= Void
		local
			str: STRING
		do
			str := s.twin
			str.to_upper
			Result := valid_date_constraint_patterns.has(str)
		end
		
	valid_iso8601_date_time_constraint_pattern(s: STRING): BOOLEAN is
			-- True if string in form "yyyy-MM-dd hh:mm:ss[.ssss]"
		require
			s /= Void
		local
			str: STRING
		do
			str := s.twin
			str.to_upper
			Result := valid_date_time_constraint_patterns.has(str) or obsolete_date_time_constraint_patterns.has(str)
		end
		
	valid_iso8601_duration_constraint_pattern(s: STRING): BOOLEAN is
			-- True if string in form 
			-- P[Y|y][M|m][W|w][D|d][T[H|h][M|m][S|s]]
			-- (note: allowing 'W' to be mixed in is an openEHR deviation of ISO 8601)
		require
			s /= Void
		local
			time_leader_pos, i: INTEGER
			str, ymd_part, hms_part: STRING
		do
			str := s.twin
			str.to_upper
			if str.count >= 2 and str.item(1) = Duration_leader then
				time_leader_pos := str.index_of(Time_leader, 1)
				if time_leader_pos = 1 then
					hms_part := str.substring(time_leader_pos + 1, str.count)
				elseif time_leader_pos > 1 then
					hms_part := str.substring(time_leader_pos + 1, str.count)
					ymd_part := str.substring(2, time_leader_pos - 1)
				else
					ymd_part := str.substring(2, str.count)
				end
				Result := True
				if ymd_part /= Void then
					from
						i := 1
					until
						i > ymd_part.count or not Result
					loop
						if ymd_part.item(i) /= 'Y' and 
							ymd_part.item(i) /= 'M' and 
							ymd_part.item(i) /= 'W' and 
							ymd_part.item(i) /= 'D' then
							Result := False
						end
						i := i + 1
					end
				end
				if Result and hms_part /= Void then
					from
						i := 1
					until
						i > hms_part.count or not Result
					loop
						if hms_part.item(i) /= 'H' and 
							hms_part.item(i) /= 'M' and 
							hms_part.item(i) /= 'S' then
							Result := False
						end
						i := i + 1
					end
				end
			end
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
