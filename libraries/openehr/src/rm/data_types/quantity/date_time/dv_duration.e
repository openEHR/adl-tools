note
	component:   "openEHR Data Types"
	description: "Implementation of DV_DATE_TIME_DURATION"
	keywords:    "date, time, duration"
	requirements:"ISO 18308 TS V1.0 STR 3.10"
	design:      "openEHR Data Types Reference Model 1.7"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class DV_DURATION

inherit
	DV_AMOUNT
		undefine
			out, is_less, default_create
		redefine
			as_string
		end

	ISO8601_DURATION
		rename
			as_string as magnitude_as_string
		undefine
			default_create
		end

create
	default_create, make, make_from_seconds, make_from_string, make_date_time_duration

feature -- Initialization

	default_create
			-- make of duration days = 0, hours = 0, mins = 0, seconds = 0
		do
			make (0, 0, 0, 0, 0, 0, 0, 0.0)
		ensure then
			years_set: years = 0
			months_set: months = 0
			weeks_set: weeks = 0
			days_set: days = 0
			hours_set: hours = 0
			minutes_set: minutes = 0
			seconds_set: seconds = 0
		end

	make_from_seconds (v: DOUBLE)
			-- create from a number of seconds, and turn into DHMS canonical form
		do
			make (0, 0, 0, 0, 0, 0, v.truncated_to_integer, v - v.truncated_to_integer)
		end

feature -- Access

	magnitude: DOUBLE_REF
			-- numeric value of the quantity
		do
			Result := to_seconds
		end

feature -- Comparison

	is_strictly_comparable_to (other: like Current): BOOLEAN
		do
			Result := True
		end

feature -- Basic Operations

	plus alias "+" (other: like Current): like Current
			-- addition
		do
			create Result.make_from_seconds(magnitude + other.magnitude)
		end

	minus alias "-" (other: like Current): like Current
			-- difference
		do
			create Result.make_from_seconds(magnitude - other.magnitude)
		end

feature -- Output

	as_string: STRING
			-- string form displayable for humans
		do
			Result := magnitude_as_string
			if accuracy /= 0 then
				if accuracy_is_percent then
					Result.append (" +/-" + accuracy.out + "%%")
				else
					Result.append (" +/-" + (create {DV_DURATION}.make_from_seconds(accuracy)).magnitude_as_string)
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
