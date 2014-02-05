note
	component:   "openEHR ADL Tools"
	description: "[
				 Constrainer type for instances of DATE. If constrained by a pattern, the valid values are
				 based on an ISO8601-based pattern like yyyy-mm-XX. Valid values:
				 	yyyy-mm-dd - full date required
					yyyy-mm-?? - day optional
					yyyy-??-?? - any date ok
				 	yyyy-??-XX - day not allowed
				 	yyyy-XX-XX - month and day not allowed
				 ]"
	keywords:    "archetype, date"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_DATE

inherit
	C_TEMPORAL [ISO8601_DATE]
		redefine
			assumed_value
		end

create
	make, make_interval, make_value, make_value_list, make_string_interval, make_from_pattern, default_create

feature -- Access

	string_to_item (a_str: STRING): ISO8601_DATE
			-- convert `a_str' to an object of type ISO8601_DATE
		do
			Result := iso8601_string_to_date (a_str)
		end

    assumed_value: detachable ISO8601_DATE
            -- value to be assumed if none sent in data

feature -- Status Report

	valid_string (a_str: STRING): BOOLEAN
			-- True if `a_str' is a valid string form of the data item G
		do
			Result := valid_iso8601_date (a_str)
		end

	valid_pattern_constraint (a_pattern: STRING): BOOLEAN
		do
			Result := valid_iso8601_date_constraint_pattern (a_pattern)
		end

	valid_pattern_constraint_replacement (a_pattern, an_other_pattern: STRING): BOOLEAN
		do
			Result := valid_date_constraint_replacements.item (an_other_pattern.as_upper).has (a_pattern.as_upper)
		end

end


