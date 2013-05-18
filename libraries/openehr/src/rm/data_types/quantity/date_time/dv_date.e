note
	component:   "openEHR ADL Tools"

	description: "Implementation of DV_DATE"
	keywords:    "date, time"

	requirements:"ISO 18308 TS V1.0 STR 3.7"
	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class DV_DATE

inherit
	DV_TEMPORAL
		undefine
			out, is_less, default_create
		end

	ISO8601_DATE
		undefine
			default_create
		end

create
	default_create, make_from_string, make_y, make_ym, make_ymd, make_date

feature -- Definitions

	Default_value: STRING = "1600-01-01"

feature -- Initialisation

	default_create
			-- create the date/time "1600-01-01"
		do
			value := Default_value.twin
			make_from_string (value)
		ensure then
			default: as_string.is_equal (Default_value)
		end

	make_from_canonical_string(str: STRING)
		do
			make_from_string(str)
		end

feature -- Status Report

	valid_canonical_string(str: STRING): BOOLEAN
			-- True if str contains required tags
		do
			Result := valid_iso8601_date(str)
		end

feature -- Access

	magnitude: INTEGER_REF
			-- date as days since epoch date of 1600-01-01
		do
			Result := to_days
		end

feature -- Comparison

	is_strictly_comparable_to (other: like Current): BOOLEAN
		do
			Result := True
		end

feature -- Basic Operations

	add (a_diff: like diff): like Current
			-- Addition of a differential amount to this quantity.
		do
			create Result.make_date (create {DATE}.make_by_days (to_days + a_diff.to_seconds // seconds_in_day))
		end

	subtract (a_diff: like diff): like Current
			-- Result of subtracting a differential amount from this quantity.
		do
			create Result.make_date (create {DATE}.make_by_days (to_days - a_diff.to_seconds // seconds_in_day))
		end

	diff (other: like Current): DV_DURATION
			-- Difference of two quantities.
		do
			create Result.make_from_seconds ((to_days - other.to_days) * seconds_in_day)
		end

feature -- Output

	as_canonical_string: STRING
		do
			Result := as_string
		end

end


