note
	component:   "openEHR Data Types"
	description: "Implementation of DV_DATE_TIME"
	keywords:    "date, time"
	requirements:"ISO 18308 TS V1.0 STR 3.7, 3.10"
	design:      "openEHR Data Types Reference Model 1.7"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

class DV_DATE_TIME

inherit
	DV_TEMPORAL
		undefine
			out, is_less, default_create
		end

	ISO8601_DATE_TIME
		undefine
			default_create
		end

create
	default_create,	make_from_string, make_date_and_time, make_date_time

feature -- Definitions

	Default_value: STRING = "1800-01-01T00:00:00"

feature -- Initialisation

	default_create
			-- create the date/time "1800-01-01T00:00:00"
		do
			make_from_string (Default_value)
		ensure then
			default: as_string.is_equal (Default_value)
		end

feature -- Access

	magnitude: DOUBLE_REF
			-- numeric value of the quantity in seconds
		do
			Result := to_seconds
		end

feature -- Basic Operations

	add (a_diff: like diff): like Current
			-- Addition of a differential amount to this quantity.
		local
			secs: INTEGER
		do
			secs := date_part.to_days * seconds_in_day
			if attached time_part as tp then
				secs := secs + tp.to_seconds.floor
			end
			create Result.make_date_time (create {DATE_TIME}.make_from_epoch (secs + a_diff.to_seconds.floor))
		end

	subtract (a_diff: like diff): like Current
			-- Result of subtracting a differential amount from this quantity.
		local
			secs: INTEGER
		do
			secs := date_part.to_days * seconds_in_day
			if attached time_part as tp then
				secs := secs + tp.to_seconds.floor
			end
			create Result.make_date_time (create {DATE_TIME}.make_from_epoch (secs - a_diff.to_seconds.floor))
		end

	diff (other: like Current): DV_DURATION
			-- Difference of two quantities.
		do
			create Result.make_date_time_duration (to_date_time.duration.minus (other.to_date_time.duration))
		end

feature -- Comparison

	is_strictly_comparable_to (other: like Current): BOOLEAN
			-- True for all date/time types
		do
			Result := True
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
