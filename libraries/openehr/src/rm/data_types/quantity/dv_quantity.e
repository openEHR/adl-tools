note
	component:   "openEHR ADL Tools"

	description: "[
			 Abstract type representing 'scientific' quantities, i.e. quantities expressed 
			 as a single value and a single, optional units.
			 ]"
	keywords:    "quantity, data"
	requirements:"ISO 18308 TS V1.0 STR 3.2 - 3.4"
	design:      "openEHR Data Types Reference Model 1.7"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	DV_QUANTITY

inherit
	DV_AMOUNT
		redefine
			default_create
		end

create
	make, make_from_string, default_create

feature -- Definitions

	default_units: STRING = "m"
			-- Metres.

	default_precision: INTEGER = -1
			-- No limit, i.e. any number of decimal places.

feature {NONE} -- Initialisation

	default_create
			-- Create a reasonable default object.
		do
			units := default_units.twin
			precision := default_precision
			create magnitude
		ensure then
			units_set_to_default: units.same_string (default_units)
			precision_set_to_default: precision = default_precision
		end

	make (a_magnitude: like magnitude; a_units: like units; n: like precision)
		require
			units_not_empty: not a_units.is_empty
			precision_valid: n >= 1
		do
			magnitude := a_magnitude
			-- set_units (a_units)
			units := a_units
			precision := n
		ensure
			magnitude_set: magnitude = a_magnitude
			units_set_else_unchanged: units.string.same_string (old units.string) or units.same_string (a_units)
			precision_set: precision = n
		end

	make_from_string (a_str: STRING)
		do
			default_create
		end

feature -- Status Report

	is_integral: BOOLEAN
			-- True if precision = 0.
		do
			Result := precision = 0
		end

feature -- Access

	magnitude: REAL_REF
			-- Numeric value of the quantity.

	units: STRING
			-- Stringified units, expressed in UCUM unit syntax, e.g. "kg/m^2", “mm[Hg]", "ms-1", "km/h".

	precision: INTEGER
			-- Precision  to  which  the  value  of  the  quantity  is expressed, in
			-- terms of number  of  significant  figures. 0 implies no precision.

feature -- Basic Operations

	plus alias "+" (other: attached like Current): attached like Current
			-- Addition.
		do
			create Result.make (magnitude + other.magnitude, units, precision)
		end

	minus alias "-" (other: attached like Current): attached like Current
			-- Subtraction.
		do
			create Result.make (magnitude - other.magnitude, units, precision)
		end

	negated alias "-": attached like Current
			-- Unary minus.
		do
			create Result.make (-magnitude, units.twin, precision)
		ensure
			minus_magnitude: (magnitude + Result.magnitude).abs < accuracy
			same_units: units.same_string (Result.units)
			same_precision: precision = Result.precision
		end

feature -- Modification

	set_units (a_units: STRING)
			-- Set units.
		require
			units_not_empty: not a_units.is_empty
	--	local
	--		parser: UNITS_PARSER
		do
	--		create parser.make
	--		parser.execute (a_units)

	--		if parser.units /= Void then
	--			units_impl := parser.units
	--			units := a_units
	--		end
		ensure
	--		units_set_else_unchanged: units.string.same_string (old units.string) or units.same_string (a_units)
		end

	set_precision (n: INTEGER)
			-- Set precision to `n' decimal places.
		require
			precision_valid: n >= 1
		do
			precision := n
		ensure
			precision_set: precision = n
		end

feature -- Comparison

	is_strictly_comparable_to (other: like Current): BOOLEAN
			-- two quantities are strictly comparable if they are measuring the same property
			-- Ideally, we would allow different units within the same property, but there is
			-- no converter currently implemented, so we also require that the units are identical
		do
			Result := units_equivalent (units, other.units)
		ensure then
			units_equivalent (units, other.units) implies Result
		end

feature -- Output

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

			Result.append (" " + units)
		end

feature {NONE} -- Implementation

	-- units_impl: UNITS

invariant
	precision_valid: precision >= -1
	units_valid: not units.is_empty

end


