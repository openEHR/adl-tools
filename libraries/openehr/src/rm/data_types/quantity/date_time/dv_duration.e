note
	component:   "openEHR ADL Tools"
	description: "Implementation of DV_DATE_TIME_DURATION"
	keywords:    "date, time, duration"
	requirements:"ISO 18308 TS V1.0 STR 3.10"
	design:      "openEHR Data Types Reference Model 1.7"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

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


