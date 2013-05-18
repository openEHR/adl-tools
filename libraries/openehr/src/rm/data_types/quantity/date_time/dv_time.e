note
	component:   "openEHR ADL Tools"
	description: "Implementation of DV_TIME"
	keywords:    "date time"

	requirements:"ISO 18308 TS V1.0 STR 3.7, 3.10"
	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class DV_TIME

inherit
	DV_TEMPORAL
		undefine
			out, is_less, default_create
		end

	ISO8601_TIME
		undefine
			default_create
		end

create
	default_create, make_from_string, make_from_canonical_string, make_h, make_hm, make_hms, make_hmsf

feature -- Definitions

	Default_value: STRING = "00:00:00"

feature -- Initialisation

	default_create
			-- create the date/time "00:00:00"
		do
			make_from_string (Default_value)
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
			Result := valid_iso8601_time(str)
		end

feature -- Access

	magnitude: DOUBLE_REF
			-- numeric value of the time as seconds since previous midnight
		do
			Result := to_seconds
		end

feature -- Basic Operations

	add (a_diff: like diff): like Current
			-- Addition of a differential amount to this quantity.
		do
		end

	subtract (a_diff: like diff): like Current
			-- Result of subtracting a differential amount from this quantity.
		do
		end

	diff (other: like Current): DV_DURATION
			-- Difference of two quantities.
		do
		end

feature -- Comparison

	is_strictly_comparable_to (other: like Current): BOOLEAN
			-- True for all date/time types
		do
			Result := True
		end

feature -- Output

	as_canonical_string: STRING
		do
			Result := as_string
		end

end


