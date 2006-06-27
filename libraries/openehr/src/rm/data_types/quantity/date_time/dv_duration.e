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
		undefine
			out, infix "<", default_create
		end
		
	ISO8601_DURATION
		undefine
			default_create
		end
		
create 
	default_create, make, make_weeks, make_from_string, make_from_canonical_string

feature -- Initialization

	default_create is
			-- make of duration days = 0, hours = 0, mins = 0, seconds = 0
		do
			make(0, 0, 0, 0, 0, 0, 0.0)
		ensure then
			years_set: years = 0
			months_set: months = 0
			days_set: days = 0
			hours_set: hours = 0
			minutes_set: minutes = 0
			seconds_set: seconds = 0
		end
		
	make_from_canonical_string (str: STRING) is
			-- make from string using default format
		do
			make_from_string(str)
		end

feature -- Status Report

	valid_canonical_string(str: STRING): BOOLEAN is
			-- True if str contains required tags
		do
			Result := valid_iso8601_duration (str)
		end

feature -- Access
	
	magnitude: DOUBLE_REF is
			-- numeric value of the quantity
		do
			Result := to_seconds
		end

	diff_type: DV_DURATION is
			--
		once
		end
		
feature -- Comparison
		
	is_strictly_comparable_to (other: like Current): BOOLEAN is
		do
			Result := True
		end

feature -- Basic Operations

	infix "+" (other: like diff_type): like Current is
			-- addition
		do
		end

	infix "-" (other: like diff_type): like Current is
			-- subtraction
		do
		end

	prefix "-": like Current is
			-- Unary minus
		do
		end
		
feature -- Conversion

	to_quantity: DV_QUANTITY is
			-- express as Quantity with magnitude = magnitude from this class
		do
			create Result.make (magnitude, "s")
		ensure then
			Result.magnitude = magnitude
			Result.units.is_equal("s")
		end

feature -- Output

	as_canonical_string: STRING is
		do
			Result := as_string
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
