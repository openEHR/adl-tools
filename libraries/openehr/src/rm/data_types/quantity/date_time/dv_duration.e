indexing
	component:   "openEHR Data Types"

	description: "Implementation of DV_DATE_TIME_DURATION"
	keywords:    "date, time, duration"

	requirements:"ISO 18308 TS V1.0 STR 3.10"
	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class DV_DURATION

inherit
	DV_CUSTOMARY_QUANTITY
		redefine
			default_create, is_equal, infix "<"
		end
		
	DATE_TIME_ROUTINES
		export
			{NONE} all
		undefine
			is_equal, default_create
		end
		
create 
	default_create,
	make_definite,
	make_from_string,
	make_from_canonical_string

feature -- Initialization

	default_create is
			-- make of duration days = 0, hours = 0, mins = 0, seconds = 0
		do
			create impl.make_definite (0, 0, 0, 0)
		ensure then
			day_set: days = 0
			hour_set: hours = 0
			minute_set: minutes = 0
			second_set: seconds = 0
		end

	make_definite (d, h, m, s: INTEGER) is
			-- Set `day' to `d'.
			-- Set `hour', `minute', `second' to `h', `m', `s'.
		do
			create impl.make_definite (d, h, m, s)
		ensure
			day_set: days = d
			hour_set: hours = h
			minute_set: minutes = m
			second_set: seconds = s
		end

	make_from_string (str: STRING) is
			-- make from string using ISO8601 format "PNNdNNhNNmNNs"
		do
			impl := iso8601_string_to_duration(str)
		end
		
	make_from_canonical_string (str: STRING) is
			-- make from string using default format
		do
		end

feature -- Status Report

	definite: BOOLEAN is
		do
			Result := impl.definite
		end

	valid_canonical_string(str: STRING): BOOLEAN is
			-- True if str contains required tags
		do
		end

feature -- Access
	
	magnitude: DOUBLE_REF is
			-- numeric value of the quantity
		do
			create Result
			Result.set_item(impl.day * seconds_in_day + impl.hour * seconds_in_hour + impl.minute * seconds_in_minute + impl.fine_second)
		end

	days: INTEGER is
		do
			Result := impl.day
		end

	hours: INTEGER is
		do
			Result := impl.hour
		end

	minutes: INTEGER is
		do
			Result := impl.minute
		end

	seconds: INTEGER is
		do
			Result := impl.second
		end

	diff_type: DV_DURATION
		
feature -- Comparison

	infix "<" (other: like Current): BOOLEAN is
			-- Is the current duration smaller than `other'?
			-- False if either is not definite
		do
			Result := impl < other.impl
		end

	is_equal (other: like Current): BOOLEAN is
			-- Are the current duration an `other' equal?
		do
			Result := impl.is_equal (other.impl)
		end
	
	is_valid_duration(d, h, mi, s:INTEGER): BOOLEAN is
			-- check validity of duration
		local
			tvc: TIME_VALIDITY_CHECKER
		do
			create tvc
			Result := tvc.is_correct_time(h, mi, s, False)
		end
		
	is_strictly_comparable_to (other: like Current): BOOLEAN is
		do
			Result := True
		end

feature -- Basic Operations

	infix "+" (other: like diff_type): like Current is
			-- addition
		do
			impl := impl + other.impl
		end

	infix "-" (other: like diff_type): like Current is
			-- subtraction
		do
			impl := impl - other.impl
		end

	prefix "-": like Current is
			-- Unary minus
		do
			impl := -impl
		end
		
feature -- Conversion

	to_quantity: DV_QUANTITY is
			-- convert to a number of seconds (the unit "s" is an ISO base unit).
		do		
		end

feature -- Output

	as_string: STRING is
			-- output as ISO 8601 string
		do
			Result := duration_to_iso8601_string(impl)
		end
	
	as_canonical_string: STRING is
		do
			Result := as_string
		end
	
feature {DV_DATE, DV_TIME, DV_DATE_TIME, DV_DURATION} -- Implementation

	impl: DATE_TIME_DURATION
	
invariant
	
	validity: is_valid_duration(days, hours, minutes, seconds)
	
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
--| The Original Code is dv_duration.e.
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
