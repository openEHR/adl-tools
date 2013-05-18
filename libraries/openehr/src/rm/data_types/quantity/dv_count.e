note
	component:   "openEHR ADL Tools"

	description: "[
			 Concrete type representing quantities with integral values.
			 ]"
	keywords:    "quantity, data"

	requirements:"ISO 18308 TS V1.0 STR 3.2 - 3.4"
	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class DV_COUNT

inherit
	DV_AMOUNT
		redefine
			as_string
		end

create
	default_create,
	make,
	make_from_string,
	make_from_canonical_string

feature -- Initialisation

	make(a_val: INTEGER)
			-- make from an integer count
		do
			magnitude := a_val
		end

	make_from_string(s: STRING)
			--
		do

		end

	make_from_canonical_string(s: STRING)
			--
		do

		end

feature -- Status Report

	valid_canonical_string(str: STRING): BOOLEAN
			-- True if str contains required tags
		do
		end

feature -- Access

	magnitude: INTEGER_REF
			-- numeric value of the quantity

feature -- Basic Operations

	plus alias "+" (other: like Current): like Current
		do
			create Result.make(magnitude + other.magnitude)
		end

	minus alias "-" (other: like Current): like Current
			-- subtraction
		do
			create Result.make(magnitude - other.magnitude)
		end

feature -- Comparison

	is_strictly_comparable_to (other: like Current): BOOLEAN
		do
		end

feature -- Output

	as_string: STRING
		do
			Result := precursor
		end

	as_canonical_string: STRING
		do
		end

	magnitude_as_string: STRING
			-- output the magnitude in its natural form
		do
			-- FIXME: to be implemented
		end

end


