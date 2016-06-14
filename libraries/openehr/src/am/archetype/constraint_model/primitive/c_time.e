note
	component:   "openEHR ADL Tools"
	description: "[
				 Constrainer type for instances of TIME. If constrained by a pattern, the valid values are
				 based on an ISO8601-based pattern like hh:mm:ss. Valid values:
				 	hh:mm:ss - full time required
					hh:mm:?? - second optional
					hh:??:?? - any hour ok
				 	hh:mm:XX - second not allowed
				 	yyyy-XX-XX - month and day not allowed
				 ]"
	keywords:    "archetype, time"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_TIME

inherit
	C_TEMPORAL [ISO8601_TIME]
		redefine
			assumed_value, enter_subtree, exit_subtree
		end

create
	make, make_interval, make_value, make_value_list, make_string_interval, make_from_pattern, default_create

feature -- Access

	string_to_item (a_str: STRING): ISO8601_TIME
			-- convert `a_str' to an object of type ISO8601_TIME
		do
			Result := iso8601_string_to_time (a_str)
		end

    assumed_value: detachable ISO8601_TIME
            -- value to be assumed if none sent in data

feature -- Status Report

	valid_string (a_str: STRING): BOOLEAN
			-- True if `a_str' is a valid string form of the data item G
		do
			Result := valid_iso8601_time (a_str)
		end

	valid_pattern_constraint (a_pattern: STRING): BOOLEAN
		do
			Result := valid_iso8601_time_constraint_pattern (a_pattern)
		end

	valid_pattern_constraint_replacement (a_pattern, an_other_pattern: STRING): BOOLEAN
		do
			Result := attached valid_time_constraint_replacements.item (an_other_pattern.as_upper) as att_rep and then att_rep.has (a_pattern.as_upper)
		end

feature -- Visitor

	enter_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at start of block for this node
		do
			precursor (visitor, depth)
			visitor.start_c_time (Current, depth)
		end

	exit_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at end of block for this node
		do
			precursor (visitor, depth)
			visitor.end_c_time (Current, depth)
		end

end


