note
	component:   "openEHR ADL Tools"
	description: "Constrainer type for instances of DATE_TIME"
	keywords:    "archetype, date, data"
	design:      "openEHR Common Archetype Model 0.2"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_DATE_TIME

inherit
	C_TEMPORAL [ISO8601_DATE_TIME]

create
	make_interval, make_list, make_list_simple, make_simple, make_string_interval, make_from_pattern, default_create

feature -- Access

	string_to_item (a_str: STRING): ISO8601_DATE_TIME
			-- convert `a_str' to an object of type ISO8601_DATE_TIME
		do
			Result := iso8601_string_to_date_time (a_str)
		end

feature -- Status Report

	valid_string (a_str: STRING): BOOLEAN
			-- True if `a_str' is a valid string form of the data item G
		do
			Result := valid_iso8601_date_time (a_str)
		end

	valid_pattern_constraint (a_pattern: STRING): BOOLEAN
		do
			Result := valid_iso8601_date_time_constraint_pattern (a_pattern)
		end

	valid_pattern_constraint_replacement (a_pattern, an_other_pattern: STRING): BOOLEAN
		do
			Result := valid_date_time_constraint_replacements.item (an_other_pattern.as_upper).has (a_pattern.as_upper)
		end

end


