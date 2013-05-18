note
	component:   "openEHR ADL Tools"

	description: "[
				 Defines a named range to be associated with any ORDERED datum. Each such 
				 range is particular to the patient and context, e.g. sex, age, and any 
				 other factor which affects ranges.
				 ]"
	keywords:    "Reference range for ordered data items"

	requirements:"ISO 18308 TS V1.0 STR 3.13"
	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class REFERENCE_RANGE [G -> DV_ORDERED]

create
	make

feature -- Initialization

	make (a_meaning: DV_TEXT; a_range: DV_INTERVAL [G])
			-- make a range from a meaning and an interval
		do
			meaning := a_meaning
			range := a_range
		ensure
			Meaning_set: meaning = a_meaning
			Range_set: range = a_range
		end

feature -- Access

	meaning: DV_TEXT
			-- Text or Term whose value indicates the meaning of this range, e.g. “normal”,
			-- “critical”, “therapeutic” etc.

	range: DV_INTERVAL [G]
			-- The data range for this meaning, e.g. “critical” etc.

feature -- Status Report

	has (v: G): BOOLEAN
		do
			Result := range.has(v)
		end

feature -- Conversion

	as_string: STRING
		do
			create Result.make_empty
			Result.append (range.as_string + " (" + meaning.as_string + ")")
		end

invariant
	Range_is_simple: (range.lower_unbounded or else range.lower.is_simple) and
						(range.upper_unbounded or else range.upper.is_simple)

end



