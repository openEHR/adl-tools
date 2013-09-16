note
	component:   "openEHR ADL Tools"

	description: "[
				 Generic class defining an interval (i.e. range) of a comparable type. 
				 An interval is a contiguous subrange of a comparable base type.
				 ]"
	keywords:    "intervals"
	requirements:"ISO 18308 TS V1.0 STR 3.5, 3.9"
	design:      "openEHR Data Types Reference Model 1.7"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class DV_INTERVAL [G -> DV_ORDERED]

inherit
	DATA_VALUE
		undefine
			default_create,
			is_equal,
			out
		end
	
	PROPER_INTERVAL [G]
		redefine
			as_string
		end

create
	default_create,
	make_bounded,
	make_lower_unbounded,
	make_upper_unbounded,
	make_from_string

feature -- Initialization

	make_from_string (str: STRING)
		do
		end

feature -- Conversion

	as_string: STRING
		do
			Result := lower.as_string + ".." + upper.as_string
		end

invariant

	Limits_consistent: (attached lower as l and attached upper as u) implies (l.is_strictly_comparable_to (u) and l <= u)

end



