note
	component:   "openEHR ADL Tools"
	description: "FIXME: temporary type for QUANTITY until reconciled with DV_QUANTITY"
	keywords:    "quantity, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class QUANTITY

inherit
	ANY
		redefine
			default_create
		end

create
	make, default_create

feature -- Definitions

	Default_units: STRING = "m"
			-- metres

	Default_precision: INTEGER = -1

feature -- Initialisation

	default_create
			-- create a reasonable default object
		do
			units := Default_units.twin
			precision := Default_precision
		ensure then
			precision = Default_precision
		end

	make (a_magnitude: REAL; a_units: detachable STRING; a_precision: INTEGER)
			-- set magnitude and units; precision should be set to -1 if no precision
		require
			Units_valid: attached a_units implies not a_units.is_empty
		do
			magnitude := a_magnitude
			units := a_units
			precision := a_precision
		ensure
			Magnitude_set: magnitude = a_magnitude
			Units_set: units = a_units
			Precision_set: precision = a_precision
		end

feature -- Access

	magnitude: REAL

	units: detachable STRING

	precision: INTEGER

feature -- Conversion

	magnitude_as_string: STRING
			-- The magnitude in its natural form.
		local
			formatter: FORMAT_DOUBLE
		do
			if precision = default_precision then
				Result := magnitude.out
			else
				create formatter.make (precision.max (50), precision)
				Result := formatter.formatted (magnitude.to_double)
			end
			if Result.item (Result.count) = '.' then
				Result.append_character ('0')
			end
			Result.left_adjust

			if attached units as att_units then
				Result.append (" " + att_units)
			end
		end

end


