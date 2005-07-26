indexing
	component:   "openEHR Data Types"

	description: "Implementation of DV_DATE_TIME"
	keywords:    "date, time"

	requirements:"ISO 18308 TS V1.0 STR 3.7, 3.10"
	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class DV_DATE_TIME

inherit
	DV_WORLD_TIME
		redefine
			default_create, is_equal, infix "<"
		end

create 
	default_create,
	make_now,
	make_from_canonical_string,
	make_from_string,
	make_by_date_time

feature -- Definitions

	Default_format: STRING is "yyyy-[0]mm-[0]dd [0]hh:[0]mi:[0]ss"
			-- e.g.: "1998-04-19 13:03:02"
	
feature -- Initialisation

	default_create is
			-- create the date/time "1800-01-01 00:00:00"
		do
			create impl.make_from_string ("1800-01-01 00:00:00", default_format)
		ensure then
			default: as_string.is_equal ("1800-01-01 00:00:00")
		end

	make_by_date_time(a_date: DV_DATE; a_time: DV_TIME) is
			-- make from date and time values
		require
			a_date /= Void
			a_time /= Void
		do
			create impl.make_by_date_time(a_date.impl, a_time.impl)
		end
		
	make_now is
		do
			create impl.make_now
		end

	make_from_string (str: STRING) is
			-- make from string using default format
		do
			create impl.make_from_string (str, default_format)
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

	year: INTEGER is
		do
			Result := impl.year
		end

	month: INTEGER is
		do
			Result := impl.month
		end

	day: INTEGER is
		do
			Result := impl.day
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
	
	is_valid_date_time(y, mo, d, h, mi, s:INTEGER):BOOLEAN is
			-- check validity of date/time
		do
			Result := impl.is_correct_date_time (y, mo, d, h, mi, s, False)
		end
		
feature -- Basic Operations

	infix "+" (other: like diff_type): like Current is
			-- addition
		do
			-- impl := impl + other.impl
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
		do
			Result := impl.formatted_out (default_format)
		end
	
	as_canonical_string: STRING is
		do
			Result := as_string
		end
	
feature {DV_DATE_TIME} -- Implementation

	impl: DATE_TIME

invariant
	is_valid_date_time(year, month, day, hour, minute, second)

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
--| The Original Code is dv_date_time.e.
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
