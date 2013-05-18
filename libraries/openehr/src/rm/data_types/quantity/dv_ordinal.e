note
	component:   "openEHR ADL Tools"

	description: "[
	             Models rankings and scores, e.g. pain, Apgar values, etc, where there
	             is a) implied ordering, b) no implication that the distance between 
	             each value is constant, and c) the total number of values is usually limited.
	             Examples: value sets {trace, +, ++, +++}, or {low, med, high}.
				 ]"
	keywords:    "ordinal, quantity"

	requirements:"ISO 18308 TS V1.0 STR 3.2"
	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class DV_ORDINAL

inherit
	DV_ORDERED

create
	make, make_from_string

feature -- Initialization

	make (a_value: INTEGER; a_symbol: DV_CODED_TEXT)
			-- make from a value/symbol pair
		do
			value := a_value
			symbol := a_symbol
		ensure
			Value_set: value = a_value
			Symbol_set: symbol = a_symbol
		end

	make_from_string (str: STRING)
		do
			create symbol.make ("unknown", create {CODE_PHRASE}.default_create)
		end

feature -- Access

	value: INTEGER
			-- ordinal value of this datum

	symbol: DV_CODED_TEXT
			-- symbolic representation of this value in the enumeration,
			-- which may be strings made from “+” symbols, or other enumerations
			-- of terms such as “mild”, “moderate”, “severe”.

feature -- Comparison

	is_strictly_comparable_to (other: DV_ORDINAL): BOOLEAN
			-- two ordinals can be compared if they come from the same series
		do
			Result := symbol.is_comparable(other.symbol)
		end

	is_less alias "<" (other: DV_ORDINAL): BOOLEAN
			-- Is current object less than `other'?
		do
			Result := value < other.value
		end

feature -- Conversion

	as_string: STRING
		do
			create Result.make(0)
			Result.append (symbol.as_string)
		end

invariant
	Value_validity: value > 0

end



