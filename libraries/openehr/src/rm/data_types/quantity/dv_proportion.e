note
	component:   "openEHR ADL Tools"

	description: "[
	             Used to record pure ratios, such as titers, concentration ratios (e.g. Na:K) etc.
				 ]"
	keywords:    "ratio, quantity"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class DV_PROPORTION

inherit
	DV_AMOUNT
		redefine
			as_string
		end

	PROPORTION_KIND
		undefine
			is_equal
		end

create
	make, make_from_string, make_from_canonical_string

feature -- Initialization

	make(a_numerator, a_denominator: REAL)
			-- make from a numerator, denominator
		do
			numerator := a_numerator
			denominator := a_denominator
		end

	make_from_string(str:STRING)
		do
		end

	make_from_canonical_string(str:STRING)
		do
		end

feature -- Status Report

	valid_canonical_string(str: STRING): BOOLEAN
			-- True if str contains required tags
		do
		end

feature -- Access

	numerator: REAL
			-- numerator of ratio

	denominator: REAL
			-- denominator of ratio

	is_integral: BOOLEAN
			-- True if only integer values are allows in the numerator and denominator.

	type: INTEGER
			-- Indicates semantic type of proportion, including percent, unitary etc.

	magnitude: REAL_REF
			-- value of numerator/denominator
		do
			Result := numerator/denominator
		end

	diff_type: DV_PROPORTION
			-- type of difference for this quantity

	precision: INTEGER
			-- Precision to which the numerator and denominator values of the proportion
			-- are expressed, in terms of number of decimal places. The value 0 implies an integral quantity.
			-- The value -1 implies no limit, i.e. any number of decimal places.

feature -- Comparison

	is_strictly_comparable_to (other: DV_PROPORTION): BOOLEAN
			-- two ordinals can be compared if they come from the same series
		do
			Result := type = other.type
		end

feature -- Basic Operations

	plus alias "+" (diff_val: like diff_type): like Current
			-- addition
		do
		end

	minus alias "-" (other: like Current): like diff_type
			-- difference
		do
		end

feature -- Conversion

	as_string: STRING
		do
			Result := precursor
			Result.append(numerator.out)
			Result.append(denominator.out)
		end

	as_canonical_string: STRING
		do
			Result := "<numerator>" + numerator.out + "</numerator>" +
					"<denominator>" + denominator.out + "</denominator>"
		end

	magnitude_as_string: STRING
			-- output the magnitude in its natural form
		do
			-- FIXME: to be implemented
		end

invariant
	Type_validity: valid_proportion_kind(type)
	Is_integral_validity: is_integral implies (numerator.floor = numerator and denominator.floor = denominator)
	Fraction_validity: (type = pk_fraction or type = pk_integer_fraction) implies is_integral
	Unitary_validity: type = pk_unitary implies denominator = 1
	Percent_validity: type = pk_percent implies denominator = 100

end



