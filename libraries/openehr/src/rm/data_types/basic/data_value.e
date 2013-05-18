note
	component:   "openEHR ADL Tools"
	description: "Abstract parent type of all concrete data value types"
	keywords:    "data"
	requirements:"ISO 18308 TS V1.0 STR 3.1 - 3.13"
	design:      "openEHR Data Types Reference Model 1.7"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class DATA_VALUE

inherit
	EXTERNAL_ENVIRONMENT_ACCESS
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

feature -- Initialization

	make_from_string (a_str: STRING)
		deferred
		end

feature -- Output

	as_string: STRING
			-- string form displayable for humans
		deferred
		end

end


