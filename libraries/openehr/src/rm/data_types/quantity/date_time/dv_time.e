indexing
	component:   "openEHR Data Types"
	description: "Implementation of DV_TIME"
	keywords:    "date time"

	requirements:"ISO 18308 TS V1.0 STR 3.7, 3.10"
	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class DV_TIME

inherit
	DV_WORLD_TIME
		redefine
			default_create, is_equal, infix "<"
		end

	DATE_TIME_CONSTANTS
		export
			{NONE} all
		undefine
			default_create, is_equal
		end

create 
	default_create,
	make_from_string,
	make_from_canonical_string,
	make,
	make_fine,
	make_now

feature -- Initialization

	default_create is
			-- create the time "00:00:00"
		do
			create impl.make_from_string ("00:00:00", Default_time_format)
		ensure then
			default: as_string.is_equal ("00:00:00")
		end

	make (h, m, s: INTEGER) is
			-- Set `hour, `minute' and `second' to `h', `m', `s' respectively.
		do
			create impl.make(h, m, s)
		end

	make_fine (h, m: INTEGER; s: DOUBLE) is
			-- Set `hour, `minute' and `second' to `h', `m' and truncated to 
			-- integer part of `s' respectively.
			-- Set `fractional_second' to the fractional part of `s'.
		do
			create impl.make_fine(h, m, s)
		end
		
	make_now is
		do
			create impl.make_now
		end

	make_from_string (str: STRING) is
			-- make from string using specified format
			-- hh:mm:ss[.sss][Z|+zzzz]
		local
			l_time_string, l_tz_string: STRING
		do
			-- remove time zone section if it exists
			if str.index_of('Z', 1) > 0 then
				l_time_string := str.substring(1, str.count-1)
				create timezone.make_from_string("P0h0m")
			elseif str.index_of('+', 1) > 0 then
				l_time_string := str.substring(1, str.index_of('+', 1)-1)
				l_tz_string := str.substring(str.index_of('+', 1)+1, str.count)		
				check l_tz_string.count = 4 end
				create timezone.make_from_string("P" + l_tz_string.substring(1,2) + "h" + 
													l_tz_string.substring(3,4) + "m")
			end
			create impl.make_from_string (l_time_string, Default_time_format)
		end

	make_from_canonical_string (str: STRING) is
			-- make from string using default format
		do
		end

feature -- Status Report

	valid_canonical_string(str: STRING): BOOLEAN is
			-- True if str contains required tags
		do
		end

feature -- Access

	magnitude: DOUBLE_REF is
			-- numeric value of the quantity
		do
			create Result
			Result.set_item(impl.duration.fine_seconds_count)
		end

	hour: INTEGER is
		do
			Result := impl.hour
		end

	minute: INTEGER is
		do
			Result := impl.minute
		end

	second: INTEGER is
		do
			Result := impl.second
		end

	fractional_second: DOUBLE is
		do
			Result := impl.fractional_second
		end
		
	diff_type: DV_DURATION
		
feature -- Comparison

	infix "<" (other: like Current): BOOLEAN is
			-- Is the current duration smaller than `other'?
		do
			Result := impl < other.impl
		end

	is_equal (other: like Current): BOOLEAN is
			-- Are the current duration an `other' equal?
		do
			Result := impl.is_equal (other.impl)
		end

	is_valid_time(h, m, s:INTEGER):BOOLEAN is
			-- is time valid in 24hr/60min/60sec time system?
		do
			Result := impl.is_correct_time(h, m, s, False)
		end
		
feature -- Basic Operations

	infix "+" (other: like diff_type): like Current is
			-- addition
		do
			-- impl := impl + other.impl.time_duration
		end

	infix "-" (other: like diff_type): like Current is
			-- subtraction
		do
			-- impl := impl - other.impl
		end

feature -- Conversion

	to_quantity: DV_QUANTITY is
			-- convert to a number of seconds (the unit "s" is an ISO base unit).
		do	
		end

feature -- Output

	as_string: STRING is
		local
			l_tz: STRING
		do
			Result := impl.formatted_out (Default_time_format)
			if timezone /= Void then
				Result.append_character('+')
				l_tz := timezone.minutes.out
				if l_tz.count = 1 then
					l_tz.prepend_character('0')
				end
				l_tz.prepend(timezone.hours.out)
				if l_tz.count = 3 then
					l_tz.prepend_character('0')
				end
				Result.append(l_tz)
			end
		end
	
	as_canonical_string: STRING is
		do
			Result := as_string
		end
	
feature {DV_TIME, DV_DATE_TIME} -- Implementation

	impl: TIME
	
invariant
	is_valid: is_valid_time(hour, minute, second)
	
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
--| The Original Code is dv_time.e.
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
