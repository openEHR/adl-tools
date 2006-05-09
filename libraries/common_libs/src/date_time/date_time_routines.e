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
			Result.extend ("yyyy-mm-dd")	-- full date required
			Result.extend ("yyyy-mm-??")	-- day optional
			Result.extend ("yyyy-??-??")	-- any date ok
			Result.extend ("yyyy-??-XX")	-- day not allowed
			Result.extend ("yyyy-XX-XX")	-- neither month nor day allowed
		end
		
	valid_time_constraint_patterns: ARRAYED_LIST [STRING] is
			-- list of allowed time constraints
		once
			create Result.make(0)
			Result.compare_objects
			-- FIXME: the following group to be removed eventually
			Result.extend ("hh:mm:ss")	-- full time required
			Result.extend ("hh:??:XX")	-- seconds optional
			Result.extend ("hh:??:??")	-- any time ok
			Result.extend ("hh:mm:XX")	-- seconds not allowed
			
			-- the following group to be retained
			Result.extend ("Thh:mm:ss")	-- full time required
			Result.extend ("Thh:??:XX")	-- seconds optional
			Result.extend ("Thh:??:??")	-- any time ok
			Result.extend ("Thh:mm:XX")	-- seconds not allowed
		end
		
	valid_date_time_constraint_patterns: ARRAYED_LIST [STRING] is
			-- list of allowed date/time constraints
		once
			create Result.make(0)
			Result.compare_objects
			-- FIXME: the following group to be removed eventually
			Result.extend ("yyyy-mm-dd hh:mm:ss")	-- full date/time required
			Result.extend ("yyyy-mm-dd hh:mm:??")	-- seconds optional
			Result.extend ("yyyy-??-?? ??:??:??")	-- any date/time ok
			Result.extend ("yyyy-mm-dd hh:??:XX")	-- seconds not allowed, minutes optional
			Result.extend ("yyyy-mm-dd hh:mm:XX")	-- seconds not allowed
			
			-- the following group to be retained
			Result.extend ("yyyy-mm-ddThh:mm:ss")	-- full date/time required
			Result.extend ("yyyy-mm-ddThh:mm:??")	-- seconds optional
			Result.extend ("yyyy-??-??T??:??:??")	-- any date/time ok
			Result.extend ("yyyy-mm-ddThh:??:XX")	-- seconds not allowed, minutes optional
			Result.extend ("yyyy-mm-ddThh:mm:XX")	-- seconds not allowed
		end
		
feature -- Status Report

	is_valid_iso8601_time_constraint_pattern(s: STRING): BOOLEAN is
			-- True if string literal like "hh:mm:ss[.ssss]" 
			-- with XX or ?? allowed in mm or ss slots
		require
			s /= Void
		local
			str: STRING
		do
			str := s.twin
			str.to_lower
			str.replace_substring_all ("xx", "XX") -- to allow matching with "XX" rather than "xx" in allowed patterns
			Result := valid_time_constraint_patterns.has(str)
		end
		
	is_valid_iso8601_date_constraint_pattern(s: STRING): BOOLEAN is
			-- True if string literal like "yyyy-MM-dd"
			-- with XX or ?? allowed in MM or dd slots
		require
			s /= Void
		local
			str: STRING
		do
			str := s.twin
			str.to_lower
			str.replace_substring_all ("xx", "XX") -- to allow matching with "XX" rather than "xx" in allowed patterns
			Result := valid_date_constraint_patterns.has(str)
		end
		
	is_valid_iso8601_date_time_constraint_pattern(s: STRING): BOOLEAN is
			-- True if string in form "yyyy-MM-dd hh:mm:ss[.ssss]"
		require
			s /= Void
		local
			str: STRING
		do
			str := s.twin
			str.to_lower
			str.replace_substring_all ("xx", "XX") -- to allow matching with "XX" rather than "xx" in allowed patterns
			Result := valid_date_time_constraint_patterns.has(str)
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
